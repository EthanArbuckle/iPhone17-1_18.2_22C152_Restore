@interface WBSSiteMetadataImageCacheSettingsSQLiteStore
+ (Class)cacheSettingsEntryClass;
+ (int64_t)databaseSchemaVersion;
- (BOOL)_checkDatabaseIntegrity;
- (BOOL)_createNewDatabaseSchema;
- (BOOL)_migrateToCurrentSchemaVersionifNeeded;
- (BOOL)_openDatabase:(id)a3 andCheckIntegrity:(BOOL)a4;
- (BOOL)_performMigrationStepToSchemaVersion:(int64_t)a3 withStatements:(id)a4;
- (BOOL)deleteAllEntries;
- (BOOL)deleteEntryWithHost:(id)a3;
- (NSURL)databaseURL;
- (WBSSQLiteDatabase)database;
- (WBSSiteMetadataImageCacheSettingsSQLiteStore)initWithDatabaseURL:(id)a3;
- (WBSSiteMetadataImageCacheSettingsSQLiteStore)initWithDatabaseURL:(id)a3 protectionType:(int64_t)a4;
- (id)_createNewDatabaseSQLiteStatement;
- (id)_deleteAllEntriesSQLiteStatement;
- (id)_deleteEntrySQLiteStatementWithHost:(id)a3;
- (id)_insertEntry:(id)a3;
- (id)_insertEntrySQLiteStatementWithEntry:(id)a3;
- (id)_selectAllEntriesSQLiteStatement;
- (id)_selectEntrySQLiteStatementWithHost:(id)a3;
- (id)_statementsForMigrationToSchemaVersion:(int64_t)a3;
- (id)_updateEntry:(id)a3;
- (id)_updateEntrySQLiteStatementWithEntry:(id)a3;
- (id)allEntries;
- (id)entryWithHost:(id)a3;
- (id)saveEntry:(id)a3;
- (int)_setDatabaseSchemaVersion:(int)a3;
- (void)_checkDatabaseIntegrity;
- (void)_checkpointWriteAheadLogOnInternalQueue;
- (void)_closeDatabase;
- (void)_createNewDatabaseSchema;
- (void)close;
- (void)dealloc;
- (void)performMaintenanceWork;
@end

@implementation WBSSiteMetadataImageCacheSettingsSQLiteStore

uint64_t __83__WBSSiteMetadataImageCacheSettingsSQLiteStore_initWithDatabaseURL_protectionType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _openDatabase:*(void *)(a1 + 40) andCheckIntegrity:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || (uint64_t result = [*(id *)(a1 + 32) _migrateToCurrentSchemaVersionifNeeded],
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result) == 0))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  }
  return result;
}

- (BOOL)_openDatabase:(id)a3 andCheckIntegrity:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (WBSSQLiteDatabase *)[objc_alloc(MEMORY[0x1E4F983C0]) initWithURL:v6 queue:self->_databaseQueue];
  database = self->_database;
  self->_database = v7;

  v9 = self->_database;
  int64_t protectionType = self->_protectionType;
  id v24 = 0;
  char v11 = [(WBSSQLiteDatabase *)v9 openWithAccessType:3 protectionType:protectionType vfs:0 error:&v24];
  id v12 = v24;
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    v22 = objc_msgSend(v12, "safari_privacyPreservingDescription");
    WTFLogAlways();

    v18 = self->_database;
    self->_database = 0;

    BOOL v17 = 0;
    self->_isClosed = 1;
    goto LABEL_11;
  }
  v14 = self->_database;
  id v23 = v13;
  char v15 = [(WBSSQLiteDatabase *)v14 enableWAL:&v23];
  id v16 = v23;

  v13 = v16;
  if ((v15 & 1) == 0)
  {
    v19 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(v16, "safari_privacyPreservingDescription");
      [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)(uint64_t)v6 _openDatabase:buf andCheckIntegrity:v19];
    }

    goto LABEL_10;
  }
  if (v4 && ![(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self _checkDatabaseIntegrity])
  {
LABEL_10:
    [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self _closeDatabase];
    BOOL v17 = 0;
    goto LABEL_11;
  }
  BOOL v17 = 1;
LABEL_11:

  return v17;
}

