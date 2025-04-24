SELECT COUNT(*) AS TotalCustomers FROM M��teriTablosu WHERE Madres LIKE '%Tokat%';
SELECT AVG(Fiyat) AS ortalama_fiyat FROM [Arac Tablosu]
WHERE Model > 3;
SELECT AVG(Sfiyat) AS ortalama_satis_fiyati FROM [Sat�� Tablosu];
SELECT * FROM [Al�m Tablosu]
WHERE Afiyat > 10000;
SELECT Ara�no, (MAX(Sfiyat) - MIN(Sfiyat)) AS fiyat_farki
FROM  [Sat�� Tablosu]
GROUP BY Ara�no;
SELECT DISTINCT MAdi FROM [Sat�� Tablosu] s
JOIN M��teriTablosu m ON s.MNo = m.Mno;
SELECT MAdi AS MAdi, a.Marka
FROM [Sat�� Tablosu] s
JOIN M��teriTablosu m ON s.Mno= m.Mno
JOIN [Arac Tablosu] a ON s.Ara�no = a.Ara�no;

SELECT Madi AS Madi, COUNT(s.Ara�no) AS Alimno
FROM [Al�m Tablosu] s
JOIN M��teriTablosu m ON s.Mno = m.Mno
GROUP BY Madi;
SELECT DISTINCT a.Marka, a.Model
FROM [Arac Tablosu] a
JOIN [Sat�� Tablosu] s ON a.Ara�no = s.Ara�no;
SELECT 
    (SELECT SUM(Sfiyat) FROM [Sat�� Tablosu]) AS toplam_satis_tutari,
    (SELECT SUM(Afiyat) FROM [Al�m Tablosu]) AS toplam_alim_tutari,
    (SELECT SUM(Sfiyat) FROM [Sat�� Tablosu]) - (SELECT SUM(Afiyat) FROM [Al�m Tablosu]) AS fark;
	SELECT a.Ara�no, a.marka, a.model
FROM [Arac Tablosu] a
LEFT JOIN [Sat�� Tablosu] s ON a.Ara�no = s.Ara�no
WHERE s.Ara�no IS NULL;
SELECT Ara�no, AVG(Sfiyat) AS ortalama_satis_tutari
FROM [Sat�� Tablosu]
GROUP BY Ara�no;
SELECT Marka, Model , COUNT(DISTINCT [Sat�� Tablosu].Ara�no) AS satis_sayisi, COUNT(DISTINCT [Sat�� Tablosu].Ara�no) AS [Al�m Tablosu]
FROM [Arac Tablosu]
LEFT JOIN [Sat�� Tablosu] ON [Arac Tablosu].Ara�no = [Sat�� Tablosu].Ara�no
GROUP BY Marka,Model;
SELECT m.Madi AS musteri_ismi, a.Marka
FROM [Sat�� Tablosu] s
JOIN M��teriTablosu m ON s.Mno = m.Mno
JOIN [Arac Tablosu] a ON s.Ara�no = a.Ara�no
WHERE Sfiyat > 20000;
SELECT Madi AS musteri_ismi, Marka
FROM M��teriTablosu m
JOIN [Sat�� Tablosu] s ON m.Mno = s.Mno
JOIN [Arac Tablosu] a ON s.Ara�no = a.Ara�no
WHERE Madres LIKE '%Tokat%';
