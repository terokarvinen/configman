class apache {

	package { 'apache2':
		ensure => 'installed',
		allowcdrom => 'true',
	}

	file { '/var/www/html/index.html':
		content => 'Hello',
		owner => '0',
		group   => '0',
		mode    => '0644',
		require => Package['apache2'],
	}

	file { '/etc/apache2/mods-enabled/userdir.conf':
		ensure => 'link',
		target => '../mods-available/userdir.conf',
		require => Package['apache2'],
		notify => Service['apache2'],
	}

	file { '/etc/apache2/mods-enabled/userdir.load':
		ensure => 'link',
		target => '../mods-available/userdir.load',
		require => Package['apache2'],
		notify => Service['apache2'],
	}

	service { 'apache2':
		ensure => 'running',
		enable => 'true',
		require => Package['apache2'],
	}

}
