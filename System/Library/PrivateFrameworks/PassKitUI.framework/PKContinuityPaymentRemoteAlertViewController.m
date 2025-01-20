@interface PKContinuityPaymentRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result;
- (PKContinuityPaymentRemoteAlertViewController)init;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelPayment;
- (void)_dismiss;
- (void)_invalidate;
- (void)_presentEnrollAccessibilityIntentAlert;
- (void)authorizationDidAuthorizePayment:(id)a3;
- (void)authorizationDidFinishWithError:(id)a3;
- (void)authorizationWillStart;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didInvalidateForRemoteAlert;
- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3;
- (void)didReceivePaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceivePaymentResult:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKContinuityPaymentRemoteAlertViewController

- (PKContinuityPaymentRemoteAlertViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  v2 = [(PKContinuityPaymentRemoteAlertViewController *)&v6 init];
  if (v2)
  {
    v3 = (PKContinuityPaymentService *)objc_alloc_init(MEMORY[0x1E4F84600]);
    continuityService = v2->_continuityService;
    v2->_continuityService = v3;

    [(PKContinuityPaymentService *)v2->_continuityService setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(PKContinuityPaymentViewController *)self->_continuityViewController setDelegate:0];
  [(PKContinuityPaymentService *)self->_continuityService setDelegate:0];
  [(PKContinuityPaymentRemoteAlertViewController *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  [(SBUIRemoteAlertServiceViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  [(PKContinuityPaymentRemoteAlertViewController *)&v6 viewDidLoad];
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_super v3 = [NSNumber numberWithFloat:0.0];
  [v2 setStatusBarHeightOverride:v3];

  v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Did load continuity payment alert controller", v5, 2u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKContinuityPaymentRemoteAlertViewController *)self _cancelPayment];
  v5.receiver = self;
  v5.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  [(PKContinuityPaymentRemoteAlertViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  [(PKContinuityPaymentRemoteAlertViewController *)&v3 viewDidAppear:a3];
  AudioServicesPlaySystemSoundWithCompletion(0x487u, 0);
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result
{
  if (self->_navigationController != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
    [(PKContinuityPaymentRemoteAlertViewController *)&v4 sizeForChildContentContainer:result.width withParentContainerSize:result.height];
  }
  return result;
}

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
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

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)didInvalidateForRemoteAlert
{
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  [(SBUIRemoteAlertServiceViewController *)&v3 didInvalidateForRemoteAlert];
  [(PKContinuityPaymentRemoteAlertViewController *)self _invalidate];
  [(PKContinuityPaymentRemoteAlertViewController *)self dismissViewControllerAnimated:0 completion:0];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  objc_super v6 = (void (**)(void))a4;
  v7 = [a3 userInfo];
  v8 = [(PKContinuityPaymentRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v8 setAllowsAlertItems:1];
  [v8 setAllowsSiri:0];
  [v8 setAllowsBanners:1];
  if (!-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))[v8 setLaunchingInterfaceOrientation:1]; {
  [v8 setWallpaperStyle:1 withDuration:0.0];
  }
  if (PKDeviceUILocked()) {
    [v8 setWallpaperTunnelActive:1];
  }
  [v8 setDesiredHardwareButtonEvents:16];
  [v8 setSwipeDismissalStyle:0];
  [v8 setDismissalAnimationStyle:1];
  if (v6) {
    v6[2](v6);
  }
  v9 = [v7 objectForKey:@"remotePaymentRequest"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v9)
    {
      v10 = (PKRemotePaymentRequest *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v9 error:0];
      if (v10)
      {
        v11 = v10;
        v12 = [(PKRemotePaymentRequest *)v10 decodeTopLevelObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8] error:0];
        remoteRequest = self->_remoteRequest;
        self->_remoteRequest = v12;

        [(PKRemotePaymentRequest *)v11 finishDecoding];
        goto LABEL_15;
      }
    }
  }
  else
  {

    v9 = 0;
  }
  v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Could not initialize unarchiver with remotePaymentRequest.", v21, 2u);
  }

  v11 = self->_remoteRequest;
  self->_remoteRequest = 0;
LABEL_15:

  if (self->_remoteRequest)
  {
    if ([MEMORY[0x1E4F88108] userIntentStyle] == -1)
    {
      [(PKContinuityPaymentRemoteAlertViewController *)self _cancelPayment];
      [(PKContinuityPaymentRemoteAlertViewController *)self _presentEnrollAccessibilityIntentAlert];
    }
    else
    {
      v15 = [[PKContinuityPaymentViewController alloc] initWithRemotePaymentRequest:self->_remoteRequest];
      continuityViewController = self->_continuityViewController;
      self->_continuityViewController = v15;

      [(PKContinuityPaymentViewController *)self->_continuityViewController setDelegate:self];
      v17 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
      navigationController = self->_navigationController;
      self->_navigationController = v17;

      [(UINavigationController *)self->_navigationController setModalPresentationStyle:6];
      [(UINavigationController *)self->_navigationController setModalInPresentation:1];
      v19 = self->_navigationController;
      v22[0] = self->_continuityViewController;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      [(UINavigationController *)v19 setViewControllers:v20];

      [(PKContinuityPaymentRemoteAlertViewController *)self presentViewController:self->_navigationController animated:1 completion:&__block_literal_global_250];
    }
  }
  else
  {
    [(PKContinuityPaymentRemoteAlertViewController *)self _dismiss];
  }
}

void __80__PKContinuityPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke()
{
  v0 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19F450000, v0, OS_LOG_TYPE_DEFAULT, "Presented continuity view controller", v1, 2u);
  }
}

- (void)handleButtonActions:(id)a3
{
  if (!self->_hasAuthorizedPayment) {
    [(PKContinuityPaymentRemoteAlertViewController *)self _cancelPayment];
  }

  [(PKContinuityPaymentRemoteAlertViewController *)self _dismiss];
}

- (void)_invalidate
{
}

- (void)_dismiss
{
  objc_super v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v3, "pkui_resetSharedRootAuthenticationContext");

  [(PKContinuityPaymentRemoteAlertViewController *)self _invalidate];
  objc_super v4 = [(PKContinuityPaymentRemoteAlertViewController *)self presentedViewController];
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__PKContinuityPaymentRemoteAlertViewController__dismiss__block_invoke;
    v6[3] = &unk_1E59CA7D0;
    v6[4] = self;
    [(PKContinuityPaymentRemoteAlertViewController *)self dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    objc_super v5 = [(PKContinuityPaymentRemoteAlertViewController *)self _remoteViewControllerProxy];
    [v5 invalidate];
  }
}

void __56__PKContinuityPaymentRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 invalidate];
}

