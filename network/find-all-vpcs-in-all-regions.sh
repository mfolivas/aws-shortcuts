#!/bin/bash

Profile='default'
VPC_DETAILS_FILE='/tmp/vpc-details.csv'
aws ec2 describe-regions \
    --profile $Profile \
    --all-regions \
    --query "Regions[].{Name:RegionName}" \
    --output text > /tmp/regions.txt
while read f1
      do 
      Region=$f1
      echo "$Region\n" >> $VPC_DETAILS_FILE
      aws ec2 describe-vpcs --profile $Profile --region $Region --output text --query 'Vpcs[].[Tags[?Key==`Name`].Value | [0],CidrBlock,VpcId,IsDefault]' >> $VPC_DETAILS_FILE
      echo "\n" >> $VPC_DETAILS_FILE  
done < /tmp/regions.txt``