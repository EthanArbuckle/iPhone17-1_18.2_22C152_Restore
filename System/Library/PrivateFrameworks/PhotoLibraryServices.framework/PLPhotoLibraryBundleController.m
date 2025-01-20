@interface PLPhotoLibraryBundleController
+ (id)_realPathForLibraryURL:(id)a3;
+ (id)sharedAssetsdClientForPhotoLibraryURL:(id)a3;
+ (id)sharedBundleController;
+ (void)resetSharedBundleController;
- (BOOL)bindAssetsdService:(id)a3 toBundle:(id)a4 error:(id *)a5;
- (PLBackgroundJobService)backgroundJobService;
- (PLCacheDeleteRegistration)cacheDeleteRegistration;
- (PLPhotoLibraryBundleController)init;
- (PLPhotoLibraryBundleController)initWithBundleType:(int64_t)a3 libraryServicesManagerDelegateClass:(Class)a4;
- (id)_lookupOrCreateBundleForLibraryURL:(id)a3 replaceExisting:(BOOL)a4;
- (id)_pathKeyForLibraryURL:(id)a3;
- (id)bundleForLibraryURL:(id)a3;
- (id)libraryBundlePaths;
- (id)libraryBundles;
- (id)libraryServicesStatusDescription;
- (id)lookupOrCreateBundleForLibraryURL:(id)a3;
- (id)newPhotoLibraryBundleWithLibraryURL:(id)a3;
- (id)openBundleAtLibraryURL:(id)a3;
- (id)pauseUntilDateForShutdownReason:(id)a3;
- (id)replaceBundleForRebuildAtLibraryURL:(id)a3;
- (void)_unregisterBundle:(id)a3 pauseUntilDate:(id)a4;
- (void)handleUnknownMergeEvent;
- (void)removeBundleForRebuildAtLibraryURL:(id)a3;
- (void)removeManagedObjectModelIfNeededForShutdownReason:(id)a3;
- (void)setBackgroundJobService:(id)a3;
- (void)setCacheDeleteRegistration:(id)a3;
- (void)shutdownAllBundlesWithReason:(id)a3;
- (void)shutdownBundle:(id)a3 reason:(id)a4;
@end

@implementation PLPhotoLibraryBundleController

+ (id)sharedBundleController
{
  os_unfair_lock_lock((os_unfair_lock_t)&gSharedBundleControllerLock);
  v2 = (PLPhotoLibraryBundleController *)(id)gSharedBundleController;
  if (!v2)
  {
    v2 = objc_alloc_init(PLPhotoLibraryBundleController);
    v3 = (void *)gSharedBundleController;
    gSharedBundleController = (uint64_t)v2;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&gSharedBundleControllerLock);
  return v2;
}

- (id)lookupOrCreateBundleForLibraryURL:(id)a3
{
  return [(PLPhotoLibraryBundleController *)self _lookupOrCreateBundleForLibraryURL:a3 replaceExisting:0];
}

- (PLPhotoLibraryBundleController)init
{
  uint64_t v3 = PLIsAssetsd();
  v4 = +[PLLibraryServicesManager libraryServicesDelegateClass];
  return [(PLPhotoLibraryBundleController *)self initWithBundleType:v3 libraryServicesManagerDelegateClass:v4];
}

- (PLPhotoLibraryBundleController)initWithBundleType:(int64_t)a3 libraryServicesManagerDelegateClass:(Class)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PLPhotoLibraryBundleController;
  v6 = [(PLPhotoLibraryBundleController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_bundleType = a3;
    v6->_libraryServicesDelegateClass = a4;
    v6->_bundlesByPathLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bundlesByPath = v7->_bundlesByPath;
    v7->_bundlesByPath = v8;

    v7->_bundleCreationPauseLock._os_unfair_lock_opaque = 0;
    bundleCreationPausedUntilDate = v7->_bundleCreationPausedUntilDate;
    v7->_bundleCreationPausedUntilDate = 0;

    v11 = v7;
  }

  return v7;
}

