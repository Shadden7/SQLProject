create database store;
use store;
create table countries (
code_ int primary key,
name_ varchar(20) unique, 
country_name varchar(20) not null
);

create table users(
id int primary key ,
full_name varchar(20),
email varchar(20) unique,
gender char(1) check (gender in ('M' or 'F')),
date_of_birth varchar(15),
created_at datetime default current_timestamp,
country_code int, 
FOREIGN KEY (country_code) REFERENCES countries (code_)
);

create table orders (
id int primary key,
user_id int,
status_ varchar(6) check (status_ in ('start' or 'finish')),
created_at datetime default current_timestamp,
foreign key (user_id) references users(id)
);

create table order_products (
order_id int ,
product_id int,
quantity int default 0,
foreign key (order_id) references orders (id),
foreign key (product_id) references product(id)
);

create table product (
id int primary key,
name_ varchar(10) not null,
price int default 0,
status_ varchar(10) check (status_ in ('valid' or 'expired')),
created_at datetime default current_timestamp
);
