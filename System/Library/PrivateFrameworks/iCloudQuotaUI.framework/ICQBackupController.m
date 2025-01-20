@interface ICQBackupController
- (BOOL)finishBackupExecuted;
- (BOOL)isBackupEnabled;
- (BOOL)isFetchingDomainInfo;
- (BOOL)needToShowPopupAlertForBackup;
- (BOOL)policyPreventsBackup;
- (BYBuddyDaemonCloudSyncClient)cloudSyncClient;
- (ICQBackupController)init;
- (ICQBackupController)initWithAccount:(id)a3;
- (NWPathEvaluator)pathEvaluator;
- (PSGBackupDisabledAppsInfo)backupDisabledAppsInfo;
- (double)icloudBackupProgress;
- (double)icloudSyncProgress;
- (id)_backgroundRestoreInfoText:(id)a3;
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
- (void)_checkSupportForManualAndAutoBackupOnCellular;
- (void)_disableBackupWithSpecifier:(id)a3;
- (void)_enableBackupWithSpecifier:(id)a3;
- (void)_persistBackupEnablementState:(BOOL)a3 passcode:(id)a4;
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
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willUnlock;
@end

@implementation ICQBackupController

- (ICQBackupController)init
{
  v3 = [MEMORY[0x263EFB210] defaultStore];
  v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  v5 = [(ICQBackupController *)self initWithAccount:v4];

  return v5;
}

- (ICQBackupController)initWithAccount:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICQBackupController;
  v6 = [(ICQBackupController *)&v18 init];
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
    [(ICQBackupController *)v7 _checkSupportForManualAndAutoBackupOnCellular];
    uint64_t v15 = objc_opt_new();
    pathEvaluator = v7->_pathEvaluator;
    v7->_pathEvaluator = (NWPathEvaluator *)v15;

    [(NWPathEvaluator *)v7->_pathEvaluator addObserver:v7 forKeyPath:@"path" options:5 context:0];
    [(ICQBackupController *)v7 fetchIsBackupEnabled];
  }

  return v7;
}

- (void)willUnlock
{
  [(ICQBackupController *)self updateBusyState];
  [(ICQBackupController *)self updateLastBackupDate];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICQBackupController;
  [(ICQBackupController *)&v7 viewWillAppear:a3];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"BACKUPS_NAV_TITLE" value:&stru_26DFF2C90 table:@"Backup"];
  [(ICQBackupController *)self setTitle:v5];

  backupDisabledAppsInfo = self->_backupDisabledAppsInfo;
  self->_backupDisabledAppsInfo = 0;

  [(ICQBackupController *)self prepareAlertForBackupDisabledDomainAndShow:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICQBackupController;
  [(ICQBackupController *)&v7 viewDidAppear:a3];
  if (([(ICQBackupController *)self isMovingToParentViewController] & 1) == 0)
  {
    v4 = +[ICQQuotaRequestManager sharedManager];
    [v4 noteQuotaInfoChanged];
  }
  id v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ICQBackupController_viewDidAppear___block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  dispatch_async(v5, block);

  [(ICQBackupController *)self checkIfNetworkSupportsBackup];
  [(ICQBackupController *)self startListeningForThermalChanges];
  [(ICQBackupController *)self checkIfThermalSupportsBackup];
}

uint64_t __37__ICQBackupController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1384) syncBackupEnabled];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQBackupController;
  [(ICQBackupController *)&v4 viewWillDisappear:a3];
  [(ICQBackupController *)self stopListeningForThermalChanges];
  self->_needToShowPopupAlertForBackup = 0;
}

- (void)dealloc
{
  [(ICQBackupController *)self dismissViewControllerAnimated:0 completion:0];
  [(NWPathEvaluator *)self->_pathEvaluator removeObserver:self forKeyPath:@"path" context:0];
  [(ICQBackupController *)self stopListeningForThermalChanges];
  [(MBManager *)self->_backupManager setDelegate:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F25620], 0);
  v4.receiver = self;
  v4.super_class = (Class)ICQBackupController;
  [(ICQBackupController *)&v4 dealloc];
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
    v7[2] = __70__ICQBackupController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_264922CC0;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x263EF83A0], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __70__ICQBackupController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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

    [(ICQBackupController *)self updateBusyState];
    [(ICQBackupController *)self updateLastBackupDate];
  }
}

- (void)checkIfNetworkSupportsBackup
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICQBackupController *)self pathEvaluator];
  objc_super v4 = [v3 path];

  unint64_t v5 = [v4 status] & 0xFFFFFFFFFFFFFFFDLL;
  v6 = [v4 interface];
  uint64_t v7 = [v6 type];

  isExpensiveCellular = self->_isExpensiveCellular;
  self->_isExpensiveCellular = 0;

  if (v5 != 1) {
    goto LABEL_7;
  }
  BOOL isManualBackupOnCellularAllowed = 1;
  if ([v4 usesInterfaceType:1]) {
    goto LABEL_8;
  }
  if ([v4 usesInterfaceType:3])
  {
    BOOL isManualBackupOnCellularAllowed = 1;
    goto LABEL_8;
  }
  if ([v4 usesInterfaceType:2])
  {
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isExpensive"));
    uint64_t v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v11 = self->_isExpensiveCellular;
    self->_isExpensiveCellular = v10;

    [(ICQBackupController *)self _checkSupportForManualAndAutoBackupOnCellular];
    BOOL isManualBackupOnCellularAllowed = self->_isManualBackupOnCellularAllowed;
  }
  else
  {
LABEL_7:
    BOOL isManualBackupOnCellularAllowed = 0;
  }
LABEL_8:
  dispatch_queue_t v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_isExpensiveCellular;
    int v14 = 134218498;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    v17 = v13;
    __int16 v18 = 1024;
    BOOL v19 = isManualBackupOnCellularAllowed;
    _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "Network interfaceType: %ld. Expensive cellular: %@. Network supports backup: %d", (uint8_t *)&v14, 0x1Cu);
  }

  [(ICQBackupController *)self setNetworkSupportsBackup:isManualBackupOnCellularAllowed];
}

- (void)_checkSupportForManualAndAutoBackupOnCellular
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Failed to get backup on cellular support: %@", v2, v3, v4, v5, v6);
}

- (void)startListeningForThermalChanges
{
  objc_initWeak(&location, self);
  if (self->_thermalNotificationToken == -1)
  {
    uint64_t v3 = (const char *)*MEMORY[0x263EF8920];
    uint64_t v4 = MEMORY[0x263EF83A0];
    id v5 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __54__ICQBackupController_startListeningForThermalChanges__block_invoke;
    handler[3] = &unk_264922CE8;
    objc_copyWeak(&v7, &location);
    handler[4] = self;
    notify_register_dispatch(v3, &self->_thermalNotificationToken, v4, handler);

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

void __54__ICQBackupController_startListeningForThermalChanges__block_invoke(uint64_t a1, int token)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = state64;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "received thermal pressure notification: %llu", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint8_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 1488);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__ICQBackupController_startListeningForThermalChanges__block_invoke_484;
    block[3] = &unk_264922628;
    uint64_t v9 = state64;
    id v8 = WeakRetained;
    dispatch_async(v6, block);
  }
}

uint64_t __54__ICQBackupController_startListeningForThermalChanges__block_invoke_484(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = _ICQGetLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 >= 0x14)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      id v5 = "Restore paused due to thermal pressure.";
      uint8_t v6 = buf;
      goto LABEL_6;
    }
  }
  else if (v4)
  {
    __int16 v8 = 0;
    id v5 = "Restore resumed due to thermal pressure.";
    uint8_t v6 = (uint8_t *)&v8;
LABEL_6:
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
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
  [(ICQBackupController *)self updateBusyState];
}

