FROM resin/rpi-raspbian
RUN echo "deb http://raspbian.raspberrypi.org/raspbian/ buster main contrib non-free rpi" > /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get remove '^php.*'
RUN apt-get install apache2 -y
RUN apt-get install php7.1 -y
RUN apt-get install php7.1-mbstring php7.1-dom git php7.1-bcmath php7.1-mysql -y
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
ADD ./run.sh /run.sh
RUN chmod 755 /*.sh
CMD ["/run.sh"]