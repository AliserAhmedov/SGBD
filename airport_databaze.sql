-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 22 2023 г., 14:34
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `airport_databaze`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tabela bilete`
--

CREATE TABLE `tabela bilete` (
  `Cod_bilet` int(11) NOT NULL,
  `Cod_cursa` int(11) NOT NULL,
  `Cod_client` int(11) NOT NULL,
  `Data_achizitie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tabela clienti`
--

CREATE TABLE `tabela clienti` (
  `Cod_client` int(11) NOT NULL,
  `Nume` int(11) NOT NULL,
  `Prenume` int(11) NOT NULL,
  `Adresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tabela companii_localitati`
--

CREATE TABLE `tabela companii_localitati` (
  `Cod_companie` int(11) NOT NULL,
  `Cod_localitate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tabela curse_aeriene`
--

CREATE TABLE `tabela curse_aeriene` (
  `Cod_cursa` int(11) NOT NULL,
  `Cod_zbor` int(11) NOT NULL,
  `Data` int(11) NOT NULL,
  `Pret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tabela zboruri`
--

CREATE TABLE `tabela zboruri` (
  `Cod_zbor` int(11) NOT NULL,
  `Cod_companie` int(11) NOT NULL,
  `Cod_localitate_plecare` int(11) NOT NULL,
  `Cod_localitate_sosire` int(11) NOT NULL,
  `Minute_Intirziere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tabela_companii_aeriene`
--

CREATE TABLE `tabela_companii_aeriene` (
  `Cod companie` int(11) NOT NULL,
  `Denumire` int(11) NOT NULL,
  `Tara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tabela_localitati`
--

CREATE TABLE `tabela_localitati` (
  `Cod localitate` int(11) NOT NULL,
  `Nume_localitate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `tabela bilete`
--
ALTER TABLE `tabela bilete`
  ADD PRIMARY KEY (`Cod_bilet`),
  ADD KEY `Cod_cursa` (`Cod_cursa`),
  ADD KEY `Cod_client` (`Cod_client`);

--
-- Индексы таблицы `tabela clienti`
--
ALTER TABLE `tabela clienti`
  ADD PRIMARY KEY (`Cod_client`);

--
-- Индексы таблицы `tabela companii_localitati`
--
ALTER TABLE `tabela companii_localitati`
  ADD KEY `Cod_companie` (`Cod_companie`),
  ADD KEY `Cod_localitate` (`Cod_localitate`);

--
-- Индексы таблицы `tabela curse_aeriene`
--
ALTER TABLE `tabela curse_aeriene`
  ADD PRIMARY KEY (`Cod_cursa`),
  ADD KEY `Cod_zbor` (`Cod_zbor`);

--
-- Индексы таблицы `tabela zboruri`
--
ALTER TABLE `tabela zboruri`
  ADD PRIMARY KEY (`Cod_zbor`),
  ADD KEY `Cod_companie` (`Cod_companie`),
  ADD KEY `Cod_localitate_plecare` (`Cod_localitate_plecare`),
  ADD KEY `Cod_localitate_sosire` (`Cod_localitate_sosire`);

--
-- Индексы таблицы `tabela_companii_aeriene`
--
ALTER TABLE `tabela_companii_aeriene`
  ADD PRIMARY KEY (`Cod companie`);

--
-- Индексы таблицы `tabela_localitati`
--
ALTER TABLE `tabela_localitati`
  ADD PRIMARY KEY (`Cod localitate`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `tabela bilete`
--
ALTER TABLE `tabela bilete`
  ADD CONSTRAINT `tabela bilete_ibfk_1` FOREIGN KEY (`Cod_cursa`) REFERENCES `tabela curse_aeriene` (`Cod_cursa`),
  ADD CONSTRAINT `tabela bilete_ibfk_2` FOREIGN KEY (`Cod_client`) REFERENCES `tabela clienti` (`Cod_client`);

--
-- Ограничения внешнего ключа таблицы `tabela companii_localitati`
--
ALTER TABLE `tabela companii_localitati`
  ADD CONSTRAINT `tabela companii_localitati_ibfk_1` FOREIGN KEY (`Cod_companie`) REFERENCES `tabela_companii_aeriene` (`Cod companie`),
  ADD CONSTRAINT `tabela companii_localitati_ibfk_2` FOREIGN KEY (`Cod_localitate`) REFERENCES `tabela_localitati` (`Cod localitate`);

--
-- Ограничения внешнего ключа таблицы `tabela curse_aeriene`
--
ALTER TABLE `tabela curse_aeriene`
  ADD CONSTRAINT `tabela curse_aeriene_ibfk_1` FOREIGN KEY (`Cod_zbor`) REFERENCES `tabela zboruri` (`Cod_zbor`);

--
-- Ограничения внешнего ключа таблицы `tabela zboruri`
--
ALTER TABLE `tabela zboruri`
  ADD CONSTRAINT `tabela zboruri_ibfk_1` FOREIGN KEY (`Cod_companie`) REFERENCES `tabela_companii_aeriene` (`Cod companie`),
  ADD CONSTRAINT `tabela zboruri_ibfk_2` FOREIGN KEY (`Cod_localitate_plecare`) REFERENCES `tabela_localitati` (`Cod localitate`),
  ADD CONSTRAINT `tabela zboruri_ibfk_3` FOREIGN KEY (`Cod_localitate_sosire`) REFERENCES `tabela_localitati` (`Cod localitate`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
