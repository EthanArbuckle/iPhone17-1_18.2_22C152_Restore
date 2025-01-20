@interface SUManagerCore
- (BOOL)_isUpdateDownloadable:(id)a3 downloadOptions:(id)a4 error:(id *)a5;
- (BOOL)cancelDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6;
- (BOOL)isAutoUpdateEnabled;
- (BOOL)isClearingSpace;
- (BOOL)isDelayingUpdates;
- (BOOL)isDescriptorAutoDownloadable:(id)a3;
- (BOOL)isDescriptorAutoUpdatable:(id)a3;
- (BOOL)isDownloading;
- (BOOL)isForeground;
- (BOOL)isInstallTonight;
- (BOOL)isInstallTonightScheduled;
- (BOOL)isInstalled;
- (BOOL)isInstalling;
- (BOOL)isManaged;
- (BOOL)isRollingBack;
- (BOOL)isScanning;
- (BOOL)isSplatOnlyUpdateRollbackSuggested;
- (BOOL)isSplatRollbackAllowed:(id *)a3;
- (BOOL)isSplatRollbackEnabled;
- (BOOL)isUpdateDownloaded;
- (BOOL)isUpdateReadyForInstallation:(id *)a3;
- (BOOL)killDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6;
- (BOOL)killDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 forUpdates:(id)a6 error:(id *)a7;
- (BOOL)resetDownloadStateOnCleanActivation;
- (BOOL)shouldShowRollbackSuggestionAlert:(id)a3 error:(id *)a4;
- (BOOL)splatUpdatesAllowed;
- (MAAsset)alternateAssetToDownloadFromLastScan;
- (MAAsset)preferredAssetToDownloadFromLastScan;
- (NSDate)lastStashbagPersistedDate;
- (NSDictionary)mandatoryUpdateDictionary;
- (NSHashTable)observers;
- (NSMutableDictionary)unlockCallbacks;
- (NSString)potentialNextSessionID;
- (NSString)sessionID;
- (OS_dispatch_queue)externWorkQueue;
- (OS_dispatch_queue)workQueue;
- (SUAutoUpdatePasscodePolicy)passcodePolicy;
- (SUCoreDescriptor)alternateLastScannedDescriptor;
- (SUCoreDescriptor)preferredLastScannedDescriptor;
- (SUCoreEventReporter)coreReporter;
- (SUDDMManager)ddmManager;
- (SUDownloader)downloader;
- (SUInstallPolicy)installPolicy;
- (SUInstaller)installer;
- (SUManagedDeviceManager)managedDeviceManager;
- (SUManagerCore)init;
- (SUManagerDelegate)delegate;
- (SUManagerEngine)engine;
- (SURollbackController)rollback;
- (SUSFollowUpController)followUpController;
- (SUScanOptions)lastScannedDescriptorScanOptions;
- (SUScanner)scanner;
- (SUState)state;
- (id)_createCoreAnalyticsEventWithCurrentDownloadFor:(id)a3 error:(id)a4;
- (id)_getAmountDataAvailable;
- (id)coreDescriptorForSUDescriptor:(id)a3;
- (id)createpotentialNextSessionID;
- (id)delayEndDate;
- (id)discoveryDateForBuildVersion:(id)a3;
- (id)download;
- (id)downloadAsset;
- (id)eligibleRollbackWithOptions:(id)a3;
- (id)eventRecordingServiceURL:(id)a3;
- (id)fullyUnrampedDateForBuildVersion:(id)a3;
- (id)installTonightConfigDictionary;
- (id)newInstallTonightConfig;
- (id)previousRollbackWithOptions:(id)a3;
- (id)rollbackSuggestionReasonFromSUReason:(unint64_t)a3;
- (id)slaVersion;
- (id)updateToAutoDownload;
- (unint64_t)softwareUpdatePathRestriction;
- (unint64_t)updatesDelayPeriodSeconds;
- (void)_augmentCoreAnalyticsEvent:(id)a3 withUpdate:(id)a4;
- (void)_describeAndReportEvent:(id)a3 policy:(id)a4 primaryDescriptor:(id)a5 alternateDescriptor:(id)a6 additionalMetrics:(id)a7;
- (void)_loadBrainOnUnlockCallback;
- (void)_notifyEngineOnUnlock;
- (void)_persistStash;
- (void)_presentAutoUpdateBannerOnUnlock;
- (void)_recordLastUnlockTimePostPrepare;
- (void)_reportOTAEvent:(id)a3 withStatus:(id)a4 policy:(id)a5 descriptor:(id)a6 additionalMetrics:(id)a7 error:(id)a8;
- (void)_reportOTAEvent:(id)a3 withStatus:(id)a4 policy:(id)a5 primaryDescriptor:(id)a6 alternateDescriptor:(id)a7 additionalMetrics:(id)a8 error:(id)a9;
- (void)_reportRollbackEvent:(id)a3 withInfo:(id)a4 buildVersion:(id)a5;
- (void)_resumeFromLastKnownState;
- (void)_submitCoreAnalyticsEvent:(id)a3;
- (void)activated:(BOOL)a3;
- (void)addUnlockCallback:(SEL)a3 forKey:(id)a4;
- (void)adoptPotentialSessionID;
- (void)amendManagedScanOptions:(id)a3 withResponse:(id)a4;
- (void)assetAudienceChanged:(id)a3;
- (void)autoSUFailedWithError:(id)a3;
- (void)autoScanAndDownloadIfAvailable:(int)a3 downloadNow:(BOOL)a4 withResult:(id)a5;
- (void)autoScanAndDownloadIfAvailable:(int)a3 withResult:(id)a4;
- (void)autoUpdateFound:(id)a3 downloadNow:(BOOL)a4;
- (void)badgeSettingsForManualSoftwareUpdate:(id)a3;
- (void)cleanupPreviousDownloadState;
- (void)clearBadgeAndBanner;
- (void)clearKeybagStash;
- (void)clearUnlockCallbacks;
- (void)createInstallationKeybag:(id)a3 withResult:(id)a4;
- (void)createSessionID;
- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 downloadOption:(id)a5 replyHandler:(id)a6;
- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 replyHandler:(id)a5;
- (void)deviceIsUpToDateForSU:(BOOL)a3 forSplat:(BOOL)a4;
- (void)dismissAutoUpdateBanner;
- (void)dismissInsufficientDiskSpaceFollowupForUpdate:(id)a3 orForce:(BOOL)a4;
- (void)dismissLegacyFollowUps;
- (void)doUnlockEvents;
- (void)downloadCompleted:(id)a3;
- (void)downloadCompleted:(id)a3 informClients:(BOOL)a4;
- (void)downloadProgress:(id)a3;
- (void)endAutoDownloadTasksAndResetState;
- (void)installCompleted:(id)a3;
- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4;
- (void)installUpdateWithOptions:(id)a3 withResult:(id)a4;
- (void)isUpdateReadyForInstallationWithOptions:(id)a3 replyHandler:(id)a4;
- (void)keybagInterface:(id)a3 passcodeLockedStateDidChange:(BOOL)a4;
- (void)loadBrainOnUnlock;
- (void)loadSavedState;
- (void)managedInstallRequested;
- (void)networkMonitorDetectOverrides;
- (void)noteAutoDownloadFailedToStartWithError:(id)a3;
- (void)persistStashOnUnlock;
- (void)presentAutoUpdateBanner:(id)a3;
- (void)presentRollbackSuggestionAlertWithDescriptor:(id)a3 info:(id)a4;
- (void)presentRollbackSuggestionFollowUpWithCoreDescriptor:(id)a3 info:(id)a4;
- (void)presentRollbackSuggestionFollowUpWithRollbackDescriptor:(id)a3 info:(id)a4;
- (void)removeUnlockCallback:(id)a3;
- (void)reportCoreAnalyticsOTAAbandonedEvent:(id)a3;
- (void)reportCoreAnalyticsOTAAvailableEvent:(id)a3;
- (void)reportCoreAnalyticsOTADownloadedEvent;
- (void)reportCoreAnalyticsOTAStartedDownloadingEvent:(id)a3;
- (void)reportOTAAbandonedEvent;
- (void)reportOTAAbandonedEventWithError:(id)a3;
- (void)reportOTAAbandonedEventWithError:(id)a3 additionalMetrics:(id)a4;
- (void)reportOTAAutoTriggeredEvent;
- (void)reportOTAAvailableEvent:(id)a3;
- (void)reportOTADownloadedEvent:(id)a3;
- (void)reportOTAInstalledEvent;
- (void)reportOTAStartedDownloadingEvent:(id)a3;
- (void)reportOTASucceededEvent;
- (void)reportPostponedEvent:(id)a3 withStatus:(id)a4;
- (void)reportPostponedEvent:(id)a3 withStatus:(id)a4 withAdditionalMetrics:(id)a5;
- (void)reportRSRRollbackSuggestedEventWithDescriptor:(id)a3 rollbackSuggestionInfo:(id)a4;
- (void)reportRSRRollbackSuggestedEventWithRollbackDescriptor:(id)a3 rollbackSuggestionInfo:(id)a4;
- (void)reportSimulatedOTAAutoTriggeredEvent;
- (void)reporterFlushEvent;
- (void)resetDownloadState;
- (void)resumeOrResetIfNecessary;
- (void)revokedUpdateFound:(id)a3;
- (void)rollbackCompleted:(id)a3 withError:(id)a4;
- (void)rollbackReadyForReboot;
- (void)rollbackStarted:(id)a3;
- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4;
- (void)scanForUpdates:(id)a3 complete:(id)a4;
- (void)scanForUpdates:(id)a3 shouldUseDDMInState:(BOOL)a4 complete:(id)a5;
- (void)securityResponseRollbackSuggested:(id)a3 withResult:(id)a4;
- (void)sendUnlockNotifications:(BOOL)a3;
- (void)setAlternateLastScannedDescriptor:(id)a3;
- (void)setCoreReporter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloader:(id)a3;
- (void)setDownloading:(BOOL)a3;
- (void)setEngine:(id)a3;
- (void)setFollowUpController:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setInstallPolicy:(id)a3;
- (void)setInstaller:(id)a3;
- (void)setIsInstallTonight:(BOOL)a3;
- (void)setIsInstallTonightScheduled:(BOOL)a3;
- (void)setIsUpdateDownloaded:(BOOL)a3;
- (void)setLastStashbagPersistedDate:(id)a3;
- (void)setMandatoryUpdateDictionary:(id)a3;
- (void)setPasscodePolicy:(id)a3;
- (void)setPotentialNextSessionID:(id)a3;
- (void)setPreferredLastScannedDescriptor:(id)a3;
- (void)setResetDownloadStateOnCleanActivation:(BOOL)a3;
- (void)setRollback:(id)a3;
- (void)setRollbackValue:(id)a3 forKey:(id)a4 count:(int)a5 event:(id)a6;
- (void)setScanner:(id)a3;
- (void)setSessionID:(id)a3;
- (void)showInsufficientDiskSpaceFollowupForUpdate:(id)a3;
- (void)startDownloadWithMetadata:(id)a3 withResult:(id)a4;
- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)suggestRollback:(id)a3 rollbackDescriptor:(id)a4 withResult:(id)a5;
- (void)tryAutoDownload;
- (void)unbadgeSettingsForManualSoftwareUpdate;
- (void)unscheduleRecommendedUpdateNotification;
- (void)updateDownloadMetadata:(id)a3 withResult:(id)a4;
- (void)updateDownloadOptions:(id)a3 withResult:(id)a4;
- (void)updateInstallPolicyAutoUpdateEnabled:(BOOL)a3;
- (void)updateInstallPolicyType:(unint64_t)a3;
- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5;
@end

@implementation SUManagerCore

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)download
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = [(SUManagerCore *)self downloader];
  v4 = [v3 download];

  return v4;
}

- (void)setForeground:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = [(SUManagerCore *)self downloader];
  [v5 setForeground:v3];
}

- (SUDownloader)downloader
{
  return self->_downloader;
}

- (SUManagerCore)init
{
  v41.receiver = self;
  v41.super_class = (Class)SUManagerCore;
  v2 = [(SUManagerCore *)&v41 init];
  BOOL v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_delegate, 0);
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    resumeFromStateSemaphore = v3->_resumeFromStateSemaphore;
    v3->_resumeFromStateSemaphore = (OS_dispatch_semaphore *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.softwareupdateservices.workqueue", v6);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.softwareupdateservices.externWorkqueue", v9);
    externWorkQueue = v3->_externWorkQueue;
    v3->_externWorkQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v12;

    uint64_t v14 = +[SUState currentState];
    state = v3->_state;
    v3->_state = (SUState *)v14;

    mandatoryUpdateDictionary = v3->_mandatoryUpdateDictionary;
    v3->_mandatoryUpdateDictionary = 0;

    sessionID = v3->_sessionID;
    v3->_sessionID = 0;

    potentialNextSessionID = v3->_potentialNextSessionID;
    v3->_potentialNextSessionID = 0;

    followUpController = v3->_followUpController;
    v3->_followUpController = 0;

    uint64_t v20 = [objc_alloc(MEMORY[0x263F77DC8]) initStoringToPath:@"/var/mobile/Library/SoftwareUpdate"];
    coreReporter = v3->_coreReporter;
    v3->_coreReporter = (SUCoreEventReporter *)v20;

    lastStashbagPersistedDate = v3->_lastStashbagPersistedDate;
    v3->_lastStashbagPersistedDate = 0;

    v3->_reportStartedFromPersistedState = 0;
    v23 = [[SUManagerEngine alloc] initWithDelegate:v3];
    engine = v3->_engine;
    v3->_engine = v23;

    if (!v3->_engine) {
      SULogInfo(@"Failed creating SUManagerEngine", v25, v26, v27, v28, v29, v30, v31, v38);
    }
    v32 = v3->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __21__SUManagerCore_init__block_invoke;
    block[3] = &unk_26447C878;
    v33 = v3;
    v40 = v33;
    dispatch_sync(v32, block);
    uint64_t v34 = +[SUManagedDeviceManager sharedInstance];
    managedDeviceManager = v33->_managedDeviceManager;
    v33->_managedDeviceManager = (SUManagedDeviceManager *)v34;

    [(SUManagedDeviceManager *)v33->_managedDeviceManager setDelegate:v33];
    updateOfCurrentStorageFollowup = v33->_updateOfCurrentStorageFollowup;
    v33->_updateOfCurrentStorageFollowup = 0;

    v33->_resetDownloadStateOnCleanActivation = 0;
  }
  return v3;
}

uint64_t __21__SUManagerCore_init__block_invoke(uint64_t a1)
{
  v2 = [[SUScanner alloc] initWithCore:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_semaphore_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  id v5 = [[SUDownloader alloc] initWithCore:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(a1 + 32);
  dispatch_queue_t v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  v8 = [[SUInstaller alloc] initWithCore:*(void *)(a1 + 32)];
  uint64_t v9 = *(void *)(a1 + 32);
  dispatch_queue_t v10 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v8;

  v11 = [[SURollbackController alloc] initWithCore:*(void *)(a1 + 32)];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = *(void **)(a1 + 32);

  return [v14 loadSavedState];
}

- (void)loadSavedState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUState *)self->_state unlockCallbacks];

  if (v3)
  {
    dispatch_semaphore_t v4 = [(SUState *)self->_state unlockCallbacks];
    id v5 = (NSMutableDictionary *)[v4 mutableCopy];
    unlockCallbacks = self->_unlockCallbacks;
    self->_unlockCallbacks = v5;
  }
  else
  {
    dispatch_queue_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dispatch_semaphore_t v4 = self->_unlockCallbacks;
    self->_unlockCallbacks = v7;
  }

  v8 = [(SUState *)self->_state installPolicy];

  if (v8)
  {
    uint64_t v9 = [(SUState *)self->_state installPolicy];
    [(SUManagerCore *)self setInstallPolicy:v9];

    dispatch_queue_t v10 = [(SUManagerCore *)self installPolicy];
    SULogDebug(@"Found install policy: %@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v10);
  }
  else
  {
    dispatch_queue_t v10 = [(SUManagerCore *)self installPolicy];
    SULogDebug(@"No install policy saved, using default: %@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v10);
  }

  [(SUManagerCore *)self updateInstallPolicyAutoUpdateEnabled:[(SUManagerCore *)self isAutoUpdateEnabled]];
  uint64_t v25 = [(SUManagerCore *)self installPolicy];
  SULogDebug(@"reset install policy to: %@", v26, v27, v28, v29, v30, v31, v32, (uint64_t)v25);

  v33 = [(SUState *)self->_state mandatoryUpdateDict];

  if (v33)
  {
    uint64_t v34 = [(SUState *)self->_state mandatoryUpdateDict];
    mandatoryUpdateDictionary = self->_mandatoryUpdateDictionary;
    self->_mandatoryUpdateDictionary = v34;
  }
  v36 = [(SUState *)self->_state sessionID];

  if (v36)
  {
    v37 = [(SUState *)self->_state sessionID];
    [(SUManagerCore *)self setSessionID:v37];

    [(SUManagerCore *)self setPotentialNextSessionID:0];
    SULogInfo(@"loading saved sessionID: %@", v38, v39, v40, v41, v42, v43, v44, (uint64_t)self->_sessionID);
  }
  else
  {
    [(SUManagerCore *)self createSessionID];
    state = self->_state;
    [(SUState *)state save];
  }
}

- (void)resumeOrResetIfNecessary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUState *)self->_state lastProductBuild];
  dispatch_semaphore_t v4 = [(SUState *)self->_state lastProductVersion];
  id v5 = [(SUState *)self->_state lastSplatRestoreVersion];
  uint64_t v6 = [(SUState *)self->_state lastRollbackDescriptor];
  v148 = +[SUUtility currentProductType];
  v150 = +[SUUtility currentProductBuild];
  uint64_t v7 = +[SUUtility currentProductVersion];
  v147 = +[SUUtility currentReleaseType];
  v8 = [MEMORY[0x263F77D98] sharedDevice];
  uint64_t v9 = [v8 splatRestoreVersion];

  int v10 = 1;
  +[SUUtility setCacheable:1];
  uint64_t v11 = +[SUKeybagInterface sharedInstance];
  [v11 addObserver:self];

  v149 = (void *)v7;
  if ([v4 isEqualToString:v7]) {
    int v10 = [v3 isEqualToString:v150] ^ 1;
  }
  int64_t v12 = +[SUUtility compareRestoreVersion:v5 withRestoreVersion:v9];
  if (v12 == -1) {
    int v20 = v10;
  }
  else {
    int v20 = 1;
  }
  v146 = (void *)v9;
  if (v20 == 1)
  {
    if (v12 == 1) {
      char v21 = v10;
    }
    else {
      char v21 = 1;
    }
    if (v21)
    {
      int v22 = 1;
      goto LABEL_15;
    }
    uint64_t v23 = @"Splat RestoreVersion decremented";
  }
  else
  {
    uint64_t v23 = @"Splat RestoreVersion incremented";
  }
  int v22 = v20 ^ 1;
  SULogInfo(v23, v13, v14, v15, v16, v17, v18, v19, v137);
