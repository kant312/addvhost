#! /bin/bash

#This script will add a new vhost in Apache2 config and hostname in /etc/host

#############
# Variables #
#############

#Points to the folder holding your available sites
vhost_folder="/etc/apache2/sites-available"
#This is the template that will be used to generate the new vhost
vhost_template="/home/kant/Templates/newsroom.vhost"

#Ask for the new domain name
echo "What is the domain name?"
read host

#Ask for the new repository
echo "What is the repository?"
read repo

#Generate the new vhost config gile
sed 's/{{repo}}/'"$repo"'/g;s/{{host}}/'"$host"'/g' "$vhost_template" > "$vhost_folder/$host"
echo -e "127.0.0.1\t$host" >> /etc/hosts

#Enable the new site
a2ensite "$host"
