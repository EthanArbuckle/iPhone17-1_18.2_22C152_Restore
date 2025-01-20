@interface ICSBackupViewController
- (BOOL)finishBackupExecuted;
- (BOOL)isBackupEnabled;
- (BOOL)isFetchingDomainInfo;
- (BOOL)needToShowPopupAlertForBackup;
- (BOOL)policyPreventsBackup;
- (BYBuddyDaemonCloudSyncClient)cloudSyncClient;
- (ICSBackupViewController)initWithAccount:(id)a3;
- (NWPathEvaluator)pathEvaluator;
- (PSGBackupDisabledAppsInfo)backupDisabledAppsInfo;
- (double)icloudBackupProgress;
- (double)icloudSyncProgress;
- (id)_backgroundRestoreInfoText:(id)a3;
- (id)_buildBackupSpecifiersWithTip:(id)a3;
- (id)_buildHeaderCardSpecifier;
- (id)cachedIsBackupEnabledNumber;
- (id)dateStringOfLatestBackup;
- (id)isBackupOverCellularEnabled;
- (id)manageStorageAction;
- (id)specifiers;
- (int)currentSyncState;
- (int)updateBackupState;
- (int64_t)estimateTimeRemaining;
- (void)_backupEnabledSwitchCancelled:(id)a3;
- (void)_checkSupportForManualAndAutoBackupOnCellularWithCompletion:(id)a3;
- (void)_disableBackupWithSpecifier:(id)a3;
- (void)_enableBackupWithSpecifier:(id)a3;
- (void)_fetchiCloudHomeData;
- (void)_persistBackupEnablementState:(BOOL)a3 passcode:(id)a4;
- (void)_postQuotaDidChangeNotification;
- (void)_setBackupEnabled:(BOOL)a3 passcode:(id)a4;
- (void)_showAlertForExpensiveCellular;
- (void)_updateToBackupState:(id)a3 restoreState:(id)a4 backgroundRestoreState:(id)a5 backupEnabled:(BOOL)a6;
- (void)_updateToBackupState:(int)a3 backupError:(id)a4 progress:(float)a5 timeRemaining:(unint64_t)a6 restoreStateInfo:(id)a7 backgroundRestoreInfo:(id)a8 backupEnabled:(BOOL)a9;
- (void)beginBackup:(id)a3;
- (void)cancelBackup:(id)a3;
- (void)cancelRestore:(id)a3;
- (void)checkIfNetworkSupportsBackup;
- (void)checkIfThermalSupportsBackup;
- (void)dealloc;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didCancelEnteringPIN;
- (void)fetchIsBackupEnabled;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)manager:(id)a3 didFailBackupWithError:(id)a4;
- (void)manager:(id)a3 didFailRestoreWithError:(id)a4;
- (void)manager:(id)a3 didSetBackupEnabled:(BOOL)a4;
- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5;
- (void)managerDidCancelRestore:(id)a3;
- (void)managerDidFinishBackup:(id)a3;
- (void)managerDidFinishRestore:(id)a3;
- (void)managerDidLoseConnectionToService:(id)a3;
- (void)managerDidUpdateBackgroundRestoreProgress:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openBackupHelpPage:(id)a3;
- (void)performTipAction:(id)a3;
- (void)prepareAlertForBackupDisabledDomainAndShow:(BOOL)a3;
- (void)proceedWithBackup;
- (void)reloadSpecifiers;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)setBackupDisabledAppsInfo:(id)a3;
- (void)setBackupEnabled:(id)a3 specifier:(id)a4;
- (void)setBackupOverCellularEnabled:(id)a3;
- (void)setCloudSyncClient:(id)a3;
- (void)setCurrentSyncState:(int)a3;
- (void)setEstimateTimeRemaining:(int64_t)a3;
- (void)setFinishBackupExecuted:(BOOL)a3;
- (void)setIcloudBackupProgress:(double)a3;
- (void)setIcloudSyncProgress:(double)a3;
- (void)setIsFetchingDomainInfo:(BOOL)a3;
- (void)setLastBackupDateString:(id)a3;
- (void)setNeedToShowPopupAlertForBackup:(BOOL)a3;
- (void)setNetworkSupportsBackup:(BOOL)a3;
- (void)setPathEvaluator:(id)a3;
- (void)setThermalSupportsBackup:(BOOL)a3;
- (void)setUpdateBackupState:(int)a3;
- (void)showAlertForBackupDisabledItemsWithTitle:(id)a3 andMessage:(id)a4;
- (void)showPopUpAlertForBackupDisabledApps;
- (void)specifiers;
- (void)startBackup;
- (void)startListeningForThermalChanges;
- (void)stopListeningForThermalChanges;
- (void)syncCompletedWithErrors:(id)a3;
- (void)syncProgress:(double)a3;
- (void)updateBackupFinishState;
- (void)updateBusyState;
- (void)updateLastBackupDate;
- (void)updateLastBackupDateInvalidatePrevious:(BOOL)a3;
- (void)updateiCloudBackupAndSyncProgressWithAllowDecrease:(BOOL)a3;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willUnlock;
@end

@implementation ICSBackupViewController

- (ICSBackupViewController)initWithAccount:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICSBackupViewController;
  v6 = [(ICSBackupViewController *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    id v8 = objc_alloc(MEMORY[0x263F559D8]);
    v9 = [(ACAccount *)v7->_account personaIdentifier];
    uint64_t v10 = [v8 initWithDelegate:v7 eventQueue:0 personaIdentifier:v9];
    backupManager = v7->_backupManager;
    v7->_backupManager = (MBManager *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.preferences.backup_state", 0);
    backup_state_queue = v7->_backup_state_queue;
    v7->_backup_state_queue = (OS_dispatch_queue *)v12;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)appleAccountChangedCallback, (CFStringRef)*MEMORY[0x263F25620], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v7->_thermalNotificationToken = -1;
    v7->_thermalSupportsBackup = 1;
    v7->_currentSyncState = 0;
    v7->_updateBackupState = 0;
    v7->_icloudSyncProgress = 0.0;
    v7->_icloudBackupProgress = 0.0;
    v7->_estimateTimeRemaining = 0;
    v7->_isFetchingDomainInfo = 0;
    v7->_needToShowPopupAlertForBackup = 0;
    [(ICSBackupViewController *)v7 _checkSupportForManualAndAutoBackupOnCellularWithCompletion:0];
    uint64_t v15 = objc_opt_new();
    pathEvaluator = v7->_pathEvaluator;
    v7->_pathEvaluator = (NWPathEvaluator *)v15;

    [(NWPathEvaluator *)v7->_pathEvaluator addObserver:v7 forKeyPath:@"path" options:5 context:0];
    [(ICSBackupViewController *)v7 fetchIsBackupEnabled];
    if (objc_msgSend(v5, "aa_isAccountClass:", *MEMORY[0x263F25618])
      && (objc_msgSend(v5, "aa_isManagedAppleID") & 1) == 0)
    {
      [(ICSBackupViewController *)v7 _fetchiCloudHomeData];
    }
    v17 = [[_TtC14iCloudSettings22ICSAnalyticsController alloc] initWithAccount:v5];
    analyticsController = v7->_analyticsController;
    v7->_analyticsController = v17;
  }
  return v7;
}

- (void)willUnlock
{
  [(ICSBackupViewController *)self updateBusyState];

  [(ICSBackupViewController *)self updateLastBackupDate];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSBackupViewController;
  [(ICSBackupViewController *)&v7 viewWillAppear:a3];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"BACKUPS_NAV_TITLE" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  [(ICSBackupViewController *)self setTitle:v5];

  backupDisabledAppsInfo = self->_backupDisabledAppsInfo;
  self->_backupDisabledAppsInfo = 0;

  [(ICSBackupViewController *)self prepareAlertForBackupDisabledDomainAndShow:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)ICSBackupViewController;
  [(ICSBackupViewController *)&v12 viewDidAppear:a3];
  if (([(ICSBackupViewController *)self isMovingToParentViewController] & 1) == 0)
  {
    v4 = [MEMORY[0x263F88A58] sharedManager];
    [v4 noteQuotaInfoChanged];
  }
  id v5 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__ICSBackupViewController_viewDidAppear___block_invoke;
  v11[3] = &unk_2655B5688;
  v11[4] = self;
  dispatch_async(v5, v11);

  [(ICSBackupViewController *)self checkIfNetworkSupportsBackup];
  [(ICSBackupViewController *)self startListeningForThermalChanges];
  [(ICSBackupViewController *)self checkIfThermalSupportsBackup];
  v6 = (void *)[objc_alloc(NSURL) initWithString:@"settings-navigation://com.apple.Settings.AppleAccount/ICLOUD_SERVICE/BACKUP"];
  objc_super v7 = +[ICSDeviceExpertManager backupTitle];
  id v8 = +[ICSDeviceExpertManager appleAccountTitle];
  v13[0] = v8;
  v9 = +[ICSDeviceExpertManager iCloudTitle];
  v13[1] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  [(ICSBackupViewController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.application-icon.icloud" title:v7 localizedNavigationComponents:v10 deepLink:v6];
}

uint64_t __41__ICSBackupViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1392) syncBackupEnabled];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSBackupViewController;
  [(ICSBackupViewController *)&v4 viewWillDisappear:a3];
  [(ICSBackupViewController *)self stopListeningForThermalChanges];
  self->_needToShowPopupAlertForBackup = 0;
}

- (void)dealloc
{
  [(ICSBackupViewController *)self dismissViewControllerAnimated:0 completion:0];
  [(NWPathEvaluator *)self->_pathEvaluator removeObserver:self forKeyPath:@"path" context:0];
  [(ICSBackupViewController *)self stopListeningForThermalChanges];
  [(MBManager *)self->_backupManager setDelegate:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F25620], 0);
  v4.receiver = self;
  v4.super_class = (Class)ICSBackupViewController;
  [(ICSBackupViewController *)&v4 dealloc];
}

- (BYBuddyDaemonCloudSyncClient)cloudSyncClient
{
  cloudSyncClient = self->_cloudSyncClient;
  if (!cloudSyncClient)
  {
    objc_super v4 = (BYBuddyDaemonCloudSyncClient *)objc_opt_new();
    id v5 = self->_cloudSyncClient;
    self->_cloudSyncClient = v4;

    [(BYBuddyDaemonCloudSyncClient *)self->_cloudSyncClient setDelegate:self];
    cloudSyncClient = self->_cloudSyncClient;
  }

  return cloudSyncClient;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"path", a4, a5, a6))
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__ICSBackupViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_2655B5F40;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x263EF83A0], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __74__ICSBackupViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained checkIfNetworkSupportsBackup];
}

- (void)setNetworkSupportsBackup:(BOOL)a3
{
  BOOL v3 = a3;
  networkSupportsBackup = self->_networkSupportsBackup;
  if (!networkSupportsBackup || [(NSNumber *)networkSupportsBackup BOOLValue] != a3)
  {
    v6 = [NSNumber numberWithBool:v3];
    objc_super v7 = self->_networkSupportsBackup;
    self->_networkSupportsBackup = v6;

    [(ICSBackupViewController *)self updateBusyState];
    [(ICSBackupViewController *)self updateLastBackupDate];
  }
}

