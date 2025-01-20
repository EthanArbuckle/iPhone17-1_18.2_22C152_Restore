@interface PKAccessoryDeviceExpressAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (PKAccessoryDeviceExpressAlertViewController)init;
- (id)_expressNotificationNames;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_appearIfNecessary;
- (void)_changeStateIfNecessaryTo:(int64_t)a3;
- (void)_contactlessInterfaceSessionDidAuthorize:(id)a3;
- (void)_contactlessInterfaceSessionFinishTransaction:(id)a3;
- (void)_dismiss;
- (void)_dismissIfRestricted;
- (void)_dismissImmediately:(BOOL)a3;
- (void)_handleExpressNotification:(id)a3;
- (void)_invalidate;
- (void)_paymentDidReceiveSuccessfulTransactionNotification:(id)a3;
- (void)_registerForExpressTransactionNotifications:(BOOL)a3;
- (void)_registerObserverForNotificationName:(id)a3 center:(id)a4 handler:(id)a5;
- (void)accessoryDeviceDidChangeStateTo:(int64_t)a3;
- (void)accessoryDeviceDidReachHardTimeout;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didAttachSleeveAccessory:(id)a3;
- (void)didDetachSleeveAccessory;
- (void)didInvalidateForRemoteAlert;
- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4;
- (void)handleButtonActions:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAccessoryDeviceExpressAlertViewController

- (PKAccessoryDeviceExpressAlertViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  v2 = [(PKAccessoryDeviceExpressAlertViewController *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registeredExpressObservers = v2->_registeredExpressObservers;
    v2->_registeredExpressObservers = v3;

    [(PKAccessoryDeviceExpressAlertViewController *)v2 _registerForExpressTransactionNotifications:1];
    v5 = +[PKBacklightController sharedInstance];
    [v5 beginAllowingBacklightRamping:v2];

    v2->_brightnessRampingAllowed = 1;
    v2->_hasMultiple = 0;
    v2->_accessoryDeviceViewState = 0;
    v2->_presentedOnView = 0;
    v2->_appeared = 0;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F841A0]) initWithDelegate:v2];
    accessoryDeviceMonitor = v2->_accessoryDeviceMonitor;
    v2->_accessoryDeviceMonitor = (PKAccessoryDeviceMonitor *)v6;

    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v2->_windowedAccessoryCutoutFrameInScreen.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v2->_windowedAccessoryCutoutFrameInScreen.size = v8;
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__paymentDidReceiveSuccessfulTransactionNotification_ name:*MEMORY[0x1E4F879B8] object:0];
    [v9 addObserver:v2 selector:sel__contactlessInterfaceSessionDidAuthorize_ name:*MEMORY[0x1E4F87138] object:0];
    [v9 addObserver:v2 selector:sel__contactlessInterfaceSessionFinishTransaction_ name:*MEMORY[0x1E4F87148] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PKAccessoryDeviceExpressAlertViewController *)self _registerForExpressTransactionNotifications:0];
  passbookForegroundAssertion = self->_passbookForegroundAssertion;
  if (passbookForegroundAssertion)
  {
    v5 = passbookForegroundAssertion;
    uint64_t v6 = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = 0;

    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E4F87460] * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PKAccessoryDeviceExpressAlertViewController_dealloc__block_invoke;
    block[3] = &unk_1E59CA7D0;
    objc_super v11 = v5;
    CGSize v8 = v5;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
  [(PKAccessoryDeviceExpressAlertViewController *)self _invalidate];
  v9.receiver = self;
  v9.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  [(SBUIRemoteAlertServiceViewController *)&v9 dealloc];
}

