@interface TRIAssetStoreDatabase
- (BOOL)addReferenceToAutoAssetId:(id)a3 forLifetimeOfPath:(id)a4;
- (BOOL)dropTableWithName:(id)a3 transaction:(id)a4;
- (BOOL)enumerateAllAutoAssetReferencesWithBlock:(id)a3;
- (BOOL)migrateToVersion:(unsigned int)a3;
- (BOOL)vacuum;
- (TRIAssetStoreDatabase)initWithPaths:(id)a3 assetStorePath:(id)a4 storageManagement:(id)a5;
- (TRIAssetStoreDatabase)initWithPaths:(id)a3 databasePath:(id)a4 storageManagement:(id)a5 performMigrations:(BOOL)a6;
- (TRIAssetStoreDatabase)initWithPaths:(id)a3 storageManagement:(id)a4;
- (id)databaseHandle;
- (id)initInMemoryAndPerformMigrations:(BOOL)a3;
- (id)migrations;
- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3;
- (void)_disableQueryPlanLogging;
- (void)_enableQueryPlanLogging;
- (void)_updateQueryPlanLogging;
- (void)closePermanently;
- (void)enumerateAssetIdsWithoutLiveReferencesUsingBlock:(id)a3;
- (void)enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock:(id)a3;
@end

@implementation TRIAssetStoreDatabase

- (TRIAssetStoreDatabase)initWithPaths:(id)a3 storageManagement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIAssetStoreDatabase.m", 54, @"Invalid parameter not satisfying: %@", @"paths" object file lineNumber description];
  }
  v9 = (void *)MEMORY[0x1E016E7F0]();
  v10 = [v7 assetStore];
  v11 = [v10 stringByAppendingPathComponent:@"assets.db"];

  v12 = [(TRIAssetStoreDatabase *)self initWithPaths:v7 databasePath:v11 storageManagement:v8 performMigrations:1];

  return v12;
}

- (TRIAssetStoreDatabase)initWithPaths:(id)a3 assetStorePath:(id)a4 storageManagement:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIAssetStoreDatabase.m", 65, @"Invalid parameter not satisfying: %@", @"paths" object file lineNumber description];
  }
  v12 = (void *)MEMORY[0x1E016E7F0]();
  v13 = [v10 stringByAppendingPathComponent:@"assets.db"];
  v14 = [(TRIAssetStoreDatabase *)self initWithPaths:v9 databasePath:v13 storageManagement:v11 performMigrations:1];

  return v14;
}

- (id)initInMemoryAndPerformMigrations:(BOOL)a3
{
  BOOL v3 = a3;
  v6 = (void *)MEMORY[0x1E016E7F0]();
  id v7 = [@"assets.db" stringByAppendingPathExtension:@"testing"];
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIAssetStoreDatabase.m", 75, @"Error adding extension on %@", @"assets.db" object file lineNumber description];
  }
  id v8 = [MEMORY[0x1E4F93BA0] randomlyNamedInMemoryPathWithBaseName:v7];
  id v9 = objc_opt_new();
  id v10 = [(TRIAssetStoreDatabase *)self initWithPaths:0 databasePath:v8 storageManagement:v9 performMigrations:v3];

  return v10;
}

