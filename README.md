# Odoo on AWS using Docker
Run Odoo on a new AWS EC2 instance using CLI and Docker. <br>
Expected time: 5 minutes

Assumption:
- Using Amazon Linux AMI 2017.07.1
- Default region: Singapore. Please update the AMI ID and its snapshot ID if using other region or AMI.

You will need an IAM account with permission to create EC2 instance. Then prepare a keypair & security group in advance.<br>
1. aws configure <br>
2. Main script: run-ec2-instance-odoo-docker.sh <br>
>- Configure your AMI ID, instance type, security group & keypair name. Default is a new t2.micro instance
>- Configure block storage ID & size in block-mapping.json. Default is 10 GB
>- Run the script. You can also allocate an Elastic IP for the server if needed.
>- Visit Odoo via http://<public_ip>:8069 after 5 minutes or less, depending on instance size and the amount of updates
