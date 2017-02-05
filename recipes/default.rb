#
# Cookbook Name:: tmux
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node['platform_family']
when "rhel"
	include_recipe 'yum-epel::default'
end

package "tmux" do
	action :install
end

remote_file "/etc/tmux.conf" do
	owner "root"
	group "root"
	mode "0644"
	source "https://raw.githubusercontent.com/karuru6225/dotfiles/master/.tmux.conf"
end

file "/etc/profile.d/tmux.sh" do
	owner "root"
	group "root"
	mode "0644"
	content "alias ta='tmux has-session && tmux attach  || tmux ; exit'"
end
