create database BluePrint
go
use Blueprint
go
create Table TipoClientes(
	ID int primary key identity(1,1) not null,
	Tipo varchar(50) not null
)
go
create table Clientes(
	ID int primary key identity(1,1) not null,
	RazonSocial varchar(50) not null,
	cuit varchar(11) unique not null,
	IDtipoCliente int foreign key references TipoClientes(ID) not null,
	Email varchar(50) null,
	Telefono varchar(13) null,
	Celular varchar(13) null,
)
go
create table Proyectos(
	ID int primary key identity(1,1) not null,
	IDCliente int foreign key references Clientes(ID) not null,
	Nombre varchar(50) not null,
	Descripcion varchar(512) null,
	FechaInicio date not null,
	FechaFin date null,
	Costo money check(Costo>0) not null,
	Estado bit not null,
	check (FechaInicio<FechaFin)
)