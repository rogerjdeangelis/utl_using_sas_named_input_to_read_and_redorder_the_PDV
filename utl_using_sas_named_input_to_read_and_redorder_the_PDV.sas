Using sas named input to read and redorder the PDV

github
https://tinyurl.com/ydfj2nmd
https://github.com/rogerjdeangelis/utl_using_sas_named_input_to_read_and_redorder_the_PDV

SAS Forum
https://tinyurl.com/ydc2mvsv
https://communities.sas.com/t5/SAS-Programming/Change-column-names-dynamically-based-on-data-value/m-p/493625

Not sure this helps.
But if you have an input file like the one below and


INPUT FILE
==========

CUSTOMERID="7895" CUSTOMERADDRESS="1234 MAIN ST"  CUSTOMERNAME="JOHN DOE"
CUSTOMERID="8597" CUSTOMERADDRESS="6789 RIVER ST" CUSTOMERNAME="DAVE ABC"



WANT  (Note CustomerName was moved from the end to the middle of PDV )
====================================================================-=

WORK.WANT total obs=2

 CUSTOMERID    CUSTOMERNAME    CUSTOMERADDRESS

   "7895"       "JOHN DOE"     "1234 MAIN ST"
   "8597"       "DAVE ABC"     "6789 RIVER ST"


PROCESS
=======

data want;
informat CUSTOMERID  CUSTOMERNAME CUSTOMERADDRESS $40.;
input CUSTOMERID=  CUSTOMERNAME= CUSTOMERADDRESS=;
cards4;
CUSTOMERID="7895" CUSTOMERADDRESS="1234 MAIN ST"  CUSTOMERNAME="JOHN DOE"
CUSTOMERID="8597" CUSTOMERADDRESS="6789 RIVER ST" CUSTOMERNAME="DAVE ABC"
;;;;
run;quit;