- (void)checkIfNetworkSupportsBackup
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICSBackupViewController *)self pathEvaluator];
  objc_super v4 = [v3 path];

  unint64_t v5 = [v4 status] & 0xFFFFFFFFFFFFFFFDLL;
  v6 = [v4 interface];
  uint64_t v7 = [v6 type];

  isExpensiveCellular = self->_isExpensiveCellular;
  self->_isExpensiveCellular = 0;

  if (v5 != 1) {
    goto LABEL_7;
  }
  uint64_t v9 = 1;
  if (([v4 usesInterfaceType:1] & 1) == 0)
  {
    if ([v4 usesInterfaceType:3])
    {
      uint64_t v9 = 1;
      goto LABEL_8;
    }
    if ([v4 usesInterfaceType:2])
    {
      objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isExpensive"));
      uint64_t v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v11 = self->_isExpensiveCellular;
      self->_isExpensiveCellular = v10;

      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __55__ICSBackupViewController_checkIfNetworkSupportsBackup__block_invoke;
      v14[3] = &unk_2655B5F68;
      v14[4] = self;
      v14[5] = v7;
      char v15 = 0;
      [(ICSBackupViewController *)self _checkSupportForManualAndAutoBackupOnCellularWithCompletion:v14];
      goto LABEL_11;
    }
LABEL_7:
    uint64_t v9 = 0;
  }
LABEL_8:
  objc_super v12 = LogSubsystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_isExpensiveCellular;
    *(_DWORD *)buf = 134218498;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    v19 = v13;
    __int16 v20 = 1024;
    int v21 = v9;
    _os_log_impl(&dword_262993000, v12, OS_LOG_TYPE_DEFAULT, "Network interfaceType: %ld. Expensive cellular: %@. Network supports backup: %d", buf, 0x1Cu);
  }

  [(ICSBackupViewController *)self setNetworkSupportsBackup:v9];
LABEL_11:
}

uint64_t __55__ICSBackupViewController_checkIfNetworkSupportsBackup__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 1416);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int8 *)(a1 + 48);
    int v7 = 134218498;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "Network interfaceType: %ld. Expensive cellular: %@. Network supports backup: %d", (uint8_t *)&v7, 0x1Cu);
  }

  return [*(id *)(a1 + 32) setNetworkSupportsBackup:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1424)];
}

- (void)_checkSupportForManualAndAutoBackupOnCellularWithCompletion:(id)a3
{
  id v4 = a3;
  self->_isAutoBackupOnCellularAllowed = 0;
  self->_isManualBackupOnCellularAllowed = 0;
  objc_initWeak(&location, self);
  int v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke;
  v7[3] = &unk_2655B5AF0;
  objc_copyWeak(&v9, &location);
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[174];
    uint64_t v5 = v3[173];
    id v14 = 0;
    char v6 = [v4 backupOnCellularSupportWithAccount:v5 error:&v14];
    int v7 = v14;
    if (v7)
    {
      id v8 = LogSubsystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_cold_2();
      }
    }
    else
    {
      *((unsigned char *)v3 + 1424) = v6 & 1;
      *((unsigned char *)v3 + 1425) = (v6 & 2) != 0;
    }
    id v9 = LogSubsystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *((unsigned __int8 *)v3 + 1424);
      int v11 = *((unsigned __int8 *)v3 + 1425);
      *(_DWORD *)buf = 67109376;
      int v16 = v10;
      __int16 v17 = 1024;
      int v18 = v11;
      _os_log_impl(&dword_262993000, v9, OS_LOG_TYPE_DEFAULT, "ManualBackupOnCellularAllowed: %d. AutoBackupOnCellularAllowed: %d", buf, 0xEu);
    }

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_353;
    v12[3] = &unk_2655B5728;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
  else
  {
    int v7 = LogSubsystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_cold_1(a1, v7);
    }
  }
}

uint64_t __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_353(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startListeningForThermalChanges
{
  objc_initWeak(&location, self);
  if (self->_thermalNotificationToken == -1)
  {
    uint64_t v3 = (const char *)*MEMORY[0x263EF8920];
    id v4 = MEMORY[0x263EF83A0];
    id v5 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __58__ICSBackupViewController_startListeningForThermalChanges__block_invoke;
    handler[3] = &unk_2655B5F90;
    objc_copyWeak(&v7, &location);
    handler[4] = self;
    notify_register_dispatch(v3, &self->_thermalNotificationToken, v4, handler);

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

void __58__ICSBackupViewController_startListeningForThermalChanges__block_invoke(uint64_t a1, int token)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  uint64_t v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = state64;
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "received thermal pressure notification: %llu", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    char v6 = *(NSObject **)(*(void *)(a1 + 32) + 1440);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__ICSBackupViewController_startListeningForThermalChanges__block_invoke_354;
    block[3] = &unk_2655B5EF0;
    uint64_t v9 = state64;
    id v8 = WeakRetained;
    dispatch_async(v6, block);
  }
}

uint64_t __58__ICSBackupViewController_startListeningForThermalChanges__block_invoke_354(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = LogSubsystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 >= 0x14)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      id v5 = "Restore paused due to thermal pressure.";
      char v6 = buf;
      goto LABEL_6;
    }
  }
  else if (v4)
  {
    __int16 v8 = 0;
    id v5 = "Restore resumed due to thermal pressure.";
    char v6 = (uint8_t *)&v8;
LABEL_6:
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
  }

  return [*(id *)(a1 + 32) setThermalSupportsBackup:v2 < 0x14];
}

- (void)stopListeningForThermalChanges
{
  self->_thermalNotificationToken = -1;
}

- (void)setThermalSupportsBackup:(BOOL)a3
{
  self->_thermalSupportsBackup = a3;
  [(ICSBackupViewController *)self updateBusyState];
}

- (void)checkIfThermalSupportsBackup
{
  int out_token = 0;
  uint64_t v3 = 0;
  if (!notify_register_check((const char *)*MEMORY[0x263EF8920], &out_token))
  {
    if (!notify_get_state(out_token, &v3)) {
      [(ICSBackupViewController *)self setThermalSupportsBackup:v3 < 0x14];
    }
    notify_cancel(out_token);
  }
}

- (id)_buildHeaderCardSpecifier
{
  uint64_t v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"BackupHeader" target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  BOOL v4 = +[ICSDefaultIconLoader iconWithType:size:drawBorder:](ICSDefaultIconLoader, "iconWithType:size:drawBorder:", 0, 1, 120.0, 120.0);
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F60140]];

  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v6 = [v5 localizedStringForKey:@"BACKUP_HEADER_TITLE" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263F602D0]];

  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v8 = [v7 localizedStringForKey:@"BACKUPS_INFO_LEARN_MORE" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  [v3 setObject:v8 forKeyedSubscript:ICQUILearnMoreTextKey];

  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v10 = [v9 localizedStringForKey:@"BACKUP_HELP_PAGE_URL" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  [v3 setObject:v10 forKeyedSubscript:ICQUILearnMoreLinkKey];

  if (![(ICSBackupViewController *)self policyPreventsBackup])
  {
    int v11 = LogSubsystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v11, OS_LOG_TYPE_DEFAULT, "Backup is allowed, setting backup info text", buf, 2u);
    }

    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v13 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"BACKUPS_INFO_TEXT"];
    id v14 = [v12 localizedStringForKey:v13 value:&stru_270DEF3F8 table:@"Localizable-Backup"];
    [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x263F602C8]];
  }

  return v3;
}

- (void)reloadSpecifiers
{
  if (self->_finishedInitialLoad)
  {
    [(ICSBackupViewController *)self updateBusyState];
    [(ICSBackupViewController *)self updateLastBackupDate];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)ICSBackupViewController;
    [(ICSBackupViewController *)&v3 reloadSpecifiers];
  }
}

- (id)specifiers
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.iCloudQuotaUI"];
    char v6 = [(ICSBackupViewController *)self loadSpecifiersFromPlistName:@"Backup" target:self bundle:v5];

    id v7 = [v6 specifierForID:@"BACKUP_ENABLED_SWITCH"];
    __int16 v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"BACKUP_ENABLED_SWITCH"];
    int v10 = [v8 localizedStringForKey:v9 value:&stru_270DEF3F8 table:@"Localizable-Backup"];
    [v7 setName:v10];

    uint64_t v11 = *MEMORY[0x263F5FEF8];
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
    uint64_t v12 = [v6 specifierForID:@"BACKUP_SWITCH_GROUP"];
    if (!v12) {
      -[ICSBackupViewController specifiers]();
    }
    uint64_t v13 = v12;
    [v12 setName:0];
    id v14 = [(ICSBackupViewController *)self _buildHeaderCardSpecifier];
    if ((unint64_t)[v6 count] >= 2)
    {
      char v15 = LogSubsystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v59 = 1;
        _os_log_impl(&dword_262993000, v15, OS_LOG_TYPE_DEFAULT, "Inserting header specifier for backup controller at index: %d", buf, 8u);
      }

      [v6 insertObject:v14 atIndex:1];
    }
    if (!self->_backupOverCellularSpecifiers)
    {
      int v16 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"BACKUP_OVER_CELLULAR_GROUP"];
      v51 = v13;
      __int16 v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      SFLocalizableWAPIStringKeyForKey();
      v53 = v7;
      int v18 = v55 = v11;
      uint64_t v19 = [v17 localizedStringForKey:v18 value:&stru_270DEF3F8 table:@"Localizable-Backup"];
      [v16 setObject:v19 forKeyedSubscript:*MEMORY[0x263F600F8]];

      __int16 v20 = (void *)MEMORY[0x263F5FC40];
      int v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v22 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"BACKUP_OVER_CELLULAR_ENABLED_SWITCH"];
      v23 = [v21 localizedStringForKey:v22 value:&stru_270DEF3F8 table:@"Localizable-Backup"];
      v24 = [v20 preferenceSpecifierNamed:v23 target:self set:sel_setBackupOverCellularEnabled_ get:sel_isBackupOverCellularEnabled detail:0 cell:6 edit:0];
      backupOverCellularSwitch = self->_backupOverCellularSwitch;
      self->_backupOverCellularSwitch = v24;

      uint64_t v11 = v55;
      uint64_t v13 = v51;

      id v7 = v53;
      [(PSSpecifier *)self->_backupOverCellularSwitch setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
      [(PSSpecifier *)self->_backupOverCellularSwitch setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v55];
      [(PSSpecifier *)self->_backupOverCellularSwitch setObject:@"BACKUP_OVER_CELLULAR_ENABLED_SWITCH" forKeyedSubscript:*MEMORY[0x263F60138]];
      v26 = self->_backupOverCellularSwitch;
      v57[0] = v16;
      v57[1] = v26;
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
      backupOverCellularSpecifiers = self->_backupOverCellularSpecifiers;
      self->_backupOverCellularSpecifiers = v27;
    }
    if (!self->_backupNowSpecifiers)
    {
      uint64_t v56 = v11;
      v29 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      uint64_t v54 = *MEMORY[0x263F60138];
      objc_msgSend(v29, "setProperty:forKey:", @"BACKUP_NOW_GROUP");
      if (!self->_backupStatusView)
      {
        v30 = [[ICSBackupStatusView alloc] initWithSpecifier:v29];
        backupStatusView = self->_backupStatusView;
        self->_backupStatusView = v30;
      }
      v32 = [(id)objc_opt_class() description];
      [v29 setProperty:v32 forKey:*MEMORY[0x263F600C0]];

      [v29 setProperty:self->_backupStatusView forKey:*MEMORY[0x263F60108]];
      if (!self->_backupNowButton)
      {
        v52 = (void *)MEMORY[0x263F5FC40];
        v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        [v33 localizedStringForKey:@"BACKUP_NOW" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
        v34 = v13;
        v36 = v35 = v7;
        v37 = [v52 preferenceSpecifierNamed:v36 target:self set:0 get:0 detail:0 cell:13 edit:0];
        backupNowButton = self->_backupNowButton;
        self->_backupNowButton = v37;

        id v7 = v35;
        uint64_t v13 = v34;

        v39 = self->_backupNowButton;
        v40 = [NSNumber numberWithBool:0];
        [(PSSpecifier *)v39 setProperty:v40 forKey:*MEMORY[0x263F600A8]];

        [(PSSpecifier *)self->_backupNowButton setProperty:@"BACKUP_NOW_BUTTON" forKey:v54];
        [(PSSpecifier *)self->_backupNowButton setProperty:MEMORY[0x263EFFA88] forKey:v56];
        [(PSSpecifier *)self->_backupNowButton setButtonAction:sel_beginBackup_];
      }
      v41 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v29, self->_backupNowButton, 0);
      backupNowSpecifiers = self->_backupNowSpecifiers;
      self->_backupNowSpecifiers = v41;
    }
    backupSpecifierProvider = self->_backupSpecifierProvider;
    if (!backupSpecifierProvider)
    {
      v44 = (AAUISpecifierProvider *)[objc_alloc(MEMORY[0x263F88A18]) initWithAccount:self->_account presenter:self];
      v45 = self->_backupSpecifierProvider;
      self->_backupSpecifierProvider = v44;

      backupSpecifierProvider = self->_backupSpecifierProvider;
    }
    v46 = [(AAUISpecifierProvider *)backupSpecifierProvider specifiers];
    uint64_t v47 = [v46 count];

    if (v47)
    {
      v48 = [(AAUISpecifierProvider *)self->_backupSpecifierProvider specifiers];
      [v6 addObjectsFromArray:v48];
    }
    v49 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    self->_finishedInitialLoad = 1;
    BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)prepareAlertForBackupDisabledDomainAndShow:(BOOL)a3
{
  self->_needToShowPopupAlertForBackup = a3;
  if (!self->_isFetchingDomainInfo)
  {
    self->_isFetchingDomainInfo = 1;
    id PSGBackupUtilsClass_0 = getPSGBackupUtilsClass_0();
    backupManager = self->_backupManager;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __70__ICSBackupViewController_prepareAlertForBackupDisabledDomainAndShow___block_invoke;
    v6[3] = &unk_2655B5FB8;
    v6[4] = self;
    [PSGBackupUtilsClass_0 fetchBackupDisabledAppsWithBackupManager:backupManager completion:v6];
  }
}

