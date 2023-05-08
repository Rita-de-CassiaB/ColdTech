
CREATE DATABASE coldtech;
USE coldtech;

CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
cnpj VARCHAR(18),
senha VARCHAR(8),
email VARCHAR(45)
);

INSERT INTO empresa VALUES
(NULL, 'Swift', '11.779.652/0001-00', 12345678, 'fernando@gmail.com');

CREATE TABLE usuario(
idUsuario INT auto_increment,
nome VARCHAR(45),
email VARCHAR(45),
senha CHAR(8),
fkEmpresa INT,
CONSTRAINT fkEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
CONSTRAINT pkComposta PRIMARY KEY (idUsuario, fkEmpresa)
);

INSERT INTO usuario VALUES
(NULL, 'Fernando Brandão', 'Fernando.Brandão@swift.com', '#ST45698', 1);

CREATE TABLE localSensor(
idLocal INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
fkEmpresa INT,
CONSTRAINT fkEmpresaa FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa)
);

INSERT INTO localSensor VALUES 
(NULL, 'FREEZER 1', 1);

CREATE TABLE sensor(
idSensor INT PRIMARY KEY auto_increment,
nome VARCHAR(10),
tipo VARCHAR(45),
fkLocalSensor INT,
CONSTRAINT fkLocalSensor FOREIGN KEY (fkLocalSensor) REFERENCES localSensor (idLocal)
);

INSERT INTO sensor VALUES
(NULL, 'LM35', 'temperatura', 1);

CREATE TABLE medicao(
idMedicao INT, 
temperatura FLOAT, 
fkSensor INT, 
CONSTRAINT fkSensor FOREIGN KEY (fkSensor) REFERENCES sensor (idSensor),
dataHora DATETIME default current_timestamp,
CONSTRAINT pkComposta PRIMARY KEY (idMedicao, fkSensor)
);

INSERT INTO medicao VALUES
(1, '-12.00', 1, default);

SELECT * FROM usuario;

SELECT * FROM empresa;

SELECT * FROM sensor;

SELECT * FROM localSensor;

SELECT * FROM medicao;

-- EXIBIR O USUÁRIO E SUA EMPRESA
SELECT * FROM usuario JOIN empresa ON idEmpresa = fkEmpresa;

-- EXIBIR O SENSOR E O SEU LOCAL
SELECT * FROM sensor JOIN localSensor ON idLocal = fkLocalSensor;

-- EXIBIR O SENSOR E SUA LEITURA
SELECT * FROM sensor JOIN medicao ON idSensor = fkSensor;

-- EXIBIR O LOCAL ONDE ESTÁ O SENSOR NA EMPRESA
SELECT * FROM localSensor JOIN empresa ON idEmpresa = fkEmpresa;