LABEL_15:
  char v143 = v22;
  int v24 = v20 & v22 & (v10 ^ 1);
  uint64_t v32 = [(SUState *)self->_state appliedTime];
  if (v32)
  {
    v33 = +[SUUtility bootTime];
    if ([v33 compare:v32] != 1)
    {
      int v50 = 0;
      goto LABEL_29;
    }
    v144 = v32;
    v141 = v6;
    uint64_t v34 = [(SUState *)self->_state lastDownload];
    v35 = [v34 descriptor];

    v36 = [v35 productVersion];
    v142 = v5;
    v37 = v4;
    uint64_t v38 = v3;
    if ([v36 isEqualToString:v149])
    {
      uint64_t v39 = [v35 productBuildVersion];
      int v40 = [v39 isEqualToString:v150];

      if (v40)
      {
        uint64_t v41 = [v35 productVersion];
        uint64_t v42 = [v35 productBuildVersion];
        SULogInfo(@"Found update (%@.%@) applied at (%@) and then system reboot at (%@), considering as new OS", v43, v44, v45, v46, v47, v48, v49, (uint64_t)v41);
        goto LABEL_26;
      }
    }
    else
    {
    }
    if (!v24)
    {
      int v50 = 0;
      goto LABEL_28;
    }
    uint64_t v41 = [v35 productVersion];
    uint64_t v42 = [v35 productBuildVersion];
    SULogInfo(@"Found update (%@.%@) applied at (%@) and then system reboot at (%@) to the previous OS (%@.%@), update was consumed, cleaning prior state", v51, v52, v53, v54, v55, v56, v57, (uint64_t)v41);
LABEL_26:

    int v50 = 1;
LABEL_28:
    uint64_t v3 = v38;
    dispatch_semaphore_t v4 = v37;
    uint64_t v6 = v141;
    id v5 = v142;

    uint64_t v32 = v144;
LABEL_29:
    [(SUState *)self->_state setAppliedTime:0];
    [(SUState *)self->_state save];

    if ((v50 & 1) == 0 && ((v24 ^ 1) & 1) == 0) {
      goto LABEL_31;
    }
    SULogInfo(@"New OS detected; resetting all prior state.", v25, v26, v27, v28, v29, v30, v31, v137);
    if (v50)
    {
      [(SUManagerCore *)self reportOTASucceededEvent];
      id v66 = objc_alloc_init(MEMORY[0x263F77B68]);
      v74 = v66;
      if (v66)
      {
        v75 = v32;
        v76 = v6;
        v158[0] = 0;
        char v77 = [v66 cleanupNonInstalledDocumentationWithError:v158];
        id v78 = v158[0];
        v86 = v78;
        if ((v77 & 1) == 0) {
          SULogInfo(@"Failed to clean up stashed documentation data: %@", v79, v80, v81, v82, v83, v84, v85, (uint64_t)v78);
        }

        uint64_t v6 = v76;
        uint64_t v32 = v75;
      }
      else
      {
        SULogInfo(@"Failed to init SUCoreDocumentationDataManager. Unable to clean up stashed documentation data", v67, v68, v69, v70, v71, v72, v73, v138);
      }
    }
    goto LABEL_39;
  }
  if (v24)
  {
LABEL_31:
    SULogInfo(@"Attempting to resume from last known state.", v25, v26, v27, v28, v29, v30, v31, v137);
    [(SUManagerCore *)self _resumeFromLastKnownState];
    v65 = v146;
    goto LABEL_53;
  }
  SULogInfo(@"New OS detected; resetting all prior state.", v25, v26, v27, v28, v29, v30, v31, v137);
LABEL_39:
  v145 = v32;
  v87 = v6;
  [(SUManagerCore *)self clearBadgeAndBanner];
  [(SUManagerCore *)self removeUnlockCallback:@"unlockCallbackRecordDataForBrain"];
  SULogInfo(@"Removing previously stashed ControllerDataForBrain file", v88, v89, v90, v91, v92, v93, v94, v138);
  v139 = @"Controller/ControllerDataForBrain.plist";
  v95 = [NSString stringWithFormat:@"/var/MobileSoftwareUpdate/%@"];
  v96 = [MEMORY[0x263F08850] defaultManager];
  if ([v96 fileExistsAtPath:v95])
  {
    id v157 = 0;
    [v96 removeItemAtPath:v95 error:&v157];
    id v104 = v157;
    if (v104) {
      SULogInfo(@"Failed to remove old controller data file at %@ : %@", v97, v98, v99, v100, v101, v102, v103, (uint64_t)v95);
    }
    else {
      SULogInfo(@"Successfully removed old controller data file at %@", v97, v98, v99, v100, v101, v102, v103, (uint64_t)v95);
    }
  }
  [(SUManagerEngine *)self->_engine activateLoadingPersisted:0];
  v105 = +[SUUtility currentReleaseType];
  int v106 = [v105 isEqualToString:@"Internal"];

  if (v106)
  {
    xpc_object_t v107 = xpc_array_create(0, 0);
    xpc_array_set_string(v107, 0xFFFFFFFFFFFFFFFFLL, "basejumper.apple.com");
    xpc_array_set_string(v107, 0xFFFFFFFFFFFFFFFFLL, "cheeserolling.apple.com");
    xpc_array_set_string(v107, 0xFFFFFFFFFFFFFFFFLL, "gdmf-staging-int.apple.com");
    xpc_array_set_string(v107, 0xFFFFFFFFFFFFFFFFLL, "locksmith.apple.com");
    NEHelperSettingsSetArray();
    SULogInfo(@"Allowing basejumper.apple.com, cheeserolling.apple.com, gdmf-staging-int.apple.com and locksmith.apple.com to trigger VPN On Demand (when installed)", v108, v109, v110, v111, v112, v113, v114, (uint64_t)v139);
  }
  v115 = +[SUScheduler sharedInstance];
  [v115 cancelAllAutoInstallTasks];

  [(SUState *)self->_state setLastAutoInstallOperationModel:0];
  [(SUManagerCore *)self clearUnlockCallbacks];
  [(SUManagerCore *)self setMandatoryUpdateDictionary:0];
  [(SUManagerCore *)self createSessionID];
  [(SUManagerCore *)self setPreferredLastScannedDescriptor:0];
  [(SUManagerCore *)self setAlternateLastScannedDescriptor:0];
  [(SUState *)self->_state resetAllHistory];
  [(SUState *)self->_state setLastProductType:v148];
  [(SUState *)self->_state setLastProductBuild:v150];
  [(SUState *)self->_state setLastProductVersion:v149];
  [(SUState *)self->_state setLastReleaseType:v147];
  [(SUState *)self->_state setLastSplatRestoreVersion:v146];
  [(SUState *)self->_state setLastRecommendedUpdateVersion:0];
  [(SUState *)self->_state setLastRecommendedUpdateInterval:0];
  [(SUState *)self->_state setLastRecommendedUpdateDiscoveryDate:0];
  [(SUState *)self->_state save];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v117 = objc_opt_respondsToSelector();

  if (v117)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke;
    block[3] = &unk_26447CED8;
    void block[4] = self;
    id v155 = v150;
    char v156 = 0;
    dispatch_async(workQueue, block);
  }
  if ((v20 & 1) == 0)
  {
    v126 = self->_workQueue;
    v153[0] = MEMORY[0x263EF8330];
    v153[1] = 3221225472;
    v153[2] = __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke_2;
    v153[3] = &unk_26447C878;
    v153[4] = self;
    dispatch_async(v126, v153);
  }
  uint64_t v6 = v87;
  if ((v143 & 1) == 0)
  {
    v127 = self->_workQueue;
    v151[0] = MEMORY[0x263EF8330];
    v151[1] = 3221225472;
    v151[2] = __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke_3;
    v151[3] = &unk_26447C8C8;
    v151[4] = self;
    id v152 = v87;
    dispatch_async(v127, v151);
    +[SUUtility deleteKeepAliveFile];
  }
  SULogInfo(@"State reset complete.", v118, v119, v120, v121, v122, v123, v124, (uint64_t)v139);

  uint64_t v32 = v145;
  v65 = v146;
LABEL_53:
  SULogInfo(@"waiting %d seconds to resume from last known state", v58, v59, v60, v61, v62, v63, v64, 2);
  dispatch_time_t v128 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_resumeFromStateSemaphore, v128)) {
    v136 = @"waiting for resume from last known state timed out, continue anyway";
  }
  else {
    v136 = @"done waiting for resume from last known state, continuing";
  }
  SULogInfo(v136, v129, v130, v131, v132, v133, v134, v135, v140);
}

void __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained newOSDetected:*(void *)(a1 + 40) deleteKeepAlive:*(unsigned __int8 *)(a1 + 48)];
}

void __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained splatUpdateDetected];
}

void __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained splatRollbackDetected:*(void *)(a1 + 40)];
}

- (void)_resumeFromLastKnownState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUState *)self->_state lastDownload];
  dispatch_semaphore_t v4 = (void *)[v3 copy];

  if (!v4 || ![v4 isValidDownload])
  {
    uint64_t v13 = 0;
    uint64_t v44 = @"No previous download recognized; cleaning up all software update assets.";
LABEL_8:
    SULogInfo(v44, v5, v6, v7, v8, v9, v10, v11, v78);
    [(SUManagerCore *)self resetDownloadState];
    [(SUManagerEngine *)self->_engine activateLoadingPersisted:0];
    uint64_t v45 = 0;
    id v87 = 0;
    goto LABEL_9;
  }
  int64_t v12 = [v4 descriptor];
  uint64_t v13 = [(SUManagerCore *)self coreDescriptorForSUDescriptor:v12];

  id v87 = [v13 getMASoftwareUpdateAsset];
  [v4 descriptor];
  uint64_t v80 = v81 = v13;
  SULogInfo(@"Found last download: %@ with descriptor: %@ and matching core descriptor: %@ with asset: %@", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v4);

  if (!v87)
  {
    uint64_t v44 = @"No last asset found; cleaning up all software update assets.";
    goto LABEL_8;
  }
  char v21 = [v4 downloadOptions];
  int v22 = [v4 descriptor];
  uint64_t v23 = +[SUDownloadPolicyFactory userDownloadPolicyForDescriptor:v22];
  [v21 setActiveDownloadPolicy:v23];

  int v24 = [(SUManagerCore *)self downloader];
  [v24 setDownload:v4];

  uint64_t v25 = [(SUManagerCore *)self downloader];
  [v25 setDownloadAsset:v87];

  uint64_t v26 = [v4 progress];
  LODWORD(v23) = [v26 isDone];

  v86 = v13;
  if (!v23)
  {
    SULogInfo(@"Last known state indicates update was *not* downloaded and prepared. Unregistering unlock callback", v27, v28, v29, v30, v31, v32, v33, v78);
    [(SUManagerCore *)self removeUnlockCallback:@"unlockCallbackRecordDataForBrain"];
    [(SUManagerCore *)self setDownloading:1];
    [(SUManagerCore *)self setResetDownloadStateOnCleanActivation:1];
    id v46 = +[SUAssetSupport copyInstalledAssets];
    if (v46)
    {
      uint64_t v47 = [v87 assetId];
      char v48 = [v46 containsObject:v47];

      if (v48)
      {
LABEL_15:
        SULogInfo(@"Asset is installed, but prepare was interrupted", v49, v50, v51, v52, v53, v54, v55, v79);
        uint64_t v56 = 4;
LABEL_19:
        uint64_t v82 = v56;

        goto LABEL_20;
      }
    }
    else
    {
      id v66 = [v4 progress];
      uint64_t v67 = [v66 phase];
      int v68 = [@"SUDownloadPhasePreparingForInstallation" isEqualToString:v67];

      if (v68) {
        goto LABEL_15;
      }
    }
    uint64_t v56 = 2;
    goto LABEL_19;
  }
  uint64_t v34 = [v4 progress];
  v35 = [v34 phase];
  int v36 = [@"SUDownloadPhasePreparingForInstallation" isEqualToString:v35];

  if (!v36)
  {
    uint64_t v57 = [v4 progress];
    uint64_t v58 = [v57 phase];
    SULogInfo(@"Download progress is done, but phase is: %@", v59, v60, v61, v62, v63, v64, v65, (uint64_t)v58);

    uint64_t v82 = 0;
LABEL_20:
    int v83 = 0;
    goto LABEL_21;
  }
  SULogInfo(@"Last known state indicates update prepared. Re-registering for RecordDataForBrain unlock callback", v37, v38, v39, v40, v41, v42, v43, v78);
  [(SUManagerCore *)self removeUnlockCallback:@"unlockCallbackRecordDataForBrain"];
  [(SUManagerCore *)self addUnlockCallback:sel__recordLastUnlockTimePostPrepare forKey:@"unlockCallbackRecordDataForBrain"];
  int v83 = 1;
  [(SUManagerCore *)self setResetDownloadStateOnCleanActivation:1];
  uint64_t v82 = 5;
LABEL_21:
  uint64_t v69 = [SUManagerEngineDownloadDescriptor alloc];
  uint64_t v85 = [v4 descriptor];
  uint64_t v84 = [v85 releaseDate];
  uint64_t v70 = (void *)[v84 copy];
  uint64_t v71 = [(SUState *)self->_state sessionID];
  uint64_t v72 = (void *)[v71 copy];
  uint64_t v73 = [(SUState *)self->_state lastScannedDescriptorScanOptions];
  v74 = (void *)[v73 copy];
  v75 = [v4 downloadOptions];
  id v76 = [(SUManagerCore *)self newInstallTonightConfig];
  uint64_t v45 = -[SUManagerEngineDownloadDescriptor initWithAsset:releaseDate:sessionID:scanOptions:downloadOptions:installTonightConfig:coreDescriptor:downloadAtPhase:](v69, "initWithAsset:releaseDate:sessionID:scanOptions:downloadOptions:installTonightConfig:coreDescriptor:downloadAtPhase:", v87, v70, v72, v74, v75, v76, v86, v82, v81, v87);

  self->_reportStartedFromPersistedState = 1;
  [(SUManagerEngine *)self->_engine activateLoadingPersisted:v45];
  if (v83)
  {
    char v77 = [(SUManagerCore *)self managedDeviceManager];
    [v77 refreshAssetAudience];
  }
  uint64_t v13 = v86;
LABEL_9:
}

- (SUManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUManagerDelegate *)WeakRetained;
}

- (SUManagerEngine)engine
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  engine = self->_engine;

  return engine;
}

- (SUManagedDeviceManager)managedDeviceManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  managedDeviceManager = self->_managedDeviceManager;

  return managedDeviceManager;
}

- (SUDDMManager)ddmManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v2 = +[SUManagerServer sharedInstance];
  uint64_t v3 = [v2 ddmManager];

  return (SUDDMManager *)v3;
}

- (SUState)state
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  state = self->_state;

  return state;
}

- (NSHashTable)observers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  observers = self->_observers;

  return observers;
}

- (BOOL)isScanning
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUManagerCore *)self scanner];
  char v4 = [v3 isScanning];

  return v4;
}

- (BOOL)isDownloading
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUManagerCore *)self downloader];
  char v4 = [v3 isDownloading];

  return v4;
}

- (BOOL)isUpdateDownloaded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUManagerCore *)self downloader];
  char v4 = [v3 isUpdateDownloaded];

  return v4;
}

- (void)setDownloading:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = [(SUManagerCore *)self downloader];
  [v5 setDownloading:v3];
}

- (BOOL)isForeground
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self downloader];
  char v4 = [v3 isForeground];

  return v4;
}

- (BOOL)isClearingSpace
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self downloader];
  char v4 = [v3 isClearingSpace];

  return v4;
}

- (BOOL)isInstalling
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self installer];
  char v4 = [v3 isInstalling];

  return v4;
}

- (BOOL)isInstalled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self installer];
  char v4 = [v3 isInstalled];

  return v4;
}

- (BOOL)isInstallTonight
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self installer];
  char v4 = [v3 isInstallTonight];

  return v4;
}

- (void)setIsInstallTonight:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = [(SUManagerCore *)self installer];
  [v5 setIsInstallTonight:v3];
}

- (BOOL)isInstallTonightScheduled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self installer];
  char v4 = [v3 isInstallTonightScheduled];

  return v4;
}

- (void)setIsInstallTonightScheduled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = [(SUManagerCore *)self installer];
  [v5 setIsInstallTonightScheduled:v3];
}

- (MAAsset)preferredAssetToDownloadFromLastScan
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self scanner];
  char v4 = [v3 preferredLastScannedCoreDescriptor];
  id v5 = [v4 getMASoftwareUpdateAsset];

  return (MAAsset *)v5;
}

