CREATE DATABASE redlocks;

USE redlocks;
CREATE TABLE user (
    Id INT PRIMARY KEY,
    Nama VARCHAR(200),
    Alamat VARCHAR(200),
    Jabatan VARCHAR(200)
);

INSERT INTO user(Id,Nama,Alamat,Jabatan)
VALUES
(1,'A','Jakarta','CEO'),
(2,'B','Bandung','CFO'),
(3,'C','Solo','CHRO'),
(4,'D','Bali','COO'),
(5,'E','Jakarta','Karyawan');