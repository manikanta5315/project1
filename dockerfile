FROM ubuntu
RUN apt-get update
RUN apt-get install apache2 -y apache2-utils
RUN apt-get clean
WORKDIR /var/www/html
COPY index.html /var/www/html/
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80