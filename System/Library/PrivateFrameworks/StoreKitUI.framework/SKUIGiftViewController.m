@interface SKUIGiftViewController
- (CGSize)preferredContentSize;
- (NSOperationQueue)operationQueue;
- (SKUIClientContext)clientContext;
- (SKUIGift)gift;
- (SKUIGiftViewController)initWithGift:(id)a3;
- (SKUIGiftViewControllerDelegate)giftDelegate;
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

@implementation SKUIGiftViewController

- (SKUIGiftViewController)initWithGift:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIGiftViewController initWithGift:]();
  }
  v5 = (SKUIGift *)[v4 copy];
  gift = self->_gift;
  self->_gift = v5;

  id v7 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  v8 = [v7 view];
  v9 = [MEMORY[0x1E4FB1618] _systemBackgroundColor];
  [v8 setBackgroundColor:v9];

  v13.receiver = self;
  v13.super_class = (Class)SKUIGiftViewController;
  v10 = [(SKUIGiftViewController *)&v13 initWithRootViewController:v7];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_placeholderViewController, v7);
    [(SKUIGiftViewController *)v11 setModalPresentationStyle:2];
  }

  return v11;
}

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:6];
    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void)setClientContext:(id)a3
{
  v5 = (SKUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_clientContext, a3);
    placeholderViewController = self->_placeholderViewController;
    v8 = [(SKUIGiftViewController *)self _localizedString:@"GIFTING_FLOW_TITLE"];
    [(UIViewController *)placeholderViewController setTitle:v8];

    v5 = v9;
  }

  MEMORY[0x1F41817F8](p_clientContext, v5);
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
    v8 = [(SKUIGiftViewController *)self operationQueue];
    [(SKUIGiftStepViewController *)rootViewController setOperationQueue:v8];

    v5 = v9;
  }

  MEMORY[0x1F41817F8](p_operationQueue, v5);
}

- (CGSize)preferredContentSize
{
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 1) {
    goto LABEL_7;
  }
  v5 = [MEMORY[0x1E4FB1F48] keyWindow];
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
    v28.super_class = (Class)SKUIGiftViewController;
    [(SKUIGiftViewController *)&v28 preferredContentSize];
    uint64_t v18 = v17;
    double v20 = v19;
  }
  else
  {
    v21 = [(SKUIGiftViewController *)self navigationBar];
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
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1) {
    return 30;
  }
  if (SKUIAllowsLandscapePhone()) {
    return 26;
  }
  return 2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKUIGiftViewController;
  [(SKUIGiftViewController *)&v8 viewDidAppear:a3];
  uint64_t v4 = [(SKUIGiftViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    double v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    self->_initialBarStyle = [v6 statusBarStyle];

    CGFloat v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v7 setStatusBarStyle:0];
  }
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)SKUIGiftViewController;
  [(SKUIGiftViewController *)&v17 viewDidLoad];
  if (!self->_giftConfiguration)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
    [v3 setAction:sel__cancelButtonAction_];
    [v3 setTarget:self];
    uint64_t v4 = [(SKUIGiftViewController *)self _localizedString:@"GIFTING_CANCEL_BUTTON"];
    [v3 setTitle:v4];

    uint64_t v5 = [(SKUIGiftViewController *)self topViewController];
    double v6 = [v5 navigationItem];
    [v6 setLeftBarButtonItem:v3];

    CGFloat v7 = [MEMORY[0x1E4FA8100] defaultStore];
    objc_super v8 = [v7 activeAccount];

    if (v8)
    {
      gift = self->_gift;
      double v10 = [v8 accountName];
      [(SKUIGift *)gift setSenderEmailAddress:v10];

      [(SKUIGiftViewController *)self _loadGiftConfiguration];
    }
    else
    {
      objc_initWeak(&location, self);
      id v11 = objc_alloc(MEMORY[0x1E4FA8128]);
      double v12 = [MEMORY[0x1E4FA8130] contextForSignIn];
      CGFloat v13 = (void *)[v11 initWithAuthenticationContext:v12];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __37__SKUIGiftViewController_viewDidLoad__block_invoke;
      v14[3] = &unk_1E6424220;
      objc_copyWeak(&v15, &location);
      [v13 startWithAuthenticateResponseBlock:v14];
      objc_destroyWeak(&v15);

      objc_destroyWeak(&location);
    }
  }
}

