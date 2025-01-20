@interface PLModelMigrationAction_RevalidateFaceAreaPoints
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RevalidateFaceAreaPoints

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v122[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLManagedAsset entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.@count > 0", @"detectedFaces");
  v122[0] = v11;
  if (v6) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"addedDate", v6];
  }
  else {
  v12 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v122[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:2];
  v14 = [v10 andPredicateWithSubpredicates:v13];
  [v9 setPredicate:v14];

  v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
  v121 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
  [v9 setSortDescriptors:v16];

  v120 = @"detectedFaces";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v17];

  [v9 setFetchBatchSize:100];
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 1;
  uint64_t v75 = 0;
  v76 = (id *)&v75;
  uint64_t v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__1142;
  v79 = __Block_byref_object_dispose__1143;
  id v80 = 0;
  id obj = 0;
  v18 = [v5 executeFetchRequest:v9 error:&obj];
  objc_storeStrong(&v80, obj);
  if (v18)
  {
    v19 = -[PLModelMigrationActionBackground cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v18 count], 0);
    v20 = PLMigrationGetLog();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

    if (v21)
    {
      v22 = [(PLModelMigrationActionBackground *)self logger];
      BOOL v23 = v22 == 0;

      if (v23)
      {
        v38 = PLMigrationGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          uint64_t v39 = [v18 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v39;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_INFO, "Revalidating faceAreaPoints for %lu assets", buf, 0xCu);
        }
      }
      else
      {
        long long v118 = 0u;
        long long v119 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v24 = PLMigrationGetLog();
        os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
        uint64_t v25 = [v18 count];
        int v85 = 134217984;
        uint64_t v86 = v25;
        LODWORD(v68) = 12;
        v26 = (uint8_t *)_os_log_send_and_compose_impl();

        v27 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigrationActionBackground.m", 214, 1);

        if (v26 != buf) {
          free(v26);
        }
      }
    }
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __95__PLModelMigrationAction_RevalidateFaceAreaPoints_performActionWithManagedObjectContext_error___block_invoke;
    v70[3] = &unk_1E586B2F0;
    v70[4] = self;
    v72 = &v81;
    v73 = &v75;
    id v40 = v19;
    id v71 = v40;
    v41 = [v5 enumerateWithIncrementalSaveUsingObjects:v18 withBlock:v70];
    if (v41 && !v76[5])
    {
      objc_storeStrong(v76 + 5, v41);
      v82[3] = 3;
      v50 = PLMigrationGetLog();
      BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);

      if (v51)
      {
        v52 = [(PLModelMigrationActionBackground *)self logger];
        BOOL v53 = v52 == 0;

        if (!v53)
        {
          long long v118 = 0u;
          long long v119 = 0u;
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
          memset(buf, 0, sizeof(buf));
          v54 = PLMigrationGetLog();
          os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
          v55 = (objc_class *)objc_opt_class();
          v56 = NSStringFromClass(v55);
          int v85 = 138543618;
          uint64_t v86 = (uint64_t)v56;
          __int16 v87 = 2112;
          v88 = v41;
          LODWORD(v68) = 22;
          v48 = (uint8_t *)_os_log_send_and_compose_impl();

          v57 = [(PLModelMigrationActionBackground *)self logger];
          objc_msgSend(v57, "logWithMessage:fromCodeLocation:type:", v48, "PLModelMigrationActionBackground.m", 237, 16);

LABEL_24:
          if (v48 != buf) {
            free(v48);
          }
          goto LABEL_35;
        }
        v58 = PLMigrationGetLog();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v64 = (objc_class *)objc_opt_class();
          v65 = NSStringFromClass(v64);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v65;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v41;
          _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %@", buf, 0x16u);
        }
        goto LABEL_34;
      }
    }
    else
    {
      v42 = PLMigrationGetLog();
      BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);

      if (v43)
      {
        v44 = [(PLModelMigrationActionBackground *)self logger];
        BOOL v45 = v44 == 0;

        if (!v45)
        {
          long long v118 = 0u;
          long long v119 = 0u;
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
          memset(buf, 0, sizeof(buf));
          v46 = PLMigrationGetLog();
          os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
          uint64_t v47 = [v40 completedUnitCount];
          int v85 = 134217984;
          uint64_t v86 = v47;
          LODWORD(v68) = 12;
          v48 = (uint8_t *)_os_log_send_and_compose_impl();

          v49 = [(PLModelMigrationActionBackground *)self logger];
          objc_msgSend(v49, "logWithMessage:fromCodeLocation:type:", v48, "PLModelMigrationActionBackground.m", 239, 1);

          goto LABEL_24;
        }
        v58 = PLMigrationGetLog();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          uint64_t v59 = [v40 completedUnitCount];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v59;
          _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_INFO, "Completed update of %lu assets", buf, 0xCu);
        }
LABEL_34:
      }
    }
LABEL_35:

    goto LABEL_36;
  }
  v82[3] = 3;
  v28 = PLMigrationGetLog();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

  if (v29)
  {
    v30 = [(PLModelMigrationActionBackground *)self logger];
    BOOL v31 = v30 == 0;

    if (v31)
    {
      v60 = PLMigrationGetLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v61 = (objc_class *)objc_opt_class();
        v62 = NSStringFromClass(v61);
        id v63 = v76[5];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v62;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v63;
        _os_log_impl(&dword_19B3C7000, v60, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %@", buf, 0x16u);
      }
    }
    else
    {
      long long v118 = 0u;
      long long v119 = 0u;
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
      memset(buf, 0, sizeof(buf));
      v32 = PLMigrationGetLog();
      os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      id v35 = v76[5];
      int v85 = 138543618;
      uint64_t v86 = (uint64_t)v34;
      __int16 v87 = 2112;
      v88 = v35;
      LODWORD(v68) = 22;
      v36 = (uint8_t *)_os_log_send_and_compose_impl();

      v37 = [(PLModelMigrationActionBackground *)self logger];
      objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActionBackground.m", 243, 16);

      if (v36 != buf) {
        free(v36);
      }
    }
  }
LABEL_36:
  if (v82[3] == 1) {
    [(PLModelMigrationActionBackground *)self setResumeMarkerValue:0];
  }
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  if (a4) {
    *a4 = v76[5];
  }
  int64_t v66 = v82[3];

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v81, 8);

  return v66;
}

+ (int64_t)actionProgressWeight
{
  return 500;
}

@end