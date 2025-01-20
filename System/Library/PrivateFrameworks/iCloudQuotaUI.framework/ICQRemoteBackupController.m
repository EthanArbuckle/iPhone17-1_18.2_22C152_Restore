@interface ICQRemoteBackupController
+ (id)specifier;
+ (id)specifierForAccount:(id)a3;
- (BOOL)isBackupEnabled;
- (ICQPreferencesRemoteUIDelegate)remoteDelegate;
- (NSString)backupSizeString;
- (NSString)deviceIdentifier;
- (NSString)deviceName;
- (NSString)lastBackupDateString;
- (NSURL)deletionURL;
- (NSURL)deviceImageURL;
- (id)specifiers;
- (void)_backupDeletionFailedWithCode:(int64_t)a3;
- (void)_backupDeletionSuccess;
- (void)dealloc;
- (void)deleteBackupConfirmed;
- (void)endDeletionBezel;
- (void)firstDeleteConfirmation:(id)a3;
- (void)loadFailed:(id)a3 withError:(id)a4;
- (void)loadFinished:(id)a3;
- (void)loadPropertyValuesFromDictionary:(id)a3;
- (void)loadStarted:(id)a3;
- (void)loadView;
- (void)secondDeleteConfirmation;
- (void)setBackupSizeString:(id)a3;
- (void)setDeletionURL:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceImageURL:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setIsBackupEnabled:(BOOL)a3;
- (void)setLastBackupDateString:(id)a3;
- (void)setRemoteDelegate:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)startDeletionBezel;
@end

@implementation ICQRemoteBackupController

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

  return v5;
}

- (void)setSpecifier:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]), a3);
  v6 = [(ICQRemoteBackupController *)self specifier];
  v7 = [v6 objectForKeyedSubscript:@"ICQUISpecifierKeyAccount"];
  account = self->_account;
  self->_account = v7;

  if (!self->_account)
  {
    v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICQRemoteBackupController setSpecifier:](v9);
    }
  }
}

- (void)dealloc
{
  v3 = [(ICQPreferencesRemoteUIDelegate *)self->_remoteDelegate delegate];

  if (v3 == self) {
    [(ICQPreferencesRemoteUIDelegate *)self->_remoteDelegate setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)ICQRemoteBackupController;
  [(ICQRemoteBackupController *)&v4 dealloc];
}

- (void)loadPropertyValuesFromDictionary:(id)a3
{
  id v25 = a3;
  objc_super v4 = [v25 objectForKey:@"label"];
  [(ICQRemoteBackupController *)self setDeviceName:v4];

  id v5 = [v25 objectForKey:@"deviceUdid"];
  [(ICQRemoteBackupController *)self setDeviceIdentifier:v5];

  v6 = [v25 objectForKey:@"backupTimestamp"];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 integerValue];
    if (v8)
    {
      if (v8 != -1)
      {
        v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v8];
        uint64_t v12 = +[ICQLocalBackupController cellValueStyleDateStringForDate:v10];
        goto LABEL_8;
      }
      v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = v9;
      v11 = @"NEVER";
    }
    else
    {
      v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = v9;
      v11 = @"INCOMPLETE";
    }
    uint64_t v12 = [v9 localizedStringForKey:v11 value:&stru_26DFF2C90 table:@"BackupInfo"];
