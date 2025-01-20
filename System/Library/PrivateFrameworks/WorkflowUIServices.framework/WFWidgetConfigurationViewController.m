@interface WFWidgetConfigurationViewController
+ (BOOL)supportsSecureCoding;
- (NSCopying)extensionRequest;
- (NSExtension)extension;
- (WFWidgetConfigurationContainerViewControllerProtocol)containerViewController;
- (WFWidgetConfigurationLoadingContentViewController)loadingContentViewController;
- (WFWidgetConfigurationRemoteViewController)remoteViewController;
- (WFWidgetConfigurationRequest)request;
- (WFWidgetConfigurationView)configurationView;
- (WFWidgetConfigurationViewController)initWithCoder:(id)a3;
- (WFWidgetConfigurationViewController)initWithOptions:(id)a3;
- (WFWidgetConfigurationViewController)initWithRequest:(id)a3;
- (WFWidgetConfigurationViewControllerDelegate)delegate;
- (_UIRemoteViewController)_containedRemoteViewController;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)finishWithCurrentConfiguration;
- (void)installRemoteViewController:(id)a3;
- (void)loadView;
- (void)loadWidgetConfigurationRemoteViewController;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionRequest:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setRemoteViewController:(id)a3 extension:(id)a4 extensionRequest:(id)a5;
- (void)showErrorMessage;
- (void)viewDidLoad;
- (void)widgetConfigurationRemoteViewController:(id)a3 didReceiveConfiguredIntent:(id)a4;
- (void)widgetConfigurationRemoteViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4;
@end

@implementation WFWidgetConfigurationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_loadingContentViewController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setExtensionRequest:(id)a3
{
}

- (NSCopying)extensionRequest
{
  return self->_extensionRequest;
}

- (void)setExtension:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setRemoteViewController:(id)a3
{
}

- (WFWidgetConfigurationRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (WFWidgetConfigurationLoadingContentViewController)loadingContentViewController
{
  return self->_loadingContentViewController;
}

- (WFWidgetConfigurationContainerViewControllerProtocol)containerViewController
{
  return self->_containerViewController;
}

- (WFWidgetConfigurationRequest)request
{
  return self->_request;
}

- (void)setDelegate:(id)a3
{
}

- (WFWidgetConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWidgetConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v16 = a3;
  id v4 = [(WFWidgetConfigurationViewController *)self remoteViewController];
  if (v4 == v16)
  {
    [(WFWidgetConfigurationViewController *)self preferredContentSize];
    double v6 = v5;
    double v8 = v7;
    [v16 preferredContentSize];
    double v10 = v9;
    double v12 = v11;

    if (v6 == v10 && v8 == v12) {
      goto LABEL_9;
    }
    [v16 preferredContentSize];
    -[WFWidgetConfigurationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    v14 = [(WFWidgetConfigurationViewController *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0) {
      goto LABEL_9;
    }
    id v4 = [(WFWidgetConfigurationViewController *)self delegate];
    [v16 preferredContentSize];
    objc_msgSend(v4, "widgetConfigurationViewController:preferredContentSizeDidChange:", self);
  }

LABEL_9:
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWidgetConfigurationViewController *)self request];
  [v4 encodeObject:v5 forKey:@"request"];
}

- (WFWidgetConfigurationViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"request"];

  if (v5)
  {
    self = [(WFWidgetConfigurationViewController *)self initWithRequest:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)widgetConfigurationRemoteViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = [(WFWidgetConfigurationViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(WFWidgetConfigurationViewController *)self delegate];
    objc_msgSend(v9, "widgetConfigurationViewController:preferredContentSizeDidChange:", self, width, height);
  }
}

- (void)widgetConfigurationRemoteViewController:(id)a3 didReceiveConfiguredIntent:(id)a4
{
  id v8 = a4;
  id v5 = [(WFWidgetConfigurationViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(WFWidgetConfigurationViewController *)self delegate];
    [v7 widgetConfigurationViewController:self didFinishWithIntent:v8];
  }
}

- (void)finishWithCurrentConfiguration
{
  v3 = [(WFWidgetConfigurationViewController *)self remoteViewController];
  id v7 = v3;
  if (v3)
  {
    [v3 requestViewControllerDismissal];
  }
  else
  {
    id v4 = [(WFWidgetConfigurationViewController *)self delegate];
    id v5 = [(WFWidgetConfigurationViewController *)self request];
    char v6 = [v5 intent];
    [v4 widgetConfigurationViewController:self didFinishWithIntent:v6];
  }
}

- (void)installRemoteViewController:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4) {
    [(WFWidgetConfigurationViewController *)self addChildViewController:v4];
  }
  id v5 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    v13 = "-[WFWidgetConfigurationViewController installRemoteViewController:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_DEBUG, "%s Installing Widget Configuration Remote View Controller: %@", (uint8_t *)&v12, 0x16u);
  }

  char v6 = [v4 view];
  id v7 = [(WFWidgetConfigurationViewController *)self view];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");

  [v6 setAutoresizingMask:18];
  id v8 = [(WFWidgetConfigurationViewController *)self configurationView];
  [v8 overridingCardViewFrame];
  objc_msgSend(v4, "setConfigurationCardViewFrame:");

  id v9 = [(WFWidgetConfigurationViewController *)self view];
  [v9 insertSubview:v6 atIndex:0];

  double v10 = [(WFWidgetConfigurationViewController *)self containerViewController];
  double v11 = [v10 view];
  [v11 setHidden:1];

  [v4 didMoveToParentViewController:self];
}

