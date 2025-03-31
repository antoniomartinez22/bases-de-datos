-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 31-03-2025 a las 05:08:25
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empleados`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `mayor de precio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mayor de precio` ()   SELECT * FROM Miscelanea WHERE precio > 20$$

DROP PROCEDURE IF EXISTS `mayores de 30`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mayores de 30` ()   SELECT * FROM empleado_general WHERE edad >30$$

DROP PROCEDURE IF EXISTS `orden alfabetico`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `orden alfabetico` ()   SELECT * FROM Miscelanea ORDER BY nombre ASC$$

DROP PROCEDURE IF EXISTS `precio promedio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `precio promedio` ()   SELECT AVG(precio) AS precio_promedio FROM Miscelanea$$

DROP PROCEDURE IF EXISTS `precios de mayor a menor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `precios de mayor a menor` ()   SELECT * FROM Miscelanea ORDER BY precio ASC$$

DROP PROCEDURE IF EXISTS `productos de higiene`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `productos de higiene` ()   SELECT * FROM Miscelanea WHERE categoria = 'higiene'$$

DROP PROCEDURE IF EXISTS `programador o desarrollador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `programador o desarrollador` ()   SELECT * FROM Empleado_general WHERE puesto IN ('Programador', 'Desarrollador Web')$$

DROP PROCEDURE IF EXISTS `salario a 1200`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `salario a 1200` ()   SELECT COUNT(*) AS empleados_altos_salarios FROM Empleado_general WHERE salario > 1200$$

DROP PROCEDURE IF EXISTS `salario de mayor a menor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `salario de mayor a menor` ()   SELECT * FROM Empleado_general ORDER BY salario DESC$$

DROP PROCEDURE IF EXISTS `salario prom`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `salario prom` ()   SELECT AVG(salario) AS salario_promedio FROM Empleado_general$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_general`
--

DROP TABLE IF EXISTS `empleado_general`;
CREATE TABLE IF NOT EXISTS `empleado_general` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `apellido` varchar(50) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `puesto` varchar(50) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado_general`
--

INSERT INTO `empleado_general` (`id`, `nombre`, `apellido`, `edad`, `puesto`, `salario`) VALUES
(1, 'Juan', 'Pérez', 30, 'Programador', 1200.00),
(2, 'Ana', 'Gómez', 25, 'Diseñadora', 1000.00),
(3, 'Pedro', 'Sánchez', 35, 'Administrador', 1500.00),
(4, 'Lucía', 'Martínez', 28, 'Recursos Humanos', 1100.00),
(5, 'Carlos', 'Rodríguez', 40, 'Gerente', 2000.00),
(6, 'María', 'Fernández', 32, 'Contadora', 1300.00),
(7, 'Luis', 'Díaz', 26, 'Soporte Técnico', 900.00),
(8, 'Carmen', 'López', 29, 'Marketing', 1150.00),
(9, 'Ricardo', 'Morales', 34, 'Desarrollador Web', 1250.00),
(10, 'Sandra', 'Núñez', 31, 'Analista', 1350.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miscelanea`
--

DROP TABLE IF EXISTS `miscelanea`;
CREATE TABLE IF NOT EXISTS `miscelanea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `categoria` varchar(50) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `stock` int NOT NULL,
  `proveedor` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `miscelanea`
--

INSERT INTO `miscelanea` (`id`, `nombre`, `categoria`, `precio`, `stock`, `proveedor`) VALUES
(1, 'Arroz 1kg', 'Abarrotes', 12.50, 30, 'Alimentos XYZ'),
(2, 'Azúcar 1kg', 'Abarrotes', 11.20, 25, 'Dulces & Más'),
(3, 'Pan Molde', 'Abarrotes', 22.00, 15, 'Panadería Santa'),
(4, 'Leche en caja 1L', 'Bebidas', 11.75, 20, 'Lácteos Frescos'),
(5, 'Jugo de Naranja 1L', 'Bebidas', 22.50, 10, 'Frutos del Valle'),
(6, 'Refresco Cola 2L', 'Bebidas', 33.00, 18, 'Bebidas Fizz'),
(7, 'Jabón de Baño', 'Higiene', 11.00, 40, 'Limpieza Total'),
(8, 'Papel Higiénico 4pzs', 'Higiene', 12.80, 35, 'Suave & Limpio'),
(9, 'Pasta de Dientes', 'Higiene', 11.90, 22, 'Salud Dental'),
(10, 'Detergente 1kg', 'Limpieza', 23.50, 15, 'Limpieza Total'),
(11, 'Cloro 1L', 'Limpieza', 11.60, 20, 'Multiuso Químicos'),
(12, 'Galletas Chocolate', 'Snacks', 11.25, 25, 'Dulces & Más'),
(13, 'Papas Fritas', 'Snacks', 21.75, 30, 'Sabores del Mundo'),
(14, 'Pilas AA (4 unidades)', 'Electrónica', 32.80, 12, 'Energía Duradera'),
(15, 'Encendedor', 'Varios', 11.50, 18, 'Multiuso Químicos');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
