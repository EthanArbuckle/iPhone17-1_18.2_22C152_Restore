@interface SUManagerClient
+ (BOOL)_isMultiUserAppleId;
+ (BOOL)_shouldDisallowAvailabilityNotifications;
- (BOOL)cancelUpdate:(id)a3;
- (BOOL)cancelUpdateForKey:(id)a3 withError:(id *)a4;
- (BOOL)createInstallationKeybag:(id)a3;
- (BOOL)createInstallationKeybag:(id)a3 forUnattendedInstall:(BOOL)a4;
- (BOOL)createInstallationKeybagWithOptions:(id)a3;
- (BOOL)isAnyClientInUserInteraction;
- (BOOL)isAutoUpdateScheduled;
- (BOOL)isAutomaticDownloadEnabled;
- (BOOL)isAutomaticUpdateV2Enabled;
- (BOOL)isInstallationKeybagRequired;
- (BOOL)isInstallationKeybagRequiredForDescriptor:(id)a3;
- (BOOL)isSplatOnlyUpdateInstalled;
- (BOOL)isSplatOnlyUpdateRollbackAllowed:(id *)a3;
- (BOOL)isSplatOnlyUpdateRollbackSuggested;
- (BOOL)scheduleUpdate:(id)a3;
- (BOOL)scheduleUpdate:(id)a3 withError:(id *)a4;
- (BOOL)securityResponseRollbackSuggested:(id)a3 error:(id *)a4;
- (BOOL)setGlobalSettings:(id)a3 withError:(id *)a4;
- (BOOL)setLastRollbackDescriptor:(id)a3;
- (BOOL)shouldDisableAutoDownloadIOSUpdatesToggle;
- (BOOL)shouldDisableAutoInstallIOSUpdatesToggle;
- (BOOL)shouldDisableAutoInstallRSRToggle;
- (BOOL)writeKeepAliveFile;
- (OS_dispatch_queue)queue;
- (SUDescriptor)installDescriptor;
- (SUDescriptor)scanDescriptor;
- (SUManagerClient)init;
- (SUManagerClient)initWithDelegate:(id)a3;
- (SUManagerClient)initWithDelegate:(id)a3 andQueue:(id)a4;
- (SUManagerClient)initWithDelegate:(id)a3 clientType:(int)a4;
- (SUManagerClient)initWithDelegate:(id)a3 queue:(id)a4 clientType:(int)a5;
- (SUManagerClientDelegate)delegate;
- (id)_bundleIdentifier;
- (id)_getExistingAutoInstallOperationFromModel:(id)a3;
- (id)_remoteInterface;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (id)_remoteInterfaceWithErrorHandler:(id)a3 connectIfNecessary:(BOOL)a4;
- (id)_remoteSynchronousInterfaceWithErrorHandler:(id)a3 connectIfNecessary:(BOOL)a4;
- (id)declarationsWithError:(id *)a3;
- (id)getDDMUpdateDescriptor;
- (id)getDocumentationDataForInstalledUpdateType:(int)a3 error:(id *)a4;
- (id)getMandatorySoftwareUpdateDictionaryWithError:(id *)a3;
- (id)globalSettingsDeclarationWithError:(id *)a3;
- (id)observeInstallationConstraintChangesForDownload:(id)a3 observer:(id)a4;
- (id)rvGetCurrentNeRDInfo;
- (int)clientType;
- (unint64_t)totalPurgeableSpace;
- (void)_cancelAutoInstallOperation:(id)a3 withResult:(id)a4;
- (void)_consentAutoInstallOperation:(id)a3 withResult:(id)a4;
- (void)_invalidateAllInstallationConstraintObserversForDownload;
- (void)_invalidateConnection;
- (void)_invalidateConstraintObserver:(id)a3 withError:(id)a4;
- (void)_registerAutoInstallOperationClientHandler:(id)a3;
- (void)_setClientType;
- (void)_unregisterAutoInstallOperationClientHandler:(id)a3;
- (void)areUpdatesDownloadableWithOptions:(id)a3 alternateUpdateOptions:(id)a4 preferredUpdateDownloadable:(BOOL *)a5 alternateUpdateDownloadable:(BOOL *)a6 preferredUpdateError:(id *)a7 alternateUpdateError:(id *)a8;
- (void)autoInstallOperationDidConsent:(id)a3;
- (void)autoInstallOperationDidExpire:(id)a3 withError:(id)a4;
- (void)autoInstallOperationIsReadyToInstall:(id)a3 withResult:(id)a4;
- (void)autoInstallOperationPasscodePolicyChanged:(id)a3 passcodePolicyType:(unint64_t)a4;
- (void)autoInstallOperationWasCancelled:(id)a3;
- (void)autoScanAndDownloadIfAvailable:(id)a3;
- (void)autoScanAndDownloadNow:(BOOL)a3 IfAvailable:(id)a4;
- (void)automaticDownloadDidFailToStartForNewUpdateAvailable:(id)a3 withError:(id)a4;
- (void)cancelDownload:(id)a3;
- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)clearingSpaceForDownload:(id)a3 clearing:(BOOL)a4;
- (void)connectToServerIfNecessary;
- (void)currentAutoInstallOperation:(BOOL)a3 withResult:(id)a4;
- (void)currentAutoInstallOperationForecast:(id)a3;
- (void)currentPasscodePolicy:(id)a3;
- (void)dealloc;
- (void)delayEndDate:(id)a3;
- (void)descriptor:(id)a3;
- (void)descriptors:(id)a3;
- (void)destroyInstallationKeybag;
- (void)deviceBootedAfterRollback:(id)a3;
- (void)deviceBootedAfterSplatUpdate;
- (void)deviceHasSufficientSpaceForDownload:(id)a3;
- (void)deviceHasSufficientSpaceForDownloads:(id)a3;
- (void)download:(id)a3;
- (void)downloadAndInstallState:(id)a3;
- (void)downloadDidFail:(id)a3 withError:(id)a4;
- (void)downloadDidFinish:(id)a3;
- (void)downloadDidFinish:(id)a3 withInstallPolicy:(id)a4;
- (void)downloadDidStart:(id)a3;
- (void)downloadProgressDidChange:(id)a3;
- (void)downloadWasInvalidatedForNewUpdateAvailable:(id)a3;
- (void)downloadWasInvalidatedForNewUpdatesAvailable:(id)a3;
- (void)eligibleRollbackWithOptions:(id)a3 withResult:(id)a4;
- (void)enableAutomaticDownload:(BOOL)a3;
- (void)enableAutomaticUpdateV2:(BOOL)a3;
- (void)extraSpaceNeededForDownloadWithoutAppPurging:(id)a3;
- (void)getDDMDeclarationWithHandler:(id)a3;
- (void)getDDMStatusWithKeys:(id)a3 completion:(id)a4;
- (void)getMandatorySoftwareUpdateDictionary:(id)a3;
- (void)handleDDMDeclaration:(id)a3 withResult:(id)a4;
- (void)handleUIForDDMDeclaration:(id)a3;
- (void)handleUIForDDMGlobalSettings:(id)a3;
- (void)inUserInteraction:(id)a3;
- (void)installDidFail:(id)a3 withError:(id)a4;
- (void)installDidFinish:(id)a3;
- (void)installDidStart:(id)a3;
- (void)installPolicyDidChange:(id)a3;
- (void)installServerConfiguration;
- (void)installTonightScheduled:(BOOL)a3 operationID:(id)a4;
- (void)installUpdate:(id)a3;
- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4;
- (void)installUpdateWithOptions:(id)a3 withResult:(id)a4;
- (void)installWantsToStart:(id)a3 completion:(id)a4;
- (void)installationConstraintObserverDidRemoveAllObserverBlocks:(id)a3;
- (void)invalidate;
- (void)isAutoUpdateEnabled:(id)a3;
- (void)isAutoUpdateScheduled:(id)a3;
- (void)isClearingSpaceForDownload:(id)a3;
- (void)isDelayingUpdates:(id)a3;
- (void)isDownloading:(id)a3;
- (void)isRollingBack:(id)a3;
- (void)isScanning:(id)a3;
- (void)isSoftwareUpdateInProgress:(id)a3;
- (void)isUpdateReadyForInstallation:(id)a3;
- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4;
- (void)managedInstallationRequested:(id)a3;
- (void)networkMonitorDetectOverrides;
- (void)noteConnectionDropped;
- (void)noteServerExiting;
- (void)pauseDownload:(id)a3;
- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5;
- (void)presentAutoUpdateBanner:(id)a3;
- (void)presentingRecommendedUpdate:(id)a3 shouldPresent:(BOOL)a4;
- (void)previousRollbackWithOptions:(id)a3 withResult:(id)a4;
- (void)purgeDownload:(id)a3;
- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)recordSUAnalyticsEvent:(id)a3;
- (void)registerCSInstallPredicatesOnDate:(id)a3;
- (void)resetState;
- (void)resumeDownload:(id)a3;
- (void)rollbackDidFail:(id)a3 withError:(id)a4;
- (void)rollbackDidFinish:(id)a3;
- (void)rollbackDidStart:(id)a3;
- (void)rollbackReadyForReboot:(id)a3;
- (void)rollbackReadyToStart:(id)a3 options:(id)a4 completion:(id)a5;
- (void)rollbackSuggested:(id)a3 info:(id)a4;
- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4;
- (void)rvTriggerNeRDUpdate:(id)a3;
- (void)scanDidCompleteForOptions:(id)a3 results:(id)a4 error:(id)a5;
- (void)scanDidCompleteWithNewUpdateAvailable:(id)a3 error:(id)a4;
- (void)scanForUpdates:(id)a3 withResult:(id)a4;
- (void)scanForUpdates:(id)a3 withScanResults:(id)a4;
- (void)scanRequestDidFinishForOptions:(id)a3 results:(id)a4 error:(id)a5;
- (void)scanRequestDidFinishForOptions:(id)a3 update:(id)a4 error:(id)a5;
- (void)scanRequestDidStartForOptions:(id)a3;
- (void)scheduleRollbackRebootForLater:(id)a3;
- (void)setClientType:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setExclusiveControl:(BOOL)a3;
- (void)setInstallDescriptor:(id)a3;
- (void)setMandatorySoftwareUpdateDictionary:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScanDescriptor:(id)a3;
- (void)slaVersion:(id)a3;
- (void)softwareUpdatePathRestriction:(id)a3;
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
- (void)userWantsToDeferInstall;
@end

@implementation SUManagerClient

- (void)setClientType:(int)a3
{
  if (self->_clientType != a3)
  {
    self->_clientType = a3;
    obj = self;
    objc_sync_enter(obj);
    if (obj->_connected) {
      [(SUManagerClient *)obj _setClientType];
    }
    else {
      [(SUManagerClient *)obj connectToServerIfNecessary];
    }
    objc_sync_exit(obj);
  }
}

