@interface PKPaymentRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (id)groupsControllerWithSource:(int64_t)a3 hasUserBeenAuthenticated:(BOOL)a4 passUniqueID:(id)a5;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isInGroup;
- (BOOL)_notificationIsFromChildViewController:(id)a3;
- (BOOL)_releaseUIBlockIfNeededTimeout:(BOOL)a3;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result;
- (PKPaymentRemoteAlertViewController)init;
- (id)_activeViewController;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_acquireStaticResources;
- (void)_animateViewBackgroundColorIn:(id)a3;
- (void)_contactlessInterfaceSessionDidAuthorize:(id)a3;
- (void)_contactlessInterfaceSessionFinishTransaction:(id)a3;
- (void)_dismissForSource:(unint64_t)a3 completion:(id)a4;
- (void)_dismissIfRestricted;
- (void)_insertViewControllerIfNeeded:(id)a3;
- (void)_invalidate;
- (void)_invalidateForType:(int64_t)a3;
- (void)_paymentDidReceiveSuccessfulTransactionNotification:(id)a3;
- (void)_presentHomeButtonDoubleTapAlertIfNecessary;
- (void)_presentPassAnimated:(BOOL)a3 externalizedContext:(id)a4 completion:(id)a5;
- (void)_removeViewController:(id)a3;
- (void)_setupCoverSheetIfNeeded;
- (void)_setupGroupControllerIfNeeded;
- (void)_startBackgroundContactlessInterfaceSessionIfNeeded;
- (void)_startGroupControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_transitionToAppeared;
- (void)_transitionToViewState:(id)a3 animated:(BOOL)a4;
- (void)_transitionToViewStateScreen:(int64_t)a3 animated:(BOOL)a4;
- (void)authorizationCoverSheetViewControllerDidCompleteWithSuccess:(BOOL)a3;
- (void)authorizationCoverSheetViewControllerDidGetBiometricUnavailableOrFailure;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)consumeDoublePressUpForButtonKind:(int64_t)a3;
- (void)dealloc;
- (void)didInvalidateForRemoteAlert;
- (void)handleButtonActions:(id)a3;
- (void)loadView;
- (void)openApplication:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPaymentRemoteAlertViewController

+ (id)groupsControllerWithSource:(int64_t)a3 hasUserBeenAuthenticated:(BOOL)a4 passUniqueID:(id)a5
{
  BOOL v5 = a4;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F84740]);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v7, 0);
    v10 = (void *)[v8 initWithPassTypeMask:-1 passFilters:0 allowedPassUniqueIDs:v9];
  }
  else
  {
    if (a3)
    {
      uint64_t v11 = 26;
      if (v5) {
        uint64_t v11 = 10;
      }
      if (a3 != 1) {
        uint64_t v11 = 0;
      }
      if (a3 == 5) {
        uint64_t v12 = 10;
      }
      else {
        uint64_t v12 = v11;
      }
    }
    else
    {
      if (PKUserIntentIsAvailable())
      {
        v13 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v14 = *MEMORY[0x1E4F87010];
        uint64_t v15 = *MEMORY[0x1E4F86120];
        v19[0] = *MEMORY[0x1E4F86308];
        v19[1] = v15;
        uint64_t v16 = *MEMORY[0x1E4F86118];
        v20[0] = *MEMORY[0x1E4F86380];
        v20[1] = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
        [v13 subject:v14 sendEvent:v17];
      }
      if (v5) {
        uint64_t v12 = 8;
      }
      else {
        uint64_t v12 = 24;
      }
    }
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F84740]) initWithPassTypeMask:-1 passFilters:v12 allowedPassUniqueIDs:0];
  }
  [v10 setReorderingEnabled:0];

  return v10;
}

- (PKPaymentRemoteAlertViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentRemoteAlertViewController;
  v2 = [(PKPaymentRemoteAlertViewController *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v2];
    v6 = (void *)*((void *)v2 + 126);
    *((void *)v2 + 126) = v5;

    id v7 = [MEMORY[0x1E4F74230] sharedConnection];
    v2[1120] = [v7 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F88]] == 1;

    if (PKAccessPassVisibilityEnabled()) {
      BOOL v8 = v2[1120] == 0;
    }
    else {
      BOOL v8 = 0;
    }
    v2[1136] = v8;
    [v3 addObserver:v2 selector:sel__paymentDidReceiveSuccessfulTransactionNotification_ name:*MEMORY[0x1E4F879B8] object:0];
    [v3 addObserver:v2 selector:sel__contactlessInterfaceSessionDidAuthorize_ name:*MEMORY[0x1E4F87138] object:0];
    [v3 addObserver:v2 selector:sel__contactlessInterfaceSessionFinishTransaction_ name:*MEMORY[0x1E4F87148] object:0];
    [v3 addObserver:v2 selector:sel_openApplication_ name:@"PKOpenApplicationNotification" object:0];
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)RestrictionChangedCallback, (CFStringRef)*MEMORY[0x1E4F87170], 0, (CFNotificationSuspensionBehavior)0);
    v9 = +[PKBacklightController sharedInstance];
    [v9 beginAllowingBacklightRamping:v2];

    v2[1107] = 1;
    *(_DWORD *)(v2 + 1159) = 0;
    *((void *)v2 + 144) = 0;
  }
  return (PKPaymentRemoteAlertViewController *)v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F87170], 0);
  [(PKPaymentService *)self->_paymentService setDelegate:0];
  passbookForegroundAssertion = self->_passbookForegroundAssertion;
  if (passbookForegroundAssertion)
  {
    v6 = passbookForegroundAssertion;
    id v7 = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = 0;

    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E4F87460] * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PKPaymentRemoteAlertViewController_dealloc__block_invoke;
    block[3] = &unk_1E59CA7D0;
    uint64_t v12 = v6;
    v9 = v6;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
  [(PKPaymentRemoteAlertViewController *)self _invalidate];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentRemoteAlertViewController;
  [(SBUIRemoteAlertServiceViewController *)&v10 dealloc];
}

uint64_t __45__PKPaymentRemoteAlertViewController_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_invalidate
{
}

