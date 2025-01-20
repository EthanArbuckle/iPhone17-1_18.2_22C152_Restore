@interface SUManagerServer
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)mdmCommandConflictsWithDDM:(id)a3;
- (BOOL)underExclusiveControl;
- (SUManagerServer)init;
- (id)_clientForCurrentConnection;
- (id)_installReasons;
- (id)_mdmCommandConflictsWithDDMError;
- (id)autoInstallManager;
- (id)clients;
- (id)connectionQueue;
- (id)coreAnalyticsManager;
- (id)ddmManager;
- (id)installReasonForClientName:(id)a3;
- (id)manager;
- (void)_clientForegroundnessDidChange:(id)a3;
- (void)_clientMessagabilityDidChange:(id)a3;
- (void)_evaluateForegroundness;
- (void)_getDDMStatusWithKeys:(id)a3 withResult:(id)a4;
- (void)_notifyServerStart;
- (void)_run;
- (void)_sendLatestStatusForClient:(id)a3;
- (void)addClient:(id)a3;
- (void)autoInstallManager:(id)a3 didCancelOperation:(id)a4;
- (void)autoInstallManager:(id)a3 didExpireOperation:(id)a4 withError:(id)a5;
- (void)autoInstallManager:(id)a3 isReadyToInstall:(id)a4 withResult:(id)a5;
- (void)autoInstallManager:(id)a3 operationWasConsented:(id)a4;
- (void)autoInstallManager:(id)a3 passcodePolicyChanged:(unint64_t)a4 forOperation:(id)a5;
- (void)autoScanAndDownloadIfAvailable:(id)a3;
- (void)autoScanAndDownloadNow:(BOOL)a3 ifAvailable:(id)a4;
- (void)automaticDownloadDidFailToStartForNewUpdateAvailable:(id)a3 withError:(id)a4;
- (void)cancelAutoInstallOperation:(id)a3 withResult:(id)a4;
- (void)cancelDDMDeclaration:(id)a3 withResult:(id)a4;
- (void)cancelDDMDeclarationForKey:(id)a3 completion:(id)a4;
- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)clearingSpaceForDownload:(id)a3 clearing:(BOOL)a4;
- (void)consentToAutoInstallOperation:(id)a3 withResult:(id)a4;
- (void)createInstallationKeybag:(id)a3 withResult:(id)a4;
- (void)currentAutoInstallOperation:(BOOL)a3 withResult:(id)a4;
- (void)currentAutoInstallOperationForecast:(id)a3;
- (void)currentPasscodePolicy:(id)a3;
- (void)dealloc;
- (void)delayEndDate:(id)a3;
- (void)descriptor:(id)a3;
- (void)descriptors:(id)a3;
- (void)destroyInstallationKeybag;
- (void)deviceHasSufficientSpaceForDownload:(id)a3;
- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 replyHandler:(id)a5;
- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 replyHandler:(id)a4;
- (void)deviceHasSufficientSpaceForDownloads:(id)a3;
- (void)deviceHasSufficientSpaceForDownloadsIncludeAppPurging:(BOOL)a3 replyHandler:(id)a4;
- (void)downloadAndInstallState:(id)a3;
- (void)downloadDidFail:(id)a3 withError:(id)a4;
- (void)downloadDidFinish:(id)a3 withInstallPolicy:(id)a4;
- (void)downloadDidStart:(id)a3;
- (void)downloadProgressDidChange:(id)a3;
- (void)downloadWasInvalidatedForNewUpdatesAvailable:(id)a3;
- (void)eligibleRollbackWithOptions:(id)a3 withResult:(id)a4;
- (void)enableAutomaticDownload:(BOOL)a3;
- (void)enableAutomaticUpdateV2:(BOOL)a3;
- (void)exitExclusiveControl;
- (void)extraSpaceNeededForDownloadWithoutAppPurging:(id)a3;
- (void)getAllDeclarationsWithHandler:(id)a3;
- (void)getDDMDeclarationWithHandler:(id)a3;
- (void)getDDMGlobalSettingsWithHandler:(id)a3;
- (void)getDDMStatusWithKeys:(id)a3 completion:(id)a4;
- (void)getDDMUpdateDescriptorWithHandler:(id)a3;
- (void)getMandatorySoftwareUpdateDictionary:(id)a3;
- (void)getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler:(id)a3;
- (void)getShouldDisableAutoInstallIOSUpdatesToggleWithHandler:(id)a3;
- (void)getShouldDisableAutoInstallRSRToggleWithHandler:(id)a3;
- (void)goUnderExclusiveControl;
- (void)handleClientRequest:(const char *)a3 client:(id)a4 withRequestCallBack:(id)a5 withErrorCallBack:(id)a6;
- (void)handleDDMDeclaration:(id)a3 withResult:(id)a4;
- (void)installDidFail:(id)a3 withError:(id)a4;
- (void)installDidFinish:(id)a3;
- (void)installDidStart:(id)a3;
- (void)installPolicyDidChange:(id)a3;
- (void)installServerConfiguration;
- (void)installTonightScheduled:(BOOL)a3;
- (void)installUpdate:(id)a3;
- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4;
- (void)installUpdateWithOptions:(id)a3 withResult:(id)a4;
- (void)installWantsToStart:(id)a3 completion:(id)a4;
- (void)isAnyClientInUserInteraction:(id)a3;
- (void)isAutoUpdateEnabled:(id)a3;
- (void)isAutoUpdateScheduled:(id)a3;
- (void)isAutomaticDownloadEnabled:(id)a3;
- (void)isAutomaticUpdateV2Enabled:(id)a3;
- (void)isClearingSpaceForDownload:(id)a3;
- (void)isDelayingUpdates:(id)a3;
- (void)isDownloading:(id)a3;
- (void)isInstallationKeybagRequired:(id)a3;
- (void)isInstallationKeybagRequiredForDescriptor:(id)a3 result:(id)a4;
- (void)isRollingBack:(id)a3;
- (void)isScanning:(id)a3;
- (void)isSoftwareUpdateInProgress:(id)a3;
- (void)isSplatOnlyUpdateRollbackSuggested:(id)a3;
- (void)isUpdateReadyForInstallation:(id)a3;
- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4;
- (void)managedInstallationRequested:(id)a3;
- (void)networkMonitorDetectOverrides;
- (void)newOSDetected:(id)a3 deleteKeepAlive:(BOOL)a4;
- (void)pauseDownload:(id)a3;
- (void)presentAutoUpdateBanner:(id)a3;
- (void)presentingRecommendedUpdate:(id)a3 shouldPresent:(BOOL)a4;
- (void)previousRollback:(id)a3 withResult:(id)a4;
- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)recordSUAnalyticsEvent:(id)a3;
- (void)registerCSInstallPredicatesOnDate:(id)a3;
- (void)removeClient:(id)a3;
- (void)resetState;
- (void)resumeDownload:(id)a3;
- (void)rollbackDidFail:(id)a3 withError:(id)a4;
- (void)rollbackDidStart:(id)a3;
- (void)rollbackReadyForReboot:(id)a3;
- (void)rollbackReadyToStart:(id)a3 options:(id)a4 completion:(id)a5;
- (void)rollbackSucceeded:(id)a3;
- (void)rollbackSuggested:(id)a3 info:(id)a4;
- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4;
- (void)runOnClients:(id)a3;
- (void)runOnClientsUntilStop:(id)a3;
- (void)runUntilIdleExit;
- (void)rvGetCurrentNeRDInfoWithReply:(id)a3;
- (void)rvTriggerNeRDUpdate:(id)a3;
- (void)scanDidCompleteForOptions:(id)a3 results:(id)a4 error:(id)a5;
- (void)scanDidCompleteWithNewUpdateAvailable:(id)a3 error:(id)a4;
- (void)scanForUpdates:(id)a3 withResult:(id)a4;
- (void)scanRequestDidFinishForOptions:(id)a3 results:(id)a4 error:(id)a5;
- (void)scanRequestDidFinishForOptions:(id)a3 update:(id)a4 error:(id)a5;
- (void)scanRequestDidStartForOptions:(id)a3;
- (void)scheduleRollbackRebootForLater:(id)a3;
- (void)securityResponseRollbackSuggested:(id)a3 withResult:(id)a4;
- (void)sendDDMDeclarationToUI:(id)a3;
- (void)sendDDMGlobalSettingsToUI:(id)a3;
- (void)serverInitAndResumeWork;
- (void)setClientType:(int)a3 withResult:(id)a4;
- (void)setDDMGlobalSettings:(id)a3 completion:(id)a4;
- (void)setExclusiveControl:(BOOL)a3;
- (void)setLastRollbackDescriptor:(id)a3 withResult:(id)a4;
- (void)setMandatorySoftwareUpdateDictionary:(id)a3;
- (void)setUnderExclusiveControl:(BOOL)a3;
- (void)slaVersion:(id)a3;
- (void)softwareUpdatePathRestriction:(id)a3;
- (void)splatRollbackAllowed:(id)a3;
- (void)splatRollbackDetected:(id)a3;
- (void)splatUpdateDetected;
- (void)startDownload:(id)a3;
- (void)startDownloadWithMetadata:(id)a3 withResult:(id)a4;
- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)submitAllSUAnalyticsEvents;
- (void)submitSUAnalyticsEvent:(id)a3;
- (void)submitSUAnalyticsEventsWithName:(id)a3;
- (void)updateDownloadMetadata:(id)a3 withResult:(id)a4;
- (void)updateDownloadOptions:(id)a3 withResult:(id)a4;
- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5;
- (void)userAskedToDeferInstall;
- (void)writeKeepAliveFile:(id)a3;
@end

@implementation SUManagerServer

- (void)setClientType:(int)a3 withResult:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v8 = (void (**)(id, BOOL, void))a4;
  v6 = [(SUManagerServer *)self _clientForCurrentConnection];
  v7 = v6;
  if (v6) {
    [v6 setType:v4];
  }
  v8[2](v8, v7 != 0, 0);
}

- (id)_clientForCurrentConnection
{
  v2 = [MEMORY[0x263F08D68] currentConnection];
  v3 = [v2 userInfo];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

uint64_t __29__SUManagerServer_addClient___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 40) identifier];
  [*(id *)(*(void *)(a1 + 32) + 40) count];
  SULogInfo(@"Added client: %@, count: %lu", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);

  v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  return [v10 _sendLatestStatusForClient:v11];
}

- (void)_sendLatestStatusForClient:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(SUManagerServer *)self manager];
  uint64_t v5 = [v4 download];

  if (v5)
  {
    uint64_t v6 = [v7 proxy];
    [v6 downloadProgressDidChange:v5];
  }
}

void __42__SUManagerServer__evaluateForegroundness__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  [v2 setForeground:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

- (id)manager
{
  manager = self->_manager;
  if (!manager)
  {
    uint64_t v4 = +[SUManagerInterfaceFactory sharedInstance];
    uint64_t v5 = self->_manager;
    self->_manager = v4;

    [(SUManagerInterface *)self->_manager setDelegate:self];
    manager = self->_manager;
  }
  return manager;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  if ([(SUManagerServer *)self underExclusiveControl]
    && ([v5 valueForEntitlement:@"com.apple.softwareupdateservices.client.allowed"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 BOOLValue],
        v6,
        (v7 & 1) == 0))
  {
    long long v35 = 0u;
    long long v36 = 0u;
    if (v5) {
      [v5 auditToken];
    }
    uint64_t v34 = 0;
    long long v32 = v35;
    long long v33 = v36;
    CPCopyBundleIdentifierAndTeamFromAuditToken();
    SULogInfo(@"connection refused for unentitled client %@", v18, v19, v20, v21, v22, v23, v24, 0);
    BOOL v17 = 0;
  }
  else
  {
    uint64_t v8 = +[SUTransactionManager sharedInstance];
    [v8 beginTransaction:@"SUAddClientTransaction"];
    [v5 _setQueue:__connectionQueue];
    uint64_t v9 = [[SUManagerServerClient alloc] initWithConnection:v5];
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __62__SUManagerServer_Daemon__listener_shouldAcceptNewConnection___block_invoke;
    v29 = &unk_26447C8C8;
    v30 = self;
    v31 = v9;
    v10 = v9;
    uint64_t v11 = (void *)MEMORY[0x223C18480](&v26);
    [v5 setInterruptionHandler:v11];
    [v5 setInvalidationHandler:v11];
    v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CECB9A8];
    [v5 setRemoteObjectInterface:v12];

    v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CEC4760];
    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0, v26, v27, v28, v29, v30);
    BOOL v17 = 1;
    [v13 setClasses:v16 forSelector:sel_getAllDeclarationsWithHandler_ argumentIndex:0 ofReply:1];

    [v5 setExportedInterface:v13];
    [v5 setExportedObject:self];
    [v5 setUserInfo:v10];
    [v5 resume];
    [(SUManagerServer *)self addClient:v10];
    [v8 endTransaction:@"SUAddClientTransaction"];
  }
  return v17;
}

- (BOOL)underExclusiveControl
{
  return self->_underExclusiveControl;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__SUManagerServer_addClient___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __42__SUManagerServer__evaluateForegroundness__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SUManagerServer__evaluateForegroundness__block_invoke_2;
  v6[3] = &unk_26447D520;
  v6[4] = *(void *)(a1 + 40);
  [v2 runOnClientsUntilStop:v6];
  uint64_t v3 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUManagerServer__evaluateForegroundness__block_invoke_3;
  block[3] = &unk_26447C9B8;
  long long v5 = *(_OWORD *)(a1 + 32);
  dispatch_async(v3, block);
}

- (void)runOnClientsUntilStop:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v5 = self->_clients;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t __42__SUManagerServer__evaluateForegroundness__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isForeground];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __50__SUManagerServer__clientForegroundnessDidChange___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__evaluateForegroundness object:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 performSelector:sel__evaluateForegroundness withObject:0 afterDelay:0.2];
}

- (void)_clientForegroundnessDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SUManagerServer__clientForegroundnessDidChange___block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_evaluateForegroundness
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  char v5 = 0;
  clientQueue = self->_clientQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__SUManagerServer__evaluateForegroundness__block_invoke;
  v3[3] = &unk_26447C9B8;
  v3[4] = self;
  v3[5] = v4;
  dispatch_async(clientQueue, v3);
  _Block_object_dispose(v4, 8);
}

