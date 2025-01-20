@interface PLModelMigrationAction_PopulateCloudFeedEntryIsMine
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
- (void)_migrateEntriesWithFetchRequest:(id)a3 moc:(id)a4 progress:(id)a5 result:(int64_t *)a6;
@end

@implementation PLModelMigrationAction_PopulateCloudFeedEntryIsMine

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v39 = 1;
  v7 = +[PLCloudFeedEntry fetchRequest];
  [v7 setIncludesSubentities:1];
  id v38 = 0;
  uint64_t v8 = [v6 countForFetchRequest:v7 error:&v38];
  id v9 = v38;
  v10 = PLMigrationGetLog();
  v11 = v10;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      v13 = [(PLModelMigrationActionCore *)self logger];

      if (v13)
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
        v14 = PLMigrationGetLog();
        os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        int v42 = 138543362;
        v43 = 0;
        LODWORD(v37) = 12;
        v15 = (uint8_t *)_os_log_send_and_compose_impl();

        v16 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigrationActions_18000.m", 1089, 16);

        if (v15 != buf) {
          free(v15);
        }
      }
      else
      {
        v24 = PLMigrationGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = 0;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Failed to fetch count of CloudFeedEntry with error: %{public}@", buf, 0xCu);
        }
      }
    }
    int64_t v25 = 3;
  }
  else
  {
    BOOL v17 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      v18 = [(PLModelMigrationActionCore *)self logger];

      if (v18)
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
        v19 = PLMigrationGetLog();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        int v42 = 138543618;
        v43 = v21;
        __int16 v44 = 2048;
        uint64_t v45 = v8;
        LODWORD(v37) = 22;
        v22 = (uint8_t *)_os_log_send_and_compose_impl();

        v23 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_18000.m", 1093, 0);

        if (v22 != buf) {
          free(v22);
        }
      }
      else
      {
        v26 = PLMigrationGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = (objc_class *)objc_opt_class();
          v28 = NSStringFromClass(v27);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v8;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ starting to migrate %lu feed entries...", buf, 0x16u);
        }
      }
    }
    v29 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:v8 pendingParentUnitCount:0];
    v30 = +[PLCloudFeedAssetsEntry fetchRequest];
    v41 = @"entryAssets";
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    [v30 setRelationshipKeyPathsForPrefetching:v31];

    [(PLModelMigrationAction_PopulateCloudFeedEntryIsMine *)self _migrateEntriesWithFetchRequest:v30 moc:v6 progress:v29 result:&v39];
    if (v39 != 1) {
      goto LABEL_20;
    }
    v32 = +[PLCloudFeedCommentsEntry fetchRequest];
    v40[0] = @"entryComments";
    v40[1] = @"entryLikeComments";
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    [v32 setRelationshipKeyPathsForPrefetching:v33];

    [(PLModelMigrationAction_PopulateCloudFeedEntryIsMine *)self _migrateEntriesWithFetchRequest:v32 moc:v6 progress:v29 result:&v39];
    if (v39 != 1) {
      goto LABEL_20;
    }
    v34 = +[PLCloudFeedEntry fetchRequest];
    [v34 setIncludesSubentities:0];
    v35 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"entryTypeNumber != %d AND entryTypeNumber != %d", 1, 2);
    [v34 setPredicate:v35];

    [(PLModelMigrationAction_PopulateCloudFeedEntryIsMine *)self _migrateEntriesWithFetchRequest:v34 moc:v6 progress:v29 result:&v39];
    if (v39 != 1)
    {
LABEL_20:
      if (a4) {
        *a4 = 0;
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    int64_t v25 = v39;
  }
  return v25;
}

- (void)_migrateEntriesWithFetchRequest:(id)a3 moc:(id)a4 progress:(id)a5 result:(int64_t *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  v13 = [PLEnumerateAndSaveController alloc];
  v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  v16 = [(PLModelMigrationActionCore *)self pathManager];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __107__PLModelMigrationAction_PopulateCloudFeedEntryIsMine__migrateEntriesWithFetchRequest_moc_progress_result___block_invoke;
  v36[3] = &unk_1E586FB88;
  id v17 = v10;
  id v37 = v17;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __107__PLModelMigrationAction_PopulateCloudFeedEntryIsMine__migrateEntriesWithFetchRequest_moc_progress_result___block_invoke_2;
  v34[3] = &unk_1E586A0A8;
  id v18 = v11;
  id v35 = v18;
  v19 = [(PLEnumerateAndSaveController *)v13 initWithName:v15 fetchRequest:v12 context:v17 pathManager:v16 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v36 didFetchObjectIDsBlock:0 processResultBlock:v34];

  id v33 = 0;
  LOBYTE(v15) = [(PLEnumerateAndSaveController *)v19 processObjectsWithError:&v33];
  id v20 = v33;
  if ((v15 & 1) == 0)
  {
    *a6 = 3;
    v21 = PLMigrationGetLog();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
    {
      v23 = [(PLModelMigrationActionCore *)self logger];

      if (v23)
      {
        memset(buf, 0, sizeof(buf));
        v24 = PLMigrationGetLog();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        int64_t v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        int v38 = 138543618;
        uint64_t v39 = v26;
        __int16 v40 = 2112;
        id v41 = v20;
        LODWORD(v32) = 22;
        v27 = (_OWORD *)_os_log_send_and_compose_impl();

        v28 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_18000.m", 1072, 16);

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
          LODWORD(buf[0]) = 138543618;
          *(void *)((char *)buf + 4) = v31;
          WORD6(buf[0]) = 2112;
          *(void *)((char *)buf + 14) = v20;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", (uint8_t *)buf, 0x16u);
        }
      }
    }
  }
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end