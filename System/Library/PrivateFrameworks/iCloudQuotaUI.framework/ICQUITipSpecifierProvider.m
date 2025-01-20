@interface ICQUITipSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)_tipArrowConfigurationIsEligibleForDisplay:(id)a3;
- (BOOL)hasDismissedTip;
- (Class)tableCellClassForTableViewRow:(id)a3;
- (ICQUIInlineTipViewModel)viewModel;
- (ICQUITipSpecifierProvider)initWithAccountManager:(id)a3;
- (ICQUITipSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4 sectionAnchorIdentifier:(id)a5 showUpwardPointingTips:(BOOL)a6;
- (NSArray)specifiers;
- (id)_tipSpecifiers;
- (id)_valueForSpecifier:(id)a3;
- (id)account;
- (id)tipForManageStorageFromAttributes:(id)a3 rows:(id)a4 viewController:(id)a5 remoteUIDelegate:(id)a6;
- (void)_cleanUpSyncWithiCloudFooterIfApplicable;
- (void)_dismissPressed;
- (void)_fetchAndDisplayTipIfNotYetDismissed;
- (void)_fetchTip:(id)a3;
- (void)_getEligibleTipFromTips:(id)a3 completion:(id)a4;
- (void)_launchLegacyRemoteUIWithURL:(id)a3;
- (void)_launchLiftUIWithURL:(id)a3;
- (void)_launchRemoteUIWithURL:(id)a3 forDataclasses:(id)a4;
- (void)_launchUpgradeFlowWithAction:(int64_t)a3 andURL:(id)a4;
- (void)_launchUpgradeFlowWithActionString:(id)a3 andURL:(id)a4;
- (void)_openExternalLink:(id)a3;
- (void)_openLiftUILink:(id)a3;
- (void)_openRemoteUILink:(id)a3 forDataclasses:(id)a4;
- (void)_reloadSpecifiers;
- (void)_removeVisibleTip;
- (void)_tipDisplayed;
- (void)_updateSyncWithiCloudFooterIfApplicable;
- (void)dealloc;
- (void)liftUIPresenterDidCancel:(id)a3;
- (void)liftUIPresenterDidComplete:(id)a3;
- (void)loadFailed:(id)a3 withError:(id)a4;
- (void)loadFinished:(id)a3;
- (void)loadStarted:(id)a3;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4;
- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setHasDismissedTip:(BOOL)a3;
- (void)setSpecifiers:(id)a3;
- (void)setViewModel:(id)a3;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
@end

@implementation ICQUITipSpecifierProvider

- (ICQUITipSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(ICQUITipSpecifierProvider *)self initWithAccountManager:a3 presenter:0 sectionAnchorIdentifier:0 showUpwardPointingTips:0];
}

- (ICQUITipSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4 sectionAnchorIdentifier:(id)a5 showUpwardPointingTips:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICQUITipSpecifierProvider;
  v14 = [(ICQUITipSpecifierProvider *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accountManager, a3);
    objc_storeWeak((id *)&v15->_listController, v12);
    v15->_showUpwardPointingTips = a6;
    objc_storeStrong((id *)&v15->_anchorIdentifier, a5);
    v15->_hasDismissedTip = 0;
    v15->_tipRequestState = 0;
  }

  return v15;
}

- (void)dealloc
{
  manageStorageTipController = self->_manageStorageTipController;
  if (manageStorageTipController)
  {
    [(AMSUIBubbleTipViewController *)manageStorageTipController removeFromParentViewController];
    [(AMSUIBubbleTipViewController *)self->_manageStorageTipController setDelegate:0];
    v4 = self->_manageStorageTipController;
    self->_manageStorageTipController = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ICQUITipSpecifierProvider;
  [(ICQUITipSpecifierProvider *)&v5 dealloc];
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (specifiers)
  {
    v3 = specifiers;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    int64_t tipRequestState = self->_tipRequestState;
    switch(tipRequestState)
    {
      case 2:
        if (self->_viewModel)
        {
          uint64_t v7 = [(ICQUITipSpecifierProvider *)self _tipSpecifiers];

          id v5 = (id)v7;
        }
        self->_int64_t tipRequestState = 0;
        break;
      case 1:
        v8 = _ICQGetLogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v12 = 0;
          _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Tip request is already in progress. Bailing!", v12, 2u);
        }

        break;
      case 0:
        [(ICQUITipSpecifierProvider *)self _fetchAndDisplayTipIfNotYetDismissed];
        break;
    }
    v9 = (NSArray *)[v5 copy];
    v10 = self->_specifiers;
    self->_specifiers = v9;

    v3 = self->_specifiers;
  }
  return v3;
}

