@interface PLModelMigrationAction_RemoveLabelsFromSyndication
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemoveLabelsFromSyndication

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 1;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__43798;
  v65 = __Block_byref_object_dispose__43799;
  id v66 = 0;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLGraphLabel entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__43798;
  v59 = __Block_byref_object_dispose__43799;
  id v60 = 0;
  v10 = [PLEnumerateAndSaveController alloc];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = [(PLModelMigrationActionCore *)self pathManager];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke;
  v53[3] = &unk_1E586FB88;
  id v54 = v6;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke_2;
  v52[3] = &unk_1E5870290;
  v52[4] = self;
  v52[5] = &v55;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke_3;
  v47[3] = &unk_1E5869FB8;
  v47[4] = self;
  v49 = &v61;
  v50 = &v67;
  id v48 = v54;
  v51 = &v55;
  v14 = a4;
  id v15 = v48;
  v16 = [(PLEnumerateAndSaveController *)v10 initWithName:v12 fetchRequest:v9 context:v48 pathManager:v13 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v53 didFetchObjectIDsBlock:v52 processResultBlock:v47];

  v17 = (id *)(v62 + 5);
  id obj = (id)v62[5];
  LODWORD(v13) = [(PLEnumerateAndSaveController *)v16 processObjectsWithError:&obj];
  objc_storeStrong(v17, obj);
  if (v13)
  {
    v18 = PLMigrationGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (!v19) {
      goto LABEL_16;
    }
    v20 = [(PLModelMigrationActionCore *)self logger];
    BOOL v21 = v20 == 0;

    if (!v21)
    {
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
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      memset(buf, 0, sizeof(buf));
      v22 = PLMigrationGetLog();
      os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      uint64_t v23 = [(id)v56[5] totalUnitCount];
      int v71 = 134217984;
      uint64_t v72 = v23;
      LODWORD(v45) = 12;
      v24 = (uint8_t *)_os_log_send_and_compose_impl();

      v25 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 655, 0);

      goto LABEL_8;
    }
    v35 = PLMigrationGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [(id)v56[5] totalUnitCount];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v36;
      _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "Removed %lld member labels from Syndication library.", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  v68[3] = 3;
  v26 = PLMigrationGetLog();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

  if (!v27) {
    goto LABEL_16;
  }
  v28 = [(PLModelMigrationActionCore *)self logger];
  BOOL v29 = v28 == 0;

  if (v29)
  {
    v35 = PLMigrationGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      uint64_t v39 = v62[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v39;
      _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
    }
    goto LABEL_15;
  }
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
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  memset(buf, 0, sizeof(buf));
  v30 = PLMigrationGetLog();
  os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
  v31 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v31);
  uint64_t v33 = v62[5];
  int v71 = 138543618;
  uint64_t v72 = (uint64_t)v32;
  __int16 v73 = 2112;
  uint64_t v74 = v33;
  LODWORD(v45) = 22;
  v24 = (uint8_t *)_os_log_send_and_compose_impl();

  v34 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 658, 16);

LABEL_8:
  if (v24 != buf) {
    free(v24);
  }
LABEL_16:
  uint64_t v40 = v68[3];
  id v41 = (id)v62[5];
  v42 = v41;
  if (v40 != 1 && v14) {
    id *v14 = v41;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  int64_t v43 = v68[3];

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  return v43;
}

@end