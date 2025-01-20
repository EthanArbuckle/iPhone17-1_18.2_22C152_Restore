@interface PLPhotoLibraryBundle
- (BOOL)bindAssetsdService:(id)a3 error:(id *)a4;
- (BOOL)calculateTotalSizeWithResult:(id)a3;
- (BOOL)isShuttingDown;
- (BOOL)isSystemPhotoLibrary;
- (BOOL)registerPLPhotoLibrary:(id)a3;
- (BOOL)sqliteErrorIndicatorFileExists;
- (NSArray)boundAssetsdServices;
- (NSError)shutdownReason;
- (NSURL)libraryURL;
- (PFTimeZoneLookup)timeZoneLookup;
- (PLAssetsdClient)assetsdClient;
- (PLChangeHandlingContainer)changeHandlingContainer;
- (PLClientSandboxExtensionCache)clientSandboxExtensionCache;
- (PLConstraintsDirector)constraintsDirector;
- (PLEmailAddressManager)emailAddressManager;
- (PLFetchRecorder)fetchRecorder;
- (PLGraphCache)graphCache;
- (PLIndicatorFileCoordinator)indicatorFileCoordinator;
- (PLLibraryServicesManager)libraryServicesManager;
- (PLPersistentContainer)persistentContainer;
- (PLPersonInfoManager)personInfoManager;
- (PLPhotoAnalysisServiceClient)photoAnalysisServiceClient;
- (PLPhotoKitVariationCache)variationCache;
- (PLPhotoLibraryBundle)initWithLibraryURL:(id)a3 bundleController:(id)a4;
- (PLPhotoLibraryBundleController)bundleController;
- (PLPhotoLibraryPathManager)pathManager;
- (id)_newTimeZoneLookup;
- (id)boundAssetsdServicesTable;
- (id)description;
- (id)makeChangeHandlingNotificationObserverWithLowPriorityThrottleInterval:(double)a3;
- (id)newAssetsdClient;
- (id)newBoundAssetsdServicesTable;
- (id)newChangeHandlingContainer;
- (id)newChangePublisher;
- (id)newLibraryServicesManager;
- (id)transferAssets:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6;
- (id)transferPersons:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6;
- (int64_t)connectionType;
- (void)_invalidateChangeHandlingContainer;
- (void)_invalidateGraphCache;
- (void)_invalidatePersistentContainer;
- (void)_invalidatePhotoAnalysisServiceClient;
- (void)beginObservingChanges;
- (void)close;
- (void)dealloc;
- (void)distributeChangesSinceLastCheckpoint;
- (void)endObservingChanges;
- (void)initializeChangeHandling;
- (void)setCloudPhotoLibraryEnabled:(BOOL)a3;
- (void)setCloudPhotoLibraryEnabledSync:(BOOL)a3;
- (void)setPhotoStreamEnabled:(BOOL)a3;
- (void)setSharedAlbumEnabled:(BOOL)a3;
- (void)shutdownWithReason:(id)a3;
- (void)unbindAssetsdService:(id)a3;
- (void)volumeWillUnmount:(id)a3;
@end

@implementation PLPhotoLibraryBundle

- (BOOL)isSystemPhotoLibrary
{
  v3 = [(PLPhotoLibraryBundle *)self libraryServicesManager];
  v4 = v3;
  if (v3) {
    char v5 = [v3 isSystemPhotoLibrary];
  }
  else {
    char v5 = [MEMORY[0x1E4F8B988] isSystemPhotoLibraryURL:self->_libraryURL];
  }
  BOOL v6 = v5;

  return v6;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return (PLLibraryServicesManager *)[(PLLazyObject *)self->_lazyLibraryServicesManager objectValue];
}

- (BOOL)registerPLPhotoLibrary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __57__PLPhotoLibraryBundle_Internal__registerPLPhotoLibrary___block_invoke;
  v15 = &unk_1E5875E68;
  v16 = self;
  v17 = &v18;
  PLRunWithUnfairLock();
  if (*((unsigned char *)v19 + 24))
  {
    atomicPhotoLibraries = self->_atomicPhotoLibraries;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PLPhotoLibraryBundle_Internal__registerPLPhotoLibrary___block_invoke_209;
    v9[3] = &unk_1E5870470;
    v10 = v4;
    v11 = &v18;
    [(PLAtomicObject *)atomicPhotoLibraries atomicallyPerformBlockAndWait:v9];
    BOOL v6 = *((unsigned char *)v19 + 24) != 0;
    v7 = v10;
  }
  else
  {
    v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = self;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Unable to register PLPhotoLibrary with bundle %@", buf, 0xCu);
    }
    BOOL v6 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v6;
}