id __85__PLPhotoLibraryBundleController__lookupOrCreateBundleForLibraryURL_replaceExisting___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56)
    || ([*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)],
        (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    do
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
      id v2 = *(id *)(*(void *)(a1 + 32) + 48);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
      [v2 timeIntervalSinceNow];
      if (v3 <= 0.0)
      {
        v5 = (void *)[*(id *)(a1 + 32) newPhotoLibraryBundleWithLibraryURL:*(void *)(a1 + 48)];
        [*(id *)(*(void *)(a1 + 32) + 32) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
      }
      else
      {
        v4 = PLBackendGetLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v8 = v2;
          _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Waiting until %{public}@ before creating new PLPhotoLibraryBundle instance to allow time for volume unmount", buf, 0xCu);
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
        [MEMORY[0x1E4F29060] sleepUntilDate:v2];
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
        if (*(unsigned char *)(a1 + 56))
        {
          v5 = 0;
        }
        else
        {
          v5 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
        }
      }
    }
    while (!v5);
  }
  return v5;
}

- (id)newPhotoLibraryBundleWithLibraryURL:(id)a3
{
  if (self->_bundleType == 1) {
    v4 = [[PLServerPhotoLibraryBundle alloc] initWithLibraryURL:a3 bundleController:self backgroundJobService:self->_backgroundJobService libraryServicesDelegateClass:self->_libraryServicesDelegateClass];
  }
  else {
    v4 = [[PLClientPhotoLibraryBundle alloc] initWithLibraryURL:a3 bundleController:self];
  }
  v5 = v4;

  return v5;
}

+ (id)sharedAssetsdClientForPhotoLibraryURL:(id)a3
{
  id v4 = a3;
  v5 = [a1 sharedBundleController];
  v6 = [v5 lookupOrCreateBundleForLibraryURL:v4];

  v7 = [v6 assetsdClient];

  return v7;
}

- (id)_lookupOrCreateBundleForLibraryURL:(id)a3 replaceExisting:(BOOL)a4
{
  id v5 = a3;
  v6 = [(PLPhotoLibraryBundleController *)self _pathKeyForLibraryURL:v5];
  v11 = v5;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = PLSafeResultWithUnfairLock();

  return v9;
}

- (id)_pathKeyForLibraryURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 path];

  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLPhotoLibraryBundleController.m", 275, @"Invalid parameter not satisfying: %@", @"libraryURL.path != nil" object file lineNumber description];
  }
  id v7 = +[PLPhotoLibraryBundleController _realPathForLibraryURL:v5];
  if (!v7)
  {
    id v7 = [v5 path];
    id v8 = PLLibraryBundleGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "lookupOrCreateBundleForLibraryURL unable to get realpath for %@, using %@ instead.", buf, 0x16u);
    }
  }
  return v7;
}

+ (id)_realPathForLibraryURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 path];
  if (v4)
  {
    id v20 = 0;
    id v5 = [MEMORY[0x1E4F8B908] realPathForPath:v4 error:&v20];
    v6 = v20;
    id v7 = v6;
    if (v5)
    {
      id v8 = v6;
LABEL_20:
      if ((PLObjectIsEqual() & 1) == 0 && (PLIsSuppressingLogsForUnitTesting() & 1) == 0)
      {
        v17 = PLLibraryBundleGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v22 = v5;
          __int16 v23 = 2112;
          v24 = v4;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "Inconsistent URL paths may negatively impact client access performance (original %@ vs. current %@)", buf, 0x16u);
        }
      }
      goto LABEL_25;
    }
    if ([v6 code] == 2)
    {
      uint64_t v9 = PLLibraryBundleGetLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

        __int16 v13 = [v4 lastPathComponent];
        v14 = [v4 stringByDeletingLastPathComponent];
        v19 = v7;
        uint64_t v15 = [MEMORY[0x1E4F8B908] realPathForPath:v14 error:&v19];
        id v8 = v19;

        id v5 = [v15 stringByAppendingPathComponent:v13];

        if (!v5)
        {
          v16 = PLLibraryBundleGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v22 = v3;
            __int16 v23 = 2112;
            v24 = v14;
            __int16 v25 = 2112;
            v26 = v8;
            _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Unsupported client photo library url, failed to resolve real path from photo library url %@ (path: %@): %@", buf, 0x20u);
          }
        }
        goto LABEL_20;
      }
      *(_DWORD *)buf = 138412802;
      id v22 = v3;
      __int16 v23 = 2112;
      v24 = v4;
      __int16 v25 = 2112;
      v26 = v7;
      v10 = "Failed to resolve real path for missing photo library url %@ (path: %@): %@";
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E4F8B980], "ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:", objc_msgSend(MEMORY[0x1E4F8B980], "wellKnownPhotoLibraryIdentifierForURL:", v3)))
      {
        id v5 = v4;
        id v8 = v7;
        goto LABEL_25;
      }
      uint64_t v9 = PLLibraryBundleGetLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 138412802;
      id v22 = v3;
      __int16 v23 = 2112;
      v24 = v4;
      __int16 v25 = 2112;
      v26 = v7;
      v10 = "Failed to resolve real path for photo library url %@ (path: %@): %@";
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_19B3C7000, v11, v12, v10, buf, 0x20u);
    goto LABEL_15;
  }
  id v8 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v3;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Unsupported client photo library url with nil path: %@", buf, 0xCu);
  }
  id v5 = 0;
