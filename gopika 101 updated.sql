create database insurance_101;
use insurance_101;
create table person_101(
driver_id varchar(20),
name varchar (30),
address varchar(50),
primary key(driver_id)
);
create table car_101(
reg_num varchar(10),
model varchar(15),
year int,
primary key(reg_num)
);
create table owns_101(
driver_id varchar(20),
reg_num varchar(10),
primary key(driver_id,reg_num),
foreign key(driver_id) references person_101(driver_id),
foreign key(reg_num) references car_101(reg_num)
);
create table accident_101(
report_num int,
accident_date date,
location varchar(50),
primary key(report_num)
);
create table participitated_101(
driver_id varchar(20),
reg_num varchar(10),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person_101(driver_id),
foreign key(reg_num) references car_101(reg_num),
foreign key(report_num) references accident_101(report_num)
);
insert into person_101
values("A01","Richard","Srinivas nagar");
insert into person_101
values("A02","Pradeep","Rajaji nagar");
insert into person_101
values("A03","Smith","Ashok nagar");
insert into person_101
values("A04","Venu","N R Colony");
insert into person_101
values("A05","John","Hanumanth nagar");
select * from person_101;

insert into car_101
values("KA052250","Indica",1990);
insert into car_101
values("KA031181","Lancer",1957);
insert into car_101
values("KA095477","Toyota",1998);
insert into car_101
values("KA053408","Honda",2008);
insert into car_101
values("KA041702","Audi",2005);
select * from car_101;

insert into owns_101 values("A01","KA052250");
insert into owns_101 values("A02","KA031181");
insert into owns_101 values("A03","KA095477");
insert into owns_101 values("A04","KA053408");
insert into owns_101 values("A05","KA041702");

insert into accident_101 values(11,"2003-01-01","MysoreRoad");
insert into accident_101 values(12,"2004-02-02","SouthEndCircle");
insert into accident_101 values(13,"2003-01-21","BullTempleRoad");
insert into accident_101 values(14,"2008-02-17","MysoreRoad");
insert into accident_101 values(15,"2003-01-01","KanakpuraRoad");

select * from accident_101;
insert into participitated_101 values("A01","KA052250",11,10000);
insert into participitated_101 values("A02","KA031181",12,50000);
insert into participitated_101 values("A03","KA095477",13,25000);
insert into participitated_101 values("A04","KA053408",14,3000);
insert into participitated_101 values("A05","KA041702",15,5000);
select * from participitated_101;

update participitated_101
set damage_amount=25000
where reg_num='KA031181' and report_num=12; 

commit;
select * from participitated_101;

insert into accident_101 values(16,"2008-03-15","Dolmur");
select * from accident_101;

select accident_date,location
from accident_101;

select driver_id
from participitated_101
where damage_amount>=25000;

select count(report_num)
from car_101, participitated_101
where car_101.reg_num=participitated_101.reg_num and car_101.model='Lancer';

select count(distinct driver_id) CNT
from participitated_101, accident_101
where participitated_101.report_num=accident_101.report_num and accident_101.accident_date like '__08%';

SELECT * FROM participitated_101 ORDER BY damage_amount DESC;

SELECT AVG(damage_amount) FROM participitated_101;

DELETE FROM participitated_101 
WHERE damage_amount<(select avg(damage_amount) from participitated_101);

SELECT name FROM person_101, participitated_101
WHERE person_101.driver_id = participitated_101.driver_id
AND damage_amount>(SELECT AVG(damage_amount) FROM participitated_101);

SELECT MAX(damage_amount) FROM participitated_101;