- (MAAsset)alternateAssetToDownloadFromLastScan
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self scanner];
  char v4 = [v3 alternateLastScannedCoreDescriptor];
  id v5 = [v4 getMASoftwareUpdateAsset];

  return (MAAsset *)v5;
}

- (SUCoreDescriptor)preferredLastScannedDescriptor
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self scanner];
  char v4 = [v3 preferredLastScannedCoreDescriptor];

  return (SUCoreDescriptor *)v4;
}

- (void)setPreferredLastScannedDescriptor:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v6 = [(SUManagerCore *)self scanner];
  [v6 setPreferredLastScannedCoreDescriptor:v5];
}

- (SUCoreDescriptor)alternateLastScannedDescriptor
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self scanner];
  char v4 = [v3 alternateLastScannedCoreDescriptor];

  return (SUCoreDescriptor *)v4;
}

- (void)setAlternateLastScannedDescriptor:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v6 = [(SUManagerCore *)self scanner];
  [v6 setAlternateLastScannedCoreDescriptor:v5];
}

- (id)discoveryDateForBuildVersion:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v6 = [(SUManagerCore *)self scanner];
  uint64_t v7 = [v6 discoveryDateforBuildVersion:v5];

  return v7;
}

- (id)fullyUnrampedDateForBuildVersion:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v6 = [(SUManagerCore *)self scanner];
  uint64_t v7 = [v6 fullyUnrampedDateForBuildVersion:v5];

  return v7;
}

- (SUScanOptions)lastScannedDescriptorScanOptions
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self scanner];
  char v4 = [v3 lastScannedDescriptorScanOptions];

  return (SUScanOptions *)v4;
}

- (NSDate)lastStashbagPersistedDate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  lastStashbagPersistedDate = self->_lastStashbagPersistedDate;

  return lastStashbagPersistedDate;
}

- (void)setLastStashbagPersistedDate:(id)a3
{
  char v4 = (NSDate *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  lastStashbagPersistedDate = self->_lastStashbagPersistedDate;
  self->_lastStashbagPersistedDate = v4;
}

- (SUAutoUpdatePasscodePolicy)passcodePolicy
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self installer];
  char v4 = [v3 passcodePolicy];

  return (SUAutoUpdatePasscodePolicy *)v4;
}

- (void)setPasscodePolicy:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v6 = [(SUManagerCore *)self installer];
  [v6 setPasscodePolicy:v5];
}

- (SUInstallPolicy)installPolicy
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self installer];
  char v4 = [v3 installPolicy];

  return (SUInstallPolicy *)v4;
}

- (void)setInstallPolicy:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v6 = [(SUManagerCore *)self installer];
  [v6 setInstallPolicy:v5];
}

- (SUSFollowUpController)followUpController
{
  followUpController = self->_followUpController;
  if (!followUpController)
  {
    char v4 = +[SUSFollowUpController sharedController];
    id v5 = self->_followUpController;
    self->_followUpController = v4;

    followUpController = self->_followUpController;
  }

  return followUpController;
}

- (void)_presentAutoUpdateBannerOnUnlock
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUManagerCore__presentAutoUpdateBannerOnUnlock__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __49__SUManagerCore__presentAutoUpdateBannerOnUnlock__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeUnlockCallback:@"unlockCallbackPresentAutoUpdateBanner"];
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(NSObject **)(v3 + 120);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUManagerCore__presentAutoUpdateBannerOnUnlock__block_invoke_2;
  block[3] = &unk_26447C878;
  void block[4] = v3;
  dispatch_after(v2, v4, block);
}

uint64_t __49__SUManagerCore__presentAutoUpdateBannerOnUnlock__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentAutoUpdateBanner:0];
}

- (void)_recordLastUnlockTimePostPrepare
{
}

void __49__SUManagerCore__recordLastUnlockTimePostPrepare__block_invoke()
{
  uint64_t v17 = @"Controller/ControllerDataForBrain.plist";
  id v18 = [NSString stringWithFormat:@"/var/MobileSoftwareUpdate/%@"];
  v0 = [MEMORY[0x263F08850] defaultManager];
  if (![v0 fileExistsAtPath:v18]
    || (SULogInfo(@"Existing ControllerDataForBrain file found", v1, v2, v3, v4, v5, v6, v7, @"Controller/ControllerDataForBrain.plist"), [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:v18], (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    SULogInfo(@"Existing ControllerDataForBrain file not found. Creating", v1, v2, v3, v4, v5, v6, v7, (uint64_t)v17);
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  uint64_t v9 = [MEMORY[0x263EFF910] date];
  [v8 setObject:v9 forKeyedSubscript:@"LastUnlockTimePostPrepare"];
  [v8 writeToFile:v18 atomically:1];
  SULogInfo(@"Wrote ControllerDataForBrain to disk %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v8);
}

- (void)_notifyEngineOnUnlock
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SUManagerCore__notifyEngineOnUnlock__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __38__SUManagerCore__notifyEngineOnUnlock__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) engine];
  [v1 onUnlock];
}

- (void)doUnlockEvents
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = self->_unlockCallbacks;
  uint64_t v4 = [(NSMutableDictionary *)v3 count];
  SULogInfo(@"callback count = %lu", v5, v6, v7, v8, v9, v10, v11, v4);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = [(NSMutableDictionary *)v3 allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [(NSMutableDictionary *)v3 objectForKey:*(void *)(*((void *)&v34 + 1) + 8 * v16)];
        SULogInfo(@"selector string = %@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);
        if (v17)
        {
          SEL v25 = NSSelectorFromString(v17);
          if (v25 && (SEL v33 = v25, (objc_opt_respondsToSelector() & 1) != 0)) {
            [(SUManagerCore *)self performSelector:v33];
          }
          else {
            SULogInfo(@"Unknown selector %@ for SUManagerCore", v26, v27, v28, v29, v30, v31, v32, (uint64_t)v17);
          }
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v14);
  }
}

- (void)addUnlockCallback:(SEL)a3 forKey:(id)a4
{
  id v25 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (a3)
  {
    if (v25)
    {
      uint64_t v13 = NSStringFromSelector(a3);
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        SULogInfo(@"Adding unlock callback %@ for key %@", v6, v7, v8, v9, v10, v11, v12, v13);
        [(NSMutableDictionary *)self->_unlockCallbacks setSafeObject:v14 forKey:v25];
        uint64_t v15 = [(NSMutableDictionary *)self->_unlockCallbacks count];
        SULogInfo(@"unlock callback count = %lu", v16, v17, v18, v19, v20, v21, v22, v15);
        [(SUState *)self->_state setUnlockCallbacks:self->_unlockCallbacks];
        [(SUState *)self->_state save];

        goto LABEL_9;
      }
      uint64_t v23 = @"Failed to create NSString from selector";
    }
    else
    {
      uint64_t v23 = @"Cannot add unlock callbakc with nil unlockCallbackKey";
    }
  }
  else
  {
    uint64_t v23 = @"Cannot add unlock callback with nil selector";
  }
  SULogInfo(v23, v6, v7, v8, v9, v10, v11, v12, v24);
LABEL_9:
}

- (void)removeUnlockCallback:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  SULogInfo(@"removing unlock callback for key %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  [(NSMutableDictionary *)self->_unlockCallbacks removeObjectForKey:v5];

  uint64_t v13 = [(NSMutableDictionary *)self->_unlockCallbacks count];
  SULogInfo(@"unlock callback count = %lu", v14, v15, v16, v17, v18, v19, v20, v13);
  [(SUState *)self->_state setUnlockCallbacks:self->_unlockCallbacks];
  state = self->_state;

  [(SUState *)state save];
}

- (void)clearUnlockCallbacks
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  SULogInfo(@"Clearing unlock callbacks", v3, v4, v5, v6, v7, v8, v9, v11);
  [(NSMutableDictionary *)self->_unlockCallbacks removeAllObjects];
  [(SUState *)self->_state setUnlockCallbacks:self->_unlockCallbacks];
  state = self->_state;

  [(SUState *)state save];
}

- (void)createSessionID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = [v3 UUIDString];
  [(SUManagerCore *)self setSessionID:v4];

  [(SUState *)self->_state setSessionID:self->_sessionID];
  [(SUManagerCore *)self setPotentialNextSessionID:0];
  SULogInfo(@"Created new sessionID: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)self->_sessionID);
}

- (id)createpotentialNextSessionID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (self->_sessionID
    || (SULogInfo(@"Creating potentialNextSessionID when no sessionID", v3, v4, v5, v6, v7, v8, v9, v32),
        [(SUManagerCore *)self createSessionID],
        [(SUState *)self->_state save],
        self->_sessionID))
  {
    uint64_t v10 = [MEMORY[0x263F08C38] UUID];
    uint64_t v11 = [v10 UUIDString];

    if ((unint64_t)[v11 length] < 4 || -[NSString length](self->_sessionID, "length") < 4)
    {
      [(SUManagerCore *)self setPotentialNextSessionID:v11];
    }
    else
    {
      uint64_t v12 = objc_msgSend(v11, "substringWithRange:", 0, objc_msgSend(v11, "length") - 3);
      uint64_t v13 = +[SUPreferences sharedInstance];
      uint64_t v14 = [v13 overrideScanSessionIDRampingPortion];

      if (v14)
      {
        SULogInfo(@"The ramping portion is set to %@ by default", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v14);
      }
      else
      {
        uint64_t v14 = -[NSString substringWithRange:](self->_sessionID, "substringWithRange:", [(NSString *)self->_sessionID length] - 3, 3);
      }
      uint64_t v29 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v12, v14];
      [(SUManagerCore *)self setPotentialNextSessionID:v29];
    }
    SULogInfo(@"Created new potentialNextSessionID: %@", v22, v23, v24, v25, v26, v27, v28, (uint64_t)self->_potentialNextSessionID);
  }
  potentialNextSessionID = self->_potentialNextSessionID;

  return potentialNextSessionID;
}

- (void)adoptPotentialSessionID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  [(SUManagerCore *)self setSessionID:self->_potentialNextSessionID];
  [(SUState *)self->_state setSessionID:self->_sessionID];
  [(SUManagerCore *)self setPotentialNextSessionID:0];
  SULogInfo(@"Adopted potentialNextSessionID as new sessionID: %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)self->_sessionID);
}

- (NSString)sessionID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  sessionID = self->_sessionID;

  return sessionID;
}

- (BOOL)isAutoUpdateEnabled
{
  uint64_t v2 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUState *)v2->_state lastDownload];
  uint64_t v4 = [v3 descriptor];
  LOBYTE(v2) = [(SUManagerCore *)v2 isDescriptorAutoUpdatable:v4];

  return (char)v2;
}

- (BOOL)isDescriptorAutoDownloadable:(id)a3
{
  id v11 = a3;
  if (!v11)
  {
    uint64_t v24 = @"nil update is not auto downloadable";
    goto LABEL_10;
  }
  uint64_t v12 = +[SUPreferences sharedInstance];
  char v13 = [v12 autoDownloadDeletedBuild];

  if (v13)
  {
LABEL_8:
    if (![v11 rampEnabled])
    {
      if ([v11 updateType] == 4)
      {
        uint64_t v26 = [(SUState *)self->_state rolledBackBuildVersions];
        if (v26)
        {
          uint64_t v27 = (void *)v26;
          uint64_t v28 = [v11 productBuildVersion];
          if (v28)
          {
            uint64_t v29 = (void *)v28;
            uint64_t v30 = [(SUState *)self->_state rolledBackBuildVersions];
            uint64_t v31 = [v11 productBuildVersion];
            int v32 = [v30 containsObject:v31];

            if (v32)
            {
              uint64_t v24 = @"Update not auto downloadable because it was rolled back";
              goto LABEL_10;
            }
          }
          else
          {
          }
        }
      }
      BOOL v25 = 1;
      goto LABEL_19;
    }
    uint64_t v24 = @"Update not auto downloadable because ramp=YES";
LABEL_10:
    SULogInfo(v24, v4, v5, v6, v7, v8, v9, v10, v34);
    goto LABEL_11;
  }
  uint64_t v14 = [(SUState *)self->_state lastDeletedSUAssetID];
  if (!v14
    || ([v11 assetID],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 isEqualToString:v14],
        v15,
        !v16))
  {

    goto LABEL_8;
  }
  SULogInfo(@"Update not auto downloadable because it was previously deleted by the user", v17, v18, v19, v20, v21, v22, v23, v34);

LABEL_11:
  BOOL v25 = 0;
LABEL_19:

  return v25;
}

- (BOOL)isDescriptorAutoUpdatable:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  char v5 = [v4 autoUpdateEnabled];
  if ([v4 updateType] != 4)
  {
    uint64_t v13 = [v4 upgradeType];
    uint64_t v14 = +[SUPreferences sharedInstance];
    int v15 = [v14 isAutomaticUpdateV2Enabled];

    if (v13 == 1) {
      char v16 = v5;
    }
    else {
      char v16 = 0;
    }
    if (v15) {
      char v17 = v16;
    }
    else {
      char v17 = 0;
    }
    uint64_t v18 = +[SUPreferences sharedInstance];
    char v19 = [v18 autoUpdateForceOn];

    if ((v19 & 1) == 0)
    {
      uint64_t v20 = +[SUPreferences sharedInstance];
      char v21 = [v20 autoUpdateForceOff];

      char v12 = v17 & ~v21;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  uint64_t v6 = +[SUPreferences sharedInstance];
  char v7 = [v6 autoInstallSecurityResponse];

  uint64_t v8 = +[SUPreferences sharedInstance];
  char v9 = [v8 autoInstallSecurityResponseForceOn];

  if (v9)
  {
LABEL_11:
    char v12 = 1;
    goto LABEL_13;
  }
  uint64_t v10 = +[SUPreferences sharedInstance];
  char v11 = [v10 autoInstallSecurityResponseForceOff];

  char v12 = v7 & ~v11 & v5;
LABEL_13:

  return v12;
}

- (void)_loadBrainOnUnlockCallback
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUManagerCore__loadBrainOnUnlockCallback__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __43__SUManagerCore__loadBrainOnUnlockCallback__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) downloader];
  [v1 _loadBrainOnUnlockCallback];
}

- (void)loadBrainOnUnlock
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v4 = [(SUManagerCore *)self downloader];
  uint64_t v3 = [(SUManagerCore *)self updateToAutoDownload];
  [v4 loadBrainOnUnlockForDescriptor:v3];
}

- (void)tryAutoDownload
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = [(SUManagerCore *)self downloader];
  [v3 tryAutoDownload];
}

- (void)noteAutoDownloadFailedToStartWithError:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v6 = [(SUManagerCore *)self downloader];
  [v6 noteAutoDownloadFailedToStartWithError:v5];
}

- (void)endAutoDownloadTasksAndResetState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = [(SUManagerCore *)self downloader];
  [v3 endAutoDownloadTasksAndResetState];
}

- (void)scanForUpdates:(id)a3 complete:(id)a4
{
  workQueue = self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v9 = [(SUManagerCore *)self scanner];
  [v9 scanForUpdates:v8 complete:v7];
}

- (void)scanForUpdates:(id)a3 shouldUseDDMInState:(BOOL)a4 complete:(id)a5
{
  BOOL v5 = a4;
  workQueue = self->_workQueue;
  id v9 = a5;
  id v10 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v11 = [(SUManagerCore *)self scanner];
  [v11 scanForUpdates:v10 shouldUseDDMInState:v5 complete:v9];
}

- (void)autoScanAndDownloadIfAvailable:(int)a3 withResult:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  workQueue = self->_workQueue;
  id v7 = a4;
  dispatch_assert_queue_V2(workQueue);
  id v8 = [(SUManagerCore *)self scanner];
  [v8 autoScanAndDownloadIfAvailable:v4 withResult:v7];
}

- (void)autoScanAndDownloadIfAvailable:(int)a3 downloadNow:(BOOL)a4 withResult:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  workQueue = self->_workQueue;
  id v9 = a5;
  dispatch_assert_queue_V2(workQueue);
  id v10 = [(SUManagerCore *)self scanner];
  [v10 autoScanAndDownloadIfAvailable:v6 downloadNow:v5 withResult:v9];
}

- (void)autoUpdateFound:(id)a3 downloadNow:(BOOL)a4
{
  BOOL v4 = a4;
  workQueue = self->_workQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v8 = [(SUManagerCore *)self downloader];
  [v8 autoUpdateFound:v7 downloadNow:v4];
}

- (void)revokedUpdateFound:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  SULogInfo(@"Revoked update found: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  char v12 = [v4 productBuildVersion];
  uint64_t v19 = 0;
  BOOL v13 = [(SUManagerCore *)self shouldShowRollbackSuggestionAlert:v12 error:&v19];

  if (v13)
  {
    uint64_t v14 = objc_alloc_init(SURollbackSuggestionInfo);
    int v15 = [MEMORY[0x263F086E0] mainBundle];
    char v16 = [v15 bundleIdentifier];
    [(SURollbackSuggestionInfo *)v14 setClientIdentifier:v16];

    [(SURollbackSuggestionInfo *)v14 setSuggestionReason:2];
    char v17 = +[SUPreferences sharedInstance];
    uint64_t v18 = [v4 restoreVersion];
    [v17 setSuggestedRollbackSplatVersion:v18];

    [(SUManagerCore *)self presentRollbackSuggestionFollowUpWithCoreDescriptor:v4 info:v14];
  }
}

