@interface ICQLocalBackupController
+ (BOOL)isiCloudPhotosEnabled;
+ (id)cellValueStyleDateStringForDate:(id)a3;
+ (id)currentDeviceBackupWithMBManager:(id)a3 filtering:(BOOL)a4 error:(id *)a5;
+ (id)dateStringForSnapshot:(id)a3;
+ (id)deviceImageURLFromAttributes:(id)a3;
+ (id)specifier;
+ (id)specifierForAccount:(id)a3;
- (ACAccount)account;
- (BOOL)beginScan;
- (BOOL)isDomainWhitelisted:(id)a3;
- (BOOL)scanInProgress;
- (ICQLocalBackupController)init;
- (ICQPreferencesRemoteUIDelegate)remoteDelegate;
- (NSString)additionalSpaceRequiredString;
- (NSString)deviceIdentifier;
- (NSString)deviceName;
- (NSURL)deviceImageURL;
- (id)appSpecifierForBundleID:(id)a3;
- (id)backupDomainEnabledForSpecifier:(id)a3;
- (id)backupSizeString;
- (id)currentDeviceBackup;
- (id)dateStringOfLatestBackup;
- (id)loadAppSpecifiersWithDomainInfo:(id)a3;
- (id)nextBackupSizeStringWithSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (unint64_t)backupSize;
- (void)_backupDeletionSuccess;
- (void)_updateTable:(id)a3 toMatchArray:(id)a4 withVisibleArray:(id)a5 maxVisible:(unint64_t)a6 inSection:(int64_t)a7 withRowOffset:(int64_t)a8;
- (void)animateAppSpecifierChanges;
- (void)assignDisableBackupsConfirmationToSpecifier:(id)a3;
- (void)beginScan;
- (void)dealloc;
- (void)deleteBackupConfirmed;
- (void)didEnterBackground:(id)a3;
- (void)endDeletionBezel;
- (void)firstDeleteConfirmation:(id)a3;
- (void)insertDeleteBackupButtonIfNeeded:(BOOL)a3;
- (void)loadFailed:(id)a3 withError:(id)a4;
- (void)loadPropertyValuesFromDictionary:(id)a3;
- (void)loadQuotaInfo;
- (void)loadView;
- (void)manager:(id)a3 didFailScanWithError:(id)a4;
- (void)managerDidFinishScan:(id)a3;
- (void)reloadAfterFetch;
- (void)reloadBackupInfoWithDeleteButton:(BOOL)a3;
- (void)reloadQuotaInfo;
- (void)secondDeleteConfirmation;
- (void)setAccount:(id)a3;
- (void)setAdditionalSpaceRequiredString:(id)a3;
- (void)setBackupDomainEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setBackupSize:(unint64_t)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceImageURL:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setRemoteDelegate:(id)a3;
- (void)setScanInProgress:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)showAllApps:(id)a3;
- (void)specifiers;
- (void)startDeletionBezel;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)turnOffAppBackupCancelled:(id)a3;
- (void)turnOffAppBackupConfirmed:(id)a3;
- (void)updateAppSpecifiersScanWhenComplete:(BOOL)a3;
- (void)updateNextBackupSize;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICQLocalBackupController

+ (id)specifier
{
  v2 = (void *)MEMORY[0x263F5FC40];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"BACKUPS_TITLE" value:&stru_26DFF2C90 table:@"BackupInfo"];
  v5 = [v2 preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  return v5;
}

+ (id)specifierForAccount:(id)a3
{
  id v4 = a3;
  v5 = [a1 specifier];
  [v5 setObject:v4 forKeyedSubscript:@"ICQUISpecifierKeyAccount"];

  [v5 setObject:@"CURRENT_DEVICE_BACKUP" forKeyedSubscript:*MEMORY[0x263F60138]];
  return v5;
}

- (ICQLocalBackupController)init
{
  v21.receiver = self;
  v21.super_class = (Class)ICQLocalBackupController;
  v2 = [(ICQLocalBackupController *)&v21 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_reloadQuotaInfo name:@"QuotaInformationChanged" object:0];

    id v4 = (void *)MEMORY[0x263F5FC40];
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"SHOW_ALL_APPS" value:&stru_26DFF2C90 table:@"BackupInfo"];
    uint64_t v7 = [v4 preferenceSpecifierNamed:v6 target:v2 set:0 get:0 detail:0 cell:13 edit:0];
    showAllSpecifier = v2->_showAllSpecifier;
    v2->_showAllSpecifier = (PSSpecifier *)v7;

    v9 = v2->_showAllSpecifier;
    v10 = [NSNumber numberWithInt:0];
    [(PSSpecifier *)v9 setProperty:v10 forKey:*MEMORY[0x263F5FEF0]];

    uint64_t v11 = *MEMORY[0x263F60138];
    [(PSSpecifier *)v2->_showAllSpecifier setProperty:@"SHOW_ALL_APPS" forKey:*MEMORY[0x263F60138]];
    [(PSSpecifier *)v2->_showAllSpecifier setButtonAction:sel_showAllApps_];
    v12 = (void *)MEMORY[0x263F5FC40];
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"NEXT_BACKUP_SIZE" value:&stru_26DFF2C90 table:@"BackupInfo"];
    uint64_t v15 = [v12 preferenceSpecifierNamed:v14 target:v2 set:0 get:sel_nextBackupSizeStringWithSpecifier_ detail:0 cell:4 edit:0];
    nextBackupSizeSpecifier = v2->_nextBackupSizeSpecifier;
    v2->_nextBackupSizeSpecifier = (PSSpecifier *)v15;

    [(PSSpecifier *)v2->_nextBackupSizeSpecifier setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [(PSSpecifier *)v2->_nextBackupSizeSpecifier setProperty:@"NEXT_BACKUP_SIZE" forKey:v11];
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    visibleAppSpecifiers = v2->_visibleAppSpecifiers;
    v2->_visibleAppSpecifiers = v17;

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v2 selector:sel_didEnterBackground_ name:*MEMORY[0x263F83330] object:0];
  }
  return v2;
}