- (TRIAssetStoreDatabase)initWithPaths:(id)a3 databasePath:(id)a4 storageManagement:(id)a5 performMigrations:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v12 = a4;
  id v46 = a5;
  if (!v12)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"TRIAssetStoreDatabase.m", 86, @"Invalid parameter not satisfying: %@", @"databasePath", v45, v46 object file lineNumber description];
  }
  v51.receiver = self;
  v51.super_class = (Class)TRIAssetStoreDatabase;
  v13 = [(TRIAssetStoreDatabase *)&v51 init];
  v14 = v13;
  if (!v13) {
    goto LABEL_24;
  }
  objc_storeStrong((id *)&v13->_paths, a3);
  objc_storeStrong((id *)&v14->_storageManagement, a5);
  p_databasePath = (id *)&v14->_databasePath;
  objc_storeStrong((id *)&v14->_databasePath, a4);
  if (([MEMORY[0x1E4F93BA0] isInMemoryPath:v14->_databasePath] & 1) == 0
    && [MEMORY[0x1E4F93B10] isClassCLocked])
  {
    v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Device has never been unlocked prior to db initialization.", (uint8_t *)&buf, 2u);
    }

    goto LABEL_35;
  }
  if (([MEMORY[0x1E4F93BA0] isInMemoryPath:*p_databasePath] & 1) != 0
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = [v17 fileExistsAtPath:*p_databasePath],
        v17,
        (v18 & 1) == 0))
  {
    if (([MEMORY[0x1E4F93BA0] isInMemoryPath:*p_databasePath] & 1) == 0)
    {
      v20 = [*p_databasePath stringByDeletingLastPathComponent];
      v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v21 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:0];
    }
    int v19 = 1;
  }
  else
  {
    int v19 = 0;
  }
  v22 = (void *)MEMORY[0x1E4F93BA0];
  databasePath = v14->_databasePath;
  v24 = [[TRISqliteErrorHandler alloc] initWithStorageManagement:v14->_storageManagement];
  id v50 = 0;
  uint64_t v25 = [v22 sqliteDatabaseWithFilename:databasePath contentProtection:3 errorHandler:v24 error:&v50];
  id v26 = v50;
  db = v14->_db;
  v14->_db = (_PASSqliteDatabase *)v25;

  if (!v14->_db)
  {
    v38 = TRILogCategory_Server();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v26;
      _os_log_error_impl(&dword_1DA291000, v38, OS_LOG_TYPE_ERROR, "Failed to instantiate new database handle: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_34;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__54;
  v57 = __Block_byref_object_dispose__54;
  id v58 = 0;
  v28 = v14->_db;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __88__TRIAssetStoreDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke;
  v49[3] = &unk_1E6BB8280;
  v49[4] = &buf;
  if (([(_PASSqliteDatabase *)v28 prepAndRunNonDataQueries:&unk_1F347B468 onError:v49] & 1) == 0)
  {
    v39 = TRILogCategory_Server();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v43 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v52 = 138543362;
      uint64_t v53 = v43;
      _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "Failed to run initial database pragmas: %{public}@", v52, 0xCu);
    }

    [(_PASSqliteDatabase *)v14->_db closePermanently];
    v40 = v14->_db;
    v14->_db = 0;

    if (v19 && ([MEMORY[0x1E4F93BA0] isInMemoryPath:*p_databasePath] & 1) == 0) {
      [MEMORY[0x1E4F93BA0] truncateDatabaseAtPath:*p_databasePath];
    }
    _Block_object_dispose(&buf, 8);

LABEL_34:
LABEL_35:
    v37 = 0;
    goto LABEL_36;
  }
  _Block_object_dispose(&buf, 8);

  if (v19)
  {
    v29 = TRILogCategory_Server();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = *p_databasePath;
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v30;
      _os_log_impl(&dword_1DA291000, v29, OS_LOG_TYPE_DEFAULT, "Created new database: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v31 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  defaults = v14->_defaults;
  v14->_defaults = (NSUserDefaults *)v31;

  uint64_t v33 = objc_opt_new();
  kvoHandler = v14->_kvoHandler;
  v14->_kvoHandler = (_PASKVOHandler *)v33;

  atomic_store(0, (unsigned __int8 *)&v14->_isQueryPlanLoggingEnabled);
  objc_initWeak((id *)&buf, v14);
  v35 = v14->_kvoHandler;
  v36 = v14->_defaults;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __88__TRIAssetStoreDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_60;
  v47[3] = &unk_1E6BBE218;
  objc_copyWeak(&v48, (id *)&buf);
  [(_PASKVOHandler *)v35 reactAfterChangesToKeyPath:@"queryPlanLoggingEnabled" ofObject:v36 usingBlock:v47];
  [(TRIAssetStoreDatabase *)v14 _updateQueryPlanLogging];
  if (v6 && ![(TRIAssetStoreDatabase *)v14 migrateToVersion:*MEMORY[0x1E4F93C18]])
  {
    v42 = TRILogCategory_Server();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v52 = 0;
      _os_log_error_impl(&dword_1DA291000, v42, OS_LOG_TYPE_ERROR, "TRIAssetStoreDatabase: migrations failed", v52, 2u);
    }

    objc_destroyWeak(&v48);
    objc_destroyWeak((id *)&buf);

    goto LABEL_35;
  }
  objc_destroyWeak(&v48);
  objc_destroyWeak((id *)&buf);

LABEL_24:
  v37 = v14;
LABEL_36:

  return v37;
}

