@interface PLModelMigrationActionUtility
+ (BOOL)processExtendedAttributesWithAction:(id)a3 asset:(id)a4 metadata:(id)a5 error:(id *)a6;
+ (int64_t)processManagedObjectBatchesWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 pendingParentUnitCount:(int64_t)a6 useObjectIDResumeMarker:(BOOL)a7 error:(id *)a8 processingBlock:(id)a9;
+ (int64_t)processManagedObjectWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 useObjectIDResumeMarker:(BOOL)a6 error:(id *)a7 processingBlock:(id)a8;
+ (int64_t)processManagedObjectsWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 pendingParentUnitCount:(int64_t)a6 error:(id *)a7 processingBlock:(id)a8;
+ (int64_t)removeFromDuplicatesWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 requiresTokenReset:(BOOL)a6 error:(id *)a7;
+ (int64_t)removeOrphanedObjectsWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 error:(id *)a6;
+ (int64_t)resetDuplicateProcessingWithAction:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
+ (int64_t)updateExtendedAttributesWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 useObjectIDResumeMarker:(BOOL)a6 error:(id *)a7;
@end

@implementation PLModelMigrationActionUtility

+ (int64_t)processManagedObjectsWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 pendingParentUnitCount:(int64_t)a6 error:(id *)a7 processingBlock:(id)a8
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__16658;
  v96 = __Block_byref_object_dispose__16659;
  id v97 = 0;
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__16658;
  v90 = __Block_byref_object_dispose__16659;
  id v91 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  uint64_t v85 = 1;
  v16 = (objc_class *)objc_opt_class();
  v68 = NSStringFromClass(v16);
  if (v15)
  {
    [v14 setFetchBatchSize:100];
    v66 = [PLEnumerateAndSaveController alloc];
    v17 = [v12 pathManager];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke;
    v80[3] = &unk_1E586FB88;
    id v81 = v13;
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_2;
    v76[3] = &unk_1E5865A30;
    v78 = &v86;
    id v77 = v12;
    int64_t v79 = a6;
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_3;
    v70[3] = &unk_1E5865A80;
    id v72 = v15;
    v73 = &v86;
    id v18 = v77;
    id v71 = v18;
    v74 = &v82;
    v75 = &v92;
    v19 = [(PLEnumerateAndSaveController *)v66 initWithName:v68 fetchRequest:v14 context:v81 pathManager:v17 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v80 didFetchObjectIDsBlock:v76 processResultBlock:v70];

    id v69 = 0;
    BOOL v20 = [(PLEnumerateAndSaveController *)v19 processObjectsWithError:&v69];
    id v21 = v69;
    if (v20)
    {
      if ([(PLEnumerateAndSaveController *)v19 isCancelled])
      {
        id v22 = (id)v93[5];

        v23 = PLMigrationGetLog();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

        if (v24)
        {
          v25 = [v18 logger];
          BOOL v26 = v25 == 0;

          if (v26)
          {
            v62 = PLMigrationGetLog();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v63 = [(id)v87[5] completedUnitCount];
              *(_DWORD *)buf = 134218242;
              *(void *)&buf[4] = v63;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v22;
              _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_DEFAULT, "Cancelled operation after update of %lld objects. Error: %@", buf, 0x16u);
            }
          }
          else
          {
            long long v131 = 0u;
            long long v132 = 0u;
            long long v129 = 0u;
            long long v130 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            long long v125 = 0u;
            long long v126 = 0u;
            long long v123 = 0u;
            long long v124 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            long long v119 = 0u;
            long long v120 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            memset(buf, 0, sizeof(buf));
            v27 = PLMigrationGetLog();
            os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            uint64_t v28 = [(id)v87[5] completedUnitCount];
            int v98 = 134218242;
            uint64_t v99 = v28;
            __int16 v100 = 2112;
            id v101 = v22;
            LODWORD(v65) = 22;
            v29 = (uint8_t *)_os_log_send_and_compose_impl();

            v30 = objc_msgSend(v18, "logger", &v98, v65);
            objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActionUtility.m", 317, 0);

            if (v29 != buf) {
              free(v29);
            }
          }
        }
        goto LABEL_33;
      }
      v46 = PLMigrationGetLog();
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);

      if (!v47) {
        goto LABEL_32;
      }
      v48 = [v18 logger];
      BOOL v49 = v48 == 0;

      if (!v49)
      {
        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        memset(buf, 0, sizeof(buf));
        v50 = PLMigrationGetLog();
        os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
        uint64_t v51 = [(id)v87[5] completedUnitCount];
        int v98 = 134217984;
        uint64_t v99 = v51;
        LODWORD(v65) = 12;
        v52 = (uint8_t *)_os_log_send_and_compose_impl();

        v53 = objc_msgSend(v18, "logger", &v98, v65);
        objc_msgSend(v53, "logWithMessage:fromCodeLocation:type:", v52, "PLModelMigrationActionUtility.m", 319, 0);

        if (v52 != buf)
        {
          v45 = v52;
          goto LABEL_21;
        }
        goto LABEL_32;
      }
      v56 = PLMigrationGetLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v57 = [(id)v87[5] completedUnitCount];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v57;
        _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_DEFAULT, "Completed update of %lld objects.", buf, 0xCu);
      }
    }
    else
    {
      if (v83[3] == 2) {
        goto LABEL_32;
      }
      v83[3] = 3;
      v38 = PLMigrationGetLog();
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);

      if (!v39) {
        goto LABEL_32;
      }
      v40 = [v18 logger];
      BOOL v41 = v40 == 0;

      if (!v41)
      {
        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        memset(buf, 0, sizeof(buf));
        v42 = PLMigrationGetLog();
        os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
        int v98 = 138543618;
        uint64_t v99 = (uint64_t)v68;
        __int16 v100 = 2112;
        id v101 = v21;
        LODWORD(v65) = 22;
        v43 = (uint8_t *)_os_log_send_and_compose_impl();

        v44 = objc_msgSend(v18, "logger", &v98, v65);
        objc_msgSend(v44, "logWithMessage:fromCodeLocation:type:", v43, "PLModelMigrationActionUtility.m", 323, 16);

        if (v43 != buf)
        {
          v45 = v43;
LABEL_21:
          free(v45);
        }
LABEL_32:
        id v22 = v21;
LABEL_33:
        uint64_t v58 = v83[3];
        id v59 = v22;
        v60 = v59;
        if (v58 != 1 && a7) {
          *a7 = v59;
        }

        int64_t v55 = v83[3];
        goto LABEL_37;
      }
      v56 = PLMigrationGetLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v68;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %@", buf, 0x16u);
      }
    }

    goto LABEL_32;
  }
  v31 = PLMigrationGetLog();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);

  if (v32)
  {
    v33 = [v12 logger];
    BOOL v34 = v33 == 0;

    if (v34)
    {
      v54 = PLMigrationGetLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v68;
        _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_INFO, "Missing processing block for %{public}@", buf, 0xCu);
      }
    }
    else
    {
      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      memset(buf, 0, sizeof(buf));
      v35 = PLMigrationGetLog();
      os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
      int v98 = 138543362;
      uint64_t v99 = (uint64_t)v68;
      LODWORD(v64) = 12;
      v36 = (uint8_t *)_os_log_send_and_compose_impl();

      v37 = objc_msgSend(v12, "logger", &v98, v64);
      objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActionUtility.m", 284, 1);

      if (v36 != buf) {
        free(v36);
      }
    }
  }
  int64_t v55 = v83[3];
