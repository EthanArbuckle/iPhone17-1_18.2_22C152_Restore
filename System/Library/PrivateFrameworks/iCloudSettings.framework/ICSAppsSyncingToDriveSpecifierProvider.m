@interface ICSAppsSyncingToDriveSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (ICSAppsSyncingToDriveSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (id)_specifiersForAppsSyncingToDrive;
- (id)account;
- (void)_fetchServerApps;
- (void)_reloadSpecifier;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICSAppsSyncingToDriveSpecifierProvider

- (ICSAppsSyncingToDriveSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ICSAppsSyncingToDriveSpecifierProvider;
  v9 = [(ICSAppsSyncingToDriveSpecifierProvider *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    id v11 = objc_alloc(MEMORY[0x263F888D0]);
    v12 = [(AIDAAccountManager *)v10->_accountManager accounts];
    v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
    uint64_t v14 = [v11 initWithAccount:v13];
    datacontroller = v10->_datacontroller;
    v10->_datacontroller = (ICQCloudStorageDataController *)v14;

    v16 = [[ICSUbiquitySpecifierProvider alloc] initWithAccountManager:v10->_accountManager];
    ubiquitySpecifierProvider = v10->_ubiquitySpecifierProvider;
    v10->_ubiquitySpecifierProvider = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    serverApps = v10->_serverApps;
    v10->_serverApps = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    appsSyncingToDriveBundleIDs = v10->_appsSyncingToDriveBundleIDs;
    v10->_appsSyncingToDriveBundleIDs = v20;

    objc_storeWeak((id *)&v10->_listController, v8);
    v10->_isAppsSyncToDriveRequestInProgress = 0;
  }

  return v10;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (NSArray)specifiers
{
  v3 = [(ICSAppsSyncingToDriveSpecifierProvider *)self _specifiersForAppsSyncingToDrive];
  specifiers = self->_specifiers;
  self->_specifiers = v3;

  v5 = self->_specifiers;

  return v5;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v6);
  [(ICSUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider setDelegate:v6];

  [(ICSAppsSyncingToDriveSpecifierProvider *)self _fetchServerApps];
}

- (id)_specifiersForAppsSyncingToDrive
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(NSMutableSet *)self->_appsSyncingToDriveBundleIDs count])
  {
    v4 = [(ICSUbiquitySpecifierProvider *)self->_ubiquitySpecifierProvider specifiers];
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __74__ICSAppsSyncingToDriveSpecifierProvider__specifiersForAppsSyncingToDrive__block_invoke;
    v10 = &unk_2655B5610;
    id v11 = self;
    id v12 = v3;
    [v4 enumerateObjectsUsingBlock:&v7];
  }
  id v5 = objc_msgSend(v3, "copy", v7, v8, v9, v10, v11);

  return v5;
}

void __74__ICSAppsSyncingToDriveSpecifierProvider__specifiersForAppsSyncingToDrive__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = v3;
  id v5 = [v3 identifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (void)_reloadSpecifier
{
  id v5 = (id)[(NSArray *)self->_specifiers copy];
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifiersForProvider:self oldSpecifiers:v5 animated:0];
}

- (void)_fetchServerApps
{
  [(NSMutableSet *)self->_serverApps removeAllObjects];
  self->_isAppsSyncToDriveRequestInProgress = 1;
  id v3 = objc_alloc(MEMORY[0x263F888D0]);
  v4 = [(ICSAppsSyncingToDriveSpecifierProvider *)self account];
  id v5 = (void *)[v3 initWithAccount:v4];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke;
  v6[3] = &unk_2655B56B0;
  v6[4] = self;
  [v5 fetchAppsSyncingToiCloudDriveWithCompletion:v6];
}

void __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v7 = LogSubsystem();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "Apps Syncing To Drive : %@", buf, 0xCu);
    }

    v9 = [v5 apps];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_44;
    v13[3] = &unk_2655B5638;
    v13[4] = *(void *)(a1 + 32);
    [v9 enumerateObjectsUsingBlock:v13];

    v10 = [*(id *)(*(void *)(a1 + 32) + 24) specifiers];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_46;
    v12[3] = &unk_2655B5660;
    v12[4] = *(void *)(a1 + 32);
    [v10 enumerateObjectsUsingBlock:v12];

    [*(id *)(*(void *)(a1 + 32) + 48) intersectSet:*(void *)(*(void *)(a1 + 32) + 40)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_2;
    block[3] = &unk_2655B5688;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 label];
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "App from server %@", (uint8_t *)&v10, 0xCu);
  }
  id v6 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v7 = [v3 containerID];
  [v6 addObject:v7];

  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 40);
  v9 = [v3 bundleIds];
  [v8 addObjectsFromArray:v9];
}

void __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_46(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

uint64_t __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadSpecifier];
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
  objc_storeStrong((id *)&self->_appsSyncingToDriveBundleIDs, 0);
  objc_storeStrong((id *)&self->_serverApps, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_datacontroller, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "Apps Syncing To Drive error : %@", (uint8_t *)&v2, 0xCu);
}

@end