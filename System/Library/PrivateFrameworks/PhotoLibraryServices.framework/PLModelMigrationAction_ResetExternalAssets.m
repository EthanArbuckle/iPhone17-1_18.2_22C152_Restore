@interface PLModelMigrationAction_ResetExternalAssets
+ (id)predicateForFetchingAssetsToReset;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetExternalAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x19F38D3B0]();
  v7 = [(id)objc_opt_class() predicateForFetchingAssetsToReset];
  v8 = +[PLManagedAsset fetchRequest];
  [v8 setPredicate:v7];
  int64_t v9 = 1;
  [v8 setResultType:1];
  id v59 = 0;
  v10 = [v5 executeFetchRequest:v8 error:&v59];
  id v11 = v59;
  if (!v10)
  {
    v12 = PLMigrationGetLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v13)
    {
      v14 = [(PLModelMigrationActionCore *)self logger];

      if (v14)
      {
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
        long long v67 = 0u;
        long long v68 = 0u;
        memset(buf, 0, sizeof(buf));
        v15 = PLMigrationGetLog();
        os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
        int v60 = 138543362;
        uint64_t v61 = (uint64_t)v11;
        LODWORD(v54) = 12;
        v16 = (uint8_t *)_os_log_send_and_compose_impl();

        v17 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v17, "logWithMessage:fromCodeLocation:type:", v16, "PLModelMigrationActions_17000.m", 265, 16);

        if (v16 != buf) {
          free(v16);
        }
      }
      else
      {
        v18 = PLMigrationGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v11;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "[ResetExternalAssets] Failed to fetch external assets. Error: %{public}@", buf, 0xCu);
        }
      }
    }
    int64_t v9 = 3;
  }

  if (![v10 count])
  {
    v32 = PLMigrationGetLog();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

    if (v33)
    {
      v34 = [(PLModelMigrationActionCore *)self logger];

      if (v34)
      {
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
        long long v67 = 0u;
        long long v68 = 0u;
        memset(buf, 0, sizeof(buf));
        v35 = PLMigrationGetLog();
        os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        LOWORD(v60) = 0;
        LODWORD(v54) = 2;
        v36 = (uint8_t *)_os_log_send_and_compose_impl();

        v37 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActions_17000.m", 270, 0);

        if (v36 != buf) {
          free(v36);
        }
      }
      else
      {
        v44 = PLMigrationGetLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEFAULT, "[ResetExternalAssets] No external assets available.", buf, 2u);
        }
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v23 = v11;
    v45 = a4;
    if (v10) {
      goto LABEL_46;
    }
    goto LABEL_44;
  }
  context = (void *)MEMORY[0x19F38D3B0]();
  v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"asset", v10];
  v64[0] = @"syndicationProcessingValue";
  v64[1] = @"syndicationProcessingVersion";
  v65[0] = &unk_1EEBEEC10;
  v65[1] = &unk_1EEBEEC28;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
  v21 = +[PLMediaAnalysisAssetAttributes entityName];
  id v58 = v11;
  BOOL v22 = +[PLModelMigrator executeBatchUpdateWithEntityName:v21 predicate:v19 propertiesToUpdate:v20 managedObjectContext:v5 error:&v58];
  id v23 = v58;

  v24 = PLMigrationGetLog();
  v25 = v24;
  if (v22)
  {
    BOOL v26 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      v27 = [(PLModelMigrationActionCore *)self logger];

      if (v27)
      {
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
        long long v67 = 0u;
        long long v68 = 0u;
        memset(buf, 0, sizeof(buf));
        v28 = PLMigrationGetLog();
        os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
        uint64_t v29 = [v10 count];
        int v60 = 134217984;
        uint64_t v61 = v29;
        LODWORD(v55) = 12;
        v30 = (uint8_t *)_os_log_send_and_compose_impl();

        v31 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActions_17000.m", 287, 0);

        if (v30 != buf) {
          free(v30);
        }
      }
      else
      {
        v46 = PLMigrationGetLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v47 = [v10 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v47;
          _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEFAULT, "[ResetExternalAssets] Successfully reset external assets processing value and version on %tu assets", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    BOOL v38 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

    if (v38)
    {
      v39 = [(PLModelMigrationActionCore *)self logger];

      if (v39)
      {
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
        long long v67 = 0u;
        long long v68 = 0u;
        memset(buf, 0, sizeof(buf));
        v40 = PLMigrationGetLog();
        os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
        uint64_t v41 = [v10 count];
        int v60 = 134218242;
        uint64_t v61 = v41;
        __int16 v62 = 2114;
        id v63 = v23;
        LODWORD(v55) = 22;
        v42 = (uint8_t *)_os_log_send_and_compose_impl();

        v43 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v43, "logWithMessage:fromCodeLocation:type:", v42, "PLModelMigrationActions_17000.m", 290, 16);

        if (v42 != buf) {
          free(v42);
        }
      }
      else
      {
        v48 = PLMigrationGetLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          uint64_t v49 = [v10 count];
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = v49;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v23;
          _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "[ResetExternalAssets] Failed to reset external assets processing value and version on %tu assets. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    int64_t v9 = 3;
  }

  if (v9 != 3)
  {
    v50 = (void *)MEMORY[0x19F38D3B0]();
    v51 = [(PLModelMigrationActionCore *)self pathManager];
    BOOL v52 = +[PLModelMigrator rebuildMomentsInContext:v5 pathManager:v51 deleteExistingMoments:0 targetedAssetOIDs:v10];

    if (v52) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = 3;
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v23 = v23;
    v45 = a4;
    if (v52)
    {
LABEL_46:

      goto LABEL_47;
    }
LABEL_44:
    if (v45) {
      id *v45 = v23;
    }
    goto LABEL_46;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4)
  {
    id v23 = v23;
    *a4 = v23;
  }
  int64_t v9 = 3;
LABEL_47:

  return v9;
}

+ (id)predicateForFetchingAssetsToReset
{
  return +[PLMomentGenerationUtils internalPredicateToIncludeExternalAssetsEligibleForProcessing];
}

@end