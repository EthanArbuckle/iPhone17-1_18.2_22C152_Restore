@interface SUDDMManager
+ (id)statePath;
+ (int64_t)_NSNumberToTriState:(id)a3;
- (BOOL)_evaluateAllDeclarations;
- (BOOL)_nonFatalScanError:(id)a3;
- (BOOL)cancelDDMDeclarationForKey:(id)a3 outError:(id *)a4;
- (BOOL)enableGlobalNotifications;
- (BOOL)enableRapidSecurityResponse;
- (BOOL)enableRapidSecurityResponseRollback;
- (BOOL)handleDDMDeclaration:(id)a3 outError:(id *)a4;
- (BOOL)isDealyingUpdates;
- (BOOL)isManagedByDDM;
- (BOOL)setDDMGlobalSettings:(id)a3 outError:(id *)a4;
- (SUDDMManager)initWithDelegate:(id)a3;
- (id)_scanForUpdateForDeclaration:(id)a3 retryIfNecessary:(int)a4;
- (id)activeDDMDeclarationEnfrocedSU;
- (id)allDeclarations;
- (id)getDDMGlobalSettingsWithError:(id *)a3;
- (id)manager;
- (int64_t)alwaysEnableAutoDownload;
- (int64_t)alwaysEnableAutoInstallOSUpdates;
- (int64_t)alwaysEnableAutoInstallRapidSecurityResponse;
- (unint64_t)recommendedCadence;
- (unint64_t)updateDeferralPeriodDays;
- (void)_cancelCurrentDownloadAndDownload:(id)a3;
- (void)_cancelScheduledDownloadRetryForReason:(id)a3;
- (void)_downloadRequestCompletedWithStatus:(BOOL)a3 error:(id)a4 withDescriptor:(id)a5;
- (void)_evaluateDeclarationsWithNewDeclaration:(id)a3;
- (void)_handleExistingDownload:(id)a3 targetUpdate:(id)a4;
- (void)_handleScanResults:(id)a3;
- (void)_initiateDownloadWithDescriptor:(id)a3;
- (void)_notifyUI:(id)a3;
- (void)_purgeDownloadWithHandler:(id)a3;
- (void)_scheduleDownloadRetryForReason:(id)a3;
- (void)_setActiveDeclaration:(id)a3;
- (void)downloadDidFail:(id)a3 withError:(id)a4;
- (void)downloadDidFinish:(id)a3 withInstallPolicy:(id)a4;
- (void)downloadDidStart:(id)a3;
- (void)downloadWasInvalidated:(id)a3;
- (void)getActiveDDMDeclarationEnforcedSUWithResponse:(id)a3;
- (void)getDescriptorWithCallback:(id)a3;
- (void)installDidFinish:(id)a3;
- (void)resumeOrResetStateIfNecessary;
- (void)scanRequestDidFinishForOptions:(id)a3 results:(id)a4 error:(id)a5;
- (void)timeFiredForScheduler:(id)a3 withOptions:(id)a4 replyBlock:(id)a5;
@end

@implementation SUDDMManager

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

- (SUDDMManager)initWithDelegate:(id)a3
{
  id v5 = a3;
  v36 = [NSString stringWithFormat:@"was called"];
  SULogInfo(@"[DDM] %s: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager initWithDelegate:]");

  if (v5)
  {
    v38.receiver = self;
    v38.super_class = (Class)SUDDMManager;
    v13 = [(SUDDMManager *)&v38 init];
    if (v13)
    {
      v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v15 = dispatch_queue_create("com.apple.softwareupdateservices.ddmWorkQueue", v14);
      workQueue = v13->_workQueue;
      v13->_workQueue = (OS_dispatch_queue *)v15;

      v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v18 = dispatch_queue_create("com.apple.softwareupdateservices.ddmWorkQueue.gs", v17);
      gsWorkQueue = v13->_gsWorkQueue;
      v13->_gsWorkQueue = (OS_dispatch_queue *)v18;

      objc_storeStrong((id *)&v13->_managerServerDelegate, a3);
      uint64_t v20 = [objc_alloc(MEMORY[0x263F77B48]) initWithDelegate:v13 options:&unk_26CEBD1E0];
      evaluationScheduler = v13->_evaluationScheduler;
      v13->_evaluationScheduler = (SUCoreDDMActivityScheduler *)v20;

      uint64_t v22 = [objc_alloc(MEMORY[0x263F77B48]) initWithDelegate:v13 options:&unk_26CEBD208];
      downloadScheduler = v13->_downloadScheduler;
      v13->_downloadScheduler = (SUCoreDDMActivityScheduler *)v22;

      ddmConfiguration = v13->_ddmConfiguration;
      v13->_ddmConfiguration = 0;

      activeDeclarationEnforcedSU = v13->_activeDeclarationEnforcedSU;
      v13->_activeDeclarationEnforcedSU = 0;

      globalSettings = v13->_globalSettings;
      v13->_globalSettings = 0;
    }
    self = v13;
    v27 = self;
  }
  else
  {
    v37 = [NSString stringWithFormat:@"SUDDMManager failed to initiate as first call to sharedManager was made without a server delegate"];
    SULogInfo(@"[DDM] %s: %@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[SUDDMManager initWithDelegate:]");

    v27 = 0;
  }

  return v27;
}

- (void)resumeOrResetStateIfNecessary
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUDDMManager_resumeOrResetStateIfNecessary__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(workQueue, block);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__SUDDMManager_resumeOrResetStateIfNecessary__block_invoke_2;
  v5[3] = &unk_26447C878;
  v5[4] = self;
  dispatch_sync(gsWorkQueue, v5);
}

void __45__SUDDMManager_resumeOrResetStateIfNecessary__block_invoke(uint64_t a1)
{
  v44 = [NSString stringWithFormat:@"was called"];
  SULogInfo(@"[DDM] %s: %@", v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUDDMManager resumeOrResetStateIfNecessary]_block_invoke");

  id v47 = [(id)objc_opt_class() statePath];
  uint64_t v9 = [NSString stringWithFormat:@"_ddmConfiguration persistence path: %@", v47, v44];
  SULogInfo(@"[DDM] %s: %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUDDMManager resumeOrResetStateIfNecessary]_block_invoke");

  uint64_t v17 = [objc_alloc(MEMORY[0x263F77B88]) initWithStatePersistencePath:v47];
  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(void **)(v18 + 48);
  *(void *)(v18 + 48) = v17;

  uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 48);
  v21 = [v20 activeDeclarationKey];
  uint64_t v22 = [v20 declarationForKey:v21];

  v23 = [*(id *)(a1 + 32) manager];
  v24 = [v23 download];

  objc_msgSend(NSString, "stringWithFormat:", @"Current active declaration = %@; current download = \n%@",
    v22,
  v45 = v24);
  SULogInfo(@"[DDM] %s: %@", v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[SUDDMManager resumeOrResetStateIfNecessary]_block_invoke");

  if (v22
    && ([v24 descriptor],
        uint64_t v32 = objc_claimAutoreleasedReturnValue(),
        int v33 = [v32 isRelevantToDeclaration:v22],
        v32,
        v33))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v22);
    uint64_t v34 = [v24 descriptor];
    uint64_t v35 = *(void *)(a1 + 32);
    v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = v34;

    v46 = [NSString stringWithFormat:@"Found declaration %@ and corresponding update %@ from state", *(void *)(*(void *)(a1 + 32) + 72), *(void *)(*(void *)(a1 + 32) + 40)];
    SULogInfo(@"[DDM] %s: %@", v37, v38, v39, v40, v41, v42, v43, (uint64_t)"-[SUDDMManager resumeOrResetStateIfNecessary]_block_invoke");

    [*(id *)(a1 + 32) _notifyUI:v22];
  }
  else
  {
    [*(id *)(a1 + 32) _evaluateDeclarationsWithNewDeclaration:0];
  }
}

