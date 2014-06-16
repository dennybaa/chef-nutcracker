#
# Cookbook Name:: nutcracker
# Recipe:: default
#
# Copyright 2013, Denis Baryshev
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#

require 'yaml'
package node['nutcracker']['package']

file node['nutcracker']['config_path'] do
  owner 'root'
  group 'root'
  mode  00644
  content(lazy do
    data = JSON.parse(node['nutcracker']['config'].to_json)
    YAML::dump(data).sub(/.*\n/, '') # strip yaml start token
  end)
  notifies :restart, 'service[nutcracker]'
end

if node['platform_family'] == 'debian'
  template '/etc/default/nutcracker' do
    source 'default_nutcracker.erb'
    owner  'root'
    group  'root'
    mode   00644
    notifies :restart, 'service[nutcracker]'
  end
end

service 'nutcracker' do
  action [ :enable, :start ]
end