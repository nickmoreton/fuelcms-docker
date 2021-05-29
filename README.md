# Fuel CMS docker

## Uses

* PHP: php:7.4-fpm-alpine
* NGINX: nginx:stable-alpine
* MYSQL: mysql:5.7
* PHP MY ADMIN: phpmyadmin

Each in it's own container

## Setup

Clone this repo
```
git clone https://github.com/nickmoreton/fuelcms-docker
```

Run

```
docker-compose up
```

Visit http://localhost:8000 and you will see the FuelCMS setup page

---

The initial setup has no CMS or database installed

# Database setup

Access the mysql container bash prompt
```
docker exec -it fuelcmsdocker_mysql_1 bash
```

Then run 
```
mysql -u fuel -p fuel < install/fuel_schema.sql
```
use the password from your mysql env file default: `secret`

# CMS setup
The default has the CMS configured in `./fuelcms/fuel/application/config/MY_fuel.php`
```
$config['admin_enabled'] = True;
$config['fuel_mode'] = 'auto';
```

Encryption Key is set here 
```
$config['encryption_key'] = 'change-me';
```

Sessions locaiton are set here
```
$config['sess_save_path'] = './sessions';
```

View the admin: `http://localhost:8000/fuel`

Username and password is `admin` you will be prompted to change the password

Image upload sizes are changed to accept larger size files:
```
// max width for asset images being uploaded
$config['assets_upload_max_width']  = 2000;

// max height for asset images being uploaded
$config['assets_upload_max_height']  = 2000;
```