- (id)_tipSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"TIP_GROUP"];
  id v5 = [(ICQUIInlineTipViewModel *)self->_viewModel tipArrow];
  uint64_t v6 = [v5 arrowDirection];

  if (v6)
  {
    uint64_t v7 = [(ICQUIInlineTipViewModel *)self->_viewModel tipArrow];
    uint64_t v8 = [v7 arrowDirection];

    if (v8 == 1) {
      v9 = @"DOWN";
    }
    else {
      v9 = @"NONE";
    }
  }
  else
  {
    v9 = @"UP";
  }
  [v4 setObject:v9 forKeyedSubscript:@"TIP_ORIENTATION"];
  [v4 setObject:&unk_26E01EE40 forKeyedSubscript:*MEMORY[0x263F600B8]];
  [v3 addObject:v4];
  v10 = (void *)MEMORY[0x263F5FC40];
  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"TIP_HOST" value:&stru_26DFF2C90 table:@"Localizable"];
  id v13 = [v10 preferenceSpecifierNamed:v12 target:self set:0 get:sel__valueForSpecifier_ detail:0 cell:-1 edit:0];

  [v13 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
  id v14 = objc_alloc(MEMORY[0x263F27FD8]);
  v15 = [(ICQUIInlineTipViewModel *)self->_viewModel request];
  v16 = (AMSUIBubbleTipViewController *)[v14 initWithRequest:v15];
  inlineTipController = self->_inlineTipController;
  self->_inlineTipController = v16;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  [WeakRetained addChildViewController:self->_inlineTipController];

  v19 = [(ICQUIInlineTipViewModel *)self->_viewModel tipArrow];
  [(AMSUIBubbleTipViewController *)self->_inlineTipController setInlineAnchorInfo:v19];

  [(AMSUIBubbleTipViewController *)self->_inlineTipController setDelegate:self];
  v20 = [(AMSUIBubbleTipViewController *)self->_inlineTipController view];
  [v13 setObject:v20 forKeyedSubscript:@"ICQUITipView"];

  [v3 addObject:v13];
  return v3;
}

- (void)_fetchAndDisplayTipIfNotYetDismissed
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_hasDismissedTip)
  {
    id v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      anchorIdentifier = self->_anchorIdentifier;
      id v5 = @"YES";
      if (!self->_showUpwardPointingTips) {
        id v5 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      v9 = anchorIdentifier;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Will not fetch tips for ICQUITipSpecifierProvider with _anchorIdentifier (%@) and _showUpwardPointingTips (%@), has already been dismissed.", buf, 0x16u);
    }

    self->_int64_t tipRequestState = 2;
  }
  else
  {
    self->_int64_t tipRequestState = 1;
    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __65__ICQUITipSpecifierProvider__fetchAndDisplayTipIfNotYetDismissed__block_invoke;
    v6[3] = &unk_264923CD0;
    objc_copyWeak(&v7, (id *)buf);
    [(ICQUITipSpecifierProvider *)self _fetchTip:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __65__ICQUITipSpecifierProvider__fetchAndDisplayTipIfNotYetDismissed__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__ICQUITipSpecifierProvider__fetchAndDisplayTipIfNotYetDismissed__block_invoke_2;
  v5[3] = &unk_264923B30;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __65__ICQUITipSpecifierProvider__fetchAndDisplayTipIfNotYetDismissed__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained viewModel];
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);

      if (!v5) {
        [v3 setHasDismissedTip:1];
      }
    }
    v3[11] = 2;
    [v3 setViewModel:*(void *)(a1 + 32)];
    [v3 _reloadSpecifiers];
  }
  else
  {
    id v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "ICQUITipSpecifierProvider was deallocated before the fetchTips request finished.", v7, 2u);
    }
  }
}

