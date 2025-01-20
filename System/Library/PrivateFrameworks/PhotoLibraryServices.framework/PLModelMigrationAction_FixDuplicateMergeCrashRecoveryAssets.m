@interface PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets
+ (int64_t)actionProgressWeight;
- (BOOL)_isLibraryRepairRequiredWithManagedObjectContext:(id)a3;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
- (void)_processForRepairWithAsset:(id)a3 repairCount:(int64_t *)a4;
- (void)_repairAsset:(id)a3;
@end

@implementation PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets

- (void)_repairAsset:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 duplicateAlbum];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v6 = [v5 assets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v90 count:16];
  if (!v7) {
    goto LABEL_34;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v49;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v49 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      if (([v11 isEqual:v4] & 1) == 0)
      {
        v12 = [v11 master];

        if (v12)
        {
          if ([v11 cloudLocalState] == 1)
          {
            v45 = self;
            v13 = [[PLDuplicateAsset alloc] initWithAsset:v11];
            v14 = [[PLDuplicateAsset alloc] initWithAsset:v4];
            uint64_t v15 = [v4 photoLibrary];
            v16 = (void *)v15;
            v46 = v13;
            if (v13 && v14 && v15)
            {
              v17 = [PLDuplicateMerge alloc];
              v89 = v13;
              uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
              v42 = v14;
              v43 = v16;
              v19 = [(PLDuplicateMerge *)v17 initWithSourceAssets:v18 targetAsset:v14 photolibrary:v16];

              id v47 = 0;
              LOBYTE(v18) = [(PLDuplicateMerge *)v19 mergeResourcesFromSource:v46 error:&v47];
              id v20 = v47;
              if ((v18 & 1) == 0)
              {
                v21 = PLMigrationGetLog();
                BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

                if (v22)
                {
                  v23 = [(PLModelMigrationActionBackground *)v45 logger];

                  if (v23)
                  {
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
                    memset(buf, 0, sizeof(buf));
                    v24 = PLMigrationGetLog();
                    os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
                    v25 = [v4 uuid];
                    v26 = [v11 uuid];
                    int v52 = 138543618;
                    v53 = v25;
                    __int16 v54 = 2114;
                    *(void *)v55 = v26;
                    LODWORD(v41) = 22;
                    v27 = (uint8_t *)_os_log_send_and_compose_impl();

                    v28 = [(PLModelMigrationActionBackground *)v45 logger];
                    objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActionBackground.m", 795, 16);

                    if (v27 != buf) {
                      free(v27);
                    }
                  }
                  else
                  {
                    v38 = PLMigrationGetLog();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      v39 = [v4 uuid];
                      v40 = [v11 uuid];
                      *(_DWORD *)buf = 138543618;
                      *(void *)&buf[4] = v39;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v40;
                      _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Failed to repair merge asset %{public}@ using source %{public}@", buf, 0x16u);
                    }
                  }
                }
              }

              v14 = v42;
              v16 = v43;
            }
            else
            {
              v29 = PLMigrationGetLog();
              BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

              if (v30)
              {
                v31 = [(PLModelMigrationActionBackground *)v45 logger];

                if (v31)
                {
                  v44 = v16;
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
                  memset(buf, 0, sizeof(buf));
                  v32 = PLMigrationGetLog();
                  os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
                  v33 = [v4 uuid];
                  int v52 = 138544130;
                  v53 = v33;
                  __int16 v54 = 1024;
                  *(_DWORD *)v55 = v46 != 0;
                  *(_WORD *)&v55[4] = 1024;
                  *(_DWORD *)&v55[6] = v14 != 0;
                  __int16 v56 = 1024;
                  BOOL v57 = v16 != 0;
                  LODWORD(v41) = 30;
                  v34 = (uint8_t *)_os_log_send_and_compose_impl();

                  v35 = [(PLModelMigrationActionBackground *)v45 logger];
                  objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActionBackground.m", 798, 16);

                  if (v34 != buf) {
                    free(v34);
                  }
                  id v20 = 0;
                  v16 = v44;
                  goto LABEL_33;
                }
                v36 = PLMigrationGetLog();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  v37 = [v4 uuid];
                  *(_DWORD *)buf = 138544130;
                  *(void *)&buf[4] = v37;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v46 != 0;
                  *(_WORD *)&buf[18] = 1024;
                  *(_DWORD *)&buf[20] = v14 != 0;
                  *(_WORD *)&buf[24] = 1024;
                  *(_DWORD *)&buf[26] = v16 != 0;
                  _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Failed to repair merge asset %{public}@. Missing merge parameters: [%d:%d:%d]", buf, 0x1Eu);
                }
              }
              id v20 = 0;
            }
LABEL_33:

            goto LABEL_34;
          }
        }
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v90 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_34:
}