- (void)_invalidateForType:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64_t invalidationStatus = self->_invalidationStatus;
  if (invalidationStatus < a3)
  {
    self->_int64_t invalidationStatus = a3;
    if (a3 >= 1 && invalidationStatus <= 0)
    {
      v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        passGroupsViewController = self->_passGroupsViewController;
        int v19 = 134349312;
        v20 = self;
        __int16 v21 = 2050;
        v22 = passGroupsViewController;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p:%{public}p): partially invalidated.", (uint8_t *)&v19, 0x16u);
      }

      dispatch_time_t v8 = [(PKPaymentRemoteAlertViewController *)self view];
      [v8 setUserInteractionEnabled:0];

      [(PKPassGroupsViewController *)self->_passGroupsViewController partiallyInvalidate];
      v9 = [MEMORY[0x1E4FB1438] sharedApplication];
      objc_msgSend(v9, "pkui_resetSharedRootAuthenticationContext");

      id staticGlyphResources = self->_staticGlyphResources;
      self->_id staticGlyphResources = 0;

      lockButtonObserver = self->_lockButtonObserver;
      if (lockButtonObserver)
      {
        [(BSInvalidatable *)lockButtonObserver invalidate];
        uint64_t v12 = self->_lockButtonObserver;
        self->_lockButtonObserver = 0;
      }
      lockButtonAssertion = self->_lockButtonAssertion;
      if (lockButtonAssertion)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 134349312;
          v20 = self;
          __int16 v21 = 2050;
          v22 = lockButtonAssertion;
          _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Invalidating pre-arm assertion %{public}p.", (uint8_t *)&v19, 0x16u);
        }

        [(SBSAssertion *)self->_lockButtonAssertion invalidate];
        uint64_t v14 = self->_lockButtonAssertion;
        self->_lockButtonAssertion = 0;
      }
      if (self->_brightnessRampingAllowed)
      {
        uint64_t v15 = +[PKBacklightController sharedInstance];
        [v15 endAllowingBacklightRamping:self];
      }
      [(PKAuthorizationCoverSheetViewController *)self->_coverSheetViewController invalidate];
      [(PKAuthenticator *)self->_coverSheetAuthenticator invalidate];
      [(PKBackgroundContactlessInterfaceSessionController *)self->_backgroundContactlessInterfaceSession invalidate];
    }
    if (a3 > 1 && invalidationStatus <= 1)
    {
      uint64_t v16 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_passGroupsViewController;
        int v19 = 134349312;
        v20 = self;
        __int16 v21 = 2050;
        v22 = v17;
        _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p:%{public}p): invalidated.", (uint8_t *)&v19, 0x16u);
      }

      [(PKAssertion *)self->_notificationSuppressionAssertion invalidate];
      notificationSuppressionAssertion = self->_notificationSuppressionAssertion;
      self->_notificationSuppressionAssertion = 0;

      [(PKPassGroupsViewController *)self->_passGroupsViewController invalidate];
      [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87010]];
    }
    [(PKPaymentRemoteAlertViewController *)self _releaseUIBlockIfNeededTimeout:0];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRemoteAlertViewController;
  [(PKPaymentRemoteAlertViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    [v6 bounds];
    id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    PKSetDisplayProperties();
  }
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentRemoteAlertViewController;
  [(PKPaymentRemoteAlertViewController *)&v5 loadView];
  v3 = [(PKPaymentRemoteAlertViewController *)self view];
  BOOL v4 = +[PKPassGroupStackView backgroundColor];
  [v3 setBackgroundColor:v4];

  [v3 setAutoresizingMask:0];
  -[PKPaymentRemoteAlertViewController _transitionToViewState:animated:](self, "_transitionToViewState:animated:", self->_state.screen, *(void *)&self->_state.appeared & 0xFFFFFFFFFFFF00FFLL | 0x100, self->_shouldViewAnimateIn);
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentRemoteAlertViewController;
  [(PKPaymentRemoteAlertViewController *)&v2 viewDidLoad];
  kdebug_trace();
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentRemoteAlertViewController;
  [(PKPaymentRemoteAlertViewController *)&v17 viewWillLayoutSubviews];
  v3 = [(PKPaymentRemoteAlertViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  passGroupsViewController = self->_passGroupsViewController;
  if (passGroupsViewController)
  {
    v13 = [(PKPassGroupsViewController *)passGroupsViewController view];
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
    [v13 layoutIfNeeded];
    uint64_t v14 = [(PKPassGroupsViewController *)self->_passGroupsViewController groupStackView];
    [v14 layoutContentForCurrentPresentationState:0];
  }
  coverSheetViewController = self->_coverSheetViewController;
  if (coverSheetViewController)
  {
    uint64_t v16 = [(PKAuthorizationCoverSheetViewController *)coverSheetViewController view];
    objc_msgSend(v16, "setFrame:", v5, v7, v9, v11);
    [v16 layoutIfNeeded];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentRemoteAlertViewController;
  -[PKPaymentRemoteAlertViewController viewWillAppear:](&v15, sel_viewWillAppear_);
  if (!self->_passbookForegroundAssertion)
  {
    double v5 = (void *)MEMORY[0x1E4F1E5E8];
    double v6 = PKPassKitCoreBundle();
    double v7 = (CLInUseAssertion *)[v5 newAssertionForBundle:v6 withReason:@"Passbook displaying UI for field"];
    passbookForegroundAssertion = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = v7;
  }
  if (self->_notificationSuppressionAssertion || self->_invalidationStatus)
  {
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    double v10 = (void *)MEMORY[0x1E4F84508];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke;
    v12[3] = &unk_1E59D6CC8;
    objc_copyWeak(&v13, &location);
    [v10 acquireAssertionOfType:4 withReason:@"Contactless Interface" completion:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    if (!v3) {
      goto LABEL_8;
    }
  }
  if (self->_shouldViewAnimateIn) {
    [(PKPaymentRemoteAlertViewController *)self _transitionToAppeared];
  }
LABEL_8:
  if (PKHomeButtonIsAvailable())
  {
    dispatch_time_t v9 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_62;
    block[3] = &unk_1E59CA7D0;
    void block[4] = self;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);
  }
  else
  {
    self->_processHomeButtonEvents = 1;
  }
}

void __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_super v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  double v4 = WeakRetained;
  if (WeakRetained && !WeakRetained[146])
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v5;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Error acquiring notification suppression assertion: %@", buf, 0xCu);
      }

      [*(id *)(a1 + 32) invalidate];
    }
    else
    {
      id v7 = WeakRetained + 134;
      [WeakRetained[134] setInvalidationHandler:0];
      [*v7 invalidate];
      objc_storeStrong(v4 + 134, *(id *)(a1 + 32));
      id v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_3;
      v9[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v10, v2);
      [v8 setInvalidationHandler:v9];
      objc_destroyWeak(&v10);
    }
  }
  else
  {
    [*(id *)(a1 + 32) invalidate];
  }
}

void __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = (void *)WeakRetained[134];
    WeakRetained[134] = 0;
    double v4 = WeakRetained;

    WeakRetained = v4;
  }
}

uint64_t __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_62(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1106) = 1;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentRemoteAlertViewController;
  [(PKPaymentRemoteAlertViewController *)&v4 viewDidAppear:a3];
  kdebug_trace();
  [(PKPaymentRemoteAlertViewController *)self _transitionToAppeared];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentRemoteAlertViewController;
  [(PKPaymentRemoteAlertViewController *)&v4 viewWillDisappear:a3];
  [(PKPaymentRemoteAlertViewController *)self _invalidateForType:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentRemoteAlertViewController;
  [(PKPaymentRemoteAlertViewController *)&v11 viewDidDisappear:a3];
  passbookForegroundAssertion = self->_passbookForegroundAssertion;
  if (passbookForegroundAssertion)
  {
    uint64_t v5 = passbookForegroundAssertion;
    id v6 = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = 0;

    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E4F87460] * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PKPaymentRemoteAlertViewController_viewDidDisappear___block_invoke;
    block[3] = &unk_1E59CA7D0;
    id v10 = v5;
    id v8 = v5;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
  [(PKPaymentRemoteAlertViewController *)self _invalidate];
}

uint64_t __55__PKPaymentRemoteAlertViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_transitionToAppeared
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  p_state = &self->_state;
  if (!self->_state.appeared)
  {
    objc_super v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134349056;
      id v6 = self;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): appearing.", (uint8_t *)&v5, 0xCu);
    }

    -[PKPaymentRemoteAlertViewController _transitionToViewState:animated:](self, "_transitionToViewState:animated:", p_state->screen, *(void *)&p_state->appeared & 0xFFFFFFFFFFFFFF00 | 1, self->_shouldViewAnimateIn);
  }
}

