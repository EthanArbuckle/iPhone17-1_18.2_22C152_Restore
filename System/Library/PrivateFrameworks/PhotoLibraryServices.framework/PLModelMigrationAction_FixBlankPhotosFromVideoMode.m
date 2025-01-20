@interface PLModelMigrationAction_FixBlankPhotosFromVideoMode
- (id)buildFetchRequest;
- (id)startDate;
- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4;
@end

@implementation PLModelMigrationAction_FixBlankPhotosFromVideoMode

- (id)startDate
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v2 setDay:3];
  [v2 setMonth:5];
  [v2 setYear:2024];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v5 = [v4 dateFromComponents:v2];

  return v5;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v43 = [(PLModelMigrationAction_FixBlankPhotosFromVideoMode *)self buildFetchRequest];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__43798;
  v53 = __Block_byref_object_dispose__43799;
  id v54 = 0;
  v8 = [PLEnumerateAndSaveController alloc];
  v9 = [(PLModelMigrationActionCore *)self pathManager];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke;
  v47[3] = &unk_1E586FB88;
  id v10 = v5;
  id v48 = v10;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke_2;
  v46[3] = &unk_1E5870290;
  v46[4] = self;
  v46[5] = &v49;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke_3;
  v45[3] = &unk_1E5869F90;
  v45[4] = &v49;
  v11 = [(PLEnumerateAndSaveController *)v8 initWithName:v7 fetchRequest:v43 context:v10 pathManager:v9 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v47 didFetchObjectIDsBlock:v46 processResultBlock:v45];

  id v44 = 0;
  BOOL v12 = [(PLEnumerateAndSaveController *)v11 processObjectsWithError:&v44];
  id v13 = v44;
  if (v12)
  {
    v14 = PLMigrationGetLog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

    if (v15)
    {
      v16 = [(PLModelMigrationActionCore *)self logger];
      BOOL v17 = v16 == 0;

      if (v17)
      {
        v31 = PLMigrationGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = [(id)v50[5] completedUnitCount];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v32;
          _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_INFO, "Completed photo recovery on %lu assets", buf, 0xCu);
        }
      }
      else
      {
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
        memset(buf, 0, sizeof(buf));
        v18 = PLMigrationGetLog();
        os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        uint64_t v19 = [(id)v50[5] completedUnitCount];
        int v55 = 134217984;
        uint64_t v56 = v19;
        LODWORD(v41) = 12;
        v20 = (uint8_t *)_os_log_send_and_compose_impl();

        v21 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_18000.m", 1515, 1);

        if (v20 != buf) {
          free(v20);
        }
      }
    }
    int64_t v33 = 1;
  }
  else
  {
    v22 = PLMigrationGetLog();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

    if (v23)
    {
      v24 = [(PLModelMigrationActionCore *)self logger];
      BOOL v25 = v24 == 0;

      if (v25)
      {
        v34 = PLMigrationGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = (objc_class *)objc_opt_class();
          v36 = NSStringFromClass(v35);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v36;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v13;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to process %{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
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
        memset(buf, 0, sizeof(buf));
        v26 = PLMigrationGetLog();
        os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        int v55 = 138543618;
        uint64_t v56 = (uint64_t)v28;
        __int16 v57 = 2114;
        id v58 = v13;
        LODWORD(v41) = 22;
        v29 = (uint8_t *)_os_log_send_and_compose_impl();

        v30 = [(PLModelMigrationActionCore *)self logger];
        objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_18000.m", 1518, 16);

        if (v29 != buf) {
          free(v29);
        }
      }
    }
    int64_t v33 = 3;
  }
  [(PLModelMigrationActionCore *)self finalizeProgress];
  id v37 = v13;
  v38 = v37;
  if (a4) {
    char v39 = v12;
  }
  else {
    char v39 = 1;
  }
  if ((v39 & 1) == 0) {
    *a4 = v37;
  }

  _Block_object_dispose(&v49, 8);
  return v33;
}

- (id)buildFetchRequest
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  v4 = +[PLManagedAsset entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  v6 = (void *)MEMORY[0x1E4F28BA0];
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"kind", 0);
  v16[0] = v7;
  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uniformTypeIdentifier", *MEMORY[0x1E4F44410]];
  v16[1] = v8;
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"adjustmentsState", 3);
  v16[2] = v9;
  id v10 = (void *)MEMORY[0x1E4F28F60];
  v11 = [(PLModelMigrationAction_FixBlankPhotosFromVideoMode *)self startDate];
  BOOL v12 = [v10 predicateWithFormat:@"%K >= %@", @"dateCreated", v11];
  v16[3] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  v14 = [v6 andPredicateWithSubpredicates:v13];
  [v5 setPredicate:v14];

  [v5 setFetchBatchSize:100];
  return v5;
}

@end