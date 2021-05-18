#!/bin/sh
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y 
yum install ansible -y
dnf update -y && reboot
yum install -y yum-utils && yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo && yum install docker-ce docker-ce-cli containerd.io -y && systemctl start docker
	