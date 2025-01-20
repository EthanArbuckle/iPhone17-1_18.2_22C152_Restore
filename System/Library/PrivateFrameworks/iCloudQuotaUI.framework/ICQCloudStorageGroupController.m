@interface ICQCloudStorageGroupController
+ (id)backupInfoHeaders;
+ (id)backupInfoHeadersForAccount:(id)a3;
- (BOOL)hasPurchasedMoreStorage;
- (Class)tableCellClassForTableViewRow:(id)a3;
- (ICQCloudStorageGroupController)init;
- (id)availableStorage:(id)a3;
- (id)sourceURLForRUITableViewRow;
- (id)specifiersWithBuyMore:(BOOL)a3;
- (id)textFieldRow:(id)a3 changeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (id)totalStorage:(id)a3;
- (void)addGroupToListController:(id)a3;
- (void)cancelLoaders;
- (void)clearQuotaCache;
- (void)dealloc;
- (void)enterBuyStorage;
- (void)enterBuyStorageWhenPossible;
- (void)enterManageStorageWhenPossible;
- (void)enterManagedStorage:(id)a3;
- (void)getQuotaInfo;
- (void)groupRemovedFromListController;
- (void)loadFailed:(id)a3 withError:(id)a4;
- (void)loadFinished:(id)a3;
- (void)manager:(id)a3 loadDidFailWithError:(id)a4;
- (void)manager:(id)a3 willPresentViewController:(id)a4;
- (void)quotaInfoChanged;
- (void)reachabilityChanged:(id)a3;
- (void)remoteUIDelegate:(id)a3 didCreatePage:(id)a4 forAccount:(id)a5 inObjectModel:(id)a6;
- (void)remoteUIDelegate:(id)a3 didCreatePage:(id)a4 inObjectModel:(id)a5;
- (void)startSpinnerInCellForSpecifier:(id)a3;
- (void)stopSpinner;
- (void)updateManagedStorageState;
@end

@implementation ICQCloudStorageGroupController

- (ICQCloudStorageGroupController)init
{
  v9.receiver = self;
  v9.super_class = (Class)ICQCloudStorageGroupController;
  v2 = [(ICQCloudStorageGroupController *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_quotaInfoChanged name:@"QuotaInformationChanged" object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_updateManagedStorageState name:@"PSProfileConnectionEffectiveSettingsChangedNotification" object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_quotaInfoChanged name:*MEMORY[0x263F833B8] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)backupStateChanged, (CFStringRef)*MEMORY[0x263F55A08], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v7 = [MEMORY[0x263F255C0] sharedNetworkObserver];
    [v7 addNetworkReachableObserver:v2 selector:sel_reachabilityChanged_];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F55A08], 0);
  v5 = [MEMORY[0x263F255C0] sharedNetworkObserver];
  [v5 removeNetworkReachableObserver:self];

  v6 = [(ICQPreferencesRemoteUIDelegate *)self->_storageDelegate delegate];

  if (v6 == self) {
    [(ICQPreferencesRemoteUIDelegate *)self->_storageDelegate setDelegate:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)ICQCloudStorageGroupController;
  [(ICQCloudStorageGroupController *)&v7 dealloc];
}

- (void)addGroupToListController:(id)a3
{
}

- (void)groupRemovedFromListController
{
  [(ICQUICloudStorageOffersManager *)self->_storageOffersManager cancelLoad];
  [(ICQPreferencesRemoteUIDelegate *)self->_storageDelegate cancelRemoteUI];
  storageDelegate = self->_storageDelegate;
  self->_storageDelegate = 0;

  [(ICQCloudStorageGroupController *)self stopSpinner];
  objc_storeWeak((id *)&self->_listController, 0);
}

