@interface TRIDatabase
- (BOOL)dropTableWithName:(id)a3 transaction:(id)a4;
- (BOOL)migrateToVersion:(unsigned int)a3;
- (BOOL)vacuum;
- (TRIDatabase)initWithPaths:(id)a3 databasePath:(id)a4 storageManagement:(id)a5 performMigrations:(BOOL)a6;
- (TRIDatabase)initWithPaths:(id)a3 storageManagement:(id)a4;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (id)createTempTableContainingRowsFromQuery:(id)a3 bind:(id)a4 namePrefix:(id)a5 transaction:(id)a6;
- (id)databaseHandle;
- (id)generalErrorHandlerWithOutError:(id *)a3;
- (id)initInMemoryAndPerformMigrations:(BOOL)a3;
- (id)migrations;
- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3;
- (unsigned)migration_addTaskCapability;
- (unsigned)migration_conditionallyRemoveBMLTFactorPackInfo;
- (void)_disableQueryPlanLogging;
- (void)_enableQueryPlanLogging;
- (void)_updateQueryPlanLogging;
- (void)closePermanently;
@end

@implementation TRIDatabase

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIDatabase.m", 184, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v6.var0 = [MEMORY[0x1E4F93BB0] readTransactionWithHandle:self->_db failableBlock:v5];

  return v6;
}

- (id)generalErrorHandlerWithOutError:(id *)a3
{
  return 0;
}

- (TRIDatabase)initWithPaths:(id)a3 storageManagement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIDatabase.m", 53, @"Invalid parameter not satisfying: %@", @"paths" object file lineNumber description];
  }
  v9 = (void *)MEMORY[0x1E016E7F0]();
  v10 = [v7 databaseDir];
  v11 = [v10 stringByAppendingPathComponent:@"triald.db"];

  v12 = [(TRIDatabase *)self initWithPaths:v7 databasePath:v11 storageManagement:v8 performMigrations:1];

  return v12;
}

- (id)initInMemoryAndPerformMigrations:(BOOL)a3
{
  BOOL v3 = a3;
  _PASDBTransactionCompletion_ v6 = (void *)MEMORY[0x1E016E7F0]();
  id v7 = [@"triald.db" stringByAppendingPathExtension:@"testing"];
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIDatabase.m", 63, @"Error adding extension on %@", @"triald.db" object file lineNumber description];
  }
  id v8 = [MEMORY[0x1E4F93BA0] randomlyNamedInMemoryPathWithBaseName:v7];
  v9 = objc_opt_new();
  v10 = [(TRIDatabase *)self initWithPaths:0 databasePath:v8 storageManagement:v9 performMigrations:v3];

  return v10;
}

- (TRIDatabase)initWithPaths:(id)a3 databasePath:(id)a4 storageManagement:(id)a5 performMigrations:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = v13;
  v54 = v12;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2, self, @"TRIDatabase.m", 74, @"Invalid parameter not satisfying: %@", @"databasePath" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v51 = [MEMORY[0x1E4F28B00] currentHandler];
  [v51 handleFailureInMethod:a2, self, @"TRIDatabase.m", 75, @"Invalid parameter not satisfying: %@", @"storageManagement" object file lineNumber description];

