@interface PBFPosterExtensionDataStore
+ (FCActivityManager)sharedActivityManager;
+ (id)dataStoreExtensionContainerURLForBaseURL:(id)a3;
+ (id)galleryCacheURLForBaseURL:(id)a3;
+ (int64_t)dataStoreVersion;
+ (int64_t)defaultMaximumPosterConfigurationCount;
+ (int64_t)minimumDataStoreVersion;
- (BOOL)_extensionsInputIsValid;
- (BOOL)_forceExtensionUpdate:(id)a3;
- (BOOL)_stateLock_canPersistNewPosterConfiguration;
- (BOOL)_stateLock_cleanupAfterDeletedExtension:(id)a3 error:(id *)a4;
- (BOOL)_stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:(id)a3 waitForPushToProactive:(BOOL)a4 error:(id *)a5;
- (BOOL)_stateLock_executeDataStoreUpdateWithChanges:(id)a3 diffs:(id *)a4 options:(unint64_t)a5 reason:(id)a6 context:(id)a7 error:(id *)a8;
- (BOOL)_stateLock_hasBeenUnlockedSinceBoot;
- (BOOL)_stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier:(id)a3 preReloadDescriptors:(id)a4 postReloadDescriptors:(id)a5 error:(id *)a6;
- (BOOL)_stateLock_issueDescriptorUpdatedEventsForExtension:(id)a3 preUpdate:(id)a4 postUpdate:(id)a5 error:(id *)a6;
- (BOOL)_stateLock_processEvents:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)_stateLock_processEvents:(id)a3 roles:(id)a4 context:(id)a5 error:(id *)a6;
- (BOOL)_stateLock_setupEnvironmentForExtension:(id)a3 wasUpdated:(BOOL *)a4 error:(id *)a5;
- (BOOL)_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:(id)a3 reason:(int64_t)a4 error:(id *)a5;
- (BOOL)_stateLock_updateEnvironmentForExtension:(id)a3 fromExtension:(id)a4 error:(id *)a5;
- (BOOL)canPersistNewPosterConfiguration;
- (BOOL)deletePosterConfigurationsMatchingUUID:(id)a3 error:(id *)a4;
- (BOOL)deletePosterDescriptorsForExtensionBundleIdentifier:(id)a3 error:(id *)a4;
- (BOOL)executeDataStoreUpdateWithChanges:(id)a3 diffs:(id *)a4 options:(unint64_t)a5 reason:(id)a6 error:(id *)a7;
- (BOOL)markPosterConfigurationAsActive:(id)a3 forRole:(id)a4;
- (BOOL)resetRole:(id)a3 error:(id *)a4;
- (BOOL)togglePosterConfigurationHiddenMatchingUUID:(id)a3 error:(id *)a4;
- (BOOL)updateDataStoreForIncomingActiveChargerIdentifierUpdate:(id)a3 error:(id *)a4;
- (BOOL)updateDataStoreForIncomingAvailableFocusModeChange:(id)a3 error:(id *)a4;
- (BOOL)updateDataStoreForIncomingFocusModeChange:(id)a3 error:(id *)a4;
- (BOOL)updateSelectedPosterUUID:(id)a3 role:(id)a4 from:(id)a5 error:(id *)a6;
- (NSArray)knownExtensions;
- (NSURL)URL;
- (NSURL)extensionStoreCoordinatorContainerURL;
- (NSURL)galleryCacheURL;
- (PBFGalleryConfiguration)currentGalleryConfiguration;
- (PBFPosterExtensionDataStore)initWithURL:(id)a3 runtimeAssertionProvider:(id)a4 extensionProvider:(id)a5 observer:(id)a6 wasMigrationJustPerformed:(BOOL)a7 applicationStateMonitor:(id)a8 error:(id *)a9;
- (PBFPosterExtensionDataStoreAssertionManager)assertionManager;
- (PBFPosterSnapshotManager)snapshotManager;
- (PFPosterExtensionProvider)extensionProvider;
- (PRSwitcherConfiguration)switcherConfiguration;
- (id)_activeActivity;
- (id)_activityModeForFocusUUID:(id)a3;
- (id)_buildRoleCoordinatorTransitionContext;
- (id)_buildRoleCoordinatorTransitionContextForActiveFocusMode:(id)a3 chargerIdentifier:(id)a4;
- (id)_buildRoleCoordinatorTransitionContextForActivity:(id)a3;
- (id)_buildRoleCoordinatorTransitionContextForChargerIdentifier:(id)a3;
- (id)_buildRoleCoordinatorTransitionContextWithDesiredActivePosterUUID:(id)a3 role:(id)a4;
- (id)_buildRoleCoordinatorTransitionNotingInitialUpdate;
- (id)_buildSwitcherConfigurationWithContext:(id)a3;
- (id)_stateLock_buildSwitcherConfigurationWithContext:(id)a3 outMutated:(BOOL *)a4;
- (id)_stateLock_currentGalleryConfiguration;
- (id)_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:(id)a3 reason:(id)a4 powerLogReason:(int64_t)a5 postEnqueueGalleryUpdateOptions:(unint64_t)a6 sessionInfo:(id)a7 completion:(id)a8;
- (id)_stateLock_extensionBundleIdentifierForConfigurationUUID:(id)a3;
- (id)_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:(id)a3;
- (id)_stateLock_extensionStoreCoordinators;
- (id)_stateLock_fetchPosterConfigurations;
- (id)_stateLock_fetchPosterConfigurationsSortedByUse:(BOOL)a3 forRole:(id)a4;
- (id)_stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:(id)a3;
- (id)_stateLock_knownStaticPosterDescriptorsForExtensionBundleIdentifier:(id)a3;
- (id)_stateLock_lastUseDatesForPosterCollection;
- (id)_stateLock_posterConfigurationPathForUUID:(id)a3;
- (id)_stateLock_posterWithUUID:(id)a3 error:(id *)a4;
- (id)_stateLock_prepareReloadConfigurationOperationForExtension:(id)a3 path:(id)a4 locationInUse:(BOOL)a5 sessionInfo:(id)a6 powerLogReason:(int64_t)a7 assetUpdater:(id)a8 error:(id *)a9;
- (id)_stateLock_switcherConfiguration;
- (id)_stateLock_updateDataStoreForSwitcherConfiguration:(id)a3 options:(unint64_t)a4 reason:(id)a5 error:(id *)a6;
- (id)acquireEditingSessionAssertionForProvider:(id)a3 withReason:(id)a4;
- (id)acquireExtensionInstance:(id)a3 reason:(id)a4 error:(id *)a5;
- (id)acquireSnapshotterDisabledAssertionForProvider:(id)a3 withReason:(id)a4;
- (id)acquireSnapshotterInUseAssertionWithReason:(id)a3;
- (id)activeEditingSessionAssertionExtensionIdentifiers;
- (id)activePosterConfigurationForRole:(id)a3 assocPoster:(id *)a4;
- (id)activePosterConfigurations;
- (id)activePosterForRole:(id)a3 assocPoster:(id *)a4 error:(id *)a5;
- (id)activeSnapshotterInUseAssertionReasons;
- (id)buildExtensionProvider;
- (id)buildPrewarmPlanWithIdentifier:(id)a3 refreshStrategy:(int64_t)a4 galleryUpdateOptions:(unint64_t)a5 powerLogReason:(int64_t)a6 cleanupOldResources:(BOOL)a7 prewarmDisplayContext:(id)a8;
- (id)dataFreshnessForComponents:(id)a3;
- (id)dataFreshnessForComponents:(id)a3 refreshStrategy:(int64_t)a4;
- (id)defaultInstanceForExtensionIdentifier:(id)a3;
- (id)exportPosterConfigurationMatchingUUID:(id)a3 error:(id *)a4;
- (id)extensionStoreCoordinators;
- (id)fetchPosterConfigurationsSortedByUseForRole:(id)a3;
- (id)pbf_posterExtensionStoreCoordinatorForProviderIdentifier:(id)a3 error:(id *)a4;
- (id)pbf_posterExtensionStoreCoordinatorsForRole:(id)a3;
- (id)pbf_posterSnapshotCoordinatorForIdentity:(id)a3;
- (id)posterCollectionForRole:(id)a3 error:(id *)a4;
- (id)posterConfigurationsForExtension:(id)a3;
- (id)posterConfigurationsForRole:(id)a3 error:(id *)a4;
- (id)posterDescriptorsForExtensionBundleIdentifier:(id)a3 error:(id *)a4;
- (id)posterDescriptorsForOperation:(id)a3;
- (id)posterWithUUID:(id)a3 error:(id *)a4;
- (id)providerForExtensionIdentifier:(id)a3;
- (id)providerForPath:(id)a3;
- (id)selectedPosterForRole:(id)a3 error:(id *)a4;
- (id)staticPosterDescriptorsForExtensionBundleIdentifier:(id)a3 error:(id *)a4;
- (id)updateDataStoreForSwitcherConfiguration:(id)a3 options:(unint64_t)a4 reason:(id)a5 error:(id *)a6;
- (id)updateDataStoreForSwitcherConfiguration:(id)a3 reason:(id)a4 error:(id *)a5;
- (int64_t)_stateLock_maximumPosterConfigurationCount;
- (int64_t)maximumPosterConfigurationCount;
- (unint64_t)activeSnapshotterInUseAssertionCount;
- (void)_finishUpdateExtensionUpdateWithOptions:(unint64_t)a3 updateExtensionSession:(id)a4 pushToProactiveError:(id)a5 didUpdateProactiveDescriptors:(BOOL)a6;
- (void)_ingestRefreshPosterConfiguration:(id)a3 completion:(id)a4;
- (void)_notifyObserversDidAddConfiguration:(id)a3;
- (void)_notifyObserversDidDeleteConfiguration:(id)a3;
- (void)_notifyObserversDidInitializeRoles:(id)a3 roleToPosterCollection:(id)a4;
- (void)_notifyObserversDidInitializeWithSwitcherConfiguration:(id)a3 withChanges:(BOOL)a4;
- (void)_notifyObserversDidUpdateActiveConfiguration:(id)a3 associatedConfiguration:(id)a4 reason:(id)a5;
- (void)_notifyObserversDidUpdateActivePosterForRoles:(id)a3;
- (void)_notifyObserversDidUpdateConfiguration:(id)a3;
- (void)_notifyObserversDidUpdateConfiguration:(id)a3 homeScreenAssociatedConfiguration:(id)a4;
- (void)_notifyObserversDidUpdateConfigurations;
- (void)_notifyObserversDidUpdateExtensions;
- (void)_notifyObserversDidUpdateGalleryConfiguration:(id)a3;
- (void)_notifyObserversDidUpdatePosterCollectionsForRoles:(id)a3;
- (void)_notifyObserversDidUpdatePosterDescriptorsForExtensionBundleIdentifier:(id)a3;
- (void)_notifyObserversDidUpdateSelectedConfiguration:(id)a3 associatedConfiguration:(id)a4 reason:(id)a5;
- (void)_notifyObserversDidUpdateSnapshotForConfiguration:(id)a3;
- (void)_notifyObserversDidUpdateSwitcherConfiguration:(id)a3;
- (void)_setupExtensionEnvironment;
- (void)_setupExtensionProvider;
- (void)_setupGalleryEnvironment;
- (void)_stateLock_applyUpdatesAndIngestConfiguration:(id)a3 toPath:(id)a4 powerLogReason:(int64_t)a5 completion:(id)a6;
- (void)_stateLock_cleanupStaleSnapshotsNotWithinGallery:(id)a3 completion:(id)a4;
- (void)_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:(id)a3 toPath:(id)a4 powerLogReason:(int64_t)a5 completion:(id)a6;
- (void)_stateLock_createTemporaryPosterConfigurationForPosterMatchingUUID:(id)a3 andApplyUpdates:(id)a4 completion:(id)a5;
- (void)_stateLock_duplicatePosterConfigurationMatchingUUID:(id)a3 completion:(id)a4;
- (void)_stateLock_enqueueRefreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 powerLogReason:(int64_t)a5 completion:(id)a6;
- (void)_stateLock_enumerateConfigurationStoreCoordinators:(id)a3;
- (void)_stateLock_enumerateExtensionStoreCoordinators:(id)a3;
- (void)_stateLock_executeExtensionUpdate:(id)a3;
- (void)_stateLock_fetchPosterSnapshotsWithClientRequest:(id)a3 completion:(id)a4;
- (void)_stateLock_findStoreCoordinatorsForUUID:(id)a3 extensionStoreCoordinator:(id *)a4 configurationStoreCoordinator:(id *)a5;
- (void)_stateLock_hasBeenUnlockedSinceBoot;
- (void)_stateLock_initialRoleCoordinatorSetup;
- (void)_stateLock_processIncomingPosterConfiguration:(id)a3 completion:(id)a4;
- (void)_stateLock_pushPosterConfigurationsToProactiveWithCompletion:(id)a3;
- (void)_stateLock_pushPosterDescriptorsToProactiveForReason:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_stateLock_pushUpdateNotificationsForRole:(id)a3 diff:(id)a4 previouslyActiveConfiguration:(id)a5 newActiveConfiguration:(id)a6 options:(unint64_t)a7 reason:(id)a8 context:(id)a9;
- (void)_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:(id)a3 roleCoordinator:(id)a4 context:(id)a5;
- (void)_stateLock_setupRoleCoordinatorsIfNeeded;
- (void)_stateLock_updateExtensions:(id)a3 refreshDescriptors:(int64_t)a4 powerLogReason:(int64_t)a5 galleryUpdateOptions:(unint64_t)a6 queuedUpOperations:(id *)a7;
- (void)_stateLock_updateFocusModeForActivePosterChange;
- (void)_stateLock_updateGalleryWithSuggestedLayout:(id)a3 descriptorsByExtensionBundleIdentifier:(id)a4 staticDescriptorsByExtensionBundleIdentifier:(id)a5;
- (void)_stateLock_updatePosterConfiguration:(id)a3 updates:(id)a4 completion:(id)a5;
- (void)_stateLock_updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5;
- (void)_transitionToNewSwitcherConfigurationIfNeededForReason:(id)a3 error:(id *)a4;
- (void)_updateActiveActivity:(id)a3 active:(BOOL)a4 reason:(id)a5;
- (void)addBehaviorAssertionObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)assertionManager:(id)a3 identityIsNowMarkedAsInUse:(id)a4;
- (void)assertionManager:(id)a3 identityIsNowMarkedAsNOTInUse:(id)a4;
- (void)assertionProviderDidAcquireInUseAssertion:(id)a3;
- (void)assertionProviderDidRelinquishInUseAssertion:(id)a3;
- (void)cancel;
- (void)checkForGalleryUpdatesAndPrewarmSnapshots;
- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 completion:(id)a5;
- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 role:(id)a5 completion:(id)a6;
- (void)createTemporaryPosterConfigurationForPosterMatchingUUID:(id)a3 andApplyUpdates:(id)a4 completion:(id)a5;
- (void)duplicatePosterConfigurationMatchingUUID:(id)a3 completion:(id)a4;
- (void)enqueueGalleryConfigurationUpdateWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 completion:(id)a5;
- (void)enumerateExtensionStoreCoordinators:(id)a3;
- (void)executeUpdate:(id)a3 refreshStrategy:(int64_t)a4 galleryUpdateOptions:(unint64_t)a5 powerLogReason:(int64_t)a6 cleanupOldResources:(BOOL)a7 completion:(id)a8;
- (void)fetchCurrentGalleryConfiguration:(id)a3;
- (void)fetchGalleryConfigurationWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)fetchGallerySnapshotForConfiguration:(id)a3 context:(id)a4 completion:(id)a5;
- (void)fetchHomeScreenAssociatedPosterConfigurationForConfigurationUUID:(id)a3 completion:(id)a4;
- (void)fetchPosterSnapshotsForRequest:(id)a3 completion:(id)a4;
- (void)fetchPosterSnapshotsWithClientRequest:(id)a3 completion:(id)a4;
- (void)fetchPosterSuggestionsForFocusModeWithUUID:(id)a3 context:(id)a4 completion:(id)a5;
- (void)fetchSwitcherSnapshotForConfiguration:(id)a3 context:(id)a4 completion:(id)a5;
- (void)galleryController:(id)a3 didUpdateCurrentGalleryConfiguration:(id)a4;
- (void)importPosterConfigurationFromArchiveData:(id)a3 completion:(id)a4;
- (void)ingestSnapshotCollection:(id)a3 forPosterConfigurationUUID:(id)a4 error:(id *)a5;
- (void)invalidate;
- (void)notePosterConfigurationUnderlyingModelDidChange:(id)a3;
- (void)overnightUpdateWithCompletion:(id)a3;
- (void)pbf_enumerateSnapshotCoordinators:(id)a3;
- (void)posterExtensionProvider:(id)a3 updatedExtensionsFrom:(id)a4 to:(id)a5;
- (void)prewarmWithCompletion:(id)a3;
- (void)processEvents:(id)a3 context:(id)a4 QOS:(unsigned int)a5 reason:(id)a6 completion:(id)a7;
- (void)processIncomingPosterConfiguration:(id)a3 completion:(id)a4;
- (void)pushPosterDescriptorsToProactiveForReason:(id)a3 completion:(id)a4;
- (void)pushToProactiveWithCompletion:(id)a3;
- (void)refreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 completion:(id)a5;
- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a3 extensionIdentifier:(id)a4 completion:(id)a5;
- (void)refreshSnapshotForPosterConfigurationMatchUUID:(id)a3 completion:(id)a4;
- (void)relinquishExtensionInstance:(id)a3 reason:(id)a4;
- (void)reloadPosterDescriptorsForExtensionBundleIdentifier:(id)a3 sessionInfo:(id)a4 completion:(id)a5;
- (void)removeBehaviorAssertionObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)roleCoordinatorWasReset:(id)a3 processInitialStateSetupEvents:(id *)a4;
- (void)roleProcessor:(id)a3 transactionFinished:(id)a4 success:(BOOL)a5 results:(id)a6 error:(id)a7;
- (void)setMaximumPosterConfigurationCount:(int64_t)a3;
- (void)snapshotManager:(id)a3 didUpdateSnapshotForPath:(id)a4 forDefinition:(id)a5;
- (void)updateExtensionsAndNotifyWhenComplete:(id)a3;
- (void)updateFocusModeForActivePosterChange;
- (void)updateGallery:(id)a3 completion:(id)a4;
- (void)updatePosterConfiguration:(id)a3 updates:(id)a4 completion:(id)a5;
- (void)updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5;
- (void)updateSnapshotsForGallery:(id)a3 intention:(unint64_t)a4 powerLogReason:(int64_t)a5 completion:(id)a6;
@end

@implementation PBFPosterExtensionDataStore

+ (int64_t)minimumDataStoreVersion
{
  return 59;
}

+ (int64_t)dataStoreVersion
{
  return 61;
}

+ (int64_t)defaultMaximumPosterConfigurationCount
{
  return 200;
}

+ (id)galleryCacheURLForBaseURL:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = a3;
  v6 = objc_msgSend(v4, "pbf_galleryCacheURLForBaseURL:version:", v5, objc_msgSend(a1, "dataStoreVersion"));

  return v6;
}

+ (id)dataStoreExtensionContainerURLForBaseURL:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = a3;
  v6 = objc_msgSend(v4, "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v5, objc_msgSend(a1, "dataStoreVersion"));

  return v6;
}

- (PBFPosterExtensionDataStore)initWithURL:(id)a3 runtimeAssertionProvider:(id)a4 extensionProvider:(id)a5 observer:(id)a6 wasMigrationJustPerformed:(BOOL)a7 applicationStateMonitor:(id)a8 error:(id *)a9
{
  BOOL v93 = a7;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v94 = a8;
  id v18 = v14;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v18)
  {
    v85 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:]();
    }
    [v85 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D737CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v86 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:]();
    }
    [v86 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D73E0);
  }

  id v19 = v16;
  if (v19)
  {
    NSClassFromString(&cfstr_Pfposterextens.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v89 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFPosterExtensionProviderClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:].cold.4();
      }
      [v89 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D31D750CLL);
    }
  }

  id v20 = v15;
  if (!v20)
  {
    v87 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:]();
    }
    [v87 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D7444);
  }
  v21 = v20;
  if (([v20 conformsToProtocol:&unk_1F2AE46C8] & 1) == 0)
  {
    v88 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:]();
    }
    [v88 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D74A8);
  }

  v97.receiver = self;
  v97.super_class = (Class)PBFPosterExtensionDataStore;
  v22 = [(PBFPosterExtensionDataStore *)&v97 init];
  if (!v22) {
    goto LABEL_42;
  }
  id v92 = v17;
  v23 = PBFLogDataStore();
  os_signpost_id_t v24 = os_signpost_id_generate(v23);

  v25 = PBFLogDataStore();
  v26 = v25;
  os_signpost_id_t spid = v24;
  unint64_t v27 = v24 - 1;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_DWORD *)buf = 138543618;
    id v99 = v18;
    __int16 v100 = 1024;
    BOOL v101 = v93;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v26, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PBFPosterExtensionDataStore Init", "URL: %{public}@ wasMigrationJustPerformed: %{BOOL}u", buf, 0x12u);
  }

  objc_storeStrong((id *)&v22->_applicationStateMonitor, a8);
  objc_storeStrong((id *)&v22->_runtimeAssertionProvider, a4);
  objc_storeStrong((id *)&v22->_extensionProvider, a5);
  uint64_t v28 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
  invalidationFlag = v22->_invalidationFlag;
  v22->_invalidationFlag = (BSAtomicFlag *)v28;

  uint64_t v30 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
  isPrewarmingFlag = v22->_isPrewarmingFlag;
  v22->_isPrewarmingFlag = (BSAtomicFlag *)v30;

  uint64_t v32 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
  extensionsCurrentlyUpdatingFlag = v22->_extensionsCurrentlyUpdatingFlag;
  v22->_extensionsCurrentlyUpdatingFlag = (BSAtomicFlag *)v32;

  *(void *)&v22->_extensionProvidingLock._os_unfair_lock_opaque = 0;
  v22->_activePosterLock._os_unfair_lock_opaque = 0;
  uint64_t Serial = BSDispatchQueueCreateSerial();
  notificationQueue = v22->_notificationQueue;
  v22->_notificationQueue = (OS_dispatch_queue *)Serial;

  uint64_t v36 = BSDispatchQueueCreateSerial();
  clientSnapshotRequestQueue = v22->_clientSnapshotRequestQueue;
  v22->_clientSnapshotRequestQueue = (OS_dispatch_queue *)v36;

  uint64_t v38 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:1];
  extensionsInputIsValidAtomicFlag = v22->_extensionsInputIsValidAtomicFlag;
  v22->_extensionsInputIsValidAtomicFlag = (BSAtomicFlag *)v38;

  v40 = objc_alloc_init(PBFPosterExtensionDataStoreAssertionManager);
  assertionManager = v22->_assertionManager;
  v22->_assertionManager = v40;

  [(PBFPosterExtensionDataStoreAssertionManager *)v22->_assertionManager addObserver:v22];
  uint64_t v42 = objc_opt_new();
  stateLock_activePathAssertions = v22->_stateLock_activePathAssertions;
  v22->_stateLock_activePathAssertions = (NSMutableSet *)v42;

  uint64_t v44 = objc_opt_new();
  activePosterLock_roleToActivePosterConfiguration = v22->_activePosterLock_roleToActivePosterConfiguration;
  v22->_activePosterLock_roleToActivePosterConfiguration = (NSMutableDictionary *)v44;

  v22->_stateLock_maximumPosterConfigurationCount = [(id)objc_opt_class() defaultMaximumPosterConfigurationCount];
  if (v93)
  {
    stateLock_wasMigrationJustPerformed = v22->_stateLock_wasMigrationJustPerformed;
    v22->_stateLock_wasMigrationJustPerformed = (NSNumber *)MEMORY[0x1E4F1CC38];
  }
  v47 = [[PBFPosterExtensionDataStoreMigrator alloc] initWithBaseURL:v18];
  if (![(PBFPosterExtensionDataStoreMigrator *)v47 isDataStoreUpToDateForCurrentVersion])
  {
    id v96 = 0;
    unint64_t v48 = [(PBFPosterExtensionDataStoreMigrator *)v47 migrateDataStoreToCurrentVersion:&v96];
    id v49 = v96;
    if (PBFPosterExtensionDataStoreMigratorResultIsFailure(v48))
    {
      if (a9 && v49) {
        *a9 = v49;
      }
      v50 = PBFLogDataStore();
      v51 = v50;
      if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        *(_DWORD *)buf = 138543874;
        id v99 = v18;
        __int16 v100 = 1024;
        BOOL v101 = v93;
        __int16 v102 = 2114;
        id v103 = v49;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v51, OS_SIGNPOST_INTERVAL_END, spid, "PBFPosterExtensionDataStore Init", "URL: %{public}@ wasMigrationJustPerformed: %{BOOL}u -- could not setup data store: %{public}@", buf, 0x1Cu);
      }

LABEL_33:
      v57 = 0;
      id v17 = v92;
LABEL_43:
      v81 = v94;
      goto LABEL_44;
    }
  }
  id v95 = 0;
  BOOL v52 = [(PBFPosterExtensionDataStoreMigrator *)v47 validateDataStoreIntegrity:&v95];
  id v53 = v95;
  v54 = v53;
  if (!v52)
  {
    if (a9 && v53) {
      *a9 = v53;
    }
    v55 = PBFLogDataStore();
    v56 = v55;
    if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_DWORD *)buf = 138543874;
      id v99 = v18;
      __int16 v100 = 1024;
      BOOL v101 = v93;
      __int16 v102 = 2114;
      id v103 = v54;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v56, OS_SIGNPOST_INTERVAL_END, spid, "PBFPosterExtensionDataStore Init", "URL: %{public}@ wasMigrationJustPerformed: %{BOOL}u -- could not validate data store integrity: %{public}@", buf, 0x1Cu);
    }

    goto LABEL_33;
  }
  v90 = v53;
  if (MEMORY[0x1D9433950]("-[PBFPosterExtensionDataStore initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:]"))[(PBFPosterExtensionDataStoreMigrator *)v47 markDataStoreArchivesAsPurgable]; {
  else
  }
    [(PBFPosterExtensionDataStoreMigrator *)v47 removeArchivedDataStores];
  [(PBFPosterExtensionDataStoreMigrator *)v47 removeDataStoresBeforeCurrentDataStoreVersion];

  uint64_t v58 = [v18 copy];
  baseURL = v22->_baseURL;
  v22->_baseURL = (NSURL *)v58;

  uint64_t v60 = objc_opt_new();
  stateLock_descriptorsForExtensionBundleIdentifier = v22->_stateLock_descriptorsForExtensionBundleIdentifier;
  v22->_stateLock_descriptorsForExtensionBundleIdentifier = (NSMutableDictionary *)v60;

  uint64_t v62 = objc_opt_new();
  stateLock_staticDescriptorsForExtensionBundleIdentifier = v22->_stateLock_staticDescriptorsForExtensionBundleIdentifier;
  v22->_stateLock_staticDescriptorsForExtensionBundleIdentifier = (NSMutableDictionary *)v62;

  uint64_t v64 = [(id)objc_opt_class() dataStoreVersion];
  uint64_t v65 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreURLForBaseURL:version:", v22->_baseURL, v64);
  URL = v22->_URL;
  v22->_URL = (NSURL *)v65;

  uint64_t v67 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreExtensionContainerURLForBaseURL:version:", v22->_baseURL, v64);
  extensionStoreCoordinatorContainerURL = v22->_extensionStoreCoordinatorContainerURL;
  v22->_extensionStoreCoordinatorContainerURL = (NSURL *)v67;

  uint64_t v69 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_galleryCacheURLForBaseURL:version:", v22->_baseURL, v64);
  galleryCacheURL = v22->_galleryCacheURL;
  v22->_galleryCacheURL = (NSURL *)v69;

  v71 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreSQLiteDatabaseURLForBaseURL:version:", v22->_baseURL, v64);
  v72 = [[PBFPosterExtensionDataStoreSQLiteDatabase alloc] initWithURL:v71 options:1 error:a9];
  database = v22->_database;
  v22->_database = v72;

  if (v22->_database)
  {
    v74 = [[PBFPosterSnapshotManager alloc] initWithRuntimeAssertionProvider:v22->_runtimeAssertionProvider extensionProvider:v22 modelCoordinatorProvider:v22 applicationStateMonitor:v22->_applicationStateMonitor];
    snapshotManager = v22->_snapshotManager;
    v22->_snapshotManager = v74;

    [(PBFPosterSnapshotManager *)v22->_snapshotManager addObserver:v22];
    [(PBFPosterSnapshotManager *)v22->_snapshotManager addBehaviorAssertionObserver:v22];
    if (v92) {
      -[PBFPosterExtensionDataStore addObserver:](v22, "addObserver:");
    }
    v76 = objc_alloc_init(PBFComplicationSnapshotService);
    complicationSnapshotService = v22->_complicationSnapshotService;
    v22->_complicationSnapshotService = v76;

    [(PBFPosterExtensionDataStore *)v22 _setupExtensionEnvironment];
    [(PBFPosterExtensionDataStore *)v22 _setupExtensionProvider];
    [(PBFPosterExtensionDataStore *)v22 _setupGalleryEnvironment];
    v78 = objc_alloc_init(PBFProactivePosterSwitchNotifier);
    [(PBFPosterExtensionDataStore *)v22 addObserver:v78];
    v79 = PBFLogDataStore();
    v80 = v79;
    if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      *(_DWORD *)buf = 138543618;
      id v99 = v18;
      __int16 v100 = 1024;
      BOOL v101 = v93;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v80, OS_SIGNPOST_INTERVAL_END, spid, "initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:error", "URL: %{public}@ wasMigrationJustPerformed: %{BOOL}u", buf, 0x12u);
    }

    id v17 = v92;
LABEL_42:
    v57 = v22;
    goto LABEL_43;
  }
  v83 = PBFLogDataStore();
  v84 = v83;
  v81 = v94;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
  {
    *(_DWORD *)buf = 138543618;
    id v99 = v18;
    __int16 v100 = 1024;
    BOOL v101 = v93;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v84, OS_SIGNPOST_INTERVAL_END, spid, "PBFPosterExtensionDataStore Init", "URL: %{public}@ wasMigrationJustPerformed: %{BOOL}u -- failed to setup database", buf, 0x12u);
  }

  v57 = 0;
  id v17 = v92;
LABEL_44:

  return v57;
}

- (void)cancel
{
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    [(PBFPosterExtensionDataStorePrewarmHelper *)self->_prewarmer invalidate];
    [(PFPosterExtensionProvider *)self->_extensionProvider cancel];
    [(PBFPosterSnapshotManager *)self->_snapshotManager cancelAllRequests];
    database = self->_database;
    [(PBFPosterExtensionDataStoreSQLiteDatabase *)database cancel];
  }
}

- (void)invalidate
{
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    v3 = PBFLogDataStore();
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    id v5 = PBFLogDataStore();
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "invalidate", "", buf, 2u);
    }

    v7 = self->_observers;
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PBFPosterExtensionDataStore_invalidate__block_invoke;
    block[3] = &unk_1E69808C0;
    v9 = v7;
    uint64_t v30 = v9;
    dispatch_async(notificationQueue, block);
    observers = self->_observers;
    self->_observers = 0;

    [(PBFPosterExtensionDataStorePrewarmHelper *)self->_prewarmer invalidate];
    [(NSDictionary *)self->_roleToRoleCoordinator enumerateKeysAndObjectsUsingBlock:&__block_literal_global_0];
    v11 = self;
    objc_sync_enter(v11);
    [(BSInvalidatable *)v11->_foregroundKeepDatabaseAliveAssertion invalidate];
    foregroundKeepDatabaseAliveAssertion = v11->_foregroundKeepDatabaseAliveAssertion;
    v11->_foregroundKeepDatabaseAliveAssertion = 0;

    objc_sync_exit(v11);
    [(PBFPosterExtensionDataStoreSQLiteDatabase *)v11->_database invalidate];
    database = v11->_database;
    v11->_database = 0;

    [(PFPosterExtensionProvider *)v11->_extensionProvider removeObserver:v11];
    [(PFPosterExtensionProvider *)v11->_extensionProvider cancel];
    extensionProvider = v11->_extensionProvider;
    v11->_extensionProvider = 0;

    [(PBFPosterSnapshotManager *)v11->_snapshotManager removeObserver:v11];
    [(PBFPosterSnapshotManager *)v11->_snapshotManager invalidate];
    os_unfair_lock_lock(&v11->_stateLock);
    [(PBFGalleryController *)v11->_galleryController removeObserver:v11];
    [(PBFGalleryController *)v11->_galleryController invalidate];
    [(PBFComplicationSnapshotService *)v11->_complicationSnapshotService invalidate];
    [(PBFPosterExtensionDataStoreAssertionManager *)v11->_assertionManager removeObserver:v11];
    [(PBFPosterExtensionDataStoreAssertionManager *)v11->_assertionManager invalidate];
    [(NSMutableDictionary *)v11->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier enumerateKeysAndObjectsUsingBlock:&__block_literal_global_149];
    URL = v11->_URL;
    v11->_URL = 0;

    extensionStoreCoordinatorContainerURL = v11->_extensionStoreCoordinatorContainerURL;
    v11->_extensionStoreCoordinatorContainerURL = 0;

    galleryCacheURL = v11->_galleryCacheURL;
    v11->_galleryCacheURL = 0;

    snapshotManager = v11->_snapshotManager;
    v11->_snapshotManager = 0;

    complicationSnapshotService = v11->_complicationSnapshotService;
    v11->_complicationSnapshotService = 0;

    assertionManager = v11->_assertionManager;
    v11->_assertionManager = 0;

    stateLock_configuration = v11->_stateLock_configuration;
    v11->_stateLock_configuration = 0;

    stateLock_descriptorsForExtensionBundleIdentifier = v11->_stateLock_descriptorsForExtensionBundleIdentifier;
    v11->_stateLock_descriptorsForExtensionBundleIdentifier = 0;

    stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = v11->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
    v11->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = 0;

    stateLock_staticDescriptorsForExtensionBundleIdentifier = v11->_stateLock_staticDescriptorsForExtensionBundleIdentifier;
    v11->_stateLock_staticDescriptorsForExtensionBundleIdentifier = 0;

    stateLock_suggestedLayout = v11->_stateLock_suggestedLayout;
    v11->_stateLock_suggestedLayout = 0;

    stateLock_switcherConfiguration = v11->_stateLock_switcherConfiguration;
    v11->_stateLock_switcherConfiguration = 0;

    os_unfair_lock_unlock(&v11->_stateLock);
    unint64_t v27 = PBFLogDataStore();
    uint64_t v28 = v27;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v28, OS_SIGNPOST_INTERVAL_END, v4, "invalidate", "", buf, 2u);
    }
  }
}

uint64_t __41__PBFPosterExtensionDataStore_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllObjects];
}

uint64_t __41__PBFPosterExtensionDataStore_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

uint64_t __41__PBFPosterExtensionDataStore_invalidate__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (void)_setupGalleryEnvironment
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "unable to create gallery cache: %@", v2, v3, v4, v5, v6);
}

- (id)dataFreshnessForComponents:(id)a3
{
  return [(PBFPosterExtensionDataStore *)self dataFreshnessForComponents:a3 refreshStrategy:2];
}

- (id)dataFreshnessForComponents:(id)a3 refreshStrategy:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v22 = objc_alloc_init(PBFMutableDataFreshnessState);
  uint8_t v6 = [MEMORY[0x1E4F1C9C8] date];
  os_unfair_lock_lock(&self->_stateLock);
  id v20 = [(PFPosterExtensionProvider *)self->_extensionProvider extensionForIdentifier];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v11 isEqualToString:@"PBFDataComponentGallery"])
        {
          v12 = [PBFDataComponentObjectEntity alloc];
          galleryController = self->_galleryController;
          id v14 = [PBFDataRefreshContext alloc];
          id v15 = [(PBFGalleryController *)self->_galleryController lastUpdateDate];
          id v16 = [(PBFDataRefreshContext *)v14 initWithComponent:@"PBFDataComponentGallery" now:v6 lastRefreshDate:v15 userInfo:0];
          id v17 = [(PBFDataComponentObjectEntity *)v12 initWithComponent:@"PBFDataComponentGallery" object:galleryController context:v16];

          [(PBFMutableDataFreshnessState *)v22 track:v17];
LABEL_11:

          continue;
        }
        if (([v11 isEqualToString:@"PBFDataComponentStaticDescriptors"] & 1) != 0
          || [v11 isEqualToString:@"PBFDataComponentDynamicDescriptors"])
        {
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __74__PBFPosterExtensionDataStore_dataFreshnessForComponents_refreshStrategy___block_invoke;
          v23[3] = &unk_1E69809B8;
          os_signpost_id_t v24 = v20;
          v25 = v11;
          id v26 = v6;
          int64_t v28 = a4;
          unint64_t v27 = v22;
          [(PBFPosterExtensionDataStore *)self _stateLock_enumerateExtensionStoreCoordinators:v23];

          id v17 = v24;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_stateLock);
  return v22;
}

void __74__PBFPosterExtensionDataStore_dataFreshnessForComponents_refreshStrategy___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  uint64_t v3 = [v19 extensionIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:v3];
  id v5 = [v4 posterExtensionInfoPlist];
  char v6 = objc_msgSend(v5, "pbf_supportsGallery");

  if ((v6 & 1) != 0
    || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 stringArrayForKey:@"ShowSamplePoster"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 containsObject:v3],
        v8,
        v7,
        v9))
  {
    if ([*(id *)(a1 + 40) isEqualToString:@"PBFDataComponentStaticDescriptors"])
    {
      v10 = [v4 posterExtensionInfoPlist];
      v11 = objc_msgSend(v10, "pbf_staticDescriptorIdentifiers");
      if ([v11 count])
      {

        goto LABEL_7;
      }
      v12 = [v19 staticDescriptorStoreCoordinatorsWithError:0];
      uint64_t v13 = [v12 count];

      if (v13)
      {
LABEL_7:
        id v14 = +[PBFDataRefreshContext staticDescriptorsRefreshContextForNow:*(void *)(a1 + 48) extension:v4];
        if (!v14) {
          goto LABEL_12;
        }
LABEL_11:
        id v17 = *(void **)(a1 + 56);
        id v18 = [[PBFDataComponentObjectEntity alloc] initWithComponent:*(void *)(a1 + 40) object:v19 context:v14];
        [v17 track:v18];

        goto LABEL_12;
      }
    }
    if ([*(id *)(a1 + 40) isEqualToString:@"PBFDataComponentDynamicDescriptors"])
    {
      uint64_t v15 = *(void *)(a1 + 48);
      id v16 = [v19 lastRefreshDescriptorDate];
      id v14 = +[PBFDataRefreshContext dynamicDescriptorsRefreshContextForNow:v15 extension:v4 lastRefreshDate:v16 refreshStrategy:*(void *)(a1 + 64)];

      if (v14) {
        goto LABEL_11;
      }
    }
  }
LABEL_12:
}

- (void)prewarmWithCompletion:(id)a3
{
  p_stateLock = &self->_stateLock;
  id v9 = a3;
  os_unfair_lock_lock(p_stateLock);
  if ([(PBFPosterExtensionDataStore *)self _stateLock_hasBeenUnlockedSinceBoot]
    && (id v5 = self->_stateLock_wasMigrationJustPerformed) != 0
    && [(NSNumber *)v5 BOOLValue])
  {
    stateLock_wasMigrationJustPerformed = self->_stateLock_wasMigrationJustPerformed;
    self->_stateLock_wasMigrationJustPerformed = 0;

    uint64_t v7 = 2;
    uint64_t v8 = 3;
  }
  else
  {
    uint64_t v7 = 10;
    uint64_t v8 = 1;
  }
  os_unfair_lock_unlock(p_stateLock);
  [(PBFPosterExtensionDataStore *)self executeUpdate:@"prewarm" refreshStrategy:v8 galleryUpdateOptions:v7 powerLogReason:1 cleanupOldResources:0 completion:v9];
}

- (void)overnightUpdateWithCompletion:(id)a3
{
}

- (void)executeUpdate:(id)a3 refreshStrategy:(int64_t)a4 galleryUpdateOptions:(unint64_t)a5 powerLogReason:(int64_t)a6 cleanupOldResources:(BOOL)a7 completion:(id)a8
{
  BOOL v62 = a7;
  v92[1] = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  uint64_t v13 = (void (**)(id, void *))a8;
  if (PBFCurrentDeviceClassSupported())
  {
    if (objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_keynoteModeEnabled"))
    {
      if (v13)
      {
        id v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v89 = *MEMORY[0x1E4F28588];
        v90 = @"Keynote mode is enabled; we aren't going to prewarm anything.  We are already warm enough, thank you.";
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
        id v16 = objc_msgSend(v14, "pbf_generalErrorWithCode:userInfo:", 6, v15);
        v13[2](v13, v16);
LABEL_37:

        goto LABEL_38;
      }
      goto LABEL_38;
    }
    v59 = (void *)a6;
    id v18 = [MEMORY[0x1E4F29128] UUID];
    id v19 = [v18 UUIDString];
    uint64_t v15 = [v19 substringToIndex:7];

    id v16 = [NSString stringWithFormat:@"%@/%@", v15, v64];
    id v20 = NSString;
    v21 = PBFDescriptorRefreshStrategyToString(a4);
    v22 = NSStringFromPBFPosterExtensionDataStoreGalleryConfigurationOptions(a5);
    v23 = NSStringFromPBFPowerLogReason((uint64_t)v59);
    uint64_t v58 = [v20 stringWithFormat:@"(%@)-(%@)-(%@)-(%@)", v16, v21, v22, v23];

    v88[0] = @"PBFDataComponentStaticDescriptors";
    v88[1] = @"PBFDataComponentDynamicDescriptors";
    os_signpost_id_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
    uint64_t v60 = [(NSDictionary *)self->_roleToRoleCoordinator allKeys];
    if (objc_msgSend(v60, "bs_containsObjectPassingTest:", &__block_literal_global_185))
    {
      uint64_t v25 = [v24 arrayByAddingObject:@"PBFDataComponentGallery"];

      os_signpost_id_t v24 = (void *)v25;
    }
    v61 = [(PBFPosterExtensionDataStore *)self dataFreshnessForComponents:v24 refreshStrategy:a4];
    id v26 = PBFLogPrewarm();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v79 = v16;
      _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@) Checking data freshness...", buf, 0xCu);
    }

    unint64_t v27 = PBFLogPrewarm();
    [v61 dumpFreshnessStateToLogCategory:v27 type:16];

    if ([v61 isFresh])
    {
      int64_t v28 = PBFLogPrewarm();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v79 = v16;
        _os_log_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_DEFAULT, "(%{public}@) prewarm bailed; data is still fresh",
          buf,
          0xCu);
      }

      if (v13) {
        v13[2](v13, 0);
      }
      goto LABEL_36;
    }
    os_unfair_lock_lock(&self->_stateLock);
    BOOL v29 = [(PBFPosterExtensionDataStore *)self _stateLock_hasBeenUnlockedSinceBoot];
    os_unfair_lock_unlock(&self->_stateLock);
    long long v30 = PBFLogPrewarm();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (!v29)
    {
      if (v31)
      {
        *(_DWORD *)buf = 138543362;
        id v79 = v16;
        _os_log_impl(&dword_1D31CE000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@) prewarm bailed; keybag locked",
          buf,
          0xCu);
      }

      if (v13)
      {
        unint64_t v48 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v86 = *MEMORY[0x1E4F28588];
        v87 = @"Keybag is locked";
        id v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        v50 = objc_msgSend(v48, "pbf_generalErrorWithCode:userInfo:", 7, v49);
        v13[2](v13, v50);
      }
      goto LABEL_36;
    }
    if (v31)
    {
      *(_DWORD *)buf = 138543362;
      id v79 = v16;
      _os_log_impl(&dword_1D31CE000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@) Checking if prewarm already in progress...", buf, 0xCu);
    }

    long long v32 = PBFLogDataStore();
    os_signpost_id_t spid = (char *)os_signpost_id_generate(v32);

    objc_initWeak(&location, self);
    if ([(BSAtomicFlag *)self->_isPrewarmingFlag setFlag:1])
    {
      v33 = PBFLogDataStore();
      uint64_t v34 = v33;
      if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        v35 = PBFDescriptorRefreshStrategyToString(a4);
        *(_DWORD *)buf = 138544130;
        id v79 = v64;
        __int16 v80 = 2114;
        v81 = v35;
        __int16 v82 = 2048;
        unint64_t v83 = a5;
        __int16 v84 = 2048;
        v85 = v59;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v34, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "executeUpdate:refreshStrategy:galleryUpdateOptions:powerLogReason:completion:", "updateDescription: %{public}@ refreshStrategy: %{public}@ galleryUpdateOptions: %lu powerLogReason: %lu", buf, 0x2Au);
      }
      uint64_t v36 = PBFLogPrewarm();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v79 = v16;
        __int16 v80 = 2114;
        v81 = v58;
        _os_log_impl(&dword_1D31CE000, v36, OS_LOG_TYPE_DEFAULT, "(%{public}@) no prewarm in progress; beginning prewarm: %{public}@",
          buf,
          0x16u);
      }

      runtimeAssertionProvider = self->_runtimeAssertionProvider;
      uint64_t v38 = [NSString stringWithFormat:@"Prewarm session '%@/%@' initiated from XPC", v15, v64];
      v39 = [MEMORY[0x1E4F96478] currentProcess];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_194;
      v75[3] = &unk_1E6980A00;
      id v56 = v16;
      id v76 = v56;
      v55 = [(PBFRuntimeAssertionProviding *)runtimeAssertionProvider acquirePrewarmRuntimeAssertionForReason:v38 target:v39 invalidationHandler:v75];

      v40 = +[PBFGenericDisplayContext mainScreen];
      uint64_t v41 = [(PBFPosterExtensionDataStore *)self buildPrewarmPlanWithIdentifier:v56 refreshStrategy:a4 galleryUpdateOptions:a5 powerLogReason:v59 cleanupOldResources:v62 prewarmDisplayContext:v40];
      uint64_t v42 = [[PBFPosterExtensionDataStorePrewarmHelper alloc] initWithPlan:v41];
      v63 = (void *)v41;
      prewarmer = self->_prewarmer;
      p_prewarmer = &self->_prewarmer;
      *p_prewarmer = v42;

      v45 = *p_prewarmer;
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_198;
      v69[3] = &unk_1E6980A28;
      id v70 = v56;
      objc_copyWeak(v74, &location);
      id v46 = v55;
      id v71 = v46;
      v74[1] = spid;
      id v72 = v64;
      v74[2] = (id)a4;
      v74[3] = (id)a5;
      v74[4] = v59;
      v73 = v13;
      [(PBFPosterExtensionDataStorePrewarmHelper *)v45 executePrewarmWithExecutor:0 completion:v69];

      objc_destroyWeak(v74);
      id v47 = v76;
    }
    else
    {
      if (!v13)
      {
LABEL_35:
        objc_destroyWeak(&location);
LABEL_36:

        goto LABEL_37;
      }
      v51 = [(PBFPosterExtensionDataStorePrewarmHelper *)self->_prewarmer plan];
      BOOL v52 = [v51 identifier];

      id v53 = PBFLogPrewarm();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v79 = v16;
        __int16 v80 = 2114;
        v81 = v52;
        _os_log_impl(&dword_1D31CE000, v53, OS_LOG_TYPE_DEFAULT, "(%{public}@) prewarm already in progress (%{public}@) -- tacking on completion handler and moving on with our lives.", buf, 0x16u);
      }

      v54 = self->_prewarmer;
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_200;
      v65[3] = &unk_1E6980A50;
      id v66 = v16;
      id v47 = v52;
      id v67 = v47;
      v68 = v13;
      [(PBFPosterExtensionDataStorePrewarmHelper *)v54 appendCompletionObserver:v65];
    }
    goto LABEL_35;
  }
  if (v13)
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v91 = *MEMORY[0x1E4F28588];
    v92[0] = @"This platform is not currently supported.";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:&v91 count:1];
    id v16 = objc_msgSend(v17, "pbf_generalErrorWithCode:userInfo:", 7, v15);
    v13[2](v13, v16);
    goto LABEL_37;
  }
LABEL_38:
}

uint64_t __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F927B0] proactiveGallerySupportedForRole:a2];
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_194(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = PBFLogPrewarm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_194_cold_1();
  }
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_198(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if (!v6)
    {
      id v9 = PBFLogPrewarm();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_198_cold_1();
      }
      goto LABEL_9;
    }
LABEL_7:
    id v9 = PBFLogPrewarm();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_198_cold_2();
    }
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v8 = PBFLogPrewarm();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_198_cold_3();
  }

  if (v6) {
    goto LABEL_7;
  }
LABEL_10:
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v11 = *(void *)(a1 + 56);
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v7);
    }
    [WeakRetained[30] invalidate];
    id v12 = WeakRetained[30];
    WeakRetained[30] = 0;

    [WeakRetained[28] setFlag:0];
    [*(id *)(a1 + 40) invalidate];
    uint64_t v13 = PBFLogDataStore();
    id v14 = v13;
    os_signpost_id_t v15 = *(void *)(a1 + 72);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      id v17 = PBFDescriptorRefreshStrategyToString(*(void *)(a1 + 80));
      uint64_t v18 = *(void *)(a1 + 88);
      uint64_t v19 = *(void *)(a1 + 96);
      int v25 = 138544130;
      uint64_t v26 = v16;
      __int16 v27 = 2114;
      int64_t v28 = v17;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      __int16 v31 = 2048;
      uint64_t v32 = v19;
      id v20 = "updateDescription: %{public}@ refreshStrategy: %{public}@ galleryUpdateOptions: %lu powerLogReason: %lu";
LABEL_19:
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v14, OS_SIGNPOST_INTERVAL_END, v15, "executeUpdate:refreshStrategy:galleryUpdateOptions:powerLogReason:completion:", v20, (uint8_t *)&v25, 0x2Au);
    }
  }
  else
  {
    [*(id *)(a1 + 40) invalidate];
    v21 = PBFLogDataStore();
    id v14 = v21;
    os_signpost_id_t v15 = *(void *)(a1 + 72);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      uint64_t v22 = *(void *)(a1 + 48);
      id v17 = PBFDescriptorRefreshStrategyToString(*(void *)(a1 + 80));
      uint64_t v23 = *(void *)(a1 + 88);
      uint64_t v24 = *(void *)(a1 + 96);
      int v25 = 138544130;
      uint64_t v26 = v22;
      __int16 v27 = 2114;
      int64_t v28 = v17;
      __int16 v29 = 2048;
      uint64_t v30 = v23;
      __int16 v31 = 2048;
      uint64_t v32 = v24;
      id v20 = "updateDescription: %{public}@ refreshStrategy: %{public}@ galleryUpdateOptions: %lu powerLogReason: %lu; dat"
            "a store invalidated before prewarm finished";
      goto LABEL_19;
    }
  }
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_200(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PBFLogPrewarm();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@->%{public}@) appending prewarm finished w/ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (id)acquireSnapshotterInUseAssertionWithReason:(id)a3
{
  return [(PBFPosterSnapshotManager *)self->_snapshotManager acquireSnapshotterInUseAssertionWithReason:a3];
}

- (id)activeSnapshotterInUseAssertionReasons
{
  return [(PBFPosterSnapshotManager *)self->_snapshotManager activeSnapshotterInUseAssertionReasons];
}

- (unint64_t)activeSnapshotterInUseAssertionCount
{
  return [(PBFPosterSnapshotManager *)self->_snapshotManager activeSnapshotterInUseAssertionCount];
}

- (id)acquireSnapshotterDisabledAssertionForProvider:(id)a3 withReason:(id)a4
{
  return [(PBFPosterSnapshotManager *)self->_snapshotManager acquireSnapshotterDisabledAssertionForProvider:a3 withReason:a4];
}

- (id)acquireEditingSessionAssertionForProvider:(id)a3 withReason:(id)a4
{
  return [(PBFPosterSnapshotManager *)self->_snapshotManager acquireEditingSessionAssertionForProvider:a3 withReason:a4];
}

- (id)activeEditingSessionAssertionExtensionIdentifiers
{
  return [(PBFPosterSnapshotManager *)self->_snapshotManager activeEditingSessionAssertionExtensionIdentifiers];
}

- (void)addBehaviorAssertionObserver:(id)a3
{
}

- (void)removeBehaviorAssertionObserver:(id)a3
{
}

- (void)setMaximumPosterConfigurationCount:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_stateLock_maximumPosterConfigurationCount != a3)
  {
    self->_stateLock_maximumPosterConfigurationCount = a3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(NSDictionary *)self->_roleToRoleCoordinator keyEnumerator];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          __int16 v11 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
          [v11 setMaximumNumberOfPosters:a3];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (int64_t)maximumPosterConfigurationCount
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  int64_t v4 = [(PBFPosterExtensionDataStore *)self _stateLock_maximumPosterConfigurationCount];
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (int64_t)_stateLock_maximumPosterConfigurationCount
{
  return self->_stateLock_maximumPosterConfigurationCount;
}

- (NSArray)knownExtensions
{
  return (NSArray *)[(PFPosterExtensionProvider *)self->_extensionProvider knownPosterExtensions];
}

- (BOOL)_extensionsInputIsValid
{
  return [(BSAtomicFlag *)self->_extensionsInputIsValidAtomicFlag getFlag];
}

- (void)updateExtensionsAndNotifyWhenComplete:(id)a3
{
  __int16 v11 = (void (**)(void))a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) != 0
    || ![(PFPosterExtensionProvider *)self->_extensionProvider reloadExtensions])
  {
    os_unfair_lock_unlock(&self->_stateLock);
    uint64_t v10 = v11;
    if (!v11) {
      goto LABEL_9;
    }
    v11[2](v11);
  }
  else
  {
    stateLock_updateExtensionCompletionBlocks = self->_stateLock_updateExtensionCompletionBlocks;
    if (!stateLock_updateExtensionCompletionBlocks)
    {
      id v6 = (NSMutableArray *)objc_opt_new();
      uint64_t v7 = self->_stateLock_updateExtensionCompletionBlocks;
      self->_stateLock_updateExtensionCompletionBlocks = v6;

      stateLock_updateExtensionCompletionBlocks = self->_stateLock_updateExtensionCompletionBlocks;
    }
    uint64_t v8 = (void *)[v11 copy];
    uint64_t v9 = _Block_copy(v8);
    [(NSMutableArray *)stateLock_updateExtensionCompletionBlocks addObject:v9];

    os_unfair_lock_unlock(p_stateLock);
  }
  uint64_t v10 = v11;
LABEL_9:
}

- (id)posterDescriptorsForExtensionBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore posterDescriptorsForExtensionBundleIdentifier:error:]();
    }
LABEL_15:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D9278);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore posterDescriptorsForExtensionBundleIdentifier:error:]();
    }
    goto LABEL_15;
  }

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v8 = [(PBFPosterExtensionDataStore *)self _stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:v6];
  os_unfair_lock_unlock(p_stateLock);
  if (a4 && !v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2218, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  return v10;
}

- (id)staticPosterDescriptorsForExtensionBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore staticPosterDescriptorsForExtensionBundleIdentifier:error:]();
    }
LABEL_15:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D941CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore staticPosterDescriptorsForExtensionBundleIdentifier:error:]();
    }
    goto LABEL_15;
  }

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v8 = [(PBFPosterExtensionDataStore *)self _stateLock_knownStaticPosterDescriptorsForExtensionBundleIdentifier:v6];
  os_unfair_lock_unlock(p_stateLock);
  if (a4 && !v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2218, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  return v10;
}

- (void)reloadPosterDescriptorsForExtensionBundleIdentifier:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v14 = v8;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v14)
  {
    long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore reloadPosterDescriptorsForExtensionBundleIdentifier:sessionInfo:completion:]();
    }
LABEL_15:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D95D4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore reloadPosterDescriptorsForExtensionBundleIdentifier:sessionInfo:completion:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D9638);
  }

  if (!v10)
  {
    long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore reloadPosterDescriptorsForExtensionBundleIdentifier:sessionInfo:completion:]();
    }
    goto LABEL_15;
  }
  os_unfair_lock_lock(&self->_stateLock);
  id v11 = [(PBFPosterExtensionDataStore *)self _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:v14 reason:@"External Client Refresh Request" powerLogReason:3 postEnqueueGalleryUpdateOptions:8 sessionInfo:v9 completion:v10];
  os_unfair_lock_unlock(&self->_stateLock);
}

- (BOOL)deletePosterDescriptorsForExtensionBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore deletePosterDescriptorsForExtensionBundleIdentifier:error:]();
    }
LABEL_14:
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D97DCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore deletePosterDescriptorsForExtensionBundleIdentifier:error:]();
    }
    goto LABEL_14;
  }

  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    BOOL v7 = [(PBFPosterExtensionDataStore *)self _stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:v6 waitForPushToProactive:1 error:a4];
    os_unfair_lock_unlock(p_stateLock);
  }

  return v7;
}

- (void)updateGallery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = v6;
  NSClassFromString(&cfstr_Prspostergalle.isa);
  if (!v10)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore updateGallery:completion:]();
    }
LABEL_15:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D994CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterGalleryLayoutClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore updateGallery:completion:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31D99B0);
  }

  if (!v7)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore updateGallery:completion:]();
    }
    goto LABEL_15;
  }
  [(PBFGalleryController *)self->_galleryController updateGallery:v10 completion:v7];
}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a3 extensionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  if (v11)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:]();
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D31D9DD8);
    }
  }

  id v12 = v8;
  if (v12)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:]();
      }
LABEL_18:
      [v23 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D31D9D74);
    }
  }

  if (!v10)
  {
    uint64_t v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:]();
    }
    goto LABEL_18;
  }
  os_unfair_lock_lock(&self->_stateLock);
  long long v13 = [(PBFPosterExtensionDataStore *)self _stateLock_currentGalleryConfiguration];
  os_unfair_lock_unlock(&self->_stateLock);
  id v14 = +[PBFGenericDisplayContext mainScreen];
  if (v13)
  {
    long long v15 = objc_opt_new();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __121__PBFPosterExtensionDataStore_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke;
    v30[3] = &unk_1E6980A78;
    id v16 = v11;
    id v31 = v16;
    id v17 = v12;
    id v32 = v17;
    id v33 = v15;
    id v34 = v14;
    id v18 = v15;
    [v13 enumeratePreviews:v30];
    uint64_t v19 = objc_msgSend(v18, "bs_map:", &__block_literal_global_224);

    id v20 = (void *)[v19 mutableCopy];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy_;
    v28[4] = __Block_byref_object_dispose_;
    v21 = [NSString stringWithFormat:@"refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier %@/%@", v16, v17];
    id v29 = [(PBFPosterExtensionDataStore *)self acquireSnapshotterInUseAssertionWithReason:v21];

    snapshotManager = self->_snapshotManager;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __121__PBFPosterExtensionDataStore_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke_228;
    v25[3] = &unk_1E6980AC0;
    __int16 v27 = v28;
    id v26 = v10;
    [(PBFPosterSnapshotManager *)snapshotManager prewarmSnapshotsForRequests:v20 completion:v25];

    _Block_object_dispose(v28, 8);
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __121__PBFPosterExtensionDataStore_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v17 = a3;
  int64_t v4 = [v17 posterDescriptorLookupInfo];
  id v5 = [v4 posterDescriptorPath];
  id v6 = v5;
  uint64_t v7 = a1[5];
  if (a1[4])
  {
    id v8 = [v5 serverIdentity];
    id v9 = [v8 provider];
    int v10 = [v9 isEqual:a1[4]];
    int v11 = v10;
    if (v7)
    {
      if ((v10 & 1) == 0)
      {

        goto LABEL_12;
      }
      id v12 = [v6 descriptorIdentifier];
      int v13 = [v12 isEqual:a1[5]];

      if (!v13) {
        goto LABEL_13;
      }
    }
    else
    {

      if (!v11) {
        goto LABEL_13;
      }
    }
LABEL_10:
    id v16 = (void *)a1[6];
    id v8 = +[PBFPosterSnapshotRequest snapshotRequestForPreview:v17 context:a1[7]];
    [v16 addObject:v8];
LABEL_12:

    goto LABEL_13;
  }
  if (!v7) {
    goto LABEL_10;
  }
  id v14 = [v5 descriptorIdentifier];
  int v15 = [v14 isEqual:a1[5]];

  if (v15) {
    goto LABEL_10;
  }
LABEL_13:
}

id __121__PBFPosterExtensionDataStore_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 requestWithLoadFromCacheIfAvailable:0];
  uint64_t v3 = [v2 requestWithIntention:0];
  int64_t v4 = [v3 requestWithPowerLogReason:3];

  return v4;
}

void __121__PBFPosterExtensionDataStore_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke_228(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (void)fetchPosterSnapshotsForRequest:(id)a3 completion:(id)a4
{
}

- (void)fetchPosterSnapshotsWithClientRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = v6;
  NSClassFromString(&cfstr_Prspostersnaps.isa);
  if (!v10)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore fetchPosterSnapshotsWithClientRequest:completion:]();
    }
LABEL_15:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31DA1D8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterSnapshotRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore fetchPosterSnapshotsWithClientRequest:completion:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31DA23CLL);
  }

  if (!v7)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore fetchPosterSnapshotsWithClientRequest:completion:]();
    }
    goto LABEL_15;
  }
  os_unfair_lock_lock(&self->_stateLock);
  [(PBFPosterExtensionDataStore *)self _stateLock_fetchPosterSnapshotsWithClientRequest:v10 completion:v7];
  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)_stateLock_fetchPosterSnapshotsWithClientRequest:(id)a3 completion:(id)a4
{
  v201[1] = *MEMORY[0x1E4F143B8];
  id v116 = a3;
  id v7 = a4;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    v114 = v7;
    id v9 = self->_clientSnapshotRequestQueue;
    v128 = self;
    v115 = [(PBFPosterExtensionDataStore *)self _stateLock_switcherConfiguration];
    id v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    [v116 orientation];
    if (BSInterfaceOrientationIsValid())
    {
      uint64_t v11 = [v116 orientation];
    }
    else
    {
      id v12 = +[PBFGenericDisplayContext mainScreen];
      uint64_t v11 = objc_msgSend(v12, "pbf_interfaceOrientation");
    }
    int v13 = +[PBFGenericDisplayContext mainScreen];
    id v14 = v13;
    if (v11)
    {
      uint64_t v15 = [v13 displayContextWithUpdatedInterfaceOrientation:v11];

      id v14 = (void *)v15;
    }
    v187[0] = 0;
    v187[1] = v187;
    v187[2] = 0x3032000000;
    v187[3] = __Block_byref_object_copy_;
    v187[4] = __Block_byref_object_dispose_;
    id v188 = (id)objc_opt_new();
    v185[0] = 0;
    v185[1] = v185;
    v185[2] = 0x3032000000;
    v185[3] = __Block_byref_object_copy_;
    v185[4] = __Block_byref_object_dispose_;
    id v16 = NSStringFromSelector(a2);
    id v186 = [(PBFPosterExtensionDataStore *)v128 acquireSnapshotterInUseAssertionWithReason:v16];

    v183[0] = 0;
    v183[1] = v183;
    v183[2] = 0x3032000000;
    v183[3] = __Block_byref_object_copy_;
    v183[4] = __Block_byref_object_dispose_;
    id v184 = 0;
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    uint64_t v177 = 0;
    v178 = &v177;
    uint64_t v179 = 0x3032000000;
    v180 = __Block_byref_object_copy__235;
    v181 = __Block_byref_object_dispose__236;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke;
    aBlock[3] = &unk_1E6980AE8;
    id v110 = v17;
    id v173 = v110;
    id v18 = v114;
    id v174 = v18;
    v175 = v187;
    v176 = v185;
    id v182 = _Block_copy(aBlock);
    v168[0] = MEMORY[0x1E4F143A8];
    v168[1] = 3221225472;
    v168[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2;
    v168[3] = &unk_1E6980B10;
    v170 = v183;
    v171 = v187;
    dispatch_group_t group = v10;
    dispatch_group_t v169 = group;
    uint64_t v19 = _Block_copy(v168);
    v165[0] = MEMORY[0x1E4F143A8];
    v165[1] = 3221225472;
    v165[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_3;
    v165[3] = &unk_1E6980B88;
    dispatch_queue_t queue = v9;
    dispatch_queue_t v166 = queue;
    id v111 = v19;
    id v167 = v111;
    v125 = _Block_copy(v165);
    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v164[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_7;
    v164[3] = &unk_1E6980BB0;
    v164[4] = v128;
    v112 = _Block_copy(v164);
    id v20 = [v116 requestOptions];
    v21 = [v20 objectForKey:*MEMORY[0x1E4F923C8]];
    LODWORD(v19) = [v21 BOOLValue];

    if (v19)
    {
      uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F922C0]) initWithPosterRequest:v116];
      uint64_t v23 = [v22 variant];
      uint64_t v24 = [v22 configurationType];
      uint64_t v25 = [v22 options];
      [v22 imageScaleRelativeToScreen];
      uint64_t v27 = v26;
      v123 = [v22 focusModeUUID];
      int64_t v28 = v14;
      uint64_t v29 = [v22 maxCount];
      unint64_t v30 = _UIUserInterfaceStyleFromPRSPosterSnapshotRequestOptions(v25);
      id v163 = 0;
      id v162 = 0;
      id v161 = 0;
      +[PBFFocusSnapshotPreferredConfigurationArbiter determineDesiredConfigurations:&v163 preferredConfiguration:&v162 snapshotDefinition:&v161 fromSwitcherConfiguration:v115 configurationType:v24 variantType:v23 options:v25 andFocusModeUUID:v123 maxCount:v29];
      id v31 = v163;
      id v121 = v162;
      id v32 = v161;
      v126 = [v28 displayContextWithUpdatedUserInterfaceStyle:PBFUserInterfaceStyleFromUIUserInterfaceStyle(v30)];

      uint64_t v33 = [v31 count];
      if (v33)
      {
        v149[0] = MEMORY[0x1E4F143A8];
        v149[1] = 3221225472;
        v149[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_8;
        v149[3] = &unk_1E6980C00;
        id v150 = v115;
        uint64_t v157 = v23;
        id v151 = v32;
        id v152 = v126;
        v153 = group;
        v154 = v128;
        v156 = v183;
        id v155 = v125;
        uint64_t v158 = v24;
        uint64_t v159 = v25;
        uint64_t v160 = v27;
        [v31 enumerateObjectsUsingBlock:v149];

        id v34 = v150;
      }
      else
      {
        id v49 = objc_alloc(MEMORY[0x1E4F92320]);
        id v34 = (void *)[v49 initWithSnapshots:MEMORY[0x1E4F1CBF0]];
        (*((void (**)(id, void *, void))v18 + 2))(v18, v34, 0);
      }

      if (!v33) {
        goto LABEL_23;
      }
LABEL_22:
      dispatch_group_leave(group);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_272;
      block[3] = &unk_1E6980C70;
      void block[4] = &v177;
      block[5] = v183;
      block[6] = v187;
      dispatch_group_notify(group, queue, block);
      dispatch_time_t v50 = dispatch_time(0, 0x6FC23B000);
      v129[0] = MEMORY[0x1E4F143A8];
      v129[1] = 3221225472;
      v129[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2_273;
      v129[3] = &unk_1E6980C98;
      v129[4] = &v177;
      dispatch_after(v50, queue, v129);
LABEL_23:

      _Block_object_dispose(&v177, 8);
      _Block_object_dispose(v183, 8);

      _Block_object_dispose(v185, 8);
      _Block_object_dispose(v187, 8);

      id v7 = v114;
      goto LABEL_24;
    }
    v35 = [v116 requestOptions];
    uint64_t v36 = *MEMORY[0x1E4F923C0];
    v37 = [v35 objectForKey:*MEMORY[0x1E4F923C0]];
    if (v37)
    {
      uint64_t v38 = [v116 requestOptions];
      v39 = [v38 objectForKey:v36];
      [v39 doubleValue];
      double v41 = v40;
    }
    else
    {
      double v41 = *MEMORY[0x1E4F923D8];
    }

    uint64_t v120 = [v116 variantType];
    uint64_t v117 = [v116 configurationType];
    if (v117 == -1)
    {
      v43 = [v116 path];
      BOOL v42 = v43 == 0;
    }
    else
    {
      BOOL v42 = 0;
    }
    uint64_t v44 = [v116 options];
    unint64_t v45 = _UIUserInterfaceStyleFromPRSPosterSnapshotRequestOptions(v44);
    uint64_t v118 = v44;
    id v46 = [v116 requestOptions];
    v109 = [v46 objectForKey:*MEMORY[0x1E4F923D0]];

    id v47 = [v116 path];

    if (v47)
    {
      unint64_t v48 = [v116 path];
    }
    else
    {
      if (v117)
      {
        if (v117 != 1)
        {
          unint64_t v48 = 0;
          goto LABEL_34;
        }
        v51 = [v115 activeConfiguration];
        uint64_t v52 = [v51 _path];
      }
      else
      {
        v51 = [v115 selectedConfiguration];
        uint64_t v52 = [v51 _path];
      }
      unint64_t v48 = (void *)v52;
    }
    if ((v118 & 0x80) != 0 && v48)
    {
      uint64_t v53 = (*((void (**)(void *, void *))v112 + 2))(v112, v48);

      unint64_t v48 = (void *)v53;
    }
LABEL_34:
    v124 = v48;
    if (v120 == 1)
    {
      v54 = [MEMORY[0x1E4F926B0] loadHomeScreenConfigurationForPath:v48 error:0];
      if ([v54 selectedAppearanceType] == 3)
      {
        v55 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v48];
        id v56 = [v115 _childPosterConfigurationForConfiguration:v55];
        v119 = [v56 _path];
        v122 = v54;

        if (!v119)
        {
          uint64_t v57 = v178[5];
          uint64_t v58 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v200 = *MEMORY[0x1E4F28588];
          v201[0] = @"SPI requires a configuration type or path specified.";
          v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v201 forKeys:&v200 count:1];
          uint64_t v60 = objc_msgSend(v58, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v59);
          (*(void (**)(uint64_t, void, void *))(v57 + 16))(v57, 0, v60);
          int v61 = 0;
LABEL_66:
          v126 = v14;
          goto LABEL_67;
        }
      }
      else
      {
        v119 = 0;
      }

      BOOL v62 = v109;
    }
    else
    {
      v119 = 0;
      BOOL v62 = v109;
    }
    if (v48) {
      char v63 = 1;
    }
    else {
      char v63 = v42;
    }
    if ((v63 & 1) == 0)
    {
      uint64_t v66 = v178[5];
      id v67 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v198 = *MEMORY[0x1E4F28588];
      v199 = @"SPI requires a configuration type or path specified.";
      v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v199 forKeys:&v198 count:1];
      uint64_t v60 = objc_msgSend(v67, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v59);
      (*(void (**)(uint64_t, void, void *))(v66 + 16))(v66, 0, v60);
LABEL_65:
      int v61 = 0;
      v122 = v119;
      goto LABEL_66;
    }
    if (v62)
    {
      id v64 = PBFSnapshotDefinitionForIdentifier(v62);
      if (v64)
      {
        uint64_t v65 = PBFSnapshotDefinitionForIdentifier(v109);
        v197 = v65;
        v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v197 count:1];
      }
      else
      {
        v59 = 0;
      }
LABEL_60:

      id v72 = v124;
      if (v59)
      {
        if (v45)
        {
          v126 = [v14 displayContextWithUpdatedUserInterfaceStyle:PBFUserInterfaceStyleFromUIUserInterfaceStyle(v45)];

          id v72 = v124;
          if (v42)
          {
LABEL_63:
            dispatch_group_enter(group);
            v73 = [MEMORY[0x1E4FB1BA8] mainScreen];
            [v73 bounds];
            double v75 = v74;
            double v77 = v76;
            double v79 = v78;
            double v81 = v80;

            __int16 v82 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithBounds:", v75, v77, v79, v81);
            v148[0] = MEMORY[0x1E4F143A8];
            v148[1] = 3221225472;
            v148[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_262;
            v148[3] = &__block_descriptor_64_e40_v16__0__UIGraphicsImageRendererContext_8l;
            *(double *)&v148[4] = v75;
            *(double *)&v148[5] = v77;
            *(double *)&v148[6] = v79;
            *(double *)&v148[7] = v81;
            uint64_t v60 = [v82 imageWithActions:v148];

            (*((void (**)(void *, void, void, uint64_t, uint64_t, uint64_t, void *, void *, double))v125 + 2))(v125, 0, 0, v120, v117, v118, v60, v126, v41);
            int v61 = 1;
            v122 = v119;
            goto LABEL_67;
          }
        }
        else
        {
          v126 = v14;
          if (v42) {
            goto LABEL_63;
          }
        }
        if (v119) {
          id v72 = v119;
        }
        id v85 = v72;
        v107 = [MEMORY[0x1E4F926B0] loadConfiguredPropertiesForPath:v85 error:0];
        uint64_t v86 = [v85 identity];
        v108 = v85;
        LOBYTE(v85) = [v86 type] == 3;

        if (v85)
        {
          v87 = [PBFPosterSnapshotRequest alloc];
          v88 = [v108 serverIdentity];
          id v89 = [v88 provider];
          v90 = [(PBFPosterSnapshotRequest *)v87 initWithPath:v108 provider:v89 configuredProperties:v107 definitions:v59 context:v126];
          [(PBFPosterSnapshotRequest *)v90 requestWithLoadFromCacheIfAvailable:(v118 & 0x40) == 0];
          id v91 = (id)objc_claimAutoreleasedReturnValue();
          v122 = [v91 requestWithPowerLogReason:3];
          id v92 = v59;
        }
        else
        {
          v88 = [(PBFPosterExtensionDataStore *)v128 _stateLock_currentGalleryConfiguration];
          BOOL v93 = [v124 descriptorIdentifier];
          id v94 = [v108 identity];
          id v95 = [v94 provider];
          v90 = [v88 posterSnapshotRequestsForExtensionBundleIdentifier:v95 context:v126];

          v146[0] = MEMORY[0x1E4F143A8];
          v146[1] = 3221225472;
          v146[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2_266;
          v146[3] = &unk_1E6980C48;
          id v89 = v93;
          id v147 = v89;
          id v96 = [(PBFPosterSnapshotRequest *)v90 bs_firstObjectPassingTest:v146];
          id v92 = [v96 definitions];
          v122 = v96;

          if (!v96)
          {
            uint64_t v102 = v178[5];
            id v103 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v190 = *MEMORY[0x1E4F28588];
            uint64_t v104 = [NSString stringWithFormat:@"unable to find descriptorIdentifier %@ within gallery", v89];
            v191 = v104;
            v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
            v106 = objc_msgSend(v103, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v105);
            (*(void (**)(uint64_t, void, void *))(v102 + 16))(v102, 0, v106);

            int v61 = 0;
            v122 = v119;
LABEL_86:

            v59 = v92;
            uint64_t v60 = v108;
LABEL_67:

            if (!v61) {
              goto LABEL_23;
            }
            goto LABEL_22;
          }
          id v91 = v147;
        }

        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        id v89 = v92;
        uint64_t v97 = [v89 countByEnumeratingWithState:&v142 objects:v189 count:16];
        if (v97)
        {
          uint64_t v98 = *(void *)v143;
          do
          {
            for (uint64_t i = 0; i != v97; ++i)
            {
              if (*(void *)v143 != v98) {
                objc_enumerationMutation(v89);
              }
              uint64_t v100 = *(void *)(*((void *)&v142 + 1) + 8 * i);
              dispatch_group_enter(group);
              snapshotManager = v128->_snapshotManager;
              v131[0] = MEMORY[0x1E4F143A8];
              v131[1] = 3221225472;
              v131[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_3_271;
              v131[3] = &unk_1E6980BD8;
              v137 = v183;
              v132 = group;
              id v136 = v125;
              id v133 = v124;
              id v92 = v119;
              id v134 = v92;
              uint64_t v138 = v120;
              uint64_t v139 = v117;
              uint64_t v140 = v118;
              double v141 = v41;
              id v135 = v126;
              [(PBFPosterSnapshotManager *)snapshotManager fetchPosterSnapshotForRequest:v122 definition:v100 completion:v131];
            }
            uint64_t v97 = [v89 countByEnumeratingWithState:&v142 objects:v189 count:16];
          }
          while (v97);
          int v61 = 1;
          v88 = v107;
          v107 = v108;
          v108 = v89;
        }
        else
        {
          int v61 = 1;
          v88 = v107;
          v107 = v108;
          v108 = v89;
          id v92 = v119;
        }
        goto LABEL_86;
      }
      goto LABEL_64;
    }
    if (v120 == 1)
    {
      id v64 = +[PBFPosterSnapshotDefinition switcherUnlockedSnapshotDefinition];
      v196 = v64;
      uint64_t v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v196 count:1];
LABEL_59:
      v59 = (void *)v68;
      goto LABEL_60;
    }
    if ((unint64_t)(v120 + 1) <= 1)
    {
      id v64 = +[PBFPosterSnapshotDefinition gallerySnapshotWithComplicationsDefinition];
      v195 = v64;
      uint64_t v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v195 count:1];
      goto LABEL_59;
    }
    if (v48)
    {
      uint64_t v69 = [v48 identity];
      if ([v69 type] == 1)
      {

LABEL_58:
        id v64 = +[PBFPosterSnapshotDefinition gallerySnapshotWithComplicationsDefinition];
        v194 = v64;
        uint64_t v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v194 count:1];
        goto LABEL_59;
      }
      id v70 = [v48 identity];
      BOOL v71 = [v70 type] == 2;

      if (v71) {
        goto LABEL_58;
      }
    }
LABEL_64:
    uint64_t v83 = v178[5];
    __int16 v84 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v192 = *MEMORY[0x1E4F28588];
    v193 = @"SPI Requires a snapshot definition to exist";
    v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v193 forKeys:&v192 count:1];
    uint64_t v60 = objc_msgSend(v84, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v59);
    (*(void (**)(uint64_t, void, void *))(v83 + 16))(v83, 0, v60);
    goto LABEL_65;
  }
  if (v7)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v8);
  }
LABEL_24:
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) setFlag:1])
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v11, v5);
    }
    id v7 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v7);
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
    objc_sync_exit(v7);

    id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v8)
    {
      [v8 invalidate];
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = 0;
    }
  }
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v28 = 0;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F83B90]) initWithUIImage:v11 error:&v28];
  id v15 = v28;
  id v16 = v15;
  if (v14)
  {
    id v27 = v15;
    uint64_t v17 = a6;
    id v18 = v12;
    uint64_t v19 = [v11 imageOrientation];
    id v20 = objc_alloc(MEMORY[0x1E4F92310]);
    v21 = [MEMORY[0x1E4F922B0] makeWithOther:v14];
    uint64_t v22 = v19;
    id v12 = v18;
    uint64_t v23 = (void *)[v20 initWithCodableImage:v21 imageOrientation:v22 switcherConfigurationPath:v18 homeScreenConfigurationPath:v13 variant:a5 configurationType:v17];

    id v24 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v24);
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v23];
    objc_sync_exit(v24);

    id v16 = v27;
LABEL_5:

    goto LABEL_6;
  }
  if (v15)
  {
    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
    id v26 = v15;
    uint64_t v23 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v26;
    goto LABEL_5;
  }
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, double a9)
{
  id v17 = a2;
  id v18 = a3;
  id v19 = a7;
  id v20 = a8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_4;
  block[3] = &unk_1E6980B60;
  uint64_t v32 = a4;
  uint64_t v33 = a6;
  id v27 = v18;
  id v28 = v17;
  id v29 = v19;
  id v30 = v20;
  double v34 = a9;
  v21 = *(NSObject **)(a1 + 32);
  id v31 = *(id *)(a1 + 40);
  uint64_t v35 = a5;
  id v22 = v20;
  id v23 = v19;
  id v24 = v17;
  id v25 = v18;
  dispatch_async(v21, block);
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 72) == 1)
  {
    id v3 = *(id *)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 64);
    BSDispatchMain();
  }
  else
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_5(uint64_t a1)
{
  id v2 = objc_alloc_init(PBFHomeScreenPreviewImageBuilder);
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  id v4 = [MEMORY[0x1E4F926B0] loadHomeScreenConfigurationForPath:v3 error:0];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  double v7 = *(double *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_6;
  v9[3] = &unk_1E6980B38;
  id v12 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 88);
  [(PBFHomeScreenPreviewImageBuilder *)v2 homeScreenImageForConfiguration:v4 unlockedPosterSnapshot:v5 displayContext:v6 imageScaleRelativeToScreen:v8 options:v9 completion:v7];
}

uint64_t __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_6(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, void, void))(a1[6] + 16))(a1[6], a2, a1[4], a1[5], a1[7], a1[8]);
}

id __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identity];
  uint64_t v5 = [v4 posterUUID];

  uint64_t v6 = *(void **)(a1 + 32);
  id v11 = 0;
  objc_msgSend(v6, "_stateLock_findStoreCoordinatorsForUUID:extensionStoreCoordinator:configurationStoreCoordinator:", v5, 0, &v11);
  double v7 = [v11 pathOfLatestVersion];
  uint64_t v8 = v7;
  if (!v7) {
    double v7 = v3;
  }
  id v9 = v7;

  return v9;
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_8(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 32);
  v25[0] = *(void *)(a1 + 40);
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  double v7 = +[PBFPosterSnapshotRequest snapshotRequestForConfiguration:v3 withinSwitcherConfiguration:v5 variant:v4 snapshotDefinitions:v6 displayContext:*(void *)(a1 + 48)];

  uint64_t v8 = [v7 path];
  id v9 = [v3 _path];
  if (v8 == v9)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [v7 path];
  }

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
  if (v7)
  {
    id v11 = *(void **)(*(void *)(a1 + 64) + 56);
    uint64_t v12 = *(void *)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_9;
    v15[3] = &unk_1E6980BD8;
    uint64_t v21 = *(void *)(a1 + 80);
    id v16 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 72);
    id v17 = v3;
    id v18 = v10;
    long long v22 = *(_OWORD *)(a1 + 88);
    uint64_t v23 = *(void *)(a1 + 104);
    uint64_t v24 = *(void *)(a1 + 112);
    id v19 = *(id *)(a1 + 48);
    [v11 fetchPosterSnapshotForRequest:v7 definition:v12 completion:v15];

    long long v13 = v16;
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 72);
    long long v13 = [v3 _path];
    (*(void (**)(uint64_t, void *, void *, void, void, void, void, void, double))(v14 + 16))(v14, v13, v10, *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), 0, *(void *)(a1 + 48), *(double *)(a1 + 112));
  }
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
    double v7 = PBFLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_9_cold_1();
    }
  }
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 64);
    id v9 = [*(id *)(a1 + 40) _path];
    (*(void (**)(uint64_t, void *, void, void, void, void, id, void, double))(v8 + 16))(v8, v9, *(void *)(a1 + 48), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), v5, *(void *)(a1 + 56), *(double *)(a1 + 104));
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_262(double *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a2;
  uint64_t v4 = [v3 systemGrayColor];
  [v4 setFill];

  objc_msgSend(v5, "fillRect:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2_266(uint64_t a1, void *a2)
{
  id v3 = [a2 path];
  uint64_t v4 = [v3 descriptorIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_3_271(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
    double v7 = PBFLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_9_cold_1();
    }
  }
  if (v5) {
    (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(a1 + 104));
  }
  else {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_272(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1[4] + 8) + 40);
  if (v2)
  {
    if (*(void *)(*(void *)(a1[5] + 8) + 40))
    {
      (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
    }
    else
    {
      id v3 = *(id *)(*(void *)(a1[6] + 8) + 40);
      objc_sync_enter(v3);
      uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F92320]) initWithSnapshots:*(void *)(*(void *)(a1[6] + 8) + 40)];
      objc_sync_exit(v3);

      (*(void (**)(void))(*(void *)(*(void *)(a1[4] + 8) + 40) + 16))();
    }
    uint64_t v5 = *(void *)(a1[4] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_2_273(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2221, 0);
    (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);

    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
}

- (void)fetchGallerySnapshotForConfiguration:(id)a3 context:(id)a4 completion:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[PBFPosterSnapshotDefinition gallerySnapshotDefinition];
  uint64_t v12 = [PBFPosterSnapshotRequest alloc];
  v16[0] = v11;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v14 = [(PBFPosterSnapshotRequest *)v12 initWithConfiguration:v10 definitions:v13 context:v9];

  id v15 = [(PBFPosterSnapshotRequest *)v14 requestWithPowerLogReason:0];

  [(PBFPosterSnapshotManager *)self->_snapshotManager fetchPosterSnapshotForRequest:v15 definition:v11 completion:v8];
}

- (void)fetchSwitcherSnapshotForConfiguration:(id)a3 context:(id)a4 completion:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[PBFPosterSnapshotDefinition switcherSnapshotDefinition];
  uint64_t v12 = [PBFPosterSnapshotRequest alloc];
  v16[0] = v11;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v14 = [(PBFPosterSnapshotRequest *)v12 initWithConfiguration:v10 definitions:v13 context:v9];

  id v15 = [(PBFPosterSnapshotRequest *)v14 requestWithPowerLogReason:0];

  [(PBFPosterSnapshotManager *)self->_snapshotManager fetchPosterSnapshotForRequest:v15 definition:v11 completion:v8];
}

- (void)fetchHomeScreenAssociatedPosterConfigurationForConfigurationUUID:(id)a3 completion:(id)a4
{
  p_stateLock = &self->_stateLock;
  double v7 = (void (**)(id, id, void))a4;
  id v8 = a3;
  os_unfair_lock_lock(p_stateLock);
  id v9 = [(PBFPosterExtensionDataStore *)self _stateLock_switcherConfiguration];
  id v10 = [v9 _childPosterConfigurationForConfigurationUUID:v8];

  id v11 = [v10 _path];

  os_unfair_lock_unlock(p_stateLock);
  v7[2](v7, v11, 0);
}

- (void)updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5
{
  p_stateLock = &self->_stateLock;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  os_unfair_lock_lock(p_stateLock);
  [(PBFPosterExtensionDataStore *)self _stateLock_updatePosterConfigurationMatchingUUID:v11 updates:v10 completion:v9];

  os_unfair_lock_unlock(p_stateLock);
}

- (void)updatePosterConfiguration:(id)a3 updates:(id)a4 completion:(id)a5
{
  p_stateLock = &self->_stateLock;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  os_unfair_lock_lock(p_stateLock);
  [(PBFPosterExtensionDataStore *)self _stateLock_updatePosterConfiguration:v11 updates:v10 completion:v9];

  os_unfair_lock_unlock(p_stateLock);
}

- (void)createTemporaryPosterConfigurationForPosterMatchingUUID:(id)a3 andApplyUpdates:(id)a4 completion:(id)a5
{
  p_stateLock = &self->_stateLock;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  os_unfair_lock_lock(p_stateLock);
  [(PBFPosterExtensionDataStore *)self _stateLock_createTemporaryPosterConfigurationForPosterMatchingUUID:v11 andApplyUpdates:v10 completion:v9];

  os_unfair_lock_unlock(p_stateLock);
}

- (void)_stateLock_createTemporaryPosterConfigurationForPosterMatchingUUID:(id)a3 andApplyUpdates:(id)a4 completion:(id)a5
{
  v62[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (![v9 count])
    {
      id v20 = (void *)MEMORY[0x1E4F28C58];
      v61[0] = @"configurationUUID";
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v8);
      v61[1] = *MEMORY[0x1E4F28588];
      v62[0] = v21;
      v62[1] = @"No updates to execute?";
      long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
      objc_msgSend(v20, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v22);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    id v55 = 0;
    id v56 = 0;
    [(PBFPosterExtensionDataStore *)self _stateLock_findStoreCoordinatorsForUUID:v8 extensionStoreCoordinator:&v56 configurationStoreCoordinator:&v55];
    id v11 = v56;
    id v12 = v55;
    if (!v12)
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      v59 = @"configurationUUID";
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v8);
      uint64_t v60 = v24;
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      long long v13 = objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v25);

      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v13);
LABEL_19:

      goto LABEL_20;
    }
    long long v13 = [v11 extensionIdentifier];
    uint64_t v14 = [(PBFPosterExtensionDataStore *)self activeEditingSessionAssertionExtensionIdentifiers];
    int v15 = [v14 containsObject:v13];

    if (v15)
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      v57[0] = @"configurationUUID";
      id v17 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v8);
      v57[1] = *MEMORY[0x1E4F28588];
      v58[0] = v17;
      v58[1] = @"Active edit session is ongoing.  Cannot fulfill PRSPosterUpdate requests while editing sessions have UI presented.";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
      id v19 = objc_msgSend(v16, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v18);

      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v19);
LABEL_18:

      goto LABEL_19;
    }
    double v40 = v13;
    id v45 = v11;
    id v43 = v12;
    id v19 = [v12 pathOfLatestVersion];
    uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v19];
    id v26 = (void *)MEMORY[0x1E4F924B8];
    id v27 = [v19 role];
    id v28 = [v26 temporaryPathForRole:v27];

    uint64_t v29 = [v19 identity];
    id v30 = (void *)MEMORY[0x1E4F924D0];
    id v31 = [v28 contentsURL];
    BOOL v42 = (void *)v29;
    uint64_t v32 = [v30 pathWithContainerURL:v31 identity:v29];

    uint64_t v33 = [(id)v32 instanceURL];
    double v34 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v54 = 0;
    id v46 = (void *)v32;
    LOBYTE(v32) = [(id)v32 ensureContentsURLIsReachableAndReturnError:&v54];
    id v35 = v54;
    double v41 = (void *)v33;
    if (v32)
    {
      [v34 removeItemAtURL:v33 error:0];
      uint64_t v36 = [v19 instanceURL];
      id v53 = v35;
      char v37 = [v34 copyItemAtURL:v36 toURL:v33 error:&v53];
      id v39 = v53;

      if (v37)
      {
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __125__PBFPosterExtensionDataStore__stateLock_createTemporaryPosterConfigurationForPosterMatchingUUID_andApplyUpdates_completion___block_invoke;
        v47[3] = &unk_1E6980CC0;
        id v48 = v28;
        id v52 = v10;
        id v49 = v34;
        id v50 = v46;
        uint64_t v38 = v44;
        id v51 = v44;
        [(PBFPosterExtensionDataStore *)self _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:v9 toPath:v50 powerLogReason:0 completion:v47];

        id v35 = v39;
        id v11 = v45;
LABEL_17:

        id v12 = v43;
        long long v13 = v40;
        goto LABEL_18;
      }
      [v28 invalidate];
      id v35 = v39;
      (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v39);
    }
    else
    {
      [v28 invalidate];
      (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v35);
    }
    uint64_t v38 = v44;
    id v11 = v45;
    goto LABEL_17;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v11);
LABEL_20:
  }
}

void __125__PBFPosterExtensionDataStore__stateLock_createTemporaryPosterConfigurationForPosterMatchingUUID_andApplyUpdates_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v28 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    [*(id *)(a1 + 32) invalidate];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (v28)
    {
      id v9 = *(void **)(a1 + 40);
      id v10 = [*(id *)(a1 + 48) contentsURL];
      [v9 removeItemAtURL:v10 error:0];

      id v11 = *(void **)(a1 + 40);
      id v12 = [v28 incomingPosterConfiguration];
      long long v13 = [v12 path];
      uint64_t v14 = [v13 contentsURL];
      int v15 = [*(id *)(a1 + 48) contentsURL];
      [v11 copyItemAtURL:v14 toURL:v15 error:0];
    }
    id v16 = objc_alloc(MEMORY[0x1E4F925C0]);
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = objc_msgSend(*(id *)(a1 + 56), "pbf_posterUUID");
    id v19 = [*(id *)(a1 + 56) _path];
    id v20 = [v19 serverIdentity];
    uint64_t v21 = [v28 incomingPosterConfiguration];
    long long v22 = [v21 configuredProperties];
    uint64_t v23 = (void *)[v16 initWithUpdatedPath:v17 updatedPosterUUID:v18 sourceIdentity:v20 configuredProperties:v22 attributes:0];

    uint64_t v24 = [PBFPosterConfigurationUpdateResult alloc];
    id v25 = [v28 incomingAssocPosterConfiguration];
    id v26 = [v28 postersToDelete];
    id v27 = [(PBFPosterConfigurationUpdateResult *)v24 initWithIncomingPosterConfiguration:v23 incomingAssocPosterConfiguration:v25 postersToDelete:v26];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 32) invalidate];
  }
}

- (void)_stateLock_updatePosterConfiguration:(id)a3 updates:(id)a4 completion:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(v8, "pbf_posterUUID");
  if (v11
    && ([v8 _path],
        id v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 isServerPosterPath],
        v12,
        (v13 & 1) != 0))
  {
    uint64_t v14 = [v8 role];
    int v15 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v14];
    id v16 = [v15 posterCollection];

    id v30 = v16;
    uint64_t v17 = [v16 posterWithUUID:v11];
    id v18 = [v17 _path];
    id v19 = [v18 serverIdentity];

    id v20 = [v8 _path];
    uint64_t v21 = [v20 serverIdentity];

    if ([v19 isEqual:v21])
    {
      [(PBFPosterExtensionDataStore *)self _stateLock_updatePosterConfigurationMatchingUUID:v11 updates:v9 completion:v10];
      long long v22 = 0;
    }
    else
    {
      id v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28588];
      v32[0] = @"Poster Configuration specified is not the most up to date version; please re-run your command after you've received a more up to date poster";
      v31[0] = v24;
      v31[1] = @"version";
      id v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v19, "version"));
      v32[1] = v27;
      v31[2] = @"supplement";
      objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v19, "supplement"));
      v25 = uint64_t v29 = v17;
      v32[2] = v25;
      id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
      long long v22 = objc_msgSend(v28, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v26);

      uint64_t v17 = v29;
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28588];
    v34[0] = @"Invalid configuration specified";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    long long v22 = objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v14);
  }

  if (v22) {
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v22);
  }
}

- (void)_stateLock_updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if ([v9 count])
    {
      id v28 = 0;
      id v29 = 0;
      [(PBFPosterExtensionDataStore *)self _stateLock_findStoreCoordinatorsForUUID:v8 extensionStoreCoordinator:&v29 configurationStoreCoordinator:&v28];
      id v11 = v29;
      id v12 = v28;
      if (v12)
      {
        char v13 = [v11 extensionIdentifier];
        uint64_t v14 = [(PBFPosterExtensionDataStore *)self activeEditingSessionAssertionExtensionIdentifiers];
        int v15 = [v14 containsObject:v13];

        if (v15)
        {
          id v16 = (void *)MEMORY[0x1E4F28C58];
          v30[0] = @"configurationUUID";
          uint64_t v17 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v8);
          v30[1] = *MEMORY[0x1E4F28588];
          v31[0] = v17;
          v31[1] = @"Active edit session is ongoing.  Cannot fulfill PRSPosterUpdate requests while editing sessions have UI presented.";
          id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
          id v19 = objc_msgSend(v16, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v18);

          (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v19);
        }
        else
        {
          id v19 = [v12 pathOfLatestVersion];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __99__PBFPosterExtensionDataStore__stateLock_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke;
          v26[3] = &unk_1E6980CE8;
          id v27 = v10;
          [(PBFPosterExtensionDataStore *)self _stateLock_applyUpdatesAndIngestConfiguration:v9 toPath:v19 powerLogReason:3 completion:v26];
        }
      }
      else
      {
        uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = @"configurationUUID";
        uint64_t v24 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v8);
        uint64_t v33 = v24;
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        char v13 = objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v25);

        (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v13);
      }

      goto LABEL_14;
    }
    id v20 = (void *)MEMORY[0x1E4F28C58];
    v34[0] = @"configurationUUID";
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v8);
    v34[1] = *MEMORY[0x1E4F28588];
    v35[0] = v21;
    v35[1] = @"No updates to execute?";
    long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    objc_msgSend(v20, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v22);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v11);
LABEL_14:

    goto LABEL_15;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_15:
}

uint64_t __99__PBFPosterExtensionDataStore__stateLock_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_stateLock_applyUpdatesAndIngestConfiguration:(id)a3 toPath:(id)a4 powerLogReason:(int64_t)a5 completion:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (v12)
    {
      char v13 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v13);
    }
  }
  else
  {
    uint64_t v32 = self;
    int64_t v33 = a5;
    double v34 = v12;
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    int v15 = [v14 UUIDString];
    id v16 = [v15 substringToIndex:7];

    uint64_t v17 = PBFLogDataStore();
    os_signpost_id_t v18 = os_signpost_id_generate(v17);

    id v19 = PBFLogDataStore();
    id v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)buf = 138543874;
      id v50 = v11;
      __int16 v51 = 2114;
      id v52 = v10;
      __int16 v53 = 2114;
      id v54 = v16;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "_stateLock_applyUpdatesAndIngestConfiguration", "path: %{public}@ ; updates: %{public}@; id %{public}@",
        buf,
        0x20u);
    }
    os_signpost_id_t v31 = v18;

    uint64_t v21 = PBFLogDataStore();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v50 = v16;
      __int16 v51 = 2114;
      id v52 = v11;
      _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] BEGIN POSTER UPDATES FOR PATH %{public}@", buf, 0x16u);
    }
    id v35 = v11;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v36 = v10;
    id v22 = v10;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v45 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          id v28 = PBFLogDataStore();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v50 = v16;
            __int16 v51 = 2114;
            id v52 = v27;
            _os_log_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] POSTER UPDATE: %{public}@", buf, 0x16u);
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v24);
    }

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke;
    v37[3] = &unk_1E6980D58;
    id v29 = v16;
    id v38 = v16;
    os_signpost_id_t v43 = v31;
    id v11 = v35;
    id v39 = v35;
    id v40 = v22;
    id v12 = v34;
    double v41 = v32;
    id v42 = v34;
    id v30 = v29;
    [(PBFPosterExtensionDataStore *)v32 _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:v40 toPath:v39 powerLogReason:v33 completion:v37];

    id v10 = v36;
  }
}

void __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v89 = a2;
  id v7 = a3;
  id v88 = a4;
  id v8 = PBFLogDataStore();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v113 = v9;
    _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] receiving update result", buf, 0xCu);
  }

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v101 objects:v118 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v102;
    do
    {
      uint64_t v14 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v102 != v13) {
          objc_enumerationMutation(v14);
        }
        uint64_t v16 = *(void *)(*((void *)&v101 + 1) + 8 * i);
        uint64_t v17 = PBFLogDataStore();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v113 = v18;
          __int16 v114 = 2114;
          uint64_t v115 = v16;
          _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] result: %{public}@", buf, 0x16u);
        }
      }
      id v10 = v14;
      uint64_t v12 = [v14 countByEnumeratingWithState:&v101 objects:v118 count:16];
    }
    while (v12);
  }

  id v19 = PBFLogDataStore();
  id v20 = v19;
  uint64_t v21 = a1;
  os_signpost_id_t v22 = *(void *)(a1 + 72);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v113 = v24;
    __int16 v114 = 2114;
    uint64_t v115 = v23;
    __int16 v116 = 2114;
    uint64_t v117 = v25;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v20, OS_SIGNPOST_INTERVAL_END, v22, "_stateLock_applyUpdatesAndIngestConfiguration", "path: %{public}@ ; updates: %{public}@, id %{public}@",
      buf,
      0x20u);
  }

  id v26 = v89;
  if (v89)
  {
    uint64_t v27 = [v10 count];
    uint64_t v28 = [*(id *)(a1 + 48) count];
    id v29 = PBFLogDataStore();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v27 == v28)
    {
      if (v30)
      {
        uint64_t v31 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v113 = v31;
        _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] processing update results for updates", buf, 0xCu);
      }

      uint64_t v32 = [*(id *)(a1 + 40) identity];
      int64_t v33 = objc_opt_new();
      double v34 = [v89 roleCoordinatorChanges];
      uint64_t v35 = [v34 count];

      if (v35)
      {
        id v36 = [v89 roleCoordinatorChanges];
        uint64_t v37 = [v36 mutableCopy];

        id v38 = PBFLogDataStore();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v39 = *(void *)(v21 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v113 = v39;
          __int16 v114 = 2114;
          uint64_t v115 = v37;
          _os_log_impl(&dword_1D31CE000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] role coordinator changes received: %{public}@", buf, 0x16u);
        }
        int64_t v33 = (void *)v37;
      }
      else
      {
        id v87 = v10;
        long long v44 = [v32 role];
        uint64_t v86 = [v89 incomingPosterConfiguration];
        long long v45 = +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "updatePosterWithinRole:incomingPoster:", v44);
        [v33 addObject:v45];
        long long v46 = PBFLogDataStore();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v47 = *(void *)(v21 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v113 = v47;
          __int16 v114 = 2114;
          uint64_t v115 = (uint64_t)v45;
          _os_log_impl(&dword_1D31CE000, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating poster: %{public}@", buf, 0x16u);
        }

        id v48 = [v89 incomingAssocPosterConfiguration];

        if (v48)
        {
          id v49 = [v89 incomingAssocPosterConfiguration];
          if ([v49 incomingPosterType] == 5)
          {
            uint64_t v50 = +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:v44 incomingPoster:v49];
          }
          else
          {
            if ([v49 incomingPosterType] != 4)
            {
              double v79 = PBFLogDataStore();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v80 = *(void *)(v21 + 32);
                *(_DWORD *)buf = 138543362;
                uint64_t v113 = v80;
                _os_log_impl(&dword_1D31CE000, v79, OS_LOG_TYPE_DEFAULT, "[%{public}@] bailing; issue with assoc poster",
                  buf,
                  0xCu);
              }

              uint64_t v81 = *(void *)(v21 + 64);
              __int16 v82 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v110 = *MEMORY[0x1E4F28588];
              id v111 = @"Associated poster configuration has incorrect PRIncomingPosterType; should be AssociatedNew/AssociatedUpdate but is something else that we do not handle for this.";
              uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
              __int16 v84 = objc_msgSend(v82, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v83);
              (*(void (**)(uint64_t, void, id, void *))(v81 + 16))(v81, 0, v87, v84);

              id v10 = v87;
              double v41 = v88;
              double v75 = v86;
              goto LABEL_59;
            }
            uint64_t v50 = +[PBFPosterRoleCoordinatorChange addPosterToRole:v44 incomingPoster:v49];
          }
          id v54 = (void *)v50;
          [v33 addObject:v50];
        }
        id v85 = v32;
        id v38 = v44;
        uint64_t v55 = v33;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        id v56 = [v89 postersToDelete];
        uint64_t v57 = [v56 countByEnumeratingWithState:&v97 objects:v109 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          uint64_t v59 = *(void *)v98;
          do
          {
            for (uint64_t j = 0; j != v58; ++j)
            {
              if (*(void *)v98 != v59) {
                objc_enumerationMutation(v56);
              }
              int v61 = *(void **)(*((void *)&v97 + 1) + 8 * j);
              BOOL v62 = PBFLogDataStore();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v63 = *(void *)(v21 + 32);
                *(_DWORD *)buf = 138543618;
                uint64_t v113 = v63;
                __int16 v114 = 2114;
                uint64_t v115 = (uint64_t)v61;
                _os_log_impl(&dword_1D31CE000, v62, OS_LOG_TYPE_DEFAULT, "[%{public}@] poster to delete: %{public}@", buf, 0x16u);
              }

              id v64 = objc_msgSend(v61, "pbf_posterUUID");
              uint64_t v65 = +[PBFPosterRoleCoordinatorChange removePosterFromRole:v38 matchingUUID:v64];
              [v55 addObject:v65];
            }
            uint64_t v58 = [v56 countByEnumeratingWithState:&v97 objects:v109 count:16];
          }
          while (v58);
        }

        id v10 = v87;
        int64_t v33 = v55;
        uint64_t v32 = v85;
      }

      uint64_t v66 = *(void **)(v21 + 56);
      id v67 = [NSString stringWithFormat:@"PRSPosterUpdate for %@", v32];
      id v96 = 0;
      LOBYTE(v66) = objc_msgSend(v66, "_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:", v33, 0, 1, v67, 0, &v96);
      long long v44 = v96;

      if (v66)
      {
        uint64_t v68 = *(void **)(v21 + 56);
        uint64_t v69 = [*(id *)(v21 + 40) serverIdentity];
        id v70 = [v69 posterUUID];
        BOOL v71 = objc_msgSend(v68, "_stateLock_posterConfigurationPathForUUID:", v70);

        id v72 = PBFLogDataStore();
        id v26 = v89;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v73 = *(void *)(v21 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v113 = v73;
          __int16 v114 = 2114;
          uint64_t v115 = (uint64_t)v71;
          _os_log_impl(&dword_1D31CE000, v72, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully performed updates; new path: %{public}@",
            buf,
            0x16u);
        }

        double v74 = *(NSObject **)(*(void *)(v21 + 56) + 200);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_312;
        block[3] = &unk_1E6980D30;
        id v91 = *(id *)(v21 + 32);
        id v92 = *(id *)(v21 + 48);
        id v93 = v71;
        id v95 = *(id *)(v21 + 64);
        id v94 = v10;
        double v75 = v71;
        dispatch_async(v74, block);

        double v41 = v88;
      }
      else
      {
        id v26 = v89;
        if (v44)
        {
          double v75 = v44;
        }
        else
        {
          double v76 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v107 = *MEMORY[0x1E4F28588];
          v108 = @"The update was rejected for a reason which defies explanation";
          double v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
          double v75 = objc_msgSend(v76, "pbf_generalErrorWithCode:userInfo:", 0, v77);
        }
        double v41 = v88;
        double v78 = PBFLogDataStore();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_cold_2();
        }

        (*(void (**)(void))(*(void *)(v21 + 64) + 16))();
      }
LABEL_59:

      goto LABEL_60;
    }
    if (v30)
    {
      uint64_t v42 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v113 = v42;
      _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] firing completion handler; updates were rejected because there were some missing updates",
        buf,
        0xCu);
    }

    uint64_t v43 = *(void *)(a1 + 64);
    double v41 = v88;
    if (v88)
    {
      (*(void (**)(uint64_t, void, id, id))(v43 + 16))(v43, 0, v10, v88);
    }
    else
    {
      __int16 v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v105 = *MEMORY[0x1E4F28588];
      v106 = @"The update was rejected because some results did not come in for some updates";
      id v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      __int16 v53 = objc_msgSend(v51, "pbf_generalErrorWithCode:userInfo:", 0, v52);
      (*(void (**)(uint64_t, void, id, void *))(v43 + 16))(v43, 0, v10, v53);
    }
  }
  else
  {
    id v40 = PBFLogDataStore();
    double v41 = v88;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
LABEL_60:
}

uint64_t __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_312(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PBFLogDataStore();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1D31CE000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] firing completion handler for updates %{public}@", (uint8_t *)&v9, 0x16u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "bs_containsObjectPassingTest:", &__block_literal_global_316))
  {
    uint64_t v5 = PBFLogDataStore();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = [MEMORY[0x1E4F926B0] loadAmbientWidgetLayoutForPath:*(void *)(a1 + 48) error:0];
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] ambient identifiers: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

BOOL __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_313(uint64_t a1, void *a2)
{
  return [a2 type] == 9;
}

- (void)_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:(id)a3 toPath:(id)a4 powerLogReason:(int64_t)a5 completion:(id)a6
{
  v372[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (v11)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v12);
    }
    goto LABEL_214;
  }
  uint64_t v13 = [v10 identity];
  uint64_t v14 = [v13 type];

  if (v14 != 3)
  {
    v189 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[path identity] type] == PFServerPosterTypeConfiguration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:].cold.4();
    }
    [v189 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E0B68);
  }
  id v15 = v9;
  NSClassFromString(&cfstr_Nsarray.isa);
  if (!v15)
  {
    uint64_t v190 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:]();
    }
    [v190 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E0BCCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v191 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:]();
    }
    [v191 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E0C30);
  }

  if (!v11)
  {
    uint64_t v192 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore _stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:]();
    }
    [v192 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E0C94);
  }
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v10];
  v286 = [v10 identity];
  v283 = [v286 role];
  v285 = [v286 provider];
  v338[0] = 0;
  v338[1] = v338;
  v338[2] = 0x3032000000;
  v338[3] = __Block_byref_object_copy_;
  v338[4] = __Block_byref_object_dispose_;
  uint64_t v17 = [@"applyUpdates:toPath:powerLogReason:completion: ->" stringByAppendingString:v285];
  id v339 = [(PBFPosterExtensionDataStore *)self acquireSnapshotterInUseAssertionWithReason:v17];

  uint64_t v332 = 0;
  v333 = &v332;
  uint64_t v334 = 0x3032000000;
  v335 = __Block_byref_object_copy_;
  v336 = __Block_byref_object_dispose_;
  id v337 = 0;
  uint64_t v326 = 0;
  v327 = &v326;
  uint64_t v328 = 0x3032000000;
  v329 = __Block_byref_object_copy_;
  v330 = __Block_byref_object_dispose_;
  id v331 = 0;
  uint64_t v18 = self->_instanceCollection;
  id v19 = [(PFPosterExtensionProvider *)self->_extensionProvider extensionForIdentifier];
  v284 = [v19 objectForKey:v285];

  id v20 = [(PFPosterExtensionProvider *)self->_extensionProvider instanceProvider];
  id v325 = 0;
  uint64_t v21 = [v20 acquireInstanceForExtension:v284 reason:@"PosterUpdates" error:&v325];
  id v22 = v325;

  uint64_t v23 = &v319;
  uint64_t v319 = 0;
  v320 = &v319;
  uint64_t v321 = 0x3032000000;
  v322 = __Block_byref_object_copy_;
  v323 = __Block_byref_object_dispose_;
  id v324 = 0;
  v278 = v16;
  uint64_t v313 = 0;
  v314 = (id *)&v313;
  uint64_t v315 = 0x3032000000;
  v316 = __Block_byref_object_copy_;
  v317 = __Block_byref_object_dispose_;
  id v318 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__PBFPosterExtensionDataStore__stateLock_convertPosterUpdatesToRoleCoordinatorChanges_toPath_powerLogReason_completion___block_invoke;
  aBlock[3] = &unk_1E6980D80;
  id v307 = v11;
  id v282 = v21;
  id v305 = v282;
  v279 = v18;
  v306 = v279;
  v308 = &v319;
  v309 = &v313;
  v310 = &v332;
  v311 = &v326;
  v312 = v338;
  uint64_t v24 = _Block_copy(aBlock);
  if (v22 || !v284)
  {
    uint64_t v28 = v22;
    if (!v22)
    {
      id v29 = (void *)MEMORY[0x1E4F28C58];
      v371[0] = *MEMORY[0x1E4F28568];
      v371[1] = @"provider";
      v372[0] = @"Unable to build up a new extension instance to service applying updates";
      uint64_t v30 = [v286 provider];
      uint64_t v23 = (uint64_t *)v30;
      uint64_t v31 = @"(null provider)";
      if (v30) {
        uint64_t v31 = (__CFString *)v30;
      }
      v372[1] = v31;
      v281 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v372 forKeys:v371 count:2];
      uint64_t v28 = objc_msgSend(v29, "pbf_dataStoreErrorWithCode:userInfo:", -2211, v281);
    }
    (*((void (**)(void *, void, void, void *))v24 + 2))(v24, 0, 0, v28);
    v277 = v23;
    if (!v22) {
      goto LABEL_212;
    }
    goto LABEL_213;
  }
  uint64_t v25 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKey:v283];
  v281 = [v25 posterCollection];
  v277 = (uint64_t *)v25;
  id v26 = [(id)objc_opt_class() supportedAttributes];
  v275 = [v281 attributesForPoster:v16 ofTypes:v26];

  id v303 = 0;
  v276 = objc_msgSend(v282, "pr_assetUpdaterWithError:", &v303);
  id v27 = v303;
  v274 = v27;
  if (v27)
  {
    (*((void (**)(void *, void, void, id))v24 + 2))(v24, 0, 0, v27);
    goto LABEL_211;
  }
  if (!v276 || ([v276 isValid] & 1) == 0)
  {
    long long v45 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2211, MEMORY[0x1E4F1CC08]);
    (*((void (**)(void *, void, void, void *))v24 + 2))(v24, 0, 0, v45);
    goto LABEL_210;
  }
  uint64_t v272 = [v276 auditToken];
  if (!v272)
  {
    long long v46 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2210, MEMORY[0x1E4F1CC08]);
    (*((void (**)(void *, void, void, void *))v24 + 2))(v24, 0, 0, v46);
    goto LABEL_209;
  }
  uint64_t v273 = [v276 target];
  if (!v273)
  {
    uint64_t v47 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2209, MEMORY[0x1E4F1CC08]);
    (*((void (**)(void *, void, void, void *))v24 + 2))(v24, 0, 0, v47);
    goto LABEL_208;
  }
  runtimeAssertionProvider = self->_runtimeAssertionProvider;
  int64_t v33 = [@"applyUpdates:toPath:powerLogReason:completion: update for " stringByAppendingString:v285];
  uint64_t v34 = [(PBFRuntimeAssertionProviding *)runtimeAssertionProvider acquirePosterUpdateRuntimeAssertionForReason:v33 target:v273];
  uint64_t v35 = (void *)v333[5];
  v333[5] = v34;

  id v36 = self->_runtimeAssertionProvider;
  uint64_t v37 = [@"applyUpdates:toPath:powerLogReason:completion: entitled update for %@" stringByAppendingString:v285];
  uint64_t v38 = [(PBFRuntimeAssertionProviding *)v36 acquirePosterUpdateMemoryAssertionForReason:v37 target:v273 auditToken:v272 posterProviderBundleIdentifier:v285];
  uint64_t v39 = (void *)v327[5];
  v327[5] = v38;

  id v40 = [(PBFPosterExtensionDataStore *)self _stateLock_switcherConfiguration];
  v268 = [v40 _childPosterConfigurationForConfiguration:v16];

  double v41 = [v268 _path];
  uint64_t v42 = [v41 serverIdentity];

  v262 = [MEMORY[0x1E4F925D8] mutableConfigurationWithRole:v283];
  v256 = [v262 _path];
  id v266 = v42;
  v265 = [MEMORY[0x1E4F925D8] mutableConfigurationWithRole:v283];
  v260 = [v265 _path];
  v261 = objc_opt_new();
  id v302 = 0;
  uint64_t v43 = [v16 loadConfiguredPropertiesWithError:&v302];
  id v44 = v302;
  v254 = v44;
  if (v44)
  {
    (*((void (**)(void *, void, void, id))v24 + 2))(v24, 0, 0, v44);
    v258 = 0;
    v255 = v266;
    goto LABEL_207;
  }
  id v48 = (void *)[v43 mutableCopy];
  id v49 = v48;
  v243 = v43;
  if (v48)
  {
    id v267 = v48;
  }
  else
  {
    id v267 = [MEMORY[0x1E4F926A0] defaultConfiguredPropertiesForRole:v283];
  }

  uint64_t v50 = (void *)[v275 mutableCopy];
  __int16 v51 = v50;
  if (v50) {
    id v259 = v50;
  }
  else {
    id v259 = (id)objc_opt_new();
  }

  v242 = objc_msgSend(v15, "bs_firstObjectPassingTest:", &__block_literal_global_356);

  v244 = objc_opt_new();
  id v301 = 0;
  char v52 = [v265 copyContentsOfConfiguration:v16 error:&v301];
  id v53 = v301;
  id v54 = v53;
  if ((v52 & 1) == 0)
  {
    v175 = v53;
    if (!v53)
    {
      v176 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v369 = *MEMORY[0x1E4F28588];
      v370 = @"Unable to copy contents of existing poster into temporary poster";
      v264 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v370 forKeys:&v369 count:1];
      v175 = objc_msgSend(v176, "pbf_generalErrorWithCode:userInfo:", 7, v264);
    }
    (*((void (**)(void *, void, void, void *))v24 + 2))(v24, 0, 0, v175);
LABEL_190:
    v258 = 0;
    v255 = v266;
    if (!v54) {
      goto LABEL_204;
    }
    goto LABEL_206;
  }

  if (!v268) {
    goto LABEL_37;
  }
  id v300 = 0;
  char v55 = [v262 copyContentsOfConfiguration:v268 error:&v300];
  id v56 = v300;
  id v54 = v56;
  if ((v55 & 1) == 0)
  {
    v175 = v56;
    if (!v56)
    {
      uint64_t v177 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v367 = *MEMORY[0x1E4F28588];
      v368 = @"Unable to copy contents of existing assoc poster into temporary poster";
      v264 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v368 forKeys:&v367 count:1];
      v175 = objc_msgSend(v177, "pbf_generalErrorWithCode:userInfo:", 7, v264);
    }
    (*((void (**)(void *, void, void, void *))v24 + 2))(v24, 0, 0, v175);
    goto LABEL_190;
  }

LABEL_37:
  v264 = objc_opt_new();
  long long v298 = 0u;
  long long v299 = 0u;
  long long v296 = 0u;
  long long v297 = 0u;
  id obj = v15;
  uint64_t v57 = [obj countByEnumeratingWithState:&v296 objects:v366 count:16];
  if (!v57)
  {
    v258 = 0;
    v255 = v266;
    goto LABEL_193;
  }
  v258 = 0;
  uint64_t v253 = *(void *)v297;
  uint64_t v241 = *MEMORY[0x1E4F28588];
  uint64_t v240 = *MEMORY[0x1E4F92748];
  uint64_t v245 = *MEMORY[0x1E4F923B8];
  uint64_t v247 = *MEMORY[0x1E4F92768];
  uint64_t v238 = *MEMORY[0x1E4F923B0];
  uint64_t v239 = *MEMORY[0x1E4F92750];
  v255 = v266;
LABEL_39:
  uint64_t v269 = 0;
  uint64_t v252 = v57;
  while (2)
  {
    if (*(void *)v297 != v253) {
      objc_enumerationMutation(obj);
    }
    v270 = *(void **)(*((void *)&v296 + 1) + 8 * v269);
    unint64_t v271 = [v270 type];
    id v58 = 0;
    int v59 = 1;
    switch(v271)
    {
      case 0uLL:
        goto LABEL_155;
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 8uLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x10uLL:
      case 0x11uLL:
        if ([v283 isEqual:v245])
        {
          id v60 = v270;
          if (v271 == 3)
          {
            v248 = v60;
            id v61 = objc_alloc(MEMORY[0x1E4F92328]);
            BOOL v62 = [v248 payload];
            if (v268) {
              uint64_t v63 = [v61 _initWithUpdateType:4 payload:v62];
            }
            else {
              uint64_t v63 = [v61 _initWithUpdateType:5 payload:v62];
            }
            id v64 = (void *)v63;
          }
          else
          {
            id v64 = v60;
          }
          id v295 = 0;
          int v59 = [v267 applyUpdate:v64 error:&v295];
          id v58 = v295;

LABEL_155:
          if (!v59 || v58) {
            goto LABEL_196;
          }
          if (v271 <= 0xF)
          {
            if (((1 << v271) & 0xE078) != 0)
            {
              uint64_t v158 = [v267 homeScreenConfiguration];
              uint64_t v159 = (void *)[v158 copy];
              [v259 setObject:v159 forKeyedSubscript:v247];
LABEL_160:

              goto LABEL_161;
            }
            if (v271 == 12)
            {
              uint64_t v158 = [v267 ambientConfiguration];
              uint64_t v159 = (void *)[v158 copy];
              [v259 setObject:v159 forKeyedSubscript:v239];
              goto LABEL_160;
            }
          }
LABEL_161:
          uint64_t v160 = [MEMORY[0x1E4F92358] successfulUpdateResultForUpdate:v270];
          [v264 addObject:v160];

          if (v252 != ++v269) {
            continue;
          }
          uint64_t v57 = [obj countByEnumeratingWithState:&v296 objects:v366 count:16];
          if (!v57)
          {
LABEL_193:

            goto LABEL_200;
          }
          goto LABEL_39;
        }
        v178 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v364 = v241;
        v365 = @"This attribute is incompatible with this role";
        uint64_t v179 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v365 forKeys:&v364 count:1];
        uint64_t v180 = objc_msgSend(v178, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v179);
LABEL_195:
        id v58 = (id)v180;

LABEL_196:
        if (!v58)
        {
LABEL_197:
          objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 7, 0);
          id v58 = (id)objc_claimAutoreleasedReturnValue();
        }
        v181 = [MEMORY[0x1E4F92358] failedUpdateResultForUpdate:v270 error:v58];
        [v264 addObject:v181];
        id v54 = v58;

        if (v58)
        {
          (*((void (**)(void *, void, void *, id))v24 + 2))(v24, 0, v264, v58);
          goto LABEL_205;
        }
LABEL_200:
        if (v242)
        {
          id v182 = [PBFPosterConfigurationUpdateResult alloc];
          v183 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v10];
          id v184 = [(PBFPosterConfigurationUpdateResult *)v182 initWithConfiguration:v183 updates:obj changes:v244];
        }
        else
        {
          id v185 = objc_alloc(MEMORY[0x1E4F925C0]);
          id v186 = [v10 identity];
          v187 = [v186 posterUUID];
          id v188 = [v10 identity];
          v183 = (void *)[v185 initWithUpdatedPath:v260 updatedPosterUUID:v187 sourceIdentity:v188 configuredProperties:v267 attributes:v259];

          id v184 = [[PBFPosterConfigurationUpdateResult alloc] initWithIncomingPosterConfiguration:v183 incomingAssocPosterConfiguration:v258 postersToDelete:v261];
        }
        v175 = v184;

        (*((void (**)(void *, void *, void *, void))v24 + 2))(v24, v175, v264, 0);
        id v54 = 0;
LABEL_204:

LABEL_205:
LABEL_206:

        uint64_t v43 = v243;
LABEL_207:

        uint64_t v47 = v268;
LABEL_208:

        long long v46 = (void *)v273;
LABEL_209:

        long long v45 = (void *)v272;
LABEL_210:

LABEL_211:
        uint64_t v28 = v275;
LABEL_212:

LABEL_213:
        _Block_object_dispose(&v313, 8);

        _Block_object_dispose(&v319, 8);
        _Block_object_dispose(&v326, 8);

        _Block_object_dispose(&v332, 8);
        _Block_object_dispose(v338, 8);

LABEL_214:
        return;
      case 6uLL:
        uint64_t v65 = [v270 payload];
        uint64_t v66 = objc_opt_class();
        v249 = __BSSafeCast(v65, v66);

        if (!v249)
        {
          long long v104 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v350 = v241;
          v351 = @"Home Screen Apperance payload was invalid";
          uint64_t v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v351 forKeys:&v350 count:1];
          objc_msgSend(v104, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v105);
          id v97 = (id)objc_claimAutoreleasedReturnValue();
          int v59 = 0;

          goto LABEL_153;
        }
        v230 = [v267 homeScreenConfiguration];
        id v67 = (void *)[v230 mutableCopy];
        uint64_t v68 = v67;
        if (v67)
        {
          id v234 = v67;
        }
        else
        {
          v237 = (void *)MEMORY[0x1E4F925E8];
          v226 = [v10 identity];
          v108 = [v226 provider];
          v109 = [v10 role];
          id v234 = [v237 defaultHomeScreenConfigurationForProvider:v108 role:v109];
        }
        unint64_t v217 = [v249 updatedAppearanceType] - 1;
        if (v217 < 4) {
          [v234 setSelectedAppearanceType:v217];
        }
        v227 = [v249 solidColorAppearance];

        if (v227)
        {
          v208 = [v230 solidColorAppearance];
          id v110 = objc_alloc(MEMORY[0x1E4F92620]);
          v212 = [v249 solidColorAppearance];
          id v111 = [v212 color];
          v112 = [v111 UIColor];
          v220 = (void *)[v110 initWithColor:v112];

          v213 = [v208 colorPickerConfiguration];
          uint64_t v113 = (void *)[v213 copy];
          __int16 v114 = v113;
          if (v113) {
            id v115 = v113;
          }
          else {
            id v115 = objc_alloc_init(MEMORY[0x1E4F925B8]);
          }
          uint64_t v117 = v115;

          [v117 setSelectedColor:v220];
          uint64_t v118 = (void *)[objc_alloc(MEMORY[0x1E4F926D0]) initWithColor:v220 colorPickerConfiguration:v117];
          [v234 setSolidColorAppearance:v118];
        }
        v221 = [v249 gradientColorAppearance];

        if (v221)
        {
          v206 = [v230 gradientAppearance];
          id v119 = objc_alloc(MEMORY[0x1E4F92620]);
          v209 = [v249 gradientColorAppearance];
          uint64_t v120 = [v209 color];
          id v121 = [v120 UIColor];
          v214 = (void *)[v119 initWithColor:v121];

          v210 = [v206 colorPickerConfiguration];
          v122 = (void *)[v210 copy];
          v123 = v122;
          if (v122) {
            id v124 = v122;
          }
          else {
            id v124 = objc_alloc_init(MEMORY[0x1E4F925B8]);
          }
          v125 = v124;

          [v125 setSelectedColor:v214];
          v126 = (void *)[objc_alloc(MEMORY[0x1E4F92670]) initWithColor:v214 colorPickerConfiguration:v125];
          [v234 setGradientAppearance:v126];
        }
        id v127 = [v249 homeProviderIdentifier];
        if (!v127) {
          goto LABEL_108;
        }
        v128 = [v249 homeProviderIdentifier];
        BOOL v129 = v128 == 0;

        if (!v129)
        {
          v207 = [v268 _path];
          v130 = [v207 identity];
          v211 = [v130 provider];

          v215 = [v249 homeProviderIdentifier];
          v131 = [(PBFPosterExtensionDataStore *)self _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:v215];
          LODWORD(v130) = v131 == 0;

          if (v130)
          {
            uint64_t v138 = (void *)MEMORY[0x1E4F28C58];
            v348 = @"providerIdentifier";
            uint64_t v139 = @"(null)";
            if (v215) {
              uint64_t v139 = v215;
            }
            v349 = v139;
            uint64_t v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v349 forKeys:&v348 count:1];
            objc_msgSend(v138, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v140);
            id v127 = (id)objc_claimAutoreleasedReturnValue();
            int v134 = 0;
            goto LABEL_141;
          }
          uint64_t v205 = [v249 homeProviderUpdateSessionInfo];
          if (v268
            && ((v132 = [v211 isEqual:v215], !v215) ? (char v133 = 1) : (char v133 = v132), (v133 & 1) == 0))
          {
            [v261 addObject:v268];
            v202 = [MEMORY[0x1E4F925D8] mutableConfigurationWithRole:v283];

            uint64_t v145 = [v202 _path];

            v255 = 0;
            v256 = (void *)v145;
          }
          else
          {
            v202 = v262;
          }
          v146 = [(PFPosterExtensionProvider *)self->_extensionProvider extensionForIdentifier];
          v263 = [v146 objectForKey:v215];

          id v293 = 0;
          uint64_t v147 = [(PFPosterExtensionInstanceProvider *)v279 acquireInstanceForExtension:v263 reason:@"PosterUpdates" error:&v293];
          id v148 = v293;
          v149 = (void *)v320[5];
          v320[5] = v147;

          if (v148)
          {
            id v150 = 0;
            id v127 = v148;
          }
          else
          {
            id v151 = (void *)v320[5];
            id v292 = 0;
            objc_msgSend(v151, "pr_assetUpdaterWithError:", &v292);
            id v199 = (id)objc_claimAutoreleasedReturnValue();
            id v127 = v292;
            id v150 = v199;
          }
          objc_storeStrong(v314 + 5, v150);
          if (!v148) {

          }
          int v134 = 0;
          if (!v256 || v127) {
            goto LABEL_140;
          }
          id v152 = v314[5];
          id v291 = 0;
          v201 = [(PBFPosterExtensionDataStore *)self _stateLock_prepareReloadConfigurationOperationForExtension:v215 path:v256 locationInUse:0 sessionInfo:v205 powerLogReason:a5 assetUpdater:v152 error:&v291];
          id v200 = v291;
          if (v200)
          {
            id v153 = v200;
            goto LABEL_138;
          }
          objc_msgSend((id)v320[5], "pr_addRefreshConfigurationOperation:waitUntilFinished:", v201, 1);
          id v155 = [v201 error];
          BOOL v156 = v155 == 0;

          if (!v156)
          {
            id v153 = [v201 error];
LABEL_138:
            id v127 = v153;
            int v134 = 0;
LABEL_139:
            [(PFPosterExtensionInstanceProvider *)v279 relinquishExtensionInstance:v320[5] reason:@"PosterUpdates"];
            uint64_t v16 = v278;
            [v314[5] invalidate];

LABEL_140:
            uint64_t v140 = (void *)v205;
            v262 = v202;
LABEL_141:

            goto LABEL_142;
          }
          id v162 = [v201 postRefreshPosterConfiguration];
          id v163 = [v162 contentsURL];
          v164 = [v201 preRefreshPosterConfiguration];
          v165 = [v164 contentsURL];
          int v197 = [v163 isEqual:v165];

          if (v197)
          {
            dispatch_queue_t v166 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v346 = v241;
            v347 = @"Home Screen Poster rejected this update";
            uint64_t v198 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v347 forKeys:&v346 count:1];
            uint64_t v167 = objc_msgSend(v166, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v198);
            goto LABEL_178;
          }
          if (v162)
          {
            uint64_t v198 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v162];
            if (!v255)
            {
              v168 = (void *)MEMORY[0x1E4F924C8];
              dispatch_group_t v169 = [v286 descriptorIdentifier];
              v170 = objc_opt_new();
              v255 = [v168 configurationIdentityWithProvider:v215 identifier:v169 role:v283 posterUUID:v170 version:0 supplement:0];
            }
            v196 = [MEMORY[0x1E4F925D8] mutableConfigurationWithRole:v283];
            id v290 = 0;
            int v171 = [v196 copyContentsOfConfiguration:v198 error:&v290];
            id v127 = v290;
            if (v171)
            {
              id v195 = v196;

              uint64_t v194 = [v195 _path];

              id v203 = objc_alloc(MEMORY[0x1E4F925C0]);
              v172 = [v255 posterUUID];
              v257 = objc_msgSend(v278, "pbf_posterUUID");
              id v173 = [MEMORY[0x1E4F92640] defaultConfiguredPropertiesForRole:v283];
              uint64_t v204 = [v203 initWithNewPath:v194 destinationPosterUUID:v172 parentPosterUUID:v257 sourceIdentity:v255 configuredProperties:v173 attributes:0];

              v258 = (void *)v204;
            }
            else
            {
              uint64_t v194 = (uint64_t)v256;
              id v195 = v202;
            }

            int v134 = 1;
            v256 = (void *)v194;
            v202 = v195;
          }
          else
          {
            id v174 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v344 = v241;
            v345 = @"Home Screen Poster returned no configuration";
            uint64_t v198 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v345 forKeys:&v344 count:1];
            uint64_t v167 = objc_msgSend(v174, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v198);
LABEL_178:
            id v127 = (id)v167;
            int v134 = 0;
          }

          goto LABEL_139;
        }
        id v127 = 0;
LABEL_108:
        int v134 = 0;
LABEL_142:
        [v267 setHomeScreenConfiguration:v234];
        if (v217 < 4) {
          int v157 = 1;
        }
        else {
          int v157 = v134;
        }
        if (v227) {
          int v157 = 1;
        }
        if (v221) {
          int v157 = 1;
        }
        id v97 = v127;
        if (v127) {
          int v59 = 0;
        }
        else {
          int v59 = v157;
        }

LABEL_153:
        goto LABEL_154;
      case 7uLL:
        uint64_t v69 = [v270 payload];
        uint64_t v70 = objc_opt_class();
        v250 = __BSSafeCast(v69, v70);

        if (!v250
          || ([v250 switcherProviderUpdateSessionInfo],
              BOOL v71 = objc_claimAutoreleasedReturnValue(),
              BOOL v72 = v71 == 0,
              v71,
              v72))
        {
          long long v98 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v342 = v241;
          v343 = @"Home Screen Apperance payload was invalid for updating lock screen";
          long long v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v343 forKeys:&v342 count:1];
          objc_msgSend(v98, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v99);
          id v97 = (id)objc_claimAutoreleasedReturnValue();
          int v59 = 0;
          goto LABEL_90;
        }
        uint64_t v73 = [v250 switcherProviderUpdateSessionInfo];
        double v74 = [v10 identity];
        double v75 = [v74 provider];
        id v289 = 0;
        v235 = [(PBFPosterExtensionDataStore *)self _stateLock_prepareReloadConfigurationOperationForExtension:v75 path:v10 locationInUse:0 sessionInfo:v73 powerLogReason:a5 assetUpdater:v276 error:&v289];
        v231 = (void *)v73;
        id v76 = v289;

        if (v76)
        {
          id v77 = v76;
LABEL_88:
          id v97 = v77;
          int v59 = 0;
          goto LABEL_89;
        }
        objc_msgSend(v282, "pr_addRefreshConfigurationOperation:waitUntilFinished:", v235, 1);
        __int16 v116 = [v235 error];

        if (v116)
        {
          id v77 = [v235 error];
          goto LABEL_88;
        }
        v228 = [v235 postRefreshPosterConfiguration];
        v222 = [v228 contentsURL];
        double v141 = [v235 preRefreshPosterConfiguration];
        long long v142 = [v141 contentsURL];
        int v143 = [v222 isEqual:v142];

        if (v143)
        {
          long long v144 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v340 = v241;
          v341 = @"Lock Screen Poster rejected this update";
          v223 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v341 forKeys:&v340 count:1];
          objc_msgSend(v144, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v223);
          id v97 = (id)objc_claimAutoreleasedReturnValue();
          int v59 = 0;
        }
        else
        {
          v223 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v228];
          v218 = [MEMORY[0x1E4F925D8] mutableConfigurationWithRole:v283];
          id v288 = 0;
          int v59 = [v218 copyContentsOfConfiguration:v223 error:&v288];
          id v97 = v288;
          if (v59)
          {
            id v216 = v218;

            uint64_t v161 = [v216 _path];

            v260 = (void *)v161;
          }
          else
          {
            id v216 = v265;
          }

          v265 = v216;
        }

        uint64_t v16 = v278;
LABEL_89:

        long long v99 = v231;
LABEL_90:

        goto LABEL_154;
      case 9uLL:
      case 0xCuLL:
        if (![v283 isEqual:v238])
        {
          v193 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v362 = v241;
          v363 = @"This attribute is incompatible with this role";
          uint64_t v179 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v363 forKeys:&v362 count:1];
          uint64_t v180 = objc_msgSend(v193, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v179);
          goto LABEL_195;
        }
        id v294 = 0;
        int v59 = [v267 applyUpdate:v270 error:&v294];
        id v58 = v294;
        goto LABEL_155;
      case 0xAuLL:
        v90 = [v270 payload];
        uint64_t v91 = objc_opt_class();
        v251 = __BSSafeCast(v90, v91);

        id v92 = [v251 propertyListRoot];
        v236 = [v92 objectForKey:@"chargerIdentifier"];

        id v93 = [(id)objc_opt_class() supportedAttributes];
        char v94 = [v93 containsObject:v240];

        if ((v94 & 1) == 0)
        {
          long long v102 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v360 = v241;
          v361 = @"This attribute is incompatible with this role";
          uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v361 forKeys:&v360 count:1];
          uint64_t v103 = objc_msgSend(v102, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v83);
LABEL_79:
          id v97 = (id)v103;
          int v59 = 0;
          goto LABEL_135;
        }
        if (!v251 || !v236)
        {
          uint64_t v107 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v358 = v241;
          v359 = @"Charger identifier payload was invalid";
          uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v359 forKeys:&v358 count:1];
          uint64_t v103 = objc_msgSend(v107, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v83);
          goto LABEL_79;
        }
        uint64_t v83 = [v275 objectForKey:v240];
        int v233 = [v83 isAssociatedWithChargerIdentifier:v236];
        if (v233)
        {
          id v95 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v356 = v241;
          v357 = @"Charger identifier already associated with poster";
          id v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v357 forKeys:&v356 count:1];
          objc_msgSend(v95, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v96);
          id v97 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v135 = (void *)[v83 mutableCopy];
          id v136 = v135;
          if (v135) {
            id v137 = v135;
          }
          else {
            id v137 = (id)objc_opt_new();
          }
          id v96 = v137;

          [v96 associateWithChargerIdentifier:v236];
          v229 = (void *)[v96 copy];
          if (v242)
          {
            v224 = objc_msgSend(v16, "pbf_posterUUID");
            v154 = +[PBFPosterRoleCoordinatorChange assignAttributeToPosterWithinRole:v283 matchingUUID:v224 attribute:v229];
            [v244 addObject:v154];
          }
          else
          {
            [v259 setObject:v229 forKeyedSubscript:v240];
          }

          id v97 = 0;
        }

        int v59 = v233 ^ 1;
LABEL_135:

LABEL_154:
        id v58 = v97;
        goto LABEL_155;
      case 0xBuLL:
        double v78 = [v270 payload];
        uint64_t v79 = objc_opt_class();
        v251 = __BSSafeCast(v78, v79);

        uint64_t v80 = [v251 propertyListRoot];
        v236 = [v80 objectForKey:@"chargerIdentifier"];

        uint64_t v81 = [(id)objc_opt_class() supportedAttributes];
        char v82 = [v81 containsObject:v240];

        if ((v82 & 1) == 0)
        {
          long long v100 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v354 = v241;
          v355 = @"This attribute is incompatible with this role";
          uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v355 forKeys:&v354 count:1];
          uint64_t v101 = objc_msgSend(v100, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v83);
LABEL_77:
          id v97 = (id)v101;
          int v59 = 0;
          goto LABEL_135;
        }
        if (!v251 || !v236)
        {
          v106 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v352 = v241;
          v353 = @"Charger identifier payload was invalid";
          uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v353 forKeys:&v352 count:1];
          uint64_t v101 = objc_msgSend(v106, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v83);
          goto LABEL_77;
        }
        uint64_t v83 = [v275 objectForKey:v240];
        int v59 = [v83 isAssociatedWithChargerIdentifier:v236];
        if (v59)
        {
          v225 = v83;
          __int16 v84 = (void *)[v83 mutableCopy];
          [v84 disassociateFromChargerIdentifier:v236];
          v219 = v84;
          v232 = (void *)[v84 copy];
          if (v242)
          {
            id v85 = objc_msgSend(v16, "pbf_posterUUID");
            uint64_t v86 = +[PBFPosterRoleCoordinatorChange assignAttributeToPosterWithinRole:v283 matchingUUID:v85 attribute:v232];
            [v244 addObject:v86];
          }
          else
          {
            [v259 setObject:v232 forKeyedSubscript:v240];
          }

          id v97 = 0;
          uint64_t v83 = v225;
        }
        else
        {
          id v97 = 0;
        }
        goto LABEL_135;
      case 0x12uLL:
        id v87 = [v270 payload];
        uint64_t v88 = objc_opt_class();
        id v89 = __BSSafeCast(v87, v88);

        id v287 = 0;
        int v59 = [v267 applyUpdate:v270 error:&v287];
        id v58 = v287;

        goto LABEL_155;
      default:
        goto LABEL_197;
    }
  }
}

uint64_t __120__PBFPosterExtensionDataStore__stateLock_convertPosterUpdatesToRoleCoordinatorChanges_toPath_powerLogReason_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [*(id *)(a1 + 40) relinquishExtensionInstance:v2 reason:@"PosterUpdates"];
  }
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v3) {
    [*(id *)(a1 + 40) relinquishExtensionInstance:v3 reason:@"PosterUpdates"];
  }
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v4) {
    [v4 invalidate];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) invalidate];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) invalidate];
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  return [v5 invalidate];
}

uint64_t __120__PBFPosterExtensionDataStore__stateLock_convertPosterUpdatesToRoleCoordinatorChanges_toPath_powerLogReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateNecessitatesPosterUpdate];
}

- (id)providerForPath:(id)a3
{
  uint64_t v4 = [a3 identity];
  uint64_t v5 = [v4 provider];

  uint64_t v6 = [(PBFPosterExtensionDataStore *)self providerForExtensionIdentifier:v5];

  return v6;
}

- (id)providerForExtensionIdentifier:(id)a3
{
  extensionProvider = self->_extensionProvider;
  id v4 = a3;
  uint64_t v5 = [(PFPosterExtensionProvider *)extensionProvider extensionForIdentifier];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)acquireExtensionInstance:(id)a3 reason:(id)a4 error:(id *)a5
{
  return (id)[(PFPosterExtensionProvider *)self->_extensionProvider acquireInstanceForExtensionWithIdentifier:a3 reason:a4 error:a5];
}

- (void)relinquishExtensionInstance:(id)a3 reason:(id)a4
{
}

- (id)defaultInstanceForExtensionIdentifier:(id)a3
{
  return (id)[(PFPosterExtensionProvider *)self->_extensionProvider defaultInstanceOfProvider:a3 error:0];
}

- (id)pbf_posterSnapshotCoordinatorForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 provider];
  uint64_t v6 = [(PBFPosterExtensionDataStore *)self pbf_posterExtensionStoreCoordinatorForProviderIdentifier:v5 error:0];
  id v7 = objc_msgSend(v6, "pbf_posterSnapshotCoordinatorForIdentity:", v4);

  return v7;
}

- (void)pbf_enumerateSnapshotCoordinators:(id)a3
{
  id v4 = a3;
  p_extensionProvidingLock = &self->_extensionProvidingLock;
  os_unfair_lock_lock(&self->_extensionProvidingLock);
  extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier = self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PBFPosterExtensionDataStore_pbf_enumerateSnapshotCoordinators___block_invoke;
  v8[3] = &unk_1E6980DD0;
  id v9 = v4;
  id v7 = v4;
  [(NSMutableDictionary *)extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier enumerateKeysAndObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_extensionProvidingLock);
}

void __65__PBFPosterExtensionDataStore_pbf_enumerateSnapshotCoordinators___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PBFPosterExtensionDataStore_pbf_enumerateSnapshotCoordinators___block_invoke_2;
  v6[3] = &unk_1E6980DA8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = a4;
  objc_msgSend(a3, "pbf_enumerateSnapshotCoordinators:", v6);
}

uint64_t __65__PBFPosterExtensionDataStore_pbf_enumerateSnapshotCoordinators___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7)
  {
    *a4 = 1;
    **(unsigned char **)(a1 + 40) = 1;
  }
  return result;
}

- (id)pbf_posterExtensionStoreCoordinatorForProviderIdentifier:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    p_extensionProvidingLock = &self->_extensionProvidingLock;
    os_unfair_lock_lock(&self->_extensionProvidingLock);
    uint64_t v8 = [(NSMutableDictionary *)self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier objectForKey:v6];
    os_unfair_lock_unlock(p_extensionProvidingLock);
    if (a4 && !v8)
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = @"providerIdentifier";
      id v15 = v6;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      id v11 = objc_msgSend(v9, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v10);
LABEL_7:
      *a4 = v11;
    }
  }
  else
  {
    if (a4)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28588];
      v17[0] = @"providerIdentifier was nil";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      id v11 = objc_msgSend(v12, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v10);
      uint64_t v8 = 0;
      goto LABEL_7;
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)pbf_posterExtensionStoreCoordinatorsForRole:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PFPosterExtensionProvider *)self->_extensionProvider extensionForIdentifier];
  id v6 = [v5 allValues];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__PBFPosterExtensionDataStore_pbf_posterExtensionStoreCoordinatorsForRole___block_invoke;
  v23[3] = &unk_1E6980DF8;
  id v7 = v4;
  id v24 = v7;
  uint64_t v8 = objc_msgSend(v6, "bs_filter:", v23);
  id v9 = objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_415);

  if ([v9 count])
  {
    id v10 = objc_opt_new();
    os_unfair_lock_lock(&self->_extensionProvidingLock);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = -[NSMutableDictionary objectForKey:](self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier, "objectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
          objc_msgSend(v10, "bs_safeAddObject:", v16);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v13);
    }

    os_unfair_lock_unlock(&self->_extensionProvidingLock);
    uint64_t v17 = (void *)[v10 copy];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

uint64_t __75__PBFPosterExtensionDataStore_pbf_posterExtensionStoreCoordinatorsForRole___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 supportedRoles];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __75__PBFPosterExtensionDataStore_pbf_posterExtensionStoreCoordinatorsForRole___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 posterExtensionBundleIdentifier];
}

- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 completion:(id)a5
{
}

- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 role:(id)a5 completion:(id)a6
{
  v106[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    id v54 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:]();
    }
    [v54 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E1F70);
  }
  uint64_t v14 = (void (**)(void, void, void))v13;
  id v15 = v10;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v15)
  {
    char v55 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:]();
    }
    [v55 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E1FD4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v56 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.7();
    }
    [v56 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E2038);
  }

  id v16 = v12;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v16)
  {
    uint64_t v57 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:]();
    }
    [v57 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E209CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v58 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.6();
    }
    [v58 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E2100);
  }

  uint64_t v17 = (__CFString *)v11;
  if (v17)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v59 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.5();
      }
      [v59 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D31E2164);
    }
  }

  id v77 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v16];
  if (v77)
  {
    os_unfair_lock_lock(&self->_stateLock);
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x3032000000;
    id v92 = __Block_byref_object_copy_;
    id v93 = __Block_byref_object_dispose_;
    id v94 = [MEMORY[0x1E4F925D8] mutableConfigurationWithRole:v16];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke;
    aBlock[3] = &unk_1E6980E40;
    void aBlock[4] = self;
    aBlock[5] = &v89;
    uint64_t v18 = _Block_copy(aBlock);
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke_2;
    v85[3] = &unk_1E6980E68;
    double v74 = v18;
    uint64_t v86 = v74;
    id v70 = v14;
    id v87 = v70;
    double v75 = (void (**)(void *, id))_Block_copy(v85);
    id v84 = 0;
    id v76 = [(PBFPosterExtensionDataStore *)self pbf_posterExtensionStoreCoordinatorForProviderIdentifier:v15 error:&v84];
    id v19 = v84;
    id v20 = v19;
    if (!v76)
    {
      if (!v19)
      {
        uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
        v103[0] = @"providerIdentifier";
        v103[1] = @"posterDescriptorIdentifier";
        uint64_t v31 = @"(null descriptorIdentifier)";
        if (v17) {
          uint64_t v31 = v17;
        }
        v104[0] = v15;
        v104[1] = v31;
        uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:2];
        objc_msgSend(v30, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v32);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v75[2](v75, v20);
      goto LABEL_34;
    }
    if (!v17)
    {
      id v25 = v19;
      goto LABEL_26;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v96 = (PBFPosterExtensionDataStore *)__Block_byref_object_copy_;
    *(void *)&long long v97 = __Block_byref_object_dispose_;
    *((void *)&v97 + 1) = 0;
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke_3;
    v81[3] = &unk_1E6980E90;
    long long v21 = v17;
    char v82 = v21;
    uint64_t v83 = buf;
    [v76 enumerateDescriptorStoreCoordinators:v81];
    long long v22 = *(void **)(*(void *)&buf[8] + 40);
    if (v22)
    {
      uint64_t v23 = (void *)v90[5];
      id v24 = [v22 pathOfLatestVersion];
      id v80 = 0;
      LOBYTE(v23) = [v23 copyContentsOfPath:v24 error:&v80];
      id v25 = v80;

      if (v23)
      {
        uint64_t v73 = [*(id *)(*(void *)&buf[8] + 40) identityOfLatestVersion];
        int v26 = 1;
        goto LABEL_24;
      }
      v75[2](v75, v25);
    }
    else
    {
      int64_t v33 = (void *)MEMORY[0x1E4F28C58];
      v101[0] = @"providerIdentifier";
      v101[1] = @"posterDescriptorIdentifier";
      v102[0] = v15;
      v102[1] = v21;
      uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:2];
      objc_msgSend(v33, "pbf_dataStoreErrorWithCode:userInfo:", -2218, v34);
      id v25 = (id)objc_claimAutoreleasedReturnValue();

      v75[2](v75, v25);
    }
    uint64_t v73 = 0;
    int v26 = 0;
LABEL_24:

    _Block_object_dispose(buf, 8);
    if (!v26)
    {
      id v20 = v25;
LABEL_33:

LABEL_34:
      _Block_object_dispose(&v89, 8);

      goto LABEL_35;
    }
    if (v73)
    {
LABEL_27:
      uint64_t v37 = [v77 defaultAttributesForNewPosterFromProvider:v15];
      BOOL v71 = (void *)[v37 mutableCopy];

      id v38 = objc_alloc(MEMORY[0x1E4F925C0]);
      uint64_t v39 = [(id)v90[5] _path];
      id v40 = [MEMORY[0x1E4F92640] defaultConfiguredPropertiesForRole:v16];
      double v41 = (void *)[v38 initWithNewPath:v39 destinationPosterUUID:0 sourceIdentity:v73 configuredProperties:v40 attributes:v71];

      [v41 trackTemporaryState:v90[5]];
      uint64_t v42 = v41;
      uint64_t v43 = v25;
      uint64_t v68 = v14;
      uint64_t v69 = v42;
      id v67 = +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v16);
      long long v100 = v67;
      id v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
      id v79 = 0;
      long long v45 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContext];
      id v78 = 0;
      BOOL v46 = [(PBFPosterExtensionDataStore *)self _stateLock_executeDataStoreUpdateWithChanges:v44 diffs:&v79 options:0 reason:@"posterCreation" context:v45 error:&v78];
      id v47 = v79;
      id v20 = v78;

      if (v46)
      {
        v74[2]();
        id v48 = [v47 objectForKeyedSubscript:v16];
        id v49 = v48;
        if (!v48)
        {
          id v60 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleDiffInspector != nil"];
          id v61 = MEMORY[0x1E4F14500];
          id v62 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            id v63 = (id)objc_claimAutoreleasedReturnValue();
            id v64 = (objc_class *)objc_opt_class();
            uint64_t v65 = NSStringFromClass(v64);
            *(_DWORD *)buf = 138544642;
            *(void *)&uint8_t buf[4] = v63;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v65;
            *(_WORD *)&buf[22] = 2048;
            id v96 = self;
            LOWORD(v97) = 2114;
            *(void *)((char *)&v97 + 2) = @"PBFPosterExtensionDataStore.m";
            WORD5(v97) = 1024;
            HIDWORD(v97) = 2173;
            __int16 v98 = 2114;
            long long v99 = v60;
            _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v60 UTF8String];
          uint64_t v66 = _bs_set_crash_log_message();
          -[PBFPosterExtensionDataStore createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:].cold.4(v66);
        }
        uint64_t v50 = (void *)[v48 newCollection];
        __int16 v51 = [v69 destinationUUID];
        char v52 = [v50 posterWithUUID:v51];

        id v53 = [v52 _path];
        (*((void (**)(id, void *, id))v70 + 2))(v70, v53, v20);
      }
      else
      {
        v75[2](v75, v20);
      }

      uint64_t v14 = v68;
      goto LABEL_33;
    }
LABEL_26:
    uint64_t v35 = (void *)MEMORY[0x1E4F924C8];
    id v36 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v73 = [v35 configurationIdentityWithProvider:v15 identifier:v17 role:v16 posterUUID:v36 version:0 supplement:0];

    goto LABEL_27;
  }
  id v27 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v105 = @"roleIdentifier";
  v106[0] = v16;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:&v105 count:1];
  id v29 = objc_msgSend(v27, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v28);
  ((void (**)(void, void, void *))v14)[2](v14, 0, v29);

LABEL_35:
}

void __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 188);
  os_unfair_lock_unlock(v4);
}

void __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v4);
  }
}

void __121__PBFPosterExtensionDataStore_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 descriptorIdentifier];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)refreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = v8;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v12)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore refreshPosterConfigurationMatchingUUID:sessionInfo:completion:]();
    }
LABEL_11:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E2578);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore refreshPosterConfigurationMatchingUUID:sessionInfo:completion:]();
    }
    goto LABEL_11;
  }

  os_unfair_lock_lock(&self->_stateLock);
  [(PBFPosterExtensionDataStore *)self _stateLock_enqueueRefreshPosterConfigurationMatchingUUID:v12 sessionInfo:v9 powerLogReason:3 completion:v10];
  os_unfair_lock_unlock(&self->_stateLock);
}

- (id)posterConfigurationsForRole:(id)a3 error:(id *)a4
{
  id v4 = [(PBFPosterExtensionDataStore *)self posterCollectionForRole:a3 error:a4];
  uint64_t v5 = [v4 orderedPosters];
  id v6 = [v5 array];
  int v7 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_440);

  return v7;
}

uint64_t __65__PBFPosterExtensionDataStore_posterConfigurationsForRole_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _path];
}

- (id)posterCollectionForRole:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v8 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v6];
  if (v8)
  {
    id v9 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v6];
    a4 = [v9 posterCollection];
  }
  else if (a4)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    if (v6) {
      id v11 = v6;
    }
    else {
      id v11 = @"(null role identifier)";
    }
    uint64_t v14 = @"roleIdentifier";
    v15[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    objc_msgSend(v10, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
  os_unfair_lock_unlock(p_stateLock);

  return a4;
}

- (id)posterConfigurationsForExtension:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  roleToRoleCoordinator = self->_roleToRoleCoordinator;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __64__PBFPosterExtensionDataStore_posterConfigurationsForExtension___block_invoke;
  id v15 = &unk_1E6980F00;
  id v16 = v4;
  id v17 = v5;
  id v8 = v5;
  id v9 = v4;
  [(NSDictionary *)roleToRoleCoordinator enumerateKeysAndObjectsUsingBlock:&v12];
  os_unfair_lock_unlock(p_stateLock);
  id v10 = objc_msgSend(v8, "copy", v12, v13, v14, v15);

  return v10;
}

void __64__PBFPosterExtensionDataStore_posterConfigurationsForExtension___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 posterCollection];
  uint64_t v5 = [v4 orderedPosters];
  id v6 = [v5 array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PBFPosterExtensionDataStore_posterConfigurationsForExtension___block_invoke_2;
  v7[3] = &unk_1E6980ED8;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  [v6 enumerateObjectsUsingBlock:v7];
}

void __64__PBFPosterExtensionDataStore_posterConfigurationsForExtension___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_msgSend(v7, "pbf_posterProvider");
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [v7 _path];
    [v5 addObject:v6];
  }
}

- (id)activePosterForRole:(id)a3 assocPoster:(id *)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = PBFLogDataStore();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = PBFLogDataStore();
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v8;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "activePosterForRole", "role: %{public}@", buf, 0xCu);
  }

  uint64_t v13 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v8];
  if (v13)
  {
    p_activePosterLock = &self->_activePosterLock;
    os_unfair_lock_lock(&self->_activePosterLock);
    id v15 = [v13 posterCollection];
    id v16 = [(NSMutableDictionary *)self->_activePosterLock_roleToActivePosterConfiguration objectForKeyedSubscript:v8];
    os_unfair_lock_unlock(p_activePosterLock);
    if (!a5 || v16)
    {
      if (a4 && v16)
      {
        *a4 = [v15 associatedPosterForPoster:v16];
      }
    }
    else
    {
      id v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = @"(null role identifier)";
      if (v8) {
        uint64_t v18 = v8;
      }
      uint64_t v19 = *MEMORY[0x1E4F28588];
      v27[0] = @"roleIdentifier";
      v27[1] = v19;
      v28[0] = v18;
      v28[1] = @"No active poster could be determined for role";
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
      objc_msgSend(v17, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    long long v21 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[PBFPosterExtensionDataStore activePosterForRole:assocPoster:error:]();
    }

    if (!a5)
    {
      id v16 = 0;
      goto LABEL_21;
    }
    long long v22 = (void *)MEMORY[0x1E4F28C58];
    if (v8) {
      uint64_t v23 = v8;
    }
    else {
      uint64_t v23 = @"(null role identifier)";
    }
    id v29 = @"roleIdentifier";
    uint64_t v30 = v23;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    objc_msgSend(v22, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v15);
    id v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_21:
  id v24 = PBFLogDataStore();
  id v25 = v24;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v8;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v25, OS_SIGNPOST_INTERVAL_END, v10, "activePosterForRole", "role: %{public}@", buf, 0xCu);
  }

  return v16;
}

- (id)selectedPosterForRole:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v8 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v6];
  id v9 = v8;
  if (v8)
  {
    os_signpost_id_t v10 = [v8 posterCollection];
    a4 = [v10 selectedPoster];
  }
  else if (a4)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    if (v6) {
      uint64_t v12 = v6;
    }
    else {
      uint64_t v12 = @"(null role identifier)";
    }
    id v15 = @"roleIdentifier";
    v16[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_msgSend(v11, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
  os_unfair_lock_unlock(p_stateLock);

  return a4;
}

- (BOOL)updateSelectedPosterUUID:(id)a3 role:(id)a4 from:(id)a5 error:(id *)a6
{
  v70[2] = *MEMORY[0x1E4F143B8];
  id v11 = (uint64_t (*)(uint64_t, uint64_t))a3;
  uint64_t v12 = (__CFString *)a4;
  id v53 = a5;
  if (v11)
  {
    uint64_t v13 = PBFLogDataStore();
    os_signpost_id_t v52 = os_signpost_id_generate(v13);

    uint64_t v14 = PBFLogDataStore();
    id v15 = v14;
    if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v53;
      *(_WORD *)&buf[22] = 2114;
      id v64 = v11;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v52, "updateSelectedPosterUUID:role:from:", "role: %{public}@ bundleIdentifier: %{public}@ configurationUUID: %{public}@", buf, 0x20u);
    }

    uint64_t v55 = 0;
    id v56 = &v55;
    uint64_t v57 = 0x2020000000;
    char v58 = 0;
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    id v17 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v12];
    uint64_t v18 = v17;
    if (!v17)
    {
      if (!a6) {
        goto LABEL_44;
      }
      id v29 = (void *)MEMORY[0x1E4F28C58];
      if (v12) {
        uint64_t v30 = v12;
      }
      else {
        uint64_t v30 = @"(null role identifier)";
      }
      id v67 = @"roleIdentifier";
      uint64_t v68 = v30;
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      objc_msgSend(v29, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v19);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_43:

LABEL_44:
      os_unfair_lock_unlock(p_stateLock);
      uint64_t v42 = PBFLogDataStore();
      uint64_t v43 = v42;
      if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2114;
        id v64 = v11;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v43, OS_SIGNPOST_INTERVAL_END, v52, "updateSelectedPosterUUID:role:from:", "role: %{public}@ bundleIdentifier: %{public}@ configurationUUID: %{public}@", buf, 0x20u);
      }

      BOOL v28 = *((unsigned char *)v56 + 24) != 0;
      _Block_object_dispose(&v55, 8);
      goto LABEL_48;
    }
    uint64_t v19 = [v17 posterCollection];
    __int16 v51 = [v19 posterWithUUID:v11];
    uint64_t v50 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_activeChargerIdentifier");
    int v20 = [(__CFString *)v12 isEqual:*MEMORY[0x1E4F92740]];
    if (v50) {
      int v21 = v20;
    }
    else {
      int v21 = 0;
    }
    if (v21 == 1)
    {
      id v48 = objc_msgSend(MEMORY[0x1E4F92328], "posterUpdateAssociateWithChargerIdentifier:");
      if (v51)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        id v64 = __Block_byref_object_copy_;
        uint64_t v65 = __Block_byref_object_dispose_;
        id v66 = 0;
        id v62 = v48;
        long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __72__PBFPosterExtensionDataStore_updateSelectedPosterUUID_role_from_error___block_invoke;
        v54[3] = &unk_1E6980F28;
        v54[4] = buf;
        v54[5] = &v55;
        [(PBFPosterExtensionDataStore *)self _stateLock_updatePosterConfiguration:v51 updates:v22 completion:v54];

        if (a6)
        {
          uint64_t v23 = *(void **)(*(void *)&buf[8] + 40);
          if (v23) {
            *a6 = v23;
          }
        }
        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      if (!v51)
      {
        if (a6)
        {
          uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
          if (v12) {
            uint64_t v33 = v12;
          }
          else {
            uint64_t v33 = @"(null role identifier)";
          }
          v60[0] = @"roleIdentifier";
          v60[1] = @"configurationUUID";
          v61[0] = v33;
          id v49 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v11);
          v61[1] = v49;
          uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
          objc_msgSend(v32, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v34);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_42;
      }
      id v48 = [v19 selectedPoster];
      id v47 = [(PBFPosterExtensionDataStore *)self activePosterConfigurationForRole:v12 assocPoster:0];
      int v31 = [v48 isEqual:v51];
      if ((v31 & [v48 isEqual:v47]) == 1)
      {
        *((unsigned char *)v56 + 24) = 1;
      }
      else
      {
        BOOL v46 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContextWithDesiredActivePosterUUID:v11 role:v12];
        if ((v31 & 1) != 0
          || [(__CFString *)v12 isEqual:*MEMORY[0x1E4F92790]]
          && ([v51 loadFocusConfigurationWithError:0],
              uint64_t v35 = objc_claimAutoreleasedReturnValue(),
              BOOL v36 = v35 == 0,
              v35,
              !v36))
        {
          long long v45 = 0;
        }
        else
        {
          uint64_t v37 = +[PBFPosterRoleCoordinatorChange selectPosterForRole:v12 matchingUUID:v11];
          int v59 = v37;
          long long v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        }
        id v38 = NSString;
        uint64_t v39 = NSStringFromSelector(a2);
        id v40 = [v38 stringWithFormat:@"%@ from %@", v39, v53];

        BOOL v41 = [(PBFPosterExtensionDataStore *)self _stateLock_executeDataStoreUpdateWithChanges:v45 diffs:0 options:0 reason:v40 context:v46 error:a6];
        *((unsigned char *)v56 + 24) = v41;
      }
    }

LABEL_42:
    goto LABEL_43;
  }
  if (a6)
  {
    id v24 = (void *)MEMORY[0x1E4F28C58];
    if (v12) {
      id v25 = v12;
    }
    else {
      id v25 = @"(null role identifier)";
    }
    v69[0] = @"roleIdentifier";
    v69[1] = @"configurationUUID";
    v70[0] = v25;
    int v26 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", 0);
    v70[1] = v26;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
    objc_msgSend(v24, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v27);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v28 = 0;
LABEL_48:

  return v28;
}

void __72__PBFPosterExtensionDataStore_updateSelectedPosterUUID_role_from_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a4);
  if (!v6) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)executeDataStoreUpdateWithChanges:(id)a3 diffs:(id *)a4 options:(unint64_t)a5 reason:(id)a6 error:(id *)a7
{
  p_stateLock = &self->_stateLock;
  id v13 = a6;
  id v14 = a3;
  os_unfair_lock_lock(p_stateLock);
  LOBYTE(a7) = [(PBFPosterExtensionDataStore *)self _stateLock_executeDataStoreUpdateWithChanges:v14 diffs:a4 options:a5 reason:v13 context:0 error:a7];

  os_unfair_lock_unlock(p_stateLock);
  return (char)a7;
}

- (BOOL)deletePosterConfigurationsMatchingUUID:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v9 = [(PBFPosterExtensionDataStore *)self _stateLock_posterWithUUID:v7 error:0];
  os_signpost_id_t v10 = (void *)v9;
  if (v7 && v9)
  {
    id v11 = +[PBFPosterDataStoreEventBuilder posterDeleted:v9];
    uint64_t v12 = [v11 userInfo];
    id v13 = (void *)[v12 mutableCopy];
    id v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = (id)objc_opt_new();
    }
    id v17 = v15;

    uint64_t v19 = NSStringFromSelector(a2);
    [v17 setObject:v19 forKeyedSubscript:@"origin"];

    uint64_t v20 = [v11 buildWithError:a4];
    int v21 = (void *)v20;
    if (v20)
    {
      uint64_t v24 = v20;
      long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      BOOL v18 = [(PBFPosterExtensionDataStore *)self _stateLock_processEvents:v22 context:0 error:a4];
    }
    else
    {
      BOOL v18 = 0;
    }

    goto LABEL_13;
  }
  if (a4)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    id v25 = @"configurationUUID";
    id v11 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v7);
    v26[0] = v11;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    objc_msgSend(v16, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v17);
    BOOL v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  BOOL v18 = 0;
LABEL_14:
  os_unfair_lock_unlock(p_stateLock);

  return v18;
}

- (BOOL)togglePosterConfigurationHiddenMatchingUUID:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v8 = [(PBFPosterExtensionDataStore *)self _stateLock_posterWithUUID:v6 error:0];
  uint64_t v9 = v8;
  if (v6 && v8)
  {
    os_signpost_id_t v10 = [v8 loadConfiguredPropertiesWithError:0];
    id v11 = (void *)[v10 mutableCopy];

    uint64_t v12 = [v11 ambientConfiguration];
    id v13 = (void *)[v12 mutableCopy];

    objc_msgSend(v13, "setHidden:", objc_msgSend(v13, "hidden") ^ 1);
    [v11 setAmbientConfiguration:v13];
    id v14 = objc_opt_new();
    id v15 = +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:v11 forPosterWithinRole:*MEMORY[0x1E4F92740] matchingUUID:v6];
    [v14 addObject:v15];

    id v16 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContext];
    BOOL v17 = [(PBFPosterExtensionDataStore *)self _stateLock_executeDataStoreUpdateWithChanges:v14 diffs:0 options:0 reason:@"toggledHidden" context:v16 error:0];
  }
  else
  {
    if (a4)
    {
      BOOL v18 = (void *)MEMORY[0x1E4F28C58];
      long long v22 = @"configurationUUID";
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v6);
      v23[0] = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      objc_msgSend(v18, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v17 = 0;
  }
  os_unfair_lock_unlock(p_stateLock);

  return v17;
}

- (void)duplicatePosterConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v12 = v7;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v12)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore duplicatePosterConfigurationMatchingUUID:completion:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E3C38);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    os_signpost_id_t v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore duplicatePosterConfigurationMatchingUUID:completion:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E3C9CLL);
  }

  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PBFPosterExtensionDataStore.m", 2418, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_stateLock);
  [(PBFPosterExtensionDataStore *)self _stateLock_duplicatePosterConfigurationMatchingUUID:v12 completion:v8];
  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)_stateLock_duplicatePosterConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    aSelector = a2;
    int v31 = v8;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    os_signpost_id_t v10 = [(NSDictionary *)self->_roleToRoleCoordinator keyEnumerator];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
LABEL_6:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
        id v16 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKey:v15];
        BOOL v17 = [v16 posterCollection];
        BOOL v18 = [v17 posterWithUUID:v7];

        if (v18) {
          break;
        }

        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v12) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      uint64_t v9 = v15;
      long long v22 = [v16 posterCollection];
      uint64_t v19 = [v22 posterWithUUID:v7];

      if (v9 && v19)
      {
        uint64_t v23 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v24 = +[PBFPosterRoleCoordinatorChange duplicatePosterWithinRole:v9 matchingUUID:v7 toUUID:v23];
        uint64_t v37 = v24;
        id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
        int v26 = NSStringFromSelector(aSelector);
        id v32 = 0;
        [(PBFPosterExtensionDataStore *)self _stateLock_executeDataStoreUpdateWithChanges:v25 diffs:0 options:0 reason:v26 context:0 error:&v32];
        id v27 = v32;

        id v8 = v31;
        if (v31)
        {
          if (v27) {
            BOOL v28 = 0;
          }
          else {
            BOOL v28 = v23;
          }
          ((void (**)(id, void *, void *))v31)[2](v31, v28, v27);
        }

        goto LABEL_24;
      }
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      id v38 = @"configurationID";
      uint64_t v39 = @"role";
      v40[0] = v7;
      int v21 = @"(null role)";
      if (v9) {
        int v21 = v9;
      }
    }
    else
    {
LABEL_12:

      uint64_t v19 = 0;
      uint64_t v9 = 0;
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      id v38 = @"configurationID";
      uint64_t v39 = @"role";
      v40[0] = v7;
      int v21 = @"(null role)";
    }
    id v8 = v31;
    v40[1] = v21;
    id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v38 count:2];
    uint64_t v23 = objc_msgSend(v20, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v29);

    v8[2](v8, 0, v23);
LABEL_24:

    goto LABEL_25;
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v9);
LABEL_25:
  }
}

- (id)exportPosterConfigurationMatchingUUID:(id)a3 error:(id *)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v6)
  {
    BOOL v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore exportPosterConfigurationMatchingUUID:error:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E42A0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore exportPosterConfigurationMatchingUUID:error:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E4304);
  }

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v19 = 0;
  id v20 = 0;
  [(PBFPosterExtensionDataStore *)self _stateLock_findStoreCoordinatorsForUUID:v6 extensionStoreCoordinator:&v20 configurationStoreCoordinator:&v19];
  id v8 = v20;
  id v9 = v19;
  os_unfair_lock_unlock(p_stateLock);
  if (v8 && v9)
  {
    a4 = +[PBFPosterConfigurationStoreArchiver archiveConfigurationStoreWithCoordinator:v9 error:a4];
  }
  else if (a4)
  {
    os_signpost_id_t v10 = (void *)MEMORY[0x1E4F28C58];
    v21[0] = @"providerIdentifier";
    uint64_t v11 = [v8 extensionIdentifier];
    uint64_t v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (__CFString *)v11;
    }
    else {
      uint64_t v13 = @"(null)";
    }
    v21[1] = @"configurationUUID";
    v22[0] = v13;
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v6);
    v22[1] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    objc_msgSend(v10, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (void)importPosterConfigurationFromArchiveData:(id)a3 completion:(id)a4
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  id v9 = v7;
  NSClassFromString(&cfstr_Nsdata.isa);
  if (!v9)
  {
    uint64_t v42 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore importPosterConfigurationFromArchiveData:completion:]();
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E4944);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDataClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore importPosterConfigurationFromArchiveData:completion:]();
    }
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E49A8);
  }

  id v63 = 0;
  id v64 = 0;
  os_signpost_id_t v10 = +[PBFPosterConfigurationStoreArchiver unarchiveConfigurationStoreArchiveData:v9 manifest:&v64 error:&v63];
  id v11 = v64;
  id v12 = v63;
  if (v10)
  {
    uint64_t v13 = [v11 extensionIdentifier];
    id v62 = 0;
    uint64_t v14 = [(PBFPosterExtensionDataStore *)self pbf_posterExtensionStoreCoordinatorForProviderIdentifier:v13 error:&v62];
    id v56 = v62;

    if (!v14 || v56)
    {
      if (v56)
      {
        id v19 = v56;
      }
      else
      {
        id v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v69 = @"providerIdentifier";
        uint64_t v28 = [v11 extensionIdentifier];
        v70[0] = v28;
        id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
        objc_msgSend(v27, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v29);
        id v19 = (id)objc_claimAutoreleasedReturnValue();

        id v12 = (id)v28;
      }

      v8[2](v8, 0, v19);
      goto LABEL_23;
    }
    uint64_t v55 = v14;
    id v15 = [v11 role];
    if ((PFPosterRoleIsValid() & 1) == 0)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      if (v15) {
        id v25 = v15;
      }
      else {
        id v25 = @"()";
      }
      id v67 = @"role";
      uint64_t v68 = v25;
      int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      objc_msgSend(v24, "pbf_dataStoreErrorWithCode:userInfo:", -2203, v26);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      v8[2](v8, 0, v19);
      goto LABEL_22;
    }
    aSelector = a2;
    os_unfair_lock_t lock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    uint64_t v54 = +[PBFPosterRoleCoordinatorChange addPosterToRole:v15 incomingPoster:v10];
    uint64_t v66 = v54;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
    id v61 = 0;
    BOOL v17 = v15;
    BOOL v18 = [(PBFPosterExtensionDataStore *)self _stateLock_executeDataStoreUpdateWithChanges:v16 diffs:0 options:0 reason:@"importPoster" context:0 error:&v61];
    id v19 = v61;

    if (v18)
    {
      id v53 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v17];
      id v20 = [v53 posterCollection];
      int v21 = [v10 destinationUUID];
      id v48 = v20;
      id v22 = [v20 posterWithUUID:v21];

      os_unfair_lock_unlock(lock);
      id v15 = v17;
      if (!v19)
      {
        id v44 = [PBFPosterSnapshotRequest alloc];
        BOOL v46 = v22;
        os_unfair_lock_t locka = [v22 _path];
        int v31 = objc_msgSend(v22, "pbf_posterProvider");
        id v32 = [v48 configuredPropertiesForPoster:v22];
        +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions];
        v33 = id v47 = v15;
        long long v34 = +[PBFGenericDisplayContext mainScreen];
        long long v45 = [(PBFPosterSnapshotRequest *)v44 initWithPath:locka provider:v31 configuredProperties:v32 definitions:v33 context:v34];

        long long v35 = [(PBFPosterSnapshotRequest *)v45 requestWithLoadFromCacheIfAvailable:0];
        os_unfair_lock_t lockb = [v35 requestWithPowerLogReason:6];

        long long v36 = NSStringFromSelector(aSelector);
        uint64_t v37 = [(PBFPosterExtensionDataStore *)self acquireSnapshotterInUseAssertionWithReason:v36];

        snapshotManager = self->_snapshotManager;
        os_unfair_lock_t v65 = lockb;
        uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        void v57[2] = __83__PBFPosterExtensionDataStore_importPosterConfigurationFromArchiveData_completion___block_invoke;
        v57[3] = &unk_1E6980F50;
        v57[4] = self;
        id v22 = v46;
        id v58 = v22;
        id v59 = v37;
        id v60 = v8;
        id v40 = v37;
        id v15 = v47;
        id v41 = v40;
        [(PBFPosterSnapshotManager *)snapshotManager prewarmSnapshotsForRequests:v39 completion:v57];

        uint64_t v30 = (void *)v54;
        uint64_t v14 = v55;
        uint64_t v23 = v48;
        goto LABEL_21;
      }
      uint64_t v23 = v48;
    }
    else
    {
      os_unfair_lock_unlock(lock);
      id v22 = 0;
      uint64_t v23 = 0;
      id v53 = 0;
      id v15 = v17;
    }
    v8[2](v8, 0, v19);
    uint64_t v30 = (void *)v54;
    uint64_t v14 = v55;
LABEL_21:

LABEL_22:
LABEL_23:

    id v12 = v19;
    goto LABEL_24;
  }
  v8[2](v8, 0, v12);
LABEL_24:
}

uint64_t __83__PBFPosterExtensionDataStore_importPosterConfigurationFromArchiveData_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyObserversDidAddConfiguration:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _notifyObserversDidUpdateConfigurations];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = [*(id *)(a1 + 40) _path];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, 0);

  int v4 = *(void **)(a1 + 48);
  return [v4 invalidate];
}

- (void)refreshSnapshotForPosterConfigurationMatchUUID:(id)a3 completion:(id)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    long long v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore refreshSnapshotForPosterConfigurationMatchUUID:completion:]();
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E4EC8);
  }
  id v9 = (void (**)(void, void))v8;
  id v10 = v7;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v10)
  {
    long long v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore refreshSnapshotForPosterConfigurationMatchUUID:completion:]();
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E4F2CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore refreshSnapshotForPosterConfigurationMatchUUID:completion:]();
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E4F90);
  }

  os_unfair_lock_lock(&self->_stateLock);
  id v11 = [(PBFPosterExtensionDataStore *)self _stateLock_fetchPosterConfigurations];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __89__PBFPosterExtensionDataStore_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke;
  v43[3] = &unk_1E6980F78;
  id v12 = v10;
  id v44 = v12;
  uint64_t v13 = objc_msgSend(v11, "bs_firstObjectPassingTest:", v43);

  os_unfair_lock_unlock(&self->_stateLock);
  if (v13)
  {
    os_unfair_lock_lock(&self->_stateLock);
    id v42 = 0;
    [(PBFPosterExtensionDataStore *)self _stateLock_findStoreCoordinatorsForUUID:v12 extensionStoreCoordinator:0 configurationStoreCoordinator:&v42];
    id v14 = v42;
    os_unfair_lock_unlock(&self->_stateLock);
    if (v14)
    {
      id v15 = NSStringFromSelector(a2);
      id v16 = [(PBFPosterExtensionDataStore *)self acquireSnapshotterInUseAssertionWithReason:v15];

      BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v13];
      BOOL v18 = [PBFPosterSnapshotRequest alloc];
      id v19 = +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions];
      id v20 = +[PBFGenericDisplayContext mainScreen];
      int v21 = [(PBFPosterSnapshotRequest *)v18 initWithConfiguration:v17 definitions:v19 context:v20];

      id v22 = [(PBFPosterSnapshotRequest *)v21 requestWithPowerLogReason:3];

      uint64_t v23 = [v22 requestWithLoadFromCacheIfAvailable:0];

      snapshotManager = self->_snapshotManager;
      long long v45 = v23;
      id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __89__PBFPosterExtensionDataStore_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke_2;
      v38[3] = &unk_1E6980FA0;
      v38[4] = self;
      id v39 = v17;
      id v40 = v16;
      id v41 = v9;
      id v26 = v16;
      id v27 = v17;
      [(PBFPosterSnapshotManager *)snapshotManager prewarmSnapshotsForRequests:v25 completion:v38];
    }
    else
    {
      int v31 = (void *)MEMORY[0x1E4F28C58];
      BOOL v46 = @"configurationUUID";
      id v32 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v12);
      id v47 = v32;
      long long v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      uint64_t v34 = objc_msgSend(v31, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v33);

      v9[2](v9, v34);
      uint64_t v23 = 0;
      id v14 = (id)v34;
    }
  }
  else
  {
    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    id v48 = @"configurationUUID";
    id v29 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v12);
    v49[0] = v29;
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
    objc_msgSend(v28, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v30);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    ((void (**)(void, id))v9)[2](v9, v14);
  }
}

uint64_t __89__PBFPosterExtensionDataStore_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 serverIdentity];
  int v4 = [v3 posterUUID];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

void __89__PBFPosterExtensionDataStore_refreshSnapshotForPosterConfigurationMatchUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 _notifyObserversDidUpdateConfiguration:v4];
  [*(id *)(a1 + 32) _notifyObserversDidUpdateSnapshotForConfiguration:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)ingestSnapshotCollection:(id)a3 forPosterConfigurationUUID:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  NSClassFromString(&cfstr_Prspostersnaps_0.isa);
  if (!v10)
  {
    id v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore ingestSnapshotCollection:forPosterConfigurationUUID:error:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E545CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterSnapshotCollectionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore ingestSnapshotCollection:forPosterConfigurationUUID:error:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E54C0);
  }

  id v11 = v9;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v11)
  {
    id v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore ingestSnapshotCollection:forPosterConfigurationUUID:error:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E5524);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore ingestSnapshotCollection:forPosterConfigurationUUID:error:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E5588);
  }

  id v12 = PBFLogDataStore();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  id v14 = PBFLogDataStore();
  id v15 = v14;
  unint64_t v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ingestSnapshotCollection:forPosterConfigurationUUID:", "configurationUUID: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_stateLock);
  BOOL v17 = [(PBFPosterExtensionDataStore *)self _stateLock_fetchPosterConfigurations];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  void v31[2] = __89__PBFPosterExtensionDataStore_ingestSnapshotCollection_forPosterConfigurationUUID_error___block_invoke;
  void v31[3] = &unk_1E6980F78;
  id v18 = v11;
  id v32 = v18;
  id v19 = objc_msgSend(v17, "bs_firstObjectPassingTest:", v31);

  os_unfair_lock_unlock(&self->_stateLock);
  if (v19)
  {
    id v20 = [objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v19];
    if ([(PBFPosterSnapshotManager *)self->_snapshotManager ingestSnapshotCollection:v10 forConfiguration:v20 error:a5])
    {
      [(PBFPosterExtensionDataStore *)self _notifyObserversDidUpdateSnapshotForConfiguration:v20];
    }
    int v21 = PBFLogDataStore();
    id v22 = v21;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 138543362;
      id v36 = v18;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v22, OS_SIGNPOST_INTERVAL_END, v13, "ingestSnapshotCollection:forPosterConfigurationUUID:", "configurationUUID: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (a5)
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      long long v33 = @"configurationUUID";
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v18);
      uint64_t v34 = v24;
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v26 = PBFLogDataStore();
    id v20 = v26;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_DWORD *)buf = 138543362;
      id v36 = v18;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v20, OS_SIGNPOST_INTERVAL_END, v13, "ingestSnapshotCollection:forPosterConfigurationUUID:", "configurationUUID: %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __89__PBFPosterExtensionDataStore_ingestSnapshotCollection_forPosterConfigurationUUID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 serverIdentity];
  uint64_t v4 = [v3 posterUUID];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (id)fetchPosterConfigurationsSortedByUseForRole:(id)a3
{
  p_stateLock = &self->_stateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  id v6 = [(PBFPosterExtensionDataStore *)self _stateLock_fetchPosterConfigurationsSortedByUse:1 forRole:v5];

  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

- (void)notePosterConfigurationUnderlyingModelDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(NSDictionary *)self->_roleToRoleCoordinator allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) posterCollection];
        id v12 = [v11 posterWithUUID:v4];

        if (v12)
        {
          os_signpost_id_t v13 = (void *)MEMORY[0x1E4F926A8];
          id v14 = [v12 _path];
          [v13 invalidateModelObjectCacheForPath:v14];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_stateLock);
}

- (id)_stateLock_prepareReloadConfigurationOperationForExtension:(id)a3 path:(id)a4 locationInUse:(BOOL)a5 sessionInfo:(id)a6 powerLogReason:(int64_t)a7 assetUpdater:(id)a8 error:(id *)a9
{
  uint64_t v12 = a5;
  v45[1] = *MEMORY[0x1E4F143B8];
  long long v15 = (__CFString *)a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if ([v18 isValid])
    {
      uint64_t v20 = 0;
      id v21 = 0;
    }
    else
    {
      unsigned int v37 = v12;
      uint64_t v20 = self->_instanceCollection;
      uint64_t v23 = [(PFPosterExtensionProvider *)self->_extensionProvider extensionForIdentifier];
      uint64_t v24 = [v23 objectForKey:v15];

      id v43 = 0;
      id v38 = (void *)v24;
      id v21 = [(PFPosterExtensionInstanceProvider *)v20 acquireInstanceForExtension:v24 reason:@"ReloadConfiguration" error:&v43];
      id v25 = (PFPosterExtensionInstanceProvider *)v43;
      if (v25)
      {
        id v22 = v25;
        if (a9) {
          *a9 = v25;
        }

        id v19 = 0;
        goto LABEL_12;
      }
      int64_t v36 = a7;
      id v42 = 0;
      uint64_t v26 = objc_msgSend(v21, "pr_assetUpdaterWithError:", &v42);
      id v28 = v42;

      id v29 = v28;
      if (v28) {
        BOOL v30 = 1;
      }
      else {
        BOOL v30 = v26 == 0;
      }
      int v31 = !v30;
      if (a9 && (v31 & 1) == 0)
      {
        if (v29)
        {
          *a9 = v29;
        }
        else
        {
          long long v35 = (void *)MEMORY[0x1E4F28C58];
          if (v15) {
            id v32 = v15;
          }
          else {
            id v32 = @"(null)";
          }
          id v44 = @"extensionIdentifier";
          v45[0] = v32;
          long long v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
          objc_msgSend(v35, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v33);
          id v34 = objc_claimAutoreleasedReturnValue();
          *a9 = v34;

          id v29 = 0;
        }
      }

      if (!v31)
      {
        id v19 = 0;
        goto LABEL_14;
      }
      id v18 = (id)v26;
      uint64_t v12 = v37;
      a7 = v36;
    }
    id v19 = [[PBFPosterExtensionReloadConfigurationOperation alloc] initWithUpdatingService:v18 sessionInfo:v17 existingConfigurationPath:v16 locationInUse:v12 runtimeAssertionProvider:self->_runtimeAssertionProvider behaviorAssertionProvider:self->_snapshotManager timeout:90.0 powerLogReason:a7];
    if (!v20)
    {
LABEL_13:
      uint64_t v26 = (uint64_t)v18;
LABEL_14:

      id v18 = (id)v26;
      goto LABEL_16;
    }
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __155__PBFPosterExtensionDataStore__stateLock_prepareReloadConfigurationOperationForExtension_path_locationInUse_sessionInfo_powerLogReason_assetUpdater_error___block_invoke;
    v39[3] = &unk_1E6980FC8;
    uint64_t v20 = v20;
    id v40 = v20;
    id v21 = v21;
    id v41 = v21;
    [(PBFPosterExtensionReloadConfigurationOperation *)v19 addCompletionObserver:v39];

    id v22 = v40;
LABEL_12:

    goto LABEL_13;
  }
  if (a9)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    id v19 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = 0;
  }
LABEL_16:

  return v19;
}

uint64_t __155__PBFPosterExtensionDataStore__stateLock_prepareReloadConfigurationOperationForExtension_path_locationInUse_sessionInfo_powerLogReason_assetUpdater_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) relinquishExtensionInstance:*(void *)(a1 + 40) reason:@"ReloadConfiguration"];
}

- (void)_stateLock_enqueueRefreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 powerLogReason:(int64_t)a5 completion:(id)a6
{
  v116[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  os_signpost_id_t v13 = (void (**)(id, void, void *))a6;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (![(PBFPosterExtensionDataStore *)self _stateLock_hasBeenUnlockedSinceBoot])
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      id v115 = @"posterUUID";
      id v25 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v11);
      v116[0] = v25;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:&v115 count:1];
      id v27 = objc_msgSend(v24, "pbf_dataStoreErrorWithCode:userInfo:", -2205, v26);

      v13[2](v13, 0, v27);
      goto LABEL_42;
    }
    uint64_t v99 = 0;
    long long v100 = &v99;
    uint64_t v101 = 0x3032000000;
    long long v102 = __Block_byref_object_copy_;
    uint64_t v103 = __Block_byref_object_dispose_;
    id v104 = 0;
    id obj = 0;
    id v98 = 0;
    [(PBFPosterExtensionDataStore *)self _stateLock_findStoreCoordinatorsForUUID:v11 extensionStoreCoordinator:&v98 configurationStoreCoordinator:&obj];
    id v15 = v98;
    objc_storeStrong(&v104, obj);
    id v16 = (void *)v100[5];
    if (v16)
    {
      if (v15)
      {
        id v17 = [v16 identityOfLatestVersion];
        if (v17)
        {
          BOOL v71 = [v15 extensionIdentifier];
          id v18 = [(PBFPosterExtensionDataStore *)self activeEditingSessionAssertionExtensionIdentifiers];
          int v19 = [v18 containsObject:v71];

          if (v19)
          {
            uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
            v107[0] = *MEMORY[0x1E4F28588];
            v107[1] = @"posterUUID";
            v108[0] = @"Edit session is ongoing; update configurations is disabled for this extension until edit is finished";
            id v21 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v11);
            v108[1] = v21;
            id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:2];
            objc_msgSend(v20, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v22);
            id v23 = (id)objc_claimAutoreleasedReturnValue();

            v13[2](v13, 0, v23);
            goto LABEL_39;
          }
          id v70 = self->_extensionProvider;
          unsigned int v37 = [v11 UUIDString];
          id v38 = NSStringFromSelector(a2);
          uint64_t v69 = [v37 stringByAppendingFormat:@"-%@", v38];

          id v96 = 0;
          id v39 = [(PFPosterExtensionProvider *)v70 acquireInstanceForExtensionWithIdentifier:v71 reason:v69 error:&v96];
          id v23 = v96;
          if (v23)
          {
            v13[2](v13, 0, v23);
LABEL_38:

LABEL_39:
            goto LABEL_41;
          }
          id v95 = 0;
          uint64_t v66 = objc_msgSend(v39, "pr_assetUpdaterWithError:", &v95);
          id v67 = v95;
          uint64_t v68 = v39;
          if (v67)
          {
            [(PFPosterExtensionProvider *)v70 relinquishExtensionInstanceWithIdentifier:v71 reason:v69];
            v13[2](v13, 0, v67);
LABEL_37:

            id v39 = v68;
            goto LABEL_38;
          }
          id v40 = (void *)MEMORY[0x1E4F924D0];
          id v41 = [v15 containerURL];
          os_unfair_lock_t v65 = [v40 pathWithProviderURL:v41 identity:v17];

          id v23 = 0;
          if (!v12 || [v12 isEmpty])
          {
            id v42 = objc_msgSend(v39, "pr_refreshConfigurationOperations");
            v93[0] = MEMORY[0x1E4F143A8];
            v93[1] = 3221225472;
            v93[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke;
            v93[3] = &unk_1E6980FF0;
            id v94 = v65;
            id v43 = objc_msgSend(v42, "bs_firstObjectPassingTest:", v93);

            if (v43)
            {
              v87[0] = MEMORY[0x1E4F143A8];
              v87[1] = 3221225472;
              v87[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_2;
              v87[3] = &unk_1E6981018;
              uint64_t v91 = v13;
              id v92 = &v99;
              uint64_t v88 = v70;
              id v89 = v71;
              id v90 = v69;
              [v43 addCompletionObserver:v87];

              id v44 = v91;
LABEL_36:

              goto LABEL_37;
            }
          }
          id v64 = [(PBFPosterExtensionDataStore *)self _stateLock_switcherConfiguration];
          long long v45 = [v64 selectedConfiguration];
          id v62 = [v45 _path];
          id v61 = [v62 serverIdentity];
          id v60 = [v61 posterUUID];
          if ([v60 isEqual:v11])
          {
          }
          else
          {
            id v59 = [v64 activeConfiguration];
            id v58 = [v59 _path];
            uint64_t v57 = [v58 serverIdentity];
            BOOL v46 = [v57 posterUUID];
            char v56 = [v46 isEqual:v11];

            if ((v56 & 1) == 0)
            {
              uint64_t v48 = 0;
LABEL_27:
              id v86 = 0;
              id v43 = [(PBFPosterExtensionDataStore *)self _stateLock_prepareReloadConfigurationOperationForExtension:v71 path:v65 locationInUse:v48 sessionInfo:v12 powerLogReason:a5 assetUpdater:v66 error:&v86];
              id v49 = v86;
              id v50 = v49;
              if (v49 || !v43)
              {
                uint64_t v54 = v49;
                if (!v49)
                {
                  uint64_t v55 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v105 = *MEMORY[0x1E4F28588];
                  v106 = @"Unable to create reloadConfigurationOperation";
                  self = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
                  uint64_t v54 = objc_msgSend(v55, "pbf_dataStoreErrorWithCode:userInfo:", -2222, self);
                }
                v13[2](v13, 0, v54);
                if (!v50)
                {
                }
                [(PFPosterExtensionProvider *)v70 relinquishExtensionInstanceWithIdentifier:v71 reason:v69];
              }
              else
              {
                __int16 v51 = (void *)[objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
                aBlock[0] = MEMORY[0x1E4F143A8];
                aBlock[1] = 3221225472;
                aBlock[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_3;
                aBlock[3] = &unk_1E6981040;
                id v50 = v51;
                id v81 = v50;
                id v85 = v13;
                char v82 = v70;
                id v83 = v71;
                id v84 = v69;
                os_signpost_id_t v52 = _Block_copy(aBlock);
                objc_initWeak(&location, self);
                v73[0] = MEMORY[0x1E4F143A8];
                v73[1] = 3221225472;
                v73[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_4;
                v73[3] = &unk_1E69810E0;
                objc_copyWeak(&v78, &location);
                id v53 = v52;
                id v77 = v53;
                id v74 = v17;
                id v75 = v65;
                id v76 = v11;
                [v43 addCompletionObserver:v73];
                objc_msgSend(v68, "pr_addRefreshConfigurationOperation:waitUntilFinished:", v43, 0);

                objc_destroyWeak(&v78);
                objc_destroyWeak(&location);
              }
              id v44 = v64;
              goto LABEL_36;
            }
          }
          id v63 = [v68 extension];
          id v47 = [v63 posterExtensionInfoPlist];
          uint64_t v48 = objc_msgSend(v47, "pf_wantsLocation");

          goto LABEL_27;
        }
        id v34 = (void *)MEMORY[0x1E4F28C58];
        v109 = @"posterUUID";
        long long v35 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v11);
        id v110 = v35;
        int64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
        BOOL v72 = objc_msgSend(v34, "pbf_dataStoreErrorWithCode:userInfo:", -2213, v36);

        v13[2](v13, 0, v72);
      }
      else
      {
        int v31 = (void *)MEMORY[0x1E4F28C58];
        id v111 = @"posterUUID";
        id v32 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v11);
        v112 = v32;
        long long v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
        id v17 = objc_msgSend(v31, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v33);

        v13[2](v13, 0, v17);
      }
    }
    else
    {
      id v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v113 = @"posterUUID";
      id v29 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v11);
      __int16 v114 = v29;
      BOOL v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
      id v17 = objc_msgSend(v28, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v30);

      v13[2](v13, 0, v17);
    }
LABEL_41:

    _Block_object_dispose(&v99, 8);
    goto LABEL_42;
  }
  if (v13)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v13[2](v13, 0, v14);
  }
LABEL_42:
}

uint64_t __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 preRefreshPosterConfiguration];
  id v5 = [v4 identity];
  id v6 = [*(id *)(a1 + 32) identity];
  if ([v5 isEqual:v6]) {
    uint64_t v7 = [v3 hasUniqueSessionInfo] ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    id v4 = [*(id *)(*(void *)(a1[8] + 8) + 40) pathOfLatestVersion];
    (*(void (**)(void))(a1[7] + 16))();
  }
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  return [v5 relinquishExtensionInstanceWithIdentifier:v6 reason:v7];
}

void __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1D9433EF0]();
  if ([*(id *)(a1 + 32) setFlag:1])
  {
    uint64_t v7 = *(void *)(a1 + 64);
    if (v7) {
      (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
    }
  }
  [*(id *)(a1 + 40) relinquishExtensionInstanceWithIdentifier:*(void *)(a1 + 48) reason:*(void *)(a1 + 56)];
}

void __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  id v8 = WeakRetained;
  if (v6)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else if (v5 && WeakRetained)
  {
    uint64_t v9 = [v5 postRefreshPosterConfiguration];
    id v10 = [v9 serverIdentity];
    id v11 = v10;
    if (v10 && a1[4])
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      void v30[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_5;
      v30[3] = &unk_1E6981068;
      id v31 = v10;
      id v32 = a1[4];
      id v35 = a1[7];
      id v33 = a1[5];
      id v34 = a1[6];
      [v5 invalidateAssertionsWithCompletion:v30];

      id v12 = v31;
    }
    else
    {
      id v12 = objc_msgSend(v5, "preRefreshPosterConfiguration", v10);
      if ([v12 isServerPosterPath])
      {
        id v15 = (void *)v8[7];
        id v16 = [v12 serverIdentity];
        [v15 cancelRequestedSnapshotsForIdentity:v16];
      }
      id v17 = [MEMORY[0x1E4F926B0] loadConfiguredPropertiesForPath:v12 error:0];
      id v18 = [MEMORY[0x1E4F926B0] loadConfiguredPropertiesForPath:v9 error:0];
      int v19 = (void *)[v18 mutableCopy];
      uint64_t v20 = v19;
      if (v19) {
        id v21 = v19;
      }
      else {
        id v21 = (id)objc_opt_new();
      }
      id v22 = v21;

      [v22 mergeConfiguredProperties:v17];
      id v23 = objc_alloc(MEMORY[0x1E4F925C0]);
      uint64_t v24 = [a1[4] posterUUID];
      id v25 = (void *)[v23 initWithUpdatedPath:v9 updatedPosterUUID:v24 sourceIdentity:a1[4] configuredProperties:v22 attributes:0];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_507;
      v27[3] = &unk_1E69810B8;
      id v28 = v5;
      id v29 = a1[7];
      [v8 _ingestRefreshPosterConfiguration:v25 completion:v27];

      id v11 = v26;
    }
  }
  else
  {
    os_signpost_id_t v13 = (void (**)(id, void, void *))a1[7];
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v13[2](v13, 0, v14);
  }
}

void __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_5(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    id v16 = @"posterUUID";
    id v4 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", *(void *)(a1 + 56));
    v17[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v6 = objc_msgSend(v3, "pbf_dataStoreErrorWithCode:userInfo:", -2213, v5);

    uint64_t v7 = PBFLogPosterContents();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_ERROR, "updated configuration isn't new but fails to match the previous descriptor : new=%@ previous=%@ error:%{public}@", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_507(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_2_508;
    v8[3] = &unk_1E6981090;
    id v11 = *(id *)(a1 + 40);
    id v9 = v5;
    id v10 = v6;
    [v7 invalidateAssertionsWithCompletion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __126__PBFPosterExtensionDataStore__stateLock_enqueueRefreshPosterConfigurationMatchingUUID_sessionInfo_powerLogReason_completion___block_invoke_2_508(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_ingestRefreshPosterConfiguration:(id)a3 completion:(id)a4
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, void *))a4;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    p_stateLock = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    __int16 v12 = [v7 sourceIdentity];
    uint64_t v13 = [v12 provider];
    __int16 v14 = (void *)v13;
    id v15 = @"(null extensionBundleIdentifier)";
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    id v10 = v15;

    id v16 = [(PBFPosterExtensionDataStore *)self activeEditingSessionAssertionExtensionIdentifiers];
    int v17 = [v16 containsObject:v10];

    if (v17)
    {
      os_unfair_lock_unlock(&self->_stateLock);
      id v18 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore _ingestRefreshPosterConfiguration:completion:]();
      }

      if (!v8) {
        goto LABEL_38;
      }
      int v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28588];
      v64[0] = @"extensionBundleIdentifier";
      v64[1] = v20;
      v65[0] = v10;
      v65[1] = @"Editing session is in progress;  cannot ingest this path.  Aborting.";
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
      objc_msgSend(v19, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v21);
      id v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v22);
      goto LABEL_37;
    }
    id v21 = [v7 sourceIdentity];
    id v22 = [v7 role];
    id v23 = [v7 destinationUUID];
    uint64_t v24 = @"(null role)";
    if (v22) {
      uint64_t v24 = v22;
    }
    id v25 = v24;
    uint64_t v26 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v22];
    id v53 = v26;
    if (v26)
    {
      os_signpost_id_t v52 = v25;
      __int16 v51 = [v26 posterCollection];
      id v27 = [v51 posterWithUUID:v23];

      if (v27)
      {
        id v50 = v21;
        id v49 = +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:v22 incomingPoster:v7];
        id v59 = v49;
        id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        id v29 = NSStringFromSelector(a2);
        id v56 = 0;
        BOOL v30 = [(PBFPosterExtensionDataStore *)self _stateLock_executeDataStoreUpdateWithChanges:v28 diffs:0 options:0 reason:v29 context:0 error:&v56];
        id v31 = v56;

        if (v30)
        {
          id v32 = [v53 posterCollection];
          id v33 = [v32 orderedPosters];
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __76__PBFPosterExtensionDataStore__ingestRefreshPosterConfiguration_completion___block_invoke;
          v54[3] = &unk_1E6981108;
          id v55 = v50;
          id v34 = objc_msgSend(v33, "bs_firstObjectPassingTest:", v54);

          os_unfair_lock_unlock(p_stateLock);
          id v35 = [v34 _path];
          ((void (**)(id, void *, void *))v8)[2](v8, v35, v31);

          id v21 = v50;
          int64_t v36 = v51;
          id v25 = v52;
        }
        else
        {
          os_unfair_lock_unlock(p_stateLock);
          id v44 = PBFLogRoleCoordinator();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            -[PBFPosterExtensionDataStore _ingestRefreshPosterConfiguration:completion:].cold.4();
          }

          id v21 = v50;
          int64_t v36 = v51;
          id v25 = v52;
          if (v8)
          {
            if (!v31)
            {
              long long v45 = (void *)MEMORY[0x1E4F28C58];
              v57[0] = *MEMORY[0x1E4F28588];
              v57[1] = @"role";
              v58[0] = @"Role Coordinator could not execute refresh poster configuration";
              v58[1] = v52;
              void v57[2] = @"posterUUID";
              BOOL v46 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v23);
              void v58[2] = v46;
              id v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:3];
              uint64_t v48 = v45;
              id v21 = v50;
              objc_msgSend(v48, "pbf_dataStoreErrorWithCode:userInfo:", -2222, v47);
              id v31 = (id)objc_claimAutoreleasedReturnValue();

              id v25 = v52;
            }
            v8[2](v8, 0, v31);
          }
        }
      }
      else
      {
        os_unfair_lock_unlock(&self->_stateLock);
        id v40 = PBFLogRoleCoordinator();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[PBFPosterExtensionDataStore _ingestRefreshPosterConfiguration:completion:].cold.4();
        }

        id v25 = v52;
        if (!v8)
        {
          int64_t v36 = v51;
          goto LABEL_35;
        }
        id v41 = (void *)MEMORY[0x1E4F28C58];
        v60[0] = *MEMORY[0x1E4F28588];
        v60[1] = @"role";
        v61[0] = @"Poster w/ UUID could not be found";
        v61[1] = v52;
        void v60[2] = @"posterUUID";
        id v42 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v23);
        void v61[2] = v42;
        id v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
        objc_msgSend(v41, "pbf_dataStoreErrorWithCode:userInfo:", -2213, v43);
        id v31 = (id)objc_claimAutoreleasedReturnValue();

        id v25 = v52;
        v8[2](v8, 0, v31);
        int64_t v36 = v51;
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_stateLock);
      unsigned int v37 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore _ingestRefreshPosterConfiguration:completion:]();
      }

      if (!v8) {
        goto LABEL_36;
      }
      id v38 = (void *)MEMORY[0x1E4F28C58];
      v62[0] = *MEMORY[0x1E4F28588];
      v62[1] = @"role";
      v63[0] = @"RoleCoordinator not setup for role";
      v63[1] = v25;
      id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
      int64_t v36 = objc_msgSend(v38, "pbf_generalErrorWithCode:userInfo:", 1, v39);

      v8[2](v8, 0, v36);
    }
LABEL_35:

LABEL_36:
LABEL_37:

    goto LABEL_38;
  }
  id v9 = PBFLogRoleCoordinator();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[PBFPosterExtensionDataStore _ingestRefreshPosterConfiguration:completion:](a2, v9);
  }

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v10);
LABEL_38:
  }
}

BOOL __76__PBFPosterExtensionDataStore__ingestRefreshPosterConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _path];
  id v4 = [v3 serverIdentity];

  id v5 = [v4 posterUUID];
  id v6 = [*(id *)(a1 + 32) posterUUID];
  if ([v5 isEqual:v6])
  {
    unint64_t v7 = [v4 version];
    BOOL v8 = v7 > [*(id *)(a1 + 32) version];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_stateLock_fetchPosterConfigurations
{
  return [(PBFPosterExtensionDataStore *)self _stateLock_fetchPosterConfigurationsSortedByUse:0 forRole:*MEMORY[0x1E4F92790]];
}

- (id)_stateLock_fetchPosterConfigurationsSortedByUse:(BOOL)a3 forRole:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    BOOL v8 = [(PBFPosterExtensionDataStoreSQLiteDatabase *)self->_database sortedPosterUUIDsForRole:v6 error:0];
    id v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_opt_new();
    }
    id v11 = v10;

    __int16 v12 = objc_opt_new();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke;
    void v22[3] = &unk_1E6981130;
    id v13 = v11;
    id v23 = v13;
    id v14 = v12;
    id v24 = v14;
    [(PBFPosterExtensionDataStore *)self _stateLock_enumerateConfigurationStoreCoordinators:v22];
    if (v4)
    {
      id v15 = [(PBFPosterExtensionDataStore *)self _stateLock_lastUseDatesForPosterCollection];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke_2;
      v20[3] = &unk_1E6981158;
      id v21 = v15;
      id v16 = v15;
      [v14 sortUsingComparator:v20];
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke_3;
      v18[3] = &unk_1E6981158;
      id v19 = v13;
      [v14 sortUsingComparator:v18];
      id v16 = v19;
    }

    unint64_t v7 = (void *)[v14 copy];
  }

  return v7;
}

void __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = [a3 identityOfLatestVersion];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F924D0];
    unint64_t v7 = [v11 containerURL];
    BOOL v8 = [v6 pathWithProviderURL:v7 identity:v5];

    id v9 = *(void **)(a1 + 32);
    id v10 = [v5 posterUUID];
    LODWORD(v9) = [v9 containsObject:v10];

    if (v9) {
      [*(id *)(a1 + 40) addObject:v8];
    }
  }
}

uint64_t __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [a2 serverIdentity];
  BOOL v8 = [v7 posterUUID];
  id v9 = [v5 objectForKey:v8];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  __int16 v12 = v11;

  id v13 = *(void **)(a1 + 32);
  id v14 = [v6 serverIdentity];

  id v15 = [v14 posterUUID];
  id v16 = [v13 objectForKey:v15];
  int v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v19 = v18;

  uint64_t v20 = [v12 compare:v19];
  return v20;
}

uint64_t __87__PBFPosterExtensionDataStore__stateLock_fetchPosterConfigurationsSortedByUse_forRole___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  BOOL v8 = [a2 serverIdentity];
  id v9 = [v8 posterUUID];
  id v10 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v9));

  id v11 = NSNumber;
  __int16 v12 = *(void **)(a1 + 32);
  id v13 = [v7 serverIdentity];

  id v14 = [v13 posterUUID];
  id v15 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "indexOfObject:", v14));

  uint64_t v16 = [v10 compare:v15];
  return v16;
}

- (id)_stateLock_lastUseDatesForPosterCollection
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v3 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__PBFPosterExtensionDataStore__stateLock_lastUseDatesForPosterCollection__block_invoke;
    v6[3] = &unk_1E6981180;
    id v3 = v4;
    id v7 = v3;
    [(PBFPosterExtensionDataStore *)self _stateLock_enumerateConfigurationStoreCoordinators:v6];
  }
  return v3;
}

void __73__PBFPosterExtensionDataStore__stateLock_lastUseDatesForPosterCollection__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  BOOL v4 = [v8 providerInfo];
  id v5 = [v4 objectForKey:@"kConfigurationLastUseDateKey"];

  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = [v8 posterUUID];
  [v6 setObject:v5 forKey:v7];
}

- (void)_stateLock_findStoreCoordinatorsForUUID:(id)a3 extensionStoreCoordinator:(id *)a4 configurationStoreCoordinator:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a4 | (unint64_t)a5
    && ([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy_;
    id v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy_;
    int v17 = __Block_byref_object_dispose_;
    id v18 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __127__PBFPosterExtensionDataStore__stateLock_findStoreCoordinatorsForUUID_extensionStoreCoordinator_configurationStoreCoordinator___block_invoke;
    v9[3] = &unk_1E69811A8;
    id v10 = v8;
    id v11 = &v19;
    __int16 v12 = &v13;
    [(PBFPosterExtensionDataStore *)self _stateLock_enumerateConfigurationStoreCoordinators:v9];
    if (a4) {
      *a4 = (id) v20[5];
    }
    if (a5) {
      *a5 = (id) v14[5];
    }

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
}

void __127__PBFPosterExtensionDataStore__stateLock_findStoreCoordinatorsForUUID_extensionStoreCoordinator_configurationStoreCoordinator___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = a3;
  id v9 = [v8 posterUUID];
  int v10 = [v9 isEqual:a1[4]];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    *a4 = 1;
  }
}

- (void)_stateLock_enumerateConfigurationStoreCoordinators:(id)a3
{
  id v4 = a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __82__PBFPosterExtensionDataStore__stateLock_enumerateConfigurationStoreCoordinators___block_invoke;
    v6[3] = &unk_1E6980DD0;
    id v7 = v4;
    [(NSMutableDictionary *)stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void __82__PBFPosterExtensionDataStore__stateLock_enumerateConfigurationStoreCoordinators___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [v8 configurationStoreCoordinatorsWithError:0];
  v16[0] = 0;
  v16[1] = v16;
  void v16[2] = 0x2020000000;
  char v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__PBFPosterExtensionDataStore__stateLock_enumerateConfigurationStoreCoordinators___block_invoke_2;
  v11[3] = &unk_1E69811D0;
  id v13 = *(id *)(a1 + 32);
  id v10 = v8;
  id v12 = v10;
  id v14 = v16;
  uint64_t v15 = a4;
  [v9 enumerateObjectsUsingBlock:v11];

  _Block_object_dispose(v16, 8);
}

uint64_t __82__PBFPosterExtensionDataStore__stateLock_enumerateConfigurationStoreCoordinators___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *a3 = 1;
    **(unsigned char **)(a1 + 56) = 1;
  }
  return result;
}

- (PRSwitcherConfiguration)switcherConfiguration
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v4 = [(PBFPosterExtensionDataStore *)self _stateLock_switcherConfiguration];
  os_unfair_lock_unlock(p_stateLock);
  return (PRSwitcherConfiguration *)v4;
}

- (BOOL)canPersistNewPosterConfiguration
{
  uint64_t v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = [(PBFPosterExtensionDataStore *)v2 _stateLock_canPersistNewPosterConfiguration];
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)_stateLock_canPersistNewPosterConfiguration
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag]) {
    return 0;
  }
  id v4 = [(PBFPosterExtensionDataStore *)self _stateLock_switcherConfiguration];
  id v5 = [v4 configurations];
  unint64_t v6 = [v5 count];

  uint64_t v7 = [(PBFPosterExtensionDataStore *)self _stateLock_maximumPosterConfigurationCount];
  BOOL v3 = v7 >= 0 && v6 < v7;

  return v3;
}

- (BOOL)updateDataStoreForIncomingFocusModeChange:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F74230] sharedConnection];
  char v8 = [v7 isWallpaperModificationAllowed];

  id v9 = PBFLogDataStore();
  id v10 = v9;
  if (v8)
  {
    os_signpost_id_t v11 = os_signpost_id_generate(v9);

    id v12 = PBFLogDataStore();
    id v13 = v12;
    unint64_t v32 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v6;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "updateDataStoreForIncomingFocusModeChange:", "newFocusModeIdentifier: %{public}@", buf, 0xCu);
    }

    id v14 = PBFLogDataStore();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v6;
      _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "Incoming focus mode change: %@", buf, 0xCu);
    }
    os_signpost_id_t spid = v11;
    id v31 = a4;

    os_unfair_lock_lock(&self->_stateLock);
    id v10 = [(PBFPosterExtensionDataStore *)self _activityModeForFocusUUID:v6];
    uint64_t v15 = PBFLogDataStore();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(PBFPosterExtensionDataStore *)self _activeActivity];
      *(_DWORD *)buf = 138412546;
      id v34 = v16;
      __int16 v35 = 2112;
      int64_t v36 = v10;
      _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "Beginning transition from activity mode: %@ to activity mode: %@", buf, 0x16u);
    }
    char v17 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContextForActivity:v10];
    [v17 setTransitionFromIncomingFocusModeChange:1];
    uint64_t v18 = *MEMORY[0x1E4F92790];
    uint64_t v19 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:*MEMORY[0x1E4F92790]];
    uint64_t v20 = [v19 determineActivePosterConfigurationForContext:v17];
    uint64_t v21 = [(PBFPosterExtensionDataStore *)self activePosterConfigurationForRole:v18 assocPoster:0];
    if (v20 && (BSEqualObjects() & 1) == 0)
    {
      id v24 = PBFLogDataStore();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v34 = v10;
        __int16 v35 = 2112;
        int64_t v36 = v20;
        __int16 v37 = 2112;
        id v38 = v21;
        _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "Executing incoming focus mode transition to %{public}@, new active poster configuration: %@ does not match current active poster configuration: %@", buf, 0x20u);
      }

      id v25 = [v20 pbf_posterUUID];
      [v17 setDesiredActiveConfiguration:v25 forRole:v18];

      id v22 = [NSString stringWithFormat:@"updateDataStoreForIncomingFocusModeChange:%@", v6, spid];
      BOOL v23 = [(PBFPosterExtensionDataStore *)self _stateLock_executeDataStoreUpdateWithChanges:0 diffs:0 options:0 reason:v22 context:v17 error:v31];
    }
    else
    {
      id v22 = PBFLogDataStore();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v34 = v10;
        __int16 v35 = 2112;
        int64_t v36 = v21;
        _os_log_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_DEFAULT, "Incoming focus mode transition to activity mode %@; already setup for configuration %@",
          buf,
          0x16u);
      }
      BOOL v23 = 1;
    }

    os_unfair_lock_unlock(&self->_stateLock);
    uint64_t v26 = PBFLogDataStore();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v23;
      _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "Finished transitioning to new Incoming focus mode change: %{BOOL}u", buf, 8u);
    }

    id v27 = PBFLogDataStore();
    id v28 = v27;
    if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v6;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v28, OS_SIGNPOST_INTERVAL_END, spid, "updateDataStoreForIncomingFocusModeChange:", "newFocusModeIdentifier: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring incoming focus mode change because MDM blocks wallpaper changes", buf, 2u);
    }
    LOBYTE(v23) = 0;
  }

  return v23;
}

- (BOOL)updateDataStoreForIncomingAvailableFocusModeChange:(id)a3 error:(id *)a4
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v38 = (__CFString *)(id)*MEMORY[0x1E4F92790];
  char v8 = -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:");
  id v9 = v8;
  if (v8)
  {
    id v34 = a4;
    id v10 = [v8 posterCollection];
    __int16 v35 = v9;
    id v36 = v7;
    aSelector = a2;
    id v33 = self;
    if ([v7 count]) {
      [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    }
    else {
    id v40 = [MEMORY[0x1E4F1CAD0] set];
    }
    __int16 v37 = objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [v10 orderedPosters];
    uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(NSObject **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v20 = [v10 configuredPropertiesForPoster:v19];
          uint64_t v21 = [v20 focusConfiguration];
          id v22 = [v21 activityUUID];
          if (v22)
          {
            int v23 = [v40 containsObject:v22];
            id v24 = PBFLogDataStore();
            BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
            if (v23)
            {
              if (v25)
              {
                *(_DWORD *)buf = 138412546;
                BOOL v46 = v21;
                __int16 v47 = 2112;
                uint64_t v48 = v19;
                _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "Focus mode %@ available for %@", buf, 0x16u);
              }
            }
            else
            {
              if (v25)
              {
                *(_DWORD *)buf = 138412546;
                BOOL v46 = v21;
                __int16 v47 = 2112;
                uint64_t v48 = v19;
                _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "Focus mode %@ unavailable for %@; updating poster",
                  buf,
                  0x16u);
              }

              uint64_t v26 = [v20 mutableCopy];
              id v24 = v26;
              if (v26)
              {
                [v26 setFocusConfiguration:0];
                id v27 = [v19 pbf_posterUUID];
                id v28 = +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:v24 forPosterWithinRole:v38 matchingUUID:v27];

                id v29 = PBFLogDataStore();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  BOOL v46 = v28;
                  _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_INFO, "Queueing up change: %{public}@", buf, 0xCu);
                }

                objc_msgSend(v37, "bs_safeAddObject:", v28);
              }
              else
              {
                id v28 = PBFLogDataStore();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  BOOL v46 = v19;
                  __int16 v47 = 2114;
                  uint64_t v48 = v22;
                  _os_log_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_DEFAULT, "Configured properties is invalid; bailing on incoming available focus mode change for poster %{publi"
                    "c}@ / %{public}@",
                    buf,
                    0x16u);
                }
              }
            }
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v16);
    }

    if ([v37 count])
    {
      os_unfair_lock_lock(&v33->_stateLock);
      BOOL v30 = NSStringFromSelector(aSelector);
      char v14 = [(PBFPosterExtensionDataStore *)v33 _stateLock_executeDataStoreUpdateWithChanges:v37 diffs:0 options:0 reason:v30 context:0 error:v34];

      os_unfair_lock_unlock(&v33->_stateLock);
    }
    else
    {
      char v14 = 1;
    }
    id v9 = v35;

    id v7 = v36;
  }
  else
  {
    if (a4)
    {
      os_signpost_id_t v11 = (void *)MEMORY[0x1E4F28C58];
      v50[0] = *MEMORY[0x1E4F28588];
      v50[1] = @"role";
      id v12 = @"(null role)";
      if (v38) {
        id v12 = v38;
      }
      v51[0] = @"RoleCoordinator not setup for role";
      v51[1] = v12;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
      objc_msgSend(v11, "pbf_generalErrorWithCode:userInfo:", 1, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore updateDataStoreForIncomingAvailableFocusModeChange:error:]();
    }
    char v14 = 0;
  }

  return v14;
}

- (BOOL)updateDataStoreForIncomingActiveChargerIdentifierUpdate:(id)a3 error:(id *)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = PBFLogDataStore();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = PBFLogDataStore();
  id v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138543362;
    id v54 = v6;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "updateDataStoreForIncomingActiveChargerIdentifierUpdate:", "activeChargerIdentifierUpdate: %{public}@", buf, 0xCu);
  }

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v13 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_activeChargerIdentifier");
  if (!BSEqualStrings())
  {
    uint64_t v15 = +[PBFPosterDataStoreEventBuilder activeChargerIdentifierDidUpdate:v6 from:v13];
    id v51 = 0;
    uint64_t v17 = [v15 buildWithError:&v51];
    id v50 = v51;
    if (!v17)
    {
      os_unfair_lock_unlock(&self->_stateLock);
      BOOL v30 = PBFLogDataStore();
      id v31 = v30;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_DWORD *)buf = 138543362;
        id v54 = v6;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v31, OS_SIGNPOST_INTERVAL_END, v8, "updateDataStoreForIncomingActiveChargerIdentifierUpdate:", "activeChargerIdentifierUpdate: %{public}@", buf, 0xCu);
      }

      id v32 = v50;
      if (a4)
      {
        if (!v50)
        {
          id v33 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v57 = *MEMORY[0x1E4F28588];
          v58[0] = @"Unable to build PBFPosterDataStoreEvent";
          id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
          objc_msgSend(v33, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v34);
          id v32 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v32 = v32;
        LOBYTE(v16) = 0;
        *a4 = v32;
      }
      else
      {
        LOBYTE(v16) = 0;
      }
      goto LABEL_36;
    }
    os_signpost_id_t spid = v8;
    long long v43 = v13;
    long long v44 = v15;
    BOOL v46 = a4;
    id v18 = (id)*MEMORY[0x1E4F92740];
    uint64_t v19 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContextForChargerIdentifier:v6];
    uint64_t v20 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v18];
    uint64_t v21 = [(PBFPosterExtensionDataStore *)self activePosterConfigurationForRole:v18 assocPoster:0];
    id v22 = objc_msgSend(v21, "pbf_posterUUID");
    [v19 setDesiredActiveConfiguration:v22 forRole:v18];

    long long v45 = (void *)v20;
    int v23 = (void *)v20;
    id v24 = v19;
    [v23 determineActivePosterConfigurationForContext:v19];
    __int16 v47 = v21;
    v49 = uint64_t v48 = v17;
    if (!v49)
    {
      __int16 v35 = PBFLogDataStore();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v54 = v6;
        _os_log_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEFAULT, "Incoming charger id update to %{public}@ did not find a matching configuration", buf, 0xCu);
      }
      id v28 = v18;
      uint64_t v15 = v44;
      id v13 = v43;
      goto LABEL_28;
    }
    int v25 = BSEqualObjects();
    uint64_t v26 = PBFLogDataStore();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      id v28 = v18;
      uint64_t v15 = v44;
      id v13 = v43;
      if (v27)
      {
        *(_DWORD *)buf = 138543618;
        id v54 = v6;
        __int16 v55 = 2114;
        id v56 = v47;
        id v29 = "Incoming charger id update to %{public}@ sticking with current active poster configuration: %{public}@";
LABEL_26:
        _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
      }
    }
    else
    {
      id v28 = v18;
      uint64_t v15 = v44;
      id v13 = v43;
      if (v27)
      {
        *(_DWORD *)buf = 138543618;
        id v54 = v6;
        __int16 v55 = 2114;
        id v56 = v49;
        id v29 = "Executing charger id update to %{public}@ to new active poster configuration: %{public}@";
        goto LABEL_26;
      }
    }

    __int16 v35 = objc_msgSend(v49, "pbf_posterUUID", spid);
    [v24 setDesiredActiveConfiguration:v35 forRole:v28];
    uint64_t v17 = v48;
LABEL_28:

    id v36 = PBFLogDataStore();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v54 = v6;
      _os_log_impl(&dword_1D31CE000, v36, OS_LOG_TYPE_DEFAULT, "Transitioning to new active charger identifier: %{public}@", buf, 0xCu);
    }

    os_signpost_id_t v52 = v17;
    __int16 v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    id v38 = [MEMORY[0x1E4F1CAD0] setWithObject:v28];
    BOOL v16 = [(PBFPosterExtensionDataStore *)self _stateLock_processEvents:v37 roles:v38 context:v24 error:v46];

    if (v16) {
      objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_setActiveChargerIdentifier:", v6);
    }
    os_unfair_lock_unlock(p_stateLock);
    uint64_t v39 = PBFLogDataStore();
    id v40 = v39;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_DWORD *)buf = 138543362;
      id v54 = v6;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v40, OS_SIGNPOST_INTERVAL_END, spid, "updateDataStoreForIncomingActiveChargerIdentifierUpdate:", "activeChargerIdentifierUpdate: %{public}@", buf, 0xCu);
    }

    uint64_t v17 = v48;
    id v32 = v50;
LABEL_36:

    goto LABEL_37;
  }
  os_unfair_lock_unlock(&self->_stateLock);
  char v14 = PBFLogDataStore();
  uint64_t v15 = v14;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138543362;
    id v54 = v6;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v15, OS_SIGNPOST_INTERVAL_END, v8, "updateDataStoreForIncomingActiveChargerIdentifierUpdate:", "activeChargerIdentifierUpdate: %{public}@", buf, 0xCu);
  }
  LOBYTE(v16) = 0;
LABEL_37:

  return v16;
}

- (void)processIncomingPosterConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Princomingpost.isa);
  if (!v8)
  {
    unint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore processIncomingPosterConfiguration:completion:]();
    }
LABEL_9:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D31E93F8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRIncomingPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore processIncomingPosterConfiguration:completion:]();
    }
    goto LABEL_9;
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PBFPosterExtensionDataStore_processIncomingPosterConfiguration_completion___block_invoke;
  v12[3] = &unk_1E69811F8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v9 = v7;
  id v10 = v8;
  PBFDispatchAsyncWithString(@"processIncomingPosterConfiguration", QOS_CLASS_USER_INTERACTIVE, v12);
}

void __77__PBFPosterExtensionDataStore_processIncomingPosterConfiguration_completion___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 188));
  objc_msgSend(*(id *)(a1 + 32), "_stateLock_processIncomingPosterConfiguration:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 188);
  os_unfair_lock_unlock(v2);
}

- (void)_stateLock_processIncomingPosterConfiguration:(id)a3 completion:(id)a4
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v10 = [v7 path];
    id v9 = [v10 role];

    switch([v7 incomingPosterType])
    {
      case 0:
        if (v8)
        {
          uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v51 = *MEMORY[0x1E4F28588];
          os_signpost_id_t v52 = @"PRIncomingPosterConfiguration has the wrong incomingPosterType";
          BOOL v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          id v28 = objc_msgSend(v26, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v27);

          notificationQueue = self->_notificationQueue;
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_2;
          v42[3] = &unk_1E6981220;
          id v43 = v28;
          id v44 = v8;
          id v12 = v28;
          dispatch_async(notificationQueue, v42);

          id v16 = v44;
          goto LABEL_16;
        }
        goto LABEL_17;
      case 1:
      case 4:
        uint64_t v11 = +[PBFPosterRoleCoordinatorChange addPosterToRole:v9 incomingPoster:v7];
        goto LABEL_7;
      case 2:
      case 5:
        uint64_t v11 = +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:v9 incomingPoster:v7];
LABEL_7:
        id v12 = (id)v11;
        goto LABEL_8;
      case 3:
        if (!v8) {
          goto LABEL_17;
        }
        BOOL v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v53 = *MEMORY[0x1E4F28588];
        v54[0] = @"Please use duplicatePosterConfigurationMatchingUUID:";
        id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
        id v32 = objc_msgSend(v30, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v31);

        id v33 = self->_notificationQueue;
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        void v45[2] = __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke;
        v45[3] = &unk_1E6981220;
        id v46 = v32;
        id v47 = v8;
        id v12 = v32;
        dispatch_async(v33, v45);

        id v16 = v47;
        goto LABEL_16;
      default:
        id v12 = 0;
LABEL_8:
        id v50 = v12;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
        id v14 = NSStringFromSelector(a2);
        id v41 = 0;
        BOOL v15 = [(PBFPosterExtensionDataStore *)self _stateLock_executeDataStoreUpdateWithChanges:v13 diffs:0 options:0 reason:v14 context:0 error:&v41];
        id v16 = v41;

        if (v15)
        {
          if (!v8) {
            goto LABEL_16;
          }
          uint64_t v17 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v9];
          id v18 = [v17 posterCollection];
          uint64_t v19 = [v7 destinationUUID];
          uint64_t v20 = [v18 posterWithUUID:v19];

          uint64_t v21 = self->_notificationQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_4;
          block[3] = &unk_1E6981090;
          id v37 = v8;
          id v35 = v20;
          id v16 = v16;
          id v36 = v16;
          id v22 = v20;
          dispatch_async(v21, block);
        }
        else
        {
          if (!v8) {
            goto LABEL_16;
          }
          if (!v16)
          {
            int v23 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v48 = *MEMORY[0x1E4F28588];
            id v49 = @"Unable to process incoming configuration";
            id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
            objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2222, v24);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          int v25 = self->_notificationQueue;
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_3;
          v38[3] = &unk_1E6981220;
          id v40 = v8;
          id v16 = v16;
          id v39 = v16;
          dispatch_async(v25, v38);

          id v22 = v40;
        }

LABEL_16:
        break;
    }
    goto LABEL_17;
  }
  if (v8)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v9);
LABEL_17:
  }
}

uint64_t __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __88__PBFPosterExtensionDataStore__stateLock_processIncomingPosterConfiguration_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)updateFocusModeForActivePosterChange
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  [(PBFPosterExtensionDataStore *)self _stateLock_updateFocusModeForActivePosterChange];
  os_unfair_lock_unlock(p_stateLock);
}

- (void)_stateLock_updateFocusModeForActivePosterChange
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag]) {
    return;
  }
  BOOL v3 = PBFLogDataStore();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = PBFLogDataStore();
  id v6 = v5;
  unint64_t v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "_stateLock_updateFocusModeForActivePosterChange", "", buf, 2u);
  }

  uint64_t v8 = *MEMORY[0x1E4F92790];
  id v9 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:*MEMORY[0x1E4F92790]];
  id v10 = [v9 posterCollection];
  uint64_t v11 = [(PBFPosterExtensionDataStore *)self activePosterConfigurationForRole:v8 assocPoster:0];
  id v12 = [(PBFPosterExtensionDataStore *)self _activeActivity];
  id v38 = v10;
  id v13 = [v10 configuredPropertiesForPoster:v11];
  id v14 = [v13 focusConfiguration];

  BOOL v15 = PBFLogPosterContents();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    long long v45 = v11;
    __int16 v46 = 2112;
    id v47 = v14;
    __int16 v48 = 2112;
    id v49 = v12;
    _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "[Transitioning to newly active poster] %@ with focusConfiguration: %@ from current active activity: %@", buf, 0x20u);
  }

  if (v14)
  {
    id v16 = [v14 activityUUID];
    uint64_t v17 = [(PBFPosterExtensionDataStore *)self _activityModeForFocusUUID:v16];
    if (v17 && (BSEqualObjects() & 1) == 0)
    {
      [(PBFPosterExtensionDataStore *)self _updateActiveActivity:v17 active:1 reason:@"PosterBoard is transitioning to a newly active poster which so happens to have this activity."];
      id v18 = PBFLogPosterContents();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v45 = v17;
        uint64_t v19 = "[Transitioning to newly active poster] and turning on linked focus activity: %@";
        goto LABEL_26;
      }
    }
    else
    {
      id v18 = PBFLogPosterContents();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v45 = v17;
        uint64_t v19 = "[Transitioning to newly active poster] and linked focus activity: %@ has already been turned on";
LABEL_26:
        _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
      }
    }

LABEL_28:
    goto LABEL_29;
  }
  if (v12)
  {
    unint64_t v34 = v4 - 1;
    id v35 = v11;
    id v36 = v9;
    os_signpost_id_t v37 = v4;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v20 = [v38 orderedPosters];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          int v25 = [v38 configuredPropertiesForPoster:*(void *)(*((void *)&v39 + 1) + 8 * i)];
          uint64_t v26 = [v25 focusConfiguration];

          BOOL v27 = [v26 activityUUID];
          id v28 = [v12 activityUniqueIdentifier];
          int v29 = [v27 isEqual:v28];

          if (v29)
          {
            [(PBFPosterExtensionDataStore *)self _updateActiveActivity:0 active:0 reason:@"PosterBoard is transitioning to a newly active poster with no associated focus."];
            id v31 = PBFLogPosterContents();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v45 = v12;
              _os_log_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_DEFAULT, "[Transitioning to newly active poster] without linked focus activity. Turning off focus activity: %@ because it is linked to another poster.", buf, 0xCu);
            }

            id v32 = PBFLogDataStore();
            id v33 = v32;
            id v14 = 0;
            uint64_t v11 = v35;
            id v9 = v36;
            if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1D31CE000, v33, OS_SIGNPOST_INTERVAL_END, v37, "_stateLock_updateFocusModeForActivePosterChange", "", buf, 2u);
            }

            goto LABEL_38;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    id v16 = PBFLogPosterContents();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v45 = v12;
      _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_DEFAULT, "[Transitioning to newly active poster] without linked focus activity. Leaving focus activity: %@ on because it is not linked to another poster.", buf, 0xCu);
    }
    id v9 = v36;
    os_signpost_id_t v4 = v37;
    id v14 = 0;
    uint64_t v11 = v35;
    unint64_t v7 = v34;
    goto LABEL_28;
  }
LABEL_29:
  BOOL v30 = PBFLogDataStore();
  uint64_t v20 = v30;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v20, OS_SIGNPOST_INTERVAL_END, v4, "_stateLock_updateFocusModeForActivePosterChange", "", buf, 2u);
  }
LABEL_38:
}

- (void)processEvents:(id)a3 context:(id)a4 QOS:(unsigned int)a5 reason:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__PBFPosterExtensionDataStore_processEvents_context_QOS_reason_completion___block_invoke;
  v18[3] = &unk_1E6981248;
  void v18[4] = self;
  id v19 = v12;
  id v20 = v13;
  id v21 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  PBFDispatchAsyncWithString(a6, (dispatch_qos_class_t)a5, v18);
}

void __75__PBFPosterExtensionDataStore_processEvents_context_QOS_reason_completion___block_invoke(void *a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 188));
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v9 = 0;
  char v5 = objc_msgSend(v2, "_stateLock_processEvents:context:error:", v3, v4, &v9);
  id v6 = v9;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 188));
  if ((v5 & 1) == 0 && !v6)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28588];
    v11[0] = @"events processing was not successful, but no error was issued";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_msgSend(v7, "pbf_generalErrorWithCode:userInfo:", 0, v8);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(a1[7] + 16))();
}

- (id)updateDataStoreForSwitcherConfiguration:(id)a3 reason:(id)a4 error:(id *)a5
{
  return [(PBFPosterExtensionDataStore *)self updateDataStoreForSwitcherConfiguration:a3 options:0 reason:a4 error:a5];
}

- (id)updateDataStoreForSwitcherConfiguration:(id)a3 options:(unint64_t)a4 reason:(id)a5 error:(id *)a6
{
  p_stateLock = &self->_stateLock;
  id v11 = a5;
  id v12 = a3;
  os_unfair_lock_lock(p_stateLock);
  id v13 = [(PBFPosterExtensionDataStore *)self _stateLock_updateDataStoreForSwitcherConfiguration:v12 options:a4 reason:v11 error:a6];

  os_unfair_lock_unlock(p_stateLock);
  return v13;
}

- (void)_transitionToNewSwitcherConfigurationIfNeededForReason:(id)a3 error:(id *)a4
{
  p_stateLock = &self->_stateLock;
  id v7 = a3;
  os_unfair_lock_lock(p_stateLock);
  [(PBFPosterExtensionDataStore *)self _transitionToNewSwitcherConfigurationIfNeededForReason:v7 error:a4];

  os_unfair_lock_unlock(p_stateLock);
}

- (id)_stateLock_updateDataStoreForSwitcherConfiguration:(id)a3 options:(unint64_t)a4 reason:(id)a5 error:(id *)a6
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    uint64_t v143 = *MEMORY[0x1E4F92790];
    uint64_t v13 = -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:");
    id v14 = (void *)v13;
    if (!v13)
    {
      id v12 = 0;
LABEL_104:

      goto LABEL_105;
    }
    unint64_t v128 = a4;
    BOOL v129 = a6;
    v130 = (void *)v13;
    id v15 = [(PBFPosterExtensionDataStore *)self _stateLock_switcherConfiguration];
    id v16 = (void *)MEMORY[0x1E4F1CAD0];
    id v135 = self;
    id v17 = [(PFPosterExtensionProvider *)self->_extensionProvider extensionForIdentifier];
    id v18 = [v17 allKeys];
    double v141 = [v16 setWithArray:v18];

    id v19 = [v15 configurations];
    uint64_t v20 = objc_msgSend(v19, "bs_mapNoNulls:", &__block_literal_global_569);

    id v21 = [v10 configurations];
    uint64_t v22 = objc_msgSend(v21, "bs_mapNoNulls:", &__block_literal_global_571);

    uint64_t v23 = [v10 desiredActiveConfiguration];
    id v24 = [v15 activeConfiguration];
    int v25 = v10;
    int v26 = [v23 isEqual:v24];

    BOOL v27 = [v25 selectedConfiguration];
    char v132 = v15;
    id v28 = [v15 selectedConfiguration];
    int v29 = [v27 isEqual:v28];

    uint64_t v140 = v22;
    v131 = (void *)v20;
    int v30 = [v22 isEqualToArray:v20];
    id v31 = [v25 posterConfigurationsNeedingFocusConfigurationDeleted];
    uint64_t v137 = [v31 count];

    id v32 = [v25 posterConfigurationsNeedingFocusConfigurationUpdates];
    uint64_t v136 = [v32 count];

    id v33 = [v25 posterConfigurationsNeedingHomeScreenConfigurationUpdates];
    uint64_t v134 = [v33 count];

    unint64_t v34 = [v25 incomingPosterConfigurations];
    uint64_t v35 = [v34 count];

    char v133 = v25;
    id v36 = [v25 incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs];
    uint64_t v37 = [v36 count];

    char v127 = v29;
    if (v29 && v26 && v30 && !v137 && !v136 && !v134 && !v35 && !v37)
    {
      id v38 = v132;
      id v12 = v132;
      id v10 = v25;
      id v14 = v130;
LABEL_103:

      goto LABEL_104;
    }
    if (v35
      && ![(PBFPosterExtensionDataStore *)v135 _stateLock_canPersistNewPosterConfiguration])
    {
      id v38 = v132;
      v108 = [v132 configurations];
      uint64_t v109 = [v108 count];

      uint64_t v110 = [(PBFPosterExtensionDataStore *)v135 _stateLock_maximumPosterConfigurationCount];
      id v111 = PBFLogDataStore();
      id v10 = v25;
      id v14 = v130;
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v166 = v109;
        __int16 v167 = 2048;
        uint64_t v168 = v110;
        _os_log_impl(&dword_1D31CE000, v111, OS_LOG_TYPE_DEFAULT, "refusing to ingest a new poster configuration because there are %lu existing configurations (limit: %li)", buf, 0x16u);
      }

      if (v129)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2206, 0);
        *BOOL v129 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v12 = v132;
      goto LABEL_103;
    }
    long long v142 = objc_opt_new();
    id v10 = v25;
    if ((v30 & 1) == 0)
    {
      long long v39 = [v132 collection];
      long long v40 = [v39 orderedPosterUUIDs];

      long long v41 = (void *)MEMORY[0x1E4F1CAA0];
      long long v42 = [v25 configurations];
      id v43 = objc_msgSend(v42, "bs_mapNoNulls:", &__block_literal_global_574);
      id v44 = [v41 orderedSetWithArray:v43];

      uint64_t v45 = [v40 count];
      if (v45 == [v44 count] && (objc_msgSend(v40, "isEqual:", v44) & 1) == 0)
      {
        __int16 v46 = +[PBFPosterRoleCoordinatorChange reorderPostersForRole:v143 sortedPosterUUIDs:v44];
        [v142 addObject:v46];
      }
    }
    id v126 = v11;
    if (v35)
    {
      long long v159 = 0u;
      long long v160 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      id v47 = [v25 incomingPosterConfigurations];
      uint64_t v48 = [v47 countByEnumeratingWithState:&v157 objects:v164 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v158;
        do
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v158 != v50) {
              objc_enumerationMutation(v47);
            }
            os_signpost_id_t v52 = *(void **)(*((void *)&v157 + 1) + 8 * i);
            switch([v52 incomingPosterType])
            {
              case 0:
              case 3:
              case 4:
              case 5:
                v123 = [NSString stringWithFormat:@"Unsupported incoming poster: %@", v52];
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                  -[PBFPosterExtensionDataStore _stateLock_updateDataStoreForSwitcherConfiguration:options:reason:error:]();
                }
                [v123 UTF8String];
                _bs_set_crash_log_message();
                __break(0);
                JUMPOUT(0x1D31EB100);
              case 1:
                uint64_t v53 = +[PBFPosterRoleCoordinatorChange addPosterToRole:v143 incomingPoster:v52];
                goto LABEL_32;
              case 2:
                uint64_t v53 = +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:v143 incomingPoster:v52];
LABEL_32:
                id v54 = (void *)v53;
                [v142 addObject:v53];

                break;
              default:
                continue;
            }
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v157 objects:v164 count:16];
        }
        while (v49);
      }

      id v11 = v126;
    }
    if (v37)
    {
      __int16 v55 = [v133 incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs];
      long long v153 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      id v56 = [v55 keyEnumerator];
      uint64_t v57 = [v56 countByEnumeratingWithState:&v153 objects:v163 count:16];
      if (!v57) {
        goto LABEL_51;
      }
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v154;
      while (1)
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v154 != v59) {
            objc_enumerationMutation(v56);
          }
          id v61 = [v55 objectForKey:*(void *)(*((void *)&v153 + 1) + 8 * j)];
          unint64_t v62 = [v61 incomingPosterType];
          if (v62 == 4)
          {
            uint64_t v63 = +[PBFPosterRoleCoordinatorChange addPosterToRole:v143 incomingPoster:v61];
LABEL_48:
            id v64 = (void *)v63;
            [v142 addObject:v63];

            goto LABEL_49;
          }
          if (v62 == 5)
          {
            uint64_t v63 = +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:v143 incomingPoster:v61];
            goto LABEL_48;
          }
          if (v62 < 4)
          {
            id v124 = [NSString stringWithFormat:@"Unsupported assoc incoming poster: %@", v61];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[PBFPosterExtensionDataStore _stateLock_updateDataStoreForSwitcherConfiguration:options:reason:error:]();
            }
            [v124 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1D31EB15CLL);
          }
LABEL_49:
        }
        uint64_t v58 = [v56 countByEnumeratingWithState:&v153 objects:v163 count:16];
        if (!v58)
        {
LABEL_51:

          id v11 = v126;
          break;
        }
      }
    }
    if ((v30 & 1) == 0)
    {
      long long v151 = 0u;
      long long v152 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      id obj = v131;
      uint64_t v65 = [obj countByEnumeratingWithState:&v149 objects:v162 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v150;
        do
        {
          for (uint64_t k = 0; k != v66; ++k)
          {
            if (*(void *)v150 != v67) {
              objc_enumerationMutation(obj);
            }
            uint64_t v69 = *(void **)(*((void *)&v149 + 1) + 8 * k);
            v148[0] = MEMORY[0x1E4F143A8];
            v148[1] = 3221225472;
            v148[2] = __103__PBFPosterExtensionDataStore__stateLock_updateDataStoreForSwitcherConfiguration_options_reason_error___block_invoke_581;
            v148[3] = &unk_1E6980F78;
            v148[4] = v69;
            char v70 = objc_msgSend(v140, "bs_containsObjectPassingTest:", v148);
            BOOL v71 = [v69 serverIdentity];
            BOOL v72 = [v71 provider];
            int v73 = [v141 containsObject:v72];

            if ((v70 & 1) == 0 && v73)
            {
              id v74 = [v69 serverIdentity];
              id v75 = [v74 posterUUID];
              id v76 = +[PBFPosterRoleCoordinatorChange removePosterFromRole:v143 matchingUUID:v75];
              [v142 addObject:v76];
            }
          }
          uint64_t v66 = [obj countByEnumeratingWithState:&v149 objects:v162 count:16];
        }
        while (v66);
      }

      id v10 = v133;
      id v11 = v126;
    }
    if (v137 || v136 || v134)
    {
      id v77 = objc_opt_new();
      id v78 = [v10 posterConfigurationsNeedingHomeScreenConfigurationUpdates];
      id v79 = [v78 keyEnumerator];
      id v80 = [v79 allObjects];
      [v77 addObjectsFromArray:v80];

      id v81 = [v10 posterConfigurationsNeedingFocusConfigurationUpdates];
      char v82 = [v81 keyEnumerator];
      id v83 = [v82 allObjects];
      [v77 addObjectsFromArray:v83];

      id v84 = [v10 posterConfigurationsNeedingFocusConfigurationDeleted];
      id v85 = [v84 allObjects];
      [v77 addObjectsFromArray:v85];

      long long v146 = 0u;
      long long v147 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      id obja = v77;
      uint64_t v86 = [obja countByEnumeratingWithState:&v144 objects:v161 count:16];
      if (v86)
      {
        uint64_t v87 = v86;
        uint64_t v88 = *(void *)v145;
        do
        {
          for (uint64_t m = 0; m != v87; ++m)
          {
            if (*(void *)v145 != v88) {
              objc_enumerationMutation(obja);
            }
            id v90 = *(void **)(*((void *)&v144 + 1) + 8 * m);
            uint64_t v91 = [v10 posterConfigurationsNeedingHomeScreenConfigurationUpdates];
            id v92 = [v91 objectForKey:v90];

            id v93 = [v10 posterConfigurationsNeedingFocusConfigurationUpdates];
            id v94 = [v93 objectForKey:v90];

            id v95 = [v10 posterConfigurationsNeedingFocusConfigurationDeleted];
            int v96 = [v95 containsObject:v90];

            long long v97 = [v90 loadConfiguredPropertiesWithError:0];
            id v98 = (void *)[v97 mutableCopy];

            if ((v96 & 1) != 0 || v94)
            {
              if (v96) {
                uint64_t v99 = 0;
              }
              else {
                uint64_t v99 = v94;
              }
              [v98 setFocusConfiguration:v99];
            }
            if (v92) {
              [v98 setHomeScreenConfiguration:v92];
            }
            long long v100 = objc_msgSend(v90, "pbf_posterUUID");
            uint64_t v101 = +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:v98 forPosterWithinRole:v143 matchingUUID:v100];
            [v142 addObject:v101];
          }
          uint64_t v87 = [obja countByEnumeratingWithState:&v144 objects:v161 count:16];
        }
        while (v87);
      }

      id v11 = v126;
    }
    id v38 = v132;
    long long v102 = v135;
    if (v127)
    {
LABEL_96:
      __int16 v114 = [v10 desiredActiveConfiguration];
      id v115 = [(PBFPosterExtensionDataStore *)v102 _buildRoleCoordinatorTransitionContext];
      objc_msgSend(v115, "setTransitionFromIncomingFocusModeChange:", objc_msgSend(v10, "activeConfigurationDueToIncomingFocusModeChange"));
      __int16 v116 = objc_msgSend(v114, "pbf_posterUUID");
      [v115 setDesiredActiveConfiguration:v116 forRole:v143];

      uint64_t v117 = PBFLogDataStore();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        int v118 = [v10 activeConfigurationDueToIncomingFocusModeChange];
        id v119 = @"NO";
        if (v118) {
          id v119 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v166 = (uint64_t)v114;
        __int16 v167 = 2112;
        uint64_t v168 = (uint64_t)v119;
        _os_log_impl(&dword_1D31CE000, v117, OS_LOG_TYPE_DEFAULT, "_updateDataStoreForSwitcherConfiguration created context with desiredActiveConfiguration: %@ dueToIncomingFocusModeChange: %@", buf, 0x16u);
      }

      BOOL v120 = [(PBFPosterExtensionDataStore *)v135 _stateLock_executeDataStoreUpdateWithChanges:v142 diffs:0 options:v128 reason:v11 context:v115 error:v129];
      stateLock_switcherConfiguration = (PRSwitcherConfiguration *)v132;
      id v14 = v130;
      if (v120) {
        stateLock_switcherConfiguration = v135->_stateLock_switcherConfiguration;
      }
      id v12 = stateLock_switcherConfiguration;

      goto LABEL_103;
    }
    uint64_t v103 = [v10 selectedConfiguration];
    id v104 = (void *)MEMORY[0x1E4F926B0];
    uint64_t v105 = [v103 _path];
    v106 = [v104 loadFocusConfigurationForPath:v105 error:0];

    if (v106)
    {
      uint64_t v107 = PBFLogDataStore();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v166 = (uint64_t)v103;
        _os_log_impl(&dword_1D31CE000, v107, OS_LOG_TYPE_DEFAULT, "Making poster %@ with paired focus mode the new selected configuration- this should never occur!", buf, 0xCu);
      }
    }
    else
    {
      if (!v103)
      {
LABEL_95:

        goto LABEL_96;
      }
      uint64_t v107 = [v10 selectedConfiguration];
      v112 = [v107 pbf_posterUUID];
      uint64_t v113 = +[PBFPosterRoleCoordinatorChange selectPosterForRole:v143 matchingUUID:v112];
      [v142 addObject:v113];

      long long v102 = v135;
    }

    goto LABEL_95;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    id v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }
LABEL_105:

  return v12;
}

uint64_t __103__PBFPosterExtensionDataStore__stateLock_updateDataStoreForSwitcherConfiguration_options_reason_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _path];
}

uint64_t __103__PBFPosterExtensionDataStore__stateLock_updateDataStoreForSwitcherConfiguration_options_reason_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _path];
}

uint64_t __103__PBFPosterExtensionDataStore__stateLock_updateDataStoreForSwitcherConfiguration_options_reason_error___block_invoke_572(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pbf_posterUUID");
}

uint64_t __103__PBFPosterExtensionDataStore__stateLock_updateDataStoreForSwitcherConfiguration_options_reason_error___block_invoke_581(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 serverIdentity];
  uint64_t v4 = [v3 posterUUID];
  char v5 = [*(id *)(a1 + 32) serverIdentity];
  id v6 = [v5 posterUUID];
  uint64_t v7 = [v4 isEqual:v6];

  return v7;
}

- (id)_buildRoleCoordinatorTransitionContextForActivity:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "pbf_activeChargerIdentifier");
  uint64_t v7 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContextForActiveFocusMode:v5 chargerIdentifier:v6];

  return v7;
}

- (id)_buildRoleCoordinatorTransitionContextForChargerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PBFPosterExtensionDataStore *)self _activeActivity];
  id v6 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContextForActiveFocusMode:v5 chargerIdentifier:v4];

  return v6;
}

- (id)_buildRoleCoordinatorTransitionNotingInitialUpdate
{
  uint64_t v2 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContext];
  [v2 setInitialUpdate:1];
  return v2;
}

- (id)_buildRoleCoordinatorTransitionContext
{
  uint64_t v3 = [(PBFPosterExtensionDataStore *)self _activeActivity];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_activeChargerIdentifier");
  id v5 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContextForActiveFocusMode:v3 chargerIdentifier:v4];

  return v5;
}

- (id)_buildRoleCoordinatorTransitionContextWithDesiredActivePosterUUID:(id)a3 role:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContext];
  id v9 = v8;
  if (v6 && v7) {
    [v8 setDesiredActiveConfiguration:v6 forRole:v7];
  }

  return v9;
}

- (id)_buildRoleCoordinatorTransitionContextForActiveFocusMode:(id)a3 chargerIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_extensionProvidingLock);
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier copy];
  os_unfair_lock_unlock(&self->_extensionProvidingLock);
  p_activePosterLocuint64_t k = &self->_activePosterLock;
  os_unfair_lock_lock(&self->_activePosterLock);
  id v10 = (void *)[(NSMutableDictionary *)self->_activePosterLock_roleToActivePosterConfiguration copy];
  os_unfair_lock_unlock(p_activePosterLock);
  id v11 = PBFLogDataStore();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v6 activityUniqueIdentifier];
    int v15 = 138412290;
    id v16 = v12;
    _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "Creating transitionContext with activeActivity: %@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v13 = [[PBFPosterRoleCoordinatorGenericTransitionContext alloc] initWithActiveFocusMode:v6 activeChargerIdentifier:v7 extensionStoreCoordinators:v8 currentActivePosterForRole:v10];

  return v13;
}

- (BOOL)_stateLock_executeDataStoreUpdateWithChanges:(id)a3 diffs:(id *)a4 options:(unint64_t)a5 reason:(id)a6 context:(id)a7 error:(id *)a8
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (!v16)
    {
      id v16 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContext];
    }
    id v18 = objc_msgSend(v16, "pbf_transitionContextIdentifier");
    id v19 = [v18 UUIDString];
    uint64_t v20 = [v19 substringToIndex:7];

    id v21 = PBFLogDataStore();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v55 = v20;
      __int16 v56 = 2114;
      id v57 = v15;
      _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@} executing data store update for reason: %{public}@", buf, 0x16u);
    }

    if (!self->_database)
    {
      if (!a8)
      {
        BOOL v17 = 0;
        goto LABEL_24;
      }
      id v44 = v20;
      id v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F28588];
      uint64_t v53 = @"Database is nil when trying to initialize Poster role processor";
      int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      objc_msgSend(v28, "pbf_generalErrorWithCode:userInfo:", 1, v25);
      BOOL v17 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

      uint64_t v20 = v44;
LABEL_24:

      goto LABEL_25;
    }
    id v43 = v14;
    id v44 = v20;
    id v42 = v15;
    uint64_t v22 = [PBFPosterRoleProcessor alloc];
    database = self->_database;
    id v24 = [(NSDictionary *)self->_roleToRoleCoordinator allValues];
    int v25 = [(PBFPosterRoleProcessor *)v22 initWithDataStorage:database roleCoordinators:v24];

    [(PBFPosterRoleProcessor *)v25 addObserver:self];
    if (a5)
    {
      uint64_t v50 = @"updateOptions";
      int v26 = [NSNumber numberWithUnsignedInteger:a5];
      uint64_t v51 = v26;
      BOOL v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    }
    else
    {
      BOOL v27 = 0;
    }
    runtimeAssertionProvider = self->_runtimeAssertionProvider;
    int v30 = [@"dataStoreUpdate-" stringByAppendingString:v44];
    id v31 = [MEMORY[0x1E4F96478] currentProcess];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __111__PBFPosterExtensionDataStore__stateLock_executeDataStoreUpdateWithChanges_diffs_options_reason_context_error___block_invoke;
    v48[3] = &unk_1E6980A00;
    id v32 = v44;
    id v49 = v32;
    id v33 = [(PBFRuntimeAssertionProviding *)runtimeAssertionProvider acquirePrewarmRuntimeAssertionForReason:v30 target:v31 invalidationHandler:v48];

    unint64_t v34 = [@"executeDataStoreUpdateWithChanges-%@" stringByAppendingString:v32];
    id v47 = 0;
    uint64_t v35 = [(PBFPosterRoleProcessor *)v25 processChanges:v43 context:v16 reason:v34 userInfo:v27 error:&v47];
    id v36 = v47;

    BOOL v17 = v35 != 0;
    if (v35)
    {
      if (a4)
      {
        *a4 = [v35 collectionDiffsPerRole];
      }
      if (!a8) {
        goto LABEL_20;
      }
    }
    else
    {
      long long v41 = PBFLogDataStore();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:]();
      }

      if (!a8) {
        goto LABEL_20;
      }
    }
    *a8 = v36;
LABEL_20:
    uint64_t v37 = [NSString stringWithUTF8String:"-[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:]"];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    void v45[2] = __111__PBFPosterExtensionDataStore__stateLock_executeDataStoreUpdateWithChanges_diffs_options_reason_context_error___block_invoke_602;
    v45[3] = &unk_1E69808C0;
    id v38 = v33;
    id v46 = v38;
    PBFDispatchAsyncWithString(v37, QOS_CLASS_DEFAULT, v45);

    long long v39 = PBFLogDataStore();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v55 = v32;
      _os_log_impl(&dword_1D31CE000, v39, OS_LOG_TYPE_DEFAULT, "(%{public}@} Fin.", buf, 0xCu);
    }

    id v15 = v42;
    id v14 = v43;
    goto LABEL_23;
  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    BOOL v17 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_25:

  return v17;
}

void __111__PBFPosterExtensionDataStore__stateLock_executeDataStoreUpdateWithChanges_diffs_options_reason_context_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PBFLogDataStore();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) PosterBoard runtime assertion invalidated: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __111__PBFPosterExtensionDataStore__stateLock_executeDataStoreUpdateWithChanges_diffs_options_reason_context_error___block_invoke_602(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:(id)a3 roleCoordinator:(id)a4 context:(id)a5
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag]) {
    goto LABEL_54;
  }
  id v11 = PBFLogDataStore();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = PBFLogDataStore();
  id v14 = v13;
  unint64_t v75 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138543618;
    id v110 = v9;
    __int16 v111 = 2114;
    unint64_t v112 = (unint64_t)v10;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:", "roleCoordinator: %{public}@ context: %{public}@", buf, 0x16u);
  }
  os_signpost_id_t spid = v12;

  id v15 = [v9 role];
  id v16 = [v15 stringByAppendingFormat:@"-%@", @"Configuration Used in Switcher"];
  BOOL v17 = [v15 stringByAppendingFormat:@"-%@", @"In use by home screen poster"];
  id v81 = [v15 stringByAppendingFormat:@"-%@", @"User-Selected Configuration"];
  id v83 = [v15 stringByAppendingFormat:@"-%@", @"Active Configuration"];
  id v18 = [v8 initialCollection];
  id v19 = (void *)[v8 newCollection];
  uint64_t v20 = self->_assertionManager;
  uint64_t v88 = self;
  id v85 = v15;
  id v21 = [(PBFPosterExtensionDataStore *)self activePosterConfigurationForRole:v15 assocPoster:0];
  id v76 = v10;
  id v77 = v9;
  uint64_t v22 = [v9 determineActivePosterConfigurationForContext:v10];
  uint64_t v23 = [v18 selectedPoster];
  id v24 = [v19 selectedPoster];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke;
  v97[3] = &unk_1E69812C0;
  id v73 = v8;
  id v98 = v8;
  id v86 = v16;
  id v99 = v86;
  id v74 = v18;
  id v100 = v74;
  id v87 = v17;
  id v101 = v87;
  id v79 = v23;
  id v102 = v79;
  id v25 = v81;
  id v103 = v25;
  id v78 = v24;
  id v104 = v78;
  id v26 = v22;
  id v105 = v26;
  id v80 = v21;
  id v106 = v80;
  id v84 = v83;
  id v107 = v84;
  id v27 = v19;
  id v108 = v27;
  char v82 = v26;
  if (![(PBFPosterExtensionDataStoreAssertionManager *)v20 executeTransaction:v97])
  {
    int v29 = PBFLogDataStore();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v30 = v85;
      id v110 = v85;
      _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "Role %{public}@ had no changes... moving on...", buf, 0xCu);
      id v10 = v76;
      id v9 = v77;
    }
    else
    {
      id v10 = v76;
      id v9 = v77;
      int v30 = v85;
    }
    goto LABEL_50;
  }
  if (v26) {
    id v28 = v26;
  }
  else {
    id v28 = 0;
  }
  [(PBFPosterExtensionDataStore *)v88 markPosterConfigurationAsActive:v28 forRole:v85];
  uint64_t v31 = [(PBFPosterExtensionDataStoreAssertionManager *)v88->_assertionManager numberOfAssertionsForReason:v86];
  id v32 = [v27 orderedPosters];
  uint64_t v33 = [v32 count];

  unint64_t v34 = PBFLogDataStore();
  uint64_t v35 = v34;
  char v70 = v20;
  id v71 = v25;
  if (v31 == v33)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v110 = v85;
      __int16 v111 = 2048;
      unint64_t v112 = v31;
      _os_log_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEFAULT, "Role %{public}@ numberOfOrderedPostersAssertionsForReason %lu", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
  {
    -[PBFPosterExtensionDataStore _stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:]();
  }

  int v29 = [(PBFPosterExtensionDataStoreAssertionManager *)v88->_assertionManager inUsePosterPathIdentitiesForReason:v86];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v36 = [v27 orderedPosters];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v93 objects:v118 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v94 != v39) {
          objc_enumerationMutation(v36);
        }
        long long v41 = [*(id *)(*((void *)&v93 + 1) + 8 * i) _path];
        id v42 = [v41 serverIdentity];
        char v43 = [v29 containsObject:v42];

        if ((v43 & 1) == 0)
        {
          uint64_t v68 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[inUsePosterPathIdentitiesForReason containsObject:[[inUseSwitcherConfiguration _path] serverIdentity]]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[PBFPosterExtensionDataStore _stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:]();
          }
          [v68 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D31EC61CLL);
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v93 objects:v118 count:16];
    }
    while (v38);
  }

  id v44 = [(PBFPosterExtensionDataStoreAssertionManager *)v88->_assertionManager inUsePosterPathIdentitiesForReason:v87];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v45 = [v27 associatedPosters];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v89 objects:v117 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v90 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = [*(id *)(*((void *)&v89 + 1) + 8 * j) _path];
        uint64_t v51 = [v50 serverIdentity];
        char v52 = [v44 containsObject:v51];

        if ((v52 & 1) == 0)
        {
          uint64_t v69 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[inUseAssocPosterPathIdentitiesForReason containsObject:[[inUseHomeScreenConfiguration _path] serverIdentity]]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[PBFPosterExtensionDataStore _stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:]();
          }
          [v69 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D31EC680);
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v89 objects:v117 count:16];
    }
    while (v47);
  }

  unint64_t v53 = [(PBFPosterExtensionDataStoreAssertionManager *)v88->_assertionManager numberOfAssertionsForReason:v84];
  id v54 = PBFLogDataStore();
  id v55 = v54;
  if (v53 < 2)
  {
    int v30 = v85;
    id v56 = v71;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v110 = v85;
      __int16 v111 = 2048;
      unint64_t v112 = v53;
      __int16 v113 = 2114;
      id v114 = v80;
      __int16 v115 = 2114;
      id v116 = v82;
      _os_log_impl(&dword_1D31CE000, v55, OS_LOG_TYPE_DEFAULT, "Role %{public}@ numberOfActivePosterInUseAssertions %lu; %{public}@ -> %{public}@",
        buf,
        0x2Au);
    }
  }
  else
  {
    int v30 = v85;
    id v56 = v71;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v110 = v85;
      __int16 v111 = 2048;
      unint64_t v112 = v53;
      __int16 v113 = 2114;
      id v114 = v80;
      __int16 v115 = 2114;
      id v116 = v82;
      _os_log_fault_impl(&dword_1D31CE000, v55, OS_LOG_TYPE_FAULT, "Role %{public}@ numberOfActivePosterInUseAssertions %lu; %{public}@ -> %{public}@",
        buf,
        0x2Au);
    }
  }

  uint64_t v57 = [(PBFPosterExtensionDataStoreAssertionManager *)v88->_assertionManager numberOfAssertionsForReason:v56];
  if (v57
    && ([v27 selectedPoster], uint64_t v58 = objc_claimAutoreleasedReturnValue(), v58, v58))
  {
    uint64_t v59 = PBFLogDataStore();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v110 = v30;
      __int16 v111 = 2048;
      unint64_t v112 = v57;
      __int16 v113 = 2114;
      id v114 = v79;
      __int16 v115 = 2114;
      id v116 = v78;
      _os_log_impl(&dword_1D31CE000, v59, OS_LOG_TYPE_DEFAULT, "Role %{public}@ numberOfInUseSelectedPosterInUseAssertions %lu; %{public}@ -> %{public}@",
        buf,
        0x2Au);
    }
  }
  else
  {
    uint64_t v59 = PBFLogDataStore();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v110 = v30;
      __int16 v111 = 2048;
      unint64_t v112 = v57;
      __int16 v113 = 2114;
      id v114 = v79;
      __int16 v115 = 2114;
      id v116 = v78;
      _os_log_fault_impl(&dword_1D31CE000, v59, OS_LOG_TYPE_FAULT, "Role %{public}@ numberOfInUseSelectedPosterInUseAssertions %lu; %{public}@ -> %{public}@",
        buf,
        0x2Au);
    }
  }

  uint64_t v60 = [(PBFPosterExtensionDataStoreAssertionManager *)v88->_assertionManager numberOfAssertionsForReason:v87];
  id v61 = [v27 associatedPosterUUIDs];
  uint64_t v62 = [v61 count];

  uint64_t v63 = PBFLogDataStore();
  id v64 = v63;
  if (v60 != v62)
  {
    id v8 = v73;
    uint64_t v20 = v70;
    if (!os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
      goto LABEL_49;
    }
    uint64_t v65 = [v27 associatedPosterUUIDs];
    *(_DWORD *)buf = 138543874;
    id v110 = v30;
    __int16 v111 = 2048;
    unint64_t v112 = v60;
    __int16 v113 = 2114;
    id v114 = v65;
    _os_log_fault_impl(&dword_1D31CE000, v64, OS_LOG_TYPE_FAULT, "Role %{public}@ numberOfInUseAssocPostersInUseAssertions %lu; associatedPosterUUIDs: %{public}@",
      buf,
      0x20u);
    goto LABEL_47;
  }
  id v8 = v73;
  uint64_t v20 = v70;
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v65 = [v27 associatedPosterUUIDs];
    *(_DWORD *)buf = 138543874;
    id v110 = v30;
    __int16 v111 = 2048;
    unint64_t v112 = v60;
    __int16 v113 = 2114;
    id v114 = v65;
    _os_log_impl(&dword_1D31CE000, v64, OS_LOG_TYPE_DEFAULT, "Role %{public}@ numberOfInUseAssocPostersInUseAssertions %lu; associatedPosterUUIDs: %{public}@",
      buf,
      0x20u);
LABEL_47:
  }
LABEL_49:

  id v10 = v76;
  id v9 = v77;
  id v25 = v71;
LABEL_50:

  uint64_t v66 = PBFLogDataStore();
  uint64_t v67 = v66;
  if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
  {
    *(_DWORD *)buf = 138543618;
    id v110 = v9;
    __int16 v111 = 2114;
    unint64_t v112 = (unint64_t)v10;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v67, OS_SIGNPOST_INTERVAL_END, spid, "_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:", "roleCoordinator: %{public}@ context: %{public}@", buf, 0x16u);
  }

LABEL_54:
}

uint64_t __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) removedPosters];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_2;
  v76[3] = &unk_1E6981270;
  id v5 = v3;
  id v77 = v5;
  id v78 = *(id *)(a1 + 40);
  objc_msgSend(v4, "bs_each:", v76);

  int v6 = [*(id *)(a1 + 32) addedPosters];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_3;
  v73[3] = &unk_1E6981270;
  id v7 = v5;
  id v74 = v7;
  id v75 = *(id *)(a1 + 40);
  objc_msgSend(v6, "bs_each:", v73);

  id v8 = [*(id *)(a1 + 32) updatedPosters];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  void v69[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_4;
  v69[3] = &unk_1E6981298;
  id v70 = *(id *)(a1 + 48);
  id v9 = v7;
  id v71 = v9;
  id v72 = *(id *)(a1 + 40);
  objc_msgSend(v8, "bs_each:", v69);

  id v10 = [*(id *)(a1 + 32) removedAssocPosters];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_5;
  v66[3] = &unk_1E6981270;
  id v11 = v9;
  id v67 = v11;
  id v68 = *(id *)(a1 + 56);
  objc_msgSend(v10, "bs_each:", v66);

  os_signpost_id_t v12 = [*(id *)(a1 + 32) addedAssocPosters];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  void v63[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_6;
  v63[3] = &unk_1E6981270;
  id v13 = v11;
  id v64 = v13;
  id v65 = *(id *)(a1 + 56);
  objc_msgSend(v12, "bs_each:", v63);

  id v14 = [*(id *)(a1 + 32) updatedAssocPosters];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_7;
  v59[3] = &unk_1E6981298;
  id v60 = *(id *)(a1 + 48);
  id v15 = v13;
  id v61 = v15;
  id v62 = *(id *)(a1 + 56);
  objc_msgSend(v14, "bs_each:", v59);

  if (([*(id *)(a1 + 32) selectedPostersAreEqual] & 1) == 0)
  {
    id v16 = [*(id *)(a1 + 64) _path];
    BOOL v17 = [v16 serverIdentity];
    [v15 invalidateInUseAssertionForIdentity:v17 reason:*(void *)(a1 + 72)];

    id v18 = [*(id *)(a1 + 80) _path];
    id v19 = [v18 serverIdentity];
    [v15 acquireInUseAssertionForIdentity:v19 reason:*(void *)(a1 + 72)];
  }
  int v20 = BSEqualObjects();
  id v21 = *(void **)(a1 + 96);
  if (v20)
  {
    if (v21) {
      goto LABEL_10;
    }
  }
  else if (v21)
  {
    uint64_t v22 = [v21 _path];
    uint64_t v23 = [v22 serverIdentity];
    [v15 invalidateInUseAssertionForIdentity:v23 reason:*(void *)(a1 + 104)];
  }
  id v24 = *(void **)(a1 + 88);
  if (v24)
  {
    id v25 = [v24 _path];
    id v26 = [v25 serverIdentity];
    [v15 acquireInUseAssertionForIdentity:v26 reason:*(void *)(a1 + 104)];
  }
LABEL_10:
  uint64_t v27 = [v15 numberOfAssertionsForReason:*(void *)(a1 + 40)];
  id v28 = [*(id *)(a1 + 112) orderedPosters];
  uint64_t v29 = [v28 count];

  if (v27 != v29)
  {
    int v30 = [v15 inUsePosterPathIdentitiesForReason:*(void *)(a1 + 40)];
    uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
    id v32 = [*(id *)(a1 + 112) orderedPosters];
    uint64_t v33 = [v32 array];
    unint64_t v34 = objc_msgSend(v33, "bs_mapNoNulls:", &__block_literal_global_605);
    uint64_t v35 = [v31 setWithArray:v34];

    id v36 = (void *)[v30 mutableCopy];
    uint64_t v50 = (void *)v35;
    [v36 minusSet:v35];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v37 = v36;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v55 objects:v80 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v56;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v56 != v40) {
            objc_enumerationMutation(v37);
          }
          [v15 invalidateInUseAssertionForIdentity:*(void *)(*((void *)&v55 + 1) + 8 * v41++) reason:*(void *)(a1 + 40)];
        }
        while (v39 != v41);
        uint64_t v39 = [v37 countByEnumeratingWithState:&v55 objects:v80 count:16];
      }
      while (v39);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v42 = [*(id *)(a1 + 112) orderedPosters];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v51 objects:v79 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v52;
      do
      {
        uint64_t v46 = 0;
        do
        {
          if (*(void *)v52 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = [*(id *)(*((void *)&v51 + 1) + 8 * v46) _path];
          uint64_t v48 = [v47 serverIdentity];

          if (([v30 containsObject:v48] & 1) == 0) {
            [v15 acquireInUseAssertionForIdentity:v48 reason:*(void *)(a1 + 40)];
          }

          ++v46;
        }
        while (v44 != v46);
        uint64_t v44 = [v42 countByEnumeratingWithState:&v51 objects:v79 count:16];
      }
      while (v44);
    }
  }
  return 1;
}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = [a2 _path];
  id v4 = [v5 serverIdentity];
  [v3 invalidateInUseAssertionForIdentity:v4 reason:*(void *)(a1 + 40)];
}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = [a2 _path];
  id v4 = [v5 serverIdentity];
  [v3 acquireInUseAssertionForIdentity:v4 reason:*(void *)(a1 + 40)];
}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_4(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = objc_msgSend(v4, "pbf_posterUUID");
  id v12 = [v3 posterWithUUID:v5];

  int v6 = (void *)a1[5];
  id v7 = [v12 _path];
  id v8 = [v7 serverIdentity];
  [v6 invalidateInUseAssertionForIdentity:v8 reason:a1[6]];

  id v9 = (void *)a1[5];
  id v10 = [v4 _path];

  id v11 = [v10 serverIdentity];
  [v9 acquireInUseAssertionForIdentity:v11 reason:a1[6]];
}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = [a2 _path];
  id v4 = [v5 serverIdentity];
  [v3 invalidateInUseAssertionForIdentity:v4 reason:*(void *)(a1 + 40)];
}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = [a2 _path];
  id v4 = [v5 serverIdentity];
  [v3 acquireInUseAssertionForIdentity:v4 reason:*(void *)(a1 + 40)];
}

void __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_7(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = objc_msgSend(v4, "pbf_posterUUID");
  id v12 = [v3 associatedPosterForUUID:v5];

  int v6 = (void *)a1[5];
  id v7 = [v12 _path];
  id v8 = [v7 serverIdentity];
  [v6 invalidateInUseAssertionForIdentity:v8 reason:a1[6]];

  id v9 = (void *)a1[5];
  id v10 = [v4 _path];

  id v11 = [v10 serverIdentity];
  [v9 acquireInUseAssertionForIdentity:v11 reason:a1[6]];
}

id __115__PBFPosterExtensionDataStore__stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff_roleCoordinator_context___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 _path];
  id v3 = [v2 serverIdentity];

  return v3;
}

- (void)_stateLock_pushUpdateNotificationsForRole:(id)a3 diff:(id)a4 previouslyActiveConfiguration:(id)a5 newActiveConfiguration:(id)a6 options:(unint64_t)a7 reason:(id)a8 context:(id)a9
{
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  id v143 = a3;
  id v140 = a4;
  id v128 = a5;
  id v129 = a6;
  id v126 = a8;
  id v14 = a9;
  long long v142 = self;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag]) {
    goto LABEL_176;
  }
  id v124 = v14;
  id v15 = objc_msgSend(v14, "pbf_transitionContextIdentifier");
  id v16 = [v15 UUIDString];
  double v141 = [v16 substringToIndex:7];

  BOOL v17 = PBFLogDataStore();
  os_signpost_id_t spid = os_signpost_id_generate(v17);

  id v18 = PBFLogDataStore();
  id v19 = v18;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 138544642;
    id v192 = v143;
    __int16 v193 = 2114;
    id v194 = v128;
    __int16 v195 = 2114;
    *(void *)v196 = v129;
    *(_WORD *)&v196[8] = 2048;
    unint64_t v197 = a7;
    *(_WORD *)uint64_t v198 = 2114;
    *(void *)&v198[2] = v126;
    __int16 v199 = 2114;
    id v200 = v14;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v19, OS_SIGNPOST_INTERVAL_BEGIN, spid, "pushUpdateNotificationsForRole", "role: '%{public}@'; previousActivePosterConfiguration:'%{public}@' newlyActivatedConfiguration:'%{public}@'; optio"
      "ns:'%lu' reason:'%{public}@'; context:'%{public}@';",
      buf,
      0x3Eu);
  }

  int v20 = PBFLogDataStore();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v192 = v141;
    __int16 v193 = 2114;
    id v194 = v143;
    _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to issue update notifications for role %{public}@", buf, 0x16u);
  }

  v122 = (void *)[v140 newCollection];
  BOOL v120 = [v122 selectedPoster];
  char v127 = [v140 addedPosters];
  v123 = [v140 updatedPosters];
  v125 = [v140 removedPosters];
  int v131 = [v140 selectedPostersAreEqual];
  int v135 = BSEqualObjects();
  BOOL v21 = ![v140 orderedPostersAreEqual]
     || ![v140 associatedPostersAreEqual]
     || [v123 count] != 0;
  BOOL v116 = v21;
  uint64_t v117 = [v127 count];
  uint64_t v115 = [v125 count];
  uint64_t v139 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v182 = 0u;
  long long v183 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  uint64_t v22 = (void *)[v140 newCollection];
  uint64_t v23 = [v22 orderedPosters];

  uint64_t v24 = [v23 countByEnumeratingWithState:&v180 objects:v190 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v181;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v181 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = *(void *)(*((void *)&v180 + 1) + 8 * i);
        id v28 = (void *)[v140 newCollection];
        uint64_t v29 = [v28 associatedPosterForPoster:v27];

        if (v29) {
          [v139 setObject:v29 forKey:v27];
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v180 objects:v190 count:16];
    }
    while (v24);
  }

  uint64_t v137 = *MEMORY[0x1E4F92790];
  if (objc_msgSend(v143, "isEqual:"))
  {
    if (([v140 isEqual] & v131 & v135) == 1
      && ([v124 isInitialUpdate] & 1) == 0
      && v142->_stateLock_switcherConfiguration)
    {
      int v30 = PBFLogDataStore();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v143;
        _os_log_impl(&dword_1D31CE000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* update switcher model for role %{public}@", buf, 0x16u);
      }

      goto LABEL_44;
    }
    uint64_t v31 = PBFLogDataStore();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v192 = v141;
      __int16 v193 = 2114;
      id v194 = v143;
      _os_log_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_DEFAULT, "(%{public}@) preparing to update switcher model for role %{public}@", buf, 0x16u);
    }

    char v179 = 0;
    id v32 = [(PBFPosterExtensionDataStore *)v142 _stateLock_buildSwitcherConfigurationWithContext:v124 outMutated:&v179];
    if (([v124 isInitialUpdate] & 1) != 0 || !v142->_stateLock_switcherConfiguration)
    {
      id v36 = [v122 orderedPosters];
      uint64_t v37 = [v36 count];

      uint64_t v38 = PBFLogDataStore();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v143;
        _os_log_impl(&dword_1D31CE000, v38, OS_LOG_TYPE_DEFAULT, "(%{public}@) Initializing switcher model for role %{public}@", buf, 0x16u);
      }

      objc_storeStrong((id *)&v142->_stateLock_switcherConfiguration, v32);
      if (v179) {
        BOOL v39 = 1;
      }
      else {
        BOOL v39 = v37 == 0;
      }
      [(PBFPosterExtensionDataStore *)v142 _notifyObserversDidInitializeWithSwitcherConfiguration:v142->_stateLock_switcherConfiguration withChanges:v39];
      unint64_t v34 = PBFLogDataStore();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 138543618;
      id v192 = v141;
      __int16 v193 = 2114;
      id v194 = v143;
      uint64_t v35 = "(%{public}@) Initialized switcher model for role %{public}@";
    }
    else
    {
      objc_storeStrong((id *)&v142->_stateLock_switcherConfiguration, v32);
      uint64_t v33 = PBFLogDataStore();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v143;
        _os_log_impl(&dword_1D31CE000, v33, OS_LOG_TYPE_DEFAULT, "(%{public}@) Updated switcher model for role %{public}@", buf, 0x16u);
      }

      [(PBFPosterExtensionDataStore *)v142 _notifyObserversDidUpdateSwitcherConfiguration:v32];
      unint64_t v34 = PBFLogDataStore();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 138543618;
      id v192 = v141;
      __int16 v193 = 2114;
      id v194 = v143;
      uint64_t v35 = "(%{public}@) Notified observers for updated switcher configuration for role %{public}@";
    }
    _os_log_impl(&dword_1D31CE000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0x16u);
LABEL_43:

LABEL_44:
    if (v131)
    {
      uint64_t v40 = PBFLogDataStore();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v143;
        _os_log_impl(&dword_1D31CE000, v40, OS_LOG_TYPE_DEFAULT, "(%{public}@) Skipping notify of updated selected configuration for role %{public}@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v40 = [(PRSwitcherConfiguration *)v142->_stateLock_switcherConfiguration homeScreenPosterConfigurationForPosterConfiguration:v120];
      [(PBFPosterExtensionDataStore *)v142 _notifyObserversDidUpdateSelectedConfiguration:v120 associatedConfiguration:v40 reason:v126];
      uint64_t v41 = PBFLogDataStore();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v143;
        _os_log_impl(&dword_1D31CE000, v41, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did notify of updated selected configuration for role %{public}@", buf, 0x16u);
      }
    }
    id v42 = PBFLogDataStore();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
    if (v135)
    {
      if (v43)
      {
        *(_DWORD *)buf = 138543618;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v143;
        _os_log_impl(&dword_1D31CE000, v42, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* notify of updated active configuration for role %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (v43)
      {
        *(_DWORD *)buf = 138543618;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v143;
        _os_log_impl(&dword_1D31CE000, v42, OS_LOG_TYPE_DEFAULT, "(%{public}@) preparing to update last activated date for role %{public}@", buf, 0x16u);
      }

      uint64_t v44 = [v129 _path];
      uint64_t v45 = [v44 serverIdentity];
      uint64_t v46 = [v45 posterUUID];

      id v178 = 0;
      [(PBFPosterExtensionDataStore *)v142 _stateLock_findStoreCoordinatorsForUUID:v46 extensionStoreCoordinator:0 configurationStoreCoordinator:&v178];
      id v42 = v178;
      uint64_t v47 = [v42 providerInfo];
      uint64_t v48 = (void *)[v47 mutableCopy];
      id v49 = v48;
      if (v48)
      {
        id v50 = v48;
      }
      else
      {
        id v50 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      long long v51 = [MEMORY[0x1E4F1C9C8] now];
      [v50 setObject:v51 forKeyedSubscript:@"kConfigurationLastUseDateKey"];

      id v177 = 0;
      int v52 = [v42 setProviderInfo:v50 error:&v177];
      id v53 = v177;
      long long v54 = PBFLogDataStore();
      long long v55 = v54;
      if (v52)
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v192 = v141;
          __int16 v193 = 2114;
          id v194 = v46;
          __int16 v195 = 2114;
          *(void *)v196 = v143;
          _os_log_impl(&dword_1D31CE000, v55, OS_LOG_TYPE_DEFAULT, "(%{public}@) Success updating last activated date for poster %{public}@ in role %{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v46;
        __int16 v195 = 2114;
        *(void *)v196 = v143;
        *(_WORD *)&v196[8] = 2114;
        unint64_t v197 = (unint64_t)v53;
        _os_log_error_impl(&dword_1D31CE000, v55, OS_LOG_TYPE_ERROR, "(%{public}@) FAILED updating last activated date for poster %{public}@ in role %{public}@: %{public}@", buf, 0x2Au);
      }

      long long v56 = PBFLogDataStore();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v143;
        _os_log_impl(&dword_1D31CE000, v56, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for updated active configuration for role %{public}@", buf, 0x16u);
      }

      long long v57 = [v122 associatedPosterForPoster:v129];
      [(PBFPosterExtensionDataStore *)v142 _notifyObserversDidUpdateActiveConfiguration:v129 associatedConfiguration:v57 reason:v126];
      long long v58 = PBFLogDataStore();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v143;
        _os_log_impl(&dword_1D31CE000, v58, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notified observers for updated active configuration for role %{public}@", buf, 0x16u);
      }
    }
  }
  if ([v123 count])
  {
    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    uint64_t v59 = v123;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v173 objects:v189 count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v174;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v174 != v61) {
            objc_enumerationMutation(v59);
          }
          uint64_t v63 = *(void **)(*((void *)&v173 + 1) + 8 * j);
          id v64 = PBFLogDataStore();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v192 = v141;
            __int16 v193 = 2114;
            id v194 = v63;
            __int16 v195 = 2114;
            *(void *)v196 = v143;
            _os_log_impl(&dword_1D31CE000, v64, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for updated configuration %{public}@ for role %{public}@", buf, 0x20u);
          }

          [(PBFPosterExtensionDataStore *)v142 _notifyObserversDidUpdateConfiguration:v63];
          id v65 = PBFLogDataStore();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v192 = v141;
            __int16 v193 = 2114;
            id v194 = v63;
            __int16 v195 = 2114;
            *(void *)v196 = v143;
            _os_log_impl(&dword_1D31CE000, v65, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notified observers for updated configuration %{public}@ for role %{public}@", buf, 0x20u);
          }
        }
        uint64_t v60 = [v59 countByEnumeratingWithState:&v173 objects:v189 count:16];
      }
      while (v60);
    }
  }
  else
  {
    uint64_t v59 = PBFLogDataStore();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v192 = v141;
      __int16 v193 = 2114;
      id v194 = v143;
      _os_log_impl(&dword_1D31CE000, v59, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* notify observers for specific updated configurations for role %{public}@", buf, 0x16u);
    }
  }

  if ([v127 count] || (objc_msgSend(v140, "isEqual") & 1) == 0)
  {
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    uint64_t v66 = v127;
    uint64_t v67 = [v66 countByEnumeratingWithState:&v169 objects:v188 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v170;
      do
      {
        for (uint64_t k = 0; k != v67; ++k)
        {
          if (*(void *)v170 != v68) {
            objc_enumerationMutation(v66);
          }
          id v70 = *(void **)(*((void *)&v169 + 1) + 8 * k);
          id v71 = PBFLogDataStore();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v192 = v141;
            __int16 v193 = 2114;
            id v194 = v70;
            __int16 v195 = 2114;
            *(void *)v196 = v143;
            _os_log_impl(&dword_1D31CE000, v71, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for added configuration %{public}@ for role %{public}@", buf, 0x20u);
          }

          [(PBFPosterExtensionDataStore *)v142 _notifyObserversDidAddConfiguration:v70];
          id v72 = PBFLogDataStore();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v192 = v141;
            __int16 v193 = 2114;
            id v194 = v70;
            __int16 v195 = 2114;
            *(void *)v196 = v143;
            _os_log_impl(&dword_1D31CE000, v72, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notified observers for added configuration %{public}@ for role %{public}@", buf, 0x20u);
          }
        }
        uint64_t v67 = [v66 countByEnumeratingWithState:&v169 objects:v188 count:16];
      }
      while (v67);
    }
  }
  else
  {
    uint64_t v66 = PBFLogDataStore();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v192 = v141;
      __int16 v193 = 2114;
      id v194 = v143;
      _os_log_impl(&dword_1D31CE000, v66, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* notify observers for added configurations for role %{public}@", buf, 0x16u);
    }
  }

  if ([v125 count])
  {
    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    id v73 = v125;
    uint64_t v74 = [v73 countByEnumeratingWithState:&v165 objects:v187 count:16];
    if (v74)
    {
      uint64_t v75 = *(void *)v166;
      do
      {
        for (uint64_t m = 0; m != v74; ++m)
        {
          if (*(void *)v166 != v75) {
            objc_enumerationMutation(v73);
          }
          id v77 = *(void **)(*((void *)&v165 + 1) + 8 * m);
          id v78 = PBFLogDataStore();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v192 = v141;
            __int16 v193 = 2114;
            id v194 = v77;
            __int16 v195 = 2114;
            *(void *)v196 = v143;
            _os_log_impl(&dword_1D31CE000, v78, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for deleted configuration %{public}@ for role %{public}@", buf, 0x20u);
          }

          [(PBFPosterExtensionDataStore *)v142 _notifyObserversDidDeleteConfiguration:v77];
          id v79 = PBFLogDataStore();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            id v192 = v141;
            __int16 v193 = 2114;
            id v194 = v77;
            __int16 v195 = 2114;
            *(void *)v196 = v143;
            _os_log_impl(&dword_1D31CE000, v79, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notified observers for deleted configuration %{public}@ for role %{public}@", buf, 0x20u);
          }
        }
        uint64_t v74 = [v73 countByEnumeratingWithState:&v165 objects:v187 count:16];
      }
      while (v74);
    }
  }
  else
  {
    id v73 = PBFLogDataStore();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v192 = v141;
      __int16 v193 = 2114;
      id v194 = v143;
      _os_log_impl(&dword_1D31CE000, v73, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* notify observers for deleted configurations for role %{public}@", buf, 0x16u);
    }
  }

  if ([v139 count] && objc_msgSend(v143, "isEqual:", v137))
  {
    id v80 = PBFLogDataStore();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v192 = v141;
      __int16 v193 = 2114;
      id v194 = v139;
      __int16 v195 = 2114;
      *(void *)v196 = v143;
      _os_log_impl(&dword_1D31CE000, v80, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for changes to associated posters %{public}@ for role %{public}@", buf, 0x20u);
    }

    long long v163 = 0u;
    long long v164 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    uint64_t v81 = [v139 keyEnumerator];
    uint64_t v82 = [v81 countByEnumeratingWithState:&v161 objects:v186 count:16];
    if (v82)
    {
      uint64_t v83 = *(void *)v162;
      do
      {
        for (uint64_t n = 0; n != v82; ++n)
        {
          if (*(void *)v162 != v83) {
            objc_enumerationMutation(v81);
          }
          uint64_t v85 = *(void *)(*((void *)&v161 + 1) + 8 * n);
          id v86 = [v139 objectForKey:v85];
          if (v86)
          {
            id v87 = PBFLogDataStore();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              id v192 = v141;
              __int16 v193 = 2114;
              id v194 = v86;
              __int16 v195 = 2114;
              *(void *)v196 = v143;
              _os_log_impl(&dword_1D31CE000, v87, OS_LOG_TYPE_DEFAULT, "(%{public}@) Preparing to notify observers for updated associated poster %{public}@ for role %{public}@", buf, 0x20u);
            }

            [(PBFPosterExtensionDataStore *)v142 _notifyObserversDidUpdateConfiguration:v85 homeScreenAssociatedConfiguration:v86];
            uint64_t v88 = PBFLogDataStore();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              id v192 = v141;
              __int16 v193 = 2114;
              id v194 = v86;
              __int16 v195 = 2114;
              *(void *)v196 = v143;
              _os_log_impl(&dword_1D31CE000, v88, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notified observers for updated associated poster %{public}@ for role %{public}@", buf, 0x20u);
            }
          }
        }
        uint64_t v82 = [v81 countByEnumeratingWithState:&v161 objects:v186 count:16];
      }
      while (v82);
    }
  }
  else
  {
    uint64_t v81 = PBFLogDataStore();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v192 = v141;
      __int16 v193 = 2114;
      id v194 = v143;
      _os_log_impl(&dword_1D31CE000, v81, OS_LOG_TYPE_DEFAULT, "(%{public}@) Did *NOT* notify observers for changes to associated posters for role %{public}@", buf, 0x16u);
    }
  }

  int v118 = v131 ^ 1;
  int v119 = v135 ^ 1;
  if ([MEMORY[0x1E4F927B0] proactiveGallerySupportedForRole:v143])
  {
    if (((v119 | v118) & 1) != 0 || [v127 count]) {
      goto LABEL_140;
    }
    uint64_t v89 = [v125 count];
    int v90 = v116;
    if (v89) {
      int v90 = 1;
    }
    if ((v90 | (v115 != 0 || v117 != 0)) == 1)
    {
LABEL_140:
      long long v91 = PBFLogDataStore();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v143;
        _os_log_impl(&dword_1D31CE000, v91, OS_LOG_TYPE_DEFAULT, "(%{public}@) Pushing updated poster configurations for role %{public}@", buf, 0x16u);
      }

      [(PBFPosterExtensionDataStore *)v142 _stateLock_pushPosterConfigurationsToProactiveWithCompletion:0];
      [(PBFPosterExtensionDataStore *)v142 _notifyObserversDidUpdateConfigurations];
    }
    else
    {
      __int16 v113 = PBFLogDataStore();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v192 = v141;
        __int16 v193 = 2114;
        id v194 = v143;
        _os_log_impl(&dword_1D31CE000, v113, OS_LOG_TYPE_DEFAULT, "(%{public}@) DID NOT push updated poster configurations for role %{public}@", buf, 0x16u);
      }
    }
  }
  if ((([v143 isEqual:v137] ^ 1 | v135) & 1) == 0
    && (objc_msgSend(v124, "pbf_transitionFromIncomingFocusModeChange") & 1) == 0
    && [v143 isEqual:v137])
  {
    long long v92 = PBFLogDataStore();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v192 = v141;
      __int16 v193 = 2114;
      id v194 = v143;
      _os_log_impl(&dword_1D31CE000, v92, OS_LOG_TYPE_DEFAULT, "(%{public}@) will update focus mode for active poster change for role %{public}@", buf, 0x16u);
    }

    [(PBFPosterExtensionDataStore *)v142 _stateLock_updateFocusModeForActivePosterChange];
    long long v93 = PBFLogDataStore();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v192 = v141;
      __int16 v193 = 2114;
      id v194 = v143;
      _os_log_impl(&dword_1D31CE000, v93, OS_LOG_TYPE_DEFAULT, "(%{public}@) did update focus mode for active poster change for role %{public}@", buf, 0x16u);
    }
  }
  if (!(a7 & 1 | (([v143 isEqual:v137] & 1) == 0))
    && ([v140 isEqual] & 1) == 0
    && [v143 isEqual:v137]
    && ([v124 isInitialUpdate] & 1) == 0)
  {
    long long v94 = PBFLogDataStore();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v192 = v141;
      __int16 v193 = 2114;
      id v194 = v143;
      _os_log_impl(&dword_1D31CE000, v94, OS_LOG_TYPE_DEFAULT, "(%{public}@) will prewarm snapshots for role %{public}@", buf, 0x16u);
    }

    long long v95 = objc_opt_new();
    long long v96 = [v140 addedPosters];
    [v95 unionSet:v96];

    long long v97 = [v140 addedAssocPosters];
    [v95 unionSet:v97];

    id v98 = [v140 updatedPosters];
    [v95 unionSet:v98];

    id v99 = [v140 updatedAssocPosters];
    [v95 unionSet:v99];

    uint64_t v134 = +[PBFGenericDisplayContext mainScreenDisplayContextsForKnownOrientations];
    id v100 = v142->_snapshotManager;
    objc_initWeak((id *)buf, v142);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke;
    aBlock[3] = &unk_1E69812E8;
    objc_copyWeak(&v160, (id *)buf);
    id v114 = v100;
    long long v159 = v114;
    id v101 = (void (**)(void *, uint64_t, uint64_t, void *))_Block_copy(aBlock);
    id v102 = dispatch_group_create();
    dispatch_group_enter(v102);
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id obj = v95;
    uint64_t v103 = [obj countByEnumeratingWithState:&v154 objects:v185 count:16];
    if (v103)
    {
      uint64_t v132 = *(void *)v155;
      do
      {
        uint64_t v104 = 0;
        uint64_t v136 = v103;
        do
        {
          if (*(void *)v155 != v132) {
            objc_enumerationMutation(obj);
          }
          uint64_t v105 = *(void *)(*((void *)&v154 + 1) + 8 * v104);
          long long v150 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          long long v153 = 0u;
          id v144 = v134;
          uint64_t v106 = [v144 countByEnumeratingWithState:&v150 objects:v184 count:16];
          uint64_t v138 = v104;
          if (v106)
          {
            uint64_t v107 = *(void *)v151;
            do
            {
              for (iuint64_t i = 0; ii != v106; ++ii)
              {
                if (*(void *)v151 != v107) {
                  objc_enumerationMutation(v144);
                }
                uint64_t v109 = *(void *)(*((void *)&v150 + 1) + 8 * ii);
                dispatch_group_enter(v102);
                v148[0] = MEMORY[0x1E4F143A8];
                v148[1] = 3221225472;
                v148[2] = __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke_2;
                v148[3] = &unk_1E6981310;
                objc_copyWeak(&v149, (id *)buf);
                v148[4] = v105;
                v101[2](v101, v105, v109, v148);
                dispatch_group_leave(v102);
                objc_destroyWeak(&v149);
              }
              uint64_t v106 = [v144 countByEnumeratingWithState:&v150 objects:v184 count:16];
            }
            while (v106);
          }

          uint64_t v104 = v138 + 1;
        }
        while (v138 + 1 != v136);
        uint64_t v103 = [obj countByEnumeratingWithState:&v154 objects:v185 count:16];
      }
      while (v103);
    }

    dispatch_group_leave(v102);
    id v110 = [MEMORY[0x1E4F924D8] sharedWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke_3;
    block[3] = &unk_1E6981338;
    void block[4] = v142;
    id v146 = v141;
    id v147 = v143;
    dispatch_group_notify(v102, v110, block);

    objc_destroyWeak(&v160);
    objc_destroyWeak((id *)buf);
  }
  __int16 v111 = PBFLogDataStore();
  unint64_t v112 = v111;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v111))
  {
    *(_DWORD *)buf = 138544898;
    id v192 = v143;
    __int16 v193 = 2114;
    id v194 = v124;
    __int16 v195 = 1024;
    *(_DWORD *)v196 = v118;
    *(_WORD *)&v196[4] = 1024;
    *(_DWORD *)&v196[6] = v119;
    LOWORD(v197) = 1024;
    *(_DWORD *)((char *)&v197 + 2) = v116;
    HIWORD(v197) = 1024;
    *(_DWORD *)uint64_t v198 = v117 != 0;
    *(_WORD *)&v198[4] = 1024;
    *(_DWORD *)&v198[6] = v115 != 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v112, OS_SIGNPOST_INTERVAL_END, spid, "pushUpdateNotificationsForRole", "role: '%{public}@'; context:'%{public}@'; didUpdateSelectedConfiguration:'%{BOOL}u' didUpdateActiveConfiguration:'"
      "%{BOOL}u' configurationsWereUpdate:'%{BOOL}u' configurationsWereAdded:'%{BOOL}u' configurationsWereDeleted:'%{BOOL}u'",
      buf,
      0x34u);
  }

  id v14 = v124;
LABEL_176:
}

void __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v11 = [PBFPosterSnapshotRequest alloc];
    id v12 = +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions];
    id v13 = [(PBFPosterSnapshotRequest *)v11 initWithConfiguration:v7 definitions:v12 context:v8];

    id v14 = [(PBFPosterSnapshotRequest *)v13 requestWithIntention:1];
    id v15 = [v14 requestWithPowerLogReason:6];

    id v16 = *(void **)(a1 + 32);
    v18[0] = v15;
    BOOL v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v16 prewarmSnapshotsForRequests:v17 completion:v9];
  }
}

void __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2 && WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _notifyObserversDidUpdateSnapshotForConfiguration:*(void *)(a1 + 32)];
    id WeakRetained = v5;
  }
}

void __154__PBFPosterExtensionDataStore__stateLock_pushUpdateNotificationsForRole_diff_previouslyActiveConfiguration_newActiveConfiguration_options_reason_context___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _notifyObserversDidUpdateConfigurations];
  uint64_t v2 = PBFLogDataStore();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D31CE000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) did finish prewarming snapshots for role %{public}@; did additional push for updated configurations ("
      "because we've always done this, but its probably not needed)",
      (uint8_t *)&v5,
      0x16u);
  }
}

- (BOOL)_stateLock_processEvents:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() supportedRoles];
  LOBYTE(a5) = [(PBFPosterExtensionDataStore *)self _stateLock_processEvents:v9 roles:v10 context:v8 error:a5];

  return (char)a5;
}

- (BOOL)_stateLock_processEvents:(id)a3 roles:(id)a4 context:(id)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      BOOL v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    if (!v12)
    {
      id v12 = [(PBFPosterExtensionDataStore *)self _buildRoleCoordinatorTransitionContext];
    }
    id v35 = v10;
    id v14 = objc_msgSend(v12, "pbf_transitionContextIdentifier");
    id v15 = [v14 UUIDString];
    id v16 = [v15 substringToIndex:7];

    BOOL v17 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v34 = v11;
    id v18 = v11;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = -[NSDictionary objectForKeyedSubscript:](self->_roleToRoleCoordinator, "objectForKeyedSubscript:", *(void *)(*((void *)&v40 + 1) + 8 * i), v34);
          objc_msgSend(v17, "bs_safeAddObject:", v23);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v20);
    }

    uint64_t v24 = [[PBFPosterRoleProcessor alloc] initWithDataStorage:self->_database roleCoordinators:v17];
    [(PBFPosterRoleProcessor *)v24 addObserver:self];
    runtimeAssertionProvider = self->_runtimeAssertionProvider;
    id v26 = [@"processEvents-" stringByAppendingString:v16];
    uint64_t v27 = [MEMORY[0x1E4F96478] currentProcess];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __76__PBFPosterExtensionDataStore__stateLock_processEvents_roles_context_error___block_invoke;
    v38[3] = &unk_1E6980A00;
    id v39 = v16;
    id v28 = v16;
    uint64_t v29 = [(PBFRuntimeAssertionProviding *)runtimeAssertionProvider acquirePrewarmRuntimeAssertionForReason:v26 target:v27 invalidationHandler:v38];

    id v10 = v35;
    int v30 = [(PBFPosterRoleProcessor *)v24 processEvents:v35 context:v12 reason:@"processEvents" userInfo:0 error:a6];
    BOOL v13 = v30 != 0;
    uint64_t v31 = [NSString stringWithUTF8String:"-[PBFPosterExtensionDataStore _stateLock_processEvents:roles:context:error:]"];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __76__PBFPosterExtensionDataStore__stateLock_processEvents_roles_context_error___block_invoke_622;
    v36[3] = &unk_1E69808C0;
    id v37 = v29;
    id v32 = v29;
    PBFDispatchAsyncWithString(v31, QOS_CLASS_DEFAULT, v36);

    id v11 = v34;
  }

  return v13;
}

void __76__PBFPosterExtensionDataStore__stateLock_processEvents_roles_context_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PBFLogDataStore();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) PosterBoard runtime assertion invalidated: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __76__PBFPosterExtensionDataStore__stateLock_processEvents_roles_context_error___block_invoke_622(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_stateLock_initialRoleCoordinatorSetup
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

uint64_t __69__PBFPosterExtensionDataStore__stateLock_initialRoleCoordinatorSetup__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reapEverythingExceptLatestVersion];
}

- (id)_stateLock_switcherConfiguration
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v3 = PBFLogPosterContents();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t v9 = 0;
      _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "(_stateLock_switcherConfiguration...) Can't get switcher configuration: DataStore is invalidated.", v9, 2u);
    }

    uint64_t v4 = 0;
  }
  else
  {
    stateLock_switcherConfiguratiouint64_t n = self->_stateLock_switcherConfiguration;
    if (!stateLock_switcherConfiguration)
    {
      uint64_t v6 = [(PBFPosterExtensionDataStore *)self _stateLock_buildSwitcherConfigurationWithContext:0 outMutated:0];
      uint64_t v7 = self->_stateLock_switcherConfiguration;
      self->_stateLock_switcherConfiguratiouint64_t n = v6;

      stateLock_switcherConfiguratiouint64_t n = self->_stateLock_switcherConfiguration;
    }
    uint64_t v4 = stateLock_switcherConfiguration;
  }
  return v4;
}

- (id)_stateLock_buildSwitcherConfigurationWithContext:(id)a3 outMutated:(BOOL *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    uint64_t v7 = PBFLogPosterContents();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "(_stateLock_buildSwitcherConfigurationWithContext...) Can't build switcher configuration: DataStore is invalidated.", buf, 2u);
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F92790];
    uint64_t v10 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:*MEMORY[0x1E4F92790]];
    uint64_t v7 = v10;
    if (v10)
    {
      uint64_t v44 = a4;
      id v11 = [v10 posterCollection];
      id v12 = [v11 orderedPosters];
      BOOL v13 = objc_msgSend(v12, "bs_map:", &__block_literal_global_632);
      id v14 = [v13 array];

      long long v42 = v14;
      id v15 = objc_msgSend(v14, "bs_mapNoNulls:", &__block_literal_global_635);
      id v16 = [(PBFPosterExtensionDataStore *)self _stateLock_lastUseDatesForPosterCollection];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __91__PBFPosterExtensionDataStore__stateLock_buildSwitcherConfigurationWithContext_outMutated___block_invoke_3;
      v46[3] = &unk_1E69813A0;
      id v41 = v16;
      id v47 = v41;
      long long v43 = v15;
      uint64_t v17 = [v15 sortedArrayUsingComparator:v46];
      stateLock_switcherConfiguratiouint64_t n = self->_stateLock_switcherConfiguration;
      if (stateLock_switcherConfiguration) {
        [(PRSwitcherConfiguration *)stateLock_switcherConfiguration selectedConfiguration];
      }
      else {
      uint64_t v45 = [v11 selectedPoster];
      }
      uint64_t v19 = self->_stateLock_switcherConfiguration;
      if (v19) {
        [(PRSwitcherConfiguration *)v19 activeConfiguration];
      }
      else {
      uint64_t v20 = [(PBFPosterExtensionDataStore *)self activePosterConfigurationForRole:v9 assocPoster:0];
      }
      uint64_t v21 = [(PBFPosterExtensionDataStore *)self activePosterConfigurationForRole:v9 assocPoster:0];
      uint64_t v22 = (void *)v21;
      if (v21) {
        uint64_t v23 = (void *)v21;
      }
      else {
        uint64_t v23 = v20;
      }
      id v24 = v23;

      uint64_t v25 = [v11 selectedPoster];
      id v26 = PBFLogPosterContents();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v20;
        _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) currentActiveConfiguration: %{public}@", buf, 0xCu);
      }

      uint64_t v27 = PBFLogPosterContents();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v24;
        _os_log_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) activeConfiguration: %{public}@", buf, 0xCu);
      }

      id v28 = PBFLogPosterContents();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v25;
        _os_log_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) selectedConfiguration: %{public}@", buf, 0xCu);
      }

      if (!v25)
      {
        uint64_t v25 = [v11 fallbackSelectedForSortedConfigurations:v17 reverse:1];
        if (!v25)
        {
          uint64_t v29 = PBFLogPosterContents();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) No selected configuration, no configuration to fallback to. Get ready for a bumpy ride.", buf, 2u);
          }

          uint64_t v25 = 0;
        }
      }
      if (v6)
      {
        uint64_t v30 = [v7 determineActivePosterConfigurationForContext:v6];

        id v24 = (id)v30;
      }
      uint64_t v31 = (void *)v17;
      id v32 = PBFLogPosterContents();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v24;
        _os_log_impl(&dword_1D31CE000, v32, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) determined activeConfiguration: %{public}@", buf, 0xCu);
      }

      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F925F0]) _initWithCollection:v11 activeConfiguration:v24];
      objc_msgSend(v8, "setActiveConfigurationDueToIncomingFocusModeChange:", objc_msgSend(v6, "pbf_transitionFromIncomingFocusModeChange"));
      uint64_t v33 = PBFLogPosterContents();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = objc_msgSend(v6, "pbf_transitionFromIncomingFocusModeChange");
        id v35 = @"NO";
        if (v34) {
          id v35 = @"YES";
        }
        *(_DWORD *)buf = 138543618;
        id v49 = v8;
        __int16 v50 = 2112;
        long long v51 = v35;
        _os_log_impl(&dword_1D31CE000, v33, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) generated switcher configuration: %{public}@, transitionFromIncomingFocusModeChange: %@", buf, 0x16u);
      }

      id v36 = PBFLogPosterContents();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v15;
        _os_log_impl(&dword_1D31CE000, v36, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) posterConfigurations: %{public}@", buf, 0xCu);
      }

      id v37 = PBFLogPosterContents();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v24;
        _os_log_impl(&dword_1D31CE000, v37, OS_LOG_TYPE_DEFAULT, "(_buildSwitcherConfiguration...) activeConfiguration: %{public}@", buf, 0xCu);
      }

      if (v44)
      {
        uint64_t v38 = [v8 selectedConfiguration];
        char v39 = BSEqualObjects();

        if ((v39 & 1) == 0) {
          *uint64_t v44 = 1;
        }
      }
    }
    else
    {
      id v11 = PBFLogPosterContents();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[PBFPosterExtensionDataStore _stateLock_buildSwitcherConfigurationWithContext:outMutated:](v11);
      }
      uint64_t v8 = 0;
    }
  }
  return v8;
}

uint64_t __91__PBFPosterExtensionDataStore__stateLock_buildSwitcherConfigurationWithContext_outMutated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _path];
}

id __91__PBFPosterExtensionDataStore__stateLock_buildSwitcherConfigurationWithContext_outMutated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F92638];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] _initWithPath:v3];

  return v4;
}

uint64_t __91__PBFPosterExtensionDataStore__stateLock_buildSwitcherConfigurationWithContext_outMutated___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 _path];
  uint64_t v8 = [v7 serverIdentity];
  uint64_t v9 = [v8 posterUUID];
  uint64_t v10 = [v5 objectForKey:v9];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  BOOL v13 = v12;

  id v14 = *(void **)(a1 + 32);
  id v15 = [v6 _path];

  id v16 = [v15 serverIdentity];
  uint64_t v17 = [v16 posterUUID];
  id v18 = [v14 objectForKey:v17];
  uint64_t v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  uint64_t v21 = v20;

  uint64_t v22 = [v13 compare:v21];
  return v22;
}

- (void)fetchGalleryConfigurationWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (void)enqueueGalleryConfigurationUpdateWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 completion:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = PBFLogGallery();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446210;
    id v11 = "-[PBFPosterExtensionDataStore enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:]";
    _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}s) Queuing up a new gallery update...", (uint8_t *)&v10, 0xCu);
  }

  [(PBFGalleryController *)self->_galleryController enqueueGalleryConfigurationUpdateWithOptions:a3 powerLogReason:a4 completion:v8];
}

- (void)checkForGalleryUpdatesAndPrewarmSnapshots
{
  id v3 = +[PBFGenericDisplayContext mainScreen];
  uint64_t v4 = PBFLogDataStore();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PBFPosterExtensionDataStore_checkForGalleryUpdatesAndPrewarmSnapshots__block_invoke;
  v7[3] = &unk_1E69806F8;
  id v8 = v3;
  os_signpost_id_t v9 = v5;
  void v7[4] = self;
  id v6 = v3;
  PBFDispatchAsyncWithString(@"checkForGalleryUpdates", QOS_CLASS_USER_INITIATED, v7);
}

void __72__PBFPosterExtensionDataStore_checkForGalleryUpdatesAndPrewarmSnapshots__block_invoke(uint64_t a1)
{
  void v62[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PBFLogDataStore();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "checkForGalleryUpdatesAndPrewarmSnapshots:", "", buf, 2u);
  }

  os_signpost_id_t v5 = *(void **)(a1 + 32);
  v62[0] = @"PBFDataComponentGallery";
  v62[1] = @"PBFDataComponentStaticDescriptors";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  uint64_t v7 = [v5 dataFreshnessForComponents:v6];

  int v8 = [v7 isFresh];
  os_signpost_id_t v9 = *(id **)(a1 + 32);
  if (v8)
  {
    int v10 = [v9 currentGalleryConfiguration];
    [v10 prewarmGallerySnapshotsWithCompletion:0];

    id v11 = PBFLogDataStore();
    uint64_t v12 = v11;
    os_signpost_id_t v13 = *(void *)(a1 + 48);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
LABEL_44:
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v12, OS_SIGNPOST_INTERVAL_END, v13, "checkForGalleryUpdatesAndPrewarmSnapshots:", "", buf, 2u);
      goto LABEL_45;
    }
    goto LABEL_45;
  }
  id v14 = [v9[11] currentGalleryConfiguration];

  if (!v14)
  {
    id v15 = PBFLogGallery();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v61 = "-[PBFPosterExtensionDataStore checkForGalleryUpdatesAndPrewarmSnapshots]_block_invoke";
      _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}s) No gallery found; queuing up a new gallery update...",
        buf,
        0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 88) enqueueGalleryConfigurationUpdateWithOptions:2 powerLogReason:0 completion:0];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 188));
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(v16 + 120);
  os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 188));
  if (v17)
  {
    long long v51 = v7;
    id v18 = [*(id *)(a1 + 32) currentGalleryConfiguration];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v19 = [v18 sectionIdentifiers];
    id v20 = [v19 firstObject];
    __int16 v50 = v18;
    uint64_t v21 = [v18 itemsForSectionWithIdentifier:v20];

    id obj = v21;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (!v22) {
      goto LABEL_40;
    }
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v56;
    uint64_t v52 = *(void *)v56;
    uint64_t v53 = a1;
    while (1)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v56 != v24) {
          objc_enumerationMutation(obj);
        }
        id v26 = [*(id *)(*((void *)&v55 + 1) + 8 * i) posterDescriptorLookupInfo];
        uint64_t v27 = [v26 posterDescriptorPath];
        id v28 = [v27 identity];
        uint64_t v29 = [v28 type];

        if (v29 != 3)
        {
          uint64_t v30 = [v26 posterDescriptorExtension];
          uint64_t v31 = [v27 descriptorIdentifier];
          id v32 = (void *)v31;
          if (v27) {
            BOOL v33 = v30 == 0;
          }
          else {
            BOOL v33 = 1;
          }
          if (!v33 && v31 != 0)
          {
            id v35 = objc_msgSend(MEMORY[0x1E4FB1818], "pbf_galleryHeroSnapshotForExtension:descriptorIdentifier:displayContext:", v30, v31, *(void *)(a1 + 40));

            if (!v35)
            {
              id v36 = [v27 identity];
              uint64_t v37 = [v36 type];

              if (v37 == 2)
              {
                uint64_t v38 = [v30 posterExtensionInfoPlist];
                char v39 = objc_msgSend(v38, "pbf_posterBoardPosterDescriptorHeroGalleryOptionsForStaticDescriptorIdentifier:", v32);
                goto LABEL_35;
              }
              long long v40 = [v27 identity];
              uint64_t v41 = [v40 type];

              if (v41 == 1)
              {
                uint64_t v38 = [MEMORY[0x1E4F926A8] modelObjectCacheForPath:v27];
                long long v42 = [v38 galleryOptions];
                long long v43 = v42;
                if (v42)
                {
                  id v44 = v42;
                }
                else
                {
                  id v44 = [MEMORY[0x1E4F926B0] loadPosterDescriptorGalleryOptionsForPath:v27 error:0];
                }
                char v39 = v44;

LABEL_35:
              }
              else
              {
                char v39 = 0;
              }
              uint64_t v45 = [v39 galleryAssetLookupInfo];
              uint64_t v46 = [v30 posterExtensionBundle];
              a1 = v53;
              id v47 = (id)objc_msgSend(v45, "pbf_imageFromBundle:displayContext:error:", v46, *(void *)(v53 + 40), 0);

              uint64_t v24 = v52;
            }
          }
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (!v23)
      {
LABEL_40:

        uint64_t v48 = [*(id *)(a1 + 32) currentGalleryConfiguration];
        [v48 prewarmGallerySnapshotsWithCompletion:0];

        uint64_t v7 = v51;
        break;
      }
    }
  }
  id v49 = PBFLogDataStore();
  uint64_t v12 = v49;
  os_signpost_id_t v13 = *(void *)(a1 + 48);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    *(_WORD *)buf = 0;
    goto LABEL_44;
  }
LABEL_45:
}

- (void)pushToProactiveWithCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PBFPosterExtensionDataStore_pushToProactiveWithCompletion___block_invoke;
  v6[3] = &unk_1E69813C8;
  id v7 = v4;
  id v5 = v4;
  [(PBFPosterExtensionDataStore *)self _stateLock_pushPosterDescriptorsToProactiveForReason:@"DataStore XPC call" force:1 completion:v6];
  os_unfair_lock_unlock(&self->_stateLock);
}

uint64_t __61__PBFPosterExtensionDataStore_pushToProactiveWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)pushPosterDescriptorsToProactiveForReason:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (__CFString *)a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (v7) {
    int v8 = v7;
  }
  else {
    int v8 = @"(No reason given)";
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PBFPosterExtensionDataStore_pushPosterDescriptorsToProactiveForReason_completion___block_invoke;
  v10[3] = &unk_1E69813C8;
  id v11 = v6;
  id v9 = v6;
  [(PBFPosterExtensionDataStore *)self _stateLock_pushPosterDescriptorsToProactiveForReason:v8 force:1 completion:v10];

  os_unfair_lock_unlock(&self->_stateLock);
}

uint64_t __84__PBFPosterExtensionDataStore_pushPosterDescriptorsToProactiveForReason_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)fetchPosterSuggestionsForFocusModeWithUUID:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = (objc_class *)MEMORY[0x1E4F4B048];
  id v11 = a3;
  id v12 = [v10 alloc];
  if ([v11 length]) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = 6;
  }
  id v14 = (void *)[v12 initWithType:v13 uuid:v11];

  id v15 = [(PBFPosterExtensionDataStore *)self currentGalleryConfiguration];
  uint64_t v16 = self->_snapshotManager;
  uint64_t v17 = [MEMORY[0x1E4F4B040] sharedInstance];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke;
  void v22[3] = &unk_1E6981440;
  id v26 = self;
  id v27 = v9;
  id v23 = v15;
  id v24 = v8;
  uint64_t v25 = v16;
  id v18 = v16;
  id v19 = v8;
  id v20 = v15;
  id v21 = v9;
  [v17 fetchFaceSuggestionsForFocusMode:v14 completion:v22];
}

void __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (!a2 || a3)
  {
    id v32 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v32();
  }
  else
  {
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    void v57[2] = __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_2;
    void v57[3] = &unk_1E69813F0;
    id v58 = *(id *)(a1 + 32);
    id v5 = objc_msgSend(a2, "bs_mapNoNulls:", v57);
    id v6 = objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v54 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = +[PBFPosterSnapshotRequest snapshotRequestForPreview:*(void *)(*((void *)&v53 + 1) + 8 * i) context:*(void *)(a1 + 40)];
          uint64_t v13 = [v12 requestWithPowerLogReason:0];

          [v6 addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v9);
    }
    BOOL v33 = v6;

    id v36 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v7;
    uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
    if (v37)
    {
      uint64_t v35 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v50 != v35) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          dispatch_group_enter(group);
          uint64_t v16 = objc_msgSend(v15, "posterDescriptorLookupInfo", v33);
          char v39 = [v16 posterDescriptorPath];

          uint64_t v17 = [v15 posterDescriptorLookupInfo];
          id v18 = [v17 posterDescriptorExtension];
          uint64_t v38 = [v18 posterExtensionBundleIdentifier];

          id v19 = objc_msgSend(MEMORY[0x1E4F92640], "pbf_configuredPropertiesForPreview:", v15);
          id v20 = +[PBFPosterSnapshotDefinition gallerySnapshotDefinition];
          id v21 = [PBFPosterSnapshotRequest alloc];
          uint64_t v59 = v20;
          uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
          id v23 = [(PBFPosterSnapshotRequest *)v21 initWithPath:v39 provider:v38 configuredProperties:v19 definitions:v22 context:*(void *)(a1 + 40)];

          id v24 = [v15 previewUniqueIdentifier];
          uint64_t v25 = [(PBFPosterSnapshotRequest *)v23 requestWithPreviewIdentifier:v24];
          id v26 = [v25 requestWithLoadFromCacheIfAvailable:0];
          id v27 = [v26 requestWithPowerLogReason:0];

          id v28 = *(void **)(a1 + 48);
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          void v45[2] = __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_3;
          v45[3] = &unk_1E6981418;
          id v46 = v36;
          id v47 = v15;
          uint64_t v48 = group;
          [v28 fetchPosterSnapshotForRequest:v27 definition:v20 completion:v45];
        }
        uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
      }
      while (v37);
    }

    dispatch_group_leave(group);
    uint64_t v29 = *(NSObject **)(*(void *)(a1 + 56) + 200);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_652;
    block[3] = &unk_1E69811F8;
    id v42 = obj;
    id v43 = v36;
    id v44 = *(id *)(a1 + 64);
    id v30 = v36;
    id v31 = obj;
    dispatch_group_notify(group, v29, block);
  }
}

id __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 posterBoardRepresentation];
  id v4 = [v2 previewForItem:v3 section:0];

  return v4;
}

void __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PBFLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_3_cold_1();
    }
  }
  if (v5)
  {
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    [*(id *)(a1 + 32) setObject:v5 forKey:*(void *)(a1 + 40)];
    objc_sync_exit(v8);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_652(void *a1)
{
  uint64_t v2 = [[PBFFocusPosterSuggestionData alloc] initWithPreviews:a1[4] previewsToSnapshotsMapTable:a1[5]];
  (*(void (**)(void))(a1[6] + 16))();
}

- (PBFGalleryConfiguration)currentGalleryConfiguration
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v3 = 0;
  }
  else
  {
    p_stateLocuint64_t k = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    id v3 = [(PBFPosterExtensionDataStore *)self _stateLock_currentGalleryConfiguration];
    os_unfair_lock_unlock(p_stateLock);
  }
  return (PBFGalleryConfiguration *)v3;
}

- (id)_stateLock_currentGalleryConfiguration
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = self->_stateLock_configuration;
    if (!v3)
    {
      if (!self->_stateLock_suggestedLayout)
      {
        id v4 = [(PBFGalleryController *)self->_galleryController currentGalleryConfiguration];
        [(PBFPosterExtensionDataStore *)self _stateLock_updateGalleryWithSuggestedLayout:v4 descriptorsByExtensionBundleIdentifier:0 staticDescriptorsByExtensionBundleIdentifier:0];
      }
      id v3 = self->_stateLock_configuration;
    }
  }
  return v3;
}

- (void)fetchCurrentGalleryConfiguration:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = NSStringFromSelector(a2);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__PBFPosterExtensionDataStore_fetchCurrentGalleryConfiguration___block_invoke;
    v7[3] = &unk_1E6981220;
    void v7[4] = self;
    id v8 = v5;
    PBFDispatchAsyncWithString(v6, QOS_CLASS_USER_INITIATED, v7);
  }
}

void __64__PBFPosterExtensionDataStore_fetchCurrentGalleryConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) currentGalleryConfiguration];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)galleryController:(id)a3 didUpdateCurrentGalleryConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__PBFPosterExtensionDataStore_galleryController_didUpdateCurrentGalleryConfiguration___block_invoke;
    v7[3] = &unk_1E69808E8;
    void v7[4] = self;
    id v8 = v5;
    PBFDispatchAsyncWithString(@"galleryController:didUpdateCurrentGalleryConfiguration:", QOS_CLASS_DEFAULT, v7);
  }
}

void __86__PBFPosterExtensionDataStore_galleryController_didUpdateCurrentGalleryConfiguration___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 188));
  objc_msgSend(*(id *)(a1 + 32), "_stateLock_updateGalleryWithSuggestedLayout:descriptorsByExtensionBundleIdentifier:staticDescriptorsByExtensionBundleIdentifier:", *(void *)(a1 + 40), 0, 0);
  id v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 188);
  os_unfair_lock_unlock(v2);
}

- (void)snapshotManager:(id)a3 didUpdateSnapshotForPath:(id)a4 forDefinition:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PBFPosterExtensionDataStore_snapshotManager_didUpdateSnapshotForPath_forDefinition___block_invoke;
  block[3] = &unk_1E6981338;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(notificationQueue, block);
}

void __86__PBFPosterExtensionDataStore_snapshotManager_didUpdateSnapshotForPath_forDefinition___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1[4] + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(a1[4] + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateSnapshotForPath:forDefinition:", a1[4], a1[5], a1[6], (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)assertionProviderDidRelinquishInUseAssertion:(id)a3
{
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    [(PBFPosterExtensionDataStore *)self enumerateExtensionStoreCoordinators:&__block_literal_global_661];
    uint64_t v4 = PBFLogDataStore();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "Relinquished in use assertion", v5, 2u);
    }

    [(PFPosterExtensionProvider *)self->_extensionProvider cancel];
  }
}

uint64_t __76__PBFPosterExtensionDataStore_assertionProviderDidRelinquishInUseAssertion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 purgeSnapshotCache];
}

- (void)assertionProviderDidAcquireInUseAssertion:(id)a3
{
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    uint64_t v4 = PBFLogDataStore();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "Acquired in use assertion", v5, 2u);
    }

    [(PFPosterExtensionProvider *)self->_extensionProvider start];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__PBFPosterExtensionDataStore_addObserver___block_invoke;
  v7[3] = &unk_1E69808E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

uint64_t __43__PBFPosterExtensionDataStore_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 216) getFlag];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 96);
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 96);
      *(void *)(v5 + 96) = v4;

      uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 96);
    }
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 addObject:v7];
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PBFPosterExtensionDataStore_removeObserver___block_invoke;
  v7[3] = &unk_1E69808E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

uint64_t __46__PBFPosterExtensionDataStore_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 216) getFlag];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 96);
    return [v4 removeObject:v3];
  }
  return result;
}

- (void)_notifyObserversDidUpdateExtensions
{
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PBFPosterExtensionDataStore__notifyObserversDidUpdateExtensions__block_invoke;
  block[3] = &unk_1E69808C0;
  void block[4] = self;
  dispatch_async(notificationQueue, block);
}

void __66__PBFPosterExtensionDataStore__notifyObserversDidUpdateExtensions__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStoreDidUpdateExtensions:", *(void *)(a1 + 32), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidInitializeWithSwitcherConfiguration:(id)a3 withChanges:(BOOL)a4
{
  id v6 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PBFPosterExtensionDataStore__notifyObserversDidInitializeWithSwitcherConfiguration_withChanges___block_invoke;
  block[3] = &unk_1E6981468;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(notificationQueue, block);
}

void __98__PBFPosterExtensionDataStore__notifyObserversDidInitializeWithSwitcherConfiguration_withChanges___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didInitializeWithSwitcherConfiguration:withChanges:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidInitializeRoles:(id)a3 roleToPosterCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PBFPosterExtensionDataStore__notifyObserversDidInitializeRoles_roleToPosterCollection___block_invoke;
  block[3] = &unk_1E6981338;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(notificationQueue, block);
}

void __89__PBFPosterExtensionDataStore__notifyObserversDidInitializeRoles_roleToPosterCollection___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1[4] + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(a1[4] + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didInitializeActivePosters:posterCollections:", a1[4], a1[5], a1[6], (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidUpdateActivePosterForRoles:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PBFPosterExtensionDataStore__notifyObserversDidUpdateActivePosterForRoles___block_invoke;
  v7[3] = &unk_1E69808E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __77__PBFPosterExtensionDataStore__notifyObserversDidUpdateActivePosterForRoles___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:activePostersWereUpdatedForRoles:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidUpdatePosterCollectionsForRoles:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PBFPosterExtensionDataStore__notifyObserversDidUpdatePosterCollectionsForRoles___block_invoke;
  v7[3] = &unk_1E69808E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __82__PBFPosterExtensionDataStore__notifyObserversDidUpdatePosterCollectionsForRoles___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:posterCollectionsWereUpdatedForRoles:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidUpdateSwitcherConfiguration:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PBFPosterExtensionDataStore__notifyObserversDidUpdateSwitcherConfiguration___block_invoke;
  v7[3] = &unk_1E69808E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __78__PBFPosterExtensionDataStore__notifyObserversDidUpdateSwitcherConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateSwitcherConfiguration:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidUpdateGalleryConfiguration:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PBFPosterExtensionDataStore__notifyObserversDidUpdateGalleryConfiguration___block_invoke;
  v7[3] = &unk_1E69808E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __77__PBFPosterExtensionDataStore__notifyObserversDidUpdateGalleryConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateGalleryConfiguration:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidUpdatePosterDescriptorsForExtensionBundleIdentifier:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __102__PBFPosterExtensionDataStore__notifyObserversDidUpdatePosterDescriptorsForExtensionBundleIdentifier___block_invoke;
  v7[3] = &unk_1E69808E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __102__PBFPosterExtensionDataStore__notifyObserversDidUpdatePosterDescriptorsForExtensionBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didUpdatePosterDescriptorsForExtensionBundleIdentifier:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidUpdateConfigurations
{
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfigurations__block_invoke;
  block[3] = &unk_1E69808C0;
  void block[4] = self;
  dispatch_async(notificationQueue, block);
}

void __70__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfigurations__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStoreDidUpdateConfigurations:", *(void *)(a1 + 32), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidUpdateConfiguration:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfiguration___block_invoke;
  v7[3] = &unk_1E69808E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __70__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateConfiguration:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidAddConfiguration:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PBFPosterExtensionDataStore__notifyObserversDidAddConfiguration___block_invoke;
  v7[3] = &unk_1E69808E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __67__PBFPosterExtensionDataStore__notifyObserversDidAddConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didAddConfiguration:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidDeleteConfiguration:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PBFPosterExtensionDataStore__notifyObserversDidDeleteConfiguration___block_invoke;
  v7[3] = &unk_1E69808E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __70__PBFPosterExtensionDataStore__notifyObserversDidDeleteConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didDeleteConfiguration:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidUpdateSelectedConfiguration:(id)a3 associatedConfiguration:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  notificationQueue = self->_notificationQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __109__PBFPosterExtensionDataStore__notifyObserversDidUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke;
  v15[3] = &unk_1E6981490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(notificationQueue, v15);
}

void __109__PBFPosterExtensionDataStore__notifyObserversDidUpdateSelectedConfiguration_associatedConfiguration_reason___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1[4] + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(a1[4] + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateSelectedConfiguration:associatedConfiguration:reason:", a1[4], a1[5], a1[6], a1[7], (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidUpdateActiveConfiguration:(id)a3 associatedConfiguration:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  notificationQueue = self->_notificationQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __107__PBFPosterExtensionDataStore__notifyObserversDidUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke;
  v15[3] = &unk_1E6981490;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(notificationQueue, v15);
}

void __107__PBFPosterExtensionDataStore__notifyObserversDidUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1[4] + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(a1[4] + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateActiveConfiguration:associatedConfiguration:reason:", a1[4], a1[5], a1[6], a1[7], (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidUpdateConfiguration:(id)a3 homeScreenAssociatedConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfiguration_homeScreenAssociatedConfiguration___block_invoke;
  block[3] = &unk_1E6981338;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(notificationQueue, block);
}

void __104__PBFPosterExtensionDataStore__notifyObserversDidUpdateConfiguration_homeScreenAssociatedConfiguration___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1[4] + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(a1[4] + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:posterConfiguration:didUpdateAssociatedHomeScreenPosterConfigurationTo:", a1[4], a1[5], a1[6], (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_notifyObserversDidUpdateSnapshotForConfiguration:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__PBFPosterExtensionDataStore__notifyObserversDidUpdateSnapshotForConfiguration___block_invoke;
  v7[3] = &unk_1E69808E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __81__PBFPosterExtensionDataStore__notifyObserversDidUpdateSnapshotForConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 216) getFlag] & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "posterExtensionDataStore:didUpdateSnapshotForConfiguration:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (id)posterWithUUID:(id)a3 error:(id *)a4
{
  p_stateLocuint64_t k = &self->_stateLock;
  id v7 = a3;
  os_unfair_lock_lock(p_stateLock);
  long long v8 = [(PBFPosterExtensionDataStore *)self _stateLock_posterWithUUID:v7 error:a4];

  os_unfair_lock_unlock(p_stateLock);
  return v8;
}

- (id)_stateLock_posterWithUUID:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    uint64_t v6 = 0;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [(NSDictionary *)self->_roleToRoleCoordinator objectEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * v11) posterCollection];
        uint64_t v6 = [v12 posterWithUUID:v5];

        if (v6) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (void)updateSnapshotsForGallery:(id)a3 intention:(unint64_t)a4 powerLogReason:(int64_t)a5 completion:(id)a6
{
  id v18 = self;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v19 = a6;
  uint64_t v9 = objc_opt_new();
  +[PBFGenericDisplayContext mainScreenDisplayContextsForKnownOrientations];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = objc_msgSend(v22, "posterSnapshotRequestsForContext:", *(void *)(*((void *)&v28 + 1) + 8 * v10), v18);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v25;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = [*(id *)(*((void *)&v24 + 1) + 8 * v15) requestWithIntention:a4];
              long long v17 = [v16 requestWithPowerLogReason:a5];
              [v9 addObject:v17];

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v13);
        }

        ++v10;
      }
      while (v10 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }
  -[PBFPosterSnapshotManager prewarmSnapshotsForRequests:completion:](v18->_snapshotManager, "prewarmSnapshotsForRequests:completion:", v9, v19, v18);
}

- (void)_stateLock_updateExtensions:(id)a3 refreshDescriptors:(int64_t)a4 powerLogReason:(int64_t)a5 galleryUpdateOptions:(unint64_t)a6 queuedUpOperations:(id *)a7
{
  uint64_t v316 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    v212 = v10;
    BOOL stateLock_initialRoleCoordinatorSetupPerformed = self->_stateLock_initialRoleCoordinatorSetupPerformed;
    uint64_t v11 = PBFLogPosterContents();
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    uint64_t v13 = PBFLogPosterContents();
    uint64_t v14 = v13;
    os_signpost_id_t spid = v12;
    unint64_t v208 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "updateExtensions", "", buf, 2u);
    }

    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    long long v16 = NSString;
    v210 = v15;
    long long v17 = [v15 UUIDString];
    id v18 = [v17 substringToIndex:7];
    v243 = [v16 stringWithFormat:@"updateExtensions/%@", v18];

    -[BSAtomicFlag setFlag:](self->_extensionsInputIsValidAtomicFlag, "setFlag:", [v212 count] != 0);
    uint64_t v19 = [v212 count];
    id v20 = PBFLogPosterContents();
    uint64_t v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        long long v299 = v243;
        __int16 v300 = 2112;
        *(void *)id v301 = v212;
        _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@) PosterBoard extensions updated %@", buf, 0x16u);
      }

      runtimeAssertionProvider = self->_runtimeAssertionProvider;
      uint64_t v23 = [MEMORY[0x1E4F96478] currentProcess];
      uint64_t v211 = [(PBFRuntimeAssertionProviding *)runtimeAssertionProvider acquirePosterUpdateRuntimeAssertionForReason:@"updateExtensions" target:v23];

      id v24 = v212;
      stateLock_fromExtensions = self->_stateLock_fromExtensions;
      if (stateLock_fromExtensions)
      {
        long long v26 = stateLock_fromExtensions;
      }
      else
      {
        long long v26 = [MEMORY[0x1E4F1CAD0] set];
      }
      long long v27 = (NSSet *)[v24 copy];
      long long v28 = self->_stateLock_fromExtensions;
      self->_stateLock_fromExtensions = v27;

      val = self;
      v202 = a7;
      id v203 = (void *)a6;
      if ((PBFCurrentDeviceClassSupported() & 1) == 0)
      {
        uint64_t v29 = [(NSSet *)v26 bs_filter:&__block_literal_global_702];

        uint64_t v30 = objc_msgSend(v24, "bs_filter:", &__block_literal_global_707);

        long long v26 = (NSSet *)v29;
        id v24 = (id)v30;
      }
      uint64_t v240 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      long long v293 = 0u;
      long long v294 = 0u;
      long long v295 = 0u;
      long long v296 = 0u;
      id v31 = v24;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v293 objects:v315 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v294;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v294 != v34) {
              objc_enumerationMutation(v31);
            }
            id v36 = *(void **)(*((void *)&v293 + 1) + 8 * i);
            uint64_t v37 = [v36 posterExtensionBundleIdentifier];
            [v240 setObject:v36 forKey:v37];

            uint64_t v38 = PBFLogPosterContents();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              long long v299 = v243;
              __int16 v300 = 2114;
              *(void *)id v301 = v36;
              _os_log_impl(&dword_1D31CE000, v38, OS_LOG_TYPE_DEFAULT, "(%{public}@) Extension: %{public}@", buf, 0x16u);
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v293 objects:v315 count:16];
        }
        while (v33);
      }

      char v39 = PBFLogDataStore();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v299 = v243;
        _os_log_impl(&dword_1D31CE000, v39, OS_LOG_TYPE_DEFAULT, "(%{public}@) Starting _updateExtensions", buf, 0xCu);
      }

      long long v40 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"posterExtensionBundleIdentifier" ascending:1];
      v314 = v40;
      uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v314 count:1];

      id v42 = [v31 allObjects];
      id v43 = [v42 sortedArrayUsingDescriptors:v41];

      id v44 = [(NSSet *)v26 allObjects];
      uint64_t v204 = (void *)v41;
      uint64_t v45 = [v44 sortedArrayUsingDescriptors:v41];

      v219 = objc_opt_new();
      v218 = objc_opt_new();
      v230 = objc_opt_new();
      id v234 = v43;
      v206 = (void *)v45;
      id v46 = [v43 differenceFromArray:v45 withOptions:0 usingEquivalenceTest:&__block_literal_global_718];
      v228 = v31;
      v207 = v46;
      if ([v46 hasChanges])
      {
        v235 = v26;
        long long v291 = 0u;
        long long v292 = 0u;
        long long v289 = 0u;
        long long v290 = 0u;
        id v47 = [v46 removals];
        uint64_t v48 = [v47 countByEnumeratingWithState:&v289 objects:v313 count:16];
        BOOL v220 = v48 != 0;
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v290;
          do
          {
            for (uint64_t j = 0; j != v49; ++j)
            {
              if (*(void *)v290 != v50) {
                objc_enumerationMutation(v47);
              }
              long long v52 = *(void **)(*((void *)&v289 + 1) + 8 * j);
              long long v53 = [v52 object];
              long long v54 = [v53 posterExtensionBundleIdentifier];

              long long v55 = [v52 object];
              id v288 = 0;
              BOOL v56 = [(PBFPosterExtensionDataStore *)val _stateLock_cleanupAfterDeletedExtension:v55 error:&v288];
              long long v57 = (__CFString *)v288;

              id v58 = PBFLogDataStore();
              uint64_t v59 = v58;
              if (v56)
              {
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  long long v299 = v243;
                  __int16 v300 = 2114;
                  *(void *)id v301 = v54;
                  _os_log_impl(&dword_1D31CE000, v59, OS_LOG_TYPE_DEFAULT, "(%{public}@) Successfully cleaned up environment for extension '%{public}@'", buf, 0x16u);
                }
              }
              else if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                long long v299 = v243;
                __int16 v300 = 2114;
                *(void *)id v301 = v54;
                *(_WORD *)&v301[8] = 2114;
                id v302 = v57;
                _os_log_error_impl(&dword_1D31CE000, v59, OS_LOG_TYPE_ERROR, "(%{public}@) Error cleanup up environment for extension '%{public}@': %{public}@", buf, 0x20u);
              }

              [v240 removeObjectForKey:v54];
              uint64_t v60 = [v52 object];
              [v230 addObject:v60];

              uint64_t v61 = PBFLogDataStore();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                id v62 = [v52 object];
                *(_DWORD *)buf = 138543618;
                long long v299 = v243;
                __int16 v300 = 2114;
                *(void *)id v301 = v62;
                _os_log_impl(&dword_1D31CE000, v61, OS_LOG_TYPE_DEFAULT, "(%{public}@) _updateExtensions is removing: %{public}@", buf, 0x16u);
              }
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v289 objects:v313 count:16];
          }
          while (v49);
        }

        long long v286 = 0u;
        long long v287 = 0u;
        long long v284 = 0u;
        long long v285 = 0u;
        uint64_t v63 = [v207 insertions];
        uint64_t v64 = [v63 countByEnumeratingWithState:&v284 objects:v312 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v285;
          do
          {
            for (uint64_t k = 0; k != v65; ++k)
            {
              if (*(void *)v285 != v66) {
                objc_enumerationMutation(v63);
              }
              uint64_t v68 = [*(id *)(*((void *)&v284 + 1) + 8 * k) object];
              id v283 = 0;
              BOOL v69 = [(PBFPosterExtensionDataStore *)val _stateLock_setupEnvironmentForExtension:v68 wasUpdated:0 error:&v283];
              id v70 = v283;
              if (v69)
              {
                id v71 = PBFLogPosterContents();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  long long v299 = v243;
                  __int16 v300 = 2112;
                  *(void *)id v301 = v68;
                  _os_log_impl(&dword_1D31CE000, v71, OS_LOG_TYPE_DEFAULT, "(%{public}@) _updateExtensions is adding: %@", buf, 0x16u);
                }

                [v219 addObject:v68];
              }
              else
              {
                id v72 = PBFLogDataStore();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  long long v299 = v243;
                  __int16 v300 = 2114;
                  *(void *)id v301 = v70;
                  _os_log_error_impl(&dword_1D31CE000, v72, OS_LOG_TYPE_ERROR, "(%{public}@) Error setting up environment for extension: %{public}@", buf, 0x16u);
                }
              }
            }
            uint64_t v65 = [v63 countByEnumeratingWithState:&v284 objects:v312 count:16];
          }
          while (v65);
          BOOL v220 = 1;
        }

        id v73 = PBFLogDataStore();
        uint64_t v74 = val;
        long long v26 = v235;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          long long v299 = v243;
          _os_log_impl(&dword_1D31CE000, v73, OS_LOG_TYPE_DEFAULT, "(%{public}@) _updateExtensions had insertions/deletions!", buf, 0xCu);
        }
      }
      else
      {
        BOOL v220 = 0;
        uint64_t v74 = self;
      }
      long long v281 = 0u;
      long long v282 = 0u;
      long long v279 = 0u;
      long long v280 = 0u;
      id obj = v26;
      uint64_t v238 = [(NSSet *)obj countByEnumeratingWithState:&v279 objects:v311 count:16];
      if (v238)
      {
        uint64_t v236 = *(void *)v280;
        do
        {
          for (uint64_t m = 0; m != v238; ++m)
          {
            if (*(void *)v280 != v236) {
              objc_enumerationMutation(obj);
            }
            id v76 = *(__CFString **)(*((void *)&v279 + 1) + 8 * m);
            id v77 = [(__CFString *)v76 posterExtensionBundleIdentifier];
            v277[0] = MEMORY[0x1E4F143A8];
            v277[1] = 3221225472;
            v277[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_719;
            v277[3] = &unk_1E6980DF8;
            id v78 = v77;
            id v278 = v78;
            id v79 = objc_msgSend(v234, "bs_firstObjectPassingTest:", v277);
            id v80 = [(PBFPosterExtensionDataStore *)v74 _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:v78];
            uint64_t v81 = [v80 providerInfoObjectForKey:@"StaticPersistentIdentifier"];
            uint64_t v241 = [v80 providerInfoObjectForKey:@"PersistentIdentifier"];
            uint64_t v82 = [v79 persistentIdentifier];
            uint64_t v83 = [v79 posterExtensionInfoPlist];
            id v84 = objc_msgSend(v83, "pbf_staticDescriptorIdentifiers");
            if ([v84 count]) {
              BOOL v85 = _LSPersistentIdentifierCompare() == 0;
            }
            else {
              BOOL v85 = 0;
            }

            id v86 = [v79 posterExtensionInfoPlist];
            BOOL v87 = objc_msgSend(v86, "pbf_supportsDynamicDescriptors")
               && objc_msgSend(v79, "pbf_supportsGalleryOrUserDefaultsHasItOverriddenToSupportGallery:", 0)&& _LSPersistentIdentifierCompare() == 0;

            int v88 = [v79 isEqual:v76];
            if (v85 || v87 || !v88)
            {
              id v276 = 0;
              BOOL v89 = [(PBFPosterExtensionDataStore *)val _stateLock_updateEnvironmentForExtension:v79 fromExtension:v76 error:&v276];
              int v90 = (__CFString *)v276;
              if (v89)
              {
                [v218 addObject:v79];
                long long v91 = PBFLogDataStore();
                if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  long long v299 = v243;
                  __int16 v300 = 2114;
                  *(void *)id v301 = v78;
                  *(_WORD *)&v301[8] = 2114;
                  id v302 = v90;
                  _os_log_impl(&dword_1D31CE000, v91, OS_LOG_TYPE_DEFAULT, "(%@) Successfuly updated extension %{public}@:\t%{public}@ ", buf, 0x20u);
                }
                BOOL v220 = 1;
              }
              else
              {
                long long v92 = PBFLogDataStore();
                long long v91 = v92;
                if (v90)
                {
                  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412802;
                    long long v299 = v243;
                    __int16 v300 = 2114;
                    *(void *)id v301 = v78;
                    *(_WORD *)&v301[8] = 2114;
                    id v302 = v90;
                    _os_log_error_impl(&dword_1D31CE000, v91, OS_LOG_TYPE_ERROR, "(%@) Error updating extension %{public}@:\t%{public}@ ", buf, 0x20u);
                  }
                }
                else if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  long long v299 = v243;
                  __int16 v300 = 2114;
                  *(void *)id v301 = v78;
                  *(_WORD *)&v301[8] = 2114;
                  id v302 = v76;
                  *(_WORD *)id v303 = 2114;
                  *(void *)&v303[2] = v79;
                  _os_log_impl(&dword_1D31CE000, v91, OS_LOG_TYPE_DEFAULT, "(%@) Extension %{public}@ is the same  (%{public}@ vs %{public}@).  So that's nice.", buf, 0x2Au);
                }
              }
            }
            uint64_t v74 = val;
          }
          uint64_t v238 = [(NSSet *)obj countByEnumeratingWithState:&v279 objects:v311 count:16];
        }
        while (v238);
      }

      if ([(BSAtomicFlag *)v74->_extensionsCurrentlyUpdatingFlag getFlag])
      {
        uint64_t v201 = [NSString stringWithFormat:@"we can't handle multiple concurrent global updates yet"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[PBFPosterExtensionDataStore _stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:]();
        }
        [v201 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D31F62B4);
      }
      [(BSAtomicFlag *)v74->_extensionsCurrentlyUpdatingFlag setFlag:1];
      BOOL v215 = [(PBFPosterExtensionDataStore *)v74 _stateLock_hasBeenUnlockedSinceBoot];
      long long v93 = (void *)[(NSMutableDictionary *)v74->_stateLock_staticDescriptorsForExtensionBundleIdentifier mutableCopy];
      long long v94 = v93;
      if (v93)
      {
        id v229 = v93;
      }
      else
      {
        id v229 = (id)objc_opt_new();
      }
      long long v95 = (void *)[(NSMutableDictionary *)v74->_stateLock_descriptorsForExtensionBundleIdentifier mutableCopy];
      long long v96 = v95;
      if (v95)
      {
        id v97 = v95;
      }
      else
      {
        id v97 = (id)objc_opt_new();
      }
      id v98 = [MEMORY[0x1E4F1C9C8] date];
      unint64_t v217 = objc_opt_new();
      long long v272 = 0u;
      long long v273 = 0u;
      long long v274 = 0u;
      long long v275 = 0u;
      id v232 = v228;
      v227 = v98;
      uint64_t v237 = [v232 countByEnumeratingWithState:&v272 objects:v310 count:16];
      if (v237)
      {
        v213 = 0;
        char v223 = 0;
        int v216 = 0;
        uint64_t v233 = *(void *)v273;
        id v226 = v97;
        while (1)
        {
          for (uint64_t n = 0; n != v237; ++n)
          {
            if (*(void *)v273 != v233) {
              objc_enumerationMutation(v232);
            }
            id v100 = *(void **)(*((void *)&v272 + 1) + 8 * n);
            id v101 = [v100 posterExtensionBundleIdentifier];
            id v102 = [(PBFPosterExtensionDataStore *)v74 _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:v101];
            if (v102)
            {
              uint64_t v239 = +[PBFDataRefreshContext staticDescriptorsRefreshContextForNow:v98 extension:v100];
              uint64_t v103 = [[PBFDataComponentObjectEntity alloc] initWithComponent:@"PBFDataComponentStaticDescriptors" object:v102 context:v239];
              uint64_t v104 = [(PBFDataComponentObjectEntity *)v103 determineRefreshState];

              int v105 = [(__CFString *)v104 needsRefresh];
              v242 = v104;
              uint64_t v106 = [(__CFString *)v104 refreshReason];
              uint64_t v107 = (void *)v106;
              id v108 = @"NULL REFRESH REASON";
              if (v106) {
                id v108 = (__CFString *)v106;
              }
              uint64_t v109 = v108;

              id v110 = PBFLogDataStore();
              if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                long long v299 = v243;
                __int16 v300 = 2114;
                *(void *)id v301 = v101;
                *(_WORD *)&v301[8] = 2114;
                id v302 = v242;
                _os_log_impl(&dword_1D31CE000, v110, OS_LOG_TYPE_DEFAULT, "(%{public}@) refresh state for %{public}@ static descriptors: %{public}@", buf, 0x20u);
              }

              __int16 v111 = PBFLogDataStore();
              BOOL v112 = os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT);
              if (v105)
              {
                if (v112)
                {
                  *(_DWORD *)buf = 138543874;
                  long long v299 = v243;
                  __int16 v300 = 2114;
                  *(void *)id v301 = v101;
                  *(_WORD *)&v301[8] = 2114;
                  id v302 = v109;
                  _os_log_impl(&dword_1D31CE000, v111, OS_LOG_TYPE_DEFAULT, "(%{public}@) Static descriptors for %{public}@ are not up to date; proceeding with update for reason %{public}@",
                    buf,
                    0x20u);
                }

                __int16 v113 = [v229 objectForKeyedSubscript:v101];
                id v114 = v113;
                uint64_t v115 = (void *)MEMORY[0x1E4F1CBF0];
                if (!v113) {
                  __int16 v113 = (void *)MEMORY[0x1E4F1CBF0];
                }
                uint64_t v116 = objc_msgSend(v113, "bs_mapNoNulls:", &__block_literal_global_728);
                uint64_t v117 = (void *)v116;
                if (v116) {
                  int v118 = (void *)v116;
                }
                else {
                  int v118 = v115;
                }
                id v119 = v118;

                id v271 = 0;
                BOOL v120 = [(PBFPosterExtensionDataStore *)v74 _stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:v101 reason:a5 error:&v271];
                __int16 v111 = v271;
                id v121 = PBFLogDataStore();
                v122 = v121;
                if (v120)
                {
                  v221 = v119;
                  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    long long v299 = v243;
                    __int16 v300 = 2114;
                    *(void *)id v301 = v101;
                    _os_log_impl(&dword_1D31CE000, v122, OS_LOG_TYPE_DEFAULT, "(%{public}@) Updated static descriptors for %{public}@", buf, 0x16u);
                  }

                  v123 = [v102 posterStaticDescriptorLatestVersionPaths];
                  id v124 = [v123 allObjects];
                  uint64_t v125 = [v124 sortedArrayUsingSelector:sel_compareDescriptorIdentifiers_];
                  id v126 = (void *)v125;
                  char v127 = (void *)MEMORY[0x1E4F1CBF0];
                  if (v125) {
                    uint64_t v128 = v125;
                  }
                  else {
                    uint64_t v128 = MEMORY[0x1E4F1CBF0];
                  }
                  [v229 setObject:v128 forKeyedSubscript:v101];

                  id v129 = [v229 objectForKeyedSubscript:v101];
                  uint64_t v130 = objc_msgSend(v129, "bs_mapNoNulls:", &__block_literal_global_734);
                  int v131 = (void *)v130;
                  if (v130) {
                    uint64_t v132 = (void *)v130;
                  }
                  else {
                    uint64_t v132 = v127;
                  }
                  id v133 = v132;

                  uint64_t v263 = MEMORY[0x1E4F143A8];
                  uint64_t v264 = 3221225472;
                  v265 = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_735;
                  id v266 = &unk_1E6981520;
                  id v119 = v221;
                  id v267 = v221;
                  v122 = v133;
                  v268 = v122;
                  id v269 = v217;
                  id v270 = v101;
                  PFPosterRoleEnumerateValidRolesForCurrentDeviceClass();

                  int v216 = 1;
                  uint64_t v74 = val;
                  id v97 = v226;
                }
                else
                {
                  if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543874;
                    long long v299 = v243;
                    __int16 v300 = 2114;
                    *(void *)id v301 = v101;
                    *(_WORD *)&v301[8] = 2114;
                    id v302 = (__CFString *)v111;
                    _os_log_error_impl(&dword_1D31CE000, v122, OS_LOG_TYPE_ERROR, "(%{public}@) Failed to update static descriptors for %{public}@; error: %{public}@",
                      buf,
                      0x20u);
                  }
                  id v97 = v226;
                }

                id v98 = v227;
              }
              else if (v112)
              {
                *(_DWORD *)buf = 138543618;
                long long v299 = v243;
                __int16 v300 = 2114;
                *(void *)id v301 = v101;
                _os_log_impl(&dword_1D31CE000, v111, OS_LOG_TYPE_DEFAULT, "(%{public}@) Static descriptors do not need updating for %{public}@; bailing",
                  buf,
                  0x16u);
              }

              uint64_t v134 = [v100 posterExtensionInfoPlist];
              if (objc_msgSend(v134, "pbf_supportsDynamicDescriptors"))
              {
                char v135 = objc_msgSend(v100, "pbf_supportsGalleryOrUserDefaultsHasItOverriddenToSupportGallery:", 0);

                if (v135)
                {
                  uint64_t v136 = [v102 lastRefreshDescriptorDate];
                  uint64_t v137 = [v102 lastRefreshDescriptorReason];
                  uint64_t v138 = (void *)v137;
                  uint64_t v139 = @"Never been refreshed";
                  if (v137) {
                    uint64_t v139 = (__CFString *)v137;
                  }
                  v225 = v139;

                  v222 = (void *)v136;
                  [v98 timeIntervalSinceDate:v136];
                  double v141 = v140;
                  if (v215)
                  {
                    uint64_t v142 = [v102 lastRefreshDescriptorDate];
                    id v143 = v98;
                    id v144 = (void *)v142;
                    long long v145 = +[PBFDataRefreshContext dynamicDescriptorsRefreshContextForNow:v143 extension:v100 lastRefreshDate:v142 refreshStrategy:a4];

                    id v146 = [[PBFDataComponentObjectEntity alloc] initWithComponent:@"PBFDataComponentDynamicDescriptors" object:v102 context:v145];
                    id v147 = [(PBFDataComponentObjectEntity *)v146 determineRefreshState];

                    id v148 = PBFLogDataStore();
                    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543874;
                      long long v299 = v243;
                      __int16 v300 = 2114;
                      *(void *)id v301 = v101;
                      *(_WORD *)&v301[8] = 2114;
                      id v302 = v147;
                      _os_log_impl(&dword_1D31CE000, v148, OS_LOG_TYPE_DEFAULT, "(%{public}@) refresh state for %{public}@ dynamic descriptors: %{public}@", buf, 0x20u);
                    }

                    int v149 = [(__CFString *)v147 needsRefresh];
                    uint64_t v150 = [(__CFString *)v147 refreshReason];
                    long long v151 = (void *)v150;
                    long long v152 = @"NULL REFRESH REASON";
                    if (v150) {
                      long long v152 = (__CFString *)v150;
                    }
                    long long v153 = v152;

                    if (v149)
                    {
                      uint64_t v74 = val;
                      long long v154 = [(PBFPosterExtensionDataStore *)val _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:v101 reason:v153 powerLogReason:a5 postEnqueueGalleryUpdateOptions:4 sessionInfo:0 completion:0];
                      long long v155 = v213;
                      if (!v213) {
                        long long v155 = objc_opt_new();
                      }
                      v213 = v155;
                      objc_msgSend(v155, "bs_safeAddObject:", v154);
                    }
                    else
                    {
                      long long v161 = [v100 posterExtensionInfoPlist];
                      uint64_t v162 = objc_msgSend(v161, "pbf_refreshDescriptorsFrequency");

                      long long v154 = PBFLogDataStore();
                      if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
                      {
                        RefreshDescriptorsFrequencyToDebugString(v162);
                        id v163 = (id)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544898;
                        long long v299 = v243;
                        __int16 v300 = 2112;
                        *(void *)id v301 = v101;
                        *(_WORD *)&v301[8] = 2112;
                        id v302 = v153;
                        *(_WORD *)id v303 = 2048;
                        *(void *)&v303[2] = v141;
                        __int16 v304 = 2114;
                        id v305 = v225;
                        __int16 v306 = 2048;
                        int64_t v307 = a4;
                        __int16 v308 = 2114;
                        id v309 = v163;
                        _os_log_impl(&dword_1D31CE000, v154, OS_LOG_TYPE_DEFAULT, "(%{public}@) Avoiding update for %@; reason for no update: %@ (last updated %f ago / reason '%"
                          "{public}@'); refreshDescriptorsStategy: %ld; extension refresh frequency: %{public}@",
                          buf,
                          0x48u);
                      }
                      uint64_t v74 = val;
                    }

                    id v97 = v226;
                    id v98 = v227;
                  }
                  else
                  {
                    long long v145 = PBFLogDataStore();
                    if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138544130;
                      long long v299 = v243;
                      __int16 v300 = 2114;
                      *(void *)id v301 = v101;
                      *(_WORD *)&v301[8] = 2048;
                      id v302 = v141;
                      *(_WORD *)id v303 = 2114;
                      *(void *)&v303[2] = v225;
                      _os_log_impl(&dword_1D31CE000, v145, OS_LOG_TYPE_DEFAULT, "(%{public}@) Avoiding dynamic poster descriptors update for %{public}@; keybag is locked. (%f ag"
                        "o/ reason: '%{public}@')",
                        buf,
                        0x2Au);
                    }
                  }
                  id v160 = (void *)v239;

                  long long v164 = [v97 objectForKeyedSubscript:v101];

                  if (!v164)
                  {
                    long long v165 = [v102 dynamicPosterDescriptorLatestVersionPaths];
                    if ([v165 count])
                    {
                      long long v166 = [v165 allObjects];
                      long long v167 = [v166 sortedArrayUsingSelector:sel_compareDescriptorIdentifiers_];
                      [v97 setObject:v167 forKeyedSubscript:v101];

                      id v98 = v227;
                      char v223 = 1;
                    }
                  }
LABEL_159:

                  goto LABEL_160;
                }
              }
              else
              {
              }
              long long v156 = [v97 objectForKey:v101];
              uint64_t v157 = [v156 count];

              long long v158 = PBFLogDataStore();
              BOOL v159 = os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT);
              if (v157)
              {
                id v160 = (void *)v239;
                if (v159)
                {
                  *(_DWORD *)buf = 138543618;
                  long long v299 = v243;
                  __int16 v300 = 2114;
                  *(void *)id v301 = v101;
                  _os_log_impl(&dword_1D31CE000, v158, OS_LOG_TYPE_DEFAULT, "(%{public}@) Dynamic descriptors disabled for %{public}@; terminating them.",
                    buf,
                    0x16u);
                }

                [v102 teardownAllDynamicDescriptors];
                [v97 removeObjectForKey:v101];
                char v223 = 1;
              }
              else
              {
                id v160 = (void *)v239;
                if (v159)
                {
                  *(_DWORD *)buf = 138543618;
                  long long v299 = v243;
                  __int16 v300 = 2114;
                  *(void *)id v301 = v101;
                  _os_log_impl(&dword_1D31CE000, v158, OS_LOG_TYPE_DEFAULT, "(%{public}@) Dynamic descriptors disabled for %{public}@; no descriptors present, moving on.",
                    buf,
                    0x16u);
                }
              }
              goto LABEL_159;
            }
LABEL_160:
          }
          uint64_t v237 = [v232 countByEnumeratingWithState:&v272 objects:v310 count:16];
          if (!v237) {
            goto LABEL_164;
          }
        }
      }
      v213 = 0;
      char v223 = 0;
      int v216 = 0;
LABEL_164:

      int v168 = v216;
      if (!stateLock_initialRoleCoordinatorSetupPerformed || ((v220 | v216) & 1) != 0 || (v223 & 1) != 0)
      {
        if (v223) {
          id v170 = v97;
        }
        else {
          id v170 = 0;
        }
        if (v216) {
          id v171 = v229;
        }
        else {
          id v171 = 0;
        }
        [(PBFPosterExtensionDataStore *)v74 _stateLock_updateGalleryWithSuggestedLayout:0 descriptorsByExtensionBundleIdentifier:v170 staticDescriptorsByExtensionBundleIdentifier:v171];
        uint64_t v21 = v211;
        if (stateLock_initialRoleCoordinatorSetupPerformed)
        {
          char v169 = 0;
        }
        else
        {
          [(PBFPosterExtensionDataStore *)v74 _stateLock_initialRoleCoordinatorSetup];
          char v169 = 1;
          v74->_BOOL stateLock_initialRoleCoordinatorSetupPerformed = 1;
          if (v216) {
            [(PBFPosterExtensionDataStore *)v74 _stateLock_pushPosterDescriptorsToProactiveForReason:@"Extensions were updated (static/initialRoleCoordinatorSetup)" force:1 completion:0];
          }
        }
      }
      else
      {
        char v169 = 0;
        uint64_t v21 = v211;
      }
      [(BSAtomicFlag *)v74->_extensionsCurrentlyUpdatingFlag setFlag:0];
      if ((v169 & 1) == 0 && v220)
      {
        long long v172 = [(id)objc_opt_class() supportedRoles];
        long long v173 = [MEMORY[0x1E4F1CAD0] setWithArray:v206];
        v261[0] = MEMORY[0x1E4F143A8];
        v261[1] = 3221225472;
        v261[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_744;
        v261[3] = &unk_1E6980DF8;
        id v174 = v172;
        id v262 = v174;
        long long v175 = objc_msgSend(v173, "bs_filter:", v261);

        long long v176 = [MEMORY[0x1E4F1CAD0] setWithArray:v234];
        v259[0] = MEMORY[0x1E4F143A8];
        v259[1] = 3221225472;
        v259[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_745;
        v259[3] = &unk_1E6980DF8;
        id v177 = v174;
        id v260 = v177;
        id v178 = objc_msgSend(v176, "bs_filter:", v259);

        if (([v175 isEqual:v178] & 1) == 0)
        {
          char v179 = +[PBFPosterDataStoreEventBuilder extensionsUpdatedFrom:v175 to:v178 supportedRoles:v177];
          id v258 = 0;
          long long v180 = [v179 buildWithError:&v258];
          id v181 = v258;

          long long v182 = PBFLogDataStore();
          long long v183 = v182;
          if (v181)
          {
            if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR)) {
              -[PBFPosterExtensionDataStore _stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:].cold.4();
            }
          }
          else
          {
            if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              long long v299 = v243;
              __int16 v300 = 2114;
              *(void *)id v301 = v180;
              _os_log_impl(&dword_1D31CE000, v183, OS_LOG_TYPE_DEFAULT, "(%{public}@) successfully built data store event for updated extensions: %{public}@", buf, 0x16u);
            }

            objc_msgSend(v217, "bs_safeAddObject:", v180);
          }

          id v98 = v227;
        }

        uint64_t v21 = v211;
        int v168 = v216;
      }
      if ([v217 count])
      {
        id v184 = (void *)[v217 copy];
        id v257 = 0;
        BOOL v185 = [(PBFPosterExtensionDataStore *)v74 _stateLock_processEvents:v184 context:0 error:&v257];
        id v186 = v257;

        v187 = PBFLogDataStore();
        id v188 = v187;
        if (v185)
        {
          if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            long long v299 = v243;
            _os_log_impl(&dword_1D31CE000, v188, OS_LOG_TYPE_DEFAULT, "(%{public}@) successfully issued data store events for updated extensions", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
        {
          -[PBFPosterExtensionDataStore _stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:]();
        }

        uint64_t v21 = v211;
      }
      [(PBFPosterExtensionDataStore *)v74 _notifyObserversDidUpdateExtensions];
      v189 = PBFLogDataStore();
      if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v190 = [v213 count];
        *(_DWORD *)buf = 138413314;
        long long v299 = v243;
        __int16 v300 = 1024;
        *(_DWORD *)id v301 = v223 & 1;
        uint64_t v21 = v211;
        *(_WORD *)&v301[4] = 1024;
        *(_DWORD *)&v301[6] = v168;
        LOWORD(v302) = 1024;
        *(_DWORD *)((char *)&v302 + 2) = v220;
        HIWORD(v302) = 2048;
        *(void *)id v303 = v190;
        _os_log_impl(&dword_1D31CE000, v189, OS_LOG_TYPE_DEFAULT, "(%@) Finished updating extensions; dynamic updated? %{BOOL}u -- static updated? %{BOOL}u -- extensions updated"
          "? %{BOOL}u -- queued up dynamic descriptors updates: %lu",
          buf,
          0x28u);
      }

      if ([v213 count])
      {
        if (v202) {
          id *v202 = (id)[v213 copy];
        }
        v191 = dispatch_group_create();
        long long v253 = 0u;
        long long v254 = 0u;
        long long v255 = 0u;
        long long v256 = 0u;
        id v192 = v213;
        uint64_t v193 = [v192 countByEnumeratingWithState:&v253 objects:v297 count:16];
        if (v193)
        {
          uint64_t v194 = v193;
          uint64_t v195 = *(void *)v254;
          do
          {
            for (iuint64_t i = 0; ii != v194; ++ii)
            {
              if (*(void *)v254 != v195) {
                objc_enumerationMutation(v192);
              }
              unint64_t v197 = *(void **)(*((void *)&v253 + 1) + 8 * ii);
              dispatch_group_enter(v191);
              v251[0] = MEMORY[0x1E4F143A8];
              v251[1] = 3221225472;
              v251[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_746;
              v251[3] = &unk_1E6981548;
              uint64_t v252 = v191;
              [v197 addCompletionObserver:v251];
            }
            uint64_t v194 = [v192 countByEnumeratingWithState:&v253 objects:v297 count:16];
          }
          while (v194);
        }

        objc_initWeak((id *)buf, val);
        uint64_t v198 = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_748;
        block[3] = &unk_1E6981598;
        objc_copyWeak(v250, (id *)buf);
        v250[1] = v203;
        id v249 = v210;
        dispatch_group_notify(v191, v198, block);

        objc_destroyWeak(v250);
        objc_destroyWeak((id *)buf);

        uint64_t v21 = v211;
        id v98 = v227;
      }
      else if (([(BSAtomicFlag *)v74->_isPrewarmingFlag getFlag] & 1) == 0)
      {
        v245[0] = MEMORY[0x1E4F143A8];
        v245[1] = 3221225472;
        v245[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_4_756;
        v245[3] = &unk_1E6981570;
        v245[4] = v74;
        uint64_t v247 = v203;
        id v246 = v210;
        [(PBFPosterExtensionDataStore *)v74 _stateLock_pushPosterDescriptorsToProactiveForReason:@"Extensions were updated - no updates" force:0 completion:v245];
      }
      [v21 invalidate];
      __int16 v199 = PBFLogPosterContents();
      id v200 = v199;
      if (v208 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v199))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v200, OS_SIGNPOST_INTERVAL_END, spid, "updateExtensions", "", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[PBFPosterExtensionDataStore _stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:]();
    }
    id v10 = v212;
  }
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 posterExtensionBundleIdentifier];
  uint64_t v3 = [&unk_1F2AAEBF0 containsObject:v2];

  return v3;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 posterExtensionBundleIdentifier];
  uint64_t v3 = [&unk_1F2AAEC08 containsObject:v2];

  return v3;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_715(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 posterExtensionBundleIdentifier];
  uint64_t v6 = [v4 posterExtensionBundleIdentifier];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_719(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 posterExtensionBundleIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_726(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F92650];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] _initWithPath:v3];

  return v4;
}

id __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_732(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F92650];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] _initWithPath:v3];

  return v4;
}

void __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_735(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_3;
  v18[3] = &unk_1E69814F8;
  id v5 = v3;
  id v19 = v5;
  uint64_t v6 = objc_msgSend(v4, "bs_filter:", v18);
  uint64_t v7 = (void *)a1[5];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_4;
  long long v16 = &unk_1E69814F8;
  id v8 = v5;
  id v17 = v8;
  uint64_t v9 = objc_msgSend(v7, "bs_filter:", &v13);
  if (objc_msgSend(v9, "count", v13, v14, v15, v16) || objc_msgSend(v6, "count"))
  {
    id v10 = (void *)a1[6];
    uint64_t v11 = +[PBFPosterDataStoreEventBuilder staticDescriptorsUpdatedForProvider:a1[7] role:v8 from:v6 to:v9];
    os_signpost_id_t v12 = [v11 buildWithError:0];
    objc_msgSend(v10, "bs_safeAddObject:", v12);
  }
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 role];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 role];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_744(uint64_t a1, void *a2)
{
  id v3 = [a2 supportedRoles];
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_745(uint64_t a1, void *a2)
{
  id v3 = [a2 supportedRoles];
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

void __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_746(uint64_t a1)
{
}

void __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_2_748(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 47);
    if (([*(id *)&v3[56]._os_unfair_lock_opaque getFlag] & 1) == 0)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_3_752;
      v5[3] = &unk_1E6981570;
      uint64_t v4 = *(void *)(a1 + 48);
      v5[4] = v3;
      uint64_t v7 = v4;
      id v6 = *(id *)(a1 + 32);
      [(os_unfair_lock_s *)v3 _stateLock_pushPosterDescriptorsToProactiveForReason:@"Extensions were updated - updated reload descriptors" force:0 completion:v5];
    }
    os_unfair_lock_unlock(v3 + 47);
  }
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_3_752(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishUpdateExtensionUpdateWithOptions:*(void *)(a1 + 48) updateExtensionSession:*(void *)(a1 + 40) pushToProactiveError:a3 didUpdateProactiveDescriptors:a2];
}

uint64_t __133__PBFPosterExtensionDataStore__stateLock_updateExtensions_refreshDescriptors_powerLogReason_galleryUpdateOptions_queuedUpOperations___block_invoke_4_756(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishUpdateExtensionUpdateWithOptions:*(void *)(a1 + 48) updateExtensionSession:*(void *)(a1 + 40) pushToProactiveError:a3 didUpdateProactiveDescriptors:a2];
}

- (void)_finishUpdateExtensionUpdateWithOptions:(unint64_t)a3 updateExtensionSession:(id)a4 pushToProactiveError:(id)a5 didUpdateProactiveDescriptors:(BOOL)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v11 = NSString;
  os_signpost_id_t v12 = [a4 UUIDString];
  uint64_t v13 = [v12 substringToIndex:7];
  uint64_t v14 = [v11 stringWithFormat:@"finishUpdateExtension/%@", v13];

  if (v10)
  {
    uint64_t v15 = PBFLogDataStore();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStore _finishUpdateExtensionUpdateWithOptions:updateExtensionSession:pushToProactiveError:didUpdateProactiveDescriptors:]();
    }
  }
  else if (a6)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __145__PBFPosterExtensionDataStore__finishUpdateExtensionUpdateWithOptions_updateExtensionSession_pushToProactiveError_didUpdateProactiveDescriptors___block_invoke;
    void v16[3] = &unk_1E69815C0;
    id v17 = v14;
    [(PBFPosterExtensionDataStore *)self enqueueGalleryConfigurationUpdateWithOptions:a3 powerLogReason:4 completion:v16];
    uint64_t v15 = v17;
  }
  else
  {
    uint64_t v15 = PBFLogDataStore();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v14;
      _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "(%@)Finished dynamic descriptors update; push was identical to previous pushes, bailing.",
        buf,
        0xCu);
    }
  }
}

void __145__PBFPosterExtensionDataStore__finishUpdateExtensionUpdateWithOptions_updateExtensionSession_pushToProactiveError_didUpdateProactiveDescriptors___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = PBFLogDataStore();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __145__PBFPosterExtensionDataStore__finishUpdateExtensionUpdateWithOptions_updateExtensionSession_pushToProactiveError_didUpdateProactiveDescriptors___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138412546;
    uint64_t v12 = v10;
    __int16 v13 = 1024;
    int v14 = a4;
    _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "(%@)Finished dynamic descriptors update; did update? %{BOOL}u",
      (uint8_t *)&v11,
      0x12u);
  }
}

- (BOOL)_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:(id)a3 reason:(int64_t)a4 error:(id *)a5
{
  v128[1] = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    uint64_t v10 = PBFLogPosterContents();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    uint64_t v12 = PBFLogPosterContents();
    __int16 v13 = v12;
    unint64_t v14 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v117 = v8;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier", "provider identifier: %{public}@", buf, 0xCu);
    }

    uint64_t v15 = [(PFPosterExtensionProvider *)self->_extensionProvider extensionForIdentifier];
    long long v16 = [v15 objectForKey:v8];

    if (v16)
    {
      id v17 = [(PBFPosterExtensionDataStore *)self _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:v8];
      if (v17)
      {
        unint64_t v88 = v11 - 1;
        +[PBFPowerLogger logUpdate:0 reason:a4 inServiceOfBundleIdentifier:v8];
        [v17 teardownAllStaticDescriptorStoreCoordinators];
        id v18 = [v16 posterExtensionInfoPlist];
        id v19 = (void *)MEMORY[0x1E4F1CAA0];
        uint64_t v20 = objc_msgSend(v18, "pbf_staticDescriptorIdentifiers");
        uint64_t v21 = (void *)v20;
        if (v20) {
          uint64_t v22 = v20;
        }
        else {
          uint64_t v22 = MEMORY[0x1E4F1CBF0];
        }
        uint64_t v23 = [v19 orderedSetWithArray:v22];

        id v24 = [(id)objc_opt_class() supportedRoles];
        v111[0] = MEMORY[0x1E4F143A8];
        v111[1] = 3221225472;
        v111[2] = __122__PBFPosterExtensionDataStore__stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier_reason_error___block_invoke;
        v111[3] = &unk_1E69815E8;
        id v25 = v18;
        id v112 = v25;
        id v26 = v24;
        id v113 = v26;
        long long v27 = objc_msgSend(v23, "bs_filter:", v111);

        if ([v27 count])
        {
          id v84 = v26;
          os_signpost_id_t v85 = v11;
          uint64_t v82 = a5;
          id v86 = v16;
          BOOL v87 = v8;
          int v90 = objc_opt_new();
          long long v107 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          uint64_t v83 = v27;
          id obj = v27;
          uint64_t v97 = [obj countByEnumeratingWithState:&v107 objects:v124 count:16];
          if (!v97)
          {
            char v91 = 0;
            goto LABEL_72;
          }
          char v91 = 0;
          uint64_t v96 = *(void *)v108;
          uint64_t v95 = *MEMORY[0x1E4F28588];
          long long v92 = v17;
          id v98 = v25;
          while (1)
          {
            for (uint64_t i = 0; i != v97; ++i)
            {
              if (*(void *)v108 != v96) {
                objc_enumerationMutation(obj);
              }
              uint64_t v29 = *(void *)(*((void *)&v107 + 1) + 8 * i);
              uint64_t v30 = objc_msgSend(v25, "pbf_roleForStaticDescriptorIdentifier:", v29);
              id v106 = 0;
              id v31 = [v17 createStaticDescriptorStoreCoordinatorForIdentifier:v29 role:v30 error:&v106];
              id v32 = v106;
              if (v31)
              {
                id v99 = [v31 posterUUID];
                id v105 = 0;
                uint64_t v33 = [v31 addNewVersionWithContents:0 error:&v105];
                unint64_t v34 = (unint64_t)v105;

                uint64_t v35 = [v31 pathForIdentity:v33];
                id v32 = (id)v34;
                if (!(v33 | v34))
                {
                  id v36 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v122 = v95;
                  uint64_t v37 = [NSString stringWithFormat:@"descriptor store w/ posterUUID %@ already existed", v99];
                  v123 = v37;
                  uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
                  objc_msgSend(v36, "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3333, v38);
                  id v32 = (id)objc_claimAutoreleasedReturnValue();

                  id v25 = v98;
                  id v17 = v92;
                }

                char v91 = 1;
                if (v35)
                {
                  if (v32) {
                    goto LABEL_23;
                  }
                  goto LABEL_26;
                }
              }
              else
              {
                id v99 = 0;
              }
              char v39 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v120 = v95;
              id v121 = @"Unable to create new static descriptor path";
              long long v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v121 forKeys:&v120 count:1];
              uint64_t v41 = objc_msgSend(v39, "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3330, v40);

              uint64_t v35 = 0;
              id v32 = (id)v41;
              if (v41)
              {
LABEL_23:
                [v90 addObject:v32];
                goto LABEL_42;
              }
LABEL_26:
              id v42 = (void *)[objc_alloc(MEMORY[0x1E4F925E0]) _initWithPath:v35];
              long long v93 = objc_msgSend(v25, "pbf_displayNameLocalizationKeyForStaticDescriptorIdentifier:", v29);
              long long v94 = v42;
              objc_msgSend(v42, "setDisplayNameLocalizationKey:");
              id v43 = objc_msgSend(v25, "pbf_proactivePosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:", v29);
              id v104 = 0;
              char v44 = [MEMORY[0x1E4F926B0] storeProactiveGalleryOptionsToPath:v35 proactiveGalleryOptions:v43 error:&v104];
              id v45 = v104;
              if ((v44 & 1) == 0)
              {
                id v46 = PBFLogPosterContents();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v117 = v99;
                  __int16 v118 = 2114;
                  id v119 = v45;
                  _os_log_error_impl(&dword_1D31CE000, v46, OS_LOG_TYPE_ERROR, "Could not update proactive gallery options for static descriptor ingestion poster uuid %{public}@: %{public}@", buf, 0x16u);
                }
              }
              id v47 = objc_msgSend(v25, "pbf_posterBoardPosterDescriptorGalleryOptionsForStaticDescriptorIdentifier:", v29);
              id v103 = 0;
              char v48 = [MEMORY[0x1E4F926B0] storePosterDescriptorGalleryOptions:v35 posterDescriptorGalleryOptions:v47 error:&v103];
              id v49 = v103;

              if ((v48 & 1) == 0)
              {
                uint64_t v50 = PBFLogPosterContents();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v117 = v99;
                  __int16 v118 = 2114;
                  id v119 = v49;
                  _os_log_error_impl(&dword_1D31CE000, v50, OS_LOG_TYPE_ERROR, "Could not update posterboard gallery options for static descriptor ingestion poster uuid %{public}@: %{public}@", buf, 0x16u);
                }
              }
              uint64_t v51 = objc_msgSend(v98, "pbf_userInfoForStaticDescriptorIdentifier:", v29);
              long long v52 = (void *)v51;
              if (v51) {
                uint64_t v53 = v51;
              }
              else {
                uint64_t v53 = MEMORY[0x1E4F1CC08];
              }
              id v102 = 0;
              char v54 = [v35 storeUserInfo:v53 error:&v102];
              id v32 = v102;

              if ((v54 & 1) == 0)
              {
                long long v55 = PBFLogPosterContents();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v117 = v99;
                  __int16 v118 = 2114;
                  id v119 = v32;
                  _os_log_error_impl(&dword_1D31CE000, v55, OS_LOG_TYPE_ERROR, "Could not update userInfo for static descriptor ingestion poster uuid %{public}@: %{public}@", buf, 0x16u);
                }
              }
              id v17 = v92;
              id v25 = v98;
LABEL_42:
            }
            uint64_t v97 = [obj countByEnumeratingWithState:&v107 objects:v124 count:16];
            if (!v97)
            {
LABEL_72:

              BOOL v69 = v90;
              long long v16 = v86;
              id v8 = v87;
              if ([v90 count])
              {
                [v17 teardownAllStaticDescriptorStoreCoordinators];
                id v70 = PBFLogPosterContents();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT)) {
                  -[PBFPosterExtensionDataStore _stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:]();
                }

                if (v82)
                {
                  id v71 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v114 = *MEMORY[0x1E4F28750];
                  id v72 = [v90 copy];
                  uint64_t v115 = v72;
                  char v91 = 1;
                  id v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
                  objc_msgSend(v71, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v73);
                  *uint64_t v82 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  char v91 = 1;
                }
              }
              uint64_t v74 = [obj array];
              v100[0] = MEMORY[0x1E4F143A8];
              v100[1] = 3221225472;
              v100[2] = __122__PBFPosterExtensionDataStore__stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier_reason_error___block_invoke_772;
              v100[3] = &unk_1E6981610;
              id v75 = v17;
              id v101 = v75;
              id v76 = objc_msgSend(v74, "bs_mapNoNulls:", v100);

              if (v76) {
                id v77 = v76;
              }
              else {
                id v77 = (void *)MEMORY[0x1E4F1CBF0];
              }
              [v75 providerInfoSetObject:v77 forKey:@"kProactiveStaticPosterDescriptorOrdering"];
              id v78 = [v86 persistentIdentifier];
              [v75 providerInfoSetObject:v78 forKey:@"StaticPersistentIdentifier"];

              id v79 = PBFLogPosterContents();
              id v80 = v79;
              if (v88 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v117 = v87;
                _os_signpost_emit_with_name_impl(&dword_1D31CE000, v80, OS_SIGNPOST_INTERVAL_END, v85, "_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier", "provider identifier: %{public}@", buf, 0xCu);
              }

              long long v27 = v83;
              id v26 = v84;
              goto LABEL_86;
            }
          }
        }
        [v17 providerInfoSetObject:0 forKey:@"kProactiveStaticPosterDescriptorOrdering"];
        uint64_t v66 = [v16 persistentIdentifier];
        [v17 providerInfoSetObject:v66 forKey:@"StaticPersistentIdentifier"];

        uint64_t v67 = PBFLogPosterContents();
        uint64_t v68 = v67;
        if (v88 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v117 = v8;
          _os_signpost_emit_with_name_impl(&dword_1D31CE000, v68, OS_SIGNPOST_INTERVAL_END, v11, "_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier", "provider identifier: %{public}@", buf, 0xCu);
        }
        char v91 = 0;
        BOOL v69 = v68;
LABEL_86:

        char v9 = v91;
        goto LABEL_87;
      }
      uint64_t v61 = PBFLogPosterContents();
      id v62 = v61;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v117 = v8;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v62, OS_SIGNPOST_INTERVAL_END, v11, "_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier", "provider identifier: %{public}@", buf, 0xCu);
      }

      uint64_t v63 = PBFLogPosterContents();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore _stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:]();
      }

      if (a5)
      {
        uint64_t v64 = (void *)MEMORY[0x1E4F28C58];
        if (v8) {
          uint64_t v65 = v8;
        }
        else {
          uint64_t v65 = &stru_1F2A71F00;
        }
        uint64_t v125 = @"extensionBundleIdentifier";
        id v126 = v65;
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
        objc_msgSend(v64, "pbf_dataStoreErrorWithCode:userInfo:", -2217, v25);
        char v9 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_87:

        goto LABEL_88;
      }
      char v9 = 0;
    }
    else
    {
      BOOL v56 = PBFLogPosterContents();
      long long v57 = v56;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v117 = v8;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v57, OS_SIGNPOST_INTERVAL_END, v11, "_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier", "provider identifier: %{public}@", buf, 0xCu);
      }

      id v58 = PBFLogPosterContents();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore _stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:]();
      }

      if (!a5)
      {
        char v9 = 0;
LABEL_89:

        goto LABEL_90;
      }
      uint64_t v59 = (void *)MEMORY[0x1E4F28C58];
      if (v8) {
        uint64_t v60 = v8;
      }
      else {
        uint64_t v60 = @"(null extensionBundleIdentifier)";
      }
      char v127 = @"extensionBundleIdentifier";
      v128[0] = v60;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:&v127 count:1];
      objc_msgSend(v59, "pbf_dataStoreErrorWithCode:userInfo:", -2217, v17);
      char v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_88:

    goto LABEL_89;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    char v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v9 = 0;
  }
LABEL_90:

  return v9 & 1;
}

uint64_t __122__PBFPosterExtensionDataStore__stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier_reason_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(*(id *)(a1 + 32), "pbf_roleForStaticDescriptorIdentifier:", a2);
  uint64_t v4 = [*(id *)(a1 + 40) containsObject:v3];

  return v4;
}

id __122__PBFPosterExtensionDataStore__stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier_reason_error___block_invoke_772(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) staticDescriptorStoreCoordinatorForIdentifier:a2];
  id v3 = [v2 posterUUID];
  uint64_t v4 = [v3 UUIDString];

  return v4;
}

- (BOOL)_stateLock_cleanupAfterDeletedExtension:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    id v8 = [v6 posterExtensionBundleIdentifier];
    [(PBFPosterSnapshotManager *)self->_snapshotManager cancelRequestedSnapshotsForExtensionBundleIdentifier:v8];
    char v9 = [(NSMutableDictionary *)self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier objectForKey:v8];
    [v9 reapEverythingExceptLatestVersion];
    BOOL v7 = [(PBFPosterExtensionDataStore *)self _stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:v8 waitForPushToProactive:0 error:a4];
  }
  return v7;
}

- (BOOL)_stateLock_setupEnvironmentForExtension:(id)a3 wasUpdated:(BOOL *)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    uint64_t v10 = PBFLogPosterContents();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    uint64_t v12 = PBFLogPosterContents();
    __int16 v13 = v12;
    unint64_t v14 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      uint64_t v15 = [v8 posterExtensionBundleIdentifier];
      *(_DWORD *)buf = 138543362;
      id v47 = v15;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "_stateLock_setupEnvironmentForExtension", "provider identifier: %{public}@", buf, 0xCu);
    }
    long long v16 = [v8 posterExtensionBundleIdentifier];
    id v17 = [(NSMutableDictionary *)self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier objectForKey:v16];
    if (v17)
    {
      if (!a4) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v22 = [(PBFPosterExtensionDataStore *)self extensionStoreCoordinatorContainerURL];
    id v17 = [v22 URLByAppendingPathComponent:v16 isDirectory:1];

    if (([v17 checkResourceIsReachableAndReturnError:0] & 1) == 0)
    {
      os_signpost_id_t v41 = v11;
      uint64_t v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v24 = PFFileProtectionNoneAttributes();
      id v43 = 0;
      int v25 = [v23 createDirectoryAtURL:v17 withIntermediateDirectories:0 attributes:v24 error:&v43];
      id v40 = v43;

      id v26 = PBFLogCommon();
      long long v27 = v26;
      if (v25)
      {
        long long v28 = v40;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v47 = v16;
          _os_log_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEFAULT, "Successfully created extension store coordinator container for provider '%{public}@", buf, 0xCu);
        }
      }
      else
      {
        long long v28 = v40;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[PBFPosterExtensionDataStore _stateLock_setupEnvironmentForExtension:wasUpdated:error:]();
        }
      }

      os_signpost_id_t v11 = v41;
      if (v28)
      {
        if (a5) {
          *a5 = v28;
        }
        uint64_t v29 = PBFLogPosterContents();
        uint64_t v30 = v29;
        if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          id v31 = [v8 posterExtensionBundleIdentifier];
          *(_DWORD *)buf = 138543362;
          id v47 = v31;
          _os_signpost_emit_with_name_impl(&dword_1D31CE000, v30, OS_SIGNPOST_INTERVAL_END, v41, "_stateLock_setupEnvironmentForExtension", "provider identifier: %{public}@", buf, 0xCu);
        }
        BOOL v9 = 0;
        goto LABEL_14;
      }
    }
    id v32 = [[PBFPosterExtensionStoreCoordinator alloc] initWithContainerURL:v17 extensionIdentifier:v16];
    uint64_t v33 = v32;
    if (v32)
    {
      unint64_t v34 = [(PBFPosterExtensionStoreCoordinator *)v32 setupEnvironmentIfNecessary];
      if (v34)
      {
LABEL_32:
        if (a5) {
          *a5 = v34;
        }
        uint64_t v35 = PBFLogPosterContents();
        id v36 = v35;
        if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
        {
          uint64_t v37 = [v8 posterExtensionBundleIdentifier];
          *(_DWORD *)buf = 138543362;
          id v47 = v37;
          _os_signpost_emit_with_name_impl(&dword_1D31CE000, v36, OS_SIGNPOST_INTERVAL_END, v11, "_stateLock_setupEnvironmentForExtension", "provider identifier: %{public}@", buf, 0xCu);
        }
        BOOL v9 = 0;
        id v17 = v33;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F28588];
      id v45 = @"Unable to setup extension store coordinator";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      v39 = os_signpost_id_t v42 = v11;
      unint64_t v34 = objc_msgSend(v38, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v39);

      os_signpost_id_t v11 = v42;
      if (v34) {
        goto LABEL_32;
      }
    }
    [(PBFPosterExtensionStoreCoordinator *)v33 reapEverythingExceptLatestVersion];
    os_unfair_lock_lock(&self->_extensionProvidingLock);
    [(NSMutableDictionary *)self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier setObject:v33 forKey:v16];
    os_unfair_lock_unlock(&self->_extensionProvidingLock);
    [(NSMutableDictionary *)self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier setObject:v33 forKey:v16];

    id v17 = v33;
    if (!a4)
    {
LABEL_10:
      id v18 = PBFLogPosterContents();
      id v19 = v18;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        uint64_t v20 = [v8 posterExtensionBundleIdentifier];
        *(_DWORD *)buf = 138543362;
        id v47 = v20;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v19, OS_SIGNPOST_INTERVAL_END, v11, "_stateLock_setupEnvironmentForExtension", "provider identifier: %{public}@", buf, 0xCu);
      }
      BOOL v9 = v17 != 0;
LABEL_14:

      goto LABEL_16;
    }
LABEL_9:
    *a4 = 0;
    goto LABEL_10;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    BOOL v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_16:

  return v9;
}

- (BOOL)_stateLock_updateEnvironmentForExtension:(id)a3 fromExtension:(id)a4 error:(id *)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      LOBYTE(v10) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    os_signpost_id_t v11 = PBFLogDataStore();
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    __int16 v13 = PBFLogDataStore();
    unint64_t v14 = v13;
    unint64_t v15 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      long long v16 = [v8 posterExtensionBundleIdentifier];
      int v35 = 138543362;
      id v36 = v16;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "_stateLock_updateEnvironmentForExtension", "provider identifier: %{public}@", (uint8_t *)&v35, 0xCu);
    }
    id v17 = [v8 posterExtensionBundleIdentifier];
    id v18 = [(PBFPosterExtensionDataStore *)self _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:v17];
    id v19 = PBFLogPosterContents();
    uint64_t v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 138543362;
        id v36 = v17;
        _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "Updating Extension %{public}@", (uint8_t *)&v35, 0xCu);
      }

      uint64_t v21 = [v9 uniqueIdentifier];
      uint64_t v22 = [v8 uniqueIdentifier];
      int v23 = [v21 isEqual:v22];

      if (v23)
      {
        id v24 = PBFLogDataStore();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          int v35 = 138543874;
          id v36 = v17;
          __int16 v37 = 2114;
          id v38 = v9;
          __int16 v39 = 2114;
          id v40 = v8;
          _os_log_debug_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEBUG, "Extension process for %{public}@ is unchanged; (%{public}@ vs %{public}@)",
            (uint8_t *)&v35,
            0x20u);
        }
      }
      else
      {
        id v24 = PBFLogPosterContents();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = 138543874;
          id v36 = v17;
          __int16 v37 = 2114;
          id v38 = v9;
          __int16 v39 = 2114;
          id v40 = v8;
          _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "Extension process for %{public}@ HAS changed; (%{public}@ vs %{public}@)",
            (uint8_t *)&v35,
            0x20u);
        }
      }

      int v10 = v23 ^ 1;
      id v31 = PBFLogPosterContents();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 138543618;
        id v36 = v17;
        __int16 v37 = 1024;
        LODWORD(v38) = v10;
        _os_log_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_DEFAULT, "Updated Extension %{public}@: %{BOOL}u", (uint8_t *)&v35, 0x12u);
      }

      id v32 = PBFLogDataStore();
      uint64_t v29 = v32;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        uint64_t v33 = [v8 posterExtensionBundleIdentifier];
        int v35 = 138543618;
        id v36 = v33;
        __int16 v37 = 1024;
        LODWORD(v38) = v10;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v29, OS_SIGNPOST_INTERVAL_END, v12, "_stateLock_updateEnvironmentForExtension", "provider identifier: %{public}@; didUpdate: %{BOOL}u",
          (uint8_t *)&v35,
          0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore _stateLock_updateEnvironmentForExtension:fromExtension:error:]();
      }

      if (a5)
      {
        int v25 = (void *)MEMORY[0x1E4F28C58];
        if (v17) {
          id v26 = v17;
        }
        else {
          id v26 = &stru_1F2A71F00;
        }
        os_signpost_id_t v41 = @"extensionBundleIdentifier";
        v42[0] = v26;
        long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
        objc_msgSend(v25, "pbf_dataStoreErrorWithCode:userInfo:", -2217, v27);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      long long v28 = PBFLogDataStore();
      uint64_t v29 = v28;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        uint64_t v30 = [v8 posterExtensionBundleIdentifier];
        int v35 = 138543362;
        id v36 = v30;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v29, OS_SIGNPOST_INTERVAL_END, v12, "_stateLock_updateEnvironmentForExtension", "provider identifier: %{public}@", (uint8_t *)&v35, 0xCu);
      }
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (id)_stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v5 = [(NSMutableDictionary *)self->_stateLock_descriptorsForExtensionBundleIdentifier objectForKey:v4];
  }

  return v5;
}

- (id)_stateLock_knownStaticPosterDescriptorsForExtensionBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v5 = [(NSMutableDictionary *)self->_stateLock_staticDescriptorsForExtensionBundleIdentifier objectForKey:v4];
  }

  return v5;
}

- (id)_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSMutableDictionary *)self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier objectForKey:v4];
  }

  return v5;
}

- (id)_stateLock_extensionBundleIdentifierForConfigurationUUID:(id)a3
{
  id v4 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    os_signpost_id_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    __int16 v13 = __Block_byref_object_copy_;
    unint64_t v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __88__PBFPosterExtensionDataStore__stateLock_extensionBundleIdentifierForConfigurationUUID___block_invoke;
    v7[3] = &unk_1E6981638;
    id v8 = v4;
    id v9 = &v10;
    [(PBFPosterExtensionDataStore *)self _stateLock_enumerateConfigurationStoreCoordinators:v7];
    id v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return v5;
}

void __88__PBFPosterExtensionDataStore__stateLock_extensionBundleIdentifierForConfigurationUUID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  BOOL v7 = [a3 posterUUID];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = [v12 extensionIdentifier];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    os_signpost_id_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

- (void)enumerateExtensionStoreCoordinators:(id)a3
{
  p_stateLocuint64_t k = &self->_stateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  [(PBFPosterExtensionDataStore *)self _stateLock_enumerateExtensionStoreCoordinators:v5];

  os_unfair_lock_unlock(p_stateLock);
}

- (id)extensionStoreCoordinators
{
  p_stateLocuint64_t k = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v4 = [(PBFPosterExtensionDataStore *)self _stateLock_extensionStoreCoordinators];
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (id)_stateLock_extensionStoreCoordinators
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v3 = [(NSMutableDictionary *)self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier allValues];
  }
  return v3;
}

- (void)_stateLock_enumerateExtensionStoreCoordinators:(id)a3
{
  id v4 = a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    id v5 = [(NSMutableDictionary *)self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier allValues];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__PBFPosterExtensionDataStore__stateLock_enumerateExtensionStoreCoordinators___block_invoke;
    v6[3] = &unk_1E6981660;
    id v7 = v4;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

uint64_t __78__PBFPosterExtensionDataStore__stateLock_enumerateExtensionStoreCoordinators___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_stateLock_posterConfigurationPathForUUID:(id)a3
{
  id v4 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    os_signpost_id_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    __int16 v13 = __Block_byref_object_copy_;
    unint64_t v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__PBFPosterExtensionDataStore__stateLock_posterConfigurationPathForUUID___block_invoke;
    v7[3] = &unk_1E6981638;
    id v8 = v4;
    uint64_t v9 = &v10;
    [(PBFPosterExtensionDataStore *)self _stateLock_enumerateConfigurationStoreCoordinators:v7];
    id v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return v5;
}

void __73__PBFPosterExtensionDataStore__stateLock_posterConfigurationPathForUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  id v6 = [v11 posterUUID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    uint64_t v8 = [v11 pathOfLatestVersion];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (BOOL)_stateLock_hasBeenUnlockedSinceBoot
{
  if ([(NSNumber *)self->_stateLock_hasBeenUnlockedSinceBoot BOOLValue]) {
    return 1;
  }
  id v4 = NSNumber;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v5 = (uint64_t (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  uint64_t v12 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v8[3] = &unk_1E6980C98;
    void v8[4] = &v9;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)v8);
    id v5 = (uint64_t (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v5) {
    -[PBFPosterExtensionDataStore _stateLock_hasBeenUnlockedSinceBoot]();
  }
  id v6 = [v4 numberWithInt:v5()];
  stateLock_hasBeenUnlockedSinceBoot = self->_stateLock_hasBeenUnlockedSinceBoot;
  self->_stateLock_hasBeenUnlockedSinceBoot = v6;

  return [(NSNumber *)self->_stateLock_hasBeenUnlockedSinceBoot BOOLValue];
}

+ (FCActivityManager)sharedActivityManager
{
  return (FCActivityManager *)[MEMORY[0x1E4F62278] sharedActivityManager];
}

- (id)_activityModeForFocusUUID:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() sharedActivityManager];
  id v5 = [v4 availableActivities];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PBFPosterExtensionDataStore__activityModeForFocusUUID___block_invoke;
  v9[3] = &unk_1E6980808;
  id v10 = v3;
  id v6 = v3;
  int v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __57__PBFPosterExtensionDataStore__activityModeForFocusUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 activityUniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_activeActivity
{
  id v2 = [(id)objc_opt_class() sharedActivityManager];
  id v3 = [v2 activeActivity];

  return v3;
}

- (void)_updateActiveActivity:(id)a3 active:(BOOL)a4 reason:(id)a5
{
  BOOL v6 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = PBFLogDataStore();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(PBFPosterExtensionDataStore *)self _activeActivity];
    int v13 = 138412546;
    unint64_t v14 = v11;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "Telling FCActivityManager to change active activity from %@ to %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v12 = [(id)objc_opt_class() sharedActivityManager];
  [v12 setActivity:v8 active:v6 reason:v9];
}

- (id)activePosterConfigurationForRole:(id)a3 assocPoster:(id *)a4
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_activePosterLock);
  int v7 = [(NSMutableDictionary *)self->_activePosterLock_roleToActivePosterConfiguration objectForKeyedSubscript:v6];
  os_unfair_lock_unlock(&self->_activePosterLock);
  if (a4 && v7)
  {
    id v8 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v6];
    id v9 = [v8 posterCollection];
    id v10 = objc_msgSend(v7, "pbf_posterUUID");
    *a4 = [v9 associatedPosterForUUID:v10];
  }
  return v7;
}

- (id)activePosterConfigurations
{
  p_activePosterLocuint64_t k = &self->_activePosterLock;
  os_unfair_lock_lock(&self->_activePosterLock);
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_activePosterLock_roleToActivePosterConfiguration copy];
  os_unfair_lock_unlock(p_activePosterLock);
  return v4;
}

- (BOOL)markPosterConfigurationAsActive:(id)a3 forRole:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_activePosterLocuint64_t k = &self->_activePosterLock;
  os_unfair_lock_lock(&self->_activePosterLock);
  id v9 = [(NSMutableDictionary *)self->_activePosterLock_roleToActivePosterConfiguration objectForKeyedSubscript:v7];
  id v10 = v9;
  if (v9 && ([v9 isEqual:v6] & 1) != 0)
  {
    uint64_t v11 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = v10;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "Bailed; Will not transition Active poster from %{public}@ -> %{public}@",
        (uint8_t *)&v15,
        0x16u);
    }
    BOOL v12 = 0;
  }
  else
  {
    activePosterLock_roleToActivePosterConfiguratiouint64_t n = self->_activePosterLock_roleToActivePosterConfiguration;
    if (v6) {
      [(NSMutableDictionary *)activePosterLock_roleToActivePosterConfiguration setObject:v6 forKeyedSubscript:v7];
    }
    else {
      [(NSMutableDictionary *)activePosterLock_roleToActivePosterConfiguration removeObjectForKey:v7];
    }
    uint64_t v11 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      id v16 = v10;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "Transitioned Active poster from %{public}@ -> %{public}@", (uint8_t *)&v15, 0x16u);
    }
    BOOL v12 = 1;
  }

  os_unfair_lock_unlock(p_activePosterLock);
  return v12;
}

- (id)posterDescriptorsForOperation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_stateLocuint64_t k = &self->_stateLock;
    os_unfair_lock_lock(&self->_stateLock);
    if ([v4 isCancelled])
    {
      id v6 = 0;
    }
    else
    {
      id v7 = [v4 extensionBundleIdentifier];
      uint64_t v8 = [(PBFPosterExtensionDataStore *)self _stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:v7];
      id v9 = (void *)v8;
      id v10 = (void *)MEMORY[0x1E4F1CBF0];
      if (v8) {
        id v10 = (void *)v8;
      }
      id v6 = v10;
    }
    os_unfair_lock_unlock(p_stateLock);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier:(id)a3 preReloadDescriptors:(id)a4 postReloadDescriptors:(id)a5 error:(id *)a6
{
  uint64_t v211 = *MEMORY[0x1E4F143B8];
  long long v153 = (__CFString *)a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  id v160 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  long long v192 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v192 objects:v210 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v193;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v193 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v192 + 1) + 8 * i);
        __int16 v17 = [v16 descriptorIdentifier];
        [v160 setObject:v16 forKey:v17];

        id v18 = (void *)[objc_alloc(MEMORY[0x1E4F92650]) _initWithPath:v16];
        [v10 addObject:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v192 objects:v210 count:16];
    }
    while (v13);
  }
  uint64_t v136 = v10;

  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  id obj = v9;
  uint64_t v20 = [obj countByEnumeratingWithState:&v188 objects:v209 count:16];
  long long v158 = v19;
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v189;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v189 != v22) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(__CFString **)(*((void *)&v188 + 1) + 8 * v23);
        int v25 = [(__CFString *)v24 descriptorIdentifier];
        id v26 = v25;
        if (!v25)
        {
          long long v28 = PBFLogPosterContents();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v204 = v24;
            uint64_t v30 = v28;
            id v31 = "dropping replacement descriptor that is missing its descriptorIdentifier : %@";
            uint32_t v32 = 12;
            goto LABEL_22;
          }
LABEL_23:

          goto LABEL_24;
        }
        if (![(__CFString *)v25 length])
        {
          long long v28 = PBFLogPosterContents();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v204 = v24;
            __int16 v205 = 2112;
            v206 = v153;
            __int16 v207 = 2112;
            unint64_t v208 = v26;
            uint64_t v30 = v28;
            id v31 = "dropping replacement descriptor %@ for provider %@; its descriptorIdentifier's length is less than 1 : %@";
            uint32_t v32 = 32;
LABEL_22:
            _os_log_impl(&dword_1D31CE000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
          }
          goto LABEL_23;
        }
        long long v27 = [v19 objectForKey:v26];

        if (v27)
        {
          long long v28 = PBFLogPosterContents();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = [v19 objectForKey:v26];
            *(_DWORD *)buf = 138412802;
            uint64_t v204 = v26;
            __int16 v205 = 2112;
            v206 = v29;
            __int16 v207 = 2112;
            unint64_t v208 = v24;
            _os_log_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_DEFAULT, "multiple paths returned for descriptorIdentifier='%@' : dropping previous=%@ in favor of %@", buf, 0x20u);

            uint64_t v19 = v158;
          }
          goto LABEL_23;
        }
        [v19 setObject:v24 forKey:v26];
LABEL_24:

        ++v23;
      }
      while (v21 != v23);
      uint64_t v33 = [obj countByEnumeratingWithState:&v188 objects:v209 count:16];
      uint64_t v21 = v33;
    }
    while (v33);
  }

  unint64_t v34 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v184 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  id v35 = v11;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v184 objects:v202 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v185;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v185 != v38) {
          objc_enumerationMutation(v35);
        }
        id v40 = *(void **)(*((void *)&v184 + 1) + 8 * j);
        os_signpost_id_t v41 = [v40 descriptorIdentifier];
        [v34 setObject:v40 forKey:v41];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v184 objects:v202 count:16];
    }
    while (v37);
  }

  os_signpost_id_t v42 = v153;
  uint64_t v157 = [(PBFPosterExtensionDataStore *)self _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:v153];
  if (!v157)
  {
    if (a6)
    {
      id v76 = (void *)MEMORY[0x1E4F28C58];
      id v200 = @"extensionBundleIdentifier";
      if (v153) {
        id v77 = v153;
      }
      else {
        id v77 = @"(null extensionBundleIdentifier)";
      }
      uint64_t v201 = v77;
      id v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v201 forKeys:&v200 count:1];
      objc_msgSend(v76, "pbf_dataStoreErrorWithCode:userInfo:", -2217, v78);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v74 = 0;
LABEL_133:
    BOOL v75 = 0;
    goto LABEL_135;
  }
  id v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(obj, "count"));
  long long v180 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  uint64_t v44 = [v19 allKeys];
  uint64_t v143 = [v44 countByEnumeratingWithState:&v180 objects:v199 count:16];
  if (!v143)
  {

    char v137 = 0;
LABEL_80:
    long long v176 = 0u;
    long long v177 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    id v79 = [v34 allKeys];
    uint64_t v80 = [v79 countByEnumeratingWithState:&v174 objects:v198 count:16];
    if (v80)
    {
      uint64_t v81 = v80;
      uint64_t v82 = *(void *)v175;
      do
      {
        for (uint64_t k = 0; k != v81; ++k)
        {
          if (*(void *)v175 != v82) {
            objc_enumerationMutation(v79);
          }
          uint64_t v84 = *(void *)(*((void *)&v174 + 1) + 8 * k);
          os_signpost_id_t v85 = [v34 objectForKeyedSubscript:v84];
          id v86 = [v43 objectForKey:v84];
          if (v86)
          {
          }
          else
          {
            BOOL v87 = [v160 objectForKey:v84];

            if (!v87) {
              [v43 setObject:v85 forKey:v84];
            }
          }

          uint64_t v19 = v158;
        }
        uint64_t v81 = [v79 countByEnumeratingWithState:&v174 objects:v198 count:16];
      }
      while (v81);
    }

    unint64_t v88 = [v43 allValues];
    BOOL v89 = (void *)[v88 copy];

    int v90 = self;
    os_signpost_id_t v42 = v153;
    uint64_t v74 = [(PBFPosterExtensionDataStore *)self _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:v153];

    if (!v74) {
      goto LABEL_129;
    }
    char v91 = (void *)MEMORY[0x1E4F1CAD0];
    long long v92 = [v160 allKeys];
    long long v93 = [v91 setWithArray:v92];
    long long v94 = v93;
    if (v93)
    {
      id v95 = v93;
    }
    else
    {
      id v95 = [MEMORY[0x1E4F1CAD0] set];
    }
    id v148 = v95;
    char v96 = v137;

    uint64_t v97 = (void *)MEMORY[0x1E4F1CAD0];
    id v98 = [v43 allKeys];
    id v99 = [v97 setWithArray:v98];
    id v100 = v99;
    if (v99)
    {
      id v101 = v99;
    }
    else
    {
      id v101 = [MEMORY[0x1E4F1CAD0] set];
    }
    id v102 = v101;
    int v90 = self;

    id v146 = v89;
    long long v152 = v102;
    if (([v148 isEqual:v102] & 1) == 0)
    {
      long long v172 = 0u;
      long long v173 = 0u;
      long long v170 = 0u;
      long long v171 = 0u;
      id v155 = v148;
      uint64_t v103 = [v155 countByEnumeratingWithState:&v170 objects:v197 count:16];
      if (v103)
      {
        uint64_t v104 = v103;
        uint64_t v105 = *(void *)v171;
        do
        {
          for (uint64_t m = 0; m != v104; ++m)
          {
            if (*(void *)v171 != v105) {
              objc_enumerationMutation(v155);
            }
            uint64_t v107 = *(void *)(*((void *)&v170 + 1) + 8 * m);
            if (([v102 containsObject:v107] & 1) == 0)
            {
              long long v108 = [v160 objectForKey:v107];
              long long v109 = [v108 serverIdentity];

              long long v110 = [(__CFString *)v109 posterUUID];
              id v169 = 0;
              int v111 = [v157 teardownDynamicDescriptorStoreCoordinatorForPosterUUID:v110 error:&v169];
              id v112 = (__CFString *)v169;

              if (v111) {
                BOOL v113 = v112 == 0;
              }
              else {
                BOOL v113 = 0;
              }
              if (!v113)
              {
                uint64_t v114 = PBFLogPosterContents();
                if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v204 = v109;
                  __int16 v205 = 2112;
                  v206 = v112;
                  _os_log_error_impl(&dword_1D31CE000, v114, OS_LOG_TYPE_ERROR, "failed to remove descriptor from extension store coordinator '%@': %@", buf, 0x16u);
                }
              }
              char v96 = 1;
              id v102 = v152;
            }
          }
          uint64_t v104 = [v155 countByEnumeratingWithState:&v170 objects:v197 count:16];
        }
        while (v104);
      }
      char v137 = v96;

      os_signpost_id_t v42 = v153;
      int v90 = self;
    }
    v167[0] = MEMORY[0x1E4F143A8];
    v167[1] = 3221225472;
    v167[2] = __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke;
    v167[3] = &unk_1E6981688;
    id v115 = v157;
    id v168 = v115;
    uint64_t v116 = objc_msgSend(obj, "bs_mapNoNulls:", v167);
    uint64_t v117 = [v115 providerInfoObjectForKey:@"kProactiveDynamicPosterDescriptorOrdering"];
    char v118 = [v116 isEqualToArray:v117];

    long long v156 = v116;
    if (v118)
    {
      if ((v137 & 1) == 0)
      {
        uint64_t v74 = 0;
        uint64_t v19 = v158;
        id v119 = v116;
LABEL_128:
        BOOL v89 = v146;

LABEL_129:
        if (v137)
        {

          [(PBFPosterExtensionDataStore *)v90 _notifyObserversDidUpdatePosterDescriptorsForExtensionBundleIdentifier:v42];
          BOOL v75 = [(PBFPosterExtensionDataStore *)v90 _stateLock_issueDescriptorUpdatedEventsForExtension:v42 preUpdate:v136 postUpdate:v74 error:a6];
          goto LABEL_135;
        }
        int v131 = [(NSMutableDictionary *)v90->_stateLock_descriptorsForExtensionBundleIdentifier objectForKeyedSubscript:v42];
        uint64_t v132 = [v131 count];

        if (!v132) {
          [(NSMutableDictionary *)v90->_stateLock_descriptorsForExtensionBundleIdentifier setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:v42];
        }

        goto LABEL_133;
      }
    }
    else
    {
      [v115 providerInfoSetObject:v116 forKey:@"kProactiveDynamicPosterDescriptorOrdering"];
      char v137 = 1;
    }
    uint64_t v120 = (void *)[(NSMutableDictionary *)v90->_stateLock_descriptorsForExtensionBundleIdentifier copy];
    id v121 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v120];
    uint64_t v122 = [v115 dynamicPosterDescriptorLatestVersionPaths];
    v123 = [v122 allObjects];
    id v124 = [v123 sortedArrayUsingSelector:sel_compareDescriptorIdentifiers_];
    [v121 setObject:v124 forKeyedSubscript:v42];

    id v144 = (void *)[v121 copy];
    uint64_t v74 = objc_opt_new();
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    uint64_t v150 = v121;
    uint64_t v125 = [v121 objectForKeyedSubscript:v42];
    uint64_t v126 = [v125 countByEnumeratingWithState:&v163 objects:v196 count:16];
    if (v126)
    {
      uint64_t v127 = v126;
      uint64_t v128 = *(void *)v164;
      do
      {
        for (uint64_t n = 0; n != v127; ++n)
        {
          if (*(void *)v164 != v128) {
            objc_enumerationMutation(v125);
          }
          uint64_t v130 = (void *)[objc_alloc(MEMORY[0x1E4F92650]) _initWithPath:*(void *)(*((void *)&v163 + 1) + 8 * n)];
          [v74 addObject:v130];
        }
        uint64_t v127 = [v125 countByEnumeratingWithState:&v163 objects:v196 count:16];
      }
      while (v127);
    }

    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_2;
    v161[3] = &unk_1E69816D8;
    id v162 = obj;
    [v74 sortUsingComparator:v161];
    int v90 = self;
    [(PBFPosterExtensionDataStore *)self _stateLock_updateGalleryWithSuggestedLayout:0 descriptorsByExtensionBundleIdentifier:v144 staticDescriptorsByExtensionBundleIdentifier:0];

    os_signpost_id_t v42 = v153;
    id v119 = v156;
    uint64_t v19 = v158;
    goto LABEL_128;
  }
  id v141 = v44;
  id v46 = 0;
  char v137 = 0;
  uint64_t v47 = *(void *)v181;
  *(void *)&long long v45 = 138412290;
  long long v134 = v45;
  uint64_t v140 = *(void *)v181;
  do
  {
    uint64_t v48 = 0;
    do
    {
      int v149 = v46;
      if (*(void *)v181 != v47) {
        objc_enumerationMutation(v141);
      }
      id v49 = *(void **)(*((void *)&v180 + 1) + 8 * v48);
      objc_msgSend(v158, "objectForKey:", v49, v134);
      uint64_t v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v51 = [v160 objectForKey:v49];
      long long v154 = [v34 objectForKey:v49];
      uint64_t v52 = [(__CFString *)v50 role];
      uint64_t v53 = v49;
      id v179 = 0;
      long long v151 = v53;
      char v54 = objc_msgSend(v157, "dynamicDescriptorStoreCoordinatorForIdentifier:role:createIfNil:error:");
      long long v55 = (__CFString *)v179;
      long long v145 = v54;
      id v147 = (void *)v52;
      if (!v55)
      {
        uint64_t v142 = [(__CFString *)v50 serverIdentity];
        if (v142)
        {
          if (v51
            && ([(__CFString *)v51 identity],
                uint64_t v60 = objc_claimAutoreleasedReturnValue(),
                int v61 = [v60 isEqual:v142],
                v60,
                v61))
          {
            BOOL v56 = v51;
            if (v154)
            {
              uint64_t v62 = [v154 descriptorIdentifier];
              [v43 setObject:v154 forKey:v62];
              uint64_t v63 = (void *)v62;
              int v59 = 0;
              id v46 = v149;
              goto LABEL_53;
            }
            log = PBFLogPosterContents();
            uint64_t v47 = v140;
            id v46 = v149;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v134;
              uint64_t v204 = v51;
              _os_log_impl(&dword_1D31CE000, log, OS_LOG_TYPE_DEFAULT, "skipping non-updated descriptor that was deleted during the update callout : %@", buf, 0xCu);
            }
            int v59 = 0;
LABEL_60:
            uint64_t v63 = log;
          }
          else
          {
            uint64_t v64 = PBFLogPosterContents();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v204 = v50;
              __int16 v205 = 2112;
              v206 = v51;
              _os_log_error_impl(&dword_1D31CE000, v64, OS_LOG_TYPE_ERROR, "returned descriptor isn't new but fails to match a previous descriptor : new=%@ previous=%@", buf, 0x16u);
            }
            BOOL v56 = v51;

            objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2214, 0);
            id v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
            int v59 = 8;
            uint64_t v63 = v149;
LABEL_53:
            uint64_t v47 = v140;
          }

          id v58 = (void *)v142;
          goto LABEL_62;
        }
        uint64_t v65 = [(__CFString *)v50 contentsURL];
        id v178 = 0;
        uint64_t v66 = [v54 addNewVersionWithContents:v65 error:&v178];
        id v46 = (__CFString *)v178;

        log = v66;
        if (v46)
        {
          BOOL v56 = v51;
          uint64_t v67 = PBFLogPosterContents();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v204 = v151;
            __int16 v205 = 2112;
            v206 = v46;
            _os_log_error_impl(&dword_1D31CE000, v67, OS_LOG_TYPE_ERROR, "bailing update: failed to save updated descriptor '%@' with error: %@", buf, 0x16u);
          }

          int v59 = 8;
        }
        else
        {
          uint64_t v68 = v66;
          BOOL v56 = v51;
          BOOL v69 = (void *)MEMORY[0x1E4F924D0];
          id v70 = [v157 containerURL];
          id v71 = [v69 pathWithProviderURL:v70 identity:v68];

          id v72 = [v71 descriptorIdentifier];
          [v43 setObject:v71 forKey:v72];

          int v59 = 0;
          char v137 = 1;
          id v46 = v149;
        }
        uint64_t v47 = v140;
        goto LABEL_60;
      }
      BOOL v56 = v51;
      long long v57 = PBFLogPosterContents();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v204 = v151;
        __int16 v205 = 2112;
        v206 = v55;
        _os_log_error_impl(&dword_1D31CE000, v57, OS_LOG_TYPE_ERROR, "bailing update: descriptor '%@' cannot create a descriptorStoreCoordinator for reason: %@", buf, 0x16u);
      }

      id v46 = v55;
      id v58 = v149;
      int v59 = 8;
LABEL_62:

      if (v59) {
        goto LABEL_69;
      }
      ++v48;
    }
    while (v143 != v48);
    uint64_t v73 = [v141 countByEnumeratingWithState:&v180 objects:v199 count:16];
    uint64_t v143 = v73;
  }
  while (v73);
LABEL_69:

  uint64_t v19 = v158;
  if (!v46) {
    goto LABEL_80;
  }
  if (a6) {
    *a6 = v46;
  }

  uint64_t v74 = 0;
  BOOL v75 = 0;
  os_signpost_id_t v42 = v153;
LABEL_135:

  return v75;
}

id __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 descriptorIdentifier];
  id v4 = [*(id *)(a1 + 32) dynamicDescriptorStoreCoordinatorForIdentifier:v3];
  id v5 = [v4 posterUUID];
  id v6 = [v5 UUIDString];

  return v6;
}

uint64_t __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_3;
  v24[3] = &unk_1E69816B0;
  id v25 = v5;
  id v8 = v5;
  id v9 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v24);
  uint64_t v10 = [v7 indexOfObject:v9];

  id v11 = *(void **)(a1 + 32);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_4;
  uint64_t v22 = &unk_1E69816B0;
  id v23 = v6;
  id v12 = v6;
  uint64_t v13 = objc_msgSend(v11, "bs_firstObjectPassingTest:", &v19);
  uint64_t v14 = objc_msgSend(v11, "indexOfObject:", v13, v19, v20, v21, v22);

  int v15 = [NSNumber numberWithUnsignedInteger:v10];
  id v16 = [NSNumber numberWithUnsignedInteger:v14];
  uint64_t v17 = [v15 compare:v16];

  return v17;
}

uint64_t __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 descriptorIdentifier];
  id v4 = [*(id *)(a1 + 32) _path];
  id v5 = [v4 descriptorIdentifier];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

uint64_t __145__PBFPosterExtensionDataStore__stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier_preReloadDescriptors_postReloadDescriptors_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 descriptorIdentifier];
  id v4 = [*(id *)(a1 + 32) _path];
  id v5 = [v4 descriptorIdentifier];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

- (BOOL)_stateLock_issueDescriptorUpdatedEventsForExtension:(id)a3 preUpdate:(id)a4 postUpdate:(id)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((BSEqualArrays() & 1) == 0 && [v10 length])
  {
    unint64_t v34 = a6;
    id v35 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v33 = self;
    id obj = [(NSDictionary *)self->_roleToRoleCoordinator keyEnumerator];
    uint64_t v39 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v39)
    {
      uint64_t v13 = *(void *)v45;
      uint64_t v36 = *(void *)v45;
      id v37 = v12;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(obj);
          }
          int v15 = *(NSObject **)(*((void *)&v44 + 1) + 8 * v14);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __110__PBFPosterExtensionDataStore__stateLock_issueDescriptorUpdatedEventsForExtension_preUpdate_postUpdate_error___block_invoke;
          v43[3] = &unk_1E6981700;
          void v43[4] = v15;
          id v16 = objc_msgSend(v11, "bs_mapNoNulls:", v43);
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          void v42[2] = __110__PBFPosterExtensionDataStore__stateLock_issueDescriptorUpdatedEventsForExtension_preUpdate_postUpdate_error___block_invoke_2;
          v42[3] = &unk_1E6981700;
          void v42[4] = v15;
          uint64_t v17 = objc_msgSend(v12, "bs_mapNoNulls:", v42);
          if (([v17 count] || objc_msgSend(v16, "count")) && (BSEqualArrays() & 1) == 0)
          {
            id v19 = v11;
            uint64_t v20 = v10;
            id v18 = +[PBFPosterDataStoreEventBuilder descriptorsUpdatedForProvider:v10 role:v15 from:v16 to:v17];
            id v41 = 0;
            uint64_t v21 = [v18 buildWithError:&v41];
            id v22 = v41;
            id v23 = PBFLogDataStore();
            id v24 = v23;
            if (v22 || !v21)
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                id v49 = v15;
                __int16 v50 = 2114;
                uint64_t v51 = v20;
                __int16 v52 = 2114;
                id v53 = v22;
                _os_log_error_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_ERROR, "Error building PBFPosterDataStoreEvent for role %{public}@ extension %{public}@ reloadDescriptors: %{public}@", buf, 0x20u);
              }
            }
            else
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                id v49 = v15;
                __int16 v50 = 2114;
                uint64_t v51 = v20;
                _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "Built PBFPosterDataStoreEvent for role %{public}@ extension %{public}@ reloadDescriptors", buf, 0x16u);
              }

              [v35 addObject:v21];
            }

            uint64_t v10 = v20;
            id v11 = v19;
            uint64_t v13 = v36;
            id v12 = v37;
          }
          else
          {
            id v18 = PBFLogDataStore();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v49 = v15;
              __int16 v50 = 2114;
              uint64_t v51 = v10;
              _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "Skipping building PBFPosterDataStoreEvent for role %{public}@ extension %{public}@ reloadDescriptors: no posters for role", buf, 0x16u);
            }
          }

          ++v14;
        }
        while (v39 != v14);
        uint64_t v39 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
      }
      while (v39);
    }

    uint64_t v25 = [v35 count];
    id v26 = PBFLogDataStore();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v10;
        _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "Issuing PBFPosterDataStoreEvents for extension %{public}@ reloadDescriptors", buf, 0xCu);
      }

      id v40 = 0;
      BOOL v28 = [(PBFPosterExtensionDataStore *)v33 _stateLock_processEvents:v35 context:0 error:&v40];
      id v26 = v40;
      uint64_t v29 = PBFLogDataStore();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      if (v28 && !v26)
      {
        if (v30)
        {
          *(_DWORD *)buf = 138543362;
          id v49 = v10;
          _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "Successfully issued PBFPosterDataStoreEvents for extension %{public}@ reloadDescriptors", buf, 0xCu);
        }

        BOOL v31 = 1;
        goto LABEL_40;
      }
      if (v30)
      {
        *(_DWORD *)buf = 138543618;
        id v49 = v10;
        __int16 v50 = 2114;
        uint64_t v51 = v26;
        _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "Failed to process PBFPosterDataStoreEvents for extension %{public}@ reloadDescriptors: %{public}@", buf, 0x16u);
      }

      if (v34)
      {
        id v26 = v26;
        BOOL v31 = 0;
        *unint64_t v34 = v26;
LABEL_40:

        goto LABEL_41;
      }
    }
    else if (v27)
    {
      *(_DWORD *)buf = 138543362;
      id v49 = v10;
      _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "Bailing PBFPosterDataStoreEvents for extension %{public}@ reloadDescriptors; no events generated",
        buf,
        0xCu);
    }
    BOOL v31 = 0;
    goto LABEL_40;
  }
  BOOL v31 = 0;
LABEL_41:

  return v31;
}

id __110__PBFPosterExtensionDataStore__stateLock_issueDescriptorUpdatedEventsForExtension_preUpdate_postUpdate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 role];
  LODWORD(a1) = [v4 isEqual:*(void *)(a1 + 32)];

  if (a1) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

id __110__PBFPosterExtensionDataStore__stateLock_issueDescriptorUpdatedEventsForExtension_preUpdate_postUpdate_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 role];
  LODWORD(a1) = [v4 isEqual:*(void *)(a1 + 32)];

  if (a1) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:(id)a3 reason:(id)a4 powerLogReason:(int64_t)a5 postEnqueueGalleryUpdateOptions:(unint64_t)a6 sessionInfo:(id)a7 completion:(id)a8
{
  v118[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = (void (**)(id, void, PFPosterExtensionProvider *))a8;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v21 = v15;
    NSClassFromString(&cfstr_Nsstring.isa);
    if (!v21)
    {
      id v58 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:]();
      }
      [v58 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D31FB930);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v59 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:].cold.4();
      }
      [v59 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D31FB994);
    }

    id v22 = v21;
    BOOL v75 = v22;
    if (![(PBFPosterExtensionDataStore *)self _stateLock_hasBeenUnlockedSinceBoot])
    {
      BOOL v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v117 = @"providerIdentifier";
      v118[0] = v22;
      BOOL v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:&v117 count:1];
      objc_msgSend(v27, "pbf_dataStoreErrorWithCode:userInfo:", -2205, v28);
      uint64_t v74 = (PFPosterExtensionProvider *)objc_claimAutoreleasedReturnValue();

      v18[2](v18, 0, v74);
      uint64_t v20 = 0;
LABEL_59:

      goto LABEL_60;
    }
    uint64_t v74 = self->_extensionProvider;
    id v23 = [(PFPosterExtensionProvider *)v74 extensionForIdentifier];
    uint64_t v73 = [v23 objectForKey:v22];

    if (v73)
    {
      id v24 = [v73 posterExtensionInfoPlist];
      char v25 = objc_msgSend(v24, "pbf_supportsDynamicDescriptors");

      if (v25)
      {
        id v72 = NSStringFromSelector(a2);
        id v102 = 0;
        id v71 = [(PFPosterExtensionProvider *)v74 acquireInstanceForExtensionWithIdentifier:v75 reason:v72 error:&v102];
        id v26 = (PFPosterExtensionProvider *)v102;
        if (v26)
        {
          if (v18) {
            v18[2](v18, 0, v26);
          }
          uint64_t v20 = 0;
        }
        else
        {
          id v101 = 0;
          id v70 = objc_msgSend(v71, "pr_assetUpdaterWithError:", &v101);
          BOOL v69 = (PFPosterExtensionProvider *)v101;
          if (v69 || !v70)
          {
            uint64_t v39 = PBFLogReloadDescriptors();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              -[PBFPosterExtensionDataStore _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:](a2);
            }

            if (v18) {
              v18[2](v18, 0, v69);
            }
            [(PFPosterExtensionProvider *)v74 relinquishExtensionInstanceWithIdentifier:v75 reason:v72];
            uint64_t v20 = 0;
          }
          else
          {
            uint64_t v67 = objc_msgSend(v71, "pr_reloadDescriptorOperations");
            unint64_t v34 = PBFLogReloadDescriptors();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v75;
              _os_log_impl(&dword_1D31CE000, v34, OS_LOG_TYPE_DEFAULT, "Preparing reloadDescriptors operation for bundle identifier %{public}@", buf, 0xCu);
            }

            id v35 = PBFLogReloadDescriptors();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v67;
              _os_log_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEFAULT, "Existing operations: %{public}@", buf, 0xCu);
            }

            uint64_t v68 = [(PBFPosterExtensionDataStore *)self _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:v75];
            if (v68)
            {
              objc_initWeak(&location, self);
              if (v17 && ![v17 isEmpty]) {
                goto LABEL_46;
              }
              v97[0] = MEMORY[0x1E4F143A8];
              v97[1] = 3221225472;
              v97[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke;
              v97[3] = &unk_1E6981728;
              id v64 = v75;
              id v98 = v64;
              id v99 = 0;
              objc_msgSend(v67, "bs_firstObjectPassingTest:", v97);
              uint64_t v20 = (PBFPosterExtensionReloadDescriptorsOperation *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                uint64_t v36 = PBFLogReloadDescriptors();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  id v37 = [v17 identifier];
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v64;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v37;
                  _os_log_impl(&dword_1D31CE000, v36, OS_LOG_TYPE_DEFAULT, "Found a matching operation for %{public}@ / %{public}@; adding completion",
                    buf,
                    0x16u);
                }
                v76[0] = MEMORY[0x1E4F143A8];
                v76[1] = 3221225472;
                v76[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_808;
                v76[3] = &unk_1E69817C8;
                id v78 = v18;
                objc_copyWeak(&v79, &location);
                id v77 = v64;
                [(PBFPosterExtensionReloadDescriptorsOperation *)v20 addCompletionObserver:v76];

                objc_destroyWeak(&v79);
                uint64_t v38 = v78;
              }
              else
              {
LABEL_46:
                long long v44 = PBFLogReloadDescriptors();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  long long v45 = [v17 identifier];
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = v75;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v45;
                  *(_WORD *)&buf[22] = 2114;
                  long long v108 = (uint64_t (*)(uint64_t, uint64_t))v67;
                  _os_log_impl(&dword_1D31CE000, v44, OS_LOG_TYPE_DEFAULT, "Found no matching operation for %{public}@ / %{public}@ / %{public}@", buf, 0x20u);
                }
                long long v46 = [v71 extension];
                long long v47 = [v46 posterExtensionBundleIdentifier];
                uint64_t v65 = [@"PBFPosterExtensionReloadDescriptorsOperation reloadDescriptors for " stringByAppendingString:v47];

                uint64_t v62 = (id *)objc_opt_new();
                *(void *)buf = 0;
                *(void *)&buf[8] = buf;
                *(void *)&uint8_t buf[16] = 0x3032000000;
                long long v108 = __Block_byref_object_copy_;
                long long v109 = __Block_byref_object_dispose_;
                id v110 = [(PBFPosterExtensionDataStore *)self acquireSnapshotterInUseAssertionWithReason:v65];
                uint64_t v48 = [(PBFPosterExtensionDataStore *)self _stateLock_knownPosterDescriptorsForExtensionBundleIdentifier:v75];
                id v49 = (void *)v48;
                __int16 v50 = (void *)MEMORY[0x1E4F1CBF0];
                if (v48) {
                  __int16 v50 = (void *)v48;
                }
                id v63 = v50;

                uint64_t v20 = [[PBFPosterExtensionReloadDescriptorsOperation alloc] initWithUpdatingService:v70 extensionBundleIdentifier:v75 sessionInfo:v17 preRefreshPosterDescriptors:v63 runtimeAssertionProvider:self->_runtimeAssertionProvider timeout:a5 powerLogReason:90.0];
                v95[0] = 0;
                v95[1] = v95;
                v95[2] = 0x3042000000;
                v95[3] = __Block_byref_object_copy__796;
                v95[4] = __Block_byref_object_dispose__797;
                objc_initWeak(&v96, v20);
                aBlock[0] = MEMORY[0x1E4F143A8];
                aBlock[1] = 3221225472;
                aBlock[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_798;
                aBlock[3] = &unk_1E6981750;
                uint64_t v60 = v62;
                BOOL v89 = v60;
                long long v93 = v18;
                long long v94 = buf;
                int v90 = v74;
                id v51 = v75;
                id v91 = v51;
                id v92 = v72;
                __int16 v52 = _Block_copy(aBlock);
                v80[0] = MEMORY[0x1E4F143A8];
                v80[1] = 3221225472;
                v80[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2;
                v80[3] = &unk_1E69817A0;
                objc_copyWeak(v87, &location);
                id v61 = v52;
                id v85 = v61;
                id v81 = v68;
                id v66 = v65;
                id v82 = v66;
                id v53 = v51;
                id v83 = v53;
                id v86 = v95;
                id v54 = v71;
                id v84 = v54;
                v87[1] = (id)a6;
                v87[2] = (id)a5;
                [(PBFPosterExtensionReloadDescriptorsOperation *)v20 addCompletionObserver:v80];
                uint64_t v55 = PBFLogReloadDescriptors();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  BOOL v56 = [v17 identifier];
                  *(_DWORD *)uint64_t v103 = 138543618;
                  id v104 = v53;
                  __int16 v105 = 2114;
                  id v106 = v56;
                  _os_log_impl(&dword_1D31CE000, v55, OS_LOG_TYPE_DEFAULT, "Queuing operation for %{public}@ / %{public}@", v103, 0x16u);
                }
                objc_msgSend(v54, "pr_addReloadDescriptorOperation:", v20);

                objc_destroyWeak(v87);
                _Block_object_dispose(v95, 8);
                objc_destroyWeak(&v96);

                _Block_object_dispose(buf, 8);
                uint64_t v38 = v66;
              }

              objc_destroyWeak(&location);
            }
            else
            {
              id v40 = (void *)MEMORY[0x1E4F28C58];
              int v111 = @"providerIdentifier";
              id v112 = v75;
              id v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
              objc_msgSend(v40, "pbf_dataStoreErrorWithCode:userInfo:", -2217, v41);
              os_signpost_id_t v42 = (PFPosterExtensionProvider *)objc_claimAutoreleasedReturnValue();

              if (v18) {
                v18[2](v18, 0, v42);
              }
              id v43 = PBFLogReloadDescriptors();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                -[PBFPosterExtensionDataStore _stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:](a2);
              }

              [(PFPosterExtensionProvider *)v74 relinquishExtensionInstanceWithIdentifier:v75 reason:v72];
              uint64_t v20 = 0;
            }
          }
        }

        goto LABEL_57;
      }
      BOOL v31 = PBFLogReloadDescriptors();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v75;
        _os_log_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_DEFAULT, "Extension %{public}@ doesn't support dynamic descriptors.", buf, 0xCu);
      }

      if (!v18)
      {
        uint64_t v20 = 0;
LABEL_58:

        goto LABEL_59;
      }
      uint32_t v32 = (void *)MEMORY[0x1E4F28C58];
      v113[0] = *MEMORY[0x1E4F28588];
      v113[1] = @"providerIdentifier";
      v114[0] = @"does not support dynamic descriptors";
      v114[1] = v75;
      id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:2];
      objc_msgSend(v32, "pbf_dataStoreErrorWithCode:userInfo:", -2213, v26);
      uint64_t v33 = (PFPosterExtensionProvider *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v33);
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
      id v115 = @"providerIdentifier";
      id v116 = v22;
      BOOL v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
      objc_msgSend(v29, "pbf_dataStoreErrorWithCode:userInfo:", -2220, v30);
      id v26 = (PFPosterExtensionProvider *)objc_claimAutoreleasedReturnValue();

      if (v18) {
        v18[2](v18, 0, v26);
      }
    }
    uint64_t v20 = 0;
LABEL_57:

    goto LABEL_58;
  }
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    id v19 = (PFPosterExtensionProvider *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, 0, v19);
  }
  uint64_t v20 = 0;
LABEL_60:

  return v20;
}

uint64_t __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 extensionBundleIdentifier];
    if ([v4 isEqual:*(void *)(a1 + 32)]) {
      uint64_t v5 = [*(id *)(a1 + 40) hasUniqueSessionInfo] ^ 1;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_798(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1D9433EF0]();
  if ([*(id *)(a1 + 32) signal])
  {
    uint64_t v7 = *(void *)(a1 + 64);
    if (v7) {
      (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v10, v5);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) invalidate];
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;

    [*(id *)(a1 + 40) relinquishExtensionInstanceWithIdentifier:*(void *)(a1 + 48) reason:*(void *)(a1 + 56)];
  }
}

void __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v8 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v11 = *(void *)(a1 + 64);
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28588];
    v51[0] = @"Data store invalidated before operation could finish.";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    uint64_t v14 = objc_msgSend(v12, "pbf_generalErrorWithCode:userInfo:", 3, v13);
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v14);

    goto LABEL_28;
  }
  if (v6)
  {
    id v9 = [v6 domain];
    if ([v9 isEqualToString:PBFGeneralErrorDomain]) {
      BOOL v10 = [v6 code] == 4;
    }
    else {
      BOOL v10 = 0;
    }

    char v25 = [v6 domain];
    if ([v25 isEqualToString:PBFPosterExtensionDataStoreErrorDomain]) {
      BOOL v26 = [v6 code] == -2204;
    }
    else {
      BOOL v26 = 0;
    }

    BOOL v27 = PBFLogReloadDescriptors();
    BOOL v28 = v27;
    if (v10 || v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v47 = v5;
        __int16 v48 = 2114;
        id v49 = v6;
        _os_log_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_DEFAULT, "Cancelled %{public}@: %{public}@", buf, 0x16u);
      }

      if (!v5) {
        goto LABEL_27;
      }
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_cold_2();
      }

      [*(id *)(a1 + 32) updateLastRefreshDescriptorDateWithReason:*(void *)(a1 + 40)];
      if (!v5) {
        goto LABEL_27;
      }
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    void v40[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_806;
    v40[3] = &unk_1E6981220;
    id v42 = *(id *)(a1 + 64);
    id v41 = v6;
    [v5 invalidateAssertionsWithCompletion:v40];

    goto LABEL_28;
  }
  os_unfair_lock_lock(WeakRetained + 47);
  uint64_t v15 = *(void *)(a1 + 48);
  id v16 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  id v17 = [v16 preRefreshPosterDescriptors];
  id v18 = [v5 postRefreshPosterDescriptors];
  id v45 = 0;
  int v19 = [(os_unfair_lock_s *)v8 _stateLock_ingestReloadedDescriptorsForExtensionBundleIdentifier:v15 preReloadDescriptors:v17 postReloadDescriptors:v18 error:&v45];
  id v20 = v45;

  os_unfair_lock_unlock(v8 + 47);
  [*(id *)(a1 + 32) updateLastRefreshDescriptorDateWithReason:*(void *)(a1 + 40)];
  id v21 = *(void **)(a1 + 32);
  id v22 = [*(id *)(a1 + 56) extension];
  id v23 = [v22 persistentIdentifier];
  [v21 providerInfoSetObject:v23 forKey:@"PersistentIdentifier"];

  if (v20)
  {
    id v24 = PBFLogReloadDescriptors();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_cold_1();
    }
  }
  else
  {
    if (!v19 || ([*(id *)&v8[56]._os_unfair_lock_opaque getFlag] & 1) != 0) {
      goto LABEL_25;
    }
    id v24 = [NSString stringWithFormat:@"%@ finished refresh and found new descriptors", *(void *)(a1 + 48)];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_805;
    v43[3] = &unk_1E6981778;
    void v43[4] = v8;
    long long v44 = *(_OWORD *)(a1 + 88);
    [(os_unfair_lock_s *)v8 pushPosterDescriptorsToProactiveForReason:v24 completion:v43];
  }

LABEL_25:
  if (!v5)
  {
LABEL_27:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_28;
  }
  uint64_t v29 = *(void *)(a1 + 48);
  id v39 = 0;
  BOOL v30 = [(os_unfair_lock_s *)v8 posterDescriptorsForExtensionBundleIdentifier:v29 error:&v39];
  id v31 = v39;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_807;
  void v35[3] = &unk_1E6981090;
  id v32 = *(id *)(a1 + 64);
  id v37 = v31;
  id v38 = v32;
  id v36 = v30;
  id v33 = v31;
  id v34 = v30;
  [v5 invalidateAssertionsWithCompletion:v35];

LABEL_28:
}

uint64_t __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_805(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) enqueueGalleryConfigurationUpdateWithOptions:*(void *)(result + 40) powerLogReason:*(void *)(result + 48) completion:0];
  }
  return result;
}

uint64_t __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_806(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_807(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_808(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v9 = *(void *)(a1 + 32);
    id v13 = 0;
    BOOL v10 = [WeakRetained posterDescriptorsForExtensionBundleIdentifier:v9 error:&v13];
    id v11 = v13;

    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v10, v11);
    }
  }
}

- (BOOL)_stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:(id)a3 waitForPushToProactive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v61[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    BOOL v10 = PBFLogDataStore();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "deletePosterDescriptorsForExtensionBundleIdentifier:%{public}@ waitForPushToProactive:%{BOOL}u", buf, 0x12u);
    }

    id v11 = objc_opt_new();
    id v38 = objc_opt_new();
    id v37 = [(id)objc_opt_class() supportedRoles];
    uint64_t v12 = [(PBFPosterExtensionDataStore *)self _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:v8];
    id v13 = v12;
    if (v12)
    {
      id v36 = [v12 staticDescriptorStoreCoordinatorsWithError:0];
      if ([v36 count])
      {
        uint64_t v14 = [v13 posterStaticDescriptorLatestVersionPaths];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke;
        void v49[3] = &unk_1E6981520;
        id v50 = v14;
        id v51 = v8;
        id v52 = v38;
        id v53 = v11;
        id v15 = v14;
        [v37 enumerateObjectsUsingBlock:v49];
      }
      id v16 = [v13 dynamicDescriptorStoreCoordinatorsWithError:0];
      if ([v16 count])
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_3;
        v44[3] = &unk_1E6981520;
        id v45 = v13;
        id v46 = v8;
        id v47 = v38;
        id v48 = v11;
        [v37 enumerateObjectsUsingBlock:v44];
      }
      if ([v11 count])
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        long long v57 = __Block_byref_object_copy_;
        id v58 = __Block_byref_object_dispose_;
        id v59 = 0;
        id obj = 0;
        [(PBFPosterExtensionDataStore *)self _stateLock_processEvents:v11 roles:v38 context:0 error:&obj];
        objc_storeStrong(&v59, obj);
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          id v17 = PBFLogDataStore();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[PBFPosterExtensionDataStore _stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:]();
          }
        }
        else
        {
          [v13 teardownAllStaticDescriptorStoreCoordinators];
          [v13 teardownAllDynamicDescriptors];
          [v13 removeLastRefreshDescriptorDate];
          [v13 deleteProviderInfo];
          id v20 = (void *)[(NSMutableDictionary *)self->_stateLock_descriptorsForExtensionBundleIdentifier mutableCopy];
          id v21 = v20;
          if (v20) {
            id v22 = v20;
          }
          else {
            id v22 = objc_opt_new();
          }
          id v17 = v22;

          [v17 removeObjectForKey:v8];
          id v23 = (void *)[(NSMutableDictionary *)self->_stateLock_staticDescriptorsForExtensionBundleIdentifier mutableCopy];
          id v24 = v23;
          if (v23) {
            id v25 = v23;
          }
          else {
            id v25 = (id)objc_opt_new();
          }
          BOOL v26 = v25;

          [v26 removeObjectForKey:v8];
          BOOL v27 = PBFLogDataStore();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v54 = 138543362;
            id v55 = v8;
            _os_log_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEFAULT, "deletePosterDescriptorsForExtensionBundleIdentifier:%{public}@; did successfully remove descriptors",
              v54,
              0xCu);
          }

          [(PBFPosterExtensionDataStore *)self _stateLock_updateGalleryWithSuggestedLayout:0 descriptorsByExtensionBundleIdentifier:v17 staticDescriptorsByExtensionBundleIdentifier:v26];
        }

        BOOL v28 = dispatch_group_create();
        uint64_t v29 = v28;
        if (v6) {
          dispatch_group_enter(v28);
        }
        BOOL v30 = [@"deleteDescriptors ran for " stringByAppendingString:v8];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_815;
        v39[3] = &unk_1E6981818;
        BOOL v42 = v6;
        id v41 = buf;
        id v31 = v29;
        id v40 = v31;
        [(PBFPosterExtensionDataStore *)self _stateLock_pushPosterDescriptorsToProactiveForReason:v30 force:1 completion:v39];
        if (v6)
        {
          dispatch_time_t v32 = dispatch_time(0, 120000000000);
          dispatch_group_wait(v31, v32);
        }
        uint64_t v33 = *(void *)&buf[8];
        if (a5)
        {
          id v34 = *(void **)(*(void *)&buf[8] + 40);
          if (v34)
          {
            *a5 = v34;
            uint64_t v33 = *(void *)&buf[8];
          }
        }
        BOOL v9 = *(void *)(v33 + 40) == 0;

        _Block_object_dispose(buf, 8);
      }
      else
      {
        BOOL v9 = 1;
      }
    }
    else
    {
      id v18 = PBFLogDataStore();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore _stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:]();
      }

      if (!a5)
      {
        BOOL v9 = 0;
LABEL_40:

        goto LABEL_41;
      }
      int v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v60 = *MEMORY[0x1E4F28588];
      id v36 = [NSString stringWithFormat:@"No extension store coordinator tracked for %@", v8];
      v61[0] = v36;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
      objc_msgSend(v19, "pbf_generalErrorWithCode:userInfo:", 1, v16);
      BOOL v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_40;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    BOOL v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_41:

  return v9;
}

void __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) allObjects];
  id v5 = [v4 sortedArrayUsingSelector:sel_compareDescriptorIdentifiers_];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_2;
  v10[3] = &unk_1E69817F0;
  id v6 = v3;
  id v11 = v6;
  uint64_t v7 = objc_msgSend(v5, "bs_mapNoNulls:", v10);

  if ([v7 count])
  {
    id v8 = +[PBFPosterDataStoreEventBuilder staticDescriptorsUpdatedForProvider:*(void *)(a1 + 40) role:v6 from:v7 to:MEMORY[0x1E4F1CBF0]];
    BOOL v9 = [v8 buildWithError:0];

    if (v9)
    {
      [*(id *)(a1 + 48) addObject:v6];
      objc_msgSend(*(id *)(a1 + 56), "bs_safeAddObject:", v9);
    }
  }
}

id __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 role];
  LODWORD(a1) = [v4 isEqual:*(void *)(a1 + 32)];

  if (a1) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F92650]) _initWithPath:v3];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

void __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dynamicPosterDescriptorLatestVersionPaths];
  id v5 = [v4 allObjects];
  id v6 = [v5 sortedArrayUsingSelector:sel_compareDescriptorIdentifiers_];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_4;
  v11[3] = &unk_1E69817F0;
  id v7 = v3;
  id v12 = v7;
  id v8 = objc_msgSend(v6, "bs_mapNoNulls:", v11);

  if ([v8 count])
  {
    BOOL v9 = +[PBFPosterDataStoreEventBuilder descriptorsUpdatedForProvider:*(void *)(a1 + 40) role:v7 from:v8 to:MEMORY[0x1E4F1CBF0]];
    BOOL v10 = [v9 buildWithError:0];

    if (v10)
    {
      [*(id *)(a1 + 48) addObject:v7];
      [*(id *)(a1 + 56) addObject:v10];
    }
  }
}

id __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 role];
  LODWORD(a1) = [v4 isEqual:*(void *)(a1 + 32)];

  if (a1) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F92650]) _initWithPath:v3];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

void __123__PBFPosterExtensionDataStore__stateLock_deletePosterDescriptorsForExtensionBundleIdentifier_waitForPushToProactive_error___block_invoke_815(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(unsigned char *)(a1 + 48))
  {
    id v6 = v5;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    id v5 = v6;
  }
}

- (void)_stateLock_pushPosterDescriptorsToProactiveForReason:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v97[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = (void (**)(id, void, void *))a5;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (!v6)
    {
      int v11 = [(BSAtomicFlag *)self->_isPrewarmingFlag getFlag];
      BOOL stateLock_initialRoleCoordinatorSetupPerformed = self->_stateLock_initialRoleCoordinatorSetupPerformed;
      int v13 = [(BSAtomicFlag *)self->_extensionsCurrentlyUpdatingFlag getFlag];
      if (v11)
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v96 = *MEMORY[0x1E4F28588];
        v97[0] = @"Prewarm is ongoing and force was not specified. At end of prewarm, a push to proactive will occur.";
        id v15 = (void *)MEMORY[0x1E4F1C9E8];
        id v16 = (__CFString **)v97;
        id v17 = &v96;
      }
      else if (stateLock_initialRoleCoordinatorSetupPerformed)
      {
        if (!v13) {
          goto LABEL_15;
        }
        uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v92 = *MEMORY[0x1E4F28588];
        long long v93 = @"Extensions are currently being updated; will be called after extensions finish updating.";
        id v15 = (void *)MEMORY[0x1E4F1C9E8];
        id v16 = &v93;
        id v17 = &v92;
      }
      else
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v94 = *MEMORY[0x1E4F28588];
        id v95 = @"initial role coordinator setup has not been performed.";
        id v15 = (void *)MEMORY[0x1E4F1C9E8];
        id v16 = &v95;
        id v17 = &v94;
      }
      id v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
      int v19 = objc_msgSend(v14, "pbf_generalErrorWithCode:userInfo:", 7, v18);

      if (v19)
      {
        if (v9) {
          v9[2](v9, 0, v19);
        }

        goto LABEL_36;
      }
    }
LABEL_15:
    BOOL v57 = v6;
    id v58 = v9;
    id v20 = PBFLogGallery();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v91 = v8;
      _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "Data Store begin _pushPosterDescriptorsToProactiveForReason:'%{public}@'; begin",
        buf,
        0xCu);
    }
    id v59 = v8;

    uint64_t v60 = objc_opt_new();
    id v21 = objc_opt_new();
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke;
    id v87[3] = &unk_1E6981840;
    id v22 = v21;
    id v88 = v22;
    [(PBFPosterExtensionDataStore *)self _stateLock_enumerateExtensionStoreCoordinators:v87];
    id v23 = [(PFPosterExtensionProvider *)self->_extensionProvider extensionForIdentifier];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    BOOL v56 = v22;
    id v24 = [v22 allObjects];
    id v25 = [v24 sortedArrayUsingSelector:sel_compare_];

    id obj = v25;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v83 objects:v89 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v62 = v23;
      uint64_t v28 = *(void *)v84;
      uint64_t v61 = *(void *)v84;
      id v63 = self;
      do
      {
        uint64_t v29 = 0;
        uint64_t v64 = v27;
        do
        {
          if (*(void *)v84 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void *)(*((void *)&v83 + 1) + 8 * v29);
          id v31 = [v23 objectForKey:v30];
          dispatch_time_t v32 = [v31 posterExtensionInfoPlist];
          char v33 = objc_msgSend(v32, "pbf_supportsGallery");

          if ((v33 & 1) != 0
            || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
                id v34 = objc_claimAutoreleasedReturnValue(),
                [v34 stringArrayForKey:@"ShowSamplePoster"],
                id v35 = objc_claimAutoreleasedReturnValue(),
                int v36 = [v35 containsObject:v30],
                v35,
                v34,
                v36))
          {
            id v37 = [v31 supportedRoles];
            int v38 = objc_msgSend(v37, "bs_containsObjectPassingTest:", &__block_literal_global_828);

            if (v38)
            {
              id v39 = [v31 posterExtensionContainerBundleIdentifier];
              id v40 = [(PBFPosterExtensionDataStore *)self _stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier:v30];
              id v41 = [v40 providerInfoObjectForKey:@"kProactiveDynamicPosterDescriptorOrdering"];
              id v70 = [v40 providerInfoObjectForKey:@"kProactiveStaticPosterDescriptorOrdering"];
              BOOL v42 = self;
              id v43 = [(NSMutableDictionary *)self->_stateLock_descriptorsForExtensionBundleIdentifier objectForKeyedSubscript:v30];
              long long v44 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
              v80[0] = MEMORY[0x1E4F143A8];
              v80[1] = 3221225472;
              v80[2] = __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_3;
              v80[3] = &unk_1E6981868;
              void v80[4] = v30;
              id v45 = v39;
              id v81 = v45;
              id v46 = v44;
              id v82 = v46;
              uint64_t v67 = v43;
              id v47 = objc_msgSend(v43, "bs_mapNoNulls:", v80);
              uint64_t v68 = v41;
              BOOL v69 = v40;
              id v66 = v46;
              if (v41)
              {
                v77[0] = MEMORY[0x1E4F143A8];
                v77[1] = 3221225472;
                v77[2] = __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_833;
                v77[3] = &unk_1E6981890;
                id v78 = v41;
                id v79 = v46;
                uint64_t v48 = [v47 sortedArrayUsingComparator:v77];

                id v47 = (void *)v48;
              }
              id v49 = [(NSMutableDictionary *)v42->_stateLock_staticDescriptorsForExtensionBundleIdentifier objectForKeyedSubscript:v30];
              id v50 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
              v74[0] = MEMORY[0x1E4F143A8];
              v74[1] = 3221225472;
              v74[2] = __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_2_835;
              v74[3] = &unk_1E6981868;
              v74[4] = v30;
              id v51 = v45;
              id v75 = v51;
              id v52 = v50;
              id v76 = v52;
              id v53 = objc_msgSend(v49, "bs_mapNoNulls:", v74);
              if (v70)
              {
                v71[0] = MEMORY[0x1E4F143A8];
                v71[1] = 3221225472;
                v71[2] = __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_3_839;
                v71[3] = &unk_1E6981890;
                id v72 = v70;
                id v73 = v52;
                uint64_t v54 = [v53 sortedArrayUsingComparator:v71];

                id v53 = (void *)v54;
              }
              id v55 = objc_opt_new();
              [v55 addObjectsFromArray:v53];
              [v55 addObjectsFromArray:v47];
              if ([v55 count]) {
                [v60 setObject:v55 forKey:v30];
              }

              id v23 = v62;
              self = v63;
              uint64_t v27 = v64;
              uint64_t v28 = v61;
            }
          }

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
      }
      while (v27);
    }

    BOOL v10 = v60;
    BOOL v9 = v58;
    id v8 = v59;
    [(PBFGalleryController *)self->_galleryController pushUpdatedPosterDescriptors:v60 reason:v59 force:v57 completion:v58];

    goto LABEL_35;
  }
  if (v9)
  {
    BOOL v10 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v9[2](v9, 0, v10);
LABEL_35:
  }
LABEL_36:
}

void __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 extensionIdentifier];
  [v2 addObject:v3];
}

uint64_t __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F927B0] proactiveGallerySupportedForRole:a2];
}

id __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_3(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 role];
  if ([MEMORY[0x1E4F927B0] proactiveGallerySupportedForRole:v4])
  {
    id v5 = [MEMORY[0x1E4F926B0] loadAmbientConfigurationForPath:v3 error:0];
    if ([v5 galleryDisplayBehavior] == 1)
    {
      BOOL v6 = PBFLogGallery();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v3;
        _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "Skipping descriptor when pushing to proactive, gallery display behavior is hidden: %@", (uint8_t *)&v17, 0xCu);
      }

      id v7 = 0;
    }
    else
    {
      id v8 = [v3 descriptorIdentifier];
      BOOL v9 = [v8 stringByAppendingPathExtension:@"DYNAMIC"];

      BOOL v10 = [MEMORY[0x1E4F926B0] loadProactiveGalleryOptions:v3 error:0];
      int v11 = [v10 posterBoardRepresentation];

      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F922F8]) initWithIdentifier:v9 extensionBundleIdentifier:a1[4] containerBundleIdentifier:a1[5] galleryOptions:v11];
      id v12 = (void *)a1[6];
      int v13 = [v3 serverIdentity];
      uint64_t v14 = [v13 posterUUID];
      id v15 = [v14 UUIDString];
      [v12 setObject:v15 forKey:v7];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_833(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  BOOL v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = [v6 objectForKey:a2];
  uint64_t v9 = [v5 indexOfObject:v8];

  BOOL v10 = *(void **)(a1 + 32);
  int v11 = [*(id *)(a1 + 40) objectForKey:v7];

  uint64_t v12 = [v10 indexOfObject:v11];
  int v13 = [NSNumber numberWithInteger:v9];
  uint64_t v14 = [NSNumber numberWithInteger:v12];
  uint64_t v15 = [v13 compare:v14];

  return v15;
}

id __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_2_835(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 role];
  if ([MEMORY[0x1E4F927B0] proactiveGallerySupportedForRole:v4])
  {
    id v5 = [v3 descriptorIdentifier];
    BOOL v6 = [v5 stringByAppendingPathExtension:@"STATIC"];

    id v7 = [MEMORY[0x1E4F926B0] loadProactiveGalleryOptions:v3 error:0];
    id v8 = [v7 posterBoardRepresentation];

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F922F8]) initWithIdentifier:v6 extensionBundleIdentifier:a1[4] containerBundleIdentifier:a1[5] galleryOptions:v8];
    BOOL v10 = (void *)a1[6];
    int v11 = [v3 serverIdentity];
    uint64_t v12 = [v11 posterUUID];
    int v13 = [v12 UUIDString];
    [v10 setObject:v13 forKey:v9];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __101__PBFPosterExtensionDataStore__stateLock_pushPosterDescriptorsToProactiveForReason_force_completion___block_invoke_3_839(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  BOOL v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = [v6 objectForKey:a2];
  uint64_t v9 = [v5 indexOfObject:v8];

  BOOL v10 = *(void **)(a1 + 32);
  int v11 = [*(id *)(a1 + 40) objectForKey:v7];

  uint64_t v12 = [v10 indexOfObject:v11];
  int v13 = [NSNumber numberWithInteger:v9];
  uint64_t v14 = [NSNumber numberWithInteger:v12];
  uint64_t v15 = [v13 compare:v14];

  return v15;
}

- (void)_stateLock_updateGalleryWithSuggestedLayout:(id)a3 descriptorsByExtensionBundleIdentifier:(id)a4 staticDescriptorsByExtensionBundleIdentifier:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag]) {
    goto LABEL_39;
  }
  int v11 = PBFLogPosterContents();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  int v13 = PBFLogPosterContents();
  uint64_t v14 = v13;
  unint64_t v50 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "updateGallery", "", buf, 2u);
  }

  runtimeAssertionProvider = self->_runtimeAssertionProvider;
  id v16 = [MEMORY[0x1E4F96478] currentProcess];
  id v51 = [(PBFRuntimeAssertionProviding *)runtimeAssertionProvider acquirePrewarmRuntimeAssertionForReason:@"updateGallery" target:v16 invalidationHandler:&__block_literal_global_844];

  int v17 = objc_opt_new();
  if (!v8 || self->_stateLock_suggestedLayout && (objc_msgSend(v8, "isEqual:") & 1) != 0)
  {
    char v18 = 0;
    if (!v9) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  uint64_t v19 = (PRSPosterGalleryLayout *)[v8 copy];
  stateLock_suggestedLayout = self->_stateLock_suggestedLayout;
  self->_stateLock_suggestedLayout = v19;

  id v21 = PBFLogPosterContents();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = self->_stateLock_suggestedLayout;
    *(_DWORD *)buf = 138412290;
    BOOL v57 = v22;
    _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "gallery updated with suggestedLayout=%@", buf, 0xCu);
  }

  char v18 = 1;
  if (v9)
  {
LABEL_13:
    if (![(NSMutableDictionary *)self->_stateLock_descriptorsForExtensionBundleIdentifier count]
      || ([v9 isEqual:self->_stateLock_descriptorsForExtensionBundleIdentifier] & 1) == 0)
    {
      id v23 = (NSMutableDictionary *)[v9 mutableCopy];
      stateLock_descriptorsForExtensionBundleIdentifier = self->_stateLock_descriptorsForExtensionBundleIdentifier;
      self->_stateLock_descriptorsForExtensionBundleIdentifier = v23;

      id v25 = PBFLogPosterContents();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = self->_stateLock_descriptorsForExtensionBundleIdentifier;
        *(_DWORD *)buf = 138412290;
        BOOL v57 = v26;
        _os_log_impl(&dword_1D31CE000, v25, OS_LOG_TYPE_DEFAULT, "gallery updated with dynamic descriptors=%@", buf, 0xCu);
      }

      char v18 = 1;
    }
  }
LABEL_18:
  uint64_t v27 = self->_stateLock_descriptorsForExtensionBundleIdentifier;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_845;
  void v54[3] = &unk_1E69818B8;
  id v28 = v17;
  id v55 = v28;
  [(NSMutableDictionary *)v27 enumerateKeysAndObjectsUsingBlock:v54];
  if (v10
    && (![(NSMutableDictionary *)self->_stateLock_staticDescriptorsForExtensionBundleIdentifier count]
     || ([v10 isEqual:self->_stateLock_staticDescriptorsForExtensionBundleIdentifier] & 1) == 0))
  {
    uint64_t v29 = (NSMutableDictionary *)[v10 mutableCopy];
    stateLock_staticDescriptorsForExtensionBundleIdentifier = self->_stateLock_staticDescriptorsForExtensionBundleIdentifier;
    self->_stateLock_staticDescriptorsForExtensionBundleIdentifier = v29;

    id v31 = PBFLogPosterContents();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v32 = self->_stateLock_descriptorsForExtensionBundleIdentifier;
      *(_DWORD *)buf = 138412290;
      BOOL v57 = v32;
      _os_log_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_DEFAULT, "gallery updated with static descriptors=%@", buf, 0xCu);
    }

    char v18 = 1;
  }
  char v33 = self->_stateLock_staticDescriptorsForExtensionBundleIdentifier;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_847;
  v52[3] = &unk_1E69818B8;
  id v34 = v28;
  id v53 = v34;
  [(NSMutableDictionary *)v33 enumerateKeysAndObjectsUsingBlock:v52];
  id v35 = [(PFPosterExtensionProvider *)self->_extensionProvider extensionForIdentifier];
  if (![v35 count]
    || ![(NSMutableDictionary *)self->_stateLock_descriptorsForExtensionBundleIdentifier count]
    || !self->_stateLock_staticDescriptorsForExtensionBundleIdentifier)
  {
    BOOL v36 = 1;
    if ((v18 & 1) == 0) {
      goto LABEL_28;
    }
LABEL_30:
    BOOL v37 = 0;
    goto LABEL_31;
  }
  BOOL v36 = self->_stateLock_suggestedLayout == 0;
  if (v18) {
    goto LABEL_30;
  }
LABEL_28:
  BOOL v37 = self->_stateLock_configuration != 0;
LABEL_31:
  if (!v36 && !v37)
  {
    os_signpost_id_t v48 = v12;
    id v49 = v8;
    int v38 = PBFLogPosterContents();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v38, OS_LOG_TYPE_DEFAULT, "gallery update received; pushing out new gallery object",
        buf,
        2u);
    }

    id v39 = (void *)[(PRSPosterGalleryLayout *)self->_stateLock_suggestedLayout copy];
    id v40 = (void *)[(NSMutableDictionary *)self->_stateLock_descriptorsForExtensionBundleIdentifier copy];
    id v41 = (void *)[(NSMutableDictionary *)self->_stateLock_staticDescriptorsForExtensionBundleIdentifier copy];
    BOOL v42 = [[PBFGalleryConfiguration alloc] initWithSuggestedLayout:v39 dynamicDescriptorsByExtensionIdentifier:v40 staticDescriptorsByExtensionIdentifier:v41 extensionsByIdentifier:v35];
    stateLock_configuratiouint64_t n = self->_stateLock_configuration;
    self->_stateLock_configuratiouint64_t n = v42;
    long long v44 = v42;

    [(PBFGalleryConfiguration *)v44 setSnapshotProvider:self->_snapshotManager];
    [(PBFGalleryConfiguration *)v44 setComplicationSnapshotProvider:self->_complicationSnapshotService];
    id v45 = [(PBFPosterExtensionDataStore *)self extensionProvider];
    [(PBFGalleryConfiguration *)v44 setExtensionProvider:v45];

    [(PBFPosterExtensionDataStore *)self _notifyObserversDidUpdateGalleryConfiguration:v44];
    os_signpost_id_t v12 = v48;
    id v8 = v49;
  }
  objc_msgSend(v51, "invalidate", v48, v49);
  id v46 = PBFLogPosterContents();
  id v47 = v46;
  if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v47, OS_SIGNPOST_INTERVAL_END, v12, "updateGallery", "", buf, 2u);
  }

LABEL_39:
}

void __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = PBFLogPrewarm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_cold_1();
  }
}

uint64_t __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_845(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

uint64_t __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_847(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (void)_stateLock_cleanupStaleSnapshotsNotWithinGallery:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PBFPosterExtensionDataStore *)self _stateLock_extensionStoreCoordinators];
  id v10 = PBFLogPosterContents();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "Dispatching stale snapshot cleanup...", buf, 2u);
  }

  int v11 = NSStringFromSelector(a2);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke;
  v15[3] = &unk_1E69811F8;
  id v16 = v7;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v7;
  PBFDispatchAsyncWithString(v11, QOS_CLASS_DEFAULT, v15);
}

void __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v2 = PBFLogPosterContents();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = PBFLogPosterContents();
  id v5 = v4;
  unint64_t v29 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "_cleanupStaleSnapshotsForOldGallery", "", buf, 2u);
  }
  os_signpost_id_t spid = v3;

  BOOL v6 = PBFLogPosterContents();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "Stale snapshot cleanup begin", buf, 2u);
  }

  id v7 = objc_opt_new();
  id v8 = +[PBFGenericDisplayContext mainScreen];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_849;
  void v49[3] = &unk_1E69818E0;
  id v30 = v8;
  id v50 = v30;
  id v51 = *(id *)(a1 + 32);
  id v34 = v7;
  id v52 = v34;
  PBFSnapshotDefinitionEnumerateSupportedOrientationsForCurrentDeviceClass(v49);
  dispatch_time_t v32 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "extensionIdentifier", spid);
        id v12 = objc_opt_new();
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        void v42[2] = __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_2;
        v42[3] = &unk_1E6981930;
        id v43 = v34;
        id v13 = v12;
        id v44 = v13;
        [v10 enumerateDescriptorStoreCoordinators:v42];
        uint64_t v14 = [v13 count];
        uint64_t v15 = PBFLogPosterContents();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          uint64_t v37 = i;
          if (v16)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v54 = v11;
            _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "Cleaned up stale gallery snapshots for provider %{public}@: ", buf, 0xCu);
          }

          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v36 = v13;
          id v17 = v13;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v57 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v39 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v38 + 1) + 8 * j);
                id v23 = PBFLogPosterContents();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v54 = v11;
                  __int16 v55 = 2114;
                  uint64_t v56 = v22;
                  _os_log_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_DEFAULT, "--%{public}@: %{public}@", buf, 0x16u);
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v57 count:16];
            }
            while (v19);
          }

          [v32 unionSet:v17];
          id v13 = v36;
          uint64_t i = v37;
        }
        else
        {
          if (v16)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v54 = v11;
            _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "No stale gallery snapshots for provider %{public}@; proceeding",
              buf,
              0xCu);
          }
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v35);
  }

  id v24 = PBFLogPosterContents();
  id v25 = v24;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v54 = v32;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v25, OS_SIGNPOST_INTERVAL_END, spid, "_cleanupStaleSnapshotsForOldGallery", "snapshotURLs reaped: %{public}@", buf, 0xCu);
  }

  uint64_t v26 = *(void *)(a1 + 48);
  if (v26) {
    (*(void (**)(void))(v26 + 16))();
  }
  uint64_t v27 = PBFLogPosterContents();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEFAULT, "Stale snapshot cleanup finished", buf, 2u);
  }
}

void __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_849(id *a1, uint64_t a2)
{
  id v4 = [a1[4] displayContextWithUpdatedInterfaceOrientation:a2];
  os_signpost_id_t v3 = [a1[5] snapshotURLsForContext:v4];
  [a1[6] unionSet:v3];
}

void __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 snapshotURLs];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_3;
  v7[3] = &unk_1E6981908;
  id v8 = *(id *)(a1 + 32);
  id v5 = [v4 objectsPassingTest:v7];
  id v6 = (id)[v3 reapSnapshotsMatchingURLs:v5];
  [*(id *)(a1 + 40) unionSet:v5];
}

uint64_t __91__PBFPosterExtensionDataStore__stateLock_cleanupStaleSnapshotsNotWithinGallery_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)_stateLock_pushPosterConfigurationsToProactiveWithCompletion:(id)a3
{
  id v4 = a3;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v6 = self->_stateLock_switcherConfiguration;
    id v7 = [(PRSwitcherConfiguration *)v6 configurations];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke;
    v9[3] = &unk_1E6981248;
    id v10 = v7;
    int v11 = v6;
    id v12 = self;
    id v13 = v4;
    id v5 = v6;
    id v8 = v7;
    PBFDispatchAsyncWithString(@"pushPosterConfigurationsToProactive", QOS_CLASS_UTILITY, v9);

    goto LABEL_5;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    id v5 = (PRSwitcherConfiguration *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, PRSwitcherConfiguration *))v4 + 2))(v4, v5);
LABEL_5:
  }
}

void __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke(uint64_t a1)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_2;
  v9[3] = &unk_1E6981980;
  id v2 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "bs_mapNoNulls:", v9);
  if ([v3 count])
  {
    objc_initWeak(&location, *(id *)(a1 + 48));
    id v4 = [MEMORY[0x1E4F4B040] sharedInstance];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_5;
    v5[3] = &unk_1E69819A8;
    id v6 = *(id *)(a1 + 56);
    objc_copyWeak(&v7, &location);
    [v4 posterBoardDidUpdateConfigurations:v3 completion:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

id __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 _path];
  id v5 = [v4 serverIdentity];
  id v6 = [v5 provider];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) selectedConfiguration];
    unsigned int v42 = [v7 isEqual:v3];

    id v8 = [*(id *)(a1 + 32) activeConfiguration];
    unsigned int v40 = [v8 isEqual:v3];

    id v44 = [v3 loadSuggestionMetadataWithError:0];
    id v9 = [v44 suggestedComplicationsByIdentifier];
    id v10 = [v3 loadComplicationLayoutWithError:0];
    int v11 = [v10 inlineComplication];
    id v43 = v6;
    long long v39 = v11;
    if (v11)
    {
      id v12 = v11;
      id v13 = [v11 uniqueIdentifier];
      uint64_t v14 = [v9 objectForKey:v13];
      long long v41 = ATXComplicationFromPRSWidget(v12, v14);
    }
    else
    {
      long long v41 = 0;
    }
    BOOL v16 = [v10 complications];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_3;
    v48[3] = &unk_1E6981958;
    id v17 = v9;
    id v49 = v17;
    uint64_t v18 = objc_msgSend(v16, "bs_map:", v48);

    uint64_t v19 = [v10 sidebarComplications];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_4;
    v46[3] = &unk_1E6981958;
    id v47 = v17;
    id v38 = v17;
    long long v45 = objc_msgSend(v19, "bs_map:", v46);

    uint64_t v20 = [v3 loadFocusConfigurationWithError:0];
    id v36 = [v20 activityUUID];

    uint64_t v35 = [v3 loadTitleStyleConfigurationWithError:0];
    id v21 = [v35 timeFontConfiguration];
    uint64_t v22 = [v21 uniqueIdentifier];

    id v23 = [v35 effectiveTitleColor];
    id v24 = [v23 identifier];

    id v25 = [v35 effectiveTimeNumberingSystem];
    [v3 _path];
    uint64_t v26 = v37 = v10;
    uint64_t v27 = [v26 serverIdentity];
    id v28 = [v27 posterUUID];
    unint64_t v29 = [v28 UUIDString];

    id v30 = [v44 suggestedGalleryItem];
    id v31 = objc_alloc(MEMORY[0x1E4F4B260]);
    if (v18) {
      dispatch_time_t v32 = v18;
    }
    else {
      dispatch_time_t v32 = (void *)MEMORY[0x1E4F1CBF0];
    }
    if (v45) {
      uint64_t v33 = v45;
    }
    else {
      uint64_t v33 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v6 = v43;
    uint64_t v15 = (void *)[v31 initWithExtensionBundleIdentifier:v43 active:v40 selected:v42 inlineComplication:v41 complications:v32 landscapeComplications:v33 modeUUID:v36 font:v22 color:v24 numberingSystem:v25 posterUUID:v29 galleryItem:v30];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

id __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 uniqueIdentifier];
  id v5 = [v2 objectForKey:v4];
  id v6 = ATXComplicationFromPRSWidget(v3, v5);

  return v6;
}

id __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 uniqueIdentifier];
  id v5 = [v2 objectForKey:v4];
  id v6 = ATXComplicationFromPRSWidget(v3, v5);

  return v6;
}

void __92__PBFPosterExtensionDataStore__stateLock_pushPosterConfigurationsToProactiveWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PBFLogPosterContents();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "- [ATXFaceSuggestionClient posterBoardDidUpdateConfigurations:completion:] -- Error? %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained enqueueGalleryConfigurationUpdateWithOptions:10 powerLogReason:6 completion:0];
}

- (id)buildExtensionProvider
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F924B0]);
  return v2;
}

- (void)_setupExtensionProvider
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

uint64_t __54__PBFPosterExtensionDataStore__setupExtensionProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CB18];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v2, "pbf_ignoredExtensionIdentifiers");
  uint64_t v5 = [v3 bundleIdentifier];

  uint64_t v6 = [v4 containsObject:v5] ^ 1;
  return v6;
}

- (void)_setupExtensionEnvironment
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = PBFLogRoleCoordinator();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  uint64_t v5 = PBFLogRoleCoordinator();
  uint64_t v6 = v5;
  unint64_t v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "_setupExtensionEnvironment", "", buf, 2u);
  }

  uint64_t v8 = [(PBFPosterExtensionDataStore *)self extensionStoreCoordinatorContainerURL];
  uint8_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  p_stateLocuint64_t k = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
  if (!stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier)
  {
    id v38 = &self->_stateLock;
    unint64_t v40 = v4 - 1;
    os_signpost_id_t v41 = v4;
    id v12 = (NSMutableDictionary *)objc_opt_new();
    id v13 = self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
    self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = v12;

    id v53 = 0;
    long long v39 = v9;
    uint64_t v14 = [v9 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:0 options:5 error:&v53];
    id v37 = v53;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v14;
    uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
    if (!v48) {
      goto LABEL_22;
    }
    uint64_t v15 = *(void *)v50;
    os_unfair_lock_t lock = &self->_extensionProvidingLock;
    uint64_t v44 = *MEMORY[0x1E4F28588];
    uint64_t v45 = *(void *)v50;
    long long v46 = v8;
    unsigned int v42 = self;
    while (1)
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v18 = [v8 filePathURL];
        uint64_t v19 = [v17 lastPathComponent];
        uint64_t v20 = [v18 URLByAppendingPathComponent:v19];

        id v21 = [v20 lastPathComponent];
        uint64_t v22 = [[PBFPosterExtensionStoreCoordinator alloc] initWithContainerURL:v20 extensionIdentifier:v21];
        id v23 = v22;
        if (v22)
        {
          id v24 = [(PBFPosterExtensionStoreCoordinator *)v22 setupEnvironmentIfNecessary];
          if (v24) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v58 = v44;
          uint64_t v59 = @"Unable to setup extension store coordinator";
          uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          id v24 = objc_msgSend(v26, "pbf_dataStoreErrorWithCode:userInfo:", -2219, v27);

          if (v24)
          {
LABEL_12:
            id v25 = PBFLogPosterContents();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              __int16 v55 = v20;
              __int16 v56 = 2114;
              BOOL v57 = v24;
              _os_log_error_impl(&dword_1D31CE000, v25, OS_LOG_TYPE_ERROR, "Error setting up extension file system environment at URL '%{public}@': %{public}@", buf, 0x16u);
            }
            goto LABEL_20;
          }
        }
        id v28 = [(PBFPosterExtensionStoreCoordinator *)v23 posterStaticDescriptorLatestVersionPaths];
        unint64_t v29 = [v28 allObjects];
        id v25 = [v29 sortedArrayUsingSelector:sel_compareDescriptorIdentifiers_];

        id v30 = [(PBFPosterExtensionStoreCoordinator *)v23 dynamicPosterDescriptorLatestVersionPaths];
        id v31 = [v30 allObjects];
        dispatch_time_t v32 = [v31 sortedArrayUsingSelector:sel_compareDescriptorIdentifiers_];

        self = v42;
        if ([v32 count]) {
          [(NSMutableDictionary *)v42->_stateLock_descriptorsForExtensionBundleIdentifier setObject:v32 forKeyedSubscript:v21];
        }
        uint64_t v15 = v45;
        if ([v25 count]) {
          [(NSMutableDictionary *)v42->_stateLock_staticDescriptorsForExtensionBundleIdentifier setObject:v25 forKeyedSubscript:v21];
        }
        [(NSMutableDictionary *)v42->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier setObject:v23 forKey:v21];
        os_unfair_lock_lock(lock);
        [(NSMutableDictionary *)v42->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier setObject:v23 forKey:v21];
        os_unfair_lock_unlock(lock);

        uint64_t v8 = v46;
LABEL_20:
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
      if (!v48)
      {
LABEL_22:

        stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier = self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
        unint64_t v7 = v40;
        os_signpost_id_t v4 = v41;
        p_stateLocuint64_t k = v38;
        uint8_t v9 = v39;
        break;
      }
    }
  }
  uint64_t v33 = (NSMutableDictionary *)[(NSMutableDictionary *)stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier mutableCopy];
  os_unfair_lock_unlock(p_stateLock);
  os_unfair_lock_lock(&self->_extensionProvidingLock);
  extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier = self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier;
  self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier = v33;

  os_unfair_lock_unlock(&self->_extensionProvidingLock);
  uint64_t v35 = PBFLogRoleCoordinator();
  id v36 = v35;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v36, OS_SIGNPOST_INTERVAL_END, v4, "_setupExtensionEnvironment", "", buf, 2u);
  }
}

- (void)_stateLock_setupRoleCoordinatorsIfNeeded
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    uint64_t v45 = self;
    id v3 = PBFLogRoleCoordinator();
    os_signpost_id_t spid = os_signpost_id_generate(v3);

    os_signpost_id_t v4 = PBFLogRoleCoordinator();
    uint64_t v5 = v4;
    unint64_t v34 = spid - 1;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "setupRoleCoordinatorsIfNeeded", "", buf, 2u);
    }

    if (!v45->_roleToRoleCoordinator)
    {
      int64_t stateLock_maximumPosterConfigurationCount = v45->_stateLock_maximumPosterConfigurationCount;
      id v43 = (void *)[(NSSet *)v45->_stateLock_fromExtensions copy];
      id v38 = objc_opt_new();
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id obj = [(id)objc_opt_class() supportedRoles];
      uint64_t v44 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v44)
      {
        uint64_t v41 = *MEMORY[0x1E4F92790];
        uint64_t v42 = *(void *)v61;
        uint64_t v39 = *MEMORY[0x1E4F92740];
        uint64_t v36 = *MEMORY[0x1E4F92788];
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v61 != v42) {
              objc_enumerationMutation(obj);
            }
            unint64_t v7 = *(void **)(*((void *)&v60 + 1) + 8 * v6);
            uint64_t v8 = objc_opt_new();
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            id v9 = v43;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v68 count:16];
            if (v10)
            {
              uint64_t v11 = *(void *)v57;
              do
              {
                for (uint64_t i = 0; i != v10; ++i)
                {
                  if (*(void *)v57 != v11) {
                    objc_enumerationMutation(v9);
                  }
                  id v13 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                  uint64_t v14 = objc_msgSend(v13, "supportedRoles", v34);
                  int v15 = [v14 containsObject:v7];

                  if (v15)
                  {
                    BOOL v16 = [v13 posterExtensionBundleIdentifier];
                    [v8 addObject:v16];
                  }
                }
                uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v68 count:16];
              }
              while (v10);
            }

            char v17 = [v7 isEqual:v41];
            uint64_t v18 = off_1E697FB38;
            if ((v17 & 1) != 0
              || (v19 = [v7 isEqual:v39], uint64_t v18 = off_1E697F9C0, (v19 & 1) != 0)
              || (v20 = [v7 isEqual:v36], uint64_t v18 = off_1E697FB20, v20))
            {
              id v21 = (void *)[objc_alloc(*v18) initWithStorage:v45->_database modelCoordinatorProvider:v45 providers:v8];
            }
            else
            {
              id v21 = 0;
            }
            objc_msgSend(v21, "setDelegate:", v45, v34);
            *(void *)buf = 0;
            long long v51 = buf;
            uint64_t v52 = 0x3032000000;
            id v53 = __Block_byref_object_copy_;
            uint64_t v54 = __Block_byref_object_dispose_;
            id v55 = 0;
            database = v45->_database;
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __71__PBFPosterExtensionDataStore__stateLock_setupRoleCoordinatorsIfNeeded__block_invoke;
            v47[3] = &unk_1E69819F0;
            long long v49 = buf;
            id v23 = v21;
            id v48 = v23;
            id v46 = 0;
            BOOL v24 = [(PBFPosterExtensionDataStoreSQLiteDatabase *)database performChanges:v47 error:&v46];
            id v25 = v46;
            uint64_t v26 = v25;
            if (!v23 || *((void *)v51 + 5) || v25 || !v24)
            {
              uint64_t v27 = PBFLogRoleCoordinator();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                id v28 = (void *)*((void *)v51 + 5);
                if (!v28) {
                  id v28 = v26;
                }
                *(_DWORD *)uint64_t v64 = 138543618;
                uint64_t v65 = v7;
                __int16 v66 = 2114;
                uint64_t v67 = v28;
                _os_log_error_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_ERROR, "Failed to setup role coordinator for role '%{public}@': %{public}@", v64, 0x16u);
              }
            }
            else
            {
              [v23 setMaximumNumberOfPosters:stateLock_maximumPosterConfigurationCount];
              uint64_t v27 = [v23 role];
              [v38 setObject:v23 forKey:v27];
            }

            _Block_object_dispose(buf, 8);
            ++v6;
          }
          while (v6 != v44);
          uint64_t v29 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
          uint64_t v44 = v29;
        }
        while (v29);
      }

      uint64_t v30 = [v38 copy];
      roleToRoleCoordinator = v45->_roleToRoleCoordinator;
      v45->_roleToRoleCoordinator = (NSDictionary *)v30;
    }
    dispatch_time_t v32 = PBFLogRoleCoordinator();
    uint64_t v33 = v32;
    if (v34 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v33, OS_SIGNPOST_INTERVAL_END, spid, "setupRoleCoordinatorsIfNeeded", "", buf, 2u);
    }
  }
}

BOOL __71__PBFPosterExtensionDataStore__stateLock_setupRoleCoordinatorsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) setupRoleIfNecessaryWithStorage:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == 0;
}

- (BOOL)resetRole:(id)a3 error:(id *)a4
{
  void v27[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (__CFString *)a3;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    uint64_t v8 = [(NSDictionary *)self->_roleToRoleCoordinator objectForKeyedSubscript:v6];
    if (!v8)
    {
      if (a4)
      {
        uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
        v26[0] = *MEMORY[0x1E4F28588];
        v26[1] = @"role";
        char v19 = @"(null role)";
        if (v6) {
          char v19 = v6;
        }
        v27[0] = @"RoleCoordinator not setup for role";
        v27[1] = v19;
        int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
        objc_msgSend(v18, "pbf_generalErrorWithCode:userInfo:", 1, v20);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v12 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore resetRole:error:]();
      }
      BOOL v7 = 0;
      goto LABEL_28;
    }
    id v9 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v6;
      _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "Executing reset of role %{public}@", buf, 0xCu);
    }

    uint64_t v10 = +[PBFPosterDataStoreEventBuilder resetRole:v6];
    id v22 = 0;
    uint64_t v11 = [v10 buildWithError:&v22];
    id v12 = v22;

    if (v11)
    {
      p_stateLocuint64_t k = &self->_stateLock;
      os_unfair_lock_lock(&self->_stateLock);
      id v23 = v11;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      BOOL v15 = [(PBFPosterExtensionDataStore *)self _stateLock_processEvents:v14 context:0 error:a4];

      os_unfair_lock_unlock(p_stateLock);
      BOOL v16 = PBFLogRoleCoordinator();
      char v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v25 = v6;
          _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "Reset of role %{public}@; role coordinator finished with success",
            buf,
            0xCu);
        }
        BOOL v7 = 1;
        goto LABEL_27;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore resetRole:error:]();
      }
    }
    else
    {
      if (a4) {
        *a4 = v12;
      }
      char v17 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore resetRole:error:]();
      }
    }
    BOOL v7 = 0;
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_29:

  return v7;
}

- (void)posterExtensionProvider:(id)a3 updatedExtensionsFrom:(id)a4 to:(id)a5
{
  id v6 = a5;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    os_unfair_lock_lock(&self->_stateLock);
    [(PBFPosterExtensionDataStore *)self _stateLock_executeExtensionUpdate:v6];
    BOOL v7 = (void *)[(NSMutableArray *)self->_stateLock_updateExtensionCompletionBlocks copy];
    stateLock_updateExtensionCompletionBlocks = self->_stateLock_updateExtensionCompletionBlocks;
    self->_stateLock_updateExtensionCompletionBlocks = 0;

    os_unfair_lock_unlock(&self->_stateLock);
    if ([v7 count])
    {
      id v9 = [NSString stringWithUTF8String:"-[PBFPosterExtensionDataStore posterExtensionProvider:updatedExtensionsFrom:to:]"];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __80__PBFPosterExtensionDataStore_posterExtensionProvider_updatedExtensionsFrom_to___block_invoke;
      v10[3] = &unk_1E69808C0;
      id v11 = v7;
      PBFDispatchAsyncWithString(v9, QOS_CLASS_USER_INITIATED, v10);
    }
  }
}

void __80__PBFPosterExtensionDataStore_posterExtensionProvider_updatedExtensionsFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_stateLock_executeExtensionUpdate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_assert_owner(&self->_stateLock);
    if ([(PBFPosterExtensionDataStore *)self _stateLock_hasBeenUnlockedSinceBoot])
    {
      uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      long long v6 = [v5 stringForKey:@"stashedBuildVersionString"];
      long long v7 = (void *)[objc_alloc(MEMORY[0x1E4F4F6C8]) initWithString:v6];
      id v8 = objc_alloc_init(MEMORY[0x1E4F4F6C8]);
      if ([(NSNumber *)self->_stateLock_wasMigrationJustPerformed BOOLValue]
        || ([v7 isEqual:v8] & 1) == 0)
      {
        uint64_t v10 = PBFLogDataStore();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v11 = [(NSNumber *)self->_stateLock_wasMigrationJustPerformed BOOLValue];
          v18[0] = 67109376;
          v18[1] = v11;
          __int16 v19 = 1024;
          int v20 = [v7 isEqual:v8] ^ 1;
          _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "Overriding refresh strategy to PBFDescriptorRefreshStrategyRefreshAlways because %{BOOL}u or the stashed build version is mismatched: %{BOOL}u", (uint8_t *)v18, 0xEu);
        }

        stateLock_wasMigrationJustPerformed = self->_stateLock_wasMigrationJustPerformed;
        self->_stateLock_wasMigrationJustPerformed = 0;

        uint64_t stateLock_initialRoleCoordinatorSetupPerformed = 3;
      }
      else
      {
        uint64_t stateLock_initialRoleCoordinatorSetupPerformed = self->_stateLock_initialRoleCoordinatorSetupPerformed;
      }
    }
    else
    {
      uint64_t stateLock_initialRoleCoordinatorSetupPerformed = 0;
    }
    [(PBFPosterExtensionDataStore *)self _stateLock_updateExtensions:v4 refreshDescriptors:stateLock_initialRoleCoordinatorSetupPerformed powerLogReason:4 galleryUpdateOptions:2 queuedUpOperations:0];
    if ([(PBFPosterExtensionDataStore *)self _stateLock_hasBeenUnlockedSinceBoot])
    {
      id v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v14 = [v13 stringForKey:@"stashedBuildVersionString"];
      BOOL v15 = (void *)[objc_alloc(MEMORY[0x1E4F4F6C8]) initWithString:v14];
      id v16 = objc_alloc_init(MEMORY[0x1E4F4F6C8]);
      if (([v16 isEqual:v15] & 1) == 0)
      {
        char v17 = [v16 stringRepresentation];
        [v13 setObject:v17 forKey:@"stashedBuildVersionString"];
      }
    }
  }
}

- (BOOL)_forceExtensionUpdate:(id)a3
{
  id v4 = a3;
  int v5 = MEMORY[0x1D9433950]("-[PBFPosterExtensionDataStore _forceExtensionUpdate:]");
  if (v5)
  {
    os_unfair_lock_lock(&self->_stateLock);
    [(PBFPosterExtensionDataStore *)self _stateLock_updateExtensions:v4 refreshDescriptors:2 powerLogReason:4 galleryUpdateOptions:2 queuedUpOperations:0];
    os_unfair_lock_unlock(&self->_stateLock);
  }

  return v5;
}

- (void)roleProcessor:(id)a3 transactionFinished:(id)a4 success:(BOOL)a5 results:(id)a6 error:(id)a7
{
  BOOL v9 = a5;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  os_unfair_lock_assert_owner(&self->_stateLock);
  uint64_t v67 = [v11 shortIdentifier];
  [v11 reason];
  uint64_t v64 = v63 = self;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    BOOL v15 = [v11 userInfo];
    id v16 = [v15 objectForKey:@"updateOptions"];
    if (v16)
    {
      char v17 = [v11 userInfo];
      uint64_t v18 = [v17 objectForKey:@"updateOptions"];
      uint64_t v61 = [v18 unsignedIntegerValue];
    }
    else
    {
      uint64_t v61 = 0;
    }

    uint64_t v14 = [v11 context];
    __int16 v19 = PBFLogDataStore();
    int v20 = v19;
    if (v9)
    {
      id v55 = v13;
      id v56 = v11;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v73 = v67;
        _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "(%{public}@} notifying roles of changes", buf, 0xCu);
      }

      long long v62 = objc_opt_new();
      long long v58 = (__CFString *)objc_opt_new();
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id obj = [v12 affectedRoles];
      p_isa = (id *)&v63->super.isa;
      uint64_t v65 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v65)
      {
        uint64_t v59 = *(void *)v69;
        id v60 = v12;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v69 != v59) {
              objc_enumerationMutation(obj);
            }
            id v23 = *(__CFString **)(*((void *)&v68 + 1) + 8 * v22);
            BOOL v24 = PBFLogDataStore();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v73 = v67;
              __int16 v74 = 2114;
              id v75 = v23;
              _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "(%{public}@} notifying %{public}@ of changes", buf, 0x16u);
            }

            uint64_t v25 = [p_isa[34] objectForKey:v23];
            uint64_t v26 = [v12 collectionDiffsPerRole];
            uint64_t v27 = [v26 objectForKey:v23];

            id v28 = (void *)[v27 newCollection];
            if (([v14 isInitialUpdate] & 1) != 0
              || ([v27 isEqual] & 1) == 0)
            {
              uint64_t v29 = [v28 orderedPosters];
              uint64_t v30 = [v29 array];
              [(__CFString *)v58 setObject:v30 forKeyedSubscript:v23];
            }
            if ([v14 isInitialUpdate]) {
              id v31 = (void *)[objc_alloc(MEMORY[0x1E4F92618]) initWithCollection:0 newCollection:v28];
            }
            else {
              id v31 = 0;
            }
            dispatch_time_t v32 = PBFLogDataStore();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v73 = v67;
              __int16 v74 = 2114;
              id v75 = v23;
              _os_log_impl(&dword_1D31CE000, v32, OS_LOG_TYPE_DEFAULT, "(%{public}@} Updating active path assertions for role %{public}@ ", buf, 0x16u);
            }

            if ([v14 isInitialUpdate]) {
              uint64_t v33 = v31;
            }
            else {
              uint64_t v33 = v27;
            }
            __int16 v66 = (void *)v25;
            uint64_t v34 = v25;
            uint64_t v35 = v14;
            objc_msgSend(p_isa, "_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:", v33, v34, v14);
            uint64_t v36 = [v12 preCommitActivePosterConfigurationForRole];
            id v37 = [v36 objectForKey:v23];

            id v38 = [p_isa activePosterConfigurationForRole:v23 assocPoster:0];
            uint64_t v39 = PBFLogDataStore();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v73 = v67;
              __int16 v74 = 2114;
              id v75 = v23;
              _os_log_impl(&dword_1D31CE000, v39, OS_LOG_TYPE_DEFAULT, "(%{public}@} Issuing update notifications for role %{public}@ ", buf, 0x16u);
            }

            if (v31) {
              unint64_t v40 = v31;
            }
            else {
              unint64_t v40 = v27;
            }
            objc_msgSend(p_isa, "_stateLock_pushUpdateNotificationsForRole:diff:previouslyActiveConfiguration:newActiveConfiguration:options:reason:context:", v23, v40, v37, v38, v61, v64, v35);
            [v62 bs_setSafeObject:v38 forKey:v23];
            char v41 = BSEqualObjects();
            uint64_t v42 = PBFLogDataStore();
            BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
            if (v41)
            {
              if (!v43) {
                goto LABEL_39;
              }
              *(_DWORD *)buf = 138543618;
              id v73 = v67;
              __int16 v74 = 2114;
              id v75 = v23;
              uint64_t v44 = v42;
              uint64_t v45 = "(%{public}@} Aborting update of active configurations for %{public}@; no change needed";
            }
            else
            {
              if (!v43) {
                goto LABEL_39;
              }
              *(_DWORD *)buf = 138543618;
              id v73 = v67;
              __int16 v74 = 2114;
              id v75 = v23;
              uint64_t v44 = v42;
              uint64_t v45 = "(%{public}@} Updating active configurations for %{public}@ ";
            }
            _os_log_impl(&dword_1D31CE000, v44, OS_LOG_TYPE_DEFAULT, v45, buf, 0x16u);
LABEL_39:

            ++v22;
            id v12 = v60;
            p_isa = (id *)&v63->super.isa;
            uint64_t v14 = v35;
          }
          while (v65 != v22);
          uint64_t v65 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
        }
        while (v65);
      }

      int v20 = v62;
      uint64_t v46 = [v62 count];
      id v47 = PBFLogDataStore();
      BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
      if (v46)
      {
        if (v48)
        {
          *(_DWORD *)buf = 138543618;
          id v73 = v67;
          __int16 v74 = 2114;
          id v75 = (__CFString *)v62;
          _os_log_impl(&dword_1D31CE000, v47, OS_LOG_TYPE_DEFAULT, "(%{public}@} Pushing out active poster for roles update %{public}@", buf, 0x16u);
        }

        [p_isa _notifyObserversDidUpdateActivePosterForRoles:v62];
      }
      else
      {
        if (v48)
        {
          int v49 = [v14 isInitialUpdate];
          long long v50 = @"no changes";
          if (v49) {
            long long v50 = @"isInitialUpdate";
          }
          *(_DWORD *)buf = 138543618;
          id v73 = v67;
          __int16 v74 = 2114;
          id v75 = v50;
          _os_log_impl(&dword_1D31CE000, v47, OS_LOG_TYPE_DEFAULT, "(%{public}@} *NOT* pushing out active poster for roles update; %{public}@",
            buf,
            0x16u);
        }
      }
      id v13 = v55;
      id v11 = v56;
      uint64_t v51 = [(__CFString *)v58 count];
      uint64_t v52 = PBFLogDataStore();
      BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
      if (v51)
      {
        if (v53)
        {
          *(_DWORD *)buf = 138543618;
          id v73 = v67;
          __int16 v74 = 2114;
          id v75 = v58;
          _os_log_impl(&dword_1D31CE000, v52, OS_LOG_TYPE_DEFAULT, "(%{public}@} Pushing out updated poster collections for roles update %{public}@", buf, 0x16u);
        }

        uint64_t v54 = v58;
        [(PBFPosterExtensionDataStore *)v63 _notifyObserversDidUpdatePosterCollectionsForRoles:v58];
      }
      else
      {
        if (v53)
        {
          *(_DWORD *)buf = 138543362;
          id v73 = v67;
          _os_log_impl(&dword_1D31CE000, v52, OS_LOG_TYPE_DEFAULT, "(%{public}@} *NOT* pushing out updated poster collections for roles update; no updated poster collections",
            buf,
            0xCu);
        }

        uint64_t v54 = v58;
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[PBFPosterExtensionDataStore _stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:]();
    }

    goto LABEL_61;
  }
  uint64_t v14 = PBFLogDataStore();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v73 = v67;
    _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@} Data store invalidated. Role Processor is bailing.", buf, 0xCu);
  }
LABEL_61:
}

- (void)assertionManager:(id)a3 identityIsNowMarkedAsInUse:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  int v5 = PBFLogDataStore();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "Path '%@', is now marked as inuse", (uint8_t *)&v6, 0xCu);
  }
}

- (void)assertionManager:(id)a3 identityIsNowMarkedAsNOTInUse:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = [(PBFPosterSnapshotManager *)self->_snapshotManager cancelRequestedSnapshotsForIdentity:v5];
  id v7 = PBFLogDataStore();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v30 = v5;
    BOOL v9 = "Successfully cleaned up snapshots after path: %@";
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v30 = v5;
    BOOL v9 = "Nothing to clean up for after cancelling snapshots for path: %@";
  }
  _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_7:

  uint64_t v10 = [v5 provider];
  id v11 = [(PBFPosterExtensionDataStore *)self knownExtensions];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __78__PBFPosterExtensionDataStore_assertionManager_identityIsNowMarkedAsNOTInUse___block_invoke;
  void v27[3] = &unk_1E6980DF8;
  id v12 = v10;
  id v28 = v12;
  char v13 = objc_msgSend(v11, "bs_containsObjectPassingTest:", v27);

  uint64_t v14 = PBFLogDataStore();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v5;
      _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "Identity '%@' is no longer marked in use; will remove.",
        buf,
        0xCu);
    }

    uint64_t v14 = [v5 posterUUID];
    id v25 = 0;
    id v26 = 0;
    [(PBFPosterExtensionDataStore *)self _stateLock_findStoreCoordinatorsForUUID:v14 extensionStoreCoordinator:&v26 configurationStoreCoordinator:&v25];
    id v16 = v26;
    id v17 = v25;
    id v24 = 0;
    objc_msgSend(v17, "removeSupplement:forVersion:error:", objc_msgSend(v5, "supplement"), objc_msgSend(v5, "version"), &v24);
    id v18 = v24;
    __int16 v19 = PBFLogDataStore();
    int v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionDataStore assertionManager:identityIsNowMarkedAsNOTInUse:]();
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v5;
      _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "Successfully cleaned up after path: %@", buf, 0xCu);
    }

    if (([v17 hasKnownVersions] & 1) == 0)
    {
      [v16 teardownConfigurationStoreCoordinatorForPosterUUID:v14 error:0];
      database = self->_database;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __78__PBFPosterExtensionDataStore_assertionManager_identityIsNowMarkedAsNOTInUse___block_invoke_882;
      void v22[3] = &unk_1E6981A18;
      id v23 = v14;
      [(PBFPosterExtensionDataStoreSQLiteDatabase *)database performChanges:v22 error:0];
    }
  }
  else if (v15)
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v12;
    _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "Extension '%@' has been removed; will not delete underlying configurations.",
      buf,
      0xCu);
  }
}

uint64_t __78__PBFPosterExtensionDataStore_assertionManager_identityIsNowMarkedAsNOTInUse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 posterExtensionBundleIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __78__PBFPosterExtensionDataStore_assertionManager_identityIsNowMarkedAsNOTInUse___block_invoke_882(uint64_t a1, void *a2)
{
  return [a2 removePosterUUID:*(void *)(a1 + 32) error:0];
}

- (void)roleCoordinatorWasReset:(id)a3 processInitialStateSetupEvents:(id *)a4
{
  extensionProvider = self->_extensionProvider;
  id v7 = a3;
  id v12 = [(PFPosterExtensionProvider *)extensionProvider knownPosterExtensions];
  p_extensionProvidingLocuint64_t k = &self->_extensionProvidingLock;
  os_unfair_lock_lock(&self->_extensionProvidingLock);
  BOOL v9 = [(NSMutableDictionary *)self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier objectEnumerator];
  uint64_t v10 = [v9 allObjects];

  os_unfair_lock_unlock(p_extensionProvidingLock);
  id v11 = [(id)objc_opt_class() buildInitialStateSetupEventsForRoleCoordinator:v7 extensionHandlers:v12 extensionStoreCoordinators:v10];

  *a4 = v11;
}

- (id)buildPrewarmPlanWithIdentifier:(id)a3 refreshStrategy:(int64_t)a4 galleryUpdateOptions:(unint64_t)a5 powerLogReason:(int64_t)a6 cleanupOldResources:(BOOL)a7 prewarmDisplayContext:(id)a8
{
  BOOL v32 = a7;
  id v12 = a3;
  id v34 = a8;
  if (!v34)
  {
    id v34 = +[PBFGenericDisplayContext mainScreen];
  }
  char v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = [(NSDictionary *)self->_roleToRoleCoordinator allKeys];
  BOOL v15 = [v13 setWithArray:v14];

  id v16 = objc_alloc_init(PBFMutablePosterExtensionDataStorePrewarmPlan);
  [(PBFPosterExtensionDataStorePrewarmPlan *)v16 setIdentifier:v12];
  id v17 = self->_invalidationFlag;
  uint64_t v33 = self->_snapshotManager;
  objc_initWeak(location, self);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  void v57[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke;
  void v57[3] = &unk_1E6981A68;
  objc_copyWeak(v60, location);
  id v18 = v17;
  long long v58 = v18;
  v60[1] = (id)a4;
  void v60[2] = (id)a6;
  id v19 = v12;
  id v59 = v19;
  [(PBFMutablePosterExtensionDataStorePrewarmPlan *)v16 setExecutionBlock:v57 forPhase:@"PBFPrewarmPhaseReloadDescriptors"];
  if (objc_msgSend(v15, "bs_containsObjectPassingTest:", &__block_literal_global_891))
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4;
    v53[3] = &unk_1E6981AB8;
    objc_copyWeak(&v56, location);
    int v20 = v18;
    uint64_t v54 = v20;
    id v21 = v19;
    id v55 = v21;
    [(PBFMutablePosterExtensionDataStorePrewarmPlan *)v16 setExecutionBlock:v53 forPhase:@"PBFPrewarmPhasePushToProactive"];
    id v30 = v15;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_895;
    void v49[3] = &unk_1E6981A68;
    objc_copyWeak(v52, location);
    uint64_t v22 = v20;
    long long v50 = v22;
    id v23 = v21;
    id v51 = v23;
    v52[1] = (id)a5;
    v52[2] = (id)a6;
    [(PBFMutablePosterExtensionDataStorePrewarmPlan *)v16 setExecutionBlock:v49 forPhase:@"PBFPrewarmPhaseAcquireNewGallery"];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_900;
    v43[3] = &unk_1E6981B78;
    objc_copyWeak(v48, location);
    id v24 = v22;
    uint64_t v44 = v24;
    id v25 = v23;
    id v45 = v25;
    id v26 = v34;
    id v46 = v26;
    v48[1] = (id)a6;
    uint64_t v27 = v33;
    id v47 = v27;
    [(PBFMutablePosterExtensionDataStorePrewarmPlan *)v16 setExecutionBlock:v43 forPhase:@"PBFPrewarmPhaseSnapshotSwitcher"];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_910;
    v37[3] = &unk_1E6981C18;
    objc_copyWeak(&v42, location);
    id v38 = v24;
    id v39 = v26;
    unint64_t v40 = v27;
    id v41 = v25;
    [(PBFMutablePosterExtensionDataStorePrewarmPlan *)v16 setExecutionBlock:v37 forPhase:@"PBFPrewarmPhaseSnapshotGallery"];

    objc_destroyWeak(&v42);
    objc_destroyWeak(v48);

    objc_destroyWeak(v52);
    objc_destroyWeak(&v56);
  }
  if (v32)
  {
    [(PBFMutablePosterExtensionDataStorePrewarmPlan *)v16 appendPrewarmPhase:@"PBFPrewarmPhaseSnapshotCleanup"];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_919;
    v36[3] = &unk_1E6981C68;
    void v36[4] = self;
    [(PBFMutablePosterExtensionDataStorePrewarmPlan *)v16 setExecutionBlock:v36 forPhase:@"PBFPrewarmPhaseSnapshotCleanup"];
    [(PBFMutablePosterExtensionDataStorePrewarmPlan *)v16 appendPrewarmPhase:@"PBFPrewarmPhaseFileSystemCleanup"];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_6;
    void v35[3] = &unk_1E6981C68;
    void v35[4] = self;
    [(PBFMutablePosterExtensionDataStorePrewarmPlan *)v16 setExecutionBlock:v35 forPhase:@"PBFPrewarmPhaseFileSystemCleanup"];
  }
  id v28 = (void *)[(PBFMutablePosterExtensionDataStorePrewarmPlan *)v16 copy];

  objc_destroyWeak(v60);
  objc_destroyWeak(location);

  return v28;
}

id __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && ![*(id *)(a1 + 32) getFlag])
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 47);
    char v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = [*((id *)WeakRetained + 5) knownPosterExtensions];
    uint64_t v15 = [v13 setWithArray:v14];

    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 64);
    id v51 = 0;
    id v34 = (void *)v15;
    id v35 = WeakRetained;
    objc_msgSend(WeakRetained, "_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:", v15, v16, v17, 4, &v51);
    id v18 = v51;
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 47);
    id v19 = dispatch_group_create();
    dispatch_group_enter(v19);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v18;
    uint64_t v20 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
    id v36 = v6;
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v48 != v22) {
            objc_enumerationMutation(obj);
          }
          id v24 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v25 = PBFLogPrewarm();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = *(void *)(a1 + 40);
            [v24 extensionBundleIdentifier];
            uint64_t v27 = v22;
            uint64_t v28 = a1;
            id v30 = v29 = v7;
            *(_DWORD *)buf = 138543874;
            uint64_t v53 = v26;
            id v6 = v36;
            __int16 v54 = 2114;
            id v55 = v36;
            __int16 v56 = 2114;
            long long v57 = v30;
            _os_log_impl(&dword_1D31CE000, v25, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ watching reload descriptor operation for bundle %{public}@", buf, 0x20u);

            id v7 = v29;
            a1 = v28;
            uint64_t v22 = v27;
          }

          dispatch_group_enter(v19);
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          void v42[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_887;
          v42[3] = &unk_1E6981A40;
          id v43 = v7;
          id v44 = *(id *)(a1 + 40);
          id v45 = v6;
          id v46 = v19;
          [v24 addCompletionObserver:v42];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
      }
      while (v21);
    }

    dispatch_group_leave(v19);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_888;
    aBlock[3] = &unk_1E69808C0;
    id v41 = obj;
    id v11 = obj;
    uint64_t v31 = _Block_copy(aBlock);
    BOOL v32 = [MEMORY[0x1E4F924D8] sharedWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2;
    block[3] = &unk_1E69808C0;
    id v6 = v36;
    id v39 = v7;
    dispatch_group_notify(v19, v32, block);

    id v12 = _Block_copy(v31);
    uint64_t v10 = v34;
    id WeakRetained = v35;
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x1E4F28C58];
    id v59 = @"phase";
    v60[0] = v6;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
    objc_msgSend(v9, "pbf_generalErrorWithCode:userInfo:", 3, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v7 finishedWithError:v11];
    id v12 = 0;
  }

  return v12;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_887(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) noteNonFatalError:v6];
    id v7 = PBFLogPrewarm();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = [v5 extensionBundleIdentifier];
      int v13 = 138544130;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      id v18 = v10;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_error_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_ERROR, "(%{public}@) phase %{public}@ reload descriptor operation for bundle %{public}@ failed with error: %{public}@", (uint8_t *)&v13, 0x2Au);
LABEL_6:
    }
  }
  else
  {
    id v7 = PBFLogPrewarm();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v10 = [v5 extensionBundleIdentifier];
      int v13 = 138543874;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ reload descriptor operation for bundle %{public}@ succeeded", (uint8_t *)&v13, 0x20u);
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_888(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        objc_msgSend(v6, "invalidateAssertionsWithCompletion:", 0, (void)v7);
        [v6 cancel];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedWithError:0];
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F927B0] proactiveGallerySupportedForRole:a2];
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4(id *a1, void *a2, void *a3, void *a4)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && ![a1[4] getFlag])
  {
    os_unfair_lock_lock(WeakRetained + 47);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5;
    v15[3] = &unk_1E6981A90;
    id v16 = v8;
    id v17 = a1[5];
    id v18 = v7;
    id v19 = v9;
    [(os_unfair_lock_s *)WeakRetained _stateLock_pushPosterDescriptorsToProactiveForReason:@"prewarm" force:1 completion:v15];
    os_unfair_lock_unlock(WeakRetained + 47);

    uint64_t v12 = v16;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    id v20 = @"phase";
    v21[0] = v7;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    int v13 = objc_msgSend(v11, "pbf_generalErrorWithCode:userInfo:", 3, v12);
    [v9 finishedWithError:v13];
  }
  return 0;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = a2;
  }
  id v7 = [NSNumber numberWithInt:v6];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"DID_PUSH_DESCRIPTORS"];

  id v8 = PBFLogPrewarm();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    int v14 = 138543874;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 1024;
    int v19 = v6;
    _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ did push descriptors? %{BOOL}u", (uint8_t *)&v14, 0x1Cu);
  }

  if (v5)
  {
    uint64_t v11 = PBFLogPrewarm();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_cold_1(a1);
    }

    [*(id *)(a1 + 56) noteNonFatalError:v5];
  }
  uint64_t v12 = PBFLogPrewarm();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 138543618;
    uint64_t v15 = v13;
    __int16 v16 = 1024;
    LODWORD(v17) = a2;
    _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@) finished pushing descriptors to proactive; did update? %{BOOL}u",
      (uint8_t *)&v14,
      0x12u);
  }

  [*(id *)(a1 + 56) finishedWithError:0];
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_895(uint64_t a1, void *a2, void *a3, void *a4)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && ![*(id *)(a1 + 32) getFlag])
  {
    uint64_t v15 = [v8 objectForKeyedSubscript:@"DID_PUSH_DESCRIPTORS"];
    int v16 = [v15 BOOLValue];

    uint64_t v17 = PBFLogPrewarm();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v19;
        __int16 v31 = 2114;
        id v32 = v7;
        _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ asking for new gallery", buf, 0x16u);
      }

      uint64_t v20 = (void *)WeakRetained[11];
      uint64_t v21 = *(void *)(a1 + 56);
      uint64_t v22 = *(void *)(a1 + 64);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_896;
      v24[3] = &unk_1E6981AE0;
      id v25 = *(id *)(a1 + 40);
      id v26 = v7;
      id v27 = v9;
      id v28 = v8;
      [v20 enqueueGalleryConfigurationUpdateWithOptions:v21 powerLogReason:v22 completion:v24];
    }
    else
    {
      if (v18)
      {
        uint64_t v23 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v23;
        __int16 v31 = 2114;
        id v32 = v7;
        _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ bail asking for new gallery; no descriptors were pushed",
          buf,
          0x16u);
      }

      [v9 finishedWithError:0];
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = @"phase";
    v34[0] = v7;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    uint64_t v13 = objc_msgSend(v11, "pbf_generalErrorWithCode:userInfo:", 3, v12);
    [v9 finishedWithError:v13];
  }
  return 0;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_896(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = PBFLogPrewarm();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_896_cold_1(a1, (uint64_t)v7, v9);
    }

    [*(id *)(a1 + 48) noteNonFatalError:v7];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      int v13 = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ ask for new gallery succeeded", (uint8_t *)&v13, 0x16u);
    }
  }
  uint64_t v12 = [NSNumber numberWithBool:a4];
  [*(id *)(a1 + 56) setObject:v12 forKeyedSubscript:@"DID_UPDATE_GALLERY"];

  [*(id *)(a1 + 48) finishedWithError:0];
}

id __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_900(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && ![*(id *)(a1 + 32) getFlag])
  {
    int v13 = [*(id *)(a1 + 40) stringByAppendingFormat:@"-%@", v6];
    uint64_t v14 = [WeakRetained acquireSnapshotterInUseAssertionWithReason:v13];

    __int16 v15 = [WeakRetained[34] objectForKeyedSubscript:*MEMORY[0x1E4F92790]];
    uint64_t v16 = [v15 posterCollection];
    uint64_t v17 = [v16 orderedPosters];
    uint64_t v10 = [v17 array];

    BOOL v18 = objc_opt_new();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_901;
    v37[3] = &unk_1E6981B08;
    id v38 = *(id *)(a1 + 48);
    uint64_t v19 = objc_msgSend(v10, "bs_mapNoNulls:", v37);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_902;
    v36[3] = &__block_descriptor_40_e60___PBFPosterSnapshotRequest_16__0__PBFPosterSnapshotRequest_8l;
    void v36[4] = *(void *)(a1 + 72);
    uint64_t v20 = objc_msgSend(v19, "bs_map:", v36);

    [v18 addObjectsFromArray:v20];
    uint64_t v21 = PBFLogPrewarm();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v22;
      __int16 v41 = 2114;
      id v42 = v6;
      __int16 v43 = 2114;
      id v44 = v18;
      _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ prewarming switcher snapshots: %{public}@", buf, 0x20u);
    }

    uint64_t v23 = *(void **)(a1 + 56);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_905;
    v33[3] = &unk_1E6981B50;
    id v34 = v7;
    id v24 = v14;
    id v35 = v24;
    [v23 prewarmSnapshotsForRequests:v18 completion:v33];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_906;
    aBlock[3] = &unk_1E6981490;
    id v29 = v24;
    id v30 = *(id *)(a1 + 56);
    id v31 = v18;
    id v32 = *(id *)(a1 + 40);
    id v25 = v18;
    id v11 = v24;
    id v26 = _Block_copy(aBlock);
    uint64_t v12 = _Block_copy(v26);
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    id v45 = @"phase";
    v46[0] = v6;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    objc_msgSend(v9, "pbf_generalErrorWithCode:userInfo:", 3, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v7 finishedWithError:v11];
    uint64_t v12 = 0;
  }

  return v12;
}

PBFPosterSnapshotRequest *__156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_901(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [PBFPosterSnapshotRequest alloc];
  id v5 = +[PBFPosterSnapshotDefinition defaultConfigurationDefinitions];
  id v6 = [(PBFPosterSnapshotRequest *)v4 initWithConfiguration:v3 definitions:v5 context:*(void *)(a1 + 32)];

  return v6;
}

id __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_902(uint64_t a1, void *a2)
{
  id v3 = [a2 requestWithIntention:1];
  uint64_t v4 = [v3 requestWithPowerLogReason:*(void *)(a1 + 32)];

  return v4;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_905(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [*(id *)(a1 + 32) noteNonFatalError:v3];
    id v3 = v4;
  }
  [*(id *)(a1 + 32) finishedWithError:v3];
  [*(id *)(a1 + 40) invalidate];
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_906(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [@"Prewarm cancelled - " stringByAppendingString:*(void *)(a1 + 56)];
  [v2 cancelRequestedSnapshotsForRequests:v3 reason:v4];
}

id __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_910(id *a1, void *a2, void *a3, void *a4)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained && ![a1[4] getFlag])
  {
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy_;
    void v33[4] = __Block_byref_object_dispose_;
    id v34 = 0;
    v31[0] = 0;
    v31[1] = v31;
    void v31[2] = 0x3032000000;
    void v31[3] = __Block_byref_object_copy_;
    void v31[4] = __Block_byref_object_dispose_;
    id v32 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4_911;
    void v22[3] = &unk_1E6981BC8;
    id v23 = v9;
    id v29 = v31;
    id v24 = a1[5];
    id v25 = a1[6];
    id v26 = a1[7];
    id v27 = v7;
    id v30 = v33;
    id v28 = WeakRetained;
    [WeakRetained fetchCurrentGalleryConfiguration:v22];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_918;
    aBlock[3] = &unk_1E6981BF0;
    uint64_t v20 = v33;
    id v18 = a1[6];
    uint64_t v21 = v31;
    id v19 = a1[7];
    __int16 v15 = _Block_copy(aBlock);
    uint64_t v14 = _Block_copy(v15);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    id v35 = @"phase";
    v36[0] = v7;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    int v13 = objc_msgSend(v11, "pbf_generalErrorWithCode:userInfo:", 3, v12);
    [v9 finishedWithError:v13];

    uint64_t v14 = 0;
  }

  return v14;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4_911(uint64_t a1, void *a2)
{
  v50[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [a2 prewarmGallerySnapshotRequestsForDisplayContext:*(void *)(a1 + 40)];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    void v40[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_915;
    v40[3] = &unk_1E6980C48;
    id v41 = *(id *)(a1 + 48);
    uint64_t v4 = objc_msgSend(v3, "bs_filter:", v40);
    uint64_t v5 = *(void *)(*(void *)(a1 + 80) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = PBFLogPrewarm();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 64);
      uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count];
      *(_DWORD *)buf = 138543874;
      uint64_t v44 = v8;
      __int16 v45 = 2114;
      uint64_t v46 = v9;
      __int16 v47 = 2048;
      uint64_t v48 = v10;
      _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ prewarming gallery snapshots: %lu", buf, 0x20u);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v11 = a1;
    id v12 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          id v18 = PBFLogPrewarm();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = *(void *)(v11 + 56);
            *(_DWORD *)buf = 138543618;
            uint64_t v44 = v19;
            __int16 v45 = 2114;
            uint64_t v46 = v17;
            _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) snapshot request %{public}@", buf, 0x16u);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v14);
    }

    if ([*(id *)(*(void *)(*(void *)(v11 + 80) + 8) + 40) count])
    {
      uint64_t v20 = *(void **)(v11 + 72);
      uint64_t v21 = [*(id *)(v11 + 56) stringByAppendingFormat:@"-%@", *(void *)(v11 + 64)];
      uint64_t v22 = [v20 acquireSnapshotterInUseAssertionWithReason:v21];
      uint64_t v23 = *(void *)(*(void *)(v11 + 88) + 8);
      id v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      id v25 = *(void **)(v11 + 48);
      uint64_t v26 = *(void *)(*(void *)(*(void *)(v11 + 80) + 8) + 40);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_916;
      v33[3] = &unk_1E6981BA0;
      id v27 = *(id *)(v11 + 32);
      uint64_t v28 = *(void *)(v11 + 88);
      id v34 = v27;
      uint64_t v35 = v28;
      [v25 prewarmSnapshotsForRequests:v26 completion:v33];
    }
    else
    {
      [*(id *)(v11 + 32) finishedWithError:0];
    }
  }
  else
  {
    id v29 = *(void **)(a1 + 32);
    id v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28588];
    v50[0] = @"Gallery configuration is nil at this step during prewarm.";
    id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
    id v32 = objc_msgSend(v30, "pbf_generalErrorWithCode:userInfo:", 1, v31);
    [v29 noteNonFatalError:v32];

    [*(id *)(a1 + 32) finishedWithError:0];
  }
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_915(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:a2];
  uint64_t v4 = [v2 areSnapshotsFullyPrepared:v3] ^ 1;

  return v4;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_916(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [*(id *)(a1 + 32) noteNonFatalError:v3];
    id v3 = v4;
  }
  [*(id *)(a1 + 32) finishedWithError:v3];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_2_918(void *a1)
{
  [*(id *)(*(void *)(a1[6] + 8) + 40) invalidate];
  uint64_t v2 = *(void *)(*(void *)(a1[7] + 8) + 40);
  id v3 = (void *)a1[4];
  id v4 = [@"Prewarm cancelled - " stringByAppendingString:a1[5]];
  [v3 cancelRequestedSnapshotsForRequests:v2 reason:v4];
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_3_919(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4_920;
  v9[3] = &unk_1E6981C40;
  void v9[4] = v6;
  id v10 = v5;
  id v7 = v5;
  [v6 fetchCurrentGalleryConfiguration:v9];

  return 0;
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_4_920(uint64_t a1, void *a2)
{
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 188);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_921;
  v6[3] = &unk_1E69808C0;
  id v5 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "_stateLock_cleanupStaleSnapshotsNotWithinGallery:completion:", v4, v6);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 188));
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_921(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishedWithError:0];
}

id __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 188));
  id v7 = objc_msgSend(*(id *)(a1 + 32), "_stateLock_extensionStoreCoordinators");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 188));
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_7;
  v17[3] = &unk_1E6981338;
  id v18 = v7;
  id v8 = v6;
  id v19 = v8;
  id v20 = v5;
  id v9 = v5;
  id v10 = v7;
  PBFDispatchAsyncWithString(@"FSCleanup", QOS_CLASS_DEFAULT, v17);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_8;
  v15[3] = &unk_1E69808C0;
  id v16 = v8;
  id v11 = v8;
  id v12 = _Block_copy(v15);
  uint64_t v13 = _Block_copy(v12);

  return v13;
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_7(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = (id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "ensureFileSystemIntegrity", (void)v9);
      if ([a1[5] getFlag]) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return [a1[6] finishedWithError:0];
}

uint64_t __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFlag:1];
}

- (id)_buildSwitcherConfigurationWithContext:(id)a3
{
  p_stateLocuint64_t k = &self->_stateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  uint64_t v6 = [(PBFPosterExtensionDataStore *)self _stateLock_buildSwitcherConfigurationWithContext:v5 outMutated:0];

  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

- (NSURL)URL
{
  return self->_URL;
}

- (PBFPosterExtensionDataStoreAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (PBFPosterSnapshotManager)snapshotManager
{
  return self->_snapshotManager;
}

- (PFPosterExtensionProvider)extensionProvider
{
  return self->_extensionProvider;
}

- (NSURL)extensionStoreCoordinatorContainerURL
{
  return self->_extensionStoreCoordinatorContainerURL;
}

- (NSURL)galleryCacheURL
{
  return self->_galleryCacheURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryCacheURL, 0);
  objc_storeStrong((id *)&self->_extensionStoreCoordinatorContainerURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_extensionsInputIsValidAtomicFlag, 0);
  objc_storeStrong((id *)&self->_stateLock_wasMigrationJustPerformed, 0);
  objc_storeStrong((id *)&self->_stateLock_updateExtensionCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_activePosterLock_roleToActivePosterConfiguration, 0);
  objc_storeStrong((id *)&self->_roleToRoleCoordinator, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_stateLock_hasBeenUnlockedSinceBoot, 0);
  objc_storeStrong((id *)&self->_prewarmer, 0);
  objc_storeStrong((id *)&self->_extensionsCurrentlyUpdatingFlag, 0);
  objc_storeStrong((id *)&self->_isPrewarmingFlag, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_clientSnapshotRequestQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_stateLock_activePathAssertions, 0);
  objc_storeStrong((id *)&self->_stateLock_switcherConfiguration, 0);
  objc_storeStrong((id *)&self->_stateLock_staticDescriptorsForExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_stateLock_descriptorsForExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_stateLock_extensionStoreCoordinatorForExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_stateLock_suggestedLayout, 0);
  objc_storeStrong((id *)&self->_stateLock_configuration, 0);
  objc_storeStrong((id *)&self->_instanceCollection, 0);
  objc_storeStrong((id *)&self->_extensionProvidingLock_extensionStoreCoordinatorForExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_galleryController, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_complicationSnapshotService, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_stateLock_fromExtensions, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_foregroundKeepDatabaseAliveAssertion, 0);
  objc_storeStrong((id *)&self->_runtimeAssertionProvider, 0);
  objc_storeStrong((id *)&self->_extensionEnvironmentURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

- (void)initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithURL:runtimeAssertionProvider:extensionProvider:observer:wasMigrationJustPerformed:applicationStateMonitor:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_194_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v1, v2, "(%{public}@) prewarm runtime assertion was invalidated: %{public}@", (void)v3, DWORD2(v3));
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_198_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  int v2 = 138543362;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1D31CE000, v1, OS_LOG_TYPE_DEBUG, "(%{public}@) finished wih no errors", (uint8_t *)&v2, 0xCu);
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_198_cold_2()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v1, v2, "(%{public}@) finished with non-fatal errors %{public}@", (void)v3, DWORD2(v3));
}

void __128__PBFPosterExtensionDataStore_executeUpdate_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_completion___block_invoke_198_cold_3()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v1, v2, "(%{public}@) finished with fatal error %{public}@", (void)v3, DWORD2(v3));
}

- (void)posterDescriptorsForExtensionBundleIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)staticPosterDescriptorsForExtensionBundleIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)reloadPosterDescriptorsForExtensionBundleIdentifier:sessionInfo:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)reloadPosterDescriptorsForExtensionBundleIdentifier:sessionInfo:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)deletePosterDescriptorsForExtensionBundleIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateGallery:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateGallery:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:.cold.2()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:.cold.3()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)fetchPosterSnapshotsWithClientRequest:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)fetchPosterSnapshotsWithClientRequest:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __91__PBFPosterExtensionDataStore__stateLock_fetchPosterSnapshotsWithClientRequest_completion___block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Could not retrieve snapshot for XPC client request with error: %@", v2, v3, v4, v5, v6);
}

void __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v1, v2, "[%{public}@] Not configurationUpdate received; bailing w/ error: %{public}@",
    (void)v3,
    DWORD2(v3));
}

void __110__PBFPosterExtensionDataStore__stateLock_applyUpdatesAndIngestConfiguration_toPath_powerLogReason_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v1, v2, "[%{public}@] failed to update data store: %{public}@", (void)v3, DWORD2(v3));
}

- (void)_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:.cold.2()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:.cold.3()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_stateLock_convertPosterUpdatesToRoleCoordinatorChanges:toPath:powerLogReason:completion:.cold.4()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.2()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.3()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.5()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.6()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:.cold.7()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)refreshPosterConfigurationMatchingUUID:sessionInfo:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  os_log_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activePosterForRole:assocPoster:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_1D31CE000, v0, OS_LOG_TYPE_FAULT, "Unable to query for active poster for role %@", v1, 0xCu);
}

- (void)duplicatePosterConfigurationMatchingUUID:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)exportPosterConfigurationMatchingUUID:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)importPosterConfigurationFromArchiveData:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)refreshSnapshotForPosterConfigurationMatchUUID:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)refreshSnapshotForPosterConfigurationMatchUUID:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestSnapshotCollection:forPosterConfigurationUUID:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestSnapshotCollection:forPosterConfigurationUUID:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_ingestRefreshPosterConfiguration:(const char *)a1 completion:(NSObject *)a2 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  long long v3 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "Invalidated; bailing on %{public}@", v4, 0xCu);
}

- (void)_ingestRefreshPosterConfiguration:completion:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Active editing session for extension %{public}@; bailing on poster configuration refresh",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_ingestRefreshPosterConfiguration:completion:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Failed to find role coordinator for role %{public}@; unable to ingest refresh poster configuration",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_ingestRefreshPosterConfiguration:completion:.cold.4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Failed to poster; destinationUUID was invalid for role %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)updateDataStoreForIncomingAvailableFocusModeChange:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Failed to prune focus modes for %{public}@; role coordinator is not setup for that role?",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)processIncomingPosterConfiguration:completion:.cold.1()
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

- (void)_stateLock_updateDataStoreForSwitcherConfiguration:options:reason:error:.cold.1()
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

- (void)_stateLock_updateDataStoreForSwitcherConfiguration:options:reason:error:.cold.2()
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

- (void)_stateLock_executeDataStoreUpdateWithChanges:diffs:options:reason:context:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "(%{public}@} failed to execute data store update: %{public}@");
}

- (void)_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:.cold.1()
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

- (void)_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:.cold.2()
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

- (void)_stateLock_setupPathAssertionsAndUpdateActivePosterFromDiff:roleCoordinator:context:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_16(&dword_1D31CE000, v0, v1, "Role %{public}@ numberOfOrderedPostersAssertionsForReason %lu");
}

- (void)_stateLock_buildSwitcherConfigurationWithContext:(os_log_t)log outMutated:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1D31CE000, log, OS_LOG_TYPE_FAULT, "(_stateLock_buildSwitcherConfigurationWithContext...) Can't build switcher configuration: No role coordinator for PRPosterRoleLockScreen", v1, 2u);
}

void __93__PBFPosterExtensionDataStore_fetchPosterSuggestionsForFocusModeWithUUID_context_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Could not obtain snapshot for suggested Focus poster with error: %@", v2, v3, v4, v5, v6);
}

- (void)_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "(%{public}@) PosterBoard extension update aborted; no extensions passed?",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:.cold.2()
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

- (void)_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "(%{public}@) failed to issue update extensions data store event w/ error: %{public}@");
}

- (void)_stateLock_updateExtensions:refreshDescriptors:powerLogReason:galleryUpdateOptions:queuedUpOperations:.cold.4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "(%{public}@) failed to build update extensions data store event: %{public}@");
}

- (void)_finishUpdateExtensionUpdateWithOptions:updateExtensionSession:pushToProactiveError:didUpdateProactiveDescriptors:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "(%@)Finished dynamic descriptors update; could not push to proactive because error: %{public}@");
}

void __145__PBFPosterExtensionDataStore__finishUpdateExtensionUpdateWithOptions_updateExtensionSession_pushToProactiveError_didUpdateProactiveDescriptors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v1, v2, "(%@)Finished dynamic descriptors update w/ error: %{public}@", (void)v3, DWORD2(v3));
}

- (void)_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Unable to update Extension static descriptors %{public}@; this extension is not currently tracked",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Unable to update Extension static descriptors %{public}@; no extension store coordinator for provider",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_stateLock_updateDescriptorsFromStaticDescriptorsForExtensionBundleIdentifier:reason:error:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_16(&dword_1D31CE000, v0, v1, "Failed to setup static descriptors for %{public}@; errors: %{public}@");
}

- (void)_stateLock_setupEnvironmentForExtension:wasUpdated:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Unable to create extension store coordinator container for provider '%{public}@: '%{public}@");
}

- (void)_stateLock_updateEnvironmentForExtension:fromExtension:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Unable to update Extension %{public}@; this extension is not currently tracked",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_stateLock_hasBeenUnlockedSinceBoot
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL PBF_MKBDeviceUnlockedSinceBoot(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PBFPosterExtensionDataStore.m", 123, @"%s", dlerror());

  __break(1u);
}

- (void)_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:(const char *)a1 reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_1D31CE000, v2, v3, "Extension Store Coordinator discovery error %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:(const char *)a1 reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:.cold.3(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_1D31CE000, v2, v3, "Asset Updated Error %{public}@: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier:reason:powerLogReason:postEnqueueGalleryUpdateOptions:sessionInfo:completion:.cold.4()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Error ingesting reloaded descriptors %{public}@: %{public}@");
}

void __181__PBFPosterExtensionDataStore__stateLock_enqueueReloadDescriptorsOperationForExtensionBundleIdentifier_reason_powerLogReason_postEnqueueGalleryUpdateOptions_sessionInfo_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Failed %{public}@: %{public}@");
}

- (void)_stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "deletePosterDescriptorsForExtensionBundleIdentifier:%{public}@ error: no extension store coordinator found for bundle identifier", v2, v3, v4, v5, v6);
}

- (void)_stateLock_deletePosterDescriptorsForExtensionBundleIdentifier:waitForPushToProactive:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "deletePosterDescriptorsForExtensionBundleIdentifier:%{public}@ ingest error: %{public}@");
}

void __159__PBFPosterExtensionDataStore__stateLock_updateGalleryWithSuggestedLayout_descriptorsByExtensionBundleIdentifier_staticDescriptorsByExtensionBundleIdentifier___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_1D31CE000, v0, OS_LOG_TYPE_FAULT, "update gallery prewarm runtime assertion was invalidated: %{public}@", v1, 0xCu);
}

- (void)resetRole:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Failed to reset of role %{public}@; role coordinator is not setup for that role?",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)resetRole:error:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Failed to reset of role %{public}@; could not build reset role event: %{public}@");
}

- (void)resetRole:error:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Reset of role %{public}@; role coordinator finished with failure",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)assertionManager:identityIsNowMarkedAsNOTInUse:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "UNABLE TO DELETE PATH '%@': %@");
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_5_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 40);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v1, v2, "(%{public}@) finished pushing to proactive; error: %{public}@",
    (void)v3,
    DWORD2(v3));
}

void __156__PBFPosterExtensionDataStore_buildPrewarmPlanWithIdentifier_refreshStrategy_galleryUpdateOptions_powerLogReason_cleanupOldResources_prewarmDisplayContext___block_invoke_896_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "(%{public}@) phase %{public}@ ask for new gallery failed with error: %{public}@", (uint8_t *)&v5, 0x20u);
}

@end