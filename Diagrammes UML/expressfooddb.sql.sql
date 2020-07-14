-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  jeu. 02 jan. 2020 à 10:16
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `idAdresse` int(11) NOT NULL AUTO_INCREMENT,
  `numeroRue` smallint(6) DEFAULT NULL,
  `voie` varchar(45) DEFAULT NULL,
  `codePostal` smallint(6) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `Client_idClient` int(11) NOT NULL,
  PRIMARY KEY (`idAdresse`,`Client_idClient`),
  KEY `fk_Adresse_Client1_idx` (`Client_idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`idAdresse`, `numeroRue`, `voie`, `codePostal`, `ville`, `Client_idClient`) VALUES
(5, 18, 'rue de Siam', 29200, 'Brest', 1),
(6, 23, 'Blv des Français Libres', 29200, 'Brest', 2),
(8, 22, 'carrefour des lilas', 29860, 'Gouesnou', 2);

-- --------------------------------------------------------

--
-- Structure de la table `chef`
--

DROP TABLE IF EXISTS `chef`;
CREATE TABLE IF NOT EXISTS `chef` (
  `idChef` int(11) NOT NULL AUTO_INCREMENT,
  `emailchef` varchar(255) NOT NULL,
  `mdpchef` varchar(255) NOT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idChef`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chef`
--

INSERT INTO `chef` (`idChef`, `emailchef`, `mdpchef`, `prenom`, `nom`) VALUES
(1, 'pierce.brosnan@gmail.com', '17ae2b14e377a5af9f07e328e66fa60e', 'Pierce', 'Brosnan'),
(2, '', '', 'Sean', 'Connery');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(45) DEFAULT NULL,
  `prenomClient` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `motdepasse` varchar(255) NOT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `prenomClient`, `email`, `motdepasse`, `telephone`) VALUES
(1, 'Roger', 'Moore', 'roger.moore@gmail.com', '', '065459654'),
(2, 'Timothy', 'Dalton', 'timothy.dalton@gmail.com', '', '0236416546'),
(3, 'James', 'Bond', 'jamesbond@gmail.com', 'ba7b9fc42636e42acfd2abbe5287ef4a', '065465657');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idCommande` int(11) NOT NULL AUTO_INCREMENT,
  `dateCommande` date DEFAULT NULL,
  `heureCommande` time DEFAULT NULL,
  `prixCommande` decimal(10,0) DEFAULT NULL,
  `modePaiement` varchar(45) DEFAULT NULL,
  `statutCommande` enum('ATTENTE','EN LIVRAISON','LIVREE') DEFAULT NULL,
  `Livreur_idLivreur` int(11) NOT NULL,
  `Client_idClient` int(11) NOT NULL,
  `Adresse_idAdresse` int(11) NOT NULL,
  `Adresse_idClient` int(11) NOT NULL,
  `MenuDuJour_idMenuDuJour` int(11) NOT NULL,
  PRIMARY KEY (`idCommande`,`Livreur_idLivreur`,`Client_idClient`,`Adresse_idAdresse`,`Adresse_idClient`,`MenuDuJour_idMenuDuJour`),
  KEY `fk_Commande_Livreur1_idx` (`Livreur_idLivreur`),
  KEY `fk_Commande_Client1_idx` (`Client_idClient`),
  KEY `fk_Commande_Adresse1_idx` (`Adresse_idAdresse`,`Adresse_idClient`),
  KEY `fk_Commande_MenuDuJour1_idx` (`MenuDuJour_idMenuDuJour`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCommande`, `dateCommande`, `heureCommande`, `prixCommande`, `modePaiement`, `statutCommande`, `Livreur_idLivreur`, `Client_idClient`, `Adresse_idAdresse`, `Adresse_idClient`, `MenuDuJour_idMenuDuJour`) VALUES
(1, '2019-12-30', '13:09:13', '23', 'Paypal', 'ATTENTE', 1, 1, 5, 0, 1),
(2, '2019-12-30', '15:02:08', '13', 'Paypal', 'ATTENTE', 1, 2, 6, 0, 1),
(3, '2020-01-01', '13:09:13', '22', 'Paypal', 'LIVREE', 2, 1, 8, 0, 1),
(4, '2020-01-02', '21:00:00', '8', 'Paypal', 'EN LIVRAISON', 2, 2, 8, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `dessert`
--

DROP TABLE IF EXISTS `dessert`;
CREATE TABLE IF NOT EXISTS `dessert` (
  `idDessert` int(11) NOT NULL AUTO_INCREMENT,
  `nomDessert` varchar(45) DEFAULT NULL,
  `photoDessert` blob,
  `dateDessert` date DEFAULT NULL,
  PRIMARY KEY (`idDessert`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dessert`
--

INSERT INTO `dessert` (`idDessert`, `nomDessert`, `photoDessert`, `dateDessert`) VALUES
(1, 'Tiramisu', NULL, '2019-12-29'),
(2, 'Brownie', NULL, '2019-12-30');

-- --------------------------------------------------------

--
-- Structure de la table `dispolivreur`
--

DROP TABLE IF EXISTS `dispolivreur`;
CREATE TABLE IF NOT EXISTS `dispolivreur` (
  `disponible` tinyint(4) DEFAULT NULL,
  `Livreur_idLivreur` int(11) NOT NULL,
  KEY `fk_DispoLivreur_Livreur1_idx` (`Livreur_idLivreur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `idLivreur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `longitude` decimal(10,0) DEFAULT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idLivreur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`idLivreur`, `nom`, `prenom`, `telephone`, `longitude`, `latitude`) VALUES
(1, 'Mendes', 'Sam', '0620122015', '655849874', '6549877'),
(2, 'Glen', 'John', '0619811989', '5469489', '98674981');

-- --------------------------------------------------------

--
-- Structure de la table `menudujour`
--

DROP TABLE IF EXISTS `menudujour`;
CREATE TABLE IF NOT EXISTS `menudujour` (
  `idMenuDuJour` int(11) NOT NULL AUTO_INCREMENT,
  `dateMenu` date DEFAULT NULL,
  `nomPlat` varchar(45) DEFAULT NULL,
  `nomDessert` varchar(45) DEFAULT NULL,
  `Plat_idPlat` int(11) NOT NULL,
  `Dessert_idDessert` int(11) NOT NULL,
  `Chef_idChef` int(11) NOT NULL,
  PRIMARY KEY (`idMenuDuJour`,`Plat_idPlat`,`Dessert_idDessert`,`Chef_idChef`),
  KEY `fk_MenuDuJour_Plat1_idx` (`Plat_idPlat`),
  KEY `fk_MenuDuJour_Dessert1_idx` (`Dessert_idDessert`),
  KEY `fk_MenuDuJour_Chef1_idx` (`Chef_idChef`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menudujour`
--

INSERT INTO `menudujour` (`idMenuDuJour`, `dateMenu`, `nomPlat`, `nomDessert`, `Plat_idPlat`, `Dessert_idDessert`, `Chef_idChef`) VALUES
(1, '2019-12-30', 'Risotto', 'Tiramisu', 1, 1, 1),
(2, '2019-12-31', 'Pâtes au sel', 'Brownie', 2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `idPlat` int(11) NOT NULL AUTO_INCREMENT,
  `nomPlat` varchar(45) DEFAULT NULL,
  `photoPlat` blob,
  `datePlat` date DEFAULT NULL,
  PRIMARY KEY (`idPlat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`idPlat`, `nomPlat`, `photoPlat`, `datePlat`) VALUES
(1, 'Risotto', NULL, '2019-12-29'),
(2, 'Pâtes au sel', NULL, '2019-12-30');

-- --------------------------------------------------------

--
-- Structure de la table `stocklivreur`
--

DROP TABLE IF EXISTS `stocklivreur`;
CREATE TABLE IF NOT EXISTS `stocklivreur` (
  `nombreDessert` decimal(10,0) DEFAULT NULL,
  `nombrePlats` decimal(10,0) DEFAULT NULL,
  `Livreur_idLivreur` int(11) NOT NULL,
  KEY `fk_StockLivreur_Livreur1_idx` (`Livreur_idLivreur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stocklivreur`
--

INSERT INTO `stocklivreur` (`nombreDessert`, `nombrePlats`, `Livreur_idLivreur`) VALUES
('4', '5', 2),
('2', '1', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_Adresse_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_Commande_Adresse1` FOREIGN KEY (`Adresse_idAdresse`) REFERENCES `adresse` (`idAdresse`),
  ADD CONSTRAINT `fk_Commande_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`),
  ADD CONSTRAINT `fk_Commande_Livreur1` FOREIGN KEY (`Livreur_idLivreur`) REFERENCES `livreur` (`idLivreur`),
  ADD CONSTRAINT `fk_Commande_MenuDuJour1` FOREIGN KEY (`MenuDuJour_idMenuDuJour`) REFERENCES `menudujour` (`idMenuDuJour`);

--
-- Contraintes pour la table `dispolivreur`
--
ALTER TABLE `dispolivreur`
  ADD CONSTRAINT `fk_DispoLivreur_Livreur1` FOREIGN KEY (`Livreur_idLivreur`) REFERENCES `livreur` (`idLivreur`);

--
-- Contraintes pour la table `menudujour`
--
ALTER TABLE `menudujour`
  ADD CONSTRAINT `fk_MenuDuJour_Chef1` FOREIGN KEY (`Chef_idChef`) REFERENCES `chef` (`idChef`),
  ADD CONSTRAINT `fk_MenuDuJour_Dessert1` FOREIGN KEY (`Dessert_idDessert`) REFERENCES `dessert` (`idDessert`),
  ADD CONSTRAINT `fk_MenuDuJour_Plat1` FOREIGN KEY (`Plat_idPlat`) REFERENCES `plat` (`idPlat`);

--
-- Contraintes pour la table `stocklivreur`
--
ALTER TABLE `stocklivreur`
  ADD CONSTRAINT `fk_StockLivreur_Livreur1` FOREIGN KEY (`Livreur_idLivreur`) REFERENCES `livreur` (`idLivreur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
