Select  Nombre From Producto --Consigna 1

Select Nombre,Precio From Producto -- Consigna 2

Select Nombre From Producto where Precio <=200 -- Consigna 3

SELECT *
FROM Producto
WHERE Precio BETWEEN 60 AND 120; -- Consigna 4

Select Producto.Nombre, Producto.Precio*100 from Producto --consigna 5

Select AVG (Precio) From Producto -- Consigna 6

Select AVG (Precio) From Producto where ProveedorId = 2 -- Consigna 7

Select COUNT (Producto.Precio) From Producto where Precio>= 180 -- Consigna 8

Select Nombre,Precio From Producto where Precio>=180 Order By Precio asc -- Consigna 9 A

Select Nombre,Precio From Producto where Precio>=180 Order By Nombre desc -- consigna 9 B



Select * From Producto p join Proveedor pr
on p.Id=pr.Id; -- Consigna 10

select p.Nombre , p.Precio , pr.Nombre From Producto p join Proveedor pr 
on p.Id=pr.Id ; -- consigna 11

select AVG (p.Precio)  From Producto p  join proveedor pr 
on p.Id = pr.Id group by p.ProveedorId,pr.Id; --consigna 12



select avg(p.Precio) promedio , pr.Nombre From Producto p join Proveedor pr
on pr.Id=p.Id group by pr.Nombre  ;  -- Consigna 13

Select AVG  (P.precio) promedio,Pr.Nombre 
from Producto P join Proveedor Pr
ON P.ProveedorId = Pr.Id
Group by P.ProveedorId, Pr.Nombre
HAVING AVG (P.precio)  >= 150    --Consigna 14

select top 1 p.Nombre, p.Precio
 From Producto p order by p.Precio asc -- consigna 15

Select Pr.Nombre, P.Nombre, P.Precio
from Proveedor pr Join Producto p
ON Pr.Id = P.Id
AND 
P.Precio = (Select MAX(Producto.precio) from producto where Pr.Id = Producto.Id) -- consigna 16


Select Proveedor.Nombre, Avg(Producto.Precio), count(Producto.ProveedorId)
from Proveedor, Producto
where Producto.ProveedorId = Proveedor.Id
Group by Proveedor.Nombre, Producto.ProveedorId
Having Avg(Producto.Precio) >= 145 and  count(Producto.ProveedorId) >= 2 -- Consigna 17

INSERT INTO Producto(Id,Nombre,Precio,ProveedorId) values (11,'Altavoces',70,2) --Consigna 18

UPDATE Producto set Nombre = 'Impresora laser' where Producto.Id = 8 -- Consigna 19

Update Producto set Precio = Precio-(Precio*0.10) -- consigna 20

Update Producto set Precio = Precio-(Precio*0.10) where precio >= 120 -- Consigna 21