- (void)_fetchTip:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    anchorIdentifier = self->_anchorIdentifier;
    id v7 = @"true";
    if (!self->_showUpwardPointingTips) {
      id v7 = @"false";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = anchorIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Fetching tips for ICQUITipSpecifierProvider with _anchorIdentifier (%@) and _showUpwardPointingTips (%@)", buf, 0x16u);
  }

  p_anchorIdentifier = &self->_anchorIdentifier;
  if (self->_anchorIdentifier)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v30 = __Block_byref_object_copy__14;
    v31 = __Block_byref_object_dispose__14;
    id v9 = objc_alloc(MEMORY[0x263F888D0]);
    __int16 v10 = [(ICQUITipSpecifierProvider *)self account];
    id v32 = (id)[v9 initWithAccount:v10];

    if (self->_hasDismissedTip) {
      [*(id *)(*(void *)&buf[8] + 40) setShouldIgnoreCache:1];
    }
    objc_initWeak(&location, self);
    id v11 = self->_anchorIdentifier;
    BOOL showUpwardPointingTips = self->_showUpwardPointingTips;
    id v13 = *(void **)(*(void *)&buf[8] + 40);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __39__ICQUITipSpecifierProvider__fetchTip___block_invoke;
    v22[3] = &unk_264923D20;
    id v24 = v4;
    v25 = buf;
    objc_copyWeak(&v26, &location);
    id v14 = v11;
    v23 = v14;
    BOOL v27 = showUpwardPointingTips;
    [v13 fetchStorageSummaryWithCompletion:v22];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ICQUITipSpecifierProvider _fetchTip:]((uint64_t)p_anchorIdentifier, v15, v16, v17, v18, v19, v20, v21);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __39__ICQUITipSpecifierProvider__fetchTip___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __39__ICQUITipSpecifierProvider__fetchTip___block_invoke_cold_1((uint64_t)v6, v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v11 = [v5 tips];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __39__ICQUITipSpecifierProvider__fetchTip___block_invoke_88;
    v12[3] = &unk_264923CF8;
    objc_copyWeak(&v16, (id *)(a1 + 56));
    uint64_t v15 = *(void *)(a1 + 48);
    id v13 = *(id *)(a1 + 32);
    char v17 = *(unsigned char *)(a1 + 64);
    id v14 = *(id *)(a1 + 40);
    [WeakRetained _getEligibleTipFromTips:v11 completion:v12];

    objc_destroyWeak(&v16);
  }
}

void __39__ICQUITipSpecifierProvider__fetchTip___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "ICQUITipSpecifierProvider was deallocated before _getEligibleTipFromTips completion.", (uint8_t *)&v17, 2u);
    }

    goto LABEL_14;
  }
  if (!v3)
  {
    [WeakRetained _updateSyncWithiCloudFooterIfApplicable];
    id v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = @"YES";
      if (!*(unsigned char *)(a1 + 64)) {
        uint64_t v15 = @"NO";
      }
      int v17 = 138412546;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "Specifier provider found no eligible tip for display in section (%@) with isUpwardPointingTip (%@)", (uint8_t *)&v17, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_14:
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(ICQUIInlineTipViewModel **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
    goto LABEL_15;
  }
  [WeakRetained _cleanUpSyncWithiCloudFooterIfApplicable];
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [v3 arrowConfiguration];
    int v17 = 138412802;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Specifier provider found eligible tip for display in section (%@) with arrow configuration (%@): %@", (uint8_t *)&v17, 0x20u);
  }
  id v9 = [[ICQUIInlineTipViewModel alloc] initWithInlineTip:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

LABEL_15:
}

- (void)_getEligibleTipFromTips:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x263F88940];
  id v8 = a3;
  id v9 = [v7 alloc];
  uint64_t v10 = [(ICQUITipSpecifierProvider *)self account];
  id v11 = (void *)[v9 initWithAccount:v10];

  uint64_t v12 = [ICQUIEligibleTipPicker alloc];
  id v13 = [(ICQUITipSpecifierProvider *)self account];
  uint64_t v14 = [(ICQUIEligibleTipPicker *)v12 initWithAccount:v13 planRecommendation:v11];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__ICQUITipSpecifierProvider__getEligibleTipFromTips_completion___block_invoke;
  v16[3] = &unk_264923D48;
  v16[4] = self;
  id v17 = v6;
  id v15 = v6;
  [(ICQUIEligibleTipPicker *)v14 getFirstEligibleTipFromTips:v8 completion:v16];
}

void __64__ICQUITipSpecifierProvider__getEligibleTipFromTips_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = [v3 anchor];
    if ([v4 isEqualToString:*(void *)(*(void *)(a1 + 32) + 72)])
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [v8 arrowConfiguration];
      LOBYTE(v5) = [v5 _tipArrowConfigurationIsEligibleForDisplay:v6];

      if (v5)
      {
        uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_7:
  v7();
}

- (BOOL)_tipArrowConfigurationIsEligibleForDisplay:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F88900] upwardArrowConfigurationStrings];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    BOOL showUpwardPointingTips = self->_showUpwardPointingTips;
  }
  else
  {
    id v8 = [MEMORY[0x263F88900] downwardArrowConfigurationStrings];
    int v9 = [v8 containsObject:v4];

    if (v9)
    {
      BOOL showUpwardPointingTips = !self->_showUpwardPointingTips;
    }
    else
    {
      uint64_t v10 = _ICQGetLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ICQUITipSpecifierProvider _tipArrowConfigurationIsEligibleForDisplay:]();
      }

      BOOL showUpwardPointingTips = 0;
    }
  }

  return showUpwardPointingTips;
}

