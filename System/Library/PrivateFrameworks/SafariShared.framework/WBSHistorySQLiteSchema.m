@interface WBSHistorySQLiteSchema
+ (id)legacyHistoryPropertyListURL;
- (BOOL)migrateLegacyDatabaseCreatingRedirectChains:(id)a3 urlsToItemAndLastVisitID:(id)a4 visitsToUseForRedirectChains:(id)a5;
- (NSDictionary)legacyDatabase;
- (WBSHistorySQLiteSchema)init;
- (WBSHistorySQLiteSchema)initWithDatabase:(id)a3 crypto:(id)a4 migrateVisitsAfterDate:(id)a5;
- (id)_migrateLegacyDatabaseCreatingItemsAndVisits:(id)a3 outVisitsToUseForRedirectChains:(id)a4;
- (int)_migrateToSchemaVersion:(int)a3;
- (int)_migrateToSchemaVersion_10;
- (int)_migrateToSchemaVersion_11;
- (int)_migrateToSchemaVersion_12;
- (int)_migrateToSchemaVersion_13;
- (int)_migrateToSchemaVersion_14;
- (int)_migrateToSchemaVersion_15;
- (int)_migrateToSchemaVersion_16;
- (int)_migrateToSchemaVersion_2;
- (int)_migrateToSchemaVersion_3;
- (int)_migrateToSchemaVersion_4;
- (int)_migrateToSchemaVersion_5;
- (int)_migrateToSchemaVersion_6;
- (int)_migrateToSchemaVersion_7;
- (int)_migrateToSchemaVersion_8;
- (int)_migrateToSchemaVersion_9;
- (int)_setDatabaseSchemaVersion:(int)a3;
- (int)migrateToCurrentSchemaVersionIfNeeded;
- (int64_t)_migrateLegacyItem:(id)a3 dailyVisitCounts:(void *)a4 weeklyVisitCounts:(void *)a5;
- (int64_t)_migrateLegacyVisitWithItemID:(int64_t)a3 visitTime:(double)a4 title:(id)a5 score:(unint64_t)a6 loadSuccessful:(BOOL)a7 httpNonGet:(BOOL)a8 synthesized:(BOOL)a9;
- (void)_migrateLegacyDatabase;
- (void)_migrateToSchemaVersion_10;
- (void)_migrateToSchemaVersion_11;
- (void)_migrateToSchemaVersion_12;
- (void)_migrateToSchemaVersion_14;
- (void)_migrateToSchemaVersion_15;
- (void)_migrateToSchemaVersion_16;
- (void)_migrateToSchemaVersion_2;
- (void)_migrateToSchemaVersion_3;
- (void)_migrateToSchemaVersion_4;
- (void)_migrateToSchemaVersion_5;
- (void)_migrateToSchemaVersion_6;
- (void)_migrateToSchemaVersion_7;
- (void)_migrateToSchemaVersion_8;
- (void)_migrateToSchemaVersion_9;
- (void)_removeLegacyHistoryDatabaseIfNeeded;
- (void)migrateToCurrentSchemaVersionIfNeeded;
@end

@implementation WBSHistorySQLiteSchema

- (int)migrateToCurrentSchemaVersionIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"PRAGMA user_version");
  v4 = [v3 nextObject];
  int v5 = [v4 intAtIndex:0];

  v6 = [v3 statement];
  [v6 invalidate];

  if (v5 > 15) {
    goto LABEL_68;
  }
  if (v5)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v22 = v5;
      __int16 v23 = 1024;
      int v24 = 16;
      _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "History database has schema version of %d. Migrating to schema version %d.", buf, 0xEu);
    }
    --v5;
    while (v5 != 15)
    {
      int v8 = [(WBSHistorySQLiteSchema *)self _migrateToSchemaVersion:(v5 + 2)];
      ++v5;
      if (v8 != 101) {
        goto LABEL_68;
      }
    }
    v12 = WBS_LOG_CHANNEL_PREFIXHistory();
    int v5 = 16;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = 16;
      _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_INFO, "History database now has schema version of %d.", buf, 8u);
    }
    goto LABEL_68;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_items (id INTEGER PRIMARY KEY AUTOINCREMENT,url TEXT NOT NULL UNIQUE,domain_expansion TEXT NULL,visit_count INTEGER NOT NULL,daily_visit_counts BLOB NOT NULL,weekly_visit_counts BLOB NULL,autocomplete_triggers BLOB NULL,should_recompute_derived_visit_counts INTEGER NOT NULL,visit_count_score INTEGER NOT NULL,status_code INTEGER NOT NULL DEFAULT 0)") != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded]2();
    }
LABEL_63:

