@interface TRISQLiteMADatabase
- (BOOL)dropTableWithName:(id)a3 transaction:(id)a4;
- (BOOL)migrateToVersion:(unsigned int)a3;
- (BOOL)vacuum;
- (TRISQLiteMADatabase)initWithParentDir:(id)a3;
- (id)_predicateForAssetSelector:(id)a3;
- (id)databaseHandle;
- (id)lockContentSync:(id)a3 forAssetSelector:(id)a4 withUsagePolicy:(id)a5 withTimeout:(int64_t)a6 lockedAssetSelector:(id *)a7 newerInProgress:(id *)a8 error:(id *)a9;
- (id)locksForSelector:(id)a3;
- (id)migrations;
- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3;
- (unint64_t)assetSizeForSelector:(id)a3;
- (void)addAutoAssetWithId:(id)a3 atPath:(id)a4;
- (void)closePermanently;
- (void)eliminateAllForSelector:(id)a3 completion:(id)a4;
- (void)eliminatePromotedNeverLockedForSelector:(id)a3 completion:(id)a4;
- (void)endAllPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4;
- (void)endAllPreviousLocksOfSelectorSync:(id)a3 forClientName:(id)a4;
@end

@implementation TRISQLiteMADatabase

- (TRISQLiteMADatabase)initWithParentDir:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"TRISQLiteMADatabase.m", 42, @"Invalid parameter not satisfying: %@", @"parentDir" object file lineNumber description];
  }
  v34.receiver = self;
  v34.super_class = (Class)TRISQLiteMADatabase;
  v7 = [(TRISQLiteMADatabase *)&v34 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_18;
  }
  p_parentDir = (id *)&v7->_parentDir;
  objc_storeStrong((id *)&v7->_parentDir, a3);
  uint64_t v10 = [*p_parentDir stringByAppendingPathComponent:@"assets"];
  assetDir = v8->_assetDir;
  v8->_assetDir = (NSString *)v10;

  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Device has never been unlocked prior to db initialization.", (uint8_t *)&buf, 2u);
    }

    goto LABEL_31;
  }
  v13 = [*p_parentDir stringByAppendingPathComponent:@"TRISQLiteMADatabase.db"];
  v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v15 = [v14 fileExistsAtPath:v13];

  if ((v15 & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v16 createDirectoryAtPath:*p_parentDir withIntermediateDirectories:1 attributes:0 error:0];
  }
  v17 = (void *)MEMORY[0x1E4F93BA0];
  v18 = objc_opt_new();
  id v33 = 0;
  uint64_t v19 = [v17 sqliteDatabaseWithFilename:v13 contentProtection:3 errorHandler:v18 error:&v33];
  id v20 = v33;
  db = v8->_db;
  v8->_db = (_PASSqliteDatabase *)v19;

  v22 = v8->_db;
  if (!v22)
  {
    v25 = TRILogCategory_Server();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Failed to instantiate new database handle: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_30;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__24;
  v40 = __Block_byref_object_dispose__24;
  id v41 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __41__TRISQLiteMADatabase_initWithParentDir___block_invoke;
  v32[3] = &unk_1E6BB8280;
  v32[4] = &buf;
  if (([(_PASSqliteDatabase *)v22 prepAndRunNonDataQueries:&unk_1F347B3C0 onError:v32] & 1) == 0)
  {
    v26 = TRILogCategory_Server();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v35 = 138543362;
      uint64_t v36 = v30;
      _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Failed to run initial database pragmas: %{public}@", v35, 0xCu);
    }

    [(_PASSqliteDatabase *)v8->_db closePermanently];
    v27 = v8->_db;
    v8->_db = 0;

    if ((v15 & 1) == 0) {
      [MEMORY[0x1E4F93BA0] truncateDatabaseAtPath:v13];
    }
    _Block_object_dispose(&buf, 8);

    goto LABEL_30;
  }
  _Block_object_dispose(&buf, 8);

  if ((v15 & 1) == 0)
  {
    v23 = TRILogCategory_Server();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1DA291000, v23, OS_LOG_TYPE_DEFAULT, "Created new database: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (![(TRISQLiteMADatabase *)v8 migrateToVersion:*MEMORY[0x1E4F93C18]])
  {
    v28 = TRILogCategory_Server();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "TRISQLiteMADatabase: migrations failed", (uint8_t *)&buf, 2u);
    }

