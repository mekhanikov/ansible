#!/bin/bash
set -x
echo "Installing Ansible..."
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

echo "Installing Vagrant..."
cd ansible
ansible-playbook -v playbook_vagrant.yml  -i localhost

# Note: Lxc is installed by playbook_vagrant.yml .