LABEL_3:
  v60.receiver = self;
  v60.super_class = (Class)TRIDatabase;
  v15 = [(TRIDatabase *)&v60 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_paths, a3);
    objc_storeStrong((id *)&v16->_storageManagement, a5);
    p_databasePath = (id *)&v16->_databasePath;
    objc_storeStrong((id *)&v16->_databasePath, a4);
    if (([MEMORY[0x1E4F93BA0] isInMemoryPath:v16->_databasePath] & 1) == 0
      && [MEMORY[0x1E4F93B10] isClassCLocked])
    {
      v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "Device has never been unlocked prior to db initialization.", (uint8_t *)&buf, 2u);
      }

      goto LABEL_39;
    }
    if (([MEMORY[0x1E4F93BA0] isInMemoryPath:*p_databasePath] & 1) != 0
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = [v19 fileExistsAtPath:*p_databasePath],
          v19,
          (v20 & 1) == 0))
    {
      if (([MEMORY[0x1E4F93BA0] isInMemoryPath:*p_databasePath] & 1) == 0)
      {
        v21 = [*p_databasePath stringByDeletingLastPathComponent];
        v22 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v22 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:0];
      }
      int v52 = 1;
    }
    else
    {
      int v52 = 0;
    }
    v23 = (void *)MEMORY[0x1E4F93BA0];
    databasePath = v16->_databasePath;
    v25 = [[TRISqliteErrorHandler alloc] initWithStorageManagement:v16->_storageManagement];
    id v59 = 0;
    uint64_t v26 = [v23 sqliteDatabaseWithFilename:databasePath contentProtection:3 errorHandler:v25 error:&v59];
    id v27 = v59;
    db = v16->_db;
    v16->_db = (_PASSqliteDatabase *)v26;

    if (!v16->_db)
    {
      v33 = TRILogCategory_Server();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v27;
        _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "Failed to instantiate new database handle: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_38;
    }
    *(void *)&long long v68 = 0;
    *((void *)&v68 + 1) = &v68;
    uint64_t v69 = 0x2020000000;
    char v70 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__57;
    v66 = __Block_byref_object_dispose__57;
    id v67 = 0;
    v29 = v16->_db;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke;
    v58[3] = &unk_1E6BBE580;
    v58[4] = &v68;
    v58[5] = &buf;
    [(_PASSqliteDatabase *)v29 prepAndRunQuery:@"CREATE TABLE IF NOT EXISTS integrityCheck (inconsequential STRING)" onPrep:0 onRow:0 onError:v58];
    if (*(unsigned char *)(*((void *)&v68 + 1) + 24))
    {
      v30 = TRILogCategory_Server();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v61 = 138412290;
        uint64_t v62 = v48;
        _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "Encountered corrupt db (%@), attempting to reinitialize", v61, 0xCu);
      }

      v31 = (void *)MEMORY[0x1E4F93BA0];
      v32 = [(_PASSqliteDatabase *)v16->_db filename];
      [v31 truncateDatabaseAtPath:v32];

      [(_PASSqliteDatabase *)v16->_db closePermanently];
      [(TRIStorageManagementProtocol *)v16->_storageManagement requestTrialStorageResetOnNextLaunch];
      _Block_object_dispose(&buf, 8);

      _Block_object_dispose(&v68, 8);
LABEL_38:

