@interface PBFPosterExtensionDataStoreXPCServiceGlue
+ (BOOL)_checkIfLanguageChangeOccurred:(id)a3;
+ (BOOL)_clearMigrationFlagsWithError:(id *)a3;
+ (PBFPosterExtensionDataStoreXPCServiceGlue)sharedInstance;
- (BOOL)_hasComplicationsForPosterConfiguration:(id)a3;
- (BOOL)_hasValidConfigurationForPoster:(id)a3;
- (BOOL)_lock_performNecessaryMigrationsForDataStoreAtURL:(id)a3 shouldForce:(BOOL)a4 error:(id *)a5;
- (BOOL)_lock_reapSnapshots:(BOOL)a3;
- (BOOL)_migrationIsPending;
- (BOOL)_mutateDataStoreState:(unint64_t)a3 error:(id *)a4;
- (CGRect)_cutoutBoundsForObstructionBounds:(CGRect)a3 orientation:(int64_t)a4;
- (CGRect)_normalizedBounds:(CGRect)a3 forScreenBounds:(CGRect)a4;
- (CGRect)_normalizedBounds:(CGRect)a3 orientation:(int64_t)a4;
- (CGRect)_prominentObstructionForConfiguration:(id)a3 orientation:(int64_t)a4;
- (CGRect)_prominentObstructionForOrientation:(int64_t)a3 showingComplications:(BOOL)a4;
- (CGRect)_screenBoundsForOrientation:(int64_t)a3;
- (PBFApplicationStateMonitor)applicationStateMonitor;
- (PBFPosterExtensionDataStore)dataStore;
- (PBFPosterExtensionDataStoreXPCServiceGlue)initWithOptions:(unint64_t)a3;
- (PBFRuntimeAssertionManager)runtimeAssertionManager;
- (PRSServer)server;
- (id)_baseDataStoreURL;
- (id)_baseDataStoreURL:(BOOL)a3;
- (id)_dataStoreWithError:(id *)a3;
- (id)_lock_dataStoreWithError:(id *)a3;
- (id)acquireEditingSessionAssertionForProvider:(id)a3 withReason:(id)a4;
- (id)acquireSnapshotterDisabledAssertionForProvider:(id)a3 withReason:(id)a4;
- (id)acquireSnapshotterInUseAssertionWithReason:(id)a3;
- (id)activeEditingSessionAssertionExtensionIdentifiers;
- (id)activeSnapshotterInUseAssertionReasons;
- (id)buildDataStoreForURL:(id)a3 runtimeAssertionProvider:(id)a4 applicationStateMonitor:(id)a5 observer:(id)a6 wasMigrationJustPerformed:(BOOL)a7 error:(id *)a8;
- (id)server:(id)a3 fetchActivePosterForRole:(id)a4 error:(id *)a5;
- (unint64_t)activeSnapshotterInUseAssertionCount;
- (void)_handleLaunchServicesUpdates:(id)a3 completion:(id)a4;
- (void)_localeDidChange:(id)a3;
- (void)_lock_fixFileProtections;
- (void)_lock_reapDescriptors;
- (void)_lock_reapEntirePosterBoardDataStore;
- (void)_lock_reapExtensionProviderInfo;
- (void)_lock_reapGallery;
- (void)_lock_reapTemporaryDirectory;
- (void)_lock_reapTransientData:(BOOL)a3;
- (void)_lock_runLegacyMigration;
- (void)_lock_teardownDataStoreWithError:(id *)a3;
- (void)_migration_updateStashedIdentifiers;
- (void)_performPublisherChangeForDataStore:(id)a3 block:(id)a4;
- (void)_postDidTearDownNotification;
- (void)_resetRole:(id)a3 completion:(id)a4;
- (void)_stashCurrentDataStoreWithName:(id)a3 url:(id)a4 options:(id)a5 withError:(id *)a6;
- (void)addBehaviorAssertionObserver:(id)a3;
- (void)posterExtensionDataStore:(id)a3 activePostersWereUpdatedForRoles:(id)a4;
- (void)posterExtensionDataStore:(id)a3 didInitializeActivePosters:(id)a4 posterCollections:(id)a5;
- (void)posterExtensionDataStore:(id)a3 didInitializeWithSwitcherConfiguration:(id)a4 withChanges:(BOOL)a5;
- (void)posterExtensionDataStore:(id)a3 didUpdateActiveConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6;
- (void)posterExtensionDataStore:(id)a3 didUpdateConfiguration:(id)a4;
- (void)posterExtensionDataStore:(id)a3 didUpdateSelectedConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6;
- (void)posterExtensionDataStore:(id)a3 didUpdateSnapshotForPath:(id)a4 forDefinition:(id)a5;
- (void)posterExtensionDataStore:(id)a3 posterCollectionsWereUpdatedForRoles:(id)a4;
- (void)posterExtensionDataStore:(id)a3 posterConfiguration:(id)a4 didUpdateAssociatedHomeScreenPosterConfigurationTo:(id)a5;
- (void)removeBehaviorAssertionObserver:(id)a3;
- (void)server:(id)a3 associateConfigurationMatchingUUID:(id)a4 focusModeActivityUUID:(id)a5 completion:(id)a6;
- (void)server:(id)a3 clearMigrationFlags:(id)a4;
- (void)server:(id)a3 createPosterConfigurationForProviderIdentifier:(id)a4 posterDescriptorIdentifier:(id)a5 role:(id)a6 completion:(id)a7;
- (void)server:(id)a3 deleteArchivedDataStoreNamed:(id)a4 completion:(id)a5;
- (void)server:(id)a3 deleteDataStoreWithCompletion:(id)a4;
- (void)server:(id)a3 deleteHostConfigurationForRole:(id)a4 completion:(id)a5;
- (void)server:(id)a3 deletePosterConfigurationsMatchingUUID:(id)a4 completion:(id)a5;
- (void)server:(id)a3 deletePosterDescriptorsForExtension:(id)a4 completion:(id)a5;
- (void)server:(id)a3 deleteSnapshots:(BOOL)a4 completion:(id)a5;
- (void)server:(id)a3 deleteTransientDataWithCompletion:(id)a4;
- (void)server:(id)a3 exportArchivedDataStoreNamed:(id)a4 completion:(id)a5;
- (void)server:(id)a3 exportCurrentDataStoreToURL:(id)a4 options:(id)a5 sandboxToken:(id)a6 error:(id *)a7;
- (void)server:(id)a3 exportPosterConfigurationMatchingUUID:(id)a4 completion:(id)a5;
- (void)server:(id)a3 fetchActivePosterForRole:(id)a4 completion:(id)a5;
- (void)server:(id)a3 fetchArchivedDataStoreNamesWithCompletion:(id)a4;
- (void)server:(id)a3 fetchAssociatedHomeScreenPosterConfigurationUUID:(id)a4 completion:(id)a5;
- (void)server:(id)a3 fetchChargerIdentifierRelationshipsWithCompletion:(id)a4;
- (void)server:(id)a3 fetchContentCutoutBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6;
- (void)server:(id)a3 fetchContentObstructionBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6;
- (void)server:(id)a3 fetchExtensionIdentifiersWithCompletion:(id)a4;
- (void)server:(id)a3 fetchFocusUUIDForConfiguration:(id)a4 completion:(id)a5;
- (void)server:(id)a3 fetchGallery:(id)a4;
- (void)server:(id)a3 fetchLimitedOcclusionBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6;
- (void)server:(id)a3 fetchMaximalContentCutoutBoundsForOrientation:(int64_t)a4 completion:(id)a5;
- (void)server:(id)a3 fetchObscurableBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6;
- (void)server:(id)a3 fetchPosterConfigurationsForExtension:(id)a4 completion:(id)a5;
- (void)server:(id)a3 fetchPosterConfigurationsForRole:(id)a4 completion:(id)a5;
- (void)server:(id)a3 fetchPosterDescriptorsForExtension:(id)a4 completion:(id)a5;
- (void)server:(id)a3 fetchPosterSnapshotsWithRequest:(id)a4 completion:(id)a5;
- (void)server:(id)a3 fetchRuntimeAssertionState:(id)a4;
- (void)server:(id)a3 fetchSelectedPosterForRole:(id)a4 completion:(id)a5;
- (void)server:(id)a3 fetchStaticPosterDescriptorsForExtension:(id)a4 completion:(id)a5;
- (void)server:(id)a3 gatherDataFreshnessState:(id)a4;
- (void)server:(id)a3 ignoreExtension:(id)a4 completion:(id)a5;
- (void)server:(id)a3 importPosterConfigurationFromArchiveData:(id)a4 completion:(id)a5;
- (void)server:(id)a3 ingestSnapshotCollection:(id)a4 forPosterConfigurationUUID:(id)a5 completion:(id)a6;
- (void)server:(id)a3 invalidateDataStoreWithCompletion:(id)a4;
- (void)server:(id)a3 notePosterConfigurationUnderlyingModelDidChange:(id)a4;
- (void)server:(id)a3 notifyActiveChargerIdentifierDidUpdate:(id)a4 completion:(id)a5;
- (void)server:(id)a3 notifyAvailableFocusModesDidChange:(id)a4 completion:(id)a5;
- (void)server:(id)a3 notifyFocusModeDidChange:(id)a4 completion:(id)a5;
- (void)server:(id)a3 notifyPosterBoardOfApplicationUpdatesWithCompletion:(id)a4;
- (void)server:(id)a3 overnightUpdateWithCompletion:(id)a4;
- (void)server:(id)a3 prewarmWithCompletion:(id)a4;
- (void)server:(id)a3 pushPosterGalleryUpdate:(id)a4 completion:(id)a5;
- (void)server:(id)a3 pushToProactiveWithCompletion:(id)a4;
- (void)server:(id)a3 refreshPosterConfigurationMatchingUUID:(id)a4 sessionInfo:(id)a5 completion:(id)a6;
- (void)server:(id)a3 refreshPosterDescriptorsForExtension:(id)a4 sessionInfo:(id)a5 completion:(id)a6;
- (void)server:(id)a3 refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a4 extensionIdentifier:(id)a5 completion:(id)a6;
- (void)server:(id)a3 refreshSnapshotForPosterConfigurationMatchUUID:(id)a4 completion:(id)a5;
- (void)server:(id)a3 removeAllFocusConfigurationsMatchingFocusUUID:(id)a4 completion:(id)a5;
- (void)server:(id)a3 resetRole:(id)a4 completion:(id)a5;
- (void)server:(id)a3 restoreArchivedDataStoreNamed:(id)a4 backupExistingDataStore:(BOOL)a5 completion:(id)a6;
- (void)server:(id)a3 retrieveGallery:(id)a4;
- (void)server:(id)a3 runMigration:(BOOL)a4 migrationDescriptor:(id)a5 completion:(id)a6;
- (void)server:(id)a3 setHostConfiguration:(id)a4 forRole:(id)a5 completion:(id)a6;
- (void)server:(id)a3 stashCurrentDataStoreWithName:(id)a4 options:(id)a5 completion:(id)a6;
- (void)server:(id)a3 triggerMessedUpDataProtectionWithCompletion:(id)a4;
- (void)server:(id)a3 unignoreExtension:(id)a4 completion:(id)a5;
- (void)server:(id)a3 updatePosterConfiguration:(id)a4 updates:(id)a5 completion:(id)a6;
- (void)server:(id)a3 updatePosterConfigurationMatchingUUID:(id)a4 updates:(id)a5 completion:(id)a6;
- (void)server:(id)a3 updateToSelectedConfigurationMatchingUUID:(id)a4 role:(id)a5 from:(id)a6 completion:(id)a7;
- (void)wallpaperPublisherDidReceiveObserverConnection;
@end

@implementation PBFPosterExtensionDataStoreXPCServiceGlue

+ (PBFPosterExtensionDataStoreXPCServiceGlue)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)sharedInstance_glue;
  return (PBFPosterExtensionDataStoreXPCServiceGlue *)v2;
}

void __59__PBFPosterExtensionDataStoreXPCServiceGlue_sharedInstance__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleURL];
  v2 = [v1 lastPathComponent];
  v3 = [v2 stringByDeletingPathExtension];
  int v4 = [v3 isEqualToString:@"PosterBoard"];

  v5 = [[PBFPosterExtensionDataStoreXPCServiceGlue alloc] initWithOptions:v4 ^ 1u];
  v6 = (void *)sharedInstance_glue;
  sharedInstance_glue = (uint64_t)v5;
}

- (PBFPosterExtensionDataStore)dataStore
{
  return (PBFPosterExtensionDataStore *)[(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:0];
}

- (PBFPosterExtensionDataStoreXPCServiceGlue)initWithOptions:(unint64_t)a3
{
  v30.receiver = self;
  v30.super_class = (Class)PBFPosterExtensionDataStoreXPCServiceGlue;
  v5 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)&v30 init];
  v6 = v5;
  if (v5)
  {
    *(void *)&v5->_lock._os_unfair_lock_opaque = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke;
    block[3] = &unk_1E6984998;
    SEL v29 = a2;
    v7 = v5;
    v28 = v7;
    if (initWithOptions__onceToken != -1) {
      dispatch_once(&initWithOptions__onceToken, block);
    }
    if (a3 != 1)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F92378]);
      id v9 = v7[7];
      v7[7] = v8;

      [v7[7] setDelegate:v7];
      [v7[7] activate];
      uint64_t v10 = objc_opt_new();
      id v11 = v7[5];
      v7[5] = (id)v10;

      [v7[5] setDelegate:v7];
      id v12 = (id)[MEMORY[0x1E4F50BF0] activateManualDomain:@"com.apple.posterboardservices"];
    }
    id v13 = objc_alloc(MEMORY[0x1E4F5E4D0]);
    v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    uint64_t v15 = [v13 initWithTraitEnvironment:v14];
    id v16 = v7[4];
    v7[4] = (id)v15;

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v7 selector:sel__localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

    objc_initWeak(&location, v7);
    id v18 = MEMORY[0x1E4F14428];
    v19 = NSString;
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    v22 = [v19 stringWithFormat:@"%@ - BaseDataStoreURL", v21];
    objc_copyWeak(&v25, &location);
    id v23 = (id)BSLogAddStateCaptureBlockWithTitle();

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F924D8] sharedWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke_2;
  block[3] = &unk_1E6984998;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_async(v2, block);
}

void __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke_2(uint64_t a1)
{
  if (MEMORY[0x1D9433950]("-[PBFPosterExtensionDataStoreXPCServiceGlue initWithOptions:]_block_invoke_2"))
  {
    v2 = [MEMORY[0x1E4F4F7D0] sharedInstance];
    unsigned int v3 = [v2 deviceClass];

    if (v3 <= 2)
    {
      long long v4 = (void *)MEMORY[0x1E4F28B50];
      v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/ExtensionKit/Extensions/LegacyPoster.appex"];
      long long v6 = [v4 bundleWithURL:v5];

      if (!v6)
      {
        v7 = [NSString stringWithFormat:@"LegacyPoster doesn't exist; please file a radar!"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke_2_cold_1(a1, (uint64_t)v7);
        }
      }
    }
  }
}

id __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke_39(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _baseDataStoreURL];
  unsigned int v3 = [v2 absoluteString];

  return v3;
}

