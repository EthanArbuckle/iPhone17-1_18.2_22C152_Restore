@interface PLModelMigrationAction_FixupDefaultStickerConfidenceScoreValues
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixupDefaultStickerConfidenceScoreValues

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[PLManagedAsset fetchRequest];
  v8 = (void *)MEMORY[0x1E4F28F60];
  v9 = +[PLVisualSearchAttributes algorithmVersionKey];
  v10 = objc_msgSend(v8, "predicateWithFormat:", @"%K.%K = 0", @"mediaAnalysisAttributes.visualSearchAttributes", v9);
  [v7 setPredicate:v10];

  v11 = [PLEnumerateAndSaveController alloc];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  uint64_t v14 = [(PLModelMigrationActionCore *)self pathManager];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __111__PLModelMigrationAction_FixupDefaultStickerConfidenceScoreValues_performActionWithManagedObjectContext_error___block_invoke;
  v33[3] = &unk_1E586FB88;
  id v15 = v6;
  id v34 = v15;
  int64_t v16 = 1;
  v17 = [(PLEnumerateAndSaveController *)v11 initWithName:v13 fetchRequest:v7 context:v15 pathManager:v14 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v33 didFetchObjectIDsBlock:0 processResultBlock:&__block_literal_global_53940];

  id v32 = 0;
  LOBYTE(v14) = [(PLEnumerateAndSaveController *)v17 processObjectsWithError:&v32];
  id v18 = v32;
  if ((v14 & 1) == 0)
  {
    v19 = PLMigrationGetLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (v20)
    {
      v21 = [(PLModelMigrationActionCore *)self logger];

      if (!v21)
      {
        v28 = PLMigrationGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v18;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %{public}@", buf, 0x16u);
        }
        if (!a4) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
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
      long long v40 = 0u;
      long long v41 = 0u;
      memset(buf, 0, sizeof(buf));
      v22 = PLMigrationGetLog();
      os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      int v35 = 138543618;
      v36 = v24;
      __int16 v37 = 2114;
      id v38 = v18;
      LODWORD(v31) = 22;
      v25 = (uint8_t *)_os_log_send_and_compose_impl();

      v26 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_17000.m", 100, 16);

      if (v25 != buf) {
        free(v25);
      }
    }
    if (!a4)
    {
LABEL_8:
      int64_t v16 = 3;
      goto LABEL_9;
    }
LABEL_7:
    *a4 = v18;
    goto LABEL_8;
  }
LABEL_9:

  return v16;
}

@end