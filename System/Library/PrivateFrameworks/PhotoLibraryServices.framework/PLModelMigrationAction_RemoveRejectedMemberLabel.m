@interface PLModelMigrationAction_RemoveRejectedMemberLabel
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemoveRejectedMemberLabel

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v74 = 1;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__43798;
  v69 = __Block_byref_object_dispose__43799;
  id v70 = 0;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLGraphLabel entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"code", 1002);
  [v9 setPredicate:v10];

  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__43798;
  v63[4] = __Block_byref_object_dispose__43799;
  id v64 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  v11 = [PLEnumerateAndSaveController alloc];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [(PLModelMigrationActionCore *)self pathManager];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke;
  v57[3] = &unk_1E586FB88;
  id v58 = v6;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke_2;
  v56[3] = &unk_1E5870290;
  v56[4] = self;
  v56[5] = v63;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke_3;
  v50[3] = &unk_1E5869F68;
  v50[4] = self;
  v52 = &v65;
  v53 = &v71;
  id v51 = v58;
  v54 = &v59;
  v55 = v63;
  v15 = a4;
  id v16 = v51;
  v17 = [(PLEnumerateAndSaveController *)v11 initWithName:v13 fetchRequest:v9 context:v51 pathManager:v14 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v57 didFetchObjectIDsBlock:v56 processResultBlock:v50];

  v18 = (id *)(v66 + 5);
  id obj = (id)v66[5];
  LODWORD(v14) = [(PLEnumerateAndSaveController *)v17 processObjectsWithError:&obj];
  objc_storeStrong(v18, obj);
  if (v14)
  {
    v19 = PLMigrationGetLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (!v20) {
      goto LABEL_17;
    }
    v21 = [(PLModelMigrationActionCore *)self logger];
    BOOL v22 = v21 == 0;

    if (!v22)
    {
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
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
      memset(buf, 0, sizeof(buf));
      v23 = PLMigrationGetLog();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      v24 = (void *)v60[3];
      int v75 = 134217984;
      v76 = v24;
      LODWORD(v48) = 12;
      v25 = (uint8_t *)_os_log_send_and_compose_impl();

      v26 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 564, 0);

      if (v25 != buf)
      {
        v27 = v25;
LABEL_10:
        free(v27);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    v38 = PLMigrationGetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = v60[3];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v39;
      _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "Removed %tu rejected member labels.", buf, 0xCu);
    }
LABEL_16:

    goto LABEL_17;
  }
  v72[3] = 3;
  v28 = PLMigrationGetLog();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

  if (!v29) {
    goto LABEL_17;
  }
  v30 = [(PLModelMigrationActionCore *)self logger];
  BOOL v31 = v30 == 0;

  if (v31)
  {
    v38 = PLMigrationGetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v40 = (objc_class *)objc_opt_class();
      v41 = NSStringFromClass(v40);
      uint64_t v42 = v66[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v42;
      _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
    }
    goto LABEL_16;
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
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
  memset(buf, 0, sizeof(buf));
  v32 = PLMigrationGetLog();
  os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
  v33 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v33);
  uint64_t v35 = v66[5];
  int v75 = 138543618;
  v76 = v34;
  __int16 v77 = 2112;
  uint64_t v78 = v35;
  LODWORD(v48) = 22;
  v36 = (uint8_t *)_os_log_send_and_compose_impl();

  v37 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActions_18000.m", 567, 16);

  if (v36 != buf)
  {
    v27 = v36;
    goto LABEL_10;
  }
LABEL_17:
  uint64_t v43 = v72[3];
  id v44 = (id)v66[5];
  v45 = v44;
  if (v43 != 1 && v15) {
    id *v15 = v44;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  int64_t v46 = v72[3];

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(v63, 8);

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v71, 8);

  return v46;
}

@end