@interface PRSService
- (PRSService)init;
- (id)_serviceInterfaceWithError:(id *)a3;
- (id)fetchActivePosterForRole:(id)a3 error:(id *)a4;
- (id)serviceNotificationCenterWithError:(id *)a3;
- (void)_refreshPosterDescriptorsForExtension:(id)a3 sessionInfo:(id)a4 completion:(id)a5;
- (void)_selectConfigurationAndRefreshSnapshot:(id)a3 completion:(id)a4;
- (void)associateConfigurationMatchingUUID:(id)a3 focusModeActivityUUID:(id)a4 completion:(id)a5;
- (void)clearMigrationFlags:(id)a3;
- (void)createAndSelectLegacyPosterConfigurationIfNeededWithCompletion:(id)a3;
- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 completion:(id)a5;
- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 role:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)deleteArchivedDataStoreNamed:(id)a3 completion:(id)a4;
- (void)deleteDataStoreWithCompletion:(id)a3;
- (void)deleteHostConfigurationForRole:(id)a3 completion:(id)a4;
- (void)deletePosterConfigurationsMatchingUUID:(id)a3 completion:(id)a4;
- (void)deletePosterDescriptorsForExtension:(id)a3 completion:(id)a4;
- (void)deleteSnapshots:(BOOL)a3 completion:(id)a4;
- (void)deleteTransientDataWithCompletion:(id)a3;
- (void)exportArchivedDataStoreNamed:(id)a3 completion:(id)a4;
- (void)exportCurrentDataStoreToURL:(id)a3 options:(id)a4 sandboxToken:(id)a5 error:(id *)a6;
- (void)exportPosterConfigurationMatchingUUID:(id)a3 completion:(id)a4;
- (void)fetchActiveConfiguration:(id)a3;
- (void)fetchActivePosterConfiguration:(id)a3;
- (void)fetchActivePosterForRole:(id)a3 completion:(id)a4;
- (void)fetchArchivedDataStoreNamesWithCompletion:(id)a3;
- (void)fetchAssociatedHomeScreenPosterConfigurationUUID:(id)a3 completion:(id)a4;
- (void)fetchChargerIdentifierRelationshipsWithCompletion:(id)a3;
- (void)fetchContentCutoutBoundsForActivePosterWithOrientation:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchContentCutoutBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5;
- (void)fetchContentObstructionBoundsForActivePosterWithOrientation:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchContentObstructionBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5;
- (void)fetchExtensionIdentifiersWithCompletion:(id)a3;
- (void)fetchFocusUUIDForConfiguration:(id)a3 completion:(id)a4;
- (void)fetchGallery:(id)a3;
- (void)fetchLimitedOcclusionBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5;
- (void)fetchMaximalContentCutoutBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchObscurableBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5;
- (void)fetchPosterConfigurations:(id)a3;
- (void)fetchPosterConfigurationsForExtension:(id)a3 completion:(id)a4;
- (void)fetchPosterConfigurationsForRole:(id)a3 completion:(id)a4;
- (void)fetchPosterDescriptorsForExtension:(id)a3 completion:(id)a4;
- (void)fetchPosterFocusSnapshotsWithRequest:(id)a3 completion:(id)a4;
- (void)fetchPosterSnapshotsWithRequest:(id)a3 completion:(id)a4;
- (void)fetchRuntimeAssertionState:(id)a3;
- (void)fetchSelectedConfiguration:(id)a3;
- (void)fetchSelectedPosterForRole:(id)a3 completion:(id)a4;
- (void)fetchStaticPosterDescriptorsForExtension:(id)a3 completion:(id)a4;
- (void)gatherDataFreshnessState:(id)a3;
- (void)ignoreExtension:(id)a3 completion:(id)a4;
- (void)importPosterConfigurationFromArchiveData:(id)a3 completion:(id)a4;
- (void)importPosterConfigurationFromArchivedData:(id)a3 completion:(id)a4;
- (void)ingestSnapshotCollection:(id)a3 forPosterConfiguration:(id)a4 completion:(id)a5;
- (void)init;
- (void)notePosterConfigurationUnderlyingModelDidChange:(id)a3;
- (void)notifyActiveChargerIdentifierDidUpdate:(id)a3 completion:(id)a4;
- (void)notifyAvailableFocusModesDidChange:(id)a3 completion:(id)a4;
- (void)notifyFocusModeDidChange:(id)a3 completion:(id)a4;
- (void)notifyPosterBoardOfApplicationUpdatesWithCompletion:(id)a3;
- (void)overnightUpdateWithCompletion:(id)a3;
- (void)prewarmWithCompletion:(id)a3;
- (void)pushPosterGalleryUpdate:(id)a3 completion:(id)a4;
- (void)pushToProactiveWithCompletion:(id)a3;
- (void)refreshPosterConfiguration:(id)a3 completion:(id)a4;
- (void)refreshPosterConfiguration:(id)a3 sessionInfo:(id)a4 completion:(id)a5;
- (void)refreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 completion:(id)a5;
- (void)refreshPosterDescriptorsForExtension:(id)a3 completion:(id)a4;
- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a3 extensionIdentifier:(id)a4 completion:(id)a5;
- (void)refreshSnapshotForPosterConfiguration:(id)a3 completion:(id)a4;
- (void)refreshSnapshotForPosterConfigurationMatchingUUID:(id)a3 completion:(id)a4;
- (void)removeAllFocusConfigurationsMatchingFocusUUID:(id)a3 completion:(id)a4;
- (void)resetRole:(id)a3 completion:(id)a4;
- (void)restoreArchivedDataStoreNamed:(id)a3 backupExistingDataStore:(BOOL)a4 completion:(id)a5;
- (void)retrieveGallery:(id)a3;
- (void)runMigration:(BOOL)a3 completion:(id)a4;
- (void)runMigration:(BOOL)a3 migrationDescriptor:(id)a4 completion:(id)a5;
- (void)setHostConfiguration:(id)a3 forRole:(id)a4 completion:(id)a5;
- (void)stashCurrentDataStoreWithName:(id)a3 options:(id)a4 completion:(id)a5;
- (void)triggerMessedUpDataProtectionWithCompletion:(id)a3;
- (void)unignoreExtension:(id)a3 completion:(id)a4;
- (void)updatePosterConfiguration:(id)a3 update:(id)a4 completion:(id)a5;
- (void)updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5;
- (void)updateSelectedForRoleIdentifier:(id)a3 newlySelectedConfiguration:(id)a4 completion:(id)a5;
- (void)updateToSelectedConfiguration:(id)a3 completion:(id)a4;
- (void)updateToSelectedConfiguration:(id)a3 role:(id)a4 completion:(id)a5;
- (void)updateToSelectedConfigurationMatchingUUID:(id)a3 completion:(id)a4;
- (void)updateToSelectedConfigurationMatchingUUID:(id)a3 role:(id)a4 completion:(id)a5;
@end

@implementation PRSService

void __60__PRSService_fetchPosterDescriptorsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    v9 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_13);
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
}

