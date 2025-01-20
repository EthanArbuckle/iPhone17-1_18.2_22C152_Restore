@interface PLBackgroundModelMigration
+ (BOOL)hasCompletedBackgroundActionClass:(Class)a3 pathManager:(id)a4;
+ (BOOL)isBackgroundMigrationRegistrationAfterRebuildRequiredWithLibrary:(id)a3;
+ (BOOL)isCompletedBackgroundActionClass:(Class)a3 appPrivateData:(id)a4;
+ (BOOL)resetBackgroundActionClass:(Class)a3 pathManager:(id)a4 error:(id *)a5;
+ (int64_t)migrateBackgroundActionsWithPhotoLibraryBundle:(id)a3 logger:(id)a4 error:(id *)a5 continuationHandler:(id)a6;
+ (void)validateBackgroundActionClass:(Class)a3;
- (BOOL)isMigrationCancelledWithError:(id *)a3;
- (NSProgress)progress;
- (NSString)migrationUUID;
- (PLFileBackedLogger)logger;
- (id)analyticsEventManager;
- (id)appPrivateData;
- (id)continuationHandler;
- (id)databaseContext;
- (id)initBackgroundMigrationWithPhotoLibraryBundle:(id)a3 logger:(id)a4 continuationHandler:(id)a5;
- (id)migrationContext;
- (id)pathManager;
- (int64_t)libraryIdentifier;
- (int64_t)migrateBackgroundPostProcessingWithError:(id *)a3;
- (int64_t)runBackgroundMigrationAction:(id)a3 error:(id *)a4;
- (void)registerBackgroundActionClass:(Class)a3 onCondition:(BOOL)a4;
- (void)setContinuationHandler:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMarkerForBackgroundAction:(id)a3 marker:(int64_t)a4;
- (void)setMigrationUUID:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation PLBackgroundModelMigration

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continuationHandler, 0);
  objc_storeStrong((id *)&self->_migrationUUID, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_lazyAppPrivateData, 0);
  objc_storeStrong((id *)&self->_actionsBackground, 0);
  objc_storeStrong((id *)&self->_internalMigrationContext, 0);
}

- (void)setContinuationHandler:(id)a3
{
}

- (id)continuationHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setMigrationUUID:(id)a3
{
}

- (NSString)migrationUUID
{
  return self->_migrationUUID;
}

- (void)setLogger:(id)a3
{
}

- (PLFileBackedLogger)logger
{
  return self->_logger;
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)isMigrationCancelledWithError:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v5 = [(PLBackgroundModelMigration *)self continuationHandler];

  if (v5)
  {
    v6 = [(PLBackgroundModelMigration *)self continuationHandler];
    char v7 = v6[2]();

    if ((v7 & 1) == 0)
    {
      v8 = [(PLBackgroundModelMigration *)self progress];
      [v8 cancel];
    }
  }
  v9 = [(PLBackgroundModelMigration *)self progress];
  int v10 = [v9 isCancelled];

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F8C500];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v17[0] = @"Background Migration was cancelled";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v14 = [v11 errorWithDomain:v12 code:46014 userInfo:v13];

    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v14 = 0;
  if (a3) {
LABEL_8:
  }
    *a3 = v14;
LABEL_9:

  return v10;
}

- (void)setMarkerForBackgroundAction:(id)a3 marker:(int64_t)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"PLBackgroundModelMigration.m", 338, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v43 = [MEMORY[0x1E4F28B00] currentHandler];
  [v43 handleFailureInMethod:a2, self, @"PLBackgroundModelMigration.m", 339, @"Invalid parameter not satisfying: %@", @"marker != PLModelMigrationActionBackgroundStatusNotStarted" object file lineNumber description];