uint64_t __45__SUDDMManager_resumeOrResetStateIfNecessary__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = [*(id *)(*(void *)(a1 + 32) + 48) currentGlobalSettingsDeclaration];

  return MEMORY[0x270F9A758]();
}

- (BOOL)isManagedByDDM
{
  return [(SUCorePolicyDDMConfiguration *)self->_ddmConfiguration hasManagedConfigurations];
}

- (id)manager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  manager = self->_manager;
  if (!manager)
  {
    uint64_t v4 = +[SUManagerInterfaceFactory sharedInstance];
    uint64_t v5 = self->_manager;
    self->_manager = v4;

    [(SUManagerInterface *)self->_manager addObserver:self];
    manager = self->_manager;
  }

  return manager;
}

- (void)_notifyUI:(id)a3
{
  id v12 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [NSString stringWithFormat:@"Sending %@ to UI", v12];
    SULogInfo(@"[DDM] %s: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager _notifyUI:]");

    [(SUManagerDelegate *)self->_managerServerDelegate sendDDMDeclarationToUI:v12];
  }
}

- (void)_setActiveDeclaration:(id)a3
{
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  ddmConfiguration = self->_ddmConfiguration;
  uint64_t v5 = [v15 declarationKey];
  LODWORD(ddmConfiguration) = [(SUCorePolicyDDMConfiguration *)ddmConfiguration setActiveDeclarationKey:v5];

  if (ddmConfiguration)
  {
    uint64_t v6 = (SUCoreDDMDeclaration *)v15;
    activeDeclarationEnforcedSU = self->_activeDeclarationEnforcedSU;
    self->_activeDeclarationEnforcedSU = v6;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Failed to set %@ as active; it must not be valid!!!",
    activeDeclarationEnforcedSU = v15);
    SULogError(@"[DDM] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUDDMManager _setActiveDeclaration:]");
  }
}

