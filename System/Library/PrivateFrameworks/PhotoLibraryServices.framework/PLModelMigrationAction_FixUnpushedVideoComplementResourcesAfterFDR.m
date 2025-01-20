@interface PLModelMigrationAction_FixUnpushedVideoComplementResourcesAfterFDR
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixUnpushedVideoComplementResourcesAfterFDR

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v118[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[PLManagedAsset fetchRequest];
  v7 = (void *)MEMORY[0x1E4F28BA0];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 0);
  v118[0] = v8;
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kindSubtype", 2);
  v118[1] = v9;
  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"master");
  v118[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:3];
  v12 = [v7 andPredicateWithSubpredicates:v11];
  [v6 setPredicate:v12];

  [v6 setFetchBatchSize:100];
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  uint64_t v82 = 1;
  uint64_t v73 = 0;
  v74 = (id *)&v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__23954;
  v77 = __Block_byref_object_dispose__23955;
  id v78 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  id v68 = 0;
  v13 = [v5 executeFetchRequest:v6 error:&v68];
  id v14 = v68;
  if ([v13 count])
  {
    v15 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v13 count], 0);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __114__PLModelMigrationAction_FixUnpushedVideoComplementResourcesAfterFDR_performActionWithManagedObjectContext_error___block_invoke;
    v63[3] = &unk_1E5867460;
    v65 = &v69;
    v63[4] = self;
    v66 = &v73;
    v67 = &v79;
    id v16 = v15;
    id v64 = v16;
    v17 = [v5 enumerateWithIncrementalSaveUsingObjects:v13 withBlock:v63];
    if (v17)
    {
      v80[3] = 3;
      v18 = PLMigrationGetLog();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

      if (v19)
      {
        v20 = [(PLModelMigrationActionCore *)self logger];
        BOOL v21 = v20 == 0;

        if (v21)
        {
          v44 = PLMigrationGetLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v45 = (objc_class *)objc_opt_class();
            v46 = NSStringFromClass(v45);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v46;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v17;
            _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "Failed to save managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          long long v116 = 0u;
          long long v117 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
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
          memset(buf, 0, sizeof(buf));
          v22 = PLMigrationGetLog();
          os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
          v23 = (objc_class *)objc_opt_class();
          v24 = NSStringFromClass(v23);
          int v83 = 138543618;
          v84 = v24;
          __int16 v85 = 2114;
          id v86 = v17;
          LODWORD(v61) = 22;
          v25 = (uint8_t *)_os_log_send_and_compose_impl();

          v26 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_16000.m", 898, 16);

          if (v25 != buf) {
            free(v25);
          }
        }
      }
      if (v74[5]) {
        id v47 = v74[5];
      }
      else {
        id v47 = v17;
      }
      objc_storeStrong(v74 + 5, v47);
    }
    else
    {
      v36 = PLMigrationGetLog();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

      if (v37)
      {
        v38 = [(PLModelMigrationActionCore *)self logger];
        BOOL v39 = v38 == 0;

        if (v39)
        {
          v53 = PLMigrationGetLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v54 = v70[3];
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v54;
            _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEFAULT, "Fixed unpushed video complement resources: %tu", buf, 0xCu);
          }
        }
        else
        {
          long long v116 = 0u;
          long long v117 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
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
          memset(buf, 0, sizeof(buf));
          v40 = PLMigrationGetLog();
          os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
          v41 = (void *)v70[3];
          int v83 = 134217984;
          v84 = v41;
          LODWORD(v61) = 12;
          v42 = (uint8_t *)_os_log_send_and_compose_impl();

          v43 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v43, "logWithMessage:fromCodeLocation:type:", v42, "PLModelMigrationActions_16000.m", 895, 0);

          if (v42 != buf) {
            free(v42);
          }
        }
      }
    }

LABEL_24:
    goto LABEL_25;
  }
  if (!v13)
  {
    v80[3] = 3;
    v27 = PLMigrationGetLog();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

    if (v28)
    {
      v29 = [(PLModelMigrationActionCore *)self logger];
      BOOL v30 = v29 == 0;

      if (v30)
      {
        v55 = PLMigrationGetLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          v56 = (objc_class *)objc_opt_class();
          v57 = NSStringFromClass(v56);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v57;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v14;
          _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v31 = PLMigrationGetLog();
        os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        int v83 = 138543618;
        v84 = v33;
        __int16 v85 = 2114;
        id v86 = v14;
        LODWORD(v61) = 22;
        v34 = (uint8_t *)_os_log_send_and_compose_impl();

        v35 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActions_16000.m", 903, 16);

        if (v34 != buf) {
          free(v34);
        }
      }
    }
    v58 = v74;
    id v59 = v74[5];
    if (!v59) {
      id v59 = v14;
    }
    id v60 = v59;
    id v16 = v58[5];
    v58[5] = v60;
    goto LABEL_24;
  }
LABEL_25:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  uint64_t v48 = v80[3];
  id v49 = v74[5];
  v50 = v49;
  if (v48 != 1 && a4) {
    *a4 = v49;
  }

  int64_t v51 = v80[3];
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
  return v51;
}

@end