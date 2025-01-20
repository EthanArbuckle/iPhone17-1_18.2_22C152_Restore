@interface ICQUIManageStorageListSpecifierProvider
- (AIDAAccountManager)accountManager;
- (BOOL)failedToFetchAppList;
- (BOOL)isFetching;
- (ICQCloudStorageApps)storageApps;
- (ICQUIManageStorageListSpecifierProvider)initWithAccountManager:(id)a3;
- (ICQUIManageStorageListSpecifierProvider)initWithAccountManager:(id)a3 navigationItem:(id)a4;
- (ICQUIManageStorageSpecifierProviderDelegate)delegate;
- (NSArray)specifiers;
- (UINavigationItem)navigationItem;
- (id)account;
- (id)nativeSpecifierForAppInfo:(id)a3;
- (id)serverUISpecifierForAppInfo:(id)a3;
- (void)_refreshAppList;
- (void)_reloadSpecifiers;
- (void)addDecorationToSpecifier:(id)a3 usingAppInfo:(id)a4;
- (void)dealloc;
- (void)loadDrilldownFromSpecifier:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFailedToFetchAppList:(BOOL)a3;
- (void)setIsFetching:(BOOL)a3;
- (void)setNavigationItem:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setStorageApps:(id)a3;
@end

@implementation ICQUIManageStorageListSpecifierProvider

- (ICQUIManageStorageListSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(ICQUIManageStorageListSpecifierProvider *)self initWithAccountManager:a3 navigationItem:0];
}

- (ICQUIManageStorageListSpecifierProvider)initWithAccountManager:(id)a3 navigationItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICQUIManageStorageListSpecifierProvider;
  v9 = [(ICQUIManageStorageListSpecifierProvider *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_navigationItem, v8);
    [(ICQUIManageStorageListSpecifierProvider *)v10 _refreshAppList];
    objc_initWeak(&location, v10);
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    v12 = [MEMORY[0x263F08A48] mainQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __81__ICQUIManageStorageListSpecifierProvider_initWithAccountManager_navigationItem___block_invoke;
    v15[3] = &unk_264922110;
    objc_copyWeak(&v16, &location);
    id v13 = (id)[v11 addObserverForName:@"QuotaDidChange" object:0 queue:v12 usingBlock:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __81__ICQUIManageStorageListSpecifierProvider_initWithAccountManager_navigationItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshAppList];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  v2 = "-[ICQUIManageStorageListSpecifierProvider dealloc]";
  __int16 v3 = 2112;
  v4 = @"QuotaDidChange";
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "%s: Unregistering from notification: %@", (uint8_t *)&v1, 0x16u);
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  __int16 v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (void)_refreshAppList
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Already fetching app list", v1, 2u);
}

void __58__ICQUIManageStorageListSpecifierProvider__refreshAppList__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__ICQUIManageStorageListSpecifierProvider__refreshAppList__block_invoke_cold_1(v6, v7);
    }
  }
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v5 apps];
    uint64_t v10 = [v9 count];
    v11 = [v5 apps];
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    objc_super v18 = v11;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Received apps count %lu, apps: %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__ICQUIManageStorageListSpecifierProvider__refreshAppList__block_invoke_33;
  v13[3] = &unk_264921B68;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v5;
  id v12 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

uint64_t __58__ICQUIManageStorageListSpecifierProvider__refreshAppList__block_invoke_33(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationItem];
  objc_msgSend(v2, "icqui_hideNavigationBarSpinner");

  [*(id *)(a1 + 32) setIsFetching:0];
  __int16 v3 = [*(id *)(a1 + 40) apps];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [*(id *)(a1 + 32) setFailedToFetchAppList:1];
  }
  [*(id *)(a1 + 32) setStorageApps:*(void *)(a1 + 40)];
  id v5 = *(void **)(a1 + 32);
  return [v5 _reloadSpecifiers];
}

- (void)_reloadSpecifiers
{
  id v5 = (id)[(NSArray *)self->_specifiers copy];
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  uint64_t v4 = [(ICQUIManageStorageListSpecifierProvider *)self delegate];
  [v4 reloadSpecifiersForProvider:self oldSpecifiers:v5 animated:1];
}

- (NSArray)specifiers
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  specifiers = self->_specifiers;
  if (specifiers)
  {
    __int16 v3 = specifiers;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"MANAGE_STORAGE_APP_LIST"];
    [v5 addObject:v6];
    id v7 = [(ICQUIManageStorageListSpecifierProvider *)self storageApps];
    id v8 = [v7 apps];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v25 = v6;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v10 = [(ICQUIManageStorageListSpecifierProvider *)self storageApps];
      v11 = [v10 apps];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            __int16 v17 = [v16 action];
            objc_super v18 = [v17 icqLink];
            uint64_t v19 = [v18 action];

            if (v19 == 126) {
              [(ICQUIManageStorageListSpecifierProvider *)self nativeSpecifierForAppInfo:v16];
            }
            else {
            v20 = [(ICQUIManageStorageListSpecifierProvider *)self serverUISpecifierForAppInfo:v16];
            }
            if (v20) {
              [v5 addObject:v20];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v13);
      }

      id v6 = v25;
    }
    else if ([(ICQUIManageStorageListSpecifierProvider *)self failedToFetchAppList])
    {

      id v5 = 0;
    }
    else
    {
      v21 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
      [v5 addObject:v21];
      [(ICQUIManageStorageListSpecifierProvider *)self _refreshAppList];
    }
    v22 = (NSArray *)[v5 copy];
    v23 = self->_specifiers;
    self->_specifiers = v22;

    __int16 v3 = self->_specifiers;
  }
  return v3;
}

