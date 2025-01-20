@interface SUScanner
+ (int)typeForCoreDescriptor:(id)a3;
- (BOOL)_coreDescriptorFailedPatching:(id)a3;
- (BOOL)isBuddyRunning;
- (BOOL)isScanning;
- (BOOL)lastScannedMatchScanOptions:(id)a3;
- (BOOL)scanResultIsUpToDateWithAlternate:(id)a3;
- (BOOL)scanResultsChangedSinceLastScan:(id)a3 preferredUpdateNewlyDiscovered:(BOOL *)a4 alternateUpdateNewlyDiscovered:(BOOL *)a5 preferredUpdateChanged:(BOOL *)a6 alternateUpdateChanged:(BOOL *)a7 preferredWasAlternate:(BOOL *)a8 alternateWasPreferred:(BOOL *)a9;
- (BOOL)shouldPresentUpdate:(id)a3 options:(id)a4;
- (NSMutableArray)scanRequests;
- (SUCoreDescriptor)alternateLastScannedCoreDescriptor;
- (SUCoreDescriptor)preferredLastScannedCoreDescriptor;
- (SUManagerCore)core;
- (SUScanOptions)lastScannedDescriptorScanOptions;
- (SUScanTask)activeScanTask;
- (SUScanner)initWithCore:(id)a3;
- (id)_handleDescriptor:(id)a3 forRequestedBuild:(id)a4;
- (id)defaultValuesForCoreDescriptor:(id)a3;
- (id)descriptorToAutoDownload;
- (id)descriptorToAutoDownload:(id)a3;
- (id)discoveryDateforBuildVersion:(id)a3;
- (id)fullyUnrampedDateForBuildVersion:(id)a3;
- (id)recommendedDescriptor:(id)a3;
- (id)scanResultsForSUCoreScanResults:(id)a3;
- (id)stringForScanPriority:(int64_t)a3;
- (void)_doScanForUpdates;
- (void)_handleScanError:(id)a3;
- (void)_handleScannedPreferredDescriptor:(id)a3 alternateDescriptor:(id)a4 scanOptions:(id)a5 error:(id)a6;
- (void)_queue_refreshLastScannedCoreDescriptors;
- (void)autoScanAndDownloadIfAvailable:(int)a3 downloadNow:(BOOL)a4 withResult:(id)a5;
- (void)autoScanAndDownloadIfAvailable:(int)a3 withResult:(id)a4;
- (void)cancelTimerForRecommendedUpdateNotification;
- (void)handleActiveScanTaskDocumentationFor:(id)a3 withOptions:(id)a4 withSelectedDescriptorCompletion:(id)a5;
- (void)handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor:(id)a3 preferredSecondaryDescriptor:(id)a4 alternatePrimaryDescriptor:(id)a5 alternateSecondaryDescriptor:(id)a6 scanOptions:(id)a7 error:(id)a8;
- (void)isBuddyRunning;
- (void)notifyClientForRecommendedUpdate:(id)a3 shouldPresent:(BOOL)a4;
- (void)notifyScanDidComplete:(id)a3 options:(id)a4 error:(id)a5;
- (void)notifyScanRequestDidFinish:(id)a3 results:(id)a4 error:(id)a5;
- (void)notifyScanRequestDidStart:(id)a3;
- (void)removeFullyUnrampedDateForBuildVersion:(id)a3;
- (void)scanCompleted:(id)a3 alternateDescriptor:(id)a4 scanOptions:(id)a5 error:(id)a6;
- (void)scanForUpdates:(id)a3 complete:(id)a4;
- (void)scanForUpdates:(id)a3 shouldUseDDMInState:(BOOL)a4 complete:(id)a5;
- (void)scheduleRecommendedUpdateFromResults:(id)a3;
- (void)scheduleRecommendedUpdateNotification:(id)a3;
- (void)setActiveScanTask:(id)a3;
- (void)setAlternateLastScannedCoreDescriptor:(id)a3;
- (void)setCore:(id)a3;
- (void)setDiscoveryDate:(id)a3 forBuildVersion:(id)a4;
- (void)setFullyUnrampedDate:(id)a3 forBuildVersion:(id)a4;
- (void)setLastScannedDescriptorScanOptions:(id)a3;
- (void)setPreferredLastScannedCoreDescriptor:(id)a3;
- (void)setScanRequests:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)setupTimerForRecommendedUpdateNotification:(id)a3;
- (void)unscheduleRecommendedUpdateNotification;
@end

@implementation SUScanner

- (SUScanner)initWithCore:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SUScanner;
  v5 = [(SUScanner *)&v26 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_core, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    scanRequests = v6->_scanRequests;
    v6->_scanRequests = v7;

    v6->_scanning = 0;
    activeScanTask = v6->_activeScanTask;
    v6->_activeScanTask = 0;

    recommendedUpdateTimer = v6->_recommendedUpdateTimer;
    v6->_recommendedUpdateTimer = 0;

    v11 = [SUUpdateDiscoveryDateManager alloc];
    v12 = [v4 state];
    v13 = [v12 updateDiscoveryDates];
    uint64_t v14 = [(SUUpdateDiscoveryDateManager *)v11 initWithDiscoveryDateDictionary:v13];
    discoveryDateManager = v6->_discoveryDateManager;
    v6->_discoveryDateManager = (SUUpdateDiscoveryDateManager *)v14;

    v16 = [SUUpdateDiscoveryDateManager alloc];
    v17 = [v4 state];
    v18 = [v17 updateFullyUnrampedDates];
    uint64_t v19 = [(SUUpdateDiscoveryDateManager *)v16 initWithDiscoveryDateDictionary:v18];
    fullyUnrampedDateManager = v6->_fullyUnrampedDateManager;
    v6->_fullyUnrampedDateManager = (SUUpdateDiscoveryDateManager *)v19;

    v21 = [v4 state];
    v22 = [v21 lastScannedDescriptorScanOptions];
    uint64_t v23 = [v22 copy];
    lastScannedDescriptorScanOptions = v6->_lastScannedDescriptorScanOptions;
    v6->_lastScannedDescriptorScanOptions = (SUScanOptions *)v23;

    [(SUScanner *)v6 _queue_refreshLastScannedCoreDescriptors];
  }

  return v6;
}

- (BOOL)isScanning
{
  v3 = [(SUScanner *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUScanner *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_scanning != v3)
  {
    self->_scanning = v3;
    +[SUNetworkMonitor setHoldsWiFiAssertion:v3];
  }
}

- (void)_queue_refreshLastScannedCoreDescriptors
{
  BOOL v3 = [(SUScanner *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [(SUScanner *)self core];
  v6 = [v5 state];
  v7 = [v6 preferredLastScannedCoreDescriptor];

  v8 = [(SUScanner *)self core];
  v9 = [v8 state];
  v10 = [v9 alternateLastScannedCoreDescriptor];

  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__14;
  v60 = __Block_byref_object_dispose__14;
  id v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__14;
  v54 = __Block_byref_object_dispose__14;
  id v55 = 0;
  if (v7)
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v12 = [(SUScanner *)self defaultValuesForCoreDescriptor:v7];
    v13 = (void *)MEMORY[0x263F77B78];
    uint64_t v14 = [MEMORY[0x263F55948] requireSameAssetTypeAndAssetId];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __53__SUScanner__queue_refreshLastScannedCoreDescriptors__block_invoke;
    v47[3] = &unk_26447E0C8;
    v49 = &v56;
    v15 = v11;
    v48 = v15;
    [v13 reloadDescriptor:v7 allowingDifferences:v14 forceReload:0 skipMSU:1 defaultValues:v12 completion:v47];

    dispatch_time_t v16 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v15, v16)) {
      SULogInfo(@"TIME OUT waiting for reloadDescriptor for preferred update %@", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v7);
    }
  }
  if (v10)
  {
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    v25 = [(SUScanner *)self defaultValuesForCoreDescriptor:v10];
    objc_super v26 = (void *)MEMORY[0x263F77B78];
    v27 = [MEMORY[0x263F55948] requireSameAssetTypeAndAssetId];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __53__SUScanner__queue_refreshLastScannedCoreDescriptors__block_invoke_2;
    v44[3] = &unk_26447E0C8;
    v46 = &v50;
    v28 = v24;
    v45 = v28;
    [v26 reloadDescriptor:v10 allowingDifferences:v27 forceReload:0 defaultValues:v25 completion:v44];

    dispatch_time_t v29 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v28, v29)) {
      SULogInfo(@"TIME OUT waiting for reloadDescriptor for alternate update %@", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v7);
    }
  }
  objc_storeStrong((id *)&self->_preferredLastScannedCoreDescriptor, (id)v57[5]);
  objc_storeStrong((id *)&self->_alternateLastScannedCoreDescriptor, (id)v51[5]);
  SULogInfo(@"Fetched preferredLastScannedCoreDescriptor:%@ alternateLastScannedCoreDescriptor:%@", v37, v38, v39, v40, v41, v42, v43, (uint64_t)self->_preferredLastScannedCoreDescriptor);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
}

void __53__SUScanner__queue_refreshLastScannedCoreDescriptors__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __53__SUScanner__queue_refreshLastScannedCoreDescriptors__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)defaultValuesForCoreDescriptor:(id)a3
{
  v29[19] = *MEMORY[0x263EF8340];
  v28[0] = *MEMORY[0x263F55888];
  BOOL v3 = NSNumber;
  id v4 = a3;
  v27 = objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "downloadSize"));
  v29[0] = v27;
  v28[1] = *MEMORY[0x263F558A0];
  objc_super v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "unarchivedSize"));
  v29[1] = v26;
  v28[2] = *MEMORY[0x263F77C20];
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "minimumSystemPartitionSize"));
  v29[2] = v25;
  v28[3] = *MEMORY[0x263F55890];
  dispatch_semaphore_t v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "streamingZipCapable"));
  v29[3] = v24;
  v28[4] = *MEMORY[0x263F77C38];
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "downloadAllowableOverCellular"));
  v29[4] = v23;
  v28[5] = *MEMORY[0x263F77C30];
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "downloadable"));
  v29[5] = v22;
  v28[6] = *MEMORY[0x263F77C98];
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "disableSiriVoiceDeletion"));
  v29[6] = v21;
  v28[7] = *MEMORY[0x263F77C90];
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "disableCDLevel4"));
  v29[7] = v20;
  v28[8] = *MEMORY[0x263F77C88];
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "disableAppDemotion"));
  v29[8] = v19;
  v28[9] = *MEMORY[0x263F77CA0];
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "disableInstallTonight") ^ 1);
  v29[9] = v18;
  v28[10] = *MEMORY[0x263F77C80];
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "rampEnabled"));
  v29[10] = v17;
  v28[11] = *MEMORY[0x263F77C58];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "autoUpdateEnabled"));
  v29[11] = v5;
  v28[12] = *MEMORY[0x263F77C50];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "autoInstallDelay"));
  v29[12] = v6;
  v28[13] = *MEMORY[0x263F77C78];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "notifyAfter"));
  v29[13] = v7;
  v28[14] = *MEMORY[0x263F77C70];
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "hideInstallAlert"));
  v29[14] = v8;
  v28[15] = *MEMORY[0x263F77C28];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "allowAutoDownloadOnBattery"));
  v29[15] = v9;
  v28[16] = *MEMORY[0x263F77C40];
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "autoDownloadOnBatteryDelay"));
  v29[16] = v10;
  v28[17] = *MEMORY[0x263F77C48];
  dispatch_semaphore_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "autoDownloadOnBatteryMinBattery"));
  v29[17] = v11;
  v28[18] = *MEMORY[0x263F77C60];
  v12 = NSNumber;
  uint64_t v13 = [v4 disableSplatCombo];

  uint64_t v14 = [v12 numberWithBool:v13];
  v29[18] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:19];

  return v15;
}