LABEL_8:
    v13 = (void *)v12;
    [(ICQRemoteBackupController *)self setLastBackupDateString:v12];
  }
  v14 = +[ICQLocalBackupController deviceImageURLFromAttributes:v25];
  [(ICQRemoteBackupController *)self setDeviceImageURL:v14];

  v15 = [v25 objectForKey:@"backupSize"];
  [v15 longLongValue];
  v16 = CPFSSizeStrings();
  [(ICQRemoteBackupController *)self setBackupSizeString:v16];

  v17 = [v25 objectForKey:@"deleteURL"];
  if (v17)
  {
    v18 = [NSURL URLWithString:v17];
    [(ICQRemoteBackupController *)self setDeletionURL:v18];
  }
  v19 = [v25 objectForKey:@"isActive"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v20 = [v19 BOOLValue];
  }
  else {
    uint64_t v20 = 0;
  }
  [(ICQRemoteBackupController *)self setIsBackupEnabled:v20];
  v21 = [(ICQRemoteBackupController *)self deviceName];
  if (!v21) {
    -[ICQRemoteBackupController loadPropertyValuesFromDictionary:]();
  }

  v22 = [(ICQRemoteBackupController *)self backupSizeString];
  if (!v22) {
    -[ICQRemoteBackupController loadPropertyValuesFromDictionary:]();
  }

  v23 = [(ICQRemoteBackupController *)self deletionURL];
  if (!v23) {
    -[ICQRemoteBackupController loadPropertyValuesFromDictionary:]();
  }

  v24 = [(ICQRemoteBackupController *)self lastBackupDateString];
  if (!v24) {
    -[ICQRemoteBackupController loadPropertyValuesFromDictionary:].cold.4();
  }
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)ICQRemoteBackupController;
  [(ICQRemoteBackupController *)&v13 loadView];
  v3 = [(ICQRemoteBackupController *)self specifier];
  objc_super v4 = [v3 propertyForKey:@"attributes"];
  [(ICQRemoteBackupController *)self loadPropertyValuesFromDictionary:v4];

  id v5 = [(ICQRemoteBackupController *)self specifier];
  v6 = [v5 propertyForKey:@"remoteDelegate"];
  [(ICQRemoteBackupController *)self setRemoteDelegate:v6];

  v7 = [ICQDeviceIdentificationView alloc];
  uint64_t v8 = [(ICQRemoteBackupController *)self deviceName];
  v9 = [(ICQRemoteBackupController *)self deviceIdentifier];
  v10 = [(ICQRemoteBackupController *)self deviceImageURL];
  v11 = -[ICQDeviceIdentificationView initWithFrame:deviceName:deviceIdentifier:imageURL:isCurrentDevice:](v7, "initWithFrame:deviceName:deviceIdentifier:imageURL:isCurrentDevice:", v8, v9, v10, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  deviceIdentificationView = self->_deviceIdentificationView;
  self->_deviceIdentificationView = v11;

  [(ICQDeviceIdentificationView *)self->_deviceIdentificationView setLeftExtraMargin:16.0];
  [(ICQDeviceIdentificationView *)self->_deviceIdentificationView sizeToFit];
  [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) setTableHeaderView:self->_deviceIdentificationView];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"REMOTE_HEADER"];
    if (!self->_isBackupEnabled)
    {
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v7 localizedStringForKey:@"REMOTE_DEVICE_INACTIVE" value:&stru_26DFF2C90 table:@"BackupInfo"];
      [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x263F600F8]];
    }
    [v5 addObject:v6];
    v9 = (void *)MEMORY[0x263F5FC40];
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v27 = v6;
    v11 = [v10 localizedStringForKey:@"LATEST_BACKUP" value:&stru_26DFF2C90 table:@"BackupInfo"];
    uint64_t v12 = [v9 preferenceSpecifierNamed:v11 target:self set:0 get:sel_lastBackupDateString detail:0 cell:4 edit:0];

    [v5 addObject:v12];
    objc_super v13 = (void *)MEMORY[0x263F5FC40];
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"BACKUP_SIZE" value:&stru_26DFF2C90 table:@"BackupInfo"];
    v16 = [v13 preferenceSpecifierNamed:v15 target:self set:0 get:sel_backupSizeString detail:0 cell:4 edit:0];

    [v5 addObject:v16];
    if (self->_isBackupEnabled) {
      v17 = @"DELETE_BACKUP_AND_TURN_OFF_BACKUP";
    }
    else {
      v17 = @"DELETE_BACKUP";
    }
    v18 = (void *)MEMORY[0x263F5FC40];
    v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v20 = [v19 localizedStringForKey:v17 value:&stru_26DFF2C90 table:@"BackupInfo"];
    v21 = [v18 deleteButtonSpecifierWithName:v20 target:self action:sel_firstDeleteConfirmation_];

    v22 = [(ICQRemoteBackupController *)self deletionURL];

    if (!v22)
    {
      v23 = [NSNumber numberWithBool:0];
      [v21 setProperty:v23 forKey:*MEMORY[0x263F600A8]];
    }
    v24 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 addObject:v24];

    [v5 addObject:v21];
    id v25 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)firstDeleteConfirmation:(id)a3
{
  if (self->_isBackupEnabled) {
    objc_super v4 = @"TURN_OFF_AND_DELETE";
  }
  else {
    objc_super v4 = @"DELETE";
  }
  v23 = v4;
  if (self->_isBackupEnabled) {
    id v5 = @"TURN_OFF_REMOTE_ACTIVE_PROMPT_TEXT";
  }
  else {
    id v5 = @"TURN_OFF_REMOTE_INACTIVE_PROMPT_TEXT";
  }
  v6 = NSString;
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"TURN_OFF_REMOTE_PROMPT_TITLE" value:&stru_26DFF2C90 table:@"BackupInfo"];
  v9 = [(ICQRemoteBackupController *)self deviceName];
  v22 = objc_msgSend(v6, "stringWithFormat:", v8, v9);

  v10 = NSString;
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:v5 value:&stru_26DFF2C90 table:@"BackupInfo"];
  objc_super v13 = [(ICQRemoteBackupController *)self deviceName];
  v14 = objc_msgSend(v10, "stringWithFormat:", v12, v13);

  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:v23 value:&stru_26DFF2C90 table:@"BackupInfo"];

  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"CANCEL" value:&stru_26DFF2C90 table:@"BackupInfo"];

  v19 = [MEMORY[0x263F82418] sheetAlertControllerWithTitle:v22 message:v14];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __53__ICQRemoteBackupController_firstDeleteConfirmation___block_invoke;
  v24[3] = &unk_2649225E0;
  v24[4] = self;
  uint64_t v20 = [MEMORY[0x263F82400] actionWithTitle:v16 style:2 handler:v24];
  v21 = [MEMORY[0x263F82400] actionWithTitle:v18 style:1 handler:&__block_literal_global_24];
  [v19 addAction:v20];
  [v19 addAction:v21];
  [(ICQRemoteBackupController *)self presentViewController:v19 animated:1 completion:0];
}

