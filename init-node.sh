#!/bin/bash
# Automating few activities to test on multiple servers
#
# Update to latest versions
sudo apt -y update
sudo apt -y upgrade
#
# Dependency - Install Java
sudo apt install -y default-jre
#
# Remove unecessary apps
sudo apt -y autoremove
