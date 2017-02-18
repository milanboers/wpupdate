#!/bin/bash
wget https://wordpress.org/latest.zip -P /tmp

# clean up old one first
rm -Rf /tmp/wordpress

unzip /tmp/latest.zip -d /tmp
rm /tmp/latest.zip

touch $1/.maintenance

rm -R $1/wp-{includes,admin}
cp -R /tmp/wordpress/wp-{includes,admin,content} $1
cp -R /tmp/wordpress/*.php $1

rm $1/.maintenance

rm -R /tmp/wordpress