void __70__ICSBackupViewController_prepareAlertForBackupDisabledDomainAndShow___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1568), a2);
  *(unsigned char *)(*(void *)(a1 + 32) + 1521) = 0;
  BOOL v4 = *(unsigned char **)(a1 + 32);
  if (v4[1522])
  {
    [v4 showPopUpAlertForBackupDisabledApps];
    *(unsigned char *)(*(void *)(a1 + 32) + 1522) = 0;
  }
}

- (BOOL)policyPreventsBackup
{
  unint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53858]] == 2;

  return v3;
}

- (void)fetchIsBackupEnabled
{
  backup_state_queue = self->_backup_state_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ICSBackupViewController_fetchIsBackupEnabled__block_invoke;
  block[3] = &unk_2655B5688;
  void block[4] = self;
  dispatch_async(backup_state_queue, block);
}

void __47__ICSBackupViewController_fetchIsBackupEnabled__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) isBackupEnabled];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__ICSBackupViewController_fetchIsBackupEnabled__block_invoke_2;
  v3[3] = &unk_2655B5FE0;
  char v4 = v2;
  v3[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __47__ICSBackupViewController_fetchIsBackupEnabled__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    int v5 = 136315394;
    char v6 = "-[ICSBackupViewController fetchIsBackupEnabled]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "%s, Caching backup enabled: %d, reloading", (uint8_t *)&v5, 0x12u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1429) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (BOOL)isBackupEnabled
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  if ([(ICSBackupViewController *)self policyPreventsBackup])
  {
    int v3 = LogSubsystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "Backup not enabled because policy prevents backup", (uint8_t *)&v7, 2u);
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [(MBManager *)self->_backupManager isBackupEnabled];
    int v3 = LogSubsystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      backupManager = self->_backupManager;
      int v7 = 136315650;
      int v8 = "-[ICSBackupViewController isBackupEnabled]";
      __int16 v9 = 1024;
      int v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = backupManager;
      _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "%s, returning: %d, backup manager: %@", (uint8_t *)&v7, 0x1Cu);
    }
  }

  return v4;
}

- (id)cachedIsBackupEnabledNumber
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL backupEnabled = self->_backupEnabled;
    int v7 = 136315394;
    int v8 = "-[ICSBackupViewController cachedIsBackupEnabledNumber]";
    __int16 v9 = 1024;
    BOOL v10 = backupEnabled;
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", (uint8_t *)&v7, 0x12u);
  }

  int v5 = [NSNumber numberWithBool:self->_backupEnabled];

  return v5;
}

- (void)_setBackupEnabled:(BOOL)a3 passcode:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = LogSubsystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[ICSBackupViewController _setBackupEnabled:passcode:]";
    __int16 v27 = 1024;
    BOOL v28 = v4;
    _os_log_impl(&dword_262993000, v7, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
  }

  if (v4)
  {
    [(ICSBackupViewController *)self _persistBackupEnablementState:1 passcode:v6];
  }
  else
  {
    int v8 = (void *)MEMORY[0x263F82418];
    __int16 v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v10 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DISABLE_WARNING_MESSAGE"];
    uint64_t v11 = [v9 localizedStringForKey:v10 value:&stru_270DEF3F8 table:@"Localizable-Backup"];
    uint64_t v12 = [v8 alertControllerWithTitle:0 message:v11 preferredStyle:0];

    uint64_t v13 = (void *)MEMORY[0x263F82400];
    id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v15 = [v14 localizedStringForKey:@"DISABLE_CONFIRM" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __54__ICSBackupViewController__setBackupEnabled_passcode___block_invoke;
    v22[3] = &unk_2655B6008;
    v22[4] = self;
    char v24 = 0;
    id v23 = v6;
    int v16 = [v13 actionWithTitle:v15 style:2 handler:v22];
    [v12 addAction:v16];

    __int16 v17 = (void *)MEMORY[0x263F82400];
    int v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v19 = [v18 localizedStringForKey:@"DISABLE_CANCEL" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __54__ICSBackupViewController__setBackupEnabled_passcode___block_invoke_431;
    v21[3] = &unk_2655B5C40;
    v21[4] = self;
    __int16 v20 = [v17 actionWithTitle:v19 style:1 handler:v21];
    [v12 addAction:v20];

    [(ICSBackupViewController *)self presentViewController:v12 animated:1 completion:&__block_literal_global_4];
  }
}

uint64_t __54__ICSBackupViewController__setBackupEnabled_passcode___block_invoke(uint64_t a1)
{
  char v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "Confirmed disable backup", v4, 2u);
  }

  return [*(id *)(a1 + 32) _persistBackupEnablementState:*(unsigned __int8 *)(a1 + 48) passcode:*(void *)(a1 + 40)];
}

uint64_t __54__ICSBackupViewController__setBackupEnabled_passcode___block_invoke_431(uint64_t a1)
{
  char v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "User cancelled disable backup", v4, 2u);
  }

  [*(id *)(a1 + 32) reloadSpecifiers];
  return [*(id *)(*(void *)(a1 + 32) + 1512) sendBackupToggleEventWithActionType:2];
}

void __54__ICSBackupViewController__setBackupEnabled_passcode___block_invoke_432()
{
  v0 = LogSubsystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_262993000, v0, OS_LOG_TYPE_DEFAULT, "Presenting confirmation alert for Turn off iCloud Backup", v1, 2u);
  }
}

- (void)_persistBackupEnablementState:(BOOL)a3 passcode:(id)a4
{
  BOOL v4 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = LogSubsystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ICSBackupViewController _persistBackupEnablementState:passcode:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_262993000, v7, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
  }

  [(ICSBackupStatusView *)self->_backupStatusView setFooterText:0];
  [(ICSBackupStatusView *)self->_backupStatusView setBackupError:0];
  if (!v4)
  {
    backupNowButton = self->_backupNowButton;
    __int16 v9 = [NSNumber numberWithBool:0];
    uint64_t v10 = *MEMORY[0x263F600A8];
    [(PSSpecifier *)backupNowButton setProperty:v9 forKey:*MEMORY[0x263F600A8]];

    [(ICSBackupViewController *)self reloadSpecifier:self->_backupNowButton];
    [(PSSpecifier *)self->_backupOverCellularSwitch setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v10];
    [(ICSBackupViewController *)self reloadSpecifier:self->_backupOverCellularSwitch];
  }
  uint64_t v11 = [(ICSBackupViewController *)self view];
  uint64_t v12 = [v11 window];
  [v12 setUserInteractionEnabled:0];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  id v31 = objc_alloc_init(MEMORY[0x263F82AE8]);
  [*(id *)(*(void *)&buf[8] + 40) setAutoresizingMask:45];
  [*(id *)(*(void *)&buf[8] + 40) setFontSize:16];
  uint64_t v13 = *(void **)(*(void *)&buf[8] + 40);
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v4) {
    [v14 localizedStringForKey:@"TURNING_ON_BACKUP" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  }
  else {
  char v15 = [v14 localizedStringForKey:@"TURNING_OFF_BACKUP" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  }
  [v13 setText:v15];

  dispatch_time_t v16 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke;
  block[3] = &unk_2655B6030;
  void block[4] = self;
  void block[5] = buf;
  dispatch_after(v16, MEMORY[0x263EF83A0], block);
  backup_state_queue = self->_backup_state_queue;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  int v21 = __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_2;
  uint64_t v22 = &unk_2655B6080;
  id v23 = self;
  BOOL v26 = v4;
  id v18 = v6;
  id v24 = v18;
  v25 = buf;
  dispatch_async(backup_state_queue, &v19);
  -[ICSAnalyticsController sendBackupToggleEventWithActionType:](self->_analyticsController, "sendBackupToggleEventWithActionType:", 1, v19, v20, v21, v22, v23);

  _Block_object_dispose(buf, 8);
}

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v2 = [*(id *)(a1 + 32) table];
    uint64_t v3 = [v2 superview];
    if (v3)
    {
      BOOL v4 = (void *)v3;
      id v6 = v2;
      do
      {
        id v5 = v6;

        id v6 = v4;
        BOOL v4 = [v6 superview];

        id v2 = v5;
      }
      while (v4);
    }
    else
    {
      id v6 = v2;
      id v5 = v2;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) showInView:v5];
  }
}

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  [*(id *)(*(void *)(a1 + 32) + 1392) setBackupEnabled:*(unsigned __int8 *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1392);
    id v19 = 0;
    char v4 = [v3 setupBackupWithPasscode:v2 error:&v19];
    id v5 = v19;
    *((unsigned char *)v21 + 24) = v4;
    if (v5)
    {
      id v6 = LogSubsystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_2_cold_1();
      }
    }
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  dispatch_time_t v16 = __Block_byref_object_copy__2;
  __int16 v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  if (*((unsigned char *)v21 + 24))
  {
    int v7 = [MEMORY[0x263EFB210] defaultStore];
    [*(id *)(*(void *)(a1 + 32) + 1384) setEnabled:*(unsigned __int8 *)(a1 + 56) forDataclass:*MEMORY[0x263EFB3B8]];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 1384);
    __int16 v9 = (id *)(v14 + 5);
    id obj = (id)v14[5];
    [v7 saveVerifiedAccount:v8 error:&obj];
    objc_storeStrong(v9, obj);
    *((unsigned char *)v21 + 24) = v14[5] == 0;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_441;
  v11[3] = &unk_2655B6058;
  uint64_t v10 = *(void *)(a1 + 48);
  v11[4] = *(void *)(a1 + 32);
  void v11[5] = v10;
  v11[6] = &v20;
  v11[7] = &v13;
  dispatch_async(MEMORY[0x263EF83A0], v11);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v20, 8);
}

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_441(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) hide];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  char v4 = [*(id *)(a1 + 32) view];
  id v5 = [v4 window];
  [v5 setUserInteractionEnabled:1];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v8 = LogSubsystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_441_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    dispatch_time_t v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_270DEF3F8 table:@"Localizable-Backup"];

    __int16 v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v18 = [v17 localizedStringForKey:@"TRY_AGAIN" value:&stru_270DEF3F8 table:@"Localizable-Backup"];

    id v19 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) domain];
    if ([v19 isEqualToString:@"MBErrorDomain"])
    {
      if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) code] == 300)
      {
      }
      else
      {
        uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) code];

        if (v21 != 308)
        {
          uint64_t v20 = @"ERROR_ENABLING_BACKUP_DETAILS";
          goto LABEL_17;
        }
      }
      id v22 = objc_alloc_init(MEMORY[0x263F255D8]);
      int v23 = [v22 airplaneMode];

      if (v23)
      {
        SFLocalizableWAPIStringKeyForKey();
        uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v20 = @"ERROR_ENABLING_BACKUP_NETWORK";
      }
      id v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v25 = [v24 localizedStringForKey:@"OK" value:&stru_270DEF3F8 table:@"Localizable-Backup"];

      id v19 = v18;
      dispatch_time_t v16 = (void *)v25;
      id v18 = 0;
    }
    else
    {
      uint64_t v20 = @"ERROR_ENABLING_BACKUP_DETAILS";
    }

