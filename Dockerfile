FROM centos
COPY lab-1.sh .
RUN yum install -y glibc-langpack-en