- (void)_processForRepairWithAsset:(id)a3 repairCount:(int64_t *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 masterResourceForCPLType:1];
  uint64_t v8 = [v7 cplFileURL];
  id v25 = 0;
  char v9 = [v8 checkResourceIsReachableAndReturnError:&v25];
  id v10 = v25;
  if (!v8) {
    goto LABEL_4;
  }
  if (v9) {
    goto LABEL_6;
  }
  if (!PLIsErrorFileNotFound())
  {
    v11 = PLMigrationGetLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      v13 = [(PLModelMigrationActionBackground *)self logger];

      if (v13)
      {
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
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        memset(buf, 0, sizeof(buf));
        v14 = PLMigrationGetLog();
        os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        uint64_t v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        v17 = [v6 uuid];
        int v26 = 138543874;
        v27 = v16;
        __int16 v28 = 2114;
        v29 = v17;
        __int16 v30 = 2112;
        id v31 = v10;
        LODWORD(v24) = 32;
        uint64_t v18 = (uint8_t *)_os_log_send_and_compose_impl();

        v19 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v19, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigrationActionBackground.m", 769, 16);

        if (v18 != buf) {
          free(v18);
        }
      }
      else
      {
        id v20 = PLMigrationGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (objc_class *)objc_opt_class();
          BOOL v22 = NSStringFromClass(v21);
          v23 = [v6 uuid];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v22;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v23;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v10;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Resource check failed in %{public}@ for %{public}@. Error: %@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
LABEL_4:
    [(PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets *)self _repairAsset:v6];
    if (a4) {
      ++*a4;
    }
  }
LABEL_6:
}

- (BOOL)_isLibraryRepairRequiredWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = [(PLModelMigrationActionBackground *)self pathManager];
  id v6 = [v5 libraryURL];
  int v7 = PLIsCloudPhotoLibraryEnabledForPhotoLibraryURL(v6);

  if (v7)
  {
    objc_opt_class();
    id v8 = v4;
    if (objc_opt_isKindOfClass()) {
      char v9 = v8;
    }
    else {
      char v9 = 0;
    }
    id v10 = v9;

    v11 = objc_msgSend(v10, "pl_libraryBundle");
    BOOL v12 = [v11 indicatorFileCoordinator];

    int v13 = [v12 isDisableICloudPhotos] ^ 1;
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (objc_class *)objc_opt_class();
  int v7 = NSStringFromClass(v6);
  if ([(PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets *)self _isLibraryRepairRequiredWithManagedObjectContext:v5])
  {
    id v8 = (void *)MEMORY[0x1E4F1C0D0];
    char v9 = +[PLManagedAsset entityName];
    id v10 = [v8 fetchRequestWithEntityName:v9];

    v11 = (void *)MEMORY[0x1E4F28BA0];
    BOOL v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"duplicateAssetVisibilityState", 0);
    v98[0] = v12;
    int v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"activeLibraryScopeParticipationState", 1);
    v98[1] = v13;
    v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"master");
    v98[2] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:3];
    v16 = [v11 andPredicateWithSubpredicates:v15];
    [v10 setPredicate:v16];

    [v10 setFetchBatchSize:100];
    v97[0] = @"modernResources";
    v97[1] = @"albums";
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:2];
    [v10 setRelationshipKeyPathsForPrefetching:v17];

    *(void *)&long long v92 = 0;
    *((void *)&v92 + 1) = &v92;
    uint64_t v93 = 0x3032000000;
    v94 = __Block_byref_object_copy__1142;
    v95 = __Block_byref_object_dispose__1143;
    id v96 = 0;
    uint64_t v82 = 0;
    long long v83 = &v82;
    uint64_t v84 = 0x2020000000;
    uint64_t v85 = 1;
    id obj = 0;
    uint64_t v18 = [v5 executeFetchRequest:v10 error:&obj];
    objc_storeStrong(&v96, obj);
    if (!v18)
    {
      v83[3] = 3;
      long long v38 = PLMigrationGetLog();
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);

      if (v39)
      {
        long long v40 = [(PLModelMigrationActionBackground *)self logger];
        BOOL v41 = v40 == 0;

        if (v41)
        {
          long long v62 = PLMigrationGetLog();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            uint64_t v63 = (objc_class *)objc_opt_class();
            long long v64 = NSStringFromClass(v63);
            uint64_t v65 = *(void *)(*((void *)&v92 + 1) + 40);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v64;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v65;
            _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %@", buf, 0x16u);
          }
        }
        else
        {
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          memset(buf, 0, sizeof(buf));
          long long v42 = PLMigrationGetLog();
          os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
          long long v43 = (objc_class *)objc_opt_class();
          long long v44 = NSStringFromClass(v43);
          uint64_t v45 = *(void *)(*((void *)&v92 + 1) + 40);
          *(_DWORD *)v90 = 138543618;
          *(void *)&v90[4] = v44;
          *(_WORD *)&v90[12] = 2112;
          *(void *)&v90[14] = v45;
          LODWORD(v74) = 22;
          long long v46 = (uint8_t *)_os_log_send_and_compose_impl();

          long long v47 = [(PLModelMigrationActionBackground *)self logger];
          objc_msgSend(v47, "logWithMessage:fromCodeLocation:type:", v46, "PLModelMigrationActionBackground.m", 729, 16);

          if (v46 != buf) {
            free(v46);
          }
        }
      }
      goto LABEL_36;
    }
    v19 = -[PLModelMigrationActionBackground cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v18 count], 0);
    *(void *)v90 = 0;
    *(void *)&v90[8] = v90;
    *(void *)&v90[16] = 0x2020000000;
    uint64_t v91 = 0;
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __107__PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets_performActionWithManagedObjectContext_error___block_invoke;
    v76[3] = &unk_1E5867460;
    v76[4] = self;
    long long v78 = v90;
    long long v79 = &v82;
    long long v80 = &v92;
    id v20 = v19;
    id v77 = v20;
    v21 = [v5 enumerateWithIncrementalSaveUsingObjects:v18 withBlock:v76];
    if (v21 && (BOOL v22 = (id *)(*((void *)&v92 + 1) + 40), !*(void *)(*((void *)&v92 + 1) + 40)))
    {
      v83[3] = 3;
      objc_storeStrong(v22, v21);
      long long v50 = PLMigrationGetLog();
      BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);

      if (!v51) {
        goto LABEL_35;
      }
      long long v52 = [(PLModelMigrationActionBackground *)self logger];
      BOOL v53 = v52 == 0;

      if (!v53)
      {
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        memset(buf, 0, sizeof(buf));
        long long v54 = PLMigrationGetLog();
        os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
        long long v55 = (objc_class *)objc_opt_class();
        long long v56 = NSStringFromClass(v55);
        uint64_t v57 = *(void *)(*((void *)&v92 + 1) + 40);
        int v86 = 138543618;
        long long v87 = v56;
        __int16 v88 = 2112;
        uint64_t v89 = v57;
        LODWORD(v74) = 22;
        long long v58 = (uint8_t *)_os_log_send_and_compose_impl();

        long long v59 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v59, "logWithMessage:fromCodeLocation:type:", v58, "PLModelMigrationActionBackground.m", 723, 16);

        if (v58 != buf)
        {
          id v31 = v58;
          goto LABEL_25;
        }