LABEL_37:

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v86, 8);

  _Block_object_dispose(&v92, 8);
  return v55;
}

id __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), *(void *)(a1 + 48));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  unint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) completedUnitCount];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_4;
  v14[3] = &unk_1E5875E68;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  id v15 = v7;
  uint64_t v16 = v8;
  if (v6 && !(v6 % 0x3E8)) {
    __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_4((uint64_t)v14);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1)
  {
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v10 + 40);
    int v11 = [v9 isCancelledWithError:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);
    if (v11)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  id v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "completedUnitCount") + 1);
}

void __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = PLMigrationGetLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) logger];

    if (v4)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      *(_OWORD *)buf = 0u;
      long long v15 = 0u;
      v5 = PLMigrationGetLog();
      os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) completedUnitCount];
      int v12 = 134217984;
      uint64_t v13 = v6;
      LODWORD(v11) = 12;
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();

      uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "logger", &v12, v11);
      objc_msgSend(v8, "logWithMessage:fromCodeLocation:type:", v7, "PLModelMigrationActionUtility.m", 299, 1);

      if (v7 != buf) {
        free(v7);
      }
    }
    else
    {
      v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) completedUnitCount];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Updated %lld objects", buf, 0xCu);
      }
    }
  }
}

+ (int64_t)processManagedObjectBatchesWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 pendingParentUnitCount:(int64_t)a6 useObjectIDResumeMarker:(BOOL)a7 error:(id *)a8 processingBlock:(id)a9
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a9;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 1;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__16658;
  v53[4] = __Block_byref_object_dispose__16659;
  id v54 = 0;
  uint64_t v47 = 0;
  v48 = (id *)&v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__16658;
  uint64_t v51 = __Block_byref_object_dispose__16659;
  id v52 = 0;
  long long v16 = (objc_class *)objc_opt_class();
  long long v17 = NSStringFromClass(v16);
  long long v33 = [PLEnumerateAndSaveController alloc];
  long long v18 = [v12 pathManager];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __174__PLModelMigrationActionUtility_processManagedObjectBatchesWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_useObjectIDResumeMarker_error_processingBlock___block_invoke;
  v45[3] = &unk_1E586FB88;
  id v19 = v13;
  id v46 = v19;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __174__PLModelMigrationActionUtility_processManagedObjectBatchesWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_useObjectIDResumeMarker_error_processingBlock___block_invoke_2;
  v41[3] = &unk_1E5865A30;
  long long v43 = v53;
  id v42 = v12;
  int64_t v44 = a6;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __174__PLModelMigrationActionUtility_processManagedObjectBatchesWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_useObjectIDResumeMarker_error_processingBlock___block_invoke_3;
  v35[3] = &unk_1E5865A58;
  long long v38 = &v55;
  id v32 = v15;
  id v37 = v32;
  long long v39 = v53;
  long long v40 = &v47;
  id v20 = v42;
  id v36 = v20;
  long long v21 = [(PLEnumerateAndSaveController *)v33 initWithName:v17 fetchRequest:v14 context:v19 pathManager:v18 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v45 didFetchObjectIDsBlock:v41 processResultsBlock:v35];

  id v34 = 0;
  BOOL v22 = [(PLEnumerateAndSaveController *)v21 processObjectsWithError:&v34];
  id v23 = v34;
  id v24 = v34;
  if (!v22)
  {
    v56[3] = 3;
    objc_storeStrong(v48 + 5, v23);
  }
  if (v56[3] == 1)
  {
    [v20 setResumeMarkerValue:0];
    long long v25 = v20;
    uint64_t v26 = v56[3];
    id v27 = v48[5];
    long long v28 = v32;
    if (v26 == 1) {
      goto LABEL_9;
    }
  }
  else
  {
    long long v25 = v20;
    id v27 = v48[5];
    long long v28 = v32;
  }
  if (a8)
  {
    id v27 = v27;
    *a8 = v27;
  }