- (void)checkIfThermalSupportsBackup
{
  int out_token = 0;
  uint64_t v3 = 0;
  if (!notify_register_check((const char *)*MEMORY[0x263EF8920], &out_token))
  {
    if (!notify_get_state(out_token, &v3)) {
      [(ICQBackupController *)self setThermalSupportsBackup:v3 < 0x14];
    }
    notify_cancel(out_token);
  }
}

- (id)_buildHeaderCardSpecifier
{
  uint64_t v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"BackupHeader" target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
  [v3 setObject:*MEMORY[0x263F5FEB0] forKeyedSubscript:*MEMORY[0x263F60158]];
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"BACKUP_HEADER_TITLE" value:&stru_26DFF2C90 table:@"Backup"];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F602D0]];

  uint8_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"BACKUPS_INFO_LEARN_MORE" value:&stru_26DFF2C90 table:@"Backup"];
  [v3 setObject:v7 forKeyedSubscript:ICQUILearnMoreTextKey];

  __int16 v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"BACKUP_HELP_PAGE_URL" value:&stru_26DFF2C90 table:@"Backup"];
  [v3 setObject:v9 forKeyedSubscript:ICQUILearnMoreLinkKey];

  if (![(ICQBackupController *)self policyPreventsBackup])
  {
    uint64_t v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Backup is allowed, setting backup info text", buf, 2u);
    }

    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v12 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"BACKUPS_INFO_TEXT"];
    uint64_t v13 = [v11 localizedStringForKey:v12 value:&stru_26DFF2C90 table:@"Backup"];
    [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x263F602C8]];
  }
  return v3;
}

- (void)reloadSpecifiers
{
  if (self->_finishedInitialLoad)
  {
    [(ICQBackupController *)self updateBusyState];
    [(ICQBackupController *)self updateLastBackupDate];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)ICQBackupController;
    [(ICQBackupController *)&v3 reloadSpecifiers];
  }
}

- (id)specifiers
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if (MGGetBoolAnswer())
    {
      id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.iCloudQuotaUI"];
      uint8_t v6 = [(ICQBackupController *)self loadSpecifiersFromPlistName:@"Backup" target:self bundle:v5];

      id v7 = [v6 specifierForID:@"BACKUP_ENABLED_SWITCH"];
      __int16 v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v9 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"BACKUP_ENABLED_SWITCH"];
      uint64_t v10 = [v8 localizedStringForKey:v9 value:&stru_26DFF2C90 table:@"Backup"];
      [v7 setName:v10];

      uint64_t v11 = *MEMORY[0x263F5FEF8];
      [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
      uint64_t v12 = [v6 specifierForID:@"BACKUP_SWITCH_GROUP"];
      if (!v12) {
        -[ICQBackupController specifiers]();
      }
      uint64_t v13 = v12;
      [v12 setName:0];
      int v14 = [(ICQBackupController *)self _buildHeaderCardSpecifier];
      if ((unint64_t)[v6 count] >= 2)
      {
        uint64_t v15 = _ICQGetLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v59 = 1;
          _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Inserting header specifier for backup controller at index: %d", buf, 8u);
        }

        [v6 insertObject:v14 atIndex:1];
      }
      if (!self->_backupOverCellularSpecifiers)
      {
        __int16 v16 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"BACKUP_OVER_CELLULAR_GROUP"];
        v51 = v13;
        v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        SFLocalizableWAPIStringKeyForKey();
        v53 = v7;
        __int16 v18 = v55 = v11;
        BOOL v19 = [v17 localizedStringForKey:v18 value:&stru_26DFF2C90 table:@"Backup"];
        [v16 setObject:v19 forKeyedSubscript:*MEMORY[0x263F600F8]];

        uint64_t v20 = (void *)MEMORY[0x263F5FC40];
        v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"BACKUP_OVER_CELLULAR_ENABLED_SWITCH"];
        v23 = [v21 localizedStringForKey:v22 value:&stru_26DFF2C90 table:@"Backup"];
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
          v30 = [[ICQBackupStatusView alloc] initWithSpecifier:v29];
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
          [v33 localizedStringForKey:@"BACKUP_NOW" value:&stru_26DFF2C90 table:@"Backup"];
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
        v44 = [[ICQDeviceBackupSpecifierProvider alloc] initWithAccount:self->_account presenter:self];
        v45 = self->_backupSpecifierProvider;
        self->_backupSpecifierProvider = (AAUISpecifierProvider *)v44;

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
    }
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
    v6[2] = __66__ICQBackupController_prepareAlertForBackupDisabledDomainAndShow___block_invoke;
    v6[3] = &unk_264922D10;
    v6[4] = self;
    [PSGBackupUtilsClass_0 fetchBackupDisabledAppsWithBackupManager:backupManager completion:v6];
  }
}

void __66__ICQBackupController_prepareAlertForBackupDisabledDomainAndShow___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1552), a2);
  *(unsigned char *)(*(void *)(a1 + 32) + 1505) = 0;
  BOOL v4 = *(unsigned char **)(a1 + 32);
  if (v4[1506])
  {
    [v4 showPopUpAlertForBackupDisabledApps];
    *(unsigned char *)(*(void *)(a1 + 32) + 1506) = 0;
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
  block[2] = __43__ICQBackupController_fetchIsBackupEnabled__block_invoke;
  block[3] = &unk_264921C80;
  void block[4] = self;
  dispatch_async(backup_state_queue, block);
}

void __43__ICQBackupController_fetchIsBackupEnabled__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) isBackupEnabled];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__ICQBackupController_fetchIsBackupEnabled__block_invoke_2;
  v3[3] = &unk_264921D90;
  char v4 = v2;
  v3[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __43__ICQBackupController_fetchIsBackupEnabled__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    int v5 = 136315394;
    uint8_t v6 = "-[ICQBackupController fetchIsBackupEnabled]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "%s, Caching backup enabled: %d, reloading", (uint8_t *)&v5, 0x12u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1396) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (BOOL)isBackupEnabled
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  if ([(ICQBackupController *)self policyPreventsBackup])
  {
    int v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Backup not enabled because policy prevents backup", (uint8_t *)&v7, 2u);
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [(MBManager *)self->_backupManager isBackupEnabled];
    int v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      backupManager = self->_backupManager;
      int v7 = 136315650;
      int v8 = "-[ICQBackupController isBackupEnabled]";
      __int16 v9 = 1024;
      int v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = backupManager;
      _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "%s, returning: %d, backup manager: %@", (uint8_t *)&v7, 0x1Cu);
    }
  }

  return v4;
}

- (id)cachedIsBackupEnabledNumber
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL backupEnabled = self->_backupEnabled;
    int v7 = 136315394;
    int v8 = "-[ICQBackupController cachedIsBackupEnabledNumber]";
    __int16 v9 = 1024;
    BOOL v10 = backupEnabled;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", (uint8_t *)&v7, 0x12u);
  }

  int v5 = [NSNumber numberWithBool:self->_backupEnabled];
  return v5;
}

