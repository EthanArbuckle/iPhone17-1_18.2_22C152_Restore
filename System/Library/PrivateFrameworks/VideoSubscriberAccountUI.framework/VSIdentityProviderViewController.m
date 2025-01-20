@interface VSIdentityProviderViewController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)canIssuePrivacyVouchers;
- (BOOL)currentAuthenticationViewControllerSupportsPreAuth;
- (BOOL)identityProviderRequestManager:(id)a3 requestsAlert:(id)a4;
- (BOOL)isCancellationAllowed;
- (NSOperationQueue)privateQueue;
- (UIBarButtonItem)cancelButtonItem;
- (UIBarButtonItem)signInButtonItem;
- (UIViewController)currentlyPresentedIdentityProviderAlert;
- (VSAuditToken)auditToken;
- (VSIdentityProvider)identityProvider;
- (VSIdentityProviderRequestManager)requestManager;
- (VSIdentityProviderViewController)init;
- (VSIdentityProviderViewController)initWithCoder:(id)a3;
- (VSIdentityProviderViewController)initWithIdentityProvider:(id)a3;
- (VSIdentityProviderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VSIdentityProviderViewControllerDelegate)delegate;
- (VSImageLoadOperation)logoLoadOperation;
- (VSViewModel)viewModel;
- (id)_logoLoadOperationForPreferredImageSize:(CGSize)a3;
- (void)_didCancel;
- (void)_dismiss;
- (void)_hideNavigationBarButtons;
- (void)_showNavigationBarButtons;
- (void)_showValidationAlertForError:(id)a3;
- (void)_showViewController:(id)a3;
- (void)_signInButtonPressed:(id)a3;
- (void)_startObservingViewModel:(id)a3;
- (void)_startValidation;
- (void)_stopObservingViewModel:(id)a3;
- (void)_stopValidationAndShowButtons:(BOOL)a3;
- (void)dealloc;
- (void)enqueueRequest:(id)a3;
- (void)identityProviderRequestManager:(id)a3 didAuthenticateAccount:(id)a4 forRequest:(id)a5;
- (void)identityProviderRequestManager:(id)a3 didUpdateLogoViewModel:(id)a4;
- (void)identityProviderRequestManager:(id)a3 finishedRequest:(id)a4 withResult:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendErrorMessage:(id)a3;
- (void)setAuditToken:(id)a3;
- (void)setCanIssuePrivacyVouchers:(BOOL)a3;
- (void)setCancelButtonItem:(id)a3;
- (void)setCancellationAllowed:(BOOL)a3;
- (void)setCurrentlyPresentedIdentityProviderAlert:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLogoLoadOperation:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRequestManager:(id)a3;
- (void)setSignInButtonItem:(id)a3;
- (void)setViewModel:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation VSIdentityProviderViewController

- (VSIdentityProviderViewController)initWithIdentityProvider:(id)a3
{
  id v5 = a3;
  VSRequireMainThread();
  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The identityProvider parameter must not be nil."];
  }
  v19.receiver = self;
  v19.super_class = (Class)VSIdentityProviderViewController;
  v6 = [(VSIdentityProviderViewController *)&v19 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identityProvider, a3);
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    privateQueue = v7->_privateQueue;
    v7->_privateQueue = v8;

    [(NSOperationQueue *)v7->_privateQueue setName:@"VSIdentityProviderViewController"];
    v10 = [[VSIdentityProviderRequestManager alloc] initWithIdentityProvider:v5];
    requestManager = v7->_requestManager;
    v7->_requestManager = v10;

    [(VSIdentityProviderRequestManager *)v7->_requestManager setDelegate:v7];
    v12 = v7->_requestManager;
    v13 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderViewController *)v7 vs_bind:@"viewModel" toObject:v12 withKeyPath:@"viewModel" options:v13];

    v14 = v7->_requestManager;
    v15 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderRequestManager *)v14 vs_bind:@"auditToken" toObject:v7 withKeyPath:@"auditToken" options:v15];

    v16 = v7->_requestManager;
    v17 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderRequestManager *)v16 vs_bind:@"canIssuePrivacyVouchers" toObject:v7 withKeyPath:@"canIssuePrivacyVouchers" options:v17];
  }
  return v7;
}

- (VSIdentityProviderViewController)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSIdentityProviderViewController)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ initializer is not available.", v6 format];

  return 0;
}

