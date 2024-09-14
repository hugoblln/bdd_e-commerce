#3-PROGRAMMATION
USE ecfsql;

#1 AVOIR UNE VUE SUR LE TOTAL DES COMMANDES PAR UTILISATEUR

CREATE VIEW nb_commandes AS
SELECT acheteurs.nom, COUNT(commandes.id) AS "nb commandes"
FROM acheteurs
INNER JOIN commandes ON commandes.id_acheteur = acheteurs.id
WHERE commandes.id_statut != 1
GROUP BY acheteurs.nom; 

#2 CONNAITRE LE TOTAL DES COMMANDES PAR ANNEE EXISTANTES 

SELECT year(date_creation) AS "annee", COUNT(commandes.id) AS "nb commandes"
FROM acheteurs
INNER JOIN commandes ON commandes.id_acheteur = acheteurs.id
WHERE commandes.id_statut != 1
GROUP BY year(date_creation);

#3 CONNAITRE LE TOTAL DE VENTES PAR CATEGORIES 

SELECT
    categories.nom AS nom_categorie,
    COUNT(lignes_commandes.id) AS total_ventes
FROM
    lignes_commandes
INNER JOIN declinaisonsobjets ON declinaisonsobjets.id = lignes_commandes.id_declinaison_objet
INNER JOIN objets ON objets.id = declinaisonsobjets.id_objet
INNER JOIN categoriesobjets ON categoriesobjets.id_objet = objets.id
INNER JOIN categories ON categories.id = categoriesobjets.id_categorie
GROUP BY
    nom_categorie
ORDER BY
    total_ventes DESC;

#4 TOTAL DES VENTES PAR MATIERE 

SELECT typesplastiques.matiere, COUNT(declinaisonsobjets.id * lignes_commandes.quantite) AS "nb"
FROM lignes_commandes
INNER JOIN commandes ON commandes.id = lignes_commandes.id_commande
INNER JOIN declinaisonsobjets ON declinaisonsobjets.id = lignes_commandes.id_declinaison_objet
INNER JOIN filaments ON filaments.id = declinaisonsobjets.id_filament
INNER JOIN typesplastiques ON typesplastiques.id = filaments.id_type_plastique
WHERE commandes.id_statut !=1
GROUP BY typesplastiques.matiere;

#5 classement des objets les plus vendus 
SELECT
    objets.nom AS nom_objet,
    SUM(lignes_commandes.quantite) AS total_vendu
FROM
    lignes_commandes
INNER JOIN declinaisonsobjets ON declinaisonsobjets.id = lignes_commandes.id_declinaison_objet
INNER JOIN objets ON objets.id = declinaisonsobjets.id_objet
GROUP BY
    nom_objet
ORDER BY
    total_vendu DESC;
    
    #6 quelle couleur apparait le plus dans les ventes

SELECT
    couleurs.nom AS nom_couleur,
    COUNT(lignes_commandes.id) AS total_ventes
FROM
    lignes_commandes
INNER JOIN declinaisonsobjets ON declinaisonsobjets.id = lignes_commandes.id_declinaison_objet
INNER JOIN filaments ON filaments.id = declinaisonsobjets.id_filament
INNER JOIN couleurs ON couleurs.id = filaments.id_couleur
GROUP BY
    nom_couleur
ORDER BY
    total_ventes DESC;
    
    #7 le vendeur ayant vendu le plus d'objet
    
    SELECT
    vendeurs.nom AS nom_vendeur,
    COUNT(lignes_commandes.id) AS total_ventes
FROM
    lignes_commandes
INNER JOIN vendeurs ON vendeurs.id = lignes_commandes.id_vendeur
GROUP BY
    nom_vendeur
ORDER BY
    total_ventes DESC
LIMIT 1;