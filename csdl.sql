create database banhang;
use banhang;
create table customers
(
    customer_id int          not null,
    name        nvarchar(50) not null,
    phone       int          not null,
    address     nvarchar(50) not null,
    constraint PK_customer_id primary key (customer_id)
);
drop table productsline;
create table ProductsLine
(
    Product_line int primary key,
    Description  nvarchar(255) not null
);
create table Products
(
    product_code int primary key,
    product_name nvarchar(50) not null,
    Description  nvarchar(50) not null,
    amount       int          not null,
    Price_enter  double       not null,
    Price        double       not null,
    Product_line int,
    constraint FK_Product_line foreign key (Product_line) references ProductsLine (Product_line)
);

create table orders
(
    orders_number            int primary key,
    date_of_purchase         date   not null,
    Date_of_delivery_request date   not null,
    Actual_delivery_date     date   not null,
    Number_of_orders         int    not null,
    Unit_price               double not null,
    constraint FK_orders_number foreign key (orders_number) references customers (customer_id)
);

create table OrderDetails
(
    product_code  int not null,
    orders_number int not null,
    constraint PK_OrderDetails primary key (product_code, orders_number),
    constraint FK_product_OrderDetails foreign key (product_code) references Products (product_code),
    constraint FK_orders_OrderDetails foreign key (orders_number) references orders (orders_number)
);
create table Payments
(
    Payments_code int    not null,
    date_Payments date   not null,
    money         double not null,
    constraint FK_Payments_code foreign key (Payments_code) references customers (customer_id)
);
create table Employees
(
    employees_number       int primary key,
    employees_name         nvarchar(50)  not null,
    employees_email        nvarchar(255) not null,
    work_name              nvarchar(50)  not null,
    salesRepEmployeeNumber int,
    constraint FK_salesRepEmployeeNumber foreign key (salesRepEmployeeNumber) references customers (customer_id)
);
create table Offices
(
    Offices_code int,
    address      nvarchar(255) not null,
    phone        int           not null,
    nation       nvarchar(50)  not null,
    constraint FK_Offices foreign key (Offices_code) references Employees (employees_number)
);