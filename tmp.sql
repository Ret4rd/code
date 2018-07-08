-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 08 2018 г., 14:26
-- Версия сервера: 10.1.33-MariaDB
-- Версия PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tmp`
--
CREATE DATABASE IF NOT EXISTS `tmp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tmp`;

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_model` (IN `_id` INT)  NO SQL
select ml.name, ml.color
FROM model as ml
WHERE ml.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `set_lab0201decision` (IN `CoefficientsOfX` VARCHAR(128) CHARSET utf8, IN `FreeCoefficients` VARCHAR(128) CHARSET utf8, IN `Result` VARCHAR(128) CHARSET utf8)  NO SQL
INSERT INTO lab0201decision(`CoefficientsOfX`, `FreeCoefficients`, `Result`) Values(CoefficientsOfX, FreeCoefficients, Result)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `set_lab0201Log` (IN `time` DATETIME, IN `levelname` VARCHAR(128) CHARSET utf8)  NO SQL
INSERT INTO lab0201log(`time`, `levelname`) Values(time, levelname)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `lab0201decision`
--

CREATE TABLE `lab0201decision` (
  `id` int(10) NOT NULL,
  `CoefficientsOfX` text,
  `FreeCoefficients` text,
  `Result` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `lab0201decision`
--

INSERT INTO `lab0201decision` (`id`, `CoefficientsOfX`, `FreeCoefficients`, `Result`) VALUES
(1, '[[1.0, 2.0], [4.0, 5.0]]', '[3.0, 6.0]', '[-1.  2.]'),
(2, '[[1.0, 2.0], [4.0, 5.0]]', '[3.0, 6.0]', '[-1.  2.]'),
(3, '[[1.0, 2.0], [4.0, 5.0]]', '[3.0, 6.0]', '[-1.  2.]'),
(4, '[[1.0, 2.0], [4.0, 5.0]]', '[3.0, 6.0]', '[-1.  2.]'),
(5, '[[1.0, 2.0], [4.0, 5.0]]', '[3.0, 6.0]', '[-1.  2.]'),
(6, '[[1.0, 2.0], [4.0, 5.0]]', '[3.0, 6.0]', '[-1.  2.]'),
(7, '[[1.0, 2.0], [4.0, 5.0]]', '[3.0, 6.0]', '[-1.  2.]'),
(8, '[[1.0, 2.0], [4.0, 5.0]]', '[3.0, 6.0]', '[-1.  2.]'),
(9, '[[1.0, 2.0], [4.0, 5.0]]', '[3.0, 6.0]', '[-1.  2.]'),
(10, '[[1.0, 2.0], [4.0, 5.0]]', '[3.0, 6.0]', '[-1.  2.]');

-- --------------------------------------------------------

--
-- Структура таблицы `lab0201log`
--

CREATE TABLE `lab0201log` (
  `id` int(10) NOT NULL,
  `time` datetime DEFAULT NULL,
  `levelname` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `lab0201log`
--

INSERT INTO `lab0201log` (`id`, `time`, `levelname`) VALUES
(1, '2018-08-11 22:59:59', '10'),
(2, '2018-07-08 00:00:00', '10'),
(3, '2018-08-11 22:59:59', '10'),
(4, '0000-00-00 00:00:00', '10'),
(5, '0000-00-00 00:00:00', '10'),
(6, '2018-07-08 14:53:24', '10'),
(7, '2018-07-08 15:06:18', '10');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `lab0201decision`
--
ALTER TABLE `lab0201decision`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lab0201log`
--
ALTER TABLE `lab0201log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `lab0201decision`
--
ALTER TABLE `lab0201decision`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `lab0201log`
--
ALTER TABLE `lab0201log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lab0201log`
--
ALTER TABLE `lab0201log`
  ADD CONSTRAINT `lab0201decision` FOREIGN KEY (`id`) REFERENCES `lab0201decision` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
