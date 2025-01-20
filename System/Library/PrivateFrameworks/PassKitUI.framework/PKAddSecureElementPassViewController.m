@interface PKAddSecureElementPassViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)canAddSecureElementPassWithConfiguration:(PKAddSecureElementPassConfiguration *)configuration;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result;
- (PKAddSecureElementPassViewController)initWithCoder:(id)a3;
- (PKAddSecureElementPassViewController)initWithConfiguration:(PKAddSecureElementPassConfiguration *)configuration delegate:(id)delegate;
- (PKAddSecureElementPassViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)delegate;
- (id)interactionControllerForPresentation:(id)a3;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_handleCanceledPresentationWithPresentingViewController:(id)a3;
- (void)dealloc;
- (void)didFinishWithPass:(id)a3 error:(id)a4;
- (void)didFinishWithPasses:(id)a3 error:(id)a4;
- (void)loadRemoteViewController;
- (void)loadView;
- (void)setDelegate:(id)delegate;
- (void)setRemoteVC:(id)a3 completionHandler:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAddSecureElementPassViewController

+ (BOOL)canAddSecureElementPassWithConfiguration:(PKAddSecureElementPassConfiguration *)configuration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = configuration;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F84898] sharedInstance];
    v6 = v5;
    if (v5)
    {
      char v7 = [v5 canAddSecureElementPassWithConfiguration:v4];
    }
    else
    {
      v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = NSStringFromSelector(a2);
        int v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Failed to initialize pass library in %@", (uint8_t *)&v11, 0xCu);
      }
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (PKAddSecureElementPassViewController)initWithConfiguration:(PKAddSecureElementPassConfiguration *)configuration delegate:(id)delegate
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  char v7 = configuration;
  id v8 = delegate;
  v9 = SecTaskCreateFromSelf(0);
  if (!v9) {
    goto LABEL_17;
  }
  v10 = v9;
  id v11 = (id)SecTaskCopyValueForEntitlement(v9, (CFStringRef)*MEMORY[0x1E4F87D18], 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v12 = [v11 BOOLValue];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CFRelease(v10);

      goto LABEL_17;
    }
    id v11 = v11;
    if ([v11 containsObject:@"carkey"])
    {

      CFRelease(v10);
      goto LABEL_10;
    }
    char v12 = [v11 containsObject:@"shareablecredential"];
  }
  CFRelease(v10);

  if ((v12 & 1) == 0)
  {
LABEL_17:
    v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = [MEMORY[0x1E4F28B50] mainBundle];
      v25 = [v24 bundleIdentifier];
      uint64_t v26 = *MEMORY[0x1E4F87D18];
      *(_DWORD *)buf = 138543618;
      v33 = v25;
      __int16 v34 = 2114;
      uint64_t v35 = v26;
      _os_log_error_impl(&dword_19F450000, v21, OS_LOG_TYPE_ERROR, "%{public}@ missing entitlement: %{public}@", buf, 0x16u);
    }
    goto LABEL_19;
  }
LABEL_10:
  if (!v7)
  {
    v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v27 = [MEMORY[0x1E4F28B50] mainBundle];
      v28 = [v27 bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      v33 = v28;
      _os_log_error_impl(&dword_19F450000, v21, OS_LOG_TYPE_ERROR, "%{public}@ missing configuration parameter", buf, 0xCu);
    }
    goto LABEL_19;
  }
  if (([(PKAddSecureElementPassConfiguration *)v7 hasRequiredDataForProvisioning] & 1) == 0)
  {
    v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v7;
      _os_log_error_impl(&dword_19F450000, v21, OS_LOG_TYPE_ERROR, "%{public}@ does not have required data for provisioning", buf, 0xCu);
    }
