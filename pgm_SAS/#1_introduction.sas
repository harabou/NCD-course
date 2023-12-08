/**********************************/
/*Reading Data  1)  Direct input*/

data lab;
input age weight h_bp L_bp tp got gpt ggpt bun;
age10=int(age/10);
cards;
43	 61	147.5		110	78		7.6	19		14		4.4	10		11
82 56	144.3		158	70		7.6	27		20		5.9	7		15
40 46.5	146		110	76		7.3	14		12		3		8		16
71 57.5	146.1		186	118	8.5	22		14		7.5	22		15
50	58		156.5		160	98		7.3	15		13		5.9	8		14
53	53.5	144.8		150	90		7.6	25		20		6.9	12		13
54	50		139.3		164	100	7.1	20		17		4.2	23		18
76	40		136.5		130	70		7.7	24		16		4.7	12		19
62	48		151.9		114	76		6.8	20		17		5.4	10		14
62	49		154.6		142	88		8		24		17		5.5	16		13
48	48.5	150.2		108	70		7.4	14		14		4.7	9		12
;
run;

proc print data=lab;
run;



/**********************************/
/*Reading Data  2)  import external files*/
data lab2;
infile 'd:\lab.csv' delimiter =',' firstobs=2;  /*The lab.csv is stored on drive D.  Please change the file hierarchy in your own PC environment.*/
input age weight h_bp l_bp tp got gpt ggpt bun;
age10=int(age/10); /*INT function returns the integer part  (rounded down to the nearest whole number)*/
run;

proc print data=lab2;
run;


/**********************************/
/*Reading Data   3) SAS data set files*/
/*0) The lab.csv is stored on drive D.*/
/*1) Create a SAS library called 'mysas' (libname mysas "D:\";) and save csv file*/

libname mysas "D:\harada_sas\";/*Create library*/

data mysas.lab2;
infile 'd:\harada_sas\lab.csv' delimiter =',' firstobs=2;
input age weight h_bp l_bp tp got gpt ggpt bun;
age10=int(age/10); 
run;

/*2) This allows you to read the lab.csv dataset by specifying "mysas.lab"*/
/*Read the 'lab2' data set in the 'mysas' library and set it to 'lab3*/

data mysas.lab3;
set mysas.lab2;
run;



/***************************/
/*Dataset health (health_data.txt)*/
/***************************/
/*01 health_data.txt                 */
/*data description "health data"*/
/***************************/

