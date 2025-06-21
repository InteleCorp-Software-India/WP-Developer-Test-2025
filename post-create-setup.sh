#!/bin/bash

# Wait for MySQL to come up
echo "Waiting for DB to initialize..."
sleep 15

# Download WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Install WordPress CLI-style
cd /var/www/html
wp core download --allow-root
wp config create --dbname=wpdatabase --dbuser=wpuser --dbpass=wppassword --dbhost=db --allow-root
wp db create --allow-root || echo "DB likely already exists, skipping create."
wp core install --url="http://localhost" --title="DevTest" --admin_user="admin" --admin_password="admin" --admin_email="admin@example.com" --skip-email --allow-root

# Activate the student plugin
wp plugin activate wptask --allow-root

echo "✅ WordPress is ready at http://localhost"