- (id)_scanForUpdateForDeclaration:(id)a3 retryIfNecessary:(int)a4
{
  id v6 = a3;
  v97 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!v6)
  {
    v92 = [NSString stringWithFormat:@"Don't scan for a null declaration"];
    SULogInfo(@"[DDM] %s: %@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

    uint64_t v35 = 0;
    goto LABEL_21;
  }
  uint64_t v7 = objc_opt_new();
  [v7 setClientName:@"com.apple.SoftwareUpdateServices.DDM"];
  [v7 setIdentifier:@"com.apple.SoftwareUpdateServices.DDM"];
  [v7 setForced:1];
  [v7 setScanType:2];
  uint64_t v8 = [v6 versionString];
  [v7 setRequestedPMV:v8];

  uint64_t v9 = [v6 buildVersionString];
  [v7 setRequestedBuild:v9];

  [v7 setMDMUseDelayPeriod:0];
  [v7 setMDMSoftwareUpdatePath:0];
  [v7 setMDMShowRapidSecurityResponse:1];
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__1;
  v112 = __Block_byref_object_dispose__1;
  id v113 = 0;
  uint64_t v102 = 0;
  v103 = &v102;
  uint64_t v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__1;
  v106 = __Block_byref_object_dispose__1;
  id v107 = 0;
  int v11 = a4 + 1;
  while (1)
  {
    v91 = [NSString stringWithFormat:@"Scanning for update for DDM declaration %@", v6, v90];
    SULogInfo(@"[DDM] %s: %@", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

    v19 = [(SUDDMManager *)v97 manager];
    v98[0] = MEMORY[0x263EF8330];
    v98[1] = 3221225472;
    v98[2] = __62__SUDDMManager__scanForUpdateForDeclaration_retryIfNecessary___block_invoke;
    v98[3] = &unk_26447CDE8;
    v100 = &v108;
    v101 = &v102;
    uint64_t v20 = v10;
    v99 = v20;
    [v19 scanForUpdates:v7 shouldUseDDMInState:0 complete:v98];

    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    if (!v103[5]) {
      break;
    }
    v90 = [NSString stringWithFormat:@"Scan hit an error %@, retrying in 5s: %d", v103[5], (v11 - 2)];
    SULogInfo(@"[DDM] %s: %@", v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

    [MEMORY[0x263F08B88] sleepForTimeInterval:5.0];
    if (--v11 <= 1) {
      goto LABEL_16;
    }
  }
  v36 = [(id)v109[5] preferredDescriptor];
  if (v36)
  {
    uint64_t v37 = [(id)v109[5] preferredDescriptor];
    int v38 = [v37 isRelevantToDeclaration:v6];

    if (v38)
    {
      uint64_t v35 = [(id)v109[5] preferredDescriptor];
      uint64_t v39 = [NSString stringWithFormat:@"Picked preferred descriptor from scan results"];
      SULogInfo(@"[DDM] %s: %@", v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");
      goto LABEL_13;
    }
  }
  id v47 = [(id)v109[5] alternateDescriptor];
  if (v47)
  {
    v48 = [(id)v109[5] alternateDescriptor];
    int v49 = [v48 isRelevantToDeclaration:v6];

    if (v49)
    {
      uint64_t v35 = [(id)v109[5] alternateDescriptor];
      uint64_t v39 = [NSString stringWithFormat:@"Picked alternate descriptor from scan results"];
      SULogInfo(@"[DDM] %s: %@", v50, v51, v52, v53, v54, v55, v56, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");
LABEL_13:

      if (v35)
      {
        v57 = NSString;
        v58 = [v35 humanReadableUpdateName];
        v93 = [v57 stringWithFormat:@"Update found for DDM declaration %@: %@ [%p]", v6, v58, v35];
        SULogInfo(@"[DDM] %s: %@", v59, v60, v61, v62, v63, v64, v65, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

        goto LABEL_20;
      }
      goto LABEL_16;
    }
  }
  v94 = [NSString stringWithFormat:@"Scan didn't find anything relevant; don't retry"];
  SULogInfo(@"[DDM] %s: %@", v66, v67, v68, v69, v70, v71, v72, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

LABEL_16:
  v95 = [NSString stringWithFormat:@"No update found for DDM declaration %@ with error %@", v6, v103[5]];
  SULogInfo(@"[DDM] %s: %@", v73, v74, v75, v76, v77, v78, v79, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

  if (v103[5])
  {
    v80 = +[SUState currentState];
    v81 = [(id)v103[5] description];
    [v80 setDdmPersistedErrorDescription:v81];

    if (![(SUDDMManager *)v97 _nonFatalScanError:v103[5]])
    {
      v96 = [NSString stringWithFormat:@"The last scan error %@ is fatal, notifying the status channel.", v103[5], v95];
      SULogInfo(@"[DDM] %s: %@", v82, v83, v84, v85, v86, v87, v88, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

      notify_post((const char *)[(id)*MEMORY[0x263F77C08] UTF8String]);
    }
  }
  uint64_t v35 = 0;
LABEL_20:
  _Block_object_dispose(&v102, 8);

  _Block_object_dispose(&v108, 8);
LABEL_21:

  return v35;
}

void __62__SUDDMManager__scanForUpdateForDeclaration_retryIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_nonFatalScanError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:@"com.apple.softwareupdateservices.errors"]) {
      BOOL v6 = [v4 code] == 3 || objc_msgSend(v4, "code") == 105 || objc_msgSend(v4, "code") == 22;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)_evaluateAllDeclarations
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v46 = [NSString stringWithFormat:@"Let's evaluate all declaraions!"];
  SULogInfo(@"[DDM] %s: %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUDDMManager _evaluateAllDeclarations]");

  id v10 = (id)[(SUCorePolicyDDMConfiguration *)self->_ddmConfiguration invalidateAllInvalidDeclarationsReturningAllInvalid];
  id v11 = [(SUCorePolicyDDMConfiguration *)self->_ddmConfiguration allDeclarations];
  id v12 = v11;
  if (v11 && [v11 count])
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v19 = [(SUDDMManager *)self _scanForUpdateForDeclaration:v18 retryIfNecessary:3];
          if (v19)
          {
            v48 = [NSString stringWithFormat:@"Update found! Let's enforce %@", v18, v46];
            SULogInfo(@"[DDM] %s: %@", v36, v37, v38, v39, v40, v41, v42, (uint64_t)"-[SUDDMManager _evaluateAllDeclarations]");

            id v27 = v18;
            goto LABEL_15;
          }
          uint64_t v46 = [NSString stringWithFormat:@"No updates found... Let's skip %@", v18, v46];
          SULogInfo(@"[DDM] %s: %@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[SUDDMManager _evaluateAllDeclarations]");
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      v19 = 0;
      id v27 = 0;
    }
    else
    {
      v19 = 0;
      id v27 = 0;
    }
LABEL_15:

    [(SUDDMManager *)self _setActiveDeclaration:v27];
    descriptor = self->_descriptor;
    self->_descriptor = v19;
    uint64_t v44 = v19;

    BOOL v35 = 1;
  }
  else
  {
    id v47 = [NSString stringWithFormat:@"No declarations in configuration %@", self->_ddmConfiguration, v46];
    SULogInfo(@"[DDM] %s: %@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[SUDDMManager _evaluateAllDeclarations]");

    [(SUDDMManager *)self _setActiveDeclaration:0];
    BOOL v35 = 0;
  }

  return v35;
}

- (void)_evaluateDeclarationsWithNewDeclaration:(id)a3
{
  id v101 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v94 = [NSString stringWithFormat:@"was called"];
  SULogInfo(@"[DDM] %s: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

  id v11 = self->_activeDeclarationEnforcedSU;
  id v12 = self->_descriptor;
  id v13 = v12;
  BOOL v14 = 0;
  if (v11 && v12) {
    BOOL v14 = [(SUDescriptor *)v12 isRelevantToDeclaration:v11];
  }
  BOOL v15 = 0;
  uint64_t v16 = v101;
  if (v101 && v11)
  {
    uint64_t v17 = [v101 enforcedInstallDate];
    uint64_t v18 = [(SUCoreDDMDeclaration *)v11 enforcedInstallDate];
    BOOL v15 = [v17 compare:v18] == -1;

    uint64_t v16 = v101;
  }
  if (v14)
  {
    v19 = [v16 declarationKey];
    uint64_t v20 = [(SUCoreDDMDeclaration *)v11 declarationKey];
    int v21 = [v19 isEqualToString:v20];

    if (!v21)
    {
      if (v15)
      {
        uint64_t v42 = [(SUDDMManager *)self _scanForUpdateForDeclaration:v101 retryIfNecessary:3];
        if (v42)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Update found for the new declaration %@; let's enforce it!",
            v101,
          v97 = v94);
          SULogInfo(@"[DDM] %s: %@", v43, v44, v45, v46, v47, v48, v49, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

          [(SUDDMManager *)self _setActiveDeclaration:v101];
          long long v50 = v42;
          descriptor = self->_descriptor;
          self->_descriptor = v50;
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Nothing found for the new declaration %@; let's keep the original one.",
            v101,
          descriptor = v94);
          SULogInfo(@"[DDM] %s: %@", v67, v68, v69, v70, v71, v72, v73, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");
        }
      }
      else
      {
        uint64_t v42 = [NSString stringWithFormat:@"Current declaration is good and the new declaration isn't more urgent. Don't evaluate this time."];
        SULogInfo(@"[DDM] %s: %@", v60, v61, v62, v63, v64, v65, v66, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");
      }

      goto LABEL_21;
    }
    uint64_t v22 = (void *)MEMORY[0x263F77D80];
    uint64_t v23 = [(SUCoreDDMDeclaration *)v11 versionString];
    uint64_t v24 = [v101 versionString];
    if ([v22 stringIsEqual:v23 to:v24])
    {
      uint64_t v25 = (void *)MEMORY[0x263F77D80];
      uint64_t v26 = [(SUCoreDDMDeclaration *)v11 buildVersionString];
      id v27 = [v101 buildVersionString];
      LOBYTE(v25) = [v25 stringIsEqual:v26 to:v27];

      v95 = [NSString stringWithFormat:@"Current declaration changed from %@ to %@", v11, v101];
      SULogInfo(@"[DDM] %s: %@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

      if (v25)
      {
        v96 = [NSString stringWithFormat:@"No target versions changed; no need to re-evaluate"];
        SULogInfo(@"[DDM] %s: %@", v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

        [(SUDDMManager *)self _setActiveDeclaration:v101];
LABEL_21:
        BOOL v59 = 1;
        goto LABEL_22;
      }
    }
    else
    {

      v98 = [NSString stringWithFormat:@"Current declaration changed from %@ to %@", v11, v101];
      SULogInfo(@"[DDM] %s: %@", v52, v53, v54, v55, v56, v57, v58, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");
    }
  }
  BOOL v59 = [(SUDDMManager *)self _evaluateAllDeclarations];
LABEL_22:
  uint64_t v74 = self->_activeDeclarationEnforcedSU;

  uint64_t v75 = self->_descriptor;
  uint64_t v76 = NSString;
  uint64_t v77 = [(SUDescriptor *)v75 humanReadableUpdateName];
  v99 = [v76 stringWithFormat:@"declarationToEnforce = %@, updateForDeclaration = %@ [%p]", v74, v77, v75];
  SULogInfo(@"[DDM] %s: %@", v78, v79, v80, v81, v82, v83, v84, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

  [(SUCoreDDMActivityScheduler *)self->_evaluationScheduler disarmActivityScheduler];
  if (v74 && v75)
  {
    [(SUDDMManager *)self _initiateDownloadWithDescriptor:v75];
  }
  else if (v59)
  {
    v100 = [NSString stringWithFormat:@"Failed to find any updates for declarations; will re-evaluate later"];
    SULogInfo(@"[DDM] %s: %@", v85, v86, v87, v88, v89, v90, v91, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

    evaluationScheduler = self->_evaluationScheduler;
    v93 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:21600.0];
    [(SUCoreDDMActivityScheduler *)evaluationScheduler armActivitySchedulerWithDate:v93];
  }
  [(SUDDMManager *)self _notifyUI:v74];
}

- (void)_scheduleDownloadRetryForReason:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  uint64_t v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:3600.0];
  uint64_t v7 = NSString;
  id v25 = (id)v6;
  uint64_t v8 = +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:");
  uint64_t v9 = [v7 stringWithFormat:@"Schedule to retry downloading on %@ for reason: %@", v8, v5];

  SULogInfo(@"[DDM] %s: %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUDDMManager _scheduleDownloadRetryForReason:]");
  if ([(SUCoreDDMActivityScheduler *)self->_downloadScheduler isArmed])
  {
    uint64_t v24 = [NSString stringWithFormat:@"[ANOMALY] shouldn't have any previously scheduled activity!"];
    SULogInfo(@"[DDM] %s: %@", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUDDMManager _scheduleDownloadRetryForReason:]");

    [(SUCoreDDMActivityScheduler *)self->_downloadScheduler disarmActivityScheduler];
  }
  [(SUCoreDDMActivityScheduler *)self->_downloadScheduler armActivitySchedulerWithDate:v25];
}

- (void)_cancelScheduledDownloadRetryForReason:(id)a3
{
  id v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([(SUCoreDDMActivityScheduler *)self->_downloadScheduler isArmed])
  {
    uint64_t v11 = [NSString stringWithFormat:@"Cancel scheduled download retry for reason: %@", v12];
    SULogInfo(@"[DDM] %s: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager _cancelScheduledDownloadRetryForReason:]");

    [(SUCoreDDMActivityScheduler *)self->_downloadScheduler disarmActivityScheduler];
  }
}

- (void)_initiateDownloadWithDescriptor:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v5 = NSString;
  uint64_t v6 = [v4 humanReadableUpdateName];
  uint64_t v54 = [v5 stringWithFormat:@"Downloading: %@ [%p]", v6, v4];
  SULogInfo(@"[DDM] %s: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDDMManager _initiateDownloadWithDescriptor:]");

  if (v4)
  {
    uint64_t v14 = [(SUDDMManager *)self manager];
    uint64_t v15 = [v14 download];

    if (v15)
    {
      uint64_t v16 = [(SUDDMManager *)self manager];
      uint64_t v17 = [(SUDownloadOptions *)v16 download];
      [(SUDDMManager *)self _handleExistingDownload:v17 targetUpdate:v4];

LABEL_14:
      goto LABEL_15;
    }
    uint64_t v18 = +[SUNetworkMonitor sharedInstance];
    unsigned int v19 = [v18 currentNetworkType];

    uint64_t v16 = [[SUDownloadOptions alloc] initWithDescriptor:v4];
    [(SUDownloadOptions *)v16 setActiveDownloadPolicyType:0];
    [(SUDownloadOptions *)v16 setAutoDownload:0];
    [(SUDownloadOptions *)v16 setDownloadOnly:0];
    [(SUDownloadOptions *)v16 setClientName:@"com.apple.sus.ddm"];
    [(SUDownloadOptions *)v16 setTermsAndConditionsAgreementStatus:1];
    if (v19 == 1) {
      goto LABEL_8;
    }
    if (!v19)
    {
      uint64_t v55 = [NSString stringWithFormat:@"No network connection; try again later..."];
      SULogInfo(@"[DDM] %s: %@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[SUDDMManager _initiateDownloadWithDescriptor:]");

      id v27 = @"currently no network connection";
LABEL_13:
      [(SUDDMManager *)self _scheduleDownloadRetryForReason:v27];
      goto LABEL_14;
    }
    if ([(SUDownloadOptions *)v16 isEnabledForCellular])
    {
LABEL_8:
      uint64_t v28 = [(SUDDMManager *)self manager];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __48__SUDDMManager__initiateDownloadWithDescriptor___block_invoke;
      v61[3] = &unk_26447CE10;
      v61[4] = self;
      uint64_t v62 = (SUDownloadOptions *)v4;
      [v28 startDownloadWithOptions:v16 withResult:v61];

      uint64_t v29 = v62;
    }
    else
    {
      uint64_t v30 = [(SUDownloadOptions *)v16 activeDownloadPolicy];
      int v31 = [v30 isDownloadAllowableForCellular];

      uint64_t v32 = NSString;
      if (!v31)
      {
        uint64_t v57 = [NSString stringWithFormat:@"Download policy doesn't allow downloading over cellular; try again later..."];
        SULogInfo(@"[DDM] %s: %@", v47, v48, v49, v50, v51, v52, v53, (uint64_t)"-[SUDDMManager _initiateDownloadWithDescriptor:]");

        id v27 = @"download policy doesn't allow downloading over cellular";
        goto LABEL_13;
      }
      uint64_t v33 = SUStringFromNetworkType(v19);
      uint64_t v56 = [v32 stringWithFormat:@"Current network: %@", v33, v54];
      SULogInfo(@"[DDM] %s: %@", v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[SUDDMManager _initiateDownloadWithDescriptor:]");

      uint64_t v41 = +[SUAlertPresentationManager sharedInstance];
      [v41 dismissAlertsOfClass:objc_opt_class() animated:1];

      uint64_t v42 = [SUCellularFeeAlertItem alloc];
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __48__SUDDMManager__initiateDownloadWithDescriptor___block_invoke_2;
      v58[3] = &unk_26447CE60;
      v58[4] = self;
      BOOL v59 = v16;
      id v60 = v4;
      uint64_t v43 = [(SUDescriptor *)self->_descriptor humanReadableUpdateName];
      uint64_t v44 = [(SUCoreDDMDeclaration *)self->_activeDeclarationEnforcedSU enforcedInstallDate];
      uint64_t v45 = [(SUCellularFeeAlertItem *)v42 initWithHandler:v58 updateName:v43 dueDate:v44];

      uint64_t v46 = +[SUAlertPresentationManager sharedInstance];
      [v46 presentAlert:v45 animated:1];

      uint64_t v29 = v59;
    }

    goto LABEL_14;
  }
LABEL_15:
}

uint64_t __48__SUDDMManager__initiateDownloadWithDescriptor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _downloadRequestCompletedWithStatus:a2 error:a3 withDescriptor:*(void *)(a1 + 40)];
}

void __48__SUDDMManager__initiateDownloadWithDescriptor___block_invoke_2(uint64_t a1, int a2)
{
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SUDDMManager__initiateDownloadWithDescriptor___block_invoke_3;
  v7[3] = &unk_26447CE38;
  id v5 = *(id *)(a1 + 40);
  int v11 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 48);
  dispatch_async(v4, v7);
}

void __48__SUDDMManager__initiateDownloadWithDescriptor___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setDownloadFeeAgreementStatus:*(unsigned int *)(a1 + 56)];
  uint64_t v2 = [*(id *)(a1 + 40) manager];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SUDDMManager__initiateDownloadWithDescriptor___block_invoke_4;
  v5[3] = &unk_26447CE10;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  id v6 = v4;
  [v2 startDownloadWithOptions:v3 withResult:v5];
}

uint64_t __48__SUDDMManager__initiateDownloadWithDescriptor___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _downloadRequestCompletedWithStatus:a2 error:a3 withDescriptor:*(void *)(a1 + 40)];
}

