@interface SKUIStorePageViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
- (BOOL)isSkLoading;
- (BOOL)performTestWithName:(id)a3 options:(id)a4;
- (BOOL)sectionsViewController:(id)a3 showProductPageForItem:(id)a4;
- (BOOL)sectionsViewController:(id)a3 showStorePageForURL:(id)a4;
- (NSOperationQueue)operationQueue;
- (SKUIClientContext)clientContext;
- (SKUIStorePage)storePage;
- (SKUIStorePageDelegate)delegate;
- (SKUIStorePageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIRefreshControl)refreshControl;
- (id)_colorScheme;
- (id)_sectionsViewController;
- (id)activeMetricsController;
- (unint64_t)supportedInterfaceOrientations;
- (void)_loadWithOperation:(id)a3 completionBlock:(id)a4;
- (void)_metricsEnterEventNotification:(id)a3;
- (void)_recordMetricsPageEvent:(id)a3 forStorePage:(id)a4;
- (void)_reloadStorePage;
- (void)_runPerformanceTestAfterIdle;
- (void)_runPerformanceTestAfterPageLoad;
- (void)_runScrollTestWithName:(id)a3 options:(id)a4;
- (void)_setMetricsController:(id)a3;
- (void)_setStorePage:(id)a3 error:(id)a4;
- (void)_showProductPage:(id)a3 withPageEvent:(id)a4;
- (void)cancelPageLoad;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)loadURL:(id)a3 withCompletionBlock:(id)a4;
- (void)loadURL:(id)a3 withDataConsumer:(id)a4 completionBlock:(id)a5;
- (void)loadURLRequest:(id)a3 withCompletionBlock:(id)a4;
- (void)loadURLRequest:(id)a3 withDataConsumer:(id)a4 completionBlock:(id)a5;
- (void)loadView;
- (void)loadWithJSONData:(id)a3 fromOperation:(id)a4 completionBlock:(id)a5;
- (void)sectionsViewControllerDidDismissOverlayController:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMetricsController:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setRefreshControl:(id)a3;
- (void)setStorePage:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SKUIStorePageViewController

- (SKUIStorePageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStorePageViewController initWithNibName:bundle:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIStorePageViewController;
  v8 = [(SKUIStorePageViewController *)&v13 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    [(SKUIStorePageViewController *)v8 setRestorationClass:objc_opt_class()];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [(SKUIStorePageViewController *)v8 setRestorationIdentifier:v10];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v8 selector:sel__metricsEnterEventNotification_ name:@"SKUIMetricsDidRecordEnterEventNotification" object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SKUIMetricsDidRecordEnterEventNotification" object:0];
  [(SKUIStorePageSectionsViewController *)self->_sectionsViewController setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUIStorePageViewController;
  [(SKUIStorePageViewController *)&v4 dealloc];
}

- (void)cancelPageLoad
{
  [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
  [(SSVLoadURLOperation *)self->_loadOperation cancel];
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;
}

- (BOOL)isSkLoading
{
  return self->_loadOperation != 0;
}

- (void)loadURL:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F18DA8];
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)[[v6 alloc] initWithURL:v8];

  [(SKUIStorePageViewController *)self loadURLRequest:v9 withCompletionBlock:v7];
}

- (void)loadURL:(id)a3 withDataConsumer:(id)a4 completionBlock:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F18DA8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)[[v8 alloc] initWithURL:v11];

  [(SKUIStorePageViewController *)self loadURLRequest:v12 withDataConsumer:v10 completionBlock:v9];
}

- (void)loadURLRequest:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SSVURLDataConsumer consumer];
  [(SKUIStorePageViewController *)self loadURLRequest:v7 withDataConsumer:v8 completionBlock:v6];
}

