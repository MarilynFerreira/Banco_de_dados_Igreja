CREATE DATABASE Banco_Igrejas
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE Banco_igrejas;

-- criando tabelas --

CREATE TABLE IGREJA(
	ID_IGREJA INT AUTO_INCREMENT,
	NOME VARCHAR(50) NOT NULL,
	CNPJ VARCHAR(20) NOT NULL,
	ENDERECO varchar(150) NOT NULL,
    PRIMARY KEY (ID_IGREJA)
);

CREATE TABLE PESSOA(
	ID_PESSOA INT AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
	CPF VARCHAR(15) NOT NULL,
    DATA_NASCIMENTO DATE NOT NULL,
    SEXO VARCHAR(1)  NOT NULL,
    ENDERECO VARCHAR(150)  NOT NULL,
    TELEFONE VARCHAR(15)  NOT NULL,
    DATA_BATISMO DATE  NOT NULL,
    ESTADO_CIVIL VARCHAR(15)  NOT NULL,
    PRIMARY KEY (ID_PESSOA, CPF),
    IGREJA INT  NOT NULL,
    FOREIGN KEY (IGREJA) REFERENCES IGREJA(ID_IGREJA)
);

CREATE TABLE CARGO(
	ID_CARGO  INT AUTO_INCREMENT,
	NOME_CARGO VARCHAR(15),
	PRIMARY KEY (ID_CARGO)
);

CREATE TABLE PESSOA_CARGO(
	PESSOA INT NOT NULL, 
	FOREIGN KEY (PESSOA) REFERENCES PESSOA (ID_PESSOA),
	CARGO INT NOT NULL,
	FOREIGN KEY (CARGO) REFERENCES CARGO (ID_CARGO) 
);

CREATE TABLE DIZIMO(
	ID_PESSOA INT NOT NULL,
	FOREIGN KEY (ID_PESSOA) REFERENCES PESSOA (ID_PESSOA),
	VALOR MEDIUMINT NOT NULL,
	DATA_PAGAMENTO DATE
);

CREATE TABLE AGENDAMENTO_PASTORAL(
	ID_AGENDAMENTO  INT AUTO_INCREMENT,
	PESSOA_PASTOR INT NOT NULL,
	PESSOA_ACONSELHADA INT NOT NULL,
	DATA_ACONSELHAMENTO DATE,
	HORA_INICIO TIME,
	HORA_FIM TIME,
	LOCAL_ACONSELHAMENTO VARCHAR(150),
	PRIMARY KEY (ID_AGENDAMENTO),
	FOREIGN KEY (PESSOA_PASTOR) REFERENCES PESSOA(ID_PESSOA),
	FOREIGN KEY (PESSOA_ACONSELHADA) REFERENCES PESSOA(ID_PESSOA)
);

-- Inserindo dados nas tabelas --

INSERT INTO IGREJA 
	(NOME, CNPJ, ENDERECO) 
VALUES
	("Assembleia de Deus de Niteroi", "18.579.676/0001-47", "Rua Conrado Barbosa de Souza, 441 , Fonseca - RJ"),
	("Assembleia de Deus de São Gonçalo", "12.130.285/0001-64", "Alameda Teresina, 936, Rio do Ouro - RJ"),
	("Assembleia de Deus de Itaboraí", "52.828.156/0001-69", "Rua H, 513 , Retiro São Joaquim - RJ");   
    
INSERT INTO PESSOA    
    (NOME, CPF, DATA_NASCIMENTO, SEXO, ENDERECO, TELEFONE, DATA_BATISMO, ESTADO_CIVIL, IGREJA)