uint64_t __88__TRIAssetStoreDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __88__TRIAssetStoreDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateQueryPlanLogging];
}

- (BOOL)vacuum
{
  return [(_PASSqliteDatabase *)self->_db prepAndRunNonDataQueries:&unk_1F347B480 onError:&__block_literal_global_31];
}

uint64_t __31__TRIAssetStoreDatabase_vacuum__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_error_impl(&dword_1DA291000, v3, OS_LOG_TYPE_ERROR, "TRIAssetStoreDatabase incremental vacuum failed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E4F93C10];
}

- (BOOL)dropTableWithName:(id)a3 transaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIAssetStoreDatabase.m", 184, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRIAssetStoreDatabase.m", 185, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = (void *)[[NSString alloc] initWithFormat:@"DROP TABLE %@;", v7];
  id v11 = [v9 db];
  char v12 = [v11 prepAndRunQuery:v10 onPrep:0 onRow:0 onError:0];

  return v12;
}

- (void)closePermanently
{
  [(_PASSqliteDatabase *)self->_db closePermanently];
  kvoHandler = self->_kvoHandler;
  self->_kvoHandler = 0;
}

- (void)_updateQueryPlanLogging
{
  id v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"queryPlanLoggingEnabled"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 BOOLValue]) {
    [(TRIAssetStoreDatabase *)self _enableQueryPlanLogging];
  }
  else {
    [(TRIAssetStoreDatabase *)self _disableQueryPlanLogging];
  }
}

- (void)_enableQueryPlanLogging
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E016E7F0](self, a2);
  paths = self->_paths;
  if (paths)
  {
    int v5 = [(TRIPaths *)paths logDir];
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];

    id v7 = objc_opt_new();
    [v7 setFormatOptions:51];
    id v8 = [NSString alloc];
    id v9 = objc_opt_new();
    id v10 = [v7 stringFromDate:v9];
    id v11 = [MEMORY[0x1E4F28F80] processInfo];
    char v12 = (void *)[v8 initWithFormat:@"assets-explainQueryPlan-%@-pid_%d-handle_%p.log", v10, objc_msgSend(v11, "processIdentifier"), self->_db];

    v13 = [v5 stringByAppendingPathComponent:v12];
    LODWORD(v11) = [(_PASSqliteDatabase *)self->_db enableQueryPlanLoggingWithPath:v13];
    v14 = TRILogCategory_Server();
    v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        v17 = v13;
        _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "TRIAssetStoreDatabase: generating EXPLAIN QUERY PLAN log at \"%{public}@\"", buf, 0xCu);
      }

      atomic_store(1u, (unsigned __int8 *)&self->_isQueryPlanLoggingEnabled);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        v17 = v13;
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "TRIAssetStoreDatabase: unable to generate EXPLAIN QUERY PLAN log at \"%{public}@\"", buf, 0xCu);
      }
    }
  }
  else
  {
    int v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Can't enable query plan logging, TRIPaths not available", buf, 2u);
    }
  }
}

