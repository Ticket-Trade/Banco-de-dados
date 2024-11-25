
-- Tabela de usuários
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cpf VARCHAR(11) UNIQUE,
    senha VARCHAR(100) NOT NULL,
    endereco TEXT,
    telefone VARCHAR(15)
);

-- Tabela de eventos
CREATE TABLE eventos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(150) NOT NULL,
    local VARCHAR(200) NOT NULL,
    data_hora DATETIME NOT NULL,
    descricao TEXT,
    preco FLOAT NOT NULL
);

-- Tabela de vendedores
CREATE TABLE vendedores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    empresa VARCHAR(150)
);

-- Tabela de vendas
CREATE TABLE vendas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER,
    evento_id INTEGER,
    quantidade INTEGER NOT NULL,
    total FLOAT NOT NULL,
    data_venda DATETIME NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (evento_id) REFERENCES eventos(id)
);

-- Tabela de autenticação de ingressos
CREATE TABLE autenticacao_ingressos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ingresso_id INTEGER,
    codigo_autenticacao VARCHAR(100) UNIQUE,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (ingresso_id) REFERENCES vendas(id)
);

-- Tabela de suporte ao cliente
CREATE TABLE suporte_cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER,
    assunto VARCHAR(100) NOT NULL,
    mensagem TEXT NOT NULL,
    data_envio DATETIME NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
