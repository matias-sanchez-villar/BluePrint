create database BluePrint
go
use BluePrint
go
create table TipoCliente(
	ID int not null primary key identity (1,1),
	Tipo char(50) not null
)
go
create table Cliente(
	ID int not null primary key identity(1,1),
	RazonSocial char(50) not null,
	cuit int not null unique,
	IDTipoCliente int not null foreign key references TipoCliente(ID)
)
go
create table Contacto(
	ID int not null primary key foreign key references Cliente(ID),
	Email char(50) null unique,
	Telefono char(10) null unique,
	Celular char(10) null unique
)
go
create table Proyecto(
	ID int not null primary key identity(1,1),
	Nombre char(50) not null,
	IDCliente int not null foreign key references Cliente(ID),
	Estado bit not null
)
create table Descripcion(
	ID int not null primary key foreign key references Proyecto(ID),
	Descripcion char(200) not null
)
go
create table Costo(
	ID int not null primary key foreign key references Proyecto(ID),
	Costo money not null
)
go
create table Fecha(
	ID int not null primary key foreign key references Proyecto(ID),
	Inicio date not null,
	Fin date null
)


