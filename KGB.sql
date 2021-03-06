
CREATE DATABASE IF NOT EXISTS KGB;

USE KGB;

CREATE TABLE Pays 
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Nationalite VARCHAR(50) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX Nationalite ON Pays(Nationalite);

CREATE TABLE Statut
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Statut VARCHAR(50) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX Statut ON Statut(Statut);

CREATE TABLE Type_Mission 
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Types VARCHAR(50) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX Types ON Type_Mission(Types);

CREATE TABLE Specialite
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Specialite VARCHAR(50) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX Specialite ON Specialite(Specialite);

CREATE TABLE Planque  
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Code  VARCHAR(50) NOT NULL, 
    Adresse VARCHAR(50) NOT NULL, 
    Types VARCHAR(50) NOT NULL,
    Pays VARCHAR(50) NOT NULL,
    FOREIGN KEY (Pays) REFERENCES Pays(Nationalite)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX  Code  ON Planque (Code);

CREATE TABLE Cible
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Nom VARCHAR(50) NOT NULL,
    Prenom VARCHAR(50) NOT NULL,
    Date_de_naissance VARCHAR(50) NOT NULL , 
    Nom_de_code VARCHAR(50) NOT NULL ,
    Nationalite VARCHAR(50) NOT NULL,
    FOREIGN KEY (Nationalite) REFERENCES Pays(Nationalite)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX  Nom_de_code ON Cible(Nom_de_code);

CREATE TABLE Contact
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Nom VARCHAR(50) NOT NULL,
    Prenom VARCHAR(50) NOT NULL,
    Date_de_naissance VARCHAR(50) NOT NULL , 
    Nom_de_code VARCHAR(50) NOT NULL ,
    Nationalite VARCHAR(50) NOT NULL,
    FOREIGN KEY (Nationalite) REFERENCES Pays(Nationalite)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX  Nom_de_code ON Contact(Nom_de_code);

CREATE TABLE Agent
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Nom VARCHAR(50) NOT NULL, 
    Prenom VARCHAR(50) NOT NULL, 
    Date_de_naissance VARCHAR(50) NOT NULL , 
    nom_identification VARCHAR(50) NOT NULL ,
    Nationalite VARCHAR(50) NOT NULL,
    FOREIGN KEY (Nationalite) REFERENCES Pays(Nationalite),
    Specialite VARCHAR(50) NOT NULL,
    FOREIGN KEY (Specialite) REFERENCES Specialite(Specialite)

)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX  nom_identification ON Agent( nom_identification);

CREATE TABLE Mission
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Titre VARCHAR(50) NOT NULL,
    Description VARCHAR(500) NOT NULL,
    Nom_de_code VARCHAR(50) NOT NULL,
    Pays VARCHAR(50) NOT NULL,
    FOREIGN KEY (Pays) REFERENCES Pays(Nationalite),
    Agent VARCHAR(50) NOT NULL,
    FOREIGN KEY (Agent) REFERENCES Agent(nom_identification),
    Contact VARCHAR(50) NOT NULL,
    FOREIGN KEY (Contact) REFERENCES Contact(Nom_de_code),
    Cible VARCHAR(50) NOT NULL,
    FOREIGN KEY (Cible) REFERENCES Cible(Nom_de_code),
    Type_Mission VARCHAR(50) NOT NULL,
    FOREIGN KEY (Type_Mission) REFERENCES Type_Mission(Types),
    Statut VARCHAR(50) NOT NULL,
    FOREIGN KEY (Statut) REFERENCES Statut(Statut),
    Planque VARCHAR(50) NOT NULL,
    FOREIGN KEY (Planque) REFERENCES Planque(Code),
    Specialite VARCHAR(50) NOT NULL,
    FOREIGN KEY (Specialite) REFERENCES Specialite(Specialite),
    Date_debut VARCHAR(50) NOT NULL,
    Date_fin VARCHAR(50) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE Admin
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL, 
    Prenom VARCHAR(50) NOT NULL,
    Email VARCHAR(254) NOT NULL UNIQUE,
    Password CHAR(60) NOT NULL,
    Date_creation VARCHAR(50) NOT NULL

)ENGINE=InnoDB DEFAULT CHARSET=utf8;



insert into  Admin (Nom, Prenom, Email, Password, Date_creation)
values
('John','Doe', 'JohnDoe@gmail.com','$2y$10$qW5O02qav3PkTkErlWUFtuJvBygOyMdtViIRPIcs0wCqFDlzrb6yi','23/10/2021');


insert into Statut (Statut)
values
('En pr??paration'),
('En cours'),
('Termin??'),
('??chec');

