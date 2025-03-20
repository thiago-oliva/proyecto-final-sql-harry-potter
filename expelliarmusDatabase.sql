-- Borrar en caso de que exista la base
DROP DATABASE IF EXISTS expelliarmusDatabase;

-- Creación de la base de datos
CREATE DATABASE expelliarmusDatabase;

-- Nos ubicamos en la base de datos
USE expelliarmusDatabase;

-- _________________TABLAS_________________
-- Tabla de Personajes
CREATE TABLE IF NOT EXISTS Personajes (
    id_personaje INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    habilidades TEXT,
    nivel INT NOT NULL
);

-- Tabla de Varitas
CREATE TABLE IF NOT EXISTS Varitas (
    id_varita INT PRIMARY KEY AUTO_INCREMENT,
    material VARCHAR(100),
    nucleo VARCHAR(100),
    longitud DECIMAL(5,2),
    fuerza DECIMAL(5,2) NOT NULL
);

-- Tabla de Hechizos
CREATE TABLE IF NOT EXISTS Hechizos (
    id_hechizo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    efecto VARCHAR(255), 
    duracion INT ,
    fuerza DECIMAL(5,2) NOT NULL
);

-- Tabla de pociones
CREATE TABLE IF NOT EXISTS Pociones (
    id_pocion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    efecto VARCHAR(255), 
    duracion INT ,
    fuerza DECIMAL(5,2) NOT NULL
);

-- Tabla de Objetos Mágicos
CREATE TABLE IF NOT EXISTS Objetos (
    id_objeto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    efecto VARCHAR(255), 
    duracion INT ,
    fuerza DECIMAL(5,2) NOT NULL
);

-- Tabla de localizaciones
CREATE TABLE IF NOT EXISTS Localizaciones (
    id_localizacion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    tipo VARCHAR(100), 
    descripcion TEXT
);

-- Tabla de Bandos
CREATE TABLE IF NOT EXISTS Bandos (
    id_bando INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    lider VARCHAR(100)
);

-- Relación entre Personajes y Bandos
CREATE TABLE IF NOT EXISTS Personajes_Bandos (
    id_personaje INT,
    id_bando INT,
    PRIMARY KEY (id_personaje, id_bando),
    FOREIGN KEY (id_personaje) REFERENCES Personajes(id_personaje),
    FOREIGN KEY (id_bando) REFERENCES Bandos(id_bando)
);

-- Tabla de Enfrentamientos
CREATE TABLE IF NOT EXISTS Enfrentamientos (
    id_enfrentamiento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    fecha DATE NOT NULL,
    id_localizacion INT,
    FOREIGN KEY (id_localizacion) REFERENCES Localizaciones(id_localizacion)
);

-- Tabla para registrar a los personajes en los enfrentamientos
CREATE TABLE IF NOT EXISTS Personajes_Enfrentamientos (
    id_enfrentamiento INT,
    id_varita INT NULL,
    id_hechizo INT NULL,
    id_pocion INT NULL,
    id_objeto INT NULL,
    id_personaje INT,
    equipo VARCHAR(10) CHECK (equipo IN ('buenos', 'malos')),
    PRIMARY KEY (id_enfrentamiento, id_personaje),
    FOREIGN KEY (id_enfrentamiento) REFERENCES Enfrentamientos(id_enfrentamiento),
    FOREIGN KEY (id_varita) REFERENCES Varitas(id_varita),
    FOREIGN KEY (id_hechizo) REFERENCES Hechizos(id_hechizo),
    FOREIGN KEY (id_pocion) REFERENCES Pociones(id_pocion),
    FOREIGN KEY (id_objeto) REFERENCES Objetos(id_objeto),
    FOREIGN KEY (id_personaje) REFERENCES Personajes(id_personaje)
);