void __27__PRSService_fetchGallery___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  v10 = PRSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PRSService)init
{
  v19.receiver = self;
  v19.super_class = (Class)PRSService;
  v2 = [(PRSService *)&v19 init];
  if (v2)
  {
    v3 = PRSServiceInterface();
    v4 = (void *)MEMORY[0x1E4F50BB8];
    id v5 = [v3 identifier];
    id v6 = [v4 endpointForMachName:@"com.apple.posterboardservices.services" service:v5 instance:0];

    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (v6)
    {
      uint64_t v9 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
      serviceConnection = v2->_serviceConnection;
      v2->_serviceConnection = (BSServiceConnectionClient *)v9;

      objc_initWeak(&location, v2);
      v11 = v2->_serviceConnection;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __18__PRSService_init__block_invoke;
      v14[3] = &unk_1E5D01130;
      id v15 = v3;
      id v16 = v8;
      objc_copyWeak(&v17, &location);
      [(BSServiceConnectionClient *)v11 configureConnection:v14];
      objc_destroyWeak(&v17);

      objc_destroyWeak(&location);
    }
    else
    {
      v12 = PRSLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PRSService init]();
      }
    }
  }
  return v2;
}

void __18__PRSService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setInterface:*(void *)(a1 + 32)];
  v4 = PRSDefaultServiceQuality();
  [v3 setServiceQuality:v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __18__PRSService_init__block_invoke_2;
  v8[3] = &unk_1E5D010E0;
  id v9 = *(id *)(a1 + 40);
  objc_copyWeak(&v10, (id *)(a1 + 48));
  [v3 setInterruptionHandler:v8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __18__PRSService_init__block_invoke_38;
  v5[3] = &unk_1E5D01108;
  id v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v7, (id *)(a1 + 48));
  [v3 setInvalidationHandler:v5];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v10);
}

void __18__PRSService_init__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = PRSLogObserver();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1A78AC000, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p interrupted", (uint8_t *)&v5, 0x16u);
  }
}

void __18__PRSService_init__block_invoke_38(uint64_t a1)
{
  v2 = PRSLogObserver();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __18__PRSService_init__block_invoke_38_cold_1(a1);
  }
}

- (void)dealloc
{
  [(BSServiceConnectionClient *)self->_serviceConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRSService;
  [(PRSService *)&v3 dealloc];
}

- (id)serviceNotificationCenterWithError:(id *)a3
{
  if (serviceNotificationCenterWithError__onceToken != -1) {
    dispatch_once(&serviceNotificationCenterWithError__onceToken, &__block_literal_global_45);
  }
  objc_super v3 = (void *)serviceNotificationCenterWithError____notificationCenter;
  return v3;
}

void __49__PRSService_serviceNotificationCenterWithError___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EB8]);
  v1 = (void *)serviceNotificationCenterWithError____notificationCenter;
  serviceNotificationCenterWithError____notificationCenter = (uint64_t)v0;

  uint64_t v6 = objc_alloc_init(PRSWallpaperLocationStateObserver);
  [(PRSWallpaperLocationStateObserver *)v6 setHandler:&__block_literal_global_50_0];
  [(PRSWallpaperLocationStateObserver *)v6 setLocations:12];
  v2 = objc_alloc_init(PRSWallpaperObserverConfiguration);
  [(PRSWallpaperObserverConfiguration *)v2 setLocationStateObserver:v6];
  objc_super v3 = dispatch_get_global_queue(25, 0);
  [(PRSWallpaperObserverConfiguration *)v2 setQueue:v3];

  v4 = [[PRSWallpaperObserver alloc] initWithExplanation:@"PRSService-serviceNotificationCenter"];
  int v5 = (void *)serviceNotificationCenterWithError____observer;
  serviceNotificationCenterWithError____observer = (uint64_t)v4;

  [(id)serviceNotificationCenterWithError____observer activateWithConfiguration:v2];
}

void __49__PRSService_serviceNotificationCenterWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = objc_opt_new();
  v4 = [v2 activeLock];
  [v3 setObject:v4 forKeyedSubscript:@"PRSServiceToSelectedPosterConfigurationUserInfoKey"];

  int v5 = [v2 activeHome];
  [v3 setObject:v5 forKeyedSubscript:@"PRSServiceHomeScreenAssociatedPosterConfigurationUserInfoKey"];

  [(id)serviceNotificationCenterWithError____notificationCenter postNotificationName:@"PRSServiceDidUpdateActivePosterConfigurationNotification" object:0 userInfo:v3];
  uint64_t v6 = PRSLogObserver();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    v14 = v3;
    _os_log_impl(&dword_1A78AC000, v6, OS_LOG_TYPE_DEFAULT, "posting PRSServiceDidUpdateActivePosterConfigurationNotification with userInfo=%{public}@", (uint8_t *)&v13, 0xCu);
  }

  __int16 v7 = objc_opt_new();
  id v8 = [v2 activeLock];
  [v7 setObject:v8 forKeyedSubscript:@"PRSServiceUpdatedPosterConfigurationUserInfoKey"];

  uint64_t v9 = [v2 activeLock];
  id v10 = [v2 activeHome];

  if (v9 != v10)
  {
    v11 = [v2 activeHome];
    [v7 setObject:v11 forKeyedSubscript:@"PRSServiceHomeScreenAssociatedPosterConfigurationUserInfoKey"];
  }
  [(id)serviceNotificationCenterWithError____notificationCenter postNotificationName:@"PRSServiceDidUpdateAssociatedHomeScreenPosterConfigurationNotification" object:0 userInfo:v7];
  v12 = PRSLogObserver();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1A78AC000, v12, OS_LOG_TYPE_DEFAULT, "posting PRSServiceDidUpdateAssociatedHomeScreenPosterConfigurationNotification with userInfo=%{public}@", (uint8_t *)&v13, 0xCu);
  }
}

- (void)deleteDataStoreWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 136, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v14 = 0;
  uint64_t v6 = [(PRSService *)self _serviceInterfaceWithError:&v14];
  id v7 = v14;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__PRSService_deleteDataStoreWithCompletion___block_invoke;
    v9[3] = &unk_1E5D011A0;
    SEL v13 = a2;
    id v10 = v6;
    v11 = self;
    id v12 = v5;
    [v10 invalidateDataStoreWithCompletion:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }
}

void __44__PRSService_deleteDataStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) terminate];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5D01178;
  objc_super v3 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v7 = v5;
  [v3 deleteDataStoreWithCompletion:v6];
}

void __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetRole:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 157, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  uint64_t v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __35__PRSService_resetRole_completion___block_invoke;
    v12[3] = &unk_1E5D01178;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 resetRole:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

void __35__PRSService_resetRole_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteSnapshots:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 171, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  id v8 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v9 = v15;
  if (v8)
  {
    id v10 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__PRSService_deleteSnapshots_completion___block_invoke;
    v12[3] = &unk_1E5D01178;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v7;
    [v8 deleteSnapshots:v10 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }
}

void __41__PRSService_deleteSnapshots_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)notifyPosterBoardOfApplicationUpdatesWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 185, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  uint64_t v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__PRSService_notifyPosterBoardOfApplicationUpdatesWithCompletion___block_invoke;
    v9[3] = &unk_1E5D01178;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 notifyPosterBoardOfApplicationUpdatesWithCompletion:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }
}

void __66__PRSService_notifyPosterBoardOfApplicationUpdatesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteTransientDataWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 203, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  uint64_t v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__PRSService_deleteTransientDataWithCompletion___block_invoke;
    v9[3] = &unk_1E5D01178;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 deleteTransientDataWithCompletion:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }
}

void __48__PRSService_deleteTransientDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setHostConfiguration:(id)a3 forRole:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    SEL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PRSService.m", 223, @"Invalid parameter not satisfying: %@", @"roleIdentifier" object file lineNumber description];
  }
  id v18 = 0;
  id v12 = [(PRSService *)self _serviceInterfaceWithError:&v18];
  id v13 = v18;
  if (v12)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__PRSService_setHostConfiguration_forRole_completion___block_invoke;
    v15[3] = &unk_1E5D01178;
    SEL v17 = a2;
    v15[4] = self;
    id v16 = v11;
    [v12 setHostConfiguration:v9 forRole:v10 completion:v15];
  }
  else if (v11)
  {
    (*((void (**)(id, id))v11 + 2))(v11, v13);
  }
}

