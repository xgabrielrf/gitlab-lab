#!/bin/bash
echo "Installing default packages..."
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates tzdata perl net-tools
echo "Installing postfix..."
sudo apt-get install -y postfix
echo "Installing gitlab..."
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get update
sudo apt-get install gitlab-ce
sudo export EXTERNAL_URL=http://$(hostname)
sudo gitlab-ctl reconfigure
sudo cat /etc/gitlab/initial_root_password