@interface PKDashboardPassViewController
- (BOOL)_isBackgrounded;
- (BOOL)_isDeactivated;
- (BOOL)_isForegroundActive;
- (BOOL)handleDeletePassWithUniqueID:(id)a3;
- (BOOL)isInvalidated;
- (PKDashboardAccountModulePresenter)accountModulePresenter;
- (PKDashboardPassFlowLayout)passFlowLayout;
- (PKDashboardPassViewController)initWithDataSource:(id)a3 presenters:(id)a4 layout:(id)a5;
- (PKDashboardPassViewController)initWithPass:(id)a3;
- (PKDashboardPassViewController)initWithPassGroupView:(id)a3 context:(id)a4 presentingViewController:(id)a5;
- (PKDashboardPaymentTransactionItemPresenter)transactionPresenter;
- (PKPass)frontmostPass;
- (double)_navBarButtonSpaceWidth;
- (id)_dashboardInfoButtonWithImage:(id)a3;
- (id)_navigationBarButtonForType:(unint64_t)a3 account:(id)a4;
- (id)_navigationBarButtonTypesForAppleCardPass:(id)a3 account:(id)a4;
- (id)_navigationBarButtonTypesForPeerPaymentPass:(id)a3;
- (id)_passcodeButtonTitle;
- (id)_shareNavigationBarButtonTypesForPass:(id)a3;
- (id)bigInfoButton;
- (id)doneButton;
- (id)leadingViewsForInterstitialController:(id)a3;
- (id)moreInfoButton;
- (id)navigationDashboardPassVC;
- (id)presentCardNumbersButtonForAccount:(id)a3;
- (id)searchButton;
- (id)trailingViewsForInterstitialController:(id)a3;
- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4;
- (void)_afterDataSourceContentLoadedUpdateFooterForPass:(id)a3;
- (void)_afterDataSourceContentLoadedUpdateNavigationItemsForPass:(id)a3;
- (void)_beginReportingIfNecessary;
- (void)_createFooter;
- (void)_displayAccountErrorIfNecessary;
- (void)_endReportingIfNecessary;
- (void)_handleUpdatedAccount:(id)a3 accountRemoved:(BOOL)a4;
- (void)_passcodeTapped:(id)a3;
- (void)_performActivationStateUpdate:(id)a3;
- (void)_setUpNavigationItemsAnimated:(BOOL)a3;
- (void)_updateDefaultPasscodeButtonSize;
- (void)_updateDigitalCarKeyAssertion;
- (void)_updateFingerDetection;
- (void)_updateFooterAnimated:(BOOL)a3;
- (void)_updateNavigationItemsWithAccount:(id)a3;
- (void)_updatePasscodeButtonTitle;
- (void)_updateShareablePassConfiguration;
- (void)_visibilityDidChange;
- (void)accountAdded:(id)a3;
- (void)accountChanged:(id)a3;
- (void)accountDidUpdate:(id)a3;
- (void)accountRemoved:(id)a3;
- (void)bindInterstitialController:(id)a3;
- (void)configureMoreMenuFactoryWithPass:(id)a3;
- (void)dealloc;
- (void)foregroundActiveArbiter:(id)a3 didUpdateDeactivationReasons:(unsigned int)a4;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)infoTapped:(id)a3;
- (void)invalidate;
- (void)loadView;
- (void)menuFactoryDidUpdateMenu:(id)a3;
- (void)moreMenuTriggered:(id)a3;
- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4;
- (void)passTilesItemPresenter:(id)a3 executeSEActionForPass:(id)a4 tile:(id)a5 withCompletion:(id)a6;
- (void)presentActivityDeletionConfirmationWithCompletion:(id)a3;
- (void)reloadMoreMenuItemsWithMenu:(id)a3;
- (void)reloadNavigationBarAnimated:(BOOL)a3;
- (void)reportEventForPassIfNecessary:(id)a3;
- (void)setFrontmostPass:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unbindInterstitialController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKDashboardPassViewController

- (PKDashboardPassViewController)initWithDataSource:(id)a3 presenters:(id)a4 layout:(id)a5
{
  return 0;
}

- (PKDashboardPassViewController)initWithPass:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F84740]);
  v6 = [MEMORY[0x1E4F84898] sharedInstance];
  v7 = (void *)[v5 initWithPassLibrary:v6];

  [v7 loadGroupsSynchronously];
  v8 = [v4 uniqueID];
  uint64_t v9 = [v7 groupIndexForPassUniqueID:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    uint64_t v11 = v9;
    v12 = [PKPassGroupView alloc];
    v13 = [v7 groupAtIndex:v11];
    v14 = [(PKPassGroupView *)v12 initWithGroup:v13 delegate:0 presentationState:3];

    [(PKPassGroupView *)v14 presentPassWithUniqueID:v8];
    v15 = [(PKDashboardPassViewController *)self initWithPassGroupView:v14 context:0 presentingViewController:0];
    v16 = v15;
    if (v15)
    {
      [(PKDashboardPassViewController *)v15 setFrontmostPass:v4];
      [(PKDashboardViewController *)v16 shouldPresentAllContent:1 animated:0];
    }
    self = v16;

    v10 = self;
  }

  return v10;
}

- (PKDashboardPassViewController)initWithPassGroupView:(id)a3 context:(id)a4 presentingViewController:(id)a5
{
  v68[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 group];
  v12 = [v11 passAtIndex:0];

  if (v12)
  {
    v13 = [[PKDashboardPassGroupItemPresenter alloc] initWithPassGroupView:v8];
    v14 = objc_alloc_init(PKDashboardPassTilesItemPresenter);
    uint64_t v15 = [v12 passType];
    if (v15 == 1)
    {
      id v61 = a4;
      v20 = [[PKDashboardPaymentTransactionItemPresenter alloc] initWithContext:0 detailViewStyle:0 avatarViewDelegate:v10];
      obj = objc_alloc_init(PKDashboardAccountModulePresenter);
      v62 = [[PKDashboardPaymentPassDataSource alloc] initWithGroupView:v8 context:v9];
      v67[0] = v13;
      v56 = [[PKDashboardPassMessagePresenter alloc] initWithPassGroupView:v8];
      v67[1] = v56;
      v67[2] = v14;
      v21 = [PKDashboardAuxiliaryPassInformationPresenter alloc];
      v55 = [v12 secureElementPass];
      v54 = [(PKDashboardAuxiliaryPassInformationPresenter *)v21 initWithPass:v55];
      v67[3] = v54;
      v22 = [PKDashboardPaymentProductsTransitPresenter alloc];
      id v53 = objc_alloc_init(MEMORY[0x1E4F84A88]);
      v52 = [(PKDashboardPaymentProductsTransitPresenter *)v22 initWithPassGroupView:v8 paymentDataProvider:v53];
      v67[4] = v52;
      v51 = objc_alloc_init(PKTransactionGroupItemPresenter);
      v67[5] = v51;
      v50 = [[PKCreditBalanceAndPaymentPresenter alloc] initWithViewController:v10];
      v67[6] = v50;
      v49 = objc_alloc_init(PKDashboardTextActionItemPresenter);
      v67[7] = v49;
      v48 = objc_alloc_init(PKPayLaterBalancePresenter);
      v67[8] = v48;
      v47 = objc_alloc_init(PKPayLaterFinancingPlanPresenter);
      v67[9] = v47;
      v46 = objc_alloc_init(PKPayLaterInstallmentPresenter);
      v67[10] = v46;
      v45 = objc_alloc_init(PKPayLaterFinancingPlanGroupPresenter);
      v67[11] = v45;
      id v60 = v10;
      v23 = objc_alloc_init(PKPayLaterEligibleSpendPresenter);
      v67[12] = v23;
      v24 = objc_alloc_init(PKDashboardBalancePresenter);
      v67[13] = v24;
      v57 = v14;
      v58 = v12;
      v25 = v13;
      v26 = objc_alloc_init(PKDashboardBankConnectPresenter);
      v67[14] = v26;
      v27 = self;
      v28 = objc_alloc_init(PKDashboardRewardsBalancePresenter);
      v67[15] = v28;
      v67[16] = v20;
      v17 = (PKDashboardPassMessagePresenter *)v20;
      id v29 = v9;
      v30 = objc_alloc_init(PKDashboardCenteredTextItemPresenter);
      v67[17] = v30;
      v67[18] = obj;
      v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:19];

      id v9 = v29;
      v16 = (PKDashboardBarcodePassDataSource *)v62;

      self = v27;
      v13 = v25;
      v14 = v57;
      v12 = v58;

      id v10 = v60;
      int v18 = 1;
    }
    else
    {
      if (v15)
      {
        v43 = 0;
        v16 = 0;
        v65 = 0;
        v19 = 0;
LABEL_15:

        goto LABEL_16;
      }
      id v61 = a4;
      v16 = [[PKDashboardBarcodePassDataSource alloc] initWithGroupView:v8 context:v9];
      v68[0] = v13;
      v17 = [[PKDashboardPassMessagePresenter alloc] initWithPassGroupView:v8];
      v68[1] = v17;
      v68[2] = v14;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
      v65 = obj = 0;
      int v18 = 0;
    }

    v19 = 0;
    if (v16 && v65)
    {
      v31 = objc_alloc_init(PKDashboardPassFlowLayout);
      v32 = v16;
      v33 = v31;
      v66.receiver = self;
      v66.super_class = (Class)PKDashboardPassViewController;
      v63 = v32;
      v34 = -[PKDashboardViewController initWithDataSource:presenters:layout:](&v66, sel_initWithDataSource_presenters_layout_);
      v35 = v34;
      if (v34)
      {
        v34->_lock._os_unfair_lock_opaque = 0;
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v36 = v59 = v13;
        dispatch_queue_t v37 = dispatch_queue_create("com.apple.passkit.dashboard.session", v36);
        queue = v35->_queue;
        v35->_queue = (OS_dispatch_queue *)v37;

        objc_storeStrong((id *)&v35->_passFlowLayout, v33);
        v39 = [[PKDashboardPaymentTransactionItemPresenter alloc] initWithContext:0 detailViewStyle:0 avatarViewDelegate:0];
        transactionPresenter = v35->_transactionPresenter;
        v35->_transactionPresenter = v39;

        objc_storeStrong((id *)&v35->_accountModulePresenter, obj);
        objc_storeStrong((id *)&v35->_context, v61);
        uint64_t v41 = [MEMORY[0x1E4F84270] sharedInstance];
        accountService = v35->_accountService;
        v35->_accountService = (PKAccountService *)v41;

        v13 = v59;
        [(PKAccountService *)v35->_accountService registerObserver:v35];
        [(PKDashboardPassTilesItemPresenter *)v14 setDelegate:v35];
        [(PKDashboardPassViewController *)v35 _setUpNavigationItemsAnimated:0];
        if (v18) {
          [(PKDashboardBarcodePassDataSource *)v63 setCustomDelegate:v35];
        }
      }
      self = v35;

      v19 = self;
      v16 = v63;
    }
    v43 = obj;
    goto LABEL_15;
  }
  v19 = 0;