- (void)_run
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263EFFE88];
  while (1)
  {
    uint64_t v3 = (void *)MEMORY[0x223C18220](self, a2);
    CFRunLoopRunResult v4 = CFRunLoopRunInMode(v2, 15.0, 0);
    if (v4 != kCFRunLoopRunTimedOut) {
      break;
    }
    char v5 = +[SUTransactionManager sharedInstance];
    uint64_t v6 = (void *)[v5 copyTransactions];

    if (v6 && [v6 count])
    {
      uint64_t v7 = SULogCommon();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

      if (v8) {
        SULogDebug(@"Software update daemon continuing to run - transactions: %@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v6);
      }
      else {
        SULogInfo(@"Software update daemon continuing to run - busy.", v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }

LABEL_11:
  }
  if ((v4 - 1) >= 2) {
    goto LABEL_11;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_pred_0 != -1) {
    dispatch_once(&sharedInstance_pred_0, &__block_literal_global_5);
  }
  CFStringRef v2 = (void *)sharedInstance___instance_1;
  return v2;
}

uint64_t __33__SUManagerServer_sharedInstance__block_invoke()
{
  sharedInstance___instance_1 = objc_alloc_init(SUManagerServer);
  return MEMORY[0x270F9A758]();
}

- (SUManagerServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)SUManagerServer;
  CFStringRef v2 = [(SUManagerServer *)&v11 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    clients = v2->_clients;
    v2->_clients = v3;

    char v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.softwareupdateservicesd.clientQueue", v5);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v6;

    BOOL v8 = +[SUState currentState];
    v2->_underExclusiveControl = [v8 underExclusiveControl];

    uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel__clientMessagabilityDidChange_ name:@"SUClientMessagabilityChangedNotification" object:0];
    [v9 addObserver:v2 selector:sel__clientForegroundnessDidChange_ name:@"SUClientForegroundnessChangedNotification" object:0];
  }
  return v2;
}

- (id)autoInstallManager
{
  autoInstallManager = self->_autoInstallManager;
  if (!autoInstallManager)
  {
    CFRunLoopRunResult v4 = [SUAutoInstallManager alloc];
    char v5 = [(SUManagerServer *)self manager];
    dispatch_queue_t v6 = [(SUAutoInstallManager *)v4 initWithManager:v5];
    uint64_t v7 = self->_autoInstallManager;
    self->_autoInstallManager = v6;

    [(SUAutoInstallManager *)self->_autoInstallManager setDelegate:self];
    autoInstallManager = self->_autoInstallManager;
  }
  return autoInstallManager;
}

- (id)coreAnalyticsManager
{
  return +[SUAnalyticsManager sharedManager];
}

- (id)ddmManager
{
  ddmManager = self->_ddmManager;
  if (!ddmManager)
  {
    CFRunLoopRunResult v4 = [[SUDDMManager alloc] initWithDelegate:self];
    char v5 = self->_ddmManager;
    self->_ddmManager = v4;

    ddmManager = self->_ddmManager;
  }
  return ddmManager;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  clientQueue = self->_clientQueue;
  self->_clientQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)SUManagerServer;
  [(SUManagerServer *)&v5 dealloc];
}

- (void)runOnClients:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFRunLoopRunResult v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v5 = self->_clients;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)handleClientRequest:(const char *)a3 client:(id)a4 withRequestCallBack:(id)a5 withErrorCallBack:(id)a6
{
  uint64_t v15 = (void (**)(void))a5;
  uint64_t v7 = [a4 identifier];
  SULogInfo(@"client %@ called %s", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  v15[2]();
}

- (void)isScanning:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__SUManagerServer_isScanning___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __30__SUManagerServer_isScanning___block_invoke(uint64_t a1)
{
  CFStringRef v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__SUManagerServer_isScanning___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__SUManagerServer_isScanning___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isScanning:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __30__SUManagerServer_isScanning___block_invoke_2(uint64_t a1)
{
  CFStringRef v2 = [*(id *)(a1 + 32) manager];
  [v2 isScanning];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __30__SUManagerServer_isScanning___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)scanForUpdates:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__SUManagerServer_scanForUpdates_withResult___block_invoke;
  v13[3] = &unk_26447D2C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __45__SUManagerServer_scanForUpdates_withResult___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  CFStringRef v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SUManagerServer_scanForUpdates_withResult___block_invoke_2;
  v6[3] = &unk_26447D2C0;
  v6[4] = v3;
  id v7 = v2;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__SUManagerServer_scanForUpdates_withResult___block_invoke_4;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v3 handleClientRequest:"-[SUManagerServer scanForUpdates:withResult:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __45__SUManagerServer_scanForUpdates_withResult___block_invoke_2(id *a1)
{
  if ([a1[4] mdmCommandConflictsWithDDM:a1[5]])
  {
    CFStringRef v2 = (void (**)(id, void, id))a1[7];
    id v9 = [a1[4] _mdmCommandConflictsWithDDMError];
    v2[2](v2, 0, v9);
  }
  else
  {
    uint64_t v3 = [a1[5] identifier];
    if (v3)
    {
      id v4 = (void *)v3;
      id v5 = [a1[6] clientName];

      if (!v5)
      {
        id v6 = [a1[5] identifier];
        [a1[6] setClientName:v6];
      }
    }
    id v7 = [a1[4] manager];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__SUManagerServer_scanForUpdates_withResult___block_invoke_3;
    v10[3] = &unk_26447D298;
    id v8 = a1[6];
    id v11 = a1[7];
    [v7 scanForUpdates:v8 complete:v10];
  }
}

uint64_t __45__SUManagerServer_scanForUpdates_withResult___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __45__SUManagerServer_scanForUpdates_withResult___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)autoScanAndDownloadIfAvailable:(id)a3
{
}

- (void)autoScanAndDownloadNow:(BOOL)a3 ifAvailable:(id)a4
{
  id v6 = a4;
  id v7 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v8 = +[SUUtility mainWorkQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke;
  v11[3] = &unk_26447D310;
  v11[4] = self;
  id v12 = v7;
  BOOL v14 = a3;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);
}

void __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke(uint64_t a1)
{
  CFStringRef v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_2;
  v6[3] = &unk_26447D2E8;
  v6[4] = v2;
  char v8 = *(unsigned char *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_4;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer autoScanAndDownloadNow:ifAvailable:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_2(uint64_t a1)
{
  CFStringRef v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_3;
  void v4[3] = &unk_26447D298;
  id v5 = *(id *)(a1 + 40);
  [v2 autoScanAndDownloadIfAvailable:0 downloadNow:v3 withResult:v4];
}

uint64_t __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)descriptors:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SUManagerServer_descriptors___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __31__SUManagerServer_descriptors___block_invoke(uint64_t a1)
{
  CFStringRef v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__SUManagerServer_descriptors___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__SUManagerServer_descriptors___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer descriptors:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __31__SUManagerServer_descriptors___block_invoke_2(uint64_t a1)
{
  CFStringRef v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 preferredLastScannedDescriptor];
  id v11 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v3];

  id v4 = [*(id *)(a1 + 32) manager];
  id v5 = [v4 alternateLastScannedDescriptor];
  id v6 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v5];

  id v7 = [[SUScanResults alloc] initWithPreferredDescriptor:v11 alternateDescriptor:v6];
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    if (v7)
    {
      (*(void (**)(uint64_t, SUScanResults *, void))(v9 + 16))(v9, v7, 0);
    }
    else
    {
      id v10 = +[SUUtility errorWithCode:3];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
    }
  }
}

uint64_t __31__SUManagerServer_descriptors___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)descriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__SUManagerServer_descriptor___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __30__SUManagerServer_descriptor___block_invoke(uint64_t a1)
{
  CFStringRef v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__SUManagerServer_descriptor___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__SUManagerServer_descriptor___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer descriptor:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __30__SUManagerServer_descriptor___block_invoke_2(uint64_t a1)
{
  CFStringRef v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 preferredLastScannedDescriptor];
  id v6 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v3];

  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v6, 0);
    }
    else
    {
      id v5 = +[SUUtility errorWithCode:3];
      (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
    }
  }
}

uint64_t __30__SUManagerServer_descriptor___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)isClearingSpaceForDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUManagerServer_isClearingSpaceForDownload___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __46__SUManagerServer_isClearingSpaceForDownload___block_invoke(uint64_t a1)
{
  CFStringRef v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SUManagerServer_isClearingSpaceForDownload___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SUManagerServer_isClearingSpaceForDownload___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isClearingSpaceForDownload:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __46__SUManagerServer_isClearingSpaceForDownload___block_invoke_2(uint64_t a1)
{
  CFStringRef v2 = [*(id *)(a1 + 32) manager];
  [v2 isClearingSpace];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __46__SUManagerServer_isClearingSpaceForDownload___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)isDownloading:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUManagerServer_isDownloading___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __33__SUManagerServer_isDownloading___block_invoke(uint64_t a1)
{
  CFStringRef v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__SUManagerServer_isDownloading___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__SUManagerServer_isDownloading___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isDownloading:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __33__SUManagerServer_isDownloading___block_invoke_2(uint64_t a1)
{
  CFStringRef v2 = [*(id *)(a1 + 32) manager];
  [v2 isDownloading];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __33__SUManagerServer_isDownloading___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)startDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUManagerServer_startDownload___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __33__SUManagerServer_startDownload___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  CFStringRef v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__SUManagerServer_startDownload___block_invoke_2;
  v6[3] = &unk_26447C968;
  v6[4] = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__SUManagerServer_startDownload___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v3 handleClientRequest:"-[SUManagerServer startDownload:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __33__SUManagerServer_startDownload___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v3 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) manager];
    [v3 startDownload:*(void *)(a1 + 48)];
  }
}

uint64_t __33__SUManagerServer_startDownload___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke;
  v13[3] = &unk_26447D2C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke_2;
  v6[3] = &unk_26447D2C0;
  v6[4] = v3;
  id v7 = v2;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v3 handleClientRequest:"-[SUManagerServer startDownloadWithOptions:withResult:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v7 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) identifier];
    if (v3)
    {
      id v4 = (void *)v3;
      id v5 = [*(id *)(a1 + 48) clientName];

      if (!v5)
      {
        id v6 = [*(id *)(a1 + 40) identifier];
        [*(id *)(a1 + 48) setClientName:v6];
      }
    }
    id v7 = [*(id *)(a1 + 32) manager];
    [v7 startDownloadWithOptions:*(void *)(a1 + 48) withResult:*(void *)(a1 + 56)];
  }
}

uint64_t __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)startDownloadWithMetadata:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke;
  v13[3] = &unk_26447D2C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke_2;
  v6[3] = &unk_26447D2C0;
  v6[4] = v3;
  id v7 = v2;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v3 handleClientRequest:"-[SUManagerServer startDownloadWithMetadata:withResult:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v3 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) manager];
    [v3 startDownloadWithMetadata:*(void *)(a1 + 48) withResult:*(void *)(a1 + 56)];
  }
}

uint64_t __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke;
  v13[3] = &unk_26447D2C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke_2;
  v6[3] = &unk_26447D2C0;
  v6[4] = v3;
  id v7 = v2;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v3 handleClientRequest:"-[SUManagerServer cancelDownloadWithOptions:withResult:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v3 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) manager];
    [v3 cancelDownloadWithOptions:*(void *)(a1 + 48) withResult:*(void *)(a1 + 56)];
  }
}

uint64_t __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke;
  v13[3] = &unk_26447D2C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke_2;
  v6[3] = &unk_26447D2C0;
  v6[4] = v3;
  id v7 = v2;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v3 handleClientRequest:"-[SUManagerServer purgeDownloadWithOptions:withResult:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v3 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) manager];
    [v3 purgeDownloadWithOptions:*(void *)(a1 + 48) withResult:*(void *)(a1 + 56)];
  }
}

uint64_t __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)pauseDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUManagerServer_pauseDownload___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __33__SUManagerServer_pauseDownload___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__SUManagerServer_pauseDownload___block_invoke_2;
  v6[3] = &unk_26447C968;
  v6[4] = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__SUManagerServer_pauseDownload___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v3 handleClientRequest:"-[SUManagerServer pauseDownload:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __33__SUManagerServer_pauseDownload___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v3 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) manager];
    [v3 pauseDownload:*(void *)(a1 + 48)];
  }
}

uint64_t __33__SUManagerServer_pauseDownload___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)resumeDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SUManagerServer_resumeDownload___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __34__SUManagerServer_resumeDownload___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__SUManagerServer_resumeDownload___block_invoke_2;
  v6[3] = &unk_26447C968;
  v6[4] = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__SUManagerServer_resumeDownload___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v3 handleClientRequest:"-[SUManagerServer resumeDownload:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __34__SUManagerServer_resumeDownload___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v3 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) manager];
    [v3 resumeDownload:*(void *)(a1 + 48)];
  }
}

uint64_t __34__SUManagerServer_resumeDownload___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)updateDownloadMetadata:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke;
  v13[3] = &unk_26447D2C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke_2;
  v6[3] = &unk_26447D2C0;
  v6[4] = v3;
  id v7 = v2;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v3 handleClientRequest:"-[SUManagerServer updateDownloadMetadata:withResult:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v3 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) manager];
    [v3 updateDownloadMetadata:*(void *)(a1 + 48) withResult:*(void *)(a1 + 56)];
  }
}

uint64_t __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)updateDownloadOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke;
  v13[3] = &unk_26447D2C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke_2;
  v6[3] = &unk_26447D2C0;
  v6[4] = v3;
  id v7 = v2;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v3 handleClientRequest:"-[SUManagerServer updateDownloadOptions:withResult:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v7 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) identifier];
    if (v3)
    {
      id v4 = (void *)v3;
      id v5 = [*(id *)(a1 + 48) clientName];

      if (!v5)
      {
        id v6 = [*(id *)(a1 + 40) identifier];
        [*(id *)(a1 + 48) setClientName:v6];
      }
    }
    id v7 = [*(id *)(a1 + 32) manager];
    [v7 updateDownloadOptions:*(void *)(a1 + 48) withResult:*(void *)(a1 + 56)];
  }
}

