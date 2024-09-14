#JEU DE DONNEES

DROP DATABASE IF EXISTS ecfsql;
CREATE DATABASE ecfsql;
USE ecfsql;

/*creation tables acheteurs et vendeurs, la contrainte: les Vendeur ne peuvent pas être Acheteur , et ne peuvent vendre/acheter a eux mêmes. et specification : il existe 2 types d'utilisateurs (acheteurs/vendeurs)
je part donc du principe qu'un utilisateur ne peux avoir qu'un role (j'espere j'ai hesité pendant 2h) c'est donc deux tables differentes sans relations*/
CREATE TABLE acheteurs (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL NOT NULL ,
    id_genre INT UNSIGNED,
    email VARCHAR(255) NOT NULL UNIQUE,
    adresse VARCHAR(255) NOT NULL,
    tel VARCHAR(20) NOT NULL
   );
    
    CREATE TABLE vendeurs (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_genre INT UNSIGNED NOT NULL,
    nom VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    adresse VARCHAR(255) NOT NULL,
    tel VARCHAR(20) NOT NULL
);
    
    #creation table genre qui sera relié en one to many au acheteurs et vendeurs
    CREATE TABLE genre (
    ID INT UNSIGNED primary key AUTO_INCREMENT,
    nom VARCHAR(30)
    );
    
    /*creation tables objet et categorie,la specification : Un objet peut appartenir a plusieurs catégories. nous indique qu'l s'agit d'une relation many to many(un objet peut apartenir a 
    plusieurs categories et une categorie peut etre atriubuer a plusieurs categories) -> on cree donc une table de liaison categories_objets*/
    CREATE TABLE Objets ( #specification ecf : un objet doit posseder largeur,hauteur longueur en cm
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    hauteur_cm DECIMAL(10, 2) NOT NULL,
    largeur_cm DECIMAL(10, 2) NOT NULL,
    longueur_cm DECIMAL(10, 2) NOT NULL,
     Volume_cm DECIMAL(10, 2) GENERATED ALWAYS AS (Hauteur_cm * Largeur_cm * Longueur_cm) STORED
);

CREATE TABLE Categories (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE
);

#table de liaison 
CREATE TABLE CategoriesObjets (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_categorie INT UNSIGNED NOT NULL,
    id_objet INT UNSIGNED NOT NULL
    );

/*creation tables types_plastiques,couleur et filaments, les specifications de l'ecf: Un même objet peut être vendu de couleurs différentes et en plastique différents. 
et  Un Filament est une association entre une couleur et un plastique, nous indique que couleurs et plastiques ont une relation many to many
 et que la table filament correspond a la table de liaisons entre les deux*/
 CREATE TABLE Typesplastiques (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    matiere VARCHAR(50) NOT NULL, #specification ecf: les objets seront proposés en 3 types de plastiques (PLA,ABS,PVA) que nous insererons plus tard
    prix_cm3 DECIMAL(10, 2) NOT NULL #specification ecf: chaque plastique possede un prix different selon sa matiere que nous insererons plus tard
);

CREATE TABLE Couleurs (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL #specification ecf : 6 couleurs seront crees (noir,blanc...) que nous insererons plus tard
);

#table de liaison
CREATE TABLE FilamentS (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_type_plastique INT UNSIGNED NOT NULL,
    id_couleur INT UNSIGNED NOT NULL
    );
    
    /*pour avoir les combinaisons d'objets qui vont etre vendus nous avons besoins des objet de leur types de plastiques et de leurs couleurs donc les tables objets et filaments
    et comme il s'agit d'une relation many to many (les filaments peuvent apartenir a differents objets et les objets peuvent avoir differents types de filaments)
    nous allons creer une table de liaison :declinaisons_objets*/
    CREATE TABLE DeclinaisonsObjets (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_objet INT UNSIGNED NOT NULL,
    id_filament INT UNSIGNED NOT NULL,
    prix_declinaison DECIMAL(10, 2) #NOT NULL #specification ecf : le prix des objets sera calculé en fonction du volume * prix plastique que nous insererons plus tard et sans TVA
    );
    
    #creation de la table statut, specification ecf : une commande peut avoir plusieurs statuts (annule,confirme,archive,encours,termine)
    CREATE TABLE Statuts (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE
);