data health;
input  sex $ age  sbp dbp salt;
cards;
F   64 137  86 13.4
F   55  97  66  8.9
F   52 151  93 12.7
F   63 105  75 10.4
F   66 139  71  6.9
F   48 132  85 10.1
F   53 129  67  7.4
F   62 138  85  8.0
F   64 126  75 10.2
F   47 101  73  9.3
F   67 133  65  9.2
F   50  97  60  7.9
F   58 104  69 10.6
F   61 109  65  9.4
F   55 117  69 10.1
F   58 131  75  9.6
F   60  97  61 12.1
F   59 126  91  8.1
F   60 134  77  6.8
F   61 100  58 12.4
F   54  95  63  7.6
F   64 130  75  6.1
F   55 108  76  7.0
F   53  97  58  9.7
F   65 113  79  9.6
F   69 127  69 12.6
F   56 119  70 10.6
F   58 142  87 11.3
F   66 104  73  9.9
F   62 135  92  7.7
F   55 101  65  7.9
F   67 100  57 10.0
F   69 115  73 10.5
F   65 114  82  5.0
F   58  93  61  7.2
F   62 123  71  8.8
F   64 117  61 12.4
F   62 124  81  6.0
F   63 113  64  5.1
F   67 126  67  8.6
F   67 130  94  8.9
F   68 122  69 11.7
F   69 119  67  8.8
F   55 124  66 10.5
F   63 106  66  6.9
F   67 108  81 13.3
F   46 113  68 12.0
F   53 119  71 10.3
F   60 130  73  8.5
F   44 149  97 10.6
F   63 110  55 13.3
F   61 114  69  7.4
F   48 131  94  9.1
F   67 134  73 10.0
F   53 137  75  7.0
F   50 123  77  7.4
F   65 142  85 17.2
F   62  99  57  4.9
F   65 111  67  5.7
F   40 101  60  6.1
F   51 129  79  7.2
F   64 117  73 11.2
F   59 121  65  9.8
F   60 135  81 10.4
F   68 144  80 11.1
F   40 118  79  9.5
F   63 187  81  8.9
F   66 141  59 11.0
F   67 119  63  9.0
F   65 109  73 11.1
F   62 134  79 10.7
F   68 123  73  9.0
F   46 117  71 10.4
F   65 129  80  9.1
F   65 147  87 10.6
F   67 147  63  8.8
F   46  99  61  7.9
F   59 131  83  8.8
F   66 110  67  6.3
F   59 130  83  6.3
F   64 115  67 12.9
F   66 109  65  8.0
F   62 105  71  7.2
F   60 103  66  8.0
F   59 118  69 10.8
F   63 105  61  6.4
F   65 101  67 12.6
F   41 118  66  7.2
F   68 101  61  8.0
F   45 104  64  9.1
F   51 137  69  5.4
F   49  99  67 12.5
F   53 145  89  8.6
F   68  91  65 10.2
F   59 140  75  9.7
F   62 125  79  6.9
F   65 105  63 10.8
F   43 104  70  7.8
F   53 100  67  9.4
F   40  98  59  9.0
F   58 117  67 10.0
F   44 128  77  7.9
F   44 136  97  9.5
F   66 106  65  8.8
F   65 126  78  9.5
F   46  93  49  6.5
F   46 117  66  7.5
F   48 114  63  9.7
F   41 140  89 13.4
F   62 153  81  7.8
F   67  95  59 11.1
F   65 115  67  8.8
F   54 151  80 11.4
F   58 151  92  7.8
F   63 119  67 10.1
F   61 135  79  9.5
F   67 140  71 12.0
F   55 131  75  7.8
F   66 153  88  6.7
F   62 129  61  9.3
F   64 136  75  7.8
F   56 100  59 10.5
F   48 128  61  7.3
F   67 139  76  6.2
F   67 135  81  9.5
F   64 135  77 13.2
F   68 124  71  7.7
F   63 119  64  6.5
F   67 125  69  6.0
F   67 131  75 13.3
F   61 137  74  9.3
F   67 132  77 10.0
F   63 134  79  9.7
F   65 101  66 11.5
F   64 123  73 11.3
F   54 136  77  7.6
F   57 124  77  7.3
F   69 137  75  8.6
F   50 118  59  8.0
F   48 114  51  8.4
F   63 108  59  9.7
F   57 119  67  8.7
F   61 127  76 11.6
F   62 100  67  9.2
F   65 132  83 10.4
F   59 145  80 14.2
F   66 123  81  9.6
F   65 125  63  6.9
F   45  98  59 10.9
F   57 106  63 12.0
F   60 101  67  6.6
F   69 125  72 11.7
F   65 130  70  8.9
F   65 139  81 11.4
F   50 128  71  6.2
F   65 164  89  9.5
F   44 101  54 11.9
F   50 137  83  7.9
F   66 111  60  7.7
F   42 119  73  9.5
F   54 115  61  8.8
F   52 131  74  5.9
F   63 167  80  9.3
F   64 135  78  8.5
F   66 132  71 13.5
F   59 121  75 10.9
F   61 157  79 11.5
F   41 145  91 12.0
F   51 150  84 11.3
F   66 117  71  7.4
F   66 101  57  8.9
F   66 124  87 10.1
F   42 109  57  8.2
F   44 100  63  7.4
F   65 140  82 11.3
F   52 125  62 11.3
F   63 140  75 11.7
F   43 111  70  7.1
F   65 127  71 10.1
F   47 147  90  8.3
F   52 100  58  9.0
F   62 135  71  5.8
F   66 131  73 10.2
F   60 120  75 12.7
F   59 119  74 11.6
F   66 112  75  5.9
F   46 124  71  9.2
F   64 135  74  7.4
F   50 127  69  5.9
F   59 103  54  7.1
F   55 131  74 10.2
F   51 116  65  9.0
F   65 145  89 14.8
F   59 111  59  9.4
F   48 129  75 10.7
F   68 131  76  8.7
F   51 100  61  8.8
F   65 125  69  9.5
F   69 135  74 11.2
F   63 119  65  8.7
F   64 119  86  6.9
F   42 111  70  9.6
F   43 119  67  8.0
F   63 130  77  9.1
F   66 115  69 10.7
F   69 131  81  9.7
F   52 121  73  7.9
F   51 105  71 11.2
F   60 119  70  9.0
F   59 145  91 10.1
F   67 109  59  6.0
F   40  97  58  7.3
F   64 134  81  9.2
F   66 116  71 11.6
F   64 140  79 10.4
F   65 163  91 10.4
F   52 111  71 10.5
F   67 121  67 11.1
F   66 115  67  8.0
F   64 117  71  8.3
F   55 138  70  8.9
F   55 165 100 14.1
F   42 119  69  9.0
F   55  99  65 10.3
F   59 133  81 11.1
F   62 125  81  8.2
F   59 130  70 10.3
F   49 135  77  6.8
F   59 113  72  8.0
F   52 115  65  9.7
F   42 130  79  9.8
F   60 135  74 15.3
F   58 152  81 11.9
F   42 105  69  8.8
F   63 111  63  9.7
F   59 118  67  6.9
F   53 111  61  5.1
F   65 123  81 10.0
F   69 117  67  8.8
F   55 131  80 13.3
F   49 148  84  9.0
F   55 109  67  6.3
F   41 120  77  7.1
F   65 138  77  9.1
M   58 123  80 10.2
M   61 126  90  7.8
M   65 135  84 11.6
M   67 139  83 10.0
M   59 124  77 10.6
M   66 123  86 10.7
M   46 139  98  8.7
M   66 141  68 13.2
M   50 133  89  9.5
M   62 100  77  8.6
M   62 134  95  8.4
M   62 111  69  7.2
M   54 128  95  6.1
M   63 122  81  8.6
M   61 104  64 13.3
M   61 130  89  6.8
M   61 107  67 10.3
M   52 135  88  8.9
M   68  93  61  8.7
M   68 141  88  9.9
M   59 123  87 12.3
M   65  98  61  7.6
M   46 111  81 10.9
M   60 125  71  9.2
M   62 136  84  8.5
M   69 121  70 10.0
M   63 162 104 13.6
M   47 108  59 10.2
M   69 119  82  8.6
M   63 121  77  8.5
M   66 137  76  9.0
M   61  99  66  4.5
M   68 135  69 10.1
M   49 116  82  9.8
M   59 118  69 10.3
M   55 129  95  8.8
M   54 124  83  7.2
M   62 120  86  9.9
M   66 121  63 10.2
M   65 134  81  7.9
M   68 129  68  8.0
M   45 127  79 10.6
M   54 173  98 10.9
M   63 131  91  7.8
M   63 130  89  8.8
M   63 133  80  8.5
M   45  94  67  6.2
M   49 125  80  8.5
M   68 129  73  7.2
M   62 155  91 11.4
M   67 111  73  6.7
M   62  93  55  6.7
M   68 119  75  8.7
M   65 108  67  4.9
M   65 123  78 12.3
M   67 126  69  6.9
M   55 105  63 11.5
M   59 110  77  6.8
M   65 127  75  7.7
M   66 120  71  8.4
M   65 110  70  7.5
M   64 126  79 10.6
M   56 123  82  9.9
M   62 140  93  7.5
M   65 121  72  7.6
M   69 129  61  5.6
M   61 152  86  8.5
M   53 123  81  7.5
M   52 106  64  8.8
M   55 144  90  9.1
M   48 122  79  9.0
M   43 116  81 10.2
M   63  95  63  7.4
M   67 121  72  7.7
M   44 111  75  9.3
M   63 137  87  8.2
M   58 118  76  8.8
M   64 106  74  9.4
M   55  98  58  8.0
M   65 115  73  8.6
M   56 104  63 10.4
M   61 120  65  7.1
M   67 140  83 11.3
M   67 115  69  9.7
M   53 157  88 11.5
M   45 110  68 10.4
M   42 118  80  9.2
M   67 134  79 15.4
M   67 123  70 11.4
M   65 138  70  7.6
M   55 129  78 10.6
M   65 124  69 12.2
M   66 139  70  9.5
M   67 111  66 13.1
M   64 180 130 10.2
M   66 129  79  6.9
M   52 146  89 11.7
M   69 128  77  8.0
M   69 131  71  7.4
M   66 160  79  3.8
M   65 144  91  9.7
M   46 148  86 10.9
M   60 120  75 10.1
M   55 141  81 10.8
M   41 120  79  9.7
M   57 146  71  9.3
M   57 110  70  8.5
M   62 139  89  8.7
M   63 147  83  8.9
M   57 113  71 10.6
M   40 121  63  6.7
M   60 121  81 11.2
M   63 127  65  9.5
M   59 148  97  9.7
M   42 114  71 10.1
M   68 119  65  9.0
M   69 133  78  7.6
M   60 109  61 14.1
M   62 130  82 10.8
M   65 153  81 10.3
M   60 147  93 11.5
M   65 108  64  7.9
M   65 129  83 10.9
M   53 129  90  9.4
M   62 108  72  8.2
M   51 102  65  9.7
M   68 119  69 10.5
M   63 132  69 10.1
M   68 154  81 10.8
M   65 127  71  9.1
M   62 118  65  9.8
M   60 105  67 12.6
M   63 131  71  8.5
M   61 141  74  8.5
M   60 129  70  8.9
M   57 121  71  8.1
M   56 141  83 10.6
M   64 146  87  8.5
M   55 121  73 11.7
M   66  99  61  8.6
M   60 121  67  7.4
M   63 136  73 11.6
M   51 139  93  7.6
M   65 107  69  9.6
M   68 137  74  9.1
M   56 135  76  7.2
M   67 141  87 10.5
M   67 116  64 11.3
M   50 120  74 13.0
M   62  98  55  9.4
M   64 127  69 11.9
M   61 130  81 13.0
M   54 119  86  9.5
M   58 137  72  7.3
M   61 137  84 12.3
M   60 159  86 13.4
M   64 141  85  9.4
M   60 121  69 10.6
M   42 104  63  9.2
M   64 136  75 10.5
M   62 123  68  7.4
M   56 118  69 13.8
M   63  96  57 10.9
M   59 134  87 10.7
M   57 119  85 11.2
M   66 149  79  9.6
M   47 135  91  8.3
M   42  93  59  6.0
M   40 111  77  8.8
M   49 107  71  9.0
M   56 125  74 10.0
M   61 129  78 11.5
M   40 119  71  9.0
M   45 143  95  5.2
M   69 141  80 12.5
M   59 121  69  8.7
M   53 115  77  8.2
;
run;

