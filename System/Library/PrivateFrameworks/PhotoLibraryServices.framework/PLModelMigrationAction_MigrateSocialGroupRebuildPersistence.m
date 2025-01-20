@interface PLModelMigrationAction_MigrateSocialGroupRebuildPersistence
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
- (int64_t)persistSocialGroupDirectoryJournalInContext:(id)a3 progress:(id)a4;
- (void)deleteGraphNodeSocialGroupDirectoryJournal;
- (void)deleteGraphNodeSocialGroupJournal;
@end

@implementation PLModelMigrationAction_MigrateSocialGroupRebuildPersistence

- (int64_t)persistSocialGroupDirectoryJournalInContext:(id)a3 progress:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PLModelMigrationAction_MigrateSocialGroupRebuildPersistence *)self deleteGraphNodeSocialGroupDirectoryJournal];
  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);
  v8 = [PLDirectoryJournal alloc];
  v9 = [(PLModelMigrationActionCore *)self pathManager];
  v49 = [(PLDirectoryJournal *)v8 initWithPathManager:v9 payloadClass:objc_opt_class()];

  v10 = (void *)MEMORY[0x1E4F1C0D0];
  v11 = +[PLGraphNode entityName];
  v12 = [v10 fetchRequestWithEntityName:v11];

  v13 = +[PLSocialGroup predicateForAllSocialGroupsInContext:v6];
  [v12 setPredicate:v13];

  [v12 setFetchBatchSize:100];
  id v57 = 0;
  v14 = [v6 executeFetchRequest:v12 error:&v57];
  id v15 = v57;
  if (!v14)
  {
    v36 = PLMigrationGetLog();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);

    if (v37)
    {
      v38 = [(PLModelMigrationActionCore *)self logger];

      if (v38)
      {
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
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        memset(buf, 0, sizeof(buf));
        v39 = PLMigrationGetLog();
        os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
        int v58 = 138412290;
        id v59 = v15;
        LODWORD(v44) = 12;
        v40 = (uint8_t *)_os_log_send_and_compose_impl();

        v41 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v41, "logWithMessage:fromCodeLocation:type:", v40, "PLModelMigrationActions_18000.m", 945, 16);

        if (v40 != buf) {
          free(v40);
        }
        int64_t v17 = 1;
        goto LABEL_33;
      }
      v42 = PLMigrationGetLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v15;
        _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "persistSocialGroupDirectoryJournalInContext fetch request failed: %@", buf, 0xCu);
      }
    }
    int64_t v17 = 1;
    goto LABEL_33;
  }
  v16 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v14, "count"));
  int64_t v17 = 1;
  [v7 addChild:v16 withPendingUnitCount:1];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v14;
  uint64_t v18 = [obj countByEnumeratingWithState:&v53 objects:v93 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    v45 = v14;
    v46 = v12;
    id v47 = v7;
    id v48 = v6;
    uint64_t v20 = *(void *)v54;
    v21 = v49;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v54 != v20) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v52 = v15;
        BOOL v24 = [(PLModelMigrationActionCore *)self isCancelledWithError:&v52];
        id v25 = v52;

        if (v24)
        {
          id v7 = v47;
          id v6 = v48;
          v14 = v45;
          v12 = v46;
          int64_t v17 = 2;
          goto LABEL_28;
        }
        id v51 = v25;
        BOOL v26 = [(PLDirectoryJournal *)v21 persistManagedObject:v23 error:&v51];
        id v15 = v51;

        if (v26)
        {
          objc_msgSend(v16, "setCompletedUnitCount:", objc_msgSend(v16, "completedUnitCount") + 1);
        }
        else
        {
          v27 = PLMigrationGetLog();
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

          if (v28)
          {
            v29 = [(PLModelMigrationActionCore *)self logger];

            if (v29)
            {
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
              long long v65 = 0u;
              long long v66 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              memset(buf, 0, sizeof(buf));
              v30 = PLMigrationGetLog();
              os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
              v31 = [v23 uuid];
              int v58 = 138543618;
              id v59 = v31;
              __int16 v60 = 2112;
              id v61 = v15;
              LODWORD(v44) = 22;
              v32 = (uint8_t *)_os_log_send_and_compose_impl();

              v33 = [(PLModelMigrationActionCore *)self logger];
              objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActions_18000.m", 939, 16);

              if (v32 != buf) {
                free(v32);
              }
              v21 = v49;
            }
            else
            {
              v34 = PLMigrationGetLog();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                v35 = [v23 uuid];
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v35;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v15;
                _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "PLDirectoryJournal: persistManagedObject of node %{public}@ failed: %@", buf, 0x16u);
              }
            }
          }
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v53 objects:v93 count:16];
      if (v19) {
        continue;
      }
      break;
    }
    id v25 = v15;
    int64_t v17 = 1;
    id v7 = v47;
    id v6 = v48;
    v14 = v45;
    v12 = v46;
  }
  else
  {
    id v25 = v15;
  }
LABEL_28:

  id v15 = v25;
LABEL_33:

  return v17;
}

