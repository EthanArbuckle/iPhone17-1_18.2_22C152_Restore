@interface PLModelMigrationAction_RemoveSharedLibraryAlbum
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemoveSharedLibraryAlbum

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  v8 = [v6 predicateWithFormat:@"%K = %@", @"kind", &unk_1EEBEEBC8];
  v9 = +[PLFetchingAlbum entityName];
  id v33 = 0;
  BOOL v10 = +[PLModelMigrator executeBatchDeleteWithEntityName:v9 predicate:v8 managedObjectContext:v7 error:&v33];

  id v11 = v33;
  if (v10)
  {
    v12 = PLMigrationGetLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v14 = [(PLModelMigrationActionCore *)self logger];

      if (v14)
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
        v15 = PLMigrationGetLog();
        os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        LOWORD(v34) = 0;
        LODWORD(v32) = 2;
        v16 = (uint8_t *)_os_log_send_and_compose_impl();

        v17 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v17, "logWithMessage:fromCodeLocation:type:", v16, "PLModelMigrationActions_17000.m", 71, 0);

        if (v16 != buf) {
          free(v16);
        }
      }
      else
      {
        v26 = PLMigrationGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Deleted all albums of type SharedLibraryAlbum", buf, 2u);
        }
      }
    }
    int64_t v27 = 1;
  }
  else
  {
    if (a4) {
      *a4 = v11;
    }
    v18 = PLMigrationGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      v20 = [(PLModelMigrationActionCore *)self logger];

      if (v20)
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
        v21 = PLMigrationGetLog();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        int v34 = 138543618;
        v35 = v23;
        __int16 v36 = 2114;
        id v37 = v11;
        LODWORD(v32) = 22;
        v24 = (uint8_t *)_os_log_send_and_compose_impl();

        v25 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_17000.m", 75, 16);

        if (v24 != buf) {
          free(v24);
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
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to batch delete albums of type SharedLibraryAlbum for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    int64_t v27 = 3;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];

  return v27;
}

@end