LABEL_16:

  return v19;
}

- (void)_setUpNavigationItemsAnimated:(BOOL)a3
{
  id v4 = [(PKDashboardViewController *)self dataSource];
  id v5 = [v4 groupView];
  v6 = [v5 frontmostPassView];
  id v13 = [v6 pass];

  if (!self->_moreMenuFactory)
  {
    v7 = objc_alloc_init(PKDashboardMoreMenuFactory);
    moreMenuFactory = self->_moreMenuFactory;
    self->_moreMenuFactory = v7;

    [(PKDashboardMoreMenuFactory *)self->_moreMenuFactory setDelegate:self];
    [(PKDashboardPassViewController *)self configureMoreMenuFactoryWithPass:v13];
  }
  id v9 = [(PKDashboardPassViewController *)self navigationItem];
  [v9 setBackButtonDisplayMode:2];
  id v10 = [v13 localizedDescription];
  [v9 setBackButtonTitle:v10];

  [v9 setLargeTitleDisplayMode:2];
  if ([v13 passType] == 1 && objc_msgSend(v13, "associatedAccountFeatureIdentifier") == 2)
  {
    uint64_t v11 = [(PKDashboardViewController *)self dataSource];
    v12 = [v11 account];
  }
  else
  {
    v12 = 0;
  }
  [(PKDashboardPassViewController *)self _updateNavigationItemsWithAccount:v12];
  [(PKDashboardPassViewController *)self _afterDataSourceContentLoadedUpdateNavigationItemsForPass:v13];
}

- (id)navigationDashboardPassVC
{
  v2 = [(PKDashboardPassViewController *)self navigationController];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_updateNavigationItemsWithAccount:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKDashboardViewController *)self dataSource];
  v6 = [v5 groupView];
  v7 = [v6 frontmostPassView];
  id v8 = [v7 pass];

  id v9 = [v8 paymentPass];
  if (![v9 hasAssociatedPeerPaymentAccount]) {
    goto LABEL_3;
  }
  id v10 = [MEMORY[0x1E4F84E10] sharedService];
  uint64_t v11 = [v10 peerPaymentService];
  v12 = [v11 account];

  uint64_t v13 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();
  if (v13 != 1)
  {
LABEL_3:
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(PKDashboardPassViewController *)self configureMoreMenuFactoryWithPass:v8];
    [(PKDashboardMoreMenuFactory *)self->_moreMenuFactory setAccount:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      moreMenuFactory = self->_moreMenuFactory;
      id v16 = v5;
      v17 = [v16 familyCollection];
      [(PKDashboardMoreMenuFactory *)moreMenuFactory setFamilyCollection:v17];

      int v18 = self->_moreMenuFactory;
      v19 = [v16 peerPaymentAccount];
      [(PKDashboardMoreMenuFactory *)v18 setPeerPaymentAccount:v19];

      -[PKDashboardMoreMenuFactory setHomeKitHasHomeGuestAccessSchedule:](self->_moreMenuFactory, "setHomeKitHasHomeGuestAccessSchedule:", [v16 homeKitHasHomeGuestAccessSchedule]);
      v20 = self->_moreMenuFactory;
      v21 = [v16 homeKitHomeIdentifier];

      [(PKDashboardMoreMenuFactory *)v20 setHomeKitHomeIdentifier:v21];
    }
    v58 = v5;
    [(PKDashboardMoreMenuFactory *)self->_moreMenuFactory moreMenu];
    v57 = v22 = &unk_1EF2B8AF0;
    if (!v57 && ![(PKDashboardMoreMenuFactory *)self->_moreMenuFactory forceShowMoreMenuIcon]) {
      v22 = &unk_1EF2B8B08;
    }
    [v14 addObject:v22];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v59 = v8;
    v23 = [(PKDashboardPassViewController *)self _shareNavigationBarButtonTypesForPass:v8];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v72 objects:v85 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v73 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v72 + 1) + 8 * i);
          [v14 addObject:&unk_1EF2B8B20];
          [v14 addObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v72 objects:v85 count:16];
      }
      while (v25);
    }

    if ([v9 isAppleCardPass])
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v29 = [(PKDashboardPassViewController *)self _navigationBarButtonTypesForAppleCardPass:v9 account:v4];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v68 objects:v84 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v69;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v69 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v68 + 1) + 8 * j);
            [v14 addObject:&unk_1EF2B8B20];
            [v14 addObject:v34];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v68 objects:v84 count:16];
        }
        while (v31);
      }
    }
    if ([v9 isPeerPaymentPass])
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v35 = [(PKDashboardPassViewController *)self _navigationBarButtonTypesForPeerPaymentPass:v9];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v64 objects:v83 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v65;
        do
        {
          for (uint64_t k = 0; k != v37; ++k)
          {
            if (*(void *)v65 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v64 + 1) + 8 * k);
            [v14 addObject:&unk_1EF2B8B20];
            [v14 addObject:v40];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v64 objects:v83 count:16];
        }
        while (v37);
      }
    }
    if ((PKEqualObjects() & 1) == 0)
    {
      uint64_t v41 = (NSArray *)[v14 copy];
      navBarButtonTypes = self->_navBarButtonTypes;
      self->_navBarButtonTypes = v41;

      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      v44 = self->_navBarButtonTypes;
      uint64_t v45 = [(NSArray *)v44 countByEnumeratingWithState:&v60 objects:v82 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v61;
        do
        {
          for (uint64_t m = 0; m != v46; ++m)
          {
            if (*(void *)v61 != v47) {
              objc_enumerationMutation(v44);
            }
            v49 = -[PKDashboardPassViewController _navigationBarButtonForType:account:](self, "_navigationBarButtonForType:account:", [*(id *)(*((void *)&v60 + 1) + 8 * m) integerValue], v4);
            [v43 safelyAddObject:v49];
          }
          uint64_t v46 = [(NSArray *)v44 countByEnumeratingWithState:&v60 objects:v82 count:16];
        }
        while (v46);
      }

      v50 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v51 = [v43 count];
        v52 = [v59 uniqueID];
        id v53 = [v4 accountIdentifier];
        *(_DWORD *)buf = 134218498;
        uint64_t v77 = v51;
        __int16 v78 = 2112;
        v79 = v52;
        __int16 v80 = 2112;
        v81 = v53;
        _os_log_impl(&dword_19F450000, v50, OS_LOG_TYPE_DEFAULT, "Number of navigation items %ld for pass uniqueID %@, accountID %@", buf, 0x20u);
      }
      v54 = [(PKDashboardPassViewController *)self navigationItem];
      [v54 setRightBarButtonItems:v43 animated:self->_activeInterstitialController == 0];

      if (self->_activeInterstitialController)
      {
        v55 = [(PKDashboardPassViewController *)self navigationController];
        v56 = [v55 navigationBar];
        [v56 layoutIfNeeded];

        [(PKPGSVTransitionInterstitialController *)self->_activeInterstitialController setNeedsUpdateForProvider:self];
      }
    }
    [(PKDashboardPassViewController *)self reloadMoreMenuItemsWithMenu:v57];

    id v5 = v58;
    id v8 = v59;
  }
}

- (void)_displayAccountErrorIfNecessary
{
  if (self->_visibility == 2)
  {
    id v3 = [(PKDashboardViewController *)self dataSource];
    id v4 = [v3 groupView];
    id v5 = [v4 frontmostPassView];
    v6 = [v5 pass];

    if ([v6 passType] == 1)
    {
      id v7 = v3;
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __64__PKDashboardPassViewController__displayAccountErrorIfNecessary__block_invoke;
      v9[3] = &unk_1E59CB010;
      objc_copyWeak(&v11, &location);
      id v8 = v7;
      id v10 = v8;
      [v8 executeAfterContentIsLoaded:v9];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __64__PKDashboardPassViewController__displayAccountErrorIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) account];
    id v3 = [WeakRetained navigationDashboardPassVC];
    PKPayLaterHandleFrontOfPassAlertsWithAccount(v2, v3);
  }
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v3 & 1) == 0) {
    [(PKDashboardPassViewController *)self invalidate];
  }
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  id v4 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v4 unregisterObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PKDashboardPassViewController;
  [(PKDashboardViewController *)&v5 dealloc];
}

- (void)invalidate
{
  char v2 = 0;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_invalidated, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    p_locuint64_t k = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    objc_super v5 = self->_sessionHandles;
    sessionHandles = self->_sessionHandles;
    self->_sessionHandles = 0;

    os_unfair_lock_unlock(p_lock);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v11++), "invalidateSession", (void)v18);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    fingerDetectionOperation = self->_fingerDetectionOperation;
    if (fingerDetectionOperation)
    {
      [(BKPresenceDetectOperation *)fingerDetectionOperation setDelegate:0];
      [(BKPresenceDetectOperation *)self->_fingerDetectionOperation cancel];
      uint64_t v13 = self->_fingerDetectionOperation;
      self->_fingerDetectionOperation = 0;
    }
    fingerTimer = self->_fingerTimer;
    if (fingerTimer)
    {
      dispatch_source_cancel(fingerTimer);
      uint64_t v15 = self->_fingerTimer;
      self->_fingerTimer = 0;
    }
    id dckAssertion = self->_dckAssertion;
    if (dckAssertion)
    {
      [dckAssertion performSelector:sel_invalidate];
      id v17 = self->_dckAssertion;
      self->_id dckAssertion = 0;
    }
  }
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)PKDashboardPassViewController;
  [(PKDashboardPassViewController *)&v8 loadView];
  unsigned __int8 v3 = +[PKUIForegroundActiveArbiter sharedInstance];
  id v4 = v3;
  p_foregroundActiveState = &self->_foregroundActiveState;
  if (v3) {
    $77BFE790A1370D46B4241309C9753022 *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)[v3 registerObserver:self];
  }
  else {
    $77BFE790A1370D46B4241309C9753022 *p_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)257;
  }
  if (self->_footerVisible) {
    [(PKDashboardPassViewController *)self _createFooter];
  }
  v6 = [(PKDashboardPassViewController *)self view];
  id v7 = +[PKDashboardViewController backgroundColor];
  [v6 setBackgroundColor:v7];
}