- (SUCoreDescriptor)preferredLastScannedCoreDescriptor
{
  BOOL v3 = [(SUScanner *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  preferredLastScannedCoreDescriptor = self->_preferredLastScannedCoreDescriptor;
  return preferredLastScannedCoreDescriptor;
}

- (void)setPreferredLastScannedCoreDescriptor:(id)a3
{
  id v4 = (SUCoreDescriptor *)a3;
  v5 = [(SUScanner *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  preferredLastScannedCoreDescriptor = self->_preferredLastScannedCoreDescriptor;
  self->_preferredLastScannedCoreDescriptor = v4;
  v8 = v4;

  id v10 = [(SUScanner *)self core];
  v9 = [v10 state];
  [v9 setPreferredLastScannedCoreDescriptor:self->_preferredLastScannedCoreDescriptor];
}

- (SUCoreDescriptor)alternateLastScannedCoreDescriptor
{
  BOOL v3 = [(SUScanner *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  alternateLastScannedCoreDescriptor = self->_alternateLastScannedCoreDescriptor;
  return alternateLastScannedCoreDescriptor;
}

- (void)setAlternateLastScannedCoreDescriptor:(id)a3
{
  id v4 = (SUCoreDescriptor *)a3;
  v5 = [(SUScanner *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  alternateLastScannedCoreDescriptor = self->_alternateLastScannedCoreDescriptor;
  self->_alternateLastScannedCoreDescriptor = v4;
  v8 = v4;

  id v10 = [(SUScanner *)self core];
  v9 = [v10 state];
  [v9 setAlternateLastScannedCoreDescriptor:self->_alternateLastScannedCoreDescriptor];
}

- (void)setDiscoveryDate:(id)a3 forBuildVersion:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  v7 = [(SUScanner *)self core];
  v8 = [v7 workQueue];
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    uint64_t v21 = @"Unable to set discovery date for nil descriptor build version";
LABEL_8:
    SULogInfo(v21, v9, v10, v11, v12, v13, v14, v15, v22);
    goto LABEL_9;
  }
  uint64_t v10 = (uint64_t)v23;
  if (!v23)
  {
    uint64_t v21 = @"Unable to set discovery date for descriptor with nil date";
    goto LABEL_8;
  }
  [(SUUpdateDiscoveryDateManager *)self->_discoveryDateManager setDiscoveryDate:v23 forBuildVersion:v6];
  dispatch_time_t v16 = [(SUUpdateDiscoveryDateManager *)self->_discoveryDateManager dictionaryRepresentation];
  if (v16)
  {
    uint64_t v17 = [(SUScanner *)self core];
    uint64_t v18 = [v17 state];
    [v18 setUpdateDiscoveryDates:v16];

    uint64_t v19 = [(SUScanner *)self core];
    uint64_t v20 = [v19 state];
    [v20 save];
  }
LABEL_9:
}

- (void)setFullyUnrampedDate:(id)a3 forBuildVersion:(id)a4
{
  id v37 = a3;
  id v6 = a4;
  v7 = [(SUScanner *)self core];
  v8 = [v7 workQueue];
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    id v23 = @"Unable to set fully un-ramped date for nil descriptor build version";
LABEL_7:
    SULogInfo(v23, v9, v10, v11, v12, v13, v14, v15, v36);
    goto LABEL_8;
  }
  if (!v37)
  {
    id v23 = @"Unable to set fully un-ramped date for descriptor with nil date";
    goto LABEL_7;
  }
  if ([(SUUpdateDiscoveryDateManager *)self->_fullyUnrampedDateManager containsBuildVersion:v6])
  {
    SULogInfo(@"Unable to set fully un-ramped date because it's already been set for %@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v6);
  }
  else
  {
    [(SUUpdateDiscoveryDateManager *)self->_fullyUnrampedDateManager setDiscoveryDate:v37 forBuildVersion:v6];
    uint64_t v31 = [(SUUpdateDiscoveryDateManager *)self->_fullyUnrampedDateManager dictionaryRepresentation];
    if (v31)
    {
      uint64_t v32 = [(SUScanner *)self core];
      uint64_t v33 = [v32 state];
      [v33 setUpdateFullyUnrampedDates:v31];

      uint64_t v34 = [(SUScanner *)self core];
      uint64_t v35 = [v34 state];
      [v35 save];
    }
    SULogInfo(@"Succeeded to set fully un-ramped date %@ for %@", v24, v25, v26, v27, v28, v29, v30, (uint64_t)v37);
  }
LABEL_8:
}

- (void)removeFullyUnrampedDateForBuildVersion:(id)a3
{
  id v27 = a3;
  id v4 = [(SUScanner *)self core];
  v5 = [v4 workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v12 = (uint64_t)v27;
  if (!v27)
  {
    uint64_t v25 = @"Unable to remove fully un-ramped date for nil descriptor build version";
LABEL_8:
    SULogInfo(v25, v12, v6, v7, v8, v9, v10, v11, v26);
    goto LABEL_9;
  }
  if (![(SUUpdateDiscoveryDateManager *)self->_fullyUnrampedDateManager containsBuildVersion:v27])
  {
    uint64_t v26 = (uint64_t)v27;
    uint64_t v25 = @"Unable to remove fully un-ramped date for %@ because we don't have it";
    goto LABEL_8;
  }
  [(SUUpdateDiscoveryDateManager *)self->_fullyUnrampedDateManager removeDiscoveryDateForBuildVersion:v27];
  uint64_t v20 = [(SUUpdateDiscoveryDateManager *)self->_fullyUnrampedDateManager dictionaryRepresentation];
  if (v20)
  {
    uint64_t v21 = [(SUScanner *)self core];
    uint64_t v22 = [v21 state];
    [v22 setUpdateFullyUnrampedDates:v20];

    id v23 = [(SUScanner *)self core];
    uint64_t v24 = [v23 state];
    [v24 save];
  }
  SULogInfo(@"Succeeded to remove fully un-ramped date for %@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v27);

LABEL_9:
}

- (id)discoveryDateforBuildVersion:(id)a3
{
  id v4 = a3;
  v5 = [(SUScanner *)self core];
  uint64_t v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(SUUpdateDiscoveryDateManager *)self->_discoveryDateManager discoveryDateforBuildVersion:v4];

  return v7;
}

- (id)fullyUnrampedDateForBuildVersion:(id)a3
{
  id v4 = a3;
  v5 = [(SUScanner *)self core];
  uint64_t v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(SUUpdateDiscoveryDateManager *)self->_fullyUnrampedDateManager discoveryDateforBuildVersion:v4];

  return v7;
}

- (SUScanOptions)lastScannedDescriptorScanOptions
{
  BOOL v3 = [(SUScanner *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  lastScannedDescriptorScanOptions = self->_lastScannedDescriptorScanOptions;
  return lastScannedDescriptorScanOptions;
}

- (void)setLastScannedDescriptorScanOptions:(id)a3
{
  id v4 = (SUScanOptions *)a3;
  v5 = [(SUScanner *)self core];
  uint64_t v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  lastScannedDescriptorScanOptions = self->_lastScannedDescriptorScanOptions;
  self->_lastScannedDescriptorScanOptions = v4;
  uint64_t v8 = v4;

  id v10 = [(SUScanner *)self core];
  uint64_t v9 = [v10 state];
  [v9 setLastScannedDescriptorScanOptions:v8];
}

- (void)autoScanAndDownloadIfAvailable:(int)a3 withResult:(id)a4
{
}

- (void)autoScanAndDownloadIfAvailable:(int)a3 downloadNow:(BOOL)a4 withResult:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  uint64_t v9 = [(SUScanner *)self core];
  id v10 = [v9 workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = +[SUNetworkMonitor sharedInstance];
  LODWORD(v10) = [v11 isCellularRoaming];

  if (!v10)
  {
    uint64_t v25 = +[SUTransactionManager sharedInstance];
    [v25 beginTransaction:@"auto-tryScan"];
    uint64_t v26 = SUStringFromUpdateType(v6);
    SULogDebug(@"[Auto scan] Starting software update auto scan for type: %@", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v26);

    uint64_t v34 = objc_alloc_init(SUScanOptions);
    [(SUScanOptions *)v34 setIdentifier:@"com.apple.softwareupdate.autoscan"];
    [(SUScanOptions *)v34 setForced:0];
    [(SUScanOptions *)v34 addType:v6];
    [(SUScanOptions *)v34 setIgnoreNoUpdateFoundResult:v6 == 4];
    [(SUScanOptions *)v34 setClientName:@"com.apple.softwareupdateservicesd"];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_2;
    v35[3] = &unk_26447E118;
    v35[4] = self;
    uint64_t v36 = v34;
    BOOL v39 = a4;
    id v37 = v25;
    id v38 = v8;
    id v24 = v25;
    id v23 = v34;
    [(SUScanner *)self scanForUpdates:v23 complete:v35];

    goto LABEL_5;
  }
  uint64_t v12 = SUStringFromUpdateType(v6);
  SULogInfo(@"[Auto scan] Automatic scan for type [%@] disabled while roaming over cellular.", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);

  if (v8)
  {
    uint64_t v20 = +[SUUtility errorWithCode:33];
    uint64_t v21 = [(SUScanner *)self core];
    uint64_t v22 = [v21 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke;
    block[3] = &unk_26447CFA0;
    id v41 = v20;
    id v42 = v8;
    id v23 = v20;
    dispatch_async(v22, block);

    id v24 = v42;
LABEL_5:
  }
}

uint64_t __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) core];
  id v8 = [v7 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_3;
  block[3] = &unk_26447E0F0;
  uint64_t v9 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v9;
  char v18 = *(unsigned char *)(a1 + 64);
  id v17 = *(id *)(a1 + 56);
  id v15 = v6;
  id v16 = *(id *)(a1 + 48);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

void __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) descriptorToAutoDownload:*(void *)(a1 + 40)];
  if (!v2)
  {
    if (*(void *)(a1 + 56))
    {
      SULogInfo(@"[Auto scan] Automatic scan failed with error: %@", v3, v4, v5, v6, v7, v8, v9, *(void *)(a1 + 56));
      uint64_t v27 = [*(id *)(a1 + 56) code];
    }
    else
    {
      SULogInfo(@"[Auto scan] Automatic scan failed with error: No suitable update to auto download", v3, v4, v5, v6, v7, v8, v9, v102);
      uint64_t v27 = 3;
    }
    if (*(void *)(a1 + 72))
    {
      v64 = [*(id *)(a1 + 32) core];
      v65 = [v64 externWorkQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_6;
      block[3] = &unk_26447DC40;
      v106[1] = v27;
      v66 = (id *)v106;
      v106[0] = *(id *)(a1 + 72);
      dispatch_async(v65, block);

LABEL_29:
      id v10 = 0;
      goto LABEL_30;
    }
LABEL_31:
    id v10 = 0;
    goto LABEL_32;
  }
  id v10 = (void *)v2;
  SULogInfo(@"[Auto scan] Automatic scan fouond an update: %@", v3, v4, v5, v6, v7, v8, v9, v2);
  if (([v10 isSplatOnly] & 1) != 0 || objc_msgSend(v10, "isEmergencyOrCritical"))
  {
    id v11 = [v10 humanReadableUpdateName];
    SULogInfo(@"[Auto scan] Automatic scan found a splat or emergency update, immediately handle: %@", v12, v13, v14, v15, v16, v17, v18, (uint64_t)v11);

    if (([*(id *)(a1 + 48) MDMShowRapidSecurityResponse] & 1) == 0
      && [v10 isSplatOnly])
    {
      uint64_t v19 = [v10 humanReadableUpdateName];
      SULogInfo(@"[Auto scan] Splat scans are disabled, hiding splat: %@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v19);

      goto LABEL_27;
    }
    goto LABEL_25;
  }
  uint64_t v28 = +[SUScheduler sharedInstance];
  [v28 _autoDownloadTimeInterval];
  double v30 = v29;

  uint64_t v31 = [v10 humanReadableUpdateName];
  SULogInfo(@"[Auto scan] Automatic scan found a normal OS update, only auto download if last auto download was %f days ago: %@", v32, v33, v34, v35, v36, v37, v38, COERCE__INT64(v30 / 86400.0));

  BOOL v39 = [*(id *)(a1 + 32) core];
  uint64_t v40 = [v39 state];
  id v41 = [v40 lastScanDate];

  id v42 = *(void **)(a1 + 32);
  uint64_t v43 = [v10 productBuildVersion];
  v44 = [v42 discoveryDateforBuildVersion:v43];

  v45 = [*(id *)(a1 + 32) core];
  v46 = [v45 state];
  v47 = [v46 lastAutoDownloadDate];

  v48 = +[SUUtility prettyPrintDate:v41];
  v49 = +[SUUtility prettyPrintDate:v44];
  v104 = +[SUUtility prettyPrintDate:v47];
  SULogInfo(@"[Auto scan] Last scan date: %@, Last discovery date: %@, Last auto download date: %@", v50, v51, v52, v53, v54, v55, v56, (uint64_t)v48);

  if (*(unsigned char *)(a1 + 80))
  {
    SULogInfo(@"[Auto scan] downloadNow is set, auto download now", v57, v58, v59, v60, v61, v62, v63, v103);
    goto LABEL_24;
  }
  if ([v10 rampEnabled])
  {
    v67 = [v10 humanReadableUpdateName];
    SULogInfo(@"[Auto scan] %@ has rampEnabled set, do not auto download", v68, v69, v70, v71, v72, v73, v74, (uint64_t)v67);

LABEL_16:
    id v10 = 0;
    goto LABEL_24;
  }
  if ([v10 granularlyRamped])
  {
    v75 = [v10 humanReadableUpdateName];
    SULogInfo(@"[Auto scan] %@ has granularlyRamped set, auto download now", v76, v77, v78, v79, v80, v81, v82, (uint64_t)v75);
  }
  else
  {
    if (v47)
    {
      [v47 timeIntervalSinceNow];
      if (fabs(v90) < v30)
      {
        SULogInfo(@"[Auto scan] Less than %f days have passed since last auto-download, do not auto download", v83, v84, v85, v86, v87, v88, v89, COERCE__INT64(v30 / 86400.0));
        goto LABEL_16;
      }
    }
    v75 = [v10 humanReadableUpdateName];
    SULogInfo(@"[Auto scan] Greater than %f days have passed since auto downloading for OS updates, consider %@ auto downloadable/updateable/presentable", v91, v92, v93, v94, v95, v96, v97, COERCE__INT64(v30 / 86400.0));
  }

LABEL_24:
  if (!v10)
  {
LABEL_27:
    if (*(void *)(a1 + 72))
    {
      v64 = [*(id *)(a1 + 32) core];
      v101 = [v64 externWorkQueue];
      v107[0] = MEMORY[0x263EF8330];
      v107[1] = 3221225472;
      v107[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_5;
      v107[3] = &unk_26447D4F8;
      v66 = &v108;
      id v108 = *(id *)(a1 + 72);
      dispatch_async(v101, v107);

      goto LABEL_29;
    }
    goto LABEL_31;
  }
LABEL_25:
  v98 = [*(id *)(a1 + 32) core];
  [v98 autoUpdateFound:v10 downloadNow:*(unsigned __int8 *)(a1 + 80)];

  if (*(void *)(a1 + 72))
  {
    v99 = [*(id *)(a1 + 32) core];
    v100 = [v99 externWorkQueue];
    v109[0] = MEMORY[0x263EF8330];
    v109[1] = 3221225472;
    v109[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_4;
    v109[3] = &unk_26447CFA0;
    v66 = &v111;
    id v111 = *(id *)(a1 + 72);
    id v110 = *(id *)(a1 + 40);
    dispatch_async(v100, v109);

    v64 = v110;
LABEL_30:
  }
LABEL_32:
  [*(id *)(a1 + 64) endTransaction:@"auto-tryScan"];
}

uint64_t __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_5(uint64_t a1)
{
  id v2 = +[SUUtility errorWithCode:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_6(uint64_t a1)
{
  id v2 = +[SUUtility errorWithCode:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyScanRequestDidStart:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUScanner *)self core];
  uint64_t v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(SUScanner *)self core];
  uint64_t v8 = [v7 delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(SUScanner *)self core];
    id v11 = [v10 externWorkQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __39__SUScanner_notifyScanRequestDidStart___block_invoke;
    v12[3] = &unk_26447C8C8;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v11, v12);
  }
}

void __39__SUScanner_notifyScanRequestDidStart___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) core];
  id v2 = [v4 delegate];
  uint64_t v3 = [*(id *)(a1 + 40) options];
  [v2 scanRequestDidStartForOptions:v3];
}

- (id)scanResultsForSUCoreScanResults:(id)a3
{
  id v3 = a3;
  id v4 = [v3 preferredDescriptor];
  uint64_t v5 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v4];

  uint64_t v6 = [v3 alternateDescriptor];

  uint64_t v7 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v6];

  if (v5) {
    uint64_t v8 = [[SUScanResults alloc] initWithPreferredDescriptor:v5 alternateDescriptor:v7];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)notifyScanRequestDidFinish:(id)a3 results:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(SUScanner *)self core];
  uint64_t v12 = [v11 workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(SUScanner *)self scanResultsForSUCoreScanResults:v10];

  notify_post((const char *)[(id)*MEMORY[0x263F77C18] UTF8String]);
  uint64_t v14 = [v8 callback];
  if (v14)
  {
    uint64_t v15 = [(SUScanner *)self core];
    uint64_t v16 = [v15 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke;
    block[3] = &unk_26447D038;
    id v38 = v14;
    id v36 = v13;
    id v37 = v9;
    dispatch_async(v16, block);
  }
  uint64_t v17 = [(SUScanner *)self core];
  uint64_t v18 = [v17 delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    uint64_t v20 = [(SUScanner *)self core];
    uint64_t v21 = [v20 externWorkQueue];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke_2;
    v31[3] = &unk_26447D598;
    v31[4] = self;
    id v32 = v8;
    id v33 = v13;
    id v34 = v9;
    dispatch_async(v21, v31);
  }
  uint64_t v22 = [(SUScanner *)self core];
  uint64_t v23 = [v22 delegate];
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    uint64_t v25 = [(SUScanner *)self core];
    uint64_t v26 = [v25 externWorkQueue];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke_3;
    v27[3] = &unk_26447D598;
    v27[4] = self;
    id v28 = v8;
    id v29 = v13;
    id v30 = v9;
    dispatch_async(v26, v27);
  }
}

uint64_t __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  id v2 = [v5 delegate];
  id v3 = [*(id *)(a1 + 40) options];
  id v4 = [*(id *)(a1 + 48) latestUpdate];
  [v2 scanRequestDidFinishForOptions:v3 update:v4 error:*(void *)(a1 + 56)];
}

void __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) core];
  id v2 = [v4 delegate];
  id v3 = [*(id *)(a1 + 40) options];
  [v2 scanRequestDidFinishForOptions:v3 results:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)notifyScanDidComplete:(id)a3 options:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(SUScanner *)self core];
  uint64_t v12 = [v11 workQueue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(SUScanner *)self scanResultsForSUCoreScanResults:v10];

  uint64_t v14 = [(SUScanner *)self core];
  uint64_t v15 = [v14 delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    uint64_t v17 = [(SUScanner *)self core];
    uint64_t v18 = [v17 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__SUScanner_notifyScanDidComplete_options_error___block_invoke;
    block[3] = &unk_26447CD70;
    void block[4] = self;
    id v29 = v13;
    id v30 = v9;
    dispatch_async(v18, block);
  }
  char v19 = [(SUScanner *)self core];
  uint64_t v20 = [v19 delegate];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    uint64_t v22 = [(SUScanner *)self core];
    uint64_t v23 = [v22 externWorkQueue];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __49__SUScanner_notifyScanDidComplete_options_error___block_invoke_2;
    v24[3] = &unk_26447D598;
    v24[4] = self;
    id v25 = v8;
    id v26 = v13;
    id v27 = v9;
    dispatch_async(v23, v24);
  }
}