- (void)connectToServerIfNecessary
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connected)
  {
    SULogDebug(@"Client <%p>: establishing connection to softwareupdateservicesd.", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);
    [(SUManagerClient *)v2 _invalidateConnection];
    uint64_t v10 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.softwareupdateservicesd" options:4096];
    serverConnection = v2->_serverConnection;
    v2->_serverConnection = (NSXPCConnection *)v10;

    [(NSXPCConnection *)v2->_serverConnection _setQueue:v2->_queue];
    v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CEC4760];
    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    [v12 setClasses:v15 forSelector:sel_getAllDeclarationsWithHandler_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)v2->_serverConnection setRemoteObjectInterface:v12];
    v16 = v2->_serverConnection;
    v17 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CECB9A8];
    [(NSXPCConnection *)v16 setExportedInterface:v17];

    [(NSXPCConnection *)v2->_serverConnection setExportedObject:v2];
    objc_initWeak(&location, v2);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __45__SUManagerClient_connectToServerIfNecessary__block_invoke;
    v31[3] = &unk_26447E700;
    objc_copyWeak(&v32, &location);
    v18 = (void *)MEMORY[0x223C18480](v31);
    [(NSXPCConnection *)v2->_serverConnection setInvalidationHandler:v18];
    v19 = v2->_serverConnection;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __45__SUManagerClient_connectToServerIfNecessary__block_invoke_2;
    v28[3] = &unk_26447E728;
    objc_copyWeak(&v30, &location);
    id v20 = v18;
    id v29 = v20;
    [(NSXPCConnection *)v19 setInterruptionHandler:v28];
    [(NSXPCConnection *)v2->_serverConnection activate];
    [(SUManagerClient *)v2 _setClientType];
    *(_WORD *)&v2->_connected = 1;
    SULogDebug(@"Client <%p>: connection established to softwareupdateservicesd.", v21, v22, v23, v24, v25, v26, v27, (uint64_t)v2);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);
}

- (SUManagerClient)initWithDelegate:(id)a3 queue:(id)a4 clientType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SUManagerClient;
  uint64_t v10 = [(SUManagerClient *)&v20 init];
  v11 = v10;
  if (v10)
  {
    [(SUManagerClient *)v10 setDelegate:v8];
    if (v9) {
      id v12 = v9;
    }
    else {
      id v12 = (id)MEMORY[0x263EF83A0];
    }
    [(SUManagerClient *)v11 setQueue:v12];
    [(SUManagerClient *)v11 setClientType:v5];
    [(SUManagerClient *)v11 connectToServerIfNecessary];
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    installOperationIDsToOperationHandler = v11->_installOperationIDsToOperationHandler;
    v11->_installOperationIDsToOperationHandler = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    installationConstraintObservers = v11->_installationConstraintObservers;
    v11->_installationConstraintObservers = v15;

    v17 = +[SUPreferences sharedInstance];
    [v17 addObserver:v11];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v11, (CFNotificationCallback)__softwareUpdateDaemonStarted, @"SUDaemonStartedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
  }

  return v11;
}

- (void)setQueue:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)_setClientType
{
  uint64_t v14 = SUStringFromClientType(self->_clientType);
  SULogDebug(@"Client <%p>: setType: %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)self);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __33__SUManagerClient__setClientType__block_invoke;
  v18[3] = &unk_26447D9F8;
  v18[4] = self;
  uint64_t v10 = (void *)MEMORY[0x223C18480](v18);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __33__SUManagerClient__setClientType__block_invoke_2;
  v17[3] = &unk_26447D9F8;
  v17[4] = self;
  v11 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v17 connectIfNecessary:0];
  uint64_t clientType = self->_clientType;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __33__SUManagerClient__setClientType__block_invoke_3;
  v15[3] = &unk_26447D6B0;
  id v16 = v10;
  id v13 = v10;
  [v11 setClientType:clientType withResult:v15];
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3 connectIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (v4) {
    [(SUManagerClient *)v7 connectToServerIfNecessary];
  }
  uint64_t v8 = [(NSXPCConnection *)v7->_serverConnection remoteObjectProxyWithErrorHandler:v6];
  objc_sync_exit(v7);

  return v8;
}

- (void)_invalidateConnection
{
  obj = self;
  objc_sync_enter(obj);
  serverConnection = obj->_serverConnection;
  if (serverConnection)
  {
    [(NSXPCConnection *)serverConnection invalidate];
    [(NSXPCConnection *)obj->_serverConnection setInvalidationHandler:0];
    [(NSXPCConnection *)obj->_serverConnection setInterruptionHandler:0];
    uint64_t v3 = obj->_serverConnection;
    obj->_serverConnection = 0;

    obj->_connected = 0;
  }
  objc_sync_exit(obj);
}

uint64_t __33__SUManagerClient__setClientType__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __33__SUManagerClient__setClientType__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  v11 = v12;
  if (v12)
  {
    SULogDebug(@"Client <%p>: unable to set client type on connection: %@", v4, v5, v6, v7, v8, v9, v10, *(void *)(a1 + 32));
    v11 = v12;
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SUManagerClient)init
{
  return [(SUManagerClient *)self initWithDelegate:0];
}

- (SUManagerClient)initWithDelegate:(id)a3
{
  return [(SUManagerClient *)self initWithDelegate:a3 clientType:0];
}

- (SUManagerClient)initWithDelegate:(id)a3 andQueue:(id)a4
{
  return [(SUManagerClient *)self initWithDelegate:a3 queue:a4 clientType:0];
}

- (SUManagerClient)initWithDelegate:(id)a3 clientType:(int)a4
{
  return [(SUManagerClient *)self initWithDelegate:a3 queue:0 clientType:*(void *)&a4];
}

- (void)invalidate
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SUDaemonStartedNotification", 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  uint64_t v4 = +[SUPreferences sharedInstance];
  [v4 removeObserver:self];

  [(SUManagerClient *)self _invalidateConnection];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SUDaemonStartedNotification", 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  uint64_t v4 = +[SUPreferences sharedInstance];
  [v4 removeObserver:self];

  [(SUManagerClient *)self _invalidateConnection];
  v5.receiver = self;
  v5.super_class = (Class)SUManagerClient;
  [(SUManagerClient *)&v5 dealloc];
}

void __33__SUManagerClient__setClientType__block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  v11 = v14;
  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient _setClientType]_block_invoke_2");
    id v12 = [v14 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v14 code] == 4097)
      {
      }
      else
      {
        uint64_t v13 = [v14 code];

        v11 = v14;
        if (v13 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    v11 = v14;
  }
LABEL_9:
}

- (void)isScanning:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __30__SUManagerClient_isScanning___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __30__SUManagerClient_isScanning___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 isScanning:v16];
}

uint64_t __30__SUManagerClient_isScanning___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isScanning:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __30__SUManagerClient_isScanning___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)scanForUpdates:(id)a3 withScanResults:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __50__SUManagerClient_scanForUpdates_withScanResults___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __50__SUManagerClient_scanForUpdates_withScanResults___block_invoke_2;
  v19[3] = &unk_26447E340;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 scanForUpdates:v7 withResult:v19];
}

uint64_t __50__SUManagerClient_scanForUpdates_withScanResults___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient scanForUpdates:withScanResults:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __50__SUManagerClient_scanForUpdates_withScanResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)scanForUpdates:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __45__SUManagerClient_scanForUpdates_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __45__SUManagerClient_scanForUpdates_withResult___block_invoke_2;
  v19[3] = &unk_26447E340;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 scanForUpdates:v7 withResult:v19];
}

uint64_t __45__SUManagerClient_scanForUpdates_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient scanForUpdates:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __45__SUManagerClient_scanForUpdates_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = [v9 latestUpdate];
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)autoScanAndDownloadIfAvailable:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __50__SUManagerClient_autoScanAndDownloadIfAvailable___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__SUManagerClient_autoScanAndDownloadIfAvailable___block_invoke_2;
  v16[3] = &unk_26447E340;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 autoScanAndDownloadIfAvailable:v16];
}

uint64_t __50__SUManagerClient_autoScanAndDownloadIfAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient autoScanAndDownloadIfAvailable:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __50__SUManagerClient_autoScanAndDownloadIfAvailable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)autoScanAndDownloadNow:(BOOL)a3 IfAvailable:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __54__SUManagerClient_autoScanAndDownloadNow_IfAvailable___block_invoke;
  v20[3] = &unk_26447E318;
  v20[4] = self;
  id v15 = v6;
  id v21 = v15;
  id v16 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __54__SUManagerClient_autoScanAndDownloadNow_IfAvailable___block_invoke_2;
  v18[3] = &unk_26447E340;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  [v16 autoScanAndDownloadNow:v4 ifAvailable:v18];
}

uint64_t __54__SUManagerClient_autoScanAndDownloadNow_IfAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient autoScanAndDownloadNow:IfAvailable:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __54__SUManagerClient_autoScanAndDownloadNow_IfAvailable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)descriptors:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __31__SUManagerClient_descriptors___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __31__SUManagerClient_descriptors___block_invoke_2;
  v16[3] = &unk_26447E340;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 descriptors:v16];
}

uint64_t __31__SUManagerClient_descriptors___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient descriptors:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __31__SUManagerClient_descriptors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id v8 = v9;
    if (v5) {
      id v8 = 0;
    }
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)descriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __30__SUManagerClient_descriptor___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __30__SUManagerClient_descriptor___block_invoke_2;
  v16[3] = &unk_26447E368;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 descriptor:v16];
}

uint64_t __30__SUManagerClient_descriptor___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient descriptor:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __30__SUManagerClient_descriptor___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id v8 = v9;
    if (v5) {
      id v8 = 0;
    }
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (unint64_t)totalPurgeableSpace
{
  uint64_t v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  scanDescriptor = self->_scanDescriptor;

  return +[SUUtility totalPurgeableSpace:scanDescriptor];
}

- (void)isClearingSpaceForDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__SUManagerClient_isClearingSpaceForDownload___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__SUManagerClient_isClearingSpaceForDownload___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 isClearingSpaceForDownload:v16];
}

uint64_t __46__SUManagerClient_isClearingSpaceForDownload___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isClearingSpaceForDownload:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __46__SUManagerClient_isClearingSpaceForDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (id)getDocumentationDataForInstalledUpdateType:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);

  return +[SUUtility documentationDataForInstalledUpdateType:v5 error:a4];
}

- (void)isDownloading:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __33__SUManagerClient_isDownloading___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __33__SUManagerClient_isDownloading___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 isDownloading:v16];
}

uint64_t __33__SUManagerClient_isDownloading___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isDownloading:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __33__SUManagerClient_isDownloading___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)startDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __33__SUManagerClient_startDownload___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __33__SUManagerClient_startDownload___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 startDownload:v16];
}

uint64_t __33__SUManagerClient_startDownload___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient startDownload:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __33__SUManagerClient_startDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __55__SUManagerClient_startDownloadWithOptions_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __55__SUManagerClient_startDownloadWithOptions_withResult___block_invoke_2;
  v19[3] = &unk_26447CEB0;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 startDownloadWithOptions:v7 withResult:v19];
}

