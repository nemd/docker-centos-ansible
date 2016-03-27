FROM centos:latest

MAINTAINER michal@reaper.pl

RUN yum -y install epel-release && \
	yum -y update && \
	yum install -y python-pip gcc python-devel

RUN mkdir /etc/ansible/
RUN echo -e '[local]\nlocalhost' > /etc/ansible/hosts
RUN pip install ansible

RUN yum erase -y cpp glibc-devel glibc-headers kernel-headers libgomp libmpc mpfr python-devel && \
	yum clean all