- (PLChangeHandlingContainer)changeHandlingContainer
{
  return (PLChangeHandlingContainer *)[(PLLazyObject *)self->_lazyChangeHandlingContainer objectValue];
}

- (PLPhotoLibraryPathManager)pathManager
{
  return (PLPhotoLibraryPathManager *)objc_getProperty(self, a2, 184, 1);
}

- (PLPersistentContainer)persistentContainer
{
  return (PLPersistentContainer *)[(PLLazyObject *)self->_lazyPersistentContainer objectValue];
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)sqliteErrorIndicatorFileExists
{
  p_sqliteErrorIndicatorLock = &self->_sqliteErrorIndicatorLock;
  os_unfair_lock_lock(&self->_sqliteErrorIndicatorLock);
  sqliteErrorIndicatorFileExists = self->_sqliteErrorIndicatorFileExists;
  if (sqliteErrorIndicatorFileExists)
  {
    LOBYTE(v5) = [(NSNumber *)sqliteErrorIndicatorFileExists BOOLValue];
  }
  else
  {
    BOOL v6 = [(PLPhotoLibraryBundle *)self pathManager];
    uint64_t v5 = [v6 sqliteErrorIndicatorFileExists];

    v7 = [NSNumber numberWithBool:v5];
    v8 = self->_sqliteErrorIndicatorFileExists;
    self->_sqliteErrorIndicatorFileExists = v7;
  }
  os_unfair_lock_unlock(p_sqliteErrorIndicatorLock);
  return v5;
}