void __54__PRSService_setHostConfiguration_forRole_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)deleteHostConfigurationForRole:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 240, @"Invalid parameter not satisfying: %@", @"roleIdentifier" object file lineNumber description];
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__PRSService_deleteHostConfigurationForRole_completion___block_invoke;
    v12[3] = &unk_1E5D01178;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 deleteHostConfigurationForRole:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

void __56__PRSService_deleteHostConfigurationForRole_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)fetchExtensionIdentifiersWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 258, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  uint64_t v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__PRSService_fetchExtensionIdentifiersWithCompletion___block_invoke;
    v9[3] = &unk_1E5D011C8;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 fetchExtensionIdentifiersWithCompletion:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, void, id))v5 + 2))(v5, 0, v7);
  }
}

void __54__PRSService_fetchExtensionIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchPosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    SEL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 273, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PRSService_fetchPosterDescriptorsForExtension_completion___block_invoke;
    v12[3] = &unk_1E5D011F0;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 fetchPosterDescriptorsForExtension:v7 completion:v12];
  }
  else
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v10);
  }
}

- (void)fetchStaticPosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    SEL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 292, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__PRSService_fetchStaticPosterDescriptorsForExtension_completion___block_invoke;
    v12[3] = &unk_1E5D011F0;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 fetchStaticPosterDescriptorsForExtension:v7 completion:v12];
  }
  else
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v10);
  }
}

void __66__PRSService_fetchStaticPosterDescriptorsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    id v9 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_13);
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
}

- (void)refreshPosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
}

- (void)_refreshPosterDescriptorsForExtension:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    SEL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PRSService.m", 319, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v18 = 0;
  id v12 = [(PRSService *)self _serviceInterfaceWithError:&v18];
  id v13 = v18;
  if (v12)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__PRSService__refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke;
    v15[3] = &unk_1E5D011F0;
    SEL v17 = a2;
    v15[4] = self;
    id v16 = v11;
    [v12 refreshPosterDescriptorsForExtension:v9 sessionInfo:v10 completion:v15];
  }
  else if (v11)
  {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v13);
  }
}

void __75__PRSService__refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    id v9 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_13);
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
}

- (void)deletePosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 338, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"PRSService.m", 339, @"Invalid parameter not satisfying: %@", @"providerIdentifier" object file lineNumber description];

LABEL_3:
  id v16 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v16];
  id v10 = v16;
  if (v9)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__PRSService_deletePosterDescriptorsForExtension_completion___block_invoke;
    v13[3] = &unk_1E5D01178;
    SEL v15 = a2;
    v13[4] = self;
    id v14 = v8;
    [v9 deletePosterDescriptorsForExtension:v7 completion:v13];
  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

void __61__PRSService_deletePosterDescriptorsForExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchRuntimeAssertionState:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 354, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  id v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__PRSService_fetchRuntimeAssertionState___block_invoke;
    v9[3] = &unk_1E5D01218;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 fetchRuntimeAssertionState:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, void, id))v5 + 2))(v5, 0, v7);
  }
}

void __41__PRSService_fetchRuntimeAssertionState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)triggerMessedUpDataProtectionWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 369, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  id v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__PRSService_triggerMessedUpDataProtectionWithCompletion___block_invoke;
    v9[3] = &unk_1E5D01178;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 triggerMessedUpDataProtectionWithCompletion:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }
}

void __58__PRSService_triggerMessedUpDataProtectionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchChargerIdentifierRelationshipsWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 384, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  id v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__PRSService_fetchChargerIdentifierRelationshipsWithCompletion___block_invoke;
    v9[3] = &unk_1E5D01240;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 fetchChargerIdentifierRelationshipsWithCompletion:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, void, id))v5 + 2))(v5, 0, v7);
  }
}

void __64__PRSService_fetchChargerIdentifierRelationshipsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 role:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  id v14 = a6;
  if (v14)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    SEL v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PRSService.m", 402, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PRSService.m", 403, @"Invalid parameter not satisfying: %@", @"providerIdentifier" object file lineNumber description];

LABEL_3:
  if (!v13) {
    id v13 = @"PRPosterRoleLockScreen";
  }
  id v22 = 0;
  SEL v15 = [(PRSService *)self _serviceInterfaceWithError:&v22];
  id v16 = v22;
  if (v15)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __104__PRSService_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke;
    v19[3] = &unk_1E5D00BA0;
    SEL v21 = a2;
    v19[4] = self;
    id v20 = v14;
    [v15 createPosterConfigurationForProviderIdentifier:v11 posterDescriptorIdentifier:v12 role:v13 completion:v19];
  }
  else if (v14)
  {
    (*((void (**)(id, void, id))v14 + 2))(v14, 0, v16);
  }
}

void __104__PRSService_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  if (v5) {
    id v8 = [[PRSPosterConfiguration alloc] _initWithPath:v5];
  }
  else {
    id v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 completion:(id)a5
{
}

- (void)refreshPosterConfiguration:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (v13)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 427, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"PRSService.m", 428, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v8 = [v13 _path];
  id v9 = [v8 serverIdentity];
  id v10 = [v9 posterUUID];

  [(PRSService *)self refreshPosterConfigurationMatchingUUID:v10 sessionInfo:0 completion:v7];
}

- (void)refreshPosterConfiguration:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v16)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PRSService.m", 434, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  SEL v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PRSService.m", 435, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v11 = [v16 _path];
  id v12 = [v11 serverIdentity];
  id v13 = [v12 posterUUID];

  [(PRSService *)self refreshPosterConfigurationMatchingUUID:v13 sessionInfo:v9 completion:v10];
}

- (void)refreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PRSService.m", 441, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  SEL v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PRSService.m", 442, @"Invalid parameter not satisfying: %@", @"posterUUID" object file lineNumber description];

LABEL_3:
  id v19 = 0;
  id v12 = [(PRSService *)self _serviceInterfaceWithError:&v19];
  id v13 = v19;
  if (v12)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__PRSService_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke;
    v16[3] = &unk_1E5D00BA0;
    SEL v18 = a2;
    v16[4] = self;
    id v17 = v11;
    [v12 refreshPosterConfigurationMatchingUUID:v9 sessionInfo:v10 completion:v16];
  }
  else if (v11)
  {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v13);
  }
}

void __76__PRSService_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  if (v5) {
    id v8 = [[PRSPosterConfiguration alloc] _initWithPath:v5];
  }
  else {
    id v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)notePosterConfigurationUnderlyingModelDidChange:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 458, @"Invalid parameter not satisfying: %@", @"posterUUID" object file lineNumber description];
  }
  uint64_t v9 = 0;
  id v6 = [(PRSService *)self _serviceInterfaceWithError:&v9];
  id v7 = v6;
  if (v6) {
    [v6 notePosterConfigurationUnderlyingModelDidChange:v5];
  }
}

- (void)associateConfigurationMatchingUUID:(id)a3 focusModeActivityUUID:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PRSService.m", 468, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  SEL v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PRSService.m", 469, @"Invalid parameter not satisfying: %@", @"configurationUUID" object file lineNumber description];

