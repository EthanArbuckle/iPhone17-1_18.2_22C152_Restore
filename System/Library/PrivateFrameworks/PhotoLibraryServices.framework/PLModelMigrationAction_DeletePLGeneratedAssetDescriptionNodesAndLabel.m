@interface PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel
+ (int64_t)actionProgressWeight;
- (int64_t)_deleteLabelWithCode1300InContext:(id)a3 error:(id *)a4;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel

- (int64_t)_deleteLabelWithCode1300InContext:(id)a3 error:(id *)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLGraphLabel entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == 1300", @"code");
  [v9 setPredicate:v10];

  v11 = [v6 executeFetchRequest:v9 error:a4];
  v12 = v11;
  if (v11)
  {
    v13 = [v11 firstObject];
    if (v13)
    {
      [v6 deleteObject:v13];
      if (([v6 save:a4] & 1) == 0)
      {
        v14 = PLMigrationGetLog();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

        if (v15)
        {
          v16 = [(PLModelMigrationActionCore *)self logger];

          if (v16)
          {
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            *(_OWORD *)buf = 0u;
            long long v45 = 0u;
            v17 = PLMigrationGetLog();
            os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
            if (a4) {
              id v18 = *a4;
            }
            else {
              id v18 = 0;
            }
            int v42 = 138412290;
            id v43 = v18;
            LODWORD(v41) = 12;
            v38 = (uint8_t *)_os_log_send_and_compose_impl();

            v39 = [(PLModelMigrationActionCore *)self logger];
            objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActions_18000.m", 783, 16);

            if (v38 != buf) {
              free(v38);
            }
          }
          else
          {
            v36 = PLMigrationGetLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              if (a4) {
                id v37 = *a4;
              }
              else {
                id v37 = 0;
              }
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v37;
              _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Failed to delete PLGeneratedAssetDescription label (%@)", buf, 0xCu);
            }
          }
        }
        int64_t v35 = 3;
        goto LABEL_40;
      }
    }
    else
    {
      v24 = PLMigrationGetLog();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        v26 = [(PLModelMigrationActionCore *)self logger];

        if (v26)
        {
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          *(_OWORD *)buf = 0u;
          long long v45 = 0u;
          v27 = PLMigrationGetLog();
          os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
          LOWORD(v42) = 0;
          LODWORD(v41) = 2;
          v28 = (uint8_t *)_os_log_send_and_compose_impl();

          v29 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_18000.m", 786, 0);

          if (v28 != buf) {
            free(v28);
          }
        }
        else
        {
          v34 = PLMigrationGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "No label with code 1300 found", buf, 2u);
          }
        }
      }
    }
    int64_t v35 = 1;
LABEL_40:

    goto LABEL_41;
  }
  v19 = PLMigrationGetLog();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

  if (v20)
  {
    v21 = [(PLModelMigrationActionCore *)self logger];

    if (v21)
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      *(_OWORD *)buf = 0u;
      long long v45 = 0u;
      v22 = PLMigrationGetLog();
      os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      if (a4) {
        id v23 = *a4;
      }
      else {
        id v23 = 0;
      }
      int v42 = 138412290;
      id v43 = v23;
      LODWORD(v41) = 12;
      v32 = (uint8_t *)_os_log_send_and_compose_impl();

      v33 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActions_18000.m", 790, 16);

      if (v32 != buf) {
        free(v32);
      }
    }
    else
    {
      v30 = PLMigrationGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        if (a4) {
          id v31 = *a4;
        }
        else {
          id v31 = 0;
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v31;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "No label with code 1300 found (Error: %@)", buf, 0xCu);
      }
    }
  }
  int64_t v35 = 3;
