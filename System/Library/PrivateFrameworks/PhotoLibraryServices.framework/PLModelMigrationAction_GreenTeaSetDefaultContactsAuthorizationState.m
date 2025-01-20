@interface PLModelMigrationAction_GreenTeaSetDefaultContactsAuthorizationState
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_GreenTeaSetDefaultContactsAuthorizationState

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = 1;
  v8 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:0];
  v9 = +[PLGlobalKeyValue fetchGlobalKeyValueForKey:@"GreenTeaContactsAuthorization" withManagedObjectContext:v6 createIfMissing:0];
  id v10 = 0;
  if (!v9)
  {
    +[PLGlobalKeyValue setGlobalValue:&unk_1EEBEEBB0 forKey:@"GreenTeaContactsAuthorization" managedObjectContext:v6];
    id v35 = 0;
    char v11 = [v6 save:&v35];
    id v10 = v35;
    if (v11)
    {
      int64_t v7 = 1;
      v34 = v8;
      [v8 setCompletedUnitCount:1];
      v12 = PLMigrationGetLog();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        v14 = [(PLModelMigrationActionCore *)self logger];

        if (v14)
        {
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          memset(buf, 0, sizeof(buf));
          v15 = PLMigrationGetLog();
          os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          uint64_t v16 = [&unk_1EEBEEBB0 integerValue];
          int v36 = 138543618;
          v37 = @"GreenTeaContactsAuthorization";
          __int16 v38 = 2048;
          uint64_t v39 = v16;
          LODWORD(v33) = 22;
          v17 = (uint8_t *)_os_log_send_and_compose_impl();

          v18 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v18, "logWithMessage:fromCodeLocation:type:", v17, "PLModelMigrationActions_15000.m", 774, 0);

          v8 = v34;
          if (v17 != buf) {
            free(v17);
          }
        }
        else
        {
          v27 = PLMigrationGetLog();
          v8 = v34;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v28 = [&unk_1EEBEEBB0 integerValue];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = @"GreenTeaContactsAuthorization";
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v28;
            _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Updated global value %{public}@ with token %td", buf, 0x16u);
          }
        }
        int64_t v7 = 1;
      }
      else
      {
        v8 = v34;
      }
    }
    else
    {
      v19 = PLMigrationGetLog();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v20)
      {
        v21 = [(PLModelMigrationActionCore *)self logger];

        if (v21)
        {
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          memset(buf, 0, sizeof(buf));
          v22 = PLMigrationGetLog();
          os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
          int v36 = 138543618;
          v37 = v24;
          __int16 v38 = 2112;
          uint64_t v39 = (uint64_t)v10;
          LODWORD(v33) = 22;
          v25 = (uint8_t *)_os_log_send_and_compose_impl();

          v26 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_15000.m", 771, 16);

          if (v25 != buf) {
            free(v25);
          }
        }
        else
        {
          v29 = PLMigrationGetLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = (objc_class *)objc_opt_class();
            v31 = NSStringFromClass(v30);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v10;
            _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %@", buf, 0x16u);
          }
        }
      }
      int64_t v7 = 3;
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v10;
  }

  return v7;
}

@end