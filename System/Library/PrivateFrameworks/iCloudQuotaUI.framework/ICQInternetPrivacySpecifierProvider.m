@interface ICQInternetPrivacySpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (AIDAAccountManager)accountManager;
- (BOOL)_handleQuotaJourneyURL:(id)a3;
- (BOOL)_shouldShowInternetPrivacySpecifier;
- (BOOL)handleURL:(id)a3;
- (BOOL)hasProfileRestriction;
- (ICQInternetPrivacySpecifierProvider)initWithAccountManager:(id)a3;
- (ICQInternetPrivacyViewController)internetPrivacyController;
- (ICQInternetPrivacyViewModel)viewModel;
- (ICQUpgradeFlowManager)flowManager;
- (NSArray)specifiers;
- (NSObject)observationToken;
- (NSString)statusString;
- (PSSpecifier)internetPrivacySpecifier;
- (id)_valueForInternetPrivacySpecifier:(id)a3;
- (id)account;
- (id)makeDefaultInternetPrivacySpecifier;
- (unint64_t)internetPrivacyAvailability;
- (void)_configureInternetPrivacySpecifier:(id)a3;
- (void)_controllerLoadAction;
- (void)_fetchStatus;
- (void)_fetchStatusWithCompletion:(id)a3;
- (void)_internetPrivacySpecifierLoadJourney:(id)a3;
- (void)_internetPrivacySpecifierWasTapped:(id)a3;
- (void)_presentLearnMoreSubscriberPage;
- (void)_registerForNSPDarwinNotification;
- (void)_reloadSpecifiers;
- (void)_setupWithAltDSID:(id)a3;
- (void)_unregisterForNSPDarwinNotification;
- (void)dealloc;
- (void)reloadQuotaInfo;
- (void)reloadSpecifer:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlowManager:(id)a3;
- (void)setHasProfileRestriction:(BOOL)a3;
- (void)setInternetPrivacyAvailability:(unint64_t)a3;
- (void)setInternetPrivacyController:(id)a3;
- (void)setInternetPrivacySpecifier:(id)a3;
- (void)setObservationToken:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setStatusString:(id)a3;
- (void)setViewModel:(id)a3;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
@end

@implementation ICQInternetPrivacySpecifierProvider

- (ICQInternetPrivacySpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICQInternetPrivacySpecifierProvider;
  v6 = [(ICQInternetPrivacySpecifierProvider *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    v8 = [(AIDAAccountManager *)v7->_accountManager accounts];
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

    if (objc_msgSend(v9, "aa_isAccountClass:", *MEMORY[0x263F25618]))
    {
      v10 = objc_msgSend(v9, "aa_altDSID");
      [(ICQInternetPrivacySpecifierProvider *)v7 _setupWithAltDSID:v10];
    }
    else
    {
      v10 = _ICQGetLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ICQInternetPrivacySpecifierProvider initWithAccountManager:](v10);
      }
    }
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  if (self->_observationToken)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self->_observationToken];
  }
  [(ICQInternetPrivacySpecifierProvider *)self _unregisterForNSPDarwinNotification];
  v5.receiver = self;
  v5.super_class = (Class)ICQInternetPrivacySpecifierProvider;
  [(ICQInternetPrivacySpecifierProvider *)&v5 dealloc];
}

- (id)account
{
  v2 = [(ICQInternetPrivacySpecifierProvider *)self accountManager];
  v3 = [v2 accounts];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v4;
}

- (void)reloadSpecifer:(id)a3
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Should reload specifer for new Internet Privacy status.", v5, 2u);
  }

  [(ICQInternetPrivacySpecifierProvider *)self _fetchStatus];
}

- (NSArray)specifiers
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = [(ICQInternetPrivacySpecifierProvider *)self internetPrivacyAvailability];
    if (v4 - 1 > 2) {
      objc_super v5 = @"Unknown";
    }
    else {
      objc_super v5 = off_264922260[v4 - 1];
    }
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Internet Privacy country availability: %@", buf, 0xCu);
  }

  if (!self->_specifiers)
  {
    uint64_t v10 = [(ICQInternetPrivacySpecifierProvider *)self internetPrivacySpecifier];
    if (v10)
    {
      v11 = (void *)v10;
      BOOL v12 = [(ICQInternetPrivacySpecifierProvider *)self _shouldShowInternetPrivacySpecifier];

      if (v12)
      {
        v13 = [(ICQInternetPrivacySpecifierProvider *)self internetPrivacySpecifier];
        v16 = v13;
        v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
        specifiers = self->_specifiers;
        self->_specifiers = v14;
      }
    }
  }
  v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_specifiers;
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacySpecifierProvider returning specifiers %@", buf, 0xCu);
  }

  v8 = self->_specifiers;
  return v8;
}