LABEL_41:

  return v35;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v104[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v66 = 0;
  long long v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 1;
  uint64_t v60 = 0;
  long long v61 = &v60;
  uint64_t v62 = 0x3032000000;
  long long v63 = __Block_byref_object_copy__43798;
  long long v64 = __Block_byref_object_dispose__43799;
  id v65 = 0;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLGraphNode entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v104[0] = @"primaryLabel";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v10];

  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"primaryLabelCode", 1300);
  [v9 setPredicate:v11];

  uint64_t v54 = 0;
  long long v55 = &v54;
  uint64_t v56 = 0x3032000000;
  long long v57 = __Block_byref_object_copy__43798;
  long long v58 = __Block_byref_object_dispose__43799;
  id v59 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  BOOL v15 = [(PLModelMigrationActionCore *)self pathManager];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke;
  v52[3] = &unk_1E586FB88;
  id v53 = v6;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke_2;
  v51[3] = &unk_1E5870290;
  v51[4] = self;
  v51[5] = &v54;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke_3;
  v47[3] = &unk_1E586A008;
  v47[4] = self;
  long long v49 = &v60;
  long long v50 = &v66;
  id v16 = v53;
  id v48 = v16;
  v17 = [(PLEnumerateAndSaveController *)v12 initWithName:v14 fetchRequest:v9 context:v16 pathManager:v15 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v52 didFetchObjectIDsBlock:v51 processResultBlock:v47];

  id v18 = (id *)(v61 + 5);
  id obj = (id)v61[5];
  LODWORD(v15) = [(PLEnumerateAndSaveController *)v17 processObjectsWithError:&obj];
  objc_storeStrong(v18, obj);
  if (v15)
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
      long long v74 = 0u;
      long long v75 = 0u;
      long long buf = 0u;
      long long v73 = 0u;
      id v23 = PLMigrationGetLog();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      uint64_t v24 = [(id)v55[5] totalUnitCount];
      int v70 = 134217984;
      uint64_t v71 = v24;
      LODWORD(v44) = 12;
      BOOL v25 = (long long *)_os_log_send_and_compose_impl();

      v26 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 759, 0);

      if (v25 == &buf) {
        goto LABEL_17;
      }
      v27 = v25;
LABEL_10:
      free(v27);
      goto LABEL_17;
    }
    v36 = PLMigrationGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [(id)v55[5] totalUnitCount];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Removed %lld PLGeneratedAssetDescription nodes.", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v67[3] = 3;
    v28 = PLMigrationGetLog();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

    if (!v29) {
      goto LABEL_17;
    }
    v30 = [(PLModelMigrationActionCore *)self logger];
    BOOL v31 = v30 == 0;

    if (!v31)
    {
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
      long long v74 = 0u;
      long long v75 = 0u;
      long long buf = 0u;
      long long v73 = 0u;
      v32 = PLMigrationGetLog();
      os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
      uint64_t v33 = v61[5];
      int v70 = 138412290;
      uint64_t v71 = v33;
      LODWORD(v44) = 12;
      v34 = (long long *)_os_log_send_and_compose_impl();

      int64_t v35 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActions_18000.m", 762, 16);

      if (v34 == &buf) {
        goto LABEL_17;
      }
      v27 = v34;
      goto LABEL_10;
    }
    v36 = PLMigrationGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = v61[5];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v38;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Failed to remove PLGeneratedAssetDescription nodes (%@)", (uint8_t *)&buf, 0xCu);
    }
  }

LABEL_17:
  v39 = (id *)(v61 + 5);
  if (v67[3] != 1)
  {
    id v41 = (id)v61[5];
    if (!a4) {
      goto LABEL_23;
    }
LABEL_22:
    id v41 = v41;
    *a4 = v41;
    goto LABEL_23;
  }
  id v45 = (id)v61[5];
  int64_t v40 = [(PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel *)self _deleteLabelWithCode1300InContext:v16 error:&v45];
  objc_storeStrong(v39, v45);
  v67[3] = v40;
  id v41 = (id)v61[5];
  if (v40 != 1 && a4) {
    goto LABEL_22;
  }
LABEL_23:

  [(PLModelMigrationActionCore *)self finalizeProgress];
  int64_t v42 = v67[3];

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  return v42;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end