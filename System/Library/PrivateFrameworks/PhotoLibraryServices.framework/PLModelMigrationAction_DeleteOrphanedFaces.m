@interface PLModelMigrationAction_DeleteOrphanedFaces
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_DeleteOrphanedFaces

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v116[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[PLDetectedFace fetchRequest];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"assetForFace");
  v116[0] = v8;
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"faceCrop");
  v116[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];
  [v7 addObjectsFromArray:v10];

  if ([(PLModelMigrationActionCore *)self startingSchemaVersion] >= 0x427D)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"assetForTemporalDetectedFaces");
    [v7 addObject:v11];
  }
  v12 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];
  [v6 setPredicate:v12];

  [v6 setFetchBatchSize:100];
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = 1;
  uint64_t v71 = 0;
  v72 = (id *)&v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__23954;
  v75 = __Block_byref_object_dispose__23955;
  id v76 = 0;
  id v70 = 0;
  v13 = [v5 executeFetchRequest:v6 error:&v70];
  id v63 = v70;
  if ([v13 count])
  {
    v14 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v13 count], 0);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __90__PLModelMigrationAction_DeleteOrphanedFaces_performActionWithManagedObjectContext_error___block_invoke;
    v65[3] = &unk_1E5867438;
    v65[4] = self;
    v68 = &v71;
    v69 = &v77;
    id v66 = v5;
    id v15 = v14;
    id v67 = v15;
    v16 = [v66 enumerateWithIncrementalSaveUsingObjects:v13 withBlock:v65];
    if (v16)
    {
      v78[3] = 3;
      v17 = PLMigrationGetLog();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

      if (v18)
      {
        v19 = [(PLModelMigrationActionCore *)self logger];
        BOOL v20 = v19 == 0;

        if (v20)
        {
          v43 = PLMigrationGetLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v44 = (objc_class *)objc_opt_class();
            v45 = NSStringFromClass(v44);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v45;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v16;
            _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "Failed to save managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
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
          memset(buf, 0, sizeof(buf));
          v21 = PLMigrationGetLog();
          os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          int v81 = 138543618;
          uint64_t v82 = (uint64_t)v23;
          __int16 v83 = 2114;
          id v84 = v16;
          LODWORD(v62) = 22;
          v24 = (uint8_t *)_os_log_send_and_compose_impl();

          v25 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_16000.m", 782, 16);

          if (v24 != buf) {
            free(v24);
          }
        }
      }
      if (v72[5]) {
        id v46 = v72[5];
      }
      else {
        id v46 = v16;
      }
      objc_storeStrong(v72 + 5, v46);
    }
    else
    {
      v35 = PLMigrationGetLog();
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);

      if (v36)
      {
        v37 = [(PLModelMigrationActionCore *)self logger];
        BOOL v38 = v37 == 0;

        if (v38)
        {
          v54 = PLMigrationGetLog();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v55 = [v13 count];
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v55;
            _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_DEFAULT, "Deleted orphaned faces: %tu", buf, 0xCu);
          }
        }
        else
        {
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
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
          memset(buf, 0, sizeof(buf));
          v39 = PLMigrationGetLog();
          os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          uint64_t v40 = [v13 count];
          int v81 = 134217984;
          uint64_t v82 = v40;
          LODWORD(v62) = 12;
          v41 = (uint8_t *)_os_log_send_and_compose_impl();

          v42 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v42, "logWithMessage:fromCodeLocation:type:", v41, "PLModelMigrationActions_16000.m", 779, 0);

          if (v41 != buf) {
            free(v41);
          }
        }
      }
    }

LABEL_26:
    goto LABEL_27;
  }
  if (!v13)
  {
    v78[3] = 3;
    v26 = PLMigrationGetLog();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

    if (v27)
    {
      v28 = [(PLModelMigrationActionCore *)self logger];
      BOOL v29 = v28 == 0;

      if (v29)
      {
        v56 = PLMigrationGetLog();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = (objc_class *)objc_opt_class();
          v58 = NSStringFromClass(v57);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v58;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v63;
          _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v30 = PLMigrationGetLog();
        os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        int v81 = 138543618;
        uint64_t v82 = (uint64_t)v32;
        __int16 v83 = 2114;
        id v84 = v63;
        LODWORD(v62) = 22;
        v33 = (uint8_t *)_os_log_send_and_compose_impl();

        v34 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActions_16000.m", 787, 16);

        if (v33 != buf) {
          free(v33);
        }
      }
    }
    v59 = v72;
    id v60 = v72[5];
    if (!v60) {
      id v60 = v63;
    }
    id v61 = v60;
    id v15 = v59[5];
    v59[5] = v61;
    goto LABEL_26;
  }
LABEL_27:
  v47 = +[PLManagedLegacyFace entityName];
  v48 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"asset == nil"];
  +[PLModelMigrator executeBatchDeleteWithEntityName:v47 predicate:v48 managedObjectContext:v5 error:0];

  [(PLModelMigrationActionCore *)self finalizeProgress];
  uint64_t v49 = v78[3];
  id v50 = v72[5];
  v51 = v50;
  if (v49 != 1 && a4) {
    *a4 = v50;
  }

  int64_t v52 = v78[3];
  _Block_object_dispose(&v71, 8);

  _Block_object_dispose(&v77, 8);
  return v52;
}

@end