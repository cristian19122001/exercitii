CREATE EXTENSION postgis;

CREATE TABLE zona_verde (
    fid SERIAL PRIMARY KEY not null,
    suprafata int not null,
	localizare int not  null,
    geom GEOMETRY(POLYGON, 4326) NOT NULL
);

CREATE TABLE if not exists tip_zona_verde (
    fid SERIAL PRIMARY KEY not null,
	zona_verde_fid int not null,
	tip_zona varchar(200) not null,
    denumire varchar(200) NOT NULL,
	foreign key (zona_verde_fid) references zona_verde(fid)
);

CREATE TABLE if not exists vegetatie (
    fid SERIAL PRIMARY KEY not null,
    zona_verde_fid INTEGER not null,
    foreign key (zona_verde_fid) references zona_verde(fid),
    suprafata integer not null,
    geom GEOMETRY(Polygon, 4326) NOT NULL
);

CREATE TABLE tip_vegetatie (
	fid SERIAL PRIMARY KEY not null,
	vegetatie_fid integer not null,
	tip varchar(200) not null,
	specie varchar(200) not null,
	foreign key (vegetatie_fid) references vegetatie(fid)
);

CREATE TABLE sistem_irigare (
	fid SERIAL PRIMARY KEY not null,
	lungime integer not null,
	geom GEOMETRY(LineString, 4326) NOT NULL,
	zona_verde_fid integer not null,
	foreign key (zona_verde_fid) references zona_verde(fid)
);

CREATE TABLE tip_sistem_irigare (
	fid SERIAL PRIMARY KEY not null,
	sistem_irigare_fid integer not null,
	nume varchar(100) not null,
	descriere text not null,
	foreign key (sistem_irigare_fid) references sistem_irigare(fid)
);

CREATE TABLE mobilier_urban (
	fid SERIAL PRIMARY KEY not null,
	zona_verde_fid integer not null,
	localizare integer not null,
	geom geometry (Point, 4326),
	foreign key (zona_verde_fid) references zona_verde(fid)
);

CREATE TABLE tip_mobilier_urban (
	fid SERIAL PRIMARY KEY not null,
	mobilier_urban_fid integer not null,
	tip varchar(200) not null,
	numar integer not null,
	foreign key (mobilier_urban_fid) references mobilier_urban(fid)
);

SELECT fid, ST_Area(geom) AS area FROM zona_verde;
SELECT fid, ST_Perimeter(geom) AS perimeter  FROM zona_verde;
SELECT fid, ST_Centroid(geom) AS centroid FROM zona_verde;


