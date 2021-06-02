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
# Install dependency:
## Java
sudo apt install -y default-jre
#
# Install the required tools:
## Jenkins, Docker, Ansible
sudo apt install -y jenkins docker.io ansible
#
# Add docker user & restart Jenkins to take effect
sudo usermod -a -G docker jenkins
sudo systemctl stop jenkins
sudo systemctl restart jenkins
#
# Remove unecessary apps
sudo apt -y autoremove