-- ___________________RELLENO DE TABLAS___________________
-- Relleno de la tabla Personajes
INSERT INTO Personajes (nombre, habilidades, nivel)
VALUES
('Harry Potter', 'Líder nato, Defensa contra las Artes Oscuras, Vuelo en escoba', 95),
('Hermione Granger', 'Extremadamente inteligente, Memoria fotográfica, Multitarea mágica', 100),
('Ron Weasley', 'Estratega, Lealtad inquebrantable, Defensa contra las Artes Oscuras', 85),
('Draco Malfoy', 'Manipulación, Vuelo en escoba, Magia Oscura básica', 75),
('Albus Dumbledore', 'Mago extraordinario, Transfiguración, Hechizos avanzados', 100),
('Severus Snape', 'Oclumancia, Pociones, Defensa contra las Artes Oscuras', 95),
('Rubeus Hagrid', 'Cuidado de criaturas mágicas, Fuerza física', 80),
('Minerva McGonagall', 'Transfiguración avanzada, Liderazgo', 90),
('Neville Longbottom', 'Herbología, Defensa contra las Artes Oscuras', 70),
('Luna Lovegood', 'Empatía, Observación, Defensa contra las Artes Oscuras', 75),
('Bellatrix Lestrange', 'Magia Oscura avanzada, Duelos mágicos', 95),
('Voldemort', 'Magia Oscura, Manipulación mental, Oclumancia', 100),
('Ginny Weasley', 'Vuelo en escoba, Hechizos defensivos, Duelos mágicos', 85),
('Fred Weasley', 'Bromas mágicas, Estrategia en duelo', 80),
('George Weasley', 'Bromas mágicas, Estrategia en duelo', 80),
('Sirius Black', 'Animago, Duelos mágicos, Defensa contra las Artes Oscuras', 90),
('Fleur Delacour', 'Encantamientos, Hechizos defensivos', 80),
('Cedric Diggory', 'Duelos mágicos, Vuelo en escoba', 85),
('Cho Chang', 'Vuelo en escoba, Duelos mágicos', 75),
('Lucius Malfoy', 'Magia Oscura, Manipulación', 85),
('Nymphadora Tonks', 'Metamorfomagia, Duelos mágicos, Defensa contra las Artes Oscuras', 80),
('Horace Slughorn', 'Pociones, Conexiones sociales', 80),
('Dolores Umbridge', 'Magia autoritaria, Defensa contra las Artes Oscuras', 75),
('Peter Pettigrew', 'Animago, Traición', 65),
('Alastor Moody', 'Auror, Duelos mágicos, Defensa contra las Artes Oscuras', 90),
('Lily Potter', 'Magia defensiva, Encantamientos poderosos', 85),
('James Potter', 'Animago, Vuelo en escoba, Duelos mágicos', 90),
('Molly Weasley', 'Magia doméstica, Hechizos defensivos', 89),
('Arthur Weasley', 'Magia experimental, Defensa contra las Artes Oscuras', 75),
('Kingsley Shacklebolt', 'Auror, Duelos mágicos', 90),
('Gilderoy Lockhart', 'Encantamientos de memoria, Publicidad', 65),
('Quirinus Quirrell', 'Magia Oscura, Defensa contra las Artes Oscuras', 70),
('Barty Crouch Jr.', 'Magia Oscura, Manipulación', 85),
('Victor Krum', 'Vuelo en escoba, Duelos mágicos', 80),
('Percy Weasley', 'Administración mágica, Hechizos defensivos', 75),
('Bill Weasley', 'Maldiciones rompedoras, Defensa contra las Artes Oscuras', 85),
('Charlie Weasley', 'Cuidado de dragones, Duelos mágicos', 80),
('Lavender Brown', 'Adivinación, Encantamientos', 60),
('Parvati Patil', 'Adivinación, Encantamientos', 65),
('Seamus Finnigan', 'Explosiones accidentales, Encantamientos', 70),
('Pansy Parkinson', 'Manipulación social, Encantamientos', 60),
('Gregory Goyle', 'Magia Oscura básica, Fuerza física', 55),
('Vincent Crabbe','Magia Oscura básica, Fuerza física', 55),
('Filius Flitwick', 'Encantamientos avanzados, Duelos mágicos', 90),
('Pomona Sprout', 'Herbología, Hechizos curativos', 80),
('Sybil Trelawney', 'Adivinación, Profecías', 60),
('Argus Filch', 'Cuidado del castillo, Castigos', 40),
('Fenrir Greyback', 'Licantropía, Fuerza física, Magia Oscura', 85),
('Cornelius Fudge', 'Política mágica, Administración', 60),
('Alecto Carrow', 'Magia Oscura, Tortura mágica', 80),
('Amycus Carrow', 'Magia Oscura, Tortura mágica', 80),
('Andromeda Tonks', 'Magia avanzada, Hechizos defensivos', 80),
('Regulus Black', 'Magia Oscura, Encantamientos', 75),
('Dobby', 'Elfo doméstico, Magia elfica', 70),
('Remus Lupin', 'Hombre Lobo', 75),
('Barty Crouch Sr.', 'Administración mágica, Leyes mágicas', 80),
('Walburga Black', 'Magia Oscura, Hechizos protectores', 70),
('Nick Casi Decapitado', 'Empatía, Historia de Hogwarts', 50),
('El Fraile Gordo', 'Historia de la magia, Herbología', 50),
('La Dama Gris', 'Sabiduría ancestral, Adivinación', 50),
('El Barón Sanguinario', 'Magia Oscura, Terror psicológico', 60),
('Aurora Sinistra', 'Astronomía, Magia estelar', 75),
('Rodolphus Lestrange', 'Magia oscura. Maldiciones y encantamientos', 75),
('Basilisco','Mirada petrificante, gran fuerza', 40),
('Walden Macnair', 'Maldición de la Muerte', 66),
('Antonin Dolohov', 'Maldición Cruciatus', 72),
('Troll', 'Gran fuerza física, resistencia', 33),
('Acromántula', 'Escalar, veneno mortal', 37),
('Fenrir Greyback', 'Poderes oscuros', 74),
('Unicornio', 'Curación, velocidad', 26),
('Manticora', 'Veneno, vuelo', 42),
('Hombre Lobo', 'Fuerza aumentada de luna llena', 35),
('Boggart', 'Transformación, confundir', 17),
('Dementor', 'Absorber felicidad, volar', 35),
('Colacuerno Húngaro', 'Las llamas pueden llegar a temperaturas extremamante altas', 11),
('Crup', 'Agilidad, lealtad a los magos', 9),
('Naga', 'Invisibilidad, manipulación del agua', 22),
('Grindylows','Poderes subacuáticos', 60),
('Nagini','Veneno', 50),
('Guardias de Gringotts','Guardianes', 30);

-- Relleno de la tabla Varitas
INSERT INTO Varitas (material, nucleo, longitud, fuerza)
VALUES
('Madera de Sauce', 'Pelo de Unicornio', 13.00, 8),
('Madera de Olivo', 'Pluma de Fénix', 12.75, 8.0),
('Madera de Caoba', 'Corazón de Dragón', 12.00, 9.5),
('Madera de Acacia', 'Pluma de Fénix', 14.00, 7.0),
('Madera de Tejo', 'Núcleo de Dragón', 13.50, 8.9),
('Madera de Ébano', 'Pluma de Fénix', 11.50, 8.5),
('Madera de Abeto', 'Pelo de Unicornio', 10.00, 6.0),
('Madera de Roble', 'Corazón de Dragón', 12.25, 8.0),
('Madera de Aliso', 'Pelo de Unicornio', 12.50, 7.5),
('Madera de Cedro', 'Núcleo de Dragón', 13.25, 8.0),
('Madera de Abeto', 'Pelo de Dragón', 11.75, 7.0),
('Madera de Pino', 'Pluma de Fénix', 12.00, 7.5),
('Madera de Haya', 'Pelo de Unicornio', 11.25, 6.5),
('Madera de Sauce', 'Núcleo de Dragón', 14.50, 9.0),
('Madera de Encina', 'Pelo de Fénix', 10.50, 7.0);

-- Relleno de la tabla Hechizos
INSERT INTO Hechizos (nombre, efecto, duracion, fuerza)
VALUES
('Expelliarmus', 'Desarma al oponente', 10, 7.5),
('Stupefy', 'Aturde al objetivo', 10, 8.0),
('Lumos', 'Crea luz', 10, 1.5),
('Nox', 'Apaga la luz', 10, 1.0),
('Accio', 'Atrae objetos hacia el lanzador', 10, 6.0),
('Aguamenti', 'Crea agua', 10, 5.0),
('Protego', 'Crea un escudo protector', 15, 7.0),
('Expecto Patronum', 'Invoca un Patronus', 20, 9.0),
('Petrificus Totalus', 'Inmoviliza al objetivo', 15, 8.5),
('Avada Kedavra', 'Muerte instantánea', 10, 10.0),
('Crucio', 'Causa un dolor extremo', 10, 9.0),
('Imperio', 'Controla a la víctima', 10, 9.5),
('Wingardium Leviosa', 'Levanta objetos', 15, 6.5),
('Obliviate', 'Borra la memoria', 10, 8.0),
('Riddikulus', 'Transforma un Boggart en algo gracioso', 10, 7.0),
('Incendio', 'Crea fuego', 15, 8.5),
('Sectumsempra', 'Causa cortes en el objetivo', 10, 9.0),
('Diffindo', 'Corta objetos', 10, 7.0),
('Engorgio', 'Aumenta el tamaño de un objeto', 15, 6.5),
('Reducio', 'Reduce el tamaño de un objeto', 15, 6.5),
('Rennervate', 'Revive a una persona aturdida', 10, 6.0),
('Aresto Momentum', 'Ralentiza o detiene un objeto o persona', 10, 7.0),
('Aparecium', 'Revela tinta invisible', 10, 5.5),
('Muffliato', 'Crea un zumbido para ocultar conversaciones', 10, 5.0),
('Episkey', 'Cura heridas leves', 10, 6.5),
('Protego Horribilis', 'Defensa mágica avanzada', 15, 8.0);