- (id)bigInfoButton
{
  unsigned __int8 v3 = PKUIBigInfoButtonImageWithDefaultConfiguration();
  id v4 = [(PKDashboardPassViewController *)self _dashboardInfoButtonWithImage:v3];

  return v4;
}

- (id)moreInfoButton
{
  unsigned __int8 v3 = PKUIInfoButtonImageWithDefaultConfiguration();
  id v4 = [(PKDashboardPassViewController *)self _dashboardInfoButtonWithImage:v3];

  return v4;
}

- (id)_dashboardInfoButtonWithImage:(id)a3
{
  unsigned __int8 v3 = (void *)MEMORY[0x1E4FB14D8];
  id v4 = a3;
  objc_super v5 = [v4 configuration];
  v6 = [MEMORY[0x1E4FB1618] labelColor];
  id v7 = objc_msgSend(v3, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v4, v5, v6);

  objc_super v8 = +[PKHittableDashboardButton buttonWithConfiguration:v7 primaryAction:0];
  [v8 setConfigurationUpdateHandler:&__block_literal_global_34];
  [v8 setShowsLargeContentViewer:1];
  uint64_t v9 = PKLocalizedString(&cfstr_More.isa);
  [v8 setLargeContentTitle:v9];

  [v8 setAccessibilityIdentifier:*MEMORY[0x1E4F856F8]];
  [v8 setLargeContentImage:v4];

  return v8;
}

uint64_t __63__PKDashboardPassViewController__dashboardInfoButtonWithImage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (void)infoTapped:(id)a3
{
  id v3 = [(PKDashboardPassViewController *)self navigationDashboardPassVC];
  [v3 presentPassDetailsAnimated:1 action:0];
}

- (void)moreMenuTriggered:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(PKDashboardViewController *)self dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(PKDashboardViewController *)self dataSource];
    moreMenuFactory = self->_moreMenuFactory;
    objc_super v8 = [v6 bankConnectLinkedAccountData];
    uint64_t v9 = [v8 account];
    [(PKDashboardMoreMenuFactory *)moreMenuFactory setBankConnectAccount:v9];
  }
  [(PKDashboardPassViewController *)self menuFactoryDidUpdateMenu:self->_moreMenuFactory];
  uint64_t v10 = [(PKDashboardPassViewController *)self navigationDashboardPassVC];
  uint64_t v11 = *MEMORY[0x1E4F86120];
  v14[0] = *MEMORY[0x1E4F86308];
  v14[1] = v11;
  uint64_t v12 = *MEMORY[0x1E4F86060];
  v15[0] = *MEMORY[0x1E4F86380];
  v15[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v10 reportEventForPassIfNecessary:v13];
}

- (id)searchButton
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass"];
  id v4 = (void *)MEMORY[0x1E4FB14D8];
  objc_super v5 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  v6 = [MEMORY[0x1E4FB1618] labelColor];
  id v7 = objc_msgSend(v4, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v3, v5, v6);

  objc_initWeak(&location, self);
  objc_super v8 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __45__PKDashboardPassViewController_searchButton__block_invoke;
  id v16 = &unk_1E59CBEE0;
  objc_copyWeak(&v17, &location);
  uint64_t v9 = [v8 actionWithHandler:&v13];
  uint64_t v10 = +[PKHittableDashboardButton buttonWithConfiguration:primaryAction:](PKHittableDashboardButton, "buttonWithConfiguration:primaryAction:", v7, v9, v13, v14, v15, v16);
  [v10 setConfigurationUpdateHandler:&__block_literal_global_117];
  uint64_t v11 = PKLocalizedPaymentString(&cfstr_DashboardSearc.isa);
  [v10 setAccessibilityLabel:v11];
  [v10 setShowsLargeContentViewer:1];
  [v10 setLargeContentTitle:v11];
  [v10 setLargeContentImage:v3];
  [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F85970]];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v10;
}

void __45__PKDashboardPassViewController_searchButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained navigationDashboardPassVC];
  [v1 presentSearch];
}

uint64_t __45__PKDashboardPassViewController_searchButton__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (id)presentCardNumbersButtonForAccount:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"creditcard.and.123"];
  v6 = (void *)MEMORY[0x1E4FB14D8];
  id v7 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  objc_super v8 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v9 = objc_msgSend(v6, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v5, v7, v8);

  objc_initWeak(&location, self);
  uint64_t v10 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __68__PKDashboardPassViewController_presentCardNumbersButtonForAccount___block_invoke;
  long long v18 = &unk_1E59CBEE0;
  objc_copyWeak(&v19, &location);
  uint64_t v11 = [v10 actionWithHandler:&v15];
  uint64_t v12 = +[PKHittableDashboardButton buttonWithConfiguration:primaryAction:](PKHittableDashboardButton, "buttonWithConfiguration:primaryAction:", v9, v11, v15, v16, v17, v18);
  [v12 setConfigurationUpdateHandler:&__block_literal_global_125];
  [v4 feature];
  uint64_t v13 = PKLocalizedFeatureString();
  [v12 setAccessibilityLabel:v13];
  [v12 setAccessibilityIdentifier:*MEMORY[0x1E4F85368]];
  [v12 setShowsLargeContentViewer:1];
  [v12 setLargeContentTitle:v13];
  [v12 setLargeContentImage:v5];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v12;
}

void __68__PKDashboardPassViewController_presentCardNumbersButtonForAccount___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained navigationDashboardPassVC];
    [v3 presentCardNumbers];
    uint64_t v4 = *MEMORY[0x1E4F86380];
    uint64_t v5 = *MEMORY[0x1E4F86120];
    v8[0] = *MEMORY[0x1E4F86308];
    v8[1] = v5;
    uint64_t v6 = *MEMORY[0x1E4F86168];
    v9[0] = v4;
    v9[1] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    [v3 reportEventForPassIfNecessary:v7];
  }
}

uint64_t __68__PKDashboardPassViewController_presentCardNumbersButtonForAccount___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (double)_navBarButtonSpaceWidth
{
  unint64_t v2 = PKUIGetMinScreenType();
  double result = 24.0;
  if (v2 < 3) {
    return 8.0;
  }
  return result;
}

- (id)doneButton
{
  id v3 = PKLocalizedString(&cfstr_Done.isa);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB14D8], "pkui_createPlainMinimalButtonConfiguration");
  [v4 setTitle:v3];
  uint64_t v5 = [MEMORY[0x1E4FB1618] labelColor];
  [v4 setBaseForegroundColor:v5];

  objc_initWeak(&location, self);
  uint64_t v6 = (void *)MEMORY[0x1E4FB14D0];
  id v7 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __43__PKDashboardPassViewController_doneButton__block_invoke;
  uint64_t v14 = &unk_1E59CBEE0;
  objc_copyWeak(&v15, &location);
  objc_super v8 = [v7 actionWithHandler:&v11];
  uint64_t v9 = objc_msgSend(v6, "buttonWithConfiguration:primaryAction:", v4, v8, v11, v12, v13, v14);

  [v9 setRole:1];
  objc_msgSend(v9, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
  [v9 sizeToFit];
  [v9 setShowsLargeContentViewer:1];
  [v9 setLargeContentTitle:v3];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

void __43__PKDashboardPassViewController_doneButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained navigationController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)configureMoreMenuFactoryWithPass:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(PKDashboardPassViewController *)self navigationDashboardPassVC];
  if (v4) {
    [(PKDashboardMoreMenuFactory *)self->_moreMenuFactory setNavigationDashboardPassVC:v4];
  }
  [(PKDashboardMoreMenuFactory *)self->_moreMenuFactory setPass:v5];
}

- (void)reloadMoreMenuItemsWithMenu:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(PKDashboardPassViewController *)self navigationItem];
  id v5 = [v4 rightBarButtonItem];
  uint64_t v6 = [v5 customView];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v9)
    {
      objc_msgSend(v6, "setMenu:");
      [v6 setShowsMenuAsPrimaryAction:1];
      id v7 = &selRef_moreMenuTriggered_;
      uint64_t v8 = 0x4000;
    }
    else
    {
      id v7 = &selRef_infoTapped_;
      uint64_t v8 = 0x2000;
    }
    [v6 addTarget:self action:*v7 forControlEvents:v8];
  }
}

