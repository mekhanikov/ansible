#!/bin/bash
cd lxc3
vagrant destroy -f
BOX_NAME=$1 vagrant up --provider=lxc
cd ../ansible
ansible-playbook playbook.yml -v -i lxc3
