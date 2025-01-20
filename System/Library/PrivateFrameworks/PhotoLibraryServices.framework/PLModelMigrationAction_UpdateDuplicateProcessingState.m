@interface PLModelMigrationAction_UpdateDuplicateProcessingState
+ (int64_t)actionProgressWeight;
- (PLModelMigrationAction_UpdateDuplicateProcessingState)updateDuplicateProcessingStateWithProcessingState:(unsigned __int16)a3 pendingParentUnitCount:(int64_t)a4 assetProcessingStateMap:(id)a5 context:(id)a6 request:(id)a7 error:(id *)a8;
- (id)fetchRequestForAnimated;
- (id)fetchRequestForAudioVideo;
- (id)fetchRequestForDocument;
- (id)fetchRequestForExposureScore;
- (id)fetchRequestForScreenshot;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
- (int64_t)processAssetStateMap:(id)a3 pendingParentUnitCount:(int64_t)a4 context:(id)a5 error:(id *)a6;
- (int64_t)updateSceneClassificationDuplicateProcessingStateWithProcessingState:(unsigned __int16)a3 pendingParentUnitCount:(int64_t)a4 assetProcessingStateMap:(id)a5 context:(id)a6 request:(id)a7 error:(id *)a8;
@end

@implementation PLModelMigrationAction_UpdateDuplicateProcessingState

- (PLModelMigrationAction_UpdateDuplicateProcessingState)updateDuplicateProcessingStateWithProcessingState:(unsigned __int16)a3 pendingParentUnitCount:(int64_t)a4 assetProcessingStateMap:(id)a5 context:(id)a6 request:(id)a7 error:(id *)a8
{
  uint64_t v12 = a3;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v39 = 0;
  v17 = [v15 executeFetchRequest:v16 error:&v39];
  id v18 = v39;
  if ([v17 count])
  {
    context = (void *)MEMORY[0x19F38D3B0]();
    v19 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v17 count], a4);
    v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
    v21 = [NSNumber numberWithUnsignedShort:v12];
    [v14 setObject:v20 forKeyedSubscript:v21];

    v22 = PLMigrationGetLog();
    LODWORD(v20) = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      v23 = [(PLModelMigrationActionCore *)self logger];

      if (v23)
      {
        id v37 = v18;
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
        v24 = PLMigrationGetLog();
        os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        uint64_t v27 = [v17 count];
        int v40 = 138543874;
        v41 = v26;
        __int16 v42 = 2050;
        uint64_t v43 = v27;
        __int16 v44 = 1024;
        int v45 = v12;
        LODWORD(v36) = 28;
        v28 = (uint8_t *)_os_log_send_and_compose_impl();

        v29 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_16000.m", 1371, 0);

        if (v28 != buf) {
          free(v28);
        }
        id v18 = v37;
      }
      else
      {
        v31 = PLMigrationGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          uint64_t v34 = [v17 count];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 2050;
          *(void *)&buf[14] = v34;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v12;
          _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Found %{public}td assets for duplicate processing state: %u", buf, 0x1Cu);
        }
      }
    }
    objc_msgSend(v19, "setCompletedUnitCount:", objc_msgSend(v19, "totalUnitCount"));

    goto LABEL_15;
  }
  if (v17)
  {
LABEL_15:
    uint64_t v30 = 1;
    goto LABEL_16;
  }
  if (a8) {
    *a8 = v18;
  }
  uint64_t v30 = 3;
LABEL_16:

  return (PLModelMigrationAction_UpdateDuplicateProcessingState *)v30;
}