- (void)_reloadSpecifiers
{
  id v4 = (id)[(NSArray *)self->_specifiers copy];
  [(ICQInternetPrivacySpecifierProvider *)self setSpecifiers:0];
  v3 = [(ICQInternetPrivacySpecifierProvider *)self delegate];
  [v3 reloadSpecifiersForProvider:self oldSpecifiers:v4 animated:1];
}

- (void)reloadQuotaInfo
{
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Refreshing quota storage info.", v4, 2u);
  }

  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"QuotaDidChange" object:0];
}

- (void)_setupWithAltDSID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = objc_alloc_init(ICQInternetPrivacyViewModel);
  viewModel = self->_viewModel;
  self->_viewModel = v5;

  self->_internetPrivacyAvailability = 0;
  v7 = [MEMORY[0x263F53C50] sharedConnection];
  self->_hasProfileRestriction = [v7 isCloudPrivateRelayAllowed] ^ 1;

  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = @"networking.privacy.subscriber";
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Loading internet privacy service availability for %{public}@", buf, 0xCu);
  }

  v9 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v10 = [v9 bundleIdentifier];

  v11 = [(ICQInternetPrivacySpecifierProvider *)self makeDefaultInternetPrivacySpecifier];
  [(ICQInternetPrivacySpecifierProvider *)self setInternetPrivacySpecifier:v11];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke;
  v17[3] = &unk_2649221C8;
  v17[4] = self;
  [MEMORY[0x263F32BA0] requestGeoClassificationForFeatureID:@"networking.privacy.subscriber" bundleID:v10 altDSID:v4 ignoreCache:0 completion:v17];
  BOOL v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel_reloadSpecifer_ name:@"PorcupineStatusDidChange" object:0];

  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel_reloadSpecifer_ name:*MEMORY[0x263F536E0] object:0];

  objc_initWeak((id *)buf, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke_2;
  v16[3] = &unk_264921C80;
  v16[4] = self;
  v14 = [MEMORY[0x263F32BA0] registerForFeatureChangeNotificationsUsingBlock:v16];
  observationToken = self->_observationToken;
  self->_observationToken = v14;

  [(ICQInternetPrivacySpecifierProvider *)self _registerForNSPDarwinNotification];
  objc_destroyWeak((id *)buf);
}

void __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) > 2) {
      v8 = @"Unknown";
    }
    else {
      v8 = off_264922260[a2 - 1];
    }
    v9 = [v6 localizedDescription];
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Received status %@, error: %@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) setInternetPrivacyAvailability:a2];
  uint64_t v10 = *(void **)(a1 + 32);
  BOOL v11 = v10[9] == 2;
  BOOL v12 = [v10 viewModel];
  [v12 setServiceIsLimited:v11];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke_38;
  block[3] = &unk_264921C80;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  [*(id *)(a1 + 32) _fetchStatus];
}

uint64_t __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke_38(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 internetPrivacySpecifier];
  [v2 _configureInternetPrivacySpecifier:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 _reloadSpecifiers];
}

uint64_t __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke_2(uint64_t a1)
{
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "received feature change notification; reloading internet privacy specifiers",
      v4,
      2u);
  }

  return [*(id *)(a1 + 32) _fetchStatusWithCompletion:0];
}

- (void)_presentLearnMoreSubscriberPage
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = @"com.apple.icloud.privaterelay.learnmoresubscriber";
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Presenting sheet with identifier %@", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [(ICQInternetPrivacySpecifierProvider *)self viewModel];
  objc_super v5 = +[ICQInternetPrivacySheetPresenter presenterWithIdentifier:@"com.apple.icloud.privaterelay.learnmoresubscriber" viewModel:v4];

  id v6 = [(ICQInternetPrivacySpecifierProvider *)self delegate];
  v7 = [v6 navigationController];

  [v5 setPresentingViewController:v7];
  [v5 present];
}

