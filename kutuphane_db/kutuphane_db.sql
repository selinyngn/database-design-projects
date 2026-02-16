-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: kutuphane_db
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
-- Table structure for table `KATEGORILER`
--

DROP TABLE IF EXISTS `KATEGORILER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KATEGORILER` (
  `kategori_id` int NOT NULL AUTO_INCREMENT,
  `kategori_adi` varchar(255) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KITAP_YAZARLARI`
--

DROP TABLE IF EXISTS `KITAP_YAZARLARI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KITAP_YAZARLARI` (
  `kitap_id` int NOT NULL,
  `yazar_id` int NOT NULL,
  PRIMARY KEY (`kitap_id`,`yazar_id`),
  KEY `yazar_id` (`yazar_id`),
  CONSTRAINT `kitap_yazarlari_ibfk_1` FOREIGN KEY (`kitap_id`) REFERENCES `KITAPLAR` (`kitap_id`),
  CONSTRAINT `kitap_yazarlari_ibfk_2` FOREIGN KEY (`yazar_id`) REFERENCES `YAZARLAR` (`yazar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KITAPLAR`
--

DROP TABLE IF EXISTS `KITAPLAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KITAPLAR` (
  `kitap_id` int NOT NULL AUTO_INCREMENT,
  `kitap_adi` varchar(255) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `kategori_id` int NOT NULL,
  `yayinevi_id` int NOT NULL,
  `basim_yili` int DEFAULT NULL,
  PRIMARY KEY (`kitap_id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `kategori_id` (`kategori_id`),
  KEY `yayinevi_id` (`yayinevi_id`),
  CONSTRAINT `kitaplar_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `KATEGORILER` (`kategori_id`),
  CONSTRAINT `kitaplar_ibfk_2` FOREIGN KEY (`yayinevi_id`) REFERENCES `YAYINEVLERI` (`yayinevi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `KOPYALAR`
--

DROP TABLE IF EXISTS `KOPYALAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KOPYALAR` (
  `kopya_id` int NOT NULL AUTO_INCREMENT,
  `kitap_id` int NOT NULL,
  `durum` enum('rafta','odunc_verildi','kayip','bakimda') NOT NULL DEFAULT 'rafta',
  PRIMARY KEY (`kopya_id`),
  KEY `kitap_id` (`kitap_id`),
  CONSTRAINT `kopyalar_ibfk_1` FOREIGN KEY (`kitap_id`) REFERENCES `KITAPLAR` (`kitap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ODUNC`
--

DROP TABLE IF EXISTS `ODUNC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ODUNC` (
  `odunc_id` int NOT NULL AUTO_INCREMENT,
  `kopya_id` int NOT NULL,
  `uye_id` int NOT NULL,
  `odunc_alma_tarihi` date NOT NULL,
  `iade_tarihi` date DEFAULT NULL,
  PRIMARY KEY (`odunc_id`),
  KEY `kopya_id` (`kopya_id`),
  KEY `uye_id` (`uye_id`),
  CONSTRAINT `odunc_ibfk_1` FOREIGN KEY (`kopya_id`) REFERENCES `KOPYALAR` (`kopya_id`),
  CONSTRAINT `odunc_ibfk_2` FOREIGN KEY (`uye_id`) REFERENCES `UYELER` (`uye_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UYELER`
--

DROP TABLE IF EXISTS `UYELER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UYELER` (
  `uye_id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` varchar(255) DEFAULT NULL,
  `uye_tarihi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uye_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `YAYINEVLERI`
--

DROP TABLE IF EXISTS `YAYINEVLERI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `YAYINEVLERI` (
  `yayinevi_id` int NOT NULL AUTO_INCREMENT,
  `yayinevi_adi` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`yayinevi_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `YAZARLAR`
--

DROP TABLE IF EXISTS `YAZARLAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `YAZARLAR` (
  `yazar_id` int NOT NULL AUTO_INCREMENT,
  `yazar_ad` varchar(255) NOT NULL,
  `yazar_soyad` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`yazar_id`),
  UNIQUE KEY `email` (`email`)
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

-- Dump completed on 2026-02-16 21:45:43
