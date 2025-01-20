@interface PLModelMigrationAction_ResetSocialGroup
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetSocialGroup

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:1];
  [v7 becomeCurrentWithPendingUnitCount:1];
  id v33 = 0;
  BOOL v8 = +[PLSocialGroup resetAllInContext:v6 error:&v33];

  id v9 = v33;
  v10 = PLMigrationGetLog();
  v11 = v10;
  if (v8)
  {
    BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = [(PLModelMigrationActionCore *)self logger];

      if (v13)
      {
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
        long long v39 = 0u;
        long long v40 = 0u;
        memset(buf, 0, sizeof(buf));
        v14 = PLMigrationGetLog();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        LOWORD(v34) = 0;
        LODWORD(v32) = 2;
        v15 = (uint8_t *)_os_log_send_and_compose_impl();

        v16 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigrationActions_18000.m", 375, 0);

        if (v15 != buf) {
          free(v15);
        }
      }
      else
      {
        v24 = PLMigrationGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Deleted all SocialGroups", buf, 2u);
        }
      }
    }
    [v7 resignCurrent];
    id v25 = v9;
    int64_t v26 = 1;
  }
  else
  {
    BOOL v17 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      v18 = [(PLModelMigrationActionCore *)self logger];

      if (v18)
      {
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
        long long v39 = 0u;
        long long v40 = 0u;
        memset(buf, 0, sizeof(buf));
        v19 = PLMigrationGetLog();
        os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        int v34 = 138543618;
        v35 = v21;
        __int16 v36 = 2112;
        id v37 = v9;
        LODWORD(v32) = 22;
        v22 = (uint8_t *)_os_log_send_and_compose_impl();

        v23 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_18000.m", 378, 16);

        if (v22 != buf) {
          free(v22);
        }
      }
      else
      {
        v27 = PLMigrationGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (objc_class *)objc_opt_class();
          v29 = NSStringFromClass(v28);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
        }
      }
    }
    [v7 resignCurrent];
    id v30 = v9;
    if (a4) {
      *a4 = v30;
    }
    int64_t v26 = 3;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  return v26;
}

@end