- (PBFRuntimeAssertionManager)runtimeAssertionManager
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v4 = self->_lock_runtimeAssertionManager;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (PBFApplicationStateMonitor)applicationStateMonitor
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v4 = self->_lock_applicationStateMonitor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_dataStoreWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_dataStoreWithError:a3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_dataStoreWithError:(id *)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  if (!self->_lock_runtimeAssertionManager)
  {
    v5 = objc_alloc_init(PBFRuntimeAssertionManager);
    lock_runtimeAssertionManager = self->_lock_runtimeAssertionManager;
    self->_lock_runtimeAssertionManager = v5;
  }
  if (!self->_lock_applicationStateMonitor)
  {
    v7 = (PBFApplicationStateMonitor *)objc_opt_new();
    lock_applicationStateMonitor = self->_lock_applicationStateMonitor;
    self->_lock_applicationStateMonitor = v7;
  }
  lock_dataStore = self->_lock_dataStore;
  if (lock_dataStore) {
    goto LABEL_6;
  }
  id v11 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
  id v12 = (void *)MEMORY[0x1E4F96318];
  id v13 = [MEMORY[0x1E4F96478] currentProcess];
  v14 = objc_msgSend(v12, "pf_prewarmRuntimeAssertionForReason:target:invalidationHandler:", @"bootstrapDataStoreAssertion", v13, &__block_literal_global_50);

  id v32 = 0;
  [v14 acquireWithError:&v32];
  id v15 = v32;
  id v16 = PBFLogCommon();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_dataStoreWithError:]();
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "Bootstrap RBSAssertion acquired", buf, 2u);
  }

  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapTransientData:0];
  id v30 = 0;
  BOOL v18 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_performNecessaryMigrationsForDataStoreAtURL:v11 shouldForce:0 error:&v30];
  id v19 = v30;
  v20 = v19;
  if (v19)
  {
    if (a3) {
      *a3 = v19;
    }
    [v14 invalidate];
  }
  else
  {
    v21 = self->_lock_runtimeAssertionManager;
    v22 = self->_lock_applicationStateMonitor;
    id v29 = 0;
    id v23 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self buildDataStoreForURL:v11 runtimeAssertionProvider:v21 applicationStateMonitor:v22 observer:self wasMigrationJustPerformed:v18 error:&v29];
    uint64_t v24 = (uint64_t)v29;
    id v25 = self->_lock_dataStore;
    self->_lock_dataStore = v23;

    if (!((uint64_t)self->_lock_dataStore | v24))
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28588];
      v34[0] = @"Data store could not be created for an unknown reason which evades explanation.";
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      uint64_t v24 = objc_msgSend(v26, "pbf_generalErrorWithCode:userInfo:", 0, v27);
    }
    if (v24)
    {
      if (a3) {
        *a3 = (id) v24;
      }
      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_teardownDataStoreWithError:0];
    }
    [v14 invalidate];
  }
  if (!v20)
  {
    lock_dataStore = self->_lock_dataStore;
LABEL_6:
    uint64_t v10 = lock_dataStore;
    goto LABEL_25;
  }
  uint64_t v10 = 0;
LABEL_25:
  return v10;
}

void __70__PBFPosterExtensionDataStoreXPCServiceGlue__lock_dataStoreWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned int v3 = PBFLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __70__PBFPosterExtensionDataStoreXPCServiceGlue__lock_dataStoreWithError___block_invoke_cold_1();
  }
}

- (id)buildDataStoreForURL:(id)a3 runtimeAssertionProvider:(id)a4 applicationStateMonitor:(id)a5 observer:(id)a6 wasMigrationJustPerformed:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[PBFPosterExtensionDataStore alloc] initWithURL:v16 runtimeAssertionProvider:v15 extensionProvider:0 observer:v13 wasMigrationJustPerformed:v9 applicationStateMonitor:v14 error:a8];

  return v17;
}

- (BOOL)_mutateDataStoreState:(unint64_t)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ((a3 & 0x3F) != 0)
  {
    char v5 = a3;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v8 = PBFLogReaper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_INFO, "Tearing down data store", buf, 2u);
    }

    id v30 = 0;
    [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_teardownDataStoreWithError:&v30];
    id v9 = v30;
    uint64_t v10 = v9;
    BOOL v11 = v9 == 0;
    if ((v5 & 2) == 0 || v9)
    {
      if (v9)
      {
        os_unfair_lock_unlock(p_lock);
        [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _postDidTearDownNotification];
        if (a4) {
          *a4 = v10;
        }
        goto LABEL_34;
      }
    }
    else
    {
      id v12 = PBFLogReaper();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_INFO, "Reaping snapshots", buf, 2u);
      }

      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapSnapshots:1];
    }
    if ((v5 & 0xC) != 0)
    {
      unint64_t v13 = v5 & 8;
      id v14 = PBFLogReaper();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v33 = v13 >> 3;
        _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_INFO, "Reaping transient data (all? %{BOOL}u", buf, 8u);
      }

      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapTransientData:v13 != 0];
    }
    if ((v5 & 0x10) != 0)
    {
      id v15 = PBFLogReaper();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_INFO, "Reaping data store", buf, 2u);
      }

      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapEntirePosterBoardDataStore];
    }
    if ((v5 & 0x20) != 0
      && MEMORY[0x1D9433950]("-[PBFPosterExtensionDataStoreXPCServiceGlue _mutateDataStoreState:error:]"))
    {
      id v16 = PBFLogReaper();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_INFO, "Messing up data protections", buf, 2u);
      }

      v17 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      BOOL v18 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", 0);
      id v19 = [v18 enumeratorAtURL:v17 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:0 errorHandler:0];

      uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v27;
        uint64_t v23 = *MEMORY[0x1E4F1C570];
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v27 != v22) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "pbf_setFileProtection:error:", v23, 0);
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v21);
      }

      objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_setNeedsFileProtectionsReset:", 1);
    }
    os_unfair_lock_unlock(p_lock);
    [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _postDidTearDownNotification];
LABEL_34:

    return v11;
  }
  return 0;
}

- (void)_postDidTearDownNotification
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:PBFPosterExtensionDataStoreDidTearDownNotification object:0 userInfo:0];
}

- (void)_lock_teardownDataStoreWithError:(id *)a3
{
  v16[14] = *MEMORY[0x1E4F143B8];
  if (a3) {
    char v5 = objc_opt_new();
  }
  else {
    char v5 = 0;
  }
  lock_dataStore = self->_lock_dataStore;
  if (lock_dataStore)
  {
    [(PBFPosterExtensionDataStore *)lock_dataStore removeObserver:self];
    [(PBFPosterExtensionDataStore *)self->_lock_dataStore invalidate];
  }
  v7 = self->_lock_dataStore;
  self->_lock_dataStore = 0;

  lock_runtimeAssertionManager = self->_lock_runtimeAssertionManager;
  if (lock_runtimeAssertionManager) {
    [(PBFRuntimeAssertionManager *)lock_runtimeAssertionManager invalidate];
  }
  id v9 = self->_lock_runtimeAssertionManager;
  self->_lock_runtimeAssertionManager = 0;

  lock_applicationStateMonitor = self->_lock_applicationStateMonitor;
  if (lock_applicationStateMonitor) {
    [(PBFApplicationStateMonitor *)lock_applicationStateMonitor invalidate];
  }
  BOOL v11 = self->_lock_applicationStateMonitor;
  self->_lock_applicationStateMonitor = 0;

  if (a3 && [v5 count])
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28750];
    v15[0] = *MEMORY[0x1E4F28588];
    v15[1] = v13;
    v16[0] = @"_lock_teardownDataStoreWithError failed";
    v16[1] = v5;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    objc_msgSend(v12, "pbf_generalErrorWithCode:userInfo:", 8, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_baseDataStoreURL
{
  uint64_t v3 = [MEMORY[0x1E4F922A8] shouldUseSharedDataStore];
  return [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL:v3];
}

- (id)_baseDataStoreURL:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = [MEMORY[0x1E4F922A8] sharedInstance];
    id v4 = [v3 sharedResourcesDirectoryURL];

    if (v4)
    {
      char v5 = PBFLogDataStore();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        long long v6 = [v4 absoluteString];
        *(_DWORD *)buf = 138412290;
        long long v28 = v6;
        _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "Opting to place data store at shared resources directory (system container): %@", buf, 0xCu);
      }
      id v4 = v4;
      id v7 = 0;
      id v8 = v4;
    }
    else
    {
      id v7 = 0;
      id v8 = 0;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = 0;
    id v8 = [v4 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:1 error:&v22];
    id v7 = v22;
  }

  if (!v8)
  {
    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3B8];
    v25[0] = @"dataStoreURL";
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CB10]);
    v25[1] = *MEMORY[0x1E4F28A50];
    v26[0] = v14;
    v26[1] = v7;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    id v16 = [v12 exceptionWithName:v13 reason:@"Unable to setup dataStore URL" userInfo:v15];

    goto LABEL_15;
  }
  id v21 = 0;
  char v9 = [v8 checkResourceIsReachableAndReturnError:&v21];
  id v10 = v21;
  if ((v9 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    uint64_t v19 = *MEMORY[0x1E4F28A50];
    v23[0] = @"dataStoreURL";
    v23[1] = v19;
    v24[0] = v8;
    v24[1] = v10;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    id v16 = [v17 exceptionWithName:v18 reason:@"Unable to reach dataStore URL" userInfo:v20];

LABEL_15:
    objc_exception_throw(v16);
  }

  return v8;
}

- (id)acquireSnapshotterInUseAssertionWithReason:(id)a3
{
  id v4 = a3;
  char v5 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self dataStore];
  long long v6 = [v5 acquireSnapshotterInUseAssertionWithReason:v4];

  return v6;
}

- (id)activeSnapshotterInUseAssertionReasons
{
  id v2 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self dataStore];
  uint64_t v3 = [v2 activeSnapshotterInUseAssertionReasons];

  return v3;
}

- (unint64_t)activeSnapshotterInUseAssertionCount
{
  id v2 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self dataStore];
  unint64_t v3 = [v2 activeSnapshotterInUseAssertionCount];

  return v3;
}

- (id)acquireSnapshotterDisabledAssertionForProvider:(id)a3 withReason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self dataStore];
  char v9 = [v8 acquireSnapshotterDisabledAssertionForProvider:v7 withReason:v6];

  return v9;
}

- (id)acquireEditingSessionAssertionForProvider:(id)a3 withReason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self dataStore];
  char v9 = [v8 acquireEditingSessionAssertionForProvider:v7 withReason:v6];

  return v9;
}

- (id)activeEditingSessionAssertionExtensionIdentifiers
{
  id v2 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self dataStore];
  unint64_t v3 = [v2 activeEditingSessionAssertionExtensionIdentifiers];

  return v3;
}

- (void)addBehaviorAssertionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self dataStore];
  [v5 addBehaviorAssertionObserver:v4];
}

- (void)removeBehaviorAssertionObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self dataStore];
  [v5 removeBehaviorAssertionObserver:v4];
}

- (void)server:(id)a3 deleteTransientDataWithCompletion:(id)a4
{
  uint64_t v6 = 0;
  id v5 = (void (**)(id, void))a4;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _mutateDataStoreState:9 error:&v6];
  v5[2](v5, v6);
}

- (void)server:(id)a3 deleteDataStoreWithCompletion:(id)a4
{
  uint64_t v6 = 0;
  id v5 = (void (**)(id, void))a4;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _mutateDataStoreState:25 error:&v6];
  v5[2](v5, v6);
}

- (void)server:(id)a3 triggerMessedUpDataProtectionWithCompletion:(id)a4
{
  uint64_t v6 = 0;
  id v5 = (void (**)(id, void))a4;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _mutateDataStoreState:33 error:&v6];
  v5[2](v5, v6);
}

- (void)server:(id)a3 fetchChargerIdentifierRelationshipsWithCompletion:(id)a4
{
  id v5 = (void (**)(id, void, id))a4;
  id v13 = 0;
  uint64_t v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v13];
  id v7 = v13;
  if (v7)
  {
    id v8 = v7;
    v5[2](v5, 0, v7);
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F92740];
    id v12 = 0;
    id v10 = [v6 posterCollectionForRole:v9 error:&v12];
    id v8 = v12;
    if (v8)
    {
      v5[2](v5, 0, v8);
    }
    else
    {
      BOOL v11 = [v10 chargerIdentifierRelationships];
      ((void (**)(id, void *, id))v5)[2](v5, v11, 0);
    }
  }
}

- (void)server:(id)a3 resetRole:(id)a4 completion:(id)a5
{
}

- (void)server:(id)a3 invalidateDataStoreWithCompletion:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  uint64_t v6 = 0;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _mutateDataStoreState:1 error:&v6];
  if (v5) {
    v5[2](v5, v6);
  }
}

- (void)server:(id)a3 deleteSnapshots:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = (void (**)(id, id))a5;
  id v16 = 0;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _mutateDataStoreState:3 error:&v16];
  id v8 = v16;
  if (v5)
  {
    id v15 = 0;
    uint64_t v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v15];
    id v10 = v15;
    BOOL v11 = [v9 currentGalleryConfiguration];

    if (v10)
    {
      id v12 = PBFLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStoreXPCServiceGlue server:deleteSnapshots:completion:]();
      }

      v7[2](v7, v10);
      goto LABEL_8;
    }
    if (v11)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __79__PBFPosterExtensionDataStoreXPCServiceGlue_server_deleteSnapshots_completion___block_invoke;
      v13[3] = &unk_1E69849C0;
      id v14 = v7;
      [v11 prewarmGallerySnapshotsWithCompletion:v13];

LABEL_8:
      goto LABEL_11;
    }
  }
  if (v7) {
    v7[2](v7, v8);
  }
LABEL_11:
}

void __79__PBFPosterExtensionDataStoreXPCServiceGlue_server_deleteSnapshots_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = PBFLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreXPCServiceGlue server:deleteSnapshots:completion:]();
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)server:(id)a3 notifyPosterBoardOfApplicationUpdatesWithCompletion:(id)a4
{
}

- (void)_handleLaunchServicesUpdates:(id)a3 completion:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *))a3;
  id v7 = (void (**)(id, id))a4;
  if ([(PBFPosterExtensionDataStoreXPCServiceGlue *)self _migrationIsPending])
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28588];
    v24[0] = @"Migration is pending; will not go through posterboard app update cycle";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    objc_msgSend(v8, "pbf_generalErrorWithCode:userInfo:", 7, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
  }
  else
  {
    lock_runtimeAssertionManager = self->_lock_runtimeAssertionManager;
    id v12 = [MEMORY[0x1E4F96478] currentProcess];
    uint64_t v9 = [(PBFRuntimeAssertionManager *)lock_runtimeAssertionManager acquirePosterUpdateRuntimeAssertionForReason:@"notifyPosterBoardOfApplicationUpdatesWithCompletion" target:v12];

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v20 = 0;
    id v14 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_dataStoreWithError:&v20];
    id v10 = v20;
    if (v14)
    {
      if (v6) {
        v6[2](v6, v14);
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __85__PBFPosterExtensionDataStoreXPCServiceGlue__handleLaunchServicesUpdates_completion___block_invoke;
      v17[3] = &unk_1E6982420;
      id v18 = v9;
      uint64_t v19 = v7;
      [v14 updateExtensionsAndNotifyWhenComplete:v17];
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      os_unfair_lock_unlock(p_lock);
      if (!v10)
      {
        id v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F28588];
        id v22 = @"Datastore could not be loaded and no error was returned";
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        objc_msgSend(v15, "pbf_generalErrorWithCode:userInfo:", 7, v16);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v7[2](v7, v10);
      [v9 invalidate];
    }
  }
}

