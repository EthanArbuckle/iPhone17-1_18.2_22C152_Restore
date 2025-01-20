@interface PLModelMigrationAction_UpdateAssetAdjustmentsState
+ (BOOL)isResetAfterRebuildRequiredWithLibrary:(id)a3;
+ (int64_t)actionProgressWeight;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_UpdateAssetAdjustmentsState

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 1;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__1142;
  v61 = __Block_byref_object_dispose__1143;
  id v62 = 0;
  v7 = +[PLManagedAsset fetchRequest];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"adjustmentsState", 1);
  [v7 setPredicate:v8];

  v102[0] = @"additionalAttributes.unmanagedAdjustment";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:1];
  [v7 setRelationshipKeyPathsForPrefetching:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setChangeSource:1];
  }
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__1142;
  v55[4] = __Block_byref_object_dispose__1143;
  id v56 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  v10 = [PLEnumerateAndSaveController alloc];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = [(PLModelMigrationActionBackground *)self pathManager];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke;
  v49[3] = &unk_1E586FB88;
  id v14 = v6;
  id v50 = v14;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke_2;
  v48[3] = &unk_1E5870290;
  v48[4] = self;
  v48[5] = v55;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke_3;
  v47[3] = &unk_1E586B428;
  v47[4] = self;
  v47[5] = &v57;
  v47[6] = &v63;
  v47[7] = &v51;
  v47[8] = v55;
  v15 = [(PLEnumerateAndSaveController *)v10 initWithName:v12 fetchRequest:v7 context:v14 pathManager:v13 concurrent:0 refreshAllAfterSave:0 generateContextBlock:v49 didFetchObjectIDsBlock:v48 processResultBlock:v47];

  v16 = (id *)(v58 + 5);
  id obj = (id)v58[5];
  LODWORD(v13) = [(PLEnumerateAndSaveController *)v15 processObjectsWithError:&obj];
  objc_storeStrong(v16, obj);
  if (v13)
  {
    v17 = PLMigrationGetLog();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (!v18) {
      goto LABEL_19;
    }
    v19 = [(PLModelMigrationActionBackground *)self logger];
    BOOL v20 = v19 == 0;

    if (!v20)
    {
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
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      memset(buf, 0, sizeof(buf));
      v21 = PLMigrationGetLog();
      os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      v22 = (void *)v52[3];
      int v67 = 134217984;
      v68 = v22;
      LODWORD(v45) = 12;
      v23 = (uint8_t *)_os_log_send_and_compose_impl();

      v24 = [(PLModelMigrationActionBackground *)self logger];
      objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActionBackground.m", 1082, 0);

      if (v23 != buf)
      {
        v25 = v23;
LABEL_12:
        free(v25);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    v36 = PLMigrationGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = v52[3];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v37;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Updated adjustmentsState for %tu assets.", buf, 0xCu);
    }
LABEL_18:

    goto LABEL_19;
  }
  v64[3] = 3;
  v26 = PLMigrationGetLog();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

  if (!v27) {
    goto LABEL_19;
  }
  v28 = [(PLModelMigrationActionBackground *)self logger];
  BOOL v29 = v28 == 0;

  if (v29)
  {
    v36 = PLMigrationGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      uint64_t v40 = v58[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v40;
      _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %{public}@", buf, 0x16u);
    }
    goto LABEL_18;
  }
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
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  memset(buf, 0, sizeof(buf));
  v30 = PLMigrationGetLog();
  os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
  v31 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v31);
  uint64_t v33 = v58[5];
  int v67 = 138543618;
  v68 = v32;
  __int16 v69 = 2114;
  uint64_t v70 = v33;
  LODWORD(v45) = 22;
  v34 = (uint8_t *)_os_log_send_and_compose_impl();

  v35 = [(PLModelMigrationActionBackground *)self logger];
  objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActionBackground.m", 1085, 16);

  if (v34 != buf)
  {
    v25 = v34;
    goto LABEL_12;
  }
LABEL_19:
  [(PLModelMigrationActionBackground *)self finalizeProgress];
  uint64_t v41 = v64[3];
  id v42 = (id)v58[5];
  v43 = v42;
  if (v41 != 1 && a4) {
    *a4 = v42;
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(v55, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  return 1;
}

+ (BOOL)isResetAfterRebuildRequiredWithLibrary:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__1142;
  v14[4] = __Block_byref_object_dispose__1143;
  id v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__PLModelMigrationAction_UpdateAssetAdjustmentsState_isResetAfterRebuildRequiredWithLibrary___block_invoke;
  v10[3] = &unk_1E5875A90;
  v12 = &v16;
  id v4 = v3;
  id v11 = v4;
  v13 = v14;
  [v4 performBlockAndWait:v10];
  BOOL v5 = 0;
  uint64_t v6 = v17[3];
  if (v6 && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = PLMigrationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Requesting background migration after rebuild", v9, 2u);
    }

    BOOL v5 = 1;
  }

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);

  return v5;
}

+ (int64_t)actionProgressWeight
{
  return 300;
}

@end