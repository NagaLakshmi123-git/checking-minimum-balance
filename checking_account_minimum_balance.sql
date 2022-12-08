#firstly create table with user having bank account in any bank

create table bankaccount(act_no number(5) primary key,actholder_name varchar2(10),balance number(10));

#now we insert values into the bankaccount table

insert into  bankaccount values(1, 'nandini', 1000);
insert into  bankaccount values(2, 'nagaraj', 50);
insert into bankaccount values(3, 'santhosh', 1100);
insert into bankaccount values(4, 'keerthi', 700);
insert into bankaccount values(5, 'mahesh', 1700);
insert into  bankaccount values(6, 'lakshmi', 100);
insert into  bankaccount values(7, 'vedha', 100);
insert into bankaccount values(8, 'sirisha', 1200);
insert into bankaccount values(9, 'malleswari', 500);
insert into bankaccount values(10, 'sreedhar', 1800);

DECLARE 

xact_no number(5); 
xmin_bal number(5):=1000;  
xbalance number(5); 

BEGIN

#here we take input from user
xact_no:=&xact_no;  

#we copy or select the balance of bankaccount into xbalance
select balance into xbalance from bankaccount where act_no=xact_no;  

#here we are checking for minimum balance if it is present we ignore it otherwise we deduct 100rs from account balance
IF(xbalance < xmin_bal) THEN 
update bankaccount  
set balance=balance-100  
where act_no=xact_no;  
 #remaining amount     
xbalance:=xbalance-100;  
dbms_output.put_line('Rs 100 is deducted from your account due to insufficient minimum balance'||xbalance); 
ELSE             
dbms_output.put_line('Current balance is '||xbalance); 
END IF;     
END;



