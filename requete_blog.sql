-- Page Accueil

SELECT DATE_FORMAT(Article.date_publication, '%d/%m/%Y') AS Date_article, Utilisateur.pseudo AS Auteur,titre,resume AS Extrait_article, COUNT(Commentaire.id) AS nb_commentaire
FROM Article
INNER JOIN Utilisateur ON Utilisateur.id=Article.auteur_id
LEFT JOIN Commentaire ON Commentaire.article_id=Article.id
GROUP BY Article.id
ORDER BY Article.date_publication DESC;

-- Les articles de l auteur 2 avec affichage des mois en français avec la commande SET.
SET lc_time_names = 'fr_FR';
SELECT DATE_FORMAT(Article.date_publication,'%d %M \'%y') AS Date_article, Utilisateur.pseudo AS Auteur, titre, resume AS Extrait_article
FROM Article
INNER JOIN Utilisateur ON Utilisateur.id=Article.auteur_id
WHERE Utilisateur.id=2;

-- Les articles de la catégorie 3
SELECT DATE_FORMAT(Article.date_publication,'%d/%m/%Y - %H:%s') AS Date_article, Utilisateur.pseudo AS Auteur, titre, resume AS Extrait_article
FROM Article
INNER JOIN Categorie_article ON Article.id=Categorie_article.article_id
INNER JOIN Utilisateur ON Utilisateur.id=Article.auteur_id
WHERE Categorie_article.categorie_id=3
ORDER BY Article.date_publication DESC;

-- Affichage de l article 4
SELECT DATE_FORMAT(Article.date_publication,'%d %M %Y à %H heures %s') AS Date_article,titre, contenu,Utilisateur.pseudo AS Auteur, GROUP_CONCAT(DISTINCT Categorie.nom) As Liste_categorie
FROM Article
INNER JOIN Utilisateur ON Utilisateur.id=Article.auteur_id
INNER JOIN Categorie_article ON Article.id=Categorie_article.article_id
INNER JOIN Categorie ON Categorie.id=Categorie_article.categorie_id
WHERE Article.id=4;