LABEL_17:
    BOOL v26 = (void *)MEMORY[0x263F82418];
    __int16 v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v28 = [v27 localizedStringForKey:@"ERROR_ENABLING_BACKUP" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
    uint64_t v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringForKey:v20 value:&stru_270DEF3F8 table:@"Localizable-Backup"];
    id v31 = [v26 alertControllerWithTitle:v28 message:v30 preferredStyle:1];

    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_467;
    v35[3] = &unk_2655B5C40;
    v35[4] = *(void *)(a1 + 32);
    uint64_t v32 = [MEMORY[0x263F82400] actionWithTitle:v16 style:1 handler:v35];
    [v31 addAction:v32];

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_468;
    v34[3] = &unk_2655B5C40;
    v34[4] = *(void *)(a1 + 32);
    v33 = [MEMORY[0x263F82400] actionWithTitle:v18 style:0 handler:v34];
    [v31 addAction:v33];

    [*(id *)(a1 + 32) presentViewController:v31 animated:1 completion:0];
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F5FE78]));
  [WeakRetained reloadSpecifiers];

  int v7 = *(void **)(a1 + 32);

  [v7 checkIfNetworkSupportsBackup];
}

uint64_t __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_467(uint64_t a1)
{
  uint64_t v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "Reload specifier with specifier ID 'BACKUP_ENABLED_SWITCH'", v4, 2u);
  }

  return [*(id *)(a1 + 32) reloadSpecifierID:@"BACKUP_ENABLED_SWITCH" animated:1];
}

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_468(uint64_t a1)
{
  uint64_t v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "Enabling backup with specifier ID 'BACKUP_ENABLED_SWITCH'", v5, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  char v4 = [v3 specifierForID:@"BACKUP_ENABLED_SWITCH"];
  [v3 _enableBackupWithSpecifier:v4];
}

- (id)isBackupOverCellularEnabled
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  backupManager = self->_backupManager;
  id v9 = 0;
  uint64_t v3 = [(MBManager *)backupManager isBackupOnCellularEnabledWithError:&v9];
  char v4 = (char *)v9;
  if (v4)
  {
    id v5 = LogSubsystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v4;
      _os_log_impl(&dword_262993000, v5, OS_LOG_TYPE_DEFAULT, "Failed to fetch BackupOnCellularEnabled: %@", buf, 0xCu);
    }
  }
  id v6 = LogSubsystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[ICSBackupViewController isBackupOverCellularEnabled]";
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
  }

  int v7 = [NSNumber numberWithBool:v3];

  return v7;
}

- (void)setBackupOverCellularEnabled:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  backupManager = self->_backupManager;
  id v13 = 0;
  int v6 = -[MBManager setBackupOnCellularEnabled:error:](backupManager, "setBackupOnCellularEnabled:error:", [v4 BOOLValue], &v13);
  id v7 = v13;
  uint64_t v8 = LogSubsystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      uint64_t v10 = "Successfully set BackupOnCellularEnabled: %@";
      uint64_t v11 = v8;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_262993000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
  else if (v9)
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    id v17 = v7;
    uint64_t v10 = "Failed to set BackupOnCellularEnabled: %@: %@";
    uint64_t v11 = v8;
    uint32_t v12 = 22;
    goto LABEL_6;
  }

  [(ICSBackupViewController *)self checkIfNetworkSupportsBackup];
}

- (void)didAcceptEnteredPIN:(id)a3
{
}

- (void)didCancelEnteringPIN
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = LogSubsystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[ICSBackupViewController didCancelEnteringPIN]";
    _os_log_impl(&dword_262993000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(ICSBackupViewController *)self specifierForID:@"BACKUP_ENABLED_SWITCH"];
  [(ICSBackupViewController *)self reloadSpecifier:v4 animated:1];
}

- (void)_enableBackupWithSpecifier:(id)a3
{
}

- (void)_disableBackupWithSpecifier:(id)a3
{
}

- (void)_backupEnabledSwitchCancelled:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = LogSubsystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ICSBackupViewController _backupEnabledSwitchCancelled:]";
    _os_log_impl(&dword_262993000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(ICSBackupViewController *)self reloadSpecifier:v4 animated:1];
}

- (void)setBackupEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LogSubsystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[ICSBackupViewController setBackupEnabled:specifier:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "%s, enabled: %@", (uint8_t *)&v9, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[ICSBackupViewController setBackupEnabled:specifier:]();
  }
  [(ICSAnalyticsController *)self->_analyticsController sendBackupToggleEventWithActionType:0];
  if ([v6 BOOLValue]) {
    [(ICSBackupViewController *)self _enableBackupWithSpecifier:v7];
  }
  else {
    [(ICSBackupViewController *)self _disableBackupWithSpecifier:v7];
  }
}

