# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

Vagrant.configure("2") do |config|
  #config.vm.define :box, primary: true do |box|
  #    box.vm.box = 'centos/8'
  #    box.vm.network :public_network, ip: '192.168.1.162'
  #end

  config.vm.box = "centos/8"
  config.vm.hostname = "bootstrap"
  config.vm.network :private_network, :ip => "192.168.124.12"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  # config.vm.synced_folder "../data", "/home/vagrant/data", type: "nfs"
  # config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"

  config.vm.provider :libvirt do |libvirt|
    libvirt.uri = "qemu+ssh://virtual@192.168.1.10/system"
    libvirt.channel :type => 'unix', :target_name => 'org.qemu.guest_agent.0', :target_type => 'virtio'
    libvirt.channel :type => 'spicevmc', :target_name => 'com.redhat.spice.0', :target_type => 'virtio'

    ## vm details
    libvirt.driver = 'kvm'
    libvirt.memory = 2048
    libvirt.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    /vagrant/install.sh
  SHELL
end