uint64_t __85__PBFPosterExtensionDataStoreXPCServiceGlue__handleLaunchServicesUpdates_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_resetRole:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = PBFLogReaper();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_INFO, "Resetting role %{public}@", buf, 0xCu);
  }

  id v13 = 0;
  id v10 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_dataStoreWithError:&v13];
  id v11 = v13;
  if (!v11)
  {
    id v12 = 0;
    [v10 resetRole:v6 error:&v12];
    id v11 = v12;
  }
  os_unfair_lock_unlock(p_lock);
  if (v7) {
    v7[2](v7, v11);
  }
}

- (void)_lock_runLegacyMigration
{
  id v3 = +[PBFWallpaperKitBridge defaultBridge];
  int v4 = [v3 dataMigratorDeterminedLegacyWallpaperMigrationRequired];

  if (v4)
  {
    uint64_t v5 = PBFLogMigration();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "Data migrator requested posterboard data store be reset so that a legacy wallpaper migration can occur.", v9, 2u);
    }

    [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapEntirePosterBoardDataStore];
    [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapTransientData:1];
    id v6 = +[PBFWallpaperKitBridge defaultBridge];
    [v6 clearLegacyWallpaperMigrationKeys];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F83BE0]);
  [v7 performMigrationWithFailureHandler:&__block_literal_global_95];
  [v7 setWallpaperMode:2];
  [v7 performMigrationWithFailureHandler:&__block_literal_global_98];
  id v8 = [v7 dataStores];
  [v8 enumerateObjectsUsingBlock:&__block_literal_global_102];
}

void __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke()
{
  v0 = PBFLogMigration();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_cold_1();
  }
}

void __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_96()
{
  v0 = PBFLogMigration();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_96_cold_1();
  }
}

uint64_t __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_99(uint64_t a1, void *a2)
{
  return [a2 cleanup];
}

- (void)_lock_reapTransientData:(BOOL)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (self->_lock_dataStore)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Deleting the transient data underlying the data store while it is still very much in use will not end well."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapTransientData:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32C0078);
  }
  uint64_t v23 = objc_msgSend(NSString, "pbf_bootInstanceIdentifier");
  int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = PFTemporaryDirectory();
  id v7 = [v5 fileURLWithPath:v6 isDirectory:1];
  uint64_t v24 = v4;
  id v8 = [v4 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:5 error:0];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v27;
    *(void *)&long long v11 = 138543618;
    long long v22 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "lastPathComponent", v22);
        if ([v16 hasPrefix:@"TransientInfo"])
        {
          if (a3 || ([v16 containsString:v23] & 1) != 0)
          {
            v17 = PBFLogReaper();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              v31 = v15;
              _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_INFO, "Deleting transient info: %{public}@", buf, 0xCu);
            }

            id v25 = 0;
            char v18 = [v24 removeItemAtURL:v15 error:&v25];
            uint64_t v19 = v25;
            if ((v18 & 1) == 0)
            {
              id v20 = PBFLogReaper();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v22;
                v31 = v15;
                __int16 v32 = 2114;
                int v33 = v19;
                _os_log_error_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_ERROR, "Unable to delete transient info %{public}@: %{public}@", buf, 0x16u);
              }
            }
          }
          else
          {
            uint64_t v19 = PBFLogReaper();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v31 = v15;
              _os_log_debug_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_DEBUG, "Skipping deletion of transient info for '%{public}@'; is valid for current boot identifier.",
                buf,
                0xCu);
            }
          }
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v12);
  }
}

- (void)_lock_fixFileProtections
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v2, +[PBFPosterExtensionDataStore dataStoreVersion](PBFPosterExtensionDataStore, "dataStoreVersion"));
  int v4 = _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(v3, 0);
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_111_0];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = (void *)v2;
  id v6 = [v5 enumeratorAtURL:v2 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:0 errorHandler:0];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    uint64_t v10 = *MEMORY[0x1E4F1C598];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
        uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v14 = PFFileProtectionNoneAttributes();
        id v15 = [v12 path];
        id v22 = 0;
        [v13 setAttributes:v14 ofItemAtPath:v15 error:&v22];
        id v16 = v22;

        if (v16)
        {
          v17 = PBFLogReaper();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            long long v28 = v12;
            __int16 v29 = 2114;
            id v30 = v16;
            _os_log_error_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_ERROR, "Unable to fix file attributes for %{public}@: %{public}@", buf, 0x16u);
          }
        }
        id v21 = 0;
        objc_msgSend(v12, "pbf_setFileProtection:error:", v10, &v21);
        id v18 = v21;

        if (v18)
        {
          uint64_t v19 = PBFLogReaper();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            long long v28 = v12;
            __int16 v29 = 2114;
            id v30 = v18;
            _os_log_error_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_ERROR, "Unable to fix file protections for %{public}@: %{public}@", buf, 0x16u);
          }
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v8);
  }
}

void __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_fixFileProtections__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v2 = (id)[v4 setupEnvironmentIfNecessary];
  id v3 = (id)[v4 ensureFileSystemIntegrity];
  [v4 invalidate];
}

- (BOOL)_lock_reapSnapshots:(BOOL)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (self->_lock_dataStore)
  {
    __int16 v29 = [NSString stringWithFormat:@"Deleting data underlying the data store while it is still very much in use will not end well."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_reapSnapshots:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32C0918);
  }
  BOOL v3 = a3;
  id v4 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
  uint64_t v5 = +[PBFPosterExtensionDataStore dataStoreExtensionContainerURLForBaseURL:v4];
  int v33 = [MEMORY[0x1E4F28CB8] defaultManager];
  v31 = (void *)v5;
  id v6 = [v33 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:4 errorHandler:&__block_literal_global_117_0];
  uint64_t v7 = PBFLogReaper();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v3;
    _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to reap snapshots; will reap runtime snapshot? %{BOOL}u",
      buf,
      8u);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v30 = v4;
    char v32 = 0;
    uint64_t v11 = *(void *)v37;
    while (1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
        if (objc_msgSend(v13, "pbf_isPosterSnapshot", v30))
        {
          if (!v3)
          {
            id v14 = [v13 lastPathComponent];
            int v15 = [v14 containsString:@"RuntimeSnapshot-"];

            if (v15)
            {
              id v16 = PBFLogReaper();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v41 = v13;
                _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_INFO, "Skipping Reap of snapshot URL; runtime snapshots excluded %{public}@",
                  buf,
                  0xCu);
              }
              goto LABEL_30;
            }
          }
          long long v23 = PBFLogReaper();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v41 = v13;
            _os_log_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_INFO, "Reaping snapshot URL: %{public}@", buf, 0xCu);
          }

          id v35 = 0;
          char v24 = [v33 removeItemAtURL:v13 error:&v35];
          id v16 = v35;
          if ((v24 & 1) == 0)
          {
            id v22 = PBFLogReaper();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              goto LABEL_33;
            }
            goto LABEL_29;
          }
          goto LABEL_27;
        }
        id v16 = [v13 pathExtension];
        if (![v16 isEqualToString:@"plist"]) {
          goto LABEL_30;
        }
        v17 = [v13 lastPathComponent];
        int v18 = [v17 hasPrefix:@"RuntimeSnapshot"];

        if (v18) {
          BOOL v19 = !v3;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          id v20 = PBFLogReaper();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v41 = v13;
            _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_INFO, "Reaping snapshot metadata URL: %{public}@", buf, 0xCu);
          }

          id v34 = 0;
          char v21 = [v33 removeItemAtURL:v13 error:&v34];
          id v16 = v34;
          if ((v21 & 1) == 0)
          {
            id v22 = PBFLogReaper();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
LABEL_33:
              *(_DWORD *)buf = 138543618;
              v41 = v13;
              __int16 v42 = 2114;
              v43 = v16;
              _os_log_error_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_ERROR, "FAILED Reaping snapshot URL @ %{public}@: %{public}@", buf, 0x16u);
            }
LABEL_29:

LABEL_30:
            goto LABEL_31;
          }
LABEL_27:
          char v32 = 1;
          goto LABEL_30;
        }
LABEL_31:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v25 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
      uint64_t v10 = v25;
      if (!v25)
      {

        if (v32)
        {
          +[PBFPosterSnapshotReservation noteAllSnapshotsWereReaped];
          BOOL v26 = 1;
        }
        else
        {
          BOOL v26 = 0;
        }
        id v4 = v30;
        goto LABEL_40;
      }
    }
  }

  BOOL v26 = 0;
LABEL_40:
  long long v27 = PBFLogReaper();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v26;
    _os_log_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEFAULT, "Did reap snapshots? %{BOOL}u", buf, 8u);
  }

  return v26;
}

uint64_t __65__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapSnapshots___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = PBFLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapSnapshots___block_invoke_cold_1();
  }

  return 1;
}

- (void)_lock_reapDescriptors
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

uint64_t __66__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapDescriptors__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = PBFLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapDescriptors__block_invoke_cold_1();
  }

  return 1;
}

- (void)_lock_reapExtensionProviderInfo
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

uint64_t __76__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapExtensionProviderInfo__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = PBFLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapExtensionProviderInfo__block_invoke_cold_1();
  }

  return 1;
}

- (void)_lock_reapTemporaryDirectory
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_temporaryDirectoryURL");
  uint64_t v4 = [v2 enumeratorAtURL:v3 includingPropertiesForKeys:0 options:1 errorHandler:0];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v16;
    *(void *)&long long v6 = 138543618;
    long long v13 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        id v14 = 0;
        objc_msgSend(v2, "removeItemAtURL:error:", v10, &v14, v13);
        id v11 = v14;
        if (v11)
        {
          uint64_t v12 = PBFLogReaper();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            uint64_t v20 = v10;
            __int16 v21 = 2112;
            id v22 = v11;
            _os_log_error_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_ERROR, "Failed to reap item within temporary directory %{public}@: %@", buf, 0x16u);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v7);
  }
}

- (void)_lock_reapGallery
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_reapEntirePosterBoardDataStore
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (BOOL)_clearMigrationFlagsWithError:(id *)a3
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_setSnapshotsLocaleIdentifier:", 0);
  objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_clearStashedDeviceType");
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_snapshotsBuildVersion");
  if (v3) {
    objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_setSnapshotsBuildVersion:", 0);
  }

  return v3 != 0;
}

- (BOOL)_migrationIsPending
{
  id v3 = objc_opt_new();
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_snapshotsBuildVersion");
  uint64_t v5 = [MEMORY[0x1E4F4F6C8] fromString:v4];
  char v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_stashedDeviceTypeOutOfSync");
  char v7 = [v5 isSameAs:v3];
  uint64_t v8 = objc_opt_class();
  uint8_t v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
  unsigned __int8 v10 = [v8 _checkIfLanguageChangeOccurred:v9];

  if (objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_needsFileProtectionsReset")) {
    LOBYTE(v11) = 1;
  }
  else {
    int v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_hasHadFileProtectionsReset") ^ 1;
  }
  char v12 = v7 ^ 1;
  if (!v5) {
    char v12 = 1;
  }
  char v13 = v11 | v6;
  if ((v12 | v10)) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v13;
  }

  return v14;
}

- (BOOL)_lock_performNecessaryMigrationsForDataStoreAtURL:(id)a3 shouldForce:(BOOL)a4 error:(id *)a5
{
  BOOL v53 = a4;
  id v6 = a3;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v6)
  {
    int v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:]();
    }
LABEL_48:
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32C23D8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:]();
    }
    goto LABEL_48;
  }

  char v7 = objc_msgSend(MEMORY[0x1E4F96318], "pf_migrationRuntimeAssertionWithExplanation:", @"PosterBoard Migration Assertion");
  [v7 setInvalidationHandler:&__block_literal_global_154];
  v58[0] = 0;
  v49 = v7;
  [v7 acquireWithError:v58];
  id v8 = v58[0];
  uint8_t v9 = PBFLogMigration();
  unsigned __int8 v10 = v9;
  v51 = v6;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreXPCServiceGlue _lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:](v8, v10);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_INFO, "Migration RBSAssertion acquired", buf, 2u);
  }
  id v50 = v8;

  int v11 = objc_opt_new();
  uint64_t v54 = [v11 stringRepresentation];
  char v12 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_snapshotsBuildVersion");
  char v13 = [MEMORY[0x1E4F4F6C8] fromString:v12];
  BOOL v14 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__PBFPosterExtensionDataStoreXPCServiceGlue__lock_performNecessaryMigrationsForDataStoreAtURL_shouldForce_error___block_invoke_155;
  aBlock[3] = &unk_1E6984A48;
  id v47 = v14;
  id v56 = v47;
  long long v15 = _Block_copy(aBlock);
  v48 = v11;
  int v16 = [v13 isSameAs:v11];
  long long v17 = objc_opt_class();
  long long v18 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
  int v19 = [v17 _checkIfLanguageChangeOccurred:v18];

  if (objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_needsFileProtectionsReset")) {
    int v20 = 1;
  }
  else {
    int v20 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_hasHadFileProtectionsReset") ^ 1;
  }
  int v21 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_stashedDeviceTypeOutOfSync");
  int v22 = v53;
  if (!v13) {
    int v22 = 1;
  }
  int v23 = v22 | v16 ^ 1 | v19 | v20 | v21;
  uint64_t v24 = (void (*)(void *, __CFString *))v15[2];
  BOOL v46 = v23;
  if (v23 == 1)
  {
    int v25 = v21;
    int v44 = v19;
    v24(v15, @"Data store migration initiated");
    v43 = v12;
    ((void (*)(void *, __CFString *))v15[2])(v15, @"current build version %@ vs stashed build version %@.");
    BOOL v26 = objc_opt_new();
    __int16 v42 = objc_opt_new();
    long long v27 = objc_opt_new();
    v41 = objc_opt_new();
    uint64_t v45 = objc_opt_new();
    v52 = objc_opt_new();
    long long v28 = objc_opt_new();
    if (objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_keynoteModeEnabled"))
    {
      objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_setKeynoteModeEnabled:", 0);
      ((void (*)(void *, __CFString *))v15[2])(v15, @"We are deleting the keynote mode here and moving on.  This is your problem, not my bug. (current %@ vs stashed %@).");
    }
    if (v53)
    {
      [v26 addObject:@"migration forced"];
      [v45 addObject:@"migration forced"];
      [v52 addObject:@"migration forced"];
      [v27 addObject:@"migration forced"];
      [v28 addObject:@"migration forced"];
    }
    if ((v16 & 1) == 0)
    {
      [v45 addObject:@"build version changed"];
      [v52 addObject:@"build version changed"];
      [v28 addObject:@"build version changed"];
    }
    __int16 v29 = v26;
    if (v25)
    {
      [v26 addObject:@"device changed"];
      [v27 addObject:@"device changed"];
      [v52 addObject:@"device changed"];
    }
    char v12 = v43;
    if (v44)
    {
      [v29 addObject:@"language change"];
      [v42 addObject:@"language change"];
      [v27 addObject:@"language change"];
      [v41 addObject:@"language change"];
      [v28 addObject:@"language change"];
    }
    if (v20)
    {
      [v52 addObject:@"needsFileProtectionsMigration is true"];
      [v28 addObject:@"needsFileProtectionsMigration is true"];
    }
    if ([v52 count])
    {
      id v34 = [v52 componentsJoinedByString:@","];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Running fixing file protection state for reasons: %@");

      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_fixFileProtections];
      objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_setNeedsFileProtectionsReset:", 0);
      ((void (*)(void *, __CFString *))v15[2])(v15, @"post fixing file protection state");
    }
    if ([v45 count])
    {
      id v35 = [v45 componentsJoinedByString:@","];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Running legacy migration for reasons: %@");

      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_runLegacyMigration];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Post running legacy migration");
    }
    id v30 = v50;
    if ([v29 count])
    {
      long long v36 = [v29 componentsJoinedByString:@","];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Reaping snapshots for reasons: %@");

      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapSnapshots:v44 ^ 1u];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Reaped snapshot");
    }
    if ([v27 count])
    {
      long long v37 = [v27 componentsJoinedByString:@","];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Reaping gallery for reasons: %@");

      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapGallery];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Reaped gallery");
    }
    if ([v42 count])
    {
      long long v38 = [v42 componentsJoinedByString:@","];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Reaping descriptors for reasons: %@");

      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapDescriptors];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Reaped descriptors");
    }
    if ([v41 count])
    {
      long long v39 = [v41 componentsJoinedByString:@","];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Reaping extension provider info for reasons: %@");

      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapExtensionProviderInfo];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Reaped extension provider info");
    }
    [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapTransientData:1];
    if ([v28 count])
    {
      v40 = [v28 componentsJoinedByString:@","];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Reaping temp directory reasons: %@");

      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapTemporaryDirectory];
      ((void (*)(void *, __CFString *))v15[2])(v15, @"Reaped temp directory");
    }
    [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _migration_updateStashedIdentifiers];
    v31 = (void *)v54;
    ((void (*)(void *, __CFString *))v15[2])(v15, @"Data store migration finished (stashed %@ -> current %@).");
  }
  else
  {
    v31 = (void *)v54;
    v24(v15, @"Data store migration not needed (current %@ vs stashed %@).");
    id v30 = v50;
  }
  [v49 invalidate];

  return v46;
}

