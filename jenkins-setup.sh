# Jenkins installation on Linux
# =============================

#!/bin/bash
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo amazon-linux-extras install epel -y
sudo yum install java-11* -y
sudo yum install jenkins -y
sudo service jenkins enable
sudo service jenkins start 
sudo service jenkins status 
sudo yum install git -y


# Jenkins installation on Ubuntu
#===============================

#!/bin/bash
sudo apt update
sudo apt install maven git wget unzip -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install openjdk-11-jdk -y
sudo apt-get install jenkins -y
sudo service jenkins enable
sudo service jenkins start 
sudo service jenkins status
###