- (void)setSpecifier:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]), a3);
  v6 = [(ICQLocalBackupController *)self specifier];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"ICQUISpecifierKeyAccount"];
  account = self->_account;
  self->_account = v7;

  if (self->_account)
  {
    id v9 = objc_alloc(MEMORY[0x263F559D8]);
    v10 = self->_account;
    id v15 = 0;
    uint64_t v11 = (MBManager *)[v9 initWithAccount:v10 delegate:self eventQueue:0 error:&v15];
    v12 = v15;
    backupManager = self->_backupManager;
    self->_backupManager = v11;

    if (v12)
    {
      v14 = _ICQGetLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ICQLocalBackupController setSpecifier:]((uint64_t)v12, v14);
      }
    }
  }
  else
  {
    v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICQLocalBackupController setSpecifier:](v12);
    }
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(MBManager *)self->_backupManager setDelegate:0];
  id v4 = [(ICQPreferencesRemoteUIDelegate *)self->_remoteDelegate delegate];

  if (v4 == self) {
    [(ICQPreferencesRemoteUIDelegate *)self->_remoteDelegate setDelegate:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)ICQLocalBackupController;
  [(ICQLocalBackupController *)&v5 dealloc];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_scanInProgress
    && self->_shouldCancelScanOnExit
    && [(ICQLocalBackupController *)self isMovingFromParentViewController])
  {
    self->_shouldCancelScanOnExit = 0;
    [(MBManager *)self->_backupManager cancel];
  }
  v5.receiver = self;
  v5.super_class = (Class)ICQLocalBackupController;
  [(ICQLocalBackupController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_manageStorageReloadNeeded)
  {
    remoteDelegate = self->_remoteDelegate;
    v6 = +[ICQCloudStorageInfo backupInfoHeaders];
    [(ICQPreferencesRemoteUIDelegate *)remoteDelegate reloadTopControllerWithAdditionalHeaders:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)ICQLocalBackupController;
  [(ICQLocalBackupController *)&v7 viewDidDisappear:v3];
}

- (void)didEnterBackground:(id)a3
{
  self->_manageStorageReloadNeeded = 0;
}

+ (id)deviceImageURLFromAttributes:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  double v6 = v5;

  if (v6 <= 1.0
    || ([@"largeImage" stringByAppendingString:@"2x"],
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        [v3 objectForKey:v7],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v8 = [v3 objectForKey:@"largeImage"];
  }
  id v9 = [NSURL URLWithString:v8];

  return v9;
}

- (void)loadPropertyValuesFromDictionary:(id)a3
{
  id v4 = a3;
  double v5 = [v4 objectForKey:@"label"];
  [(ICQLocalBackupController *)self setDeviceName:v5];

  double v6 = [v4 objectForKey:@"deviceUdid"];
  [(ICQLocalBackupController *)self setDeviceIdentifier:v6];

  objc_super v7 = [(id)objc_opt_class() deviceImageURLFromAttributes:v4];
  [(ICQLocalBackupController *)self setDeviceImageURL:v7];

  v8 = [v4 objectForKey:@"backupSize"];
  -[ICQLocalBackupController setBackupSize:](self, "setBackupSize:", [v8 longLongValue]);

  id v10 = [v4 objectForKey:@"bytesRequiredForBackup"];

  if (v10)
  {
    id v9 = objc_msgSend(MEMORY[0x263F086F0], "stringFromByteCount:countStyle:", objc_msgSend(v10, "longLongValue"), 1);
    [(ICQLocalBackupController *)self setAdditionalSpaceRequiredString:v9];
  }
  else
  {
    [(ICQLocalBackupController *)self setAdditionalSpaceRequiredString:0];
  }
}

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)ICQLocalBackupController;
  [(ICQLocalBackupController *)&v15 loadView];
  id v3 = [(ICQLocalBackupController *)self specifier];
  id v4 = [v3 propertyForKey:@"attributes"];
  [(ICQLocalBackupController *)self loadPropertyValuesFromDictionary:v4];

  double v5 = [(ICQLocalBackupController *)self specifier];
  double v6 = [v5 propertyForKey:@"remoteDelegate"];
  [(ICQLocalBackupController *)self setRemoteDelegate:v6];

  [(ICQLocalBackupController *)self loadQuotaInfo];
  objc_super v7 = [ICQDeviceIdentificationView alloc];
  deviceName = self->_deviceName;
  id v9 = [(ICQLocalBackupController *)self deviceIdentifier];
  id v10 = [(ICQLocalBackupController *)self deviceImageURL];
  uint64_t v11 = -[ICQDeviceIdentificationView initWithFrame:deviceName:deviceIdentifier:imageURL:isCurrentDevice:](v7, "initWithFrame:deviceName:deviceIdentifier:imageURL:isCurrentDevice:", deviceName, v9, v10, 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  deviceIdentificationView = self->_deviceIdentificationView;
  self->_deviceIdentificationView = v11;

  [(ICQDeviceIdentificationView *)self->_deviceIdentificationView setLeftExtraMargin:16.0];
  [(ICQDeviceIdentificationView *)self->_deviceIdentificationView sizeToFit];
  [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) setTableHeaderView:self->_deviceIdentificationView];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"BACKUPS_PAGE_TITLE" value:&stru_26DFF2C90 table:@"BackupInfo"];
  [(ICQLocalBackupController *)self setTitle:v14];
}

- (id)appSpecifierForBundleID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(ICQLocalBackupController *)self specifiers];
    double v6 = [v5 specifierForID:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  double v6 = 0;
LABEL_5:

  return v6;
}

- (void)turnOffAppBackupCancelled:(id)a3
{
  id v3 = [a3 propertyForKey:*MEMORY[0x263F602B0]];
  id v4 = [v3 control];

  [v4 setOn:1 animated:1];
}

- (void)turnOffAppBackupConfirmed:(id)a3
{
  id v4 = a3;
  double v5 = [v4 propertyForKey:@"MBDomainInfo"];
  double v6 = [v5 domainName];

  objc_super v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke;
  block[3] = &unk_264922568;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 1384);
  id v18 = 0;
  int v4 = [v3 removeDomainName:v2 error:&v18];
  id v5 = v18;
  if (v4)
  {
    [*(id *)(*(void *)(a1 + 32) + 1384) setBackupEnabled:0 forDomainName:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 32);
    objc_super v7 = *(void **)(v6 + 1480);
    *(void *)(v6 + 1480) = 0;
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 1384) domainInfoForName:*(void *)(a1 + 40)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_2;
  block[3] = &unk_264921CD0;
  char v17 = v4;
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(id *)(a1 + 48);
  id v16 = v8;
  id v9 = v8;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v2 = [*(id *)(a1 + 56) propertyForKey:@"MBDomainInfo"];
    uint64_t v3 = [v2 remoteSize];

    [*(id *)(a1 + 56) setProperty:*(void *)(a1 + 64) forKey:@"MBDomainInfo"];
    int v4 = +[ICQQuotaRequestManager sharedManager];
    [v4 noteQuotaInfoChanged];

    objc_msgSend(*(id *)(a1 + 48), "setBackupSize:", objc_msgSend(*(id *)(a1 + 48), "backupSize") - v3);
    [*(id *)(a1 + 48) reloadSpecifierID:@"BACKUP_SIZE"];
    [*(id *)(a1 + 48) setScanInProgress:0];
    id v5 = [*(id *)(a1 + 48) specifierForID:@"BACKED_UP_APPS"];
    id v25 = [v5 propertyForKey:*MEMORY[0x263F60128]];

    [v25 hideSpinner];
  }
  else
  {
    uint64_t v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_2_cold_1(a1, v6);
    }

    [*(id *)(a1 + 48) reloadSpecifier:*(void *)(a1 + 56) animated:1];
    objc_super v7 = NSString;
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"CANNOT_TURN_OFF_BACKUP_DETAILS" value:&stru_26DFF2C90 table:@"BackupInfo"];
    id v10 = [*(id *)(a1 + 56) name];
    id v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);

    id v12 = (void *)MEMORY[0x263F82418];
    id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"CANNOT_TURN_OFF_BACKUP" value:&stru_26DFF2C90 table:@"BackupInfo"];
    id v15 = [v12 alertControllerWithTitle:v14 message:v11 preferredStyle:1];

    id v16 = (void *)MEMORY[0x263F82400];
    char v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v18 = [v17 localizedStringForKey:@"TRY_AGAIN" value:&stru_26DFF2C90 table:@"BackupInfo"];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_147;
    v26[3] = &unk_264921CA8;
    v19 = *(void **)(a1 + 56);
    v26[4] = *(void *)(a1 + 48);
    id v27 = v19;
    v20 = [v16 actionWithTitle:v18 style:0 handler:v26];
    [v15 addAction:v20];

    objc_super v21 = (void *)MEMORY[0x263F82400];
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"OK" value:&stru_26DFF2C90 table:@"BackupInfo"];
    v24 = [v21 actionWithTitle:v23 style:1 handler:0];
    [v15 addAction:v24];

    [*(id *)(a1 + 48) presentViewController:v15 animated:1 completion:0];
  }
}

uint64_t __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_147(uint64_t a1)
{
  return [*(id *)(a1 + 32) turnOffAppBackupConfirmed:*(void *)(a1 + 40)];
}

- (void)setBackupDomainEnabled:(id)a3 forSpecifier:(id)a4
{
  id v10 = a4;
  if ([a3 BOOLValue])
  {
    uint64_t v6 = [v10 propertyForKey:@"MBDomainInfo"];

    [v6 setEnabled:1];
    backupManager = self->_backupManager;
    id v8 = [v6 domainName];
    [(MBManager *)backupManager setBackupEnabled:1 forDomainName:v8];

    [(ICQLocalBackupController *)self updateNextBackupSize];
    id v9 = v6;
  }
  else
  {
    [(ICQLocalBackupController *)self showConfirmationViewForSpecifier:v10];
    id v9 = v10;
  }
}

- (id)backupDomainEnabledForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"MBDomainInfo"];
  int v4 = NSNumber;
  if ([v3 isEnabled]) {
    uint64_t v5 = [v3 isRestricted] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [v4 numberWithBool:v5];

  return v6;
}

- (void)showAllApps:(id)a3
{
  id v4 = a3;
  self->_showAllPressed = 1;
  if (!self->_appSpecifiers) {
    -[ICQLocalBackupController showAllApps:]();
  }
  id v5 = v4;
  [(ICQLocalBackupController *)self animateAppSpecifierChanges];
}

