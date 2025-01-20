@interface VSSupportedAppsViewController
- (NSArray)apps;
- (NSArray)supportedApps;
- (NSOperationQueue)privateQueue;
- (VSOptional)identityProvider;
- (VSSupportedAppsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VSSupportedAppsViewControllerDelegate)delegate;
- (void)_didFinish;
- (void)_displayApps;
- (void)_presentError:(id)a3;
- (void)beginLoadingImages;
- (void)setApps:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setSupportedApps:(id)a3;
- (void)viewDidLoad;
@end

@implementation VSSupportedAppsViewController

- (VSSupportedAppsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VSSupportedAppsViewController;
  v4 = [(VSSupportedAppsViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    privateQueue = v4->_privateQueue;
    v4->_privateQueue = v5;

    [(NSOperationQueue *)v4->_privateQueue setName:@"VSSupportedAppsViewController"];
    [(NSOperationQueue *)v4->_privateQueue setMaxConcurrentOperationCount:1];
    v7 = [(VSSupportedAppsViewController *)v4 navigationItem];
    v8 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:v4 action:sel__doneButtonPresed_];
    [v7 setRightBarButtonItem:v8];
  }
  return v4;
}

- (void)_didFinish
{
  id v3 = [(VSSupportedAppsViewController *)self delegate];
  [v3 supportedAppsViewControllerDidFinish:self];
}

- (void)_presentError:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__VSSupportedAppsViewController__presentError___block_invoke;
  v5[3] = &unk_265077B20;
  v5[4] = self;
  v4 = VSAlertForError(a3, v5);
  id v3 = v4;
  VSPerformBlockOnMainThread();
}

uint64_t __47__VSSupportedAppsViewController__presentError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinish];
}

uint64_t __47__VSSupportedAppsViewController__presentError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)_displayApps
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [(VSSupportedAppsViewController *)self supportedApps];
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        objc_super v10 = [v8 shortenedDisplayName];
        objc_msgSend(v9, "vs_setObjectUnlessNil:forKey:", v10, @"appName");

        v11 = [v8 icon];
        objc_msgSend(v9, "vs_setObjectUnlessNil:forKey:", v11, @"appIcon");

        [v3 addObject:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  if ([v3 count]) {
    [(VSSupportedAppsViewController *)self setApps:v3];
  }
}

- (void)beginLoadingImages
{
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  objc_copyWeak(&v8, &location);
  id v3 = VSMainThreadOperationWithBlock();
  uint64_t v4 = [(VSSupportedAppsViewController *)self supportedApps];
  uint64_t v5 = [[VSLoadAllAppIconsOperation alloc] initWithApps:v4 shouldPrecomposeIcon:0];
  [v3 addDependency:v5];
  uint64_t v6 = [(VSSupportedAppsViewController *)self privateQueue];
  [v6 addOperation:v5];

  VSEnqueueCompletionOperation();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __51__VSSupportedAppsViewController_beginLoadingImages__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _displayApps];
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)VSSupportedAppsViewController;
  [(VSSupportedAppsViewController *)&v34 viewDidLoad];
  id v3 = [(VSSupportedAppsViewController *)self view];
  uint64_t v4 = [MEMORY[0x263F1C550] whiteColor];
  [v3 setBackgroundColor:v4];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:2];
  [v5 startAnimating];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v5];
  uint64_t v6 = VSMainConcurrencyBindingOptions();
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = *MEMORY[0x263F1E498];
  [v7 setObject:*MEMORY[0x263F08180] forKey:*MEMORY[0x263F1E498]];
  objc_msgSend(v5, "vs_bind:toObject:withKeyPath:options:", @"hidden", self, @"apps", v7);

  id v9 = objc_alloc_init(MEMORY[0x263F84778]);
  objc_super v10 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v9, "vs_bind:toObject:withKeyPath:options:", @"apps", self, @"apps", v10);

  v11 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v9, "vs_bind:toObject:withKeyPath:options:", @"title", self, @"title", v11);

  [(VSSupportedAppsViewController *)self addChildViewController:v9];
  v12 = [v9 view];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v12];
  [v9 didMoveToParentViewController:self];
  long long v13 = VSMainConcurrencyBindingOptions();
  long long v14 = (void *)[v13 mutableCopy];

  [v14 setObject:*MEMORY[0x263F08178] forKey:v8];
  objc_msgSend(v12, "vs_bind:toObject:withKeyPath:options:", @"hidden", self, @"apps", v14);

  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = [v5 centerXAnchor];
  v17 = [v3 centerXAnchor];
  uint64_t v18 = [v16 constraintEqualToAnchor:v17];
  [v15 addObject:v18];

  v19 = [v5 centerYAnchor];
  v20 = [v3 centerYAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v15 addObject:v21];

  v22 = [v12 topAnchor];
  v23 = [v3 topAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [v15 addObject:v24];

  v25 = [v12 bottomAnchor];
  v26 = [v3 bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  [v15 addObject:v27];

  v28 = [v12 leftAnchor];
  v29 = [v3 leftAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v15 addObject:v30];

  v31 = [v12 rightAnchor];
  v32 = [v3 rightAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  [v15 addObject:v33];

  [MEMORY[0x263F08938] activateConstraints:v15];
}

- (VSOptional)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (NSArray)supportedApps
{
  return self->_supportedApps;
}

- (void)setSupportedApps:(id)a3
{
}

- (VSSupportedAppsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSSupportedAppsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_supportedApps, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

@end