-- Relleno de la tabla Pociones
INSERT INTO Pociones (nombre, efecto, duracion, fuerza)
VALUES
('Poción de la Vida', 'Restaura la salud y la vitalidad', 60, 10.0),
('Poción de Amor', 'Causa sentimientos de amor y afecto', 30, 8.0),
('Poción de Invisibilidad', 'Otorga invisibilidad temporal', 20, 9.0),
('Poción de Fortalecimiento', 'Aumenta la fuerza y resistencia', 30, 7.5),
('Poción de Sueño Profundo', 'Induce un sueño profundo y reparador', 60, 6.0),
('Poción de Transformación', 'Permite transformarse en otro ser', 30, 8.5),
('Poción de Recuerdo', 'Permite recordar cosas olvidadas', 15, 7.0),
('Poción de Despiste', 'Causa confusión en la mente de la persona', 25, 7.5),
('Poción de Crecimiento', 'Aumenta temporalmente el tamaño del objeto o persona', 20, 8.0),
('Poción de Sanación', 'Cura heridas y enfermedades', 10, 9.0),
('Poción de Metamorfomagia', 'Permite cambios en la apariencia física', 30, 7.0),
('Poción Antídoto', 'Neutraliza venenos y efectos tóxicos', 15, 9.5),
('Poción de Agilidad', 'Aumenta temporalmente la agilidad y reflejos', 20, 7.0),
('Poción de Fuego Fatuo', 'Crea luces flotantes que guían a las personas', 10, 5.0),
('Poción de Polvo de Hadas', 'Permite volar temporalmente', 15, 8.0),
('Poción de Felicidad', 'Mejora el estado de ánimo y trae buena suerte', 30, 7.5),
('Poción de Desilusión', 'Crea un efecto de camuflaje', 20, 9.0),
('Poción de Memoria', 'Permite borrar o alterar recuerdos específicos', 25, 8.5),
('Poción de Larga Vida', 'Prolonga la vida de la persona', 60, 10.0),
('Poción de Veela', 'Otorga características de las veelas', 30, 8.5),
('Poción de Resistencia', 'Aumenta la resistencia física', 20, 7.0),
('Poción de Cambio de Voz', 'Cambia la voz a la de otra persona', 15, 6.5);

-- Relleno de tabla Objetos Mágicos
INSERT INTO Objetos (nombre, efecto, duracion, fuerza)
VALUES
('Capa de Invisibilidad', 'Otorga invisibilidad al usuario', 60, 9.5),
('Mapa del Merodeador', 'Muestra la ubicación de todas las personas en Hogwarts', 0, 0.0),
('Varita de Saúco', 'Varita extremadamente poderosa', 0, 10.0),
('Espejo de Oesed', 'Muestra lo que el usuario más desea', 0, 0.0),
('Copa de los Fundadores', 'Otorga habilidades mágicas al poseedor', 0, 8.0),
('Horrocrux', 'Contiene parte del alma del creador, otorga inmortalidad', 0, 10.0),
('Diadema de Ravenclaw', 'Aumenta la inteligencia y habilidades mágicas', 0, 8.5),
('Cámara de los Secretos', 'Contiene un monstruo que puede ser liberado', 0, 9.0),
('Gema del Fénix', 'Permite la resurrección temporal', 0, 9.0),
('Gafas de Adivinación', 'Permiten ver visiones del futuro', 15, 7.0),
('Reloj de Tiempo', 'Permite viajar en el tiempo', 10, 9.0),
('Sapo de bolsillo', 'Se convierte en un sapo real cuando se utiliza', 0, 6.5),
('Peluca Mágica', 'Cambia la apariencia del usuario', 30, 7.5),
('Bolsa Sin Fondo', 'Almacena objetos sin límite de espacio', 0, 8.0),
('Cálice de Fuego', 'Selecciona a los campeones para el Torneo de los Tres Magos', 0, 8.5),
('Bertie Bott''s Every Flavor Beans', 'Granos de jelly beans con todos los sabores', 0, 2.0),
('Escoba Nimbus 2000', 'Permite volar, utilizada en Quidditch', 0, 7.0),
('Félix Felicis', 'Proporciona buena suerte durante un período', 30, 8.5),
('Espada de Gryffindor','es una excelente arma para atacar bajo los poderes de Gryffindor', 0, 12);

-- Relleno de tabla de Bandos
INSERT INTO Bandos (nombre, lider)
VALUES
('Orden del Fénix', 'Albus Dumbledore'),
('Mortífagos', 'Lord Voldemort'),
('Ministerio de Magia', 'Cornelius Fudge'),
('Hogwarts', 'Minerva McGonagall'),
('Casa Gryffindor', 'Harry Potter'),
('Casa Slytherin', 'Draco Malfoy'),
('Casa Hufflepuff', 'Cedric Diggory'),
('Casa Ravenclaw', 'Luna Lovegood'),
('Dumbledore''s Army', 'Harry Potter'),
('Los Siete Potters', 'Harry Potter');

-- Relleno de la tabla Localizacion
INSERT INTO Localizaciones (nombre, tipo, descripcion)
VALUES
('Hogwarts', 'Castillo', 'La famosa escuela de magia y hechicería, escenario de numerosos enfrentamientos, incluyendo la Batalla de Hogwarts.'),
('Cementerio de Little Hangleton', 'Cementerio', 'El lugar donde Voldemort resucita y se enfrenta a Harry Potter.'),
('Sala de los Misterios', 'Ministerio de Magia', 'Un lugar misterioso donde se lleva a cabo una batalla entre jóvenes magos y Mortífagos.'),
('Torre de Astronomía', 'Castillo', 'El lugar donde se lleva a cabo el enfrentamiento entre Severus Snape y Albus Dumbledore.'),
('Mansión Malfoy', 'Mansión', 'El lugar donde Harry y sus amigos son capturados por los Mortífagos.'),
('Cámara de los Secretos', 'Cueva', 'La ubicación donde Harry se enfrenta al Basilisco para salvar a Ginny.'),
('El Callejón Diagon', 'Zona Comercial', 'Un callejón oscuro y peligroso donde se comercializan objetos oscuros y se realizan encuentros clandestinos.'),
('Cabaña de Hagrid', 'Cabaña', 'El lugar donde Hagrid y Harry luchan contra Mortífagos.'),
('Casa de los Potter', 'Casa', 'El lugar donde Voldemort asesina a James y Lily Potter.'),
('Torneo de los Tres Magos', 'Competencia', 'El evento mágico donde Harry compite y enfrenta a criaturas mágicas en varias pruebas.'),
('Expreso Hogwarts', 'Tren', 'El tren que traslada a los estudiantes a la escuela Hogwarts.'),
('Bosque prohibido', 'Bosque', 'Bosque cerca de Hogwarts.'),
('Estadio de Dartmoor', 'Estadio', 'Estadio construido para la final de la Copa Mundial de Quidditch.'),
('Madriguera', 'Casa', 'La residencia de la familia Weasley, hogar de numerosas aventuras y encuentros.'),
('Cielo sobre Inglaterra', 'Cielo', 'El espacio aéreo donde se lleva a cabo la Batalla de los Siete Potters.'),
('Gringotts', 'Banco', 'El banco de los magos, atacado por Voldemort y sus seguidores.');

