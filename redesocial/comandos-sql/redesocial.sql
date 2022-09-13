# CRIA BANCO
CREATE DATABASE LIVROFACE;

# CRIA TABELAS
CREATE TABLE USUARIO(
	IDUSUARIO INTEGER UNIQUE NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	SEXO CHARACTER(1) NOT NULL,
	IDDESCRICAO INTEGER,
	IDDATA INTEGER NOT NULL
);

CREATE TABLE CONTATO(
	IDCONTATO INTEGER UNIQUE NOT NULL,
	EMAIL VARCHAR(30) UNIQUE,
	CELULAR VARCHAR(15) UNIQUE,
	IDUSUARIO INTEGER NOT NULL
);

CREATE TABLE DATA_ANIVERSARIO(
	IDDATA INTEGER UNIQUE NOT NULL,
	DATA_ANIV DATE NOT NULL
);

CREATE TABLE GRUPO(
	IDGRUPO INTEGER UNIQUE NOT NULL,
	NOME VARCHAR(30) NOT NULL,
	IDDESCRICAO INTEGER
);

CREATE TABLE DESCRICAO(
	IDDESCRICAO INTEGER UNIQUE NOT NULL,
	TEXTO VARCHAR(150)
);

CREATE TABLE SEGUIDOR(
	IDSEGUIDOR INTEGER UNIQUE NOT NULL,
	NOME VARCHAR(50)
);

CREATE TABLE AMIGO(
	IDAMIGO INTEGER UNIQUE NOT NULL,
	NOME VARCHAR(50) NOT NULL
);

CREATE TABLE PUBLICACAO(
	IDPUBLI INTEGER UNIQUE NOT NULL,
	PUBLI_TIPO VARCHAR(10) NOT NULL,
	CONTEUDO VARCHAR(150),
	NOMEARQUIVO_VIDEO VARCHAR(30),
	DURACAO TIME,
	NOMEARQUIVO_FOTO VARCHAR(30),
	TAMANHO VARCHAR(6),
	IDDATAHORA INTEGER UNIQUE NOT NULL,
	IDLEGENDA_VIDEO INTEGER,
	IDLEGENDA_FOTO INTEGER
);

CREATE TABLE CURTIDA(
	NOME_USUARIO VARCHAR(50),
	IDPUBLI INTEGER
);

CREATE TABLE COMPARTILHAMENTO(
	NOME_USUARIO VARCHAR(50),
	IDPUBLI INTEGER
);

CREATE TABLE LEGENDA(
	IDLEGENDA INTEGER UNIQUE NOT NULL,
	TEXTO VARCHAR(100)
);

CREATE TABLE DATAHORA_PUBLI(
	IDDATAHORA INTEGER UNIQUE NOT NULL,
	DATA_PUBLI DATE,
	HORA TIME
);

CREATE TABLE USUARIO_GRUPO(
	IDUSUARIO INTEGER,
	IDGRUPO INTEGER
);

CREATE TABLE USUARIO_PUBLICACAO(
	IDUSUARIO INTEGER,
	IDPUBLI INTEGER
);

CREATE TABLE USUARIO_SEGUIDOR(
	IDUSUARIO INTEGER,
	IDSEGUIDOR INTEGER
);

CREATE TABLE USUARIO_AMIGO(
	IDUSUARIO INTEGER NOT NULL,
	IDAMIGO INTEGER NOT NULL
);

# ADICIONA CHAVE PRIMARIA
ALTER TABLE USUARIO ADD CONSTRAINT PK_USUARIO 
	PRIMARY KEY (IDUSUARIO);

ALTER TABLE CONTATO ADD CONSTRAINT PK_CONTATO 
	PRIMARY KEY (IDCONTATO);

ALTER TABLE DATA_ANIVERSARIO ADD CONSTRAINT PK_DATA_ANIVERSARIO 
	PRIMARY KEY (IDDATA);

ALTER TABLE GRUPO ADD CONSTRAINT PK_GRUPO
	PRIMARY KEY (IDGRUPO);

ALTER TABLE DESCRICAO ADD CONSTRAINT PK_DESCRICAO 
	PRIMARY KEY (IDDESCRICAO);

ALTER TABLE SEGUIDOR ADD CONSTRAINT PK_SEGUIDOR 
	PRIMARY KEY (IDSEGUIDOR);

ALTER TABLE AMIGO ADD CONSTRAINT PK_AMIGO 
	PRIMARY KEY (IDAMIGO);

ALTER TABLE PUBLICACAO ADD CONSTRAINT PK_PUBLICACAO 
	PRIMARY KEY (IDPUBLI);

