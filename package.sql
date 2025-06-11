create or replace PACKAGE SOH_MAN AS 
   PROCEDURE SOH_STR_CP(C_loc item_loc_soh.loc%TYPE); 
END SOH_MAN;
/
create or replace PACKAGE BODY SOH_MAN AS  
   
   PROCEDURE SOH_STR_CP(C_loc item_loc_soh.loc%TYPE) IS 
    BEGIN
		BEGIN
		IF c_loc = -1 THEN
			EXECUTE IMMEDIATE 'DROP TABLE ' || 'COPY_item_loc_soh_FULL';
		ELSE 
			EXECUTE IMMEDIATE 'DROP TABLE ' || 'COPY_item_loc_soh_' || C_loc ;
		END IF;
        EXCEPTION
			WHEN OTHERS THEN
                IF SQLCODE != -942 THEN
                     RAISE;
                END IF;
		END;

    IF c_loc = -1 THEN
		EXECUTE IMMEDIATE 'CREATE TABLE ' || 'COPY_item_loc_soh_FULL AS (SELECT * FROM item_loc_soh  )';
		
	ELSE
		EXECUTE IMMEDIATE 'CREATE TABLE ' || 'COPY_item_loc_soh_' || C_loc || ' AS (SELECT * FROM item_loc_soh WHERE LOC = ' || C_loc ||' )';
	END IF;
   END SOH_STR_CP; 
END SOH_MAN;
/ 