- (void)openBackupHelpPage:(id)a3
{
  objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = NSURL;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"BACKUP_HELP_PAGE_URL" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  id v6 = [v3 URLWithString:v5];
  [v7 openURL:v6 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (void)updateiCloudBackupAndSyncProgressWithAllowDecrease:(BOOL)a3
{
  if (self->_icloudBackupProgress >= 0.0199999996) {
    double icloudBackupProgress = self->_icloudBackupProgress;
  }
  else {
    double icloudBackupProgress = 0.0199999996;
  }
  if (a3 || ([(ICSBackupStatusView *)self->_backupStatusView progress], icloudBackupProgress >= v5))
  {
    backupStatusView = self->_backupStatusView;
    double v7 = (double)(60 * self->_estimateTimeRemaining);
    [(ICSBackupStatusView *)backupStatusView setBackupProgress:icloudBackupProgress timeIntervalRemaining:v7];
  }
}

- (void)setLastBackupDateString:(id)a3
{
  [(ICSBackupStatusView *)self->_backupStatusView setLastBackupText:a3];
  [(ICSBackupViewController *)self beginUpdates];

  [(ICSBackupViewController *)self endUpdates];
}

- (id)dateStringOfLatestBackup
{
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = SFLocalizableWAPIStringKeyForKey();
  double v5 = [v3 localizedStringForKey:v4 value:&stru_270DEF3F8 table:@"Localizable-Backup"];

  id v6 = (void *)MEMORY[0x263F08790];
  double v7 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v8 = [v6 dateFormatFromTemplate:@"j" options:0 locale:v7];

  uint64_t v9 = [v8 rangeOfString:@"H"];
  uint64_t v10 = [(MBManager *)self->_backupManager dateOfLastBackup];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F08790]);
    id v12 = [MEMORY[0x263EFF8F0] currentCalendar];
    int v13 = objc_msgSend(v10, "ics_isTodayWithCalendar:", v12);

    if (v13) {
      BOOL v14 = v9 == 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      [v11 setTimeStyle:1];
      [v11 setDateStyle:0];
      uint64_t v25 = NSString;
      BOOL v26 = (void *)MEMORY[0x263F086E0];
    }
    else
    {
      id v15 = [MEMORY[0x263EFF960] currentLocale];
      __int16 v16 = [v15 localeIdentifier];
      int v17 = [v16 isEqualToString:@"en_US"];

      [v11 setDoesRelativeDateFormatting:1];
      if (v17)
      {
        [v11 setDateStyle:1];
        id v18 = objc_alloc_init(MEMORY[0x263F08790]);
        [v18 setTimeStyle:1];
        id v19 = NSString;
        uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v21 = [v20 localizedStringForKey:@"LAST_BACKUP_DATE_AT_TIME" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
        uint64_t v22 = [v11 stringFromDate:v10];
        int v23 = [v18 stringFromDate:v10];
        uint64_t v24 = objc_msgSend(v19, "localizedStringWithFormat:", v21, v22, v23);

        double v5 = (void *)v22;
LABEL_11:

        double v5 = (void *)v24;
        goto LABEL_12;
      }
      [v11 setDateStyle:3];
      [v11 setTimeStyle:1];
      [v11 setFormattingContext:1];
      uint64_t v25 = NSString;
      BOOL v26 = (void *)MEMORY[0x263F086E0];
    }
    id v18 = [v26 bundleForClass:objc_opt_class()];
    uint64_t v20 = [v18 localizedStringForKey:@"LAST_BACKUP_DATE_OR_TIME" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
    uint64_t v21 = [v11 stringFromDate:v10];
    uint64_t v24 = objc_msgSend(v25, "localizedStringWithFormat:", v20, v21);
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (void)updateLastBackupDateInvalidatePrevious:(BOOL)a3
{
  if (a3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke;
    block[3] = &unk_2655B5688;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  backup_state_queue = self->_backup_state_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke_2;
  v5[3] = &unk_2655B5688;
  v5[4] = self;
  dispatch_async(backup_state_queue, v5);
}

void __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v2 = [v3 localizedStringForKey:@"DETERMINING_LAST_BACKUP" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  [v1 setLastBackupDateString:v2];
}

void __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dateStringOfLatestBackup];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke_3;
  v4[3] = &unk_2655B5900;
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

uint64_t __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLastBackupDateString:*(void *)(a1 + 40)];
}

- (void)updateLastBackupDate
{
}

- (id)_backgroundRestoreInfoText:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v19 = 0;
    goto LABEL_41;
  }
  id v5 = objc_msgSend(MEMORY[0x263F086F0], "stringFromByteCount:countStyle:", objc_msgSend(v3, "bytesRemaining"), 1);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  unsigned int v7 = [v4 dataClassesRemaining];
  int v8 = (v7 >> 5) & 1;
  if ((v7 & 0x20) != 0) {
    [v6 addObject:@"APPDATA"];
  }
  if ([v4 dataClassesRemaining])
  {
    [v6 addObject:@"PHOTOS"];
    int v8 = 1;
  }
  if (([v4 dataClassesRemaining] & 0x10) != 0)
  {
    [v6 addObject:@"MESSAGES"];
    int v8 = 1;
  }
  if (([v4 dataClassesRemaining] & 4) != 0)
  {
    [v6 addObject:@"RINGTONES"];
    int v8 = 1;
  }
  if (([v4 dataClassesRemaining] & 8) != 0) {
    [v6 addObject:@"MEDIA"];
  }
  if (([v4 dataClassesRemaining] & 2) != 0) {
    [v6 addObject:@"BOOKS"];
  }
  if (([v4 dataClassesRemaining] & 0x40) != 0)
  {
    [v6 addObject:@"FILES"];
    int v8 = 1;
  }
  if ([v6 count])
  {
    uint64_t v29 = v5;
    uint64_t v9 = (void *)[@"RESTORING" mutableCopy];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          [v9 appendFormat:@"_%@", *(void *)(*((void *)&v30 + 1) + 8 * i)];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v12);
    }

    id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v16 = [v15 localizedStringForKey:v9 value:&stru_270DEF3F8 table:@"Localizable-Backup"];

    if (v8)
    {
      id v5 = v29;
      if ((unint64_t)[v4 bytesRemaining] > 0xF423F)
      {
        if (![v4 bytesRemaining])
        {
          id v18 = 0;
LABEL_36:

          if (v16) {
            goto LABEL_37;
          }
LABEL_30:
          id v19 = &stru_270DEF3F8;
          if (!v18) {
            goto LABEL_40;
          }
          goto LABEL_38;
        }
        id v25 = [NSString alloc];
        int v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        BOOL v26 = [v17 localizedStringForKey:@"BYTES_REMAINING" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
        id v18 = objc_msgSend(v25, "initWithFormat:", v26, v29);
      }
      else
      {
        int v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v18 = [v17 localizedStringForKey:@"LESS_THAN_1MB_REMAINING" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
      }
    }
    else
    {
      int v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v23 = [v17 localizedStringForKey:@"RESTORING_PERIOD" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
      uint64_t v24 = [v16 stringByAppendingString:v23];

      id v18 = 0;
      __int16 v16 = (void *)v24;
      id v5 = v29;
    }

    goto LABEL_36;
  }
  if (![v4 bytesRemaining])
  {
    __int16 v16 = 0;
    id v19 = &stru_270DEF3F8;
    goto LABEL_40;
  }
  id v20 = [NSString alloc];
  uint64_t v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v22 = [v21 localizedStringForKey:@"RESTORE_IN_PROGRESS" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  __int16 v16 = objc_msgSend(v20, "initWithFormat:", v22, v5);

  id v18 = 0;
  if (!v16) {
    goto LABEL_30;
  }
LABEL_37:
  id v19 = [&stru_270DEF3F8 stringByAppendingString:v16];
  if (v18)
  {
LABEL_38:
    __int16 v27 = [(__CFString *)v19 stringByAppendingString:@" "];

    id v19 = [v27 stringByAppendingString:v18];
  }
LABEL_40:

LABEL_41:

  return v19;
}

- (void)_updateToBackupState:(int)a3 backupError:(id)a4 progress:(float)a5 timeRemaining:(unint64_t)a6 restoreStateInfo:(id)a7 backgroundRestoreInfo:(id)a8 backupEnabled:(BOOL)a9
{
  uint64_t v9 = a9;
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v16 = a4;
  id v86 = a7;
  id v85 = a8;
  int v17 = [(ICSBackupStatusView *)self->_backupStatusView backupError];
  if (!v16 || v17)
  {
  }
  else if ([v16 code] != 202)
  {
    id v18 = LogSubsystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v88 = v16;
      _os_log_impl(&dword_262993000, v18, OS_LOG_TYPE_DEFAULT, "Setting error from backup state: %@", buf, 0xCu);
    }

    [(ICSBackupStatusView *)self->_backupStatusView setBackupError:v16];
  }
  self->_backupState = a3;
  self->_BOOL backupEnabled = v9;
  v83 = [(ICSBackupViewController *)self specifierForID:@"BACKUP_ENABLED_SWITCH"];
  id v19 = (uint64_t *)MEMORY[0x263F600A8];
  id v80 = v16;
  unsigned int v82 = v9;
  if (a3 > 6)
  {
    long long v30 = LogSubsystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v88) = a3;
      _os_log_impl(&dword_262993000, v30, OS_LOG_TYPE_DEFAULT, "Got an unknown state from backup manager: %i", buf, 8u);
    }

    long long v31 = LogSubsystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v88) = a3;
      _os_log_impl(&dword_262993000, v31, OS_LOG_TYPE_DEFAULT, "Got an unknown state from backup manager: %i", buf, 8u);
    }
    unsigned int v79 = a3;

    uint64_t v32 = *v19;
    long long v33 = [(PSSpecifier *)self->_backupNowButton propertyForKey:*v19];
    uint64_t v9 = [v33 BOOLValue];

    v34 = [v83 propertyForKey:v32];
    uint64_t v25 = [v34 BOOLValue];
  }
  else
  {
    if (((1 << a3) & 0x39) != 0)
    {
LABEL_10:
      if (self->_backupNowButton)
      {
        id v20 = LogSubsystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_262993000, v20, OS_LOG_TYPE_DEFAULT, "Setting backup now button as backup now button", buf, 2u);
        }

        backupNowButton = self->_backupNowButton;
        uint64_t v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        int v23 = [v22 localizedStringForKey:@"BACKUP_NOW" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
        [(PSSpecifier *)backupNowButton setName:v23];

        [(PSSpecifier *)self->_backupNowButton setButtonAction:sel_beginBackup_];
      }
      unsigned int v79 = a3;
      if (![(NSNumber *)self->_networkSupportsBackup BOOLValue])
      {
        uint64_t v24 = LogSubsystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_262993000, v24, OS_LOG_TYPE_DEFAULT, "Network does not support backup - backup button disabled", buf, 2u);
        }

        uint64_t v9 = 0;
      }
      uint64_t v25 = 1;
      goto LABEL_30;
    }
    if (((1 << a3) & 6) == 0)
    {
      if (self->_backupCancelled)
      {
        [(ICSBackupStatusView *)self->_backupStatusView setBackupError:0];
        a3 = 0;
      }
      else
      {
        a3 = 6;
      }
      goto LABEL_10;
    }
    if (self->_backupNowButton)
    {
      BOOL v26 = LogSubsystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_262993000, v26, OS_LOG_TYPE_DEFAULT, "Setting backup now button as cancel button", buf, 2u);
      }

      __int16 v27 = self->_backupNowButton;
      BOOL v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v29 = [v28 localizedStringForKey:@"CANCEL_BACKUP" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
      [(PSSpecifier *)v27 setName:v29];

      [(PSSpecifier *)self->_backupNowButton setButtonAction:sel_cancelBackup_];
    }
    unsigned int v79 = a3;
    self->_estimateTimeRemaining = a6;
    self->_double icloudBackupProgress = a5;
    uint64_t v25 = 1;
    [(ICSBackupViewController *)self updateiCloudBackupAndSyncProgressWithAllowDecrease:1];
    uint64_t v9 = 1;
  }