- (void)_setBackupEnabled:(BOOL)a3 passcode:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[ICQBackupController _setBackupEnabled:passcode:]";
    __int16 v27 = 1024;
    BOOL v28 = v4;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
  }

  if (v4)
  {
    [(ICQBackupController *)self _persistBackupEnablementState:1 passcode:v6];
  }
  else
  {
    int v8 = (void *)MEMORY[0x263F82418];
    __int16 v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v10 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DISABLE_WARNING_MESSAGE"];
    uint64_t v11 = [v9 localizedStringForKey:v10 value:&stru_26DFF2C90 table:@"Backup"];
    uint64_t v12 = [v8 alertControllerWithTitle:0 message:v11 preferredStyle:0];

    uint64_t v13 = (void *)MEMORY[0x263F82400];
    int v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"DISABLE_CONFIRM" value:&stru_26DFF2C90 table:@"Backup"];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __50__ICQBackupController__setBackupEnabled_passcode___block_invoke;
    v22[3] = &unk_264922D38;
    v22[4] = self;
    char v24 = 0;
    id v23 = v6;
    __int16 v16 = [v13 actionWithTitle:v15 style:2 handler:v22];
    [v12 addAction:v16];

    v17 = (void *)MEMORY[0x263F82400];
    __int16 v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v19 = [v18 localizedStringForKey:@"DISABLE_CANCEL" value:&stru_26DFF2C90 table:@"Backup"];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __50__ICQBackupController__setBackupEnabled_passcode___block_invoke_555;
    v21[3] = &unk_2649225E0;
    v21[4] = self;
    uint64_t v20 = [v17 actionWithTitle:v19 style:1 handler:v21];
    [v12 addAction:v20];

    [(ICQBackupController *)self presentViewController:v12 animated:1 completion:&__block_literal_global_14];
  }
}

uint64_t __50__ICQBackupController__setBackupEnabled_passcode___block_invoke(uint64_t a1)
{
  char v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Confirmed disable backup", v4, 2u);
  }

  return [*(id *)(a1 + 32) _persistBackupEnablementState:*(unsigned __int8 *)(a1 + 48) passcode:*(void *)(a1 + 40)];
}

uint64_t __50__ICQBackupController__setBackupEnabled_passcode___block_invoke_555(uint64_t a1)
{
  char v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "User cancelled disable backup", v4, 2u);
  }

  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void __50__ICQBackupController__setBackupEnabled_passcode___block_invoke_556()
{
  v0 = _ICQGetLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_22C821000, v0, OS_LOG_TYPE_DEFAULT, "Presenting confirmation alert for Turn off iCloud Backup", v1, 2u);
  }
}

- (void)_persistBackupEnablementState:(BOOL)a3 passcode:(id)a4
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ICQBackupController _persistBackupEnablementState:passcode:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
  }

  [(ICQBackupStatusView *)self->_backupStatusView setFooterText:0];
  [(ICQBackupStatusView *)self->_backupStatusView setBackupError:0];
  if (!v4)
  {
    backupNowButton = self->_backupNowButton;
    __int16 v9 = [NSNumber numberWithBool:0];
    uint64_t v10 = *MEMORY[0x263F600A8];
    [(PSSpecifier *)backupNowButton setProperty:v9 forKey:*MEMORY[0x263F600A8]];

    [(ICQBackupController *)self reloadSpecifier:self->_backupNowButton];
    [(PSSpecifier *)self->_backupOverCellularSwitch setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v10];
    [(ICQBackupController *)self reloadSpecifier:self->_backupOverCellularSwitch];
  }
  uint64_t v11 = [(ICQBackupController *)self view];
  uint64_t v12 = [v11 window];
  [v12 setUserInteractionEnabled:0];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  id v27 = objc_alloc_init(MEMORY[0x263F82AE8]);
  [*(id *)(*(void *)&buf[8] + 40) setAutoresizingMask:45];
  [*(id *)(*(void *)&buf[8] + 40) setFontSize:16];
  uint64_t v13 = *(void **)(*(void *)&buf[8] + 40);
  int v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v4) {
    [v14 localizedStringForKey:@"TURNING_ON_BACKUP" value:&stru_26DFF2C90 table:@"Backup"];
  }
  else {
  uint64_t v15 = [v14 localizedStringForKey:@"TURNING_OFF_BACKUP" value:&stru_26DFF2C90 table:@"Backup"];
  }
  [v13 setText:v15];

  dispatch_time_t v16 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke;
  block[3] = &unk_264922780;
  void block[4] = self;
  void block[5] = buf;
  dispatch_after(v16, MEMORY[0x263EF83A0], block);
  backup_state_queue = self->_backup_state_queue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_2;
  v19[3] = &unk_264922D88;
  BOOL v22 = v4;
  v19[4] = self;
  id v20 = v6;
  v21 = buf;
  id v18 = v6;
  dispatch_async(backup_state_queue, v19);

  _Block_object_dispose(buf, 8);
}

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke(uint64_t a1)
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

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  [*(id *)(*(void *)(a1 + 32) + 1384) setBackupEnabled:*(unsigned __int8 *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1384);
    id v19 = 0;
    char v4 = [v3 setupBackupWithPasscode:v2 error:&v19];
    id v5 = v19;
    *((unsigned char *)v21 + 24) = v4;
    if (v5)
    {
      id v6 = _ICQGetLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_2_cold_1();
      }
    }
  }
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  dispatch_time_t v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  if (*((unsigned char *)v21 + 24))
  {
    int v7 = [MEMORY[0x263EFB210] defaultStore];
    [*(id *)(*(void *)(a1 + 32) + 1400) setEnabled:*(unsigned __int8 *)(a1 + 56) forDataclass:*MEMORY[0x263EFB3B8]];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 1400);
    __int16 v9 = (id *)(v14 + 5);
    id obj = (id)v14[5];
    [v7 saveVerifiedAccount:v8 error:&obj];
    objc_storeStrong(v9, obj);
    *((unsigned char *)v21 + 24) = v14[5] == 0;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_564;
  v11[3] = &unk_264922D60;
  uint64_t v10 = *(void *)(a1 + 48);
  v11[4] = *(void *)(a1 + 32);
  v11[5] = v10;
  v11[6] = &v20;
  v11[7] = &v13;
  dispatch_async(MEMORY[0x263EF83A0], v11);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v20, 8);
}

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_564(uint64_t a1)
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
    uint64_t v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_564_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    dispatch_time_t v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_26DFF2C90 table:@"Backup"];

    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v18 = [v17 localizedStringForKey:@"TRY_AGAIN" value:&stru_26DFF2C90 table:@"Backup"];

    id v19 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) domain];
    if ([v19 isEqualToString:@"MBErrorDomain"])
    {
      if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) code] == 300)
      {
      }
      else
      {
        uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) code];

        if (v22 != 308)
        {
          v35 = (void *)v18;
          uint64_t v20 = v16;
          v21 = @"ERROR_ENABLING_BACKUP_DETAILS";
          goto LABEL_17;
        }
      }
      id v23 = objc_alloc_init(MEMORY[0x263F255D8]);
      int v24 = [v23 airplaneMode];

      if (v24)
      {
        SFLocalizableWAPIStringKeyForKey();
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = @"ERROR_ENABLING_BACKUP_NETWORK";
      }
      v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v26 = [v25 localizedStringForKey:@"OK" value:&stru_26DFF2C90 table:@"Backup"];

      id v19 = (void *)v18;
      uint64_t v20 = (void *)v26;
      v35 = 0;
    }
    else
    {
      v35 = (void *)v18;
      uint64_t v20 = v16;
      v21 = @"ERROR_ENABLING_BACKUP_DETAILS";
    }

