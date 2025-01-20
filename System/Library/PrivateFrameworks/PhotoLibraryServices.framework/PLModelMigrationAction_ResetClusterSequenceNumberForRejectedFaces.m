@interface PLModelMigrationAction_ResetClusterSequenceNumberForRejectedFaces
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_ResetClusterSequenceNumberForRejectedFaces

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v66[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  v8 = objc_msgSend(v6, "predicateWithFormat:", @"%K == %d", @"trainingType", 2);
  v65 = @"clusterSequenceNumber";
  v66[0] = &unk_1EEBEE160;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
  v10 = +[PLDetectedFace entityName];
  id v29 = 0;
  BOOL v11 = +[PLModelMigrator executeBatchUpdateWithEntityName:v10 predicate:v8 propertiesToUpdate:v9 managedObjectContext:v7 error:&v29];

  id v12 = v29;
  if (v11)
  {
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v13 = v12;
    int64_t v14 = 1;
  }
  else
  {
    v15 = PLMigrationGetLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      v17 = [(PLModelMigrationActionCore *)self logger];

      if (v17)
      {
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
        memset(buf, 0, sizeof(buf));
        v18 = PLMigrationGetLog();
        os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        int v30 = 138543618;
        v31 = v20;
        __int16 v32 = 2114;
        id v33 = v12;
        LODWORD(v28) = 22;
        v21 = (uint8_t *)_os_log_send_and_compose_impl();

        v22 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_16000.m", 841, 16);

        if (v21 != buf) {
          free(v21);
        }
      }
      else
      {
        v23 = PLMigrationGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = (objc_class *)objc_opt_class();
          v25 = NSStringFromClass(v24);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v12;
          _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to execute batch update request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    [(PLModelMigrationActionCore *)self finalizeProgress];
    id v26 = v12;
    if (a4) {
      *a4 = v26;
    }
    int64_t v14 = 3;
  }

  return v14;
}

@end