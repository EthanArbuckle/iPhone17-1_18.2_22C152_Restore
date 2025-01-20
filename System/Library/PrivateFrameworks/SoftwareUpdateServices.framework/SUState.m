@interface SUState
+ (id)currentState;
+ (id)statePath;
- (BOOL)autoDownloadNeedsOneTimeRetry;
- (BOOL)stashbagPersisted;
- (BOOL)underExclusiveControl;
- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5;
- (NSArray)failedPatchDescriptors;
- (NSDate)appliedTime;
- (NSDate)lastAutoDownloadDate;
- (NSDate)lastRecommendedUpdateDiscoveryDate;
- (NSDate)lastScanDate;
- (NSDate)lastSentOTAPostponedDate;
- (NSDate)scheduledAutoDownloadPolicyChangeTime;
- (NSDate)scheduledAutoDownloadWifiPeriodEndTime;
- (NSDate)scheduledManualDownloadWifiPeriodEndTime;
- (NSDictionary)ddmPersistedError;
- (NSDictionary)mandatoryUpdateDict;
- (NSDictionary)unlockCallbacks;
- (NSDictionary)updateDiscoveryDates;
- (NSDictionary)updateFullyUnrampedDates;
- (NSMutableArray)rolledBackBuildVersions;
- (NSNumber)lastRecommendedUpdateInterval;
- (NSString)description;
- (NSString)lastAssetAudience;
- (NSString)lastDeletedSUAssetID;
- (NSString)lastProductBuild;
- (NSString)lastProductType;
- (NSString)lastProductVersion;
- (NSString)lastRecommendedUpdateVersion;
- (NSString)lastReleaseType;
- (NSString)lastRollbackRecommendedBuildVersion;
- (NSString)lastSplatRestoreVersion;
- (NSString)sessionID;
- (SUCoreDescriptor)alternateLastScannedCoreDescriptor;
- (SUCoreDescriptor)preferredLastScannedCoreDescriptor;
- (SUDownload)lastDownload;
- (SUInstallPolicy)installPolicy;
- (SUManagedDeviceUpdateDelay)mdmDelay;
- (SURollbackDescriptor)lastRollbackDescriptor;
- (SUScanOptions)lastScannedDescriptorScanOptions;
- (SUState)init;
- (_SUAutoInstallOperationModel)lastAutoInstallOperationModel;
- (id)_stateAsDictionary;
- (id)initForTesting:(BOOL)a3;
- (void)_queue_addFailedPatchDescriptor:(id)a3;
- (void)addFailedPatchDescriptor:(id)a3;
- (void)addRolledBackBuildVersion:(id)a3;
- (void)load;
- (void)loadPersistedFailedPatchDescriptors;
- (void)loadRolledBackBuildVersions;
- (void)persistFailedPatchDescriptors;
- (void)persistRolledBackBuildVersions;
- (void)queue_addRolledBackBuildVersion:(id)a3;
- (void)resetAllHistory;
- (void)resetDownloadAndScanHistory;
- (void)save;
- (void)setAlternateLastScannedCoreDescriptor:(id)a3;
- (void)setAppliedTime:(id)a3;
- (void)setAutoDownloadNeedsOneTimeRetry:(BOOL)a3;
- (void)setDdmPersistedError:(id)a3;
- (void)setDdmPersistedErrorDescription:(id)a3;
- (void)setFailedPatchDescriptors:(id)a3;
- (void)setInstallPolicy:(id)a3;
- (void)setLastAssetAudience:(id)a3;
- (void)setLastAutoDownloadDate:(id)a3;
- (void)setLastAutoInstallOperationModel:(id)a3;
- (void)setLastDeletedSUAssetID:(id)a3;
- (void)setLastDownload:(id)a3;
- (void)setLastProductBuild:(id)a3;
- (void)setLastProductType:(id)a3;
- (void)setLastProductVersion:(id)a3;
- (void)setLastRecommendedUpdateDiscoveryDate:(id)a3;
- (void)setLastRecommendedUpdateInterval:(id)a3;
- (void)setLastRecommendedUpdateVersion:(id)a3;
- (void)setLastReleaseType:(id)a3;
- (void)setLastRollbackDescriptor:(id)a3;
- (void)setLastRollbackRecommendedBuildVersion:(id)a3;
- (void)setLastScanDate:(id)a3;
- (void)setLastScannedDescriptorScanOptions:(id)a3;
- (void)setLastSentOTAPostponedDate:(id)a3;
- (void)setLastSplatRestoreVersion:(id)a3;
- (void)setMandatoryUpdateDict:(id)a3;
- (void)setMdmDelay:(id)a3;
- (void)setPreferredLastScannedCoreDescriptor:(id)a3;
- (void)setScheduledAutoDownloadPolicyChangeTime:(id)a3;
- (void)setScheduledAutoDownloadWifiPeriodEndTime:(id)a3;
- (void)setScheduledManualDownloadWifiPeriodEndTime:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setStashbagPersisted:(BOOL)a3;
- (void)setUnderExclusiveControl:(BOOL)a3;
- (void)setUnlockCallbacks:(id)a3;
- (void)setUpdateDiscoveryDates:(id)a3;
- (void)setUpdateFullyUnrampedDates:(id)a3;
@end

@implementation SUState

