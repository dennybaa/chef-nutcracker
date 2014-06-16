default['nutcracker']['config'] = {}
default['nutcracker']['max_fds'] = 1_024
default['nutcracker']['stats_port'] = 22222
default['nutcracker']['stats_interval'] = 30000

case node['platform']
when 'debian', 'ubuntu'
  default['nutcracker']['package'] = 'nutcracker'
  default['nutcracker']['config_path'] = '/etc/nutcracker.conf'
else
  default['nutcracker']['config_path'] = '/etc/nutcracker.conf'  
  default['nutcracker']['package'] = 'nutcracker'
end