PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Endereco;
DROP TABLE IF EXISTS DadosBancarios;
DROP TABLE IF EXISTS Avaliacao;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Rifa;
DROP TABLE IF EXISTS Bilhete;

CREATE TABLE Usuario (
    idUsuario integer PRIMARY KEY AUTOINCREMENT,
    email text NOT NULL UNIQUE,
    senha text NOT NULL,
    cpf text NOT NULL UNIQUE,
    nomeCompleto text NOT NULL,
    acesso text NOT NULL,
    dtCadastro date NOT NULL
);

CREATE TABLE Endereco (
    idEndereco integer PRIMARY KEY AUTOINCREMENT,
    idUsuario integer REFERENCES Usuario (idUsuario) ON DELETE CASCADE,
    cep text NOT NULL,
    logradouro text NOT NULL,
    numero text NOT NULL,
    complemento text NOT NULL,
    bairro text NOT NULL,
    cidade text NOT NULL,
    estado text NOT NULL
);

CREATE TABLE DadoBancario (
    idDadoBancario integer PRIMARY KEY AUTOINCREMENT,
    idUsuario integer REFERENCES Usuario (idUsuario) ON DELETE CASCADE,
    banco int NOT NULL,
    agencia text NOT NULL,
    conta text NOT NULL
);

CREATE TABLE Avaliacao (
    idAvaliacao integer PRIMARY KEY AUTOINCREMENT,
    idAvaliador integer REFERENCES Usuario (idUsuario), /* usuário avaliador */
    idAvaliado integer REFERENCES Usuario (idUsuario) ON DELETE CASCADE, /* usuário avaliado */
    nota real NOT NULL CHECK (nota<=5.0),
    comentario text NOT NULL,
    dtAvaliacao date NOT NULL
);

CREATE TABLE Pedido (
    idPedido integer PRIMARY KEY AUTOINCREMENT,
    idUsuario integer REFERENCES Usuario (idUsuario),
    valorTotal real NOT NULL,
    dtPedido date NOT NULL,
    estadoPedido text NOT NULL
);

CREATE TABLE Rifa (
    idRifa integer PRIMARY KEY AUTOINCREMENT,
    idUsuario integer REFERENCES Usuario (idUsuario), /* usuário criador da rifa */
    produto text NOT NULL,
    imagem text NOT NULL,
    descricao text NOT NULL,
    valorMinimo real NOT NULL,
    qtdBilhete integer NOT NULL,
    dtAnuncio date NOT NULL,
    dtSorteio date NOT NULL
);

CREATE TABLE Bilhete (
    idBilhete integer PRIMARY KEY AUTOINCREMENT,
    idRifa integer REFERENCES Rifa (idRifa) ON DELETE CASCADE,
    idPedido integer REFERENCES Pedido (idPedido),
    numBilhete text NOT NULL,
    valorBilhete real NOT NULL,
    dtCompra date
);

INSERT INTO Usuario (email, senha, cpf, nomeCompleto, acesso, dtCadastro) VALUES

('JoãodaSilva@gmail.com', '1234', '123456789-10', 'João da Silva', 'comum', date('now')),
('JosédeSouza@gmail.com', '5678', '123456789-11', 'José de Souza', 'comum', date('now')),
('AntonioFerreira@gmail.com', '10122', '123456789-12', 'Antonio Ferreira', 'comum', date('now')),
('MariaAntonia@gmail.com', '14566', '123456789-13', 'Maria Antonia', 'comum', date('now')),
('AugustoFernandes@gmail.com', '19010', '123456789-14', 'Augusto Fernandes', 'comum', date('now')),
('FernandoMiguel@gmail.com', '23454', '123456789-15', 'Fernando Miguel', 'comum', date('now')),
('RafaelGalhardo@gmail.com', '27898', '123456789-16', 'Rafael Galhardo', 'comum', date('now')),
('Werley@gmail.com', '32342', '123456789-17', 'Werley', 'comum', date('now')),
('LeandroCastan@gmail.com', '36786', '123456789-18', 'Leandro Castan', 'comum', date('now')),
('Ramon@gmail.com', '41230', '123456789-19', 'Ramon', 'comum', date('now')),
('BrunoRitter@gmail.com', '45674', '123456789-20', 'Bruno Ritter', 'comum', date('now')),
('LeandroDesábato@gmail.com', '50118', '123456789-21', 'Leandro Desábato', 'comum', date('now')),
('WillianMaranhão@gmail.com', '54562', '123456789-22', 'Willian Maranhão', 'comum', date('now')),
('Fabrício@gmail.com', '59006', '123456789-23', 'Fabrício', 'comum', date('now')),
('YagoPikachu@gmail.com', '63450', '123456789-24', 'Yago Pikachu', 'comum', date('now')),
('MaxiLópez@gmail.com', '67894', '123456789-25', 'Maxi López', 'comum', date('now')),
('Isabela@gmail.com', '72338', '123456789-26', 'Isabela', 'comum', date('now'));

