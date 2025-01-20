@interface PKAddPassesViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)canAddPasses;
- (BOOL)prefersStatusBarHidden;
- (BOOL)succeeded;
- (CGSize)preferredContentSize;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result;
- (PKAddPassesViewController)initWithIssuerData:(NSData *)issuerData signature:(NSData *)signature error:(NSError *)error;
- (PKAddPassesViewController)initWithPass:(PKPass *)pass;
- (PKAddPassesViewController)initWithPasses:(NSArray *)passes;
- (PKAddPassesViewController)initWithPasses:(id)a3 fromPresentationSource:(unint64_t)a4;
- (PKAddPassesViewController)initWithPassesContainer:(id)a3 fromPresentationSource:(unint64_t)a4;
- (id)_initWithPasses:(id)a3 orPassesContainer:(id)a4 orIssuerData:(id)a5 withSignature:(id)a6 fromPresentationSource:(unint64_t)a7 error:(id *)a8;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)delegate;
- (id)interactionControllerForPresentation:(id)a3;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applyRemoteViewController:(id)a3;
- (void)_aquireAssertions;
- (void)_handleCanceledPresentationWithPresentingViewController:(id)a3;
- (void)_ingestionDidFinishWithResult:(unint64_t)a3;
- (void)_requestRemoteViewController;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)delegate;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAddPassesViewController

+ (BOOL)canAddPasses
{
  v2 = [MEMORY[0x1E4F84898] sharedInstance];
  if (!PKIsPad())
  {
    int has_internal_ui = os_variant_has_internal_ui();
    char v5 = [v2 isPassbookVisible];
    if (has_internal_ui)
    {
      if ((v5 & 1) == 0 && ([v2 passbookHasBeenDeleted] & 1) == 0)
      {
        v6 = [MEMORY[0x1E4F28B50] mainBundle];
        v7 = [v6 bundleIdentifier];
        char v8 = [v7 isEqualToString:*MEMORY[0x1E4F878B8]];

        goto LABEL_13;
      }
    }
    else if ((v5 & 1) == 0)
    {
      char v3 = [v2 passbookHasBeenDeleted];
      goto LABEL_12;
    }
    char v8 = 1;
    goto LABEL_13;
  }
  if (_os_feature_enabled_impl())
  {
    char v3 = [v2 iPadSupportsPasses];
LABEL_12:
    char v8 = v3;
    goto LABEL_13;
  }
  char v8 = 0;
LABEL_13:

  return v8;
}

- (PKAddPassesViewController)initWithPass:(PKPass *)pass
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (pass)
  {
    v9 = pass;
    v4 = (void *)MEMORY[0x1E4F1C978];
    char v5 = pass;
    v6 = [v4 arrayWithObjects:&v9 count:1];

    self = -[PKAddPassesViewController initWithPasses:](self, "initWithPasses:", v6, v9, v10);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PKAddPassesViewController)initWithPasses:(NSArray *)passes
{
  return [(PKAddPassesViewController *)self initWithPasses:passes fromPresentationSource:0];
}

