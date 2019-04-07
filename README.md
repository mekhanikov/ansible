# Overview

The project is the Ansible script for fully automated deployment of the development infrastructure.

It deploys:

- Jenkins with all required jobs.
- SonarQube (not implemented yet).
- MySQL with all required schemas (prd, stg and so on).

All services have fully configured access for developers.

## System Requirements

- Operating System: Debian-based Linux: Known to work on Ubuntu 18.04 LTS .
- Storage Space: Requires some storage free space on the o/s: On Linux, requires about 13 gb including the o/s.  So, if running this on a VM, you will need to make sure that the persistent storage on the VM is at least 13 gb in size.
- RAM: Requires about 6 GB of RAM.  So, if running on a VM, make sure it has that amount of RAM available.

## Usage

First, see "[System Requirements](#system-requirements)", above, and ensure that your virtual machine or other machine meets those requirements.

To install all required software:

## Install

```bash
make install
```

The above command installs Ansible, Vagrant, and lxc.  Vagrant creates an lxc container, which Ansible uses as a test bed (a clean o/s instance for testing the Ansible script).  Stated another way, lxc is needed to be able test Ansible scripts locally inside an LXC container.

## Set-Up on Specific Environments

To deploy environment on server, please create `ansible/prod/inventory` file (similar to ansible/lxc3/inventory)
but with server ssh-user user/password and url.

CAUTION: !!! THE SCRIPT WILL OVERWRITE ALL GITLAB REPOSITORIES WITH BACKUP, SO RECENT CHANGES MAY BE LOST

## Run

After installation (above), you can run scripts (in the case shown below, to set up the system on the prod environment):

```bash
cd ansible
sudo ansible-playbook playbook.yml -v -i prod
```

## Test

It is useful to test the Ansible script against some fresh machine with preinstalled particular Linux version.

One way to do this is to use an LXC container as it allows one to create a very fast fresh instance of the required Linux distribution.

So one needs to install vagrant and lxc on developer's machine:

## Test Setup

Warning: This will remove your mysql installation completely.

```bash
make cleanall
```

## Run Test

To create container and run Ansible scripts against it, please go to root of the project
 (here should be local_provision_lxc.sh) and execute, if you are on Ubuntu 18.04 LTS:

```bash
make test
```

### Re-Run Test

```bash
make clean
```

Then do the commands under the "[Run Test](#run-test)" section above.