LABEL_3:
  v8 = [(PLBackgroundModelMigration *)self appPrivateData];
  v9 = [v8 valueForKeyPath:@"MigrationAction.Background"];
  id v10 = (id)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
  v13 = NSStringFromClass(v11);
  id v14 = [v10 objectForKeyedSubscript:v13];

  if (!v14)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15 = NSStringFromClass(v11);
    [v10 setObject:v14 forKeyedSubscript:v15];

    [v14 setObject:v12 forKeyedSubscript:@"PLBackgroundMigrationStartDate"];
  }
  uint64_t v16 = [NSNumber numberWithInteger:a4];
  [v14 setObject:v16 forKeyedSubscript:@"PLBackgroundMigrationStatus"];

  [v14 setObject:v12 forKeyedSubscript:@"PLBackgroundMigrationStatusDate"];
  if (a4 == 1)
  {
    v20 = [v14 objectForKeyedSubscript:@"PLBackgroundMigrationStatusAttempts"];
    uint64_t v21 = [v20 integerValue];

    uint64_t v22 = v21 + 1;
    v23 = [NSNumber numberWithInteger:v21 + 1];
    [v14 setObject:v23 forKeyedSubscript:@"PLBackgroundMigrationStatusAttempts"];

    v24 = [(PLBackgroundModelMigration *)self analyticsEventManager];
    v25 = [NSNumber numberWithInteger:v22];
    uint64_t v26 = *MEMORY[0x1E4F8BC80];
    [v24 setPayloadValue:v25 forKey:*MEMORY[0x1E4F8BC88] onEventWithName:*MEMORY[0x1E4F8BC80]];
  }
  else if (a4 == 2)
  {
    v17 = [v14 objectForKeyedSubscript:@"PLBackgroundMigrationStartDate"];
    if (v17)
    {
      [v12 timeIntervalSinceDate:v17];
      double v19 = v18;
    }
    else
    {
      double v19 = -1.0;
    }
    v27 = [(PLBackgroundModelMigration *)self analyticsEventManager];
    v28 = [NSNumber numberWithDouble:v19];
    uint64_t v26 = *MEMORY[0x1E4F8BC80];
    [v27 setPayloadValue:v28 forKey:*MEMORY[0x1E4F8BC98] onEventWithName:*MEMORY[0x1E4F8BC80]];
  }
  else
  {
    uint64_t v26 = *MEMORY[0x1E4F8BC80];
  }
  v29 = [(PLBackgroundModelMigration *)self analyticsEventManager];
  v30 = [(id)objc_opt_class() shortenedMigrationActionClassName];
  [v29 setPayloadValue:v30 forKey:*MEMORY[0x1E4F8BC90] onEventWithName:v26];

  uint64_t v31 = [(PLBackgroundModelMigration *)self analyticsEventManager];
  v32 = PLStringFromModelMigrationActionBackgroundStatusShort(a4);
  [(id)v31 setPayloadValue:v32 forKey:*MEMORY[0x1E4F8BCA8] onEventWithName:v26];

  v33 = [(PLBackgroundModelMigration *)self appPrivateData];
  id v45 = 0;
  LOBYTE(v31) = [v33 setValue:v10 forKeyPath:@"MigrationAction.Background" error:&v45];
  id v34 = v45;

  if ((v31 & 1) == 0)
  {
    v35 = PLMigrationGetLog();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);

    if (v36)
    {
      v37 = [(PLBackgroundModelMigration *)self logger];

      if (v37)
      {
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
        long long v56 = 0u;
        long long v57 = 0u;
        long long v55 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        *(_OWORD *)buf = 0u;
        v38 = PLMigrationGetLog();
        os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
        int v46 = 138412290;
        id v47 = v34;
        LODWORD(v44) = 12;
        v39 = (uint8_t *)_os_log_send_and_compose_impl();

        v40 = [(PLBackgroundModelMigration *)self logger];
        objc_msgSend(v40, "logWithMessage:fromCodeLocation:type:", v39, "PLBackgroundModelMigration.m", 379, 16);

        if (v39 != buf) {
          free(v39);
        }
      }
      else
      {
        v41 = PLMigrationGetLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v34;
          _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "Failed to record marker in private app data. Error: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (int64_t)runBackgroundMigrationAction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 1;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__45109;
  v24 = __Block_byref_object_dispose__45110;
  id v25 = 0;
  id v7 = [(PLBackgroundModelMigration *)self databaseContext];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  id v9 = objc_claimAutoreleasedReturnValue();
  id v10 = objc_msgSend(v7, "newShortLivedLibraryWithName:", objc_msgSend(v9, "UTF8String"));

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__PLBackgroundModelMigration_runBackgroundMigrationAction_error___block_invoke;
  v15[3] = &unk_1E586C518;
  v15[4] = self;
  id v11 = v6;
  id v16 = v11;
  double v18 = &v26;
  id v12 = v10;
  id v17 = v12;
  double v19 = &v20;
  [v12 performBlockAndWait:v15];
  if (a4) {
    *a4 = (id) v21[5];
  }
  int64_t v13 = v27[3];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __65__PLBackgroundModelMigration_runBackgroundMigrationAction_error___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setMarkerForBackgroundAction:*(void *)(a1 + 40) marker:1];
  v2 = *(void **)(a1 + 40);
  v3 = [*(id *)(a1 + 48) managedObjectContext];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 performActionWithManagedObjectContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1)
  {
    [*(id *)(a1 + 32) setMarkerForBackgroundAction:*(void *)(a1 + 40) marker:2];
  }
  else
  {
    id v6 = PLMigrationGetLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      v8 = [*(id *)(a1 + 32) logger];

      if (v8)
      {
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
        long long v34 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        *(_OWORD *)buf = 0u;
        id v9 = PLMigrationGetLog();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        id v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        int v25 = 138543362;
        uint64_t v26 = v11;
        LODWORD(v23) = 12;
        id v12 = (uint8_t *)_os_log_send_and_compose_impl();

        int64_t v13 = objc_msgSend(*(id *)(a1 + 32), "logger", &v25, v23);
        objc_msgSend(v13, "logWithMessage:fromCodeLocation:type:", v12, "PLBackgroundModelMigration.m", 316, 0);

        if (v12 != buf) {
          free(v12);
        }
      }
      else
      {
        id v14 = PLMigrationGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (objc_class *)objc_opt_class();
          id v16 = NSStringFromClass(v15);
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v16;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ skipped setting background completed marker due to failed action", buf, 0xCu);
        }
      }
    }
  }
  id v17 = [*(id *)(a1 + 32) analyticsEventManager];
  double v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "libraryIdentifier"));
  [v17 setPayloadValue:v18 forKey:*MEMORY[0x1E4F8BD28] onEventWithName:*MEMORY[0x1E4F8BD30]];

  double v19 = [*(id *)(a1 + 32) analyticsEventManager];
  uint64_t v20 = PLStringFromModelMigrationActionResultShort(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  uint64_t v21 = *MEMORY[0x1E4F8BC80];
  [v19 setPayloadValue:v20 forKey:*MEMORY[0x1E4F8BCA0] onEventWithName:*MEMORY[0x1E4F8BC80]];

  uint64_t v22 = [*(id *)(a1 + 32) analyticsEventManager];
  [v22 publishEventWithName:v21];
}