uint64_t __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)downloadAndInstallState:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_downloadAndInstallState___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __43__SUManagerServer_downloadAndInstallState___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SUManagerServer_downloadAndInstallState___block_invoke_2;
  v6[3] = &unk_26447C968;
  v6[4] = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SUManagerServer_downloadAndInstallState___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v3 handleClientRequest:"-[SUManagerServer downloadAndInstallState:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __43__SUManagerServer_downloadAndInstallState___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(uint64_t, void, void, void, id))(v2 + 16))(v2, 0, 0, 0, v9);
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) manager];
    id v9 = [v3 download];

    id v4 = [*(id *)(a1 + 32) manager];
    id v5 = [v4 installPolicy];

    id v6 = [*(id *)(a1 + 32) autoInstallManager];
    id v7 = [v6 currentAutoInstallOperationCreatingIfNecessary:0 error:0];

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, id, void *, void *, void))(v8 + 16))(v8, v9, v5, v7, 0);
    }
  }
}

uint64_t __43__SUManagerServer_downloadAndInstallState___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, uint64_t))(result + 16))(result, 0, 0, 0, a2);
  }
  return result;
}

- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v12 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke;
  block[3] = &unk_26447D338;
  void block[4] = self;
  id v18 = v11;
  id v20 = v9;
  id v21 = v10;
  id v19 = v8;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(v12, block);
}

void __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2;
  v6[3] = &unk_26447D338;
  v6[4] = v3;
  id v7 = v2;
  id v10 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 64);
  [v3 handleClientRequest:"-[SUManagerServer updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    id v6 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 40) identifier];
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      id v4 = [*(id *)(a1 + 48) clientName];

      if (!v4)
      {
        id v5 = [*(id *)(a1 + 40) identifier];
        [*(id *)(a1 + 48) setClientName:v5];
      }
    }
    id v6 = [*(id *)(a1 + 32) manager];
    [v6 updatesDownloadableWithOptions:*(void *)(a1 + 48) alternateDownloadOptions:*(void *)(a1 + 56) replyHandler:*(void *)(a1 + 64)];
  }
}

uint64_t __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t, uint64_t))(result + 16))(result, 0, 0, a2, a2);
  }
  return result;
}

- (void)deviceHasSufficientSpaceForDownloads:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_4;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer deviceHasSufficientSpaceForDownloads:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_3;
  v2[3] = &unk_26447D360;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 deviceHasSufficientSpaceForDownloadsIncludeAppPurging:1 replyHandler:v2];
}

void __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v21 = a6;
  id v18 = a7;
  if (a2) {
    id v19 = &stru_26CE93248;
  }
  else {
    id v19 = @" not";
  }
  SULogInfo(@"device does%@ have enough space for preferred update download, and does%@ have enough space for alternate update download", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v19);
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, id))(v20 + 16))(v20, a2, a3, v21, v18);
  }
}

uint64_t __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t, uint64_t))(result + 16))(result, 0, 0, a2, a2);
  }
  return result;
}

- (void)deviceHasSufficientSpaceForDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_4;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer deviceHasSufficientSpaceForDownload:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_3;
  v2[3] = &unk_26447D388;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 deviceHasSufficientSpaceForDownloadIncludeAppPurging:1 replyHandler:v2];
}

void __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v14 = @" not";
  if (a2) {
    uint64_t v14 = &stru_26CE93248;
  }
  id v16 = v6;
  SULogInfo(@"device does%@ have enough space for download", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, a2, v16);
  }
}

uint64_t __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)extraSpaceNeededForDownloadWithoutAppPurging:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_4;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer extraSpaceNeededForDownloadWithoutAppPurging:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_3;
  v2[3] = &unk_26447D388;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 deviceHasSufficientSpaceForDownloadIncludeAppPurging:0 replyHandler:v2];
}

uint64_t __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  }
  return result;
}

uint64_t __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)isSoftwareUpdateInProgress:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    uint64_t v12 = [(SUManagerServer *)self _clientForCurrentConnection];
    uint64_t v13 = +[SUUtility mainWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke;
    block[3] = &unk_26447C968;
    void block[4] = self;
    id v16 = v12;
    id v17 = v11;
    id v14 = v12;
    dispatch_async(v13, block);
  }
  else
  {
    SULogError(@"%s: No reply handler provided", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerServer isSoftwareUpdateInProgress:]");
  }
}

void __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isSoftwareUpdateInProgress:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  [v2 download];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getDDMStatusWithKeys:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = [NSString stringWithFormat:@"Getting DDM status"];
  SULogInfo(@"[DDM] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer getDDMStatusWithKeys:completion:]");

  uint64_t v15 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v16 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke;
  block[3] = &unk_26447D3B0;
  void block[4] = self;
  id v22 = v15;
  id v23 = v6;
  id v24 = v7;
  id v17 = v7;
  id v18 = v6;
  id v19 = v15;
  dispatch_async(v16, block);
}

void __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke_2;
  v6[3] = &unk_26447C968;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer getDDMStatusWithKeys:completion:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getDDMStatusWithKeys:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
}

uint64_t __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)_getDDMStatusWithKeys:(id)a3 withResult:(id)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  v39 = (void (**)(id, void *, void))a4;
  id v5 = [(SUManagerServer *)self ddmManager];
  id v6 = [v5 activeDDMDeclarationEnfrocedSU];

  id v7 = [(SUManagerServer *)self manager];
  int v8 = [v7 isDownloading];

  uint64_t v9 = [(SUManagerServer *)self manager];
  uint64_t v10 = [v9 download];
  uint64_t v11 = [v10 progress];
  int v12 = [v11 isDone];

  uint64_t v13 = [(SUManagerServer *)self manager];
  int v14 = [v13 isInstalling];

  uint64_t v15 = [(SUManagerServer *)self manager];
  id v16 = [v15 download];
  id v17 = [v16 descriptor];

  id v18 = [MEMORY[0x263EFF9A0] dictionary];
  id v19 = v18;
  uint64_t v20 = @"none";
  if (v8) {
    uint64_t v20 = @"downloading";
  }
  if (v12) {
    uint64_t v20 = @"prepared";
  }
  if (v14) {
    id v21 = @"installing";
  }
  else {
    id v21 = v20;
  }
  [v18 setSafeObject:v21 forKey:*MEMORY[0x263F77BF0]];
  id v22 = [v17 productVersion];
  if ([v17 isSplatOnly])
  {
    id v23 = NSString;
    id v24 = [v17 productVersionExtra];
    uint64_t v25 = [v23 stringWithFormat:@"%@ %@", v22, v24];

    id v22 = (void *)v25;
  }
  if (!v22)
  {
    id v22 = [v6 versionString];
  }
  uint64_t v26 = *MEMORY[0x263F77BF8];
  [v19 setSafeObject:v22 forKey:*MEMORY[0x263F77BF8]];
  uint64_t v27 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  v28 = [v17 productBuildVersion];
  [v27 setSafeObject:v28 forKey:*MEMORY[0x263F77CB0]];

  v29 = [v17 productVersion];
  [v27 setSafeObject:v29 forKey:*MEMORY[0x263F77CD8]];

  v30 = [v6 enforcedInstallDate];
  v31 = [v30 description];
  uint64_t v32 = *MEMORY[0x263F77C00];
  [v27 setSafeObject:v31 forKey:*MEMORY[0x263F77C00]];

  [v19 setSafeObject:v27 forKey:v26];
  long long v33 = [v6 enforcedInstallDate];
  uint64_t v34 = [v33 description];
  [v19 setSafeObject:v34 forKey:v32];

  long long v35 = +[SUState currentState];
  long long v36 = [v35 ddmPersistedError];

  if (!v36)
  {
    uint64_t v40 = *MEMORY[0x263F77CB8];
    v41[0] = &unk_26CEBCFE8;
    long long v36 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
  }
  [v19 setSafeObject:v36 forKey:*MEMORY[0x263F77BE0]];
  v37 = [(SUManagerServer *)self _installReasons];
  [v19 setObject:v37 forKeyedSubscript:*MEMORY[0x263F77BE8]];

  v38 = (void *)[v19 copy];
  v39[2](v39, v38, 0);
}

- (id)_installReasons
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  uint64_t v4 = [(SUManagerServer *)self manager];
  id v5 = [v4 installPolicy];

  id v6 = [(SUManagerServer *)self manager];
  id v7 = [v6 download];
  int v8 = [v7 downloadOptions];

  uint64_t v9 = [(SUManagerServer *)self manager];
  LODWORD(v7) = [v9 isInstalling];

  if (v7)
  {
    uint64_t v10 = [v5 clientName];

    if (v10)
    {
      uint64_t v11 = v5;
LABEL_9:
      uint64_t v15 = [v11 clientName];
      id v16 = [(SUManagerServer *)self installReasonForClientName:v15];

      if (v16) {
        [v3 addObject:v16];
      }

      goto LABEL_12;
    }
  }
  if ([v8 isAutoDownload])
  {
    int v12 = [(SUManagerServer *)self autoInstallManager];
    int v13 = [v12 isAutoUpdateEnabled];

    if (v13) {
      [v3 addObject:@"auto-update"];
    }
  }
  int v14 = [v8 clientName];

  if (v14)
  {
    uint64_t v11 = v8;
    goto LABEL_9;
  }
LABEL_12:
  id v17 = [(SUManagerServer *)self manager];
  int v18 = [v17 isInstallTonight];

  if (v18) {
    [v3 addObject:@"install-tonight"];
  }
  id v19 = [(SUManagerServer *)self ddmManager];
  uint64_t v20 = [v19 activeDDMDeclarationEnfrocedSU];

  if (v20) {
    [v3 addObject:@"declaration"];
  }
  uint64_t v24 = *MEMORY[0x263F77CC0];
  id v21 = [v3 allObjects];
  v25[0] = v21;
  id v22 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];

  return v22;
}

- (id)installReasonForClientName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.Preferences"])
  {
    id v5 = @"system-settings";
  }
  else if (([v4 isEqualToString:@"com.apple.SoftwareUpdateServicesUI.iOSPlugin"] & 1) != 0 {
         || ([v4 isEqualToString:@"com.apple.susuiservice.SUSUInstallAlertCFUserNotificationUIExtension"] & 1) != 0|| (objc_msgSend(v4, "isEqualToString:", @"com.apple.SoftwareUpdateServices.SUSFollowUpExtension") & 1) != 0)
  }
  {
    id v5 = @"notification";
  }
  else if (([v4 isEqualToString:@"com.apple.purplebuddy"] & 1) != 0 {
         || ([v4 isEqualToString:@"com.apple.SetupAssistant"] & 1) != 0
  }
         || ([v4 isEqualToString:@"com.apple.migrationpluginwrapper"] & 1) != 0)
  {
    id v5 = @"setup-assistant";
  }
  else if ([v4 isEqualToString:@"dmd"])
  {
    id v5 = @"mdm";
  }
  else if ([v4 isEqualToString:@"com.apple.softwareupdateservicesd"])
  {
    id v7 = [(SUManagerServer *)self autoInstallManager];
    char v8 = [v7 isAutoUpdateEnabled];

    if (v8)
    {
      id v5 = @"auto-update";
    }
    else
    {
      uint64_t v9 = [(SUManagerServer *)self manager];
      int v10 = [v9 isInstallTonight];

      if (v10) {
        id v5 = @"install-tonight";
      }
      else {
        id v5 = 0;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)mdmCommandConflictsWithDDM:(id)a3
{
  id v4 = [a3 identifier];
  int v5 = [v4 isEqualToString:@"dmd"];
  if (v5)
  {
    id v6 = [(SUManagerServer *)self ddmManager];
    id v7 = [v6 activeDDMDeclarationEnfrocedSU];

    if (!v7)
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    id v4 = [NSString stringWithFormat:@"MDM command conflicts with DDM"];
    SULogInfo(@"[DDM] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer mdmCommandConflictsWithDDM:]");
  }

  return v5;
}

- (id)_mdmCommandConflictsWithDDMError
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  v10[0] = @"Rejecting MDM command for updates because an existing declaration is in place";
  uint64_t v3 = *MEMORY[0x263F08320];
  v9[0] = *MEMORY[0x263F07F80];
  v9[1] = v3;
  id v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  int v5 = [v4 localizedStringForKey:@"SU_MDM_CONFLICTS_WITH_DDM_ERROR" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  v10[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = [v2 errorWithDomain:@"com.apple.softwareupdateservices.errors" code:103 userInfo:v6];

  return v7;
}

- (void)cancelDDMDeclaration:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = [a3 declarationKey];
  [(SUManagerServer *)self cancelDDMDeclarationForKey:v7 completion:v6];
}

- (void)cancelDDMDeclarationForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v21 = [NSString stringWithFormat:@"in SUManagerServer"];
  SULogInfo(@"[DDM] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer cancelDDMDeclarationForKey:completion:]");

  if (v7) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = &__block_literal_global_404;
  }
  id v16 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v17 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_2;
  block[3] = &unk_26447D3B0;
  void block[4] = self;
  id v23 = v16;
  id v24 = v6;
  id v25 = v15;
  id v18 = v15;
  id v19 = v6;
  id v20 = v16;
  dispatch_async(v17, block);
}

void __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_3;
  v6[3] = &unk_26447C968;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_4;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer cancelDDMDeclarationForKey:completion:]_block_invoke_2" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ddmManager];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = 0;
  [v2 cancelDDMDeclarationForKey:v3 outError:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleDDMDeclaration:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v21 = [NSString stringWithFormat:@"in SUManagerServer"];
  SULogInfo(@"[DDM] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer handleDDMDeclaration:withResult:]");

  if (v7) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = &__block_literal_global_406;
  }
  id v16 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v17 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_2;
  block[3] = &unk_26447D3B0;
  void block[4] = self;
  id v23 = v16;
  id v24 = v6;
  id v25 = v15;
  id v18 = v15;
  id v19 = v6;
  id v20 = v16;
  dispatch_async(v17, block);
}

void __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_3;
  v6[3] = &unk_26447C968;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_4;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer handleDDMDeclaration:withResult:]_block_invoke_2" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ddmManager];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  [v2 handleDDMDeclaration:v3 outError:&v6];
  id v4 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  return notify_post((const char *)[(id)*MEMORY[0x263F77C18] UTF8String]);
}

