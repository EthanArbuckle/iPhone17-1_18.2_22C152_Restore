@interface PLModelMigrationAction_RepairMaintenanceTaskMarker
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RepairMaintenanceTaskMarker

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F8B858];
  v6 = [(PLModelMigrationActionCore *)self pathManager];
  uint64_t v7 = [v6 libraryURL];
  v8 = [v5 appPrivateDataForLibraryURL:v7];

  v9 = [v8 valueForKey:@"PLDeferredMaintenanceTask"];
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if ((v7 & 1) == 0)
  {
    id v39 = 0;
    int v10 = [v8 setValue:0 forKey:@"PLDeferredMaintenanceTask" error:&v39];
    id v11 = v39;
    v12 = PLMigrationGetLog();
    v13 = v12;
    if (v10)
    {
      BOOL v14 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

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
          os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          v17 = (objc_class *)objc_opt_class();
          v18 = NSStringFromClass(v17);
          int v40 = 138543874;
          v41 = @"PLDeferredMaintenanceTask";
          __int16 v42 = 2114;
          v43 = v18;
          __int16 v44 = 2112;
          id v45 = v11;
          LODWORD(v38) = 32;
          v19 = (uint8_t *)_os_log_send_and_compose_impl();

          v20 = [(PLModelMigrationActionCore *)self logger];
          v21 = v20;
          v22 = v19;
          uint64_t v23 = 266;
          uint64_t v24 = 0;
          goto LABEL_9;
        }
        v30 = PLMigrationGetLog();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = @"PLDeferredMaintenanceTask";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v32;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v11;
        v33 = "Repaired the %{public}@ marker for %{public}@. Error: %@";
        v34 = v30;
        os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
        _os_log_impl(&dword_19B3C7000, v34, v35, v33, buf, 0x20u);

LABEL_16:
      }
    }
    else
    {
      BOOL v25 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (v25)
      {
        v26 = [(PLModelMigrationActionCore *)self logger];

        if (v26)
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
          v27 = PLMigrationGetLog();
          os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          v28 = (objc_class *)objc_opt_class();
          v29 = NSStringFromClass(v28);
          int v40 = 138543874;
          v41 = @"PLDeferredMaintenanceTask";
          __int16 v42 = 2114;
          v43 = v29;
          __int16 v44 = 2112;
          id v45 = v11;
          LODWORD(v38) = 32;
          v19 = (uint8_t *)_os_log_send_and_compose_impl();

          v20 = [(PLModelMigrationActionCore *)self logger];
          v21 = v20;
          v22 = v19;
          uint64_t v23 = 268;
          uint64_t v24 = 16;
LABEL_9:
          objc_msgSend(v20, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_16000.m", v23, v24);

          if (v19 != buf) {
            free(v19);
          }
          goto LABEL_17;
        }
        v30 = PLMigrationGetLog();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        v36 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v36);
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = @"PLDeferredMaintenanceTask";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v32;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v11;
        v33 = "Failed to remove the %{public}@ marker for %{public}@. Error: %@";
        v34 = v30;
        os_log_type_t v35 = OS_LOG_TYPE_ERROR;
        goto LABEL_15;
      }
    }
LABEL_17:
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];

  return 1;
}

@end