- (void)_handleExistingDownload:(id)a3 targetUpdate:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!v26)
  {
    int v11 = [NSString stringWithFormat:@"No download"];
    SULogError(@"[DDM] %s: %@", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[SUDDMManager _handleExistingDownload:targetUpdate:]");
LABEL_8:

    goto LABEL_10;
  }
  if (!v6)
  {
    uint64_t v9 = NSString;
    id v10 = @"No target update; not handling the download";
    goto LABEL_7;
  }
  uint64_t v7 = [v26 descriptor];
  int v8 = [v7 isEqual:v6];

  if (v8)
  {
    uint64_t v9 = NSString;
    id v10 = @"Current download is what is encforced";
LABEL_7:
    int v11 = [v9 stringWithFormat:v10];
    SULogInfo(@"[DDM] %s: %@", v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[SUDDMManager _handleExistingDownload:targetUpdate:]");
    goto LABEL_8;
  }
  [(SUDDMManager *)self _cancelCurrentDownloadAndDownload:v6];
LABEL_10:
}

- (void)_cancelCurrentDownloadAndDownload:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = NSString;
  id v6 = [v4 humanReadableUpdateName];
  uint64_t v15 = [v5 stringWithFormat:@"Canceling the current download to download %@ [%p]", v6, v4];
  SULogInfo(@"[DDM] %s: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDDMManager _cancelCurrentDownloadAndDownload:]");

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__SUDDMManager__cancelCurrentDownloadAndDownload___block_invoke;
  v16[3] = &unk_26447CE10;
  id v17 = v4;
  uint64_t v18 = self;
  id v14 = v4;
  [(SUDDMManager *)self _purgeDownloadWithHandler:v16];
}

uint64_t __50__SUDDMManager__cancelCurrentDownloadAndDownload___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "_initiateDownloadWithDescriptor:");
  }
  return result;
}

