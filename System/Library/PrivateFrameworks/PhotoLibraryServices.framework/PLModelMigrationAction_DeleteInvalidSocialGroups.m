@interface PLModelMigrationAction_DeleteInvalidSocialGroups
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_DeleteInvalidSocialGroups

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  +[PLGraphLabel ensureLabelsAreUpdatedInContext:v5];
  v6 = +[PLGraphNode fetchRequest];
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"primaryLabelCode", 1000);
  [v6 setPredicate:v7];

  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__43798;
  v49[4] = __Block_byref_object_dispose__43799;
  id v50 = 0;
  v8 = [PLEnumerateAndSaveController alloc];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  uint64_t v11 = [(PLModelMigrationActionCore *)self pathManager];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke;
  v47[3] = &unk_1E586FB88;
  id v48 = v5;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke_2;
  v46[3] = &unk_1E5870290;
  v46[4] = self;
  v46[5] = v49;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke_3;
  v42[3] = &unk_1E586A148;
  id v12 = v48;
  id v43 = v12;
  v44 = &v51;
  v45 = v49;
  v13 = [(PLEnumerateAndSaveController *)v8 initWithName:v10 fetchRequest:v6 context:v12 pathManager:v11 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v47 didFetchObjectIDsBlock:v46 processResultBlock:v42];

  id v41 = 0;
  LOBYTE(v11) = [(PLEnumerateAndSaveController *)v13 processObjectsWithError:&v41];
  id v14 = v41;
  if (v11)
  {
    v15 = PLMigrationGetLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      v17 = [(PLModelMigrationActionCore *)self logger];
      BOOL v18 = v17 == 0;

      if (v18)
      {
        v32 = PLMigrationGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = v52[3];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v33;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Deleted %ld social groups with fewer than two members", buf, 0xCu);
        }
      }
      else
      {
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v19 = PLMigrationGetLog();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        v20 = (void *)v52[3];
        int v55 = 134217984;
        v56 = v20;
        LODWORD(v39) = 12;
        v21 = (uint8_t *)_os_log_send_and_compose_impl();

        v22 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_18000.m", 1420, 0);

        if (v21 != buf) {
          free(v21);
        }
      }
    }
    int64_t v34 = 1;
  }
  else
  {
    v23 = PLMigrationGetLog();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (v24)
    {
      v25 = [(PLModelMigrationActionCore *)self logger];
      BOOL v26 = v25 == 0;

      if (v26)
      {
        v35 = PLMigrationGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = (objc_class *)objc_opt_class();
          v37 = NSStringFromClass(v36);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v14;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v27 = PLMigrationGetLog();
        os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        int v55 = 138543618;
        v56 = v29;
        __int16 v57 = 2114;
        id v58 = v14;
        LODWORD(v39) = 22;
        v30 = (uint8_t *)_os_log_send_and_compose_impl();

        v31 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActions_18000.m", 1418, 16);

        if (v30 != buf) {
          free(v30);
        }
      }
    }
    if (a4) {
      *a4 = v14;
    }
    int64_t v34 = 3;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v51, 8);

  return v34;
}

+ (int64_t)actionProgressWeight
{
  return 300;
}

@end