# vbox-chef
Vagrant setup for chef lab

Port forwards 80 => 8080 incase wanting to setup UI

Currently deploys 1 Chef server and enrolls 1 Chef node

Lab is meant to be used with Chef DK

Setup a host entry for:
chef.foobar.local 10.0.0.1

knife.rb is setup already so you can knife from the repo.

knife ssl fetch
knife ssl check