LABEL_39:
      v43 = 0;
      goto LABEL_40;
    }
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v68, 8);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__57;
    v66 = __Block_byref_object_dispose__57;
    id v67 = 0;
    v34 = v16->_db;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_52;
    v57[3] = &unk_1E6BB8280;
    v57[4] = &buf;
    if (([(_PASSqliteDatabase *)v34 prepAndRunNonDataQueries:&unk_1F347B4B0 onError:v57] & 1) == 0)
    {
      v44 = TRILogCategory_Server();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        uint64_t v49 = *(void *)(*((void *)&buf + 1) + 40);
        LODWORD(v68) = 138543362;
        *(void *)((char *)&v68 + 4) = v49;
        _os_log_error_impl(&dword_1DA291000, v44, OS_LOG_TYPE_ERROR, "Failed to run initial database pragmas: %{public}@", (uint8_t *)&v68, 0xCu);
      }

      [(_PASSqliteDatabase *)v16->_db closePermanently];
      v45 = v16->_db;
      v16->_db = 0;

      if (v52 && ([MEMORY[0x1E4F93BA0] isInMemoryPath:*p_databasePath] & 1) == 0) {
        [MEMORY[0x1E4F93BA0] truncateDatabaseAtPath:*p_databasePath];
      }
      _Block_object_dispose(&buf, 8);

      goto LABEL_38;
    }
    _Block_object_dispose(&buf, 8);

    if (v52)
    {
      v35 = TRILogCategory_Server();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = *p_databasePath;
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v36;
        _os_log_impl(&dword_1DA291000, v35, OS_LOG_TYPE_DEFAULT, "Created new database: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    uint64_t v37 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    defaults = v16->_defaults;
    v16->_defaults = (NSUserDefaults *)v37;

    uint64_t v39 = objc_opt_new();
    kvoHandler = v16->_kvoHandler;
    v16->_kvoHandler = (_PASKVOHandler *)v39;

    atomic_store(0, (unsigned __int8 *)&v16->_isQueryPlanLoggingEnabled);
    objc_initWeak((id *)&buf, v16);
    v41 = v16->_kvoHandler;
    v42 = v16->_defaults;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_55;
    v55[3] = &unk_1E6BBE218;
    objc_copyWeak(&v56, (id *)&buf);
    [(_PASKVOHandler *)v41 reactAfterChangesToKeyPath:@"queryPlanLoggingEnabled" ofObject:v42 usingBlock:v55];
    [(TRIDatabase *)v16 _updateQueryPlanLogging];
    if (v6 && ![(TRIDatabase *)v16 migrateToVersion:*MEMORY[0x1E4F93C18]])
    {
      v47 = TRILogCategory_Server();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v68) = 0;
        _os_log_error_impl(&dword_1DA291000, v47, OS_LOG_TYPE_ERROR, "TRIDatabase: migrations failed", (uint8_t *)&v68, 2u);
      }

      objc_destroyWeak(&v56);
      objc_destroyWeak((id *)&buf);

      goto LABEL_39;
    }
    objc_destroyWeak(&v56);
    objc_destroyWeak((id *)&buf);
  }
  v43 = v16;
LABEL_40:

  return v43;
}

uint64_t __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  return *MEMORY[0x1E4F93C10];
}

uint64_t __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_52(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C10];
}

void __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_55(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateQueryPlanLogging];
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIDatabase.m", 190, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v6.var0 = [MEMORY[0x1E4F93BB0] writeTransactionWithHandle:self->_db failableBlock:v5];

  return v6;
}

- (BOOL)vacuum
{
  return [(_PASSqliteDatabase *)self->_db prepAndRunNonDataQueries:&unk_1F347B4C8 onError:&__block_literal_global_34];
}

uint64_t __21__TRIDatabase_vacuum__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_error_impl(&dword_1DA291000, v3, OS_LOG_TYPE_ERROR, "TRIDatabase incremental vacuum failed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E4F93C10];
}

- (id)createTempTableContainingRowsFromQuery:(id)a3 bind:(id)a4 namePrefix:(id)a5 transaction:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  id v14 = a6;
  v15 = v14;
  if (v11)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"TRIDatabase.m", 221, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"TRIDatabase.m", 222, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];

LABEL_3:
  uint64_t v16 = [(__CFString *)v13 length];
  v17 = @"temp";
  if (v16) {
    v17 = v13;
  }
  v18 = v17;

  arc4random_buf(__buf, 0x10uLL);
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__buf length:16 freeWhenDone:0];
  id v20 = [NSString alloc];
  v21 = [v19 triHexlify];
  v22 = (void *)[v20 initWithFormat:@"%@_%@", v18, v21];

  v23 = [v15 db];
  v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"CREATE TEMP TABLE %@ AS %@;",
                  v22,
                  v11);
  v25 = [(TRIDatabase *)self generalErrorHandlerWithOutError:0];
  LODWORD(v21) = [v23 prepAndRunQuery:v24 onPrep:v12 onRow:0 onError:v25];

  if (v21) {
    uint64_t v26 = v22;
  }
  else {
    uint64_t v26 = 0;
  }
  id v27 = v26;

  return v27;
}