uint64_t __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getDDMDeclarationWithHandler:(id)a3
{
  id v4 = a3;
  id v21 = [NSString stringWithFormat:@"in SUManagerServer"];
  SULogInfo(@"[DDM] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUManagerServer getDDMDeclarationWithHandler:]");

  if (!v4)
  {
    id v22 = [NSString stringWithFormat:@"No handler given"];
    SULogInfo(@"[DDM] %s: %@", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[SUManagerServer getDDMDeclarationWithHandler:]");

    id v4 = &__block_literal_global_412;
  }
  id v19 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_2;
  block[3] = &unk_26447C940;
  void block[4] = self;
  id v24 = v4;
  id v20 = v4;
  dispatch_async(v19, block);
}

void __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clientForCurrentConnection];
  uint64_t v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_3;
  v6[3] = &unk_26447C940;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_4;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 40);
  [v3 handleClientRequest:"-[SUManagerServer getDDMDeclarationWithHandler:]_block_invoke_2" client:v2 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ddmManager];
  id v12 = [v2 activeDDMDeclarationEnfrocedSU];

  if (v12)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = +[SUUtility errorWithCode:102];
  }
  uint64_t v11 = [NSString stringWithFormat:@"Reporting active declaration to client: %@", v12];
  SULogInfo(@"[DDM] %s: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerServer getDDMDeclarationWithHandler:]_block_invoke_3");

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getDDMUpdateDescriptorWithHandler:(id)a3
{
  id v4 = a3;
  id v21 = [NSString stringWithFormat:@"in SUManagerServer"];
  SULogInfo(@"[DDM] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUManagerServer getDDMUpdateDescriptorWithHandler:]");

  if (!v4)
  {
    id v22 = [NSString stringWithFormat:@"No handler given"];
    SULogInfo(@"[DDM] %s: %@", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[SUManagerServer getDDMUpdateDescriptorWithHandler:]");

    id v4 = &__block_literal_global_418;
  }
  id v19 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_2;
  block[3] = &unk_26447C940;
  void block[4] = self;
  id v24 = v4;
  id v20 = v4;
  dispatch_async(v19, block);
}

void __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clientForCurrentConnection];
  uint64_t v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_3;
  v6[3] = &unk_26447C940;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_5;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 40);
  [v3 handleClientRequest:"-[SUManagerServer getDDMUpdateDescriptorWithHandler:]_block_invoke_2" client:v2 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ddmManager];
  if (v2)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_4;
    v13[3] = &unk_26447D438;
    id v14 = *(id *)(a1 + 40);
    [v2 getDescriptorWithCallback:v13];
  }
  else
  {
    uint64_t v12 = [NSString stringWithFormat:@"Failed to get a valid ddm manager..."];
    SULogInfo(@"[DDM] %s: %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerServer getDDMUpdateDescriptorWithHandler:]_block_invoke_3");

    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = +[SUUtility errorWithCode:-1];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
}

uint64_t __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllDeclarationsWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[SUUtility mainWorkQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke;
    v6[3] = &unk_26447C940;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clientForCurrentConnection];
  uint64_t v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v3;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 40);
  [v3 handleClientRequest:"-[SUManagerServer getAllDeclarationsWithHandler:]_block_invoke" client:v2 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ddmManager];
  id v22 = v2;
  if (v2)
  {
    uint64_t v3 = [v2 allDeclarations];
    id v20 = [NSString stringWithFormat:@"declarations = %@", v3];
    SULogInfo(@"[DDM] %s: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerServer getAllDeclarationsWithHandler:]_block_invoke_2");

    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v21 = [NSString stringWithFormat:@"Failed to get a valid ddm manager..."];
    SULogInfo(@"[DDM] %s: %@", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[SUManagerServer getAllDeclarationsWithHandler:]_block_invoke_2");

    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v3 = +[SUUtility errorWithCode:-1];
    uint64_t v11 = *(void (**)(void))(v19 + 16);
  }
  v11();
}

uint64_t __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDDMGlobalSettings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke;
  v13[3] = &unk_26447D3B0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke_2;
  v6[3] = &unk_26447C968;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer setDDMGlobalSettings:completion:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ddmManager];
  uint64_t v3 = *(void *)(a1 + 40);
  id v15 = 0;
  uint64_t v4 = [v2 setDDMGlobalSettings:v3 outError:&v15];
  id v5 = v15;

  id v14 = [NSString stringWithFormat:@"setDDMGlobalSettings - result = %d, error = %@", v4, v5];
  SULogDebug(@"[DDM] %s: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUManagerServer setDDMGlobalSettings:completion:]_block_invoke_2");

  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v4, v5);
  }
}

uint64_t __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getDDMGlobalSettingsWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
    uint64_t v6 = +[SUUtility mainWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke;
    block[3] = &unk_26447C968;
    void block[4] = self;
    id v16 = v5;
    id v17 = v4;
    id v7 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"No reply handler provided"];
    SULogError(@"[DDM] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer getDDMGlobalSettingsWithHandler:]");
  }
}

void __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer getDDMGlobalSettingsWithHandler:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ddmManager];
  id v13 = 0;
  uint64_t v3 = [v2 getDDMGlobalSettingsWithError:&v13];
  id v4 = v13;

  uint64_t v12 = [NSString stringWithFormat:@"getDDMGlobalSettingsWithHandler - globalSettings = %@, error = %@", v3, v4];
  SULogDebug(@"[DDM] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUManagerServer getDDMGlobalSettingsWithHandler:]_block_invoke_2");

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getShouldDisableAutoInstallIOSUpdatesToggleWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(SUManagerServer *)self _clientForCurrentConnection];
    uint64_t v6 = +[SUUtility fastWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke;
    block[3] = &unk_26447C968;
    void block[4] = self;
    id v16 = v5;
    id v17 = v4;
    id v7 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"No reply handler provided"];
    SULogError(@"[DDM] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer getShouldDisableAutoInstallIOSUpdatesToggleWithHandler:]");
  }
}

void __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke_2;
  v7[3] = &unk_26447CFA0;
  id v4 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke_3;
  v5[3] = &unk_26447D270;
  id v6 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer getShouldDisableAutoInstallIOSUpdatesToggleWithHandler:]_block_invoke" client:v3 withRequestCallBack:v7 withErrorCallBack:v5];
}

void __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) ddmManager];
  (*(void (**)(uint64_t, BOOL, void))(v1 + 16))(v1, [v2 alwaysEnableAutoInstallOSUpdates] != 2, 0);
}

uint64_t __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(SUManagerServer *)self _clientForCurrentConnection];
    id v6 = +[SUUtility fastWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke;
    block[3] = &unk_26447C968;
    void block[4] = self;
    id v16 = v5;
    id v17 = v4;
    id v7 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"No reply handler provided"];
    SULogError(@"[DDM] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler:]");
  }
}

void __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke_2;
  v7[3] = &unk_26447CFA0;
  id v4 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke_3;
  v5[3] = &unk_26447D270;
  id v6 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler:]_block_invoke" client:v3 withRequestCallBack:v7 withErrorCallBack:v5];
}

void __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) ddmManager];
  (*(void (**)(uint64_t, BOOL, void))(v1 + 16))(v1, [v2 alwaysEnableAutoDownload] != 2, 0);
}

uint64_t __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getShouldDisableAutoInstallRSRToggleWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(SUManagerServer *)self _clientForCurrentConnection];
    id v6 = +[SUUtility fastWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke;
    block[3] = &unk_26447C968;
    void block[4] = self;
    id v16 = v5;
    id v17 = v4;
    id v7 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"No reply handler provided"];
    SULogError(@"[DDM] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer getShouldDisableAutoInstallRSRToggleWithHandler:]");
  }
}

void __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke_2;
  v7[3] = &unk_26447CFA0;
  id v4 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke_3;
  v5[3] = &unk_26447D270;
  id v6 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer getShouldDisableAutoInstallRSRToggleWithHandler:]_block_invoke" client:v3 withRequestCallBack:v7 withErrorCallBack:v5];
}

void __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) ddmManager];
  (*(void (**)(uint64_t, BOOL, void))(v1 + 16))(v1, [v2 alwaysEnableAutoInstallRapidSecurityResponse] != 2, 0);
}

uint64_t __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deviceHasSufficientSpaceForDownloadsIncludeAppPurging:(BOOL)a3 replyHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SUManagerServer *)self manager];
  id v8 = [v7 preferredLastScannedDescriptor];
  uint64_t v9 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v8];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__SUManagerServer_deviceHasSufficientSpaceForDownloadsIncludeAppPurging_replyHandler___block_invoke;
  v11[3] = &unk_26447D488;
  BOOL v13 = v4;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(SUManagerServer *)self deviceHasSufficientSpaceForDownloadIncludeAppPurging:v4 descriptor:v9 replyHandler:v11];
}

void __86__SUManagerServer_deviceHasSufficientSpaceForDownloadsIncludeAppPurging_replyHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) manager];
  id v10 = [v9 alternateLastScannedDescriptor];
  uint64_t v11 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v10];

  uint64_t v12 = *(unsigned __int8 *)(a1 + 48);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__SUManagerServer_deviceHasSufficientSpaceForDownloadsIncludeAppPurging_replyHandler___block_invoke_2;
  v17[3] = &unk_26447D460;
  BOOL v13 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v19 = v8;
  id v20 = v14;
  char v21 = a2;
  id v18 = v7;
  id v15 = v8;
  id v16 = v7;
  [v13 deviceHasSufficientSpaceForDownloadIncludeAppPurging:v12 descriptor:v11 replyHandler:v17];
}

uint64_t __86__SUManagerServer_deviceHasSufficientSpaceForDownloadsIncludeAppPurging_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, void, uint64_t, void, uint64_t))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), a2, *(void *)(a1 + 32), a3, *(void *)(a1 + 40), a4);
  }
  return result;
}

- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 replyHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SUManagerServer *)self manager];
  id v8 = [v7 download];
  uint64_t v9 = [v8 descriptor];

  id v10 = [(SUManagerServer *)self manager];
  if (v9)
  {
    uint64_t v11 = [v10 download];
    [v11 descriptor];
  }
  else
  {
    uint64_t v11 = [v10 preferredLastScannedDescriptor];
    +[SUManagerEngine SUDescriptorFromCoreDescriptor:v11];
  }
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  [(SUManagerServer *)self deviceHasSufficientSpaceForDownloadIncludeAppPurging:v4 descriptor:v12 replyHandler:v6];
}

- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 replyHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(SUManagerServer *)self manager];
  [v10 deviceHasSufficientSpaceForDownloadIncludeAppPurging:v6 descriptor:v9 replyHandler:v8];
}

- (void)isInstallationKeybagRequired:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  BOOL v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUManagerServer_isInstallationKeybagRequired___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __48__SUManagerServer_isInstallationKeybagRequired___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SUManagerServer_isInstallationKeybagRequired___block_invoke_2;
  v6[3] = &unk_26447C940;
  v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__SUManagerServer_isInstallationKeybagRequired___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isInstallationKeybagRequired:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __48__SUManagerServer_isInstallationKeybagRequired___block_invoke_2(uint64_t a1)
{
  id v2 = +[SUKeybagInterface sharedInstance];
  uint64_t v3 = [*(id *)(a1 + 32) manager];
  id v4 = [v3 download];
  id v5 = [v4 descriptor];
  [v2 installationKeybagStateForDescriptor:v5];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

uint64_t __48__SUManagerServer_isInstallationKeybagRequired___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)isInstallationKeybagRequiredForDescriptor:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke;
  v13[3] = &unk_26447D3B0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke_2;
  v8[3] = &unk_26447C968;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke_3;
  v6[3] = &unk_26447D270;
  id v7 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer isInstallationKeybagRequiredForDescriptor:result:]_block_invoke" client:v3 withRequestCallBack:v8 withErrorCallBack:v6];
}

void __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v8 = v2;
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) manager];
    id v4 = [v3 download];
    id v8 = [v4 descriptor];
  }
  uint64_t v5 = +[SUKeybagInterface sharedInstance];
  int v6 = [v5 installationKeybagStateForDescriptor:v8];

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, BOOL, void))(v7 + 16))(v7, v6 == 1, 0);
  }
}

uint64_t __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)isUpdateReadyForInstallation:(id)a3
{
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke;
  v13[3] = &unk_26447D3B0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2;
  v6[3] = &unk_26447C968;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_4;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer isUpdateReadyForInstallationWithOptions:withResult:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_3;
  void v4[3] = &unk_26447D4B0;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 isUpdateReadyForInstallationWithOptions:v3 withResult:v4];
}

uint64_t __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

uint64_t __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)installUpdate:(id)a3
{
}

- (void)installUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke;
  v13[3] = &unk_26447D2C0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke_2;
  v6[3] = &unk_26447D2C0;
  void v6[4] = v3;
  id v7 = v2;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v3 handleClientRequest:"-[SUManagerServer installUpdateWithOptions:withResult:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    id v13 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v2 = objc_alloc_init(SUInstallOptions);
    uint64_t v3 = *(void **)(a1 + 48);
    if (v3)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v15 != v7) {
              objc_enumerationMutation(v4);
            }
            id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if (v9)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v9 isEqualToString:@"SUInstallOptionDarkBoot"])
                {
                  [(SUInstallOptions *)v2 setDarkBoot:1];
                }
                else if ([v9 isEqualToString:@"SUInstallOptionRequireUpdate"])
                {
                  [(SUInstallOptions *)v2 setRequired:1];
                }
              }
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v6);
      }
    }
    id v10 = [*(id *)(a1 + 40) identifier];

    if (v10)
    {
      id v11 = [*(id *)(a1 + 40) identifier];
      [(SUInstallOptions *)v2 setClientName:v11];
    }
    id v12 = [*(id *)(a1 + 32) manager];
    [v12 installUpdateWithInstallOptions:v2 withResult:*(void *)(a1 + 56)];
  }
}

uint64_t __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke;
  v13[3] = &unk_26447D2C0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke_2;
  v6[3] = &unk_26447D2C0;
  void v6[4] = v3;
  id v7 = v2;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v3 handleClientRequest:"-[SUManagerServer installUpdateWithInstallOptions:withResult:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)])
  {
    id v4 = [*(id *)(a1 + 32) _mdmCommandConflictsWithDDMError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v2 = *(void **)(a1 + 48);
    uint64_t v3 = [*(id *)(a1 + 40) identifier];
    [v2 setClientName:v3];

    id v4 = [*(id *)(a1 + 32) manager];
    [v4 installUpdateWithInstallOptions:*(void *)(a1 + 48) withResult:*(void *)(a1 + 56)];
  }
}

