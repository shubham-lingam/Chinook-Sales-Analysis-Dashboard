-- Top 10 Customers by Revenue

SELECT c.CustomerID, c.FirstName, c.LastName, SUM(il.UnitPrice * il.Quantity) AS TotalSpent
FROM customer c
JOIN invoice i ON c.CustomerId = i.CustomerId
JOIN invoiceline il ON i.InvoiceId = il.InvoiceId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY TotalSpent DESC
LIMIT 10 ;

-- Top 5 Selling Genres
 
 SELECT g.Name AS GenreName, SUM(il.UnitPrice * il.Quantity) AS TotalSales
 FROM genre g 
 JOIN track t ON g.GenreId = t.GenreId
 JOIN invoiceline il ON t.TrackId = il.TrackId
 GROUP BY GenreName
 ORDER BY TotalSales DESC
 LIMIT 5 ;
 
 -- Top 3 Selling Artist
 
 SELECT a.Name AS ArtistName, SUM( il.Unitprice * il.Quantity) TotalSales
 FROM artist a
 JOIN album al ON a.ArtistId = al.ArtistId
 JOIN track t ON t.AlbumId = al.AlbumId
 JOIN invoiceline il ON t.TrackId = il.TrackId
 GROUP BY ArtistName
 ORDER BY TotalSales DESC
 LIMIT 3;
 
 -- Country Wise Sales Performance
 
 SELECT c.country,
		SUM(il.UnitPrice * il.Quantity) AS TotalSales,
        AVG(i.Total) AS AverageInvoice,
        COUNT(i.InvoiceID) AS NumberOfInvoices
FROM customer c 
JOIN invoice i ON c.CustomerId = i.CustomerId
JOIN invoiceline il ON i.InvoiceId = il.InvoiceId
GROUP BY c.Country
ORDER BY TotalSales DESC;

-- Employee Sales Agent Performance

SELECT e.EmployeeID, e.FirstName, e.LastName,
		SUM(il.UnitPrice * il.Quantity) AS TotalSales,
        RANK() OVER (ORDER BY SUM(il.UnitPrice * il.Quantity) DESC) AS SalesRank
FROM employee e 
JOIN customer c ON e.EmployeeId = c.SupportRepId
JOIN invoice i ON c.CustomerId = i.CustomerId
JOIN invoiceline il ON i.InvoiceId = il.InvoiceId
GROUP BY e.EmployeeId, e.FirstName, e.LastName
ORDER BY TotalSales DESC;









 
 
 
 
 
 
 
 
 
 
 
 