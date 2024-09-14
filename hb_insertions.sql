#INSERTION

#insertion données qui nous sont donnés
INSERT INTO typesplastiques (matiere,prix_cm3)
VALUES ("PLA",0.3),("ABS",0.2),("PVA",0.2); #specification numero 9 et numero 4

INSERT INTO statuts (nom)
VALUES ("ANNULE"),("CONFIRME"),("ARCHIVE"),("EN COURS"),("TERMINE"); #spcification numero 1

INSERT INTO couleurs (nom)
VALUES ("noir"),("blanc"),("or"),("argent"),("violet"),("vert");

INSERT INTO genre (nom)
VALUES ("femme"),("homme"),("autre");

#insertion données générés

INSERT INTO vendeurs (nom, id_genre, email, adresse, tel)
VALUES
  ('Dupont',1, 'jean.dupont@example.com', '12 Rue de la Libération, 75001 Paris', '0123456789'),
  ('Martin',2, 'sophie.martin@example.com', '24 Avenue des Champs-Élysées, 75008 Paris', '0123456123'),
  ('Leclerc',1, 'pierre.leclerc@example.com', '8 Rue de la Paix, 75002 Paris', '0123456432'),
  ('Lefevre',2, 'isabelle.lefevre@example.com', '15 Rue du Faubourg Saint-Antoine, 75011 Paris', '0123456543'),
  ('Mercier',1, 'nicolas.mercier@example.com', '6 Avenue Montaigne, 75008 Paris', '0123457654'),
  ('Laurent',2, 'aurelie.laurent@example.com', '3 Rue de Rivoli, 75004 Paris', '0123458765'),
  ('Morin',1, 'vincent.morin@example.com', '18 Avenue de la bole, 75001 Paris', '0123459876'),
  ('Rousseau',2, 'caroline.rousseau@example.com', '9 Boulevard Haussmann, 75009 Paris', '0123458901'),
  (' Lemoine',1, 'julien.lemoine@example.com', '7 Rue Saint-Honoré, 75001 Paris', '0123459012'),
  ('Dubois',2, 'laurence.dubois@example.com', '22 Avenue de la Bourdonnais, 75007 Paris', '0123452109'),
  ('Leroux',1, 'marc.leroux@example.com', '11 Rue de la Pompe, 75116 Paris', '0123453210'),
  ('Martinet',2, 'nathalie.martinet@example.com', '5 Avenue Marceau, 75116 Paris', '0123454321'),
  ('Renault',1, 'guillaume.renault@example.com', '14 Rue de la Roquette, 75011 Paris', '0123455432'),
  ('Leduc',3, 'valerie.leduc@example.com', '17 Boulevard Saint-Germain, 75005 Paris', '0123456543'),
  ('mo',1, 'thomas.girard@example.com', '20 Avenue de la Grande Armée, 75116 Paris', '0123457654');
  
  INSERT INTO acheteurs (nom, id_genre, email, adresse, tel)
VALUES
  ('Dupond',2, 'alice.dupont@example.com', '123 Rue de la Libération', '0123456789'),
  ('bellin',1, 'bob.martin@example.com', '456 Avenue des Fleurs', '0123456780'),
  ('Lambert',2, 'claire.lambert@example.com', '789 Boulevard du Commerce', '0123456701'),
  ('batin',1, 'david.leclerc@example.com', '101 Rue des Étoiles', '0123456712'),
  ('richard',2, 'emilie.lefevre@example.com', '202 Avenue des Arts', '0123456723'),
  ('philippe',1, 'francois.girard@example.com', '303 Boulevard des Sciences', '0123456734'),
  ('ducoin',3, 'gabrielle.dupuis@example.com', '404 Rue des Sports', '0123456745'),
  ('aznid',1, 'henri.martin@example.com', '505 Avenue des Loisirs', '0123456756'),
  ('moussa',2, 'isabelle.lambert@example.com', '606 Boulevard de la Nature', '0123456767'),
  ('dembele',1, 'jean.leclerc@example.com', '707 Rue de Aventure', '0123456778'),
  ('ali',2, 'karine.lefevre@example.com', '808 Avenue de la Détente', '0123456789'),
  ('ricou',1, 'luc.girard@example.com', '909 Boulevard de la Connaissance', '0123456790'),
  ('petiot',1, 'marie.dupuis@example.com', '010 Rue de la Paix', '0123456701'),
  ('instar',1, 'nicolas.martin@example.com', '111 Avenue de la Liberté', '0123456712'),
  ('lizou',1, 'olivier.lambert@example.com', '212 Boulevard de la Réflexion', '0123456723');
  

