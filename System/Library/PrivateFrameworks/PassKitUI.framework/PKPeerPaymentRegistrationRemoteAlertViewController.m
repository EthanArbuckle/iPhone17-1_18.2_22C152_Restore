@interface PKPeerPaymentRegistrationRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPeerPaymentRegistrationRemoteAlertViewController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentRegistrationRemoteAlertViewController;
  [(PKPeerPaymentRegistrationRemoteAlertViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
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
  v3.super_class = (Class)PKPeerPaymentRegistrationRemoteAlertViewController;
  [(PKPeerPaymentRegistrationRemoteAlertViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentRegistrationRemoteAlertViewController;
  [(PKPeerPaymentRegistrationRemoteAlertViewController *)&v4 viewWillDisappear:a3];
  [(PKPeerPaymentRegistrationRemoteAlertViewController *)self _dismiss];
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
  objc_super v8 = [v6 userInfo];
  v9 = [(PKPeerPaymentRegistrationRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v9 setAllowsAlertItems:1];
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
  v12 = [[PKPeerPaymentRegistrationFlowController alloc] initWithUserInfo:v8 setupDelegate:self];
  flowController = self->_flowController;
  self->_flowController = v12;

  objc_initWeak(&location, self);
  v14 = self->_flowController;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__PKPeerPaymentRegistrationRemoteAlertViewController_configureWithContext_completion___block_invoke;
  v15[3] = &unk_1E59CBA68;
  objc_copyWeak(&v16, &location);
  [(PKPeerPaymentRegistrationFlowController *)v14 preflightWithCompletion:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __86__PKPeerPaymentRegistrationRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4 && WeakRetained) {
    [WeakRetained presentViewController:v4 animated:1 completion:0];
  }
}

- (void)_dismiss
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__PKPeerPaymentRegistrationRemoteAlertViewController__dismiss__block_invoke;
  v2[3] = &unk_1E59CA7D0;
  v2[4] = self;
  [(PKPeerPaymentRegistrationRemoteAlertViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

void __62__PKPeerPaymentRegistrationRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
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
}

@end