-- Problème 1
-- Q1.1
-- La capitale d’un pays doit être une ville connue
ALTER TABLE Country
ADD CONSTRAINT fk_country_capital
FOREIGN KEY (CAPITAL, PROVINCE, CODE)
REFERENCES City(NAME, PROVINCE, COUNTRY);

-- Q1.2
-- Tous les pays doivent avoir des noms différent
-- C'est déja le cas dans la table Country

-- Q1.3
-- Le nom d’un pays doit être connu. Il n’est pas possible d’avoir un pays sans nom,
-- La contrainte est déja présente, la colone est déja NOT NULL.

-- Q1.4
-- La capitale d’une province doit être une ville de la table city.
ALTER TABLE Province
ADD CONSTRAINT fk_province_capital
FOREIGN KEY (CAPITAL, COUNTRY, CAPPROV)
REFERENCES City(NAME, COUNTRY, PROVINCE);

-- Q1.5
-- Le pays d’une province doit être un pays de la table Country.
ALTER TABLE Province
ADD CONSTRAINT fk_province_country
FOREIGN KEY (COUNTRY)
REFERENCES Country(CODE);

-- Q1.6
-- Le pays d’une ville doit être un pays de la table Country.
ALTER TABLE City
ADD CONSTRAINT fk_city_country
FOREIGN KEY (COUNTRY)
REFERENCES Country(CODE);

-- Q1.7
-- La province d’une ville doit être une province de la table province.
ALTER TABLE City
ADD CONSTRAINT fk_city_province
FOREIGN KEY (PROVINCE, COUNTRY)
REFERENCES Province(NAME, COUNTRY);

-- Q1.8
-- Le check existe déja

-- Q1.9
WITH DuplicateCoords AS (
    SELECT LATITUDE, LONGITUDE
    FROM City
    GROUP BY LATITUDE, LONGITUDE
    HAVING COUNT(*) > 1
)
SELECT NAME, LATITUDE, LONGITUDE
FROM City
WHERE (LATITUDE, LONGITUDE) IN (
    SELECT LATITUDE, LONGITUDE
    FROM DuplicateCoords
)
ORDER BY LATITUDE, LONGITUDE;

