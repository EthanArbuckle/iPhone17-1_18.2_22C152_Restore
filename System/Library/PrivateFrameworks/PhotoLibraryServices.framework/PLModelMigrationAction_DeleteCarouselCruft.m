@interface PLModelMigrationAction_DeleteCarouselCruft
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_DeleteCarouselCruft

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PLModelMigrationActionCore *)self pathManager];
  v7 = [v6 internalDirectoryWithSubType:4 additionalPathComponents:0 createIfNeeded:0 error:0];

  v63 = v7;
  v64 = self;
  if ([v7 length])
  {
    id v61 = v5;
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v9 = [&unk_1EEBF1D18 countByEnumeratingWithState:&v67 objects:v106 count:16];
    if (!v9) {
      goto LABEL_26;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v68;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v68 != v11) {
          objc_enumerationMutation(&unk_1EEBF1D18);
        }
        v13 = [v7 stringByAppendingPathComponent:*(void *)(*((void *)&v67 + 1) + 8 * i)];
        if ([v8 fileExistsAtPath:v13])
        {
          id v66 = 0;
          int v14 = [v8 removeItemAtPath:v13 error:&v66];
          id v15 = v66;
          v16 = PLMigrationGetLog();
          v17 = v16;
          if (v14)
          {
            BOOL v18 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

            if (!v18) {
              goto LABEL_23;
            }
            v19 = [(PLModelMigrationActionCore *)v64 logger];

            if (v19)
            {
              long long v104 = 0u;
              long long v105 = 0u;
              long long v102 = 0u;
              long long v103 = 0u;
              long long v100 = 0u;
              long long v101 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              long long v94 = 0u;
              long long v95 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              long long v82 = 0u;
              long long v83 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              memset(buf, 0, sizeof(buf));
              v20 = PLMigrationGetLog();
              os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
              v21 = [v13 lastPathComponent];
              int v71 = 138543362;
              v72 = v21;
              LODWORD(v59) = 12;
              v22 = (uint8_t *)_os_log_send_and_compose_impl();

              v23 = [(PLModelMigrationActionCore *)v64 logger];
              v24 = v23;
              v25 = v22;
              uint64_t v26 = 1817;
              uint64_t v27 = 1;
LABEL_15:
              objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", v26, v27);

              if (v22 != buf) {
                free(v22);
              }
LABEL_22:
              v7 = v63;
LABEL_23:

              goto LABEL_24;
            }
            v32 = PLMigrationGetLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              v33 = [v13 lastPathComponent];
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v33;
              _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_INFO, "Successfully deleted file at %{public}@", buf, 0xCu);
            }
          }
          else
          {
            BOOL v28 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

            if (!v28) {
              goto LABEL_23;
            }
            v29 = [(PLModelMigrationActionCore *)v64 logger];

            if (v29)
            {
              long long v104 = 0u;
              long long v105 = 0u;
              long long v102 = 0u;
              long long v103 = 0u;
              long long v100 = 0u;
              long long v101 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              long long v94 = 0u;
              long long v95 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              long long v82 = 0u;
              long long v83 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              memset(buf, 0, sizeof(buf));
              v30 = PLMigrationGetLog();
              os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
              v31 = [v13 lastPathComponent];
              int v71 = 138543618;
              v72 = v31;
              __int16 v73 = 2112;
              id v74 = v15;
              LODWORD(v59) = 22;
              v22 = (uint8_t *)_os_log_send_and_compose_impl();

              v23 = [(PLModelMigrationActionCore *)v64 logger];
              v24 = v23;
              v25 = v22;
              uint64_t v26 = 1819;
              uint64_t v27 = 16;
              goto LABEL_15;
            }
            v32 = PLMigrationGetLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v34 = [v13 lastPathComponent];
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v34;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v15;
              _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Failed to delete file at %{public}@. Error: %@", buf, 0x16u);
            }
          }

          goto LABEL_22;
        }
LABEL_24:
      }
      uint64_t v10 = [&unk_1EEBF1D18 countByEnumeratingWithState:&v67 objects:v106 count:16];
      if (!v10)
      {
LABEL_26:

        id v5 = v61;
        self = v64;
        break;
      }
    }
  }
  v35 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"type", 9);
  v36 = +[PLSuggestion entityName];
  id v65 = 0;
  BOOL v37 = +[PLModelMigrator executeBatchDeleteWithEntityName:v36 predicate:v35 managedObjectContext:v5 error:&v65];
  id v38 = v65;

  if (!v37)
  {
    if (a4) {
      *a4 = v38;
    }
    v46 = PLMigrationGetLog();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);

    if (v47)
    {
      v48 = [(PLModelMigrationActionCore *)self logger];

      if (v48)
      {
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        memset(buf, 0, sizeof(buf));
        v49 = PLMigrationGetLog();
        os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
        v50 = (objc_class *)objc_opt_class();
        v51 = NSStringFromClass(v50);
        int v71 = 138543618;
        v72 = v51;
        __int16 v73 = 2114;
        id v74 = v38;
        LODWORD(v60) = 22;
        v52 = (uint8_t *)_os_log_send_and_compose_impl();

        v53 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v53, "logWithMessage:fromCodeLocation:type:", v52, "PLModelMigrationActions_18000.m", 1834, 16);

        if (v52 != buf) {
          free(v52);
        }
        int64_t v45 = 3;
        goto LABEL_40;
      }
      v55 = PLMigrationGetLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v56 = (objc_class *)objc_opt_class();
        v57 = NSStringFromClass(v56);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v38;
        _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_ERROR, "Failed to batch delete managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
      }
    }
    int64_t v45 = 3;
    goto LABEL_49;
  }
  v39 = PLMigrationGetLog();
  BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

  if (!v40)
  {
LABEL_44:
    int64_t v45 = 1;
    goto LABEL_49;
  }
  v41 = [(PLModelMigrationActionCore *)self logger];

  if (!v41)
  {
    v54 = PLMigrationGetLog();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_DEFAULT, "Deleted all carousel suggestions", buf, 2u);
    }

    goto LABEL_44;
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  memset(buf, 0, sizeof(buf));
  v42 = PLMigrationGetLog();
  os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
  LOWORD(v71) = 0;
  LODWORD(v60) = 2;
  v43 = (uint8_t *)_os_log_send_and_compose_impl();

  v44 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v44, "logWithMessage:fromCodeLocation:type:", v43, "PLModelMigrationActions_18000.m", 1830, 0);

  if (v43 != buf) {
    free(v43);
  }
  int64_t v45 = 1;
LABEL_40:
  v7 = v63;
  self = v64;
LABEL_49:
  [(PLModelMigrationActionCore *)self finalizeProgress];

  return v45;
}

@end