- (BOOL)dropTableWithName:(id)a3 transaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRIDatabase.m", 242, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIDatabase.m", 243, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = (void *)[[NSString alloc] initWithFormat:@"DROP TABLE %@;", v7];
  id v11 = [v9 db];
  id v12 = [(TRIDatabase *)self generalErrorHandlerWithOutError:0];
  char v13 = [v11 prepAndRunQuery:v10 onPrep:0 onRow:0 onError:v12];

  return v13;
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
    [(TRIDatabase *)self _enableQueryPlanLogging];
  }
  else {
    [(TRIDatabase *)self _disableQueryPlanLogging];
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
    v9 = objc_opt_new();
    v10 = [v7 stringFromDate:v9];
    id v11 = [MEMORY[0x1E4F28F80] processInfo];
    id v12 = (void *)[v8 initWithFormat:@"explainQueryPlan-%@-pid_%d-handle_%p.log", v10, objc_msgSend(v11, "processIdentifier"), self->_db];

    char v13 = [v5 stringByAppendingPathComponent:v12];
    LODWORD(v11) = [(_PASSqliteDatabase *)self->_db enableQueryPlanLoggingWithPath:v13];
    id v14 = TRILogCategory_Server();
    v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        v17 = v13;
        _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "TRIDatabase: generating EXPLAIN QUERY PLAN log at \"%{public}@\"", buf, 0xCu);
      }

      atomic_store(1u, (unsigned __int8 *)&self->_isQueryPlanLoggingEnabled);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        v17 = v13;
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "TRIDatabase: unable to generate EXPLAIN QUERY PLAN log at \"%{public}@\"", buf, 0xCu);
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
      _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "TRIDatabase: disable EXPLAIN QUERY PLAN log for handle %p", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)migrateToVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "TRIDatabase now performing migration.", buf, 2u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F93AF8]);
  v20[0] = self;
  BOOL v8 = 1;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v10 = (void *)[v7 initWithMigrationObjects:v9];

  uint64_t v11 = [v10 migrateDatabasesToVersion:v3];
  switch((int)v11)
  {
    case 0:
      v15 = TRILogCategory_Server();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_WORD *)long long buf = 0;
      uint64_t v16 = "TRIDatabase could not perform migrations (device locked?), try again later.";
      goto LABEL_18;
    case 1:
      goto LABEL_16;
    case 2:
    case 4:
    case 5:
    case 6:
      id v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        int v19 = v11;
        _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "TRIDatabase got an unexpected and unrecoverable migration result of %u. Database is considered corrupt and Trial storage will be reset on next launch.", buf, 8u);
      }

      if ([(TRIStorageManagementProtocol *)self->_storageManagement requestTrialStorageResetOnNextLaunch])
      {
        char v13 = TRILogCategory_Server();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "TRIDatabase issuing triald exit request.", buf, 2u);
        }

        xpc_transaction_exit_clean();
      }
      goto LABEL_15;
    case 3:
      v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        uint64_t v16 = "TRIDatabase has a future schema version, cannot use database. (DID YOU DOWNGRADE YOUR OS WITHOUT AN ERASE-"
              "INSTALL??? THAT IS NOT SUPPORTED!!!)";
LABEL_18:
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
      }
LABEL_14:

      goto LABEL_15;
    default:
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIDatabase.m", 333, @"Unhandled migration result: %u", v11);

LABEL_15:
      BOOL v8 = 0;
LABEL_16:

      return v8;
  }
}

- (id)databaseHandle
{
  return self->_db;
}