LABEL_9:

  int64_t v29 = v56[3];
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(&v55, 8);

  return v29;
}

id __174__PLModelMigrationActionUtility_processManagedObjectBatchesWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_useObjectIDResumeMarker_error_processingBlock___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __174__PLModelMigrationActionUtility_processManagedObjectBatchesWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_useObjectIDResumeMarker_error_processingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), *(void *)(a1 + 48));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __174__PLModelMigrationActionUtility_processManagedObjectBatchesWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_useObjectIDResumeMarker_error_processingBlock___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = a1[5];
  obj[1] = 0;
  uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
  id v9 = 0;
  *(void *)(*(void *)(a1[6] + 8) + 24) = v8;
  uint64_t v10 = *(void **)(*(void *)(a1[7] + 8) + 40);
  objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + objc_msgSend(v6, "count"));
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == 1)
  {
    uint64_t v11 = [v6 lastObject];
    id v12 = [v11 objectID];

    id v13 = (void *)a1[4];
    uint64_t v14 = *(void *)(a1[8] + 8);
    obj[0] = *(id *)(v14 + 40);
    int v15 = [v13 isCancelledWithResumeMarker:v12 error:obj];
    objc_storeStrong((id *)(v14 + 40), obj[0]);
    if (v15)
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), 0);
    *a4 = 1;
  }
}

