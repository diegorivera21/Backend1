drop schema if exists negocio;
create schema negocio;


create table negocio.Clientes (
	idClientes int primary key not null auto_increment,
    Apellidos varchar(50) not null,
    Nombres varchar(50) not null,
    Direccion varchar(100),
    Ciudad varchar(30),
    Pais varchar(25),
    Celular char(8) not null,
    Fax char(9),
    Fecha_ingreso date,
    ind_vigente boolean
);

create table negocio.Articulo (
	idArticulo int primary key not null,
    descripcion varchar(120),
    precio_unitario float,
    stock int
);

create table negocio.Vendedor (
	idVendedor int primary key not null,
    nombre varchar(50)
);

create table negocio.Pedido (
	idPedido int primary key not null,
    idClientes int not null,
    idVendedor int not null,
    fecha_pedido date,
    subtotal float,
    total float,
    impuesto float,
    estado boolean,
    foreign key(idClientes) references Clientes(idClientes) on delete cascade,
    foreign key(idVendedor) references Vendedor(idVendedor) on delete cascade
);

create table negocio.Detalle_pedido (
    idPedido int primary key,
    idArticulo int primary key,
    cantidad int,
    precio float,
    subtotal float,
    foreign key(idPedido) references Pedido(idPedido) on delete cascade,
    foreign key(idArticulo) references Articulo(idArticulo) on delete cascade
);