- (VSIdentityProviderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF4A0];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The %@ initializer is not available.", v7 format];

  return 0;
}

- (void)dealloc
{
  VSRequireMainThread();
  v3 = self->_viewModel;
  if (v3) {
    [(VSIdentityProviderViewController *)self _stopObservingViewModel:v3];
  }
  uint64_t v4 = [(VSIdentityProviderViewController *)self privateQueue];
  [v4 cancelAllOperations];

  v5.receiver = self;
  v5.super_class = (Class)VSIdentityProviderViewController;
  [(VSIdentityProviderViewController *)&v5 dealloc];
}

- (void)_startObservingViewModel:(id)a3
{
}

- (void)_stopObservingViewModel:(id)a3
{
}

- (void)_signInButtonPressed:(id)a3
{
  id v3 = [(VSIdentityProviderViewController *)self viewModel];
  [v3 setValidationState:1];
}

- (void)_showValidationAlertForError:(id)a3
{
  id v4 = a3;
  objc_super v5 = VSErrorLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[VSIdentityProviderViewController _showValidationAlertForError:]((uint64_t)v4, v5);
  }

  uint64_t v6 = VSAlertForError(v4, 0);
  [(VSIdentityProviderViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_startValidation
{
  [(VSIdentityProviderViewController *)self _hideNavigationBarButtons];
  id v3 = [VSSpinnerTitleView alloc];
  id v4 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  objc_super v5 = [v4 localizedStringForKey:@"CREDENTIAL_ENTRY_VERIFYING" value:0 table:0];
  v7 = [(VSSpinnerTitleView *)v3 initWithTitle:v5];

  uint64_t v6 = [(VSIdentityProviderViewController *)self navigationItem];
  [v6 setTitleView:v7];

  [(UIViewController *)self vs_beginIgnoringInteraction];
}

- (void)_stopValidationAndShowButtons:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(VSIdentityProviderViewController *)self navigationItem];
  [v5 setTitleView:0];

  [(UIViewController *)self vs_endIgnoringInteraction];
  if (v3)
  {
    [(VSIdentityProviderViewController *)self _showNavigationBarButtons];
  }
}

- (void)_showNavigationBarButtons
{
  id v11 = [(VSIdentityProviderViewController *)self navigationItem];
  BOOL v3 = [(VSIdentityProviderViewController *)self signInButtonItem];
  [v11 setRightBarButtonItem:v3];

  if ([(VSIdentityProviderViewController *)self isCancellationAllowed])
  {
    id v4 = [(VSIdentityProviderViewController *)self viewModel];
    int v5 = [v4 isInAuthenticationShareFlow];

    uint64_t v6 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    v7 = v6;
    if (v5) {
      v8 = @"NOT_NOW_BUTTON_TITLE";
    }
    else {
      v8 = @"CANCEL_TITLE";
    }
    v9 = [v6 localizedStringForKey:v8 value:0 table:0];

    v10 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithTitle:v9 style:0 target:self action:sel__cancelButtonPressed_];
    [v11 setLeftBarButtonItem:v10];
    [v11 setHidesBackButton:1];
  }
  else
  {
    [v11 setLeftBarButtonItem:0];
    [v11 setHidesBackButton:0];
  }
}

- (void)_hideNavigationBarButtons
{
  id v2 = [(VSIdentityProviderViewController *)self navigationItem];
  [v2 setHidesBackButton:1];
  [v2 setLeftBarButtonItem:0];
  [v2 setRightBarButtonItem:0];
}

- (id)_logoLoadOperationForPreferredImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(VSIdentityProviderViewController *)self viewModel];
  if ([v6 conformsToProtocol:&unk_26F394860])
  {
    id v7 = v6;
    v8 = [v7 logoProvider];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
      objc_initWeak(&location, self);
      id v11 = -[VSImageLoadOperation initWithItemProvider:preferredImageSize:]([VSImageLoadOperation alloc], "initWithItemProvider:preferredImageSize:", v10, width, height);
      [(VSImageLoadOperation *)v11 setNonAppInitiated:1];
      v12 = [(VSIdentityProviderViewController *)self auditToken];
      [(VSImageLoadOperation *)v11 setAuditToken:v12];

      [(VSIdentityProviderViewController *)self setLogoLoadOperation:v11];
      uint64_t v16 = MEMORY[0x263EF8330];
      objc_copyWeak(&v19, &location);
      v17 = v11;
      id v18 = v7;
      v13 = VSMainThreadOperationWithBlock();
      objc_msgSend(v13, "addDependency:", v17, v16, 3221225472, __76__VSIdentityProviderViewController__logoLoadOperationForPreferredImageSize___block_invoke, &unk_265076E48);
      VSEnqueueCompletionOperation();
      v14 = (void *)[objc_alloc(MEMORY[0x263F1E2C0]) initWithOperation:v17 timeout:0.3];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __76__VSIdentityProviderViewController__logoLoadOperationForPreferredImageSize___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    BOOL v3 = [a1[4] result];
    id v4 = [v3 forceUnwrapObject];
    int v5 = [v4 object];

    [a1[5] setLogo:v5];
    [a1[5] setLogoFinishedLoading:1];

    id WeakRetained = v6;
  }
}

