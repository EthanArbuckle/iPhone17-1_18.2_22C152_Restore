@interface WLWelcomeController
- (BOOL)useMigrationKit;
- (BOOL)useMigrationKitInAP;
- (WLImportViewController)importViewController;
- (WLMigrationKitController)migrationKitController;
- (WLTransferringViewController)transferringViewController;
- (WLUIClient)client;
- (WLWelcomeController)initWithWelcomeViewController:(id)a3 forceUITestMode:(BOOL)a4 forceUITestModeDownloadError:(BOOL)a5;
- (id)completionHandler;
- (id)resetHandler;
- (void)_completeWithSuccess:(BOOL)a3;
- (void)_configureWelcomeViewController:(id)a3;
- (void)_didCompleteMigrationWithSuccess:(BOOL)a3 retry:(BOOL)a4 context:(id)a5;
- (void)_didPairWithSourceDevice:(id)a3;
- (void)_importLocalContent;
- (void)_pushViewController:(id)a3 andRemovePreviousTopmostViewControllerWithCompletion:(id)a4;
- (void)_setStashDataLocally:(BOOL)a3;
- (void)_showCompleted:(id)a3;
- (void)_showPairingCode:(id)a3 wifiPSK:(id)a4 ssid:(id)a5;
- (void)_showPreparation:(id)a3;
- (void)_showRetry;
- (void)_showTransferring;
- (void)_showWaitingForDataTypeSelection;
- (void)_sourceDevicePairingPeriodDidEnd;
- (void)_startMigration;
- (void)_startPairing;
- (void)_updateTransferringForImport;
- (void)authenticate;
- (void)cancel;
- (void)change:(int64_t)a3 context:(id)a4;
- (void)complete:(id)a3;
- (void)controllerDidGetInterrupted;
- (void)daemon:(id)a3 didChangeState:(int64_t)a4 withContext:(id)a5;
- (void)daemon:(id)a3 didCreateCode:(id)a4;
- (void)daemon:(id)a3 didImportWithContext:(id)a4;
- (void)daemon:(id)a3 didReceiveClient:(id)a4 brand:(id)a5 model:(id)a6 name:(id)a7;
- (void)daemon:(id)a3 didUpdateProgress:(float)a4 remainingTime:(unint64_t)a5 completedOperationCount:(unint64_t)a6 totalOperationCount:(unint64_t)a7;
- (void)daemonDidAuthenticateClient:(id)a3;
- (void)daemonDidGetInterrupted;
- (void)daemonDidRejectClient:(id)a3;
- (void)daemonWillImport:(id)a3;
- (void)dataMigrator:(id)a3 didFailWithError:(id)a4;
- (void)dataMigrator:(id)a3 didUpdateMigrationState:(unint64_t)a4;
- (void)dataMigrator:(id)a3 didUpdateProgressPercentage:(float)a4;
- (void)dataMigrator:(id)a3 didUpdateRemainingDownloadTime:(double)a4;
- (void)dataMigratorDidBecomeRestartable:(id)a3;
- (void)dataMigratorDidFinish:(id)a3 withImportErrors:(BOOL)a4 context:(id)a5;
- (void)dataMigratorDidGetInterrupted;
- (void)dealloc;
- (void)deleteMessages;
- (void)didDiscoverCandidate:(id)a3;
- (void)didStartWiFiAndDeviceDiscoveryWithCode:(id)a3 ssid:(id)a4 passphrase:(id)a5 started:(BOOL)a6;
- (void)downloadTips;
- (void)downloadTipsInBackground;
- (void)import;
- (void)lookupAppDataContainer:(id)a3;
- (void)popViewController;
- (void)reject;
- (void)reset;
- (void)retry;
- (void)run;
- (void)setClient:(id)a3;
- (void)setClient:(id)a3 brand:(id)a4 model:(id)a5 name:(id)a6;
- (void)setCompletionHandler:(id)a3;
- (void)setImportViewController:(id)a3;
- (void)setMigrationKitController:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setResetHandler:(id)a3;
- (void)setTransferringViewController:(id)a3;
- (void)setUseMigrationKit:(BOOL)a3;
- (void)setUseMigrationKitInAP:(BOOL)a3;
- (void)showCancellation:(id)a3;
- (void)showCancellationAlert:(id)a3;
- (void)showFailure:(id)a3;
- (void)showImport;
- (void)showReject;
- (void)sourceDeviceController:(id)a3 didDiscoverCandidate:(id)a4;
- (void)sourceDeviceController:(id)a3 didDiscoverDevice:(id)a4;
- (void)stop;
- (void)stopAP;
- (void)testAMSPurchase;
- (void)updateProgress:(float)a3 remainingTime:(unint64_t)a4 completedOperationCount:(unint64_t)a5 totalOperationCount:(unint64_t)a6;
- (void)wifiAndDeviceDiscoveryDidGetInterrupted;
@end

@implementation WLWelcomeController

- (WLWelcomeController)initWithWelcomeViewController:(id)a3 forceUITestMode:(BOOL)a4 forceUITestModeDownloadError:(BOOL)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WLWelcomeController;
  v9 = [(WLWelcomeController *)&v16 init];
  if (v9)
  {
    BOOL v10 = a4 || [MEMORY[0x263F862C0] BOOLForKey:@"UITest"] == 1;
    v9->_uiTestMode = v10;
    BOOL v11 = a5 || [MEMORY[0x263F862C0] BOOLForKey:@"ForceDownloadError"] == 1;
    v9->_forceUITestModeDownloadError = v11;
    v9->_migrateUsingRetryPolicies = 0;
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create_with_target_V2("com.apple.welcomekitui.migrationControllerDelegateSerialQueue", v12, MEMORY[0x263EF83A0]);
    migrationControllerDelegateQueueTargetedAtMainQueue = v9->_migrationControllerDelegateQueueTargetedAtMainQueue;
    v9->_migrationControllerDelegateQueueTargetedAtMainQueue = (OS_dispatch_queue *)v13;

    [(WLWelcomeController *)v9 _configureWelcomeViewController:v8];
    [(WLWelcomeController *)v9 run];
    [(WLWelcomeController *)v9 downloadTips];
  }

  return v9;
}

- (void)dealloc
{
  _WLLog();
  v4.receiver = self;
  v4.super_class = (Class)WLWelcomeController;
  [(WLWelcomeController *)&v4 dealloc];
}

- (void)_configureWelcomeViewController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__WLWelcomeController__configureWelcomeViewController___block_invoke;
  v5[3] = &unk_2648707E0;
  objc_copyWeak(&v6, &location);
  [v4 setContinueHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__WLWelcomeController__configureWelcomeViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    __55__WLWelcomeController__configureWelcomeViewController___block_invoke_cold_1();
  }
  id v2 = WeakRetained;
  [WeakRetained _startPairing];
}