- (void)loadURLRequest:(id)a3 withDataConsumer:(id)a4 completionBlock:(id)a5
{
  v20 = (NSURLRequest *)a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v20;
  if (v20)
  {
    if (v8) {
      goto LABEL_6;
    }
    id v11 = @"nil consumer";
  }
  else
  {
    id v11 = @"nil request";
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:v11];
  id v10 = v20;
LABEL_6:
  if (self->_lastRequest != v10)
  {
    id v12 = (NSURLRequest *)[(NSURLRequest *)v20 copy];
    lastRequest = self->_lastRequest;
    self->_lastRequest = v12;
  }
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastDataConsumerClassName = self->_lastDataConsumerClassName;
  self->_lastDataConsumerClassName = v15;

  lastPageEvent = self->_lastPageEvent;
  self->_lastPageEvent = 0;

  v18 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURLRequest:v20];
  [v18 setDataConsumer:v8];
  v19 = [(SKUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
  [v18 setStoreFrontSuffix:v19];

  [(SKUIStorePageViewController *)self _loadWithOperation:v18 completionBlock:v9];
}

- (NSOperationQueue)operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    objc_super v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:4];
    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void)setMetricsController:(id)a3
{
  metricsController = self->_metricsController;
  self->_metricsController = 0;
  id v5 = a3;

  [(SKUIStorePageViewController *)self _setMetricsController:v5];
}

- (void)setRefreshControl:(id)a3
{
  id v5 = (UIRefreshControl *)a3;
  p_refreshControl = &self->_refreshControl;
  refreshControl = self->_refreshControl;
  if (refreshControl != v5)
  {
    objc_super v13 = v5;
    [(UIRefreshControl *)refreshControl removeFromSuperview];
    objc_storeStrong((id *)&self->_refreshControl, a3);
    [(UIRefreshControl *)*p_refreshControl setAutoresizingMask:2];
    id v8 = [(SKUIStorePageSectionsViewController *)self->_sectionsViewController collectionView];
    if (v8)
    {
      [(UIRefreshControl *)*p_refreshControl frame];
      double v10 = v9;
      double v12 = v11;
      [v8 bounds];
      -[UIRefreshControl setFrame:](*p_refreshControl, "setFrame:", v10, v12);
      [v8 _addContentSubview:*p_refreshControl atBack:1];
    }

    id v5 = v13;
  }

  MEMORY[0x1F41817F8](refreshControl, v5);
}

- (void)setStorePage:(id)a3
{
  if (self->_storePage != a3)
  {
    objc_super v4 = (SKUIStorePage *)[a3 copy];
    storePage = self->_storePage;
    self->_storePage = v4;

    [(SKUIStorePageSectionsViewController *)self->_sectionsViewController dismissOverlays];
    [(SKUIStorePageViewController *)self _reloadStorePage];
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"SKUIApplicationPageDidDisplayNotification" object:self];
  }
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  [(SKUIStorePageViewController *)self setTitle:v5];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"consumerClass"];
  lastDataConsumerClassName = self->_lastDataConsumerClassName;
  self->_lastDataConsumerClassName = v6;

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"request"];
  lastRequest = self->_lastRequest;
  self->_lastRequest = v8;

  self->_loadOnAppear = self->_lastRequest != 0;
  double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorScheme"];
  placeholderColorScheme = self->_placeholderColorScheme;
  self->_placeholderColorScheme = v10;

  double v12 = [(SKUIStorePageViewController *)self _sectionsViewController];
  SKUIDecodeRestorableStateWithCoder(v4, @"sectionsVC", v12);
  objc_super v13 = [(SKUIStorePageViewController *)self _colorScheme];
  [v12 setColorScheme:v13];

  v14.receiver = self;
  v14.super_class = (Class)SKUIStorePageViewController;
  [(SKUIStorePageViewController *)&v14 decodeRestorableStateWithCoder:v4];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  metricsController = self->_metricsController;
  id v6 = SKUIMetricsWindowOrientationForInterfaceOrientation([(SKUIStorePageViewController *)self interfaceOrientation]);
  [(SKUIMetricsController *)metricsController setWindowOrientation:v6];

  v7.receiver = self;
  v7.super_class = (Class)SKUIStorePageViewController;
  [(SKUIStorePageViewController *)&v7 didRotateFromInterfaceOrientation:a3];
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  sectionsViewController = self->_sectionsViewController;
  id v5 = a3;
  SKUIEncodeRestorableStateWithCoder(v5, @"sectionsVC", sectionsViewController);
  id v6 = [(SKUIStorePageViewController *)self _colorScheme];
  [v5 encodeObject:v6 forKey:@"colorScheme"];

  objc_super v7 = [(SKUIStorePageViewController *)self title];
  [v5 encodeObject:v7 forKey:@"title"];

  [v5 encodeObject:self->_lastDataConsumerClassName forKey:@"consumerClass"];
  [v5 encodeObject:self->_lastRequest forKey:@"request"];
  v8.receiver = self;
  v8.super_class = (Class)SKUIStorePageViewController;
  [(SKUIStorePageViewController *)&v8 encodeRestorableStateWithCoder:v5];
}

