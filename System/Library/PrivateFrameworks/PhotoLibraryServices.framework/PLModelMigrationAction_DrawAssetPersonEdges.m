@interface PLModelMigrationAction_DrawAssetPersonEdges
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_DrawAssetPersonEdges

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v117[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  uint64_t v81 = 1;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__1142;
  v76 = __Block_byref_object_dispose__1143;
  id v77 = 0;
  v7 = [(PLModelMigrationActionBackground *)self resumeMarker];
  uint64_t v8 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v7);

  v53 = +[PLManagedAsset fetchRequest];
  v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v117[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:1];
  [v53 setSortDescriptors:v10];

  if (v8)
  {
    v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v8];
    [v53 setPredicate:v11];
  }
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__1142;
  v70 = __Block_byref_object_dispose__1143;
  id v71 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v15 = [(PLModelMigrationActionBackground *)self pathManager];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke;
  v64[3] = &unk_1E586FB88;
  id v65 = v6;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_2;
  v63[3] = &unk_1E5870290;
  v63[4] = self;
  v63[5] = &v66;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_3;
  v58[3] = &unk_1E5862340;
  v58[4] = self;
  v60 = &v72;
  v61 = &v78;
  id v59 = v65;
  v62 = &v66;
  id v16 = v59;
  v17 = (void *)v8;
  v18 = [(PLEnumerateAndSaveController *)v12 initWithName:v14 fetchRequest:v53 context:v59 pathManager:v15 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v64 didFetchObjectIDsBlock:v63 processResultsBlock:v58];

  v19 = (id *)(v73 + 5);
  id obj = (id)v73[5];
  LODWORD(v15) = [(PLEnumerateAndSaveController *)v18 processObjectsWithError:&obj];
  objc_storeStrong(v19, obj);
  if (v15)
  {
    v20 = PLMigrationGetLog();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      v22 = [(PLModelMigrationActionBackground *)self logger];
      BOOL v23 = v22 == 0;

      if (v23)
      {
        v38 = PLMigrationGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v39 = [(id)v67[5] totalUnitCount];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v39;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "Drew asset person edges for %lld assets.", buf, 0xCu);
        }
      }
      else
      {
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v24 = PLMigrationGetLog();
        os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        uint64_t v25 = [(id)v67[5] totalUnitCount];
        int v82 = 134217984;
        uint64_t v83 = v25;
        LODWORD(v52) = 12;
        v26 = (uint8_t *)_os_log_send_and_compose_impl();

        v27 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigrationActionBackground.m", 1020, 0);

        if (v26 != buf) {
          free(v26);
        }
      }
    }
    v40 = [(PLModelMigrationActionBackground *)self databaseContext];
    v41 = (void *)[v40 newShortLivedLibraryWithName:"-[PLModelMigrationAction_DrawAssetPersonEdges performActionWithManagedObjectContext:error:]"];

    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_372;
    v54[3] = &unk_1E5875E18;
    id v42 = v41;
    id v55 = v42;
    v56 = self;
    [v42 performTransactionAndWait:v54];
  }
  else
  {
    v79[3] = 3;
    v28 = PLMigrationGetLog();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

    if (v29)
    {
      v30 = [(PLModelMigrationActionBackground *)self logger];
      BOOL v31 = v30 == 0;

      if (v31)
      {
        v48 = PLMigrationGetLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = (objc_class *)objc_opt_class();
          v50 = NSStringFromClass(v49);
          uint64_t v51 = v73[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v50;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v51;
          _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v32 = PLMigrationGetLog();
        os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        uint64_t v35 = v73[5];
        int v82 = 138543618;
        uint64_t v83 = (uint64_t)v34;
        __int16 v84 = 2114;
        uint64_t v85 = v35;
        LODWORD(v52) = 22;
        v36 = (uint8_t *)_os_log_send_and_compose_impl();

        v17 = (void *)v8;
        v37 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActionBackground.m", 1032, 16);

        if (v36 != buf) {
          free(v36);
        }
      }
    }
  }
  if (v79[3] == 1) {
    [(PLModelMigrationActionBackground *)self setResumeMarkerValue:0];
  }
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  uint64_t v43 = v79[3];
  id v44 = (id)v73[5];
  v45 = v44;
  if (v43 != 1 && a4) {
    *a4 = v44;
  }

  int64_t v46 = v79[3];
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v78, 8);

  return v46;
}

+ (int64_t)actionProgressWeight
{
  return 300;
}

@end