LABEL_30:
  unsigned int v84 = [v86 state];
  unsigned int v81 = v84 - 1;
  if (v84 - 1 > 1)
  {
    if ([(NSNumber *)self->_networkSupportsBackup BOOLValue])
    {
      [(ICSBackupStatusView *)self->_backupStatusView setFooterText:0];
    }
    else
    {
      BOOL isManualBackupOnCellularAllowed = self->_isManualBackupOnCellularAllowed;
      backupStatusView = self->_backupStatusView;
      v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      SFLocalizableWAPIStringKeyForKey();
      if (isManualBackupOnCellularAllowed) {
        uint64_t v54 = {;
      }
        uint64_t v55 = [v53 localizedStringForKey:v54 value:&stru_270DEF3F8 table:@"Localizable-Backup"];
        [(ICSBackupStatusView *)backupStatusView setFooterText:v55];
      }
      else {
        uint64_t v56 = {;
      }
        v57 = [v53 localizedStringForKey:v56 value:&stru_270DEF3F8 table:@"Localizable-Backup"];
        [(ICSBackupStatusView *)backupStatusView setFooterText:v57];
      }
    }
    uint64_t v35 = &off_262B09000;
  }
  else
  {
    uint64_t v9 = !self->_backupCancelled;
    uint64_t v35 = &off_262B09000;
    if (self->_backupCancelled)
    {
      v36 = LogSubsystem();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_262993000, v36, OS_LOG_TYPE_DEFAULT, "Backup cancelled - backup button disabled", buf, 2u);
      }
    }
    v37 = LogSubsystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v88) = v84 == 1;
      _os_log_impl(&dword_262993000, v37, OS_LOG_TYPE_DEFAULT, "restoreState starting: %d", buf, 8u);
    }

    v38 = LogSubsystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v88) = v84 == 2;
      _os_log_impl(&dword_262993000, v38, OS_LOG_TYPE_DEFAULT, "restoreState running: %d", buf, 8u);
    }

    v39 = LogSubsystem();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v39, OS_LOG_TYPE_DEFAULT, "Disabling Backup Switch", buf, 2u);
    }

    if (self->_backupNowButton)
    {
      v40 = LogSubsystem();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_262993000, v40, OS_LOG_TYPE_DEFAULT, "Setting backup now button as stop restoring button", buf, 2u);
      }

      v41 = self->_backupNowButton;
      v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v43 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"STOP_RESTORING"];
      v44 = [v42 localizedStringForKey:v43 value:&stru_270DEF3F8 table:@"Localizable-Backup"];
      [(PSSpecifier *)v41 setName:v44];

      [(PSSpecifier *)self->_backupNowButton setButtonAction:sel_cancelRestore_];
      uint64_t v35 = &off_262B09000;
    }
    if ([(NSNumber *)self->_networkSupportsBackup BOOLValue])
    {
      if (self->_thermalSupportsBackup) {
        v45 = @"DEVICE_IS_BEING_RESTORED";
      }
      else {
        v45 = @"DEVICE_RESTORE_PAUSED_THERMAL";
      }
    }
    else
    {
      SFLocalizableWAPIStringKeyForKey();
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v46 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v47 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:v45];
    v48 = [v46 localizedStringForKey:v47 value:&stru_270DEF3F8 table:@"Localizable-Backup"];

    v49 = [(ICSBackupViewController *)self _backgroundRestoreInfoText:v85];
    if (v49)
    {
      uint64_t v50 = [NSString stringWithFormat:@"%@\n\n%@", v48, v49];

      v48 = (void *)v50;
    }
    [(ICSBackupStatusView *)self->_backupStatusView setFooterText:v48];

    uint64_t v25 = 0;
  }
  int v58 = [MEMORY[0x263F82438] isRunningInStoreDemoMode];
  BOOL v59 = [(ICSBackupViewController *)self policyPreventsBackup];
  BOOL v60 = v59;
  if ((v58 & 1) != 0 || v59)
  {
    v61 = LogSubsystem();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = *((void *)v35 + 90);
      LODWORD(v88) = v58;
      _os_log_impl(&dword_262993000, v61, OS_LOG_TYPE_DEFAULT, "Store Demo Mode Enabled: %d", buf, 8u);
    }

    v62 = LogSubsystem();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = *((void *)v35 + 90);
      LODWORD(v88) = v60;
      _os_log_impl(&dword_262993000, v62, OS_LOG_TYPE_DEFAULT, "Policy Prevents Backup: %d", buf, 8u);
    }

    uint64_t v25 = 0;
    uint64_t v9 = 0;
  }
  v63 = self->_backupNowButton;
  v64 = [NSNumber numberWithBool:v9];
  uint64_t v65 = *MEMORY[0x263F600A8];
  [(PSSpecifier *)v63 setProperty:v64 forKey:*MEMORY[0x263F600A8]];

  v66 = LogSubsystem();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((void *)v35 + 90);
    LODWORD(v88) = v9;
    _os_log_impl(&dword_262993000, v66, OS_LOG_TYPE_DEFAULT, "Backup Button Enabled: %d", buf, 8u);
  }

  v67 = [NSNumber numberWithBool:v25];
  [(PSSpecifier *)self->_backupOverCellularSwitch setObject:v67 forKeyedSubscript:v65];

  v68 = LogSubsystem();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((void *)v35 + 90);
    LODWORD(v88) = v25;
    _os_log_impl(&dword_262993000, v68, OS_LOG_TYPE_DEFAULT, "BackupOverCellular Switch Enabled: %d", buf, 8u);
  }

  v69 = [NSNumber numberWithBool:v25];
  [v83 setProperty:v69 forKey:v65];

  v70 = LogSubsystem();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((void *)v35 + 90);
    LODWORD(v88) = v25;
    _os_log_impl(&dword_262993000, v70, OS_LOG_TYPE_DEFAULT, "Backup Switch Enabled: %d", buf, 8u);
  }

  [(ICSBackupViewController *)self beginUpdates];
  uint64_t v71 = [(ICSBackupViewController *)self indexOfSpecifier:self->_backupNowButton];
  if (v81 < 2 || (v82 & 1) != 0 || v71 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v72 = v80;
    uint64_t v73 = v79;
    if (((v82 & 1) != 0 || v81 <= 1) && v71 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v74 = objc_opt_new();
      v75 = v74;
      if (self->_isAutoBackupOnCellularAllowed && self->_backupOverCellularSpecifiers) {
        objc_msgSend(v74, "addObjectsFromArray:");
      }
      if (self->_backupEnabled && self->_backupTipSpecifiers) {
        objc_msgSend(v75, "addObjectsFromArray:");
      }
      if (self->_backupNowSpecifiers) {
        objc_msgSend(v75, "addObjectsFromArray:");
      }
      [(ICSBackupViewController *)self insertContiguousSpecifiers:v75 afterSpecifier:v83 animated:1];
      [(ICSBackupStatusView *)self->_backupStatusView setAlpha:1.0];
    }
    else
    {
      [(ICSBackupViewController *)self reloadSpecifier:self->_backupOverCellularSwitch animated:1];
      [(ICSBackupViewController *)self reloadSpecifier:self->_backupNowButton animated:1];
    }
  }
  else
  {
    [(ICSBackupViewController *)self removeContiguousSpecifiers:self->_backupNowSpecifiers animated:1];
    v72 = v80;
    uint64_t v73 = v79;
    if (self->_isAutoBackupOnCellularAllowed) {
      [(ICSBackupViewController *)self removeContiguousSpecifiers:self->_backupOverCellularSpecifiers animated:1];
    }
  }
  [(ICSBackupViewController *)self reloadSpecifier:v83 animated:1];
  [(ICSBackupStatusView *)self->_backupStatusView updateViewsForBackupState:v73 restoreState:v84 enabled:v82];
  [(ICSBackupViewController *)self endUpdates];
  if (v72 && v73 == 3 && v82)
  {
    v76 = [v72 domain];
    if (![v76 isEqualToString:@"MBErrorDomain"])
    {
LABEL_101:

      goto LABEL_102;
    }
    uint64_t v77 = [v72 code];

    if (v77 == 303)
    {
      v78 = LogSubsystem();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_262993000, v78, OS_LOG_TYPE_DEFAULT, "iCloud backup failed due to insufficiebnt storage. Posting quota change notification.", buf, 2u);
      }

      v76 = [MEMORY[0x263F08A00] defaultCenter];
      [v76 postNotificationName:*MEMORY[0x263F88858] object:0];
      goto LABEL_101;
    }
  }
LABEL_102:
}

- (void)_updateToBackupState:(id)a3 restoreState:(id)a4 backgroundRestoreState:(id)a5 backupEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v12 state];
  id v18 = [v12 error];
  [v12 progress];
  int v15 = v14;
  uint64_t v16 = [v12 estimatedTimeRemaining];

  LODWORD(v17) = v15;
  [(ICSBackupViewController *)self _updateToBackupState:v13 backupError:v18 progress:v16 timeRemaining:v11 restoreStateInfo:v10 backgroundRestoreInfo:v6 backupEnabled:v17];
}

- (void)updateBusyState
{
  int backupState = self->_backupState;
  objc_initWeak(&location, self);
  backup_state_queue = self->_backup_state_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__ICSBackupViewController_updateBusyState__block_invoke;
  v5[3] = &unk_2655B60D0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  int v7 = backupState;
  dispatch_async(backup_state_queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__ICSBackupViewController_updateBusyState__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained isBackupEnabled];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 1392) backupState];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 1392) restoreState];
  int v7 = [*(id *)(*(void *)(a1 + 32) + 1392) backgroundRestoreInfo];
  int v8 = LogSubsystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 136316162;
    uint64_t v22 = "-[ICSBackupViewController updateBusyState]_block_invoke";
    __int16 v23 = 1024;
    int v24 = v4;
    __int16 v25 = 1024;
    int v26 = v9;
    __int16 v27 = 1024;
    int v28 = [v5 state];
    __int16 v29 = 1024;
    int v30 = [v6 state];
    _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "%s, isBackupEnabled: %d, entryState: %d, backupState: %d, restoreState: %d", buf, 0x24u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__ICSBackupViewController_updateBusyState__block_invoke_573;
  v14[3] = &unk_2655B60A8;
  objc_copyWeak(&v18, v2);
  uint64_t v10 = *(void *)(a1 + 32);
  int v19 = *(_DWORD *)(a1 + 48);
  v14[4] = v10;
  id v15 = v5;
  id v16 = v6;
  id v17 = v7;
  char v20 = v4;
  id v11 = v7;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v14);

  objc_destroyWeak(&v18);
}

void __42__ICSBackupViewController_updateBusyState__block_invoke_573(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_DWORD *)(*(void *)(a1 + 32) + 1400) == *(_DWORD *)(a1 + 72))
    {
      [WeakRetained _updateToBackupState:*(void *)(a1 + 40) restoreState:*(void *)(a1 + 48) backgroundRestoreState:*(void *)(a1 + 56) backupEnabled:*(unsigned __int8 *)(a1 + 76)];
    }
    else
    {
      int v4 = LogSubsystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 1400);
        v6[0] = 67109120;
        v6[1] = v5;
        _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Skipping update, current backup state: %d", (uint8_t *)v6, 8u);
      }
    }
  }
}

- (void)cancelRestore:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v23 = "-[ICSBackupViewController cancelRestore:]";
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "%s, presenting confirmation alert", buf, 0xCu);
  }

  self->_backupCancelled = 1;
  [(ICSBackupViewController *)self updateBusyState];
  int v5 = (void *)MEMORY[0x263F82418];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"STOP_RESTORING_QUESTION"];
  int v8 = [v6 localizedStringForKey:v7 value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  int v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"CANCEL_RESTORE_WARNING" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  id v11 = [v5 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  id v12 = (void *)MEMORY[0x263F82400];
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v14 = [v13 localizedStringForKey:@"DONT_STOP" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __41__ICSBackupViewController_cancelRestore___block_invoke;
  v21[3] = &unk_2655B5C40;
  v21[4] = self;
  id v15 = [v12 actionWithTitle:v14 style:1 handler:v21];
  [v11 addAction:v15];

  id v16 = (void *)MEMORY[0x263F82400];
  id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v18 = [v17 localizedStringForKey:@"STOP" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __41__ICSBackupViewController_cancelRestore___block_invoke_2;
  v20[3] = &unk_2655B5C40;
  v20[4] = self;
  int v19 = [v16 actionWithTitle:v18 style:0 handler:v20];
  [v11 addAction:v19];

  [(ICSBackupViewController *)self presentViewController:v11 animated:1 completion:0];
}

uint64_t __41__ICSBackupViewController_cancelRestore___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1427) = 0;
  return [*(id *)(a1 + 32) updateBusyState];
}

void __41__ICSBackupViewController_cancelRestore___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ICSBackupViewController_cancelRestore___block_invoke_3;
  block[3] = &unk_2655B5688;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __41__ICSBackupViewController_cancelRestore___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "Cancel restore confirmed", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 1392) cancelRestore];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ICSBackupViewController_cancelRestore___block_invoke_586;
  block[3] = &unk_2655B5688;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __41__ICSBackupViewController_cancelRestore___block_invoke_586(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1427) = 0;
  return [*(id *)(a1 + 32) updateBusyState];
}

- (void)cancelBackup:(id)a3
{
  int v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Cancel backup", buf, 2u);
  }

  self->_backupCancelled = 1;
  self->_currentSyncState = 0;
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  int v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__ICSBackupViewController_cancelBackup___block_invoke;
  block[3] = &unk_2655B5688;
  void block[4] = self;
  dispatch_async(v5, block);

  [(ICSBackupViewController *)self updateBusyState];
}

uint64_t __40__ICSBackupViewController_cancelBackup___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cloudSyncClient];
  [v2 cancelSync];

  id v3 = *(void **)(*(void *)(a1 + 32) + 1392);

  return [v3 cancel];
}