void __113__PBFPosterExtensionDataStoreXPCServiceGlue__lock_performNecessaryMigrationsForDataStoreAtURL_shouldForce_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = PBFLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 descriptionWithMultilinePrefix:0];
    int v6 = 138543362;
    char v7 = v5;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "Migration RBSAssertion invalidated: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

void __113__PBFPosterExtensionDataStoreXPCServiceGlue__lock_performNecessaryMigrationsForDataStoreAtURL_shouldForce_error___block_invoke_155(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v10 = (objc_class *)NSString;
  id v11 = a2;
  char v12 = (__CFString *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  char v13 = PBFLogMigration();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v16 = v12;
    _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  if (v12) {
    BOOL v14 = v12;
  }
  else {
    BOOL v14 = @"(null entry)";
  }
  [*(id *)(a1 + 32) addObject:v14];
}

+ (BOOL)_checkIfLanguageChangeOccurred:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_snapshotsLocaleDidChange") & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    int v6 = [v5 localeIdentifier];
    char v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_snapshotsLocaleIdentifier");
    if (!v7)
    {
      uint64_t v4 = +[PBFPosterExtensionDataStore galleryCacheURLForBaseURL:v3];
      uint64_t v8 = [[PBFPosterGalleryLayoutPersistence alloc] initWithURL:v4];
      uint8_t v9 = [(PBFPosterGalleryLayoutPersistence *)v8 loadNewestUsableGalleryLayoutReturningError:0];
      unsigned __int8 v10 = [v9 locale];
      char v7 = [v10 localeIdentifier];

      if (!v7)
      {

        LOBYTE(v4) = 0;
        goto LABEL_9;
      }
      id v11 = PBFLogMigration();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v13 = 0;
        _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "Found gallery; using gallery locale to populate stashedLocaleIdentifier",
          v13,
          2u);
      }

      objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_setSnapshotsLocaleIdentifier:", v7);
    }
    LODWORD(v4) = [v7 isEqualToString:v6] ^ 1;

LABEL_9:
    goto LABEL_10;
  }
  LOBYTE(v4) = 1;
LABEL_10:

  return (char)v4;
}

- (void)_migration_updateStashedIdentifiers
{
  id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v2 = [v6 localeIdentifier];
  objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_setSnapshotsLocaleIdentifier:", v2);
  id v3 = (void *)MEMORY[0x1E4F1CB18];
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v4 stringRepresentation];
  objc_msgSend(v3, "pbf_setSnapshotsBuildVersion:", v5);

  objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_setSnapshotsLocaleDidChange:", 0);
  objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_updateStashedDeviceType");
}

- (void)_localeDidChange:(id)a3
{
  uint64_t v4 = PBFLogMigration();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[PBFPosterExtensionDataStoreXPCServiceGlue _localeDidChange:]();
  }

  objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_setSnapshotsLocaleDidChange:", 1);
  [(PRSServer *)self->_server invalidate];
  os_unfair_lock_lock(&self->_lock);
  [(PBFPosterExtensionDataStore *)self->_lock_dataStore cancel];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v5 = PBFLogMigration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[PBFPosterExtensionDataStoreXPCServiceGlue _localeDidChange:]();
  }

  if (_localeDidChange__onceToken != -1) {
    dispatch_once(&_localeDidChange__onceToken, &__block_literal_global_241);
  }
}

uint64_t __62__PBFPosterExtensionDataStoreXPCServiceGlue__localeDidChange___block_invoke()
{
  dispatch_source_t v0 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
  SEL v1 = (void *)PBFPosterExtensionDataStoreDidTearDownNotification_block_invoke_timerSource;
  PBFPosterExtensionDataStoreDidTearDownNotification_block_invoke_timerSource = (uint64_t)v0;

  id v2 = PBFPosterExtensionDataStoreDidTearDownNotification_block_invoke_timerSource;
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler((dispatch_source_t)PBFPosterExtensionDataStoreDidTearDownNotification_block_invoke_timerSource, &__block_literal_global_243_0);
  dispatch_resume((dispatch_object_t)PBFPosterExtensionDataStoreDidTearDownNotification_block_invoke_timerSource);
  uint64_t v4 = PBFLogMigration();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__PBFPosterExtensionDataStoreXPCServiceGlue__localeDidChange___block_invoke_cold_1();
  }

  return xpc_transaction_exit_clean();
}

void __62__PBFPosterExtensionDataStoreXPCServiceGlue__localeDidChange___block_invoke_2()
{
  dispatch_source_t v0 = PBFLogMigration();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D31CE000, v0, OS_LOG_TYPE_ERROR, "[_localeDidChange] Second time calling xpc_transaction_exit_clean()", buf, 2u);
  }

  xpc_transaction_try_exit_clean();
  SEL v1 = PBFLogMigration();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v2 = 0;
    _os_log_error_impl(&dword_1D31CE000, v1, OS_LOG_TYPE_ERROR, "[_localeDidChange] Hard Exit...", v2, 2u);
  }

  exit(0);
}

- (void)server:(id)a3 setHostConfiguration:(id)a4 forRole:(id)a5 completion:(id)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = (void *)MEMORY[0x1E4F927A8];
  id v11 = (void (**)(id, void))a6;
  char v12 = [v10 sharedHostConfigurationManager];
  if (PFPosterRoleIsValid())
  {
    [v12 setHostConfiguration:v8 forRole:v9];
    v11[2](v11, 0);
  }
  else
  {
    char v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v17[0] = @"Invalid role";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    long long v15 = objc_msgSend(v13, "pbf_generalErrorWithCode:userInfo:", 1, v14);
    ((void (**)(id, void *))v11)[2](v11, v15);

    id v11 = (void (**)(id, void))v14;
  }
}

- (void)server:(id)a3 deleteHostConfigurationForRole:(id)a4 completion:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = (void *)MEMORY[0x1E4F927A8];
  id v8 = (void (**)(id, void))a5;
  id v9 = [v7 sharedHostConfigurationManager];
  if (PFPosterRoleIsValid())
  {
    [v9 deleteHostConfigurationForRole:v6];
    v8[2](v8, 0);
  }
  else
  {
    unsigned __int8 v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28588];
    v14[0] = @"Invalid role";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    char v12 = objc_msgSend(v10, "pbf_generalErrorWithCode:userInfo:", 1, v11);
    ((void (**)(id, void *))v8)[2](v8, v12);

    id v8 = (void (**)(id, void))v11;
  }
}

- (void)server:(id)a3 fetchPosterDescriptorsForExtension:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void *, id))a5;
  id v14 = 0;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v14];
  id v10 = v14;
  if (v9)
  {
    id v13 = 0;
    uint64_t v11 = [v9 posterDescriptorsForExtensionBundleIdentifier:v7 error:&v13];
    id v12 = v13;

    v8[2](v8, v11, v12);
    id v10 = v12;
  }
  else
  {
    v8[2](v8, 0, v10);
  }
}

- (void)server:(id)a3 fetchStaticPosterDescriptorsForExtension:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void *, id))a5;
  id v14 = 0;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v14];
  id v10 = v14;
  if (v9)
  {
    id v13 = 0;
    uint64_t v11 = [v9 staticPosterDescriptorsForExtensionBundleIdentifier:v7 error:&v13];
    id v12 = v13;

    v8[2](v8, v11, v12);
    id v10 = v12;
  }
  else
  {
    v8[2](v8, 0, v10);
  }
}

- (void)server:(id)a3 refreshPosterDescriptorsForExtension:(id)a4 sessionInfo:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v17 = 0;
  id v12 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v17];
  id v13 = v17;
  if (v12)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __112__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke;
    v15[3] = &unk_1E6984A70;
    id v16 = v11;
    id v14 = v13;
    [v12 reloadPosterDescriptorsForExtensionBundleIdentifier:v9 sessionInfo:v10 completion:v15];
  }
  else
  {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v17);
  }
}

uint64_t __112__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)server:(id)a3 deletePosterDescriptorsForExtension:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, id))a5;
  id v13 = 0;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v13];
  id v10 = v13;
  if (v9)
  {
    id v12 = 0;
    [v9 deletePosterDescriptorsForExtensionBundleIdentifier:v7 error:&v12];
    id v11 = v12;

    id v10 = v11;
  }
  v8[2](v8, v10);
}

- (void)server:(id)a3 fetchExtensionIdentifiersWithCompletion:(id)a4
{
  uint64_t v5 = (void (**)(id, uint64_t, void))a4;
  uint64_t v12 = 0;
  id v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v12];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 knownExtensions];
    uint64_t v9 = objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_251);
    id v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = MEMORY[0x1E4F1CBF0];
    }
    v5[2](v5, v11, 0);
  }
  else
  {
    v5[2](v5, 0, v12);
  }
}

uint64_t __92__PBFPosterExtensionDataStoreXPCServiceGlue_server_fetchExtensionIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 posterExtensionBundleIdentifier];
}

- (void)server:(id)a3 fetchPosterSnapshotsWithRequest:(id)a4 completion:(id)a5
{
  id v7 = a4;
  uint64_t v11 = 0;
  id v8 = (void (**)(id, void, uint64_t))a5;
  uint64_t v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v11];
  id v10 = v9;
  if (v9) {
    [v9 fetchPosterSnapshotsWithClientRequest:v7 completion:v8];
  }
  else {
    v8[2](v8, 0, v11);
  }
}

- (void)server:(id)a3 pushPosterGalleryUpdate:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void))a5;
  uint64_t v11 = 0;
  uint64_t v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v11];
  if (v9)
  {
    id v10 = [v7 posterBoardRepresentation];
    [v9 updateGallery:v10 completion:v8];
  }
  else
  {
    v8[2](v8, v11);
  }
}

- (void)server:(id)a3 pushToProactiveWithCompletion:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v5 = (void (**)(id, void))a4;
  id v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v8];
  id v7 = v6;
  if (v6) {
    [v6 pushToProactiveWithCompletion:v5];
  }
  else {
    v5[2](v5, v8);
  }
}

- (void)server:(id)a3 fetchGallery:(id)a4
{
  id v5 = a4;
  id v11 = 0;
  id v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v11];
  id v7 = v11;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__PBFPosterExtensionDataStoreXPCServiceGlue_server_fetchGallery___block_invoke;
    v9[3] = &unk_1E6984780;
    id v10 = v5;
    id v8 = v7;
    [v6 fetchGalleryConfigurationWithOptions:4 completion:v9];
  }
  else
  {
    (*((void (**)(id, void, void, void, id))v5 + 2))(v5, 0, 0, 0, v11);
  }
}

void __65__PBFPosterExtensionDataStoreXPCServiceGlue_server_fetchGallery___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = a5;
  id v10 = a3;
  id v11 = [a2 proactiveRepresentation];
  (*(void (**)(uint64_t, id, id, uint64_t, id))(v8 + 16))(v8, v11, v10, a4, v9);
}

- (void)server:(id)a3 retrieveGallery:(id)a4
{
  id v5 = a4;
  id v11 = 0;
  id v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v11];
  id v7 = v11;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__PBFPosterExtensionDataStoreXPCServiceGlue_server_retrieveGallery___block_invoke;
    v9[3] = &unk_1E6984780;
    id v10 = v5;
    id v8 = v7;
    [v6 fetchGalleryConfigurationWithOptions:2 completion:v9];
  }
  else
  {
    (*((void (**)(id, void, void, void, id))v5 + 2))(v5, 0, 0, 0, v11);
  }
}

void __68__PBFPosterExtensionDataStoreXPCServiceGlue_server_retrieveGallery___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = a5;
  id v10 = a3;
  id v11 = [a2 proactiveRepresentation];
  (*(void (**)(uint64_t, id, id, uint64_t, id))(v8 + 16))(v8, v11, v10, a4, v9);
}

- (void)server:(id)a3 createPosterConfigurationForProviderIdentifier:(id)a4 posterDescriptorIdentifier:(id)a5 role:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v20 = 0;
  long long v15 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v20];
  id v16 = v20;
  if (v15)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __142__PBFPosterExtensionDataStoreXPCServiceGlue_server_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke;
    v18[3] = &unk_1E6984A98;
    id v19 = v14;
    id v17 = v16;
    [v15 createPosterConfigurationForProviderIdentifier:v11 posterDescriptorIdentifier:v12 role:v13 completion:v18];
  }
  else
  {
    (*((void (**)(id, void, id))v14 + 2))(v14, 0, v20);
  }
}

uint64_t __142__PBFPosterExtensionDataStoreXPCServiceGlue_server_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)server:(id)a3 refreshPosterConfigurationMatchingUUID:(id)a4 sessionInfo:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v17 = 0;
  id v12 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v17];
  id v13 = v17;
  if (v12)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __114__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke;
    v15[3] = &unk_1E6984A98;
    id v16 = v11;
    id v14 = v13;
    [v12 refreshPosterConfigurationMatchingUUID:v9 sessionInfo:v10 completion:v15];
  }
  else
  {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v17);
  }
}