- (id)_navigationBarButtonForType:(unint64_t)a3 account:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  switch(a3)
  {
    case 1uLL:
      id v7 = [(PKDashboardPassViewController *)self bigInfoButton];
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v7];
      goto LABEL_11;
    case 2uLL:
      id v7 = [(PKDashboardPassViewController *)self moreInfoButton];
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v7];
      goto LABEL_11;
    case 3uLL:
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:6 target:0 action:0];
      [(PKDashboardPassViewController *)self _navBarButtonSpaceWidth];
      objc_msgSend(v9, "setWidth:");
      break;
    case 4uLL:
      id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
      uint64_t v10 = (void *)MEMORY[0x1E4FB14D8];
      uint64_t v11 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
      uint64_t v12 = [MEMORY[0x1E4FB1618] labelColor];
      uint64_t v13 = objc_msgSend(v10, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v7, v11, v12);

      uint64_t v14 = (void *)MEMORY[0x1E4FB13F0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke;
      v27[3] = &unk_1E59CBEE0;
      id v15 = &v28;
      objc_copyWeak(&v28, &location);
      uint64_t v16 = [v14 actionWithHandler:v27];
      id v17 = +[PKHittableDashboardButton buttonWithConfiguration:v13 primaryAction:v16];
      [v17 setConfigurationUpdateHandler:&__block_literal_global_142];
      long long v18 = PKLocalizedPaymentString(&cfstr_DashboardShare.isa);
      [v17 setAccessibilityLabel:v18];
      [v17 setAccessibilityIdentifier:*MEMORY[0x1E4F859E0]];
      [v17 setShowsLargeContentViewer:1];
      [v17 setLargeContentTitle:v18];
      [v17 setLargeContentImage:v7];
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v17];
      goto LABEL_6;
    case 5uLL:
      id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.checkmark"];
      id v19 = (void *)MEMORY[0x1E4FB14D8];
      long long v20 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
      long long v21 = [MEMORY[0x1E4FB1618] labelColor];
      uint64_t v13 = objc_msgSend(v19, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v7, v20, v21);

      v22 = (void *)MEMORY[0x1E4FB13F0];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke_3;
      v25[3] = &unk_1E59CBEE0;
      id v15 = &v26;
      objc_copyWeak(&v26, &location);
      uint64_t v16 = [v22 actionWithHandler:v25];
      id v17 = +[PKHittableDashboardButton buttonWithConfiguration:v13 primaryAction:v16];
      [v17 setConfigurationUpdateHandler:&__block_literal_global_150];
      long long v18 = PKLocalizedPaymentString(&cfstr_DashboardViewS.isa);
      [v17 setAccessibilityLabel:v18];
      [v17 setAccessibilityIdentifier:*MEMORY[0x1E4F85808]];
      [v17 setShowsLargeContentViewer:1];
      [v17 setLargeContentTitle:v18];
      [v17 setLargeContentImage:v7];
      [v17 sizeToFit];
      [v17 layoutIfNeeded];
      uint64_t v23 = [[PKPGSVTransitionInterstitialAlignmentView alloc] initWithView:v17 alignmentRectInsetsAdjustmentProvider:&__block_literal_global_157];
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v23];

LABEL_6:
      objc_destroyWeak(v15);

      goto LABEL_12;
    case 6uLL:
      id v7 = [(PKDashboardPassViewController *)self searchButton];
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v7];
      goto LABEL_11;
    case 7uLL:
      id v7 = [(PKDashboardPassViewController *)self presentCardNumbersButtonForAccount:v6];
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v7];
LABEL_11:
      id v9 = (void *)v8;
LABEL_12:

      break;
    default:
      id v9 = 0;
      break;
  }
  objc_destroyWeak(&location);

  return v9;
}

void __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained navigationDashboardPassVC];
  [v1 presentShareFlow];
}

uint64_t __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

void __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained navigationController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 presentSharesList];
  }
}

uint64_t __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

double __69__PKDashboardPassViewController__navigationBarButtonForType_account___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 imageView];
  if (v3)
  {
    [v2 bounds];
    double v5 = v4;
    [v3 bounds];
    objc_msgSend(v2, "convertRect:fromView:", v3);
    if (v6 >= v5) {
      double v7 = 0.0;
    }
    else {
      double v7 = v6 - v5;
    }
  }
  else
  {
    double v7 = *MEMORY[0x1E4FB2848];
  }

  return v7;
}

- (id)_shareNavigationBarButtonTypesForPass:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v9 = 0;
    goto LABEL_19;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F84A88]);
  if ([v3 passType] == 1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = v3;
    double v7 = [v6 devicePrimaryPaymentApplication];
    uint64_t v8 = [v7 state];

    if (v8 == 7)
    {

LABEL_17:
      id v9 = 0;
      goto LABEL_18;
    }
    __int16 v12 = 0;
    uint64_t v10 = [v6 uniqueID];
    [v5 sharingCapabilitiesForPassIdentifier:v10 outHasShares:(char *)&v12 + 1 outHasShareableEntitlements:&v12];

    if ([v6 supportsFeatureForCurrentDevice:1] && (_BYTE)v12) {
      [v4 addObject:&unk_1EF2B8B38];
    }
    if (HIBYTE(v12)) {
      [v4 addObject:&unk_1EF2B8B50];
    }
  }
  else if (PKBarcodePassSharingEnabled())
  {
    [v4 addObject:&unk_1EF2B8B38];
  }
  if (![v4 count]) {
    goto LABEL_17;
  }
  id v9 = (void *)[v4 copy];
LABEL_18:

LABEL_19:

  return v9;
}

- (id)_navigationBarButtonTypesForAppleCardPass:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 isAppleCardPass])
  {
    uint64_t v14 = 0;
    goto LABEL_19;
  }
  double v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [v5 associatedAccountServiceAccountIdentifier];
  id v9 = [v6 accountIdentifier];
  id v10 = v8;
  id v11 = v9;
  __int16 v12 = v11;
  if (v10 == v11)
  {
  }
  else
  {
    if (!v10 || !v11)
    {

      int v13 = 0;
      goto LABEL_11;
    }
    int v13 = [v10 isEqualToString:v11];

    if (!v13) {
      goto LABEL_11;
    }
  }
  int v13 = +[PKCreditAccountController shouldShowCardNumbersWithAccount:v6 andPass:v5];
LABEL_11:

  id v15 = [MEMORY[0x1E4F84898] sharedInstance];
  uint64_t v16 = [v5 uniqueID];
  int v17 = [v15 supportsSearchForPassUniqueID:v16];

  if (v13) {
    [v7 addObject:&unk_1EF2B8B68];
  }
  if (v17) {
    [v7 addObject:&unk_1EF2B8B80];
  }
  if ([v7 count]) {
    uint64_t v14 = (void *)[v7 copy];
  }
  else {
    uint64_t v14 = 0;
  }

LABEL_19:

  return v14;
}

- (id)_navigationBarButtonTypesForPeerPaymentPass:(id)a3
{
  id v3 = a3;
  if ([v3 isPeerPaymentPass])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [MEMORY[0x1E4F84898] sharedInstance];
    id v6 = [v3 uniqueID];
    int v7 = [v5 supportsSearchForPassUniqueID:v6];

    if (v7) {
      [v4 addObject:&unk_1EF2B8B80];
    }
    if ([v4 count]) {
      uint64_t v8 = (void *)[v4 copy];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDashboardPassViewController;
  [(PKDashboardPassViewController *)&v5 viewWillAppear:a3];
  self->_visibility = 1;
  [(PKDashboardPassViewController *)self _visibilityDidChange];
  [MEMORY[0x1E4F88108] currentStateForPolicy:0];
  id v4 = [(PKDashboardPassViewController *)self navigationDashboardPassVC];
  if (v4) {
    [(PKDashboardMoreMenuFactory *)self->_moreMenuFactory setNavigationDashboardPassVC:v4];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardPassViewController;
  [(PKDashboardPassViewController *)&v9 viewDidAppear:a3];
  self->_visibility = 2;
  [(PKDashboardPassViewController *)self _visibilityDidChange];
  id v4 = [(PKDashboardPassViewController *)self collectionView];
  [v4 flashScrollIndicators];

  uint64_t v10 = *MEMORY[0x1E4F86308];
  v11[0] = *MEMORY[0x1E4F864A0];
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [(PKDashboardPassViewController *)self reportEventForPassIfNecessary:v5];

  id v6 = [(PKDashboardPassViewController *)self view];
  int v7 = [v6 window];
  uint64_t v8 = [v7 windowScene];

  [v8 setActivityItemsConfigurationSource:self->_shareablePassProvider];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKDashboardPassViewController;
  [(PKDashboardPassViewController *)&v4 viewWillDisappear:a3];
  self->_visibility = 3;
  [(PKDashboardPassViewController *)self _visibilityDidChange];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F86308];
  v8[0] = *MEMORY[0x1E4F864A8];
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(PKDashboardPassViewController *)self reportEventForPassIfNecessary:v5];

  v6.receiver = self;
  v6.super_class = (Class)PKDashboardPassViewController;
  [(PKDashboardPassViewController *)&v6 viewDidDisappear:v3];
  self->_visibility = 0;
  [(PKDashboardPassViewController *)self _visibilityDidChange];
}

- (void)reportEventForPassIfNecessary:(id)a3
{
  id v17 = a3;
  objc_super v4 = [(PKPass *)self->_frontmostPass secureElementPass];
  int v5 = [v4 isIdentityPass];

  if (v5)
  {
    objc_super v6 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_frontmostPass];
    if (v17)
    {
      if (self->_frontmostPass && v6 != 0)
      {
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
        [v8 setValue:*MEMORY[0x1E4F867D8] forKey:*MEMORY[0x1E4F86730]];
        [MEMORY[0x1E4F843E0] updateIdentityEventToReportDashboardAnalytics:v8 forPass:self->_frontmostPass];
        objc_super v9 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v10 = (void *)[v8 copy];
        [v9 subject:v6 sendEvent:v10];
      }
    }
  }
  if ([(PKPass *)self->_frontmostPass passType] == PKPassTypeSecureElement)
  {
    id v11 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_frontmostPass];
    if (v17 && v11)
    {
      __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
      [v12 setObject:*MEMORY[0x1E4F86750] forKey:*MEMORY[0x1E4F86730]];
      [v12 setObject:*MEMORY[0x1E4F86888] forKey:*MEMORY[0x1E4F867D0]];
      if ([(PKPass *)self->_frontmostPass isPeerPaymentPass]) {
        [v12 setObject:*MEMORY[0x1E4F869F0] forKey:*MEMORY[0x1E4F864C8]];
      }
      int v13 = (void *)MEMORY[0x1E4F843E0];
      uint64_t v14 = (void *)[v12 copy];
      [v13 subject:v11 sendEvent:v14];
    }
  }
  frontmostPass = self->_frontmostPass;
  if (frontmostPass && [(PKPass *)frontmostPass passType] == PKPassTypeSecureElement)
  {
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    PKSetLastViewedFrontOfCardDate();
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PKDashboardPassViewController;
  [(PKDashboardPassViewController *)&v4 viewSafeAreaInsetsDidChange];
  BOOL v3 = [(PKDashboardPassViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardPassViewController;
  id v4 = a3;
  [(PKDashboardViewController *)&v12 traitCollectionDidChange:v4];
  int v5 = [(PKDashboardPassViewController *)self traitCollection];
  int v6 = [v4 hasDifferentColorAppearanceComparedToTraitCollection:v5];

  if (v6)
  {
    uint64_t v7 = [(PKDashboardViewController *)self dataSource];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v9 = [(PKDashboardViewController *)self dataSource];
      [v9 reloadMessages];
      [v9 reloadSecondaryMessages];
    }
  }
  if (self->_footerVisible)
  {
    passcodeButton = self->_passcodeButton;
    id v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E4FB2798], 18.0));
    [(UIButton *)passcodeButton pkui_updateConfigurationWithFont:v11];

    [(PKDashboardPassViewController *)self _updateDefaultPasscodeButtonSize];
  }
}

