@interface PKPaymentSetupRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (PKPaymentSetupRemoteAlertViewController)init;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss;
- (void)appProtectionCoordinatorDidGainAccess;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)paymentSetupDidFinish:(id)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPaymentSetupRemoteAlertViewController

- (PKPaymentSetupRemoteAlertViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupRemoteAlertViewController;
  v2 = [(PKPaymentSetupRemoteAlertViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F843E8] shared];
    appProtectionCoordinator = v2->_appProtectionCoordinator;
    v2->_appProtectionCoordinator = (PKAppProtectionCoordinator *)v3;

    [(PKAppProtectionCoordinator *)v2->_appProtectionCoordinator registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(PKAppProtectionCoordinator *)self->_appProtectionCoordinator unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupRemoteAlertViewController;
  [(SBUIRemoteAlertServiceViewController *)&v3 dealloc];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupRemoteAlertViewController;
  [(PKPaymentSetupRemoteAlertViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    [v6 bounds];
    v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    PKSetDisplayProperties();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupRemoteAlertViewController;
  [(PKPaymentSetupRemoteAlertViewController *)&v4 viewWillDisappear:a3];
  [(PKPaymentSetupRemoteAlertViewController *)self _dismiss];
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v32 = v6;
  objc_super v8 = [v6 userInfo];
  v9 = [(PKPaymentSetupRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v9 setAllowsAlertItems:1];
  [v9 setAllowsAlertStacking:1];
  [v9 setAllowsSiri:0];
  [v9 setAllowsBanners:1];
  [v9 setDesiredHardwareButtonEvents:16];
  [v9 setSwipeDismissalStyle:0];
  [v9 setDismissalAnimationStyle:1];
  [v9 setWallpaperStyle:0 withDuration:0.0];
  v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F87910]];
  v11 = v10;
  if (v10) {
    objc_msgSend(v9, "setLaunchingInterfaceOrientation:", objc_msgSend(v10, "integerValue"));
  }
  if (v7) {
    v7[2](v7);
  }
  v31 = v8;
  v30 = [v8 objectForKey:@"paymentSetupRequest"];
  v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v30 error:0];
  v13 = [v12 paymentSetupFeatures];
  int v14 = objc_msgSend(v13, "pk_containsObjectPassingTest:", &__block_literal_global_23);

  if (v14) {
    uint64_t v15 = 4;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F84BB8]);
  v17 = [MEMORY[0x1E4F84D50] sharedService];
  v18 = (void *)[v16 initWithWebService:v17 paymentSetupRequest:v12];

  v19 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v18 context:8];
  [(PKPaymentSetupNavigationController *)v19 setModalInPresentation:1];
  [(PKPaymentSetupNavigationController *)v19 setSetupDelegate:self];
  [(PKPaymentSetupNavigationController *)v19 setPaymentSetupMode:v15];
  id v20 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [v20 setModalPresentationStyle:16];
    v21 = [v20 view];
    v22 = [v21 layer];
    [v22 setMasksToBounds:1];

    v23 = [v20 view];
    v24 = [v23 layer];
    [v24 setCornerRadius:6.0];
  }
  else
  {
    [v20 setModalPresentationStyle:3];
  }
  [v20 addChildViewController:v19];
  v25 = [v20 view];
  v26 = [(PKPaymentSetupNavigationController *)v19 view];
  [v25 addSubview:v26];

  [v20 didMoveToParentViewController:v19];
  objc_initWeak(&location, self);
  appProtectionCoordinator = self->_appProtectionCoordinator;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __75__PKPaymentSetupRemoteAlertViewController_configureWithContext_completion___block_invoke_2;
  v33[3] = &unk_1E59CCC78;
  objc_copyWeak(&v36, &location);
  id v28 = v20;
  id v34 = v28;
  v29 = v19;
  v35 = v29;
  [(PKAppProtectionCoordinator *)appProtectionCoordinator isShieldRequiredWithCompletion:v33];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

BOOL __75__PKPaymentSetupRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] != 0;
}

void __75__PKPaymentSetupRemoteAlertViewController_configureWithContext_completion___block_invoke_2(id *a1, int a2)
{
  objc_super v4 = a1 + 6;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (a2)
    {
      id v6 = objc_alloc_init(PKAppProtectionShieldConfiguration);
      [(PKAppProtectionShieldConfiguration *)v6 setShieldType:1];
      [(PKAppProtectionShieldConfiguration *)v6 setDelegate:WeakRetained];
      [(PKAppProtectionShieldConfiguration *)v6 setShowDismiss:1];
      uint64_t v7 = +[PKAppProtectionShieldViewController createShieldViewControllerWithConfiguration:v6];
      id v8 = WeakRetained[123];
      WeakRetained[123] = (id)v7;

      if (WeakRetained[123])
      {
        objc_msgSend(a1[4], "addChildViewController:");
        v9 = [a1[4] view];
        v10 = [WeakRetained[123] view];
        [v9 addSubview:v10];

        [WeakRetained[123] didMoveToParentViewController:a1[4]];
        v11 = [a1[5] view];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __75__PKPaymentSetupRemoteAlertViewController_configureWithContext_completion___block_invoke_3;
        v12[3] = &unk_1E59CCC50;
        objc_copyWeak(&v13, v4);
        [v11 setAccessibilityElementsHiddenBlock:v12];

        objc_destroyWeak(&v13);
      }
    }
    [WeakRetained presentViewController:a1[4] animated:1 completion:0];
  }
}

BOOL __75__PKPaymentSetupRemoteAlertViewController_configureWithContext_completion___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    BOOL v2 = WeakRetained[123] != 0;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)paymentSetupDidFinish:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);

  [(PKPaymentSetupRemoteAlertViewController *)self _dismiss];
}

- (void)appProtectionCoordinatorDidGainAccess
{
  shieldViewController = self->_shieldViewController;
  if (shieldViewController)
  {
    objc_super v4 = [(UIViewController *)shieldViewController view];
    [v4 removeFromSuperview];

    [(UIViewController *)self->_shieldViewController removeFromParentViewController];
    v5 = self->_shieldViewController;
    self->_shieldViewController = 0;
  }
}

- (void)_dismiss
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentSetupRemoteAlertViewController__dismiss__block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  objc_super v3 = (void (**)(void))_Block_copy(aBlock);
  objc_super v4 = [(PKPaymentSetupRemoteAlertViewController *)self presentedViewController];
  if (v4) {
    [(PKPaymentSetupRemoteAlertViewController *)self dismissViewControllerAnimated:1 completion:v3];
  }
  else {
    v3[2](v3);
  }
}

void __51__PKPaymentSetupRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 invalidate];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProtectionCoordinator, 0);

  objc_storeStrong((id *)&self->_shieldViewController, 0);
}

@end