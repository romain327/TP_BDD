SELECT nom_etudiant, prenom_etudiant, date_debut, date_fin FROM utilisateur INNER JOIN reservation USING(id_etudiant);

SELECT designation_materiel, date_debut, date_fin FROM materiel INNER JOIN contient USING(id_materiel) INNER JOIN reservation USING(id_reservation);

SELECT nom_etudiant, prenom_etudiant, designation_materiel FROM utilisateur INNER JOIN reservation USING(id_etudiant) INNER JOIN contient USING(id_reservation) INNER JOIN materiel USING(id_materiel);

SELECT * FROM materiel INNER JOIN contient USING(id_materiel) INNER JOIN reservation USING(id_reservation) INNER JOIN utilisateur USING(id_etudiant) WHERE nom_etudiant = "Johnson";