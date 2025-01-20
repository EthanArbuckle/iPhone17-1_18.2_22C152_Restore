@interface PLModelMigration
+ (int)currentModelVersion;
- (BOOL)allowRebuild;
- (BOOL)didCreateSqliteErrorIndicator;
- (BOOL)isMigrationCancelledWithError:(id *)a3;
- (NSProgress)progress;
- (NSString)migrationUUID;
- (PLFileBackedLogger)logger;
- (PLModelMigration)initWithMigrationContext:(id)a3 logger:(id)a4;
- (id)_managedObjectModelForLightweightMigrationStageWithURL:(id)a3;
- (id)_nextRequiredStagedMigrationVersionAfterVersion:(id)a3;
- (id)_stagedManagedObjectModelURLWithStageVersion:(id)a3;
- (id)addStoreWithCoordinator:(id)a3 migrationUUID:(id)a4 storeURL:(id)a5 options:(id)a6 description:(id)a7 fromVersion:(int)a8 toVersion:(int)a9 progress:(id)a10 progressUnitCount:(unint64_t)a11 error:(id *)a12;
- (id)analyticsEventManager;
- (id)graphCache;
- (id)legacyMigrationDelegate;
- (id)migrationContext;
- (id)pathManager;
- (int64_t)migratePostProcessingWithActions:(id)a3 migrationActionType:(int64_t)a4 progress:(id)a5 progressUnitCount:(unint64_t)a6 error:(id *)a7;
- (int64_t)migratePostProcessingWithProgressUnitCount:(unint64_t)a3 error:(id *)a4;
- (int64_t)migrateSchemaMigrationWithAutoMigrationOptions:(id)a3 currentStoreVersion:(id)a4 error:(id *)a5;
- (int64_t)migrateStagedMigrationWithAutoMigrationOptions:(id)a3 currentStoreVersion:(id)a4 error:(id *)a5;
- (int64_t)migrateWithError:(id *)a3;
- (int64_t)runMigrationAction:(id)a3 withCoordinator:(id)a4 error:(id *)a5;
- (int64_t)setupWithError:(id *)a3;
- (void)_registerActionClass:(Class)a3 actionsContainer:(id)a4 progressPortion:(unint64_t *)a5;
- (void)actionRegistration;
- (void)registerActionClass:(Class)a3 onCondition:(BOOL)a4;
- (void)registerPostRepairActionClass:(Class)a3 onCondition:(BOOL)a4;
- (void)registerPreRepairActionClass:(Class)a3 onCondition:(BOOL)a4;
- (void)registerStagedActionClass:(Class)a3 onCondition:(BOOL)a4;
- (void)resetBackgroundActionClass:(Class)a3 onCondition:(BOOL)a4;
- (void)setLegacyMigrationDelegate:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMigrationUUID:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation PLModelMigration

+ (int)currentModelVersion
{
  return 18402;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationUUID, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_legacyMigrationDelegate, 0);
  objc_storeStrong((id *)&self->_internalMigrationContext, 0);
  objc_storeStrong((id *)&self->_actionsPostRepair, 0);
  objc_storeStrong((id *)&self->_actionsPreRepair, 0);
  objc_storeStrong((id *)&self->_actionsStaged, 0);
  objc_storeStrong((id *)&self->_actions, 0);
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

- (void)setLegacyMigrationDelegate:(id)a3
{
}

- (id)legacyMigrationDelegate
{
  return objc_getProperty(self, a2, 80, 1);
}

- (BOOL)didCreateSqliteErrorIndicator
{
  return self->_didCreateSqliteErrorIndicator;
}

- (BOOL)allowRebuild
{
  return self->_allowRebuild;
}

- (BOOL)isMigrationCancelledWithError:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PLModelMigration *)self progress];
  int v5 = [v4 isCancelled];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F8C500];
    uint64_t v11 = *MEMORY[0x1E4F28588];
    v12[0] = @"Migration was cancelled";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v9 = [v6 errorWithDomain:v7 code:46008 userInfo:v8];

    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v9 = 0;
  if (a3) {
LABEL_5:
  }
    *a3 = v9;
LABEL_6:

  return v5;
}

- (int64_t)runMigrationAction:(id)a3 withCoordinator:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 1;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__56920;
  v29 = __Block_byref_object_dispose__56921;
  id v30 = 0;
  v10 = (void *)MEMORY[0x19F38D3B0]();
  pl_dispatch_once();
  uint64_t v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = [(PLModelMigration *)self pathManager];
  v14 = [(PLModelMigration *)self graphCache];
  v15 = PLManagedObjectContextForMigrationActionWithCoordinator(v9, v12, v13, v14);

  +[PLEnumerateAndSaveController disableConcurrencyLimiterForContext:v15];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__PLModelMigration_runMigrationAction_withCoordinator_error___block_invoke;
  v20[3] = &unk_1E5874900;
  v23 = &v31;
  id v16 = v8;
  id v21 = v16;
  id v17 = v15;
  id v22 = v17;
  v24 = &v25;
  [v17 performBlockAndWait:v20];

  if (a5) {
    *a5 = (id) v26[5];
  }
  int64_t v18 = v32[3];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v18;
}

uint64_t __61__PLModelMigration_runMigrationAction_withCoordinator_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 performActionWithManagedObjectContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v5;
  return [(id)a1[5] reset];
}

- (id)_stagedManagedObjectModelURLWithStageVersion:(id)a3
{
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"photos-%d-STAGED", objc_msgSend(a3, "intValue"));
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 URLForResource:v3 withExtension:@"omo"];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v6 URLForResource:v3 withExtension:@"mom"];
  }
  return v5;
}

- (id)_managedObjectModelForLightweightMigrationStageWithURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v3];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "setManagedObjectClassName:", 0, (void)v10);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_nextRequiredStagedMigrationVersionAfterVersion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 integerValue];
  id v4 = &unk_1EEBF2048;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = &unk_1EEBF2048;
  uint64_t v6 = [&unk_1EEBF2048 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(&unk_1EEBF2048);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v3 < (int)objc_msgSend(v10, "intValue", (void)v13))
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [&unk_1EEBF2048 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)addStoreWithCoordinator:(id)a3 migrationUUID:(id)a4 storeURL:(id)a5 options:(id)a6 description:(id)a7 fromVersion:(int)a8 toVersion:(int)a9 progress:(id)a10 progressUnitCount:(unint64_t)a11 error:(id *)a12
{
  uint64_t v41 = *(void *)&a8;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v44 = a4;
  id v43 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__56920;
  v63 = __Block_byref_object_dispose__56921;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__56920;
  v57 = __Block_byref_object_dispose__56921;
  id v58 = 0;
  id obj = 0;
  LOBYTE(a7) = [(PLModelMigration *)self isMigrationCancelledWithError:&obj];
  objc_storeStrong(&v58, obj);
  if ((a7 & 1) == 0)
  {
    v40 = [NSString stringWithFormat:@"%@ (version: %d -> %d)", v18, v41, a9];
    v20 = [PLModelMigrationActionProcessor alloc];
    id v21 = [(PLModelMigration *)self pathManager];
    id v22 = [(PLModelMigration *)self analyticsEventManager];
    v23 = [(PLModelMigration *)self logger];
    v24 = [(PLModelMigrationActionProcessor *)v20 initWithUUID:v44 pathManager:v21 migrationActionType:0 analyticsEventManager:v22 logger:v23 progressUnitCount:1];

    [(PLModelMigrationActionProcessor *)v24 setIgnoreProgressUpdates:1];
    uint64_t v25 = [(PLModelMigrationActionProcessor *)v24 progress];
    [v19 addChild:v25 withPendingUnitCount:a11];

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __142__PLModelMigration_addStoreWithCoordinator_migrationUUID_storeURL_options_description_fromVersion_toVersion_progress_progressUnitCount_error___block_invoke;
    v45[3] = &unk_1E586BAE8;
    v26 = v24;
    v46 = v26;
    v50 = &v59;
    id v47 = v42;
    id v48 = v43;
    id v49 = v17;
    v51 = &v53;
    [(PLModelMigrationActionProcessor *)v26 performActionWithName:v40 ifRequired:1 block:v45];
    if (![(PLModelMigrationActionProcessor *)v26 isSuccess])
    {
      uint64_t v27 = PLMigrationGetLog();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (v28)
      {
        v29 = [(PLModelMigration *)self logger];
        BOOL v30 = v29 == 0;

        if (v30)
        {
          v35 = PLMigrationGetLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            uint64_t v36 = v54[5];
            LODWORD(buf) = 67109634;
            DWORD1(buf) = v41;
            WORD4(buf) = 1024;
            *(_DWORD *)((char *)&buf + 10) = a9;
            HIWORD(buf) = 2112;
            *(void *)&long long v71 = v36;
            _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Failed to open store for migration from version %d to %d. Error %@", (uint8_t *)&buf, 0x18u);
          }
        }
        else
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
          long long buf = 0u;
          long long v71 = 0u;
          uint64_t v31 = PLMigrationGetLog();
          os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
          uint64_t v32 = v54[5];
          v65[0] = 67109634;
          v65[1] = v41;
          __int16 v66 = 1024;
          int v67 = a9;
          __int16 v68 = 2112;
          uint64_t v69 = v32;
          LODWORD(v39) = 24;
          uint64_t v33 = (long long *)_os_log_send_and_compose_impl();

          uint64_t v34 = [(PLModelMigration *)self logger];
          objc_msgSend(v34, "logWithMessage:fromCodeLocation:type:", v33, "PLModelMigration.m", 582, 16);

          if (v33 != &buf) {
            free(v33);
          }
        }
      }
    }
  }
  if (a12) {
    *a12 = (id) v54[5];
  }
  id v37 = (id)v60[5];
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  return v37;
}