- (void)_purgeDownloadWithHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = objc_opt_new();
  [v5 setUserRequested:0];
  [v5 setNotifyUser:0];
  uint64_t v15 = [NSString stringWithFormat:@"Purging download with options %@", v5];
  SULogInfo(@"[DDM] %s: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager _purgeDownloadWithHandler:]");

  uint64_t v13 = [(SUDDMManager *)self manager];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __42__SUDDMManager__purgeDownloadWithHandler___block_invoke;
  v16[3] = &unk_26447CEB0;
  void v16[4] = self;
  id v17 = v4;
  id v14 = v4;
  [v13 purgeDownloadWithOptions:v5 withResult:v16];
}

void __42__SUDDMManager__purgeDownloadWithHandler___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  uint64_t v16 = [NSString stringWithFormat:@"Download was purged (result: %d; error: %@)", a2, v5];
  SULogInfo(@"[DDM] %s: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager _purgeDownloadWithHandler:]_block_invoke");

  uint64_t v13 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUDDMManager__purgeDownloadWithHandler___block_invoke_2;
  block[3] = &unk_26447CE88;
  id v14 = *(id *)(a1 + 40);
  char v20 = a2;
  id v18 = v5;
  id v19 = v14;
  id v15 = v5;
  dispatch_async(v13, block);
}

uint64_t __42__SUDDMManager__purgeDownloadWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)_downloadRequestCompletedWithStatus:(BOOL)a3 error:(id)a4 withDescriptor:(id)a5
{
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__SUDDMManager__downloadRequestCompletedWithStatus_error_withDescriptor___block_invoke;
  block[3] = &unk_26447CED8;
  BOOL v13 = a3;
  id v11 = v7;
  uint64_t v12 = self;
  id v9 = v7;
  dispatch_async(workQueue, block);
}

void __73__SUDDMManager__downloadRequestCompletedWithStatus_error_withDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v2 = @"succeeded";
  if (!*(unsigned char *)(a1 + 48)) {
    uint64_t v2 = @"failed";
  }
  uint64_t v24 = [NSString stringWithFormat:@"Download %@ to start. Error: %@", v2, *(void *)(a1 + 32)];
  SULogInfo(@"[DDM] %s: %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUDDMManager _downloadRequestCompletedWithStatus:error:withDescriptor:]_block_invoke");

  uint64_t v10 = *(void **)(a1 + 32);
  if (v10 && ([v10 code] == 41 || objc_msgSend(*(id *)(a1 + 32), "code") == 11))
  {
    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Download already exists: %ld", objc_msgSend(*(id *)(a1 + 32), "code"), v24);
    SULogInfo(@"[DDM] %s: %@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUDDMManager _downloadRequestCompletedWithStatus:error:withDescriptor:]_block_invoke");

    id v18 = *(void **)(a1 + 40);
    id v26 = [v18 manager];
    id v19 = [v26 download];
    [v18 _handleExistingDownload:v19 targetUpdate:*(void *)(*(void *)(a1 + 40) + 40)];

LABEL_14:

    return;
  }
  if (*(unsigned char *)(a1 + 48) && !*(void *)(a1 + 32)) {
    return;
  }
  [*(id *)(a1 + 40) _scheduleDownloadRetryForReason:@"download failed to start"];
  notify_post((const char *)[(id)*MEMORY[0x263F77C10] UTF8String]);
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = +[SUState currentState];
  id v26 = v21;
  if (!v20)
  {
    [v21 setDdmPersistedError:0];
    goto LABEL_14;
  }
  uint64_t v22 = [*(id *)(a1 + 32) description];
  [v26 setDdmPersistedErrorDescription:v22];

  uint64_t v23 = (const char *)[(id)*MEMORY[0x263F77C08] UTF8String];

  notify_post(v23);
}

- (void)_handleScanResults:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v5 = [v4 preferredDescriptor];
  uint64_t v6 = [v4 alternateDescriptor];
  if (v5 | v6)
  {
    uint64_t v7 = self->_activeDeclarationEnforcedSU;
    uint64_t v8 = self->_descriptor;
    uint64_t v9 = v8;
    if (v7 && v8 && [(SUDescriptor *)v8 isRelevantToDeclaration:v7])
    {
      uint64_t v10 = [NSString stringWithFormat:@"Current declaration is good, nothing to do here"];
      SULogInfo(@"[DDM] %s: %@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUDDMManager _handleScanResults:]");
    }
    else
    {
      id v25 = (id)[(SUCorePolicyDDMConfiguration *)self->_ddmConfiguration invalidateAllInvalidDeclarationsReturningAllInvalid];
      id v26 = [(SUCorePolicyDDMConfiguration *)self->_ddmConfiguration allDeclarations];
      uint64_t v10 = v26;
      if (v26 && [v26 count])
      {
        uint64_t v50 = v9;
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __35__SUDDMManager__handleScanResults___block_invoke;
        v55[3] = &unk_26447CF00;
        v55[4] = self;
        id v27 = (uint64_t (**)(void, void, void))MEMORY[0x223C18480](v55);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v28 = v10;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v52;
          uint64_t v49 = v10;
          while (2)
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v52 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v51 + 1) + 8 * i);
              if (v27[2](v27, v33, v5) & 1) != 0 || (v27[2](v27, v33, v6))
              {
                uint64_t v10 = v49;
                goto LABEL_21;
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v56 count:16];
            uint64_t v10 = v49;
            if (v30) {
              continue;
            }
            break;
          }
        }

        id v28 = [NSString stringWithFormat:@"Nothing relevant found..."];
        SULogInfo(@"[DDM] %s: %@", v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[SUDDMManager _handleScanResults:]");
LABEL_21:

        uint64_t v9 = v50;
      }
      else
      {
        uint64_t v48 = [NSString stringWithFormat:@"No declarations available, nothing to do here"];
        SULogInfo(@"[DDM] %s: %@", v41, v42, v43, v44, v45, v46, v47, (uint64_t)"-[SUDDMManager _handleScanResults:]");
      }
    }
  }
  else
  {
    uint64_t v7 = [NSString stringWithFormat:@"No descriptors available"];
    SULogInfo(@"[DDM] %s: %@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[SUDDMManager _handleScanResults:]");
  }
}

uint64_t __35__SUDDMManager__handleScanResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 isRelevantToDeclaration:v5];
  if (v7)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [v6 humanReadableUpdateName];
    uint64_t v18 = [v8 stringWithFormat:@"Update found for declaration: %@ [%p], %@", v9, v6, v5];
    SULogInfo(@"[DDM] %s: %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUDDMManager _handleScanResults:]_block_invoke");

    [*(id *)(a1 + 32) _setActiveDeclaration:v5];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a3);
    [*(id *)(*(void *)(a1 + 32) + 56) disarmActivityScheduler];
    [*(id *)(a1 + 32) _initiateDownloadWithDescriptor:*(void *)(*(void *)(a1 + 32) + 40)];
  }

  return v7;
}

- (BOOL)handleDDMDeclaration:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1;
  uint64_t v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__SUDDMManager_handleDDMDeclaration_outError___block_invoke;
  v11[3] = &unk_26447CF28;
  id v8 = v6;
  uint64_t v14 = &v16;
  uint64_t v15 = &v22;
  id v12 = v8;
  uint64_t v13 = self;
  dispatch_sync(workQueue, v11);
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v9 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __46__SUDDMManager_handleDDMDeclaration_outError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 48);
    id v4 = [v2 dictionaryRepresentation];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v27 = *(id *)(v5 + 40);
    LOBYTE(v3) = [v3 addDeclaration:v4 returningError:&v27];
    objc_storeStrong((id *)(v5 + 40), v27);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v3;

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      id v6 = @"SUCCESS";
    }
    else {
      id v6 = @"FAILURE";
    }
    uint64_t v23 = [NSString stringWithFormat:@"Handled declaration %@: %@", *(void *)(a1 + 32), v6];
    SULogInfo(@"[DDM] %s: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDDMManager handleDDMDeclaration:outError:]_block_invoke");

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(NSObject **)(v14 + 8);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__SUDDMManager_handleDDMDeclaration_outError___block_invoke_2;
      block[3] = &unk_26447C8C8;
      void block[4] = v14;
      id v26 = *(id *)(a1 + 32);
      dispatch_async(v15, block);
    }
  }
  else
  {
    uint64_t v24 = [NSString stringWithFormat:@"Unable to handle null declaration"];
    SULogInfo(@"[DDM] %s: %@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[SUDDMManager handleDDMDeclaration:outError:]_block_invoke");

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[SUUtility errorWithCode:22];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __46__SUDDMManager_handleDDMDeclaration_outError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateDeclarationsWithNewDeclaration:*(void *)(a1 + 40)];
}

