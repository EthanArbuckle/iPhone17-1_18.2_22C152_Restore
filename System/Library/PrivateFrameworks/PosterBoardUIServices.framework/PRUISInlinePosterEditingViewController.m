@interface PRUISInlinePosterEditingViewController
- (BOOL)_isPresentingRemoteOrLocalEditingUI;
- (BOOL)prefersStatusBarHidden;
- (FBSDisplayConfiguration)displayConfiguration;
- (PRUISInlinePosterEditingViewController)initWithEntryPoint:(id)a3;
- (PRUISInlinePosterEditingViewControllerDelegate)delegate;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (unint64_t)supportedInterfaceOrientations;
- (void)_getEditingViewControllerIfPossible;
- (void)_shared_didDismissWithResponse:(id)a3;
- (void)_shared_willDismissWithResponse:(id)a3;
- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4;
- (void)modalRemoteViewController:(id)a3 willDismissWithResponse:(id)a4;
- (void)sendRequestDismissalAction;
- (void)setDelegate:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)viewDidLoad;
@end

@implementation PRUISInlinePosterEditingViewController

- (PRUISInlinePosterEditingViewController)initWithEntryPoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISInlinePosterEditingViewController;
  v6 = [(PRUISInlinePosterEditingViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entryPoint, a3);
  }

  return v7;
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    [(PRUISModalRemoteViewController *)self->_fallbackViewController setDisplayConfiguration:v5];
  }
}

