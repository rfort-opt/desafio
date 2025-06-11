create or replace FUNCTION F_PIPE_LOC
    RETURN T_TABLE_LOC
    PIPELINED
    PARALLEL_ENABLE
    AUTHID current_user
    IS
        CURSOR v_cur
          IS
            SELECT LOC
            FROM LOC;
    BEGIN
        FOR v_rec IN v_cur LOOP
          PIPE ROW (T_LOC(v_rec.LOC)) ;
        END LOOP;
END F_PIPE_LOC;
/ 