- (id)totalStorage:(id)a3
{
  id v4 = a3;
  if (self->_quotaCached)
  {
    v5 = [(ICQQuotaInfoResponse *)self->_quotaInfo totalStorageText];
  }
  else if (self->_quotaFailed)
  {
    v5 = &stru_26DFF2C90;
  }
  else
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v6 localizedStringForKey:@"LOADING" value:&stru_26DFF2C90 table:@"CloudGroup"];
  }
  return v5;
}

- (id)availableStorage:(id)a3
{
  id v4 = a3;
  if (self->_quotaCached)
  {
    v5 = [(ICQQuotaInfoResponse *)self->_quotaInfo availableStorageText];
  }
  else if (self->_quotaFailed)
  {
    v5 = &stru_26DFF2C90;
  }
  else
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v6 localizedStringForKey:@"LOADING" value:&stru_26DFF2C90 table:@"CloudGroup"];
  }
  return v5;
}

- (void)reachabilityChanged:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKey:*MEMORY[0x263F25550]];
  int v6 = [v5 BOOLValue];

  if (v6 && self->_quotaFailed)
  {
    [(ICQCloudStorageGroupController *)self getQuotaInfo];
  }
}

- (void)updateManagedStorageState
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v3 = [(NSMutableArray *)self->_specifiers objectAtIndex:0];
  uint64_t v4 = *MEMORY[0x263F60120];
  [v3 removePropertyForKey:*MEMORY[0x263F60120]];
  BOOL buyMore = self->_buyMore;
  int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v7 = v6;
  if (buyMore) {
    v8 = @"STORAGE";
  }
  else {
    v8 = @"CASTLE";
  }
  objc_super v9 = [v6 localizedStringForKey:v8 value:&stru_26DFF2C90 table:@"CloudGroup"];
  [v3 setName:v9];

  if (!self->_quotaCached)
  {
    if (!self->_quotaFailed) {
      goto LABEL_17;
    }
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"QUOTA_FAILED" value:&stru_26DFF2C90 table:@"CloudGroup"];
    [v3 setProperty:v12 forKey:v4];
    goto LABEL_15;
  }
  v10 = [(ICQQuotaInfoResponse *)self->_quotaInfo accountStatus];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 objectForKey:@"account_status_header"];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 setName:v12];
      }
    }
    v13 = [v11 objectForKey:@"account_status_text"];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 setProperty:v13 forKey:v4];
      }
    }

LABEL_15:
  }

LABEL_17:
  v34 = v3;
  if (self->_quotaCached)
  {
    v14 = [MEMORY[0x263F53C50] sharedConnection];
    if ([v14 effectiveBoolValueForSetting:*MEMORY[0x263F53710]] == 2)
    {
      uint64_t v15 = 0;
    }
    else
    {
      v16 = [MEMORY[0x263F25750] sharedManager];
      v17 = [v16 primaryAccount];
      uint64_t v15 = [v17 needsToVerifyTerms] ^ 1;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  managedStorage = self->_managedStorage;
  v19 = [NSNumber numberWithBool:v15];
  uint64_t v20 = *MEMORY[0x263F600A8];
  [(PSSpecifier *)managedStorage setProperty:v19 forKey:*MEMORY[0x263F600A8]];

  uint64_t v21 = *MEMORY[0x263F602B0];
  v22 = [(PSSpecifier *)self->_managedStorage propertyForKey:*MEMORY[0x263F602B0]];
  int v33 = v15;
  [v22 setCellEnabled:v15];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v23 = -[NSMutableArray subarrayWithRange:](self->_specifiers, "subarrayWithRange:", 1, 2);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v29 = [NSNumber numberWithBool:!self->_quotaFailed];
        [v28 setProperty:v29 forKey:v20];

        v30 = [v28 propertyForKey:v21];
        [v30 setCellEnabled:!self->_quotaFailed];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v25);
  }

  if (v33 && self->_delayedEnterManageStorage)
  {
    [(ICQCloudStorageGroupController *)self enterManagedStorage:self->_managedStorage];
    self->_delayedEnterManageStorage = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    v32 = [(NSMutableArray *)self->_specifiers objectAtIndex:0];
    [WeakRetained reloadSpecifier:v32 animated:1];
  }
}

