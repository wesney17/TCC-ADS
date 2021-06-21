DROP DATABASE BD_TCC;
CREATE DATABASE BD_TCC; 
USE BD_TCC;

#----------------------------------- CRIANDO AS TABELAS --------------------------------------------

CREATE TABLE TBL_CATEGORIA
(COD_CAT VARCHAR(20) PRIMARY KEY,
NOME_CAT VARCHAR(45) NOT NULL);

CREATE TABLE TBL_CLIENTE 
(COD_CLI INT(10) PRIMARY KEY AUTO_INCREMENT,
CPF_CLI VARCHAR(15) UNIQUE NOT NULL,
NOME_CLI VARCHAR(45) NOT NULL,
COD_CAT VARCHAR(45),
CONSTRAINT FK_CLIENTE_CATEGORIA  FOREIGN KEY (COD_CAT) REFERENCES TBL_CATEGORIA (COD_CAT));

CREATE TABLE TBL_EMPRESA 
(COD_EMP INT(10) PRIMARY KEY AUTO_INCREMENT, 
NOME_FANTASIA_EMP VARCHAR(20) NOT NULL,
CNPJ_EMP VARCHAR (20) UNIQUE NOT NULL,
EMAIL_EMP VARCHAR(45) NOT NULL,
SENHA_EMP VARCHAR(45) NOT NULL,
COD_CAT VARCHAR(45),
CONSTRAINT FK_EMPRESA_CATEGORIA FOREIGN KEY (COD_CAT) REFERENCES TBL_CATEGORIA (COD_CAT));

CREATE TABLE TBL_FORNECEDOR 
(COD_FOR INT(10) PRIMARY KEY AUTO_INCREMENT,
CNPJ_FOR VARCHAR(20) UNIQUE NOT NULL,
NOME_FANTASIA_FOR VARCHAR(45) NOT NULL,
COD_CAT VARCHAR(45),
CONSTRAINT FK_FORNECEDOR_CATEGORIA FOREIGN KEY (COD_CAT) REFERENCES TBL_CATEGORIA (COD_CAT));

CREATE TABLE TBL_ENDERECO 
(COD_END INT(10) PRIMARY KEY AUTO_INCREMENT,
LOUGRADOURO VARCHAR(45) NOT NULL,
NUMERO VARCHAR(10) NOT NULL,
CEP VARCHAR(12) NOT NULL,
PAIS VARCHAR(45) NOT NULL,
ESTADO VARCHAR(45) NOT NULL,
CIDADE VARCHAR(45) NOT NULL,
BAIRRO VARCHAR(45) NOT NULL,
COMPLEMENTO VARCHAR(45),
COD_CAT VARCHAR(45),
CONSTRAINT FK_ENDERECO_CATEGORIA FOREIGN KEY (COD_CAT) REFERENCES TBL_CATEGORIA (COD_CAT));

CREATE TABLE TBL_CONTATO
(COD_CON INT(10) PRIMARY KEY AUTO_INCREMENT,
TELEFONE_MOVEL VARCHAR(16) NOT NULL,
TELEFONE_FIXO VARCHAR(15),
EMAIL VARCHAR(45) NOT NULL,
COD_CAT VARCHAR(45),
CONSTRAINT FK_CONTATO_CATEGORIA FOREIGN KEY (COD_CAT) REFERENCES TBL_CATEGORIA (COD_CAT));

CREATE TABLE TBL_PRODUTO
(COD_PROD INT(10) PRIMARY KEY AUTO_INCREMENT, 
NOME_PROD VARCHAR(45) NOT NULL,
COD VARCHAR(10) NOT NULL, 
DESCRICAO_PROD TEXT(100) NOT NULL,
ESTOQUE_PROD INT(10) UNSIGNED NOT NULL,
VALOR_PROD DECIMAL(10,2) UNSIGNED NOT NULL,
COD_EMP INT(10),
COD_FOR INT(10),
CONSTRAINT FK_PRODUTO_EMPRESA FOREIGN KEY (COD_EMP) REFERENCES TBL_EMPRESA (COD_EMP),
CONSTRAINT FK_PRODUTO_FORNECEDOR FOREIGN KEY (COD_FOR) REFERENCES TBL_FORNECEDOR (COD_FOR)); 

