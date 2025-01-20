@interface SFBrowserStateSQLiteStore
- (BOOL)_checkDatabaseIntegrity;
- (BOOL)_isDatabaseOpen;
- (BOOL)_isTabStateCached:(id)a3;
- (BOOL)_updateTabStateWithData:(id)a3;
- (BOOL)updateSceneID:(id)a3;
- (NSArray)browserWindows;
- (NSArray)recentlyClosedWindows;
- (SFBrowserStateSQLiteStore)init;
- (SFBrowserStateSQLiteStore)initWithDatabaseURL:(id)a3;
- (id)_readSavedSessionStateDataForTabWithUUIDString:(id)a3;
- (id)_sqliteStatementForTabDeleting;
- (id)_tabStateDataForUUID:(id)a3;
- (id)_tabUUIDsInWindow:(id)a3;
- (id)readSavedSessionStateDataForTabWithUUIDString:(id)a3;
- (id)tabStateDataForUUID:(id)a3;
- (id)tabStatesWithBrowserWindowUUID:(id)a3;
- (int)_createFreshDatabaseSchema;
- (int)_createTableForTabSession;
- (int)_createTableForTabs;
- (int)_mergeAllWindowsIfNeeded;
- (int)_migrateToCurrentSchemaVersionIfNeeded;
- (int)_migrateToSchemaVersion:(int)a3;
- (int)_migrateToSchemaVersion_2;
- (int)_migrateToSchemaVersion_3;
- (int)_migrateToSchemaVersion_4;
- (int)_migrateToSchemaVersion_5;
- (int)_migrateToSchemaVersion_6;
- (int)_migrateToSchemaVersion_7;
- (int)_migrateToSchemaVersion_8;
- (int)_recoverFromDatabaseInconsistencyFromSchemaVersion3Migration;
- (int)_schemaVersion;
- (int)_setDatabaseSchemaVersion:(int)a3;
- (int64_t)_databaseIDForBrowserWindow:(id)a3;
- (int64_t)_saveBrowserWindowStateWithData:(id)a3;
- (int64_t)_saveBrowserWindowStateWithDictionary:(id)a3;
- (void)_cacheUUIDForTabStateData:(id)a3;
- (void)_checkDatabaseIntegrity;
- (void)_closeDatabase;
- (void)_createFreshDatabaseSchema;
- (void)_createTableForTabSession;
- (void)_createTableForTabs;
- (void)_insertTabStateWithData:(id)a3;
- (void)_mergeAllWindowsIfNeeded;
- (void)_migrateFromLegacyPlistIfNeeded;
- (void)_migrateFromLegacyPlistWithPath:(id)a3;
- (void)_migrateToSchemaVersion_2;
- (void)_migrateToSchemaVersion_3;
- (void)_migrateToSchemaVersion_4;
- (void)_migrateToSchemaVersion_5;
- (void)_migrateToSchemaVersion_6;
- (void)_migrateToSchemaVersion_7;
- (void)_migrateToSchemaVersion_8;
- (void)_openDatabaseAndCheckIntegrity:(BOOL)a3;
- (void)_readTabStatesWithBrowserWindowUUID:(id)a3 completion:(id)a4;
- (void)_recoverFromDatabaseInconsistencyFromSchemaVersion3Migration;
- (void)_regenerateTabUUIDsForDeviceRestoration;
- (void)_removeSavedSessionStateDataForTabsWithUUIDStrings:(id)a3;
- (void)_setDatabaseID:(int64_t)a3 browserWindow:(id)a4;
- (void)_updateBrowserWindowStateWithDictionary:(id)a3;
- (void)_updateBrowserWindowWithData:(id)a3 tabs:(id)a4;
- (void)_updateOrInsertTabStateWithData:(id)a3;
- (void)_vacuum;
- (void)checkPointWriteAheadLog;
- (void)closeDatabase;
- (void)dealloc;
- (void)deleteRecentlyClosedWindowsWithProfileIdentifier:(id)a3;
- (void)deleteSavedStatesForProfileWithIdentifier:(id)a3;
- (void)deleteTabStateWithBrowserWindowUUID:(id)a3 andRemoveWindow:(BOOL)a4;
- (void)mergeAllWindows;
- (void)readTabStatesWithBrowserWindowUUID:(id)a3 completion:(id)a4;
- (void)regenerateTabUUIDsForDeviceRestoration;
- (void)removeSavedSessionStateDataForTabsWithUUIDStrings:(id)a3;
- (void)removeTabWithTabData:(id)a3;
- (void)saveTabStateWithDictionary:(id)a3;
- (void)setSecureDeleteEnabled:(BOOL)a3;
- (void)updateBrowserWindowStateWithDictionary:(id)a3 completion:(id)a4;
- (void)updateBrowserWindowWithData:(id)a3 tabs:(id)a4;
- (void)updateTabWithTabStateData:(id)a3;
@end

@implementation SFBrowserStateSQLiteStore

uint64_t __49__SFBrowserStateSQLiteStore_initWithDatabaseURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseAndCheckIntegrity:0];
  uint64_t result = [*(id *)(a1 + 32) _isDatabaseOpen];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isDatabaseOpen
{
  return self->_database != 0;
}

void __43__SFBrowserStateSQLiteStore_browserWindows__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v11 = 0;
  v3 = SafariShared::WBSSQLiteDatabaseFetch<SFBrowserWindowType>(v2, @"SELECT id, uuid, scene_id FROM browser_windows WHERE type = ?", &v11);
  while (1)
  {
    v4 = [v3 nextObject];
    v5 = v4;
    if (!v4) {
      break;
    }
    v6 = [v4 stringAtIndex:1];
    v7 = [_SFBrowserWindowStateData alloc];
    v8 = [v5 stringAtIndex:2];
    v9 = [(_SFBrowserWindowStateData *)v7 initWithUUIDString:v6 sceneID:v8];

    objc_msgSend(*(id *)(a1 + 32), "_setDatabaseID:browserWindow:", (int)objc_msgSend(v5, "intAtIndex:", 0), v6);
    [*(id *)(a1 + 40) addObject:v9];
  }
  v10 = [v3 statement];
  [v10 invalidate];
}

void __50__SFBrowserStateSQLiteStore_recentlyClosedWindows__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v9 = 2;
  v3 = SafariShared::WBSSQLiteDatabaseFetch<SFBrowserWindowType>(v2, @"SELECT id, uuid FROM browser_windows WHERE type = ? ORDER BY id DESC", &v9);
  while (1)
  {
    v4 = [v3 nextObject];
    v5 = v4;
    if (!v4) {
      break;
    }
    v6 = [v4 stringAtIndex:1];
    v7 = [[_SFBrowserWindowStateData alloc] initWithUUIDString:v6 sceneID:0];
    objc_msgSend(*(id *)(a1 + 32), "_setDatabaseID:browserWindow:", (int)objc_msgSend(v5, "intAtIndex:", 0), v6);
    [*(id *)(a1 + 40) addObject:v7];
  }
  v8 = [v3 statement];
  [v8 invalidate];
}