uint64_t __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)userAskedToDeferInstall
{
  uint64_t v3 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v4 = +[SUUtility fastWorkQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SUManagerServer_userAskedToDeferInstall__block_invoke;
  v6[3] = &unk_26447C8C8;
  void v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __42__SUManagerServer_userAskedToDeferInstall__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__SUManagerServer_userAskedToDeferInstall__block_invoke_2;
  void v4[3] = &unk_26447C878;
  void v4[4] = v2;
  return [v2 handleClientRequest:"-[SUManagerServer userAskedToDeferInstall]_block_invoke" client:v1 withRequestCallBack:v4 withErrorCallBack:0];
}

void __42__SUManagerServer_userAskedToDeferInstall__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUManagerServer_userAskedToDeferInstall__block_invoke_3;
  block[3] = &unk_26447C878;
  void block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __42__SUManagerServer_userAskedToDeferInstall__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) runOnClients:&__block_literal_global_440];
}

void __42__SUManagerServer_userAskedToDeferInstall__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isMessagable])
  {
    id v2 = [v3 proxy];
    [v2 userWantsToDeferInstall];
  }
}

- (void)slaVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__SUManagerServer_slaVersion___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __30__SUManagerServer_slaVersion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__SUManagerServer_slaVersion___block_invoke_2;
  v6[3] = &unk_26447C940;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__SUManagerServer_slaVersion___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer slaVersion:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __30__SUManagerServer_slaVersion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 slaVersion];

  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[SUUtility errorWithCode:50 originalError:0];
  }
  id v6 = (id)v4;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v6);
  }
}

uint64_t __30__SUManagerServer_slaVersion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)softwareUpdatePathRestriction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke_2;
  v7[3] = &unk_26447CFA0;
  id v4 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke_3;
  v5[3] = &unk_26447D270;
  id v6 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer softwareUpdatePathRestriction:]_block_invoke" client:v3 withRequestCallBack:v7 withErrorCallBack:v5];
}

uint64_t __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    id v2 = [*(id *)(result + 32) manager];
    [v2 softwareUpdatePathRestriction];

    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)isDelayingUpdates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SUManagerServer_isDelayingUpdates___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __37__SUManagerServer_isDelayingUpdates___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SUManagerServer_isDelayingUpdates___block_invoke_2;
  v7[3] = &unk_26447CFA0;
  id v4 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__SUManagerServer_isDelayingUpdates___block_invoke_3;
  v5[3] = &unk_26447D270;
  id v6 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isDelayingUpdates:]_block_invoke" client:v3 withRequestCallBack:v7 withErrorCallBack:v5];
}

uint64_t __37__SUManagerServer_isDelayingUpdates___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    id v2 = [*(id *)(result + 32) manager];
    [v2 isDelayingUpdates];

    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __37__SUManagerServer_isDelayingUpdates___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)delayEndDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility fastWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SUManagerServer_delayEndDate___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __32__SUManagerServer_delayEndDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SUManagerServer_delayEndDate___block_invoke_2;
  v6[3] = &unk_26447D4F8;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__SUManagerServer_delayEndDate___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer delayEndDate:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __32__SUManagerServer_delayEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = +[SUUtility errorWithCode:61];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

uint64_t __32__SUManagerServer_delayEndDate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)splatRollbackAllowed:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SUManagerServer_splatRollbackAllowed___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __40__SUManagerServer_splatRollbackAllowed___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SUManagerServer_splatRollbackAllowed___block_invoke_2;
  v7[3] = &unk_26447CFA0;
  id v4 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SUManagerServer_splatRollbackAllowed___block_invoke_3;
  v5[3] = &unk_26447D270;
  id v6 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer splatRollbackAllowed:]_block_invoke" client:v3 withRequestCallBack:v7 withErrorCallBack:v5];
}

void __40__SUManagerServer_splatRollbackAllowed___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) manager];
    id v4 = 0;
    [v2 splatRollbackAllowed:&v4];
    id v3 = v4;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __40__SUManagerServer_splatRollbackAllowed___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)isSplatOnlyUpdateRollbackSuggested:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke_2;
  v7[3] = &unk_26447CFA0;
  id v4 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke_3;
  v5[3] = &unk_26447D270;
  id v6 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isSplatOnlyUpdateRollbackSuggested:]_block_invoke" client:v3 withRequestCallBack:v7 withErrorCallBack:v5];
}

uint64_t __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    id v2 = [*(id *)(result + 32) manager];
    [v2 isSplatOnlyUpdateRollbackSuggested];

    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v3();
  }
  return result;
}

uint64_t __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setMandatorySoftwareUpdateDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUManagerServer_setMandatorySoftwareUpdateDictionary___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __56__SUManagerServer_setMandatorySoftwareUpdateDictionary___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__SUManagerServer_setMandatorySoftwareUpdateDictionary___block_invoke_2;
  v3[3] = &unk_26447C8C8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 handleClientRequest:"-[SUManagerServer setMandatorySoftwareUpdateDictionary:]_block_invoke" client:v2 withRequestCallBack:v3 withErrorCallBack:0];
}

void __56__SUManagerServer_setMandatorySoftwareUpdateDictionary___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  [v2 setMandatoryUpdateDictionary:*(void *)(a1 + 40)];
}

- (void)getMandatorySoftwareUpdateDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke_2;
  v6[3] = &unk_26447C940;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer getMandatorySoftwareUpdateDictionary:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  id v5 = [v2 mandatoryUpdateDictionary];

  if (v5)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = +[SUUtility errorWithCode:62];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v5, v3);
  }
}

uint64_t __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)currentAutoInstallOperationForecast:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke_2;
  v6[3] = &unk_26447C940;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer currentAutoInstallOperationForecast:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) autoInstallManager];
  id v6 = 0;
  id v7 = 0;
  [v2 copyAutoInstallOperationForecast:&v7 error:&v6];
  id v3 = v7;
  id v4 = v6;

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v3, v4);
  }
}

uint64_t __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)currentAutoInstallOperation:(BOOL)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v8 = +[SUUtility mainWorkQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke;
  v11[3] = &unk_26447D310;
  v11[4] = self;
  id v12 = v7;
  BOOL v14 = a3;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);
}

void __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke_2;
  v6[3] = &unk_26447D2E8;
  void v6[4] = v2;
  char v8 = *(unsigned char *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer currentAutoInstallOperation:withResult:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) autoInstallManager];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v7 = 0;
  id v4 = [v2 currentAutoInstallOperationCreatingIfNecessary:v3 error:&v7];
  id v5 = v7;

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v4, v5);
  }
}

uint64_t __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)cancelAutoInstallOperation:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke;
  v13[3] = &unk_26447D2C0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke_2;
  v6[3] = &unk_26447D2C0;
  void v6[4] = v3;
  id v7 = v2;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v3 handleClientRequest:"-[SUManagerServer cancelAutoInstallOperation:withResult:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v7 = [v3 _mdmCommandConflictsWithDDMError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v4 = [v3 autoInstallManager];
    [v4 cancelAutoInstallOperation:*(void *)(a1 + 48)];

    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
  }
}

uint64_t __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)consentToAutoInstallOperation:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke;
  v13[3] = &unk_26447D2C0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  int v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke_2;
  v6[3] = &unk_26447D2C0;
  void v6[4] = v3;
  id v7 = v2;
  id v9 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v3 handleClientRequest:"-[SUManagerServer consentToAutoInstallOperation:withResult:]_block_invoke" client:v7 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) mdmCommandConflictsWithDDM:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v7 = [v3 _mdmCommandConflictsWithDDMError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v4 = [v3 autoInstallManager];
    [v4 consentToAutoInstallOperation:*(void *)(a1 + 48)];

    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
  }
}

uint64_t __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)currentPasscodePolicy:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SUManagerServer_currentPasscodePolicy___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __41__SUManagerServer_currentPasscodePolicy___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__SUManagerServer_currentPasscodePolicy___block_invoke_2;
  v6[3] = &unk_26447C940;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__SUManagerServer_currentPasscodePolicy___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer currentPasscodePolicy:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __41__SUManagerServer_currentPasscodePolicy___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) autoInstallManager];
  uint64_t v3 = [v2 passcodePolicy];
  [v3 currentPolicyType];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __41__SUManagerServer_currentPasscodePolicy___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)isAutoUpdateEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SUManagerServer_isAutoUpdateEnabled___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __39__SUManagerServer_isAutoUpdateEnabled___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__SUManagerServer_isAutoUpdateEnabled___block_invoke_2;
  v6[3] = &unk_26447C940;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__SUManagerServer_isAutoUpdateEnabled___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isAutoUpdateEnabled:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __39__SUManagerServer_isAutoUpdateEnabled___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) autoInstallManager];
  [v2 isAutoUpdateEnabled];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __39__SUManagerServer_isAutoUpdateEnabled___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)isAutoUpdateScheduled:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SUManagerServer_isAutoUpdateScheduled___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __41__SUManagerServer_isAutoUpdateScheduled___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__SUManagerServer_isAutoUpdateScheduled___block_invoke_2;
  v6[3] = &unk_26447C940;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__SUManagerServer_isAutoUpdateScheduled___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isAutoUpdateScheduled:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __41__SUManagerServer_isAutoUpdateScheduled___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) manager];
  [v2 isInstallTonightScheduled];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __41__SUManagerServer_isAutoUpdateScheduled___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)enableAutomaticUpdateV2:(BOOL)a3
{
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility fastWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke;
  block[3] = &unk_26447CED8;
  void block[4] = self;
  id v9 = v5;
  BOOL v10 = a3;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke_2;
  void v4[3] = &unk_26447CD98;
  char v5 = *(unsigned char *)(a1 + 48);
  void v4[4] = v2;
  return [v2 handleClientRequest:"-[SUManagerServer enableAutomaticUpdateV2:]_block_invoke" client:v1 withRequestCallBack:v4 withErrorCallBack:0];
}

void __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogDebug(@"AutomaticUpdateV2 enabled : %d", a2, a3, a4, a5, a6, a7, a8, *(unsigned __int8 *)(a1 + 40));
  id v9 = +[SUPreferences sharedInstance];
  [v9 enableAutomaticUpdateV2:*(unsigned __int8 *)(a1 + 40)];

  BOOL v10 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke_3;
  block[3] = &unk_26447CD98;
  char v12 = *(unsigned char *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v10, block);
}

void __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
    id v13 = 0;
    int v2 = [v1 currentAutoInstallOperationCreatingIfNecessary:1 error:&v13];
    id v3 = v13;
    id v11 = v3;
    if (v2)
    {
      SULogInfo(@"Scheduled auto install operation: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v2);
    }
    else if (v3)
    {
      SULogInfo(@"Error scheduling auto install operation: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    }
  }
  else
  {
    id v12 = +[SUScheduler sharedInstance];
    [v12 cancelAllAutoInstallTasks];
  }
}

- (void)isAutomaticUpdateV2Enabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v6 = +[SUUtility fastWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke_2;
  v6[3] = &unk_26447D4F8;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isAutomaticUpdateV2Enabled:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke_2(uint64_t a1)
{
  int v2 = +[SUPreferences sharedInstance];
  [v2 isAutomaticUpdateV2Enabled];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)enableAutomaticDownload:(BOOL)a3
{
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v6 = +[SUUtility fastWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_enableAutomaticDownload___block_invoke;
  block[3] = &unk_26447CED8;
  void block[4] = self;
  id v9 = v5;
  BOOL v10 = a3;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __43__SUManagerServer_enableAutomaticDownload___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SUManagerServer_enableAutomaticDownload___block_invoke_2;
  void v4[3] = &unk_26447CD98;
  char v5 = *(unsigned char *)(a1 + 48);
  void v4[4] = v2;
  return [v2 handleClientRequest:"-[SUManagerServer enableAutomaticDownload:]_block_invoke" client:v1 withRequestCallBack:v4 withErrorCallBack:0];
}

void __43__SUManagerServer_enableAutomaticDownload___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a1 + 40)) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  SULogDebug(@"Setting automatic download enabled : %@", a2, a3, a4, a5, a6, a7, a8, (uint64_t)v9);
  BOOL v10 = +[SUPreferences sharedInstance];
  [v10 enableAutomaticDownload:*(unsigned __int8 *)(a1 + 40)];

  id v11 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_enableAutomaticDownload___block_invoke_3;
  block[3] = &unk_26447CD98;
  char v13 = *(unsigned char *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v11, block);
}

void __43__SUManagerServer_enableAutomaticDownload___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
    [v1 autoScanAndDownloadIfAvailable:0];
  }
  else
  {
    id v2 = +[SUScheduler sharedInstance];
    [v2 cancelAllAutoDownloadTasks];
  }
}

- (void)isAutomaticDownloadEnabled:(id)a3
{
  id v4 = a3;
  char v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v6 = +[SUUtility fastWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke_2;
  v6[3] = &unk_26447D4F8;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isAutomaticDownloadEnabled:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke_2(uint64_t a1)
{
  id v2 = +[SUPreferences sharedInstance];
  [v2 isAutomaticDownloadEnabled];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)registerCSInstallPredicatesOnDate:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUManagerServer_registerCSInstallPredicatesOnDate___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __53__SUManagerServer_registerCSInstallPredicatesOnDate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__SUManagerServer_registerCSInstallPredicatesOnDate___block_invoke_2;
  v3[3] = &unk_26447C878;
  id v4 = *(id *)(a1 + 48);
  [v1 handleClientRequest:"-[SUManagerServer registerCSInstallPredicatesOnDate:]_block_invoke" client:v2 withRequestCallBack:v3 withErrorCallBack:0];
}

void __53__SUManagerServer_registerCSInstallPredicatesOnDate___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[SUScheduler sharedInstance];
  [v2 cancelInstallAlertRegistration];

  id v3 = +[SUScheduler sharedInstance];
  [v3 scheduleInstallAlertRegistration:*(void *)(a1 + 32)];
}

- (void)presentAutoUpdateBanner:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_presentAutoUpdateBanner___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __43__SUManagerServer_presentAutoUpdateBanner___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SUManagerServer_presentAutoUpdateBanner___block_invoke_2;
  v6[3] = &unk_26447C940;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SUManagerServer_presentAutoUpdateBanner___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer presentAutoUpdateBanner:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __43__SUManagerServer_presentAutoUpdateBanner___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  [v2 presentAutoUpdateBanner:*(void *)(a1 + 40)];
}

