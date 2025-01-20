@interface WFFocusConfigurationViewController
- (NSCopying)extensionRequest;
- (NSExtension)extension;
- (UIActivityIndicatorView)activityIndicator;
- (UIStackView)errorStackView;
- (WFFocusConfigurationRemoteViewController)remoteViewController;
- (WFFocusConfigurationRequest)request;
- (WFFocusConfigurationViewController)initWithContextualActionOptions:(id)a3;
- (WFFocusConfigurationViewController)initWithOptions:(id)a3;
- (WFFocusConfigurationViewController)initWithRequest:(id)a3;
- (WFFocusConfigurationViewControllerDelegate)delegate;
- (void)clearAllViews;
- (void)dealloc;
- (void)embedRemoteViewController:(id)a3 withExtension:(id)a4 extensionRequest:(id)a5;
- (void)focusConfigurationRemoteViewController:(id)a3 configurationUIStateDidChange:(id)a4;
- (void)focusConfigurationRemoteViewController:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5;
- (void)installRemoteViewController:(id)a3;
- (void)loadFocusConfigurationRemoteViewController;
- (void)loadFocusConfigurationUI;
- (void)loadView;
- (void)notifyDelegateWithPressedButtonIdentifier:(id)a3 cellFrame:(CGRect)a4;
- (void)notifyDelegateWithUIState:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorStackView:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionRequest:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setRequest:(id)a3;
- (void)showErrorMessage:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFFocusConfigurationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_errorStackView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
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

- (void)setErrorStackView:(id)a3
{
}