void __49__SUScanner_notifyScanDidComplete_options_error___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) core];
  id v2 = [v4 delegate];
  id v3 = [*(id *)(a1 + 40) latestUpdate];
  [v2 scanDidCompleteWithNewUpdateAvailable:v3 error:*(void *)(a1 + 48)];
}

void __49__SUScanner_notifyScanDidComplete_options_error___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  id v2 = [v3 delegate];
  [v2 scanDidCompleteForOptions:*(void *)(a1 + 40) results:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_handleScanError:(id)a3
{
  id v4 = a3;
  id v5 = [(SUScanner *)self core];
  uint64_t v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [v4 code];
  if (v7 == 40)
  {
    id v8 = [MEMORY[0x263F14428] sharedSystemPathMonitor];
    int v9 = [v8 isVPNActive];

    if (v9) {
      uint64_t v17 = @"Asset query timed out but VPN is connected.";
    }
    else {
      uint64_t v17 = @"Asset query timed out and VPN not connected.";
    }
    SULogInfo(v17, v10, v11, v12, v13, v14, v15, v16, v19);
  }
}

- (BOOL)shouldPresentUpdate:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v5];
  if (!v14)
  {
    uint64_t v17 = @"No update provided to shouldPresentUpdate:options:";
    goto LABEL_12;
  }
  if (([v6 isSplatOnlyScan] & 1) == 0
    && ([v6 findsAnyUpdate] & 1) == 0
    && (objc_msgSend(v6, "containsType:", objc_msgSend(v14, "updateType")) & 1) == 0)
  {
    uint64_t v20 = [v6 types];
    char v21 = SUStringFromUpdateTypes(v20);
    SULogInfo(@"Scanned for [%@] updates, but didn't find any.", v22, v23, v24, v25, v26, v27, v28, (uint64_t)v21);

    goto LABEL_13;
  }
  if ([v6 isSplatOnlyScan])
  {
    uint64_t v15 = [v5 softwareUpdateAssetType];
    char v16 = [v15 isEqualToString:*MEMORY[0x263F77CA8]];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = @"Scanned for splat updates, but found non-splat update.";
      goto LABEL_12;
    }
  }
  if ([v5 isRevokedSplat])
  {
    uint64_t v17 = @"Scan discovered revoked Splat. Not presenting update";
LABEL_12:
    SULogInfo(v17, v7, v8, v9, v10, v11, v12, v13, v29);
LABEL_13:
    BOOL v18 = 0;
    goto LABEL_14;
  }
  SULogInfo(@"Update found for scan options: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
  BOOL v18 = 1;
LABEL_14:

  return v18;
}

- (void)notifyClientForRecommendedUpdate:(id)a3 shouldPresent:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(SUScanner *)self core];
  uint64_t v8 = [v7 workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v6];

  uint64_t v10 = [(SUScanner *)self core];
  uint64_t v11 = [v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(SUScanner *)self core];
    uint64_t v14 = [v13 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__SUScanner_notifyClientForRecommendedUpdate_shouldPresent___block_invoke;
    block[3] = &unk_26447CED8;
    void block[4] = self;
    id v16 = v9;
    BOOL v17 = a4;
    dispatch_async(v14, block);
  }
}

void __60__SUScanner_notifyClientForRecommendedUpdate_shouldPresent___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  id v2 = [v3 delegate];
  [v2 presentingRecommendedUpdate:*(void *)(a1 + 40) shouldPresent:*(unsigned __int8 *)(a1 + 48)];
}

- (id)recommendedDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 preferredDescriptor];
  id v5 = [v4 documentation];
  if ([v5 recommendedUpdateApplicable])
  {
    id v6 = [v3 alternateDescriptor];
    uint64_t v7 = [v6 documentation];
    int v8 = [v7 recommendedUpdateApplicable];

    if (v8)
    {
      uint64_t v9 = [v3 latestUpdate];
      SULogInfo(@"Both updates are recommended, returning latest update:%@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
      goto LABEL_11;
    }
  }
  else
  {
  }
  BOOL v17 = [v3 preferredDescriptor];
  BOOL v18 = [v17 documentation];
  int v19 = [v18 recommendedUpdateApplicable];

  if (v19)
  {
    SULogInfo(@"Preferred update is recommended", v20, v21, v22, v23, v24, v25, v26, v39);
    uint64_t v27 = [v3 preferredDescriptor];
LABEL_9:
    uint64_t v9 = (void *)v27;
    goto LABEL_11;
  }
  uint64_t v28 = [v3 alternateDescriptor];
  uint64_t v29 = [v28 documentation];
  int v30 = [v29 recommendedUpdateApplicable];

  if (v30)
  {
    SULogInfo(@"Alternate update is recommended", v31, v32, v33, v34, v35, v36, v37, v39);
    uint64_t v27 = [v3 alternateDescriptor];
    goto LABEL_9;
  }
  SULogInfo(@"No recommended update", v31, v32, v33, v34, v35, v36, v37, v39);
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (void)setupTimerForRecommendedUpdateNotification:(id)a3
{
  id v11 = a3;
  if (self->_recommendedUpdateTimer)
  {
    SULogInfo(@"Recommended update timer already exist", v4, v5, v6, v7, v8, v9, v10, v48);
  }
  else
  {
    uint64_t v12 = [(SUScanner *)self core];
    uint64_t v13 = [v12 state];
    uint64_t v14 = [v13 lastRecommendedUpdateInterval];
    [v14 doubleValue];
    double v16 = v15;

    BOOL v17 = +[SUPreferences sharedInstance];
    BOOL v18 = [v17 recommendedUpdateInterval];

    if (v18)
    {
      int v19 = +[SUPreferences sharedInstance];
      uint64_t v20 = [v19 recommendedUpdateInterval];
      [v20 doubleValue];
      double v22 = v21;

      uint64_t v23 = +[SUPreferences sharedInstance];
      uint64_t v24 = [v23 recommendedUpdateInterval];
      SULogInfo(@"Found preference override for recommended update interval: %@", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v24);
    }
    else
    {
      double v22 = v16 * 60.0 * 60.0 * 24.0;
    }
    uint64_t v32 = [(SUScanner *)self core];
    uint64_t v33 = [v32 state];
    uint64_t v34 = [v33 lastRecommendedUpdateDiscoveryDate];
    uint64_t v35 = [v34 dateByAddingTimeInterval:v22];

    SULogInfo(@"Setting recommended update timer for %@", v36, v37, v38, v39, v40, v41, v42, (uint64_t)v35);
    uint64_t v43 = (void *)MEMORY[0x263EFFA20];
    [v35 timeIntervalSinceNow];
    double v45 = v44;
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke;
    v50[3] = &unk_26447E140;
    v50[4] = self;
    id v51 = v11;
    v46 = [v43 timerWithTimeInterval:0 repeats:v50 block:v45];
    recommendedUpdateTimer = self->_recommendedUpdateTimer;
    self->_recommendedUpdateTimer = v46;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke_3;
    block[3] = &unk_26447C878;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  id v3 = [v2 workQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke_2;
  v5[3] = &unk_26447C8C8;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, v5);
}

uint64_t __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(@"Recommended update timer triggered", a2, a3, a4, a5, a6, a7, a8, v21);
  uint64_t v9 = [*(id *)(a1 + 32) core];
  uint64_t v10 = [v9 state];
  id v11 = [v10 lastRecommendedUpdateInterval];
  int v12 = [v11 intValue];

  if (v12 == -1)
  {
    [*(id *)(a1 + 32) unscheduleRecommendedUpdateNotification];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263EFF910] now];
    uint64_t v14 = [*(id *)(a1 + 32) core];
    double v15 = [v14 state];
    [v15 setLastRecommendedUpdateDiscoveryDate:v13];

    double v16 = [*(id *)(a1 + 32) core];
    BOOL v17 = [v16 state];
    [v17 save];

    [*(id *)(a1 + 32) cancelTimerForRecommendedUpdateNotification];
    [*(id *)(a1 + 32) setupTimerForRecommendedUpdateNotification:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) notifyClientForRecommendedUpdate:*(void *)(a1 + 40) shouldPresent:0];
  BOOL v18 = *(void **)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  return [v18 notifyClientForRecommendedUpdate:v19 shouldPresent:1];
}