LABEL_67:
    int v5 = 0;
    goto LABEL_68;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_visits (id INTEGER PRIMARY KEY AUTOINCREMENT,history_item INTEGER NOT NULL REFERENCES history_items(id) ON DELETE CASCADE,visit_time REAL NOT NULL,title TEXT NULL,load_successful BOOLEAN NOT NULL DEFAULT 1,http_non_get BOOLEAN NOT NULL DEFAULT 0,synthesized BOOLEAN NOT NULL DEFAULT 0,redirect_source INTEGER NULL UNIQUE REFERENCES history_visits(id) ON DELETE CASCADE,redirect_destination INTEGER NULL UNIQUE REFERENCES history_visits(id) ON DELETE CASCADE,origin INTEGER NOT NULL DEFAULT 0,generation INTEGER NOT NULL DEFAULT 0,attributes INTEGER NOT NULL DEFAULT 0,score INTEGER NOT NULL DEFAULT 0)") != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded]1();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_tombstones (id INTEGER PRIMARY KEY AUTOINCREMENT,start_time REAL NOT NULL,end_time REAL NOT NULL,url TEXT,generation INTEGER NOT NULL DEFAULT 0)") != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded]0();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE metadata (key TEXT NOT NULL UNIQUE, value)") != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.9();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_client_versions (client_version INTEGER PRIMARY KEY,last_seen REAL NOT NULL)") != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.8();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_event_listeners (listener_name TEXT PRIMARY KEY NOT NULL UNIQUE,last_seen REAL NOT NULL)") != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.7();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_events (id INTEGER PRIMARY KEY AUTOINCREMENT,event_type TEXT NOT NULL,event_time REAL NOT NULL,pending_listeners TEXT NOT NULL,value BLOB)") != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.6();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_tags (id INTEGER PRIMARY KEY,type INTEGER NOT NULL,level INTEGER NOT NULL,identifier TEXT NOT NULL,title TEXT NOT NULL,modification_timestamp REAL NOT NULL,item_count INTEGER NOT NULL DEFAULT 0)") != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.5();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_items_to_tags (history_item INTEGER NOT NULL,tag_id INTEGER NOT NULL,timestamp REAL NOT NULL,FOREIGN KEY(tag_id) REFERENCES history_tags(id) ON DELETE CASCADE,FOREIGN KEY(history_item) REFERENCES history_items(id) ON DELETE CASCADE,UNIQUE(history_item, tag_id) ON CONFLICT REPLACE)") != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded].cold.4();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TRIGGER increment_count_on_insert AFTER INSERT ON history_items_to_tags BEGIN  UPDATE history_tags SET item_count = item_count + 1 WHERE id = NEW.tag_id;END;") != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded]();
    }
    goto LABEL_63;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TRIGGER decrement_count_on_delete BEFORE DELETE ON history_items_to_tags BEGIN  UPDATE history_tags SET item_count = item_count - 1 WHERE id = OLD.tag_id;END;") != 101)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded]();
    }
    goto LABEL_63;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [&unk_1EFC221A8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(&unk_1EFC221A8);
        }
        if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, *(void **)(*((void *)&v16 + 1) + 8 * i)) != 101)
        {
          v14 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[WBSHistorySQLiteSchema migrateToCurrentSchemaVersionIfNeeded]();
          }

          goto LABEL_67;
        }
      }
      uint64_t v9 = [&unk_1EFC221A8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  [(WBSHistorySQLiteSchema *)self _setDatabaseSchemaVersion:16];
  [(WBSHistorySQLiteSchema *)self _migrateLegacyDatabase];
  int v5 = 16;
LABEL_68:

  return v5;
}

- (WBSHistorySQLiteSchema)initWithDatabase:(id)a3 crypto:(id)a4 migrateVisitsAfterDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WBSHistorySQLiteSchema;
  v12 = [(WBSHistorySQLiteSchema *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    objc_storeStrong((id *)&v13->_crypto, a4);
    objc_storeStrong((id *)&v13->_migrateVisitsAfterDate, a5);
    v14 = v13;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrateVisitsAfterDate, 0);
  objc_storeStrong((id *)&self->_crypto, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (WBSHistorySQLiteSchema)init
{
  return 0;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  database = self->_database;
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", *(void *)&a3);
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    int v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      *(_DWORD *)buf = 67109634;
      int v12 = a3;
      __int16 v13 = 2114;
      v14 = v10;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_error_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_ERROR, "Failed to set the database schema version to %d: %{public}@ (%d)", buf, 0x18u);
    }
  }
  return v7;
}

- (int)_migrateToSchemaVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_msgSend(NSString, "stringWithFormat:", @"_migrateToSchemaVersion_%d", *(void *)&a3);
  int v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  SEL v6 = NSSelectorFromString(v5);

  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"BEGIN TRANSACTION");
  if (v7 == 101)
  {
    int v8 = [(WBSHistorySQLiteSchema *)self methodSignatureForSelector:v6];
    id v9 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v8];
    [v9 setSelector:v6];
    [v9 invokeWithTarget:self];
    int v14 = 1;
    [v9 getReturnValue:&v14];
    if (v14 == 101
      && (int v14 = [(WBSHistorySQLiteSchema *)self _setDatabaseSchemaVersion:v3], v14 == 101))
    {
      int v10 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"COMMIT TRANSACTION");
      if (v10 != 101)
      {
        id v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[WBSHistorySQLiteSchema _migrateToSchemaVersion:]();
        }

        goto LABEL_15;
      }
    }
    else if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ROLLBACK TRANSACTION") != 101)
    {
      int v12 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[WBSHistorySQLiteSchema _migrateToSchemaVersion:]();
      }
    }
    int v10 = v14;
LABEL_15:

    goto LABEL_16;
  }
  int v10 = v7;
  int v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
    objc_claimAutoreleasedReturnValue();
    -[WBSHistorySQLiteSchema _migrateToSchemaVersion:]();
  }
LABEL_16:

  return v10;
}

- (int)_migrateToSchemaVersion_2
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE history_visits ADD COLUMN origin INTEGER NOT NULL DEFAULT 0");
  if (v3 != 101)
  {
    int v4 = v3;
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_2]();
    }
    goto LABEL_7;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE INDEX history_visits__origin ON history_visits (origin)");
  if (v4 != 101)
  {
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_2]();
    }
LABEL_7:
  }
  return v4;
}

- (int)_migrateToSchemaVersion_3
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP INDEX history_visits__origin");
  if (v3 != 101)
  {
    int v5 = v3;
    SEL v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_3]();
    }
    goto LABEL_10;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE history_visits ADD COLUMN generation INTEGER NOT NULL DEFAULT 0");
  if (v4 != 101)
  {
    int v5 = v4;
    SEL v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_3]();
    }
    goto LABEL_10;
  }
  int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE INDEX history_visits__origin ON history_visits (origin, generation)");
  if (v5 != 101)
  {
    SEL v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_3]();
    }
LABEL_10:
  }
  return v5;
}

- (int)_migrateToSchemaVersion_4
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_tombstones (id INTEGER PRIMARY KEY AUTOINCREMENT,start_time REAL NOT NULL,end_time REAL NOT NULL,url TEXT,generation INTEGER NOT NULL DEFAULT 0)");
  if (v3 != 101)
  {
    int v4 = v3;
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_4]();
    }
    goto LABEL_7;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE INDEX history_tombstones__generation ON history_tombstones (generation)");
  if (v4 != 101)
  {
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_4]();
    }
LABEL_7:
  }
  return v4;
}

