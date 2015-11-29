CREATE DATABASE p2p_blog CHARACTER SET 'utf8';
USE p2p_blog;

CREATE TABLE Categorie (
	id INT UNSIGNED AUTO_INCREMENT,
	nom VARCHAR(150) NOT NULL,
	description VARCHAR(255),
	PRIMARY KEY(id)
);

CREATE TABLE Categorie_article (
	categorie_id INT UNSIGNED,
	article_id INT UNSIGNED,
	PRIMARY KEY (categorie_id, article_id)
);

CREATE TABLE Utilisateur (
	id INT UNSIGNED AUTO_INCREMENT,
	pseudo VARCHAR(50) NOT NULL,
	mdp VARCHAR(100) NOT NULL,
	email VARCHAR(150) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE Article (
	id INT UNSIGNED AUTO_INCREMENT,
	titre VARCHAR(150) NOT NULL,
	contenu TEXT NOT NULL,
	resume VARCHAR(255) NOT NULL,
	date_creation DATETIME NOT NULL,
	id_utilisateur INT UNSIGNED NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT fk_utilisateur_article      
        FOREIGN KEY (id_utilisateur)            
        REFERENCES Utilisateur(id)
);

CREATE TABLE Commentaire (
	id INT UNSIGNED AUTO_INCREMENT,
	commentaire TEXT NOT NULL,
	date_commentaire DATETIME NOT NULL,
	id_utilisateur INT UNSIGNED,
	PRIMARY KEY(id),
	CONSTRAINT fk_utilisateur_commentaire      
        FOREIGN KEY (id_utilisateur)            
        REFERENCES Utilisateur(id)
);