+ (id)statePath
{
  v2 = +[SUUtility systemContainerURL];
  v3 = v2;
  if (v2)
  {
    v4 = NSString;
    v14 = [v2 path];
    v5 = [v4 stringWithFormat:@"%@%@"];

    if (!v5) {
      SULogInfo(@"Failed to create state file path", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v14);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SUState)init
{
  return (SUState *)[(SUState *)self initForTesting:0];
}

- (id)initForTesting:(BOOL)a3
{
  v53.receiver = self;
  v53.super_class = (Class)SUState;
  v4 = [(SUState *)&v53 init];
  v5 = v4;
  if (v4)
  {
    lastDownload = v4->_lastDownload;
    v4->_lastDownload = 0;

    lastScannedDescriptorScanOptions = v5->_lastScannedDescriptorScanOptions;
    v5->_lastScannedDescriptorScanOptions = 0;

    failedPatchDescriptors = v5->_failedPatchDescriptors;
    v5->_failedPatchDescriptors = 0;

    scheduledManualDownloadWifiPeriodEndTime = v5->_scheduledManualDownloadWifiPeriodEndTime;
    v5->_scheduledManualDownloadWifiPeriodEndTime = 0;

    scheduledAutoDownloadPolicyChangeTime = v5->_scheduledAutoDownloadPolicyChangeTime;
    v5->_scheduledAutoDownloadPolicyChangeTime = 0;

    lastScanDate = v5->_lastScanDate;
    v5->_lastScanDate = 0;

    lastAutoDownloadDate = v5->_lastAutoDownloadDate;
    v5->_lastAutoDownloadDate = 0;

    scheduledAutoDownloadWifiPeriodEndTime = v5->_scheduledAutoDownloadWifiPeriodEndTime;
    v5->_scheduledAutoDownloadWifiPeriodEndTime = 0;

    *(_WORD *)&v5->_autoDownloadNeedsOneTimeRetry = 0;
    lastProductVersion = v5->_lastProductVersion;
    v5->_lastProductVersion = 0;

    lastProductBuild = v5->_lastProductBuild;
    v5->_lastProductBuild = 0;

    lastProductType = v5->_lastProductType;
    v5->_lastProductType = 0;

    lastReleaseType = v5->_lastReleaseType;
    v5->_lastReleaseType = 0;

    unlockCallbacks = v5->_unlockCallbacks;
    v5->_unlockCallbacks = 0;

    lastAutoInstallOperationModel = v5->_lastAutoInstallOperationModel;
    v5->_lastAutoInstallOperationModel = 0;

    mdmDelay = v5->_mdmDelay;
    v5->_mdmDelay = 0;

    installPolicy = v5->_installPolicy;
    v5->_installPolicy = 0;

    mandatoryUpdateDict = v5->_mandatoryUpdateDict;
    v5->_mandatoryUpdateDict = 0;

    rolledBackBuildVersions = v5->_rolledBackBuildVersions;
    v5->_rolledBackBuildVersions = 0;

    lastRollbackRecommendedBuildVersion = v5->_lastRollbackRecommendedBuildVersion;
    v5->_lastRollbackRecommendedBuildVersion = 0;

    sessionID = v5->_sessionID;
    v5->_sessionID = 0;

    lastDeletedSUAssetID = v5->_lastDeletedSUAssetID;
    v5->_lastDeletedSUAssetID = 0;

    lastAssetAudience = v5->_lastAssetAudience;
    v5->_lastAssetAudience = 0;

    appliedTime = v5->_appliedTime;
    v5->_appliedTime = 0;

    updateDiscoveryDates = v5->_updateDiscoveryDates;
    v5->_updateDiscoveryDates = 0;

    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v31 = dispatch_queue_create("com.apple.softwareupdateservicesd.stateQueue", v30);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v31;

    v5->_testing = a3;
    if (a3)
    {
      v40 = @"/tmp/softwareupdateservicesd.plist";
    }
    else
    {
      v40 = +[SUState statePath];
    }
    SULogInfo(@"[SUState] (%s) testing: %@, path: %@", v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[SUState initForTesting:]");
    uint64_t v41 = [objc_alloc(MEMORY[0x263F77E00]) initWithDispatchQueue:v5->_stateQueue withPersistencePath:v40 forPolicyVersion:@"1.0"];
    persistedState = v5->_persistedState;
    v5->_persistedState = (SUCorePersistedState *)v41;

    preferredLastScannedCoreDescriptor = v5->_preferredLastScannedCoreDescriptor;
    v5->_preferredLastScannedCoreDescriptor = 0;

    alternateLastScannedCoreDescriptor = v5->_alternateLastScannedCoreDescriptor;
    v5->_alternateLastScannedCoreDescriptor = 0;

    ddmPersistedError = v5->_ddmPersistedError;
    v5->_ddmPersistedError = 0;

    v5->_underExclusiveControl = 0;
    lastSplatRestoreVersion = v5->_lastSplatRestoreVersion;
    v5->_lastSplatRestoreVersion = 0;

    lastRollbackDescriptor = v5->_lastRollbackDescriptor;
    v5->_lastRollbackDescriptor = 0;

    lastRecommendedUpdateVersion = v5->_lastRecommendedUpdateVersion;
    v5->_lastRecommendedUpdateVersion = 0;

    v49 = v5->_lastRecommendedUpdateVersion;
    v5->_lastRecommendedUpdateVersion = 0;

    lastRecommendedUpdateDiscoveryDate = v5->_lastRecommendedUpdateDiscoveryDate;
    v5->_lastRecommendedUpdateDiscoveryDate = 0;

    lastSentOTAPostponedDate = v5->_lastSentOTAPostponedDate;
    v5->_lastSentOTAPostponedDate = 0;

    [(SUState *)v5 load];
  }
  return v5;
}

+ (id)currentState
{
  if (currentState_pred != -1) {
    dispatch_once(&currentState_pred, &__block_literal_global_8);
  }
  v2 = (void *)currentState___instance;
  return v2;
}

uint64_t __23__SUState_currentState__block_invoke()
{
  currentState___instance = objc_alloc_init(SUState);
  return MEMORY[0x270F9A758]();
}

- (void)resetDownloadAndScanHistory
{
  [(SUState *)self setFailedPatchDescriptors:0];
  [(SUState *)self setScheduledManualDownloadWifiPeriodEndTime:0];
  [(SUState *)self setScheduledAutoDownloadWifiPeriodEndTime:0];
  [(SUState *)self setScheduledAutoDownloadPolicyChangeTime:0];
  [(SUState *)self setLastScanDate:0];
  [(SUState *)self setLastAutoDownloadDate:0];
  [(SUState *)self setAutoDownloadNeedsOneTimeRetry:0];
  [(SUState *)self setStashbagPersisted:0];
  [(SUState *)self setLastDownload:0];
  [(SUState *)self setLastAutoInstallOperationModel:0];
  [(SUState *)self setUnlockCallbacks:0];
  [(SUState *)self setMdmDelay:0];
  [(SUState *)self setInstallPolicy:0];
  [(SUState *)self setMandatoryUpdateDict:0];
  [(SUState *)self setLastDeletedSUAssetID:0];
  [(SUState *)self setLastAssetAudience:0];
  [(SUState *)self setUpdateDiscoveryDates:0];
  [(SUState *)self setUpdateFullyUnrampedDates:0];
  [(SUState *)self setLastRecommendedUpdateVersion:0];
  [(SUState *)self setLastRecommendedUpdateInterval:0];
  [(SUState *)self setLastRecommendedUpdateDiscoveryDate:0];
  [(SUState *)self setLastSentOTAPostponedDate:0];
  [(SUState *)self setDdmPersistedError:0];
  [(SUState *)self setPreferredLastScannedCoreDescriptor:0];
  [(SUState *)self setAlternateLastScannedCoreDescriptor:0];
}

- (void)resetAllHistory
{
  [(SUState *)self resetDownloadAndScanHistory];
  [(SUState *)self setLastProductVersion:0];
  [(SUState *)self setLastProductBuild:0];
  [(SUState *)self setLastProductType:0];
  [(SUState *)self setLastReleaseType:0];
  [(SUState *)self setSessionID:0];
  [(SUState *)self setAppliedTime:0];
  [(SUState *)self setLastRollbackDescriptor:0];
}

- (id)_stateAsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setSafeObject:self->_lastDownload forKey:@"SULastDownload"];
  [v3 setSafeObject:self->_failedPatchDescriptors forKey:@"SUFailedPatchDescriptorsKey"];
  [v3 setSafeObject:self->_scheduledManualDownloadWifiPeriodEndTime forKey:@"SUManualDownloadWifiPeriodEndTime"];
  [v3 setSafeObject:self->_scheduledAutoDownloadWifiPeriodEndTime forKey:@"SUAutoDownloadWifiPeriodEndTime"];
  [v3 setSafeObject:self->_scheduledAutoDownloadPolicyChangeTime forKey:@"SUAutoDownloadPolicyChangeTime"];
  [v3 setSafeObject:self->_lastScanDate forKey:@"SULastScanDate"];
  [v3 setSafeObject:self->_lastAutoDownloadDate forKey:@"SULastAutoDownloadDate"];
  v4 = [NSNumber numberWithBool:self->_autoDownloadNeedsOneTimeRetry];
  [v3 setSafeObject:v4 forKey:@"SUAutoDownloadNeedsOneTimeRetry"];

  v5 = [NSNumber numberWithBool:self->_stashbagPersisted];
  [v3 setSafeObject:v5 forKey:@"SUStashbagIsPersisted"];

  [v3 setSafeObject:self->_lastProductVersion forKey:@"SULastProductVersionKey"];
  [v3 setSafeObject:self->_lastProductBuild forKey:@"SULastProductBuildKey"];
  [v3 setSafeObject:self->_lastProductType forKey:@"SULastProductTypeKey"];
  [v3 setSafeObject:self->_lastReleaseType forKey:@"SULastReleaseTypeKey"];
  [v3 setSafeObject:self->_unlockCallbacks forKey:@"SUUnlockCallbacksKey"];
  [v3 setSafeObject:self->_lastAutoInstallOperationModel forKey:@"SULastAutoInstallOperationModel"];
  [v3 setSafeObject:self->_mdmDelay forKey:@"SUManagedDeviceDelay"];
  [v3 setSafeObject:self->_installPolicy forKey:@"SUInstallPolicy"];
  [v3 setSafeObject:self->_mandatoryUpdateDict forKey:@"SUMandatorUpdateDict"];
  [v3 setSafeObject:self->_lastRollbackRecommendedBuildVersion forKey:@"LastRollbackRecommendationBuildVersion"];
  [v3 setSafeObject:self->_rolledBackBuildVersions forKey:@"SURolledBackBuildVersions"];
  [v3 setSafeObject:self->_sessionID forKey:@"SUSessionID"];
  [v3 setSafeObject:self->_lastDeletedSUAssetID forKey:@"SULastDeletedSUAssetID"];
  [v3 setSafeObject:self->_lastAssetAudience forKey:@"SULastAssetAudience"];
  [v3 setSafeObject:self->_appliedTime forKey:@"SUAppliedTime"];
  [v3 setSafeObject:self->_updateDiscoveryDates forKey:@"SUDiscoveryDates"];
  [v3 setSafeObject:self->_updateFullyUnrampedDates forKey:@"SUFullyUnrampedDates"];
  [v3 setSafeObject:self->_ddmPersistedError forKey:@"SUDDMPersistedError"];
  [v3 setSafeObject:self->_preferredLastScannedCoreDescriptor forKey:@"SUPreferredLastScannedCoreDescriptor"];
  [v3 setSafeObject:self->_alternateLastScannedCoreDescriptor forKey:@"SUAlternateLastScannedCoreDescriptor"];
  uint64_t v6 = [NSNumber numberWithBool:self->_underExclusiveControl];
  [v3 setSafeObject:v6 forKey:@"SUUnderExclusiveControl"];

  [v3 setSafeObject:self->_lastSplatRestoreVersion forKey:@"SULastSplatRestoreVersion"];
  [v3 setSafeObject:self->_lastRollbackDescriptor forKey:@"SULastRollbackDescriptor"];
  [v3 setSafeObject:self->_lastRecommendedUpdateVersion forKey:@"LastRecommendedUpdateVersion"];
  [v3 setSafeObject:self->_lastRecommendedUpdateInterval forKey:@"LastRecommendedUpdateInterval"];
  [v3 setSafeObject:self->_lastRecommendedUpdateDiscoveryDate forKey:@"LastRecommendedUpdateDiscoveryDate"];
  [v3 setSafeObject:self->_lastSentOTAPostponedDate forKey:@"LastSentOTAPostponedDate"];
  return v3;
}

- (void)load
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __15__SUState_load__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __15__SUState_load__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 312) loadPersistedState];
  v2 = (void *)MEMORY[0x263F77D80];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 312) persistedPolicyVersion];
  LOBYTE(v2) = [v2 stringIsEqual:v3 to:@"1.0"];

  if ((v2 & 1) == 0)
  {
    SULogInfo(@"Persisted state policy version does not match current policy, removing persisted state.", v4, v5, v6, v7, v8, v9, v10, v74);
    [*(id *)(*(void *)(a1 + 32) + 312) removePersistedState];
    [*(id *)(*(void *)(a1 + 32) + 312) loadPersistedState];
  }
  uint64_t v11 = *(id **)(a1 + 32);
  uint64_t v12 = [v11[39] secureCodedObjectForKey:@"SULastDownload" ofClass:objc_opt_class()];
  [v11 setLastDownload:v12];

  v13 = *(id **)(a1 + 32);
  v14 = [v13[39] dateForKey:@"SUManualDownloadWifiPeriodEndTime"];
  [v13 setScheduledManualDownloadWifiPeriodEndTime:v14];

  v15 = *(id **)(a1 + 32);
  v16 = [v15[39] dateForKey:@"SUAutoDownloadWifiPeriodEndTime"];
  [v15 setScheduledAutoDownloadWifiPeriodEndTime:v16];

  v17 = *(id **)(a1 + 32);
  v18 = [v17[39] dateForKey:@"SUAutoDownloadPolicyChangeTime"];
  [v17 setScheduledAutoDownloadPolicyChangeTime:v18];

  v19 = *(id **)(a1 + 32);
  v20 = [v19[39] dateForKey:@"SULastScanDate"];
  [v19 setLastScanDate:v20];

  v21 = *(id **)(a1 + 32);
  v22 = [v21[39] dateForKey:@"SULastAutoDownloadDate"];
  [v21 setLastAutoDownloadDate:v22];

  objc_msgSend(*(id *)(a1 + 32), "setAutoDownloadNeedsOneTimeRetry:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "BOOLeanForKey:", @"SUAutoDownloadNeedsOneTimeRetry"));
  objc_msgSend(*(id *)(a1 + 32), "setStashbagPersisted:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "BOOLeanForKey:", @"SUStashbagIsPersisted"));
  v23 = *(id **)(a1 + 32);
  v24 = [v23[39] stringForKey:@"SULastProductVersionKey"];
  [v23 setLastProductVersion:v24];

  v25 = *(id **)(a1 + 32);
  v26 = [v25[39] stringForKey:@"SULastProductBuildKey"];
  [v25 setLastProductBuild:v26];

  v27 = *(id **)(a1 + 32);
  v28 = [v27[39] stringForKey:@"SULastProductTypeKey"];
  [v27 setLastProductType:v28];

  v29 = *(id **)(a1 + 32);
  v30 = [v29[39] stringForKey:@"SULastReleaseTypeKey"];
  [v29 setLastReleaseType:v30];

  dispatch_queue_t v31 = *(id **)(a1 + 32);
  v32 = [v31[39] dictionaryForKey:@"SUUnlockCallbacksKey"];
  [v31 setUnlockCallbacks:v32];

  uint64_t v33 = *(id **)(a1 + 32);
  uint64_t v34 = [v33[39] secureCodedObjectForKey:@"SULastAutoInstallOperationModel" ofClass:objc_opt_class()];
  [v33 setLastAutoInstallOperationModel:v34];

  uint64_t v35 = *(id **)(a1 + 32);
  uint64_t v36 = [v35[39] secureCodedObjectForKey:@"SUManagedDeviceDelay" ofClass:objc_opt_class()];
  [v35 setMdmDelay:v36];

  uint64_t v37 = *(id **)(a1 + 32);
  uint64_t v38 = [v37[39] secureCodedObjectForKey:@"SUInstallPolicy" ofClass:objc_opt_class()];
  [v37 setInstallPolicy:v38];

  uint64_t v39 = *(id **)(a1 + 32);
  v40 = [v39[39] dictionaryForKey:@"SUMandatorUpdateDict"];
  [v39 setMandatoryUpdateDict:v40];

  uint64_t v41 = *(id **)(a1 + 32);
  v42 = [v41[39] stringForKey:@"LastRollbackRecommendationBuildVersion"];
  [v41 setLastRollbackRecommendedBuildVersion:v42];

  [*(id *)(a1 + 32) loadRolledBackBuildVersions];
  v43 = *(id **)(a1 + 32);
  v44 = [v43[39] stringForKey:@"SUSessionID"];
  [v43 setSessionID:v44];

  v45 = *(id **)(a1 + 32);
  v46 = [v45[39] stringForKey:@"SULastDeletedSUAssetID"];
  [v45 setLastDeletedSUAssetID:v46];

  v47 = *(id **)(a1 + 32);
  v48 = [v47[39] stringForKey:@"SULastAssetAudience"];
  [v47 setLastAssetAudience:v48];

  v49 = *(id **)(a1 + 32);
  v50 = [v49[39] dateForKey:@"SUAppliedTime"];
  [v49 setAppliedTime:v50];

  [*(id *)(a1 + 32) loadPersistedFailedPatchDescriptors];
  v51 = *(id **)(a1 + 32);
  v52 = [v51[39] dictionaryForKey:@"SUDiscoveryDates"];
  [v51 setUpdateDiscoveryDates:v52];

  objc_super v53 = *(id **)(a1 + 32);
  v54 = [v53[39] dictionaryForKey:@"SUFullyUnrampedDates"];
  [v53 setUpdateFullyUnrampedDates:v54];

  v55 = *(id **)(a1 + 32);
  v56 = [v55[39] dictionaryForKey:@"SUDDMPersistedError"];
  [v55 setDdmPersistedError:v56];

  v57 = *(id **)(a1 + 32);
  v58 = [v57[39] secureCodedObjectForKey:@"SUPreferredLastScannedCoreDescriptor" ofClass:objc_opt_class()];
  [v57 setPreferredLastScannedCoreDescriptor:v58];

  v59 = *(id **)(a1 + 32);
  v60 = [v59[39] secureCodedObjectForKey:@"SUAlternateLastScannedCoreDescriptor" ofClass:objc_opt_class()];
  [v59 setAlternateLastScannedCoreDescriptor:v60];

  v61 = *(id **)(a1 + 32);
  v62 = [v61[39] secureCodedObjectForKey:@"SULastScannedDescriptorScanOptionsKey" ofClass:objc_opt_class()];
  [v61 setLastScannedDescriptorScanOptions:v62];

  objc_msgSend(*(id *)(a1 + 32), "setUnderExclusiveControl:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "BOOLeanForKey:", @"SUUnderExclusiveControl"));
  v63 = *(id **)(a1 + 32);
  v64 = [v63[39] stringForKey:@"SULastSplatRestoreVersion"];
  [v63 setLastSplatRestoreVersion:v64];

  v65 = *(id **)(a1 + 32);
  v66 = [v65[39] secureCodedObjectForKey:@"SULastRollbackDescriptor" ofClass:objc_opt_class()];
  [v65 setLastRollbackDescriptor:v66];

  v67 = *(id **)(a1 + 32);
  v68 = [v67[39] stringForKey:@"LastRecommendedUpdateVersion"];
  [v67 setLastRecommendedUpdateVersion:v68];

  v69 = *(id **)(a1 + 32);
  v70 = [v69[39] secureCodedObjectForKey:@"LastRecommendedUpdateInterval" ofClass:objc_opt_class()];
  [v69 setLastRecommendedUpdateInterval:v70];

  v71 = *(id **)(a1 + 32);
  v72 = [v71[39] dateForKey:@"LastRecommendedUpdateDiscoveryDate"];
  [v71 setLastRecommendedUpdateDiscoveryDate:v72];

  v73 = *(id **)(a1 + 32);
  id v75 = [v73[39] dateForKey:@"LastSentOTAPostponedDate"];
  [v73 setLastSentOTAPostponedDate:v75];
}

- (void)save
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __15__SUState_save__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

void __15__SUState_save__block_invoke(uint64_t a1)
{
  if (+[SUUtility isDaemon])
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 304))
    {
      uint64_t v9 = @"/tmp/softwareupdateservicesd.plist";
    }
    else
    {
      uint64_t v9 = +[SUState statePath];
    }
    v32 = v9;
    SULogInfo(@"[SUState] (%s) testing: %@, path: %@", v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUState save]_block_invoke");
    if (v32)
    {
      v17 = [(__CFString *)v32 stringByDeletingLastPathComponent];
      v18 = [MEMORY[0x263F08850] defaultManager];
      char v19 = [v18 fileExistsAtPath:v17];
      v20 = (uint64_t *)MEMORY[0x263F08078];
      if ((v19 & 1) == 0)
      {
        uint64_t v31 = *MEMORY[0x263F08078];
        v21 = [NSDictionary dictionaryWithObjectsAndKeys:&unk_26CEBD000];
        [v18 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:v21 error:0];
      }
      char v22 = [v18 fileExistsAtPath:v32];
      [*(id *)(*(void *)(a1 + 32) + 312) persistSecureCodedObject:*(void *)(*(void *)(a1 + 32) + 8) forKey:@"SULastDownload" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistSecureCodedObject:*(void *)(*(void *)(a1 + 32) + 240) forKey:@"SUPreferredLastScannedCoreDescriptor" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistSecureCodedObject:*(void *)(*(void *)(a1 + 32) + 248) forKey:@"SUAlternateLastScannedCoreDescriptor" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistSecureCodedObject:*(void *)(*(void *)(a1 + 32) + 24) forKey:@"SULastScannedDescriptorScanOptionsKey" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDate:*(void *)(*(void *)(a1 + 32) + 32) forKey:@"SUManualDownloadWifiPeriodEndTime" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDate:*(void *)(*(void *)(a1 + 32) + 40) forKey:@"SUAutoDownloadWifiPeriodEndTime" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDate:*(void *)(*(void *)(a1 + 32) + 48) forKey:@"SUAutoDownloadPolicyChangeTime" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDate:*(void *)(*(void *)(a1 + 32) + 56) forKey:@"SULastScanDate" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDate:*(void *)(*(void *)(a1 + 32) + 64) forKey:@"SULastAutoDownloadDate" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistBoolean:*(unsigned __int8 *)(*(void *)(a1 + 32) + 72) forKey:@"SUAutoDownloadNeedsOneTimeRetry" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistBoolean:*(unsigned __int8 *)(*(void *)(a1 + 32) + 73) forKey:@"SUStashbagIsPersisted" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistString:*(void *)(*(void *)(a1 + 32) + 80) forKey:@"SULastProductVersionKey" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistString:*(void *)(*(void *)(a1 + 32) + 88) forKey:@"SULastProductBuildKey" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistString:*(void *)(*(void *)(a1 + 32) + 96) forKey:@"SULastProductTypeKey" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistString:*(void *)(*(void *)(a1 + 32) + 104) forKey:@"SULastReleaseTypeKey" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDictionary:*(void *)(*(void *)(a1 + 32) + 120) forKey:@"SUUnlockCallbacksKey" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistSecureCodedObject:*(void *)(*(void *)(a1 + 32) + 152) forKey:@"SULastAutoInstallOperationModel" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistSecureCodedObject:*(void *)(*(void *)(a1 + 32) + 160) forKey:@"SUManagedDeviceDelay" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistSecureCodedObject:*(void *)(*(void *)(a1 + 32) + 168) forKey:@"SUInstallPolicy" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDictionary:*(void *)(*(void *)(a1 + 32) + 128) forKey:@"SUMandatorUpdateDict" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistString:*(void *)(*(void *)(a1 + 32) + 144) forKey:@"LastRollbackRecommendationBuildVersion" shouldPersist:0];
      [*(id *)(a1 + 32) persistRolledBackBuildVersions];
      [*(id *)(*(void *)(a1 + 32) + 312) persistString:*(void *)(*(void *)(a1 + 32) + 176) forKey:@"SUSessionID" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistString:*(void *)(*(void *)(a1 + 32) + 184) forKey:@"SULastDeletedSUAssetID" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistString:*(void *)(*(void *)(a1 + 32) + 192) forKey:@"SULastAssetAudience" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDate:*(void *)(*(void *)(a1 + 32) + 200) forKey:@"SUAppliedTime" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistBoolean:*(unsigned __int8 *)(*(void *)(a1 + 32) + 320) forKey:@"SUUnderExclusiveControl" shouldPersist:0];
      [*(id *)(a1 + 32) persistFailedPatchDescriptors];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDictionary:*(void *)(*(void *)(a1 + 32) + 216) forKey:@"SUDiscoveryDates" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDictionary:*(void *)(*(void *)(a1 + 32) + 224) forKey:@"SUFullyUnrampedDates" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistString:*(void *)(*(void *)(a1 + 32) + 112) forKey:@"SULastSplatRestoreVersion" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistSecureCodedObject:*(void *)(*(void *)(a1 + 32) + 232) forKey:@"SULastRollbackDescriptor" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistString:*(void *)(*(void *)(a1 + 32) + 272) forKey:@"LastRecommendedUpdateVersion" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistSecureCodedObject:*(void *)(*(void *)(a1 + 32) + 280) forKey:@"LastRecommendedUpdateInterval" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDate:*(void *)(*(void *)(a1 + 32) + 288) forKey:@"LastRecommendedUpdateDiscoveryDate" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDictionary:*(void *)(*(void *)(a1 + 32) + 264) forKey:@"SUDDMPersistedError" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistDate:*(void *)(*(void *)(a1 + 32) + 296) forKey:@"LastSentOTAPostponedDate" shouldPersist:0];
      [*(id *)(*(void *)(a1 + 32) + 312) persistState];
      if ((v22 & 1) == 0)
      {
        uint64_t v31 = *v20;
        v30 = [NSDictionary dictionaryWithObjectsAndKeys:&unk_26CEBD000];
        [v18 setAttributes:v30 ofItemAtPath:v32 error:0];
      }
      SULogDebug(@"Saved software update state", v23, v24, v25, v26, v27, v28, v29, v31);
    }
    else
    {
      SULogInfo(@"Unable to retrieve state file path", v10, v11, v12, v13, v14, v15, v16, v31);
    }
  }
}

