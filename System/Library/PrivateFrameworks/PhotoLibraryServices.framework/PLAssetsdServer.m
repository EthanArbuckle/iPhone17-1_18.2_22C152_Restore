@interface PLAssetsdServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PLAssetsdServer)initWithDaemonServices:(id)a3;
- (PLPhotoLibraryDaemonService)searchSpotlightReceiver;
- (PLPhotoLibraryDaemonService)syndicationPreferencesListener;
- (PLPhotoLibraryDaemonService)syndicationSpotlightReceiver;
- (id)stateCaptureDictionary;
- (int)systemLibraryChangeToken;
- (void)_checkInWithLaunchd;
- (void)_collectCacheMetricsDataFromService:(id)a3;
- (void)_startObservingSystemLibraryChanges;
- (void)addService:(id)a3;
- (void)handleInterruption:(id)a3;
- (void)handleInvalidation:(id)a3;
- (void)logStatus;
- (void)removeService:(id)a3;
- (void)setSearchSpotlightReceiver:(id)a3;
- (void)setSyndicationPreferencesListener:(id)a3;
- (void)setSyndicationSpotlightReceiver:(id)a3;
- (void)setSystemLibraryChangeToken:(int)a3;
- (void)start;
- (void)stopObservingSystemLibraryChanges;
@end

@implementation PLAssetsdServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[PLFileDescriptorFuse checkFileDescriptorFuse];
  if ([MEMORY[0x1E4F8BA38] enabled])
  {
    connectionLogger = self->_connectionLogger;
    if (!connectionLogger)
    {
      v9 = (PLXPCMessageLogger *)objc_alloc_init(MEMORY[0x1E4F8BA38]);
      v10 = self->_connectionLogger;
      self->_connectionLogger = v9;

      connectionLogger = self->_connectionLogger;
    }
    [v7 setDelegate:connectionLogger];
  }
  [v7 setExportedInterface:self->_assetsdInterface];
  v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECD1E18];
  [v7 setRemoteObjectInterface:v11];

  v12 = [[PLAssetsdService alloc] initWithConnection:v7 libraryBundleController:self->_libraryBundleController daemonServices:self->_daemonServices];
  [v7 setExportedObject:v12];
  [(PLAssetsdServer *)self addService:v12];
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__PLAssetsdServer_listener_shouldAcceptNewConnection___block_invoke;
  v19[3] = &unk_1E5875DA0;
  objc_copyWeak(&v21, &location);
  v13 = v12;
  v20 = v13;
  [v7 setInterruptionHandler:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__PLAssetsdServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v16[3] = &unk_1E5875DA0;
  objc_copyWeak(&v18, &location);
  v14 = v13;
  v17 = v14;
  [v7 setInvalidationHandler:v16];
  [v7 resume];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return 1;
}

- (void)addService:(id)a3
{
  p_servicesLock = &self->_servicesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_servicesLock);
  [(NSMutableSet *)self->_services addObject:v5];

  os_unfair_lock_unlock(p_servicesLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSpotlightReceiver, 0);
  objc_storeStrong((id *)&self->_syndicationPreferencesListener, 0);
  objc_storeStrong((id *)&self->_syndicationSpotlightReceiver, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_cacheDeleteRegistration, 0);
  objc_storeStrong((id *)&self->_assetsdInterface, 0);
  objc_storeStrong((id *)&self->_tccObserver, 0);
  objc_storeStrong((id *)&self->_distributedNotificationHandler, 0);
  objc_storeStrong((id *)&self->_backgroundJobService, 0);
  objc_storeStrong((id *)&self->_libraryBundleController, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_connectionLogger, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_daemonServices, 0);
}

- (void)setSystemLibraryChangeToken:(int)a3
{
  self->_systemLibraryChangeToken = a3;
}

- (int)systemLibraryChangeToken
{
  return self->_systemLibraryChangeToken;
}

- (void)setSearchSpotlightReceiver:(id)a3
{
}