- (void)_showViewController:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(VSIdentityProviderViewController *)self _stopValidationAndShowButtons:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v5 = [(VSIdentityProviderViewController *)self childViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v10 willMoveToParentViewController:0];
        id v11 = [v10 view];
        [v11 removeFromSuperview];

        [v10 removeFromParentViewController];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(VSIdentityProviderViewController *)self addChildViewController:v4];
  v12 = [v4 view];
  [v12 setAutoresizingMask:18];
  v13 = [(VSIdentityProviderViewController *)self view];
  [v13 bounds];
  objc_msgSend(v12, "setFrame:");
  [v13 addSubview:v12];
  [v4 didMoveToParentViewController:self];
  [(UIViewController *)self vs_updateNavigationItemAndForceViewReloadWithSearchController:0];
}

- (void)_dismiss
{
  id v3 = [(VSIdentityProviderViewController *)self delegate];
  [v3 dismissIdentityProviderViewController:self];
}

- (void)_didCancel
{
  id v3 = [(VSIdentityProviderViewController *)self delegate];
  [v3 identityProviderViewControllerDidCancel:self];
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  viewModel = self->_viewModel;
  if (viewModel) {
    [(VSIdentityProviderViewController *)self _stopObservingViewModel:self->_viewModel];
  }
  objc_storeStrong((id *)&self->_viewModel, a3);
  uint64_t v7 = +[VSViewControllerFactory sharedFactory];
  if (v5)
  {
    id v8 = v5;
    v9 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderViewController *)self vs_bind:@"title" toObject:v8 withKeyPath:@"title" options:v9];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = (void *)MEMORY[0x263EFF940];
        uint64_t v11 = *MEMORY[0x263EFF4A0];
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        [v10 raise:v11, @"Unexpectedly, viewModel was %@, instead of VSCuratedViewModel.", v13 format];
      }
      id v14 = v8;
      long long v15 = [v14 beginValidationButtonTitle];
      long long v16 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithTitle:v15 style:0 target:self action:sel__signInButtonPressed_];
      long long v17 = VSMainConcurrencyBindingOptions();
      objc_msgSend(v16, "vs_bind:toObject:withKeyPath:options:", @"enabled", v14, @"beginValidationButtonEnabled", v17);
    }
    else
    {
      long long v16 = 0;
    }
    [(VSIdentityProviderViewController *)self setSignInButtonItem:v16];
    [(VSIdentityProviderViewController *)self _startObservingViewModel:v8];
    id v18 = [v7 authenticationViewControllerForViewModel:v8];
    uint64_t v19 = [v18 forceUnwrapObject];

    [v19 setDelegate:self];
    v20 = VSMainConcurrencyBindingOptions();
    objc_msgSend(v19, "vs_bind:toObject:withKeyPath:options:", @"cancellationAllowed", self, @"cancellationAllowed", v20);

    objc_initWeak(&location, self);
    objc_copyWeak(&v29, &location);
    id v21 = v19;
    v22 = VSMainThreadOperationWithBlock();
    if (objc_opt_respondsToSelector())
    {
      [v21 preferredLogoSize];
      v23 = -[VSIdentityProviderViewController _logoLoadOperationForPreferredImageSize:](self, "_logoLoadOperationForPreferredImageSize:");
      v24 = v23;
      if (v23)
      {
        v28 = v7;
        id v25 = v23;
        v26 = [(VSIdentityProviderViewController *)self privateQueue];
        [v26 addOperation:v25];

        [v22 addDependency:v25];
        uint64_t v7 = v28;
      }
    }
    VSEnqueueCompletionOperation();

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    goto LABEL_16;
  }
  [(VSIdentityProviderViewController *)self vs_unbind:@"title"];
  if (!viewModel)
  {
    v27 = [v7 loadingViewController];
    id v8 = [v27 forceUnwrapObject];

    [(VSIdentityProviderViewController *)self _showViewController:v8];
LABEL_16:

    goto LABEL_17;
  }
  [(VSIdentityProviderViewController *)self _dismiss];