- (void)suggestRollback:(id)a3 rollbackDescriptor:(id)a4 withResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  SULogInfo(@"Rollback recommended. Info: %@ \nRollback Descriptor: %@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v8);
  uint64_t v18 = [v9 productBuildVersion];
  id v23 = 0;
  BOOL v19 = [(SUManagerCore *)self shouldShowRollbackSuggestionAlert:v18 error:&v23];
  id v20 = v23;

  if (v19)
  {
    char v21 = +[SUPreferences sharedInstance];
    uint64_t v22 = [v9 restoreVersion];
    [v21 setSuggestedRollbackSplatVersion:v22];

    [(SUManagerCore *)self presentRollbackSuggestionFollowUpWithRollbackDescriptor:v9 info:v8];
    if (v10) {
      v10[2](v10, 1, 0);
    }
  }
  else if (v10)
  {
    ((void (**)(id, uint64_t, id))v10)[2](v10, 0, v20);
  }
}

- (BOOL)shouldShowRollbackSuggestionAlert:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v37 = 0;
  BOOL v7 = [(SUManagerCore *)self isSplatRollbackAllowed:&v37];
  id v8 = v37;
  uint64_t v16 = v8;
  if (!v7)
  {
    SULogInfo(@"Rollback not allowed. Ignoring revoked update: %@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);
    if (a4)
    {
      id v24 = v16;
      goto LABEL_7;
    }
LABEL_8:
    char v25 = 0;
    goto LABEL_13;
  }
  if (+[SUUtility isLockdownModeEnabled])
  {
    SULogInfo(@"Device is in Lockdown Mode. Ignoring revoked update", v17, v18, v19, v20, v21, v22, v23, v36);
    if (a4)
    {
      id v24 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:101 userInfo:0];
LABEL_7:
      char v25 = 0;
      *a4 = v24;
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  uint64_t v26 = [(SUState *)self->_state lastRollbackRecommendedBuildVersion];
  int v34 = [v26 isEqualToString:v6];
  if (v34)
  {
    SULogInfo(@"Rollback already recommended for %@, skipping follow-up", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v6);
    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:100 userInfo:0];
    }
  }
  char v25 = v34 ^ 1;

LABEL_13:
  return v25;
}

- (void)presentRollbackSuggestionFollowUpWithCoreDescriptor:(id)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v7];
  [(SUManagerCore *)self presentRollbackSuggestionAlertWithDescriptor:v8 info:v6];
  [(SUManagerCore *)self reportRSRRollbackSuggestedEventWithDescriptor:v7 rollbackSuggestionInfo:v6];
}

- (void)presentRollbackSuggestionFollowUpWithRollbackDescriptor:(id)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SUManagerEngine SUDescriptorFromRollbackDescriptor:v7];
  [(SUManagerCore *)self presentRollbackSuggestionAlertWithDescriptor:v8 info:v6];
  [(SUManagerCore *)self reportRSRRollbackSuggestedEventWithRollbackDescriptor:v7 rollbackSuggestionInfo:v6];
}

- (void)presentRollbackSuggestionAlertWithDescriptor:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerCore *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(SUManagerCore *)self externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__SUManagerCore_presentRollbackSuggestionAlertWithDescriptor_info___block_invoke;
    block[3] = &unk_26447CD70;
    void block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  uint64_t v11 = [v6 productBuildVersion];

  if (v11)
  {
    state = self->_state;
    uint64_t v20 = [v6 productBuildVersion];
    [(SUState *)state setLastRollbackRecommendedBuildVersion:v20];

    [(SUState *)self->_state save];
  }
  else
  {
    SULogInfo(@"Warning: revoked update has no build version", v12, v13, v14, v15, v16, v17, v18, v21);
  }
}

void __67__SUManagerCore_presentRollbackSuggestionAlertWithDescriptor_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 rollbackSuggested:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
}

- (id)coreDescriptorForSUDescriptor:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v5 = [(SUManagerCore *)self scanner];
  id v6 = [v5 preferredLastScannedCoreDescriptor];

  id v7 = [(SUManagerCore *)self scanner];
  id v8 = [v7 alternateLastScannedCoreDescriptor];

  if (v6
    && (v9 = +[SUManagerEngine SUDescriptor:matchesSUCoreDescriptor:comparisonFlags:](SUManagerEngine, "SUDescriptor:matchesSUCoreDescriptor:comparisonFlags:", v4, v6, 1), uint64_t v10 = v6, v9)|| v8&& (v11 = +[SUManagerEngine SUDescriptor:v4 matchesSUCoreDescriptor:v8 comparisonFlags:1], uint64_t v10 = v8, v11))
  {
    id v12 = v10;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)unscheduleRecommendedUpdateNotification
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = [(SUManagerCore *)self scanner];
  [v3 unscheduleRecommendedUpdateNotification];
}

- (void)startDownloadWithMetadata:(id)a3 withResult:(id)a4
{
  workQueue = self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  BOOL v9 = [(SUManagerCore *)self preferredLastScannedDescriptor];
  id v16 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v9];

  uint64_t v10 = [(SUManagerCore *)self alternateLastScannedDescriptor];
  BOOL v11 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v10];

  id v12 = [[SUScanResults alloc] initWithPreferredDescriptor:v16 alternateDescriptor:v11];
  uint64_t v13 = [SUDownloadOptions alloc];
  uint64_t v14 = [(SUScanResults *)v12 latestUpdate];
  uint64_t v15 = [(SUDownloadOptions *)v13 initWithMetadata:v8 andDescriptor:v14];

  [(SUManagerCore *)self startDownloadWithOptions:v15 withResult:v7];
}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  notify_post((const char *)[(id)*MEMORY[0x263F77C10] UTF8String]);
  BOOL v9 = [(SUManagerCore *)self downloader];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__SUManagerCore_startDownloadWithOptions_withResult___block_invoke;
  v11[3] = &unk_26447E818;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 startDownloadWithOptions:v8 withResult:v11];
}

void __53__SUManagerCore_startDownloadWithOptions_withResult___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 128);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__SUManagerCore_startDownloadWithOptions_withResult___block_invoke_2;
    block[3] = &unk_26447CE88;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __53__SUManagerCore_startDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)updateDownloadOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v9 = [(SUManagerCore *)self downloader];
  id v17 = 0;
  char v10 = [v9 updateDownloadOptions:v8 error:&v17];

  id v11 = v17;
  if (v6)
  {
    externWorkQueue = self->_externWorkQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__SUManagerCore_updateDownloadOptions_withResult___block_invoke;
    v13[3] = &unk_26447CE88;
    id v15 = v6;
    char v16 = v10;
    id v14 = v11;
    dispatch_async(externWorkQueue, v13);
  }
}

uint64_t __50__SUManagerCore_updateDownloadOptions_withResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v10)
  {
    uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:3 userInfo:0];
    uint64_t v19 = [v8 descriptor];
    uint64_t v20 = [v9 descriptor];
    uint64_t v21 = (void *)v20;
    if (v19)
    {
      BOOL v22 = v20 != 0;
      BOOL v23 = 1;
    }
    else
    {
      uint64_t v44 = v18;
      id v24 = [(SUManagerCore *)self scanner];
      char v25 = [v24 preferredLastScannedCoreDescriptor];
      uint64_t v19 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v25];

      uint64_t v26 = [(SUManagerCore *)self scanner];
      uint64_t v27 = [v26 alternateLastScannedCoreDescriptor];
      uint64_t v28 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v27];

      BOOL v23 = v19 != 0;
      BOOL v22 = v28 != 0;
      if (!(v19 | v28))
      {
        uint64_t v18 = v44;
        (*((void (**)(id, void, void, void *, void *))v10 + 2))(v10, 0, 0, v44, v44);
        goto LABEL_19;
      }
      uint64_t v21 = (void *)v28;
      uint64_t v18 = v44;
    }
    if (![(SUManagerCore *)self isDownloading])
    {
      v57[0] = 0;
      v57[1] = v57;
      v57[2] = 0x2020000000;
      char v58 = 0;
      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x3032000000;
      v55[3] = __Block_byref_object_copy__19;
      v55[4] = __Block_byref_object_dispose__19;
      id v56 = 0;
      uint64_t v38 = objc_alloc_init(SUSpacePurgeOptions);
      [(SUSpacePurgeOptions *)v38 setCompletionQueue:self->_workQueue];
      [(SUSpacePurgeOptions *)v38 setNeededBytes:+[SUUtility totalDiskSpaceForUpdate:v19]];
      [(SUSpacePurgeOptions *)v38 setEnableCacheDelete:1];
      if ([v8 isAutoDownload]) {
        uint64_t v39 = 0;
      }
      else {
        uint64_t v39 = [v8 isAppOffloadEnabled];
      }
      [(SUSpacePurgeOptions *)v38 setEnableAppOffload:v39];
      [(SUSpacePurgeOptions *)v38 setCacheDeleteUrgency:4];
      [(SUSpacePurgeOptions *)v38 setAppOffloadUrgency:4];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke;
      v45[3] = &unk_26447EDB8;
      uint64_t v53 = v57;
      uint64_t v54 = v55;
      v45[4] = self;
      id v40 = (id)v19;
      id v46 = v40;
      id v47 = v8;
      id v41 = v21;
      id v48 = v41;
      id v49 = v9;
      uint64_t v42 = v38;
      uint64_t v50 = v42;
      id v52 = v10;
      id v51 = v18;
      +[SUSpace hasSufficientSpaceWithOptions:v42 withCompletion:v45];

      _Block_object_dispose(v55, 8);
      _Block_object_dispose(v57, 8);

      goto LABEL_19;
    }
    SULogInfo(@"Not performing space check since there is an in-progress download", v29, v30, v31, v32, v33, v34, v35, v43);
    if (v23)
    {
      id v36 = 0;
      if (!v22)
      {
LABEL_10:
        id v37 = v18;
LABEL_15:
        (*((void (**)(id, BOOL, BOOL, id, id))v10 + 2))(v10, v23, v22, v36, v37);

LABEL_19:
        goto LABEL_20;
      }
    }
    else
    {
      id v36 = v18;
      if (!v22) {
        goto LABEL_10;
      }
    }
    id v37 = 0;
    goto LABEL_15;
  }
  SULogError(@"%s: no reply handler, do nothing", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUManagerCore updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:]");
LABEL_20:
}

void __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [v5 hasSufficientFreeSpace];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), a3);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 104) + 8);
    uint64_t v9 = *(void *)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    if (!v9)
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      id v37 = 0;
      char v13 = [v10 _isUpdateDownloadable:v11 downloadOptions:v12 error:&v37];
      objc_storeStrong(v8, v37);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v13;
    }
  }
  if ([v5 hasSufficientFreeSpace])
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(NSObject **)(v14 + 120);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2;
    v35[3] = &unk_26447C8C8;
    v35[4] = v14;
    uint64_t v16 = &v36;
    id v36 = *(id *)(a1 + 40);
    uint64_t v17 = v35;
  }
  else
  {
    if (![*(id *)(a1 + 48) isAutoDownload]) {
      goto LABEL_9;
    }
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v15 = *(NSObject **)(v18 + 120);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_3;
    block[3] = &unk_26447C8C8;
    void block[4] = v18;
    uint64_t v16 = &v34;
    id v34 = *(id *)(a1 + 40);
    uint64_t v17 = block;
  }
  dispatch_async(v15, v17);

LABEL_9:
  if (*(void *)(a1 + 56))
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    char v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__19;
    v29[4] = __Block_byref_object_dispose__19;
    id v30 = 0;
    id v19 = *(id *)(a1 + 64);
    if (!v19) {
      id v19 = *(id *)(a1 + 48);
    }
    objc_msgSend(*(id *)(a1 + 72), "setNeededBytes:", +[SUUtility totalDiskSpaceForUpdate:](SUUtility, "totalDiskSpaceForUpdate:", *(void *)(a1 + 56)));
    objc_msgSend(*(id *)(a1 + 72), "setEnableAppOffload:", objc_msgSend(v19, "isAutoDownload") ^ 1);
    [*(id *)(a1 + 72) setCacheDeleteUrgency:4];
    uint64_t v20 = *(void *)(a1 + 72);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_4;
    v22[3] = &unk_26447ED90;
    uint64_t v26 = v31;
    uint64_t v27 = v29;
    v22[4] = *(void *)(a1 + 32);
    id v23 = *(id *)(a1 + 56);
    id v21 = v19;
    id v24 = v21;
    id v25 = *(id *)(a1 + 88);
    long long v28 = *(_OWORD *)(a1 + 96);
    +[SUSpace hasSufficientSpaceWithOptions:v20 withCompletion:v22];

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

uint64_t __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissInsufficientDiskSpaceFollowupForUpdate:*(void *)(a1 + 40) orForce:0];
}

uint64_t __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDownloading];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isUpdateDownloaded];
    if ((result & 1) == 0)
    {
      uint64_t result = [*(id *)(a1 + 32) isInstalling];
      if ((result & 1) == 0)
      {
        id v3 = *(void **)(a1 + 32);
        uint64_t v4 = *(void *)(a1 + 40);
        return [v3 showInsufficientDiskSpaceFollowupForUpdate:v4];
      }
    }
  }
  return result;
}

void __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_4(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = [v5 hasSufficientFreeSpace];
  objc_storeStrong((id *)(*(void *)(a1[9] + 8) + 40), a3);
  if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
  {
    uint64_t v7 = *(void *)(a1[9] + 8);
    uint64_t v9 = *(void *)(v7 + 40);
    id v8 = (id *)(v7 + 40);
    if (!v9)
    {
      id v10 = (void *)a1[4];
      uint64_t v11 = a1[5];
      uint64_t v12 = a1[6];
      id obj = 0;
      char v13 = [v10 _isUpdateDownloadable:v11 downloadOptions:v12 error:&obj];
      objc_storeStrong(v8, obj);
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v13;
    }
  }
  if ([v5 hasSufficientFreeSpace])
  {
    uint64_t v14 = a1[4];
    uint64_t v15 = *(NSObject **)(v14 + 120);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_5;
    block[3] = &unk_26447C8C8;
    void block[4] = v14;
    id v17 = (id)a1[5];
    dispatch_async(v15, block);
  }
  (*(void (**)(void))(a1[7] + 16))();
}

uint64_t __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissInsufficientDiskSpaceFollowupForUpdate:*(void *)(a1 + 40) orForce:0];
}

- (BOOL)_isUpdateDownloadable:(id)a3 downloadOptions:(id)a4 error:(id *)a5
{
  uint64_t v13 = 0;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[SUDownloadPolicyFactory userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:](SUDownloadPolicyFactory, "userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:", v8, 0, [v7 allowUnrestrictedCellularDownload]);

  uint64_t v10 = [v7 downloadFeeAgreementStatus];
  [v9 setCellularFeeAgreementStatus:v10];
  char v11 = [v9 isDownloadableForCurrentNetworkConditions:&v13 cellularFeesApply:0];
  if (a5 && v13)
  {
    *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:v13 userInfo:0];
  }

  return v11;
}

- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 replyHandler:(id)a5
{
}

- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 downloadOption:(id)a5 replyHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v10)
  {
    uint64_t v13 = objc_alloc_init(SUSpacePurgeOptions);
    [(SUSpacePurgeOptions *)v13 setCompletionQueue:self->_workQueue];
    [(SUSpacePurgeOptions *)v13 setNeededBytes:+[SUUtility totalDiskSpaceForUpdate:v10]];
    [(SUSpacePurgeOptions *)v13 setEnableCacheDelete:1];
    if (v8) {
      uint64_t v14 = [v11 isAppOffloadEnabled];
    }
    else {
      uint64_t v14 = 0;
    }
    [(SUSpacePurgeOptions *)v13 setEnableAppOffload:v14];
    [(SUSpacePurgeOptions *)v13 setCacheDeleteUrgency:4];
    [(SUSpacePurgeOptions *)v13 setAppOffloadUrgency:4];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke;
    v15[3] = &unk_26447EDE0;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    +[SUSpace hasSufficientSpaceWithOptions:v13 withCompletion:v15];

    goto LABEL_8;
  }
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:3 userInfo:0];
    (*((void (**)(id, void, void *, SUSpacePurgeOptions *))v12 + 2))(v12, 0, &unk_26CEBD0D8, v13);
LABEL_8:
  }
}

void __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = [v5 hasSufficientFreeSpace];
  if (v6 && (v7 & 1) == 0)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(NSObject **)(v8 + 120);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_2;
    block[3] = &unk_26447C8C8;
    void block[4] = v8;
    id v23 = v6;
    dispatch_async(v9, block);
  }
  if ([v5 hasSufficientFreeSpace])
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(NSObject **)(v10 + 120);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_3;
    v20[3] = &unk_26447C8C8;
    v20[4] = v10;
    id v12 = &v21;
    id v21 = *(id *)(a1 + 40);
    uint64_t v13 = v20;
  }
  else
  {
    if (![*(id *)(a1 + 48) isAutoDownload]) {
      goto LABEL_9;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    id v11 = *(NSObject **)(v14 + 120);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_4;
    v18[3] = &unk_26447C8C8;
    v18[4] = v14;
    id v12 = &v19;
    id v19 = *(id *)(a1 + 40);
    uint64_t v13 = v18;
  }
  dispatch_async(v11, v13);

LABEL_9:
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15)
  {
    uint64_t v16 = [v5 hasSufficientFreeSpace];
    id v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "additionalBytesRequired"));
    (*(void (**)(uint64_t, uint64_t, void *, id))(v15 + 16))(v15, v16, v17, v6);
  }
}

void __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_2(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *MEMORY[0x263F77F38];
  id v4 = [v2 userInfo];
  [v1 reportPostponedEvent:v2 withStatus:v3 withAdditionalMetrics:v4];
}

uint64_t __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissInsufficientDiskSpaceFollowupForUpdate:*(void *)(a1 + 40) orForce:0];
}

uint64_t __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDownloading];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isUpdateDownloaded];
    if ((result & 1) == 0)
    {
      uint64_t result = [*(id *)(a1 + 32) isInstalling];
      if ((result & 1) == 0)
      {
        uint64_t v3 = *(void **)(a1 + 32);
        uint64_t v4 = *(void *)(a1 + 40);
        return [v3 showInsufficientDiskSpaceFollowupForUpdate:v4];
      }
    }
  }
  return result;
}