LABEL_30:
LABEL_31:
    v24 = 0;
    goto LABEL_32;
  }

LABEL_18:
  v24 = v8;
LABEL_32:

  return v24;
}

uint64_t __41__TRISQLiteMADatabase_initWithParentDir___block_invoke(uint64_t a1, void *a2)
{
  return *MEMORY[0x1E4F93C10];
}

- (BOOL)vacuum
{
  return [(_PASSqliteDatabase *)self->_db prepAndRunNonDataQueries:&unk_1F347B3D8 onError:&__block_literal_global_15];
}

uint64_t __29__TRISQLiteMADatabase_vacuum__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_error_impl(&dword_1DA291000, v3, OS_LOG_TYPE_ERROR, "TRISQLiteMADatabase incremental vacuum failed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E4F93C10];
}

- (BOOL)dropTableWithName:(id)a3 transaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRISQLiteMADatabase.m", 124, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    char v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRISQLiteMADatabase.m", 125, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"DROP TABLE %@;", v7];
  v11 = [v9 db];
  char v12 = [v11 prepAndRunQuery:v10 onPrep:0 onRow:0 onError:0];

  return v12;
}

- (void)closePermanently
{
}

- (BOOL)migrateToVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "TRISQLiteMADatabase now performing migration.", buf, 2u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F93AF8]);
  v19[0] = self;
  BOOL v8 = 1;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v10 = (void *)[v7 initWithMigrationObjects:v9];

  uint64_t v11 = [v10 migrateDatabasesToVersion:v3];
  switch((int)v11)
  {
    case 0:
      char v12 = TRILogCategory_Server();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_WORD *)long long buf = 0;
      v13 = "TRISQLiteMADatabase could not perform migrations (device locked?), try again later.";
      goto LABEL_11;
    case 1:
      goto LABEL_14;
    case 2:
    case 4:
    case 5:
    case 6:
      char v12 = TRILogCategory_Server();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)long long buf = 67109120;
      int v18 = v11;
      v13 = "TRISQLiteMADatabase got an unexpected and unrecoverable migration result of %u. Database is considered corru"
            "pt and Trial storage will be reset on next launch.";
      v14 = v12;
      uint32_t v15 = 8;
      break;
    case 3:
      char v12 = TRILogCategory_Server();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_WORD *)long long buf = 0;
      v13 = "TRISQLiteMADatabase has a future schema version, cannot use database. (DID YOU DOWNGRADE YOUR OS WITHOUT AN "
            "ERASE-INSTALL??? THAT IS NOT SUPPORTED!!!)";
LABEL_11:
      v14 = v12;
      uint32_t v15 = 2;
      break;
    default:
      char v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"TRISQLiteMADatabase.m", 163, @"Unhandled migration result: %u", v11 object file lineNumber description];
      goto LABEL_13;
  }
  _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
LABEL_13:

  BOOL v8 = 0;
LABEL_14:

  return v8;
}

- (id)databaseHandle
{
  return self->_db;
}

- (id)migrations
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @" CREATE TABLE Assets(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     originalContentPath TEXT NOT NULL,     assetPath TEXT,     type TEXT NOT NULL,     specifier TEXT NOT NULL,     version TEXT NOT NULL,     downloaded INTEGER NOT NULL,     assetSize INTEGER NOT NULL,     UNIQUE (type, specifier, version));";
  v5[1] = @" CREATE TABLE Locks(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     type TEXT NOT NULL,     specifier TEXT NOT NULL,     version TEXT NOT NULL,     reason TEXT NOT NULL);";
  id v6 = &unk_1F347B9C0;
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
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

