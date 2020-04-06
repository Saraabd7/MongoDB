#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
# package 'mongodb'

bash 'install_mongod' do
  user 'root'
  code <<-EOH
  wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
  echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
  sudo apt-get update
  sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
  sudo systemctl restart mongod
  sudo systemctl enable mongod.service
  EOH
end

# Arguabely less infrastructure agnostics (oposit of vendor lock-in) than chef syntax
# These terminal commands are specific to bash and a specific linux environment
  # apt-get --> Ubuntu
  # centos and widowns use othe rcommands to install stuff

# for testising:
# chef testing framework pickup chef syntax
# for example, this is NOT the same:

# sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
# VS
# package mongodb



execute 'restart_mongod' do
  command 'sudo systemctl restart mongod'
  action :nothing
end

execute 'restart_mongod.service' do
  command 'sudo systemctl enable mongod.service'
  action :nothing
end
