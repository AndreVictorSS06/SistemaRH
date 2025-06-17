CREATE TABLE IF NOT EXISTS "departamento" (
	"id_departamento" SERIAL PRIMARY KEY,
	"nome_departamento" varchar(50) NOT NULL,
	"localizacao" varchar(100) NULL
);

CREATE TABLE IF NOT EXISTS "cargo" (
	"id_cargo" SERIAL PRIMARY KEY,
	"nome_cargo" VARCHAR(255) NOT NULL,
	"descricao_cargo" VARCHAR(255) NOT NULL,
	"salario_base" NUMERIC(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS "funcionario" (
	"id_funcionario" SERIAL PRIMARY KEY ,
	"nome" VARCHAR(255) NOT NULL,
	"cpf" VARCHAR(14) NOT NULL UNIQUE,
	"data_nascimento" DATE NULL,
	"id_cargo" INT NOT NULL,
	"salario" NUMERIC(10, 2) NOT NULL,
	"id_departamento" INT NOT NULL,
	FOREIGN KEY ("id_cargo") REFERENCES "cargo"("id_cargo"),
	FOREIGN KEY ("id_departamento") REFERENCES "departamento"("id_departamento")
);

CREATE TABLE IF NOT EXISTS "beneficio" (
	"id_beneficio" SERIAL PRIMARY KEY,
	"nome" VARCHAR(100) NOT NULL,
	"valor" NUMERIC(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS "funcionario_beneficio" (
	"id_funcionario" INT NOT NULL,
	"id_beneficio" INT NOT NULL,
	"data_inicio" DATE NULL,
	"data_fim" DATE NULL,
	PRIMARY KEY ("id_funcionario", "id_beneficio"),
	FOREIGN KEY ("id_funcionario") REFERENCES "funcionario"("id_funcionario"),
	FOREIGN KEY ("id_beneficio") REFERENCES "beneficio"("id_beneficio")
);

CREATE TABLE IF NOT EXISTS "folha_de_pagamento" (
	"id_pagamento" SERIAL PRIMARY KEY,
	"id_funcionario" INT NOT NULL,
	"mes_referencia" DATE NULL,
	"salario_bruto" NUMERIC(10, 2) NOT NULL,
	"salario_liquido" NUMERIC(10, 2) NOT NULL,
	"data_pagamento" DATE NULL,
	FOREIGN KEY ("id_funcionario") REFERENCES "funcionario"("id_funcionario")
);

CREATE TABLE IF NOT EXISTS "ferias" (
	"id_ferias" SERIAL PRIMARY KEY,
	"data_incio" DATE NULL,
	"data_fim" DATE NULL,
	"id_funcionario" INT NOT NULL,
	"status" VARCHAR(20) CHECK (status IN ('planejada', 'aprovada', 'concluida')),
	FOREIGN KEY ("id_funcionario") REFERENCES "funcionario"("id_funcionario")
);

CREATE TABLE IF NOT EXISTS "projeto" (
	"id_projeto" SERIAL PRIMARY KEY,
	"nome" VARCHAR(100) NOT NULL,
	"data_incio" DATE NULL,
	"data_termino" DATE NULL,
	"id_departamento" INT NOT NULL,
	FOREIGN KEY ("id_departamento") REFERENCES "departamento"("id_departamento")
);

CREATE TABLE IF NOT EXISTS "funcionario_projeto" (
	"id_funcionario" INT NOT NULL,
	"id_projeto" INT NOT NULL,
	"data_inicio" DATE,
	"data_fim" DATE,
	PRIMARY KEY ("id_funcionario", "id_projeto"),
	FOREIGN KEY ("id_funcionario") REFERENCES "funcionario"("id_funcionario"),
	FOREIGN KEY ("id_projeto") REFERENCES "projeto"("id_projeto")
);
