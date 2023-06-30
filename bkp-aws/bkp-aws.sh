#!/bin/bash

PATH_BKP=/home/carlos/bkp-aws
cd $PATH_BKP

date=$(date +%F)
if [ ! -d $date ]
then
	mkdir $date
fi

tables=$(mysql -u root mutillidae -e "show tables;" | grep -v Tables)
for table in $tables
do
	mysqldump -u root mutillidae $table > $PATH_BKP/$date/$table.sql
done

aws s3 sync $PATH_BKP s3://carlos-bucket-teste
