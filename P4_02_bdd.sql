-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  lun. 13 jan. 2020 à 16:05
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
-- Base de données :  `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `idAdresse` int(11) NOT NULL AUTO_INCREMENT,
  `numero_rue` smallint(6) DEFAULT NULL,
  `voie` varchar(45) DEFAULT NULL,
  `code_postal` smallint(6) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `Client_idClient` int(11) NOT NULL,
  PRIMARY KEY (`idAdresse`,`Client_idClient`),
  KEY `fk_Adresse_Client1_idx` (`Client_idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`idAdresse`, `numero_rue`, `voie`, `code_postal`, `ville`, `Client_idClient`) VALUES
(1, 18, 'rue de Siam', 29200, 'Brest', 1),
(2, 23, 'Blv des Français Libres', 29200, 'Brest', 2),
(3, 22, 'carrefour des lilas', 29860, 'Gouesnou', 2);

-- --------------------------------------------------------

--
-- Structure de la table `chef`
--

DROP TABLE IF EXISTS `chef`;
CREATE TABLE IF NOT EXISTS `chef` (
  `idChef` int(11) NOT NULL AUTO_INCREMENT,
  `email_chef` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mdp_chef` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prenom_chef` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nom_chef` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`idChef`),
  UNIQUE KEY `emailchef` (`email_chef`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chef`
--

INSERT INTO `chef` (`idChef`, `email_chef`, `mdp_chef`, `prenom_chef`, `nom_chef`) VALUES
(1, 'pierce.brosnan@gmail.com', '17ae2b14e377a5af9f07e328e66fa60e', 'Pierce', 'Brosnan'),
(2, 'sean.connery@gmail.com', '33eae7c184f387d2d2a0899412e9d106', 'Sean', 'Connery'),
(3, 'michelle.yeoh@gmail.com', 'bf07f4dc7e1728d28000e060a2ba192a', 'Michelle', 'Yeoh');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `prenom_client` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email_client` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mdp_client` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `email` (`email_client`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nom_client`, `prenom_client`, `email_client`, `mdp_client`, `telephone`) VALUES
(1, 'Roger', 'Moore', 'roger.moore@gmail.com', '4612319892b8c0cbb3e3bc95c6310494', '065459654'),
(2, 'Timothy', 'Dalton', 'timothy.dalton@gmail.com', 'd139ba930bcc1eb3a2ed107443c2d8c4', '0236416546'),
(3, 'George', 'Lazenby', 'georgelazenby@jb.com', 'ba7b9fc42636e42acfd2abbe5287ef4a', '065465657');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idCommande` int(11) NOT NULL AUTO_INCREMENT,
  `date_commande` date DEFAULT NULL,
  `heure_commande` time DEFAULT NULL,
  `prix_commande` decimal(10,2) NOT NULL,
  `mode_paiement` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `statut_commande` enum('EN ATTENTE','EN LIVRAISON','LIVREE') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Livreur_idLivreur` int(11) NOT NULL,
  `Client_idClient` int(11) NOT NULL,
  `Adresse_idAdresse` int(11) NOT NULL,
  `Adresse_idClient` int(11) NOT NULL,
  `Dessert` int(11) NOT NULL,
  `Plat` int(11) NOT NULL,
  PRIMARY KEY (`idCommande`,`Livreur_idLivreur`,`Client_idClient`,`Adresse_idAdresse`,`Adresse_idClient`,`Plat`,`Dessert`),
  KEY `fk_Commande_Livreur1_idx` (`Livreur_idLivreur`),
  KEY `fk_Commande_Client1_idx` (`Client_idClient`),
  KEY `fk_Commande_Adresse1_idx` (`Adresse_idAdresse`,`Adresse_idClient`),
  KEY `fk_Commande_Plat1` (`Plat`),
  KEY `fk_Commande_Dessert1` (`Dessert`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCommande`, `date_commande`, `heure_commande`, `prix_commande`, `mode_paiement`, `statut_commande`, `Livreur_idLivreur`, `Client_idClient`, `Adresse_idAdresse`, `Adresse_idClient`, `Dessert`, `Plat`) VALUES
(1, '2020-01-02', '12:07:09', '22.00', 'Paypal', 'LIVREE', 1, 3, 1, 0, 2, 1),
(2, '2020-01-02', '13:21:09', '22.00', 'Paypal', 'LIVREE', 2, 1, 3, 0, 2, 1),
(3, '2020-01-02', '14:07:00', '23.00', 'Paypal', 'LIVREE', 2, 3, 1, 0, 6, 5),
(4, '2020-01-02', '14:17:00', '23.00', 'Paypal', 'LIVREE', 2, 3, 1, 0, 2, 4),
(5, '2020-01-09', '12:45:00', '24.00', 'Paypal', 'EN LIVRAISON', 3, 2, 3, 0, 6, 5),
(6, '2020-01-09', '12:48:09', '21.00', 'Paypal', 'EN LIVRAISON', 1, 3, 1, 0, 8, 5),
(7, '2020-01-09', '13:02:09', '21.00', 'Paypal', 'EN ATTENTE', 2, 1, 2, 0, 8, 5),
(8, '2020-01-09', '13:08:00', '24.00', 'Paypal', 'EN ATTENTE', 1, 3, 3, 0, 6, 7);

-- --------------------------------------------------------

--
-- Structure de la table `dish`
--

DROP TABLE IF EXISTS `dish`;
CREATE TABLE IF NOT EXISTS `dish` (
  `idDish` int(11) NOT NULL AUTO_INCREMENT,
  `nom_dish` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` enum('PLAT','DESSERT') DEFAULT NULL,
  `photo_dish` blob,
  `date_dish` date DEFAULT NULL,
  `Chef_idChef` int(11) NOT NULL,
  PRIMARY KEY (`idDish`,`Chef_idChef`),
  KEY `fk_dish_Chef1_idx` (`Chef_idChef`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dish`
--

INSERT INTO `dish` (`idDish`, `nom_dish`, `type`, `photo_dish`, `date_dish`, `Chef_idChef`) VALUES
(1, 'Risotto', 'PLAT', NULL, '2020-01-02', 2),
(2, 'Brownie', 'DESSERT', NULL, '2020-01-02', 1),
(3, 'Ratatouille', 'PLAT', NULL, '2020-01-02', 3),
(4, 'Tarte au sucre', 'DESSERT', NULL, '2020-01-02', 1),
(5, 'Waterzoï', 'PLAT', NULL, '2020-01-09', 1),
(6, 'Brioche au sucre', 'DESSERT', NULL, '2020-01-09', 2),
(7, 'Kig ha farz', 'PLAT', NULL, '2020-01-09', 2),
(8, 'Kouign-amann', 'DESSERT', NULL, '2020-01-09', 3);

-- --------------------------------------------------------

--
-- Structure de la table `dispolivreur`
--

DROP TABLE IF EXISTS `dispolivreur`;
CREATE TABLE IF NOT EXISTS `dispolivreur` (
  `Livreur_idLivreur` int(11) NOT NULL,
  `disponible` enum('OUI','NON') NOT NULL,
  KEY `fk_DispoLivreur_Livreur1_idx` (`Livreur_idLivreur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dispolivreur`
--

INSERT INTO `dispolivreur` (`Livreur_idLivreur`, `disponible`) VALUES
(3, 'NON'),
(1, 'NON'),
(2, 'OUI');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `idLivreur` int(11) NOT NULL AUTO_INCREMENT,
  `email_livreur` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mdp_livreur` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prenom_livreur` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nom_livreur` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone_livreur` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `latitude` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`idLivreur`),
  UNIQUE KEY `email_livreur` (`email_livreur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`idLivreur`, `email_livreur`, `mdp_livreur`, `prenom_livreur`, `nom_livreur`, `telephone_livreur`, `longitude`, `latitude`) VALUES
(1, 'sam.mendes@mail.com', '734d69d44c31d5b83704394600cb0b0a', 'Sam', 'Mendes', '0620122015', '48.54857', '-4.64565'),
(2, 'john.glen@mail.com', '3476a2b6133dbaf86a14f74c92b43c87', 'John', 'Glen', '0619811989', '48.15650', '-4.48900'),
(3, 'guy.hamilton@mail.com', 'ad9e2f569dbddbcf393639befcac61ab', 'Guy', 'Hamilton', '0619711974', '48.38135', '-4.58972');

-- --------------------------------------------------------

--
-- Structure de la table `stocklivreur`
--

DROP TABLE IF EXISTS `stocklivreur`;
CREATE TABLE IF NOT EXISTS `stocklivreur` (
  `Livreur_idLivreur` int(11) NOT NULL,
  `dish_idDish` int(11) NOT NULL,
  `stock` decimal(65,0) NOT NULL,
  PRIMARY KEY (`dish_idDish`,`Livreur_idLivreur`),
  KEY `fk_StockLivreur_Livreur1_idx` (`Livreur_idLivreur`),
  KEY `fk_StockLivreur_Dish1_idx` (`dish_idDish`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stocklivreur`
--

INSERT INTO `stocklivreur` (`Livreur_idLivreur`, `dish_idDish`, `stock`) VALUES
(1, 1, '2'),
(2, 1, '2'),
(1, 2, '0'),
(2, 2, '22'),
(1, 3, '7'),
(2, 3, '12'),
(1, 4, '3'),
(2, 4, '0');

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
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`Plat`) REFERENCES `dish` (`idDish`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`Dessert`) REFERENCES `dish` (`idDish`),
  ADD CONSTRAINT `fk_Commande_Adresse1` FOREIGN KEY (`Adresse_idAdresse`) REFERENCES `adresse` (`idAdresse`),
  ADD CONSTRAINT `fk_Commande_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`),
  ADD CONSTRAINT `fk_Commande_Dessert1` FOREIGN KEY (`Dessert`) REFERENCES `dish` (`idDish`),
  ADD CONSTRAINT `fk_Commande_Livreur1` FOREIGN KEY (`Livreur_idLivreur`) REFERENCES `livreur` (`idLivreur`),
  ADD CONSTRAINT `fk_Commande_Plat1` FOREIGN KEY (`Plat`) REFERENCES `dish` (`idDish`);

--
-- Contraintes pour la table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `fk_dish_Chef1` FOREIGN KEY (`Chef_idChef`) REFERENCES `chef` (`idChef`);

--
-- Contraintes pour la table `dispolivreur`
--
ALTER TABLE `dispolivreur`
  ADD CONSTRAINT `fk_DispoLivreur_Livreur1` FOREIGN KEY (`Livreur_idLivreur`) REFERENCES `livreur` (`idLivreur`);

--
-- Contraintes pour la table `stocklivreur`
--
ALTER TABLE `stocklivreur`
  ADD CONSTRAINT `fk_StockLivreur_Dish1` FOREIGN KEY (`dish_idDish`) REFERENCES `dish` (`idDish`),
  ADD CONSTRAINT `fk_StockLivreur_Livreur1` FOREIGN KEY (`Livreur_idLivreur`) REFERENCES `livreur` (`idLivreur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
