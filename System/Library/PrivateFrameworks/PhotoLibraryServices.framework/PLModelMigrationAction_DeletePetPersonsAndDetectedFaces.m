@interface PLModelMigrationAction_DeletePetPersonsAndDetectedFaces
- (int64_t)deleteManagedObjectsWithManagedObjectContext:(id)a3 entity:(Class)a4 predicate:(id)a5 pendingParentUnitCount:(int64_t)a6 deletedIdentifiers:(id *)a7 entityIdentifierKeyPath:(id)a8 error:(id *)a9;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_DeletePetPersonsAndDetectedFaces

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLModelMigrationActionCore *)self progress];
  uint64_t v8 = [v7 totalUnitCount];
  if (v8 >= 0) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v8 + 1;
  }
  uint64_t v10 = v9 >> 1;

  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"detectionType", &unk_1EEBF1EF8];
  id v28 = 0;
  int64_t v12 = [(PLModelMigrationAction_DeletePetPersonsAndDetectedFaces *)self deleteManagedObjectsWithManagedObjectContext:v6 entity:objc_opt_class() predicate:v11 pendingParentUnitCount:v10 deletedIdentifiers:&v28 entityIdentifierKeyPath:@"personUUID" error:a4];
  id v13 = v28;
  if (v12 == 1)
  {
    v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"detectionType", &unk_1EEBF1F10];
    int64_t v12 = [(PLModelMigrationAction_DeletePetPersonsAndDetectedFaces *)self deleteManagedObjectsWithManagedObjectContext:v6 entity:objc_opt_class() predicate:v14 pendingParentUnitCount:v10 deletedIdentifiers:0 entityIdentifierKeyPath:0 error:a4];
  }
  if ([v13 count])
  {
    v63 = @"RKPerson";
    v64[0] = v13;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
    v16 = [(PLModelMigrationActionCore *)self pathManager];
    v17 = [v16 photoDirectoryWithType:13 leafType:3 createIfNeeded:1 error:0];

    v18 = [v17 stringByAppendingPathComponent:@"recordstodelete.plist"];
    if (([v15 writeToFile:v18 atomically:1] & 1) == 0)
    {
      v19 = PLMigrationGetLog();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v20)
      {
        v21 = [(PLModelMigrationActionCore *)self logger];

        if (v21)
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
          long long v38 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          *(_OWORD *)buf = 0u;
          v22 = PLMigrationGetLog();
          os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
          int v29 = 138412290;
          v30 = v15;
          LODWORD(v27) = 12;
          v23 = (uint8_t *)_os_log_send_and_compose_impl();

          v24 = [(PLModelMigrationActionCore *)self logger];
          objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActions_17000.m", 233, 16);

          if (v23 != buf) {
            free(v23);
          }
        }
        else
        {
          v25 = PLMigrationGetLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v15;
            _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Failed to persist Person delete records to recordstodelete.plist: %@", buf, 0xCu);
          }
        }
      }
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];

  return v12;
}