uint64_t __114__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)server:(id)a3 associateConfigurationMatchingUUID:(id)a4 focusModeActivityUUID:(id)a5 completion:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v53 = a4;
  id v9 = a5;
  id v10 = (void (**)(id, id))a6;
  id v63 = 0;
  id v11 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v63];
  id v12 = v63;
  id v13 = v12;
  if (v11)
  {
    v52 = v12;
    v51 = [v11 switcherConfiguration];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v14 = [v51 configurations];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      v48 = v11;
      v49 = v10;
      uint64_t v17 = *(void *)v60;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v60 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          id v20 = objc_msgSend(v19, "_path", v48);
          int v21 = [v20 serverIdentity];
          int v22 = [v21 posterUUID];
          int v23 = [v22 isEqual:v53];

          if (v23)
          {
            id v24 = v19;
            goto LABEL_12;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v59 objects:v69 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      id v24 = 0;
LABEL_12:
      id v11 = v48;
      id v10 = v49;
    }
    else
    {
      id v24 = 0;
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    int v25 = [MEMORY[0x1E4F62278] sharedActivityManager];
    BOOL v26 = [v25 availableActivities];

    id v27 = (id)[v26 countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v27)
    {
      id v50 = v24;
      long long v28 = v11;
      __int16 v29 = v10;
      uint64_t v30 = *(void *)v56;
      while (2)
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v56 != v30) {
            objc_enumerationMutation(v26);
          }
          char v32 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
          int v33 = [v32 activityUniqueIdentifier];
          int v34 = [v33 isEqual:v9];

          if (v34)
          {
            id v27 = v32;
            goto LABEL_25;
          }
        }
        id v27 = (id)[v26 countByEnumeratingWithState:&v55 objects:v68 count:16];
        if (v27) {
          continue;
        }
        break;
      }
LABEL_25:
      id v10 = v29;
      id v11 = v28;
      id v24 = v50;
    }

    id v13 = v52;
    if (v24)
    {
      if (v27)
      {
        id v35 = objc_alloc(MEMORY[0x1E4F92668]);
        [v27 activityIdentifier];
        v37 = id v36 = v24;
        long long v38 = [v27 activityUniqueIdentifier];
        long long v39 = (void *)[v35 initWithActivityIdentifier:v37 activityUUID:v38];

        id v24 = v36;
        v40 = v51;
        v41 = (void *)[v51 mutableCopy];
        [v41 setFocusConfiguration:v39 forPosterConfiguration:v36];
        id v54 = 0;
        id v42 = (id)[v11 updateDataStoreForSwitcherConfiguration:v41 reason:@"associate focus mode with poster" error:&v54];
        id v43 = v54;

        id v13 = v43;
LABEL_32:
        v10[2](v10, v43);

        goto LABEL_33;
      }
      int v44 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v64 = *MEMORY[0x1E4F28588];
      v65 = @"Invalid target activity for associateConfigurationMatchingUUID";
      uint64_t v45 = (void *)MEMORY[0x1E4F1C9E8];
      BOOL v46 = &v65;
      id v47 = &v64;
    }
    else
    {
      int v44 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v66 = *MEMORY[0x1E4F28588];
      v67 = @"Invalid target configuration for associateConfigurationMatchingUUID";
      uint64_t v45 = (void *)MEMORY[0x1E4F1C9E8];
      BOOL v46 = &v67;
      id v47 = &v66;
    }
    long long v39 = [v45 dictionaryWithObjects:v46 forKeys:v47 count:1];
    objc_msgSend(v44, "pbf_generalErrorWithCode:userInfo:", 1, v39);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    v41 = v43;
    v40 = v51;
    goto LABEL_32;
  }
  v10[2](v10, v12);
LABEL_33:
}

- (void)server:(id)a3 fetchPosterConfigurationsForRole:(id)a4 completion:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void *, id))a5;
  id v14 = 0;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v14];
  id v10 = v14;
  if (v9)
  {
    id v13 = 0;
    id v11 = [v9 posterConfigurationsForRole:v7 error:&v13];
    id v12 = v13;

    v8[2](v8, v11, v12);
    id v10 = v12;
  }
  else
  {
    v8[2](v8, 0, v10);
  }
}

- (void)server:(id)a3 fetchPosterConfigurationsForExtension:(id)a4 completion:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void *, void))a5;
  uint64_t v12 = 0;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v12];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 posterConfigurationsForExtension:v7];
    v8[2](v8, v11, 0);
  }
  else
  {
    v8[2](v8, 0, v12);
  }
}

- (void)server:(id)a3 deletePosterConfigurationsMatchingUUID:(id)a4 completion:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, id))a5;
  id v13 = 0;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v13];
  id v10 = v13;
  if (v9)
  {
    id v12 = 0;
    [v9 deletePosterConfigurationsMatchingUUID:v7 error:&v12];
    id v11 = v12;

    id v10 = v11;
  }
  v8[2](v8, v10);
}

- (void)server:(id)a3 exportPosterConfigurationMatchingUUID:(id)a4 completion:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void *, id))a5;
  id v23 = 0;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v23];
  id v10 = v23;
  if (v9)
  {
    id v22 = 0;
    id v11 = [v9 exportPosterConfigurationMatchingUUID:v7 error:&v22];
    id v12 = v22;

    if (v11)
    {
      id v21 = v12;
      id v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11 options:1 error:&v21];
      id v10 = v21;

      id v14 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      id v20 = 0;
      char v15 = [v14 removeItemAtURL:v11 error:&v20];
      id v16 = v20;
      if ((v15 & 1) == 0)
      {
        uint64_t v17 = PBFLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[PBFPosterExtensionDataStoreXPCServiceGlue server:exportPosterConfigurationMatchingUUID:completion:]();
        }
      }
      if (v13)
      {
        long long v18 = v13;
        id v19 = 0;
      }
      else
      {
        long long v18 = 0;
        id v19 = v10;
      }
      v8[2](v8, v18, v19);
    }
    else
    {
      v8[2](v8, 0, v12);
      id v10 = v12;
    }
  }
  else
  {
    v8[2](v8, 0, v10);
  }
}

- (void)server:(id)a3 importPosterConfigurationFromArchiveData:(id)a4 completion:(id)a5
{
  id v7 = a4;
  uint64_t v11 = 0;
  uint64_t v8 = (void (**)(id, void, uint64_t))a5;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v11];
  id v10 = v9;
  if (v9) {
    [v9 importPosterConfigurationFromArchiveData:v7 completion:v8];
  }
  else {
    v8[2](v8, 0, v11);
  }
}

- (void)server:(id)a3 refreshSnapshotForPosterConfigurationMatchUUID:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v14 = 0;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v14];
  id v10 = v14;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __110__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke;
    v12[3] = &unk_1E69849C0;
    id v13 = v8;
    id v11 = v10;
    [v9 refreshSnapshotForPosterConfigurationMatchUUID:v7 completion:v12];
  }
  else
  {
    (*((void (**)(id, id))v8 + 2))(v8, v14);
  }
}

uint64_t __110__PBFPosterExtensionDataStoreXPCServiceGlue_server_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)server:(id)a3 notePosterConfigurationUnderlyingModelDidChange:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  id v7 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_dataStoreWithError:0];
  [v7 notePosterConfigurationUnderlyingModelDidChange:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)server:(id)a3 ingestSnapshotCollection:(id)a4 forPosterConfigurationUUID:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, id))a6;
  id v16 = 0;
  id v12 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v16];
  id v13 = v16;
  if (v12)
  {
    id v15 = 0;
    [v12 ingestSnapshotCollection:v9 forPosterConfigurationUUID:v10 error:&v15];
    id v14 = v15;

    id v13 = v14;
  }
  v11[2](v11, v13);
}

- (void)server:(id)a3 fetchContentObstructionBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *, void *))a6;
  if ((unint64_t)(a5 - 1) >= 4)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28588];
    v34[0] = @"orientation must be a valid UIDeviceOrientation.";
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    id v15 = (__CFString **)v34;
    id v16 = &v33;
  }
  else
  {
    if ([(PBFPosterExtensionDataStoreXPCServiceGlue *)self _hasValidConfigurationForPoster:v11])
    {
      goto LABEL_7;
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28588];
    char v32 = @"configuration must be a valid PRSPosterConfiguration.";
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    id v15 = &v32;
    id v16 = &v31;
  }
  uint64_t v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
  long long v18 = objc_msgSend(v13, "pbf_generalErrorWithCode:userInfo:", 1, v17);

  if (v18)
  {
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_10;
  }
LABEL_7:
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _screenBoundsForOrientation:a5];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](self->_layoutController, "tightFrameForElements:withBoundingRect:", 3);
  -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:forScreenBounds:](self, "_normalizedBounds:forScreenBounds:");
  long long v28 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:");
  id v19 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v28];

  if ([(PBFPosterExtensionDataStoreXPCServiceGlue *)self _hasComplicationsForPosterConfiguration:v11])
  {
    -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](self->_layoutController, "tightFrameForElements:withBoundingRect:", 8, v21, v23, v25, v27);
    -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:forScreenBounds:](self, "_normalizedBounds:forScreenBounds:");
    __int16 v29 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:");
    uint64_t v30 = [v19 arrayByAddingObject:v29];

    long long v18 = 0;
    id v19 = (void *)v30;
  }
  else
  {
    long long v18 = 0;
  }
LABEL_10:
  v12[2](v12, v19, v18);
}

- (void)server:(id)a3 fetchMaximalContentCutoutBoundsForOrientation:(int64_t)a4 completion:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *, void *))a5;
  if ((unint64_t)(a4 - 1) < 4) {
    goto LABEL_4;
  }
  id v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v18 = *MEMORY[0x1E4F28588];
  v19[0] = @"orientation must be a valid UIDeviceOrientation.";
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v12 = objc_msgSend(v10, "pbf_generalErrorWithCode:userInfo:", 1, v11);

  if (v12)
  {
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v15 = *MEMORY[0x1E4F1DB20];
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  }
  else
  {
LABEL_4:
    [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _prominentObstructionForOrientation:a4 showingComplications:0];
    -[PBFPosterExtensionDataStoreXPCServiceGlue _cutoutBoundsForObstructionBounds:orientation:](self, "_cutoutBoundsForObstructionBounds:orientation:", a4);
    -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:orientation:](self, "_normalizedBounds:orientation:", a4);
    id v12 = 0;
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", v15, v16, v13, v14);
  v9[2](v9, v17, v12);
}

- (void)server:(id)a3 fetchContentCutoutBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *, void *))a6;
  if ((unint64_t)(a5 - 1) >= 4)
  {
    double v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28588];
    v27[0] = @"orientation must be a valid UIDeviceOrientation.";
    double v14 = (void *)MEMORY[0x1E4F1C9E8];
    double v15 = (__CFString **)v27;
    double v16 = &v26;
  }
  else
  {
    if ([(PBFPosterExtensionDataStoreXPCServiceGlue *)self _hasValidConfigurationForPoster:v11])
    {
LABEL_7:
      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _prominentObstructionForConfiguration:v11 orientation:a5];
      -[PBFPosterExtensionDataStoreXPCServiceGlue _cutoutBoundsForObstructionBounds:orientation:](self, "_cutoutBoundsForObstructionBounds:orientation:", a5);
      -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:orientation:](self, "_normalizedBounds:orientation:", a5);
      uint64_t v18 = 0;
      goto LABEL_8;
    }
    double v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28588];
    double v25 = @"configuration must be a valid PRSPosterConfiguration.";
    double v14 = (void *)MEMORY[0x1E4F1C9E8];
    double v15 = &v25;
    double v16 = &v24;
  }
  uint64_t v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
  uint64_t v18 = objc_msgSend(v13, "pbf_generalErrorWithCode:userInfo:", 1, v17);

  if (!v18) {
    goto LABEL_7;
  }
  double v19 = *MEMORY[0x1E4F1DB20];
  double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_8:
  double v23 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", v19, v20, v21, v22);
  v12[2](v12, v23, v18);
}

- (void)server:(id)a3 fetchObscurableBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *, void *))a6;
  if ((unint64_t)(a5 - 1) >= 4)
  {
    double v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v56 = *MEMORY[0x1E4F28588];
    v57[0] = @"orientation must be a valid UIDeviceOrientation.";
    double v14 = (void *)MEMORY[0x1E4F1C9E8];
    double v15 = (__CFString **)v57;
    double v16 = &v56;
  }
  else
  {
    if ([(PBFPosterExtensionDataStoreXPCServiceGlue *)self _hasValidConfigurationForPoster:v11])
    {
      goto LABEL_7;
    }
    double v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F28588];
    long long v55 = @"configuration must be a valid PRSPosterConfiguration.";
    double v14 = (void *)MEMORY[0x1E4F1C9E8];
    double v15 = &v55;
    double v16 = &v54;
  }
  uint64_t v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
  uint64_t v18 = objc_msgSend(v13, "pbf_generalErrorWithCode:userInfo:", 1, v17);

  if (v18)
  {
    double v19 = *MEMORY[0x1E4F1DB20];
    double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_12;
  }
LABEL_7:
  BOOL v23 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _hasComplicationsForPosterConfiguration:v11];
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _prominentObstructionForConfiguration:v11 orientation:a5];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _screenBoundsForOrientation:a5];
  double v36 = v32;
  double v37 = v33;
  double v38 = v34;
  double v39 = v35;
  if (v23)
  {
    -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](self->_layoutController, "tightFrameForElements:withBoundingRect:", 8, v32, v33, v34, v35);
    double MaxY = CGRectGetMaxY(v58);
  }
  else
  {
    -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](self->_layoutController, "tightFrameForElements:withBoundingRect:", 1, v32, v33, v34, v35);
    CGFloat v52 = v27;
    CGFloat v53 = v25;
    CGFloat x = v59.origin.x;
    CGFloat y = v59.origin.y;
    CGFloat v50 = v31;
    CGFloat recta = v29;
    CGFloat width = v59.size.width;
    CGFloat height = v59.size.height;
    double MinY = CGRectGetMinY(v59);
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.CGFloat width = width;
    v60.size.CGFloat height = height;
    CGFloat v45 = CGRectGetHeight(v60);
    v61.size.CGFloat height = v50;
    double MaxY = MinY + v45 * 0.75;
    v61.origin.CGFloat y = v52;
    v61.origin.CGFloat x = v53;
    v61.size.CGFloat width = recta;
    double v46 = CGRectGetMaxY(v61);
    if (MaxY >= v46) {
      double MaxY = v46;
    }
  }
  v62.origin.CGFloat x = v36;
  v62.origin.CGFloat y = v37;
  v62.size.CGFloat width = v38;
  v62.size.CGFloat height = v39;
  double v47 = CGRectGetWidth(v62);
  v63.origin.CGFloat x = v36;
  v63.origin.CGFloat y = v37;
  v63.size.CGFloat width = v38;
  v63.size.CGFloat height = v39;
  -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:forScreenBounds:](self, "_normalizedBounds:forScreenBounds:", 0.0, MaxY, v47, CGRectGetHeight(v63) - MaxY, v36, v37, v38, v39);
  uint64_t v18 = 0;
LABEL_12:
  v48 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", v19, v20, v21, v22, *(void *)&MinY);
  v12[2](v12, v48, v18);
}