INSERT INTO Commandes (date_creation, date_maj, id_acheteur, id_statut )
VALUES
  ('2023-01-15 10:00:00', '2023-01-15 10:30:00', 3, 2), 
  ('2023-02-20 14:15:00', '2023-02-20 15:00:00', 9, 1), 
  ('2023-03-10 08:45:00', '2023-03-10 09:30:00', 6, 3), 
  ('2023-04-05 12:30:00', '2023-04-05 13:15:00', 7, 4),
  ('2023-05-12 16:20:00', '2023-05-12 17:00:00', 1, 5),
  ('2023-06-18 09:00:00', '2023-06-18 09:45:00', 8, 2),
  ('2023-07-22 13:45:00', '2023-07-22 14:30:00', 5, 1), 
  ('2023-08-08 11:30:00', '2023-08-08 12:15:00', 2, 3), 
  ('2023-09-25 15:10:00', '2023-09-25 15:45:00', 10, 4), 
  ('2023-10-30 10:45:00', '2023-10-30 11:30:00', 4, 5), 
  ('2023-11-12 16:00:00', '2023-11-12 16:45:00', 12, 2), 
  ('2023-12-05 09:30:00', '2023-12-05 10:15:00', 14, 1), 
  ('2024-01-18 14:45:00', '2024-01-18 15:30:00', 11, 3), 
  ('2024-02-22 11:15:00', '2024-02-22 12:00:00', 13, 4),
  ('2024-03-30 10:00:00', '2024-03-30 10:45:00', 15, 5),
('2024-03-30 10:00:00', '2024-03-30 10:45:00', 7, 5),
('2024-03-30 10:00:00', '2024-03-30 10:45:00', 3, 5);

#calcul colonne totalht avec prix declinaison * quantite le tout grouper par commande
  
  #insertion dans filament grace au produit cartesien pour avoir toute les possibilites de couleurs et de matiere 
 INSERT INTO filaments (id_type_plastique, id_couleur)
SELECT typesplastiques.id, couleurs.id
FROM typesplastiques
CROSS JOIN couleurs;

INSERT INTO Objets (nom, hauteur_cm, largeur_cm, longueur_cm)
VALUES
  ('Support de téléphone', 10.0, 5.0, 2.0),
  ('Porte-stylo', 15.0, 5.0, 5.0),
  ('Figurine de robot', 8.0, 8.0, 8.0),
  ('Écouteurs étui', 3.0, 6.0, 2.0),
  ('Boîte de rangement pour câbles', 5.0, 10.0, 5.0),
  ('Petit vase design', 12.0, 6.0, 6.0),
  ('Pièce de puzzle', 4.0, 4.0, 1.0),
  ('Boîtier de protection', 8.0, 8.0, 4.0),
  ('Support mural pour casque', 15.0, 10.0, 5.0),
  ('Figurine de dragon', 10.0, 5.0, 10.0);
  
  INSERT INTO Categories (nom)
VALUES
  ('Accessoires de bureau'),
  ('Décoration intérieure'),
  ('Gadgets électroniques'),
  ('Jouets'),
  ('Organisation domestique'),
  ('Art et sculpture'),
  ('Pièces d\'assemblage'),
  ('Accessoires informatiques'),
  ('Accessoires de mode'),
  ('Objets utilitaires'),
  ('Électronique'),
  ('Décoration extérieure'),
  ('Modèles artistiques');
  
  
  INSERT INTO CategoriesObjets (id_categorie, id_objet)
VALUES 
(4, 4),
(7, 5),
(11, 6),
(2, 7),
(9, 8),
(12, 9),
(13, 10),
(5,8),
(3,8), 
(10,2),
(12,7),
(2,1),
(7,1),
(5,2),
(8,3),
(1,3),
(3,2),
(10,4);

#toutes les declinaisons d'objets possible
 INSERT INTO declinaisonsobjets (id_objet, id_filament)
SELECT objets.id, filaments.id
FROM objets
CROSS JOIN filaments;

#calculerprix de chaque declinaisons (prix_cm3 * volume)


INSERT INTO lignes_commandes (id_commande, id_declinaison_objet, id_vendeur, quantite)
VALUES
(1, 1, 1, 2),  
(1, 2, 2, 1),  
(2, 3, 3, 3),  
(2, 4, 4, 1), 
(3, 5, 5, 2), 
(3, 6, 6, 1), 
(4, 7, 7, 3), 
(4, 8, 8, 2),
(5, 9, 9, 1),  
(5, 10, 10, 3), 
(6, 11, 11, 2), 
(6, 12, 12, 1),
(7, 13, 13, 3), 
(7, 14, 14, 2), 
(8, 15, 15, 1),
(8, 16, 1, 3),  
(9, 17, 2, 2), 
(9, 18, 3, 1),
(10, 19, 4, 3), 
(10, 20, 5, 2), 
(11, 21, 6, 1), 
(11, 22, 7, 3), 
(12, 23, 8, 2), 
(12, 24, 9, 1),
(13, 25, 10, 3),
(13, 26, 11, 2),
(14, 27, 12, 1),
(14, 28, 13, 3),
(15, 29, 14, 2),
(15, 30, 15, 1);