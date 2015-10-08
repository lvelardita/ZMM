class ZIF_BADI_O2C_CUST_DATA definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces IF_BADI_O2C_CUST_DATA .
protected section.
private section.
ENDCLASS.



CLASS ZIF_BADI_O2C_CUST_DATA IMPLEMENTATION.


  method IF_BADI_O2C_CUST_DATA~GET_CUSTOMER_ADDRESS_ADD.
  endmethod.


  method IF_BADI_O2C_CUST_DATA~GET_CUSTOMER_DATA.
  endmethod.


  method IF_BADI_O2C_CUST_DATA~GET_CUSTOMER_HEADER_DATA.
  endmethod.


METHOD IF_BADI_O2C_CUST_DATA~GET_SD_TYPE.


** Initialize sales order type, so that any sales order
*** type can be selected in field "Sales order type"
*** in Sales Order Create UI in NWBC.

clear cv_auart.

ENDMETHOD.


  method IF_BADI_O2C_CUST_DATA~SET_CUSTOMER_FOLLOW_ACTION.
  endmethod.


  method IF_BADI_O2C_CUST_DATA~SET_CUSTOMER_INFO_ACTION.
  endmethod.


  method IF_BADI_O2C_CUST_DATA~SET_OBN_NAVIGATION.
  endmethod.
ENDCLASS.