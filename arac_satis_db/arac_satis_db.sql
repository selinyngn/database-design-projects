-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: arac_satis_db
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ARABALAR`
--

DROP TABLE IF EXISTS `ARABALAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ARABALAR` (
  `araba_id` int NOT NULL AUTO_INCREMENT,
  `araba_adi` varchar(50) NOT NULL,
  `plaka` varchar(30) NOT NULL,
  `yil` int NOT NULL,
  `kilometre` int NOT NULL,
  `fiyat` decimal(10,2) NOT NULL,
  `model_id` int NOT NULL,
  `renk_id` int NOT NULL,
  `vites_id` int NOT NULL,
  `yakit_id` int NOT NULL,
  PRIMARY KEY (`araba_id`),
  UNIQUE KEY `plaka` (`plaka`),
  KEY `model_id` (`model_id`),
  KEY `yakit_id` (`yakit_id`),
  KEY `vites_id` (`vites_id`),
  KEY `renk_id` (`renk_id`),
  CONSTRAINT `arabalar_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `MODELLER` (`model_id`),
  CONSTRAINT `arabalar_ibfk_2` FOREIGN KEY (`yakit_id`) REFERENCES `YAKIT_TURLERI` (`yakit_id`),
  CONSTRAINT `arabalar_ibfk_3` FOREIGN KEY (`vites_id`) REFERENCES `VITES_TURLERI` (`vites_id`),
  CONSTRAINT `arabalar_ibfk_4` FOREIGN KEY (`renk_id`) REFERENCES `RENKLER` (`renk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BAYILER`
--

DROP TABLE IF EXISTS `BAYILER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BAYILER` (
  `bayi_id` int NOT NULL AUTO_INCREMENT,
  `bayi_adi` varchar(100) NOT NULL,
  `adres` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` varchar(30) NOT NULL,
  PRIMARY KEY (`bayi_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MARKALAR`
--

DROP TABLE IF EXISTS `MARKALAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MARKALAR` (
  `marka_id` int NOT NULL AUTO_INCREMENT,
  `marka_adi` varchar(100) NOT NULL,
  PRIMARY KEY (`marka_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MODELLER`
--

DROP TABLE IF EXISTS `MODELLER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MODELLER` (
  `model_id` int NOT NULL AUTO_INCREMENT,
  `model_adi` varchar(50) NOT NULL,
  `marka_id` int NOT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `model_adi` (`model_adi`),
  KEY `marka_id` (`marka_id`),
  CONSTRAINT `modeller_ibfk_1` FOREIGN KEY (`marka_id`) REFERENCES `MARKALAR` (`marka_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MUSTERILER`
--

DROP TABLE IF EXISTS `MUSTERILER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MUSTERILER` (
  `musteri_id` int NOT NULL AUTO_INCREMENT,
  `musteri_adi` varchar(100) NOT NULL,
  `musteri_soyadi` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`musteri_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ODEMELER`
--

DROP TABLE IF EXISTS `ODEMELER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ODEMELER` (
  `odeme_id` int NOT NULL AUTO_INCREMENT,
  `odeme_miktari` decimal(10,2) NOT NULL,
  `odeme_tarihi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `satis_id` int NOT NULL,
  `odeme_yontemi` enum('Nakit','Kredi Kart','Banka Transferi') NOT NULL DEFAULT 'Nakit',
  PRIMARY KEY (`odeme_id`),
  KEY `satis_id` (`satis_id`),
  CONSTRAINT `odemeler_ibfk_1` FOREIGN KEY (`satis_id`) REFERENCES `SATISLAR` (`satis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERSONELLER`
--

DROP TABLE IF EXISTS `PERSONELLER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERSONELLER` (
  `personel_id` int NOT NULL AUTO_INCREMENT,
  `personel_adi` varchar(255) NOT NULL,
  `personel_soyadi` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bayi_id` int NOT NULL,
  PRIMARY KEY (`personel_id`),
  UNIQUE KEY `email` (`email`),
  KEY `bayi_id` (`bayi_id`),
  CONSTRAINT `personeller_ibfk_1` FOREIGN KEY (`bayi_id`) REFERENCES `BAYILER` (`bayi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RANDEVULAR`
--

DROP TABLE IF EXISTS `RANDEVULAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RANDEVULAR` (
  `randevu_id` int NOT NULL AUTO_INCREMENT,
  `randevu_tarihi` datetime NOT NULL,
  `musteri_id` int NOT NULL,
  `personel_id` int NOT NULL,
  `bayi_id` int NOT NULL,
  PRIMARY KEY (`randevu_id`),
  KEY `musteri_id` (`musteri_id`),
  KEY `personel_id` (`personel_id`),
  KEY `bayi_id` (`bayi_id`),
  CONSTRAINT `randevular_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `MUSTERILER` (`musteri_id`),
  CONSTRAINT `randevular_ibfk_2` FOREIGN KEY (`personel_id`) REFERENCES `PERSONELLER` (`personel_id`),
  CONSTRAINT `randevular_ibfk_3` FOREIGN KEY (`bayi_id`) REFERENCES `BAYILER` (`bayi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RENKLER`
--

DROP TABLE IF EXISTS `RENKLER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RENKLER` (
  `renk_id` int NOT NULL AUTO_INCREMENT,
  `renk_adi` varchar(50) NOT NULL,
  PRIMARY KEY (`renk_id`),
  UNIQUE KEY `renk_adi` (`renk_adi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SATISLAR`
--

DROP TABLE IF EXISTS `SATISLAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SATISLAR` (
  `satis_id` int NOT NULL AUTO_INCREMENT,
  `satis_tarihi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `satis_fiyat` decimal(10,2) NOT NULL,
  `araba_id` int NOT NULL,
  `musteri_id` int NOT NULL,
  `personel_id` int NOT NULL,
  PRIMARY KEY (`satis_id`),
  UNIQUE KEY `araba_id` (`araba_id`),
  KEY `musteri_id` (`musteri_id`),
  KEY `personel_id` (`personel_id`),
  CONSTRAINT `satislar_ibfk_1` FOREIGN KEY (`araba_id`) REFERENCES `ARABALAR` (`araba_id`),
  CONSTRAINT `satislar_ibfk_2` FOREIGN KEY (`musteri_id`) REFERENCES `MUSTERILER` (`musteri_id`),
  CONSTRAINT `satislar_ibfk_3` FOREIGN KEY (`personel_id`) REFERENCES `PERSONELLER` (`personel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SERVISKAYITLARI`
--

DROP TABLE IF EXISTS `SERVISKAYITLARI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SERVISKAYITLARI` (
  `servis_kayit_id` int NOT NULL AUTO_INCREMENT,
  `servis_tarihi` date NOT NULL,
  `servis` text NOT NULL,
  `servis_ucreti` decimal(10,2) NOT NULL,
  `kilometre` int NOT NULL,
  `araba_id` int NOT NULL,
  `bayi_id` int NOT NULL,
  `personel_id` int NOT NULL,
  PRIMARY KEY (`servis_kayit_id`),
  KEY `araba_id` (`araba_id`),
  KEY `bayi_id` (`bayi_id`),
  KEY `personel_id` (`personel_id`),
  CONSTRAINT `serviskayitlari_ibfk_1` FOREIGN KEY (`araba_id`) REFERENCES `ARABALAR` (`araba_id`),
  CONSTRAINT `serviskayitlari_ibfk_2` FOREIGN KEY (`bayi_id`) REFERENCES `BAYILER` (`bayi_id`),
  CONSTRAINT `serviskayitlari_ibfk_3` FOREIGN KEY (`personel_id`) REFERENCES `PERSONELLER` (`personel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STOKLAR`
--

DROP TABLE IF EXISTS `STOKLAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STOKLAR` (
  `stok_id` int NOT NULL AUTO_INCREMENT,
  `stok_adi` varchar(50) NOT NULL,
  `bayi_id` int NOT NULL,
  `araba_id` int NOT NULL,
  `stok_durumu` enum('Satilik','Satildi','Serviste','Test Surusunde') NOT NULL DEFAULT 'Satilik',
  PRIMARY KEY (`stok_id`),
  UNIQUE KEY `araba_id` (`araba_id`),
  KEY `bayi_id` (`bayi_id`),
  CONSTRAINT `stoklar_ibfk_1` FOREIGN KEY (`araba_id`) REFERENCES `ARABALAR` (`araba_id`),
  CONSTRAINT `stoklar_ibfk_2` FOREIGN KEY (`bayi_id`) REFERENCES `BAYILER` (`bayi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TEST_SURUSLERI`
--

DROP TABLE IF EXISTS `TEST_SURUSLERI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEST_SURUSLERI` (
  `test_surus_id` int NOT NULL AUTO_INCREMENT,
  `test_surus_tarihi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `musteri_id` int NOT NULL,
  `araba_id` int NOT NULL,
  `personel_id` int NOT NULL,
  PRIMARY KEY (`test_surus_id`),
  KEY `araba_id` (`araba_id`),
  KEY `musteri_id` (`musteri_id`),
  KEY `personel_id` (`personel_id`),
  CONSTRAINT `test_surusleri_ibfk_1` FOREIGN KEY (`araba_id`) REFERENCES `ARABALAR` (`araba_id`),
  CONSTRAINT `test_surusleri_ibfk_2` FOREIGN KEY (`musteri_id`) REFERENCES `MUSTERILER` (`musteri_id`),
  CONSTRAINT `test_surusleri_ibfk_3` FOREIGN KEY (`personel_id`) REFERENCES `PERSONELLER` (`personel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VITES_TURLERI`
--

DROP TABLE IF EXISTS `VITES_TURLERI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VITES_TURLERI` (
  `vites_id` int NOT NULL AUTO_INCREMENT,
  `vites_adi` varchar(50) NOT NULL,
  `vites_turu` enum('Manuel','Otomatik') NOT NULL DEFAULT 'Manuel',
  PRIMARY KEY (`vites_id`),
  UNIQUE KEY `vites_adi` (`vites_adi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `YAKIT_TURLERI`
--

DROP TABLE IF EXISTS `YAKIT_TURLERI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `YAKIT_TURLERI` (
  `yakit_id` int NOT NULL AUTO_INCREMENT,
  `yakit_adi` varchar(50) NOT NULL,
  `yakit_turu` enum('Benzinli','Dizel','LPG','Elektrikli') NOT NULL DEFAULT 'LPG',
  PRIMARY KEY (`yakit_id`),
  UNIQUE KEY `yakit_adi` (`yakit_adi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-16 22:04:10
