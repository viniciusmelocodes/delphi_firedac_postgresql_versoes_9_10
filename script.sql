-- Drop table

-- DROP TABLE public.table_teste

CREATE TABLE public.table_teste (
	id serial NOT NULL,
	descricao varchar(200) NULL,
	CONSTRAINT table_teste_pk PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
) ;

-- Permissions

ALTER TABLE public.table_teste OWNER TO postgres;