- (void)persistFailedPatchDescriptors
{
  v12[2] = *MEMORY[0x263EF8340];
  v12[0] = @"SUFailedPatchDescriptorOneKey";
  v12[1] = @"SUFailedPatchDescriptorTwoKey";
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  failedPatchDescriptors = self->_failedPatchDescriptors;
  if (failedPatchDescriptors)
  {
    if ([(NSArray *)failedPatchDescriptors count])
    {
      unint64_t v5 = 0;
      do
      {
        if ([v3 count] <= v5) {
          break;
        }
        persistedState = self->_persistedState;
        uint64_t v7 = [(NSArray *)self->_failedPatchDescriptors objectAtIndexedSubscript:v5];
        uint64_t v8 = [v3 objectAtIndexedSubscript:v5];
        [(SUCorePersistedState *)persistedState persistSecureCodedObject:v7 forKey:v8 shouldPersist:0];

        ++v5;
      }
      while ([(NSArray *)self->_failedPatchDescriptors count] > v5);
    }
  }
  else if ([v3 count])
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = self->_persistedState;
      uint64_t v11 = [v3 objectAtIndexedSubscript:v9];
      [(SUCorePersistedState *)v10 persistSecureCodedObject:0 forKey:v11 shouldPersist:0];

      ++v9;
    }
    while ([v3 count] > v9);
  }
}

