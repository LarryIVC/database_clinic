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
    total_price double precision,
    invoice_id integer references invoices(id),
    treatments_id integer references treatments(id)
);

create index idx_invoice_items on invoice_items(invoice_id, treatments_id);
create index idx_invoices on invoices(medical_histories_id);
create index idx_medical_histories on medical_histories(patient_id);
create index idx_histories_tratments on histories_tratments(medical_histories_id, treatments_id);