- (id)migrations
{
  v47[22] = *MEMORY[0x1E4F143B8];
  v46[0] = &unk_1F347BC00;
  v45[0] = @" CREATE TABLE experiments(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     experimentId TEXT NOT NULL,     deploymentId INTEGER NOT NULL,     type INTEGER NOT NULL,     status INTEGER NOT NULL,     startSecondsFromEpoch REAL,     endSecondsFromEpoch REAL,     treatmentId TEXT,     artifact BLOB NOT NULL,     UNIQUE (experimentId, deploymentId),     CHECK (startSecondsFromEpoch IS NULL         OR endSecondsFromEpoch IS NULL         OR startSecondsFromEpoch < endSecondsFromEpoch));";
  v45[1] = @" CREATE TABLE namespaces(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     experiments_rowid INTEGER NOT NULL,     name TEXT NOT NULL,     compatibilityVersion INTEGER NOT NULL,     treatmentPath TEXT,     UNIQUE (experiments_rowid, name),     FOREIGN KEY (experiments_rowid) REFERENCES experiments (rowid));";
  v45[2] = @" CREATE TABLE dynamicNamespaces(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     name TEXT NOT NULL,     teamId TEXT NOT NULL,     appContainerId TEXT NOT NULL,     appContainerType INTEGER NOT NULL,     cloudKitContainerId INTEGER NOT NULL,     compatibilityVersion INTEGER NOT NULL,     defaultsFileURL TEXT,     hasFetched INTEGER NOT NULL DEFAULT 0,     UNIQUE (name));";
  v45[3] = @" CREATE INDEX     ix_dynamicNamespaces_teamId_cloudKitContainerId ON     dynamicNamespaces (teamId, cloudKitContainerId);";
  v45[4] = @" CREATE TABLE kvstore(    key TEXT PRIMARY KEY,     bytes BLOB NOT NULL) WITHOUT ROWID;";
  v45[5] = @" CREATE TABLE tasks(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     taskType INTEGER NOT NULL,     serializedTask BLOB NOT NULL,     startSecondsFromEpoch REAL,     hash INTEGER NOT NULL);";
  v45[6] = @" CREATE INDEX ix_tasks_hash ON tasks (hash);";
  v45[7] = @" CREATE TABLE taskTags(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     taskId INTEGER NOT NULL,     tag TEXT NOT NULL,     UNIQUE (taskId, tag),     FOREIGN KEY (taskId) REFERENCES tasks (rowid));";
  v45[8] = @" CREATE INDEX ix_taskTags_tag ON taskTags (tag);";
  v45[9] = @" CREATE TABLE taskDependencies(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     taskId INTEGER NOT NULL,     dependentTaskId INTEGER NOT NULL,     UNIQUE (taskId, dependentTaskId),     FOREIGN KEY (taskId) REFERENCES tasks (rowid),     FOREIGN KEY (dependentTaskId) REFERENCES tasks (rowid));";
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:10];
  v47[0] = v24;
  v46[1] = &unk_1F347BC18;
  v44 = @" CREATE TABLE contentReferences(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     contentId TEXT NOT NULL,     refCount INTEGER NOT NULL,     UNIQUE (contentId));";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v47[1] = v23;
  v46[2] = &unk_1F347BC30;
  v43[0] = @" ALTER TABLE experiments ADD COLUMN     deploymentEnvironment INTEGER NOT NULL DEFAULT 0;";
  v43[1] = @" CREATE TABLE experimentHistory(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     eventSecondsFromEpoch REAL NOT NULL,     eventType INTEGER NOT NULL,     deploymentEnvironment INTEGER NOT NULL,     experimentId TEXT NOT NULL,     deploymentId INTEGER NOT NULL,     treatmentId TEXT NOT NULL);";
  v43[2] = @" CREATE TABLE experimentHistoryNamespaces(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     experimentHistory_rowid INTEGER NOT NULL,     name TEXT NOT NULL,     compatibilityVersion INTEGER NOT NULL,     UNIQUE (experimentHistory_rowid, name),     FOREIGN KEY (experimentHistory_rowid) REFERENCES experimentHistory (rowid));";
  v43[3] = @" CREATE INDEX ix_experimentHistory_eventSecondsFromEpoch ON experimentHistory(eventSecondsFromEpoch);";
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
  v47[2] = v22;
  v46[3] = &unk_1F347BC48;
  v42 = @" CREATE TABLE activationEvents(    experimentId TEXT NOT NULL,     treatmentId TEXT NOT NULL,     deploymentId INTEGER NOT NULL,     osBuild TEXT NOT NULL,     languageCode TEXT NOT NULL,     regionCode TEXT NOT NULL,     UNIQUE (experimentId, treatmentId, deploymentId));";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v47[3] = v21;
  v46[4] = &unk_1F347BC60;
  v41[0] = @" CREATE TABLE rolloutsV2(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     rolloutId TEXT NOT NULL,     deploymentId INTEGER NOT NULL,     status INTEGER NOT NULL,     isShadow INTEGER NOT NULL,     activeFactorPackSetId TEXT,     targetedFactorPackSetId TEXT,     artifact BLOB NOT NULL,     UNIQUE (rolloutId, deploymentId));";
  v41[1] = @" CREATE TABLE rolloutV2Namespaces(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     rolloutsV2_rowid INTEGER NOT NULL,     name TEXT NOT NULL,     UNIQUE (rolloutsV2_rowid, name),     FOREIGN KEY (rolloutsV2_rowid) REFERENCES rolloutsV2 (rowid));";
  v41[2] = @" CREATE INDEX ix_rolloutV2Namespaces_name ON rolloutV2Namespaces(name);";
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
  v47[4] = v20;
  v46[5] = &unk_1F347BC78;
  v40 = @" CREATE TABLE mlRuntimeEvaluationStatusHistory(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     evaluationId TEXT NOT NULL,     eventSecondsFromEpoch REAL NOT NULL,     serializedMLRuntimeEvaluation BLOB NOT NULL,     serializedEvaluationStatus BLOB NOT NULL,     UNIQUE(evaluationId));";
  int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v47[5] = v19;
  v46[6] = &unk_1F347BC90;
  v39[0] = @" CREATE INDEX ix_rolloutsV2_activeFactorPackSetId ON rolloutsV2(activeFactorPackSetId);";
  v39[1] = @" CREATE INDEX ix_rolloutsV2_targetedFactorPackSetId ON rolloutsV2(targetedFactorPackSetId);";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v47[6] = v18;
  v46[7] = &unk_1F347BCA8;
  v38 = @" ALTER TABLE experiments ADD COLUMN     isShadow INTEGER NOT NULL DEFAULT 0;";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v47[7] = v17;
  v46[8] = &unk_1F347BCC0;
  uint64_t v37 = @" ALTER TABLE rolloutsV2 ADD COLUMN     rampId TEXT;";
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v47[8] = v16;
  v46[9] = &unk_1F347BCD8;
  v36[0] = @" ALTER TABLE rolloutsV2 ADD COLUMN     activeTargetingRuleIndex INTEGER;";
  v36[1] = @" ALTER TABLE rolloutsV2 ADD COLUMN     targetedTargetingRuleIndex INTEGER;";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v47[9] = v15;
  v46[10] = &unk_1F347BCF0;
  v35[0] = @" ALTER TABLE rolloutsV2 ADD COLUMN     respectRefCount INTEGER NOT NULL DEFAULT 1;";
  v35[1] = @" UPDATE rolloutsV2 SET respectRefCount = 0;";
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v47[10] = v14;
  v46[11] = &unk_1F347BD08;
  v34 = @" ALTER TABLE experiments ADD COLUMN     isManuallyTargeted INTEGER NOT NULL DEFAULT 0;";
  char v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v47[11] = v13;
  v46[12] = &unk_1F347BD20;
  v33[0] = @" ALTER TABLE tasks ADD COLUMN     capabilities INTEGER NOT NULL DEFAULT 0;";
  v33[1] = @"migration_addTaskCapability";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v47[12] = v2;
  v46[13] = &unk_1F347BD38;
  v32[0] = @" ALTER TABLE activationEvents ADD COLUMN     carrierBundleId TEXT NOT NULL DEFAULT '';";
  v32[1] = @" ALTER TABLE activationEvents ADD COLUMN     carrierCountryCode TEXT NOT NULL DEFAULT '';";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v47[13] = v3;
  v46[14] = &unk_1F347BD50;
  v31[0] = @" ALTER TABLE activationEvents ADD COLUMN     diagnosticsUsageEnabled INTEGER NOT NULL DEFAULT 0;";
  v31[1] = @" ALTER TABLE activationEvents ADD COLUMN     hasAne INTEGER NOT NULL DEFAULT 0;";
  v31[2] = @" ALTER TABLE activationEvents ADD COLUMN     aneVersion TEXT NOT NULL DEFAULT '';";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  v47[14] = v4;
  v46[15] = &unk_1F347BD68;
  v30 = @" CREATE TABLE backgroundMlTasks(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     backgroundMlTaskId TEXT NOT NULL,     deploymentId INTEGER NOT NULL,     pluginId TEXT NOT NULL,     status INTEGER NOT NULL,     endSecondsFromEpoch REAL,     artifact BLOB,     UNIQUE (backgroundMlTaskId, deploymentId));";
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v47[15] = v5;
  v46[16] = &unk_1F347BD80;
  v29 = @" CREATE TABLE backgroundMlTaskHistory(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     eventSecondsFromEpoch REAL NOT NULL,     eventType INTEGER NOT NULL,     backgroundMlTaskId TEXT NOT NULL,     deploymentId INTEGER NOT NULL);";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v47[16] = v6;
  v47[17] = &unk_1F347B4E0;
  v46[17] = &unk_1F347BD98;
  v46[18] = &unk_1F347BDB0;
  v28[0] = @" CREATE TABLE rolloutHistory(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     eventLogTime REAL NOT NULL,     eventType INTEGER NOT NULL,     rolloutId TEXT NOT NULL,     deploymentId INTEGER,     rampId TEXT,     factorPackSetId TEXT);";
  v28[1] = @" CREATE TABLE rolloutHistoryNamespaces(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     rolloutHistory_rowid INTEGER NOT NULL,     name TEXT NOT NULL,     UNIQUE (rolloutHistory_rowid, name),     FOREIGN KEY (rolloutHistory_rowid) REFERENCES rolloutHistory (rowid));";
  v28[2] = @" CREATE INDEX ix_rolloutHistory_eventSecondsFromEpoch ON rolloutHistory(eventLogTime);";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v47[18] = v7;
  v46[19] = &unk_1F347BDC8;
  id v27 = @" ALTER TABLE backgroundMlTaskHistory ADD COLUMN     factorPackSetId TEXT;";
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v47[19] = v8;
  v46[20] = &unk_1F347BDE0;
  uint64_t v26 = @" ALTER TABLE experiments ADD COLUMN     factorPackSetId TEXT;";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v47[20] = v9;
  v46[21] = &unk_1F347BDF8;
  v25 = @" ALTER TABLE experimentHistory ADD COLUMN     errorOrDeactivationReason TEXT;";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v47[21] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:22];

  return v11;
}