+ (int64_t)processManagedObjectWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 useObjectIDResumeMarker:(BOOL)a6 error:(id *)a7 processingBlock:(id)a8
{
  BOOL v9 = a6;
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v102 = 0;
  long long v103 = &v102;
  uint64_t v104 = 0x3032000000;
  long long v105 = __Block_byref_object_copy__16658;
  long long v106 = __Block_byref_object_dispose__16659;
  id v107 = 0;
  uint64_t v96 = 0;
  id v97 = &v96;
  uint64_t v98 = 0x3032000000;
  uint64_t v99 = __Block_byref_object_copy__16658;
  __int16 v100 = __Block_byref_object_dispose__16659;
  id v101 = 0;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  uint64_t v95 = 1;
  id v78 = a8;
  if (v78)
  {
    [v14 setFetchBatchSize:100];
    v76 = [PLEnumerateAndSaveController alloc];
    int v15 = (objc_class *)objc_opt_class();
    long long v16 = NSStringFromClass(v15);
    long long v17 = [v12 pathManager];
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __144__PLModelMigrationActionUtility_processManagedObjectWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke;
    v90[3] = &unk_1E586FB88;
    id v91 = v13;
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __144__PLModelMigrationActionUtility_processManagedObjectWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_2;
    v87[3] = &unk_1E5870290;
    v89 = &v96;
    id v88 = v12;
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __144__PLModelMigrationActionUtility_processManagedObjectWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_3;
    v80[3] = &unk_1E5865A08;
    id v82 = v78;
    v83 = &v96;
    id v18 = v88;
    id v81 = v18;
    uint64_t v84 = &v92;
    BOOL v86 = v9;
    uint64_t v85 = &v102;
    id v19 = [(PLEnumerateAndSaveController *)v76 initWithName:v16 fetchRequest:v14 context:v91 pathManager:v17 concurrent:0 refreshAllAfterSave:1 generateContextBlock:v90 didFetchObjectIDsBlock:v87 processResultBlock:v80];

    id v79 = 0;
    LODWORD(v17) = [(PLEnumerateAndSaveController *)v19 processObjectsWithError:&v79];
    id v20 = v79;
    if (v17)
    {
      if ([(PLEnumerateAndSaveController *)v19 isCancelled])
      {
        id v21 = (id)v103[5];

        BOOL v22 = PLMigrationGetLog();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

        if (v23)
        {
          id v24 = [v18 logger];
          BOOL v25 = v24 == 0;

          if (v25)
          {
            id v72 = PLMigrationGetLog();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v73 = [(id)v97[5] completedUnitCount];
              *(_DWORD *)buf = 134218242;
              *(void *)&buf[4] = v73;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v21;
              _os_log_impl(&dword_19B3C7000, v72, OS_LOG_TYPE_DEFAULT, "Cancelled operation after update of %lld assets. Error: %@", buf, 0x16u);
            }
          }
          else
          {
            long long v141 = 0u;
            long long v142 = 0u;
            long long v139 = 0u;
            long long v140 = 0u;
            long long v137 = 0u;
            long long v138 = 0u;
            long long v135 = 0u;
            long long v136 = 0u;
            long long v133 = 0u;
            long long v134 = 0u;
            long long v131 = 0u;
            long long v132 = 0u;
            long long v129 = 0u;
            long long v130 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            long long v125 = 0u;
            long long v126 = 0u;
            long long v123 = 0u;
            long long v124 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            long long v119 = 0u;
            long long v120 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            memset(buf, 0, sizeof(buf));
            uint64_t v26 = PLMigrationGetLog();
            os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
            uint64_t v27 = [(id)v97[5] completedUnitCount];
            int v108 = 134218242;
            uint64_t v109 = v27;
            __int16 v110 = 2112;
            id v111 = v21;
            LODWORD(v75) = 22;
            long long v28 = (uint8_t *)_os_log_send_and_compose_impl();

            int64_t v29 = objc_msgSend(v18, "logger", &v108, v75);
            objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActionUtility.m", 221, 0);

            if (v28 != buf) {
              free(v28);
            }
          }
        }
        goto LABEL_33;
      }
      v50 = PLMigrationGetLog();
      BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);

      if (v51)
      {
        id v52 = [v18 logger];
        BOOL v53 = v52 == 0;

        if (v53)
        {
          uint64_t v65 = PLMigrationGetLog();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v66 = [(id)v97[5] completedUnitCount];
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = v66;
            _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_DEFAULT, "Completed update of %lld assets.", buf, 0xCu);
          }

          goto LABEL_32;
        }
        long long v141 = 0u;
        long long v142 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        memset(buf, 0, sizeof(buf));
        id v54 = PLMigrationGetLog();
        os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
        uint64_t v55 = [(id)v97[5] completedUnitCount];
        int v108 = 134217984;
        uint64_t v109 = v55;
        LODWORD(v75) = 12;
        v56 = (uint8_t *)_os_log_send_and_compose_impl();

        uint64_t v57 = objc_msgSend(v18, "logger", &v108, v75);
        objc_msgSend(v57, "logWithMessage:fromCodeLocation:type:", v56, "PLModelMigrationActionUtility.m", 223, 0);

        if (v56 != buf)
        {
          uint64_t v49 = v56;
          goto LABEL_21;
        }
      }
    }
    else if (v93[3] != 2)
    {
      v93[3] = 3;
      long long v40 = PLMigrationGetLog();
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

      if (v41)
      {
        id v42 = [v18 logger];
        BOOL v43 = v42 == 0;

        if (v43)
        {
          v62 = PLMigrationGetLog();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            uint64_t v63 = (objc_class *)objc_opt_class();
            uint64_t v64 = NSStringFromClass(v63);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v64;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v20;
            _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %@", buf, 0x16u);
          }
          goto LABEL_32;
        }
        long long v141 = 0u;
        long long v142 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        memset(buf, 0, sizeof(buf));
        int64_t v44 = PLMigrationGetLog();
        os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
        long long v45 = (objc_class *)objc_opt_class();
        id v46 = NSStringFromClass(v45);
        int v108 = 138543618;
        uint64_t v109 = (uint64_t)v46;
        __int16 v110 = 2112;
        id v111 = v20;
        LODWORD(v75) = 22;
        uint64_t v47 = (uint8_t *)_os_log_send_and_compose_impl();

        v48 = objc_msgSend(v18, "logger", &v108, v75);
        objc_msgSend(v48, "logWithMessage:fromCodeLocation:type:", v47, "PLModelMigrationActionUtility.m", 227, 16);

        if (v47 != buf)
        {
          uint64_t v49 = v47;
LABEL_21:
          free(v49);
        }
      }
    }
