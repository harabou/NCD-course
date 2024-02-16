/*======================================================================================*/
/*Today's lecture handout*/
/*Google drive: 
https://drive.google.com/drive/folders/1KvB77MIMQtjgKk_7o0eRalNWLuAWmkGK?usp=share_link*/
/*=====================================================================================*/




/*===========================*/
/*Match merge 1: SAS Datastep*/
/*===========================*/

/*dataset ds11(=A)*/
data ds11;
input id name $ city $ weight year;
datalines;
1 Kyoko city_a 40 2008
2 Kanna city_b 50 2008
3 Rei city_a 45 2008
4 Aska city_c 50 2008
5 Shinji city_d 70 2008
6 Taro city_d 80 2008
7 Ichiro city_e 65 2008
8 Ken city_f 75 2008
;
run;
proc sort;
by id;
proc print;
run;

/*dataset ds21(=B)*/
data ds21;
input id2 name $ city $ weight year;
cards;
1 Kyoko city_a 48 2020
2 Kanna city_b 51 2020
3 Rei city_a 43 2020
5 Shinji city_d 75 2020
6 Taro city_d 78 2020
7 Ichiro city_e 65 2020
;
run;

/*Rename*/
data ds21;
set ds21;
rename id2=id;
rename weight=weight2;
rename year=year2;
run;
proc print;
run;

/*Sort*/
proc sort data=ds11;
by id;
proc sort data=ds21;
by id;
run;

/*Merge <1>*/
data ds1121a;
merge ds11(in=a) ds21 (in=b);
by id;
if a or b;
run;
proc print;
run;

/*Merge <2>*/
data ds1121b;
merge ds11(in=a) ds21 (in=b);
by id;
if a and b;
run;
proc print;
run;


/*===========================*/
/*Match merge 2: SQL         */
/*===========================*/

/**********************************************************************/
/*SQl*/
/**********************************************************************/

/*data ds1(A)*/

data ds1;
input id name $ city $ weight year;
datalines;
1 Kyoko city_a 40 2008
2 Kanna city_b 50 2008
3 Rei city_a 45 2008
4 Aska city_c 50 2008
5 Shinji city_d 70 2008
6 Taro city_d 80 2008
7 Ichiro city_e 65 2008
8 Ken city_f 75 2008
;
run;
proc print;
run;

/*data ds2(B)*/
data ds2;
input id name $ city $ weight year;
cards;
1 Kyoko city_a 48 2020
2 Kanna city_b 51 2020
3 Rei city_a 43 2020
5 Shinji city_d 75 2020
6 Taro city_d 78 2020
7 Ichiro city_e 65 2020
;
run;

/*left join to ds1*/
proc sql ;
create table ds120 as
select ds1.*, ds2.weight as weight2012 
from ds1
left join ds2
on ds1.id=ds2.id;
quit;

proc print data=ds120;
run;

/*right join to ds2*/
proc sql;
create table ds122 as
select ds1.*, ds2.weight as weight2012 
from ds1
left join ds2
on ds1.id=ds2.id;
quit;

right join ds2
on ds1.id=ds2.id2;
quit;

proc print data=ds122;
run;

/*inner　join*/
proc sql noprint;
create table ds123 as
select ds1.*, ds2.weight as weight2012 
from ds1
left join ds2
on ds1.id=ds2.id;
quit;

inner join ds2
on ds1.id=ds2.id2;
quit;
proc print data=ds123;
run;

/*Full join A or B*/
proc sql noprint;
create table ds124 as
select ds1.*, ds2.weight as weight2012 
from ds1
left join ds2
on ds1.id=ds2.id;
quit;

full join ds2
on ds1.id=ds2.id2;
quit;
proc print data=ds124;
run;


/*SQL Three dataset merge*/
/*datas ds3(C)*/
data ds3;
input id name $ weight year;
cards;
3 Rei 40 2020
5 Shinji 39 2020
6 Misato 65 2020
7 Ryoji 60 2020
;
run;

/*merge SQL*/
proc sql;
create table ds1234 as
select ds1.*, ds2.weight as weight2020, ds3.weight as weight2023
from ds1
full join ds2 on ds1.id=ds2.id
full join ds3 on ds2.id=ds3.id;
quit;
proc print data=ds1234;
run;



/*--Histogram--*/

title 'Distribution of Mileage';
proc sgplot data=sashelp.cars(where=(type ne 'Hybrid'));
  histogram mpg_city;
  density mpg_city / lineattrs=(pattern=solid);
  density mpg_city / type=kernel lineattrs=(pattern=solid);
  keylegend / location=inside position=topright across=1;
  yaxis offsetmin=0 grid;
run;






