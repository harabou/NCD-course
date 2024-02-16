/*================*/
/*SQL exercise    */
/*SAS Help data   */
/*DS2 Program     */
/*================*/


/*******************************************************************/
/********************************************************************/
/*Example 1*/
/*******************************************************************/


/*select all*/
proc sql;
create table ds1 as
    select * 
    from sashelp.cars;
quit;
proc print;
run;

/*select obs first 10data*/
proc sql outobs=10;
    select *
    from sashelp.cars;
quit;

/*Variables can be easily renamed or added*/
/*rename*/
proc sql;
    select make as var1, type as var2, origin as var3
    from sashelp.cars;
quit;

/*create var*/
proc sql;
    select mpg_city, (mpg_city/1000) as var_p
    from sashelp.cars;
quit;

/*label format*/
proc sql;
    select mpg_city label="miles per gallon (city) cars " format=8.3
    from sashelp.cars;
quit;

/*distinct Counting duplicate cases*/
proc sql ;
select distinct origin, make
from sashelp.cars;
quit;

/*Where*/
PROC SQL;
SELECT make,model,type,invoice,horsepower
FROM 
SASHELP.CARS
Where make = 'Audi'
and Type = 'Sports'
;
QUIT;


/*******************************************************************/
/********************************************************************/
/*Example 2*/
/*******************************************************************/


data test;
input usubjid $ lbcat aval;
cards;
a01 1 1.1
a01 2 1.4
a01 3 24.1
a01 4 2000
b01 1 3.0
b01 2 1.2
b01 3 50
b01 4 1800
c02 1 3.2
c02 2 0.5
;
run;
proc sort data=test nodupkey out=out1; by usubjid;run;

/*stat*/
proc sql;
select lbcat,
       count(aval) as n,
       min(aval) as min,
       max(aval) as max,
       mean(aval) as mean,
       std(aval) as std,
       median(aval) as median
from test
group by lbcat;
quit;


/*where*/
proc sql;
select usubjid, lbcat, aval
from test
where lbcat between 3 and 4;
quit;

/*where wildcards*/
proc sql;
select usubjid, lbcat, aval
from test
where usubjid contains "a";
quit;

proc sql;
select usubjid, lbcat, aval
from test
where usubjid in ("a01", "a02");
quit;

/*wild cards*/
/*%: 0文字以上の任意の文字列 _: 任意の1文字*/

proc sql;
select usubjid, lbcat, aval
from test
where usubjid like "a0_";
quit;

/*order by*/
proc sql;
select usubjid, lbcat, aval
from test
order by  lbcat asc,  aval desc;
quit;

/*sub quuery*/
data ds1;
input usubjid $ lbcat aval;
cards;
a01 1 1.1
a11 2 1.4
a02 1 24.1
a12 2 2000
b01 1 3.0
b11 2 1.2
b22 1 50
b22 2 1800
c32 1 3.2
c52 2 0.5
;
run;

data ds2;
input usubjid $	subgroup score;
cards;
a01 1 5
a14 2 4
a23 1 9
a40 2 1
b07 1 2
b11 2 6
b29 1 7
b83 2 8
c38 1 3
c52 2 8
;
run;

proc sql;
create table result2 as
select * 
from ds2
where usubjid in (select usubjid from ds1 where lbcat=2);
quit;
