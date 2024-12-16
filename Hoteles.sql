create database reservas_hoteles;
use reservas_hoteles;

create table pago(
id int primary key auto_increment,
fecha date not null,
importe double not null,
metodo_pago enum ("tarjeta","efectivo","transferencia") not null
);

create table limpiadores(
id int primary key auto_increment,
nombre varchar(50) not null,
apellido varchar(100) not null,
salario double,
fecha_inicio date not null,
zona_asignada varchar(100) not null,
turno enum("mañana","tarde","noche") not null
);

create table administradores(
id int primary key auto_increment,
nombre varchar(50) not null,
apellido varchar(100) not null,
salario double,
fecha_inicio date not null,
departamento varchar(100),
nivel varchar(20)
);

create table reservas(
id int primary key auto_increment,
fecha_inicio date not null,
fecha_fin date not null,
estado enum("pendiente","confirmada","cancelada"),
id_pago int,
foreign key (id_pago) references pago(id)
);

create table clientes(
id int primary key auto_increment,
nombre varchar(50) not null,
apellido varchar(100) not null,
pais varchar(70),
correo_electronico varchar(50) not null,
codigo_postal int,
calle varchar(100),
ciudad varchar(100),
movil varchar(20),
fijo varchar(20),
id_reserva int,
foreign key (id_reserva) references reservas(id)
);

create table habitaciones(
id int primary key auto_increment,
numero int not null,
tipo varchar(50),
capacidad int default 1,
estado enum("disponible","reservada","mantenimiento"),
precio_noche double,
id_reserva int,
foreign key (id_reserva) references reservas(id)
);

create table hoteles(
id int primary key auto_increment,
nombre varchar(50) not null,
codigo_postal int,
pais varchar(70),
ciudad varchar(100),
calle varchar(100),
categoria varchar(10),
fijo varchar(20),
movil varchar(20),
id_empleado int,
id_habitacion int,
foreign key (id_empleado) references limpiadores(id),
foreign key (id_empleado) references administradores(id),
foreign key (id_habitacion) references habitaciones(id)
);











