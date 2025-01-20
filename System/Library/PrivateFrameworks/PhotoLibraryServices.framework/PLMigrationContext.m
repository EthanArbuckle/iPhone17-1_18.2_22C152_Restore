@interface PLMigrationContext
- (NSDictionary)options;
- (NSPersistentStore)store;
- (NSPersistentStoreCoordinator)coordinator;
- (NSURL)storeURL;
- (PLCoreAnalyticsEventManager)analyticsEventManager;
- (PLGraphCache)graphCache;
- (PLMigrationContext)initWithPathManager:(id)a3 coordinator:(id)a4 onStore:(id)a5 orStoreURL:(id)a6 version:(unsigned __int16)a7 options:(id)a8 migrationPolicy:(unsigned int)a9 analyticsEventManager:(id)a10 graphCache:(id)a11;
- (PLModelMigrationHistory)modelMigrationHistory;
- (PLPhotoLibraryPathManager)pathManager;
- (id)newModelMigrationHistory;
- (int64_t)libraryIdentifier;
- (unsigned)policy;
- (unsigned)previousStoreVersion;
- (void)dealloc;
- (void)setAnalyticsEventManager:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setGraphCache:(id)a3;
- (void)setLibraryIdentifier:(int64_t)a3;
- (void)setOptions:(id)a3;
- (void)setPathManager:(id)a3;
- (void)setPolicy:(unsigned int)a3;
- (void)setPreviousStoreVersion:(unsigned __int16)a3;
- (void)setStore:(id)a3;
- (void)setStoreURL:(id)a3;
@end

@implementation PLMigrationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphCache, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_analyticsEventManager, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_lazyModelMigrationHistory, 0);
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

- (void)setGraphCache:(id)a3
{
}

- (PLGraphCache)graphCache
{
  return (PLGraphCache *)objc_getProperty(self, a2, 72, 1);
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

- (void)setPreviousStoreVersion:(unsigned __int16)a3
{
  self->_previousStoreVersion = a3;
}

- (unsigned)previousStoreVersion
{
  return self->_previousStoreVersion;
}

- (void)setStore:(id)a3
{
}

- (NSPersistentStore)store
{
  return self->_store;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setStoreURL:(id)a3
{
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setCoordinator:(id)a3
{
}

- (NSPersistentStoreCoordinator)coordinator
{
  return self->_coordinator;
}

- (PLModelMigrationHistory)modelMigrationHistory
{
  return (PLModelMigrationHistory *)[(PLLazyObject *)self->_lazyModelMigrationHistory objectValue];
}

- (id)newModelMigrationHistory
{
  v3 = [(PLMigrationContext *)self coordinator];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PLMigrationContext *)self pathManager];
  v7 = [(PLMigrationContext *)self graphCache];
  v8 = PLManagedObjectContextForMigrationActionWithCoordinator(v3, v5, v6, v7);

  v9 = [[PLModelMigrationHistory alloc] initWithManagedObjectContext:v8];
  return v9;
}

- (void)dealloc
{
  [(PLLazyObject *)self->_lazyModelMigrationHistory invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PLMigrationContext;
  [(PLMigrationContext *)&v3 dealloc];
}

- (PLMigrationContext)initWithPathManager:(id)a3 coordinator:(id)a4 onStore:(id)a5 orStoreURL:(id)a6 version:(unsigned __int16)a7 options:(id)a8 migrationPolicy:(unsigned int)a9 analyticsEventManager:(id)a10 graphCache:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id obj = a5;
  unint64_t v19 = (unint64_t)a5;
  unint64_t v20 = (unint64_t)a6;
  id v21 = a8;
  v22 = self;
  id v43 = a10;
  id v42 = a11;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
LABEL_14:
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PLModelMigrationContext.m", 46, @"Invalid parameter not satisfying: %@", @"coordinator" object file lineNumber description];

    if (v21) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"PLModelMigrationContext.m", 45, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

  if (!v18) {
    goto LABEL_14;
  }
LABEL_3:
  if (v21) {
    goto LABEL_4;
  }
LABEL_15:
  v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, v22, @"PLModelMigrationContext.m", 47, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

LABEL_4:
  if (!(v19 | v20))
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, v22, @"PLModelMigrationContext.m", 48, @"Invalid parameter not satisfying: %@", @"sourceStore || storeURL" object file lineNumber description];
  }
  v47.receiver = v22;
  v47.super_class = (Class)PLMigrationContext;
  v23 = [(PLMigrationContext *)&v47 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_pathManager, a3);
    objc_storeStrong((id *)&v24->_coordinator, a4);
    objc_storeStrong((id *)&v24->_store, obj);
    v25 = (void *)v20;
    if (!v20)
    {
      v25 = [(id)v19 URL];
    }
    uint64_t v26 = [v25 copy];
    storeURL = v24->_storeURL;
    v24->_storeURL = (NSURL *)v26;

    if (!v20) {
    v24->_previousStoreVersion = a7;
    }
    uint64_t v28 = [v21 copy];
    options = v24->_options;
    v24->_options = (NSDictionary *)v28;

    v24->_policy = a9;
    objc_storeStrong((id *)&v24->_analyticsEventManager, a10);
    v24->_libraryIdentifier = PLMigrationContextWellKnownPhotoLibraryIdentifier(v24->_pathManager);
    id v30 = objc_initWeak(&location, v24);

    id v31 = objc_alloc(MEMORY[0x1E4F8B948]);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __138__PLMigrationContext_initWithPathManager_coordinator_onStore_orStoreURL_version_options_migrationPolicy_analyticsEventManager_graphCache___block_invoke;
    v44[3] = &unk_1E5874070;
    objc_copyWeak(&v45, &location);
    uint64_t v32 = [v31 initWithBlock:v44];
    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
    lazyModelMigrationHistory = v24->_lazyModelMigrationHistory;
    v24->_lazyModelMigrationHistory = (PLLazyObject *)v32;

    objc_storeStrong((id *)&v24->_graphCache, a11);
  }

  return v24;
}

id __138__PLMigrationContext_initWithPathManager_coordinator_onStore_orStoreURL_version_options_migrationPolicy_analyticsEventManager_graphCache___block_invoke(uint64_t a1)
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