- (int)_mergeAllWindowsIfNeeded
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  MEMORY[0x192F95920](v61, @"com.apple.SafariServices.SavingBrowserState");
  v48 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"SELECT COUNT(*) FROM browser_windows");
  v2 = [v48 nextObject];
  int v3 = [v2 intAtIndex:0];

  v4 = [v48 statement];
  [v4 invalidate];

  if (v3 >= 2)
  {
    v51 = [MEMORY[0x1E4F1CA60] dictionary];
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"SELECT id, uuid, type FROM browser_windows ORDER BY id ASC");
    v8 = [v7 nextObject];
    do
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "intAtIndex:", 0));
      v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "intAtIndex:", 2));
      [v6 setObject:v10 forKeyedSubscript:v9];
      uint64_t v11 = [v51 objectForKeyedSubscript:v10];
      BOOL v12 = v11 == 0;

      if (v12)
      {
        v13 = objc_alloc_init(_SFBrowserWindowStateData);
        -[_SFBrowserWindowStateData setDatabaseID:](v13, "setDatabaseID:", (int)[v9 intValue]);
        v14 = [v8 stringAtIndex:1];
        [(_SFBrowserWindowStateData *)v13 setUUIDString:v14];

        [v51 setObject:v13 forKeyedSubscript:v10];
      }

      uint64_t v15 = [v7 nextObject];

      v8 = (void *)v15;
    }
    while (v15);
    v16 = [v7 statement];
    [v16 invalidate];

    v50 = [MEMORY[0x1E4F1CA60] dictionary];
    v17 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"SELECT id, browser_window_id FROM tabs ORDER BY order_index ASC");
    while (1)
    {
      v18 = [v17 nextObject];
      v19 = v18;
      if (!v18) {
        break;
      }
      v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v18, "intAtIndex:", 0));
      v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v19, "intAtIndex:", 1));
      v22 = [v6 objectForKeyedSubscript:v21];
      if (v22)
      {
        v23 = [v50 objectForKeyedSubscript:v22];
        v24 = v23;
        if (v23)
        {
          [v23 addObject:v20];
        }
        else
        {
          v26 = [MEMORY[0x1E4F1CA48] arrayWithObject:v20];
          [v50 setObject:v26 forKeyedSubscript:v22];
        }
      }
      else
      {
        v25 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v21;
          _os_log_error_impl(&dword_18C354000, v25, OS_LOG_TYPE_ERROR, "Unknown window type for tab id %{public}@ in window id %{public}@", buf, 0x16u);
        }
      }
    }
    v27 = [v17 statement];
    [v27 invalidate];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v68 = 1;
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database, @"UPDATE tabs SET order_index = ?, browser_window_id = ?, browser_window_uuid = ? WHERE id = ?" query];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __53__SFBrowserStateSQLiteStore__mergeAllWindowsIfNeeded__block_invoke;
    v56[3] = &unk_1E54ED1F0;
    id v47 = v51;
    id v57 = v47;
    id v29 = v28;
    id v58 = v29;
    v59 = self;
    v60 = buf;
    v46 = v29;
    [v50 enumerateKeysAndObjectsUsingBlock:v56];
    [v29 invalidate];
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database query:@"DELETE FROM browser_windows WHERE id = ?"];
    v31 = (void *)MEMORY[0x1E4F1CAD0];
    v32 = [v47 allValues];
    v33 = objc_msgSend(v32, "safari_mapObjectsUsingBlock:", &__block_literal_global_56);
    v34 = [v31 setWithArray:v33];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v35 = [v6 allKeys];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v66 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v53;
      char v38 = 1;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if (([v34 containsObject:v40] & 1) == 0)
          {
            objc_msgSend(v30, "bindInt:atParameterIndex:", objc_msgSend(v40, "intValue"), 1);
            int v41 = [v30 execute];
            if (v41 != 101)
            {
              v42 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                v43 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
                *(_DWORD *)v62 = 138543618;
                v63 = v43;
                __int16 v64 = 1024;
                int v65 = v41;
                _os_log_error_impl(&dword_18C354000, v42, OS_LOG_TYPE_ERROR, "Failed to delete empty windows while merging: %{public}@ (%d)", v62, 0x12u);
              }
              char v38 = 0;
            }
            [v30 reset];
          }
        }
        uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v66 count:16];
      }
      while (v36);
    }
    else
    {
      char v38 = 1;
    }

    [v30 invalidate];
    int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"UPDATE browser_windows SET scene_id = NULL");
    if (v5 == 101)
    {
      if (((*(unsigned char *)(*(void *)&buf[8] + 24) != 0) & v38) != 0) {
        int v5 = 101;
      }
      else {
        int v5 = 1;
      }
    }
    else
    {
      v44 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[SFBrowserStateSQLiteStore _mergeAllWindowsIfNeeded]();
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    int v5 = 101;
  }

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v61);
  return v5;
}

- (int)_schemaVersion
{
  v2 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"PRAGMA user_version");
  int v3 = [v2 nextObject];
  int v4 = [v3 intAtIndex:0];

  int v5 = [v2 statement];
  [v5 invalidate];

  return v4;
}

void __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke(uint64_t a1)
{
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 16), 0, @"BEGIN") != 101)
  {
    int v3 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 16) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_3();
    }
    goto LABEL_12;
  }
  if ([*(id *)(a1 + 32) _mergeAllWindowsIfNeeded] != 101
    && SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 16), 0, @"ROLLBACK") != 101)
  {
    v2 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 16) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_2();
    }
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 16), 0, @"COMMIT") != 101)
  {
    int v3 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 16) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_1();
    }
LABEL_12:
  }
}

- (void)_openDatabaseAndCheckIntegrity:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = (WBSSQLiteDatabase *)[objc_alloc(MEMORY[0x1E4F97F98]) initWithURL:self->_databaseURL queue:self->_databaseQueue];
  database = self->_database;
  self->_database = v5;

  if ([(WBSSQLiteDatabase *)self->_database openWithAccessType:3 error:0])
  {
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    tabUUIDStrings = self->_tabUUIDStrings;
    self->_tabUUIDStrings = v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    browserWindowDatabaseIDs = self->_browserWindowDatabaseIDs;
    self->_browserWindowDatabaseIDs = v9;

    if (v3 && ![(SFBrowserStateSQLiteStore *)self _checkDatabaseIntegrity])
    {
      goto LABEL_17;
    }
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"PRAGMA journal_mode = WAL") != 100)
    {
      uint64_t v11 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SFBrowserStateSQLiteStore _openDatabaseAndCheckIntegrity:]((uint64_t)&self->_databaseURL, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"PRAGMA foreign_keys = ON");
    int v18 = [(SFBrowserStateSQLiteStore *)self _migrateToCurrentSchemaVersionIfNeeded];
    if (v18 != 8)
    {
      int v19 = v18;
      v20 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        [(SFBrowserStateSQLiteStore *)(uint64_t *)&self->_databaseURL _openDatabaseAndCheckIntegrity:v20];
      }
LABEL_17:
      [(SFBrowserStateSQLiteStore *)self _closeDatabase];
    }
  }
  else
  {
    v21 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SFBrowserStateSQLiteStore _openDatabaseAndCheckIntegrity:]((uint64_t)&self->_databaseURL, v21, v22, v23, v24, v25, v26, v27);
    }
    v28 = self->_database;
    self->_database = 0;
  }
}

- (int)_migrateToCurrentSchemaVersionIfNeeded
{
  unsigned int v3 = [(SFBrowserStateSQLiteStore *)self _schemaVersion];
  int v4 = v3;
  if (v3 <= 7)
  {
    if (v3)
    {
      uint64_t v5 = v3 + 1;
      while (v5 != 9)
      {
        int v6 = [(SFBrowserStateSQLiteStore *)self _migrateToSchemaVersion:v5];
        uint64_t v5 = (v5 + 1);
        if (v6 != 101) {
          return v4;
        }
      }
    }
    else
    {
      if ([(SFBrowserStateSQLiteStore *)self _createFreshDatabaseSchema] != 101) {
        return 0;
      }
      [(SFBrowserStateSQLiteStore *)self _migrateFromLegacyPlistIfNeeded];
    }
    int v4 = 8;
    [(SFBrowserStateSQLiteStore *)self _setDatabaseSchemaVersion:8];
  }
  return v4;
}

- (NSArray)recentlyClosedWindows
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  databaseQueue = self->_databaseQueue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __50__SFBrowserStateSQLiteStore_recentlyClosedWindows__block_invoke;
  uint64_t v11 = &unk_1E54ED128;
  uint64_t v12 = self;
  id v5 = v3;
  id v13 = v5;
  dispatch_sync(databaseQueue, &v8);
  int v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

- (void)mergeAllWindows
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke;
  block[3] = &unk_1E54EB768;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

- (SFBrowserStateSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFBrowserStateSQLiteStore;
  id v5 = [(SFBrowserStateSQLiteStore *)&v22 init];
  if (v5)
  {
    if (v4)
    {
      int v6 = (NSURL *)v4;
    }
    else
    {
      int v6 = [MEMORY[0x1E4F97F98] inMemoryDatabaseURL];
    }
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = v6;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MobileSafari.TabStateSQLiteStore", 0);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v9;

    uint64_t v18 = 0;
    int v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    uint64_t v11 = v5->_databaseQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__SFBrowserStateSQLiteStore_initWithDatabaseURL___block_invoke;
    v15[3] = &unk_1E54ED1A0;
    uint64_t v12 = v5;
    uint64_t v16 = v12;
    uint64_t v17 = &v18;
    dispatch_sync(v11, v15);
    if (*((unsigned char *)v19 + 24)) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    v7 = v13;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)browserWindows
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  databaseQueue = self->_databaseQueue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __43__SFBrowserStateSQLiteStore_browserWindows__block_invoke;
  uint64_t v11 = &unk_1E54ED128;
  uint64_t v12 = self;
  id v5 = v3;
  id v13 = v5;
  dispatch_sync(databaseQueue, &v8);
  int v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

- (SFBrowserStateSQLiteStore)init
{
  return [(SFBrowserStateSQLiteStore *)self initWithDatabaseURL:0];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SFBrowserStateSQLiteStore;
  [(SFBrowserStateSQLiteStore *)&v2 dealloc];
}

- (BOOL)_checkDatabaseIntegrity
{
  objc_super v2 = [(WBSSQLiteDatabase *)self->_database fetchQuery:@"PRAGMA integrity_check(1)"];
  id v3 = [v2 nextObject];
  id v4 = [v3 stringAtIndex:0];
  id v5 = [v2 statement];
  [v5 invalidate];

  if (!v3)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(SFBrowserStateSQLiteStore *)v7 _checkDatabaseIntegrity];
    }
    goto LABEL_8;
  }
  if (([v4 isEqualToString:@"ok"] & 1) == 0)
  {
    uint64_t v15 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(SFBrowserStateSQLiteStore *)(uint64_t)v4 _checkDatabaseIntegrity];
    }
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (void)_closeDatabase
{
  [(WBSSQLiteDatabase *)self->_database close];
  database = self->_database;
  self->_database = 0;

  self->_generateUUIDFunctionAttached = 0;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  database = self->_database;
  BOOL v6 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", *(void *)&a3);
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      *(_DWORD *)buf = 67109634;
      int v12 = a3;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_error_impl(&dword_18C354000, v8, OS_LOG_TYPE_ERROR, "Failed to set the database schema version to %d: %{public}@ (%d)", buf, 0x18u);
    }
  }
  return v7;
}