- (void)_transitionToViewStateScreen:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)_transitionToViewState:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  p_state = &self->_state;
  int64_t screen = self->_state.screen;
  if ((a3.var0 != screen
     || a3.var1 != self->_state.appeared
     || ((*(_DWORD *)&a3.var1 >> 8) & 1) != self->_state.viewLoaded)
    && a3.var0 >= screen
    && self->_invalidationStatus == 0)
  {
    objc_super v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349824;
      v34 = self;
      __int16 v35 = 2048;
      int64_t v36 = var0;
      __int16 v37 = 1024;
      int v38 = v5 & 1;
      __int16 v39 = 1024;
      unsigned int v40 = (v5 >> 8) & 1;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Transitioning to state (screen: %ld, appeared: %i, viewLoaded: %i)", buf, 0x22u);
    }

    if ((v5 & 0x100) != 0)
    {
      objc_initWeak((id *)buf, self);
      uint64_t v12 = [(PKPaymentRemoteAlertViewController *)self view];
      int64_t v13 = p_state->screen;
      BOOL appeared = p_state->appeared;
      p_state->int64_t screen = var0;
      *(void *)&p_state->BOOL appeared = v5;
      BOOL v15 = !appeared;
      int v16 = v15 & v5;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __70__PKPaymentRemoteAlertViewController__transitionToViewState_animated___block_invoke;
      aBlock[3] = &unk_1E59DB110;
      char v31 = v15 & v5;
      BOOL v32 = v4;
      aBlock[4] = self;
      id v17 = v12;
      id v30 = v17;
      v18 = (void (**)(void))_Block_copy(aBlock);
      if ((v5 & 1) == 0) {
        [v17 setHidden:1];
      }
      if (var0 == 2)
      {
        [(PKPaymentRemoteAlertViewController *)self _setupGroupControllerIfNeeded];
        if (self->_passGroupsViewController)
        {
          __int16 v21 = self->_coverSheetViewController;
          if (v21)
          {
            coverSheetViewController = self->_coverSheetViewController;
            self->_coverSheetViewController = 0;

            if (v13 == 1 && v4)
            {
              uint64_t v23 = MEMORY[0x1E4F143A8];
              uint64_t v24 = 3221225472;
              v25 = __70__PKPaymentRemoteAlertViewController__transitionToViewState_animated___block_invoke_2;
              v26 = &unk_1E59CB010;
              objc_copyWeak(&v28, (id *)buf);
              v27 = v21;
              [(PKAuthorizationCoverSheetViewController *)v27 fadeOutUIWithCompletion:&v23];

              objc_destroyWeak(&v28);
            }
            else
            {
              -[PKPaymentRemoteAlertViewController _removeViewController:](self, "_removeViewController:", v21, v21);
            }
            [(PKAuthorizationCoverSheetViewController *)v21 invalidate];
          }
          -[PKPaymentRemoteAlertViewController _insertViewControllerIfNeeded:](self, "_insertViewControllerIfNeeded:", self->_passGroupsViewController, v21);
          if ((v5 & 0x10001) == 1) {
            int v20 = 1;
          }
          else {
            int v20 = v16;
          }
          if (v20 == 1)
          {
            p_state->hasShownPassGroups = 1;
            [(PKPaymentRemoteAlertViewController *)self _startGroupControllerAnimated:v4 completion:0];
          }
          v18[2](v18);
        }
      }
      else if (var0 == 1)
      {
        [(PKPaymentRemoteAlertViewController *)self _setupCoverSheetIfNeeded];
        [(PKPaymentRemoteAlertViewController *)self _insertViewControllerIfNeeded:self->_coverSheetViewController];
        if (v16) {
          [(PKAuthorizationCoverSheetViewController *)self->_coverSheetViewController fadeInUIAnimated:v4 performSynchronizedAnimation:v18];
        }
      }

      objc_destroyWeak((id *)buf);
    }
    else
    {
      p_state->int64_t screen = var0;
      *(void *)&p_state->BOOL appeared = v5;
      if (var0 != 2)
      {
        if (var0 != 1) {
          return;
        }
        [(PKPaymentRemoteAlertViewController *)self _setupCoverSheetIfNeeded];
      }
      [(PKPaymentRemoteAlertViewController *)self _setupGroupControllerIfNeeded];
    }
  }
}

uint64_t __70__PKPaymentRemoteAlertViewController__transitionToViewState_animated___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 48))
  {
    if (*(unsigned char *)(result + 49)) {
      return [*(id *)(result + 32) _animateViewBackgroundColorIn:*(void *)(result + 40)];
    }
    else {
      return [*(id *)(result + 40) setHidden:0];
    }
  }
  return result;
}

void __70__PKPaymentRemoteAlertViewController__transitionToViewState_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeViewController:*(void *)(a1 + 32)];
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result
{
  if (self->_passGroupsViewController != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)PKPaymentRemoteAlertViewController;
    [(PKPaymentRemoteAlertViewController *)&v4 sizeForChildContentContainer:result.width withParentContainerSize:result.height];
  }
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v2 = [(PKPaymentRemoteAlertViewController *)self _activeViewController];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 supportedInterfaceOrientations];
  }
  else {
    unint64_t v4 = 2;
  }

  return v4;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)childViewControllerForStatusBarHidden
{
  if (self->_state.screen)
  {
    coverSheetViewController = self->_coverSheetViewController;
    if (!coverSheetViewController) {
      coverSheetViewController = self->_passGroupsViewController;
    }
    id v3 = coverSheetViewController;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)childViewControllerForStatusBarStyle
{
  if (self->_state.screen)
  {
    coverSheetViewController = self->_coverSheetViewController;
    if (!coverSheetViewController) {
      coverSheetViewController = self->_passGroupsViewController;
    }
    id v3 = coverSheetViewController;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)didInvalidateForRemoteAlert
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentRemoteAlertViewController;
  [(SBUIRemoteAlertServiceViewController *)&v3 didInvalidateForRemoteAlert];
  [(PKPaymentRemoteAlertViewController *)self _invalidate];
  [(PKPaymentRemoteAlertViewController *)self dismissViewControllerAnimated:0 completion:0];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v37 = a4;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v50 = self;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): configuring.", buf, 0xCu);
  }

  uint64_t v7 = [(PKPaymentRemoteAlertViewController *)self _remoteViewControllerProxy];
  self->_isLockScreenPresented = PKDeviceUILocked() != 0;
  [v7 setWallpaperStyle:1 withDuration:0.0];
  [v7 setLaunchingInterfaceOrientation:1];
  [v7 setAllowsSiri:0];
  [v7 setDesiredHardwareButtonEvents:16];
  [v7 setSwipeDismissalStyle:1];
  [v7 setDismissalAnimationStyle:1];
  if (self->_isLockScreenPresented) {
    objc_msgSend(v7, "setDesiredAutoLockDuration:", 30.0, v37);
  }
  id v8 = objc_msgSend(v39, "userInfo", v37);
  dispatch_time_t v9 = [v8 valueForKey:*MEMORY[0x1E4F87948]];
  self->_unint64_t presentationSource = [v9 integerValue];

  id v10 = [v8 valueForKey:*MEMORY[0x1E4F87918]];
  self->_presentationStartTime = [v10 integerValue];

  objc_super v11 = [v8 valueForKey:*MEMORY[0x1E4F878E0]];
  self->_shouldViewAnimateIn = [v11 BOOLValue];

  p_passUniqueIdentifier = (void **)&self->_passUniqueIdentifier;
  passUniqueIdentifier = self->_passUniqueIdentifier;
  self->_passUniqueIdentifier = 0;

  fieldPassUniqueIdentifiers = self->_fieldPassUniqueIdentifiers;
  self->_fieldPassUniqueIdentifiers = 0;

  fieldProperties = self->_fieldProperties;
  self->_fieldProperties = 0;

  unsigned int v40 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F878F8]];
  if (v40)
  {
    int v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v40 error:0];
    id v17 = self->_fieldProperties;
    self->_fieldProperties = v16;
  }
  v18 = [v8 valueForKey:*MEMORY[0x1E4F878D0]];
  uint64_t v19 = *MEMORY[0x1E4F87010];
  [MEMORY[0x1E4F843E0] beginSubjectReporting:*MEMORY[0x1E4F87010] withArchivedParent:v18];
  int v20 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v47 = *MEMORY[0x1E4F85FC0];
  unint64_t presentationSource = self->_presentationSource;
  if (presentationSource > 6) {
    v22 = @"unknown";
  }
  else {
    v22 = off_1E59DB498[presentationSource];
  }
  v48 = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  [v20 subject:v19 sendEvent:v23];

  if ((unint64_t)(self->_presentationSource - 1) <= 5) {
    [MEMORY[0x1E4F88108] removeUserIntentAvailable];
  }
  uint64_t v24 = self->_fieldProperties;
  BOOL v25 = v24 == 0;
  if (v24) {
    p_passUniqueIdentifier = (void **)&self->_fieldPassUniqueIdentifiers;
  }
  v26 = (void *)MEMORY[0x1E4F87950];
  if (!v25) {
    v26 = (void *)MEMORY[0x1E4F878F0];
  }
  v27 = [v8 objectForKey:*v26];
  uint64_t v28 = [v27 copy];
  v29 = *p_passUniqueIdentifier;
  *p_passUniqueIdentifier = (void *)v28;

  int64_t v30 = self->_presentationSource;
  BOOL v31 = v30 == 5;
  BOOL v32 = v30 == 6;
  BOOL v33 = self->_showCoverSheet && v30 != 5 && (PKDeviceLocked() & 1) != 0 || v32;
  self->_showCoverSheet = v33;
  objc_initWeak((id *)buf, self);
  v34 = [MEMORY[0x1E4F843E8] shared];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __70__PKPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke;
  v41[3] = &unk_1E59DB3B0;
  objc_copyWeak(&v44, (id *)buf);
  id v35 = v38;
  id v43 = v35;
  BOOL v45 = v31;
  BOOL v46 = v32;
  id v36 = v7;
  id v42 = v36;
  [v34 isShieldRequiredWithCompletion:v41];

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)buf);
}