- (void)loadView
{
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v3 = [(SKUIStorePageViewController *)self _sectionsViewController];
  id v4 = [v3 view];
  [v4 setAutoresizingMask:18];
  [v6 bounds];
  objc_msgSend(v4, "setFrame:");
  [v6 addSubview:v4];
  if (self->_refreshControl)
  {
    id v5 = [v3 collectionView];
    [v5 _addContentSubview:self->_refreshControl atBack:1];
  }
  [(SKUIStorePageViewController *)self setView:v6];
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

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_loadOnAppear)
  {
    self->_loadOnAppear = 0;
    if (!self->_storePage && !self->_loadOperation)
    {
      lastRequest = self->_lastRequest;
      if (lastRequest)
      {
        lastDataConsumerClassName = self->_lastDataConsumerClassName;
        if (lastDataConsumerClassName
          && ([NSClassFromString(lastDataConsumerClassName) consumer],
              uint64_t v7 = objc_claimAutoreleasedReturnValue(),
              lastRequest = self->_lastRequest,
              v7))
        {
          objc_super v8 = (void *)v7;
          [(SKUIStorePageViewController *)self loadURLRequest:lastRequest withDataConsumer:v7 completionBlock:0];
        }
        else
        {
          [(SKUIStorePageViewController *)self loadURLRequest:lastRequest withCompletionBlock:0];
        }
      }
    }
  }
  else if (self->_metricsController)
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      double v10 = [MEMORY[0x1E4F1C9C8] date];
      [(SSMetricsPageEvent *)lastPageEvent setOriginalTimeUsingDate:v10];

      [(SKUIMetricsController *)self->_metricsController recordEvent:self->_lastPageEvent];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIStorePageViewController;
  [(SKUIStorePageViewController *)&v11 viewWillAppear:v3];
}

- (id)activeMetricsController
{
  return self->_metricsController;
}

- (BOOL)sectionsViewController:(id)a3 showProductPageForItem:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 storePage:self showProductPageForItem:v5];
  }
  return v7 & 1;
}

- (BOOL)sectionsViewController:(id)a3 showStorePageForURL:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 storePage:self showStorePageForURL:v5];
  }
  return v7 & 1;
}

- (void)sectionsViewControllerDidDismissOverlayController:(id)a3
{
  if (SKUIViewControllerIsVisible(self))
  {
    if (self->_metricsController)
    {
      lastPageEvent = self->_lastPageEvent;
      if (lastPageEvent)
      {
        id v5 = [MEMORY[0x1E4F1C9C8] date];
        [(SSMetricsPageEvent *)lastPageEvent setOriginalTimeUsingDate:v5];

        metricsController = self->_metricsController;
        char v7 = self->_lastPageEvent;
        [(SKUIMetricsController *)metricsController recordEvent:v7];
      }
    }
  }
}

- (BOOL)performTestWithName:(id)a3 options:(id)a4
{
  id v6 = a4;
  char v7 = (NSString *)[a3 copy];
  performanceTestName = self->_performanceTestName;
  self->_performanceTestName = v7;

  double v9 = (NSDictionary *)[v6 copy];
  performanceTestOptions = self->_performanceTestOptions;
  self->_performanceTestOptions = v9;

  return 1;
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v4 = objc_alloc_init((Class)a1);
  id v5 = +[SKUIStateRestorationContext sharedContext];
  id v6 = [v5 clientContext];
  [v4 setClientContext:v6];

  return v4;
}