INSERT INTO Rifa (idUsuario, produto, imagem, descricao, valorMinimo, qtdBilhete, dtAnuncio, dtSorteio) VALUES

('5', 'Samsung', 'img/product/samsung.png', '1 Celular smartphone ', '1000', '100',  date('2018-10-20'), date('2018-11-20')),
('6', 'Camisa', 'img/product/camisa.png', '10 Camisas Ralf Lauren ', '500', '100', date('2018-10-20'), date('2018-11-20')),
('7', 'Cartão de memória', 'img/product/cartao.png', '1 Cartão de memória de 1TB para celular', '300', '100', date('2018-10-20'), date('2018-11-20')),
('7', 'Ipod', 'img/product/ipod.jpg', 'Reprodutor de música MP3, MP4 e MP5', '300', '100', date('2018-10-20'), date('2018-11-20')),
('8', 'Câmera Sony', 'img/product/camera.jpg', '1 Câmera digital', '500', '100', date('2018-10-20'), date('2018-11-20')),
('8', 'Relógio', 'img/product/relogio.png', '7 Relógios masculinos', '700', '100', date('2018-10-20'), date('2018-11-20')),
('9', 'Vestido', 'img/product/vestido.png', '3 Vestidos femininos', '2000', '100',  date('2018-10-20'), date('2018-11-20')),
('10', 'Bolsa', 'img/product/bolsa.jpg', '4 Bolsas femininas', '3500', '100',  date('2018-10-20'), date('2018-11-20')),
('11', 'Moto', 'img/product/moto.png', '1 Moto usado', '5000', '100',  date('2018-10-20'), date('2018-11-20'));

INSERT INTO Bilhete (idRifa, numBilhete, valorBilhete) VALUES

('1', '1', '10'),
('1', '2', '10'),
('1', '3', '10'),
('1', '4', '10'),
('1', '5', '10'),
('1', '6', '10'),
('1', '7', '10'),
('1', '8', '10'),
('1', '9', '10'),
('1', '10', '10'),
('1', '11', '10'),
('1', '12', '10'),
('1', '13', '10'),
('1', '14', '10'),
('1', '15', '10'),
('1', '16', '10'),
('1', '17', '10'),
('1', '18', '10'),
('1', '19', '10'),
('1', '20', '10'),
('1', '21', '10'),
('1', '22', '10'),
('1', '23', '10'),
('1', '24', '10'),
('1', '25', '10'),
('1', '26', '10'),
('1', '27', '10'),
('1', '28', '10'),
('1', '29', '10'),
('1', '30', '10'),
('2', '1', '5'),
('2', '2', '5'),
('2', '3', '5'),
('2', '4', '5'),
('2', '5', '5'),
('2', '6', '5'),
('2', '7', '5'),
('2', '8', '5'),
('2', '9', '5'),
('2', '10', '5'),
('2', '11', '5'),
('2', '12', '5'),
('2', '13', '5'),
('2', '14', '5'),
('2', '15', '5'),
('2', '16', '5'),
('2', '17', '5'),
('2', '18', '5'),
('2', '19', '5'),
('2', '20', '5'),
('2', '21', '5'),
('2', '22', '5'),
('2', '23', '5'),
('2', '24', '5'),
('2', '25', '5'),
('2', '26', '5'),
('2', '27', '5'),
('2', '28', '5'),
('2', '29', '5'),
('2', '30', '5'),
('3', '1', '3'),
('3', '2', '3'),
('3', '3', '3'),
('3', '4', '3'),
('3', '5', '3'),
('3', '6', '3'),
('3', '7', '3'),
('3', '8', '3'),
('3', '9', '3'),
('3', '10', '3'),
('3', '11', '3'),
('3', '12', '3'),
('3', '13', '3'),
('3', '14', '3'),
('3', '15', '3'),
('3', '16', '3'),
('3', '17', '3'),
('3', '18', '3'),
('3', '19', '3'),
('3', '20', '3'),
('3', '21', '3'),
('3', '22', '3'),
('3', '23', '3'),
('3', '24', '3'),
('3', '25', '3'),
('3', '26', '3'),
('3', '27', '3'),
('3', '28', '3'),
('3', '29', '3'),
('3', '30', '3'),
('4', '1', '3'),
('5', '1', '5'),
('6', '1', '7'),
('7', '1', '20'),
('8', '1', '35'),
('9', '1', '50');