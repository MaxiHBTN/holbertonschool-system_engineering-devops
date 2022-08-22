# Just as in task #0, we’d like you to automate the task of creating a custom HTTP header response, but with Puppet.

package { 'haproxy':
}
 
file_line { 'HTTP header':
  ensure   => present,
  path     => '/etc/nginx/sites-available/default',
  after    => 'server_name _;',
  line     => 'add_header X-Served-By '$HOSTNAME';',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