uint64_t __55__SUManagerClient_startDownloadWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient startDownloadWithOptions:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __55__SUManagerClient_startDownloadWithOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)startDownloadWithMetadata:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__SUManagerClient_startDownloadWithMetadata_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__SUManagerClient_startDownloadWithMetadata_withResult___block_invoke_2;
  v19[3] = &unk_26447CEB0;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 startDownloadWithMetadata:v7 withResult:v19];
}

uint64_t __56__SUManagerClient_startDownloadWithMetadata_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient startDownloadWithMetadata:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __56__SUManagerClient_startDownloadWithMetadata_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__SUManagerClient_cancelDownloadWithOptions_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__SUManagerClient_cancelDownloadWithOptions_withResult___block_invoke_2;
  v19[3] = &unk_26447CEB0;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 cancelDownloadWithOptions:v7 withResult:v19];
}

uint64_t __56__SUManagerClient_cancelDownloadWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient cancelDownloadWithOptions:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __56__SUManagerClient_cancelDownloadWithOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)cancelDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __34__SUManagerClient_cancelDownload___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __34__SUManagerClient_cancelDownload___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 cancelDownloadWithOptions:0 withResult:v16];
}

uint64_t __34__SUManagerClient_cancelDownload___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient cancelDownload:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __34__SUManagerClient_cancelDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)pauseDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __33__SUManagerClient_pauseDownload___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __33__SUManagerClient_pauseDownload___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 pauseDownload:v16];
}

uint64_t __33__SUManagerClient_pauseDownload___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient pauseDownload:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __33__SUManagerClient_pauseDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)resumeDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __34__SUManagerClient_resumeDownload___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __34__SUManagerClient_resumeDownload___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 resumeDownload:v16];
}

uint64_t __34__SUManagerClient_resumeDownload___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient resumeDownload:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __34__SUManagerClient_resumeDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)updateDownloadOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__SUManagerClient_updateDownloadOptions_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__SUManagerClient_updateDownloadOptions_withResult___block_invoke_2;
  v19[3] = &unk_26447CEB0;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 updateDownloadOptions:v7 withResult:v19];
}

uint64_t __52__SUManagerClient_updateDownloadOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient updateDownloadOptions:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __52__SUManagerClient_updateDownloadOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)updateDownloadMetadata:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __53__SUManagerClient_updateDownloadMetadata_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __53__SUManagerClient_updateDownloadMetadata_withResult___block_invoke_2;
  v19[3] = &unk_26447CEB0;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 updateDownloadMetadata:v7 withResult:v19];
}

uint64_t __53__SUManagerClient_updateDownloadMetadata_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient updateDownloadMetadata:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __53__SUManagerClient_updateDownloadMetadata_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __55__SUManagerClient_purgeDownloadWithOptions_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __55__SUManagerClient_purgeDownloadWithOptions_withResult___block_invoke_2;
  v19[3] = &unk_26447CEB0;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 purgeDownloadWithOptions:v7 withResult:v19];
}

uint64_t __55__SUManagerClient_purgeDownloadWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient purgeDownloadWithOptions:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __55__SUManagerClient_purgeDownloadWithOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)purgeDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __33__SUManagerClient_purgeDownload___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __33__SUManagerClient_purgeDownload___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 purgeDownloadWithOptions:0 withResult:v16];
}

uint64_t __33__SUManagerClient_purgeDownload___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient purgeDownload:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __33__SUManagerClient_purgeDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)download:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __28__SUManagerClient_download___block_invoke;
  v14[3] = &unk_26447E390;
  id v15 = v4;
  id v13 = v4;
  [(SUManagerClient *)self downloadAndInstallState:v14];
}

uint64_t __28__SUManagerClient_download___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)downloadAndInstallState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __43__SUManagerClient_downloadAndInstallState___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43__SUManagerClient_downloadAndInstallState___block_invoke_2;
  v16[3] = &unk_26447E3B8;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 downloadAndInstallState:v16];
}

uint64_t __43__SUManagerClient_downloadAndInstallState___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, (uint64_t)v14, v7, v8, v9, (uint64_t)"-[SUManagerClient downloadAndInstallState:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, void, void, id))(v12 + 16))(v12, 0, 0, 0, v14);
  }

  return MEMORY[0x270F9A830]();
}

void __43__SUManagerClient_downloadAndInstallState___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v15 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = *(void *)(a1 + 40);
  if (v13)
  {
    if (v11)
    {
      (*(void (**)(void, void, void, void, id))(v13 + 16))(*(void *)(a1 + 40), 0, 0, 0, v11);
    }
    else
    {
      id v14 = [*(id *)(a1 + 32) _getExistingAutoInstallOperationFromModel:v10];
      (*(void (**)(uint64_t, id, id, void *, void))(v13 + 16))(v13, v15, v9, v14, 0);
    }
  }
}

- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v12, v13, v14, v15, v16, v17, v18, (uint64_t)v11);

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __88__SUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke;
  v24[3] = &unk_26447E318;
  v24[4] = self;
  id v19 = v8;
  id v25 = v19;
  id v20 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v24];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __88__SUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2;
  v22[3] = &unk_26447E3E0;
  v22[4] = self;
  id v23 = v19;
  id v21 = v19;
  [v20 updatesDownloadableWithOptions:v10 alternateDownloadOptions:v9 replyHandler:v22];
}

uint64_t __88__SUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, (uint64_t)v14, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:]_block_invoke");
    id v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, void))(v12 + 16))(v12, 0, 0);
  }

  return MEMORY[0x270F9A828]();
}

void __88__SUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v12 = a4;
  id v9 = a5;
  id v10 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, id))(v11 + 16))(v11, a2, a3, v12, v9);
  }
}

- (void)areUpdatesDownloadableWithOptions:(id)a3 alternateUpdateOptions:(id)a4 preferredUpdateDownloadable:(BOOL *)a5 alternateUpdateDownloadable:(BOOL *)a6 preferredUpdateError:(id *)a7 alternateUpdateError:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__15;
  v37 = __Block_byref_object_dispose__15;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__15;
  v31 = __Block_byref_object_dispose__15;
  id v32 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __174__SUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke;
  v26[3] = &unk_26447D9F8;
  v26[4] = self;
  id v23 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v26 connectIfNecessary:1];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __174__SUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke_2;
  v25[3] = &unk_26447E408;
  v25[4] = &v43;
  v25[5] = &v39;
  v25[6] = &v33;
  v25[7] = &v27;
  [v23 updatesDownloadableWithOptions:v13 alternateDownloadOptions:v14 replyHandler:v25];

  if (a5) {
    *a5 = *((unsigned char *)v44 + 24);
  }
  if (a6) {
    *a6 = *((unsigned char *)v40 + 24);
  }
  if (a7) {
    *a7 = (id) v34[5];
  }
  if (a8) {
    *a8 = (id) v28[5];
  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
}

void __174__SUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient areUpdatesDownloadableWithOptions:alternateUpdateOptions:preferredUpdateDownloadable:alternateUpdateDownloadable:preferredUpdateError:alternateUpdateError:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __174__SUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke_2(void *a1, char a2, char a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a3;
  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
  id v15 = v9;

  uint64_t v13 = *(void *)(a1[7] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v10;
}

- (BOOL)writeKeepAliveFile
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37__SUManagerClient_writeKeepAliveFile__block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  uint64_t v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v14 connectIfNecessary:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __37__SUManagerClient_writeKeepAliveFile__block_invoke_2;
  v13[3] = &unk_26447D660;
  v13[4] = &v15;
  [v11 writeKeepAliveFile:v13];

  LOBYTE(v11) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v11;
}

void __37__SUManagerClient_writeKeepAliveFile__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient writeKeepAliveFile]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

uint64_t __37__SUManagerClient_writeKeepAliveFile__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)deviceHasSufficientSpaceForDownloads:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__SUManagerClient_deviceHasSufficientSpaceForDownloads___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__SUManagerClient_deviceHasSufficientSpaceForDownloads___block_invoke_2;
  v16[3] = &unk_26447E3E0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 deviceHasSufficientSpaceForDownloads:v16];
}

uint64_t __56__SUManagerClient_deviceHasSufficientSpaceForDownloads___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, (uint64_t)v14, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient deviceHasSufficientSpaceForDownloads:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, void))(v12 + 16))(v12, 0, 0);
  }

  return MEMORY[0x270F9A828]();
}

void __56__SUManagerClient_deviceHasSufficientSpaceForDownloads___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v12 = a4;
  id v9 = a5;
  uint64_t v10 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, id))(v11 + 16))(v11, a2, a3, v12, v9);
  }
}

- (void)deviceHasSufficientSpaceForDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __55__SUManagerClient_deviceHasSufficientSpaceForDownload___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__SUManagerClient_deviceHasSufficientSpaceForDownload___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 deviceHasSufficientSpaceForDownload:v16];
}

uint64_t __55__SUManagerClient_deviceHasSufficientSpaceForDownload___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient deviceHasSufficientSpaceForDownload:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __55__SUManagerClient_deviceHasSufficientSpaceForDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)extraSpaceNeededForDownloadWithoutAppPurging:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__SUManagerClient_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__SUManagerClient_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_2;
  v16[3] = &unk_26447E430;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 extraSpaceNeededForDownloadWithoutAppPurging:v16];
}

uint64_t __64__SUManagerClient_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient extraSpaceNeededForDownloadWithoutAppPurging:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __64__SUManagerClient_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (BOOL)scheduleUpdate:(id)a3
{
  return [(SUManagerClient *)self scheduleUpdate:a3 withError:0];
}

- (BOOL)scheduleUpdate:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__15;
  uint64_t v24 = __Block_byref_object_dispose__15;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __44__SUManagerClient_scheduleUpdate_withError___block_invoke;
  v19[3] = &unk_26447D9F8;
  v19[4] = self;
  id v15 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v19 connectIfNecessary:1];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __44__SUManagerClient_scheduleUpdate_withError___block_invoke_2;
  v18[3] = &unk_26447E458;
  v18[4] = &v26;
  void v18[5] = &v20;
  [v15 handleDDMDeclaration:v6 withResult:v18];

  if (a4) {
    *a4 = (id) v21[5];
  }
  char v16 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __44__SUManagerClient_scheduleUpdate_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient scheduleUpdate:withError:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __44__SUManagerClient_scheduleUpdate_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)getDDMStatusWithKeys:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __51__SUManagerClient_getDDMStatusWithKeys_completion___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __51__SUManagerClient_getDDMStatusWithKeys_completion___block_invoke_2;
  v19[3] = &unk_26447E480;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 getDDMStatusWithKeys:v7 completion:v19];
}

uint64_t __51__SUManagerClient_getDDMStatusWithKeys_completion___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient getDDMStatusWithKeys:completion:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __51__SUManagerClient_getDDMStatusWithKeys_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = a2;
  uint64_t v7 = [v5 queue];
  dispatch_assert_queue_V2(v7);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)cancelUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __32__SUManagerClient_cancelUpdate___block_invoke;
  v16[3] = &unk_26447D9F8;
  v16[4] = self;
  uint64_t v13 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v16 connectIfNecessary:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __32__SUManagerClient_cancelUpdate___block_invoke_2;
  v15[3] = &unk_26447D660;
  void v15[4] = &v17;
  [v13 cancelDDMDeclaration:v4 withResult:v15];

  LOBYTE(v13) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v13;
}

