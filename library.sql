/*
*
*	Database based on a library, where a dependent can be also a client, and one client just can lend one same title book at each order
*
*/
CREATE DATABASE IF NOT EXISTS Library;
CREATE TABLE IF NOT EXISTS cliente(
	DNI VARCHAR(9) PRIMARY KEY,
	First_Name VARCHAR(50) NOT NULL,
	Second_Nme VARCHAR(50) NOT NULL,
	Dependent INT(12),
	CONSTRAINT Dependent_Id FOREIGN KEY (Dependent) REFERENCES DNI_Number (DNI)
);

CREATE TABLE IF NOT EXISTS direccion(
	Ciudad VARCHAR(50),
	Cliente VARCHAR(9),
	CPostal INT(12),
	Calle VARCHAR(50),
	Piso TINYINT (2),
	Puerta VARCHAR (5),
	INDEX (Cliente)
);

CREATE TABLE IF NOT EXISTS libro(
	N_Serie Int(9) PRIMARY KEY,
	Titulo VARCHAR(50),
	Editorial VARCHAR(50),
	Unidades  INT(5),
	Categoria VARCHAR(50),
	Edad_Recomendada INT(3),
	INDEX (N_Serie)
);

CREATE TABLE IF NOT EXISTS alquiler(
	N_Alquiler INT(9) PRIMARY KEY,
	Libro Int(9),
	Cliente VARCHAR(9),
	Fecha_Alquiler DATETIME,
	INDEX (N_Alquiler)
);


ALTER TABLE direccion ADD FOREIGN KEY(Cliente) REFERENCES cliente(DNI);

ALTER TABLE alquiler ADD FOREIGN KEY(Cliente) REFERENCES cliente(DNI);

ALTER TABLE alquiler ADD FOREIGN KEY(Libro) REFERENCES libro(N_Serie);