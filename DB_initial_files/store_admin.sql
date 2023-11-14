-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Out-2023 às 23:57
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "-03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `store_admin`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `have`
--

CREATE TABLE `have` (
  `fk_Store_id` int(11) DEFAULT NULL,
  `fk_Inventory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `date_recorded` date DEFAULT NULL,
  `movement_type` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `own`
--

CREATE TABLE `own` (
  `fk_Inventory_id` int(11) DEFAULT NULL,
  `fk_Product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `purchase_price` float DEFAULT NULL,
  `selling_price` float DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `have`
--
ALTER TABLE `have`
  ADD KEY `FK_have_1` (`fk_Store_id`),
  ADD KEY `FK_have_2` (`fk_Inventory_id`);

--
-- Índices para tabela `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `own`
--
ALTER TABLE `own`
  ADD KEY `FK_own_1` (`fk_Inventory_id`),
  ADD KEY `FK_own_2` (`fk_Product_id`);

--
-- Índices para tabela `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `have`
--
ALTER TABLE `have`
  ADD CONSTRAINT `FK_have_1` FOREIGN KEY (`fk_Store_id`) REFERENCES `store` (`id`),
  ADD CONSTRAINT `FK_have_2` FOREIGN KEY (`fk_Inventory_id`) REFERENCES `inventory` (`id`);

--
-- Limitadores para a tabela `own`
--
ALTER TABLE `own`
  ADD CONSTRAINT `FK_own_1` FOREIGN KEY (`fk_Inventory_id`) REFERENCES `inventory` (`id`),
  ADD CONSTRAINT `FK_own_2` FOREIGN KEY (`fk_Product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