void __32__SUManagerClient_cancelUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient cancelUpdate:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

uint64_t __32__SUManagerClient_cancelUpdate___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)cancelUpdateForKey:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__15;
  uint64_t v24 = __Block_byref_object_dispose__15;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __48__SUManagerClient_cancelUpdateForKey_withError___block_invoke;
  v19[3] = &unk_26447D9F8;
  v19[4] = self;
  uint64_t v15 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v19 connectIfNecessary:1];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__SUManagerClient_cancelUpdateForKey_withError___block_invoke_2;
  v18[3] = &unk_26447E458;
  v18[4] = &v26;
  void v18[5] = &v20;
  [v15 cancelDDMDeclarationForKey:v6 completion:v18];

  if (a4) {
    *a4 = (id) v21[5];
  }
  char v16 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __48__SUManagerClient_cancelUpdateForKey_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient cancelUpdateForKey:withError:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __48__SUManagerClient_cancelUpdateForKey_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)handleDDMDeclaration:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  SULogDebug(@"Client <%p>: [DDM] Sending declaration: %@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)self);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __51__SUManagerClient_handleDDMDeclaration_withResult___block_invoke;
  v28[3] = &unk_26447E318;
  void v28[4] = self;
  id v23 = v6;
  id v29 = v23;
  uint64_t v24 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v28];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __51__SUManagerClient_handleDDMDeclaration_withResult___block_invoke_2;
  v26[3] = &unk_26447CEB0;
  v26[4] = self;
  id v27 = v23;
  id v25 = v23;
  [v24 handleDDMDeclaration:v7 withResult:v26];
}

uint64_t __51__SUManagerClient_handleDDMDeclaration_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient handleDDMDeclaration:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __51__SUManagerClient_handleDDMDeclaration_withResult___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  if (!a3)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

- (void)getDDMDeclarationWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__SUManagerClient_getDDMDeclarationWithHandler___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__SUManagerClient_getDDMDeclarationWithHandler___block_invoke_2;
  v16[3] = &unk_26447E4A8;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 getDDMDeclarationWithHandler:v16];
}

uint64_t __48__SUManagerClient_getDDMDeclarationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient getDDMDeclarationWithHandler:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __48__SUManagerClient_getDDMDeclarationWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v15 = a2;
  uint64_t v7 = [v5 queue];
  dispatch_assert_queue_V2(v7);

  SULogDebug(@"Client <%p>: [DDM] Got reply with declaration: %@ error: %@", v8, v9, v10, v11, v12, v13, v14, *(void *)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)getDDMUpdateDescriptor
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__15;
  uint64_t v20 = __Block_byref_object_dispose__15;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __41__SUManagerClient_getDDMUpdateDescriptor__block_invoke;
  v15[3] = &unk_26447D9F8;
  void v15[4] = self;
  uint64_t v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v15 connectIfNecessary:1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__SUManagerClient_getDDMUpdateDescriptor__block_invoke_2;
  v14[3] = &unk_26447E4D0;
  void v14[4] = self;
  void v14[5] = &v16;
  [v11 getDDMUpdateDescriptorWithHandler:v14];

  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __41__SUManagerClient_getDDMUpdateDescriptor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient getDDMUpdateDescriptor]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __41__SUManagerClient_getDDMUpdateDescriptor__block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  SULogDebug(@"Client <%p>: [DDM] Got reply with descriptor: %@ error: %@", v3, v4, v5, v6, v7, v8, v9, *(void *)(a1 + 32));
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v12;
}

- (id)declarationsWithError:(id *)a3
{
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__15;
  uint64_t v28 = __Block_byref_object_dispose__15;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__15;
  uint64_t v22 = __Block_byref_object_dispose__15;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __41__SUManagerClient_declarationsWithError___block_invoke;
  v17[3] = &unk_26447D9F8;
  v17[4] = self;
  id v13 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v17 connectIfNecessary:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __41__SUManagerClient_declarationsWithError___block_invoke_2;
  v16[3] = &unk_26447E4F8;
  v16[4] = &v24;
  void v16[5] = &v18;
  [v13 getAllDeclarationsWithHandler:v16];

  if (a3) {
    *a3 = (id) v19[5];
  }
  id v14 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v14;
}

void __41__SUManagerClient_declarationsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient declarationsWithError:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __41__SUManagerClient_declarationsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setGlobalSettings:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__15;
  uint64_t v24 = __Block_byref_object_dispose__15;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __47__SUManagerClient_setGlobalSettings_withError___block_invoke;
  v19[3] = &unk_26447D9F8;
  v19[4] = self;
  id v15 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v19 connectIfNecessary:1];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __47__SUManagerClient_setGlobalSettings_withError___block_invoke_2;
  v18[3] = &unk_26447E458;
  v18[4] = &v26;
  void v18[5] = &v20;
  [v15 setDDMGlobalSettings:v6 completion:v18];

  if (a4) {
    *a4 = (id) v21[5];
  }
  char v16 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __47__SUManagerClient_setGlobalSettings_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient setGlobalSettings:withError:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __47__SUManagerClient_setGlobalSettings_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)globalSettingsDeclarationWithError:(id *)a3
{
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__15;
  uint64_t v28 = __Block_byref_object_dispose__15;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__15;
  uint64_t v22 = __Block_byref_object_dispose__15;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__SUManagerClient_globalSettingsDeclarationWithError___block_invoke;
  v17[3] = &unk_26447D9F8;
  v17[4] = self;
  id v13 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v17 connectIfNecessary:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__SUManagerClient_globalSettingsDeclarationWithError___block_invoke_2;
  v16[3] = &unk_26447E520;
  v16[4] = &v24;
  void v16[5] = &v18;
  [v13 getDDMGlobalSettingsWithHandler:v16];

  if (a3) {
    *a3 = (id) v19[5];
  }
  id v14 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v14;
}

void __54__SUManagerClient_globalSettingsDeclarationWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient globalSettingsDeclarationWithError:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __54__SUManagerClient_globalSettingsDeclarationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)shouldDisableAutoDownloadIOSUpdatesToggle
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__SUManagerClient_shouldDisableAutoDownloadIOSUpdatesToggle__block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  id v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v14 connectIfNecessary:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__SUManagerClient_shouldDisableAutoDownloadIOSUpdatesToggle__block_invoke_2;
  v13[3] = &unk_26447D660;
  v13[4] = &v15;
  [v11 getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler:v13];

  LOBYTE(v11) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v11;
}

void __60__SUManagerClient_shouldDisableAutoDownloadIOSUpdatesToggle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient shouldDisableAutoDownloadIOSUpdatesToggle]_block_invoke");
    id v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __60__SUManagerClient_shouldDisableAutoDownloadIOSUpdatesToggle__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3) {
    SULogError(@"%s: failed with error %@", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUManagerClient shouldDisableAutoDownloadIOSUpdatesToggle]_block_invoke_2");
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
}

- (BOOL)shouldDisableAutoInstallIOSUpdatesToggle
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__SUManagerClient_shouldDisableAutoInstallIOSUpdatesToggle__block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  id v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v14 connectIfNecessary:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__SUManagerClient_shouldDisableAutoInstallIOSUpdatesToggle__block_invoke_2;
  v13[3] = &unk_26447D660;
  v13[4] = &v15;
  [v11 getShouldDisableAutoInstallIOSUpdatesToggleWithHandler:v13];

  LOBYTE(v11) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v11;
}

void __59__SUManagerClient_shouldDisableAutoInstallIOSUpdatesToggle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient shouldDisableAutoInstallIOSUpdatesToggle]_block_invoke");
    id v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __59__SUManagerClient_shouldDisableAutoInstallIOSUpdatesToggle__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3) {
    SULogError(@"%s: failed with error %@", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUManagerClient shouldDisableAutoInstallIOSUpdatesToggle]_block_invoke_2");
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
}

- (BOOL)shouldDisableAutoInstallRSRToggle
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__SUManagerClient_shouldDisableAutoInstallRSRToggle__block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  id v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v14 connectIfNecessary:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__SUManagerClient_shouldDisableAutoInstallRSRToggle__block_invoke_2;
  v13[3] = &unk_26447D660;
  v13[4] = &v15;
  [v11 getShouldDisableAutoInstallRSRToggleWithHandler:v13];

  LOBYTE(v11) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v11;
}

void __52__SUManagerClient_shouldDisableAutoInstallRSRToggle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient shouldDisableAutoInstallRSRToggle]_block_invoke");
    id v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __52__SUManagerClient_shouldDisableAutoInstallRSRToggle__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3) {
    SULogError(@"%s: failed with error %@", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUManagerClient shouldDisableAutoInstallRSRToggle]_block_invoke_2");
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
}

- (void)currentAutoInstallOperationForecast:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __55__SUManagerClient_currentAutoInstallOperationForecast___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__SUManagerClient_currentAutoInstallOperationForecast___block_invoke_2;
  v16[3] = &unk_26447E548;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 currentAutoInstallOperationForecast:v16];
}

uint64_t __55__SUManagerClient_currentAutoInstallOperationForecast___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient currentAutoInstallOperationForecast:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __55__SUManagerClient_currentAutoInstallOperationForecast___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)currentAutoInstallOperation:(BOOL)a3 withResult:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __58__SUManagerClient_currentAutoInstallOperation_withResult___block_invoke;
  v20[3] = &unk_26447E318;
  v20[4] = self;
  id v15 = v6;
  id v21 = v15;
  char v16 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__SUManagerClient_currentAutoInstallOperation_withResult___block_invoke_2;
  v18[3] = &unk_26447E570;
  v18[4] = self;
  id v19 = v15;
  id v17 = v15;
  [v16 currentAutoInstallOperation:v4 withResult:v18];
}

uint64_t __58__SUManagerClient_currentAutoInstallOperation_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient currentAutoInstallOperation:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __58__SUManagerClient_currentAutoInstallOperation_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = 0;
    if (v9 && !v5)
    {
      uint64_t v8 = [*(id *)(a1 + 32) _getExistingAutoInstallOperationFromModel:v9];
      uint64_t v7 = *(void *)(a1 + 40);
    }
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)currentPasscodePolicy:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __41__SUManagerClient_currentPasscodePolicy___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __41__SUManagerClient_currentPasscodePolicy___block_invoke_2;
  v16[3] = &unk_26447E598;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 currentPasscodePolicy:v16];
}

uint64_t __41__SUManagerClient_currentPasscodePolicy___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient currentPasscodePolicy:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __41__SUManagerClient_currentPasscodePolicy___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (void)isAutoUpdateEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __39__SUManagerClient_isAutoUpdateEnabled___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__SUManagerClient_isAutoUpdateEnabled___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 isAutoUpdateEnabled:v16];
}