- (void)_migrateFromLegacyPlistIfNeeded
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = _SFSafariContainerPath();
  id v5 = [v4 stringByAppendingPathComponent:@"/Library/Safari/SuspendState.plist"];
  BOOL v6 = [v5 stringByResolvingSymlinksInPath];
  id v7 = [v3 fileURLWithPath:v6 isDirectory:0];

  [(SFBrowserStateSQLiteStore *)self _migrateFromLegacyPlistWithPath:v7];
}

- (void)_migrateFromLegacyPlistWithPath:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v28 = 0;
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:&v28];
  id v6 = v28;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:0];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = (void *)[v8 mutableCopy];
      uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
      int v12 = [v11 UUIDString];
      [v10 setObject:v12 forKeyedSubscript:@"SafariStateBrowserWindowUUID"];

      [(SFBrowserStateSQLiteStore *)self _updateBrowserWindowStateWithDictionary:v10];
    }
    else
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SFBrowserStateSQLiteStore _migrateFromLegacyPlistWithPath:]((uint64_t)v4, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
  else if (objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E4F281F8], 260))
  {
    __int16 v13 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v4;
      _os_log_impl(&dword_18C354000, v13, OS_LOG_TYPE_DEFAULT, "Legacy SuspendState.plist does not exist at %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v21 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SFBrowserStateSQLiteStore _migrateFromLegacyPlistWithPath:]((uint64_t)v4, v21, v22, v23, v24, v25, v26, v27);
    }
  }
}

- (int)_migrateToSchemaVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  MEMORY[0x192F95920](v24, @"com.apple.SafariServices.SavingBrowserState");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__SFBrowserStateSQLiteStore__migrateToSchemaVersion___block_invoke;
  aBlock[3] = &unk_1E54EB768;
  aBlock[4] = self;
  id v5 = (void (**)(void))_Block_copy(aBlock);
  int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"BEGIN TRANSACTION");
  if (v6 == 101)
  {
    switch((int)v3)
    {
      case 1:
        goto LABEL_14;
      case 2:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
        int v6 = [(SFBrowserStateSQLiteStore *)self _migrateToSchemaVersion];
        goto LABEL_13;
      case 3:
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
        if ([v8 BOOLForKey:@"TabStateMigrationInProgress"])
        {
          uint64_t v9 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[SFBrowserStateSQLiteStore _migrateToSchemaVersion:].cold.4(v9, v10, v11, v12, v13, v14, v15, v16);
          }
          [(SFBrowserStateSQLiteStore *)self _recoverFromDatabaseInconsistencyFromSchemaVersion3Migration];
          int v6 = 101;
        }
        else
        {
          [v8 setBool:1 forKey:@"TabStateMigrationInProgress"];
          uint64_t v21 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v22 = 0;
            _os_log_impl(&dword_18C354000, v21, OS_LOG_TYPE_DEFAULT, "Start migrating from tab state database from V2 to V3", v22, 2u);
          }
          int v6 = [(SFBrowserStateSQLiteStore *)self _migrateToSchemaVersion];
        }
        [v8 removeObjectForKey:@"TabStateMigrationInProgress"];

LABEL_13:
        if (v6 != 101) {
          goto LABEL_19;
        }
LABEL_14:
        int v6 = [(SFBrowserStateSQLiteStore *)self _setDatabaseSchemaVersion:v3];
        if (v6 != 101) {
          goto LABEL_21;
        }
        int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"COMMIT TRANSACTION");
        if (v6 != 101)
        {
          uint64_t v18 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[SFBrowserStateSQLiteStore _migrateToSchemaVersion:]();
          }
LABEL_21:
          v5[2](v5);
        }
        break;
      default:
        uint64_t v17 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[SFBrowserStateSQLiteStore _migrateToSchemaVersion:]();
        }
        int v6 = 1;
LABEL_19:
        uint64_t v19 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[SFBrowserStateSQLiteStore _migrateToSchemaVersion:]();
        }
        goto LABEL_21;
    }
  }
  else
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion:].cold.5();
    }
  }

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v24);
  return v6;
}

void __53__SFBrowserStateSQLiteStore__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(void *)(a1 + 32) + 16), 0, @"ROLLBACK TRANSACTION") != 101)
  {
    v1 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __53__SFBrowserStateSQLiteStore__migrateToSchemaVersion___block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

- (int)_migrateToSchemaVersion_2
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE tabs ADD COLUMN uncompressed_session_data_size INTEGER NOT NULL DEFAULT 0");
  if (v3 != 101)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_2]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion_3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v3 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"SELECT COUNT(*) FROM sqlite_master WHERE type = 'table' AND (name = 'tabs_old' OR name = 'tab_sessions')");
  uint64_t v4 = [v3 nextObject];
  uint64_t v5 = v4;
  if (!v4)
  {
    int v9 = [v3 lastResultCode];
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3]();
    }
    uint64_t v12 = [v3 statement];
    [v12 invalidate];

    goto LABEL_33;
  }
  int v6 = [v4 intAtIndex:0];
  uint64_t v7 = [v3 statement];
  [v7 invalidate];

  if (v6 >= 1)
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C354000, v8, OS_LOG_TYPE_DEFAULT, "Database is in an inconsistent state on schema version 3. Atempting to recover", buf, 2u);
    }
    int v9 = [(SFBrowserStateSQLiteStore *)self _recoverFromDatabaseInconsistencyFromSchemaVersion3Migration];
    if (v9 == 101)
    {
      uint64_t v10 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C354000, v10, OS_LOG_TYPE_INFO, "Successfully recovered from database inconsistency of schema version 3.", buf, 2u);
      }
LABEL_8:
      int v9 = 101;
      goto LABEL_33;
    }
    uint64_t v15 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3]();
    }
    goto LABEL_33;
  }
  int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP INDEX IF EXISTS tabs__uuid");
  if (v9 != 101)
  {
    uint64_t v16 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.7();
    }
    goto LABEL_32;
  }
  int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE tabs RENAME TO tabs_old");
  if (v9 != 101)
  {
    uint64_t v16 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.6();
    }
    goto LABEL_32;
  }
  int v9 = [(SFBrowserStateSQLiteStore *)self _createTableForTabs];
  if (v9 != 101) {
    goto LABEL_33;
  }
  int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"INSERT INTO tabs (id, uuid, title, url, user_visible_url, order_index, last_viewed_time, readinglist_bookmark_id, opened_from_link, showing_reader, reader_view_top_scroll_offset, private_browsing, displaying_standalone_image, browser_window_uuid, browser_window_id)SELECT tabs_old.id, tabs_old.uuid, tabs_old.title, tabs_old.url, tabs_old.user_visible_url, tabs_old.order_index, tabs_old.last_viewed_time, tabs_old.readinglist_bookmark_id, tabs_old.opened_from_link, tabs_old.showing_reader, tabs_old.reader_view_top_scroll_offset, tabs_old.private_browsing, tabs_old.displaying_standalone_image, tabs_old.browser_window_uuid, tabs_old.browser_window_id FROM tabs_old");
  if (v9 != 101)
  {
    uint64_t v16 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.5();
    }
LABEL_32:

    goto LABEL_33;
  }
  int v9 = [(SFBrowserStateSQLiteStore *)self _createTableForTabSession];
  if (v9 == 101)
  {
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"INSERT INTO tab_sessions (tab_uuid, session_data, uncompressed_session_data_size)SELECT tabs_old.uuid, tabs_old.session_data, tabs_old.uncompressed_session_data_size FROM tabs_old") != 101)
    {
      uint64_t v13 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3].cold.4();
      }
    }
    int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP TABLE tabs_old");
    if (v9 != 101)
    {
      uint64_t v14 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3]();
      }

      goto LABEL_8;
    }
  }
LABEL_33:

  return v9;
}

- (int)_migrateToSchemaVersion_5
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP INDEX IF EXISTS tab_sessions__uuid");
  if (v3 != 101)
  {
    int v7 = v3;
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_5].cold.5();
    }
    goto LABEL_17;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE tab_sessions RENAME TO tab_sessions_old");
  if (v4 != 101)
  {
    int v7 = v4;
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_5].cold.4();
    }
    goto LABEL_17;
  }
  int v5 = [(SFBrowserStateSQLiteStore *)self _createTableForTabSession];
  if (v5 != 101)
  {
    int v7 = v5;
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_5]();
    }
    goto LABEL_17;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"INSERT INTO tab_sessions (tab_uuid, session_data, uncompressed_session_data_size)SELECT tab_sessions_old.tab_uuid, tab_sessions_old.session_data, tab_sessions_old.uncompressed_session_data_size FROM tab_sessions_old") != 101)
  {
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_5]();
    }
  }
  int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP TABLE tab_sessions_old");
  if (v7 != 101)
  {
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_5]();
    }
LABEL_17:
  }
  return v7;
}

- (int)_migrateToSchemaVersion_6
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE tabs ADD COLUMN tab_group_uuid TEXT NOT NULL DEFAULT ''");
  if (v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_6]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion_7
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE tabs ADD COLUMN profile_uuid TEXT NOT NULL DEFAULT ''");
  if (v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_7]();
    }
  }
  return v3;
}

- (int)_migrateToSchemaVersion_8
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE browser_windows ADD COLUMN active_profile_identifier TEXT NOT NULL DEFAULT ''");
  if (v3 != 101)
  {
    int v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_8]();
    }
  }
  return v3;
}

