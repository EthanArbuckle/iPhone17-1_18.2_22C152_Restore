@interface ICQDeviceBackupSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)handleURL:(id)a3;
- (ICQDeviceBackupSpecifierProvider)initWithAccount:(id)a3 presenter:(id)a4;
- (ICQDeviceBackupSpecifierProvider)initWithAccountManager:(id)a3;
- (NSArray)specifiers;
- (id)_backupDevicesSpecififers:(id)a3;
- (id)_specifierForSpinner;
- (id)_valueForBackUpDevice:(id)a3;
- (void)_fetchBackupInfo;
- (void)_handleLocalDeviceDeeplink;
- (void)_reloadSpecifiers;
- (void)_startObservingBackupChanges;
- (void)dealloc;
- (void)loadFailed:(id)a3 withError:(id)a4;
- (void)loadFinished:(id)a3;
- (void)loadStarted:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICQDeviceBackupSpecifierProvider

- (ICQDeviceBackupSpecifierProvider)initWithAccountManager:(id)a3
{
  v4 = [a3 accounts];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
  v6 = [(ICQDeviceBackupSpecifierProvider *)self initWithAccount:v5 presenter:0];

  return v6;
}

- (ICQDeviceBackupSpecifierProvider)initWithAccount:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQDeviceBackupSpecifierProvider;
  v9 = [(ICQDeviceBackupSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
    v10->_isBackupRequestInProgress = 0;
    [(ICQDeviceBackupSpecifierProvider *)v10 _fetchBackupInfo];
    [(ICQDeviceBackupSpecifierProvider *)v10 _startObservingBackupChanges];
  }

  return v10;
}

- (void)dealloc
{
  if (self->_backupChangesNotificationObserver)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_backupChangesNotificationObserver name:@"BackupInfoDidChange" object:0];

    id backupChangesNotificationObserver = self->_backupChangesNotificationObserver;
    self->_id backupChangesNotificationObserver = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ICQDeviceBackupSpecifierProvider;
  [(ICQDeviceBackupSpecifierProvider *)&v5 dealloc];
}

- (NSArray)specifiers
{
  v19[2] = *MEMORY[0x263EF8340];
  specifiers = self->_specifiers;
  if (specifiers)
  {
    v3 = specifiers;
    goto LABEL_9;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  backupInfo = self->_backupInfo;
  if (backupInfo)
  {
    id v7 = [(ICQBackupInfo *)backupInfo deviceGroups];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__ICQDeviceBackupSpecifierProvider_specifiers__block_invoke;
    v16[3] = &unk_264922098;
    id v8 = v5;
    id v17 = v8;
    v18 = self;
    [v7 enumerateObjectsUsingBlock:v16];

    v9 = (NSArray *)[v8 copy];
    v10 = self->_specifiers;
    self->_specifiers = v9;

    v11 = v17;
LABEL_7:

    goto LABEL_8;
  }
  if (self->_isBackupRequestInProgress)
  {
    v11 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"BACKUP_DEVICES_GROUP"];
    v19[0] = v11;
    objc_super v12 = [(ICQDeviceBackupSpecifierProvider *)self _specifierForSpinner];
    v19[1] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v14 = self->_specifiers;
    self->_specifiers = v13;

    goto LABEL_7;
  }
LABEL_8:
  v3 = self->_specifiers;

LABEL_9:
  return v3;
}

void __46__ICQDeviceBackupSpecifierProvider_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  v3 = [v13 backupDevices];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F5FC40];
    v6 = [v13 sectionHeader];
    id v7 = [v5 groupSpecifierWithID:@"BACKUP_DEVICES_GROUP" name:v6];

    id v8 = [v13 sectionFooter];
    uint64_t v9 = *MEMORY[0x263F600F8];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F600F8]];

    v10 = [v13 sectionFooter];
    [v7 setProperty:v10 forKey:v9];

    [*(id *)(a1 + 32) addObject:v7];
    v11 = *(void **)(a1 + 32);
    objc_super v12 = [*(id *)(a1 + 40) _backupDevicesSpecififers:v13];
    [v11 addObjectsFromArray:v12];
  }
}

- (id)_specifierForSpinner
{
  return (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
}

- (id)_backupDevicesSpecififers:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 backupDevices];

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __62__ICQDeviceBackupSpecifierProvider__backupDevicesSpecififers___block_invoke;
  v14 = &unk_2649220C0;
  v15 = self;
  id v16 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:&v11];

  uint64_t v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14, v15);
  return v9;
}

