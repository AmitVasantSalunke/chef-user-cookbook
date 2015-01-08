#
# Cookbook Name:: user_mg
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.



foobar = data_bag_item("user_mg", "user")
Chef::Log.info "-" * 100
foo = foobar.to_hash
foos = foo["ssh_keys"]
Chef::Log.info(foos)

user "user" do
  supports :manage_home => true
  comment "User name"
  home "/home/user"
  shell "/bin/bash"
 end

directory "/home/user/.ssh/" do
  owner 'user'
  group 'user'
  mode  '0700'	
  action :create
end

file "/home/user/.ssh/authorized_keys" do 
  content foos[0]
  owner 'user'
  group 'user'	
  action :create
end

	