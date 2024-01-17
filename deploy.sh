#!/bin/sh
# deploy generated html files to web
set -x

prod_dir='/home/mikcyons/www/kissel.ch/ict/'
test_dir='/var/www/ict/'

test() {
  if [ ! -d $test_dir ];
  then
  mkdir -p $test_dir
  fi

  echo "Deployment to test."
  rm -rf $test_dir/*
  cp -r web/* $test_dir
}

prod() {
  if [ ! -d prod_dir ];
  then
  mkdir -p prod_dir
  fi

  echo "PRODUCTION Deployment."
  rm -rf prod_dir/*
  cp -r web/* prod_dir
}

case "$1" in
        test)
                test
                ;;
        prod)
                prod
                ;;
        *)
                echo "Please use option $0 {test|prod}"
esac