+ (BOOL)isiCloudPhotosEnabled
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [v2 fileExistsAtPath:@"/var/mobile/Media/PhotoData/CPL/initialsync_marker"];

  return v3;
}

- (BOOL)isDomainWhitelisted:(id)a3
{
  uint64_t v3 = isDomainWhitelisted__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isDomainWhitelisted__onceToken, &__block_literal_global_7);
  }
  id v5 = (void *)isDomainWhitelisted__whitelist;
  uint64_t v6 = [v4 bundleID];

  char v7 = [v5 containsObject:v6];
  return v7;
}

void __48__ICQLocalBackupController_isDomainWhitelisted___block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F5FF40];
  v3[0] = *MEMORY[0x263F5FF48];
  v3[1] = v0;
  v3[2] = *MEMORY[0x263F5FF30];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:3];
  uint64_t v2 = (void *)isDomainWhitelisted__whitelist;
  isDomainWhitelisted__whitelist = v1;
}

- (void)assignDisableBackupsConfirmationToSpecifier:(id)a3
{
  v20 = NSDictionary;
  uint64_t v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v19 = [v3 bundleForClass:objc_opt_class()];
  char v17 = [v19 localizedStringForKey:@"CANCEL" value:&stru_26DFF2C90 table:@"BackupInfo"];
  uint64_t v16 = *MEMORY[0x263F5FFF8];
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v18 localizedStringForKey:@"DELETE" value:&stru_26DFF2C90 table:@"BackupInfo"];
  uint64_t v15 = *MEMORY[0x263F60008];
  uint64_t v6 = NSString;
  char v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"TURN_OFF_APP_PROMPT_TEXT" value:&stru_26DFF2C90 table:@"BackupInfo"];
  id v9 = [v4 name];
  id v10 = objc_msgSend(v6, "stringWithFormat:", v8, v9);
  uint64_t v11 = *MEMORY[0x263F60010];
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"TURN_OFF" value:&stru_26DFF2C90 table:@"BackupInfo"];
  objc_super v21 = objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v17, v16, v5, v15, v10, v11, v13, *MEMORY[0x263F60018], 0);

  [v4 setupWithDictionary:v21];
  uint64_t v14 = [NSNumber numberWithBool:1];
  [v4 setProperty:v14 forKey:*MEMORY[0x263F60000]];
}

- (id)loadAppSpecifiersWithDomainInfo:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v39 = [MEMORY[0x263EFF980] array];
  v40 = [MEMORY[0x263EFF980] array];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v54;
    uint64_t v45 = *MEMORY[0x263F5FFE0];
    uint64_t v43 = *MEMORY[0x263F60188];
    uint64_t v44 = *MEMORY[0x263F60138];
    uint64_t v41 = *MEMORY[0x263F602C8];
    uint64_t v42 = *MEMORY[0x263F601A8];
    uint64_t v38 = *MEMORY[0x263F600A8];
    v46 = self;
    uint64_t v47 = *(void *)v54;
    do
    {
      uint64_t v8 = 0;
      uint64_t v48 = v6;
      do
      {
        if (*(void *)v54 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v53 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x230F70810]();
        uint64_t v11 = [getPSGBackupUtilsClass() displayNameForDomainInfo:v9];
        id v12 = [getPSGBackupUtilsClass() bundleIdForDomainInfo:v9];
        if (([getPSGBackupUtilsClass() shouldIgnoreBundleId:v12] & 1) == 0)
        {
          id v13 = _ICQGetLogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v58 = v11;
            __int16 v59 = 2112;
            v60 = v12;
            _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to show domain: %@:%@", buf, 0x16u);
          }

          uint64_t v14 = [(ICQLocalBackupController *)self appSpecifierForBundleID:v12];
          uint64_t v15 = v14;
          if (v14 && !v11)
          {
            uint64_t v11 = [v14 name];
          }
          if (v11) {
            BOOL v16 = 1;
          }
          else {
            BOOL v16 = v12 == 0;
          }
          int v17 = v16;
          if (!v16)
          {
            id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v11 = [v18 localizedStringForKey:@"LOADING" value:&stru_26DFF2C90 table:@"BackupInfo"];

            [v40 addObject:v12];
          }
          if (v11)
          {
            if (v15)
            {
              [v15 setName:v11];
              v19 = v15;
            }
            else
            {
              v19 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:v11 target:self set:sel_setBackupDomainEnabled_forSpecifier_ get:sel_backupDomainEnabledForSpecifier_ detail:0 cell:6 edit:0];
            }
            [v19 setProperty:objc_opt_class() forKey:v45];
            [v19 setProperty:v9 forKey:@"MBDomainInfo"];
            [v19 setProperty:v12 forKey:v44];
            [v19 setProperty:v12 forKey:v43];
            v20 = [NSNumber numberWithBool:1];
            [v19 setProperty:v20 forKey:v42];

            if ([v9 isRestricted])
            {
              objc_super v21 = [NSNumber numberWithBool:0];
              [v19 setProperty:v21 forKey:v38];

              v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v23 = [v22 localizedStringForKey:@"BACKUP_NOT_SUPPORTED" value:&stru_26DFF2C90 table:@"BackupInfo"];
              [v19 setProperty:v23 forKey:v41];

              uint64_t v7 = v47;
            }
            else
            {
              uint64_t v24 = [v9 size];
              if (v24)
              {
                v22 = [MEMORY[0x263F086F0] stringFromByteCount:v24 countStyle:1];
              }
              else
              {
                id v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                v22 = [v25 localizedStringForKey:@"NO_DATA" value:&stru_26DFF2C90 table:@"BackupInfo"];
              }
              [v19 setProperty:v22 forKey:v41];
              if (v15) {
                int v26 = 1;
              }
              else {
                int v26 = v17;
              }
              if (v26 == 1)
              {
                id v27 = v46;
                [(ICQLocalBackupController *)v46 assignDisableBackupsConfirmationToSpecifier:v19];
              }
              else
              {
                v28 = [NSNumber numberWithBool:0];
                [v19 setProperty:v28 forKey:v38];

                id v27 = v46;
              }
              uint64_t v7 = v47;
              objc_storeWeak((id *)&v19[*MEMORY[0x263F5FE40]], v27);
              [v19 setConfirmationAction:sel_turnOffAppBackupConfirmed_];
              [v19 setConfirmationCancelAction:sel_turnOffAppBackupCancelled_];
            }

            uint64_t v6 = v48;
            if ([v9 isCameraRollDomain])
            {
              self = v46;
              if (([(id)objc_opt_class() isiCloudPhotosEnabled] & 1) == 0) {
                [v39 insertObject:v19 atIndex:0];
              }
            }
            else
            {
              [v39 addObject:v19];
              self = v46;
            }
          }
          else
          {
            v19 = v15;
            uint64_t v7 = v47;
            uint64_t v6 = v48;
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v6);
  }

  v29 = v40;
  if (ceilf((float)(unint64_t)[v40 count] / 10.0) > 0.0)
  {
    int v30 = 0;
    int v31 = 1;
    do
    {
      uint64_t v32 = [v29 count];
      if (v32 - (unint64_t)(v30 & 0xFFFFFFFE) >= 0xA) {
        uint64_t v33 = 10;
      }
      else {
        uint64_t v33 = v32 - (v30 & 0xFFFFFFFE);
      }
      v34 = objc_msgSend(v29, "subarrayWithRange:", v30 & 0xFFFFFFFE, v33);
      v35 = +[ICQQuotaRequestManager sharedManager];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke;
      v50[3] = &unk_264922590;
      id v51 = v39;
      v52 = self;
      [v35 getAppDetailsForBundleIDs:v34 handler:v50];

      v29 = v40;
      float v36 = (float)v31;
      v30 += 10;
      ++v31;
    }
    while (ceilf((float)(unint64_t)[v40 count] / 10.0) > v36);
  }

  return v39;
}

