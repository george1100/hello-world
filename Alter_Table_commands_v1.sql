/*

Scripts to add or drop columns

  Created by: George Gu
  Created on: 03/08/2016

*/

USE sws_datamart1;

ALTER TABLE fact_compliance 
  ADD COLUMN IF NOT EXISTS testcolumn1 int,
  ADD COLUMN IF NOT EXISTS testcolumn2 varchar(20);

ALTER TABLE table_name 
       DROP COLUMN IF EXISTS testcolumn1,
       DROP COLUMN IF EXISTS testcolumn2;
     