uint64_t __57__PLPhotoLibraryBundle_Internal__registerPLPhotoLibrary___block_invoke(uint64_t result)
{
  if (!*(void *)(*(void *)(result + 32) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (PLPhotoLibraryBundle)initWithLibraryURL:(id)a3 bundleController:(id)a4
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id obj = a4;
  v131.receiver = self;
  v131.super_class = (Class)PLPhotoLibraryBundle;
  v7 = [(PLPhotoLibraryBundle *)&v131 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_19;
  }
  v7->_lock._os_unfair_lock_opaque = 0;
  uint64_t v9 = [v6 copy];
  libraryURL = v8->_libraryURL;
  v8->_libraryURL = (NSURL *)v9;

  id v11 = objc_alloc(MEMORY[0x1E4F8B880]);
  uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  uint64_t v13 = [v11 initWithObject:v12];
  atomicPhotoLibraries = v8->_atomicPhotoLibraries;
  v8->_atomicPhotoLibraries = (PLAtomicObject *)v13;

  objc_storeWeak((id *)&v8->_bundleController, obj);
  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F8B980]) initWithLibraryURL:v6];
  pathManager = v8->_pathManager;
  v8->_pathManager = (PLPhotoLibraryPathManager *)v15;

  id v17 = objc_initWeak((id *)location, v8);
  id v18 = objc_alloc(MEMORY[0x1E4F8B948]);
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke;
  v129[3] = &unk_1E5874070;
  objc_copyWeak(&v130, (id *)location);
  uint64_t v19 = [v18 initWithBlock:v129];
  objc_destroyWeak(&v130);
  objc_destroyWeak((id *)location);
  lazyIndicatorFileCoordinator = v8->_lazyIndicatorFileCoordinator;
  v8->_lazyIndicatorFileCoordinator = (PLLazyObject *)v19;

  id v21 = objc_initWeak((id *)location, v8);
  id v22 = objc_alloc(MEMORY[0x1E4F8B948]);
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_2;
  v127[3] = &unk_1E5874070;
  objc_copyWeak(&v128, (id *)location);
  uint64_t v23 = [v22 initWithRetriableBlock:v127];
  objc_destroyWeak(&v128);
  objc_destroyWeak((id *)location);
  lazyChangeHandlingContainer = v8->_lazyChangeHandlingContainer;
  v8->_lazyChangeHandlingContainer = (PLLazyObject *)v23;

  id v25 = objc_initWeak((id *)location, v8);
  id v26 = objc_alloc(MEMORY[0x1E4F8B948]);
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_3;
  v125[3] = &unk_1E5874070;
  objc_copyWeak(&v126, (id *)location);
  uint64_t v27 = [v26 initWithBlock:v125];
  objc_destroyWeak(&v126);
  objc_destroyWeak((id *)location);
  lazyAssetsdClient = v8->_lazyAssetsdClient;
  v8->_lazyAssetsdClient = (PLLazyObject *)v27;

  id v29 = objc_initWeak((id *)location, v8);
  id v30 = objc_alloc(MEMORY[0x1E4F8B948]);
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_4;
  v122[3] = &unk_1E5870860;
  objc_copyWeak(&v124, (id *)location);
  id v31 = v6;
  id v123 = v31;
  uint64_t v32 = [v30 initWithBlock:v122];

  objc_destroyWeak(&v124);
  objc_destroyWeak((id *)location);
  lazyPersistentContainer = v8->_lazyPersistentContainer;
  v8->_lazyPersistentContainer = (PLLazyObject *)v32;

  id v34 = objc_initWeak((id *)location, v8);
  id v35 = objc_alloc(MEMORY[0x1E4F8B948]);
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_5;
  v120[3] = &unk_1E5874070;
  objc_copyWeak(&v121, (id *)location);
  uint64_t v36 = [v35 initWithBlock:v120];
  objc_destroyWeak(&v121);
  objc_destroyWeak((id *)location);
  lazyLibraryServicesManager = v8->_lazyLibraryServicesManager;
  v8->_lazyLibraryServicesManager = (PLLazyObject *)v36;

  id v38 = objc_initWeak((id *)location, v8);
  id v39 = objc_alloc(MEMORY[0x1E4F8B948]);
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_6;
  v118[3] = &unk_1E5874070;
  objc_copyWeak(&v119, (id *)location);
  uint64_t v40 = [v39 initWithBlock:v118];
  objc_destroyWeak(&v119);
  objc_destroyWeak((id *)location);
  lazyVariationCache = v8->_lazyVariationCache;
  v8->_lazyVariationCache = (PLLazyObject *)v40;

  id v42 = objc_initWeak((id *)location, v8);
  id v43 = objc_alloc(MEMORY[0x1E4F8B948]);
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_7;
  v116[3] = &unk_1E5874070;
  objc_copyWeak(&v117, (id *)location);
  uint64_t v44 = [v43 initWithBlock:v116];
  objc_destroyWeak(&v117);
  objc_destroyWeak((id *)location);
  lazyPersonInfoManager = v8->_lazyPersonInfoManager;
  v8->_lazyPersonInfoManager = (PLLazyObject *)v44;

  id v46 = objc_initWeak((id *)location, v8);
  id v47 = objc_alloc(MEMORY[0x1E4F8B948]);
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_8;
  v114[3] = &unk_1E5874070;
  objc_copyWeak(&v115, (id *)location);
  uint64_t v48 = [v47 initWithBlock:v114];
  objc_destroyWeak(&v115);
  objc_destroyWeak((id *)location);
  lazyEmailAddressManager = v8->_lazyEmailAddressManager;
  v8->_lazyEmailAddressManager = (PLLazyObject *)v48;

  id v50 = objc_initWeak((id *)location, v8);
  id v51 = objc_alloc(MEMORY[0x1E4F8B948]);
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_9;
  v112[3] = &unk_1E5874070;
  objc_copyWeak(&v113, (id *)location);
  uint64_t v52 = [v51 initWithBlock:v112];
  objc_destroyWeak(&v113);
  objc_destroyWeak((id *)location);
  lazyBoundAssetsdServicesTable = v8->_lazyBoundAssetsdServicesTable;
  v8->_lazyBoundAssetsdServicesTable = (PLLazyObject *)v52;

  id v54 = objc_initWeak((id *)location, v8);
  id v55 = objc_alloc(MEMORY[0x1E4F8B948]);
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_10;
  v110[3] = &unk_1E5874070;
  objc_copyWeak(&v111, (id *)location);
  uint64_t v56 = [v55 initWithBlock:v110];
  objc_destroyWeak(&v111);
  objc_destroyWeak((id *)location);
  lazyPhotoAnalysisServiceClient = v8->_lazyPhotoAnalysisServiceClient;
  v8->_lazyPhotoAnalysisServiceClient = (PLLazyObject *)v56;

  id v58 = objc_initWeak((id *)location, v8);
  id v59 = objc_alloc(MEMORY[0x1E4F8B948]);
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_11;
  v108[3] = &unk_1E5874070;
  objc_copyWeak(&v109, (id *)location);
  uint64_t v60 = [v59 initWithBlock:v108];
  objc_destroyWeak(&v109);
  objc_destroyWeak((id *)location);
  lazyConstraintsDirector = v8->_lazyConstraintsDirector;
  v8->_lazyConstraintsDirector = (PLLazyObject *)v60;

  id v62 = objc_initWeak((id *)location, v8);
  id v63 = objc_alloc(MEMORY[0x1E4F8B948]);
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_12;
  v106[3] = &unk_1E5874070;
  objc_copyWeak(&v107, (id *)location);
  uint64_t v64 = [v63 initWithBlock:v106];
  objc_destroyWeak(&v107);
  objc_destroyWeak((id *)location);
  lazyTimeZoneLookup = v8->_lazyTimeZoneLookup;
  v8->_lazyTimeZoneLookup = (PLLazyObject *)v64;

  v8->_sqliteErrorIndicatorLock._os_unfair_lock_opaque = 0;
  id v66 = objc_initWeak((id *)location, v8);

  id v67 = objc_alloc(MEMORY[0x1E4F8B948]);
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_13;
  v104[3] = &unk_1E5874070;
  objc_copyWeak(&v105, (id *)location);
  uint64_t v68 = [v67 initWithBlock:v104];
  objc_destroyWeak(&v105);
  objc_destroyWeak((id *)location);
  lazyFetchRecorder = v8->_lazyFetchRecorder;
  v8->_lazyFetchRecorder = (PLLazyObject *)v68;

  id v70 = objc_initWeak((id *)location, v8);
  id v71 = objc_alloc(MEMORY[0x1E4F8B948]);
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_14;
  v102[3] = &unk_1E5874070;
  objc_copyWeak(&v103, (id *)location);
  uint64_t v72 = [v71 initWithBlock:v102];
  objc_destroyWeak(&v103);
  objc_destroyWeak((id *)location);
  lazyGraphCache = v8->_lazyGraphCache;
  v8->_lazyGraphCache = (PLLazyObject *)v72;

  id v74 = objc_initWeak((id *)location, v8);
  id v75 = objc_alloc(MEMORY[0x1E4F8B948]);
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_15;
  v100[3] = &unk_1E5874070;
  objc_copyWeak(&v101, (id *)location);
  uint64_t v76 = [v75 initWithBlock:v100];
  objc_destroyWeak(&v101);
  objc_destroyWeak((id *)location);
  lazyChangeHandlingObserverTargetNotifyWorkloop = v8->_lazyChangeHandlingObserverTargetNotifyWorkloop;
  v8->_lazyChangeHandlingObserverTargetNotifyWorkloop = (PLLazyObject *)v76;

  id v78 = v31;
  id v79 = v78;
  if (v8->_volumeUnmountMonitor)
  {
    v80 = 0;
    v81 = 0;
    v82 = v78;
    goto LABEL_16;
  }
  v80 = 0;
  v81 = 0;
  uint64_t v83 = *MEMORY[0x1E4F1C960];
  v82 = v78;
  while (1)
  {

    id v98 = 0;
    id v99 = 0;
    int v84 = [v82 getResourceValue:&v99 forKey:v83 error:&v98];
    id v85 = v99;

    v81 = v85;
    v80 = (PLPhotoLibraryBundle *)v98;
    if (!v84) {
      break;
    }
    v86 = [[PLFileSystemVolumeUnmountMonitor alloc] initWithVolumeURL:v81];
    volumeUnmountMonitor = v8->_volumeUnmountMonitor;
    v8->_volumeUnmountMonitor = v86;

    [(PLFileSystemVolumeUnmountMonitor *)v8->_volumeUnmountMonitor addVolumeUnmountObserver:v8];
LABEL_9:
    if (v8->_volumeUnmountMonitor) {
      goto LABEL_16;
    }
  }
  v88 = [v82 path];
  uint64_t v89 = [v88 length];

  v90 = [v82 URLByDeletingLastPathComponent];

  v91 = [v90 path];
  LOBYTE(v89) = v89 == [v91 length];

  if ((v89 & 1) == 0)
  {
    v82 = v90;
    goto LABEL_9;
  }
  if (!v8->_volumeUnmountMonitor)
  {
    v92 = PLLibraryBundleGetLog();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v79;
      __int16 v133 = 2112;
      v134 = v80;
      _os_log_impl(&dword_19B3C7000, v92, OS_LOG_TYPE_ERROR, "Error getting volume URL for library URL %@: %@", location, 0x16u);
    }
  }
  v82 = v90;
