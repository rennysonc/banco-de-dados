-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 23-Mar-2022 às 23:35
-- Versão do servidor: 8.0.28-0ubuntu0.20.04.3
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `detran`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `AGENTE_TRANSITO`
--

CREATE TABLE `AGENTE_TRANSITO` (
  `Matricula` int NOT NULL,
  `CPF` bigint NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Sexo` varchar(100) NOT NULL,
  `Data_cont` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `AGENTE_TRANSITO`
--

INSERT INTO `AGENTE_TRANSITO` (`Matricula`, `CPF`, `Nome`, `Sexo`, `Data_cont`) VALUES
(10, 69497139080, 'Carlos Amaral', 'Masculino', '2001-02-27'),
(20, 57612074001, 'Flavio Nunes', 'Masculino', '2010-05-15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `EMAIL_AGENTE`
--

CREATE TABLE `EMAIL_AGENTE` (
  `Email` varchar(100) NOT NULL,
  `Matric_Agente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `EMAIL_AGENTE`
--

INSERT INTO `EMAIL_AGENTE` (`Email`, `Matric_Agente`) VALUES
('carlos@gmail.com', 10),
('flavio@hotmail.com', 20);

-- --------------------------------------------------------

--
-- Estrutura da tabela `INFRACAO`
--

CREATE TABLE `INFRACAO` (
  `Codigo_Infracao` int NOT NULL,
  `Placa_veiculo` varchar(7) NOT NULL,
  `Data_hora` timestamp NOT NULL,
  `Velocidade_aferida` int NOT NULL,
  `Posi_geografica` varchar(100) NOT NULL,
  `Cod_local` int NOT NULL,
  `Veloc_permitida` int NOT NULL,
  `Agente_transito` int NOT NULL,
  `CPF_proprietario` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `MODELO`
--

CREATE TABLE `MODELO` (
  `Cod_modelo` int NOT NULL,
  `Nome_modelo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `MODELO`
--

INSERT INTO `MODELO` (`Cod_modelo`, `Nome_modelo`) VALUES
(1, 'Fiat Palio'),
(2, 'Subaru WRX'),
(3, 'Honda NSX'),
(4, 'Scania'),
(5, 'Yamaha XJ6'),
(6, 'Honda Fan');

-- --------------------------------------------------------

--
-- Estrutura da tabela `PROPRIETARIO`
--

CREATE TABLE `PROPRIETARIO` (
  `CPF` bigint NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Sexo` varchar(100) NOT NULL,
  `Data_Nasc` timestamp NOT NULL,
  `Rua` varchar(500) NOT NULL,
  `Complemento` varchar(500) DEFAULT NULL,
  `Bairro` varchar(100) NOT NULL,
  `CEP` int NOT NULL,
  `Cidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `PROPRIETARIO`
--

INSERT INTO `PROPRIETARIO` (`CPF`, `Nome`, `Sexo`, `Data_Nasc`, `Rua`, `Complemento`, `Bairro`, `CEP`, `Cidade`) VALUES
(36347687038, 'Lucas Alves Fidelis Araújo', 'Masculino', '2003-04-26 03:00:00', 'Rua Professora Augusta', NULL, 'Malvinas', 58400200, 'Campina Grande'),
(39762924002, 'Renato Garcia', 'Masculino', '1994-01-01 03:00:00', 'Rua do Grau', NULL, 'Alto Branco', 67000234, 'João Pessoa'),
(42250200025, 'Flavia Nogueira', 'Feminino', '1999-09-24 03:00:00', 'Avenida Floriano Peixoto', NULL, 'Catolé', 87699222, 'Pocinhos'),
(59188120082, 'Ayrton Senna da Silva', 'Masculino', '1983-03-21 03:00:00', 'Rua dos Campeões', NULL, 'Interlagos', 58003333, 'São Paulo'),
(61168432049, 'Guilherme Souza', 'Masculino', '2001-10-08 03:00:00', 'Rua das Amoras', NULL, 'Malvinas', 58226192, 'Campina Grande'),
(83688738004, 'Bianca Pereira', 'Feminino', '2000-05-12 03:00:00', 'Rua Rio Branco', 'AP 202', 'Bodocongó', 64709120, 'Campina Grande');

-- --------------------------------------------------------

--
-- Estrutura da tabela `TELEFONE_AGENTE`
--

CREATE TABLE `TELEFONE_AGENTE` (
  `Telefone` int NOT NULL,
  `Matric_agente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TELEFONE_PROPRIETARIO`
--

CREATE TABLE `TELEFONE_PROPRIETARIO` (
  `Telefone` int NOT NULL,
  `CPF_Proprietario` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TIPO_INFRACAO`
--

CREATE TABLE `TIPO_INFRACAO` (
  `Codigo` int NOT NULL,
  `Valor_cobrado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `VEICULO`
--

CREATE TABLE `VEICULO` (
  `Placa` varchar(7) NOT NULL,
  `Chassi` varchar(100) NOT NULL,
  `Cor` varchar(100) NOT NULL,
  `Ano_Fabric` int NOT NULL,
  `Categoria` varchar(100) NOT NULL,
  `Cilindrada` int DEFAULT NULL,
  `Qtd_eixos` int DEFAULT NULL,
  `CPF_Prop` bigint NOT NULL,
  `Cod_modelo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `VEICULO`
--

INSERT INTO `VEICULO` (`Placa`, `Chassi`, `Cor`, `Ano_Fabric`, `Categoria`, `Cilindrada`, `Qtd_eixos`, `CPF_Prop`, `Cod_modelo`) VALUES
('AYG9133', '1233421011FGH', 'Amarelo', 1983, 'CAMINHAO', NULL, 4, 61168432049, 4),
('BAV8231', '456789123SXD', 'Rosa', 2012, 'MOTOCICLETA', 600, NULL, 39762924002, 5),
('BSS8888', '88909192SEN', 'Preto', 1992, 'AUTOMÓVEL', NULL, NULL, 59188120082, 3),
('MNT7459', '123450987GBT', 'Preto', 2009, 'MOTOCICLETA', 125, NULL, 83688738004, 6),
('MOR8021', '123456780ABC', 'Vermelho', 2001, 'AUTOMÓVEL', NULL, NULL, 36347687038, 1),
('NPM8453', '123456780DEF', 'Azul', 2004, 'AUTOMÓVEL', NULL, NULL, 42250200025, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `AGENTE_TRANSITO`
--
ALTER TABLE `AGENTE_TRANSITO`
  ADD PRIMARY KEY (`Matricula`);

--
-- Índices para tabela `EMAIL_AGENTE`
--
ALTER TABLE `EMAIL_AGENTE`
  ADD PRIMARY KEY (`Matric_Agente`);

--
-- Índices para tabela `INFRACAO`
--
ALTER TABLE `INFRACAO`
  ADD PRIMARY KEY (`Codigo_Infracao`,`Placa_veiculo`),
  ADD KEY `Placa_veiculo` (`Placa_veiculo`),
  ADD KEY `Agente_transito` (`Agente_transito`),
  ADD KEY `CPF_proprietario` (`CPF_proprietario`);

--
-- Índices para tabela `MODELO`
--
ALTER TABLE `MODELO`
  ADD PRIMARY KEY (`Cod_modelo`);

--
-- Índices para tabela `PROPRIETARIO`
--
ALTER TABLE `PROPRIETARIO`
  ADD PRIMARY KEY (`CPF`);

--
-- Índices para tabela `TELEFONE_AGENTE`
--
ALTER TABLE `TELEFONE_AGENTE`
  ADD PRIMARY KEY (`Matric_agente`);

--
-- Índices para tabela `TELEFONE_PROPRIETARIO`
--
ALTER TABLE `TELEFONE_PROPRIETARIO`
  ADD PRIMARY KEY (`CPF_Proprietario`);

--
-- Índices para tabela `TIPO_INFRACAO`
--
ALTER TABLE `TIPO_INFRACAO`
  ADD PRIMARY KEY (`Codigo`);

--
-- Índices para tabela `VEICULO`
--
ALTER TABLE `VEICULO`
  ADD PRIMARY KEY (`Placa`),
  ADD KEY `CPF_Prop` (`CPF_Prop`),
  ADD KEY `Cod_modelo` (`Cod_modelo`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `EMAIL_AGENTE`
--
ALTER TABLE `EMAIL_AGENTE`
  ADD CONSTRAINT `EMAIL_AGENTE_ibfk_1` FOREIGN KEY (`Matric_Agente`) REFERENCES `AGENTE_TRANSITO` (`Matricula`);

--
-- Limitadores para a tabela `INFRACAO`
--
ALTER TABLE `INFRACAO`
  ADD CONSTRAINT `INFRACAO_ibfk_1` FOREIGN KEY (`Placa_veiculo`) REFERENCES `VEICULO` (`Placa`),
  ADD CONSTRAINT `INFRACAO_ibfk_2` FOREIGN KEY (`Agente_transito`) REFERENCES `AGENTE_TRANSITO` (`Matricula`),
  ADD CONSTRAINT `INFRACAO_ibfk_3` FOREIGN KEY (`CPF_proprietario`) REFERENCES `PROPRIETARIO` (`CPF`),
  ADD CONSTRAINT `INFRACAO_ibfk_4` FOREIGN KEY (`Codigo_Infracao`) REFERENCES `TIPO_INFRACAO` (`Codigo`);

--
-- Limitadores para a tabela `TELEFONE_AGENTE`
--
ALTER TABLE `TELEFONE_AGENTE`
  ADD CONSTRAINT `TELEFONE_AGENTE_ibfk_1` FOREIGN KEY (`Matric_agente`) REFERENCES `AGENTE_TRANSITO` (`Matricula`);

--
-- Limitadores para a tabela `TELEFONE_PROPRIETARIO`
--
ALTER TABLE `TELEFONE_PROPRIETARIO`
  ADD CONSTRAINT `TELEFONE_PROPRIETARIO_ibfk_1` FOREIGN KEY (`CPF_Proprietario`) REFERENCES `PROPRIETARIO` (`CPF`);

--
-- Limitadores para a tabela `VEICULO`
--
ALTER TABLE `VEICULO`
  ADD CONSTRAINT `VEICULO_ibfk_1` FOREIGN KEY (`CPF_Prop`) REFERENCES `PROPRIETARIO` (`CPF`),
  ADD CONSTRAINT `VEICULO_ibfk_2` FOREIGN KEY (`Cod_modelo`) REFERENCES `MODELO` (`Cod_modelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
