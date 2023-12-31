CREATE TABLE SL_Rodzaj (
id INTEGER PRIMARY KEY AUTOINCREMENT,
rodzaj VARCHAR (20)
);

INSERT INTO SL_Rodzaj (rodzaj) VALUES
('trening zawodnika'), ('nauka pływania'), ('aerobik w wodzie'), 
('zajęcia dla seniora') ;

CREATE TABLE SL_Specjalizacja (
id INTEGER PRIMARY KEY AUTOINCREMENT,
specjalizacja VARCHAR (20)
);

INSERT INTO SL_Specjalizacja (specjalizacja) VALUES
('praca z dziećmi'), ('praca z seniorami') , 
('trener zawodników wyczynowych') ; 

CREATE TABLE Trener(
id INTEGER PRIMARY KEY AUTOINCREMENT,
specjalizacja INTEGER NOT NULL REFERENCES SL_Specjalizacja(id),
imie VARCHAR(20) NOT NULL,
PESEL VARCHAR(11) NOT NULL
);

CREATE TABLE Opinia (
id INTEGER PRIMARY KEY AUTOINCREMENT,
komentarz VARCHAR,
ocena INTEGER
id_trenera INTEGER NOT NULL REFERENCES Trener(id)
);

ALTER TABLE Opinia
DROP COLUMN ocena; 

ALTER TABLE Opinia
ADD COLUMN ocena INTEGER;

ALTER TABLE Opinia
ADD COLUMN id_terenera INTEGER NOT NULL REFERENCES Trener(id);

ALTER TABLE Opinia
ADD COLUMN id_klienta INTEGER NOT NULL REFERENCES Klient(id);



CREATE TABLE Klient (
id INTEGER PRIMARY KEY AUTOINCREMENT,
data zakupu REAL NOT NULL,
imie VARCHAR (20) NOT NULL,
nazwisko VARCHAR (20) NOT NULL,
numer_telefonu INTEGER (9) NOT NULL,
data_urodzenia REAL NOT NULL,
e_mail VARCHAR NOT NULL,
id_opini INTEGER NOT NULL REFERENCES Opinia(id)
);

ALTER TABLE Klient
DROP COLUMN id_opini;


CREATE TABLE Zajecia (
id INTEGER PRIMARY KEY AUTOINCREMENT,
rodzaj INETEGER NOT NULL REFERENCES SL_Rodzaj(id),
dzien_tygodnia VARCHAR NOT NULL,
godzina REAL NOT NULL,
id_trenera INETEGER NOT NULL REFERENCES Trener(id)
);

CREATE TABLE int_zajecia_klient (
id INTEGER PRIMARY KEY AUTOINCREMENT,
id_zajec INETEGR NOT NULL REFERENCES Zajęcia(id),
id_klienta INETEGR NOT NULL REFERENCES Klient(id)
);
DROP TABLE int_zajecia_klient;
CREATE TABLE int_zajecia_klient (
id INTEGER PRIMARY KEY AUTOINCREMENT,
id_zajec INETEGR  REFERENCES Zajęcia(id),
id_klienta INETEGR  REFERENCES Klient(id)
);

CREATE TABLE Zawody (
id INTEGER PRIMARY KEY AUTOINCREMENT,
data REAL NOT NULL,
organizator VARCHAR NOT NULL

);

CREATE TABLE Basen (
id INTEGER PRIMARY KEY AUTOINCREMENT,
numer_telefonu INTEGER (9) NOT NULL,
godzina_otwarcia REAL NOT NULL,
godzina_zamkniecia REAL NOT NULL,
id_zawodow INTEGER NOT NULL REFERENCES Zawody(id) ON UPDATE CASCADE
);
DROP TABLE Basen;

CREATE TABLE Basen (
id INTEGER PRIMARY KEY AUTOINCREMENT,
numer_telefonu INTEGER (9) NOT NULL,
godzina_otwarcia REAL NOT NULL,
godzina_zamkniecia REAL NOT NULL

);

ALTER TABLE Basen
ADD COLUMN e_mail VARCHAR NOT NULL;

ALTER TABLE Zawody 
ADD COLUMN id_basenu INTEGER NOT NULL REFERENCES Basen(id) ON UPDATE CASCADE;

CREATE TABLE int_zawody_klient (
id INTEGER PRIMARY KEY AUTOINCREMENT,
id_zawodow INTEGER REFERENCES Zawody(id),
id_klienta INTEGER NOT NULL REFERENCES Klient(id)

);

CREATE TABLE int_basen_klient (
id INTEGER PRIMARY KEY AUTOINCREMENT,
id_basenu INTEGER  NOT NULL REFERENCES  Basen(id),
id_klienta INTEGER REFERENCES Klient(id)

);

ALTER TABLE Trener
ADD COLUMN data_zatrudnienia REAL NOT NULL;

ALTER TABLE Trener
ADD COLUMN nazwisko VARCHAR(30) NOT NULL;

ALTER TABLE Klient
DROP COLUMN data;

ALTER TABLE SL_Specjalizacja
DROP COLUMN specjalizacja;

ALTER TABLE SL_Specjalizacja
ADD COLUMN specjalizacja VARCHAR;

ALTER TABLE Klient
ADD COLUMN data_zakupu REAL NOT NULL;

SELECT COUNT(*) FROM Zajecia
WHERE id_trenera = (SELECT id FROM Trener WHERE imie = 'Jan' AND 
                    nazwisko = 'Kowalski')  AND 
    rodzaj = (SELECT id FROM SL_Rodzaj WHERE rodzaj = 'nauka pływania');


