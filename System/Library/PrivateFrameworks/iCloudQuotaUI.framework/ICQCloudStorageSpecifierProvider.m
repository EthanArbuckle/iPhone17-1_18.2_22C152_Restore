@interface ICQCloudStorageSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)_handleManagedStorageURL:(id)a3;
- (BOOL)handleURL:(id)a3;
- (Class)tableCellClassForTableViewRow:(id)a3;
- (ICQCloudStorageSpecifierProvider)initWithAccountManager:(id)a3;
- (ICQCloudStorageSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (NSString)initialStorageFlowAction;
- (id)_valueForStorageGraphSpecifier:(id)a3;
- (id)account;
- (void)_createNativeManageStorageIfNeeded;
- (void)_enterManageStorage:(id)a3;
- (void)_fetchStorageSummary:(id)a3;
- (void)_fetchStorageSummary:(id)a3 completion:(id)a4;
- (void)_finishLoadingActiveSpecifier;
- (void)_handleStorageUpgradeURL:(id)a3;
- (void)_manageStorageSpecifierWasTapped:(id)a3;
- (void)_reloadStorageSpecifiers;
- (void)_replaceRUISectionWithTipUIFromObjectModel:(id)a3 inPage:(id)a4;
- (void)_startObservingQuotaChangeNotifications;
- (void)_stopObservingQuotaChangeNotifications;
- (void)dealloc;
- (void)loadFailed:(id)a3 withError:(id)a4;
- (void)loadFinished:(id)a3;
- (void)loadStarted:(id)a3;
- (void)remoteUIDelegate:(id)a3 didCreatePage:(id)a4 inObjectModel:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setInitialStorageFlowAction:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICQCloudStorageSpecifierProvider

- (ICQCloudStorageSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(ICQCloudStorageSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (ICQCloudStorageSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICQCloudStorageSpecifierProvider;
  v9 = [(ICQCloudStorageSpecifierProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
    uint64_t v11 = [MEMORY[0x263F88970] sharedFollowUpController];
    followUpController = v10->_followUpController;
    v10->_followUpController = (FLFollowUpController *)v11;

    [(ICQCloudStorageSpecifierProvider *)v10 _startObservingQuotaChangeNotifications];
  }

  return v10;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (void)dealloc
{
  [(ICQCloudStorageSpecifierProvider *)self _stopObservingQuotaChangeNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ICQCloudStorageSpecifierProvider;
  [(ICQCloudStorageSpecifierProvider *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_storeWeak((id *)p_delegate, v4);
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (specifiers)
  {
    objc_super v3 = specifiers;
    goto LABEL_13;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v5 addObject:v6];

  if (!self->_storageGraphSpecifier)
  {
    id v7 = (void *)MEMORY[0x263F5FC40];
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"ICLOUD_TITLE" value:&stru_26DFF2C90 table:@"CloudGroup"];
    v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:sel__valueForStorageGraphSpecifier_ detail:0 cell:-1 edit:0];
    storageGraphSpecifier = self->_storageGraphSpecifier;
    self->_storageGraphSpecifier = v10;

    [(PSSpecifier *)self->_storageGraphSpecifier setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  }
  v12 = [NSNumber numberWithInt:self->_storageSummary != 0];
  [(PSSpecifier *)self->_storageGraphSpecifier setObject:v12 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [(PSSpecifier *)self->_storageGraphSpecifier setIdentifier:@"iCloudStorageBarGraph"];
  [v5 addObject:self->_storageGraphSpecifier];
  if (self->_manageStorageSpecifier) {
    goto LABEL_11;
  }
  v13 = [(ICQCloudStorageSpecifierProvider *)self account];
  if (objc_msgSend(v13, "aa_isAccountClass:", *MEMORY[0x263F25618]))
  {
  }
  else
  {
    objc_super v14 = [(ICQCloudStorageSpecifierProvider *)self account];
    int v15 = objc_msgSend(v14, "aa_isManagedAppleID");

    if (!v15) {
      goto LABEL_10;
    }
  }
  v16 = (void *)MEMORY[0x263F5FC40];
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"ICLOUD_MANAGE_STORAGE" value:&stru_26DFF2C90 table:@"CloudGroup"];
  v19 = [v16 preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:1 edit:0];
  manageStorageSpecifier = self->_manageStorageSpecifier;
  self->_manageStorageSpecifier = v19;

  [(PSSpecifier *)self->_manageStorageSpecifier setIdentifier:@"STORAGE_AND_BACKUP"];
  [(PSSpecifier *)self->_manageStorageSpecifier setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  [(PSSpecifier *)self->_manageStorageSpecifier setControllerLoadAction:sel__manageStorageSpecifierWasTapped_];
LABEL_10:
  if (self->_manageStorageSpecifier) {
LABEL_11:
  }
    objc_msgSend(v5, "addObject:");
  v21 = (NSArray *)[v5 copy];
  v22 = self->_specifiers;
  self->_specifiers = v21;

  objc_super v3 = self->_specifiers;
LABEL_13:
  return v3;
}

- (id)_valueForStorageGraphSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F25C68]];
  char v6 = [v5 BOOLValue];

  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F25C70]];
  char v8 = [v7 BOOLValue];

  storageSummary = self->_storageSummary;
  if (storageSummary || (v6 & 1) != 0 || (v8 & 1) != 0)
  {
    if (storageSummary)
    {
      v10 = [(ICQCloudStorageSummary *)storageSummary displayLabel];
      [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x263F602D0]];

      uint64_t v11 = [(ICQCloudStorageSummary *)self->_storageSummary manageStorageTitle];
      [(PSSpecifier *)self->_manageStorageSpecifier setName:v11];

      v12 = [(ICQCloudStorageSummary *)self->_storageSummary totalStorage];
      [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x263F25C50]];

      v13 = [(ICQCloudStorageSummary *)self->_storageSummary freeStorage];
      [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x263F25C48]];

      objc_super v14 = [(ICQCloudStorageSummary *)self->_storageSummary usedStorage];
      [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x263F25C60]];

      int v15 = [(ICQCloudStorageSummary *)self->_storageSummary icqui_AAUIiCloudMediaUsageInfo];
      [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x263F25C58]];
    }
  }
  else
  {
    [(ICQCloudStorageSpecifierProvider *)self _fetchStorageSummary:v4];
  }

  return 0;
}

