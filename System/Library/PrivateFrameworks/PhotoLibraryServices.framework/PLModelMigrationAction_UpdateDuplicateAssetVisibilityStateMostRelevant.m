@interface PLModelMigrationAction_UpdateDuplicateAssetVisibilityStateMostRelevant
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
- (int64_t)updateKeyAssetVisibilityStateWithManagedObjectContext:(id)a3 error:(id *)a4;
- (int64_t)updateLegacyHiddenValueWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_UpdateDuplicateAssetVisibilityStateMostRelevant

- (int64_t)updateKeyAssetVisibilityStateWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 1;
  uint64_t v50 = 0;
  v51 = (id *)&v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__23954;
  v54 = __Block_byref_object_dispose__23955;
  id v55 = 0;
  [v6 refreshAllObjects];
  v7 = +[PLDuplicateAlbum fetchRequest];
  v95[0] = @"assets";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:1];
  [v7 setRelationshipKeyPathsForPrefetching:v8];

  [v7 setIncludesPendingChanges:1];
  [v7 setFetchBatchSize:100];
  v9 = v51 + 5;
  id obj = v51[5];
  v10 = [v6 executeFetchRequest:v7 error:&obj];
  objc_storeStrong(v9, obj);
  if ([v10 count])
  {
    v11 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v10 count], 0);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __134__PLModelMigrationAction_UpdateDuplicateAssetVisibilityStateMostRelevant_updateKeyAssetVisibilityStateWithManagedObjectContext_error___block_invoke;
    v45[3] = &unk_1E58673E8;
    v45[4] = self;
    v47 = &v50;
    v48 = &v56;
    id v12 = v11;
    id v46 = v12;
    v13 = [v6 enumerateWithIncrementalSaveUsingObjects:v10 withBlock:v45];
    if (v13 && !v51[5])
    {
      objc_storeStrong(v51 + 5, v13);
      v57[3] = 3;
    }
    if (v57[3] == 1)
    {
      v14 = PLMigrationGetLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (v15)
      {
        v16 = [(PLModelMigrationActionCore *)self logger];
        BOOL v17 = v16 == 0;

        if (v17)
        {
          v32 = PLMigrationGetLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = [v10 count];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v33;
            _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Updated duplicate visibility state on key asset for %d duplicate albums", buf, 8u);
          }

          goto LABEL_22;
        }
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
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        memset(buf, 0, sizeof(buf));
        v18 = PLMigrationGetLog();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        int v19 = [v10 count];
        int v60 = 67109120;
        LODWORD(v61) = v19;
        LODWORD(v43) = 8;
        v20 = (uint8_t *)_os_log_send_and_compose_impl();

        v21 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_16000.m", 578, 0);

        goto LABEL_14;
      }
    }
    else
    {
      v23 = PLMigrationGetLog();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
        v25 = [(PLModelMigrationActionCore *)self logger];
        BOOL v26 = v25 == 0;

        if (v26)
        {
          v34 = PLMigrationGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v35 = (objc_class *)objc_opt_class();
            v36 = NSStringFromClass(v35);
            id v37 = v51[5];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v37;
            _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to save managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
          }
          goto LABEL_22;
        }
        v44 = a4;
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
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        memset(buf, 0, sizeof(buf));
        v27 = PLMigrationGetLog();
        os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        id v30 = v51[5];
        int v60 = 138543618;
        v61 = v29;
        __int16 v62 = 2114;
        id v63 = v30;
        LODWORD(v43) = 22;
        v20 = (uint8_t *)_os_log_send_and_compose_impl();

        a4 = v44;
        v31 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_16000.m", 580, 16);

LABEL_14:
        if (v20 != buf) {
          free(v20);
        }
      }
    }
LABEL_22:

    v22 = v57;
    goto LABEL_23;
  }
  v22 = v57;
  if (!v10) {
    v57[3] = 3;
  }
LABEL_23:
  uint64_t v38 = v22[3];
  id v39 = v51[5];
  v40 = v39;
  if (v38 != 1 && a4) {
    *a4 = v39;
  }

  int64_t v41 = v57[3];
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  return v41;
}

- (int64_t)updateLegacyHiddenValueWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = a3;
  v9 = objc_msgSend(v7, "predicateWithFormat:", @"%K == %d", @"duplicateAssetVisibilityState", 2);
  v69[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
  v11 = [v6 andPredicateWithSubpredicates:v10];

  long long v67 = @"duplicateAssetVisibilityState";
  long long v68 = &unk_1EEBEE190;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  v13 = +[PLManagedAsset entityName];
  id v31 = 0;
  LOBYTE(v10) = +[PLModelMigrator executeBatchUpdateWithEntityName:v13 predicate:v11 propertiesToUpdate:v12 managedObjectContext:v8 error:&v31];

  id v14 = v31;
  if (v10)
  {
    id v15 = v14;
    int64_t v16 = 1;
  }
  else
  {
    BOOL v17 = PLMigrationGetLog();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (v18)
    {
      int v19 = [(PLModelMigrationActionCore *)self logger];

      if (v19)
      {
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        memset(buf, 0, sizeof(buf));
        v20 = PLMigrationGetLog();
        os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        int v32 = 138543618;
        int v33 = v22;
        __int16 v34 = 2114;
        id v35 = v14;
        LODWORD(v30) = 22;
        v23 = (uint8_t *)_os_log_send_and_compose_impl();

        BOOL v24 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_16000.m", 540, 16);

        if (v23 != buf) {
          free(v23);
        }
      }
      else
      {
        v25 = PLMigrationGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          BOOL v26 = (objc_class *)objc_opt_class();
          v27 = NSStringFromClass(v26);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v14;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Failed to execute batch update request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    id v28 = v14;
    if (a4) {
      *a4 = v28;
    }
    int64_t v16 = 3;
  }

  return v16;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(PLModelMigrationAction_UpdateDuplicateAssetVisibilityStateMostRelevant *)self updateLegacyHiddenValueWithManagedObjectContext:v6 error:a4];
  if (v7 == 1) {
    int64_t v7 = [(PLModelMigrationAction_UpdateDuplicateAssetVisibilityStateMostRelevant *)self updateKeyAssetVisibilityStateWithManagedObjectContext:v6 error:a4];
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];

  return v7;
}

@end