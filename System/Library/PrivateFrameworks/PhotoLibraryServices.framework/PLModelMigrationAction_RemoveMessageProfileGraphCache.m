@interface PLModelMigrationAction_RemoveMessageProfileGraphCache
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemoveMessageProfileGraphCache

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v6 = [(PLModelMigrationActionCore *)self pathManager];
  v7 = [v6 privateCacheDirectoryWithSubType:4];
  v8 = [v7 stringByAppendingPathComponent:@"PGMessageProfile.plist"];

  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (![v9 fileExistsAtPath:v8])
  {
    id v11 = 0;
LABEL_8:
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v19 = v11;
    int64_t v20 = 1;
    goto LABEL_22;
  }
  id v31 = 0;
  int v10 = [v9 removeItemAtPath:v8 error:&v31];
  id v11 = v31;
  v12 = PLMigrationGetLog();
  v13 = v12;
  if (v10)
  {
    BOOL v14 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

    if (v14)
    {
      v15 = [(PLModelMigrationActionCore *)self logger];

      if (v15)
      {
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
        long long v37 = 0u;
        long long v38 = 0u;
        memset(buf, 0, sizeof(buf));
        v16 = PLMigrationGetLog();
        os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        int v32 = 138543362;
        v33 = v8;
        LODWORD(v30) = 12;
        v17 = (uint8_t *)_os_log_send_and_compose_impl();

        v18 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v18, "logWithMessage:fromCodeLocation:type:", v17, "PLModelMigrationActions_18000.m", 1549, 1);

        if (v17 != buf) {
          free(v17);
        }
      }
      else
      {
        v26 = PLMigrationGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v8;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_INFO, "Successfully removed cache file %{public}@", buf, 0xCu);
        }
      }
    }
    goto LABEL_8;
  }
  BOOL v21 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

  if (v21)
  {
    v22 = [(PLModelMigrationActionCore *)self logger];

    if (v22)
    {
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
      long long v37 = 0u;
      long long v38 = 0u;
      memset(buf, 0, sizeof(buf));
      v23 = PLMigrationGetLog();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      int v32 = 138543618;
      v33 = v8;
      __int16 v34 = 2112;
      id v35 = v11;
      LODWORD(v30) = 22;
      v24 = (uint8_t *)_os_log_send_and_compose_impl();

      v25 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 1552, 16);

      if (v24 != buf) {
        free(v24);
      }
    }
    else
    {
      v27 = PLMigrationGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Failed to delete cache file %{public}@. Error: %@", buf, 0x16u);
      }
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v28 = v11;
  id v19 = v28;
  if (a4)
  {
    id v19 = v28;
    *a4 = v19;
  }
  int64_t v20 = 3;
LABEL_22:

  return v20;
}

@end