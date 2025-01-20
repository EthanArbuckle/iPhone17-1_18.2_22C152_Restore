@interface ICQiCloudFooterSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (ICQiCloudFooterSpecifierProvider)initWithAccountManager:(id)a3;
- (ICQiCloudFooterSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (id)_buildSubscriptionSpecifiers;
- (id)_buildiCloudPlusSpecifiers;
- (id)_stringForSpecifier:(id)a3;
- (id)account;
- (void)_beginLoadingSpecifier:(id)a3;
- (void)_buildSubscriptionSpecifiers;
- (void)_fetchStorageSummary;
- (void)_finishLoadingSpecifier;
- (void)_handleICQLink:(id)a3 forSpecifier:(id)a4;
- (void)_launchFamilyUsageFlowWithURL:(id)a3;
- (void)_launchFlowForSpecifier:(id)a3;
- (void)_launchLegacyPurchaseFlow;
- (void)_launchUpgradeFlowWithICQLink:(id)a3;
- (void)_launchUpgradeFlowWithURL:(id)a3;
- (void)_postQuotaDidChangeNotification;
- (void)_reloadSpecifiers;
- (void)_setupSpecifier:(id)a3;
- (void)_startFamilySharing;
- (void)dealloc;
- (void)loadFailed:(id)a3 withError:(id)a4;
- (void)loadFinished:(id)a3;
- (void)loadStarted:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)specifiers;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
@end

@implementation ICQiCloudFooterSpecifierProvider

- (ICQiCloudFooterSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(ICQiCloudFooterSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (ICQiCloudFooterSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQiCloudFooterSpecifierProvider;
  v9 = [(ICQiCloudFooterSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
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
  [(ICQPreferencesRemoteUIDelegate *)self->_ruiDelegate cleanupLoader];
  [(ICQPreferencesRemoteUIDelegate *)self->_ruiDelegate setDelegate:0];
  activeSpecifier = self->_activeSpecifier;
  self->_activeSpecifier = 0;

  v4.receiver = self;
  v4.super_class = (Class)ICQiCloudFooterSpecifierProvider;
  [(ICQiCloudFooterSpecifierProvider *)&v4 dealloc];
}

- (NSArray)specifiers
{
  v3 = [(ICQiCloudFooterSpecifierProvider *)self account];
  char v4 = objc_msgSend(v3, "aa_isAccountClass:", *MEMORY[0x263F25618]);

  if (v4)
  {
    specifiers = self->_specifiers;
    if (!specifiers)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v7 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v6 addObject:v7];

      id v8 = [(ICQiCloudFooterSpecifierProvider *)self _buildSubscriptionSpecifiers];
      [v6 addObjectsFromArray:v8];

      v9 = (NSArray *)[v6 copy];
      v10 = self->_specifiers;
      self->_specifiers = v9;

      specifiers = self->_specifiers;
    }
    v11 = specifiers;
  }
  else
  {
    objc_super v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(ICQiCloudFooterSpecifierProvider *)v12 specifiers];
    }

    v11 = 0;
  }
  return v11;
}