- (void)updateDownloadMetadata:(id)a3 withResult:(id)a4
{
  workQueue = self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v9 = [SUDownloadOptions alloc];
  uint64_t v10 = [(SUManagerCore *)self download];
  id v11 = [v10 descriptor];
  id v12 = [(SUDownloadOptions *)v9 initWithMetadata:v8 andDescriptor:v11];

  [(SUManagerCore *)self updateDownloadOptions:v12 withResult:v7];
}

- (id)downloadAsset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUManagerCore *)self downloader];
  uint64_t v4 = [v3 downloadAsset];

  return v4;
}

- (void)deviceIsUpToDateForSU:(BOOL)a3 forSplat:(BOOL)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v7 = [(SUManagerCore *)self downloader];
  int v8 = [v7 isSplatDownload];

  if (v8)
  {
    if (!a4)
    {
      uint64_t v16 = @"Got up to date report but not for current Splat download, keeping it";
LABEL_9:
      SULogInfo(v16, v9, v10, v11, v12, v13, v14, v15, v19);
      return;
    }
  }
  else if (!a3)
  {
    uint64_t v16 = @"Got up to date report but not for current SU download, keeping it";
    goto LABEL_9;
  }
  [(SUManagerCore *)self clearBadgeAndBanner];
  id v17 = [(SUManagerCore *)self downloader];
  [v17 deviceIsUpToDate];
}

- (BOOL)cancelDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v11 = [(SUManagerCore *)self downloader];
  LOBYTE(a6) = [v11 cancelDownload:v9 userRequested:v8 keepDocAssets:v7 error:a6];

  return (char)a6;
}

- (BOOL)killDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v11 = [(SUManagerCore *)self downloader];
  LOBYTE(a6) = [v11 killDownload:v9 userRequested:v8 keepDocAssets:v7 error:a6];

  return (char)a6;
}

- (BOOL)killDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 forUpdates:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  workQueue = self->_workQueue;
  id v13 = a6;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v14 = [(SUManagerCore *)self downloader];
  LOBYTE(a7) = [v14 killDownload:v10 userRequested:v9 keepDocAssets:v8 forUpdates:v13 error:a7];

  return (char)a7;
}

- (id)updateToAutoDownload
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUManagerCore *)self scanner];
  uint64_t v4 = [v3 descriptorToAutoDownload];

  return v4;
}

- (void)cleanupPreviousDownloadState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = [(SUManagerCore *)self downloader];
  [v3 cleanupPreviousDownloadState:1];
}

- (void)resetDownloadState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = [(SUManagerCore *)self downloader];
  [v3 resetDownloadStateOnStartup];
}

- (id)slaVersion
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = [(SUManagerCore *)self downloader];
  uint64_t v4 = [v3 slaVersion];

  return v4;
}

- (void)updateInstallPolicyType:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = [(SUManagerCore *)self installer];
  [v5 updateInstallPolicyType:a3];
}

- (void)updateInstallPolicyAutoUpdateEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = [(SUManagerCore *)self installer];
  [v5 updateInstallPolicyAutoUpdateEnabled:v3];
}

- (id)newInstallTonightConfig
{
  id v26 = [NSString alloc];
  BOOL v3 = [(SUManagerCore *)self isInstallTonight];
  uint64_t v4 = @"false";
  if (v3) {
    uint64_t v4 = @"true";
  }
  id v25 = v4;
  BOOL v5 = [(SUManagerCore *)self isAutoUpdateEnabled];
  id v6 = @"autoOff";
  if (v5) {
    id v6 = @"autoOn";
  }
  id v24 = v6;
  long long v28 = [(SUManagerCore *)self download];
  uint64_t v27 = [v28 descriptor];
  int v7 = [v27 autoUpdateEnabled];
  BOOL v8 = @"disabled";
  if (v7) {
    BOOL v8 = @"enabled";
  }
  id v23 = v8;
  BOOL v9 = [(SUManagerCore *)self download];
  BOOL v10 = [v9 downloadOptions];
  if ([v10 isAutoDownload]) {
    uint64_t v11 = @"bg";
  }
  else {
    uint64_t v11 = @"fg";
  }
  uint64_t v12 = +[SUPreferences sharedInstance];
  if ([v12 isAutomaticUpdateV2Enabled]) {
    id v13 = @"toggleAIOn";
  }
  else {
    id v13 = @"toggleAIOff";
  }
  uint64_t v14 = +[SUPreferences sharedInstance];
  if ([v14 isAutoDownloadDisabled]) {
    uint64_t v15 = @"toggleADOff";
  }
  else {
    uint64_t v15 = @"toggleADOn";
  }
  uint64_t v16 = +[SUPreferences sharedInstance];
  if ([v16 autoInstallSystemAndDataFiles]) {
    id v17 = @"toggleAISDFOn";
  }
  else {
    id v17 = @"toggleAISDFOff";
  }
  id v18 = +[SUPreferences sharedInstance];
  int v19 = [v18 autoInstallSecurityResponse];
  uint64_t v20 = @"toggleAIRSROff";
  if (v19) {
    uint64_t v20 = @"toggleAIRSROn";
  }
  id v21 = (void *)[v26 initWithFormat:@"[LEGACY]%@,%@,%@,%@,%@,%@,%@,%@", v25, v24, v23, v11, v13, v15, v17, v20];

  return v21;
}

- (id)installTonightConfigDictionary
{
  v24[7] = *MEMORY[0x263EF8340];
  v23[0] = @"installTonightActive";
  BOOL v3 = [(SUManagerCore *)self isInstallTonight];
  uint64_t v4 = *MEMORY[0x263F78118];
  uint64_t v5 = *MEMORY[0x263F780A0];
  if (v3) {
    uint64_t v6 = *MEMORY[0x263F78118];
  }
  else {
    uint64_t v6 = *MEMORY[0x263F780A0];
  }
  v24[0] = v6;
  v23[1] = @"autoUpdateEnabledForDescriptor";
  int v7 = [(SUManagerCore *)self download];
  BOOL v8 = [v7 descriptor];
  if ([v8 autoUpdateEnabled]) {
    uint64_t v9 = v4;
  }
  else {
    uint64_t v9 = v5;
  }
  v24[1] = v9;
  v23[2] = @"autoDownload";
  BOOL v10 = [(SUManagerCore *)self download];
  uint64_t v11 = [v10 downloadOptions];
  if ([v11 isAutoDownload]) {
    uint64_t v12 = v4;
  }
  else {
    uint64_t v12 = v5;
  }
  v24[2] = v12;
  v23[3] = @"autoUpdateToggleEnabled";
  id v13 = +[SUPreferences sharedInstance];
  if ([v13 isAutomaticUpdateV2Enabled]) {
    uint64_t v14 = v4;
  }
  else {
    uint64_t v14 = v5;
  }
  v24[3] = v14;
  v23[4] = @"autoDownloadToggleEnabled";
  uint64_t v15 = +[SUPreferences sharedInstance];
  if ([v15 isAutomaticDownloadEnabled]) {
    uint64_t v16 = v4;
  }
  else {
    uint64_t v16 = v5;
  }
  v24[4] = v16;
  v23[5] = @"autoInstallSystemAndDataFilesToggleEnabled";
  id v17 = +[SUPreferences sharedInstance];
  if ([v17 autoInstallSystemAndDataFiles]) {
    uint64_t v18 = v4;
  }
  else {
    uint64_t v18 = v5;
  }
  v24[5] = v18;
  v23[6] = @"autoInstallSecurityResponseToggleEnabled";
  int v19 = +[SUPreferences sharedInstance];
  if ([v19 autoInstallSecurityResponse]) {
    uint64_t v20 = v4;
  }
  else {
    uint64_t v20 = v5;
  }
  v24[6] = v20;
  id v21 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:7];

  return v21;
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 replyHandler:(id)a4
{
  workQueue = self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v9 = [(SUManagerCore *)self installer];
  [v9 isUpdateReadyForInstallationWithOptions:v8 replyHandler:v7];
}

- (BOOL)isUpdateReadyForInstallation:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v5 = [(SUManagerCore *)self installer];
  LOBYTE(a3) = [v5 isUpdateReadyForInstallation:a3];

  return (char)a3;
}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  workQueue = self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v9 = [(SUManagerCore *)self installer];
  [v9 installUpdateWithInstallOptions:v8 withResult:v7];
}

- (void)installUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_alloc_init(SUInstallOptions);
  -[SUInstallOptions setDarkBoot:](v9, "setDarkBoot:", [v7 containsObject:@"SUInstallOptionDarkBoot"]);
  uint64_t v8 = [v7 containsObject:@"SUInstallOptionRequireUpdate"];

  [(SUInstallOptions *)v9 setRequired:v8];
  [(SUManagerCore *)self installUpdateWithInstallOptions:v9 withResult:v6];
}

- (void)autoSUFailedWithError:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v6 = [(SUManagerCore *)self installer];
  [v6 autoSUFailedWithError:v5];
}

- (id)eligibleRollbackWithOptions:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v27 = 0;
  BOOL v4 = [(SUManagerCore *)self isSplatRollbackAllowed:&v27];
  id v5 = v27;
  id v13 = v5;
  if (v4)
  {
    uint64_t v14 = [(SUManagerCore *)self engine];
    uint64_t v15 = [v14 availableRollback];

    uint64_t v16 = +[SUPreferences sharedInstance];
    int v17 = [v16 fakeSplatInstalled];

    if (v17)
    {
      id v18 = objc_alloc_init(MEMORY[0x263F77BB0]);

      SULogInfo(@"%s: Fake splat installed, generating a fake descriptor.", v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[SUManagerCore eligibleRollbackWithOptions:]");
      uint64_t v15 = v18;
    }
  }
  else
  {
    SULogInfo(@"Rollback not allowed. Returning nil rollback descriptor: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v8 = [MEMORY[0x263F77D98] sharedDevice];
  int v9 = [v8 hasSemiSplatActive];

  if (v9)
  {
    SULogInfo(@"Rollback already applied, just proceed to reboot", v10, v11, v12, v13, v14, v15, v16, v28);
    int v17 = 0;
LABEL_4:
    id v27 = [(SUManagerCore *)self rollback];
    [v27 rollbackUpdateWithOptions:v6 completion:v7];

    goto LABEL_5;
  }
  id v29 = 0;
  int v18 = [(SUManagerCore *)self isSplatRollbackAllowed:&v29];
  id v19 = v29;
  int v17 = v19;
  if (v18) {
    goto LABEL_4;
  }
  SULogInfo(@"Rollback not allowed. Preventing rollback request: %@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v19);
  if (v7) {
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v17);
  }
LABEL_5:
}

- (id)previousRollbackWithOptions:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v4 = [(SUManagerCore *)self engine];
  id v5 = [v4 previousRollback];

  return v5;
}

- (BOOL)isRollingBack
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v3 = [(SUManagerCore *)self rollback];
  char v4 = [v3 isRollingBack];

  return v4;
}

- (void)rollbackReadyForReboot
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v4 = [(SUManagerCore *)self rollback];
  BOOL v3 = [(SUManagerCore *)self eligibleRollbackWithOptions:0];
  [v4 rollbackReadyForReboot:v3];
}

- (void)securityResponseRollbackSuggested:(id)a3 withResult:(id)a4
{
  workQueue = self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v10 = [(SUManagerCore *)self rollback];
  int v9 = [v10 availableRollback];
  [(SUManagerCore *)self suggestRollback:v8 rollbackDescriptor:v9 withResult:v7];
}

- (void)_persistStash
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  SULogInfo(@"entered _persistStash", v3, v4, v5, v6, v7, v8, v9, v32);
  id v10 = +[SUKeybagInterface sharedInstance];
  uint64_t v11 = [(SUManagerCore *)self download];
  uint64_t v12 = [v11 descriptor];
  uint64_t v13 = [v10 installationKeybagStateForDescriptor:v12];

  if (v13 == 2)
  {
    SULogInfo(@"Persist the stashbag", v14, v15, v16, v17, v18, v19, v20, v33);
    uint64_t v21 = +[SUKeybagInterface sharedInstance];
    int v22 = [v21 persistKeybagStash];

    if (v22)
    {
      SULogInfo(@"Stashbag persisted", v23, v24, v25, v26, v27, v28, v29, v34);
      id v30 = [MEMORY[0x263EFF910] date];
      [(SUManagerCore *)self setLastStashbagPersistedDate:v30];

      [(SUState *)self->_state setStashbagPersisted:1];
      state = self->_state;
      [(SUState *)state save];
    }
    else
    {
      SULogInfo(@"Stashbag persist failed: %d", v23, v24, v25, v26, v27, v28, v29, 0);
      [(SUManagerCore *)self setLastStashbagPersistedDate:0];
    }
  }
  else
  {
    SULogInfo(@"installationKeybagState = %d", v14, v15, v16, v17, v18, v19, v20, v13);
  }
}

- (void)persistStashOnUnlock
{
  SULogInfo(@"Entering persistStashOnUnlock", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v19);
  uint64_t v9 = +[SUKeybagInterface sharedInstance];
  unsigned int v10 = [v9 isPasscodeLocked];

  SULogInfo(@"isPasscodeLocked = %d", v11, v12, v13, v14, v15, v16, v17, v10);
  if ((v10 & 1) == 0)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__SUManagerCore_persistStashOnUnlock__block_invoke;
    block[3] = &unk_26447C878;
    void block[4] = self;
    dispatch_async(workQueue, block);
  }
}

uint64_t __37__SUManagerCore_persistStashOnUnlock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _persistStash];
}

- (void)createInstallationKeybag:(id)a3 withResult:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v8 = [v6 descriptor];
  if (v8) {
    goto LABEL_6;
  }
  uint64_t v9 = [(SUManagerCore *)self download];
  if (v9)
  {
    unsigned int v10 = [(SUManagerCore *)self download];
    [v10 descriptor];
  }
  else
  {
    unsigned int v10 = [(SUManagerCore *)self preferredLastScannedDescriptor];
    +[SUManagerEngine SUDescriptorFromCoreDescriptor:v10];
  uint64_t v8 = };

  if (v8)
  {
LABEL_6:
    uint64_t v18 = [v6 passcode];
    if (v18)
    {
    }
    else
    {
      uint64_t v19 = [v6 laContext];

      if (!v19)
      {
        SULogInfo(@"No passcode or LAContext provided for keybag. Unable to create installation keybag with null passcode and null LAContext", v20, v21, v22, v23, v24, v25, v26, v50);
        if (!v7) {
          goto LABEL_34;
        }
        goto LABEL_29;
      }
    }
    int v34 = [v6 keybagType];
    if (!v34)
    {
      SULogInfo(@"createInstallationKeybag - asked to create attended keybag but will create unattended one anyway", v27, v28, v29, v30, v31, v32, v33, v50);
      int v34 = 1;
    }
    uint64_t v35 = [v6 laContext];

    id v36 = +[SUKeybagInterface sharedInstance];
    if (v35)
    {
      id v37 = [v6 laContext];
      int v38 = [v36 createInstallationKeybagForDescriptor:v8 withLASecret:v37 forUnattendedInstall:v34 == 1];
    }
    else
    {
      id v37 = [v6 passcode];
      int v38 = [v36 createInstallationKeybagForDescriptor:v8 withSecret:v37 forUnattendedInstall:v34 == 1];
    }
    int v39 = v38;

    [(SUManagerCore *)self setLastStashbagPersistedDate:0];
    if (v34 == 1 && v39)
    {
      id v51 = v6;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v40 = [(NSHashTable *)self->_observers allObjects];
      uint64_t v41 = [v40 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v54 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = *(void *)(*((void *)&v53 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              externWorkQueue = self->_externWorkQueue;
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __53__SUManagerCore_createInstallationKeybag_withResult___block_invoke;
              block[3] = &unk_26447C878;
              void block[4] = v45;
              dispatch_async(externWorkQueue, block);
            }
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v53 objects:v57 count:16];
        }
        while (v42);
      }

      id v6 = v51;
    }
    if (v39)
    {
      v7[2](v7, 1, 0);
      goto LABEL_34;
    }
    id v47 = +[SUUtility errorWithCode:82];
    [(SUManagerCore *)self reportPostponedEvent:v47 withStatus:@"installNotReady"];

LABEL_29:
    id v48 = +[SUUtility errorWithCode:82];
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v48);

    goto LABEL_34;
  }
  SULogInfo(@"No descriptor provided for keybag. Unable to create installation keybag with null descriptor", v11, v12, v13, v14, v15, v16, v17, v50);
  if (v7)
  {
    id v49 = +[SUUtility errorWithCode:82];
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v49);
  }
  uint64_t v8 = 0;
LABEL_34:
}

uint64_t __53__SUManagerCore_createInstallationKeybag_withResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unattendedInstallationKeybagCreated];
}

- (void)clearKeybagStash
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = +[SUKeybagInterface sharedInstance];
  int v4 = [v3 disableKeybagStash];

  uint64_t v12 = @"failed";
  if (v4) {
    uint64_t v12 = @"succeeded";
  }
  SULogInfo(@"destroying keybag stash %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
  [(SUManagerCore *)self setLastStashbagPersistedDate:0];
  [(SUState *)self->_state setStashbagPersisted:0];
  state = self->_state;

  [(SUState *)state save];
}

