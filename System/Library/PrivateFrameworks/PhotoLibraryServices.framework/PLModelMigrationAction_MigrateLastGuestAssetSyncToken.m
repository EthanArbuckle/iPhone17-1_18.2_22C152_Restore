@interface PLModelMigrationAction_MigrateLastGuestAssetSyncToken
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_MigrateLastGuestAssetSyncToken

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = 1;
  v8 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:0];
  v9 = +[PLGlobalKeyValue fetchGlobalKeyValueForKey:@"LastGuestAssetSyncToken" withManagedObjectContext:v6 createIfMissing:0];
  v10 = v9;
  if (v9)
  {
    id v11 = [v9 anyValue];
    if (!v11)
    {
LABEL_5:
      int64_t v7 = 1;
      goto LABEL_25;
    }
    v12 = [v10 anyValue];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v11 = 0;
      goto LABEL_5;
    }
    v14 = [v10 anyValue];
    uint64_t v15 = +[PLPersistentHistoryUtilities unarchiveTokenWithData:v14];

    v37 = (void *)v15;
    +[PLGlobalKeyValue setGlobalValue:v15 forKey:@"LastGuestAssetSyncToken" managedObjectContext:v6];
    id v38 = 0;
    char v16 = [v6 save:&v38];
    id v11 = v38;
    if (v16)
    {
      int64_t v7 = 1;
      [v8 setCompletedUnitCount:1];
      v17 = PLMigrationGetLog();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        v19 = [(PLModelMigrationActionCore *)self logger];

        if (v19)
        {
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          memset(buf, 0, sizeof(buf));
          v20 = PLMigrationGetLog();
          os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          int v39 = 138543618;
          v40 = @"LastGuestAssetSyncToken";
          __int16 v41 = 2114;
          id v42 = v37;
          LODWORD(v36) = 22;
          v21 = (uint8_t *)_os_log_send_and_compose_impl();

          v22 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_15000.m", 364, 0);

          if (v21 != buf) {
            free(v21);
          }
        }
        else
        {
          v31 = PLMigrationGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = @"LastGuestAssetSyncToken";
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v37;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Updated global value %{public}@ with token %{public}@", buf, 0x16u);
          }
        }
        int64_t v7 = 1;
      }
    }
    else
    {
      v23 = PLMigrationGetLog();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
        v25 = [(PLModelMigrationActionCore *)self logger];

        if (v25)
        {
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          memset(buf, 0, sizeof(buf));
          v26 = PLMigrationGetLog();
          os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          int v39 = 138543618;
          v40 = v28;
          __int16 v41 = 2112;
          id v42 = v11;
          LODWORD(v36) = 22;
          v29 = (uint8_t *)_os_log_send_and_compose_impl();

          v30 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_15000.m", 361, 16);

          if (v29 != buf) {
            free(v29);
          }
        }
        else
        {
          v32 = PLMigrationGetLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = (objc_class *)objc_opt_class();
            v34 = NSStringFromClass(v33);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v34;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v11;
            _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %@", buf, 0x16u);
          }
        }
      }
      int64_t v7 = 3;
    }
  }
  else
  {
    id v11 = 0;
  }
LABEL_25:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v11;
  }

  return v7;
}

@end