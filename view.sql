  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_ITEM_LOC_SOH" ("ITEM", "LOC", "DEPT", "UNIT_COST", "STOCK_ON_HAND") AS 
  SELECT SOH."ITEM",SOH."LOC",SOH."DEPT",SOH."UNIT_COST",SOH."STOCK_ON_HAND"
FROM item_loc_soh SOH,
    USER_ACESS UA
WHERE SOH.DEPT = UA.DEPT
  AND UA.USER_ID = USER; 