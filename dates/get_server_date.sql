USE LIVE_OBC_BackOffice;
SELECT CONCAT('#!/bin/bash') AS '' FROM Stock LIMIT 1;
SELECT 'date' AS '' FROM Stock LIMIT 1;
SELECT CONCAT('sudo date --set ',LEFT(CONCAT('',NOW(),''),10)) AS '' FROM Stock LIMIT 1;
SELECT CONCAT('sudo date +%T -s "',RIGHT(CONCAT('',NOW(),''),8),'"') AS '' FROM Stock LIMIT 1;
SELECT 'date' AS '' FROM Stock LIMIT 1;