- (void)_reloadSpecifiers
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = (id)[(NSArray *)self->_specifiers copy];
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifiersForProvider:self oldSpecifiers:v5 animated:1];
}

- (id)_valueForSpecifier:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Value for tip specifier", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ICQUITipSpecifierProvider__valueForSpecifier___block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  if (_valueForSpecifier__onceToken != -1) {
    dispatch_once(&_valueForSpecifier__onceToken, block);
  }
  return 0;
}

uint64_t __48__ICQUITipSpecifierProvider__valueForSpecifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tipDisplayed];
}

- (void)_tipDisplayed
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Display Tip viewmodel is nil. Bailing.", v2, v3, v4, v5, v6);
}

void __42__ICQUITipSpecifierProvider__tipDisplayed__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__ICQUITipSpecifierProvider__tipDisplayed__block_invoke_cold_1();
    }
  }
}

- (void)_removeVisibleTip
{
  viewModel = self->_viewModel;
  if (viewModel)
  {
    self->_viewModel = 0;

    specifiers = self->_specifiers;
    self->_specifiers = 0;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__ICQUITipSpecifierProvider__removeVisibleTip__block_invoke;
    block[3] = &unk_264921C80;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __46__ICQUITipSpecifierProvider__removeVisibleTip__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained removeChildViewController:*(void *)(*(void *)(a1 + 32) + 24)];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v3 removeSpecifierID:@"TIP_GROUP"];
}

- (void)_dismissPressed
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Dismiss Tip viewmodel is nil. Bailing.", v2, v3, v4, v5, v6);
}

void __44__ICQUITipSpecifierProvider__dismissPressed__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__ICQUITipSpecifierProvider__dismissPressed__block_invoke_cold_1();
    }
  }
}

- (void)_openExternalLink:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _ICQGetLogSystem();
  uint8_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(ICQUIInlineTipViewModel *)self->_viewModel request];
      id v8 = [v7 title];
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Opening external link \"%@\" from tip with title: \"%@\"", (uint8_t *)&v9, 0x16u);
    }
    uint8_t v6 = [MEMORY[0x263F01880] defaultWorkspace];
    [v6 openSensitiveURL:v4 withOptions:0];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[ICQUITipSpecifierProvider _openExternalLink:]();
  }
}

- (void)_openRemoteUILink:(id)a3 forDataclasses:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _ICQGetLogSystem();
  int v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(ICQUIInlineTipViewModel *)self->_viewModel request];
      __int16 v11 = [v10 title];
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Opening RemoteUI link \"%@\" from tip with title: \"%@\"", (uint8_t *)&v12, 0x16u);
    }
    [(ICQUITipSpecifierProvider *)self _launchRemoteUIWithURL:v6 forDataclasses:v7];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ICQUITipSpecifierProvider _openRemoteUILink:forDataclasses:]();
    }
  }
}

