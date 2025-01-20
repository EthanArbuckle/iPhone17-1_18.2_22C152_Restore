@interface PLModelMigrationAction_FixupDefaultVideoStickerSuggestionScoreValues
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixupDefaultVideoStickerSuggestionScoreValues

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v74[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  v8 = objc_msgSend(v6, "predicateWithFormat:", @"%K = 0", @"mediaAnalysisVersion");
  v73 = @"videoStickerSuggestionScore";
  LODWORD(v9) = -1.0;
  v10 = [NSNumber numberWithFloat:v9];
  v74[0] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v73 count:1];

  v12 = +[PLMediaAnalysisAssetAttributes entityName];
  id v37 = 0;
  LODWORD(v10) = +[PLModelMigrator executeBatchUpdateWithEntityName:v12 predicate:v8 propertiesToUpdate:v11 managedObjectContext:v7 error:&v37];

  id v13 = v37;
  if (v10)
  {
    v14 = PLMigrationGetLog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      v16 = [(PLModelMigrationActionCore *)self logger];

      if (v16)
      {
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
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        memset(buf, 0, sizeof(buf));
        v17 = PLMigrationGetLog();
        os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        LOWORD(v38) = 0;
        LODWORD(v36) = 2;
        v18 = (uint8_t *)_os_log_send_and_compose_impl();

        v19 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v19, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActions_17000.m", 120, 0);

        if (v18 != buf) {
          free(v18);
        }
      }
      else
      {
        v28 = PLMigrationGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Reset default video sticker suggestion score on assets with mediaAnalysisAttributes.mediaAnalysisVersion = 0", buf, 2u);
        }
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v29 = v13;
    int64_t v30 = 1;
  }
  else
  {
    if (a4) {
      *a4 = v13;
    }
    v20 = PLMigrationGetLog();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

    if (v21)
    {
      v22 = [(PLModelMigrationActionCore *)self logger];

      if (v22)
      {
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
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        memset(buf, 0, sizeof(buf));
        v23 = PLMigrationGetLog();
        os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        int v38 = 138543618;
        v39 = v25;
        __int16 v40 = 2114;
        id v41 = v13;
        LODWORD(v36) = 22;
        v26 = (uint8_t *)_os_log_send_and_compose_impl();

        v27 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigrationActions_17000.m", 124, 16);

        if (v26 != buf) {
          free(v26);
        }
      }
      else
      {
        v31 = PLMigrationGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v13;
          _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Failed to reset default video sticker suggestion score on assets with mediaAnalysisAttributes.mediaAnalysisVersion = 0 %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v34 = v13;
    if (a4) {
      *a4 = v34;
    }
    int64_t v30 = 3;
  }

  return v30;
}

@end