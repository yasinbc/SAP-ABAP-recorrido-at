
*& Report ZEJERCICIO7_YBC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEJERCICIO7_YBC.


DATA: clientes TYPE TABLE OF  ZTYBC_CLIENTES,
      cliente LIKE LINE OF clientes,
      total like ztybc_clientes-saldo,
      total_sucursal like ztybc_clientes-sucursal.

SELECT * FROM ztybc_clientes INTO TABLE clientes.

LOOP AT clientes INTO cliente.
  WRITE: 'Sucursal: ', cliente-sucursal.
  WRITE:/ '  Cliente: ', cliente-nombre_cliente.
*  write:/ '  Cuenta: ', cliente-cuenta.
  WRITE:/ '  Saldo: ', cliente-saldo, cliente-moneda.
*  write: '  Divisa: ', cliente-moneda.
  ""write: '  Clave: ', cliente-clavecliente.
  select sum( saldo ) from ztybc_clientes into @total_sucursal.
  write:/ 'Saldo sucursal ',cliente-sucursal.
  write total_sucursal.
  write:/ SY-ULINE.
ENDLOOP.

"hacemos la suma de los campos 'saldo' desde el campo @clientes y la introducimos en la variable TOTAL con @total
select sum( saldo ) from ztybc_clientes into @total.

"imprimimos en pantalla el resultado de la suma almacenada en @total
write:/ 'Total sucursal: ', total, ' EUR'.