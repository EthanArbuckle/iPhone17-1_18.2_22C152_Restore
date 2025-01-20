@interface PLModelMigrationActionStaged_FixupExistingCloudSharedAlbumInvitationRecord
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationActionStaged_FixupExistingCloudSharedAlbumInvitationRecord

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v54 = 0;
  v55 = (id *)&v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__67066;
  v58 = __Block_byref_object_dispose__67067;
  id v59 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 1;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLCloudSharedAlbumInvitationRecord entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"uuid");
  [v9 setPredicate:v10];

  [v9 setFetchBatchSize:100];
  v11 = v55 + 5;
  id obj = v55[5];
  v12 = [v6 executeFetchRequest:v9 error:&obj];
  objc_storeStrong(v11, obj);
  if (v12)
  {
    v13 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v12 count], 0);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __122__PLModelMigrationActionStaged_FixupExistingCloudSharedAlbumInvitationRecord_performActionWithManagedObjectContext_error___block_invoke;
    v45[3] = &unk_1E586D950;
    v45[4] = self;
    v47 = &v54;
    v48 = &v50;
    id v14 = v13;
    id v46 = v14;
    v15 = [v6 enumerateWithIncrementalSaveUsingObjects:v12 withBlock:v45];
    if (v15)
    {
      if (!v55[5])
      {
        objc_storeStrong(v55 + 5, v15);
        v51[3] = 3;
        v16 = PLMigrationGetLog();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

        if (v17)
        {
          v18 = [(PLModelMigrationActionCore *)self logger];
          BOOL v19 = v18 == 0;

          if (v19)
          {
            v38 = PLMigrationGetLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v39 = (objc_class *)objc_opt_class();
              v40 = NSStringFromClass(v39);
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v40;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v15;
              _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %{public}@", buf, 0x16u);
            }
          }
          else
          {
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
            long long v65 = 0u;
            long long v66 = 0u;
            memset(buf, 0, sizeof(buf));
            v44 = PLMigrationGetLog();
            os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
            v20 = (objc_class *)objc_opt_class();
            v21 = NSStringFromClass(v20);
            int v60 = 138543618;
            v61 = v21;
            __int16 v62 = 2114;
            v63 = v15;
            LODWORD(v43) = 22;
            v22 = (uint8_t *)_os_log_send_and_compose_impl();

            v23 = [(PLModelMigrationActionCore *)self logger];
            objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActionStaged.m", 121, 16);

            if (v22 != buf) {
              free(v22);
            }
          }
        }
      }
    }
  }
  else
  {
    v51[3] = 3;
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
          id v37 = v55[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v36;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v37;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
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
        long long v65 = 0u;
        long long v66 = 0u;
        memset(buf, 0, sizeof(buf));
        v28 = PLMigrationGetLog();
        os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        id v31 = v55[5];
        int v60 = 138543618;
        v61 = v30;
        __int16 v62 = 2114;
        v63 = v31;
        LODWORD(v43) = 22;
        v32 = (uint8_t *)_os_log_send_and_compose_impl();

        v33 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActionStaged.m", 125, 16);

        if (v32 != buf) {
          free(v32);
        }
      }
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v55[5];
  }
  int64_t v41 = v51[3];

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  return v41;
}

@end