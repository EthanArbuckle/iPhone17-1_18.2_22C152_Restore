@interface PLModelMigrationAction_PopulateInitialSharedAssetCollectionStats
- (int64_t)_recalculateSharedAssetContainerValuesForEntityNamed:(id)a3 propertiesToFetch:(id)a4 inContext:(id)a5 error:(id *)a6;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_PopulateInitialSharedAssetCollectionStats

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v88[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PLModelMigrationActionCore *)self cancellableDiscreteProgressWithTotalUnitCount:3 pendingParentUnitCount:0];
  v7 = (void *)MEMORY[0x19F38D3B0]();
  v8 = +[PLMoment entityName];
  v88[0] = @"sharingComposition";
  v88[1] = @"cachedCount";
  v88[2] = @"cachedCountShared";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:3];
  id v51 = 0;
  int64_t v10 = [(PLModelMigrationAction_PopulateInitialSharedAssetCollectionStats *)self _recalculateSharedAssetContainerValuesForEntityNamed:v8 propertiesToFetch:v9 inContext:v5 error:&v51];
  id v11 = v51;

  uint64_t v12 = objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "completedUnitCount") + 1);
  if (!v11)
  {
    v13 = (void *)MEMORY[0x19F38D3B0](v12);
    v14 = +[PLPhotosHighlight entityName];
    v87[0] = @"sharingComposition";
    v87[1] = @"assetsCount";
    v87[2] = @"assetsCountShared";
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
    id v50 = 0;
    int64_t v10 = [(PLModelMigrationAction_PopulateInitialSharedAssetCollectionStats *)self _recalculateSharedAssetContainerValuesForEntityNamed:v14 propertiesToFetch:v15 inContext:v5 error:&v50];
    id v11 = v50;
  }
  uint64_t v16 = objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "completedUnitCount") + 1);
  if (!v11)
  {
    v17 = (void *)MEMORY[0x19F38D3B0](v16);
    id v49 = 0;
    BOOL v18 = +[PLBackgroundJobSharedAssetContainerUpdateWorker performWorkOnAllItemsInContext:v5 withError:&v49];
    id v19 = v49;
    if (v18)
    {
      if ([v5 hasChanges])
      {
        id v48 = v19;
        char v20 = [v5 save:&v48];
        id v11 = v48;

        if ((v20 & 1) == 0)
        {
          v21 = PLMigrationGetLog();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

          if (v22)
          {
            v23 = [(PLModelMigrationActionCore *)self logger];

            if (v23)
            {
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
              memset(buf, 0, sizeof(buf));
              v24 = PLMigrationGetLog();
              os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
              v25 = (objc_class *)objc_opt_class();
              v26 = NSStringFromClass(v25);
              int v52 = 138543618;
              v53 = v26;
              __int16 v54 = 2112;
              id v55 = v11;
              LODWORD(v46) = 22;
              v27 = (uint8_t *)_os_log_send_and_compose_impl();

              v28 = [(PLModelMigrationActionCore *)self logger];
              objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_16000.m", 227, 16);

              if (v27 != buf) {
                free(v27);
              }
            }
            else
            {
              v43 = PLMigrationGetLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v44 = (objc_class *)objc_opt_class();
                v45 = NSStringFromClass(v44);
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v45;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v11;
                _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save shared asset container updates with error: %@", buf, 0x16u);
              }
            }
          }
          int64_t v10 = 3;
        }
        goto LABEL_20;
      }
    }
    else
    {
      v29 = PLMigrationGetLog();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

      if (v30)
      {
        v31 = [(PLModelMigrationActionCore *)self logger];

        if (v31)
        {
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
          memset(buf, 0, sizeof(buf));
          v32 = PLMigrationGetLog();
          os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
          v33 = (objc_class *)objc_opt_class();
          v34 = NSStringFromClass(v33);
          int v52 = 138543618;
          v53 = v34;
          __int16 v54 = 2112;
          id v55 = v19;
          LODWORD(v46) = 22;
          v35 = (uint8_t *)_os_log_send_and_compose_impl();

          v36 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v36, "logWithMessage:fromCodeLocation:type:", v35, "PLModelMigrationActions_16000.m", 232, 16);

          if (v35 != buf) {
            free(v35);
          }
        }
        else
        {
          v37 = PLMigrationGetLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = (objc_class *)objc_opt_class();
            v39 = NSStringFromClass(v38);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v39;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v19;
            _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save shared asset container updates with error: %@", buf, 0x16u);
          }
        }
      }
      int64_t v10 = 3;
    }
    id v11 = v19;