uint64_t __54__PKAccessoryDeviceExpressAlertViewController_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  [(PKAccessoryDeviceExpressAlertViewController *)&v4 loadView];
  v3 = [(PKAccessoryDeviceExpressAlertViewController *)self view];
  [v3 setAutoresizingMask:0];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  [(PKAccessoryDeviceExpressAlertViewController *)&v5 viewWillLayoutSubviews];
  v3 = self->_accessoryDeviceView;
  objc_super v4 = [(PKAccessoryDeviceExpressAlertViewController *)self view];
  [v4 bounds];
  -[PKAccessoryDeviceView setFrame:](v3, "setFrame:");

  [(PKAccessoryDeviceView *)v3 layoutIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  -[PKAccessoryDeviceExpressAlertViewController viewWillAppear:](&v16, sel_viewWillAppear_);
  if (!self->_passbookForegroundAssertion)
  {
    objc_super v5 = (void *)MEMORY[0x1E4F1E5E8];
    uint64_t v6 = PKPassKitCoreBundle();
    dispatch_time_t v7 = (CLInUseAssertion *)[v5 newAssertionForBundle:v6 withReason:@"Passbook displaying UI for field"];
    passbookForegroundAssertion = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = v7;
  }
  if (self->_notificationSuppressionAssertion)
  {
    if (!v3) {
      return;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    objc_super v9 = (void *)MEMORY[0x1E4F84508];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke;
    v13 = &unk_1E59D6CC8;
    objc_copyWeak(&v14, &location);
    [v9 acquireAssertionOfType:4 withReason:@"Contactless Interface" completion:&v10];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    if (!v3) {
      return;
    }
  }
  [(PKAccessoryDeviceExpressAlertViewController *)self _appearIfNecessary];
}

void __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
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
      id v7 = WeakRetained + 129;
      [WeakRetained[129] setInvalidationHandler:0];
      [*v7 invalidate];
      objc_storeStrong(v4 + 129, *(id *)(a1 + 32));
      id v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke_3;
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

void __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = (void *)WeakRetained[129];
    WeakRetained[129] = 0;
    objc_super v4 = WeakRetained;

    WeakRetained = v4;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  [(PKAccessoryDeviceExpressAlertViewController *)&v4 viewDidAppear:a3];
  [(PKAccessoryDeviceExpressAlertViewController *)self _appearIfNecessary];
  self->_processHomeButtonEvents = 1;
}

