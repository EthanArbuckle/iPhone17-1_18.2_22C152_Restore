@interface PKPeerPaymentTermsAndConditionsRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (PKPeerPaymentTermsAndConditionsRemoteAlertViewController)init;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPeerPaymentTermsAndConditionsRemoteAlertViewController

- (PKPeerPaymentTermsAndConditionsRemoteAlertViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentTermsAndConditionsRemoteAlertViewController;
  return [(PKPeerPaymentTermsAndConditionsRemoteAlertViewController *)&v3 init];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentTermsAndConditionsRemoteAlertViewController;
  [(PKPeerPaymentTermsAndConditionsRemoteAlertViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
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
  v3.super_class = (Class)PKPeerPaymentTermsAndConditionsRemoteAlertViewController;
  [(PKPeerPaymentTermsAndConditionsRemoteAlertViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentTermsAndConditionsRemoteAlertViewController;
  [(PKPeerPaymentTermsAndConditionsRemoteAlertViewController *)&v4 viewWillDisappear:a3];
  [(PKPeerPaymentTermsAndConditionsRemoteAlertViewController *)self _dismiss];
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
  v23 = v6;
  objc_super v8 = [v6 userInfo];
  v9 = [(PKPeerPaymentTermsAndConditionsRemoteAlertViewController *)self _remoteViewControllerProxy];
  uint64_t v10 = 1;
  [v9 setAllowsAlertItems:1];
  [v9 setAllowsSiri:0];
  [v9 setAllowsBanners:1];
  [v9 setDesiredHardwareButtonEvents:16];
  [v9 setSwipeDismissalStyle:0];
  [v9 setDismissalAnimationStyle:1];
  [v9 setWallpaperStyle:0 withDuration:0.0];
  v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F87910]];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    if (!v11) {
      goto LABEL_5;
    }
    uint64_t v10 = [v11 integerValue];
  }
  [v9 setLaunchingInterfaceOrientation:v10];
LABEL_5:
  v21 = v11;
  if (v7) {
    v7[2](v7);
  }
  v12 = (void *)MEMORY[0x1E4F1CB10];
  v13 = objc_msgSend(v8, "objectForKey:", @"termsURL", v21);
  v14 = [v12 URLWithString:v13];

  v15 = [v8 objectForKey:@"termsIdentifier"];
  v16 = [v8 objectForKey:@"passUniqueID"];
  v17 = [MEMORY[0x1E4F84E10] sharedService];
  v18 = [[PKPeerPaymentTermsController alloc] initWithTermsURL:v14 termsIdentifier:v15 passUniqueID:v16 webService:v17];
  termsController = self->_termsController;
  self->_termsController = v18;

  objc_initWeak(&location, self);
  v20 = self->_termsController;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __92__PKPeerPaymentTermsAndConditionsRemoteAlertViewController_configureWithContext_completion___block_invoke;
  v24[3] = &unk_1E59CC670;
  objc_copyWeak(&v25, &location);
  [(PKPeerPaymentTermsController *)v20 presentTermsOverController:self showInterstitialViewController:1 withCompletionHandler:v24];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __92__PKPeerPaymentTermsAndConditionsRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((unint64_t)(a2 - 1) <= 1 && WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _dismiss];
    id WeakRetained = v4;
  }
}

- (void)_dismiss
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68__PKPeerPaymentTermsAndConditionsRemoteAlertViewController__dismiss__block_invoke;
  v2[3] = &unk_1E59CA7D0;
  v2[4] = self;
  [(PKPeerPaymentTermsAndConditionsRemoteAlertViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

void __68__PKPeerPaymentTermsAndConditionsRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
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