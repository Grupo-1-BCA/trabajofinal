-- GRUPO 6
-- INTEGRANTES: DANIEL MASIAS, KARLA SANTIAGO, CARLOS GUTIERREZ, KATHERINE HEREDIA

--PASO 1: CREACIÓN DE TABLA EMPLEADOS

IF OBJECT_ID('tb_empleados') is not null
	drop table tb_empleados
	go

create table tb_empleados
(
	id_empleado				int not null constraint pk_tb_empleados primary key (id_empleado),
	nombre_empleado			nvarchar(50) not null,
	apellidos_empleado		nvarchar(50) not null,
	posicion				nvarchar (20) not null,
	area					nvarchar (20) not null,
	id_agencia				int not null,
	calificacion			nvarchar (20) not null
)
go

alter table tb_empleados
add constraint fk_tb_empleados_tb_agencias foreign key (id_agencia) references tb_agencias (id_agencia)

--PASO 2: CREACIÓN DE TABLA AGENCIAS
IF OBJECT_ID('tb_agencias') is not null
	drop table tb_agencias
	go

create table tb_agencias
(
	id_agencia				int not null constraint pk_tb_agencias primary key (id_agencia),
	nom_agencia				nvarchar(50) not null,
	zona_agencia			nvarchar(50) not null,
	categoria_agencia		nvarchar(50) not null
)
go

--PASO 3: CREACIÓN DE TABLA PRODUCTOS
IF OBJECT_ID('tb_productos') is not null
	drop table tb_productos
	go

create table tb_productos
(
	id_producto				int not null constraint pk_tb_productos primary key (id_producto),
	tipo_tarjeta			nvarchar(50) not null,
	linea_credito			int not null
)	
go

--PASO 4: CREACIÓN DE TABLA CLIENTES
IF OBJECT_ID('tb_clientes') is not null
	drop table tb_clientes
	go

create table tb_clientes
(
	id_cliente				 int not null constraint pk_tb_clientes primary key (id_cliente),
	nombre_cliente			 varchar(255) not null,
	apellidos_cliente		 varchar(255) not null,
	dni_cliente				 varchar (8) not null,
	direccion_cliente		 varchar(255) not null,
	ciudad_cliente			 varchar(255) not null,
	distrito_cliente		 varchar(255) not null,
	cod_postal				 varchar(6) not null,
	num_telefono_cliente	 varchar(9) not null,
	sexo					 varchar(1) not null,
	estado_civil			 varchar(10)
)
go

--PASO 5: CREACIÓN DE TABLA TRANSACCION

IF OBJECT_ID('tb_transaccion') is not null
	drop table tb_transaccion

create table tb_transaccion
(
	id_transaccion			int not null constraint pk_tb_transaccion primary key (id_transaccion),
	id_cliente				int not null constraint fk_tb_transaccion_tb_clientes foreign key (id_cliente) references tb_clientes (id_cliente),
	id_agencia				int not null constraint fk_tb_transaccion_tb_agencias foreign key (id_agencia) references tb_agencias (id_agencia),
	id_producto				int not null constraint fk_tb_transaccion_tb_productos foreign key (id_producto) references tb_productos (id_producto),
	id_empleado				int not null constraint fk_tb_transaccion_tb_empleados foreign key (id_empleado) references tb_empleados (id_empleado),
	fecha					date not null
)
go