LABEL_32:
    id v21 = v20;
LABEL_33:
    v67 = v93;
    if (v9 && v93[3] == 1)
    {
      [v18 setResumeMarkerValue:0];
      v67 = v93;
    }
    uint64_t v68 = v67[3];
    id v69 = v21;
    v70 = v69;
    if (v68 != 1 && a7) {
      *a7 = v69;
    }

    int64_t v61 = v93[3];
    goto LABEL_40;
  }
  long long v30 = PLMigrationGetLog();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);

  if (v31)
  {
    id v32 = [v12 logger];
    BOOL v33 = v32 == 0;

    if (v33)
    {
      uint64_t v58 = PLMigrationGetLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        id v59 = (objc_class *)objc_opt_class();
        v60 = NSStringFromClass(v59);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v60;
        _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_INFO, "Missing processing block for %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v34 = v12;
      long long v141 = 0u;
      long long v142 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      memset(buf, 0, sizeof(buf));
      long long v35 = PLMigrationGetLog();
      os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
      id v36 = (objc_class *)objc_opt_class();
      id v37 = NSStringFromClass(v36);
      int v108 = 138543362;
      uint64_t v109 = (uint64_t)v37;
      LODWORD(v74) = 12;
      long long v38 = (uint8_t *)_os_log_send_and_compose_impl();

      id v12 = v34;
      long long v39 = objc_msgSend(v34, "logger", &v108, v74);
      objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActionUtility.m", 183, 1);

      if (v38 != buf) {
        free(v38);
      }
    }
  }
  int64_t v61 = v93[3];
LABEL_40:
  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v96, 8);

  _Block_object_dispose(&v102, 8);
  return v61;
}

id __144__PLModelMigrationActionUtility_processManagedObjectWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __144__PLModelMigrationActionUtility_processManagedObjectWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __144__PLModelMigrationActionUtility_processManagedObjectWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  unint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) completedUnitCount];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __144__PLModelMigrationActionUtility_processManagedObjectWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_4;
  v16[3] = &unk_1E5875E68;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v17 = v8;
  uint64_t v18 = v9;
  if (v7 && !(v7 % 0x3E8)) {
    __144__PLModelMigrationActionUtility_processManagedObjectWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_4((uint64_t)v16);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v10 = [v6 objectID];
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v12 + 40);
    int v13 = [v11 isCancelledWithResumeMarker:v10 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    if (v13)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  id v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_msgSend(v14, "setCompletedUnitCount:", objc_msgSend(v14, "completedUnitCount") + 1);
}

void __144__PLModelMigrationActionUtility_processManagedObjectWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = PLMigrationGetLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) logger];

    if (v4)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      *(_OWORD *)buf = 0u;
      long long v15 = 0u;
      v5 = PLMigrationGetLog();
      os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) completedUnitCount];
      int v12 = 134217984;
      uint64_t v13 = v6;
      LODWORD(v11) = 12;
      unint64_t v7 = (uint8_t *)_os_log_send_and_compose_impl();

      id v8 = objc_msgSend(*(id *)(a1 + 32), "logger", &v12, v11);
      objc_msgSend(v8, "logWithMessage:fromCodeLocation:type:", v7, "PLModelMigrationActionUtility.m", 198, 1);

      if (v7 != buf) {
        free(v7);
      }
    }
    else
    {
      uint64_t v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) completedUnitCount];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Updated %lld assets", buf, 0xCu);
      }
    }
  }
}

