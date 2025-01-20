@interface PLModelMigrationActionBackground
+ (BOOL)isResetAfterRebuildRequiredWithLibrary:(id)a3;
+ (BOOL)resetResumeMarkerForActionClass:(Class)a3 pathManager:(id)a4 error:(id *)a5;
+ (id)_resumeMakerKeyPathForActionClass:(Class)a3;
+ (id)actionDescription;
+ (id)shortenedMigrationActionClassName;
+ (int64_t)actionProgressWeight;
- (BOOL)isCancelled;
- (BOOL)isCancelledWithResumeMarker:(id)a3 error:(id *)a4;
- (NSProgress)progress;
- (NSString)actionName;
- (NSString)description;
- (PLFileBackedLogger)logger;
- (PLModelMigrationActionBackground)initWithMigrationContext:(id)a3 logger:(id)a4 progress:(id)a5 continuationHandler:(id)a6;
- (PLModelMigrationContext)migrationContext;
- (PLModelMigrationHistory)migrationHistory;
- (PLPhotoLibraryPathManager)pathManager;
- (id)appPrivateData;
- (id)cancellableDiscreteProgressWithTotalUnitCount:(int64_t)a3 pendingParentUnitCount:(int64_t)a4;
- (id)continuationHandler;
- (id)databaseContext;
- (id)resumeMarker;
- (void)finalizeProgress;
- (void)setContinuationHandler:(id)a3;
- (void)setLogger:(id)a3;
- (void)setProgress:(id)a3;
- (void)setResumeMarkerValue:(id)a3;
@end

@implementation PLModelMigrationActionBackground

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationContext, 0);
  objc_storeStrong(&self->_continuationHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_lazyAppPrivateData, 0);
  objc_storeStrong((id *)&self->_resumeMarkerKeyPath, 0);
}

- (PLModelMigrationContext)migrationContext
{
  return (PLModelMigrationContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContinuationHandler:(id)a3
{
}

- (id)continuationHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogger:(id)a3
{
}

- (PLFileBackedLogger)logger
{
  return (PLFileBackedLogger *)objc_getProperty(self, a2, 24, 1);
}

- (id)databaseContext
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(PLModelMigrationContext *)self->_migrationContext databaseContext];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSString)actionName
{
  return (NSString *)@"MigrationActionBackground";
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)PLModelMigrationActionBackground;
  v3 = [(PLModelMigrationActionBackground *)&v9 description];
  v4 = [(PLModelMigrationActionBackground *)self actionName];
  v5 = [(id)objc_opt_class() actionDescription];
  v6 = [(PLModelMigrationActionBackground *)self progress];
  v7 = [v3 stringByAppendingFormat:@": [%@] description: %@, progress: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isCancelledWithResumeMarker:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(PLModelMigrationActionBackground *)self isCancelled];
  if (v7)
  {
    if (a4)
    {
      v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F8C500];
      uint64_t v15 = *MEMORY[0x1E4F28588];
      v16[0] = @"Migration was cancelled";
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *a4 = [v8 errorWithDomain:v9 code:46014 userInfo:v10];
    }
    if (v6)
    {
      id v11 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [v11 URIRepresentation];
        uint64_t v13 = [v12 description];

        id v11 = (id)v13;
      }
      [(PLModelMigrationActionBackground *)self setResumeMarkerValue:v11];
    }
  }

  return v7;
}

- (BOOL)isCancelled
{
  v3 = [(PLModelMigrationActionBackground *)self continuationHandler];

  if (v3)
  {
    v4 = [(PLModelMigrationActionBackground *)self continuationHandler];
    char v5 = v4[2]();

    if ((v5 & 1) == 0)
    {
      id v6 = [(PLModelMigrationActionBackground *)self progress];
      [v6 cancel];
    }
  }
  BOOL v7 = [(PLModelMigrationActionBackground *)self progress];
  char v8 = [v7 isCancelled];

  return v8;
}

- (void)finalizeProgress
{
  id v5 = [(PLModelMigrationActionBackground *)self progress];
  uint64_t v3 = [v5 totalUnitCount];
  v4 = [(PLModelMigrationActionBackground *)self progress];
  [v4 setCompletedUnitCount:v3];
}

- (id)cancellableDiscreteProgressWithTotalUnitCount:(int64_t)a3 pendingParentUnitCount:(int64_t)a4
{
  BOOL v7 = (objc_class *)objc_opt_class();
  char v8 = NSStringFromClass(v7);
  uint64_t v9 = [(PLModelMigrationActionBackground *)self progress];
  v10 = [(PLModelMigrationActionBackground *)self logger];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __105__PLModelMigrationActionBackground_cancellableDiscreteProgressWithTotalUnitCount_pendingParentUnitCount___block_invoke;
  v14[3] = &unk_1E5870B10;
  id v15 = v8;
  id v11 = v8;
  v12 = PLCancellableDiscreteProgress(v9, v10, a3, a4, v14);

  return v12;
}

void __105__PLModelMigrationActionBackground_cancellableDiscreteProgressWithTotalUnitCount_pendingParentUnitCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLMigrationGetLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    if (v3)
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
      id v6 = PLMigrationGetLog();
      os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      uint64_t v7 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v7;
      LODWORD(v11) = 12;
      char v8 = (uint8_t *)_os_log_send_and_compose_impl();

      objc_msgSend(v3, "logWithMessage:fromCodeLocation:type:", v8, "PLModelMigrationAction.m", 363, 16, &v12, v11);
      if (v8 != buf) {
        free(v8);
      }
    }
    else
    {
      uint64_t v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "%{public}@ was cancelled", buf, 0xCu);
      }
    }
  }
}