void __70__PKPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[1136]) {
      int v6 = 1;
    }
    else {
      int v6 = a2;
    }
    WeakRetained[1136] = v6;
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v6) {
        id v8 = @"Y";
      }
      else {
        id v8 = @"N";
      }
      if (PKAccessPassVisibilityEnabled()) {
        dispatch_time_t v9 = @"Y";
      }
      else {
        dispatch_time_t v9 = @"N";
      }
      if (*(unsigned char *)(a1 + 56)) {
        id v10 = @"Y";
      }
      else {
        id v10 = @"N";
      }
      int v11 = *(unsigned __int8 *)(a1 + 57);
      if (v5[1105]) {
        uint64_t v12 = @"Y";
      }
      else {
        uint64_t v12 = @"N";
      }
      *(_DWORD *)v18 = 134350594;
      if (v11) {
        int64_t v13 = @"Y";
      }
      else {
        int64_t v13 = @"N";
      }
      *(void *)&v18[4] = v5;
      if (a2) {
        uint64_t v14 = @"Y";
      }
      else {
        uint64_t v14 = @"N";
      }
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v8;
      __int16 v19 = 2112;
      int v20 = v9;
      __int16 v21 = 2112;
      v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      v26 = v13;
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Showing cover sheet: %@. FeatureEnabled: %@; isCompletedTransac"
        "tion: %@, isLockScreenPresented: %@, isBiometricRequest: %@, isShieldRequired: %@",
        v18,
        0x48u);
    }

    if (v5[1136]) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 2;
    }
    objc_msgSend(v5, "_transitionToViewStateScreen:animated:", v15, v5[1104], *(_OWORD *)v18);
    [v5 _acquireStaticResources];
    [v5 _startBackgroundContactlessInterfaceSessionIfNeeded];
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(void))(v16 + 16))();
    }
    if (*((void *)v5 + 146)) {
      [*(id *)(a1 + 32) invalidate];
    }
    else {
      [v5 _dismissIfRestricted];
    }
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 40);
    if (v17) {
      (*(void (**)(void))(v17 + 16))();
    }
  }
}

- (void)handleButtonActions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_processHomeButtonEvents)
  {
    [(PKPaymentRemoteAlertViewController *)self _dismissForSource:1 completion:0];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "sendResponseWithUnHandledEvents:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "events"));
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  coverSheetViewController = self->_coverSheetViewController;
  if (coverSheetViewController) {
    [(PKAuthorizationCoverSheetViewController *)coverSheetViewController startEvaluation];
  }
  int64_t presentationSource = self->_presentationSource;
  BOOL v10 = presentationSource == 1 && !self->_shouldViewAnimateIn;
  if (!self->_showCoverSheet || self->_state.appeared) {
    goto LABEL_8;
  }
  int IsAvailable = PKHomeButtonIsAvailable();
  BOOL v12 = !v10;
  if (!presentationSource) {
    BOOL v12 = 0;
  }
  if (v12 || !IsAvailable)
  {
LABEL_8:
    v7[2](v7);
  }
  else
  {
    long long v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int v20 = self;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): Blocking UI to collect user auth", buf, 0xCu);
    }

    self->_isBlockingUIForUserAuthorization = 1;
    uint64_t v14 = _Block_copy(v7);
    id blockingUIForUserAuthorizationCompletion = self->_blockingUIForUserAuthorizationCompletion;
    self->_id blockingUIForUserAuthorizationCompletion = v14;

    objc_initWeak((id *)buf, self);
    dispatch_time_t v16 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__PKPaymentRemoteAlertViewController_prepareForActivationWithContext_completion___block_invoke;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_after(v16, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
}

void __81__PKPaymentRemoteAlertViewController_prepareForActivationWithContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _releaseUIBlockIfNeededTimeout:1];
}

- (BOOL)_isInGroup
{
  objc_super v3 = [(PKPassGroupsViewController *)self->_passGroupsViewController groupsController];
  id v4 = objc_msgSend(v3, "groupAtIndex:", objc_msgSend(v3, "groupIndexForPassUniqueID:", self->_passUniqueIdentifier));
  BOOL v5 = (unint64_t)[v4 passCount] > 1;

  return v5;
}

- (void)_setupGroupControllerIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidationStatus && !self->_passGroupsViewController)
  {
    if (PKAccessPassVisibilityEnabled()) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = PKDeviceLocked() ^ 1;
    }
    int64_t presentationSource = self->_presentationSource;
    BOOL v5 = objc_opt_class();
    if ((unint64_t)(presentationSource - 5) > 1) {
      passUniqueIdentifier = 0;
    }
    else {
      passUniqueIdentifier = self->_passUniqueIdentifier;
    }
    uint64_t v7 = [v5 groupsControllerWithSource:self->_presentationSource hasUserBeenAuthenticated:v3 passUniqueID:passUniqueIdentifier];
    uint64_t v8 = [[PKPassGroupsViewController alloc] initWithGroupsController:v7 style:1];
    passGroupsViewController = self->_passGroupsViewController;
    self->_passGroupsViewController = v8;

    [(PKPassGroupsViewController *)self->_passGroupsViewController setAssertExpressAvailable:self->_currentShowWhileLockedValue];
    if ([v7 groupCount])
    {
      [(PKPassGroupsViewController *)self->_passGroupsViewController setHandleFieldDetection:0];
      [(PKPassGroupsViewController *)self->_passGroupsViewController setSuppressedContent:307];
      BOOL v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        long long v11 = self->_passGroupsViewController;
        int v14 = 134349312;
        uint64_t v15 = self;
        __int16 v16 = 2050;
        uint64_t v17 = v11;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): created PKPassGroupsViewController %{public}p.", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      BOOL v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134349056;
        uint64_t v15 = self;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Invaldiating due to no passes to show", (uint8_t *)&v14, 0xCu);
      }

      long long v13 = self->_passGroupsViewController;
      self->_passGroupsViewController = 0;

      if (self->_state.appeared) {
        [(PKPaymentRemoteAlertViewController *)self _dismissForSource:2 completion:0];
      }
      else {
        [(PKPaymentRemoteAlertViewController *)self _invalidate];
      }
    }
  }
}

