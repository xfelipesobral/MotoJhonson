CREATE DATABASE IF NOT EXISTS motojhonson;

USE motojhonson;

CREATE TABLE IF NOT EXISTS usuarios(
    id INT NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    situacao BINARY DEFAULT 0,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS empresas(
    USUARIO_id INT NOT NULL,
    cnpj VARCHAR(20) NOT NULL UNIQUE,
    carteira FLOAT,
    telefone VARCHAR(20) NOT NULL,
    disponivel BINARY DEFAULT 0,
    PRIMARY KEY (USUARIO_id),
    FOREIGN KEY (USUARIO_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS motoboys(
    USUARIO_id INT NOT NULL,
    cpf VARCHAR(20) NOT NULL UNIQUE,
    carteira FLOAT,
    telefone VARCHAR(20) NOT NULL,
    disponivel BINARY DEFAULT 0,
    PRIMARY KEY (USUARIO_id),
    FOREIGN KEY (USUARIO_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS enderecos(
    id INT NOT NULL AUTO_INCREMENT,
    USUARIO_id INT NOT NULL,
    cep VARCHAR(30) NOT NULL,
    cidade VARCHAR(100),
    bairro VARCHAR(100),
    rua VARCHAR(100),
    numero INT,
    referencia VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (USUARIO_id) REFERENCES usuarios(id) ON DELETE CASCADE
);