uint64_t __39__SUManagerClient_isAutoUpdateEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isAutoUpdateEnabled:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __39__SUManagerClient_isAutoUpdateEnabled___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (void)isAutoUpdateScheduled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __41__SUManagerClient_isAutoUpdateScheduled___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __41__SUManagerClient_isAutoUpdateScheduled___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 isAutoUpdateScheduled:v16];
}

uint64_t __41__SUManagerClient_isAutoUpdateScheduled___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isAutoUpdateScheduled:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __41__SUManagerClient_isAutoUpdateScheduled___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (BOOL)isAutoUpdateScheduled
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __40__SUManagerClient_isAutoUpdateScheduled__block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  uint64_t v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v14 connectIfNecessary:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__SUManagerClient_isAutoUpdateScheduled__block_invoke_2;
  v13[3] = &unk_26447D660;
  v13[4] = &v15;
  [v11 isAutoUpdateScheduled:v13];

  LOBYTE(v11) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v11;
}

void __40__SUManagerClient_isAutoUpdateScheduled__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isAutoUpdateScheduled]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

uint64_t __40__SUManagerClient_isAutoUpdateScheduled__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)presentAutoUpdateBanner:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __43__SUManagerClient_presentAutoUpdateBanner___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43__SUManagerClient_presentAutoUpdateBanner___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 presentAutoUpdateBanner:v16];
}

uint64_t __43__SUManagerClient_presentAutoUpdateBanner___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient presentAutoUpdateBanner:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __43__SUManagerClient_presentAutoUpdateBanner___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (id)_getExistingAutoInstallOperationFromModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
    id v7 = [v4 id];
    uint64_t v8 = [v7 UUIDString];
    uint64_t v9 = [(NSMutableDictionary *)installOperationIDsToOperationHandler objectForKey:v8];

    if (!v9)
    {
      uint64_t v9 = [[SUAutoInstallOperation alloc] initWithAutoInstallOperationModel:v5 client:self];
      [(SUManagerClient *)self _registerAutoInstallOperationClientHandler:v9];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)observeInstallationConstraintChangesForDownload:(id)a3 observer:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v48 = v6;
  char v16 = [v6 progress];
  int v17 = [v16 isDone];

  if (v17)
  {
    id v47 = v7;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    char v18 = self->_installationConstraintObservers;
    uint64_t v19 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      char v46 = self;
      id v21 = 0;
      uint64_t v22 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v52 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v25 = [v24 download];
          uint64_t v26 = [v25 descriptor];
          id v27 = [v48 descriptor];
          int v28 = [v26 isEqual:v27];

          if (v28)
          {
            id v29 = v24;

            id v21 = v29;
          }
        }
        uint64_t v20 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v20);

      self = v46;
      id v7 = v47;
      if (v21) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    id v21 = [[SUInstallationConstraintObserver alloc] initWithDownload:v48];
    [(SUComposedInstallationConstraintMonitor *)v21 setDelegate:self];
    if (v21)
    {
      [(NSMutableSet *)self->_installationConstraintObservers addObject:v21];
      SULogDebug(@"Created installation constraint observer: %@: observers: %@", v37, v38, v39, v40, v41, v42, v43, (uint64_t)v21);
LABEL_16:
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __76__SUManagerClient_observeInstallationConstraintChangesForDownload_observer___block_invoke;
      v49[3] = &unk_26447E5E8;
      v49[4] = self;
      id v50 = v7;
      v44 = [(SUInstallationConstraintObserver *)v21 registerObserverBlock:v49];

      goto LABEL_19;
    }
    SULogDebug(@"Created installation constraint observer: %@: observers: %@", v30, v31, v32, v33, v34, v35, v36, 0);
  }
  v44 = 0;
LABEL_19:

  return v44;
}

void __76__SUManagerClient_observeInstallationConstraintChangesForDownload_observer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__SUManagerClient_observeInstallationConstraintChangesForDownload_observer___block_invoke_2;
  v11[3] = &unk_26447E5C0;
  id v9 = *(id *)(a1 + 40);
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  id v12 = v7;
  id v13 = v9;
  id v10 = v7;
  dispatch_async(v8, v11);
}

uint64_t __76__SUManagerClient_observeInstallationConstraintChangesForDownload_observer___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[7], a1[4]);
}

- (void)registerCSInstallPredicatesOnDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  id v13 = [(SUManagerClient *)self _remoteInterface];
  [v13 registerCSInstallPredicatesOnDate:v4];
}

- (void)isUpdateReadyForInstallation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__SUManagerClient_isUpdateReadyForInstallation___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  uint64_t v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__SUManagerClient_isUpdateReadyForInstallation___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 isUpdateReadyForInstallation:v16];
}

uint64_t __48__SUManagerClient_isUpdateReadyForInstallation___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isUpdateReadyForInstallation:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __48__SUManagerClient_isUpdateReadyForInstallation___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __70__SUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__SUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2;
  v19[3] = &unk_26447CEB0;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 isUpdateReadyForInstallationWithOptions:v7 withResult:v19];
}

uint64_t __70__SUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isUpdateReadyForInstallationWithOptions:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __70__SUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __62__SUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__SUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke_2;
  v19[3] = &unk_26447CEB0;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 installUpdateWithInstallOptions:v7 withResult:v19];
}

uint64_t __62__SUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient installUpdateWithInstallOptions:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __62__SUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)installUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __55__SUManagerClient_installUpdateWithOptions_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __55__SUManagerClient_installUpdateWithOptions_withResult___block_invoke_2;
  v19[3] = &unk_26447CEB0;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 installUpdateWithOptions:v7 withResult:v19];
}

uint64_t __55__SUManagerClient_installUpdateWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient installUpdateWithOptions:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __55__SUManagerClient_installUpdateWithOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)installUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __33__SUManagerClient_installUpdate___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __33__SUManagerClient_installUpdate___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 installUpdate:v16];
}

uint64_t __33__SUManagerClient_installUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient installUpdate:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __33__SUManagerClient_installUpdate___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)userAskedToDeferInstall
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__SUManagerClient_userAskedToDeferInstall__block_invoke;
  v12[3] = &unk_26447D9F8;
  v12[4] = self;
  uint64_t v11 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v12 connectIfNecessary:1];
  [v11 userAskedToDeferInstall];
}

void __42__SUManagerClient_userAskedToDeferInstall__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient userAskedToDeferInstall]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

- (void)eligibleRollbackWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__SUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__SUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke_2;
  v19[3] = &unk_26447E610;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 eligibleRollbackWithOptions:v7 withResult:v19];
}

uint64_t __58__SUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient eligibleRollbackWithOptions:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __58__SUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__SUManagerClient_rollbackUpdateWithOptions_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__SUManagerClient_rollbackUpdateWithOptions_withResult___block_invoke_2;
  v19[3] = &unk_26447E638;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 rollbackUpdateWithOptions:v7 withResult:v19];
}

uint64_t __56__SUManagerClient_rollbackUpdateWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, (uint64_t)v14, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient rollbackUpdateWithOptions:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, void, id))(v12 + 16))(v12, 0, 0, v14);
  }

  return MEMORY[0x270F9A828]();
}

void __56__SUManagerClient_rollbackUpdateWithOptions_withResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v9 + 16))(v9, a2, v10, v7);
  }
}

- (void)previousRollbackWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__SUManagerClient_previousRollbackWithOptions_withResult___block_invoke;
  v21[3] = &unk_26447E318;
  v21[4] = self;
  id v16 = v6;
  id v22 = v16;
  id v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__SUManagerClient_previousRollbackWithOptions_withResult___block_invoke_2;
  v19[3] = &unk_26447E610;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 previousRollback:v7 withResult:v19];
}

uint64_t __58__SUManagerClient_previousRollbackWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient previousRollbackWithOptions:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __58__SUManagerClient_previousRollbackWithOptions_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)isRollingBack:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __33__SUManagerClient_isRollingBack___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __33__SUManagerClient_isRollingBack___block_invoke_2;
  v16[3] = &unk_26447E638;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 isRollingBack:v16];
}

uint64_t __33__SUManagerClient_isRollingBack___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, (uint64_t)v14, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isRollingBack:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, void, id))(v12 + 16))(v12, 0, 0, v14);
  }

  return MEMORY[0x270F9A828]();
}

void __33__SUManagerClient_isRollingBack___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v9 + 16))(v9, a2, v10, v7);
  }
}

- (void)scheduleRollbackRebootForLater:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __50__SUManagerClient_scheduleRollbackRebootForLater___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__SUManagerClient_scheduleRollbackRebootForLater___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 scheduleRollbackRebootForLater:v16];
}

uint64_t __50__SUManagerClient_scheduleRollbackRebootForLater___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient scheduleRollbackRebootForLater:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __50__SUManagerClient_scheduleRollbackRebootForLater___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (BOOL)isSplatOnlyUpdateInstalled
{
  return +[SUUtility isSplatOnlyUpdateInstalled];
}

- (BOOL)setLastRollbackDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __45__SUManagerClient_setLastRollbackDescriptor___block_invoke;
  v17[3] = &unk_26447D9F8;
  v17[4] = self;
  id v13 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v17 connectIfNecessary:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__SUManagerClient_setLastRollbackDescriptor___block_invoke_2;
  v16[3] = &unk_26447E660;
  v16[4] = self;
  void v16[5] = &v18;
  void v16[6] = &v22;
  [v13 setLastRollbackDescriptor:v4 withResult:v16];

  if (*((unsigned char *)v19 + 24)) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = *((unsigned char *)v23 + 24) != 0;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __45__SUManagerClient_setLastRollbackDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient setLastRollbackDescriptor:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __45__SUManagerClient_setLastRollbackDescriptor___block_invoke_2(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
  {
    SULogDebug(@"Client <%p>: unable to set rollback descriptor in state file: %@", a2, a3, a4, a5, a6, a7, a8, a1[4]);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
  }
}

- (BOOL)securityResponseRollbackSuggested:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__15;
  uint64_t v24 = __Block_byref_object_dispose__15;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __59__SUManagerClient_securityResponseRollbackSuggested_error___block_invoke;
  v19[3] = &unk_26447D9F8;
  v19[4] = self;
  id v15 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v19 connectIfNecessary:1];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __59__SUManagerClient_securityResponseRollbackSuggested_error___block_invoke_2;
  v18[3] = &unk_26447E458;
  v18[4] = &v26;
  void v18[5] = &v20;
  [v15 securityResponseRollbackSuggested:v6 withResult:v18];

  if (a4) {
    *a4 = (id) v21[5];
  }
  char v16 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __59__SUManagerClient_securityResponseRollbackSuggested_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient securityResponseRollbackSuggested:error:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __59__SUManagerClient_securityResponseRollbackSuggested_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)createInstallationKeybagWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__SUManagerClient_createInstallationKeybagWithOptions___block_invoke;
  v17[3] = &unk_26447D9F8;
  v17[4] = self;
  id v13 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v17 connectIfNecessary:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__SUManagerClient_createInstallationKeybagWithOptions___block_invoke_2;
  v16[3] = &unk_26447E660;
  v16[4] = self;
  void v16[5] = &v18;
  void v16[6] = &v22;
  [v13 createInstallationKeybag:v4 withResult:v16];

  if (*((unsigned char *)v19 + 24)) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = *((unsigned char *)v23 + 24) != 0;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __55__SUManagerClient_createInstallationKeybagWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient createInstallationKeybagWithOptions:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __55__SUManagerClient_createInstallationKeybagWithOptions___block_invoke_2(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
  {
    SULogDebug(@"Client <%p>: unable to create installation keybag: %@", a2, a3, a4, a5, a6, a7, a8, a1[4]);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
  }
}

