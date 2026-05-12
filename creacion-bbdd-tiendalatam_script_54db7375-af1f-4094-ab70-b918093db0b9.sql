-- ============================================================
-- C10 · Creación de la Base de Datos TiendaLatam
-- Curso: SQL con PostgreSQL — TiendaLatam
-- IMPORTANTE: ejecutar conectado a la BD "postgres" (la default)
-- ============================================================

-- Crear la base de datos del curso
-- Convención PostgreSQL: nombres en minúsculas con guiones_bajos
CREATE DATABASE tiendalatam;
CREATE TABLE IF NOT EXISTS paises (
	paisID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	CodigoPais VARCHAR(5) NOT NULL,
	NombrePais Varchar(50) NOT NULL,
	Continente Varchar(50) Not Null
);

CREATE TABLE IF NOT EXISTS categorias (
	CategoriaID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NombreCategoria VARCHAR(50) NOT NULL,
	Descripcion TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS tipos_cliente (
	TipoClienteID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NombreTipo VARCHAR(50) NOT NULL UNIQUE,
	Descripcion TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS sucursales (
	SucursalID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NombreSucursal VARCHAR(150) NOT NULL,
	Ciudad Varchar(100),
	PaisID Integer References Paises(paisID),
	DireccionCompleta TEXT NOT NULL,
	Activo Boolean NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS empleados (
	EmpleadoID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Apellido VARCHAR(30) NOT NULL,
	Email Varchar(100) NOT NULL UNIQUE,
	SucursalID Integer References sucursales(SucursalID),
	FechaIngreso DATE,
	Cargo VARCHAR(50) NOT NULL,
	Activo Boolean NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS clientes (
	ClienteID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Apellido VARCHAR(30) NOT NULL,
	Email Varchar(100) NOT NULL UNIQUE,
	Telefono Varchar(50) NOT NULL,
	paisID INTEGER REFERENCES paises(paisId),
	Ciudad Varchar(50) NOT NULL,
	TipoClienteID Integer References tipos_cliente(tipoClienteID),
	FechaRegistro DATE,
	Activo Boolean NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS productos (
	ProductoID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	CodigoProducto VARCHAR(30) NOT NULL UNIQUE,
	NombreProducto VARCHAR(100) NOT NULL,
	categoriaId INTEGER REFERENCES categorias(categoriaID),
	precio Numeric(6,2) NOT NULL,
	Stock Integer,
	Descripcion Text,
	Activo Boolean NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS pedidos (
PedidoID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
clienteid INTEGER REFERENCES clientes(clienteid),
sucursalid INTEGER REFERENCES sucursales(sucursalid),
empleadoid INTEGER REFERENCES empleados(empleadoid),
fechapedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
estado VARCHAR(30) NOT NULL,
total Numeric(10,2),
notas Text
);

CREATE TABLE IF NOT EXISTS detalle_pedidos(
detalleid INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
pedidoid INTEGER REFERENCES pedidos(pedidoid),
productoid INTEGER REFERENCES productos(productoid),
cantidad INTEGER,
precioUnitario NUMERIC(10,2)

)