@interface PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  v88[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 1;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__53891;
  v47 = __Block_byref_object_dispose__53892;
  id v48 = 0;
  v7 = (void *)MEMORY[0x1E4F1C0D0];
  v8 = +[PLDetectedFace entityName];
  v9 = [v7 fetchRequestWithEntityName:v8];

  v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil || %K != nil", @"assetForTorso", @"personForTorso");
  [v9 setPredicate:v10];

  v88[0] = @"assetForTorso";
  v88[1] = @"personForTorso";
  v88[2] = @"assetForFace";
  v88[3] = @"personForFace";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:4];
  [v9 setRelationshipKeyPathsForPrefetching:v11];

  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__53891;
  v41[4] = __Block_byref_object_dispose__53892;
  id v42 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  uint64_t v15 = [(PLModelMigrationActionCore *)self pathManager];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke;
  v39[3] = &unk_1E586FB88;
  id v16 = v6;
  id v40 = v16;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke_2;
  v38[3] = &unk_1E5870290;
  v38[4] = self;
  v38[5] = v41;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke_3;
  v37[3] = &unk_1E586B400;
  v37[4] = self;
  v37[5] = &v43;
  v37[6] = &v49;
  v37[7] = v41;
  v17 = [(PLEnumerateAndSaveController *)v12 initWithName:v14 fetchRequest:v9 context:v16 pathManager:v15 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v39 didFetchObjectIDsBlock:v38 processResultBlock:v37];

  v18 = (id *)(v44 + 5);
  id obj = (id)v44[5];
  LOBYTE(v15) = [(PLEnumerateAndSaveController *)v17 processObjectsWithError:&obj];
  objc_storeStrong(v18, obj);
  if ((v15 & 1) == 0)
  {
    v50[3] = 3;
    v19 = PLMigrationGetLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (v20)
    {
      v21 = [(PLModelMigrationActionCore *)self logger];
      BOOL v22 = v21 == 0;

      if (v22)
      {
        v29 = PLMigrationGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          uint64_t v32 = v44[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v31;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v32;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
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
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        memset(buf, 0, sizeof(buf));
        v23 = PLMigrationGetLog();
        os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        uint64_t v26 = v44[5];
        int v53 = 138543618;
        v54 = v25;
        __int16 v55 = 2114;
        uint64_t v56 = v26;
        LODWORD(v35) = 22;
        v27 = (uint8_t *)_os_log_send_and_compose_impl();

        v28 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_17000.m", 397, 16);

        if (v27 != buf) {
          free(v27);
        }
      }
    }
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  if (a4) {
    *a4 = (id) v44[5];
  }
  int64_t v33 = v50[3];

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  return v33;
}

@end