LABEL_17:
    id v27 = (void *)MEMORY[0x263F82418];
    uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v29 = [v28 localizedStringForKey:@"ERROR_ENABLING_BACKUP" value:&stru_26DFF2C90 table:@"Backup"];
    v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:v21 value:&stru_26DFF2C90 table:@"Backup"];
    v32 = [v27 alertControllerWithTitle:v29 message:v31 preferredStyle:1];

    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_587;
    v37[3] = &unk_2649225E0;
    v37[4] = *(void *)(a1 + 32);
    v33 = [MEMORY[0x263F82400] actionWithTitle:v20 style:1 handler:v37];
    [v32 addAction:v33];

    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_588;
    v36[3] = &unk_2649225E0;
    v36[4] = *(void *)(a1 + 32);
    v34 = [MEMORY[0x263F82400] actionWithTitle:v35 style:0 handler:v36];
    [v32 addAction:v34];

    [*(id *)(a1 + 32) presentViewController:v32 animated:1 completion:0];
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F5FE78]));
  [WeakRetained reloadSpecifiers];

  int v7 = *(void **)(a1 + 32);
  [v7 checkIfNetworkSupportsBackup];
}

uint64_t __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_587(uint64_t a1)
{
  uint64_t v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Reload specifier with specifier ID 'BACKUP_ENABLED_SWITCH'", v4, 2u);
  }

  return [*(id *)(a1 + 32) reloadSpecifierID:@"BACKUP_ENABLED_SWITCH" animated:1];
}

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_588(uint64_t a1)
{
  uint64_t v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Enabling backup with specifier ID 'BACKUP_ENABLED_SWITCH'", v5, 2u);
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
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v4;
      _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Failed to fetch BackupOnCellularEnabled: %@", buf, 0xCu);
    }
  }
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[ICQBackupController isBackupOverCellularEnabled]";
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
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
  uint64_t v8 = _ICQGetLogSystem();
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
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
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

  [(ICQBackupController *)self checkIfNetworkSupportsBackup];
}

- (void)didAcceptEnteredPIN:(id)a3
{
}

- (void)didCancelEnteringPIN
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[ICQBackupController didCancelEnteringPIN]";
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(ICQBackupController *)self specifierForID:@"BACKUP_ENABLED_SWITCH"];
  [(ICQBackupController *)self reloadSpecifier:v4 animated:1];
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
  int v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ICQBackupController _backupEnabledSwitchCancelled:]";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(ICQBackupController *)self reloadSpecifier:v4 animated:1];
}

- (void)setBackupEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[ICQBackupController setBackupEnabled:specifier:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "%s, enabled: %@", (uint8_t *)&v9, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[ICQBackupController setBackupEnabled:specifier:]();
  }
  if ([v6 BOOLValue]) {
    [(ICQBackupController *)self _enableBackupWithSpecifier:v7];
  }
  else {
    [(ICQBackupController *)self _disableBackupWithSpecifier:v7];
  }
}

- (void)openBackupHelpPage:(id)a3
{
  objc_msgSend(MEMORY[0x263F82438], "sharedApplication", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = NSURL;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"BACKUP_HELP_PAGE_URL" value:&stru_26DFF2C90 table:@"Backup"];
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
  if (a3 || ([(ICQBackupStatusView *)self->_backupStatusView progress], icloudBackupProgress >= v5))
  {
    backupStatusView = self->_backupStatusView;
    double v7 = (double)(60 * self->_estimateTimeRemaining);
    [(ICQBackupStatusView *)backupStatusView setBackupProgress:icloudBackupProgress timeIntervalRemaining:v7];
  }
}

- (void)setLastBackupDateString:(id)a3
{
  [(ICQBackupStatusView *)self->_backupStatusView setLastBackupText:a3];
  [(ICQBackupController *)self beginUpdates];
  [(ICQBackupController *)self endUpdates];
}

- (id)dateStringOfLatestBackup
{
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = SFLocalizableWAPIStringKeyForKey();
  double v5 = [v3 localizedStringForKey:v4 value:&stru_26DFF2C90 table:@"Backup"];

  id v6 = (void *)MEMORY[0x263F08790];
  double v7 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v8 = [v6 dateFormatFromTemplate:@"j" options:0 locale:v7];

  uint64_t v9 = [v8 rangeOfString:@"H"];
  uint64_t v10 = [(MBManager *)self->_backupManager dateOfLastBackup];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F08790]);
    id v12 = [MEMORY[0x263EFF8F0] currentCalendar];
    int v13 = [v10 isTodayWithCalendar:v12];

    if (v13 && v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v11 setTimeStyle:1];
      [v11 setDateStyle:0];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263EFF960] currentLocale];
      id v15 = [v14 localeIdentifier];
      int v16 = [v15 isEqualToString:@"en_US"];

      [v11 setDoesRelativeDateFormatting:1];
      if (v16)
      {
        [v11 setDateStyle:1];
        id v17 = objc_alloc_init(MEMORY[0x263F08790]);
        [v17 setTimeStyle:1];
        uint64_t v18 = NSString;
        id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v20 = [v19 localizedStringForKey:@"LAST_BACKUP_DATE_AT_TIME" value:&stru_26DFF2C90 table:@"Backup"];
        uint64_t v21 = [v11 stringFromDate:v10];
        uint64_t v22 = [v17 stringFromDate:v10];
        uint64_t v23 = objc_msgSend(v18, "localizedStringWithFormat:", v20, v21, v22);

        double v5 = (void *)v21;
LABEL_9:

        double v5 = (void *)v23;
        goto LABEL_10;
      }
      [v11 setDateStyle:3];
      [v11 setTimeStyle:1];
      [v11 setFormattingContext:1];
    }
    int v24 = NSString;
    id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v19 = [v17 localizedStringForKey:@"LAST_BACKUP_DATE_OR_TIME" value:&stru_26DFF2C90 table:@"Backup"];
    uint64_t v20 = [v11 stringFromDate:v10];
    uint64_t v23 = objc_msgSend(v24, "localizedStringWithFormat:", v19, v20);
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (void)updateLastBackupDateInvalidatePrevious:(BOOL)a3
{
  if (a3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke;
    block[3] = &unk_264921C80;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  backup_state_queue = self->_backup_state_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke_2;
  v5[3] = &unk_264921C80;
  v5[4] = self;
  dispatch_async(backup_state_queue, v5);
}

void __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v2 = [v3 localizedStringForKey:@"DETERMINING_LAST_BACKUP" value:&stru_26DFF2C90 table:@"Backup"];
  [v1 setLastBackupDateString:v2];
}

void __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dateStringOfLatestBackup];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke_3;
  v4[3] = &unk_264921B68;
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

uint64_t __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLastBackupDateString:*(void *)(a1 + 40)];
}

- (void)updateLastBackupDate
{
}

- (id)_backgroundRestoreInfoText:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
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
    uint64_t v9 = (void *)[@"RESTORING" mutableCopy];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          [v9 appendFormat:@"_%@", *(void *)(*((void *)&v29 + 1) + 8 * i)];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v12);
    }

    id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v16 = [v15 localizedStringForKey:v9 value:&stru_26DFF2C90 table:@"Backup"];

    if (v8)
    {
      if ((unint64_t)[v4 bytesRemaining] > 0xF423F)
      {
        if (![v4 bytesRemaining])
        {
          uint64_t v18 = 0;
LABEL_36:

          if (v16) {
            goto LABEL_37;
          }
LABEL_30:
          id v19 = &stru_26DFF2C90;
          if (!v18) {
            goto LABEL_40;
          }
          goto LABEL_38;
        }
        id v25 = [NSString alloc];
        id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v26 = [v17 localizedStringForKey:@"BYTES_REMAINING" value:&stru_26DFF2C90 table:@"Backup"];
        uint64_t v18 = objc_msgSend(v25, "initWithFormat:", v26, v5);
      }
      else
      {
        id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v18 = [v17 localizedStringForKey:@"LESS_THAN_1MB_REMAINING" value:&stru_26DFF2C90 table:@"Backup"];
      }
    }
    else
    {
      id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v23 = [v17 localizedStringForKey:@"RESTORING_PERIOD" value:&stru_26DFF2C90 table:@"Backup"];
      uint64_t v24 = [v16 stringByAppendingString:v23];

      uint64_t v18 = 0;
      int v16 = (void *)v24;
    }

    goto LABEL_36;
  }
  if (![v4 bytesRemaining])
  {
    int v16 = 0;
    id v19 = &stru_26DFF2C90;
    goto LABEL_40;
  }
  id v20 = [NSString alloc];
  uint64_t v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v22 = [v21 localizedStringForKey:@"RESTORE_IN_PROGRESS" value:&stru_26DFF2C90 table:@"Backup"];
  int v16 = objc_msgSend(v20, "initWithFormat:", v22, v5);

  uint64_t v18 = 0;
  if (!v16) {
    goto LABEL_30;
  }