- (PKAddPassesViewController)initWithPasses:(id)a3 fromPresentationSource:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    self = (PKAddPassesViewController *)[(PKAddPassesViewController *)self _initWithPasses:v6 orPassesContainer:0 orIssuerData:0 withSignature:0 fromPresentationSource:a4 error:0];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PKAddPassesViewController)initWithPassesContainer:(id)a3 fromPresentationSource:(unint64_t)a4
{
  if (a3)
  {
    self = (PKAddPassesViewController *)[(PKAddPassesViewController *)self _initWithPasses:0 orPassesContainer:a3 orIssuerData:0 withSignature:0 fromPresentationSource:a4 error:0];
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (PKAddPassesViewController)initWithIssuerData:(NSData *)issuerData signature:(NSData *)signature error:(NSError *)error
{
  char v5 = 0;
  if (issuerData && signature)
  {
    self = (PKAddPassesViewController *)[(PKAddPassesViewController *)self _initWithPasses:0 orPassesContainer:0 orIssuerData:issuerData withSignature:signature fromPresentationSource:0 error:error];
    char v5 = self;
  }

  return v5;
}

- (id)_initWithPasses:(id)a3 orPassesContainer:(id)a4 orIssuerData:(id)a5 withSignature:(id)a6 fromPresentationSource:(unint64_t)a7 error:(id *)a8
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (!+[PKAddPassesViewController canAddPasses]) {
    goto LABEL_17;
  }
  v18 = [(PKAddPassesViewController *)self initWithNibName:0 bundle:0];
  self = v18;
  if (v18)
  {
    v18->_presentationSource = a7;
    if (v15)
    {
      objc_storeStrong((id *)&v18->_passesContainer, a4);
LABEL_8:
      [(PKAddPassesViewController *)self _aquireAssertions];
      v28 = [MEMORY[0x1E4F84898] sharedInstance];
      int v29 = [v28 passbookHasBeenDeleted];

      if (v29)
      {
        v30 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_19F450000, v30, OS_LOG_TYPE_DEFAULT, "Wallet deleted, prompting user to re-install Wallet", (uint8_t *)buf, 2u);
        }

        [(PKAddPassesViewController *)self setModalPresentationStyle:4];
        [(PKAddPassesViewController *)self setTransitioningDelegate:self];
        objc_initWeak(buf, self);
        v31 = objc_alloc_init(PKCancelingAnimatedTransitioningHandler);
        animatedTransitionHandler = self->_animatedTransitionHandler;
        self->_animatedTransitionHandler = v31;

        v33 = self->_animatedTransitionHandler;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __119__PKAddPassesViewController__initWithPasses_orPassesContainer_orIssuerData_withSignature_fromPresentationSource_error___block_invoke_85;
        v40[3] = &unk_1E59CBA68;
        objc_copyWeak(&v41, buf);
        [(PKCancelingAnimatedTransitioningHandler *)v33 setCancelationHandler:v40];
        objc_destroyWeak(&v41);
        objc_destroyWeak(buf);
      }
      else
      {
        [(PKAddPassesViewController *)self _requestRemoteViewController];
      }
      v45 = @"bundle";
      v34 = [MEMORY[0x1E4F28B50] mainBundle];
      v35 = [v34 PKSanitizedBundleIdentifier];
      v46[0] = v35;
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C10], v36);

      v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v37 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x1E4FB2738] object:0];
      [v37 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:0];

      goto LABEL_14;
    }
    if (v14)
    {
      v19 = (void *)MEMORY[0x1A6224460]();
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __119__PKAddPassesViewController__initWithPasses_orPassesContainer_orIssuerData_withSignature_fromPresentationSource_error___block_invoke;
      v43[3] = &unk_1E59CCBB0;
      id v44 = v20;
      id v21 = v20;
      [v14 enumerateObjectsUsingBlock:v43];
      v22 = (NSArray *)[v21 copy];
      passes = self->_passes;
      self->_passes = v22;

      goto LABEL_8;
    }
    v24 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedData:v17 options:0];
    signature = self->_signature;
    self->_signature = v24;

    v26 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedData:v16 options:0];
    issuerData = self->_issuerData;
    self->_issuerData = v26;

    if (PKValidateIssuerBindingData()) {
      goto LABEL_8;
    }
    if (a8)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:3 userInfo:0];
      v38 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_17:
    v38 = 0;
    goto LABEL_18;
  }
LABEL_14:
  self = self;
  v38 = self;
LABEL_18:

  return v38;
}

void __119__PKAddPassesViewController__initWithPasses_orPassesContainer_orIssuerData_withSignature_fromPresentationSource_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 archiveData];
  [v2 addObject:v3];
}

void __119__PKAddPassesViewController__initWithPasses_orPassesContainer_orIssuerData_withSignature_fromPresentationSource_error___block_invoke_85(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleCanceledPresentationWithPresentingViewController:v3];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PKAssertion *)self->_contactlessInterfaceAssertion invalidate];
  id v4 = (id)[(_UIAsyncInvocation *)self->_viewServiceCancelRequest invoke];
  [(PKRemoteAddPassesViewController *)self->_remoteViewController setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)PKAddPassesViewController;
  [(PKAddPassesViewController *)&v5 dealloc];
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v3 = [(_UIRemoteViewController *)self->_remoteViewController serviceViewControllerProxy];
  [v3 evaluateBrightness];
}

- (void)applicationWillResignActive:(id)a3
{
  id v3 = [(_UIRemoteViewController *)self->_remoteViewController serviceViewControllerProxy];
  [v3 resetBrightness];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAddPassesViewController;
  [(PKAddPassesViewController *)&v6 viewDidAppear:a3];
  if (self->_animatedTransitionHandler)
  {
    id v4 = [(PKAddPassesViewController *)self presentingViewController];
    [(PKAddPassesViewController *)self _handleCanceledPresentationWithPresentingViewController:v4];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__PKAddPassesViewController_viewDidAppear___block_invoke;
    v5[3] = &unk_1E59CA7D0;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v5 options:0 animations:0.4 completion:0.1];
  }
}