- (BOOL)createInstallationKeybag:(id)a3
{
  return [(SUManagerClient *)self createInstallationKeybag:a3 forUnattendedInstall:0];
}

- (BOOL)createInstallationKeybag:(id)a3 forUnattendedInstall:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(SUKeybagOptions);
  [(SUKeybagOptions *)v7 setPasscode:v6];

  [(SUKeybagOptions *)v7 setKeybagType:v4];
  LOBYTE(v4) = [(SUManagerClient *)self createInstallationKeybagWithOptions:v7];

  return v4;
}

- (BOOL)isInstallationKeybagRequired
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__SUManagerClient_isInstallationKeybagRequired__block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  uint64_t v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v14 connectIfNecessary:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__SUManagerClient_isInstallationKeybagRequired__block_invoke_2;
  v13[3] = &unk_26447D660;
  v13[4] = &v15;
  [v11 isInstallationKeybagRequired:v13];

  LOBYTE(v11) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v11;
}

void __47__SUManagerClient_isInstallationKeybagRequired__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isInstallationKeybagRequired]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

uint64_t __47__SUManagerClient_isInstallationKeybagRequired__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isInstallationKeybagRequiredForDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__SUManagerClient_isInstallationKeybagRequiredForDescriptor___block_invoke;
  v16[3] = &unk_26447D9F8;
  v16[4] = self;
  id v13 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v16 connectIfNecessary:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__SUManagerClient_isInstallationKeybagRequiredForDescriptor___block_invoke_2;
  v15[3] = &unk_26447D660;
  void v15[4] = &v17;
  [v13 isInstallationKeybagRequiredForDescriptor:v4 result:v15];

  LOBYTE(v13) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);

  return (char)v13;
}

void __61__SUManagerClient_isInstallationKeybagRequiredForDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isInstallationKeybagRequiredForDescriptor:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

uint64_t __61__SUManagerClient_isInstallationKeybagRequiredForDescriptor___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)destroyInstallationKeybag
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__SUManagerClient_destroyInstallationKeybag__block_invoke;
  v12[3] = &unk_26447D9F8;
  v12[4] = self;
  uint64_t v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v12 connectIfNecessary:1];
  [v11 destroyInstallationKeybag];
}

void __44__SUManagerClient_destroyInstallationKeybag__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient destroyInstallationKeybag]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

- (void)slaVersion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __30__SUManagerClient_slaVersion___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  BOOL v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __30__SUManagerClient_slaVersion___block_invoke_2;
  v16[3] = &unk_26447E430;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 slaVersion:v16];
}

uint64_t __30__SUManagerClient_slaVersion___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient slaVersion:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __30__SUManagerClient_slaVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)setMandatorySoftwareUpdateDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__SUManagerClient_setMandatorySoftwareUpdateDictionary___block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  id v13 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v14];
  [v13 setMandatorySoftwareUpdateDictionary:v4];
}

void __56__SUManagerClient_setMandatorySoftwareUpdateDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v11 = v14;
  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient setMandatorySoftwareUpdateDictionary:]_block_invoke");
    uint64_t v12 = [v14 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v14 code] == 4097)
      {
      }
      else
      {
        uint64_t v13 = [v14 code];

        uint64_t v11 = v14;
        if (v13 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    uint64_t v11 = v14;
  }
LABEL_9:
}

- (void)getMandatorySoftwareUpdateDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__SUManagerClient_getMandatorySoftwareUpdateDictionary___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__SUManagerClient_getMandatorySoftwareUpdateDictionary___block_invoke_2;
  v16[3] = &unk_26447E688;
  id v17 = v13;
  id v15 = v13;
  [v14 getMandatorySoftwareUpdateDictionary:v16];
}

uint64_t __56__SUManagerClient_getMandatorySoftwareUpdateDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient getMandatorySoftwareUpdateDictionary:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

uint64_t __56__SUManagerClient_getMandatorySoftwareUpdateDictionary___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)getMandatorySoftwareUpdateDictionaryWithError:(id *)a3
{
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__15;
  uint64_t v28 = __Block_byref_object_dispose__15;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__15;
  uint64_t v22 = __Block_byref_object_dispose__15;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__SUManagerClient_getMandatorySoftwareUpdateDictionaryWithError___block_invoke;
  v17[3] = &unk_26447D9F8;
  v17[4] = self;
  id v13 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v17 connectIfNecessary:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __65__SUManagerClient_getMandatorySoftwareUpdateDictionaryWithError___block_invoke_2;
  v16[3] = &unk_26447E6B0;
  void v16[4] = &v24;
  void v16[5] = &v18;
  [v13 getMandatorySoftwareUpdateDictionary:v16];

  if (a3) {
    *a3 = (id) v19[5];
  }
  id v14 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v14;
}

void __65__SUManagerClient_getMandatorySoftwareUpdateDictionaryWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient getMandatorySoftwareUpdateDictionaryWithError:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __65__SUManagerClient_getMandatorySoftwareUpdateDictionaryWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)enableAutomaticUpdateV2:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__SUManagerClient_enableAutomaticUpdateV2___block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  id v13 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v14];
  [v13 enableAutomaticUpdateV2:v3];
}

void __43__SUManagerClient_enableAutomaticUpdateV2___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  BOOL v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v11 = v14;
  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient enableAutomaticUpdateV2:]_block_invoke");
    uint64_t v12 = [v14 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v14 code] == 4097)
      {
      }
      else
      {
        uint64_t v13 = [v14 code];

        uint64_t v11 = v14;
        if (v13 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    uint64_t v11 = v14;
  }
LABEL_9:
}

- (BOOL)isAutomaticUpdateV2Enabled
{
  BOOL v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__SUManagerClient_isAutomaticUpdateV2Enabled__block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  uint64_t v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v14 connectIfNecessary:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__SUManagerClient_isAutomaticUpdateV2Enabled__block_invoke_2;
  v13[3] = &unk_26447D660;
  v13[4] = &v15;
  [v11 isAutomaticUpdateV2Enabled:v13];

  LOBYTE(v11) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v11;
}

void __45__SUManagerClient_isAutomaticUpdateV2Enabled__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isAutomaticUpdateV2Enabled]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

uint64_t __45__SUManagerClient_isAutomaticUpdateV2Enabled__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)enableAutomaticDownload:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__SUManagerClient_enableAutomaticDownload___block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  id v13 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v14];
  [v13 enableAutomaticDownload:v3];
}

void __43__SUManagerClient_enableAutomaticDownload___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  BOOL v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v11 = v14;
  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient enableAutomaticDownload:]_block_invoke");
    uint64_t v12 = [v14 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v14 code] == 4097)
      {
      }
      else
      {
        uint64_t v13 = [v14 code];

        uint64_t v11 = v14;
        if (v13 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    uint64_t v11 = v14;
  }
LABEL_9:
}

- (BOOL)isAutomaticDownloadEnabled
{
  BOOL v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__SUManagerClient_isAutomaticDownloadEnabled__block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  uint64_t v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v14 connectIfNecessary:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__SUManagerClient_isAutomaticDownloadEnabled__block_invoke_2;
  v13[3] = &unk_26447D660;
  v13[4] = &v15;
  [v11 isAutomaticDownloadEnabled:v13];

  LOBYTE(v11) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v11;
}

void __45__SUManagerClient_isAutomaticDownloadEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isAutomaticDownloadEnabled]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

uint64_t __45__SUManagerClient_isAutomaticDownloadEnabled__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isAnyClientInUserInteraction
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__SUManagerClient_isAnyClientInUserInteraction__block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  uint64_t v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v14 connectIfNecessary:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__SUManagerClient_isAnyClientInUserInteraction__block_invoke_2;
  v13[3] = &unk_26447D660;
  v13[4] = &v15;
  [v11 isAnyClientInUserInteraction:v13];

  LOBYTE(v11) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v11;
}

void __47__SUManagerClient_isAnyClientInUserInteraction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isAnyClientInUserInteraction]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

uint64_t __47__SUManagerClient_isAnyClientInUserInteraction__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)isSoftwareUpdateInProgress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  if (v4)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __46__SUManagerClient_isSoftwareUpdateInProgress___block_invoke;
    v17[3] = &unk_26447E318;
    v17[4] = self;
    id v13 = v4;
    id v18 = v13;
    id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__SUManagerClient_isSoftwareUpdateInProgress___block_invoke_2;
    v15[3] = &unk_26447CEB0;
    void v15[4] = self;
    id v16 = v13;
    [v14 isSoftwareUpdateInProgress:v15];
  }
}

uint64_t __46__SUManagerClient_isSoftwareUpdateInProgress___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isSoftwareUpdateInProgress:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __46__SUManagerClient_isSoftwareUpdateInProgress___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v15 = a3;
  uint64_t v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  id v14 = @"NO";
  if (a2) {
    id v14 = @"YES";
  }
  SULogInfo(@"isSoftwareUpdateInProgress: %@, error: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)softwareUpdatePathRestriction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __49__SUManagerClient_softwareUpdatePathRestriction___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__SUManagerClient_softwareUpdatePathRestriction___block_invoke_2;
  v16[3] = &unk_26447E598;
  void v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 softwareUpdatePathRestriction:v16];
}

uint64_t __49__SUManagerClient_softwareUpdatePathRestriction___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient softwareUpdatePathRestriction:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __49__SUManagerClient_softwareUpdatePathRestriction___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (void)isDelayingUpdates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __37__SUManagerClient_isDelayingUpdates___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __37__SUManagerClient_isDelayingUpdates___block_invoke_2;
  v16[3] = &unk_26447CEB0;
  void v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 isDelayingUpdates:v16];
}

uint64_t __37__SUManagerClient_isDelayingUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isDelayingUpdates:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __37__SUManagerClient_isDelayingUpdates___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    if (v8) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }
}

- (void)delayEndDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __32__SUManagerClient_delayEndDate___block_invoke;
  v18[3] = &unk_26447E318;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  id v14 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __32__SUManagerClient_delayEndDate___block_invoke_2;
  v16[3] = &unk_26447E6D8;
  void v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 delayEndDate:v16];
}

