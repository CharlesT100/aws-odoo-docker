#!/bin/bash

#careful
instance_count=1
instance_type="t2.micro"

#NOTE: Amazon Linux's AMI ID is per region. This works on Singapore. 
#Amazon Linux 2017.03.01
ami_image_id="ami-77af2014"

#change to match your keypair & SG
keypair_name="your-keypair-name"
security_group_name="your-sg-name"

echo "Starting a new EC2 instance for Odoo using Docker container..."
echo "Instance type : " $instance_type
#aws ec2 describe-images --image-ids ami-77af2014

aws ec2 run-instances --image-id $ami_image_id \
  --count $instance_count \
  --key-name $keypair_name  \
  --security-groups $security_group_name \
  --instance-type $instance_type \
   --block-device-mappings file://block-mapping.json --user-data file://odoo-docker.sh

#describe instance details
echo "aws ec2 describe-instances --instance-ids <instance_ids>"
echo "ssh -i <keypem-file> ec2-user@public-ip"

#elastic ip - get public IP & allocation ID
echo "Assign Elastic IP to you instance if needed"
echo " aws ec2 allocate-address --domain vpc"
echo " aws ec2 associate-address --instance-id <instance-id> --allocation-id <allocation-id>"
echo "Wait a few minutes and visit your Odoo instance at http://<public_ip>:8069"