BOOL __142__PLModelMigration_addStoreWithCoordinator_migrationUUID_storeURL_options_description_fromVersion_toVersion_progress_progressUnitCount_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progress];
  [v2 becomeCurrentWithPendingUnitCount:1];

  uint64_t v3 = *MEMORY[0x1E4F1BF70];
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v4 addPersistentStoreWithType:v3 configuration:0 URL:v5 options:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = [*(id *)(a1 + 32) progress];
  [v11 resignCurrent];

  return *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
}

- (int64_t)migratePostProcessingWithActions:(id)a3 migrationActionType:(int64_t)a4 progress:(id)a5 progressUnitCount:(unint64_t)a6 error:(id *)a7
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v56 = a5;
  if (a4 == 5)
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, self, @"PLModelMigration.m", 513, @"Invalid parameter not satisfying: %@", @"type != PLMigrationActionTypeBackground" object file lineNumber description];
  }
  uint64_t v78 = 0;
  long long v79 = &v78;
  uint64_t v80 = 0x3032000000;
  long long v81 = __Block_byref_object_copy__56920;
  long long v82 = __Block_byref_object_dispose__56921;
  id v83 = 0;
  uint64_t v74 = 0;
  long long v75 = &v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  id obj = 0;
  v62 = self;
  BOOL v12 = [(PLModelMigration *)self isMigrationCancelledWithError:&obj];
  objc_storeStrong(&v83, obj);
  uint64_t v13 = 1;
  if (v12) {
    uint64_t v13 = 2;
  }
  uint64_t v77 = v13;
  if ([v58 count] && v75[3] == 1)
  {
    long long v14 = [PLModelMigrationActionProcessor alloc];
    long long v15 = [(PLModelMigration *)self migrationUUID];
    long long v16 = [(PLModelMigration *)self pathManager];
    id v17 = [(PLModelMigration *)self analyticsEventManager];
    id v18 = [(PLModelMigration *)self logger];
    if (a4 == 4) {
      unint64_t v19 = 0;
    }
    else {
      unint64_t v19 = a6;
    }
    v20 = [(PLModelMigrationActionProcessor *)v14 initWithUUID:v15 pathManager:v16 migrationActionType:a4 analyticsEventManager:v17 logger:v18 progressUnitCount:v19];

    [(PLModelMigrationActionProcessor *)v20 setIgnoreProgressUpdates:1];
    id v21 = [(PLModelMigrationActionProcessor *)v20 progress];

    if (v21)
    {
      id v22 = [(PLModelMigrationActionProcessor *)v20 progress];
      [v56 addChild:v22 withPendingUnitCount:a6];
    }
    v23 = [(PLModelMigration *)self migrationContext];
    v24 = [v23 store];
    uint64_t v61 = [v24 persistentStoreCoordinator];

    long long v72 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v69 = 0u;
    id v59 = v58;
    uint64_t v25 = [v59 countByEnumeratingWithState:&v69 objects:v119 count:16];
    if (v25)
    {
      uint64_t v60 = *(void *)v70;
LABEL_14:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v70 != v60) {
          objc_enumerationMutation(v59);
        }
        uint64_t v27 = *(void **)(*((void *)&v69 + 1) + 8 * v26);
        BOOL v28 = (void *)MEMORY[0x19F38D3B0]();
        v29 = [v27 progress];
        BOOL v30 = [(PLModelMigrationActionProcessor *)v20 progress];
        objc_msgSend(v30, "addChild:withPendingUnitCount:", v29, objc_msgSend((id)objc_opt_class(), "actionProgressWeight"));

        uint64_t v31 = NSString;
        uint64_t v32 = [(id)objc_opt_class() actionDescription];
        uint64_t v33 = [v31 stringWithFormat:@"%@", v32];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __106__PLModelMigration_migratePostProcessingWithActions_migrationActionType_progress_progressUnitCount_error___block_invoke;
        v64[3] = &unk_1E586BAE8;
        int v67 = &v74;
        v64[4] = v62;
        v64[5] = v27;
        id v65 = v61;
        __int16 v68 = &v78;
        id v34 = v29;
        id v66 = v34;
        [(PLModelMigrationActionProcessor *)v20 performActionWithName:v33 ifRequired:1 block:v64];

        if ([(PLModelMigrationActionProcessor *)v20 isSuccess])
        {
          v35 = (id *)(v79 + 5);
          id v63 = (id)v79[5];
          BOOL v36 = [(PLModelMigration *)v62 isMigrationCancelledWithError:&v63];
          objc_storeStrong(v35, v63);
          if (v36)
          {
            int v37 = 0;
            v75[3] = 2;
          }
          else
          {
            int v37 = 1;
          }
        }
        else
        {
          v38 = PLMigrationGetLog();
          BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);

          if (v39)
          {
            v40 = [(PLModelMigration *)v62 logger];
            BOOL v41 = v40 == 0;

            if (v41)
            {
              id v48 = PLMigrationGetLog();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                id v49 = (objc_class *)objc_opt_class();
                v50 = NSStringFromClass(v49);
                uint64_t v51 = v79[5];
                *(_DWORD *)long long buf = 138543618;
                *(void *)&buf[4] = v50;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v51;
                _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "%{public}@ failed. Error: %{public}@", buf, 0x16u);
              }
            }
            else
            {
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
              memset(buf, 0, sizeof(buf));
              id v42 = PLMigrationGetLog();
              os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
              id v43 = (objc_class *)objc_opt_class();
              id v44 = NSStringFromClass(v43);
              uint64_t v45 = v79[5];
              int v84 = 138543618;
              long long v85 = v44;
              __int16 v86 = 2114;
              uint64_t v87 = v45;
              LODWORD(v55) = 22;
              v46 = (uint8_t *)_os_log_send_and_compose_impl();

              id v47 = [(PLModelMigration *)v62 logger];
              objc_msgSend(v47, "logWithMessage:fromCodeLocation:type:", v46, "PLModelMigration.m", 550, 16);

              if (v46 != buf) {
                free(v46);
              }
            }
          }
          int v37 = 0;
        }

        if (!v37) {
          break;
        }
        if (v25 == ++v26)
        {
          uint64_t v25 = [v59 countByEnumeratingWithState:&v69 objects:v119 count:16];
          if (v25) {
            goto LABEL_14;
          }
          break;
        }
      }
    }
  }
  if (a7) {
    *a7 = (id) v79[5];
  }
  int64_t v52 = v75[3];
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  return v52;
}

BOOL __106__PLModelMigration_migratePostProcessingWithActions_migrationActionType_progress_progressUnitCount_error___block_invoke(uint64_t a1)
{
  v16[72] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v14 = 0;
  uint64_t v5 = [v2 runMigrationAction:v3 withCoordinator:v4 error:&v14];
  id v6 = v14;
  uint64_t v7 = v6;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v5;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 1
    && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    if (v6)
    {
      uint64_t v15 = *MEMORY[0x1E4F28A50];
      v16[0] = v6;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46008 userInfo:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "totalUnitCount"));
  BOOL v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 1;

  return v12;
}