LABEL_17:
  [(VSIdentityProviderViewController *)self _showNavigationBarButtons];
}

void __49__VSIdentityProviderViewController_setViewModel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _showViewController:*(void *)(a1 + 32)];
    id v3 = [v4 delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 identityProviderViewControllerDidFinishLoading:*(void *)(a1 + 40)];
    }

    id WeakRetained = v4;
  }
}

- (void)enqueueRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(VSIdentityProviderViewController *)self requestManager];
  [v5 enqueueRequest:v4];
}

- (void)sendErrorMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(VSIdentityProviderViewController *)self requestManager];
  [v5 sendErrorMessage:v4];
}

- (BOOL)currentAuthenticationViewControllerSupportsPreAuth
{
  id v2 = [(VSIdentityProviderViewController *)self childViewControllers];
  id v3 = [v2 firstObject];

  if (v3) {
    char v4 = [v3 conformsToProtocol:&unk_26F3C3FD0];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kVSKeyValueObservingContext_ViewModelValidationState == a6)
  {
    uint64_t v11 = *MEMORY[0x263F081C8];
    id v12 = a5;
    v13 = [v12 objectForKey:v11];
    uint64_t v14 = [v13 unsignedIntegerValue];

    long long v15 = [v12 objectForKey:*MEMORY[0x263F081B8]];

    uint64_t v16 = [v15 unsignedIntegerValue];
    switch(v16)
    {
      case 0:
        if (v14 == 4 || v14 == 1)
        {
          id v18 = self;
          uint64_t v19 = 1;
          goto LABEL_21;
        }
        break;
      case 1:
        goto LABEL_12;
      case 2:
        if (!v14)
        {
LABEL_12:
          [(VSIdentityProviderViewController *)self _startValidation];
        }
        break;
      case 3:
        if (v14 == 2)
        {
          id v18 = self;
          uint64_t v19 = 0;
LABEL_21:
          [(VSIdentityProviderViewController *)v18 _stopValidationAndShowButtons:v19];
        }
        break;
      case 4:
        if (v14 == 2)
        {
          [(VSIdentityProviderViewController *)self _stopValidationAndShowButtons:1];
          v20 = (void *)MEMORY[0x263F1E250];
          id v21 = [(VSIdentityProviderViewController *)self viewModel];
          v22 = [v21 error];
          id v24 = [v20 optionalWithObject:v22];

          v23 = [v24 forceUnwrapObject];
          [(VSIdentityProviderViewController *)self _showValidationAlertForError:v23];
        }
        break;
      default:
        return;
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)VSIdentityProviderViewController;
    id v10 = a5;
    [(VSIdentityProviderViewController *)&v25 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (void)identityProviderRequestManager:(id)a3 finishedRequest:(id)a4 withResult:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(VSIdentityProviderViewController *)self delegate];
  [v9 identityProviderViewController:self didFinishRequest:v8 withResult:v7];
}

- (void)identityProviderRequestManager:(id)a3 didAuthenticateAccount:(id)a4 forRequest:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(VSIdentityProviderViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 identityProviderViewController:self didAuthenticateAccount:v9 forRequest:v7];
  }
}