- (void)_disableQueryPlanLogging
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(_PASSqliteDatabase *)self->_db disableQueryPlanLogging];
  if (atomic_exchange((atomic_uchar *volatile)&self->_isQueryPlanLoggingEnabled, 0))
  {
    id v3 = TRILogCategory_Server();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      db = self->_db;
      int v5 = 134217984;
      id v6 = db;
      _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "TRIAssetStoreDatabase: disable EXPLAIN QUERY PLAN log for handle %p", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)migrateToVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "TRIAssetStoreDatabase now performing migration.", buf, 2u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F93AF8]);
  v21[0] = self;
  BOOL v8 = 1;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v10 = (void *)[v7 initWithMigrationObjects:v9];

  uint64_t v11 = [v10 migrateDatabasesToVersion:v3];
  switch((int)v11)
  {
    case 0:
      v15 = TRILogCategory_Server();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_WORD *)long long buf = 0;
      v16 = "TRIAssetStoreDatabase could not perform migrations (device locked?), try again later.";
      goto LABEL_21;
    case 1:
      goto LABEL_19;
    case 2:
    case 4:
    case 5:
    case 6:
      char v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        int v20 = v11;
        _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "TRIAssetStoreDatabase got an unexpected and unrecoverable migration result of %u. Database is considered corrupt and Trial storage will be reset on next launch.", buf, 8u);
      }

      storageManagement = self->_storageManagement;
      if (storageManagement)
      {
        if ([(TRIStorageManagementProtocol *)storageManagement requestTrialStorageResetOnNextLaunch])
        {
          v14 = TRILogCategory_Server();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "TRIAssetStoreDatabase issuing triald exit request.", buf, 2u);
          }

          xpc_transaction_exit_clean();
        }
      }
      else
      {
        v15 = TRILogCategory_Server();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          v16 = "TRIAssetStoreDatabase is corrupt but no path for recovery due to nil _storageManagement.";
LABEL_21:
          _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
        }
LABEL_17:
      }
LABEL_18:
      BOOL v8 = 0;
LABEL_19:

      return v8;
    case 3:
      v15 = TRILogCategory_Server();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_WORD *)long long buf = 0;
      v16 = "TRIAssetStoreDatabase has a future schema version, cannot use database. (DID YOU DOWNGRADE YOUR OS WITHOUT A"
            "N ERASE-INSTALL??? THAT IS NOT SUPPORTED!!!)";
      goto LABEL_21;
    default:
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIAssetStoreDatabase.m", 278, @"Unhandled migration result: %u", v11);

      goto LABEL_18;
  }
}

- (id)databaseHandle
{
  return self->_db;
}

- (id)migrations
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @" CREATE TABLE maAutoAssets(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     type TEXT NOT NULL,     specifier TEXT NOT NULL,     version TEXT NOT NULL,     UNIQUE (type, specifier, version));";
  v5[1] = @" CREATE TABLE maAutoAssetPathRefs(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     maAutoAssets_rowid INTEGER NOT NULL,     path TEXT NOT NULL,     UNIQUE (maAutoAssets_rowid, path),     FOREIGN KEY (maAutoAssets_rowid) REFERENCES maAutoAssets (rowid));";
  v5[2] = @" CREATE INDEX ix_maAutoAssetPathRefs_maAutoAssets_rowid ON maAutoAssetPathRefs (maAutoAssets_rowid);";
  id v6 = &unk_1F347BB58;
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  v7[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v3;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)addReferenceToAutoAssetId:(id)a3 forLifetimeOfPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke;
  v13[3] = &unk_1E6BBE268;
  v17 = &v19;
  id v9 = v7;
  SEL v18 = a2;
  id v14 = v9;
  v15 = self;
  id v10 = v8;
  id v16 = v10;
  uint64_t v11 = (void *)MEMORY[0x1E016EA80](v13);
  [MEMORY[0x1E4F93BB0] writeTransactionWithHandle:self->_db block:v11];
  LOBYTE(self) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