- (PLPhotoLibraryDaemonService)searchSpotlightReceiver
{
  return self->_searchSpotlightReceiver;
}

- (void)setSyndicationPreferencesListener:(id)a3
{
}

- (PLPhotoLibraryDaemonService)syndicationPreferencesListener
{
  return self->_syndicationPreferencesListener;
}

- (void)setSyndicationSpotlightReceiver:(id)a3
{
}

- (PLPhotoLibraryDaemonService)syndicationSpotlightReceiver
{
  return self->_syndicationSpotlightReceiver;
}

- (void)stopObservingSystemLibraryChanges
{
  int v3 = [(PLAssetsdServer *)self systemLibraryChangeToken];
  if (v3)
  {
    notify_cancel(v3);
    [(PLAssetsdServer *)self setSystemLibraryChangeToken:0];
  }
}

- (void)_startObservingSystemLibraryChanges
{
  int out_token = 0;
  int v3 = (const char *)*MEMORY[0x1E4F8C580];
  v4 = dispatch_get_global_queue(9, 0);
  LODWORD(v3) = notify_register_dispatch(v3, &out_token, v4, &__block_literal_global_76_115684);

  if (!v3) {
    [(PLAssetsdServer *)self setSystemLibraryChangeToken:out_token];
  }
}

uint64_t __54__PLAssetsdServer__startObservingSystemLibraryChanges__block_invoke()
{
  return +[PLSpotlightDonationManager handleUniversalSearchPhotoLibraryEligibilityChangeWithDetectedPathChange:1];
}

void __54__PLAssetsdServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleInterruption:*(void *)(a1 + 32)];
}

void __54__PLAssetsdServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleInvalidation:*(void *)(a1 + 32)];
}

- (void)handleInvalidation:(id)a3
{
  id v4 = a3;
  [(PLAssetsdServer *)self _collectCacheMetricsDataFromService:v4];
  [v4 handleInvalidation];
  [(PLAssetsdServer *)self removeService:v4];
}

- (void)handleInterruption:(id)a3
{
  id v4 = a3;
  [(PLAssetsdServer *)self _collectCacheMetricsDataFromService:v4];
  [v4 handleInterruption];
  [(PLAssetsdServer *)self removeService:v4];
}

- (void)_collectCacheMetricsDataFromService:(id)a3
{
  p_servicesLock = &self->_servicesLock;
  id v4 = a3;
  os_unfair_lock_lock(p_servicesLock);
  [v4 collectCacheMetrics];

  os_unfair_lock_unlock(p_servicesLock);
}

- (void)removeService:(id)a3
{
  p_servicesLock = &self->_servicesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_servicesLock);
  [(NSMutableSet *)self->_services removeObject:v5];

  os_unfair_lock_unlock(p_servicesLock);
}

- (id)stateCaptureDictionary
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA48] array];
  p_servicesLock = &self->_servicesLock;
  os_unfair_lock_lock(&self->_servicesLock);
  services = self->_services;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __41__PLAssetsdServer_stateCaptureDictionary__block_invoke;
  v12 = &unk_1E5875D78;
  id v13 = v3;
  id v6 = v3;
  [(NSMutableSet *)services enumerateObjectsUsingBlock:&v9];
  os_unfair_lock_unlock(p_servicesLock);
  v14 = @"services";
  v15[0] = v6;
  id v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, v9, v10, v11, v12);

  return v7;
}

void __41__PLAssetsdServer_stateCaptureDictionary__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 stateDescription];
  [v2 addObject:v3];
}

- (void)logStatus
{
  id v3 = PLBackendGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "services:", v4, 2u);
  }

  os_unfair_lock_lock(&self->_servicesLock);
  [(NSMutableSet *)self->_services enumerateObjectsUsingBlock:&__block_literal_global_115705];
  os_unfair_lock_unlock(&self->_servicesLock);
}