- (void)_startGroupControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4) {
    [(PKPassGroupsViewController *)self->_passGroupsViewController presentOffscreenAnimated:0 split:1 withCompletionHandler:0];
  }
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentRemoteAlertViewController__startGroupControllerAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E59CB128;
  objc_copyWeak(&v16, &location);
  id v7 = v6;
  id v15 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  coverSheetAuthenticator = self->_coverSheetAuthenticator;
  if (coverSheetAuthenticator && self->_showCoverSheet)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__PKPaymentRemoteAlertViewController__startGroupControllerAnimated_completion___block_invoke_2;
    v10[3] = &unk_1E59DB3D8;
    objc_copyWeak(&v12, &location);
    BOOL v13 = v4;
    id v11 = v8;
    [(PKAuthenticator *)coverSheetAuthenticator accessExternalizedContextWithCompletion:v10];

    objc_destroyWeak(&v12);
  }
  else
  {
    [(PKPaymentRemoteAlertViewController *)self _presentPassAnimated:v4 externalizedContext:0 completion:v8];
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __79__PKPaymentRemoteAlertViewController__startGroupControllerAnimated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained;
    [WeakRetained[123] setHandleFieldDetection:WeakRetained[136] != (id)5];
    [v5 _presentHomeButtonDoubleTapAlertIfNecessary];
    uint64_t v3 = v5;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v5);
      uint64_t v3 = v5;
    }
  }
}

void __79__PKPaymentRemoteAlertViewController__startGroupControllerAnimated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _presentPassAnimated:*(unsigned __int8 *)(a1 + 48) externalizedContext:v4 completion:*(void *)(a1 + 32)];
}

- (void)_presentPassAnimated:(BOOL)a3 externalizedContext:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (self->_passUniqueIdentifier)
  {
    BOOL v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      BOOL v33 = self;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): presenting pass.", buf, 0xCu);
    }

    id v11 = objc_alloc_init(PKPassPresentationContext);
    [(PKPassPresentationContext *)v11 setFieldDetect:self->_presentationSource == 1];
    [(PKPassPresentationContext *)v11 setPostPayment:self->_presentationSource == 5];
    [(PKPassPresentationContext *)v11 setPresentFanned:1];
    id v12 = self->_passUniqueIdentifier;
    BOOL v13 = [(PKPaymentRemoteAlertViewController *)self view];
    if ([(PKPassPresentationContext *)v11 isPostPayment]
      && ![(PKPaymentRemoteAlertViewController *)self _isInGroup])
    {
      [v13 setUserInteractionEnabled:0];
      char v14 = 1;
    }
    else
    {
      char v14 = 0;
    }

    int v16 = 0;
  }
  else if (self->_presentationSource == 5)
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      BOOL v33 = self;
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): failed presentation for express payment. Dismissing remote interface.", buf, 0xCu);
    }

    char v14 = 0;
    id v12 = 0;
    id v11 = 0;
    int v16 = 1;
  }
  else
  {
    fieldProperties = self->_fieldProperties;
    uint64_t v18 = PKLogFacilityTypeGetObject();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (fieldProperties)
    {
      if (v19)
      {
        *(_DWORD *)buf = 134217984;
        BOOL v33 = self;
        _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): presenting pass for field.", buf, 0xCu);
      }

      passGroupsViewController = self->_passGroupsViewController;
      uint64_t v21 = self->_fieldProperties;
      fieldPassUniqueIdentifiers = self->_fieldPassUniqueIdentifiers;
      id v31 = 0;
      id v11 = [(PKPassGroupsViewController *)passGroupsViewController presentationContextForFieldProperties:v21 fieldPassUniqueIdentifiers:fieldPassUniqueIdentifiers passUniqueIdentifierToPresent:&v31];
      id v12 = (NSString *)v31;
      int v16 = 0;
      char v14 = 0;
    }
    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 134217984;
        BOOL v33 = self;
        _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): presenting table.", buf, 0xCu);
      }

      id v11 = objc_alloc_init(PKPassPresentationContext);
      int v16 = 0;
      char v14 = 0;
      id v12 = 0;
    }
  }
  [(PKPassPresentationContext *)v11 setExternalizedAuthenticationContext:v8];
  [(PKPassPresentationContext *)v11 setBackgroundSession:self->_backgroundContactlessInterfaceSession];
  if (v16)
  {
    [(PKPaymentRemoteAlertViewController *)self _dismissForSource:0 completion:v9];
  }
  else
  {
    __int16 v23 = self->_passGroupsViewController;
    if (v12)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke;
      v27[3] = &unk_1E59DB400;
      v27[4] = self;
      id v28 = v9;
      char v29 = v14;
      BOOL v30 = v6;
      [(PKPassGroupsViewController *)v23 presentPassWithUniqueID:v12 context:v11 animated:v6 completionHandler:v27];
      uint64_t v24 = v28;
    }
    else
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke_88;
      v25[3] = &unk_1E59CA9F8;
      id v26 = v9;
      [(PKPassGroupsViewController *)v23 presentOnscreen:v6 context:v11 withCompletionHandler:v25];
      uint64_t v24 = v26;
    }
  }
}

void __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (a2)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): Error: failed remote presentation for express or field detect.", buf, 0xCu);
    }

    BOOL v6 = *(id **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      [v6 _dismissForSource:0 completion:0];
    }
    else
    {
      id v7 = [v6[123] groupStackView];
      uint64_t v8 = [v7 presentationState];
      if ((unint64_t)(v8 - 1) < 3 || v8 == 5 && [v7 modalGroupIndex] == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        BOOL v10 = *(void **)(v9 + 984);
        uint64_t v11 = *(unsigned __int8 *)(a1 + 49);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke_87;
        v12[3] = &unk_1E59CB6D8;
        void v12[4] = v9;
        [v10 presentOnscreen:v11 context:0 withCompletionHandler:v12];
      }
    }
  }
}

void __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke_87(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): backup presentation failed", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke_88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setupCoverSheetIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidationStatus && !self->_coverSheetViewController)
  {
    if (!self->_coverSheetAuthenticator)
    {
      uint64_t v3 = (PKAuthenticator *)[objc_alloc(MEMORY[0x1E4F88108]) initWithDelegate:0];
      coverSheetAuthenticator = self->_coverSheetAuthenticator;
      self->_coverSheetAuthenticator = v3;
    }
    uint64_t v5 = [[PKAuthorizationCoverSheetViewController alloc] initWithDelegate:self authenticator:self->_coverSheetAuthenticator source:self->_presentationSource];
    coverSheetViewController = self->_coverSheetViewController;
    self->_coverSheetViewController = v5;

    [(PKAuthorizationCoverSheetViewController *)self->_coverSheetViewController setIsErrorRecovery:self->_presentationSource == 6];
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = self->_coverSheetViewController;
      int v9 = 134349312;
      BOOL v10 = self;
      __int16 v11 = 2050;
      id v12 = v8;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): created PKAuthorizationCoverSheetViewController %{public}p.", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)authorizationCoverSheetViewControllerDidCompleteWithSuccess:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidationStatus)
  {
    BOOL v3 = a3;
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"N";
      if (v3) {
        uint64_t v6 = @"Y";
      }
      int v10 = 134349314;
      __int16 v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Cover Sheet did complete with success: %@", (uint8_t *)&v10, 0x16u);
    }

    if (!v3)
    {
      uint64_t v8 = self;
      uint64_t v9 = 5;
      goto LABEL_10;
    }
    BOOL v7 = [(PKPaymentRemoteAlertViewController *)self _releaseUIBlockIfNeededTimeout:0];
    if (self->_presentationSource == 6)
    {
      uint64_t v8 = self;
      uint64_t v9 = 6;
LABEL_10:
      [(PKPaymentRemoteAlertViewController *)v8 _dismissForSource:v9 completion:0];
      return;
    }
    [(PKPaymentRemoteAlertViewController *)self _transitionToViewStateScreen:2 animated:!v7];
  }
}

- (void)authorizationCoverSheetViewControllerDidGetBiometricUnavailableOrFailure
{
  if (!self->_invalidationStatus) {
    [(PKPaymentRemoteAlertViewController *)self _releaseUIBlockIfNeededTimeout:0];
  }
}

