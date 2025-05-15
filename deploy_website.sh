#!/bin/bash
if [ "$1" = "" ]
then
    echo "> No deployment!"
    echo "> Choose test, int, prod"
elif [ "$1" = "test" ]
then
  echo "deployment on test environment!!"
elif [ "$1" = "prod" ]
then
  echo "deployment on prod environment!!"
  sleep 3
  echo "build website data"
  mkdocs build --clean
  echo "transfer data to prod"
  rsync -avz --delete site/ USER@kissel.ch:/home/mikcyons/www/kissel.ch/wiki/
else
  echo ""
fi

echo ""
echo "end of script"