- (void)setRemoteViewController:(id)a3 extension:(id)a4 extensionRequest:(id)a5
{
  v17 = (WFWidgetConfigurationRemoteViewController *)a3;
  id v9 = (NSExtension *)a4;
  double v10 = (NSCopying *)a5;
  p_remoteViewController = &self->_remoteViewController;
  if (self->_remoteViewController != v17)
  {
    int v12 = [(WFWidgetConfigurationViewController *)self remoteViewController];
    [v12 willMoveToParentViewController:0];
    extension = self->_extension;
    if (extension != v9 || self->_extensionRequest != v10) {
      -[NSExtension cancelExtensionRequestWithIdentifier:](extension, "cancelExtensionRequestWithIdentifier:");
    }
    [(WFWidgetConfigurationRemoteViewController *)*p_remoteViewController setDelegate:0];
    objc_storeStrong((id *)&self->_extension, a4);
    objc_storeStrong((id *)&self->_extensionRequest, a5);
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    [(WFWidgetConfigurationRemoteViewController *)*p_remoteViewController setDelegate:self];
    if (!v17)
    {
      id v15 = [(WFWidgetConfigurationViewController *)self request];
      [v15 defaultCardSize];
      -[WFWidgetConfigurationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
    if ([(WFWidgetConfigurationViewController *)self isViewLoaded])
    {
      uint64_t v16 = [v12 view];
      [v16 removeFromSuperview];

      [(WFWidgetConfigurationViewController *)self installRemoteViewController:v17];
    }
    [v12 removeFromParentViewController];
  }
}

- (void)loadWidgetConfigurationRemoteViewController
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = [(WFWidgetConfigurationViewController *)self request];

  if (v3)
  {
    id v4 = [(WFWidgetConfigurationViewController *)self request];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke;
    v6[3] = &unk_2642A5C60;
    v6[4] = self;
    [v4 loadWidgetExtensionInformationWithCompletion:v6];
  }
  else
  {
    id v5 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]";
    }
  }
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_2;
  v6[3] = &unk_2642A5EC8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v33 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]_block_invoke_2";
      __int16 v34 = 2114;
      uint64_t v35 = v3;
      _os_log_impl(&dword_2177E0000, v2, OS_LOG_TYPE_ERROR, "%s Loading Widget Extension Information error: %{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) showErrorMessage];
  }
  else
  {
    if ([*(id *)(a1 + 40) isViewLoaded])
    {
      uint64_t v4 = [*(id *)(a1 + 40) request];
      id v5 = [v4 widgetPrimaryColor];
      char v6 = v5;
      if (!v5)
      {
        char v6 = objc_msgSend(MEMORY[0x263F825C8], "wf_defaultWidgetConfigurationCardBackgroundColor");
      }
      id v7 = [*(id *)(a1 + 40) containerViewController];
      [v7 setContainerBackgroundColor:v6];

      if (!v5) {
      uint64_t v8 = [*(id *)(a1 + 40) containerViewController];
      }
      id v9 = [v8 containerBackgroundColor];
      double v10 = WFCGColorPerceivedLightness((CGColor *)[v9 CGColor]);

      if (v10 > 0.7) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2;
      }
      int v12 = [*(id *)(a1 + 40) containerViewController];
      v13 = [v12 view];
      __int16 v14 = [v13 traitCollection];
      uint64_t v15 = [v14 userInterfaceStyle];

      if (v15 != v11)
      {
        uint64_t v16 = [*(id *)(a1 + 40) containerViewController];
        v17 = [v16 view];
        [v17 setOverrideUserInterfaceStyle:v11];
      }
      v18 = [*(id *)(a1 + 40) request];
      v19 = [v18 widgetTintColor];
      v20 = [*(id *)(a1 + 40) view];
      [v20 setTintColor:v19];
    }
    uint64_t v21 = *MEMORY[0x263F855B0];
    id v31 = 0;
    v22 = [MEMORY[0x263F08800] extensionWithIdentifier:v21 error:&v31];
    id v23 = v31;
    if (v22)
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_66;
      v29[3] = &unk_2642A5BC0;
      objc_copyWeak(&v30, (id *)buf);
      [v22 setRequestCancellationBlock:v29];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_3;
      v27[3] = &unk_2642A5BE8;
      objc_copyWeak(&v28, (id *)buf);
      [v22 setRequestInterruptionBlock:v27];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_71;
      v24[3] = &unk_2642A5C38;
      objc_copyWeak(&v26, (id *)buf);
      id v25 = v22;
      [v25 instantiateViewControllerWithInputItems:MEMORY[0x263EFFA68] connectionHandler:v24];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [*(id *)(a1 + 40) showErrorMessage];
    }
  }
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_66(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_2_67;
  block[3] = &unk_2642A5B98;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_4;
  block[3] = &unk_2642A5B98;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_71(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = v8;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v12 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]_block_invoke";
      _os_log_impl(&dword_2177E0000, v12, OS_LOG_TYPE_INFO, "%s Loading Widget Extension succeed", buf, 0xCu);
    }

    v13 = [WeakRetained request];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_73;
    v16[3] = &unk_2642A5C10;
    v16[4] = WeakRetained;
    id v17 = v11;
    id v18 = *(id *)(a1 + 32);
    id v19 = v7;
    id v14 = v11;
    [v14 startConfigurationWithRequest:v13 completion:v16];
  }
  else
  {

    uint64_t v15 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]_block_invoke";
      __int16 v22 = 2114;
      id v23 = v9;
      _os_log_impl(&dword_2177E0000, v15, OS_LOG_TYPE_ERROR, "%s Loading Widget Extension failed with error: %{public}@", buf, 0x16u);
    }

    [WeakRetained showErrorMessage];
  }
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_73(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      char v6 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl(&dword_2177E0000, v4, OS_LOG_TYPE_ERROR, "%s Loading Widget Extension failed with error: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    [*(id *)(a1 + 32) showErrorMessage];
  }
  else
  {
    [*(id *)(a1 + 32) setRemoteViewController:*(void *)(a1 + 40) extension:*(void *)(a1 + 48) extensionRequest:*(void *)(a1 + 56)];
  }
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_4(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = getWFWidgetConfigurationLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    uint64_t v4 = "-[WFWidgetConfigurationViewController loadWidgetConfigurationRemoteViewController]_block_invoke_4";
    _os_log_impl(&dword_2177E0000, v2, OS_LOG_TYPE_ERROR, "%s Extenstion extension connection was interrupted", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained showErrorMessage];
}

void __82__WFWidgetConfigurationViewController_loadWidgetConfigurationRemoteViewController__block_invoke_2_67(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showErrorMessage];
}