- (void)_manageStorageSpecifierWasTapped:(id)a3
{
  storageSummary = self->_storageSummary;
  id v5 = a3;
  if (storageSummary)
  {
    [(ICQCloudStorageSpecifierProvider *)self _enterManageStorage:v5];
  }
  else
  {
    char v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ICQCloudStorageSpecifierProvider _manageStorageSpecifierWasTapped:](v6);
    }

    self->_delayedEnterManageStorage = 1;
    [(ICQCloudStorageSpecifierProvider *)self _fetchStorageSummary:v5];
  }
}

- (void)_enterManageStorage:(id)a3
{
  id v5 = a3;
  char v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ICQCloudStorageSpecifierProvider _enterManageStorage:](v6);
  }

  if (self->_activeSpecifier)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Currently loading managed storage page. Bailing.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    char v8 = [ICQPreferencesRemoteUIDelegate alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    v10 = [WeakRetained navigationController];
    initialStorageFlowAction = self->_initialStorageFlowAction;
    v12 = [(ICQCloudStorageSpecifierProvider *)self account];
    v13 = [(ICQPreferencesRemoteUIDelegate *)v8 initWithNavigationController:v10 initialAction:initialStorageFlowAction account:v12];
    ruiDelegate = self->_ruiDelegate;
    self->_ruiDelegate = v13;

    [(ICQPreferencesRemoteUIDelegate *)self->_ruiDelegate setIsManageStorage:1];
    int v15 = self->_initialStorageFlowAction;
    self->_initialStorageFlowAction = 0;

    [(ICQPreferencesRemoteUIDelegate *)self->_ruiDelegate setDelegate:self];
    if ([(ICQCloudStorageSummary *)self->_storageSummary shouldUseNativeManageStorage])
    {
      v16 = _ICQGetLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_22C821000, v16, OS_LOG_TYPE_DEFAULT, "Detected V2 Storage Summary API, will use native Manage Storage view", (uint8_t *)buf, 2u);
      }

      [(ICQPreferencesRemoteUIDelegate *)self->_ruiDelegate setNextSignpostId:@"MANAGE_DRILLDOWN"];
      [(ICQCloudStorageSpecifierProvider *)self _createNativeManageStorageIfNeeded];
      [(ICQUINativeManageStorageController *)self->_nativeManageStorage refreshAppList];
      v17 = [(ICQCloudStorageSpecifierProvider *)self delegate];
      [v17 specifierProvider:self showViewController:self->_nativeManageStorage];
    }
    else
    {
      [(ICQPreferencesRemoteUIDelegate *)self->_ruiDelegate setNextSignpostId:@"MANAGE"];
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      [v18 specifierProvider:self willBeginLoadingSpecifier:v5];

      objc_storeStrong((id *)&self->_activeSpecifier, a3);
      objc_initWeak(buf, self->_ruiDelegate);
      v19 = [(ICQCloudStorageSummary *)self->_storageSummary manageStorageURL];
      v20 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__ICQCloudStorageSpecifierProvider__enterManageStorage___block_invoke;
      block[3] = &unk_264923A78;
      block[4] = self;
      objc_copyWeak(&v24, buf);
      id v23 = v19;
      id v21 = v19;
      dispatch_async(v20, block);

      objc_destroyWeak(&v24);
      objc_destroyWeak(buf);
    }
  }
}

