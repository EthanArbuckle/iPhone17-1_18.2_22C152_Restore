@interface PLModelMigrationAction_ResetGraphPersons
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetGraphPersons

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLPerson entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  [v9 setFetchBatchSize:100];
  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"verifiedType", 2);
  [v9 setPredicate:v10];

  id v46 = 0;
  v11 = [v6 executeFetchRequest:v9 error:&v46];
  id v12 = v46;
  if (v11)
  {
    uint64_t v13 = [v11 count];
    v14 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:v13 pendingParentUnitCount:0];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __88__PLModelMigrationAction_ResetGraphPersons_performActionWithManagedObjectContext_error___block_invoke;
    v44[3] = &unk_1E586B368;
    v44[4] = self;
    id v15 = v14;
    id v45 = v15;
    v16 = [v6 enumerateWithIncrementalSaveUsingObjects:v11 withBlock:v44];

    v17 = PLMigrationGetLog();
    v18 = v17;
    if (v16)
    {
      BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

      if (v19)
      {
        v20 = [(PLModelMigrationActionCore *)self logger];

        if (v20)
        {
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
          *(_OWORD *)buf = 0u;
          long long v50 = 0u;
          v21 = PLMigrationGetLog();
          os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
          int v47 = 138412290;
          uint64_t v48 = (uint64_t)v16;
          LODWORD(v42) = 12;
          v22 = (uint8_t *)_os_log_send_and_compose_impl();

          v23 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_15000.m", 853, 16);

          if (v22 != buf) {
            free(v22);
          }
        }
        else
        {
          v36 = PLMigrationGetLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v16;
            _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Failed to reset graph-verified persons with error: %@", buf, 0xCu);
          }
        }
      }
      int64_t v35 = 3;
    }
    else
    {
      v43 = a4;
      BOOL v30 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v30)
      {
        v31 = [(PLModelMigrationActionCore *)self logger];

        if (!v31)
        {
          v41 = PLMigrationGetLog();
          a4 = v43;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v13;
            _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "Deleted %lu graph-verified persons", buf, 0xCu);
          }

          int64_t v35 = 1;
          goto LABEL_20;
        }
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
        *(_OWORD *)buf = 0u;
        long long v50 = 0u;
        v32 = PLMigrationGetLog();
        os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        int v47 = 134217984;
        uint64_t v48 = v13;
        LODWORD(v42) = 12;
        v33 = (uint8_t *)_os_log_send_and_compose_impl();

        v34 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActions_15000.m", 856, 0);

        if (v33 != buf) {
          free(v33);
        }
      }
      int64_t v35 = 1;
      a4 = v43;
    }
LABEL_20:

    goto LABEL_25;
  }
  v24 = PLMigrationGetLog();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

  if (v25)
  {
    v26 = [(PLModelMigrationActionCore *)self logger];

    if (v26)
    {
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
      *(_OWORD *)buf = 0u;
      long long v50 = 0u;
      v27 = PLMigrationGetLog();
      os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      int v47 = 138412290;
      uint64_t v48 = (uint64_t)v12;
      LODWORD(v42) = 12;
      v28 = (uint8_t *)_os_log_send_and_compose_impl();

      v29 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_15000.m", 859, 16);

      if (v28 != buf) {
        free(v28);
      }
    }
    else
    {
      v37 = PLMigrationGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v12;
        _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Failed to fetch graph-verified persons with error: %@", buf, 0xCu);
      }
    }
  }
  int64_t v35 = 3;
  v16 = v12;
LABEL_25:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v38 = v16;
  v39 = v38;
  if (v35 != 1 && a4) {
    *a4 = v38;
  }

  return v35;
}

@end