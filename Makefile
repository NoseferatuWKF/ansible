SHELL := /bin/bash

install:
	sudo apt update && \
	sudo apt install -y software-properties-common && \
	sudo add-apt-repository -yu ppa:ansible/ansible && \
	sudo apt install -y ansible && \
	sudo apt clean autoclean && \
	sudo apt autoremove

password:
	read -sp "Password: " password; \
	echo $$password > password

pull:
	ansible-pull -U https://github.com/NoseferatuWKF/ansible.git \
	--vault-pass-file password --ask-become-pass -t main playbooks/pop.yml && \
	rm password

ansible: install password pull

.PHONY: install password pull ansible
