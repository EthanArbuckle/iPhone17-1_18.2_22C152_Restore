@interface PLModelMigrationAction_SetDefaultFaceAnalysisVersion
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_SetDefaultFaceAnalysisVersion

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(PLModelMigrationActionCore *)self startingSchemaVersion] >> 3 <= 0x752u) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = 10;
  }
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 1;
  uint64_t v52 = 0;
  v53 = (id *)&v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__53410;
  v56 = __Block_byref_object_dispose__53411;
  id v57 = 0;
  v8 = (void *)MEMORY[0x1E4F1C0D0];
  v9 = +[PLManagedAsset entityName];
  v10 = [v8 fetchRequestWithEntityName:v9];

  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"faceAdjustmentVersion");
  [v10 setPredicate:v11];
  v12 = v53 + 5;
  id obj = v53[5];
  v13 = [v6 executeFetchRequest:v10 error:&obj];
  objc_storeStrong(v12, obj);
  v14 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v13 count], 0);
  v15 = v14;
  if (v13)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __100__PLModelMigrationAction_SetDefaultFaceAnalysisVersion_performActionWithManagedObjectContext_error___block_invoke;
    v46[3] = &unk_1E586B340;
    v46[4] = self;
    v48 = &v52;
    v49 = &v58;
    uint64_t v50 = v7;
    id v47 = v14;
    v16 = [v6 enumerateWithIncrementalSaveUsingObjects:v13 withBlock:v46];
    if (v16)
    {
      if (!v53[5])
      {
        objc_storeStrong(v53 + 5, v16);
        v59[3] = 3;
        v17 = PLMigrationGetLog();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

        if (v18)
        {
          v19 = [(PLModelMigrationActionCore *)self logger];
          BOOL v20 = v19 == 0;

          if (v20)
          {
            v38 = PLMigrationGetLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v39 = (objc_class *)objc_opt_class();
              v40 = NSStringFromClass(v39);
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v40;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v16;
              _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %{public}@", buf, 0x16u);
            }
          }
          else
          {
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
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            memset(buf, 0, sizeof(buf));
            v44 = PLMigrationGetLog();
            os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
            v21 = (objc_class *)objc_opt_class();
            v22 = NSStringFromClass(v21);
            int v62 = 138543618;
            v63 = v22;
            __int16 v64 = 2114;
            v65 = v16;
            LODWORD(v43) = 22;
            v45 = (uint8_t *)_os_log_send_and_compose_impl();

            v23 = [(PLModelMigrationActionCore *)self logger];
            objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v45, "PLModelMigrationActions_15000.m", 630, 16);

            if (v45 != buf) {
              free(v45);
            }
          }
        }
      }
    }
  }
  else
  {
    v59[3] = 3;
    v24 = PLMigrationGetLog();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

    if (v25)
    {
      v26 = [(PLModelMigrationActionCore *)self logger];
      BOOL v27 = v26 == 0;

      if (v27)
      {
        v34 = PLMigrationGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = (objc_class *)objc_opt_class();
          v36 = NSStringFromClass(v35);
          id v37 = v53[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v36;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v37;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
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
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        memset(buf, 0, sizeof(buf));
        v28 = PLMigrationGetLog();
        os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        id v31 = v53[5];
        int v62 = 138543618;
        v63 = v30;
        __int16 v64 = 2114;
        v65 = v31;
        LODWORD(v43) = 22;
        v32 = (uint8_t *)_os_log_send_and_compose_impl();

        v33 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActions_15000.m", 634, 16);

        if (v32 != buf) {
          free(v32);
        }
      }
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v53[5];
  }
  int64_t v41 = v59[3];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v41;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end