- (void)startBackup
{
  self->_backupCancelled = 0;
  [(ICSBackupStatusView *)self->_backupStatusView setBackupError:0];
  self->_estimateTimeRemaining = -1;
  self->_double icloudBackupProgress = 0.0;
  [(ICSBackupViewController *)self updateiCloudBackupAndSyncProgressWithAllowDecrease:1];
  self->_finishBackupExecuted = 0;
  self->_icloudSyncProgress = 0.0;
  [(ICSBackupStatusView *)self->_backupStatusView setSyncErrors:0];
  self->_currentSyncState = 1;
  [(ICSBackupViewController *)self _updateToBackupState:1 backupError:0 progress:-1 timeRemaining:0 restoreStateInfo:0 backgroundRestoreInfo:1 backupEnabled:0.0];
  id v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ICSBackupViewController_startBackup__block_invoke;
  block[3] = &unk_2655B5688;
  void block[4] = self;
  dispatch_async(v3, block);

  int v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Starting iMessage periodic sync", buf, 2u);
  }

  int v5 = [MEMORY[0x263F4A550] sharedInstance];
  [v5 startPeriodicSync];

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v6 = (void *)getHKHealthStoreClass_softClass;
  uint64_t v18 = getHKHealthStoreClass_softClass;
  if (!getHKHealthStoreClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __getHKHealthStoreClass_block_invoke;
    id v13 = &unk_2655B59A0;
    int v14 = &v15;
    __getHKHealthStoreClass_block_invoke((uint64_t)buf);
    id v6 = (void *)v16[3];
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v15, 8);
  id v8 = objc_alloc_init(v7);
  [v8 forceCloudSyncWithOptions:0 completion:&__block_literal_global_594];
}

void __38__ICSBackupViewController_startBackup__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "Start icloud sync", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) cloudSyncClient];
  [v3 startSync];

  int v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Begin backup", buf, 2u);
  }

  int v5 = objc_opt_new();
  if (*(void *)(*(void *)(a1 + 32) + 1416)) {
    [MEMORY[0x263F559D0] expensiveCellularAccess];
  }
  else {
  id v6 = [MEMORY[0x263F559D0] inexpensiveCellularAccess];
  }
  [v5 setCellularAccess:v6];

  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 1392);
  id v15 = 0;
  int v8 = [v7 startBackupWithOptions:v5 error:&v15];
  id v9 = v15;
  if (v8)
  {
    uint64_t v10 = LogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v10, OS_LOG_TYPE_DEFAULT, "Backup begin succeed", buf, 2u);
    }
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) cloudSyncClient];
    [v11 cancelSync];

    id v12 = LogSubsystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_262993000, v12, OS_LOG_TYPE_DEFAULT, "Error starting backup: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__ICSBackupViewController_startBackup__block_invoke_589;
    block[3] = &unk_2655B5900;
    void block[4] = *(void *)(a1 + 32);
    id v14 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __38__ICSBackupViewController_startBackup__block_invoke_589(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1456) setBackupError:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateBusyState];
}

- (void)_showAlertForExpensiveCellular
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_262993000, v0, v1, "Failed to fetch the Interface Cost Expensive setting: %@", v2, v3, v4, v5, v6);
}

uint64_t __57__ICSBackupViewController__showAlertForExpensiveCellular__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(*(void *)(a1 + 32) + 1472)];
}

uint64_t __57__ICSBackupViewController__showAlertForExpensiveCellular__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) proceedWithBackup];
}

- (void)beginBackup:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = LogSubsystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[ICSBackupViewController beginBackup:]";
    _os_log_impl(&dword_262993000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  uint8_t v6 = [v4 propertyForKey:*MEMORY[0x263F602B0]];

  [v6 setCellEnabled:0];
  [(ICSBackupViewController *)self prepareAlertForBackupDisabledDomainAndShow:1];
}

- (void)updateBackupFinishState
{
  if (!self->_finishBackupExecuted)
  {
    self->_finishBackupExecuted = 1;
    [(ICSBackupViewController *)self updateBusyState];
    if (self->_updateBackupState == 1) {
      [(ICSBackupViewController *)self updateLastBackupDateInvalidatePrevious:1];
    }
    else {
      [(ICSBackupViewController *)self updateLastBackupDate];
    }
    self->_updateBackupState = 0;
  }
}

- (void)syncCompletedWithErrors:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __51__ICSBackupViewController_syncCompletedWithErrors___block_invoke;
  v6[3] = &unk_2655B5900;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __51__ICSBackupViewController_syncCompletedWithErrors___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "iCloud sync complete get called", (uint8_t *)&v9, 2u);
  }

  if (*(_DWORD *)(*(void *)(a1 + 32) + 1524) == 1)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3 && [v3 count])
    {
      id v4 = LogSubsystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v9 = 138412290;
        uint64_t v10 = v5;
        _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Got some icloud sync errors: %@", (uint8_t *)&v9, 0xCu);
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 1524) = 3;
      uint64_t v6 = *(void *)(a1 + 40);
    }
    else
    {
      id v7 = LogSubsystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_262993000, v7, OS_LOG_TYPE_DEFAULT, "iCloud sync complete with no error", (uint8_t *)&v9, 2u);
      }

      uint64_t v6 = 0;
      *(_DWORD *)(*(void *)(a1 + 32) + 1524) = 2;
    }
    [*(id *)(*(void *)(a1 + 32) + 1456) setSyncErrors:v6];
    if (*(_DWORD *)(*(void *)(a1 + 32) + 1528))
    {
      int v8 = LogSubsystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "We have already completed backup", (uint8_t *)&v9, 2u);
      }
    }
  }
}

- (void)syncProgress:(double)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__ICSBackupViewController_syncProgress___block_invoke;
  v3[3] = &unk_2655B5EF0;
  v3[4] = self;
  *(double *)&void v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

double __40__ICSBackupViewController_syncProgress___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(*(void *)(a1 + 32) + 1524) == 1)
  {
    uint64_t v2 = LogSubsystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "iCloud sync reported progress: %f", (uint8_t *)&v5, 0xCu);
    }

    double result = *(double *)(a1 + 40);
    *(double *)(*(void *)(a1 + 32) + 1544) = result;
  }
  return result;
}

- (void)showPopUpAlertForBackupDisabledApps
{
  id PSGBackupUtilsClass_0 = getPSGBackupUtilsClass_0();
  backupDisabledAppsInfo = self->_backupDisabledAppsInfo;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__ICSBackupViewController_showPopUpAlertForBackupDisabledApps__block_invoke;
  v5[3] = &unk_2655B6118;
  v5[4] = self;
  [PSGBackupUtilsClass_0 configureAlertMessageOfType:0 AndTitleForBackUpDisabledApps:backupDisabledAppsInfo completion:v5];
}

uint64_t __62__ICSBackupViewController_showPopUpAlertForBackupDisabledApps__block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return objc_msgSend(v2, "showAlertForBackupDisabledItemsWithTitle:andMessage:");
  }
  else {
    return [v2 _showAlertForExpensiveCellular];
  }
}

- (void)showAlertForBackupDisabledItemsWithTitle:(id)a3 andMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(ICSBackupViewController *)self view];
  int v9 = [v8 window];

  if (v9)
  {
    uint64_t v10 = [(PSSpecifier *)self->_backupNowButton propertyForKey:*MEMORY[0x263F602B0]];
    [v10 setCellEnabled:1];

    uint64_t v11 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
    id v12 = [(ICSBackupViewController *)self manageStorageAction];
    [v11 addAction:v12];

    id v13 = (void *)MEMORY[0x263F82400];
    id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"CONTINUE" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __79__ICSBackupViewController_showAlertForBackupDisabledItemsWithTitle_andMessage___block_invoke;
    v17[3] = &unk_2655B5C40;
    v17[4] = self;
    id v16 = [v13 actionWithTitle:v15 style:1 handler:v17];
    [v11 addAction:v16];

    [(ICSBackupViewController *)self presentViewController:v11 animated:1 completion:0];
  }
}

uint64_t __79__ICSBackupViewController_showAlertForBackupDisabledItemsWithTitle_andMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showAlertForExpensiveCellular];
}

- (void)proceedWithBackup
{
  uint64_t v3 = [(PSSpecifier *)self->_backupNowButton propertyForKey:*MEMORY[0x263F602B0]];
  [v3 setCellEnabled:1];

  [(ICSBackupViewController *)self startBackup];
}

- (id)manageStorageAction
{
  uint64_t v3 = (void *)MEMORY[0x263F82400];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"ICLOUD_SETTINGS" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__ICSBackupViewController_manageStorageAction__block_invoke;
  v8[3] = &unk_2655B5C40;
  v8[4] = self;
  id v6 = [v3 actionWithTitle:v5 style:0 handler:v8];

  return v6;
}

void __46__ICSBackupViewController_manageStorageAction__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 1472) propertyForKey:*MEMORY[0x263F602B0]];
  [v1 setCellEnabled:1];

  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v2 = [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/CURRENT_DEVICE_BACKUP"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)managerDidFinishBackup:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = LogSubsystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_262993000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  [(ICSBackupStatusView *)self->_backupStatusView setBackupError:0];
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  [(ICSBackupViewController *)self updateBusyState];
  [(ICSBackupViewController *)self updateLastBackupDateInvalidatePrevious:1];
  int currentSyncState = self->_currentSyncState;
  id v7 = LogSubsystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (currentSyncState == 1)
  {
    if (v8)
    {
      LOWORD(v11) = 0;
      int v9 = "Backup finished but iCloud sync not finished";
LABEL_8:
      _os_log_impl(&dword_262993000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 2u);
    }
  }
  else if (v8)
  {
    LOWORD(v11) = 0;
    int v9 = "Backup and iCloud sync both finished";
    goto LABEL_8;
  }

  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:*MEMORY[0x263F889F0] object:0];
}

- (void)manager:(id)a3 didFailRestoreWithError:(id)a4
{
  id v5 = a4;
  id v6 = LogSubsystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ICSBackupViewController manager:didFailRestoreWithError:]();
  }

  [(ICSBackupViewController *)self updateBusyState];
  [(ICSBackupViewController *)self updateLastBackupDate];
}

- (void)managerDidFinishRestore:(id)a3
{
  id v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Restore finished", v5, 2u);
  }

  [(ICSBackupViewController *)self updateBusyState];
  [(ICSBackupViewController *)self updateLastBackupDate];
}

- (void)managerDidCancelRestore:(id)a3
{
  id v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Restore canceled", v5, 2u);
  }

  [(ICSBackupViewController *)self updateBusyState];
  [(ICSBackupViewController *)self updateLastBackupDate];
}

- (void)manager:(id)a3 didFailBackupWithError:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = LogSubsystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "Failed backup: %@", (uint8_t *)&v7, 0xCu);
  }

  self->_int currentSyncState = 3;
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  [(ICSBackupStatusView *)self->_backupStatusView setBackupError:v5];
  [(ICSBackupViewController *)self updateBusyState];
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v8 = LogSubsystem();
  double v9 = a4;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    double v11 = v9;
    _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "Backup progress: %f", (uint8_t *)&v10, 0xCu);
  }

  self->_double icloudBackupProgress = v9;
  self->_estimateTimeRemaining = a5;
  [(ICSBackupViewController *)self updateiCloudBackupAndSyncProgressWithAllowDecrease:0];
  if ((self->_backupState - 1) >= 2) {
    [(ICSBackupViewController *)self updateBusyState];
  }
}

- (void)managerDidUpdateBackgroundRestoreProgress:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[ICSBackupViewController managerDidUpdateBackgroundRestoreProgress:]";
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(ICSBackupViewController *)self updateBusyState];
}

