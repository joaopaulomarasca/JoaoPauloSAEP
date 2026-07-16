
CREATE TABLE IF NOT EXISTS "produtos" (
	"id" serial NOT NULL UNIQUE,
	"nome" varchar(255),
	"descricao" varchar(65535),
	"preco" DECIMAL(10,2) NOT NULL,
	"categoria_id" int,
	PRIMARY KEY("id")
);


CREATE TABLE IF NOT EXISTS "categoria" (
	"id" serial NOT NULL UNIQUE,
	"tipo" varchar(120),
	PRIMARY KEY("id")
);


CREATE TYPE "status_t" AS ENUM ('delivered', 'received', 'processing');

CREATE TABLE IF NOT EXISTS "estoque" (
	"id" serial NOT NULL UNIQUE,
	"data" timestamp,
	"quantidade" int,
	"status" status_t,
	"product_id" int,
	PRIMARY KEY("id")
);


CREATE TABLE IF NOT EXISTS "pedidos" (
	"id" serial NOT NULL UNIQUE,
	"cliente" int,
	"product_id" int,
	"date" timestamp,
	PRIMARY KEY("id")
);


CREATE TABLE IF NOT EXISTS "clientes" (
	"id" serial NOT NULL UNIQUE,
	"name" varchar(255),
	"endereco" varchar(255),
	"email" varchar(255),
	"telefone" varchar(255),
	PRIMARY KEY("id")
);


ALTER TABLE "estoque"
ADD FOREIGN KEY("product_id") REFERENCES "produtos"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "produtos"
ADD FOREIGN KEY("categoria_id") REFERENCES "categoria"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "pedidos"
ADD FOREIGN KEY("cliente") REFERENCES "clientes"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "pedidos"
ADD FOREIGN KEY("product_id") REFERENCES "produtos"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;