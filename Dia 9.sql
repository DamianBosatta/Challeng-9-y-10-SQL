CREATE DATABASE KioscoEj1

Use KioscoEj1
go

CREATE TABLE Producto (
    ID INT NOT NULL identity ,
    Nombre varchar(50),
    Categoria varchar(50),
    FechaBaja DateTime,
    PRIMARY KEY(ID)
 )

CREATE TABLE Caracteristicas (
    Id int NOT NULL identity ,
    ProductoID int,
    Precio numeric(18,2),
    Ancho numeric(18,2),
    Largo numeric(18,2),
    Peso numeric(18,2),
    PRIMARY KEY(Id),
    FOREIGN KEY (productoID) REFERENCES Producto(ID)
 )



 CREATE DATABASE VideoClubEj2

Use VideoClubEj2
go

CREATE TABLE Pelicula (
	ID INT NOT NULL identity,
	Titulo varchar(50),
	Genero varchar(50),
	FechaBaja datetime,
	Primary Key (ID)
)

CREATE TABLE Alquiler (
	ID INT NOT NULL identity,
	PeliculaID INT,
	Fecha datetime,
	Precio DECIMAL (18, 2),
	Primary Key (ID),
	FOREIGN KEY (PeliculaID) REFERENCES Pelicula(ID),
)


CREATE DATABASE ConcesionariaEj3
USE ConcesionariaEj3

CREATE TABLE Vehiculo (
	ID INT NOT NULL identity,
	Marca varchar(50),
	Modelo varchar(50),
	Importe varchar(50),
	FechaBaja Datetime,
	Primary Key (ID)

)

CREATE TABLE Cliente (
	ID INT NOT NULL identity,
	Nombre varchar(50),
	Apellido varchar(50),
	DNI varchar(50),
	Direccion varchar(50),
	Primary Key (ID)
)

CREATE TABLE Vendedores (
	ID INT NOT NULL identity,
	Nombre varchar(50),
	Primary Key (ID)
)

CREATE TABLE Venta  (
	ID INT NOT NULL identity,
	VehiculoID INT,
	ClienteID INT,
	VendedorID INT,
	Importe DECIMAL(18,2),
	Descuento DECIMAL(18,2),
	Fecha DATETIME,

	Primary Key (ID),
	FOREIGN KEY (VehiculoID) REFERENCES Vehiculo(ID),
	FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
	FOREIGN KEY (VendedorID) REFERENCES Vendedores(ID),


)CREATE DATABASE ClinicaEj4

CREATE TABLE TipoEstudio(
	ID INT NOT NULL identity,
	Descripcion varchar(50),
	FechaBaja DATETIME,
	Primary Key (ID)
)

CREATE TABLE TipoEmpleado (
	ID INT NOT NULL identity,
	Descripcion varchar(50),
	FechaBaja DATETIME,
	Primary Key (ID)
)

CREATE TABLE Paciente (
	ID INT NOT NULL identity,
	Nombre varchar(50),
	Apellido varchar(50),
	DNI varchar(50),
	Legajo varchar(50),
	Primary Key (ID)
)

CREATE TABLE Estudio (
	ID INT NOT NULL identity,
	TipoEstudioID INT,
	EmpleadoID INT,
	Fecha DATETIME,
	Informe varchar(250),

	Primary Key (ID),
	FOREIGN KEY (TipoEstudioID) REFERENCES Estudio(ID),
	FOREIGN KEY (EmpleadoID) REFERENCES TipoEmpleado(ID),


)

--Consigna 6

CREATE TABLE Partidos(
    Id INT NOT NULL IDENTITY PRIMARY KEY,
    nombreDePartido VARCHAR(150) NOT NULL)

CREATE TABLE Colegio(
    Id INT NOT NULL IDENTITY PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL)

CREATE TABLE Votantes(
    Id INT NOT NULL IDENTITY PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    Dni INT NOT NULL)

CREATE TABLE PresidenteDeMesa(
    Id INT NOT NULL IDENTITY PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
	Dni INT NOT NULL)

CREATE TABLE Delegado(
    Id INT NOT NULL IDENTITY PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL)

