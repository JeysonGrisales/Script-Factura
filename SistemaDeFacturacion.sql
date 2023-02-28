CREATE DATABASE SistemaDeFacturacion;

USE SistemaDeFacturacion;

CREATE TABLE Categoria(
	idCategoria int IDENTITY PRIMARY KEY,
	nombre varchar(20) NOT NULL,
	descripcion varchar(60) NOT NULL
)

CREATE TABLE Proveedor(
	idProveedor varchar(15) PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	direccion varchar(60) NOT NULL,
	empresa varchar(30) NOT NULL
)

CREATE TABLE Empleado(
	idEmpleado varchar(15) PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	telefono varchar(15) NOT NULL,
	edad int NOT NULL,
	direccion varchar(60) NOT NULL
)
CREATE TABLE Cliente(
	Cedula varchar(15) PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	telefono varchar(15) NOT NULL,
	direccion varchar(60) NOT NULL
)

CREATE TABLE Producto(
	idProducto varchar(15) PRIMARY KEY,
	nombre varchar(20) NOT NULL,
	peso float NOT NULL,
	color varchar(20) NOT NULL,
	marca varchar(20) NOT NULL,
	imgEmpresa varchar(100) NOT NULL,
	valor float NOT NULL,
	existencia bit,
	idCategoria int,
	FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
)
CREATE TABLE FacturaVenta(
	idFactura varchar(15) PRIMARY KEY,
	fecha DATETIME NOT NULL,
	total float,
	subTotal float,
	iva float,
	idEmpleado varchar(15),
	cedula_C varchar(15),
	FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
	FOREIGN KEY (cedula_C) REFERENCES Cliente(Cedula)
)
CREATE TABLE FacturaCompra(
	idFactura varchar(15) PRIMARY KEY,
	fecha DATETIME NOT NULL,
	total float,
	subTotal float,
	iva float,
	idEmpleado varchar(15),
	idProveedor varchar(15),
	FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
	FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
)
CREATE TABLE Producto_FacturaV(
	cantidad int NOT NULL,
	valorTotal float,
	idProducto varchar(15),
	idFactura varchar(15),
	FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
	FOREIGN KEY (idFactura) REFERENCES FacturaVenta(idFactura),
	PRIMARY KEY (idProducto,idFactura)
)
CREATE TABLE Producto_FacturaC(
	cantidad int NOT NULL,
	valorTotal float,
	idProducto varchar(15),
	idFactura varchar(15),
	FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
	FOREIGN KEY (idFactura) REFERENCES FacturaCompra(idFactura),
	PRIMARY KEY (idProducto,idFactura)
)

CREATE TABLE Telefono(
	idTelefono int IDENTITY PRIMARY KEY,
	NoTelefono varchar(15) NOT NULL,
	idProveedor varchar(15),
	FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor),
)