LABEL_37:
  id v19 = [&stru_26DFF2C90 stringByAppendingString:v16];
  if (v18)
  {
LABEL_38:
    id v27 = [(__CFString *)v19 stringByAppendingString:@" "];

    id v19 = [v27 stringByAppendingString:v18];
  }
LABEL_40:

LABEL_41:
  return v19;
}

- (void)_updateToBackupState:(int)a3 backupError:(id)a4 progress:(float)a5 timeRemaining:(unint64_t)a6 restoreStateInfo:(id)a7 backgroundRestoreInfo:(id)a8 backupEnabled:(BOOL)a9
{
  BOOL v9 = a9;
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v16 = a4;
  id v17 = a7;
  id v82 = a8;
  uint64_t v18 = [(ICQBackupStatusView *)self->_backupStatusView backupError];
  if (!v16 || v18)
  {
  }
  else if ([v16 code] != 202)
  {
    id v19 = _ICQGetLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v84 = v16;
      _os_log_impl(&dword_22C821000, v19, OS_LOG_TYPE_DEFAULT, "Setting error from backup state: %@", buf, 0xCu);
    }

    [(ICQBackupStatusView *)self->_backupStatusView setBackupError:v16];
  }
  self->_backupState = a3;
  self->_BOOL backupEnabled = v9;
  uint64_t v20 = [(ICQBackupController *)self specifierForID:@"BACKUP_ENABLED_SWITCH"];
  uint64_t v21 = (uint64_t *)MEMORY[0x263F600A8];
  id v78 = v16;
  BOOL v79 = v9;
  v80 = (void *)v20;
  if (a3 > 6)
  {
    v33 = _ICQGetLogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = a3;
      _os_log_impl(&dword_22C821000, v33, OS_LOG_TYPE_DEFAULT, "Got an unknown state from backup manager: %i", buf, 8u);
    }

    uint64_t v34 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = a3;
      _os_log_impl(&dword_22C821000, v34, OS_LOG_TYPE_DEFAULT, "Got an unknown state from backup manager: %i", buf, 8u);
    }
    unsigned int v76 = a3;

    uint64_t v35 = *v21;
    v36 = [(PSSpecifier *)self->_backupNowButton propertyForKey:*v21];
    uint64_t v27 = [v36 BOOLValue];

    v37 = [v80 propertyForKey:v35];
    uint64_t v26 = [v37 BOOLValue];
  }
  else
  {
    if (((1 << a3) & 0x39) != 0)
    {
      unsigned int v76 = a3;
LABEL_11:
      if (self->_backupNowButton)
      {
        uint64_t v22 = _ICQGetLogSystem();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C821000, v22, OS_LOG_TYPE_DEFAULT, "Setting backup now button as backup now button", buf, 2u);
        }

        backupNowButton = self->_backupNowButton;
        uint64_t v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v25 = [v24 localizedStringForKey:@"BACKUP_NOW" value:&stru_26DFF2C90 table:@"Backup"];
        [(PSSpecifier *)backupNowButton setName:v25];

        [(PSSpecifier *)self->_backupNowButton setButtonAction:sel_beginBackup_];
      }
      if ([(NSNumber *)self->_networkSupportsBackup BOOLValue])
      {
        uint64_t v26 = 1;
        uint64_t v27 = v9;
      }
      else
      {
        long long v32 = ICQUSLogForCategory(0);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C821000, v32, OS_LOG_TYPE_DEFAULT, "Network does not support backup - backup button disabled", buf, 2u);
        }

        uint64_t v27 = 0;
        uint64_t v26 = 1;
      }
      goto LABEL_31;
    }
    if (((1 << a3) & 6) == 0)
    {
      if (self->_backupCancelled)
      {
        [(ICQBackupStatusView *)self->_backupStatusView setBackupError:0];
        unsigned int v76 = 0;
      }
      else
      {
        unsigned int v76 = 6;
      }
      goto LABEL_11;
    }
    unsigned int v76 = a3;
    if (self->_backupNowButton)
    {
      uint64_t v28 = _ICQGetLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v28, OS_LOG_TYPE_DEFAULT, "Setting backup now button as cancel button", buf, 2u);
      }

      long long v29 = self->_backupNowButton;
      long long v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v31 = [v30 localizedStringForKey:@"CANCEL_BACKUP" value:&stru_26DFF2C90 table:@"Backup"];
      [(PSSpecifier *)v29 setName:v31];

      [(PSSpecifier *)self->_backupNowButton setButtonAction:sel_cancelBackup_];
    }
    self->_estimateTimeRemaining = a6;
    self->_double icloudBackupProgress = a5;
    uint64_t v26 = 1;
    [(ICQBackupController *)self updateiCloudBackupAndSyncProgressWithAllowDecrease:1];
    uint64_t v27 = 1;
  }