- (void)_metricsEnterEventNotification:(id)a3
{
  if (SKUIViewControllerIsVisible(self) && self->_lastPageEvent)
  {
    id v4 = [(SKUIStorePageViewController *)self presentedViewController];
    if (v4)
    {
    }
    else if (![(SKUIStorePageSectionsViewController *)self->_sectionsViewController isDisplayingOverlays])
    {
      lastPageEvent = self->_lastPageEvent;
      id v6 = [MEMORY[0x1E4F1C9C8] date];
      [(SSMetricsPageEvent *)lastPageEvent setOriginalTimeUsingDate:v6];

      metricsController = self->_metricsController;
      id v8 = self->_lastPageEvent;
      [(SKUIMetricsController *)metricsController recordEvent:v8];
    }
  }
}

- (void)loadWithJSONData:(id)a3 fromOperation:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = [v9 URLRequest];
  obj = v11;
  if (self->_lastRequest != v11) {
    objc_storeStrong((id *)&self->_lastRequest, v11);
  }
  lastDataConsumerClassName = self->_lastDataConsumerClassName;
  self->_lastDataConsumerClassName = (NSString *)@"SKUIStorePageDataConsumer";

  lastPageEvent = self->_lastPageEvent;
  self->_lastPageEvent = 0;

  objc_super v14 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithData:v10 fromOperation:v9];
  v15 = +[SSVURLDataConsumer consumer];
  [v14 setDataConsumer:v15];

  [(SKUIStorePageViewController *)self _loadWithOperation:v14 completionBlock:v8];
}

- (id)_colorScheme
{
  storePage = self->_storePage;
  if (storePage)
  {
    id v4 = [(SKUIStorePage *)storePage uber];
    id v5 = v4;
    if (!v4 || ([v4 colorScheme], (id v6 = (SKUIColorScheme *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      char v7 = [(SKUIStorePage *)self->_storePage backgroundArtwork];

      if (v7) {
        id v6 = objc_alloc_init(SKUIColorScheme);
      }
      else {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = self->_placeholderColorScheme;
  }

  return v6;
}

- (void)_loadWithOperation:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  p_loadOperation = &self->_loadOperation;
  [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
  [(SSVLoadURLOperation *)self->_loadOperation cancel];
  objc_storeStrong((id *)&self->_loadOperation, a3);
  objc_initWeak(&location, self);
  loadOperation = self->_loadOperation;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__SKUIStorePageViewController__loadWithOperation_completionBlock___block_invoke;
  v19[3] = &unk_1E6425380;
  objc_copyWeak(&v21, &location);
  id v11 = v8;
  id v20 = v11;
  [(SSVLoadURLOperation *)loadOperation setOutputBlock:v19];
  if (!self->_metricsController)
  {
    clientContext = self->_clientContext;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __66__SKUIStorePageViewController__loadWithOperation_completionBlock___block_invoke_3;
    v17 = &unk_1E64253A8;
    objc_copyWeak(&v18, &location);
    [(SKUIClientContext *)clientContext getDefaultMetricsControllerWithCompletionBlock:&v14];
    objc_destroyWeak(&v18);
  }
  objc_super v13 = [(SKUIStorePageViewController *)self operationQueue];
  [v13 addOperation:*p_loadOperation];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __66__SKUIStorePageViewController__loadWithOperation_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SKUIStorePageViewController__loadWithOperation_completionBlock___block_invoke_2;
  v9[3] = &unk_1E6425358;
  id v10 = v5;
  id v7 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __66__SKUIStorePageViewController__loadWithOperation_completionBlock___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = *(id *)(a1 + 32);
  }
  else {
    id v4 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _setStorePage:v4 error:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, BOOL, void))(v3 + 16))(v3, v4 != 0, *(void *)(a1 + 40));
  }
}

void __66__SKUIStorePageViewController__loadWithOperation_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setMetricsController:v3];
}

