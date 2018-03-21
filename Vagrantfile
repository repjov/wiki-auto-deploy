# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
# 
# requires plugins:
# 
# https://github.com/smdahlen/vagrant-hostmanager
# 
# 
# command to run
# 
# ansible-playbook fl.yml --inventory-file=.vagrant/provisioners/ansible/inventory --user=ubuntu --connection=ssh --private-key=.vagrant.d/insecure_private_key
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|  
  config.vm.box     = "bento/ubuntu-16.04"
  config.vm.hostname = "wiki"
  config.hostsupdater.aliases = ["wiki.dev"]

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
  end

  config.vm.network "private_network", ip: "10.0.0.88"
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.verbose = 'vvvv'
    ansible.ask_vault_pass = true
    ansible.inventory_path = "inventory"
    ansible.limit = 'all'
  end

  # config.ssh.insert_key = false
end