+ (int64_t)resetDuplicateProcessingWithAction:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 cancellableDiscreteProgressWithTotalUnitCount:1 pendingParentUnitCount:0];
  uint64_t v10 = [[PLGlobalValues alloc] initWithManagedObjectContext:v8];
  [(PLGlobalValues *)v10 setLastDuplicateDetectorProcessingToken:0];
  [(PLGlobalValues *)v10 setLastInitialDuplicateDetectorProcessingCompletedToken:0];
  id v53 = 0;
  char v11 = [v8 save:&v53];

  id v12 = v53;
  if (v11)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F8B858];
    id v14 = [v7 pathManager];
    long long v15 = [v14 libraryURL];
    long long v16 = [v13 appPrivateDataForLibraryURL:v15];

    id v52 = v12;
    char v17 = [v16 setValue:0 forKey:@"DuplicateProcessingLibraryInterruptMarker" error:&v52];
    id v18 = v52;

    if (v17)
    {
      int64_t v19 = 1;
    }
    else
    {
      long long v28 = PLMigrationGetLog();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

      if (v29)
      {
        long long v30 = [v7 logger];

        if (v30)
        {
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
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          memset(buf, 0, sizeof(buf));
          long long v31 = PLMigrationGetLog();
          os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
          long long v32 = (objc_class *)objc_opt_class();
          long long v33 = NSStringFromClass(v32);
          int v54 = 138543618;
          uint64_t v55 = v33;
          __int16 v56 = 2112;
          id v57 = v18;
          LODWORD(v51) = 22;
          long long v34 = (uint8_t *)_os_log_send_and_compose_impl();

          long long v35 = objc_msgSend(v7, "logger", &v54, v51);
          objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActionUtility.m", 165, 0);

          if (v34 != buf) {
            free(v34);
          }
        }
        else
        {
          long long v40 = PLMigrationGetLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            long long v41 = (objc_class *)objc_opt_class();
            long long v42 = NSStringFromClass(v41);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v42;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v18;
            _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "Failed to set the interrupt marker for %{public}@. Error: %@", buf, 0x16u);
          }
        }
      }
      int64_t v19 = 3;
    }
    [v9 setCompletedUnitCount:1];
    long long v43 = PLMigrationGetLog();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);

    if (v44)
    {
      long long v45 = [v7 logger];

      if (v45)
      {
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
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        memset(buf, 0, sizeof(buf));
        uint64_t v46 = PLMigrationGetLog();
        os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
        LOWORD(v54) = 0;
        LODWORD(v51) = 2;
        uint64_t v47 = (uint8_t *)_os_log_send_and_compose_impl();

        v48 = objc_msgSend(v7, "logger", &v54, v51);
        objc_msgSend(v48, "logWithMessage:fromCodeLocation:type:", v47, "PLModelMigrationActionUtility.m", 168, 0);

        if (v47 != buf) {
          free(v47);
        }
      }
      else
      {
        uint64_t v49 = PLMigrationGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_DEFAULT, "Cleared duplicate detector processing token", buf, 2u);
        }
      }
    }

    id v39 = v18;
    if (v17)
    {
      int64_t v19 = 1;
      goto LABEL_32;
    }
  }
  else
  {
    long long v20 = PLMigrationGetLog();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

    if (v21)
    {
      long long v22 = [v7 logger];

      if (v22)
      {
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
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        memset(buf, 0, sizeof(buf));
        long long v23 = PLMigrationGetLog();
        os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
        long long v24 = (objc_class *)objc_opt_class();
        long long v25 = NSStringFromClass(v24);
        int v54 = 138543618;
        uint64_t v55 = v25;
        __int16 v56 = 2112;
        id v57 = v12;
        LODWORD(v51) = 22;
        long long v26 = (uint8_t *)_os_log_send_and_compose_impl();

        long long v27 = objc_msgSend(v7, "logger", &v54, v51);
        objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigrationActionUtility.m", 159, 16);

        if (v26 != buf) {
          free(v26);
        }
      }
      else
      {
        long long v36 = PLMigrationGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          long long v37 = (objc_class *)objc_opt_class();
          long long v38 = NSStringFromClass(v37);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v12;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Failed to perform a save operation for %{public}@. Error: %@", buf, 0x16u);
        }
      }
    }
    id v39 = v12;
    int64_t v19 = 3;
  }
  if (a5)
  {
    id v39 = v39;
    *a5 = v39;
  }
LABEL_32:

  return v19;
}