- (void)_appearIfNecessary
{
  if (!self->_appeared)
  {
    self->_appeared = 1;
    [(PKAccessoryDeviceView *)self->_accessoryDeviceView changeToState:self->_accessoryDeviceViewState];
    self->_presentedOnView = 1;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  [(PKAccessoryDeviceExpressAlertViewController *)&v11 viewDidDisappear:a3];
  passbookForegroundAssertion = self->_passbookForegroundAssertion;
  if (passbookForegroundAssertion)
  {
    uint64_t v5 = passbookForegroundAssertion;
    id v6 = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = 0;

    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E4F87460] * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PKAccessoryDeviceExpressAlertViewController_viewDidDisappear___block_invoke;
    block[3] = &unk_1E59CA7D0;
    id v10 = v5;
    id v8 = v5;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
  [(PKAccessoryDeviceExpressAlertViewController *)self _invalidate];
}

uint64_t __64__PKAccessoryDeviceExpressAlertViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)didInvalidateForRemoteAlert
{
  v3.receiver = self;
  v3.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  [(SBUIRemoteAlertServiceViewController *)&v3 didInvalidateForRemoteAlert];
  [(PKAccessoryDeviceExpressAlertViewController *)self _invalidate];
  [(PKAccessoryDeviceExpressAlertViewController *)self dismissViewControllerAnimated:0 completion:0];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  v53 = (void (**)(void))a4;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceExpressAlertViewController: configuring with context.", buf, 2u);
  }

  v55 = [(PKAccessoryDeviceExpressAlertViewController *)self _remoteViewControllerProxy];
  self->_deviceUILocked = PKDeviceUILocked() != 0;
  [v55 setWallpaperStyle:1 withDuration:0.0];
  [v55 setLaunchingInterfaceOrientation:1];
  [v55 setAllowsSiri:0];
  [v55 setDesiredHardwareButtonEvents:16];
  [v55 setSwipeDismissalStyle:1];
  [v55 setDismissalAnimationStyle:1];
  if (self->_deviceUILocked) {
    [v55 setDesiredAutoLockDuration:30.0];
  }
  dispatch_time_t v7 = [v52 userInfo];
  id v8 = [v7 valueForKey:*MEMORY[0x1E4F87948]];
  self->_presentationSource = [v8 integerValue];

  objc_super v9 = [v7 valueForKey:*MEMORY[0x1E4F878E0]];
  self->_backlightActive = [v9 BOOLValue];

  uint64_t v10 = *MEMORY[0x1E4F87950];
  objc_super v11 = [v7 objectForKey:*MEMORY[0x1E4F87950]];
  uint64_t v12 = (NSString *)[v11 copy];
  passUniqueIdentifier = self->_passUniqueIdentifier;
  self->_passUniqueIdentifier = v12;

  fieldProperties = self->_fieldProperties;
  self->_fieldProperties = 0;

  v54 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F878F8]];
  if (v54)
  {
    v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v54 error:0];
    objc_super v16 = self->_fieldProperties;
    self->_fieldProperties = v15;
  }
  if (self->_fieldProperties)
  {
    v17 = [v7 objectForKey:*MEMORY[0x1E4F878F0]];
    v18 = (NSArray *)[v17 copy];
    fieldPassUniqueIdentifiers = self->_fieldPassUniqueIdentifiers;
    self->_fieldPassUniqueIdentifiers = v18;
  }
  else
  {
    v17 = [v7 objectForKey:v10];
    v20 = (NSString *)[v17 copy];
    fieldPassUniqueIdentifiers = (NSArray *)self->_passUniqueIdentifier;
    self->_passUniqueIdentifier = v20;
  }

  NSUInteger v21 = [(NSArray *)self->_fieldPassUniqueIdentifiers count];
  v22 = [(UIViewController *)self pkui_frontMostViewController];
  uint64_t v23 = [v22 view];

  uint64_t v24 = *MEMORY[0x1E4F878C0];
  v51 = [v7 objectForKey:*MEMORY[0x1E4F878C0]];
  uint64_t v25 = *MEMORY[0x1E4F878C8];
  v50 = [v7 objectForKey:*MEMORY[0x1E4F878C8]];
  v26 = self->_passUniqueIdentifier;
  if (v26)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v66 = (NSArray *)v26;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceExpressAlertViewController: Single pass with PassuniqueID is %@", buf, 0xCu);
    }

    v27 = (void *)v23;
    v28 = (PKAccessoryDevice *)[objc_alloc(MEMORY[0x1E4F84198]) initWithDictionary:v51 endpointUUID:v50];
    accessoryDevice = self->_accessoryDevice;
    self->_accessoryDevice = v28;

    v30 = [MEMORY[0x1E4F84898] sharedInstance];
    v31 = [v30 passWithUniqueID:self->_passUniqueIdentifier];

    v32 = -[PKAccessoryDeviceView initWithPass:accessory:cutoutFrame:parentView:]([PKAccessoryDeviceView alloc], "initWithPass:accessory:cutoutFrame:parentView:", v31, self->_accessoryDevice, v23, self->_windowedAccessoryCutoutFrameInScreen.origin.x, self->_windowedAccessoryCutoutFrameInScreen.origin.y, self->_windowedAccessoryCutoutFrameInScreen.size.width, self->_windowedAccessoryCutoutFrameInScreen.size.height);
    accessoryDeviceView = self->_accessoryDeviceView;
    self->_accessoryDeviceView = v32;

    [(PKAccessoryDeviceView *)self->_accessoryDeviceView setDelegate:self];
    [(PKAccessoryDeviceView *)self->_accessoryDeviceView changeToState:self->_accessoryDeviceViewState];

