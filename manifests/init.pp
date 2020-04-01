class lame {
	$tmpdir='/tmp/lame_inst'
	file {$tmpdir:
		ensure=>directory
	} ->
	file {"$tmpdir/lame.tar.gz":
		ensure	=> file,
		source	=> 'puppet:///modules/lame/lame-3.99.5.tar.gz',
	} ->
	exec {'install_lame':
		command	=> 'tar -zxvf ./lame.tar.gz && cd lame-3.99.5 && ./configure --prefix=/usr && make && make install',
		cwd		=> $tmpdir,
		unless	=> 'which lame',
		path	=> '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin',
		#require => Package['kernel-devel'],
	}
}