void __43__PKAddPassesViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  v1 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v2 setBackgroundColor:v1];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddPassesViewController;
  [(PKAddPassesViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKAddPassesViewController *)self view];
  id v4 = [(PKRemoteAddPassesViewController *)self->_remoteViewController view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  if (PKIsPad()) {
    return 16;
  }
  else {
    return 0;
  }
}

- (CGSize)preferredContentSize
{
  double v2 = 450.0;
  double v3 = 700.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  remoteViewController = self->_remoteViewController;
  if (remoteViewController) {
    return [(_UIRemoteViewController *)remoteViewController supportedInterfaceOrientations];
  }
  else {
    return 2;
  }
}

- (BOOL)prefersStatusBarHidden
{
  remoteViewController = self->_remoteViewController;
  if (remoteViewController) {
    LOBYTE(remoteViewController) = [(PKRemoteAddPassesViewController *)remoteViewController prefersStatusBarHidden];
  }
  return (char)remoteViewController;
}

- (int64_t)preferredStatusBarStyle
{
  int64_t result = (int64_t)self->_remoteViewController;
  if (result) {
    return [(id)result preferredStatusBarStyle];
  }
  return result;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_remoteViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_remoteViewController;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result
{
  if (self->_remoteViewController != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)PKAddPassesViewController;
    [(PKAddPassesViewController *)&v4 sizeForChildContentContainer:result.width withParentContainerSize:result.height];
  }
  return result;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)_requestRemoteViewController
{
  viewServiceCancelRequest = self->_viewServiceCancelRequest;
  if (viewServiceCancelRequest)
  {
    id v4 = (id)[(_UIAsyncInvocation *)viewServiceCancelRequest invoke];
    objc_super v5 = self->_viewServiceCancelRequest;
    self->_viewServiceCancelRequest = 0;
  }
  [(PKAddPassesViewController *)self _beginDelayingPresentation:0 cancellationHandler:10.0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PKAddPassesViewController__requestRemoteViewController__block_invoke;
  aBlock[3] = &unk_1E59CCBD8;
  aBlock[4] = self;
  objc_super v6 = _Block_copy(aBlock);
  v7 = +[_UIRemoteViewController requestViewController:@"PKServiceAddPassesViewController" fromServiceWithBundleIdentifier:@"com.apple.PassbookUIService" connectionHandler:v6];
  char v8 = self->_viewServiceCancelRequest;
  self->_viewServiceCancelRequest = v7;
}

void __57__PKAddPassesViewController__requestRemoteViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  char v8 = *(void **)(v7 + 984);
  *(void *)(v7 + 984) = 0;

  if (v5)
  {
    [*(id *)(a1 + 32) _applyRemoteViewController:v5];
  }
  else
  {
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v6;
      _os_log_error_impl(&dword_19F450000, v9, OS_LOG_TYPE_ERROR, "Connection to PassbookUIService failed: %{public}@", (uint8_t *)&v14, 0xCu);
    }

    [*(id *)(a1 + 32) _endDelayingPresentation];
    [*(id *)(a1 + 32) _ingestionDidFinishWithResult:0];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 1032);
  *(void *)(v10 + 1032) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 1056);
  *(void *)(v12 + 1056) = 0;
}

