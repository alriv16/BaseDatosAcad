CREATE DATABASE  IF NOT EXISTS `CasosAcad_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `CasosAcad_db`;
-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: 172.17.0.2    Database: CasosAcad_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB-1~jessie

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
-- Table structure for table `Caso`
--

DROP TABLE IF EXISTS `Caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Caso` (
  `idCaso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `encargado` varchar(45) NOT NULL,
  `idSolicitud` int(11) NOT NULL,
  `idProceso` int(11) NOT NULL,
  PRIMARY KEY (`idCaso`),
  KEY `fk_Caso_1_idx` (`idProceso`),
  KEY `fk_Caso_2_idx` (`idSolicitud`),
  CONSTRAINT `fk_Caso_1` FOREIGN KEY (`idProceso`) REFERENCES `Proceso` (`idProceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Caso_2` FOREIGN KEY (`idSolicitud`) REFERENCES `Solicitud` (`idSolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caso`
--

LOCK TABLES `Caso` WRITE;
/*!40000 ALTER TABLE `Caso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Caso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Caso_Detalle`
--

DROP TABLE IF EXISTS `Caso_Detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Caso_Detalle` (
  `idCaso_Detalle` int(11) NOT NULL AUTO_INCREMENT,
  `idCaso` int(11) NOT NULL,
  `idProceso_Detalle` int(11) NOT NULL,
  PRIMARY KEY (`idCaso_Detalle`),
  KEY `fk_Caso_Detalle_1_idx` (`idCaso`),
  CONSTRAINT `fk_Caso_Detalle_1` FOREIGN KEY (`idCaso`) REFERENCES `Caso` (`idCaso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caso_Detalle`
--

LOCK TABLES `Caso_Detalle` WRITE;
/*!40000 ALTER TABLE `Caso_Detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Caso_Detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Caso_Detalle_Requisito`
--

DROP TABLE IF EXISTS `Caso_Detalle_Requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Caso_Detalle_Requisito` (
  `idCaso_Detalle_Requisito` int(11) NOT NULL AUTO_INCREMENT,
  `idCaso_Detalle` int(11) NOT NULL,
  `idPaso_Requisito` int(11) NOT NULL,
  PRIMARY KEY (`idCaso_Detalle_Requisito`),
  KEY `fk_Caso_Detalle_Requisito_1_idx` (`idCaso_Detalle`),
  CONSTRAINT `fk_Caso_Detalle_Requisito_1` FOREIGN KEY (`idCaso_Detalle`) REFERENCES `Caso_Detalle` (`idCaso_Detalle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caso_Detalle_Requisito`
--

LOCK TABLES `Caso_Detalle_Requisito` WRITE;
/*!40000 ALTER TABLE `Caso_Detalle_Requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Caso_Detalle_Requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Caso_Detalle_Requisito_Atestado`
--

DROP TABLE IF EXISTS `Caso_Detalle_Requisito_Atestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Caso_Detalle_Requisito_Atestado` (
  `idCaso_Detalle_Requisito_Atestado` int(11) NOT NULL AUTO_INCREMENT,
  `idCaso_Detalle_Requisito` int(11) NOT NULL,
  `documento` varchar(45) NOT NULL,
  PRIMARY KEY (`idCaso_Detalle_Requisito_Atestado`),
  KEY `fk_Caso_Detalle_Requisito_Atestado_1_idx` (`idCaso_Detalle_Requisito`),
  CONSTRAINT `fk_Caso_Detalle_Requisito_Atestado_1` FOREIGN KEY (`idCaso_Detalle_Requisito`) REFERENCES `Caso_Detalle_Requisito` (`idCaso_Detalle_Requisito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caso_Detalle_Requisito_Atestado`
--

LOCK TABLES `Caso_Detalle_Requisito_Atestado` WRITE;
/*!40000 ALTER TABLE `Caso_Detalle_Requisito_Atestado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Caso_Detalle_Requisito_Atestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paso`
--

DROP TABLE IF EXISTS `Paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paso` (
  `idPaso` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo_Paso` int(11) NOT NULL,
  `paso` varchar(45) NOT NULL,
  PRIMARY KEY (`idPaso`),
  KEY `fk_Paso_1_idx` (`idTipo_Paso`),
  CONSTRAINT `fk_Paso_1` FOREIGN KEY (`idTipo_Paso`) REFERENCES `Tipo_Paso` (`idTipo_Paso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paso`
--

LOCK TABLES `Paso` WRITE;
/*!40000 ALTER TABLE `Paso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paso_Requisito`
--

DROP TABLE IF EXISTS `Paso_Requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paso_Requisito` (
  `idPaso_Requisito` int(11) NOT NULL AUTO_INCREMENT,
  `idPaso` int(11) NOT NULL,
  `idRequisito` int(11) NOT NULL,
  PRIMARY KEY (`idPaso_Requisito`),
  KEY `fk_Paso_Requisito_1_idx` (`idPaso`),
  KEY `fk_Paso_Requisito_2_idx` (`idRequisito`),
  CONSTRAINT `fk_Paso_Requisito_1` FOREIGN KEY (`idPaso`) REFERENCES `Paso` (`idPaso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paso_Requisito_2` FOREIGN KEY (`idRequisito`) REFERENCES `Requisito` (`idRequisito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paso_Requisito`
--

LOCK TABLES `Paso_Requisito` WRITE;
/*!40000 ALTER TABLE `Paso_Requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paso_Requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proceso`
--

DROP TABLE IF EXISTS `Proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proceso` (
  `idProceso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `responsable` varchar(45) NOT NULL,
  PRIMARY KEY (`idProceso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proceso`
--

LOCK TABLES `Proceso` WRITE;
/*!40000 ALTER TABLE `Proceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proceso_Detalle`
--

DROP TABLE IF EXISTS `Proceso_Detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proceso_Detalle` (
  `idProceso_Detalle` int(11) NOT NULL AUTO_INCREMENT,
  `idProceso` int(11) NOT NULL,
  `idPaso` int(11) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  `responsable` varchar(45) NOT NULL,
  `solicitante` varchar(45) NOT NULL,
  PRIMARY KEY (`idProceso_Detalle`),
  KEY `fk_Proceso_Detalle_1_idx` (`idProceso`),
  KEY `fk_Proceso_Detalle_2_idx` (`idPaso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proceso_Detalle`
--

LOCK TABLES `Proceso_Detalle` WRITE;
/*!40000 ALTER TABLE `Proceso_Detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Proceso_Detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requisito`
--

DROP TABLE IF EXISTS `Requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requisito` (
  `idRequisito` int(11) NOT NULL AUTO_INCREMENT,
  `idTipo_Requisito` int(11) NOT NULL,
  `requisito` varchar(45) NOT NULL,
  PRIMARY KEY (`idRequisito`),
  KEY `fk_Requisito_1_idx` (`idTipo_Requisito`),
  CONSTRAINT `fk_Requisito_1` FOREIGN KEY (`idTipo_Requisito`) REFERENCES `Tipo_Requisito` (`idTipo_Requisito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requisito`
--

LOCK TABLES `Requisito` WRITE;
/*!40000 ALTER TABLE `Requisito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Solicitud`
--

DROP TABLE IF EXISTS `Solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Solicitud` (
  `idSolicitud` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(45) NOT NULL,
  `Solicitante` varchar(45) NOT NULL,
  PRIMARY KEY (`idSolicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Solicitud`
--

LOCK TABLES `Solicitud` WRITE;
/*!40000 ALTER TABLE `Solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `Solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Paso`
--

DROP TABLE IF EXISTS `Tipo_Paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo_Paso` (
  `idTipo_Paso` int(11) NOT NULL AUTO_INCREMENT,
  `paso` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo_Paso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Paso`
--

LOCK TABLES `Tipo_Paso` WRITE;
/*!40000 ALTER TABLE `Tipo_Paso` DISABLE KEYS */;
INSERT INTO `Tipo_Paso` VALUES (1,'PruebaPaso1'),(2,'PruebaPaso2'),(3,'');
/*!40000 ALTER TABLE `Tipo_Paso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Requisito`
--

DROP TABLE IF EXISTS `Tipo_Requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo_Requisito` (
  `idTipo_Requisito` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `observacion` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo_Requisito`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Requisito`
--

LOCK TABLES `Tipo_Requisito` WRITE;
/*!40000 ALTER TABLE `Tipo_Requisito` DISABLE KEYS */;
INSERT INTO `Tipo_Requisito` VALUES (1,'prueba',1,'prueba2'),(2,'prueba2',1,'prueba3'),(3,'prueba3',1,'prueba4');
/*!40000 ALTER TABLE `Tipo_Requisito` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-15 23:28:18