- (id)_predicateForAssetSelector:(id)a3
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 assetVersion];

  id v7 = @" AND version=:version";
  if (!v6) {
    id v7 = &stru_1F3455898;
  }
  BOOL v8 = (void *)[v5 initWithFormat:@"type=:type AND specifier=:specifier%@", v7];

  return v8;
}

- (void)addAutoAssetWithId:(id)a3 atPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __49__TRISQLiteMADatabase_addAutoAssetWithId_atPath___block_invoke;
  v14 = &unk_1E6BBB510;
  id v15 = v7;
  id v16 = v6;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = (void *)MEMORY[0x1E016EA80](&v11);
  objc_msgSend(MEMORY[0x1E4F93BB0], "writeTransactionWithHandle:block:", self->_db, v10, v11, v12, v13, v14);
}

void __49__TRISQLiteMADatabase_addAutoAssetWithId_atPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a2;
  id v5 = [v3 defaultManager];
  id v6 = [v5 attributesOfItemAtPath:*(void *)(a1 + 32) error:0];
  uint64_t v7 = [v6 fileSize];

  id v8 = [v4 db];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__TRISQLiteMADatabase_addAutoAssetWithId_atPath___block_invoke_2;
  v9[3] = &unk_1E6BB83D8;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = v7;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT INTO     Assets (originalContentPath, type, specifier, version, downloaded, assetSize)     VALUES (:originalContentPath, :type, :specifier, :version, 0, :assetSize);",
    v9,
    0,
    0);
}

void __49__TRISQLiteMADatabase_addAutoAssetWithId_atPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":originalContentPath" toNonnullNSString:v3];
  id v5 = [*(id *)(a1 + 40) type];
  [v4 bindNamedParam:":type" toNonnullNSString:v5];

  id v6 = [*(id *)(a1 + 40) specifier];
  [v4 bindNamedParam:":specifier" toNonnullNSString:v6];

  uint64_t v7 = [*(id *)(a1 + 40) version];
  [v4 bindNamedParam:":version" toNonnullNSString:v7];

  id v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  [v4 bindNamedParam:":assetSize" toInt64AsNSNumber:v8];
}

- (void)endAllPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__TRISQLiteMADatabase_endAllPreviousLocksOfReasonSync_forAssetSelector___block_invoke;
  v11[3] = &unk_1E6BBB538;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  id v10 = (void *)MEMORY[0x1E016EA80](v11);
  [MEMORY[0x1E4F93BB0] writeTransactionWithHandle:self->_db block:v10];
}

void __72__TRISQLiteMADatabase_endAllPreviousLocksOfReasonSync_forAssetSelector___block_invoke(id *a1, void *a2)
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [a1[4] _predicateForAssetSelector:a1[5]];
  id v7 = (void *)[v5 initWithFormat:@" DELETE FROM     Locks     WHERE reason=:reason AND %@;", v6];

  id v8 = [v4 db];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__TRISQLiteMADatabase_endAllPreviousLocksOfReasonSync_forAssetSelector___block_invoke_2;
  v9[3] = &unk_1E6BB8628;
  id v10 = a1[6];
  id v11 = a1[5];
  [v8 prepAndRunQuery:v7 onPrep:v9 onRow:0 onError:0];
}

void __72__TRISQLiteMADatabase_endAllPreviousLocksOfReasonSync_forAssetSelector___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 bindNamedParam:":reason" toNonnullNSString:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 40) assetType];
  [v7 bindNamedParam:":type" toNonnullNSString:v3];

  id v4 = [*(id *)(a1 + 40) assetSpecifier];
  [v7 bindNamedParam:":specifier" toNonnullNSString:v4];

  id v5 = [*(id *)(a1 + 40) assetVersion];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) assetVersion];
    [v7 bindNamedParam:":version" toNonnullNSString:v6];
  }
}

