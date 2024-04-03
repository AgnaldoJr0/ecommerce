use ecommerce;

show tables;

insert into clients (Fname, Minit, Lname, CPF, Address) values
('Maria', 'M', 'Silva', 12334636342, 'rua silva de prata 29, Carangola - Cidade das flores'),
('Matheus', 'O', 'Ramos', 45645613422, 'rua siena priev 292, Ibipura - Cidade das flores'),
('José', 'G', 'Leal', 67247436735, 'rua pascal coelho 100, Zona Norte - Cidade das flores'),
('Velma', 'P', 'Leal', 36471275636, 'avenida koller 19, centro - Cidade das flores');

select * from clients;
insert into typeclient (clientType) values
(default),
('PF'),
(default),
('PF');

select * from typeclient;

insert into product (Pname, classification_kids, category, avaliação, size) values
('Fones de ouvido',false,'Eletrônico','4',null),
('Barbie Elsa',true,'Brinquedos','3',null),
('Body Carters',true,'Vestimenta','5',null),
('Mesa de jantar',false,'Móveis','4',null),
('Microfone Vedo - Youtuber',false,'Eletrônico','4',null);

select * from product;

insert into payments (idClient, typePayment, limitAvailable) values
(1,'Boleto', 500.00),
(2,'Débito', 1000.00),
(3,'Crédito', 3000.00),
(4,'Pix', 2000.00);

select * from payments;

insert into orders ( orderStatus, orderDescription, sendValue, paymentCash) values
(default,'compra via aplicativo',39,2),
(default,'compra via aplicativo',50,1),
('Confirmado',null,100,0),
(default,'compra via web site',150,3);

select * from orders;

insert into delivery (StatusDelivery, codigoRastreio) values
(default,12344),
('Processando',46333),
(default,14244),
('Processando',123344);

select * from delivery;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
(1,1,2,null),
(2,1,1,null),
(3,2,1,null);


insert into productStorage (idProdStorage, storageLocation, quantity) values
(1,'Rio de janeiro',1000),
(2,'Itaporanga-SP',10),
(3,'São Paulo',5000),
(4,'Brasília',100);

select * from productStorage;
insert into storageLocation (idLproduct, idLstorage, location) values
(1,2,'RJ'),
(2,6,'SP'),
(3,4,'GO');
 
insert into supplier (SocialName, CNPJ, contact) values
('Eletrônicos Almeida e Filhos',128734968759187,'12349890'),
('Eletrônicos Silva',910236918273687,'10928360'),
('Eletrônicos Valma',127635978796998,'19028360');

select * from supplier;
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
(1,1,500),
(1,2,400),
(2,4,633),
(3,3,5),
(2,5,10);

select * from productSupplier;

insert into seller (SocialName, CNPJ, CPF, location, contact) values
('Tech eletronics',128745547678189,null,'Rio de Janeiro',219946287),
('Botique Durgas',null,12315615612,'Itaporanga',910827398),
('Kids World',128745687678189,null,'São Paulo',212455552);

select * from seller;
insert into productSeller (idPseller, idProduct, prodQuantity) values
(1,6,80),
(2,7,10),
(3,5,10);

select * from clients where idclient = 1;

select * from productStorage where storageLocation = 'Itaporanga-SP';

select * from seller where contact = 910827398;

select * from seller where location = 'São Paulo';

select avg(avaliação) as AvgRating
from product;

select count(*) as total_leal_clients from clients where Lname ='Leal';

select * from supplier order by SocialName;

select * from product order by avaliação;

select * from clients order by Fname;

select avaliação, count(*) as qt_avaliacao
from product
group by avaliação
having count(*) >= 1;

select idPsSupplier, count(*) as qt_produto
from productSupplier
group by idPsSupplier
having count(*) > 1;

select c.*, o.*, p.*
from clients c
join orders o on c.idClient = o.idOrdersClient
join payments p on c.idClient = p.idClient;

select s.*, ps.*, p.*, sl.*
from seller s
join productSeller ps on s.idSeller = ps.idPseller
join product p on ps.idProduct = p.idProduct
join storageLocation sl on p.idProduct = sl.idLproduct;