- (void)loadPersistedFailedPatchDescriptors
{
  v21[2] = *MEMORY[0x263EF8340];
  v21[0] = @"SUFailedPatchDescriptorOneKey";
  v21[1] = @"SUFailedPatchDescriptorTwoKey";
  [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(SUCorePersistedState *)self->_persistedState secureCodedObjectForKey:*(void *)(*((void *)&v16 + 1) + 8 * v7) ofClass:objc_opt_class()];
        [(SUState *)self _queue_addFailedPatchDescriptor:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  SULogInfo(@"Loaded failed patch descriptors: %@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)self->_failedPatchDescriptors);
}

- (void)persistRolledBackBuildVersions
{
  v8[5] = *MEMORY[0x263EF8340];
  v8[0] = @"RolledBackBuildVersionsOne";
  v8[1] = @"RolledBackBuildVersionsTwo";
  v8[2] = @"RolledBackBuildVersionsThree";
  v8[3] = @"RolledBackBuildVersionsFour";
  v8[4] = @"RolledBackBuildVersionsFive";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:5];
  if ([(NSMutableArray *)self->_rolledBackBuildVersions count])
  {
    unint64_t v4 = 0;
    do
    {
      if ([v3 count] <= v4) {
        break;
      }
      persistedState = self->_persistedState;
      uint64_t v6 = [(NSMutableArray *)self->_rolledBackBuildVersions objectAtIndexedSubscript:v4];
      uint64_t v7 = [v3 objectAtIndexedSubscript:v4];
      [(SUCorePersistedState *)persistedState persistString:v6 forKey:v7 shouldPersist:0];

      ++v4;
    }
    while ([(NSMutableArray *)self->_rolledBackBuildVersions count] > v4);
  }
}

- (void)loadRolledBackBuildVersions
{
  v23[5] = *MEMORY[0x263EF8340];
  if (!self->_rolledBackBuildVersions)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    rolledBackBuildVersions = self->_rolledBackBuildVersions;
    self->_rolledBackBuildVersions = v3;
  }
  v23[0] = @"RolledBackBuildVersionsOne";
  v23[1] = @"RolledBackBuildVersionsTwo";
  v23[2] = @"RolledBackBuildVersionsThree";
  v23[3] = @"RolledBackBuildVersionsFour";
  v23[4] = @"RolledBackBuildVersionsFive";
  [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(SUCorePersistedState *)self->_persistedState stringForKey:*(void *)(*((void *)&v18 + 1) + 8 * v9)];
        [(SUState *)self queue_addRolledBackBuildVersion:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  SULogInfo(@"Loaded rolled back build versions: %@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)self->_rolledBackBuildVersions);
}

- (NSString)description
{
  id v3 = NSString;
  unint64_t v4 = [(SUState *)self preferredLastScannedCoreDescriptor];
  objc_super v53 = [v3 stringWithFormat:@"%@", v4];

  id v5 = NSString;
  uint64_t v6 = [(SUState *)self alternateLastScannedCoreDescriptor];
  v54 = [v5 stringWithFormat:@"%@", v6];

  uint64_t v33 = NSString;
  v51 = [(SUState *)self lastDownload];
  v52 = [(SUState *)self failedPatchDescriptors];
  uint64_t v7 = (void *)MEMORY[0x263F08790];
  uint64_t v39 = [(SUState *)self scheduledManualDownloadWifiPeriodEndTime];
  v50 = [v7 localizedStringFromDate:v39 dateStyle:1 timeStyle:1];
  uint64_t v8 = (void *)MEMORY[0x263F08790];
  uint64_t v38 = [(SUState *)self scheduledAutoDownloadWifiPeriodEndTime];
  v48 = [v8 localizedStringFromDate:v38 dateStyle:1 timeStyle:1];
  uint64_t v9 = (void *)MEMORY[0x263F08790];
  uint64_t v37 = [(SUState *)self scheduledAutoDownloadPolicyChangeTime];
  v49 = [v9 localizedStringFromDate:v37 dateStyle:1 timeStyle:1];
  uint64_t v10 = (void *)MEMORY[0x263F08790];
  uint64_t v36 = [(SUState *)self lastScanDate];
  v47 = [v10 localizedStringFromDate:v36 dateStyle:1 timeStyle:1];
  uint64_t v11 = (void *)MEMORY[0x263F08790];
  uint64_t v35 = [(SUState *)self lastAutoDownloadDate];
  v46 = [v11 localizedStringFromDate:v35 dateStyle:1 timeStyle:1];
  if ([(SUState *)self autoDownloadNeedsOneTimeRetry]) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  v32 = v12;
  if ([(SUState *)self stashbagPersisted]) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  uint64_t v31 = v13;
  v45 = [(SUState *)self lastProductVersion];
  v44 = [(SUState *)self lastProductBuild];
  v43 = [(SUState *)self lastProductType];
  v42 = [(SUState *)self lastReleaseType];
  uint64_t v41 = [(SUState *)self lastSplatRestoreVersion];
  v30 = [(SUState *)self lastAutoInstallOperationModel];
  v40 = [(SUState *)self mdmDelay];
  uint64_t v29 = [(SUState *)self installPolicy];
  uint64_t v27 = [(SUState *)self mandatoryUpdateDict];
  uint64_t v26 = [(SUState *)self lastRollbackRecommendedBuildVersion];
  uint64_t v14 = [(SUState *)self rolledBackBuildVersions];
  uint64_t v15 = [(SUState *)self sessionID];
  uint64_t v25 = [(SUState *)self lastDeletedSUAssetID];
  uint64_t v16 = [(SUState *)self lastAssetAudience];
  uint64_t v17 = (void *)MEMORY[0x263F08790];
  uint64_t v28 = [(SUState *)self appliedTime];
  long long v18 = [v17 localizedStringFromDate:v28 dateStyle:1 timeStyle:1];
  if ([(SUState *)self underExclusiveControl]) {
    long long v19 = @"YES";
  }
  else {
    long long v19 = @"NO";
  }
  long long v20 = [(SUState *)self lastRecommendedUpdateVersion];
  long long v21 = [(SUState *)self lastRecommendedUpdateInterval];
  char v22 = [(SUState *)self lastRecommendedUpdateDiscoveryDate];
  uint64_t v23 = [(SUState *)self updateDiscoveryDates];
  objc_msgSend(v33, "stringWithFormat:", @"LastDownload: %@            \npreferredLastScannedCoreDescriptor: %@            \nalternateLastScannedCoreDescriptor: %@            \nFailedPatchDescriptors: %@            \nScheduledManualDownloadWifiPeriodEndTime: %@            \nScheduledAutoDownloadWifiPeriodEndTime: %@            \nScheduledAutoDownloadPolicyChangeTime: %@            \nLastScanDate: %@            \nLastAutoDownloadDate: %@            \nNeedsOneTimeAutoDownloadRetry: %@            \nStashbagIsPersisted: %@            \nLastProductVersion: %@            \nLastProductBuild: %@            \nLastProductType: %@            \nLastReleaseType: %@            \nLastSplatRestoreVersion: %@            \nLastAutoInstallOperationModel: %@            \nManagedDeviceDelay: %@            \nInstallPolicy: %@            \nMandatoryUpdateDict: %@            \nLastRollbackRecommendedBuildVersion: %@            \rolledBackBuildVersions: %@            \nsessionID: %@            \nlastDeletedAssetID: %@            \nlastAssetAudience: %@            \nappliedSate: %@            \nunderExclusiveControl: %@            \nLastRecommendedUpdateVersion: %@            \nLastRecommendedUpdateInterval: %@            \nLastRecommendedUpdateDiscoveryDate: %@            \nUpdateDiscoveryDates: %@", v51, v53, v54, v52, v50, v48, v49, v47, v46, v32, v31, v45, v44, v43, v42, v41,
    v30,
    v40,
    v29,
    v27,
    v26,
    v14,
    v15,
    v25,
    v16,
    v18,
    v19,
    v20,
    v21,
    v22,
  uint64_t v34 = v23);

  return (NSString *)v34;
}

- (void)setLastDownload:(id)a3
{
  unint64_t v4 = (void *)[a3 copy];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__SUState_setLastDownload___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __27__SUState_setLastDownload___block_invoke(uint64_t a1)
{
}

- (SUDownload)lastDownload
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __23__SUState_lastDownload__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUDownload *)v3;
}

void __23__SUState_lastDownload__block_invoke(uint64_t a1)
{
}

- (void)setLastRecommendedUpdateVersion:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SUState_setLastRecommendedUpdateVersion___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __43__SUState_setLastRecommendedUpdateVersion___block_invoke(uint64_t a1)
{
}

- (NSString)lastRecommendedUpdateVersion
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__SUState_lastRecommendedUpdateVersion__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __39__SUState_lastRecommendedUpdateVersion__block_invoke(uint64_t a1)
{
}

- (void)setLastRecommendedUpdateInterval:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SUState_setLastRecommendedUpdateInterval___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __44__SUState_setLastRecommendedUpdateInterval___block_invoke(uint64_t a1)
{
}

- (NSNumber)lastRecommendedUpdateInterval
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SUState_lastRecommendedUpdateInterval__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __40__SUState_lastRecommendedUpdateInterval__block_invoke(uint64_t a1)
{
}

- (void)setLastRecommendedUpdateDiscoveryDate:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SUState_setLastRecommendedUpdateDiscoveryDate___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __49__SUState_setLastRecommendedUpdateDiscoveryDate___block_invoke(uint64_t a1)
{
}

- (NSDate)lastRecommendedUpdateDiscoveryDate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__SUState_lastRecommendedUpdateDiscoveryDate__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __45__SUState_lastRecommendedUpdateDiscoveryDate__block_invoke(uint64_t a1)
{
}

- (void)setLastSentOTAPostponedDate:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SUState_setLastSentOTAPostponedDate___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __39__SUState_setLastSentOTAPostponedDate___block_invoke(uint64_t a1)
{
}

- (NSDate)lastSentOTAPostponedDate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__SUState_lastSentOTAPostponedDate__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __35__SUState_lastSentOTAPostponedDate__block_invoke(uint64_t a1)
{
}

- (void)setPreferredLastScannedCoreDescriptor:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SUState_setPreferredLastScannedCoreDescriptor___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __49__SUState_setPreferredLastScannedCoreDescriptor___block_invoke(uint64_t a1)
{
}

- (SUCoreDescriptor)preferredLastScannedCoreDescriptor
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__SUState_preferredLastScannedCoreDescriptor__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUCoreDescriptor *)v3;
}

