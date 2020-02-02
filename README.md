Credit to: https://github.com/mkrakowitzer/docker-nginx-rpm
I've taken what mkrakowitzer did and changed it suit my needs. It might also suit yours.

##
# docker-nginx-rpm build

A repository to build custom nginx RPMS with dynamic VTS, GEOIP2 and substitutions\_filter modules

Builds nginx with 

* Nginx virtual host traffic status module(https://github.com/vozlt/nginx-module-vts)

## Build Docker container

```
$ git clone https://github.com/mkrakowitzer/docker-nginx-rpm.git
$ cd docker-nginx-rpm
$ docker build -t nginx_rpm .
```

## Build RPMs

Note: This builds the RPMS using the current master branch of each module

```
$ docker run -v /rpms:/rpms  nginx_rpm:latest
$ ls /rpms/RPMS/x86_64/                                                                  
nginx-1.17.8-1.el7_4.ngx.x86_64.rpm
nginx-debuginfo-1.17.8-1.el7_4.ngx.x86_64.rpm
nginx-module-vts-1.17.8-1.el7_4.ngx.x86_64.rpm
```
