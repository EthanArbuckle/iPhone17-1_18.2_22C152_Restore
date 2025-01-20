@interface PLModelMigrationAction_FixComputeSyncResourceFileExtension
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixComputeSyncResourceFileExtension

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v108[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 1;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLInternalResource entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"recipeID", 327689);
  v108[0] = v11;
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"localAvailability", 1);
  v108[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:2];
  v14 = [v10 andPredicateWithSubpredicates:v13];
  [v9 setPredicate:v14];

  v107 = @"asset";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v15];

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
  v16 = [PLEnumerateAndSaveController alloc];
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  uint64_t v19 = [(PLModelMigrationActionCore *)self pathManager];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __106__PLModelMigrationAction_FixComputeSyncResourceFileExtension_performActionWithManagedObjectContext_error___block_invoke;
  v54[3] = &unk_1E586FB88;
  id v20 = v6;
  id v55 = v20;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __106__PLModelMigrationAction_FixComputeSyncResourceFileExtension_performActionWithManagedObjectContext_error___block_invoke_2;
  v53[3] = &unk_1E5870290;
  v53[4] = self;
  v53[5] = &v56;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __106__PLModelMigrationAction_FixComputeSyncResourceFileExtension_performActionWithManagedObjectContext_error___block_invoke_3;
  v52[3] = &unk_1E5869FE0;
  v52[4] = self;
  v52[5] = &v62;
  v52[6] = &v68;
  v52[7] = &v56;
  v21 = [(PLEnumerateAndSaveController *)v16 initWithName:v18 fetchRequest:v9 context:v20 pathManager:v19 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v54 didFetchObjectIDsBlock:v53 processResultBlock:v52];

  v22 = (id *)(v63 + 5);
  id obj = (id)v63[5];
  LOBYTE(v19) = [(PLEnumerateAndSaveController *)v21 processObjectsWithError:&obj];
  objc_storeStrong(v22, obj);
  if (v19)
  {
    v23 = PLMigrationGetLog();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

    if (!v24) {
      goto LABEL_16;
    }
    v25 = [(PLModelMigrationActionCore *)self logger];
    BOOL v26 = v25 == 0;

    if (!v26)
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
      v27 = PLMigrationGetLog();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      uint64_t v28 = [(id)v57[5] totalUnitCount];
      int v72 = 134217984;
      uint64_t v73 = v28;
      LODWORD(v50) = 12;
      v29 = (uint8_t *)_os_log_send_and_compose_impl();

      v30 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_18000.m", 1346, 0);

      goto LABEL_8;
    }
    v40 = PLMigrationGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = [(id)v57[5] totalUnitCount];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v41;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "[CCSS] Fixed ComputeSync resource file extension for %lld assets", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  v69[3] = 3;
  v31 = PLMigrationGetLog();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

  if (!v32) {
    goto LABEL_16;
  }
  v33 = [(PLModelMigrationActionCore *)self logger];
  BOOL v34 = v33 == 0;

  if (v34)
  {
    v40 = PLMigrationGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      uint64_t v44 = v63[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v44;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
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
  v35 = PLMigrationGetLog();
  os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
  v36 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v36);
  uint64_t v38 = v63[5];
  int v72 = 138543618;
  uint64_t v73 = (uint64_t)v37;
  __int16 v74 = 2112;
  uint64_t v75 = v38;
  LODWORD(v50) = 22;
  v29 = (uint8_t *)_os_log_send_and_compose_impl();

  v39 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_18000.m", 1344, 16);

LABEL_8:
  if (v29 != buf) {
    free(v29);
  }
LABEL_16:
  uint64_t v45 = v69[3];
  id v46 = (id)v63[5];
  v47 = v46;
  if (v45 != 1 && a4) {
    *a4 = v46;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  int64_t v48 = v69[3];

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v48;
}

@end