- (void)deleteGraphNodeSocialGroupDirectoryJournal
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v4 = PLMigrationGetLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = [(PLModelMigrationActionCore *)self logger];

    if (v6)
    {
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
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v35 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      *(_OWORD *)buf = 0u;
      id v7 = PLMigrationGetLog();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      v8 = NSStringFromClass(v3);
      int v26 = 138543362;
      id v27 = v8;
      LODWORD(v24) = 12;
      v9 = (uint8_t *)_os_log_send_and_compose_impl();

      v10 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v10, "logWithMessage:fromCodeLocation:type:", v9, "PLModelMigrationActions_18000.m", 910, 0);

      if (v9 != buf) {
        free(v9);
      }
    }
    else
    {
      v11 = PLMigrationGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = NSStringFromClass(v3);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v12;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Deleting existing directory journal payloads for payload class %{public}@", buf, 0xCu);
      }
    }
  }
  v13 = [PLDirectoryJournal alloc];
  uint64_t v14 = [(PLModelMigrationActionCore *)self pathManager];
  id v15 = [(PLDirectoryJournal *)v13 initWithPathManager:v14 payloadClass:v3];

  id v25 = 0;
  LOBYTE(v14) = [(PLDirectoryJournal *)v15 removeAllPersistenceFilesWithError:&v25];
  id v16 = v25;
  if ((v14 & 1) == 0)
  {
    int64_t v17 = PLMigrationGetLog();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (v18)
    {
      uint64_t v19 = [(PLModelMigrationActionCore *)self logger];

      if (v19)
      {
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
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v35 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        *(_OWORD *)buf = 0u;
        uint64_t v20 = PLMigrationGetLog();
        os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        int v26 = 138412290;
        id v27 = v16;
        LODWORD(v24) = 12;
        v21 = (uint8_t *)_os_log_send_and_compose_impl();

        v22 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_18000.m", 914, 16);

        if (v21 != buf) {
          free(v21);
        }
      }
      else
      {
        v23 = PLMigrationGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v16;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "PLDirectoryJournal: removeAllPersistenceFilesWithError failed: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)deleteGraphNodeSocialGroupJournal
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v4 = [(PLModelMigrationActionCore *)self pathManager];
  BOOL v5 = +[PLRebuildJournalManager baseURLFromPathManager:v4];

  id v6 = PLMigrationGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    v8 = [(PLModelMigrationActionCore *)self logger];

    if (v8)
    {
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
      long long v36 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      *(_OWORD *)buf = 0u;
      v9 = PLMigrationGetLog();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      v10 = NSStringFromClass(v3);
      int v27 = 138543362;
      id v28 = v10;
      LODWORD(v25) = 12;
      v11 = (uint8_t *)_os_log_send_and_compose_impl();

      v12 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v12, "logWithMessage:fromCodeLocation:type:", v11, "PLModelMigrationActions_18000.m", 898, 0);

      if (v11 != buf) {
        free(v11);
      }
    }
    else
    {
      v13 = PLMigrationGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = NSStringFromClass(v3);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Deleting existing journals for payload class %{public}@", buf, 0xCu);
      }
    }
  }
  id v15 = [[PLJournal alloc] initWithBaseURL:v5 payloadClass:v3];
  [(PLJournal *)v15 removeMetadata];
  id v26 = 0;
  BOOL v16 = [(PLJournal *)v15 removeJournalFilesWithError:&v26];
  id v17 = v26;
  if (!v16)
  {
    BOOL v18 = PLMigrationGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      uint64_t v20 = [(PLModelMigrationActionCore *)self logger];

      if (v20)
      {
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
        long long v36 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        *(_OWORD *)buf = 0u;
        v21 = PLMigrationGetLog();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        int v27 = 138412290;
        id v28 = v17;
        LODWORD(v25) = 12;
        v22 = (uint8_t *)_os_log_send_and_compose_impl();

        v23 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_18000.m", 903, 16);

        if (v22 != buf) {
          free(v22);
        }
      }
      else
      {
        uint64_t v24 = PLMigrationGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v17;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "PLJournal: removeJournalFilesWithError failed: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(PLModelMigrationActionCore *)self pathManager];
  if ([v6 isUBF]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }

  v8 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:v7 pendingParentUnitCount:0];
  v9 = [(PLModelMigrationActionCore *)self pathManager];
  int v10 = [v9 isUBF];

  if (v10)
  {
    [(PLModelMigrationAction_MigrateSocialGroupRebuildPersistence *)self deleteGraphNodeSocialGroupJournal];
    if (!MEMORY[0x19F38C0C0](objc_msgSend(v8, "setCompletedUnitCount:", objc_msgSend(v8, "completedUnitCount") + 1)))
    {
      int64_t v11 = 1;
      goto LABEL_9;
    }
    objc_msgSend(v8, "setTotalUnitCount:", objc_msgSend(v8, "totalUnitCount") + 2);
  }
  int64_t v11 = [(PLModelMigrationAction_MigrateSocialGroupRebuildPersistence *)self persistSocialGroupDirectoryJournalInContext:v5 progress:v8];
LABEL_9:
  [(PLModelMigrationActionCore *)self finalizeProgress];

  return v11;
}

@end