@interface PKAddPaymentPassViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)canAddPaymentPass;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result;
- (PKAddPaymentPassViewController)initWithCoder:(id)a3;
- (PKAddPaymentPassViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PKAddPaymentPassViewController)initWithRequestConfiguration:(PKAddPaymentPassRequestConfiguration *)configuration delegate:(id)delegate;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)delegate;
- (id)interactionControllerForPresentation:(id)a3;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_handleCanceledPresentationWithPresentingViewController:(id)a3;
- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)loadRemoteViewController;
- (void)loadView;
- (void)setDelegate:(id)delegate;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAddPaymentPassViewController

+ (BOOL)canAddPaymentPass
{
  v2 = [MEMORY[0x1E4F84898] sharedInstanceWithRemoteLibrary];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F843B8]) initWithType:5];
  char v4 = [v2 canAddSecureElementPassWithConfiguration:v3];

  return v4;
}

- (PKAddPaymentPassViewController)initWithCoder:(id)a3
{
  return 0;
}

- (PKAddPaymentPassViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PKAddPaymentPassViewController)initWithRequestConfiguration:(PKAddPaymentPassRequestConfiguration *)configuration delegate:(id)delegate
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v7 = configuration;
  id v8 = delegate;
  v9 = SecTaskCreateFromSelf(0);
  if (v9)
  {
    v10 = v9;
    v11 = (void *)SecTaskCopyValueForEntitlement(v9, (CFStringRef)*MEMORY[0x1E4F85C00], 0);
    char v12 = [v11 BOOLValue];
    CFRelease(v10);
  }
  else
  {
    char v12 = 1;
  }
  v13 = [(PKAddPaymentPassRequestConfiguration *)v7 cardholderName];
  if (v13
    || ([(PKAddPaymentPassRequestConfiguration *)v7 primaryAccountSuffix],
        (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v24 = [(PKAddPaymentPassRequestConfiguration *)v7 cardDetails];
    uint64_t v25 = [v24 count];

    if (!v25) {
      goto LABEL_18;
    }
  }
  v14 = [(PKAddPaymentPassRequestConfiguration *)v7 encryptionScheme];
  if (v14) {
    char v15 = v12;
  }
  else {
    char v15 = 0;
  }

  if (v15)
  {
    v32.receiver = self;
    v32.super_class = (Class)PKAddPaymentPassViewController;
    v16 = [(PKAddPaymentPassViewController *)&v32 initWithNibName:0 bundle:0];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_configuration, configuration);
      objc_storeWeak((id *)&v17->_delegate, v8);
      v18 = [MEMORY[0x1E4F84898] sharedInstance];
      int v19 = [v18 passbookHasBeenDeleted];

      if (v19)
      {
        v20 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "Wallet deleted, prompting user to re-install Wallet", buf, 2u);
        }

        [(PKAddPaymentPassViewController *)v17 setModalPresentationStyle:4];
        [(PKAddPaymentPassViewController *)v17 setTransitioningDelegate:v17];
        objc_initWeak((id *)buf, v17);
        v21 = objc_alloc_init(PKCancelingAnimatedTransitioningHandler);
        animatedTransitionHandler = v17->_animatedTransitionHandler;
        v17->_animatedTransitionHandler = v21;

        v23 = v17->_animatedTransitionHandler;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __72__PKAddPaymentPassViewController_initWithRequestConfiguration_delegate___block_invoke;
        v30[3] = &unk_1E59CBA68;
        objc_copyWeak(&v31, (id *)buf);
        [(PKCancelingAnimatedTransitioningHandler *)v23 setCancelationHandler:v30];
        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        [(PKAddPaymentPassViewController *)v17 loadRemoteViewController];
      }
    }
    goto LABEL_23;
  }
LABEL_18:

  if ((v12 & 1) == 0)
  {
    v26 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v28 = [MEMORY[0x1E4F28B50] mainBundle];
      v29 = [v28 bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      v34 = v29;
      _os_log_error_impl(&dword_19F450000, v26, OS_LOG_TYPE_ERROR, "%{public}@ missing entitlement: com.apple.developer.payment-pass-provisioning", buf, 0xCu);
    }
  }
  v17 = 0;
LABEL_23:

  return v17;
}

void __72__PKAddPaymentPassViewController_initWithRequestConfiguration_delegate___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleCanceledPresentationWithPresentingViewController:v3];
}

