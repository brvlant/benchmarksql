--ALTER SEQUENCE bmsql_hist_id_seq RESTART WITH 30000;

drop function if exists spl_get_seq_id;
CREATE FUNCTION spl_get_seq_id () RETURNING BIGINT
AS
seq_id_next\;
DEFINE seq_id_next BIGINT\;
LET seq_id_next = bmsql_hist_id_seq.NEXTVAL\;
RETURN seq_id_next\;
END FUNCTION;

--#####################################################################
--
--drop procedure if exists bmsql_history_spl_get_seq_id;
--
--CREATE PROCEDURE bmsql_history_spl_get_seq_id()
--REFERENCING NEW AS new_values FOR bmsql_history;
--    LET new_values.hist_id = bmsql_hist_id_seq.NEXTVAL;
--END PROCEDURE;
--
--#####################################################################

drop trigger if exists bmsql_history_on_insert;
CREATE TRIGGER bmsql_history_on_insert INSERT ON bmsql_history REFERENCING NEW
AS
new_ins
FOR
EACH ROW (EXECUTE FUNCTION spl_get_seq_id () INTO hist_id);
--EACH ROW WHEN (new_ins.hist_ID is null) (EXECUTE FUNCTION spl_get_seq_id () INTO hist_id);

--#####################################################################
--
--drop trigger if exists bmsql_history_on_insert_2;
--CREATE TRIGGER bmsql_history_on_insert_2 
--INSERT ON bmsql_history 
--BEFORE(
--EXECUTE PROCEDURE bmsql_history_spl_get_seq_id () WITH TRIGGER REFERENCES
--);
--
--#####################################################################

alter table bmsql_history add constraint primary key (hist_id) constraint bmsql_history_pkey;

