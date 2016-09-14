
-- This template modifies a SQLite table definition by re-creating the table
-- structure. Columns are given appropriate default values as follows:
--     [tbl]_id: SQLite assigns a row_id automatically
--     ifActive: 0 means row has been deleted
--     created: Default to current local time.
--     lastmod: Default to current local time.
-- Trigger to update lastmod is also created to keep minimum maintenance.
--
-- Notice: All data in the table will be gone!
-- 
-- Version: 1.0
-- Author: Chien-pin Wang
-- Created: Sep. 13, 2016
-- Last Modified: Sep. 13, 2016
--

DROP TABLE IF EXISTS [table_name];
CREATE TABLE [table_name] (
    [tbl]_id        INTEGER PRIMARY KEY,
    ifActive        INTEGER NOT NULL DEFAULT 1,
    created         INTEGER NOT NULL DEFAULT (datetime('now', 'localtime')),
    lastmod         INTEGER NOT NULL DEFAULT (datetime('now', 'localtime')),
    [fk]_id         INTEGER REFERENCES [foreign_table]([pk]_id),
    [column_name]   [data_type],
    [column_name]   [data_type]
);
CREATE TRIGGER update_[table_name]_lastmod 
    AFTER UPDATE ON [table_name] 
    FOR EACH ROW 
    BEGIN
        UPDATE [table_name] SET lastmod=datetime('now', 'localtime');
    END;

