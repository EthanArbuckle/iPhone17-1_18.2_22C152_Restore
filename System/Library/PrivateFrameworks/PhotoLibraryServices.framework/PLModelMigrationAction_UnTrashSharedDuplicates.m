@interface PLModelMigrationAction_UnTrashSharedDuplicates
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_UnTrashSharedDuplicates

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = 1;
  uint64_t v81 = 0;
  v82 = (id *)&v81;
  uint64_t v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__23954;
  v85 = __Block_byref_object_dispose__23955;
  id v86 = 0;
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  v7 = +[PLLibraryScope entityName];
  v8 = [v6 fetchRequestWithEntityName:v7];

  v9 = +[PLLibraryScope predicateForActiveLibraryScope];
  [v8 setPredicate:v9];

  [v8 setFetchBatchSize:1];
  v10 = v82 + 5;
  id obj = v82[5];
  v73 = [v5 executeFetchRequest:v8 error:&obj];
  objc_storeStrong(v10, obj);
  if ([v73 count])
  {
    v71 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"trashedState", 0);
    v72 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"master");
    v11 = (void *)MEMORY[0x1E4F1C0D0];
    v12 = +[PLManagedAsset entityName];
    v13 = [v11 fetchRequestWithEntityName:v12];

    v14 = (void *)MEMORY[0x1E4F28BA0];
    v99[0] = v71;
    v99[1] = v72;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:2];
    v16 = [v14 andPredicateWithSubpredicates:v15];
    [v13 setPredicate:v16];

    v98 = @"master";
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
    [v13 setRelationshipKeyPathsForPrefetching:v17];

    [v13 setFetchBatchSize:100];
    v18 = v82 + 5;
    id v79 = v82[5];
    v19 = [v5 executeFetchRequest:v13 error:&v79];
    objc_storeStrong(v18, v79);
    *(void *)&long long v95 = 0;
    *((void *)&v95 + 1) = &v95;
    uint64_t v96 = 0x2020000000;
    uint64_t v97 = 0;
    if (![v19 count])
    {
      if (!v19) {
        v88[3] = 3;
      }
      goto LABEL_32;
    }
    v20 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v19 count], 0);
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __94__PLModelMigrationAction_UnTrashSharedDuplicates_performActionWithManagedObjectContext_error___block_invoke;
    v74[3] = &unk_1E5867460;
    v76 = &v95;
    v74[4] = self;
    v77 = &v81;
    v78 = &v87;
    id v69 = v20;
    id v75 = v69;
    v21 = [v5 enumerateWithIncrementalSaveUsingObjects:v19 withBlock:v74];
    v22 = v21;
    uint64_t v23 = v88[3];
    if (v23 == 2 || !v21)
    {
      if (v23 == 1)
      {
        v33 = PLMigrationGetLog();
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

        if (v34)
        {
          v35 = [(PLModelMigrationActionCore *)self logger];
          BOOL v36 = v35 == 0;

          if (!v36)
          {
            long long v129 = 0u;
            long long v130 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            long long v125 = 0u;
            long long v126 = 0u;
            long long v123 = 0u;
            long long v124 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            long long v119 = 0u;
            long long v120 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            memset(buf, 0, sizeof(buf));
            v37 = PLMigrationGetLog();
            os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
            v38 = (objc_class *)objc_opt_class();
            v39 = NSStringFromClass(v38);
            uint64_t v40 = *(void *)(*((void *)&v95 + 1) + 24);
            int v91 = 138543618;
            v92 = v39;
            __int16 v93 = 1026;
            LODWORD(v94) = v40;
            LODWORD(v68) = 18;
            v41 = (uint8_t *)_os_log_send_and_compose_impl();

            v42 = [(PLModelMigrationActionCore *)self logger];
            objc_msgSend(v42, "logWithMessage:fromCodeLocation:type:", v41, "PLModelMigrationActions_16000.m", 1169, 0);

            goto LABEL_19;
          }
          v56 = PLMigrationGetLog();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            v60 = (objc_class *)objc_opt_class();
            v61 = NSStringFromClass(v60);
            uint64_t v62 = *(void *)(*((void *)&v95 + 1) + 24);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v61;
            *(_WORD *)&buf[12] = 1026;
            *(_DWORD *)&buf[14] = v62;
            _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@: Un-trashed %{public}d assets.", buf, 0x12u);
          }
          goto LABEL_30;
        }
LABEL_31:

LABEL_32:
        [(PLModelMigrationActionCore *)self finalizeProgress];
        uint64_t v63 = v88[3];
        id v64 = v82[5];
        v65 = v64;
        if (v63 != 1 && a4) {
          *a4 = v64;
        }

        int64_t v55 = v88[3];
        _Block_object_dispose(&v95, 8);

        goto LABEL_36;
      }
    }
    else
    {
      objc_storeStrong(v82 + 5, v21);
      v88[3] = 3;
    }
    v43 = PLMigrationGetLog();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);

    if (v44)
    {
      v45 = [(PLModelMigrationActionCore *)self logger];
      BOOL v46 = v45 == 0;

      if (!v46)
      {
        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        memset(buf, 0, sizeof(buf));
        v47 = PLMigrationGetLog();
        os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
        v48 = (objc_class *)objc_opt_class();
        v49 = NSStringFromClass(v48);
        id v50 = v82[5];
        int v91 = 138543618;
        v92 = v49;
        __int16 v93 = 2114;
        id v94 = v50;
        LODWORD(v68) = 22;
        v41 = (uint8_t *)_os_log_send_and_compose_impl();

        v51 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v51, "logWithMessage:fromCodeLocation:type:", v41, "PLModelMigrationActions_16000.m", 1171, 16);

LABEL_19:
        if (v41 != buf) {
          free(v41);
        }
        goto LABEL_31;
      }
      v56 = PLMigrationGetLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = (objc_class *)objc_opt_class();
        v58 = NSStringFromClass(v57);
        id v59 = v82[5];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v58;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v59;
        _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_ERROR, "Failed to save managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
      }
LABEL_30:

      goto LABEL_31;
    }
    goto LABEL_31;
  }
  v24 = PLMigrationGetLog();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  if (v25)
  {
    v26 = [(PLModelMigrationActionCore *)self logger];
    BOOL v27 = v26 == 0;

    if (v27)
    {
      v52 = PLMigrationGetLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = (objc_class *)objc_opt_class();
        v54 = NSStringFromClass(v53);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v54;
        _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_DEFAULT, "Skipping migration step %{public}@: No active library scope.", buf, 0xCu);
      }
    }
    else
    {
      long long v129 = 0u;
      long long v130 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      memset(buf, 0, sizeof(buf));
      v28 = PLMigrationGetLog();
      os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      LODWORD(v95) = 138543362;
      *(void *)((char *)&v95 + 4) = v30;
      LODWORD(v67) = 12;
      v31 = (uint8_t *)_os_log_send_and_compose_impl();

      v32 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v31, "PLModelMigrationActions_16000.m", 1127, 0);

      if (v31 != buf) {
        free(v31);
      }
    }
  }
  int64_t v55 = v88[3];
LABEL_36:

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v87, 8);

  return v55;
}

@end