@interface ICQInternetPrivacyViewController
- (BOOL)isEnabled;
- (ICQInternetPrivacyDelegate)specifierDelegate;
- (ICQInternetPrivacyDetailSpecifierProvider)detailSpecifierProvider;
- (ICQInternetPrivacyViewController)initWithViewModel:(id)a3 accountManager:(id)a4;
- (ICQInternetPrivacyViewModel)viewModel;
- (id)specifiers;
- (void)_setupNavigationBar;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)insertSpecifier:(id)a3 afterSpecifierNamed:(id)a4 animated:(BOOL)a5;
- (void)presentIncompatibleSitesHelp;
- (void)presentLearnMoreFrom:(id)a3;
- (void)presentSystemStatus;
- (void)reloadSpecifierForProvider:(id)a3 identifier:(id)a4;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)setDetailSpecifierProvider:(id)a3;
- (void)setSpecifierDelegate:(id)a3;
- (void)setViewModel:(id)a3;
- (void)showAlert:(id)a3;
- (void)specifierProvider:(id)a3 showViewController:(id)a4;
- (void)statusDidChange;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICQInternetPrivacyViewController

- (ICQInternetPrivacyViewController)initWithViewModel:(id)a3 accountManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICQInternetPrivacyViewController;
  v9 = [(ICQInternetPrivacyViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    v11 = [[ICQInternetPrivacyDetailSpecifierProvider alloc] initWithViewModel:v7 accountManager:v8];
    detailSpecifierProvider = v10->_detailSpecifierProvider;
    v10->_detailSpecifierProvider = v11;

    [(ICQInternetPrivacyDetailSpecifierProvider *)v10->_detailSpecifierProvider setDelegate:v10];
    [(ICQInternetPrivacyDetailSpecifierProvider *)v10->_detailSpecifierProvider setDetailDelegate:v10];
    [(ICQInternetPrivacyDetailSpecifierProvider *)v10->_detailSpecifierProvider setPresenter:v10];
  }

  return v10;
}

- (BOOL)isEnabled
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQInternetPrivacyViewController;
  [(ICQInternetPrivacyViewController *)&v4 viewWillAppear:a3];
  [(ICQInternetPrivacyViewController *)self _setupNavigationBar];
}

- (void)_setupNavigationBar
{
  id v5 = [(ICQInternetPrivacyViewController *)self navigationItem];
  v3 = [(ICQInternetPrivacyViewController *)self viewModel];
  objc_super v4 = [v3 navTitle];
  [v5 setTitle:v4];
}

- (id)specifiers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    objc_super v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacyController is loading specifiers.", (uint8_t *)&v18, 2u);
    }

    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(ICQInternetPrivacyViewController *)self viewModel];
      id v7 = [v6 proxyUserTierDescription];
      int v18 = 138412290;
      v19 = v7;
      _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "User tier %@", (uint8_t *)&v18, 0xCu);
    }
    id v8 = [(ICQInternetPrivacyViewController *)self viewModel];
    uint64_t v9 = [v8 proxyAccountType];

    if (v9 == 2)
    {
      v10 = [(ICQInternetPrivacyViewController *)self detailSpecifierProvider];
      v11 = [v10 specifiers];
      v12 = (objc_class *)[v11 copy];
      v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v12;
    }
  }
  objc_super v14 = _ICQGetLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    int v18 = 138412290;
    v19 = v15;
    _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacyController specifiers: returning %@", (uint8_t *)&v18, 0xCu);
  }

  v16 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v16;
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(ICQInternetPrivacyViewController *)self reloadSpecifiers];
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ICQInternetPrivacyViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else {
    [(ICQInternetPrivacyViewController *)self showViewController:v6 sender:v7];
  }
}

- (void)insertSpecifier:(id)a3 afterSpecifierNamed:(id)a4 animated:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(ICQInternetPrivacyViewController *)self specifierForID:v8];
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Inserting new specifier %@ after %@", (uint8_t *)&v16, 0x16u);
  }
  if ([*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) containsObject:v7])
  {
    v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v12 = "Did not insert new specifier because it's already present";
      v13 = v11;
      uint32_t v14 = 2;
LABEL_8:
      _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
  }
  else
  {
    v15 = [(ICQInternetPrivacyViewController *)self specifierForID:v8];
    [(ICQInternetPrivacyViewController *)self insertSpecifier:v7 afterSpecifier:v15 animated:1];

    v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      v12 = "Inserted new specifier %@";
      v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_8;
    }
  }
}

