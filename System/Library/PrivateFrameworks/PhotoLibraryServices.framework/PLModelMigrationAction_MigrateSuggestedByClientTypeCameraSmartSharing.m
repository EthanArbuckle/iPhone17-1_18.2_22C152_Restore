@interface PLModelMigrationAction_MigrateSuggestedByClientTypeCameraSmartSharing
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4 shouldForce:(BOOL)a5;
@end

@implementation PLModelMigrationAction_MigrateSuggestedByClientTypeCameraSmartSharing

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4 shouldForce:(BOOL)a5
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x2020000000;
  uint64_t v97 = 1;
  if (a5 || !MEMORY[0x19F38BDA0]())
  {
    *(void *)&long long v105 = 0;
    *((void *)&v105 + 1) = &v105;
    uint64_t v106 = 0x3032000000;
    v107 = __Block_byref_object_copy__23954;
    v108 = __Block_byref_object_dispose__23955;
    id v109 = 0;
    v17 = (void *)MEMORY[0x1E4F1C0D0];
    v18 = +[PLLibraryScope entityName];
    v19 = [v17 fetchRequestWithEntityName:v18];

    v20 = +[PLLibraryScope predicateForActiveLibraryScope];
    [v19 setPredicate:v20];

    [v19 setFetchBatchSize:1];
    v21 = (id *)(*((void *)&v105 + 1) + 40);
    id obj = *(id *)(*((void *)&v105 + 1) + 40);
    v22 = [v7 executeFetchRequest:v19 error:&obj];
    objc_storeStrong(v21, obj);
    if (![v22 count])
    {
      v44 = PLMigrationGetLog();
      BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);

      if (v45)
      {
        v46 = [(PLModelMigrationActionCore *)self logger];
        BOOL v47 = v46 == 0;

        if (v47)
        {
          v54 = PLMigrationGetLog();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            v55 = (objc_class *)objc_opt_class();
            v56 = NSStringFromClass(v55);
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v56;
            _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_DEFAULT, "Skipping migration %{public}@: No active library scope.", buf, 0xCu);
          }
        }
        else
        {
          long long v139 = 0u;
          long long v140 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          long long v135 = 0u;
          long long v136 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
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
          memset(buf, 0, sizeof(buf));
          v48 = PLMigrationGetLog();
          os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
          v49 = (objc_class *)objc_opt_class();
          v50 = NSStringFromClass(v49);
          LODWORD(v102) = 138543362;
          *(void *)((char *)&v102 + 4) = v50;
          LODWORD(v82) = 12;
          v51 = (uint8_t *)_os_log_send_and_compose_impl();

          v52 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v52, "logWithMessage:fromCodeLocation:type:", v51, "PLModelMigrationActions_16000.m", 962, 0);

          if (v51 != buf) {
            free(v51);
          }
        }
      }
      int64_t v57 = v95[3];
      goto LABEL_38;
    }
    v84 = [v22 firstObject];
    v23 = +[PLManagedAsset fetchRequest];
    v24 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0", @"libraryScopeShareState");
    [v23 setPredicate:v24];

    [v23 setFetchBatchSize:100];
    v25 = (id *)(*((void *)&v105 + 1) + 40);
    id v92 = *(id *)(*((void *)&v105 + 1) + 40);
    v26 = [v7 executeFetchRequest:v23 error:&v92];
    objc_storeStrong(v25, v92);
    if (![v26 count])
    {
      if (!v26) {
        v95[3] = 3;
      }
      goto LABEL_34;
    }
    v27 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v26 count], 0);
    *(void *)&long long v102 = 0;
    *((void *)&v102 + 1) = &v102;
    uint64_t v103 = 0x2020000000;
    int v104 = 0;
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __129__PLModelMigrationAction_MigrateSuggestedByClientTypeCameraSmartSharing_performActionWithManagedObjectContext_error_shouldForce___block_invoke;
    v87[3] = &unk_1E5867460;
    v89 = &v102;
    v87[4] = self;
    v90 = &v105;
    v91 = &v94;
    id v83 = v27;
    id v88 = v83;
    uint64_t v28 = [v7 enumerateWithIncrementalSaveUsingObjects:v26 withBlock:v87];
    id v29 = (id)v28;
    uint64_t v30 = v95[3];
    if (v30 == 2) {
      goto LABEL_12;
    }
    if (v28) {
      goto LABEL_11;
    }
    if (*(int *)(*((void *)&v102 + 1) + 24) < 1)
    {
      id v29 = 0;
    }
    else
    {
      objc_msgSend(v84, "setCountOfAssetsAddedByCameraSmartSharing:");
      id v86 = 0;
      int v53 = [v7 save:&v86];
      id v29 = v86;
      if (!v53)
      {
LABEL_11:
        uint64_t v31 = *((void *)&v105 + 1);
        id v29 = v29;
        v32 = *(void **)(v31 + 40);
        *(void *)(v31 + 40) = v29;

        v95[3] = 3;
        goto LABEL_12;
      }
      uint64_t v30 = v95[3];
    }
    if (v30 == 1)
    {
      v69 = PLMigrationGetLog();
      BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);

      if (!v70) {
        goto LABEL_33;
      }
      v71 = [(PLModelMigrationActionCore *)self logger];
      BOOL v72 = v71 == 0;

      if (!v72)
      {
        long long v139 = 0u;
        long long v140 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v73 = PLMigrationGetLog();
        os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT);
        v74 = (objc_class *)objc_opt_class();
        v75 = NSStringFromClass(v74);
        int v76 = *(_DWORD *)(*((void *)&v102 + 1) + 24);
        int v98 = 138543618;
        v99 = v75;
        __int16 v100 = 1026;
        LODWORD(v101) = v76;
        LODWORD(v82) = 18;
        v77 = (uint8_t *)_os_log_send_and_compose_impl();

        v78 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v78, "logWithMessage:fromCodeLocation:type:", v77, "PLModelMigrationActions_16000.m", 1006, 0);

        if (v77 == buf) {
          goto LABEL_33;
        }
        v43 = v77;
        goto LABEL_16;
      }
      v58 = PLMigrationGetLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v79 = (objc_class *)objc_opt_class();
        v80 = NSStringFromClass(v79);
        int v81 = *(_DWORD *)(*((void *)&v102 + 1) + 24);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v80;
        *(_WORD *)&buf[12] = 1026;
        *(_DWORD *)&buf[14] = v81;
        _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@: Migrated %{public}d assets.", buf, 0x12u);
      }
      goto LABEL_32;
    }
