SELECT COUNT(*) FROM reservation WHERE date_debut > "2024-03-22" AND date_fin < "2024-03-29";

SELECT COUNT(DISTINCT id_etudiant) FROM reservation;