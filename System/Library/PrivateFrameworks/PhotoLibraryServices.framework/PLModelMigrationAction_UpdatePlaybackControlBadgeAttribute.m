@interface PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute
- (id)buildFetchRequest;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute *)self buildFetchRequest];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__43798;
  v54 = __Block_byref_object_dispose__43799;
  id v55 = 0;
  v8 = [PLEnumerateAndSaveController alloc];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [(PLModelMigrationActionCore *)self pathManager];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke;
  v48[3] = &unk_1E586FB88;
  id v12 = v6;
  id v49 = v12;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke_2;
  v47[3] = &unk_1E5870290;
  v47[4] = self;
  v47[5] = &v50;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke_3;
  v46[3] = &unk_1E5869F90;
  v46[4] = &v50;
  v13 = [(PLEnumerateAndSaveController *)v8 initWithName:v10 fetchRequest:v7 context:v12 pathManager:v11 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v48 didFetchObjectIDsBlock:v47 processResultBlock:v46];

  id v45 = 0;
  BOOL v14 = [(PLEnumerateAndSaveController *)v13 processObjectsWithError:&v45];
  id v15 = v45;
  if (v14)
  {
    v16 = PLMigrationGetLog();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

    if (v17)
    {
      v18 = [(PLModelMigrationActionCore *)self logger];
      BOOL v19 = v18 == 0;

      if (v19)
      {
        v33 = PLMigrationGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = [(id)v51[5] completedUnitCount];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v34;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_INFO, "Completed playback bit update on %lu assets", buf, 0xCu);
        }
      }
      else
      {
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
        long long v61 = 0u;
        long long v62 = 0u;
        memset(buf, 0, sizeof(buf));
        v20 = PLMigrationGetLog();
        os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
        uint64_t v21 = [(id)v51[5] completedUnitCount];
        int v56 = 134217984;
        uint64_t v57 = v21;
        LODWORD(v43) = 12;
        v22 = (uint8_t *)_os_log_send_and_compose_impl();

        v23 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_18000.m", 619, 1);

        if (v22 != buf) {
          free(v22);
        }
      }
    }
    int64_t v35 = 1;
  }
  else
  {
    v24 = PLMigrationGetLog();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

    if (v25)
    {
      v26 = [(PLModelMigrationActionCore *)self logger];
      BOOL v27 = v26 == 0;

      if (v27)
      {
        v36 = PLMigrationGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = (objc_class *)objc_opt_class();
          v38 = NSStringFromClass(v37);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
        }
      }
      else
      {
        v44 = a4;
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
        long long v61 = 0u;
        long long v62 = 0u;
        memset(buf, 0, sizeof(buf));
        v28 = PLMigrationGetLog();
        os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        int v56 = 138543618;
        uint64_t v57 = (uint64_t)v30;
        __int16 v58 = 2112;
        id v59 = v15;
        LODWORD(v43) = 22;
        v31 = (uint8_t *)_os_log_send_and_compose_impl();

        a4 = v44;
        v32 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v31, "PLModelMigrationActions_18000.m", 622, 16);

        if (v31 != buf) {
          free(v31);
        }
      }
    }
    int64_t v35 = 3;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v39 = v15;
  v40 = v39;
  if (a4) {
    char v41 = v14;
  }
  else {
    char v41 = 1;
  }
  if ((v41 & 1) == 0) {
    *a4 = v39;
  }

  _Block_object_dispose(&v50, 8);
  return v35;
}

- (id)buildFetchRequest
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = +[PLManagedAsset entityName];
  v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"kind", 1);
  v11[0] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %d", @"extendedAttributes.fps", 45);
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v9 = [v5 andPredicateWithSubpredicates:v8];
  [v4 setPredicate:v9];

  [v4 setFetchBatchSize:100];
  return v4;
}

@end