insert into car(
	car_id,
	make,
	model,
	year,
	car_priace 
) values(
	1,
	'Honda',
	'Accord',
	1994,
	6000.00
);

insert into customer(
	customer_id,
	first_name,
	last_name,
	address,
	payment_info
) values(
	2,
	'Peter',
	'Sherman',
	'42 Wallaby Way, Sydney, Australia 01234',
	'9876 5432 1123 4556 07/28 901'
);

insert into salesperson(
	sales_id,
	s_first_name,
	s_last_name,
	s_employ_year 
) VALUES(
	'001',
	'Dory',
	'Bluetang',
	'2009'
);

insert into mechanic(
	mech_id,
	m_first_name,
	m_last_name,
	m_employ_year 
) VALUES(
	3,
	'Marlin',
	'Clownfish',
	'2009'
);

insert into parts(
	part_id,
	part_name,
	part_price 
) VALUES(
	1,
	'Air Filter',
	25.00
);

insert into services(
	service_id,
	service_name 
) VALUES(
	1,
	'Oil Change'
);

insert into service_ticket(
	ticket_id,
	car_id,
	customer_id,
	mech_id,
	part_id,
	service_id,
	hours
) VALUES(
	'2001',
	1,
	2,
	3,
	1,
	1,
	1
);


insert into invoice(
	invoice_id,
	customer_id,
	car_id,
	sales_id,
	ticket_id,
	total
) values(
	'1001',
	2,
	1,
	001,
	'2001',
	0.00
);