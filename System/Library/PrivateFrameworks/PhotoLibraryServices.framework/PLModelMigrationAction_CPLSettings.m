@interface PLModelMigrationAction_CPLSettings
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_CPLSettings

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v5 = [(PLModelMigrationActionCore *)self pathManager];
  v6 = +[PLCPLSettings settingsWithPathManager:v5];

  id v22 = 0;
  char v7 = [v6 migrateSettings:&v22];
  id v8 = v22;
  if ((v7 & 1) == 0)
  {
    v9 = PLMigrationGetLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      v11 = [(PLModelMigrationActionCore *)self logger];

      if (v11)
      {
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
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        memset(buf, 0, sizeof(buf));
        v12 = PLMigrationGetLog();
        os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        int v23 = 138543618;
        v24 = v14;
        __int16 v25 = 2112;
        id v26 = v8;
        LODWORD(v21) = 22;
        v15 = (uint8_t *)_os_log_send_and_compose_impl();

        v16 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigrationActions_18000.m", 247, 16);

        if (v15 != buf) {
          free(v15);
        }
      }
      else
      {
        v17 = PLMigrationGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (objc_class *)objc_opt_class();
          v19 = NSStringFromClass(v18);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
        }
      }
    }
  }

  return 1;
}

@end