- (BOOL)cancelDDMDeclarationForKey:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  id v26 = [NSString stringWithFormat:@"About to cancel the declaration for key: %@", v6];
  SULogInfo(@"[DDM] %s: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]");

  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__1;
  uint64_t v40 = __Block_byref_object_dispose__1;
  id v41 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  if (!v6)
  {
    uint64_t v17 = +[SUUtility errorWithCode:22];
    uint64_t v18 = (void *)v37[5];
    v37[5] = v17;

    id v27 = [NSString stringWithFormat:@"Cannot cancel: key is nil"];
    SULogInfo(@"[DDM] %s: %@", v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]");

    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke;
  block[3] = &unk_26447CF78;
  void block[4] = self;
  id v29 = v6;
  uint64_t v30 = &v36;
  uint64_t v31 = &v32;
  dispatch_sync(workQueue, block);

  if (a4) {
LABEL_3:
  }
    *a4 = (id) v37[5];
LABEL_4:
  char v15 = *((unsigned char *)v33 + 24);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v15;
}

void __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) declarationForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 48) removeDeclarationForKey:*(void *)(a1 + 40)];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if ([v2 isEqual:*(void *)(*(void *)(a1 + 32) + 72)])
      {
        uint64_t v46 = [NSString stringWithFormat:@"The current active declaration was canceled, re-evaluate the declarations"];
        SULogInfo(@"[DDM] %s: %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]_block_invoke");

        [*(id *)(a1 + 32) _setActiveDeclaration:0];
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = 0;

        uint64_t v12 = [*(id *)(a1 + 32) manager];
        uint64_t v13 = [v12 download];
        uint64_t v14 = [v13 descriptor];
        int v15 = [v14 isRelevantToDeclaration:v2];

        if (v15)
        {
          uint64_t v47 = [NSString stringWithFormat:@"The current download is relevant to the canceled declaration; purge it"];
          SULogInfo(@"[DDM] %s: %@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]_block_invoke");

          uint64_t v23 = *(void **)(a1 + 32);
          v51[0] = MEMORY[0x263EF8330];
          v51[1] = 3221225472;
          v51[2] = __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke_2;
          v51[3] = &unk_26447CF50;
          v51[4] = v23;
          [v23 _purgeDownloadWithHandler:v51];
        }
        else
        {
          uint64_t v44 = *(void *)(a1 + 32);
          uint64_t v45 = *(NSObject **)(v44 + 8);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke_3;
          block[3] = &unk_26447C878;
          void block[4] = v44;
          dispatch_async(v45, block);
        }
      }
    }
    else
    {
      uint64_t v49 = [NSString stringWithFormat:@"Failed to remove declaration for key %@ from %@", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 48)];
      SULogInfo(@"[DDM] %s: %@", v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]_block_invoke");

      uint64_t v41 = +[SUUtility errorWithCode:-1];
      uint64_t v42 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v43 = *(void **)(v42 + 40);
      *(void *)(v42 + 40) = v41;
    }
  }
  else
  {
    uint64_t v24 = +[SUUtility errorWithCode:102];
    uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    uint64_t v48 = [NSString stringWithFormat:@"Cannot cancel: key is unknown"];
    SULogInfo(@"[DDM] %s: %@", v27, v28, v29, v30, v31, v32, v33, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]_block_invoke");
  }
}

uint64_t __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke_2(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _evaluateDeclarationsWithNewDeclaration:0];
}

uint64_t __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateDeclarationsWithNewDeclaration:0];
}

- (id)allDeclarations
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  uint64_t v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  workQueue = self->_workQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__SUDDMManager_allDeclarations__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(workQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __31__SUDDMManager_allDeclarations__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) allDeclarationsIncludingInvalid];

  return MEMORY[0x270F9A758]();
}

- (void)scanRequestDidFinishForOptions:(id)a3 results:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    [NSString stringWithFormat:@"Scan failed with error %@", a5];
    uint64_t v22 = LABEL_7:;
    SULogInfo(@"[DDM] %s: %@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUDDMManager scanRequestDidFinishForOptions:results:error:]");

    goto LABEL_8;
  }
  uint64_t v10 = [v8 clientName];
  if ([v10 isEqualToString:@"com.apple.SoftwareUpdateServices.DDM"])
  {

LABEL_6:
    [NSString stringWithFormat:@"Scan triggered by ddm, nothing to do here", v21];
    goto LABEL_7;
  }
  uint64_t v11 = [v8 identifier];
  int v12 = [v11 isEqualToString:@"com.apple.SoftwareUpdateServices.DDM"];

  if (v12) {
    goto LABEL_6;
  }
  if (v9)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SUDDMManager_scanRequestDidFinishForOptions_results_error___block_invoke;
    block[3] = &unk_26447C8C8;
    void block[4] = self;
    id v24 = v9;
    dispatch_async(workQueue, block);
  }
LABEL_8:
}

uint64_t __61__SUDDMManager_scanRequestDidFinishForOptions_results_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleScanResults:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[9];

  return [v2 _notifyUI:v3];
}

- (void)getDescriptorWithCallback:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SUDDMManager_getDescriptorWithCallback___block_invoke;
  v7[3] = &unk_26447CFA0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

uint64_t __42__SUDDMManager_getDescriptorWithCallback___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 40));
  }
  return result;
}

- (id)activeDDMDeclarationEnfrocedSU
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  uint64_t v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = self->_workQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SUDDMManager_activeDDMDeclarationEnfrocedSU__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(workQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__SUDDMManager_activeDDMDeclarationEnfrocedSU__block_invoke(uint64_t a1)
{
}

- (void)getActiveDDMDeclarationEnforcedSUWithResponse:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__SUDDMManager_getActiveDDMDeclarationEnforcedSUWithResponse___block_invoke;
  v7[3] = &unk_26447CFA0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

uint64_t __62__SUDDMManager_getActiveDDMDeclarationEnforcedSUWithResponse___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 72), 0);
  }
  return result;
}

- (void)downloadDidStart:(id)a3
{
  id v4 = a3;
  uint64_t v14 = [NSString stringWithFormat:@"download did start: %@", v4];
  SULogInfo(@"[DDM] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUDDMManager downloadDidStart:]");

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUDDMManager_downloadDidStart___block_invoke;
  block[3] = &unk_26447C8C8;
  void block[4] = self;
  id v16 = v4;
  id v13 = v4;
  dispatch_async(workQueue, block);
}

uint64_t __33__SUDDMManager_downloadDidStart___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelScheduledDownloadRetryForReason:@"download did start"];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = v2[5];

  return [v2 _handleExistingDownload:v3 targetUpdate:v4];
}

- (void)downloadDidFail:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v16 = [NSString stringWithFormat:@"download did fail: %@, error: %@", v6, a4];
  SULogInfo(@"[DDM] %s: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDDMManager downloadDidFail:withError:]");

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUDDMManager_downloadDidFail_withError___block_invoke;
  block[3] = &unk_26447C8C8;
  void block[4] = self;
  id v18 = v6;
  id v15 = v6;
  dispatch_async(workQueue, block);
}

