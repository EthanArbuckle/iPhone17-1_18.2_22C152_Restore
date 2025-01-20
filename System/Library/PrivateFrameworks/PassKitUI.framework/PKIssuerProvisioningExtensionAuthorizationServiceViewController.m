@interface PKIssuerProvisioningExtensionAuthorizationServiceViewController
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation PKIssuerProvisioningExtensionAuthorizationServiceViewController

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationServiceViewController;
  [(PKIssuerProvisioningExtensionAuthorizationServiceViewController *)&v10 beginRequestWithExtensionContext:v4];
  v5 = [(PKIssuerProvisioningExtensionAuthorizationServiceViewController *)self childViewControllers];
  v6 = [v5 lastObject];

  if (!v6 || ([v6 conformsToProtocol:&unk_1EF4312F8] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"NSExtensionPrincipalClass does not conform to PKIssuerProvisioningExtensionAuthorizationProviding"];
  }
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__PKIssuerProvisioningExtensionAuthorizationServiceViewController_beginRequestWithExtensionContext___block_invoke;
  v7[3] = &unk_1E59D0FB8;
  objc_copyWeak(&v8, &location);
  [v6 setCompletionHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __100__PKIssuerProvisioningExtensionAuthorizationServiceViewController_beginRequestWithExtensionContext___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __100__PKIssuerProvisioningExtensionAuthorizationServiceViewController_beginRequestWithExtensionContext___block_invoke_2;
  v3[3] = &unk_1E59CF720;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __100__PKIssuerProvisioningExtensionAuthorizationServiceViewController_beginRequestWithExtensionContext___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[976])
  {
    WeakRetained[976] = 1;
    id v4 = WeakRetained;
    v3 = [WeakRetained _remoteViewControllerProxy];
    [v3 serviceViewControllerDidCompleteWithResult:*(void *)(a1 + 40)];

    WeakRetained = v4;
  }
}

- (void)loadView
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationServiceViewController;
  [(PKIssuerProvisioningExtensionAuthorizationServiceViewController *)&v14 loadView];
  v3 = [(PKIssuerProvisioningExtensionAuthorizationServiceViewController *)self view];
  [v3 setAutoresizesSubviews:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(PKIssuerProvisioningExtensionAuthorizationServiceViewController *)self childViewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) view];
        [v3 addSubview:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)viewWillLayoutSubviews
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationServiceViewController;
  [(PKIssuerProvisioningExtensionAuthorizationServiceViewController *)&v22 viewWillLayoutSubviews];
  v3 = [(PKIssuerProvisioningExtensionAuthorizationServiceViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v12 = [(PKIssuerProvisioningExtensionAuthorizationServiceViewController *)self childViewControllers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v18 + 1) + 8 * v16) view];
        objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v14);
  }
}

@end