LABEL_22:
    if (v53) {
      v53[2]();
    }
    [(PKAccessoryDeviceExpressAlertViewController *)self _dismissIfRestricted];
    goto LABEL_25;
  }
  v34 = self->_fieldPassUniqueIdentifiers;
  BOOL v35 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v34 || !v21)
  {
    v27 = (void *)v23;
    if (v35)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceExpressAlertViewController: No passuniqueIdentifiers OR fieldpassuniqueidentiers - error", buf, 2u);
    }

    id v43 = objc_alloc(MEMORY[0x1E4F84198]);
    v44 = [v7 objectForKey:v24];
    v45 = [v7 objectForKey:v25];
    v46 = (PKAccessoryDevice *)[v43 initWithDictionary:v44 endpointUUID:v45];
    v47 = self->_accessoryDevice;
    self->_accessoryDevice = v46;

    self->_accessoryDeviceViewState = 3;
    v48 = -[PKAccessoryDeviceView initWithState:accessory:cutoutFrame:parentView:]([PKAccessoryDeviceView alloc], "initWithState:accessory:cutoutFrame:parentView:", self->_accessoryDeviceViewState, self->_accessoryDevice, v23, self->_windowedAccessoryCutoutFrameInScreen.origin.x, self->_windowedAccessoryCutoutFrameInScreen.origin.y, self->_windowedAccessoryCutoutFrameInScreen.size.width, self->_windowedAccessoryCutoutFrameInScreen.size.height);
    v49 = self->_accessoryDeviceView;
    self->_accessoryDeviceView = v48;

    [(PKAccessoryDeviceView *)self->_accessoryDeviceView setDelegate:self];
    goto LABEL_22;
  }
  v27 = (void *)v23;
  if (v35)
  {
    *(_DWORD *)buf = 138412290;
    v66 = v34;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceExpressAlertViewController Multi Pass Case: Field IDs are %@", buf, 0xCu);
  }

  v36 = [(NSArray *)self->_fieldPassUniqueIdentifiers firstObject];
  v37 = [MEMORY[0x1E4F84898] sharedInstance];
  v38 = [v37 passWithUniqueID:v36];

  id v39 = objc_alloc_init(MEMORY[0x1E4F84740]);
  objc_initWeak((id *)buf, self);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __79__PKAccessoryDeviceExpressAlertViewController_configureWithContext_completion___block_invoke;
  v56[3] = &unk_1E59D8BA8;
  objc_copyWeak(&v64, (id *)buf);
  id v40 = v39;
  id v57 = v40;
  id v41 = v36;
  id v58 = v41;
  id v59 = v51;
  id v60 = v50;
  id v42 = v38;
  id v61 = v42;
  id v62 = v27;
  v63 = v53;
  [v40 reloadGroupsWithCompletion:v56];

  objc_destroyWeak(&v64);
  objc_destroyWeak((id *)buf);

LABEL_25:
}

void __79__PKAccessoryDeviceExpressAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    objc_super v3 = objc_msgSend(*(id *)(a1 + 32), "groupAtIndex:", objc_msgSend(*(id *)(a1 + 32), "groupIndexForPassUniqueID:", *(void *)(a1 + 40)));
    unint64_t v4 = [v3 passCount];
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      unint64_t v14 = v4;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceExpressAlertViewController: Passgroup has a count of %lu", (uint8_t *)&v13, 0xCu);
    }

    *((unsigned char *)WeakRetained + 1072) = v4 > 1;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F84198]) initWithDictionary:*(void *)(a1 + 48) endpointUUID:*(void *)(a1 + 56)];
    dispatch_time_t v7 = (void *)*((void *)WeakRetained + 138);
    *((void *)WeakRetained + 138) = v6;

    id v8 = -[PKAccessoryDeviceView initWithPass:accessory:cutoutFrame:parentView:]([PKAccessoryDeviceView alloc], "initWithPass:accessory:cutoutFrame:parentView:", *(void *)(a1 + 64), *((void *)WeakRetained + 138), *(void *)(a1 + 72), *((double *)WeakRetained + 140), *((double *)WeakRetained + 141), *((double *)WeakRetained + 142), *((double *)WeakRetained + 143));
    objc_super v9 = (void *)*((void *)WeakRetained + 137);
    *((void *)WeakRetained + 137) = v8;

    [*((id *)WeakRetained + 137) setDelegate:WeakRetained];
    if (*((unsigned char *)WeakRetained + 1072))
    {
      uint64_t v10 = [*(id *)(a1 + 64) provisioningCredentialHash];

      if (v10) {
        *((void *)WeakRetained + 135) = 2;
      }
    }
    [*((id *)WeakRetained + 137) changeToState:*((void *)WeakRetained + 135)];
    uint64_t v11 = *(void *)(a1 + 80);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
    [WeakRetained _dismissIfRestricted];
    if (*((unsigned char *)WeakRetained + 1072))
    {
      uint64_t v12 = [*(id *)(a1 + 64) provisioningCredentialHash];

      if (v12) {
        [WeakRetained _dismiss];
      }
    }
  }
}