- (void)presentAutoUpdateBanner:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v5 = SULogBadging();
  SULogInfoForSubsystem(v5, @"Got request to present AutoUpdateBanner", v6, v7, v8, v9, v10, v11, v36);

  uint64_t v12 = [(SUManagerCore *)self download];
  if (!v12) {
    goto LABEL_5;
  }
  uint64_t v13 = (void *)v12;
  uint64_t v14 = [(SUManagerCore *)self download];
  uint64_t v15 = [v14 descriptor];

  if (!v15)
  {
LABEL_5:
    uint64_t v26 = SULogBadging();
    SULogInfoForSubsystem(v26, @"Download/descriptor object is null..Skipping banner", v27, v28, v29, v30, v31, v32, v37);

    char v33 = 0;
    if (!v4) {
      goto LABEL_7;
    }
LABEL_6:
    externWorkQueue = self->_externWorkQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__SUManagerCore_presentAutoUpdateBanner___block_invoke_2;
    block[3] = &unk_26447EE08;
    id v39 = v4;
    char v40 = v33;
    dispatch_async(externWorkQueue, block);

    goto LABEL_7;
  }
  dispatch_time_t v16 = dispatch_time(0, 2000000000);
  uint64_t v17 = [(SUManagerCore *)self followUpController];
  char v18 = [v17 isCurrentlyPresentingFollowUpType:2];

  if (v18)
  {
    uint64_t v19 = SULogBadging();
    SULogInfoForSubsystem(v19, @"Not presenting banner since it is already being presented", v20, v21, v22, v23, v24, v25, v37);
  }
  else
  {
    workQueue = self->_workQueue;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __41__SUManagerCore_presentAutoUpdateBanner___block_invoke;
    v41[3] = &unk_26447C878;
    v41[4] = self;
    dispatch_after(v16, workQueue, v41);
  }
  char v33 = 1;
  if (v4) {
    goto LABEL_6;
  }
LABEL_7:
}

void __41__SUManagerCore_presentAutoUpdateBanner___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) followUpController];
  uint64_t v2 = [*(id *)(a1 + 32) download];
  uint64_t v3 = [v2 descriptor];
  [v4 postFollowUpOfType:2 withUpdate:v3 userInfo:0];
}

uint64_t __41__SUManagerCore_presentAutoUpdateBanner___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)clearBadgeAndBanner
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  [(SUManagerCore *)self dismissAutoUpdateBanner];
  [(SUManagerCore *)self unbadgeSettingsForManualSoftwareUpdate];
  [(SUManagerCore *)self dismissLegacyFollowUps];

  [(SUManagerCore *)self dismissInsufficientDiskSpaceFollowupForUpdate:0 orForce:1];
}

- (void)dismissAutoUpdateBanner
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = +[SUScheduler sharedInstance];
  [v3 cancelPresentAutoUpdateBanner];

  id v4 = SULogBadging();
  SULogInfoForSubsystem(v4, @"Got request to dismiss AutoUpdateBanner", v5, v6, v7, v8, v9, v10, v11);

  id v12 = [(SUManagerCore *)self followUpController];
  [v12 dismissFollowUpType:2];
}

- (void)unbadgeSettingsForManualSoftwareUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = SULogBadging();
  SULogInfoForSubsystem(v3, @"Removing settings badge set by manual update flow(if present)", v4, v5, v6, v7, v8, v9, v10);

  id v11 = [(SUManagerCore *)self followUpController];
  [v11 dismissFollowUpTypes:&unk_26CEBD2A8];
}

- (void)dismissLegacyFollowUps
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = SULogBadging();
  SULogInfoForSubsystem(v3, @"Removing legacy SU follow up (if present)", v4, v5, v6, v7, v8, v9, v10);

  id v11 = [(SUManagerCore *)self followUpController];
  [v11 dismissLegacyFollowUps];
}

- (void)badgeSettingsForManualSoftwareUpdate:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v6 = SULogBadging();
  SULogInfoForSubsystem(v6, @"Badging settings for manual update flow", v7, v8, v9, v10, v11, v12, v13);

  id v14 = [(SUManagerCore *)self followUpController];
  [v14 postFollowUpOfType:1 withUpdate:v5 userInfo:0];
}

- (void)reportOTAAvailableEvent:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v17 = *MEMORY[0x263F77F18];
  uint64_t v6 = [(SUManagerCore *)self scanner];
  uint64_t v7 = [v6 lastScannedDescriptorScanOptions];
  uint64_t v8 = [v7 clientName];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = @"None";
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  v18[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

  uint64_t v12 = *MEMORY[0x263F77F60];
  uint64_t v13 = [(SUManagerCore *)self engine];
  id v14 = [v13 updatePolicy];
  uint64_t v15 = [v5 preferredDescriptor];
  dispatch_time_t v16 = [v5 alternateDescriptor];

  [(SUManagerCore *)self _reportOTAEvent:v12 withStatus:0 policy:v14 primaryDescriptor:v15 alternateDescriptor:v16 additionalMetrics:v11 error:0];
}

- (void)reportOTAStartedDownloadingEvent:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v6 = [(SUManagerCore *)self downloader];
  uint64_t v7 = [v6 download];
  uint64_t v8 = [v7 descriptor];
  uint64_t v9 = [(SUManagerCore *)self coreDescriptorForSUDescriptor:v8];

  uint64_t v10 = +[SUNetworkMonitor sharedInstance];
  int v11 = [v10 isCurrentNetworkTypeCellular];

  v24[0] = *MEMORY[0x263F77F18];
  uint64_t v12 = [(SUManagerCore *)self downloader];
  uint64_t v13 = [v12 download];
  id v14 = [v13 downloadOptions];
  uint64_t v15 = [v14 clientName];
  dispatch_time_t v16 = (void *)v15;
  uint64_t v17 = @"None";
  if (v15) {
    uint64_t v17 = (__CFString *)v15;
  }
  v24[1] = *MEMORY[0x263F77F40];
  char v18 = (uint64_t *)MEMORY[0x263F78118];
  if (!v11) {
    char v18 = (uint64_t *)MEMORY[0x263F780A0];
  }
  uint64_t v19 = *v18;
  v25[0] = v17;
  v25[1] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  uint64_t v21 = *MEMORY[0x263F77F80];
  uint64_t v22 = [(SUManagerCore *)self engine];
  uint64_t v23 = [v22 updatePolicy];
  [(SUManagerCore *)self _reportOTAEvent:v21 withStatus:0 policy:v23 descriptor:v9 additionalMetrics:v20 error:v5];
}

- (void)reportOTADownloadedEvent:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v20 = *MEMORY[0x263F77F18];
  uint64_t v6 = [(SUManagerCore *)self downloader];
  uint64_t v7 = [v6 download];
  uint64_t v8 = [v7 downloadOptions];
  uint64_t v9 = [v8 clientName];
  uint64_t v10 = (void *)v9;
  int v11 = @"None";
  if (v9) {
    int v11 = (__CFString *)v9;
  }
  v21[0] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

  uint64_t v13 = [(SUManagerCore *)self downloader];
  id v14 = [v13 download];
  uint64_t v15 = [v14 descriptor];
  dispatch_time_t v16 = [(SUManagerCore *)self coreDescriptorForSUDescriptor:v15];

  uint64_t v17 = *MEMORY[0x263F77F68];
  char v18 = [(SUManagerCore *)self engine];
  uint64_t v19 = [v18 updatePolicy];
  [(SUManagerCore *)self _reportOTAEvent:v17 withStatus:v5 policy:v19 descriptor:v16 additionalMetrics:v12 error:0];
}

- (void)reportOTAInstalledEvent
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUManagerCore *)self downloader];
  uint64_t v4 = [v3 download];
  id v5 = [v4 descriptor];
  id v9 = [(SUManagerCore *)self coreDescriptorForSUDescriptor:v5];

  uint64_t v6 = *MEMORY[0x263F77F70];
  uint64_t v7 = [(SUManagerCore *)self engine];
  uint64_t v8 = [v7 updatePolicy];
  [(SUManagerCore *)self _reportOTAEvent:v6 withStatus:0 policy:v8 descriptor:v9 additionalMetrics:0 error:0];
}

- (void)reportOTASucceededEvent
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUManagerCore *)self downloader];
  uint64_t v4 = [v3 download];
  id v5 = [v4 descriptor];
  id v6 = [(SUManagerCore *)self coreDescriptorForSUDescriptor:v5];

  [(SUManagerCore *)self _reportOTAEvent:*MEMORY[0x263F77F88] withStatus:0 policy:0 descriptor:v6 additionalMetrics:0 error:0];
}

- (void)reportOTAAutoTriggeredEvent
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUManagerCore *)self downloader];
  uint64_t v4 = [v3 download];
  id v5 = [v4 descriptor];
  id v6 = [(SUManagerCore *)self coreDescriptorForSUDescriptor:v5];

  [(SUManagerCore *)self _reportOTAEvent:*MEMORY[0x263F77F58] withStatus:0 policy:0 descriptor:v6 additionalMetrics:0 error:0];
}

- (void)reportOTAAbandonedEvent
{
}

- (void)reportOTAAbandonedEventWithError:(id)a3
{
}

- (void)reportOTAAbandonedEventWithError:(id)a3 additionalMetrics:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  workQueue = self->_workQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v21 = *MEMORY[0x263F77F18];
  id v9 = [(SUManagerCore *)self downloader];
  uint64_t v10 = [v9 download];
  int v11 = [v10 downloadOptions];
  uint64_t v12 = [v11 clientName];
  uint64_t v13 = (void *)v12;
  id v14 = @"None";
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  v22[0] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  dispatch_time_t v16 = (void *)[v15 mutableCopy];

  if (v6) {
    [v16 addEntriesFromDictionary:v6];
  }
  uint64_t v17 = [(SUManagerCore *)self downloader];
  char v18 = [v17 download];
  uint64_t v19 = [v18 descriptor];
  uint64_t v20 = [(SUManagerCore *)self coreDescriptorForSUDescriptor:v19];

  [(SUManagerCore *)self _reportOTAEvent:*MEMORY[0x263F77F50] withStatus:0 policy:0 descriptor:v20 additionalMetrics:v16 error:v8];
}

- (void)reportRSRRollbackSuggestedEventWithDescriptor:(id)a3 rollbackSuggestionInfo:(id)a4
{
  workQueue = self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v9 = *MEMORY[0x263F77F90];
  id v10 = [v8 productBuildVersion];

  [(SUManagerCore *)self _reportRollbackEvent:v9 withInfo:v7 buildVersion:v10];
}

- (void)reportRSRRollbackSuggestedEventWithRollbackDescriptor:(id)a3 rollbackSuggestionInfo:(id)a4
{
  workQueue = self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v9 = *MEMORY[0x263F77F90];
  id v10 = [v8 productBuildVersion];

  [(SUManagerCore *)self _reportRollbackEvent:v9 withInfo:v7 buildVersion:v10];
}

- (void)_reportRollbackEvent:(id)a3 withInfo:(id)a4 buildVersion:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v9 = objc_opt_new();
  uint64_t v17 = v9;
  if (v9)
  {
    id v46 = v7;
    [v9 setSafeObject:v7 forKey:*MEMORY[0x263F780A8]];
    [v17 setSafeObject:@"SUS-2.0" forKey:*MEMORY[0x263F77F28]];
    [v17 setSafeObject:@"SUS-2.0" forKey:*MEMORY[0x263F78068]];
    [v17 setSafeObject:self->_sessionID forKey:*MEMORY[0x263F78128]];
    char v18 = +[SUNetworkMonitor sharedInstance];
    uint64_t v19 = [v18 operatorName];
    [v17 setSafeObject:v19 forKey:@"OperatorName"];

    uint64_t v20 = +[SUNetworkMonitor sharedInstance];
    uint64_t v21 = [v20 servingPlmn];
    [v17 setSafeObject:v21 forKey:@"ServingPlmn"];

    uint64_t v44 = -[SUManagerCore rollbackSuggestionReasonFromSUReason:](self, "rollbackSuggestionReasonFromSUReason:", [v8 suggestionReason]);
    objc_msgSend(v17, "setSafeObject:forKey:");
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v45 = v8;
    id obj = [v8 responsibleProcessesInfo];
    uint64_t v22 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      int v24 = 0;
      uint64_t v50 = *(void *)v52;
      uint64_t v48 = *MEMORY[0x263F78018];
      uint64_t v49 = *MEMORY[0x263F78028];
      uint64_t v25 = *MEMORY[0x263F78010];
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v52 != v50) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v28 = (v24 + i + 1);
          uint64_t v29 = [v27 processName];
          [(SUManagerCore *)self setRollbackValue:v29 forKey:v49 count:v28 event:v17];

          uint64_t v30 = [v27 rollbackSuggestionError];
          uint64_t v31 = [v30 domain];
          [(SUManagerCore *)self setRollbackValue:v31 forKey:v48 count:v28 event:v17];

          uint64_t v32 = NSNumber;
          char v33 = [v27 rollbackSuggestionError];
          int v34 = objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v33, "code"));
          [(SUManagerCore *)self setRollbackValue:v34 forKey:v25 count:v28 event:v17];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
        v24 += i;
      }
      while (v23);
    }

    SULogInfo(@"reporting OTA event: %@", v35, v36, v37, v38, v39, v40, v41, (uint64_t)v17);
    uint64_t v42 = [(SUManagerCore *)self coreReporter];
    uint64_t v43 = [NSURL URLWithString:*MEMORY[0x263F78188]];
    [v42 sendEvent:v17 toServerURL:v43];

    id v8 = v45;
    id v7 = v46;
  }
  else
  {
    SULogInfo(@"failed to allocate event for %@ event so not reported", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v7);
  }
}

- (void)setRollbackValue:(id)a3 forKey:(id)a4 count:(int)a5 event:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v14 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = v11;
  if ((int)v7 >= 2)
  {
    uint64_t v13 = objc_msgSend(v11, "stringByAppendingFormat:", @"_%d", v7);
  }
  [v10 setSafeObject:v14 forKey:v13];
}

- (id)rollbackSuggestionReasonFromSUReason:(unint64_t)a3
{
  if (a3 <= 2) {
    self = (SUManagerCore *)**((id **)&unk_26447EEC0 + a3);
  }
  return self;
}

- (void)reportSimulatedOTAAutoTriggeredEvent
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = [(SUManagerCore *)self downloader];
  uint64_t v4 = [v3 download];
  id v5 = [v4 descriptor];
  id v6 = [(SUManagerCore *)self coreDescriptorForSUDescriptor:v5];

  [(SUManagerCore *)self _reportOTAEvent:@"otaSimulatedAutoTriggered" withStatus:0 policy:0 primaryDescriptor:v6 alternateDescriptor:0 additionalMetrics:0 error:0];
}

- (void)reportPostponedEvent:(id)a3 withStatus:(id)a4
{
}

