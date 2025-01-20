@interface PLModelMigrationAction_PopulatePersonCloudDetectionType
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_PopulatePersonCloudDetectionType

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 1;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__53891;
  v61 = __Block_byref_object_dispose__53892;
  id v62 = 0;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLPerson entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"cloudDetectionType", 0);
  [v9 setPredicate:v10];

  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__53891;
  v55 = __Block_byref_object_dispose__53892;
  id v56 = 0;
  v11 = [PLEnumerateAndSaveController alloc];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  uint64_t v14 = [(PLModelMigrationActionCore *)self pathManager];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke;
  v49[3] = &unk_1E586FB88;
  id v15 = v6;
  id v50 = v15;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke_2;
  v48[3] = &unk_1E5870290;
  v48[4] = self;
  v48[5] = &v51;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke_3;
  v47[3] = &unk_1E586B478;
  v47[4] = self;
  v47[5] = &v57;
  v47[6] = &v63;
  v47[7] = &v51;
  v16 = [(PLEnumerateAndSaveController *)v11 initWithName:v13 fetchRequest:v9 context:v15 pathManager:v14 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v49 didFetchObjectIDsBlock:v48 processResultBlock:v47];

  v17 = (id *)(v58 + 5);
  id obj = (id)v58[5];
  LOBYTE(v14) = [(PLEnumerateAndSaveController *)v16 processObjectsWithError:&obj];
  objc_storeStrong(v17, obj);
  if (v14)
  {
    v18 = PLMigrationGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (!v19) {
      goto LABEL_16;
    }
    v20 = [(PLModelMigrationActionCore *)self logger];
    BOOL v21 = v20 == 0;

    if (!v21)
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
      v22 = PLMigrationGetLog();
      os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      uint64_t v23 = [(id)v52[5] totalUnitCount];
      int v67 = 134217984;
      uint64_t v68 = v23;
      LODWORD(v45) = 12;
      v24 = (uint8_t *)_os_log_send_and_compose_impl();

      v25 = [(PLModelMigrationActionCore *)self logger];
      objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_17000.m", 524, 0);

      goto LABEL_8;
    }
    v35 = PLMigrationGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [(id)v52[5] totalUnitCount];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v36;
      _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "Populated cloudDetectionType for %lld persons", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  v64[3] = 3;
  v26 = PLMigrationGetLog();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

  if (!v27) {
    goto LABEL_16;
  }
  v28 = [(PLModelMigrationActionCore *)self logger];
  BOOL v29 = v28 == 0;

  if (v29)
  {
    v35 = PLMigrationGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      uint64_t v39 = v58[5];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v39;
      _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %{public}@", buf, 0x16u);
    }
    goto LABEL_15;
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
  uint64_t v68 = (uint64_t)v32;
  __int16 v69 = 2114;
  uint64_t v70 = v33;
  LODWORD(v45) = 22;
  v24 = (uint8_t *)_os_log_send_and_compose_impl();

  v34 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_17000.m", 522, 16);

LABEL_8:
  if (v24 != buf) {
    free(v24);
  }
LABEL_16:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  uint64_t v40 = v64[3];
  id v41 = (id)v58[5];
  v42 = v41;
  if (v40 != 1 && a4) {
    *a4 = v41;
  }

  int64_t v43 = v64[3];
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  return v43;
}

@end