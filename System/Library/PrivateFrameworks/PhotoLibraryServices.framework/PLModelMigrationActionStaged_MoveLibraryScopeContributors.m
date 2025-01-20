@interface PLModelMigrationActionStaged_MoveLibraryScopeContributors
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationActionStaged_MoveLibraryScopeContributors

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v62 = 0;
  v63 = (id *)&v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__67066;
  v66 = __Block_byref_object_dispose__67067;
  id v67 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 1;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLManagedAsset entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"libraryScopeOriginators.@count != 0"];
  [v9 setPredicate:v10];

  [v9 setFetchBatchSize:100];
  v11 = v63 + 5;
  id obj = v63[5];
  v12 = [v6 executeFetchRequest:v9 error:&obj];
  objc_storeStrong(v11, obj);
  if (v12)
  {
    v13 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v12 count], 0);
    uint64_t v48 = MEMORY[0x1E4F143A8];
    uint64_t v49 = 3221225472;
    v50 = __105__PLModelMigrationActionStaged_MoveLibraryScopeContributors_performActionWithManagedObjectContext_error___block_invoke;
    v51 = &unk_1E586D9A0;
    id v52 = v6;
    v53 = self;
    v55 = &v62;
    v56 = &v58;
    id v14 = v13;
    id v54 = v14;
    v15 = [v52 enumerateWithIncrementalSaveUsingObjects:v12 withBlock:&v48];
    if (v15)
    {
      if (!v63[5])
      {
        objc_storeStrong(v63 + 5, v15);
        v59[3] = 3;
        v16 = PLMigrationGetLog();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

        if (v17)
        {
          v18 = [(PLModelMigrationActionCore *)self logger];
          BOOL v19 = v18 == 0;

          if (v19)
          {
            v39 = PLMigrationGetLog();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v40 = (objc_class *)objc_opt_class();
              v41 = NSStringFromClass(v40);
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v41;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v15;
              _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %{public}@", buf, 0x16u);
            }
          }
          else
          {
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
            long long v75 = 0u;
            long long v76 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            memset(buf, 0, sizeof(buf));
            v20 = PLMigrationGetLog();
            os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
            v21 = (objc_class *)objc_opt_class();
            v22 = NSStringFromClass(v21);
            int v68 = 138543618;
            v69 = v22;
            __int16 v70 = 2114;
            v71 = v15;
            LODWORD(v47) = 22;
            v23 = (uint8_t *)_os_log_send_and_compose_impl();

            v24 = [(PLModelMigrationActionCore *)self logger];
            objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActionStaged.m", 219, 16);

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
    v59[3] = 3;
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
          id v38 = v63[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v38;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
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
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        memset(buf, 0, sizeof(buf));
        v29 = PLMigrationGetLog();
        os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        id v32 = v63[5];
        int v68 = 138543618;
        v69 = v31;
        __int16 v70 = 2114;
        v71 = v32;
        LODWORD(v47) = 22;
        v33 = (uint8_t *)_os_log_send_and_compose_impl();

        v34 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActionStaged.m", 223, 16);

        if (v33 != buf) {
          free(v33);
        }
      }
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  uint64_t v42 = v59[3];
  id v43 = v63[5];
  v44 = v43;
  if (v42 != 1 && a4) {
    *a4 = v43;
  }

  int64_t v45 = v59[3];
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  return v45;
}

@end