- (id)_buildSubscriptionSpecifiers
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc(MEMORY[0x263F888D0]);
  v5 = [(ICQiCloudFooterSpecifierProvider *)self account];
  id v6 = (void *)[v4 initWithAccount:v5];

  id v7 = [v6 cachedStorageSummary];
  storageSummary = self->_storageSummary;
  self->_storageSummary = v7;

  v9 = [(ICQCloudStorageSummary *)self->_storageSummary subscriptionInfo];
  v10 = [v9 specifiersInfo];

  if (v10)
  {
    v11 = [(ICQiCloudFooterSpecifierProvider *)self account];
    int v12 = objc_msgSend(v11, "aa_isManagedAppleID");

    if (v12)
    {
      uint64_t v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "Subscription specifiers are not displayed for MAID accounts.", buf, 2u);
      }
    }
    else
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v21 = [(ICQCloudStorageSummary *)self->_storageSummary subscriptionInfo];
      uint64_t v13 = [v21 specifiersInfo];

      uint64_t v22 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        v42 = v6;
        uint64_t v24 = *(void *)v47;
        uint64_t v45 = *MEMORY[0x263F60138];
        uint64_t v44 = *MEMORY[0x263F602D0];
        uint64_t v43 = *MEMORY[0x263F602C8];
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v47 != v24) {
              objc_enumerationMutation(v13);
            }
            v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            v27 = [v26 identifier];
            int v28 = [v27 isEqualToString:@"ICLOUD_PLUS_INFO"];

            if (v28)
            {
              v29 = [(ICQiCloudFooterSpecifierProvider *)self _buildiCloudPlusSpecifiers];
              [v3 addObjectsFromArray:v29];
            }
            else
            {
              v30 = (void *)MEMORY[0x263F5FC40];
              v31 = [v26 title];
              v29 = [v30 preferenceSpecifierNamed:v31 target:self set:0 get:sel__stringForSpecifier_ detail:0 cell:2 edit:0];

              v32 = [v26 identifier];
              [v29 setObject:v32 forKeyedSubscript:v45];

              v33 = [v26 actionURL];
              [v29 setObject:v33 forKeyedSubscript:@"ICQUISpecifierKeyServerUIURL"];

              v34 = [v26 icqLink];
              [v29 setObject:v34 forKeyedSubscript:@"ICQUISpecifierKeyICQLink"];

              v35 = [v26 title];
              [v29 setObject:v35 forKeyedSubscript:v44];

              v36 = [v26 subTitle];
              [v29 setObject:v36 forKeyedSubscript:v43];

              v37 = [v26 type];
              [v29 setObject:v37 forKeyedSubscript:@"SPECIFIER_TYPE"];

              v38 = [v26 iconURL];
              v39 = +[_ICQUIHelperFunctions scaledImageURL:v38];
              [v29 setObject:v39 forKeyedSubscript:@"ICON_URL"];

              [v29 setControllerLoadAction:sel__launchFlowForSpecifier_];
              [(ICQiCloudFooterSpecifierProvider *)self _setupSpecifier:v29];
              [v3 addObject:v29];
            }
          }
          uint64_t v23 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v23);
        id v6 = v42;
      }
    }
  }
  else
  {
    uint64_t v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(ICQiCloudFooterSpecifierProvider *)v13 _buildSubscriptionSpecifiers];
    }
  }

  v40 = (void *)[v3 copy];
  return v40;
}

- (void)_setupSpecifier:(id)a3
{
  id v12 = a3;
  id v3 = [v12 objectForKeyedSubscript:@"SPECIFIER_TYPE"];
  if ([v3 isEqualToString:@"LINK_CELL"])
  {
    [v12 setCellType:13];
    [v12 setButtonAction:sel__launchFlowForSpecifier_];
  }
  else if ([v3 isEqualToString:@"SUBTITLE_CELL"])
  {
    [v12 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  }
  else
  {
    [v3 isEqualToString:@"DETAIL_LABEL_CELL"];
  }
  id v4 = [v12 objectForKeyedSubscript:*MEMORY[0x263F60138]];
  if ([v4 isEqualToString:@"STORAGE_UPGRADE"])
  {
    uint64_t v5 = objc_opt_class();
    id v6 = (void *)MEMORY[0x263F5FFE0];
LABEL_10:
    [v12 setObject:v5 forKeyedSubscript:*v6];
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"MANAGE_PLAN"])
  {
    [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    uint64_t v5 = *MEMORY[0x263F5FEB8];
    id v6 = (void *)MEMORY[0x263F60158];
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"ICLOUD_PLUS_INFO"])
  {
    id v7 = [v12 objectForKeyedSubscript:@"ICON_URL"];
    if (v7)
    {
      [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
      id v8 = (void *)MEMORY[0x263F601B0];
LABEL_17:
      [v12 setObject:v7 forKeyedSubscript:*v8];
    }
  }
  else
  {
    if (![v4 isEqualToString:@"FAMILY_USAGE"]) {
      goto LABEL_19;
    }
    v9 = (void *)MEMORY[0x263F827E8];
    v10 = (void *)MEMORY[0x263F086E0];
    getFACircleStateControllerClass();
    v11 = [v10 bundleForClass:objc_opt_class()];
    id v7 = [v9 imageNamed:@"family" inBundle:v11];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x263F60140];
      goto LABEL_17;
    }
  }

