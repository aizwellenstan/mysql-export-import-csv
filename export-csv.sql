SELECT *
FROM stories
INTO OUTFILE '/var/lib/mysql-files/linetoday-stories.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