- (void)_startPairing
{
}

void __36__WLWelcomeController__startPairing__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = NSNumber;
  id v16 = a7;
  v20 = [v15 numberWithBool:a2];
  _WLLog();

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__WLWelcomeController__startPairing__block_invoke_2;
  block[3] = &unk_264870808;
  objc_copyWeak(&v25, (id *)(a1 + 40));
  id v22 = v14;
  id v23 = v12;
  id v24 = v13;
  char v26 = a2;
  id v17 = v13;
  id v18 = v12;
  id v19 = v14;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v25);
}

void __36__WLWelcomeController__startPairing__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained didStartWiFiAndDeviceDiscoveryWithCode:*(void *)(a1 + 32) ssid:*(void *)(a1 + 40) passphrase:*(void *)(a1 + 48) started:*(unsigned __int8 *)(a1 + 64)];
}

- (void)didStartWiFiAndDeviceDiscoveryWithCode:(id)a3 ssid:(id)a4 passphrase:(id)a5 started:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(BFFNavigationController *)self->_navigationController view];
  id v13 = [v12 window];
  [v13 setUserInteractionEnabled:1];

  if (v6) {
    [(WLWelcomeController *)self _showPairingCode:v14 wifiPSK:v11 ssid:v10];
  }
  else {
    [(WLWelcomeController *)self showFailure:0];
  }
}

- (void)sourceDeviceController:(id)a3 didDiscoverCandidate:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__WLWelcomeController_sourceDeviceController_didDiscoverCandidate___block_invoke;
    block[3] = &unk_264870930;
    objc_copyWeak(&v8, &location);
    id v7 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __67__WLWelcomeController_sourceDeviceController_didDiscoverCandidate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didDiscoverCandidate:*(void *)(a1 + 32)];
}

- (void)didDiscoverCandidate:(id)a3
{
  id v5 = a3;
  self->_dismissAfterSourceDevicePairingTimeout = 0;
  id v7 = v5;
  if ([v5 useMigrationKit])
  {
    _WLLog();
    -[WLWelcomeController setUseMigrationKitInAP:](self, "setUseMigrationKitInAP:", 1, self);
  }
  else
  {
    objc_storeStrong((id *)&self->_sourceDevice, a3);
    BOOL v6 = [[WLWaitingForDataTypeSelectionViewController alloc] initWithWelcomeController:self];
    [(WLWelcomeController *)self _pushViewController:v6 andRemovePreviousTopmostViewControllerWithCompletion:0];
  }
}

- (void)sourceDeviceController:(id)a3 didDiscoverDevice:(id)a4
{
  id v5 = a4;
  _WLLog();
  if (v5)
  {
    if (objc_msgSend(v5, "useMigrationKit", self, v5))
    {
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke;
      block[3] = &unk_2648707E0;
      objc_copyWeak(&v11, &location);
      dispatch_async(MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      _WLLog();
      sourceDevicesController = self->_sourceDevicesController;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke_2;
      v9[3] = &unk_264870958;
      v9[4] = self;
      -[WLSourceDevicesController stopDeviceDiscoveryWithCompletion:](sourceDevicesController, "stopDeviceDiscoveryWithCompletion:", v9, self);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke_3;
      v7[3] = &unk_264870980;
      v7[4] = self;
      id v8 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v7);
    }
  }
}

void __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog();
  objc_msgSend(WeakRetained, "setUseMigrationKitInAP:", 1, WeakRetained);
}

void __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  BOOL v6 = [v4 numberWithBool:a2];
  _WLLog();
}

uint64_t __64__WLWelcomeController_sourceDeviceController_didDiscoverDevice___block_invoke_3(uint64_t a1)
{
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 32)];
  _WLLog();

  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _didPairWithSourceDevice:v3];
}

- (void)wifiAndDeviceDiscoveryDidGetInterrupted
{
  _WLLog();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__WLWelcomeController_wifiAndDeviceDiscoveryDidGetInterrupted__block_invoke;
  block[3] = &unk_2648709A8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __62__WLWelcomeController_wifiAndDeviceDiscoveryDidGetInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeWithSuccess:0];
}

- (void)_showPairingCode:(id)a3 wifiPSK:(id)a4 ssid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  self->_isPairingCanceled = 0;
  id v11 = [[WLPairingCodeViewController alloc] initWithPairingCode:v8 wifiPSK:v9 ssid:v10 welcomeController:self];
  [(WLPairingCodeViewController *)v11 setGetLocalImportOptionsHandler:&__block_literal_global];
  objc_initWeak(location, self);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_3;
  v27[3] = &unk_264870A18;
  objc_copyWeak(&v28, location);
  [(WLPairingCodeViewController *)v11 setStashDataLocallyHandler:v27];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_4;
  v25[3] = &unk_2648707E0;
  objc_copyWeak(&v26, location);
  [(WLPairingCodeViewController *)v11 setImportLocalContentHandler:v25];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_5;
  v23[3] = &unk_2648707E0;
  objc_copyWeak(&v24, location);
  [(WLPairingCodeViewController *)v11 setViewWillDisappearBlock:v23];
  v15 = v9;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_7;
  v21[3] = &unk_264870A40;
  objc_copyWeak(&v22, location);
  [(WLPairingCodeViewController *)v11 setCancellationBlock:v21];
  id v12 = v10;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_8;
  v19[3] = &unk_2648707E0;
  objc_copyWeak(&v20, location);
  [(WLPairingCodeViewController *)v11 setViewWillDismissBlock:v19];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_9;
  v18[3] = &unk_2648709A8;
  v18[4] = self;
  [(WLWelcomeController *)self _pushViewController:v11 andRemovePreviousTopmostViewControllerWithCompletion:v18];
  id v14 = [NSNumber numberWithBool:self->_dismissAfterSourceDevicePairingTimeout];
  _WLLog();

  self->_dismissAfterSourceDevicePairingTimeout = 1;
  dispatch_time_t v13 = dispatch_time(0, 600000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_10;
  block[3] = &unk_2648707E0;
  objc_copyWeak(&v17, location);
  dispatch_after(v13, MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(location);
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x263F86280] sharedInstance];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_2;
  v5[3] = &unk_2648709F0;
  id v6 = v2;
  id v4 = v2;
  [v3 getLocalImportOptionsWithCompletion:v5];
}