- (int64_t)deleteManagedObjectsWithManagedObjectContext:(id)a3 entity:(Class)a4 predicate:(id)a5 pendingParentUnitCount:(int64_t)a6 deletedIdentifiers:(id *)a7 entityIdentifierKeyPath:(id)a8 error:(id *)a9
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a8;
  v16 = (void *)MEMORY[0x1E4F1C0D0];
  id v17 = a5;
  v18 = [(objc_class *)a4 entityName];
  v19 = [v16 fetchRequestWithEntityName:v18];

  [v19 setPredicate:v17];
  BOOL v20 = v14;
  [v19 setFetchBatchSize:100];
  id v69 = 0;
  v21 = [v14 executeFetchRequest:v19 error:&v69];
  id v22 = v69;
  v23 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v21 count], a6);
  uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
  long long v62 = (void *)v24;
  if (!v21)
  {
    v31 = v20;
    long long v32 = PLMigrationGetLog();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

    if (v33)
    {
      long long v34 = [(PLModelMigrationActionCore *)self logger];

      if (v34)
      {
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
        long long v75 = 0u;
        long long v76 = 0u;
        memset(buf, 0, sizeof(buf));
        long long v35 = PLMigrationGetLog();
        os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
        long long v36 = (objc_class *)objc_opt_class();
        long long v37 = NSStringFromClass(v36);
        int v70 = 138543618;
        v71 = v37;
        __int16 v72 = 2114;
        id v73 = v22;
        LODWORD(v58) = 22;
        long long v38 = (uint8_t *)_os_log_send_and_compose_impl();

        long long v39 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActions_17000.m", 200, 16);

        if (v38 != buf) {
          free(v38);
        }
      }
      else
      {
        long long v48 = PLMigrationGetLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          long long v49 = (objc_class *)objc_opt_class();
          long long v50 = NSStringFromClass(v49);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v50;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v22;
          _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
    id v51 = v22;
    int64_t v30 = 3;
    BOOL v20 = v31;
    goto LABEL_30;
  }
  v25 = (void *)v24;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __193__PLModelMigrationAction_DeletePetPersonsAndDetectedFaces_deleteManagedObjectsWithManagedObjectContext_entity_predicate_pendingParentUnitCount_deletedIdentifiers_entityIdentifierKeyPath_error___block_invoke;
  v63[3] = &unk_1E586B3B0;
  id v64 = v15;
  Class v68 = a4;
  id v65 = v25;
  id v66 = v20;
  id v67 = v23;
  v26 = [v66 enumerateWithIncrementalSaveUsingObjects:v21 withBlock:v63];
  uint64_t v27 = v26;
  if (v26) {
    BOOL v28 = v22 == 0;
  }
  else {
    BOOL v28 = 0;
  }
  char v29 = !v28;
  char v60 = v29;
  if (!v28)
  {
    int64_t v30 = 1;
    goto LABEL_28;
  }
  long long v59 = v20;
  id v22 = v26;
  long long v40 = PLMigrationGetLog();
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

  if (!v41) {
    goto LABEL_27;
  }
  long long v42 = [(PLModelMigrationActionCore *)self logger];

  if (!v42)
  {
    long long v52 = PLMigrationGetLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      long long v53 = (objc_class *)objc_opt_class();
      long long v54 = NSStringFromClass(v53);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v54;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %{public}@", buf, 0x16u);
    }
LABEL_27:
    int64_t v30 = 3;
    BOOL v20 = v59;
    goto LABEL_28;
  }
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
  long long v75 = 0u;
  long long v76 = 0u;
  memset(buf, 0, sizeof(buf));
  long long v43 = PLMigrationGetLog();
  os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
  long long v44 = (objc_class *)objc_opt_class();
  long long v45 = NSStringFromClass(v44);
  int v70 = 138543618;
  v71 = v45;
  __int16 v72 = 2114;
  id v73 = v22;
  LODWORD(v58) = 22;
  long long v46 = (uint8_t *)_os_log_send_and_compose_impl();

  long long v47 = [(PLModelMigrationActionCore *)self logger];
  objc_msgSend(v47, "logWithMessage:fromCodeLocation:type:", v46, "PLModelMigrationActions_17000.m", 196, 16);

  if (v46 != buf) {
    free(v46);
  }
  int64_t v30 = 3;
  BOOL v20 = v59;
LABEL_28:
  long long v55 = v62;

  id v51 = v22;
  if (v60)
  {
    int64_t v30 = 1;
    long long v56 = a7;
    goto LABEL_33;
  }
LABEL_30:
  long long v56 = a7;
  if (a9)
  {
    id v51 = v51;
    *a9 = v51;
  }
  long long v55 = v62;
LABEL_33:

  if (v56) {
    *long long v56 = (id)[v55 copy];
  }

  return v30;
}

@end