- (void)reportPostponedEvent:(id)a3 withStatus:(id)a4 withAdditionalMetrics:(id)a5
{
  v47[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v11 = [(SUManagerCore *)self state];
  uint64_t v12 = [v11 lastSentOTAPostponedDate];

  if (v12 && ([v12 timeIntervalSinceNow], fabs(v20) < 43200.0))
  {
    SULogInfo(@"%s: Holding off on reporting otaPostponed event because previous event was recently emitted", v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUManagerCore reportPostponedEvent:withStatus:withAdditionalMetrics:]");
  }
  else
  {
    id v21 = v9;
    id v22 = v8;
    uint64_t v46 = *MEMORY[0x263F77F18];
    uint64_t v23 = [(SUManagerCore *)self downloader];
    int v24 = [v23 download];
    uint64_t v25 = [v24 downloadOptions];
    uint64_t v26 = [v25 clientName];
    uint64_t v27 = (void *)v26;
    uint64_t v28 = @"None";
    if (v26) {
      uint64_t v28 = (__CFString *)v26;
    }
    v47[0] = v28;
    [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
    uint64_t v29 = v45 = v10;
    uint64_t v30 = (void *)[v29 mutableCopy];

    if (v45) {
      [v30 addEntriesFromDictionary:v45];
    }
    uint64_t v31 = [(SUManagerCore *)self lastStashbagPersistedDate];

    id v8 = v22;
    id v9 = v21;
    if (v31)
    {
      uint64_t v32 = [(SUManagerCore *)self lastStashbagPersistedDate];
      [v32 timeIntervalSinceNow];
      double v34 = v33;

      if (v34 < 0.0)
      {
        uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"%d", (int)(v34 / -600.0));
        if (v35) {
          [v30 setSafeObject:v35 forKey:*MEMORY[0x263F77FC8]];
        }
      }
    }
    uint64_t v36 = [(SUManagerCore *)self downloader];
    uint64_t v37 = [v36 download];
    uint64_t v38 = [v37 descriptor];
    uint64_t v39 = [(SUManagerCore *)self coreDescriptorForSUDescriptor:v38];

    uint64_t v40 = *MEMORY[0x263F77F78];
    uint64_t v41 = [(SUManagerCore *)self engine];
    uint64_t v42 = [v41 updatePolicy];
    [(SUManagerCore *)self _reportOTAEvent:v40 withStatus:v21 policy:v42 descriptor:v39 additionalMetrics:v30 error:v8];

    uint64_t v43 = [(SUManagerCore *)self state];
    uint64_t v44 = [MEMORY[0x263EFF910] date];
    [v43 setLastSentOTAPostponedDate:v44];

    id v10 = v45;
  }
}

- (void)_reportOTAEvent:(id)a3 withStatus:(id)a4 policy:(id)a5 descriptor:(id)a6 additionalMetrics:(id)a7 error:(id)a8
{
}

- (void)_reportOTAEvent:(id)a3 withStatus:(id)a4 policy:(id)a5 primaryDescriptor:(id)a6 alternateDescriptor:(id)a7 additionalMetrics:(id)a8 error:(id)a9
{
  id v35 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  workQueue = self->_workQueue;
  id v21 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v22 = objc_opt_new();
  uint64_t v30 = v22;
  if (v22)
  {
    [v22 setSafeObject:v21 forKey:*MEMORY[0x263F780A8]];

    [v30 setSafeObject:v35 forKey:*MEMORY[0x263F77F20]];
    uint64_t v31 = +[SUNetworkMonitor sharedInstance];
    SUStringFromNetworkType([v31 currentNetworkType]);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    [v30 setSafeObject:v21 forKey:*MEMORY[0x263F77FB8]];
    uint64_t v32 = +[SUNetworkMonitor sharedInstance];
    int v33 = [v32 isCurrentNetworkTypeCellular];

    double v34 = (void *)MEMORY[0x263F78118];
    if (!v33) {
      double v34 = (void *)MEMORY[0x263F780A0];
    }
    [v30 setSafeObject:*v34 forKey:@"cellular"];
    if (v19) {
      [MEMORY[0x263F77DC8] augmentEvent:v30 withError:v19];
    }
    else {
      [v30 setSafeObject:*MEMORY[0x263F780D0] forKey:*MEMORY[0x263F780C0]];
    }
    [(SUManagerCore *)self _describeAndReportEvent:v30 policy:v15 primaryDescriptor:v16 alternateDescriptor:v17 additionalMetrics:v18];
  }
  else
  {
    SULogInfo(@"failed to allocate event for %@ event so not reported", v23, v24, v25, v26, v27, v28, v29, (uint64_t)v21);
  }
}

- (void)_describeAndReportEvent:(id)a3 policy:(id)a4 primaryDescriptor:(id)a5 alternateDescriptor:(id)a6 additionalMetrics:(id)a7
{
  id v34 = a3;
  id v12 = a5;
  id v13 = a7;
  workQueue = self->_workQueue;
  id v15 = a6;
  id v16 = a4;
  dispatch_assert_queue_V2(workQueue);
  id v17 = objc_alloc_init(MEMORY[0x263F77B70]);
  [v17 setPolicy:v16];

  [v17 setPrimaryDescriptor:v12];
  [v17 setAlternateDescriptor:v15];

  [v17 augmentEvent:v34];
  [v34 setSafeObject:@"SUS-2.0" forKey:*MEMORY[0x263F77F28]];
  [v34 setSafeObject:@"SUS-2.0" forKey:*MEMORY[0x263F78068]];
  [v34 setSafeObject:self->_sessionID forKey:*MEMORY[0x263F78128]];
  id v18 = [(SUManagerCore *)self newInstallTonightConfig];
  [v34 setSafeObject:v18 forKey:*MEMORY[0x263F77F98]];

  id v19 = (void *)MEMORY[0x263F78118];
  if (!self->_reportStartedFromPersistedState) {
    id v19 = (void *)MEMORY[0x263F780A0];
  }
  [v34 setSafeObject:*v19 forKey:@"startedFromPersistedState"];
  double v20 = +[SUNetworkMonitor sharedInstance];
  id v21 = [v20 operatorName];
  [v34 setSafeObject:v21 forKey:@"OperatorName"];

  id v22 = +[SUNetworkMonitor sharedInstance];
  uint64_t v23 = [v22 servingPlmn];
  [v34 setSafeObject:v23 forKey:@"ServingPlmn"];

  uint64_t v24 = [(SUManagerCore *)self installTonightConfigDictionary];
  [v34 addEntriesFromDictionary:v24];

  if (v13) {
    [v34 addEntriesFromDictionary:v13];
  }
  uint64_t v32 = [(SUManagerCore *)self eventRecordingServiceURL:v12];
  if (v32)
  {
    SULogInfo(@"reporting OTA event: %@", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v34);
    int v33 = [(SUManagerCore *)self coreReporter];
    [v33 sendEvent:v34 toServerURL:v32];
  }
  else
  {
    SULogInfo(@"Unable to create event reporting server URL. Not sending event: %@", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v34);
  }
}

- (id)eventRecordingServiceURL:(id)a3
{
  uint64_t v3 = NSURL;
  uint64_t v4 = *MEMORY[0x263F78188];
  id v5 = a3;
  id v6 = [v3 URLWithString:v4];
  uint64_t v7 = [v5 getMASoftwareUpdateAsset];

  id v8 = [v7 attributes];

  if (v8)
  {
    id v9 = [v8 objectForKey:@"_EventRecordingServiceURL"];
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x263F77DC8] buildSplunkServerURLFromBase:v9];

      id v6 = (void *)v10;
    }
  }

  return v6;
}

- (void)reporterFlushEvent
{
}

- (void)reportCoreAnalyticsOTAAvailableEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerCore *)self _getAmountDataAvailable];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __54__SUManagerCore_reportCoreAnalyticsOTAAvailableEvent___block_invoke;
  id v13 = &unk_26447EE30;
  id v14 = v5;
  id v15 = self;
  id v6 = v5;
  uint64_t v7 = (void (**)(void, void))MEMORY[0x223C18480](&v10);
  id v8 = objc_msgSend(v4, "preferredDescriptor", v10, v11, v12, v13);
  ((void (**)(void, void *))v7)[2](v7, v8);

  id v9 = [v4 alternateDescriptor];

  ((void (**)(void, void *))v7)[2](v7, v9);
}

void __54__SUManagerCore_reportCoreAnalyticsOTAAvailableEvent___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [[SUAnalyticsEvent alloc] initWithEventName:@"com.apple.massStorage.SoftwareUpdate.OTAEvents_1"];
    [(SUAnalyticsEvent *)v4 setEventPayloadEntry:@"eventName" stringValue:*MEMORY[0x263F77F60]];
    [(SUAnalyticsEvent *)v4 setEventPayloadEntry:@"errorCode" numberValue:&unk_26CEBD0D8];
    [(SUAnalyticsEvent *)v4 setEventPayloadEntry:@"autoDownload" BOOLValue:0];
    [(SUAnalyticsEvent *)v4 setEventPayloadEntry:@"DiskUsageAmountDataAvailable" numberValue:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _augmentCoreAnalyticsEvent:v4 withUpdate:v3];

    [*(id *)(a1 + 40) _submitCoreAnalyticsEvent:v4];
  }
}

- (void)reportCoreAnalyticsOTAStartedDownloadingEvent:(id)a3
{
  uint64_t v4 = [(SUManagerCore *)self _createCoreAnalyticsEventWithCurrentDownloadFor:*MEMORY[0x263F77F80] error:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(SUManagerCore *)self _submitCoreAnalyticsEvent:v4];
    uint64_t v5 = v6;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)reportCoreAnalyticsOTAAbandonedEvent:(id)a3
{
  uint64_t v4 = [(SUManagerCore *)self _createCoreAnalyticsEventWithCurrentDownloadFor:*MEMORY[0x263F77F50] error:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(SUManagerCore *)self _submitCoreAnalyticsEvent:v4];
    uint64_t v5 = v6;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)reportCoreAnalyticsOTADownloadedEvent
{
  uint64_t v3 = [(SUManagerCore *)self _createCoreAnalyticsEventWithCurrentDownloadFor:*MEMORY[0x263F77F68] error:0];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v3 = [(SUManagerCore *)self _submitCoreAnalyticsEvent:v3];
    uint64_t v4 = v5;
  }

  MEMORY[0x270F9A758](v3, v4);
}

- (void)_augmentCoreAnalyticsEvent:(id)a3 withUpdate:(id)a4
{
  uint64_t v5 = *MEMORY[0x263F78128];
  sessionID = self->_sessionID;
  id v7 = a4;
  id v8 = a3;
  [v8 setEventPayloadEntry:v5 stringValue:sessionID];
  objc_msgSend(v8, "setEventPayloadEntry:BOOLValue:", @"preSUStagingEnabled", objc_msgSend(v7, "enablePreSUStaging"));
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v7, "preSUStagingOptionalSize") >> 20);
  [v8 setEventPayloadEntry:@"preSUStagingOptionalSize" numberValue:v9];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v7, "preSUStagingRequiredSize") >> 20);
  [v8 setEventPayloadEntry:@"preSUStagingRequiredSize" numberValue:v10];

  uint64_t v11 = [v7 productBuildVersion];
  [v8 setEventPayloadEntry:@"targetOSVersion" stringValue:v11];

  id v12 = [v7 updateTypeName];
  [v8 setEventPayloadEntry:@"updateType" stringValue:v12];

  id v13 = NSNumber;
  unint64_t v14 = [v7 totalRequiredFreeSpace];

  id v15 = [v13 numberWithUnsignedLongLong:v14 >> 20];
  [v8 setEventPayloadEntry:@"totalRequiredFreeSpace" numberValue:v15];
}

- (id)_getAmountDataAvailable
{
  uint64_t v2 = (void *)MGCopyAnswer();
  uint64_t v10 = v2;
  if (v2)
  {
    uint64_t v11 = [v2 objectForKey:*MEMORY[0x263F8BD10]];
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v11, "unsignedLongLongValue") >> 20);
  }
  else
  {
    SULogError(@"%s: failed to get the disk usage dictionary", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore _getAmountDataAvailable]");
    id v12 = &unk_26CEBD0D8;
  }

  return v12;
}

- (id)_createCoreAnalyticsEventWithCurrentDownloadFor:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v15 = [(SUManagerCore *)self download];
  if (v15)
  {
    id v16 = [[SUAnalyticsEvent alloc] initWithEventName:@"com.apple.massStorage.SoftwareUpdate.OTAEvents_1"];
    [(SUAnalyticsEvent *)v16 setEventPayloadEntry:@"eventName" stringValue:v6];
    id v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "code"));
    [(SUAnalyticsEvent *)v16 setEventPayloadEntry:@"errorCode" numberValue:v17];

    id v18 = [v15 downloadOptions];
    id v19 = [v15 descriptor];
    double v20 = [(SUManagerCore *)self coreDescriptorForSUDescriptor:v19];

    -[SUAnalyticsEvent setEventPayloadEntry:BOOLValue:](v16, "setEventPayloadEntry:BOOLValue:", @"autoDownload", [v18 isAutoDownload]);
    [(SUManagerCore *)self _augmentCoreAnalyticsEvent:v16 withUpdate:v20];
    id v21 = [(SUManagerCore *)self _getAmountDataAvailable];
    [(SUAnalyticsEvent *)v16 setEventPayloadEntry:@"DiskUsageAmountDataAvailable" numberValue:v21];
  }
  else
  {
    SULogError(@"%s: current download doesn't exist", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerCore _createCoreAnalyticsEventWithCurrentDownloadFor:error:]");
    id v16 = 0;
  }

  return v16;
}

- (void)_submitCoreAnalyticsEvent:(id)a3
{
  workQueue = self->_workQueue;
  id v4 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v5 = +[SUAnalyticsManager sharedManager];
  [v5 setEvent:v4];

  id v6 = +[SUAnalyticsManager sharedManager];
  [v6 submitEvent:v4];
}

- (BOOL)isSplatRollbackAllowed:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v5 = +[SUPreferences sharedInstance];
  int v6 = [v5 fakeSplatInstalled];

  if (v6)
  {
    uint64_t v14 = @"Fake splat installed, allowing rollback";
LABEL_5:
    SULogInfo(v14, v7, v8, v9, v10, v11, v12, v13, v51);
    goto LABEL_6;
  }
  id v15 = [MEMORY[0x263F77D98] sharedDevice];
  int v16 = [v15 hasSemiSplatActive];

  if (v16)
  {
    uint64_t v14 = @"Rollback already applied, allow rollback";
    goto LABEL_5;
  }
  if (!+[SUUtility isSplatOnlyUpdateInstalled])
  {
    SULogInfo(@"Splat-only update not installed. Unable to rollback update", v20, v21, v22, v23, v24, v25, v26, v51);
    uint64_t v35 = 93;
    goto LABEL_15;
  }
  uint64_t v27 = [(SUManagerCore *)self preferredLastScannedDescriptor];
  if (v27)
  {

LABEL_14:
    SULogInfo(@"Splat-only update installed, but new update available. Preventing rollback", v28, v29, v30, v31, v32, v33, v34, v51);
    uint64_t v35 = 94;
    goto LABEL_15;
  }
  uint64_t v36 = [(SUManagerCore *)self alternateLastScannedDescriptor];

  if (v36) {
    goto LABEL_14;
  }
  if (![(SUManagerCore *)self isSplatRollbackEnabled])
  {
    SULogInfo(@"Splat Rollback disabled", v37, v38, v39, v40, v41, v42, v43, v51);
    uint64_t v35 = 88;
LABEL_15:
    id v17 = +[SUUtility errorWithCode:v35];
    BOOL v18 = 0;
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (!+[SUUtility isSplatRollbackDirectoryPresent])
  {
    SULogInfo(@"Splat Rollback disabled due to missing rollback objects", v44, v45, v46, v47, v48, v49, v50, v51);
    uint64_t v35 = 99;
    goto LABEL_15;
  }
LABEL_6:
  id v17 = 0;
  BOOL v18 = 1;
  if (a3) {
LABEL_7:
  }
    *a3 = v17;
LABEL_8:

  return v18;
}

- (BOOL)isSplatOnlyUpdateRollbackSuggested
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([(SUManagerCore *)self isSplatRollbackAllowed:0])
  {
    uint64_t v10 = [(SUManagerCore *)self preferredLastScannedDescriptor];
    uint64_t v11 = +[SUPreferences sharedInstance];
    uint64_t v12 = [v11 suggestedRollbackSplatVersion];

    uint64_t v13 = [v10 restoreVersion];
    int v14 = [v13 isEqualToString:v12];

    if (v14) {
      SULogInfo(@"%s: Found suggested rollback for %@: %@", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[SUManagerCore isSplatOnlyUpdateRollbackSuggested]");
    }
    else {
      SULogInfo(@"%s: No suggested rollback for %@.", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[SUManagerCore isSplatOnlyUpdateRollbackSuggested]");
    }
  }
  else
  {
    SULogInfo(@"%s: Splat rollback is not allowed.", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore isSplatOnlyUpdateRollbackSuggested]");
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (BOOL)isManaged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = +[SUPreferences sharedInstance];
  int v4 = [v3 disableManagedRequest];

  if (v4)
  {
    SULogInfo(@"%s: disableManagedRequest is set; device is considered not managed.",
      v5,
      v6,
      v7,
      v8,
      v9,
      v10,
      v11,
      (uint64_t)"-[SUManagerCore isManaged]");
    return 0;
  }
  else
  {
    uint64_t v13 = [(SUManagerCore *)self ddmManager];
    if ([v13 isManagedByDDM])
    {
      char v12 = 1;
    }
    else
    {
      int v14 = [(SUManagerCore *)self managedDeviceManager];
      char v12 = [v14 isManagedByMDM];
    }
  }
  return v12;
}

- (void)amendManagedScanOptions:(id)a3 withResponse:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v7)
  {
    if (v6)
    {
      if (![(SUManagerCore *)self isManaged])
      {
        SULogInfo(@"%s: device is not managed. Unset managed scan options", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[SUManagerCore amendManagedScanOptions:withResponse:]");
        [v6 setManagedScanOptions:0];
        v7[2](v7, v6, 0);
        goto LABEL_11;
      }
      uint64_t v22 = [v6 managedScanOptions];

      if (!v22)
      {
        SULogError(@"%s: missing managed scan options", v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[SUManagerCore amendManagedScanOptions:withResponse:]");
        uint64_t v30 = objc_opt_new();
        [v6 setManagedScanOptions:v30];
      }
      uint64_t v31 = [v6 managedScanOptions];
      uint64_t v32 = [(SUManagerCore *)self ddmManager];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __54__SUManagerCore_amendManagedScanOptions_withResponse___block_invoke;
      v34[3] = &unk_26447EE80;
      v34[4] = self;
      id v35 = v31;
      id v36 = v6;
      uint64_t v37 = v7;
      id v33 = v31;
      [v32 getActiveDDMDeclarationEnforcedSUWithResponse:v34];
    }
    else
    {
      SULogError(@"%s: cannot amend nil scan options", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerCore amendManagedScanOptions:withResponse:]");
      id v33 = +[SUUtility errorWithCode:22];
      ((void (**)(id, id, id))v7)[2](v7, 0, v33);
    }
  }
  else
  {
    SULogError(@"%s: no response provided", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerCore amendManagedScanOptions:withResponse:]");
  }
LABEL_11:
}

void __54__SUManagerCore_amendManagedScanOptions_withResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 120);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SUManagerCore_amendManagedScanOptions_withResponse___block_invoke_2;
  block[3] = &unk_26447EE58;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __54__SUManagerCore_amendManagedScanOptions_withResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    int v4 = [v2 versionString];
    [v3 setRequestedProductMarketingVersion:v4];

    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) buildVersionString];
    [v5 setRequestedBuildVersion:v6];

    [*(id *)(a1 + 40) setAllowSplat:1];
    [*(id *)(a1 + 40) setMDMSoftwareUpdatePath:0];
    [*(id *)(a1 + 40) setUseDelayPeriod:0];
    [*(id *)(a1 + 40) setDelayPeriodSeconds:0];
    [*(id *)(a1 + 48) setScanType:2];
  }
  else
  {
    if ([*(id *)(a1 + 40) useDelayPeriod] == 2)
    {
      uint64_t v14 = [*(id *)(a1 + 56) updatesDelayPeriodSeconds];
      [*(id *)(a1 + 40) setDelayPeriodSeconds:v14];
      [*(id *)(a1 + 40) setUseDelayPeriod:v14 != 0];
    }
    if ([*(id *)(a1 + 40) MDMSoftwareUpdatePath] == 3) {
      objc_msgSend(*(id *)(a1 + 40), "setMDMSoftwareUpdatePath:", objc_msgSend(*(id *)(a1 + 56), "softwareUpdatePathRestriction"));
    }
    if ([*(id *)(a1 + 40) allowSplat] == 2) {
      objc_msgSend(*(id *)(a1 + 40), "setAllowSplat:", objc_msgSend(*(id *)(a1 + 56), "splatUpdatesAllowed"));
    }
    uint64_t v15 = [*(id *)(a1 + 48) identifier];
    int v16 = [v15 isEqualToString:@"com.apple.mdm"];

    if (v16)
    {
      [*(id *)(a1 + 40) setAllowSplat:1];
      SULogInfo(@"MDM initiated scan. Allowing splat scan", v17, v18, v19, v20, v21, v22, v23, v26);
    }
  }
  SULogDebug(@"managed scan options after amendment: %@", v7, v8, v9, v10, v11, v12, v13, *(void *)(a1 + 40));
  uint64_t v24 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v24();
}

