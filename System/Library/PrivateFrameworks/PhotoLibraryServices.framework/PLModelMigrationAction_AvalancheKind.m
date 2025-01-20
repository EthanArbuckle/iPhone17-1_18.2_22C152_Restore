@interface PLModelMigrationAction_AvalancheKind
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_AvalancheKind

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"avalancheUUID");
  v8 = +[PLManagedAsset entityName];
  v67 = @"avalancheKind";
  v68[0] = &unk_1EEBEE580;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
  id v31 = 0;
  BOOL v10 = +[PLModelMigrator executeBatchUpdateWithEntityName:v8 predicate:v7 propertiesToUpdate:v9 managedObjectContext:v6 error:&v31];
  id v11 = v31;

  if (v10)
  {
    id v30 = v11;
    char v12 = [v6 save:&v30];
    id v13 = v30;

    if (v12)
    {
      id v14 = v13;
      int64_t v15 = 1;
      goto LABEL_15;
    }
    v16 = PLMigrationGetLog();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      v18 = [(PLModelMigrationActionCore *)self logger];

      if (v18)
      {
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
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        memset(buf, 0, sizeof(buf));
        v19 = PLMigrationGetLog();
        os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        int v32 = 138543618;
        v33 = v21;
        __int16 v34 = 2112;
        id v35 = v13;
        LODWORD(v29) = 22;
        v22 = (uint8_t *)_os_log_send_and_compose_impl();

        v23 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_18000.m", 229, 16);

        if (v22 != buf) {
          free(v22);
        }
      }
      else
      {
        v24 = PLMigrationGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = (objc_class *)objc_opt_class();
          v26 = NSStringFromClass(v25);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v13;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    id v13 = v11;
  }
  id v27 = v13;
  id v14 = v27;
  if (a4)
  {
    id v14 = v27;
    *a4 = v14;
  }
  int64_t v15 = 3;
LABEL_15:

  [(PLModelMigrationActionCore *)self finalizeProgress];
  return v15;
}

@end