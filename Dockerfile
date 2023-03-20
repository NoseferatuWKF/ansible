FROM ubuntu:jammy AS based
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \ 
 	apt-get upgrade -y && \
 	apt-get install -y software-properties-common build-essential && \ 
 	apt-add-repository -y ppa:ansible/ansible && \ 
 	apt-get update && \ 
 	apt-get install -y git curl stow ansible vim && \
 	apt-get clean autoclean && \
 	apt-get autoremove -y

FROM based
ARG OPTS
WORKDIR /root/ansible
COPY . .
