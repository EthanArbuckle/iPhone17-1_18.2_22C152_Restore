@interface PLDatabaseContext
+ (id)newShortLivedLibraryWithName:(const char *)a3 bundle:(id)a4;
+ (id)newShortLivedLibraryWithName:(const char *)a3 libraryRole:(unint64_t)a4 bundle:(id)a5;
- (PLDatabaseContext)initWithLibraryBundle:(id)a3;
- (PLSyndicationIngestMutex)syndicationIngestMutex;
- (id)momentLibrary;
- (id)newMomentLibrary;
- (id)newShortLivedComputeSyncApplyLibraryWithNameSuffix:(const char *)a3;
- (id)newShortLivedCplLibraryWithNameSuffix:(const char *)a3;
- (id)newShortLivedLibraryForHistoryPersistenceReadingWithName:(const char *)a3;
- (id)newShortLivedLibraryForOrderKeyManagerWithName:(const char *)a3;
- (id)newShortLivedLibraryWithName:(const char *)a3;
- (id)newShortLivedLibraryWithName:(const char *)a3 libraryRole:(unint64_t)a4;
- (id)newShortLivedMacOpenClientLibraryWithName:(const char *)a3;
- (int64_t)wellKnownPhotoLibraryIdentifier;
- (void)dealloc;
- (void)invalidate;
- (void)perform:(id)a3 withName:(const char *)a4;
- (void)performSync:(id)a3 withName:(const char *)a4;
- (void)performTransaction:(id)a3 withName:(const char *)a4;
- (void)performTransactionSync:(id)a3 withName:(const char *)a4;
@end

@implementation PLDatabaseContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIngestMutex, 0);
  objc_storeStrong((id *)&self->_lazyMomentLibrary, 0);
  objc_destroyWeak((id *)&self->_libraryBundle);
}

- (PLSyndicationIngestMutex)syndicationIngestMutex
{
  return (PLSyndicationIngestMutex *)objc_getProperty(self, a2, 24, 1);
}

- (id)momentLibrary
{
  return (id)[(PLLazyObject *)self->_lazyMomentLibrary objectValue];
}

- (id)newMomentLibrary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)PLDatabaseContextNameMomentLibrary UTF8String];
  v4 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v4 setLibraryRole:1];
  [(PLPhotoLibraryOptions *)v4 setRequiredState:6];
  [(PLPhotoLibraryOptions *)v4 setAutomaticallyPinToFirstFetch:0];
  p_libraryBundle = &self->_libraryBundle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  id v14 = 0;
  id v7 = +[PLPhotoLibrary newPhotoLibraryWithName:v3 loadedFromBundle:WeakRetained options:v4 error:&v14];
  id v8 = v14;

  if (!v7)
  {
    v9 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_loadWeakRetained((id *)p_libraryBundle);
      v11 = [v10 libraryURL];
      *(_DWORD *)buf = 136446722;
      uint64_t v16 = v3;
      __int16 v17 = 2112;
      v18 = v11;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
    }
  }
  v12 = [v7 managedObjectContext];
  [v12 setChangeSource:1];

  return v7;
}

- (id)newShortLivedComputeSyncApplyLibraryWithNameSuffix:(const char *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v5 setRequiredState:6];
  [(PLPhotoLibraryOptions *)v5 setRefreshesAfterSave:0];
  [(PLPhotoLibraryOptions *)v5 setLibraryRole:0];
  [(PLPhotoLibraryOptions *)v5 setRollbackOnErrors:1];
  p_libraryBundle = &self->_libraryBundle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  id v16 = 0;
  id v8 = +[PLPhotoLibrary newPhotoLibraryWithName:a3 loadedFromBundle:WeakRetained options:v5 error:&v16];
  id v9 = v16;

  if (!v8)
  {
    id v10 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_loadWeakRetained((id *)p_libraryBundle);
      v12 = [v11 libraryURL];
      *(_DWORD *)buf = 136446722;
      v18 = a3;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
    }
  }
  v13 = [v8 managedObjectContext];
  [v13 setChangeSource:1];

  id v14 = [v8 managedObjectContext];
  [v14 setLocalOnlyDelete:1];

  return v8;
}

