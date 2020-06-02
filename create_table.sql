
DROP TABLE IF EXISTS Quarter_Time;
DROP TABLE IF EXISTS Week_Time;
DROP TABLE IF EXISTS Time;
DROP TABLE IF EXISTS Region;
DROP TABLE IF EXISTS Cases;

CREATE TABLE Quarter_Time(
  "id" int NOT NULL,
  "year" int NOT NULL,
  "quarter" int NOT NULL,
  "month" int NOT NULL,
  "day" int NOT NULL,
  PRIMARY KEY("id")
);

CREATE TABLE Week_Time(
  "id" int NOT NULL,
  "year" int NOT NULL,
  "week" int NOT NULL,
  "day_week" int NOT NULL,
  PRIMARY KEY("id")
);

CREATE TABLE Time(
  "id" int NOT NULL,
  "fk_qt" int,
  "fk_wt" int,
  PRIMARY KEY("id"),
  FOREIGN KEY ("fk_qt") REFERENCES Quarter_Time("id"),
  FOREIGN KEY ("fk_wt") REFERENCES Week_Time("id")
);

CREATE TABLE Region(
  "id" int NOT NULL,
  "region" int,
  "subregion" int,
  "country" int,
  "country_code" varchar(255),
  PRIMARY KEY("id")
);


CREATE TABLE Cases(
  "id" int NOT NULL,
  "cases" int,
  "deaths" int,
  "cases100k" real,
  "deaths100k" real,
  "fk_time" int,
  "fk_region" int,
  PRIMARY KEY("id"),
  FOREIGN KEY ("fk_time") REFERENCES Time("id"),
  FOREIGN KEY ("fk_region") REFERENCES Region("id")
);