LABEL_3:
  id v19 = 0;
  id v12 = [(PRSService *)self _serviceInterfaceWithError:&v19];
  id v13 = v19;
  if (v12)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__PRSService_associateConfigurationMatchingUUID_focusModeActivityUUID_completion___block_invoke;
    v16[3] = &unk_1E5D01178;
    SEL v18 = a2;
    v16[4] = self;
    id v17 = v11;
    [v12 associateConfigurationMatchingUUID:v9 focusModeActivityUUID:v10 completion:v16];
  }
  else if (v11)
  {
    (*((void (**)(id, id))v11 + 2))(v11, v13);
  }
}

void __82__PRSService_associateConfigurationMatchingUUID_focusModeActivityUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchPosterConfigurations:(id)a3
{
}

- (void)fetchPosterConfigurationsForExtension:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRSService.m", 488, @"Invalid parameter not satisfying: %@", @"posterExtensionIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PRSService.m", 489, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v17 = 0;
  id v10 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__PRSService_fetchPosterConfigurationsForExtension_completion___block_invoke;
    v14[3] = &unk_1E5D011F0;
    SEL v16 = a2;
    void v14[4] = self;
    SEL v15 = v9;
    [v10 fetchPosterConfigurationsForExtension:v7 completion:v14];
  }
  else if (v9)
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v11);
  }
}

void __63__PRSService_fetchPosterConfigurationsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_33);

  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);
}

- (void)fetchPosterSnapshotsWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PRSService.m", 504, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  SEL v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PRSService.m", 505, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  uint64_t v10 = objc_opt_class();
  id v11 = (PRSPosterSnapshotRequest *)v7;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v14 = [[PRSPosterSnapshotRequest alloc] initWithFocusPosterRequest:v13];

    id v11 = v14;
  }
  id v22 = 0;
  SEL v15 = [(PRSService *)self _serviceInterfaceWithError:&v22];
  id v16 = v22;
  if (v15)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__PRSService_fetchPosterSnapshotsWithRequest_completion___block_invoke;
    v19[3] = &unk_1E5D01268;
    SEL v21 = a2;
    v19[4] = self;
    id v20 = v9;
    [v15 fetchPosterSnapshotsWithRequest:v11 completion:v19];
  }
  else if (v9)
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v16);
  }
}

void __57__PRSService_fetchPosterSnapshotsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchPosterFocusSnapshotsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PRSPosterSnapshotRequest alloc] initWithFocusPosterRequest:v7];

  [(PRSService *)self fetchPosterSnapshotsWithRequest:v8 completion:v6];
}

- (void)deletePosterConfigurationsMatchingUUID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRSService.m", 530, @"Invalid parameter not satisfying: %@", @"UUID" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PRSService.m", 531, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v17 = 0;
  uint64_t v10 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__PRSService_deletePosterConfigurationsMatchingUUID_completion___block_invoke;
    v14[3] = &unk_1E5D01178;
    SEL v16 = a2;
    void v14[4] = self;
    SEL v15 = v9;
    [v10 deletePosterConfigurationsMatchingUUID:v7 completion:v14];
  }
  else if (v9)
  {
    ((void (**)(void, id))v9)[2](v9, v11);
  }
}

void __64__PRSService_deletePosterConfigurationsMatchingUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)exportPosterConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRSService.m", 546, @"Invalid parameter not satisfying: %@", @"configurationUUID" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PRSService.m", 547, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v17 = 0;
  uint64_t v10 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__PRSService_exportPosterConfigurationMatchingUUID_completion___block_invoke;
    v14[3] = &unk_1E5D01290;
    SEL v16 = a2;
    void v14[4] = self;
    SEL v15 = v9;
    [v10 exportPosterConfigurationMatchingUUID:v7 completion:v14];
  }
  else if (v9)
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v11);
  }
}

void __63__PRSService_exportPosterConfigurationMatchingUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)importPosterConfigurationFromArchiveData:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRSService.m", 561, @"Invalid parameter not satisfying: %@", @"archiveData" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PRSService.m", 562, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v17 = 0;
  uint64_t v10 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__PRSService_importPosterConfigurationFromArchiveData_completion___block_invoke;
    v14[3] = &unk_1E5D00BA0;
    SEL v16 = a2;
    void v14[4] = self;
    SEL v15 = v9;
    [v10 importPosterConfigurationFromArchiveData:v7 completion:v14];
  }
  else if (v9)
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v11);
  }
}

void __66__PRSService_importPosterConfigurationFromArchiveData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [v6 identity];

  uint64_t v10 = [v9 posterUUID];
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v10, v5);
}

- (void)importPosterConfigurationFromArchivedData:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRSService.m", 576, @"Invalid parameter not satisfying: %@", @"archiveData" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PRSService.m", 577, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v17 = 0;
  uint64_t v10 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__PRSService_importPosterConfigurationFromArchivedData_completion___block_invoke;
    v14[3] = &unk_1E5D00BA0;
    SEL v16 = a2;
    void v14[4] = self;
    SEL v15 = v9;
    [v10 importPosterConfigurationFromArchiveData:v7 completion:v14];
  }
  else if (v9)
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v11);
  }
}

void __67__PRSService_importPosterConfigurationFromArchivedData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  if (v6) {
    id v8 = 0;
  }
  else {
    id v8 = [[PRSPosterConfiguration alloc] _initWithPath:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v10;
  NSClassFromString(&cfstr_Nsarray.isa);
  if (!v12)
  {
    SEL v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSService updatePosterConfigurationMatchingUUID:updates:completion:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78DFE00);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSService updatePosterConfigurationMatchingUUID:updates:completion:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78DFE64);
  }

  id v13 = v9;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v13)
  {
    SEL v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSService updatePosterConfigurationMatchingUUID:updates:completion:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78DFEC8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSService updatePosterConfigurationMatchingUUID:updates:completion:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78DFF2CLL);
  }

  if (!v11)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PRSService.m", 594, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v24 = 0;
  id v14 = [(PRSService *)self _serviceInterfaceWithError:&v24];
  id v15 = v24;
  if (v14)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__PRSService_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke;
    v21[3] = &unk_1E5D012B8;
    SEL v23 = a2;
    v21[4] = self;
    id v22 = v11;
    [v14 updatePosterConfigurationMatchingUUID:v13 updates:v12 completion:v21];
  }
  else if (v11)
  {
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v15);
  }
}

void __71__PRSService_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PRSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v7)
  {
    id v12 = [[PRSPosterConfiguration alloc] _initWithPath:v7];
    (*(void (**)(uint64_t, id, id, id))(v11 + 16))(v11, v12, v8, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void, id, id))(v11 + 16))(v11, 0, v8, v9);
  }
}

- (void)updatePosterConfiguration:(id)a3 update:(id)a4 completion:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v10;
  NSClassFromString(&cfstr_Prsposterupdat_20.isa);
  if (!v12)
  {
    id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSService updatePosterConfiguration:update:completion:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E02B8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSService updatePosterConfiguration:update:completion:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E031CLL);
  }

  id v13 = v9;
  NSClassFromString(&cfstr_Prsposterconfi_1.isa);
  if (!v13)
  {
    SEL v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSService updatePosterConfiguration:update:completion:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E0380);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSService updatePosterConfiguration:update:completion:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E03E4);
  }

  id v14 = [v13 _path];
  char v15 = [v14 isServerPosterPath];

  if ((v15 & 1) == 0)
  {
    SEL v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[configuration _path] isServerPosterPath]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSService updatePosterConfiguration:update:completion:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E0448);
  }
  if (!v11)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PRSService.m", 611, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v28 = 0;
  SEL v16 = [(PRSService *)self _serviceInterfaceWithError:&v28];
  id v17 = v28;
  if (v16)
  {
    v29[0] = v12;
    SEL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __58__PRSService_updatePosterConfiguration_update_completion___block_invoke;
    v25[3] = &unk_1E5D012B8;
    SEL v27 = a2;
    v25[4] = self;
    id v26 = v11;
    [v16 updatePosterConfiguration:v13 updates:v18 completion:v25];
  }
  else if (v11)
  {
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v17);
  }
}

