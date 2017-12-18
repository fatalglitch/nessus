FROM ubuntu:xenial
MAINTAINER fatalglitch

EXPOSE 8834

RUN apt-get update && \
    apt-get install -y python-setuptools python-dev build-essential git && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/darvid/nessusbeat.git /opt/nessusbeat

RUN git clone https://github.com/tenable/nessrest.git /opt/nessrest

COPY Nessus-6.11.2-debian6_amd64.deb /tmp/
RUN  dpkg -i -y /tmp/Nessus-6.11.2-debian6_amd64.deb

ENTRYPOINT ["/opt/nessus/sbin/nessus-service"]