- (id)resumeMarker
{
  id v3 = [(PLModelMigrationActionBackground *)self appPrivateData];
  v4 = [v3 valueForKeyPath:self->_resumeMarkerKeyPath];

  return v4;
}

- (void)setResumeMarkerValue:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PLModelMigrationActionBackground *)self appPrivateData];
  resumeMarkerKeyPath = self->_resumeMarkerKeyPath;
  id v17 = 0;
  char v7 = [v5 setValue:v4 forKeyPath:resumeMarkerKeyPath error:&v17];

  id v8 = v17;
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = PLMigrationGetLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      uint64_t v11 = [(PLModelMigrationActionBackground *)self logger];

      if (v11)
      {
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
        long long v27 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        *(_OWORD *)buf = 0u;
        int v12 = PLMigrationGetLog();
        os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
        int v18 = 138412290;
        id v19 = v8;
        LODWORD(v16) = 12;
        uint64_t v13 = (uint8_t *)_os_log_send_and_compose_impl();

        v14 = [(PLModelMigrationActionBackground *)self logger];
        objc_msgSend(v14, "logWithMessage:fromCodeLocation:type:", v13, "PLModelMigrationAction.m", 352, 16);

        if (v13 != buf) {
          free(v13);
        }
      }
      else
      {
        long long v15 = PLMigrationGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v8;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to save resume marker app private data: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (PLModelMigrationHistory)migrationHistory
{
  return (PLModelMigrationHistory *)[(PLModelMigrationContext *)self->_migrationContext modelMigrationHistory];
}

- (PLPhotoLibraryPathManager)pathManager
{
  return (PLPhotoLibraryPathManager *)[(PLModelMigrationContext *)self->_migrationContext pathManager];
}

- (id)appPrivateData
{
  return (id)[(PLLazyObject *)self->_lazyAppPrivateData objectValue];
}

- (PLModelMigrationActionBackground)initWithMigrationContext:(id)a3 logger:(id)a4 progress:(id)a5 continuationHandler:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PLModelMigrationAction.m", 310, @"Invalid parameter not satisfying: %@", @"progress" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"PLModelMigrationAction.m", 309, @"Invalid parameter not satisfying: %@", @"migrationContext" object file lineNumber description];

  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_9:
  long long v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"PLModelMigrationAction.m", 311, @"Invalid parameter not satisfying: %@", @"continuationHandler" object file lineNumber description];

LABEL_4:
  v34.receiver = self;
  v34.super_class = (Class)PLModelMigrationActionBackground;
  uint64_t v16 = [(PLModelMigrationActionBackground *)&v34 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_logger, a4);
    objc_storeStrong((id *)&v17->_progress, a5);
    uint64_t v18 = MEMORY[0x19F38D650](v15);
    id continuationHandler = v17->_continuationHandler;
    v17->_id continuationHandler = (id)v18;

    long long v20 = objc_opt_class();
    uint64_t v21 = [v20 _resumeMakerKeyPathForActionClass:objc_opt_class()];
    resumeMarkerKeyPath = v17->_resumeMarkerKeyPath;
    v17->_resumeMarkerKeyPath = (NSString *)v21;

    id v23 = objc_initWeak(&location, v17);
    id v24 = objc_alloc(MEMORY[0x1E4F8B948]);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __97__PLModelMigrationActionBackground_initWithMigrationContext_logger_progress_continuationHandler___block_invoke;
    v31[3] = &unk_1E5874070;
    objc_copyWeak(&v32, &location);
    uint64_t v25 = [v24 initWithBlock:v31];
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    lazyAppPrivateData = v17->_lazyAppPrivateData;
    v17->_lazyAppPrivateData = (PLLazyObject *)v25;

    objc_storeStrong((id *)&v17->_migrationContext, a3);
    [(PLModelMigrationActionBackground *)v17 setup];
  }

  return v17;
}

id __97__PLModelMigrationActionBackground_initWithMigrationContext_logger_progress_continuationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)MEMORY[0x1E4F8B858];
    id v4 = [WeakRetained pathManager];
    BOOL v5 = [v4 libraryURL];
    id v6 = [v3 appPrivateDataForLibraryURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)shortenedMigrationActionClassName
{
  v2 = objc_opt_class();
  if ([v2 isSubclassOfClass:objc_opt_class()])
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    BOOL v5 = [v4 componentsSeparatedByString:@"_"];
    id v6 = [v5 lastObject];
  }
  else
  {
    id v6 = @"unknown";
  }
  return v6;
}

+ (id)actionDescription
{
  v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  BOOL v5 = PLStringShortener(v4, [@"PLModelMigrationAction_" length]);
  id v6 = [v2 stringWithFormat:@"%@", v5];

  return v6;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

+ (BOOL)isResetAfterRebuildRequiredWithLibrary:(id)a3
{
  return 0;
}

+ (BOOL)resetResumeMarkerForActionClass:(Class)a3 pathManager:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [a1 _resumeMakerKeyPathForActionClass:a3];
  BOOL v10 = (void *)MEMORY[0x1E4F8B858];
  uint64_t v11 = [v8 libraryURL];

  id v12 = [v10 appPrivateDataForLibraryURL:v11];

  id v17 = 0;
  char v13 = [v12 setValue:0 forKeyPath:v9 error:&v17];
  id v14 = v17;
  id v15 = v14;
  if ((v13 & 1) == 0 && a5) {
    *a5 = v14;
  }

  return v13;
}

+ (id)_resumeMakerKeyPathForActionClass:(Class)a3
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortenedMigrationActionClassName];
  BOOL v5 = [v3 stringWithFormat:@"%@.ResumeMaker.%@", @"MigrationAction", v4];

  return v5;
}

@end