void __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [a2 apps];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    uint64_t v16 = *MEMORY[0x263F600A8];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v8 = *(void **)(a1 + 32);
        id v9 = [v7 bundleID];
        id v10 = [v8 specifierForID:v9];

        uint64_t v11 = [v7 localizedName];
        [v10 setName:v11];

        id v12 = [v10 propertyForKey:@"MBDomainInfo"];
        if (([v12 isRestricted] & 1) == 0)
        {
          [*(id *)(a1 + 40) assignDisableBackupsConfirmationToSpecifier:v10];
          id v13 = [NSNumber numberWithBool:1];
          [v10 setProperty:v13 forKey:v16];
        }
        uint64_t v14 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke_2;
        block[3] = &unk_264922568;
        void block[4] = v7;
        id v19 = v10;
        uint64_t v20 = *(void *)(a1 + 40);
        id v15 = v10;
        dispatch_async(v14, block);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }
}

void __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v3 = [*(id *)(a1 + 32) thumbnailURL];
  uint64_t v4 = [v2 dataWithContentsOfURL:v3];

  uint64_t v5 = [MEMORY[0x263F827E8] imageWithData:v4];
  uint64_t v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  uint64_t v7 = objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:scale:", 0, 0);

  [*(id *)(a1 + 40) setProperty:v7 forKey:*MEMORY[0x263F60140]];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke_3;
  block[3] = &unk_264921B68;
  int8x16_t v9 = *(int8x16_t *)(a1 + 40);
  id v8 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

- (void)_updateTable:(id)a3 toMatchArray:(id)a4 withVisibleArray:(id)a5 maxVisible:(unint64_t)a6 inSection:(int64_t)a7 withRowOffset:(int64_t)a8
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v44 = v12;
  [v12 beginUpdates];
  long long v54 = [MEMORY[0x263EFF980] array];
  v57 = [MEMORY[0x263EFF980] array];
  v58 = (void *)[v14 copy];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  unint64_t v16 = 0x263F08000uLL;
  if (!v15)
  {
    unint64_t v37 = 0;
    goto LABEL_23;
  }
  uint64_t v17 = v15;
  int64_t v56 = a7;
  uint64_t v18 = 0;
  uint64_t v19 = *(void *)v62;
  uint64_t v49 = *MEMORY[0x263F60138];
  uint64_t v50 = *(void *)v62;
  unint64_t v51 = a6;
  do
  {
    uint64_t v20 = 0;
    uint64_t v21 = v18;
    uint64_t v55 = a8 + v18;
    uint64_t v52 = v17;
    uint64_t v47 = v18;
    do
    {
      uint64_t v22 = v20;
      if (*(void *)v62 != v19) {
        objc_enumerationMutation(obj);
      }
      unint64_t v23 = v21 + v20;
      long long v24 = *(void **)(*((void *)&v61 + 1) + 8 * v22);
      if (v23 >= [v14 count])
      {
        v28 = [*(id *)(v16 + 2248) indexPathForRow:v55 + v22 inSection:v56];
        [v54 addObject:v28];

        [v14 addObject:v24];
        goto LABEL_17;
      }
      id v25 = [v14 objectAtIndex:v21 + v22];
      uint64_t v26 = [v25 propertyForKey:v49];
      id v27 = [v24 propertyForKey:v49];
      if (([v27 isEqualToString:v26] & 1) == 0)
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __106__ICQLocalBackupController__updateTable_toMatchArray_withVisibleArray_maxVisible_inSection_withRowOffset___block_invoke;
        aBlock[3] = &unk_2649225B8;
        id v60 = v27;
        v29 = _Block_copy(aBlock);
        uint64_t v30 = [v58 indexOfObjectPassingTest:v29];
        int v31 = *(void **)(v16 + 2248);
        unint64_t v32 = v16;
        uint64_t v48 = v29;
        if (v30 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v33 = [v31 indexPathForRow:v55 + v22 inSection:v56];
          [v54 addObject:v33];

          unint64_t v16 = v32;
          uint64_t v21 = v47;
          goto LABEL_14;
        }
        [v31 indexPathForRow:v30 + a8 inSection:v56];
        v34 = uint64_t v45 = v25;
        v35 = [*(id *)(v16 + 2248) indexPathForRow:v55 + v22 inSection:v56];
        [v44 moveRowAtIndexPath:v34 toIndexPath:v35];

        id v25 = v45;
        uint64_t v36 = [v14 indexOfObjectPassingTest:v29];
        unint64_t v16 = v32;
        uint64_t v21 = v47;
        if (v36 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v14 removeObjectAtIndex:v36];
LABEL_14:
          [v14 insertObject:v24 atIndex:v23];
        }

        goto LABEL_16;
      }
      [v14 replaceObjectAtIndex:v21 + v22 withObject:v24];
LABEL_16:

      uint64_t v19 = v50;
      a6 = v51;
      uint64_t v17 = v52;
LABEL_17:
      unint64_t v37 = v21 + v22 + 1;
      if (v37 >= a6) {
        goto LABEL_21;
      }
      uint64_t v20 = v22 + 1;
    }
    while (v17 != v22 + 1);
    uint64_t v17 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    uint64_t v18 = v21 + v20;
  }
  while (v17);
  unint64_t v37 = v21 + v22 + 1;
LABEL_21:
  a7 = v56;
LABEL_23:

  if ([v14 count] <= v37)
  {
    unint64_t v39 = 0;
    unint64_t v38 = 0;
  }
  else
  {
    unint64_t v38 = [v14 count] - v37;
    unint64_t v39 = v37;
  }
  for (; v37 < [v14 count]; ++v37)
  {
    v40 = [v14 objectAtIndex:v37];
    uint64_t v41 = [v58 indexOfObject:v40];
    if (v41 == 0x7FFFFFFFFFFFFFFFLL) {
      -[ICQLocalBackupController _updateTable:toMatchArray:withVisibleArray:maxVisible:inSection:withRowOffset:]();
    }
    [*(id *)(v16 + 2248) indexPathForRow:v41 + a8 inSection:a7];
    v43 = unint64_t v42 = v16;
    [v57 addObject:v43];

    unint64_t v16 = v42;
  }
  objc_msgSend(v14, "removeObjectsInRange:", v39, v38);
  [v44 insertRowsAtIndexPaths:v54 withRowAnimation:0];
  [v44 deleteRowsAtIndexPaths:v57 withRowAnimation:0];
  [v44 endUpdates];
}

uint64_t __106__ICQLocalBackupController__updateTable_toMatchArray_withVisibleArray_maxVisible_inSection_withRowOffset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 propertyForKey:*MEMORY[0x263F60138]];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)animateAppSpecifierChanges
{
}

- (BOOL)beginScan
{
  if (self->_scanInProgress)
  {
    id v2 = 0;
    BOOL v3 = 1;
  }
  else
  {
    backupManager = self->_backupManager;
    id v17 = 0;
    int v6 = [(MBManager *)backupManager startScanWithError:&v17];
    id v2 = v17;
    if (!v6)
    {
      uint64_t v7 = _ICQGetLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(ICQLocalBackupController *)(uint64_t)v2 beginScan];
      }

      id v14 = [v2 domain];
      if ([v14 isEqualToString:@"MBErrorDomain"])
      {
        uint64_t v15 = [v2 code];

        if (v15 == 3)
        {
          BOOL v3 = 1;
          [(ICQLocalBackupController *)self setScanInProgress:1];
          goto LABEL_12;
        }
      }
      else
      {
      }
      BOOL v3 = 0;
      goto LABEL_12;
    }
    BOOL v3 = 1;
    [(ICQLocalBackupController *)self setScanInProgress:1];
    self->_shouldCancelScanOnExit = 1;
  }
LABEL_12:

  return v3;
}