- (int64_t)updateSceneClassificationDuplicateProcessingStateWithProcessingState:(unsigned __int16)a3 pendingParentUnitCount:(int64_t)a4 assetProcessingStateMap:(id)a5 context:(id)a6 request:(id)a7 error:(id *)a8
{
  uint64_t v12 = a3;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v56 = 0;
  v17 = [v15 executeFetchRequest:v16 error:&v56];
  id v18 = v56;
  if ([v17 count])
  {
    id v49 = v18;
    id v50 = v16;
    id v51 = v15;
    v46 = v14;
    context = (void *)MEMORY[0x19F38D3B0]();
    int v45 = self;
    long long v47 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v17 count], a4);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v20 = v17;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v94 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v53 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v52 + 1) + 8 * i) assetAttributes];
          v26 = [v25 asset];
          uint64_t v27 = [v26 objectID];

          if (v27) {
            [v19 addObject:v27];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v52 objects:v94 count:16];
      }
      while (v22);
    }

    v28 = [NSNumber numberWithUnsignedShort:v12];
    id v14 = v46;
    [v46 setObject:v19 forKeyedSubscript:v28];

    v29 = PLMigrationGetLog();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

    if (v30)
    {
      v31 = [(PLModelMigrationActionCore *)v45 logger];

      if (v31)
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
        v32 = PLMigrationGetLog();
        os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        v33 = (objc_class *)objc_opt_class();
        uint64_t v34 = NSStringFromClass(v33);
        uint64_t v35 = [v20 count];
        int v57 = 138543874;
        long long v58 = v34;
        __int16 v59 = 2050;
        uint64_t v60 = v35;
        __int16 v61 = 1024;
        int v62 = v12;
        LODWORD(v44) = 28;
        uint64_t v36 = (uint8_t *)_os_log_send_and_compose_impl();

        id v37 = [(PLModelMigrationActionCore *)v45 logger];
        objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActions_16000.m", 1351, 0);

        if (v36 != buf) {
          free(v36);
        }
      }
      else
      {
        id v39 = PLMigrationGetLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          int v40 = (objc_class *)objc_opt_class();
          v41 = NSStringFromClass(v40);
          uint64_t v42 = [v20 count];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v41;
          *(_WORD *)&buf[12] = 2050;
          *(void *)&buf[14] = v42;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v12;
          _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: Found %{public}td assets for duplicate processing state: %u", buf, 0x1Cu);
        }
      }
    }
    objc_msgSend(v47, "setCompletedUnitCount:", objc_msgSend(v47, "totalUnitCount"));

    int64_t v38 = 1;
    id v16 = v50;
    id v15 = v51;
    id v18 = v49;
  }
  else if (v17)
  {
    int64_t v38 = 1;
  }
  else
  {
    if (a8) {
      *a8 = v18;
    }
    int64_t v38 = 3;
  }

  return v38;
}