- (unsigned)migration_addTaskCapability
{
  v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "TRIDatabase calling migration_addTaskCapability", buf, 2u);
  }

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__TRIDatabase_migration_addTaskCapability__block_invoke;
  v11[3] = &unk_1E6BB7E80;
  id v12 = v5;
  SEL v13 = a2;
  v11[4] = self;
  id v7 = v5;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT * FROM tasks;",
    0,
    v11,
    0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__TRIDatabase_migration_addTaskCapability__block_invoke_302;
  v9[3] = &unk_1E6BBE5A8;
  v9[4] = self;
  v10 = @" UPDATE tasks  SET capabilities = :capabilities  WHERE rowid = :rowid ";
  [v7 enumerateKeysAndObjectsUsingBlock:v9];

  return 4;
}

uint64_t __42__TRIDatabase_migration_addTaskCapability__block_invoke(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 getInt64AsNSNumberForColumnName:"rowid" table:0];
  if (!v4)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a1[6] object:a1[4] file:@"TRIDatabase.m" lineNumber:614 description:@"read NULL rowid from PRIMARY KEY column"];
  }
  uint64_t v5 = [v3 getInt64ForColumnName:"taskType" table:0];
  id v6 = [v3 getNSDataForColumnName:"serializedTask" table:0];

  if (!v6)
  {
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a1[6] object:a1[4] file:@"TRIDatabase.m" lineNumber:617 description:@"read NULL serializedTask from NOT NULL column"];
  }
  id v7 = +[TRITaskSupport sharedInstance];
  BOOL v8 = (void *)[v7 taskClassForTaskType:v5];

  if (v8)
  {
    v9 = [v8 parseFromData:v6];
    v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 requiredCapabilities];
      id v12 = (void *)a1[5];
      SEL v13 = [NSNumber numberWithUnsignedLongLong:v11];
      [v12 setObject:v13 forKey:v4];
    }
    else
    {
      uint64_t v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Failure deserializing task", (uint8_t *)v20, 2u);
      }
    }
    uint64_t v15 = *MEMORY[0x1E4F93C08];
  }
  else
  {
    id v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 67109120;
      v20[1] = v5;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failure deserializing task of unsupported type %d", (uint8_t *)v20, 8u);
    }

    uint64_t v15 = *MEMORY[0x1E4F93C08];
  }

  return v15;
}