- (void)_invalidate
{
  [(PKAssertion *)self->_notificationSuppressionAssertion invalidate];
  notificationSuppressionAssertion = self->_notificationSuppressionAssertion;
  self->_notificationSuppressionAssertion = 0;

  unint64_t v4 = [(PKAccessoryDeviceExpressAlertViewController *)self view];
  [v4 setUserInteractionEnabled:0];

  uint64_t v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v5, "pkui_resetSharedRootAuthenticationContext");

  id staticGlyphResources = self->_staticGlyphResources;
  self->_id staticGlyphResources = 0;

  lockButtonObserver = self->_lockButtonObserver;
  if (lockButtonObserver)
  {
    [(BSInvalidatable *)lockButtonObserver invalidate];
    id v8 = self->_lockButtonObserver;
    self->_lockButtonObserver = 0;
  }
  lockButtonAssertion = self->_lockButtonAssertion;
  if (lockButtonAssertion)
  {
    [(SBSAssertion *)lockButtonAssertion invalidate];
    uint64_t v10 = self->_lockButtonAssertion;
    self->_lockButtonAssertion = 0;
  }
  if (self->_brightnessRampingAllowed)
  {
    uint64_t v11 = +[PKBacklightController sharedInstance];
    [v11 endAllowingBacklightRamping:self];
  }
  id v12 = [(PKAccessoryDeviceExpressAlertViewController *)self _remoteViewControllerProxy];
  [v12 invalidate];
}

- (void)_dismissIfRestricted
{
  objc_super v3 = [(PKAccessoryDeviceExpressAlertViewController *)self _remoteViewControllerProxy];
  if (v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F61A48] sharedInstance];
    int v5 = [v4 lostModeIsActive];

    if (v5)
    {
      uint64_t v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)dispatch_time_t v7 = 0;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Dismissing Payment Interface due to Lost Mode", v7, 2u);
      }

      [(PKAccessoryDeviceExpressAlertViewController *)self _dismiss];
    }
  }
}

- (void)_dismissImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = 0;
  objc_super v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = *MEMORY[0x1E4FB2748];
  int v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke;
  v14[3] = &unk_1E59CB4B0;
  v14[4] = &v15;
  uint64_t v6 = [v5 beginBackgroundTaskWithExpirationHandler:v14];
  v16[3] = v6;

  objc_initWeak(&location, self);
  accessoryDeviceView = self->_accessoryDeviceView;
  if (v3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke_2;
    v11[3] = &unk_1E59D8BD0;
    id v8 = &v12;
    objc_copyWeak(&v12, &location);
    v11[4] = &v15;
    [(PKAccessoryDeviceView *)accessoryDeviceView dismissViewImmediatelyWithCompletion:v11];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke_3;
    v9[3] = &unk_1E59D8BD0;
    id v8 = &v10;
    objc_copyWeak(&v10, &location);
    void v9[4] = &v15;
    [(PKAccessoryDeviceView *)accessoryDeviceView dismissViewWithCompletion:v9];
  }
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);
}

void __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _invalidate];
    [v4 dismissViewControllerAnimated:0 completion:0];
    id WeakRetained = v4;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    id WeakRetained = v4;
  }
}

void __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _invalidate];
    [v4 dismissViewControllerAnimated:0 completion:0];
    id WeakRetained = v4;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    id WeakRetained = v4;
  }
}

- (void)_dismiss
{
}