void __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  unint64_t v27 = 0x8000000000000000;
  v4 = [v3 db];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_2;
  v22[3] = &unk_1E6BB7C50;
  id v23 = *(id *)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_3;
  v21[3] = &unk_1E6BBAFB0;
  v21[4] = &v24;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT rowid FROM     maAutoAssets WHERE         type = :type     AND specifier = :specifier     AND version = :version LIMIT 1;",
                                                                 v22,
                                                                 v21,
                                                                 0);

  if (v25[3] == 0x8000000000000000)
  {
    int v5 = [v3 db];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_4;
    v19[3] = &unk_1E6BB7C50;
    id v20 = *(id *)(a1 + 32);
    char v6 = objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT INTO     maAutoAssets (type, specifier, version)     VALUES (:type, :specifier, :version);",
           v19,
           0,
           0);
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v7 + 24)) {
      char v8 = v6;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)(v7 + 24) = v8;

    id v9 = [v3 db];
    sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)[v9 handle]);
    v25[3] = insert_rowid;

    if (v25[3] == 0x8000000000000000)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"TRIAssetStoreDatabase.m", 367, @"Invalid parameter not satisfying: %@", @"rowId != INT64_MIN" object file lineNumber description];
    }
  }
  uint64_t v11 = [v3 db];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_5;
  v16[3] = &unk_1E6BBE240;
  SEL v18 = &v24;
  id v17 = *(id *)(a1 + 48);
  char v12 = objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT OR IGNORE INTO     maAutoAssetPathRefs (maAutoAssets_rowid, path)     VALUES (:rowid, :path);",
          v16,
          0,
          0);
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v13 + 24)) {
    char v14 = v12;
  }
  else {
    char v14 = 0;
  }
  *(unsigned char *)(v13 + 24) = v14;

  _Block_object_dispose(&v24, 8);
}

void __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 type];
  [v4 bindNamedParam:":type" toNonnullNSString:v5];

  char v6 = [*(id *)(a1 + 32) specifier];
  [v4 bindNamedParam:":specifier" toNonnullNSString:v6];

  id v7 = [*(id *)(a1 + 32) version];
  [v4 bindNamedParam:":version" toNonnullNSString:v7];
}

uint64_t __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnName:"rowid" table:0];
  return *MEMORY[0x1E4F93C10];
}

void __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 type];
  [v4 bindNamedParam:":type" toNonnullNSString:v5];

  char v6 = [*(id *)(a1 + 32) specifier];
  [v4 bindNamedParam:":specifier" toNonnullNSString:v6];

  id v7 = [*(id *)(a1 + 32) version];
  [v4 bindNamedParam:":version" toNonnullNSString:v7];
}

void __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v4 = a2;
  [v4 bindNamedParam:":rowid" toInt64:v3];
  [v4 bindNamedParam:":path" toNonnullNSString:*(void *)(a1 + 32)];
}

- (BOOL)enumerateAllAutoAssetReferencesWithBlock:(id)a3
{
  id v5 = a3;
  uint64_t v17 = 0;
  SEL v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke;
  char v12 = &unk_1E6BBE290;
  SEL v16 = a2;
  uint64_t v13 = self;
  id v6 = v5;
  id v14 = v6;
  v15 = &v17;
  id v7 = (void *)MEMORY[0x1E016EA80](&v9);
  objc_msgSend(MEMORY[0x1E4F93BB0], "writeTransactionWithHandle:block:", self->_db, v7, v9, v10, v11, v12, v13);
  LOBYTE(self) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

void __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 db];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke_2;
  v7[3] = &unk_1E6BB8E08;
  uint64_t v4 = a1[4];
  id v5 = (void *)a1[5];
  uint64_t v9 = a1[7];
  v7[4] = v4;
  id v8 = v5;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke_3;
  v6[3] = &unk_1E6BB8280;
  v6[4] = a1[6];
  [v3 prepAndRunQuery:@" SELECT     assets.type AS type, assets.specifier AS specifier, assets.version AS version, paths.path as path     FROM maAutoAssets AS assets INNER JOIN maAutoAssetPathRefs as paths     ON assets.rowid = paths.maAutoAssets_rowid", 0, v7, v6 onPrep onRow onError];
}

uint64_t __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumnAlias:"type"];
  if (!v4)
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a1[6], a1[4], @"TRIAssetStoreDatabase.m", 399, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnAlias:\"type\"]" object file lineNumber description];
  }
  id v5 = [v3 getNSStringForColumnAlias:"specifier"];
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a1[6], a1[4], @"TRIAssetStoreDatabase.m", 400, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnAlias:\"specifier\"]" object file lineNumber description];
  }
  id v6 = [v3 getNSStringForColumnAlias:"version"];
  if (!v6)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a1[6], a1[4], @"TRIAssetStoreDatabase.m", 401, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnAlias:\"version\"]" object file lineNumber description];
  }
  id v7 = [v3 getNSStringForColumnAlias:"path"];
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a1[6], a1[4], @"TRIAssetStoreDatabase.m", 402, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnAlias:\"path\"]" object file lineNumber description];
  }
  uint64_t v8 = a1[5];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB0178]) initWithType:v4 specifier:v5 version:v6];
  (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v7);

  uint64_t v10 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v10;
}

