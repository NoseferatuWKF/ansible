## Motivation

This is to instantly get over with onboarding with a new machine.
The idea is to not clone the repo. This repo is protected by secrets
that is intentionally obfuscated.

## Instructions

1. Ansible pull does not allow password prompts anymore, so need to create a password file
locally and pass (--vault-pass-file) to the command

2. Figure out which OS to setup (currently supports Pop!_OS, Arch, NixOS, and OSX). Then run
the playbook for that specific OS

3. To filter certain tasks, tags (-t) can be used. Check the /tasks directory for available tasks

```bash
# Example for setting up Arch
ansible-pull -U https://github.com/NoseferatuWKF/ansible.git --ask-become-pass --vault-pass-file /path/to/password-file -t 'arch, secrets, post' playbooks/arch.yml

# There is a handy Makefile for setting up Pop!_OS
make

# If there is a really need to clone the repo or don't want to pass a file for password
git clone https://github.com/NoseferatuWKF/ansible.git
ansible-playbook --ask-become-pass --ask-vault-pass -t <tags> /path/to/playbook.yml
```