LABEL_25:

  return v5;
}

- (id)openBundleAtLibraryURL:(id)a3
{
  return [(PLPhotoLibraryBundleController *)self _lookupOrCreateBundleForLibraryURL:a3 replaceExisting:0];
}

- (BOOL)bindAssetsdService:(id)a3 toBundle:(id)a4 error:(id *)a5
{
  id v10 = 0;
  char v6 = [a4 bindAssetsdService:a3 error:&v10];
  id v7 = v10;
  id v8 = v7;
  if (a5 && (v6 & 1) == 0) {
    *a5 = v7;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDeleteRegistration, 0);
  objc_storeStrong((id *)&self->_backgroundJobService, 0);
  objc_storeStrong((id *)&self->_bundleCreationPausedUntilDate, 0);
  objc_storeStrong((id *)&self->_bundlesByPath, 0);
}

- (void)setCacheDeleteRegistration:(id)a3
{
}

- (PLCacheDeleteRegistration)cacheDeleteRegistration
{
  return (PLCacheDeleteRegistration *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBackgroundJobService:(id)a3
{
}

- (PLBackgroundJobService)backgroundJobService
{
  return (PLBackgroundJobService *)objc_getProperty(self, a2, 56, 1);
}

- (void)removeBundleForRebuildAtLibraryURL:(id)a3
{
  id v4 = [(PLPhotoLibraryBundleController *)self _pathKeyForLibraryURL:a3];
  id v3 = v4;
  PLRunWithUnfairLock();
}

uint64_t __69__PLPhotoLibraryBundleController_removeBundleForRebuildAtLibraryURL___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)shutdownAllBundlesWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__23740;
  v11 = __Block_byref_object_dispose__23741;
  id v12 = 0;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  do
  {
    PLRunWithUnfairLock();
    uint64_t v6 = v8[5];
    if (v6) {
      -[PLPhotoLibraryBundleController shutdownBundle:reason:](self, "shutdownBundle:reason:", v6, v4, v5, 3221225472, __63__PLPhotoLibraryBundleController_shutdownAllBundlesWithReason___block_invoke, &unk_1E5875E68, self, &v7, v7);
    }
  }
  while (v8[5]);
  _Block_object_dispose(&v7, 8);
}

void __63__PLPhotoLibraryBundleController_shutdownAllBundlesWithReason___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 32) allValues];
  uint64_t v2 = [v5 firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)pauseUntilDateForShutdownReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (PLIsErrorEqualToCode())
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:20.0];
    id v4 = PLLibraryBundleGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Delaying bundle creation until %{public}@ to allow time for volume unmount.", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)removeManagedObjectModelIfNeededForShutdownReason:(id)a3
{
  if (PLIsErrorEqualToCode())
  {
    uint64_t v3 = PLLibraryBundleGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Removing managed object model due to unsafe shutdown", v4, 2u);
    }

    +[PLPersistentContainer unsafeRemoveManagedObjectModel];
  }
}

- (void)shutdownBundle:(id)a3 reason:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLPhotoLibraryBundleController.m", 185, @"Invalid parameter not satisfying: %@", @"bundle != nil" object file lineNumber description];

    uint64_t v9 = 0;
  }
  SetPLPhotoLibraryBundleControllerCrashTracerMessage(v9, v8);
  id v10 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x1E4F8B8F0];
    id v12 = [v7 libraryURL];
    __int16 v13 = [v11 descriptionWithFileURL:v12];
    *(_DWORD *)buf = 138412546;
    v17 = v13;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Shutting down bundle: %@ for reason: %@", buf, 0x16u);
  }
  [v7 shutdownWithReason:v8];
  [(PLPhotoLibraryBundleController *)self removeManagedObjectModelIfNeededForShutdownReason:v8];
  v14 = [(PLPhotoLibraryBundleController *)self pauseUntilDateForShutdownReason:v8];
  [(PLPhotoLibraryBundleController *)self _unregisterBundle:v7 pauseUntilDate:v14];
  SetPLPhotoLibraryBundleControllerCrashTracerMessage(0, 0);
}

