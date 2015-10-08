class YCL_IM_S_WBS_SETTLMNT_RULE definition
  public
  final
  create public .

public section.

  interfaces IF_EX_WBS_SETTLEMENT_RULE .
protected section.
private section.
ENDCLASS.



CLASS YCL_IM_S_WBS_SETTLMNT_RULE IMPLEMENTATION.


  method IF_EX_WBS_SETTLEMENT_RULE~ADD_ADDITIONAL_PARTNERS.
  endmethod.


METHOD if_ex_wbs_settlement_rule~determine_strategy.
************************************************************************
* note 1659573
* Version 1.001 20111201 1.606
*
* Corrections / Additions:
*         000: User / Date
*              Description
************************************************************************

* Projects within the Best Practices Baseline can
* contain a mix of work-packages which are billed either on a
* fixed-price or resource-related basis.
*
* A different RA-key is required for WBS-elements that are billed
* at a fixed price from those that are to be billed based on
* actual time&materials.
*
* The RA-key is set by the settlement strategy when the transaction
* CJB2 is run. Regrettably, the program ALWAYS overwrites the RA-keys already
* set in the standard WBS elements or entered manually in the project.
* The customizing settings for the settlement strategy key only allow
* one RA-key to be set for all WBS-elements relevant for billing.
*
* This enhancement accomplishes the following:
*
* - it runs only for projects with profiles from BP SERV (YBS*, YSS*), i.e.
*   only for consulting projects from BP Baseline or BP for ServInd.
* - it runs only for WBS elements which are relevant for billing
* - the settlement rule YF is provided for WBS-elements with RA-Key YBSV01,
*   which represent fixed-price work-packages.
* - the settlement rule YR is provided for WBS-elements with RA-Key YBSV02,
*   which represent resource-related work-packages.
* - The settlement rules YF and YR are installed in Best Practices Baseline V1.606 BB214.

  DATA: lv_strat TYPE ps_strat.

* only run if the strategy rules for fixed-price (YF) and
* resource-related billing elements (YR) have been installed.

  SELECT SINGLE strat FROM tsr0e INTO lv_strat
    WHERE strat = 'YF'.

  CHECK sy-subrc = 0.

* only run for project profiles from Baseline or ServInd:
  CHECK i_proj-profl(3) = 'YBS' OR i_proj-profl(3) = 'YSS'.

* only run for billing elements.
  CHECK i_prps-fakkz = 'X'.

  IF i_prps-abgsl = 'YBSV01'.
    e_strat = 'YF'.
    e_strat_by_exit = 'X'.
  ELSEIF i_prps-abgsl = 'YBSV02'.
    e_strat = 'YR'.
    e_strat_by_exit = 'X'.
  ENDIF.

ENDMETHOD.


  method IF_EX_WBS_SETTLEMENT_RULE~FILTER_SD_ORDERS.
  endmethod.
ENDCLASS.