- (void)_recordMetricsPageEvent:(id)a3 forStorePage:(id)a4
{
  id v7 = a3;
  id v8 = (SKUIStorePage *)a4;
  id v9 = v8;
  if (self->_metricsController)
  {
    if (self->_storePage == v8)
    {
      id v10 = [(SKUIStorePageViewController *)self navigationController];
      id v11 = [v10 viewControllers];
      unint64_t v12 = [v11 count];

      if (v12 >= 2) {
        [v7 setNavigationType:*MEMORY[0x1E4FA88C0]];
      }
      id v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSince1970];
      objc_msgSend(v7, "setPageRenderTime:");

      uint64_t v14 = [(SKUIStorePage *)v9 uber];
      [v7 setUbered:v14 != 0];

      if (![(SKUIStorePageSectionsViewController *)self->_sectionsViewController isDisplayingOverlays])[(SKUIMetricsController *)self->_metricsController recordEvent:v7]; {
      objc_storeStrong((id *)&self->_lastPageEvent, a3);
      }
    }
  }
  else
  {
    objc_initWeak(&location, self);
    clientContext = self->_clientContext;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__SKUIStorePageViewController__recordMetricsPageEvent_forStorePage___block_invoke;
    v16[3] = &unk_1E64253D0;
    objc_copyWeak(&v19, &location);
    id v17 = v7;
    id v18 = v9;
    [(SKUIClientContext *)clientContext getDefaultMetricsControllerWithCompletionBlock:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __68__SKUIStorePageViewController__recordMetricsPageEvent_forStorePage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _setMetricsController:v4];

  if (v4)
  {
    id v6 = objc_loadWeakRetained(v3);
    [v6 _recordMetricsPageEvent:*(void *)(a1 + 32) forStorePage:*(void *)(a1 + 40)];
  }
}

- (void)_reloadStorePage
{
  metricsController = self->_metricsController;
  id v4 = [(SKUIStorePage *)self->_storePage metricsConfiguration];
  [(SKUIMetricsController *)metricsController setPageConfiguration:v4];

  id v5 = self->_metricsController;
  id v6 = [(SKUIStorePage *)self->_storePage pageURL];
  id v7 = [v6 absoluteString];
  [(SKUIMetricsController *)v5 setPageURL:v7];

  sectionsViewController = self->_sectionsViewController;
  id v9 = [(SKUIStorePageViewController *)self _colorScheme];
  [(SKUIStorePageSectionsViewController *)sectionsViewController setColorScheme:v9];

  id v10 = self->_sectionsViewController;
  id v11 = [(SKUIStorePage *)self->_storePage pageComponents];
  [(SKUIStorePageSectionsViewController *)v10 setSectionsWithPageComponents:v11];
}

- (void)_runPerformanceTestAfterIdle
{
  if ([(NSString *)self->_performanceTestName hasPrefix:@"Switch"])
  {
    SKUIViewControllerGetAncestorTabBarController(self);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [(NSDictionary *)self->_performanceTestOptions objectForKey:@"destinationTabIndex"];
    uint64_t v4 = [v3 integerValue];

    if ([v14 selectedIndex] != v4)
    {
      id v5 = [v14 viewControllers];
      id v6 = [v5 objectAtIndex:v4];

      id v7 = [v6 topViewController];
      char v8 = objc_opt_respondsToSelector();
      id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
      id v10 = v9;
      performanceTestName = self->_performanceTestName;
      if (v8)
      {
        [v9 startedTest:performanceTestName];

        [v7 performTestWithName:self->_performanceTestName options:self->_performanceTestOptions];
        [v14 setSelectedIndex:v4];
      }
      else
      {
        [v9 failedTest:performanceTestName];
      }
      unint64_t v12 = self->_performanceTestName;
      self->_performanceTestName = 0;

      performanceTestOptions = self->_performanceTestOptions;
      self->_performanceTestOptions = 0;
    }
  }
}