void __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v2 addTimer:*(void *)(*(void *)(a1 + 32) + 80) forMode:*MEMORY[0x263EFF478]];
}

- (void)cancelTimerForRecommendedUpdateNotification
{
  SULogInfo(@"Canceling recommended update timer", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v10);
  [(NSTimer *)self->_recommendedUpdateTimer invalidate];
  recommendedUpdateTimer = self->_recommendedUpdateTimer;
  self->_recommendedUpdateTimer = 0;
}

- (void)scheduleRecommendedUpdateNotification:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [v16 productVersion];
  uint64_t v5 = [(SUScanner *)self core];
  uint64_t v6 = [v5 state];
  [v6 setLastRecommendedUpdateVersion:v4];

  uint64_t v7 = [v16 documentation];
  uint64_t v8 = [v7 recommendedUpdateNotificationFrequencyDays];
  uint64_t v9 = [(SUScanner *)self core];
  uint64_t v10 = [v9 state];
  [v10 setLastRecommendedUpdateInterval:v8];

  id v11 = [MEMORY[0x263EFF910] now];
  int v12 = [(SUScanner *)self core];
  uint64_t v13 = [v12 state];
  [v13 setLastRecommendedUpdateDiscoveryDate:v11];

  uint64_t v14 = [(SUScanner *)self core];
  double v15 = [v14 state];
  [v15 save];

  [(SUScanner *)self cancelTimerForRecommendedUpdateNotification];
  [(SUScanner *)self setupTimerForRecommendedUpdateNotification:v16];
}

- (void)unscheduleRecommendedUpdateNotification
{
  uint64_t v3 = [(SUScanner *)self core];
  uint64_t v4 = [v3 state];
  [v4 setLastRecommendedUpdateVersion:0];

  uint64_t v5 = [(SUScanner *)self core];
  uint64_t v6 = [v5 state];
  [v6 setLastRecommendedUpdateInterval:0];

  uint64_t v7 = [(SUScanner *)self core];
  uint64_t v8 = [v7 state];
  [v8 setLastRecommendedUpdateDiscoveryDate:0];

  uint64_t v9 = [(SUScanner *)self core];
  uint64_t v10 = [v9 state];
  [v10 save];

  [(SUScanner *)self cancelTimerForRecommendedUpdateNotification];
  [(SUScanner *)self notifyClientForRecommendedUpdate:0 shouldPresent:0];
}

- (void)scheduleRecommendedUpdateFromResults:(id)a3
{
  id v47 = [(SUScanner *)self recommendedDescriptor:a3];
  uint64_t v4 = [(SUScanner *)self core];
  uint64_t v5 = [v4 state];
  uint64_t v6 = [v5 lastRecommendedUpdateVersion];

  uint64_t v7 = [(SUScanner *)self core];
  uint64_t v8 = [v7 state];
  uint64_t v9 = [v8 lastRecommendedUpdateInterval];

  if (v47)
  {
    uint64_t v17 = [v47 productVersion];
    uint64_t v25 = (void *)v17;
    if (v6)
    {
      if ([v6 isEqual:v17])
      {
        uint64_t v26 = [v47 documentation];
        uint64_t v27 = [v26 recommendedUpdateNotificationFrequencyDays];
        int v28 = [v9 isEqual:v27];

        if (v28)
        {
          SULogInfo(@"Found same recommended update:%@", v29, v30, v31, v32, v33, v34, v35, (uint64_t)v9);
          [(SUScanner *)self setupTimerForRecommendedUpdateNotification:v47];
          goto LABEL_13;
        }
      }
      else
      {
      }
      uint64_t v36 = [v47 productVersion];
      uint64_t v37 = [v47 documentation];
      v46 = [v37 recommendedUpdateNotificationFrequencyDays];
      SULogInfo(@"Found a different recommended update. Old is %@ - %@, new is %@ - %@", v38, v39, v40, v41, v42, v43, v44, (uint64_t)v6);

      [(SUScanner *)self unscheduleRecommendedUpdateNotification];
    }
    else
    {
      SULogInfo(@"Found new recommended update:%@", v18, v19, v20, v21, v22, v23, v24, v17);
    }
    [(SUScanner *)self scheduleRecommendedUpdateNotification:v47];
  }
  else if (v6)
  {
    SULogInfo(@"Last recommended update was:%@, but no recommended update found", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v6);
    [(SUScanner *)self unscheduleRecommendedUpdateNotification];
  }
  else
  {
    SULogInfo(@"No recommended update", v10, v11, v12, v13, v14, v15, v16, v45);
  }
LABEL_13:
}

+ (int)typeForCoreDescriptor:(id)a3
{
  id v3 = a3;
  if ([v3 splatOnly])
  {
    int v4 = 4;
  }
  else
  {
    unint64_t v5 = [v3 updateType];
    if (v5 >= 6)
    {
      [v3 updateType];
      SULogInfo(@"%s: unknown update type:%ld", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"+[SUScanner typeForCoreDescriptor:]");
      int v4 = 0;
    }
    else
    {
      int v4 = dword_21DDCF568[v5];
    }
  }

  return v4;
}

- (BOOL)lastScannedMatchScanOptions:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SUScanner *)self preferredLastScannedCoreDescriptor];
  uint64_t v6 = +[SUScanner typeForCoreDescriptor:v5];

  uint64_t v7 = [(SUScanner *)self alternateLastScannedCoreDescriptor];
  uint64_t v8 = +[SUScanner typeForCoreDescriptor:v7];

  uint64_t v9 = [(SUScanner *)self preferredLastScannedCoreDescriptor];
  uint64_t v25 = [(SUScanner *)self alternateLastScannedCoreDescriptor];
  SULogInfo(@"%s: current scan options:%@ lastPreferred:%@ lastAlternate:%@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUScanner lastScannedMatchScanOptions:]");

  uint64_t v17 = [(SUScanner *)self preferredLastScannedCoreDescriptor];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    int v19 = [v4 containsType:v6];

    if (!v19) {
      goto LABEL_6;
    }
  }
  uint64_t v20 = [(SUScanner *)self alternateLastScannedCoreDescriptor];
  if (v20 && (uint64_t v21 = (void *)v20, v22 = [v4 containsType:v8], v21, !v22)) {
LABEL_6:
  }
    BOOL v23 = 0;
  else {
    BOOL v23 = 1;
  }

  return v23;
}

