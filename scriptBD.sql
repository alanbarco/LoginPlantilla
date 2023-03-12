drop table if exists factura;
drop table if exists ticket;
drop table if exists usuario;
drop table if exists tipotrabajo;

create table usuario(
	id_usuario serial,
	nombre varchar(150) not null,
	email varchar(100) not null,
	clave varchar(150) not null,
	estado varchar(1) not null,
	roles json,
	CONSTRAINT id_usuario PRIMARY KEY (id_usuario)
);

create table tipotrabajo(
	id_tipo serial,
	descripcion varchar(150) not null,
	valorHora real,
	estado varchar(1) not null,
	CONSTRAINT id_tipo PRIMARY KEY (id_tipo)
);
CREATE TABLE IF NOT EXISTS ticket
(
    id_ticket serial,
    id_usuario integer not null,
    id_tipo integer,
	descripcion varchar(150) not null,
	horas_inv integer,
    estado character varying(1) NOT NULL,
	costo float,
    CONSTRAINT id_ticket PRIMARY KEY (id_ticket),
    CONSTRAINT fk_tipo FOREIGN KEY (id_tipo)  REFERENCES tipotrabajo(id_tipo),
    CONSTRAINT fk_usuario FOREIGN KEY (id_usuario)  REFERENCES usuario(id_usuario)
);
CREATE TABLE IF NOT EXISTS factura
(
    id_factura serial,
    id_usuario integer not null,
    id_ticket integer not null,
	costoTotal real,
    estado character varying(1) NOT NULL,
    CONSTRAINT id_factura PRIMARY KEY (id_factura),
    CONSTRAINT fk_ticket FOREIGN KEY (id_ticket)  REFERENCES ticket(id_ticket),
    CONSTRAINT fk_usuario FOREIGN KEY (id_usuario)  REFERENCES usuario(id_usuario)
);

select * from usuario;
select * from ticket;
select * from tipotrabajo;
insert into tipotrabajo(descripcion, valorhora, estado) values('Mantenimiento', 20, 'A');
insert into tipotrabajo(descripcion, valorhora, estado) values('Cambio', 30, 'A');
insert into tipotrabajo(descripcion, valorhora, estado) values('Limpieza', 10, 'A');