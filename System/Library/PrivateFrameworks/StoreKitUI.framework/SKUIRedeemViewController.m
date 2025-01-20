@interface SKUIRedeemViewController
+ (BOOL)redeemRequiresNationalId:(id)a3;
- (BOOL)attempsAutomaticRedeem;
- (BOOL)cameraRedeemVisible;
- (BOOL)finishedLoading;
- (BOOL)shouldPerformInitialOperationOnAppear;
- (NSOperationQueue)operationQueue;
- (NSString)initialCode;
- (SKUIClientContext)clientContext;
- (SKUIRedeemConfiguration)redeemConfiguration;
- (SKUIRedeemViewCameraOverrideDelegate)cameraDelegate;
- (SKUIRedeemViewController)initWithRedeemCategory:(int64_t)a3;
- (SUClientInterface)clientInterface;
- (UIActivityIndicatorView)activityIndicator;
- (UIViewController)embeddedViewController;
- (int64_t)category;
- (void)_cancelButtonAction;
- (void)_presentLegacyRedeem;
- (void)_presentModernRedeemWithURL:(id)a3;
- (void)_redeemURLWithCompletion:(id)a3;
- (void)_setChildViewController:(id)a3;
- (void)_setup;
- (void)_setupNavigationItem;
- (void)_startActivityIndicator;
- (void)_stopActivityIndicator;
- (void)clientInterfaceDidFinishLoading:(id)a3;
- (void)loadView;
- (void)setActivityIndicator:(id)a3;
- (void)setAttempsAutomaticRedeem:(BOOL)a3;
- (void)setCameraDelegate:(id)a3;
- (void)setCameraRedeemVisible:(BOOL)a3;
- (void)setClientContext:(id)a3;
- (void)setClientInterface:(id)a3;
- (void)setEmbeddedViewController:(id)a3;
- (void)setFinishedLoading:(BOOL)a3;
- (void)setInitialCode:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setRedeemConfiguration:(id)a3;
- (void)setShouldPerformInitialOperationOnAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SKUIRedeemViewController

- (SKUIRedeemViewController)initWithRedeemCategory:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIRedeemViewController initWithRedeemCategory:]();
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemViewController;
  v6 = [(SKUIRedeemViewController *)&v8 initWithRootViewController:v5];

  if (v6)
  {
    v6->_category = a3;
    [(SKUIRedeemViewController *)v6 _setup];
  }
  return v6;
}

+ (BOOL)redeemRequiresNationalId:(id)a3
{
  return +[SKUIRedeemViewControllerLegacy redeemRequiresNationalId:a3];
}

- (void)_setup
{
  [(SKUIRedeemViewController *)self setShouldPerformInitialOperationOnAppear:1];
  [(SKUIRedeemViewController *)self setModalPresentationStyle:2];

  [(SKUIRedeemViewController *)self _setupNavigationItem];
}