void __42__TRIDatabase_migration_addTaskCapability__block_invoke_302(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  BOOL v8 = *(void **)(*(void *)(a1 + 32) + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__TRIDatabase_migration_addTaskCapability__block_invoke_2;
  v11[3] = &unk_1E6BB8628;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 prepAndRunQuery:v7 onPrep:v11 onRow:0 onError:0];
}

void __42__TRIDatabase_migration_addTaskCapability__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowid", objc_msgSend(v3, "longLongValue"));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":capabilities", objc_msgSend(*(id *)(a1 + 40), "unsignedLongLongValue"));
}

- (unsigned)migration_conditionallyRemoveBMLTFactorPackInfo
{
  id v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "TRIDatabase calling migration_condtionallyRemoveBMLTFactorPackInfo", buf, 2u);
  }

  if (([(_PASSqliteDatabase *)self->_db hasColumnOnTable:@"backgroundMlTasks" named:@"activeFactorPackSetId"] & 1) == 0)
  {
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", @" ALTER TABLE backgroundMlTasks ADD COLUMN     activeFactorPackSetId TEXT;",
      0,
      0,
      0);
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Adding activeFactorPackSetId column to backgroundMlTasks", v12, 2u);
    }
  }
  if (([(_PASSqliteDatabase *)self->_db hasColumnOnTable:@"backgroundMlTasks" named:@"activeTargetingRuleIndex"] & 1) == 0)
  {
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", @" ALTER TABLE backgroundMlTasks ADD COLUMN     activeTargetingRuleIndex INTEGER;",
      0,
      0,
      0);
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Adding activeTargetingRuleIndex column to backgroundMlTasks", v11, 2u);
    }
  }
  if (([(_PASSqliteDatabase *)self->_db hasColumnOnTable:@"backgroundMlTasks" named:@"targetedFactorPackSetId"] & 1) == 0)
  {
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", @" ALTER TABLE backgroundMlTasks ADD COLUMN     targetedFactorPackSetId TEXT;",
      0,
      0,
      0);
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Adding targetedFactorPackSetId column to backgroundMlTasks", v10, 2u);
    }
  }
  if (([(_PASSqliteDatabase *)self->_db hasColumnOnTable:@"backgroundMlTasks" named:@"targetedTargetingRuleIndex"] & 1) == 0)
  {
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", @" ALTER TABLE backgroundMlTasks ADD COLUMN     targetedTargetingRuleIndex INTEGER;",
      0,
      0,
      0);
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Adding targetedTargetingRuleIndex column to backgroundMlTasks", v9, 2u);
    }
  }
  return 4;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return (id)MEMORY[0x1E4F1CBF0];
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