- (id)makeDefaultInternetPrivacySpecifier
{
  v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [(ICQInternetPrivacySpecifierProvider *)self viewModel];
  objc_super v5 = [v4 switchTitle];
  id v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:sel__valueForInternetPrivacySpecifier_ detail:objc_opt_class() cell:-1 edit:0];

  [v6 setIdentifier:@"INTERNET_PRIVACY"];
  v7 = [MEMORY[0x263F827E8] icqBundleImageNamed:@"PrivateRelayIcon"];
  [v6 setProperty:v7 forKey:*MEMORY[0x263F60140]];

  [v6 setControllerLoadAction:sel__controllerLoadAction];
  return v6;
}

- (void)_controllerLoadAction
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __60__ICQInternetPrivacySpecifierProvider__controllerLoadAction__block_invoke;
  v2[3] = &unk_264921C80;
  v2[4] = self;
  [(ICQInternetPrivacySpecifierProvider *)self _fetchStatusWithCompletion:v2];
}

void __60__ICQInternetPrivacySpecifierProvider__controllerLoadAction__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) viewModel];
    id v4 = [v3 proxyUserTierDescription];
    objc_super v5 = [*(id *)(a1 + 32) viewModel];
    id v6 = [v5 proxyAccountTypeDescription];
    int v12 = 138412546;
    v13 = v4;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "tap action: got user tier: %@, account type: %@", (uint8_t *)&v12, 0x16u);
  }
  v7 = [*(id *)(a1 + 32) viewModel];
  uint64_t v8 = [v7 proxyAccountType];

  if (v8 == 2)
  {
    BOOL v11 = *(void **)(a1 + 32);
    uint64_t v10 = [v11 internetPrivacySpecifier];
    [v11 _internetPrivacySpecifierWasTapped:v10];
  }
  else if (v8 == 1)
  {
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v9 internetPrivacySpecifier];
    [v9 _internetPrivacySpecifierLoadJourney:v10];
  }
  else
  {
    uint64_t v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "in waiting state ... not doing anything", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)_configureInternetPrivacySpecifier:(id)a3
{
  id v9 = a3;
  id v4 = [(ICQInternetPrivacySpecifierProvider *)self viewModel];
  objc_super v5 = [v4 switchTitle];
  [v9 setName:v5];

  id v6 = [(ICQInternetPrivacySpecifierProvider *)self viewModel];
  uint64_t v7 = [v6 status];

  if (v7 == 7) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = 2;
  }
  [v9 setCellType:v8];
}

- (id)_valueForInternetPrivacySpecifier:(id)a3
{
  return [(ICQInternetPrivacyViewModel *)self->_viewModel privateRelayStatusText];
}

- (void)_fetchStatusWithCompletion:(id)a3
{
  id v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  uint64_t v15 = 0;
  objc_super v5 = [(ICQInternetPrivacySpecifierProvider *)self viewModel];
  uint64_t v6 = [v5 status];

  uint64_t v15 = v6;
  uint64_t v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "fetching bannerModels from viewModel", buf, 2u);
  }

  uint64_t v8 = [(ICQInternetPrivacySpecifierProvider *)self viewModel];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__ICQInternetPrivacySpecifierProvider__fetchStatusWithCompletion___block_invoke;
  v10[3] = &unk_264922218;
  v10[4] = self;
  int v12 = v14;
  id v9 = v4;
  id v11 = v9;
  [v8 fetchBannerModels:v10];

  _Block_object_dispose(v14, 8);
}