- (void)handleButtonActions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (self->_processHomeButtonEvents)
  {
    [(PKAccessoryDeviceExpressAlertViewController *)self _dismiss];
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

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  if ([(PKAccessoryDevice *)self->_accessoryDevice isMock]
    && os_variant_has_internal_ui())
  {
    long long v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v14 = 0;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Overriding window because using mock device", v14, 2u);
    }

    long long v11 = [(PKAccessoryDeviceExpressAlertViewController *)self view];
    [v11 bounds];
    double v13 = v12;

    double width = v13 + -100.0;
    double x = 50.0;
    double y = 150.0;
    double height = 100.0;
    goto LABEL_7;
  }
  if (v8)
  {
LABEL_7:
    self->_windowedAccessoryCutoutFrameInScreen.origin.double x = x;
    self->_windowedAccessoryCutoutFrameInScreen.origin.double y = y;
    self->_windowedAccessoryCutoutFrameInScreen.size.double width = width;
    self->_windowedAccessoryCutoutFrameInScreen.size.double height = height;
    -[PKAccessoryDeviceView setCutoutFrame:](self->_accessoryDeviceView, "setCutoutFrame:", x, y, width, height);
    return;
  }

  [(PKAccessoryDeviceExpressAlertViewController *)self didDetachSleeveAccessory];
}

- (void)_paymentDidReceiveSuccessfulTransactionNotification:(id)a3
{
  BOOL v3 = [a3 userInfo];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKAccessoryDeviceExpressAlertViewController__paymentDidReceiveSuccessfulTransactionNotification___block_invoke;
  block[3] = &unk_1E59CA7D0;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __99__PKAccessoryDeviceExpressAlertViewController__paymentDidReceiveSuccessfulTransactionNotification___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "_paymentDidReceiveSuccessfulTransactionNotification USERINFO %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_contactlessInterfaceSessionDidAuthorize:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKAccessoryDeviceExpressAlertViewController__contactlessInterfaceSessionDidAuthorize___block_invoke;
  block[3] = &unk_1E59CA7D0;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__PKAccessoryDeviceExpressAlertViewController__contactlessInterfaceSessionDidAuthorize___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "_contactlessInterfaceSessionDidAuthorize USERINFO %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_contactlessInterfaceSessionFinishTransaction:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKAccessoryDeviceExpressAlertViewController__contactlessInterfaceSessionFinishTransaction___block_invoke;
  block[3] = &unk_1E59CA7D0;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __93__PKAccessoryDeviceExpressAlertViewController__contactlessInterfaceSessionFinishTransaction___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "_contactlessInterfaceSessionFinishTransaction USERINFO %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)_expressNotificationNames
{
  v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F871D8];
  v7[0] = *MEMORY[0x1E4F871D0];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F871C0];
  v7[2] = *MEMORY[0x1E4F871B8];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F871B0];
  v7[4] = *MEMORY[0x1E4F871C8];
  v7[5] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];

  return v5;
}

- (void)_registerObserverForNotificationName:(id)a3 center:(id)a4 handler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = [(NSMutableDictionary *)self->_registeredExpressObservers objectForKeyedSubscript:v11];
  if (!v10)
  {
    long long v10 = [v8 addObserverForName:v11 object:0 queue:0 usingBlock:v9];
    if (v10) {
      [(NSMutableDictionary *)self->_registeredExpressObservers setObject:v10 forKeyedSubscript:v11];
    }
  }
}

- (void)_registerForExpressTransactionNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  if (v3)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__PKAccessoryDeviceExpressAlertViewController__registerForExpressTransactionNotifications___block_invoke;
    aBlock[3] = &unk_1E59D8BF8;
    objc_copyWeak(&v26, &location);
    uint64_t v6 = _Block_copy(aBlock);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [(PKAccessoryDeviceExpressAlertViewController *)self _expressNotificationNames];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          [(PKAccessoryDeviceExpressAlertViewController *)self _registerObserverForNotificationName:*(void *)(*((void *)&v21 + 1) + 8 * i) center:v5 handler:v6];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v8);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = [(PKAccessoryDeviceExpressAlertViewController *)self _expressNotificationNames];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * j);
          objc_super v16 = [(NSMutableDictionary *)self->_registeredExpressObservers objectForKeyedSubscript:v15];
          if (v16)
          {
            [v5 removeObserver:v16];
            [(NSMutableDictionary *)self->_registeredExpressObservers removeObjectForKey:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v28 count:16];
      }
      while (v12);
    }
  }
}

void __91__PKAccessoryDeviceExpressAlertViewController__registerForExpressTransactionNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__PKAccessoryDeviceExpressAlertViewController__registerForExpressTransactionNotifications___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __91__PKAccessoryDeviceExpressAlertViewController__registerForExpressTransactionNotifications___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleExpressNotification:*(void *)(a1 + 32)];
}