- (void)_openLiftUILink:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _ICQGetLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(ICQUIInlineTipViewModel *)self->_viewModel request];
      id v8 = [v7 title];
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      int v12 = v8;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Opening LiftUI link \"%@\" from tip with title: \"%@\"", (uint8_t *)&v9, 0x16u);
    }
    [(ICQUITipSpecifierProvider *)self _launchLiftUIWithURL:v4];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICQUITipSpecifierProvider _openLiftUILink:]();
    }
  }
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11.CGFloat width = width;
    v11.CGFloat height = height;
    id v7 = NSStringFromCGSize(v11);
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "AMSUIViewController didUpdateSize to %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "AMSUIViewController didSelectDialogAction for %@", buf, 0xCu);
  }

  id v7 = [v5 selectedActionIdentifier];
  int v8 = [v5 originalRequest];
  int v9 = [v8 locateActionWithIdentifier:v7];

  uint64_t v10 = [v9 deepLink];
  CGSize v11 = [v9 userInfo];
  v51 = [v11 objectForKeyedSubscript:@"actionName"];
  int v12 = [v11 objectForKeyedSubscript:@"isTurnOnApps"];
  int v13 = [v12 BOOLValue];

  v50 = v11;
  if (v13)
  {
    v47 = v9;
    v48 = v7;
    id v49 = v5;
    __int16 v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "Handling turn on apps request, appending count to URL", buf, 2u);
    }

    uint64_t v15 = [v11 objectForKeyedSubscript:@"excludeApps"];
    if (v15) {
      uint64_t v16 = (void *)v15;
    }
    else {
      uint64_t v16 = (void *)MEMORY[0x263EFFA68];
    }
    id v17 = self;
    uint64_t v18 = [(ICQUITipSpecifierProvider *)self account];
    __int16 v19 = +[ICQUIDataclassHelper dataclassesToEnableForAccount:v18 excludedApps:v16];

    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v10 resolvingAgainstBaseURL:0];
    __int16 v21 = [v20 queryItems];
    id v22 = v10;
    id v23 = objc_alloc(MEMORY[0x263F08BD0]);
    id v24 = v19;
    v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    id v26 = [v25 stringValue];
    BOOL v27 = (void *)[v23 initWithName:@"appCount" value:v26];
    v28 = [v21 arrayByAddingObject:v27];
    [v20 setQueryItems:v28];

    uint64_t v10 = [v20 URL];

    id v7 = v48;
    id v5 = v49;
    int v9 = v47;
  }
  else
  {
    id v17 = self;
    id v24 = 0;
  }
  v29 = _ICQGetLogSystem();
  v30 = v51;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [v10 absoluteString];
    *(_DWORD *)buf = 138412546;
    id v53 = v51;
    __int16 v54 = 2112;
    v55 = v31;
    _os_log_impl(&dword_22C821000, v29, OS_LOG_TYPE_DEFAULT, "Handling select action with identifier (%@) with deep link (%@).", buf, 0x16u);
  }
  id v32 = v17;
  if (![v51 isEqualToString:*MEMORY[0x263F27838]])
  {
    uint64_t v33 = v50;
    if ([v51 isEqualToString:@"OPEN_EXT_LINK"])
    {
      if (v24)
      {
        v34 = _ICQGetLogSystem();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:
        -[ICQUITipSpecifierProvider messageViewController:didSelectActionWithDialogResult:]();
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    v36 = v10;
    if ([v51 isEqualToString:@"LAUNCH_REMOTE_UI"])
    {
      v37 = [v50 objectForKeyedSubscript:@"id"];
      int v38 = [v37 isEqualToString:*MEMORY[0x263F888B0]];

      if (!v38)
      {
        uint64_t v10 = v36;
        [(ICQUITipSpecifierProvider *)v32 _openRemoteUILink:v36 forDataclasses:v24];
LABEL_38:
        v30 = v51;
        goto LABEL_39;
      }
      v39 = [v50 objectForKeyedSubscript:@"isManageStorageTip"];

      v40 = [v9 deepLink];
      if (v39)
      {
        [(ICQUITipSpecifierProvider *)v32 _launchLegacyRemoteUIWithURL:v40];
LABEL_37:

        uint64_t v10 = v36;
        goto LABEL_38;
      }
    }
    else
    {
      if (![v51 isEqualToString:@"LAUNCH_LIFT_UI"])
      {
        if ([v51 isEqualToString:@"UPGRADE_ICLOUD_STORAGE_DIRECT_TO_OSLO"])
        {
          v44 = [v9 deepLink];
          [(ICQUITipSpecifierProvider *)v32 _launchUpgradeFlowWithAction:118 andURL:v44];

          v30 = v51;
          goto LABEL_39;
        }
        if (_ICQActionForString())
        {
          v45 = _ICQGetLogSystem();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C821000, v45, OS_LOG_TYPE_DEFAULT, "No special  handling for action identifier, launching upgrade flow", buf, 2u);
          }

          v35 = [v9 deepLink];
          v30 = v51;
          [(ICQUITipSpecifierProvider *)v32 _launchUpgradeFlowWithActionString:v51 andURL:v35];
          goto LABEL_21;
        }
        v30 = v51;
        if (!v10) {
          goto LABEL_39;
        }
        v46 = _ICQGetLogSystem();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C821000, v46, OS_LOG_TYPE_DEFAULT, "No action identifier included in action, opening as external link.", buf, 2u);
        }

        if (v24)
        {
          v34 = _ICQGetLogSystem();
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }
LABEL_20:
        v35 = [v9 deepLink];
        [(ICQUITipSpecifierProvider *)v32 _openExternalLink:v35];
LABEL_21:

        goto LABEL_39;
      }
      if (v24)
      {
        v41 = _ICQGetLogSystem();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          -[ICQUITipSpecifierProvider messageViewController:didSelectActionWithDialogResult:]();
        }
      }
      v42 = [v50 objectForKeyedSubscript:@"id"];
      int v43 = [v42 isEqualToString:*MEMORY[0x263F888B0]];

      v40 = [v9 deepLink];
      if (!v43)
      {
        [(ICQUITipSpecifierProvider *)v32 _openLiftUILink:v40];
        goto LABEL_37;
      }
    }
    [(ICQUITipSpecifierProvider *)v32 _launchUpgradeFlowWithActionString:v51 andURL:v40];

    uint64_t v10 = v36;
    v30 = v51;
    goto LABEL_39;
  }
  [(ICQUITipSpecifierProvider *)v17 _dismissPressed];
  uint64_t v33 = v50;
