CREATE DATABASE IF NOT EXISTS motojhonson;

USE motojhonson;

CREATE TABLE IF NOT EXISTS usuarios(
    usuario VARCHAR(100) NOT NULL,
    nome VARCHAR(100),
    telefone VARCHAR(20) NOT NULL,
    carteira FLOAT,
    senha VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    situacao BINARY DEFAULT 0,
    PRIMARY KEY (usuario)
);

CREATE TABLE IF NOT EXISTS empresas(
    USUARIOS_usuario VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (USUARIOS_usuario),
    FOREIGN KEY (USUARIOS_usuario) REFERENCES usuarios(usuario) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS motoboys(
    USUARIOS_usuario VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) NOT NULL UNIQUE,
    veiculo VARCHAR(100),
    disponivel BINARY DEFAULT 0,
    PPRIMARY KEY (USUARIOS_usuario),
    FOREIGN KEY (USUARIOS_usuario) REFERENCES usuarios(usuario) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS enderecos(
    id INT NOT NULL AUTO_INCREMENT,
    USUARIOS_usuario VARCHAR(100) NOT NULL,
    cep VARCHAR(30) NOT NULL,
    municipio VARCHAR(100),
    bairro VARCHAR(100),
    logradouro VARCHAR(100),
    numero INT,
    uf VARCHAR(3),
    PRIMARY KEY (id),
    FOREIGN KEY (USUARIOS_usuario) REFERENCES usuarios(usuario) ON DELETE CASCADE
);