void __56__ICQCloudStorageSpecifierProvider__enterManageStorage___block_invoke(id *a1)
{
  v2 = [a1[4] account];
  objc_super v3 = +[ICQCloudStorageInfo backupInfoHeadersForAccount:v2];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ICQCloudStorageSpecifierProvider__enterManageStorage___block_invoke_2;
  block[3] = &unk_264923A50;
  objc_copyWeak(&v8, a1 + 6);
  id v6 = a1[5];
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __56__ICQCloudStorageSpecifierProvider__enterManageStorage___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained loadURL:*(void *)(a1 + 32) postBody:0 additionalHeaders:*(void *)(a1 + 40)];
}

- (void)_fetchStorageSummary:(id)a3
{
}

- (void)_fetchStorageSummary:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F25C68];
  v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F25C68]];
  if ([v9 BOOLValue])
  {

LABEL_4:
    v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "Already fetching cloud storage summary. Bailing.", buf, 2u);
    }

    goto LABEL_12;
  }
  v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F25C70]];
  int v11 = [v10 BOOLValue];

  if (v11) {
    goto LABEL_4;
  }
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained specifierProvider:self willBeginLoadingSpecifier:v6];

    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v8];
  }
  *(void *)buf = 0;
  v25 = buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__12;
  v28 = __Block_byref_object_dispose__12;
  id v14 = objc_alloc(MEMORY[0x263F888D0]);
  int v15 = [(ICQCloudStorageSpecifierProvider *)self account];
  id v29 = (id)[v14 initWithAccount:v15];

  v16 = _ICQGetLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_opt_class();
    *(_DWORD *)v30 = 138412290;
    v31 = v17;
    id v18 = v17;
    _os_log_impl(&dword_22C821000, v16, OS_LOG_TYPE_DEFAULT, "%@: requesting storage summary.", v30, 0xCu);
  }
  v19 = (void *)*((void *)v25 + 5);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __68__ICQCloudStorageSpecifierProvider__fetchStorageSummary_completion___block_invoke;
  v20[3] = &unk_264923AC8;
  v20[4] = self;
  id v21 = v6;
  id v22 = v7;
  id v23 = buf;
  [v19 fetchStorageSummaryWithCompletion:v20];

  _Block_object_dispose(buf, 8);