- (BOOL)identityProviderRequestManager:(id)a3 requestsAlert:(id)a4
{
  v44[1] = *MEMORY[0x263EF8340];
  id v26 = a3;
  v28 = self;
  id v29 = a4;
  uint64_t v6 = [(VSIdentityProviderViewController *)self currentlyPresentedIdentityProviderAlert];
  v27 = v6;
  if (v6)
  {
    [v6 dismissViewControllerAnimated:1 completion:0];
    [(VSIdentityProviderViewController *)self setCurrentlyPresentedIdentityProviderAlert:0];
  }
  id v7 = (void *)MEMORY[0x263F1C3F8];
  id v8 = [v29 title];
  id v9 = [v29 message];
  id val = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

  objc_initWeak(&location, val);
  objc_initWeak(&from, v28);
  id v10 = [v29 actions];
  if (![v10 count])
  {
    uint64_t v11 = objc_alloc_init(VSIdentityProviderAlertAction);
    id v12 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    v13 = [v12 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0];
    [(VSIdentityProviderAlertAction *)v11 setTitle:v13];

    [(VSIdentityProviderAlertAction *)v11 setStyle:0];
    v44[0] = v11;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];

    id v10 = (void *)v14;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v10;
  uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v19 = [v18 style];
        v20 = (void *)MEMORY[0x263F1C3F0];
        id v21 = [v18 title];
        if (v19 == 1) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = 2 * (v19 == 2);
        }
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __81__VSIdentityProviderViewController_identityProviderRequestManager_requestsAlert___block_invoke;
        v32[3] = &unk_265076E70;
        objc_copyWeak(&v33, &from);
        objc_copyWeak(&v34, &location);
        v32[4] = v18;
        v23 = [v20 actionWithTitle:v21 style:v22 handler:v32];

        [val addAction:v23];
        objc_destroyWeak(&v34);
        objc_destroyWeak(&v33);
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v15);
  }

  id v24 = VSDefaultLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v29;
    _os_log_impl(&dword_23F9AB000, v24, OS_LOG_TYPE_DEFAULT, "Presenting identity provider alert %@", buf, 0xCu);
  }

  [(VSIdentityProviderViewController *)v28 setCurrentlyPresentedIdentityProviderAlert:val];
  [(VSIdentityProviderViewController *)v28 presentViewController:val animated:1 completion:0];

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __81__VSIdentityProviderViewController_identityProviderRequestManager_requestsAlert___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained(a1 + 6);
    [v2 dismissViewControllerAnimated:1 completion:0];

    [WeakRetained setCurrentlyPresentedIdentityProviderAlert:0];
    id v3 = [a1[4] callback];

    if (v3)
    {
      char v4 = [a1[4] callback];
      v4[2]();
    }
  }
}

- (void)identityProviderRequestManager:(id)a3 didUpdateLogoViewModel:(id)a4
{
  id v9 = a4;
  uint64_t v5 = [v9 conformsToProtocol:&unk_26F394860];
  id v6 = v9;
  if (v5)
  {
    [v9 preferredLogoSize];
    id v7 = -[VSIdentityProviderViewController _logoLoadOperationForPreferredImageSize:](self, "_logoLoadOperationForPreferredImageSize:");
    if (v7)
    {
      id v8 = [(VSIdentityProviderViewController *)self privateQueue];
      [v8 addOperation:v7];
    }
    id v6 = v9;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VSIdentityProviderViewController;
  [(VSIdentityProviderViewController *)&v3 viewDidLayoutSubviews];
  [(UIViewController *)self vs_adjustContentScrollViewInsets];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (VSIdentityProviderViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSIdentityProviderViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (BOOL)canIssuePrivacyVouchers
{
  return self->_canIssuePrivacyVouchers;
}

- (void)setCanIssuePrivacyVouchers:(BOOL)a3
{
  self->_canIssuePrivacyVouchers = a3;
}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (void)setCancellationAllowed:(BOOL)a3
{
  self->_cancellationAllowed = a3;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSImageLoadOperation)logoLoadOperation
{
  return self->_logoLoadOperation;
}

- (void)setLogoLoadOperation:(id)a3
{
}

- (VSViewModel)viewModel
{
  return self->_viewModel;
}

- (VSIdentityProviderRequestManager)requestManager
{
  return self->_requestManager;
}

- (void)setRequestManager:(id)a3
{
}

- (UIBarButtonItem)signInButtonItem
{
  return self->_signInButtonItem;
}

- (void)setSignInButtonItem:(id)a3
{
}

- (UIBarButtonItem)cancelButtonItem
{
  return self->_cancelButtonItem;
}

- (void)setCancelButtonItem:(id)a3
{
}

- (UIViewController)currentlyPresentedIdentityProviderAlert
{
  return self->_currentlyPresentedIdentityProviderAlert;
}

- (void)setCurrentlyPresentedIdentityProviderAlert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyPresentedIdentityProviderAlert, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_signInButtonItem, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_logoLoadOperation, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

- (void)_showValidationAlertForError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Will show validation alert for error: %@", (uint8_t *)&v2, 0xCu);
}

@end