- (void)server:(id)a3 fetchLimitedOcclusionBoundsForPosterConfiguration:(id)a4 orientation:(int64_t)a5 completion:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *, void))a6;
  if ((unint64_t)(a5 - 1) >= 4)
  {
    double v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28588];
    v30[0] = @"orientation must be a valid UIDeviceOrientation.";
    double v14 = (void *)MEMORY[0x1E4F1C9E8];
    double v15 = (__CFString **)v30;
    double v16 = &v29;
  }
  else
  {
    if ([(PBFPosterExtensionDataStoreXPCServiceGlue *)self _hasValidConfigurationForPoster:v11])
    {
LABEL_7:
      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _screenBoundsForOrientation:a5];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](self->_layoutController, "tightFrameForElements:withBoundingRect:", 1);
      -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:forScreenBounds:](self, "_normalizedBounds:forScreenBounds:", v31.origin.x, v31.origin.y, v31.size.width, CGRectGetHeight(v31) * 0.75, v20, v22, v24, v26);
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:");
      v12[2](v12, v18, 0);
      goto LABEL_8;
    }
    double v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28588];
    double v28 = @"configuration must be a valid PRSPosterConfiguration.";
    double v14 = (void *)MEMORY[0x1E4F1C9E8];
    double v15 = &v28;
    double v16 = &v27;
  }
  uint64_t v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
  uint64_t v18 = objc_msgSend(v13, "pbf_generalErrorWithCode:userInfo:", 1, v17);

  if (!v18) {
    goto LABEL_7;
  }
  ((void (**)(id, void *, void *))v12)[2](v12, 0, v18);
LABEL_8:
}

- (BOOL)_hasValidConfigurationForPoster:(id)a3
{
  return a3 != 0;
}

- (BOOL)_hasComplicationsForPosterConfiguration:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  uint64_t v4 = objc_msgSend(v3, "pr_loadComplicationLayoutWithError:", &v9);
  id v5 = v9;
  if (v5)
  {
    id v6 = PBFLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(PBFPosterExtensionDataStoreXPCServiceGlue *)v3 _hasComplicationsForPosterConfiguration:v6];
    }
    BOOL v7 = 0;
  }
  else
  {
    id v6 = [v4 complications];
    BOOL v7 = [v6 count] != 0;
  }

  return v7;
}

- (CGRect)_screenBoundsForOrientation:(int64_t)a3
{
  uint64_t v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v22.origin.CGFloat x = v6;
  v22.origin.CGFloat y = v8;
  v22.size.CGFloat width = v10;
  v22.size.CGFloat height = v12;
  double Width = CGRectGetWidth(v22);
  v23.origin.CGFloat x = v6;
  v23.origin.CGFloat y = v8;
  v23.size.CGFloat width = v10;
  v23.size.CGFloat height = v12;
  double Height = CGRectGetHeight(v23);
  if (Width >= Height) {
    double v15 = Width;
  }
  else {
    double v15 = Height;
  }
  v24.origin.CGFloat x = v6;
  v24.origin.CGFloat y = v8;
  v24.size.CGFloat width = v10;
  v24.size.CGFloat height = v12;
  double v16 = CGRectGetWidth(v24);
  v25.origin.CGFloat x = v6;
  v25.origin.CGFloat y = v8;
  v25.size.CGFloat width = v10;
  v25.size.CGFloat height = v12;
  double v17 = CGRectGetHeight(v25);
  if (v16 < v17) {
    double v17 = v16;
  }
  if ((unint64_t)(a3 - 1) >= 2) {
    double v18 = v15;
  }
  else {
    double v18 = v17;
  }
  if ((unint64_t)(a3 - 1) >= 2) {
    double v19 = v17;
  }
  else {
    double v19 = v15;
  }
  double v20 = 0.0;
  double v21 = 0.0;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGRect)_cutoutBoundsForObstructionBounds:(CGRect)a3 orientation:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _screenBoundsForOrientation:a4];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v22);
  v23.origin.CGFloat x = v9;
  v23.origin.CGFloat y = v11;
  v23.size.CGFloat width = v13;
  v23.size.CGFloat height = v15;
  CGFloat v17 = CGRectGetWidth(v23);
  v24.origin.CGFloat x = v9;
  v24.origin.CGFloat y = v11;
  v24.size.CGFloat width = v13;
  v24.size.CGFloat height = v15;
  double v18 = CGRectGetHeight(v24) - MaxY;
  double v19 = 0.0;
  double v20 = MaxY;
  double v21 = v17;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)_normalizedBounds:(CGRect)a3 orientation:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _screenBoundsForOrientation:a4];
  -[PBFPosterExtensionDataStoreXPCServiceGlue _normalizedBounds:forScreenBounds:](self, "_normalizedBounds:forScreenBounds:", x, y, width, height, v9, v10, v11, v12);
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_normalizedBounds:(CGRect)a3 forScreenBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v17 = a3.size.height;
  double v8 = a3.size.width;
  double v9 = a3.origin.y;
  double v10 = a3.origin.x;
  double v11 = CGRectGetWidth(a4);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat v12 = CGRectGetHeight(v18);
  double v13 = v9 / v12;
  double v14 = v8 / v11;
  double v15 = v17 / v12;
  double v16 = v10 / v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)_prominentObstructionForConfiguration:(id)a3 orientation:(int64_t)a4
{
  BOOL v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _hasComplicationsForPosterConfiguration:a3];
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _prominentObstructionForOrientation:a4 showingComplications:v6];
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGRect)_prominentObstructionForOrientation:(int64_t)a3 showingComplications:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 11;
  }
  else {
    uint64_t v5 = 3;
  }
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _screenBoundsForOrientation:a3];
  layoutController = self->_layoutController;
  -[CSProminentLayoutController tightFrameForElements:withBoundingRect:](layoutController, "tightFrameForElements:withBoundingRect:", v5);
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (void)server:(id)a3 updateToSelectedConfigurationMatchingUUID:(id)a4 role:(id)a5 from:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = (void (**)(id, id))a7;
  id v19 = 0;
  double v15 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v19];
  id v16 = v19;
  if (v15)
  {
    id v18 = 0;
    [v15 updateSelectedPosterUUID:v11 role:v12 from:v13 error:&v18];
    id v17 = v18;

    id v16 = v17;
  }
  v14[2](v14, v16);
}

- (void)server:(id)a3 fetchSelectedPosterForRole:(id)a4 completion:(id)a5
{
  id v7 = a4;
  double v8 = (void (**)(id, void *, id))a5;
  id v15 = 0;
  double v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v15];
  id v10 = v15;
  if (v9)
  {
    id v14 = 0;
    id v11 = [v9 selectedPosterForRole:v7 error:&v14];
    id v12 = v14;

    id v13 = [v11 _path];

    v8[2](v8, v13, v12);
    id v10 = v12;
  }
  else
  {
    v8[2](v8, 0, v10);
  }
}

- (void)server:(id)a3 fetchActivePosterForRole:(id)a4 completion:(id)a5
{
  double v8 = (void (**)(id, void *, void *, void))a5;
  uint64_t v15 = 0;
  double v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self server:a3 fetchActivePosterForRole:a4 error:&v15];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 lockScreenPosterConfiguration];
    id v12 = [v11 _path];

    id v13 = [v10 homeScreenPosterConfiguration];
    id v14 = [v13 _path];

    v8[2](v8, v14, v12, 0);
  }
  else
  {
    v8[2](v8, 0, 0, v15);
  }
}

- (id)server:(id)a3 fetchActivePosterForRole:(id)a4 error:(id *)a5
{
  id v7 = a4;
  double v8 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:a5];
  double v9 = v8;
  if (v8)
  {
    id v18 = 0;
    id v10 = [v8 activePosterForRole:v7 assocPoster:&v18 error:a5];
    if (v10)
    {
      id v11 = v18;
      id v12 = [v10 _path];
      id v13 = [v11 _path];

      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F922E0]) _initWithPath:v12];
      if (v13) {
        uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F922E0]) _initWithPath:v13];
      }
      else {
        uint64_t v15 = 0;
      }
      id v16 = (void *)[objc_alloc(MEMORY[0x1E4F922A0]) initWithLockScreenPosterConfiguration:v14 homeScreenPosterConfiguration:v15];
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)server:(id)a3 fetchFocusUUIDForConfiguration:(id)a4 completion:(id)a5
{
  id v7 = a4;
  double v8 = (void (**)(id, void, id))a5;
  id v16 = 0;
  double v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v16];
  id v10 = v16;
  id v11 = v10;
  if (!v9 || v10)
  {
    v8[2](v8, 0, v10);
  }
  else
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v7];
    id v15 = 0;
    id v13 = [v12 loadFocusConfigurationWithError:&v15];
    id v11 = v15;
    id v14 = [v13 activityUUID];
    ((void (**)(id, void *, id))v8)[2](v8, v14, v11);
  }
}

- (void)server:(id)a3 removeAllFocusConfigurationsMatchingFocusUUID:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = (void (**)(id, id))a5;
  id v33 = 0;
  double v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v33];
  id v10 = v33;
  id v11 = v10;
  if (v9)
  {
    CGRect v24 = v10;
    double v26 = v9;
    uint64_t v27 = v8;
    CGRect v25 = [v9 switcherConfiguration];
    id v12 = (void *)[v25 mutableCopy];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = [v12 configurations];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v19 = [v18 loadFocusConfigurationWithError:0];
          double v20 = [v19 activityUUID];
          int v21 = [v20 isEqual:v7];

          if (v21) {
            [v12 setFocusConfiguration:0 forPosterConfiguration:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v15);
    }

    id v28 = 0;
    double v9 = v26;
    id v22 = (id)[v26 updateDataStoreForSwitcherConfiguration:v12 reason:@"remove all focus configurations XPC" error:&v28];
    id v11 = v28;

    double v8 = v27;
    if (v11)
    {
      CGRect v23 = PBFLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStoreXPCServiceGlue server:removeAllFocusConfigurationsMatchingFocusUUID:completion:]();
      }
    }
    v27[2](v27, v11);
  }
  else
  {
    v8[2](v8, v10);
  }
}

- (void)server:(id)a3 notifyFocusModeDidChange:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = (void (**)(id, id))a5;
  id v16 = 0;
  double v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v16];
  id v10 = v16;
  id v11 = v10;
  if (v9)
  {
    id v15 = 0;
    [v9 updateDataStoreForIncomingFocusModeChange:v7 error:&v15];
    id v12 = v15;

    id v13 = PBFLogCommon();
    uint64_t v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStoreXPCServiceGlue server:notifyFocusModeDidChange:completion:]();
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v7;
      _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "Successfully updated switcher configuration to match mode change to %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v12 = v10;
  }
  v8[2](v8, v12);
}

- (void)server:(id)a3 notifyAvailableFocusModesDidChange:(id)a4 completion:(id)a5
{
  id v7 = a4;
  double v8 = (void (**)(id, id))a5;
  id v13 = 0;
  double v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v13];
  id v10 = v13;
  if (v9)
  {
    id v12 = 0;
    [v9 updateDataStoreForIncomingAvailableFocusModeChange:v7 error:&v12];
    id v11 = v12;

    id v10 = v11;
  }
  v8[2](v8, v10);
}

- (void)server:(id)a3 notifyActiveChargerIdentifierDidUpdate:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = (void (**)(id, id))a5;
  id v16 = 0;
  double v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v16];
  id v10 = v16;
  id v11 = v10;
  if (v9)
  {
    id v15 = 0;
    [v9 updateDataStoreForIncomingActiveChargerIdentifierUpdate:v7 error:&v15];
    id v12 = v15;

    id v13 = PBFLogCommon();
    uint64_t v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStoreXPCServiceGlue server:notifyActiveChargerIdentifierDidUpdate:completion:]();
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v7;
      _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "Successfully updated data store for activeChargerIdentifier update to %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v12 = v10;
  }
  v8[2](v8, v12);
}

- (void)server:(id)a3 prewarmWithCompletion:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v5 = (void (**)(id, void))a4;
  BOOL v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v8];
  id v7 = v6;
  if (v6) {
    [v6 prewarmWithCompletion:v5];
  }
  else {
    v5[2](v5, v8);
  }
}

- (void)server:(id)a3 overnightUpdateWithCompletion:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v5 = (void (**)(id, void))a4;
  BOOL v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v8];
  id v7 = v6;
  if (v6) {
    [v6 overnightUpdateWithCompletion:v5];
  }
  else {
    v5[2](v5, v8);
  }
}

- (void)server:(id)a3 gatherDataFreshnessState:(id)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void *, void))a4;
  uint64_t v10 = 0;
  BOOL v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v10];
  if (v6)
  {
    v11[0] = @"PBFDataComponentGallery";
    v11[1] = @"PBFDataComponentDynamicDescriptors";
    v11[2] = @"PBFDataComponentStaticDescriptors";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    uint64_t v8 = [v6 dataFreshnessForComponents:v7];
    double v9 = [v8 freshnessDebugDescription];

    v5[2](v5, v9, 0);
  }
  else
  {
    v5[2](v5, 0, v10);
  }
}

- (void)server:(id)a3 refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a4 extensionIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = 0;
  id v11 = (void (**)(id, void))a6;
  id v12 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v14];
  id v13 = v12;
  if (v12) {
    [v12 refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:v9 extensionIdentifier:v10 completion:v11];
  }
  else {
    v11[2](v11, v14);
  }
}

- (void)server:(id)a3 fetchRuntimeAssertionState:(id)a4
{
  uint64_t v5 = a4;
  id v11 = 0;
  id v6 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v11];
  if (v11)
  {
    id v7 = (void (*)(void *, void, id))v5[2];
    id v8 = v11;
    v7(v5, 0, v8);
  }
  else
  {
    p_lock = &self->_lock;
    id v10 = 0;
    os_unfair_lock_lock(&self->_lock);
    id v8 = [(PBFRuntimeAssertionManager *)self->_lock_runtimeAssertionManager debugDescription];

    os_unfair_lock_unlock(p_lock);
    ((void (*)(void *, id, void))v5[2])(v5, v8, 0);
  }
}

- (void)server:(id)a3 fetchAssociatedHomeScreenPosterConfigurationUUID:(id)a4 completion:(id)a5
{
  id v7 = a4;
  uint64_t v11 = 0;
  id v8 = (void (**)(id, void, uint64_t))a5;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v11];
  id v10 = v9;
  if (v9) {
    [v9 fetchHomeScreenAssociatedPosterConfigurationForConfigurationUUID:v7 completion:v8];
  }
  else {
    v8[2](v8, 0, v11);
  }
}