- (void)endAllPreviousLocksOfSelectorSync:(id)a3 forClientName:(id)a4
{
  id v5 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __71__TRISQLiteMADatabase_endAllPreviousLocksOfSelectorSync_forClientName___block_invoke;
  id v11 = &unk_1E6BBB510;
  id v12 = self;
  id v13 = v5;
  id v6 = v5;
  id v7 = (void *)MEMORY[0x1E016EA80](&v8);
  objc_msgSend(MEMORY[0x1E4F93BB0], "writeTransactionWithHandle:block:", self->_db, v7, v8, v9, v10, v11, v12);
}

void __71__TRISQLiteMADatabase_endAllPreviousLocksOfSelectorSync_forClientName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) _predicateForAssetSelector:*(void *)(a1 + 40)];
  id v7 = (void *)[v5 initWithFormat:@" DELETE FROM     Locks     WHERE %@;", v6];

  uint64_t v8 = [v4 db];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__TRISQLiteMADatabase_endAllPreviousLocksOfSelectorSync_forClientName___block_invoke_2;
  v9[3] = &unk_1E6BB7C50;
  id v10 = *(id *)(a1 + 40);
  [v8 prepAndRunQuery:v7 onPrep:v9 onRow:0 onError:0];
}

void __71__TRISQLiteMADatabase_endAllPreviousLocksOfSelectorSync_forClientName___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) assetType];
  [v7 bindNamedParam:":type" toNonnullNSString:v3];

  id v4 = [*(id *)(a1 + 32) assetSpecifier];
  [v7 bindNamedParam:":specifier" toNonnullNSString:v4];

  id v5 = [*(id *)(a1 + 32) assetVersion];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) assetVersion];
    [v7 bindNamedParam:":version" toNonnullNSString:v6];
  }
}

- (void)eliminateAllForSelector:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke;
  id v13 = &unk_1E6BBB510;
  v14 = self;
  id v8 = v6;
  id v15 = v8;
  uint64_t v9 = (void *)MEMORY[0x1E016EA80](&v10);
  objc_msgSend(MEMORY[0x1E4F93BB0], "writeTransactionWithHandle:block:", self->_db, v9, v10, v11, v12, v13, v14);
  if (v7) {
    v7[2](v7, v8, 0);
  }
}

void __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 _predicateForAssetSelector:v4];
  id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @" DELETE FROM     Locks     WHERE %@;",
                 v6);
  id v8 = [v5 db];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_2;
  v17[3] = &unk_1E6BB7C50;
  id v18 = *(id *)(a1 + 40);
  [v8 prepAndRunQuery:v7 onPrep:v17 onRow:0 onError:0];

  uint64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @" UPDATE Assets SET downloaded=0     WHERE %@;",
                 v6);
  uint64_t v10 = [v5 db];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_3;
  v15[3] = &unk_1E6BB7C50;
  id v16 = *(id *)(a1 + 40);
  [v10 prepAndRunQuery:v9 onPrep:v15 onRow:0 onError:0];

  uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@" SELECT * FROM Assets     WHERE %@", v6];
  id v12 = [v5 db];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_4;
  v13[3] = &unk_1E6BB7C50;
  id v14 = *(id *)(a1 + 40);
  [v12 prepAndRunQuery:v11 onPrep:v13 onRow:&__block_literal_global_380 onError:0];
}

void __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) assetType];
  [v7 bindNamedParam:":type" toNonnullNSString:v3];

  uint64_t v4 = [*(id *)(a1 + 32) assetSpecifier];
  [v7 bindNamedParam:":specifier" toNonnullNSString:v4];

  id v5 = [*(id *)(a1 + 32) assetVersion];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) assetVersion];
    [v7 bindNamedParam:":version" toNonnullNSString:v6];
  }
}

