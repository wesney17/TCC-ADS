DROP DATABASE BD_TCC;
CREATE DATABASE BD_TCC; 
USE BD_TCC;

#----------------------------------- CRIANDO AS TABELAS --------------------------------------------

CREATE TABLE TBL_CATEGORIA
(COD_CAT INT(10) PRIMARY KEY AUTO_INCREMENT,
NOME_CAR VARCHAR(45) UNIQUE NOT NULL);

CREATE TABLE TBL_CLIENTE 
(COD_CLI INT(10) PRIMARY KEY AUTO_INCREMENT,
CPF_CLI VARCHAR(15) UNIQUE NOT NULL,
NOME_CLI VARCHAR(45) NOT NULL,
#SOBRENOME_CLI VARCHAR(45),
COD_CAT INT(10),
CONSTRAINT FK_CLIENTE_CATEGORIA  FOREIGN KEY (COD_CAT) REFERENCES TBL_CATEGORIA (COD_CAT));

CREATE TABLE TBL_EMPRESA 
(COD_EMP INT(10) PRIMARY KEY AUTO_INCREMENT, 
NOME_FANTASIA_EMP VARCHAR(14) NOT NULL,
CNPJ_EMP VARCHAR (14) UNIQUE NOT NULL,
USUARIO_EMP VARCHAR (20) UNIQUE NOT NULL,
SENHA_EMP VARCHAR (20) NOT NULL,
COD_CAT INT(10),
CONSTRAINT FK_EMPRESA_CATEGORIA FOREIGN KEY (COD_CAT) REFERENCES TBL_CATEGORIA (COD_CAT));

CREATE TABLE TBL_FORNECEDOR 
(COD_FOR INT(10) PRIMARY KEY AUTO_INCREMENT,
CNPJ_FOR VARCHAR(20) UNIQUE NOT NULL,
NOME_FANTASIA_FOR VARCHAR(45) NOT NULL,
COD_CAT INT(10),
CONSTRAINT FK_FORNECEDOR_CATEGORIA FOREIGN KEY (COD_CAT) REFERENCES TBL_CATEGORIA (COD_CAT));

CREATE TABLE TBL_ENDERECO 
(COD_END INT(10) PRIMARY KEY AUTO_INCREMENT,
LOUGRADOURO VARCHAR(45) NOT NULL,
NUMERO VARCHAR(5),
CEP INT(8) UNSIGNED NOT NULL,
PAIS VARCHAR(45) NOT NULL,
ESTADO VARCHAR(45),
CIDADE VARCHAR(45) NOT NULL,
BAIRRO VARCHAR(45),
COMPLEMENTO VARCHAR(45),
COD_CAT INT(10),
CONSTRAINT FK_ENDERECO_CATEGORIA FOREIGN KEY (COD_CAT) REFERENCES TBL_CATEGORIA (COD_CAT));

CREATE TABLE TBL_CONTATO
(COD_CON INT(10) PRIMARY KEY AUTO_INCREMENT,
TELEFONE_MOVEL VARCHAR(11) NOT NULL,
TELEFONE_FIXO VARCHAR(10),
EMAIL VARCHAR(45) NOT NULL,
COD_CAT INT(10),
CONSTRAINT FK_CONTATO_CATEGORIA FOREIGN KEY (COD_CAT) REFERENCES TBL_CATEGORIA (COD_CAT));

CREATE TABLE TBL_PRODUTO
(COD_PROD INT(10) PRIMARY KEY AUTO_INCREMENT, 
NOME_PROD VARCHAR(45) NOT NULL,
CATEGORIA_PROD VARCHAR(10) NOT NULL, 
DESCRICAO_PROD TEXT(100) NOT NULL,
ESTOQUE_PROD INT(10) UNSIGNED NOT NULL,
VALOR_PROD DECIMAL(10,2) UNSIGNED NOT NULL,
COD_EMP INT(10),
COD_FOR INT(10),
CONSTRAINT FK_PRODUTO_EMPRESA FOREIGN KEY (COD_EMP) REFERENCES TBL_EMPRESA (COD_EMP),
CONSTRAINT FK_PRODUTO_FORNECEDOR FOREIGN KEY (COD_FOR) REFERENCES TBL_FORNECEDOR (COD_FOR)); 

CREATE TABLE TBL_DEPARTAMENTO 
(COD_DEP INT(10) PRIMARY KEY AUTO_INCREMENT,
NOME_DEP VARCHAR(45) NOT NULL,
COD_EMP INT(10),
CONSTRAINT FK_DEPARTAMENTO_EMPRESA FOREIGN KEY (COD_EMP) REFERENCES TBL_EMPRESA (COD_EMP));

CREATE TABLE TBL_FUNCIONARIO
(COD_FUN INT(10) PRIMARY KEY AUTO_INCREMENT,
CPF_FUN VARCHAR(15) UNIQUE NOT NULL,
NOME_FUN VARCHAR(45) NOT NULL,
USUARIO_FUN VARCHAR (20) UNIQUE NOT NULL,
SENHA_FUN VARCHAR (20) NOT NULL,
#SOBRENOME_FUN VARCHAR(45) NOT NULL,
TELEFONE_MOVEL_FUN VARCHAR(20),
COD_DEP INT(10),
CONSTRAINT FK_FUNCIONARIO_DEPARTAMENTO FOREIGN KEY (COD_DEP) REFERENCES TBL_DEPARTAMENTO (COD_DEP));

CREATE TABLE TBL_ORDEM_DE_SERVICO
(COD_SER INT(10) PRIMARY KEY AUTO_INCREMENT,
CUSTO DECIMAL(10,2),
LUCRO DECIMAL(10,2),
DATA_INICIO DATETIME(6),
DATA_FIM DATETIME(6),
PECA VARCHAR(45),
DESCRICAO_DA_ATIVIDADE VARCHAR(45),
DIAGNOSTICO VARCHAR(20),
STATOS VARCHAR(45), 
PRODUTO VARCHAR(45),
COD_FUN INT(10),
COD_CLI INT(10),
CONSTRAINT FK_OS_FUNCIONARIO FOREIGN KEY (COD_FUN) REFERENCES TBL_FUNCIONARIO (COD_FUN),
CONSTRAINT FK_OS_CLIENTE FOREIGN KEY (COD_CLI) REFERENCES TBL_CLIENTE (COD_CLI));

INSERT INTO TBL_PRODUTO
(NOME_PROD, CATEGORIA_PROD, DESCRICAO_PROD, ESTOQUE_PROD, VALOR_PROD) VALUES ('', '', '', 15, 12);

select * from tbl_ORDEM_DE_SERVICO;
SELECT NOME_PROD FROM TBL_PRODUTO WHERE NOME_PROD = 'PARAFUSO';