@interface WFSystemActionConfigurationViewController
+ (BOOL)supportsSecureCoding;
- (NSCopying)extensionRequest;
- (NSExtension)extension;
- (NSString)configurationContext;
- (WFConfiguredSystemAction)selectedAction;
- (WFSystemActionConfigurationViewController)initWithCoder:(id)a3;
- (WFSystemActionConfigurationViewController)initWithConfigurationContext:(id)a3;
- (WFSystemActionConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WFSystemActionConfigurationViewControllerDelegate)delegate;
- (_UIRemoteViewController)remoteViewController;
- (void)configurationController:(id)a3 didFinishWithAction:(id)a4 error:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)installRemoteViewController:(id)a3 extension:(id)a4 extensionRequest:(id)a5;
- (void)loadRemoteViewController;
- (void)setConfigurationContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionRequest:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setSelectedAction:(id)a3;
@end

@implementation WFSystemActionConfigurationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_remoteViewController);
  objc_storeStrong((id *)&self->_configurationContext, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
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

- (_UIRemoteViewController)remoteViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  return (_UIRemoteViewController *)WeakRetained;
}

- (void)setConfigurationContext:(id)a3
{
}

- (NSString)configurationContext
{
  return self->_configurationContext;
}

- (WFConfiguredSystemAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setDelegate:(id)a3
{
}

- (WFSystemActionConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFSystemActionConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSystemActionConfigurationViewController *)self configurationContext];
  [v4 encodeObject:v5 forKey:@"configurationContext"];
}

- (WFSystemActionConfigurationViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationContext"];

  if (v5)
  {
    self = [(WFSystemActionConfigurationViewController *)self initWithConfigurationContext:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)configurationController:(id)a3 didFinishWithAction:(id)a4 error:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v7 = (WFConfiguredSystemAction *)a4;
  id v8 = a5;
  v9 = getWFSystemActionConfigurationLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    v14 = "-[WFSystemActionConfigurationViewController configurationController:didFinishWithAction:error:]";
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2177E0000, v9, OS_LOG_TYPE_DEFAULT, "%s Providing selected action to the client: %@", (uint8_t *)&v13, 0x16u);
  }

  selectedAction = self->_selectedAction;
  self->_selectedAction = v7;
  v11 = v7;

  v12 = [(WFSystemActionConfigurationViewController *)self delegate];
  [v12 configurationController:self didFinishWithAction:v11 error:v8];
}

- (void)setSelectedAction:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = getWFSystemActionConfigurationLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[WFSystemActionConfigurationViewController setSelectedAction:]";
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_2177E0000, v6, OS_LOG_TYPE_DEFAULT, "%s Client provided selected action: %@", (uint8_t *)&v10, 0x16u);
  }

  objc_storeStrong((id *)&self->_selectedAction, a3);
  v7 = [(WFSystemActionConfigurationViewController *)self remoteViewController];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  [v9 setSelectedAction:v5];
}