LABEL_31:
  id v77 = v17;
  unsigned int v81 = [v17 state];
  unsigned int v38 = v81 - 1;
  if (v81 - 1 > 1)
  {
    if ([(NSNumber *)self->_networkSupportsBackup BOOLValue])
    {
      [(ICQBackupStatusView *)self->_backupStatusView setFooterText:0];
    }
    else
    {
      backupStatusView = self->_backupStatusView;
      uint64_t v55 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v56 = SFLocalizableWAPIStringKeyForKey();
      v57 = [v55 localizedStringForKey:v56 value:&stru_26DFF2C90 table:@"Backup"];
      [(ICQBackupStatusView *)backupStatusView setFooterText:v57];
    }
  }
  else
  {
    uint64_t v27 = !self->_backupCancelled;
    if (self->_backupCancelled)
    {
      v39 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v39, OS_LOG_TYPE_DEFAULT, "Backup cancelled - backup button disabled", buf, 2u);
      }
    }
    v40 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = v81 == 1;
      _os_log_impl(&dword_22C821000, v40, OS_LOG_TYPE_DEFAULT, "restoreState starting: %d", buf, 8u);
    }

    v41 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = v81 == 2;
      _os_log_impl(&dword_22C821000, v41, OS_LOG_TYPE_DEFAULT, "restoreState running: %d", buf, 8u);
    }

    v42 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v42, OS_LOG_TYPE_DEFAULT, "Disabling Backup Switch", buf, 2u);
    }

    if (self->_backupNowButton)
    {
      v43 = _ICQGetLogSystem();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v43, OS_LOG_TYPE_DEFAULT, "Setting backup now button as stop restoring button", buf, 2u);
      }

      v44 = self->_backupNowButton;
      v45 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v46 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"STOP_RESTORING"];
      uint64_t v47 = [v45 localizedStringForKey:v46 value:&stru_26DFF2C90 table:@"Backup"];
      [(PSSpecifier *)v44 setName:v47];

      [(PSSpecifier *)self->_backupNowButton setButtonAction:sel_cancelRestore_];
    }
    if ([(NSNumber *)self->_networkSupportsBackup BOOLValue])
    {
      if (self->_thermalSupportsBackup) {
        v48 = @"DEVICE_IS_BEING_RESTORED";
      }
      else {
        v48 = @"DEVICE_RESTORE_PAUSED_THERMAL";
      }
    }
    else
    {
      SFLocalizableWAPIStringKeyForKey();
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v50 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:v48];
    v51 = [v49 localizedStringForKey:v50 value:&stru_26DFF2C90 table:@"Backup"];

    v52 = [(ICQBackupController *)self _backgroundRestoreInfoText:v82];
    if (v52)
    {
      uint64_t v53 = [NSString stringWithFormat:@"%@\n\n%@", v51, v52];

      v51 = (void *)v53;
    }
    [(ICQBackupStatusView *)self->_backupStatusView setFooterText:v51];

    uint64_t v26 = 0;
  }
  int v58 = [MEMORY[0x263F82438] isRunningInStoreDemoMode];
  BOOL v59 = [(ICQBackupController *)self policyPreventsBackup];
  BOOL v60 = v59;
  if ((v58 & 1) != 0 || v59)
  {
    v61 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = v58;
      _os_log_impl(&dword_22C821000, v61, OS_LOG_TYPE_DEFAULT, "Store Demo Mode Enabled: %d", buf, 8u);
    }

    v62 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = v60;
      _os_log_impl(&dword_22C821000, v62, OS_LOG_TYPE_DEFAULT, "Policy Prevents Backup: %d", buf, 8u);
    }

    uint64_t v26 = 0;
    uint64_t v27 = 0;
  }
  v63 = self->_backupNowButton;
  v64 = [NSNumber numberWithBool:v27];
  uint64_t v65 = *MEMORY[0x263F600A8];
  [(PSSpecifier *)v63 setProperty:v64 forKey:*MEMORY[0x263F600A8]];

  v66 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v84) = v27;
    _os_log_impl(&dword_22C821000, v66, OS_LOG_TYPE_DEFAULT, "Backup Button Enabled: %d", buf, 8u);
  }

  v67 = [NSNumber numberWithBool:v26];
  [(PSSpecifier *)self->_backupOverCellularSwitch setObject:v67 forKeyedSubscript:v65];

  v68 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v84) = v26;
    _os_log_impl(&dword_22C821000, v68, OS_LOG_TYPE_DEFAULT, "BackupOverCellular Switch Enabled: %d", buf, 8u);
  }

  v69 = [NSNumber numberWithBool:v26];
  [v80 setProperty:v69 forKey:v65];

  v70 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v84) = v26;
    _os_log_impl(&dword_22C821000, v70, OS_LOG_TYPE_DEFAULT, "Backup Switch Enabled: %d", buf, 8u);
  }

  [(ICQBackupController *)self beginUpdates];
  uint64_t v71 = [(ICQBackupController *)self indexOfSpecifier:self->_backupNowButton];
  if (v38 < 2 || v79 || v71 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v79)
    {
      v73 = v77;
      if (v71 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_85:
        [(ICQBackupController *)self reloadSpecifier:self->_backupOverCellularSwitch animated:1];
        [(ICQBackupController *)self reloadSpecifier:self->_backupNowButton animated:1];
LABEL_86:
        v72 = v78;
        uint64_t v74 = v76;
        goto LABEL_87;
      }
    }
    else
    {
      v73 = v77;
      if (v38 > 1 || v71 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_85;
      }
    }
    backupOverCellularSwitch = (PSSpecifier *)v80;
    if (self->_isAutoBackupOnCellularAllowed)
    {
      [(ICQBackupController *)self insertContiguousSpecifiers:self->_backupOverCellularSpecifiers afterSpecifier:v80 animated:1];
      backupOverCellularSwitch = self->_backupOverCellularSwitch;
    }
    [(ICQBackupController *)self insertContiguousSpecifiers:self->_backupNowSpecifiers afterSpecifier:backupOverCellularSwitch animated:1];
    [(ICQBackupStatusView *)self->_backupStatusView setAlpha:1.0];
    goto LABEL_86;
  }
  [(ICQBackupController *)self removeContiguousSpecifiers:self->_backupNowSpecifiers animated:1];
  v73 = v77;
  v72 = v78;
  uint64_t v74 = v76;
  if (self->_isAutoBackupOnCellularAllowed) {
    [(ICQBackupController *)self removeContiguousSpecifiers:self->_backupOverCellularSpecifiers animated:1];
  }
LABEL_87:
  [(ICQBackupController *)self reloadSpecifier:v80 animated:1];
  [(ICQBackupStatusView *)self->_backupStatusView updateViewsForBackupState:v74 restoreState:v81 enabled:v79];
  [(ICQBackupController *)self endUpdates];
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
  [(ICQBackupController *)self _updateToBackupState:v13 backupError:v18 progress:v16 timeRemaining:v11 restoreStateInfo:v10 backgroundRestoreInfo:v6 backupEnabled:v17];
}

- (void)updateBusyState
{
  int backupState = self->_backupState;
  objc_initWeak(&location, self);
  backup_state_queue = self->_backup_state_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__ICQBackupController_updateBusyState__block_invoke;
  v5[3] = &unk_264922DD8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  int v7 = backupState;
  dispatch_async(backup_state_queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __38__ICQBackupController_updateBusyState__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained isBackupEnabled];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 1384) backupState];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 1384) restoreState];
  int v7 = [*(id *)(*(void *)(a1 + 32) + 1384) backgroundRestoreInfo];
  int v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 136316162;
    uint64_t v22 = "-[ICQBackupController updateBusyState]_block_invoke";
    __int16 v23 = 1024;
    int v24 = v4;
    __int16 v25 = 1024;
    int v26 = v9;
    __int16 v27 = 1024;
    int v28 = [v5 state];
    __int16 v29 = 1024;
    int v30 = [v6 state];
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "%s, isBackupEnabled: %d, entryState: %d, backupState: %d, restoreState: %d", buf, 0x24u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __38__ICQBackupController_updateBusyState__block_invoke_687;
  v14[3] = &unk_264922DB0;
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

void __38__ICQBackupController_updateBusyState__block_invoke_687(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_DWORD *)(*(void *)(a1 + 32) + 1392) == *(_DWORD *)(a1 + 72))
    {
      [WeakRetained _updateToBackupState:*(void *)(a1 + 40) restoreState:*(void *)(a1 + 48) backgroundRestoreState:*(void *)(a1 + 56) backupEnabled:*(unsigned __int8 *)(a1 + 76)];
    }
    else
    {
      int v4 = _ICQGetLogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 1392);
        v6[0] = 67109120;
        v6[1] = v5;
        _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Skipping update, current backup state: %d", (uint8_t *)v6, 8u);
      }
    }
  }
}