- (void)server:(id)a3 runMigration:(BOOL)a4 migrationDescriptor:(id)a5 completion:(id)a6
{
  BOOL v98 = a4;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v94 = (void (**)(id, void))a6;
  uint64_t v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
  id v10 = PBFLogMigration();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = PBFLogMigration();
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Migration", "", buf, 2u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v108 = 0;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_teardownDataStoreWithError:&v108];
  id v15 = v108;
  id v16 = [[PBFPosterExtensionDataStoreMigrator alloc] initWithBaseURL:v9];
  id v17 = [(PBFPosterExtensionDataStoreMigrator *)v16 availableDataStoreVersions];
  uint64_t v18 = [v17 lastIndex];

  unint64_t v95 = v11 - 1;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_signpost_id_t v19 = v11;
    double v20 = v8;
    int v21 = (void *)v9;
    id v22 = PBFLogMigration();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_DEFAULT, "Pre-migration; data store never ever initialized!",
        buf,
        2u);
    }
  }
  else
  {
    id v90 = v8;
    CGRect v23 = [PBFPosterExtensionDataStoreIntrospector alloc];
    int v21 = (void *)v9;
    CGRect v24 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreURLForBaseURL:version:", v9, v18);
    CGRect v25 = [(PBFPosterExtensionDataStoreIntrospector *)v23 initWithURL:v24 error:0];
    uint64_t v26 = [(PBFPosterExtensionDataStoreIntrospector *)v25 numberOfPostersForRole:*MEMORY[0x1E4F92790]];

    uint64_t v27 = PBFLogMigration();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v111 = v26;
      _os_log_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEFAULT, "Pre-migration number of lock screen posters: %lu", buf, 0xCu);
    }

    id v22 = PBFLogMigration();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v111 = v18;
      _os_log_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_DEFAULT, "Pre-migration data store version: %lu", buf, 0xCu);
    }
    os_signpost_id_t v19 = v11;
    p_lock = &self->_lock;
    double v20 = v90;
  }

  os_signpost_id_t spid = v19;
  if (!v15)
  {
    id v107 = 0;
    long long v29 = v21;
    [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_performNecessaryMigrationsForDataStoreAtURL:v21 shouldForce:v98 error:&v107];
    id v28 = v107;
    long long v30 = v20;
    if (v28) {
      goto LABEL_15;
    }
    id v106 = 0;
    double v38 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_dataStoreWithError:&v106];
    id v28 = v106;

    if (!v38) {
      goto LABEL_15;
    }
    long long v31 = v28;
    double v39 = [[PBFPosterExtensionDataStoreMigrator alloc] initWithBaseURL:v29];
    [(PBFPosterExtensionDataStoreMigrator *)v39 availableDataStoreVersions];
    v41 = v40 = v29;
    uint64_t v42 = [v41 lastIndex];

    id v43 = [PBFPosterExtensionDataStoreIntrospector alloc];
    v88 = v40;
    int v44 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreURLForBaseURL:version:", v40, v42);
    id v105 = 0;
    CGFloat v45 = [(PBFPosterExtensionDataStoreIntrospector *)v43 initWithURL:v44 error:&v105];
    v89 = v105;

    v99 = v45;
    uint64_t v46 = [(PBFPosterExtensionDataStoreIntrospector *)v45 numberOfPostersForRole:*MEMORY[0x1E4F92790]];
    double v47 = PBFLogMigration();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v111 = v46;
      _os_log_impl(&dword_1D31CE000, v47, OS_LOG_TYPE_DEFAULT, "Post-migration number of lock screen posters: %lu", buf, 0xCu);
    }

    v48 = PBFLogMigration();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v111 = v42;
      _os_log_impl(&dword_1D31CE000, v48, OS_LOG_TYPE_DEFAULT, "Post-migration data store version: %lu", buf, 0xCu);
    }

    long long v29 = v88;
    if (v89)
    {
      v49 = PBFLogMigration();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v111 = v89;
        _os_log_impl(&dword_1D31CE000, v49, OS_LOG_TYPE_DEFAULT, "Post-migration introspector error: %{public}@", buf, 0xCu);
      }
      id v33 = v20;
      unint64_t v34 = v95;
LABEL_66:

LABEL_67:
      long long v32 = v89;
      goto LABEL_18;
    }
    CGFloat v50 = [v20 homeScreenTintColor];
    id v33 = v20;
    unint64_t v34 = v95;
    if (!v50)
    {
      CGFloat v50 = [v33 isHomeScreenDim];
      if (([v50 BOOLValue] & 1) == 0)
      {
        v51 = [v33 homeScreenIconStyle];
        if (!v51)
        {
          v81 = [v33 homeScreenIconSize];

          if (!v81) {
            goto LABEL_67;
          }
          goto LABEL_42;
        }
      }
    }

LABEL_42:
    v49 = [v33 homeScreenTintColor];
    v87 = [v33 isHomeScreenDim];
    v86 = [v33 homeScreenIconSize];
    v85 = [v33 homeScreenIconStyle];
    CGFloat v52 = [(PBFPosterExtensionDataStoreIntrospector *)v99 sortedPosterUUIDsForRole:*MEMORY[0x1E4F924F0] error:0];
    if ([v52 count])
    {
      v84 = v52;
      v82 = self;
      CGFloat v53 = objc_opt_new();
      unint64_t v54 = 0x1E4F92000;
      v92 = p_lock;
      v83 = v31;
      if (v49)
      {
        v96 = [v49 UIColor];
        long long v55 = objc_opt_new();
        [v55 setAccentColor:v96];
        uint64_t v56 = (void *)MEMORY[0x1E4F92328];
        long long v57 = NSNumber;
        [v55 variation];
        CGRect v58 = objc_msgSend(v57, "numberWithDouble:");
        CGRect v59 = NSNumber;
        [v55 saturation];
        CGRect v60 = objc_msgSend(v59, "numberWithDouble:");
        CGRect v61 = NSNumber;
        [v55 luminance];
        CGRect v62 = objc_msgSend(v61, "numberWithDouble:");
        CGRect v63 = [v56 posterUpdateHomeScreenTintWithVariation:v58 saturation:v60 luminance:v62];
        objc_msgSend(v53, "bs_safeAddObject:", v63);

        unint64_t v54 = 0x1E4F92000uLL;
        id v15 = 0;
        unint64_t v34 = v95;

        long long v31 = v83;
      }
      v97 = v53;
      unint64_t v64 = v54;
      if (v87)
      {
        v65 = objc_msgSend(*(id *)(v54 + 808), "posterUpdateHomeScreenAppearanceDimWithValue:", objc_msgSend(v87, "BOOLValue"));
        objc_msgSend(v97, "bs_safeAddObject:", v65);
      }
      if (v86)
      {
        uint64_t v66 = *(void **)(v64 + 808);
        v67 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v86, "isEqual:", *MEMORY[0x1E4F92738]));
        v68 = [v66 posterUpdateShouldUseLargeHomeScreenIcons:v67];
        objc_msgSend(v97, "bs_safeAddObject:", v68);
      }
      if (v85)
      {
        v69 = objc_msgSend(*(id *)(v64 + 808), "posterUpdateHomeScreenIconUserInterfaceStyle:");
        objc_msgSend(v97, "bs_safeAddObject:", v69);
      }
      if ([v97 count])
      {
        v91 = v33;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        id v70 = v52;
        uint64_t v71 = [v70 countByEnumeratingWithState:&v101 objects:v109 count:16];
        v72 = v97;
        if (v71)
        {
          uint64_t v73 = v71;
          uint64_t v74 = *(void *)v102;
          do
          {
            uint64_t v75 = 0;
            do
            {
              if (*(void *)v102 != v74) {
                objc_enumerationMutation(v70);
              }
              v76 = [(PBFPosterExtensionDataStoreIntrospector *)v99 posterWithUUID:*(void *)(*((void *)&v101 + 1) + 8 * v75)];
              v77 = [v76 _path];
              v78 = [MEMORY[0x1E4F92370] updaterForPath:v77];
              id v100 = 0;
              [v78 applyUpdatesLocally:v72 error:&v100];
              v79 = v100;
              if (v79)
              {
                v80 = PBFLogMigration();
                if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v111 = v79;
                  _os_log_error_impl(&dword_1D31CE000, v80, OS_LOG_TYPE_ERROR, "tint color updates failed to apply: %{public}@", buf, 0xCu);
                }

                v72 = v97;
              }

              ++v75;
            }
            while (v73 != v75);
            uint64_t v73 = [v70 countByEnumeratingWithState:&v101 objects:v109 count:16];
          }
          while (v73);
        }

        id v33 = v91;
        p_lock = v92;
        unint64_t v34 = v95;
        id v15 = 0;
        long long v31 = v83;
      }

      long long v29 = v88;
      self = v82;
      CGFloat v52 = v84;
    }

    goto LABEL_66;
  }
  id v28 = 0;
  long long v29 = v21;
  long long v30 = v20;
LABEL_15:
  long long v31 = v28;
  long long v32 = PBFLogMigration();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    -[PBFPosterExtensionDataStoreXPCServiceGlue server:runMigration:migrationDescriptor:completion:]();
  }
  id v33 = v30;
  unint64_t v34 = v95;
LABEL_18:

  os_unfair_lock_unlock(p_lock);
  uint64_t v35 = PBFLogMigration();
  double v36 = v35;
  if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v36, OS_SIGNPOST_INTERVAL_END, spid, "Migration", "", buf, 2u);
  }

  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _postDidTearDownNotification];
  if (v94)
  {
    if (v15) {
      id v37 = v15;
    }
    else {
      id v37 = v31;
    }
    ((void (**)(id, id))v94)[2](v94, v37);
  }
}

- (void)server:(id)a3 clearMigrationFlags:(id)a4
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a4;
  uint64_t v6 = 0;
  uint64_t v5 = [(id)objc_opt_class() _clearMigrationFlagsWithError:&v6];
  v4[2](v4, v5, v6);
}

- (void)server:(id)a3 updatePosterConfigurationMatchingUUID:(id)a4 updates:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = 0;
  id v11 = a6;
  id v12 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v14];
  id v13 = v12;
  if (v12) {
    [v12 updatePosterConfigurationMatchingUUID:v9 updates:v10 completion:v11];
  }
  else {
    (*((void (**)(id, void, void, uint64_t))v11 + 2))(v11, 0, 0, v14);
  }
}

- (void)server:(id)a3 updatePosterConfiguration:(id)a4 updates:(id)a5 completion:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v20 = 0;
  id v12 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:&v20];
  id v13 = v20;
  if (v12)
  {
    if (v9)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F92638]);
      id v15 = [v9 _path];
      id v16 = (void *)[v14 _initWithPath:v15];

      [v12 updatePosterConfiguration:v16 updates:v10 completion:v11];
    }
    else
    {
      id v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28588];
      v22[0] = @"nil configuration specified";
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      os_signpost_id_t v19 = objc_msgSend(v17, "pbf_generalErrorWithCode:userInfo:", 1, v18);
      (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v19);
    }
  }
  else
  {
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v13);
  }
}

- (void)server:(id)a3 fetchArchivedDataStoreNamesWithCompletion:(id)a4
{
  uint64_t v5 = (void (**)(id, void *, void))a4;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_archivedDataStoreBaseURL");
  id v7 = [[PBFDataStoreArchiveAdjudicator alloc] initWithDataStoreBaseURL:v9 archiveBaseURL:v6];
  id v8 = [(PBFDataStoreArchiveAdjudicator *)v7 archiveNames];
  v5[2](v5, v8, 0);
}

- (void)_stashCurrentDataStoreWithName:(id)a3 url:(id)a4 options:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  os_unfair_lock_lock(&self->_lock);
  id v30 = 0;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_teardownDataStoreWithError:&v30];
  id v13 = v30;
  if (v13)
  {
    os_unfair_lock_unlock(&self->_lock);
    *a6 = v13;
  }
  else
  {
    uint64_t v26 = a6;
    id v27 = v10;
    id v14 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
    id v15 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_archivedDataStoreBaseURL");
    id v16 = [[PBFPosterExtensionDataStoreMigrator alloc] initWithBaseURL:v14];
    [(PBFPosterExtensionDataStoreMigrator *)v16 archiveDataStoresBeforeCurrentDataStoreVersion];
    id v17 = [(PBFPosterExtensionDataStoreMigrator *)v16 availableDataStoreVersions];
    uint64_t v18 = [v17 lastIndex];

    os_signpost_id_t v19 = [[PBFDataStoreArchiveAdjudicator alloc] initWithDataStoreBaseURL:v14 archiveBaseURL:v15];
    id v20 = v19;
    if (v11)
    {
      uint64_t v28 = 0;
      uint64_t v21 = (id *)&v28;
      id v22 = [(PBFDataStoreArchiveAdjudicator *)v19 archiveDataStoreVersion:v18 toURL:v11 options:v12 removeAfterSuccess:0 error:&v28];
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v21 = (id *)&v29;
      id v23 = [(PBFDataStoreArchiveAdjudicator *)v19 archiveDataStoreVersion:v18 name:v27 options:v12 removeAfterSuccess:0 error:&v29];
    }
    id v24 = *v21;

    os_unfair_lock_unlock(&self->_lock);
    id v25 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _dataStoreWithError:0];
    if (v24)
    {
      id v10 = v27;
      if (v26) {
        id *v26 = v24;
      }
    }
    else
    {
      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _postDidTearDownNotification];
      id v10 = v27;
    }
  }
}

- (void)server:(id)a3 stashCurrentDataStoreWithName:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v10 = 0;
  id v9 = (void (**)(id, void))a6;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _stashCurrentDataStoreWithName:a4 url:0 options:a5 withError:&v10];
  v9[2](v9, v10);
}

- (void)server:(id)a3 restoreArchivedDataStoreNamed:(id)a4 backupExistingDataStore:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a6;
  os_unfair_lock_lock(&self->_lock);
  id v23 = 0;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_teardownDataStoreWithError:&v23];
  id v11 = v23;
  if (v11)
  {
    os_unfair_lock_unlock(&self->_lock);
    v10[2](v10, v11);
  }
  else
  {
    id v12 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
    id v13 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_archivedDataStoreBaseURL");
    id v14 = [[PBFPosterExtensionDataStoreMigrator alloc] initWithBaseURL:v12];
    [(PBFPosterExtensionDataStoreMigrator *)v14 archiveDataStoresBeforeCurrentDataStoreVersion];

    id v15 = [[PBFDataStoreArchiveAdjudicator alloc] initWithDataStoreBaseURL:v12 archiveBaseURL:v13];
    id v16 = [(PBFDataStoreArchiveAdjudicator *)v15 archiveForName:v9];
    id v22 = 0;
    [(PBFDataStoreArchiveAdjudicator *)v15 restoreArchive:v16 backupExistingDataStoreIfPossible:v7 error:&v22];
    id v17 = v22;

    if (!v17) {
      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_reapTransientData:1];
    }
    id v21 = 0;
    id v18 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _lock_dataStoreWithError:&v21];
    id v19 = v21;
    os_unfair_lock_unlock(&self->_lock);
    if (v17) {
      id v20 = v17;
    }
    else {
      id v20 = v19;
    }
    v10[2](v10, v20);

    if (!v20) {
      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _postDidTearDownNotification];
    }

    uint64_t v10 = (void (**)(id, id))v17;
  }
}

- (void)server:(id)a3 deleteArchivedDataStoreNamed:(id)a4 completion:(id)a5
{
  BOOL v7 = (void (**)(id, id))a5;
  id v8 = a4;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_archivedDataStoreBaseURL");
  id v11 = [[PBFDataStoreArchiveAdjudicator alloc] initWithDataStoreBaseURL:v9 archiveBaseURL:v10];
  id v12 = [(PBFDataStoreArchiveAdjudicator *)v11 archiveForName:v8];

  id v14 = 0;
  [(PBFDataStoreArchiveAdjudicator *)v11 deleteArchive:v12 error:&v14];
  id v13 = v14;

  v7[2](v7, v13);
}