uint64_t __53__ICQRemoteBackupController_firstDeleteConfirmation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) secondDeleteConfirmation];
}

- (void)secondDeleteConfirmation
{
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"SECOND_TURN_OFF_REMOTE_PROMPT_TITLE" value:&stru_26DFF2C90 table:@"BackupInfo"];

  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"SECOND_TURN_OFF_REMOTE_PROMPT_TEXT" value:&stru_26DFF2C90 table:@"BackupInfo"];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"SECOND_TURN_OFF_REMOTE_PROMPT_ACTION" value:&stru_26DFF2C90 table:@"BackupInfo"];

  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_26DFF2C90 table:@"BackupInfo"];

  v11 = [MEMORY[0x263F82418] sheetAlertControllerWithTitle:v4 message:v6];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__ICQRemoteBackupController_secondDeleteConfirmation__block_invoke;
  v14[3] = &unk_2649225E0;
  v14[4] = self;
  uint64_t v12 = [MEMORY[0x263F82400] actionWithTitle:v8 style:2 handler:v14];
  objc_super v13 = [MEMORY[0x263F82400] actionWithTitle:v10 style:1 handler:&__block_literal_global_123_0];
  [v11 addAction:v12];
  [v11 addAction:v13];
  [(ICQRemoteBackupController *)self presentViewController:v11 animated:1 completion:0];
}

uint64_t __53__ICQRemoteBackupController_secondDeleteConfirmation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteBackupConfirmed];
}

