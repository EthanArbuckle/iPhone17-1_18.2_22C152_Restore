@interface PLModelMigrationActionStaged_MoveLibraryScopeShareState
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationActionStaged_MoveLibraryScopeShareState

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v58 = 0;
  v59 = (id *)&v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__67066;
  v62 = __Block_byref_object_dispose__67067;
  id v63 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 1;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLAdditionalAssetAttributes entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"libraryScopeShareState != %d", 0);
  [v9 setPredicate:v10];

  [v9 setFetchBatchSize:100];
  v99[0] = @"asset";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v11];

  v12 = v59 + 5;
  id obj = v59[5];
  v13 = [v6 executeFetchRequest:v9 error:&obj];
  objc_storeStrong(v12, obj);
  if (v13)
  {
    v14 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v13 count], 0);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __103__PLModelMigrationActionStaged_MoveLibraryScopeShareState_performActionWithManagedObjectContext_error___block_invoke;
    v49[3] = &unk_1E586D978;
    v49[4] = self;
    v51 = &v58;
    v52 = &v54;
    id v15 = v14;
    id v50 = v15;
    v16 = [v6 enumerateWithIncrementalSaveUsingObjects:v13 withBlock:v49];
    if (v16)
    {
      if (!v59[5])
      {
        objc_storeStrong(v59 + 5, v16);
        v55[3] = 3;
        v17 = PLMigrationGetLog();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

        if (v18)
        {
          v19 = [(PLModelMigrationActionCore *)self logger];
          BOOL v20 = v19 == 0;

          if (v20)
          {
            v39 = PLMigrationGetLog();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v40 = (objc_class *)objc_opt_class();
              v41 = NSStringFromClass(v40);
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v41;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v16;
              _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %{public}@", buf, 0x16u);
            }
          }
          else
          {
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
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            memset(buf, 0, sizeof(buf));
            v48 = PLMigrationGetLog();
            os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
            v21 = (objc_class *)objc_opt_class();
            v22 = NSStringFromClass(v21);
            int v64 = 138543618;
            v65 = v22;
            __int16 v66 = 2114;
            v67 = v16;
            LODWORD(v47) = 22;
            v23 = (uint8_t *)_os_log_send_and_compose_impl();

            v24 = [(PLModelMigrationActionCore *)self logger];
            objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActionStaged.m", 169, 16);

            if (v23 != buf) {
              free(v23);
            }
          }
        }
      }
    }
  }
  else
  {
    v55[3] = 3;
    v25 = PLMigrationGetLog();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

    if (v26)
    {
      v27 = [(PLModelMigrationActionCore *)self logger];
      BOOL v28 = v27 == 0;

      if (v28)
      {
        v35 = PLMigrationGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = (objc_class *)objc_opt_class();
          v37 = NSStringFromClass(v36);
          id v38 = v59[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v38;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
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
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        memset(buf, 0, sizeof(buf));
        v29 = PLMigrationGetLog();
        os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        id v32 = v59[5];
        int v64 = 138543618;
        v65 = v31;
        __int16 v66 = 2114;
        v67 = v32;
        LODWORD(v47) = 22;
        v33 = (uint8_t *)_os_log_send_and_compose_impl();

        v34 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActionStaged.m", 173, 16);

        if (v33 != buf) {
          free(v33);
        }
      }
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  uint64_t v42 = v55[3];
  id v43 = v59[5];
  v44 = v43;
  if (v42 != 1 && a4) {
    *a4 = v43;
  }

  int64_t v45 = v55[3];
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  return v45;
}

@end