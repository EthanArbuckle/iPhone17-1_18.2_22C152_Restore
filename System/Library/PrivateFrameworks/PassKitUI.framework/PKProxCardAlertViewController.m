@interface PKProxCardAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (id)_proxCardControllerForRequest:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKProxCardAlertViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKProxCardAlertViewController;
  [(PKProxCardAlertViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
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
  v4.super_class = (Class)PKProxCardAlertViewController;
  [(PKProxCardAlertViewController *)&v4 viewWillDisappear:a3];
  [(PKProxCardAlertViewController *)self _dismiss];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  objc_super v8 = [(PKProxCardAlertViewController *)self _remoteViewControllerProxy];
  [v8 setAllowsAlertItems:1];
  [v8 setAllowsSiri:0];
  [v8 setAllowsBanners:1];
  [v8 setDesiredHardwareButtonEvents:16];
  [v8 setSwipeDismissalStyle:0];
  [v8 setDismissalAnimationStyle:0];
  [v8 setWallpaperStyle:0 withDuration:0.0];
  [v8 setLaunchingInterfaceOrientation:1];
  if (v7) {
    v7[2](v7);
  }
  v9 = [v6 userInfo];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F87940]];

  v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:0];
  v12 = [(PKProxCardAlertViewController *)self _proxCardControllerForRequest:v11];
  if (v12)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__PKProxCardAlertViewController_configureWithContext_completion___block_invoke;
    v15[3] = &unk_1E59DBF58;
    v15[4] = self;
    v13 = [MEMORY[0x1E4F94218] actionWithTitle:&stru_1EF1B5B50 style:0 handler:v15];
    [v12 setDismissButtonAction:v13];

    id v14 = (id)[(PKProxCardAlertViewController *)self presentProxCardFlowWithDelegate:self initialViewController:v12];
  }
  else
  {
    [(PKProxCardAlertViewController *)self _dismiss];
  }
}

uint64_t __65__PKProxCardAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

- (void)_dismiss
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PKProxCardAlertViewController__dismiss__block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  v3 = (void (**)(void))_Block_copy(aBlock);
  objc_super v4 = [(PKProxCardAlertViewController *)self presentedViewController];
  if (v4) {
    [(PKProxCardAlertViewController *)self dismissViewControllerAnimated:1 completion:v3];
  }
  else {
    v3[2](v3);
  }
}

void __41__PKProxCardAlertViewController__dismiss__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 invalidate];
}

- (id)_proxCardControllerForRequest:(id)a3
{
  id v3 = a3;
  if ([v3 proxCardType] == 1)
  {
    id v4 = v3;
    v5 = [v4 supportedTerminal];
    uint64_t v6 = [v4 referralSource];

    v7 = [v5 vehicleInitiatedPairingLaunchURLWithReferralSource:v6];
    objc_super v8 = [[PKVehicleInitiatedPairingViewController alloc] initWithSupportedTerminal:v5 launchURL:v7 referralSource:v6 didDismiss:0];
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

@end