- (int64_t)migratePostProcessingWithProgressUnitCount:(unint64_t)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  [(PLModelMigration *)self actionRegistration];
  unint64_t v7 = self->_actionProgressPortionPreRepair + self->_actionProgressPortion + self->_actionProgressPortionPostRepair;
  uint64_t v8 = (uint64_t)((double)v7 * 0.5);
  uint64_t v9 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:v7 + v8];
  uint64_t v10 = [(PLModelMigration *)self progress];
  [v10 addChild:v9 withPendingUnitCount:a3];

  actionsPreRepair = self->_actionsPreRepair;
  unint64_t actionProgressPortionPreRepair = self->_actionProgressPortionPreRepair;
  id v32 = 0;
  int64_t v13 = [(PLModelMigration *)self migratePostProcessingWithActions:actionsPreRepair migrationActionType:2 progress:v9 progressUnitCount:actionProgressPortionPreRepair error:&v32];
  id v14 = v32;
  if (v13 == 1)
  {
    uint64_t v15 = [(PLModelMigration *)self legacyMigrationDelegate];
    long long v16 = [(PLModelMigration *)self migrationContext];
    id v17 = [v16 store];
    id v18 = [(PLModelMigration *)self migrationUUID];
    unint64_t v19 = [(PLModelMigration *)self migrationContext];
    char v20 = objc_msgSend(v15, "postProcessMigratedStore:migrationUUID:fromVersion:progress:progressUnitCount:", v17, v18, objc_msgSend(v19, "previousStoreVersion"), v9, v8);

    if (v20)
    {
      actions = self->_actions;
      unint64_t actionProgressPortion = self->_actionProgressPortion;
      id v31 = v14;
      int64_t v13 = [(PLModelMigration *)self migratePostProcessingWithActions:actions migrationActionType:1 progress:v9 progressUnitCount:actionProgressPortion error:&v31];
      id v23 = v31;

      if (v13 != 1)
      {
        id v14 = v23;
        if (!a4) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
      actionsPostRepair = self->_actionsPostRepair;
      unint64_t actionProgressPortionPostRepair = self->_actionProgressPortionPostRepair;
      id v30 = v23;
      int64_t v13 = [(PLModelMigration *)self migratePostProcessingWithActions:actionsPostRepair migrationActionType:3 progress:v9 progressUnitCount:actionProgressPortionPostRepair error:&v30];
      id v14 = v30;
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F8C500];
      uint64_t v33 = *MEMORY[0x1E4F28588];
      v34[0] = @"Legacy post migration failed";
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      uint64_t v28 = [v26 errorWithDomain:v27 code:46008 userInfo:v23];

      int64_t v13 = 3;
      id v14 = (id)v28;
    }
  }
  if (a4) {
LABEL_8:
  }
    *a4 = v14;
LABEL_9:

  return v13;
}

- (int64_t)migrateSchemaMigrationWithAutoMigrationOptions:(id)a3 currentStoreVersion:(id)a4 error:(id *)a5
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = NSNumber;
  id v9 = a3;
  uint64_t v10 = [(PLModelMigration *)self migrationContext];
  id v11 = objc_msgSend(v8, "numberWithUnsignedShort:", objc_msgSend(v10, "previousStoreVersion"));
  char v12 = [v11 isEqual:v7];

  id v78 = v7;
  if ((v12 & 1) == 0)
  {
    int64_t v13 = PLMigrationGetLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

    if (v14)
    {
      uint64_t v15 = [(PLModelMigration *)self logger];

      if (v15)
      {
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
        memset(buf, 0, sizeof(buf));
        long long v16 = PLMigrationGetLog();
        os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        id v17 = NSNumber;
        id v18 = [(PLModelMigration *)self migrationContext];
        unint64_t v19 = objc_msgSend(v17, "numberWithUnsignedShort:", objc_msgSend(v18, "previousStoreVersion"));
        int v84 = 138543618;
        id v85 = v19;
        __int16 v86 = 1024;
        LODWORD(v87[0]) = +[PLModelMigration currentModelVersion];
        LODWORD(v74) = 18;
        char v20 = (uint8_t *)_os_log_send_and_compose_impl();

        id v21 = [(PLModelMigration *)self logger];
        objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigration.m", 442, 1);

        if (v20 != buf) {
          free(v20);
        }
        id v7 = v78;
      }
      else
      {
        id v22 = PLMigrationGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          id v23 = NSNumber;
          v24 = [(PLModelMigration *)self migrationContext];
          uint64_t v25 = objc_msgSend(v23, "numberWithUnsignedShort:", objc_msgSend(v24, "previousStoreVersion"));
          *(_DWORD *)long long buf = 138543618;
          *(void *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = +[PLModelMigration currentModelVersion];
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "Staged lightweight migration completed, post processing from version %{public}@ to %d.", buf, 0x12u);
        }
      }
    }
  }
  uint64_t v26 = [(PLModelMigration *)self analyticsEventManager];
  [v26 startRecordingTimedEventToken];
  double v28 = v27;

  v29 = [(PLModelMigration *)self migrationContext];
  id v30 = [v29 coordinator];
  id v31 = [(PLModelMigration *)self migrationUUID];
  id v32 = [(PLModelMigration *)self migrationContext];
  uint64_t v33 = [v32 storeURL];
  uint64_t v34 = [v7 intValue];
  int v35 = +[PLModelMigration currentModelVersion];
  BOOL v36 = [(PLModelMigration *)self progress];
  id v81 = 0;
  LODWORD(v73) = v35;
  int v37 = [(PLModelMigration *)self addStoreWithCoordinator:v30 migrationUUID:v31 storeURL:v33 options:v9 description:@"Adding lightweight migration store" fromVersion:v34 toVersion:v73 progress:v36 progressUnitCount:10 error:&v81];

  id v38 = v81;
  BOOL v39 = [(PLModelMigration *)self migrationContext];
  [v39 setStore:v37];

  v40 = [(PLModelMigration *)self analyticsEventManager];
  [v40 addRecordingTimedEventSnippetWithToken:*MEMORY[0x1E4F8BD60] forKey:*MEMORY[0x1E4F8BD30] onEventWithName:v28];

  BOOL v41 = [(PLModelMigration *)self migrationContext];
  id v42 = [v41 store];

  if (v42)
  {
    if (self->_hadStagedMigration) {
      uint64_t v43 = 80;
    }
    else {
      uint64_t v43 = 90;
    }
    id v80 = v38;
    int64_t v44 = [(PLModelMigration *)self migratePostProcessingWithProgressUnitCount:v43 error:&v80];
    id v45 = v80;

    if (v44 == 1)
    {
      v46 = a5;
      id v47 = v78;
      if (!a5) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
    v57 = [(PLModelMigration *)self migrationContext];
    id v58 = [v57 coordinator];
    id v59 = [(PLModelMigration *)self migrationContext];
    uint64_t v60 = [v59 store];
    id v79 = 0;
    char v61 = [v58 removePersistentStore:v60 error:&v79];
    id v48 = v79;

    if (v61) {
      goto LABEL_25;
    }
    v62 = PLMigrationGetLog();
    BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);

    id v47 = v78;
    if (v63)
    {
      id v64 = [(PLModelMigration *)self logger];

      if (v64)
      {
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
        memset(buf, 0, sizeof(buf));
        id v65 = PLMigrationGetLog();
        os_log_type_enabled(v65, OS_LOG_TYPE_ERROR);
        int v66 = +[PLModelMigration currentModelVersion];
        int v84 = 138543874;
        id v85 = v78;
        __int16 v86 = 1024;
        LODWORD(v87[0]) = v66;
        WORD2(v87[0]) = 2114;
        *(void *)((char *)v87 + 6) = v48;
        LODWORD(v75) = 28;
        int v67 = (uint8_t *)_os_log_send_and_compose_impl();

        __int16 v68 = [(PLModelMigration *)self logger];
        objc_msgSend(v68, "logWithMessage:fromCodeLocation:type:", v67, "PLModelMigration.m", 452, 16);

        if (v67 != buf) {
          free(v67);
        }
LABEL_25:
        v46 = a5;
        id v47 = v78;
        goto LABEL_35;
      }
      long long v71 = PLMigrationGetLog();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        int v72 = +[PLModelMigration currentModelVersion];
        *(_DWORD *)long long buf = 138543874;
        *(void *)&buf[4] = v78;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v72;
        *(_WORD *)&buf[18] = 2114;
        *(void *)&buf[20] = v48;
        _os_log_impl(&dword_19B3C7000, v71, OS_LOG_TYPE_ERROR, "Failed to remove store after lightweight migration failure %{public}@ to %d.  Error %{public}@", buf, 0x1Cu);
      }
    }
  }
  else
  {
    id v48 = [NSString stringWithFormat:@"Failed to open and lightweight migrate store from schema version based on %@ to %d", v78, +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion")];
    uint64_t v82 = *MEMORY[0x1E4F28588];
    id v83 = v48;
    id v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    v50 = (void *)[v49 mutableCopy];

    if (v38) {
      [v50 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    id v45 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46008 userInfo:v50];

    uint64_t v51 = PLMigrationGetLog();
    BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);

    id v47 = v78;
    if (v52)
    {
      uint64_t v53 = [(PLModelMigration *)self logger];

      if (v53)
      {
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
        memset(buf, 0, sizeof(buf));
        v54 = PLMigrationGetLog();
        os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
        int v84 = 138543618;
        id v85 = v48;
        __int16 v86 = 2114;
        v87[0] = v45;
        LODWORD(v76) = 22;
        uint64_t v55 = (uint8_t *)_os_log_send_and_compose_impl();

        id v56 = [(PLModelMigration *)self logger];
        objc_msgSend(v56, "logWithMessage:fromCodeLocation:type:", v55, "PLModelMigration.m", 463, 16);

        if (v55 != buf) {
          free(v55);
        }
        id v47 = v78;
      }
      else
      {
        long long v69 = PLMigrationGetLog();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          *(void *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v45;
          _os_log_impl(&dword_19B3C7000, v69, OS_LOG_TYPE_ERROR, "%{public}@. Error: %{public}@", buf, 0x16u);
        }
      }
    }

    int64_t v44 = 3;
  }
  v46 = a5;
LABEL_35:

  if (v46) {
LABEL_36:
  }
    id *v46 = v45;
LABEL_37:

  return v44;
}