- (void)_changeStateIfNecessaryTo:(int64_t)a3
{
  if (self->_accessoryDeviceViewState != a3)
  {
    self->_accessoryDeviceViewState = a3;
    -[PKAccessoryDeviceView changeToState:](self->_accessoryDeviceView, "changeToState:");
    if (a3 == 3)
    {
      SystemSoundID v4 = 1395;
    }
    else
    {
      if ((unint64_t)(a3 - 1) > 1) {
        return;
      }
      SystemSoundID v4 = 1394;
    }
    AudioServicesPlaySystemSound(v4);
  }
}

- (void)_handleExpressNotification:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  SystemSoundID v4 = [a3 name];
  uint64_t v5 = (void *)*MEMORY[0x1E4F871D0];
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_7;
  }
  uint64_t v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_11;
  }
  int v9 = [v6 isEqualToString:v7];

  if (v9)
  {
LABEL_7:
    long long v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Express Transaction has started (No Error)", v45, 2u);
    }

    id v11 = self;
    uint64_t v12 = 0;
    goto LABEL_41;
  }
LABEL_11:
  uint64_t v13 = (void *)*MEMORY[0x1E4F871D8];
  id v14 = v6;
  id v15 = v13;
  if (v14 == v15)
  {

    goto LABEL_17;
  }
  objc_super v16 = v15;
  if (!v6 || !v15)
  {

    goto LABEL_22;
  }
  int v17 = [v14 isEqualToString:v15];

  if (v17)
  {
LABEL_17:
    long long v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Express Transaction has timed out (No Error) per contract as documented in rdar://36255593 ([Emet] Mercury new express mode transaction events) will show check mark", v45, 2u);
    }

LABEL_20:
    id v11 = self;
    uint64_t v12 = 1;
LABEL_41:
    -[PKAccessoryDeviceExpressAlertViewController _changeStateIfNecessaryTo:](v11, "_changeStateIfNecessaryTo:", v12, *(void *)v45);
    goto LABEL_42;
  }
LABEL_22:
  long long v19 = (void *)*MEMORY[0x1E4F871C0];
  id v20 = v14;
  id v21 = v19;
  if (v20 == v21)
  {

    goto LABEL_28;
  }
  long long v22 = v21;
  if (!v6 || !v21)
  {

    goto LABEL_31;
  }
  int v23 = [v20 isEqualToString:v21];

  if (v23)
  {
LABEL_28:
    long long v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      uint64_t v25 = "Express Transaction has ended in failure (Error)";
LABEL_39:
      _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, v25, v45, 2u);
    }
LABEL_40:

    id v11 = self;
    uint64_t v12 = 3;
    goto LABEL_41;
  }
LABEL_31:
  id v26 = (void *)*MEMORY[0x1E4F871C8];
  id v27 = v20;
  id v28 = v26;
  if (v27 == v28)
  {

    goto LABEL_37;
  }
  v29 = v28;
  if (!v6 || !v28)
  {

    goto LABEL_44;
  }
  int v30 = [v27 isEqualToString:v28];

  if (v30)
  {
LABEL_37:
    long long v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      uint64_t v25 = "Express Transaction has ended due to being incompatible (Error)";
      goto LABEL_39;
    }
    goto LABEL_40;
  }
LABEL_44:
  v31 = (void *)*MEMORY[0x1E4F871B8];
  id v32 = v27;
  id v33 = v31;
  if (v32 == v33)
  {

    goto LABEL_50;
  }
  v34 = v33;
  if (!v6 || !v33)
  {

    goto LABEL_60;
  }
  int v35 = [v32 isEqualToString:v33];

  if (v35)
  {
LABEL_50:
    v36 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_19F450000, v36, OS_LOG_TYPE_DEFAULT, "Express Transaction has ended without incident (No Error)", v45, 2u);
    }

    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_hasMultiple) {
        v37 = @"True";
      }
      else {
        v37 = @"False";
      }
      *(_DWORD *)v45 = 138412290;
      *(void *)&v45[4] = v37;
      _os_log_impl(&dword_19F450000, v36, OS_LOG_TYPE_DEFAULT, "_handleExpressNotification: _hasMultiple is %@", v45, 0xCu);
    }

    if (self->_hasMultiple)
    {
      id v11 = self;
      uint64_t v12 = 2;
      goto LABEL_41;
    }
    goto LABEL_20;
  }