void __45__SUState_preferredLastScannedCoreDescriptor__block_invoke(uint64_t a1)
{
}

- (void)setAlternateLastScannedCoreDescriptor:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SUState_setAlternateLastScannedCoreDescriptor___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __49__SUState_setAlternateLastScannedCoreDescriptor___block_invoke(uint64_t a1)
{
}

- (SUCoreDescriptor)alternateLastScannedCoreDescriptor
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__SUState_alternateLastScannedCoreDescriptor__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUCoreDescriptor *)v3;
}

void __45__SUState_alternateLastScannedCoreDescriptor__block_invoke(uint64_t a1)
{
}

- (void)setUpdateDiscoveryDates:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SUState_setUpdateDiscoveryDates___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __35__SUState_setUpdateDiscoveryDates___block_invoke(uint64_t a1)
{
}

- (NSDictionary)updateDiscoveryDates
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__SUState_updateDiscoveryDates__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __31__SUState_updateDiscoveryDates__block_invoke(uint64_t a1)
{
}

- (void)setUpdateFullyUnrampedDates:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SUState_setUpdateFullyUnrampedDates___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __39__SUState_setUpdateFullyUnrampedDates___block_invoke(uint64_t a1)
{
}

- (NSDictionary)updateFullyUnrampedDates
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__SUState_updateFullyUnrampedDates__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __35__SUState_updateFullyUnrampedDates__block_invoke(uint64_t a1)
{
}

