

CREATE TABLE Veiculos (
    Veiculo VARCHAR(50) PRIMARY KEY,
    Variante VARCHAR(50),
    Cor VARCHAR(50),
    Placa VARCHAR(20)
);

CREATE TABLE Clientes (
    Cliente VARCHAR(50) PRIMARY KEY,
    CPF VARCHAR(15),
    Nascimento DATE
);

CREATE TABLE Locacoes (
    CodLocacao INT PRIMARY KEY,
    Veiculo VARCHAR(50),
    Cliente VARCHAR(50),
    Diaria DECIMAL(5, 2),
    Dias INT,
    FOREIGN KEY (Veiculo) REFERENCES Veiculos(Veiculo),
    FOREIGN KEY (Cliente) REFERENCES Clientes(Cliente)
);

-- Inserir dados na tabela Veiculos
INSERT INTO Veiculos (Veiculo, Variante, Cor, Placa)
VALUES ('Fusca', 'Comum', 'Preto', 'WER-3456'),
       ('Variante', 'Comodoro', 'Rosa', 'FDS-8384'),
       ('Deloriam', 'Luxo', 'Preto', 'CVB-9933'),
       ('Brasilia', 'Compacto', 'Azul', 'FGH-2256'),
       ('Brasilia', 'Compacto', 'Amarela', 'DDI-3948');

-- Inserir dados na tabela Clientes
INSERT INTO Clientes (Cliente, CPF, Nascimento)
VALUES ('Ariano Suassuna', '123.456.789-01', '1022-05-21'),
       ('Grace Hopper', '543.765.987-23', '2002-04-29'),
       ('Richard Feynman', '987.654.231-90', '2001-10-12'),
       ('Edgar Poe D', '432.765.678-67', '1998-12-14'),
       ('Gordon Freeman', '927.384.284-44', '1984-11-26');

-- Inserir dados na tabela Locacoes
INSERT INTO Locacoes (CodLocacao, Veiculo, Cliente, Diaria, Dias)
VALUES (101, 'Fusca', 'Ariano Suassuna', 30.00, 3),
       (102, 'Variante', 'Grace Hopper', 60.00, 7),
       (103, 'Deloriam', 'Richard Feynman', 20.00, 1),
       (104, 'Brasilia', 'Edgar Poe D', 80.00, 3),
       (105, 'Brasilia', 'Gordon Freeman', 45.00, 7);


CREATE VIEW ViewLocacoes AS
SELECT l.CodLocacao, l.Diaria, l.Dias, v.Veiculo, v.Variante, v.Cor, v.Placa, c.Cliente, c.CPF, c.Nascimento
FROM Locacoes l
JOIN Veiculos v ON l.Veiculo = v.Veiculo
JOIN Clientes c ON l.Cliente = c.Cliente;