uint64_t __32__SUManagerClient_delayEndDate___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient delayEndDate:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __32__SUManagerClient_delayEndDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id v8 = v9;
    if (v5) {
      id v8 = 0;
    }
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (BOOL)isSplatOnlyUpdateRollbackAllowed:(id *)a3
{
  id v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__15;
  uint64_t v22 = __Block_byref_object_dispose__15;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__SUManagerClient_isSplatOnlyUpdateRollbackAllowed___block_invoke;
  v17[3] = &unk_26447D9F8;
  v17[4] = self;
  id v13 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v17 connectIfNecessary:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__SUManagerClient_isSplatOnlyUpdateRollbackAllowed___block_invoke_2;
  v16[3] = &unk_26447E458;
  void v16[4] = &v24;
  void v16[5] = &v18;
  [v13 splatRollbackAllowed:v16];

  if (a3) {
    *a3 = (id) v19[5];
  }
  char v14 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __52__SUManagerClient_isSplatOnlyUpdateRollbackAllowed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isSplatOnlyUpdateRollbackAllowed:]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __52__SUManagerClient_isSplatOnlyUpdateRollbackAllowed___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)isSplatOnlyUpdateRollbackSuggested
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__SUManagerClient_isSplatOnlyUpdateRollbackSuggested__block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  uint64_t v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v14 connectIfNecessary:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__SUManagerClient_isSplatOnlyUpdateRollbackSuggested__block_invoke_2;
  v13[3] = &unk_26447D660;
  v13[4] = &v15;
  [v11 isSplatOnlyUpdateRollbackSuggested:v13];

  LOBYTE(v11) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)v11;
}

void __53__SUManagerClient_isSplatOnlyUpdateRollbackSuggested__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isSplatOnlyUpdateRollbackSuggested]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

uint64_t __53__SUManagerClient_isSplatOnlyUpdateRollbackSuggested__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (BOOL)_isMultiUserAppleId
{
  v2 = [MEMORY[0x263F841B0] sharedManager];
  if ([v2 isMultiUser])
  {
    id v3 = [v2 currentUser];
    BOOL v4 = [v3 userType] == 1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)_shouldDisallowAvailabilityNotifications
{
  id v3 = +[SUPreferences sharedInstance];
  [v3 reload];
  char v4 = [v3 disableAvailabilityAlerts];
  LOBYTE(a1) = [a1 _isMultiUserAppleId] | v4;

  return (char)a1;
}

- (void)_registerAutoInstallOperationClientHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  id v14 = [v4 uniqueIdentifier];
  [(NSMutableDictionary *)installOperationIDsToOperationHandler setValue:v4 forKey:v14];
}

- (void)_unregisterAutoInstallOperationClientHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  id v14 = [v4 uniqueIdentifier];
  [(NSMutableDictionary *)installOperationIDsToOperationHandler setValue:v4 forKey:v14];
}

- (void)_consentAutoInstallOperation:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  if (v6)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __59__SUManagerClient__consentAutoInstallOperation_withResult___block_invoke;
    v21[3] = &unk_26447E318;
    v21[4] = self;
    id v16 = v7;
    id v22 = v16;
    uint64_t v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
    char v18 = [v6 id];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __59__SUManagerClient__consentAutoInstallOperation_withResult___block_invoke_2;
    v19[3] = &unk_26447CEB0;
    v19[4] = self;
    id v20 = v16;
    [v17 consentToAutoInstallOperation:v18 withResult:v19];
  }
}

uint64_t __59__SUManagerClient__consentAutoInstallOperation_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient _consentAutoInstallOperation:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __59__SUManagerClient__consentAutoInstallOperation_withResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (void)_cancelAutoInstallOperation:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  if (v6)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__SUManagerClient__cancelAutoInstallOperation_withResult___block_invoke;
    v21[3] = &unk_26447E318;
    v21[4] = self;
    id v16 = v7;
    id v22 = v16;
    uint64_t v17 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v21];
    char v18 = [v6 id];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __58__SUManagerClient__cancelAutoInstallOperation_withResult___block_invoke_2;
    v19[3] = &unk_26447CEB0;
    v19[4] = self;
    id v20 = v16;
    [v17 cancelAutoInstallOperation:v18 withResult:v19];
  }
}

uint64_t __58__SUManagerClient__cancelAutoInstallOperation_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient _cancelAutoInstallOperation:withResult:]_block_invoke");
    uint64_t v10 = [v14 domain];
    if (![v10 isEqualToString:*MEMORY[0x263F07F70]])
    {

      goto LABEL_8;
    }
    if ([v14 code] == 4097)
    {
    }
    else
    {
      uint64_t v11 = [v14 code];

      if (v11 != 4099) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) _invalidateConnection];
  }
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v14);
  }

  return MEMORY[0x270F9A790]();
}

void __58__SUManagerClient__cancelAutoInstallOperation_withResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (void)installServerConfiguration
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__SUManagerClient_installServerConfiguration__block_invoke;
  v12[3] = &unk_26447D9F8;
  v12[4] = self;
  uint64_t v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v12 connectIfNecessary:1];
  [v11 installServerConfiguration];
}

void __45__SUManagerClient_installServerConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient installServerConfiguration]_block_invoke");
    uint64_t v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

- (void)setExclusiveControl:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__SUManagerClient_setExclusiveControl___block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  id v13 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v14];
  [v13 setExclusiveControl:v3];
}

void __39__SUManagerClient_setExclusiveControl___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  BOOL v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v11 = v14;
  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient setExclusiveControl:]_block_invoke");
    uint64_t v12 = [v14 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v14 code] == 4097)
      {
      }
      else
      {
        uint64_t v13 = [v14 code];

        uint64_t v11 = v14;
        if (v13 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    uint64_t v11 = v14;
  }
LABEL_9:
}

- (void)recordSUAnalyticsEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  id v13 = [(SUManagerClient *)self _remoteInterface];
  [v13 recordSUAnalyticsEvent:v4];
}

- (void)submitSUAnalyticsEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  id v13 = [(SUManagerClient *)self _remoteInterface];
  [v13 submitSUAnalyticsEvent:v4];
}

- (void)submitAllSUAnalyticsEvents
{
  BOOL v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  id v11 = [(SUManagerClient *)self _remoteInterface];
  [v11 submitAllSUAnalyticsEvents];
}

- (void)submitSUAnalyticsEventsWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  id v13 = [(SUManagerClient *)self _remoteInterface];
  [v13 submitSUAnalyticsEventsWithName:v4];
}

- (void)networkMonitorDetectOverrides
{
  id v2 = [(SUManagerClient *)self _remoteInterface];
  [v2 networkMonitorDetectOverrides];
}

- (void)installationConstraintObserverDidRemoveAllObserverBlocks:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SUManagerClient.m", 1516, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__SUManagerClient_installationConstraintObserverDidRemoveAllObserverBlocks___block_invoke;
  block[3] = &unk_26447C8C8;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __76__SUManagerClient_installationConstraintObserverDidRemoveAllObserverBlocks___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateConstraintObserver:*(void *)(a1 + 40) withError:0];
  SULogInfo(@"installationConstraintObserverDidRemoveAllObserverBlocks: %@: observers: %@", v2, v3, v4, v5, v6, v7, v8, *(void *)(a1 + 40));
}

- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SUManagerClient_preferences_didChangePreference_toValue___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(queue, block);
}

void __59__SUManagerClient_preferences_didChangePreference_toValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      [v6 automaticUpdateV2EnabledDidChange:*(void *)(a1 + 32)];
    }
  }
}

- (void)_invalidateAllInstallationConstraintObserversForDownload
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = [(NSMutableSet *)self->_installationConstraintObservers allObjects];
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = *MEMORY[0x263F08338];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = v7;
        id v19 = @"Download changed";
        uint64_t v11 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        uint64_t v12 = [v10 errorWithDomain:@"com.apple.softwareupdateservices.errors" code:56 userInfo:v11];
        [(SUManagerClient *)self _invalidateConstraintObserver:v9 withError:v12];

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)_invalidateConstraintObserver:(id)a3 withError:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  uint64_t v7 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v7);

  if (v8) {
    [v6 invalidateWithError:v8];
  }
  else {
    [v6 invalidate];
  }
  [(NSMutableSet *)self->_installationConstraintObservers removeObject:v6];
}

- (id)_bundleIdentifier
{
  if (_bundleIdentifier_pred != -1) {
    dispatch_once(&_bundleIdentifier_pred, &__block_literal_global_14);
  }
  uint64_t v2 = (void *)_bundleIdentifier___identifier;

  return v2;
}

void __36__SUManagerClient__bundleIdentifier__block_invoke()
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v0 = [v2 bundleIdentifier];
  v1 = (void *)_bundleIdentifier___identifier;
  _bundleIdentifier___identifier = v0;
}

- (id)_remoteInterface
{
  id v2 = self;
  objc_sync_enter(v2);
  [(SUManagerClient *)v2 connectToServerIfNecessary];
  uint64_t v3 = [(NSXPCConnection *)v2->_serverConnection remoteObjectProxy];
  objc_sync_exit(v2);

  return v3;
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  return [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:a3 connectIfNecessary:1];
}

- (id)_remoteSynchronousInterfaceWithErrorHandler:(id)a3 connectIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (v4) {
    [(SUManagerClient *)v7 connectToServerIfNecessary];
  }
  id v8 = [(NSXPCConnection *)v7->_serverConnection synchronousRemoteObjectProxyWithErrorHandler:v6];
  objc_sync_exit(v7);

  return v8;
}

void __45__SUManagerClient_connectToServerIfNecessary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v19 = objc_loadWeakRetained(v9);
    uint64_t v18 = [v19 queue];
    dispatch_assert_queue_V2(v18);

    [v19 noteConnectionDropped];
  }
  else
  {
    SULogDebug(@"weakSelf is gone...", v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

uint64_t __45__SUManagerClient_connectToServerIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  SULogDebug(@"Client <%p>: softwareupdateservicesd exit detected.", v3, v4, v5, v6, v7, v8, v9, (uint64_t)WeakRetained);

  id v10 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v10();
}

- (void)noteConnectionDropped
{
  SULogDebug(@"Client <%p>: disconnected from softwareupdateservicesd.", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self);
  if (self->_installing)
  {
    installDescriptor = self->_installDescriptor;
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:37 userInfo:0];
    [(SUManagerClient *)self installDidFail:installDescriptor withError:v10];
  }
  id obj = self;
  objc_sync_enter(obj);
  obj->_connected = 0;
  objc_sync_exit(obj);
}

- (void)noteServerExiting
{
  self->_serverIsExiting = 1;
}

- (void)scanRequestDidStartForOptions:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v4);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 client:self scanRequestDidStartForOptions:v10];
    }
  }
}

- (void)scanRequestDidFinishForOptions:(id)a3 results:(id)a4 error:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v10);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained;
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 client:self scanRequestDidFinishForOptions:v16 results:v8 error:v9];
    }
  }
}

- (void)scanDidCompleteForOptions:(id)a3 results:(id)a4 error:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v10);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained;
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 client:self scanRequestDidFinishForOptions:v16 results:v8 error:v9];
    }
  }
}

- (void)scanRequestDidFinishForOptions:(id)a3 update:(id)a4 error:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v10);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained;
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 client:self scanRequestDidFinishForOptions:v16 update:v8 error:v9];
    }
  }
}

- (void)scanDidCompleteWithNewUpdateAvailable:(id)a3 error:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v7);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 client:self scanDidCompleteWithNewUpdateAvailable:v13 error:v6];
    }
  }
}

