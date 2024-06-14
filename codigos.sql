
--- Criar tabelas ---
CREATE TABLE Motoristas (
    DriverID INT PRIMARY KEY,
    Nome VARCHAR(100),
    CNH VARCHAR(20),
    Endereço VARCHAR(200),
    Contato VARCHAR(50)
);
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Empresa VARCHAR(100),
    Endereço VARCHAR(200),
    Contato VARCHAR(50)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ClientID INT,
    DriverID INT,
    DetalhesPedido TEXT,
    DataEntrega DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (DriverID) REFERENCES Motoristas(DriverID)
);
GO

--- Inserir dados na tabela Motoristas ---
INSERT INTO Motoristas (DriverID, Nome, CNH, Endereço, Contato) VALUES 
(1, 'Cauã Cláudio Filipe Cavalcanti', '18.276.671-8', 'Rua Jonatas Batista, 201, Mafua', '(86) 2754-8416'), 
(2, 'Joana Sara Porto', '42.567.195-1', 'Travessa Alto do Monte, 210, Planalto', '(84) 2756-0406'), 
(3, 'Heloisa Bruna Nogueira', '13.202.243-6', 'Rua Sílvio Bussadori, 102, Centro', '(43) 2765-1015');
GO

--- Inserir dados na tabela Clients ---
INSERT INTO Clients (ClientID, Nome, Empresa, Endereço, Contato) VALUES 
(1, 'Rebeca e Lívia Limpeza ME', 'Rebeca e Lívia Limpeza ME', 'Rua Yoshihisa Naruki, 10, Centro', '(19) 3723-4495'), 
(2, 'Kauê e Marlene Entulhos ME', 'Kauê e Marlene Entulhos ME', 'Rua Professora Waldecir Amaral, 20, Jardim Nova Aparecida', '(16) 2768-8943'), 
(3, 'Cristiane e Joana Vidros ME', 'Cristiane e Joana Vidros ME', 'Rua São Vicente das Minas, 300, Jardim Nova Taboão', '(11) 3624-4623');
GO

--- Inserir dados na tabela Orders ---
INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status) VALUES 
(1, 1, 1, 'Entregar 10 caixas de produtos de limpeza', '2024-03-26', 'Finalizado'), 
(2, 2, 2, 'Retirar 5 Toneladas de Entulho', '2024-05-05', 'Pendente'), 
(3, 3, 3, 'Entregar 10 janelas de vidro', '2024-04-05', 'Pendente');
GO

-- Seleciona somente os nomes e endereços dos clientes que têm pedidos pendentes  ---
SELECT C.Nome, C.Endereço 
FROM Clients C 
JOIN Orders O ON C.ClientID = O.ClientID 
WHERE O.Status = 'Pendente';
GO
-- Seleciona somente os nomes e endereços dos clientes que têm pedidos finalizados  ---
SELECT C.Nome, C.Endereço 
FROM Clients C 
JOIN Orders O ON C.ClientID = O.ClientID 
WHERE O.Status = 'Finalizado';
GO
-- Seleciona Nome e CNH da tabela Motoristas ---
SELECT Nome, CNH 
FROM Motoristas;
GO
-- Seleciona Nome e Endereço da tabela Clients ---
SELECT Nome, Endereço 
FROM Clients;
GO
--- Atualiza o status das Orders 2 e 3 para ‘Finalizado’ ---
UPDATE Orders 
SET Status = 'Finalizado' 
WHERE OrderID IN (2, 3);
GO
-- Deleta o registro com OrderID = 2 da tabela Orders. ---
DELETE FROM Orders 
WHERE OrderID = 2;
GO
