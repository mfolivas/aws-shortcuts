===ECS deregister ECS===
https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-anywhere-deregistration.html

sudo systemctl stop ecs amazon-ssm-agent
sudo yum remove -y amazon-ecs-init amazon-ssm-agent
sudo rm -rf /var/lib/ecs /etc/ecs /var/lib/amazon/ssm /var/log/ecs /var/log/amazon/ssm

