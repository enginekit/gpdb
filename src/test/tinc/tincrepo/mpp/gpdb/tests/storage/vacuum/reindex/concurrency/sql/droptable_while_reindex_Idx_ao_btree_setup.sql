-- start_ignore
SET gp_create_table_random_default_distribution=off;
-- end_ignore
DROP TABLE IF EXISTS reindex_drop_ao_btree;

CREATE TABLE reindex_drop_ao_btree (a INT) WITH (appendonly=true);
insert into reindex_drop_ao_btree select generate_series(1,1000);
insert into reindex_drop_ao_btree select generate_series(1,1000);
create index idx_reindex_drop_ao_btree on reindex_drop_ao_btree(a);
SELECT 1 AS relfilenode_same_on_all_segs from gp_dist_random('pg_class')   WHERE relname = 'idx_reindex_drop_ao_btree' GROUP BY relfilenode having count(*) = (SELECT count(*) FROM     gp_segment_configuration WHERE role='p' AND content > -1);