- (void)startDeletionBezel
{
  uint64_t v3 = [(ICQRemoteBackupController *)self navigationController];
  objc_super v4 = [v3 view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  float v9 = (v6 + -156.0) * 0.5;
  double v10 = floorf(v9);
  float v11 = (v8 + -126.0) * 0.5;
  double v12 = floorf(v11);
  objc_super v13 = [(ICQRemoteBackupController *)self navigationController];
  v14 = [v13 view];
  v15 = [(ICQRemoteBackupController *)self view];
  objc_msgSend(v14, "convertRect:toView:", v15, v10, v12, 156.0, 126.0);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v24 = -[ICQSpinnerBezel initWithFrame:]([ICQSpinnerBezel alloc], "initWithFrame:", v17, v19, v21, v23);
  deletionBezel = self->_deletionBezel;
  self->_deletionBezel = v24;

  v26 = self->_deletionBezel;
  v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"DELETING" value:&stru_26DFF2C90 table:@"BackupInfo"];
  [(ICQSpinnerBezel *)v26 setBezelText:v28];

  v29 = [(ICQRemoteBackupController *)self view];
  [v29 addSubview:self->_deletionBezel];

  id v31 = [(ICQRemoteBackupController *)self view];
  v30 = [v31 window];
  [v30 setUserInteractionEnabled:0];
}

- (void)endDeletionBezel
{
  uint64_t v3 = [(ICQRemoteBackupController *)self view];
  objc_super v4 = [v3 window];
  [v4 setUserInteractionEnabled:1];

  [(ICQSpinnerBezel *)self->_deletionBezel removeFromSuperview];
  deletionBezel = self->_deletionBezel;
  self->_deletionBezel = 0;
}

- (void)_backupDeletionFailedWithCode:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  double v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [(ICQRemoteBackupController *)self deletionURL];
    *(_DWORD *)buf = 138412290;
    id v25 = v6;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Deletion URL: %@", buf, 0xCu);
  }
  double v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v8 = v7;
  if (a3 == 423) {
    float v9 = @"CANNOT_DELETE_BACKUP_LOCKED";
  }
  else {
    float v9 = @"CANNOT_DELETE_BACKUP_DETAILS";
  }
  double v10 = [v7 localizedStringForKey:v9 value:&stru_26DFF2C90 table:@"BackupInfo"];

  float v11 = (void *)MEMORY[0x263F82418];
  double v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v13 = [v12 localizedStringForKey:@"CANNOT_DELETE_BACKUP" value:&stru_26DFF2C90 table:@"BackupInfo"];
  v14 = [v11 alertControllerWithTitle:v13 message:v10 preferredStyle:1];

  v15 = (void *)MEMORY[0x263F82400];
  double v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v17 = [v16 localizedStringForKey:@"TRY_AGAIN" value:&stru_26DFF2C90 table:@"BackupInfo"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __59__ICQRemoteBackupController__backupDeletionFailedWithCode___block_invoke;
  v23[3] = &unk_2649225E0;
  v23[4] = self;
  double v18 = [v15 actionWithTitle:v17 style:0 handler:v23];
  [v14 addAction:v18];

  double v19 = (void *)MEMORY[0x263F82400];
  double v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v21 = [v20 localizedStringForKey:@"OK" value:&stru_26DFF2C90 table:@"BackupInfo"];
  double v22 = [v19 actionWithTitle:v21 style:1 handler:0];
  [v14 addAction:v22];

  [(ICQRemoteBackupController *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __59__ICQRemoteBackupController__backupDeletionFailedWithCode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteBackupConfirmed];
}

- (void)_backupDeletionSuccess
{
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Backup deletion completed sucessfully.", v7, 2u);
  }

  [(ICQRemoteBackupController *)self endDeletionBezel];
  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"BackupInfoDidChange" object:0];

  double v5 = [(ICQRemoteBackupController *)self navigationController];
  id v6 = (id)[v5 popViewControllerAnimated:1];
}

