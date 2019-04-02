```bash
./aws.sh

aws iam --region us-east-1 create-role --role-name ecsTaskExecutionRole --assume-role-policy-document file://`pwd`/task-execution-assume-role.json

aws iam --region us-east-1 attach-role-policy --role-name ecsTaskExecutionRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy

ecs-cli configure --cluster tutorial --region us-east-1 --default-launch-type FARGATE --config-name tutorial

ecs-cli configure profile --access-key $AWS_ACCESS_KEY_ID --secret-key $AWS_SECRET_ACCESS_KEY --profile-name tutorial

ecs-cli up

#VPC created: vpc-0cdb932a843eb3626
#Subnet created: subnet-05a010455d5363c15
#Subnet created: subnet-04aa053eb85f26741

aws ec2 create-security-group --group-name "tutorial-fargate-sg" --description "Tutorial Fargate" --vpc-id "vpc-0cdb932a843eb3626"

#"GroupId": "sg-0615b6ce9af48a195"

aws ec2 authorize-security-group-ingress --group-id "sg-0615b6ce9af48a195" --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id "sg-0615b6ce9af48a195" --protocol tcp --port 8080 --cidr 0.0.0.0/0

#--file 
ecs-cli compose --project-name tutorial service up --create-log-groups --cluster-config tutorial

#10ef8268-433e-411a-99e7-ba4a9428b19f

ecs-cli compose --project-name tutorial service ps --cluster-config tutorial

ecs-cli logs --task-id 10ef8268-433e-411a-99e7-ba4a9428b19f --follow --cluster-config tutorial

ecs-cli compose --project-name tutorial service scale 2 --cluster-config tutorial

ecs-cli compose --project-name tutorial service ps --cluster-config tutorial


ecs-cli compose --project-name tutorial service down --cluster-config tutorial
ecs-cli down --force --cluster-config tutorial

```