uint64_t __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_3_cold_1();
  }
  id v4 = WeakRetained;
  [WeakRetained _setStashDataLocally:a2];
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_4_cold_1();
  }
  id v2 = WeakRetained;
  [WeakRetained _importLocalContent];
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_5_cold_1();
  }
  id v2 = WeakRetained;
  if (([WeakRetained useMigrationKitInAP] & 1) == 0)
  {
    id v4 = [NSNumber numberWithBool:v2[32]];
    _WLLog();

    if (v2[32])
    {
      v2[32] = 0;
      _WLLog();
      uint64_t v3 = (void *)*((void *)v2 + 3);
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_6;
      v5[3] = &unk_264870958;
      void v5[4] = v2;
      objc_msgSend(v3, "stopWiFiAndDeviceDiscoveryWithCompletion:", v5, v2, v4);
    }
  }
}

uint64_t __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_6()
{
  return _WLLog();
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained showCancellationAlert:v3];
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_8_cold_1();
  }
  _WLLog();
  WeakRetained[82] = 1;
  if ((objc_msgSend(WeakRetained, "useMigrationKit", WeakRetained) & 1) == 0
    && ([WeakRetained useMigrationKitInAP] & 1) == 0)
  {
    [WeakRetained cancel];
  }
}

uint64_t __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_9(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_9_cold_1();
    }
    id v2 = *(void **)(*(void *)(v1 + 32) + 24);
    return [v2 scheduleSurrogateDeviceDiscovery];
  }
  return result;
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog();
  objc_msgSend(WeakRetained, "_sourceDevicePairingPeriodDidEnd", WeakRetained);
}

- (void)_sourceDevicePairingPeriodDidEnd
{
  id v4 = [NSNumber numberWithBool:self->_dismissAfterSourceDevicePairingTimeout];
  _WLLog();

  if (self->_dismissAfterSourceDevicePairingTimeout)
  {
    id v3 = objc_msgSend(MEMORY[0x263F862E0], "sharedInstance", self, v4);
    [v3 deviceDidFailWithTimeout];

    [(WLWelcomeController *)self _completeWithSuccess:0];
  }
}

- (void)_setStashDataLocally:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithBool:");
  _WLLog();

  objc_msgSend(MEMORY[0x263F86280], "sharedInstance", self, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setStashDataLocally:v3];
}

- (void)_importLocalContent
{
  _WLLog();
  sourceDevicesController = self->_sourceDevicesController;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__WLWelcomeController__importLocalContent__block_invoke;
  v5[3] = &unk_264870958;
  void v5[4] = self;
  -[WLSourceDevicesController stopWiFiAndDeviceDiscoveryWithCompletion:](sourceDevicesController, "stopWiFiAndDeviceDiscoveryWithCompletion:", v5, self);
}

void __42__WLWelcomeController__importLocalContent__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithBool:a2];
  _WLLog();

  objc_msgSend(MEMORY[0x263F86280], "sharedInstance", v4, v7, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 importLocalContent];
}

- (void)_didPairWithSourceDevice:(id)a3
{
  id v5 = a3;
  if (!self->_isPairingCanceled)
  {
    objc_storeStrong((id *)&self->_sourceDevice, a3);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__WLWelcomeController__didPairWithSourceDevice___block_invoke;
    v6[3] = &unk_2648707E0;
    objc_copyWeak(&v7, &location);
    [(WLWelcomeController *)self _showPreparation:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __48__WLWelcomeController__didPairWithSourceDevice___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startMigration];
}

- (void)_showPreparation:(id)a3
{
  id v4 = a3;
  if (!self->_isPairingCanceled)
  {
    id v5 = [[WLPreparationViewController alloc] initWithWelcomeController:self];
    id v6 = v5;
    if (self->_useMigrationKit || self->_useMigrationKitInAP)
    {
      [(WLPreparationViewController *)v5 setShowCancelButton:1];
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __40__WLWelcomeController__showPreparation___block_invoke;
      v9[3] = &unk_264870A40;
      objc_copyWeak(&v10, &location);
      [(WLPreparationViewController *)v6 setCancellationBlock:v9];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __40__WLWelcomeController__showPreparation___block_invoke_2;
      v7[3] = &unk_2648707E0;
      objc_copyWeak(&v8, &location);
      [(WLPreparationViewController *)v6 setViewWillDismissBlock:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    [(WLWelcomeController *)self _pushViewController:v6 andRemovePreviousTopmostViewControllerWithCompletion:v4];
  }
}

void __40__WLWelcomeController__showPreparation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained showCancellationAlert:v3];
}

void __40__WLWelcomeController__showPreparation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog();
  objc_msgSend(WeakRetained, "cancel", WeakRetained);
}

- (void)_startMigration
{
  +[WLRecord startRecording];
  self->_migrationState = 0;
  *(_WORD *)&self->_migrationControllerIsRestartable = 0;
  if (self->_uiTestMode) {
    id v3 = (WLDataMigrationController *)[objc_alloc(MEMORY[0x263F86290]) initWithDelegate:self forceDownloadError:self->_forceUITestModeDownloadError];
  }
  else {
    id v3 = (WLDataMigrationController *)[objc_alloc(MEMORY[0x263F86288]) initWithDelegate:self];
  }
  migrationController = self->_migrationController;
  self->_migrationController = v3;

  id v5 = self->_migrationController;
  BOOL migrateUsingRetryPolicies = self->_migrateUsingRetryPolicies;
  [(WLDataMigrationController *)v5 startMigrationUsingRetryPolicies:migrateUsingRetryPolicies];
}

- (void)dataMigratorDidGetInterrupted
{
  _WLLog();
  objc_initWeak(&location, self);
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__WLWelcomeController_dataMigratorDidGetInterrupted__block_invoke;
  block[3] = &unk_2648707E0;
  objc_copyWeak(&v5, &location);
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__WLWelcomeController_dataMigratorDidGetInterrupted__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained controllerDidGetInterrupted];
}

- (void)controllerDidGetInterrupted
{
  if (self->_migrationState && !self->_useMigrationKit)
  {
    if (!self->_migrationConcluded)
    {
      if (self->_migrationControllerIsRestartable)
      {
        self->_migrationControllerIsRestartable = 0;
        [(WLDataMigrationController *)self->_migrationController startMigrationUsingRetryPolicies:self->_migrateUsingRetryPolicies];
      }
      else
      {
        [(WLWelcomeController *)self dataMigrator:0 didFailWithError:0];
      }
    }
  }
  else
  {
    [(WLWelcomeController *)self daemonDidGetInterrupted];
  }
}

- (void)dataMigratorDidBecomeRestartable:(id)a3
{
  _WLLog();
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WLWelcomeController_dataMigratorDidBecomeRestartable___block_invoke;
  block[3] = &unk_2648709A8;
  void block[4] = self;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
}

