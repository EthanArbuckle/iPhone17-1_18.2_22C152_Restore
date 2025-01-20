@interface PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v108[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 1;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__53891;
  v67 = __Block_byref_object_dispose__53892;
  id v68 = 0;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLManagedAsset entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = (void *)MEMORY[0x1E4F28F60];
  v11 = +[PLVisualSearchAttributes algorithmVersionKey];
  v12 = +[PLVisualSearchAttributes stickerConfidenceScoreKey];
  v13 = objc_msgSend(v10, "predicateWithFormat:", @"(%K < 0) AND (%K.%K > 0) AND (%K.%K >= 0)", @"stickerConfidenceScore", @"mediaAnalysisAttributes.visualSearchAttributes", v11, @"mediaAnalysisAttributes.visualSearchAttributes", v12);
  [v9 setPredicate:v13];

  v14 = NSString;
  v15 = +[PLVisualSearchAttributes stickerConfidenceScoreKey];
  v16 = [v14 stringWithFormat:@"%@.%@", @"mediaAnalysisAttributes.visualSearchAttributes", v15];
  v108[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v17];

  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__53891;
  v61[4] = __Block_byref_object_dispose__53892;
  id v62 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  v18 = [PLEnumerateAndSaveController alloc];
  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  uint64_t v21 = [(PLModelMigrationActionCore *)self pathManager];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke;
  v55[3] = &unk_1E586FB88;
  id v22 = v6;
  id v56 = v22;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke_2;
  v54[3] = &unk_1E5870290;
  v54[4] = self;
  v54[5] = v61;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke_3;
  v53[3] = &unk_1E586B428;
  v53[4] = self;
  v53[5] = &v57;
  v53[6] = &v63;
  v53[7] = &v69;
  v53[8] = v61;
  v23 = [(PLEnumerateAndSaveController *)v18 initWithName:v20 fetchRequest:v9 context:v22 pathManager:v21 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v55 didFetchObjectIDsBlock:v54 processResultBlock:v53];

  v24 = (id *)(v64 + 5);
  id obj = (id)v64[5];
  LOBYTE(v21) = [(PLEnumerateAndSaveController *)v23 processObjectsWithError:&obj];
  objc_storeStrong(v24, obj);
  if (v21)
  {
    v25 = PLMigrationGetLog();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (!v26) {
      goto LABEL_17;
    }
    v27 = [(PLModelMigrationActionCore *)self logger];
    BOOL v28 = v27 == 0;

    if (!v28)
    {
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
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
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
      memset(buf, 0, sizeof(buf));
      v29 = PLMigrationGetLog();
      os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      v30 = (void *)v58[3];
      int v73 = 134217984;
      v74 = v30;
      LODWORD(v51) = 12;
      v31 = (uint8_t *)_os_log_send_and_compose_impl();

      v32 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v31, "PLModelMigrationActions_17000.m", 445, 0);

      if (v31 == buf) {
        goto LABEL_17;
      }
      v33 = v31;
LABEL_10:
      free(v33);
      goto LABEL_17;
    }
    v44 = PLMigrationGetLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = v58[3];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v45;
      _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEFAULT, "Copied %tu sticker confidence scores", buf, 0xCu);
    }
  }
  else
  {
    v70[3] = 3;
    v34 = PLMigrationGetLog();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);

    if (!v35) {
      goto LABEL_17;
    }
    v36 = [(PLModelMigrationActionCore *)self logger];
    BOOL v37 = v36 == 0;

    if (!v37)
    {
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
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
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
      memset(buf, 0, sizeof(buf));
      v38 = PLMigrationGetLog();
      os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      uint64_t v41 = v64[5];
      int v73 = 138543618;
      v74 = v40;
      __int16 v75 = 2114;
      uint64_t v76 = v41;
      LODWORD(v51) = 22;
      v42 = (uint8_t *)_os_log_send_and_compose_impl();

      v43 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v43, "logWithMessage:fromCodeLocation:type:", v42, "PLModelMigrationActions_17000.m", 443, 16);

      if (v42 == buf) {
        goto LABEL_17;
      }
      v33 = v42;
      goto LABEL_10;
    }
    v44 = PLMigrationGetLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v46 = (objc_class *)objc_opt_class();
      v47 = NSStringFromClass(v46);
      uint64_t v48 = v64[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v48;
      _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %{public}@", buf, 0x16u);
    }
  }

LABEL_17:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = (id) v64[5];
  }
  int64_t v49 = v70[3];

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(v61, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);

  return v49;
}

@end