- (int)_migrateToSchemaVersion_5
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE history_items ADD COLUMN should_recompute_derived_visit_counts INTEGER NOT NULL DEFAULT 0");
  if (v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_5]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion_6
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP INDEX history_tombstones__end_time");
  if (v3 != 1 && v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_6]();
    }
  }
  int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE INDEX history_tombstones__end_time ON history_tombstones (end_time)");
  if (v5 != 101)
  {
    SEL v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_6]();
    }
  }
  return v5;
}

- (int)_migrateToSchemaVersion_7
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP INDEX history_visits__last_visit");
  if (v3 != 1 && v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_7]();
    }
  }
  int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE INDEX history_visits__last_visit ON history_visits (history_item, visit_time DESC, synthesized ASC)");
  if (v5 != 101)
  {
    SEL v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_7]();
    }
  }
  return v5;
}

- (int)_migrateToSchemaVersion_8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_client_versions (client_version INTEGER PRIMARY KEY,last_seen REAL NOT NULL)");
  if (v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_8]();
    }
  }
  int v22 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"SELECT id, url FROM history_tombstones WHERE url IS NOT NULL");
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v22;
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v9 = [v8 int64AtIndex:0];
        int v10 = [v8 stringAtIndex:1];
        crypto = self->_crypto;
        v36 = @"url";
        v37 = v10;
        int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        __int16 v13 = [(WBSHistoryCrypto *)crypto encryptDictionary:v12];
        int v14 = [NSNumber numberWithLongLong:v9];
        [v24 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v5);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v24;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        id v26 = [v15 objectForKeyedSubscript:v19];
        database = self->_database;
        uint64_t v25 = [v19 integerValue];
        int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSData * {__strong}&,long>(database, 0, @"UPDATE history_tombstones SET url = ? WHERE id = ?", &v26, &v25);
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v16);
  }

  return v3;
}

- (int)_migrateToSchemaVersion_9
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE history_items ADD COLUMN visit_count_score INTEGER NOT NULL DEFAULT 0");
  if (v3 == 101)
  {
    int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE history_visits ADD COLUMN attributes INTEGER NOT NULL DEFAULT 0");
    if (v4 == 101)
    {
      database = self->_database;
      LODWORD(v5) = 1.0;
      int v7 = objc_msgSend(NSString, "stringWithFormat:", @"ALTER TABLE history_visits ADD COLUMN score INTEGER NOT NULL DEFAULT %lu", +[WBSHistoryVisit scoreForWeightedVisitCount:](WBSHistoryVisit, "scoreForWeightedVisitCount:", v5));
      int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v7);

      if (v8 == 101)
      {
        int function_v2 = sqlite3_create_function_v2((sqlite3 *)[(WBSSQLiteDatabase *)self->_database handle], "safari_visitcountscore", 1, 2053, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sqliteVisitCountScore, 0, 0, 0);
        if (function_v2)
        {
          int v8 = function_v2;
          int v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[WBSHistorySQLiteSchema _migrateToSchemaVersion_9]();
          }
        }
        else
        {
          int v12 = sqlite3_create_function_v2((sqlite3 *)[(WBSSQLiteDatabase *)self->_database handle], "safari_visitblobscore", 1, 2053, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sqliteVisitBlobScore, 0, 0, 0);
          if (!v12)
          {
            int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"UPDATE history_items SET visit_count_score = safari_visitcountscore(visit_count), daily_visit_counts = safari_visitblobscore(daily_visit_counts), weekly_visit_counts = safari_visitblobscore(weekly_visit_counts)");
            sqlite3_create_function_v2((sqlite3 *)[(WBSSQLiteDatabase *)self->_database handle], "safari_visitcountscore", 0, 5, 0, 0, 0, 0, 0);
            sqlite3_create_function_v2((sqlite3 *)[(WBSSQLiteDatabase *)self->_database handle], "safari_visitblobscore", 0, 5, 0, 0, 0, 0, 0);
            return v8;
          }
          int v8 = v12;
          int v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[WBSHistorySQLiteSchema _migrateToSchemaVersion_9]();
          }
        }
      }
      else
      {
        int v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[WBSHistorySQLiteSchema _migrateToSchemaVersion_9]();
        }
      }
    }
    else
    {
      int v8 = v4;
      int v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[WBSHistorySQLiteSchema _migrateToSchemaVersion_9].cold.4();
      }
    }
  }
  else
  {
    int v8 = v3;
    int v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_9].cold.5();
    }
  }

  return v8;
}

- (int)_migrateToSchemaVersion_10
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE history_visits ADD COLUMN core_spotlight_id TEXT NULL");
  if (v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_10]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion_11
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_event_listeners (listener_name TEXT PRIMARY KEY,last_seen REAL NOT NULL)");
  if (v3 != 101)
  {
    int v4 = v3;
    double v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_11]();
    }
    goto LABEL_7;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_events (id INTEGER PRIMARY KEY AUTOINCREMENT,event_type TEXT NOT NULL,event_time REAL NOT NULL,pending_listeners TEXT NOT NULL,value BLOB)");
  if (v4 != 101)
  {
    double v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_11]();
    }
LABEL_7:
  }
  return v4;
}

- (int)_migrateToSchemaVersion_12
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"PRAGMA foreign_keys = OFF");
  if (v3 != 101)
  {
    int v8 = v3;
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12].cold.6();
    }
    goto LABEL_23;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE history_visits RENAME TO temp_history_visits") != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12].cold.5();
    }
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_visits (id INTEGER PRIMARY KEY AUTOINCREMENT,history_item INTEGER NOT NULL REFERENCES history_items(id) ON DELETE CASCADE,visit_time REAL NOT NULL,title TEXT NULL,load_successful BOOLEAN NOT NULL DEFAULT 1,http_non_get BOOLEAN NOT NULL DEFAULT 0,synthesized BOOLEAN NOT NULL DEFAULT 0,redirect_source INTEGER NULL UNIQUE REFERENCES history_visits(id) ON DELETE CASCADE,redirect_destination INTEGER NULL UNIQUE REFERENCES history_visits(id) ON DELETE CASCADE,origin INTEGER NOT NULL DEFAULT 0,generation INTEGER NOT NULL DEFAULT 0,attributes INTEGER NOT NULL DEFAULT 0,score INTEGER NOT NULL DEFAULT 0)") != 101)
  {
    double v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12].cold.4();
    }
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"INSERT INTO history_visits (id, history_item, visit_time, title, load_successful, http_non_get, synthesized, redirect_source, redirect_destination, origin, generation, attributes, score) SELECT id, history_item, visit_time, title, load_successful, http_non_get, synthesized, redirect_source, redirect_destination, origin, generation, attributes, score FROM temp_history_visits") != 101)
  {
    uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12]();
    }
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP TABLE temp_history_visits") != 101)
  {
    int v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12]();
    }
  }
  int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"PRAGMA foreign_keys = ON");
  if (v8 != 101)
  {
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_12]();
    }