- (void)_unregisterBundle:(id)a3 pauseUntilDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  PLSafeRunWithUnfairLock();
}

void __67__PLPhotoLibraryBundleController__unregisterBundle_pauseUntilDate___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  __int16 v13 = __Block_byref_object_copy__23740;
  v14 = __Block_byref_object_dispose__23741;
  id v15 = 0;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PLPhotoLibraryBundleController__unregisterBundle_pauseUntilDate___block_invoke_2;
  v7[3] = &unk_1E58671A8;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = &v10;
  [v2 enumerateKeysAndObjectsUsingBlock:v7];
  if (v11[5])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", 0);
  }
  else
  {
    uint64_t v3 = PLLibraryBundleGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "No registered bundle matches: %@", buf, 0xCu);
    }
  }
  id v5 = *(void **)(a1 + 48);
  if (v5)
  {
    id v6 = v5;
    PLRunWithUnfairLock();
  }
  _Block_object_dispose(&v10, 8);
}

void __67__PLPhotoLibraryBundleController__unregisterBundle_pauseUntilDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v6 = v7;
  }
}

void __67__PLPhotoLibraryBundleController__unregisterBundle_pauseUntilDate___block_invoke_10(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceDate:");
    if (v3 <= 0.0) {
      return;
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 48), *(id *)(a1 + 40));
  uint64_t v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Bundle creation paused until %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)handleUnknownMergeEvent
{
}

uint64_t __57__PLPhotoLibraryBundleController_handleUnknownMergeEvent__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_23758];
}

void __57__PLPhotoLibraryBundleController_handleUnknownMergeEvent__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 changeHandlingContainer];
  [v3 handleUnknownMergeEvent];
}

- (id)libraryServicesStatusDescription
{
  id v4 = [MEMORY[0x1E4F28E78] stringWithString:@"Library Services:\n"];
  PLRunWithUnfairLock();
  id v2 = v4;

  return v2;
}

void __66__PLPhotoLibraryBundleController_libraryServicesStatusDescription__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__PLPhotoLibraryBundleController_libraryServicesStatusDescription__block_invoke_2;
  v2[3] = &unk_1E5867160;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __66__PLPhotoLibraryBundleController_libraryServicesStatusDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 libraryServicesManager];
  id v4 = [v5 statusDescription];
  [*(id *)(a1 + 32) appendString:v4];
}

- (id)replaceBundleForRebuildAtLibraryURL:(id)a3
{
  return [(PLPhotoLibraryBundleController *)self _lookupOrCreateBundleForLibraryURL:a3 replaceExisting:1];
}

- (id)libraryBundles
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__23740;
  uint64_t v8 = __Block_byref_object_dispose__23741;
  id v9 = 0;
  PLRunWithUnfairLock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __48__PLPhotoLibraryBundleController_libraryBundles__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)libraryBundlePaths
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__23740;
  uint64_t v10 = __Block_byref_object_dispose__23741;
  id v11 = 0;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  PLRunWithUnfairLock();
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v7[5], v4, 3221225472, __52__PLPhotoLibraryBundleController_libraryBundlePaths__block_invoke, &unk_1E5875E68, self, &v6);
  _Block_object_dispose(&v6, 8);

  return v2;
}

void __52__PLPhotoLibraryBundleController_libraryBundlePaths__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)bundleForLibraryURL:(id)a3
{
  uint64_t v6 = [(PLPhotoLibraryBundleController *)self _pathKeyForLibraryURL:a3];
  id v3 = v6;
  uint64_t v4 = PLResultWithUnfairLock();

  return v4;
}

uint64_t __54__PLPhotoLibraryBundleController_bundleForLibraryURL___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
}

+ (void)resetSharedBundleController
{
  os_unfair_lock_lock((os_unfair_lock_t)&gSharedBundleControllerLock);
  uint64_t v2 = (void *)gSharedBundleController;
  gSharedBundleController = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&gSharedBundleControllerLock);
}

@end