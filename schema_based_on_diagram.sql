create DATABASE clinic;


create table patients (
    id serial PRIMARY KEY,
    name varchar(50),
    date_of_birth date
);

create table invoices (
    id serial PRIMARY KEY,
    generated_at date,
    payed_at date,
    medical_histories_id integer references medical_histories(id)
);

create table treatments (
    id serial PRIMARY KEY,
    type varchar(50),
    name varchar(50)
);

create table medical_histories (
    id serial PRIMARY KEY,
    admitted_at date,
    patient_id integer references patients(id),
    status varchar(50)
);

create table histories_tratments (
    medical_histories_id integer references medical_histories(id),
    treatments_id integer references treatments(id)
);
   
   
create table invoice_items (
    id serial PRIMARY KEY,
    unit_price double precision,
    quantity integer,
    invoice_id integer references invoices(id),
    treatments_id integer references treatments(id)
);