void __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) assetType];
  [v7 bindNamedParam:":type" toNonnullNSString:v3];

  uint64_t v4 = [*(id *)(a1 + 32) assetSpecifier];
  [v7 bindNamedParam:":specifier" toNonnullNSString:v4];

  id v5 = [*(id *)(a1 + 32) assetVersion];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) assetVersion];
    [v7 bindNamedParam:":version" toNonnullNSString:v6];
  }
}

void __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) assetType];
  [v7 bindNamedParam:":type" toNonnullNSString:v3];

  uint64_t v4 = [*(id *)(a1 + 32) assetSpecifier];
  [v7 bindNamedParam:":specifier" toNonnullNSString:v4];

  id v5 = [*(id *)(a1 + 32) assetVersion];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) assetVersion];
    [v7 bindNamedParam:":version" toNonnullNSString:v6];
  }
}

uint64_t __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [a2 getNSStringForColumnName:"assetPath" table:0];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = 0;
    char v4 = [v3 removeItemAtPath:v2 error:&v8];
    id v5 = v8;

    if ((v4 & 1) == 0)
    {
      id v6 = TRILogCategory_Server();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v10 = v2;
        __int16 v11 = 2112;
        id v12 = v5;
        _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Failed to remove mocked MA asset at path %@: %@", buf, 0x16u);
      }
    }
  }

  return *MEMORY[0x1E4F93C08];
}

- (void)eliminatePromotedNeverLockedForSelector:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke;
  uint64_t v13 = &unk_1E6BBB510;
  id v14 = self;
  id v8 = v6;
  id v15 = v8;
  uint64_t v9 = (void *)MEMORY[0x1E016EA80](&v10);
  objc_msgSend(MEMORY[0x1E4F93BB0], "writeTransactionWithHandle:block:", self->_db, v9, v10, v11, v12, v13, v14);
  if (v7) {
    v7[2](v7, v8, 0);
  }
}

void __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = [*(id *)(a1 + 32) _predicateForAssetSelector:*(void *)(a1 + 40)];
  id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @" SELECT * FROM     Assets     WHERE downloaded=1 AND %@;",
                 v5);
  id v7 = [v3 db];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_2;
  v28[3] = &unk_1E6BB7C50;
  id v29 = *(id *)(a1 + 40);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_3;
  v26[3] = &unk_1E6BBB580;
  id v8 = v4;
  id v27 = v8;
  [v7 prepAndRunQuery:v6 onPrep:v28 onRow:v26 onError:0];

  uint64_t v9 = [v3 db];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_4;
  v24[3] = &unk_1E6BBB580;
  id v10 = v8;
  id v25 = v10;
  [v9 prepAndRunQuery:@" SELECT * FROM     Locks" onPrep:0 onRow:v24 onError:0];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_5;
  v22[3] = &unk_1E6BBB5A8;
  id v11 = v3;
  id v23 = v11;
  id v12 = (void (**)(void, void))MEMORY[0x1E016EA80](v22);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        v12[2](v12, *(void *)(*((void *)&v18 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v15);
  }
}

void __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) assetType];
  [v7 bindNamedParam:":type" toNonnullNSString:v3];

  id v4 = [*(id *)(a1 + 32) assetSpecifier];
  [v7 bindNamedParam:":specifier" toNonnullNSString:v4];

  id v5 = [*(id *)(a1 + 32) assetVersion];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) assetVersion];
    [v7 bindNamedParam:":version" toNonnullNSString:v6];
  }
}

uint64_t __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nonnullNSStringForColumnName:"type" table:0];
  id v5 = [v3 nonnullNSStringForColumnName:"specifier" table:0];
  id v6 = [v3 nonnullNSStringForColumnName:"version" table:0];

  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB0178]) initWithType:v4 specifier:v5 version:v6];
  [v7 addObject:v8];

  uint64_t v9 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v9;
}

uint64_t __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nonnullNSStringForColumnName:"type" table:0];
  id v5 = [v3 nonnullNSStringForColumnName:"specifier" table:0];
  id v6 = [v3 nonnullNSStringForColumnName:"version" table:0];

  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB0178]) initWithType:v4 specifier:v5 version:v6];
  [v7 removeObject:v8];

  uint64_t v9 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v9;
}

