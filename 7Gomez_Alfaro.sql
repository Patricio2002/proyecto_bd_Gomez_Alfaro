/*El nombre de las empresas, el representante y los tipos de dulces que hayan comprado una máquina tipo C*/
SELECT razon_social,  nombre_representante, tipo_dulce, marca from cliente JOIN contratos ON cliente.cliente_id = contratos.cliente_id JOIN contrato_dulces ON contratos.contrato_id = contrato_dulces.contrato_id JOIN tipo_dulces ON contrato_dulces.dulce_id=tipo_dulces.dulce_id WHERE tipo_maquina = 'tipoA' AND tipo_contrato_id = 'B';
/*La cantidad de contratos  1-B que tengan máquinas tipo A*/
SELECT count(*) from cliente JOIN contratos ON cliente.cliente_id = contratos.cliente_id WHERE tipo_maquina = 'tipoA' AND tipo_contrato_id = 'B';
/*l nombre de la empresas cuyos contrato de tipo 1-B sumen una cantidad mayor  a $5000 por concepto de dulces*/
SELECT razon_social from cliente JOIN contratos ON cliente.cliente_id = contratos.cliente_id JOIN contrato_dulces ON contratos.contrato_id = contrato_dulces.contrato_id JOIN tipo_dulces ON contrato_dulces.dulce_id=tipo_dulces.dulce_id WHERE (cantidad_dulces*(monto_venta-monto_adquisicion))>5000;
/*La cantidad de maquinas tipo C y B que se hayan contratado*/
select count(*) from cliente WHERE tipo_maquina = 'tipoB' or tipo_maquina = 'tipoC';