- (int64_t)migrateBackgroundPostProcessingWithError:(id *)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x3032000000;
  long long v65 = __Block_byref_object_copy__45109;
  long long v66 = __Block_byref_object_dispose__45110;
  id v67 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  id obj = 0;
  BOOL v4 = [(PLBackgroundModelMigration *)self isMigrationCancelledWithError:&obj];
  objc_storeStrong(&v67, obj);
  uint64_t v5 = 1;
  if (v4) {
    uint64_t v5 = 2;
  }
  uint64_t v61 = v5;
  if ([(NSMutableArray *)self->_actionsBackground count] && v59[3] == 1)
  {
    id v6 = [PLModelMigrationActionProcessor alloc];
    BOOL v7 = [(PLBackgroundModelMigration *)self migrationUUID];
    v8 = [(PLBackgroundModelMigration *)self pathManager];
    id v9 = [(PLBackgroundModelMigration *)self analyticsEventManager];
    id v10 = [(PLBackgroundModelMigration *)self logger];
    id v11 = [(PLModelMigrationActionProcessor *)v6 initWithUUID:v7 pathManager:v8 migrationActionType:5 analyticsEventManager:v9 logger:v10 progressUnitCount:self->_actionProgressPortionBackground];

    [(PLModelMigrationActionProcessor *)v11 setIgnoreProgressUpdates:1];
    id v12 = [(PLModelMigrationActionProcessor *)v11 progress];

    if (v12)
    {
      int64_t v13 = [(PLBackgroundModelMigration *)self progress];
      id v14 = [(PLModelMigrationActionProcessor *)v11 progress];
      [v13 addChild:v14 withPendingUnitCount:self->_actionProgressPortionBackground];
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v46 = self->_actionsBackground;
    uint64_t v15 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v53 objects:v103 count:16];
    if (v15)
    {
      uint64_t v47 = *(void *)v54;
LABEL_9:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v54 != v47) {
          objc_enumerationMutation(v46);
        }
        id v17 = *(void **)(*((void *)&v53 + 1) + 8 * v16);
        double v18 = (void *)MEMORY[0x19F38D3B0]();
        double v19 = [v17 progress];
        uint64_t v20 = [(PLModelMigrationActionProcessor *)v11 progress];
        objc_msgSend(v20, "addChild:withPendingUnitCount:", v19, objc_msgSend((id)objc_opt_class(), "actionProgressWeight"));

        uint64_t v21 = NSString;
        uint64_t v22 = [(id)objc_opt_class() actionDescription];
        uint64_t v23 = [v21 stringWithFormat:@"%@", v22];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __71__PLBackgroundModelMigration_migrateBackgroundPostProcessingWithError___block_invoke;
        v49[3] = &unk_1E586A3F8;
        v49[4] = self;
        v49[5] = v17;
        long long v51 = &v58;
        long long v52 = &v62;
        id v24 = v19;
        id v50 = v24;
        [(PLModelMigrationActionProcessor *)v11 performActionWithName:v23 ifRequired:1 block:v49];

        if ([(PLModelMigrationActionProcessor *)v11 isSuccess])
        {
          int v25 = (id *)(v63 + 5);
          id v48 = (id)v63[5];
          BOOL v26 = [(PLBackgroundModelMigration *)self isMigrationCancelledWithError:&v48];
          objc_storeStrong(v25, v48);
          if (v26)
          {
            int v27 = 0;
            v59[3] = 2;
          }
          else
          {
            int v27 = 1;
          }
        }
        else
        {
          long long v28 = PLMigrationGetLog();
          BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

          if (v29)
          {
            long long v30 = [(PLBackgroundModelMigration *)self logger];
            BOOL v31 = v30 == 0;

            if (v31)
            {
              long long v38 = PLMigrationGetLog();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                long long v39 = (objc_class *)objc_opt_class();
                long long v40 = NSStringFromClass(v39);
                uint64_t v41 = v63[5];
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v40;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v41;
                _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "%{public}@ failed. Error: %{public}@", buf, 0x16u);
              }
            }
            else
            {
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
              long long v73 = 0u;
              long long v74 = 0u;
              memset(buf, 0, sizeof(buf));
              long long v32 = PLMigrationGetLog();
              os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
              long long v33 = (objc_class *)objc_opt_class();
              long long v34 = NSStringFromClass(v33);
              uint64_t v35 = v63[5];
              int v68 = 138543618;
              long long v69 = v34;
              __int16 v70 = 2114;
              uint64_t v71 = v35;
              LODWORD(v44) = 22;
              long long v36 = (uint8_t *)_os_log_send_and_compose_impl();

              long long v37 = [(PLBackgroundModelMigration *)self logger];
              objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLBackgroundModelMigration.m", 287, 16);

              if (v36 != buf) {
                free(v36);
              }
            }
          }
          int v27 = 0;
        }

        if (!v27) {
          break;
        }
        if (v15 == ++v16)
        {
          uint64_t v15 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v53 objects:v103 count:16];
          if (v15) {
            goto LABEL_9;
          }
          break;
        }
      }
    }
  }
  if (a3) {
    *a3 = (id) v63[5];
  }
  int64_t v42 = v59[3];
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  return v42;
}