- (int)_recoverFromDatabaseInconsistencyFromSchemaVersion3Migration
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP TABLE IF EXISTS tab_sessions");
  if (v3 != 101)
  {
    int v6 = v3;
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _recoverFromDatabaseInconsistencyFromSchemaVersion3Migration]();
    }
    goto LABEL_16;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP TABLE IF EXISTS tabs_old");
  if (v4 != 101)
  {
    int v6 = v4;
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_3]();
    }
    goto LABEL_16;
  }
  int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DROP TABLE IF EXISTS tabs");
  if (v5 != 101)
  {
    int v6 = v5;
    uint64_t v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _recoverFromDatabaseInconsistencyFromSchemaVersion3Migration]();
    }
LABEL_16:

    return v6;
  }
  int v6 = [(SFBrowserStateSQLiteStore *)self _createTableForTabs];
  if (v6 != 101) {
    return v6;
  }

  return [(SFBrowserStateSQLiteStore *)self _createTableForTabSession];
}

- (int)_createTableForTabSession
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE tab_sessions (id INTEGER PRIMARY KEY AUTOINCREMENT,tab_uuid TEXT NOT NULL UNIQUE,session_data BLOB DEFAULT NULL,uncompressed_session_data_size INTEGER NOT NULL DEFAULT 0,FOREIGN KEY(tab_uuid) REFERENCES tabs(uuid) ON DELETE CASCADE ON UPDATE CASCADE)");
  if (v3 != 101)
  {
    int v4 = v3;
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _createTableForTabSession]();
    }
    goto LABEL_7;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE INDEX tab_sessions__uuid ON tab_sessions (tab_uuid)");
  if (v4 != 101)
  {
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _createTableForTabSession]();
    }
LABEL_7:
  }
  return v4;
}

- (int)_createTableForTabs
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE tabs (id INTEGER PRIMARY KEY AUTOINCREMENT,uuid TEXT NOT NULL UNIQUE,title TEXT,url TEXT COLLATE NOCASE,user_visible_url TEXT COLLATE NOCASE,order_index INTEGER NOT NULL,last_viewed_time REAL DEFAULT NULL,readinglist_bookmark_id INTEGER DEFAULT 0,opened_from_link BOOL DEFAULT 0,showing_reader BOOL DEFAULT 0,reader_view_top_scroll_offset INTEGER DEFAULT 0,private_browsing BOOL DEFAULT 0,displaying_standalone_image BOOL DEFAULT 0,browser_window_uuid TEXT NOT NULL,browser_window_id INTEGER NOT NULL,tab_group_uuid TEXT NOT NULL DEFAULT '',profile_uuid TEXT NOT NULL DEFAULT '',FOREIGN KEY(browser_window_id) REFERENCES browser_windows(id) ON DELETE CASCADE)");
  if (v3 != 101)
  {
    int v4 = v3;
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _createTableForTabs]();
    }
    goto LABEL_7;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE INDEX tabs__uuid ON tabs (uuid)");
  if (v4 != 101)
  {
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _createTableForTabSession]();
    }
LABEL_7:
  }
  return v4;
}

- (int)_createFreshDatabaseSchema
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE browser_windows (id INTEGER PRIMARY KEY AUTOINCREMENT,uuid TEXT NOT NULL,type INTEGER DEFAULT 0,active_document_index INTEGER DEFAULT 0,active_private_document_index INTEGER DEFAULT 0,active_document_is_valid BOOL DEFAULT 1,tab_state_successfully_loaded BOOL DEFAULT 0,legacy_plist_file_version INTEGER DEFAULT 0,scene_ID TEXT,active_profile_identifier TEXT NOT NULL DEFAULT '',CONSTRAINT uuid_type_index UNIQUE(uuid, type))");
  if (v3 != 101)
  {
    int v4 = v3;
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _createFreshDatabaseSchema]();
    }

    return v4;
  }
  int v4 = [(SFBrowserStateSQLiteStore *)self _createTableForTabs];
  if (v4 != 101) {
    return v4;
  }

  return [(SFBrowserStateSQLiteStore *)self _createTableForTabSession];
}

- (int)_migrateToSchemaVersion_4
{
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"ALTER TABLE browser_windows ADD COLUMN scene_id TEXT");
  if (v3 == 101)
  {
    return [(SFBrowserStateSQLiteStore *)self _mergeAllWindowsIfNeeded];
  }
  else
  {
    int v5 = v3;
    int v6 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _migrateToSchemaVersion_4]();
    }

    return v5;
  }
}

void __53__SFBrowserStateSQLiteStore__mergeAllWindowsIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SFBrowserStateSQLiteStore__mergeAllWindowsIfNeeded__block_invoke_2;
  v9[3] = &unk_1E54ED1C8;
  id v10 = *(id *)(a1 + 40);
  id v11 = v7;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v8 = v7;
  [v6 enumerateObjectsUsingBlock:v9];
}

void __53__SFBrowserStateSQLiteStore__mergeAllWindowsIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v13 = a3;
  id v6 = *(void **)(a1 + 32);
  *(void *)buf = [*(id *)(a1 + 40) databaseID];
  id v12 = [*(id *)(a1 + 40) UUIDString];
  unsigned int v11 = [v5 intValue];
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,unsigned long &,long,NSString * {__strong},int>(v6, &v13, buf, &v12, &v11);

  int v7 = [*(id *)(a1 + 32) execute];
  if (v7 != 101)
  {
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = [v5 intValue];
      id v10 = [*(id *)(*(void *)(a1 + 48) + 16) lastErrorMessage];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      __int16 v17 = 1024;
      int v18 = v7;
      _os_log_error_impl(&dword_18C354000, v8, OS_LOG_TYPE_ERROR, "Failed to update tab id %d: %{public}@ (%d)", buf, 0x18u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  [*(id *)(a1 + 32) reset];
}

id __53__SFBrowserStateSQLiteStore__mergeAllWindowsIfNeeded__block_invoke_132(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "databaseID"));

  return v3;
}

- (BOOL)updateSceneID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  MEMORY[0x192F95920](v11, @"com.apple.SafariServices.SavingBrowserState");
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__SFBrowserStateSQLiteStore_updateSceneID___block_invoke;
  v8[3] = &unk_1E54ED238;
  v8[4] = self;
  id v9 = v4;
  id v10 = &v12;
  id v6 = v4;
  dispatch_sync(databaseQueue, v8);
  LOBYTE(self) = *((unsigned char *)v13 + 24);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v11);
  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __43__SFBrowserStateSQLiteStore_updateSceneID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 40);
  int v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v9 = [*(id *)(a1 + 40) sceneID];
  id v8 = [*v2 UUIDString];
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},NSString * {__strong}>(v3, 0, @"UPDATE browser_windows SET scene_id = ? WHERE uuid = ?", &v9, &v8);

  if (v4 != 101)
  {
    id v5 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 40) UUID];
      int v7 = [*(id *)(*(void *)(a1 + 32) + 16) lastErrorMessage];
      *(_DWORD *)buf = 138412802;
      unsigned int v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      __int16 v14 = 1024;
      int v15 = v4;
      _os_log_error_impl(&dword_18C354000, v5, OS_LOG_TYPE_ERROR, "Failed to update scene_id for window with UUID = %@: %{public}@ (%d)", buf, 0x1Cu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)closeDatabase
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SFBrowserStateSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E54EB768;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __42__SFBrowserStateSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDatabase];
}

- (void)deleteRecentlyClosedWindowsWithProfileIdentifier:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__SFBrowserStateSQLiteStore_deleteRecentlyClosedWindowsWithProfileIdentifier___block_invoke;
  v7[3] = &unk_1E54ED128;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __78__SFBrowserStateSQLiteStore_deleteRecentlyClosedWindowsWithProfileIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  MEMORY[0x192F95920](v7, @"com.apple.SafariServices.SavingBrowserState");
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  *(void *)buf = 2;
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<SFBrowserWindowType,NSString * const {__strong}&>(v2, 0, @"DELETE FROM browser_windows WHERE type = ? AND active_profile_identifier = ?", buf, (void *)(a1 + 40));
  if (v3 != 101)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = [*(id *)(*(void *)(a1 + 32) + 16) lastErrorMessage];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v5;
      __int16 v9 = 2114;
      id v10 = v6;
      __int16 v11 = 1024;
      int v12 = v3;
      _os_log_error_impl(&dword_18C354000, v4, OS_LOG_TYPE_ERROR, "Failed to remove recently closed windows (Profile: %{public}@) from BrowserState.db: %{public}@ (%d)", buf, 0x1Cu);
    }
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v7);
}

- (void)_removeSavedSessionStateDataForTabsWithUUIDStrings:(id)a3
{
  v10[6] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  MEMORY[0x192F95920](v10, @"com.apple.SafariServices.SavingBrowserState");
  database = self->_database;
  id v6 = NSString;
  int v7 = [v4 componentsJoinedByString:@"', '"];
  id v8 = [v6 stringWithFormat:@"DELETE FROM tab_sessions WHERE tab_uuid IN ('%@')", v7];
  LODWORD(database) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v8);

  if (database != 101)
  {
    __int16 v9 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _removeSavedSessionStateDataForTabsWithUUIDStrings:]();
    }
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v10);
}

- (void)removeSavedSessionStateDataForTabsWithUUIDStrings:(id)a3
{
  id v3 = a3;
  operator new();
}

id *__79__SFBrowserStateSQLiteStore_removeSavedSessionStateDataForTabsWithUUIDStrings___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeSavedSessionStateDataForTabsWithUUIDStrings:*(void *)(a1 + 40)];
  uint64_t result = *(id **)(a1 + 48);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    JUMPOUT(0x192F95940);
  }
  return result;
}

