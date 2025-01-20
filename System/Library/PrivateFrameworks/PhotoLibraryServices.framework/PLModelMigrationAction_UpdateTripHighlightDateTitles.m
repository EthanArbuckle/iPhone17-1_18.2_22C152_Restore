@interface PLModelMigrationAction_UpdateTripHighlightDateTitles
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_UpdateTripHighlightDateTitles

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v98[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  v7 = +[PLPhotosHighlight entityName];
  v8 = [v6 fetchRequestWithEntityName:v7];

  v9 = +[PLPhotosHighlight predicateForAllTripHighlights];
  [v8 setPredicate:v9];

  v98[0] = @"dayGroupAssets";
  v98[1] = @"dayGroupExtendedAssets";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:2];
  [v8 setRelationshipKeyPathsForPrefetching:v10];

  v47 = objc_alloc_init(PLDateRangeTitleGenerator);
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__43798;
  v61 = __Block_byref_object_dispose__43799;
  id v62 = 0;
  v11 = [PLEnumerateAndSaveController alloc];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [(PLModelMigrationActionCore *)self pathManager];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke;
  v55[3] = &unk_1E586FB88;
  id v15 = v5;
  id v56 = v15;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke_2;
  v54[3] = &unk_1E5870290;
  v54[4] = self;
  v54[5] = &v57;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke_3;
  v51[3] = &unk_1E586A120;
  v48 = v47;
  v52 = v48;
  v53 = &v57;
  v16 = [(PLEnumerateAndSaveController *)v11 initWithName:v13 fetchRequest:v8 context:v15 pathManager:v14 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v55 didFetchObjectIDsBlock:v54 processResultBlock:v51];

  id v50 = 0;
  BOOL v17 = [(PLEnumerateAndSaveController *)v16 processObjectsWithError:&v50];
  id v18 = v50;
  if (v17)
  {
    v19 = PLMigrationGetLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);

    if (v20)
    {
      v21 = [(PLModelMigrationActionCore *)self logger];
      BOOL v22 = v21 == 0;

      if (v22)
      {
        v36 = PLMigrationGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          uint64_t v37 = [(id)v58[5] completedUnitCount];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v37;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_INFO, "Updated titles for %lu highlights", buf, 0xCu);
        }
      }
      else
      {
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
        long long v68 = 0u;
        long long v69 = 0u;
        memset(buf, 0, sizeof(buf));
        v23 = PLMigrationGetLog();
        os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
        uint64_t v24 = [(id)v58[5] completedUnitCount];
        int v63 = 134217984;
        uint64_t v64 = v24;
        LODWORD(v46) = 12;
        v25 = (uint8_t *)_os_log_send_and_compose_impl();

        v26 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 1378, 1);

        if (v25 != buf) {
          free(v25);
        }
      }
    }
    int64_t v38 = 1;
  }
  else
  {
    v27 = PLMigrationGetLog();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

    if (v28)
    {
      v29 = [(PLModelMigrationActionCore *)self logger];
      BOOL v30 = v29 == 0;

      if (v30)
      {
        v39 = PLMigrationGetLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = (objc_class *)objc_opt_class();
          v41 = NSStringFromClass(v40);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v41;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v18;
          _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
        }
      }
      else
      {
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
        long long v68 = 0u;
        long long v69 = 0u;
        memset(buf, 0, sizeof(buf));
        v31 = PLMigrationGetLog();
        os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        int v63 = 138543618;
        uint64_t v64 = (uint64_t)v33;
        __int16 v65 = 2112;
        id v66 = v18;
        LODWORD(v46) = 22;
        v34 = (uint8_t *)_os_log_send_and_compose_impl();

        v35 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActions_18000.m", 1381, 16);

        if (v34 != buf) {
          free(v34);
        }
      }
    }
    int64_t v38 = 3;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v42 = v18;
  v43 = v42;
  if (a4) {
    char v44 = v17;
  }
  else {
    char v44 = 1;
  }
  if ((v44 & 1) == 0) {
    *a4 = v42;
  }

  _Block_object_dispose(&v57, 8);
  return v38;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end