- (void)server:(id)a3 exportArchivedDataStoreNamed:(id)a4 completion:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  BOOL v7 = (void (**)(id, void *, id))a5;
  id v8 = a4;
  id v9 = [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _baseDataStoreURL];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_archivedDataStoreBaseURL");
  id v11 = [[PBFDataStoreArchiveAdjudicator alloc] initWithDataStoreBaseURL:v9 archiveBaseURL:v10];
  id v12 = [(PBFDataStoreArchiveAdjudicator *)v11 archiveForName:v8];

  if (v12)
  {
    id v13 = (void *)MEMORY[0x1E4F1C9B8];
    id v14 = [v12 archiveURL];
    id v18 = 0;
    id v15 = [v13 dataWithContentsOfURL:v14 options:8 error:&v18];
    id v16 = v18;
  }
  else
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28588];
    v20[0] = @"Data store could not be exported for an unknown reason which evades all possible explanation.";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    objc_msgSend(v17, "pbf_generalErrorWithCode:userInfo:", 0, v14);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = 0;
  }

  v7[2](v7, v15, v16);
}

- (void)server:(id)a3 exportCurrentDataStoreToURL:(id)a4 options:(id)a5 sandboxToken:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = v15;
  if (v15)
  {
    [v15 bytes];
    uint64_t v17 = sandbox_extension_consume();
  }
  else
  {
    uint64_t v17 = -1;
  }
  id v20 = 0;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _stashCurrentDataStoreWithName:0 url:v13 options:v14 withError:&v20];
  id v18 = v20;
  if (v17 != -1) {
    sandbox_extension_release();
  }
  id v19 = v18;
  *a7 = v19;
}

- (void)server:(id)a3 ignoreExtension:(id)a4 completion:(id)a5
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__PBFPosterExtensionDataStoreXPCServiceGlue_server_ignoreExtension_completion___block_invoke;
  v9[3] = &unk_1E6984AC0;
  id v10 = v7;
  id v8 = v7;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _handleLaunchServicesUpdates:v9 completion:a5];
}

uint64_t __79__PBFPosterExtensionDataStoreXPCServiceGlue_server_ignoreExtension_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_ignoreExtension:", *(void *)(a1 + 32));
}

- (void)server:(id)a3 unignoreExtension:(id)a4 completion:(id)a5
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PBFPosterExtensionDataStoreXPCServiceGlue_server_unignoreExtension_completion___block_invoke;
  v9[3] = &unk_1E6984AC0;
  id v10 = v7;
  id v8 = v7;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _handleLaunchServicesUpdates:v9 completion:a5];
}

uint64_t __81__PBFPosterExtensionDataStoreXPCServiceGlue_server_unignoreExtension_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_unignoreExtension:", *(void *)(a1 + 32));
}

- (void)_performPublisherChangeForDataStore:(id)a3 block:(id)a4
{
  id v8 = (PBFPosterExtensionDataStore *)a3;
  uint64_t v6 = (void (**)(id, PBFWallpaperPublisher *))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v8 && self->_lock_dataStore == v8)
  {
    os_unfair_lock_lock(&self->_publisherUpdateLock);
    os_unfair_lock_unlock(&self->_lock);
    v6[2](v6, self->_wallpaperPublisher);
    p_lock = &self->_publisherUpdateLock;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)posterExtensionDataStore:(id)a3 didInitializeWithSwitcherConfiguration:(id)a4 withChanges:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __121__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeWithSwitcherConfiguration_withChanges___block_invoke;
    v12[3] = &unk_1E6984AE8;
    id v13 = v9;
    BOOL v14 = a5;
    id v10 = v9;
    [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _performPublisherChangeForDataStore:v8 block:v12];
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"switcherConfig"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreXPCServiceGlue posterExtensionDataStore:didInitializeWithSwitcherConfiguration:withChanges:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __121__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeWithSwitcherConfiguration_withChanges___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) selectedConfiguration];
  uint64_t v4 = [*(id *)(a1 + 32) homeScreenPosterConfigurationForPosterConfiguration:v3];
  uint64_t v5 = [*(id *)(a1 + 32) activeConfiguration];
  uint64_t v6 = [*(id *)(a1 + 32) homeScreenPosterConfigurationForPosterConfiguration:v5];
  id v7 = [v3 _path];
  id v8 = [v4 _path];
  id v9 = v8;
  if (!v8)
  {
    id v9 = [v3 _path];
  }
  id v10 = [v5 _path];
  id v11 = [v6 _path];
  if (v11)
  {
    [v14 activateWithSelectedLockPath:v7 selectedHomePath:v9 activeLockPath:v10 activeHomePath:v11 recentlyChanged:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    [v5 _path];
    id v12 = v13 = v4;
    [v14 activateWithSelectedLockPath:v7 selectedHomePath:v9 activeLockPath:v10 activeHomePath:v12 recentlyChanged:*(unsigned __int8 *)(a1 + 40)];

    uint64_t v4 = v13;
  }

  if (!v8) {
}
  }

- (void)posterExtensionDataStore:(id)a3 didInitializeActivePosters:(id)a4 posterCollections:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke;
  v22[3] = &unk_1E6984B10;
  id v12 = v11;
  id v23 = v12;
  [v9 enumerateKeysAndObjectsUsingBlock:v22];

  id v13 = objc_opt_new();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke_2;
  v20[3] = &unk_1E69818B8;
  id v14 = v13;
  id v21 = v14;
  [v8 enumerateKeysAndObjectsUsingBlock:v20];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke_4;
  v17[3] = &unk_1E6984B38;
  id v18 = v12;
  id v19 = v14;
  id v15 = v14;
  id v16 = v12;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _performPublisherChangeForDataStore:v10 block:v17];
}

void __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 _path];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(a3, "bs_map:", &__block_literal_global_302);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _path];
}

void __115__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didInitializeActivePosters_posterCollections___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 activatePublishingOfRoles:v3];
  [v4 activatePublishingOfCollectionsForRole:*(void *)(a1 + 40)];
}

- (void)posterExtensionDataStore:(id)a3 activePostersWereUpdatedForRoles:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_activePostersWereUpdatedForRoles___block_invoke;
  v13[3] = &unk_1E6984B10;
  id v9 = v8;
  id v14 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_activePostersWereUpdatedForRoles___block_invoke_2;
  v11[3] = &unk_1E6984B60;
  id v12 = v9;
  id v10 = v9;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _performPublisherChangeForDataStore:v7 block:v11];
}

void __103__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_activePostersWereUpdatedForRoles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 _path];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t __103__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_activePostersWereUpdatedForRoles___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 issueUpdateForRoles:*(void *)(a1 + 32)];
}

- (void)posterExtensionDataStore:(id)a3 posterCollectionsWereUpdatedForRoles:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterCollectionsWereUpdatedForRoles___block_invoke;
  v13[3] = &unk_1E69818B8;
  id v9 = v8;
  id v14 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterCollectionsWereUpdatedForRoles___block_invoke_3;
  v11[3] = &unk_1E6984B60;
  id v12 = v9;
  id v10 = v9;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _performPublisherChangeForDataStore:v7 block:v11];
}

void __107__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterCollectionsWereUpdatedForRoles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(a3, "bs_map:", &__block_literal_global_305);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t __107__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterCollectionsWereUpdatedForRoles___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _path];
}

uint64_t __107__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterCollectionsWereUpdatedForRoles___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 issuePosterCollectionUpdate:*(void *)(a1 + 32)];
}

- (void)posterExtensionDataStore:(id)a3 didUpdateSelectedConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id v14 = v13;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __132__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke;
    v18[3] = &unk_1E6984B38;
    id v19 = v11;
    id v20 = v12;
    id v15 = v12;
    id v16 = v11;
    [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _performPublisherChangeForDataStore:v10 block:v18];
  }
  else
  {
    uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"newlySelectedConfiguration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreXPCServiceGlue posterExtensionDataStore:didUpdateSelectedConfiguration:associatedConfiguration:reason:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __132__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) _path];
  id v4 = [*(id *)(a1 + 40) _path];
  if (v4)
  {
    [v6 updateSelectedLockPath:v3 selectedHomePath:v4 activeLockPath:0 activeHomePath:0];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _path];
    [v6 updateSelectedLockPath:v3 selectedHomePath:v5 activeLockPath:0 activeHomePath:0];
  }
}

- (void)posterExtensionDataStore:(id)a3 didUpdateActiveConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id v14 = v13;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __130__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke;
    v18[3] = &unk_1E6984B38;
    id v19 = v11;
    id v20 = v12;
    id v15 = v12;
    id v16 = v11;
    [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _performPublisherChangeForDataStore:v10 block:v18];
  }
  else
  {
    uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"newlyActivatedConfiguration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreXPCServiceGlue posterExtensionDataStore:didUpdateActiveConfiguration:associatedConfiguration:reason:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __130__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) _path];
  id v4 = [*(id *)(a1 + 40) _path];
  if (v4)
  {
    [v6 updateSelectedLockPath:0 selectedHomePath:0 activeLockPath:v3 activeHomePath:v4];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _path];
    [v6 updateSelectedLockPath:0 selectedHomePath:0 activeLockPath:v3 activeHomePath:v5];
  }
}

- (void)posterExtensionDataStore:(id)a3 didUpdateConfiguration:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateConfiguration___block_invoke;
  v8[3] = &unk_1E6984B60;
  id v9 = v6;
  id v7 = v6;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _performPublisherChangeForDataStore:a3 block:v8];
}

void __93__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _path];
  [v3 updatePath:v4];
}

- (void)posterExtensionDataStore:(id)a3 posterConfiguration:(id)a4 didUpdateAssociatedHomeScreenPosterConfigurationTo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __141__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterConfiguration_didUpdateAssociatedHomeScreenPosterConfigurationTo___block_invoke;
  v12[3] = &unk_1E6984B38;
  id v13 = v9;
  id v14 = v8;
  id v10 = v8;
  id v11 = v9;
  [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _performPublisherChangeForDataStore:a3 block:v12];
}

void __141__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_posterConfiguration_didUpdateAssociatedHomeScreenPosterConfigurationTo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 _path];
  id v5 = [*(id *)(a1 + 40) _path];
  [v4 updateHomePath:v6 matchingLockPath:v5];
}

- (void)posterExtensionDataStore:(id)a3 didUpdateSnapshotForPath:(id)a4 forDefinition:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isServerPosterPath])
  {
    id v11 = [v9 identity];
    uint64_t v12 = [v11 type];

    if (v12 == 3)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __109__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateSnapshotForPath_forDefinition___block_invoke;
      v13[3] = &unk_1E6984B38;
      id v14 = v9;
      id v15 = v10;
      [(PBFPosterExtensionDataStoreXPCServiceGlue *)self _performPublisherChangeForDataStore:v8 block:v13];
    }
  }
}

void __109__PBFPosterExtensionDataStoreXPCServiceGlue_posterExtensionDataStore_didUpdateSnapshotForPath_forDefinition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 uniqueIdentifier];
  [v4 noteSnapshotUpdateForPath:v2 snapshotType:v5];
}

- (void)wallpaperPublisherDidReceiveObserverConnection
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "wallpaperPublisherDidReceiveObserverConnection: could not initialize data store: %{public}@", v2, v3, v4, v5, v6);
}

- (PRSServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_wallpaperPublisher, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_lock_dataStore, 0);
  objc_storeStrong((id *)&self->_lock_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_lock_runtimeAssertionManager, 0);
}

void __61__PBFPosterExtensionDataStoreXPCServiceGlue_initWithOptions___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint8_t v6 = NSStringFromClass(v5);
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = 138544642;
  id v9 = v4;
  __int16 v10 = 2114;
  id v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = v7;
  __int16 v14 = 2114;
  id v15 = @"PBFPosterExtensionDataStoreXPCServiceGlue.m";
  __int16 v16 = 1024;
  int v17 = 128;
  __int16 v18 = 2114;
  uint64_t v19 = a2;
  _os_log_fault_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)_lock_dataStoreWithError:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Bootstrap RBSAssertion could not be acquired: %{public}@", v2, v3, v4, v5, v6);
}

void __70__PBFPosterExtensionDataStoreXPCServiceGlue__lock_dataStoreWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Bootstrap RBSAssertion invalidated: %{public}@", v2, v3, v4, v5, v6);
}

- (void)server:deleteSnapshots:completion:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "deleteSnapshots encountered an error: %@", v2, v3, v4, v5, v6);
}

void __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_10_0(&dword_1D31CE000, v0, v1, "(light? something?) -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]'s failure handler was called.", v2, v3, v4, v5, v6);
}

void __69__PBFPosterExtensionDataStoreXPCServiceGlue__lock_runLegacyMigration__block_invoke_96_cold_1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_10_0(&dword_1D31CE000, v0, v1, "(PBUIWallpaperModeDark) -[PBUIWallpaperConfigurationManager performMigrationWithFailureHandler:]'s failure handler was called.", v2, v3, v4, v5, v6);
}

- (void)_lock_reapTransientData:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_reapSnapshots:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __65__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapSnapshots___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "reapSnapshots encountered an error: %@", v2, v3, v4, v5, v6);
}

void __66__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapDescriptors__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "reapDescriptors encountered an error: %@", v2, v3, v4, v5, v6);
}

void __76__PBFPosterExtensionDataStoreXPCServiceGlue__lock_reapExtensionProviderInfo__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "reapExtensionProviderInfo encountered an error: %@", v2, v3, v4, v5, v6);
}

- (void)_lock_performNecessaryMigrationsForDataStoreAtURL:shouldForce:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_lock_performNecessaryMigrationsForDataStoreAtURL:(void *)a1 shouldForce:(NSObject *)a2 error:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 descriptionWithMultilinePrefix:0];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "Migration RBSAssertion could not be acquired: %{public}@", v4, 0xCu);
}

- (void)_localeDidChange:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_10_0(&dword_1D31CE000, v0, v1, "[_localeDidChange] XPC server invalidated, data store cancelled long running.  Calling xpc_transaction_exit_clean()", v2, v3, v4, v5, v6);
}

- (void)_localeDidChange:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_10_0(&dword_1D31CE000, v0, v1, "[_localeDidChange] Locale changes did occur; cancelling long running operation and preparing for xpc_transaction_exit_clean()",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __62__PBFPosterExtensionDataStoreXPCServiceGlue__localeDidChange___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_10_0(&dword_1D31CE000, v0, v1, "[_localeDidChange] Calling xpc_transaction_exit_clean()", v2, v3, v4, v5, v6);
}

- (void)server:exportPosterConfigurationMatchingUUID:completion:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Failed to remove archive file: %@", v2, v3, v4, v5, v6);
}

- (void)_hasComplicationsForPosterConfiguration:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 description];
  OUTLINED_FUNCTION_7();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1D31CE000, a3, OS_LOG_TYPE_ERROR, "Failed to load complication layout for poster configuration '%@': %@", v6, 0x16u);
}

- (void)server:removeAllFocusConfigurationsMatchingFocusUUID:completion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Could not update data store after removing all Focus configurations for mode: %{public}@, error: %{public}@");
}

- (void)server:notifyFocusModeDidChange:completion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Failed to update switcher configuration for mode change '%{public}@': %{public}@");
}

- (void)server:notifyActiveChargerIdentifierDidUpdate:completion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Failed to update data store for activeChargerIdentifier update to '%{public}@': %{public}@");
}

- (void)server:runMigration:migrationDescriptor:completion:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Post-migration bailed; failed to migrate: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)posterExtensionDataStore:didInitializeWithSwitcherConfiguration:withChanges:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)posterExtensionDataStore:didUpdateSelectedConfiguration:associatedConfiguration:reason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)posterExtensionDataStore:didUpdateActiveConfiguration:associatedConfiguration:reason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end