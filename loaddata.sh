#!/bin/bash

# Loads test data for Print Archive

echo Dropping the database. Type \'dbarchive\' to confirm:
read CONF
if [ $CONF == 'dbarchive' ]; then
  echo Downloading database dump...
  wget https://dl.dropboxusercontent.com/u/5793683/archive_data_dump.json.zip
  mv archive_data_dump.json.zip ./archive/fixtures/archive_data_dump.json.zip
  echo Dropping database...
  python manage.py flush
  echo Loading database...
  python manage.py loaddata archive_data_dump
  echo Cleaning up...
  rm ./archive/fixtures/archive_data_dump.json
fi
  exit
