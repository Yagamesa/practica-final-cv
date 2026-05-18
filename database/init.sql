CREATE DATABASE IF NOT EXISTS cvdb;

USE cvdb;

CREATE TABLE persona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    ciudad VARCHAR(100),
    foto VARCHAR(500)
);

CREATE TABLE formacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    institucion VARCHAR(255),
    anio VARCHAR(50),
    persona_id INT,
    FOREIGN KEY (persona_id) REFERENCES persona(id)
);

INSERT INTO persona (nombre, apellido, ciudad, foto)
VALUES (
    'Sebastian',
    'Eguez Mendoza',
    'Santa Cruz de la Sierra, Bolivia',
    'https://live.staticflickr.com/65535/55275825312_f24c27beb6_w.jpg'
);

INSERT INTO formacion (titulo, institucion, anio, persona_id)
VALUES
(
    'Ingeniería de Sistemas (Titulación en proceso)',
    'Universidad Privada Domingo Savio',
    '2026',
    1
),
(
    'Bachiller',
    'Colegio Privado Libertador Simón Bolívar',
    '2018',
    1
),
(
    'Excel Avanzado y Ofimática',
    'Cursos Complementarios',
    '2024',
    1
),
(
    'Ensamblaje y Mantenimiento de Computadoras',
    'Cursos Técnicos',
    '2023',
    1
);