- (void)saveTabStateWithDictionary:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SFBrowserStateSQLiteStore_saveTabStateWithDictionary___block_invoke;
  id v7[3] = &unk_1E54ED128;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

void __56__SFBrowserStateSQLiteStore_saveTabStateWithDictionary___block_invoke(uint64_t a1)
{
  id v2 = [[SFTabStateData alloc] initWithDictionaryRepresentation:*(void *)(a1 + 32)];
  if ((objc_msgSend(*(id *)(a1 + 40), "_updateTabStateWithData:") & 1) == 0) {
    [*(id *)(a1 + 40) _insertTabStateWithData:v2];
  }
}

- (id)tabStateDataForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__9;
  uint64_t v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SFBrowserStateSQLiteStore_tabStateDataForUUID___block_invoke;
  block[3] = &unk_1E54ED288;
  id v10 = v4;
  __int16 v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__SFBrowserStateSQLiteStore_tabStateDataForUUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _tabStateDataForUUID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_tabStateDataForUUID:(id)a3
{
  id v4 = a3;
  database = self->_database;
  id v11 = [v4 UUIDString];
  id v6 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}>(database, @"SELECT tabs.id, tabs.uuid, tabs.title, tabs.url, tabs.user_visible_url, tabs.order_index, tabs.last_viewed_time, tabs.readinglist_bookmark_id, tabs.opened_from_link, tabs.showing_reader, tabs.reader_view_top_scroll_offset, tabs.private_browsing, tabs.displaying_standalone_image, tabs.browser_window_uuid, tabs.tab_group_uuid, tabs.profile_uuid FROM tabs WHERE uuid = ?", &v11);

  id v7 = [v6 nextObject];
  if (v7) {
    id v8 = [[SFTabStateData alloc] initWithSQLiteRow:v7];
  }
  else {
    id v8 = 0;
  }

  __int16 v9 = [v6 statement];
  [v9 invalidate];

  return v8;
}

- (void)readTabStatesWithBrowserWindowUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SFBrowserStateSQLiteStore_readTabStatesWithBrowserWindowUUID_completion___block_invoke;
  block[3] = &unk_1E54EB140;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

uint64_t __75__SFBrowserStateSQLiteStore_readTabStatesWithBrowserWindowUUID_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readTabStatesWithBrowserWindowUUID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_readTabStatesWithBrowserWindowUUID:(id)a3 completion:(id)a4
{
  id v30 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_database, @"SELECT * FROM browser_windows WHERE uuid = ?", &v30);
  id v8 = [v7 nextObject];
  if (v8)
  {
    id v9 = [[_SFBrowserWindowStateData alloc] initWithSQLiteRow:v8];
    id v10 = [(_SFBrowserWindowStateData *)v9 dictionaryRepresentation];
    id v28 = (void *)[v10 mutableCopy];

    id v11 = [v7 statement];
    [v11 invalidate];

    database = self->_database;
    uint64_t v29 = [(_SFBrowserWindowStateData *)v9 databaseID];
    id v13 = SafariShared::WBSSQLiteDatabaseFetch<long>(database, @"SELECT tabs.id, tabs.uuid, tabs.title, tabs.url, tabs.user_visible_url, tabs.order_index, tabs.last_viewed_time, tabs.readinglist_bookmark_id, tabs.opened_from_link, tabs.showing_reader, tabs.reader_view_top_scroll_offset, tabs.private_browsing, tabs.displaying_standalone_image, tabs.browser_window_uuid, tabs.tab_group_uuid, tabs.profile_uuid FROM tabs WHERE browser_window_id = ? ORDER BY tabs.order_index ASC", &v29);
    uint64_t v27 = v8;
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v26 = v6;
    int v15 = [MEMORY[0x1E4F1CA48] array];
    while (1)
    {
      uint64_t v16 = [v13 nextObject];
      if (!v16) {
        break;
      }
      id v17 = [[SFTabStateData alloc] initWithSQLiteRow:v16];
      int v18 = [(SFTabStateData *)v17 owningBrowserWindowUUIDString];

      if (!v18)
      {
        uint64_t v19 = [(_SFBrowserWindowStateData *)v9 UUIDString];
        [(SFTabStateData *)v17 setOwningBrowserWindowUUIDString:v19];
      }
      [(SFBrowserStateSQLiteStore *)self _cacheUUIDForTabStateData:v17];
      if ([(SFTabStateData *)v17 privateBrowsing]) {
        uint64_t v20 = v15;
      }
      else {
        uint64_t v20 = v14;
      }
      id v21 = v20;
      uint64_t v22 = [(SFTabStateData *)v17 dictionaryRepresentation];
      [v21 addObject:v22];
    }
    id v6 = v26;
    [v28 setObject:v14 forKeyedSubscript:@"SafariStateDocuments"];
    [v28 setObject:v15 forKeyedSubscript:@"SafariStatePrivateDocuments"];
    uint64_t v23 = [v13 statement];
    [v23 invalidate];

    uint64_t v24 = [(_SFBrowserWindowStateData *)v9 databaseID];
    uint64_t v25 = [(_SFBrowserWindowStateData *)v9 UUIDString];
    [(SFBrowserStateSQLiteStore *)self _setDatabaseID:v24 browserWindow:v25];

    v6[2](v6, v28);
    id v8 = v27;
  }
  else
  {
    v6[2](v6, 0);
    id v9 = [v7 statement];
    [(_SFBrowserWindowStateData *)v9 invalidate];
  }
}

- (id)tabStatesWithBrowserWindowUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__9;
  uint64_t v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SFBrowserStateSQLiteStore_tabStatesWithBrowserWindowUUID___block_invoke;
  block[3] = &unk_1E54ED238;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(databaseQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __60__SFBrowserStateSQLiteStore_tabStatesWithBrowserWindowUUID___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__SFBrowserStateSQLiteStore_tabStatesWithBrowserWindowUUID___block_invoke_2;
  v4[3] = &unk_1E54ED2B0;
  v4[4] = a1[6];
  return [v2 _readTabStatesWithBrowserWindowUUID:v1 completion:v4];
}

void __60__SFBrowserStateSQLiteStore_tabStatesWithBrowserWindowUUID___block_invoke_2(uint64_t a1, void *a2)
{
}

- (int64_t)_saveBrowserWindowStateWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_SFBrowserWindowStateData alloc] initWithDictionaryRepresentation:v4];
  int64_t v6 = [(SFBrowserStateSQLiteStore *)self _saveBrowserWindowStateWithData:v5];

  return v6;
}

- (int64_t)_saveBrowserWindowStateWithData:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  MEMORY[0x192F95920](v21, @"com.apple.SafariServices.SavingBrowserState");
  uint64_t v5 = [v4 UUIDString];
  int64_t v6 = [(SFBrowserStateSQLiteStore *)self _databaseIDForBrowserWindow:v5];

  int64_t v20 = v6;
  database = self->_database;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v17 = [v4 UUIDString];
    id v16 = [v4 sceneID];
    v22[0] = [v4 activeDocumentIndex];
    uint64_t v19 = [v4 activePrivateDocumentIndex];
    uint64_t v18 = [v4 legacyPlistFileVersion];
    uint64_t v15 = [v4 type];
    id v14 = [v4 activeProfileIdentifier];
    int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},NSString * {__strong},long,long,long,SFBrowserWindowType,NSString * {__strong}>(database, 0, @"INSERT INTO browser_windows (uuid, scene_id, active_document_index, active_private_document_index, legacy_plist_file_version, type, active_profile_identifier) VALUES (?, ?, ?, ?, ?, ?, ?)", &v17, &v16, v22, &v19, &v18, &v15, &v14);

    if (v8 == 101)
    {
      int64_t v9 = [(WBSSQLiteDatabase *)self->_database lastInsertRowID];
      id v10 = [v4 UUIDString];
      [(SFBrowserStateSQLiteStore *)self _setDatabaseID:v9 browserWindow:v10];
    }
    else
    {
      uint64_t v12 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[SFBrowserStateSQLiteStore _saveBrowserWindowStateWithData:]();
      }

      int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v22[0] = [v4 activeDocumentIndex];
    uint64_t v19 = [v4 activePrivateDocumentIndex];
    uint64_t v18 = [v4 type];
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long,long,SFBrowserWindowType,long &>(database, 0, @"UPDATE browser_windows SET active_document_index = ?, active_private_document_index = ?, type = ? WHERE id = ?", v22, &v19, &v18, &v20) != 101)
    {
      id v11 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
        objc_claimAutoreleasedReturnValue();
        -[SFBrowserStateSQLiteStore _saveBrowserWindowStateWithData:]();
      }
    }
    int64_t v9 = v20;
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v21);

  return v9;
}

- (void)_updateOrInsertTabStateWithData:(id)a3
{
  id v4 = a3;
  if (([v4 skipUpdate] & 1) == 0
    && (![(SFBrowserStateSQLiteStore *)self _isTabStateCached:v4]
     || ![(SFBrowserStateSQLiteStore *)self _updateTabStateWithData:v4]))
  {
    [(SFBrowserStateSQLiteStore *)self _insertTabStateWithData:v4];
  }
}