LABEL_12:
}

void __68__ICQCloudStorageSpecifierProvider__fetchStorageSummary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__ICQCloudStorageSpecifierProvider__fetchStorageSummary_completion___block_invoke_2;
  v11[3] = &unk_264923AA0;
  id v7 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v8 = *(id *)(a1 + 48);
  id v14 = v6;
  id v15 = v8;
  uint64_t v16 = *(void *)(a1 + 56);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __68__ICQCloudStorageSpecifierProvider__fetchStorageSummary_completion___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    [v2 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F25C68]];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
    [WeakRetained specifierProvider:*(void *)(a1 + 32) didFinishLoadingSpecifier:*(void *)(a1 + 48)];
  }
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *MEMORY[0x263F25C70];
  if (*(void *)(a1 + 40))
  {
    [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v5];
    [*(id *)(a1 + 32) _reloadStorageSpecifiers];
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v6 + 40))
    {
      *(unsigned char *)(v6 + 40) = 0;
      [*(id *)(a1 + 32) _enterManageStorage:*(void *)(a1 + 48)];
    }
  }
  else
  {
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v5];
    [*(id *)(a1 + 32) _reloadStorageSpecifiers];
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if (v7) {
    (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, *(void *)(a1 + 40), *(void *)(a1 + 56));
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)_reloadStorageSpecifiers
{
  if (self->_storageGraphSpecifier)
  {
    objc_super v3 = [(ICQCloudStorageSpecifierProvider *)self delegate];
    id v4 = [(PSSpecifier *)self->_storageGraphSpecifier identifier];
    [v3 reloadSpecifierForProvider:self identifier:v4];
  }
  if (self->_manageStorageSpecifier)
  {
    id v6 = [(ICQCloudStorageSpecifierProvider *)self delegate];
    uint64_t v5 = [(PSSpecifier *)self->_manageStorageSpecifier identifier];
    [v6 reloadSpecifierForProvider:self identifier:v5];
  }
}

- (void)_finishLoadingActiveSpecifier
{
  if (self->_activeSpecifier)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained specifierProvider:self didFinishLoadingSpecifier:self->_activeSpecifier];

    activeSpecifier = self->_activeSpecifier;
    self->_activeSpecifier = 0;
  }
}

- (void)loadStarted:(id)a3
{
  objc_super v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Manage storage loading started.", v4, 2u);
  }
}

- (void)loadFinished:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Manage storage load finished with success.", v6, 2u);
  }

  [(ICQCloudStorageSpecifierProvider *)self _finishLoadingActiveSpecifier];
  nativeManageStorage = self->_nativeManageStorage;
  if (nativeManageStorage) {
    [(ICQUINativeManageStorageController *)nativeManageStorage stopActiveSpecifier];
  }
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Manage storage load failed with error: %@", (uint8_t *)&v8, 0xCu);
  }

  [(ICQCloudStorageSpecifierProvider *)self _finishLoadingActiveSpecifier];
  nativeManageStorage = self->_nativeManageStorage;
  if (nativeManageStorage) {
    [(ICQUINativeManageStorageController *)nativeManageStorage stopActiveSpecifier];
  }
}