BOOL __71__PLBackgroundModelMigration_migrateBackgroundPostProcessingWithError___block_invoke(uint64_t a1)
{
  v8[72] = *(id *)MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v8[0] = 0;
  uint64_t v4 = [v2 runBackgroundMigrationAction:v3 error:v8];
  id v5 = v8[0];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v5);
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  BOOL v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1;

  return v6;
}

- (void)registerBackgroundActionClass:(Class)a3 onCondition:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  +[PLBackgroundModelMigration validateBackgroundActionClass:](PLBackgroundModelMigration, "validateBackgroundActionClass:");
  BOOL v7 = objc_opt_class();
  v8 = [(PLBackgroundModelMigration *)self appPrivateData];
  char v9 = [v7 isCompletedBackgroundActionClass:a3 appPrivateData:v8];

  if (v4)
  {
    if (v9)
    {
      id v10 = PLMigrationGetLog();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (!v11) {
        return;
      }
      id v12 = [(PLBackgroundModelMigration *)self logger];

      if (v12)
      {
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
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        *(_OWORD *)buf = 0u;
        long long v53 = 0u;
        int64_t v13 = PLMigrationGetLog();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        id v14 = NSStringFromClass(a3);
        int v50 = 138543362;
        long long v51 = v14;
        LODWORD(v49) = 12;
        uint64_t v15 = (uint8_t *)_os_log_send_and_compose_impl();

        uint64_t v16 = [(PLBackgroundModelMigration *)self logger];
        id v17 = v16;
        double v18 = v15;
        uint64_t v19 = 175;
        goto LABEL_10;
      }
      long long v45 = PLMigrationGetLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        long long v46 = NSStringFromClass(a3);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v46;
        uint64_t v47 = "Skipping registering completed background action class: %{public}@";
LABEL_25:
        _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_DEFAULT, v47, buf, 0xCu);

        goto LABEL_26;
      }
      goto LABEL_26;
    }
    id v25 = [a3 alloc];
    internalMigrationContext = self->_internalMigrationContext;
    int v27 = [(PLBackgroundModelMigration *)self logger];
    long long v28 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", -[objc_class actionProgressWeight](a3, "actionProgressWeight"));
    BOOL v29 = [(PLBackgroundModelMigration *)self continuationHandler];
    long long v30 = (void *)[v25 initWithMigrationContext:internalMigrationContext logger:v27 progress:v28 continuationHandler:v29];

    uint64_t v31 = [(objc_class *)a3 actionProgressWeight];
    actionsBackground = self->_actionsBackground;
    self->_actionProgressPortionBackground += v31;
    [(NSMutableArray *)actionsBackground addObject:v30];
    long long v33 = PLMigrationGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v30;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEBUG, "Registering background action: %{public}@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if ((v9 & 1) == 0)
  {
    id v34 = [a3 alloc];
    uint64_t v35 = self->_internalMigrationContext;
    long long v36 = [(PLBackgroundModelMigration *)self logger];
    long long v37 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", -[objc_class actionProgressWeight](a3, "actionProgressWeight"));
    long long v38 = [(PLBackgroundModelMigration *)self continuationHandler];
    long long v30 = (void *)[v34 initWithMigrationContext:v35 logger:v36 progress:v37 continuationHandler:v38];

    [(PLBackgroundModelMigration *)self setMarkerForBackgroundAction:v30 marker:3];
    long long v39 = PLMigrationGetLog();
    LODWORD(v36) = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

    if (!v36) {
      goto LABEL_19;
    }
    long long v40 = [(PLBackgroundModelMigration *)self logger];

    if (v40)
    {
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
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      *(_OWORD *)buf = 0u;
      long long v53 = 0u;
      uint64_t v41 = PLMigrationGetLog();
      os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
      int64_t v42 = NSStringFromClass(a3);
      int v50 = 138543362;
      long long v51 = v42;
      LODWORD(v49) = 12;
      long long v43 = (uint8_t *)_os_log_send_and_compose_impl();

      uint64_t v44 = [(PLBackgroundModelMigration *)self logger];
      objc_msgSend(v44, "logWithMessage:fromCodeLocation:type:", v43, "PLBackgroundModelMigration.m", 183, 0);

      if (v43 != buf) {
        free(v43);
      }
      goto LABEL_19;
    }
    long long v33 = PLMigrationGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v48 = NSStringFromClass(a3);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v48;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "Skipping registering background action class: %{public}@", buf, 0xCu);
    }