- (void)getQuotaInfo
{
  if (!self->_quotaCached && !self->_quotaFetchInProgress)
  {
    self->_quotaFetchInProgress = 1;
    v3 = +[ICQQuotaRequestManager sharedManager];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __46__ICQCloudStorageGroupController_getQuotaInfo__block_invoke;
    v4[3] = &unk_264922650;
    v4[4] = self;
    [v3 getQuotaInfoDetailed:0 handler:v4];
  }
}

void __46__ICQCloudStorageGroupController_getQuotaInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  unint64_t v7 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
  if (!v6
    || ([v6 error], v8 = objc_claimAutoreleasedReturnValue(), unint64_t v9 = v7 | v8, (id)v8, v9))
  {
    v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __46__ICQCloudStorageGroupController_getQuotaInfo__block_invoke_cold_1((void *)v7, v6, v11);
    }

    char v10 = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 34) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
    char v10 = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 35) = v10;
  int v12 = [*(id *)(*(void *)(a1 + 32) + 40) hasPurchasedMoreStorage];
  v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v14 = v13;
  if (v12) {
    [v13 setBool:1 forKey:@"hasPurchasedMoreStorage"];
  }
  else {
    [v13 removeObjectForKey:@"hasPurchasedMoreStorage"];
  }

  [*(id *)(a1 + 32) updateManagedStorageState];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v16 = [WeakRetained specifierForID:@"BUY_MORE_STORAGE"];

  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if ([*(id *)(a1 + 32) hasPurchasedMoreStorage]) {
    v18 = @"CHANGE_STORAGE_PLAN";
  }
  else {
    v18 = @"BUY_MORE_STORAGE";
  }
  v19 = [v17 localizedStringForKey:v18 value:&stru_26DFF2C90 table:@"CloudGroup"];

  uint64_t v20 = [v16 name];
  char v21 = [v20 isEqualToString:v19];

  if ((v21 & 1) == 0)
  {
    [v16 setName:v19];
    id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v22 reloadSpecifier:v16];
  }
}

- (void)quotaInfoChanged
{
  [(ICQCloudStorageGroupController *)self clearQuotaCache];
  [(ICQCloudStorageGroupController *)self getQuotaInfo];
}

- (void)clearQuotaCache
{
  self->_quotaFailed = 0;
  *(_WORD *)&self->_quotaFetchInProgress = 0;
  quotaInfo = self->_quotaInfo;
  self->_quotaInfo = 0;

  id v3 = +[ICQQuotaRequestManager sharedManager];
  [v3 clearCachedQuotaInfo];
}

- (BOOL)hasPurchasedMoreStorage
{
  quotaInfo = self->_quotaInfo;
  if (quotaInfo)
  {
    return [(ICQQuotaInfoResponse *)quotaInfo hasPurchasedMoreStorage];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v5 = [v4 BOOLForKey:@"hasPurchasedMoreStorage"];

    return v5;
  }
}