- (void)scanCompleted:(id)a3 alternateDescriptor:(id)a4 scanOptions:(id)a5 error:(id)a6
{
  uint64_t v297 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(SUScanner *)self core];
  uint64_t v15 = [v14 workQueue];
  dispatch_assert_queue_V2(v15);

  if ([v10 updateType] <= 2 && objc_msgSend(v11, "updateType") < 3)
  {
    BOOL v23 = [(SUScanner *)self core];
    uint64_t v24 = [v23 state];
    uint64_t v25 = [MEMORY[0x263EFF910] date];
    [v24 setLastScanDate:v25];
  }
  else
  {
    SULogInfo(@"Found emergency updates, not setting last scan date", v16, v17, v18, v19, v20, v21, v22, v263);
  }
  uint64_t v26 = [(SUScanner *)self activeScanTask];
  uint64_t v27 = [v26 didScanForType:4];

  int v28 = [(SUScanner *)self activeScanTask];
  if ([v28 didScanForType:0])
  {
    uint64_t v29 = 1;
  }
  else
  {
    uint64_t v30 = [(SUScanner *)self activeScanTask];
    if ([v30 didScanForType:2])
    {
      uint64_t v29 = 1;
    }
    else
    {
      [(SUScanner *)self activeScanTask];
      v32 = id v31 = v10;
      uint64_t v29 = [v32 didScanForType:1];

      id v10 = v31;
    }
  }
  [(SUScanner *)self setScanning:0];
  [(SUScanner *)self setActiveScanTask:0];
  uint64_t v40 = off_26447C000;
  if ([v10 isRevokedSplat])
  {
    SULogInfo(@"Found revoked splat update", v33, v34, v35, v36, v37, v38, v39, v263);
    uint64_t v41 = +[SUUtility errorWithCode:3];

    uint64_t v42 = [(SUScanner *)self core];
    [v42 revokedUpdateFound:v10];

    id v13 = (id)v41;
  }
  if (!v13)
  {
    int v272 = v29;
    if ([(SUScanner *)self shouldPresentUpdate:v10 options:v12])
    {
      if (![(SUScanner *)self shouldPresentUpdate:v11 options:v12])
      {
LABEL_41:

        v75 = 0;
        if (!v10)
        {
          char v110 = 0;
          BOOL v117 = 1;
          id v11 = 0;
          id v10 = 0;
          goto LABEL_149;
        }
        id v11 = 0;
LABEL_43:
        uint64_t v76 = [(SUScanner *)self core];
        uint64_t v77 = [v76 download];

        uint64_t v78 = [v77 progress];
        int v279 = [v78 isDone];

        uint64_t v79 = [v77 progress];
        uint64_t v80 = [v79 phase];

        v271 = v80;
        if (!v77) {
          goto LABEL_60;
        }
        uint64_t v88 = @"NO";
        if (v279) {
          uint64_t v88 = @"YES";
        }
        v266 = v80;
        SULogInfo(@"DownloadDone: %@ ProgressPhase: %@", v81, v82, v83, v84, v85, v86, v87, (uint64_t)v88);
        if (v279
          && [(__CFString *)v80 isEqualToString:@"SUDownloadPhasePreparingForInstallation"])
        {
          SULogInfo(@"Scan found an update and a previously prepared update is present", v81, v82, v83, v84, v85, v86, v87, v263);
          if (+[SUUtility currentReleaseTypeIsInternal])
          {
            uint64_t v89 = +[SUPreferences sharedInstance];
            char v90 = [v89 disablePurgeOnNewerUpdateFound];

            if (v90)
            {
              uint64_t v91 = [(SUScanner *)self preferredLastScannedCoreDescriptor];
              uint64_t v92 = [(SUScanner *)self alternateLastScannedCoreDescriptor];
              v75 = [[SUCoreScanResults alloc] initWithPreferredDescriptor:v91 alternateDescriptor:v92];
              SULogInfo(@"Ignoring update located by scan due to existing prepared update (disablePurgeOnNewerUpdateFound is set)", v93, v94, v95, v96, v97, v98, v99, v264);
              v107 = @"Present";
              if (v91) {
                id v108 = @"Present";
              }
              else {
                id v108 = @"nil";
              }
              if (v92) {
                v109 = @"Present";
              }
              else {
                v109 = @"nil";
              }
              if (!v75) {
                v107 = @"nil";
              }
              v266 = v109;
              v267 = v107;
              SULogInfo(@"lastPreferred: %@ lastAlternate: %@ results: %@", v100, v101, v102, v103, v104, v105, v106, (uint64_t)v108);

              if (v75)
              {

                char v110 = 1;
                id v13 = 0;
LABEL_144:
                v239 = [(SUCoreScanResults *)v75 preferredDescriptor];
                if (v239)
                {
                  BOOL v117 = 0;
                }
                else
                {
                  v240 = [(SUCoreScanResults *)v75 alternateDescriptor];
                  BOOL v117 = v240 == 0;
                }
                goto LABEL_149;
              }
              char v111 = 1;
            }
            else
            {
              char v111 = 0;
            }
            id v13 = 0;
LABEL_62:
            v75 = [[SUCoreScanResults alloc] initWithPreferredDescriptor:v10 alternateDescriptor:v11];
            if (!v77 || (v111 & 1) != 0)
            {
              __int16 v289 = 0;
              __int16 v288 = 0;
              __int16 v287 = 0;
              if (v111)
              {
                char v110 = 1;
                goto LABEL_141;
              }
            }
            else
            {
              id v274 = v12;
              [v77 descriptor];
              v113 = v112 = v10;
              v114 = [v113 productBuildVersion];
              v281 = v112;
              [v112 productBuildVersion];
              v116 = v115 = v77;
              if ([v114 isEqual:v116])
              {

                __int16 v289 = 0;
                __int16 v288 = 0;
                __int16 v287 = 0;
                id v12 = v274;
                id v10 = v281;
                uint64_t v77 = v115;
              }
              else
              {
                id v276 = v13;
                v268 = v115;
                v127 = [v115 descriptor];
                v128 = [v127 productBuildVersion];
                v129 = [v11 productBuildVersion];
                char v130 = [v128 isEqual:v129];

                if (v130)
                {
                  __int16 v289 = 0;
                  __int16 v288 = 0;
                  __int16 v287 = 0;
                  id v12 = v274;
                  id v13 = v276;
                  id v10 = v281;
                  uint64_t v40 = off_26447C000;
                  uint64_t v77 = v268;
                }
                else
                {
                  SULogInfo(@"Update found was newer than curently download(ed|ing) update.  Attempting to cancel download.", v131, v132, v133, v134, v135, v136, v137, v264);
                  v138 = [(SUScanner *)self core];
                  id v290 = 0;
                  int v139 = [v138 killDownload:0 userRequested:0 keepDocAssets:1 forUpdates:v75 error:&v290];
                  id v140 = v290;

                  id v12 = v274;
                  if (v139)
                  {
                    SULogInfo(@"Current download is successfully canceled.", v141, v142, v143, v144, v145, v146, v147, v265);
                  }
                  else
                  {
                    SULogInfo(@"Unable to cancel download: %@", v141, v142, v143, v144, v145, v146, v147, (uint64_t)v140);
                    v148 = [(SUScanner *)self core];
                    [v148 cleanupPreviousDownloadState];
                  }
                  id v13 = v276;
                  uint64_t v40 = off_26447C000;
                  uint64_t v77 = v268;
                  v149 = [(SUScanner *)self core];
                  [v149 updateInstallPolicyType:0];

                  __int16 v289 = 0;
                  __int16 v288 = 0;
                  __int16 v287 = 0;
                  id v10 = v281;
                }
              }
            }
            if (-[SUScanner scanResultsChangedSinceLastScan:preferredUpdateNewlyDiscovered:alternateUpdateNewlyDiscovered:preferredUpdateChanged:alternateUpdateChanged:preferredWasAlternate:alternateWasPreferred:](self, "scanResultsChangedSinceLastScan:preferredUpdateNewlyDiscovered:alternateUpdateNewlyDiscovered:preferredUpdateChanged:alternateUpdateChanged:preferredWasAlternate:alternateWasPreferred:", v75, (char *)&v289 + 1, &v289, (char *)&v288 + 1, &v288, (char *)&v287 + 1, &v287, v266, v267))
            {
              [(SUScanner *)self setPreferredLastScannedCoreDescriptor:v10];
              [(SUScanner *)self setAlternateLastScannedCoreDescriptor:v11];
              SULogInfo(@"%s: Setting last scan descriptors, preferred:%@, alternate:%@", v150, v151, v152, v153, v154, v155, v156, (uint64_t)"-[SUScanner scanCompleted:alternateDescriptor:scanOptions:error:]");
              id v277 = v13;
              if (HIBYTE(v288))
              {
                v157 = [(SUCoreScanResults *)v75 preferredDescriptor];
                if (v157) {
                  BOOL v158 = HIBYTE(v287) == 0;
                }
                else {
                  BOOL v158 = 0;
                }
                int v159 = v158;

                if (!(_BYTE)v288)
                {
                  v160 = v77;
                  if ((v159 & 1) == 0)
                  {
                    int v161 = 0;
LABEL_109:
                    uint64_t v77 = v160;
                    goto LABEL_110;
                  }
                  goto LABEL_103;
                }
              }
              else
              {
                int v159 = 0;
                int v161 = 0;
                if (!(_BYTE)v288)
                {
LABEL_110:
                  id v173 = v10;
                  v174 = +[SUPreferences sharedInstance];
                  int v175 = [v174 isAutoDownloadDisabled];
                  if (v161 && v175)
                  {
                    BOOL v176 = [(SUScanner *)self scanResultIsUpToDateWithAlternate:v75];

                    if (v176)
                    {
LABEL_115:
                      v282 = [MEMORY[0x263EFF910] date];
                      v178 = [(SUCoreScanResults *)v75 preferredDescriptor];
                      int v179 = HIBYTE(v289);

                      if (v178 && v179)
                      {
                        v180 = [(SUCoreScanResults *)v75 preferredDescriptor];
                        v181 = [v180 productBuildVersion];
                        [(SUScanner *)self setDiscoveryDate:v282 forBuildVersion:v181];
                      }
                      v182 = [(SUCoreScanResults *)v75 alternateDescriptor];
                      int v183 = v289;

                      id v10 = v173;
                      if (v182 && v183)
                      {
                        v184 = [(SUCoreScanResults *)v75 alternateDescriptor];
                        v185 = [v184 productBuildVersion];
                        [(SUScanner *)self setDiscoveryDate:v282 forBuildVersion:v185];
                      }
                      v186 = [(SUCoreScanResults *)v75 preferredDescriptor];
                      if (!v186 || (int v187 = HIBYTE(v289) | HIBYTE(v288), v186, !v187))
                      {
LABEL_130:
                        v211 = [(SUCoreScanResults *)v75 alternateDescriptor];
                        if (!v211) {
                          goto LABEL_138;
                        }
                        int v212 = v289 | v288;

                        if (!v212) {
                          goto LABEL_138;
                        }
                        v270 = v77;
                        v213 = [(SUCoreScanResults *)v75 alternateDescriptor];
                        if ([v213 granularlyRamped])
                        {
                        }
                        else
                        {
                          v214 = [(SUCoreScanResults *)v75 alternateDescriptor];
                          char v215 = [v214 rampEnabled];

                          if ((v215 & 1) == 0)
                          {
                            v227 = [(SUCoreScanResults *)v75 alternateDescriptor];
                            v228 = [v227 productBuildVersion];
                            SULogInfo(@"[scanCompleted] %@ is fully unramped!", v229, v230, v231, v232, v233, v234, v235, (uint64_t)v228);

                            v225 = [(SUCoreScanResults *)v75 alternateDescriptor];
                            v226 = [v225 productBuildVersion];
                            [(SUScanner *)self setFullyUnrampedDate:v282 forBuildVersion:v226];
                            goto LABEL_137;
                          }
                        }
                        v216 = [(SUCoreScanResults *)v75 alternateDescriptor];
                        v217 = [v216 productBuildVersion];
                        SULogInfo(@"[scanCompleted] %@ is not fully unramped.", v218, v219, v220, v221, v222, v223, v224, (uint64_t)v217);

                        v225 = [(SUCoreScanResults *)v75 alternateDescriptor];
                        v226 = [v225 productBuildVersion];
                        [(SUScanner *)self removeFullyUnrampedDateForBuildVersion:v226];
LABEL_137:

                        id v10 = v173;
                        uint64_t v77 = v270;
LABEL_138:
                        [(SUScanner *)self setLastScannedDescriptorScanOptions:v12];
                        if (v161)
                        {
                          v236 = [(SUScanner *)self core];
                          [v236 adoptPotentialSessionID];

                          v237 = [(SUScanner *)self core];
                          [v237 reportOTAAvailableEvent:v75];

                          v238 = [(SUScanner *)self core];
                          [v238 reportCoreAnalyticsOTAAvailableEvent:v75];
                        }
                        char v110 = 0;
                        id v13 = v277;
                        uint64_t v40 = off_26447C000;
                        goto LABEL_141;
                      }
                      v269 = v77;
                      v188 = [(SUCoreScanResults *)v75 preferredDescriptor];
                      if ([v188 granularlyRamped])
                      {
                      }
                      else
                      {
                        v189 = [(SUCoreScanResults *)v75 preferredDescriptor];
                        char v190 = [v189 rampEnabled];

                        if ((v190 & 1) == 0)
                        {
                          v202 = [(SUCoreScanResults *)v75 preferredDescriptor];
                          v203 = [v202 productBuildVersion];
                          SULogInfo(@"[scanCompleted] %@ is fully unramped.", v204, v205, v206, v207, v208, v209, v210, (uint64_t)v203);

                          v200 = [(SUCoreScanResults *)v75 preferredDescriptor];
                          v201 = [v200 productBuildVersion];
                          [(SUScanner *)self setFullyUnrampedDate:v282 forBuildVersion:v201];
                          goto LABEL_129;
                        }
                      }
                      v191 = [(SUCoreScanResults *)v75 preferredDescriptor];
                      v192 = [v191 productBuildVersion];
                      SULogInfo(@"[scanCompleted] %@ is not fully unramped.", v193, v194, v195, v196, v197, v198, v199, (uint64_t)v192);

                      v200 = [(SUCoreScanResults *)v75 preferredDescriptor];
                      v201 = [v200 productBuildVersion];
                      [(SUScanner *)self removeFullyUnrampedDateForBuildVersion:v201];
LABEL_129:

                      id v10 = v173;
                      uint64_t v77 = v269;
                      goto LABEL_130;
                    }
                    v174 = [(SUScanner *)self core];
                    v177 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v173];
                    [v174 badgeSettingsForManualSoftwareUpdate:v177];
                  }
                  goto LABEL_115;
                }
              }
              v160 = v77;
              id v162 = v11;
              v163 = [(SUCoreScanResults *)v75 alternateDescriptor];
              int v164 = v287;

              if (v163) {
                BOOL v165 = v164 == 0;
              }
              else {
                BOOL v165 = 0;
              }
              char v166 = v165;
              if (v165) {
                int v161 = 1;
              }
              else {
                int v161 = v159;
              }
              id v11 = v162;
              if ((v159 & 1) == 0) {
                goto LABEL_109;
              }
              if (v166)
              {
LABEL_104:
                v167 = [(SUScanner *)self core];
                if (([v167 isDownloading] & 1) == 0)
                {
                  v168 = [(SUScanner *)self core];
                  char v169 = [v168 isUpdateDownloaded];

                  if (v169)
                  {
LABEL_108:
                    int v161 = 1;
                    goto LABEL_109;
                  }
                  v170 = [(SUScanner *)self core];
                  [v170 endAutoDownloadTasksAndResetState];

                  v171 = [(SUScanner *)self core];
                  [v171 clearUnlockCallbacks];

                  v172 = [(SUScanner *)self core];
                  [v172 updateInstallPolicyType:0];

                  v167 = [(SUScanner *)self core];
                  [v167 clearKeybagStash];
                }
LABEL_107:

                goto LABEL_108;
              }
LABEL_103:
              v167 = [(SUCoreScanResults *)v75 alternateDescriptor];
              if (v167) {
                goto LABEL_107;
              }
              goto LABEL_104;
            }
            char v110 = 0;
LABEL_141:
            if ((v279 & 1) == 0) {
              [(SUScanner *)self scheduleRecommendedUpdateFromResults:v75];
            }

            if (v75) {
              goto LABEL_144;
            }
            BOOL v117 = 1;
LABEL_149:
            if (((!v117 | v272) & 1) != 0
              || [(SUScanner *)self lastScannedMatchScanOptions:v12])
            {
              if ((v110 & 1) == 0)
              {
                [(SUScanner *)self setPreferredLastScannedCoreDescriptor:v10];
                [(SUScanner *)self setAlternateLastScannedCoreDescriptor:v11];
                SULogInfo(@"%s: Setting last scan descriptors, preferred:%@, alternate:%@", v248, v249, v250, v251, v252, v253, v254, (uint64_t)"-[SUScanner scanCompleted:alternateDescriptor:scanOptions:error:]");
              }
            }
            else
            {
              SULogInfo(@"%s: scan for emergency or splat only update ended with no results and previous scan is not of the same type, ignore current scan result and keep the previous one", v241, v242, v243, v244, v245, v246, v247, (uint64_t)"-[SUScanner scanCompleted:alternateDescriptor:scanOptions:error:]");
            }
            v278 = v11;
            v280 = v10;
            if (v117)
            {
              uint64_t v43 = [(__objc2_class *)v40[83] errorWithCode:3];
            }
            else
            {
              uint64_t v43 = 0;
            }
            goto LABEL_157;
          }
        }
        else
        {
LABEL_60:
          SULogInfo(@"Scan found an update and no previously prepared update is present", v81, v82, v83, v84, v85, v86, v87, v263);
        }
        char v111 = 0;
        goto LABEL_62;
      }
      if (v10) {
        goto LABEL_43;
      }
    }
    else
    {

      if (![(SUScanner *)self shouldPresentUpdate:v11 options:v12])
      {
        id v10 = 0;
        goto LABEL_41;
      }
    }
    id v10 = v11;
    goto LABEL_41;
  }
  uint64_t v43 = +[SUUtility translateError:v13];
  if ([v12 isSplatOnlyScan] && objc_msgSend(v43, "isCatalogNotFound"))
  {
    SULogInfo(@"Scanning for splat update, catalog not found: %@", v44, v45, v46, v47, v48, v49, v50, (uint64_t)v43);
    uint64_t v51 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:3 userInfo:0];

    uint64_t v43 = (void *)v51;
  }
  v278 = v11;
  v280 = v10;
  if ([v43 code] == 3)
  {
    if ([v12 isEmergencyOnlyScan])
    {
      v66 = @"No emergency update found";
    }
    else
    {
      if (![v12 ignoreNoUpdateFoundResult])
      {
        SULogInfo(@"Device is up to date", v59, v60, v61, v62, v63, v64, v65, v263);
        [(SUScanner *)self setPreferredLastScannedCoreDescriptor:0];
        [(SUScanner *)self setAlternateLastScannedCoreDescriptor:0];
        SULogInfo(@"%s: Setting last scan descriptors to nil", v118, v119, v120, v121, v122, v123, v124, (uint64_t)"-[SUScanner scanCompleted:alternateDescriptor:scanOptions:error:]");
        if (v29) {
          [(SUScanner *)self scheduleRecommendedUpdateFromResults:0];
        }
        v125 = [(SUScanner *)self core];
        [v125 deviceIsUpToDateForSU:v29 forSplat:v27];

        v126 = [(SUScanner *)self core];
        [v126 dismissInsufficientDiskSpaceFollowupForUpdate:0 orForce:1];

        goto LABEL_72;
      }
      v66 = @"Ignoring no update found result due to scan options";
    }
    SULogInfo(v66, v59, v60, v61, v62, v63, v64, v65, v263);
LABEL_72:
    v75 = 0;
    goto LABEL_157;
  }
  id v273 = v12;
  id v275 = v13;
  SULogInfo(@"Error scanning for update: %@", v52, v53, v54, v55, v56, v57, v58, (uint64_t)v43);
  long long v293 = 0u;
  long long v294 = 0u;
  long long v291 = 0u;
  long long v292 = 0u;
  v67 = self->_scanRequests;
  uint64_t v68 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v291 objects:v296 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v292;
    while (2)
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v292 != v70) {
          objc_enumerationMutation(v67);
        }
        uint64_t v72 = [*(id *)(*((void *)&v291 + 1) + 8 * i) options];
        uint64_t v73 = [v72 identifier];
        char v74 = [v73 isEqualToString:@"com.apple.softwareupdate.autoscan"];

        if ((v74 & 1) == 0)
        {
          [(SUScanner *)self _handleScanError:v43];

          goto LABEL_34;
        }
      }
      uint64_t v69 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v291 objects:v296 count:16];
      if (v69) {
        continue;
      }
      break;
    }
  }
