-- CREATE DATABASE brad;

 USE brad;


CREATE TABLE clientes (
	
	codcliente INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL
	
);


 SELECT * FROM clientes;


CREATE TABLE vendedores(
	codvendedor INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL
);


CREATE TABLE vendas(
	codvendas INT PRIMARY KEY,
	datavenda DATE NOT NULL,
	
	codcliente INT,
	codvendedor INT
);


 ALTER TABLE vendas ADD CONSTRAINT fk_vendas_codcliente FOREIGN KEY (codcliente) REFERENCES clientes (codcliente);
 ALTER TABLE vendas ADD CONSTRAINT fk_vendas_codvendedor FOREIGN KEY (codvendedor) REFERENCES vendedores (codvendedor);

 INSERT INTO clientes  VALUES(1, "Rodrigo");
 SELECT * FROM clientes
 INSERT INTO vendedores VALUES (1, 'Gaby');
 SELECT * FROM vendedores;
 INSERT INTO vendas VALUES (10, "2023-04-27", 1, 1);
 SELECT * FROM vendas;

 -- EXERCICIO 1 - POPULAR 10 LINHAS EM CADA TABELA

INSERT INTO clientes VALUES (2, 'Gabriella');
INSERT INTO clientes VALUES (3, 'Isabella');
INSERT INTO clientes VALUES (4, 'Diego');
INSERT INTO clientes VALUES (5, 'Dimitrius');
INSERT INTO clientes VALUES (6, 'Flavio');
INSERT INTO clientes VALUES (7, 'Emile');
INSERT INTO clientes VALUES (8, 'Eliane');
INSERT INTO clientes VALUES (9, 'Larissa');
INSERT INTO clientes VALUES (10, 'Matheus');
INSERT INTO clientes VALUES (11, 'Igor');

INSERT INTO vendedores VALUES (2, 'Rodrigo');
INSERT INTO vendedores VALUES (3, 'Patrícia');
INSERT INTO vendedores VALUES (4, 'Rosana');
INSERT INTO vendedores VALUES (5, 'Thiago');
INSERT INTO vendedores VALUES (6, 'Vinicius');
INSERT INTO vendedores VALUES (7, 'Rosana');
INSERT INTO vendedores VALUES (8, 'Marcos');
INSERT INTO vendedores VALUES (9, 'Juliana');
INSERT INTO vendedores VALUES (10, 'Rosana');
INSERT INTO vendedores VALUES (11, 'Kevin');

INSERT INTO vendas VALUES (2, '2023-04-26', 2, 9);
INSERT INTO vendas VALUES (6, '2023-04-24', 3, 8);
INSERT INTO vendas VALUES (3, '2023-04-25', 10, 7);
INSERT INTO vendas VALUES (5, '2023-04-27', 5, 2);
INSERT INTO vendas VALUES (4, '2023-04-27', 6, 3);
INSERT INTO vendas VALUES (7, '2023-04-27', 7, 4);
INSERT INTO vendas VALUES (11, '2023-04-24', 8, 2);
INSERT INTO vendas VALUES (8, '2023-04-25', 9, 10);
INSERT INTO vendas VALUES (9, '2023-04-25', 11, 5);
INSERT INTO vendas VALUES (6, '2023-04-26', 4, 3);
INSERT INTO vendas VALUES (1, '2023-04-26', 4, 3);


 SELECT * FROM clientes;

 ALTER TABLE vendas CHANGE codvendas cod_vendas INT;
 ALTER TABLE vendas add nome_venda VARCHAR(255);
 ALTER TABLE vendas MODIFY COLUMN nome_venda DATE;
 ALTER TABLE vendas DROP nome_venda;
 SELECT * FROM vendas;


-- EXERCICIO 2
-- 1 - Adicionar uma coluna na tabela vendas a gosto (sendo Varchar 255)
 ALTER TABLE vendas ADD descr_prod VARCHAR(255) NOT NULL;

-- 2 - Modificar uma coluna na tabela vendas criada no exercício 1 por varchar 100 (tipagem do campo)
 ALTER TABLE vendas MODIFY datavenda VARCHAR(100);

-- 3 - Modificar a coluna datavenda na tabela vendas por data_venda
 ALTER TABLE vendas CHANGE datavenda data_venda DATE;