VALUES
	("Aurora Francisca Fernandes", "378.068.527-27", "1972-05-10", "F", "Rua Oscar Gomes, 740, Jóquei Clube, São Gonçalo - RJ", "(21) 99526-3664", "2010-02-11", "Casada", 2),
    ("Silvana Raquel Ramos", "721.805.757-85", "1953-05-21", "F", "Rua Vidal de Negreiros, 880, Jardim Catarina - RJ", "(21) 99118-4544", "1993-04-06", "Viuva", 2),
    ("Renato Geraldo Marcelo", "604.525.347-71", "1969-02-06","M", "Rua Maria Clara Sena,105, Gradim - RJ", "(21) 99729-5111", "1999-03-10", "Casado", "2"),
    ("Heitor Heitor Porto", "368.681.377-70", "1999-01-05", "M", "Rua Amália de Souza, 861, Zé Garoto - RJ ", "(21) 98426-5078", "2002-04-13", "Solteiro", "2"),
    ("Giovanni Gustavo João Santos", "476.655.767-02", "1954-08-01", "M", "Rua Armandinho Alves Ferreira, 890, Bom Retiro - RJ", "(21) 99432-6680", "2007-12-08", "Casado", "2"),
    ("Cauã Martin Manoel da Cunha", "282.633.377-12", "1975-05-04", "M", "Rua Alice Ferreira Cotrim, Coelho - RJ", "(21) 99622-4211", "1990-07-30", "Casado", "2"),
    ("Cristiane Tereza Monteiro", "086.401.367-18", "1987-01-01", "F", "Rua Roseli do Nascimento, Marambaia - RJ", "(21) 99405-8153", "2000-02-03", "Casada", "2"),
    ("Gustavo Tiago Campos", "098.560.297-08", "1981-04-11", "M", "Rua Comandante Ari Parreiras, Porto Velho - RJ", "(21) 99891-5748", "2001-10-26", "Casado", "2"),
   
    ("João Daniel Rodrigues", "731.259.787-42", "1980-03-02", "M", "Travessa Gastão Lopes Neto, Quissamã - RJ", "(21) 98744-5721", "1999-07-16", "Casado", "3"),
	("Eduardo Fábio Porto", "253.116.827-36", "1981-10-04", "M", "Rua B, Areal - RJ", "(21) 98735-1659", "1993-05-01", "Viuvo", "3"),
    ("Samuel Luís Viana", "074.754.787-42", "1983-01-03", "M", "Rua Goiás, Vila Brasil - RJ", "(21) 99432-6156", "1994-09-07", "Casado", "3"),
    ("Marcos  João Iago Caldeira", "918.553.927-98", "1983-01-23", "M", "Rua Onze, Jardim Ferma - RJ", "(21) 99714-5127", "2001-08-07", "Casado", "3"),
    ("Maria Fernanda Diaz", "253.116.827-36", "1982-01-13", "F", "Rua B, Caluge - RJ", "(21) 99769-0428", "2001-05-07", "Casada", "3"),
    ("Edson Diogo Bernardo Lima", "589.121.407-52", "1979-09-20", "M", "João Caetano (Itambi) - RJ", "(21) 98526-4227", "1989-08-02", "Viuvo", "3"),
    
    ("Luciana Nair Pinto", "575.669.077-86", "1985-03-06", "F", "Travessa Monte Serrat, Fonseca - RJ", "(21) 9820-20932", "1998-03-11", "Casada", "1"),
    ("Raquel Sophie Assis", "180.165.147-74", "1984-05-12", "F", "Rua Eurico Aragão, Piratininga - RJ", "(21) 99367-4928", "2002-02-25", "Solteira", "1"),
    ("Mateus Marcos Vinicius João Brito", "040.759.117-64", "1978-06-03", "M", "Rua das Begônias, Itacoatiara - RJ", "(21) 98356-0549", "2010-04-17", "Viúvo", "1"),
    ("João Breno Victor Ferreira", "646-334-677.27", "1978-05-21", "M", "Travessa Maria Elmira, Santa Rosa - RJ", "(21) 98485-2887", "2019-10-04", "Casado", "1"),
	("Lucas Mário Diogo Peixoto","629.981.677-56", "1988-03-24", "M","Rua Um, Sapê - RJ","(21) 99232-4930", "2021-04-13", "Casado", 1),
	("Cláudio Matheus da Cruz", "233.491.117-85", "1987-11-18", "M", "Travessa Herdy, Santa Rosa - RJ", "(22) 98324-6175", "2015-11-04", "Casado", 1);

