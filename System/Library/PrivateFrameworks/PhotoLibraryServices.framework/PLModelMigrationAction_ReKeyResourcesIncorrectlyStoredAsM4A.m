@interface PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 1;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__43798;
  v59 = __Block_byref_object_dispose__43799;
  id v60 = 0;
  v7 = +[PLInternalResource fetchRequest];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d AND %K = %d AND %K = %d AND %K != nil", @"resourceType", 1, @"compactUTI", 24, @"dataStoreClassID", 0, @"dataStoreKeyData");
  [v7 setPredicate:v8];

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__43798;
  v53 = __Block_byref_object_dispose__43799;
  id v54 = 0;
  v9 = [PLEnumerateAndSaveController alloc];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [(PLModelMigrationActionCore *)self pathManager];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke;
  v47[3] = &unk_1E586FB88;
  id v13 = v6;
  id v48 = v13;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke_2;
  v46[3] = &unk_1E5870290;
  v46[4] = self;
  v46[5] = &v49;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke_3;
  v45[3] = &unk_1E5869FE0;
  v45[4] = self;
  v45[5] = &v55;
  v45[6] = &v61;
  v45[7] = &v49;
  v14 = [(PLEnumerateAndSaveController *)v9 initWithName:v11 fetchRequest:v7 context:v13 pathManager:v12 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v47 didFetchObjectIDsBlock:v46 processResultBlock:v45];

  v15 = (id *)(v56 + 5);
  id obj = (id)v56[5];
  LODWORD(v12) = [(PLEnumerateAndSaveController *)v14 processObjectsWithError:&obj];
  objc_storeStrong(v15, obj);
  if (v12)
  {
    v16 = PLMigrationGetLog();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (!v17) {
      goto LABEL_16;
    }
    v18 = [(PLModelMigrationActionCore *)self logger];
    BOOL v19 = v18 == 0;

    if (!v19)
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
      v20 = PLMigrationGetLog();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      uint64_t v21 = [(id)v50[5] totalUnitCount];
      int v65 = 134217984;
      uint64_t v66 = v21;
      LODWORD(v43) = 12;
      v22 = (uint8_t *)_os_log_send_and_compose_impl();

      v23 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_18000.m", 719, 0);

      goto LABEL_8;
    }
    v33 = PLMigrationGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = [(id)v50[5] totalUnitCount];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v34;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "Patched %lld resources with incorrect encoding of video file path in library.", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  v62[3] = 3;
  v24 = PLMigrationGetLog();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

  if (!v25) {
    goto LABEL_16;
  }
  v26 = [(PLModelMigrationActionCore *)self logger];
  BOOL v27 = v26 == 0;

  if (v27)
  {
    v33 = PLMigrationGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      uint64_t v37 = v56[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v37;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
    }
    goto LABEL_15;
  }
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
  v28 = PLMigrationGetLog();
  os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
  v29 = (objc_class *)objc_opt_class();
  v30 = NSStringFromClass(v29);
  uint64_t v31 = v56[5];
  int v65 = 138543618;
  uint64_t v66 = (uint64_t)v30;
  __int16 v67 = 2112;
  uint64_t v68 = v31;
  LODWORD(v43) = 22;
  v22 = (uint8_t *)_os_log_send_and_compose_impl();

  v32 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_18000.m", 722, 16);

LABEL_8:
  if (v22 != buf) {
    free(v22);
  }
LABEL_16:
  uint64_t v38 = v62[3];
  id v39 = (id)v56[5];
  v40 = v39;
  if (v38 != 1 && a4) {
    *a4 = v39;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  int64_t v41 = v62[3];

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  return v41;
}

@end