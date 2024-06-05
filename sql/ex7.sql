SELECT DISTINCT id_etudiant, nom_etudiant, prenom_etudiant FROM utilisateur INNER JOIN reservation USING(id_etudiant);

SELECT id_materiel, designation_materiel FROM materiel WHERE id_materiel NOT IN (SELECT id_materiel FROM contient);

SELECT id_materiel, designation_materiel FROM materiel INNER JOIN contient USING(id_materiel) GROUP BY id_materiel HAVING COUNT(*) > 3;

SELECT utilisateur.id_etudiant, nom_etudiant, prenom_etudiant, COUNT(reservation.id_etudiant) as nb_reservation FROM utilisateur LEFT JOIN reservation USING(id_etudiant) GROUP BY utilisateur.id_etudiant;
