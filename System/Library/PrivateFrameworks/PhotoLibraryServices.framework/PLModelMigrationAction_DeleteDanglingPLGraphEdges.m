@interface PLModelMigrationAction_DeleteDanglingPLGraphEdges
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_DeleteDanglingPLGraphEdges

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v105[2] = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  v4 = (void *)MEMORY[0x1E4F28BA0];
  v55 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"sourceNode");
  v104[0] = v55;
  v54 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"sourceAsset");
  v104[1] = v54;
  v53 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"sourceMoment");
  v104[2] = v53;
  v52 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"sourcePerson");
  v104[3] = v52;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:4];
  v6 = [v4 andPredicateWithSubpredicates:v5];
  v105[0] = v6;
  v7 = (void *)MEMORY[0x1E4F28BA0];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"targetNode");
  v103[0] = v8;
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"targetAsset");
  v103[1] = v9;
  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"targetMoment");
  v103[2] = v10;
  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"targetPerson");
  v103[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:4];
  v13 = [v7 andPredicateWithSubpredicates:v12];
  v105[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
  v15 = [v4 orPredicateWithSubpredicates:v14];

  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__43798;
  v66 = __Block_byref_object_dispose__43799;
  id v67 = 0;
  v16 = (void *)MEMORY[0x1E4F1C0D0];
  v17 = +[PLGraphEdge entityName];
  v18 = [v16 fetchRequestWithEntityName:v17];

  [v18 setPredicate:v15];
  v19 = [PLEnumerateAndSaveController alloc];
  v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  v22 = [(PLModelMigrationActionCore *)self pathManager];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke;
  v60[3] = &unk_1E586FB88;
  id v23 = v51;
  id v61 = v23;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke_2;
  v59[3] = &unk_1E5870290;
  v59[4] = self;
  v59[5] = &v62;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke_3;
  v58[3] = &unk_1E586A058;
  v58[4] = &v62;
  v24 = [(PLEnumerateAndSaveController *)v19 initWithName:v21 fetchRequest:v18 context:v23 pathManager:v22 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v60 didFetchObjectIDsBlock:v59 processResultBlock:v58];

  id v57 = 0;
  LODWORD(v21) = [(PLEnumerateAndSaveController *)v24 processObjectsWithError:&v57];
  id v25 = v57;
  if (v21)
  {
    v26 = PLMigrationGetLog();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);

    if (v27)
    {
      v28 = [(PLModelMigrationActionCore *)self logger];
      BOOL v29 = v28 == 0;

      if (v29)
      {
        v43 = PLMigrationGetLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          uint64_t v44 = [(id)v63[5] completedUnitCount];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v44;
          _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_INFO, "Completed playback bit update on %lu assets", buf, 0xCu);
        }
      }
      else
      {
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
        long long v73 = 0u;
        long long v74 = 0u;
        memset(buf, 0, sizeof(buf));
        v30 = PLMigrationGetLog();
        os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
        uint64_t v31 = [(id)v63[5] completedUnitCount];
        int v68 = 134217984;
        uint64_t v69 = v31;
        LODWORD(v50) = 12;
        v32 = (uint8_t *)_os_log_send_and_compose_impl();

        v33 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActions_18000.m", 859, 1);

        if (v32 != buf) {
          free(v32);
        }
      }
    }
    int64_t v45 = 1;
  }
  else
  {
    v34 = PLMigrationGetLog();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);

    if (v35)
    {
      v36 = [(PLModelMigrationActionCore *)self logger];
      BOOL v37 = v36 == 0;

      if (v37)
      {
        v46 = PLMigrationGetLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = (objc_class *)objc_opt_class();
          v48 = NSStringFromClass(v47);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v25;
          _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
        }
      }
      else
      {
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
        long long v73 = 0u;
        long long v74 = 0u;
        memset(buf, 0, sizeof(buf));
        v38 = PLMigrationGetLog();
        os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
        v39 = (objc_class *)objc_opt_class();
        v40 = NSStringFromClass(v39);
        int v68 = 138543618;
        uint64_t v69 = (uint64_t)v40;
        __int16 v70 = 2112;
        id v71 = v25;
        LODWORD(v50) = 22;
        v41 = (uint8_t *)_os_log_send_and_compose_impl();

        v42 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v42, "logWithMessage:fromCodeLocation:type:", v41, "PLModelMigrationActions_18000.m", 862, 16);

        if (v41 != buf) {
          free(v41);
        }
      }
    }
    int64_t v45 = 3;
  }

  _Block_object_dispose(&v62, 8);
  return v45;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end