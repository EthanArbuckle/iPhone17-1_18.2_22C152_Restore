@interface PLModelMigrationAction_setInitialhasPeopleSceneMidOrGreaterConfidenceValue
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_setInitialhasPeopleSceneMidOrGreaterConfidenceValue

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v108[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 1;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__1142;
  v66 = __Block_byref_object_dispose__1143;
  id v67 = 0;
  v7 = [(PLModelMigrationActionBackground *)self resumeMarker];
  v8 = PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v7);

  v9 = +[PLAdditionalAssetAttributes fetchRequest];
  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v108[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:1];
  [v9 setSortDescriptors:v11];

  v107 = @"sceneClassifications";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v12];

  if (v8)
  {
    v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self >= %@", v8];
    [v9 setPredicate:v13];
  }
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__1142;
  v60[4] = __Block_byref_object_dispose__1143;
  id v61 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  v14 = [PLEnumerateAndSaveController alloc];
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = [(PLModelMigrationActionBackground *)self pathManager];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __122__PLModelMigrationAction_setInitialhasPeopleSceneMidOrGreaterConfidenceValue_performActionWithManagedObjectContext_error___block_invoke;
  v54[3] = &unk_1E586FB88;
  id v18 = v6;
  id v55 = v18;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __122__PLModelMigrationAction_setInitialhasPeopleSceneMidOrGreaterConfidenceValue_performActionWithManagedObjectContext_error___block_invoke_2;
  v53[3] = &unk_1E5870290;
  v53[4] = self;
  v53[5] = v60;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __122__PLModelMigrationAction_setInitialhasPeopleSceneMidOrGreaterConfidenceValue_performActionWithManagedObjectContext_error___block_invoke_3;
  v52[3] = &unk_1E5862368;
  v52[4] = self;
  v52[5] = &v62;
  v52[6] = &v68;
  v52[7] = &v56;
  v52[8] = v60;
  v19 = [(PLEnumerateAndSaveController *)v14 initWithName:v16 fetchRequest:v9 context:v18 pathManager:v17 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v54 didFetchObjectIDsBlock:v53 processResultBlock:v52];

  v20 = (id *)(v63 + 5);
  id obj = (id)v63[5];
  LODWORD(v17) = [(PLEnumerateAndSaveController *)v19 processObjectsWithError:&obj];
  objc_storeStrong(v20, obj);
  if (v17)
  {
    v21 = PLMigrationGetLog();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

    if (!v22) {
      goto LABEL_19;
    }
    v23 = [(PLModelMigrationActionBackground *)self logger];
    BOOL v24 = v23 == 0;

    if (!v24)
    {
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
      memset(buf, 0, sizeof(buf));
      v25 = PLMigrationGetLog();
      os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      v26 = (void *)v57[3];
      int v72 = 134217984;
      v73 = v26;
      LODWORD(v50) = 12;
      v27 = (uint8_t *)_os_log_send_and_compose_impl();

      v28 = [(PLModelMigrationActionBackground *)self logger];
      objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActionBackground.m", 1205, 0);

      if (v27 == buf) {
        goto LABEL_19;
      }
      v29 = v27;
LABEL_12:
      free(v29);
      goto LABEL_19;
    }
    v40 = PLMigrationGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = v57[3];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v41;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "Set initial hasPeopleSceneMidOrGreaterConfidence for %tu assets.", buf, 0xCu);
    }
  }
  else
  {
    v69[3] = 3;
    v30 = PLMigrationGetLog();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);

    if (!v31) {
      goto LABEL_19;
    }
    v32 = [(PLModelMigrationActionBackground *)self logger];
    BOOL v33 = v32 == 0;

    if (!v33)
    {
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
      memset(buf, 0, sizeof(buf));
      v34 = PLMigrationGetLog();
      os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
      v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      uint64_t v37 = v63[5];
      int v72 = 138543618;
      v73 = v36;
      __int16 v74 = 2114;
      uint64_t v75 = v37;
      LODWORD(v50) = 22;
      v38 = (uint8_t *)_os_log_send_and_compose_impl();

      v39 = [(PLModelMigrationActionBackground *)self logger];
      objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActionBackground.m", 1208, 16);

      if (v38 == buf) {
        goto LABEL_19;
      }
      v29 = v38;
      goto LABEL_12;
    }
    v40 = PLMigrationGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      uint64_t v44 = v63[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v44;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %{public}@", buf, 0x16u);
    }
  }

LABEL_19:
  if (v69[3] == 1) {
    [(PLModelMigrationActionBackground *)self setResumeMarkerValue:0];
  }
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  uint64_t v45 = v69[3];
  id v46 = (id)v63[5];
  v47 = v46;
  if (v45 != 1 && a4) {
    *a4 = v46;
  }

  int64_t v48 = v69[3];
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(v60, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  return v48;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end