- (void)_runPerformanceTestAfterPageLoad
{
  if ([(NSString *)self->_performanceTestName hasPrefix:@"launch"])
  {
    id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 finishedTest:self->_performanceTestName extraResults:0];

    performanceTestName = self->_performanceTestName;
    self->_performanceTestName = 0;

    performanceTestOptions = self->_performanceTestOptions;
    self->_performanceTestOptions = 0;
LABEL_9:

    return;
  }
  if ([(NSString *)self->_performanceTestName hasPrefix:@"Scroll"])
  {
    dispatch_time_t v6 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SKUIStorePageViewController__runPerformanceTestAfterPageLoad__block_invoke;
    block[3] = &unk_1E6422020;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x1E4F14428], block);
    return;
  }
  if ([(NSString *)self->_performanceTestName hasPrefix:@"Switch"])
  {
    id v7 = [(NSDictionary *)self->_performanceTestOptions objectForKey:@"destinationTabIndex"];
    uint64_t v8 = [v7 integerValue];

    SKUIViewControllerGetAncestorTabBarController(self);
    unint64_t v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if ([(NSDictionary *)v12 selectedIndex] == v8)
    {
      id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v9 finishedTest:self->_performanceTestName extraResults:0];

      id v10 = self->_performanceTestName;
      self->_performanceTestName = 0;

      id v11 = self->_performanceTestOptions;
      self->_performanceTestOptions = 0;
    }
    performanceTestOptions = v12;
    goto LABEL_9;
  }
}

void __63__SKUIStorePageViewController__runPerformanceTestAfterPageLoad__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _runScrollTestWithName:*(void *)(*(void *)(a1 + 32) + 1048) options:*(void *)(*(void *)(a1 + 32) + 1056)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1048);
  *(void *)(v2 + 1048) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 1056);
  *(void *)(v4 + 1056) = 0;
}

- (void)_runScrollTestWithName:(id)a3 options:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  id v7 = [(SKUIStorePageSectionsViewController *)self->_sectionsViewController collectionView];
  uint64_t v8 = v7;
  if (([v7 isScrollEnabled] & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    id v10 = [v7 cellForItemAtIndexPath:v9];

    id v11 = [v10 subviews];
    unint64_t v12 = (void *)[v11 mutableCopy];

    uint64_t v13 = [v12 count];
    uint64_t v8 = v7;
    if (v13 >= 1)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0;
      while (1)
      {
        uint64_t v8 = [v12 objectAtIndex:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        v16 = [v8 subviews];
        if (v16)
        {
          [v12 addObjectsFromArray:v16];
          uint64_t v14 = [v12 count];
        }

        if (++v15 >= v14)
        {
          uint64_t v8 = v7;
          goto LABEL_10;
        }
      }
    }
LABEL_10:
  }
  id v17 = [v6 objectForKey:@"iterations"];
  uint64_t v18 = [v17 intValue];
  id v19 = [v6 objectForKey:@"offset"];
  uint64_t v20 = [v19 intValue];
  [v8 contentSize];
  [v8 _performScrollTest:v22 iterations:v18 delta:v20 length:(int)v21];
}

