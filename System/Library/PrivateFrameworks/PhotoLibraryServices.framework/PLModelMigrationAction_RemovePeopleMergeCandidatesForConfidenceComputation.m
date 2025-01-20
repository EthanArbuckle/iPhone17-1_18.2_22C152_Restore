@interface PLModelMigrationAction_RemovePeopleMergeCandidatesForConfidenceComputation
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_RemovePeopleMergeCandidatesForConfidenceComputation

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 1;
  uint64_t v54 = 0;
  v55 = (id *)&v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__23954;
  v58 = __Block_byref_object_dispose__23955;
  id v59 = 0;
  v7 = +[PLPerson fetchRequest];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d || %K == %d", @"verifiedType", 1, @"verifiedType", 2);
  [v7 setPredicate:v8];

  v9 = v55 + 5;
  id obj = v55[5];
  v10 = [v6 executeFetchRequest:v7 error:&obj];
  objc_storeStrong(v9, obj);
  if ([v10 count])
  {
    v11 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v10 count], 0);
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    uint64_t v52 = 0;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __122__PLModelMigrationAction_RemovePeopleMergeCandidatesForConfidenceComputation_performActionWithManagedObjectContext_error___block_invoke;
    v44[3] = &unk_1E58673C0;
    v46 = &v49;
    v44[4] = self;
    v47 = &v54;
    v48 = &v60;
    id v12 = v11;
    id v45 = v12;
    v13 = [v6 enumerateWithIncrementalSaveUsingObjects:v10 withBlock:v44];
    if (v13 && !v55[5])
    {
      objc_storeStrong(v55 + 5, v13);
      v61[3] = 3;
    }
    if (v61[3] == 1)
    {
      v14 = PLMigrationGetLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (!v15) {
        goto LABEL_23;
      }
      v16 = [(PLModelMigrationActionCore *)self logger];
      BOOL v17 = v16 == 0;

      if (!v17)
      {
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
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        memset(buf, 0, sizeof(buf));
        v18 = PLMigrationGetLog();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        uint64_t v19 = v50[3];
        int v64 = 67109120;
        LODWORD(v65) = v19;
        LODWORD(v43) = 8;
        v20 = (uint8_t *)_os_log_send_and_compose_impl();

        v21 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_16000.m", 395, 0);

        if (v20 != buf)
        {
          v22 = v20;
LABEL_16:
          free(v22);
          goto LABEL_23;
        }
        goto LABEL_23;
      }
      v33 = PLMigrationGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = v50[3];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v34;
        _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "Updated merge candidates for %d verified persons", buf, 8u);
      }
    }
    else
    {
      v23 = PLMigrationGetLog();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (!v24) {
        goto LABEL_23;
      }
      v25 = [(PLModelMigrationActionCore *)self logger];
      BOOL v26 = v25 == 0;

      if (!v26)
      {
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
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        memset(buf, 0, sizeof(buf));
        v27 = PLMigrationGetLog();
        os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        id v30 = v55[5];
        int v64 = 138543618;
        v65 = v29;
        __int16 v66 = 2114;
        id v67 = v30;
        LODWORD(v43) = 22;
        v31 = (uint8_t *)_os_log_send_and_compose_impl();

        v32 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v31, "PLModelMigrationActions_16000.m", 397, 16);

        if (v31 != buf)
        {
          v22 = v31;
          goto LABEL_16;
        }
LABEL_23:

        _Block_object_dispose(&v49, 8);
        goto LABEL_24;
      }
      v33 = PLMigrationGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        id v37 = v55[5];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v37;
        _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Failed to save managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
      }
    }

    goto LABEL_23;
  }
  if (v55[5]) {
    v61[3] = 3;
  }
LABEL_24:
  [(PLModelMigrationActionCore *)self finalizeProgress];
  uint64_t v38 = v61[3];
  id v39 = v55[5];
  v40 = v39;
  if (v38 != 1 && a4) {
    *a4 = v39;
  }

  int64_t v41 = v61[3];
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  return v41;
}

@end