void __37__SKUIGiftViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SKUIGiftViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E6423FF8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __37__SKUIGiftViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _finishAuthenticateWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIGiftViewController;
  [(SKUIGiftViewController *)&v7 viewWillDisappear:a3];
  uint64_t v4 = [(SKUIGiftViewController *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
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
    -[SKUIGiftViewController setClientContext:](self, "setClientContext:", a3, a4);
    [(SKUIGiftViewController *)self _loadGiftConfiguration];
  }
  else
  {
    NSLog(&cfstr_Error.isa, a2, a4);
    [(SKUIGiftViewController *)self _finishGiftingWithResult:0];
  }
}

- (void)_configurationDidLoadWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v4)
  {
    objc_super v7 = [[SKUIGiftComposeViewController alloc] initWithGift:self->_gift configuration:self->_giftConfiguration];
    rootViewController = self->_rootViewController;
    self->_rootViewController = v7;

    CGFloat v9 = self->_rootViewController;
    id v10 = [(SKUIGiftViewController *)self operationQueue];
    [(SKUIGiftStepViewController *)v9 setOperationQueue:v10];

    v15[0] = self->_rootViewController;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(SKUIGiftViewController *)self setViewControllers:v11];
  }
  else
  {
    if (!+[SKUINetworkErrorViewController canDisplayError:v6])
    {
      NSLog(&cfstr_Error.isa, v6);
      [(SKUIGiftViewController *)self _finishGiftingWithResult:0];
      goto LABEL_7;
    }
    id v11 = [[SKUINetworkErrorViewController alloc] initWithError:v6];
    [(SKUINetworkErrorViewController *)v11 setClientContext:self->_clientContext];
    v14 = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [(SKUIGiftViewController *)self setViewControllers:v12];
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
    [(SKUIGift *)gift setSenderEmailAddress:v11];

    [(SKUIGiftViewController *)self _loadGiftConfiguration];
  }
  else
  {
    [(SKUIGiftViewController *)self _configurationDidLoadWithResult:0 error:v6];
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
    [(SKUIGiftViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_loadGiftConfiguration
{
  objc_initWeak(&location, self);
  if (self->_clientContext)
  {
    BOOL v3 = [SKUIGiftConfiguration alloc];
    BOOL v4 = [(SKUIGiftViewController *)self operationQueue];
    uint64_t v5 = [(SKUIGiftConfiguration *)v3 initWithOperationQueue:v4 clientContext:self->_clientContext];
    giftConfiguration = self->_giftConfiguration;
    self->_giftConfiguration = v5;

    char v7 = self->_giftConfiguration;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke;
    v12[3] = &unk_1E6424270;
    objc_copyWeak(&v13, &location);
    [(SKUIGiftConfiguration *)v7 loadConfigurationWithCompletionBlock:v12];
    objc_destroyWeak(&v13);
  }
  else
  {
    id v8 = objc_alloc_init(SKUIReloadConfigurationOperation);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_3;
    v10[3] = &unk_1E6424020;
    objc_copyWeak(&v11, &location);
    [(SKUIReloadConfigurationOperation *)v8 setOutputBlock:v10];
    CGFloat v9 = [(SKUIGiftViewController *)self operationQueue];
    [v9 addOperation:v8];

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&location);
}

void __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_2;
  block[3] = &unk_1E6424248;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _configurationDidLoadWithResult:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

void __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_4;
  block[3] = &unk_1E6424298;
  id v10 = v5;
  id v7 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v11 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    BOOL v3 = [[SKUIClientContext alloc] initWithConfigurationDictionary:*(void *)(a1 + 32)];
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
    id v6 = [(SKUIClientContext *)clientContext localizedStringForKey:v4 inTable:@"Gifting"];
  }
  else
  {
    id v7 = SKUIBundle();
    id v6 = [v7 localizedStringForKey:v4 value:&stru_1F1C879E8 table:0];
  }

  return v6;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SKUIGift)gift
{
  return self->_gift;
}

- (SKUIGiftViewControllerDelegate)giftDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_giftDelegate);

  return (SKUIGiftViewControllerDelegate *)WeakRetained;
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

- (void)initWithGift:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftViewController initWithGift:]";
}

@end