LABEL_16:
  v93 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v94 = objc_opt_class();
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = v94;
    __int16 v133 = 2048;
    v134 = v8;
    __int16 v135 = 2112;
    id v136 = v79;
    _os_log_impl(&dword_19B3C7000, v93, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryURL: %@", location, 0x20u);
  }

  v95 = v8;
LABEL_19:

  return v8;
}

void __38__PLPhotoLibraryBundle_shutdownReason__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

PLPersistentContainer *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_4(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    uint64_t v3 = [[PLPersistentContainer alloc] initWithLibraryURL:*(void *)(a1 + 32) lazyAssetsdClient:WeakRetained[8]];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSError)shutdownReason
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__84844;
  v8 = __Block_byref_object_dispose__84845;
  id v9 = 0;
  PLRunWithUnfairLock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSError *)v2;
}

id __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = (void *)[WeakRetained newLibraryServicesManager];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = (void *)[WeakRetained newAssetsdClient];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)beginObservingChanges
{
  id v2 = [(PLPhotoLibraryBundle *)self changeHandlingContainer];
  [v2 beginObservingChanges];
}

- (id)boundAssetsdServicesTable
{
  return (id)[(PLLazyObject *)self->_lazyBoundAssetsdServicesTable objectValue];
}

id __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = (void *)[WeakRetained newChangeHandlingContainer];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)newChangeHandlingContainer
{
  if (MEMORY[0x19F38C0C0](self, a2) && PLIsAssetsdProxyService())
  {
    uint64_t v3 = PLLibraryBundleGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Disabling change handling container for unit test proxy service", buf, 2u);
    }
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v3 = [(PLPhotoLibraryBundle *)self newChangePublisher];
    uint64_t v5 = [(PLPhotoLibraryBundle *)self libraryServicesManager];
    uint64_t v6 = [(PLPhotoLibraryBundle *)self persistentContainer];
    v7 = [v6 sharedPersistentStoreCoordinator];

    if (v7)
    {
      uint64_t v4 = [[PLChangeHandlingContainer alloc] initWithLibraryBundle:self changePublisher:v3 libraryServicesManager:v5 persistentStoreCoordinator:v7];
      [(PLChangeHandlingContainer *)v4 start];
    }
    else
    {
      v8 = PLLibraryBundleGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Unable to create PLLibraryBundleLogInfo because PSC is nil", v10, 2u);
      }

      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (PLAssetsdClient)assetsdClient
{
  return (PLAssetsdClient *)[(PLLazyObject *)self->_lazyAssetsdClient objectValue];
}

- (id)makeChangeHandlingNotificationObserverWithLowPriorityThrottleInterval:(double)a3
{
  uint64_t v5 = [PLChangeHandlingNotificationObserver alloc];
  uint64_t v6 = [(PLLazyObject *)self->_lazyChangeHandlingObserverTargetNotifyWorkloop objectValue];
  v7 = [(PLChangeHandlingNotificationObserver *)v5 initWithLowPriorityThrottleInterval:v6 targetWorkloop:a3];

  return v7;
}

dispatch_workloop_t __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    dispatch_workloop_t v2 = dispatch_workloop_create("com.apple.photos.perBundleSharedChangeHandlingNotificationObserverWorkloop");
  }
  else {
    dispatch_workloop_t v2 = 0;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bundleController);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_volumeUnmountMonitor, 0);
  objc_storeStrong((id *)&self->_sqliteErrorIndicatorFileExists, 0);
  objc_storeStrong((id *)&self->_lazyGraphCache, 0);
  objc_storeStrong((id *)&self->_lazyFetchRecorder, 0);
  objc_storeStrong((id *)&self->_lazyChangeHandlingObserverTargetNotifyWorkloop, 0);
  objc_storeStrong((id *)&self->_lazyTimeZoneLookup, 0);
  objc_storeStrong((id *)&self->_lazyConstraintsDirector, 0);
  objc_storeStrong((id *)&self->_lazyPhotoAnalysisServiceClient, 0);
  objc_storeStrong((id *)&self->_lazyBoundAssetsdServicesTable, 0);
  objc_storeStrong((id *)&self->_lazyEmailAddressManager, 0);
  objc_storeStrong((id *)&self->_lazyPersonInfoManager, 0);
  objc_storeStrong((id *)&self->_lazyVariationCache, 0);
  objc_storeStrong((id *)&self->_lazyLibraryServicesManager, 0);
  objc_storeStrong((id *)&self->_lazyAssetsdClient, 0);
  objc_storeStrong((id *)&self->_lazyChangeHandlingContainer, 0);
  objc_storeStrong((id *)&self->_lazyIndicatorFileCoordinator, 0);
  objc_storeStrong((id *)&self->_lazyPersistentContainer, 0);
  objc_storeStrong((id *)&self->_atomicPhotoLibraries, 0);
  objc_storeStrong((id *)&self->_shutdownReason, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
}