-- Tabla personajes_bandos
INSERT INTO personajes_bandos (id_personaje, id_bando) VALUES
(1, 1), -- Harry Potter a la Orden del Fénix
(1, 9), -- Harry Potter a Dumbledore's Army
(1, 5), -- Harry Potter a Casa Gryffindor
(1, 10), -- Harry Potter a Los Siete Potters
(2, 1), -- Hermione Granger a la Orden del Fénix
(2, 9), -- Hermione Granger a Dumbledore's Army
(2, 5), -- Hermione Granger a Casa Gryffindor
(2, 10), -- Hermione Granger a Los Siete Potters
(3, 1), -- Ron Weasley a la Orden del Fénix
(3, 10), -- Ron Weasley a Los Siete Potters
(3, 9), -- Ron Weasley a Dumbledore's Army
(3, 5), -- Ron Weasley a Casa Gryffindor
(4, 2), -- Draco Malfoy a los Mortífagos
(4, 6), -- Draco Malfoy a Casa Slytherin
(5, 1), -- Albus Dumbledore a la Orden del Fénix
(5, 4), -- Albus Dumbledore a Hogwarts
(6, 2), -- Voldemort a los Mortífagos
(6, 6), -- Voldemort a Casa Slytherin
(7, 1), -- Rubeus Hagrid a la Orden del Fénix
(7, 4), -- Rubeus Hagrid a Hogwarts
(8, 1), -- Minerva McGonagall a la Orden del Fénix
(8, 4), -- Minerva McGonagall a Hogwarts
(9, 1), -- Neville Longbottom a la Orden del Fénix
(9, 9), -- Neville Longbottom a Dumbledore's Army
(9, 5), -- Neville Longbottom a Casa Gryffindor
(10, 1), -- Luna Lovegood a la Orden del Fénix
(10, 4), -- Luna Lovegood a Hogwarts
(10, 8), -- Luna Lovegood a Casa Ravenclaw
(11, 2), -- Bellatrix Lestrange a los Mortífagos
(11, 6), -- Bellatrix Lestrange a Casa Slytherin
(12, 2), -- Voldemort a los Mortífagos
(12, 6), -- Voldemort a Casa Slytherin
(13, 5), -- Ginny Weasley a Casa Gryffindor
(13, 9), -- Ginny Weasley a Dumbledore's Army
(13, 10), -- Ginny Weasley a Los Siete Potters
(14, 5), -- Fred Weasley a Casa Gryffindor
(15, 5), -- George Weasley a Casa Gryffindor
(16, 1), -- Sirius Black a la Orden del Fénix
(16, 5), -- Sirius Black a Casa Gryffindor
(17, 4), -- Fleur Delacour a Hogwarts
(17, 10), -- Fleur Delacour a Los Siete Potters
(18, 7), -- Cedric Diggory a Casa Hufflepuff
(19, 4), -- Cho Chang a Hogwarts
(20, 2), -- Lucius Malfoy a los Mortífagos
(20, 6), -- Lucius Malfoy a Casa Slytherin
(21, 4), -- Nymphadora Tonks a Hogwarts
(21, 7), -- Nymphadora Tonks a Casa Hufflepuff
(22, 2), -- Horace Slughorn a los Mortífagos
(22, 6), -- Horace Slughorn a Casa Slytherin
(23, 3), -- Dolores Umbridge a Ministerio de Magia
(23, 2), -- Dolores Umbridge a los Mortífagos
(23, 6), -- Dolores Umbridge a Casa Slytherin
(24, 5), -- Peter Pettigrew a Casa Gryffindor
(25, 1), -- Alastor Moody a la Orden del Fénix
(26, 5), -- Lily Potter a Casa Gryffindor
(27, 5), -- James Potter a Casa Gryffindor
(28, 5), -- Molly Weasley a Casa Gryffindor
(29, 5), -- Arthur Weasley a Casa Gryffindor
(30, 1), -- Kingsley Shacklebolt a la Orden del Fénix
(31, 4), -- Gilderoy Lockhart a Hogwarts
(32, 4), -- Quirinus Quirrell a Hogwarts
(33, 2), -- Barty Crouch Jr. a los Mortífagos
(34, 4), -- Victor Krum a Hogwarts
(35, 5), -- Percy Weasley a Casa Gryffindor
(36, 5), -- Bill Weasley a Casa Gryffindor
(37, 5), -- Charlie Weasley a Casa Gryffindor
(38, 5), -- Lavender Brown a Casa Gryffindor
(39, 5), -- Parvati Patil a Casa Gryffindor
(40, 5), -- Seamus Finnigan a Casa Gryffindor
(41, 2), -- Pansy Parkinson a los Mortífagos
(42, 2), -- Gregory Goyle a los Mortífagos
(43, 2), -- Vincent Crabbe a los Mortífagos
(44, 4), -- Filius Flitwick a Hogwarts
(45, 4), -- Pomona Sprout a Hogwarts
(46, 4), -- Sybil Trelawney a Hogwarts
(47, 4), -- Argus Filch a Hogwarts
(48, 2), -- Fenrir Greyback a los Mortífagos
(49, 3),-- Cornelius Fudge a Ministerio de Magia
(49, 2), -- Cornelius Fudge a los Mortífagos
(50, 2), -- Alecto Carrow a los Mortífagos
(51, 2), -- Amycus Carrow a los Mortífagos
(52, 2), -- Andromeda Tonks a los Mortífagos
(53, 2), -- Regulus Black a los Mortífagos
(54, 4), -- Dobby a Hogwarts
(55, 5), -- Lupin Remus a Gryffindor 
(56, 2), -- Barty Crouch Sr. a los Mortífagos
(57, 2), -- Walburga Black a los Mortífagos
(58, 1), -- Nick Casi Decapitado a la Orden del Fénix
(59, 7), -- El Fraile Gordo a Casa Hufflepuff
(60, 4), -- La Dama Gris a Hogwarts
(61, 2), -- El Barón Sanguinario a los Mortífagos
(62, 4); -- Aurora Sinistra a Hogwarts

