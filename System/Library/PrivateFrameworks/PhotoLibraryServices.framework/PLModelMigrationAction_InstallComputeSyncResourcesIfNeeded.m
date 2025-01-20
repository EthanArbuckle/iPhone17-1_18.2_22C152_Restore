@interface PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v106[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 1;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLComputeSyncAttributes entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"cloudComputeStateVersion", @"1.950"];
  v106[0] = v11;
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"localAnalysisStage", 950);
  v106[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
  v14 = [v10 andPredicateWithSubpredicates:v13];
  [v9 setPredicate:v14];

  v105 = @"asset";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v15];

  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__43798;
  v64 = __Block_byref_object_dispose__43799;
  id v65 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__43798;
  v58[4] = __Block_byref_object_dispose__43799;
  id v59 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v18 = [PLEnumerateAndSaveController alloc];
  v19 = [(PLModelMigrationActionCore *)self pathManager];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke;
  v52[3] = &unk_1E586FB88;
  id v20 = v6;
  id v53 = v20;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke_2;
  v51[3] = &unk_1E5870290;
  v51[4] = self;
  v51[5] = v58;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke_3;
  v50[3] = &unk_1E586A198;
  v50[4] = self;
  v50[5] = &v60;
  v50[6] = &v66;
  v50[7] = &v54;
  v50[8] = v58;
  v21 = [(PLEnumerateAndSaveController *)v18 initWithName:v17 fetchRequest:v9 context:v20 pathManager:v19 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v52 didFetchObjectIDsBlock:v51 processResultBlock:v50];

  v22 = (id *)(v61 + 5);
  id obj = (id)v61[5];
  LOBYTE(v13) = [(PLEnumerateAndSaveController *)v21 processObjectsWithError:&obj];
  objc_storeStrong(v22, obj);
  if (v13)
  {
    v23 = PLMigrationGetLog();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

    if (!v24) {
      goto LABEL_17;
    }
    v25 = [(PLModelMigrationActionCore *)self logger];
    BOOL v26 = v25 == 0;

    if (!v26)
    {
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
      long long v75 = 0u;
      long long v76 = 0u;
      memset(buf, 0, sizeof(buf));
      v27 = PLMigrationGetLog();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      v28 = (void *)v55[3];
      int v70 = 134217984;
      v71 = v28;
      LODWORD(v48) = 12;
      v29 = (uint8_t *)_os_log_send_and_compose_impl();

      v30 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_18000.m", 1598, 0);

      if (v29 != buf)
      {
        v31 = v29;
LABEL_10:
        free(v31);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    v40 = PLMigrationGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = v55[3];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v41;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "[CCSS] Installed %tu ComputeSync resources after migration from DawnburstG to CrystalGlow", buf, 0xCu);
    }
LABEL_16:

    goto LABEL_17;
  }
  v67[3] = 3;
  v32 = PLMigrationGetLog();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

  if (!v33) {
    goto LABEL_17;
  }
  v34 = [(PLModelMigrationActionCore *)self logger];
  BOOL v35 = v34 == 0;

  if (v35)
  {
    v40 = PLMigrationGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = v61[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v42;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
    }
    goto LABEL_16;
  }
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
  long long v75 = 0u;
  long long v76 = 0u;
  memset(buf, 0, sizeof(buf));
  v36 = PLMigrationGetLog();
  os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
  uint64_t v37 = v61[5];
  int v70 = 138543618;
  v71 = v17;
  __int16 v72 = 2112;
  uint64_t v73 = v37;
  LODWORD(v48) = 22;
  v38 = (uint8_t *)_os_log_send_and_compose_impl();

  v39 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActions_18000.m", 1596, 16);

  if (v38 != buf)
  {
    v31 = v38;
    goto LABEL_10;
  }
LABEL_17:
  uint64_t v43 = v67[3];
  id v44 = (id)v61[5];
  v45 = v44;
  if (v43 != 1 && a4) {
    *a4 = v44;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  int64_t v46 = v67[3];

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(v58, 8);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);

  return v46;
}

@end