- (void)showErrorMessage
{
  [(WFWidgetConfigurationViewController *)self setRemoteViewController:0 extension:0 extensionRequest:0];
  int v3 = [(WFWidgetConfigurationViewController *)self containerViewController];
  uint64_t v4 = [v3 view];
  [v4 setHidden:0];

  id v6 = [(WFWidgetConfigurationViewController *)self loadingContentViewController];
  uint64_t v5 = WFLocalizedStringFromTable(@"Unable to Load", @"WidgetConfiguration");
  [v6 showMessage:v5];
}

- (void)dealloc
{
  int v3 = [(WFWidgetConfigurationViewController *)self extension];
  uint64_t v4 = [(WFWidgetConfigurationViewController *)self extensionRequest];
  [v3 cancelExtensionRequestWithIdentifier:v4];

  v5.receiver = self;
  v5.super_class = (Class)WFWidgetConfigurationViewController;
  [(WFWidgetConfigurationViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WFWidgetConfigurationViewController;
  [(WFWidgetConfigurationViewController *)&v4 viewDidLoad];
  int v3 = [(WFWidgetConfigurationViewController *)self request];

  if (!v3) {
    [(WFWidgetConfigurationViewController *)self showErrorMessage];
  }
}

- (void)loadView
{
  v23.receiver = self;
  v23.super_class = (Class)WFWidgetConfigurationViewController;
  [(WFWidgetConfigurationViewController *)&v23 loadView];
  int v3 = objc_alloc_init(WFWidgetConfigurationLoadingContentViewController);
  loadingContentViewController = self->_loadingContentViewController;
  self->_loadingContentViewController = v3;

  objc_super v5 = [WFWidgetConfigurationCardContainerViewController alloc];
  id v6 = [(WFWidgetConfigurationViewController *)self request];
  __int16 v7 = [(WFWidgetConfigurationViewController *)self loadingContentViewController];
  id v8 = [(WFWidgetConfigurationCardContainerViewController *)v5 initWithRequest:v6 contentViewController:v7];
  containerViewController = self->_containerViewController;
  self->_containerViewController = v8;

  double v10 = [(WFWidgetConfigurationViewController *)self containerViewController];
  [(WFWidgetConfigurationViewController *)self addChildViewController:v10];

  id v11 = [(WFWidgetConfigurationViewController *)self containerViewController];
  int v12 = [v11 view];

  v13 = [(WFWidgetConfigurationViewController *)self view];
  [v13 bounds];
  objc_msgSend(v12, "setFrame:");

  id v14 = [(WFWidgetConfigurationViewController *)self view];
  [v14 addSubview:v12];

  uint64_t v15 = [(WFWidgetConfigurationViewController *)self containerViewController];
  [v15 didMoveToParentViewController:self];

  uint64_t v16 = [(WFWidgetConfigurationViewController *)self containerViewController];
  [v16 setContainerDelegate:self];

  id v17 = [(WFWidgetConfigurationViewController *)self containerViewController];
  [v17 preferredContentSize];
  -[WFWidgetConfigurationViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  id v18 = [(WFWidgetConfigurationViewController *)self request];
  id v19 = [v18 widgetTintColor];
  v20 = [(WFWidgetConfigurationViewController *)self view];
  [v20 setTintColor:v19];

  uint64_t v21 = [(WFWidgetConfigurationViewController *)self remoteViewController];

  if (v21)
  {
    __int16 v22 = [(WFWidgetConfigurationViewController *)self remoteViewController];
    [(WFWidgetConfigurationViewController *)self installRemoteViewController:v22];
  }
}

- (WFWidgetConfigurationView)configurationView
{
  id v2 = [(WFWidgetConfigurationViewController *)self containerViewController];
  int v3 = [v2 view];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v4 = v3;
    }
    else {
      objc_super v4 = 0;
    }
  }
  else
  {
    objc_super v4 = 0;
  }
  objc_super v5 = v4;

  return v5;
}

- (WFWidgetConfigurationViewController)initWithRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWidgetConfigurationViewController;
  id v6 = [(WFWidgetConfigurationViewController *)&v10 initWithNibName:0 bundle:0];
  __int16 v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    [(WFWidgetConfigurationViewController *)v7 loadWidgetConfigurationRemoteViewController];
    id v8 = v7;
  }

  return v7;
}

- (WFWidgetConfigurationViewController)initWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [[WFWidgetConfigurationRequest alloc] initWithOptions:v4];

  id v6 = [(WFWidgetConfigurationViewController *)self initWithRequest:v5];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end