- (UIStackView)errorStackView
{
  return self->_errorStackView;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setRemoteViewController:(id)a3
{
}

- (WFFocusConfigurationRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRequest:(id)a3
{
}

- (WFFocusConfigurationRequest)request
{
  return self->_request;
}

- (void)setDelegate:(id)a3
{
}

- (WFFocusConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFFocusConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)focusConfigurationRemoteViewController:(id)a3 didPressButtonWithIdentifier:(id)a4 cellFrame:(CGRect)a5
{
}

- (void)focusConfigurationRemoteViewController:(id)a3 configurationUIStateDidChange:(id)a4
{
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v16 = a3;
  id v4 = [(WFFocusConfigurationViewController *)self remoteViewController];
  if (v4 == v16)
  {
    [(WFFocusConfigurationViewController *)self preferredContentSize];
    double v6 = v5;
    double v8 = v7;
    [v16 preferredContentSize];
    double v10 = v9;
    double v12 = v11;

    if (v6 == v10 && v8 == v12) {
      goto LABEL_9;
    }
    [v16 preferredContentSize];
    -[WFFocusConfigurationViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    v14 = [(WFFocusConfigurationViewController *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0) {
      goto LABEL_9;
    }
    id v4 = [(WFFocusConfigurationViewController *)self delegate];
    [v16 preferredContentSize];
    objc_msgSend(v4, "focusConfigurationViewController:preferredContentSizeDidChange:", self);
  }

LABEL_9:
}

- (void)notifyDelegateWithPressedButtonIdentifier:(id)a3 cellFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  double v9 = [(WFFocusConfigurationViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(WFFocusConfigurationViewController *)self delegate];
    objc_msgSend(v11, "focusConfigurationViewController:didPressButtonWithIdentifier:cellFrame:", self, v12, x, y, width, height);
  }
}

- (void)notifyDelegateWithUIState:(id)a3
{
  id v12 = a3;
  id v4 = [(WFFocusConfigurationViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  double v6 = [(WFFocusConfigurationViewController *)self delegate];
  double v7 = v6;
  if (v5)
  {
    [v6 focusConfigurationViewController:self configurationUIStateDidChange:v12];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    double v7 = [(WFFocusConfigurationViewController *)self delegate];
    if (v8)
    {
      double v9 = [v12 action];
      char v10 = [v12 displayRepresentation];
      [v7 focusConfigurationViewController:self didUpdateConfigurationWithAction:v9 displayRepresentation:v10];
    }
    else
    {
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0) {
        goto LABEL_9;
      }
      double v7 = [(WFFocusConfigurationViewController *)self delegate];
      double v9 = [v12 action];
      [v7 focusConfigurationViewController:self didUpdateConfigurationWithAction:v9];
    }
  }
LABEL_9:
}

- (void)installRemoteViewController:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(WFFocusConfigurationViewController *)self addChildViewController:v4];
    [(WFFocusConfigurationViewController *)self clearAllViews];
  }
  char v5 = getWFFocusConfigurationLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[WFFocusConfigurationViewController installRemoteViewController:]";
    __int16 v45 = 2112;
    id v46 = v4;
    _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_DEBUG, "%s Installing Focus Filter Remote View Controller: %@", buf, 0x16u);
  }

  double v6 = [(WFFocusConfigurationViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  char v15 = [v4 view];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  id v16 = [v4 view];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(WFFocusConfigurationViewController *)self view];
  v18 = [v4 view];
  [v17 addSubview:v18];

  v32 = (void *)MEMORY[0x263F08938];
  v41 = [v4 view];
  v39 = [v41 topAnchor];
  v40 = [(WFFocusConfigurationViewController *)self view];
  v38 = [v40 topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v42[0] = v37;
  v36 = [v4 view];
  v34 = [v36 bottomAnchor];
  v35 = [(WFFocusConfigurationViewController *)self view];
  v33 = [v35 bottomAnchor];
  v31 = [v34 constraintEqualToAnchor:v33];
  v42[1] = v31;
  v30 = [v4 view];
  v28 = [v30 leadingAnchor];
  v19 = [(WFFocusConfigurationViewController *)self view];
  v20 = [v19 leadingAnchor];
  v21 = [v28 constraintEqualToAnchor:v20];
  v42[2] = v21;
  v22 = [v4 view];
  v23 = [v22 trailingAnchor];
  v24 = [(WFFocusConfigurationViewController *)self view];
  v25 = [v24 trailingAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v42[3] = v26;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  v27 = v29 = self;
  [v32 activateConstraints:v27];

  [v4 didMoveToParentViewController:v29];
}

- (void)embedRemoteViewController:(id)a3 withExtension:(id)a4 extensionRequest:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(WFFocusConfigurationViewController *)self remoteViewController];

  if (v10 == v18) {
    goto LABEL_9;
  }
  double v11 = [(WFFocusConfigurationViewController *)self remoteViewController];
  [v11 willMoveToParentViewController:0];
  id v12 = [(WFFocusConfigurationViewController *)self extension];
  if (v12 != v8)
  {

LABEL_5:
    double v14 = [(WFFocusConfigurationViewController *)self extension];
    char v15 = [(WFFocusConfigurationViewController *)self extensionRequest];
    [v14 cancelExtensionRequestWithIdentifier:v15];

    goto LABEL_6;
  }
  id v13 = [(WFFocusConfigurationViewController *)self extensionRequest];

  if (v13 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  id v16 = [(WFFocusConfigurationViewController *)self remoteViewController];
  [v16 setDelegate:0];

  [(WFFocusConfigurationViewController *)self setExtension:v8];
  [(WFFocusConfigurationViewController *)self setExtensionRequest:v9];
  [(WFFocusConfigurationViewController *)self setRemoteViewController:v18];
  v17 = [(WFFocusConfigurationViewController *)self remoteViewController];
  [v17 setDelegate:self];

  if ([(WFFocusConfigurationViewController *)self isViewLoaded]) {
    [(WFFocusConfigurationViewController *)self installRemoteViewController:v18];
  }
  [v11 removeFromParentViewController];

LABEL_9:
}

- (void)showErrorMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = getWFFocusConfigurationLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[WFFocusConfigurationViewController showErrorMessage:]";
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_2177E0000, v5, OS_LOG_TYPE_ERROR, "%s Failing with error %{public}@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__WFFocusConfigurationViewController_showErrorMessage___block_invoke;
  block[3] = &unk_2642A5EA0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__WFFocusConfigurationViewController_showErrorMessage___block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x263EF8340];
  v27 = WFLocalizedString(@"Could not load Focus Filter");
  v2 = (void *)MEMORY[0x263F82818];
  v3 = [MEMORY[0x263F825C8] systemRedColor];
  v33[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  v30 = [v2 configurationWithPaletteColors:v4];

  v29 = [MEMORY[0x263F82818] configurationWithPointSize:(uint64_t)*MEMORY[0x263F81838] weight:3 scale:60.0];
  v28 = [v30 configurationByApplyingConfiguration:v29];
  v26 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.triangle.fill" withConfiguration:v28];
  id v25 = objc_alloc_init(MEMORY[0x263F82828]);
  [v25 setImage:v26];
  id v5 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v5 setText:v27];
  double v6 = [MEMORY[0x263F81708] boldSystemFontOfSize:15.0];
  [v5 setFont:v6];

  double v7 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v24 = v5;
  [v5 setTextColor:v7];

  [*(id *)(a1 + 32) clearAllViews];
  id v8 = objc_alloc(MEMORY[0x263F82BF8]);
  v32[0] = v25;
  v32[1] = v5;
  __int16 v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  id v10 = (void *)[v8 initWithArrangedSubviews:v9];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setAxis:1];
  [v10 setSpacing:25.0];
  [v10 setDistribution:0];
  [v10 setAlignment:3];
  uint64_t v11 = [*(id *)(a1 + 32) view];
  [v11 addSubview:v10];

  [*(id *)(a1 + 32) setErrorStackView:v10];
  v21 = (void *)MEMORY[0x263F08938];
  v22 = [v10 centerYAnchor];
  v23 = [*(id *)(a1 + 32) view];
  id v12 = [v23 layoutMarginsGuide];
  id v13 = [v12 centerYAnchor];
  double v14 = [v22 constraintEqualToAnchor:v13];
  v31[0] = v14;
  char v15 = [v10 centerXAnchor];
  id v16 = [*(id *)(a1 + 32) view];
  v17 = [v16 layoutMarginsGuide];
  id v18 = [v17 centerXAnchor];
  v19 = [v15 constraintEqualToAnchor:v18];
  v31[1] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  [v21 activateConstraints:v20];
}