- (void)_applyRemoteViewController:(id)a3
{
  id v4 = (PKRemoteAddPassesViewController *)a3;
  viewServiceCancelRequest = self->_viewServiceCancelRequest;
  if (viewServiceCancelRequest)
  {
    id v6 = (id)[(_UIAsyncInvocation *)viewServiceCancelRequest invoke];
    uint64_t v7 = self->_viewServiceCancelRequest;
    self->_viewServiceCancelRequest = 0;
  }
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = v4;
  v9 = v4;

  id v23 = [(PKRemoteAddPassesViewController *)self->_remoteViewController view];
  uint64_t v10 = [(PKAddPassesViewController *)self view];
  [(PKAddPassesViewController *)self addChildViewController:self->_remoteViewController];
  v11 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v10 setBackgroundColor:v11];

  [v10 addSubview:v23];
  [v10 setNeedsLayout];
  [v10 layoutIfNeeded];
  [(_UIRemoteViewController *)self->_remoteViewController didMoveToParentViewController:self];
  uint64_t v12 = self->_remoteViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(PKRemoteAddPassesViewController *)v12 setDelegate:WeakRetained];

  int v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
  id v15 = [(_UIRemoteViewController *)v9 serviceViewControllerProxy];
  uint64_t v16 = [v14 fixedCoordinateSpace];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  [v14 scale];
  objc_msgSend(v15, "setDisplayPropertiesWithScreenSize:scale:", v18, v20, v21);

  v22 = [(_UIRemoteViewController *)v9 serviceViewControllerProxy];
  [v22 ingestPasses:self->_passes orPassesContainer:self->_passesContainer orIssuerData:self->_issuerData withSignature:self->_signature fromPresentationSource:self->_presentationSource];

  [(PKAddPassesViewController *)self _endDelayingPresentation];
  [(PKAddPassesViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(PKAddPassesViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)_ingestionDidFinishWithResult:(unint64_t)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  uint64_t v6 = [(PKAddPassesViewController *)self delegate];
  uint64_t v7 = (void *)v6;
  if (a3 == 1) {
    self->_succeeded = 1;
  }
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v7 addPassesViewControllerDidFinish:self];
  }
  else
  {
    char v8 = [(PKAddPassesViewController *)self presentingViewController];

    if (v8)
    {
      v9 = [(PKAddPassesViewController *)self presentingViewController];
      [v9 dismissViewControllerAnimated:1 completion:0];
    }
    else
    {
      v9 = [(PKAddPassesViewController *)self navigationController];
      id v10 = (id)[v9 popViewControllerAnimated:1];
    }
  }
  v11 = (void **)MEMORY[0x1E4F85C20];
  if (a3 != 1) {
    v11 = (void **)MEMORY[0x1E4F85C18];
  }
  uint64_t v12 = *v11;
  double v18 = @"bundle";
  v13 = (void *)MEMORY[0x1E4F28B50];
  id v14 = v12;
  id v15 = [v13 mainBundle];
  uint64_t v16 = [v15 PKSanitizedBundleIdentifier];
  v19[0] = v16;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  MEMORY[0x1A6220EC0](v14, v17);
}

- (void)setDelegate:(id)delegate
{
  if (self->_remoteViewController) {
    [(PKRemoteAddPassesViewController *)self->_remoteViewController setDelegate:delegate];
  }
  else {
    objc_storeWeak((id *)&self->_delegate, delegate);
  }
}

- (id)delegate
{
  if (self->_remoteViewController)
  {
    id WeakRetained = [(PKRemoteAddPassesViewController *)self->_remoteViewController delegate];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }

  return WeakRetained;
}

- (void)_handleCanceledPresentationWithPresentingViewController:(id)a3
{
  animatedTransitionHandler = self->_animatedTransitionHandler;
  self->_animatedTransitionHandler = 0;
  id v5 = a3;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  uint64_t v6 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2;
  v15[3] = &unk_1E59CAA98;
  id v7 = v6;
  id v16 = v7;
  char v8 = PKCreateAlertControllerForWalletUninstalled(v15);
  v9 = objc_msgSend(v5, "pkui_frontMostViewController");

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4;
  v12[3] = &unk_1E59CAD18;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  [v9 presentViewController:v11 animated:1 completion:v12];
}

uint64_t __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ingestionDidFinishWithResult:0];
}

void __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3;
  block[3] = &unk_1E59CAA98;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__PKAddPassesViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) presentingViewController];

  if (!v2)
  {
    double v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Failed to present download wallet alert!", v4, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_aquireAssertions
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__PKAddPassesViewController__aquireAssertions__block_invoke;
  v2[3] = &unk_1E59CCC00;
  v2[4] = self;
  [MEMORY[0x1E4F84508] acquireAssertionOfType:0 withReason:@"Add Passes View Controller" completion:v2];
}

void __46__PKAddPassesViewController__aquireAssertions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PKAddPassesViewController__aquireAssertions__block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __46__PKAddPassesViewController__aquireAssertions__block_invoke_2(uint64_t a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1000), v2);
    objc_initWeak(location, *(id *)(a1 + 32));
    double v3 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__PKAddPassesViewController__aquireAssertions__block_invoke_3;
    v6[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v7, location);
    [v3 setInvalidationHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(location);
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 48);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Error Acquiring Assertion for Add Passes View Controller: %@", (uint8_t *)location, 0xCu);
    }
  }
}

void __46__PKAddPassesViewController__aquireAssertions__block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Assertion Invalidated: %@", (uint8_t *)&v4, 0xCu);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passesContainer, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_issuerData, 0);
  objc_storeStrong((id *)&self->_passes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animatedTransitionHandler, 0);
  objc_storeStrong((id *)&self->_contactlessInterfaceAssertion, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_storeStrong((id *)&self->_viewServiceCancelRequest, 0);
}

@end