- (void)_getEditingViewControllerIfPossible
{
  BSDispatchQueueAssertMain();
  if (![(PRUISInlinePosterEditingViewController *)self _isPresentingRemoteOrLocalEditingUI])
  {
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke;
    v21[3] = &unk_26546B850;
    objc_copyWeak(&v22, &location);
    v3 = (void (**)(void))MEMORY[0x25A2F4350](v21);
    if (+[PRUISExternallyHostedPosterEditingService isExternalEditingSupported](PRUISExternallyHostedPosterEditingService, "isExternalEditingSupported")&& ([MEMORY[0x263F29CB8] processHandle], v4 = objc_claimAutoreleasedReturnValue(), int v5 = objc_msgSend(v4, "hasEntitlement:", @"com.apple.posterboardui.externalEditing"), v4, v5))
    {
      v6 = objc_alloc_init(PRUISExternallyHostedPosterEditingService);
      [(PRUISExternallyHostedPosterEditingService *)v6 setDelegate:self];
      v7 = +[PRUISExternallyHostedPosterEditingService editingRequestForEntryPoint:self->_entryPoint];
      remoteEditingRequest = self->_remoteEditingRequest;
      self->_remoteEditingRequest = v7;

      objc_super v9 = self->_remoteEditingRequest;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_2;
      v16[3] = &unk_26546BBC8;
      objc_copyWeak(&v20, &location);
      v10 = v3;
      id v19 = v10;
      v11 = v6;
      v17 = v11;
      v18 = self;
      [(PRUISExternallyHostedPosterEditingService *)v11 beginEditingWithRequest:v9 completion:v16];
      dispatch_time_t v12 = dispatch_time(0, 3000000000);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_5;
      v13[3] = &unk_26546BBF0;
      objc_copyWeak(&v15, &location);
      v14 = v10;
      dispatch_after(v12, MEMORY[0x263EF83A0], v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&v20);
    }
    else
    {
      v3[2](v3);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [[PRUISModalRemoteViewController alloc] initWithEntryPoint:WeakRetained[122]];
    [(PRUISModalRemoteViewController *)v1 setDelegate:WeakRetained];
    v2 = [WeakRetained displayConfiguration];
    [(PRUISModalRemoteViewController *)v1 setDisplayConfiguration:v2];

    v3 = (void *)WeakRetained[125];
    WeakRetained[125] = v1;
    v4 = v1;

    objc_msgSend(WeakRetained, "bs_addChildViewController:animated:transitionBlock:", v4, 1, 0);
  }
}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v7 = a1[6];
  id v6 = a1[4];
  id v5 = v3;
  BSDispatchMain();
}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_3(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = PRUISLogRemoteEditing();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_3_cold_1(v2, v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      objc_storeStrong((id *)(v4 + 992), *(id *)(a1 + 48));
      id v5 = objc_alloc_init(PRUISInlinePosterEditingPlaceholderViewController);
      [(PRUISInlinePosterEditingPlaceholderViewController *)v5 setDelegate:*(void *)(a1 + 56)];
      objc_msgSend(*(id *)(a1 + 40), "bs_addChildViewController:animated:transitionBlock:", v5, 1, 0);
    }
  }
}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained _isPresentingRemoteOrLocalEditingUI] & 1) == 0)
  {
    uint64_t v4 = PRUISLogRemoteEditing();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_5_cold_1(v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PRUISInlinePosterEditingViewController;
  [(PRUISInlinePosterEditingViewController *)&v3 viewDidLoad];
  [(PRUISInlinePosterEditingViewController *)self _getEditingViewControllerIfPossible];
}

- (void)sendRequestDismissalAction
{
  if (self->_remoteEditingService)
  {
    [(PRUISExternallyHostedPosterEditingService *)self->_remoteEditingService sendRequestDismissalActionWithRequest:self->_remoteEditingRequest];
  }
  else
  {
    fallbackViewController = self->_fallbackViewController;
    if (fallbackViewController) {
      [(PRUISModalRemoteViewController *)fallbackViewController sendRequestDismissalAction];
    }
  }
}

- (BOOL)prefersStatusBarHidden
{
  if (self->_fallbackViewController)
  {
    fallbackViewController = self->_fallbackViewController;
    return [(PRUISModalRemoteViewController *)fallbackViewController prefersStatusBarHidden];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PRUISInlinePosterEditingViewController;
    return [(PRUISInlinePosterEditingViewController *)&v4 prefersStatusBarHidden];
  }
}

- (int64_t)preferredStatusBarStyle
{
  if (self->_fallbackViewController)
  {
    fallbackViewController = self->_fallbackViewController;
    return [(PRUISModalRemoteViewController *)fallbackViewController preferredStatusBarStyle];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PRUISInlinePosterEditingViewController;
    return [(PRUISInlinePosterEditingViewController *)&v4 preferredStatusBarStyle];
  }
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  if (self->_fallbackViewController)
  {
    fallbackViewController = self->_fallbackViewController;
    return [(PRUISModalRemoteViewController *)fallbackViewController preferredStatusBarUpdateAnimation];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PRUISInlinePosterEditingViewController;
    return [(PRUISInlinePosterEditingViewController *)&v4 preferredStatusBarUpdateAnimation];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (self->_fallbackViewController)
  {
    fallbackViewController = self->_fallbackViewController;
    return [(PRUISModalRemoteViewController *)fallbackViewController supportedInterfaceOrientations];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PRUISInlinePosterEditingViewController;
    return [(PRUISInlinePosterEditingViewController *)&v4 supportedInterfaceOrientations];
  }
}

- (void)modalRemoteViewController:(id)a3 willDismissWithResponse:(id)a4
{
  id v7 = a4;
  id v9 = v7;
  if (self->_fallbackViewController != a3)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PRUISInlinePosterEditingViewController.m" lineNumber:157 description:@"should be our view controller!"];

    id v7 = v9;
  }
  [(PRUISInlinePosterEditingViewController *)self _shared_willDismissWithResponse:v7];
}

- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4
{
  id v7 = a4;
  id v9 = v7;
  if (self->_fallbackViewController != a3)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PRUISInlinePosterEditingViewController.m" lineNumber:162 description:@"should be our view controller!"];

    id v7 = v9;
  }
  [(PRUISInlinePosterEditingViewController *)self _shared_didDismissWithResponse:v7];
}

- (void)_shared_willDismissWithResponse:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  objc_super v4 = [(PRUISInlinePosterEditingViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 inlineEditingViewController:self willDismissWithResponse:v5];
  }
}

- (void)_shared_didDismissWithResponse:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssertMain();
  objc_super v4 = [(PRUISInlinePosterEditingViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 inlineEditingViewController:self didDismissWithResponse:v5];
  }
  [(PRUISExternallyHostedPosterEditingService *)self->_remoteEditingService invalidate];
}

- (BOOL)_isPresentingRemoteOrLocalEditingUI
{
  return self->_remoteEditingService || self->_fallbackViewController != 0;
}

- (PRUISInlinePosterEditingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PRUISInlinePosterEditingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fallbackViewController, 0);
  objc_storeStrong((id *)&self->_remoteEditingService, 0);
  objc_storeStrong((id *)&self->_remoteEditingRequest, 0);

  objc_storeStrong((id *)&self->_entryPoint, 0);
}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_25A03F000, a2, OS_LOG_TYPE_ERROR, "Failed to load remote editing service, falling back to local. Error: %@", (uint8_t *)&v3, 0xCu);
}

void __77__PRUISInlinePosterEditingViewController__getEditingViewControllerIfPossible__block_invoke_5_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25A03F000, log, OS_LOG_TYPE_ERROR, "Remote editing service appears to have timed out, falling back to local.", v1, 2u);
}

@end