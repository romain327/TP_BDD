CREATE TABLE disponibilite(
    id_disponibilite INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    date_debut VARCHAR(50) NOT NULL,
    date_fin VARCHAR(50) NOT NULL,
    id_materiel INT NOT NULL,
    FOREIGN KEY(id_materiel) REFERENCES Materiel(id_materiel)
);

ALTER TABLE reservation
    ADD COLUMN id_disponibilite INT NOT NULL,
    ADD CONSTRAINT fk_disponibilite
    FOREIGN KEY (id_disponibilite) REFERENCES Disponibilite(id_disponibilite);

CREATE TRIGGER before_insert_reservation
    BEFORE INSERT ON reservation
    FOR EACH ROW
BEGIN
    DECLARE id_disponibilite INT;
    IF NEW.date_debut IS NOT NULL AND NEW.date_fin IS NOT NULL AND NEW.id_materiel IS NOT NULL THEN
        SET id_disponibilite = (SELECT id_disponibilite FROM disponibilite WHERE date_debut = NEW.date_debut AND date_fin = NEW.date_fin AND id_materiel = NEW.id_materiel);
            IF id_disponibilite IS NULL THEN
                INSERT INTO disponibilite (date_debut, date_fin, id_materiel) VALUES (NEW.date_debut, NEW.date_fin, NEW.id_materiel);
                SET id_disponibilite = LAST_INSERT_ID();
            ELSE
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La réservation existe déjà';
            END IF;
        SET NEW.id_disponibilite = id_disponibilite;
    END IF;
END;