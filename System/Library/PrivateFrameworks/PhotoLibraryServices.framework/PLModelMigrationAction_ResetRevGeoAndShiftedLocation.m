@interface PLModelMigrationAction_ResetRevGeoAndShiftedLocation
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetRevGeoAndShiftedLocation

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v71[2] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  v8 = objc_msgSend(v6, "predicateWithFormat:", @"%K != nil", @"shiftedLocationData");
  v70[0] = @"reverseLocationDataIsValid";
  v70[1] = @"shiftedLocationIsValid";
  v71[0] = MEMORY[0x1E4F1CC28];
  v71[1] = MEMORY[0x1E4F1CC28];
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
  v10 = +[PLAdditionalAssetAttributes entityName];
  id v34 = 0;
  BOOL v11 = +[PLModelMigrator executeBatchUpdateWithEntityName:v10 predicate:v8 propertiesToUpdate:v9 managedObjectContext:v7 error:&v34];

  id v12 = v34;
  if (v11)
  {
    v13 = PLMigrationGetLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      v15 = [(PLModelMigrationActionCore *)self logger];

      if (v15)
      {
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
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        memset(buf, 0, sizeof(buf));
        v16 = PLMigrationGetLog();
        os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        LOWORD(v35) = 0;
        LODWORD(v33) = 2;
        v17 = (uint8_t *)_os_log_send_and_compose_impl();

        v18 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v18, "logWithMessage:fromCodeLocation:type:", v17, "PLModelMigrationActions_16000.m", 1105, 0);

        if (v17 != buf) {
          free(v17);
        }
      }
      else
      {
        v27 = PLMigrationGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Reset rev geo and shifted location state on assets with non-nil shifted locations", buf, 2u);
        }
      }
    }
    int64_t v28 = 1;
  }
  else
  {
    if (a4) {
      *a4 = v12;
    }
    v19 = PLMigrationGetLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (v20)
    {
      v21 = [(PLModelMigrationActionCore *)self logger];

      if (v21)
      {
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
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        memset(buf, 0, sizeof(buf));
        v22 = PLMigrationGetLog();
        os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        int v35 = 138543618;
        v36 = v24;
        __int16 v37 = 2114;
        id v38 = v12;
        LODWORD(v33) = 22;
        v25 = (uint8_t *)_os_log_send_and_compose_impl();

        v26 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_16000.m", 1109, 16);

        if (v25 != buf) {
          free(v25);
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
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v12;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Failed to reset geo and shifted location state on assets with non-nil shifted locations for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    int64_t v28 = 3;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];

  return v28;
}

@end