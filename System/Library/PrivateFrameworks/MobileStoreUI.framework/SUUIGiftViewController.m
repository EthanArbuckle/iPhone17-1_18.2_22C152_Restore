@interface SUUIGiftViewController
- (CGSize)preferredContentSize;
- (NSOperationQueue)operationQueue;
- (SUUIClientContext)clientContext;
- (SUUIGift)gift;
- (SUUIGiftViewController)initWithGift:(id)a3;
- (SUUIGiftViewControllerDelegate)giftDelegate;
- (id)_localizedString:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelButtonAction:(id)a3;
- (void)_clientContextDidLoadWithContext:(id)a3 error:(id)a4;
- (void)_configurationDidLoadWithResult:(BOOL)a3 error:(id)a4;
- (void)_finishAuthenticateWithResponse:(id)a3 error:(id)a4;
- (void)_finishGiftingWithResult:(BOOL)a3;
- (void)_loadGiftConfiguration;
- (void)setClientContext:(id)a3;
- (void)setGiftDelegate:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUUIGiftViewController

- (SUUIGiftViewController)initWithGift:(id)a3
{
  v4 = (SUUIGift *)[a3 copy];
  gift = self->_gift;
  self->_gift = v4;

  id v6 = objc_alloc_init(MEMORY[0x263F82E10]);
  v7 = [v6 view];
  v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v7 setBackgroundColor:v8];

  v12.receiver = self;
  v12.super_class = (Class)SUUIGiftViewController;
  v9 = [(SUUIGiftViewController *)&v12 initWithRootViewController:v6];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeholderViewController, v6);
    [(SUUIGiftViewController *)v10 setModalPresentationStyle:2];
  }

  return v10;
}

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:6];
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)setClientContext:(id)a3
{
  v5 = (SUUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_clientContext, a3);
    placeholderViewController = self->_placeholderViewController;
    v8 = [(SUUIGiftViewController *)self _localizedString:@"GIFTING_FLOW_TITLE"];
    [(UIViewController *)placeholderViewController setTitle:v8];

    v5 = v9;
  }
  MEMORY[0x270F9A758](p_clientContext, v5);
}

- (void)setOperationQueue:(id)a3
{
  v5 = (NSOperationQueue *)a3;
  p_operationQueue = &self->_operationQueue;
  if (self->_operationQueue != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_operationQueue, a3);
    rootViewController = self->_rootViewController;
    v8 = [(SUUIGiftViewController *)self operationQueue];
    [(SUUIGiftStepViewController *)rootViewController setOperationQueue:v8];

    v5 = v9;
  }
  MEMORY[0x270F9A758](p_operationQueue, v5);
}

