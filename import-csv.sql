CREATE TEMPORARY TABLE temp_table LIKE stories;

LOAD DATA LOCAL INFILE  '/home/satou/linetoday/stories-2022-01-05-adjusted.csv'
INTO TABLE temp_table
CHARACTER SET UTF8
FIELDS TERMINATED BY ',' 
(id, anvato_id, project_id, story_name_anvato, story_name_en, story_name_line, line_url, line_category, publish_datetime, line_views, line_likes, line_comments, line_promote_main, line_promote_sub, push_notify, last_update);


UPDATE stories
INNER JOIN temp_table on temp_table.id = stories.id
SET stories.publish_datetime = temp_table.publish_datetime;

DROP TEMPORARY TABLE temp_table;