void __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) db];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_6;
  v10[3] = &unk_1E6BB7C50;
  id v5 = v3;
  id v11 = v5;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE Assets SET downloaded=0     WHERE type=:type AND specifier=:specifier AND version=:version;",
    v10,
    0,
    0);

  id v6 = [*(id *)(a1 + 32) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_7;
  v8[3] = &unk_1E6BB7C50;
  id v9 = v5;
  id v7 = v5;
  objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT * FROM Assets     WHERE type=:type AND specifier=:specifier AND version=:version;",
    v8,
    &__block_literal_global_400,
    0);
}

void __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 type];
  [v4 bindNamedParam:":type" toNonnullNSString:v5];

  id v6 = [*(id *)(a1 + 32) specifier];
  [v4 bindNamedParam:":specifier" toNonnullNSString:v6];

  id v7 = [*(id *)(a1 + 32) version];
  [v4 bindNamedParam:":version" toNonnullNSString:v7];
}

void __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 type];
  [v4 bindNamedParam:":type" toNonnullNSString:v5];

  id v6 = [*(id *)(a1 + 32) specifier];
  [v4 bindNamedParam:":specifier" toNonnullNSString:v6];

  id v7 = [*(id *)(a1 + 32) version];
  [v4 bindNamedParam:":version" toNonnullNSString:v7];
}

uint64_t __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [a2 nonnullNSStringForColumnName:"assetPath" table:0];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = 0;
  char v4 = [v3 removeItemAtPath:v2 error:&v8];
  id v5 = v8;

  if ((v4 & 1) == 0)
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v10 = v2;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Failed to remove mocked MA asset at path %@: %@", buf, 0x16u);
    }
  }
  return *MEMORY[0x1E4F93C08];
}

- (id)lockContentSync:(id)a3 forAssetSelector:(id)a4 withUsagePolicy:(id)a5 withTimeout:(int64_t)a6 lockedAssetSelector:(id *)a7 newerInProgress:(id *)a8 error:(id *)a9
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = [v15 assetVersion];

  if (v17)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__24;
    uint64_t v36 = __Block_byref_object_dispose__24;
    id v37 = 0;
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    id v25 = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke;
    v26 = &unk_1E6BBB620;
    id v27 = self;
    id v28 = v15;
    SEL v31 = a2;
    id v29 = v14;
    p_long long buf = &buf;
    int64_t v32 = a6;
    long long v18 = (void *)MEMORY[0x1E016EA80](&v23);
    objc_msgSend(MEMORY[0x1E4F93BB0], "writeTransactionWithHandle:block:", self->_db, v18, v23, v24, v25, v26, v27);
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      id v19 = objc_alloc(MEMORY[0x1E4F1CB10]);
      long long v20 = (void *)[v19 initWithString:*(void *)(*((void *)&buf + 1) + 40)];
    }
    else
    {
      long long v20 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    long long v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "lockContentSync called with incomplete asset selector (missing asset version): %@", (uint8_t *)&buf, 0xCu);
    }

    long long v20 = 0;
  }

  return v20;
}