void __42__SUDDMManager_downloadDidFail_withError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelScheduledDownloadRetryForReason:@"download did fail"];
  uint64_t v2 = [*(id *)(a1 + 40) descriptor];
  int v3 = [v2 isEqual:*(void *)(*(void *)(a1 + 32) + 40)];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 _scheduleDownloadRetryForReason:@"download failed"];
  }
}

- (void)downloadDidFinish:(id)a3 withInstallPolicy:(id)a4
{
  id v6 = a3;
  id v16 = [NSString stringWithFormat:@"download did finish: %@, install policy: %@", v6, a4];
  SULogInfo(@"[DDM] %s: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDDMManager downloadDidFinish:withInstallPolicy:]");

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SUDDMManager_downloadDidFinish_withInstallPolicy___block_invoke;
  block[3] = &unk_26447C8C8;
  void block[4] = self;
  id v18 = v6;
  id v15 = v6;
  dispatch_async(workQueue, block);
}

uint64_t __52__SUDDMManager_downloadDidFinish_withInstallPolicy___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelScheduledDownloadRetryForReason:@"download did finish"];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = v2[5];

  return [v2 _handleExistingDownload:v3 targetUpdate:v4];
}

- (void)downloadWasInvalidated:(id)a3
{
  id v4 = a3;
  uint64_t v14 = [NSString stringWithFormat:@"download was killed: %@", v4];
  SULogInfo(@"[DDM] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUDDMManager downloadWasInvalidated:]");

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SUDDMManager_downloadWasInvalidated___block_invoke;
  block[3] = &unk_26447C8C8;
  id v16 = v4;
  uint64_t v17 = self;
  id v13 = v4;
  dispatch_async(workQueue, block);
}

void __39__SUDDMManager_downloadWasInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) descriptor];
  int v3 = [v2 isEqual:*(void *)(*(void *)(a1 + 40) + 40)];

  if (v3)
  {
    [*(id *)(a1 + 40) _cancelScheduledDownloadRetryForReason:@"download was killed"];
    uint64_t v14 = [NSString stringWithFormat:@"Our download was killed; it's time to re-evaluate the declarations"];
    SULogInfo(@"[DDM] %s: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager downloadWasInvalidated:]_block_invoke");

    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    id v13 = *(void **)(a1 + 40);
    [v13 _evaluateDeclarationsWithNewDeclaration:0];
  }
}

- (void)installDidFinish:(id)a3
{
  id v4 = a3;
  uint64_t v14 = [NSString stringWithFormat:@"update was successfully installed: %@", v4];
  SULogInfo(@"[DDM] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUDDMManager installDidFinish:]");

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUDDMManager_installDidFinish___block_invoke;
  block[3] = &unk_26447C8C8;
  id v16 = v4;
  uint64_t v17 = self;
  id v13 = v4;
  dispatch_sync(workQueue, block);
}

void __33__SUDDMManager_installDidFinish___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 40)])
  {
    uint64_t v2 = [NSString stringWithFormat:@"The enforced update successfully finished; invalidating the declaration ..."];
    SULogInfo(@"[DDM] %s: %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUDDMManager installDidFinish:]_block_invoke");

    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void **)(v10 + 48);
    uint64_t v12 = [*(id *)(v10 + 72) declarationKey];
    [v11 invalidateDeclarationForKey:v12];

    uint64_t v20 = [NSString stringWithFormat:@"Declaration invalidated!"];
    SULogInfo(@"[DDM] %s: %@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUDDMManager installDidFinish:]_block_invoke");
  }
}

- (void)timeFiredForScheduler:(id)a3 withOptions:(id)a4 replyBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SUDDMManager_timeFiredForScheduler_withOptions_replyBlock___block_invoke;
  block[3] = &unk_26447C968;
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(workQueue, block);
}

void __61__SUDDMManager_timeFiredForScheduler_withOptions_replyBlock___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) safeStringForKey:@"com.apple.sus.ddm"];
  if (objc_msgSend(@"com.apple.sus.ddm.evaluate", "isEqualToString:"))
  {
    [*(id *)(a1 + 40) _evaluateDeclarationsWithNewDeclaration:0];
  }
  else if ([@"com.apple.sus.ddm.download" isEqualToString:v3])
  {
    [*(id *)(a1 + 40) _initiateDownloadWithDescriptor:*(void *)(*(void *)(a1 + 40) + 40)];
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (BOOL)setDDMGlobalSettings:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1;
  uint64_t v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__SUDDMManager_setDDMGlobalSettings_outError___block_invoke;
  v11[3] = &unk_26447CFC8;
  id v8 = v6;
  id v12 = v8;
  id v13 = self;
  uint64_t v14 = &v22;
  id v15 = &v16;
  dispatch_sync(gsWorkQueue, v11);
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v9 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __46__SUDDMManager_setDDMGlobalSettings_outError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v3 + 48);
  if (v2)
  {
    uint64_t v5 = [v2 dictionaryRepresentation];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v6 + 40);
    char v7 = [v4 addGlobalSettingsDeclaration:v5 returningError:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
  }
  else
  {
    [*(id *)(v3 + 48) removeGlobalSettingsDeclaration];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v15 = [NSString stringWithFormat:@"Failed to set global settings from %@ to %@, error: %@", *(void *)(*(void *)(a1 + 40) + 80), *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    SULogError(@"[DDM] %s: %@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[SUDDMManager setDDMGlobalSettings:outError:]_block_invoke");
    goto LABEL_21;
  }
  uint64_t v32 = [NSString stringWithFormat:@"Successfully set global settings from %@ to %@", *(void *)(*(void *)(a1 + 40) + 80), *(void *)(a1 + 32)];
  SULogInfo(@"[DDM] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUDDMManager setDDMGlobalSettings:outError:]_block_invoke");

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 80), *(id *)(a1 + 32));
  id v15 = +[SUPreferences sharedInstance];
  uint64_t v16 = *(void **)(*(void *)(a1 + 40) + 80);
  if (v16)
  {
    uint64_t v17 = [v16 automaticallyDownload];
    int64_t v18 = +[SUDDMManager _NSNumberToTriState:v17];

    if (v18 == 1)
    {
      uint64_t v19 = 1;
    }
    else
    {
      if (v18) {
        goto LABEL_12;
      }
      uint64_t v19 = 0;
    }
    [v15 enableAutomaticDownload:v19];
LABEL_12:
    uint64_t v27 = [*(id *)(*(void *)(a1 + 40) + 80) automaticallyInstallOSUpdates];
    int64_t v28 = +[SUDDMManager _NSNumberToTriState:v27];

    if (v28 == 1)
    {
      uint64_t v29 = 1;
    }
    else
    {
      if (v28) {
        goto LABEL_17;
      }
      uint64_t v29 = 0;
    }
    [v15 enableAutomaticUpdateV2:v29];
LABEL_17:
    uint64_t v30 = [*(id *)(*(void *)(a1 + 40) + 80) automaticallyInstallSystemAndSecurityUpdates];
    unint64_t v31 = +[SUDDMManager _NSNumberToTriState:v30];

    if (v31 <= 1)
    {
      [v15 enableAutoInstallSystemAndDataFiles:v31];
      [v15 enableAutoInstallSecurityResponse:v31];
    }
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 40) + 32) sendDDMGlobalSettingsToUI:*(void *)(*(void *)(a1 + 40) + 80)];
  }
LABEL_21:
}

- (id)getDDMGlobalSettingsWithError:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1;
  uint64_t v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUDDMManager_getDDMGlobalSettingsWithError___block_invoke;
  block[3] = &unk_26447C8A0;
  void block[4] = self;
  void block[5] = &v16;
  dispatch_sync(gsWorkQueue, block);
  uint64_t v14 = [NSString stringWithFormat:@"current global settings = %@", v17[5]];
  SULogDebug(@"[DDM] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUDDMManager getDDMGlobalSettingsWithError:]");

  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __46__SUDDMManager_getDDMGlobalSettingsWithError___block_invoke(uint64_t a1)
{
}

