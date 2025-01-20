@interface PLModelMigrationAction_updateACVideos
+ (int64_t)actionProgressWeight;
- (id)buildFetchRequest;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_updateACVideos

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 1;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__1142;
  v66 = __Block_byref_object_dispose__1143;
  id v67 = 0;
  v7 = [(PLModelMigrationAction_updateACVideos *)self buildFetchRequest];
  v8 = (id *)(v63 + 5);
  id obj = (id)v63[5];
  v9 = [v6 executeFetchRequest:v7 error:&obj];
  objc_storeStrong(v8, obj);
  if (v9)
  {
    v10 = -[PLModelMigrationActionBackground cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v9 count], 0);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __85__PLModelMigrationAction_updateACVideos_performActionWithManagedObjectContext_error___block_invoke;
    v57[3] = &unk_1E586B2F0;
    v59 = &v68;
    v57[4] = self;
    v60 = &v62;
    id v11 = v10;
    id v58 = v11;
    v12 = [v6 enumerateWithIncrementalSaveUsingObjects:v9 withBlock:v57];
    if (v12 && (v13 = (id *)(v63 + 5), !v63[5]))
    {
      v69[3] = 3;
      objc_storeStrong(v13, v12);
      v32 = PLMigrationGetLog();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

      if (v33)
      {
        v34 = [(PLModelMigrationActionBackground *)self logger];
        BOOL v35 = v34 == 0;

        if (!v35)
        {
          v56 = a4;
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
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          memset(buf, 0, sizeof(buf));
          v36 = PLMigrationGetLog();
          os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
          v37 = (objc_class *)objc_opt_class();
          v38 = NSStringFromClass(v37);
          uint64_t v39 = v63[5];
          int v72 = 138543618;
          uint64_t v73 = (uint64_t)v38;
          __int16 v74 = 2112;
          uint64_t v75 = v39;
          LODWORD(v55) = 22;
          v20 = (uint8_t *)_os_log_send_and_compose_impl();

          a4 = v56;
          v40 = [(PLModelMigrationActionBackground *)self logger];
          objc_msgSend(v40, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActionBackground.m", 432, 16);

LABEL_14:
          if (v20 != buf) {
            free(v20);
          }
          goto LABEL_25;
        }
        v41 = PLMigrationGetLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v47 = (objc_class *)objc_opt_class();
          v48 = NSStringFromClass(v47);
          uint64_t v49 = v63[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v49;
          _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "Asset could not be saved for %{public}@. Error: %@", buf, 0x16u);
        }
        goto LABEL_24;
      }
    }
    else
    {
      v14 = PLMigrationGetLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

      if (v15)
      {
        v16 = [(PLModelMigrationActionBackground *)self logger];
        BOOL v17 = v16 == 0;

        if (!v17)
        {
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
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          memset(buf, 0, sizeof(buf));
          v18 = PLMigrationGetLog();
          os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
          uint64_t v19 = [v11 completedUnitCount];
          int v72 = 134217984;
          uint64_t v73 = v19;
          LODWORD(v55) = 12;
          v20 = (uint8_t *)_os_log_send_and_compose_impl();

          v21 = [(PLModelMigrationActionBackground *)self logger];
          objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActionBackground.m", 434, 1);

          goto LABEL_14;
        }
        v41 = PLMigrationGetLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          uint64_t v42 = [v11 completedUnitCount];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v42;
          _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_INFO, "Completed update on %lu assets", buf, 0xCu);
        }
LABEL_24:
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  v69[3] = 3;
  v22 = PLMigrationGetLog();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

  if (v23)
  {
    v24 = [(PLModelMigrationActionBackground *)self logger];
    BOOL v25 = v24 == 0;

    if (v25)
    {
      v43 = PLMigrationGetLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = (objc_class *)objc_opt_class();
        v45 = NSStringFromClass(v44);
        uint64_t v46 = v63[5];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v46;
        _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %@", buf, 0x16u);
      }
    }
    else
    {
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
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      memset(buf, 0, sizeof(buf));
      v26 = PLMigrationGetLog();
      os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      uint64_t v29 = v63[5];
      int v72 = 138543618;
      uint64_t v73 = (uint64_t)v28;
      __int16 v74 = 2112;
      uint64_t v75 = v29;
      LODWORD(v55) = 22;
      v30 = (uint8_t *)_os_log_send_and_compose_impl();

      v31 = [(PLModelMigrationActionBackground *)self logger];
      objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActionBackground.m", 438, 16);

      if (v30 != buf) {
        free(v30);
      }
    }
  }
LABEL_26:
  if (v69[3] == 1) {
    [(PLModelMigrationActionBackground *)self setResumeMarkerValue:0];
  }
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  uint64_t v50 = v69[3];
  id v51 = (id)v63[5];
  v52 = v51;
  if (v50 != 1 && a4) {
    *a4 = v51;
  }

  int64_t v53 = v69[3];
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v53;
}

- (id)buildFetchRequest
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setYear:2022];
  [v4 setMonth:8];
  [v4 setDay:1];
  v20 = v3;
  v5 = [v3 dateFromComponents:v4];
  id v6 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLManagedAsset entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  id v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"kind", 1);
  v23[0] = v11;
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"kindSubtype", 0);
  v23[1] = v12;
  if (v6) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"addedDate", v6];
  }
  else {
  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"addedDate", v5];
  }
  v23[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  BOOL v15 = [v10 andPredicateWithSubpredicates:v14];
  [v9 setPredicate:v15];

  v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
  v22 = v16;
  BOOL v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v9 setSortDescriptors:v17];

  [v9 setFetchBatchSize:100];
  v21[0] = @"master.mediaMetadata";
  v21[1] = @"modernResources";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [v9 setRelationshipKeyPathsForPrefetching:v18];

  return v9;
}

+ (int64_t)actionProgressWeight
{
  return 400;
}

@end