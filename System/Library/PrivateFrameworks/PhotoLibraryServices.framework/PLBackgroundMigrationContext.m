@interface PLBackgroundMigrationContext
- (PLBackgroundMigrationContext)initWithPathManager:(id)a3 databaseContext:(id)a4 analyticsEventManager:(id)a5;
- (PLCoreAnalyticsEventManager)analyticsEventManager;
- (PLDatabaseContext)databaseContext;
- (PLGraphCache)graphCache;
- (PLModelMigrationHistory)modelMigrationHistory;
- (PLPhotoLibraryPathManager)pathManager;
- (id)newModelMigrationHistory;
- (int64_t)libraryIdentifier;
- (unsigned)policy;
- (void)dealloc;
- (void)setAnalyticsEventManager:(id)a3;
- (void)setDatabaseContext:(id)a3;
- (void)setGraphCache:(id)a3;
- (void)setLibraryIdentifier:(int64_t)a3;
- (void)setPathManager:(id)a3;
- (void)setPolicy:(unsigned int)a3;
@end

@implementation PLBackgroundMigrationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphCache, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_analyticsEventManager, 0);
  objc_storeStrong((id *)&self->_databaseContext, 0);
  objc_storeStrong((id *)&self->_lazyModelMigrationHistory, 0);
}

- (void)setGraphCache:(id)a3
{
}

- (PLGraphCache)graphCache
{
  return (PLGraphCache *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLibraryIdentifier:(int64_t)a3
{
  self->_libraryIdentifier = a3;
}

- (int64_t)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (void)setPolicy:(unsigned int)a3
{
  self->_policy = a3;
}

- (unsigned)policy
{
  return self->_policy;
}

- (void)setPathManager:(id)a3
{
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void)setAnalyticsEventManager:(id)a3
{
}

- (PLCoreAnalyticsEventManager)analyticsEventManager
{
  return self->_analyticsEventManager;
}

- (void)setDatabaseContext:(id)a3
{
}

- (PLDatabaseContext)databaseContext
{
  return self->_databaseContext;
}

- (PLModelMigrationHistory)modelMigrationHistory
{
  return (PLModelMigrationHistory *)[(PLLazyObject *)self->_lazyModelMigrationHistory objectValue];
}

- (id)newModelMigrationHistory
{
  databaseContext = self->_databaseContext;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = -[PLDatabaseContext newShortLivedLibraryWithName:](databaseContext, "newShortLivedLibraryWithName:", [v4 UTF8String]);

  v6 = [PLModelMigrationHistory alloc];
  v7 = [v5 managedObjectContext];
  v8 = [(PLModelMigrationHistory *)v6 initWithManagedObjectContext:v7];

  return v8;
}

- (void)dealloc
{
  [(PLLazyObject *)self->_lazyModelMigrationHistory invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PLBackgroundMigrationContext;
  [(PLBackgroundMigrationContext *)&v3 dealloc];
}

- (PLBackgroundMigrationContext)initWithPathManager:(id)a3 databaseContext:(id)a4 analyticsEventManager:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLModelMigrationContext.m", 94, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PLModelMigrationContext.m", 95, @"Invalid parameter not satisfying: %@", @"databaseContext" object file lineNumber description];

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)PLBackgroundMigrationContext;
  v13 = [(PLBackgroundMigrationContext *)&v25 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pathManager, a3);
    objc_storeStrong((id *)&v14->_databaseContext, a4);
    objc_storeStrong((id *)&v14->_analyticsEventManager, a5);
    v14->_policy = 0;
    v14->_libraryIdentifier = PLMigrationContextWellKnownPhotoLibraryIdentifier(v14->_pathManager);
    id v15 = objc_initWeak(&location, v14);

    id v16 = objc_alloc(MEMORY[0x1E4F8B948]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __90__PLBackgroundMigrationContext_initWithPathManager_databaseContext_analyticsEventManager___block_invoke;
    v22[3] = &unk_1E5874070;
    objc_copyWeak(&v23, &location);
    uint64_t v17 = [v16 initWithBlock:v22];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    lazyModelMigrationHistory = v14->_lazyModelMigrationHistory;
    v14->_lazyModelMigrationHistory = (PLLazyObject *)v17;
  }
  return v14;
}

id __90__PLBackgroundMigrationContext_initWithPathManager_databaseContext_analyticsEventManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    objc_super v3 = (void *)[WeakRetained newModelMigrationHistory];
  }
  else {
    objc_super v3 = 0;
  }

  return v3;
}

@end