- (PLPhotoLibraryBundleController)bundleController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bundleController);
  return (PLPhotoLibraryBundleController *)WeakRetained;
}

- (BOOL)calculateTotalSizeWithResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  PLAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)setCloudPhotoLibraryEnabledSync:(BOOL)a3
{
  uint64_t v3 = self;
  PLAbstractMethodException();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)setPhotoStreamEnabled:(BOOL)a3
{
  uint64_t v3 = self;
  PLAbstractMethodException();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)setSharedAlbumEnabled:(BOOL)a3
{
  uint64_t v3 = self;
  PLAbstractMethodException();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)setCloudPhotoLibraryEnabled:(BOOL)a3
{
  uint64_t v3 = self;
  PLAbstractMethodException();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)unbindAssetsdService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  PLAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (BOOL)bindAssetsdService:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = self;
  PLAbstractMethodException();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (NSArray)boundAssetsdServices
{
  dispatch_workloop_t v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)newBoundAssetsdServicesTable
{
  dispatch_workloop_t v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)newLibraryServicesManager
{
  dispatch_workloop_t v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)newChangePublisher
{
  dispatch_workloop_t v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)newAssetsdClient
{
  dispatch_workloop_t v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)volumeWillUnmount:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v13 = objc_opt_class();
    __int16 v14 = 2048;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%@ %p volumeWillUnmount:%@", buf, 0x20u);
  }

  libraryURL = self->_libraryURL;
  if (libraryURL)
  {
    uint64_t v10 = *MEMORY[0x1E4F289D0];
    id v11 = libraryURL;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  }
  else
  {
    id v7 = 0;
  }
  v8 = [(PLPhotoLibraryBundle *)self bundleController];
  id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46012 userInfo:v7];
  [v8 shutdownBundle:self reason:v9];
}

