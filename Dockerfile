FROM library/debian:stretch
MAINTAINER cta@gmail.com
COPY index.html /tmp/index.html
RUN apt-get update && \
    apt-get install -y --force-yes apache2 && \
    cp /tmp/index.html /var/www/html/. && \
    ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]