- (void)viewWillLayoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)PKDashboardPassViewController;
  [(PKDashboardPassViewController *)&v33 viewWillLayoutSubviews];
  BOOL v3 = [(PKDashboardPassViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  [v3 bounds];
  double x = v6;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  double v11 = *MEMORY[0x1E4FB2848];
  double v12 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v14 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (self->_footerBackground)
  {
    double height = self->_defaultPasscodeButtonSize.height;
    double v29 = fmin(self->_defaultPasscodeButtonSize.width, v8 + -24.0);
    double v30 = *MEMORY[0x1E4FB2848];
    remainder.origin.double x = v6;
    remainder.origin.double y = v7;
    remainder.size.double width = v8;
    remainder.size.double height = v9;
    double v16 = height + 12.0 + 12.0;
    double v17 = v5 + v16;
    if (self->_footerVisible)
    {
      CGRectDivide(*(CGRect *)&v6, &slice, &remainder, v5 + v16, CGRectMaxYEdge);
      double x = slice.origin.x;
      double y = slice.origin.y;
      double width = slice.size.width;
      double v17 = slice.size.height;
    }
    else
    {
      double y = CGRectGetMaxY(*(CGRect *)&v6);
      double width = remainder.size.width;
      slice.origin.double x = x;
      slice.origin.double y = y;
      slice.size.double width = remainder.size.width;
      slice.size.double height = v5 + v16;
    }
    -[_PKVisibilityBackdropView setFrame:](self->_footerBackground, "setFrame:", x, y, width, v17, *(void *)&v29);
    [(_PKVisibilityBackdropView *)self->_footerBackground layoutIfNeeded];
    if (self->_footerVisible) {
      double v14 = height + 12.0 + 12.0;
    }
    [(_PKVisibilityBackdropView *)self->_footerBackground bounds];
    CGRect remainder = v34;
    CGRectDivide(v34, &remainder, &slice, v5, CGRectMaxYEdge);
    slice.origin.double x = slice.origin.x + 12.0;
    slice.origin.double y = slice.origin.y + 12.0;
    slice.size.double width = slice.size.width + -24.0;
    slice.size.double height = slice.size.height + -24.0;
    passcodeButton = self->_passcodeButton;
    PKSizeAlignedInRect();
    -[UIButton setFrame:](passcodeButton, "setFrame:");
    double v11 = v30;
  }
  long long v21 = [(PKDashboardPassViewController *)self collectionView];
  [v21 contentInset];
  if (v12 != v25 || v11 != v22 || v13 != v24 || v14 != v23) {
    objc_msgSend(v21, "setContentInset:", v11, v12, v14, v13);
  }
}

- (void)setFrontmostPass:(id)a3
{
  double v5 = (PKPass *)a3;
  p_frontmostPass = (id *)&self->_frontmostPass;
  if (self->_frontmostPass != v5)
  {
    double v11 = v5;
    objc_storeStrong((id *)&self->_frontmostPass, a3);
    if (*p_frontmostPass && [*p_frontmostPass passType] == 1) {
      id v7 = *p_frontmostPass;
    }
    else {
      id v7 = 0;
    }
    objc_storeStrong((id *)&self->_frontmostPaymentPass, v7);
    [(PKDashboardPassViewController *)self _updateDigitalCarKeyAssertion];
    [(PKDashboardPassViewController *)self _updateFingerDetection];
    [(PKDashboardPassViewController *)self _updateFooterAnimated:PKViewVisibilityStateIsVisible()];
    [(PKDashboardPassViewController *)self configureMoreMenuFactoryWithPass:*p_frontmostPass];
    double v8 = [(PKDashboardMoreMenuFactory *)self->_moreMenuFactory moreMenu];
    [(PKDashboardPassViewController *)self reloadMoreMenuItemsWithMenu:v8];
    [(PKDashboardPassViewController *)self _afterDataSourceContentLoadedUpdateNavigationItemsForPass:*p_frontmostPass];
    [(PKDashboardPassViewController *)self _afterDataSourceContentLoadedUpdateFooterForPass:*p_frontmostPass];
    if (v11)
    {
      if (!self->_shareablePassProvider && ![*p_frontmostPass passType])
      {
        CGFloat v9 = objc_alloc_init(PKBarcodePassBoopProvider);
        shareablePassProvider = self->_shareablePassProvider;
        self->_shareablePassProvider = (PKAirDropBoopPassProvider *)v9;
      }
      [(PKDashboardPassViewController *)self _updateShareablePassConfiguration];
    }

    double v5 = v11;
  }
}

- (void)_updateShareablePassConfiguration
{
  id v7 = [(PKDashboardViewController *)self dataSource];
  BOOL v3 = [v7 groupView];
  double v4 = [v3 frontmostPassView];

  shareablePassProvider = self->_shareablePassProvider;
  CGFloat v6 = [v4 pass];
  [(PKAirDropBoopPassProvider *)shareablePassProvider setPass:v6 passView:v4];
}

- (void)_afterDataSourceContentLoadedUpdateNavigationItemsForPass:(id)a3
{
  id v4 = a3;
  if ([v4 passType] == 1)
  {
    double v5 = [(PKDashboardViewController *)self dataSource];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v5);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __91__PKDashboardPassViewController__afterDataSourceContentLoadedUpdateNavigationItemsForPass___block_invoke;
    v6[3] = &unk_1E59CD768;
    objc_copyWeak(&v8, &location);
    objc_copyWeak(&v9, &from);
    id v7 = v4;
    [v5 executeAfterContentIsLoaded:v6];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __91__PKDashboardPassViewController__afterDataSourceContentLoadedUpdateNavigationItemsForPass___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v2 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && v2)
  {
    BOOL v3 = [v2 account];
    if (v3)
    {
      id v4 = WeakRetained;
      double v5 = v3;
    }
    else
    {
      CGFloat v6 = [v2 peerPaymentAccount];

      if (!v6 && ![a1[4] isHomeKeyPass]) {
        goto LABEL_9;
      }
      id v4 = WeakRetained;
      double v5 = 0;
    }
    [v4 _updateNavigationItemsWithAccount:v5];
LABEL_9:
  }
}

- (void)_afterDataSourceContentLoadedUpdateFooterForPass:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(PKDashboardViewController *)self dataSource];
    objc_initWeak(&location, self);
    CGFloat v6 = [(PKDashboardViewController *)self dataSource];
    objc_initWeak(&from, v6);

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__PKDashboardPassViewController__afterDataSourceContentLoadedUpdateFooterForPass___block_invoke;
    v7[3] = &unk_1E59CD768;
    objc_copyWeak(&v9, &location);
    objc_copyWeak(&v10, &from);
    id v8 = v4;
    [v5 executeAfterContentIsLoaded:v7];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __82__PKDashboardPassViewController__afterDataSourceContentLoadedUpdateFooterForPass___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v2)
  {
    BOOL v3 = [WeakRetained delegate];
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v3 dashboardContentForPassLoaded:*(void *)(a1 + 32)];
    }
  }
}

- (BOOL)isInvalidated
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)_visibilityDidChange
{
  [(PKDashboardPassViewController *)self _updateFingerDetection];
  [(PKDashboardPassViewController *)self _updateDigitalCarKeyAssertion];
  [(PKDashboardPassViewController *)self _updateFooterAnimated:1];
  [(PKDashboardPassViewController *)self _displayAccountErrorIfNecessary];
  id v3 = [(PKDashboardViewController *)self dataSource];
  if (objc_opt_respondsToSelector()) {
    [v3 visibilityDidChangeToState:self->_visibility];
  }
}

- (void)_updateDigitalCarKeyAssertion
{
  if ((PKViewVisibilityStateIsVisible() & 1) != 0
    && [(PKDashboardPassViewController *)self _isForegroundActive]
    && !self->_dckAssertion)
  {
    id v3 = [(PKPaymentPass *)self->_frontmostPaymentPass paymentApplications];
    id v4 = objc_msgSend(v3, "pk_anyObjectPassingTest:", &__block_literal_global_195);
    double v5 = [v4 subcredentials];
    CGFloat v6 = [v5 anyObject];

    if (v6)
    {
      if ([(PKPaymentPass *)self->_frontmostPaymentPass isCarKeyPass])
      {
        id v7 = (void *)PKGetClassNFDigitalCarKeySession();
        id v8 = [v6 identifier];
        uint64_t v20 = 0;
        id v9 = (id *)&v20;
        uint64_t v10 = [v7 requestAssertionForKeyID:v8 options:0 outError:&v20];
LABEL_13:
        double v14 = (void *)v10;
        id v15 = *v9;
        id dckAssertion = self->_dckAssertion;
        self->_id dckAssertion = v14;

        if (!self->_dckAssertion && v15)
        {
          double v17 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long v18 = 0;
            _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Failed to acquire DCK key assertion", v18, 2u);
          }
        }
        goto LABEL_19;
      }
      if ([(PKPaymentPass *)self->_frontmostPaymentPass isHomeKeyPass])
      {
        double v13 = (void *)PKGetClassNFUnifiedAccessSession();
        id v8 = [v6 identifier];
        uint64_t v19 = 0;
        id v9 = (id *)&v19;
        uint64_t v10 = [v13 requestAssertionForKeyID:v8 options:0 error:&v19];
        goto LABEL_13;
      }
    }
    id v15 = 0;
LABEL_19:

    return;
  }
  id v11 = self->_dckAssertion;
  if (v11)
  {
    [v11 performSelector:sel_invalidate];
    id v12 = self->_dckAssertion;
    self->_id dckAssertion = 0;
  }
}

