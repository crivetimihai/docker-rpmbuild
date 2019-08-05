#/usr/bin/env bash

create_rpmtree() {
  sudo chown -R builder: ~/rpmbuild
  rpmdev-setuptree
}

build_rpm() {
  REPO=$1

  # Clone git repo
  git clone $REPO ~/repo
  cp ~/repo/*.spec ~/rpmbuild/SPECS
  cp ~/repo/* ~/rpmbuild/SOURCES
  rm -rf ~/repo

  # Install deps
  sudo yum-builddep -y ~/rpmbuild/SPECS/*.spec

  # Download sources
  spectool -g -R ~/rpmbuild/SPECS/*.spec

  # Build
  rpmbuild -bb ~/rpmbuild/SPECS/*.spec

  # Cleanup
  rm ~/rpmbuild/SPECS/*
}

create_rpmtree
build_rpm ${REPO}