- (PLConstraintsDirector)constraintsDirector
{
  return (PLConstraintsDirector *)[(PLLazyObject *)self->_lazyConstraintsDirector objectValue];
}

- (PLPhotoAnalysisServiceClient)photoAnalysisServiceClient
{
  return (PLPhotoAnalysisServiceClient *)[(PLLazyObject *)self->_lazyPhotoAnalysisServiceClient objectValue];
}

- (id)transferPersons:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  id v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F8C500];
  id v9 = a6;
  uint64_t v10 = [v7 errorWithDomain:v8 code:46309 userInfo:0];
  (*((void (**)(id, void *))a6 + 2))(v9, v10);

  return 0;
}

- (id)transferAssets:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  id v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F8C500];
  id v9 = a6;
  uint64_t v10 = [v7 errorWithDomain:v8 code:46309 userInfo:0];
  (*((void (**)(id, void *))a6 + 2))(v9, v10);

  return 0;
}

- (void)shutdownWithReason:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v11 = objc_opt_class();
    __int16 v12 = 2048;
    uint64_t v13 = self;
    __int16 v14 = 2080;
    uint64_t v15 = "-[PLPhotoLibraryBundle shutdownWithReason:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%@ %p %s %@", buf, 0x2Au);
  }

  atomicPhotoLibraries = self->_atomicPhotoLibraries;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PLPhotoLibraryBundle_shutdownWithReason___block_invoke;
  v8[3] = &unk_1E5870448;
  id v9 = v4;
  id v7 = v4;
  [(PLAtomicObject *)atomicPhotoLibraries invalidateWithHandler:v8];
  [(PLPhotoLibraryBundle *)self close];
}