LABEL_20:
  }
  objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "completedUnitCount") + 1);
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v40 = v11;
  v41 = v40;
  if (v10 != 1 && a4) {
    *a4 = v40;
  }

  return v10;
}

- (int64_t)_recalculateSharedAssetContainerValuesForEntityNamed:(id)a3 propertiesToFetch:(id)a4 inContext:(id)a5 error:(id *)a6
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v76 = [MEMORY[0x1E4F28B00] currentHandler];
    [v76 handleFailureInMethod:a2, self, @"PLModelMigrationActions_16000.m", 135, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

    if (v11)
    {
LABEL_3:
      if (v12) {
        goto LABEL_4;
      }
LABEL_50:
      long long v78 = [MEMORY[0x1E4F28B00] currentHandler];
      [v78 handleFailureInMethod:a2, self, @"PLModelMigrationActions_16000.m", 137, @"Invalid parameter not satisfying: %@", @"propertiesToFetch" object file lineNumber description];

      if (v13) {
        goto LABEL_5;
      }
      goto LABEL_51;
    }
  }
  long long v77 = [MEMORY[0x1E4F28B00] currentHandler];
  [v77 handleFailureInMethod:a2, self, @"PLModelMigrationActions_16000.m", 136, @"Invalid parameter not satisfying: %@", @"entityName" object file lineNumber description];

  if (!v12) {
    goto LABEL_50;
  }
LABEL_4:
  if (v13) {
    goto LABEL_5;
  }
