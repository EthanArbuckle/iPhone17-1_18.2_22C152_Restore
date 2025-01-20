@interface PLModelMigrationAction_PopulateKeyAssets
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_PopulateKeyAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 1;
  uint64_t v6 = +[PLGenericAlbum predicateForAlbumsSupportingCachedKeyAssets];
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLGenericAlbum entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  [v9 setPredicate:v6];
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__43798;
  v66 = __Block_byref_object_dispose__43799;
  id v67 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__43798;
  v60 = __Block_byref_object_dispose__43799;
  id v61 = 0;
  v10 = [PLEnumerateAndSaveController alloc];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  uint64_t v13 = [(PLModelMigrationActionCore *)self pathManager];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __88__PLModelMigrationAction_PopulateKeyAssets_performActionWithManagedObjectContext_error___block_invoke;
  v54[3] = &unk_1E586FB88;
  id v55 = v5;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __88__PLModelMigrationAction_PopulateKeyAssets_performActionWithManagedObjectContext_error___block_invoke_2;
  v53[3] = &unk_1E5870290;
  v53[4] = self;
  v53[5] = &v56;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __88__PLModelMigrationAction_PopulateKeyAssets_performActionWithManagedObjectContext_error___block_invoke_3;
  v48[3] = &unk_1E586A0D0;
  v48[4] = self;
  v50 = &v62;
  v51 = &v68;
  id v49 = v55;
  v52 = &v56;
  v14 = (void *)v6;
  id v15 = v49;
  v16 = [(PLEnumerateAndSaveController *)v10 initWithName:v12 fetchRequest:v9 context:v49 pathManager:v13 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v54 didFetchObjectIDsBlock:v53 processResultBlock:v48];

  v17 = (id *)(v63 + 5);
  id obj = (id)v63[5];
  LOBYTE(v13) = [(PLEnumerateAndSaveController *)v16 processObjectsWithError:&obj];
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
      v22 = PLMigrationGetLog();
      os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      uint64_t v23 = [(id)v57[5] totalUnitCount];
      int v72 = 134217984;
      uint64_t v73 = v23;
      LODWORD(v45) = 12;
      v24 = (uint8_t *)_os_log_send_and_compose_impl();

      v25 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 1161, 0);

      goto LABEL_8;
    }
    v35 = PLMigrationGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [(id)v57[5] totalUnitCount];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v36;
      _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "Populated keyAssets for %lld albums", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  v69[3] = 3;
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
      uint64_t v39 = v63[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v39;
      _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
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
  v30 = PLMigrationGetLog();
  os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
  v31 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v31);
  uint64_t v33 = v63[5];
  int v72 = 138543618;
  uint64_t v73 = (uint64_t)v32;
  __int16 v74 = 2112;
  uint64_t v75 = v33;
  LODWORD(v45) = 22;
  v24 = (uint8_t *)_os_log_send_and_compose_impl();

  v34 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 1159, 16);

LABEL_8:
  if (v24 != buf) {
    free(v24);
  }
LABEL_16:
  uint64_t v40 = v69[3];
  id v41 = (id)v63[5];
  v42 = v41;
  if (v40 != 1 && a4) {
    *a4 = v41;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  int64_t v43 = v69[3];

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v43;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end