LABEL_19:
}

- (id)_buildiCloudPlusSpecifiers
{
  storageSummary = self->_storageSummary;
  if (storageSummary
    && ([(ICQCloudStorageSummary *)storageSummary subscriptionInfo],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isiCloudPlusSubscriber],
        v4,
        (v5 & 1) == 0))
  {
    icloudPlusSpecifierProvider = self->_icloudPlusSpecifierProvider;
    if (!icloudPlusSpecifierProvider)
    {
      id v8 = [[ICQUIiCloudPlusSpecifierProvider alloc] initWithAccountManager:self->_accountManager];
      v9 = self->_icloudPlusSpecifierProvider;
      self->_icloudPlusSpecifierProvider = (AAUISpecifierProvider *)v8;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [(AAUISpecifierProvider *)self->_icloudPlusSpecifierProvider setDelegate:WeakRetained];

      icloudPlusSpecifierProvider = self->_icloudPlusSpecifierProvider;
    }
    id v6 = [(AAUISpecifierProvider *)icloudPlusSpecifierProvider specifiers];
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }
  return v6;
}

- (id)_stringForSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"SPECIFIER_TYPE"];
  if ([v4 isEqualToString:@"DETAIL_LABEL_CELL"])
  {
    char v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F602C8]];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_launchFlowForSpecifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(ICQiCloudFooterSpecifierProvider *)self _beginLoadingSpecifier:v4];
  char v5 = [v4 objectForKeyedSubscript:@"ICQUISpecifierKeyICQLink"];
  if (!v5)
  {
    id v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "No icqLink found, falling back to old identifier/url based handling.", v16, 2u);
    }

    id v7 = [v4 objectForKeyedSubscript:@"ICQUISpecifierKeyServerUIURL"];
    id v8 = [v4 identifier];
    if ([v8 isEqualToString:@"STORAGE_UPGRADE"])
    {

      goto LABEL_8;
    }
    v9 = [v4 identifier];
    int v10 = [v9 isEqualToString:@"MANAGE_PLAN"];

    if (v10)
    {
LABEL_8:
      if (v7) {
        [(ICQiCloudFooterSpecifierProvider *)self _launchUpgradeFlowWithURL:v7];
      }
      else {
        [(ICQiCloudFooterSpecifierProvider *)self _launchLegacyPurchaseFlow];
      }
      goto LABEL_21;
    }
    v11 = [v4 identifier];
    int v12 = [v11 isEqualToString:@"FAMILY_SHARING"];

    if (v12)
    {
      [(ICQiCloudFooterSpecifierProvider *)self _startFamilySharing];
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v13 = [v4 identifier];
    int v14 = [v13 isEqualToString:@"FAMILY_USAGE"];

    if (v14)
    {
      if (v7)
      {
        [(ICQiCloudFooterSpecifierProvider *)self _launchFamilyUsageFlowWithURL:v7];
        goto LABEL_21;
      }
      uint64_t v15 = _ICQGetLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ICQiCloudFooterSpecifierProvider _launchFlowForSpecifier:]();
      }
    }
    else
    {
      uint64_t v15 = _ICQGetLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ICQiCloudFooterSpecifierProvider _launchFlowForSpecifier:](v4);
      }
    }

    [(ICQiCloudFooterSpecifierProvider *)self _finishLoadingSpecifier];
    goto LABEL_21;
  }
  [(ICQiCloudFooterSpecifierProvider *)self _handleICQLink:v5 forSpecifier:v4];
LABEL_22:
}