LABEL_12:
    v33 = PLMigrationGetLog();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

    if (!v34) {
      goto LABEL_33;
    }
    v35 = [(PLModelMigrationActionCore *)self logger];
    BOOL v36 = v35 == 0;

    if (!v36)
    {
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
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
      memset(buf, 0, sizeof(buf));
      v37 = PLMigrationGetLog();
      os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      uint64_t v40 = *(void *)(*((void *)&v105 + 1) + 40);
      int v98 = 138543618;
      v99 = v39;
      __int16 v100 = 2114;
      uint64_t v101 = v40;
      LODWORD(v82) = 22;
      v41 = (uint8_t *)_os_log_send_and_compose_impl();

      v42 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v42, "logWithMessage:fromCodeLocation:type:", v41, "PLModelMigrationActions_16000.m", 1008, 16);

      if (v41 != buf)
      {
        v43 = v41;
LABEL_16:
        free(v43);
      }
LABEL_33:

      _Block_object_dispose(&v102, 8);
LABEL_34:
      [(PLModelMigrationActionCore *)self finalizeProgress];
      uint64_t v62 = v95[3];
      id v63 = *(id *)(*((void *)&v105 + 1) + 40);
      v64 = v63;
      if (v62 != 1 && a4) {
        *a4 = v63;
      }

      int64_t v57 = v95[3];
LABEL_38:

      _Block_object_dispose(&v105, 8);
      goto LABEL_43;
    }
    v58 = PLMigrationGetLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = (objc_class *)objc_opt_class();
      v60 = NSStringFromClass(v59);
      uint64_t v61 = *(void *)(*((void *)&v105 + 1) + 40);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v60;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v61;
      _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_ERROR, "Failed to save managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
    }
LABEL_32:

    goto LABEL_33;
  }
  v8 = PLMigrationGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = [(PLModelMigrationActionCore *)self logger];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      v65 = PLMigrationGetLog();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v66 = (objc_class *)objc_opt_class();
        v67 = NSStringFromClass(v66);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v67;
        _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_DEFAULT, "Skipping migration %{public}@ on internal builds.", buf, 0xCu);
      }
    }
    else
    {
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
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
      memset(buf, 0, sizeof(buf));
      v12 = PLMigrationGetLog();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      LODWORD(v105) = 138543362;
      *(void *)((char *)&v105 + 4) = v14;
      LODWORD(v82) = 12;
      v15 = (uint8_t *)_os_log_send_and_compose_impl();

      v16 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigrationActions_16000.m", 947, 0);

      if (v15 != buf) {
        free(v15);
      }
    }
  }
  int64_t v57 = v95[3];
LABEL_43:
  _Block_object_dispose(&v94, 8);

  return v57;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  return [(PLModelMigrationAction_MigrateSuggestedByClientTypeCameraSmartSharing *)self performActionWithManagedObjectContext:a3 error:a4 shouldForce:0];
}

@end