- (id)specifiersWithBuyMore:(BOOL)a3
{
  BOOL v3 = a3;
  [(ICQCloudStorageGroupController *)self clearQuotaCache];
  specifiers = self->_specifiers;
  if (!specifiers || self->_buyMore != v3 && (self->_specifiers = 0, specifiers, !self->_specifiers))
  {
    self->_BOOL buyMore = v3;
    id v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    unint64_t v7 = self->_specifiers;
    self->_specifiers = v6;

    uint64_t v8 = (void *)MEMORY[0x263F5FC40];
    BOOL buyMore = self->_buyMore;
    char v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = v10;
    if (buyMore) {
      int v12 = @"STORAGE";
    }
    else {
      int v12 = @"CASTLE";
    }
    v13 = [v10 localizedStringForKey:v12 value:&stru_26DFF2C90 table:@"CloudGroup"];
    v14 = [v8 preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [(NSMutableArray *)self->_specifiers addObject:v14];
    uint64_t v15 = (void *)MEMORY[0x263F5FC40];
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"TOTAL" value:&stru_26DFF2C90 table:@"CloudGroup"];
    v18 = [v15 preferenceSpecifierNamed:v17 target:self set:0 get:sel_totalStorage_ detail:0 cell:4 edit:0];

    uint64_t v19 = *MEMORY[0x263F60138];
    [v18 setProperty:@"TOTAL_STORAGE" forKey:*MEMORY[0x263F60138]];
    [(NSMutableArray *)self->_specifiers addObject:v18];
    uint64_t v20 = (void *)MEMORY[0x263F5FC40];
    char v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"AVAILABLE" value:&stru_26DFF2C90 table:@"CloudGroup"];
    v23 = [v20 preferenceSpecifierNamed:v22 target:self set:0 get:sel_availableStorage_ detail:0 cell:4 edit:0];

    [v23 setProperty:@"AVAILABLE_STORAGE" forKey:v19];
    [(NSMutableArray *)self->_specifiers addObject:v23];
    uint64_t v24 = (void *)MEMORY[0x263F5FC40];
    uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v26 = [v25 localizedStringForKey:@"MANAGE" value:&stru_26DFF2C90 table:@"CloudGroup"];
    v27 = [v24 preferenceSpecifierNamed:v26 target:self set:0 get:0 detail:0 cell:1 edit:0];
    managedStorage = self->_managedStorage;
    self->_managedStorage = v27;

    [(PSSpecifier *)self->_managedStorage setIdentifier:@"MANAGE_STORAGE"];
    [(PSSpecifier *)self->_managedStorage setControllerLoadAction:sel_enterManagedStorage_];
    [(NSMutableArray *)self->_specifiers addObject:self->_managedStorage];
    [(ICQCloudStorageGroupController *)self updateManagedStorageState];
    if (self->_buyMore)
    {
      v29 = self->_specifiers;
      v30 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [(NSMutableArray *)v29 addObject:v30];

      v31 = (void *)MEMORY[0x263F5FC40];
      v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if ([(ICQCloudStorageGroupController *)self hasPurchasedMoreStorage]) {
        int v33 = @"CHANGE_STORAGE_PLAN";
      }
      else {
        int v33 = @"BUY_MORE_STORAGE";
      }
      v34 = [v32 localizedStringForKey:v33 value:&stru_26DFF2C90 table:@"CloudGroup"];
      long long v35 = [v31 preferenceSpecifierNamed:v34 target:self set:0 get:0 detail:objc_opt_class() cell:13 edit:0];

      [v35 setProperty:@"BUY_MORE_STORAGE" forKey:v19];
      [v35 setButtonAction:sel_enterBuyStorage];
      [(NSMutableArray *)self->_specifiers addObject:v35];
    }
  }
  [(ICQCloudStorageGroupController *)self getQuotaInfo];
  long long v36 = self->_specifiers;
  return v36;
}

- (void)cancelLoaders
{
  if (self->_loadingCommerce || self->_loadingStorage)
  {
    self->_loadingCommerce = 0;
    [(ICQUICloudStorageOffersManager *)self->_storageOffersManager cancelLoad];
    self->_loadingStorage = 0;
    [(ICQPreferencesRemoteUIDelegate *)self->_storageDelegate cleanupLoader];
    storageDelegate = self->_storageDelegate;
    self->_storageDelegate = 0;

    [(ICQCloudStorageGroupController *)self stopSpinner];
  }
}

- (void)enterManageStorageWhenPossible
{
  self->_delayedEnterManageStorage = 1;
  [(ICQCloudStorageGroupController *)self updateManagedStorageState];
  [(ICQCloudStorageGroupController *)self getQuotaInfo];
}