- (void)cancelRestore:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v23 = "-[ICQBackupController cancelRestore:]";
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "%s, presenting confirmation alert", buf, 0xCu);
  }

  self->_backupCancelled = 1;
  [(ICQBackupController *)self updateBusyState];
  int v5 = (void *)MEMORY[0x263F82418];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"STOP_RESTORING_QUESTION"];
  int v8 = [v6 localizedStringForKey:v7 value:&stru_26DFF2C90 table:@"Backup"];
  int v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"CANCEL_RESTORE_WARNING" value:&stru_26DFF2C90 table:@"Backup"];
  id v11 = [v5 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  id v12 = (void *)MEMORY[0x263F82400];
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v14 = [v13 localizedStringForKey:@"DONT_STOP" value:&stru_26DFF2C90 table:@"Backup"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __37__ICQBackupController_cancelRestore___block_invoke;
  v21[3] = &unk_2649225E0;
  v21[4] = self;
  id v15 = [v12 actionWithTitle:v14 style:1 handler:v21];
  [v11 addAction:v15];

  id v16 = (void *)MEMORY[0x263F82400];
  id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v18 = [v17 localizedStringForKey:@"STOP" value:&stru_26DFF2C90 table:@"Backup"];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __37__ICQBackupController_cancelRestore___block_invoke_2;
  v20[3] = &unk_2649225E0;
  v20[4] = self;
  int v19 = [v16 actionWithTitle:v18 style:0 handler:v20];
  [v11 addAction:v19];

  [(ICQBackupController *)self presentViewController:v11 animated:1 completion:0];
}

uint64_t __37__ICQBackupController_cancelRestore___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1456) = 0;
  return [*(id *)(a1 + 32) updateBusyState];
}

void __37__ICQBackupController_cancelRestore___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ICQBackupController_cancelRestore___block_invoke_3;
  block[3] = &unk_264921C80;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __37__ICQBackupController_cancelRestore___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Cancel restore confirmed", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 1384) cancelRestore];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ICQBackupController_cancelRestore___block_invoke_700;
  block[3] = &unk_264921C80;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __37__ICQBackupController_cancelRestore___block_invoke_700(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1456) = 0;
  return [*(id *)(a1 + 32) updateBusyState];
}

- (void)cancelBackup:(id)a3
{
  int v4 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Cancel backup", buf, 2u);
  }

  self->_backupCancelled = 1;
  self->_currentSyncState = 0;
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  int v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__ICQBackupController_cancelBackup___block_invoke;
  block[3] = &unk_264921C80;
  void block[4] = self;
  dispatch_async(v5, block);

  [(ICQBackupController *)self updateBusyState];
}

uint64_t __36__ICQBackupController_cancelBackup___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cloudSyncClient];
  [v2 cancelSync];

  id v3 = *(void **)(*(void *)(a1 + 32) + 1384);
  return [v3 cancel];
}

- (void)startBackup
{
  self->_backupCancelled = 0;
  [(ICQBackupStatusView *)self->_backupStatusView setBackupError:0];
  self->_estimateTimeRemaining = -1;
  self->_double icloudBackupProgress = 0.0;
  [(ICQBackupController *)self updateiCloudBackupAndSyncProgressWithAllowDecrease:1];
  self->_finishBackupExecuted = 0;
  self->_icloudSyncProgress = 0.0;
  [(ICQBackupStatusView *)self->_backupStatusView setSyncErrors:0];
  self->_currentSyncState = 1;
  [(ICQBackupController *)self _updateToBackupState:1 backupError:0 progress:-1 timeRemaining:0 restoreStateInfo:0 backgroundRestoreInfo:1 backupEnabled:0.0];
  id v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ICQBackupController_startBackup__block_invoke;
  block[3] = &unk_264921C80;
  void block[4] = self;
  dispatch_async(v3, block);

  int v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Starting iMessage periodic sync", buf, 2u);
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
    id v13 = &unk_264921E58;
    int v14 = &v15;
    __getHKHealthStoreClass_block_invoke((uint64_t)buf);
    id v6 = (void *)v16[3];
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v15, 8);
  id v8 = objc_alloc_init(v7);
  [v8 forceCloudSyncWithOptions:0 completion:&__block_literal_global_708];
}

void __34__ICQBackupController_startBackup__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Start icloud sync", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) cloudSyncClient];
  [v3 startSync];

  int v4 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Begin backup", buf, 2u);
  }

  int v5 = objc_opt_new();
  if (*(void *)(*(void *)(a1 + 32) + 1472)) {
    [MEMORY[0x263F559D0] expensiveCellularAccess];
  }
  else {
  id v6 = [MEMORY[0x263F559D0] inexpensiveCellularAccess];
  }
  [v5 setCellularAccess:v6];

  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 1384);
  id v15 = 0;
  int v8 = [v7 startBackupWithOptions:v5 error:&v15];
  id v9 = v15;
  if (v8)
  {
    uint64_t v10 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Backup begin succeed", buf, 2u);
    }
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) cloudSyncClient];
    [v11 cancelSync];

    id v12 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "Error starting backup: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__ICQBackupController_startBackup__block_invoke_703;
    block[3] = &unk_264921B68;
    void block[4] = *(void *)(a1 + 32);
    id v14 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __34__ICQBackupController_startBackup__block_invoke_703(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1416) setBackupError:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 updateBusyState];
}

- (void)_showAlertForExpensiveCellular
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Failed to fetch the Interface Cost Expensive setting: %@", v2, v3, v4, v5, v6);
}

uint64_t __53__ICQBackupController__showAlertForExpensiveCellular__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(*(void *)(a1 + 32) + 1432)];
}

uint64_t __53__ICQBackupController__showAlertForExpensiveCellular__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) proceedWithBackup];
}

- (void)beginBackup:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[ICQBackupController beginBackup:]";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  uint8_t v6 = [v4 propertyForKey:*MEMORY[0x263F602B0]];

  [v6 setCellEnabled:0];
  [(ICQBackupController *)self prepareAlertForBackupDisabledDomainAndShow:1];
}

- (void)updateBackupFinishState
{
  if (!self->_finishBackupExecuted)
  {
    self->_finishBackupExecuted = 1;
    [(ICQBackupController *)self updateBusyState];
    if (self->_updateBackupState == 1) {
      [(ICQBackupController *)self updateLastBackupDateInvalidatePrevious:1];
    }
    else {
      [(ICQBackupController *)self updateLastBackupDate];
    }
    self->_updateBackupState = 0;
  }
}

- (void)syncCompletedWithErrors:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __47__ICQBackupController_syncCompletedWithErrors___block_invoke;
  v6[3] = &unk_264921B68;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __47__ICQBackupController_syncCompletedWithErrors___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "iCloud sync complete get called", (uint8_t *)&v9, 2u);
  }

  if (*(_DWORD *)(*(void *)(a1 + 32) + 1508) == 1)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3 && [v3 count])
    {
      id v4 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v9 = 138412290;
        uint64_t v10 = v5;
        _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Got some icloud sync errors: %@", (uint8_t *)&v9, 0xCu);
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 1508) = 3;
      uint64_t v6 = *(void *)(a1 + 40);
    }
    else
    {
      id v7 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "iCloud sync complete with no error", (uint8_t *)&v9, 2u);
      }

      uint64_t v6 = 0;
      *(_DWORD *)(*(void *)(a1 + 32) + 1508) = 2;
    }
    [*(id *)(*(void *)(a1 + 32) + 1416) setSyncErrors:v6];
    if (*(_DWORD *)(*(void *)(a1 + 32) + 1512))
    {
      int v8 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "We have already completed backup", (uint8_t *)&v9, 2u);
      }
    }
  }
}

- (void)syncProgress:(double)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__ICQBackupController_syncProgress___block_invoke;
  v3[3] = &unk_264922628;
  v3[4] = self;
  *(double *)&void v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

double __36__ICQBackupController_syncProgress___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(*(void *)(a1 + 32) + 1508) == 1)
  {
    uint64_t v2 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "iCloud sync reported progress: %f", (uint8_t *)&v5, 0xCu);
    }

    double result = *(double *)(a1 + 40);
    *(double *)(*(void *)(a1 + 32) + 1528) = result;
  }
  return result;
}