- (void)setLastScannedDescriptorScanOptions:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SUState_setLastScannedDescriptorScanOptions___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __47__SUState_setLastScannedDescriptorScanOptions___block_invoke(uint64_t a1)
{
}

- (SUScanOptions)lastScannedDescriptorScanOptions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__SUState_lastScannedDescriptorScanOptions__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUScanOptions *)v3;
}

void __43__SUState_lastScannedDescriptorScanOptions__block_invoke(uint64_t a1)
{
}

- (void)addFailedPatchDescriptor:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__SUState_addFailedPatchDescriptor___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

uint64_t __36__SUState_addFailedPatchDescriptor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addFailedPatchDescriptor:", *(void *)(a1 + 40));
}

- (void)_queue_addFailedPatchDescriptor:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v4 = v7;
  if (v7)
  {
    id v5 = [MEMORY[0x263EFF980] arrayWithArray:self->_failedPatchDescriptors];
    [v5 addObject:v7];
    if ((unint64_t)[v5 count] >= 3)
    {
      do
        [v5 removeObjectAtIndex:0];
      while ((unint64_t)[v5 count] > 2);
    }
    id v6 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
    [(SUState *)self setFailedPatchDescriptors:v6];

    id v4 = v7;
  }
}

- (void)setFailedPatchDescriptors:(id)a3
{
  id v4 = (void *)[a3 copy];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SUState_setFailedPatchDescriptors___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __37__SUState_setFailedPatchDescriptors___block_invoke(uint64_t a1)
{
}

- (NSArray)failedPatchDescriptors
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__SUState_failedPatchDescriptors__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __33__SUState_failedPatchDescriptors__block_invoke(uint64_t a1)
{
}

- (void)setScheduledManualDownloadWifiPeriodEndTime:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SUState_setScheduledManualDownloadWifiPeriodEndTime___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __55__SUState_setScheduledManualDownloadWifiPeriodEndTime___block_invoke(uint64_t a1)
{
}

- (NSDate)scheduledManualDownloadWifiPeriodEndTime
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SUState_scheduledManualDownloadWifiPeriodEndTime__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __51__SUState_scheduledManualDownloadWifiPeriodEndTime__block_invoke(uint64_t a1)
{
}

- (void)setScheduledAutoDownloadWifiPeriodEndTime:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SUState_setScheduledAutoDownloadWifiPeriodEndTime___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __53__SUState_setScheduledAutoDownloadWifiPeriodEndTime___block_invoke(uint64_t a1)
{
}

- (NSDate)scheduledAutoDownloadWifiPeriodEndTime
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__SUState_scheduledAutoDownloadWifiPeriodEndTime__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __49__SUState_scheduledAutoDownloadWifiPeriodEndTime__block_invoke(uint64_t a1)
{
}

- (void)setScheduledAutoDownloadPolicyChangeTime:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SUState_setScheduledAutoDownloadPolicyChangeTime___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __52__SUState_setScheduledAutoDownloadPolicyChangeTime___block_invoke(uint64_t a1)
{
}

- (NSDate)scheduledAutoDownloadPolicyChangeTime
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SUState_scheduledAutoDownloadPolicyChangeTime__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __48__SUState_scheduledAutoDownloadPolicyChangeTime__block_invoke(uint64_t a1)
{
}

- (void)setLastScanDate:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__SUState_setLastScanDate___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __27__SUState_setLastScanDate___block_invoke(uint64_t a1)
{
}

- (NSDate)lastScanDate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __23__SUState_lastScanDate__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __23__SUState_lastScanDate__block_invoke(uint64_t a1)
{
}

- (void)setLastAutoDownloadDate:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SUState_setLastAutoDownloadDate___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __35__SUState_setLastAutoDownloadDate___block_invoke(uint64_t a1)
{
}

- (NSDate)lastAutoDownloadDate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__SUState_lastAutoDownloadDate__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __31__SUState_lastAutoDownloadDate__block_invoke(uint64_t a1)
{
}

- (void)setAutoDownloadNeedsOneTimeRetry:(BOOL)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SUState_setAutoDownloadNeedsOneTimeRetry___block_invoke;
  v4[3] = &unk_26447CD98;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(stateQueue, v4);
}

