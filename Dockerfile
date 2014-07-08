# VERSION 0.0
FROM ubuntu:14.04
MAINTAINER Olivier Dossmann, <olivier+dockerfile@dossmann.net>

# To avoid problems with Dialog and curses wizards
ENV DEBIAN_FRONTEND noninteractive

# Update list of packages
RUN apt-get update
# Install needed packages
RUN apt-get install -y nodejs npm mongodb supervisor git

# Configure mongodb so that it works
RUN mkdir -p /data/db

# Configure supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Fetch github repository
RUN cd /opt && \
  git clone --depth 1 http://github.com/rk4an/wall-e.git

# Configure the application
RUN cd /opt/wall-e && \
  npm install

# Let some ports to be accessible if user add -p option to docker run
EXPOSE 8081

# Launch supervisord at the beginning
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