void __66__ICQInternetPrivacySpecifierProvider__fetchStatusWithCompletion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__ICQInternetPrivacySpecifierProvider__fetchStatusWithCompletion___block_invoke_2;
  block[3] = &unk_2649221F0;
  block[4] = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 40);
  id v1 = (id)v2;
  long long v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__ICQInternetPrivacySpecifierProvider__fetchStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v2 = [*(id *)(a1 + 32) viewModel];
  uint64_t v3 = [v2 status];

  long long v4 = [*(id *)(a1 + 32) viewModel];
  uint64_t v5 = [v4 status];
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  uint64_t v7 = _ICQGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v3) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v5 == v6;
  }
  if (v9)
  {
    if (v8)
    {
      uint64_t v15 = [*(id *)(a1 + 32) viewModel];
      uint64_t v16 = [v15 statusDescription];
      int v18 = 138412290;
      uint64_t v19 = v16;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Skipping Internet Privacy specifier reload in iCloud. Status hasn't changed: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      uint64_t v10 = [*(id *)(a1 + 32) viewModel];
      id v11 = [v10 statusDescription];
      int v12 = ICQInternetPrivacyViewModelStatusDescription(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
      int v18 = 138412546;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Configuring and reloading Internet Privacy specifier in iCloud. New status: %@, old status: %@", (uint8_t *)&v18, 0x16u);
    }
    v13 = *(void **)(a1 + 32);
    __int16 v14 = [v13 internetPrivacySpecifier];
    [v13 _configureInternetPrivacySpecifier:v14];

    [*(id *)(a1 + 32) _reloadSpecifiers];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_fetchStatus
{
}

- (void)_internetPrivacySpecifierWasTapped:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v4 = [ICQInternetPrivacyViewController alloc];
  uint64_t v5 = [(ICQInternetPrivacySpecifierProvider *)self viewModel];
  uint64_t v6 = [(ICQInternetPrivacySpecifierProvider *)self accountManager];
  uint64_t v7 = [(ICQInternetPrivacyViewController *)v4 initWithViewModel:v5 accountManager:v6];
  internetPrivacyController = self->_internetPrivacyController;
  self->_internetPrivacyController = v7;

  BOOL v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(ICQInternetPrivacySpecifierProvider *)self viewModel];
    int v11 = [v10 serviceIsLimited];
    int v12 = @"NO";
    if (v11) {
      int v12 = @"YES";
    }
    int v14 = 138412290;
    uint64_t v15 = v12;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "_internetPrivacySpecifierWasTapped country limited %@", (uint8_t *)&v14, 0xCu);
  }
  v13 = [(ICQInternetPrivacySpecifierProvider *)self delegate];
  [v13 specifierProvider:self showViewController:self->_internetPrivacyController];
}

- (void)_internetPrivacySpecifierLoadJourney:(id)a3
{
  long long v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Not a private relay subscriber. Presenting journey flow", buf, 2u);
  }

  uint64_t v5 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  dispatch_async(v5, block);
}

void __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke(uint64_t a1)
{
  long long v2 = [ICQUpgradeFlowManager alloc];
  uint64_t v3 = [(ICQUpgradeFlowManager *)v2 initWithJourneyId:*MEMORY[0x263F88850]];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke_2;
  v6[3] = &unk_264921B68;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  uint64_t v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke_2(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 setDelegate:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) beginJourney];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    [v3 setFlowManager:v4];
  }
  else
  {
    uint64_t v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke_2_cold_1(v5);
    }
  }
}

- (BOOL)_shouldShowInternetPrivacySpecifier
{
  BOOL v2 = [(ICQInternetPrivacySpecifierProvider *)self hasProfileRestriction];
  if (v2)
  {
    uint64_t v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Hiding Private Relay because [MCProfileConnection sharedConnection] isCloudPrivateRelayAllowed] is NO (Private Relay has a profile restriction)", v5, 2u);
    }
  }
  return !v2;
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[ICQInternetPrivacySpecifierProvider upgradeFlowManagerDidCancel:]";
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Freshmint %s", (uint8_t *)&v5, 0xCu);
  }

  [(ICQInternetPrivacySpecifierProvider *)self reloadSpecifer:0];
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[ICQInternetPrivacySpecifierProvider upgradeFlowManagerDidComplete:]";
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Freshmint %s", (uint8_t *)&v5, 0xCu);
  }

  [(ICQInternetPrivacySpecifierProvider *)self reloadSpecifer:0];
  [(ICQInternetPrivacySpecifierProvider *)self reloadQuotaInfo];
}