- (BOOL)_releaseUIBlockIfNeededTimeout:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL isBlockingUIForUserAuthorization = self->_isBlockingUIForUserAuthorization;
  if (self->_isBlockingUIForUserAuthorization)
  {
    if (a3)
    {
      uint64_t v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 134217984;
        uint64_t v9 = self;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): Timed out blocking UI", (uint8_t *)&v8, 0xCu);
      }
    }
    self->_BOOL isBlockingUIForUserAuthorization = 0;
    (*((void (**)(void))self->_blockingUIForUserAuthorizationCompletion + 2))();
    id blockingUIForUserAuthorizationCompletion = self->_blockingUIForUserAuthorizationCompletion;
    self->_id blockingUIForUserAuthorizationCompletion = 0;
  }
  return isBlockingUIForUserAuthorization;
}

- (void)_acquireStaticResources
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidationStatus && !self->_hasAquiredStaticResources)
  {
    self->_hasAquiredStaticResources = 1;
    if (([MEMORY[0x1E4F84FC0] isInFailForward] & 1) == 0)
    {
      BOOL v3 = [MEMORY[0x1E4F88120] sharedStaticResources];
      id staticGlyphResources = self->_staticGlyphResources;
      self->_id staticGlyphResources = v3;

      if (PKUserIntentIsAvailable())
      {
        uint64_t v5 = [MEMORY[0x1E4FA6AA8] sharedInstance];
        uint64_t v6 = [v5 beginConsumingPressesForButtonKind:2 eventConsumer:self priority:0];
        lockButtonObserver = self->_lockButtonObserver;
        self->_lockButtonObserver = v6;

        uint64_t v19 = 0;
        int v20 = &v19;
        uint64_t v21 = 0x2020000000;
        uint64_t v22 = 0;
        int v8 = [MEMORY[0x1E4FB1438] sharedApplication];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke;
        v18[3] = &unk_1E59CB4B0;
        v18[4] = &v19;
        uint64_t v9 = [v8 beginBackgroundTaskWithName:@"PKPaymentRemoteAlertViewController" expirationHandler:v18];

        void v20[3] = v9;
        uint64_t v10 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v24 = self;
          _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Acquiring pre-arm assertion...", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        id v11 = objc_alloc_init(MEMORY[0x1E4FA6A28]);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke_97;
        v14[3] = &unk_1E59DB428;
        id v12 = v11;
        id v15 = v12;
        objc_copyWeak(&v17, (id *)buf);
        uint64_t v13 = *MEMORY[0x1E4F878E8];
        int v16 = &v19;
        [v12 acquireWalletPreArmSuppressionAssertionForReason:v13 completion:v14];
        objc_destroyWeak(&v17);

        objc_destroyWeak((id *)buf);
        _Block_object_dispose(&v19, 8);
      }
    }
  }
}

void __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke_97(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke_2;
  block[3] = &unk_1E59D78E8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (!WeakRetained)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(id **)(a1 + 32);
      int v15 = 134349056;
      int v16 = v11;
      uint64_t v8 = "PKPaymentRemoteAlertViewController: Ignoring pre-arm assertion %{public}p.";
      id v9 = v5;
      uint32_t v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    [*(id *)(a1 + 32) invalidate];
    goto LABEL_12;
  }
  id v4 = WeakRetained[146];
  id v5 = PKLogFacilityTypeGetObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v15 = 134349312;
      int v16 = v3;
      __int16 v17 = 2050;
      uint64_t v18 = v7;
      uint64_t v8 = "PKPaymentRemoteAlertViewController (%{public}p): Ignoring pre-arm assertion %{public}p.";
      id v9 = v5;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v6)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v15 = 134349312;
    int v16 = v3;
    __int16 v17 = 2050;
    uint64_t v18 = v12;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Acquired pre-arm assertion %{public}p.", (uint8_t *)&v15, 0x16u);
  }

  objc_storeStrong(v3 + 133, *(id *)(a1 + 32));
LABEL_12:
  uint64_t v13 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    uint64_t v14 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v14 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13;
  }
}

- (void)_presentHomeButtonDoubleTapAlertIfNecessary
{
  if (!self->_invalidationStatus
    && !self->_presentationSource
    && PKHomeButtonIsAvailable()
    && (PKContactlessInterfaceHomeButtonSourceHasOccurred() & 1) == 0)
  {
    id v3 = (void *)MEMORY[0x1E4FB1418];
    id v4 = PKLocalizedPaymentString(&cfstr_ContactlessInt_0.isa);
    id v5 = PKLocalizedPaymentString(&cfstr_ContactlessInt_1.isa);
    BOOL v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

    uint64_t v7 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v8 = PKLocalizedPaymentString(&cfstr_ContactlessInt_2.isa);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke;
    v15[3] = &unk_1E59CB1F0;
    v15[4] = self;
    id v9 = [v7 actionWithTitle:v8 style:0 handler:v15];

    uint32_t v10 = (void *)MEMORY[0x1E4FB1410];
    id v11 = PKLocalizedPaymentString(&cfstr_ContactlessInt_3.isa);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke_3;
    v14[3] = &unk_1E59CB1F0;
    void v14[4] = self;
    uint64_t v12 = [v10 actionWithTitle:v11 style:1 handler:v14];

    [v6 addAction:v9];
    [v6 addAction:v12];
    uint64_t v13 = [(UIViewController *)self pkui_frontMostViewController];
    [v13 presentViewController:v6 animated:1 completion:0];
  }
}

void __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  objc_super v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSBOOK"];
  uint64_t v10 = *MEMORY[0x1E4F62688];
  v11[0] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke_2;
  v7[3] = &unk_1E59CA870;
  id v8 = v2;
  id v9 = v3;
  id v5 = v3;
  id v6 = v2;
  [v4 _dismissForSource:3 completion:v7];
}

void __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:*(void *)(a1 + 32) withOptions:*(void *)(a1 + 40)];
}

uint64_t __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_dismissIfRestricted
{
  id v3 = [(PKPaymentRemoteAlertViewController *)self _remoteViewControllerProxy];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F61A48] sharedInstance];
    int v5 = [v4 lostModeIsActive];

    if (v5)
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Dismissing Payment Interface due to Lost Mode", v7, 2u);
      }

      [(PKPaymentRemoteAlertViewController *)self _dismissForSource:2 completion:0];
    }
  }
}