- (BOOL)_updateTabStateWithData:(id)a3
{
  id v4 = a3;
  MEMORY[0x192F95920](v18, @"com.apple.SafariServices.SavingBrowserState");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__SFBrowserStateSQLiteStore__updateTabStateWithData___block_invoke;
  aBlock[3] = &unk_1E54ED2D8;
  aBlock[4] = self;
  id v5 = v4;
  id v17 = v5;
  int64_t v6 = _Block_copy(aBlock);
  int v7 = [v5 skipSavingSessionState];
  int v8 = (uint64_t (*)(void *))v6[2];
  if (v7)
  {
    int v9 = v8(v6);
  }
  else
  {
    if (v8(v6) != 101)
    {
LABEL_7:
      BOOL v11 = 0;
      goto LABEL_8;
    }
    database = self->_database;
    id v15 = [v5 sessionStateData];
    uint64_t v14 = [v5 uncompressedSessionStateDataSize];
    id v13 = [v5 UUIDString];
    int v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSData * {__strong},unsigned long,NSString * {__strong}>(database, 0, @"UPDATE tab_sessions SET session_data = ?, uncompressed_session_data_size = ?WHERE tab_uuid = ?", &v15, &v14, &v13);
  }
  if (v9 != 101) {
    goto LABEL_7;
  }
  [(SFBrowserStateSQLiteStore *)self _cacheUUIDForTabStateData:v5];
  BOOL v11 = 1;
LABEL_8:

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v18);
  return v11;
}

uint64_t __53__SFBrowserStateSQLiteStore__updateTabStateWithData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v21 = [*(id *)(a1 + 40) title];
  id v20 = [*(id *)(a1 + 40) url];
  id v19 = [*(id *)(a1 + 40) userVisibleURL];
  uint64_t v18 = [*(id *)(a1 + 40) orderIndex];
  [*(id *)(a1 + 40) lastViewedTime];
  uint64_t v17 = v3;
  unsigned int v16 = [*(id *)(a1 + 40) readingListBookmarkID];
  unsigned __int8 v15 = [*(id *)(a1 + 40) wasOpenedFromLink];
  unsigned __int8 v14 = [*(id *)(a1 + 40) showingReader];
  uint64_t v13 = [*(id *)(a1 + 40) readerViewTopScrollOffset];
  unsigned __int8 v12 = [*(id *)(a1 + 40) privateBrowsing];
  unsigned __int8 v11 = [*(id *)(a1 + 40) displayingStandaloneImage];
  id v10 = [*(id *)(a1 + 40) owningBrowserWindowUUIDString];
  uint64_t v9 = [*(id *)(a1 + 40) owningBrowserWindowDatabaseID];
  id v8 = [*(id *)(a1 + 40) tabGroupUUID];
  id v7 = [*(id *)(a1 + 40) profileIdentifier];
  id v6 = [*(id *)(a1 + 40) UUIDString];
  uint64_t v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong},NSString * {__strong},NSString * {__strong},long,double,int,BOOL,BOOL,long,BOOL,BOOL,NSString * {__strong},long,NSString * {__strong},NSString * {__strong},NSString * {__strong}>(v2, 0, @"UPDATE tabs SET title = ?, url = ?, user_visible_url = ?, order_index = ?, last_viewed_time = ?, readinglist_bookmark_id = ?, opened_from_link = ?, showing_reader = ?, reader_view_top_scroll_offset = ?, private_browsing = ?, displaying_standalone_image = ?, browser_window_uuid = ?, browser_window_id = ?, tab_group_uuid = ?, profile_uuid = ?WHERE uuid = ?", &v21, &v20, &v19, &v18, (double *)&v17, &v16, &v15, &v14, &v13, &v12, &v11, &v10, &v9, &v8, &v7, &v6);

  return v4;
}

- (void)_insertTabStateWithData:(id)a3
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  MEMORY[0x192F95920](v26, @"com.apple.SafariServices.SavingBrowserState");
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database, @"INSERT INTO tabs (uuid, title, url, user_visible_url, order_index, last_viewed_time, readinglist_bookmark_id, opened_from_link, showing_reader, reader_view_top_scroll_offset, private_browsing, displaying_standalone_image, browser_window_uuid, browser_window_id, tab_group_uuid, profile_uuid)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" query];
  id v25 = [v4 UUIDString];
  id v24 = [v4 title];
  id v23 = [v4 url];
  id v22 = [v4 userVisibleURL];
  v28[0] = [v4 orderIndex];
  [v4 lastViewedTime];
  v27[0] = v6;
  unsigned int v21 = [v4 readingListBookmarkID];
  unsigned __int8 v20 = [v4 wasOpenedFromLink];
  unsigned __int8 v19 = [v4 showingReader];
  uint64_t v18 = [v4 readerViewTopScrollOffset];
  unsigned __int8 v17 = [v4 privateBrowsing];
  unsigned __int8 v16 = [v4 displayingStandaloneImage];
  id v15 = [v4 owningBrowserWindowUUIDString];
  uint64_t v14 = [v4 owningBrowserWindowDatabaseID];
  id v13 = [v4 tabGroupUUID];
  id v12 = [v4 profileIdentifier];
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},NSString * {__strong},NSString * {__strong},NSString * {__strong},long,double,int,BOOL,BOOL,long,BOOL,BOOL,NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v5, &v25, &v24, &v23, &v22, v28, v27, &v21, &v20, &v19, &v18, &v17, &v16, &v15, &v14, &v13, &v12);

  if ([v5 execute] == 101)
  {
    [(SFBrowserStateSQLiteStore *)self _cacheUUIDForTabStateData:v4];
  }
  else
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _insertTabStateWithData:]();
    }
  }
  [v5 invalidate];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database, @"INSERT INTO tab_sessions (tab_uuid, session_data, uncompressed_session_data_size)VALUES (?, ?, ?)" query];
  id v11 = [v4 UUIDString];
  id v10 = [v4 sessionStateData];
  *(void *)&v27[0] = [v4 uncompressedSessionStateDataSize];
  SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},NSData * {__strong},unsigned long>(v8, &v11, &v10, v27);

  if ([v8 execute] != 101)
  {
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      -[SFBrowserStateSQLiteStore _insertTabStateWithData:]();
    }
  }
  [v8 invalidate];

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v26);
}

- (id)_sqliteStatementForTabDeleting
{
  cachedTabDeleteStatement = self->_cachedTabDeleteStatement;
  if (!cachedTabDeleteStatement)
  {
    id v4 = (WBSSQLiteStatement *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:self->_database query:@"DELETE FROM tabs WHERE uuid = ?"];
    id v5 = self->_cachedTabDeleteStatement;
    self->_cachedTabDeleteStatement = v4;

    cachedTabDeleteStatement = self->_cachedTabDeleteStatement;
  }

  return cachedTabDeleteStatement;
}

- (void)_updateBrowserWindowStateWithDictionary:(id)a3
{
  v26[6] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  MEMORY[0x192F95920](v26, @"com.apple.SafariServices.SavingBrowserState");
  int64_t v5 = [(SFBrowserStateSQLiteStore *)self _saveBrowserWindowStateWithDictionary:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v6 = objc_msgSend(v4, "safari_stringForKey:", @"SafariStateBrowserWindowUUID");
    id v7 = objc_msgSend(v4, "safari_arrayForKey:", @"SafariStateDocuments");
    id v8 = (void *)[v7 mutableCopy];

    uint64_t v9 = objc_msgSend(v4, "safari_arrayForKey:", @"SafariStatePrivateDocuments");
    [v8 addObjectsFromArray:v9];

    if ([v8 count])
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"BEGIN TRANSACTION") == 101)
      {
        id v10 = [v8 firstObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v12 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_200);
        }
        else
        {
          id v12 = v8;
        }
        id v13 = v12;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_2;
        v22[3] = &unk_1E54ED320;
        id v14 = v6;
        id v24 = self;
        int64_t v25 = v5;
        id v23 = v14;
        [v13 enumerateObjectsUsingBlock:v22];
        if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"COMMIT TRANSACTION") == 101)
        {
          id v15 = [v13 safari_mapAndFilterObjectsUsingBlock:&__block_literal_global_205];
          unsigned __int8 v16 = [(SFBrowserStateSQLiteStore *)self _tabUUIDsInWindow:v14];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_2_206;
          v20[3] = &unk_1E54ED368;
          unsigned __int8 v17 = v15;
          unsigned int v21 = v17;
          uint64_t v18 = [v16 objectsPassingTest:v20];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_3;
          v19[3] = &unk_1E54ED390;
          v19[4] = self;
          [v18 enumerateObjectsUsingBlock:v19];
          [v16 minusSet:v18];
        }
        else
        {
          unsigned __int8 v17 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[SFBrowserStateSQLiteStore _updateBrowserWindowStateWithDictionary:]();
          }
        }
      }
      else
      {
        id v13 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[SFBrowserStateSQLiteStore _updateBrowserWindowStateWithDictionary:]();
        }
      }
    }
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v26);
}

SFTabStateData *__69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[SFTabStateData alloc] initWithDictionaryRepresentation:v2];

  return v3;
}

void __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 owningBrowserWindowUUIDString];

  if (!v3) {
    [v4 setOwningBrowserWindowUUIDString:*(void *)(a1 + 32)];
  }
  if ([v4 owningBrowserWindowDatabaseID] != *(void *)(a1 + 48)) {
    objc_msgSend(v4, "setOwningBrowserWindowDatabaseID:");
  }
  [*(id *)(a1 + 40) _updateOrInsertTabStateWithData:v4];
}

