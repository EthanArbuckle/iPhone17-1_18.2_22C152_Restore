@interface PLModelMigrationAction_ResetRecentHighlightTitleUpdateDate
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetRecentHighlightTitleUpdateDate

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v5 = +[PLPhotosHighlightGenerator lastHighlightTitlesUpdateDay];
  v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  +[PLPhotosHighlightGenerator setLastHighlightTitlesUpdateDay:v6];
  v7 = PLMigrationGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    v9 = [(PLModelMigrationActionCore *)self logger];

    if (v9)
    {
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
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      memset(buf, 0, sizeof(buf));
      v10 = PLMigrationGetLog();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      int v16 = 138412546;
      v17 = v5;
      __int16 v18 = 2112;
      v19 = v6;
      LODWORD(v15) = 22;
      v11 = (uint8_t *)_os_log_send_and_compose_impl();

      v12 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v12, "logWithMessage:fromCodeLocation:type:", v11, "PLModelMigrationActions_16000.m", 1192, 0);

      if (v11 != buf) {
        free(v11);
      }
    }
    else
    {
      v13 = PLMigrationGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Reset Recent Highlight Title Update Date from %@ to %@", buf, 0x16u);
      }
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];

  return 1;
}

@end