void __62__ICQDeviceBackupSpecifierProvider__backupDevicesSpecififers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 isLocalBackup];
  id v5 = off_264920E78;
  if (v4) {
    id v5 = off_264920DD8;
  }
  id v11 = [(__objc2_class *)*v5 specifierForAccount:*(void *)(*(void *)(a1 + 32) + 8)];
  id v6 = [v3 rawDictionary];
  [v11 setProperty:v6 forKey:@"attributes"];

  [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
  id v7 = [v3 imageURL];
  id v8 = +[_ICQUIHelperFunctions scaledImageURL:v7];
  [v11 setProperty:v8 forKey:*MEMORY[0x263F601B0]];

  [v11 setObject:*(void *)(*(void *)(a1 + 32) + 8) forKeyedSubscript:@"ICQUISpecifierKeyAccount"];
  [v11 setTarget:v3];
  [v11 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  uint64_t v9 = [v3 deviceName];
  [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x263F602D0]];

  [v11 setCellType:1];
  v10 = [v3 deviceSubtitle];
  [v11 setObject:v10 forKeyedSubscript:*MEMORY[0x263F602C8]];

  [v11 setTarget:v3];
  [*(id *)(a1 + 40) addObject:v11];
}

- (id)_valueForBackUpDevice:(id)a3
{
  id v3 = a3;
  int v4 = [v3 target];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && ([v3 target], (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = v6;
    id v8 = [v6 storageUsedLabel];
  }
  else
  {
    id v8 = &stru_26DFF2C90;
  }

  return v8;
}

- (void)_fetchBackupInfo
{
  self->_isBackupRequestInProgress = 1;
  id v3 = (void *)[objc_alloc(MEMORY[0x263F888D0]) initWithAccount:self->_account];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke;
  v4[3] = &unk_2649220E8;
  v4[4] = self;
  [v3 fetchBackupinfoWithCompletion:v4];
}

void __52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  if (v7)
  {
    id v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke_cold_1((uint64_t)v7, v8);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke_50;
  block[3] = &unk_264921C80;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void *__52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke_50(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadSpecifiers];
  result = *(void **)(a1 + 32);
  if (result[6])
  {
    return (void *)[result _handleLocalDeviceDeeplink];
  }
  return result;
}

- (void)_reloadSpecifiers
{
  id v5 = (id)[(NSArray *)self->_specifiers copy];
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  [WeakRetained reloadSpecifiersForProvider:self oldSpecifiers:v5 animated:1];
}

- (void)loadStarted:(id)a3
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Backup info RUI view loading started.", v4, 2u);
  }
}

- (void)loadFinished:(id)a3
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Backup info RUI view load finished with success.", v4, 2u);
  }
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Backup info RUI view load failed with error: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_startObservingBackupChanges
{
  if (!self->_backupChangesNotificationObserver)
  {
    objc_initWeak(&location, self);
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    id v4 = [MEMORY[0x263F08A48] mainQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __64__ICQDeviceBackupSpecifierProvider__startObservingBackupChanges__block_invoke;
    v7[3] = &unk_264922110;
    objc_copyWeak(&v8, &location);
    id v5 = [v3 addObserverForName:@"BackupInfoDidChange" object:0 queue:v4 usingBlock:v7];
    id backupChangesNotificationObserver = self->_backupChangesNotificationObserver;
    self->_id backupChangesNotificationObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __64__ICQDeviceBackupSpecifierProvider__startObservingBackupChanges__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = @"BackupInfoDidChange";
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchBackupInfo];
}

- (BOOL)handleURL:(id)a3
{
  int v4 = (NSDictionary *)[a3 copy];
  resourceDictionary = self->_resourceDictionary;
  self->_resourceDictionary = v4;

  if (self->_isBackupRequestInProgress)
  {
    uint64_t v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Backup info request is in progress, will handle deeplink a bit later.", buf, 2u);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__ICQDeviceBackupSpecifierProvider_handleURL___block_invoke;
    block[3] = &unk_264921C80;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return 1;
}

uint64_t __46__ICQDeviceBackupSpecifierProvider_handleURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLocalDeviceDeeplink];
}

- (void)_handleLocalDeviceDeeplink
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "No local backup specifier found. Failed to handle deeplink.", v1, 2u);
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resourceDictionary, 0);
  objc_storeStrong(&self->_backupChangesNotificationObserver, 0);
  objc_storeStrong((id *)&self->_backupInfo, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_account, 0);
}

void __52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch backup info with error: %@", (uint8_t *)&v2, 0xCu);
}

@end