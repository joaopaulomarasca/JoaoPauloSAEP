CREATE TABLE itens (
    id         SERIAL PRIMARY KEY,
    nome       VARCHAR(100) NOT NULL,
    tipo       VARCHAR(50)  NOT NULL,
    preco      DECIMAL(10,2) NOT NULL,
    estoque    INTEGER DEFAULT 0,
    descricao  TEXT,
	data_criacao  TIME
);

INSERT INTO itens (nome, tipo, preco, estoque, descricao, data_criacao) VALUES
('Teclado Gamer', 'Periférico', 150.00, 15, 'Teclado mecânico RGB', '2026-07-16')
    ('Uniforme',        'Roupa',      15.00, 130, 'Usar pra se vestir', '2026-04-16'),
    ('Botina',        'Roupa',      20.00, 130, 'CAlçado de usar no pé', '2026-01-11'),
    ('Vassoura',       'Objeto', 8.50, 15, 'Usado para varer', '2026-01-20'),
    ('Caixa de papelão',           'Objeto', 5.00, 40, 'usa pra guarda coisas''2026-04-16'),
    ('Agua',  'Bebida',     45.00, 1000, 'Beba para matar a sua sede''2025-10-30'),
    ('Refrigerante',      'Bebida',12.00, 25, 'Bebida com gases''2025-12-16'),
    ('Café','Bebida',    35.00,  8, 'Café');

CREATE TABLE IF NOT EXISTS "clientes" (
	"id" serial NOT NULL UNIQUE,
	"name" varchar(255),
	"endereco" varchar(255),
	"email" varchar(255),
	"telefone" varchar(255),
	PRIMARY KEY("id")
);

ALTER TABLE pedidos 
RENAME COLUMN product_id TO item_id;

ALTER TABLE pedidos 
ADD CONSTRAINT fk_pedidos_item 
FOREIGN KEY (item_id) REFERENCES itens(id) ON DELETE SET NULL;


DROP TABLE IF EXISTS "estoque";

CREATE TABLE "estoque" (
    "id"         SERIAL PRIMARY KEY,
    "item_id"    INT NOT NULL,
    "tipo_mov"   VARCHAR(10) NOT NULL CHECK ("tipo_mov" IN ('ENTRADA', 'SAÍDA')),
    "quantidade" INT NOT NULL CHECK ("quantidade" > 0),
    "date"       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "fk_estoque_item" FOREIGN KEY ("item_id") REFERENCES "itens" ("id") ON DELETE CASCADE
);