void __58__PRSService_updatePosterConfiguration_update_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PRSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v7) {
    id v12 = [[PRSPosterConfiguration alloc] _initWithPath:v7];
  }
  else {
    id v12 = 0;
  }
  id v13 = [v8 firstObject];
  (*(void (**)(uint64_t, id, void *, id))(v11 + 16))(v11, v12, v13, v9);

  if (v7) {
}
  }

- (void)refreshSnapshotForPosterConfiguration:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  id v8 = v13;
  if (!v13)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRSService.m", 625, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

    id v8 = 0;
  }
  id v9 = [v8 _path];
  id v10 = [v9 serverIdentity];
  uint64_t v11 = [v10 posterUUID];

  [(PRSService *)self refreshSnapshotForPosterConfigurationMatchingUUID:v11 completion:v7];
}

- (void)refreshSnapshotForPosterConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 631, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__PRSService_refreshSnapshotForPosterConfigurationMatchingUUID_completion___block_invoke;
    v12[3] = &unk_1E5D01178;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 refreshSnapshotForPosterConfigurationMatchUUID:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

void __75__PRSService_refreshSnapshotForPosterConfigurationMatchingUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)ingestSnapshotCollection:(id)a3 forPosterConfiguration:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(void, void))v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    SEL v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PRSService.m", 646, @"Invalid parameter not satisfying: %@", @"snapshotCollection" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PRSService.m", 647, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v13 = [v10 _path];
  SEL v14 = [v13 serverIdentity];
  id v15 = [v14 posterUUID];

  id v23 = 0;
  SEL v16 = [(PRSService *)self _serviceInterfaceWithError:&v23];
  id v17 = v23;
  if (v16)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__PRSService_ingestSnapshotCollection_forPosterConfiguration_completion___block_invoke;
    v20[3] = &unk_1E5D01178;
    SEL v22 = a2;
    v20[4] = self;
    SEL v21 = v12;
    [v16 ingestSnapshotCollection:v9 forPosterConfigurationUUID:v15 completion:v20];
  }
  else if (v12)
  {
    ((void (**)(void, id))v12)[2](v12, v17);
  }
}

void __73__PRSService_ingestSnapshotCollection_forPosterConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchContentObstructionBoundsForActivePosterWithOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PRSService.m", 667, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PRSService_fetchContentObstructionBoundsForActivePosterWithOrientation_completionHandler___block_invoke;
  v10[3] = &unk_1E5D01308;
  int64_t v12 = a3;
  SEL v13 = a2;
  v10[4] = self;
  id v11 = v7;
  id v8 = v7;
  [(PRSService *)self fetchActivePosterConfiguration:v10];
}

void __92__PRSService_fetchContentObstructionBoundsForActivePosterWithOrientation_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    id v8 = (void *)a1[4];
    id v17 = 0;
    id v9 = [v8 _serviceInterfaceWithError:&v17];
    id v7 = v17;
    if (v9)
    {
      id v10 = [v5 lockScreenPosterConfiguration];
      id v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:a1[6]];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __92__PRSService_fetchContentObstructionBoundsForActivePosterWithOrientation_completionHandler___block_invoke_2;
      v14[3] = &unk_1E5D012E0;
      uint64_t v12 = a1[4];
      SEL v13 = (void *)a1[5];
      uint64_t v16 = a1[7];
      void v14[4] = v12;
      id v15 = v13;
      [v9 fetchContentObstructionBoundsForPosterConfiguration:v10 orientation:v11 completion:v14];
    }
    else
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
  }
}

void __92__PRSService_fetchContentObstructionBoundsForActivePosterWithOrientation_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchContentObstructionBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v17 = 0;
  id v11 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v12 = v17;
  if (v11)
  {
    SEL v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __96__PRSService_fetchContentObstructionBoundsForPosterConfiguration_orientation_completionHandler___block_invoke;
    v14[3] = &unk_1E5D012E0;
    SEL v16 = a2;
    void v14[4] = self;
    id v15 = v10;
    [v11 fetchContentObstructionBoundsForPosterConfiguration:v9 orientation:v13 completion:v14];
  }
  else if (v10)
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], v12);
  }
}

void __96__PRSService_fetchContentObstructionBoundsForPosterConfiguration_orientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchMaximalContentCutoutBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 701, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  id v8 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v9 = v15;
  if (v8)
  {
    id v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__PRSService_fetchMaximalContentCutoutBoundsForOrientation_completionHandler___block_invoke;
    v12[3] = &unk_1E5D01330;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v7;
    [v8 fetchMaximalContentCutoutBoundsForOrientation:v10 completion:v12];
  }
  else
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
  }
}

void __78__PRSService_fetchMaximalContentCutoutBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchContentCutoutBoundsForActivePosterWithOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PRSService.m", 715, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PRSService_fetchContentCutoutBoundsForActivePosterWithOrientation_completionHandler___block_invoke;
  v10[3] = &unk_1E5D01308;
  int64_t v12 = a3;
  SEL v13 = a2;
  v10[4] = self;
  id v11 = v7;
  id v8 = v7;
  [(PRSService *)self fetchActivePosterConfiguration:v10];
}

void __87__PRSService_fetchContentCutoutBoundsForActivePosterWithOrientation_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    id v8 = (void *)a1[4];
    id v17 = 0;
    id v9 = [v8 _serviceInterfaceWithError:&v17];
    id v7 = v17;
    if (v9)
    {
      id v10 = [v5 lockScreenPosterConfiguration];
      id v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:a1[6]];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __87__PRSService_fetchContentCutoutBoundsForActivePosterWithOrientation_completionHandler___block_invoke_2;
      v14[3] = &unk_1E5D01330;
      uint64_t v12 = a1[4];
      SEL v13 = (void *)a1[5];
      uint64_t v16 = a1[7];
      void v14[4] = v12;
      id v15 = v13;
      [v9 fetchContentCutoutBoundsForPosterConfiguration:v10 orientation:v11 completion:v14];
    }
    else
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
  }
}

void __87__PRSService_fetchContentCutoutBoundsForActivePosterWithOrientation_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchContentCutoutBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v17 = 0;
  id v11 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v12 = v17;
  if (v11)
  {
    SEL v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__PRSService_fetchContentCutoutBoundsForPosterConfiguration_orientation_completionHandler___block_invoke;
    v14[3] = &unk_1E5D01330;
    SEL v16 = a2;
    void v14[4] = self;
    id v15 = v10;
    [v11 fetchContentCutoutBoundsForPosterConfiguration:v9 orientation:v13 completion:v14];
  }
  else if (v10)
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v12);
  }
}

void __91__PRSService_fetchContentCutoutBoundsForPosterConfiguration_orientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchObscurableBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v17 = 0;
  id v11 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v12 = v17;
  if (v11)
  {
    SEL v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__PRSService_fetchObscurableBoundsForPosterConfiguration_orientation_completionHandler___block_invoke;
    v14[3] = &unk_1E5D01330;
    SEL v16 = a2;
    void v14[4] = self;
    id v15 = v10;
    [v11 fetchObscurableBoundsForPosterConfiguration:v9 orientation:v13 completion:v14];
  }
  else if (v10)
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v12);
  }
}