- (int64_t)migrateStagedMigrationWithAutoMigrationOptions:(id)a3 currentStoreVersion:(id)a4 error:(id *)a5
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v95 = a3;
  id v8 = a4;
  id v9 = NSNumber;
  uint64_t v10 = [(PLModelMigration *)self migrationContext];
  id v11 = objc_msgSend(v9, "numberWithUnsignedShort:", objc_msgSend(v10, "previousStoreVersion"));
  char v12 = [(PLModelMigration *)self _nextRequiredStagedMigrationVersionAfterVersion:v11];

  long long v90 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v13 = (void *)MEMORY[0x1E4F28F90];
  id v14 = &unk_1EEBF2048;
  uint64_t v15 = objc_msgSend(v13, "discreteProgressWithTotalUnitCount:", 5 * objc_msgSend(&unk_1EEBF2048, "count"));

  self->_hadStagedMigration = v12 != 0;
  if (!v12)
  {
    id v19 = 0;
    int64_t v55 = 1;
    goto LABEL_46;
  }
  id v85 = a5;
  long long v16 = [(PLModelMigration *)self progress];
  long long v91 = v15;
  [v16 addChild:v15 withPendingUnitCount:10];

  id v17 = 0;
  uint64_t v89 = *MEMORY[0x1E4F8BD60];
  uint64_t v92 = *MEMORY[0x1E4F8BD30];
  uint64_t v93 = *MEMORY[0x1E4F28588];
  uint64_t v94 = *MEMORY[0x1E4F8C500];
  uint64_t v88 = *MEMORY[0x1E4F8BD68];
  uint64_t v86 = *MEMORY[0x1E4F28A50];
  while (1)
  {
    id v102 = v17;
    BOOL v18 = [(PLModelMigration *)self isMigrationCancelledWithError:&v102];
    id v19 = v102;

    if (v18)
    {
      int64_t v55 = 2;
      goto LABEL_45;
    }
    char v20 = (void *)MEMORY[0x19F38D3B0]();
    id v21 = [(PLModelMigration *)self _stagedManagedObjectModelURLWithStageVersion:v12];
    id v22 = PLMigrationGetLog();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v23)
    {
      v24 = [(PLModelMigration *)self logger];

      if (v24)
      {
        uint64_t v25 = v20;
        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        memset(buf, 0, sizeof(buf));
        uint64_t v26 = PLMigrationGetLog();
        os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        double v27 = [v21 path];
        int v109 = 138543874;
        id v110 = v8;
        __int16 v111 = 2114;
        id v112 = v12;
        __int16 v113 = 2112;
        long long v114 = v27;
        LODWORD(v84) = 32;
        double v28 = (uint8_t *)_os_log_send_and_compose_impl();

        v29 = [(PLModelMigration *)self logger];
        objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigration.m", 375, 0);

        if (v28 != buf) {
          free(v28);
        }
        char v20 = v25;
      }
      else
      {
        id v30 = PLMigrationGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v31 = [v21 path];
          *(_DWORD *)long long buf = 138543874;
          *(void *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v12;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v31;
          _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "Starting migration stage from version %{public}@ to %{public}@, with model %@.", buf, 0x20u);
        }
      }
    }
    id v32 = [(PLModelMigration *)self _managedObjectModelForLightweightMigrationStageWithURL:v21];
    long long v99 = v21;
    if (v32)
    {
      long long v97 = v20;
      long long v96 = v32;
      uint64_t v33 = [objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v32];
      uint64_t v34 = [(PLModelMigration *)self analyticsEventManager];
      [v34 startRecordingTimedEventToken];
      double v36 = v35;

      int v37 = [(PLModelMigration *)self migrationUUID];
      id v38 = [(PLModelMigration *)self migrationContext];
      BOOL v39 = [v38 storeURL];
      uint64_t v40 = [v8 intValue];
      int v41 = [v12 intValue];
      id v101 = v19;
      LODWORD(v83) = v41;
      long long v98 = (void *)v33;
      id v42 = [(PLModelMigration *)self addStoreWithCoordinator:v33 migrationUUID:v37 storeURL:v39 options:v95 description:@"Adding staged migration store" fromVersion:v40 toVersion:v83 progress:v91 progressUnitCount:1 error:&v101];
      id v43 = v101;

      if (v42)
      {
        int64_t v44 = [(PLModelMigration *)self analyticsEventManager];
        [v44 addRecordingTimedEventSnippetWithToken:v89 forKey:v92 onEventWithName:v36];

        id v45 = [(PLModelMigration *)self analyticsEventManager];
        [v45 startRecordingTimedEventToken];
        double v47 = v46;

        id v48 = [(PLModelMigration *)self legacyMigrationDelegate];
        id v49 = [(PLModelMigration *)self migrationUUID];
        int v50 = objc_msgSend(v48, "processWelterweightMigrationStageOnStore:migrationUUID:fromVersion:toVersion:migrationContext:progress:progressUnitCount:", v42, v49, objc_msgSend(v8, "intValue"), objc_msgSend(v12, "intValue"), v90, v91, 2);

        if (v50)
        {
          uint64_t v51 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          actionsStaged = self->_actionsStaged;
          self->_actionsStaged = v51;

          PLModelMigrationActionRegistration_Staged(self, (unsigned __int16)[v8 intValue], (unsigned __int16)objc_msgSend(v12, "intValue"));
          uint64_t v53 = [(PLModelMigration *)self migrationContext];
          [v53 setStore:v42];

          v54 = self->_actionsStaged;
          id v100 = v43;
          int64_t v55 = [(PLModelMigration *)self migratePostProcessingWithActions:v54 migrationActionType:4 progress:v91 progressUnitCount:2 error:&v100];
          id v17 = v100;
        }
        else
        {
          uint64_t v77 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v107 = v93;
          long long v108 = @"Legacy Staged migration failed";
          uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
          id v17 = [v77 errorWithDomain:v94 code:46013 userInfo:v78];

          id v43 = (id)v78;
          int64_t v55 = 3;
        }

        __int16 v68 = [(PLModelMigration *)self analyticsEventManager];
        [v68 addRecordingTimedEventSnippetWithToken:v88 forKey:v92 onEventWithName:v47];
        char v20 = v97;
      }
      else
      {
        int v66 = NSString;
        int v67 = [v99 path];
        __int16 v68 = [v66 stringWithFormat:@"Failed to open store for staged migration from version %@ to %@, with model %@", v8, v12, v67];

        uint64_t v105 = v93;
        long long v106 = v68;
        long long v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
        long long v70 = (void *)[v69 mutableCopy];

        if (v43) {
          [v70 setObject:v43 forKeyedSubscript:v86];
        }
        uint64_t v87 = v70;
        id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:v94 code:46013 userInfo:v70];

        long long v71 = PLMigrationGetLog();
        BOOL v72 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);

        id v32 = v96;
        char v20 = v97;
        id v42 = 0;
        if (v72)
        {
          uint64_t v73 = [(PLModelMigration *)self logger];

          if (v73)
          {
            long long v144 = 0u;
            long long v145 = 0u;
            long long v142 = 0u;
            long long v143 = 0u;
            long long v140 = 0u;
            long long v141 = 0u;
            long long v138 = 0u;
            long long v139 = 0u;
            long long v136 = 0u;
            long long v137 = 0u;
            long long v134 = 0u;
            long long v135 = 0u;
            long long v132 = 0u;
            long long v133 = 0u;
            long long v130 = 0u;
            long long v131 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            long long v126 = 0u;
            long long v127 = 0u;
            long long v124 = 0u;
            long long v125 = 0u;
            long long v122 = 0u;
            long long v123 = 0u;
            long long v120 = 0u;
            long long v121 = 0u;
            long long v118 = 0u;
            long long v119 = 0u;
            long long v116 = 0u;
            long long v117 = 0u;
            memset(buf, 0, sizeof(buf));
            uint64_t v74 = PLMigrationGetLog();
            os_log_type_enabled(v74, OS_LOG_TYPE_ERROR);
            int v109 = 138543618;
            id v110 = v68;
            __int16 v111 = 2114;
            id v112 = v17;
            LODWORD(v84) = 22;
            uint64_t v75 = (uint8_t *)_os_log_send_and_compose_impl();

            uint64_t v76 = [(PLModelMigration *)self logger];
            objc_msgSend(v76, "logWithMessage:fromCodeLocation:type:", v75, "PLModelMigration.m", 414, 16);

            if (v75 != buf) {
              free(v75);
            }
            id v42 = 0;
          }
          else
          {
            id v80 = PLMigrationGetLog();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138543618;
              *(void *)&buf[4] = v68;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v17;
              _os_log_impl(&dword_19B3C7000, v80, OS_LOG_TYPE_ERROR, "%{public}@. Error: %{public}@", buf, 0x16u);
            }
          }
        }

        int64_t v55 = 3;
      }
    }
    else
    {
      id v56 = NSString;
      v57 = [v21 path];
      uint64_t v58 = [v56 stringWithFormat:@"Failed to open model for staged migration from version %@ to %@, with model path %@", v8, v12, v57];

      id v59 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v103 = v93;
      uint64_t v104 = v58;
      long long v98 = (void *)v58;
      uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
      id v17 = [v59 errorWithDomain:v94 code:46013 userInfo:v60];

      char v61 = PLMigrationGetLog();
      LODWORD(v60) = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v60) {
        goto LABEL_33;
      }
      v62 = [(PLModelMigration *)self logger];

      if (!v62)
      {
        id v79 = PLMigrationGetLog();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          *(void *)&buf[4] = v98;
          _os_log_impl(&dword_19B3C7000, v79, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

LABEL_33:
        int64_t v55 = 3;
        goto LABEL_39;
      }
      long long v144 = 0u;
      long long v145 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      memset(buf, 0, sizeof(buf));
      BOOL v63 = PLMigrationGetLog();
      os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);
      int v109 = 138543362;
      id v110 = v98;
      LODWORD(v84) = 12;
      id v64 = (uint8_t *)_os_log_send_and_compose_impl();

      id v65 = [(PLModelMigration *)self logger];
      objc_msgSend(v65, "logWithMessage:fromCodeLocation:type:", v64, "PLModelMigration.m", 420, 16);

      if (v64 != buf) {
        free(v64);
      }
      int64_t v55 = 3;
    }