- (void)_cancelPayment
{
  if (!self->_hasSentCancelPaymentRequest)
  {
    self->_hasSentCancelPaymentRequest = 1;
    remoteRequest = self->_remoteRequest;
    if (remoteRequest) {
      [(PKContinuityPaymentService *)self->_continuityService cancelRemotePaymentRequest:remoteRequest completion:0];
    }
  }
}

- (void)_presentEnrollAccessibilityIntentAlert
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKContinuityPaymentRemoteAlertViewController__presentEnrollAccessibilityIntentAlert__block_invoke;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v9, &location);
  objc_super v3 = _Block_copy(aBlock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__PKContinuityPaymentRemoteAlertViewController__presentEnrollAccessibilityIntentAlert__block_invoke_2;
  v6[3] = &unk_1E59DA350;
  objc_copyWeak(&v7, &location);
  objc_super v4 = _Block_copy(v6);
  AccesibilityIntentUnavailable = PKAlertCreateAccesibilityIntentUnavailable(v3, v4);
  [(PKContinuityPaymentRemoteAlertViewController *)self presentViewController:AccesibilityIntentUnavailable animated:1 completion:0];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __86__PKContinuityPaymentRemoteAlertViewController__presentEnrollAccessibilityIntentAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _dismiss];
    id WeakRetained = v2;
  }
}

void __86__PKContinuityPaymentRemoteAlertViewController__presentEnrollAccessibilityIntentAlert__block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _dismiss];
    id v6 = objc_alloc_init(MEMORY[0x1E4F224A0]);
    [v6 setSensitive:1];
    uint64_t v8 = *MEMORY[0x1E4F62688];
    v9[0] = MEMORY[0x1E4F1CC38];
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v6 setFrontBoardOptions:v7];

    PKOpenApplication(v3, v6);
  }
}

- (void)didReceivePaymentResult:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__PKContinuityPaymentRemoteAlertViewController_didReceivePaymentResult_forRemotePaymentRequest___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __96__PKContinuityPaymentRemoteAlertViewController_didReceivePaymentResult_forRemotePaymentRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) authorizationDidAuthorizePaymentCompleteWithResult:*(void *)(a1 + 40)];
}

- (void)didReceivePaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PKContinuityPaymentRemoteAlertViewController_didReceivePaymentClientUpdate_forRemotePaymentRequest___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __102__PKContinuityPaymentRemoteAlertViewController_didReceivePaymentClientUpdate_forRemotePaymentRequest___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  id v3 = [*(id *)(a1[5] + 984) remoteRequest];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    uint64_t v4 = a1[6];
    id v5 = *(void **)(a1[5] + 984);
    [v5 updatePaymentWithClientUpdate:v4];
  }
}

- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__PKContinuityPaymentRemoteAlertViewController_didReceiveCancellationForRemotePaymentRequest___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __94__PKContinuityPaymentRemoteAlertViewController_didReceiveCancellationForRemotePaymentRequest___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 984) remoteRequest];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    id v4 = *(void **)(a1 + 40);
    [v4 _dismiss];
  }
}

- (void)authorizationWillStart
{
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Authorization will start", v3, 2u);
  }
}

- (void)authorizationDidFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Authorization did finish with error", v6, 2u);
  }

  if (!self->_hasAuthorizedPayment) {
    [(PKContinuityPaymentRemoteAlertViewController *)self _cancelPayment];
  }
  [(PKContinuityPaymentRemoteAlertViewController *)self _dismiss];
}

- (void)authorizationDidAuthorizePayment:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Authorization did authorize payment", v6, 2u);
  }

  if (!self->_hasSentCancelPaymentRequest)
  {
    self->_hasAuthorizedPayment = 1;
    [(PKContinuityPaymentService *)self->_continuityService sendPayment:v4 forRemotePaymentRequest:self->_remoteRequest completion:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuityService, 0);
  objc_storeStrong((id *)&self->_remoteRequest, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_storeStrong((id *)&self->_continuityViewController, 0);
}

@end