Foo;
#CENTOS 6.4 LEMP + Symfony2
####Prereqs:
- Vagrant 1.3.5

- Virtualbox 4.3.2
 
- VBguest - 0.9.0<br>
	`vagrant plugin install vagrant-vbguest`<br>
	OR (for the pre-releaes)<br>
	`vagrant plugin install --plugin-source https://rubygems.org --plugin-prerelease vagrant-vbguest`
	
- Cachier 0.5.0<br>
	`vagrant plugin install vagrant-cachier`
	
- Cache the box <br>
	`vagrant box add CentOS-6.4-x86_64-v20131103 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.box`

- Add this to /etc/hosts

		192.168.56.101	stampede.dev www.stampede.dev
		192.168.56.101	opcache.dev www.opcache.dev
		192.168.56.101	gearman.dev www.gearman.dev
		192.168.56.101	redis.dev www.redis.dev

####Run `vagrant up`
- PHP-FPM 
- NGINX
- php 5.5+
- MySQL
- Gearman
- Redis extension
- Redis (service not starting ... wtf)
- Mongo Extension (Not Mongo)

###Connect to MySQL 
- MySQL Host Pass `root` <br>
- SSH Host Pass `vagrant` <br>
- Port can also be 2222

![image](https://photos-3.dropbox.com/t/0/AAB_2H_e_aRLOv3bW9xkDRdMxOtMtGD304hFi7EbRn2Z1g/12/42592441/png/1024x768/3/1384988400/0/2/Screenshot%202013-11-20%2013.05.23.png/RALYh3QG5bVbScqmyvcKuv6TL3Asu_y_Mt5e5ekvT9c)


###Tokens
`app/console ue:oauth-server:client:create --grant-type="http://`**URL**`/grants/api_key"`

*Added a new client with public id **<public_id>**, secret **Secret_id***

`http://`**URL**`/oauth/v2/token?client_id=`**<public_id>**`&client_secret=`**<Secret_id>**`&grant_type=http://`**URL**`/grants/api_key&api_key=`**<User_Api_key>**

*{"access_token":"* **<Access_token>** *","expires_in":3600,"token_type":"bearer","scope":"user","refresh_token":"***<refresh_token>** *"}*

`http://`**URL**`/api/tests?access_token=`**<Access_token>**

*API data*

###Code Quality (PHPCS, PHPCSFixer, PHPMD)
alias' provided 

`_phpcs` : Provides in *Stampede/vhosts/codequality/sniffer.txt 

`_phpcsfixer` : Provides in Stampede/vhosts/codequality/fixer_preview.txt (preview only)

`_phpmd` : Provides in Stampede/vhosts/codequality/md.txt 

`check` : Provides Above 3 commands in one. 

`phpfixer` : Provides in Stampede/vhosts/codequality/fixer_actual.txt **(WARNING: Will fix your code)** 