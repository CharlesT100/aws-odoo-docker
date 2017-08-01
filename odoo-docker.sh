#!/bin/bash
sudo su

yum update -y
yum install docker -y
yum install git -y
git clone https://github.com/odoo/docker
git clone https://github.com/docker-library/postgres 

#start docker daemon
service docker start
#start docker when system starts
chkconfig docker on

#start postgres container
cd ~/postgres/9.4
docker run --restart=always -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name db postgres:9.4

#start odoo container
cd ~/docker/10.0
docker run --restart=always -p 8069:8069 --name odoo --link db:db -t odoo
