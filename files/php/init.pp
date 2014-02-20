file { "/vagrant/Symfony/bin/php-cs-fixer":
    owner => "vagrant",
    mode  => 777,
    source => '/vagrant/files/php/php-cs-fixer.phar'
}