- (id)newShortLivedCplLibraryWithNameSuffix:(const char *)a3
{
  objc_msgSend((id)PLDatabaseContextNameCPLLibrary, "stringByAppendingFormat:", @": %s", a3);
  id v4 = objc_claimAutoreleasedReturnValue();
  id v5 = -[PLDatabaseContext newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", [v4 UTF8String]);
  v6 = [v5 managedObjectContext];
  [v6 setChangeSource:1];

  id v7 = [v5 managedObjectContext];
  [v7 setLocalOnlyDelete:1];

  return v5;
}

- (id)newShortLivedLibraryForOrderKeyManagerWithName:(const char *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v5 setRequiredState:6];
  [(PLPhotoLibraryOptions *)v5 setRefreshesAfterSave:1];
  [(PLPhotoLibraryOptions *)v5 setAutomaticallyPinToFirstFetch:0];
  p_libraryBundle = &self->_libraryBundle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  id v16 = 0;
  id v8 = +[PLPhotoLibrary newPhotoLibraryWithName:a3 loadedFromBundle:WeakRetained options:v5 error:&v16];
  id v9 = v16;

  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__PLDatabaseContext_newShortLivedLibraryForOrderKeyManagerWithName___block_invoke;
    v14[3] = &unk_1E5875CE0;
    v15 = v8;
    +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v14];
    id v10 = v15;
  }
  else
  {
    id v10 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_loadWeakRetained((id *)p_libraryBundle);
      v12 = [v11 libraryURL];
      *(_DWORD *)buf = 136446722;
      v18 = a3;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
    }
  }

  return v8;
}

void __68__PLDatabaseContext_newShortLivedLibraryForOrderKeyManagerWithName___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) managedObjectContext];
  [v1 setStalenessInterval:0.0];
}

- (id)newShortLivedLibraryForHistoryPersistenceReadingWithName:(const char *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v5 setRequiredState:6];
  [(PLPhotoLibraryOptions *)v5 setRefreshesAfterSave:0];
  [(PLPhotoLibraryOptions *)v5 setAutomaticallyPinToFirstFetch:0];
  p_libraryBundle = &self->_libraryBundle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  id v16 = 0;
  id v8 = +[PLPhotoLibrary newPhotoLibraryWithName:a3 loadedFromBundle:WeakRetained options:v5 error:&v16];
  id v9 = v16;

  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__PLDatabaseContext_newShortLivedLibraryForHistoryPersistenceReadingWithName___block_invoke;
    v14[3] = &unk_1E5875CE0;
    v15 = v8;
    +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v14];
    id v10 = v15;
  }
  else
  {
    id v10 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_loadWeakRetained((id *)p_libraryBundle);
      v12 = [v11 libraryURL];
      *(_DWORD *)buf = 136446722;
      v18 = a3;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
    }
  }

  return v8;
}

void __78__PLDatabaseContext_newShortLivedLibraryForHistoryPersistenceReadingWithName___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) managedObjectContext];
  [v1 setStalenessInterval:0.0];
}

- (id)newShortLivedLibraryWithName:(const char *)a3 libraryRole:(unint64_t)a4
{
  id v7 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  id v9 = (void *)[v7 newShortLivedLibraryWithName:a3 libraryRole:a4 bundle:WeakRetained];

  return v9;
}

- (id)newShortLivedLibraryWithName:(const char *)a3
{
  id v5 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  id v7 = (void *)[v5 newShortLivedLibraryWithName:a3 bundle:WeakRetained];

  return v7;
}

- (int64_t)wellKnownPhotoLibraryIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  uint64_t v3 = [WeakRetained libraryServicesManager];
  int64_t v4 = [v3 wellKnownPhotoLibraryIdentifier];

  return v4;
}