- (void)setSpecifiers:(id)a3
{
  id v7 = a3;
  id v5 = (void *)[(NSArray *)self->_specifiers copy];
  if (v7) {
    objc_storeStrong((id *)&self->_specifiers, a3);
  }
  else {
    [(ICQUIManageStorageListSpecifierProvider *)self _refreshAppList];
  }
  id v6 = [(ICQUIManageStorageListSpecifierProvider *)self delegate];
  [v6 reloadSpecifiersForProvider:self oldSpecifiers:v5 animated:1];
}

- (id)serverUISpecifierForAppInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 action];
  id v6 = [v5 actionURL];
  if (v6) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = -1;
  }

  id v8 = (void *)MEMORY[0x263F5FC40];
  uint64_t v9 = [v4 label];
  uint64_t v10 = [v8 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:v7 edit:0];

  [(ICQUIManageStorageListSpecifierProvider *)self addDecorationToSpecifier:v10 usingAppInfo:v4];
  [v10 setControllerLoadAction:sel_loadDrilldownFromSpecifier_];
  return v10;
}

- (id)nativeSpecifierForAppInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 action];
  id v6 = [v5 icqLink];
  uint64_t v7 = [v6 parameters];
  id v8 = [v7 objectForKeyedSubscript:@"identifier"];

  if ([v8 isEqualToString:@"afuiSettings"])
  {
    uint64_t v9 = +[ICQPreferencesRemoteUIDelegate afuiSettingsSpecifier];
LABEL_7:
    uint64_t v10 = (void *)v9;
    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"healthSettings"])
  {
    uint64_t v9 = +[ICQPreferencesRemoteUIDelegate healthSettingsSpecifier];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"messagesSettings"])
  {
    uint64_t v9 = +[ICQPreferencesRemoteUIDelegate messagesSettingsSpecifier];
    goto LABEL_7;
  }
  uint64_t v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[ICQUIManageStorageListSpecifierProvider nativeSpecifierForAppInfo:]((uint64_t)v8, v12);
  }

  uint64_t v10 = 0;
LABEL_8:
  [(ICQUIManageStorageListSpecifierProvider *)self addDecorationToSpecifier:v10 usingAppInfo:v4];

  return v10;
}

- (void)addDecorationToSpecifier:(id)a3 usingAppInfo:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  if (v17)
  {
    [v17 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    id v6 = NSString;
    uint64_t v7 = [v5 bundleIds];
    id v8 = [v7 firstObject];
    uint64_t v9 = v8;
    if (!v8)
    {
      uint64_t v9 = [v5 label];
    }
    uint64_t v10 = [v6 stringWithFormat:@"APP_LIST_CELL_%@", v9];
    [v17 setIdentifier:v10];

    if (!v8) {
    [v17 setObject:v5 forKeyedSubscript:@"DRILLDOWN_APP_INFO"];
    }
    v11 = [v5 label];
    [v17 setObject:v11 forKeyedSubscript:*MEMORY[0x263F602D0]];

    uint64_t v12 = [v5 detailLabel];
    [v17 setObject:v12 forKeyedSubscript:*MEMORY[0x263F602C8]];

    uint64_t v13 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
    [v17 setObject:v13 forKeyedSubscript:*MEMORY[0x263F602A8]];

    uint64_t v14 = MEMORY[0x263EFFA88];
    [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    v15 = [v5 iconURL];
    uint64_t v16 = +[_ICQUIHelperFunctions scaledImageURL:v15];
    [v17 setObject:v16 forKeyedSubscript:*MEMORY[0x263F601B0]];

    [v17 setObject:v14 forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  }
}

- (void)loadDrilldownFromSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQUIManageStorageListSpecifierProvider *)self delegate];
  [v5 provider:self loadActionFromSpecifier:v4];
}

- (ICQUIManageStorageSpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQUIManageStorageSpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (ICQCloudStorageApps)storageApps
{
  return self->_storageApps;
}

- (void)setStorageApps:(id)a3
{
}

- (BOOL)isFetching
{
  return self->_isFetching;
}

- (void)setIsFetching:(BOOL)a3
{
  self->_isFetching = a3;
}

- (BOOL)failedToFetchAppList
{
  return self->_failedToFetchAppList;
}

- (void)setFailedToFetchAppList:(BOOL)a3
{
  self->_failedToFetchAppList = a3;
}

- (UINavigationItem)navigationItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationItem);
  return (UINavigationItem *)WeakRetained;
}

- (void)setNavigationItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationItem);
  objc_storeStrong((id *)&self->_storageApps, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__ICQUIManageStorageListSpecifierProvider__refreshAppList__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  __int16 v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Error retrieving list of apps: %@", (uint8_t *)&v4, 0xCu);
}

- (void)nativeSpecifierForAppInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Unknown native drilldown identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end