id __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_202(uint64_t a1, void *a2)
{
  id v2 = [a2 UUIDString];

  return v2;
}

uint64_t __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_2_206(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __69__SFBrowserStateSQLiteStore__updateBrowserWindowStateWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) _sqliteStatementForTabDeleting];
  [v3 bindString:v4 atParameterIndex:1];
  [v3 execute];
  [v3 reset];
}

- (void)_updateBrowserWindowWithData:(id)a3 tabs:(id)a4
{
  v13[6] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  MEMORY[0x192F95920](v13, @"com.apple.SafariServices.SavingBrowserState");
  int64_t v8 = [(SFBrowserStateSQLiteStore *)self _saveBrowserWindowStateWithData:v6];
  if (v7)
  {
    int64_t v9 = v8;
    if ([v6 needsQuickUpdate])
    {
      if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"BEGIN TRANSACTION") == 101)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __63__SFBrowserStateSQLiteStore__updateBrowserWindowWithData_tabs___block_invoke;
        v12[3] = &unk_1E54ED3B8;
        v12[4] = self;
        v12[5] = v9;
        [v7 enumerateObjectsUsingBlock:v12];
        if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"COMMIT TRANSACTION") != 101)
        {
          id v10 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
            objc_claimAutoreleasedReturnValue();
            -[SFBrowserStateSQLiteStore _updateBrowserWindowStateWithDictionary:]();
          }
        }
      }
      else
      {
        id v11 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          [(WBSSQLiteDatabase *)self->_database lastErrorMessage];
          objc_claimAutoreleasedReturnValue();
          -[SFBrowserStateSQLiteStore _updateBrowserWindowStateWithDictionary:]();
        }
      }
    }
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v13);
}

void __63__SFBrowserStateSQLiteStore__updateBrowserWindowWithData_tabs___block_invoke(uint64_t a1, void *a2)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  id v6 = [v3 UUIDString];
  id v7 = (void *)[v5 initWithUUIDString:v6];
  int64_t v8 = [v4 _tabStateDataForUUID:v7];

  if (!v8)
  {
    [v3 setOwningBrowserWindowDatabaseID:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _insertTabStateWithData:v3];
  }
  int64_t v9 = *(void **)(*(void *)(a1 + 32) + 16);
  v13[0] = [v3 orderIndex];
  id v12 = [v3 owningBrowserWindowUUIDString];
  id v11 = [v3 UUIDString];
  LODWORD(v9) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long,NSString * {__strong},long const&,NSString * {__strong}>(v9, 0, @"UPDATE tabs SET order_index = ?, browser_window_uuid = ?, browser_window_id = ?WHERE uuid = ?", v13, &v12, (void *)(a1 + 40), &v11);

  if (v9 == 101)
  {
    [*(id *)(a1 + 32) _cacheUUIDForTabStateData:v3];
  }
  else
  {
    id v10 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 16) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __63__SFBrowserStateSQLiteStore__updateBrowserWindowWithData_tabs___block_invoke_cold_1();
    }
  }
}

- (void)updateBrowserWindowWithData:(id)a3 tabs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SFBrowserStateSQLiteStore_updateBrowserWindowWithData_tabs___block_invoke;
  block[3] = &unk_1E54ED3E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

uint64_t __62__SFBrowserStateSQLiteStore_updateBrowserWindowWithData_tabs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBrowserWindowWithData:*(void *)(a1 + 40) tabs:*(void *)(a1 + 48)];
}

- (id)_tabUUIDsInWindow:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_tabUUIDStrings objectForKey:v4];

  if (!v5)
  {
    tabUUIDStrings = self->_tabUUIDStrings;
    id v7 = [MEMORY[0x1E4F1CA80] set];
    [(NSMutableDictionary *)tabUUIDStrings setObject:v7 forKey:v4];
  }
  int64_t v8 = [(NSMutableDictionary *)self->_tabUUIDStrings objectForKey:v4];

  return v8;
}

- (void)_cacheUUIDForTabStateData:(id)a3
{
  id v4 = a3;
  if (![(SFBrowserStateSQLiteStore *)self _isTabStateCached:v4])
  {
    tabUUIDStrings = self->_tabUUIDStrings;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__SFBrowserStateSQLiteStore__cacheUUIDForTabStateData___block_invoke;
    v10[3] = &unk_1E54ED408;
    id v6 = v4;
    id v11 = v6;
    [(NSMutableDictionary *)tabUUIDStrings enumerateKeysAndObjectsUsingBlock:v10];
    id v7 = [v6 owningBrowserWindowUUIDString];
    int64_t v8 = [(SFBrowserStateSQLiteStore *)self _tabUUIDsInWindow:v7];
    id v9 = [v6 UUIDString];
    [v8 addObject:v9];
  }
}

void __55__SFBrowserStateSQLiteStore__cacheUUIDForTabStateData___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  int64_t v8 = [*(id *)(a1 + 32) owningBrowserWindowUUIDString];
  if ([v12 isEqualToString:v8])
  {
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) UUIDString];
    int v10 = [v7 containsObject:v9];

    if (v10)
    {
      id v11 = [*(id *)(a1 + 32) UUIDString];
      [v7 removeObject:v11];

      *a4 = 1;
    }
  }
}

- (BOOL)_isTabStateCached:(id)a3
{
  id v4 = a3;
  id v5 = [v4 owningBrowserWindowUUIDString];
  id v6 = [(SFBrowserStateSQLiteStore *)self _tabUUIDsInWindow:v5];
  id v7 = [v4 UUIDString];
  char v8 = [v6 containsObject:v7];

  return v8;
}

- (void)_setDatabaseID:(int64_t)a3 browserWindow:(id)a4
{
  id v8 = a4;
  browserWindowDatabaseIDs = self->_browserWindowDatabaseIDs;
  id v7 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)browserWindowDatabaseIDs setObject:v7 forKey:v8];
}

- (int64_t)_databaseIDForBrowserWindow:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_browserWindowDatabaseIDs objectForKey:a3];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)updateBrowserWindowStateWithDictionary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SFBrowserStateSQLiteStore_updateBrowserWindowStateWithDictionary_completion___block_invoke;
  block[3] = &unk_1E54EB140;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

uint64_t __79__SFBrowserStateSQLiteStore_updateBrowserWindowStateWithDictionary_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateBrowserWindowStateWithDictionary:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)_readSavedSessionStateDataForTabWithUUIDString:(id)a3
{
  id v11 = a3;
  id v4 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_database, @"SELECT tab_sessions.uncompressed_session_data_size, tab_sessions.session_data FROM tab_sessions WHERE tab_sessions.tab_uuid = ?", &v11);
  int64_t v5 = [v4 nextObject];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 intAtIndex:0];
    id v8 = [v6 dataAtIndex:1];
    id v9 = +[SFTabStateData uncompressedDataWithRawData:v8 uncompressedSize:v7];
  }
  else
  {
    id v8 = [v4 statement];
    [v8 invalidate];
    id v9 = 0;
  }

  return v9;
}

- (id)readSavedSessionStateDataForTabWithUUIDString:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__9;
  unsigned __int8 v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SFBrowserStateSQLiteStore_readSavedSessionStateDataForTabWithUUIDString___block_invoke;
  block[3] = &unk_1E54ED288;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(databaseQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __75__SFBrowserStateSQLiteStore_readSavedSessionStateDataForTabWithUUIDString___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _readSavedSessionStateDataForTabWithUUIDString:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)deleteTabStateWithBrowserWindowUUID:(id)a3 andRemoveWindow:(BOOL)a4
{
  id v4 = a3;
  operator new();
}

id *__81__SFBrowserStateSQLiteStore_deleteTabStateWithBrowserWindowUUID_andRemoveWindow___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _databaseIDForBrowserWindow:*(void *)(a1 + 40)];
  int v3 = *(unsigned __int8 *)(a1 + 56);
  id v4 = objc_alloc(MEMORY[0x1E4F97FA0]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v3)
  {
    id v6 = (void *)[v4 initWithDatabase:v5 query:@"DELETE FROM browser_windows WHERE id = ?"];
    [v6 bindInt64:v2 atParameterIndex:1];
    [v6 execute];
    [v6 invalidate];
    [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = (void *)[v4 initWithDatabase:v5 query:@"DELETE FROM tabs WHERE browser_window_id = ?"];
    [v6 bindInt64:v2 atParameterIndex:1];
    [v6 execute];
    [v6 invalidate];
  }

  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t result = *(id **)(a1 + 48);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    JUMPOUT(0x192F95940);
  }
  return result;
}

- (void)updateTabWithTabStateData:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SFBrowserStateSQLiteStore_updateTabWithTabStateData___block_invoke;
  id v7[3] = &unk_1E54ED128;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __55__SFBrowserStateSQLiteStore_updateTabWithTabStateData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) owningBrowserWindowUUIDString];
  uint64_t v4 = [v2 _databaseIDForBrowserWindow:v3];

  if (v4 != [*(id *)(a1 + 40) owningBrowserWindowDatabaseID]) {
    [*(id *)(a1 + 40) setOwningBrowserWindowDatabaseID:v4];
  }
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);

  return [v5 _updateOrInsertTabStateWithData:v6];
}

- (void)removeTabWithTabData:(id)a3
{
  id v3 = a3;
  operator new();
}

