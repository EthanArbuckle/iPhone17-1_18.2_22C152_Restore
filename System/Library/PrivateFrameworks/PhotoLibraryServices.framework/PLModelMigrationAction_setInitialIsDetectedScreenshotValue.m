@interface PLModelMigrationAction_setInitialIsDetectedScreenshotValue
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_setInitialIsDetectedScreenshotValue

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v106[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 1;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__1142;
  v65 = __Block_byref_object_dispose__1143;
  id v66 = 0;
  v7 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v8 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v7);

  v9 = +[PLManagedAsset fetchRequest];
  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v106[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:1];
  [v9 setSortDescriptors:v11];

  if (v8)
  {
    v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v8];
    [v9 setPredicate:v12];
  }
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__1142;
  v59[4] = __Block_byref_object_dispose__1143;
  id v60 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  v13 = [PLEnumerateAndSaveController alloc];
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = [(PLModelMigrationActionBackground *)self pathManager];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke;
  v53[3] = &unk_1E586FB88;
  id v17 = v6;
  id v54 = v17;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke_2;
  v52[3] = &unk_1E5870290;
  v52[4] = self;
  v52[5] = v59;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke_3;
  v51[3] = &unk_1E586B428;
  v51[4] = self;
  v51[5] = &v61;
  v51[6] = &v67;
  v51[7] = &v55;
  v51[8] = v59;
  v18 = [(PLEnumerateAndSaveController *)v13 initWithName:v15 fetchRequest:v9 context:v17 pathManager:v16 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v53 didFetchObjectIDsBlock:v52 processResultBlock:v51];

  v19 = (id *)(v62 + 5);
  id obj = (id)v62[5];
  LODWORD(v16) = [(PLEnumerateAndSaveController *)v18 processObjectsWithError:&obj];
  objc_storeStrong(v19, obj);
  if (v16)
  {
    v20 = PLMigrationGetLog();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (!v21) {
      goto LABEL_19;
    }
    v22 = [(PLModelMigrationActionBackground *)self logger];
    BOOL v23 = v22 == 0;

    if (!v23)
    {
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
      long long v76 = 0u;
      long long v77 = 0u;
      memset(buf, 0, sizeof(buf));
      v24 = PLMigrationGetLog();
      os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
      v25 = (void *)v56[3];
      int v71 = 134217984;
      v72 = v25;
      LODWORD(v49) = 12;
      v26 = (uint8_t *)_os_log_send_and_compose_impl();

      v27 = [(PLModelMigrationActionBackground *)self logger];
      objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigrationActionBackground.m", 869, 0);

      if (v26 == buf) {
        goto LABEL_19;
      }
      v28 = v26;
LABEL_12:
      free(v28);
      goto LABEL_19;
    }
    v39 = PLMigrationGetLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = v56[3];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v40;
      _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "Set initial isDetectedScreenshot for %tu assets.", buf, 0xCu);
    }
  }
  else
  {
    v68[3] = 3;
    v29 = PLMigrationGetLog();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

    if (!v30) {
      goto LABEL_19;
    }
    v31 = [(PLModelMigrationActionBackground *)self logger];
    BOOL v32 = v31 == 0;

    if (!v32)
    {
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
      long long v76 = 0u;
      long long v77 = 0u;
      memset(buf, 0, sizeof(buf));
      v33 = PLMigrationGetLog();
      os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      uint64_t v36 = v62[5];
      int v71 = 138543618;
      v72 = v35;
      __int16 v73 = 2114;
      uint64_t v74 = v36;
      LODWORD(v49) = 22;
      v37 = (uint8_t *)_os_log_send_and_compose_impl();

      v38 = [(PLModelMigrationActionBackground *)self logger];
      objc_msgSend(v38, "logWithMessage:fromCodeLocation:type:", v37, "PLModelMigrationActionBackground.m", 872, 16);

      if (v37 == buf) {
        goto LABEL_19;
      }
      v28 = v37;
      goto LABEL_12;
    }
    v39 = PLMigrationGetLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      uint64_t v43 = v62[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v43;
      _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %{public}@", buf, 0x16u);
    }
  }

LABEL_19:
  if (v68[3] == 1) {
    [(PLModelMigrationActionBackground *)self setResumeMarkerValue:0];
  }
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  uint64_t v44 = v68[3];
  id v45 = (id)v62[5];
  v46 = v45;
  if (v44 != 1 && a4) {
    *a4 = v45;
  }

  int64_t v47 = v68[3];
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(v59, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  return v47;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end