- (int64_t)processAssetStateMap:(id)a3 pendingParentUnitCount:(int64_t)a4 context:(id)a5 error:(id *)a6
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v70 = a5;
  uint64_t v89 = 0;
  long long v90 = &v89;
  uint64_t v91 = 0x2020000000;
  uint64_t v92 = 1;
  uint64_t v83 = 0;
  long long v84 = (id *)&v83;
  uint64_t v85 = 0x3032000000;
  long long v86 = __Block_byref_object_copy__23954;
  long long v87 = __Block_byref_object_dispose__23955;
  id v88 = 0;
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v68 = self;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v79 objects:v129 count:16];
  if (v9)
  {
    uint64_t v66 = *(void *)v80;
    do
    {
      uint64_t v10 = 0;
      uint64_t v67 = v9;
      do
      {
        if (*(void *)v80 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v79 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x19F38D3B0]();
        v13 = [obj objectForKeyedSubscript:v11];
        id v14 = +[PLManagedAsset fetchRequest];
        id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v13];
        [v14 setPredicate:v15];

        v128 = @"additionalAttributes";
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v128 count:1];
        [v14 setRelationshipKeyPathsForPrefetching:v16];

        [v14 setFetchBatchSize:100];
        v17 = v84 + 5;
        id v78 = v84[5];
        id v18 = [v70 executeFetchRequest:v14 error:&v78];
        objc_storeStrong(v17, v78);
        if ([v18 count])
        {
          id v19 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](v68, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v18 count], a4);
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __115__PLModelMigrationAction_UpdateDuplicateProcessingState_processAssetStateMap_pendingParentUnitCount_context_error___block_invoke;
          v72[3] = &unk_1E5867488;
          v72[4] = v11;
          id v73 = v65;
          long long v74 = v68;
          long long v76 = &v83;
          long long v77 = &v89;
          id v20 = v19;
          id v75 = v20;
          uint64_t v21 = [v70 enumerateWithIncrementalSaveUsingObjects:v18 withBlock:v72];
          uint64_t v22 = v21;
          uint64_t v23 = v90[3];
          if (v23 != 2 && v21)
          {
            objc_storeStrong(v84 + 5, v21);
            v90[3] = 3;
            goto LABEL_17;
          }
          if (v23 == 1)
          {
            v24 = PLMigrationGetLog();
            BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

            if (v25)
            {
              v26 = [(PLModelMigrationActionCore *)v68 logger];
              BOOL v27 = v26 == 0;

              if (v27)
              {
                id v49 = PLMigrationGetLog();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  id v50 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v50);
                  id v51 = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v52 = [v18 count];
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v51;
                  *(_WORD *)&buf[12] = 2050;
                  *(void *)&buf[14] = v52;
                  _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated processing state for %{public}td assets.", buf, 0x16u);
                }
              }
              else
              {
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
                long long v98 = 0u;
                long long v99 = 0u;
                memset(buf, 0, sizeof(buf));
                v28 = PLMigrationGetLog();
                os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
                v29 = (objc_class *)objc_opt_class();
                NSStringFromClass(v29);
                id v30 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v31 = [v18 count];
                int v93 = 138543618;
                id v94 = v30;
                __int16 v95 = 2050;
                uint64_t v96 = v31;
                LODWORD(v62) = 22;
                v32 = (uint8_t *)_os_log_send_and_compose_impl();

                v33 = [(PLModelMigrationActionCore *)v68 logger];
                objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActions_16000.m", 1316, 0);

                if (v32 != buf) {
                  free(v32);
                }
              }
            }
            int v48 = 0;
            LOBYTE(v35) = 1;
          }
          else
          {
LABEL_17:
            uint64_t v34 = PLMigrationGetLog();
            BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);

            if (v35)
            {
              uint64_t v36 = [(PLModelMigrationActionCore *)v68 logger];
              BOOL v37 = v36 == 0;

              if (v37)
              {
                uint64_t v44 = PLMigrationGetLog();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  int v45 = (objc_class *)objc_opt_class();
                  v46 = NSStringFromClass(v45);
                  id v47 = v84[5];
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v46;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v47;
                  _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "Failed to save managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
                }
              }
              else
              {
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
                long long v98 = 0u;
                long long v99 = 0u;
                memset(buf, 0, sizeof(buf));
                int64_t v38 = PLMigrationGetLog();
                os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
                id v39 = (objc_class *)objc_opt_class();
                int v40 = NSStringFromClass(v39);
                id v41 = v84[5];
                int v93 = 138543618;
                id v94 = v40;
                __int16 v95 = 2114;
                uint64_t v96 = (uint64_t)v41;
                LODWORD(v62) = 22;
                uint64_t v42 = (uint8_t *)_os_log_send_and_compose_impl();

                uint64_t v43 = [(PLModelMigrationActionCore *)v68 logger];
                objc_msgSend(v43, "logWithMessage:fromCodeLocation:type:", v42, "PLModelMigrationActions_16000.m", 1318, 16);

                if (v42 != buf) {
                  free(v42);
                }
              }
              LOBYTE(v35) = 0;
            }
            int v48 = 2;
          }

          if (!v35) {
            goto LABEL_32;
          }
          goto LABEL_31;
        }
        if (!v18) {
          v90[3] = 3;
        }
LABEL_31:
        int v48 = 0;
LABEL_32:

        if (v48) {
          goto LABEL_35;
        }
        ++v10;
      }
      while (v67 != v10);
      uint64_t v9 = [obj countByEnumeratingWithState:&v79 objects:v129 count:16];
    }
    while (v9);
  }
LABEL_35:

  if (v90[3] == 1 && [v65 count])
  {
    long long v53 = +[PLManagedAsset fetchRequest];
    long long v54 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v65];
    [v53 setPredicate:v54];

    [v53 setFetchBatchSize:100];
    long long v55 = v84 + 5;
    id v71 = v84[5];
    int64_t v56 = +[PLModelMigrationActionUtility removeFromDuplicatesWithAction:v68 managedObjectContext:v70 fetchRequest:v53 requiresTokenReset:1 error:&v71];
    objc_storeStrong(v55, v71);
    v90[3] = v56;
  }
  uint64_t v57 = v90[3];
  id v58 = v84[5];
  __int16 v59 = v58;
  if (v57 != 1 && a6) {
    *a6 = v58;
  }

  int64_t v60 = v90[3];
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v89, 8);
  return v60;
}