LABEL_14:

LABEL_19:
    return;
  }
  uint64_t v20 = PLMigrationGetLog();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (!v21) {
    return;
  }
  uint64_t v22 = [(PLBackgroundModelMigration *)self logger];

  if (!v22)
  {
    long long v45 = PLMigrationGetLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      long long v46 = NSStringFromClass(a3);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v46;
      uint64_t v47 = "Skipping registering skipped background action class: %{public}@";
      goto LABEL_25;
    }
LABEL_26:

    return;
  }
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
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  *(_OWORD *)buf = 0u;
  long long v53 = 0u;
  uint64_t v23 = PLMigrationGetLog();
  os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  id v24 = NSStringFromClass(a3);
  int v50 = 138543362;
  long long v51 = v24;
  LODWORD(v49) = 12;
  uint64_t v15 = (uint8_t *)_os_log_send_and_compose_impl();

  uint64_t v16 = [(PLBackgroundModelMigration *)self logger];
  id v17 = v16;
  double v18 = v15;
  uint64_t v19 = 185;
LABEL_10:
  objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v18, "PLBackgroundModelMigration.m", v19, 0);

  if (v15 != buf) {
    free(v15);
  }
}

- (id)appPrivateData
{
  return (id)[(PLLazyObject *)self->_lazyAppPrivateData objectValue];
}