+ (int64_t)removeFromDuplicatesWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 requiresTokenReset:(BOOL)a6 error:(id *)a7
{
  BOOL v49 = a6;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v63 = 0;
  long long v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 1;
  uint64_t v57 = 0;
  uint64_t v58 = (id *)&v57;
  uint64_t v59 = 0x3032000000;
  long long v60 = __Block_byref_object_copy__16658;
  long long v61 = __Block_byref_object_dispose__16659;
  id v62 = 0;
  id obj = 0;
  uint64_t v13 = [v11 executeFetchRequest:v12 error:&obj];
  objc_storeStrong(&v62, obj);
  if ([v13 count])
  {
    id v14 = objc_msgSend(v10, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v13, "count"), 0);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __123__PLModelMigrationActionUtility_removeFromDuplicatesWithAction_managedObjectContext_fetchRequest_requiresTokenReset_error___block_invoke;
    v51[3] = &unk_1E586B2F0;
    id v48 = v10;
    id v52 = v48;
    int v54 = &v57;
    uint64_t v55 = &v63;
    id v15 = v14;
    id v53 = v15;
    long long v16 = [v11 enumerateWithIncrementalSaveUsingObjects:v13 withBlock:v51];
    if (v16 && !v58[5])
    {
      objc_storeStrong(v58 + 5, v16);
      v64[3] = 3;
    }
    if (v64[3] == 1)
    {
      char v17 = PLMigrationGetLog();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        int64_t v19 = [v48 logger];
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
          BOOL v21 = PLMigrationGetLog();
          os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          int v22 = [v13 count];
          int v67 = 67109120;
          LODWORD(v68) = v22;
          LODWORD(v46) = 8;
          long long v23 = (uint8_t *)_os_log_send_and_compose_impl();

          long long v24 = objc_msgSend(v48, "logger", &v67, v46);
          objc_msgSend(v24, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActionUtility.m", 130, 0);

          goto LABEL_14;
        }
        long long v34 = PLMigrationGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = [v13 count];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v35;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Removed %d assets from duplicate albums", buf, 8u);
        }
LABEL_21:
      }
    }
    else
    {
      long long v25 = PLMigrationGetLog();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);

      if (v26)
      {
        long long v27 = [v48 logger];
        BOOL v28 = v27 == 0;

        if (!v28)
        {
          uint64_t v47 = a7;
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
          BOOL v29 = PLMigrationGetLog();
          os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
          long long v30 = (objc_class *)objc_opt_class();
          long long v31 = NSStringFromClass(v30);
          id v32 = v58[5];
          int v67 = 138543618;
          long long v68 = v31;
          __int16 v69 = 2114;
          id v70 = v32;
          LODWORD(v46) = 22;
          long long v23 = (uint8_t *)_os_log_send_and_compose_impl();

          a7 = v47;
          long long v33 = objc_msgSend(v48, "logger", &v67, v46);
          objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v23, "PLModelMigrationActionUtility.m", 132, 16);

LABEL_14:
          if (v23 != buf) {
            free(v23);
          }
          goto LABEL_22;
        }
        long long v34 = PLMigrationGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          long long v36 = (objc_class *)objc_opt_class();
          long long v37 = NSStringFromClass(v36);
          id v38 = v58[5];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v38;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to save managed object context for %{public}@. Error: %{public}@", buf, 0x16u);
        }
        goto LABEL_21;
      }
    }
LABEL_22:

    if (v49 && v64[3] == 1 && (MEMORY[0x19F38C0C0]() & 1) == 0)
    {
      id v50 = 0;
      int64_t v39 = +[PLModelMigrationActionUtility resetDuplicateProcessingWithAction:v48 managedObjectContext:v11 error:&v50];
      id v40 = v50;
      v64[3] = v39;
    }
    goto LABEL_26;
  }
  if (!v13) {
    v64[3] = 3;
  }
LABEL_26:
  uint64_t v41 = v64[3];
  id v42 = v58[5];
  long long v43 = v42;
  if (v41 != 1 && a7) {
    *a7 = v42;
  }

  int64_t v44 = v64[3];
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  return v44;
}

uint64_t __123__PLModelMigrationActionUtility_removeFromDuplicatesWithAction_managedObjectContext_fetchRequest_requiresTokenReset_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 removeFromDuplicateAlbum];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v7 + 40);
  int v8 = [v6 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

+ (BOOL)processExtendedAttributesWithAction:(id)a3 asset:(id)a4 metadata:(id)a5 error:(id *)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v27 = 0;
  int v11 = [v10 updateExtendedAttributesWithMetadata:a5 error:&v27];
  id v12 = v27;
  if (v11)
  {
    uint64_t v13 = [v10 extendedAttributes];
    uint64_t v14 = [v13 dateCreated];
    if (v14)
    {
      id v15 = (void *)v14;
      long long v16 = [v13 timezoneName];
      if (v16)
      {

LABEL_14:
        goto LABEL_15;
      }
      long long v23 = [v13 timezoneOffset];

      if (v23)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    id v15 = [v10 master];
    if (v15)
    {
      +[PLManagedAsset fixMissingOriginalDateCreatedIfNeededForAsset:v10 withCloudMaster:v15];
      +[PLManagedAsset fixMissingOriginalTimezoneIfNeededForAsset:v10];
    }
    goto LABEL_14;
  }
  char v17 = PLMigrationGetLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

  if (v18)
  {
    int64_t v19 = [v9 logger];

    if (!v19)
    {
      long long v25 = PLMigrationGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v12;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "Failed updating attributes. Error: %@", buf, 0xCu);
      }

      if (a6) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    *(_OWORD *)buf = 0u;
    BOOL v20 = PLMigrationGetLog();
    os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    int v28 = 138412290;
    id v29 = v12;
    LODWORD(v26) = 12;
    BOOL v21 = (uint8_t *)_os_log_send_and_compose_impl();

    int v22 = objc_msgSend(v9, "logger", &v28, v26);
    objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActionUtility.m", 102, 1);

    if (v21 != buf) {
      free(v21);
    }
  }
  if (a6) {
LABEL_10:
  }
    *a6 = v12;
LABEL_16:

  return v11;
}