LABEL_34:

  v75 = 0;
  id v12 = v273;
  id v13 = v275;
LABEL_157:
  long long v285 = 0u;
  long long v286 = 0u;
  long long v283 = 0u;
  long long v284 = 0u;
  v255 = self->_scanRequests;
  uint64_t v256 = [(NSMutableArray *)v255 countByEnumeratingWithState:&v283 objects:v295 count:16];
  if (v256)
  {
    uint64_t v257 = v256;
    uint64_t v258 = *(void *)v284;
    do
    {
      for (uint64_t j = 0; j != v257; ++j)
      {
        if (*(void *)v284 != v258) {
          objc_enumerationMutation(v255);
        }
        v260 = *(void **)(*((void *)&v283 + 1) + 8 * j);
        [v260 setResults:v75];
        [v260 setError:v43];
        [(SUScanner *)self notifyScanRequestDidFinish:v260 results:v75 error:v43];
      }
      uint64_t v257 = [(NSMutableArray *)v255 countByEnumeratingWithState:&v283 objects:v295 count:16];
    }
    while (v257);
  }

  [(SUScanner *)self notifyScanDidComplete:v75 options:v12 error:v43];
  v261 = [(SUScanner *)self core];
  v262 = [v261 state];
  [v262 save];

  [(NSMutableArray *)self->_scanRequests removeAllObjects];
}

- (BOOL)scanResultsChangedSinceLastScan:(id)a3 preferredUpdateNewlyDiscovered:(BOOL *)a4 alternateUpdateNewlyDiscovered:(BOOL *)a5 preferredUpdateChanged:(BOOL *)a6 alternateUpdateChanged:(BOOL *)a7 preferredWasAlternate:(BOOL *)a8 alternateWasPreferred:(BOOL *)a9
{
  id v11 = a3;
  id v12 = [v11 preferredDescriptor];

  uint64_t v65 = a7;
  if (v12)
  {
    discoveryDateManager = self->_discoveryDateManager;
    uint64_t v21 = [v11 preferredDescriptor];
    uint64_t v22 = [v21 productBuildVersion];
    LOBYTE(discoveryDateManager) = [(SUUpdateDiscoveryDateManager *)discoveryDateManager containsBuildVersion:v22];
    char v23 = discoveryDateManager ^ 1;

    if ((discoveryDateManager & 1) == 0) {
      SULogInfo(@"scanResultsChangedSinceLastScan: Preferred update is newly discovered", v24, v25, v26, v27, v28, v29, v30, v64);
    }
    id v31 = [v11 preferredDescriptor];
    char v32 = [v31 isEqualToDescriptor:self->_preferredLastScannedCoreDescriptor];

    if (v32)
    {
      unsigned int v33 = 0;
      LOBYTE(v34) = 0;
      goto LABEL_14;
    }
    uint64_t v36 = [v11 preferredDescriptor];
    int v34 = [v36 isEqualToDescriptor:self->_alternateLastScannedCoreDescriptor];

    if (v34) {
      uint64_t v35 = @"scanResultsChangedSinceLastScan: Preferred update was previously the alternate update";
    }
    else {
      uint64_t v35 = @"scanResultsChangedSinceLastScan: Preferred update has changed";
    }
    unsigned int v33 = v34 ^ 1;
    goto LABEL_12;
  }
  char v23 = 0;
  if (self->_preferredLastScannedCoreDescriptor)
  {
    unsigned int v33 = 1;
    uint64_t v35 = @"scanResultsChangedSinceLastScan: Preferred update is newly null";
    LOBYTE(v34) = 0;
LABEL_12:
    SULogInfo(v35, v13, v14, v15, v16, v17, v18, v19, v64);
    goto LABEL_14;
  }
  unsigned int v33 = 0;
  LOBYTE(v34) = 0;
LABEL_14:
  uint64_t v37 = [v11 alternateDescriptor];

  if (!v37)
  {
    char v48 = 0;
    if (!self->_alternateLastScannedCoreDescriptor)
    {
      char v58 = 0;
      LOBYTE(v59) = 0;
      goto LABEL_27;
    }
    char v58 = 1;
    uint64_t v60 = @"scanResultsChangedSinceLastScan: Alternate update is newly null";
    LOBYTE(v59) = 0;
LABEL_25:
    uint64_t v62 = v65;
    SULogInfo(v60, v38, v39, v40, v41, v42, v43, v44, v64);
    goto LABEL_28;
  }
  uint64_t v45 = self->_discoveryDateManager;
  uint64_t v46 = [v11 alternateDescriptor];
  uint64_t v47 = [v46 productBuildVersion];
  LOBYTE(v45) = [(SUUpdateDiscoveryDateManager *)v45 containsBuildVersion:v47];
  char v48 = v45 ^ 1;

  if ((v45 & 1) == 0) {
    SULogInfo(@"scanResultsChangedSinceLastScan: Alternate update is newly discovered", v49, v50, v51, v52, v53, v54, v55, v64);
  }
  uint64_t v56 = [v11 alternateDescriptor];
  char v57 = [v56 isEqualToDescriptor:self->_alternateLastScannedCoreDescriptor];

  if ((v57 & 1) == 0)
  {
    uint64_t v61 = [v11 alternateDescriptor];
    int v59 = [v61 isEqualToDescriptor:self->_preferredLastScannedCoreDescriptor];

    if (v59) {
      uint64_t v60 = @"scanResultsChangedSinceLastScan: Alternate update was previously the preferred update";
    }
    else {
      uint64_t v60 = @"scanResultsChangedSinceLastScan: Alternate update has changed";
    }
    char v58 = v59 ^ 1;
    goto LABEL_25;
  }
  char v58 = 0;
  LOBYTE(v59) = 0;
LABEL_27:
  uint64_t v62 = v65;
LABEL_28:
  if (a8) {
    *a8 = v34;
  }
  if (a9) {
    *a9 = v59;
  }
  if (a4) {
    *a4 = v23;
  }
  if (a5) {
    *a5 = v48;
  }
  if (a6) {
    *a6 = v33;
  }
  if (v62) {
    *uint64_t v62 = v58;
  }
  SULogInfo(@"scanResultsChangedSinceLastScan: pc=%d, ac=%d, pwa=%d, awp=%d, pnd=%d, and=%d", v38, v39, v40, v41, v42, v43, v44, v33);

  return v59 | v34 | v33 | v58 | v23 | v48;
}