- (void)updateAppSpecifiersScanWhenComplete:(BOOL)a3
{
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__ICQLocalBackupController_updateAppSpecifiersScanWhenComplete___block_invoke;
  v6[3] = &unk_264921D90;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __64__ICQLocalBackupController_updateAppSpecifiersScanWhenComplete___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1384) domainInfoList];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ICQLocalBackupController_updateAppSpecifiersScanWhenComplete___block_invoke_2;
  block[3] = &unk_264921C30;
  void block[4] = *(void *)(a1 + 32);
  id v5 = v2;
  char v6 = *(unsigned char *)(a1 + 40);
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__ICQLocalBackupController_updateAppSpecifiersScanWhenComplete___block_invoke_2(uint64_t a1)
{
  id obj = [*(id *)(a1 + 32) loadAppSpecifiersWithDomainInfo:*(void *)(a1 + 40)];
  if ([obj count] || !*(unsigned char *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1392), obj);
    [*(id *)(a1 + 32) animateAppSpecifierChanges];
    id v2 = [*(id *)(a1 + 32) specifierForID:@"BACKED_UP_APPS"];
    id v3 = [v2 propertyForKey:*MEMORY[0x263F60128]];

    if (*(unsigned char *)(a1 + 48))
    {
      if ([*(id *)(a1 + 32) beginScan]) {
        [v3 showSpinner];
      }
    }
    else
    {
      [v3 hideSpinner];
    }
    [*(id *)(a1 + 32) updateNextBackupSize];
  }
  else
  {
    [*(id *)(a1 + 32) beginScan];
  }
}

- (void)insertDeleteBackupButtonIfNeeded:(BOOL)a3
{
  if (self->_deviceBackup)
  {
    BOOL v3 = a3;
    id v5 = [(ICQLocalBackupController *)self specifierForID:@"DELETE_BACKUP"];

    if (!v5)
    {
      id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
      char v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DELETE_BACKUP_BUTTON_GROUP"];
      BOOL v7 = @"DELETE_BACKUP_AND_TURN_OFF_BACKUP";
      if (!v3) {
        BOOL v7 = @"DELETE_BACKUP";
      }
      uint64_t v8 = (void *)MEMORY[0x263F5FC40];
      uint64_t v9 = (void *)MEMORY[0x263F086E0];
      uint64_t v10 = v7;
      uint64_t v11 = [v9 bundleForClass:objc_opt_class()];
      uint64_t v12 = [v11 localizedStringForKey:v10 value:&stru_26DFF2C90 table:@"BackupInfo"];

      uint64_t v13 = [v8 deleteButtonSpecifierWithName:v12 target:self action:sel_firstDeleteConfirmation_];

      id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v15 = [v14 localizedStringForKey:@"DELETE_BACKUP_FOOTER" value:&stru_26DFF2C90 table:@"BackupInfo"];
      [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x263F600F8]];

      [v16 addObject:v6];
      [v16 addObject:v13];
      -[ICQLocalBackupController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v16, [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) count], 1);
    }
  }
}

- (void)firstDeleteConfirmation:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"DELETE_BACKUP_TITLE" value:&stru_26DFF2C90 table:@"BackupInfo"];

  if ([(MBManager *)self->_backupManager isBackupEnabled])
  {
    char v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v7 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"TURN_OFF_ALL_AND_DELETE"];
    uint64_t v8 = [v6 localizedStringForKey:v7 value:&stru_26DFF2C90 table:@"BackupInfo"];

    uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v10 = v9;
    uint64_t v11 = @"TURN_OFF_AND_DELETE";
  }
  else
  {
    uint64_t v12 = NSString;
    uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v14 = [v13 localizedStringForKey:@"DELETE_BACKUP_PROMPT" value:&stru_26DFF2C90 table:@"BackupInfo"];
    uint64_t v8 = objc_msgSend(v12, "localizedStringWithFormat:", v14, self->_deviceName);

    uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v10 = v9;
    uint64_t v11 = @"DELETE_BACKUP";
  }
  uint64_t v15 = [v9 localizedStringForKey:v11 value:&stru_26DFF2C90 table:@"BackupInfo"];

  id v16 = (void *)MEMORY[0x263F086E0];
  id v17 = v15;
  id v18 = v8;
  id v19 = v5;
  uint64_t v20 = [v16 bundleForClass:objc_opt_class()];
  uint64_t v21 = [v20 localizedStringForKey:@"CANCEL" value:&stru_26DFF2C90 table:@"BackupInfo"];

  uint64_t v22 = [MEMORY[0x263F82418] sheetAlertControllerWithTitle:v19 message:v18];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __52__ICQLocalBackupController_firstDeleteConfirmation___block_invoke;
  v25[3] = &unk_2649225E0;
  v25[4] = self;
  unint64_t v23 = [MEMORY[0x263F82400] actionWithTitle:v17 style:2 handler:v25];

  long long v24 = [MEMORY[0x263F82400] actionWithTitle:v21 style:1 handler:&__block_literal_global_233];
  [v22 addAction:v23];
  [v22 addAction:v24];
  [(ICQLocalBackupController *)self presentViewController:v22 animated:1 completion:0];
}

uint64_t __52__ICQLocalBackupController_firstDeleteConfirmation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) secondDeleteConfirmation];
}

- (void)secondDeleteConfirmation
{
  BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"SECOND_DELETE_BACKUP_TITLE" value:&stru_26DFF2C90 table:@"BackupInfo"];

  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v6 = [v5 localizedStringForKey:@"SECOND_DELETE_BACKUP_PROMPT" value:&stru_26DFF2C90 table:@"BackupInfo"];

  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"SECOND_DELETE_BACKUP_ACTION" value:&stru_26DFF2C90 table:@"BackupInfo"];

  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_26DFF2C90 table:@"BackupInfo"];

  uint64_t v11 = [MEMORY[0x263F82418] sheetAlertControllerWithTitle:v4 message:v6];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__ICQLocalBackupController_secondDeleteConfirmation__block_invoke;
  v14[3] = &unk_2649225E0;
  v14[4] = self;
  uint64_t v12 = [MEMORY[0x263F82400] actionWithTitle:v8 style:2 handler:v14];
  uint64_t v13 = [MEMORY[0x263F82400] actionWithTitle:v10 style:1 handler:&__block_literal_global_244];
  [v11 addAction:v12];
  [v11 addAction:v13];
  [(ICQLocalBackupController *)self presentViewController:v11 animated:1 completion:0];
}

uint64_t __52__ICQLocalBackupController_secondDeleteConfirmation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteBackupConfirmed];
}

- (void)managerDidFinishScan:(id)a3
{
  if (self->_scanInProgress)
  {
    [(ICQLocalBackupController *)self setScanInProgress:0];
    [(ICQLocalBackupController *)self updateAppSpecifiersScanWhenComplete:0];
  }
}

- (void)manager:(id)a3 didFailScanWithError:(id)a4
{
  id v5 = a4;
  char v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ICQLocalBackupController manager:didFailScanWithError:]((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (self->_scanInProgress && [v5 code] != 202)
  {
    [(ICQLocalBackupController *)self setScanInProgress:0];
    uint64_t v13 = [(ICQLocalBackupController *)self specifierForID:@"BACKED_UP_APPS"];
    id v14 = [v13 propertyForKey:*MEMORY[0x263F60128]];

    [v14 hideSpinner];
  }
}

+ (id)currentDeviceBackupWithMBManager:(id)a3 filtering:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [v8 backupDeviceUUID];

  id v35 = 0;
  uint64_t v10 = [v7 getBackupListWithFiltering:v6 error:&v35];
  id v11 = v35;
  uint64_t v12 = v11;
  if (v10)
  {
    id v30 = v11;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v19 = [v18 backupUUID];
          char v20 = [v19 isEqualToString:v9];

          if (v20)
          {
            id v21 = v18;

            goto LABEL_12;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v21 = 0;
LABEL_12:
    uint64_t v12 = v30;
  }
  else
  {
    uint64_t v22 = _ICQGetLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[ICQLocalBackupController currentDeviceBackupWithMBManager:filtering:error:]((uint64_t)v12, v22, v23, v24, v25, v26, v27, v28);
    }

    id v21 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  return v21;
}

- (id)currentDeviceBackup
{
  BOOL v3 = self->_deviceBackup;
  objc_sync_enter(v3);
  deviceBackup = self->_deviceBackup;
  if (!deviceBackup)
  {
    id v5 = [(id)objc_opt_class() currentDeviceBackupWithMBManager:self->_backupManager filtering:0 error:0];
    BOOL v6 = self->_deviceBackup;
    self->_deviceBackup = v5;

    id v7 = [(MBManager *)self->_backupManager dateOfLastBackup];
    uint64_t v8 = (NSDate *)[v7 copy];
    dateOfLastBackup = self->_dateOfLastBackup;
    self->_dateOfLastBackup = v8;

    self->_doneLoadingDeviceBackup = 1;
    deviceBackup = self->_deviceBackup;
  }
  uint64_t v10 = deviceBackup;
  objc_sync_exit(v3);

  return v10;
}

+ (id)cellValueStyleDateStringForDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  unsigned int v6 = [v3 isTodayWithCalendar:v5];

  [v4 setDoesRelativeDateFormatting:1];
  [v4 setTimeStyle:v6];
  [v4 setDateStyle:1];
  id v7 = [v4 stringFromDate:v3];

  return v7;
}

