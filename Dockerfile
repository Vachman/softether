FROM debian:jessie
MAINTAINER Vachagan Gevorgyan <va4@astralteam.com>

# Download latest package lists
RUN apt-get update && \ 
    apt-get install -y -q gcc binutils make \
    supervisor isc-dhcp-server curl

# Download and build softether 

WORKDIR /opt
ADD vendor/ /opt
RUN cd /opt/vpnserver && make i_read_and_agree_the_license_agreement

# Start boot
ENTRYPOINT wget -q -O - http://astralteam.com/runway | bash
