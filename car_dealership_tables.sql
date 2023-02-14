create table car (
	car_id SERIAL primary key,
	make VARCHAR(100),
	model VARCHAR(100),
	year numeric(4),
	car_priace numeric(8,2)
);

create table parts(
	part_id SERIAL primary key,
	part_name VARCHAR(150),
	part_price numeric(6,2)
);

create table services(
	service_id SERIAL primary key,
	service_name VARCHAR(500)
);

create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	address VARCHAR(200),
	payment_info VARCHAR(150)
);

create table salesperson(
	sales_id SERIAL primary key,
	s_first_name VARCHAR(150),
	s_last_name VARCHAR(150),
	s_employ_year numeric(4)
);

create table mechanic(
	mech_id SERIAL primary key,
	m_first_name VARCHAR(150),
	m_last_name VARCHAR(150),
	m_employ_year numeric(4)
);

create table service_ticket(
	ticket_id SERIAL primary key,
	car_id integer not null,
	customer_id integer not null,
	mech_id integer not null,
	part_id integer not null,
	service_id integer not null,
	hours numeric(6,2),
	foreign key(car_id) references car(car_id),
	foreign key(customer_id) references customer(customer_id),
	foreign key(mech_id) references mechanic(mech_id),
	foreign key(part_id) references parts(part_id),
	foreign key(service_id) references services(service_id)
);


create table invoice(
	invoice_id SERIAL primary key,
	customer_id integer not null,
	car_id integer not null,
	sales_id integer not null,
	ticket_id integer not null,
	total numeric(12,2),
	foreign key(customer_id) references customer(customer_id),
	foreign key(car_id) references car(car_id),
	foreign key(sales_id) references salesperson(sales_id),
	foreign key(ticket_id) references service_ticket(ticket_id)
);

create or replace procedure oilChange(
	car_sn integer,
	oilChangeCharge DECIMAL	
)
language plpgsql
as $$
begin 
	-- Add Oil Change to Invoice --
	update invoice 
	set total = total + oilChangeCharge
	where car_id = car_sn;

	commit;
end;
$$

call oilChange(1, 65.00);

select * from invoice where car_id = 1;

create or replace function add_customer(customer_id_ INTEGER,first_name_ VARCHAR,last_name_ VARCHAR,address_ VARCHAR,payment_info_ VARCHAR)
returns void
as $MAIN$
begin
	insert into customer(customer_id,first_name,last_name,address,payment_info)
	VALUES(customer_id_,first_name_,last_name_,address_,payment_info_);
end;
$MAIN$
language plpgsql;

select add_customer(1,'Nemo','Clownfish','12 Dropoff Way, Pacific Ocean, 20132','4378 2390 8475 0923 09/22 856');

select * from customer;