- (BOOL)handleURL:(id)a3
{
  id v4 = a3;
  int v5 = [v4 valueForKey:@"path"];
  if ([v5 containsString:@"INTERNET_PRIVACY"]) {
    BOOL v6 = [(ICQInternetPrivacySpecifierProvider *)self _handleQuotaJourneyURL:v4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_handleQuotaJourneyURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"learnMore"];
  BOOL v6 = v5;
  if (v5 && [v5 BOOLValue])
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke;
    v18[3] = &unk_264921C80;
    v18[4] = self;
    [(ICQInternetPrivacySpecifierProvider *)self _fetchStatusWithCompletion:v18];
  }
  else
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"showNotice"];
    if (v7)
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:@"showNotice"];
      int v9 = [v8 BOOLValue];

      uint64_t v10 = @"false";
      if (v9) {
        uint64_t v10 = @"true";
      }
      int v11 = [NSString stringWithFormat:@"showNotice=%@", v10];
      int v12 = _ICQGetLogSystem();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      uint64_t v14 = *MEMORY[0x263F88850];
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v14;
        _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "Launching quota journey with id: %@", buf, 0xCu);
      }

      uint64_t v19 = v11;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_81;
      v17[3] = &unk_264922240;
      v17[4] = self;
      +[ICQUpgradeFlowManager flowManagerWithJourneyId:v14 params:v15 completion:v17];
    }
    else
    {
      [(ICQInternetPrivacySpecifierProvider *)self _controllerLoadAction];
    }
  }
  return 1;
}

void __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) viewModel];
  uint64_t v3 = [v2 proxyAccountType];

  id v4 = *(void **)(a1 + 32);
  if (v3 == 1)
  {
    id v5 = [v4 internetPrivacySpecifier];
    [v4 _internetPrivacySpecifierLoadJourney:v5];
  }
  else
  {
    [v4 _presentLearnMoreSubscriberPage];
  }
}

void __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) setFlowManager:v5];
    [v5 setDelegate:*(void *)(a1 + 32)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_2;
    block[3] = &unk_264921C80;
    int v9 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
    uint64_t v7 = v9;
  }
  else
  {
    uint64_t v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_81_cold_1((uint64_t)v6, v7);
    }
  }
}

uint64_t __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginJourney];
}

- (void)_registerForNSPDarwinNotification
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = @"com.apple.networkserviceproxy.privacy-proxy-configuration-changed";
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Registering for darwin notification %@", (uint8_t *)&v6, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleNSPDarwinNotification, @"com.apple.networkserviceproxy.privacy-proxy-configuration-changed", 0, (CFNotificationSuspensionBehavior)1028);
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Registering for darwin notification %@", (uint8_t *)&v6, 0xCu);
  }

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleNSPDarwinNotification, @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed", 0, (CFNotificationSuspensionBehavior)1028);
}

- (void)_unregisterForNSPDarwinNotification
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = @"com.apple.networkserviceproxy.privacy-proxy-configuration-changed";
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "unregistering for darwin notification %@", (uint8_t *)&v6, 0xCu);
  }

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.networkserviceproxy.privacy-proxy-configuration-changed", 0);
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "unregistering for darwin notification %@", (uint8_t *)&v6, 0xCu);
  }

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.networkserviceproxy.privacy-proxy-service-status-changed", 0);
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

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (ICQInternetPrivacyViewController)internetPrivacyController
{
  return self->_internetPrivacyController;
}

- (void)setInternetPrivacyController:(id)a3
{
}

- (ICQInternetPrivacyViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (NSString)statusString
{
  return self->_statusString;
}

- (void)setStatusString:(id)a3
{
}

- (ICQUpgradeFlowManager)flowManager
{
  return self->_flowManager;
}

- (void)setFlowManager:(id)a3
{
}

- (unint64_t)internetPrivacyAvailability
{
  return self->_internetPrivacyAvailability;
}

- (void)setInternetPrivacyAvailability:(unint64_t)a3
{
  self->_internetPrivacyAvailability = a3;
}

- (PSSpecifier)internetPrivacySpecifier
{
  return self->_internetPrivacySpecifier;
}

- (void)setInternetPrivacySpecifier:(id)a3
{
}

- (BOOL)hasProfileRestriction
{
  return self->_hasProfileRestriction;
}

- (void)setHasProfileRestriction:(BOOL)a3
{
  self->_hasProfileRestriction = a3;
}

- (NSObject)observationToken
{
  return self->_observationToken;
}

- (void)setObservationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationToken, 0);
  objc_storeStrong((id *)&self->_internetPrivacySpecifier, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_internetPrivacyController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithAccountManager:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Private relay specifier requested for non-primary account but it's not yet supported.", v1, 2u);
}

void __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "No flow manager present", v1, 2u);
}

void __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_81_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Failed to lauch journey: %@", (uint8_t *)&v2, 0xCu);
}

@end