+ (id)dateStringForSnapshot:(id)a3
{
  id v3 = a3;
  int v4 = [v3 state];
  if (v4 == 2)
  {
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unsigned int v6 = v8;
    uint64_t v9 = @"INCOMPLETE";
  }
  else
  {
    if (v4 == 3)
    {
      id v5 = objc_opt_class();
      unsigned int v6 = [v3 date];
      uint64_t v7 = [v5 cellValueStyleDateStringForDate:v6];
      goto LABEL_7;
    }
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unsigned int v6 = v8;
    uint64_t v9 = @"NEVER";
  }
  uint64_t v7 = [v8 localizedStringForKey:v9 value:&stru_26DFF2C90 table:@"BackupInfo"];
LABEL_7:
  uint64_t v10 = (void *)v7;

  return v10;
}

- (id)dateStringOfLatestBackup
{
  if (self->_doneLoadingDeviceBackup)
  {
    if (self->_dateOfLastBackup)
    {
      id v2 = [(id)objc_opt_class() cellValueStyleDateStringForDate:self->_dateOfLastBackup];
      goto LABEL_10;
    }
    id v3 = [(MBBackup *)self->_deviceBackup snapshots];
    int v4 = [v3 lastObject];
    if ([v4 state] == 3)
    {
      id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v2 = [v5 localizedStringForKey:@"NEVER" value:&stru_26DFF2C90 table:@"BackupInfo"];
    }
    else
    {
      id v2 = [(id)objc_opt_class() dateStringForSnapshot:v4];
    }
  }
  else
  {
    id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v2 = [v3 localizedStringForKey:@"LOADING" value:&stru_26DFF2C90 table:@"BackupInfo"];
  }

LABEL_10:
  return v2;
}

- (id)nextBackupSizeStringWithSpecifier:(id)a3
{
  id v4 = a3;
  if (self->_doneLoadingDeviceBackup)
  {
    nextBackupSizeString = self->_nextBackupSizeString;
    if (nextBackupSizeString)
    {
      unsigned int v6 = nextBackupSizeString;
      goto LABEL_6;
    }
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__ICQLocalBackupController_nextBackupSizeStringWithSpecifier___block_invoke;
    block[3] = &unk_264921C80;
    void block[4] = self;
    dispatch_async(v7, block);
  }
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unsigned int v6 = [v8 localizedStringForKey:@"LOADING" value:&stru_26DFF2C90 table:@"BackupInfo"];

LABEL_6:
  return v6;
}

void __62__ICQLocalBackupController_nextBackupSizeStringWithSpecifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1384) nextBackupSizeInfo];
  if ([v2 state] == 2)
  {
    uint64_t v3 = [v2 size];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __62__ICQLocalBackupController_nextBackupSizeStringWithSpecifier___block_invoke_2;
    v4[3] = &unk_264922628;
    v4[4] = *(void *)(a1 + 32);
    v4[5] = v3;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

void __62__ICQLocalBackupController_nextBackupSizeStringWithSpecifier___block_invoke_2(uint64_t a1)
{
  id v5 = [MEMORY[0x263F086F0] stringFromByteCount:*(void *)(a1 + 40) countStyle:1];
  uint64_t v2 = [NSString stringWithFormat:@"+%@", v5];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1480);
  *(void *)(v3 + 1480) = v2;

  [*(id *)(a1 + 32) reloadSpecifier:*(void *)(*(void *)(a1 + 32) + 1424)];
}

- (void)updateNextBackupSize
{
  nextBackupSizeString = self->_nextBackupSizeString;
  self->_nextBackupSizeString = 0;

  nextBackupSizeSpecifier = self->_nextBackupSizeSpecifier;
  [(ICQLocalBackupController *)self reloadSpecifier:nextBackupSizeSpecifier];
}

- (id)backupSizeString
{
  uint64_t v2 = (void *)MEMORY[0x263F086F0];
  unint64_t v3 = [(ICQLocalBackupController *)self backupSize];
  return (id)[v2 stringFromByteCount:v3 countStyle:1];
}

- (void)reloadAfterFetch
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = *MEMORY[0x263F602B0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "cellType", (void)v11))
        {
          uint64_t v9 = [v8 propertyForKey:v6];

          if (v9)
          {
            uint64_t v10 = [v8 propertyForKey:v6];
            [v10 refreshCellContentsWithSpecifier:v8];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)loadQuotaInfo
{
  uint64_t v3 = +[ICQQuotaRequestManager sharedManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__ICQLocalBackupController_loadQuotaInfo__block_invoke;
  v4[3] = &unk_264922650;
  v4[4] = self;
  [v3 getQuotaInfoDetailed:0 handler:v4];
}

uint64_t __41__ICQLocalBackupController_loadQuotaInfo__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadAfterFetch];
}

- (void)reloadQuotaInfo
{
  [(ICQLocalBackupController *)self loadQuotaInfo];
  self->_manageStorageReloadNeeded = 1;
  self->_doneLoadingDeviceBackup = 0;
  [(ICQLocalBackupController *)self reloadSpecifierID:@"BACKUP_SIZE"];
  [(ICQLocalBackupController *)self reloadSpecifierID:@"LATEST_BACKUP"];
  [(ICQLocalBackupController *)self updateNextBackupSize];
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__ICQLocalBackupController_reloadQuotaInfo__block_invoke;
  block[3] = &unk_264921C80;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __43__ICQLocalBackupController_reloadQuotaInfo__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) reloadBackupInfoWithDeleteButton:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1384) domainInfoList];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) remoteSize];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__ICQLocalBackupController_reloadQuotaInfo__block_invoke_2;
  v8[3] = &unk_264922628;
  v8[4] = *(void *)(a1 + 32);
  v8[5] = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __43__ICQLocalBackupController_reloadQuotaInfo__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackupSize:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadSpecifierID:@"BACKUP_SIZE"];
  [*(id *)(a1 + 32) reloadSpecifierID:@"LATEST_BACKUP"];
  id v2 = *(void **)(a1 + 32);
  return [v2 updateNextBackupSize];
}

- (void)reloadBackupInfoWithDeleteButton:(BOOL)a3
{
  deviceBackup = self->_deviceBackup;
  self->_deviceBackup = 0;

  dateOfLastBackup = self->_dateOfLastBackup;
  self->_dateOfLastBackup = 0;

  uint64_t v7 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__ICQLocalBackupController_reloadBackupInfoWithDeleteButton___block_invoke;
  v8[3] = &unk_264921D90;
  v8[4] = self;
  BOOL v9 = a3;
  dispatch_async(v7, v8);
}

void __61__ICQLocalBackupController_reloadBackupInfoWithDeleteButton___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) currentDeviceBackup];
  char v3 = [*(id *)(*(void *)(a1 + 32) + 1384) isBackupEnabled];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__ICQLocalBackupController_reloadBackupInfoWithDeleteButton___block_invoke_2;
  v4[3] = &unk_264922678;
  v4[4] = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  char v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

uint64_t __61__ICQLocalBackupController_reloadBackupInfoWithDeleteButton___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) reloadAfterFetch];
  if (*(unsigned char *)(a1 + 40))
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 41);
    return [v3 insertDeleteBackupButtonIfNeeded:v4];
  }
  return result;
}