- (void)deleteBackupConfirmed
{
  [(ICQRemoteBackupController *)self startDeletionBezel];
  uint64_t v3 = (void *)MEMORY[0x263F089E0];
  objc_super v4 = [(ICQRemoteBackupController *)self deletionURL];
  double v5 = [v3 requestWithURL:v4];

  +[ICQUsageQuotaRequest addHeadersToRequest:v5 forAccount:self->_account];
  [v5 setHTTPMethod:@"POST"];
  id v6 = [MEMORY[0x263F08BF8] sharedSession];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__ICQRemoteBackupController_deleteBackupConfirmed__block_invoke;
  v8[3] = &unk_264921C00;
  v8[4] = self;
  double v7 = [v6 dataTaskWithRequest:v5 completionHandler:v8];

  [v7 resume];
}

void __50__ICQRemoteBackupController_deleteBackupConfirmed__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ICQRemoteBackupController_deleteBackupConfirmed__block_invoke_2;
  block[3] = &unk_264922568;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__ICQRemoteBackupController_deleteBackupConfirmed__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [*(id *)(a1 + 40) endDeletionBezel];
    double v5 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Error deleting remote backup: %@", buf, 0xCu);
    }

    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = -1;
    goto LABEL_13;
  }
  uint64_t v2 = [*(id *)(a1 + 32) statusCode];
  if (v2 != 200)
  {
    uint64_t v9 = v2;
    [*(id *)(a1 + 40) endDeletionBezel];
    id v10 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v9;
      _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Failed to delete backup, status code: %ld", buf, 0xCu);
    }

    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = v9;
LABEL_13:
    [v7 _backupDeletionFailedWithCode:v8];
    return;
  }
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 1448);
  if (v3)
  {
    objc_msgSend(v3, "setDelegate:");
    objc_super v4 = *(void **)(*(void *)(a1 + 40) + 1448);
    id v12 = +[ICQCloudStorageInfo backupInfoHeaders];
    objc_msgSend(v4, "popAndReloadFromRemoteUI:additionalHeaders:", 0);
  }
  else
  {
    float v11 = *(void **)(a1 + 40);
    [v11 _backupDeletionSuccess];
  }
}

- (void)loadStarted:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_super v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "loadStarted: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)loadFinished:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "loadFinished: %@", (uint8_t *)&v6, 0xCu);
  }

  [(ICQRemoteBackupController *)self endDeletionBezel];
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v5 = a4;
  int v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ICQRemoteBackupController loadFailed:withError:]((uint64_t)v5, v6);
  }

  [(ICQRemoteBackupController *)self endDeletionBezel];
  id v7 = [(ICQRemoteBackupController *)self navigationController];
  id v8 = (id)[v7 popViewControllerAnimated:1];
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

- (NSString)backupSizeString
{
  return self->_backupSizeString;
}

- (void)setBackupSizeString:(id)a3
{
}

- (NSString)lastBackupDateString
{
  return self->_lastBackupDateString;
}

- (void)setLastBackupDateString:(id)a3
{
}

- (NSURL)deletionURL
{
  return self->_deletionURL;
}

- (void)setDeletionURL:(id)a3
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

- (BOOL)isBackupEnabled
{
  return self->_isBackupEnabled;
}

- (void)setIsBackupEnabled:(BOOL)a3
{
  self->_isBackupEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_remoteDelegate, 0);
  objc_storeStrong((id *)&self->_deletionBezel, 0);
  objc_storeStrong((id *)&self->_deviceImageURL, 0);
  objc_storeStrong((id *)&self->_deletionURL, 0);
  objc_storeStrong((id *)&self->_lastBackupDateString, 0);
  objc_storeStrong((id *)&self->_backupSizeString, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentificationView, 0);
}

- (void)setSpecifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Remote Backup received no account info. Requests may fail.", v1, 2u);
}

- (void)loadPropertyValuesFromDictionary:.cold.1()
{
}

- (void)loadPropertyValuesFromDictionary:.cold.2()
{
}

- (void)loadPropertyValuesFromDictionary:.cold.3()
{
}

- (void)loadPropertyValuesFromDictionary:.cold.4()
{
}

- (void)loadFailed:(uint64_t)a1 withError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "loadFailed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end