- (void)_handleICQLink:(id)a3 forSpecifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Handling ICQLink: %@ forSpecifier: %@", (uint8_t *)&v11, 0x16u);
  }

  switch([v6 action])
  {
    case 'n':
      v9 = [v6 actionURL];
      [(ICQiCloudFooterSpecifierProvider *)self _launchFamilyUsageFlowWithURL:v9];

      break;
    case 'o':
      [(ICQiCloudFooterSpecifierProvider *)self _startFamilySharing];
      break;
    case 'v':
    case 'x':
    case 'y':
      [(ICQiCloudFooterSpecifierProvider *)self _launchUpgradeFlowWithICQLink:v6];
      break;
    case 'w':
      [(ICQiCloudFooterSpecifierProvider *)self _launchLegacyPurchaseFlow];
      break;
    default:
      int v10 = _ICQGetLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ICQiCloudFooterSpecifierProvider _handleICQLink:forSpecifier:]();
      }

      [(ICQiCloudFooterSpecifierProvider *)self _finishLoadingSpecifier];
      break;
  }
}

- (void)_launchUpgradeFlowWithURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_upgradeFlowManager)
  {
    char v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICQiCloudFooterSpecifierProvider _launchUpgradeFlowWithURL:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    char v5 = objc_alloc_init(MEMORY[0x263F88920]);
    [v5 _updateRequestedServerUIURLWithURL:v4];
    __int16 v13 = [[ICQUpgradeFlowManager alloc] initWithOffer:v5];
    upgradeFlowManager = self->_upgradeFlowManager;
    self->_upgradeFlowManager = v13;

    [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setDelegate:self];
    uint64_t v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Launching freshmint upgrade flow with url: %@", (uint8_t *)&v16, 0xCu);
    }

    [(ICQUpgradeFlowManager *)self->_upgradeFlowManager _beginRemoteFlowWithURL:v4];
  }
}

- (void)_launchUpgradeFlowWithICQLink:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_upgradeFlowManager)
  {
    char v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICQiCloudFooterSpecifierProvider _launchUpgradeFlowWithURL:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    char v5 = objc_alloc_init(MEMORY[0x263F88920]);
    __int16 v13 = [[ICQUpgradeFlowManager alloc] initWithOffer:v5];
    upgradeFlowManager = self->_upgradeFlowManager;
    self->_upgradeFlowManager = v13;

    [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setDelegate:self];
    uint64_t v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Launching freshmint upgrade flow with icqLink: %@", (uint8_t *)&v18, 0xCu);
    }

    int v16 = self->_upgradeFlowManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    [(ICQUpgradeFlowManager *)v16 beginRemoteUpgradeFlowWithICQLink:v4 presenter:WeakRetained];
  }
}

- (void)_startFamilySharing
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Launching start family sharing flow.", buf, 2u);
  }

  id location = 0;
  p_id location = &location;
  uint64_t v25 = 0x2050000000;
  id v4 = (id)getFACircleContextClass_softClass_1;
  uint64_t v26 = getFACircleContextClass_softClass_1;
  if (!getFACircleContextClass_softClass_1)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = (uint64_t)__getFACircleContextClass_block_invoke_1;
    uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t))&unk_264921E58;
    v21 = &location;
    __getFACircleContextClass_block_invoke_1((uint64_t)buf);
    id v4 = p_location[3];
  }
  char v5 = (objc_class *)v4;
  _Block_object_dispose(&location, 8);
  id v6 = [v5 alloc];
  id location = 0;
  p_id location = &location;
  uint64_t v25 = 0x2020000000;
  uint64_t v7 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr_1;
  uint64_t v26 = getFACircleEventTypeInitiateSymbolLoc_ptr_1;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr_1)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = (uint64_t)__getFACircleEventTypeInitiateSymbolLoc_block_invoke_1;
    uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t))&unk_264921E58;
    v21 = &location;
    uint64_t v8 = (void *)FamilyCircleUILibrary_1();
    uint64_t v9 = dlsym(v8, "FACircleEventTypeInitiate");
    *((void *)v21[1] + 3) = v9;
    getFACircleEventTypeInitiateSymbolLoc_ptr_1 = *((void *)v21[1] + 3);
    uint64_t v7 = p_location[3];
  }
  _Block_object_dispose(&location, 8);
  if (!v7) {
    -[ICQFamilySharingHook _beginFamilySharingFlowWithCompletion:]();
  }
  uint64_t v10 = (void *)[v6 initWithEventType:*v7];
  [v10 setClientName:@"iCloudStorage"];
  objc_initWeak(&location, self);
  *(void *)buf = 0;
  uint64_t v18 = (uint64_t)buf;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__8;
  v21 = (id *)__Block_byref_object_dispose__8;
  id v11 = objc_alloc((Class)getFACircleStateControllerClass());
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  __int16 v13 = [WeakRetained navigationController];
  id v22 = (id)[v11 initWithPresenter:v13];

  id v14 = *(void **)(v18 + 40);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__ICQiCloudFooterSpecifierProvider__startFamilySharing__block_invoke;
  v15[3] = &unk_264923580;
  objc_copyWeak(&v16, &location);
  v15[4] = buf;
  [v14 performWithContext:v10 completion:v15];
  objc_destroyWeak(&v16);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