- (void)manager:(id)a3 didSetBackupEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = LogSubsystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[ICSBackupViewController manager:didSetBackupEnabled:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", (uint8_t *)&v7, 0x12u);
  }

  [(ICSBackupViewController *)self updateBusyState];
  [(ICSBackupViewController *)self updateLastBackupDate];
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  if ((self->_backupState - 1) <= 1)
  {
    BOOL v4 = LogSubsystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Lost connection to backup service", buf, 2u);
    }

    int currentSyncState = self->_currentSyncState;
    id v6 = LogSubsystem();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (currentSyncState == 1)
    {
      if (v7)
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "We are still syncing with iCloud", v11, 2u);
      }

      if (!self->_updateBackupState)
      {
        id v8 = LogSubsystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v10 = 0;
          _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "Backup not finished before losing connection", v10, 2u);
        }

        self->_updateBackupState = 2;
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)__int16 v9 = 0;
        _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "We have finished icloud sync", v9, 2u);
      }

      self->_updateBackupState = 0;
      self->_finishBackupExecuted = 1;
    }
    [(ICSBackupViewController *)self updateBusyState];
    [(ICSBackupViewController *)self updateLastBackupDate];
  }
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = LogSubsystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_262993000, v9, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v15, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v10 = [v8 count];
  uint64_t v11 = [v7 specifiers];
  uint64_t v12 = v11;
  if (v10)
  {
    uint64_t v13 = [v11 count];

    if (v13)
    {
      id v14 = [v7 specifiers];
      [(ICSBackupViewController *)self replaceContiguousSpecifiers:v8 withSpecifiers:v14 animated:1];
    }
    else
    {
      [(ICSBackupViewController *)self removeContiguousSpecifiers:v8 animated:1];
    }
    [(ICSBackupViewController *)self updateBusyState];
  }
  else
  {
    [(ICSBackupViewController *)self addSpecifiersFromArray:v11];
  }
}

- (void)_fetchiCloudHomeData
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__2;
  __int16 v9 = __Block_byref_object_dispose__2;
  uint64_t v10 = [[ICSHomeDataController alloc] initWithAccount:self->_account];
  id v3 = (void *)v6[5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke;
  v4[3] = &unk_2655B6140;
  v4[4] = self;
  void v4[5] = &v5;
  [v3 fetchiCloudHomeDataModelAllowingCache:1 completion:v4];
  _Block_object_dispose(&v5, 8);
}

void __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = LogSubsystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke_cold_1();
    }
  }
  else
  {
    id v8 = [v5 backupViewInfo];
    __int16 v9 = [v8 tips];
    uint64_t v10 = [v9 count];

    uint64_t v7 = LogSubsystem();
    BOOL v11 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v11)
      {
        uint64_t v12 = [v5 backupViewInfo];
        uint64_t v13 = [v12 tips];
        id v14 = [v13 firstObject];
        *(_DWORD *)buf = 138412290;
        __int16 v23 = v14;
        _os_log_impl(&dword_262993000, v7, OS_LOG_TYPE_DEFAULT, "Found an eligible tip for backup view: %@", buf, 0xCu);
      }
      int v15 = [v5 backupViewInfo];
      id v16 = [v15 tips];
      uint64_t v17 = [v16 firstObject];

      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke_618;
      v20[3] = &unk_2655B5900;
      v20[4] = *(void *)(a1 + 32);
      id v21 = v17;
      uint64_t v7 = v17;
      dispatch_async(MEMORY[0x263EF83A0], v20);
    }
    else if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v7, OS_LOG_TYPE_DEFAULT, "No eligible tip found for backup view.", buf, 2u);
    }
  }

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  int v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = 0;
}

void __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke_618(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _buildBackupSpecifiersWithTip:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 1496);
  *(void *)(v3 + 1496) = v2;

  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)ICSBackupViewController;
  objc_msgSendSuper2(&v7, sel_reloadSpecifiers);
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"BACKUPS_NAV_TITLE" value:&stru_270DEF3F8 table:@"Localizable-Backup"];
  [*(id *)(a1 + 32) setTitle:v6];
}

- (id)_buildBackupSpecifiersWithTip:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_super v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"UPGRADE_TO_ICLOUD_PLUS_TIP"];
  [v6 addObject:v7];
  id v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_270DEF3F8 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v8 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  __int16 v9 = [v5 title];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F602D0]];

  uint64_t v10 = [v5 subtitle];
  [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F602C8]];

  BOOL v11 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83570] scale:3];
  uint64_t v12 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.circle" withConfiguration:v11];
  [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F60140]];
  uint64_t v13 = [v5 actions];
  id v14 = [v13 firstObject];
  int v15 = [v14 title];
  [v8 setObject:v15 forKeyedSubscript:@"ICSActionButtonTitleKey"];

  id v16 = [v5 actions];

  uint64_t v17 = [v16 firstObject];
  [v8 setObject:v17 forKeyedSubscript:@"ICSActionKey"];

  [v8 setButtonAction:sel_performTipAction_];
  [v6 addObject:v8];
  uint64_t v18 = (void *)[v6 copy];

  return v18;
}

- (void)performTipAction:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LogSubsystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_262993000, v5, OS_LOG_TYPE_DEFAULT, "Backup tip action button tapped.", (uint8_t *)&v17, 2u);
  }

  if (self->_upgradeFlowManager)
  {
    id v6 = LogSubsystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICSBackupViewController performTipAction:](v6);
    }
  }
  else
  {
    id v6 = [v4 objectForKeyedSubscript:@"ICSActionKey"];
    objc_super v7 = NSURL;
    id v8 = [v6 urlString];
    __int16 v9 = [v7 URLWithString:v8];

    if (v9)
    {
      uint64_t v10 = objc_alloc_init(MEMORY[0x263F88920]);
      [v10 _updateRequestedServerUIURLWithURL:v9];
      BOOL v11 = (ICQUpgradeFlowManager *)[objc_alloc(MEMORY[0x263F88A78]) initWithOffer:v10];
      upgradeFlowManager = self->_upgradeFlowManager;
      self->_upgradeFlowManager = v11;

      [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setDelegate:self];
      id v13 = objc_alloc(MEMORY[0x263F88908]);
      id v14 = [v6 type];
      int v15 = (void *)[v13 initWithActionString:v14 url:v9];

      id v16 = LogSubsystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        uint64_t v18 = v9;
        _os_log_impl(&dword_262993000, v16, OS_LOG_TYPE_DEFAULT, "Launching freshmint upgrade flow with url: %@", (uint8_t *)&v17, 0xCu);
      }

      [(ICQUpgradeFlowManager *)self->_upgradeFlowManager beginRemoteUpgradeFlowWithICQLink:v15 presenter:self];
    }
    else
    {
      uint64_t v10 = LogSubsystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ICSBackupViewController performTipAction:]();
      }
    }
  }
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow cancelled.", v6, 2u);
  }

  [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setDelegate:0];
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow completed successfully.", buf, 2u);
  }

  [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setDelegate:0];
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;

  [(ICSBackupViewController *)self _postQuotaDidChangeNotification];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ICSBackupViewController_upgradeFlowManagerDidComplete___block_invoke;
  block[3] = &unk_2655B5688;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__ICSBackupViewController_upgradeFlowManagerDidComplete___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 1496))
  {
    uint64_t v2 = LogSubsystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "Removing backup tip specifiers.", v5, 2u);
    }

    [*(id *)(a1 + 32) removeContiguousSpecifiers:*(void *)(*(void *)(a1 + 32) + 1496) animated:1];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 1496);
    *(void *)(v3 + 1496) = 0;
  }
}

- (void)_postQuotaDidChangeNotification
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = LogSubsystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[ICSBackupViewController _postQuotaDidChangeNotification]";
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "%s refreshing quota storage info", (uint8_t *)&v4, 0xCu);
  }

  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:*MEMORY[0x263F88858] object:0];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if (objc_opt_respondsToSelector()) {
    [(AAUISpecifierProvider *)self->_backupSpecifierProvider handleURL:v7];
  }
  if (v6) {
    v6[2](v6);
  }
}

- (int)currentSyncState
{
  return self->_currentSyncState;
}

- (void)setCurrentSyncState:(int)a3
{
  self->_int currentSyncState = a3;
}

- (void)setCloudSyncClient:(id)a3
{
}

- (int)updateBackupState
{
  return self->_updateBackupState;
}

- (void)setUpdateBackupState:(int)a3
{
  self->_updateBackupState = a3;
}

- (BOOL)finishBackupExecuted
{
  return self->_finishBackupExecuted;
}

- (void)setFinishBackupExecuted:(BOOL)a3
{
  self->_finishBackupExecuted = a3;
}

- (double)icloudSyncProgress
{
  return self->_icloudSyncProgress;
}

- (void)setIcloudSyncProgress:(double)a3
{
  self->_icloudSyncProgress = a3;
}

- (double)icloudBackupProgress
{
  return self->_icloudBackupProgress;
}

- (void)setIcloudBackupProgress:(double)a3
{
  self->_double icloudBackupProgress = a3;
}

- (int64_t)estimateTimeRemaining
{
  return self->_estimateTimeRemaining;
}

- (void)setEstimateTimeRemaining:(int64_t)a3
{
  self->_estimateTimeRemaining = a3;
}

- (PSGBackupDisabledAppsInfo)backupDisabledAppsInfo
{
  return self->_backupDisabledAppsInfo;
}

- (void)setBackupDisabledAppsInfo:(id)a3
{
}

- (BOOL)isFetchingDomainInfo
{
  return self->_isFetchingDomainInfo;
}

- (void)setIsFetchingDomainInfo:(BOOL)a3
{
  self->_isFetchingDomainInfo = a3;
}

- (BOOL)needToShowPopupAlertForBackup
{
  return self->_needToShowPopupAlertForBackup;
}

- (void)setNeedToShowPopupAlertForBackup:(BOOL)a3
{
  self->_needToShowPopupAlertForBackup = a3;
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_backupDisabledAppsInfo, 0);
  objc_storeStrong((id *)&self->_cloudSyncClient, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
  objc_storeStrong((id *)&self->_backupTipSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupOverCellularSwitch, 0);
  objc_storeStrong((id *)&self->_backupOverCellularSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupNowButton, 0);
  objc_storeStrong((id *)&self->_backupNowSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupStatusView, 0);
  objc_storeStrong((id *)&self->_backupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_backup_state_queue, 0);
  objc_storeStrong((id *)&self->_isExpensiveCellular, 0);
  objc_storeStrong((id *)&self->_networkSupportsBackup, 0);
  objc_storeStrong((id *)&self->_backupManager, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

void __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  id v4 = v3;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "%@ got deallocated.", v5, 0xCu);
}

void __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_262993000, v0, v1, "Failed to get backup on cellular support: %@", v2, v3, v4, v5, v6);
}

- (void)specifiers
{
}

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_262993000, v0, v1, "Error setting up backup: %@", v2, v3, v4, v5, v6);
}

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_441_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackupEnabled:specifier:.cold.1()
{
}

- (void)manager:didFailRestoreWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_262993000, v0, v1, "Restore failed with error: %@", v2, v3, v4, v5, v6);
}

void __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_262993000, v0, v1, "Failed to fetch iCloud home data model w/ error: %@", v2, v3, v4, v5, v6);
}

- (void)performTipAction:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_262993000, v0, v1, "No valid URL found for tip action: %@", v2, v3, v4, v5, v6);
}

- (void)performTipAction:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_262993000, log, OS_LOG_TYPE_ERROR, "Upgrade flow is already in progress. Bailing.", v1, 2u);
}

@end