- (void)_setupNavigationItem
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonAction];
  v3 = [(SKUIRedeemViewController *)self topViewController];
  v4 = [v3 navigationItem];
  [v4 setLeftBarButtonItem:v5];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIRedeemViewController;
  [(SKUIRedeemViewController *)&v5 loadView];
  v3 = [(SKUIRedeemViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIRedeemViewController;
  [(SKUIRedeemViewController *)&v6 viewDidLoad];
  [(SKUIRedeemViewController *)self _startActivityIndicator];
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__SKUIRedeemViewController_viewDidLoad__block_invoke;
  v3[3] = &unk_1E6425A60;
  objc_copyWeak(&v4, &location);
  [(SKUIRedeemViewController *)self _redeemURLWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __39__SKUIRedeemViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SKUIRedeemViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E6425240;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __39__SKUIRedeemViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _stopActivityIndicator];
  if (*(void *)(a1 + 32)) {
    objc_msgSend(WeakRetained, "_presentModernRedeemWithURL:");
  }
  else {
    [WeakRetained _presentLegacyRedeem];
  }
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIRedeemViewController;
  [(SKUIRedeemViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(SKUIRedeemViewController *)self activityIndicator];
  id v4 = [(SKUIRedeemViewController *)self view];
  [v4 center];
  objc_msgSend(v3, "setCenter:");
}

- (void)_presentLegacyRedeem
{
  [(SKUIRedeemViewController *)self _stopActivityIndicator];
  objc_super v8 = [[SKUIRedeemViewControllerLegacy alloc] initWithRedeemCategory:[(SKUIRedeemViewController *)self category]];
  [(SKUIRedeemViewControllerLegacy *)v8 setAttempsAutomaticRedeem:[(SKUIRedeemViewController *)self attempsAutomaticRedeem]];
  id v3 = [(SKUIRedeemViewController *)self cameraDelegate];
  [(SKUIRedeemViewControllerLegacy *)v8 setCameraDelegate:v3];

  id v4 = [(SKUIRedeemViewController *)self initialCode];
  [(SKUIRedeemViewControllerLegacy *)v8 setInitialCode:v4];

  objc_super v5 = [(SKUIRedeemViewController *)self clientContext];
  [(SKUIRedeemViewControllerLegacy *)v8 setClientContext:v5];

  [(SKUIRedeemViewControllerLegacy *)v8 setCameraRedeemVisible:[(SKUIRedeemViewController *)self cameraRedeemVisible]];
  id v6 = [(SKUIRedeemViewController *)self operationQueue];
  [(SKUIRedeemViewControllerLegacy *)v8 setOperationQueue:v6];

  id v7 = [(SKUIRedeemViewController *)self redeemConfiguration];
  [(SKUIRedeemViewControllerLegacy *)v8 setRedeemConfiguration:v7];

  [(SKUIRedeemViewControllerLegacy *)v8 setShouldPerformInitialOperationOnAppear:[(SKUIRedeemViewController *)self shouldPerformInitialOperationOnAppear]];
  [(SKUIRedeemViewController *)self _setChildViewController:v8];
}

- (void)_presentModernRedeemWithURL:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SKUIRedeemViewController *)self initialCode];

  if (v5)
  {
    id v6 = [(SKUIRedeemViewController *)self initialCode];
    uint64_t v7 = [v4 URLByAppendingQueryParameter:@"code" value:v6];

    id v4 = (id)v7;
  }
  objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4FB8888]) initWithExternalAccountURL:v4];
  v9 = [(SKUIRedeemViewController *)self clientInterface];
  [v9 setDelegate:self];
  [v8 setClientInterface:v9];
  v10 = [v8 view];
  v11 = [MEMORY[0x1E4FB1618] whiteColor];
  [v10 setBackgroundColor:v11];

  objc_storeStrong((id *)&self->_embeddedViewController, v8);
  v12 = (void *)[objc_alloc(MEMORY[0x1E4FB88C0]) initWithChildViewController:v8];
  v13 = [v12 view];
  v14 = [MEMORY[0x1E4FB1618] whiteColor];
  [v13 setBackgroundColor:v14];

  v15 = [(SKUIRedeemViewController *)self navigationController];

  if (v15)
  {
    [(SKUIRedeemViewController *)self _setChildViewController:v12];
  }
  else
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v12];
    v17 = [v16 view];
    v18 = [MEMORY[0x1E4FB1618] whiteColor];
    [v17 setBackgroundColor:v18];

    [(SKUIRedeemViewController *)self _setChildViewController:v16];
  }
  dispatch_time_t v19 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SKUIRedeemViewController__presentModernRedeemWithURL___block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_after(v19, MEMORY[0x1E4F14428], block);
}

void __56__SKUIRedeemViewController__presentModernRedeemWithURL___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 1418))
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:*(void *)(a1 + 32) action:sel__cancelButtonAction];
    [v4 setTag:999];
    v2 = [*(id *)(a1 + 32) embeddedViewController];
    id v3 = [v2 navigationItem];
    [v3 setLeftBarButtonItem:v4 animated:1];
  }
}