unint64_t __62__PKDashboardPassViewController__updateDigitalCarKeyAssertion__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 supportedRadioTechnologies] >> 1) & 1;
}

- (void)_updateFingerDetection
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((PKPearlIsAvailable() & 1) != 0
    || (PKUserIntentIsAvailable() & 1) != 0
    || (unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalidated), (v3 & 1) != 0)
    || !PKViewVisibilityStateIsVisible()
    || ![(PKDashboardPassViewController *)self _isForegroundActive]
    || !self->_frontmostPaymentPass)
  {
    fingerDetectionOperation = self->_fingerDetectionOperation;
    if (fingerDetectionOperation)
    {
      [(BKPresenceDetectOperation *)fingerDetectionOperation setDelegate:0];
      [(BKPresenceDetectOperation *)self->_fingerDetectionOperation cancel];
      double v14 = self->_fingerDetectionOperation;
      self->_fingerDetectionOperation = 0;
    }
    fingerTimer = self->_fingerTimer;
    if (fingerTimer)
    {
      dispatch_source_cancel(fingerTimer);
      double v16 = self->_fingerTimer;
      self->_fingerTimer = 0;
    }
  }
  else if (!self->_fingerDetectionOperation)
  {
    [(objc_class *)_MergedGlobals_7_2() availableDevices];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
LABEL_10:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        if (objc_msgSend(v9, "type", (void)v19) == 1)
        {
          uint64_t v10 = [(Class)off_1EC349FE8() deviceWithDescriptor:v9 error:0];
          if (v10) {
            break;
          }
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v6) {
            goto LABEL_10;
          }
          goto LABEL_17;
        }
      }
      id v11 = (void *)v10;

      double v17 = [v11 createPresenceDetectOperationWithError:0];
      long long v18 = self->_fingerDetectionOperation;
      self->_fingerDetectionOperation = v17;

      [(BKPresenceDetectOperation *)self->_fingerDetectionOperation setPriority:40];
      [(BKPresenceDetectOperation *)self->_fingerDetectionOperation setDelegate:self];
      if ([(BKPresenceDetectOperation *)self->_fingerDetectionOperation startWithError:0]) {
        goto LABEL_27;
      }
      [(BKPresenceDetectOperation *)self->_fingerDetectionOperation setDelegate:0];
      id v12 = self->_fingerDetectionOperation;
      self->_fingerDetectionOperation = 0;
    }
    else
    {
LABEL_17:
      id v11 = 0;
      id v12 = (BKPresenceDetectOperation *)v4;
    }

LABEL_27:
  }
}

- (void)accountDidUpdate:(id)a3
{
  uint64_t IsVisible = PKViewVisibilityStateIsVisible();

  [(PKDashboardPassViewController *)self _updateFooterAnimated:IsVisible];
}

- (void)_updateFooterAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_frontmostPaymentPass || !PKViewVisibilityStateIsVisible()) {
    goto LABEL_12;
  }
  uint64_t v5 = [(PKDashboardViewController *)self delegate];
  if (!v5 || (objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_11;
  }
  int v6 = [v5 canRequestPaymentForPass:self->_frontmostPaymentPass];

  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v5 = [(PKPaymentPass *)self->_frontmostPaymentPass devicePrimaryContactlessPaymentApplication];
  [(PKPaymentPass *)self->_frontmostPaymentPass effectiveContactlessPaymentApplicationState];
  if (!PKPaymentApplicationStateIsPersonalized())
  {
LABEL_11:

    goto LABEL_12;
  }
  if (v5 && ([v5 requiresConsentForDataRelease] & 1) == 0)
  {
  }
  else
  {
    int v7 = [(PKPaymentPass *)self->_frontmostPaymentPass supportsBarcodePayment];

    if (!v7) {
      goto LABEL_12;
    }
  }
  if (([MEMORY[0x1E4F88108] cachedStateForPolicy:0] & 0xF) != 9
    || -[PKPaymentPass hasAssociatedPeerPaymentAccount](self->_frontmostPaymentPass, "hasAssociatedPeerPaymentAccount")&& ([MEMORY[0x1E4F84E00] sharedInstance], v12 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v12, "account"), double v13 = objc_claimAutoreleasedReturnValue(), v12, v14 = objc_msgSend(v13, "state"), v13, v14 == 3))
  {
LABEL_12:
    p_footerVisible = &self->_footerVisible;
    if (self->_footerVisible)
    {
      int v9 = 0;
      goto LABEL_14;
    }
LABEL_34:
    [(PKDashboardPassViewController *)self _updatePasscodeButtonTitle];
    return;
  }
  if (![(PKPaymentPass *)self->_frontmostPaymentPass isAppleCardPass]
    || ([(PKDashboardViewController *)self dataSource],
        id v15 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v15,
        (isKindOfClass & 1) == 0))
  {
    p_footerVisible = &self->_footerVisible;
    if (!self->_footerVisible)
    {
      int v9 = 1;
      goto LABEL_14;
    }
    goto LABEL_34;
  }
  double v17 = [(PKDashboardViewController *)self dataSource];
  long long v18 = [v17 account];

  long long v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF2B8B20, &unk_1EF2B8B38, &unk_1EF2B8B50, 0);
  if (v18)
  {
    long long v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "state"));
    int v9 = [v19 containsObject:v20] ^ 1;
  }
  else
  {
    int v9 = 0;
  }

  p_footerVisible = &self->_footerVisible;
  if (v9 != !self->_footerVisible) {
    goto LABEL_34;
  }
LABEL_14:
  uint64_t v10 = [(PKDashboardPassViewController *)self viewIfLoaded];
  if (v10)
  {
    if (v9) {
      [(PKDashboardPassViewController *)self _createFooter];
    }
    if (v3)
    {
      [v10 layoutIfNeeded];
      BOOL *p_footerVisible = v9;
      [v10 setNeedsLayout];
      id v11 = (void *)MEMORY[0x1E4FB1EB0];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __55__PKDashboardPassViewController__updateFooterAnimated___block_invoke;
      v21[3] = &unk_1E59CA7D0;
      id v22 = v10;
      objc_msgSend(v11, "pkui_animateUsingOptions:animations:completion:", 4, v21, 0);
    }
    else
    {
      BOOL *p_footerVisible = v9;
      [v10 setNeedsLayout];
    }
  }
  else
  {
    BOOL *p_footerVisible = v9;
  }
}

uint64_t __55__PKDashboardPassViewController__updateFooterAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_createFooter
{
  BOOL v3 = [(PKDashboardPassViewController *)self viewIfLoaded];
  if (v3)
  {
    if (!self->_footerBackground)
    {
      id v4 = [_PKVisibilityBackdropView alloc];
      uint64_t v5 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:](v4, "initWithFrame:privateStyle:", -2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      footerBackground = self->_footerBackground;
      self->_footerBackground = v5;

      [(_UIBackdropView *)self->_footerBackground setAutoGroup:1];
      [(_PKVisibilityBackdropView *)self->_footerBackground setDelegate:self];
      [(_PKVisibilityBackdropView *)self->_footerBackground pkui_setVisibility:0 animated:1.0];
      [(_PKVisibilityBackdropView *)self->_footerBackground setHidden:0];
      [(_PKVisibilityBackdropView *)self->_footerBackground setUserInteractionEnabled:1];
      [(_PKVisibilityBackdropView *)self->_footerBackground setClipsToBounds:1];
      [v3 addSubview:self->_footerBackground];
      [v3 setNeedsLayout];
    }
    if (!self->_passcodeButton)
    {
      int v7 = (void *)MEMORY[0x1E4FB14D8];
      uint64_t v8 = [(PKDashboardPassViewController *)self _passcodeButtonTitle];
      int v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E4FB2798], 18.0));
      uint64_t v10 = objc_msgSend(v7, "pkui_plainConfigurationWithTitle:font:lineBreakMode:textAlignment:", v8, v9, 4, 1);

      objc_initWeak(&location, self);
      id v11 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      long long v19 = __46__PKDashboardPassViewController__createFooter__block_invoke;
      long long v20 = &unk_1E59CBEE0;
      objc_copyWeak(&v21, &location);
      id v12 = [v11 actionWithHandler:&v17];
      objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v10, v12, v17, v18, v19, v20);
      double v13 = (UIButton *)objc_claimAutoreleasedReturnValue();
      passcodeButton = self->_passcodeButton;
      self->_passcodeButton = v13;

      [(UIButton *)self->_passcodeButton setConfigurationUpdateHandler:&__block_literal_global_204];
      [(UIButton *)self->_passcodeButton setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
      id v15 = [(_UIBackdropView *)self->_footerBackground contentView];
      [v15 addSubview:self->_passcodeButton];

      double v16 = [(_UIBackdropView *)self->_footerBackground contentView];
      [v16 setAccessibilityIdentifier:*MEMORY[0x1E4F855A8]];

      [v3 setNeedsLayout];
      [(PKDashboardPassViewController *)self _updatePasscodeButtonTitle];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __46__PKDashboardPassViewController__createFooter__block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 sender];

  [WeakRetained _passcodeTapped:v4];
}

