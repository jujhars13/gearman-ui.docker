FROM php:7.0.0-apache

MAINTAINER Jujhar Singh, jujhar@jujhar.com

# Enable apache rewrite module
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/

#Jujhar - No longer install from github - included with project
## Install Composer
#RUN mkdir -p /usr/local/bin && php -r "readfile('https://getcomposer.org/installer');" | php \
#    && mv composer.phar /usr/local/bin/composer

# Copy PHP configuration file
COPY build/php.ini /usr/local/etc/php/

#Jujhar - No longer install from github - included with project
## Install utils
#RUN apt-get update && apt-get install -y unzip curl git

#Jujhar - No longer install from github - included with project as it's github API rate limiting breaks certain projects
## Install Gearman UI from source on github
#RUN curl -L https://github.com/gaspaio/gearmanui/archive/master.zip -o /tmp/gearmanui.zip \
#	&& unzip -uo /tmp/gearmanui.zip -d /tmp/gearmanui \
#	&& mv /tmp/gearmanui/gearmanui-master /gearmanui \
#	&& rm -Rf /tmp/gearmanui.zip /tmp/gearmanui \

RUN rm -Rf /var/www/html && \
    ln -s /gearmanui/web /var/www/html

# Copy default Gearman UI configuration file
COPY build/gearmanui.yml /gearmanui/

# Install Gearman UI PHP Dependencies with Composer
WORKDIR /gearmanui
#Jujhar - No longer install from github - included with project as it's github API rate limiting breaks certain projects
##RUN composer install