uint64_t __56__WLWelcomeController_dataMigratorDidBecomeRestartable___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 80) = 1;
  return result;
}

- (void)dataMigratorDidFinish:(id)a3 withImportErrors:(BOOL)a4 context:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = NSNumber;
  id v10 = a3;
  v15 = [v9 numberWithBool:v5];
  _WLLog();

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke;
  v19[3] = &unk_264870980;
  void v19[4] = self;
  id v20 = v8;
  id v11 = v8;
  id v12 = (void *)MEMORY[0x22A6C7CF0](v19);
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_3;
  block[3] = &unk_264870A90;
  BOOL v18 = v5;
  void block[4] = self;
  id v17 = v12;
  id v14 = v12;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
}

void __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 250000000);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_2;
  v4[3] = &unk_264870980;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x263EF83A0], v4);
}

uint64_t __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCompleteMigrationWithSuccess:1 retry:0 context:*(void *)(a1 + 40)];
}

void __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 81) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
  if (*(unsigned char *)(a1 + 48) && [MEMORY[0x263F862A0] isInternal])
  {
    dispatch_time_t v2 = [MEMORY[0x263F82418] alertControllerWithTitle:@"Incomplete Import", @"(Internal Message Only) Migration succeeded, but some data did not import. Write a bug and attach a sysdiagnose as well as everything in:\n/var/mobile/Library/WelcomeKit/ and /var/mobile/Library/MigrationKit", 1 message preferredStyle];
    id v3 = (void *)MEMORY[0x263F82400];
    id v4 = WLLocalizedString();
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_4;
    v8[3] = &unk_264870A68;
    id v9 = *(id *)(a1 + 40);
    id v5 = [v3 actionWithTitle:v4 style:0 handler:v8];
    [v2 addAction:v5];

    id v6 = [*(id *)(*(void *)(a1 + 32) + 16) topViewController];
    [v6 presentViewController:v2 animated:1 completion:0];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
}

uint64_t __70__WLWelcomeController_dataMigratorDidFinish_withImportErrors_context___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dataMigrator:(id)a3 didFailWithError:(id)a4
{
  id v7 = a4;
  _WLLog();
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__WLWelcomeController_dataMigrator_didFailWithError___block_invoke;
  block[3] = &unk_264870980;
  void block[4] = self;
  id v9 = v7;
  id v6 = v7;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
}

void __53__WLWelcomeController_dataMigrator_didFailWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 81) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
  dispatch_time_t v2 = [*(id *)(a1 + 40) domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x263F86308]];

  if (!v3) {
    goto LABEL_8;
  }
  id v4 = [*(id *)(a1 + 40) userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F86318]];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  int v6 = [v5 BOOLValue];

  if (!v6)
  {
LABEL_8:
    id v8 = (void *)MEMORY[0x263F82418];
    id v9 = WLLocalizedString();
    id v10 = WLLocalizedString();
    id v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

    id v12 = (void *)MEMORY[0x263F82400];
    dispatch_time_t v13 = WLLocalizedString();
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__WLWelcomeController_dataMigrator_didFailWithError___block_invoke_2;
    v16[3] = &unk_264870768;
    v16[4] = *(void *)(a1 + 32);
    id v14 = [v12 actionWithTitle:v13 style:0 handler:v16];
    [v11 addAction:v14];

    v15 = [*(id *)(*(void *)(a1 + 32) + 16) topViewController];
    [v15 presentViewController:v11 animated:1 completion:0];

    return;
  }
  id v7 = *(void **)(a1 + 32);
  [v7 _didCompleteMigrationWithSuccess:0 retry:1 context:0];
}

uint64_t __53__WLWelcomeController_dataMigrator_didFailWithError___block_invoke_2(uint64_t a1)
{
  _WLLog();
  dispatch_time_t v2 = *(void **)(a1 + 32);
  return [v2 _didCompleteMigrationWithSuccess:0 retry:0 context:0];
}

- (void)dataMigrator:(id)a3 didUpdateMigrationState:(unint64_t)a4
{
  int v6 = NSNumber;
  id v7 = a3;
  id v9 = [v6 numberWithUnsignedInteger:a4];
  _WLLog();

  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WLWelcomeController_dataMigrator_didUpdateMigrationState___block_invoke;
  block[3] = &unk_264870AB8;
  void block[4] = self;
  void block[5] = a4;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
}

uint64_t __60__WLWelcomeController_dataMigrator_didUpdateMigrationState___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) = *(void *)(result + 40);
  uint64_t v1 = *(void *)(result + 40);
  switch(v1)
  {
    case 4:
      return [*(id *)(result + 32) _updateTransferringForImport];
    case 3:
      return [*(id *)(result + 32) _showTransferring];
    case 2:
      return [*(id *)(result + 32) _showWaitingForDataTypeSelection];
  }
  return result;
}

- (void)dataMigrator:(id)a3 didUpdateProgressPercentage:(float)a4
{
  _WLLog();
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__WLWelcomeController_dataMigrator_didUpdateProgressPercentage___block_invoke;
  block[3] = &unk_264870AE0;
  void block[4] = self;
  float v8 = a4;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
}

void __64__WLWelcomeController_dataMigrator_didUpdateProgressPercentage___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) topViewController];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v2 setProgress:*(float *)(a1 + 40)];
    }
  }
}

- (void)dataMigrator:(id)a3 didUpdateRemainingDownloadTime:(double)a4
{
  _WLLog();
  migrationControllerDelegateQueueTargetedAtMainQueue = self->_migrationControllerDelegateQueueTargetedAtMainQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__WLWelcomeController_dataMigrator_didUpdateRemainingDownloadTime___block_invoke;
  block[3] = &unk_264870AB8;
  void block[4] = self;
  *(double *)&void block[5] = a4;
  dispatch_async(migrationControllerDelegateQueueTargetedAtMainQueue, block);
}

void __67__WLWelcomeController_dataMigrator_didUpdateRemainingDownloadTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) topViewController];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v2 setRemainingDownloadTime:*(double *)(a1 + 40)];
    }
  }
}

