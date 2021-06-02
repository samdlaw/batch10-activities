#!/bin/bash
# Automating few activities to test on multiple servers
#
# Add Jenkins repo
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
#
# Update to latest versions
sudo apt -y update
sudo apt -y upgrade
#
# Install Dependencies
## Java
sudo apt -y install default-jre
#
# Install Softwares
## Jenkins
## Docker
## Ansible
sudo apt -y install jenkins docker.io ansible
#
# Add docker user & restart Jenkins to take effect
sudo usermod -a -G docker jenkins
sudo systemctl stop jenkins
sudo systemctl restart jenkins
#
# Remove unecessary apps
sudo apt -y autoremove