-- Tabla enfrentamientos
INSERT INTO Enfrentamientos (nombre, fecha, id_localizacion)
VALUES
('Batalla de Hogwarts: Harry vs Voldemort', '1998-05-02', 1),  -- Hogwarts, Harry derrota a Voldemort
('Batalla de Hogwarts: Molly Weasley vs Bellatrix Lestrange', '1998-05-02', 1),  -- Molly derrota a Bellatrix
('Batalla de Hogwarts: Neville Longbottom vs Nagini', '1998-05-02', 1),  -- Neville mata a Nagini
('Batalla de Hogwarts: Minerva McGonagall, Kingsley Shacklebolt y Horace Slughorn vs Voldemort', '1998-05-02', 1),  -- Lucha grupal con Voldemort antes de su derrota final
('Renacimiento de Voldemort: Harry Potter vs Voldemort', '1995-06-24', 2),  -- Cementerio, Harry escapa
('Renacimiento de Voldemort: Harry Potter y Cedric Diggory vs Colagusano', '1995-06-24', 2),  -- Cedric muere y Harry logra escapar
('Batalla en la Sala de los Misterios: Harry Potter, Hermione Granger, Ron Weasley y otros vs Mortífagos', '1996-06-18', 3),  -- Los jóvenes logran huir, aunque hay pérdidas importantes
('Batalla en la Sala de los Misterios: Sirius Black vs Bellatrix Lestrange', '1996-06-18', 3),  -- Bellatrix mata a Sirius Black
('Batalla de la Torre de Astronomía: Severus Snape vs Albus Dumbledore', '1997-06-30', 4),  -- Snape mata a Dumbledore por acuerdo previo
('Batalla en la Mansión Malfoy: Harry, Ron, Hermione vs Bellatrix Lestrange y otros', '1998-03-01', 5),  -- Escapan gracias a Dobby
('Batalla en la Mansión Malfoy: Dobby vs Bellatrix Lestrange', '1998-03-01', 5),  -- Dobby salva al grupo, aunque muere
('Enfrentamiento en la Cámara de los Secretos: Harry vs Basilisco', '1993-05-29', 6),  -- Harry mata al basilisco
('Encuentro con el Troll: Harry, Ron y Hermione vs. Troll', '1991-10-31', 1),  -- Enfrentamiento en el baño de mujeres
('La Batalla de la Piedra Filosofa', '1992-06-04', 1),  -- segundo intento de Voldemort de acabar con la vida de Harry Potter
('Encuentro fatal: Voldemort vs James y Lily Potter', '1981-10-31', 9),  -- Voldemort asesina a los padres de Harry
('Torneo de los Tres Magos: Harry vs Grindylows', '1995-06-24', 10),  -- Prueba subacuática del Torneo
('Torneo de los Tres Magos: Harry vs Colacuerno Húngaro', '1994-11-24', 10), -- Harry logra obtener el huevo dorado
('El Asalto al Expreso de Hogwarts', '1993-09-01', 11), -- Harry Potter, Ron Weasley, Hermione Granger, Remus Lupin, un dementor, los demás alumnos de Hogwarts y la mujer del carrito.
('La Batalla de la Casa de los Gritos', '1994-06-06', 12), -- Harry Potter, Ron Weasley, Hermione Granger, Sirius Black, Severus Snape, Remus Lupin, Colagusano, 100 dementores, Albus Dumbledore, Buckbeak, Cornelius Fudge, Rubeus Hagrid y Walden McNair.
('El Ataque a Gringotts', '1998-05-01', 16),
('El Incendio de la Madriguera', '1996-12-25', 14), -- Harry Potter, Ron Weasley, Hermione Granger, Molly Weasley, Arthur Weasley, Fred Weasley, George Weasley, Ginny Weasley, Nymphadora Tonks, Remus Lupin, Fenrir Greyback y Bellatrix Lestrange
('La Batalla de la Torre', '1997-06-16', 4),
('La Batalla de los Siete Potters', '1997-07-27', 15);

