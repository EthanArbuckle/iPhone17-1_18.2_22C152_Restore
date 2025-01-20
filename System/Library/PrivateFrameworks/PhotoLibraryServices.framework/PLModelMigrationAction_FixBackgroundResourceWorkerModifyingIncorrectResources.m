@interface PLModelMigrationAction_FixBackgroundResourceWorkerModifyingIncorrectResources
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixBackgroundResourceWorkerModifyingIncorrectResources

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v100[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 1;
  uint64_t v55 = 0;
  v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__53410;
  v59 = __Block_byref_object_dispose__53411;
  id v60 = 0;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLInternalResource entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"dataStoreClassID", 0);
  v100[0] = v11;
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"localAvailability", 4294934528);
  v100[1] = v12;
  v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"recipeID", &unk_1EEBF1EE0];
  v100[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:3];
  v15 = [v10 andPredicateWithSubpredicates:v14];
  [v9 setPredicate:v15];

  v16 = v56 + 5;
  id obj = v56[5];
  v17 = [v6 executeFetchRequest:v9 error:&obj];
  objc_storeStrong(v16, obj);
  v18 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v17 count], 0);
  v19 = v18;
  if (v17)
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __125__PLModelMigrationAction_FixBackgroundResourceWorkerModifyingIncorrectResources_performActionWithManagedObjectContext_error___block_invoke;
    v50[3] = &unk_1E586B2A0;
    v50[4] = self;
    v52 = &v55;
    v53 = &v61;
    id v51 = v18;
    v20 = [v6 enumerateWithIncrementalSaveUsingObjects:v17 withBlock:v50];
    if (v20)
    {
      if (!v56[5])
      {
        objc_storeStrong(v56 + 5, v20);
        v62[3] = 3;
        v21 = PLMigrationGetLog();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

        if (v22)
        {
          v23 = [(PLModelMigrationActionCore *)self logger];
          BOOL v24 = v23 == 0;

          if (v24)
          {
            v43 = PLMigrationGetLog();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              v44 = (objc_class *)objc_opt_class();
              v45 = NSStringFromClass(v44);
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v45;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v20;
              _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %{public}@", buf, 0x16u);
            }
          }
          else
          {
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
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            memset(buf, 0, sizeof(buf));
            v49 = PLMigrationGetLog();
            os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
            v25 = (objc_class *)objc_opt_class();
            v26 = NSStringFromClass(v25);
            int v65 = 138543618;
            v66 = v26;
            __int16 v67 = 2114;
            v68 = v20;
            LODWORD(v48) = 22;
            v27 = (uint8_t *)_os_log_send_and_compose_impl();

            v28 = [(PLModelMigrationActionCore *)self logger];
            objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_15000.m", 726, 16);

            if (v27 != buf) {
              free(v27);
            }
          }
        }
      }
    }
  }
  else
  {
    v62[3] = 3;
    v29 = PLMigrationGetLog();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

    if (v30)
    {
      v31 = [(PLModelMigrationActionCore *)self logger];
      BOOL v32 = v31 == 0;

      if (v32)
      {
        v39 = PLMigrationGetLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = (objc_class *)objc_opt_class();
          v41 = NSStringFromClass(v40);
          id v42 = v56[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v41;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v42;
          _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
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
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        memset(buf, 0, sizeof(buf));
        v33 = PLMigrationGetLog();
        os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        id v36 = v56[5];
        int v65 = 138543618;
        v66 = v35;
        __int16 v67 = 2114;
        v68 = v36;
        LODWORD(v48) = 22;
        v37 = (uint8_t *)_os_log_send_and_compose_impl();

        v38 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v38, "logWithMessage:fromCodeLocation:type:", v37, "PLModelMigrationActions_15000.m", 730, 16);

        if (v37 != buf) {
          free(v37);
        }
      }
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v56[5];
  }
  int64_t v46 = v62[3];

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  return v46;
}

@end