- (id)fetchRequestForDocument
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v2 = +[PLSceneClassification fetchRequest];
  v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = (void *)MEMORY[0x1E4F28F60];
  v5 = +[PLSceneClassification PLJunkSceneClassificationIDForLabel:@"hier_text_document"];
  v6 = [v4 predicateWithFormat:@"%K == %@", @"sceneIdentifier", v5];
  v13[0] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %lf", @"confidence", 0x3FE2E147AE147AE1);
  v13[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v9 = [v3 andPredicateWithSubpredicates:v8];
  [v2 setPredicate:v9];

  uint64_t v12 = @"assetAttributes.asset";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v2 setRelationshipKeyPathsForPrefetching:v10];

  [v2 setFetchBatchSize:100];
  return v2;
}

- (id)fetchRequestForExposureScore
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedAsset fetchRequest];
  v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 0);
  v9[0] = v4;
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %lf", @"mediaAnalysisAttributes.exposureScore", 0);
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v7 = [v3 andPredicateWithSubpredicates:v6];
  [v2 setPredicate:v7];

  [v2 setResultType:1];
  return v2;
}

- (id)fetchRequestForAnimated
{
  v2 = +[PLManagedAsset fetchRequest];
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"playbackStyle", 2);
  [v2 setPredicate:v3];

  [v2 setResultType:1];
  return v2;
}

- (id)fetchRequestForScreenshot
{
  v2 = +[PLManagedAsset fetchRequest];
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kindSubtype", 10);
  [v2 setPredicate:v3];

  [v2 setResultType:1];
  return v2;
}

- (id)fetchRequestForAudioVideo
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedAsset fetchRequest];
  v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 1);
  v9[0] = v4;
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 2);
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v7 = [v3 orPredicateWithSubpredicates:v6];
  [v2 setPredicate:v7];

  [v2 setResultType:1];
  return v2;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PLModelMigrationActionCore *)self progress];
  uint64_t v8 = [v7 totalUnitCount] / 7;

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self fetchRequestForAudioVideo];
  id v29 = 0;
  int64_t v11 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self updateDuplicateProcessingStateWithProcessingState:2 pendingParentUnitCount:v8 assetProcessingStateMap:v9 context:v6 request:v10 error:&v29];
  id v12 = v29;

  if (v11 != 1) {
    goto LABEL_9;
  }
  v13 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self fetchRequestForScreenshot];
  id v28 = v12;
  int64_t v11 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self updateDuplicateProcessingStateWithProcessingState:4 pendingParentUnitCount:v8 assetProcessingStateMap:v9 context:v6 request:v13 error:&v28];
  id v14 = v28;

  if (v11 != 1) {
    goto LABEL_8;
  }
  id v15 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self fetchRequestForAnimated];
  id v27 = v14;
  int64_t v11 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self updateDuplicateProcessingStateWithProcessingState:8 pendingParentUnitCount:v8 assetProcessingStateMap:v9 context:v6 request:v15 error:&v27];
  id v12 = v27;

  if (v11 != 1) {
    goto LABEL_9;
  }
  id v16 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self fetchRequestForExposureScore];
  id v26 = v12;
  int64_t v11 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self updateDuplicateProcessingStateWithProcessingState:32 pendingParentUnitCount:v8 assetProcessingStateMap:v9 context:v6 request:v16 error:&v26];
  id v14 = v26;

  if (v11 == 1)
  {
    v17 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self fetchRequestForDocument];
    id v25 = v14;
    int64_t v11 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self updateSceneClassificationDuplicateProcessingStateWithProcessingState:16 pendingParentUnitCount:v8 assetProcessingStateMap:v9 context:v6 request:v17 error:&v25];
    id v12 = v25;

    if (v11 == 1)
    {
      if ([v9 count])
      {
        id v18 = (void *)MEMORY[0x19F38D3B0]();
        id v24 = v12;
        int64_t v11 = [(PLModelMigrationAction_UpdateDuplicateProcessingState *)self processAssetStateMap:v9 pendingParentUnitCount:v8 context:v6 error:&v24];
        id v19 = v24;

        id v12 = v19;
      }
      else
      {
        int64_t v11 = 1;
      }
    }
  }
  else
  {
LABEL_8:
    id v12 = v14;
  }
LABEL_9:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v20 = v12;
  uint64_t v21 = v20;
  if (v11 != 1 && a4 != 0) {
    *a4 = v20;
  }

  return v11;
}

+ (int64_t)actionProgressWeight
{
  return 300;
}

@end