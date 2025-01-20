@interface PLModelMigrationAction_UpdateHighlightCollageAssets
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_UpdateHighlightCollageAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v94[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  v7 = +[PLPhotosHighlight entityName];
  v8 = [v6 fetchRequestWithEntityName:v7];

  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 0);
  [v8 setPredicate:v9];

  v94[0] = @"collageAssetsPrivate";
  v94[1] = @"collageAssetsShared";
  v94[2] = @"collageAssetsMixed";
  v94[3] = @"extendedAssets";
  v94[4] = @"keyAssetPrivate";
  v94[5] = @"keyAssetShared";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:6];
  [v8 setRelationshipKeyPathsForPrefetching:v10];

  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__43798;
  v57 = __Block_byref_object_dispose__43799;
  id v58 = 0;
  v13 = [PLEnumerateAndSaveController alloc];
  v14 = [(PLModelMigrationActionCore *)self pathManager];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke;
  v51[3] = &unk_1E586FB88;
  id v15 = v5;
  id v52 = v15;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke_2;
  v50[3] = &unk_1E5870290;
  v50[4] = self;
  v50[5] = &v53;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke_3;
  v49[3] = &unk_1E586A170;
  v49[4] = &v53;
  v16 = [(PLEnumerateAndSaveController *)v13 initWithName:v12 fetchRequest:v8 context:v15 pathManager:v14 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v51 didFetchObjectIDsBlock:v50 processResultBlock:v49];

  id v48 = 0;
  BOOL v17 = [(PLEnumerateAndSaveController *)v16 processObjectsWithError:&v48];
  id v46 = v48;
  if (v17)
  {
    v18 = PLMigrationGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

    if (v19)
    {
      v20 = [(PLModelMigrationActionCore *)self logger];
      BOOL v21 = v20 == 0;

      if (v21)
      {
        v35 = PLMigrationGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          uint64_t v36 = [(id)v54[5] completedUnitCount];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v36;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_INFO, "Updated collage assets for %lu highlights", buf, 0xCu);
        }
      }
      else
      {
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
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        memset(buf, 0, sizeof(buf));
        v22 = PLMigrationGetLog();
        os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
        uint64_t v23 = [(id)v54[5] completedUnitCount];
        int v59 = 134217984;
        uint64_t v60 = v23;
        LODWORD(v45) = 12;
        v24 = (uint8_t *)_os_log_send_and_compose_impl();

        v25 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_18000.m", 1456, 1);

        if (v24 != buf) {
          free(v24);
        }
      }
    }
    int64_t v37 = 1;
  }
  else
  {
    v26 = PLMigrationGetLog();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

    if (v27)
    {
      v28 = [(PLModelMigrationActionCore *)self logger];
      BOOL v29 = v28 == 0;

      if (v29)
      {
        v38 = PLMigrationGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = (objc_class *)objc_opt_class();
          v40 = NSStringFromClass(v39);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v46;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
        }
      }
      else
      {
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
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        memset(buf, 0, sizeof(buf));
        v30 = PLMigrationGetLog();
        os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        int v59 = 138543618;
        uint64_t v60 = (uint64_t)v32;
        __int16 v61 = 2112;
        id v62 = v46;
        LODWORD(v45) = 22;
        v33 = (uint8_t *)_os_log_send_and_compose_impl();

        v34 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigrationActions_18000.m", 1459, 16);

        if (v33 != buf) {
          free(v33);
        }
      }
    }
    int64_t v37 = 3;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v41 = v46;
  v42 = v41;
  if (a4) {
    char v43 = v17;
  }
  else {
    char v43 = 1;
  }
  if ((v43 & 1) == 0) {
    *a4 = v41;
  }

  _Block_object_dispose(&v53, 8);
  return v37;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end