/*example of retain statement*/
/*Create a Dataset "health�h to "health2�h*/

data health2;
set health;
retain id 0;
id=id+1;
run;


/*univariate procedure*/
proc univariate data=health2 plot normal;
  var age;
run;

/*Q3*/
  proc univariate data=health2 plot normal;
	var salt;
   	class sex;
  	histogram salt/ endpoints=3 to 19 by 1;
   	id id;
   	label salt='Salt intake';
   	run;


/*corr procedure*/
ods pdf file='F:\corr.pdf';
proc corr pearson spearman kendall  plots=matrix(histogram)  data=health2;
   var sbp dbp salt;
run;
ods pdf close;
run;

ods pdf file='F:\corr.pdf';
proc corr pearson spearman kendall  plots=matrix(histogram)  data=health2;
with age;
var sbp dbp salt;
   by sex;
run;
ods pdf close;
run;

ods pdf file='F:\corr.pdf';
proc corr pearson spearman kendall  plots=matrix(histogram)  data=health2;
   var sbp dbp salt;
   partial age;
run;
ods pdf close;
run;


/*Polyserial correlation */

/*pattern */
/*In order to perform a polyserial correlation analysis, 
Create a new health3 data set with blood pressure classification categories 
added to the health2 data set*/

data health3;
set health2;
if sbp<120  then  sbp_c= 1;
else if 120<=sbp<130 then sbp_c=2;
else if 130<=sbp<140 then sbp_c=3;
else if 140<=sbp<150 then sbp_c=4;
else if 150<=sbp<160 then sbp_c=5;
else if 160<=sbp<170 then sbp_c=6;
else if 170<=sbp<180 then sbp_c=7;
else  c=8;