- (id)_sectionsViewController
{
  sectionsViewController = self->_sectionsViewController;
  if (!sectionsViewController)
  {
    uint64_t v4 = objc_alloc_init(SKUIStorePageSectionsViewController);
    id v5 = self->_sectionsViewController;
    self->_sectionsViewController = v4;

    id v6 = self->_sectionsViewController;
    id v7 = [(SKUIStorePageViewController *)self clientContext];
    [(SKUIViewController *)v6 setClientContext:v7];

    [(SKUIStorePageSectionsViewController *)self->_sectionsViewController setDelegate:self];
    uint64_t v8 = self->_sectionsViewController;
    id v9 = [(SKUIStorePageViewController *)self operationQueue];
    [(SKUIViewController *)v8 setOperationQueue:v9];

    id v10 = self->_sectionsViewController;
    id v11 = [(SKUIStorePageViewController *)self _colorScheme];
    [(SKUIStorePageSectionsViewController *)v10 setColorScheme:v11];

    [(SKUIStorePageSectionsViewController *)self->_sectionsViewController setMetricsController:self->_metricsController];
    storePage = self->_storePage;
    if (storePage)
    {
      uint64_t v13 = self->_sectionsViewController;
      uint64_t v14 = [(SKUIStorePage *)storePage pageComponents];
      [(SKUIStorePageSectionsViewController *)v13 setSectionsWithPageComponents:v14];
    }
    [(SKUIStorePageViewController *)self addChildViewController:self->_sectionsViewController];
    sectionsViewController = self->_sectionsViewController;
  }

  return sectionsViewController;
}

- (void)_setMetricsController:(id)a3
{
  id v5 = a3;
  p_metricsController = &self->_metricsController;
  if (!self->_metricsController)
  {
    id v20 = v5;
    objc_storeStrong((id *)&self->_metricsController, a3);
    id v7 = *p_metricsController;
    uint64_t v8 = [(SKUIStorePage *)self->_storePage metricsConfiguration];
    [(SKUIMetricsController *)v7 setPageConfiguration:v8];

    id v9 = *p_metricsController;
    id v10 = [(SKUIClientContext *)self->_clientContext metricsPageContextForViewController:self];
    [(SKUIMetricsController *)v9 setPageContext:v10];

    id v11 = *p_metricsController;
    unint64_t v12 = [(SKUIStorePage *)self->_storePage pageURL];
    uint64_t v13 = [v12 absoluteString];
    [(SKUIMetricsController *)v11 setPageURL:v13];

    uint64_t v14 = *p_metricsController;
    uint64_t v15 = [MEMORY[0x1E4FB1438] sharedApplication];
    v16 = SKUIMetricsWindowOrientationForInterfaceOrientation([v15 statusBarOrientation]);
    [(SKUIMetricsController *)v14 setWindowOrientation:v16];

    [(SKUIStorePageSectionsViewController *)self->_sectionsViewController setMetricsController:*p_metricsController];
    id v17 = *p_metricsController;
    uint64_t v18 = [(SKUIStorePage *)self->_storePage metricsConfiguration];
    id v19 = [v18 pingURLs];
    [(SKUIMetricsController *)v17 pingURLs:v19 withClientContext:self->_clientContext];

    id v5 = v20;
  }
}

- (void)_setStorePage:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = [v6 productPage];
  if (v7)
  {
    uint64_t v8 = [(SSVLoadURLOperation *)self->_loadOperation metricsPageEvent];
    [(SKUIStorePageViewController *)self _showProductPage:v7 withPageEvent:v8];
LABEL_10:

    goto LABEL_11;
  }
  id v9 = [v6 pageType];
  int v10 = [v9 isEqualToString:@"itml"];

  if (v10)
  {
    uint64_t v8 = [(SKUIStorePageViewController *)self clientContext];
    id v11 = [v6 ITMLData];
    unint64_t v12 = [v6 ITMLResponse];
    [v8 sendOnPageResponseWithDocument:0 data:v11 URLResponse:v12 performanceMetrics:0];

LABEL_9:
    goto LABEL_10;
  }
  if (v6)
  {
    objc_storeStrong((id *)&self->_storePage, a3);
    [(SKUIStorePageViewController *)self _reloadStorePage];
    uint64_t v13 = [(SSVLoadURLOperation *)self->_loadOperation metricsPageEvent];
    uint64_t v8 = v13;
    if (v13)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__SKUIStorePageViewController__setStorePage_error___block_invoke;
      block[3] = &unk_1E64225B0;
      block[4] = self;
      id v19 = v13;
      id v20 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    metricsController = self->_metricsController;
    uint64_t v15 = [(SKUIStorePage *)self->_storePage metricsConfiguration];
    v16 = [v15 pingURLs];
    [(SKUIMetricsController *)metricsController pingURLs:v16 withClientContext:self->_clientContext];

    [(SKUIStorePageViewController *)self _runPerformanceTestAfterPageLoad];
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"SKUIApplicationPageDidDisplayNotification" object:self];
    goto LABEL_9;
  }
