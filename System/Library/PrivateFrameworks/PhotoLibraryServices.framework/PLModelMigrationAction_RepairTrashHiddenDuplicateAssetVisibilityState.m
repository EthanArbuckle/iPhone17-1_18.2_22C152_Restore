@interface PLModelMigrationAction_RepairTrashHiddenDuplicateAssetVisibilityState
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RepairTrashHiddenDuplicateAssetVisibilityState

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v75[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28BA0];
  v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  v8 = objc_msgSend(v6, "predicateWithFormat:", @"%K != %d", @"duplicateAssetVisibilityState", 0);
  v75[0] = v8;
  v9 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"trashedState", 0);
  v74[0] = v10;
  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = YES", @"hidden");
  v74[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
  v13 = [v9 orPredicateWithSubpredicates:v12];
  v75[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
  v15 = [v5 andPredicateWithSubpredicates:v14];

  v72 = @"duplicateAssetVisibilityState";
  v73 = &unk_1EEBEE178;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  v17 = +[PLManagedAsset entityName];
  id v36 = 0;
  LOBYTE(v10) = +[PLModelMigrator executeBatchUpdateWithEntityName:v17 predicate:v15 propertiesToUpdate:v16 managedObjectContext:v7 error:&v36];

  id v18 = v36;
  if (v10)
  {
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v19 = v18;
    int64_t v20 = 1;
  }
  else
  {
    v21 = PLMigrationGetLog();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
    {
      v23 = [(PLModelMigrationActionCore *)self logger];

      if (v23)
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
        v24 = PLMigrationGetLog();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        int v37 = 138543618;
        v38 = v26;
        __int16 v39 = 2114;
        id v40 = v18;
        LODWORD(v34) = 22;
        v27 = (uint8_t *)_os_log_send_and_compose_impl();

        v28 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_16000.m", 482, 16);

        if (v27 != buf) {
          free(v27);
        }
      }
      else
      {
        v29 = PLMigrationGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v31;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v18;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Failed to execute batch update request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v32 = v18;
    if (a4) {
      *a4 = v32;
    }
    int64_t v20 = 3;
  }

  return v20;
}

@end