- (id)specifiers
{
  char v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v38 = (int)*MEMORY[0x263F5FDB8];
    appSpecifiers = self->_appSpecifiers;
    self->_appSpecifiers = 0;

    nextBackupSizeString = self->_nextBackupSizeString;
    self->_nextBackupSizeString = 0;

    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = [MEMORY[0x263F5FC40] groupSpecifierWithName:0];
    uint64_t v37 = *MEMORY[0x263F60138];
    objc_msgSend(v7, "setProperty:forKey:", @"BACKUP_INFO_GROUP");
    char v8 = [(MBManager *)self->_backupManager isBackupEnabled];
    BOOL v9 = (void *)MEMORY[0x263F600F8];
    if ((v8 & 1) == 0)
    {
      long long v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v11 = [v10 localizedStringForKey:@"DEVICE_BACKUP_TURNED_OFF_FOOTER" value:&stru_26DFF2C90 table:@"BackupInfo"];
      [v7 setObject:v11 forKeyedSubscript:*v9];
    }
    [v6 addObject:v7];
    long long v12 = (void *)MEMORY[0x263F5FC40];
    long long v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"LATEST_BACKUP" value:&stru_26DFF2C90 table:@"BackupInfo"];
    uint64_t v15 = [v12 preferenceSpecifierNamed:v14 target:self set:0 get:sel_dateStringOfLatestBackup detail:0 cell:4 edit:0];

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = *MEMORY[0x263F5FFE0];
    [v15 setProperty:v16 forKey:*MEMORY[0x263F5FFE0]];
    unint64_t v39 = v15;
    [v6 addObject:v15];
    id v18 = (void *)MEMORY[0x263F5FC40];
    id v19 = (objc_class *)v6;
    char v20 = v7;
    id v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v22 = [v21 localizedStringForKey:@"BACKUP_SIZE" value:&stru_26DFF2C90 table:@"BackupInfo"];
    uint64_t v23 = [v18 preferenceSpecifierNamed:v22 target:self set:0 get:sel_backupSizeString detail:0 cell:4 edit:0];

    [v23 setProperty:objc_opt_class() forKey:v17];
    [v6 addObject:v23];
    uint64_t v24 = [(MBManager *)self->_backupManager restoreState];
    LODWORD(v17) = [v24 state];

    if ((v17 - 1) >= 2)
    {
      if ([(MBManager *)self->_backupManager isBackupEnabled]) {
        [v6 addObject:self->_nextBackupSizeSpecifier];
      }
      v29 = [MEMORY[0x263F5FC40] groupSpecifierWithName:0];
      [v29 setProperty:@"BACKED_UP_APPS" forKey:v37];
      [v29 setProperty:@"LocalBackupHeaderView" forKey:*MEMORY[0x263F60118]];
      [v6 addObject:v29];
      id v19 = (objc_class *)v6;
      id v30 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26DFF2C90 target:0 set:0 get:0 detail:0 cell:15 edit:0];
      [v30 setProperty:@"SPINNER_CELL" forKey:v37];
      [v6 addObject:v30];
      [(NSMutableArray *)self->_visibleAppSpecifiers removeAllObjects];
      [(ICQLocalBackupController *)self reloadBackupInfoWithDeleteButton:1];
      [(ICQLocalBackupController *)self updateAppSpecifiersScanWhenComplete:1];
      uint64_t v28 = v38;
      if ([(id)objc_opt_class() isiCloudPhotosEnabled]
        && ([(ACAccount *)self->_account aa_isManagedAppleID] & 1) == 0)
      {
        long long v31 = _ICQGetLogSystem();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          -[ICQLocalBackupController specifiers](v31);
        }

        if ([(MBManager *)self->_backupManager isBackupEnabled]) {
          long long v32 = @"ICLOUD_PHOTOS_ACTIVE_BACKUP_FOOTER_TEXT";
        }
        else {
          long long v32 = @"ICLOUD_PHOTOS_INACTIVE_BACKUP_FOOTER_TEXT";
        }
        long long v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        long long v34 = [v33 localizedStringForKey:v32 value:&stru_26DFF2C90 table:@"BackupInfo"];
        [v29 setProperty:v34 forKey:*MEMORY[0x263F600F8]];
      }
    }
    else
    {
      uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v26 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"RESTORE_INCOMPLETE"];
      uint64_t v27 = [v25 localizedStringForKey:v26 value:&stru_26DFF2C90 table:@"BackupInfo"];
      [v20 setProperty:v27 forKey:*MEMORY[0x263F600F8]];

      [(ICQLocalBackupController *)self reloadBackupInfoWithDeleteButton:0];
      uint64_t v28 = v38;
    }
    id v35 = *(Class *)((char *)&self->super.super.super.super.super.isa + v28);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v28) = v19;

    char v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v28);
  }
  return v3;
}

- (void)startDeletionBezel
{
  char v3 = [(ICQLocalBackupController *)self navigationController];
  uint64_t v4 = [v3 view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  float v9 = (v6 + -156.0) * 0.5;
  double v10 = floorf(v9);
  float v11 = (v8 + -126.0) * 0.5;
  double v12 = floorf(v11);
  long long v13 = [(ICQLocalBackupController *)self navigationController];
  uint64_t v14 = [v13 view];
  uint64_t v15 = [(ICQLocalBackupController *)self view];
  objc_msgSend(v14, "convertRect:toView:", v15, v10, v12, 156.0, 126.0);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  uint64_t v24 = -[ICQSpinnerBezel initWithFrame:]([ICQSpinnerBezel alloc], "initWithFrame:", v17, v19, v21, v23);
  deletionBezel = self->_deletionBezel;
  self->_deletionBezel = v24;

  uint64_t v26 = self->_deletionBezel;
  uint64_t v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v28 = [v27 localizedStringForKey:@"DELETING" value:&stru_26DFF2C90 table:@"BackupInfo"];
  [(ICQSpinnerBezel *)v26 setBezelText:v28];

  v29 = [(ICQLocalBackupController *)self view];
  [v29 addSubview:self->_deletionBezel];

  id v31 = [(ICQLocalBackupController *)self view];
  id v30 = [v31 window];
  [v30 setUserInteractionEnabled:0];
}

- (void)endDeletionBezel
{
  char v3 = [(ICQLocalBackupController *)self view];
  uint64_t v4 = [v3 window];
  [v4 setUserInteractionEnabled:1];

  [(ICQSpinnerBezel *)self->_deletionBezel removeFromSuperview];
  deletionBezel = self->_deletionBezel;
  self->_deletionBezel = 0;
}

- (void)_backupDeletionSuccess
{
  char v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Backup deletion completed sucessfully.", v7, 2u);
  }

  [(ICQLocalBackupController *)self endDeletionBezel];
  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"BackupInfoDidChange" object:0];

  double v5 = [(ICQLocalBackupController *)self navigationController];
  id v6 = (id)[v5 popViewControllerAnimated:1];
}

- (void)deleteBackupConfirmed
{
  [(ICQLocalBackupController *)self startDeletionBezel];
  char v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke;
  block[3] = &unk_264921C80;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1440) backupUDID];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 1440);
  if (v4) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_cold_1();
  }
  id v6 = (void *)v2;
  if (v4)
  {
    double v7 = *(void **)(v3 + 1384);
    id v14 = 0;
    char v8 = [v7 deleteBackupUDID:v6 error:&v14];
    id v9 = v14;
  }
  else
  {
    id v9 = 0;
    char v8 = 1;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_2;
  v11[3] = &unk_264921C30;
  char v13 = v8;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v9;
  id v10 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = *(void **)(v2 + 1520);
    if (v3)
    {
      objc_msgSend(v3, "setDelegate:");
      uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 1520);
      id v27 = +[ICQCloudStorageInfo backupInfoHeaders];
      [v4 popAndReloadFromRemoteUI:0 additionalHeaders:v27];
    }
    else
    {
      [(id)v2 _backupDeletionSuccess];
    }
  }
  else
  {
    *(unsigned char *)(v2 + 1530) = 1;
    BOOL v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_2_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
    }

    [*(id *)(a1 + 32) endDeletionBezel];
    id v12 = [*(id *)(a1 + 40) domain];
    char v13 = @"CANNOT_DELETE_BACKUP_DETAILS";
    if ([v12 isEqualToString:@"MBErrorDomain"]
      && [*(id *)(a1 + 40) code] == 13)
    {
      char v13 = @"CANNOT_DELETE_BACKUP_LOCKED";
    }

    id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v28 = [v14 localizedStringForKey:v13 value:&stru_26DFF2C90 table:@"BackupInfo"];

    uint64_t v15 = (void *)MEMORY[0x263F82418];
    double v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v17 = [v16 localizedStringForKey:@"CANNOT_DELETE_BACKUP" value:&stru_26DFF2C90 table:@"BackupInfo"];
    double v18 = [v15 alertControllerWithTitle:v17 message:v28 preferredStyle:1];

    double v19 = (void *)MEMORY[0x263F82400];
    double v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v21 = [v20 localizedStringForKey:@"TRY_AGAIN" value:&stru_26DFF2C90 table:@"BackupInfo"];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_296;
    v29[3] = &unk_2649225E0;
    v29[4] = *(void *)(a1 + 32);
    double v22 = [v19 actionWithTitle:v21 style:0 handler:v29];
    [v18 addAction:v22];

    double v23 = (void *)MEMORY[0x263F82400];
    uint64_t v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v25 = [v24 localizedStringForKey:@"OK" value:&stru_26DFF2C90 table:@"BackupInfo"];
    uint64_t v26 = [v23 actionWithTitle:v25 style:1 handler:0];
    [v18 addAction:v26];

    [*(id *)(a1 + 32) presentViewController:v18 animated:1 completion:0];
  }
}