LABEL_39:
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ICQUITipSpecifierProvider messageViewController:didFailWithError:]();
  }
}

- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "AMSUIViewController finished loading request %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ICQUITipSpecifierProvider_messageViewController_didLoadDialogRequest___block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __72__ICQUITipSpecifierProvider_messageViewController_didLoadDialogRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadSpecifiers];
}

- (void)_launchLiftUIWithURL:(id)a3
{
  id v4 = a3;
  if (self->_liftUIPresenter)
  {
    p_super = _ICQGetLogSystem();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      -[ICQUITipSpecifierProvider _launchLiftUIWithURL:]();
    }
LABEL_8:

    goto LABEL_9;
  }
  id v6 = [ICQLiftUIPresenter alloc];
  id v7 = [(ICQUITipSpecifierProvider *)self account];
  int v8 = [(ICQLiftUIPresenter *)v6 initWithURL:v4 account:v7 data:0];
  liftUIPresenter = self->_liftUIPresenter;
  self->_liftUIPresenter = v8;

  [(ICQLiftUIPresenter *)self->_liftUIPresenter setDelegate:self];
  uint64_t v10 = self->_liftUIPresenter;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  int v12 = [WeakRetained navigationController];
  LOBYTE(v10) = [(ICQLiftUIPresenter *)v10 pushInNavigationController:v12 animated:1];

  if ((v10 & 1) == 0)
  {
    int v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ICQUITipSpecifierProvider _launchLiftUIWithURL:]();
    }

    p_super = &self->_liftUIPresenter->super;
    self->_liftUIPresenter = 0;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_launchRemoteUIWithURL:(id)a3 forDataclasses:(id)a4
{
  id v6 = a4;
  id v12 = a3;
  id v7 = [ICQUIRemoteUIPresenter alloc];
  int v8 = [(ICQUITipSpecifierProvider *)self account];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  uint64_t v10 = [(ICQUIRemoteUIPresenter *)v7 initWithAccount:v8 presenter:WeakRetained];
  ruiFlowManager = self->_ruiFlowManager;
  self->_ruiFlowManager = v10;

  [(ICQUIRemoteUIPresenter *)self->_ruiFlowManager setDelegate:self];
  [(ICQUIRemoteUIPresenter *)self->_ruiFlowManager setDataclasses:v6];

  [(ICQUIRemoteUIPresenter *)self->_ruiFlowManager beginRUIFlowWithURL:v12];
}

- (void)_launchLegacyRemoteUIWithURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_legacyRemoteUIDelegate = &self->_legacyRemoteUIDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_legacyRemoteUIDelegate);

  id v7 = _ICQGetLogSystem();
  int v8 = v7;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "legacyRemoteUIDelegate used to launch url: %@", (uint8_t *)&v9, 0xCu);
    }

    int v8 = objc_loadWeakRetained((id *)p_legacyRemoteUIDelegate);
    [v8 loadURL:v4 postBody:0 additionalHeaders:0];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[ICQUITipSpecifierProvider _launchLegacyRemoteUIWithURL:]();
  }
}

- (void)_launchUpgradeFlowWithActionString:(id)a3 andURL:(id)a4
{
  id v5 = a4;
  [(ICQUITipSpecifierProvider *)self _launchUpgradeFlowWithAction:_ICQActionForString() andURL:v5];
}

- (void)_launchUpgradeFlowWithAction:(int64_t)a3 andURL:(id)a4
{
  id v6 = a4;
  if (self->_upgradeFlowManager)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICQUITipSpecifierProvider _launchUpgradeFlowWithAction:andURL:]();
    }
  }
  else
  {
    int v8 = objc_alloc_init(ICQUpgradeFlowManager);
    upgradeFlowManager = self->_upgradeFlowManager;
    self->_upgradeFlowManager = v8;

    [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setDelegate:self];
    if (v6)
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x263F88908]) initWithAction:a3 url:v6];
      uint64_t v11 = self->_upgradeFlowManager;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      [(ICQUpgradeFlowManager *)v11 beginRemoteUpgradeFlowWithICQLink:v10 presenter:WeakRetained];
    }
    else
    {
      int v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v14 = 0;
        _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "URL is nil. Launching fallback upgrade flow.", v14, 2u);
      }

      [(ICQUpgradeFlowManager *)self->_upgradeFlowManager _beginRemoteFlowWithURL:0];
    }
  }
}

- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = a5;
  int v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v5;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "RUI flow completed with success: %d, error: %@", (uint8_t *)v9, 0x12u);
  }

  if (!v7) {
    [(ICQUITipSpecifierProvider *)self _removeVisibleTip];
  }
}

- (void)liftUIPresenterDidComplete:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "LiftUI flow completed", v9, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v6 = [WeakRetained navigationController];
  id v7 = (id)[v6 popViewControllerAnimated:1];

  [(ICQUITipSpecifierProvider *)self _removeVisibleTip];
  liftUIPresenter = self->_liftUIPresenter;
  self->_liftUIPresenter = 0;
}

- (void)liftUIPresenterDidCancel:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "LiftUI flow cancelled", v9, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v6 = [WeakRetained navigationController];
  id v7 = (id)[v6 popViewControllerAnimated:1];

  liftUIPresenter = self->_liftUIPresenter;
  self->_liftUIPresenter = 0;
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v4 = a4;
  BOOL v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ICQUITipSpecifierProvider loadFailed:withError:]();
  }
}

- (void)loadFinished:(id)a3
{
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "DelayedPushDelegate for ICQ Tip Loading finished", v4, 2u);
  }
}

- (void)loadStarted:(id)a3
{
  uint64_t v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "DelayedPushDelegate for ICQ Tip Loading started", v4, 2u);
  }
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow cancelled.", v6, 2u);
  }

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

  [(ICQUpgradeFlowManager *)self->_upgradeFlowManager setDelegate:0];
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;

  [(ICQUITipSpecifierProvider *)self _removeVisibleTip];
}

- (void)_updateSyncWithiCloudFooterIfApplicable
{
  id v11 = [(ICQUITipSpecifierProvider *)self account];
  if (objc_msgSend(v11, "aa_isCloudSubscriber")
    && self->_anchorIdentifier == (NSString *)*MEMORY[0x263F888A8])
  {
    BOOL hasDismissedTip = self->_hasDismissedTip;

    if (!hasDismissedTip)
    {
      id v4 = [(ICQUITipSpecifierProvider *)self account];
      BOOL v5 = +[ICQUIDataclassHelper dataclassesToEnableForAccount:v4 excludedApps:MEMORY[0x263EFFA68]];

      id v6 = _ICQGetLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
      }

      if ((unint64_t)[v5 count] < 2)
      {
        int v8 = @" ";
      }
      else
      {
        id v7 = [(ICQUITipSpecifierProvider *)self account];
        int v8 = +[ICQUIDataclassHelper footerTextForSyncWithiCloudSpecifiersFromDataclasses:v5 forAccount:v7];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__ICQUITipSpecifierProvider__updateSyncWithiCloudFooterIfApplicable__block_invoke;
      block[3] = &unk_264922568;
      block[4] = self;
      id v13 = v5;
      __int16 v14 = v8;
      int v9 = v8;
      id v10 = v5;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
  }
}

void __68__ICQUITipSpecifierProvider__updateSyncWithiCloudFooterIfApplicable__block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  uint64_t v3 = [WeakRetained specifierForID:@"SYNC WITH ICLOUD"];

  id v4 = _ICQGetLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = a1[5];
      int v7 = 138412290;
      uint64_t v8 = v6;
    }

    [v3 setObject:a1[6] forKeyedSubscript:*MEMORY[0x263F600F8]];
  }
  else
  {
    if (v5)
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "DataclassesGroupSpecifier not found. Cannot update footer for disabled dataclasses.", (uint8_t *)&v7, 2u);
    }
  }
}

- (void)_cleanUpSyncWithiCloudFooterIfApplicable
{
  if (self->_anchorIdentifier == (NSString *)*MEMORY[0x263F888A8])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__ICQUITipSpecifierProvider__cleanUpSyncWithiCloudFooterIfApplicable__block_invoke;
    block[3] = &unk_264921C80;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __69__ICQUITipSpecifierProvider__cleanUpSyncWithiCloudFooterIfApplicable__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v2 = [WeakRetained specifierForID:@"SYNC WITH ICLOUD"];

  uint64_t v3 = *MEMORY[0x263F600F8];
  id v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F600F8]];

  BOOL v5 = _ICQGetLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)int v7 = 0;
    }

    [v2 setObject:0 forKeyedSubscript:v3];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
    }
  }
}