LABEL_39:

    if (v55 != 1) {
      break;
    }
    id v81 = v12;

    char v12 = [(PLModelMigration *)self _nextRequiredStagedMigrationVersionAfterVersion:v81];

    id v8 = v81;
    if (!v12)
    {
      id v8 = v81;
      id v19 = v17;
      int64_t v55 = 1;
      goto LABEL_45;
    }
  }
  id v19 = v17;
LABEL_45:
  a5 = v85;
  uint64_t v15 = v91;
LABEL_46:
  objc_msgSend(v15, "setCompletedUnitCount:", objc_msgSend(v15, "totalUnitCount"));
  if (a5) {
    *a5 = v19;
  }

  return v55;
}

- (int64_t)setupWithError:(id *)a3
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = PLMigrationGetLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    id v7 = [(PLModelMigration *)self logger];

    if (v7)
    {
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
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      *(_OWORD *)long long buf = 0u;
      long long v108 = 0u;
      id v8 = PLMigrationGetLog();
      os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      id v9 = [(PLModelMigration *)self migrationContext];
      int v103 = 67109376;
      int v104 = [v9 previousStoreVersion];
      __int16 v105 = 1024;
      int v106 = +[PLModelMigration currentModelVersion];
      LODWORD(v92) = 14;
      uint64_t v10 = (uint8_t *)_os_log_send_and_compose_impl();

      id v11 = [(PLModelMigration *)self logger];
      objc_msgSend(v11, "logWithMessage:fromCodeLocation:type:", v10, "PLModelMigration.m", 315, 1);

      if (v10 != buf) {
        free(v10);
      }
    }
    else
    {
      char v12 = PLMigrationGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int64_t v13 = [(PLModelMigration *)self migrationContext];
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)&buf[4] = [v13 previousStoreVersion];
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = +[PLModelMigration currentModelVersion];
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "Store has incompatible model version %d, will attempt migration to current version %d.", buf, 0xEu);
      }
    }
  }
  int v14 = +[PLModelMigration currentModelVersion];
  uint64_t v15 = [(PLModelMigration *)self migrationContext];
  int v16 = [v15 previousStoreVersion];

  if (v14 < v16)
  {
    BOOL allowRebuild = self->_allowRebuild;
    BOOL v18 = PLMigrationGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (allowRebuild)
    {
      if (!v19) {
        goto LABEL_31;
      }
      char v20 = [(PLModelMigration *)self logger];

      if (v20)
      {
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
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        *(_OWORD *)long long buf = 0u;
        long long v108 = 0u;
        id v21 = PLMigrationGetLog();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        id v22 = [(PLModelMigration *)self migrationContext];
        int v23 = [v22 previousStoreVersion];
        int v24 = +[PLModelMigration currentModelVersion];
        int v103 = 67109376;
        int v104 = v23;
        __int16 v105 = 1024;
        int v106 = v24;
        LODWORD(v92) = 14;
        uint64_t v25 = (uint8_t *)_os_log_send_and_compose_impl();

        uint64_t v26 = [(PLModelMigration *)self logger];
        double v27 = v26;
        double v28 = v25;
        uint64_t v29 = 322;
        goto LABEL_29;
      }
      int v67 = PLMigrationGetLog();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        __int16 v68 = [(PLModelMigration *)self migrationContext];
        int v69 = [v68 previousStoreVersion];
        int v70 = +[PLModelMigration currentModelVersion];
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)&buf[4] = v69;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v70;
        long long v71 = "*** MIGRATION INVERSION ***\n"
              "***\n"
              "***\n"
              "***\n"
              "*** Photos database has a model version [%d] that is newer than the Photos frameworks model version [%d].\n"
              "***\n"
              "*** Frameworks and database are out of sync.\n"
              "*** This will trigger a rebuild from file system.\n"
              "***\n"
              "***\n";
LABEL_46:
        _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_ERROR, v71, buf, 0xEu);
      }
    }
    else
    {
      if (!v19) {
        goto LABEL_31;
      }
      uint64_t v60 = [(PLModelMigration *)self logger];

      if (v60)
      {
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
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        *(_OWORD *)long long buf = 0u;
        long long v108 = 0u;
        char v61 = PLMigrationGetLog();
        os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
        v62 = [(PLModelMigration *)self migrationContext];
        int v63 = [v62 previousStoreVersion];
        int v64 = +[PLModelMigration currentModelVersion];
        int v103 = 67109376;
        int v104 = v63;
        __int16 v105 = 1024;
        int v106 = v64;
        LODWORD(v92) = 14;
        uint64_t v25 = (uint8_t *)_os_log_send_and_compose_impl();

        uint64_t v26 = [(PLModelMigration *)self logger];
        double v27 = v26;
        double v28 = v25;
        uint64_t v29 = 324;
LABEL_29:
        objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigration.m", v29, 16);

        if (v25 != buf) {
          free(v25);
        }
LABEL_31:
        if (a3)
        {
LABEL_32:
          uint64_t v94 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v96 = *MEMORY[0x1E4F8C500];
          v101[0] = *MEMORY[0x1E4F28328];
          long long v97 = [(PLModelMigration *)self migrationContext];
          uint64_t v40 = [v97 storeURL];
          [v40 path];
          int v41 = v98 = a3;
          v102[0] = v41;
          v101[1] = *MEMORY[0x1E4F289D0];
          id v42 = [(PLModelMigration *)self migrationContext];
          id v43 = [v42 storeURL];
          int64_t v44 = [v43 URLByDeletingLastPathComponent];
          id v45 = [v44 URLByDeletingLastPathComponent];
          v102[1] = v45;
          v101[2] = *MEMORY[0x1E4F28228];
          id v65 = NSString;
          double v47 = [(PLModelMigration *)self migrationContext];
          id v48 = objc_msgSend(v65, "stringWithFormat:", @"Database schema version %d is newer than the current schema version %d. A newer version of Photos needs to be installed.", objc_msgSend(v47, "previousStoreVersion"), +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion"));
          v102[2] = v48;
          int64_t v49 = 3;
          int v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:3];
          uint64_t v51 = v94;
          uint64_t v52 = v96;
          uint64_t v53 = 46006;
          goto LABEL_33;
        }
        return 3;
      }
      int v67 = PLMigrationGetLog();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        __int16 v68 = [(PLModelMigration *)self migrationContext];
        int v78 = [v68 previousStoreVersion];
        int v79 = +[PLModelMigration currentModelVersion];
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)&buf[4] = v78;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v79;
        long long v71 = "*** MIGRATION INVERSION ***\n"
              "***\n"
              "***\n"
              "***\n"
              "*** Photos database has a model version [%d] that is newer than the Photos frameworks model version [%d].\n"
              "***\n"
              "***\n";
        goto LABEL_46;
      }
    }

    if (a3) {
      goto LABEL_32;
    }
    return 3;
  }
  id v30 = [(PLModelMigration *)self migrationContext];
  unsigned int v31 = [v30 previousStoreVersion] >> 1;

  if (v31 <= 0xBBA)
  {
    id v32 = PLMigrationGetLog();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

    if (v33)
    {
      uint64_t v34 = [(PLModelMigration *)self logger];

      if (!v34)
      {
        BOOL v72 = PLMigrationGetLog();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          uint64_t v73 = [(PLModelMigration *)self migrationContext];
          int v74 = [v73 previousStoreVersion];
          *(_DWORD *)long long buf = 67109376;
          *(_DWORD *)&buf[4] = v74;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 6006;
          _os_log_impl(&dword_19B3C7000, v72, OS_LOG_TYPE_ERROR, "Cannot perform lightweight migration, store model version %d is older than oldest supported version %d", buf, 0xEu);
        }
        if (!a3) {
          return 3;
        }
        goto LABEL_19;
      }
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
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      *(_OWORD *)long long buf = 0u;
      long long v108 = 0u;
      double v35 = PLMigrationGetLog();
      os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
      double v36 = [(PLModelMigration *)self migrationContext];
      int v37 = [v36 previousStoreVersion];
      int v103 = 67109376;
      int v104 = v37;
      __int16 v105 = 1024;
      int v106 = 6006;
      LODWORD(v92) = 14;
      id v38 = (uint8_t *)_os_log_send_and_compose_impl();

      BOOL v39 = [(PLModelMigration *)self logger];
      objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigration.m", 331, 16);

      if (v38 != buf) {
        free(v38);
      }
    }
    if (!a3) {
      return 3;
    }
