-- ============================================================
-- C20 · ORDER BY, LIMIT y paginación
-- Curso: SQL con PostgreSQL — TiendaLatam
-- ============================================================
CREATE TABLE IF NOT EXISTS productos (
    producto_id    INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre         VARCHAR(150) NOT NULL,
    categoria_id   INTEGER NOT NULL,
    precio         NUMERIC(10,2) NOT NULL,
    stock          INTEGER NOT NULL DEFAULT 0,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================================
-- TABLA: pedidos
-- ==========================================================

CREATE TABLE IF NOT EXISTS pedidos (
    pedido_id  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id INTEGER NOT NULL,
    fecha      TIMESTAMP NOT NULL,
    total      NUMERIC(12,2) NOT NULL DEFAULT 0
);

--TABLA DE CLIENTES

CREATE TABLE IF NOT EXISTS clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    fecha_afiliacion DATE NOT NULL,
    activo BOOLEAN DEFAULT TRUE
);

INSERT INTO clientes (nombre, apellido, correo, fecha_afiliacion, activo) VALUES
('Mateo', 'García', 'mateo.garcia@email.com', '2025-07-12', TRUE),
('Valeria', 'Martínez', 'valeria.mtz@email.com', '2025-07-28', TRUE),
('Santiago', 'Rodríguez', 'santi.rod@email.com', '2025-08-05', FALSE),
('Lucía', 'López', 'lucia.lopez@email.com', '2025-08-20', TRUE),
('Sebastián', 'Hernández', 'sebas.her@email.com', '2025-09-02', TRUE),
('Mariana', 'González', 'mariana.gonz@email.com', '2025-09-15', TRUE),
('Nicolás', 'Pérez', 'nico.perez@email.com', '2025-10-10', FALSE),
('Camila', 'Sánchez', 'cami.sanchez@email.com', '2025-10-25', TRUE),
('Alejandro', 'Ramírez', 'alejo.ram@email.com', '2025-11-03', TRUE),
('Isabella', 'Torres', 'isabella.t@email.com', '2025-11-18', TRUE),
('Daniel', 'Flores', 'dan.flores@email.com', '2025-12-05', TRUE),
('Sofía', 'Morales', 'sofia.mo@email.com', '2025-12-22', FALSE),
('Andrés', 'Castillo', 'andres.cas@email.com', '2026-01-08', TRUE),
('Gabriela', 'Vargas', 'gaby.vargas@email.com', '2026-01-14', TRUE),
('Leonardo', 'Castro', 'leo.castro@email.com', '2026-02-02', TRUE),
('Valentina', 'Ortiz', 'valen.ortiz@email.com', '2026-02-19', TRUE),
('Felipe', 'Ruiz', 'felipe.ruiz@email.com', '2026-03-05', FALSE),
('Elena', 'Jiménez', 'elena.jim@email.com', '2026-03-12', TRUE),
('Samuel', 'Ríos', 'samuel.rios@email.com', '2026-03-20', TRUE),
('Paula', 'Mendoza', 'paula.mendoza@email.com', '2026-03-28', TRUE);

-- ==========================================================
-- INSERTS: productos
-- ==========================================================

