#/usr/bin/env bash

create_rpmtree() {
    sudo chown -R builder: ~/rpmbuild
    rpmdev-setuptree
}

build_rpm() {
    REPO=$1
    SPEC=$2

    # Clone git repo
    git clone $REPO ~/repo
    cp ~/repo/*.spec ~/rpmbuild/SPECS
    cp ~/repo/* ~/rpmbuild/SOURCES
    rm -rf ~/repo

    # Install deps
    sudo yum-builddep -y ${SPEC}

    # Download sources
    spectool -g -R ${SPEC}

    # Build
    rpmbuild -bb ${SPEC}
}

create_rpmtree
build_rpm ${REPO} ${SPEC}
