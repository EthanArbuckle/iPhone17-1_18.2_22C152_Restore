@interface PLModelMigrationAction_ResetFilesystemImportToken
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetFilesystemImportToken

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:0];
  v8 = [[PLGlobalValues alloc] initWithManagedObjectContext:v6];
  [(PLGlobalValues *)v8 setImportFilesystemAssetsState:-1];
  id v34 = 0;
  char v9 = [v6 save:&v34];

  id v10 = v34;
  if (v9)
  {
    [v7 setCompletedUnitCount:1];
    v11 = PLMigrationGetLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = [(PLModelMigrationActionCore *)self logger];

      if (v13)
      {
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
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        memset(buf, 0, sizeof(buf));
        v14 = PLMigrationGetLog();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        LOWORD(v35) = 0;
        LODWORD(v33) = 2;
        v15 = (uint8_t *)_os_log_send_and_compose_impl();

        v16 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigrationActions_17000.m", 572, 0);

        if (v15 != buf) {
          free(v15);
        }
      }
      else
      {
        v25 = PLMigrationGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Reset the filesystem import token", buf, 2u);
        }
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v26 = v10;
    int64_t v27 = 1;
  }
  else
  {
    v17 = PLMigrationGetLog();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (v18)
    {
      v19 = [(PLModelMigrationActionCore *)self logger];

      if (v19)
      {
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
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        memset(buf, 0, sizeof(buf));
        v20 = PLMigrationGetLog();
        os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        int v35 = 138543618;
        v36 = v22;
        __int16 v37 = 2112;
        id v38 = v10;
        LODWORD(v33) = 22;
        v23 = (uint8_t *)_os_log_send_and_compose_impl();

        v24 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_17000.m", 569, 16);

        if (v23 != buf) {
          free(v23);
        }
      }
      else
      {
        v28 = PLMigrationGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v10;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %@", buf, 0x16u);
        }
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v31 = v10;
    if (a4) {
      *a4 = v31;
    }
    int64_t v27 = 3;
  }

  return v27;
}

@end