uint64_t __43__SUManagerServer_presentAutoUpdateBanner___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)eligibleRollbackWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke;
  v13[3] = &unk_26447D3B0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke_2;
  v6[3] = &unk_26447C968;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer eligibleRollbackWithOptions:withResult:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  id v5 = [v2 eligibleRollbackWithOptions:*(void *)(a1 + 40)];

  uint64_t v3 = +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:v5];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v3, 0);
  }
}

uint64_t __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke;
  v13[3] = &unk_26447D3B0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke_2;
  v6[3] = &unk_26447C968;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer rollbackUpdateWithOptions:withResult:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  [v2 rollbackUpdateWithOptions:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
}

uint64_t __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

- (void)previousRollback:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__SUManagerServer_previousRollback_withResult___block_invoke;
  v13[3] = &unk_26447D3B0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __47__SUManagerServer_previousRollback_withResult___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__SUManagerServer_previousRollback_withResult___block_invoke_2;
  v6[3] = &unk_26447C968;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__SUManagerServer_previousRollback_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer previousRollback:withResult:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __47__SUManagerServer_previousRollback_withResult___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  id v5 = [v2 previousRollbackWithOptions:*(void *)(a1 + 40)];

  uint64_t v3 = +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:v5];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v3, 0);
  }
}

uint64_t __47__SUManagerServer_previousRollback_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)isRollingBack:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUManagerServer_isRollingBack___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __33__SUManagerServer_isRollingBack___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__SUManagerServer_isRollingBack___block_invoke_2;
  v6[3] = &unk_26447C940;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__SUManagerServer_isRollingBack___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer isRollingBack:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __33__SUManagerServer_isRollingBack___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = [v2 isRollingBack];

  id v4 = [*(id *)(a1 + 32) manager];
  id v5 = [v4 eligibleRollbackWithOptions:0];

  if (v5)
  {
    uint64_t v6 = +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v8 = (id)v6;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id, void))(v7 + 16))(v7, v3, v8, 0);
  }
}

uint64_t __33__SUManagerServer_isRollingBack___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

- (void)scheduleRollbackRebootForLater:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke_2;
  v6[3] = &unk_26447D4F8;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer scheduleRollbackRebootForLater:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke_2(uint64_t a1)
{
  id v2 = +[SUScheduler sharedInstance];
  uint64_t v3 = +[SUAutoInstallManager rollbackRebootLaterTime];
  [v2 scheduleRollbackReboot:v3];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setLastRollbackDescriptor:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke;
  v13[3] = &unk_26447D3B0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke_2;
  v6[3] = &unk_26447C940;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer setLastRollbackDescriptor:withResult:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(@"Settings SULastRollbackDescriptor: %@", a2, a3, a4, a5, a6, a7, a8, *(void *)(a1 + 32));
  id v9 = +[SUState currentState];
  [v9 setLastRollbackDescriptor:*(void *)(a1 + 32)];

  id v10 = +[SUState currentState];
  [v10 save];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v12 = *(uint64_t (**)(void))(result + 16);
    return v12();
  }
  return result;
}

uint64_t __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)securityResponseRollbackSuggested:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v9 = +[SUUtility mainWorkQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke;
  v13[3] = &unk_26447D3B0;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke_2;
  v6[3] = &unk_26447C968;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer securityResponseRollbackSuggested:withResult:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  [v2 securityResponseRollbackSuggested:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
}

uint64_t __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)createInstallationKeybag:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  SULogInfo(@"%s was called by a client", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer createInstallationKeybag:withResult:]");
  id v15 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v16 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke;
  block[3] = &unk_26447D3B0;
  void block[4] = self;
  id v21 = v15;
  id v22 = v6;
  id v23 = v7;
  id v17 = v7;
  id v18 = v6;
  id v19 = v15;
  dispatch_async(v16, block);
}

void __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke_2;
  v6[3] = &unk_26447C968;
  void v6[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 56);
  [v2 handleClientRequest:"-[SUManagerServer createInstallationKeybag:withResult:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

void __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  [v2 createInstallationKeybag:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
}

uint64_t __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)destroyInstallationKeybag
{
  uint64_t v3 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v4 = +[SUUtility mainWorkQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SUManagerServer_destroyInstallationKeybag__block_invoke;
  v6[3] = &unk_26447C8C8;
  void v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __44__SUManagerServer_destroyInstallationKeybag__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SUManagerServer_destroyInstallationKeybag__block_invoke_2;
  void v4[3] = &unk_26447C878;
  void v4[4] = v2;
  return [v2 handleClientRequest:"-[SUManagerServer destroyInstallationKeybag]_block_invoke" client:v1 withRequestCallBack:v4 withErrorCallBack:0];
}

void __44__SUManagerServer_destroyInstallationKeybag__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) manager];
  [v1 destroyInstallationKeybag];
}

- (void)installServerConfiguration
{
  uint64_t v3 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v4 = +[SUUtility mainWorkQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SUManagerServer_installServerConfiguration__block_invoke;
  v6[3] = &unk_26447C8C8;
  void v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __45__SUManagerServer_installServerConfiguration__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleClientRequest:"-[SUManagerServer installServerConfiguration]_block_invoke" client:*(void *)(a1 + 40) withRequestCallBack:&__block_literal_global_468 withErrorCallBack:0];
}

void __45__SUManagerServer_installServerConfiguration__block_invoke_2()
{
  id v0 = [MEMORY[0x263F77B40] sharedServerSettings];
  [v0 installServerSettings];
}

- (void)setExclusiveControl:(BOOL)a3
{
  id v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SUManagerServer_setExclusiveControl___block_invoke;
  block[3] = &unk_26447CED8;
  void block[4] = self;
  id v9 = v5;
  BOOL v10 = a3;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __39__SUManagerServer_setExclusiveControl___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__SUManagerServer_setExclusiveControl___block_invoke_2;
  void v4[3] = &unk_26447CD98;
  char v5 = *(unsigned char *)(a1 + 48);
  void v4[4] = v2;
  return [v2 handleClientRequest:"-[SUManagerServer setExclusiveControl:]_block_invoke" client:v1 withRequestCallBack:v4 withErrorCallBack:0];
}

uint64_t __39__SUManagerServer_setExclusiveControl___block_invoke_2(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 goUnderExclusiveControl];
  }
  else {
    return [v2 exitExclusiveControl];
  }
}

- (void)writeKeepAliveFile:(id)a3
{
  id v4 = a3;
  char v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SUManagerServer_writeKeepAliveFile___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __38__SUManagerServer_writeKeepAliveFile___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SUManagerServer_writeKeepAliveFile___block_invoke_2;
  v6[3] = &unk_26447D4F8;
  id v7 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__SUManagerServer_writeKeepAliveFile___block_invoke_3;
  void v4[3] = &unk_26447D270;
  id v5 = *(id *)(a1 + 48);
  [v2 handleClientRequest:"-[SUManagerServer writeKeepAliveFile:]_block_invoke" client:v3 withRequestCallBack:v6 withErrorCallBack:v4];
}

uint64_t __38__SUManagerServer_writeKeepAliveFile___block_invoke_2(uint64_t a1)
{
  +[SUUtility writeKeepAliveFile];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __38__SUManagerServer_writeKeepAliveFile___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)recordSUAnalyticsEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[SUUtility mainWorkQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SUManagerServer_recordSUAnalyticsEvent___block_invoke;
  v7[3] = &unk_26447C8C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__SUManagerServer_recordSUAnalyticsEvent___block_invoke(uint64_t a1)
{
  id v2 = SULogAnalytics();
  SULogInfoForSubsystem(v2, @"Saving event %@\n", v3, v4, v5, v6, v7, v8, *(void *)(a1 + 32));

  id v9 = [*(id *)(a1 + 40) coreAnalyticsManager];
  [v9 setEvent:*(void *)(a1 + 32)];
}

- (void)submitSUAnalyticsEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SUUtility mainWorkQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SUManagerServer_submitSUAnalyticsEvent___block_invoke;
  v7[3] = &unk_26447C8C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__SUManagerServer_submitSUAnalyticsEvent___block_invoke(uint64_t a1)
{
  id v2 = SULogAnalytics();
  SULogInfoForSubsystem(v2, @"Saving event %@\n", v3, v4, v5, v6, v7, v8, *(void *)(a1 + 32));

  id v9 = [*(id *)(a1 + 40) coreAnalyticsManager];
  [v9 setEvent:*(void *)(a1 + 32)];

  id v10 = SULogAnalytics();
  id v11 = [*(id *)(a1 + 32) eventName];
  SULogInfoForSubsystem(v10, @"Submitting event %@\n", v12, v13, v14, v15, v16, v17, (uint64_t)v11);

  id v18 = [*(id *)(a1 + 40) coreAnalyticsManager];
  [v18 submitEvent:*(void *)(a1 + 32)];
}

- (void)submitAllSUAnalyticsEvents
{
  uint64_t v3 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUManagerServer_submitAllSUAnalyticsEvents__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __45__SUManagerServer_submitAllSUAnalyticsEvents__block_invoke(uint64_t a1)
{
  id v2 = SULogAnalytics();
  SULogInfoForSubsystem(v2, @"Submitting all CoreAnalytics events\n", v3, v4, v5, v6, v7, v8, v9);

  id v10 = [*(id *)(a1 + 32) coreAnalyticsManager];
  [v10 submitAllEvents];
}

- (void)submitSUAnalyticsEventsWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SUUtility mainWorkQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SUManagerServer_submitSUAnalyticsEventsWithName___block_invoke;
  v7[3] = &unk_26447C8C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__SUManagerServer_submitSUAnalyticsEventsWithName___block_invoke(uint64_t a1)
{
  id v2 = SULogAnalytics();
  SULogInfoForSubsystem(v2, @"Submitting all CoreAnalytics events matching name %@\n", v3, v4, v5, v6, v7, v8, *(void *)(a1 + 32));

  id v9 = [*(id *)(a1 + 40) coreAnalyticsManager];
  [v9 submitEventsWithName:*(void *)(a1 + 32)];
}

- (void)rvGetCurrentNeRDInfoWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUManagerServer_rvGetCurrentNeRDInfoWithReply___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __49__SUManagerServer_rvGetCurrentNeRDInfoWithReply___block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__SUManagerServer_rvGetCurrentNeRDInfoWithReply___block_invoke_2;
  v3[3] = &unk_26447D4F8;
  id v4 = *(id *)(a1 + 48);
  [v1 handleClientRequest:"-[SUManagerServer rvGetCurrentNeRDInfoWithReply:]_block_invoke" client:v2 withRequestCallBack:v3 withErrorCallBack:0];
}

void __49__SUManagerServer_rvGetCurrentNeRDInfoWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = RVGetNeRDInfo();
  uint64_t v3 = (void *)[v2 mutableCopy];
  id v4 = [MEMORY[0x263F645D8] predicateMatchingBundleIdentifier:@"com.apple.NRD.UpdateBrainService"];
  id v47 = 0;
  uint64_t v5 = [MEMORY[0x263F64570] handleForPredicate:v4 error:&v47];
  id v13 = v47;
  if (!v5)
  {
    SULogError(@"%s [RV] Couldn't detect a running NeRD brain. Error: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUManagerServer rvGetCurrentNeRDInfoWithReply:]_block_invoke_2");
    v43 = @"No running brain";
LABEL_7:
    [v3 setObject:v43 forKeyedSubscript:@"NeRDBrainBuild"];
    goto LABEL_10;
  }
  uint64_t v14 = [v5 bundle];
  uint64_t v15 = [v14 path];

  if (!v15)
  {
    SULogError(@"%s [RV] Couldn't identify the path to the running brain: %@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[SUManagerServer rvGetCurrentNeRDInfoWithReply:]_block_invoke_2");
    v43 = @"Unknown";
    goto LABEL_7;
  }
  id v23 = [v5 bundle];
  id v24 = [v23 path];
  id v25 = [v24 stringByAppendingPathComponent:@"version.plist"];

  uint64_t v26 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v25];
  uint64_t v34 = v26;
  if (v26)
  {
    v46 = [v26 objectForKeyedSubscript:@"ProductBuildVersion"];
    SULogInfo(@"%s [RV] Loaded version.plist of running brain. Running brain version is: %@", v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUManagerServer rvGetCurrentNeRDInfoWithReply:]_block_invoke_2");

    v42 = [v34 objectForKeyedSubscript:@"ProductBuildVersion"];
    [v3 setObject:v42 forKeyedSubscript:@"NeRDBrainBuild"];
  }
  else
  {
    SULogError(@"%s [RV] Failed to load version.plist of the running brain from: %@", v27, v28, v29, v30, v31, v32, v33, (uint64_t)"-[SUManagerServer rvGetCurrentNeRDInfoWithReply:]_block_invoke_2");
  }

LABEL_10:
  v44 = (void *)[v3 copy];

  v45 = (void *)[v3 copy];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rvTriggerNeRDUpdate:(id)a3
{
  id v4 = [(SUManagerServer *)self _clientForCurrentConnection];
  uint64_t v5 = +[SUUtility mainWorkQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SUManagerServer_rvTriggerNeRDUpdate___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __39__SUManagerServer_rvTriggerNeRDUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleClientRequest:"-[SUManagerServer rvTriggerNeRDUpdate:]_block_invoke" client:*(void *)(a1 + 40) withRequestCallBack:&__block_literal_global_515 withErrorCallBack:0];
}

uint64_t __39__SUManagerServer_rvTriggerNeRDUpdate___block_invoke_2()
{
  return MEMORY[0x270F4AF58](MEMORY[0x263EFFA78]);
}

- (void)_clientMessagabilityDidChange:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SUManagerServer__clientMessagabilityDidChange___block_invoke;
  v7[3] = &unk_26447C8C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

uint64_t __49__SUManagerServer__clientMessagabilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) object];
  if (v2)
  {
    id v4 = v2;
    if ([v2 isMessagable]) {
      [*(id *)(a1 + 40) _sendLatestStatusForClient:v4];
    }
  }
  return MEMORY[0x270F9A758]();
}

- (id)clients
{
  uint64_t v2 = (void *)[(NSMutableArray *)self->_clients copy];
  return v2;
}

