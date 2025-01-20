@interface PLModelMigrationAction_CinematicVideoPopulateDepthType
+ (int64_t)actionProgressWeight;
- (id)buildFetchRequest;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_CinematicVideoPopulateDepthType

- (id)buildFetchRequest
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v2 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v3 = (void *)MEMORY[0x1E4F1C0D0];
  v4 = +[PLManagedAsset entityName];
  v5 = [v3 fetchRequestWithEntityName:v4];

  v6 = (void *)MEMORY[0x1E4F28BA0];
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"kind", 1);
  v18[0] = v7;
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"depthType", 0);
  v18[1] = v8;
  if (v2) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"addedDate", v2];
  }
  else {
  v9 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v18[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  v11 = [v6 andPredicateWithSubpredicates:v10];
  [v5 setPredicate:v11];

  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
  v17 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [v5 setSortDescriptors:v13];

  [v5 setFetchBatchSize:100];
  v16[0] = @"master.mediaMetadata";
  v16[1] = @"modernResources";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v5 setRelationshipKeyPathsForPrefetching:v14];

  return v5;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  uint64_t v75 = 1;
  uint64_t v66 = 0;
  v67 = (id *)&v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__1142;
  v70 = __Block_byref_object_dispose__1143;
  id v71 = 0;
  v7 = [(PLModelMigrationAction_CinematicVideoPopulateDepthType *)self buildFetchRequest];
  v8 = v67 + 5;
  id obj = v67[5];
  v9 = [v6 executeFetchRequest:v7 error:&obj];
  objc_storeStrong(v8, obj);
  if (v9)
  {
    v10 = -[PLModelMigrationActionBackground cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v9 count], 0);
    v11 = PLMigrationGetLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

    if (v12)
    {
      v13 = [(PLModelMigrationActionBackground *)self logger];
      BOOL v14 = v13 == 0;

      if (v14)
      {
        v29 = PLMigrationGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          uint64_t v30 = [v9 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v30;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_INFO, "Populating depthType for %lu video assets", buf, 0xCu);
        }
      }
      else
      {
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
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        memset(buf, 0, sizeof(buf));
        v15 = PLMigrationGetLog();
        os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
        uint64_t v16 = [v9 count];
        int v76 = 134217984;
        uint64_t v77 = v16;
        LODWORD(v59) = 12;
        v17 = (uint8_t *)_os_log_send_and_compose_impl();

        v18 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v18, "logWithMessage:fromCodeLocation:type:", v17, "PLModelMigrationActionBackground.m", 301, 1);

        if (v17 != buf) {
          free(v17);
        }
      }
    }
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __102__PLModelMigrationAction_CinematicVideoPopulateDepthType_performActionWithManagedObjectContext_error___block_invoke;
    v61[3] = &unk_1E586B2F0;
    v63 = &v72;
    v61[4] = self;
    v64 = &v66;
    id v31 = v10;
    id v62 = v31;
    v32 = [v6 enumerateWithIncrementalSaveUsingObjects:v9 withBlock:v61];
    if (v32 && !v67[5])
    {
      objc_storeStrong(v67 + 5, v32);
      v73[3] = 3;
      v41 = PLMigrationGetLog();
      BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);

      if (v42)
      {
        v43 = [(PLModelMigrationActionBackground *)self logger];
        BOOL v44 = v43 == 0;

        if (!v44)
        {
          v60 = a4;
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
          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          memset(buf, 0, sizeof(buf));
          v45 = PLMigrationGetLog();
          os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
          v46 = (objc_class *)objc_opt_class();
          v47 = NSStringFromClass(v46);
          int v76 = 138543618;
          uint64_t v77 = (uint64_t)v47;
          __int16 v78 = 2112;
          v79 = v32;
          LODWORD(v59) = 22;
          v39 = (uint8_t *)_os_log_send_and_compose_impl();

          a4 = v60;
          v48 = [(PLModelMigrationActionBackground *)self logger];
          objc_msgSend(v48, "logWithMessage:fromCodeLocation:type:", v39, "PLModelMigrationActionBackground.m", 330, 16);

LABEL_21:
          if (v39 != buf) {
            free(v39);
          }
          goto LABEL_32;
        }
        v49 = PLMigrationGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v55 = (objc_class *)objc_opt_class();
          v56 = NSStringFromClass(v55);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v56;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v32;
          _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %@", buf, 0x16u);
        }
        goto LABEL_31;
      }
    }
    else
    {
      v33 = PLMigrationGetLog();
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);

      if (v34)
      {
        v35 = [(PLModelMigrationActionBackground *)self logger];
        BOOL v36 = v35 == 0;

        if (!v36)
        {
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
          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          memset(buf, 0, sizeof(buf));
          v37 = PLMigrationGetLog();
          os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
          uint64_t v38 = [v31 completedUnitCount];
          int v76 = 134217984;
          uint64_t v77 = v38;
          LODWORD(v59) = 12;
          v39 = (uint8_t *)_os_log_send_and_compose_impl();

          v40 = [(PLModelMigrationActionBackground *)self logger];
          objc_msgSend(v40, "logWithMessage:fromCodeLocation:type:", v39, "PLModelMigrationActionBackground.m", 332, 1);

          goto LABEL_21;
        }
        v49 = PLMigrationGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          uint64_t v50 = [v31 completedUnitCount];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v50;
          _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_INFO, "Completed update of %lu assets", buf, 0xCu);
        }
LABEL_31:
      }
    }
LABEL_32:

    goto LABEL_33;
  }
  v73[3] = 3;
  v19 = PLMigrationGetLog();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

  if (v20)
  {
    v21 = [(PLModelMigrationActionBackground *)self logger];
    BOOL v22 = v21 == 0;

    if (v22)
    {
      v51 = PLMigrationGetLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = (objc_class *)objc_opt_class();
        v53 = NSStringFromClass(v52);
        id v54 = v67[5];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v54;
        _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %@", buf, 0x16u);
      }
    }
    else
    {
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
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      memset(buf, 0, sizeof(buf));
      v23 = PLMigrationGetLog();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      id v26 = v67[5];
      int v76 = 138543618;
      uint64_t v77 = (uint64_t)v25;
      __int16 v78 = 2112;
      v79 = v26;
      LODWORD(v59) = 22;
      v27 = (uint8_t *)_os_log_send_and_compose_impl();

      v28 = [(PLModelMigrationActionBackground *)self logger];
      objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActionBackground.m", 336, 16);

      if (v27 != buf) {
        free(v27);
      }
    }
  }
LABEL_33:
  if (v73[3] == 1) {
    [(PLModelMigrationActionBackground *)self setResumeMarkerValue:0];
  }
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  if (a4) {
    *a4 = v67[5];
  }
  int64_t v57 = v73[3];

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);

  return v57;
}

+ (int64_t)actionProgressWeight
{
  return 400;
}

@end