- (void)automaticDownloadDidFailToStartForNewUpdateAvailable:(id)a3 withError:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v7);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 client:self automaticDownloadDidFailToStartForNewUpdateAvailable:v13 withError:v6];
    }
  }
}

- (void)downloadDidStart:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v4);

  [(SUManagerClient *)self _invalidateAllInstallationConstraintObserversForDownload];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 client:self downloadDidStart:v10];
    }
  }
}

- (void)downloadProgressDidChange:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v4);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 client:self downloadProgressDidChange:v10];
    }
  }
}

- (void)downloadDidFail:(id)a3 withError:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v7);

  [(SUManagerClient *)self _invalidateAllInstallationConstraintObserversForDownload];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 client:self downloadDidFail:v13 withError:v6];
    }
  }
}

- (void)downloadDidFinish:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v4);

  [(SUManagerClient *)self _invalidateAllInstallationConstraintObserversForDownload];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 client:self downloadDidFinish:v10];
    }
  }
}

- (void)downloadDidFinish:(id)a3 withInstallPolicy:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v7);

  [(SUManagerClient *)self _invalidateAllInstallationConstraintObserversForDownload];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    id v12 = v11;
    if (v10)
    {
      [v11 client:self downloadDidFinish:v14 withInstallPolicy:v6];
    }
    else
    {
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0) {
        goto LABEL_7;
      }
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 client:self downloadDidFinish:v14];
    }
  }
LABEL_7:
}

- (void)downloadWasInvalidatedForNewUpdatesAvailable:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v4);

  [(SUManagerClient *)self _invalidateAllInstallationConstraintObserversForDownload];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 client:self downloadWasInvalidatedForNewUpdatesAvailable:v15];
LABEL_7:

      goto LABEL_8;
    }
  }
  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v10)
  {
    id v11 = v10;
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      id v14 = [v15 preferredDescriptor];
      [v9 client:self downloadWasInvalidatedForNewUpdateAvailable:v14];

      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)downloadWasInvalidatedForNewUpdateAvailable:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v4);

  [(SUManagerClient *)self _invalidateAllInstallationConstraintObserversForDownload];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 client:self downloadWasInvalidatedForNewUpdateAvailable:v10];
    }
  }
}

- (void)clearingSpaceForDownload:(id)a3 clearing:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  id v6 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v6);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    char v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 client:self clearingSpaceForDownload:v12 clearingSpace:v4];
    }
  }
}

- (void)userWantsToDeferInstall
{
  uint64_t v3 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v3);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 userWantsToDeferInstall:self];
    }
  }
}

- (void)installWantsToStart:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  char v7 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v7);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 client:self installWantsToStart:v13 completion:v6];
    }
  }
}

- (void)installDidStart:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v4);

  self->_installing = 1;
  [(SUManagerClient *)self setInstallDescriptor:v10];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 client:self installDidStart:v10];
    }
  }
}

- (void)installDidFail:(id)a3 withError:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v7);

  self->_installing = 0;
  [(SUManagerClient *)self setInstallDescriptor:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 client:self installDidFail:v13 withError:v6];
    }
  }
}

- (void)installDidFinish:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v4);

  self->_installing = 0;
  [(SUManagerClient *)self setInstallDescriptor:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 client:self installDidFinish:v10];
    }
  }
}

- (void)installPolicyDidChange:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v4);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 client:self installPolicyDidChange:v10];
    }
  }
}

- (void)deviceBootedAfterSplatUpdate
{
  uint64_t v3 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v3);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 deviceBootedAfterSplatOnlyUpdate:self];
    }
  }
}

- (void)managedInstallationRequested:(id)a3
{
  id v17 = a3;
  BOOL v4 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v13 = WeakRetained;
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 client:self managedInstallationRequested:v17];
    }
  }
}

- (void)handleUIForDDMDeclaration:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 client:self handleUIForDDMDeclaration:v9];
    }
  }
}

- (void)handleUIForDDMGlobalSettings:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 client:self handleUIForDDMGlobalSettings:v9];
    }
  }
}

- (void)rollbackReadyToStart:(id)a3 options:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v11 = WeakRetained;
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 client:self rollbackReadyToStart:v15 options:v8 completion:v9];
    }
  }
}

- (void)rollbackDidStart:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 client:self rollbackDidStart:v9];
    }
  }
}

- (void)rollbackDidFail:(id)a3 withError:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 client:self rollbackDidFail:v12 withError:v6];
    }
  }
}

- (void)rollbackDidFinish:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 client:self rollbackDidFinish:v9];
    }
  }
}

- (void)rollbackReadyForReboot:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 client:self scheduledRollbackReadyForReboot:v9];
    }
  }
}

- (void)deviceBootedAfterRollback:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v4);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 deviceBootedAfterSplatOnlyRollback:self rollbackDescriptor:v10];
    }
  }
}

- (void)rollbackSuggested:(id)a3 info:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  SULogInfo(@"rollbackSuggested with info: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v15 = WeakRetained;
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      [v18 client:self rollbackSuggested:v19 info:v6];
    }
  }
}

- (void)installTonightScheduled:(BOOL)a3 operationID:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 client:self installTonightScheduled:v4 operationID:v11];
    }
  }
}

- (void)autoInstallOperationWasCancelled:(id)a3
{
  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  uint64_t v5 = [a3 UUIDString];
  id v6 = [(NSMutableDictionary *)installOperationIDsToOperationHandler objectForKey:v5];

  if (v6)
  {
    [v6 _noteAutoInstallOperationWasCancelled];
    [(SUManagerClient *)self _unregisterAutoInstallOperationClientHandler:v6];
  }
}

- (void)autoInstallOperationDidExpire:(id)a3 withError:(id)a4
{
  id v9 = a4;
  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  uint64_t v7 = [a3 UUIDString];
  id v8 = [(NSMutableDictionary *)installOperationIDsToOperationHandler objectForKey:v7];

  if (v8)
  {
    [v8 _noteAutoInstallOperationDidExpireWithError:v9];
    [(SUManagerClient *)self _unregisterAutoInstallOperationClientHandler:v8];
  }
}

- (void)autoInstallOperationDidConsent:(id)a3
{
  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  BOOL v4 = [a3 UUIDString];
  id v6 = [(NSMutableDictionary *)installOperationIDsToOperationHandler objectForKey:v4];

  uint64_t v5 = v6;
  if (v6)
  {
    [v6 _noteAutoInstallOperationDidConsent];
    uint64_t v5 = v6;
  }
}

- (void)autoInstallOperationIsReadyToInstall:(id)a3 withResult:(id)a4
{
  id v9 = a4;
  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  uint64_t v7 = [a3 UUIDString];
  id v8 = [(NSMutableDictionary *)installOperationIDsToOperationHandler objectForKey:v7];

  if (v8) {
    [v8 _noteAutoInstallOperationIsReadyToInstall:v9];
  }
}

- (void)autoInstallOperationPasscodePolicyChanged:(id)a3 passcodePolicyType:(unint64_t)a4
{
  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  id v6 = [a3 UUIDString];
  id v8 = [(NSMutableDictionary *)installOperationIDsToOperationHandler objectForKey:v6];

  uint64_t v7 = v8;
  if (v8)
  {
    [v8 _noteAutoInstallOperationPasscodePolicyChanged:a4];
    uint64_t v7 = v8;
  }
}

- (void)presentingRecommendedUpdate:(id)a3 shouldPresent:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 client:self presentingRecommendedUpdate:v11 shouldPresent:v4];
    }
  }
}

- (void)inUserInteraction:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(SUManagerClient *)self queue];
  dispatch_assert_queue_V2(v4);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 client:self inUserInteraction:v10];
    }
  }
}

- (void)resetState
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __29__SUManagerClient_resetState__block_invoke;
  v3[3] = &unk_26447D9F8;
  v3[4] = self;
  uint64_t v2 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v3 connectIfNecessary:1];
  [v2 resetState];
}

void __29__SUManagerClient_resetState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient resetState]_block_invoke");
    id v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

- (id)rvGetCurrentNeRDInfo
{
  id v3 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__15;
  id v20 = __Block_byref_object_dispose__15;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__SUManagerClient_rvGetCurrentNeRDInfo__block_invoke;
  v15[3] = &unk_26447D9F8;
  void v15[4] = self;
  id v11 = [(SUManagerClient *)self _remoteSynchronousInterfaceWithErrorHandler:v15 connectIfNecessary:1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__SUManagerClient_rvGetCurrentNeRDInfo__block_invoke_2;
  v14[3] = &unk_26447E750;
  void v14[4] = &v16;
  [v11 rvGetCurrentNeRDInfoWithReply:v14];

  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __39__SUManagerClient_rvGetCurrentNeRDInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v13 = v3;
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient rvGetCurrentNeRDInfo]_block_invoke");
    id v11 = [v13 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v13 code] == 4097)
      {
      }
      else
      {
        uint64_t v12 = [v13 code];

        id v3 = v13;
        if (v12 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    id v3 = v13;
  }
LABEL_9:
}

void __39__SUManagerClient_rvGetCurrentNeRDInfo__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  if (a3) {
    SULogError(@"Error while calling rvGetCurrentNeRDInfo: %@", v6, v7, v8, v9, v10, v11, v12, a3);
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (void)rvTriggerNeRDUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUManagerClient *)self _bundleIdentifier];
  SULogInfo(@"Client \"%@\" called %s", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__SUManagerClient_rvTriggerNeRDUpdate___block_invoke;
  v14[3] = &unk_26447D9F8;
  void v14[4] = self;
  id v13 = [(SUManagerClient *)self _remoteInterfaceWithErrorHandler:v14];
  [v13 rvTriggerNeRDUpdate:v4];
}

void __39__SUManagerClient_rvTriggerNeRDUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v11 = v14;
  if (v14)
  {
    SULogDebug(@"%s failed - connection interrupted: %@ error: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient rvTriggerNeRDUpdate:]_block_invoke");
    uint64_t v12 = [v14 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v14 code] == 4097)
      {
      }
      else
      {
        uint64_t v13 = [v14 code];

        uint64_t v11 = v14;
        if (v13 != 4099) {
          goto LABEL_9;
        }
      }
      [*(id *)(a1 + 32) _invalidateConnection];
    }
    else
    {
    }
    uint64_t v11 = v14;
  }
LABEL_9:
}

- (SUManagerClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUManagerClientDelegate *)WeakRetained;
}

- (int)clientType
{
  return self->_clientType;
}

- (SUDescriptor)installDescriptor
{
  return self->_installDescriptor;
}

- (void)setInstallDescriptor:(id)a3
{
}

- (SUDescriptor)scanDescriptor
{
  return self->_scanDescriptor;
}

- (void)setScanDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_installationConstraintObservers, 0);
  objc_storeStrong((id *)&self->_installOperationIDsToOperationHandler, 0);
  objc_storeStrong((id *)&self->_scanDescriptor, 0);
  objc_storeStrong((id *)&self->_installDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_serverConnection, 0);
}

@end