- (void)goUnderExclusiveControl
{
  uint64_t v3 = [MEMORY[0x263F77D98] sharedDevice];
  int v4 = [v3 isBootedOSSecureInternal];

  if (v4)
  {
    SULogInfo(@"%s going under exclusive control", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUManagerServer goUnderExclusiveControl]");
    [(SUManagerServer *)self setUnderExclusiveControl:1];
    uint64_t v12 = +[SUState currentState];
    [v12 setUnderExclusiveControl:1];

    id v13 = +[SUState currentState];
    [v13 save];
  }
  else
  {
    SULogInfo(@"%s tried to go under exclusive control while in non internal build", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUManagerServer goUnderExclusiveControl]");
  }
}

- (void)exitExclusiveControl
{
  SULogInfo(@"%s exiting exclusive control", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)"-[SUManagerServer exitExclusiveControl]");
  [(SUManagerServer *)self setUnderExclusiveControl:0];
  uint64_t v9 = +[SUState currentState];
  [v9 setUnderExclusiveControl:0];

  id v10 = +[SUState currentState];
  [v10 save];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  [v4 invalidate];
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__SUManagerServer_removeClient___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

uint64_t __32__SUManagerServer_removeClient___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 40) identifier];
  [*(id *)(*(void *)(a1 + 32) + 40) count];
  SULogInfo(@"Removed client: %@, count: %lu", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);

  id v10 = *(void **)(a1 + 32);
  return [v10 _evaluateForegroundness];
}

- (void)scanRequestDidStartForOptions:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SUManagerServer_scanRequestDidStartForOptions___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __49__SUManagerServer_scanRequestDidStartForOptions___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __49__SUManagerServer_scanRequestDidStartForOptions___block_invoke_2;
  v2[3] = &unk_26447D548;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __49__SUManagerServer_scanRequestDidStartForOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 isMessagable])
  {
    uint64_t v3 = [v8 identifier];
    if (v3)
    {
      id v4 = (void *)v3;
      uint64_t v5 = [*(id *)(a1 + 32) clientName];

      if (!v5)
      {
        id v6 = [v8 identifier];
        [*(id *)(a1 + 32) setClientName:v6];
      }
    }
    uint64_t v7 = [v8 proxy];
    [v7 scanRequestDidStartForOptions:*(void *)(a1 + 32)];
  }
}

- (void)scanRequestDidFinishForOptions:(id)a3 results:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  clientQueue = self->_clientQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__SUManagerServer_scanRequestDidFinishForOptions_results_error___block_invoke;
  v15[3] = &unk_26447D598;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(clientQueue, v15);
}

void __64__SUManagerServer_scanRequestDidFinishForOptions_results_error___block_invoke(id *a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__SUManagerServer_scanRequestDidFinishForOptions_results_error___block_invoke_2;
  void v4[3] = &unk_26447D570;
  id v2 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[7];
  [v2 runOnClients:v4];
  uint64_t v3 = [a1[4] ddmManager];
  [v3 scanRequestDidFinishForOptions:a1[5] results:a1[6] error:a1[7]];
}

void __64__SUManagerServer_scanRequestDidFinishForOptions_results_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 isMessagable])
  {
    uint64_t v3 = [v8 identifier];
    if (v3)
    {
      id v4 = (void *)v3;
      id v5 = [*(id *)(a1 + 32) clientName];

      if (!v5)
      {
        id v6 = [v8 identifier];
        [*(id *)(a1 + 32) setClientName:v6];
      }
    }
    id v7 = [v8 proxy];
    [v7 scanRequestDidFinishForOptions:*(void *)(a1 + 32) results:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
}

- (void)scanDidCompleteForOptions:(id)a3 results:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  clientQueue = self->_clientQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__SUManagerServer_scanDidCompleteForOptions_results_error___block_invoke;
  v15[3] = &unk_26447D598;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(clientQueue, v15);
}

void __59__SUManagerServer_scanDidCompleteForOptions_results_error___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__SUManagerServer_scanDidCompleteForOptions_results_error___block_invoke_2;
  v3[3] = &unk_26447D570;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 runOnClients:v3];
}

void __59__SUManagerServer_scanDidCompleteForOptions_results_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 identifier];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [*(id *)(a1 + 32) clientName];

    if (!v5)
    {
      id v6 = [v8 identifier];
      [*(id *)(a1 + 32) setClientName:v6];
    }
  }
  id v7 = [v8 proxy];
  [v7 scanDidCompleteForOptions:*(void *)(a1 + 32) results:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)scanRequestDidFinishForOptions:(id)a3 update:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  clientQueue = self->_clientQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__SUManagerServer_scanRequestDidFinishForOptions_update_error___block_invoke;
  v15[3] = &unk_26447D598;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(clientQueue, v15);
}

void __63__SUManagerServer_scanRequestDidFinishForOptions_update_error___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__SUManagerServer_scanRequestDidFinishForOptions_update_error___block_invoke_2;
  v3[3] = &unk_26447D570;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 runOnClients:v3];
}

void __63__SUManagerServer_scanRequestDidFinishForOptions_update_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 isMessagable])
  {
    uint64_t v3 = [v8 identifier];
    if (v3)
    {
      id v4 = (void *)v3;
      id v5 = [*(id *)(a1 + 32) clientName];

      if (!v5)
      {
        id v6 = [v8 identifier];
        [*(id *)(a1 + 32) setClientName:v6];
      }
    }
    id v7 = [v8 proxy];
    [v7 scanRequestDidFinishForOptions:*(void *)(a1 + 32) update:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
}

- (void)scanDidCompleteWithNewUpdateAvailable:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SUManagerServer_scanDidCompleteWithNewUpdateAvailable_error___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(clientQueue, block);
}

void __63__SUManagerServer_scanDidCompleteWithNewUpdateAvailable_error___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__SUManagerServer_scanDidCompleteWithNewUpdateAvailable_error___block_invoke_2;
  v3[3] = &unk_26447D5C0;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __63__SUManagerServer_scanDidCompleteWithNewUpdateAvailable_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isMessagable])
  {
    uint64_t v3 = [v4 proxy];
    [v3 scanDidCompleteWithNewUpdateAvailable:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  }
}

- (void)automaticDownloadDidFailToStartForNewUpdateAvailable:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__SUManagerServer_automaticDownloadDidFailToStartForNewUpdateAvailable_withError___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(clientQueue, block);
}

void __82__SUManagerServer_automaticDownloadDidFailToStartForNewUpdateAvailable_withError___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __82__SUManagerServer_automaticDownloadDidFailToStartForNewUpdateAvailable_withError___block_invoke_2;
  v3[3] = &unk_26447D5C0;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __82__SUManagerServer_automaticDownloadDidFailToStartForNewUpdateAvailable_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 automaticDownloadDidFailToStartForNewUpdateAvailable:*(void *)(a1 + 32) withError:*(void *)(a1 + 40)];
}

- (void)downloadDidStart:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__SUManagerServer_downloadDidStart___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __36__SUManagerServer_downloadDidStart___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __36__SUManagerServer_downloadDidStart___block_invoke_2;
  v2[3] = &unk_26447D548;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __36__SUManagerServer_downloadDidStart___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 downloadDidStart:*(void *)(a1 + 32)];
}

- (void)downloadProgressDidChange:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SUManagerServer_downloadProgressDidChange___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __45__SUManagerServer_downloadProgressDidChange___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __45__SUManagerServer_downloadProgressDidChange___block_invoke_2;
  v2[3] = &unk_26447D548;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __45__SUManagerServer_downloadProgressDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isMessagable])
  {
    id v3 = [v4 proxy];
    [v3 downloadProgressDidChange:*(void *)(a1 + 32)];
  }
}

- (void)downloadDidFail:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUManagerServer_downloadDidFail_withError___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(clientQueue, block);
}

void __45__SUManagerServer_downloadDidFail_withError___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__SUManagerServer_downloadDidFail_withError___block_invoke_2;
  v3[3] = &unk_26447D5C0;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __45__SUManagerServer_downloadDidFail_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 downloadDidFail:*(void *)(a1 + 32) withError:*(void *)(a1 + 40)];
}

- (void)downloadDidFinish:(id)a3 withInstallPolicy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke_2;
  block[3] = &unk_26447CD70;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

void __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke_3;
  v3[3] = &unk_26447D5C0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 downloadDidFinish:*(void *)(a1 + 32) withInstallPolicy:*(void *)(a1 + 40)];
}

- (void)downloadWasInvalidatedForNewUpdatesAvailable:(id)a3
{
  id v4 = a3;
  id v5 = +[SUScheduler sharedInstance];
  [v5 cancelInstallAlertRegistration];

  clientQueue = self->_clientQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__SUManagerServer_downloadWasInvalidatedForNewUpdatesAvailable___block_invoke;
  v8[3] = &unk_26447C8C8;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(clientQueue, v8);
}

void __64__SUManagerServer_downloadWasInvalidatedForNewUpdatesAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) preferredDescriptor];
  id v3 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v2];

  id v4 = [*(id *)(a1 + 32) alternateDescriptor];
  id v5 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v4];

  id v6 = [[SUScanResults alloc] initWithPreferredDescriptor:v3 alternateDescriptor:v5];
  id v7 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __64__SUManagerServer_downloadWasInvalidatedForNewUpdatesAvailable___block_invoke_2;
  v9[3] = &unk_26447D548;
  id v10 = v6;
  id v8 = v6;
  [v7 runOnClients:v9];
}

void __64__SUManagerServer_downloadWasInvalidatedForNewUpdatesAvailable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 downloadWasInvalidatedForNewUpdatesAvailable:*(void *)(a1 + 32)];
}

- (void)clearingSpaceForDownload:(id)a3 clearing:(BOOL)a4
{
  id v6 = a3;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUManagerServer_clearingSpaceForDownload_clearing___block_invoke;
  block[3] = &unk_26447CED8;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(clientQueue, block);
}

void __53__SUManagerServer_clearingSpaceForDownload_clearing___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__SUManagerServer_clearingSpaceForDownload_clearing___block_invoke_2;
  v3[3] = &unk_26447D5E8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __53__SUManagerServer_clearingSpaceForDownload_clearing___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 clearingSpaceForDownload:*(void *)(a1 + 32) clearing:*(unsigned __int8 *)(a1 + 40)];
}

- (void)installWantsToStart:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SUManagerServer_installWantsToStart_completion___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(clientQueue, block);
}

void __50__SUManagerServer_installWantsToStart_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__SUManagerServer_installWantsToStart_completion___block_invoke_2;
  v3[3] = &unk_26447D610;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __50__SUManagerServer_installWantsToStart_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 installWantsToStart:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)installDidStart:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__SUManagerServer_installDidStart___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __35__SUManagerServer_installDidStart___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35__SUManagerServer_installDidStart___block_invoke_2;
  v2[3] = &unk_26447D548;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __35__SUManagerServer_installDidStart___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 installDidStart:*(void *)(a1 + 32)];
}

- (void)installDidFail:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SUManagerServer_installDidFail_withError___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __44__SUManagerServer_installDidFail_withError___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) noteInstallDidFail:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SUManagerServer_installDidFail_withError___block_invoke_2;
  block[3] = &unk_26447CD70;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

void __44__SUManagerServer_installDidFail_withError___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__SUManagerServer_installDidFail_withError___block_invoke_3;
  v3[3] = &unk_26447D5C0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __44__SUManagerServer_installDidFail_withError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v5 = [MEMORY[0x263F087E8] buildCheckedError:*(void *)(a1 + 32)];
  id v4 = [v3 proxy];

  [v4 installDidFail:*(void *)(a1 + 40) withError:v5];
}

- (void)installDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = +[SUUtility mainWorkQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__SUManagerServer_installDidFinish___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __36__SUManagerServer_installDidFinish___block_invoke(uint64_t a1)
{
  +[SUUtility writeKeepAliveFile];
  [*(id *)(*(void *)(a1 + 32) + 8) noteInstallDidFinish:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__SUManagerServer_installDidFinish___block_invoke_2;
  void v4[3] = &unk_26447C8C8;
  void v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);
}

void __36__SUManagerServer_installDidFinish___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __36__SUManagerServer_installDidFinish___block_invoke_3;
  v2[3] = &unk_26447D548;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __36__SUManagerServer_installDidFinish___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 installDidFinish:*(void *)(a1 + 32)];
}

- (void)installPolicyDidChange:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SUManagerServer_installPolicyDidChange___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __42__SUManagerServer_installPolicyDidChange___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __42__SUManagerServer_installPolicyDidChange___block_invoke_2;
  v2[3] = &unk_26447D548;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __42__SUManagerServer_installPolicyDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 installPolicyDidChange:*(void *)(a1 + 32)];
}

- (void)managedInstallationRequested:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SUManagerServer_managedInstallationRequested___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __48__SUManagerServer_managedInstallationRequested___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __48__SUManagerServer_managedInstallationRequested___block_invoke_2;
  v2[3] = &unk_26447D548;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __48__SUManagerServer_managedInstallationRequested___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 managedInstallationRequested:*(void *)(a1 + 32)];
}

- (void)sendDDMDeclarationToUI:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SUManagerServer_sendDDMDeclarationToUI___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __42__SUManagerServer_sendDDMDeclarationToUI___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __42__SUManagerServer_sendDDMDeclarationToUI___block_invoke_2;
  v2[3] = &unk_26447D548;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __42__SUManagerServer_sendDDMDeclarationToUI___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 handleUIForDDMDeclaration:*(void *)(a1 + 32)];
}

- (void)sendDDMGlobalSettingsToUI:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SUManagerServer_sendDDMGlobalSettingsToUI___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __45__SUManagerServer_sendDDMGlobalSettingsToUI___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __45__SUManagerServer_sendDDMGlobalSettingsToUI___block_invoke_2;
  v2[3] = &unk_26447D548;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __45__SUManagerServer_sendDDMGlobalSettingsToUI___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 handleUIForDDMGlobalSettings:*(void *)(a1 + 32)];
}

- (void)newOSDetected:(id)a3 deleteKeepAlive:(BOOL)a4
{
  BOOL v8 = a4;
  SULogInfo(@"%s: %@, deleteKeepAlive: %@", (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, (uint64_t)"-[SUManagerServer newOSDetected:deleteKeepAlive:]");
  id v9 = +[SUScheduler sharedInstance];
  id v10 = v9;
  if (v8) {
    [v9 cancelInstallAlertRegistration];
  }
  else {
    [v9 cancelInstallAlertRegistrationButKeepAlive];
  }
}

- (void)splatUpdateDetected
{
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SUManagerServer_splatUpdateDetected__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(clientQueue, block);
}

uint64_t __38__SUManagerServer_splatUpdateDetected__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runOnClients:&__block_literal_global_540];
}