- (void)_dismissForSource:(unint64_t)a3 completion:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): dismiss requested for %lu.", buf, 0x16u);
  }

  [(PKPaymentRemoteAlertViewController *)self _invalidateForType:1];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v68 = *MEMORY[0x1E4FB2748];
  uint64_t v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke;
  v61[3] = &unk_1E59CB4B0;
  v61[4] = buf;
  uint64_t v8 = [v7 beginBackgroundTaskWithExpirationHandler:v61];
  *(void *)(*(void *)&buf[8] + 24) = v8;

  id v9 = [(PKPaymentRemoteAlertViewController *)self _remoteViewControllerProxy];
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  char v60 = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_2;
  aBlock[3] = &unk_1E59DB450;
  v56 = v59;
  objc_copyWeak(&v57, &location);
  id v37 = v9;
  id v55 = v37;
  uint64_t v10 = _Block_copy(aBlock);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_3;
  v50[3] = &unk_1E59DB478;
  id v11 = v10;
  id v51 = v11;
  v53 = buf;
  id v36 = v5;
  id v52 = v36;
  uint64_t v12 = (void (**)(void))_Block_copy(v50);
  if (self->_state.appeared)
  {
    uint64_t v13 = [(PKPaymentRemoteAlertViewController *)self _activeViewController];
    for (i = 0; ; uint64_t v13 = i)
    {
      int v15 = [(PKPassGroupsViewController *)v13 presentedViewController];

      if (!v15) {
        break;
      }
      uint64_t i = v15;
    }
    int v16 = [(PKPaymentRemoteAlertViewController *)self view];
    __int16 v17 = [v16 backgroundColor];
    uint64_t v18 = [v16 layer];
    *(void *)&long long v64 = 0;
    *((void *)&v64 + 1) = &v64;
    uint64_t v65 = 0x2020000000;
    uint64_t v66 = 0;
    uint64_t v19 = [v16 traitCollection];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_4;
    v47[3] = &unk_1E59CEDA0;
    v49 = &v64;
    id v20 = v17;
    id v48 = v20;
    PKUIPerformWithEffectiveTraitCollection(v19, v47);

    uint64_t v21 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"backgroundColor"];
    [v21 setAdditive:0];
    [v21 setFromValue:*(void *)(*((void *)&v64 + 1) + 24)];
    id v22 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v21, "setToValue:", objc_msgSend(v22, "CGColor"));

    id v23 = (id)objc_msgSend(v18, "pkui_addAdditiveAnimation:", v21);
    uint64_t v24 = [MEMORY[0x1E4FB1618] clearColor];
    [v16 setBackgroundColor:v24];

    CGColorRelease(*(CGColorRef *)(*((void *)&v64 + 1) + 24));
    _Block_object_dispose(&v64, 8);

    uint64_t v25 = [(PKPassGroupsViewController *)self->_passGroupsViewController groupStackView];
    [v25 setStaggerPileAnimations:0];

    if (a3 == 4 || v13 != self->_passGroupsViewController)
    {
      __int16 v27 = [(PKPaymentRemoteAlertViewController *)self _activeViewController];
      BOOL v28 = v27 == self->_coverSheetViewController;

      if (v28)
      {
        coverSheetViewController = self->_coverSheetViewController;
        if (v13 == (PKPassGroupsViewController *)coverSheetViewController)
        {
          [(PKPassGroupsViewController *)v13 fadeOutUIWithCompletion:v12];
          goto LABEL_23;
        }
        [(PKAuthorizationCoverSheetViewController *)coverSheetViewController fadeOutUIWithCompletion:0];
        BOOL v32 = [(PKPassGroupsViewController *)v13 view];
        BOOL v33 = [v32 layer];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_6;
        v43[3] = &unk_1E59CA9F8;
        id v44 = v12;
        objc_msgSend(v33, "pkui_animateToOpacity:withCompletion:", v43, 0.0);

        id v26 = v44;
      }
      else
      {
        id v26 = self->_passGroupsViewController;
        char v29 = [(PKPassGroupsViewController *)v13 view];
        if (v13 != v26)
        {
          [(PKPassGroupsViewController *)v26 presentOffscreenAnimated:0 split:1 withCompletionHandler:0];
          [(PKPassGroupsViewController *)v26 dismissViewControllerAnimated:1 completion:0];
        }
        BOOL v30 = [v29 layer];
        if (v30)
        {
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_7;
          v39[3] = &unk_1E59CE138;
          BOOL v42 = v13 != v26;
          unsigned int v40 = v26;
          uint64_t v41 = v12;
          objc_msgSend(v30, "pkui_animateToOpacity:withCompletion:", v39, 0.0);
        }
        else
        {
          v12[2](v12);
        }
      }
    }
    else
    {
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_5;
      v45[3] = &unk_1E59CA9F8;
      BOOL v46 = v12;
      [(PKPassGroupsViewController *)v13 presentOffscreenAnimated:1 split:1 withCompletionHandler:v45];
      id v26 = v46;
    }

LABEL_23:
    goto LABEL_24;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v64) = 134349056;
    *(void *)((char *)&v64 + 4) = self;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Skipping dismiss animation because UI is not shown", (uint8_t *)&v64, 0xCu);
  }

  v12[2](v12);
LABEL_24:
  v62 = @"source";
  uint64_t v34 = [NSNumber numberWithUnsignedInteger:a3];
  v63 = v34;
  id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85CF8], v35);

  objc_destroyWeak(&v57);
  objc_destroyWeak(&location);
  _Block_object_dispose(v59, 8);

  _Block_object_dispose(buf, 8);
}

void __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

uint64_t __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(result + 48));
    [WeakRetained _invalidate];

    id v4 = *(void **)(v2 + 32);
    return [v4 invalidate];
  }
  return result;
}

uint64_t __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_3(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v2 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(a1[6] + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(a1[6] + 8) + 24)];

    *(void *)(*(void *)(a1[6] + 8) + 24) = v2;
  }
  uint64_t result = a1[5];
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

CGColorRef __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_4(uint64_t a1)
{
  CGColorRef result = CGColorRetain((CGColorRef)[*(id *)(a1 + 32) CGColor]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_7(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) presentOffscreenAnimated:0 split:1 withCompletionHandler:0];
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (BOOL)_notificationIsFromChildViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v7 = [v4 object];
  uint64_t v8 = v7;
  if (isKindOfClass)
  {
    for (uint64_t i = [(PKPaymentRemoteAlertViewController *)v7 pkui_viewControllerFromResponderChain];
    {
      id v11 = (PKPaymentRemoteAlertViewController *)i;

LABEL_7:
      BOOL v12 = v11 != 0;
      if (!v11 || v11 == self) {
        break;
      }
      uint64_t v8 = v11;
      [(PKPaymentRemoteAlertViewController *)v11 parentViewController];
    }
  }
  else
  {
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    if (v10)
    {
      id v11 = [v4 object];
      goto LABEL_7;
    }
    id v11 = 0;
    BOOL v12 = 0;
  }
  BOOL v13 = v11 == self && v12;

  return v13;
}

- (id)_activeViewController
{
  coverSheetViewController = self->_coverSheetViewController;
  if (!coverSheetViewController) {
    coverSheetViewController = self->_passGroupsViewController;
  }
  return coverSheetViewController;
}

- (void)_insertViewControllerIfNeeded:(id)a3
{
  id v7 = a3;
  id v4 = [(PKPaymentRemoteAlertViewController *)self viewIfLoaded];
  if (v4)
  {
    id v5 = [v7 parentViewController];

    if (!v5)
    {
      id v6 = [v7 view];
      [(PKPaymentRemoteAlertViewController *)self addChildViewController:v7];
      [v4 addSubview:v6];
      [v7 didMoveToParentViewController:self];
      [(PKPaymentRemoteAlertViewController *)self setNeedsStatusBarAppearanceUpdate];
      [(PKPaymentRemoteAlertViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
      [v4 setNeedsLayout];
      [v4 layoutIfNeeded];
    }
  }
}

- (void)_removeViewController:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    [(PKPaymentRemoteAlertViewController *)self removeChildViewController:v5];
    id v4 = [v5 view];
    [v4 removeFromSuperview];

    [v5 didMoveToParentViewController:0];
  }
}

- (void)_animateViewBackgroundColorIn:(id)a3
{
  id v3 = a3;
  id v4 = [v3 backgroundColor];
  id v5 = [v3 layer];
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  id v6 = [v3 traitCollection];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  BOOL v12 = __68__PKPaymentRemoteAlertViewController__animateViewBackgroundColorIn___block_invoke;
  BOOL v13 = &unk_1E59CEDA0;
  int v15 = &v16;
  id v7 = v4;
  id v14 = v7;
  PKUIPerformWithEffectiveTraitCollection(v6, &v10);

  objc_msgSend(v3, "setHidden:", 0, v10, v11, v12, v13);
  uint64_t v8 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"backgroundColor"];
  [v8 setAdditive:0];
  id v9 = [MEMORY[0x1E4FB1618] clearColor];
  objc_msgSend(v8, "setFromValue:", objc_msgSend(v9, "CGColor"));

  [v8 setToValue:v17[3]];
  [v5 addAnimation:v8 forKey:@"backgroundColor"];
  CGColorRelease((CGColorRef)v17[3]);

  _Block_object_dispose(&v16, 8);
}