uint64_t __44__SUState_setAutoDownloadNeedsOneTimeRetry___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 72) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)autoDownloadNeedsOneTimeRetry
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SUState_autoDownloadNeedsOneTimeRetry__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  BOOL v3 = v7[3] != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__SUState_autoDownloadNeedsOneTimeRetry__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 72);
  return result;
}

- (void)setStashbagPersisted:(BOOL)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__SUState_setStashbagPersisted___block_invoke;
  v4[3] = &unk_26447CD98;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(stateQueue, v4);
}

uint64_t __32__SUState_setStashbagPersisted___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 73) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)stashbagPersisted
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__SUState_stashbagPersisted__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  BOOL v3 = v7[3] != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__SUState_stashbagPersisted__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 73);
  return result;
}

- (void)setLastProductVersion:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SUState_setLastProductVersion___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __33__SUState_setLastProductVersion___block_invoke(uint64_t a1)
{
}

- (NSString)lastProductVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__SUState_lastProductVersion__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __29__SUState_lastProductVersion__block_invoke(uint64_t a1)
{
}

- (void)setLastProductBuild:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__SUState_setLastProductBuild___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __31__SUState_setLastProductBuild___block_invoke(uint64_t a1)
{
}

- (NSString)lastProductBuild
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__SUState_lastProductBuild__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __27__SUState_lastProductBuild__block_invoke(uint64_t a1)
{
}

- (void)setLastProductType:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__SUState_setLastProductType___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __30__SUState_setLastProductType___block_invoke(uint64_t a1)
{
}

- (NSString)lastProductType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26__SUState_lastProductType__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __26__SUState_lastProductType__block_invoke(uint64_t a1)
{
}

- (void)setLastReleaseType:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__SUState_setLastReleaseType___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __30__SUState_setLastReleaseType___block_invoke(uint64_t a1)
{
}

- (NSString)lastReleaseType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26__SUState_lastReleaseType__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __26__SUState_lastReleaseType__block_invoke(uint64_t a1)
{
}

- (void)setUnlockCallbacks:(id)a3
{
  id v4 = [NSDictionary dictionaryWithDictionary:a3];
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__SUState_setUnlockCallbacks___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __30__SUState_setUnlockCallbacks___block_invoke(uint64_t a1)
{
}

- (NSDictionary)unlockCallbacks
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26__SUState_unlockCallbacks__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __26__SUState_unlockCallbacks__block_invoke(uint64_t a1)
{
}

- (void)setMandatoryUpdateDict:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SUState_setMandatoryUpdateDict___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __34__SUState_setMandatoryUpdateDict___block_invoke(uint64_t a1)
{
}

- (NSDictionary)mandatoryUpdateDict
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__SUState_mandatoryUpdateDict__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __30__SUState_mandatoryUpdateDict__block_invoke(uint64_t a1)
{
}

- (void)setLastRollbackRecommendedBuildVersion:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SUState_setLastRollbackRecommendedBuildVersion___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __50__SUState_setLastRollbackRecommendedBuildVersion___block_invoke(uint64_t a1)
{
}

- (NSString)lastRollbackRecommendedBuildVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__SUState_lastRollbackRecommendedBuildVersion__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __46__SUState_lastRollbackRecommendedBuildVersion__block_invoke(uint64_t a1)
{
}

- (void)addRolledBackBuildVersion:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SUState_addRolledBackBuildVersion___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

uint64_t __37__SUState_addRolledBackBuildVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_addRolledBackBuildVersion:", *(void *)(a1 + 40));
}

- (void)queue_addRolledBackBuildVersion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4 && ([(NSMutableArray *)self->_rolledBackBuildVersions containsObject:v4] & 1) == 0)
  {
    if ((unint64_t)[(NSMutableArray *)self->_rolledBackBuildVersions count] >= 5)
    {
      do
        [(NSMutableArray *)self->_rolledBackBuildVersions removeObjectAtIndex:0];
      while ((unint64_t)[(NSMutableArray *)self->_rolledBackBuildVersions count] > 4);
    }
    [(NSMutableArray *)self->_rolledBackBuildVersions addObject:v4];
  }
  MEMORY[0x270F9A758]();
}

- (NSMutableArray)rolledBackBuildVersions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SUState_rolledBackBuildVersions__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableArray *)v3;
}

void __34__SUState_rolledBackBuildVersions__block_invoke(uint64_t a1)
{
}

