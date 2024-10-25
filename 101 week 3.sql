create database bank_101;
USE bank_101;
create table branch_101(
branch_name varchar(20),
branch_city varchar(20),
assets int,
primary key(branch_name));

create table bankacc_101(
accno int,
branch_name varchar(20),
balance int,
primary key(accno),
foreign key(branch_name) references branch_101(branch_name));

create table bankcustomer_101(
customer_name varchar(20),
customer_street varchar(20),
city varchar(20),
primary key(customer_name));

create table depositor_101(
customer_name varchar(20),
accno int,
foreign key(customer_name) references bankcustomer_101(customer_name),
foreign key(accno) references bankacc_101(accno));

create table loan_101(
loan_number int,
branch_name varchar(20),
amount int,
primary key(loan_number),
foreign key (branch_name) references branch_101(branch_name));

insert into branch_101 values("SBI_Chamarajpet","Bangalore",50000);
insert into branch_101 values("SBI_ResidencyRoad","Bangalore",10000);
insert into branch_101 values("SBI_ShivajiRoad","Bombay",20000);
insert into branch_101 values("SBI_ParliamentRoad","Delhi",10000);
insert into branch_101 values("SBI_Jantarmantar","Delhi",20000);

insert into bankacc_101 values(1,"SBI_Chamarajpet",2000);
insert into bankacc_101 values(2,"SBI_ResidencyRoad",5000);
insert into bankacc_101 values(3,"SBI_ShivajiRoad",6000);
insert into bankacc_101 values(4,"SBI_ParliamentRoad",9000);
insert into bankacc_101 values(5,"SBI_Jantarmantar",8000);
insert into bankacc_101 values(6,"SBI_ShivajiRoad",4000);
insert into bankacc_101 values(8,"SBI_ResidencyRoad",4000);
insert into bankacc_101 values(9,"SBI_ParliamentRoad",3000);
insert into bankacc_101 values(10,"SBI_ResidencyRoad",5000);
insert into bankacc_101 values(11,"SBI_Jantarmantar",2000);

insert into bankcustomer_101 values("Avinash","Bull_temple_road","Bangalore");
insert into bankcustomer_101 values("Dinesh","Bannergatta_Road","Bangalore");
insert into bankcustomer_101 values("Mohan","NationalCollege_Road","Bangalore");
insert into bankcustomer_101 values("Nikil","Akbar_Road","Delhi");
insert into bankcustomer_101 values("Ravi","Prithviraj_Road","Delhi");

insert into depositor_101 values("Avinash",1);
insert into depositor_101 values("Dinesh",2);
insert into depositor_101 values("Nikil",4);
insert into depositor_101 values("Ravi",5);
insert into depositor_101 values("Avinash",8);
insert into depositor_101 values("Nikil",9);
insert into depositor_101 values("Dinesh",10);
insert into depositor_101 values("Nikil",11);

insert into loan_101 values(1,"SBI_Chamarajpet",1000);
insert into loan_101 values(2,"SBI_ResidencyRoad",2000);
insert into loan_101 values(3,"SBI_ShivajiRoad",3000);
insert into loan_101 values(4,"SBI_ParliamentRoad",4000);
insert into loan_101 values(5,"SBI_Jantarmantar",5000);

select branch_name,assets/100000 as assets_in_lakhs
from branch_101;

select customer_name,count(*)
from depositor_101,bankacc_101
where bankacc_101.accno=depositor_101.accno 
and branch_name="SBI_ResidencyRoad"
group by customer_name
having count(*)>1;

select branch_name,assets
from branch_101;

select customer_name
from bankcustomer_101
where city="Bangalore";

select *
from depositor_101;

select branch_name,count(branch_name)
from bankacc_101
group by branch_name;

select d.customer_name,b.balance
from depositor_101 d,bankacc_101 b
where d.accno=b.accno and  balance>5000;

select branch_name 
from loan_101 
where amount = (select min(amount) from loan_101);

select customer_name
from bankcustomer_101
where city="Delhi";

select branch_name
from branch_101
where branch_name not in (select branch_name from loan_101);

select customer_name 
from loan_101 l, depositor_101 d,  bankacc_101 b
where l.branch_name=b.branch_name and b.accno=d.accno;
