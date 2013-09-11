-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 11, 2013 at 09:42 AM
-- Server version: 5.1.50
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `GerenciaProyectos`
--

-- --------------------------------------------------------

--
-- Table structure for table `historial_revisiones`
--

CREATE TABLE IF NOT EXISTS `historial_revisiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proyecto` int(11) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `modificaciones` text,
  `modificado_por` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proyecto` (`id_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `historial_revisiones`
--


-- --------------------------------------------------------

--
-- Table structure for table `hitos_proyecto`
--

CREATE TABLE IF NOT EXISTS `hitos_proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proyecto` int(11) DEFAULT NULL,
  `hito` text,
  `responsable` text,
  `fecha_termino` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Proyectos_HitosProyectos` (`id_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `hitos_proyecto`
--


-- --------------------------------------------------------

--
-- Table structure for table `presupuesto`
--

CREATE TABLE IF NOT EXISTS `presupuesto` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) DEFAULT NULL,
  `recurso` text,
  `cantidad` double DEFAULT NULL,
  `monto` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Proyectos_Presupuestos` (`id_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presupuesto`
--


-- --------------------------------------------------------

--
-- Table structure for table `proyectos`
--

CREATE TABLE IF NOT EXISTS `proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `preparado_por` text,
  `fecha_preparacion` date DEFAULT NULL,
  `autorizado_por` text,
  `necesidades` text,
  `objetivos` text,
  `dentro_alcance` text,
  `fuera_alcance` text,
  `descripcion_producto` text,
  `auspiciador` text,
  `gerente` text,
  `miembros_equipo` text,
  `otros_involucrados` text,
  `beneficios` text,
  `restriccion_tiempo` text,
  `restriccion_seguridad` text,
  `restriccion_alcance` text,
  `restriccion_riesgo` text,
  `restriccion_otras` text,
  `supuestos` text,
  `criterios_aceptacion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `proyectos`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `historial_revisiones`
--
ALTER TABLE `historial_revisiones`
  ADD CONSTRAINT `Proyecto_HistorialRevisiones` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hitos_proyecto`
--
ALTER TABLE `hitos_proyecto`
  ADD CONSTRAINT `Proyectos_HitosProyectos` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD CONSTRAINT `Proyectos_Presupuestos` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
