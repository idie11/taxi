 sudo -i -u postgres
psql
create database kurut_taxi;
\q
psql kurut_taxi

create table Car(
marka varchar(255),
model varchar(255),
toplivo varchar(255),
obyom_dvig float,
tip_korobki_per varchar(255),
god_vypuska integer,
color varchar(255)
);

INSERT INTO Car(marka, model, toplivo, obyom_dvig, tip_korobki_per, god_vypuska, color) VALUES ('BMW', '570','БЕНЗИН', 2.7,'механика',1999,'черный');
INSERT INTO Car(marka, model, toplivo, obyom_dvig, tip_korobki_per, god_vypuska, color) VALUES ('Honda', 'odissey','дизель', 5.7,'автомат', 2004,'молочный');
INSERT INTO Car(marka, model, toplivo, obyom_dvig, tip_korobki_per, god_vypuska, color) VALUES ('Honda', 'fit',',БЕНЗИН', 3.1,'автомат', 2008,'белый');
INSERT INTO Car(marka, model, toplivo, obyom_dvig, tip_korobki_per, god_vypuska, color) VALUES ('kia', 's20','электро', 3.1,'автомат', 2015,'белый');
INSERT INTO Car(marka, model, toplivo, obyom_dvig, tip_korobki_per, god_vypuska, color) VALUES ('bmw', '330','БЕНЗИН', 6.1,'автомат', 2020,'белый');
INSERT INTO Car(marka, model, toplivo, obyom_dvig, tip_korobki_per, god_vypuska, color) VALUES ('bmw', '330','БЕНЗИН', 6.1,'автомат', 2020,'Красный');
INSERT INTO Car(marka, model, toplivo, obyom_dvig, tip_korobki_per, god_vypuska, color) VALUES ('tesla', 'n88','электро', 6.1,'автомат', 2001,'Красный');
INSERT INTO Car(marka, model, toplivo, obyom_dvig, tip_korobki_per, god_vypuska, color) VALUES ('жигуль', 'жигуль','бензин', 1.7,'механика', 1993,'синий');
INSERT INTO Car(marka, model, toplivo, obyom_dvig, tip_korobki_per, god_vypuska, color) VALUES ('лада', 'седан','бензин', 1.7,'механика', 1973,'баклажан');
INSERT INTO Car(marka, model, toplivo, obyom_dvig, tip_korobki_per, god_vypuska, color) VALUES ('леха', 'хз','бензин', 1.7,'механика', 1973,'баклажан');


create table Driver(
name varchar(25),
surname varchar(255),
birthday date,
voditelskii_staj integer,
gender varchar(7),
car_id integer REFERENCES Car(id));

INSERT INTO Driver(name, surname, birthday, voditelskii_staj, gender, car_id) VALUES ('Ди', 'Ни', '11-08-1999', 7, 'male', 1);
INSERT INTO Driver(name, surname, birthday, voditelskii_staj, gender, car_id) VALUES ('Эндри', 'Дрю', '11-01-1992', 3, 'female', 2);
INSERT INTO Driver(name, surname, birthday, voditelskii_staj, gender, car_id) VALUES ('Одри', 'Тату', '11-03-1980', 11, 'female', 3);
INSERT INTO Driver(name, surname, birthday, voditelskii_staj, gender, car_id) VALUES ('Нэйт', 'Робинсон', '11-06-1972', 15, 'male', 4);
INSERT INTO Driver(name, surname, birthday, voditelskii_staj, gender, car_id) VALUES ('Гуд', 'Робин', '11-07-1990', 9, 'male', 5);
INSERT INTO Driver(name, surname, birthday, voditelskii_staj, gender, car_id) VALUES ('Грейс', 'Дафф', '11-10-1995', 5, 'female', 6);
INSERT INTO Driver(name, surname, birthday, voditelskii_staj, gender, car_id) VALUES ('Белла', 'Хьюстон', '11-12-1991', 7, 'female', 7);
INSERT INTO Driver(name, surname, birthday, voditelskii_staj, gender, car_id) VALUES ('Женя', 'Грей', '11-02-1963', 20, 'female', 8);
INSERT INTO Driver(name, surname, birthday, voditelskii_staj, gender, car_id) VALUES ('Мирлан', 'Катч', '11-03-1959', 11, 'male', 9);
INSERT INTO Driver(name, surname, birthday, voditelskii_staj, gender, car_id) VALUES ('Кан', 'Ду', '11-03-1998', 1, 'male', 10);


create table Operator(
name varchar(255),
surname varchar(255),
birthday date,
gender varchar(7));

INSERT INTO Operator(name, surname, birthday,gender) VALUES ('Айя', 'Ни', '11-06-1995', 'female');
INSERT INTO Operator(name, surname, birthday,gender) VALUES ('Настя', 'Лю', '11-04-1995', 'female');
INSERT INTO Operator(name, surname, birthday,gender) VALUES ('Ко', 'Со', '11-01-1992', 'male');
INSERT INTO Operator(name, surname, birthday,gender) VALUES ('Тор', 'Хо', '11-04-1985', 'male');
INSERT INTO Operator(name, surname, birthday,gender) VALUES ('Po', 'Nu', '11-04-1995', 'male');
INSERT INTO Operator(name, surname, birthday,gender) VALUES ('Ki', 'Ki', '11-04-1986', 'female');
INSERT INTO Operator(name, surname, birthday,gender) VALUES ('Ko', 'Ko', '11-04-1986', 'female');
INSERT INTO Operator(name, surname, birthday,gender) VALUES ('Ki', 'Li', '11-08-1988', 'male');
INSERT INTO Operator(name, surname, birthday,gender) VALUES ('Din', 'Din', '11-01-1998', 'male');
INSERT INTO Operator(name, surname, birthday,gender) VALUES ('Tin', 'Tin', '11-04-1993', 'female');


SELECT * FROM Car where marka='toyota'AND model='Camry' ORDER BY god_vypuska DESC;

SELECT DISTINCT name from Operator ORDER BY name DESC LIMIT 10;

UPDATE Car SET marka='Mersus' WHERE marka='Mersedes';

DELETE from Driver where name='Азамат' and surname='Азаматов';

select count(voditelskii_staj) from Driver where voditelskii_staj>10 and gender='female';

select AVG(voditelskii_staj) from Driver where birthday>'10-10-1975';

select cr.*,d.name from car cr right join driver d on d.name=cr.marka;
select cr.*,d.name from car cr inner join driver d on d.name=cr.marka;
select cr.*,d.name from car cr left join driver d on d.name=cr.marka;