ALTER TABLE LEGENDA ADD CONSTRAINT PK_LEGENDA 
	PRIMARY KEY (IDLEGENDA);

ALTER TABLE DATAHORA_PUBLI ADD CONSTRAINT PK_DATAHORA_PUBLI 
	PRIMARY KEY (IDDATAHORA);

# ADICIONA CHAVE ESTRANGEIRA
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_DESCRICAO 
	FOREIGN KEY (IDDESCRICAO)
	REFERENCES DESCRICAO(IDDESCRICAO)
	ON DELETE CASCADE;

ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_DATA_NIVER 
	FOREIGN KEY (IDDATA)
	REFERENCES DATA_ANIVERSARIO(IDDATA)
	ON DELETE RESTRICT;

ALTER TABLE CONTATO ADD CONSTRAINT FK_CONTATO_USUARIO 
	FOREIGN KEY (IDUSUARIO)
	REFERENCES USUARIO(IDUSUARIO)
	ON DELETE RESTRICT;

ALTER TABLE PUBLICACAO ADD CONSTRAINT FK_PUBLICACAO_DATA 
	FOREIGN KEY (IDDATAHORA)
	REFERENCES DATAHORA_PUBLI(IDDATAHORA)
	ON DELETE RESTRICT;

ALTER TABLE PUBLICACAO ADD CONSTRAINT FK_PUBLICACAO_LEGENDA
	FOREIGN KEY (IDLEGENDA_FOTO)
	REFERENCES LEGENDA(IDLEGENDA)
	ON DELETE CASCADE;

ALTER TABLE PUBLICACAO ADD CONSTRAINT FKEY_PUBLICACAO_LEGENDA
	FOREIGN KEY (IDLEGENDA_VIDEO)
	REFERENCES LEGENDA(IDLEGENDA)
	ON DELETE CASCADE;

ALTER TABLE CURTIDA ADD CONSTRAINT FK_CURTIDA_PUBLICACAO 
	FOREIGN KEY (IDPUBLI)
	REFERENCES PUBLICACAO(IDPUBLI)
	ON DELETE CASCADE;

ALTER TABLE COMPARTILHAMENTO ADD CONSTRAINT FK_COMPARTILHAMENTO_PUBLICACAO 
	FOREIGN KEY (IDPUBLI)
	REFERENCES PUBLICACAO(IDPUBLI)
	ON DELETE CASCADE;

ALTER TABLE USUARIO_GRUPO ADD CONSTRAINT FK_USUARIO_GRUPO 
	FOREIGN KEY (IDUSUARIO)
	REFERENCES USUARIO(IDUSUARIO)
	ON DELETE RESTRICT;

ALTER TABLE USUARIO_GRUPO ADD CONSTRAINT FKEY_USUARIO_GRUPO 
	FOREIGN KEY (IDGRUPO)
	REFERENCES GRUPO(IDGRUPO)
	ON DELETE SET NULL;

ALTER TABLE USUARIO_PUBLICACAO ADD CONSTRAINT FK_USUARIO_PUBLICACAO 
	FOREIGN KEY (IDUSUARIO)
	REFERENCES USUARIO(IDUSUARIO)
	ON DELETE RESTRICT;

ALTER TABLE USUARIO_PUBLICACAO ADD CONSTRAINT FKEY_USUARIO_PUBLICACAO 
	FOREIGN KEY (IDPUBLI)
	REFERENCES PUBLICACAO(IDPUBLI)
	ON DELETE SET NULL;

ALTER TABLE USUARIO_SEGUIDOR ADD CONSTRAINT FK_USUARIO_SEGUIDOR 
	FOREIGN KEY (IDUSUARIO)
	REFERENCES USUARIO(IDUSUARIO)
	ON DELETE RESTRICT;

ALTER TABLE USUARIO_SEGUIDOR ADD CONSTRAINT FKEY_USUARIO_SEGUIDOR 
	FOREIGN KEY (IDSEGUIDOR)
	REFERENCES SEGUIDOR(IDSEGUIDOR)
	ON DELETE SET NULL;

ALTER TABLE USUARIO_AMIGO ADD CONSTRAINT FK_USUARIO_AMIGO 
	FOREIGN KEY (IDUSUARIO)
	REFERENCES USUARIO(IDUSUARIO)
	ON DELETE RESTRICT;

ALTER TABLE USUARIO_AMIGO ADD CONSTRAINT FKEY_USUARIO_AMIGO
	FOREIGN KEY (IDAMIGO)
	REFERENCES AMIGO(IDAMIGO)
	ON DELETE SET NULL;