insert into Pays(Nationalite)
values
('Afghanistan'),
('Albanie'),
('Antarctique'),
('Alg??rie'),
('Samoa Am??ricaines'),
('Andorre'),
('Angola'),
('Antigua-et-Barbuda'),
('Azerba??djan'),
('Argentine'),
('Australie'),
('Autriche'),
('Bahamas'),
('Bahre??n'),
('Bangladesh'),
('Arm??nie'),
('Barbade'),
('Belgique'),
('Bermudes'),
('Bhoutan'),
('Bolivie'),
('Bosnie-Herz??govine'),
('Botswana'),
('??le Bouvet'),
('Br??sil'),
('Belize'),
('Territoire Britannique de l\'Oc??an Indien'),
('??les Salomon'),
('??les Vierges Britanniques'),
('Brun??i Darussalam'),
('Bulgarie'),
('Myanmar'),
('Burundi'),
('B??larus'),
('Cambodge'),
('Cameroun'),
('Canada'),
('Cap-vert'),
('??les Ca??manes'),
('R??publique Centrafricaine'),
('Sri Lanka'),
('Tchad'),
('Chili'),
('Chine'),
('Ta??wan'),
('??le Christmas'),
('??les Cocos (Keeling)'),
('Colombie'),
('Comores'),
('Mayotte'),
('R??publique du Congo'),
('R??publique D??mocratique du Congo'),
('??les Cook'),
('Costa Rica'),
('Croatie'),
('Cuba'),
('Chypre'),
('R??publique Tch??que'),
('B??nin'),
('Danemark'),
('Dominique'),
('R??publique Dominicaine'),
('??quateur'),
('El Salvador'),
('Guin??e ??quatoriale'),
('??thiopie'),
('??rythr??e'),
('Estonie'),
('??les F??ro??'),
('??les (malvinas) Falkland'),
('G??orgie du Sud et les ??les Sandwich du Sud'),
('Fidji'),
('Finlande'),
('??les ??land'),
('France'),
('Guyane Fran??aise'),
('Polyn??sie Fran??aise'),
('Terres Australes Fran??aises'),
('Djibouti'),
('Gabon'),
('G??orgie'),
('Gambie'),
('Territoire Palestinien Occup??'),
('Allemagne'),
('Ghana'),
('Gibraltar'),
('Kiribati'),
('Gr??ce'),
('Groenland'),
('Grenade'),
('Guadeloupe'),
('Guam'),
('Guatemala'),
('Guin??e'),
('Guyana'),
('Ha??ti'),
('??les Heard et Mcdonald'),
('Saint-Si??ge (??tat de la Cit?? du Vatican)'),
('Honduras'),
('Hong-Kong'),
('Hongrie'),
('Islande'),
('Inde'),
('Indon??sie'),
('R??publique Islamique d\'Iran'),
('Iraq'),
('Irlande'),
('Isra??l'),
('Italie'),
('C??te d\'Ivoire'),
('Jama??que'),
('Japon'),
('Kazakhstan'),
('Jordanie'),
('Kenya'),
('R??publique Populaire D??mocratique de Cor??e'),
('R??publique de Cor??e'),
('Kowe??t'),
('Kirghizistan'),
('R??publique D??mocratique Populaire Lao'),
('Liban'),
('Lesotho'),
('Lettonie'),
('Lib??ria'),
('Jamahiriya Arabe Libyenne'),
('Liechtenstein'),
('Lituanie'),
('Luxembourg'),
('Macao'),
('Madagascar'),
('Malawi'),
('Malaisie'),
('Maldives'),
('Mali'),
('Malte'),
('Martinique'),
('Mauritanie'),
('Maurice'),
('Mexique'),
('Monaco'),
('Mongolie'),
('R??publique de Moldova'),
('Montserrat'),
('Maroc'),
('Mozambique'),
('Oman'),
('Namibie'),
('Nauru'),
('N??pal'),
('Pays-Bas'),
('Antilles N??erlandaises'),
('Aruba'),
('Nouvelle-Cal??donie'),
('Vanuatu'),
('Nouvelle-Z??lande'),
('Nicaragua'),
('Niger'),
('Nig??ria'),
('Niu??'),
('??le Norfolk'),
('Norv??ge'),
('??les Mariannes du Nord'),
('??les Mineures ??loign??es des ??tats-Unis'),
('??tats F??d??r??s de Micron??sie'),
('??les Marshall'),
('Palaos'),
('Pakistan'),
('Panama'),
('Papouasie-Nouvelle-Guin??e'),
('Paraguay'),
('P??rou'),
('Philippines'),
('Pitcairn'),
('Pologne'),
('Portugal'),
('Guin??e-Bissau'),
('Timor-Leste'),
('Porto Rico'),
('Qatar'),
('R??union'),
('Roumanie'),
('F??d??ration de Russie'),
('Rwanda'),
('Sainte-H??l??ne'),
('Saint-Kitts-et-Nevis'),
('Anguilla'),
('Sainte-Lucie'),
('Saint-Pierre-et-Miquelon'),
('Saint-Vincent-et-les Grenadines'),
('Saint-Marin'),
('Sao Tom??-et-Principe'),
('Arabie Saoudite'),
('S??n??gal'),
('Seychelles'),
('Sierra Leone'),
('Singapour'),
('Slovaquie'),
('Viet Nam'),
('Slov??nie'),
('Somalie'),
('Afrique du Sud'),
('Zimbabwe'),
('Espagne'),
('Sahara Occidental'),
('Soudan'),
('Suriname'),
('Svalbard et??le Jan Mayen'),
('Swaziland'),
('Su??de'),
('Suisse'),
('R??publique Arabe Syrienne'),
('Tadjikistan'),
('Tha??lande'),
('Togo'),
('Tokelau'),
('Tonga'),
('Trinit??-et-Tobago'),
('??mirats Arabes Unis'),
('Tunisie'),
('Turquie'),
('Turkm??nistan'),
('??les Turks et Ca??ques'),
('Tuvalu'),
('Ouganda'),
('Ukraine'),
('L\'ex-R??publique Yougoslave de Mac??doine'),
('??gypte'),
('Royaume-Uni'),
('??le de Man'),
('R??publique-Unie de Tanzanie'),
('??tats-Unis'),
('??les Vierges des ??tats-Unis'),
('Burkina Faso'),
('Uruguay'),
('Ouzb??kistan'),
('Venezuela'),
('Wallis et Futuna'),
('Samoa'),
('Y??men'),
('Serbie-et-Mont??n??gro'),
('Zambie');

