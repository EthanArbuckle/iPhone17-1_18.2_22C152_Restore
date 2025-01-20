@interface PLModelMigrationAction_FixSignExtended32bSceneIdentifiers
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixSignExtended32bSceneIdentifiers

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLSceneClassification entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__43798;
  v56 = __Block_byref_object_dispose__43799;
  id v57 = 0;
  v10 = [PLEnumerateAndSaveController alloc];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = [(PLModelMigrationActionCore *)self pathManager];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke;
  v50[3] = &unk_1E586FB88;
  id v14 = v6;
  id v51 = v14;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke_2;
  v49[3] = &unk_1E5870290;
  v49[4] = self;
  v49[5] = &v52;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke_3;
  v48[3] = &unk_1E586A030;
  v48[4] = &v52;
  v15 = [(PLEnumerateAndSaveController *)v10 initWithName:v12 fetchRequest:v9 context:v14 pathManager:v13 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v50 didFetchObjectIDsBlock:v49 processResultBlock:v48];

  id v47 = 0;
  BOOL v16 = [(PLEnumerateAndSaveController *)v15 processObjectsWithError:&v47];
  id v17 = v47;
  if (v16)
  {
    v18 = PLMigrationGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

    if (v19)
    {
      v20 = [(PLModelMigrationActionCore *)self logger];
      BOOL v21 = v20 == 0;

      if (v21)
      {
        v35 = PLMigrationGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          uint64_t v36 = [(id)v53[5] completedUnitCount];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v36;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_INFO, "Corrected sign extension on %lu scene classifications", buf, 0xCu);
        }
      }
      else
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
        v22 = PLMigrationGetLog();
        os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
        uint64_t v23 = [(id)v53[5] completedUnitCount];
        int v58 = 134217984;
        uint64_t v59 = v23;
        LODWORD(v45) = 12;
        v24 = (uint8_t *)_os_log_send_and_compose_impl();

        v25 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 814, 1);

        if (v24 != buf) {
          free(v24);
        }
      }
    }
    int64_t v37 = 1;
  }
  else
  {
    v26 = PLMigrationGetLog();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

    if (v27)
    {
      v28 = [(PLModelMigrationActionCore *)self logger];
      BOOL v29 = v28 == 0;

      if (v29)
      {
        v38 = PLMigrationGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = (objc_class *)objc_opt_class();
          v40 = NSStringFromClass(v39);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v17;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
        }
      }
      else
      {
        v46 = a4;
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
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        int v58 = 138543618;
        uint64_t v59 = (uint64_t)v32;
        __int16 v60 = 2112;
        id v61 = v17;
        LODWORD(v45) = 22;
        v33 = (uint8_t *)_os_log_send_and_compose_impl();

        a4 = v46;
        v34 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActions_18000.m", 817, 16);

        if (v33 != buf) {
          free(v33);
        }
      }
    }
    int64_t v37 = 3;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v41 = v17;
  v42 = v41;
  if (a4) {
    char v43 = v16;
  }
  else {
    char v43 = 1;
  }
  if ((v43 & 1) == 0) {
    *a4 = v41;
  }

  _Block_object_dispose(&v52, 8);
  return v37;
}

@end