- (BOOL)scanResultIsUpToDateWithAlternate:(id)a3
{
  id v3 = a3;
  id v4 = [v3 preferredDescriptor];
  if (v4)
  {
    unint64_t v5 = [v3 alternateDescriptor];
    if (v5)
    {
      BOOL v6 = 0;
    }
    else
    {
      uint64_t v7 = [v3 preferredDescriptor];
      if ([v7 promoteAlternateUpdate])
      {
        uint64_t v8 = [v3 preferredDescriptor];
        BOOL v6 = [v8 descriptorAudienceType] == 1;
      }
      else
      {
        BOOL v6 = 0;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_doScanForUpdates
{
  id v3 = [(SUScanner *)self activeScanTask];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__SUScanner__doScanForUpdates__block_invoke;
  v4[3] = &unk_26447E168;
  v4[4] = self;
  [v3 scanForSUAssetWithCompletion:v4];
}

uint64_t __30__SUScanner__doScanForUpdates__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return [*(id *)(a1 + 32) handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor:a2 preferredSecondaryDescriptor:a3 alternatePrimaryDescriptor:a4 alternateSecondaryDescriptor:a5 scanOptions:a6 error:a7];
}

- (void)scanForUpdates:(id)a3 shouldUseDDMInState:(BOOL)a4 complete:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [(SUScanner *)self core];
  id v10 = [v9 workQueue];
  dispatch_assert_queue_V2(v10);

  if (v7)
  {
    id v11 = [(SUScanner *)self core];
    int v12 = [v11 isInstalling];

    if (!v12)
    {
      if (([v7 clientIsBuddy] & 1) != 0 || -[SUScanner isBuddyRunning](self, "isBuddyRunning"))
      {
        if ([v7 isSplatOnlyScan])
        {
          SULogInfo(@"%s: don't scan for splats for buddy", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUScanner scanForUpdates:shouldUseDDMInState:complete:]");
          if (v8)
          {
            uint64_t v13 = [(SUScanner *)self core];
            uint64_t v14 = [v13 externWorkQueue];
            v53[0] = MEMORY[0x263EF8330];
            v53[1] = 3221225472;
            v53[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_3;
            v53[3] = &unk_26447D4F8;
            uint64_t v15 = &v54;
            id v54 = v8;
            uint64_t v16 = v53;
            goto LABEL_22;
          }
          goto LABEL_24;
        }
        SULogInfo(@"%s: client is buddy or buddy is running; disable splombo and psus for this scan",
          v17,
          v18,
          v19,
          v20,
          v21,
          v22,
          v23,
          (uint64_t)"-[SUScanner scanForUpdates:shouldUseDDMInState:complete:]");
        [v7 setDisableSplatCombo:1];
        [v7 setDisablePreSoftwareUpdateStaging:1];
      }
      if ([v7 clientIsBuddy])
      {
        SULogInfo(@"%s: skipping network check because this is buddy", v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[SUScanner scanForUpdates:shouldUseDDMInState:complete:]");
      }
      else
      {
        id v31 = +[SUNetworkMonitor sharedInstance];
        int v32 = [v31 currentNetworkType];

        if (!v32)
        {
          SULogInfo(@"network unavailable canceling scan", v33, v34, v35, v36, v37, v38, v39, v43);
          if (v8)
          {
            uint64_t v13 = [(SUScanner *)self core];
            uint64_t v14 = [v13 externWorkQueue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_4;
            block[3] = &unk_26447D4F8;
            uint64_t v15 = &v52;
            id v52 = v8;
            uint64_t v16 = block;
            goto LABEL_22;
          }
          goto LABEL_24;
        }
      }
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_5;
      v49[3] = &unk_26447E190;
      uint64_t v15 = &v50;
      id v40 = v8;
      v49[4] = self;
      id v50 = v40;
      uint64_t v41 = (void (**)(void, void))MEMORY[0x223C18480](v49);
      if ([v7 clientIsDDM])
      {
        ((void (**)(void, id))v41)[2](v41, v7);
      }
      else
      {
        uint64_t v42 = [(SUScanner *)self core];
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_6;
        v44[3] = &unk_26447E1B8;
        id v45 = v7;
        uint64_t v46 = self;
        id v47 = v40;
        char v48 = v41;
        [v42 amendManagedScanOptions:v45 withResponse:v44];
      }
      goto LABEL_23;
    }
    if (v8)
    {
      uint64_t v13 = [(SUScanner *)self core];
      uint64_t v14 = [v13 externWorkQueue];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_2;
      v55[3] = &unk_26447D4F8;
      uint64_t v15 = &v56;
      id v56 = v8;
      uint64_t v16 = v55;
LABEL_22:
      dispatch_async(v14, v16);

LABEL_23:
    }
  }
  else if (v8)
  {
    uint64_t v13 = [(SUScanner *)self core];
    uint64_t v14 = [v13 externWorkQueue];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke;
    v57[3] = &unk_26447D4F8;
    uint64_t v15 = &v58;
    id v58 = v8;
    uint64_t v16 = v57;
    goto LABEL_22;
  }
LABEL_24:
}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[SUUtility errorWithCode:22];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[SUUtility errorWithCode:14];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[SUUtility errorWithCode:3];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[SUUtility errorWithCode:26];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_5(uint64_t a1, void *a2)
{
  id v49 = a2;
  id v3 = objc_alloc_init(SUManagerScanRequest);
  [(SUManagerScanRequest *)v3 setOptions:v49];
  [(SUManagerScanRequest *)v3 setCallback:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:v3];
  id v4 = [*(id *)(a1 + 32) core];
  unint64_t v5 = [v4 createpotentialNextSessionID];

  [v49 setSessionID:v5];
  BOOL v6 = [[SUScanTask alloc] initWithOptions:v49];
  id v7 = [*(id *)(a1 + 32) activeScanTask];

  if (!v7) {
    goto LABEL_4;
  }
  uint64_t v15 = [*(id *)(a1 + 32) activeScanTask];
  uint64_t v16 = [v15 scanPriority];
  uint64_t v17 = [(SUScanTask *)v6 scanPriority];

  uint64_t v18 = *(void **)(a1 + 32);
  if (v16 < v17)
  {
    uint64_t v19 = [*(id *)(a1 + 32) activeScanTask];
    uint64_t v20 = objc_msgSend(v18, "stringForScanPriority:", objc_msgSend(v19, "scanPriority"));
    id v47 = objc_msgSend(*(id *)(a1 + 32), "stringForScanPriority:", -[SUScanTask scanPriority](v6, "scanPriority"));
    SULogInfo(@"Canceling active scan (%@) in favor of higher priority scan (%@)", v21, v22, v23, v24, v25, v26, v27, (uint64_t)v20);

    uint64_t v28 = [*(id *)(a1 + 32) activeScanTask];
    [v28 cancelTask];

LABEL_4:
    SULogInfo(@"Scanning for new OTA software update...", v8, v9, v10, v11, v12, v13, v14, v46);
    SULogInfo(@"Scan Options: %@", v29, v30, v31, v32, v33, v34, v35, (uint64_t)v49);
    [*(id *)(a1 + 32) setScanning:1];
    [*(id *)(a1 + 32) setActiveScanTask:v6];
    [*(id *)(a1 + 32) notifyScanRequestDidStart:v3];
    [*(id *)(a1 + 32) _doScanForUpdates];
    goto LABEL_6;
  }
  uint64_t v36 = objc_msgSend(v18, "stringForScanPriority:", -[SUScanTask scanPriority](v6, "scanPriority"));
  uint64_t v37 = *(void **)(a1 + 32);
  uint64_t v38 = [v37 activeScanTask];
  char v48 = objc_msgSend(v37, "stringForScanPriority:", objc_msgSend(v38, "scanPriority"));
  SULogInfo(@"Coalescing scan %@ with %@ scan", v39, v40, v41, v42, v43, v44, v45, (uint64_t)v36);

  [*(id *)(a1 + 32) notifyScanRequestDidStart:v3];
LABEL_6:
}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isSplatOnlyScan]
    && ([*(id *)(a1 + 32) MDMShowRapidSecurityResponse] & 1) == 0)
  {
    SULogInfo(@"Splat-only asset scan disabled by device management", v4, v5, v6, v7, v8, v9, v10, v13);
    if (*(void *)(a1 + 48))
    {
      uint64_t v11 = [*(id *)(a1 + 40) core];
      uint64_t v12 = [v11 externWorkQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_7;
      block[3] = &unk_26447D4F8;
      id v15 = *(id *)(a1 + 48);
      dispatch_async(v12, block);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[SUUtility errorWithCode:3];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)scanForUpdates:(id)a3 complete:(id)a4
{
}

- (void)handleActiveScanTaskDocumentationFor:(id)a3 withOptions:(id)a4 withSelectedDescriptorCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__14;
  uint64_t v40 = __Block_byref_object_dispose__14;
  id v41 = [v8 objectForKeyedSubscript:@"Primary"];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__14;
  v34[4] = __Block_byref_object_dispose__14;
  id v35 = 0;
  if ([(SUScanner *)self _coreDescriptorFailedPatching:v37[5]])
  {
    uint64_t v11 = +[SUPreferences sharedInstance];
    char v12 = [v11 disableFullReplacementFallback];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [v8 objectForKeyedSubscript:@"Secondary"];
      uint64_t v14 = (void *)v37[5];
      v37[5] = v13;
    }
  }
  id v15 = (void *)v37[5];
  if (!v15)
  {
    uint64_t v17 = 0;
    goto LABEL_8;
  }
  uint64_t v16 = [v15 documentation];

  if (!v16)
  {
    if ([v9 clientIsBuddy])
    {
      uint64_t v18 = +[SUNetworkMonitor sharedInstance];
      if ([v18 isBootstrap])
      {
        uint64_t v19 = +[SUNetworkMonitor sharedInstance];
        char v20 = [v19 isPathSatisfied];

        if ((v20 & 1) == 0)
        {
          SULogInfo(@"Skip loading documentation for buddy on bootstrap network", v21, v22, v23, v24, v25, v26, v27, v30[0]);
          goto LABEL_6;
        }
      }
      else
      {
      }
    }
    uint64_t v28 = [(SUScanner *)self activeScanTask];
    uint64_t v29 = v37[5];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = (uint64_t)__95__SUScanner_handleActiveScanTaskDocumentationFor_withOptions_withSelectedDescriptorCompletion___block_invoke;
    v30[3] = (uint64_t)&unk_26447E208;
    uint64_t v32 = v34;
    uint64_t v33 = &v36;
    v30[4] = (uint64_t)self;
    id v31 = v10;
    [v28 scanForDocumentationAssetWithDescriptor:v29 completion:v30];

    goto LABEL_15;
  }
LABEL_6:
  uint64_t v17 = v37[5];
LABEL_8:
  (*((void (**)(id, uint64_t, void))v10 + 2))(v10, v17, 0);
LABEL_15:
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(&v36, 8);
}

void __95__SUScanner_handleActiveScanTaskDocumentationFor_withOptions_withSelectedDescriptorCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    uint64_t v6 = +[SUUtility errorWithCode:4 originalError:a3];
  }
  else
  {
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) documentation];

    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      id v11 = v5;
      id v8 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v11;
      goto LABEL_6;
    }
    uint64_t v6 = +[SUUtility errorWithCode:38];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
LABEL_6:

  char v12 = [*(id *)(a1 + 32) core];
  uint64_t v13 = [v12 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__SUScanner_handleActiveScanTaskDocumentationFor_withOptions_withSelectedDescriptorCompletion___block_invoke_2;
  block[3] = &unk_26447E1E0;
  id v15 = *(id *)(a1 + 40);
  int8x16_t v16 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  dispatch_async(v13, block);
}

uint64_t __95__SUScanner_handleActiveScanTaskDocumentationFor_withOptions_withSelectedDescriptorCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor:(id)a3 preferredSecondaryDescriptor:(id)a4 alternatePrimaryDescriptor:(id)a5 alternateSecondaryDescriptor:(id)a6 scanOptions:(id)a7 error:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  char v20 = [(SUScanner *)self core];
  uint64_t v21 = [v20 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke;
  block[3] = &unk_26447E280;
  id v29 = v19;
  id v30 = v14;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  uint64_t v34 = self;
  id v35 = v18;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  id v27 = v19;
  dispatch_async(v21, block);
}

void __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke(void *a1)
{
  if (a1[4])
  {
    id v2 = (void *)a1[9];
    uint64_t v3 = a1[10];
    objc_msgSend(v2, "_handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:", 0, 0, v3);
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    [v4 setObject:a1[5] forKeyedSubscript:@"Primary"];
    [v4 setObject:a1[6] forKeyedSubscript:@"Secondary"];
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    [v5 setObject:a1[7] forKeyedSubscript:@"Primary"];
    [v5 setObject:a1[8] forKeyedSubscript:@"Secondary"];
    uint64_t v7 = (void *)a1[9];
    uint64_t v6 = (void *)a1[10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke_2;
    v9[3] = &unk_26447E258;
    v9[4] = v7;
    id v10 = v6;
    id v11 = v5;
    id v8 = v5;
    [v7 handleActiveScanTaskDocumentationFor:v4 withOptions:v10 withSelectedDescriptorCompletion:v9];
  }
}

void __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v13 = a3;
  if (v13) {
    SULogInfo(@"%s - doc scan for preferred descriptor failed with: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUScanner handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor:preferredSecondaryDescriptor:alternatePrimaryDescriptor:alternateSecondaryDescriptor:scanOptions:error:]_block_invoke_2");
  }
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__14;
  uint64_t v28 = __Block_byref_object_dispose__14;
  id v14 = a1[4];
  id v15 = [a1[5] requestedBuild];
  id v29 = [v14 _handleDescriptor:v5 forRequestedBuild:v15];

  if ([a1[6] count])
  {
    id v16 = a1[5];
    id v17 = a1[6];
    id v18 = a1[4];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke_3;
    v21[3] = &unk_26447E230;
    v21[4] = v18;
    id v22 = v16;
    id v23 = &v24;
    [v18 handleActiveScanTaskDocumentationFor:v17 withOptions:v22 withSelectedDescriptorCompletion:v21];
  }
  else
  {
    uint64_t v19 = v25[5];
    if (v19)
    {
      char v20 = 0;
    }
    else
    {
      char v20 = +[SUUtility errorWithCode:105];
      uint64_t v19 = v25[5];
    }
    [a1[4] _handleScannedPreferredDescriptor:v19 alternateDescriptor:0 scanOptions:a1[5] error:v20];
  }
  _Block_object_dispose(&v24, 8);
}