INSERT INTO Personajes_Enfrentamientos (id_enfrentamiento, id_varita, id_hechizo, id_pocion, id_objeto, id_personaje, equipo)
VALUES
(1, 1, 1, NULL, NULL, 1, 'buenos'),  -- Harry (Varita de Saúco, Expelliarmus)*__Batalla de Hogwarts__*
(1, 10, 4, NULL, NULL, 12, 'malos'),  -- Voldemort (Varita de Saúco, Avada Kedavra)
(2, 3, 9, NULL, NULL, 28, 'buenos'),  -- Molly Weasley (Varita de Molly, Petrificus Totalus)
(2, 11, 4, NULL, NULL, 11, 'malos'),  -- Bellatrix Lestrange (Varita de Bellatrix, Avada Kedavra)
(3, 9, 7, NULL, 19, 9, 'buenos'),  -- Neville Longbottom (Varita de Neville, Decapitación de Nagini)
(3, NULL, NULL, NULL, NULL, 79, 'malos'),  -- Nagini
(4, 5, 10, NULL, NULL, 12, 'malos'),  -- Voldemort (Varita de Saúco, Avada Kedavra)
(4, NULL, 7, NULL, NULL, 8, 'buenos'), -- Minerva McGonagall (Hechizo de escudo)
(4, NULL, 7, NULL, NULL, 30, 'buenos'), -- Kingsley Shacklebolt (Hechizo de escudo)
(4, NULL, 7, NULL, NULL, 22, 'buenos'), -- Horace Slughorn (Hechizo de escudo)
(5, 1, 7, NULL, NULL, 1, 'buenos'),  -- Harry (Varita de Harry, Escudo protector)*__Cementerio de Little Hangleton__*
(5, 5, 4, NULL, NULL, 12, 'malos'),  -- Voldemort 
(6, 1, NULL, NULL, NULL, 1, 'buenos'),  -- Harry (Varita de Harry)
(6, 13, NULL, NULL, NULL, 18, 'buenos'), -- Cedric Diggory (Varita de Cedric)
(6, 15, NULL, NULL, NULL, 24, 'malos'),  -- Colagusano (Varita de Colagusano)
(7, 1, 3, NULL, NULL, 1, 'buenos'),  -- Harry (Varita de Harry, Protego) *__Batalla del Ministerio de Magia (Sala de los Misterios)__*
(7, 3, 8, NULL, NULL, 2, 'buenos'),  -- Hermione (Varita de Hermione, Confringo)
(7, 2, 9, NULL, NULL, 3, 'buenos'),  -- Ron (Varita de Ron, Levicorpus)
(7, 2, 9, NULL, NULL, 9, 'buenos'),  -- Neville
(7, 11, 10, NULL, NULL, 10, 'buenos'), -- Luna
(7, 11, 10, NULL, NULL, 20, 'malos'), -- Lucius Malfoy
(7, 11, 10, NULL, NULL, 11, 'malos'), -- Bellatrix (Varita de Bellatrix, Avada Kedavra)
(7, 11, 10, NULL, NULL, 63, 'malos'), -- Rodolphus Lestrange
(7, 11, 10, NULL, NULL, 65, 'malos'), -- Walden Macnair
(7, 11, 10, NULL, NULL, 66, 'malos'), -- Antonin Dolohov
(8, 11, 10, NULL, NULL, 11, 'malos'),  -- Bellatrix Lestrange (Varita de Bellatrix, Avada Kedavra)*__Batalla en la Sala de los Misterios__*
(8, 1, 7, NULL, NULL, 16, 'buenos'),  -- Sirius Black (Varita de Sirius, Hechizo de escudo)
(9, 12, 4, NULL, NULL, 6, 'malos'),  -- Snape (Varita de Snape, Avada Kedavra)*__Torre de Astronomía__*
(9, 5, NULL, NULL, NULL, 5, 'buenos'),  -- Dumbledore (Varita de Saúco)
(10, 1, 7, NULL, NULL, 1, 'buenos'),  -- Harry (Varita de Harry, Escudo protector)*__Mansión Malfoy__*
(10, 3, 7, NULL, NULL, 2, 'buenos'),  -- Hermione (Varita de Hermione, Escudo protector)
(10, 2, 7, NULL, NULL, 3, 'buenos'),  -- Ron (Varita de Ron, Escudo protector)
(10, NULL, 7, NULL, NULL, 54, 'buenos'), -- Doby
(10, 11, 10, NULL, NULL, 11, 'malos'),  -- Belatrix 
(10, 11, 10, NULL, NULL, 4, 'malos'),  -- Draco Malfoy
(10, 11, 10, NULL, NULL, 20, 'malos'),  -- Lucius Malfoy 
(10, 11, 10, NULL, NULL, 24, 'malos'),  -- Peter Pettigrew 
(11, NULL, NULL, NULL, NULL, 54, 'buenos'),  -- Dobby (Elfo doméstico, uso de poderes mágicos propios)
(11, 11, 4, NULL, NULL, 11, 'malos'),  -- Belatrix 
(12, NULL, NULL, NULL, NULL, 64, 'malos'), -- Basilisco
(12, 1, 10, NULL, 19, 1, 'buenos'),  -- Harry (Varita de Harry, Espada de Gryffindor para matar al basilisco)*__Cámara de los Secretos__*
(13, 1, 8, NULL, NULL, 1, 'buenos'),  -- Harry 
(13, 2, 8, NULL, NULL, 2, 'buenos'),  -- Hermione 
(13, 3, 8, NULL, NULL, 3, 'buenos'),  -- Ron 
(13, NULL, NULL, NULL, NULL, 67, 'malos'),  -- Troll 
(14, 1, 3, NULL, 1, 1, 'buenos'),  -- Harry (Varita de Harry, Protego)
(14, 1, 3, NULL, NULL, 2, 'buenos'),  -- Hermione
(14, 1, 3, NULL, NULL, 3, 'buenos'),  -- Ron
(14, 1, 3, NULL, NULL, 32, 'malos'),  -- Quirinus Quirrell
(14, 1, 3, NULL, NULL, 12, 'malos'),  -- Lord Voldemort 
(14, NULL, NULL, NULL, NULL, 5, 'buenos'),  -- Albus Dumbledore
(15, 5, 10, NULL, NULL, 12, 'malos'),  -- Voldemort (Varita de Saúco, Avada Kedavra)*__Casa de los Potter__*
(15, 1, NULL, NULL, NULL, 27, 'buenos'),  -- James Potter (Varita de James)
(15, 1, NULL, NULL, NULL, 26, 'buenos'),  -- Lily Potter (Varita de Lily)
(16, 1, 11, NULL, NULL, 1, 'buenos'),  -- Harry (Varita de Harry, Encantamiento de burbuja)*__Torneo de los Tres Magos (Lago Negro)__*
(16, NULL, NULL, NULL, NULL, 79,'malos'),  -- Grindylows (Criatura subacuática)
(17, 1, 12, NULL, NULL, 1, 'buenos'),  -- Harry (Varita de Harry, Accio para convocar la escoba)*__Torneo de los Tres Magos (Dragón)__*
(17, NULL, NULL, NULL, NULL, 75, 'malos'),  -- Colacuerno Húngaro (Criatura, dragón usado en la prueba)
(18, 1, 8, NULL, NULL, 1, 'buenos'),  -- Harry Potter (Varita de Harry)
(18, NULL, NULL, NULL, NULL, 2, 'buenos'),  -- Hermione Granger (Varita de Hermione)
(18, NULL, NULL, NULL, NULL, 3, 'buenos'),  -- Ron Weasley (Varita de Ron)
(18, 14, 8, NULL, NULL, 55, 'buenos'),  -- Remus Lupin
(18, NULL, NULL, NULL, NULL, 74, 'malos'),  -- Un Dementor
(19, 1, 1, NULL, NULL, 1, 'buenos'),  -- Harry Potter
(19, 2, NULL, NULL, NULL, 2, 'buenos'),  -- Hermione Granger
(19, 3, NULL, NULL, NULL, 3, 'buenos'),  -- Ron Weasley
(19, 11, NULL, NULL, NULL, 11, 'malos'),  -- Bellatrix Lestrange
(19, 12, NULL, NULL, NULL, 12, 'malos'),  -- Voldemort
(19, 12, 1, NULL, NULL, 6, 'buenos'),  -- Snape
(19, 8, NULL, NULL, NULL, 8, 'buenos'),  -- Minerva McGonagall
(19, 4, NULL, NULL, NULL, 20, 'malos'),  -- Lucius Malfoy
(19, NULL, NULL, NULL, NULL, 24, 'malos'),  -- Peter Pettigrew
(19, 5, 2, NULL, NULL, 16, 'buenos'),  -- Sirius Black
(19, NULL, NULL, NULL, NULL, 30, 'buenos'),  -- Kingsley Shacklebolt
(19, NULL, NULL, NULL, NULL, 74, 'malos'),  -- dementores
(20, 1, 1, NULL, NULL, 1, 'buenos'),  -- Harry Potter
(20, 2, NULL, NULL, NULL, 2, 'buenos'),  -- Hermione Granger
(20, 3, NULL, NULL, NULL, 3, 'buenos'),  -- Ron Weasley
(20, 5, NULL, NULL, NULL, 12, 'malos'),  -- Voldemort
(20, NULL, NULL, NULL, NULL, 69, 'malos'), -- Fenrir Greyback
(20, NULL, NULL, NULL, NULL, 80, 'buenos'), -- guardianes de Gringots
(20, 12, NULL, NULL, NULL, 6, 'buenos'),  -- Snape
(21, 1, 1, NULL, NULL, 1, 'buenos'),  -- Harry Potter
(21, 2, NULL, NULL, NULL, 2, 'buenos'),  -- Hermione Granger
(21, 3, NULL, NULL, NULL, 3, 'buenos'),  -- Ron Weasley
(21, 13, NULL, NULL, NULL, 13, 'buenos'),  -- Ginny Weasley
(21, 14, NULL, NULL, NULL, 14, 'buenos'),  -- Fred Weasley
(21, 15, NULL, NULL, NULL, 15, 'buenos'),  -- George Weasley
(21, 3, NULL, NULL, NULL, 28, 'buenos'),  -- Molly Weasley
(21, 3, NULL, NULL, NULL, 29, 'buenos'),  -- Arthur Weasley
(21, NULL, NULL, NULL, NULL, 55, 'buenos'),  -- Lupin
(21, 11, NULL, NULL, NULL, 11, 'malos'),  -- Bellatrix
(21, NULL, NULL, NULL, NULL, 69, 'malos'),  -- Fenrir Greyback
(22, 1, NULL, NULL, NULL, 1, 'buenos'),  -- Harry Potter
(22, 2, NULL, NULL, NULL, 2, 'buenos'),  -- Hermione Granger
(22, 3, NULL, NULL, NULL, 3, 'buenos'),  -- Ron Weasley
(22, 11, 11, NULL, NULL, 11, 'malos'),  -- Bellatrix Lestrange
(22, 9, NULL, NULL, NULL, 9, 'buenos'),  -- Neville Longbottom
(22, 10, NULL, NULL, NULL, 10, 'buenos'),  -- Luna
(22, NULL, NULL, NULL, NULL, 40, 'buenos'),  -- Seamus Finnigan
(22, 3, NULL, NULL, NULL, 13, 'buenos'),  -- Ginny Weasley
(22, 14, NULL, NULL, NULL, 14, 'buenos'),  -- Fred Weasley
(22, 15, NULL, NULL, NULL, 15, 'buenos'),  -- George Weasley
(22, 12, NULL, NULL, NULL, 6, 'buenos'),  -- Snape
(22, NULL, NULL, NULL, NULL, 44, 'buenos'),  -- Flitwick
(22, 8, NULL, NULL, NULL, 8, 'buenos'), -- Minerva 
(22, NULL, NULL, NULL, NULL, 45, 'buenos'), -- Pomona
(22, NULL, NULL, NULL, NULL, 69, 'malos'), -- Fenrir Greyback
(22, 4, NULL, NULL, NULL, 4, 'malos'), -- Draco
(22, 5, 1, NULL, NULL, 5, 'buenos'), -- Dumbledore
(22, NULL, NULL, NULL, NULL, 66, 'malos'), -- Dolohobv
(22, NULL, NULL, NULL, NULL, 50, 'malos'), -- Alecto Carrow
(22, NULL, NULL, NULL, NULL, 51, 'malos'), -- Amicus Carrow
(22, NULL, NULL, NULL, NULL, 22, 'buenos'), -- Slughorn
(22, NULL, NULL, NULL, NULL, 21, 'buenos'), -- Tonks
(22, NULL, NULL, NULL, NULL, 55, 'buenos'), -- Lupin
(22, 4, NULL, NULL, NULL, 20, 'malos'),  -- Lucius Malfoy
(23, 1, NULL, NULL, NULL, 1, 'buenos'),  -- Harry Potter
(23, 2, NULL, NULL, NULL, 2, 'buenos'),  -- Hermione Granger
(23, 3, NULL, NULL, NULL, 3, 'buenos'),  -- Ron Weasley
(23, 5, NULL, NULL, NULL, 12, 'malos'),  -- Voldemort
(23, 11, NULL, NULL, NULL, 11, 'malos'),  -- Bellatrix Lestrange
(23, 12, NULL, NULL, NULL, 6, 'buenos');  -- Snape