LABEL_19:
    uint64_t v93 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v95 = *MEMORY[0x1E4F8C500];
    v99[0] = *MEMORY[0x1E4F28328];
    long long v97 = [(PLModelMigration *)self migrationContext];
    uint64_t v40 = [v97 storeURL];
    [v40 path];
    int v41 = v98 = a3;
    v100[0] = v41;
    v99[1] = *MEMORY[0x1E4F289D0];
    id v42 = [(PLModelMigration *)self migrationContext];
    id v43 = [v42 storeURL];
    int64_t v44 = [v43 URLByDeletingLastPathComponent];
    id v45 = [v44 URLByDeletingLastPathComponent];
    v100[1] = v45;
    v99[2] = *MEMORY[0x1E4F28568];
    double v46 = NSString;
    double v47 = [(PLModelMigration *)self migrationContext];
    id v48 = objc_msgSend(v46, "stringWithFormat:", @"Store version %d is unsupported for migration (older than %d).", objc_msgSend(v47, "previousStoreVersion"), 6006);
    v100[2] = v48;
    int64_t v49 = 3;
    int v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:3];
    uint64_t v51 = v93;
    uint64_t v52 = v95;
    uint64_t v53 = 46011;
LABEL_33:
    *long long v98 = [v51 errorWithDomain:v52 code:v53 userInfo:v50];

    return v49;
  }
  if (!self->_allowRebuild)
  {
    int v66 = [(PLModelMigration *)self migrationContext];
    if (([v66 policy] & 4) == 0)
    {

      return 1;
    }
    uint64_t v75 = (void *)MEMORY[0x1E4F8B980];
    uint64_t v76 = [(PLModelMigration *)self pathManager];
    uint64_t v77 = [v76 libraryURL];
    LODWORD(v75) = [v75 isSystemPhotoLibraryURL:v77];

    if (!v75) {
      return 1;
    }
  }
  if (self->_didCreateSqliteErrorIndicator) {
    return 1;
  }
  v54 = PLMigrationGetLog();
  BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);

  if (v55)
  {
    id v56 = [(PLModelMigration *)self logger];

    if (v56)
    {
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
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      *(_OWORD *)long long buf = 0u;
      long long v108 = 0u;
      v57 = PLMigrationGetLog();
      os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
      LOWORD(v103) = 0;
      LODWORD(v92) = 2;
      uint64_t v58 = (uint8_t *)_os_log_send_and_compose_impl();

      id v59 = [(PLModelMigration *)self logger];
      objc_msgSend(v59, "logWithMessage:fromCodeLocation:type:", v58, "PLModelMigration.m", 339, 0);

      if (v58 != buf) {
        free(v58);
      }
    }
    else
    {
      id v80 = PLMigrationGetLog();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v80, OS_LOG_TYPE_DEFAULT, "Creating sqlite error indicator file", buf, 2u);
      }
    }
  }
  int64_t v49 = 1;
  self->_didCreateSqliteErrorIndicator = 1;
  id v81 = [(PLModelMigration *)self pathManager];
  [v81 setSqliteErrorForRebuildReason:4 allowsExit:0];

  uint64_t v82 = [(PLModelMigration *)self pathManager];
  char v83 = [v82 sqliteErrorIndicatorFileExists];

  if ((v83 & 1) == 0)
  {
    uint64_t v84 = PLMigrationGetLog();
    BOOL v85 = os_log_type_enabled(v84, OS_LOG_TYPE_ERROR);

    if (v85)
    {
      uint64_t v86 = [(PLModelMigration *)self logger];

      if (v86)
      {
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
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        *(_OWORD *)long long buf = 0u;
        long long v108 = 0u;
        uint64_t v87 = PLMigrationGetLog();
        os_log_type_enabled(v87, OS_LOG_TYPE_ERROR);
        LOWORD(v103) = 0;
        LODWORD(v92) = 2;
        uint64_t v88 = (uint8_t *)_os_log_send_and_compose_impl();

        uint64_t v89 = [(PLModelMigration *)self logger];
        objc_msgSend(v89, "logWithMessage:fromCodeLocation:type:", v88, "PLModelMigration.m", 344, 16);

        if (v88 != buf) {
          free(v88);
        }
      }
      else
      {
        long long v90 = PLMigrationGetLog();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19B3C7000, v90, OS_LOG_TYPE_ERROR, "Failed to create sqlite error indicator file to guard against lightweight migration crash loop", buf, 2u);
        }
      }
    }
    return 3;
  }
  return v49;
}

- (int64_t)migrateWithError:(id *)a3
{
  v113[1] = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL v6 = [MEMORY[0x1E4F8BA00] start];
  id v73 = 0;
  uint64_t v7 = [(PLModelMigration *)self setupWithError:&v73];
  id v8 = v73;
  id v9 = [(PLModelMigration *)self migrationContext];
  uint64_t v10 = [v9 store];
  if (v10)
  {

    if (v7 != 1) {
      goto LABEL_9;
    }
    id v11 = [(PLModelMigration *)self analyticsEventManager];
    char v12 = NSNumber;
    int64_t v13 = [(PLModelMigration *)self migrationContext];
    int v14 = objc_msgSend(v12, "numberWithUnsignedShort:", objc_msgSend(v13, "previousStoreVersion"));
    uint64_t v15 = [v14 description];
    uint64_t v16 = *MEMORY[0x1E4F8BD30];
    [v11 setPayloadValue:v15 forKey:*MEMORY[0x1E4F8BD40] onEventWithName:*MEMORY[0x1E4F8BD30]];

    id v17 = [(PLModelMigration *)self analyticsEventManager];
    BOOL v18 = objc_msgSend(NSNumber, "numberWithInt:", +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion"));
    BOOL v19 = [v18 stringValue];
    [v17 setPayloadValue:v19 forKey:*MEMORY[0x1E4F8BD78] onEventWithName:v16];

    id v70 = v8;
    uint64_t v7 = [(PLModelMigration *)self migratePostProcessingWithProgressUnitCount:100 error:&v70];
    id v20 = v70;
    id v21 = v8;
  }
  else
  {

    if (v7 != 1) {
      goto LABEL_9;
    }
    __int16 v68 = v6;
    id v22 = [(PLModelMigration *)self migrationContext];
    int v23 = [v22 options];
    id v21 = (void *)[v23 mutableCopy];

    uint64_t v24 = MEMORY[0x1E4F1CC38];
    [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1BE50]];
    [v21 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F1BDE8]];
    uint64_t v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v113[0] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:1];
    [v21 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F1BE98]];

    double v27 = NSNumber;
    double v28 = [(PLModelMigration *)self migrationContext];
    uint64_t v29 = objc_msgSend(v27, "numberWithUnsignedShort:", objc_msgSend(v28, "previousStoreVersion"));

    id v30 = [(PLModelMigration *)self analyticsEventManager];
    unsigned int v31 = [v29 stringValue];
    uint64_t v32 = *MEMORY[0x1E4F8BD30];
    [v30 setPayloadValue:v31 forKey:*MEMORY[0x1E4F8BD40] onEventWithName:*MEMORY[0x1E4F8BD30]];

    BOOL v33 = [(PLModelMigration *)self analyticsEventManager];
    uint64_t v34 = objc_msgSend(NSNumber, "numberWithInt:", +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion"));
    double v35 = [v34 description];
    [v33 setPayloadValue:v35 forKey:*MEMORY[0x1E4F8BD78] onEventWithName:v32];

    id v72 = v8;
    uint64_t v7 = [(PLModelMigration *)self migrateStagedMigrationWithAutoMigrationOptions:v21 currentStoreVersion:v29 error:&v72];
    id v20 = v72;

    if (v7 == 1)
    {
      id v71 = v20;
      uint64_t v7 = [(PLModelMigration *)self migrateSchemaMigrationWithAutoMigrationOptions:v21 currentStoreVersion:v29 error:&v71];
      id v36 = v71;

      id v20 = v36;
    }

    BOOL v6 = v68;
  }

  id v8 = v20;
