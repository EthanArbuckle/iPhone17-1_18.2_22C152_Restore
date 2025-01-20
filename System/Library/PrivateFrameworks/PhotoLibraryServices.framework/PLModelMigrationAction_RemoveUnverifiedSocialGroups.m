@interface PLModelMigrationAction_RemoveUnverifiedSocialGroups
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemoveUnverifiedSocialGroups

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 1;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__43798;
  v66 = __Block_byref_object_dispose__43799;
  id v67 = 0;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLGraphNode entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"primaryLabelCode", 1000);
  [v9 setPredicate:v10];

  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__43798;
  v60 = __Block_byref_object_dispose__43799;
  id v61 = 0;
  v11 = [PLEnumerateAndSaveController alloc];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [(PLModelMigrationActionCore *)self pathManager];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke;
  v54[3] = &unk_1E586FB88;
  id v55 = v6;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke_2;
  v53[3] = &unk_1E5870290;
  v53[4] = self;
  v53[5] = &v56;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke_3;
  v48[3] = &unk_1E586A080;
  v48[4] = self;
  v50 = &v62;
  v51 = &v68;
  id v49 = v55;
  v52 = &v56;
  v15 = a4;
  id v16 = v49;
  v17 = [(PLEnumerateAndSaveController *)v11 initWithName:v13 fetchRequest:v9 context:v49 pathManager:v14 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v54 didFetchObjectIDsBlock:v53 processResultBlock:v48];

  v18 = (id *)(v63 + 5);
  id obj = (id)v63[5];
  LODWORD(v14) = [(PLEnumerateAndSaveController *)v17 processObjectsWithError:&obj];
  objc_storeStrong(v18, obj);
  if (v14)
  {
    v19 = PLMigrationGetLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (!v20) {
      goto LABEL_16;
    }
    v21 = [(PLModelMigrationActionCore *)self logger];
    BOOL v22 = v21 == 0;

    if (!v22)
    {
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
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
      memset(buf, 0, sizeof(buf));
      v23 = PLMigrationGetLog();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      uint64_t v24 = [(id)v57[5] totalUnitCount];
      int v72 = 134217984;
      uint64_t v73 = v24;
      LODWORD(v46) = 12;
      v25 = (uint8_t *)_os_log_send_and_compose_impl();

      v26 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 982, 0);

      goto LABEL_8;
    }
    v36 = PLMigrationGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [(id)v57[5] totalUnitCount];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v37;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Removed %lld rejected member labels.", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  v69[3] = 3;
  v27 = PLMigrationGetLog();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

  if (!v28) {
    goto LABEL_16;
  }
  v29 = [(PLModelMigrationActionCore *)self logger];
  BOOL v30 = v29 == 0;

  if (v30)
  {
    v36 = PLMigrationGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      uint64_t v40 = v63[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v40;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
    }
    goto LABEL_15;
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
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
  memset(buf, 0, sizeof(buf));
  v31 = PLMigrationGetLog();
  os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
  v32 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v32);
  uint64_t v34 = v63[5];
  int v72 = 138543618;
  uint64_t v73 = (uint64_t)v33;
  __int16 v74 = 2112;
  uint64_t v75 = v34;
  LODWORD(v46) = 22;
  v25 = (uint8_t *)_os_log_send_and_compose_impl();

  v35 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 985, 16);

LABEL_8:
  if (v25 != buf) {
    free(v25);
  }
LABEL_16:
  uint64_t v41 = v69[3];
  id v42 = (id)v63[5];
  v43 = v42;
  if (v41 != 1 && v15) {
    id *v15 = v42;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  int64_t v44 = v69[3];

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v44;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end