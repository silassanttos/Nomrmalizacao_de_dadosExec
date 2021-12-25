CREATE DATABASE NORMALIZACAO_DADOS;
USE NORMALIZACAO_DADOS;

CREATE  TABLE IF NOT EXISTS TIPO (
	CODIGO_TIP			INT AUTO_INCREMENT NOT NULL,
    TIPO_NOME 		VARCHAR(250) NOT NULL,
    CONSTRAINT PK_TIPO PRIMARY key (CODIGO_TIP)
);


CREATE TABLE IF NOT EXISTS INTRUTUR (
	CODIGO_INST 	INT AUTO_INCREMENT NOT NULL,
    NOME_INSTRUTOR 	VARCHAR(250) NOT NULL,
    TELEFONE		VARCHAR(15),
    CONSTRAINT PK_INSTRUTOR PRIMARY KEY(CODIGO_INST)
);

CREATE TABLE IF NOT EXISTS CURSO(
	CODIGO_CUR		INT AUTO_INCREMENT NOT NULL,
    NOME_CURSO		VARCHAR(250) NOT NULL,
    CODIGO_TIP		INT NOT NULL,
    CODIGO_INST		INT NOT NULL,
    VALOR			DECIMAL(10,2),
    
    CONSTRAINT PK_CURSO PRIMARY KEY (CODIGO_CUR),
    CONSTRAINT FK_TIPO_2_pk_CURSO 
					FOREIGN KEY (CODIGO_TIP) REFERENCES TIPO (CODIGO_TIP),
	CONSTRAINT FK_INSTRUTOR_2_PK_CURSO 
					FOREIGN KEY (CODIGO_INST) REFERENCES INSTRUTOR (CODIGO_INST)
);

CREATE TABLE IF NOT EXISTS ALUNO(
	CODIGO_ALUN 		INT AUTO_INCREMENT,
    NOME_ALUNO			VARCHAR(250),
    ENDERECO			VARCHAR(250),
    EMAIL				VARCHAR(250),
    CONSTRAINT PK_ALUNO 
				PRIMARY KEY (CODIGO_ALUN)
);

CREATE TABLE IF NOT EXISTS PEDIDO(
	CODIGO_PED		INT AUTO_INCREMENT,
    ALUNO			INT NOT NULL,
    DATA			DATE,
    HORA			TIME,
    
    CONSTRAINT PK_PEDIDO PRIMARY KEY (CODIGO_PED),
    CONSTRAINT FK_ALUNO 
				FOREIGN KEY (ALUNO) REFERENCES ALUNO (CODIGO_ALUN)
);

CREATE TABLE IF NOT EXISTS PEDIDO_DETALHE (
	PEDIDO		INT,
    CURSO		INT,
    VALOR		DECIMAL(10,2),
    CONSTRAINT FK_PEDIDO 	
				FOREIGN KEY (PEDIDO) REFERENCES PEDIDO (CODIGO_PED),
	CONSTRAINT FK_CURSO	
				FOREIGN KEY (CURSO) REFERENCES CURSO(CODIGO_CUR)
);