uint64_t __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v3 localizedDescription];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "Enumeration failed with error:%@", (uint8_t *)&v7, 0xCu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;

  return *MEMORY[0x1E4F93C10];
}

- (void)enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a3;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__54;
  v36 = __Block_byref_object_dispose__54;
  paths = self->_paths;
  if (paths)
  {
    int v7 = paths;
  }
  else
  {
    int v7 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  }
  v37 = v7;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v9 = [(id)v33[5] treatmentsDir];
  id v31 = 0;
  uint64_t v10 = [v8 subpathsOfDirectoryAtPath:v9 error:&v31];
  id v11 = v31;
  char v12 = objc_msgSend(v10, "_pas_filteredArrayWithTest:", &__block_literal_global_149);

  if (v12)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_153;
    v30[3] = &unk_1E6BBE2B8;
    v30[4] = &v32;
    uint64_t v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", v30);
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__54;
    uint64_t v43 = __Block_byref_object_dispose__54;
    id v44 = (id)objc_opt_new();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_2;
    v29[3] = &unk_1E6BBE2E0;
    v29[5] = buf;
    v29[6] = a2;
    v29[4] = self;
    id v14 = (void *)MEMORY[0x1E016EA80](v29);
    [MEMORY[0x1E4F93BB0] writeTransactionWithHandle:self->_db block:v14];
    v15 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
    SEL v16 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(*(void *)&buf[8] + 40)];
    [v15 minusSet:v16];

    if ([v15 count])
    {
      uint64_t v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v39 = 138543362;
        v40 = v15;
        _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Found missing MA ref db entries: %{public}@", v39, 0xCu);
      }

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      SEL v18 = v15;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v38 count:16];
      if (v19)
      {
        id v23 = v11;
        uint64_t v24 = v8;
        uint64_t v20 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v18);
            }
            v5[2](v5, *(void *)(*((void *)&v25 + 1) + 8 * i));
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v38 count:16];
        }
        while (v19);
        id v11 = v23;
        uint64_t v8 = v24;
      }
    }
    else
    {
      SEL v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "Did not find any missing MA ref db entries", v39, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      char v22 = [(id)v33[5] treatmentsDir];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Unable to find subpaths of treatments dir %{public}@: %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v32, 8);
}

uint64_t __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsString:@"maRefs/"];
}

id __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_153(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  uint64_t v4 = [v2 treatmentsDir];
  id v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

void __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_3;
  v4[3] = &unk_1E6BBB050;
  uint64_t v6 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @"SELECT rowid, maAutoAssets_rowid, path FROM maAutoAssetPathRefs;",
    0,
    v4,
    0);
}

uint64_t __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_3(void *a1, void *a2)
{
  id v3 = [a2 getNSStringForColumnName:"path" table:0];
  if (!v3)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a1[6], a1[4], @"TRIAssetStoreDatabase.m", 445, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnName:\"path\" table:nil]" object file lineNumber description];
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v3];
  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (void)enumerateAssetIdsWithoutLiveReferencesUsingBlock:(id)a3
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke;
  v8[3] = &unk_1E6BBE358;
  id v9 = v5;
  SEL v10 = a2;
  v8[4] = self;
  id v6 = v5;
  int v7 = (void *)MEMORY[0x1E016EA80](v8);
  [MEMORY[0x1E4F93BB0] writeTransactionWithHandle:self->_db block:v7];
}

