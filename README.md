# DigitalOcean Passbolt
## Description
This repository holds the necessary code to initialize a Passbolt instance in digital ocean. **I take no responsibility for any costs associated with this code. You will be billed for usage of digital ocean cloud.**
## Setup
### Update Some Values
There are two things that need to be checked before running.
1. Ensure that the ssh_keys value is your own ssh_key id from Digital Ocean.
2. After applying the terraform ensure you update the inventory with the IP address given.
3. Create your own username/fname/password in the `ansible/group_vars/passbolt.yml` file.
### Create Passbolt Server
```
cd terraform
terraform init 
terraform apply
cd ..
```
### Setup Passbolt
```
cd ansible
ansible-playbook -i ansible_hosts playbooks/passbolt.yml --ask-vault-pass
```
## Cleanup
You will need to destroy the environment to stop being billed for the infrastructure. Run the following from the respository:
```
cd terraform
terraform destroy
```
This will clean up all objects created in digital ocean.
## Automation
This process is automated in the makefile.
### Build Droplet and Install Passbolt
`make build`
### Delete Droplet and Other Infrastructure
`make destroy`