void __38__SUManagerServer_splatUpdateDetected__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 wakeupIfNecessary];
  id v3 = [v2 proxy];

  [v3 deviceBootedAfterSplatUpdate];
}

- (void)splatRollbackDetected:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__SUManagerServer_splatRollbackDetected___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __41__SUManagerServer_splatRollbackDetected___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__SUManagerServer_splatRollbackDetected___block_invoke_2;
  v2[3] = &unk_26447D548;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __41__SUManagerServer_splatRollbackDetected___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 deviceBootedAfterRollback:*(void *)(a1 + 32)];
}

- (void)installTonightScheduled:(BOOL)a3
{
  clientQueue = self->_clientQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SUManagerServer_installTonightScheduled___block_invoke;
  void v4[3] = &unk_26447CD98;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(clientQueue, v4);
}

uint64_t __43__SUManagerServer_installTonightScheduled___block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__SUManagerServer_installTonightScheduled___block_invoke_2;
  v3[3] = &unk_26447D5E8;
  void v3[4] = v1;
  char v4 = *(unsigned char *)(a1 + 40);
  return [v1 runOnClients:v3];
}

void __43__SUManagerServer_installTonightScheduled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 8) operationModel];
  id v6 = [v4 id];

  BOOL v5 = [v3 proxy];

  [v5 installTonightScheduled:*(unsigned __int8 *)(a1 + 40) operationID:v6];
}

- (void)rollbackReadyToStart:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  clientQueue = self->_clientQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__SUManagerServer_rollbackReadyToStart_options_completion___block_invoke;
  v15[3] = &unk_26447D3B0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(clientQueue, v15);
}

void __59__SUManagerServer_rollbackReadyToStart_options_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__SUManagerServer_rollbackReadyToStart_options_completion___block_invoke_2;
  v3[3] = &unk_26447D638;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 runOnClients:v3];
}

void __59__SUManagerServer_rollbackReadyToStart_options_completion___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v5 = +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:a1[4]];
  id v4 = [v3 proxy];

  [v4 rollbackReadyToStart:v5 options:a1[5] completion:a1[6]];
}

- (void)rollbackDidStart:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__SUManagerServer_rollbackDidStart___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __36__SUManagerServer_rollbackDidStart___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __36__SUManagerServer_rollbackDidStart___block_invoke_2;
  v2[3] = &unk_26447D548;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __36__SUManagerServer_rollbackDidStart___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v5 = +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:*(void *)(a1 + 32)];
  id v4 = [v3 proxy];

  [v4 rollbackDidStart:v5];
}

- (void)rollbackDidFail:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUManagerServer_rollbackDidFail_withError___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(clientQueue, block);
}

void __45__SUManagerServer_rollbackDidFail_withError___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__SUManagerServer_rollbackDidFail_withError___block_invoke_2;
  v3[3] = &unk_26447D5C0;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __45__SUManagerServer_rollbackDidFail_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v5 = +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:*(void *)(a1 + 32)];
  id v4 = [v3 proxy];

  [v4 rollbackDidFail:v5 withError:*(void *)(a1 + 40)];
}

- (void)rollbackSucceeded:(id)a3
{
  id v4 = a3;
  id v5 = +[SUUtility mainWorkQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SUManagerServer_rollbackSucceeded___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __37__SUManagerServer_rollbackSucceeded___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 56);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__SUManagerServer_rollbackSucceeded___block_invoke_2;
  v3[3] = &unk_26447C8C8;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __37__SUManagerServer_rollbackSucceeded___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __37__SUManagerServer_rollbackSucceeded___block_invoke_3;
  v2[3] = &unk_26447D548;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __37__SUManagerServer_rollbackSucceeded___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v5 = +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:*(void *)(a1 + 32)];
  id v4 = [v3 proxy];

  [v4 rollbackDidFinish:v5];
}

- (void)rollbackReadyForReboot:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SUManagerServer_rollbackReadyForReboot___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __42__SUManagerServer_rollbackReadyForReboot___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __42__SUManagerServer_rollbackReadyForReboot___block_invoke_2;
  v2[3] = &unk_26447D548;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __42__SUManagerServer_rollbackReadyForReboot___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v5 = +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:*(void *)(a1 + 32)];
  id v4 = [v3 proxy];

  [v4 rollbackReadyForReboot:v5];
}

- (void)presentingRecommendedUpdate:(id)a3 shouldPresent:(BOOL)a4
{
  id v6 = a3;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SUManagerServer_presentingRecommendedUpdate_shouldPresent___block_invoke;
  block[3] = &unk_26447CED8;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(clientQueue, block);
}

void __61__SUManagerServer_presentingRecommendedUpdate_shouldPresent___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61__SUManagerServer_presentingRecommendedUpdate_shouldPresent___block_invoke_2;
  v3[3] = &unk_26447D5E8;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __61__SUManagerServer_presentingRecommendedUpdate_shouldPresent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 presentingRecommendedUpdate:*(void *)(a1 + 32) shouldPresent:*(unsigned __int8 *)(a1 + 40)];
}

- (void)rollbackSuggested:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUManagerServer_rollbackSuggested_info___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(clientQueue, block);
}

void __42__SUManagerServer_rollbackSuggested_info___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__SUManagerServer_rollbackSuggested_info___block_invoke_2;
  v3[3] = &unk_26447D5C0;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __42__SUManagerServer_rollbackSuggested_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  [v4 rollbackSuggested:*(void *)(a1 + 32) info:*(void *)(a1 + 40)];
}

- (void)networkMonitorDetectOverrides
{
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUManagerServer_networkMonitorDetectOverrides__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(clientQueue, block);
}

void __48__SUManagerServer_networkMonitorDetectOverrides__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) manager];
  [v1 networkMonitorDetectOverrides];
}

- (void)isAnyClientInUserInteraction:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke;
  v7[3] = &unk_26447C940;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke_2;
  void v4[3] = &unk_26447D688;
  void v4[4] = &v5;
  [v2 runOnClients:v4];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *((unsigned __int8 *)v6 + 24), 0);
  }
  _Block_object_dispose(&v5, 8);
}

void __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke_3;
  v5[3] = &unk_26447D660;
  void v5[4] = *(void *)(a1 + 32);
  [v4 inUserInteraction:v5];
}

uint64_t __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)autoInstallManager:(id)a3 operationWasConsented:(id)a4
{
  id v5 = a4;
  clientQueue = self->_clientQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__SUManagerServer_autoInstallManager_operationWasConsented___block_invoke;
  v8[3] = &unk_26447C8C8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(clientQueue, v8);
}

void __60__SUManagerServer_autoInstallManager_operationWasConsented___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __60__SUManagerServer_autoInstallManager_operationWasConsented___block_invoke_2;
  v2[3] = &unk_26447D548;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __60__SUManagerServer_autoInstallManager_operationWasConsented___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v5 = [v3 proxy];

  id v4 = [*(id *)(a1 + 32) id];
  [v5 autoInstallOperationDidConsent:v4];
}

- (void)autoInstallManager:(id)a3 didCancelOperation:(id)a4
{
  id v5 = a4;
  id v6 = SULogBadging();
  SULogInfoForSubsystem(v6, @"Auto install operation cancelled..Dismissing AutoUpdateBanner", v7, v8, v9, v10, v11, v12, v15[0]);

  clientQueue = self->_clientQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = (uint64_t)__57__SUManagerServer_autoInstallManager_didCancelOperation___block_invoke;
  v15[3] = (uint64_t)&unk_26447C8C8;
  v15[4] = (uint64_t)self;
  id v16 = v5;
  id v14 = v5;
  dispatch_async(clientQueue, v15);
}

void __57__SUManagerServer_autoInstallManager_didCancelOperation___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__SUManagerServer_autoInstallManager_didCancelOperation___block_invoke_2;
  v2[3] = &unk_26447D548;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 runOnClients:v2];
}

void __57__SUManagerServer_autoInstallManager_didCancelOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v5 = [v3 proxy];

  id v4 = [*(id *)(a1 + 32) id];
  [v5 autoInstallOperationWasCancelled:v4];
}

- (void)autoInstallManager:(id)a3 didExpireOperation:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SUManagerServer_autoInstallManager_didExpireOperation_withError___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(clientQueue, block);
}

void __67__SUManagerServer_autoInstallManager_didExpireOperation_withError___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__SUManagerServer_autoInstallManager_didExpireOperation_withError___block_invoke_2;
  v3[3] = &unk_26447D5C0;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __67__SUManagerServer_autoInstallManager_didExpireOperation_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v5 = [v3 proxy];

  id v4 = [*(id *)(a1 + 32) id];
  [v5 autoInstallOperationDidExpire:v4 withError:*(void *)(a1 + 40)];
}

- (void)autoInstallManager:(id)a3 isReadyToInstall:(id)a4 withResult:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(clientQueue, block);
}

void __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_2;
  v3[3] = &unk_26447D610;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 runOnClients:v3];
}

void __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v4 = [v3 proxy];

  id v5 = [*(id *)(a1 + 32) id];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_3;
  v6[3] = &unk_26447D6B0;
  id v7 = *(id *)(a1 + 40);
  [v4 autoInstallOperationIsReadyToInstall:v5 withResult:v6];
}

void __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_4;
  block[3] = &unk_26447CE88;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)autoInstallManager:(id)a3 passcodePolicyChanged:(unint64_t)a4 forOperation:(id)a5
{
  id v7 = a5;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__SUManagerServer_autoInstallManager_passcodePolicyChanged_forOperation___block_invoke;
  block[3] = &unk_26447C918;
  void block[4] = self;
  id v11 = v7;
  unint64_t v12 = a4;
  id v9 = v7;
  dispatch_async(clientQueue, block);
}

void __73__SUManagerServer_autoInstallManager_passcodePolicyChanged_forOperation___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73__SUManagerServer_autoInstallManager_passcodePolicyChanged_forOperation___block_invoke_2;
  v5[3] = &unk_26447D6D8;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 runOnClients:v5];
}

void __73__SUManagerServer_autoInstallManager_passcodePolicyChanged_forOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 wakeupIfNecessary];
  id v5 = [v3 proxy];

  uint64_t v4 = [*(id *)(a1 + 32) id];
  [v5 autoInstallOperationPasscodePolicyChanged:v4 passcodePolicyType:*(void *)(a1 + 40)];
}

- (void)resetState
{
  id v2 = +[SUUtility mainWorkQueue];
  dispatch_async(v2, &__block_literal_global_545);
}

void __29__SUManagerServer_resetState__block_invoke()
{
  id v0 = +[SUState currentState];
  [v0 resetAllHistory];

  id v1 = +[SUState currentState];
  [v1 save];
}

- (void)setUnderExclusiveControl:(BOOL)a3
{
  self->_underExclusiveControl = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_ddmManager, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_autoInstallManager, 0);
}

- (id)connectionQueue
{
  return (id)__connectionQueue;
}

- (void)serverInitAndResumeWork
{
  id v3 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SUManagerServer_Daemon__serverInitAndResumeWork__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __50__SUManagerServer_Daemon__serverInitAndResumeWork__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogDebug(@"Notifying observers of start", a2, a3, a4, a5, a6, a7, a8, v14);
  [*(id *)(a1 + 32) _notifyServerStart];
  +[SUPluginLoader loadPlugin:@"/System/Library/PrivateFrameworks/SoftwareUpdateServicesUI.framework/Plugins/SoftwareUpdateServicesUIPlugin.servicebundle"];
  id v9 = [*(id *)(a1 + 32) manager];
  [v9 resumeOrResetIfNecessary];

  id v10 = [*(id *)(a1 + 32) autoInstallManager];
  [v10 resumeOrResetStateIfNecessary];

  id v11 = [*(id *)(a1 + 32) ddmManager];
  [v11 resumeOrResetStateIfNecessary];

  unint64_t v12 = +[SUScheduler sharedInstance];
  [v12 scheduleStartupTasksIfNecessary];

  id v13 = +[SUTransactionManager sharedInstance];
  [v13 setKeepAliveClearable:1];

  id v15 = +[SUTransactionManager sharedInstance];
  [v15 clearKeepAliveIfNecessary:0];
}

- (void)runUntilIdleExit
{
  id v3 = (void *)MEMORY[0x223C18220](self, a2);
  uint64_t v4 = +[SUTransactionManager sharedInstance];
  [v4 setKeepAliveClearable:0];
  id v5 = SULogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    int v14 = [v4 isKeepAliveEnabled];
    uint64_t v22 = @"DISABLED";
    if (v14) {
      uint64_t v22 = @"ENABLED";
    }
    SULogInfo(@"Starting the server: keepAlive = %@", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v22);
  }
  else
  {
    SULogInfo(@"Starting the server.", v7, v8, v9, v10, v11, v12, v13, v31);
  }
  [MEMORY[0x263F08D88] enableTransactions];
  id v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v24 = dispatch_queue_create("com.apple.softwareupdateservices.connectionQueue", v23);
  id v25 = (void *)__connectionQueue;
  __connectionQueue = (uint64_t)v24;

  uint64_t v26 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.softwareupdateservicesd"];
  uint64_t v27 = (void *)__listener;
  __listener = v26;

  [(id)__listener setDelegate:self];
  [(id)__listener _setQueue:__connectionQueue];
  [(id)__listener resume];
  [v4 beginTransaction:@"SUMinimumLaunchTransaction"];
  dispatch_time_t v28 = dispatch_time(0, 10000000000);
  uint64_t v29 = +[SUUtility mainWorkQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_Daemon__runUntilIdleExit__block_invoke;
  block[3] = &unk_26447C878;
  id v33 = v4;
  id v30 = v4;
  dispatch_after(v28, v29, block);

  [(SUManagerServer *)self serverInitAndResumeWork];
  [(SUManagerServer *)self _run];
  [v30 clearKeepAliveIfNecessary:1];
}

uint64_t __43__SUManagerServer_Daemon__runUntilIdleExit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endTransaction:@"SUMinimumLaunchTransaction"];
}

uint64_t __62__SUManagerServer_Daemon__listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeClient:*(void *)(a1 + 40)];
}

- (void)_notifyServerStart
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SUDaemonStartedNotification", 0, 0, 1u);
}

@end