INSERT INTO productos (nombre, categoria_id, precio, stock) VALUES
('Aceite de Oliva Extra Virgen 500ml', 1, 8.90, 40),
('Arroz Grano Largo 1kg', 1, 2.40, 120),
('Azucar Rubia 1kg', 1, 1.95, 90),
('Café Molido Premium 250g', 1, 6.80, 55),
('Fideos Spaghetti 500g', 1, 1.50, 150),
('Harina Integral 1kg', 1, 2.10, 80),
('Leche Entera 1L', 1, 1.25, 200),
('Sal Marina 500g', 1, 0.95, 140),
('Audifonos Bluetooth', 2, 29.99, 35),
('Cargador USB-C 25W', 2, 14.50, 70),
('Mouse Inalambrico', 2, 18.90, 60),
('Monitor 24 Pulgadas', 2, 159.99, 15),
('Notebook 14 Pulgadas', 2, 649.00, 10),
('Teclado Mecanico', 2, 54.75, 25),
('Webcam Full HD', 2, 39.90, 28),
('Disco SSD 1TB', 2, 89.99, 20),
('Camisa Blanca Hombre', 3, 24.90, 50),
('Chaqueta Denim Mujer', 3, 49.90, 18),
('Jeans Slim Fit', 3, 34.50, 45),
('Polera Basica Negra', 3, 12.99, 100),
('Zapatillas Urbanas', 3, 59.90, 30),
('Calcetines Pack x3', 3, 7.25, 110),
('Bufanda Lana', 3, 15.40, 22),
('Gorra Deportiva', 3, 13.60, 40),
('Silla de Oficina', 4, 129.90, 12),
('Escritorio Melamina', 4, 199.00, 8),
('Lampara de Escritorio', 4, 22.80, 33),
('Organizador de Cajones', 4, 11.50, 65),
('Estante Modular', 4, 89.40, 14),
('Cojin Decorativo', 4, 9.90, 75),
('Mesa Lateral', 4, 45.00, 16),
('Alfombra Pequeña', 4, 27.30, 21),
('Balon de Futbol', 5, 19.90, 26),
('Bicicleta Urbana', 5, 320.00, 6),
('Mancuernas 10kg', 5, 42.50, 19),
('Mat de Yoga', 5, 17.80, 31),
('Botella Deportiva 1L', 5, 8.40, 85),
('Casco de Ciclismo', 5, 36.70, 17),
('Guantes de Entrenamiento', 5, 16.20, 29),
('Cuerda para Saltar', 5, 6.95, 54);

-- ==========================================================
-- INSERTS: pedidos
-- ==========================================================

INSERT INTO pedidos (cliente_id, fecha, total) VALUES
(101, '2026-02-10 09:15:00', 125.90),
(102, '2026-02-11 11:40:00', 89.50),
(103, '2026-02-12 16:05:00', 240.00),
(104, '2026-02-13 13:20:00', 58.75),
(105, '2026-02-14 18:45:00', 315.30),
(106, '2026-02-15 10:10:00', 44.90),
(107, '2026-02-16 17:35:00', 199.99);

-- ORDER BY básico: ascendente (por defecto)
SELECT nombre, precio
FROM productos
ORDER BY precio;

SELECT nombre, precio
FROM productos
ORDER BY precio DESC; 

--ORDER BY MULTUIPLES COLUMNAS
SELECT nombre  ,categoria_id, precio
FROM productos
ORDER BY categoria_id DESC, precio ASC; 

--TOP DE PRODUCTOS POR PRECIO

SELECT nombre, precio
FROM productos
ORDER BY precio DESC
LIMIT 10; 

SELECT pedido_id, cliente_id, fecha
FROM pedidos
ORDER BY fecha DESC 
LIMIT 4;

--OFSET LIMIT + OFSET PAGINACION
-- BLOQUES DE 10 PRODUCTOS EMPEZANDO DEL 1-10
SELECT nombre, precio
FROM productos
ORDER BY precio
LIMIT 10 OFFSET 0;

--11 AL 20
SELECT nombre, precio
FROM productos
ORDER BY precio
LIMIT 10 OFFSET 10;

SELECT nombre, precio
FROM productos
ORDER BY precio
LIMIT 10 OFFSET 20;


--ORDER BY PARA DATOS NULLOS
SELECT nombre, precio
FROM productos
ORDER BY precio ASC;

-- CLIENTES MAS RECIENTES
SELECT nombre, apellido, fecha_afiliacion
FROM clientes
ORDER BY fecha_afiliacion DESC;

--TOP 5 PRODUCTOS MAS CAROS
SELECT nombre, categoria_id, precio
FROM productos
ORDER BY precio DESC
LIMIT 5; 

--TOP 3 PEDIDOS RECIENTES
SELECT cliente_id, fecha
FROM pedidos
ORDER BY fecha DESC
LIMIT 3; 



























