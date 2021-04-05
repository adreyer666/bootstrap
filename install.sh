#!/bin/sh -f

#dnf upgrade -y
dnf install -y \
    procps iproute iptables nftables \
    curl ca-certificates sudo \
    vim-minimal openssh-clients gnupg2 \
    git

CRUDVER="0.9.3"
CRUDDIST="1.el8"
dnf install -y https://cbs.centos.org/kojifiles/packages/crudini/${CRUDVER}/${CRUDDIST}/noarch/crudini-${CRUDVER}-${CRUDDIST}.noarch.rpm

VERSION="2.2.15"   ### see https://www.vagrantup.com/downloads
dnf install -y https://releases.hashicorp.com/vagrant/${VERSION}/vagrant_${VERSION}_x86_64.rpm

# cleanup
dnf clean all

