SELECT COUNT(*) AS TotalCustomers FROM MüþteriTablosu WHERE Madres LIKE '%Tokat%';
SELECT AVG(Fiyat) AS ortalama_fiyat FROM [Arac Tablosu]
WHERE Model > 3;
SELECT AVG(Sfiyat) AS ortalama_satis_fiyati FROM [Satýþ Tablosu];
SELECT * FROM [Alým Tablosu]
WHERE Afiyat > 10000;
SELECT Araçno, (MAX(Sfiyat) - MIN(Sfiyat)) AS fiyat_farki
FROM  [Satýþ Tablosu]
GROUP BY Araçno;
SELECT DISTINCT MAdi FROM [Satýþ Tablosu] s
JOIN MüþteriTablosu m ON s.MNo = m.Mno;
SELECT MAdi AS MAdi, a.Marka
FROM [Satýþ Tablosu] s
JOIN MüþteriTablosu m ON s.Mno= m.Mno
JOIN [Arac Tablosu] a ON s.Araçno = a.Araçno;

SELECT Madi AS Madi, COUNT(s.Araçno) AS Alimno
FROM [Alým Tablosu] s
JOIN MüþteriTablosu m ON s.Mno = m.Mno
GROUP BY Madi;
SELECT DISTINCT a.Marka, a.Model
FROM [Arac Tablosu] a
JOIN [Satýþ Tablosu] s ON a.Araçno = s.Araçno;
SELECT 
    (SELECT SUM(Sfiyat) FROM [Satýþ Tablosu]) AS toplam_satis_tutari,
    (SELECT SUM(Afiyat) FROM [Alým Tablosu]) AS toplam_alim_tutari,
    (SELECT SUM(Sfiyat) FROM [Satýþ Tablosu]) - (SELECT SUM(Afiyat) FROM [Alým Tablosu]) AS fark;
	SELECT a.Araçno, a.marka, a.model
FROM [Arac Tablosu] a
LEFT JOIN [Satýþ Tablosu] s ON a.Araçno = s.Araçno
WHERE s.Araçno IS NULL;
SELECT Araçno, AVG(Sfiyat) AS ortalama_satis_tutari
FROM [Satýþ Tablosu]
GROUP BY Araçno;
SELECT Marka, Model , COUNT(DISTINCT [Satýþ Tablosu].Araçno) AS satis_sayisi, COUNT(DISTINCT [Satýþ Tablosu].Araçno) AS [Alým Tablosu]
FROM [Arac Tablosu]
LEFT JOIN [Satýþ Tablosu] ON [Arac Tablosu].Araçno = [Satýþ Tablosu].Araçno
GROUP BY Marka,Model;
SELECT m.Madi AS musteri_ismi, a.Marka
FROM [Satýþ Tablosu] s
JOIN MüþteriTablosu m ON s.Mno = m.Mno
JOIN [Arac Tablosu] a ON s.Araçno = a.Araçno
WHERE Sfiyat > 20000;
SELECT Madi AS musteri_ismi, Marka
FROM MüþteriTablosu m
JOIN [Satýþ Tablosu] s ON m.Mno = s.Mno
JOIN [Arac Tablosu] a ON s.Araçno = a.Araçno
WHERE Madres LIKE '%Tokat%';