LABEL_9:
  if (a3) {
    *a3 = v8;
  }
  if (v7 != 1)
  {
    int v37 = PLMigrationGetLog();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);

    if (v38)
    {
      BOOL v39 = [(PLModelMigration *)self logger];

      if (v39)
      {
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
        memset(buf, 0, sizeof(buf));
        uint64_t v40 = PLMigrationGetLog();
        os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
        int v74 = 138412290;
        id v75 = v8;
        LODWORD(v67) = 12;
        int v41 = (uint8_t *)_os_log_send_and_compose_impl();

        id v42 = [(PLModelMigration *)self logger];
        objc_msgSend(v42, "logWithMessage:fromCodeLocation:type:", v41, "PLModelMigration.m", 300, 16);

        if (v41 != buf) {
          free(v41);
        }
      }
      else
      {
        id v43 = PLMigrationGetLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&buf[4] = v8;
          _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "Failed to migrate library. Error: %@", buf, 0xCu);
        }
      }
    }
  }
  double v44 = CFAbsoluteTimeGetCurrent() - Current;
  if (Current <= 0.0) {
    double v45 = 0.0;
  }
  else {
    double v45 = v44;
  }
  double v46 = [v6 stop];
  double v47 = PLMigrationGetLog();
  BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

  if (v48)
  {
    int64_t v49 = [(PLModelMigration *)self logger];

    if (v49)
    {
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
      memset(buf, 0, sizeof(buf));
      int v50 = PLMigrationGetLog();
      os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
      uint64_t v51 = PLStringFromModelMigrationActionResultShort(v7);
      int v69 = v6;
      uint64_t v52 = [v6 perfCheckLogStringWithPerfCheckInfo:v46];
      uint64_t v53 = [(PLModelMigration *)self progress];
      double v54 = (double)[v53 completedUnitCount] * 100.0;
      BOOL v55 = [(PLModelMigration *)self progress];
      uint64_t v56 = [v55 totalUnitCount];
      int v74 = 138544130;
      id v75 = v51;
      __int16 v76 = 2048;
      double v77 = v45;
      __int16 v78 = 2114;
      int v79 = v52;
      __int16 v80 = 2048;
      double v81 = v54 / (double)v56;
      LODWORD(v67) = 42;
      v57 = (uint8_t *)_os_log_send_and_compose_impl();

      uint64_t v58 = [(PLModelMigration *)self logger];
      objc_msgSend(v58, "logWithMessage:fromCodeLocation:type:", v57, "PLModelMigration.m", 305, 0);

      if (v57 != buf) {
        free(v57);
      }
      BOOL v6 = v69;
    }
    else
    {
      id v59 = PLMigrationGetLog();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v60 = PLStringFromModelMigrationActionResultShort(v7);
        char v61 = [v6 perfCheckLogStringWithPerfCheckInfo:v46];
        v62 = [(PLModelMigration *)self progress];
        double v63 = (double)[v62 completedUnitCount] * 100.0;
        int v64 = [(PLModelMigration *)self progress];
        uint64_t v65 = [v64 totalUnitCount];
        *(_DWORD *)long long buf = 138544130;
        *(void *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v45;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v61;
        LOWORD(v83) = 2048;
        *(double *)((char *)&v83 + 2) = v63 / (double)v65;
        _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_DEFAULT, "Completed migration - Result: %{public}@. Metrics: %.2lfs%{public}@, action progress:(%.2lf %%)", buf, 0x2Au);
      }
    }
  }

  return v7;
}

- (void)resetBackgroundActionClass:(Class)a3 onCondition:(BOOL)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    BOOL v6 = [(PLModelMigration *)self pathManager];
    id v39 = 0;
    BOOL v7 = +[PLBackgroundModelMigration resetBackgroundActionClass:a3 pathManager:v6 error:&v39];
    id v8 = v39;

    id v9 = PLMigrationGetLog();
    uint64_t v10 = v9;
    if (v7)
    {
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v11)
      {
        char v12 = [(PLModelMigration *)self logger];

        if (v12)
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
          int64_t v13 = PLMigrationGetLog();
          os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          int v14 = NSStringFromClass(a3);
          int v40 = 138543362;
          int v41 = v14;
          LODWORD(v38) = 12;
          uint64_t v15 = (uint8_t *)_os_log_send_and_compose_impl();

          uint64_t v16 = [(PLModelMigration *)self logger];
          id v17 = v16;
          BOOL v18 = v15;
          uint64_t v19 = 254;
          uint64_t v20 = 0;
          goto LABEL_13;
        }
        uint64_t v32 = PLMigrationGetLog();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        BOOL v33 = NSStringFromClass(a3);
        *(_DWORD *)long long buf = 138543362;
        *(void *)&buf[4] = v33;
        uint64_t v34 = "[ResetBackgroundAction] Successfully reset background action class: %{public}@.";
        double v35 = v32;
        os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
        uint32_t v37 = 12;
        goto LABEL_21;
      }
    }
    else
    {
      BOOL v28 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (v28)
      {
        uint64_t v29 = [(PLModelMigration *)self logger];

        if (v29)
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
          id v30 = PLMigrationGetLog();
          os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
          unsigned int v31 = NSStringFromClass(a3);
          int v40 = 138543618;
          int v41 = v31;
          __int16 v42 = 2114;
          id v43 = v8;
          LODWORD(v38) = 22;
          uint64_t v15 = (uint8_t *)_os_log_send_and_compose_impl();

          uint64_t v16 = [(PLModelMigration *)self logger];
          id v17 = v16;
          BOOL v18 = v15;
          uint64_t v19 = 256;
          uint64_t v20 = 16;
LABEL_13:
          objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigration.m", v19, v20);

          if (v15 != buf) {
            free(v15);
          }
          goto LABEL_23;
        }
        uint64_t v32 = PLMigrationGetLog();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        BOOL v33 = NSStringFromClass(a3);
        *(_DWORD *)long long buf = 138543618;
        *(void *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v8;
        uint64_t v34 = "[ResetBackgroundAction] Failed to reset background action class: %{public}@. Error: %{public}@";
        double v35 = v32;
        os_log_type_t v36 = OS_LOG_TYPE_ERROR;
        uint32_t v37 = 22;
LABEL_21:
        _os_log_impl(&dword_19B3C7000, v35, v36, v34, buf, v37);

        goto LABEL_22;
      }
    }
LABEL_23:

    return;
  }
  id v21 = PLMigrationGetLog();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (!v22) {
    return;
  }
  int v23 = [(PLModelMigration *)self logger];

  if (!v23)
  {
    id v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = NSStringFromClass(a3);
      *(_DWORD *)long long buf = 138543362;
      *(void *)&buf[4] = v32;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "[ResetBackgroundAction] Skipping reset background action class: %{public}@", buf, 0xCu);
LABEL_22:

      goto LABEL_23;
    }
    goto LABEL_23;
  }
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
  uint64_t v24 = PLMigrationGetLog();
  os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  uint64_t v25 = NSStringFromClass(a3);
  int v40 = 138543362;
  int v41 = v25;
  LODWORD(v38) = 12;
  uint64_t v26 = (uint8_t *)_os_log_send_and_compose_impl();

  double v27 = [(PLModelMigration *)self logger];
  objc_msgSend(v27, "logWithMessage:fromCodeLocation:type:", v26, "PLModelMigration.m", 259, 0);

  if (v26 != buf) {
    free(v26);
  }
}

- (void)_registerActionClass:(Class)a3 actionsContainer:(id)a4 progressPortion:(unint64_t *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (!v9)
  {
    BOOL v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PLModelMigration.m", 236, @"Invalid parameter not satisfying: %@", @"actions" object file lineNumber description];
  }
  id v10 = [a3 alloc];
  BOOL v11 = [(PLModelMigration *)self migrationContext];
  char v12 = [(PLModelMigration *)self logger];
  int64_t v13 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", -[objc_class actionProgressWeight](a3, "actionProgressWeight"));
  int v14 = (void *)[v10 initWithMigrationContext:v11 logger:v12 progress:v13];

  if (a5) {
    *a5 += [(objc_class *)a3 actionProgressWeight];
  }
  [v9 addObject:v14];
  uint64_t v15 = PLMigrationGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v20 = v17;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "Registering action: %{public}@", buf, 0xCu);
  }
}