LABEL_19:

    v22 = 0;
    goto LABEL_20;
  }
  v31.receiver = self;
  v31.super_class = (Class)PKAddSecureElementPassViewController;
  uint64_t v13 = [(PKAddSecureElementPassViewController *)&v31 initWithNibName:0 bundle:0];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_configuration, configuration);
    objc_storeWeak((id *)&v14->_delegate, v8);
    v15 = [MEMORY[0x1E4F84898] sharedInstance];
    int v16 = [v15 passbookHasBeenDeleted];

    if (v16)
    {
      v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Wallet deleted, prompting user to re-install Wallet", buf, 2u);
      }

      [(PKAddSecureElementPassViewController *)v14 setModalPresentationStyle:4];
      [(PKAddSecureElementPassViewController *)v14 setTransitioningDelegate:v14];
      objc_initWeak((id *)buf, v14);
      v18 = objc_alloc_init(PKCancelingAnimatedTransitioningHandler);
      animatedTransitionHandler = v14->_animatedTransitionHandler;
      v14->_animatedTransitionHandler = v18;

      v20 = v14->_animatedTransitionHandler;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __71__PKAddSecureElementPassViewController_initWithConfiguration_delegate___block_invoke;
      v29[3] = &unk_1E59CBA68;
      objc_copyWeak(&v30, (id *)buf);
      [(PKCancelingAnimatedTransitioningHandler *)v20 setCancelationHandler:v29];
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(PKAddSecureElementPassViewController *)v14 loadRemoteViewController];
    }
  }
  self = v14;
  v22 = self;
LABEL_20:

  return v22;
}

void __71__PKAddSecureElementPassViewController_initWithConfiguration_delegate___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleCanceledPresentationWithPresentingViewController:v3];
}

- (PKAddSecureElementPassViewController)initWithCoder:(id)a3
{
  return 0;
}

- (PKAddSecureElementPassViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
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
  v6.super_class = (Class)PKAddSecureElementPassViewController;
  [(PKAddSecureElementPassViewController *)&v6 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddSecureElementPassViewController;
  [(PKAddSecureElementPassViewController *)&v5 viewDidAppear:a3];
  if (self->_animatedTransitionHandler)
  {
    id v4 = [(PKAddSecureElementPassViewController *)self presentingViewController];
    [(PKAddSecureElementPassViewController *)self _handleCanceledPresentationWithPresentingViewController:v4];
  }
}

- (void)loadRemoteViewController
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKAddSecureElementPassConfiguration *)self->_configuration configurationType];
  if (v3 == 1)
  {
    objc_super v5 = @"PKSubcredentialProvisioningServiceViewController";
    goto LABEL_9;
  }
  if (v3 == 4 || v3 == 2)
  {
    objc_super v5 = @"PKPushableCredentialsNavigationController";
LABEL_9:
    objc_initWeak(location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke;
    v14[3] = &unk_1E59CF6D0;
    v14[4] = self;
    [(PKAddSecureElementPassViewController *)self _beginDelayingPresentation:v14 cancellationHandler:10.0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke_91;
    v12[3] = &unk_1E59CF6F8;
    v12[4] = self;
    objc_copyWeak(&v13, location);
    objc_super v6 = +[_UIRemoteViewController requestViewController:v5 fromServiceWithBundleIdentifier:@"com.apple.PassbookUIService" connectionHandler:v12];
    remoteVCRequest = self->_remoteVCRequest;
    self->_remoteVCRequest = v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
    return;
  }
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = configuration;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Unknown view controller class for configuration: %@", (uint8_t *)location, 0xCu);
  }

  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:0 userInfo:0];
  [(PKAddSecureElementPassViewController *)self didFinishWithPasses:0 error:v11];
}

uint64_t __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v7 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Timed out while presenting add pass view controller", v7, 2u);
  }

  id v5 = (id)[*(id *)(*(void *)(a1 + 32) + 1000) invoke];
  return a2 ^ 1u;
}

void __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke_91(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 1000);
  *(void *)(v7 + 1000) = 0;

  if (!v5 || v6)
  {
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Failed to load remote view controller: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _endDelayingPresentation];
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:0 userInfo:0];
    [*(id *)(a1 + 32) didFinishWithPasses:0 error:v11];
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke_2;
    v12[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    [v9 setRemoteVC:v5 completionHandler:v12];
    objc_destroyWeak(&v13);
  }
}

void __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endDelayingPresentation];
}