- (void)_didCompleteMigrationWithSuccess:(BOOL)a3 retry:(BOOL)a4 context:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v13 = a5;
  id v12 = [NSNumber numberWithBool:v6];
  _WLLog();

  +[WLRecord stopRecording];
  [(WLDataMigrationController *)self->_migrationController invalidateDaemonConnection];
  [(WLMigrationKitController *)self->_migrationKitController setInterruptionHandler:0];
  [(WLMigrationKitController *)self->_migrationKitController invalidateDaemonConnection];
  migrationController = self->_migrationController;
  self->_migrationController = 0;

  sourceDevice = self->_sourceDevice;
  self->_sourceDevice = 0;

  if (v6)
  {
    [(WLWelcomeController *)self _showCompleted:v13];
  }
  else if (v5)
  {
    switch(self->_migrationState)
    {
      case 6uLL:
        id v10 = self;
        id v11 = 0;
        goto LABEL_9;
      case 7uLL:
      case 8uLL:
        id v10 = self;
        id v11 = v13;
LABEL_9:
        [(WLWelcomeController *)v10 showCancellation:v11];
        break;
      case 9uLL:
        [(WLWelcomeController *)self showReject];
        break;
      case 0xAuLL:
        [(WLWelcomeController *)self showFailure:v13];
        break;
      default:
        [(WLWelcomeController *)self _showRetry];
        break;
    }
  }
  else
  {
    [(WLWelcomeController *)self _completeWithSuccess:0];
  }
}

- (void)_showWaitingForDataTypeSelection
{
  int v3 = self->_sourceDevice;
  client = self->_client;
  if (client)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F862C8]);

    BOOL v6 = [(WLUIClient *)self->_client name];
    [v5 setName:v6];

    int v3 = (WLSourceDevice *)v5;
  }
  id v7 = [[WLWaitingForDataTypeSelectionViewController alloc] initWithWelcomeController:self];
  [(WLWaitingForDataTypeSelectionViewController *)v7 setShowCancelButton:client != 0];
  if (client)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__WLWelcomeController__showWaitingForDataTypeSelection__block_invoke;
    v10[3] = &unk_264870A40;
    objc_copyWeak(&v11, &location);
    [(WLWaitingForDataTypeSelectionViewController *)v7 setCancellationBlock:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__WLWelcomeController__showWaitingForDataTypeSelection__block_invoke_2;
    v8[3] = &unk_2648707E0;
    objc_copyWeak(&v9, &location);
    [(WLWaitingForDataTypeSelectionViewController *)v7 setViewWillDismissBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  [(WLWelcomeController *)self _pushViewController:v7 andRemovePreviousTopmostViewControllerWithCompletion:0];
}

void __55__WLWelcomeController__showWaitingForDataTypeSelection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained showCancellationAlert:v3];
}

void __55__WLWelcomeController__showWaitingForDataTypeSelection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog();
  objc_msgSend(WeakRetained, "cancel", WeakRetained);
}

- (void)_showTransferring
{
  id v3 = self->_sourceDevice;
  client = self->_client;
  if (client)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F862C8]);

    BOOL v6 = [(WLUIClient *)self->_client name];
    [v5 setName:v6];

    id v3 = (WLSourceDevice *)v5;
  }
  id v7 = self;
  objc_sync_enter(v7);
  BOOL v8 = v7->_hasTips && v7->_useMigrationKit;
  objc_sync_exit(v7);

  id v9 = [[WLTransferringViewController alloc] initWithSourceDevice:v3 welcomeController:v7 showsTips:v8];
  [(WLTransferringViewController *)v9 setShowCancelButton:client != 0];
  if (client)
  {
    objc_initWeak(&location, v7);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__WLWelcomeController__showTransferring__block_invoke;
    v12[3] = &unk_264870A40;
    objc_copyWeak(&v13, &location);
    [(WLTransferringViewController *)v9 setCancellationBlock:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __40__WLWelcomeController__showTransferring__block_invoke_2;
    v10[3] = &unk_2648707E0;
    objc_copyWeak(&v11, &location);
    [(WLTransferringViewController *)v9 setViewWillDismissBlock:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  [(WLWelcomeController *)v7 setTransferringViewController:v9];
  [(WLWelcomeController *)v7 _pushViewController:v9 andRemovePreviousTopmostViewControllerWithCompletion:0];
}

void __40__WLWelcomeController__showTransferring__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained showCancellationAlert:v3];
}

void __40__WLWelcomeController__showTransferring__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog();
  objc_msgSend(WeakRetained, "cancel", WeakRetained);
}

- (void)_updateTransferringForImport
{
}

- (void)retry
{
  self->_BOOL migrateUsingRetryPolicies = 1;
  [(WLWelcomeController *)self _startPairing];
}

- (void)_showRetry
{
  id v3 = [[WLRetryViewController alloc] initWithWelcomeController:self];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__WLWelcomeController__showRetry__block_invoke;
  v6[3] = &unk_2648707E0;
  objc_copyWeak(&v7, &location);
  [(WLRetryViewController *)v3 setRetryBlock:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__WLWelcomeController__showRetry__block_invoke_2;
  v4[3] = &unk_2648707E0;
  objc_copyWeak(&v5, &location);
  [(WLWelcomeController *)self _pushViewController:v3 andRemovePreviousTopmostViewControllerWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __33__WLWelcomeController__showRetry__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained retry];
}

void __33__WLWelcomeController__showRetry__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained run];
}

- (void)_showCompleted:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importViewController);
  BOOL v6 = WeakRetained != 0;

  id v7 = [[WLCompletedViewController alloc] initWithWelcomeController:self context:v4 imported:v6];
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __38__WLWelcomeController__showCompleted___block_invoke;
  id v11 = &unk_2648707E0;
  objc_copyWeak(&v12, &location);
  [(WLCompletedViewController *)v7 setContinueHandler:&v8];
  -[WLWelcomeController _pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:](self, "_pushViewController:andRemovePreviousTopmostViewControllerWithCompletion:", v7, 0, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __38__WLWelcomeController__showCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    __38__WLWelcomeController__showCompleted___block_invoke_cold_1();
  }
  id v2 = WeakRetained;
  [WeakRetained _completeWithSuccess:1];
}

- (void)_completeWithSuccess:(BOOL)a3
{
  BOOL v6 = objc_msgSend(NSNumber, "numberWithBool:");
  _WLLog();

  if (!a3) {
    id v5 = (id)-[BFFNavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", 1, self, v6);
  }
  if (self->_completionHandler)
  {
    _WLLog();
    id v7 = objc_alloc_init(WLSettings);
    _WLLog();
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)setNavigationController:(id)a3
{
}

- (void)_pushViewController:(id)a3 andRemovePreviousTopmostViewControllerWithCompletion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_suspend((dispatch_object_t)self->_migrationControllerDelegateQueueTargetedAtMainQueue);
  uint64_t v8 = [(BFFNavigationController *)self->_navigationController topViewController];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v19 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_transferringViewController);
    [WeakRetained removeProgressBar];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = [(BFFNavigationController *)self->_navigationController viewControllers];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
LABEL_5:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v9, "addObject:", *(void *)(*((void *)&v23 + 1) + 8 * v15), v19);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v13) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    id v6 = v19;
  }
  else
  {
    [v9 addObject:v8];
  }
  navigationController = self->_navigationController;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __96__WLWelcomeController__pushViewController_andRemovePreviousTopmostViewControllerWithCompletion___block_invoke;
  v20[3] = &unk_264870B08;
  v20[4] = self;
  id v21 = v9;
  id v22 = v7;
  id v17 = v7;
  id v18 = v9;
  [(BFFNavigationController *)navigationController pushViewController:v6 completion:v20];
}

