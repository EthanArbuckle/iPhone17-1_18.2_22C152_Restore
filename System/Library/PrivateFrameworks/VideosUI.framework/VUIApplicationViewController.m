@interface VUIApplicationViewController
- (Class)_applicationControllerClass;
- (UINavigationController)navigationController;
- (VUITVApplicationController)applicationController;
- (_TtC8VideosUI20VUIJetPackController)jetPackController;
- (id)_initialViewControllerWithAppContext:(id)a3;
- (id)_launchOptions;
- (id)preferredFocusEnvironments;
- (void)_startApplicationControllerWithBootURL:(id)a3;
- (void)appController:(id)a3 didFailWithError:(id)a4;
- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)dealloc;
- (void)setApplicationController:(id)a3;
- (void)setJetPackController:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)viewDidLoad;
@end

@implementation VUIApplicationViewController

- (void)dealloc
{
  [(VUITVApplicationController *)self->_applicationController stop];
  navigationController = self->_navigationController;
  if (navigationController)
  {
    [(UINavigationController *)navigationController willMoveToParentViewController:0];
    v4 = [(UINavigationController *)self->_navigationController view];
    [v4 removeFromSuperview];
    [(UINavigationController *)self->_navigationController removeFromParentViewController];
  }
  v5.receiver = self;
  v5.super_class = (Class)VUIApplicationViewController;
  [(VUIApplicationViewController *)&v5 dealloc];
}

- (id)preferredFocusEnvironments
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUIApplicationViewController *)self navigationController];
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VUIApplicationViewController;
    uint64_t v5 = [(VUIApplicationViewController *)&v8 preferredFocusEnvironments];
  }
  v6 = (void *)v5;

  return v6;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)VUIApplicationViewController;
  [(VUIApplicationViewController *)&v12 viewDidLoad];
  uint64_t v3 = kVUIBagTVAppJetpackURL;
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v5 = +[VUIJetPackController controllerWithBagKey:v3 defaults:v4 urlOverrideDefaultKey:@"boot-url"];

  [(VUIApplicationViewController *)self setJetPackController:v5];
  objc_initWeak(&location, self);
  v6 = [v5 getJetPackSource];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__VUIApplicationViewController_viewDidLoad__block_invoke;
  v8[3] = &unk_1E6DF6CE8;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  id v9 = v7;
  [v6 resultWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __43__VUIApplicationViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VUIApplicationViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __43__VUIApplicationViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v6 = WeakRetained;
    id v4 = [WeakRetained jetPackController];

    id WeakRetained = v6;
    if (v3 == v4)
    {
      uint64_t v5 = [*(id *)(a1 + 40) url];
      [v6 _startApplicationControllerWithBootURL:v5];

      [v6 setJetPackController:0];
      id WeakRetained = v6;
    }
  }
}

- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v5 = a4;
  +[VUIJSFactory exposeObjectsInJSContext:v5];
  [(VUIApplicationViewController *)self _exposeObjectsInJSContext:v5];
}

- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUIApplicationViewController: TVApplicationController did finish launching with options: %@", buf, 0xCu);
  }

  id v9 = [v7 appContext];

  id v10 = [(VUIApplicationViewController *)self _initialViewControllerWithAppContext:v9];
  if (v10)
  {
    v11 = [(VUIApplicationViewController *)self navigationController];
    v20 = v10;
    objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v11 setViewControllers:v12 animated:0];
  }
  else
  {
    v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[VUIApplicationViewController appController:didFinishLaunchingWithOptions:](v11, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)appController:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[VUIApplicationViewController appController:didFailWithError:]((uint64_t)v4, v5);
  }
}

- (Class)_applicationControllerClass
{
  return (Class)objc_opt_class();
}

- (id)_launchOptions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)_initialViewControllerWithAppContext:(id)a3
{
  return 0;
}

- (void)_startApplicationControllerWithBootURL:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIApplicationViewController *)self applicationController];

  if (v5)
  {
    VUIDefaultLogObject();
    id v6 = (VUITVApplicationControllerContext *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR)) {
      -[VUIApplicationViewController _startApplicationControllerWithBootURL:](&v6->super, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else if (v4)
  {
    id v6 = objc_alloc_init(VUITVApplicationControllerContext);
    [(VUITVApplicationControllerContext *)v6 setJavaScriptApplicationURL:v4];
    uint64_t v14 = [(VUIApplicationViewController *)self _launchOptions];
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 mutableCopy];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v24 = (void *)v16;
    v25 = [MEMORY[0x1E4FB3CA0] sharedInstance];
    v26 = [v25 osFeatureFlagsJSON];

    if ([v26 count]) {
      [v24 setObject:v26 forKey:@"featureFlags"];
    }
    v27 = (void *)[v24 copy];
    [(VUITVApplicationControllerContext *)v6 setLaunchOptions:v27];

    v28 = objc_msgSend(objc_alloc(-[VUIApplicationViewController _applicationControllerClass](self, "_applicationControllerClass")), "initWithContext:window:delegate:", v6, 0, self);
    [(VUIApplicationViewController *)self setApplicationController:v28];
    v29 = [v28 navigationController];
    [(VUIApplicationViewController *)self setNavigationController:v29];
    [(VUIApplicationViewController *)self addChildViewController:v29];
    v30 = [(VUIApplicationViewController *)self view];
    v31 = [v29 view];
    [v30 bounds];
    objc_msgSend(v31, "setFrame:");
    [v30 addSubview:v31];
    [v29 didMoveToParentViewController:self];
    [v28 setKeyTraitEnvironment:v30];
  }
  else
  {
    VUIDefaultLogObject();
    id v6 = (VUITVApplicationControllerContext *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR)) {
      -[VUIApplicationViewController _startApplicationControllerWithBootURL:](&v6->super, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

- (VUITVApplicationController)applicationController
{
  return self->_applicationController;
}

- (void)setApplicationController:(id)a3
{
}

- (_TtC8VideosUI20VUIJetPackController)jetPackController
{
  return self->_jetPackController;
}

- (void)setJetPackController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_jetPackController, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
}

- (void)appController:(uint64_t)a3 didFinishLaunchingWithOptions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)appController:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIApplicationViewController: VUITVApplicationController failed to launch with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_startApplicationControllerWithBootURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_startApplicationControllerWithBootURL:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end