LABEL_11:
  [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;
}

uint64_t __51__SKUIStorePageViewController__setStorePage_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recordMetricsPageEvent:*(void *)(a1 + 40) forStorePage:*(void *)(a1 + 48)];
}

- (void)_showProductPage:(id)a3 withPageEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 item];
  uint64_t v9 = [v8 itemKind];

  if (SKUIItemKindIsSoftwareKind(v9) || v9 == 5)
  {
    id v17 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v18 = [v17 userInterfaceIdiom];

    if (v18 == 1)
    {
      [(SKUIStorePageSectionsViewController *)self->_sectionsViewController showOverlayWithProductPage:v6 metricsPageEvent:v7];
    }
    else
    {
      id v19 = [[SKUIIPhoneProductPageViewController alloc] initWithProductPage:v6];
      id v20 = [(SKUIStorePageViewController *)self clientContext];
      [(SKUIViewController *)v19 setClientContext:v20];

      [(SKUIIPhoneProductPageViewController *)v19 configureMetricsWithPageEvent:v7];
      double v21 = [(SKUIStorePageViewController *)self navigationController];
      id v22 = [v21 viewControllers];
      v23 = (void *)[v22 mutableCopy];

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __62__SKUIStorePageViewController__showProductPage_withPageEvent___block_invoke_2;
      v26[3] = &unk_1E6425420;
      v26[4] = self;
      uint64_t v24 = [v23 indexOfObjectPassingTest:v26];
      if (v24 == 0x7FFFFFFFFFFFFFFFLL) {
        [v23 addObject:v19];
      }
      else {
        [v23 replaceObjectAtIndex:v24 withObject:v19];
      }
      [v21 setViewControllers:v23 animated:0];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__SKUIStorePageViewController__showProductPage_withPageEvent___block_invoke_3;
      block[3] = &unk_1E6422020;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F3C310]);
    [v10 setAutomaticallyDismisses:1];
    id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    unint64_t v12 = NSNumber;
    uint64_t v13 = [v6 item];
    uint64_t v14 = objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(v13, "itemIdentifier"));
    uint64_t v15 = objc_msgSend(v11, "initWithObjectsAndKeys:", v14, *MEMORY[0x1E4F3C3A8], 0);

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __62__SKUIStorePageViewController__showProductPage_withPageEvent___block_invoke;
    v27[3] = &unk_1E64253F8;
    id v28 = v10;
    id v16 = v10;
    [v16 loadProductWithParameters:v15 completionBlock:v27];
    [(SKUIStorePageViewController *)self presentViewController:v16 animated:1 completion:0];
  }
}

uint64_t __62__SKUIStorePageViewController__showProductPage_withPageEvent___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) dismissViewControllerAnimated:1 completion:0];
  }
  return result;
}

BOOL __62__SKUIStorePageViewController__showProductPage_withPageEvent___block_invoke_2(uint64_t a1, void *a2)
{
  return SKUIViewControllerIsDescendent(*(void **)(a1 + 32), a2);
}

uint64_t __62__SKUIStorePageViewController__showProductPage_withPageEvent___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelPageLoad];
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUIStorePageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIStorePageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setOperationQueue:(id)a3
{
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (SKUIStorePage)storePage
{
  return self->_storePage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePage, 0);
  objc_storeStrong((id *)&self->_sectionsViewController, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_placeholderColorScheme, 0);
  objc_storeStrong((id *)&self->_performanceTestOptions, 0);
  objc_storeStrong((id *)&self->_performanceTestName, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_lastRequest, 0);
  objc_storeStrong((id *)&self->_lastPageEvent, 0);
  objc_storeStrong((id *)&self->_lastDataConsumerClassName, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIStorePageViewController initWithNibName:bundle:]";
}

@end