CREATE TABLE Mesa(
    Id INT NOT NULL IDENTITY PRIMARY KEY,
    ColegioId INT NOT NULL,
    PresidenteDeMesaId INT NOT NULL,
    DelegadoId INT NOT NULL
    FOREIGN KEY (ColegioId) REFERENCES Colegio(Id),
    FOREIGN KEY (PresidenteDeMesaId) REFERENCES PresidenteDeMesa(Id),
    FOREIGN KEY (DelegadoId) REFERENCES Delegado(Id))

CREATE TABLE Urna(
    Id INT NOT NULL IDENTITY PRIMARY KEY,
    MesaId INT NOT NULL
    FOREIGN KEY (MesaId) REFERENCES Mesa(Id))

CREATE TABLE Padron(
	Id INT IDENTITY PRIMARY KEY,
    VotanteId INT NOT NULL,
    ColegioId INT NOT NULL,
    MesaId INT NOT NULL,
    FOREIGN KEY (VotanteId) REFERENCES Votantes(Id),
    FOREIGN KEY (ColegioId) REFERENCES Colegio(Id),
    FOREIGN KEY (MesaId) REFERENCES Mesa(Id))  
	
    CREATE TABLE Voto(
    Id INT NOT NULL IDENTITY PRIMARY KEY,
    VotanteId INT NOT NULL,
    MesaId INT NOT NULL,
    ColegioId INT NOT NULL,
    PartidosId INT NOT NULL,
    FOREIGN KEY (VotanteId) REFERENCES Votantes(Id),
    FOREIGN KEY (ColegioId) REFERENCES Colegio(Id),
    FOREIGN KEY (MesaId) REFERENCES Mesa(Id),
    FOREIGN KEY(PartidosId) references Partidos(Id))    

	Insert into Partidos (nombreDePartido) values ('UCR')
	Insert into Partidos (nombreDePartido) values ('PJ')
	Insert into Colegio (Nombre) values ('Sarmiento')
	Insert into Votantes (Nombre,Dni) values ('Jorge Gonzalez', 11111111)
	Insert into Votantes (Nombre,Dni) values ('Jorge fernandez', 11111122)
	Insert into Votantes (Nombre,Dni) values ('miguel martinez', 11133333)
	Insert into Votantes (Nombre,Dni) values ('Juan Perez', 12133333)
	insert into PresidenteDeMesa (Nombre,Dni) values ('Martin Rodriguez', 55321546)
	insert into PresidenteDeMesa (Nombre,Dni) values ('Oscar Aventin', 55398746)
	Insert into Delegado (Nombre) values ('Fernando Gutierrez')
	Insert into Delegado (Nombre) values ('Jorge Gomez')
	Insert into Mesa (ColegioId, PresidenteDeMesaId, DelegadoId) values (1,1,1)
	Insert into Mesa (ColegioId, PresidenteDeMesaId, DelegadoId) values (1,2,2)
	Insert into Urna (MesaId) values (1)
	Insert into Urna (MesaId) values (3)
	insert into Padron(VotanteId, ColegioId, MesaId) values(1,1,1)
	insert into Padron(VotanteId, ColegioId, MesaId) values(2,1,1)
	insert into Padron(VotanteId, ColegioId, MesaId) values(3,1,3)
	insert into Padron(VotanteId, ColegioId, MesaId) values(4,1,3)
	insert into Voto(VotanteId, MesaId, ColegioId, PartidosId) values (1,1,1,1)
	insert into Voto(VotanteId, MesaId, ColegioId, PartidosId) values (2,1,1,1)
	insert into Voto(VotanteId, MesaId, ColegioId, PartidosId) values (3,3,1,2)
	insert into Voto(VotanteId, MesaId, ColegioId, PartidosId) values (4,3,1,1)

	Select top 1 p.nombreDePartido, count(p.nombreDePartido) As Cantidad from Partidos p join Voto v on v.PartidosId =p.Id group by p.nombreDePartido order by p.nombreDePartido desc

	update PresidenteDeMesa set Dni = 88888888 where Dni = 55398746
	update PresidenteDeMesa set Dni = 55398746 where Dni = 88888888

	Select Nombre,Dni from PresidenteDeMesa