- (BOOL)_checkDatabaseIntegrity
{
  v2 = [(WBSSQLiteDatabase *)self->_database fetchQuery:@"PRAGMA integrity_check(1)"];
  v3 = [v2 nextObject];
  BOOL v4 = [v3 stringAtIndex:0];
  v5 = [v2 statement];
  [v5 invalidate];

  if (!v3)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WBSSiteMetadataImageCacheSettingsSQLiteStore _checkDatabaseIntegrity](v7);
    }
    goto LABEL_8;
  }
  if (([v4 isEqualToString:@"ok"] & 1) == 0)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)(uint64_t)v4 _checkDatabaseIntegrity];
    }
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

void __58__WBSSiteMetadataImageCacheSettingsSQLiteStore_allEntries__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _selectAllEntriesSQLiteStatement];
  v3 = [v2 fetch];
  BOOL v4 = (objc_class *)[(id)objc_opt_class() cacheSettingsEntryClass];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        v10 = *(void **)(a1 + 40);
        id v11 = [v4 alloc];
        id v12 = objc_msgSend(v11, "initWithSQLiteRow:", v9, (void)v13);
        [v10 addObject:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [v2 invalidate];
}

- (BOOL)_migrateToCurrentSchemaVersionifNeeded
{
  v3 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"PRAGMA user_version");
  BOOL v4 = [v3 nextObject];
  int v5 = [v4 intAtIndex:0];

  uint64_t v6 = [v3 statement];
  [v6 invalidate];

  if (v5)
  {
    uint64_t v7 = [(id)objc_opt_class() databaseSchemaVersion];
    if (v7 <= v5)
    {
      BOOL v10 = 1;
    }
    else
    {
      uint64_t v8 = v5 + 1;
      do
      {
        uint64_t v9 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self _statementsForMigrationToSchemaVersion:v8];
        BOOL v10 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self _performMigrationStepToSchemaVersion:v8 withStatements:v9];
      }
      while (v7 != v8++ && v10);
    }
  }
  else
  {
    BOOL v10 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self _createNewDatabaseSchema];
  }

  return v10;
}

- (WBSSQLiteDatabase)database
{
  return self->_database;
}

- (WBSSiteMetadataImageCacheSettingsSQLiteStore)initWithDatabaseURL:(id)a3 protectionType:(int64_t)a4
{
  id v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WBSSiteMetadataImageCacheSettingsSQLiteStore;
  uint64_t v8 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)&v31 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_databaseURL, a3);
    BOOL v10 = NSString;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = [v10 stringWithFormat:@"com.apple.SafariShared.%@.%p", v12, v9];
    long long v14 = (const char *)[v13 UTF8String];
    long long v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    databaseQueue = v9->_databaseQueue;
    v9->_databaseQueue = (OS_dispatch_queue *)v16;

    v9->_int64_t protectionType = a4;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v18 = v9->_databaseQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__WBSSiteMetadataImageCacheSettingsSQLiteStore_initWithDatabaseURL_protectionType___block_invoke;
    block[3] = &unk_1E5E43A08;
    uint64_t v26 = &v27;
    v19 = v9;
    id v24 = v19;
    id v25 = v7;
    dispatch_sync(v18, block);
    if (*((unsigned char *)v28 + 24)) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    v21 = v20;

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)allEntries
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__WBSSiteMetadataImageCacheSettingsSQLiteStore_allEntries__block_invoke;
  v7[3] = &unk_1E5E407D0;
  v7[4] = self;
  id v5 = v3;
  id v8 = v5;
  dispatch_sync(databaseQueue, v7);

  return v5;
}

- (WBSSiteMetadataImageCacheSettingsSQLiteStore)initWithDatabaseURL:(id)a3
{
  return [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self initWithDatabaseURL:a3 protectionType:0];
}

- (void)close
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WBSSiteMetadataImageCacheSettingsSQLiteStore_close__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __53__WBSSiteMetadataImageCacheSettingsSQLiteStore_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDatabase];
}

- (void)_closeDatabase
{
  if (!self->_isClosed)
  {
    [(WBSSQLiteDatabase *)self->_database close];
    self->_isClosed = 1;
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WBSSiteMetadataImageCacheSettingsSQLiteStore;
  [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)&v2 dealloc];
}