- (unint64_t)softwareUpdatePathRestriction
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([(SUManagerCore *)self isManaged])
  {
    uint64_t v10 = +[SUPreferences sharedInstance];
    uint64_t v11 = [v10 MDMSoftwareUpdatePath];

    if (v11)
    {
      uint64_t v12 = +[SUPreferences sharedInstance];
      uint64_t v13 = [v12 MDMSoftwareUpdatePath];
      unint64_t v14 = [v13 unsignedIntegerValue];

      if (v14 < 3)
      {
        uint64_t v22 = SUStringFromMDMSUPath(v14);
        SULogInfo(@"%s: SU path is %@ (set by SU preference)", v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
LABEL_13:

        return v14;
      }
      SULogError(@"%s: SU preference has an invalid value %lu; ignore it",
        v15,
        v16,
        v17,
        v18,
        v19,
        v20,
        v21,
        (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
    }
    uint64_t v30 = [(SUManagerCore *)self ddmManager];
    unint64_t v14 = [v30 recommendedCadence];

    if (v14 != 3)
    {
      uint64_t v22 = SUStringFromMDMSUPath(v14);
      SULogInfo(@"%s: SU path is %@ (set by DDM global settings)", v39, v40, v41, v42, v43, v44, v45, (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
      goto LABEL_13;
    }
    uint64_t v31 = [(SUManagerCore *)self managedDeviceManager];
    unint64_t v14 = [v31 softwareUpdatePathRestriction];

    if (v14 != 3)
    {
      uint64_t v22 = SUStringFromMDMSUPath(v14);
      SULogInfo(@"%s: SU path is %@ (set by MDM restriction)", v46, v47, v48, v49, v50, v51, v52, (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
      goto LABEL_13;
    }
    SULogInfo(@"%s: device is managed. SU path is default", v32, v33, v34, v35, v36, v37, v38, (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
  }
  else
  {
    SULogInfo(@"%s: device is not managed. SU path is default", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
  }
  return 0;
}

- (unint64_t)updatesDelayPeriodSeconds
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (![(SUManagerCore *)self isManaged])
  {
    SULogInfo(@"%s: device is not managed. Updates are not delayed", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
    return 0;
  }
  uint64_t v10 = +[SUPreferences sharedInstance];
  int v11 = [v10 shouldDelayUpdates];

  if (v11)
  {
    uint64_t v12 = +[SUPreferences sharedInstance];
    uint64_t v13 = [v12 updateDelayInterval];
    uint64_t v14 = [v13 unsignedIntegerValue];

    if (v14)
    {
      uint64_t v22 = +[SUPreferences sharedInstance];
      int v23 = [v22 shouldDelayInMinutes];

      uint64_t v31 = 86400;
      if (v23) {
        uint64_t v31 = 60;
      }
      unint64_t v32 = v31 * v14;
      SULogInfo(@"%s: Updates are delayed by SU preferences for %lu seconds", v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
      return v32;
    }
    SULogError(@"%s: No delay period set, ignore SU preferences", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
  }
  uint64_t v33 = [(SUManagerCore *)self ddmManager];
  int v34 = [v33 isDealyingUpdates];

  if (v34)
  {
    uint64_t v35 = [(SUManagerCore *)self ddmManager];
    unint64_t v32 = 86400 * [v35 updateDeferralPeriodDays];

    if (!v32) {
      SULogError(@"%s: Updates are delayed by DDM but the delay period is 0", v36, v37, v38, v39, v40, v41, v42, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
    }
    SULogInfo(@"%s: Updates are delayed by DDM global settings for %lu seconds", v36, v37, v38, v39, v40, v41, v42, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
    return v32;
  }
  uint64_t v43 = [(SUManagerCore *)self managedDeviceManager];
  int v44 = [v43 isDelayingUpdates];

  if (!v44)
  {
    SULogInfo(@"%s: device is managed. Updates are not delayed", v45, v46, v47, v48, v49, v50, v51, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
    return 0;
  }
  uint64_t v52 = [(SUManagerCore *)self managedDeviceManager];
  unint64_t v32 = 86400 * [v52 delayPeriodInDays];

  if (!v32) {
    SULogError(@"%s: Updates are delayed by MDM but the delay period is 0", v53, v54, v55, v56, v57, v58, v59, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
  }
  SULogInfo(@"%s: Updates are delayed by MDM restrictions for %lu seconds", v53, v54, v55, v56, v57, v58, v59, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
  return v32;
}

- (BOOL)isDelayingUpdates
{
  return [(SUManagerCore *)self updatesDelayPeriodSeconds] != 0;
}

- (BOOL)isSplatRollbackEnabled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([(SUManagerCore *)self isManaged])
  {
    uint64_t v10 = +[SUPreferences sharedInstance];
    char v11 = [v10 disableRollback];

    if (v11)
    {
      LOBYTE(v12) = 0;
      uint64_t v13 = @"%s: Disabling Splat rollback due to SU Preference";
    }
    else
    {
      uint64_t v14 = [(SUManagerCore *)self ddmManager];
      int v15 = [v14 enableRapidSecurityResponseRollback];

      if (v15)
      {
        uint64_t v16 = [(SUManagerCore *)self managedDeviceManager];
        int v12 = [v16 allowSplatRollback];

        if (v12) {
          uint64_t v13 = @"%s: device is managed. Splat rollback is enabled";
        }
        else {
          uint64_t v13 = @"%s: Splat rollback is disabled by MDM restrictions";
        }
      }
      else
      {
        LOBYTE(v12) = 0;
        uint64_t v13 = @"%s: Splat rollback is disabled by DDM global settings";
      }
    }
  }
  else
  {
    LOBYTE(v12) = 1;
    uint64_t v13 = @"%s: device is not managed. Splat rollback is enabled";
  }
  SULogInfo(v13, v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore isSplatRollbackEnabled]");
  return v12;
}

- (BOOL)splatUpdatesAllowed
{
  if ([(SUManagerCore *)self isManaged])
  {
    uint64_t v10 = +[SUPreferences sharedInstance];
    int v11 = [v10 allowSplatUpdate];

    if (v11)
    {
      int v12 = [(SUManagerCore *)self ddmManager];
      int v13 = [v12 enableRapidSecurityResponse];

      if (v13)
      {
        uint64_t v14 = [(SUManagerCore *)self managedDeviceManager];
        int v15 = [v14 allowSplat];

        if (v15) {
          uint64_t v16 = @"%s: device is managed. Splat updates are allowed";
        }
        else {
          uint64_t v16 = @"%s: Splat updates are disallowed by MDM restrictions";
        }
      }
      else
      {
        LOBYTE(v15) = 0;
        uint64_t v16 = @"%s: Splat updates are disallowed by DDM global settings";
      }
    }
    else
    {
      LOBYTE(v15) = 0;
      uint64_t v16 = @"%s: Splat updates are disallowed by SU preference";
    }
  }
  else
  {
    LOBYTE(v15) = 1;
    uint64_t v16 = @"%s: device is not managed. Splat updates are allowed";
  }
  SULogInfo(v16, v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore splatUpdatesAllowed]");
  return v15;
}

- (id)delayEndDate
{
  return 0;
}

- (void)managedInstallRequested
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = [(SUManagerCore *)self installer];
  [v3 managedInstallRequested];
}

- (NSDictionary)mandatoryUpdateDictionary
{
  v20[1] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = +[SUPreferences sharedInstance];
  uint64_t v4 = [v3 mandatorySUFlags];
  uint64_t v5 = [v4 integerValue];

  if (v5)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = +[SUPreferences sharedInstance];
    uint64_t v8 = [v7 mandatorySUFlags];
    uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", @"%d", objc_msgSend(v8, "integerValue"));

    uint64_t v19 = @"SoftwareUpdateConfigurationFlags";
    v20[0] = v9;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    SULogInfo(@"Overriding mandatoryUpdateDictionary to %@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v10);
  }
  else
  {
    uint64_t v10 = self->_mandatoryUpdateDictionary;
  }

  return v10;
}

- (void)setMandatoryUpdateDictionary:(id)a3
{
  id v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  p_mandatoryUpdateDictionary = &self->_mandatoryUpdateDictionary;
  if (![(NSDictionary *)self->_mandatoryUpdateDictionary isEqualToDictionary:v18])
  {
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
      objc_storeStrong((id *)&self->_mandatoryUpdateDictionary, a3);
      id v6 = [(NSDictionary *)*p_mandatoryUpdateDictionary objectForKey:@"DisableAutoUpdate"];
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v6 BOOLValue])
          {
            SULogInfo(@"Mandatory update dictionary is disabling auto updates", v7, v8, v9, v10, v11, v12, v13, v17);
            uint64_t v14 = +[SUPreferences sharedInstance];
            [v14 enableAutomaticUpdateV2:0];
          }
        }
      }
    }
    else
    {
      id v6 = *p_mandatoryUpdateDictionary;
      *p_mandatoryUpdateDictionary = 0;
    }

    uint64_t v15 = [(SUManagerCore *)self state];
    [v15 setMandatoryUpdateDict:v18];

    uint64_t v16 = [(SUManagerCore *)self state];
    [v16 save];
  }
LABEL_10:
}

- (void)sendUnlockNotifications:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__SUManagerCore_sendUnlockNotifications___block_invoke;
  v4[3] = &unk_26447CD98;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(workQueue, v4);
}

uint64_t __41__SUManagerCore_sendUnlockNotifications___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 addUnlockCallback:sel__notifyEngineOnUnlock forKey:@"unlockCallbackEngineUnlockNotification"];
  }
  else {
    return [v2 removeUnlockCallback:@"unlockCallbackEngineUnlockNotification"];
  }
}

- (void)activated:(BOOL)a3
{
  if (a3)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27__SUManagerCore_activated___block_invoke;
    block[3] = &unk_26447C878;
    void block[4] = self;
    dispatch_async(workQueue, block);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resumeFromStateSemaphore);
}

void __27__SUManagerCore_activated___block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) downloader];
  if (([v12 isDownloading] & 1) != 0
    || [*(id *)(a1 + 32) isUpdateDownloaded])
  {
    int v2 = [*(id *)(a1 + 32) resetDownloadStateOnCleanActivation];

    if (v2)
    {
      SULogInfo(@"Activated to clean state when already downloading, reset download state", v3, v4, v5, v6, v7, v8, v9, v11);
      [*(id *)(a1 + 32) setResetDownloadStateOnCleanActivation:0];
      uint64_t v10 = *(void **)(a1 + 32);
      [v10 resetDownloadState];
    }
  }
  else
  {
  }
}

- (void)downloadProgress:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SUManagerCore_downloadProgress___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __34__SUManagerCore_downloadProgress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) downloader];
  [v2 downloadProgress:*(void *)(a1 + 40)];
}

- (void)downloadCompleted:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SUManagerCore_downloadCompleted___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __35__SUManagerCore_downloadCompleted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) downloader];
  [v2 downloadCompleted:*(void *)(a1 + 40)];
}

- (void)downloadCompleted:(id)a3 informClients:(BOOL)a4
{
  id v6 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUManagerCore_downloadCompleted_informClients___block_invoke;
  block[3] = &unk_26447CED8;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

void __49__SUManagerCore_downloadCompleted_informClients___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) downloader];
  [v2 downloadCompleted:*(void *)(a1 + 40) informClients:*(unsigned __int8 *)(a1 + 48)];
}

- (void)installCompleted:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SUManagerCore_installCompleted___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __34__SUManagerCore_installCompleted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) installer];
  [v2 installCompleted:*(void *)(a1 + 40)];
}

- (void)rollbackStarted:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SUManagerCore_rollbackStarted___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __33__SUManagerCore_rollbackStarted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rollback];
  [v2 rollbackStarted:*(void *)(a1 + 40)];
}

- (void)rollbackCompleted:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUManagerCore_rollbackCompleted_withError___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __45__SUManagerCore_rollbackCompleted_withError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rollback];
  [v2 rollbackCompleted:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (void)assetAudienceChanged:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SUManagerCore_assetAudienceChanged___block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __38__SUManagerCore_assetAudienceChanged___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(@"Asset audience changed. Kicking off background scan", a2, a3, a4, a5, a6, a7, a8, v11);
  id v9 = *(void **)(a1 + 32);

  return [v9 autoScanAndDownloadIfAvailable:0 withResult:&__block_literal_global_873];
}

void __38__SUManagerCore_assetAudienceChanged___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v4 = a3;
  id v12 = v4;
  if (v4) {
    SULogInfo(@"Background scan resulted in error: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }
  if (v21)
  {
    id v13 = [v21 preferredDescriptor];
    SULogInfo(@"Background scan found preferred descriptor: %@", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
  }
}

- (void)keybagInterface:(id)a3 passcodeLockedStateDidChange:(BOOL)a4
{
  uint64_t v10 = @"NO";
  if (a4) {
    uint64_t v10 = @"YES";
  }
  SULogInfo(@"Device lock status changed: passcodeLocked = %@", (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, (uint64_t)v10);
  if (!a4)
  {
    SULogInfo(@"Device unlocked", v11, v12, v13, v14, v15, v16, v17, v19);
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__SUManagerCore_keybagInterface_passcodeLockedStateDidChange___block_invoke;
    block[3] = &unk_26447C878;
    void block[4] = self;
    dispatch_async(workQueue, block);
  }
}

uint64_t __62__SUManagerCore_keybagInterface_passcodeLockedStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doUnlockEvents];
}

- (void)networkMonitorDetectOverrides
{
  id v2 = +[SUNetworkMonitor sharedInstance];
  [v2 detectOverriddenNetwork];
}

- (void)showInsufficientDiskSpaceFollowupForUpdate:(id)a3
{
  id v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  BOOL v5 = [(SUDescriptor *)self->_updateOfCurrentStorageFollowup isEqual:v18];
  uint64_t v6 = [(SUManagerCore *)self followUpController];
  int v7 = [v6 isCurrentlyPresentingFollowUpType:3];

  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  uint64_t v16 = *(void *)&v15;
  if (v5
    && v7
    && vabdd_f64(v15, *(double *)&showInsufficientDiskSpaceFollowupForUpdate____LAST_FOLLOWUP_TIME) <= 86400.0)
  {
    SULogInfo(@"%s: Don't show the same followup again.", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerCore showInsufficientDiskSpaceFollowupForUpdate:]");
  }
  else
  {
    objc_storeStrong((id *)&self->_updateOfCurrentStorageFollowup, a3);
    showInsufficientDiskSpaceFollowupForUpdate____LAST_FOLLOWUP_TIME = v16;
    uint64_t v17 = [(SUManagerCore *)self followUpController];
    [v17 postFollowUpOfType:3 withUpdate:v18 userInfo:0];
  }
}

- (void)dismissInsufficientDiskSpaceFollowupForUpdate:(id)a3 orForce:(BOOL)a4
{
  id v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (a4 || [(SUDescriptor *)self->_updateOfCurrentStorageFollowup isEqual:v18])
  {
    updateOfCurrentStorageFollowup = self->_updateOfCurrentStorageFollowup;
    self->_updateOfCurrentStorageFollowup = 0;

    int v7 = [(SUManagerCore *)self followUpController];
    int v8 = [v7 isCurrentlyPresentingFollowUpType:3];

    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = [(SUManagerCore *)self followUpController];
    [v9 dismissFollowUpType:3];
  }
  else
  {
    uint64_t v9 = [(SUDescriptor *)self->_updateOfCurrentStorageFollowup productBuildVersion];
    uint64_t v17 = [v18 productBuildVersion];
    SULogInfo(@"%s: Don't dismiss the followup. Current followup is for %@, not %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUManagerCore dismissInsufficientDiskSpaceFollowupForUpdate:orForce:]");
  }
LABEL_7:
}

- (OS_dispatch_queue)externWorkQueue
{
  return self->_externWorkQueue;
}

- (void)setEngine:(id)a3
{
}

- (SUScanner)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
}

- (void)setDownloader:(id)a3
{
}

- (SUInstaller)installer
{
  return self->_installer;
}

- (void)setInstaller:(id)a3
{
}

- (SURollbackController)rollback
{
  return self->_rollback;
}

- (void)setRollback:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setSessionID:(id)a3
{
}

- (NSString)potentialNextSessionID
{
  return self->_potentialNextSessionID;
}

- (void)setPotentialNextSessionID:(id)a3
{
}

- (NSMutableDictionary)unlockCallbacks
{
  return self->_unlockCallbacks;
}

- (void)setFollowUpController:(id)a3
{
}

- (SUCoreEventReporter)coreReporter
{
  return self->_coreReporter;
}

- (void)setCoreReporter:(id)a3
{
}

- (BOOL)resetDownloadStateOnCleanActivation
{
  return self->_resetDownloadStateOnCleanActivation;
}

- (void)setResetDownloadStateOnCleanActivation:(BOOL)a3
{
  self->_resetDownloadStateOnCleanActivation = a3;
}

- (void)setIsUpdateDownloaded:(BOOL)a3
{
  self->_isUpdateDownloaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateOfCurrentStorageFollowup, 0);
  objc_storeStrong((id *)&self->_resumeFromStateSemaphore, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_coreReporter, 0);
  objc_storeStrong((id *)&self->_externWorkQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_lastStashbagPersistedDate, 0);
  objc_storeStrong((id *)&self->_potentialNextSessionID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateDictionary, 0);
  objc_storeStrong((id *)&self->_managedDeviceManager, 0);
  objc_storeStrong((id *)&self->_unlockCallbacks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_rollback, 0);
  objc_storeStrong((id *)&self->_installer, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_scanner, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end