- (void)reloadSpecifierForProvider:(id)a3 identifier:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Reloading specifier with ID: %@", (uint8_t *)&v7, 0xCu);
  }

  [(ICQInternetPrivacyViewController *)self reloadSpecifierID:v5];
}

- (void)showAlert:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Showing an alert %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__ICQInternetPrivacyViewController_showAlert___block_invoke;
  v7[3] = &unk_264921B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __46__ICQInternetPrivacyViewController_showAlert___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)presentLearnMoreFrom:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Presenting sheet with identifier %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(ICQInternetPrivacyViewController *)self viewModel];
  int v7 = +[ICQInternetPrivacySheetPresenter presenterWithIdentifier:v4 viewModel:v6];

  [v7 setPresentingViewController:self];
  [v7 present];
}

- (void)presentSystemStatus
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F88908];
  uint64_t v4 = *MEMORY[0x263F88820];
  v5[0] = @"https://www.apple.com/support/systemstatus/";
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 performAction:6 parameters:v3 options:0];
}

- (void)presentIncompatibleSitesHelp
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F88908];
  uint64_t v4 = *MEMORY[0x263F88820];
  v5[0] = @"https://support.apple.com/ht213548?cid=mc-ols-icloud-article_ht213548-ios_ui-05232023";
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 performAction:6 parameters:v3 options:0];
}

- (void)statusDidChange
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[ICQInternetPrivacyViewController statusDidChange]";
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"PorcupineStatusDidChange" object:0];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  int v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Handling deep link for private relay.", buf, 2u);
  }

  id v9 = [v6 objectForKeyedSubscript:@"learnMore"];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"showNotice"];
  if (v9 && [v9 BOOLValue])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke;
    block[3] = &unk_264921C80;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v10)
  {
    uint64_t v11 = [v6 objectForKeyedSubscript:@"showNotice"];
    int v12 = [v11 BOOLValue];

    v13 = @"false";
    if (v12) {
      v13 = @"true";
    }
    uint32_t v14 = [NSString stringWithFormat:@"showNotice=%@", v13];
    v15 = _ICQGetLogSystem();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    uint64_t v17 = *MEMORY[0x263F88850];
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v17;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Launching quota journey with id: %@", buf, 0xCu);
    }

    v22 = v14;
    __int16 v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke_63;
    v20[3] = &unk_264922240;
    v20[4] = self;
    +[ICQUpgradeFlowManager flowManagerWithJourneyId:v17 params:v18 completion:v20];

    if (v7) {
LABEL_13:
    }
      v7[2](v7);
  }
  else
  {
    v19 = _ICQGetLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v19, OS_LOG_TYPE_DEFAULT, "It's not a show notice or learn more url. Will take no further actions.", buf, 2u);
    }

    if (v7) {
      goto LABEL_13;
    }
  }
LABEL_14:
}

uint64_t __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentLearnMoreFrom:@"com.apple.icloud.privaterelay.learnmoresubscriber"];
}

void __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1384), a2);
    [v6 setDelegate:*(void *)(a1 + 32)];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke_2;
    block[3] = &unk_264921C80;
    uint64_t v10 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
    int v8 = v10;
  }
  else
  {
    int v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_81_cold_1((uint64_t)v7, v8);
    }
  }
}

uint64_t __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginJourney];
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Upgrade flow cancelled.", v4, 2u);
  }
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Upgrade flow completed.", v4, 2u);
  }
}

- (ICQInternetPrivacyViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (ICQInternetPrivacyDelegate)specifierDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specifierDelegate);
  return (ICQInternetPrivacyDelegate *)WeakRetained;
}

- (void)setSpecifierDelegate:(id)a3
{
}

- (ICQInternetPrivacyDetailSpecifierProvider)detailSpecifierProvider
{
  return self->_detailSpecifierProvider;
}

- (void)setDetailSpecifierProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailSpecifierProvider, 0);
  objc_destroyWeak((id *)&self->_specifierDelegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
}

@end