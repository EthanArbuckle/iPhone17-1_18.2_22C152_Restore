@interface PLModelMigrationAction_fixLivePhotoSubtypePlaybackStyleMismatch
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_fixLivePhotoSubtypePlaybackStyleMismatch

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v72[3] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F28BA0];
  v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = a3;
  v9 = objc_msgSend(v7, "predicateWithFormat:", @"%K = %d", @"kind", 0);
  v72[0] = v9;
  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"kindSubtype", 0);
  v72[1] = v10;
  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"playbackStyle", 3);
  v72[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:3];
  v13 = [v6 andPredicateWithSubpredicates:v12];

  v70 = @"playbackStyle";
  uint64_t v14 = [NSNumber numberWithInt:1];
  uint64_t v71 = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];

  v16 = +[PLManagedAsset entityName];
  id v34 = 0;
  LOBYTE(v14) = +[PLModelMigrator executeBatchUpdateWithEntityName:v16 predicate:v13 propertiesToUpdate:v15 managedObjectContext:v8 error:&v34];

  id v17 = v34;
  if (v14)
  {
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v18 = v17;
    if (a4) {
      *a4 = v18;
    }
    int64_t v19 = 1;
  }
  else
  {
    v20 = PLMigrationGetLog();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

    if (v21)
    {
      v22 = [(PLModelMigrationActionCore *)self logger];

      if (v22)
      {
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
        v23 = PLMigrationGetLog();
        os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        int v35 = 138543618;
        v36 = v25;
        __int16 v37 = 2114;
        id v38 = v17;
        LODWORD(v33) = 22;
        v26 = (uint8_t *)_os_log_send_and_compose_impl();

        v27 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigrationActions_16000.m", 1400, 16);

        if (v26 != buf) {
          free(v26);
        }
      }
      else
      {
        v28 = PLMigrationGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v17;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to execute batch update request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v31 = v17;
    int64_t v19 = 3;
  }

  return v19;
}

@end