CREATE TABLE TBL_DEPARTAMENTO 
(COD_DEP INT(10) PRIMARY KEY AUTO_INCREMENT ,
NOME_DEP VARCHAR(45) NOT NULL,
COD_EMP INT(10),
CONSTRAINT FK_DEPARTAMENTO_EMPRESA FOREIGN KEY (COD_EMP) REFERENCES TBL_EMPRESA (COD_EMP));

CREATE TABLE TBL_FUNCIONARIO
(COD_FUN INT(10) PRIMARY KEY AUTO_INCREMENT,
CPF_FUN VARCHAR(15) UNIQUE NOT NULL,
NOME_FUN VARCHAR(45) NOT NULL,
EMAIL_FUN VARCHAR (45) UNIQUE NOT NULL,
SENHA_FUN VARCHAR (50) NOT NULL,
TELEFONE_MOVEL_FUN VARCHAR(20),
COD_DEP INT(10),
CONSTRAINT FK_FUNCIONARIO_DEPARTAMENTO FOREIGN KEY (COD_DEP) REFERENCES TBL_DEPARTAMENTO (COD_DEP));

CREATE TABLE TBL_ORDEM_DE_SERVICO
(COD_SER INT(10) PRIMARY KEY AUTO_INCREMENT,
CUSTO DECIMAL(10,2),
LUCRO DECIMAL(10,2),
DATA_INICIO DATE,
DATA_FIM DATE,
PECA VARCHAR(45),
DESCRICAO_DA_ATIVIDADE VARCHAR(45),
DIAGNOSTICO VARCHAR(20),
STATOS VARCHAR(45), 
PRODUTO VARCHAR(45),
COD_FUN INT(10),
COD_CLI INT(10),
CONSTRAINT FK_OS_FUNCIONARIO FOREIGN KEY (COD_FUN) REFERENCES TBL_FUNCIONARIO (COD_FUN),
CONSTRAINT FK_OS_CLIENTE FOREIGN KEY (COD_CLI) REFERENCES TBL_CLIENTE (COD_CLI));


SELECT *FROM TBL_FUNCIONARIO;
SELECT *FROM TBL_PRODUTO;
select *from tbl_cliente;
select *from tbl_fornecedor;
select *from tbl_contato;
select *from tbl_endereco;
select *from tbl_categoria;
select *from tbl_empresa;
select *from tbl_ordem_de_servico;

SELECT CUSTO, LUCRO, DATA_INICIO, DATA_FIM, 
DESCRICAO_DA_ATIVIDADE, DIAGNOSTICO, STATOS, PRODUTO, COD_FUN, 
COD_CLI FROM TBL_ORDEM_DE_SERVICO WHERE COD_SER = '2';

SELECT COD_SER, DATA_INICIO, DATA_FIM, STATOS
FROM TBL_ORDEM_DE_SERVICO
WHERE COD_SER like '%8';

SELECT COD_SER, DATA_INICIO, DATA_FIM, STATOS, NOME_FUN
FROM TBL_ORDEM_DE_SERVICO OS
INNER JOIN TBL_FUNCIONARIO FU ON FU.COD_FUN = OS.COD_FUN
WHERE COD_SER like '%1%';

SELECT COD_PROD, NOME_PROD, CATEGORIA_PROD, DESCRICAO_PROD, ESTOQUE_PROD, VALOR_PROD
FROM TBL_PRODUTO PR
INNER JOIN TBL_FORNECEDOR FR ON FR.COD_FOR = PR.COD_FOR
WHERE NOME_PROD like '%w';

INSERT INTO TBL_CATEGORIA (COD_CAT, NOME_CAT) VALUES ('1','T');
INSERT INTO TBL_CLIENTE(COD_CLI, NOME_CLI, CPF_CLI, COD_CAT) VALUES ('77','T','2','1');

DELETE FROM TBL_CATEGORIA WHERE COD_CAT = '1';
