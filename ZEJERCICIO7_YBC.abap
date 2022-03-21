
*& Report ZEJERCICIO7_YBC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEJERCICIO7_YBC.


DATA: tl_clientes TYPE TABLE OF  ZTYBC_CLIENTES,
      wa_cliente LIKE LINE OF tl_clientes,
      wl_total like ztybc_clientes-saldo.
*      total_sucursal like ztybc_clientes-sucursal.

SELECT * FROM ztybc_clientes INTO TABLE tl_clientes.

LOOP AT tl_clientes INTO wa_cliente.
  WRITE: 'Sucursal: ', wa_cliente-sucursal.
  WRITE:/ '  Cliente: ', wa_cliente-nombre_cliente.
*  write:/ '  Cuenta: ', cliente-cuenta.
  WRITE:/ '  Saldo: ', wa_cliente-saldo, wa_cliente-moneda.
*  write: '  Divisa: ', cliente-moneda.
  ""write: '  Clave: ', cliente-clavecliente.
*  select sum( saldo ) from ztybc_clientes into @total_sucursal.
*  write:/ 'Saldo sucursal ',cliente-sucursal.
*  write total_sucursal.
  write:/ SY-ULINE.
  wl_total = wl_total + wa_cliente-saldo.
ENDLOOP.



"hacemos la suma de los campos 'saldo' desde el campo @clientes y la introducimos en la variable TOTAL con @total
*select sum( saldo ) from ztybc_clientes into @total.

"imprimimos en pantalla el resultado de la suma almacenada en @total
write:/ 'Total sucursal: ', wl_total, ' EUR'.