void __50__SFBrowserStateSQLiteStore_removeTabWithTabData___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:*(void *)(*(void *)(a1 + 32) + 16) query:@"DELETE FROM tabs WHERE uuid = ?"];
  id v3 = [*(id *)(a1 + 40) UUIDString];
  [v2 bindString:v3 atParameterIndex:1];

  if ([v2 execute] != 101)
  {
    uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 16) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __50__SFBrowserStateSQLiteStore_removeTabWithTabData___block_invoke_cold_1();
    }
  }
  [v2 invalidate];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) owningBrowserWindowUUIDString];
  id v7 = [v5 _tabUUIDsInWindow:v6];
  id v8 = [*(id *)(a1 + 40) UUIDString];
  [v7 removeObject:v8];

  id v9 = *(id **)(a1 + 48);
  if (v9)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v9);
    MEMORY[0x192F95940]();
  }
}

- (void)deleteSavedStatesForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SFBrowserStateSQLiteStore_deleteSavedStatesForProfileWithIdentifier___block_invoke;
  id v7[3] = &unk_1E54ED128;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(databaseQueue, v7);
}

void __71__SFBrowserStateSQLiteStore_deleteSavedStatesForProfileWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x192F95920](v7, @"com.apple.SafariServices.SavingBrowserState");
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:*(void *)(*(void *)(a1 + 32) + 16) query:@"DELETE FROM browser_windows WHERE active_profile_identifier = ?"];
  [v2 bindString:*(void *)(a1 + 40) atParameterIndex:1];
  int v3 = [v2 execute];
  if (v3 != 101)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) lastErrorMessage];
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v9 = v5;
      __int16 v10 = 1024;
      int v11 = v3;
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      _os_log_error_impl(&dword_18C354000, v4, OS_LOG_TYPE_ERROR, "Failed to delete a profile window: %{public}@ (%d) (Profile: %{public}@)", buf, 0x1Cu);
    }
  }
  [v2 invalidate];
  [*(id *)(a1 + 32) _vacuum];

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v7);
}

- (void)checkPointWriteAheadLog
{
}

id *__52__SFBrowserStateSQLiteStore_checkPointWriteAheadLog__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 16) checkpointWriteAheadLogWithLogFrameCount:(char *)&v7 + 4 checkpointedFrameCount:&v7] == 0;
  int v3 = WBS_LOG_CHANNEL_PREFIXStatePersistence();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v9 = HIDWORD(v7);
      __int16 v10 = 1024;
      int v11 = v7;
      _os_log_impl(&dword_18C354000, v4, OS_LOG_TYPE_INFO, "Checkpointed write ahead log. Log frame count: %d, checkpointed frame count: %d", buf, 0xEu);
    }
  }
  else
  {
    uint64_t v5 = v3;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(*(void *)(a1 + 32) + 16) lastErrorMessage];
      objc_claimAutoreleasedReturnValue();
      __52__SFBrowserStateSQLiteStore_checkPointWriteAheadLog__block_invoke_cold_1();
    }
  }
  uint64_t result = *(id **)(a1 + 40);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    return (id *)MEMORY[0x192F95940]();
  }
  return result;
}

- (void)setSecureDeleteEnabled:(BOOL)a3
{
  databaseQueue = self->_databaseQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__SFBrowserStateSQLiteStore_setSecureDeleteEnabled___block_invoke;
  v4[3] = &unk_1E54ED458;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(databaseQueue, v4);
}

void __52__SFBrowserStateSQLiteStore_setSecureDeleteEnabled___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  int v3 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2) {
    id v4 = @"PRAGMA secure_delete = ON";
  }
  else {
    id v4 = @"PRAGMA secure_delete = OFF";
  }
  int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, v4);
  if (v5 != 100)
  {
    int v6 = v5;
    uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXStatePersistence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(*(void *)(a1 + 32) + 16) lastErrorMessage];
      int v9 = *(unsigned __int8 *)(a1 + 40);
      int v10 = 138543874;
      int v11 = v8;
      __int16 v12 = 1024;
      int v13 = v6;
      __int16 v14 = 1024;
      int v15 = v9;
      _os_log_error_impl(&dword_18C354000, v7, OS_LOG_TYPE_ERROR, "Failed to toggle secure_delete pragma: %{public}@ (%d) (%d)", (uint8_t *)&v10, 0x18u);
    }
  }
}

- (void)_vacuum
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to vacuum database: %{public}@ (%d)", v4, v5);
}

- (void)regenerateTabUUIDsForDeviceRestoration
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SFBrowserStateSQLiteStore_regenerateTabUUIDsForDeviceRestoration__block_invoke;
  block[3] = &unk_1E54EB768;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __67__SFBrowserStateSQLiteStore_regenerateTabUUIDsForDeviceRestoration__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _regenerateTabUUIDsForDeviceRestoration];
}

- (void)_regenerateTabUUIDsForDeviceRestoration
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to regenerate tab UUIDs: %{public}@ (%d)", v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTabDeleteStatement, 0);
  objc_storeStrong((id *)&self->_browserWindowDatabaseIDs, 0);
  objc_storeStrong((id *)&self->_tabUUIDStrings, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_checkDatabaseIntegrity
{
}

- (void)_openDatabaseAndCheckIntegrity:(os_log_t)log .cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  v4[0] = 67109634;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = 8;
  __int16 v7 = 2114;
  uint64_t v8 = v3;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "BrowserState SQLite schema version (%d) does not match our supported schema version (%d) in store at %{public}@", (uint8_t *)v4, 0x18u);
}

- (void)_openDatabaseAndCheckIntegrity:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_openDatabaseAndCheckIntegrity:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_migrateFromLegacyPlistWithPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_migrateFromLegacyPlistWithPath:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_migrateToSchemaVersion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18C354000, v0, v1, "Failed to migrate the database to schema version %d", v2, v3, v4, v5, v6);
}

- (void)_migrateToSchemaVersion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18C354000, v0, v1, "Not migrating to an unsupported schema version %d", v2, v3, v4, v5, v6);
}

- (void)_migrateToSchemaVersion:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18C354000, v0, v1, "Failed to commit the transaction while migrating database to schema version %d", v2, v3, v4, v5, v6);
}

- (void)_migrateToSchemaVersion:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_migrateToSchemaVersion:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18C354000, v0, v1, "Failed to start a transaction while migrating database to schema version %d", v2, v3, v4, v5, v6);
}

void __53__SFBrowserStateSQLiteStore__migrateToSchemaVersion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_migrateToSchemaVersion_2
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to add uncompressed_session_data_size column to tabs table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_3
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to drop index in tabs table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_5
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to drop index in tab_sessions table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_6
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to add tab_group_uuid column: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_7
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to add profile_uuid column: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_8
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to add active_profile_identifier column: %{public}@ (%d)", v4, v5);
}

- (void)_recoverFromDatabaseInconsistencyFromSchemaVersion3Migration
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to drop tab_sessions table: %{public}@ (%d)", v4, v5);
}

- (void)_createTableForTabSession
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to create the tab_sessions table: %{public}@ (%d)", v4, v5);
}

- (void)_createTableForTabs
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to create the tabs table when removing session column: %{public}@ (%d)", v4, v5);
}

- (void)_createFreshDatabaseSchema
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to create the browser_windows table: %{public}@ (%d)", v4, v5);
}

- (void)_migrateToSchemaVersion_4
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to add scene_id column to browser_windows table: %{public}@ (%d)", v4, v5);
}

- (void)_mergeAllWindowsIfNeeded
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to reset scene_id column: %{public}@ (%d)", v4, v5);
}

void __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Merge all windows: failed to commit transaction: %{public}@ (%d)", v4, v5);
}

void __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Merge all windows: failed to roll back transaction: %{public}@ (%d)", v4, v5);
}

void __44__SFBrowserStateSQLiteStore_mergeAllWindows__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Merge all windows: failed to begin transaction: %{public}@ (%d)", v4, v5);
}

- (void)_removeSavedSessionStateDataForTabsWithUUIDStrings:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to remove saved session state data for Recently Closed Tab from BrowserState.db: %{public}@ (%d)", v4, v5);
}

- (void)_saveBrowserWindowStateWithData:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to insert browser window with UUID: %{public}@ (%d)", v4, v5);
}

- (void)_saveBrowserWindowStateWithData:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to update browser window with ID: %{public}@ (%d)", v4, v5);
}

- (void)_insertTabStateWithData:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to insert a tab session data into the tab_sessions table: %{public}@ (%d)", v4, v5);
}

- (void)_insertTabStateWithData:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to insert a tab into the tabs table: %@ (%d)", v4, v5);
}

- (void)_updateBrowserWindowStateWithDictionary:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to commit a transaction while updating tabs: %{public}@ (%d)", v4, v5);
}

- (void)_updateBrowserWindowStateWithDictionary:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to start a transaction while updating tabs: %{public}@ (%d)", v4, v5);
}

void __63__SFBrowserStateSQLiteStore__updateBrowserWindowWithData_tabs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to update a tab: %{public}@ (%d)", v4, v5);
}

void __50__SFBrowserStateSQLiteStore_removeTabWithTabData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to delete a tab: %{public}@ (%d)", v4, v5);
}

void __52__SFBrowserStateSQLiteStore_checkPointWriteAheadLog__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_4(&dword_18C354000, "Failed to checkpoint write ahead log: %{public}@ (%d)", v4, v5);
}

@end