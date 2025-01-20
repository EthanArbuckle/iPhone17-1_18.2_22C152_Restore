@interface PLModelMigrationActionCore
+ (id)actionDescription;
+ (id)shortenedMigrationActionClassName;
+ (int64_t)actionProgressWeight;
- (BOOL)isCancelledWithError:(id *)a3;
- (NSProgress)progress;
- (NSString)actionName;
- (NSString)description;
- (PLFileBackedLogger)logger;
- (PLMigrationContext)migrationContext;
- (PLModelMigrationActionCore)initWithMigrationContext:(id)a3 logger:(id)a4 progress:(id)a5;
- (PLModelMigrationHistory)migrationHistory;
- (PLPhotoLibraryPathManager)pathManager;
- (id)cancellableDiscreteProgressWithTotalUnitCount:(int64_t)a3 pendingParentUnitCount:(int64_t)a4;
- (id)graphCache;
- (unsigned)startingSchemaVersion;
- (void)finalizeProgress;
- (void)setLogger:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation PLModelMigrationActionCore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationContext, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (PLMigrationContext)migrationContext
{
  return (PLMigrationContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogger:(id)a3
{
}

- (PLFileBackedLogger)logger
{
  return (PLFileBackedLogger *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)actionName
{
  v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)PLModelMigrationActionCore;
  id v3 = [(PLModelMigrationActionCore *)&v9 description];
  v4 = [(PLModelMigrationActionCore *)self actionName];
  v5 = [(id)objc_opt_class() actionDescription];
  v6 = [(PLModelMigrationActionCore *)self progress];
  v7 = [v3 stringByAppendingFormat:@": [%@] description: %@, progress: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (unsigned)startingSchemaVersion
{
  return [(PLMigrationContext *)self->_migrationContext previousStoreVersion];
}

- (PLModelMigrationHistory)migrationHistory
{
  return [(PLMigrationContext *)self->_migrationContext modelMigrationHistory];
}

- (id)graphCache
{
  return [(PLMigrationContext *)self->_migrationContext graphCache];
}

- (PLPhotoLibraryPathManager)pathManager
{
  return [(PLMigrationContext *)self->_migrationContext pathManager];
}

- (BOOL)isCancelledWithError:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PLModelMigrationActionCore *)self progress];
  int v5 = [v4 isCancelled];

  if (a3 && v5)
  {
    v6 = objc_opt_class();
    if ([v6 isSubclassOfClass:objc_opt_class()]) {
      uint64_t v7 = 46013;
    }
    else {
      uint64_t v7 = 46008;
    }
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F8C500];
    uint64_t v12 = *MEMORY[0x1E4F28588];
    v13[0] = @"Migration was cancelled";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a3 = [v8 errorWithDomain:v9 code:v7 userInfo:v10];
  }
  return v5;
}

+ (id)shortenedMigrationActionClassName
{
  v2 = objc_opt_class();
  if ([v2 isSubclassOfClass:objc_opt_class()])
  {
    id v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    int v5 = [v4 componentsSeparatedByString:@"_"];
    v6 = [v5 lastObject];
  }
  else
  {
    v6 = @"unknown";
  }
  return v6;
}

+ (id)actionDescription
{
  v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  int v5 = PLStringShortener(v4, [@"PLModelMigrationAction_" length]);
  v6 = [v2 stringWithFormat:@"%@", v5];

  return v6;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

- (void)finalizeProgress
{
  id v5 = [(PLModelMigrationActionCore *)self progress];
  uint64_t v3 = [v5 totalUnitCount];
  v4 = [(PLModelMigrationActionCore *)self progress];
  [v4 setCompletedUnitCount:v3];
}

- (id)cancellableDiscreteProgressWithTotalUnitCount:(int64_t)a3 pendingParentUnitCount:(int64_t)a4
{
  uint64_t v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  uint64_t v9 = [(PLModelMigrationActionCore *)self progress];
  v10 = [(PLModelMigrationActionCore *)self logger];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__PLModelMigrationActionCore_cancellableDiscreteProgressWithTotalUnitCount_pendingParentUnitCount___block_invoke;
  v14[3] = &unk_1E5870B10;
  id v15 = v8;
  id v11 = v8;
  uint64_t v12 = PLCancellableDiscreteProgress(v9, v10, a3, a4, v14);

  return v12;
}

void __99__PLModelMigrationActionCore_cancellableDiscreteProgressWithTotalUnitCount_pendingParentUnitCount___block_invoke(uint64_t a1, void *a2)
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
      v6 = PLMigrationGetLog();
      os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      uint64_t v7 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v7;
      LODWORD(v11) = 12;
      v8 = (uint8_t *)_os_log_send_and_compose_impl();

      objc_msgSend(v3, "logWithMessage:fromCodeLocation:type:", v8, "PLModelMigrationAction.m", 208, 16, &v12, v11);
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

- (PLModelMigrationActionCore)initWithMigrationContext:(id)a3 logger:(id)a4 progress:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLModelMigrationAction.m", 191, @"Invalid parameter not satisfying: %@", @"[migrationContext isKindOfClass:PLMigrationContext.class]" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PLModelMigrationActionCore;
  uint64_t v13 = [(PLModelMigrationActionCore *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_migrationContext, a3);
    objc_storeStrong((id *)&v14->_logger, a4);
    objc_storeStrong((id *)&v14->_progress, a5);
    [(PLModelMigrationActionCore *)v14 setup];
  }

  return v14;
}

@end