LABEL_60:
  v38 = (void *)*MEMORY[0x1E4F871B0];
  id v39 = v32;
  id v40 = v38;
  if (v39 == v40)
  {

LABEL_66:
    id v43 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = PKAccessoryDeviceViewStateToString(self->_accessoryDeviceViewState);
      *(_DWORD *)v45 = 138412290;
      *(void *)&v45[4] = v44;
      _os_log_impl(&dword_19F450000, v43, OS_LOG_TYPE_DEFAULT, "Express Transaction has exited (No Error) while the state is %@", v45, 0xCu);
    }
    if (self->_accessoryDeviceViewState) {
      [(PKAccessoryDeviceExpressAlertViewController *)self _dismiss];
    }
    goto LABEL_42;
  }
  id v41 = v40;
  if (!v6 || !v40)
  {

    goto LABEL_42;
  }
  int v42 = [v39 isEqualToString:v40];

  if (v42) {
    goto LABEL_66;
  }
LABEL_42:
}

- (void)accessoryDeviceDidChangeStateTo:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_accessoryDeviceViewState != a3)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = PKAccessoryDeviceViewStateToString(a3);
      id v7 = PKAccessoryDeviceViewStateToString(self->_accessoryDeviceViewState);
      int v8 = 138412546;
      int v9 = v6;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "accessoryDeviceDidChangeStateTo %@ and existing state is %@", (uint8_t *)&v8, 0x16u);
    }
    if (a3 == 3)
    {
      self->_accessoryDeviceViewState = 3;
      AudioServicesPlaySystemSound(0x573u);
      [(PKAccessoryDeviceExpressAlertViewController *)self _dismiss];
    }
  }
}

- (void)accessoryDeviceDidReachHardTimeout
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)SystemSoundID v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "accessoryDeviceDidReachHardTimeout Hard time out reached dismissing viewcontroller immediately", v4, 2u);
  }

  [(PKAccessoryDeviceExpressAlertViewController *)self _changeStateIfNecessaryTo:3];
  [(PKAccessoryDeviceExpressAlertViewController *)self _dismiss];
}

- (void)didAttachSleeveAccessory:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_accessoryDevice, a3);
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "/Library/Caches/com.apple.xbs/Sources/Wallet_PassKitUI/Framework/PKAccessoryDeviceExpressAlertViewController.m";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "%s - didAttachSleeveAccessory getting called with %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)didDetachSleeveAccessory
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = self->_accessoryDevice;
  accessoryDevice = self->_accessoryDevice;
  self->_accessoryDevice = 0;

  [(PKAccessoryDeviceExpressAlertViewController *)self _dismissImmediately:1];
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "/Library/Caches/com.apple.xbs/Sources/Wallet_PassKitUI/Framework/PKAccessoryDeviceExpressAlertViewController.m";
    __int16 v8 = 2112;
    __int16 v9 = v3;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "%s - didDetachSleeveAccessory getting called (and removing %@)", (uint8_t *)&v6, 0x16u);
  }
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  -[PKAccessoryDeviceExpressAlertViewController sizeForChildContentContainer:withParentContainerSize:](&v6, sel_sizeForChildContentContainer_withParentContainerSize_, a3, a4.width, a4.height);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
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
  return 0;
}

- (id)childViewControllerForStatusBarStyle
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldPassUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_fieldProperties, 0);
  objc_storeStrong((id *)&self->_accessoryDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_accessoryDevice, 0);
  objc_storeStrong((id *)&self->_accessoryDeviceView, 0);
  objc_storeStrong((id *)&self->_registeredExpressObservers, 0);
  objc_storeStrong((id *)&self->_passbookForegroundAssertion, 0);
  objc_storeStrong((id *)&self->_notificationSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_lockButtonAssertion, 0);
  objc_storeStrong((id *)&self->_lockButtonObserver, 0);
  objc_storeStrong(&self->_staticGlyphResources, 0);

  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end