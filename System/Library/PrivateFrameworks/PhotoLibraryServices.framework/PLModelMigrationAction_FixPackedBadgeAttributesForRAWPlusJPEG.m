@interface PLModelMigrationAction_FixPackedBadgeAttributesForRAWPlusJPEG
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixPackedBadgeAttributesForRAWPlusJPEG

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v103[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLInternalResource entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"utiConformanceHint", 2);
  v103[0] = v11;
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"dataStoreClassID", 0);
  v103[1] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"dataStoreSubtype", 17);
  v103[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:3];
  v15 = [v10 andPredicateWithSubpredicates:v14];
  [v9 setPredicate:v15];

  v102[0] = @"asset";
  v102[1] = @"asset.additionalAttributes";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
  [v9 setRelationshipKeyPathsForPrefetching:v16];

  id v66 = 0;
  v17 = [v6 executeFetchRequest:v9 error:&v66];
  id v18 = v66;
  v19 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v17 count], 0);
  v20 = v19;
  if (v17)
  {
    v62 = a4;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __109__PLModelMigrationAction_FixPackedBadgeAttributesForRAWPlusJPEG_performActionWithManagedObjectContext_error___block_invoke;
    v64[3] = &unk_1E586B2C8;
    id v21 = v19;
    id v65 = v21;
    v22 = [v6 enumerateWithIncrementalSaveUsingObjects:v17 withBlock:v64];
    v23 = v22;
    if (!v22 || v18)
    {
      v41 = PLMigrationGetLog();
      BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);

      if (v42)
      {
        v43 = [(PLModelMigrationActionCore *)self logger];

        if (v43)
        {
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
          long long v72 = 0u;
          long long v73 = 0u;
          memset(buf, 0, sizeof(buf));
          v44 = PLMigrationGetLog();
          os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
          v45 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v45);
          uint64_t v47 = [v21 completedUnitCount];
          int v67 = 138543618;
          v68 = v46;
          __int16 v69 = 2048;
          uint64_t v70 = v47;
          LODWORD(v61) = 22;
          v48 = (uint8_t *)_os_log_send_and_compose_impl();

          v49 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v49, "logWithMessage:fromCodeLocation:type:", v48, "PLModelMigrationActions_15000.m", 813, 0);

          if (v48 != buf) {
            free(v48);
          }
        }
        else
        {
          v53 = PLMigrationGetLog();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = (objc_class *)objc_opt_class();
            v55 = NSStringFromClass(v54);
            uint64_t v56 = [v21 completedUnitCount];
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v55;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v56;
            _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Added RAW packed badge attributes to %llu assets", buf, 0x16u);
          }
        }
      }
      int64_t v40 = 1;
    }
    else
    {
      id v18 = v22;
      v24 = PLMigrationGetLog();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (v25)
      {
        v26 = [(PLModelMigrationActionCore *)self logger];

        if (v26)
        {
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
          long long v72 = 0u;
          long long v73 = 0u;
          memset(buf, 0, sizeof(buf));
          v27 = PLMigrationGetLog();
          os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          v28 = (objc_class *)objc_opt_class();
          v29 = NSStringFromClass(v28);
          int v67 = 138543618;
          v68 = v29;
          __int16 v69 = 2114;
          uint64_t v70 = (uint64_t)v18;
          LODWORD(v61) = 22;
          v30 = (uint8_t *)_os_log_send_and_compose_impl();

          v31 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActions_15000.m", 811, 16);

          if (v30 != buf) {
            free(v30);
          }
        }
        else
        {
          v57 = PLMigrationGetLog();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v58 = (objc_class *)objc_opt_class();
            v59 = NSStringFromClass(v58);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v59;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v18;
            _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %{public}@", buf, 0x16u);
          }
        }
      }
      int64_t v40 = 3;
    }
    a4 = v62;

    goto LABEL_30;
  }
  v32 = PLMigrationGetLog();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

  if (!v33)
  {
LABEL_20:
    int64_t v40 = 3;
    goto LABEL_30;
  }
  v34 = [(PLModelMigrationActionCore *)self logger];

  if (!v34)
  {
    v50 = PLMigrationGetLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v52;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
    }
    goto LABEL_20;
  }
  v63 = a4;
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
  long long v72 = 0u;
  long long v73 = 0u;
  memset(buf, 0, sizeof(buf));
  v35 = PLMigrationGetLog();
  os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
  v36 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v36);
  int v67 = 138543618;
  v68 = v37;
  __int16 v69 = 2114;
  uint64_t v70 = (uint64_t)v18;
  LODWORD(v61) = 22;
  v38 = (uint8_t *)_os_log_send_and_compose_impl();

  v39 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActions_15000.m", 817, 16);

  if (v38 != buf) {
    free(v38);
  }
  int64_t v40 = 3;
  a4 = v63;
LABEL_30:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v18;
  }

  return v40;
}

@end