void __46__PKDashboardPassViewController__createFooter__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  objc_msgSend(v2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (void)_updatePasscodeButtonTitle
{
  passcodeButton = self->_passcodeButton;
  if (passcodeButton)
  {
    id v4 = [(PKDashboardPassViewController *)self _passcodeButtonTitle];
    [(UIButton *)passcodeButton pkui_updateConfigurationWithTitle:v4];

    [(PKDashboardPassViewController *)self _updateDefaultPasscodeButtonSize];
    id v5 = [(PKDashboardPassViewController *)self viewIfLoaded];
    [v5 setNeedsLayout];
  }
}

- (id)_passcodeButtonTitle
{
  if ([(PKPaymentPass *)self->_frontmostPaymentPass isAccessPass]) {
    id v2 = @"GENERIC_PASSCODE";
  }
  else {
    id v2 = @"PAYMENT_PASSCODE";
  }
  id v3 = PKLocalizedPaymentString(&v2->isa);

  return v3;
}

- (void)_updateDefaultPasscodeButtonSize
{
  id v12 = [(PKDashboardPassViewController *)self view];
  [v12 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  p_defaultPasscodeButtonSize = &self->_defaultPasscodeButtonSize;
  passcodeButton = self->_passcodeButton;
  [v12 bounds];
  -[UIButton sizeThatFits:](passcodeButton, "sizeThatFits:", v9 - v4 - v6, 1.79769313e308);
  p_defaultPasscodeButtonSize->double width = v10;
  p_defaultPasscodeButtonSize->double height = v11;
}

- (void)_passcodeTapped:(id)a3
{
  if (self->_frontmostPaymentPass)
  {
    id v4 = [(PKDashboardViewController *)self delegate];
    [v4 dashboardPassViewController:self didRequestPaymentForPass:self->_frontmostPaymentPass fromButton:1];
  }
}

- (void)accountAdded:(id)a3
{
}

- (void)accountChanged:(id)a3
{
}

- (void)accountRemoved:(id)a3
{
}

- (void)_handleUpdatedAccount:(id)a3 accountRemoved:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKDashboardPassViewController__handleUpdatedAccount_accountRemoved___block_invoke;
  block[3] = &unk_1E59CD7B0;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __70__PKDashboardPassViewController__handleUpdatedAccount_accountRemoved___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) dataSource];
  double v3 = [v2 groupView];
  id v4 = [v3 frontmostPassView];
  double v5 = [v4 pass];

  id v6 = [v5 paymentPass];
  id v7 = [v6 associatedAccountServiceAccountIdentifier];
  uint64_t v8 = [*(id *)(a1 + 40) accountIdentifier];
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

LABEL_10:
    uint64_t v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [*(id *)(a1 + 40) accountIdentifier];
      int v17 = 138412290;
      uint64_t v18 = v15;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Updating navigation items via account %@ change", (uint8_t *)&v17, 0xCu);
    }
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = *(void *)(a1 + 40);
    }
    [*(id *)(a1 + 32) _updateNavigationItemsWithAccount:v16];
    goto LABEL_16;
  }
  CGFloat v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {

    goto LABEL_16;
  }
  char v13 = [v9 isEqualToString:v10];

  if (v13) {
    goto LABEL_10;
  }
LABEL_16:
}

- (void)reloadNavigationBarAnimated:(BOOL)a3
{
}

- (void)presentActivityDeletionConfirmationWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = PKLocalizedIdentityString(&cfstr_TransactionDel.isa);
    id v6 = PKLocalizedIdentityString(&cfstr_TransactionDel_0.isa);
    id v7 = PKLocalizedIdentityString(&cfstr_TransactionDel_1.isa);
    uint64_t v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:0 preferredStyle:0];
    id v9 = (void *)MEMORY[0x1E4FB1410];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83__PKDashboardPassViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke;
    v19[3] = &unk_1E59CB150;
    id v10 = v4;
    id v20 = v10;
    CGFloat v11 = [v9 actionWithTitle:v6 style:2 handler:v19];
    [v8 addAction:v11];

    BOOL v12 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __83__PKDashboardPassViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke_2;
    int v17 = &unk_1E59CB150;
    id v18 = v10;
    char v13 = [v12 actionWithTitle:v7 style:1 handler:&v14];
    objc_msgSend(v8, "addAction:", v13, v14, v15, v16, v17);

    [(PKDashboardPassViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

uint64_t __83__PKDashboardPassViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__PKDashboardPassViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (((!self->_fingerPresent ^ v4) & 1) == 0)
  {
    self->_fingerPresent = v4;
    if (v4)
    {
      id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      fingerTimer = self->_fingerTimer;
      self->_fingerTimer = v7;

      id v9 = self->_fingerTimer;
      dispatch_time_t v10 = dispatch_time(0, 400000000);
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      objc_initWeak(&location, self);
      CGFloat v11 = self->_fingerTimer;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __64__PKDashboardPassViewController_operation_presenceStateChanged___block_invoke;
      v14[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v15, &location);
      dispatch_source_set_event_handler(v11, v14);
      dispatch_resume((dispatch_object_t)self->_fingerTimer);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      BOOL v12 = self->_fingerTimer;
      if (v12)
      {
        dispatch_source_cancel(v12);
        char v13 = self->_fingerTimer;
        self->_fingerTimer = 0;
      }
    }
  }
}

void __64__PKDashboardPassViewController_operation_presenceStateChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    double v3 = *((void *)WeakRetained + 148);
    id v6 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      BOOL v4 = (void *)v6[148];
      v6[148] = 0;

      id v2 = v6;
    }
    if (v2[156])
    {
      double v5 = [v2 delegate];
      [v5 dashboardPassViewController:v6 didRequestPaymentForPass:v6[156] fromButton:0];

      id v2 = v6;
    }
  }
}

- (void)_performActivationStateUpdate:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  int v5 = [(PKDashboardPassViewController *)self _isForegroundActive];
  v4[2](v4);

  int v6 = [(PKDashboardPassViewController *)self _isForegroundActive];
  if (v5 != v6)
  {
    int v7 = v6;
    [(PKDashboardPassViewController *)self _updateFingerDetection];
    [(PKDashboardPassViewController *)self _updateDigitalCarKeyAssertion];
    if (((v5 | v7 ^ 1) & 1) == 0)
    {
      [MEMORY[0x1E4F88108] currentStateForPolicy:0];
      [(PKDashboardPassViewController *)self _updateFooterAnimated:1];
    }
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__PKDashboardPassViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke;
  v4[3] = &unk_1E59CD7D8;
  v4[4] = self;
  $96EE1C12479E9B303E9C2794B92A11A2 v5 = a4;
  [(PKDashboardPassViewController *)self _performActivationStateUpdate:v4];
}

uint64_t __88__PKDashboardPassViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 1232) = *(_WORD *)(result + 40);
  return result;
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateDeactivationReasons:(unsigned int)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__PKDashboardPassViewController_foregroundActiveArbiter_didUpdateDeactivationReasons___block_invoke;
  v4[3] = &unk_1E59CD800;
  v4[4] = self;
  unsigned int v5 = a4;
  [(PKDashboardPassViewController *)self _performActivationStateUpdate:v4];
}

uint64_t __86__PKDashboardPassViewController_foregroundActiveArbiter_didUpdateDeactivationReasons___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 1236) = *(_DWORD *)(result + 40);
  return result;
}

- (BOOL)_isDeactivated
{
  return !self->_foregroundActiveState.foregroundActive
      || +[PKUIForegroundActiveArbiter isDeactivedForReasons:self->_deactivationReasons];
}

- (BOOL)_isBackgrounded
{
  return !self->_foregroundActiveState.foreground
      || +[PKUIForegroundActiveArbiter isBackgroundedForReasons:self->_deactivationReasons];
}

- (BOOL)_isForegroundActive
{
  if ([(PKDashboardPassViewController *)self _isDeactivated]) {
    return 0;
  }
  else {
    return ![(PKDashboardPassViewController *)self _isBackgrounded];
  }
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  if (objc_msgSend(a4, "userInterfaceStyle", a3) == 2) {
    return 2030;
  }
  else {
    return 2010;
  }
}

- (void)menuFactoryDidUpdateMenu:(id)a3
{
  id v4 = [a3 moreMenu];
  [(PKDashboardPassViewController *)self reloadMoreMenuItemsWithMenu:v4];
}

- (void)bindInterstitialController:(id)a3
{
}

- (void)unbindInterstitialController:(id)a3
{
  activeInterstitialController = self->_activeInterstitialController;
  self->_activeInterstitialController = 0;
}

