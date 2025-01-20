@interface PLModelMigrationAction_MigrateMemoryPendingStateStoryToCreationType
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_MigrateMemoryPendingStateStoryToCreationType

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 1;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__43798;
  v63 = __Block_byref_object_dispose__43799;
  id v64 = 0;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLMemory entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"pendingState", 4);
  [v9 setPredicate:v10];

  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__43798;
  v57[4] = __Block_byref_object_dispose__43799;
  id v58 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  v11 = [PLEnumerateAndSaveController alloc];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [(PLModelMigrationActionCore *)self pathManager];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __115__PLModelMigrationAction_MigrateMemoryPendingStateStoryToCreationType_performActionWithManagedObjectContext_error___block_invoke;
  v51[3] = &unk_1E586FB88;
  id v15 = v6;
  id v52 = v15;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __115__PLModelMigrationAction_MigrateMemoryPendingStateStoryToCreationType_performActionWithManagedObjectContext_error___block_invoke_2;
  v50[3] = &unk_1E5870290;
  v50[4] = self;
  v50[5] = v57;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __115__PLModelMigrationAction_MigrateMemoryPendingStateStoryToCreationType_performActionWithManagedObjectContext_error___block_invoke_3;
  v49[3] = &unk_1E5869EF0;
  v49[4] = self;
  v49[5] = &v59;
  v49[6] = &v65;
  v49[7] = &v53;
  v49[8] = v57;
  v16 = [(PLEnumerateAndSaveController *)v11 initWithName:v13 fetchRequest:v9 context:v15 pathManager:v14 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v51 didFetchObjectIDsBlock:v50 processResultBlock:v49];

  v17 = (id *)(v60 + 5);
  id obj = (id)v60[5];
  LODWORD(v14) = [(PLEnumerateAndSaveController *)v16 processObjectsWithError:&obj];
  objc_storeStrong(v17, obj);
  if (v14)
  {
    v18 = PLMigrationGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (!v19) {
      goto LABEL_17;
    }
    v20 = [(PLModelMigrationActionCore *)self logger];
    BOOL v21 = v20 == 0;

    if (!v21)
    {
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
      memset(buf, 0, sizeof(buf));
      v22 = PLMigrationGetLog();
      os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      v23 = (void *)v54[3];
      int v69 = 134217984;
      v70 = v23;
      LODWORD(v47) = 12;
      v24 = (uint8_t *)_os_log_send_and_compose_impl();

      v25 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 491, 0);

      if (v24 != buf)
      {
        v26 = v24;
LABEL_10:
        free(v26);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    v37 = PLMigrationGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = v54[3];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v38;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "Migrated %tu generative memories from pendingStateStory to creationTypeGenerative.", buf, 0xCu);
    }
LABEL_16:

    goto LABEL_17;
  }
  v66[3] = 3;
  v27 = PLMigrationGetLog();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

  if (!v28) {
    goto LABEL_17;
  }
  v29 = [(PLModelMigrationActionCore *)self logger];
  BOOL v30 = v29 == 0;

  if (v30)
  {
    v37 = PLMigrationGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      uint64_t v41 = v60[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v40;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v41;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
    }
    goto LABEL_16;
  }
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
  memset(buf, 0, sizeof(buf));
  v31 = PLMigrationGetLog();
  os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
  v32 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v32);
  uint64_t v34 = v60[5];
  int v69 = 138543618;
  v70 = v33;
  __int16 v71 = 2112;
  uint64_t v72 = v34;
  LODWORD(v47) = 22;
  v35 = (uint8_t *)_os_log_send_and_compose_impl();

  v36 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v36, "logWithMessage:fromCodeLocation:type:", v35, "PLModelMigrationActions_18000.m", 494, 16);

  if (v35 != buf)
  {
    v26 = v35;
    goto LABEL_10;
  }
LABEL_17:
  uint64_t v42 = v66[3];
  id v43 = (id)v60[5];
  v44 = v43;
  if (v42 != 1 && a4) {
    *a4 = v43;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  int64_t v45 = v66[3];

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(v57, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v45;
}

@end