-- Mostra todos os funcionários com salario maior que 5000 - 1
SELECT nome, salario 
FROM funcionario
WHERE funcionario.salario > 5000;

-- Funcionários com salario entre R$2000 e R$4000 - 2
SELECT nome, salario 
FROM funcionario
WHERE salario BETWEEN 2000 AND 4000;

-- Funcionários com nome que começam com a letra "A" - 3
SELECT nome 
FROM funcionario 
WHERE nome LIKE 'A%';

-- Funcionários cujo nome contém "Silva" - 4 
SELECT nome 
FROM funcionario 
WHERE nome 
LIKE '%Silva%';

-- Mostra em qual departamento o funcionário está lotado - 5
SELECT f.nome, d.nome_departamento
FROM Funcionario AS f
INNER JOIN Departamento AS d ON f.id_departamento = d.id_departamento; 

-- Busca os funcionários que estão lotados no departamento de TI - 6
SELECT f.nome, d.nome_departamento
FROM funcionario AS f
INNER JOIN departamento AS d 
ON f.id_departamento = d.id_departamento
WHERE d.nome_departamento = 'TI';

-- Busca o salário liquido menor que R$3000 dos funcionários- 7
SELECT f.nome, fp.salario_liquido
FROM folha_de_pagamento AS fp
JOIN funcionario AS f 
ON fp.id_funcionario = f.id_funcionario
WHERE fp.salario_liquido < 3000;

-- Funcionários com benefícios acima de R$ 500 - 8
SELECT f.nome, b.nome, b.valor
FROM funcionario AS f
JOIN funcionario_beneficio AS fb ON f.id_funcionario = fb.id_funcionario
JOIN beneficio AS b	ON b.id_beneficio = fb.id_beneficio
WHERE b.valor > 500;

-- Mostra o projeto que o funcionário está trabalhando e o departamento a qual ele está lotado -9
SELECT f.nome, p.nome, d.nome_departamento
FROM funcionario AS f
JOIN funcionario_projeto AS fp ON f.id_funcionario = fp.id_funcionario
JOIN projeto as p ON p.id_projeto = fp.id_projeto
JOIN departamento as d ON d.id_departamento = f.id_departamento; 

-- Média salarial por cargo - 10
SELECT c.nome_cargo, ROUND(AVG(f.salario), 2) AS Média_total_cargo
FROM cargo AS c
JOIN funcionario AS f ON c.id_cargo = f.id_cargo
GROUP BY c.nome_cargo;

-- nome do funcionário que tem mais de um beneficio - 11
SELECT f.nome, COUNT(*) AS total_beneficio
FROM funcionario_beneficio AS fb
JOIN beneficio AS b ON fb.id_beneficio = b.id_beneficio
JOIN funcionario AS f ON fb.id_funcionario = f.id_funcionario
GROUP BY f.nome
HAVING COUNT(*) > 1;

-- Mostra quantos projetos tem cada departamento - 12
SELECT d.nome_departamento, COUNT(p.id_projeto) AS total_projetos
FROM projeto AS p
JOIN departamento AS d ON d.id_departamento = p.id_departamento
GROUP BY d.nome_departamento;

-- Mostra o nome do funcionario e quantos projetos ele está alocado - 13
SELECT f.nome, COUNT(fp.id_projeto) AS total_projetos
FROM funcionario_projeto AS fp
JOIN projeto AS p ON fp.id_projeto = p.id_projeto
JOIN funcionario AS f ON fp.id_funcionario = f.id_funcionario
GROUP BY f.nome;

-- Top 3 cargos que tem mais funcionarios - 14
SELECT c.nome_cargo, COUNT(f.id_funcionario) AS total_funcionarios 
FROM cargo AS c
JOIN funcionario AS f ON c.id_cargo = f.id_cargo
GROUP BY c.nome_cargo
ORDER BY total_funcionarios DESC
LIMIT 3;

-- Lista a média salarial dos funcionarios que possuem o cargo que começam com "Assistente" - 15
SELECT c.nome_cargo, ROUND(AVG(f.salario), 2) media_salario
FROM funcionario AS f
JOIN cargo AS c ON f.id_cargo = c.id_cargo
GROUP BY c.nome_cargo
HAVING c.nome_cargo 
LIKE 'Assistente%';

-- Listar os 10 primeiro funcionários ordenados pelo o salário sendo do menor para o maior.(ORDER BY) -16
SELECT nome, salario
FROM funcionario 
ORDER BY salario ASC
LIMIT 10;

-- Listar os funcionarios com ferias aprovadas do por ordem alfabetica.(ORDER BY) -17
SELECT fu.nome, fe.status
FROM ferias AS fe
JOIN funcionario AS fu ON fe.id_funcionario = fu.id_funcionario
WHERE status = 'aprovada'
ORDER BY fu.nome ASC;

-- Listar quais são os beneficios que tem os valores entre 200 e 2000. - 18
SELECT nome, SUM(valor) AS Valor
FROM beneficio
GROUP BY nome
HAVING SUM(valor) BETWEEN 200 AND 2000
ORDER BY valor ASC;

-- Seleciona o nome do cargo e o valor do salario base que está entre R$3200.00 e R$5500.00 em ordem decrescente. -19
SELECT nome_cargo, SUM(salario_base) AS Valor
FROM cargo
GROUP BY nome_cargo
HAVING SUM(salario_base) BETWEEN 3200 AND 5500
ORDER BY SUM(salario_base) DESC;

-- Informar o nome do Funcionario e quantas vezes aparece o mesmo numero(555) no CPF no geral. -20
SELECT Nome, CPF 
FROM funcionario 
WHERE CPF LIKE '%555%'
GROUP BY Nome, CPF;

