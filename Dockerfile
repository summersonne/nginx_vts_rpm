FROM centos:centos7

RUN yum clean all
RUN yum -y update

RUN yum -y install epel-release && yum clean all
RUN yum -y install rpm-build make zlib-devel openssl-devel curl-devel asciidoc gcc redhat-lsb-core shadow-utils systemd openssl-libs wget libmaxminddb-devel

RUN mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

ADD ./SPECS /root/rpmbuild/SPECS
ADD ./build-rpm.sh /build-rpm.sh

RUN wget http://nginx.org/packages/mainline/centos/7/SRPMS/nginx-1.17.8-1.el7.ngx.src.rpm -O /root/rpmbuild/SRPMS/nginx-1.17.8-1.el7.ngx.src.rpm
RUN wget https://github.com/vozlt/nginx-module-vts/archive/master.zip -O /root/rpmbuild/SOURCES/nginx-module-vts_master.zip
RUN rpm -Uvh /root/rpmbuild/SRPMS/nginx-1.17.8-1.el7.ngx.src.rpm
RUN chmod +x /build-rpm.sh


VOLUME ["/rpms"]

CMD ["/build-rpm.sh"]
