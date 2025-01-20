@interface ICSHeaderSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (ICSHeaderSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (id)_valueForStorageGraphSpecifier:(id)a3;
- (id)account;
- (void)_fetchStorageSummary:(id)a3;
- (void)_fetchStorageSummary:(id)a3 completion:(id)a4;
- (void)_finishLoadingActiveSpecifier;
- (void)_reloadStorageSpecifiers;
- (void)_startObservingQuotaChangeNotifications;
- (void)_stopObservingQuotaChangeNotifications;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICSHeaderSpecifierProvider

- (ICSHeaderSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSHeaderSpecifierProvider;
  v9 = [(ICSHeaderSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
    [(ICSHeaderSpecifierProvider *)v10 _startObservingQuotaChangeNotifications];
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
  [(ICSHeaderSpecifierProvider *)self _stopObservingQuotaChangeNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ICSHeaderSpecifierProvider;
  [(ICSHeaderSpecifierProvider *)&v3 dealloc];
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
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 addObject:v6];

    if (!self->_storageGraphSpecifier)
    {
      id v7 = (void *)MEMORY[0x263F5FC40];
      id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v9 = [v8 localizedStringForKey:@"ICLOUD_TITLE" value:&stru_270DEF3F8 table:@"CloudGroup"];
      v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:sel__valueForStorageGraphSpecifier_ detail:0 cell:-1 edit:0];
      storageGraphSpecifier = self->_storageGraphSpecifier;
      self->_storageGraphSpecifier = v10;

      [(PSSpecifier *)self->_storageGraphSpecifier setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    }
    objc_super v12 = [NSNumber numberWithInt:self->_homeDataModel != 0];
    [(PSSpecifier *)self->_storageGraphSpecifier setObject:v12 forKeyedSubscript:*MEMORY[0x263F600A8]];

    [(PSSpecifier *)self->_storageGraphSpecifier setIdentifier:@"iCloudStorageBarGraph"];
    [v5 addObject:self->_storageGraphSpecifier];
    v13 = (NSArray *)[v5 copy];
    v14 = self->_specifiers;
    self->_specifiers = v13;

    objc_super v3 = self->_specifiers;
  }

  return v3;
}

- (id)_valueForStorageGraphSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F25C68]];
  char v6 = [v5 BOOLValue];

  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F25C70]];
  char v8 = [v7 BOOLValue];

  homeDataModel = self->_homeDataModel;
  if (homeDataModel || (v6 & 1) != 0 || (v8 & 1) != 0)
  {
    if (homeDataModel)
    {
      v10 = [(ICSHomeDataModel *)homeDataModel headerCard];
      v11 = [v10 storageSummary];
      objc_super v12 = [v11 subscriptionLabel];
      [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x263F602D0]];

      v13 = NSNumber;
      v14 = [(ICSHomeDataModel *)self->_homeDataModel headerCard];
      v15 = [v14 storageSummary];
      v16 = objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v15, "totalStorageInBytes"));
      [v4 setObject:v16 forKeyedSubscript:*MEMORY[0x263F25C50]];

      v17 = NSNumber;
      v18 = [(ICSHomeDataModel *)self->_homeDataModel headerCard];
      v19 = [v18 storageSummary];
      v20 = objc_msgSend(v17, "numberWithUnsignedLongLong:", objc_msgSend(v19, "usedStorageInBytes"));
      [v4 setObject:v20 forKeyedSubscript:*MEMORY[0x263F25C60]];
    }
  }
  else
  {
    [(ICSHeaderSpecifierProvider *)self _fetchStorageSummary:v4];
  }

  return 0;
}

- (void)_fetchStorageSummary:(id)a3
{
}

- (void)_fetchStorageSummary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F25C68];
  v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F25C68]];
  if ([v9 BOOLValue])
  {

LABEL_4:
    objc_super v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v12, OS_LOG_TYPE_DEFAULT, "Already fetching cloud storage summary. Bailing.", buf, 2u);
    }

    goto LABEL_10;
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
  objc_initWeak(&location, self);
  *(void *)buf = 0;
  v24 = buf;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v14 = [ICSHomeDataController alloc];
  v15 = [(ICSHeaderSpecifierProvider *)self account];
  v28 = [(ICSHomeDataController *)v14 initWithAccount:v15];

  v16 = (void *)*((void *)v24 + 5);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke;
  v17[3] = &unk_2655B5A28;
  objc_copyWeak(&v22, &location);
  v21 = buf;
  id v18 = v6;
  v19 = self;
  id v20 = v7;
  [v16 fetchiCloudHomeDataModelAllowingCache:1 completion:v17];

  objc_destroyWeak(&v22);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
LABEL_10:
}

void __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_53;
    block[3] = &unk_2655B5A00;
    block[4] = WeakRetained;
    id v17 = v5;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v18 = v9;
    uint64_t v19 = v10;
    id v20 = v6;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    id v21 = v11;
    uint64_t v22 = v12;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v13 = LogSubsystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_cold_1(v13);
    }

    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;
  }
}

void __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_53(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    [v2 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F25C68]];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [WeakRetained specifierProvider:*(void *)(a1 + 56) didFinishLoadingSpecifier:*(void *)(a1 + 48)];
  }
  if (*(void *)(a1 + 40))
  {
    id v4 = *(void **)(a1 + 48);
    uint64_t v5 = *MEMORY[0x263F25C70];
    uint64_t v6 = MEMORY[0x263EFFA80];
  }
  else
  {
    id v7 = LogSubsystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_53_cold_1(a1, v7);
    }

    id v4 = *(void **)(a1 + 48);
    uint64_t v5 = *MEMORY[0x263F25C70];
    uint64_t v6 = MEMORY[0x263EFFA88];
  }
  [v4 setObject:v6 forKeyedSubscript:v5];
  [*(id *)(a1 + 56) _reloadStorageSpecifiers];
  uint64_t v8 = *(void *)(a1 + 72);
  if (v8) {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, *(void *)(a1 + 40), *(void *)(a1 + 64));
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

- (void)_reloadStorageSpecifiers
{
  if (self->_storageGraphSpecifier)
  {
    id v4 = [(ICSHeaderSpecifierProvider *)self delegate];
    objc_super v3 = [(PSSpecifier *)self->_storageGraphSpecifier identifier];
    [v4 reloadSpecifierForProvider:self identifier:v3];
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

- (void)_startObservingQuotaChangeNotifications
{
  if (!self->_quotaChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
    id v4 = [MEMORY[0x263F08A48] mainQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__ICSHeaderSpecifierProvider__startObservingQuotaChangeNotifications__block_invoke;
    v7[3] = &unk_2655B5868;
    objc_copyWeak(&v8, &location);
    uint64_t v5 = [v3 addObserverForName:@"QuotaDidChange" object:0 queue:v4 usingBlock:v7];
    quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_quotaChangeNotificationObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __69__ICSHeaderSpecifierProvider__startObservingQuotaChangeNotifications__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = @"QuotaDidChange";
    _os_log_impl(&dword_262993000, v2, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v4, 0xCu);
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

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageGraphSpecifier, 0);
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_storeStrong((id *)&self->_homeDataModel, 0);
  objc_storeStrong((id *)&self->_quotaChangeNotificationObserver, 0);
  objc_destroyWeak((id *)&self->_listController);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_262993000, log, OS_LOG_TYPE_ERROR, "Missing strongSelf. Stopping fetchCloudStorageSummary flow.", v1, 2u);
}

void __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_53_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch iCloudHome data w/ error: %@", (uint8_t *)&v3, 0xCu);
}

@end