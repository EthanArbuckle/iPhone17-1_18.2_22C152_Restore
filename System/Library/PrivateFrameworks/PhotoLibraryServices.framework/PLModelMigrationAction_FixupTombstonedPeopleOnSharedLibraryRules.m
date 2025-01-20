@interface PLModelMigrationAction_FixupTombstonedPeopleOnSharedLibraryRules
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixupTombstonedPeopleOnSharedLibraryRules

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLLibraryScope entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"autoSharePolicy", 2);
  [v9 setPredicate:v10];

  [v9 setFetchBatchSize:100];
  id v36 = 0;
  v11 = [v6 executeFetchRequest:v9 error:&v36];
  id v12 = v36;
  if (v11)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v72 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * i) updatePeopleRulesForAllTombstonedPersons];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v72 count:16];
      }
      while (v15);
    }

    int64_t v18 = 1;
  }
  else
  {
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
        LODWORD(v31) = 22;
        v25 = (uint8_t *)_os_log_send_and_compose_impl();

        v26 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_16000.m", 929, 16);

        if (v25 != buf) {
          free(v25);
        }
      }
      else
      {
        v27 = PLMigrationGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (objc_class *)objc_opt_class();
          v29 = NSStringFromClass(v28);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v12;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    int64_t v18 = 3;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v12;
  }

  return v18;
}

@end