- (BOOL)_createNewDatabaseSchema
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v3 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self _createNewDatabaseSQLiteStatement];
  int v4 = [v3 execute];
  [v3 invalidate];
  if (v4 == 101)
  {
    BOOL v5 = -[WBSSiteMetadataImageCacheSettingsSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", [(id)objc_opt_class() databaseSchemaVersion]) == 101;
  }
  else
  {
    uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)v7 _createNewDatabaseSchema];
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_performMigrationStepToSchemaVersion:(int64_t)a3 withStatements:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([v6 count])
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke;
    v36[3] = &unk_1E5E408C0;
    id v7 = v6;
    id v37 = v7;
    id v8 = (void (**)(void))MEMORY[0x1AD115160](v36);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke_2;
    v35[3] = &unk_1E5E408C0;
    v35[4] = self;
    uint64_t v9 = (void (**)(void))MEMORY[0x1AD115160](v35);
    int v10 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"BEGIN TRANSACTION");
    if (v10 == 101)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v11);
            }
            int v15 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "execute", (void)v31);
            if (v15 != 101)
            {
              v19 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                id v25 = (objc_class *)objc_opt_class();
                uint64_t v26 = NSStringFromClass(v25);
                uint64_t v27 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
                *(_DWORD *)buf = 138412802;
                v40 = v26;
                __int16 v41 = 2112;
                v42 = v27;
                __int16 v43 = 1024;
                int v44 = v15;
                _os_log_error_impl(&dword_1ABB70000, v19, OS_LOG_TYPE_ERROR, "Failed to execute migration sql statement: %@ %@ (%d)", buf, 0x1Cu);
              }
              goto LABEL_21;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v38 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      if ([(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self _setDatabaseSchemaVersion:a3] == 101)
      {
        int v16 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"COMMIT TRANSACTION");
        if (v16 == 101)
        {
          v8[2](v8);
          BOOL v17 = 1;
LABEL_24:

          goto LABEL_25;
        }
        v21 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v28 = (objc_class *)objc_opt_class();
          uint64_t v29 = NSStringFromClass(v28);
          char v30 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
          *(_DWORD *)buf = 138412802;
          v40 = v29;
          __int16 v41 = 2112;
          v42 = v30;
          __int16 v43 = 1024;
          int v44 = v16;
          _os_log_error_impl(&dword_1ABB70000, v21, OS_LOG_TYPE_ERROR, "Failed to start a transaction while migrating: %@ %@ (%d)", buf, 0x1Cu);
        }
      }
      else
      {
LABEL_21:
        v9[2](v9);
      }
      v8[2](v8);
    }
    else
    {
      uint64_t v18 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = (objc_class *)objc_opt_class();
        id v23 = NSStringFromClass(v22);
        id v24 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        *(_DWORD *)buf = 138412802;
        v40 = v23;
        __int16 v41 = 2112;
        v42 = v24;
        __int16 v43 = 1024;
        int v44 = v10;
        _os_log_error_impl(&dword_1ABB70000, v18, OS_LOG_TYPE_ERROR, "Failed to start a transaction while migrating: %@ %@ (%d)", buf, 0x1Cu);
      }
      v8[2](v8);
    }
    BOOL v17 = 0;
    goto LABEL_24;
  }
  BOOL v17 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self _setDatabaseSchemaVersion:a3] == 101;
LABEL_25:

  return v17;
}

void __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v6;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v6 != v3) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v5 + 1) + 8 * v4++), "invalidate", (void)v5);
      }
      while (v2 != v4);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
    }
    while (v2);
  }
}

void __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke_2(uint64_t a1)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  int v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 8), 0, @"ROLLBACK TRANSACTION");
  if (v2 != 101)
  {
    int v3 = v2;
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      long long v5 = [*(id *)(*(void *)(a1 + 32) + 8) lastErrorMessage];
      __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke_2_cold_1(v5, (uint64_t)v6, v3);
    }
  }
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  database = self->_database;
  long long v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", *(void *)&a3);
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    long long v8 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      *(_DWORD *)buf = 67109634;
      int v12 = a3;
      __int16 v13 = 2112;
      long long v14 = v10;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_error_impl(&dword_1ABB70000, v8, OS_LOG_TYPE_ERROR, "Failed to set the database schema version to %d: %@ (%d)", buf, 0x18u);
    }
  }
  return v7;
}