- (void)_redeemURLWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4FB8818]) initWithBagContext:v4];
  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__SKUIRedeemViewController__redeemURLWithCompletion___block_invoke;
  v8[3] = &unk_1E6425A88;
  id v6 = v3;
  id v9 = v6;
  objc_copyWeak(&v10, &location);
  [v5 setCompletionBlock:v8];
  uint64_t v7 = [MEMORY[0x1E4FB8838] mainQueue];
  [v7 addOperation:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __53__SKUIRedeemViewController__redeemURLWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E4F1CB10];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v3 = [WeakRetained URLBag];
    id v4 = [v3 valueForKey:@"redeemCodeLanding"];
    objc_super v5 = [v2 URLWithString:v4];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);
  }
}

- (void)_cancelButtonAction
{
}

- (void)clientInterfaceDidFinishLoading:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_finishedLoading = 1;
  id v3 = [(SKUIRedeemViewController *)self embeddedViewController];
  id v4 = [v3 navigationItem];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v5 = objc_msgSend(v4, "leftBarButtonItems", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * v10) tag] == 999)
        {
          v12 = [v4 leftBarButtonItems];
          v13 = (void *)[v12 mutableCopy];

          [v13 removeObjectAtIndex:v8 + v10];
          [v4 setLeftBarButtonItems:v13 animated:1];

          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_setChildViewController:(id)a3
{
  id v9 = a3;
  [(SKUIRedeemViewController *)self setNavigationBarHidden:1];
  [v9 willMoveToParentViewController:self];
  id v4 = [v9 view];
  objc_super v5 = [(SKUIRedeemViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");

  uint64_t v6 = [v9 view];
  [v6 setAutoresizingMask:18];

  uint64_t v7 = [(SKUIRedeemViewController *)self view];
  uint64_t v8 = [v9 view];
  [v7 addSubview:v8];

  [(SKUIRedeemViewController *)self addChildViewController:v9];
  [v9 didMoveToParentViewController:self];
}

- (void)_startActivityIndicator
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:2];
  [v4 startAnimating];
  id v3 = [(SKUIRedeemViewController *)self view];
  [v3 addSubview:v4];

  [(SKUIRedeemViewController *)self setActivityIndicator:v4];
}

- (void)_stopActivityIndicator
{
  id v3 = [(SKUIRedeemViewController *)self activityIndicator];
  [v3 stopAnimating];
  [v3 removeFromSuperview];
  [(SKUIRedeemViewController *)self setActivityIndicator:0];
}

- (int64_t)category
{
  return self->_category;
}

- (BOOL)attempsAutomaticRedeem
{
  return self->_attempsAutomaticRedeem;
}

- (void)setAttempsAutomaticRedeem:(BOOL)a3
{
  self->_attempsAutomaticRedeem = a3;
}

- (SKUIRedeemViewCameraOverrideDelegate)cameraDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);

  return (SKUIRedeemViewCameraOverrideDelegate *)WeakRetained;
}

- (void)setCameraDelegate:(id)a3
{
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (void)setInitialCode:(id)a3
{
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
}

- (BOOL)cameraRedeemVisible
{
  return self->_cameraRedeemVisible;
}

- (void)setCameraRedeemVisible:(BOOL)a3
{
  self->_cameraRedeemVisible = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIViewController)embeddedViewController
{
  return self->_embeddedViewController;
}

- (void)setEmbeddedViewController:(id)a3
{
}

- (BOOL)finishedLoading
{
  return self->_finishedLoading;
}

- (void)setFinishedLoading:(BOOL)a3
{
  self->_finishedLoading = a3;
}

- (SKUIRedeemConfiguration)redeemConfiguration
{
  return self->_redeemConfiguration;
}

- (void)setRedeemConfiguration:(id)a3
{
}

- (BOOL)shouldPerformInitialOperationOnAppear
{
  return self->_shouldPerformInitialOperationOnAppear;
}

- (void)setShouldPerformInitialOperationOnAppear:(BOOL)a3
{
  self->_shouldPerformInitialOperationOnAppear = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemConfiguration, 0);
  objc_storeStrong((id *)&self->_embeddedViewController, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_initialCode, 0);

  objc_destroyWeak((id *)&self->_cameraDelegate);
}

- (void)initWithRedeemCategory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "-[SKUIRedeemViewController initWithRedeemCategory:]";
}

@end