void __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) _predicateForAssetSelector:*(void *)(a1 + 40)];
  id v5 = [v3 db];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_2;
  v41[3] = &unk_1E6BBB5D0;
  id v6 = *(id *)(a1 + 40);
  uint64_t v45 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 32);
  id v42 = v6;
  uint64_t v43 = v7;
  id v44 = *(id *)(a1 + 48);
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT INTO     Locks (type, specifier, version, reason)     VALUES (:type, :specifier, :version, :reason);",
    v41,
    0,
    &__block_literal_global_412);

  id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @" SELECT * FROM Assets     WHERE %@;",
                 v4);
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  int64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__24;
  v35 = __Block_byref_object_dispose__24;
  id v36 = 0;
  id v9 = [v3 db];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_4;
  v29[3] = &unk_1E6BB7C50;
  id v30 = *(id *)(a1 + 40);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_5;
  v28[3] = &unk_1E6BBB5F8;
  void v28[4] = *(void *)(a1 + 56);
  v28[5] = &v31;
  v28[6] = &v37;
  [v9 prepAndRunQuery:v8 onPrep:v29 onRow:v28 onError:&__block_literal_global_419];

  if (!*((unsigned char *)v38 + 24) && *(void *)(a1 + 72))
  {
    id v14 = NSTemporaryDirectory();
    id v15 = objc_opt_new();
    id v16 = [v15 UUIDString];
    uint64_t v13 = [v14 stringByAppendingPathComponent:v16];

    uint64_t v17 = objc_opt_new();
    long long v18 = [v17 UUIDString];
    id v19 = [v13 stringByAppendingPathComponent:v18];

    long long v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v32[5]];
    if (v20)
    {
      [MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v13];
      [v20 writeToFile:v19 atomically:1];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13);
      long long v21 = objc_msgSend([NSString alloc], "initWithFormat:", @" UPDATE Assets SET downloaded=1, assetPath=:assetPath     WHERE %@;",
                          v4);
      v22 = [v3 db];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_425;
      v25[3] = &unk_1E6BB8628;
      id v26 = v13;
      id v27 = *(id *)(a1 + 40);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_2_427;
      v24[3] = &unk_1E6BBAFB0;
      void v24[4] = *(void *)(a1 + 56);
      [v22 prepAndRunQuery:v21 onPrep:v25 onRow:v24 onError:&__block_literal_global_430];
    }
    else
    {
      long long v21 = TRILogCategory_Server();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = v32[5];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v47 = v23;
        _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "Error reading asset contents from %@", buf, 0xCu);
      }
    }

    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(void *)(v10 + 40))
  {
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  __int16 v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v12 = [v11 fileExistsAtPath:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  if ((v12 & 1) == 0)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void **)(v10 + 40);
LABEL_9:
    *(void *)(v10 + 40) = 0;
LABEL_13:
  }
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
}

void __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) assetType];
  [v7 bindNamedParam:":type" toNonnullNSString:v3];

  char v4 = [*(id *)(a1 + 32) assetSpecifier];
  [v7 bindNamedParam:":specifier" toNonnullNSString:v4];

  id v5 = [*(id *)(a1 + 32) assetVersion];
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"TRISQLiteMADatabase.m", 490, @"Expression was unexpectedly nil/false: %@", @"assetSelector.assetVersion" object file lineNumber description];
  }
  [v7 bindNamedParam:":version" toNonnullNSString:v5];

  [v7 bindNamedParam:":reason" toNonnullNSString:*(void *)(a1 + 48)];
}

uint64_t __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_3()
{
  return *MEMORY[0x1E4F93C08];
}

void __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) assetType];
  [v7 bindNamedParam:":type" toNonnullNSString:v3];

  char v4 = [*(id *)(a1 + 32) assetSpecifier];
  [v7 bindNamedParam:":specifier" toNonnullNSString:v4];

  id v5 = [*(id *)(a1 + 32) assetVersion];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) assetVersion];
    [v7 bindNamedParam:":version" toNonnullNSString:v6];
  }
}

uint64_t __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnName:"downloaded" table:0];
  uint64_t v5 = [v3 getNSStringForColumnName:"assetPath" table:0];
  uint64_t v6 = *(void *)(a1[4] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [v3 getNSStringForColumnName:"originalContentPath" table:0];

  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (v4 && *(void *)(*(void *)(a1[4] + 8) + 40))
  {
    __int16 v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v11 fileExistsAtPath:*(void *)(*(void *)(a1[4] + 8) + 40)];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  return *MEMORY[0x1E4F93C08];
}

uint64_t __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_6()
{
  return *MEMORY[0x1E4F93C08];
}