- (void)_checkpointWriteAheadLogOnInternalQueue
{
  int v3 = (void *)os_transaction_create();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__WBSSiteMetadataImageCacheSettingsSQLiteStore__checkpointWriteAheadLogOnInternalQueue__block_invoke;
  v6[3] = &unk_1E5E407D0;
  void v6[4] = self;
  id v7 = v3;
  id v4 = v3;
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, v6);
  _os_activity_initiate(&dword_1ABB70000, "Cleaning WAL", OS_ACTIVITY_FLAG_DETACHED, v5);
}

void __87__WBSSiteMetadataImageCacheSettingsSQLiteStore__checkpointWriteAheadLogOnInternalQueue__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  if (![*(id *)(*(void *)(a1 + 32) + 8) checkpointWriteAheadLogWithLogFrameCount:(char *)&v2 + 4 checkpointedFrameCount:&v2])
  {
    id v1 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v4 = HIDWORD(v2);
      __int16 v5 = 1024;
      int v6 = v2;
      _os_log_impl(&dword_1ABB70000, v1, OS_LOG_TYPE_INFO, "Checkpointed write ahead log (WAL). Log frame count: %d, checkpointed frame count: %d", buf, 0xEu);
    }
  }
}

- (id)entryWithHost:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__23;
  int v16 = __Block_byref_object_dispose__23;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSSiteMetadataImageCacheSettingsSQLiteStore_entryWithHost___block_invoke;
  block[3] = &unk_1E5E446F8;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(databaseQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __62__WBSSiteMetadataImageCacheSettingsSQLiteStore_entryWithHost___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _selectEntrySQLiteStatementWithHost:*(void *)(a1 + 40)];
  uint64_t v2 = [v7 fetch];
  int v3 = [v2 nextObject];
  if (v3)
  {
    uint64_t v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "cacheSettingsEntryClass")), "initWithSQLiteRow:", v3);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  [v7 invalidate];
}

- (id)saveEntry:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int v16 = __Block_byref_object_copy__23;
  id v17 = __Block_byref_object_dispose__23;
  id v18 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__WBSSiteMetadataImageCacheSettingsSQLiteStore_saveEntry___block_invoke;
  block[3] = &unk_1E5E44720;
  id v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(databaseQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __58__WBSSiteMetadataImageCacheSettingsSQLiteStore_saveEntry___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) databaseID];
  uint64_t v4 = *(void *)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  if (v2) {
    [v3 _updateEntry:v4];
  }
  else {
  uint64_t v5 = [v3 _insertEntry:v4];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_insertEntry:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self _insertEntrySQLiteStatementWithEntry:v4];
  int v6 = [v5 execute];
  [v5 invalidate];
  if (v6 == 101)
  {
    id v7 = objc_msgSend(v4, "entryWithDatabaseID:", -[WBSSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID"));
  }
  else
  {
    long long v8 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      int v11 = 141558787;
      uint64_t v12 = 1752392040;
      __int16 v13 = 2117;
      id v14 = v4;
      __int16 v15 = 2112;
      int v16 = v10;
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_error_impl(&dword_1ABB70000, v8, OS_LOG_TYPE_ERROR, "Failed to insert cache settings entry for host = %{sensitive, mask.hash}@: %@ (%d)", (uint8_t *)&v11, 0x26u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)_updateEntry:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self _updateEntrySQLiteStatementWithEntry:v4];
  int v6 = [v5 execute];
  [v5 invalidate];
  if (v6 != 101)
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      int v10 = 141558787;
      uint64_t v11 = 1752392040;
      __int16 v12 = 2117;
      id v13 = v4;
      __int16 v14 = 2112;
      __int16 v15 = v9;
      __int16 v16 = 1024;
      int v17 = v6;
      _os_log_error_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_ERROR, "Failed to insert cache settings entry for host = %{sensitive, mask.hash}@: %@ (%d)", (uint8_t *)&v10, 0x26u);
    }
    id v4 = 0;
  }

  return v4;
}