void __55__ICQiCloudFooterSpecifierProvider__startFamilySharing__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _finishLoadingSpecifier];
    id v6 = [v3 error];

    if (v6)
    {
      uint64_t v7 = _ICQGetLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __55__ICQiCloudFooterSpecifierProvider__startFamilySharing__block_invoke_cold_1(v3, v7);
      }
    }
    else
    {
      [v5 _fetchStorageSummary];
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

- (void)_launchFamilyUsageFlowWithURL:(id)a3
{
  id v4 = a3;
  ruiDelegate = self->_ruiDelegate;
  id v12 = v4;
  if (!ruiDelegate)
  {
    id v6 = [ICQPreferencesRemoteUIDelegate alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    uint64_t v8 = [WeakRetained navigationController];
    uint64_t v9 = [(ICQiCloudFooterSpecifierProvider *)self account];
    uint64_t v10 = [(ICQPreferencesRemoteUIDelegate *)v6 initWithNavigationController:v8 initialAction:0 account:v9];
    id v11 = self->_ruiDelegate;
    self->_ruiDelegate = v10;

    [(ICQPreferencesRemoteUIDelegate *)self->_ruiDelegate setDelegate:self];
    id v4 = v12;
    ruiDelegate = self->_ruiDelegate;
  }
  [(ICQPreferencesRemoteUIDelegate *)ruiDelegate loadURL:v4 postBody:0 additionalHeaders:0];
}

- (void)_launchLegacyPurchaseFlow
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Launching legacy purchase flow.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  [(ICQiCloudFooterSpecifierProvider *)self _finishLoadingSpecifier];
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
  }

  char v5 = objc_alloc_init(ICQUILegacyPurchaseFlowController);
  legacyPurchaseFlowController = self->_legacyPurchaseFlowController;
  self->_legacyPurchaseFlowController = v5;

  uint64_t v7 = self->_legacyPurchaseFlowController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  uint64_t v9 = *MEMORY[0x263F5FEC0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__ICQiCloudFooterSpecifierProvider__launchLegacyPurchaseFlow__block_invoke;
  v10[3] = &unk_2649235A8;
  objc_copyWeak(&v11, buf);
  [(ICQUILegacyPurchaseFlowController *)v7 beginFlowWithPresenter:WeakRetained action:v9 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

void __61__ICQiCloudFooterSpecifierProvider__launchLegacyPurchaseFlow__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _ICQGetLogSystem();
  id WeakRetained = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_22C821000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Legacy purchase flow completed successfully! Reloading specifiers.", v8, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _postQuotaDidChangeNotification];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __61__ICQiCloudFooterSpecifierProvider__launchLegacyPurchaseFlow__block_invoke_cold_1();
  }
}

- (void)_fetchStorageSummary
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__8;
  id v11 = __Block_byref_object_dispose__8;
  id v3 = objc_alloc(MEMORY[0x263F888D0]);
  id v4 = [(ICQiCloudFooterSpecifierProvider *)self account];
  id v12 = (id)[v3 initWithAccount:v4];

  [(id)v8[5] setShouldIgnoreCache:1];
  id v5 = (void *)v8[5];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke;
  v6[3] = &unk_264921F28;
  v6[4] = self;
  v6[5] = &v7;
  [v5 fetchStorageSummaryWithCompletion:v6];
  _Block_object_dispose(&v7, 8);
}