- (void)registerPostRepairActionClass:(Class)a3 onCondition:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    if (v4)
    {
LABEL_3:
      actionsPostRepair = self->_actionsPostRepair;
      [(PLModelMigration *)self _registerActionClass:a3 actionsContainer:actionsPostRepair progressPortion:&self->_actionProgressPortionPostRepair];
      return;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLModelMigration.m", 226, @"Invalid parameter not satisfying: %@", @"[(Class)actionClass isSubclassOfClass:PLModelMigrationActionPostRepair.class]" object file lineNumber description];

    if (v4) {
      goto LABEL_3;
    }
  }
  id v10 = PLMigrationGetLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    char v12 = [(PLModelMigration *)self logger];

    if (v12)
    {
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
      *(_OWORD *)long long buf = 0u;
      long long v23 = 0u;
      int64_t v13 = PLMigrationGetLog();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      int v14 = NSStringFromClass(a3);
      int v20 = 138543362;
      uint64_t v21 = v14;
      LODWORD(v19) = 12;
      uint64_t v15 = (uint8_t *)_os_log_send_and_compose_impl();

      uint64_t v16 = [(PLModelMigration *)self logger];
      objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigration.m", 231, 0);

      if (v15 != buf) {
        free(v15);
      }
    }
    else
    {
      id v17 = PLMigrationGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v18 = NSStringFromClass(a3);
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Skipping registering post repair action class: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)registerPreRepairActionClass:(Class)a3 onCondition:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    if (v4)
    {
LABEL_3:
      actionsPreRepair = self->_actionsPreRepair;
      [(PLModelMigration *)self _registerActionClass:a3 actionsContainer:actionsPreRepair progressPortion:&self->_actionProgressPortionPreRepair];
      return;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLModelMigration.m", 216, @"Invalid parameter not satisfying: %@", @"[(Class)actionClass isSubclassOfClass:PLModelMigrationActionPreRepair.class]" object file lineNumber description];

    if (v4) {
      goto LABEL_3;
    }
  }
  id v10 = PLMigrationGetLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    char v12 = [(PLModelMigration *)self logger];

    if (v12)
    {
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
      *(_OWORD *)long long buf = 0u;
      long long v23 = 0u;
      int64_t v13 = PLMigrationGetLog();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      int v14 = NSStringFromClass(a3);
      int v20 = 138543362;
      uint64_t v21 = v14;
      LODWORD(v19) = 12;
      uint64_t v15 = (uint8_t *)_os_log_send_and_compose_impl();

      uint64_t v16 = [(PLModelMigration *)self logger];
      objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigration.m", 221, 0);

      if (v15 != buf) {
        free(v15);
      }
    }
    else
    {
      id v17 = PLMigrationGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v18 = NSStringFromClass(a3);
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Skipping registering pre repair action class: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)registerStagedActionClass:(Class)a3 onCondition:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    if (v4)
    {
LABEL_3:
      actionsStaged = self->_actionsStaged;
      [(PLModelMigration *)self _registerActionClass:a3 actionsContainer:actionsStaged progressPortion:0];
      return;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLModelMigration.m", 206, @"Invalid parameter not satisfying: %@", @"[(Class)actionClass isSubclassOfClass:PLModelMigrationActionStaged.class]" object file lineNumber description];

    if (v4) {
      goto LABEL_3;
    }
  }
  id v10 = PLMigrationGetLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    char v12 = [(PLModelMigration *)self logger];

    if (v12)
    {
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
      *(_OWORD *)long long buf = 0u;
      long long v23 = 0u;
      int64_t v13 = PLMigrationGetLog();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      int v14 = NSStringFromClass(a3);
      int v20 = 138543362;
      uint64_t v21 = v14;
      LODWORD(v19) = 12;
      uint64_t v15 = (uint8_t *)_os_log_send_and_compose_impl();

      uint64_t v16 = [(PLModelMigration *)self logger];
      objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigration.m", 211, 0);

      if (v15 != buf) {
        free(v15);
      }
    }
    else
    {
      id v17 = PLMigrationGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v18 = NSStringFromClass(a3);
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Skipping registering staged action class: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)registerActionClass:(Class)a3 onCondition:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    if (v4)
    {
LABEL_3:
      actions = self->_actions;
      [(PLModelMigration *)self _registerActionClass:a3 actionsContainer:actions progressPortion:&self->_actionProgressPortion];
      return;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLModelMigration.m", 196, @"Invalid parameter not satisfying: %@", @"[(Class)actionClass isSubclassOfClass:PLModelMigrationAction.class]" object file lineNumber description];

    if (v4) {
      goto LABEL_3;
    }
  }
  id v10 = PLMigrationGetLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    char v12 = [(PLModelMigration *)self logger];

    if (v12)
    {
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
      *(_OWORD *)long long buf = 0u;
      long long v23 = 0u;
      int64_t v13 = PLMigrationGetLog();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      int v14 = NSStringFromClass(a3);
      int v20 = 138543362;
      uint64_t v21 = v14;
      LODWORD(v19) = 12;
      uint64_t v15 = (uint8_t *)_os_log_send_and_compose_impl();

      uint64_t v16 = [(PLModelMigration *)self logger];
      objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigration.m", 201, 0);

      if (v15 != buf) {
        free(v15);
      }
    }
    else
    {
      id v17 = PLMigrationGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v18 = NSStringFromClass(a3);
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Skipping registering action class: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)actionRegistration
{
  PLModelMigrationActionRegistration_Repairs(self);
  PLModelMigrationActionRegistration_15000(self);
  PLModelMigrationActionRegistration_16000(self);
  PLModelMigrationActionRegistration_17000(self);
  PLModelMigrationActionRegistration_18000(self);
}

- (id)migrationContext
{
  return self->_internalMigrationContext;
}

- (id)graphCache
{
  return (id)[(PLModelMigrationContext *)self->_internalMigrationContext graphCache];
}

- (id)pathManager
{
  return (id)[(PLModelMigrationContext *)self->_internalMigrationContext pathManager];
}

- (id)analyticsEventManager
{
  return (id)[(PLModelMigrationContext *)self->_internalMigrationContext analyticsEventManager];
}

- (PLModelMigration)initWithMigrationContext:(id)a3 logger:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLModelMigration.m", 139, @"Invalid parameter not satisfying: %@", @"migrationContext" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLModelMigration.m", 140, @"Invalid parameter not satisfying: %@", @"[migrationContext isKindOfClass:PLMigrationContext.class]" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)PLModelMigration;
  id v10 = [(PLModelMigration *)&v29 init];
  BOOL v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_logger, a4);
    objc_storeStrong((id *)&v11->_internalMigrationContext, a3);
    v11->_didCreateSqliteErrorIndicator = 0;
    v11->_BOOL allowRebuild = ([v8 policy] & 2) != 0;
    char v12 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v13 = [v12 UUIDString];
    migrationUUID = v11->_migrationUUID;
    v11->_migrationUUID = (NSString *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    progress = v11->_progress;
    v11->_progress = (NSProgress *)v15;

    [(NSProgress *)v11->_progress setCancellable:1];
    objc_initWeak(&location, v11);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __52__PLModelMigration_initWithMigrationContext_logger___block_invoke;
    v26[3] = &unk_1E5875F08;
    objc_copyWeak(&v27, &location);
    [(NSProgress *)v11->_progress setCancellationHandler:v26];
    id v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actions = v11->_actions;
    v11->_actions = v17;

    uint64_t v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actionsPreRepair = v11->_actionsPreRepair;
    v11->_actionsPreRepair = v19;

    uint64_t v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actionsPostRepair = v11->_actionsPostRepair;
    v11->_actionsPostRepair = v21;

    v11->_unint64_t actionProgressPortion = 0;
    v11->_unint64_t actionProgressPortionPreRepair = 0;
    v11->_unint64_t actionProgressPortionPostRepair = 0;
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __52__PLModelMigration_initWithMigrationContext_logger___block_invoke(uint64_t a1)
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
      *(_OWORD *)long long buf = 0u;
      long long v15 = 0u;
      BOOL v7 = PLMigrationGetLog();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      v13[0] = 0;
      LODWORD(v12) = 2;
      id v8 = (uint8_t *)_os_log_send_and_compose_impl();

      id v9 = objc_loadWeakRetained(v4);
      id v10 = objc_msgSend(v9, "logger", v13, v12);
      objc_msgSend(v10, "logWithMessage:fromCodeLocation:type:", v8, "PLModelMigration.m", 153, 0);

      if (v8 != buf) {
        free(v8);
      }
    }
    else
    {
      BOOL v11 = PLMigrationGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Migration was cancelled", buf, 2u);
      }
    }
  }
}

@end