- (BOOL)deleteEntryWithHost:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    *(void *)&uint8_t buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2117;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_DEFAULT, "Removed Touch Icon from database; host=%{sensitive, mask.hash}@",
      buf,
      0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  int v14 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteEntryWithHost___block_invoke;
  block[3] = &unk_1E5E446F8;
  void block[4] = self;
  id v11 = v4;
  __int16 v12 = buf;
  id v7 = v4;
  dispatch_sync(databaseQueue, block);
  BOOL v8 = *(_DWORD *)(*(void *)&buf[8] + 24) == 101;

  _Block_object_dispose(buf, 8);
  return v8;
}

void __68__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteEntryWithHost___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _deleteEntrySQLiteStatementWithHost:*(void *)(a1 + 40)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 execute];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 101)
  {
    int v3 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) lastErrorMessage];
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v7 = 141558787;
      uint64_t v8 = 1752392040;
      __int16 v9 = 2117;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      __int16 v12 = v5;
      __int16 v13 = 1024;
      int v14 = v6;
      _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Failed to delete entry with host %{sensitive, mask.hash}@: %@ (%d)", (uint8_t *)&v7, 0x26u);
    }
  }
  [v2 invalidate];
}

- (BOOL)deleteAllEntries
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  databaseQueue = self->_databaseQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteAllEntries__block_invoke;
  v5[3] = &unk_1E5E44748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(databaseQueue, v5);
  BOOL v3 = *((_DWORD *)v7 + 6) == 101;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __64__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteAllEntries__block_invoke(uint64_t a1)
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _deleteAllEntriesSQLiteStatement];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 execute];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 101)
  {
    BOOL v3 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) lastErrorMessage];
      __64__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteAllEntries__block_invoke_cold_1(v4, a1 + 40, (uint64_t)v5, v3);
    }
  }
  [v2 invalidate];
  [*(id *)(a1 + 32) _checkpointWriteAheadLogOnInternalQueue];
}

- (void)performMaintenanceWork
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WBSSiteMetadataImageCacheSettingsSQLiteStore_performMaintenanceWork__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_async(databaseQueue, block);
}

uint64_t __70__WBSSiteMetadataImageCacheSettingsSQLiteStore_performMaintenanceWork__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkpointWriteAheadLogOnInternalQueue];
}

+ (Class)cacheSettingsEntryClass
{
  return 0;
}

+ (int64_t)databaseSchemaVersion
{
  return 0;
}

- (id)_createNewDatabaseSQLiteStatement
{
  return 0;
}

- (id)_selectAllEntriesSQLiteStatement
{
  return 0;
}

- (id)_selectEntrySQLiteStatementWithHost:(id)a3
{
  return 0;
}

- (id)_insertEntrySQLiteStatementWithEntry:(id)a3
{
  return 0;
}

- (id)_updateEntrySQLiteStatementWithEntry:(id)a3
{
  return 0;
}

- (id)_deleteEntrySQLiteStatementWithHost:(id)a3
{
  return 0;
}

- (id)_deleteAllEntriesSQLiteStatement
{
  return 0;
}

- (id)_statementsForMigrationToSchemaVersion:(int64_t)a3
{
  return 0;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)_openDatabase:(uint8_t *)buf andCheckIntegrity:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 141558531;
  *(void *)(buf + 4) = 1752392040;
  *((_WORD *)buf + 6) = 2117;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a2;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to enable write-ahead logging on cache settings store at %{sensitive, mask.hash}@: %@", buf, 0x20u);
}

- (void)_checkDatabaseIntegrity
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Failed database integrity check: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_createNewDatabaseSchema
{
  OUTLINED_FUNCTION_1_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_9(&dword_1ABB70000, "Failed to create the cache_settings table: %@ (%d)", v4, v5);
}

void __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke_2_cold_1(void *a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_1_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_9(&dword_1ABB70000, "Failed to roll back transaction: %@ (%d)", v4, v5);
}

void __64__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteAllEntries__block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  int v5 = *(_DWORD *)(*(void *)(*(void *)a2 + 8) + 24);
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_0_9(&dword_1ABB70000, "Failed to delete all entries: %@ (%d)", (uint8_t *)a3, a4);
}

@end