void __96__WLWelcomeController__pushViewController_andRemovePreviousTopmostViewControllerWithCompletion___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 16) viewControllers];
  id v4 = (id)[v2 mutableCopy];

  [v4 removeObjectsInArray:a1[5]];
  [*(id *)(a1[4] + 16) setViewControllers:v4];
  dispatch_resume(*(dispatch_object_t *)(a1[4] + 72));
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (void)deleteMessages
{
  id v2 = objc_alloc_init(MEMORY[0x263F86288]);
  [v2 deleteMessages];
}

- (void)lookupAppDataContainer:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F86288];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 lookupAppDataContainer:v4];
}

- (void)testAMSPurchase
{
  id v2 = objc_alloc_init(MEMORY[0x263F86288]);
  [v2 testAMSPurchase];
}

- (void)popViewController
{
  id v2 = (id)[(BFFNavigationController *)self->_navigationController popViewControllerAnimated:1];
}

- (void)run
{
  _WLLog();
  -[WLWelcomeController setUseMigrationKit:](self, "setUseMigrationKit:", 0, self);
  [(WLWelcomeController *)self setUseMigrationKitInAP:0];
  self->_dismissAfterSourceDevicePairingTimeout = 0;
  [(WLWelcomeController *)self setClient:0];
  sourceDevice = self->_sourceDevice;
  self->_sourceDevice = 0;

  [(WLMigrationKitController *)self->_migrationKitController cancel];
  migrationKitController = self->_migrationKitController;
  if (!migrationKitController)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F862B0]);
    [(WLWelcomeController *)self setMigrationKitController:v5];

    migrationKitController = self->_migrationKitController;
  }
  [(WLMigrationKitController *)migrationKitController run:self];
}

- (void)stop
{
  _WLLog();
  [(WLMigrationKitController *)self->_migrationKitController cancel];
  [(WLWelcomeController *)self setClient:0];
  [(WLWelcomeController *)self setUseMigrationKit:0];
}

- (void)cancel
{
  _WLLog();
  [(WLMigrationKitController *)self->_migrationKitController cancel];
  sourceDevicesController = self->_sourceDevicesController;
  [(WLSourceDevicesController *)sourceDevicesController stopWiFiAndDeviceDiscoveryWithCompletion:0];
}

- (void)showCancellationAlert:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = WLLocalizedString();
  id v6 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"ALERT_CANCELLATION_MESSAGE"];
  id v7 = WLLocalizedString();

  uint64_t v8 = [MEMORY[0x263F82418] alertControllerWithTitle:v5 message:v7 preferredStyle:1];
  id v9 = (void *)MEMORY[0x263F82400];
  id v10 = WLLocalizedString();
  id v11 = [v9 actionWithTitle:v10 style:1 handler:&__block_literal_global_184];
  [v8 addAction:v11];

  uint64_t v12 = (void *)MEMORY[0x263F82400];
  uint64_t v13 = WLLocalizedString();
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __45__WLWelcomeController_showCancellationAlert___block_invoke_2;
  v17[3] = &unk_264870B50;
  id v14 = v4;
  id v18 = v14;
  objc_copyWeak(&v19, &location);
  uint64_t v15 = [v12 actionWithTitle:v13 style:0 handler:v17];
  [v8 addAction:v15];

  id v16 = [(BFFNavigationController *)self->_navigationController topViewController];
  [v16 presentViewController:v8 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __45__WLWelcomeController_showCancellationAlert___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    __45__WLWelcomeController_showCancellationAlert___block_invoke_2_cold_1();
  }
  id v5 = WeakRetained;
  uint64_t v6 = WeakRetained[7];
  uint64_t v7 = 6;
  if (v6 == 4) {
    uint64_t v7 = 8;
  }
  BOOL v8 = v6 == 3;
  uint64_t v9 = 7;
  if (!v8) {
    uint64_t v9 = v7;
  }
  WeakRetained[7] = v9;
  [WeakRetained cancel];
}

- (void)showCancellation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unint64_t migrationState = self->_migrationState;
  if (migrationState == 8)
  {
    +[WLRecord startRecording];
    uint64_t v6 = [(WLTransferCancellationViewController *)[WLImportCancellationViewController alloc] initWithWelcomeController:self context:v4];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __40__WLWelcomeController_showCancellation___block_invoke_2;
    v14[3] = &unk_2648707E0;
    uint64_t v7 = &v15;
    objc_copyWeak(&v15, &location);
    [(WLTransferCancellationViewController *)v6 setResetBlock:v14];
  }
  else if (migrationState == 7)
  {
    +[WLRecord startRecording];
    uint64_t v6 = [[WLTransferCancellationViewController alloc] initWithWelcomeController:self context:v4];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __40__WLWelcomeController_showCancellation___block_invoke;
    v16[3] = &unk_2648707E0;
    uint64_t v7 = &v17;
    objc_copyWeak(&v17, &location);
    [(WLTransferCancellationViewController *)v6 setResetBlock:v16];
  }
  else
  {
    uint64_t v6 = [[WLCancellationViewController alloc] initWithWelcomeController:self];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__WLWelcomeController_showCancellation___block_invoke_3;
    v12[3] = &unk_2648707E0;
    uint64_t v7 = &v13;
    objc_copyWeak(&v13, &location);
    [(WLImportCancellationViewController *)v6 setContinueBlock:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __40__WLWelcomeController_showCancellation___block_invoke_4;
    v10[3] = &unk_2648707E0;
    objc_copyWeak(&v11, &location);
    [(WLImportCancellationViewController *)v6 setRetryBlock:v10];
    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(v7);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__WLWelcomeController_showCancellation___block_invoke_5;
  v8[3] = &unk_2648707E0;
  objc_copyWeak(&v9, &location);
  [(WLWelcomeController *)self _pushViewController:v6 andRemovePreviousTopmostViewControllerWithCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__WLWelcomeController_showCancellation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reset];
}

void __40__WLWelcomeController_showCancellation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reset];
}

void __40__WLWelcomeController_showCancellation___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeWithSuccess:1];
}

void __40__WLWelcomeController_showCancellation___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained retry];
}

void __40__WLWelcomeController_showCancellation___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained run];
}