void __88__PRSService_fetchObscurableBoundsForPosterConfiguration_orientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchLimitedOcclusionBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v17 = 0;
  id v11 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v12 = v17;
  if (v11)
  {
    SEL v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __94__PRSService_fetchLimitedOcclusionBoundsForPosterConfiguration_orientation_completionHandler___block_invoke;
    v14[3] = &unk_1E5D01330;
    SEL v16 = a2;
    void v14[4] = self;
    id v15 = v10;
    [v11 fetchLimitedOcclusionBoundsForPosterConfiguration:v9 orientation:v13 completion:v14];
  }
  else if (v10)
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v12);
  }
}

void __94__PRSService_fetchLimitedOcclusionBoundsForPosterConfiguration_orientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchPosterConfigurationsForRole:(id)a3 completion:(id)a4
{
  id v7 = (__CFString *)a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 779, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if (!v7) {
    id v7 = @"PRPosterRoleLockScreen";
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__PRSService_fetchPosterConfigurationsForRole_completion___block_invoke;
    v12[3] = &unk_1E5D011F0;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 fetchPosterConfigurationsForRole:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v10);
  }
}

void __58__PRSService_fetchPosterConfigurationsForRole_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_33);

  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);
}

- (void)fetchSelectedPosterForRole:(id)a3 completion:(id)a4
{
  id v7 = (__CFString *)a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 798, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if (!v7) {
    id v7 = @"PRPosterRoleLockScreen";
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__PRSService_fetchSelectedPosterForRole_completion___block_invoke;
    v12[3] = &unk_1E5D00BA0;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 fetchSelectedPosterForRole:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v10);
  }
}

void __52__PRSService_fetchSelectedPosterForRole_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v5)
  {
    id v9 = [[PRSPosterConfiguration alloc] _initWithPath:v5];
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v6);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
  }
}

- (void)fetchActivePosterForRole:(id)a3 completion:(id)a4
{
  id v7 = (__CFString *)a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 817, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if (!v7) {
    id v7 = @"PRPosterRoleLockScreen";
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__PRSService_fetchActivePosterForRole_completion___block_invoke;
    v12[3] = &unk_1E5D01358;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 fetchActivePosterForRole:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v10);
  }
}

void __50__PRSService_fetchActivePosterForRole_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PRSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  if (v8)
  {
    id v11 = [PRSActivePosterConfiguration alloc];
    id v12 = [[PRSPosterConfiguration alloc] _initWithPath:v8];
    if (v7) {
      id v13 = [[PRSPosterConfiguration alloc] _initWithPath:v7];
    }
    else {
      id v13 = 0;
    }
    SEL v14 = [(PRSActivePosterConfiguration *)v11 initWithLockScreenPosterConfiguration:v12 homeScreenPosterConfiguration:v13];
    if (v7) {
  }
    }
  else
  {
    SEL v14 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)fetchActivePosterForRole:(id)a3 error:(id *)a4
{
  id v6 = (__CFString *)a3;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = @"PRPosterRoleLockScreen";
  }
  id v8 = [(PRSService *)self _serviceInterfaceWithError:a4];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 fetchActivePosterForRole:v7 error:a4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)updateSelectedForRoleIdentifier:(id)a3 newlySelectedConfiguration:(id)a4 completion:(id)a5
{
  id v9 = (__CFString *)a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PRSService.m", 851, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = [v10 serverUUID];
  if (!v12)
  {
    SEL v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PRSService.m", 854, @"Invalid parameter not satisfying: %@", @"posterUUID" object file lineNumber description];
  }
  if (!v9) {
    id v9 = @"PRPosterRoleLockScreen";
  }
  id v20 = 0;
  id v13 = [(PRSService *)self _serviceInterfaceWithError:&v20];
  id v14 = v20;
  if (v13)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__PRSService_updateSelectedForRoleIdentifier_newlySelectedConfiguration_completion___block_invoke;
    v17[3] = &unk_1E5D01178;
    SEL v19 = a2;
    v17[4] = self;
    id v18 = v11;
    [v13 updateToSelectedPosterMatchingUUID:v12 role:v9 completion:v17];
  }
  else if (v11)
  {
    (*((void (**)(id, id))v11 + 2))(v11, v14);
  }
}

void __84__PRSService_updateSelectedForRoleIdentifier_newlySelectedConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSelectedConfiguration:(id)a3
{
  if (a3) {
    [(PRSService *)self fetchSelectedPosterForRole:0 completion:a3];
  }
}

- (void)fetchActiveConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__PRSService_fetchActiveConfiguration___block_invoke;
    v6[3] = &unk_1E5D01380;
    id v7 = v4;
    [(PRSService *)self fetchActivePosterForRole:0 completion:v6];
  }
}

void __39__PRSService_fetchActiveConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 lockScreenPosterConfiguration];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)fetchActivePosterConfiguration:(id)a3
{
}

- (void)updateToSelectedConfiguration:(id)a3 completion:(id)a4
{
}

- (void)updateToSelectedConfiguration:(id)a3 role:(id)a4 completion:(id)a5
{
}

- (void)updateToSelectedConfigurationMatchingUUID:(id)a3 role:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = (__CFString *)a4;
  id v11 = a5;
  if (v11)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PRSService.m", 903, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PRSService.m", 904, @"Invalid parameter not satisfying: %@", @"posterUUID" object file lineNumber description];

LABEL_3:
  if (!v10) {
    id v10 = @"PRPosterRoleLockScreen";
  }
  id v19 = 0;
  id v12 = [(PRSService *)self _serviceInterfaceWithError:&v19];
  id v13 = v19;
  if (v12)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__PRSService_updateToSelectedConfigurationMatchingUUID_role_completion___block_invoke;
    v16[3] = &unk_1E5D01178;
    SEL v18 = a2;
    v16[4] = self;
    id v17 = v11;
    [v12 updateToSelectedPosterMatchingUUID:v9 role:v10 completion:v16];
  }
  else if (v11)
  {
    (*((void (**)(id, id))v11 + 2))(v11, v13);
  }
}

void __72__PRSService_updateToSelectedConfigurationMatchingUUID_role_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateToSelectedConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
}

- (void)fetchFocusUUIDForConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 _path];
  NSClassFromString(&cfstr_Pfserverposter.isa);
  if (!v9)
  {
    id v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSService fetchFocusUUIDForConfiguration:completion:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E290CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSService fetchFocusUUIDForConfiguration:completion:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78E2970);
  }

  if (!v8)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PRSService.m", 931, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v19 = 0;
  id v10 = [(PRSService *)self _serviceInterfaceWithError:&v19];
  id v11 = v19;
  if (v10)
  {
    id v12 = [v7 _path];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__PRSService_fetchFocusUUIDForConfiguration_completion___block_invoke;
    v16[3] = &unk_1E5D013A8;
    SEL v18 = a2;
    v16[4] = self;
    id v17 = v8;
    [v10 fetchFocusUUIDForConfiguration:v12 completion:v16];
  }
  else if (v8)
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v11);
  }
}

void __56__PRSService_fetchFocusUUIDForConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeAllFocusConfigurationsMatchingFocusUUID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 946, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__PRSService_removeAllFocusConfigurationsMatchingFocusUUID_completion___block_invoke;
    v12[3] = &unk_1E5D01178;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 removeAllFocusConfigurationsMatchingFocusUUID:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

void __71__PRSService_removeAllFocusConfigurationsMatchingFocusUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)pushToProactiveWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 964, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  id v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__PRSService_pushToProactiveWithCompletion___block_invoke;
    v9[3] = &unk_1E5D01178;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 pushToProactiveWithCompletion:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }
}