-- _____________VISTAS_____________

-- Vista de personajes y sus bandos
CREATE VIEW vista_bandos_integrantes AS
SELECT 
    b.nombre AS Bando,
    GROUP_CONCAT(p.nombre SEPARATOR ', ') AS Integrantes
FROM 
    Bandos AS b
JOIN 
    Personajes_Bandos AS pb ON b.id_bando = pb.id_bando
JOIN 
    Personajes AS p ON pb.id_personaje = p.id_personaje
GROUP BY 
    b.nombre;

-- Vista de localizaciones, tipo y enfrentamientos con fecha
CREATE VIEW vista_localizaciones_enfrentamientos AS
SELECT 
    l.nombre AS 'Localizacion',
	l.tipo AS 'Tipo de localización',
    e.nombre AS 'Enfrentamiento',
    e.fecha AS 'Fecha'
FROM 
    Localizaciones AS l
JOIN 
    Enfrentamientos AS e ON l.id_localizacion = e.id_localizacion;

-- Vista de personajes en enfrentamientos con los elementos utilizados
CREATE VIEW vista_personajes_elementos_enfrentamientos AS
SELECT 
    e.nombre AS Enfrentamiento,
    GROUP_CONCAT(p.nombre ORDER BY p.nombre SEPARATOR ', ') AS Participantes,
    GROUP_CONCAT(
        CONCAT(
            p.nombre, ': ',
            CASE WHEN pe.id_varita IS NOT NULL THEN CONCAT('Varita ', v.material) ELSE '' END,
            CASE WHEN pe.id_hechizo IS NOT NULL THEN CONCAT(', Hechizo ', h.nombre) ELSE '' END,
            CASE WHEN pe.id_pocion IS NOT NULL THEN CONCAT(', Pocion ', po.nombre) ELSE '' END,
            CASE WHEN pe.id_objeto IS NOT NULL THEN CONCAT(', Objeto ', o.nombre) ELSE '' END
        ) SEPARATOR '; '
    ) AS 'Elementos Utilizados'
FROM 
    Enfrentamientos AS e
JOIN 
    Personajes_Enfrentamientos AS pe ON e.id_enfrentamiento = pe.id_enfrentamiento
JOIN 
    Personajes AS p ON pe.id_personaje = p.id_personaje
LEFT JOIN 
    Varitas AS v ON pe.id_varita = v.id_varita
LEFT JOIN 
    Hechizos AS h ON pe.id_hechizo = h.id_hechizo
LEFT JOIN 
    Pociones AS po ON pe.id_pocion = po.id_pocion
LEFT JOIN 
    Objetos AS o ON pe.id_objeto = o.id_objeto
GROUP BY 
    e.id_enfrentamiento;

-- Vista de elementos para enfrentamientos, mostrando su id. No hay relación entre los elementos; la vista sirve para rellenar las tablas de personajes_enfrentamientos rapidamente. 
-- Se repiten los elementos para que se muestre entera cada tabla (algunos resultados serán null porque no hay la misma cantidad de elementos en c/tabla)
CREATE VIEW vista_elementos_ids AS
SELECT 
    ROW_NUMBER() OVER (ORDER BY COALESCE(h.id_hechizo, v.id_varita, p.id_pocion, o.id_objeto)) AS `ID's`,
    h.nombre AS Hechizo,
    v.material AS Varita, 
    p.nombre AS Pocion, 
    o.nombre AS Objeto