- (id)databaseContext
{
  return (id)[(PLModelMigrationContext *)self->_internalMigrationContext databaseContext];
}

- (id)migrationContext
{
  return self->_internalMigrationContext;
}

- (int64_t)libraryIdentifier
{
  return [(PLModelMigrationContext *)self->_internalMigrationContext libraryIdentifier];
}

- (id)pathManager
{
  return (id)[(PLModelMigrationContext *)self->_internalMigrationContext pathManager];
}

- (id)analyticsEventManager
{
  return (id)[(PLModelMigrationContext *)self->_internalMigrationContext analyticsEventManager];
}

- (id)initBackgroundMigrationWithPhotoLibraryBundle:(id)a3 logger:(id)a4 continuationHandler:(id)a5
{
  id v9 = a3;
  id v36 = a4;
  id v10 = a5;
  BOOL v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PLBackgroundModelMigration.m", 113, @"Invalid parameter not satisfying: %@", @"bundle", v36 object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"PLBackgroundModelMigration.m", 114, @"Invalid parameter not satisfying: %@", @"continuationHandler" object file lineNumber description];

LABEL_3:
  id v12 = [[PLDatabaseContext alloc] initWithLibraryBundle:v9];
  id v13 = objc_alloc_init(MEMORY[0x1E4F8B8C0]);
  id v14 = [PLBackgroundMigrationContext alloc];
  uint64_t v15 = [v9 pathManager];
  uint64_t v16 = [(PLBackgroundMigrationContext *)v14 initWithPathManager:v15 databaseContext:v12 analyticsEventManager:v13];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PLBackgroundModelMigration.m", 119, @"Invalid parameter not satisfying: %@", @"[ctx isKindOfClass:PLBackgroundMigrationContext.class]" object file lineNumber description];
  }
  v43.receiver = self;
  v43.super_class = (Class)PLBackgroundModelMigration;
  id v17 = [(PLBackgroundModelMigration *)&v43 init];
  double v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_logger, a4);
    uint64_t v19 = MEMORY[0x19F38D650](v11);
    id continuationHandler = v18->_continuationHandler;
    v18->_id continuationHandler = (id)v19;

    objc_storeStrong((id *)&v18->_internalMigrationContext, v16);
    BOOL v21 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v22 = [v21 UUIDString];
    migrationUUID = v18->_migrationUUID;
    v18->_migrationUUID = (NSString *)v22;

    uint64_t v24 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
    progress = v18->_progress;
    v18->_progress = (NSProgress *)v24;

    [(NSProgress *)v18->_progress setCancellable:1];
    objc_initWeak(&location, v18);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __103__PLBackgroundModelMigration_initBackgroundMigrationWithPhotoLibraryBundle_logger_continuationHandler___block_invoke;
    v40[3] = &unk_1E5875F08;
    objc_copyWeak(&v41, &location);
    [(NSProgress *)v18->_progress setCancellationHandler:v40];
    BOOL v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actionsBackground = v18->_actionsBackground;
    v18->_actionsBackground = v26;

    v18->_actionProgressPortionBackground = 0;
    id v28 = objc_initWeak(&from, v18);

    id v29 = objc_alloc(MEMORY[0x1E4F8B948]);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __103__PLBackgroundModelMigration_initBackgroundMigrationWithPhotoLibraryBundle_logger_continuationHandler___block_invoke_69;
    v37[3] = &unk_1E5874070;
    objc_copyWeak(&v38, &from);
    uint64_t v30 = [v29 initWithBlock:v37];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&from);
    lazyAppPrivateData = v18->_lazyAppPrivateData;
    v18->_lazyAppPrivateData = (PLLazyObject *)v30;

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __103__PLBackgroundModelMigration_initBackgroundMigrationWithPhotoLibraryBundle_logger_continuationHandler___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = PLMigrationGetLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v4);
    BOOL v6 = [WeakRetained logger];

    if (v6)
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
      BOOL v7 = PLMigrationGetLog();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      v13[0] = 0;
      LODWORD(v12) = 2;
      v8 = (uint8_t *)_os_log_send_and_compose_impl();

      id v9 = objc_loadWeakRetained(v4);
      id v10 = objc_msgSend(v9, "logger", v13, v12);
      objc_msgSend(v10, "logWithMessage:fromCodeLocation:type:", v8, "PLBackgroundModelMigration.m", 130, 0);

      if (v8 != buf) {
        free(v8);
      }
    }
    else
    {
      BOOL v11 = PLMigrationGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Background Migration was cancelled", buf, 2u);
      }
    }
  }
}

