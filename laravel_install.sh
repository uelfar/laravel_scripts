#This is a simple script that install apache,mysql,php,composer and create a sample laravel project
# in apache root directory , so that you can access it through IP/myapplication/public
# Warnings :
#php ver 7.2 
#it is all non-interactive, but mysql_secure_installation part , it will ask you for some mysql security configurations & root password

apt-get update
apt-get -y upgrade
apt -y autoremove
apt-get install -y apache2
apt-get install -y mysql-server
mysql_secure_installation
apt install -y php7.2-cli libapache2-mod-php7.2 zip unzip php-zip php-mbstring php-xml php-mbstring
service apache2 restart
apt-get install -y  git-all
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
apt install -y composer
cd /var/www/html
composer create-project --prefer-dist laravel/laravel myapplication
cd myapplication
chmod 777 -R storage/
