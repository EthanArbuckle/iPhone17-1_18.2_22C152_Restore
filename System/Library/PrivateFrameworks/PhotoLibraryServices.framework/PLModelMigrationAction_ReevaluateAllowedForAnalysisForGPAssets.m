@interface PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v103[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 1;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLExtendedAttributes entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"generativeAIType", 1);
  [v9 setPredicate:v10];

  v103[0] = @"asset.additionalAttributes";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v11];

  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__43798;
  v62 = __Block_byref_object_dispose__43799;
  id v63 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__43798;
  v56 = __Block_byref_object_dispose__43799;
  id v57 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  uint64_t v15 = [(PLModelMigrationActionCore *)self pathManager];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke;
  v50[3] = &unk_1E586FB88;
  id v16 = v6;
  id v51 = v16;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke_2;
  v49[3] = &unk_1E5870290;
  v49[4] = self;
  v49[5] = &v52;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke_3;
  v48[3] = &unk_1E586A0F8;
  v48[4] = self;
  v48[5] = &v58;
  v48[6] = &v64;
  v48[7] = &v52;
  v17 = [(PLEnumerateAndSaveController *)v12 initWithName:v14 fetchRequest:v9 context:v16 pathManager:v15 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v50 didFetchObjectIDsBlock:v49 processResultBlock:v48];

  v18 = (id *)(v59 + 5);
  id obj = (id)v59[5];
  LOBYTE(v15) = [(PLEnumerateAndSaveController *)v17 processObjectsWithError:&obj];
  objc_storeStrong(v18, obj);
  if (v15)
  {
    v19 = PLMigrationGetLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (!v20) {
      goto LABEL_16;
    }
    v21 = [(PLModelMigrationActionCore *)self logger];
    BOOL v22 = v21 == 0;

    if (!v22)
    {
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
      memset(buf, 0, sizeof(buf));
      v23 = PLMigrationGetLog();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      uint64_t v24 = [(id)v53[5] totalUnitCount];
      int v68 = 134217984;
      uint64_t v69 = v24;
      LODWORD(v46) = 12;
      v25 = (uint8_t *)_os_log_send_and_compose_impl();

      v26 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 1198, 0);

      goto LABEL_8;
    }
    v36 = PLMigrationGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [(id)v53[5] totalUnitCount];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v37;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Updated allowedForAnalysis for %lld GP assets", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  v65[3] = 3;
  v27 = PLMigrationGetLog();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

  if (!v28) {
    goto LABEL_16;
  }
  v29 = [(PLModelMigrationActionCore *)self logger];
  BOOL v30 = v29 == 0;

  if (v30)
  {
    v36 = PLMigrationGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      uint64_t v40 = v59[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v40;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %@", buf, 0x16u);
    }
    goto LABEL_15;
  }
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
  memset(buf, 0, sizeof(buf));
  v31 = PLMigrationGetLog();
  os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
  v32 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v32);
  uint64_t v34 = v59[5];
  int v68 = 138543618;
  uint64_t v69 = (uint64_t)v33;
  __int16 v70 = 2112;
  uint64_t v71 = v34;
  LODWORD(v46) = 22;
  v25 = (uint8_t *)_os_log_send_and_compose_impl();

  v35 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_18000.m", 1196, 16);

LABEL_8:
  if (v25 != buf) {
    free(v25);
  }
LABEL_16:
  uint64_t v41 = v65[3];
  id v42 = (id)v59[5];
  v43 = v42;
  if (v41 != 1 && a4) {
    *a4 = v42;
  }

  [(PLModelMigrationActionCore *)self finalizeProgress];
  int64_t v44 = v65[3];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  return v44;
}

@end