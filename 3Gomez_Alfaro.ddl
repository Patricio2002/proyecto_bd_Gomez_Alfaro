CREATE SEQUENCE cliente_seq increment by 1 minvalue 0 no maxvalue;
CREATE SEQUENCE contrato_seq increment by 1 minvalue 0 no maxvalue;
CREATE SEQUENCE dulces_seq increment by 1 minvalue 0 no maxvalue;
CREATE SEQUENCE tipo_maquina_seq increment by 1 minvalue 0 no maxvalue;
CREATE SEQUENCE pago_seq increment by 1 minvalue 0 no maxvalue;


CREATE TABLE cliente(
    cliente_id numeric(15,0) default nextval('cliente_seq') NOT NULL,
    razon_social varchar(50) NOT NULL,
    rfc char(13) not null,
    nombre_representante varchar(50) not null,
    apellido_p_representante varchar(20) not null,
    apellido_m_representante varchar(20) not null,
    tipo_maquina varchar(5) not null,
    tipo_contrato numeric(5,0) not  null,
    constraint uk_cliente_id unique(cliente_id),
    constraint pk_cliente
    PRIMARY KEY(cliente_id)
);

CREATE TABLE contrato_1(
    contrato_id numeric(15,0) default nextval('contrato_seq')  NOT NULL,
    tipo_contrato char(1) check(tipo_contrato in ('a','b')) not null,
    fecha_firma date null,
    compra_venta text not null, 
     inicio_dist date null,
    don_dist date  null,
    recurrencia_surtido numeric(5,0) null,
    constraint uk_contrato_id unique(contrato_id),
    constraint pk_contrato
    PRIMARY KEY(contrato_id)
);


CREATE TABLE tipo_dulces(
    dulce_id numeric(10,0) default nextval('dulces_seq')  not null,
    tipo_dulce varchar(20) not null,
    marca varchar(20) not null,
    monto_adquisicion float not null,
    monto_venta float not null,
    constraint uk_dulce_id unique(dulce_id),
    constraint tipo_dulces_pk
    primary kEY(dulce_id)
);

CREATE TABLE  tipo_maquina(
    tipo_maquina_id numeric(15,0) default nextval('tipo_maquina_seq') not null,
    tipo char(1) check(tipo in ('A','B','C')) not null,
    carcasa text not null,
    s_o varchar(50) not null,
    seguridad text,
    capacidad numeric(10,0) not null,
    dim_alto numeric(5,0) not null,
    dim_largo numeric(5,0) not null,
    dim_ancho numeric(5,0) not null,
     constraint uk_tipo_maquina_id unique(tipo_maquina_id),
    constraint tipo_maquina_pk
    primary kEY(tipo_maquina_id)
);

CREATE TABLE maquina(
    maquina_id numeric(15,0) not null,
    cliente_id numeric(15,0) not null,
    tipo char(1) check(tipo in ('A','B','C')) not null,

    constraint fk_cliente_id
    FOREIGN KEY(cliente_id)
    REFERENCES cliente(cliente_id)
    on delete cascade,

    constraint fk_maquina_id
    FOREIGN KEY(maquina_id)
    REFERENCES tipo_maquina(tipo_maquina_id)
    on delete cascade,

    constraint uk_maquina_id unique(maquina_id),
    constraint maquina_pk
    primary kEY(maquina_id)
);

CREATE TABLE contratos(
    contrato_id numeric(15,0) not null,
    cliente_id numeric(15,0) not null,
    tipo_contrato_id char(1) check(tipo_contrato_id in ('A', 'B')) not null,
    
    constraint fk_contrato_id
    FOREIGN KEY(contrato_id)
    REFERENCES contrato_1(contrato_id)
    on delete cascade,

    constraint fk_cliente_id
    FOREIGN KEY(cliente_id)
    REFERENCES cliente(cliente_id)
    on delete cascade,

    constraint uk_contrato_id unique(contrato_id),
    constraint uk_cliente_id unique(cliente_id),

    constraint contratos_pk
    primary kEY(contrato_id, cliente_id)
);

CREATE TABLE contrato_dulces(
    dulce_id numeric(10,0) not null,
    contrato_id numeric(15,0) not null,
    cantidad_dulces numeric(10,0) not null,
    constraint fk_contrato_id
    FOREIGN KEY(contrato_id)
    REFERENCES contrato_1(contrato_id)
    on delete cascade,

    constraint fk_dulce_id
    FOREIGN KEY(dulce_id)
    REFERENCES tipo_dulces(dulce_id)
    on delete cascade
);

CREATE TABLE pago(
    pago_id numeric(10,0) default nextval('pago_seq') not null,
    clabe numeric(10,0) not null,
    banco varchar(20) not  null,
    administrador varchar(50) not  null,
    cliente_id numeric(15,0) not null,
    constraint fk_cliente_id
    FOREIGN kEY(cliente_id)
    REFERENCES cliente(cliente_id)
    on delete cascade,
    
    constraint pago_uq unique(pago_id),
    constraint pago_pk
    primary  kEY(pago_id)
);