- (BOOL)enableGlobalNotifications
{
  uint64_t v2 = self;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = v2->_gsWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SUDDMManager_enableGlobalNotifications__block_invoke;
  block[3] = &unk_26447C9B8;
  void block[4] = v2;
  void block[5] = &v14;
  dispatch_sync(gsWorkQueue, block);
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"enableGlobalNotifications: %d", *((unsigned __int8 *)v15 + 24));
  SULogDebug(@"[DDM] %s: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager enableGlobalNotifications]");

  LOBYTE(v2) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v2;
}

void __41__SUDDMManager_enableGlobalNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) enableGlobalNotifications];

  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 80) enableGlobalNotifications];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 BOOLValue];
  }
}

- (BOOL)enableRapidSecurityResponse
{
  uint64_t v2 = self;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = v2->_gsWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUDDMManager_enableRapidSecurityResponse__block_invoke;
  block[3] = &unk_26447C9B8;
  void block[4] = v2;
  void block[5] = &v14;
  dispatch_sync(gsWorkQueue, block);
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"enableRapidSecurityResponse: %d", *((unsigned __int8 *)v15 + 24));
  SULogDebug(@"[DDM] %s: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager enableRapidSecurityResponse]");

  LOBYTE(v2) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v2;
}

void __43__SUDDMManager_enableRapidSecurityResponse__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) enableRapidSecurityResponse];

  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 80) enableRapidSecurityResponse];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 BOOLValue];
  }
}

- (BOOL)enableRapidSecurityResponseRollback
{
  uint64_t v2 = self;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = v2->_gsWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUDDMManager_enableRapidSecurityResponseRollback__block_invoke;
  block[3] = &unk_26447C9B8;
  void block[4] = v2;
  void block[5] = &v14;
  dispatch_sync(gsWorkQueue, block);
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"enableRapidSecurityResponseRollback: %d", *((unsigned __int8 *)v15 + 24));
  SULogDebug(@"[DDM] %s: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager enableRapidSecurityResponseRollback]");

  LOBYTE(v2) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v2;
}

void __51__SUDDMManager_enableRapidSecurityResponseRollback__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) enableRapidSecurityResponseRollback];

  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 80) enableRapidSecurityResponseRollback];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 BOOLValue];
  }
}

- (BOOL)isDealyingUpdates
{
  return [(SUDDMManager *)self updateDeferralPeriodDays] != 0;
}

- (unint64_t)updateDeferralPeriodDays
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SUDDMManager_updateDeferralPeriodDays__block_invoke;
  block[3] = &unk_26447C9B8;
  void block[4] = self;
  void block[5] = &v15;
  dispatch_sync(gsWorkQueue, block);
  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"updateDeferralPeriod: %lu", v16[3]);
  SULogDebug(@"[DDM] %s: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager updateDeferralPeriodDays]");

  unint64_t v11 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v11;
}

void __40__SUDDMManager_updateDeferralPeriodDays__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) combinedUpdatesDeferralPeriod];

  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 80) combinedUpdatesDeferralPeriod];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 unsignedIntegerValue];
  }
}

+ (int64_t)_NSNumberToTriState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 intValue] == 1) {
      int64_t v5 = 1;
    }
    else {
      int64_t v5 = 2 * ([v4 intValue] != 0);
    }
  }
  else
  {
    int64_t v5 = 2;
  }

  return v5;
}

- (int64_t)alwaysEnableAutoDownload
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 2;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SUDDMManager_alwaysEnableAutoDownload__block_invoke;
  block[3] = &unk_26447C9B8;
  void block[4] = self;
  void block[5] = &v17;
  dispatch_sync(gsWorkQueue, block);
  uint64_t v4 = NSString;
  int64_t v5 = [MEMORY[0x263F77D80] stringFromTriState:v18[3]];
  uint64_t v15 = [v4 stringWithFormat:@"alwaysEnableAutoDownload: %@", v5];
  SULogDebug(@"[DDM] %s: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager alwaysEnableAutoDownload]");

  int64_t v13 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v13;
}

void __40__SUDDMManager_alwaysEnableAutoDownload__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v2)
  {
    id v3 = [v2 automaticallyDownload];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[SUDDMManager _NSNumberToTriState:v3];
  }
}

- (int64_t)alwaysEnableAutoInstallOSUpdates
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 2;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUDDMManager_alwaysEnableAutoInstallOSUpdates__block_invoke;
  block[3] = &unk_26447C9B8;
  void block[4] = self;
  void block[5] = &v17;
  dispatch_sync(gsWorkQueue, block);
  uint64_t v4 = NSString;
  int64_t v5 = [MEMORY[0x263F77D80] stringFromTriState:v18[3]];
  uint64_t v15 = [v4 stringWithFormat:@"alwaysEnableAutoInstallOSUpdates: %@", v5];
  SULogDebug(@"[DDM] %s: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager alwaysEnableAutoInstallOSUpdates]");

  int64_t v13 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v13;
}

void __48__SUDDMManager_alwaysEnableAutoInstallOSUpdates__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v2)
  {
    id v3 = [v2 automaticallyInstallOSUpdates];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[SUDDMManager _NSNumberToTriState:v3];
  }
}

- (int64_t)alwaysEnableAutoInstallRapidSecurityResponse
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 2;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SUDDMManager_alwaysEnableAutoInstallRapidSecurityResponse__block_invoke;
  block[3] = &unk_26447C9B8;
  void block[4] = self;
  void block[5] = &v17;
  dispatch_sync(gsWorkQueue, block);
  uint64_t v4 = NSString;
  int64_t v5 = [MEMORY[0x263F77D80] stringFromTriState:v18[3]];
  uint64_t v15 = [v4 stringWithFormat:@"alwaysEnableAutoInstallRapidSecurityResponse: %@", v5];
  SULogDebug(@"[DDM] %s: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager alwaysEnableAutoInstallRapidSecurityResponse]");

  int64_t v13 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v13;
}

void __60__SUDDMManager_alwaysEnableAutoInstallRapidSecurityResponse__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v2)
  {
    id v3 = [v2 automaticallyInstallSystemAndSecurityUpdates];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[SUDDMManager _NSNumberToTriState:v3];
  }
}

- (unint64_t)recommendedCadence
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SUDDMManager_recommendedCadence__block_invoke;
  block[3] = &unk_26447C9B8;
  void block[4] = self;
  void block[5] = &v17;
  dispatch_sync(gsWorkQueue, block);
  uint64_t v4 = NSString;
  int64_t v5 = SUStringFromMDMSUPath(v18[3]);
  uint64_t v15 = [v4 stringWithFormat:@"recommendedCadence: %@", v5];
  SULogDebug(@"[DDM] %s: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager recommendedCadence]");

  unint64_t v13 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v13;
}

void __34__SUDDMManager_recommendedCadence__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) recommendationCadence];

  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 80) recommendationCadence];
    int v4 = [v3 intValue];

    if (v4)
    {
      int64_t v5 = [*(id *)(*(void *)(a1 + 32) + 80) recommendationCadence];
      int v6 = [v5 intValue];

      if (v6 == 1)
      {
        uint64_t v7 = 1;
      }
      else
      {
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 80) recommendationCadence];
        int v9 = [v8 intValue];

        if (v9 != 2) {
          return;
        }
        uint64_t v7 = 2;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSettings, 0);
  objc_storeStrong((id *)&self->_activeDeclarationEnforcedSU, 0);
  objc_storeStrong((id *)&self->_downloadScheduler, 0);
  objc_storeStrong((id *)&self->_evaluationScheduler, 0);
  objc_storeStrong((id *)&self->_ddmConfiguration, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_managerServerDelegate, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_gsWorkQueue, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end