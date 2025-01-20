@interface PLModelMigrationAction_moveLocalVersionTokenFromPlistToGlobalValues
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_moveLocalVersionTokenFromPlistToGlobalValues

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 persistentStoreCoordinator];
  v7 = [v6 persistentStores];
  v8 = [v7 firstObject];
  v9 = [v8 metadata];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F1BF90]];

  v11 = (void *)MEMORY[0x1E4F8B890];
  uint64_t v12 = *MEMORY[0x1E4F8BB00];
  v13 = [(PLModelMigrationActionCore *)self pathManager];
  v14 = [v11 readCPLPlistObjectWithKey:v12 pathManager:v13];

  if ([v10 isEqualToString:v14])
  {
    v15 = (void *)MEMORY[0x1E4F8B890];
    v16 = [(PLModelMigrationActionCore *)self pathManager];
    v17 = [v15 readCPLPlistObjectWithKey:@"localVersionToken" pathManager:v16];

    if (v17)
    {
      uint64_t v62 = MEMORY[0x1E4F143A8];
      v63 = v17;
      v18 = pl_result_with_autoreleasepool();
      v19 = PLMigrationGetLog();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (v20)
      {
        v21 = [(PLModelMigrationActionCore *)self logger];

        if (v21)
        {
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
          memset(buf, 0, sizeof(buf));
          v22 = PLMigrationGetLog();
          os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          int v64 = 138412290;
          v65 = v18;
          LODWORD(v61) = 12;
          v23 = (uint8_t *)_os_log_send_and_compose_impl();

          v24 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_18000.m", 278, 0);

          if (v23 != buf) {
            free(v23);
          }
        }
        else
        {
          v31 = PLMigrationGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v18;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Migrating plist based token: %@ to global values...", buf, 0xCu);
          }
        }
      }
      v32 = [[PLGlobalValues alloc] initWithManagedObjectContext:v5];
      [(PLGlobalValues *)v32 setCloudTrackerLastKnownToken:v18];
      [(PLGlobalValues *)v32 setLibraryScopeRulesTrackerLastKnownToken:v18];
      v33 = (void *)MEMORY[0x1E4F8B890];
      v34 = [(PLModelMigrationActionCore *)self pathManager];
      v35 = [v33 readCPLPlistObjectWithKey:@"cloudVersion" pathManager:v34];

      v36 = PLMigrationGetLog();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

      if (v37)
      {
        v38 = [(PLModelMigrationActionCore *)self logger];

        if (v38)
        {
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
          memset(buf, 0, sizeof(buf));
          v39 = PLMigrationGetLog();
          os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          int v64 = 138412290;
          v65 = v35;
          LODWORD(v61) = 12;
          v40 = (uint8_t *)_os_log_send_and_compose_impl();

          v41 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v41, "logWithMessage:fromCodeLocation:type:", v40, "PLModelMigrationActions_18000.m", 289, 0);

          if (v40 != buf) {
            free(v40);
          }
        }
        else
        {
          v42 = PLMigrationGetLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v35;
            _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEFAULT, "Migrating plist based cloud version: %@ to global values...", buf, 0xCu);
          }
        }
      }
      [(PLGlobalValues *)v32 setCloudTrackerLastKnownCloudVersion:v35];
    }
LABEL_24:

    goto LABEL_25;
  }
  v25 = PLMigrationGetLog();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

  if (!v26) {
    goto LABEL_25;
  }
  v27 = [(PLModelMigrationActionCore *)self logger];

  if (!v27)
  {
    v17 = PLMigrationGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Not migrating localVersionToken/lastCloudVersion into PLGlobalValues due to storeUUID mismatch (opened uuid: %{public}@, uuid from plist: %{public}@)", buf, 0x16u);
    }
    goto LABEL_24;
  }
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
  memset(buf, 0, sizeof(buf));
  v28 = PLMigrationGetLog();
  os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
  int v64 = 138543618;
  v65 = v10;
  __int16 v66 = 2114;
  v67 = v14;
  LODWORD(v61) = 22;
  v29 = (uint8_t *)_os_log_send_and_compose_impl();

  v30 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_18000.m", 295, 16);

  if (v29 != buf) {
    free(v29);
  }
LABEL_25:
  v43 = PLMigrationGetLog();
  BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);

  if (v44)
  {
    v45 = [(PLModelMigrationActionCore *)self logger];

    if (v45)
    {
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
      memset(buf, 0, sizeof(buf));
      v46 = PLMigrationGetLog();
      os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      LOWORD(v64) = 0;
      LODWORD(v61) = 2;
      v47 = (uint8_t *)_os_log_send_and_compose_impl();

      v48 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v48, "logWithMessage:fromCodeLocation:type:", v47, "PLModelMigrationActions_18000.m", 299, 0);

      if (v47 != buf) {
        free(v47);
      }
    }
    else
    {
      v49 = PLMigrationGetLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_DEFAULT, "Erasing existing localVersionToken from plist...", buf, 2u);
      }
    }
  }
  v50 = (void *)MEMORY[0x1E4F8B890];
  v51 = [(PLModelMigrationActionCore *)self pathManager];
  [v50 saveCPLPlistObject:0 forKey:@"localVersionToken" pathManager:v51];

  v52 = PLMigrationGetLog();
  LODWORD(v51) = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);

  if (v51)
  {
    v53 = [(PLModelMigrationActionCore *)self logger];

    if (v53)
    {
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
      memset(buf, 0, sizeof(buf));
      v54 = PLMigrationGetLog();
      os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
      LOWORD(v64) = 0;
      LODWORD(v61) = 2;
      v55 = (uint8_t *)_os_log_send_and_compose_impl();

      v56 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v56, "logWithMessage:fromCodeLocation:type:", v55, "PLModelMigrationActions_18000.m", 302, 0);

      if (v55 != buf) {
        free(v55);
      }
    }
    else
    {
      v57 = PLMigrationGetLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_DEFAULT, "Erasing existing cloudVersion from plist...", buf, 2u);
      }
    }
  }
  v58 = (void *)MEMORY[0x1E4F8B890];
  v59 = [(PLModelMigrationActionCore *)self pathManager];
  [v58 saveCPLPlistObject:0 forKey:@"cloudVersion" pathManager:v59];

  return 1;
}

@end