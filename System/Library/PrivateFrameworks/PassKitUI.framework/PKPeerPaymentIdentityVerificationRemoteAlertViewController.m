@interface PKPeerPaymentIdentityVerificationRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (id)_alertViewController;
- (id)pk_navigationController;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPeerPaymentIdentityVerificationRemoteAlertViewController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentIdentityVerificationRemoteAlertViewController;
  [(PKPeerPaymentIdentityVerificationRemoteAlertViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    [v6 bounds];
    v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    PKSetDisplayProperties();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentIdentityVerificationRemoteAlertViewController;
  [(PKPeerPaymentIdentityVerificationRemoteAlertViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentIdentityVerificationRemoteAlertViewController;
  [(PKPeerPaymentIdentityVerificationRemoteAlertViewController *)&v4 viewWillDisappear:a3];
  [(PKPeerPaymentIdentityVerificationRemoteAlertViewController *)self _dismiss];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  id v7 = a3;
  objc_super v8 = [(PKPeerPaymentIdentityVerificationRemoteAlertViewController *)self _remoteViewControllerProxy];
  v9 = [v7 userInfo];

  uint64_t v10 = 1;
  [v8 setAllowsAlertItems:1];
  [v8 setAllowsBanners:1];
  [v8 setAllowsSiri:0];
  [v8 setDesiredHardwareButtonEvents:16];
  [v8 setSwipeDismissalStyle:0];
  [v8 setDismissalAnimationStyle:1];
  [v8 setWallpaperStyle:0 withDuration:0.0];
  v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F87910]];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    if (!v11) {
      goto LABEL_5;
    }
    uint64_t v10 = [v11 integerValue];
  }
  [v8 setLaunchingInterfaceOrientation:v10];
LABEL_5:
  v12 = [MEMORY[0x1E4F84E10] sharedService];
  webService = self->_webService;
  self->_webService = v12;

  v14 = [v9 objectForKey:*MEMORY[0x1E4F87958]];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F84DA8]) initWithData:v14];
  v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v15;
    _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Creating remote view controller for PKPeerPaymentIdentityVerificationResponse: %@", buf, 0xCu);
  }

  if (v6) {
    v6[2](v6);
  }
  v17 = [[PKPeerPaymentIdentityVerificationController alloc] initWithPeerPaymentWebService:self->_webService identityVerificationResponse:v15 setupDelegate:self hideInitialSplashScreen:0 context:0];
  controller = self->_controller;
  self->_controller = v17;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__PKPeerPaymentIdentityVerificationRemoteAlertViewController_configureWithContext_completion___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __94__PKPeerPaymentIdentityVerificationRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 984) firstViewController];
  if (PKDeviceSupportsPeerPaymentIdentityVerification())
  {
    objc_super v3 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_super v4 = objc_msgSend(*(id *)(a1 + 32), "pk_navigationController");
      [v4 pushViewController:v2 animated:0];

      [*(id *)(a1 + 32) presentViewController:*(void *)(*(void *)(a1 + 32) + 992) animated:1 completion:0];
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) _alertViewController];
      [v3 presentViewController:v6 animated:1 completion:0];
    }
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __94__PKPeerPaymentIdentityVerificationRemoteAlertViewController_configureWithContext_completion___block_invoke_2;
    v7[3] = &unk_1E59CA7D0;
    v7[4] = *(void *)(a1 + 32);
    v5 = PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(v7);
    [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
  }
}

void __94__PKPeerPaymentIdentityVerificationRemoteAlertViewController_configureWithContext_completion___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 invalidate];
}

- (id)pk_navigationController
{
  navController = self->_navController;
  if (!navController)
  {
    objc_super v4 = objc_alloc_init(PKNavigationController);
    v5 = self->_navController;
    self->_navController = v4;

    [(PKNavigationController *)self->_navController setSupportedInterfaceOrientations:2];
    [(PKNavigationController *)self->_navController setModalInPresentation:1];
    navController = self->_navController;
  }

  return navController;
}

- (void)handleButtonActions:(id)a3
{
  id v4 = [(PKPeerPaymentIdentityVerificationController *)self->_controller captureController];
  if (v4 && [v4 state] == 5) {
    [v4 userWantsToCancel];
  }
  else {
    [(PKPeerPaymentIdentityVerificationRemoteAlertViewController *)self _dismiss];
  }
}

- (void)_dismiss
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __70__PKPeerPaymentIdentityVerificationRemoteAlertViewController__dismiss__block_invoke;
  v2[3] = &unk_1E59CA7D0;
  v2[4] = self;
  [(PKPeerPaymentIdentityVerificationRemoteAlertViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

void __70__PKPeerPaymentIdentityVerificationRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 invalidate];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (id)_alertViewController
{
  objc_super v3 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_18.isa);
  id v4 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_19.isa);
  v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v3 message:v4 preferredStyle:1];
  id v6 = (void *)MEMORY[0x1E4FB1410];
  id v7 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PKPeerPaymentIdentityVerificationRemoteAlertViewController__alertViewController__block_invoke;
  v10[3] = &unk_1E59CB1F0;
  v10[4] = self;
  objc_super v8 = [v6 actionWithTitle:v7 style:0 handler:v10];
  [v5 addAction:v8];

  return v5;
}

void __82__PKPeerPaymentIdentityVerificationRemoteAlertViewController__alertViewController__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_navController, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end