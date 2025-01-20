@interface PLModelMigrationAction_PushAssetsWithPetSyncableFaces
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_PushAssetsWithPetSyncableFaces

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v101[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 1;
  uint64_t v55 = 0;
  v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__53891;
  v59 = __Block_byref_object_dispose__53892;
  id v60 = 0;
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  v7 = +[PLDetectedFace entityName];
  v8 = [v6 fetchRequestWithEntityName:v7];

  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"detectionType", &unk_1EEBF1F28];
  v10 = (void *)MEMORY[0x1E4F28BA0];
  v101[0] = v9;
  v11 = +[PLDetectedFace syncableFacesPredicate];
  v101[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:2];
  v13 = [v10 andPredicateWithSubpredicates:v12];
  [v8 setPredicate:v13];

  v100 = @"assetForFace";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
  [v8 setRelationshipKeyPathsForPrefetching:v14];

  v15 = v56 + 5;
  id obj = v56[5];
  v16 = [v5 executeFetchRequest:v8 error:&obj];
  objc_storeStrong(v15, obj);
  v17 = -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", [v16 count], 0);
  v18 = v17;
  if (v16)
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __101__PLModelMigrationAction_PushAssetsWithPetSyncableFaces_performActionWithManagedObjectContext_error___block_invoke;
    v50[3] = &unk_1E586B3D8;
    v50[4] = self;
    v52 = &v55;
    v53 = &v61;
    id v51 = v17;
    v19 = [v5 enumerateWithIncrementalSaveUsingObjects:v16 withBlock:v50];
    if (v19)
    {
      if (!v56[5])
      {
        objc_storeStrong(v56 + 5, v19);
        v62[3] = 3;
        v20 = PLMigrationGetLog();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

        if (v21)
        {
          v22 = [(PLModelMigrationActionCore *)self logger];
          BOOL v23 = v22 == 0;

          if (v23)
          {
            v42 = PLMigrationGetLog();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              v43 = (objc_class *)objc_opt_class();
              v44 = NSStringFromClass(v43);
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v44;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v19;
              _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "[PushAssetsWithPetSyncableFaces] Failed to perform a save operation for %{public}@. Error: %{public}@", buf, 0x16u);
            }
          }
          else
          {
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
            long long v70 = 0u;
            long long v71 = 0u;
            memset(buf, 0, sizeof(buf));
            v48 = PLMigrationGetLog();
            os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
            v24 = (objc_class *)objc_opt_class();
            v25 = NSStringFromClass(v24);
            int v65 = 138543618;
            v66 = v25;
            __int16 v67 = 2114;
            v68 = v19;
            LODWORD(v47) = 22;
            v26 = (uint8_t *)_os_log_send_and_compose_impl();

            v27 = [(PLModelMigrationActionCore *)self logger];
            objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigrationActions_17000.m", 347, 16);

            if (v26 != buf) {
              free(v26);
            }
          }
        }
      }
    }
  }
  else
  {
    v62[3] = 3;
    v28 = PLMigrationGetLog();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

    if (v29)
    {
      v30 = [(PLModelMigrationActionCore *)self logger];
      BOOL v31 = v30 == 0;

      if (v31)
      {
        v38 = PLMigrationGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = (objc_class *)objc_opt_class();
          v40 = NSStringFromClass(v39);
          id v41 = v56[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v41;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "[PushAssetsWithPetSyncableFaces] Failed to execute fetch request for %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
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
        long long v70 = 0u;
        long long v71 = 0u;
        memset(buf, 0, sizeof(buf));
        v32 = PLMigrationGetLog();
        os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        id v35 = v56[5];
        int v65 = 138543618;
        v66 = v34;
        __int16 v67 = 2114;
        v68 = v35;
        LODWORD(v47) = 22;
        v36 = (uint8_t *)_os_log_send_and_compose_impl();

        v37 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActions_17000.m", 351, 16);

        if (v36 != buf) {
          free(v36);
        }
      }
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = v56[5];
  }
  int64_t v45 = v62[3];

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  return v45;
}

@end