@interface PLModelMigrationAction_RunSocialGroupAssetContainment
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RunSocialGroupAssetContainment

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:1];
  +[PLGraphLabel ensureLabelsAreUpdatedInContext:v6];
  [v7 becomeCurrentWithPendingUnitCount:1];
  id v41 = 0;
  BOOL v8 = +[PLSocialGroup runAssetContainmentOnAllSocialGroupsInContext:v6 error:&v41];
  id v9 = v41;
  v10 = v9;
  if (!v8)
  {
    v13 = PLMigrationGetLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      v15 = [(PLModelMigrationActionCore *)self logger];

      if (v15)
      {
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
        memset(buf, 0, sizeof(buf));
        v16 = PLMigrationGetLog();
        os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        int v42 = 138543618;
        v43 = v18;
        __int16 v44 = 2112;
        id v45 = v10;
        LODWORD(v39) = 22;
        v19 = (uint8_t *)_os_log_send_and_compose_impl();

        v20 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v20, "logWithMessage:fromCodeLocation:type:", v19, "PLModelMigrationActions_18000.m", 1042, 16);

        if (v19 != buf) {
          free(v19);
        }
      }
      else
      {
        v29 = PLMigrationGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v31;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v10;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Failed to run asset containment on all social groups for %{public}@. Error: %@", buf, 0x16u);
        }
      }
    }
    goto LABEL_15;
  }
  id v40 = v9;
  char v11 = [v6 save:&v40];
  id v12 = v40;

  if (v11)
  {
    v10 = v12;
LABEL_15:
    [v7 resignCurrent];
    id v32 = v10;
    int64_t v33 = 1;
    goto LABEL_22;
  }
  v21 = PLMigrationGetLog();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

  if (v22)
  {
    v23 = [(PLModelMigrationActionCore *)self logger];

    if (v23)
    {
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
      memset(buf, 0, sizeof(buf));
      v24 = PLMigrationGetLog();
      os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      int v42 = 138543618;
      v43 = v26;
      __int16 v44 = 2112;
      id v45 = v12;
      LODWORD(v39) = 22;
      v27 = (uint8_t *)_os_log_send_and_compose_impl();

      v28 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_18000.m", 1044, 16);

      if (v27 != buf) {
        free(v27);
      }
    }
    else
    {
      v34 = PLMigrationGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %@", buf, 0x16u);
      }
    }
  }
  [v7 resignCurrent];
  id v37 = v12;
  id v32 = v37;
  if (a4)
  {
    id v32 = v37;
    *a4 = v32;
  }
  int64_t v33 = 3;
LABEL_22:

  [(PLModelMigrationActionCore *)self finalizeProgress];
  return v33;
}

+ (int64_t)actionProgressWeight
{
  return 300;
}

@end