id __103__PLBackgroundModelMigration_initBackgroundMigrationWithPhotoLibraryBundle_logger_continuationHandler___block_invoke_69(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F8B858];
    BOOL v4 = [WeakRetained pathManager];
    id v5 = [v4 libraryURL];
    BOOL v6 = [v3 appPrivateDataForLibraryURL:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isBackgroundMigrationRegistrationAfterRebuildRequiredWithLibrary:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    BOOL v4 = PLModelMigrationSubclassesForClass();
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    BOOL v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v11 isResetAfterRebuildRequiredWithLibrary:v3]) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v8);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      char v28 = 0;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          long long v18 = [v3 pathManager];
          LODWORD(v17) = +[PLBackgroundModelMigration hasCompletedBackgroundActionClass:v17 pathManager:v18];

          if (v17)
          {
            uint64_t v19 = objc_opt_class();
            long long v20 = [v3 pathManager];
            id v29 = 0;
            BOOL v21 = +[PLBackgroundModelMigration resetBackgroundActionClass:v19 pathManager:v20 error:&v29];
            id v22 = v29;

            long long v23 = PLMigrationGetLog();
            long long v24 = v23;
            if (v21)
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Requesting background migration after rebuild", buf, 2u);
              }
              char v28 = 1;
            }
            else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v39 = v22;
              _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Failed to reset: PLModelMigrationAction_UpdateAssetAdjustmentsState. Error: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v14);
    }
    else
    {
      char v28 = 0;
    }

    long long v25 = v6;
    char v26 = v28;
  }
  else
  {
    long long v25 = PLMigrationGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Unable to check background migration action reset after rebuild due to missing library", buf, 2u);
    }
    char v26 = 0;
  }

  return v26 & 1;
}

+ (BOOL)isCompletedBackgroundActionClass:(Class)a3 appPrivateData:(id)a4
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (!a3)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLBackgroundModelMigration.m", 328, @"Invalid parameter not satisfying: %@", @"actionClass" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLBackgroundModelMigration.m", 329, @"Invalid parameter not satisfying: %@", @"appPrivateData" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = [v8 valueForKeyPath:@"MigrationAction.Background"];
  id v10 = NSStringFromClass(a3);
  BOOL v11 = [v9 objectForKeyedSubscript:v10];

  id v12 = [v11 objectForKeyedSubscript:@"PLBackgroundMigrationStatus"];
  uint64_t v13 = [v12 integerValue];

  return (v13 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (int64_t)migrateBackgroundActionsWithPhotoLibraryBundle:(id)a3 logger:(id)a4 error:(id *)a5 continuationHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 1;
  id v12 = PLBackgroundMigrationActionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__PLBackgroundModelMigration_migrateBackgroundActionsWithPhotoLibraryBundle_logger_error_continuationHandler___block_invoke;
  block[3] = &unk_1E5871650;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = &v24;
  long long v23 = a5;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(v12, block);

  int64_t v16 = v25[3];
  _Block_object_dispose(&v24, 8);
  return v16;
}

