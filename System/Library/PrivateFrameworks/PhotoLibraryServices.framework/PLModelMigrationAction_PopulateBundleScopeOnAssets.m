@interface PLModelMigrationAction_PopulateBundleScopeOnAssets
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_PopulateBundleScopeOnAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v37 = self;
  v7 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:2 pendingParentUnitCount:0];
  v8 = +[PLPersistentHistoryTransactionModifiers transactionAuthorFromChangeSource:2];
  [v6 setTransactionAuthor:v8];

  v9 = (void *)MEMORY[0x1E4F1C038];
  v10 = +[PLManagedAsset entityName];
  v11 = [v9 batchUpdateRequestWithEntityName:v10];

  v12 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCloudSharedAsset"), 1);
  [v11 setPredicate:v12];

  v49 = @"bundleScope";
  v50[0] = &unk_1EEBEEB08;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
  [v11 setPropertiesToUpdate:v13];

  [v11 setResultType:2];
  id v40 = 0;
  v14 = [v6 executeRequest:v11 error:&v40];
  id v15 = v40;
  v38 = v7;
  if (v14)
  {
    v36 = a4;
    [v7 setCompletedUnitCount:1];
    v16 = PLMigrationGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v14 result];
      *(_DWORD *)buf = 138412290;
      v46 = v17;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Populated bundleScope for %@ CloudShared assets", buf, 0xCu);
    }
    v18 = (void *)MEMORY[0x1E4F1C038];
    v19 = +[PLManagedAsset entityName];
    v11 = [v18 batchUpdateRequestWithEntityName:v19];

    v20 = (void *)MEMORY[0x1E4F28BA0];
    v21 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForMomentSharedAsset"), 1);
    v44[0] = v21;
    v22 = (void *)MEMORY[0x1E4F28BA0];
    v23 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPlaceholderAsset"), 1);
    v43[0] = v23;
    v24 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"momentShare");
    v43[1] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    v26 = [v22 andPredicateWithSubpredicates:v25];
    v44[1] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    v28 = [v20 orPredicateWithSubpredicates:v27];

    [v11 setPredicate:v28];
    v41 = @"bundleScope";
    v42 = &unk_1EEBEEB20;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    [v11 setPropertiesToUpdate:v29];

    [v11 setResultType:2];
    id v39 = v15;
    v30 = [v6 executeRequest:v11 error:&v39];
    id v31 = v39;

    if (v30)
    {
      [v38 setCompletedUnitCount:2];
      v32 = PLMigrationGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v30 result];
        *(_DWORD *)buf = 138412290;
        v46 = v33;
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Populated bundleScope for %@ MomentShare assets", buf, 0xCu);
      }
      int64_t v34 = 1;
    }
    else
    {
      v32 = PLMigrationGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v46 = "-[PLModelMigrationAction_PopulateBundleScopeOnAssets performActionWithManagedObjectContext:error:]";
        __int16 v47 = 2112;
        id v48 = v31;
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "%{public}s: batch update failed: %@", buf, 0x16u);
      }
      int64_t v34 = 3;
    }

    a4 = v36;
  }
  else
  {
    v28 = PLMigrationGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v46 = "-[PLModelMigrationAction_PopulateBundleScopeOnAssets performActionWithManagedObjectContext:error:]";
      __int16 v47 = 2112;
      id v48 = v15;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "%{public}s: batch update failed: %@", buf, 0x16u);
    }
    int64_t v34 = 3;
    id v31 = v15;
  }

  [(PLModelMigrationActionCore *)v37 finalizeProgress];
  if (a4) {
    *a4 = v31;
  }

  return v34;
}

@end