- (void)performTransactionSync:(id)a3 withName:(const char *)a4
{
  id v6 = a3;
  id v7 = [(PLDatabaseContext *)self newShortLivedLibraryWithName:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PLDatabaseContext_performTransactionSync_withName___block_invoke;
  v10[3] = &unk_1E58742F0;
  id v11 = v7;
  id v12 = v6;
  id v8 = v7;
  id v9 = v6;
  [v8 performTransactionAndWait:v10];
}

uint64_t __53__PLDatabaseContext_performTransactionSync_withName___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performSync:(id)a3 withName:(const char *)a4
{
  id v6 = a3;
  id v7 = [(PLDatabaseContext *)self newShortLivedLibraryWithName:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__PLDatabaseContext_performSync_withName___block_invoke;
  v10[3] = &unk_1E58742F0;
  id v11 = v7;
  id v12 = v6;
  id v8 = v7;
  id v9 = v6;
  [v8 performBlockAndWait:v10];
}

uint64_t __42__PLDatabaseContext_performSync_withName___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performTransaction:(id)a3 withName:(const char *)a4
{
  id v6 = a3;
  id v7 = [(PLDatabaseContext *)self newShortLivedLibraryWithName:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PLDatabaseContext_performTransaction_withName___block_invoke;
  v10[3] = &unk_1E58742F0;
  id v11 = v7;
  id v12 = v6;
  id v8 = v7;
  id v9 = v6;
  [v8 performTransaction:v10];
}

uint64_t __49__PLDatabaseContext_performTransaction_withName___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)perform:(id)a3 withName:(const char *)a4
{
  id v6 = a3;
  id v7 = [(PLDatabaseContext *)self newShortLivedLibraryWithName:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__PLDatabaseContext_perform_withName___block_invoke;
  v10[3] = &unk_1E58742F0;
  id v11 = v7;
  id v12 = v6;
  id v8 = v7;
  id v9 = v6;
  [v8 performBlock:v10];
}

uint64_t __38__PLDatabaseContext_perform_withName___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLDatabaseContext;
  [(PLDatabaseContext *)&v4 dealloc];
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412546;
    uint64_t v5 = objc_opt_class();
    __int16 v6 = 2048;
    __int16 v7 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p invalidate", (uint8_t *)&v4, 0x16u);
  }

  [(PLLazyObject *)self->_lazyMomentLibrary invalidate];
}

- (PLDatabaseContext)initWithLibraryBundle:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (PLIsAssetsd())
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PLDatabaseContext.m" lineNumber:36 description:@"Must only be initialized in assetsd"];

    if (v5) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PLDatabaseContext.m", 37, @"Invalid parameter not satisfying: %@", @"libraryBundle != nil" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)PLDatabaseContext;
  __int16 v6 = [(PLDatabaseContext *)&v21 init];
  __int16 v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_libraryBundle, v5);
    id v8 = objc_initWeak((id *)location, v7);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__PLDatabaseContext_initWithLibraryBundle___block_invoke;
    v19[3] = &unk_1E5874070;
    objc_copyWeak(&v20, (id *)location);
    uint64_t v10 = [v9 initWithBlock:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)location);
    lazyMomentLibrary = v7->_lazyMomentLibrary;
    v7->_lazyMomentLibrary = (PLLazyObject *)v10;

    id v12 = [[PLSyndicationIngestMutex alloc] initWithDatabaseContext:v7];
    syndicationIngestMutex = v7->_syndicationIngestMutex;
    v7->_syndicationIngestMutex = v12;
  }
  id v14 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = objc_opt_class();
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = v15;
    __int16 v23 = 2048;
    v24 = v7;
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryBundle:%@", location, 0x20u);
  }

  return v7;
}

id __43__PLDatabaseContext_initWithLibraryBundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = (void *)[WeakRetained newMomentLibrary];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)newShortLivedLibraryWithName:(const char *)a3 bundle:(id)a4
{
  return (id)[a1 newShortLivedLibraryWithName:a3 libraryRole:0 bundle:a4];
}

+ (id)newShortLivedLibraryWithName:(const char *)a3 libraryRole:(unint64_t)a4 bundle:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v8 setRequiredState:6];
  [(PLPhotoLibraryOptions *)v8 setRefreshesAfterSave:0];
  [(PLPhotoLibraryOptions *)v8 setLibraryRole:a4];
  id v14 = 0;
  id v9 = +[PLPhotoLibrary newPhotoLibraryWithName:a3 loadedFromBundle:v7 options:v8 error:&v14];
  id v10 = v14;
  if (!v9)
  {
    id v11 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v7 libraryURL];
      *(_DWORD *)buf = 136446722;
      id v16 = a3;
      __int16 v17 = 2112;
      v18 = v12;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
    }
  }

  return v9;
}

- (id)newShortLivedMacOpenClientLibraryWithName:(const char *)a3
{
  __int16 v6 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v6 setRequiredState:4];
  [(PLPhotoLibraryOptions *)v6 setRefreshesAfterSave:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  id v14 = 0;
  id v8 = +[PLPhotoLibrary newPhotoLibraryWithName:a3 loadedFromBundle:WeakRetained options:v6 error:&v14];
  id v9 = v14;

  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = objc_loadWeakRetained((id *)&self->_libraryBundle);
    v13 = [v12 libraryURL];
    [v11 handleFailureInMethod:a2, self, @"PLDatabaseContext.m", 230, @"failed to load photo library %s with url %@, %@", a3, v13, v9 object file lineNumber description];
  }
  return v8;
}

@end