- (id)tipForManageStorageFromAttributes:(id)a3 rows:(id)a4 viewController:(id)a5 remoteUIDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = v13;
  if (v10 && v13)
  {
    objc_storeWeak((id *)&self->_legacyRemoteUIDelegate, v13);
    uint64_t v15 = [[ICQUIManageStorageTipViewModel alloc] initWithSectionAttributes:v10 rows:v11];
    uint64_t v16 = objc_alloc_init(ICQUIInlineTipRow);
    [(RUITableViewRow *)v16 setDelegate:self];
    manageStorageTipController = self->_manageStorageTipController;
    if (!manageStorageTipController)
    {
      id v18 = objc_alloc(MEMORY[0x263F27FD8]);
      __int16 v19 = [(ICQUIManageStorageTipViewModel *)v15 request];
      uint64_t v20 = (AMSUIBubbleTipViewController *)[v18 initWithRequest:v19];
      __int16 v21 = self->_manageStorageTipController;
      self->_manageStorageTipController = v20;

      manageStorageTipController = self->_manageStorageTipController;
    }
    [v12 addChildViewController:manageStorageTipController];
    id v22 = [(AMSUIBubbleTipViewController *)self->_manageStorageTipController view];
    [(ICQUIInlineTipRow *)v16 setTipView:v22];

    [(AMSUIBubbleTipViewController *)self->_manageStorageTipController setDelegate:self];
  }
  else
  {
    id v23 = _ICQGetLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ICQUITipSpecifierProvider tipForManageStorageFromAttributes:rows:viewController:remoteUIDelegate:]();
    }

    uint64_t v16 = 0;
  }

  return v16;
}

- (Class)tableCellClassForTableViewRow:(id)a3
{
  return (Class)objc_opt_class();
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

- (ICQUIInlineTipViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (BOOL)hasDismissedTip
{
  return self->_hasDismissedTip;
}

- (void)setHasDismissedTip:(BOOL)a3
{
  self->_BOOL hasDismissedTip = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_anchorIdentifier, 0);
  objc_destroyWeak((id *)&self->_legacyRemoteUIDelegate);
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
  objc_storeStrong((id *)&self->_ruiFlowManager, 0);
  objc_storeStrong((id *)&self->_liftUIPresenter, 0);
  objc_storeStrong((id *)&self->_manageStorageTipController, 0);
  objc_storeStrong((id *)&self->_inlineTipController, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_fetchTip:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__ICQUITipSpecifierProvider__fetchTip___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[ICQUITipSpecifierProvider _fetchTip:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "%s - Error fetching storage summary: %@", (uint8_t *)&v2, 0x16u);
}

- (void)_tipArrowConfigurationIsEligibleForDisplay:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Unsupported arrow configuration tip object: %@", v2, v3, v4, v5, v6);
}

void __42__ICQUITipSpecifierProvider__tipDisplayed__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Display status call failed with error: %@", v2, v3, v4, v5, v6);
}

void __44__ICQUITipSpecifierProvider__dismissPressed__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Dismiss status call failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_openExternalLink:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Attempted to open external link that is nil.", v2, v3, v4, v5, v6);
}

- (void)_openRemoteUILink:forDataclasses:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Attempted to open RemoteUI link that is nil.", v2, v3, v4, v5, v6);
}

- (void)_openLiftUILink:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Attempted to open LiftUI link that is nil.", v2, v3, v4, v5, v6);
}

- (void)messageViewController:didSelectActionWithDialogResult:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Turn on apps request is not supported via external link", v2, v3, v4, v5, v6);
}

- (void)messageViewController:didSelectActionWithDialogResult:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Turn on apps request is not supported via LiftUI", v2, v3, v4, v5, v6);
}

- (void)messageViewController:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "AMSUIViewController Error %@", v2, v3, v4, v5, v6);
}

- (void)_launchLiftUIWithURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Unable to present LiftUI for url: %@", v2, v3, v4, v5, v6);
}

- (void)_launchLiftUIWithURL:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "LiftUI presentation is already in progress. Bailing.", v2, v3, v4, v5, v6);
}

- (void)_launchLegacyRemoteUIWithURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "legacyRemoteUIDelegate is not set. Bailing.", v2, v3, v4, v5, v6);
}

- (void)_launchUpgradeFlowWithAction:andURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Upgrade flow is already in progress. Bailing.", v2, v3, v4, v5, v6);
}

- (void)loadFailed:withError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "DelayedPushDelegate for ICQ Tip Loading failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)tipForManageStorageFromAttributes:rows:viewController:remoteUIDelegate:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_22C821000, v1, OS_LOG_TYPE_ERROR, "Incomplete parameters passed. Bailing! Attributes: %@ RUIDelegate: %@", v2, 0x16u);
}

@end