--PASO 6: INSERCION DE DATOS
--TABLA AGENCIAS
insert into tb_agencias (id_agencia,nom_agencia,zona_agencia,categoria_agencia) values (1,'El Polo','Zona Sur','Categoria A');
insert into tb_agencias (id_agencia,nom_agencia,zona_agencia,categoria_agencia) values (2,'Plaza Norte','Zona Norte','Categoria B');
insert into tb_agencias (id_agencia,nom_agencia,zona_agencia,categoria_agencia) values (3,'Chosica','Zona Este','Categoria C');
insert into tb_agencias (id_agencia,nom_agencia,zona_agencia,categoria_agencia) values (4,'Plaza','Zona Centro','Categoria A');
insert into tb_agencias (id_agencia,nom_agencia,zona_agencia,categoria_agencia) values (5,'Chorillos','Zona Sur','Categoria B');
insert into tb_agencias (id_agencia,nom_agencia,zona_agencia,categoria_agencia) values (6,'Los Olivos','Zona Norte','Categoria C');
insert into tb_agencias (id_agencia,nom_agencia,zona_agencia,categoria_agencia) values (7,'Surco','Zona Este','Categoria A');
insert into tb_agencias (id_agencia,nom_agencia,zona_agencia,categoria_agencia) values (8,'Wilson','Zona Centro','Categoria B');
insert into tb_agencias (id_agencia,nom_agencia,zona_agencia,categoria_agencia) values (9,'Barranco','Zona Sur','Categoria C');
insert into tb_agencias (id_agencia,nom_agencia,zona_agencia,categoria_agencia) values (10,'Mega Plaza','Zona Norte','Categoria A')
SELECT*FROM tb_agencias