+ (int64_t)updateExtendedAttributesWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 useObjectIDResumeMarker:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  v31[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  [v14 setFetchBatchSize:100];
  v31[0] = @"extendedAttributes";
  v31[1] = @"master";
  v31[2] = @"master.mediaMetadata";
  v31[3] = @"modernResources";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  [v14 setRelationshipKeyPathsForPrefetching:v15];

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int v28 = __Block_byref_object_copy__16658;
  id v29 = __Block_byref_object_dispose__16659;
  id v30 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __132__PLModelMigrationActionUtility_updateExtendedAttributesWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error___block_invoke;
  v21[3] = &unk_1E58659D8;
  id v24 = a1;
  id v16 = v12;
  id v22 = v16;
  long long v23 = &v25;
  uint64_t v17 = [a1 processManagedObjectWithAction:v16 managedObjectContext:v13 fetchRequest:v14 useObjectIDResumeMarker:v8 error:a7 processingBlock:v21];
  id v18 = (id)v26[5];
  int64_t v19 = v18;
  if (!v17 && a7) {
    *a7 = v18;
  }

  _Block_object_dispose(&v25, 8);
  return v17 != 0;
}

void __132__PLModelMigrationActionUtility_updateExtendedAttributesWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 metadataFromMediaPropertiesOrOriginalResource];
  v5 = (void *)a1[6];
  uint64_t v6 = a1[4];
  uint64_t v7 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v7 + 40);
  [v5 processExtendedAttributesWithAction:v6 asset:v3 metadata:v4 error:&obj];

  objc_storeStrong((id *)(v7 + 40), obj);
}

+ (int64_t)removeOrphanedObjectsWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 error:(id *)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  int v11 = (objc_class *)MEMORY[0x1E4F1C018];
  id v12 = a4;
  id v13 = (void *)[[v11 alloc] initWithFetchRequest:v10];
  [v13 setResultType:2];
  id v39 = 0;
  id v14 = [v12 executeRequest:v13 error:&v39];

  id v15 = v39;
  id v16 = PLMigrationGetLog();
  uint64_t v17 = v16;
  if (v14)
  {
    int64_t v18 = 1;
    BOOL v19 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

    if (v19)
    {
      BOOL v20 = [v9 logger];

      if (v20)
      {
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
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
        memset(buf, 0, sizeof(buf));
        BOOL v21 = PLMigrationGetLog();
        os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        id v22 = [v14 result];
        long long v23 = [v10 entityName];
        int v40 = 138543618;
        long long v41 = v22;
        __int16 v42 = 2114;
        id v43 = v23;
        LODWORD(v38) = 22;
        id v24 = (uint8_t *)_os_log_send_and_compose_impl();

        uint64_t v25 = objc_msgSend(v9, "logger", &v40, v38);
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActionUtility.m", 52, 1);

        if (v24 != buf) {
          free(v24);
        }
      }
      else
      {
        long long v32 = PLMigrationGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          long long v33 = [v14 result];
          long long v34 = [v10 entityName];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v34;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_INFO, "Deleted %{public}@ %{public}@ objects", buf, 0x16u);
        }
      }
      int64_t v18 = 1;
    }
    if (a6) {
LABEL_15:
    }
      *a6 = v15;
  }
  else
  {
    BOOL v26 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v26)
    {
      uint64_t v27 = [v9 logger];

      if (v27)
      {
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
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
        memset(buf, 0, sizeof(buf));
        int v28 = PLMigrationGetLog();
        os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        id v29 = [v10 entityName];
        int v40 = 138543618;
        long long v41 = v29;
        __int16 v42 = 2112;
        id v43 = v15;
        LODWORD(v38) = 22;
        id v30 = (uint8_t *)_os_log_send_and_compose_impl();

        long long v31 = objc_msgSend(v9, "logger", &v40, v38);
        objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActionUtility.m", 55, 16);

        if (v30 != buf) {
          free(v30);
        }
      }
      else
      {
        long long v36 = PLMigrationGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          long long v37 = [v10 entityName];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Failed to delete orphaned %{public}@. Error: %@", buf, 0x16u);
        }
      }
    }
    int64_t v18 = 3;
    if (a6) {
      goto LABEL_15;
    }
  }

  return v18;
}

@end