- (void)showPopUpAlertForBackupDisabledApps
{
  id PSGBackupUtilsClass_0 = getPSGBackupUtilsClass_0();
  backupDisabledAppsInfo = self->_backupDisabledAppsInfo;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__ICQBackupController_showPopUpAlertForBackupDisabledApps__block_invoke;
  v5[3] = &unk_264922E00;
  v5[4] = self;
  [PSGBackupUtilsClass_0 configureAlertMessageOfType:0 AndTitleForBackUpDisabledApps:backupDisabledAppsInfo completion:v5];
}

uint64_t __58__ICQBackupController_showPopUpAlertForBackupDisabledApps__block_invoke(uint64_t a1, int a2)
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
  int v8 = [(ICQBackupController *)self view];
  int v9 = [v8 window];

  if (v9)
  {
    uint64_t v10 = [(PSSpecifier *)self->_backupNowButton propertyForKey:*MEMORY[0x263F602B0]];
    [v10 setCellEnabled:1];

    uint64_t v11 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
    id v12 = [(ICQBackupController *)self manageStorageAction];
    [v11 addAction:v12];

    id v13 = (void *)MEMORY[0x263F82400];
    id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"CONTINUE" value:&stru_26DFF2C90 table:@"Backup"];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __75__ICQBackupController_showAlertForBackupDisabledItemsWithTitle_andMessage___block_invoke;
    v17[3] = &unk_2649225E0;
    v17[4] = self;
    id v16 = [v13 actionWithTitle:v15 style:1 handler:v17];
    [v11 addAction:v16];

    [(ICQBackupController *)self presentViewController:v11 animated:1 completion:0];
  }
}

uint64_t __75__ICQBackupController_showAlertForBackupDisabledItemsWithTitle_andMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showAlertForExpensiveCellular];
}

- (void)proceedWithBackup
{
  uint64_t v3 = [(PSSpecifier *)self->_backupNowButton propertyForKey:*MEMORY[0x263F602B0]];
  [v3 setCellEnabled:1];

  [(ICQBackupController *)self startBackup];
}

- (id)manageStorageAction
{
  uint64_t v3 = (void *)MEMORY[0x263F82400];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"ICLOUD_SETTINGS" value:&stru_26DFF2C90 table:@"Backup"];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__ICQBackupController_manageStorageAction__block_invoke;
  v8[3] = &unk_2649225E0;
  v8[4] = self;
  id v6 = [v3 actionWithTitle:v5 style:0 handler:v8];

  return v6;
}

void __42__ICQBackupController_manageStorageAction__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 1432) propertyForKey:*MEMORY[0x263F602B0]];
  [v1 setCellEnabled:1];

  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v2 = [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/CURRENT_DEVICE_BACKUP"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)managerDidFinishBackup:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  [(ICQBackupStatusView *)self->_backupStatusView setBackupError:0];
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  [(ICQBackupController *)self updateBusyState];
  [(ICQBackupController *)self updateLastBackupDateInvalidatePrevious:1];
  int currentSyncState = self->_currentSyncState;
  id v7 = ICQUSLogForCategory(0);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (currentSyncState == 1)
  {
    if (v8)
    {
      LOWORD(v11) = 0;
      int v9 = "Backup finished but iCloud sync not finished";
LABEL_8:
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 2u);
    }
  }
  else if (v8)
  {
    LOWORD(v11) = 0;
    int v9 = "Backup and iCloud sync both finished";
    goto LABEL_8;
  }

  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"BackupInfoDidChange" object:0];
}

- (void)manager:(id)a3 didFailRestoreWithError:(id)a4
{
  id v5 = a4;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ICQBackupController manager:didFailRestoreWithError:]();
  }

  [(ICQBackupController *)self updateBusyState];
  [(ICQBackupController *)self updateLastBackupDate];
}

- (void)managerDidFinishRestore:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Restore finished", v5, 2u);
  }

  [(ICQBackupController *)self updateBusyState];
  [(ICQBackupController *)self updateLastBackupDate];
}

- (void)managerDidCancelRestore:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Restore canceled", v5, 2u);
  }

  [(ICQBackupController *)self updateBusyState];
  [(ICQBackupController *)self updateLastBackupDate];
}

- (void)manager:(id)a3 didFailBackupWithError:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Failed backup: %@", (uint8_t *)&v7, 0xCu);
  }

  self->_int currentSyncState = 3;
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  [(ICQBackupStatusView *)self->_backupStatusView setBackupError:v5];
  [(ICQBackupController *)self updateBusyState];
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v8 = ICQUSLogForCategory(0);
  double v9 = a4;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    double v11 = v9;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Backup progress: %f", (uint8_t *)&v10, 0xCu);
  }

  self->_double icloudBackupProgress = v9;
  self->_estimateTimeRemaining = a5;
  [(ICQBackupController *)self updateiCloudBackupAndSyncProgressWithAllowDecrease:0];
  if ((self->_backupState - 1) >= 2) {
    [(ICQBackupController *)self updateBusyState];
  }
}

- (void)managerDidUpdateBackgroundRestoreProgress:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[ICQBackupController managerDidUpdateBackgroundRestoreProgress:]";
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(ICQBackupController *)self updateBusyState];
}

- (void)manager:(id)a3 didSetBackupEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[ICQBackupController manager:didSetBackupEnabled:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", (uint8_t *)&v7, 0x12u);
  }

  [(ICQBackupController *)self updateBusyState];
  [(ICQBackupController *)self updateLastBackupDate];
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  if ((self->_backupState - 1) <= 1)
  {
    BOOL v4 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Lost connection to backup service", buf, 2u);
    }

    int currentSyncState = self->_currentSyncState;
    id v6 = ICQUSLogForCategory(0);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (currentSyncState == 1)
    {
      if (v7)
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "We are still syncing with iCloud", v11, 2u);
      }

      if (!self->_updateBackupState)
      {
        id v8 = ICQUSLogForCategory(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)BOOL v10 = 0;
          _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Backup not finished before losing connection", v10, 2u);
        }

        self->_updateBackupState = 2;
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)__int16 v9 = 0;
        _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "We have finished icloud sync", v9, 2u);
      }

      self->_updateBackupState = 0;
      self->_finishBackupExecuted = 1;
    }
    [(ICQBackupController *)self updateBusyState];
    [(ICQBackupController *)self updateLastBackupDate];
  }
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v14, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v10 = [v8 count];
  uint64_t v11 = [v7 specifiers];
  uint64_t v12 = v11;
  if (v10)
  {
    uint64_t v13 = [v11 count];

    if (!v13)
    {
      [(ICQBackupController *)self removeContiguousSpecifiers:v8 animated:1];
      goto LABEL_9;
    }
    uint64_t v12 = [v7 specifiers];
    [(ICQBackupController *)self replaceContiguousSpecifiers:v8 withSpecifiers:v12 animated:1];
  }
  else
  {
    [(ICQBackupController *)self addSpecifiersFromArray:v11];
  }

LABEL_9:
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
  objc_storeStrong((id *)&self->_backupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_backup_state_queue, 0);
  objc_storeStrong((id *)&self->_isExpensiveCellular, 0);
  objc_storeStrong((id *)&self->_networkSupportsBackup, 0);
  objc_storeStrong((id *)&self->_backupOverCellularSwitch, 0);
  objc_storeStrong((id *)&self->_backupOverCellularSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupNowButton, 0);
  objc_storeStrong((id *)&self->_backupNowSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupStatusView, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_backupManager, 0);
}

- (void)specifiers
{
}

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Error setting up backup: %@", v2, v3, v4, v5, v6);
}

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_564_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackupEnabled:specifier:.cold.1()
{
}

- (void)manager:didFailRestoreWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Restore failed with error: %@", v2, v3, v4, v5, v6);
}

@end