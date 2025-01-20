@interface PLModelMigrationAction_RemoveOrphanGeneratedAssetDescriptionNodes
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemoveOrphanGeneratedAssetDescriptionNodes

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  v6 = (objc_class *)objc_opt_class();
  v62 = NSStringFromClass(v6);
  v7 = objc_msgSend(v5, "pl_graphCache");
  v8 = [v7 objectIDForLabelWithCode:1300 inContext:v5];

  if (v8)
  {
    v9 = [(PLModelMigrationActionBackground *)self resumeMarker];
    v10 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v5, v9);

    v11 = (void *)MEMORY[0x1E4F1C0D0];
    v12 = +[PLGraphNode entityName];
    v61 = [v11 fetchRequestWithEntityName:v12];

    v13 = (void *)MEMORY[0x1E4F28BA0];
    if (v10) {
      [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v10];
    }
    else {
    v21 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
    v77[0] = v21;
    v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"primaryLabel", v8];
    v77[1] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
    v24 = [v13 andPredicateWithSubpredicates:v23];
    [v61 setPredicate:v24];

    id v68 = 0;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __113__PLModelMigrationAction_RemoveOrphanGeneratedAssetDescriptionNodes_performActionWithManagedObjectContext_error___block_invoke;
    v63[3] = &unk_1E58623E0;
    id v64 = v5;
    v65 = self;
    id v25 = v62;
    id v66 = v25;
    v67 = &v69;
    int64_t v26 = +[PLModelMigrationActionUtility processManagedObjectBatchesWithAction:self managedObjectContext:v64 fetchRequest:v61 pendingParentUnitCount:0 useObjectIDResumeMarker:1 error:&v68 processingBlock:v63];
    id v27 = v68;
    if (v26 == 2)
    {
      v36 = PLMigrationGetLog();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

      if (!v37) {
        goto LABEL_37;
      }
      v38 = [(PLModelMigrationActionBackground *)self logger];
      BOOL v39 = v38 == 0;

      if (!v39)
      {
        long long v107 = 0u;
        long long v108 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v40 = PLMigrationGetLog();
        os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
        v41 = (void *)v70[3];
        int v73 = 134218242;
        id v74 = v41;
        __int16 v75 = 2114;
        id v76 = v25;
        LODWORD(v59) = 22;
        v34 = (uint8_t *)_os_log_send_and_compose_impl();

        v42 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v42, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActionBackground.m", 1451, 0);

        goto LABEL_17;
      }
      v53 = PLMigrationGetLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = v70[3];
        *(_DWORD *)buf = 134218242;
        *(void *)&buf[4] = v55;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEFAULT, "Cancelled background migration action after removing %tu orphaned GeneratedAssetDescription nodes for %{public}@", buf, 0x16u);
      }
    }
    else if (v26 == 1)
    {
      v28 = PLMigrationGetLog();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

      if (!v29) {
        goto LABEL_37;
      }
      v30 = [(PLModelMigrationActionBackground *)self logger];
      BOOL v31 = v30 == 0;

      if (!v31)
      {
        long long v107 = 0u;
        long long v108 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v32 = PLMigrationGetLog();
        os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        v33 = (void *)v70[3];
        int v73 = 134218242;
        id v74 = v33;
        __int16 v75 = 2114;
        id v76 = v25;
        LODWORD(v59) = 22;
        v34 = (uint8_t *)_os_log_send_and_compose_impl();

        v35 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActionBackground.m", 1449, 0);

LABEL_17:
        if (v34 == buf) {
          goto LABEL_37;
        }
        v43 = v34;
LABEL_23:
        free(v43);
        goto LABEL_37;
      }
      v53 = PLMigrationGetLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v54 = v70[3];
        *(_DWORD *)buf = 134218242;
        *(void *)&buf[4] = v54;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEFAULT, "Removed %tu orphaned GeneratedAssetDescription nodes for %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v44 = PLMigrationGetLog();
      BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

      if (!v45) {
        goto LABEL_37;
      }
      v46 = [(PLModelMigrationActionBackground *)self logger];
      BOOL v47 = v46 == 0;

      if (!v47)
      {
        long long v107 = 0u;
        long long v108 = 0u;
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
        memset(buf, 0, sizeof(buf));
        v48 = PLMigrationGetLog();
        os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
        int v73 = 138543618;
        id v74 = v25;
        __int16 v75 = 2112;
        id v76 = v27;
        LODWORD(v59) = 22;
        v49 = (uint8_t *)_os_log_send_and_compose_impl();

        v50 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v50, "logWithMessage:fromCodeLocation:type:", v49, "PLModelMigrationActionBackground.m", 1453, 16);

        if (v49 == buf) {
          goto LABEL_37;
        }
        v43 = v49;
        goto LABEL_23;
      }
      v53 = PLMigrationGetLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v27;
        _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_ERROR, "Failed to process background migration action %{public}@. Error: %@", buf, 0x16u);
      }
    }

LABEL_37:
    [(PLModelMigrationActionBackground *)self finalizeProgress];
    id v56 = v27;
    v52 = v56;
    if (v26 != 1 && a4) {
      *a4 = v56;
    }

    goto LABEL_41;
  }
  v14 = PLMigrationGetLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    v16 = [(PLModelMigrationActionBackground *)self logger];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      v51 = PLMigrationGetLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v62;
        _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_DEFAULT, "No generated asset description label found for %{public}@. No need to remove orphan nodes because there aren't any to remove", buf, 0xCu);
      }
    }
    else
    {
      long long v107 = 0u;
      long long v108 = 0u;
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
      memset(buf, 0, sizeof(buf));
      v18 = PLMigrationGetLog();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      int v73 = 138543362;
      id v74 = v62;
      LODWORD(v58) = 12;
      v19 = (uint8_t *)_os_log_send_and_compose_impl();

      v20 = [(PLModelMigrationActionBackground *)self logger];
      objc_msgSend(v20, "logWithMessage:fromCodeLocation:type:", v19, "PLModelMigrationActionBackground.m", 1411, 0);

      if (v19 != buf) {
        free(v19);
      }
    }
  }
  [(PLModelMigrationActionBackground *)self setResumeMarkerValue:0];
  v52 = 0;
  int64_t v26 = 1;
LABEL_41:

  _Block_object_dispose(&v69, 8);
  return v26;
}

@end