CGColorRef __68__PKPaymentRemoteAlertViewController__animateViewBackgroundColorIn___block_invoke(uint64_t a1)
{
  CGColorRef result = CGColorRetain((CGColorRef)[*(id *)(a1 + 32) CGColor]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_startBackgroundContactlessInterfaceSessionIfNeeded
{
  if (self->_showCoverSheet)
  {
    objc_initWeak(&location, self);
    id v3 = [PKBackgroundContactlessInterfaceSessionController alloc];
    fieldProperties = self->_fieldProperties;
    id v5 = [(NSArray *)self->_fieldPassUniqueIdentifiers firstObject];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__PKPaymentRemoteAlertViewController__startBackgroundContactlessInterfaceSessionIfNeeded__block_invoke;
    v10[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v11, &location);
    id v6 = [(PKBackgroundContactlessInterfaceSessionController *)v3 initWithFieldProperties:fieldProperties forPassUniqueID:v5 relinquishOwnership:v10];
    backgroundContactlessInterfaceSession = self->_backgroundContactlessInterfaceSession;
    self->_backgroundContactlessInterfaceSession = v6;

    if (self->_backgroundContactlessInterfaceSession)
    {
      uint64_t v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController: Starting background contactless interface session", v9, 2u);
      }

      [(PKBackgroundContactlessInterfaceSessionController *)self->_backgroundContactlessInterfaceSession start];
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __89__PKPaymentRemoteAlertViewController__startBackgroundContactlessInterfaceSessionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController: Relinquishing background contactless interface session", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 141);
    *((void *)WeakRetained + 141) = 0;
  }
}

- (void)consumeDoublePressUpForButtonKind:(int64_t)a3
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87010];
  uint64_t v6 = *MEMORY[0x1E4F86120];
  v10[0] = *MEMORY[0x1E4F86308];
  v10[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86118];
  v11[0] = *MEMORY[0x1E4F86380];
  v11[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 subject:v5 sendEvent:v8];

  id v9 = [(PKPassGroupsViewController *)self->_passGroupsViewController presentedViewController];
  if (v9)
  {
  }
  else if (![(PKPassGroupsViewController *)self->_passGroupsViewController presentingPass])
  {
    [(PKPassGroupsViewController *)self->_passGroupsViewController presentDefaultPaymentPassInPaymentPresentationFromButton:1 withAnimated:1 completionHandler:0];
  }
}

- (void)_paymentDidReceiveSuccessfulTransactionNotification:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PKPaymentRemoteAlertViewController *)self _notificationIsFromChildViewController:v4])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v6 = *MEMORY[0x1E4F87010];
    uint64_t v12 = *MEMORY[0x1E4F86690];
    v13[0] = *MEMORY[0x1E4F866C8];
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v5 subject:v6 sendEvent:v7];

    uint64_t v8 = [(PKPassGroupsViewController *)self->_passGroupsViewController groupStackView];
    id v9 = [v4 object];
    if ([v8 isViewCurrentlyPresentedFooterView:v9])
    {
      uint64_t v10 = [v4 userInfo];
      char v11 = [v10 PKBoolForKey:*MEMORY[0x1E4F879C0]];

      if ((v11 & 1) == 0) {
        [(PKPaymentRemoteAlertViewController *)self _dismissForSource:0 completion:0];
      }
    }
  }
}

- (void)_contactlessInterfaceSessionDidAuthorize:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(PKPaymentRemoteAlertViewController *)self _notificationIsFromChildViewController:a3])
  {
    id v4 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v5 = *MEMORY[0x1E4F87010];
    uint64_t v10 = *MEMORY[0x1E4F86690];
    v11[0] = *MEMORY[0x1E4F866B8];
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v4 subject:v5 sendEvent:v6];

    if (self->_isLockScreenPresented)
    {
      uint64_t v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = 60;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Card Authorized. Setting Auto-Lock Duration to %d seconds.", (uint8_t *)v9, 8u);
      }

      uint64_t v8 = [(PKPaymentRemoteAlertViewController *)self _remoteViewControllerProxy];
      [v8 setDesiredAutoLockDuration:60.0];
    }
  }
}

- (void)_contactlessInterfaceSessionFinishTransaction:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if ([(PKPaymentRemoteAlertViewController *)self _notificationIsFromChildViewController:a3])
  {
    id v4 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v5 = *MEMORY[0x1E4F87010];
    uint64_t v23 = *MEMORY[0x1E4F86690];
    v24[0] = *MEMORY[0x1E4F866C0];
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    [v4 subject:v5 sendEvent:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F85098]);
    uint64_t v8 = (void *)[v7 initWithIdentifier:*MEMORY[0x1E4F87EE0] bundleIdentifier:*MEMORY[0x1E4F87D30] context:*MEMORY[0x1E4F87ED8]];
    [v8 donateSignalWithCompletion:&__block_literal_global_180];
    if (self->_presentationStartTime)
    {
      unint64_t presentationSource = self->_presentationSource;
      if (presentationSource > 6) {
        uint64_t v10 = @"unknown";
      }
      else {
        uint64_t v10 = off_1E59DB4D0[presentationSource];
      }
      mach_absolute_time();
      PKSecondsFromMachTimeInterval();
      double v12 = v11;
      BOOL v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v10;
        __int16 v21 = 2048;
        double v22 = v12;
        _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Contactless Interface Transaction Completed - Source: %@, Time: %g seconds", buf, 0x16u);
      }

      uint64_t v14 = *MEMORY[0x1E4F85D00];
      int v15 = objc_msgSend(NSNumber, "numberWithDouble:", v12, @"duration");
      uint64_t v18 = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      MEMORY[0x1A6220EC0](v14, v16);
    }
  }
}

void __84__PKPaymentRemoteAlertViewController__contactlessInterfaceSessionFinishTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PKLogFacilityTypeGetObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138412290;
      id v9 = v2;
      uint64_t v5 = "TPSDiscoverabilitySignal - Failed to donate discoverability signal - contactless transaction: %@";
      uint64_t v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    uint64_t v5 = "TPSDiscoverabilitySignal - Successfully donated discoverability signal - contactless transaction";
    uint64_t v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

- (void)openApplication:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  uint64_t v6 = self;
  if (v6)
  {
    uint32_t v7 = v6;
    int v8 = v6;
    while (1)
    {
      id v9 = [(PKPaymentRemoteAlertViewController *)v8 viewIfLoaded];
      uint64_t v10 = [v9 window];

      if (v10) {
        break;
      }
      uint64_t v10 = [(PKPaymentRemoteAlertViewController *)v7 presentedViewController];

      if (v8 == v10)
      {

        goto LABEL_10;
      }
      int v8 = v10;
      if (!v10) {
        goto LABEL_11;
      }
    }
    if (v10 == v5)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __54__PKPaymentRemoteAlertViewController_openApplication___block_invoke;
      void v11[3] = &unk_1E59CA7D0;
      id v12 = v4;
      [(PKPaymentRemoteAlertViewController *)v7 _dismissForSource:4 completion:v11];

      uint64_t v10 = v5;
    }
  }
  else
  {
LABEL_10:
    int v8 = 0;
    uint64_t v10 = 0;
  }
LABEL_11:
}

uint64_t __54__PKPaymentRemoteAlertViewController_openApplication___block_invoke(uint64_t a1)
{
  return PKOpenApplication(*(NSNotification **)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_blockingUIForUserAuthorizationCompletion, 0);
  objc_storeStrong((id *)&self->_backgroundContactlessInterfaceSession, 0);
  objc_storeStrong((id *)&self->_coverSheetAuthenticator, 0);
  objc_storeStrong((id *)&self->_fieldPropertiesLookupGroup, 0);
  objc_storeStrong((id *)&self->_notificationSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_lockButtonAssertion, 0);
  objc_storeStrong((id *)&self->_lockButtonObserver, 0);
  objc_storeStrong((id *)&self->_passbookForegroundAssertion, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_fieldPassUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_fieldProperties, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong(&self->_staticGlyphResources, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);

  objc_storeStrong((id *)&self->_passGroupsViewController, 0);
}

@end