- (void)setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  [(PKAddSecureElementPassViewController *)self addChildViewController:self->_remoteVC];
  v9 = [(PKRemoteAddSecureElementPassViewController *)self->_remoteVC view];
  v10 = [(PKAddSecureElementPassViewController *)self view];
  [v10 addSubview:v9];
  [v10 setNeedsLayout];
  [v10 layoutIfNeeded];
  [(_UIRemoteViewController *)self->_remoteVC didMoveToParentViewController:self];
  [(PKAddSecureElementPassViewController *)self setNeedsStatusBarAppearanceUpdate];
  remoteVC = self->_remoteVC;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke;
  v24[3] = &unk_1E59CC620;
  char v12 = (void (**)(void))v8;
  id v25 = v12;
  id v13 = [(_UIRemoteViewController *)remoteVC serviceViewControllerProxyWithErrorHandler:v24];
  if (v13)
  {
    v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    id v15 = [v14 fixedCoordinateSpace];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;
    [v14 scale];
    objc_msgSend(v13, "setDisplayPropertiesWithScreenSize:scale:", v17, v19, v20);

    configuration = self->_configuration;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_3;
    v22[3] = &unk_1E59CAA98;
    v23 = v12;
    [v13 setConfiguration:configuration completionHandler:v22];
  }
  else if (v12)
  {
    v12[2](v12);
  }
}

void __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_2;
    block[3] = &unk_1E59CAA98;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_4;
    block[3] = &unk_1E59CAA98;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didFinishWithPass:(id)a3 error:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v10 count:1];

  -[PKAddSecureElementPassViewController didFinishWithPasses:error:](self, "didFinishWithPasses:error:", v9, v7, v10, v11);
}

- (void)didFinishWithPasses:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  char v9 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_finished, (unsigned __int8 *)&v9, 1u);
  if (v9)
  {
    id WeakRetained = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_19F450000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Error: didFinishWithPasses:error: called twice", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v7)
    {

      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v8;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Adding secure element passes finished with error: %@", (uint8_t *)&v16, 0xCu);
      }
      id v6 = 0;
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Adding secure element passes finished with passes: %@", (uint8_t *)&v16, 0xCu);
      }
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained) {
      goto LABEL_17;
    }
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained addSecureElementPassViewController:self didFinishAddingSecureElementPasses:v6 error:v8];
      goto LABEL_20;
    }
    if (objc_opt_respondsToSelector())
    {
      char v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "User is using deprecated delegate method.", (uint8_t *)&v16, 2u);
      }

      id v13 = [v6 objectAtIndexedSubscript:0];
      [WeakRetained addSecureElementPassViewController:self didFinishAddingSecureElementPass:v13 error:v8];
    }
    else
    {
LABEL_17:
      v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Delegate not set, dismissing add secure element passes view controller.", (uint8_t *)&v16, 2u);
      }

      id v15 = [(PKAddSecureElementPassViewController *)self presentingViewController];
      [v15 dismissViewControllerAnimated:1 completion:0];
    }
  }
LABEL_20:
}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
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
    v4.super_class = (Class)PKAddSecureElementPassViewController;
    [(PKAddSecureElementPassViewController *)&v4 sizeForChildContentContainer:result.width withParentContainerSize:result.height];
  }
  return result;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddSecureElementPassViewController;
  [(PKAddSecureElementPassViewController *)&v5 loadView];
  id v3 = [(PKAddSecureElementPassViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddSecureElementPassViewController;
  [(PKAddSecureElementPassViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKAddSecureElementPassViewController *)self view];
  objc_super v4 = [(PKRemoteAddSecureElementPassViewController *)self->_remoteVC view];
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
  aBlock[2] = __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  id v6 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2;
  v15[3] = &unk_1E59CAA98;
  id v7 = v6;
  id v16 = v7;
  id v8 = PKCreateAlertControllerForWalletUninstalled(v15);
  char v9 = objc_msgSend(v5, "pkui_frontMostViewController");

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4;
  v12[3] = &unk_1E59CAD18;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  [v9 presentViewController:v11 animated:1 completion:v12];
}

void __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:0 userInfo:0];
  [*(id *)(a1 + 32) didFinishWithPasses:0 error:v2];
}

void __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3;
  block[3] = &unk_1E59CAA98;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4(uint64_t a1)
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
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteVC, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
  objc_storeStrong((id *)&self->_animatedTransitionHandler, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end