LABEL_23:
  }
  return v8;
}

- (int)_migrateToSchemaVersion_13
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE INDEX history_visits__last_visit ON history_visits (history_item, visit_time DESC, synthesized ASC)");
  if (v3 == 101) {
    goto LABEL_5;
  }
  int v4 = v3;
  double v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
    objc_claimAutoreleasedReturnValue();
    -[WBSHistorySQLiteSchema _migrateToSchemaVersion_7]();
  }

  if (indexExists(self->_database, &cfstr_HistoryVisitsL.isa))
  {
LABEL_5:
    int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE INDEX history_visits__origin ON history_visits (origin, generation)");
    if (v4 == 101) {
      return 101;
    }
    uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_2]();
    }

    if (indexExists(self->_database, &cfstr_HistoryVisitsO.isa)) {
      return 101;
    }
  }
  return v4;
}

- (int)_migrateToSchemaVersion_14
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_tags (id INTEGER PRIMARY KEY,type INTEGER NOT NULL,level INTEGER NOT NULL,identifier TEXT NOT NULL,title TEXT NOT NULL,modification_timestamp REAL NOT NULL,item_count INTEGER NOT NULL DEFAULT 0)");
  if (v3 == 101)
  {
    int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE history_items_to_tags (history_item INTEGER NOT NULL,tag_id INTEGER NOT NULL,timestamp REAL NOT NULL,FOREIGN KEY(tag_id) REFERENCES history_tags(id) ON DELETE CASCADE,FOREIGN KEY(history_item) REFERENCES history_items(id) ON DELETE CASCADE,UNIQUE(history_item, tag_id) ON CONFLICT REPLACE)");
    if (v4 == 101)
    {
      int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TRIGGER increment_count_on_insert AFTER INSERT ON history_items_to_tags BEGIN  UPDATE history_tags SET item_count = item_count + 1 WHERE id = NEW.tag_id;END;");
      if (v5 == 101)
      {
        int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TRIGGER decrement_count_on_delete BEFORE DELETE ON history_items_to_tags BEGIN  UPDATE history_tags SET item_count = item_count - 1 WHERE id = OLD.tag_id;END;");
        if (v6 != 101)
        {
          int v7 = WBS_LOG_CHANNEL_PREFIXHistory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            -[WBSHistorySQLiteSchema _migrateToSchemaVersion_14]();
          }
        }
      }
      else
      {
        int v6 = v5;
        int v10 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[WBSHistorySQLiteSchema _migrateToSchemaVersion_14]();
        }
      }
    }
    else
    {
      int v6 = v4;
      uint64_t v9 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WBSHistorySQLiteSchema _migrateToSchemaVersion_14]();
      }
    }
  }
  else
  {
    int v6 = v3;
    int v8 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_14].cold.4();
    }
  }
  return v6;
}

- (int)_migrateToSchemaVersion_15
{
  v18[6] = *MEMORY[0x1E4F143B8];
  int v3 = SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(self->_database, @"SELECT value FROM metadata WHERE key = ?", WBSHistorySQLiteStoreSyncsWithManateeContainerKey);
  int v4 = [v3 nextObject];
  uint64_t v5 = [v4 int64AtIndex:0];

  if (v5 < 1) {
    goto LABEL_9;
  }
  int v6 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"SELECT MAX(generation) FROM history_visits");

  int v7 = [v6 nextObject];
  uint64_t v8 = [v7 int64AtIndex:0];

  uint64_t v9 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"SELECT MAX(generation) FROM history_tombstones");

  int v10 = [v9 nextObject];
  uint64_t v11 = [v10 int64AtIndex:0];

  int v3 = SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(self->_database, @"SELECT value FROM metadata WHERE key = ?", WBSHistorySQLiteStoreLastSyncedGenerationKey);

  int v12 = [v3 nextObject];
  uint64_t v13 = [v12 int64AtIndex:0];

  if (v8 <= v11) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = v8;
  }
  if (v14 <= v13) {
    uint64_t v14 = v13;
  }
  v18[0] = v14 + 1;
  int v15 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,NSString * const {__strong}&>(self->_database, 0, @"UPDATE metadata SET value = ? WHERE key = ?", v18, WBSHistorySQLiteStoreCurrentGenerationKey);
  if (v15 != 101)
  {
    uint64_t v16 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_15]();
    }
LABEL_12:

    goto LABEL_13;
  }
  if (![(WBSSQLiteDatabase *)self->_database changedRowCount])
  {
    int v15 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,long long &>(self->_database, 0, @"INSERT INTO metadata (key, value) VALUES (?, ?)", WBSHistorySQLiteStoreCurrentGenerationKey, v18);
    if (v15 == 101) {
      goto LABEL_13;
    }
    uint64_t v16 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_15]();
    }
    goto LABEL_12;
  }
LABEL_9:
  int v15 = 101;
LABEL_13:

  return v15;
}

- (int)_migrateToSchemaVersion_16
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE history_items ADD COLUMN status_code INTEGER NOT NULL DEFAULT 0");
  if (v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateToSchemaVersion_16]();
    }
  }
  return v3;
}

+ (id)legacyHistoryPropertyListURL
{
  {
    int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = objc_msgSend(v4, "safari_settingsDirectoryURL");
    +[WBSHistorySQLiteSchema legacyHistoryPropertyListURL]::historyURL = [v5 URLByAppendingPathComponent:@"History.plist" isDirectory:0];
  }
  v2 = (void *)+[WBSHistorySQLiteSchema legacyHistoryPropertyListURL]::historyURL;
  return v2;
}