INSERT INTO CARGO
(NOME_CARGO)
VALUES
("Pastor"),  ("Diácono"),  ("Presbítero"), 
 ("Tesoureiro"),  ("Secretário");

INSERT INTO PESSOA_CARGO
(PESSOA, CARGO)
VALUES
(5, 1), (6, 3), (6, 4), (4, 2),
(8, 3), (10, 1), (12, 3), (13, 5),
(14, 4), (10, 2), (17, 1), (20, 4),
(16,5), (18,3), (19,2);

INSERT INTO AGENDAMENTO_PASTORAL
(PESSOA_PASTOR, PESSOA_ACONSELHADA, DATA_ACONSELHAMENTO, HORA_INICIO, HORA_FIM, LOCAL_ACONSELHAMENTO)
VALUES
(5, 1, "2022-06-01", "14:00", "15:00", "Assembleia de Deus de São Gonçalo"),
(5, 3, "2022-06-04", "19:00", "20:00", "Assembleia de Deus de São Gonçalo"),
(5, 4, "2022-06-08", "14:00", "15:00", "Assembleia de Deus de São Gonçalo"),
(5, 2, "2022-06-11", "18:00", "19:00", "Assembleia de Deus de São Gonçalo"),
(5, 6, "2022-06-15", "14:00", "15:00", "Assembleia de Deus de São Gonçalo"),
(5, 8, "2022-06-18", "19:00", "20:00", "Assembleia de Deus de São Gonçalo"),
(5, 7, "2022-06-22", "14:00", "15:00", "Assembleia de Deus de São Gonçalo"),
(5, 2, "2022-06-25", "18:00", "19:00", "Assembleia de Deus de São Gonçalo"),
(5, 8, "2022-06-29", "20:00", "21:00", "Assembleia de Deus de São Gonçalo"),
(5, 6, "2022-07-02", "18:00", "19:00", "Assembleia de Deus de São Gonçalo"),

(10, 11, "2022-05-30","16:00", "17:00",  "Assembleia de Deus de Itaboraí"),
(10, 9, "2022-06-03","13:00", "14:00",  "Assembleia de Deus de Itaboraí"),
(10, 14, "2022-06-06","19:00", "20:00",  "Assembleia de Deus de Itaboraí"),
(10, 13, "2022-06-11","20:00", "21:00",  "Assembleia de Deus de Itaboraí"),
(10, 12, "2022-06-13","17:00", "18:00",  "Assembleia de Deus de Itaboraí"),
(10, 9, "2022-06-17","15:00", "16:00",  "Assembleia de Deus de Itaboraí"),
(10, 12, "2022-06-20","18:30", "19:30",  "Assembleia de Deus de Itaboraí"),
(10, 11, "2022-06-24","13:40", "14:40",  "Assembleia de Deus de Itaboraí"),
(10, 14, "2022-06-27","16:00", "17:00",  "Assembleia de Deus de Itaboraí"),
(10, 13, "2022-07-01","20:00", "21:00",  "Assembleia de Deus de Itaboraí"),

(17, 20, "2022-06-01", "09:00", "10:00", "Assembleia de Deus de Niterói"),
(17, 18, "2022-06-02", "10:30", "11:30", "Assembleia de Deus de Niterói"),
(17, 15, "2022-06-08", "08:00", "09:00", "Assembleia de Deus de Niterói"),
(17, 19, "2022-06-09", "09:30", "10:30", "Assembleia de Deus de Niterói"),
(17, 16, "2022-06-15", "11:40", "12:40", "Assembleia de Deus de Niterói"),
(17, 20, "2022-06-16", "07:00", "08:00", "Assembleia de Deus de Niterói"),
(17, 15, "2022-06-22", "08:10", "09:10", "Assembleia de Deus de Niterói"),
(17, 16, "2022-06-23", "14:00", "15:00", "Assembleia de Deus de Niterói"),
(17, 19, "2022-06-29", "15:00", "16:00", "Assembleia de Deus de Niterói"),
(17, 15, "2022-06-30", "14:00", "15:00", "Assembleia de Deus de Niterói");

