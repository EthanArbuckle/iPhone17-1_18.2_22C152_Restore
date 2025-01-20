@interface PLModelMigrationAction_LibraryScopeTrashedStateFixup
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_LibraryScopeTrashedStateFixup

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v108[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 1;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__53891;
  v67 = __Block_byref_object_dispose__53892;
  id v68 = 0;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLLibraryScope entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v11 = +[PLLibraryScope predicateForActiveLibraryScope];
  v108[0] = v11;
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"trashedState", 1);
  v108[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:2];
  v14 = [v10 andPredicateWithSubpredicates:v13];
  [v9 setPredicate:v14];

  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__53891;
  v61[4] = __Block_byref_object_dispose__53892;
  id v62 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  v15 = [PLEnumerateAndSaveController alloc];
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  uint64_t v18 = [(PLModelMigrationActionCore *)self pathManager];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke;
  v55[3] = &unk_1E586FB88;
  id v19 = v6;
  id v56 = v19;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke_2;
  v54[3] = &unk_1E5870290;
  v54[4] = self;
  v54[5] = v61;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke_3;
  v53[3] = &unk_1E586B450;
  v53[4] = self;
  v53[5] = &v57;
  v53[6] = &v63;
  v53[7] = &v69;
  v53[8] = v61;
  v20 = [(PLEnumerateAndSaveController *)v15 initWithName:v17 fetchRequest:v9 context:v19 pathManager:v18 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v55 didFetchObjectIDsBlock:v54 processResultBlock:v53];

  v21 = (id *)(v64 + 5);
  id obj = (id)v64[5];
  LOBYTE(v18) = [(PLEnumerateAndSaveController *)v20 processObjectsWithError:&obj];
  objc_storeStrong(v21, obj);
  if (v18)
  {
    v22 = PLMigrationGetLog();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (!v23) {
      goto LABEL_17;
    }
    v24 = [(PLModelMigrationActionCore *)self logger];
    BOOL v25 = v24 == 0;

    if (!v25)
    {
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
      long long v78 = 0u;
      long long v79 = 0u;
      memset(buf, 0, sizeof(buf));
      v26 = PLMigrationGetLog();
      os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      v27 = (void *)v58[3];
      int v73 = 134217984;
      v74 = v27;
      LODWORD(v51) = 12;
      v28 = (uint8_t *)_os_log_send_and_compose_impl();

      v29 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_17000.m", 486, 0);

      if (v28 != buf)
      {
        v30 = v28;
LABEL_10:
        free(v30);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    v41 = PLMigrationGetLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = v58[3];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v42;
      _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "Fixed trashedState in %tu active LibraryScopes", buf, 0xCu);
    }
LABEL_16:

    goto LABEL_17;
  }
  v70[3] = 3;
  v31 = PLMigrationGetLog();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

  if (!v32) {
    goto LABEL_17;
  }
  v33 = [(PLModelMigrationActionCore *)self logger];
  BOOL v34 = v33 == 0;

  if (v34)
  {
    v41 = PLMigrationGetLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v43 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v43);
      uint64_t v45 = v64[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v45;
      _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %{public}@", buf, 0x16u);
    }
    goto LABEL_16;
  }
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
  long long v78 = 0u;
  long long v79 = 0u;
  memset(buf, 0, sizeof(buf));
  v35 = PLMigrationGetLog();
  os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
  v36 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v36);
  uint64_t v38 = v64[5];
  int v73 = 138543618;
  v74 = v37;
  __int16 v75 = 2114;
  uint64_t v76 = v38;
  LODWORD(v51) = 22;
  v39 = (uint8_t *)_os_log_send_and_compose_impl();

  v40 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v40, "logWithMessage:fromCodeLocation:type:", v39, "PLModelMigrationActions_17000.m", 484, 16);

  if (v39 != buf)
  {
    v30 = v39;
    goto LABEL_10;
  }
LABEL_17:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  uint64_t v46 = v70[3];
  id v47 = (id)v64[5];
  v48 = v47;
  if (v46 != 1 && a4) {
    *a4 = v47;
  }

  int64_t v49 = v70[3];
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(v61, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);

  return v49;
}

@end