void __110__PLBackgroundModelMigration_migrateBackgroundActionsWithPhotoLibraryBundle_logger_error_continuationHandler___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F38D3B0]();
  id v3 = [[PLBackgroundModelMigration alloc] initBackgroundMigrationWithPhotoLibraryBundle:*(void *)(a1 + 32) logger:*(void *)(a1 + 40) continuationHandler:*(void *)(a1 + 48)];
  PLModelMigrationActionRegistration_Background(v3);
  id v22 = 0;
  uint64_t v4 = [v3 migrateBackgroundPostProcessingWithError:&v22];
  id v5 = v22;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v6 != 3)
  {
    if (v6 != 1) {
      goto LABEL_10;
    }
    id v7 = [*(id *)(a1 + 32) libraryURL];
    PLDeregisterBackgroundMigrationLibraryURL(v7);
    goto LABEL_4;
  }
  uint64_t v8 = [*(id *)(a1 + 32) libraryURL];
  int v9 = PLBumpBackgroundMigrationLibraryURL(v8);

  if (v9 < 4) {
    goto LABEL_10;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  id v10 = PLMigrationGetLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

  if (!v11) {
    goto LABEL_10;
  }
  id v12 = [v3 logger];

  if (!v12)
  {
    id v7 = PLMigrationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Background migration failure hit max retry attempts. Marking it as DONE until next process restart. Error: %@", buf, 0xCu);
    }
LABEL_4:

    goto LABEL_10;
  }
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
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  *(_OWORD *)buf = 0u;
  id v13 = PLMigrationGetLog();
  os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  int v23 = 138412290;
  id v24 = v5;
  LODWORD(v21) = 12;
  id v14 = (uint8_t *)_os_log_send_and_compose_impl();

  id v15 = objc_msgSend(v3, "logger", &v23, v21);
  objc_msgSend(v15, "logWithMessage:fromCodeLocation:type:", v14, "PLBackgroundModelMigration.m", 242, 16);

  if (v14 != buf) {
    free(v14);
  }
LABEL_10:

  int64_t v16 = *(void **)(a1 + 64);
  uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v18 = v5;
  id v19 = v18;
  if (v17 != 1 && v16 != 0) {
    *int64_t v16 = v18;
  }
}

+ (void)validateBackgroundActionClass:(Class)a3
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = NSStringFromClass(a3);
    [v7 handleFailureInMethod:a2, a1, @"PLBackgroundModelMigration.m", 216, @"Invalid background action class: %@", v6 object file lineNumber description];
  }
}

+ (BOOL)resetBackgroundActionClass:(Class)a3 pathManager:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [a1 validateBackgroundActionClass:a3];
  int v9 = (void *)MEMORY[0x1E4F8B858];
  id v10 = [v8 libraryURL];
  BOOL v11 = [v9 appPrivateDataForLibraryURL:v10];

  id v12 = [v11 valueForKeyPath:@"MigrationAction.Background"];
  id v13 = (void *)[v12 mutableCopy];

  id v14 = NSStringFromClass(a3);
  [v13 removeObjectForKey:v14];

  id v27 = 0;
  int v15 = [v11 setValue:v13 forKeyPath:@"MigrationAction.Background" error:&v27];
  id v16 = v27;
  if (v15)
  {
    id v26 = v16;
    BOOL v17 = +[PLModelMigrationActionBackground resetResumeMarkerForActionClass:a3 pathManager:v8 error:&v26];
    id v18 = v26;

    if (v17)
    {
      id v19 = v18;
      BOOL v20 = 1;
      goto LABEL_12;
    }
    uint64_t v21 = PLMigrationGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = NSStringFromClass(a3);
      *(_DWORD *)buf = 138543618;
      long long v29 = v23;
      __int16 v30 = 2112;
      id v31 = v18;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to reset the resume marker id in private app data for class: %{public}@. Error: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v21 = PLMigrationGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = NSStringFromClass(a3);
      *(_DWORD *)buf = 138543618;
      long long v29 = v22;
      __int16 v30 = 2112;
      id v31 = v16;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to reset marker in private app data for class: %{public}@. Error: %@", buf, 0x16u);
    }
    id v18 = v16;
  }

  id v24 = v18;
  id v19 = v24;
  if (a5)
  {
    id v19 = v24;
    BOOL v20 = 0;
    *a5 = v19;
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_12:

  return v20;
}

+ (BOOL)hasCompletedBackgroundActionClass:(Class)a3 pathManager:(id)a4
{
  id v6 = a4;
  [a1 validateBackgroundActionClass:a3];
  id v7 = (void *)MEMORY[0x1E4F8B858];
  id v8 = [v6 libraryURL];

  int v9 = [v7 appPrivateDataForLibraryURL:v8];

  LOBYTE(a3) = [a1 isCompletedBackgroundActionClass:a3 appPrivateData:v9];
  return (char)a3;
}

@end