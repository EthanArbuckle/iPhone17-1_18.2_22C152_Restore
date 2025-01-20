@interface PLModelMigrationAction_ResetCurationScoreSyndicatedAsset
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetCurationScoreSyndicatedAsset

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v70[1] = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4F1C038];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = +[PLManagedAsset entity];
  v10 = (void *)[v8 initWithEntity:v9];

  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0.0", @"curationScore");
  [v10 setPredicate:v11];
  [v10 setResultType:2];
  v69 = @"curationScore";
  v70[0] = &unk_1EEBF26E0;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
  [v10 setPropertiesToUpdate:v12];

  id v33 = 0;
  v13 = [v7 executeRequest:v10 error:&v33];

  id v14 = v33;
  if (v13)
  {
    v15 = PLSyndicationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = [v13 result];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "%{public}@.: Successfully batch reset curationScore for %@ assets", buf, 0x16u);
    }
    int64_t v19 = 1;
    if (a4) {
LABEL_5:
    }
      *a4 = v14;
  }
  else
  {
    v21 = PLMigrationGetLog();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
    {
      v23 = [(PLModelMigrationActionCore *)self logger];

      if (v23)
      {
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
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        memset(buf, 0, sizeof(buf));
        v24 = PLMigrationGetLog();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        int v34 = 138543618;
        v35 = v26;
        __int16 v36 = 2112;
        id v37 = v14;
        LODWORD(v32) = 22;
        v27 = (uint8_t *)_os_log_send_and_compose_impl();

        v28 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_15000.m", 678, 16);

        if (v27 != buf) {
          free(v27);
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
          *(void *)&buf[14] = v14;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Failed to batch reset savedAssetType for assets: %@", buf, 0x16u);
        }
      }
    }
    int64_t v19 = 3;
    if (a4) {
      goto LABEL_5;
    }
  }

  return v19;
}

@end