-- Registros de 50 dizimos de Pessoas diferentes --
-- 1 ao 10 --

INSERT INTO Dizimo 
(ID_PESSOA, VALOR , DATA_PAGAMENTO) 
VALUES
	(20, 100.00, '2022-02-20'),
	(2, 130.00, '2022-02-20'),
	(15, 500.00, '2022-02-20'),
	(12, 90.00, '2022-06-20'),
	(18, 100.00,'2022-02-20'),
	(16, 430.00, '2022-02-20'),
	(1, 105.00, '2022-02-20'),
	(17, 200.00, '2022-02-20'),
	(4, 500.00, '2022-02-20'),
	(13, 235.00, '2022-02-20');

-- 11 ao 20 --

INSERT INTO DIZIMO 
( ID_PESSOA, VALOR , DATA_PAGAMENTO ) 
VALUES
	(3, 100.00,'2022-03-20'),
	(4, 130.00,'2022-03-20'),
	(20, 500.00,'2022-03-20'),
	(16, 90.00,'2022-03-20'),
	(6, 100.00,'2022-03-20'),
	(8, 430.00,'2022-03-20'),
	(15, 105.00,'2022-03-20'),
	(17, 200.00,'2022-03-20'),
	(1, 500.00,'2022-03-20'),
	(19, 235.00,'2022-03-20');

-- 21 ao 30 --

INSERT INTO DIZIMO 
(ID_PESSOA, VALOR , DATA_PAGAMENTO ) 
VALUES 
	(1, 100.00, '2022-04-20'),
	(2, 130.00, '2022-04-20'),
	(3, 500.00, '2022-04-20'),
	(4, 90.00, '2022-04-20'),
	(6, 100.00,'2022-04-20'),
	(5, 430.00,'2022-04-20'),
	(8, 105.00,'2022-04-20'),
	(9, 200.00,'2022-06-20'),
	(11, 500.00,'2022-04-20'),
	(13, 235.00, '2022-04-20');

-- 31 ao 40 --

INSERT INTO DIZIMO 
(ID_PESSOA, VALOR , DATA_PAGAMENTO ) 
VALUES 
	(14, 100.00, '2022-05-20'),
	(15, 130.00, '2022-05-20'),
	(16, 500.00, '2022-05-20'),
	(17, 90.00, '2022-05-20'),
	(18, 100.00,'2022-05-20'),
	(19, 430.00,'2022-05-20'),
	(8, 105.00,'2022-05-20'),
	(20, 200.00,'2022-05-20'),
	(4, 500.00,'2022-05-20'),
	(5, 235.00, '2022-05-20');

-- 41 ao 50 --

INSERT INTO DIZIMO 
(ID_PESSOA, VALOR , DATA_PAGAMENTO ) 
VALUES 
	(20, 100.00, '2022-06-20'),
	(4, 130.00, '2022-06-20'),
	(16, 500.00, '2022-06-20'),
	(14, 90.00, '2022-06-20'),
	(15, 100.00,'2022-06-20'),
	(11, 430.00,'2022-06-20'),
	(3, 105.00,'2022-06-20'),
	(15, 200.00,'2022-06-20'),
	(18, 500.00,'2022-06-20'),
	(18, 235.00, '2022-06-20');







SELECT * FROM PESSOA_CARGO PC
INNER JOIN PESSOA P
ON PC.ID_CARGO = P.ID_PESSOA
WHERE (CARGO) = Presbitero