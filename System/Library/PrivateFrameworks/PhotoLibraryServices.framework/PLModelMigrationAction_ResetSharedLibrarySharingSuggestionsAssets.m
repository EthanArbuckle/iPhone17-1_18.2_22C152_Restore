@interface PLModelMigrationAction_ResetSharedLibrarySharingSuggestionsAssets
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetSharedLibrarySharingSuggestionsAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 1;
  uint64_t v48 = 0;
  v49 = (id *)&v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__23954;
  v52 = __Block_byref_object_dispose__23955;
  id v53 = 0;
  v7 = +[PLManagedAsset fetchRequest];
  v8 = +[PLManagedAsset predicateToIncludeSharedLibrarySharingSuggestionsAssets];
  [v7 setPredicate:v8];

  [v7 setFetchBatchSize:100];
  v9 = v49 + 5;
  id obj = v49[5];
  v10 = [v6 executeFetchRequest:v7 error:&obj];
  objc_storeStrong(v9, obj);
  if ([v10 count])
  {
    v11 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v10 count], 0);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __113__PLModelMigrationAction_ResetSharedLibrarySharingSuggestionsAssets_performActionWithManagedObjectContext_error___block_invoke;
    v43[3] = &unk_1E586B2F0;
    v43[4] = self;
    v45 = &v48;
    v46 = &v54;
    id v12 = v11;
    id v44 = v12;
    v13 = [v6 enumerateWithIncrementalSaveUsingObjects:v10 withBlock:v43];
    if (v13 && !v49[5])
    {
      objc_storeStrong(v49 + 5, v13);
      v55[3] = 3;
    }
    if (v55[3] == 1)
    {
      v14 = PLMigrationGetLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (v15)
      {
        v16 = [(PLModelMigrationActionCore *)self logger];
        BOOL v17 = v16 == 0;

        if (!v17)
        {
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
          long long v63 = 0u;
          long long v64 = 0u;
          memset(buf, 0, sizeof(buf));
          v18 = PLMigrationGetLog();
          os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          int v19 = [v10 count];
          int v58 = 67109120;
          LODWORD(v59) = v19;
          LODWORD(v41) = 8;
          v20 = (uint8_t *)_os_log_send_and_compose_impl();

          v21 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_16000.m", 435, 0);

          goto LABEL_14;
        }
        v31 = PLMigrationGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = [v10 count];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v32;
          _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Removed %d asset suggestions by photos", buf, 8u);
        }
LABEL_21:
      }
    }
    else
    {
      v22 = PLMigrationGetLog();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v23)
      {
        v24 = [(PLModelMigrationActionCore *)self logger];
        BOOL v25 = v24 == 0;

        if (!v25)
        {
          v42 = a4;
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
          long long v63 = 0u;
          long long v64 = 0u;
          memset(buf, 0, sizeof(buf));
          v26 = PLMigrationGetLog();
          os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          v27 = (objc_class *)objc_opt_class();
          v28 = NSStringFromClass(v27);
          id v29 = v49[5];
          int v58 = 138543618;
          v59 = v28;
          __int16 v60 = 2114;
          id v61 = v29;
          LODWORD(v41) = 22;
          v20 = (uint8_t *)_os_log_send_and_compose_impl();

          a4 = v42;
          v30 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_16000.m", 437, 16);

LABEL_14:
          if (v20 != buf) {
            free(v20);
          }
          goto LABEL_22;
        }
        v31 = PLMigrationGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v33 = (objc_class *)objc_opt_class();
          v34 = NSStringFromClass(v33);
          id v35 = v49[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v34;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v35;
          _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Failed to save managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
        }
        goto LABEL_21;
      }
    }
LABEL_22:

    goto LABEL_23;
  }
  if (!v10) {
    v55[3] = 3;
  }
LABEL_23:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  uint64_t v36 = v55[3];
  id v37 = v49[5];
  v38 = v37;
  if (v36 != 1 && a4) {
    *a4 = v37;
  }

  int64_t v39 = v55[3];
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  return v39;
}

@end