void __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = v5;
  id v9 = v5;

  if (v6)
  {
    uint64_t v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke_cold_1();
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke_90;
  block[3] = &unk_264921C80;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

uint64_t __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke_90(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadSpecifiers];
}

- (void)_reloadSpecifiers
{
  specifiers = self->_specifiers;
  self->_specifiers = 0;
  id v4 = specifiers;

  [(AAUISpecifierProvider *)self->_icloudPlusSpecifierProvider setSpecifiers:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifiersForProvider:self oldSpecifiers:v4 animated:0];
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow cancelled.", v6, 2u);
  }

  [(ICQiCloudFooterSpecifierProvider *)self _finishLoadingSpecifier];
  [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setDelegate:0];
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow completed successfully.", v6, 2u);
  }

  [(ICQiCloudFooterSpecifierProvider *)self _finishLoadingSpecifier];
  [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setDelegate:0];
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;

  [(ICQiCloudFooterSpecifierProvider *)self _postQuotaDidChangeNotification];
}

- (void)_postQuotaDidChangeNotification
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[ICQiCloudFooterSpecifierProvider _postQuotaDidChangeNotification]";
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "%s refreshing quota storage info", (uint8_t *)&v4, 0xCu);
  }

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"QuotaDidChange" object:0];
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ICQiCloudFooterSpecifierProvider loadFailed:withError:]();
  }

  [(ICQiCloudFooterSpecifierProvider *)self _finishLoadingSpecifier];
}

- (void)loadFinished:(id)a3
{
  int v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "DelayedPushDelegate Loading finished", v5, 2u);
  }

  [(ICQiCloudFooterSpecifierProvider *)self _finishLoadingSpecifier];
}

- (void)loadStarted:(id)a3
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "DelayedPushDelegate Loading started.", v4, 2u);
  }
}

- (void)_finishLoadingSpecifier
{
  if (self->_activeSpecifier)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__ICQiCloudFooterSpecifierProvider__finishLoadingSpecifier__block_invoke;
    block[3] = &unk_264921C80;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __59__ICQiCloudFooterSpecifierProvider__finishLoadingSpecifier__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained specifierProvider:*(void *)(a1 + 32) didFinishLoadingSpecifier:*(void *)(*(void *)(a1 + 32) + 72)];

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = 0;
}

- (void)_beginLoadingSpecifier:(id)a3
{
  int v4 = (PSSpecifier *)a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  activeSpecifier = self->_activeSpecifier;
  self->_activeSpecifier = v4;
  uint64_t v6 = v4;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained specifierProvider:self willBeginLoadingSpecifier:v6];
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
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_storeStrong((id *)&self->_icloudPlusSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_legacyPurchaseFlowManager, 0);
  objc_storeStrong((id *)&self->_legacyPurchaseFlowController, 0);
  objc_storeStrong((id *)&self->_ruiDelegate, 0);
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
  objc_storeStrong((id *)&self->_storageSummary, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)specifiers
{
}

- (void)_buildSubscriptionSpecifiers
{
}

- (void)_launchFlowForSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "No url found. Failed to launch family usage view for specifier: %@", v2, v3, v4, v5, v6);
}

- (void)_launchFlowForSpecifier:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_22C821000, v2, v3, "Unknown identifier: %@, can not load URL: %@", v4, v5, v6, v7, v8);
}

- (void)_handleICQLink:forSpecifier:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_3_0();
  id v1 = v0;
  OUTLINED_FUNCTION_4_0(&dword_22C821000, v2, v3, "%@ can not handle link: %@", v4, v5, v6, v7, v8);
}

- (void)_launchUpgradeFlowWithURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__ICQiCloudFooterSpecifierProvider__startFamilySharing__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Family sharing launch error %@", v4, 0xCu);
}

void __61__ICQiCloudFooterSpecifierProvider__launchLegacyPurchaseFlow__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Legacy purchase flow completed with error: %@", v2, v3, v4, v5, v6);
}

void __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Failed to fetch storage summary with error: %@", v2, v3, v4, v5, v6);
}

- (void)loadFailed:withError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "DelayedPushDelegate Loading failed with error: %@", v2, v3, v4, v5, v6);
}

@end