- (void)dealloc
{
  remoteVCRequest = self->_remoteVCRequest;
  if (remoteVCRequest)
  {
    id v4 = (id)[(_UIAsyncInvocation *)remoteVCRequest invoke];
    v5 = self->_remoteVCRequest;
    self->_remoteVCRequest = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)PKAddPaymentPassViewController;
  [(PKAddPaymentPassViewController *)&v6 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddPaymentPassViewController;
  [(PKAddPaymentPassViewController *)&v5 viewDidAppear:a3];
  if (self->_animatedTransitionHandler)
  {
    id v4 = [(PKAddPaymentPassViewController *)self presentingViewController];
    [(PKAddPaymentPassViewController *)self _handleCanceledPresentationWithPresentingViewController:v4];
  }
}

- (void)loadRemoteViewController
{
  objc_initWeak(&location, self);
  [(PKAddPaymentPassViewController *)self _beginDelayingPresentation:0 cancellationHandler:10.0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PKAddPaymentPassViewController_loadRemoteViewController__block_invoke;
  v5[3] = &unk_1E59CC5F8;
  objc_copyWeak(&v6, &location);
  id v3 = +[_UIRemoteViewController requestViewController:@"PKServiceAddPaymentPassViewController" fromServiceWithBundleIdentifier:@"com.apple.PassbookUIService" connectionHandler:v5];
  remoteVCRequest = self->_remoteVCRequest;
  self->_remoteVCRequest = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__PKAddPaymentPassViewController_loadRemoteViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)*((void *)WeakRetained + 124);
    *((void *)WeakRetained + 124) = 0;

    if (v5)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__PKAddPaymentPassViewController_loadRemoteViewController__block_invoke_2;
      v14[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v15, v7);
      [v9 _setRemoteVC:v5 completionHandler:v14];
      objc_destroyWeak(&v15);
    }
    else
    {
      [v9 _endDelayingPresentation];
      if (v6)
      {
        uint64_t v16 = *MEMORY[0x1E4F28A50];
        v17[0] = v6;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      }
      else
      {
        v11 = 0;
      }
      char v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:2 userInfo:v11];
      v13 = [v9 delegate];
      [v13 addPaymentPassViewController:v9 didFinishAddingPaymentPass:0 error:v12];
    }
  }
}

void __58__PKAddPaymentPassViewController_loadRemoteViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _endDelayingPresentation];
    id WeakRetained = v2;
  }
}

- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  remoteVC = self->_remoteVC;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(PKRemoteAddPaymentPassViewController *)remoteVC setDelegate:WeakRetained];

  objc_storeWeak((id *)&self->_delegate, 0);
  [(PKAddPaymentPassViewController *)self addChildViewController:self->_remoteVC];
  v11 = [(PKRemoteAddPaymentPassViewController *)self->_remoteVC view];
  char v12 = [(PKAddPaymentPassViewController *)self view];
  [v12 addSubview:v11];
  [v12 setNeedsLayout];
  [v12 layoutIfNeeded];
  [(_UIRemoteViewController *)self->_remoteVC didMoveToParentViewController:self];
  [(PKAddPaymentPassViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(PKAddPaymentPassViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  v13 = self->_remoteVC;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke;
  v26[3] = &unk_1E59CC620;
  v14 = (void (**)(void))v8;
  id v27 = v14;
  id v15 = [(_UIRemoteViewController *)v13 serviceViewControllerProxyWithErrorHandler:v26];
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v17 = [v16 fixedCoordinateSpace];
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;
    [v16 scale];
    objc_msgSend(v15, "setDisplayPropertiesWithScreenSize:scale:", v19, v21, v22);

    configuration = self->_configuration;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_3;
    v24[3] = &unk_1E59CAA98;
    uint64_t v25 = v14;
    [v15 setConfiguration:configuration completionHandler:v24];
  }
  else if (v14)
  {
    v14[2](v14);
  }
}

void __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_2;
    block[3] = &unk_1E59CAA98;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_4;
    block[3] = &unk_1E59CAA98;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    return 16;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  remoteVC = self->_remoteVC;
  if (remoteVC) {
    return [(_UIRemoteViewController *)remoteVC supportedInterfaceOrientations];
  }
  else {
    return 2;
  }
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_remoteVC;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_remoteVC;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result
{
  if (self->_remoteVC != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)PKAddPaymentPassViewController;
    [(PKAddPaymentPassViewController *)&v4 sizeForChildContentContainer:result.width withParentContainerSize:result.height];
  }
  return result;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddPaymentPassViewController;
  [(PKAddPaymentPassViewController *)&v5 loadView];
  id v3 = [(PKAddPaymentPassViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddPaymentPassViewController;
  [(PKAddPaymentPassViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKAddPaymentPassViewController *)self view];
  objc_super v4 = [(PKRemoteAddPaymentPassViewController *)self->_remoteVC view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)_handleCanceledPresentationWithPresentingViewController:(id)a3
{
  animatedTransitionHandler = self->_animatedTransitionHandler;
  self->_animatedTransitionHandler = 0;
  id v5 = a3;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  id v6 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2;
  v15[3] = &unk_1E59CAA98;
  id v7 = v6;
  id v16 = v7;
  id v8 = PKCreateAlertControllerForWalletUninstalled(v15);
  v9 = objc_msgSend(v5, "pkui_frontMostViewController");

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4;
  v12[3] = &unk_1E59CAD18;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  [v9 presentViewController:v11 animated:1 completion:v12];
}

void __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:2 userInfo:0];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 addPaymentPassViewController:*(void *)(a1 + 32) didFinishAddingPaymentPass:0 error:v3];
}

void __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3;
  block[3] = &unk_1E59CAA98;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) presentingViewController];

  if (!v2)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Failed to present download wallet alert!", v4, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return self->_animatedTransitionHandler;
}

- (id)interactionControllerForPresentation:(id)a3
{
  return self->_animatedTransitionHandler;
}

- (id)delegate
{
  if (self->_remoteVC)
  {
    id WeakRetained = [(PKRemoteAddPaymentPassViewController *)self->_remoteVC delegate];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
  if (self->_remoteVC) {
    [(PKRemoteAddPaymentPassViewController *)self->_remoteVC setDelegate:delegate];
  }
  else {
    objc_storeWeak((id *)&self->_delegate, delegate);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedTransitionHandler, 0);
  objc_storeStrong((id *)&self->_remoteVC, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end