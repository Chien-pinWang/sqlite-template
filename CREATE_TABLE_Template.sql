
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
    -- @table       [table_name]    Description of the table
    [tbl]_id        INTEGER PRIMARY KEY,
    -- @column      [tbl]_id        Primary key auto-increment
    status          VARCHAR(1) NOT NULL DEFAULT 'A',
    -- @column      status          'A' for Active, 'I' for Inactive'
    created         INTEGER NOT NULL DEFAULT (datetime('now', 'localtime')),
    -- @column      created         Record created timestamp
    lastmod         INTEGER NOT NULL DEFAULT (datetime('now', 'localtime')),
    -- @column      lastmod         Record last modified timestamp
    [fk]_id         INTEGER REFERENCES [foreign_table]([pk]_id),
    -- @column      [fk]_id         Foreign key if present
    [column_name]   [data_type],
    [column_name]   [data_type]
);
CREATE TRIGGER update_[table_name]_lastmod 
    -- @trigger     [table_name]    Update column lastmod when record modified
    AFTER UPDATE ON [table_name] 
    FOR EACH ROW 
    BEGIN
        UPDATE [table_name] SET lastmod=datetime('now', 'localtime');
    END;