LABEL_35:

        _Block_object_dispose(v90, 8);
LABEL_36:
        [(PLModelMigrationActionBackground *)self finalizeProgress];
        uint64_t v69 = v83[3];
        id v70 = *(id *)(*((void *)&v92 + 1) + 40);
        long long v71 = v70;
        if (v69 != 1 && a4) {
          *a4 = v70;
        }

        int64_t v49 = v83[3];
        _Block_object_dispose(&v82, 8);
        _Block_object_dispose(&v92, 8);

        goto LABEL_40;
      }
      long long v60 = PLMigrationGetLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        long long v66 = (objc_class *)objc_opt_class();
        long long v67 = NSStringFromClass(v66);
        uint64_t v68 = *(void *)(*((void *)&v92 + 1) + 40);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v67;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v68;
        _os_log_impl(&dword_19B3C7000, v60, OS_LOG_TYPE_ERROR, "Asset could not be saved for %{public}@. Error: %@", buf, 0x16u);
      }
    }
    else
    {
      v23 = PLMigrationGetLog();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);

      if (!v24) {
        goto LABEL_35;
      }
      id v25 = [(PLModelMigrationActionBackground *)self logger];
      BOOL v26 = v25 == 0;

      if (!v26)
      {
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        memset(buf, 0, sizeof(buf));
        v27 = PLMigrationGetLog();
        os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
        __int16 v28 = *(void **)(*(void *)&v90[8] + 24);
        int v86 = 134217984;
        long long v87 = v28;
        LODWORD(v74) = 12;
        v29 = (uint8_t *)_os_log_send_and_compose_impl();

        __int16 v30 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActionBackground.m", 725, 1);

        if (v29 != buf)
        {
          id v31 = v29;
LABEL_25:
          free(v31);
          goto LABEL_35;
        }
        goto LABEL_35;
      }
      long long v60 = PLMigrationGetLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        uint64_t v61 = *(void *)(*(void *)&v90[8] + 24);
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v61;
        _os_log_impl(&dword_19B3C7000, v60, OS_LOG_TYPE_INFO, "Completed repair on %td assets", buf, 0xCu);
      }
    }

    goto LABEL_35;
  }
  v32 = PLMigrationGetLog();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

  if (v33)
  {
    long long v34 = [(PLModelMigrationActionBackground *)self logger];

    if (v34)
    {
      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v35 = PLMigrationGetLog();
      os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      LODWORD(v92) = 138543362;
      *(void *)((char *)&v92 + 4) = v7;
      LODWORD(v73) = 12;
      long long v36 = (uint8_t *)_os_log_send_and_compose_impl();

      long long v37 = [(PLModelMigrationActionBackground *)self logger];
      objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActionBackground.m", 682, 0);

      if (v36 != buf) {
        free(v36);
      }
    }
    else
    {
      long long v48 = PLMigrationGetLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v7;
        _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ was skipped. Library is not in a valid state for repair", buf, 0xCu);
      }
    }
  }
  int64_t v49 = 1;
LABEL_40:

  return v49;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end