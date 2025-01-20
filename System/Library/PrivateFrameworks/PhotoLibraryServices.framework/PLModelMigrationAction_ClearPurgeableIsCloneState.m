@interface PLModelMigrationAction_ClearPurgeableIsCloneState
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ClearPurgeableIsCloneState

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v6 = PLMigrationGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    v8 = [(PLModelMigrationActionCore *)self logger];

    if (v8)
    {
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
      long long v37 = 0u;
      long long v38 = 0u;
      long long v36 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      *(_OWORD *)buf = 0u;
      v9 = PLMigrationGetLog();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      LOWORD(v27) = 0;
      LODWORD(v25) = 2;
      v10 = (uint8_t *)_os_log_send_and_compose_impl();

      v11 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v11, "logWithMessage:fromCodeLocation:type:", v10, "PLModelMigrationActions_15000.m", 744, 0);

      if (v10 != buf) {
        free(v10);
      }
    }
    else
    {
      v12 = PLMigrationGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Setting clearPurgeableIsCloneStateOnPurgeableResourcesOnce flag to clear purgeable is-clone state once on library maintenance", buf, 2u);
      }
    }
  }
  v13 = [(PLModelMigrationActionCore *)self pathManager];
  id v26 = 0;
  BOOL v14 = +[PLCacheDeleteSupport setClearPurgeableIsCloneStateOnPurgeableResourcesOnceWithPathManager:v13 error:&v26];
  id v15 = v26;

  if (v14)
  {
    int64_t v16 = 1;
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
        long long v37 = 0u;
        long long v38 = 0u;
        long long v36 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        *(_OWORD *)buf = 0u;
        v20 = PLMigrationGetLog();
        os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        int v27 = 138412290;
        id v28 = v15;
        LODWORD(v25) = 12;
        v21 = (uint8_t *)_os_log_send_and_compose_impl();

        v22 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_15000.m", 747, 16);

        if (v21 != buf) {
          free(v21);
        }
      }
      else
      {
        v23 = PLMigrationGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v15;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to set clearPurgeableIsCloneStateOnPurgeableResourcesOnce flag: %@", buf, 0xCu);
        }
      }
    }
    int64_t v16 = 3;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v15;
  }

  return v16;
}

@end