- (void)remoteUIDelegate:(id)a3 didCreatePage:(id)a4 inObjectModel:(id)a5
{
  v26[2] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  if (([(ICQCloudStorageSummary *)self->_storageSummary shouldUseNativeManageStorage] & 1) == 0)
  {
    id v9 = [v8 identifier];
    int v10 = [v9 isEqualToString:@"iCloudManageStorage"];

    if (v10)
    {
      int v11 = _ICQGetLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v24 = 0;
        _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "Manage storage rui page created. Injecting storage graph cell.", v24, 2u);
      }

      id v12 = objc_alloc(MEMORY[0x263F637E0]);
      id v13 = [v7 tableViewOM];
      id v14 = (void *)[v12 initWithAttributes:0 parent:v13];

      id v15 = [v8 clientInfo];
      uint64_t v16 = [v15 objectForKeyedSubscript:@"storageGraphFooterText"];

      if (v16)
      {
        id v17 = objc_alloc_init(MEMORY[0x263F63780]);
        [v17 setBody:v16];
        v25[0] = @"color";
        v25[1] = @"align";
        v26[0] = @"secondaryLabelColor";
        v26[1] = &stru_26DFF2C90;
        id v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
        [v17 setAttributes:v18];
        [v14 setFooter:v17];
      }
      v19 = [ICQCloudStorageGraphTableViewRow alloc];
      v20 = [(ICQCloudStorageSpecifierProvider *)self account];
      id v21 = [(ICQCloudStorageGraphTableViewRow *)v19 initWithAccount:v20];

      [(RUITableViewRow *)v21 setDelegate:self];
      [v14 addRow:v21];
      id v22 = [v7 tableViewOM];
      id v23 = [v22 sections];
      [v23 insertObject:v14 atIndex:0];
    }
    [(ICQCloudStorageSpecifierProvider *)self _replaceRUISectionWithTipUIFromObjectModel:v8 inPage:v7];
  }
}

- (void)_replaceRUISectionWithTipUIFromObjectModel:(id)a3 inPage:(id)a4
{
  id v6 = a4;
  id v7 = [a3 subElementWithID:*MEMORY[0x263F888B0]];
  if (!v7)
  {
    id v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Did not find section to replace with violation tip", buf, 2u);
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Violation tip section found. Injecting client generated tip.", v27, 2u);
    }

    id v9 = v7;
    if (!self->_tipSpecifierProvider)
    {
      int v10 = [ICQUITipSpecifierProvider alloc];
      accountManager = self->_accountManager;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      id v13 = [(ICQUITipSpecifierProvider *)v10 initWithAccountManager:accountManager presenter:WeakRetained sectionAnchorIdentifier:*MEMORY[0x263F88868] showUpwardPointingTips:0];
      tipSpecifierProvider = self->_tipSpecifierProvider;
      self->_tipSpecifierProvider = v13;
    }
    id v15 = objc_alloc(MEMORY[0x263F637E0]);
    uint64_t v16 = [v6 tableViewOM];
    id v17 = (void *)[v15 initWithAttributes:0 parent:v16];

    id v18 = self->_tipSpecifierProvider;
    v19 = [v9 attributes];
    v20 = [v9 rows];
    id v21 = [(ICQUITipSpecifierProvider *)v18 tipForManageStorageFromAttributes:v19 rows:v20 viewController:v6 remoteUIDelegate:self->_ruiDelegate];

    if (v21) {
      [v17 addRow:v21];
    }
    id v22 = [v6 tableViewOM];
    id v23 = [v22 sections];
    uint64_t v24 = [v23 indexOfObject:v9];

    if (v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = [v6 tableViewOM];
      uint64_t v26 = [v25 sections];
      [v26 replaceObjectAtIndex:v24 withObject:v17];
    }
LABEL_14:
  }
}

- (Class)tableCellClassForTableViewRow:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)_startObservingQuotaChangeNotifications
{
  if (!self->_quotaChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
    id v4 = [MEMORY[0x263F08A48] mainQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__ICQCloudStorageSpecifierProvider__startObservingQuotaChangeNotifications__block_invoke;
    v7[3] = &unk_264922110;
    objc_copyWeak(&v8, &location);
    id v5 = [v3 addObserverForName:@"QuotaDidChange" object:0 queue:v4 usingBlock:v7];
    quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_quotaChangeNotificationObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __75__ICQCloudStorageSpecifierProvider__startObservingQuotaChangeNotifications__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = @"QuotaDidChange";
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchStorageSummary:0];
}

- (void)_stopObservingQuotaChangeNotifications
{
  if (self->_quotaChangeNotificationObserver)
  {
    objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_quotaChangeNotificationObserver];

    quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_quotaChangeNotificationObserver = 0;
  }
}