--TABLA EMPLEADOS
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (1,'ANDRE','YULGO ROSALES','AGENTE DE VENTAS ORO','MASIVOS',5,'TOP')
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (2,'JORGE','SOSA BOLAÑOS','AGENTE DE VENTAS ORO','MASIVOS',5,'TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (3,'JUAN','MASIAS CABALLERO','AGENTE DE VENTAS ORO','MASIVOS',4,'TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (4,'ROBERTO','LAZO BUENO','AGENTE DE VENTAS ORO','MASIVOS',7,'TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (5,'PEDRO','RIVERA ACURIO','AGENTE DE VENTAS ORO','MASIVOS',5,'TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (6,'LUIS','ZANS ORTEGA','AGENTE DE VENTAS ORO','MASIVOS',6,'TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (7,'PAOLA','MONTEZUMA ROSALES','AGENTE DE VENTAS D','MASIVOS',5,'SEMI TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (8,'CAROLINA','ROMERO SORIA','AGENTE DE VENTAS D','MASIVOS',5,'SEMI TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (9,'GIANELA','PROMES CHAVEZ','AGENTE DE VENTAS D','MASIVOS',4,'SEMI TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (10,'ALISON','SIPION BARBA','AGENTE DE VENTAS D','MASIVOS',8,'SEMI TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (11,'EDUARDO','SILVA AYESTA','AGENTE DE VENTAS D','MASIVOS',5,'SEMI TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (12,'FERNANDO','ROSALES GUTIERREZ','AGENTE DE VENTAS D','MASIVOS',10,'SEMI TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (13,'DANIEL','LLANOS PALOMINO','AGENTE DE VENTAS D','MASIVOS',1,'SEMI TOP');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (14,'ELOY','CHUQUIPOMA SARTRE','AGENTE DE VENTAS P','MASIVOS',2,'PRODUCTIVO');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (15,'CHRISTIAN','BIANCHINI LIMA','AGENTE DE VENTAS P','MASIVOS',8,'PRODUCTIVO');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (16,'JOSHUA','KCOMT BARRIGA','AGENTE DE VENTAS P','MASIVOS',7,'PRODUCTIVO');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (17,'RAQUEL','GALLO BORJA','AGENTE DE VENTAS P','MASIVOS',2,'PRODUCTIVO');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (18,'JIMENA','CHAVEZ CESPEDES','AGENTE DE VENTAS P','MASIVOS',10,'PRODUCTIVO');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (19,'ALONDRA','MOTTA ZAPATA','AGENTE DE VENTAS I','MASIVOS',8,'IMPRODUCTIVO');
insert into tb_empleados (id_empleado,nombre_empleado,apellidos_empleado,posicion,area,id_agencia,calificacion) values (20,'ARIANA','SCOFIELD ALANYA','AGENTE DE VENTAS I','MASIVOS',5,'IMPRODUCTIVO');

SELECT*FROM tb_empleados
--TABLA PRODUCTOS
insert into tb_productos (id_producto,tipo_tarjeta,linea_credito) values (1,'LIGHT',1000);
insert into tb_productos (id_producto,tipo_tarjeta,linea_credito) values (2,'CLASICA',5000);
insert into tb_productos (id_producto,tipo_tarjeta,linea_credito) values (3,'SIGNATURE',10000);
insert into tb_productos (id_producto,tipo_tarjeta,linea_credito) values (4,'ORO',50000);
insert into tb_productos (id_producto,tipo_tarjeta,linea_credito) values (5,'PLATINIUM',100000);
SELECT*FROM tb_productos

--TABLA CLIENTES
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (1,'Juan Carlos','Pérez González',26776702,'Calle Los Pinos123','Lima','Miraflores',15001,988150339,'M','Casado')
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (2,'Juan Carlos','Pérez González',26776702,'Calle Los Pinos 123','Lima','Miraflores',15001,988150339,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (3,'Juan Carlos','Pérez González',26776702,'Calle Los Pinos 123','Lima','Miraflores',15001,988150339,'M','Casado')
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (4,'Laura Isabel','Martínez Castro',33762156,'Avenida Grau 012','Lima','Surco',15004,996168126,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (5,'Pedro Luis','López Hernández',25775274,'Calle Junín 345','Lima','Magdalena',15005,916223807,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (6,'Ana Carolina','Hernández González',16254103,'Avenida Tacna 678','Lima','San Borja',15006,966218323,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (7,'Luis Sergio','González Morales',49099304,'Calle Arequipa 910','Lima','Miraflores',15007,932887443,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (8,'Isabel Andrea','Morales Sánchez',43100090,'Avenida Alfonso Ugarte 111','Lima','San Miguel',15008,953097267,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (9,'Sergio Alejandro','Castro Ramírez',75091993,'Calle Huancayo 234','Lima','Surquillo',15009,987929215,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (10,'Andrea Natalia','Sánchez Torres',28516639,'Avenida Del Ejército 567','Lima','La Molina',15010,948868589,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (11,'Alejandro Andrés','Ramírez Vargas',88247990,'Calle El Sol 890','Cuzco','Cuzco',8001,982358307,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (12,'Natalia Gabriela','Torres Guzmán',50197885,'Avenida Pachacutec 213','Cuzco','Cuzco',8002,913456351,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (13,'Andrés Daniel','Vargas Romero',56962508,'Calle Garcilaso de la Vega 546','Cuzco','Cuzco',8003,952429633,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (14,'Gabriela Carolina','Guzmán Paredes',53342635,'Avenida Tullumayo 879','Cuzco','Cuzco',8004,910854441,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (15,'Daniel Oscar','Romero Jiménez',92791219,'Calle San Agustín 123','Cuzco','Cuzco',8005,940924357,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (16,'Carolina Valentina','Paredes Silva',20887979,'Avenida El Sol 456','Cuzco','Cuzco',8006,962154327,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (17,'Oscar Guillermo','Jiménez Ortiz',79901439,'Calle Los Olivos 123','Ica','Ica',11001,911213615,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (18,'Valentina Paula','Silva Cordero',30762558,'Avenida Los Piscos 456','Ica','Ica',11002,912665851,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (19,'Guillermo José','Ortiz Mendoza',46563498,'Calle San Juan 789','Ica','Ica',11003,991204249,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (20,'Paula Camila','Cordero Ríos',52377162,'Avenida Nazca 012','Ica','Ica',11004,981467908,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (21,'José Manuel','Mendoza Castro',63815922,'Calle Paracas 345','Ica','Ica',11005,914729905,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (22,'Camila Fernanda','Ríos Vargas',18556120,'Avenida Huacachina 678','Ica','Ica',11006,999761731,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (23,'Manuel Ricardo','Castro Paredes',55161058,'Calle Chavín 910','Ica','Ica',11007,993797530,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (24,'Fernanda Victoria','Vargas Morales',60804943,'Avenida Palpa 111','Ica','Ica',11008,925678914,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (25,'Ricardo Pablo','Paredes Guzmán',22866415,'Calle Ballestas 234','Ica','Ica',11009,964628708,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (26,'Victoria Antonia','Morales Soto',63926626,'Avenida Querulpa 567','Ica','Ica',11010,919301172,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (27,'Pablo Francisco','Guzmán Pérez',50697625,'Calle Los Angeles 890','Arequipa','Arequipa',4001,969761051,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (28,'Antonia Catalina','Soto Flores',54552078,'Avenida Santa Catalina 213','Arequipa','Arequipa',4002,964473503,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (29,'Francisco Gabriel','Pérez Sánchez',52849221,'Calle Misti 546','Arequipa','Arequipa',4003,966522240,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (30,'Catalina Carolina','Flores Cruz',51844581,'Avenida Yanahuara 879','Arequipa','Arequipa',4004,970744315,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (31,'Gabriel Rodrigo','Sánchez Torres',56628976,'Calle Vallecito 123','Arequipa','Arequipa',4005,945697264,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (32,'Carolina Isabella','Cruz Castro',75230496,'Avenida Ejército 456','Arequipa','Arequipa',4006,986964328,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (33,'Rodrigo Mauricio','Torres Rodríguez',99211291,'Calle San Lázaro 789','Arequipa','Arequipa',4007,942728035,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (34,'Isabella Javiera','Castro Ríos',69264100,'Avenida Cayma 111','Arequipa','Arequipa',4008,910552983,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (35,'Mauricio Sebastián','Rodríguez Silva',86881894,'Calle Cerro Colorado 234','Arequipa','Arequipa',4009,974677613,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (36,'Javiera Valeria','Ríos Muñoz',46254646,'Avenida Sabandia 567','Arequipa','Arequipa',4010,906341038,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (37,'Sebastián Eduardo','Silva Herrera',16511045,'Calle Los Conquistadores 123','Lima','San Isidro',15001,919634345,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (38,'Valeria Francisca','Muñoz Ramírez',11365484,'Avenida Javier Prado 456','Lima','La Molina',15002,924678185,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (39,'Eduardo Matías','Herrera Morales',26022903,'Calle Las Begonias 789','Lima','San Isidro',15003,909212650,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (40,'Francisca Gabriela','Ramírez Vargas',20838138,'Avenida Salaverry 012','Lima','Magdalena',15004,968924198,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (41,'Matías Rafael','Morales Cordero',68807042,'Calle Benavides 345','Lima','Miraflores',15005,950127624,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (42,'Gabriela Alejandra','Vargas Guzmán',69547239,'Avenida Angamos 678','Lima','Surquillo',15006,941603692,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (43,'Rafael María','Cordero Pérez',95807603,'Calle República de Panamá 910','Lima','Barranco',15007,956093627,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (44,'Alejandra Carlos','Guzmán García',67858752,'Avenida Brasil 111','Lima','Jesús María',15008,950792149,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (45,'María Laura','Pérez Rodríguez',76795024,'Calle Arequipa 234','Lima','Lince',15009,917948007,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (46,'Carlos Pedro','García Martínez',53503667,'Avenida El Sol 567','Lima','Cercado de Lima',15010,983421829,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (47,'Laura Ana','Rodríguez López',58850303,'Calle Los Olivos 123','Cuzco','Cuzco',8001,987168729,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (48,'Pedro Luis','Martínez Hernández',43308482,'Avenida Los Piscos 456','Cuzco','Cuzco',8002,920169927,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (49,'Ana Isabel','López González',99053914,'Calle San Juan 789','Cuzco','Cuzco',8003,997889371,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (50,'Luis Sergio','Hernández Morales',33714304,'Avenida Nazca 012','Cuzco','Cuzco',8004,942749769,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (51,'Isabel Andrea','González Castro',29858591,'Calle Paracas 345','Cuzco','Cuzco',8005,914980305,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (52,'Sergio Alejandro','Morales Sánchez',62297186,'Avenida Huacachina 678','Cuzco','Cuzco',8006,954413835,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (53,'Andrea Natalia','Castro Ramírez',48631585,'Calle Chavín 910','Cuzco','Cuzco',8007,913436397,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (54,'Alejandro Andrés','Sánchez Torres',14357727,'Avenida Palpa 111','Cuzco','Cuzco',8008,929251530,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (55,'Natalia Gabriela','Ramírez Guzmán',97777871,'Calle Ballestas 234','Cuzco','Cuzco',8009,967677791,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (56,'Andrés Daniel','Torres Romero',46119406,'Avenida Querulpa 567','Cuzco','Cuzco',8010,926694826,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (57,'Gabriela Carolina','Guzmán Paredes',83007770,'Calle Las Orquídeas 890','Lima','San Borja',15011,941731815,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (58,'Daniel Oscar','Romero Jiménez',16359479,'Avenida Los Jazmines 213','Lima','Surco',15012,951113023,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (59,'Carolina Valentina','Paredes Silva',85403794,'Calle Los Cedros 546','Lima','San Isidro',15013,913734263,'F','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (60,'Oscar Guillermo','Jiménez Ortiz',41247471,'Avenida Los Cipreses 879','Lima','Miraflores',15014,919378373,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (61,'Valentina Paula','Silva Cordero',57590690,'Calle Los Alamos 123','Lima','Barranco',15015,964692831,'F','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (62,'Guillermo José','Ortiz Mendoza',87793674,'Avenida Los Sauces 456','Lima','San Miguel',15016,984024426,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (63,'María Jose','Sarmiento Castañeda',165458818,'Calle Los Laureles 789','Lima','Magdalena',15017,993732886,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (64,'Victoria Martha','Aliaga Casablanca',322799996,'Avenida Los Pinos 111','Lima','Surquillo',15018,978618057,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (65,'Ronald Edgar','Ruiz Diaz',103356064,'Calle Las Rosas 234','Lima','La Molina',15019,954646428,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (66,'Victor Humberto','Galindo Quispe',141801047,'Avenida Los Girasoles 567','Lima','Jesús María',15020,933056256,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (67,'Micaela Rosa','Caller Diaz',946635696,'Calle San Juan Bautista 123','Cuzco','Cuzco',8011,913852719,'M','Soltero');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (68,'Carmen Rosa','Tacanga Torres',388534099,'Avenida Tupac Amaru 456','Cuzco','Cuzco',8012,997824582,'M','Casado');
insert into tb_clientes (id_cliente,nombre_cliente,apellidos_cliente,dni_cliente,direccion_cliente,ciudad_cliente,distrito_cliente,cod_postal,num_telefono_cliente,sexo,estado_civil) values (69,'Adriana Fiorella','Ramos Torres',578176121,'Calle Los Incas 789','Cuzco','Cuzco',8013,913029135,'M','Soltero')
SELECT*FROM tb_clientes

--TABLA TRANSACCION
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (1,16,8,2,13,'03/16/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (2,16,8,2,13,'03/16/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (3,17,2,2,13,'11/8/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (4,46,10,5,4,'8/9/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (5,32,3,2,7,'12/12/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (6,22,2,4,19,'2/2/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (7,16,8,1,14,'10/21/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (8,8,10,4,2,'09/14/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (9,26,5,5,19,'3/5/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (10,5,3,5,2,'07/18/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (11,48,10,2,5,'5/5/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (12,34,7,1,15,'4/8/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (13,23,1,2,19,'11/19/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (14,28,7,4,1,'8/7/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (15,59,9,5,15,'01/26/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (16,14,3,5,2,'3/11/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (17,63,5,3,10,'9/3/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (18,35,4,5,14,'6/12/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (19,39,8,4,15,'12/10/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (20,65,7,3,20,'10/11/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (21,15,5,3,1,'2/10/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (22,48,3,3,11,'8/1/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (23,50,7,5,19,'4/2/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (24,61,8,2,9,'11/10/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (25,50,2,4,9,'6/6/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (26,41,7,4,13,'1/4/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (27,21,4,1,20,'5/9/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (28,49,9,5,10,'12/2/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (29,42,2,3,13,'09/18/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (30,15,5,3,20,'7/7/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (31,19,8,4,20,'3/6/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (32,45,10,2,17,'01/13/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (33,16,7,2,15,'10/4/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (34,39,3,4,2,'8/9/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (35,27,1,5,8,'4/11/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (36,50,4,1,5,'12/11/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (37,14,1,3,13,'2/8/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (38,69,6,5,9,'11/5/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (39,11,2,3,4,'7/7/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (40,32,2,4,20,'3/8/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (41,26,5,3,9,'9/3/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (42,22,3,3,17,'6/11/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (43,61,1,1,4,'1/2/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (44,12,6,2,7,'11/4/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (45,62,3,4,16,'8/10/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (46,37,4,1,8,'1/5/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (47,50,5,4,7,'5/1/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (48,66,6,3,3,'12/1/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (49,24,6,1,11,'9/2/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (50,42,5,3,10,'7/9/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (51,3,10,2,9,'3/5/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (52,58,10,4,6,'1/12/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (53,63,1,3,12,'10/2/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (54,69,4,4,7,'8/11/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (55,63,4,1,12,'4/6/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (56,26,7,2,9,'12/12/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (57,37,3,4,15,'2/7/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (58,46,7,4,7,'11/4/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (59,12,7,2,12,'7/12/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (60,66,3,3,4,'3/9/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (61,54,3,2,1,'9/11/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (62,37,2,1,16,'6/10/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (63,10,7,1,17,'1/3/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (64,5,9,3,9,'11/12/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (65,36,9,5,3,'8/11/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (66,28,3,3,13,'1/2/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (67,49,6,4,8,'5/10/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (68,33,1,5,2,'12/1/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (69,9,8,3,3,'9/9/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (70,48,5,2,1,'7/8/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (71,8,5,4,4,'3/9/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (72,26,6,5,17,'1/9/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (73,17,4,4,15,'10/5/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (74,35,3,3,20,'8/2/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (75,42,4,5,5,'4/7/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (76,53,9,4,1,'12/2/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (77,25,4,4,3,'2/1/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (78,46,1,4,8,'11/3/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (79,55,5,2,12,'7/5/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (80,58,2,1,6,'3/11/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (81,15,3,1,10,'9/8/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (82,14,6,1,16,'06/17/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (83,18,5,2,13,'1/5/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (84,57,9,4,18,'11/4/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (85,40,5,4,11,'8/3/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (86,3,7,1,19,'1/1/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (87,66,3,5,16,'5/7/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (88,19,4,1,12,'12/2/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (89,56,4,4,7,'09/20/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (90,39,7,3,5,'7/10/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (91,39,1,1,10,'3/9/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (92,36,1,3,7,'1/6/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (93,25,4,3,9,'10/7/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (94,10,9,2,18,'8/3/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (95,1,1,3,5,'4/9/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (96,15,1,3,13,'12/7/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (97,59,6,3,20,'2/4/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (98,32,6,5,10,'11/5/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (99,4,4,4,16,'7/4/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (100,46,9,3,6,'3/12/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (101,29,3,1,10,'9/1/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (102,19,6,3,1,'6/11/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (103,7,1,1,7,'1/5/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (104,38,4,5,10,'11/2/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (105,64,3,3,16,'8/11/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (106,47,1,1,15,'1/3/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (107,62,9,2,4,'5/3/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (108,56,6,4,8,'12/2/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (109,68,3,4,6,'9/12/2020')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (110,21,3,1,1,'7/10/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (111,31,7,5,16,'3/5/2022')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (112,34,7,4,5,'1/6/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (113,29,10,1,3,'10/7/2017')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (114,51,9,2,4,'8/4/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (115,28,10,5,8,'4/9/2018')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (116,68,10,5,2,'12/1/2016')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (117,47,9,4,17,'2/8/2021')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (118,36,6,3,14,'11/5/2019')
insert into tb_transaccion (id_transaccion,id_cliente,id_agencia,id_producto,id_empleado,fecha) values (119,54,5,2,4,'7/4/2017')
SELECT*FROM tb_transaccion