- (void)enterManagedStorage:(id)a3
{
  id v4 = a3;
  if (self->_quotaCached && !self->_loadingStorage)
  {
    [(ICQCloudStorageGroupController *)self cancelLoaders];
    self->_loadingStorage = 1;
    storageDelegate = self->_storageDelegate;
    if (!storageDelegate)
    {
      id v6 = [ICQPreferencesRemoteUIDelegate alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      uint64_t v8 = [WeakRetained navigationController];
      unint64_t v9 = [(ICQPreferencesRemoteUIDelegate *)v6 initWithNavigationController:v8];
      char v10 = self->_storageDelegate;
      self->_storageDelegate = v9;

      storageDelegate = self->_storageDelegate;
    }
    [(ICQPreferencesRemoteUIDelegate *)storageDelegate setDelegate:self];
    v11 = [(ICQQuotaInfoResponse *)self->_quotaInfo manageStorageURLString];
    int v12 = [v11 stringByAddingPercentEscapesUsingEncoding:4];

    v13 = dispatch_get_global_queue(-2, 0);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __54__ICQCloudStorageGroupController_enterManagedStorage___block_invoke;
    v18 = &unk_264921B68;
    uint64_t v19 = self;
    id v20 = v12;
    id v14 = v12;
    dispatch_async(v13, &v15);

    -[ICQCloudStorageGroupController startSpinnerInCellForSpecifier:](self, "startSpinnerInCellForSpecifier:", v4, v15, v16, v17, v18, v19);
  }
}

void __54__ICQCloudStorageGroupController_enterManagedStorage___block_invoke(uint64_t a1)
{
  v2 = +[ICQCloudStorageInfo backupInfoHeaders];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ICQCloudStorageGroupController_enterManagedStorage___block_invoke_2;
  block[3] = &unk_264922568;
  BOOL v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = v2;
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__ICQCloudStorageGroupController_enterManagedStorage___block_invoke_2(void *a1)
{
  v2 = *(void **)(a1[4] + 48);
  id v3 = [NSURL URLWithString:a1[5]];
  [v2 loadURL:v3 postBody:0 additionalHeaders:a1[6]];
}

- (void)enterBuyStorageWhenPossible
{
  dispatch_time_t v3 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ICQCloudStorageGroupController_enterBuyStorageWhenPossible__block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __61__ICQCloudStorageGroupController_enterBuyStorageWhenPossible__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enterBuyStorage];
}

- (void)enterBuyStorage
{
  if (!self->_loadingCommerce)
  {
    [(ICQCloudStorageGroupController *)self cancelLoaders];
    self->_loadingCommerce = 1;
    if (!self->_storageOffersManager)
    {
      dispatch_time_t v3 = objc_alloc_init(ICQUICloudStorageOffersManager);
      storageOffersManager = self->_storageOffersManager;
      self->_storageOffersManager = v3;

      [(ICQUICloudStorageOffersManager *)self->_storageOffersManager setDelegate:self];
    }
    p_listController = &self->_listController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    id v7 = [WeakRetained specifierForID:@"BUY_MORE_STORAGE"];
    [(ICQCloudStorageGroupController *)self startSpinnerInCellForSpecifier:v7];

    uint64_t v8 = self->_storageOffersManager;
    id v10 = objc_loadWeakRetained((id *)p_listController);
    unint64_t v9 = [v10 navigationController];
    [(ICQUICloudStorageOffersManager *)v8 beginFlowWithNavigationController:v9 modally:1];
  }
}

- (void)startSpinnerInCellForSpecifier:(id)a3
{
  id v4 = a3;
  if (self->_remoteLoadingCell) {
    -[ICQCloudStorageGroupController startSpinnerInCellForSpecifier:]();
  }
  id v8 = v4;
  char v5 = [v4 propertyForKey:*MEMORY[0x263F602B0]];
  remoteLoadingCell = self->_remoteLoadingCell;
  self->_remoteLoadingCell = v5;

  if (self->_remoteLoadingCell)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v7 startAnimating];
    [(PSTableCell *)self->_remoteLoadingCell setAccessoryView:v7];
  }
}

