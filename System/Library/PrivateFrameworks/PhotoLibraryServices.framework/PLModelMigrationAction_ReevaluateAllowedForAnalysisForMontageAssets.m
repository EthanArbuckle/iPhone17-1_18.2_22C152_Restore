@interface PLModelMigrationAction_ReevaluateAllowedForAnalysisForMontageAssets
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ReevaluateAllowedForAnalysisForMontageAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v73[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  v8 = objc_msgSend(v6, "predicateWithFormat:", @"%K != nil", @"montage");
  v72 = @"allowedForAnalysis";
  v73[0] = MEMORY[0x1E4F1CC28];
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
  v10 = +[PLAdditionalAssetAttributes entityName];
  id v36 = 0;
  BOOL v11 = +[PLModelMigrator executeBatchUpdateWithEntityName:v10 predicate:v8 propertiesToUpdate:v9 managedObjectContext:v7 error:&v36];

  id v12 = v36;
  if (v11)
  {
    v13 = PLMigrationGetLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      v15 = [(PLModelMigrationActionCore *)self logger];

      if (v15)
      {
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        memset(buf, 0, sizeof(buf));
        v16 = PLMigrationGetLog();
        os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        LOWORD(v37) = 0;
        LODWORD(v35) = 2;
        v17 = (uint8_t *)_os_log_send_and_compose_impl();

        v18 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v18, "logWithMessage:fromCodeLocation:type:", v17, "PLModelMigrationActions_17000.m", 545, 0);

        if (v17 != buf) {
          free(v17);
        }
      }
      else
      {
        v27 = PLMigrationGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Successfully set allowedForAnalysis to NO for montageAssets", buf, 2u);
        }
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v28 = v12;
    int64_t v29 = 1;
  }
  else
  {
    if (a4) {
      *a4 = v12;
    }
    v19 = PLMigrationGetLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (v20)
    {
      v21 = [(PLModelMigrationActionCore *)self logger];

      if (v21)
      {
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        memset(buf, 0, sizeof(buf));
        v22 = PLMigrationGetLog();
        os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        int v37 = 138543618;
        v38 = v24;
        __int16 v39 = 2114;
        id v40 = v12;
        LODWORD(v35) = 22;
        v25 = (uint8_t *)_os_log_send_and_compose_impl();

        v26 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_17000.m", 549, 16);

        if (v25 != buf) {
          free(v25);
        }
      }
      else
      {
        v30 = PLMigrationGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v31);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v12;
          _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Failed to set allowedForAnalysis to NO for montageAssets %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v33 = v12;
    if (a4) {
      *a4 = v33;
    }
    int64_t v29 = 3;
  }

  return v29;
}

@end