void __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_425(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 bindNamedParam:":assetPath" toNonnullNSString:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) assetType];
  [v7 bindNamedParam:":type" toNonnullNSString:v3];

  uint64_t v4 = [*(id *)(a1 + 40) assetSpecifier];
  [v7 bindNamedParam:":specifier" toNonnullNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 40) assetVersion];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) assetVersion];
    [v7 bindNamedParam:":version" toNonnullNSString:v6];
  }
}

uint64_t __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_2_427(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumnName:"assetPath" table:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *MEMORY[0x1E4F93C08];
}

uint64_t __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_3_428()
{
  return *MEMORY[0x1E4F93C08];
}

- (id)locksForSelector:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__TRISQLiteMADatabase_locksForSelector___block_invoke;
  v11[3] = &unk_1E6BBB538;
  v11[4] = self;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  uint64_t v8 = (void *)MEMORY[0x1E016EA80](v11);
  [MEMORY[0x1E4F93BB0] writeTransactionWithHandle:self->_db block:v8];
  id v9 = v6;

  return v9;
}

void __40__TRISQLiteMADatabase_locksForSelector___block_invoke(id *a1, void *a2)
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [a1[4] _predicateForAssetSelector:a1[5]];
  id v7 = (void *)[v5 initWithFormat:@" SELECT * FROM Locks     WHERE %@;", v6];

  uint64_t v8 = [v4 db];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__TRISQLiteMADatabase_locksForSelector___block_invoke_2;
  v11[3] = &unk_1E6BB7C50;
  id v12 = a1[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__TRISQLiteMADatabase_locksForSelector___block_invoke_3;
  v9[3] = &unk_1E6BBB580;
  id v10 = a1[6];
  [v8 prepAndRunQuery:v7 onPrep:v11 onRow:v9 onError:0];
}

void __40__TRISQLiteMADatabase_locksForSelector___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) assetType];
  [v7 bindNamedParam:":type" toNonnullNSString:v3];

  id v4 = [*(id *)(a1 + 32) assetSpecifier];
  [v7 bindNamedParam:":specifier" toNonnullNSString:v4];

  id v5 = [*(id *)(a1 + 32) assetVersion];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) assetVersion];
    [v7 bindNamedParam:":version" toNonnullNSString:v6];
  }
}

uint64_t __40__TRISQLiteMADatabase_locksForSelector___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumnName:"reason" table:0];
  if (v3) {
    [*(id *)(a1 + 32) setObject:&unk_1F347B9C0 forKey:v3];
  }
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (unint64_t)assetSizeForSelector:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke;
  v9[3] = &unk_1E6BBB648;
  void v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  __int16 v11 = &v12;
  id v6 = (void *)MEMORY[0x1E016EA80](v9);
  [MEMORY[0x1E4F93BB0] writeTransactionWithHandle:self->_db block:v6];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) _predicateForAssetSelector:*(void *)(a1 + 40)];
  unint64_t v7 = (void *)[v5 initWithFormat:@" SELECT * FROM Assets     WHERE %@;", v6];

  uint64_t v8 = [v4 db];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke_2;
  v10[3] = &unk_1E6BB7C50;
  id v11 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke_3;
  v9[3] = &unk_1E6BBAFB0;
  void v9[4] = *(void *)(a1 + 48);
  [v8 prepAndRunQuery:v7 onPrep:v10 onRow:v9 onError:0];
}

void __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) assetType];
  [v7 bindNamedParam:":type" toNonnullNSString:v3];

  id v4 = [*(id *)(a1 + 32) assetSpecifier];
  [v7 bindNamedParam:":specifier" toNonnullNSString:v4];

  id v5 = [*(id *)(a1 + 32) assetVersion];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) assetVersion];
    [v7 bindNamedParam:":version" toNonnullNSString:v6];
  }
}

uint64_t __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getInt64AsNSNumberForColumnName:"assetSize" table:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 unsignedLongLongValue];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_assetDir, 0);
  objc_storeStrong((id *)&self->_parentDir, 0);
}

@end