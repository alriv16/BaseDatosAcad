CREATE DATABASE  IF NOT EXISTS `CasosAcad_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `CasosAcad_db`;
-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: 172.17.0.2    Database: CasosAcad_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.22-MariaDB-1~jessie

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caso`
--

DROP TABLE IF EXISTS `caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso` (
  `idCaso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `encargado` varchar(45) NOT NULL,
  `idSolicitud` int(11) NOT NULL,
  `idProceso` int(11) NOT NULL,
  PRIMARY KEY (`idCaso`),
  KEY `fk_Caso_1_idx` (`idProceso`),
  KEY `fk_Caso_2_idx` (`idSolicitud`),
  CONSTRAINT `fk_Caso_1` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Caso_2` FOREIGN KEY (`idSolicitud`) REFERENCES `solicitud` (`idSolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso`
--

LOCK TABLES `caso` WRITE;
/*!40000 ALTER TABLE `caso` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_detalle`
--

DROP TABLE IF EXISTS `caso_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_detalle` (
  `idCaso_Detalle` int(11) NOT NULL AUTO_INCREMENT,
  `idCaso` int(11) NOT NULL,
  `idProceso_Detalle` int(11) NOT NULL,
  PRIMARY KEY (`idCaso_Detalle`),
  KEY `fk_Caso_Detalle_1_idx` (`idCaso`),
  CONSTRAINT `fk_Caso_Detalle_1` FOREIGN KEY (`idCaso`) REFERENCES `caso` (`idCaso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_detalle`
--

LOCK TABLES `caso_detalle` WRITE;
/*!40000 ALTER TABLE `caso_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_detalle_requisito`
--

DROP TABLE IF EXISTS `caso_detalle_requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_detalle_requisito` (
  `idCaso_Detalle_Requisito` int(11) NOT NULL AUTO_INCREMENT,
  `idCaso_Detalle` int(11) NOT NULL,
  `idPaso_Requisito` int(11) NOT NULL,
  PRIMARY KEY (`idCaso_Detalle_Requisito`),
  KEY `fk_Caso_Detalle_Requisito_1_idx` (`idCaso_Detalle`),
  CONSTRAINT `fk_Caso_Detalle_Requisito_1` FOREIGN KEY (`idCaso_Detalle`) REFERENCES `caso_detalle` (`idCaso_Detalle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_detalle_requisito`
--

LOCK TABLES `caso_detalle_requisito` WRITE;
/*!40000 ALTER TABLE `caso_detalle_requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso_detalle_requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_detalle_requisito_atestado`
--

DROP TABLE IF EXISTS `caso_detalle_requisito_atestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_detalle_requisito_atestado` (
  `idCaso_Detalle_Requisito_Atestado` int(11) NOT NULL AUTO_INCREMENT,
  `idCaso_Detalle_Requisito` int(11) NOT NULL,
  `documento` varchar(45) NOT NULL,
  PRIMARY KEY (`idCaso_Detalle_Requisito_Atestado`),
  KEY `fk_Caso_Detalle_Requisito_Atestado_1_idx` (`idCaso_Detalle_Requisito`),
  CONSTRAINT `fk_Caso_Detalle_Requisito_Atestado_1` FOREIGN KEY (`idCaso_Detalle_Requisito`) REFERENCES `caso_detalle_requisito` (`idCaso_Detalle_Requisito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_detalle_requisito_atestado`
--

LOCK TABLES `caso_detalle_requisito_atestado` WRITE;
/*!40000 ALTER TABLE `caso_detalle_requisito_atestado` DISABLE KEYS */;
/*!40000 ALTER TABLE `caso_detalle_requisito_atestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paso`
--

DROP TABLE IF EXISTS `paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paso` (
  `idPaso` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo_Paso` int(11) NOT NULL,
  `paso` varchar(45) NOT NULL,
  PRIMARY KEY (`idPaso`),
  KEY `fk_Paso_1_idx` (`idTipo_Paso`),
  CONSTRAINT `fk_Paso_1` FOREIGN KEY (`idTipo_Paso`) REFERENCES `tipo_paso` (`idTipo_Paso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paso`
--

LOCK TABLES `paso` WRITE;
/*!40000 ALTER TABLE `paso` DISABLE KEYS */;
/*!40000 ALTER TABLE `paso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paso_requisito`
--

DROP TABLE IF EXISTS `paso_requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paso_requisito` (
  `idPaso_Requisito` int(11) NOT NULL AUTO_INCREMENT,
  `idPaso` int(11) NOT NULL,
  `idRequisito` int(11) NOT NULL,
  PRIMARY KEY (`idPaso_Requisito`),
  KEY `fk_Paso_Requisito_1_idx` (`idPaso`),
  KEY `fk_Paso_Requisito_2_idx` (`idRequisito`),
  CONSTRAINT `fk_Paso_Requisito_1` FOREIGN KEY (`idPaso`) REFERENCES `paso` (`idPaso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paso_Requisito_2` FOREIGN KEY (`idRequisito`) REFERENCES `requisito` (`idRequisito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paso_requisito`
--

LOCK TABLES `paso_requisito` WRITE;
/*!40000 ALTER TABLE `paso_requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `paso_requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso`
--

DROP TABLE IF EXISTS `proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proceso` (
  `idProceso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `descripcion` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`idProceso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso`
--

LOCK TABLES `proceso` WRITE;
/*!40000 ALTER TABLE `proceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso_detalle`
--

DROP TABLE IF EXISTS `proceso_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proceso_detalle` (
  `idProceso_Detalle` int(11) NOT NULL AUTO_INCREMENT,
  `idProceso` int(11) NOT NULL,
  `idPaso` int(11) NOT NULL,
  `responsable` varchar(45) NOT NULL,
  PRIMARY KEY (`idProceso_Detalle`),
  KEY `fk_Proceso_Detalle_1_idx` (`idProceso`),
  KEY `fk_Proceso_Detalle_2_idx` (`idPaso`),
  KEY `interna` (`idProceso_Detalle`),
  CONSTRAINT `interna` FOREIGN KEY (`idProceso_Detalle`) REFERENCES `proceso_detalle` (`idProceso_Detalle`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `paso` FOREIGN KEY (`idPaso`) REFERENCES `paso` (`idPaso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proceso` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso_detalle`
--

LOCK TABLES `proceso_detalle` WRITE;
/*!40000 ALTER TABLE `proceso_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `proceso_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisito`
--

DROP TABLE IF EXISTS `requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisito` (
  `idRequisito` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo_Requisito` int(11) NOT NULL,
  `requisito` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `textoPublico` varchar(100) NOT NULL,
  `obligatorio` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`idRequisito`),
  KEY `fk_Requisito_1_idx` (`idTipo_Requisito`),
  CONSTRAINT `fk_Requisito_1` FOREIGN KEY (`idTipo_Requisito`) REFERENCES `tipo_requisito` (`idTipo_Requisito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisito`
--

LOCK TABLES `requisito` WRITE;
/*!40000 ALTER TABLE `requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud` (
  `idSolicitud` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(45) NOT NULL,
  `Solicitante` varchar(45) NOT NULL,
  PRIMARY KEY (`idSolicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_paso`
--

DROP TABLE IF EXISTS `tipo_paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_paso` (
  `idTipo_Paso` int(11) NOT NULL AUTO_INCREMENT,
  `paso` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Paso`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_paso`
--

LOCK TABLES `tipo_paso` WRITE;
/*!40000 ALTER TABLE `tipo_paso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_paso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_requisito`
--

DROP TABLE IF EXISTS `tipo_requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_requisito` (
  `idTipo_Requisito` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `observacion` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo_Requisito`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_requisito`
--

LOCK TABLES `tipo_requisito` WRITE;
/*!40000 ALTER TABLE `tipo_requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_requisito` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-05  0:18:43