if sbp<120  and dbp< 80 then  HTN_c= 1;
else if 120<=sbp<130 and dbp< 80 then HTN_c=2;
else if 130<=sbp<140 or 80<=dbp< 90 then HTN_c=3;
else if 140<=sbp<160 or 90<=dbp< 100 then HTN_c=4;
else if 160<=sbp<180 or 100<=dbp< 110  then HTN_c=5;
else if 180<=sbp and  110<=dbp  then HTN_c=6;
else HTN=_c=7;
run;
proc print;
run;


proc corr data=health3 pearson polyserial;
	with HTN_c;
var age salt sbp;
run;
proc corr data=health3 pearson;
	var age salt sbp;
run;


/*����������������������������������������������������������*/
/*OPTIONAL EXERCISE*/
/*Format procedure*/
/*Categorization of blood pressure and age*/

data health2;
set health2;
run;

proc format;
/*Specify category name and category classification*/
  value sf 	low-<120='-<120'     /*Defined as SBP category "sf".*/
                 120-129='120-129'
	         	130-139='130-139'
	         	140-159='140-159'
	         	160-179='160-179'
	         	180-high='180-';
	value df low-<80='-<80'    /*Defined as DBP category "df".*/
	        	 80-84='80-84'
		 		 85-89='85-89'
                 90-99='90-99'
                 100-109='100-109'
                 110-high='110-';
proc format; 
     value ag    40-49= '40s' /*Defined as Age category "ag".*/
                 	50-59='50s'
                 	60-69='60s';
run;

proc freq  data=health_c;
table sbp*age;
   format sbp sf. age ag. ;   /*Specify format definition after variable name "age ag.(period)"*/
run;