void __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v12 = a3;
  if (v12) {
    SULogInfo(@"%s - doc scan for alternate descriptor failed with: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUScanner handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor:preferredSecondaryDescriptor:alternatePrimaryDescriptor:alternateSecondaryDescriptor:scanOptions:error:]_block_invoke_3");
  }
  id v13 = *(void **)(a1 + 32);
  id v14 = [*(id *)(a1 + 40) requestedBuild];
  uint64_t v15 = [v13 _handleDescriptor:v20 forRequestedBuild:v14];

  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v17 = *(void *)(v16 + 40);
  if (v17 | v15)
  {
    if (v17) {
      BOOL v18 = 1;
    }
    else {
      BOOL v18 = v15 == 0;
    }
    if (!v18)
    {
      *(void *)(v16 + 40) = v15;

      uint64_t v15 = 0;
    }
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = +[SUUtility errorWithCode:105];
    uint64_t v15 = 0;
  }
  [*(id *)(a1 + 32) _handleScannedPreferredDescriptor:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) alternateDescriptor:v15 scanOptions:*(void *)(a1 + 40) error:v19];
}

- (id)_handleDescriptor:(id)a3 forRequestedBuild:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v14 = v6;
  if (v5 && v6)
  {
    uint64_t v15 = [v5 associatedSplatDescriptor];

    if (v15)
    {
      uint64_t v16 = +[SUPreferences sharedInstance];
      unint64_t v17 = [v16 overrideSplatComboBuildVersion];

      if (v17)
      {
        SULogDebug(@"%s: Override the build version of the splat combo to %@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");
      }
      else
      {
        uint64_t v34 = [v5 associatedSplatDescriptor];
        unint64_t v17 = [v34 productBuildVersion];
      }
      id v35 = NSString;
      uint64_t v36 = [v5 productBuildVersion];
      uint64_t v37 = [v35 stringWithFormat:@"(%@ + %@)", v36, v17];

      if ([v17 isEqualToString:v14])
      {
        SULogInfo(@"%s: Found a splombo update %@ and it matches the requested build version %@; keep it",
          v38,
          v39,
          v40,
          v41,
          v42,
          v43,
          v44,
          (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");
      }
      else
      {
        uint64_t v45 = [v5 productBuildVersion];
        int v46 = [v45 isEqualToString:v14];

        if (v46)
        {
          SULogInfo(@"%s: Found a splombo update %@ and only the normal update matches the requested build version %@; remove the associated splat",
            v47,
            v48,
            v49,
            v50,
            v51,
            v52,
            v53,
            (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");
          [v5 setAssociatedSplatDescriptor:0];
        }
        else
        {
          SULogInfo(@"%s: Found a splombo update %@ but it doesn't match the requested build version %@; ignore it",
            v47,
            v48,
            v49,
            v50,
            v51,
            v52,
            v53,
            (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");

          id v5 = 0;
        }
      }
    }
    else
    {
      id v25 = [v5 productBuildVersion];
      char v26 = [v25 isEqualToString:v14];

      if ((v26 & 1) == 0)
      {
        uint64_t v55 = [v5 productBuildVersion];
        SULogInfo(@"%s: Found an update %@ but it doesn't match the requested build version %@; ignore it",
          v27,
          v28,
          v29,
          v30,
          v31,
          v32,
          v33,
          (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");

        id v5 = 0;
      }
    }
  }
  else
  {
    SULogDebug(@"%s: invalid parameters", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");
  }

  return v5;
}

- (void)_handleScannedPreferredDescriptor:(id)a3 alternateDescriptor:(id)a4 scanOptions:(id)a5 error:(id)a6
{
  id v55 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v55 humanReadableUpdateName];
  id v54 = [v10 humanReadableUpdateName];
  SULogDebug(@"Scan found preferred descriptor {%@} and alternate descriptor {%@}\nwith error %@\nfor scan options %@", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);

  uint64_t v21 = [(SUScanner *)self activeScanTask];
  int v22 = [v21 didScanForType:4];

  if ([(SUScanner *)self isBuddyRunning]) {
    int v23 = 1;
  }
  else {
    int v23 = [v11 clientIsBuddy];
  }
  uint64_t v24 = [v11 scanType];
  int v25 = [v12 isUpToDate];
  if (v24 == 2)
  {
    if ((v25 & 1) != 0
      || ([v12 noMatchingUpdateFound] & 1) != 0
      || [v11 isSplatOnlyScan] && objc_msgSend(v12, "isCatalogNotFound"))
    {
      if ((v22 | v23))
      {
        [v11 setRequestedBuild:0];
        [v11 setRequestedPMV:0];
        [v11 clearTypes];
        [v11 setScanType:0];
        SULogInfo(@"%s - [DDM] Fall back to a scan for regular updates with options %@", v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[SUScanner _handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:]");
      }
      else
      {
        [v11 setRequestedPMV:0];
        [v11 clearTypes];
        [v11 addType:4];
        SULogInfo(@"%s - [DDM] Fall back to a scan for Splat updates with options %@", v47, v48, v49, v50, v51, v52, v53, (uint64_t)"-[SUScanner _handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:]");
      }
      goto LABEL_17;
    }
LABEL_15:
    SULogInfo(@"%s - will not rescan for updates", v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[SUScanner _handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:]");
    [(SUScanner *)self scanCompleted:v55 alternateDescriptor:v10 scanOptions:v11 error:v12];
    goto LABEL_18;
  }
  if (!v25
    || ![v11 MDMShowRapidSecurityResponse]
    || ([v11 isPMVRequested] & 1) != 0
    || (([v11 isEmergencyOnlyScan] | v22 | v23) & 1) != 0)
  {
    goto LABEL_15;
  }
  [v11 clearTypes];
  [v11 addType:4];
LABEL_17:
  SULogInfo(@"%s - will rescan for updates with options %@", v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[SUScanner _handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:]");
  [(SUScanner *)self _doScanForUpdates];
LABEL_18:
}

- (id)stringForScanPriority:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"Unknown";
  }
  else {
    return off_26447E2E0[a3];
  }
}

- (BOOL)_coreDescriptorFailedPatching:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUScanner *)self core];
  id v6 = [v5 state];
  uint64_t v7 = [v6 failedPatchDescriptors];

  if (v7 && [v7 count])
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v51 = v7;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v53 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v21 = [v4 prerequisiteBuild];

          if (v21)
          {
            int v22 = [v4 associatedSplatDescriptor];
            BOOL v23 = v22 != 0;

            if (+[SUManagerEngine SUDescriptor:v20 matchesSUCoreDescriptor:v4 comparisonFlags:v23])
            {
              uint64_t v49 = [v20 productBuildVersion];
              SULogInfo(@"%s: Found matching patch descriptor (%@), should fallback to full replacement", v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[SUScanner _coreDescriptorFailedPatching:]");

              BOOL v39 = 1;
              goto LABEL_15;
            }
          }
          uint64_t v24 = [v20 productBuildVersion];
          uint64_t v50 = [v4 productBuildVersion];
          SULogInfo(@"%s: No match between failed patch descriptor (%@) and current descriptor (%@)", v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[SUScanner _coreDescriptorFailedPatching:]");
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v56 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    uint64_t v48 = [v4 productBuildVersion];
    SULogInfo(@"%s: descriptor (%@) didn't previously fail patching", v32, v33, v34, v35, v36, v37, v38, (uint64_t)"-[SUScanner _coreDescriptorFailedPatching:]");

    BOOL v39 = 0;
LABEL_15:
    uint64_t v7 = v51;
  }
  else
  {
    SULogInfo(@"%s: No failed patch descriptors", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUScanner _coreDescriptorFailedPatching:]");
    BOOL v39 = 0;
  }

  return v39;
}

- (id)descriptorToAutoDownload:(id)a3
{
  id v4 = a3;
  if ([(SUScanner *)self isBuddyRunning])
  {
    SULogInfo(@"%s - Null due to Buddy running", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
    uint64_t v12 = 0;
    goto LABEL_23;
  }
  uint64_t v13 = [v4 preferredDescriptor];
  uint64_t v14 = [v4 alternateDescriptor];
  id v15 = [(SUScanner *)self core];
  int v16 = [v15 isDescriptorAutoDownloadable:v13];

  if (!v16) {
    goto LABEL_10;
  }
  if (v14 || [v13 audienceType] != 1 || !objc_msgSend(v13, "promoteAlternateUpdate"))
  {
    uint64_t v24 = [(SUScanner *)self core];
    int v25 = [v24 isDescriptorAutoUpdatable:v13];

    if (v25)
    {
      SULogInfo(@"%s - Preferred update is auto updatable", v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
LABEL_18:
      id v44 = v13;
LABEL_21:
      uint64_t v12 = v44;
      goto LABEL_22;
    }
LABEL_10:
    uint64_t v33 = [(SUScanner *)self core];
    int v34 = [v33 isDescriptorAutoDownloadable:v14];

    if (v34)
    {
      uint64_t v42 = [(SUScanner *)self core];
      int v43 = [v42 isDescriptorAutoUpdatable:v14];

      if (v43)
      {
        SULogInfo(@"%s - Alternate update is auto updatable", v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
LABEL_20:
        id v44 = v14;
        goto LABEL_21;
      }
      if ((v16 & 1) == 0)
      {
        SULogInfo(@"%s - Alternate update is auto downloadable", v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
        goto LABEL_20;
      }
    }
    else if (!v16)
    {
      SULogInfo(@"%s - No update is auto downloadable", v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
      goto LABEL_15;
    }
    SULogInfo(@"%s - Preferred update is auto downloadable", v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
    goto LABEL_18;
  }
  SULogInfo(@"%s - Null due to up-to-date with alternate", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
LABEL_15:
  uint64_t v12 = 0;
LABEL_22:

LABEL_23:
  return v12;
}

- (id)descriptorToAutoDownload
{
  uint64_t v3 = [(SUScanner *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:self->_preferredLastScannedCoreDescriptor];
  uint64_t v6 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:self->_alternateLastScannedCoreDescriptor];
  uint64_t v7 = [[SUScanResults alloc] initWithPreferredDescriptor:v5 alternateDescriptor:v6];
  uint64_t v8 = [(SUScanner *)self descriptorToAutoDownload:v7];

  return v8;
}

- (BOOL)isBuddyRunning
{
  id v2 = +[SUPreferences sharedInstance];
  int v3 = [v2 buddyInitiatedScan];

  if (v3)
  {
    SULogInfo(@"%s: Overriding result to YES by SUBuddyInitiatedScan", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUScanner isBuddyRunning]");
    return 1;
  }
  else
  {
    uint64_t v33 = 0;
    int v34 = &v33;
    uint64_t v35 = 0x2020000000;
    uint64_t v12 = (void **)getBYSetupAssistantBundleIdentifierSymbolLoc_ptr;
    uint64_t v36 = getBYSetupAssistantBundleIdentifierSymbolLoc_ptr;
    if (!getBYSetupAssistantBundleIdentifierSymbolLoc_ptr)
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke;
      v32[3] = &unk_26447E2A8;
      v32[4] = &v33;
      __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke((uint64_t)v32);
      uint64_t v12 = (void **)v34[3];
    }
    _Block_object_dispose(&v33, 8);
    if (!v12) {
      -[SUScanner isBuddyRunning]();
    }
    uint64_t v13 = *v12;
    uint64_t v14 = (void *)MEMORY[0x263F64570];
    id v15 = (void *)MEMORY[0x263F645D8];
    id v16 = v13;
    uint64_t v17 = [v15 predicateMatchingBundleIdentifier:v16];
    id v31 = 0;
    uint64_t v18 = [v14 handleForPredicate:v17 error:&v31];
    id v19 = v31;

    if (v19 || !v18)
    {
      SULogInfo(@"Setup Assistant process not found", v20, v21, v22, v23, v24, v25, v26, v30);
      char v11 = 0;
    }
    else
    {
      uint64_t v27 = [v18 currentState];
      uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v27, "taskState"));
      char v11 = [&unk_26CEBD248 containsObject:v28];
    }
  }
  return v11;
}

- (SUManagerCore)core
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_core);
  return (SUManagerCore *)WeakRetained;
}

- (void)setCore:(id)a3
{
}

- (SUScanTask)activeScanTask
{
  return self->_activeScanTask;
}

- (void)setActiveScanTask:(id)a3
{
}

- (NSMutableArray)scanRequests
{
  return self->_scanRequests;
}

- (void)setScanRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedUpdateTimer, 0);
  objc_storeStrong((id *)&self->_fullyUnrampedDateManager, 0);
  objc_storeStrong((id *)&self->_discoveryDateManager, 0);
  objc_storeStrong((id *)&self->_alternateLastScannedCoreDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredLastScannedCoreDescriptor, 0);
  objc_storeStrong((id *)&self->_lastScannedDescriptorScanOptions, 0);
  objc_storeStrong((id *)&self->_activeScanTask, 0);
  objc_storeStrong((id *)&self->_scanRequests, 0);
  objc_destroyWeak((id *)&self->_core);
}

- (void)isBuddyRunning
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getBYSetupAssistantBundleIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUScanner.m", 45, @"%s", dlerror());

  __break(1u);
}

@end