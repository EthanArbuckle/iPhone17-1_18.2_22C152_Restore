@interface PLModelMigrationAction_RepairSingletons
+ (BOOL)repairSingletonObjectsInDatabaseUsingContext:(id)a3 pathManager:(id)a4 error:(id *)a5;
+ (void)_repairRootFolderFixedOrderKeysInStore:(id)a3 context:(id)a4 pathManager:(id)a5;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RepairSingletons

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:0];
  v8 = objc_opt_class();
  v9 = [(PLModelMigrationActionCore *)self pathManager];
  id v15 = 0;
  int v10 = [v8 repairSingletonObjectsInDatabaseUsingContext:v6 pathManager:v9 error:&v15];
  id v11 = v15;

  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);
  if ((v10 & 1) == 0)
  {
    v12 = PLMigrationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to create singletons: %@", buf, 0xCu);
    }
  }
  [v6 reset];
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v11;
  }
  if (v10) {
    int64_t v13 = 1;
  }
  else {
    int64_t v13 = 3;
  }

  return v13;
}

+ (void)_repairRootFolderFixedOrderKeysInStore:(id)a3 context:(id)a4 pathManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((PLIsAssetsd() & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = NSStringFromSelector(a2);
    [v18 handleFailureInMethod:a2, a1, @"PLModelMigrationActionRepairs.m", 186, @"%@ can only be called from assetsd", v19 object file lineNumber description];
  }
  v12 = [PLRelationshipOrderKeyManager alloc];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __102__PLModelMigrationAction_RepairSingletons__repairRootFolderFixedOrderKeysInStore_context_pathManager___block_invoke;
  v23[3] = &unk_1E58757F0;
  id v24 = v9;
  id v25 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = [(PLRelationshipOrderKeyManager *)v12 initWithGenerateContextBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__PLModelMigrationAction_RepairSingletons__repairRootFolderFixedOrderKeysInStore_context_pathManager___block_invoke_2;
  v20[3] = &unk_1E5875E18;
  id v21 = v10;
  v22 = v15;
  v16 = v15;
  id v17 = v10;
  [v17 performBlockAndWait:v20];
}

+ (BOOL)repairSingletonObjectsInDatabaseUsingContext:(id)a3 pathManager:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = PLMigrationGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Creating PLGenericAlbum singletons", (uint8_t *)&v26, 2u);
  }

  +[PLGenericAlbum addSingletonObjectsToContext:v8];
  id v11 = PLMigrationGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Creating PLManagedAlbumList singletons", (uint8_t *)&v26, 2u);
  }

  +[PLManagedAlbumList addSingletonObjectsToContext:v8];
  int v12 = [v8 save:a5];
  if (v12)
  {
    PLGenericAlbumHashOfSingletonAlbumValues(0);
    id v13 = [v8 persistentStoreCoordinator];
    id v14 = [v13 persistentStores];
    id v15 = [v14 firstObject];

    v16 = [v15 metadata];
    id v17 = v16;
    if (v16)
    {
      uint64_t v18 = [v16 mutableCopy];
      v19 = [NSNumber numberWithUnsignedInteger:3482];
      [v18 setObject:v19 forKeyedSubscript:@"PLAlbumSingletonHashKey"];

      [v15 setMetadata:v18];
      v20 = PLMigrationGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134217984;
        uint64_t v27 = 3482;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Updated persisted album singleton hash to %lu", (uint8_t *)&v26, 0xCu);
      }
    }
    else
    {
      uint64_t v18 = PLMigrationGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136446210;
        uint64_t v27 = (uint64_t)"+[PLModelMigrationAction_RepairSingletons repairSingletonObjectsInDatabaseUsingContext:pathManager:error:]";
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to get store metadata: %{public}s", (uint8_t *)&v26, 0xCu);
      }
    }

    id v21 = PLMigrationGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Enforcing fixed album order", (uint8_t *)&v26, 2u);
    }

    v22 = [v8 persistentStoreCoordinator];
    v23 = [v22 persistentStores];
    id v24 = [v23 objectAtIndexedSubscript:0];
    [a1 _repairRootFolderFixedOrderKeysInStore:v24 context:v8 pathManager:v9];
  }
  return v12;
}

@end