void __44__PRSService_pushToProactiveWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)pushPosterGalleryUpdate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRSService.m", 983, @"Invalid parameter not satisfying: %@", @"faceGalleryConfiguration" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PRSService.m", 984, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v17 = 0;
  id v10 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__PRSService_pushPosterGalleryUpdate_completion___block_invoke;
    v14[3] = &unk_1E5D01178;
    SEL v16 = a2;
    void v14[4] = self;
    id v15 = v9;
    [v10 pushPosterGalleryUpdate:v7 completion:v14];
  }
  else if (v9)
  {
    ((void (**)(void, id))v9)[2](v9, v11);
  }
}

void __49__PRSService_pushPosterGalleryUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchGallery:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 1003, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  id v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __27__PRSService_fetchGallery___block_invoke;
    v9[3] = &unk_1E5D013D0;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 fetchGallery:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, void, void, id))v5 + 2))(v5, 0, 0, v7);
  }
}

- (void)retrieveGallery:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 1025, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  id v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__PRSService_retrieveGallery___block_invoke;
    v9[3] = &unk_1E5D013D0;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 retrieveGallery:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, void, void, id))v5 + 2))(v5, 0, 0, v7);
  }
}

void __30__PRSService_retrieveGallery___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = PRSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)gatherDataFreshnessState:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 1045, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  id v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__PRSService_gatherDataFreshnessState___block_invoke;
    v9[3] = &unk_1E5D01218;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 gatherDataFreshnessState:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, void, id))v5 + 2))(v5, 0, v7);
  }
}

void __39__PRSService_gatherDataFreshnessState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a3 extensionIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    SEL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PRSService.m", 1059, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v18 = 0;
  id v12 = [(PRSService *)self _serviceInterfaceWithError:&v18];
  id v13 = v18;
  if (v12)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __104__PRSService_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke;
    v15[3] = &unk_1E5D01178;
    SEL v17 = a2;
    v15[4] = self;
    id v16 = v11;
    [v12 refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:v9 extensionIdentifier:v10 completion:v15];
  }
  else if (v11)
  {
    (*((void (**)(id, id))v11 + 2))(v11, v13);
  }
}

void __104__PRSService_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)notifyFocusModeDidChange:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 1074, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__PRSService_notifyFocusModeDidChange_completion___block_invoke;
    v12[3] = &unk_1E5D01178;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 notifyFocusModeDidChange:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

void __50__PRSService_notifyFocusModeDidChange_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)notifyAvailableFocusModesDidChange:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v14 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v14];
  id v10 = v14;
  if (v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PRSService_notifyAvailableFocusModesDidChange_completion___block_invoke;
    v11[3] = &unk_1E5D01178;
    SEL v13 = a2;
    v11[4] = self;
    id v12 = v8;
    [v9 notifyAvailableFocusModesDidChange:v7 completion:v11];
  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

void __60__PRSService_notifyAvailableFocusModesDidChange_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)notifyActiveChargerIdentifierDidUpdate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 1101, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__PRSService_notifyActiveChargerIdentifierDidUpdate_completion___block_invoke;
    v12[3] = &unk_1E5D01178;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 notifyActiveChargerIdentifierDidUpdate:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

void __64__PRSService_notifyActiveChargerIdentifierDidUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)prewarmWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 1115, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  id v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__PRSService_prewarmWithCompletion___block_invoke;
    v9[3] = &unk_1E5D01178;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 prewarmWithCompletion:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }
}

void __36__PRSService_prewarmWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)overnightUpdateWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 1129, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  id v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__PRSService_overnightUpdateWithCompletion___block_invoke;
    v9[3] = &unk_1E5D01178;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 overnightUpdateWithCompletion:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }
}

void __44__PRSService_overnightUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchAssociatedHomeScreenPosterConfigurationUUID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    SEL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 1143, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__PRSService_fetchAssociatedHomeScreenPosterConfigurationUUID_completion___block_invoke;
    v12[3] = &unk_1E5D00BA0;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 fetchAssociatedHomeScreenPosterConfigurationUUID:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v10);
  }
}

void __74__PRSService_fetchAssociatedHomeScreenPosterConfigurationUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v5)
    {
      id v9 = [[PRSPosterConfiguration alloc] _initWithPath:v5];
      (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v9, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, 0, 0);
    }
  }
}

- (void)runMigration:(BOOL)a3 completion:(id)a4
{
}

- (void)runMigration:(BOOL)a3 migrationDescriptor:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    SEL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PRSService.m", 1167, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v18 = 0;
  SEL v11 = [(PRSService *)self _serviceInterfaceWithError:&v18];
  id v12 = v18;
  if (v11)
  {
    id v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__PRSService_runMigration_migrationDescriptor_completion___block_invoke;
    v15[3] = &unk_1E5D01178;
    SEL v17 = a2;
    v15[4] = self;
    id v16 = v10;
    [v11 runMigration:v13 migrationDescriptor:v9 completion:v15];
  }
  else if (v10)
  {
    (*((void (**)(id, id))v10 + 2))(v10, v12);
  }
}

void __58__PRSService_runMigration_migrationDescriptor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)clearMigrationFlags:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 1181, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  BOOL v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __34__PRSService_clearMigrationFlags___block_invoke;
    v9[3] = &unk_1E5D013F8;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 clearMigrationFlags:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, void, id))v5 + 2))(v5, 0, v7);
  }
}

void __34__PRSService_clearMigrationFlags___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = [v6 BOOLValue];

  (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v9, v5);
}

- (void)createAndSelectLegacyPosterConfigurationIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke;
  v6[3] = &unk_1E5D01470;
  void v6[4] = self;
  id v7 = @"com.apple.PaperBoard.LegacyPoster";
  uint64_t v8 = @"LegacyPoster";
  id v9 = v4;
  id v5 = v4;
  [(PRSService *)self fetchPosterConfigurationsForExtension:@"com.apple.PaperBoard.LegacyPoster" completion:v6];
}

void __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    uint64_t v9 = [v5 count];
    id v10 = *(void **)(a1 + 32);
    if (v9)
    {
      SEL v11 = [v5 firstObject];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_170;
      v20[3] = &unk_1E5D00C60;
      id v21 = *(id *)(a1 + 56);
      [v10 _selectConfigurationAndRefreshSnapshot:v11 completion:v20];

      id v12 = v21;
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_2;
      v16[3] = &unk_1E5D01448;
      id v17 = v7;
      id v15 = *(id *)(a1 + 56);
      uint64_t v18 = *(void *)(a1 + 32);
      id v19 = v15;
      [v10 createPosterConfigurationForProviderIdentifier:v13 posterDescriptorIdentifier:v14 role:@"PRPosterRoleLockScreen" completion:v16];

      id v12 = v17;
    }
  }
  else
  {
    uint64_t v8 = PRSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_170(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = PRSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_2_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_172;
    v14[3] = &unk_1E5D01420;
    uint64_t v13 = *(void **)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    id v15 = v5;
    [v13 _selectConfigurationAndRefreshSnapshot:v15 completion:v14];
  }
}

uint64_t __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_172(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) != 0, a2, a3);
}

- (void)_selectConfigurationAndRefreshSnapshot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke;
    v10[3] = &unk_1E5D01498;
    id v12 = v7;
    v10[4] = self;
    id v11 = v6;
    [(PRSService *)self updateSelectedForRoleIdentifier:@"PRPosterRoleLockScreen" newlySelectedConfiguration:v11 completion:v10];
  }
  else
  {
    uint64_t v9 = PRSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PRSService _selectConfigurationAndRefreshSnapshot:completion:](v9);
    }

    v8[2](v8, 0, 0);
  }
}

