@interface PLModelMigrationAction_SetPrivacyStateOnSmartAlbums
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_SetPrivacyStateOnSmartAlbums

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v69 = 0;
  v70 = (id *)&v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__23954;
  v73 = __Block_byref_object_dispose__23955;
  id v74 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 1;
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  v7 = +[PLGenericAlbum entityName];
  v8 = [v6 fetchRequestWithEntityName:v7];

  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 1507);
  [v8 setPredicate:v9];

  [v8 setFetchBatchSize:100];
  id v64 = 0;
  v10 = [v5 executeFetchRequest:v8 error:&v64];
  id v59 = v64;
  if (v10)
  {
    v11 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v10 count], 0);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __99__PLModelMigrationAction_SetPrivacyStateOnSmartAlbums_performActionWithManagedObjectContext_error___block_invoke;
    v60[3] = &unk_1E5867398;
    v60[4] = self;
    v62 = &v69;
    v63 = &v65;
    id v12 = v11;
    id v61 = v12;
    v13 = [v5 enumerateWithIncrementalSaveUsingObjects:v10 withBlock:v60];
    if (v13)
    {
      v66[3] = 3;
      v14 = PLMigrationGetLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

      if (v15)
      {
        v16 = [(PLModelMigrationActionCore *)self logger];
        BOOL v17 = v16 == 0;

        if (v17)
        {
          v40 = PLMigrationGetLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = (objc_class *)objc_opt_class();
            v42 = NSStringFromClass(v41);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v42;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v13;
            _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "Failed to save managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          long long v108 = 0u;
          long long v109 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
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
          memset(buf, 0, sizeof(buf));
          v18 = PLMigrationGetLog();
          os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
          v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          int v75 = 138543618;
          uint64_t v76 = (uint64_t)v20;
          __int16 v77 = 2114;
          id v78 = v13;
          LODWORD(v57) = 22;
          v21 = (uint8_t *)_os_log_send_and_compose_impl();

          v22 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_16000.m", 330, 16);

          if (v21 != buf) {
            free(v21);
          }
        }
      }
      if (v70[5]) {
        id v43 = v70[5];
      }
      else {
        id v43 = v13;
      }
      objc_storeStrong(v70 + 5, v43);
    }
    else
    {
      v32 = PLMigrationGetLog();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

      if (v33)
      {
        v34 = [(PLModelMigrationActionCore *)self logger];
        BOOL v35 = v34 == 0;

        if (v35)
        {
          v55 = PLMigrationGetLog();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v56 = [v10 count];
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v56;
            _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_DEFAULT, "Updated privacy sensitive state for %lu smart albums", buf, 0xCu);
          }
        }
        else
        {
          long long v108 = 0u;
          long long v109 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
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
          memset(buf, 0, sizeof(buf));
          v36 = PLMigrationGetLog();
          os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
          uint64_t v37 = [v10 count];
          int v75 = 134217984;
          uint64_t v76 = v37;
          LODWORD(v57) = 12;
          v38 = (uint8_t *)_os_log_send_and_compose_impl();

          v39 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActions_16000.m", 327, 0);

          if (v38 != buf) {
            free(v38);
          }
        }
      }
    }
  }
  else
  {
    v66[3] = 3;
    v23 = PLMigrationGetLog();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (v24)
    {
      v25 = [(PLModelMigrationActionCore *)self logger];
      BOOL v26 = v25 == 0;

      if (v26)
      {
        v44 = PLMigrationGetLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v45);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v46;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v59;
          _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v27 = PLMigrationGetLog();
        os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        int v75 = 138543618;
        uint64_t v76 = (uint64_t)v29;
        __int16 v77 = 2114;
        id v78 = v59;
        LODWORD(v57) = 22;
        v30 = (uint8_t *)_os_log_send_and_compose_impl();

        v31 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActions_16000.m", 335, 16);

        if (v30 != buf) {
          free(v30);
        }
      }
    }
    v47 = v70;
    id v48 = v70[5];
    if (!v48) {
      id v48 = v59;
    }
    id v49 = v48;
    id v12 = v47[5];
    v47[5] = v49;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  uint64_t v50 = v66[3];
  id v51 = v70[5];
  v52 = v51;
  if (v50 != 1 && a4) {
    *a4 = v51;
  }

  int64_t v53 = v66[3];
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);

  return v53;
}

@end