- (BOOL)handleURL:(id)a3
{
  BOOL v4 = [(ICQCloudStorageSpecifierProvider *)self _handleManagedStorageURL:a3];
  if (v4) {
    [(ICQCloudStorageSpecifierProvider *)self _manageStorageSpecifierWasTapped:self->_manageStorageSpecifier];
  }
  return v4;
}

- (BOOL)_handleManagedStorageURL:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "resourceDictionary - %@", buf, 0xCu);
  }

  uint64_t v6 = [v4 objectForKeyedSubscript:@"path"];
  if (!objc_msgSend(v6, "icqui_isChangeStoragePlanPath"))
  {
    if (objc_msgSend(v6, "icqui_isDeviceOffersPath"))
    {
      int v11 = _ICQGetLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v38 = v12;
        id v13 = v12;
        _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "%@: Received a device offers url.", buf, 0xCu);
      }
      int v10 = (id *)MEMORY[0x263F5FEC8];
      goto LABEL_23;
    }
    if (objc_msgSend(v6, "icqui_isStorageUpgradePath"))
    {
      id v14 = _ICQGetLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v38 = v15;
        id v16 = v15;
        _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "%@: Received a Freshmint storage upgrade url.", buf, 0xCu);
      }
      [(ICQCloudStorageSpecifierProvider *)self _handleStorageUpgradeURL:v4];
      goto LABEL_24;
    }
    if (objc_msgSend(v6, "icqui_isPhotosPath"))
    {
      id v17 = _ICQGetLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v38 = v18;
        id v19 = v18;
        _os_log_impl(&dword_22C821000, v17, OS_LOG_TYPE_DEFAULT, "%@: Received a launch photos storage action.", buf, 0xCu);
      }
      int v10 = (id *)MEMORY[0x263F5FEE0];
      goto LABEL_23;
    }
    if (objc_msgSend(v6, "icqui_isCurrentDeviceBackupPath"))
    {
      v20 = _ICQGetLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v38 = v21;
        id v22 = v21;
        _os_log_impl(&dword_22C821000, v20, OS_LOG_TYPE_DEFAULT, "%@: Received current device backup action", buf, 0xCu);
      }
      int v10 = (id *)MEMORY[0x263F5FED8];
      goto LABEL_23;
    }
    v25 = [v6 lastPathComponent];
    int v26 = [v25 isEqualToString:@"MANAGE_STORAGE"];

    if (v26)
    {
      v27 = _ICQGetLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v38 = v28;
        id v29 = v28;
        v30 = "%@: Received manage storage url";
LABEL_35:
        _os_log_impl(&dword_22C821000, v27, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
      }
    }
    else
    {
      v31 = [v6 lastPathComponent];
      int v32 = [v31 isEqualToString:@"STORAGE_AND_BACKUP"];

      if (!v32)
      {
        if (![v6 containsString:@"LOCAL_BACKUP"])
        {
          BOOL v23 = 0;
          goto LABEL_25;
        }
        v27 = _ICQGetLogSystem();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        v34 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v38 = v34;
        id v29 = v34;
        v30 = "%@: Received local backup url";
        goto LABEL_35;
      }
      v27 = _ICQGetLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v38 = v33;
        id v29 = v33;
        v30 = "%@: Received storage and backup url";
        goto LABEL_35;
      }
    }
LABEL_36:

    goto LABEL_24;
  }
  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v38 = v8;
    id v9 = v8;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "%@: Received a change storage plan url.", buf, 0xCu);
  }
  int v10 = (id *)MEMORY[0x263F5FEC0];
LABEL_23:
  objc_storeStrong((id *)&self->_initialStorageFlowAction, *v10);