- (CGSize)preferredContentSize
{
  v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 1) {
    goto LABEL_7;
  }
  v5 = [MEMORY[0x263F82E88] keyWindow];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v30.origin.x = v7;
  v30.origin.y = v9;
  v30.size.width = v11;
  v30.size.height = v13;
  double Width = CGRectGetWidth(v30);
  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  double Height = CGRectGetHeight(v31);
  if (Width < 1024.0 || Height < 1024.0)
  {
LABEL_7:
    v28.receiver = self;
    v28.super_class = (Class)SUUIGiftViewController;
    [(SUUIGiftViewController *)&v28 preferredContentSize];
    uint64_t v18 = v17;
    double v20 = v19;
  }
  else
  {
    v21 = [(SUUIGiftViewController *)self navigationBar];
    v22 = v21;
    if (v21)
    {
      [v21 frame];
      double v23 = CGRectGetHeight(v32);
    }
    else
    {
      double v23 = 0.0;
    }
    double v24 = v23 + 1045.0;
    double v25 = v23 + 904.0;
    if (Height <= Width) {
      double v20 = v25;
    }
    else {
      double v20 = v24;
    }
    *(double *)&uint64_t v18 = 784.0;
  }
  double v26 = *(double *)&v18;
  double v27 = v20;
  result.height = v27;
  result.width = v26;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1) {
    return 30;
  }
  if (SUUIAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIGiftViewController;
  [(SUUIGiftViewController *)&v8 viewDidAppear:a3];
  uint64_t v4 = [(SUUIGiftViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    double v6 = [MEMORY[0x263F82438] sharedApplication];
    self->_initialBarStyle = [v6 statusBarStyle];

    CGFloat v7 = [MEMORY[0x263F82438] sharedApplication];
    [v7 setStatusBarStyle:0];
  }
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)SUUIGiftViewController;
  [(SUUIGiftViewController *)&v17 viewDidLoad];
  if (!self->_giftConfiguration)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F824A8]);
    [v3 setAction:sel__cancelButtonAction_];
    [v3 setTarget:self];
    uint64_t v4 = [(SUUIGiftViewController *)self _localizedString:@"GIFTING_CANCEL_BUTTON"];
    [v3 setTitle:v4];

    uint64_t v5 = [(SUUIGiftViewController *)self topViewController];
    double v6 = [v5 navigationItem];
    [v6 setLeftBarButtonItem:v3];

    CGFloat v7 = [MEMORY[0x263F7B0E8] defaultStore];
    objc_super v8 = [v7 activeAccount];

    if (v8)
    {
      gift = self->_gift;
      double v10 = [v8 accountName];
      [(SUUIGift *)gift setSenderEmailAddress:v10];

      [(SUUIGiftViewController *)self _loadGiftConfiguration];
    }
    else
    {
      objc_initWeak(&location, self);
      id v11 = objc_alloc(MEMORY[0x263F7B118]);
      double v12 = [MEMORY[0x263F7B120] contextForSignIn];
      CGFloat v13 = (void *)[v11 initWithAuthenticationContext:v12];

      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __37__SUUIGiftViewController_viewDidLoad__block_invoke;
      v14[3] = &unk_265406028;
      objc_copyWeak(&v15, &location);
      [v13 startWithAuthenticateResponseBlock:v14];
      objc_destroyWeak(&v15);

      objc_destroyWeak(&location);
    }
  }
}

void __37__SUUIGiftViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SUUIGiftViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __37__SUUIGiftViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishAuthenticateWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIGiftViewController;
  [(SUUIGiftViewController *)&v7 viewWillDisappear:a3];
  uint64_t v4 = [(SUUIGiftViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    id v6 = [MEMORY[0x263F82438] sharedApplication];
    [v6 setStatusBarStyle:self->_initialBarStyle];
  }
}

- (void)_cancelButtonAction:(id)a3
{
}

- (void)_clientContextDidLoadWithContext:(id)a3 error:(id)a4
{
  if (a3)
  {
    -[SUUIGiftViewController setClientContext:](self, "setClientContext:", a3, a4);
    [(SUUIGiftViewController *)self _loadGiftConfiguration];
  }
  else
  {
    NSLog(&cfstr_Error_1.isa, a2, a4);
    [(SUUIGiftViewController *)self _finishGiftingWithResult:0];
  }
}

- (void)_configurationDidLoadWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v4)
  {
    objc_super v7 = [[SUUIGiftComposeViewController alloc] initWithGift:self->_gift configuration:self->_giftConfiguration];
    rootViewController = self->_rootViewController;
    self->_rootViewController = v7;

    CGFloat v9 = self->_rootViewController;
    id v10 = [(SUUIGiftViewController *)self operationQueue];
    [(SUUIGiftStepViewController *)v9 setOperationQueue:v10];

    v15[0] = self->_rootViewController;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [(SUUIGiftViewController *)self setViewControllers:v11];
  }
  else
  {
    if (!+[SUUINetworkErrorViewController canDisplayError:v6])
    {
      NSLog(&cfstr_Error_1.isa, v6);
      [(SUUIGiftViewController *)self _finishGiftingWithResult:0];
      goto LABEL_7;
    }
    id v11 = [[SUUINetworkErrorViewController alloc] initWithError:v6];
    [(SUUINetworkErrorViewController *)v11 setClientContext:self->_clientContext];
    v14 = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    [(SUUIGiftViewController *)self setViewControllers:v12];
  }