- (NSDictionary)legacyDatabase
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  int v3 = [(id)objc_opt_class() legacyHistoryPropertyListURL];
  int v4 = [v2 dictionaryWithContentsOfURL:v3];

  return (NSDictionary *)v4;
}

- (int64_t)_migrateLegacyItem:(id)a3 dailyVisitCounts:(void *)a4 weeklyVisitCounts:(void *)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_msgSend(v8, "safari_stringForKey:", &stru_1EFBE3CF8);
  id v67 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v49 = objc_msgSend(v8, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), @"D");
  uint64_t v9 = objc_msgSend(v8, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), @"W");
  int v10 = objc_msgSend(v8, "safari_numberForKey:", @"visitCount");
  int v11 = [v10 intValue];

  int v66 = v11;
  int v12 = objc_msgSend(v8, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), @"autocomplete");
  id v64 = 0;
  id v65 = 0;
  unint64_t v13 = 0x1E4F1C000;
  id v63 = 0;
  if (!(v49 | v9))
  {
LABEL_47:
    id v65 = [*(id *)(v13 + 2488) data];
    goto LABEL_48;
  }
  *(void *)buf = 0;
  uint64_t v69 = 0;
  v61 = 0;
  uint64_t v62 = 0;
  unint64_t v14 = [(id)v49 count];
  if (v14)
  {
    if (v14 >> 30) {
      goto LABEL_57;
    }
    LODWORD(v69) = v14;
    *(void *)buf = WTF::fastMalloc((WTF *)(4 * v14));
  }
  unint64_t v15 = [(id)v9 count];
  if (!v15) {
    goto LABEL_8;
  }
  if (v15 >> 30)
  {
LABEL_57:
    __break(0xC471u);
    JUMPOUT(0x1A6C6D5ACLL);
  }
  LODWORD(v62) = v15;
  v61 = (WTF *)WTF::fastMalloc((WTF *)(4 * v15));
LABEL_8:
  v48 = self;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v16 = (id)v49;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v57 objects:v71 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        int v56 = 0;
        unsigned int v21 = [v20 intValue];
        if (v21 <= 0x12C) {
          unsigned int v22 = v21;
        }
        else {
          unsigned int v22 = 0;
        }
        int v56 = v22;
        uint64_t v23 = *((unsigned int *)a4 + 3);
        if (v23 == *((_DWORD *)a4 + 2)) {
          *(_DWORD *)(*(void *)a4 + 4 * *((unsigned int *)a4 + 3)) = *(_DWORD *)WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a4, v23 + 1, (unint64_t)&v56);
        }
        else {
          *(_DWORD *)(*(void *)a4 + 4 * v23) = v22;
        }
        ++*((_DWORD *)a4 + 3);
        int v24 = WBSHistoryVisitScoreForWeightedVisitCount((float)v56);
        int v55 = v24;
        if (HIDWORD(v69) == v69)
        {
          uint64_t v25 = (_DWORD *)WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)buf, HIDWORD(v69) + 1, (unint64_t)&v55);
          *(_DWORD *)(*(void *)buf + 4 * HIDWORD(v69)) = *v25;
        }
        else
        {
          *(_DWORD *)(*(void *)buf + 4 * HIDWORD(v69)) = v24;
        }
        ++HIDWORD(v69);
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v57 objects:v71 count:16];
    }
    while (v17);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v26 = (id)v9;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v70 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v52 != v28) {
          objc_enumerationMutation(v26);
        }
        long long v30 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        int v56 = 0;
        unsigned int v31 = [v30 intValue];
        if (v31 <= 0x834) {
          unsigned int v32 = v31;
        }
        else {
          unsigned int v32 = 0;
        }
        int v56 = v32;
        uint64_t v33 = *((unsigned int *)a5 + 3);
        if (v33 == *((_DWORD *)a5 + 2)) {
          *(_DWORD *)(*(void *)a5 + 4 * *((unsigned int *)a5 + 3)) = *(_DWORD *)WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a5, v33 + 1, (unint64_t)&v56);
        }
        else {
          *(_DWORD *)(*(void *)a5 + 4 * v33) = v32;
        }
        ++*((_DWORD *)a5 + 3);
        int v34 = WBSHistoryVisitScoreForWeightedVisitCount((float)v56);
        int v55 = v34;
        if (HIDWORD(v62) == v62)
        {
          v35 = (_DWORD *)WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v61, HIDWORD(v62) + 1, (unint64_t)&v55);
          *((_DWORD *)v61 + HIDWORD(v62)) = *v35;
        }
        else
        {
          *((_DWORD *)v61 + HIDWORD(v62)) = v34;
        }
        ++HIDWORD(v62);
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v70 count:16];
    }
    while (v27);
  }

  WBSHistoryCollapseDailyVisitsToWeekly((unsigned int *)buf, &v61);
  self = v48;
  unint64_t v13 = 0x1E4F1C000uLL;
  v37 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)buf length:4 * HIDWORD(v69)];
  id v65 = v37;
  if (*((_DWORD *)a5 + 3))
  {
    id v64 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v61 length:4 * HIDWORD(v62)];
  }
  v38 = v61;
  if (v61)
  {
    v61 = 0;
    LODWORD(v62) = 0;
    WTF::fastFree(v38, v36);
  }
  uint64_t v39 = *(WTF **)buf;
  if (*(void *)buf)
  {
    *(void *)buf = 0;
    LODWORD(v69) = 0;
    WTF::fastFree(v39, v36);
  }
  if (!v37) {
    goto LABEL_47;
  }
