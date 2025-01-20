@interface PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  v7 = +[PLInternalResource entityName];
  v8 = [v6 fetchRequestWithEntityName:v7];

  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d && %K == %d", @"dataStoreClassID", 3, @"recipeID", 65741);
  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"asset.savedAssetType", (int)objc_msgSend(MEMORY[0x1E4F8BA10], "savedAssetTypeForCloudSharedAsset"));
  v11 = (void *)MEMORY[0x1E4F28BA0];
  v35[0] = v9;
  v35[1] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v13 = [v11 andPredicateWithSubpredicates:v12];
  [v8 setPredicate:v13];

  id v30 = 0;
  v14 = [v5 executeFetchRequest:v8 error:&v30];
  id v15 = v30;
  v26 = self;
  v16 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v14 count], 0);
  v17 = v16;
  if (v14)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __124__PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore_performActionWithManagedObjectContext_error___block_invoke;
    v28[3] = &unk_1E586B2C8;
    v18 = v16;
    v29 = v18;
    v19 = [v5 enumerateWithIncrementalSaveUsingObjects:v14 withBlock:v28];

    v20 = PLMigrationGetLog();
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v32 = "-[PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore performActionWithManagedObj"
              "ectContext:error:]";
        __int16 v33 = 2112;
        id v34 = v19;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "%{public}s: enumerate with incremental save failed: %@", buf, 0x16u);
      }
      int64_t v22 = 3;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [v18 completedUnitCount];
        *(_DWORD *)buf = 134217984;
        v32 = (const char *)v24;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Fixed %lld resources", buf, 0xCu);
      }
      int64_t v22 = 1;
    }

    v23 = v29;
  }
  else
  {
    v23 = PLMigrationGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "-[PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore performActionWithManagedObjec"
            "tContext:error:]";
      __int16 v33 = 2112;
      id v34 = v15;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "%{public}s: resource fetch failed: %@", buf, 0x16u);
    }
    int64_t v22 = 3;
    v19 = v15;
  }

  [(PLModelMigrationActionCore *)v26 finalizeProgress];
  if (a4) {
    *a4 = v19;
  }

  return v22;
}

@end