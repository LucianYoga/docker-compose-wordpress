<?php

define('DB_NAME',     getenv('MYSQL_DATABASE'));
define('DB_USER',     getenv('MYSQL_USER'));
define('DB_PASSWORD', getenv('MYSQL_PASSWORD'));
define('DB_HOST', 'mysql');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         getenv('WP_SALT'));
define('SECURE_AUTH_KEY',  getenv('WP_SALT'));
define('LOGGED_IN_KEY',	   getenv('WP_SALT'));
define('NONCE_KEY',	   getenv('WP_SALT'));
define('AUTH_SALT',	   getenv('WP_SALT'));
define('SECURE_AUTH_SALT', getenv('WP_SALT'));
define('LOGGED_IN_SALT',   getenv('WP_SALT'));
define('NONCE_SALT',	   getenv('WP_SALT'));

$table_prefix  = 'wp_';
define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');

define('FS_METHOD','direct');