LABEL_7:
  placeholderViewController = self->_placeholderViewController;
  self->_placeholderViewController = 0;
}

- (void)_finishAuthenticateWithResponse:(id)a3 error:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v12
    && [v12 authenticateResponseType] == 4
    && ([v12 authenticatedAccount],
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isManagedAppleID],
        v7,
        !v8))
  {
    gift = self->_gift;
    id v10 = [v12 authenticatedAccount];
    id v11 = [v10 accountName];
    [(SUUIGift *)gift setSenderEmailAddress:v11];

    [(SUUIGiftViewController *)self _loadGiftConfiguration];
  }
  else
  {
    [(SUUIGiftViewController *)self _configurationDidLoadWithResult:0 error:v6];
  }
}

- (void)_finishGiftingWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  p_giftDelegate = &self->_giftDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_giftDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_giftDelegate);
    [v8 giftViewController:self didFinishWithResult:v3];
  }
  else
  {
    [(SUUIGiftViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_loadGiftConfiguration
{
  objc_initWeak(&location, self);
  if (self->_clientContext)
  {
    BOOL v3 = [SUUIGiftConfiguration alloc];
    BOOL v4 = [(SUUIGiftViewController *)self operationQueue];
    uint64_t v5 = [(SUUIGiftConfiguration *)v3 initWithOperationQueue:v4 clientContext:self->_clientContext];
    giftConfiguration = self->_giftConfiguration;
    self->_giftConfiguration = v5;

    char v7 = self->_giftConfiguration;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__SUUIGiftViewController__loadGiftConfiguration__block_invoke;
    v12[3] = &unk_265401890;
    objc_copyWeak(&v13, &location);
    [(SUUIGiftConfiguration *)v7 loadConfigurationWithCompletionBlock:v12];
    objc_destroyWeak(&v13);
  }
  else
  {
    id v8 = objc_alloc_init(SUUIReloadConfigurationOperation);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__SUUIGiftViewController__loadGiftConfiguration__block_invoke_3;
    v10[3] = &unk_2654057F8;
    objc_copyWeak(&v11, &location);
    [(SUUIReloadConfigurationOperation *)v8 setOutputBlock:v10];
    CGFloat v9 = [(SUUIGiftViewController *)self operationQueue];
    [v9 addOperation:v8];

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&location);
}

void __48__SUUIGiftViewController__loadGiftConfiguration__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUUIGiftViewController__loadGiftConfiguration__block_invoke_2;
  block[3] = &unk_265403A18;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __48__SUUIGiftViewController__loadGiftConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _configurationDidLoadWithResult:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

void __48__SUUIGiftViewController__loadGiftConfiguration__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUUIGiftViewController__loadGiftConfiguration__block_invoke_4;
  block[3] = &unk_2654012A0;
  id v10 = v5;
  id v7 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v11 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __48__SUUIGiftViewController__loadGiftConfiguration__block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    BOOL v3 = [[SUUIClientContext alloc] initWithConfigurationDictionary:*(void *)(a1 + 32)];
  }
  else {
    BOOL v3 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _clientContextDidLoadWithContext:v3 error:*(void *)(a1 + 40)];
}

- (id)_localizedString:(id)a3
{
  id v4 = a3;
  clientContext = self->_clientContext;
  if (clientContext)
  {
    id v6 = [(SUUIClientContext *)clientContext localizedStringForKey:v4 inTable:@"Gifting"];
  }
  else
  {
    id v7 = SUUIBundle();
    id v6 = [v7 localizedStringForKey:v4 value:&stru_2704F8130 table:0];
  }
  return v6;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUIGift)gift
{
  return self->_gift;
}

- (SUUIGiftViewControllerDelegate)giftDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_giftDelegate);
  return (SUUIGiftViewControllerDelegate *)WeakRetained;
}

- (void)setGiftDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
  objc_destroyWeak((id *)&self->_giftDelegate);
  objc_storeStrong((id *)&self->_gift, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end