LABEL_51:
  long long v79 = [MEMORY[0x1E4F28B00] currentHandler];
  [v79 handleFailureInMethod:a2, self, @"PLModelMigrationActions_16000.m", 138, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

LABEL_5:
  v14 = PLMigrationGetLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    uint64_t v16 = [(PLModelMigrationActionCore *)self logger];

    if (v16)
    {
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      memset(buf, 0, sizeof(buf));
      v17 = PLMigrationGetLog();
      os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      BOOL v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      int v82 = 138543618;
      id v83 = v19;
      __int16 v84 = 2114;
      id v85 = v11;
      LODWORD(v80) = 22;
      char v20 = (uint8_t *)_os_log_send_and_compose_impl();

      v21 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_16000.m", 144, 0);

      if (v20 != buf) {
        free(v20);
      }
    }
    else
    {
      BOOL v22 = PLMigrationGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Zeroing out cached counts for entity: %{public}@...", buf, 0x16u);
      }
    }
  }
  v25 = +[PLPhotosHighlight entityName];
  v88[0] = @"photoAssetsSuggestedByPhotosCount";
  v88[1] = @"videoAssetsSuggestedByPhotosCount";
  v89[0] = &unk_1EEBEE160;
  v89[1] = &unk_1EEBEE160;
  v88[2] = @"assetsCount";
  v88[3] = @"assetsCountShared";
  v89[2] = &unk_1EEBEE160;
  v89[3] = &unk_1EEBEE160;
  v88[4] = @"summaryCount";
  void v88[5] = @"summaryCountShared";
  v89[4] = &unk_1EEBEE160;
  v89[5] = &unk_1EEBEE160;
  v88[6] = @"extendedCount";
  v88[7] = @"extendedCountShared";
  v89[6] = &unk_1EEBEE160;
  v89[7] = &unk_1EEBEE160;
  v88[8] = @"dayGroupAssetsCount";
  v88[9] = @"dayGroupAssetsCountShared";
  v89[8] = &unk_1EEBEE160;
  v89[9] = &unk_1EEBEE160;
  v88[10] = @"dayGroupSummaryAssetsCount";
  v88[11] = @"dayGroupSummaryAssetsCountShared";
  v89[10] = &unk_1EEBEE160;
  v89[11] = &unk_1EEBEE160;
  v88[12] = @"dayGroupExtendedAssetsCount";
  v88[13] = @"dayGroupExtendedAssetsCountShared";
  v89[12] = &unk_1EEBEE160;
  v89[13] = &unk_1EEBEE160;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:14];
  id v81 = 0;
  BOOL v27 = +[PLModelMigrator executeBatchUpdateWithEntityName:v25 predicate:0 propertiesToUpdate:v26 managedObjectContext:v13 error:&v81];
  id v28 = v81;

  if (v27)
  {

    v29 = PLMigrationGetLog();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

    if (v30)
    {
      v31 = [(PLModelMigrationActionCore *)self logger];

      if (v31)
      {
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        memset(buf, 0, sizeof(buf));
        v32 = PLMigrationGetLog();
        os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        int v82 = 138543618;
        id v83 = v34;
        __int16 v84 = 2114;
        id v85 = v11;
        LODWORD(v80) = 22;
        v35 = (uint8_t *)_os_log_send_and_compose_impl();

        v36 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v36, "logWithMessage:fromCodeLocation:type:", v35, "PLModelMigrationActions_16000.m", 173, 0);

        if (v35 != buf) {
          free(v35);
        }
      }
      else
      {
        v45 = PLMigrationGetLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v46 = (objc_class *)objc_opt_class();
          v47 = NSStringFromClass(v46);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v47;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: Recalculating shared asset container values for entity: %{public}@...", buf, 0x16u);
        }
      }
    }
    id v28 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v11];
    [v28 setFetchBatchSize:100];
    [v28 setPropertiesToFetch:v12];
    id v48 = [v13 executeFetchRequest:v28 error:a6];
    if (v48)
    {
      id v49 = [v13 enumerateWithIncrementalSaveUsingObjects:v48 withBlock:&__block_literal_global_24083];
      *a6 = v49;
      if (!v49)
      {
        int64_t v65 = 1;
LABEL_46:

        goto LABEL_47;
      }
      id v50 = PLMigrationGetLog();
      BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);

      if (!v51) {
        goto LABEL_45;
      }
      int v52 = [(PLModelMigrationActionCore *)self logger];

      if (!v52)
      {
        long long v69 = PLMigrationGetLog();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          long long v70 = (objc_class *)objc_opt_class();
          long long v71 = NSStringFromClass(v70);
          id v72 = *a6;
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v71;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v72;
          _os_log_impl(&dword_19B3C7000, v69, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate and save shared container updates for entity: %{public}@ with error: %@", buf, 0x20u);
        }
        goto LABEL_45;
      }
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      memset(buf, 0, sizeof(buf));
      v53 = PLMigrationGetLog();
      os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
      __int16 v54 = (objc_class *)objc_opt_class();
      id v55 = NSStringFromClass(v54);
      id v56 = *a6;
      int v82 = 138543874;
      id v83 = v55;
      __int16 v84 = 2114;
      id v85 = v11;
      __int16 v86 = 2112;
      id v87 = v56;
      LODWORD(v80) = 32;
      long long v57 = (uint8_t *)_os_log_send_and_compose_impl();

      long long v58 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v58, "logWithMessage:fromCodeLocation:type:", v57, "PLModelMigrationActions_16000.m", 186, 16);

      if (v57 == buf)
      {
LABEL_45:
        int64_t v65 = 3;
        goto LABEL_46;
      }
    }
    else
    {
      long long v59 = PLMigrationGetLog();
      BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);

      if (!v60) {
        goto LABEL_45;
      }
      long long v61 = [(PLModelMigrationActionCore *)self logger];

      if (!v61)
      {
        long long v73 = PLMigrationGetLog();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          id v74 = *a6;
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v74;
          _os_log_impl(&dword_19B3C7000, v73, OS_LOG_TYPE_DEFAULT, "Failed to execute fetch request with Error: %@", buf, 0xCu);
        }

        goto LABEL_45;
      }
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v62 = PLMigrationGetLog();
      os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
      id v63 = *a6;
      int v82 = 138412290;
      id v83 = v63;
      LODWORD(v80) = 12;
      long long v57 = (uint8_t *)_os_log_send_and_compose_impl();

      long long v64 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v64, "logWithMessage:fromCodeLocation:type:", v57, "PLModelMigrationActions_16000.m", 190, 0);

      if (v57 == buf) {
        goto LABEL_45;
      }
    }
    free(v57);
    goto LABEL_45;
  }
  v37 = PLMigrationGetLog();
  BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);

  if (v38)
  {
    v39 = [(PLModelMigrationActionCore *)self logger];

    if (v39)
    {
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      memset(buf, 0, sizeof(buf));
      id v40 = PLMigrationGetLog();
      os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
      v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      int v82 = 138543618;
      id v83 = v42;
      __int16 v84 = 2114;
      id v85 = v28;
      LODWORD(v80) = 22;
      v43 = (uint8_t *)_os_log_send_and_compose_impl();

      v44 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v44, "logWithMessage:fromCodeLocation:type:", v43, "PLModelMigrationActions_16000.m", 167, 16);

      if (v43 != buf) {
        free(v43);
      }
    }
    else
    {
      long long v66 = PLMigrationGetLog();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        long long v67 = (objc_class *)objc_opt_class();
        long long v68 = NSStringFromClass(v67);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v68;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        _os_log_impl(&dword_19B3C7000, v66, OS_LOG_TYPE_ERROR, "Failed to execute batch update request for %{public}@. Error: %{public}@", buf, 0x16u);
      }
    }
  }
  int64_t v65 = 3;
LABEL_47:

  return v65;
}

@end