void __43__PLPhotoLibraryBundle_shutdownWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(a2, "allObjects", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidateWithReason:*(void *)(a1 + 32)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)close
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [(PLPhotoLibraryBundle *)self libraryURL];
    int v8 = 138413058;
    uint64_t v9 = v4;
    __int16 v10 = 2048;
    long long v11 = self;
    __int16 v12 = 2080;
    uint64_t v13 = "-[PLPhotoLibraryBundle close]";
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p %s %@", (uint8_t *)&v8, 0x2Au);
  }
  uint64_t v6 = PLLibraryBundleGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(PLPhotoLibraryBundle *)self libraryURL];
    int v8 = 138412290;
    uint64_t v9 = (uint64_t)v7;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Closing %@", (uint8_t *)&v8, 0xCu);
  }
  [(PLPhotoLibraryBundle *)self _invalidatePhotoAnalysisServiceClient];
  [(PLPhotoLibraryBundle *)self _invalidateChangeHandlingContainer];
  [(PLPhotoLibraryBundle *)self _invalidatePersistentContainer];
  [(PLPhotoLibraryBundle *)self _invalidateClientSandboxExtensionCache];
  [(PLPhotoLibraryBundle *)self _invalidateGraphCache];
}

- (void)_invalidateGraphCache
{
}

- (void)_invalidatePersistentContainer
{
}

uint64_t __54__PLPhotoLibraryBundle__invalidatePersistentContainer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeSharedPersistentStoreCoordinator];
}

- (void)_invalidateChangeHandlingContainer
{
}

uint64_t __58__PLPhotoLibraryBundle__invalidateChangeHandlingContainer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stop];
}

- (void)_invalidatePhotoAnalysisServiceClient
{
}

- (PLGraphCache)graphCache
{
  return (PLGraphCache *)[(PLLazyObject *)self->_lazyGraphCache objectValue];
}

- (PLFetchRecorder)fetchRecorder
{
  return (PLFetchRecorder *)[(PLLazyObject *)self->_lazyFetchRecorder objectValue];
}

- (void)endObservingChanges
{
  dispatch_workloop_t v2 = [(PLLazyObject *)self->_lazyChangeHandlingContainer currentObjectValueWithoutForcingEvaluation];
  id v3 = v2;
  if (v2)
  {
    [v2 endObservingChanges];
  }
  else
  {
    uint64_t v4 = PLChangeHandlingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "API misuse: endObservingChanges called when changeHandlingContainer is nil (never initialized or already invalidated).", v5, 2u);
    }
  }
}

- (void)distributeChangesSinceLastCheckpoint
{
  dispatch_workloop_t v2 = [(PLLazyObject *)self->_lazyChangeHandlingContainer currentObjectValueWithoutForcingEvaluation];
  if (v2)
  {
    id v3 = v2;
    [v2 distributeChangesSinceLastCheckpoint];
    dispatch_workloop_t v2 = v3;
  }
}

- (void)initializeChangeHandling
{
  dispatch_workloop_t v2 = [(PLPhotoLibraryBundle *)self changeHandlingContainer];
}

- (PLClientSandboxExtensionCache)clientSandboxExtensionCache
{
  return 0;
}

- (PFTimeZoneLookup)timeZoneLookup
{
  return (PFTimeZoneLookup *)[(PLLazyObject *)self->_lazyTimeZoneLookup objectValue];
}

- (PLIndicatorFileCoordinator)indicatorFileCoordinator
{
  return (PLIndicatorFileCoordinator *)[(PLLazyObject *)self->_lazyIndicatorFileCoordinator objectValue];
}

- (PLEmailAddressManager)emailAddressManager
{
  return (PLEmailAddressManager *)[(PLLazyObject *)self->_lazyEmailAddressManager objectValue];
}