LABEL_48:
  if ([v12 count])
  {
    id v63 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v12 format:100 options:0 error:0];
  }
  database = self->_database;
  id v50 = 0;
  *(_DWORD *)buf = WBSHistoryVisitScoreForWeightedVisitCount((float)v11);
  int v41 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,int &,int,NSData * {__strong}&,NSData * {__strong}&,NSData * {__strong}&>(database, &v50, @"INSERT INTO history_items (url, visit_count, visit_count_score, daily_visit_counts, weekly_visit_counts, autocomplete_triggers, domain_expansion, should_recompute_derived_visit_counts) VALUES (?,?,?,?,?,?,safari_domainexpansion(?1),0)", &v67, (unsigned int *)&v66, (unsigned int *)buf, &v65, &v64, &v63);
  id v42 = v50;
  if (v41 && v41 != 101)
  {
    v44 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      uint64_t v45 = (uint64_t)v67;
      v46 = objc_msgSend(v42, "safari_privacyPreservingDescription");
      -[WBSHistorySQLiteSchema _migrateLegacyItem:dailyVisitCounts:weeklyVisitCounts:](v45, v46, buf, v44);
    }

    int64_t v43 = 0;
  }
  else
  {
    int64_t v43 = [(WBSSQLiteDatabase *)self->_database lastInsertRowID];
  }

  return v43;
}

- (int64_t)_migrateLegacyVisitWithItemID:(int64_t)a3 visitTime:(double)a4 title:(id)a5 score:(unint64_t)a6 loadSuccessful:(BOOL)a7 httpNonGet:(BOOL)a8 synthesized:(BOOL)a9
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v26[0] = a3;
  double v25 = a4;
  unint64_t v23 = a6;
  id v24 = a5;
  BOOL v22 = a7;
  BOOL v21 = a8;
  BOOL v20 = a9;
  database = self->_database;
  id v19 = 0;
  int v14 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,double &,NSString * {__strong}&,unsigned long &,BOOL &,BOOL &,BOOL &>(database, &v19, @"INSERT INTO history_visits (history_item, visit_time, title, score, load_successful, http_non_get, synthesized) VALUES (?,?,?,?,?,?,?)", v26, &v25, &v24, &v23, (unsigned __int8 *)&v22, (unsigned __int8 *)&v21, (unsigned __int8 *)&v20);
  id v15 = v19;
  if (v14 && v14 != 101)
  {
    uint64_t v17 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistorySQLiteSchema _migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:]();
    }

    int64_t v16 = 0;
  }
  else
  {
    int64_t v16 = [(WBSSQLiteDatabase *)self->_database lastInsertRowID];
  }

  return v16;
}

- (id)_migrateLegacyDatabaseCreatingItemsAndVisits:(id)a3 outVisitsToUseForRedirectChains:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v48 = a4;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  int v7 = WBSHistoryVisitScoreForWeightedVisitCount(1.0);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (v8)
  {
    uint64_t v9 = v7;
    uint64_t v51 = *(void *)v65;
    do
    {
      uint64_t v52 = v8;
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v65 != v51) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        uint64_t v62 = 0;
        uint64_t v63 = 0;
        long long v60 = 0;
        uint64_t v61 = 0;
        int64_t v13 = [(WBSHistorySQLiteSchema *)self _migrateLegacyItem:v11 dailyVisitCounts:&v62 weeklyVisitCounts:&v60];
        if (v13)
        {
          int v14 = objc_msgSend(v11, "safari_stringForKey:", @"lastVisitedDate");
          [v14 doubleValue];
          double v16 = v15;

          uint64_t v17 = objc_msgSend(v11, "safari_stringForKey:", @"title");
          uint64_t v18 = objc_msgSend(v11, "safari_numberForKey:", @"lastVisitWasFailure");
          int v19 = [v18 intValue];
          BOOL v20 = objc_msgSend(v11, "safari_numberForKey:", @"lastVisitWasHTTPNonGet");
          int64_t v21 = -[WBSHistorySQLiteSchema _migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:](self, "_migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:", v13, v17, v9, v19 == 0, [v20 intValue] != 0, 0, v16);

          if (v21)
          {
            long long v53 = objc_msgSend(v11, "safari_stringForKey:", &stru_1EFBE3CF8);
            BOOL v22 = objc_msgSend(v11, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), @"redirectURLs");
            WBSHistoryTimesOfVisitsToSynthesizeFromDailyCounts((unsigned int *)&v62, (uint64_t)&v60, (uint64_t)&v57, v16);
            unint64_t v23 = v59 + 1;
            if (v23 < [v22 count])
            {
              WBSHistoryTimesForSynthesizedVisitsPreceedingDailyAndWeeklyRange(v16, [v22 count] - v23, (uint64_t)&v54);
              uint64_t v25 = v56;
              unint64_t v26 = v56 + (unint64_t)v59;
              if (v26 > v58)
              {
                unint64_t v27 = v58 + ((unint64_t)v58 >> 2);
                if (v27 >= 0x10) {
                  unint64_t v28 = v27 + 1;
                }
                else {
                  unint64_t v28 = 16;
                }
                if (v28 <= v26) {
                  unint64_t v29 = v56 + (unint64_t)v59;
                }
                else {
                  unint64_t v29 = v28;
                }
                WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&v57, v29);
                uint64_t v25 = v56;
              }
              long long v30 = v54;
              if (v25)
              {
                unsigned int v31 = v57;
                unsigned int v32 = v59;
                uint64_t v33 = 8 * v25;
                int v34 = v54;
                do
                {
                  uint64_t v35 = *(void *)v34;
                  int v34 = (WTF *)((char *)v34 + 8);
                  *((void *)v31 + v32++) = v35;
                  v33 -= 8;
                }
                while (v33);
                unsigned int v59 = v32;
              }
              if (v30)
              {
                long long v54 = 0;
                int v55 = 0;
                WTF::fastFree(v30, v24);
              }
            }
            if (v59)
            {
              v36 = v57;
              uint64_t v37 = 8 * v59;
              do
              {
                [(WBSHistorySQLiteSchema *)self _migrateLegacyVisitWithItemID:v13 visitTime:0 title:v9 score:1 loadSuccessful:0 httpNonGet:1 synthesized:*(double *)v36];
                v36 = (WTF *)((char *)v36 + 8);
                v37 -= 8;
              }
              while (v37);
            }
            id v38 = objc_alloc(MEMORY[0x1E4F97EE0]);
            uint64_t v39 = [NSNumber numberWithLongLong:v13];
            v40 = [NSNumber numberWithLongLong:v21];
            int v41 = (void *)[v38 initWithFirst:v39 second:v40];
            [v49 setObject:v41 forKeyedSubscript:v53];

            if (!v17)
            {
              int64_t v43 = [NSNumber numberWithLongLong:v21];
              [v48 addObject:v43];

              uint64_t v17 = 0;
            }
            v44 = v57;
            if (v57)
            {
              long long v57 = 0;
              unsigned int v58 = 0;
              WTF::fastFree(v44, v42);
            }
          }
        }
        uint64_t v45 = v60;
        if (v60)
        {
          long long v60 = 0;
          LODWORD(v61) = 0;
          WTF::fastFree(v45, v12);
        }
        v46 = v62;
        if (v62)
        {
          uint64_t v62 = 0;
          LODWORD(v63) = 0;
          WTF::fastFree(v46, v12);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
    }
    while (v8);
  }

  return v49;
}