void __28__PLAssetsdServer_logStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLBackendGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "  %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_checkInWithLaunchd
{
  +[PLCacheDeleteRegistration registerDefaultHandlers];
  [(PLDistributedNotificationHandler *)self->_distributedNotificationHandler registerForNotifications];
  [(PLTCCObserver *)self->_tccObserver registerAsTCCObserver];
  libraryBundleController = self->_libraryBundleController;
  +[PLAnalysisCoordinator registerSearchFastPassTaskWithBundleController:libraryBundleController];
}

- (void)start
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(PLAssetsdServer *)self _checkInWithLaunchd];
  [(NSXPCListener *)self->_listener resume];
  [(PLPhotoLibraryDaemonService *)self->_syndicationSpotlightReceiver start];
  [(PLPhotoLibraryDaemonService *)self->_syndicationPreferencesListener start];
  [(PLPhotoLibraryDaemonService *)self->_searchSpotlightReceiver start];
  [(PLAssetsdServer *)self _startObservingSystemLibraryChanges];
  +[PLSpotlightDonationManager handleUniversalSearchPhotoLibraryEligibilityChangeWithDetectedPathChange:0];
  id v3 = +[PLPhotoLibraryForceExitObserver sharedInstance];
  int v4 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412546;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "%@ %p start", (uint8_t *)&v5, 0x16u);
  }
}

- (PLAssetsdServer)initWithDaemonServices:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"PLAssetsdServer.m" lineNumber:65 description:@"PLAssetsdServer must only be initialized on assetsd"];
  }
  v32.receiver = self;
  v32.super_class = (Class)PLAssetsdServer;
  __int16 v7 = [(PLAssetsdServer *)&v32 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_daemonServices, a3);
    id v9 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v10 = [v9 initWithMachServiceName:*MEMORY[0x1E4F8BAF0]];
    listener = v8->_listener;
    v8->_listener = (NSXPCListener *)v10;

    [(NSXPCListener *)v8->_listener setDelegate:v8];
    uint64_t v12 = [MEMORY[0x1E4F8B870] assetsdInterface];
    assetsdInterface = v8->_assetsdInterface;
    v8->_assetsdInterface = (NSXPCInterface *)v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    services = v8->_services;
    v8->_services = v14;

    v16 = objc_alloc_init(PLBackgroundJobService);
    backgroundJobService = v8->_backgroundJobService;
    v8->_backgroundJobService = v16;

    id v18 = objc_alloc_init(PLCacheDeleteRegistration);
    cacheDeleteRegistration = v8->_cacheDeleteRegistration;
    v8->_cacheDeleteRegistration = v18;

    uint64_t v20 = +[PLPhotoLibraryBundleController sharedBundleController];
    libraryBundleController = v8->_libraryBundleController;
    v8->_libraryBundleController = (PLPhotoLibraryBundleController *)v20;

    [(PLPhotoLibraryBundleController *)v8->_libraryBundleController setBackgroundJobService:v8->_backgroundJobService];
    [(PLPhotoLibraryBundleController *)v8->_libraryBundleController setCacheDeleteRegistration:v8->_cacheDeleteRegistration];
    v22 = [[PLDistributedNotificationHandler alloc] initWithLibraryBundleController:v8->_libraryBundleController];
    distributedNotificationHandler = v8->_distributedNotificationHandler;
    v8->_distributedNotificationHandler = v22;

    if (PLPlatformLimitedLibrarySupported())
    {
      v24 = [[PLTCCObserver alloc] initWithLibraryBundleController:v8->_libraryBundleController];
      tccObserver = v8->_tccObserver;
      v8->_tccObserver = v24;
    }
    v8->_servicesLock._os_unfair_lock_opaque = 0;
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F8A228]) initWithProvider:v8];
    stateHandler = v8->_stateHandler;
    v8->_stateHandler = (PFStateCaptureHandler *)v26;
  }
  v28 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = v29;
    __int16 v35 = 2048;
    v36 = v8;
    _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "%@ %p init", buf, 0x16u);
  }

  return v8;
}

@end