- (void)showFailure:(id)a3
{
  id v4 = a3;
  +[WLRecord startRecording];
  id v5 = [[WLFailureViewController alloc] initWithWelcomeController:self context:v4];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__WLWelcomeController_showFailure___block_invoke;
  v8[3] = &unk_2648707E0;
  objc_copyWeak(&v9, &location);
  [(WLFailureViewController *)v5 setResetBlock:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__WLWelcomeController_showFailure___block_invoke_2;
  v6[3] = &unk_2648707E0;
  objc_copyWeak(&v7, &location);
  [(WLWelcomeController *)self _pushViewController:v5 andRemovePreviousTopmostViewControllerWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __35__WLWelcomeController_showFailure___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reset];
}

void __35__WLWelcomeController_showFailure___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained run];
}

- (void)stopAP
{
  _WLLog();
  self->_dismissAfterSourceDevicePairingTimeout = 0;
  if (!self->_useMigrationKitInAP)
  {
    sourceDevicesController = self->_sourceDevicesController;
    [(WLSourceDevicesController *)sourceDevicesController stopWiFiAndDeviceDiscoveryWithCompletion:0];
  }
}

- (void)authenticate
{
  sourceDevice = self->_sourceDevice;
  BOOL useMigrationKitInAP = self->_useMigrationKitInAP;
  _WLLog();
  if (self->_sourceDevice && !self->_useMigrationKitInAP)
  {
    [(WLWelcomeController *)self stop];
  }
  else
  {
    -[WLWelcomeController setUseMigrationKit:](self, "setUseMigrationKit:", 1, self, sourceDevice, useMigrationKitInAP);
    [(WLWelcomeController *)self stopAP];
    [(WLWelcomeController *)self _showPreparation:0];
  }
}

- (void)showReject
{
  uint64_t v3 = [[WLRejectViewController alloc] initWithWelcomeController:self];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__WLWelcomeController_showReject__block_invoke;
  v6[3] = &unk_2648707E0;
  objc_copyWeak(&v7, &location);
  [(WLRejectViewController *)v3 setRetryBlock:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__WLWelcomeController_showReject__block_invoke_2;
  v4[3] = &unk_2648707E0;
  objc_copyWeak(&v5, &location);
  [(WLWelcomeController *)self _pushViewController:v3 andRemovePreviousTopmostViewControllerWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __33__WLWelcomeController_showReject__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained retry];
}

void __33__WLWelcomeController_showReject__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained run];
}

- (void)reject
{
  _WLLog();
  if (self->_migrationState != 9)
  {
    self->_unint64_t migrationState = 9;
    [(WLWelcomeController *)self cancel];
    [(WLWelcomeController *)self _didCompleteMigrationWithSuccess:0 retry:1 context:0];
  }
}

- (void)setClient:(id)a3 brand:(id)a4 model:(id)a5 name:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  _WLLog();
  +[WLRecord startRecording];
  id v14 = [[WLUIClient alloc] initWithHostname:v13 brand:v12 model:v11 name:v10];

  [(WLWelcomeController *)self setClient:v14];
  [(WLWelcomeController *)self _showWaitingForDataTypeSelection];
}

- (void)updateProgress:(float)a3 remainingTime:(unint64_t)a4 completedOperationCount:(unint64_t)a5 totalOperationCount:(unint64_t)a6
{
  double v11 = a3;
  double v21 = a3;
  _WLLog();
  unint64_t migrationState = self->_migrationState;
  if (migrationState == 5) {
    return;
  }
  if (a3 >= 1.0)
  {
    self->_unint64_t migrationState = 5;
    [(WLWelcomeController *)self cancel];
    id v13 = self;
    uint64_t v14 = 1;
    uint64_t v15 = 0;
    goto LABEL_7;
  }
  if (a3 < 0.0)
  {
    self->_unint64_t migrationState = 10;
    [(WLWelcomeController *)self cancel];
    id v13 = self;
    uint64_t v14 = 0;
    uint64_t v15 = 1;
LABEL_7:
    [(WLWelcomeController *)v13 _didCompleteMigrationWithSuccess:v14 retry:v15 context:0];
    return;
  }
  if (migrationState - 3 > 1)
  {
    self->_unint64_t migrationState = 3;
    [(WLWelcomeController *)self _showTransferring];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_transferringViewController);
    [WeakRetained setProgress:v11];

    if (a3 <= 0.0 || !a4) {
      return;
    }
    id v25 = objc_loadWeakRetained((id *)&self->_transferringViewController);
    [v25 setRemainingDownloadTime:(double)a4];
    goto LABEL_19;
  }
  p_transferringViewController = &self->_transferringViewController;
  id v17 = objc_loadWeakRetained((id *)p_transferringViewController);
  objc_msgSend(v17, "setProgress:", v11, self, *(void *)&v21, a4, a5, a6);

  if (a3 > 0.0 && a4)
  {
    id v18 = objc_loadWeakRetained((id *)p_transferringViewController);
    [v18 setRemainingDownloadTime:(double)a4];
  }
  if (a5)
  {
    id v25 = objc_loadWeakRetained((id *)p_transferringViewController);
    [v25 setCompletedOperationCount:a5 totalOperationCount:a6];
LABEL_19:
  }
}

- (void)showImport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transferringViewController);
  [WeakRetained setIsImporting:1];
}

- (void)import
{
  unint64_t migrationState = self->_migrationState;
  _WLLog();
  unint64_t v3 = self->_migrationState;
  if (v3 == 3)
  {
    self->_unint64_t migrationState = 4;
  }
  else
  {
    if (v3) {
      return;
    }
    self->_unint64_t migrationState = 4;
    [(WLWelcomeController *)self _showTransferring];
  }
  [(WLWelcomeController *)self showImport];
}

- (void)complete:(id)a3
{
  id v4 = a3;
  _WLLog();
  if (self->_migrationState != 5)
  {
    self->_unint64_t migrationState = 5;
    [(WLWelcomeController *)self cancel];
    [(WLWelcomeController *)self _didCompleteMigrationWithSuccess:1 retry:0 context:v4];
  }
}

- (void)change:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  if (a3 == 3)
  {
    if (self->_migrationState - 3 >= 2)
    {

      id v6 = 0;
    }
    id v9 = v6;
    unint64_t v8 = 10;
    goto LABEL_10;
  }
  if (a3 != 2) {
    goto LABEL_13;
  }
  unint64_t migrationState = self->_migrationState;
  if (migrationState - 7 >= 2)
  {
    if (migrationState == 4)
    {
      id v9 = v6;
      unint64_t v8 = 8;
    }
    else
    {
      if (migrationState != 3)
      {
        self->_unint64_t migrationState = 6;

        id v9 = 0;
        goto LABEL_11;
      }
      id v9 = v6;
      unint64_t v8 = 7;
    }
LABEL_10:
    self->_unint64_t migrationState = v8;
LABEL_11:
    [(WLWelcomeController *)self cancel];
    id v6 = v9;
  }
  id v10 = v6;
  [(WLWelcomeController *)self _didCompleteMigrationWithSuccess:0 retry:1 context:v6];
  id v6 = v10;