- (void)clearAllViews
{
  v3 = [(WFFocusConfigurationViewController *)self activityIndicator];
  [v3 removeFromSuperview];

  [(WFFocusConfigurationViewController *)self setActivityIndicator:0];
}

- (void)loadFocusConfigurationRemoteViewController
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F85588];
  id v13 = 0;
  id v4 = [MEMORY[0x263F08800] extensionWithIdentifier:v3 error:&v13];
  id v5 = v13;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke;
    v11[3] = &unk_2642A5BC0;
    objc_copyWeak(&v12, (id *)location);
    [v4 setRequestCancellationBlock:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_3;
    v9[3] = &unk_2642A5BE8;
    objc_copyWeak(&v10, (id *)location);
    [v4 setRequestInterruptionBlock:v9];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_65;
    v7[3] = &unk_2642A5680;
    objc_copyWeak(&v8, (id *)location);
    [v4 instantiateViewControllerWithInputItems:MEMORY[0x263EFFA68] connectionHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
  }
  else
  {
    double v6 = getWFFocusConfigurationLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[WFFocusConfigurationViewController loadFocusConfigurationRemoteViewController]";
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_2177E0000, v6, OS_LOG_TYPE_ERROR, "%s Failed to load a Focus Filter Extension: %{public}@", location, 0x16u);
    }

    [(WFFocusConfigurationViewController *)self showErrorMessage:v5];
  }
}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_2;
  v6[3] = &unk_2642A5928;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(&v8);
}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_4;
  block[3] = &unk_2642A5B98;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_65(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = v6;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = getWFFocusConfigurationLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "-[WFFocusConfigurationViewController loadFocusConfigurationRemoteViewController]_block_invoke";
      _os_log_impl(&dword_2177E0000, v10, OS_LOG_TYPE_INFO, "%s Loading Focus Extension succeeded", buf, 0xCu);
    }

    uint64_t v11 = [WeakRetained request];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_67;
    v14[3] = &unk_2642A5658;
    v14[4] = WeakRetained;
    id v15 = v9;
    id v12 = v9;
    [v12 startConfigurationWithRequest:v11 completion:v14];
  }
  else
  {

    id v13 = getWFFocusConfigurationLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[WFFocusConfigurationViewController loadFocusConfigurationRemoteViewController]_block_invoke";
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_2177E0000, v13, OS_LOG_TYPE_ERROR, "%s Loading Focus Extension failed with error: %{public}@", buf, 0x16u);
    }

    [WeakRetained showErrorMessage:v7];
  }
}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = getWFFocusConfigurationLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[WFFocusConfigurationViewController loadFocusConfigurationRemoteViewController]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl(&dword_2177E0000, v4, OS_LOG_TYPE_ERROR, "%s Failed to start configuration with error: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    [*(id *)(a1 + 32) showErrorMessage:v3];
  }
  else
  {
    [*(id *)(a1 + 32) embedRemoteViewController:*(void *)(a1 + 40) withExtension:0 extensionRequest:0];
  }
}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_4(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = getWFFocusConfigurationLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    id v4 = "-[WFFocusConfigurationViewController loadFocusConfigurationRemoteViewController]_block_invoke_4";
    _os_log_impl(&dword_2177E0000, v2, OS_LOG_TYPE_ERROR, "%s Extension connection was interrupted", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained showErrorMessage:0];
}

void __80__WFFocusConfigurationViewController_loadFocusConfigurationRemoteViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained showErrorMessage:*(void *)(a1 + 32)];
}