- (PLPersonInfoManager)personInfoManager
{
  return (PLPersonInfoManager *)[(PLLazyObject *)self->_lazyPersonInfoManager objectValue];
}

- (PLPhotoKitVariationCache)variationCache
{
  return (PLPhotoKitVariationCache *)[(PLLazyObject *)self->_lazyVariationCache objectValue];
}

- (int64_t)connectionType
{
  dispatch_workloop_t v2 = [(PLLazyObject *)self->_lazyPersistentContainer currentObjectValueWithoutForcingEvaluation];
  id v3 = v2;
  if (v2)
  {
    if ([v2 didConfigureXPCStore])
    {
      int64_t v4 = 1;
    }
    else if ([v3 didConfigurePersistentStore])
    {
      int64_t v4 = 2;
    }
    else
    {
      int64_t v4 = 0;
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isShuttingDown
{
  dispatch_workloop_t v2 = [(PLPhotoLibraryBundle *)self shutdownReason];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), self, self->_libraryURL];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = objc_opt_class();
    libraryURL = self->_libraryURL;
    *(_DWORD *)buf = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    __int16 v10 = self;
    __int16 v11 = 2112;
    __int16 v12 = libraryURL;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc %@", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PLPhotoLibraryBundle;
  [(PLPhotoLibraryBundle *)&v6 dealloc];
}

PLIndicatorFileCoordinator *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    dispatch_workloop_t v2 = [[PLIndicatorFileCoordinator alloc] initWithPathManager:WeakRetained[23]];
  }
  else {
    dispatch_workloop_t v2 = 0;
  }

  return v2;
}

PLPhotoKitVariationCache *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    dispatch_workloop_t v2 = [[PLPhotoKitVariationCache alloc] initWithPathManager:WeakRetained[23]];
  }
  else {
    dispatch_workloop_t v2 = 0;
  }

  return v2;
}

PLPersonInfoManager *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    dispatch_workloop_t v2 = [[PLPersonInfoManager alloc] initWithPathManager:WeakRetained[23] lazyAssetsdClient:WeakRetained[8]];
  }
  else {
    dispatch_workloop_t v2 = 0;
  }

  return v2;
}

PLEmailAddressManager *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    dispatch_workloop_t v2 = [[PLEmailAddressManager alloc] initWithPathManager:WeakRetained[23] lazyAssetsdClient:WeakRetained[8]];
  }
  else {
    dispatch_workloop_t v2 = 0;
  }

  return v2;
}

id __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_workloop_t v2 = WeakRetained;
  if (WeakRetained) {
    BOOL v3 = (void *)[WeakRetained newBoundAssetsdServicesTable];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

PLPhotoAnalysisServiceClient *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    dispatch_workloop_t v2 = [[PLPhotoAnalysisServiceClient alloc] initWithLibraryURL:WeakRetained[1]];
  }
  else {
    dispatch_workloop_t v2 = 0;
  }

  return v2;
}

PLConstraintsDirector *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    dispatch_workloop_t v2 = [[PLConstraintsDirector alloc] initWithPhotoLibraryURL:WeakRetained[1]];
  }
  else {
    dispatch_workloop_t v2 = 0;
  }

  return v2;
}

id __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_workloop_t v2 = WeakRetained;
  if (WeakRetained) {
    BOOL v3 = (void *)[WeakRetained _newTimeZoneLookup];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

PLFetchRecorder *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    dispatch_workloop_t v2 = objc_alloc_init(PLFetchRecorder);
  }
  else {
    dispatch_workloop_t v2 = 0;
  }

  return v2;
}

PLGraphCache *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    dispatch_workloop_t v2 = objc_alloc_init(PLGraphCache);
  }
  else {
    dispatch_workloop_t v2 = 0;
  }

  return v2;
}

- (id)_newTimeZoneLookup
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F8CDF0]);
  [MEMORY[0x1E4F8CC48] setDefaultTimeZoneLookup:v2];
  return v2;
}

uint64_t __57__PLPhotoLibraryBundle_Internal__registerPLPhotoLibrary___block_invoke_209(uint64_t result, void *a2)
{
  if (a2) {
    return [a2 addObject:*(void *)(result + 32)];
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;
  return result;
}

@end