- (BOOL)migrateLegacyDatabaseCreatingRedirectChains:(id)a3 urlsToItemAndLastVisitID:(id)a4 visitsToUseForRedirectChains:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v56 = a4;
  id v55 = a5;
  uint64_t v74 = (int)WBSHistoryVisitScoreForWeightedVisitCount(1.0);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v8;
  uint64_t v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v79, 16, v8);
  if (v52)
  {
    uint64_t v51 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v71 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        int v10 = objc_msgSend(v9, "safari_stringForKey:", @"lastVisitedDate");
        [v10 doubleValue];
        double v12 = v11;

        int64_t v13 = objc_msgSend(v9, "safari_stringForKey:", &stru_1EFBE3CF8);
        long long v53 = objc_msgSend(v9, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), @"redirectURLs");
        sqlite3_int64 v69 = 0;
        int v14 = [v56 objectForKeyedSubscript:v13];
        double v15 = [v14 first];
        uint64_t v16 = [v15 longValue];

        sqlite3_int64 v69 = v16;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v57 = v53;
        uint64_t v17 = [v57 countByEnumeratingWithState:&v65 objects:v78 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v66;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v66 != v18) {
                objc_enumerationMutation(v57);
              }
              BOOL v20 = *(void **)(*((void *)&v65 + 1) + 8 * j);
              if (([v20 isEqualToString:v13] & 1) == 0)
              {
                int64_t v21 = [v56 objectForKeyedSubscript:v20];
                BOOL v22 = v21;
                if (v21)
                {
                  uint64_t v64 = 0;
                  unint64_t v23 = [v21 first];
                  uint64_t v24 = [v23 longValue];

                  int64_t v63 = 0;
                  uint64_t v64 = v24;
                  uint64_t v25 = [v22 second];
                  uint64_t v26 = [v25 longValue];

                  int64_t v63 = v26;
                  unint64_t v27 = [NSNumber numberWithLongLong:v26];
                  LOBYTE(v26) = [v55 containsObject:v27];

                  if (v26)
                  {
                    unint64_t v28 = [NSNumber numberWithLongLong:v63];
                    [v55 removeObject:v28];

                    unint64_t v29 = 0;
                    goto LABEL_15;
                  }
                  int64_t v63 = [(WBSHistorySQLiteSchema *)self _migrateLegacyVisitWithItemID:v64 visitTime:0 title:v74 score:1 loadSuccessful:0 httpNonGet:1 synthesized:v12];
                  if (v63)
                  {
                    uint64_t v40 = [(WBSSQLiteDatabase *)self->_database lastInsertRowID];
                    id v62 = 0;
                    int64_t v63 = v40;
                    int v41 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<unsigned long const&,long long &>(self->_database, &v62, @"UPDATE history_items SET visit_count = visit_count + 1, visit_count_score = visit_count_score + ? WHERE id = ?", &v74, &v64);
                    unint64_t v29 = v62;
                    if (v41 && v41 != 101)
                    {
                      id v42 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                      {
                        v47 = [v29 safari_privacyPreservingDescription];
                        *(_DWORD *)buf = 138478083;
                        *(void *)&uint8_t buf[4] = v20;
                        __int16 v76 = 2114;
                        v77 = v47;
                        _os_log_error_impl(&dword_1A6B5F000, v42, OS_LOG_TYPE_ERROR, "Failed to update score of %{private}@: %{public}@", buf, 0x16u);
                      }
                      goto LABEL_45;
                    }
LABEL_15:
                    long long v60 = v29;
                    int64_t v61 = 0;
                    database = self->_database;
                    *(void *)buf = &v61;
                    char v31 = SafariShared::WBSSQLiteDatabaseEnumerate<long long &,std::tuple<long long &>>(database, (uint64_t)&v60, @"SELECT id FROM history_visits WHERE id = ? AND redirect_source IS NULL ORDER BY visit_time DESC LIMIT 1", &v69, (sqlite3_int64 **)buf);
                    unsigned int v32 = v60;

                    if (v31)
                    {
LABEL_16:
                      uint64_t v33 = self->_database;
                      unsigned int v59 = v32;
                      int v34 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,long long &>(v33, &v59, @"UPDATE history_visits SET redirect_source = ? WHERE id = ?", &v63, &v61);
                      uint64_t v35 = v59;

                      unsigned int v32 = v35;
                      if (v34 && v34 != 101)
                      {
                        int64_t v43 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                        {
                          v46 = [v35 safari_privacyPreservingDescription];
                          *(_DWORD *)buf = 138478083;
                          *(void *)&uint8_t buf[4] = v13;
                          __int16 v76 = 2114;
                          v77 = v46;
                          _os_log_error_impl(&dword_1A6B5F000, v43, OS_LOG_TYPE_ERROR, "Failed to set redirect source for %{private}@: %{public}@", buf, 0x16u);
                        }
                      }
                      else
                      {
                        v36 = self->_database;
                        unsigned int v58 = v35;
                        int v37 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,long long &>(v36, &v58, @"UPDATE history_visits SET redirect_destination = ? WHERE id = ?", &v61, &v63);
                        id v38 = v58;

                        if (!v37 || v37 == 101)
                        {
                          unsigned int v32 = v38;
LABEL_44:
                          unint64_t v29 = v32;
                          goto LABEL_45;
                        }
                        int64_t v43 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                        {
                          id v48 = [v38 safari_privacyPreservingDescription];
                          *(_DWORD *)buf = 138478083;
                          *(void *)&uint8_t buf[4] = v13;
                          __int16 v76 = 2114;
                          v77 = v48;
                          _os_log_error_impl(&dword_1A6B5F000, v43, OS_LOG_TYPE_ERROR, "Failed to set redirect source for %{private}@: %{public}@", buf, 0x16u);
                        }
                        unsigned int v32 = v38;
                      }
                    }
                    else if ([v32 safari_isSQLiteError] {
                           && [v32 code] == 101)
                    }
                    {
                      int64_t v61 = [(WBSHistorySQLiteSchema *)self _migrateLegacyVisitWithItemID:v69 visitTime:0 title:v74 score:1 loadSuccessful:0 httpNonGet:1 synthesized:v12];
                      if (v61) {
                        goto LABEL_16;
                      }
                      int64_t v43 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                      {
                        v44 = [v32 safari_privacyPreservingDescription];
                        *(_DWORD *)buf = 138478083;
                        *(void *)&uint8_t buf[4] = v20;
                        __int16 v76 = 2114;
                        v77 = v44;
                        _os_log_error_impl(&dword_1A6B5F000, v43, OS_LOG_TYPE_ERROR, "Failed to update visit count scores for %{private}@: %{public}@", buf, 0x16u);
                      }
                    }
                    else
                    {
                      int64_t v43 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v45 = [v32 safari_privacyPreservingDescription];
                        *(_DWORD *)buf = 138478083;
                        *(void *)&uint8_t buf[4] = v13;
                        __int16 v76 = 2114;
                        v77 = v45;
                        _os_log_error_impl(&dword_1A6B5F000, v43, OS_LOG_TYPE_ERROR, "Failed to set redirect source for %{private}@: %{public}@", buf, 0x16u);
                      }
                    }

                    goto LABEL_44;
                  }
                  unint64_t v29 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(0, "safari_privacyPreservingDescription");
                    objc_claimAutoreleasedReturnValue();
                    -[WBSHistorySQLiteSchema migrateLegacyDatabaseCreatingRedirectChains:urlsToItemAndLastVisitID:visitsToUseForRedirectChains:]();
                  }