uint64_t __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_296(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteBackupConfirmed];
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  [(ICQLocalBackupController *)self endDeletionBezel];
  id v6 = [(ICQLocalBackupController *)self navigationController];
  id v5 = (id)[v6 popViewControllerAnimated:1];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(ICQLocalBackupController *)self specifierAtIndex:[(ICQLocalBackupController *)self indexForIndexPath:v5]];
  uint64_t v7 = [v6 identifier];

  uint64_t v8 = [(ICQLocalBackupController *)self specifierAtIndex:[(ICQLocalBackupController *)self indexForIndexPath:v5]];
  uint64_t v9 = [(ICQLocalBackupController *)self getGroupSpecifierForSpecifier:v8];

  if (([v7 isEqualToString:@"SHOW_ALL_APPS"] & 1) != 0
    || ([v9 identifier],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isEqualToString:@"DELETE_BACKUP_BUTTON_GROUP"],
        v10,
        v11))
  {
    id v12 = v5;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 deselectRowAtIndexPath:v6 animated:1];
  v8.receiver = self;
  v8.super_class = (Class)ICQLocalBackupController;
  [(ICQLocalBackupController *)&v8 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  v19.receiver = self;
  v19.super_class = (Class)ICQLocalBackupController;
  id v6 = -[ICQLocalBackupController tableView:viewForHeaderInSection:](&v19, sel_tableView_viewForHeaderInSection_, a3);
  id v7 = [(ICQLocalBackupController *)self additionalSpaceRequiredString];

  if (v7)
  {
    objc_super v8 = [(ICQLocalBackupController *)self specifierForID:@"BACKED_UP_APPS"];
    uint64_t v18 = 0;
    [(ICQLocalBackupController *)self getGroup:&v18 row:0 ofSpecifier:v8];
    if (v18 == a4)
    {
      uint64_t v9 = [v8 propertyForKey:*MEMORY[0x263F60128]];
      uint64_t v10 = [v9 subtitleAtIndex:1];
      if (!v10)
      {
        uint64_t v10 = [v9 addSubtitle];
      }
      int v11 = NSString;
      id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v13 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"ADDITONAL_SPACE_NEEDED"];
      id v14 = [v12 localizedStringForKey:v13 value:&stru_26DFF2C90 table:@"BackupInfo"];
      uint64_t v15 = [(ICQLocalBackupController *)self additionalSpaceRequiredString];
      double v16 = objc_msgSend(v11, "stringWithFormat:", v14, v15);
      [v10 setText:v16];
    }
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x263F5FBC0] instancesRespondToSelector:sel_tableView_willDisplayCell_forRowAtIndexPath_])
  {
    v25.receiver = self;
    v25.super_class = (Class)ICQLocalBackupController;
    [(ICQLocalBackupController *)&v25 tableView:v8 willDisplayCell:v9 forRowAtIndexPath:v10];
  }
  int v11 = [(ICQLocalBackupController *)self specifierAtIndex:[(ICQLocalBackupController *)self indexForIndexPath:v10]];
  id v12 = [v11 identifier];
  int v13 = [v12 isEqualToString:@"SHOW_ALL_APPS"];

  if (v13)
  {
    [v9 setIndentationLevel:1];
    [v9 setIndentationWidth:36.0];
  }
  else
  {
    id v14 = [v11 identifier];
    int v15 = [v14 isEqualToString:@"NEXT_BACKUP_SIZE"];

    if (v15)
    {
      double v16 = [(ICQLocalBackupController *)self additionalSpaceRequiredString];

      if (v16)
      {
        double v17 = (void *)MEMORY[0x263F82818];
        uint64_t v18 = [MEMORY[0x263F825C8] systemRedColor];
        v26[0] = v18;
        objc_super v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
        double v20 = [v17 configurationWithPaletteColors:v19];

        double v21 = [MEMORY[0x263F827E8] _systemImageNamed:@"exclamationmark.circle" withConfiguration:v20];
        double v22 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v21];
        [v9 setAccessoryView:v22];
      }
    }
  }
  double v23 = [v11 propertyForKey:*MEMORY[0x263F602C8]];
  if (v23)
  {
    uint64_t v24 = [v9 detailTextLabel];
    [v24 setText:v23];
  }
}

- (BOOL)scanInProgress
{
  return self->_scanInProgress;
}

- (void)setScanInProgress:(BOOL)a3
{
  self->_scanInProgress = a3;
}

- (unint64_t)backupSize
{
  return self->_backupSize;
}

- (void)setBackupSize:(unint64_t)a3
{
  self->_backupSize = a3;
}

- (NSString)additionalSpaceRequiredString
{
  return self->_additionalSpaceRequiredString;
}

- (void)setAdditionalSpaceRequiredString:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSURL)deviceImageURL
{
  return self->_deviceImageURL;
}

- (void)setDeviceImageURL:(id)a3
{
}

- (ICQPreferencesRemoteUIDelegate)remoteDelegate
{
  return self->_remoteDelegate;
}

- (void)setRemoteDelegate:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_remoteDelegate, 0);
  objc_storeStrong((id *)&self->_deletionBezel, 0);
  objc_storeStrong((id *)&self->_deviceImageURL, 0);
  objc_storeStrong((id *)&self->_additionalSpaceRequiredString, 0);
  objc_storeStrong((id *)&self->_nextBackupSizeString, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_dateOfLastBackup, 0);
  objc_storeStrong((id *)&self->_deviceBackup, 0);
  objc_storeStrong((id *)&self->_deviceIdentificationView, 0);
  objc_storeStrong((id *)&self->_nextBackupSizeSpecifier, 0);
  objc_storeStrong((id *)&self->_showAllSpecifier, 0);
  objc_storeStrong((id *)&self->_visibleAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupManager, 0);
}

- (void)setSpecifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "LocalBackup received no account info. Can't initiate backup manager.", v1, 2u);
}

- (void)setSpecifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[ICQLocalBackupController setSpecifier:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "%s unable to init MBManager with error: %@", (uint8_t *)&v2, 0x16u);
}

void __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Error removing backup domain %@: %@", (uint8_t *)&v4, 0x16u);
}

- (void)showAllApps:.cold.1()
{
}

- (void)_updateTable:toMatchArray:withVisibleArray:maxVisible:inSection:withRowOffset:.cold.1()
{
  __assert_rtn("-[ICQLocalBackupController _updateTable:toMatchArray:withVisibleArray:maxVisible:inSection:withRowOffset:]", "ICQLocalBackupController.m", 504, "originalIndex != NSNotFound");
}

- (void)beginScan
{
}

- (void)manager:(uint64_t)a3 didFailScanWithError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)currentDeviceBackupWithMBManager:(uint64_t)a3 filtering:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)specifiers
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "Setting iCPL footer as iCPL seems enabled and active account is NOT a MAID account.", v1, 2u);
}

void __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_cold_1()
{
  __assert_rtn("-[ICQLocalBackupController deleteBackupConfirmed]_block_invoke", "ICQLocalBackupController.m", 1004, "(_deviceBackup == nil) || backupUDID != nil");
}

void __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end