#!/bin/bash

rpmbuild -ba ~/rpmbuild/SPECS/nginx.spec
rpmbuild -D 'debug_package %{nil}' -ba ~/rpmbuild/SPECS/nginx-module-vts.spec

cp -r ~/rpmbuild/SRPMS /rpms
cp -r ~/rpmbuild/RPMS /rpms
