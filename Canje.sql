CREATE DATABASE canje;

CREATE TABLE Articulo (
    id_articulo INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    subtipo VARCHAR(50) NOT NULL
);


CREATE TABLE Sucursal (
    id_sucursal INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);


CREATE TABLE Existencia (
    id_articulo INT NOT NULL,
    id_sucursal INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_articulo, id_sucursal),
    FOREIGN KEY (id_articulo) REFERENCES Articulo (id_articulo),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal (id_sucursal)
);


CREATE TABLE Promocion (
    id_promocion INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    puntos INT NOT NULL,
    observaciones VARCHAR(255)
);


CREATE TABLE ArticuloPromocion (
    id_articulo INT NOT NULL,
    id_promocion INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_articulo, id_promocion),
    FOREIGN KEY (id_articulo) REFERENCES Articulo (id_articulo),
    FOREIGN KEY (id_promocion) REFERENCES Promocion (id_promocion)
);


CREATE TABLE Canje (
    id_canje INT PRIMARY KEY,
    fecha DATE NOT NULL,
    observaciones VARCHAR(255)
);


CREATE TABLE CanjeArticuloPromocion (
    id_canje INT NOT NULL,
    id_articulo INT NOT NULL,
    id_promocion INT NOT NULL,
    canjeada INT NOT NULL,
    PRIMARY KEY (id_canje, id_articulo, id_promocion),
    FOREIGN KEY (id_canje) REFERENCES Canje (id_canje),
    FOREIGN KEY (id_articulo,  id_promocion) REFERENCES ArticuloPromocion (id_articulo, id_promocion)
); 


CREATE TABLE CanjeArticulo (
    id_canje INT NOT NULL,
    id_articulo INT NOT NULL,
    canjeada INT NOT NULL,
    PRIMARY KEY (id_canje, id_articulo),
    FOREIGN KEY (id_canje) REFERENCES Canje (id_canje),
    FOREIGN  KEY (id_articulo) REFERENCES Articulo (id_articulo)
);