-- 4 - Excluir a coluna criada no exercício 1 da tabela venda
 ALTER TABLE vendas DROP descr_prod;

 UPDATE vendedores SET nome = 'Gaby brad' WHERE codvendedor = 1 AND nome = 'Gaby';
 ALTER TABLE vendas ADD vendas_teste VARCHAR(50);
 UPDATE vendas SET vendas_teste = 'TV' WHERE cod_vendas = 9;
 UPDATE vendas SET vendas_teste = 'alguma coisa' WHERE cod_vendas IS NULL;

-- EXERCICIO UPDATE 
 1) REALIZAR UM UPDATE NA TABELA VENDEDORES, COLOCANDO MAIS UM SOBRENOME EM CADA VENDEDOR (somente em 5 vendedores).

 UPDATE vendedores SET nome = 'Patricia Amauri' WHERE codvendedor = 3;
 UPDATE vendedores SET nome = 'Rosana da Silva' WHERE codvendedor = 10 AND nome = 'Rosana';
 UPDATE vendedores SET nome = 'Rodrigo Pavloff' WHERE nome = 'Rodrigo';
 UPDATE vendedores SET nome = 'Fulano Beltrano' WHERE codvendedor = 11;
 UPDATE vendedores SET nome = 'Juliana Pascal' WHERE codvendedor = 9 AND nome = 'Juliana';
 SELECT * FROM vendedores;

-- 2) REALIZAR UM UPDATE NA TABELA CLIENTES, COLOCANDO MAIS UM SOBRENOME EM CADA CLIENTE (somente em 5 clientes).

 UPDATE clientes SET nome = 'Rodrigo Pavloff' WHERE codcliente = 1;
 UPDATE clientes SET nome = 'Diego Silva' WHERE nome = 'Diego';
 UPDATE clientes SET nome = 'Flavio Albuquerque' WHERE codcliente = 6;
 UPDATE clientes SET nome = 'Emile Rodriguez' WHERE codcliente = 7 AND nome = 'Emile';
 UPDATE clientes SET nome = 'Igor Pitsburg' WHERE nome = 'Igor';


SELECT 		* 
FROM 			vendas vd
LEFT JOIN 	vendedores vs
ON 			vd.codvendedor = vs.codvendedor;

 
SELECT 		cs.codcliente, COUNT(vs.data_venda) AS qte 
FROM 			vendas vs
LEFT JOIN 	clientes cs
ON			   vs.codcliente = cs.codcliente
GROUP BY 	cs.codcliente
ORDER BY 	qte ASC
LIMIT 		10


-- EXERCICIO DE MANIPULAÇÃO
-- 1)INNER JOIN VENDAS X CLIENTES

SELECT 		*
FROM			vendas vd
INNER JOIN 	clientes cli
ON				vd.codcliente = cli.codcliente
;

-- 2)LEFT JOIN VENDAS X VENDEDORES

SELECT 		*
FROM			vendas vd
LEFT JOIN 	vendedores vdr
ON				vd.codvendedor = vdr.codvendedor
;

-- 3)RIGHT JOIN VENDAS X VENDEDORES

SELECT 		*
FROM			vendas vd
RIGHT JOIN 	vendedores vdr
ON				vd.codvendedor = vdr.codvendedor
;

-- 4)INNER JOIN VENDAS X CLIENTES e LEFT JOIN VENDAS X VENDEDORES

SELECT			*
FROM				vendas     AS vd
INNER JOIN		clientes   AS cli
ON					cli.codcliente = vd.codcliente
LEFT JOIN		vendedores AS vds
ON					vds.codvendedor = vd.codvendedor
;

-- 5)LEFT JOIN VENDAS X CLIENTES e RIGHT JOIN VENDAS X VENDEDORES, GROUP BY POR DATAVENDA, ORDER BY DESC POR DATAVENDA E UM LIMIT DE 1

SELECT			*
FROM				vendas     AS vd
INNER JOIN		clientes   AS cli
ON					cli.codcliente = vd.codcliente
LEFT JOIN		vendedores AS vds
ON					vds.codvendedor = vd.codvendedor
GROUP BY			vd.cod_vendas
LIMIT				1
;
-- FIM