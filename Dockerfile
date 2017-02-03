# This docker image is to update the dns records held in https://www.dynu.com with your dynamic IP
# BEFORE YOU RUN THIS IMAGE: unzip the configuration file in the files/config directory -password with fire
# To build: docker build -t generalmeow/mydyndns:<TAG> .
# To run: docker run -d --name dynu.dns -v <DIR OF CONFIG>:/etc/ddclient generalmeow/mydyndns:<TAG>
FROM ubuntu:16.04
RUN apt-get update && \
apt-get install libsys-hostname-long-perl -qy
RUN mkdir /etc/ddclient && \
mkdir /var/cache/ddclient
ADD ./files/ddclient-3.8.3/ddclient /usr/sbin
VOLUME /etc/ddclient
ENTRYPOINT ["ddclient", "-foreground", "-daemon", "600", "-debug", "-verbose", "-noquiet"]