void __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  arc4random_buf(__buf, 0x10uLL);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__buf length:16 freeWhenDone:0];
  id v5 = [NSString alloc];
  id v6 = [v4 triHexlify];
  int v7 = (void *)[v5 initWithFormat:@"temp_rowIdsToRemove_%@", v6];

  uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"CREATE TEMP TABLE %@ (rowid INTEGER PRIMARY KEY);",
                 v7);
  id v9 = [v3 db];
  [v9 prepAndRunQuery:v8 onPrep:0 onRow:0 onError:0];

  SEL v10 = [v3 db];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_2;
  v29[3] = &unk_1E6BBE308;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v32 = *(void *)(a1 + 48);
  v29[4] = v11;
  id v12 = v3;
  id v30 = v12;
  id v13 = v7;
  id v31 = v13;
  objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", @"SELECT rowid, maAutoAssets_rowid, path FROM maAutoAssetPathRefs;",
    0,
    v29,
    0);

  id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @" DELETE FROM     maAutoAssetPathRefs WHERE     rowid IN (SELECT rowid FROM %@);",
                  v13);
  v15 = [v12 db];
  [v15 prepAndRunQuery:v14 onPrep:0 onRow:0 onError:0];

  SEL v16 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM %@;", v13];
  uint64_t v17 = [v12 db];
  [v17 prepAndRunQuery:v16 onPrep:0 onRow:0 onError:0];

  SEL v18 = [v12 db];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_4;
  v25[3] = &unk_1E6BBE330;
  v25[4] = *(void *)(a1 + 32);
  long long v24 = *(_OWORD *)(a1 + 40);
  id v19 = (id)v24;
  long long v28 = v24;
  id v26 = v12;
  id v27 = v13;
  id v20 = v13;
  id v21 = v12;
  objc_msgSend(v18, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT rowid AS r, type, specifier, version FROM     maAutoAssets WHERE     NOT EXISTS(        SELECT * FROM             maAutoAssetPathRefs         WHERE             maAutoAssets_rowid = r    );",
    0,
    v25,
    0);

  char v22 = objc_msgSend([NSString alloc], "initWithFormat:", @" DELETE FROM     maAutoAssets WHERE     rowid IN (SELECT rowid FROM %@);",
                  v20);
  id v23 = [v21 db];
  [v23 prepAndRunQuery:v22 onPrep:0 onRow:0 onError:0];

  [*(id *)(a1 + 32) dropTableWithName:v20 transaction:v21];
}

uint64_t __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getNSStringForColumnName:"path" table:0];
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIAssetStoreDatabase.m", 489, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnName:\"path\" table:nil]" object file lineNumber description];
  }
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  if ((v6 & 1) == 0)
  {
    int v7 = [*(id *)(a1 + 40) db];
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"INSERT INTO %@ (rowid) VALUES (:rowid);",
                   *(void *)(a1 + 48));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_3;
    v12[3] = &unk_1E6BB7C50;
    id v13 = v3;
    [v7 prepAndRunQuery:v8 onPrep:v12 onRow:0 onError:0];
  }
  id v9 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v9;
}

void __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":rowid", objc_msgSend(v2, "getInt64ForColumnName:table:", "rowid", 0));
}

uint64_t __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4FB0178]);
  id v5 = [v3 getNSStringForColumnName:"type" table:0];
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a1[8], a1[4], @"TRIAssetStoreDatabase.m", 531, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnName:\"type\" table:nil]" object file lineNumber description];
  }
  char v6 = [v3 getNSStringForColumnName:"specifier" table:0];
  if (!v6)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a1[8], a1[4], @"TRIAssetStoreDatabase.m", 532, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnName:\"specifier\" table:nil]" object file lineNumber description];
  }
  int v7 = [v3 getNSStringForColumnName:"version" table:0];
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a1[8], a1[4], @"TRIAssetStoreDatabase.m", 533, @"Expression was unexpectedly nil/false: %@", @"[stmt getNSStringForColumnName:\"version\" table:nil]" object file lineNumber description];
  }
  uint64_t v8 = (void *)[v4 initWithType:v5 specifier:v6 version:v7];

  (*(void (**)(void))(a1[7] + 16))();
  id v9 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v9;
}

void __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":rowid", objc_msgSend(v2, "getInt64ForColumnName:table:", "rowid", 0));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvoHandler, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_storageManagement, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end