- (void)setLastAutoInstallOperationModel:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SUState_setLastAutoInstallOperationModel___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __44__SUState_setLastAutoInstallOperationModel___block_invoke(uint64_t a1)
{
}

- (_SUAutoInstallOperationModel)lastAutoInstallOperationModel
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SUState_lastAutoInstallOperationModel__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_SUAutoInstallOperationModel *)v3;
}

void __40__SUState_lastAutoInstallOperationModel__block_invoke(uint64_t a1)
{
}

- (void)setMdmDelay:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __23__SUState_setMdmDelay___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __23__SUState_setMdmDelay___block_invoke(uint64_t a1)
{
}

- (SUManagedDeviceUpdateDelay)mdmDelay
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __19__SUState_mdmDelay__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUManagedDeviceUpdateDelay *)v3;
}

void __19__SUState_mdmDelay__block_invoke(uint64_t a1)
{
}

- (void)setInstallPolicy:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__SUState_setInstallPolicy___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __28__SUState_setInstallPolicy___block_invoke(uint64_t a1)
{
}

- (SUInstallPolicy)installPolicy
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __24__SUState_installPolicy__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUInstallPolicy *)v3;
}

void __24__SUState_installPolicy__block_invoke(uint64_t a1)
{
}

- (void)setSessionID:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __24__SUState_setSessionID___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __24__SUState_setSessionID___block_invoke(uint64_t a1)
{
}

- (NSString)sessionID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __20__SUState_sessionID__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __20__SUState_sessionID__block_invoke(uint64_t a1)
{
}

- (void)setLastDeletedSUAssetID:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SUState_setLastDeletedSUAssetID___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __35__SUState_setLastDeletedSUAssetID___block_invoke(uint64_t a1)
{
}

- (NSString)lastDeletedSUAssetID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__SUState_lastDeletedSUAssetID__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __31__SUState_lastDeletedSUAssetID__block_invoke(uint64_t a1)
{
}

- (void)setLastAssetAudience:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__SUState_setLastAssetAudience___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __32__SUState_setLastAssetAudience___block_invoke(uint64_t a1)
{
}

- (NSString)lastAssetAudience
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__SUState_lastAssetAudience__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __28__SUState_lastAssetAudience__block_invoke(uint64_t a1)
{
}

- (void)setAppliedTime:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__SUState_setAppliedTime___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __26__SUState_setAppliedTime___block_invoke(uint64_t a1)
{
}

- (NSDate)appliedTime
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __22__SUState_appliedTime__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __22__SUState_appliedTime__block_invoke(uint64_t a1)
{
}

- (void)setUnderExclusiveControl:(BOOL)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__SUState_setUnderExclusiveControl___block_invoke;
  v4[3] = &unk_26447CD98;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(stateQueue, v4);
}

uint64_t __36__SUState_setUnderExclusiveControl___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 320) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)underExclusiveControl
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__SUState_underExclusiveControl__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SUState_underExclusiveControl__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 320);
  return result;
}

- (void)setLastSplatRestoreVersion:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SUState_setLastSplatRestoreVersion___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __38__SUState_setLastSplatRestoreVersion___block_invoke(uint64_t a1)
{
}

- (NSString)lastSplatRestoreVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SUState_lastSplatRestoreVersion__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __34__SUState_lastSplatRestoreVersion__block_invoke(uint64_t a1)
{
}

- (void)setLastRollbackDescriptor:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SUState_setLastRollbackDescriptor___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __37__SUState_setLastRollbackDescriptor___block_invoke(uint64_t a1)
{
}

- (void)setDdmPersistedError:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__SUState_setDdmPersistedError___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __32__SUState_setDdmPersistedError___block_invoke(uint64_t a1)
{
}

- (void)setDdmPersistedErrorDescription:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SUState_setDdmPersistedErrorDescription___block_invoke;
  v7[3] = &unk_26447C8C8;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __43__SUState_setDdmPersistedErrorDescription___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  id v3 = (void *)MEMORY[0x263F77D80];
  id v4 = [MEMORY[0x263EFF910] date];
  BOOL v5 = [v3 stringFromDate:v4];
  [v2 setSafeObject:v5 forKey:*MEMORY[0x263F77CD0]];

  [v2 setSafeObject:*(void *)(a1 + 32) forKey:*MEMORY[0x263F77CC8]];
  [v2 setSafeObject:&unk_26CEBD018 forKey:*MEMORY[0x263F77CB8]];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(v6 + 264);
  *(void *)(v6 + 264) = v2;
}

- (SURollbackDescriptor)lastRollbackDescriptor
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__SUState_lastRollbackDescriptor__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SURollbackDescriptor *)v3;
}

void __33__SUState_lastRollbackDescriptor__block_invoke(uint64_t a1)
{
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  if ([a4 isEqualToString:@"SUDownloadInterfaceReport"])
  {
    SULogDebug(@"Skipping SUDownloadInterfaceReport in SUState (legacy).", v5, v6, v7, v8, v9, v10, v11, vars0);
    uint64_t v12 = objc_opt_class();
  }
  else
  {
    uint64_t v12 = 0;
  }
  return (Class)v12;
}

- (NSDictionary)ddmPersistedError
{
  return self->_ddmPersistedError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_lastSentOTAPostponedDate, 0);
  objc_storeStrong((id *)&self->_lastRecommendedUpdateDiscoveryDate, 0);
  objc_storeStrong((id *)&self->_lastRecommendedUpdateInterval, 0);
  objc_storeStrong((id *)&self->_lastRecommendedUpdateVersion, 0);
  objc_storeStrong((id *)&self->_ddmPersistedError, 0);
  objc_storeStrong((id *)&self->_ddmDeclaration, 0);
  objc_storeStrong((id *)&self->_alternateLastScannedCoreDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredLastScannedCoreDescriptor, 0);
  objc_storeStrong((id *)&self->_lastRollbackDescriptor, 0);
  objc_storeStrong((id *)&self->_updateFullyUnrampedDates, 0);
  objc_storeStrong((id *)&self->_updateDiscoveryDates, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_appliedTime, 0);
  objc_storeStrong((id *)&self->_lastAssetAudience, 0);
  objc_storeStrong((id *)&self->_lastDeletedSUAssetID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_installPolicy, 0);
  objc_storeStrong((id *)&self->_mdmDelay, 0);
  objc_storeStrong((id *)&self->_lastAutoInstallOperationModel, 0);
  objc_storeStrong((id *)&self->_lastRollbackRecommendedBuildVersion, 0);
  objc_storeStrong((id *)&self->_rolledBackBuildVersions, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateDict, 0);
  objc_storeStrong((id *)&self->_unlockCallbacks, 0);
  objc_storeStrong((id *)&self->_lastSplatRestoreVersion, 0);
  objc_storeStrong((id *)&self->_lastReleaseType, 0);
  objc_storeStrong((id *)&self->_lastProductType, 0);
  objc_storeStrong((id *)&self->_lastProductBuild, 0);
  objc_storeStrong((id *)&self->_lastProductVersion, 0);
  objc_storeStrong((id *)&self->_lastAutoDownloadDate, 0);
  objc_storeStrong((id *)&self->_lastScanDate, 0);
  objc_storeStrong((id *)&self->_scheduledAutoDownloadPolicyChangeTime, 0);
  objc_storeStrong((id *)&self->_scheduledAutoDownloadWifiPeriodEndTime, 0);
  objc_storeStrong((id *)&self->_scheduledManualDownloadWifiPeriodEndTime, 0);
  objc_storeStrong((id *)&self->_lastScannedDescriptorScanOptions, 0);
  objc_storeStrong((id *)&self->_failedPatchDescriptors, 0);
  objc_storeStrong((id *)&self->_lastDownload, 0);
}

@end