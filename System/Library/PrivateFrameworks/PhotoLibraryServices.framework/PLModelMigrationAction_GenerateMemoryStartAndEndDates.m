@interface PLModelMigrationAction_GenerateMemoryStartAndEndDates
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_GenerateMemoryStartAndEndDates

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v101[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 1;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__43798;
  v60 = __Block_byref_object_dispose__43799;
  id v61 = 0;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLMemory entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v101[0] = @"representativeAssets";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v10];

  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__43798;
  v54[4] = __Block_byref_object_dispose__43799;
  id v55 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  v11 = [PLEnumerateAndSaveController alloc];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [(PLModelMigrationActionCore *)self pathManager];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke;
  v48[3] = &unk_1E586FB88;
  id v15 = v6;
  id v49 = v15;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke_2;
  v47[3] = &unk_1E5870290;
  v47[4] = self;
  v47[5] = v54;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke_3;
  v46[3] = &unk_1E5869EF0;
  v46[4] = self;
  v46[5] = &v56;
  v46[6] = &v62;
  v46[7] = &v50;
  v46[8] = v54;
  v16 = [(PLEnumerateAndSaveController *)v11 initWithName:v13 fetchRequest:v9 context:v15 pathManager:v14 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v48 didFetchObjectIDsBlock:v47 processResultBlock:v46];

  v17 = (id *)(v57 + 5);
  id obj = (id)v57[5];
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
      long long v71 = 0u;
      long long v72 = 0u;
      memset(buf, 0, sizeof(buf));
      v22 = PLMigrationGetLog();
      os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      v23 = (void *)v51[3];
      int v66 = 134217984;
      v67 = v23;
      LODWORD(v44) = 12;
      v24 = (uint8_t *)_os_log_send_and_compose_impl();

      v25 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 206, 0);

      if (v24 == buf) {
        goto LABEL_17;
      }
      v26 = v24;
LABEL_10:
      free(v26);
      goto LABEL_17;
    }
    v37 = PLMigrationGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = v51[3];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v38;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "Generated start/end dates for %tu memories.", buf, 0xCu);
    }
  }
  else
  {
    v63[3] = 3;
    v27 = PLMigrationGetLog();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

    if (!v28) {
      goto LABEL_17;
    }
    v29 = [(PLModelMigrationActionCore *)self logger];
    BOOL v30 = v29 == 0;

    if (!v30)
    {
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
      long long v71 = 0u;
      long long v72 = 0u;
      memset(buf, 0, sizeof(buf));
      v31 = PLMigrationGetLog();
      os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      uint64_t v34 = v57[5];
      int v66 = 138543618;
      v67 = v33;
      __int16 v68 = 2112;
      uint64_t v69 = v34;
      LODWORD(v44) = 22;
      v35 = (uint8_t *)_os_log_send_and_compose_impl();

      v36 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v36, "logWithMessage:fromCodeLocation:type:", v35, "PLModelMigrationActions_18000.m", 209, 16);

      if (v35 == buf) {
        goto LABEL_17;
      }
      v26 = v35;
      goto LABEL_10;
    }
    v37 = PLMigrationGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      uint64_t v41 = v57[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v40;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v41;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
    }
  }

LABEL_17:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = (id) v57[5];
  }
  int64_t v42 = v63[3];

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(v54, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  return v42;
}

@end