#creation de la table commandes
CREATE TABLE Commandes (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    date_creation DATETIME NOT NULL, #contrainte ecf :  les commandes devront obligatoirement contenir la date de creation
    date_maj DATETIME NOT NULL,  #contrainte ecf :  les commandes devront obligatoirement contenir une date de  MAJ
    id_acheteur INT UNSIGNED NOT NULL,
    id_statut INT UNSIGNED NOT NULL,
    totalht DECIMAL(10, 2) #NOT NULL #contrainte ecf : on ne calculera pas le prix pour une commande annule, on le programmera plus tard 
    );
    
    /*creation de la table lignes_commandes qui fait liaison entre commandes declinaisons_objets et id_vendeur et qui permet d'avoir les differents objets de la commande
    (une commande peut contenir plusieurs objets), les differents vendeurs et la quantite  */
    CREATE TABLE lignes_commandes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_commande INT UNSIGNED NOT NULL,
    id_declinaison_objet INT UNSIGNED NOT NULL,
    id_vendeur INT UNSIGNED NOT NULL, #nous mettons le vendeur ici a cause de la contrainte : dans une commande les objets peuvent avoir differents vendeurs
    quantite INT NOT NULL
    );
    
    #ajout des cles etrnangeres et des contraintes 
    
    #table acheteurs
    ALTER TABLE acheteurs
    ADD CONSTRAINT FK_acheteursidgenre_genreid FOREIGN KEY (id_genre) REFERENCES genre(id);
 
     #table vendeurs
    ALTER TABLE vendeurs
    ADD CONSTRAINT FK_vendeursidgenre_genreid FOREIGN KEY (id_genre) REFERENCES genre(id);
    
    #table categoriesobjets
    ALTER TABLE CategoriesObjets
    ADD CONSTRAINT FK_COidcategorie_categoriesid FOREIGN KEY (id_categorie) REFERENCES categories(id);
    
        ALTER TABLE CategoriesObjets
    ADD CONSTRAINT FK_COidobjet_objetsid FOREIGN KEY (id_objet) REFERENCES objets(id);
    
    #table filaments
    ALTER TABLE filaments
    ADD CONSTRAINT FK_Fidtypeplastique_typesplastiquesid FOREIGN KEY (id_type_plastique) REFERENCES typesplastiques(id);
    
       ALTER TABLE filaments
    ADD CONSTRAINT FK_Fidcouleur_couleursid FOREIGN KEY (id_couleur) REFERENCES couleurs(id);
    
    #ajout d'une contrainte d'unicite avec des couples d'uniques sur la table filaments sur laquel on va realiser un produit cartesien par la suite pour obtenir toutes les possibilités
    ALTER TABLE filaments
ADD CONSTRAINT unique_filament_combination UNIQUE (id_type_plastique, id_couleur);
   
   #table declinaisonsobjets 
    ALTER TABLE declinaisonsobjets
    ADD CONSTRAINT FK_DOidobjet_objetsid FOREIGN KEY (id_objet) REFERENCES objets(id);
    
	ALTER TABLE declinaisonsobjets
    ADD CONSTRAINT FK_DOidfilament_filamentsid FOREIGN KEY (id_filament) REFERENCES filaments(id);
    
    #ajoute couple d'uniques pour declinaisons objet 
     ALTER TABLE declinaisonsobjets
ADD CONSTRAINT unique_declinaisons_combination UNIQUE (id_objet, id_filament);

    #table commande 
    ALTER TABLE commandes
    ADD CONSTRAINT FK_commandesidacheteur_acheteursid FOREIGN KEY (id_acheteur) REFERENCES acheteurs(id);
    
	ALTER TABLE commandes
    ADD CONSTRAINT FK_commandesid_statut_statutsid FOREIGN KEY (id_statut) REFERENCES statuts(id);
   
   #AJOUT CONTRAINTE "annule" en mettant un 0 dans totalht lorsqu'elle est annulé
   
#avant l'insertion
DELIMITER //
CREATE TRIGGER before_insert_commandes
BEFORE INSERT ON Commandes
FOR EACH ROW
BEGIN
    IF NEW.id_statut = (SELECT id FROM Statuts WHERE nom = 'ANNULE') THEN
        SET NEW.totalht = 0;
    END IF;
END;
//

#avant la mise à jour
CREATE TRIGGER before_update_commandes
BEFORE UPDATE ON Commandes
FOR EACH ROW
BEGIN
    IF NEW.id_statut = (SELECT id FROM Statuts WHERE nom = 'ANNULE') THEN
        SET NEW.totalht = 0;
    END IF;
END;
//

DELIMITER ;

    #table lignes_commandes
    ALTER TABLE lignes_commandes
	ADD CONSTRAINT FK_LCCommande_commandesid FOREIGN KEY (id_commande) REFERENCES Commandes(id);
    
    ALTER TABLE lignes_commandes
    ADD CONSTRAINT FK_LCDO_DOid FOREIGN KEY (id_declinaison_objet) REFERENCES DeclinaisonsObjets(id);
    
     ALTER TABLE lignes_commandes
    ADD CONSTRAINT FK_LCidvendeur_vendeursid FOREIGN KEY (id_vendeur) REFERENCES vendeurs(id)
    
    
    
   