LABEL_13:
}

- (void)reset
{
  if (self->_resetHandler)
  {
    _WLLog();
    (*((void (**)(id))self->_resetHandler + 2))(self->_resetHandler);
    _WLLog();
  }
  else
  {
    _WLLog();
  }
}

- (void)daemon:(id)a3 didCreateCode:(id)a4
{
}

- (void)daemonDidAuthenticateClient:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__WLWelcomeController_daemonDidAuthenticateClient___block_invoke;
  v3[3] = &unk_2648707E0;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __51__WLWelcomeController_daemonDidAuthenticateClient___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained authenticate];
}

- (void)daemonDidRejectClient:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__WLWelcomeController_daemonDidRejectClient___block_invoke;
  v3[3] = &unk_2648707E0;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __45__WLWelcomeController_daemonDidRejectClient___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reject];
}

- (void)daemon:(id)a3 didReceiveClient:(id)a4 brand:(id)a5 model:(id)a6 name:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __64__WLWelcomeController_daemon_didReceiveClient_brand_model_name___block_invoke;
  v19[3] = &unk_264870B78;
  objc_copyWeak(&v24, &location);
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(MEMORY[0x263EF83A0], v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __64__WLWelcomeController_daemon_didReceiveClient_brand_model_name___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained setClient:*(void *)(a1 + 32) brand:*(void *)(a1 + 40) model:*(void *)(a1 + 48) name:*(void *)(a1 + 56)];
}

- (void)daemon:(id)a3 didUpdateProgress:(float)a4 remainingTime:(unint64_t)a5 completedOperationCount:(unint64_t)a6 totalOperationCount:(unint64_t)a7
{
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __106__WLWelcomeController_daemon_didUpdateProgress_remainingTime_completedOperationCount_totalOperationCount___block_invoke;
  v11[3] = &unk_264870BA0;
  objc_copyWeak(v12, &location);
  float v13 = a4;
  v12[1] = (id)a5;
  v12[2] = (id)a6;
  v12[3] = (id)a7;
  dispatch_async(MEMORY[0x263EF83A0], v11);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __106__WLWelcomeController_daemon_didUpdateProgress_remainingTime_completedOperationCount_totalOperationCount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LODWORD(v2) = *(_DWORD *)(a1 + 64);
  [WeakRetained updateProgress:*(void *)(a1 + 40) remainingTime:*(void *)(a1 + 48) completedOperationCount:*(void *)(a1 + 56) totalOperationCount:v2];
}

- (void)daemonWillImport:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__WLWelcomeController_daemonWillImport___block_invoke;
  v3[3] = &unk_2648707E0;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __40__WLWelcomeController_daemonWillImport___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained import];
}

- (void)daemon:(id)a3 didImportWithContext:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__WLWelcomeController_daemon_didImportWithContext___block_invoke;
  block[3] = &unk_264870930;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__WLWelcomeController_daemon_didImportWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained complete:*(void *)(a1 + 32)];
}

- (void)daemon:(id)a3 didChangeState:(int64_t)a4 withContext:(id)a5
{
  id v7 = a5;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__WLWelcomeController_daemon_didChangeState_withContext___block_invoke;
  v9[3] = &unk_264870BC8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a4;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __57__WLWelcomeController_daemon_didChangeState_withContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained change:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];
}

- (void)daemonDidGetInterrupted
{
  unint64_t migrationState = self->_migrationState;
  BOOL v3 = migrationState > 4;
  uint64_t v4 = (1 << migrationState) & 0x19;
  if (!v3 && v4 != 0)
  {
    [(WLWelcomeController *)self change:3 context:0];
    id v6 = [MEMORY[0x263F862E0] sharedInstance];
    [v6 daemonDidGetInterrupted];
  }
}

- (void)downloadTips
{
  objc_initWeak(&location, self);
  double v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__WLWelcomeController_downloadTips__block_invoke;
  v3[3] = &unk_2648707E0;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __35__WLWelcomeController_downloadTips__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained downloadTipsInBackground];
}

- (void)downloadTipsInBackground
{
  BOOL v3 = +[WLTips download];
  obj = self;
  objc_sync_enter(obj);
  obj->_hasTips = v3;
  objc_sync_exit(obj);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)resetHandler
{
  return self->_resetHandler;
}

- (void)setResetHandler:(id)a3
{
}

- (BOOL)useMigrationKit
{
  return self->_useMigrationKit;
}

- (void)setUseMigrationKit:(BOOL)a3
{
  self->_useMigrationKit = a3;
}

- (BOOL)useMigrationKitInAP
{
  return self->_useMigrationKitInAP;
}

- (void)setUseMigrationKitInAP:(BOOL)a3
{
  self->_BOOL useMigrationKitInAP = a3;
}

- (WLTransferringViewController)transferringViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transferringViewController);
  return (WLTransferringViewController *)WeakRetained;
}

- (void)setTransferringViewController:(id)a3
{
}

- (WLImportViewController)importViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importViewController);
  return (WLImportViewController *)WeakRetained;
}

- (void)setImportViewController:(id)a3
{
}

- (WLUIClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (WLMigrationKitController)migrationKitController
{
  return self->_migrationKitController;
}

- (void)setMigrationKitController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationKitController, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_importViewController);
  objc_destroyWeak((id *)&self->_transferringViewController);
  objc_storeStrong(&self->_resetHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_migrationControllerDelegateQueueTargetedAtMainQueue, 0);
  objc_storeStrong((id *)&self->_migrationController, 0);
  objc_storeStrong((id *)&self->_sourceDevice, 0);
  objc_storeStrong((id *)&self->_sourceDevicesController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

void __55__WLWelcomeController__configureWelcomeViewController___block_invoke_cold_1()
{
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_3_cold_1()
{
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_4_cold_1()
{
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_5_cold_1()
{
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_8_cold_1()
{
}

void __53__WLWelcomeController__showPairingCode_wifiPSK_ssid___block_invoke_9_cold_1()
{
}

void __38__WLWelcomeController__showCompleted___block_invoke_cold_1()
{
}

void __45__WLWelcomeController_showCancellationAlert___block_invoke_2_cold_1()
{
}

@end