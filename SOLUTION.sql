-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: agencija_za_prodaju_automobila
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `automobil`
--

DROP TABLE IF EXISTS `automobil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automobil` (
  `AutomobilID` int NOT NULL,
  `BrendID` int DEFAULT NULL,
  `KategorijaID` int DEFAULT NULL,
  `OpremaID` int DEFAULT NULL,
  `LokacijaID` int DEFAULT NULL,
  `ProdavacID` int DEFAULT NULL,
  `KupacID` int DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `GodinaProizvodnje` int DEFAULT NULL,
  `Cena` decimal(10,2) DEFAULT NULL,
  `Boja` varchar(20) DEFAULT NULL,
  `Kilometraza` int DEFAULT NULL,
  `Gorivo` varchar(20) DEFAULT NULL,
  `SnagaMotora` int DEFAULT NULL,
  `BrojVrata` int DEFAULT NULL,
  `Status` varchar(20) NOT NULL DEFAULT 'dostupan',
  PRIMARY KEY (`AutomobilID`),
  KEY `KategorijaID` (`KategorijaID`),
  KEY `OpremaID` (`OpremaID`),
  KEY `LokacijaID` (`LokacijaID`),
  KEY `BrendID` (`BrendID`),
  CONSTRAINT `automobil_ibfk_1` FOREIGN KEY (`KategorijaID`) REFERENCES `kategorijaautomobila` (`KategorijaID`),
  CONSTRAINT `automobil_ibfk_2` FOREIGN KEY (`OpremaID`) REFERENCES `oprema` (`OpremaID`),
  CONSTRAINT `automobil_ibfk_3` FOREIGN KEY (`LokacijaID`) REFERENCES `lokacijaprodavnice` (`LokacijaID`),
  CONSTRAINT `automobil_ibfk_4` FOREIGN KEY (`BrendID`) REFERENCES `brendautomobila` (`BrendID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automobil`
--

LOCK TABLES `automobil` WRITE;
/*!40000 ALTER TABLE `automobil` DISABLE KEYS */;
INSERT INTO `automobil` VALUES (1,1,1,1,1,1,1,'A4',2017,35000.00,'Crna',50000,'Benzin',150,4,'dostupan'),(2,2,2,3,2,2,2,'X5',2017,50000.00,'Bela',20000,'Dizel',250,5,'nedostupan'),(3,3,5,4,3,3,3,'Golf',2016,15000.00,'Crna',80000,'Dizel',110,5,'dostupan'),(4,7,1,5,2,3,4,'Corolla',2017,18000.00,'Bela',60000,'Benzin',120,4,'dostupan'),(5,5,4,3,2,5,5,'Focus',2015,12000.00,'Plava',70000,'Benzin',100,5,'dostupan'),(6,3,NULL,2,4,NULL,NULL,'C200',2018,30000.00,'Crvena',40000,'Dizel',180,4,'dostupan');
/*!40000 ALTER TABLE `automobil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brendautomobila`
--

DROP TABLE IF EXISTS `brendautomobila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brendautomobila` (
  `BrendID` int NOT NULL,
  `NazivBrenda` varchar(50) DEFAULT NULL,
  `ZemljaPorekla` varchar(50) DEFAULT NULL,
  `KategorijaID` int DEFAULT NULL,
  PRIMARY KEY (`BrendID`),
  KEY `KategorijaID` (`KategorijaID`),
  CONSTRAINT `brendautomobila_ibfk_1` FOREIGN KEY (`KategorijaID`) REFERENCES `kategorijaautomobila` (`KategorijaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brendautomobila`
--

LOCK TABLES `brendautomobila` WRITE;
/*!40000 ALTER TABLE `brendautomobila` DISABLE KEYS */;
INSERT INTO `brendautomobila` VALUES (1,'Audi','Nemacka',1),(2,'BMW','Nemacka',2),(3,'Mercedes-Benz','Nemacka',2),(4,'Volkswagen','Nemacka',5),(5,'Ferrari','Italija',1),(6,'Lamborghini','Italija',4),(7,'Toyota','Japan',1),(8,'Honda','Japan',3);
/*!40000 ALTER TABLE `brendautomobila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finansijsketransakcije`
--

DROP TABLE IF EXISTS `finansijsketransakcije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finansijsketransakcije` (
  `TransakcijaID` int NOT NULL,
  `KupacID` int DEFAULT NULL,
  `ProdavacID` int DEFAULT NULL,
  `AutomobilID` int DEFAULT NULL,
  `DatumTransakcije` date DEFAULT NULL,
  `IznosTransakcije` decimal(10,2) DEFAULT NULL,
  `NacinPlacanja` varchar(50) DEFAULT NULL,
  `PopustID` int DEFAULT NULL,
  PRIMARY KEY (`TransakcijaID`),
  KEY `KupacID` (`KupacID`),
  KEY `ProdavacID` (`ProdavacID`),
  KEY `AutomobilID` (`AutomobilID`),
  KEY `PopustID` (`PopustID`),
  CONSTRAINT `finansijsketransakcije_ibfk_1` FOREIGN KEY (`KupacID`) REFERENCES `kupac` (`KupacID`),
  CONSTRAINT `finansijsketransakcije_ibfk_2` FOREIGN KEY (`ProdavacID`) REFERENCES `prodavac` (`ProdavacID`),
  CONSTRAINT `finansijsketransakcije_ibfk_3` FOREIGN KEY (`AutomobilID`) REFERENCES `automobil` (`AutomobilID`),
  CONSTRAINT `finansijsketransakcije_ibfk_4` FOREIGN KEY (`PopustID`) REFERENCES `popust` (`PopustID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finansijsketransakcije`
--

LOCK TABLES `finansijsketransakcije` WRITE;
/*!40000 ALTER TABLE `finansijsketransakcije` DISABLE KEYS */;
INSERT INTO `finansijsketransakcije` VALUES (1,1,1,1,'2018-06-02',20000.00,'Gotovina',1),(2,2,2,2,'2017-11-23',22000.00,'Kredit',2),(3,3,2,3,'2017-12-25',18000.00,'Kredit',3),(4,4,3,4,'2016-08-20',25000.00,'Kredit',NULL),(5,5,4,5,'2017-09-25',23000.00,'Gotovina',NULL);
/*!40000 ALTER TABLE `finansijsketransakcije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorijaautomobila`
--

DROP TABLE IF EXISTS `kategorijaautomobila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategorijaautomobila` (
  `KategorijaID` int NOT NULL,
  `NazivKategorije` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`KategorijaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorijaautomobila`
--

LOCK TABLES `kategorijaautomobila` WRITE;
/*!40000 ALTER TABLE `kategorijaautomobila` DISABLE KEYS */;
INSERT INTO `kategorijaautomobila` VALUES (1,'Limuzina'),(2,'SUV'),(3,'Karavan'),(4,'Kupe'),(5,'Hecbek');
/*!40000 ALTER TABLE `kategorijaautomobila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kupac`
--

DROP TABLE IF EXISTS `kupac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kupac` (
  `KupacID` int NOT NULL,
  `Ime` varchar(50) DEFAULT NULL,
  `Prezime` varchar(50) DEFAULT NULL,
  `DatumRodjenja` date DEFAULT NULL,
  `Adresa` varchar(100) DEFAULT NULL,
  `KontaktTelefon` varchar(20) DEFAULT NULL,
  `EmailAdresa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`KupacID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kupac`
--

LOCK TABLES `kupac` WRITE;
/*!40000 ALTER TABLE `kupac` DISABLE KEYS */;
INSERT INTO `kupac` VALUES (1,'Marko','Markovic','1990-05-10','Zrenjanin','0641234567','marko.markovic@example.com'),(2,'Jovana','Jovanovic','1988-12-15','Ruma','0639876543','jovana.jovanovic@example.com'),(3,'Nikola','Janković','1990-04-15','Beograd','065-111-2222','nikola.jankovic@example.com'),(4,'Jovana','Petrović','1992-09-20','Novi Sad','064-222-3333','jovana.petrovic@example.com'),(5,'Luka','Ivanović','1995-07-10','Niš','063-333-4444','luka.ivanovic@example.com');
/*!40000 ALTER TABLE `kupac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lokacijaprodavnice`
--

DROP TABLE IF EXISTS `lokacijaprodavnice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lokacijaprodavnice` (
  `LokacijaID` int NOT NULL,
  `NazivProdavnice` varchar(50) DEFAULT NULL,
  `Adresa` varchar(100) DEFAULT NULL,
  `Grad` varchar(50) DEFAULT NULL,
  `Drzava` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LokacijaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lokacijaprodavnice`
--

LOCK TABLES `lokacijaprodavnice` WRITE;
/*!40000 ALTER TABLE `lokacijaprodavnice` DISABLE KEYS */;
INSERT INTO `lokacijaprodavnice` VALUES (1,'Prodavnica 1','Adresa 1','Beograd','Srbija'),(2,'Prodavnica 2','Adresa 2','Novi Sad','Srbija'),(3,'Prodavnica 3','Adresa 3','Subotica','Srbija'),(4,'Prodavnica 4','Adresa 4','Zagreb','Hrvatska'),(5,'Prodavnica 5','Adresa 5','Ljubljana','Slovenija');
/*!40000 ALTER TABLE `lokacijaprodavnice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oprema`
--

DROP TABLE IF EXISTS `oprema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oprema` (
  `OpremaID` int NOT NULL,
  `NazivOpreme` varchar(50) DEFAULT NULL,
  `CenaOpreme` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OpremaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oprema`
--

LOCK TABLES `oprema` WRITE;
/*!40000 ALTER TABLE `oprema` DISABLE KEYS */;
INSERT INTO `oprema` VALUES (1,'Navigacija',500.00),(2,'Parking senzori',300.00),(3,'Klima uređaj',1000.00),(4,'Električni retrovizori',400.00),(5,'Tempomat',200.00),(6,'Grejači sedišta',600.00);
/*!40000 ALTER TABLE `oprema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popust`
--

DROP TABLE IF EXISTS `popust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `popust` (
  `PopustID` int NOT NULL,
  `NazivPopusta` varchar(255) DEFAULT NULL,
  `ProcenatPopusta` decimal(5,2) DEFAULT NULL,
  `DatumPocetka` date DEFAULT NULL,
  `DatumZavrsetka` date DEFAULT NULL,
  PRIMARY KEY (`PopustID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popust`
--

LOCK TABLES `popust` WRITE;
/*!40000 ALTER TABLE `popust` DISABLE KEYS */;
INSERT INTO `popust` VALUES (1,'Letnji popust',10.00,'2018-06-01','2018-08-31'),(2,'Crni petak',20.00,'2017-11-23','2017-11-23'),(3,'Božićni popust',15.00,'2017-12-15','2017-12-31');
/*!40000 ALTER TABLE `popust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodavac`
--

DROP TABLE IF EXISTS `prodavac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodavac` (
  `ProdavacID` int NOT NULL,
  `Ime` varchar(50) DEFAULT NULL,
  `Prezime` varchar(50) DEFAULT NULL,
  `DatumZaposlenja` date DEFAULT NULL,
  `KontaktTelefon` varchar(20) DEFAULT NULL,
  `EmailAdresa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProdavacID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodavac`
--

LOCK TABLES `prodavac` WRITE;
/*!40000 ALTER TABLE `prodavac` DISABLE KEYS */;
INSERT INTO `prodavac` VALUES (1,'Nikola','Nikolic','2016-01-15','0651111111','nikola.nikolic@example.com'),(2,'Ana','Anic','2017-06-20','0642222222','ana.anic@example.com'),(3,'Marko','Petrović','2017-02-15','065-123-4567','marko.petrovic@example.com'),(4,'Ana','Jovanović','2016-06-10','064-987-6543','ana.jovanovic@example.com'),(5,'Milan','Ilić','2018-01-20','063-555-1111','milan.ilic@example.com');
/*!40000 ALTER TABLE `prodavac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servisniistorijat`
--

DROP TABLE IF EXISTS `servisniistorijat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servisniistorijat` (
  `ServisniZapisID` int NOT NULL,
  `AutomobilID` int DEFAULT NULL,
  `DatumServisa` date DEFAULT NULL,
  `OpisServisa` varchar(100) DEFAULT NULL,
  `Trosak` int DEFAULT NULL,
  PRIMARY KEY (`ServisniZapisID`),
  KEY `AutomobilID` (`AutomobilID`),
  CONSTRAINT `servisniistorijat_ibfk_1` FOREIGN KEY (`AutomobilID`) REFERENCES `automobil` (`AutomobilID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servisniistorijat`
--

LOCK TABLES `servisniistorijat` WRITE;
/*!40000 ALTER TABLE `servisniistorijat` DISABLE KEYS */;
INSERT INTO `servisniistorijat` VALUES (1,1,'2018-03-12','Zamena ulja i filtera',1500),(2,2,'2018-04-25','Popravka kočionog sistema',2500),(3,4,'2018-05-10','Zamena prednjih amortizera',3500),(4,3,'2018-05-18','Pregled motora i dijagnostika',800),(5,5,'2018-07-02','Zamena prednjih diskova i pločica',4000),(6,6,'2018-07-15','Redovan servis',1500);
/*!40000 ALTER TABLE `servisniistorijat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

-- Prikaz svih automobila određenog brenda: Ovaj upit je relevantan jer omogućava praćenje i upravljanje inventarom automobila brenda, što je ključno za vođenje poslovanja u automobilskoj industriji. 

SELECT * 
FROM Automobil A 
JOIN BrendAutomobila BA ON A.BrendID = BA.BrendID 
WHERE BA.NazivBrenda = 'Audi'; 

-- Prikaz svih automobila određene kategorije: Ovaj upit omogućava segmentaciju automobila prema kategorijama, što može pomoći u marketinškim strategijama, ciljanju određenih tržišnih segmenata i prilagođavanju ponude potrebama kupaca. 

SELECT * 
FROM Automobil A 
JOIN KategorijaAutomobila KA ON A.KategorijaID = KA.KategorijaID 
WHERE KA.NazivKategorije = 'Limuzina';

-- Prikaz svih automobila određenog modela: Ovaj upit je koristan za praćenje prodaje, upravljanje zalihama i praćenje popularnosti određenog modela automobila. 

SELECT * 
FROM Automobil 
WHERE Model = 'A4'; 
 
-- Prikaz svih automobila koji su dostupni za prodaju: Ovaj upit je ključan za vođenje posla jer omogućava identifikaciju trenutno dostupnih automobila za prodaju i pružanje tačnih informacija kupcima. 

SELECT * 
FROM Automobil 
WHERE Status = 'Dostupan'; 

-- Prikaz svih automobila sa cenom u određenom rasponu: Ovaj upit olakšava pretragu automobila prema cenovnom rasponu, što je važno za kupce koji imaju određen budžet i žele da pronađu automobil koji im odgovara. 

SELECT * 
FROM Automobil 
WHERE Cena BETWEEN 15000 AND 40000; 

-- Prikaz prosečne cene automobila po brendu: Ovaj upit pruža uvid u prosečne cene automobila po brendu, što može biti korisno za donošenje odluka o postavljanju cena, pregovaranje sa dobavljačima i konkurentske analize. 

SELECT BrendID, AVG(Cena) AS ProsečnaCena  
FROM Automobil  
GROUP BY BrendID; 

-- Prikaz broja prodatih automobila po prodavcu: Ovaj upit omogućava praćenje prodaje po prodavcima, identifikaciju najuspešnijih prodavaca i motivaciju zaposlenih na osnovu rezultata. 

SELECT ProdavacID, COUNT(*) AS BrojProdatihAutomobila 
FROM FinansijskeTransakcije 
GROUP BY ProdavacID; 

-- Prikaz top 5 kupaca sa najvećim iznosom transakcija: Ovaj upit identifikuje najvrednije kupce na osnovu ukupnog iznosa transakcija, što omogućava usmeravanje marketinških napora ka ključnim kupcima i pružanje personalizovane usluge. 

SELECT KupacID, SUM(IznosTransakcije) AS UkupanIznosTransakcija 
FROM FinansijskeTransakcije 
GROUP BY KupacID 
ORDER BY UkupanIznosTransakcija DESC 
LIMIT 5; 

-- Prikaz automobila sa najvećom kilometražom: Ovaj upit omogućava identifikaciju automobila sa visokom kilometražom, što je važno za procenu vrednosti vozila, određivanje potrebe za servisom i donošenje odluka o otkupu vozila. 

SELECT * 
FROM Automobil 
ORDER BY Kilometraza DESC 
LIMIT 3; 

-- Prikaz automobila koji su trenutno nedostupni za prodaju, odnosno rezervisani. Ovaj upit omogućava vlasniku ili menadžeru da ima pregled svih rezervisanih automobila, što im pomaže u planiranju dostupnosti vozila i upravljanju rezervacijama. 

SELECT * FROM Automobil WHERE Status = 'Nedostupan'; 

-- Prikaz automobila sa određenim atributom opreme: Ovaj upit omogućava pretragu automobila na osnovu prisustva određenog atributa opreme, što je korisno za kupce koji imaju specifične zahteve u vezi sa opremom vozila. 

SELECT * 
FROM Automobil 
WHERE AutomobilID IN (SELECT AutomobilID FROM Oprema WHERE NazivOpreme = 'Navigacija') 
LIMIT 1; 

-- Prikaz broja servisa po automobilu: Ovaj upit omogućava praćenje broja servisa po automobilu, što je važno za održavanje vozila, identifikaciju problema i planiranje budžeta za održavanje. 

SELECT AutomobilID, COUNT(*) AS BrojServisa 
FROM ServisniIstorijat 
GROUP BY AutomobilID; 

-- Prikaz automobila koji su prodati u određenom vremenskom periodu: Ovaj upit je koristan za analizu prodaje tokom određenog perioda, identifikaciju sezonskih trendova i evaluaciju marketinških kampanja. 

SELECT * 
FROM Automobil 
WHERE AutomobilID IN (SELECT AutomobilID FROM FinansijskeTransakcije WHERE DatumTransakcije BETWEEN '2017-09-01' AND '2017-12-31'); 

-- Prikaz ukupnog iznosa transakcija po mesecu: Ovaj upit pruža pregled ukupnog iznosa transakcija po mesecu, što omogućava praćenje prodaje tokom vremena i identifikaciju sezonskih ili mesečnih varijacija. 

SELECT MONTH(DatumTransakcije) AS Mesec, SUM(IznosTransakcije) AS UkupanIznosTransakcija 
FROM FinansijskeTransakcije 
GROUP BY MONTH(DatumTransakcije); 

-- Prikaz prosečne cene automobila po godini proizvodnje: Ovaj upit omogućava analizu prosečne cene automobila prema godini proizvodnje, što može pomoći u donošenju odluka o postavljanju cena, proceni vrednosti starih vozila i identifikaciji tržišnih trendova. 

SELECT GodinaProizvodnje, AVG(Cena) AS ProsečnaCena 
FROM Automobil 
GROUP BY GodinaProizvodnje; 

-- Prikaz automobila koji su dostupni za prodaju i imaju kilometražu manju od 100.000 kilometara. Ovaj upit omogućava vlasniku ili menadžeru prodavnice da identifikuje automobile sa manjom kilometražom, što može biti atraktivno za kupce i olakšati prodaju. 

SELECT * FROM Automobil WHERE Kilometraza < 100000; 

-- Prikaz automobila koji su proizvedeni u određenoj zemlji: Ovaj upit omogućava pretragu automobila prema zemlji porekla, što je korisno za kupce koji imaju preferencije prema određenoj zemlji proizvodnje automobila. 

SELECT * 
FROM BrendAutomobila 
WHERE ZemljaPorekla = 'Nemacka'; 

-- Prikaz automobila koji su prodati putem određenog načina plaćanja: Ovaj upit omogućava analizu prodaje prema različitim načinima plaćanja, identifikaciju preferencija kupaca i evaluaciju efikasnosti različitih metoda plaćanja. 

SELECT * 
FROM Automobil 
WHERE AutomobilID IN (SELECT AutomobilID FROM FinansijskeTransakcije WHERE NacinPlacanja = 'Kredit'); 

-- Prikaz automobila sa najvećim troskom servisa: Ovaj upit identifikuje automobile sa najvišim troškom servisa, što je korisno za identifikaciju potencijalnih problema sa vozilima, procenu troškova održavanja i planiranje budžeta. 

SELECT a.* 
FROM Automobil a 
JOIN ServisniIstorijat s ON a.AutomobilID = s.AutomobilID 
ORDER BY s.Trosak DESC 
LIMIT 1; 

-- Prikaz automobila koji su dostupni za prodaju i sortirani po ceni od najniže ka najvišoj. Ovaj upit je relevantan za vođenje posla jer omogućava prikazivanje svih dostupnih automobila za prodaju, sortiranih po ceni. Vlasnik ili menadžer mogu koristiti ove informacije za efikasno upravljanje inventarom i prilagođavanje marketinških strategija kako bi se povećala prodaja automobila sa nižom cenom. 

SELECT * FROM Automobil WHERE Status = 'Dostupan' ORDER BY Cena ASC;

  
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-05 16:31:06
