drop database ecommerce;
create database ecommerce;
use ecommerce;

create table clients(
 idClient int auto_increment primary key,
 Fname varchar(10),
 Minit char(3),
 Lname varchar(20),
 CPF char(11) not null,
 Address varchar(55),
 constraint unique_cpf_client unique (CPF)
 );

alter table clients auto_increment=1;

create table typeclient(
 idClient int auto_increment primary key,
 Fname varchar(10),
 CPF char(11) not null,
 clientType enum('PJ','PF') default 'PJ',
 constraint unique_pf_client unique (clientpf)
 );

create table product(
  idProduct int auto_increment primary key,
  Pname varchar(50) not null,
  classification_kids bool default false,
  category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
  avaliação float default 0,
  size varchar(10),
  constraint unique_pname_product unique (Pname)
 );

create table payments(
  idClient int,
  idPayment int,
  typePayment enum('Boleto','Debito','Credito','Pix') default 'Boleto',
  limitAvailable int,
  primary key(idClient,idPayment)
 );

create table orders(
  idOrders int auto_increment primary key,
  idOrdersClient int,
  idOrderspayment int,
  ordersStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
  ordersDescription varchar(255),
  sendValue float default 10,
  paymentCash bool default false,
  constraint fk_orders_client foreign key (idOrdersClient) references clients(idClient),
  constraint fk_orders_payment foreign key (idOrderspayment) references payments(idPayment)
 );


create table delivery(
 idDelivery int auto_increment primary key,
 StatusDelivery enum('Em andamento', 'Processando', 'Enviado', 'Entregue') default 'Em andamento',
 codigoRastreio int
);

create table productStorage(
  idProdStorage int auto_increment primary key,
  storagelocation varchar(255),
  quantity int default 0
 );

create table supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);
  
create table seller(
 idSeller int auto_increment primary key,
 SocialName varchar(255) not null,
 CNPJ char(15),
 CPF char(11),
 location varchar(255),
 contact char(11) not null,
 constraint unique_cnpj_seller unique (CNPJ),
 constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
 idPseller int,
 idProduct int,
 prodQuantity int default 1,
 primary key (idPseller, idProduct),
 constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
 constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

create table productOrder(
 idPOproduct int,
 idPOorder int,
 poQuantity int default 1,
 poStatus enum('Disponível','Sem estoque') default 'Disponível',
 primary key (idPOproduct, idPOorder),
 constraint fk_productorder_product foreign key (idPOproduct) references product(idProduct),
 constraint fk_productorder_order foreign key (idPOorder) references orders(idOrders)
);

create table storageLocation(
  idLproduct int,
  idLstorage int,
  location varchar(255) not null,
  primary key (idLproduct, idLstorage),
  constraint fk_storagelocation_product foreign key (idLproduct) references product(idProduct),
  constraint fk_storagelocation_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
  idPsSupplier int auto_increment,
  idPsProduct int auto_increment,
  quantity int not null,
  primary key (idPsSupplier, idPsProduct),
  constraint fk_productsupplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
  constraint fk_productsupplier_product foreign key (idPsProduct) references product(idProduct)
);


 show tables;