- (void)stopSpinner
{
  remoteLoadingCell = self->_remoteLoadingCell;
  if (remoteLoadingCell)
  {
    [(PSTableCell *)remoteLoadingCell setAccessoryView:0];
    id v4 = self->_remoteLoadingCell;
    self->_remoteLoadingCell = 0;
  }
}

- (void)manager:(id)a3 willPresentViewController:(id)a4
{
  if (self->_loadingCommerce)
  {
    self->_loadingCommerce = 0;
    [(ICQCloudStorageGroupController *)self stopSpinner];
  }
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  if (self->_loadingCommerce)
  {
    self->_loadingCommerce = 0;
    [(ICQCloudStorageGroupController *)self stopSpinner];
  }
}

- (void)loadFinished:(id)a3
{
  if (self->_storageDelegate == a3)
  {
    self->_loadingStorage = 0;
    [(ICQCloudStorageGroupController *)self stopSpinner];
  }
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  if (self->_storageDelegate == a3)
  {
    self->_loadingStorage = 0;
    [(ICQCloudStorageGroupController *)self stopSpinner];
  }
}

- (void)remoteUIDelegate:(id)a3 didCreatePage:(id)a4 inObjectModel:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFB210];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = [v8 defaultStore];
  objc_msgSend(v12, "aa_primaryAppleAccount");
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  [(ICQCloudStorageGroupController *)self remoteUIDelegate:v11 didCreatePage:v10 forAccount:v13 inObjectModel:v9];
}

- (void)remoteUIDelegate:(id)a3 didCreatePage:(id)a4 forAccount:(id)a5 inObjectModel:(id)a6
{
  id v18 = a4;
  id v9 = a5;
  id v10 = [a6 identifier];
  int v11 = [v10 isEqualToString:@"iCloudManageStorage"];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263F637E0]);
    id v13 = [v18 tableViewOM];
    id v14 = (void *)[v12 initWithAttributes:0 parent:v13];

    uint64_t v15 = [[ICQCloudStorageGraphTableViewRow alloc] initWithAccount:v9];
    [(RUITableViewRow *)v15 setAttributes:&unk_26E01F280];
    [(RUITableViewRow *)v15 setDelegate:self];
    [v14 addRow:v15];
    uint64_t v16 = [v18 tableViewOM];
    v17 = [v16 sections];
    [v17 insertObject:v14 atIndex:0];
  }
}

- (Class)tableCellClassForTableViewRow:(id)a3
{
  return NSClassFromString(&cfstr_Aauiicloudstor.isa);
}

- (id)sourceURLForRUITableViewRow
{
  return 0;
}

- (id)textFieldRow:(id)a3 changeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return 0;
}

+ (id)backupInfoHeaders
{
  return +[ICQCloudStorageInfo backupInfoHeaders];
}

+ (id)backupInfoHeadersForAccount:(id)a3
{
  return +[ICQCloudStorageInfo backupInfoHeadersForAccount:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageOffersManager, 0);
  objc_storeStrong((id *)&self->_remoteLoadingCell, 0);
  objc_storeStrong((id *)&self->_storageDelegate, 0);
  objc_storeStrong((id *)&self->_quotaInfo, 0);
  objc_storeStrong((id *)&self->_managedStorage, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_listController);
}

void __46__ICQCloudStorageGroupController_getQuotaInfo__block_invoke_cold_1(void *a1, void *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v5 = a1;
  if (!a1)
  {
    char v5 = [a2 error];
  }
  int v6 = 138412290;
  id v7 = v5;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Error getting quota data: %@", (uint8_t *)&v6, 0xCu);
  if (!a1) {
}
  }

- (void)startSpinnerInCellForSpecifier:.cold.1()
{
}

@end