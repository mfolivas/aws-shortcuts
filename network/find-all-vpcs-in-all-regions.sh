#!/bin/bash
Profile='default'
aws ec2 describe-regions \
    --all-regions \
    --query "Regions[].{Name:RegionName}" \
    --output text > regions.txt
while read f1 f2
      do 
      Region=$f1
      Region_Name=$f2
      echo "$Region - $Region_Name \n" >> /tmp/vpc-details.csv
      aws ec2 describe-vpcs --profile $Profile --region $Region --output text --query 'Vpcs[].[Tags[?Key==`Name`].Value | [0],CidrBlock,VpcId,IsDefault]' --filter Name=isDefault,Values=false >> vpc-details.csv
      echo "\n" >> vpc-details.csv  
done < regions.txt