LABEL_45:
                }
                else
                {
                  uint64_t v39 = WBS_LOG_CHANNEL_PREFIXHistory();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138477827;
                    *(void *)&uint8_t buf[4] = v20;
                    _os_log_impl(&dword_1A6B5F000, v39, OS_LOG_TYPE_INFO, "Could not find an item for %{private}@", buf, 0xCu);
                  }
                }

                continue;
              }
            }
            uint64_t v17 = [v57 countByEnumeratingWithState:&v65 objects:v78 count:16];
          }
          while (v17);
        }
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
    }
    while (v52);
  }

  SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&>(self->_database, 0, @"INSERT INTO metadata (key,value) VALUES (?,1)", WBSHistorySQLiteStoreImportCompletedKey);
  return 1;
}

- (void)_migrateLegacyDatabase
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Legacy history file didn't contain a valid dates array, therefore not loading", v1, 2u);
}

BOOL __48__WBSHistorySQLiteSchema__migrateLegacyDatabase__block_invoke(uint64_t a1, void *a2)
{
  int v3 = objc_msgSend(a2, "safari_stringForKey:", @"lastVisitedDate");
  [v3 doubleValue];
  double v5 = v4;
  [*(id *)(*(void *)(a1 + 32) + 24) timeIntervalSinceReferenceDate];
  BOOL v7 = v5 >= v6;

  return v7;
}

uint64_t __48__WBSHistorySQLiteSchema__migrateLegacyDatabase__block_invoke_274(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  int v3 = [*(id *)(a1 + 32) _migrateLegacyDatabaseCreatingItemsAndVisits:*(void *)(a1 + 40) outVisitsToUseForRedirectChains:v2];
  if (v3) {
    uint64_t v4 = [*(id *)(a1 + 32) migrateLegacyDatabaseCreatingRedirectChains:*(void *)(a1 + 40) urlsToItemAndLastVisitID:v3 visitsToUseForRedirectChains:v2];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_removeLegacyHistoryDatabaseIfNeeded
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to remove history plist with error %{public}@", buf, 0xCu);
}

- (void)migrateToCurrentSchemaVersionIfNeeded
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to create the history_items table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to commit transaction: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to roll back transaction: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to start a transaction: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_2
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to add origin column to history_visits table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_3
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to drop history_visits__origin index: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_4
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to create the history_visit_tombstones table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_5
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to add should_recompute_derived_visit_counts column to history_items table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_6
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to drop history_tombstones__end_time index: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_7
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to drop history_visits__last_visit index: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_8
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to create the history_client_versions table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_9
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to add visit_count_score column to history_items table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_10
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to add core_spotlight_id column to history_visits table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_11
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to create the history_event_listeners table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_12
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to disable foreign keys: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_14
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_7(&dword_1A6B5F000, v0, v1, "Failed to create history_tags table: %d", v2, v3, v4, v5, v6);
}

- (void)_migrateToSchemaVersion_15
{
  OUTLINED_FUNCTION_2_2();
  *uint64_t v1 = 138412802;
  OUTLINED_FUNCTION_0_8(v2, (uint64_t)v1, v3);
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to update metadata value %@: %{public}@ (%d)", v4, 0x1Cu);
}

- (void)_migrateToSchemaVersion_16
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_10(&dword_1A6B5F000, "Failed to add status_code column to history_items table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateLegacyItem:(uint8_t *)buf dailyVisitCounts:(os_log_t)log weeklyVisitCounts:.cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138478083;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to create item for %{private}@: %{public}@", buf, 0x16u);
}

- (void)_migrateLegacyVisitWithItemID:visitTime:title:score:loadSuccessful:httpNonGet:synthesized:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  *(_DWORD *)uint64_t v1 = 134218242;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2114;
  *(void *)(v1 + 14) = v3;
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to create visit for item %lli: %{public}@", v4, 0x16u);
}

- (void)migrateLegacyDatabaseCreatingRedirectChains:urlsToItemAndLastVisitID:visitsToUseForRedirectChains:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  *uint64_t v1 = 138543362;
  void *v3 = v2;
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to create synthesized visit for redirect chain: %{public}@", v4, 0xCu);
}

@end