- (id)leadingViewsForInterstitialController:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(PKDashboardPassViewController *)self navigationItem];
  id v4 = [v3 leftBarButtonItem];
  unsigned int v5 = [v4 customView];

  if (v5)
  {
    v8[0] = v5;
    int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    int v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)trailingViewsForInterstitialController:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v3 = [(PKDashboardPassViewController *)self navigationItem];
  id v4 = [v3 rightBarButtonItems];

  if (v4)
  {
    unsigned int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          CGFloat v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (!objc_msgSend(v11, "isSystemItem", (void)v16) || objc_msgSend(v11, "systemItem") != 6)
          {
            uint64_t v12 = [v11 customView];
            if (!v12) {
              goto LABEL_13;
            }
            char v13 = (void *)v12;
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
LABEL_13:

    uint64_t v14 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

- (void)passTilesItemPresenter:(id)a3 executeSEActionForPass:(id)a4 tile:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  CGFloat v11 = (PKPass *)a4;
  id v12 = a5;
  id v13 = a6;
  unsigned __int8 v14 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if (v14 & 1) == 0 && self->_frontmostPass == v11 && (PKViewVisibilityStateIsVisible())
  {
    id v15 = [v12 state];
    long long v16 = (void *)MEMORY[0x1E4F84B58];
    long long v17 = [v15 actions];
    long long v18 = [v16 effectiveActionForActions:v17];

    if (v18 && [v18 type] == 4)
    {
      uint64_t v73 = 0;
      long long v74 = &v73;
      uint64_t v75 = 0x2020000000;
      uint64_t v76 = *MEMORY[0x1E4FB2748];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke;
      aBlock[3] = &unk_1E59CB4B0;
      aBlock[4] = &v73;
      long long v19 = _Block_copy(aBlock);
      id v20 = [MEMORY[0x1E4FB1438] sharedApplication];
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_2;
      v70[3] = &unk_1E59CAA98;
      id v21 = v19;
      id v71 = v21;
      uint64_t v22 = [v20 beginBackgroundTaskWithExpirationHandler:v70];
      v74[3] = v22;

      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_4;
      v67[3] = &unk_1E59CD850;
      id v38 = v21;
      id v68 = v38;
      id v69 = v13;
      double v23 = _Block_copy(v67);
      objc_initWeak(&location, self);
      uint64_t v62 = 0;
      long long v63 = (atomic_uchar *)&v62;
      uint64_t v64 = 0x2020000000;
      char v65 = 1;
      uint64_t v56 = 0;
      v57 = (id *)&v56;
      uint64_t v58 = 0x3032000000;
      v59 = __Block_byref_object_copy__3;
      long long v60 = __Block_byref_object_dispose__3;
      id v61 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = &v50;
      uint64_t v52 = 0x3032000000;
      id v53 = __Block_byref_object_copy__3;
      v54 = __Block_byref_object_dispose__3;
      id v55 = 0;
      uint64_t v24 = (void *)MEMORY[0x1E4F84C40];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_227;
      v42[3] = &unk_1E59CD8A0;
      objc_copyWeak(&v49, &location);
      id v37 = v23;
      id v45 = v37;
      uint64_t v46 = &v62;
      uint64_t v47 = &v56;
      v48 = &v50;
      id v43 = v11;
      id v44 = v12;
      double v25 = [v24 startDigitalCarKeySessionWithCompletion:v42];
      if (v25)
      {
        p_locuint64_t k = &self->_lock;
        os_unfair_lock_lock(&self->_lock);
        int v27 = 1;
        atomic_compare_exchange_strong(v63 + 24, (unsigned __int8 *)&v27, 0);
        if (v27 == 1)
        {
          sessionHandles = self->_sessionHandles;
          if (!sessionHandles)
          {
            double v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            double v30 = self->_sessionHandles;
            self->_sessionHandles = v29;

            sessionHandles = self->_sessionHandles;
          }
          -[NSMutableArray addObject:](sessionHandles, "addObject:", v25, &self->_lock, v37);
          objc_storeStrong(v57 + 5, v25);
          dispatch_source_t v31 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
          uint64_t v32 = (void *)v51[5];
          v51[5] = (uint64_t)v31;

          objc_super v33 = v51[5];
          dispatch_time_t v34 = dispatch_time(0, 10000000000);
          dispatch_source_set_timer(v33, v34, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
          v35 = v51[5];
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_4_234;
          handler[3] = &unk_1E59CD8C8;
          uint64_t v41 = &v56;
          id v40 = v38;
          dispatch_source_set_event_handler(v35, handler);
          dispatch_resume((dispatch_object_t)v51[5]);

          p_locuint64_t k = v36;
        }
        os_unfair_lock_unlock(p_lock);
      }

      objc_destroyWeak(&v49);
      _Block_object_dispose(&v50, 8);

      _Block_object_dispose(&v56, 8);
      _Block_object_dispose(&v62, 8);
      objc_destroyWeak(&location);

      _Block_object_dispose(&v73, 8);
    }
    else
    {
      (*((void (**)(id, void))v13 + 2))(v13, 0);
    }
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    double v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_3;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_5;
    v12[3] = &unk_1E59CAA98;
    id v13 = *(id *)(a1 + 32);
    [v5 invalidateSessionWithCompletion:v12];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_6;
  block[3] = &unk_1E59CD828;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  char v11 = a2;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_5(uint64_t a1)
{
}

uint64_t __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_6(void *a1)
{
  if (!a1[4]) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  id v2 = *(uint64_t (**)(void))(a1[6] + 16);

  return v2();
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 80));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[151];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_2_228;
    block[3] = &unk_1E59CD878;
    void block[4] = WeakRetained;
    long long v16 = *(_OWORD *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 72);
    id v11 = v5;
    id v12 = v6;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v9, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_2_228(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  int v2 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 80) + 8) + 24), (unsigned __int8 *)&v2, 0);
  if (v2 != 1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 1200));
    [*(id *)(*(void *)(a1 + 32) + 1224) removeObjectIdenticalTo:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 1200));
  }
  if (!*(void *)(a1 + 40)
    || *(void *)(a1 + 48)
    || (unsigned __int8 v3 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 1216)), (v3 & 1) != 0))
  {
    uint64_t v22 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v22();
  }
  else
  {
    [MEMORY[0x1E4F845F8] attachDefaultBehaviorToSession:*(void *)(a1 + 40)];
    id v4 = [*(id *)(a1 + 56) deviceContactlessPaymentApplications];
    id v5 = objc_msgSend(v4, "pk_arrayCopy");

    int v6 = [*(id *)(a1 + 40) activatePaymentApplications:v5 forPaymentPass:*(void *)(a1 + 56)];
    id v39 = 0;
    id v40 = 0;
    if (!v6) {
      goto LABEL_31;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    double v23 = v5;
    obuint64_t j = v5;
    uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v36;
LABEL_9:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v7;
        id v8 = *(void **)(*((void *)&v35 + 1) + 8 * v7);
        id v9 = [v8 applicationIdentifier];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v10 = [v8 subcredentials];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v32;
LABEL_14:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(a1 + 64);
            long long v16 = [*(id *)(*((void *)&v31 + 1) + 8 * v14) identifier];
            +[PKPassTileGroupView extractSupportedVehicleFunction:&v40 action:&v39 forTile:v15 applicationIdentifier:v9 keyIdentifier:v16];

            if (v40)
            {
              if (v39) {
                break;
              }
            }
            if (v12 == ++v14)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v41 count:16];
              if (v12) {
                goto LABEL_14;
              }
              break;
            }
          }
        }

        id v17 = v39;
        id v18 = v40;

        if (v18)
        {
          if (v17) {
            break;
          }
        }
        uint64_t v7 = v27 + 1;
        if (v27 + 1 == v26)
        {
          uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
          if (v26) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    id v19 = v40;
    id v5 = v23;
    if (v40 && (id v20 = v39) != 0)
    {
      id v21 = *(void **)(a1 + 40);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_3_231;
      v28[3] = &unk_1E59CA820;
      id v30 = *(id *)(a1 + 72);
      id v29 = *(id *)(a1 + 40);
      [v21 sendRKEFunction:v19 action:v20 withAuthorization:0 completion:v28];
    }
    else
    {
LABEL_31:
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
}

uint64_t __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_3_231(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_4_234(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_5_235;
  v2[3] = &unk_1E59CAA98;
  id v3 = *(id *)(a1 + 32);
  [v1 invalidateSessionWithCompletion:v2];
}

void __99__PKDashboardPassViewController_passTilesItemPresenter_executeSEActionForPass_tile_withCompletion___block_invoke_5_235(uint64_t a1)
{
}

- (BOOL)handleDeletePassWithUniqueID:(id)a3
{
  frontmostPass = self->_frontmostPass;
  id v5 = a3;
  int v6 = [(PKPass *)frontmostPass uniqueID];
  int v7 = PKEqualObjects();

  if (!v7) {
    return 0;
  }
  PKPassType v8 = [(PKPass *)self->_frontmostPass passType];
  if (v8 == PKPassTypeSecureElement)
  {
    id v10 = [(PKPass *)self->_frontmostPass paymentPass];
    uint64_t v12 = [(PKDashboardViewController *)self dataSource];
    if ([v10 hasMerchantTokens])
    {
      uint64_t v13 = [v12 account];
      uint64_t v14 = [(PKDashboardPassViewController *)self navigationDashboardPassVC];
      id v15 = objc_alloc_init(MEMORY[0x1E4F848A0]);
      id v16 = [(PKDashboardPassViewController *)self navigationDashboardPassVC];
      LOBYTE(v19) = 0;
      +[PKPassDeleteHelper presentMerchantTokenDeletePaymentPassAlertForPass:v10 withAccount:v13 merchantTokensResponse:0 deleteHander:v14 passLibraryDataProvider:v15 navigationController:v16 presentingViewController:self isBridge:v19];
    }
    else
    {
      if ([v10 isStoredValuePass])
      {
        uint64_t v13 = [MEMORY[0x1E4F850D8] passPropertiesForPass:v10];
        uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v10];
        [v14 setTransitProperties:v13 andApplyStoredValueBalances:1];
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v14 = 0;
      }
      id v15 = [v12 account];
      id v16 = objc_alloc_init(MEMORY[0x1E4F84A88]);
      id v17 = [(PKDashboardPassViewController *)self navigationDashboardPassVC];
      id v18 = objc_alloc_init(MEMORY[0x1E4F848A0]);
      +[PKPassDeleteHelper presentDeletePaymentPassAlertForPass:v10 withAccount:v15 paymentServiceDataProvider:v16 transitBalanceModel:v14 transitPassProperties:v13 fkInstitution:0 detailViewStyle:0 deleteHander:v17 passLibraryDataProvider:v18 presentingViewController:self];
    }
    goto LABEL_13;
  }
  if (v8) {
    return 0;
  }
  id v9 = self->_frontmostPass;
  id v10 = [(PKDashboardPassViewController *)self navigationDashboardPassVC];
  +[PKPassDeleteHelper presentDeleteBarcodePassAlertForPass:v9 withHandler:v10 presentingViewController:self];
LABEL_13:

  return 1;
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3 = *MEMORY[0x1E4F87038];
  id v4 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87038]];

  if (!v4)
  {
    self->_didBeginPassManagementSubject = 1;
    id v5 = (void *)MEMORY[0x1E4F843E0];
    [v5 beginSubjectReporting:v3];
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginPassManagementSubject)
  {
    self->_didBeginPassManagementSubject = 0;
    [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87038]];
  }
}

- (PKPass)frontmostPass
{
  return self->_frontmostPass;
}

- (PKDashboardPassFlowLayout)passFlowLayout
{
  return self->_passFlowLayout;
}

- (PKDashboardPaymentTransactionItemPresenter)transactionPresenter
{
  return self->_transactionPresenter;
}

- (PKDashboardAccountModulePresenter)accountModulePresenter
{
  return self->_accountModulePresenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionPresenter, 0);
  objc_storeStrong((id *)&self->_passFlowLayout, 0);
  objc_storeStrong((id *)&self->_frontmostPass, 0);
  objc_storeStrong((id *)&self->_shareablePassProvider, 0);
  objc_storeStrong((id *)&self->_accountModulePresenter, 0);
  objc_storeStrong(&self->_dckAssertion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_navBarButtonTypes, 0);
  objc_storeStrong((id *)&self->_moreMenuFactory, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_passcodeButton, 0);
  objc_storeStrong((id *)&self->_footerBackground, 0);
  objc_storeStrong((id *)&self->_frontmostPaymentPass, 0);
  objc_storeStrong((id *)&self->_sessionHandles, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeInterstitialController, 0);
  objc_storeStrong((id *)&self->_fingerTimer, 0);

  objc_storeStrong((id *)&self->_fingerDetectionOperation, 0);
}

@end