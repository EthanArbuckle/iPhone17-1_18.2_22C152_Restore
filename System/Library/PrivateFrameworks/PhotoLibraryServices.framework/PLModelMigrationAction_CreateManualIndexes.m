@interface PLModelMigrationAction_CreateManualIndexes
+ (BOOL)createManualIndexesDropBeforeCreate:(BOOL)a3 pathManager:(id)a4;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_CreateManualIndexes

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v5 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:0];
  v6 = objc_opt_class();
  v7 = [(PLModelMigrationActionCore *)self pathManager];
  if ([v6 createManualIndexesDropBeforeCreate:0 pathManager:v7]) {
    int64_t v8 = 1;
  }
  else {
    int64_t v8 = 3;
  }

  objc_msgSend(v5, "setCompletedUnitCount:", objc_msgSend(v5, "completedUnitCount") + 1);
  [(PLModelMigrationActionCore *)self finalizeProgress];

  return v8;
}

+ (BOOL)createManualIndexesDropBeforeCreate:(BOOL)a3 pathManager:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  id v6 = [v5 photosDatabasePath];
  v7 = PLOpenSQLTransactionWithDBPath((const char *)[v6 fileSystemRepresentation]);

  if (v7)
  {
    if (v4)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __94__PLModelMigrationAction_CreateManualIndexes_createManualIndexesDropBeforeCreate_pathManager___block_invoke;
      v22[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSString_16_B24l;
      v22[4] = v7;
      [&unk_1EEBF2A40 enumerateKeysAndObjectsUsingBlock:v22];
    }
    *(void *)buf = 0;
    v19 = buf;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __94__PLModelMigrationAction_CreateManualIndexes_createManualIndexesDropBeforeCreate_pathManager___block_invoke_2;
    v13[3] = &unk_1E58757C0;
    v14 = @"UNIQUE_INDEX";
    v15 = buf;
    v16 = &v23;
    v17 = v7;
    [&unk_1EEBF2A40 enumerateKeysAndObjectsUsingBlock:v13];
    if (*((_DWORD *)v19 + 6))
    {
      PLRollbackSQLTransactionAndCloseDB(v7);
    }
    else if (!PLCommitSQLTransactionAndCloseDB(v7))
    {
      v10 = PLMigrationGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unable to commit transaction involving creation of manual indexes.", v12, 2u);
      }

      *((unsigned char *)v24 + 24) = 0;
    }

    _Block_object_dispose(buf, 8);
    BOOL v9 = *((unsigned char *)v24 + 24) != 0;
  }
  else
  {
    int64_t v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Unable to open db in order to create manual indexes.", buf, 2u);
    }

    BOOL v9 = 0;
    *((unsigned char *)v24 + 24) = 0;
  }
  _Block_object_dispose(&v23, 8);

  return v9;
}

@end