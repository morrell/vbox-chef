# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.synced_folder "./", "/tmp/host"

	config.vm.define "chef" do |chef|
		chef.vm.box = "ubuntu/xenial64"
		chef.vm.hostname = "chef.foobar.local"
		chef.vm.network "private_network", ip: "10.0.0.10"
		chef.vm.network "forwarded_port", guest: 80, host: 8080
		chef.vm.network "forwarded_port", guest: 443, host: 443
		chef.vm.provider "virtualbox" do |vb|
     			vb.memory = "4096"
		end
		chef.vm.provision "shell", path: "sh/chef-setup.sh"
		chef.vm.provision "shell", path: "sh/chef-export_pem.sh"
	end

	config.vm.define "node01" do |node|
		node.vm.box = "ubuntu/xenial64"
		node.vm.hostname = "node01.foobar.local"
		node.vm.network "private_network", ip: "10.0.0.101"
		node.vm.network "forwarded_port", guest: 80, host: 8880
		node.vm.provider "virtualbox" do |vb|
			vb.memory = "1024"
		end
		node.vm.provision "shell", path: "sh/node-dns.sh"
		node.vm.provision "chef_client" do |chef|

    			chef.chef_server_url = "https://chef.foobar.local/organizations/foobar"

    			chef.validation_key_path = ".chef/foobar-validator.pem"
			chef.validation_client_name = "foobar-validator"
			chef.node_name = "node01"
  		end
	end
end