FROM 
    Hechizos AS h
LEFT JOIN 
    Varitas AS v ON v.id_varita = h.id_hechizo
LEFT JOIN 
    Pociones AS p ON p.id_pocion = h.id_hechizo
LEFT JOIN 
    Objetos AS o ON o.id_objeto = h.id_hechizo
UNION
SELECT 
    ROW_NUMBER() OVER (ORDER BY COALESCE(h.id_hechizo, v.id_varita, p.id_pocion, o.id_objeto)) AS `ID's`,
    h.nombre AS Hechizo,
    v.material AS Varita, 
    p.nombre AS Pocion, 
    o.nombre AS Objeto
FROM 
    Varitas AS v
LEFT JOIN 
    Hechizos AS h ON h.id_hechizo = v.id_varita
LEFT JOIN 
    Pociones AS p ON p.id_pocion = v.id_varita
LEFT JOIN 
    Objetos AS o ON o.id_objeto = v.id_varita
UNION
SELECT 
    ROW_NUMBER() OVER (ORDER BY COALESCE(h.id_hechizo, v.id_varita, p.id_pocion, o.id_objeto)) AS `ID's`,
    h.nombre AS Hechizo,
    v.material AS Varita, 
    p.nombre AS Pocion, 
    o.nombre AS Objeto
FROM 
    Pociones AS p
LEFT JOIN 
    Hechizos AS h ON h.id_hechizo = p.id_pocion
LEFT JOIN 
    Varitas AS v ON v.id_varita = p.id_pocion
LEFT JOIN 
    Objetos AS o ON o.id_objeto = p.id_pocion
UNION
SELECT 
    ROW_NUMBER() OVER (ORDER BY COALESCE(h.id_hechizo, v.id_varita, p.id_pocion, o.id_objeto)) AS `ID's`,
    h.nombre AS Hechizo,
    v.material AS Varita, 
    p.nombre AS Pocion, 
    o.nombre AS Objeto
FROM 
    Objetos AS o
LEFT JOIN 
    Hechizos AS h ON h.id_hechizo = o.id_objeto
LEFT JOIN 
    Varitas AS v ON v.id_varita = o.id_objeto
LEFT JOIN 
    Pociones AS p ON p.id_pocion = o.id_objeto;

-- _____________FUNCIONES_____________
-- funcion para clasificar el nivel de habilidad de los magos en 3 categorias
DROP FUNCTION IF EXISTS get_skill_level;

DELIMITER //

CREATE FUNCTION get_skill_level(p_level INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN CASE 
        WHEN p_level < 30 THEN 'Principiante'
        WHEN p_level BETWEEN 30 AND 70 THEN 'Intermedio'
        ELSE 'Avanzado'
    END;
END //

DELIMITER ;

-- SELECT nombre, nivel, get_skill_level(nivel) AS 'Nivel de Habilidad'
-- FROM personajes;

-- función para categorizar la fuerza de una varita en 3 niveles
DROP FUNCTION IF EXISTS get_wand_power_level;

DELIMITER //

CREATE FUNCTION get_wand_power_level(p_strength DECIMAL(5,2))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN CASE 
        WHEN p_strength < 7.0 THEN 'Baja'
        WHEN p_strength BETWEEN 7.0 AND 8.5 THEN 'Moderada'
        ELSE 'Alta'
    END;
END//

DELIMITER ;

-- _____________SP_____________
-- da cantidad de personajes, promedio del nivel de todos, el nivel maximo y minimo que hay 
DROP PROCEDURE IF EXISTS expelliarmusDatabase.obtener_estadisticas_personajes;

DELIMITER //
CREATE PROCEDURE expelliarmusDatabase.obtener_estadisticas_personajes()
BEGIN
    SELECT 
        COUNT(*) AS total_personajes,
        AVG(nivel) AS promedio_nivel,
        MAX(nivel) AS maximo_nivel,
        MIN(nivel) AS minimo_nivel
    FROM Personajes;
END //
DELIMITER ;


-- CALL expelliarmusDatabase.obtener_estadisticas_personajes;

-- da detalles de varitas por fuerza mínima
DROP PROCEDURE IF EXISTS obtener_detalle_varitas_por_fuerza;
DELIMITER //
CREATE PROCEDURE obtener_detalle_varitas_por_fuerza(IN min_fuerza DECIMAL(5,2))
BEGIN
    SELECT * FROM Varitas WHERE fuerza >= min_fuerza;
END //
DELIMITER ;

-- CALL obtener_detalle_varitas_por_fuerza(9);

-- _____________TRIGGERS_____________
-- este trigger se activa después de insertar un nuevo registro en la tabla personajes con valor negativo en nivel
DROP TRIGGER IF EXISTS validar_nivel_personaje;

DELIMITER //
CREATE TRIGGER validar_nivel_personaje
BEFORE INSERT ON Personajes
FOR EACH ROW
BEGIN
    IF NEW.nivel < 0 THEN
        SET NEW.nivel = 1;
    END IF;
END//
DELIMITER ;
-- INSERT INTO Personajes (nombre, habilidades, nivel)
-- VALUES ('Thiago', 'Expelliarmus, Expecto Patronum', -10);
-- select * from Personajes order by nivel DESC;

-- este trigger se activa después de insertar un nuevo registro en la tabla varitas con valor muy alto o negativo en fuerza
DROP TRIGGER IF EXISTS before_update_varita_fuerza;
DELIMITER //
CREATE TRIGGER before_update_varita_fuerza
BEFORE UPDATE ON Varitas
FOR EACH ROW
BEGIN
    IF NEW.fuerza > 10.0 THEN
        SET NEW.fuerza = 10.0;
    END IF;
    IF NEW.fuerza < 0 THEN
        SET NEW.fuerza = 1.00;
    END IF;
END //
DELIMITER ;
-- pruebas de los if
-- UPDATE Varitas
-- SET fuerza = -5.00
-- WHERE id_varita = 1;
-- select * from varitas;

-- UPDATE Varitas
-- SET fuerza = 20.00
-- WHERE id_varita = 1;
-- select * from varitas;

-- Trigger antes de insertar una poción
DROP TRIGGER IF EXISTS before_insert_pocion;
DELIMITER //
CREATE TRIGGER before_insert_pocion
BEFORE INSERT ON Pociones
FOR EACH ROW
BEGIN
    IF NEW.fuerza < 1.0 OR NEW.fuerza > 10.0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fuerza de la poción debe estar entre 1.0 y 10.0';
    END IF;
END //
DELIMITER ;

-- INSERT INTO Pociones (nombre, efecto, duracion, fuerza)
-- VALUES ('Poción de Fuerza', 'Aumenta la fuerza temporalmente', 30, 12.0);