void __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = PRSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_175;
    v7[3] = &unk_1E5D00B50;
    id v8 = *(id *)(a1 + 48);
    [v5 refreshSnapshotForPosterConfiguration:v6 completion:v7];
  }
}

void __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_175(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = PRSLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_175_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchArchivedDataStoreNamesWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PRSService.m", 1258, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = 0;
  uint64_t v6 = [(PRSService *)self _serviceInterfaceWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__PRSService_fetchArchivedDataStoreNamesWithCompletion___block_invoke;
    v9[3] = &unk_1E5D00B08;
    SEL v11 = a2;
    void v9[4] = self;
    id v10 = v5;
    [v6 fetchArchivedDataStoreNamesWithCompletion:v9];
  }
  else if (v5)
  {
    (*((void (**)(id, void, id))v5 + 2))(v5, 0, v7);
  }
}

void __56__PRSService_fetchArchivedDataStoreNamesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stashCurrentDataStoreWithName:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PRSService.m", 1272, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if (![v9 length])
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PRSService.m", 1273, @"Invalid parameter not satisfying: %@", @"[stashName length] > 0" object file lineNumber description];
  }
  id v19 = 0;
  id v12 = [(PRSService *)self _serviceInterfaceWithError:&v19];
  id v13 = v19;
  if (v12)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__PRSService_stashCurrentDataStoreWithName_options_completion___block_invoke;
    v16[3] = &unk_1E5D01178;
    SEL v18 = a2;
    void v16[4] = self;
    id v17 = v11;
    [v12 stashCurrentDataStoreWithName:v9 options:v10 completion:v16];
  }
  else if (v11)
  {
    (*((void (**)(id, id))v11 + 2))(v11, v13);
  }
}

void __63__PRSService_stashCurrentDataStoreWithName_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)restoreArchivedDataStoreNamed:(id)a3 backupExistingDataStore:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PRSService.m", 1287, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v18 = 0;
  id v11 = [(PRSService *)self _serviceInterfaceWithError:&v18];
  id v12 = v18;
  if (v11)
  {
    id v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__PRSService_restoreArchivedDataStoreNamed_backupExistingDataStore_completion___block_invoke;
    v15[3] = &unk_1E5D01178;
    SEL v17 = a2;
    v15[4] = self;
    id v16 = v10;
    [v11 restoreArchivedDataStoreNamed:v9 backupExistingDataStore:v13 completion:v15];
  }
  else if (v10)
  {
    (*((void (**)(id, id))v10 + 2))(v10, v12);
  }
}

void __79__PRSService_restoreArchivedDataStoreNamed_backupExistingDataStore_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteArchivedDataStoreNamed:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 1301, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PRSService_deleteArchivedDataStoreNamed_completion___block_invoke;
    v12[3] = &unk_1E5D01178;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 deleteArchivedDataStoreNamed:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }
}

void __54__PRSService_deleteArchivedDataStoreNamed_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)exportArchivedDataStoreNamed:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PRSService.m", 1315, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v15 = 0;
  id v9 = [(PRSService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PRSService_exportArchivedDataStoreNamed_completion___block_invoke;
    v12[3] = &unk_1E5D01290;
    SEL v14 = a2;
    v12[4] = self;
    id v13 = v8;
    [v9 exportArchivedDataStoreNamed:v7 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v10);
  }
}

void __54__PRSService_exportArchivedDataStoreNamed_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = PRSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)exportCurrentDataStoreToURL:(id)a3 options:(id)a4 sandboxToken:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v20 = 0;
  SEL v14 = [(PRSService *)self _serviceInterfaceWithError:&v20];
  id v15 = v20;
  if (v14)
  {
    id v19 = 0;
    [v14 exportCurrentDataStoreToURL:v11 options:v12 sandboxToken:v13 error:&v19];
    id v16 = v19;

    SEL v17 = PRSLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PRSService exportCurrentDataStoreToURL:options:sandboxToken:error:](a2);
    }

    id v15 = v16;
  }
  id v18 = v15;
  *a6 = v18;
}

- (void)ignoreExtension:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRSService.m", 1339, @"Invalid parameter not satisfying: %@", @"extension" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PRSService.m", 1340, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v17 = 0;
  id v10 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__PRSService_ignoreExtension_completion___block_invoke;
    v14[3] = &unk_1E5D01178;
    SEL v16 = a2;
    void v14[4] = self;
    id v15 = v9;
    [v10 ignoreExtension:v7 completion:v14];
  }
  else if (v9)
  {
    ((void (**)(void, id))v9)[2](v9, v11);
  }
}

void __41__PRSService_ignoreExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)unignoreExtension:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRSService.m", 1359, @"Invalid parameter not satisfying: %@", @"extension" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PRSService.m", 1360, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v17 = 0;
  id v10 = [(PRSService *)self _serviceInterfaceWithError:&v17];
  id v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __43__PRSService_unignoreExtension_completion___block_invoke;
    v14[3] = &unk_1E5D01178;
    SEL v16 = a2;
    void v14[4] = self;
    id v15 = v9;
    [v10 unignoreExtension:v7 completion:v14];
  }
  else if (v9)
  {
    ((void (**)(void, id))v9)[2](v9, v11);
  }
}

void __43__PRSService_unignoreExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_serviceInterfaceWithError:(id *)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  p_serviceConnection = &self->_serviceConnection;
  [(BSServiceConnectionClient *)self->_serviceConnection activate];
  id v5 = *p_serviceConnection;
  id v6 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v14[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v8 = [(BSServiceConnectionClient *)v5 remoteTargetWithLaunchingAssertionAttributes:v7];

  if (!v8)
  {
    id v9 = PRSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PRSService _serviceInterfaceWithError:]();
    }

    if (a3)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *a3 = [v10 errorWithDomain:v12 code:1 userInfo:0];
    }
  }
  return v8;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A78AC000, v1, OS_LOG_TYPE_ERROR, "%{public}@:%p failed to lookup endpoint", v2, 0x16u);
}

void __18__PRSService_init__block_invoke_38_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  OUTLINED_FUNCTION_1(&dword_1A78AC000, v1, v2, "<%{public}@:%p remotely invalidated", v3, v4, v5, v6, 2u);
}

void __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_4_1(v1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_4(&dword_1A78AC000, v3, v4, "received reply to %{public}@ on %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePosterConfigurationMatchingUUID:updates:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePosterConfigurationMatchingUUID:updates:completion:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePosterConfiguration:update:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePosterConfiguration:update:completion:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePosterConfiguration:update:completion:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)fetchFocusUUIDForConfiguration:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2(&dword_1A78AC000, v0, v1, "Failed to fetch poster configuration with error: %{public}@", v2, v3, v4, v5, v6);
}

void __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_selectConfigurationAndRefreshSnapshot:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A78AC000, log, OS_LOG_TYPE_ERROR, "No configuration is provided, returning...", v1, 2u);
}

void __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2(&dword_1A78AC000, v0, v1, "Failed to update to selected configuration with error: %{public}@", v2, v3, v4, v5, v6);
}

void __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_175_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2(&dword_1A78AC000, v0, v1, "Failed to refresh snapshot for poster configuration with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)exportCurrentDataStoreToURL:(const char *)a1 options:sandboxToken:error:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_1A78AC000, v2, v3, "received reply to %{public}@ on %{public}@", v4, v5, v6, v7, v8);
}

- (void)_serviceInterfaceWithError:.cold.1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1A78AC000, v2, v3, "%{public}@ failed to create proxy for connection: %{public}@", v4, v5, v6, v7, v8);
}

@end