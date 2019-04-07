SHELL = /bin/sh
export PATH := $(PATH):.

install:
	./bootstrap.sh

test:
	./local_provision_lxc.sh "capensis/ubuntu18.04.x86_64"

clean:
	./local_destroy_lxc.sh

cleanall: clean
	sudo apt-get purge mysql*
	sudo apt-get autoremove
	sudo apt-get autoclean