- (void)loadFocusConfigurationUI
{
  int v3 = [(WFFocusConfigurationViewController *)self request];
  id v4 = [v3 action];
  BOOL v5 = v4 == 0;

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke;
  aBlock[3] = &unk_2642A5CA8;
  aBlock[4] = self;
  BOOL v15 = v5;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  __int16 v7 = [(WFFocusConfigurationViewController *)self request];
  id v8 = [v7 actionIdentifier];
  uint64_t v9 = [v8 bundleIdentifier];

  if (!v9) {
    goto LABEL_8;
  }
  id v10 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:v9];
  if (![v10 isHidden])
  {
    if ([v10 isLocked])
    {
      uint64_t v11 = [MEMORY[0x263F251F8] sharedGuard];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke_3;
      v12[3] = &unk_2642A5630;
      v12[4] = self;
      id v13 = v6;
      [v11 authenticateForSubject:v10 completion:v12];

      goto LABEL_6;
    }

LABEL_8:
    v6[2](v6);
    goto LABEL_9;
  }
  [(WFFocusConfigurationViewController *)self showErrorMessage:0];
LABEL_6:

LABEL_9:
}

void __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) request];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke_2;
  v3[3] = &unk_2642A5608;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  [v2 loadFocusActionWithCompletion:v3];
}

uint64_t __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke_3(uint64_t a1, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return objc_msgSend(*(id *)(a1 + 32), "showErrorMessage:");
  }
}

void __62__WFFocusConfigurationViewController_loadFocusConfigurationUI__block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 showErrorMessage:a2];
  }
  else
  {
    [v3 loadFocusConfigurationRemoteViewController];
    if (*(unsigned char *)(a1 + 40))
    {
      char v4 = [WFFocusConfigurationUIState alloc];
      BOOL v5 = [*(id *)(a1 + 32) request];
      id v6 = [v5 action];
      __int16 v7 = [(WFFocusConfigurationUIState *)v4 initWithEnabled:1 uiValidity:1 action:v6 displayRepresentation:0];

      [*(id *)(a1 + 32) notifyDelegateWithUIState:v7];
    }
  }
}

- (void)viewDidLoad
{
  v21[2] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)WFFocusConfigurationViewController;
  [(WFFocusConfigurationViewController *)&v20 viewDidLoad];
  int v3 = [(WFFocusConfigurationViewController *)self view];
  [v3 setClipsToBounds:1];

  char v4 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v5 = [(WFFocusConfigurationViewController *)self view];
  [v5 addSubview:v4];

  [v4 startAnimating];
  [(WFFocusConfigurationViewController *)self setActivityIndicator:v4];
  BOOL v15 = (void *)MEMORY[0x263F08938];
  id v19 = [(WFFocusConfigurationViewController *)self activityIndicator];
  uint64_t v17 = [v19 centerXAnchor];
  __int16 v18 = [(WFFocusConfigurationViewController *)self view];
  id v16 = [v18 layoutMarginsGuide];
  id v6 = [v16 centerXAnchor];
  __int16 v7 = [v17 constraintEqualToAnchor:v6];
  v21[0] = v7;
  id v8 = [(WFFocusConfigurationViewController *)self activityIndicator];
  uint64_t v9 = [v8 centerYAnchor];
  id v10 = [(WFFocusConfigurationViewController *)self view];
  uint64_t v11 = [v10 layoutMarginsGuide];
  id v12 = [v11 centerYAnchor];
  id v13 = [v9 constraintEqualToAnchor:v12];
  v21[1] = v13;
  double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  [v15 activateConstraints:v14];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)WFFocusConfigurationViewController;
  [(WFFocusConfigurationViewController *)&v5 loadView];
  int v3 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  char v4 = [(WFFocusConfigurationViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)dealloc
{
  int v3 = [(WFFocusConfigurationViewController *)self extension];
  char v4 = [(WFFocusConfigurationViewController *)self extensionRequest];
  [v3 cancelExtensionRequestWithIdentifier:v4];

  v5.receiver = self;
  v5.super_class = (Class)WFFocusConfigurationViewController;
  [(WFFocusConfigurationViewController *)&v5 dealloc];
}

- (WFFocusConfigurationViewController)initWithRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFocusConfigurationViewController;
  id v6 = [(WFFocusConfigurationViewController *)&v10 initWithNibName:0 bundle:0];
  __int16 v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    [(WFFocusConfigurationViewController *)v7 loadFocusConfigurationUI];
    id v8 = v7;
  }

  return v7;
}

- (WFFocusConfigurationViewController)initWithContextualActionOptions:(id)a3
{
  id v4 = a3;
  id v5 = [[WFFocusConfigurationRequest alloc] initWithContextualActionOptions:v4];

  id v6 = [(WFFocusConfigurationViewController *)self initWithRequest:v5];
  return v6;
}

- (WFFocusConfigurationViewController)initWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [[WFFocusConfigurationRequest alloc] initWithOptions:v4];

  id v6 = [(WFFocusConfigurationViewController *)self initWithRequest:v5];
  return v6;
}

@end