* Encoding: UTF-8.

GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

FILTER OFF.
USE ALL.
EXECUTE.
_SLINE OFF.

FILTER OFF.
USE ALL.
SELECT IF (CHARACTERISTIC_NAME="Population, 2021").
EXECUTE.

SAVE OUTFILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2021.sav'
  /COMPRESSED.

GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2021.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.







GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

FILTER OFF.
USE ALL.
EXECUTE.
_SLINE OFF.

FILTER OFF.
USE ALL.
SELECT IF (CHARACTERISTIC_NAME="Population, 2016").
EXECUTE.

SAVE OUTFILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2016.sav'
  /COMPRESSED.

GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2016.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.







GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2016.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

COMPUTE C1_COUNT_2016=C1_COUNT_TOTAL.
EXECUTE.

FORMAT C1_COUNT_2016 (COMMA15.0) .

SAVE OUTFILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2016-01.sav'
  /KEEP = ALT_GEO_CODE GEO_NAME C1_COUNT_2016
  /COMPRESSED.

GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2016-01.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.







GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2021.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

COMPUTE C1_COUNT_2021=C1_COUNT_TOTAL.
EXECUTE.

FORMAT C1_COUNT_2021 (COMMA15.0) .

SAVE OUTFILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2021-01.sav'
  /KEEP = ALT_GEO_CODE C1_COUNT_2021
  /COMPRESSED.

GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2021-01.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.







GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2016-01.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

GET FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2021-01.sav'.
DATASET NAME DataSet2.
DATASET ACTIVATE DataSet1.
SORT CASES BY ALT_GEO_CODE.
DATASET ACTIVATE DataSet2.
SORT CASES BY ALT_GEO_CODE.
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /FILE='DataSet2'
  /BY ALT_GEO_CODE.
EXECUTE.

COMPUTE CHANGE_POP=C1_COUNT_2021 - C1_COUNT_2016.
EXECUTE.

FORMAT CHANGE_POP (COMMA15.0) .

SORT CASES BY GEO_NAME(A).

SAVE OUTFILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-MERGE.sav'
  /COMPRESSED.

GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-MERGE.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.







GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-MERGE.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

SORT CASES BY GEO_NAME(A).

USE ALL.
COMPUTE filter_$=(C1_COUNT_2016 >= 500000).
VARIABLE LABELS filter_$ 'C1_COUNT_2016 >= 500000 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.
_SLINE OFF.














GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2016.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

COMPUTE YEAR =2016.
EXECUTE.

FORMAT C1_COUNT_TOTAL (COMMA15.0) .
FORMAT YEAR (F8.0) .

SAVE OUTFILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2016-02.sav'
  /KEEP = ALT_GEO_CODE GEO_NAME C1_COUNT_TOTAL YEAR
  /COMPRESSED.

GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2016-02.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

USE ALL.
COMPUTE filter_$=(C1_COUNT_TOTAL >= 500000).
VARIABLE LABELS filter_$ 'C1_COUNT_TOTAL >= 500000 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.
_SLINE OFF.

GRAPH
  /BAR(SIMPLE)=MEAN(C1_COUNT_TOTAL) BY GEO_NAME
  /TITLE='2016 CANADA POPULATION BY AREA (OVER 500,000)'.





GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2021.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

COMPUTE YEAR =2021.
EXECUTE.

FORMAT C1_COUNT_TOTAL (COMMA15.0) .
FORMAT YEAR (F8.0) .

SAVE OUTFILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2021-02.sav'
  /KEEP = ALT_GEO_CODE GEO_NAME C1_COUNT_TOTAL YEAR
  /COMPRESSED.

GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2021-02.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

USE ALL.
COMPUTE filter_$=(C1_COUNT_TOTAL >= 500000).
VARIABLE LABELS filter_$ 'C1_COUNT_TOTAL >= 500000 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.
_SLINE OFF.

GRAPH
  /BAR(SIMPLE)=MEAN(C1_COUNT_TOTAL) BY GEO_NAME
  /TITLE='2021 CANADA POPULATION BY AREA (OVER 500,000)'.





GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2016-02.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

ADD FILES /FILE=*
  /FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-2021-02.sav'.
EXECUTE.

SORT CASES BY GEO_NAME(A) YEAR(A).

SAVE OUTFILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-BY_YEAR.sav'
  /KEEP = ALT_GEO_CODE GEO_NAME C1_COUNT_TOTAL YEAR
  /COMPRESSED.

GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-BY_YEAR.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.







GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-BY_YEAR.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

USE ALL.
COMPUTE filter_$=(C1_COUNT_TOTAL >= 500000).
VARIABLE LABELS filter_$ 'C1_COUNT_TOTAL >= 500000 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.
_SLINE OFF.

GRAPH
  /BAR(GROUPED)=MEAN(C1_COUNT_TOTAL) BY GEO_NAME BY YEAR
  /TITLE='CANADA POPULATION BY AREA AND YEAR (OVER 500,000)'.







GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-MERGE.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

USE ALL.
COMPUTE filter_$=(CHANGE_POP >= 50000).
VARIABLE LABELS filter_$ 'CHANGE_POP >= 50000 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.
_SLINE OFF.

SORT CASES BY filter_$(D) GEO_NAME(A).

GRAPH
  /BAR(SIMPLE)=MEAN(CHANGE_POP) BY GEO_NAME
  /TITLE='POPULATION CHANGES FROM 2016 TO 2021 (OVER 50,000)'.







GET
  FILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-MERGE.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

SAVE TRANSLATE OUTFILE='/Users/skylarkim/Desktop/Fun Coding Projects/SPSS_Project_StatCan-MERGE.csv'
  /TYPE=CSV
  /ENCODING='UTF8'
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES.