- (void)installRemoteViewController:(id)a3 extension:(id)a4 extensionRequest:(id)a5
{
  v52[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (NSExtension *)a4;
  int v10 = (NSCopying *)a5;
  extension = self->_extension;
  BOOL v12 = extension == v9 && self->_extensionRequest == v10;
  id v13 = v9;
  if (!v12)
  {
    -[NSExtension cancelExtensionRequestWithIdentifier:](extension, "cancelExtensionRequestWithIdentifier:");
    id v13 = self->_extension;
  }
  self->_extension = v9;
  v51 = v9;

  extensionRequest = self->_extensionRequest;
  self->_extensionRequest = v10;
  v50 = v10;

  [(WFSystemActionConfigurationViewController *)self setRemoteViewController:v8];
  [(WFSystemActionConfigurationViewController *)self addChildViewController:v8];
  __int16 v15 = [(WFSystemActionConfigurationViewController *)self view];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [v8 view];
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  v25 = [v8 view];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

  v26 = [(WFSystemActionConfigurationViewController *)self view];
  v27 = [v8 view];
  [v26 addSubview:v27];

  v39 = (void *)MEMORY[0x263F08938];
  v49 = [v8 view];
  v47 = [v49 topAnchor];
  v48 = [(WFSystemActionConfigurationViewController *)self view];
  v46 = [v48 topAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v52[0] = v45;
  v44 = [v8 view];
  v42 = [v44 bottomAnchor];
  v43 = [(WFSystemActionConfigurationViewController *)self view];
  v41 = [v43 bottomAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v52[1] = v40;
  v38 = [v8 view];
  v36 = [v38 leadingAnchor];
  v37 = [(WFSystemActionConfigurationViewController *)self view];
  v28 = [v37 leadingAnchor];
  v29 = [v36 constraintEqualToAnchor:v28];
  v52[2] = v29;
  v30 = [v8 view];
  v31 = [v30 trailingAnchor];
  v32 = [(WFSystemActionConfigurationViewController *)self view];
  v33 = [v32 trailingAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  v52[3] = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:4];
  [v39 activateConstraints:v35];

  [v8 didMoveToParentViewController:self];
}

- (void)loadRemoteViewController
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = getWFSystemActionConfigurationLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[WFSystemActionConfigurationViewController loadRemoteViewController]";
    _os_log_impl(&dword_2177E0000, v3, OS_LOG_TYPE_DEFAULT, "%s Loading remote extension", buf, 0xCu);
  }

  uint64_t v4 = *MEMORY[0x263F85590];
  id v20 = 0;
  id v5 = [MEMORY[0x263F08800] extensionWithIdentifier:v4 error:&v20];
  id v6 = v20;
  if (v5)
  {
    objc_initWeak((id *)buf, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke;
    v18[3] = &unk_2642A5BC0;
    objc_copyWeak(&v19, (id *)buf);
    [v5 setRequestCancellationBlock:v18];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_3;
    v16[3] = &unk_2642A5BE8;
    objc_copyWeak(&v17, (id *)buf);
    [v5 setRequestInterruptionBlock:v16];
    id v7 = objc_alloc_init(MEMORY[0x263F08810]);
    double v22 = @"WFSystemActionConfigurationContextUserInfoKey";
    id v8 = [(WFSystemActionConfigurationViewController *)self configurationContext];
    double v23 = v8;
    id v9 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [v7 setUserInfo:v9];

    id v21 = v7;
    int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_10;
    v13[3] = &unk_2642A5C38;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v5;
    [v14 instantiateViewControllerWithInputItems:v10 connectionHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v11 = getWFSystemActionConfigurationLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[WFSystemActionConfigurationViewController loadRemoteViewController]";
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_impl(&dword_2177E0000, v11, OS_LOG_TYPE_ERROR, "%s Failed to load a System Action Configuration Extension: %{public}@", buf, 0x16u);
    }

    BOOL v12 = [(WFSystemActionConfigurationViewController *)self delegate];
    [v12 configurationController:self didFinishWithAction:0 error:v6];
  }
}

void __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_2;
  block[3] = &unk_2642A5B98;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_4;
  block[3] = &unk_2642A5B98;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = v8;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v12 = getWFSystemActionConfigurationLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      double v16 = "-[WFSystemActionConfigurationViewController loadRemoteViewController]_block_invoke";
      __int16 v17 = 2112;
      double v18 = v11;
      _os_log_impl(&dword_2177E0000, v12, OS_LOG_TYPE_DEFAULT, "%s System Action Configuration Extension provided view controller: %@", (uint8_t *)&v15, 0x16u);
    }

    [v11 setDelegate:WeakRetained];
    id v13 = [WeakRetained selectedAction];
    [v11 setSelectedAction:v13];

    [WeakRetained installRemoteViewController:v11 extension:*(void *)(a1 + 32) extensionRequest:v7];
    id v14 = v11;
  }
  else
  {

    id v14 = getWFSystemActionConfigurationLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      double v16 = "-[WFSystemActionConfigurationViewController loadRemoteViewController]_block_invoke";
      __int16 v17 = 2112;
      double v18 = v9;
      _os_log_impl(&dword_2177E0000, v14, OS_LOG_TYPE_ERROR, "%s System Action Configuration Extension failed to  provide view controller due to: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

void __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = getWFSystemActionConfigurationLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[WFSystemActionConfigurationViewController loadRemoteViewController]_block_invoke_4";
    _os_log_impl(&dword_2177E0000, v2, OS_LOG_TYPE_DEFAULT, "%s Extension connection was interrupted", (uint8_t *)&v5, 0xCu);
  }

  v3 = [MEMORY[0x263F087E8] errorWithDomain:@"WFSystemActionConfigurationErrorDomain" code:1000 userInfo:0];
  uint64_t v4 = [WeakRetained delegate];
  [v4 configurationController:WeakRetained didFinishWithAction:0 error:v3];
}

void __69__WFSystemActionConfigurationViewController_loadRemoteViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = getWFSystemActionConfigurationLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[WFSystemActionConfigurationViewController dealloc]";
    _os_log_impl(&dword_2177E0000, v3, OS_LOG_TYPE_DEFAULT, "%s Destroying WFSystemActionConfigurationViewController", buf, 0xCu);
  }

  uint64_t v4 = [(WFSystemActionConfigurationViewController *)self extension];
  int v5 = [(WFSystemActionConfigurationViewController *)self extensionRequest];
  [v4 cancelExtensionRequestWithIdentifier:v5];

  v6.receiver = self;
  v6.super_class = (Class)WFSystemActionConfigurationViewController;
  [(WFSystemActionConfigurationViewController *)&v6 dealloc];
}

- (WFSystemActionConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(WFSystemActionConfigurationViewController *)self initWithConfigurationContext:@"WFSystemActionConfigurationContextUnknown", a4];
}

- (WFSystemActionConfigurationViewController)initWithConfigurationContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSystemActionConfigurationViewController;
  int v5 = [(WFSystemActionConfigurationViewController *)&v10 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configurationContext = v5->_configurationContext;
    v5->_configurationContext = (NSString *)v6;

    [(WFSystemActionConfigurationViewController *)v5 loadRemoteViewController];
    id v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end