LABEL_24:
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __61__ICQCloudStorageSpecifierProvider__handleManagedStorageURL___block_invoke;
  v35[3] = &unk_264923AF0;
  v35[4] = self;
  id v36 = v4;
  [(ICQCloudStorageSpecifierProvider *)self _fetchStorageSummary:0 completion:v35];

  BOOL v23 = 1;
LABEL_25:

  return v23;
}

uint64_t __61__ICQCloudStorageSpecifierProvider__handleManagedStorageURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 shouldUseNativeManageStorage];
  if (result)
  {
    [*(id *)(a1 + 32) _createNativeManageStorageIfNeeded];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(*(void *)(a1 + 32) + 96);
    return [v5 handleURL:v4 withCompletion:0];
  }
  return result;
}

- (void)_handleStorageUpgradeURL:(id)a3
{
  id v4 = a3;
  objc_storeStrong((id *)&self->_initialStorageFlowAction, (id)*MEMORY[0x263F5FED0]);
  id v5 = [v4 objectForKeyedSubscript:@"clearCFUForOfferType"];
  if ([v5 isEqualToString:@"device"])
  {
    uint64_t v6 = 3;
LABEL_7:
    id v7 = (void *)MEMORY[0x263F88970];
    followUpController = self->_followUpController;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__ICQCloudStorageSpecifierProvider__handleStorageUpgradeURL___block_invoke;
    v10[3] = &unk_264922450;
    int v11 = v5;
    [v7 clearNotificationWithController:followUpController offerType:v6 completion:v10];
    id v9 = v11;
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"premium"])
  {
    uint64_t v6 = 2;
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"event"])
  {
    uint64_t v6 = 5;
    goto LABEL_7;
  }
  id v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[ICQCloudStorageSpecifierProvider _handleStorageUpgradeURL:](v4, v9);
  }
LABEL_8:
}

void __61__ICQCloudStorageSpecifierProvider__handleStorageUpgradeURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__ICQCloudStorageSpecifierProvider__handleStorageUpgradeURL___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (void)_createNativeManageStorageIfNeeded
{
  if (!self->_nativeManageStorage)
  {
    id v3 = [[ICQUINativeManageStorageController alloc] initWithAccountManager:self->_accountManager summary:self->_storageSummary ruiDelegate:self->_ruiDelegate];
    nativeManageStorage = self->_nativeManageStorage;
    self->_nativeManageStorage = v3;
  }
  [(ICQPreferencesRemoteUIDelegate *)self->_ruiDelegate setIsNativeManageStorage:1];
  ruiDelegate = self->_ruiDelegate;
  uint64_t v6 = self->_nativeManageStorage;
  [(ICQUINativeManageStorageController *)v6 setRuiDelegate:ruiDelegate];
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setSpecifiers:(id)a3
{
}

- (NSString)initialStorageFlowAction
{
  return self->_initialStorageFlowAction;
}

- (void)setInitialStorageFlowAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialStorageFlowAction, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nativeManageStorage, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_tipSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_storageGraphSpecifier, 0);
  objc_storeStrong((id *)&self->_manageStorageSpecifier, 0);
  objc_storeStrong((id *)&self->_storageSummary, 0);
  objc_storeStrong((id *)&self->_quotaChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_ruiDelegate, 0);
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_manageStorageSpecifierWasTapped:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "Manage storage enter delayed.", v1, 2u);
}

- (void)_enterManageStorage:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "Entering manage storage.", v1, 2u);
}

- (void)_handleStorageUpgradeURL:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = [a1 objectForKeyedSubscript:@"clearCFUForOfferType"];
  int v4 = 138412546;
  id v5 = @"clearCFUForOfferType";
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Invalid value for query param: %@, value: %@", (uint8_t *)&v4, 0x16u);
}

void __61__ICQCloudStorageSpecifierProvider__handleStorageUpgradeURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Error clearing out CFU for offer type %@, error: %@", (uint8_t *)&v4, 0x16u);
}

@end