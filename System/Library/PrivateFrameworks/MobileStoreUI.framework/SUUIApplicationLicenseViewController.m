@interface SUUIApplicationLicenseViewController
- (SUUIApplicationLicenseViewController)initWithLicenseAgreementPage:(id)a3;
- (SUUIApplicationLicenseViewController)initWithLicenseAgreementURL:(id)a3;
- (void)_displayPage:(id)a3 error:(id)a4;
- (void)loadView;
- (void)reloadData;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUUIApplicationLicenseViewController

- (SUUIApplicationLicenseViewController)initWithLicenseAgreementPage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIApplicationLicenseViewController;
  v5 = [(SUUIApplicationLicenseViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    licensePage = v5->_licensePage;
    v5->_licensePage = (SUUIApplicationLicensePage *)v6;
  }
  return v5;
}

- (SUUIApplicationLicenseViewController)initWithLicenseAgreementURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIApplicationLicenseViewController;
  v5 = [(SUUIApplicationLicenseViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }
  return v5;
}

- (void)reloadData
{
  if (!self->_licensePage && !self->_loadOperation)
  {
    if (self->_url)
    {
      v3 = (SSVLoadURLOperation *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:self->_url];
      loadOperation = self->_loadOperation;
      self->_loadOperation = v3;

      v5 = self->_loadOperation;
      uint64_t v6 = +[SSVURLDataConsumer consumer];
      [(SSVLoadURLOperation *)v5 setDataConsumer:v6];

      v7 = self->_loadOperation;
      v8 = [(SUUIViewController *)self clientContext];
      objc_super v9 = [v8 valueForConfigurationKey:@"sfsuffix"];
      [(SSVLoadURLOperation *)v7 setStoreFrontSuffix:v9];

      objc_initWeak(&location, self);
      v10 = self->_loadOperation;
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      v14 = __50__SUUIApplicationLicenseViewController_reloadData__block_invoke;
      v15 = &unk_265401868;
      objc_copyWeak(&v16, &location);
      [(SSVLoadURLOperation *)v10 setOutputBlock:&v12];
      v11 = [(SUUIViewController *)self operationQueue];
      [v11 addOperation:self->_loadOperation];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

void __50__SUUIApplicationLicenseViewController_reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SUUIApplicationLicenseViewController_reloadData__block_invoke_2;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __50__SUUIApplicationLicenseViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _displayPage:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)loadView
{
  webView = self->_webView;
  if (!webView)
  {
    id v4 = (UIWebView *)objc_alloc_init(MEMORY[0x263F82E78]);
    id v5 = self->_webView;
    self->_webView = v4;

    id v6 = self->_webView;
    id v7 = [MEMORY[0x263F825C8] whiteColor];
    [(UIWebView *)v6 setBackgroundColor:v7];

    id v8 = [(UIWebView *)self->_webView scrollView];
    objc_super v9 = [MEMORY[0x263F825C8] whiteColor];
    [v8 setBackgroundColor:v9];

    licensePage = self->_licensePage;
    webView = self->_webView;
    if (licensePage)
    {
      id v11 = [(SUUIApplicationLicensePage *)licensePage licenseAgreementHTML];
      [(UIWebView *)webView loadHTMLString:v11 baseURL:0];

      webView = self->_webView;
    }
  }
  [(SUUIApplicationLicenseViewController *)self setView:webView];
  [(SUUIViewController *)self showDefaultNavigationItems];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUIApplicationLicenseViewController *)self reloadData];
  v5.receiver = self;
  v5.super_class = (Class)SUUIApplicationLicenseViewController;
  [(SUUIViewController *)&v5 viewWillAppear:v3];
}

- (void)_displayPage:(id)a3 error:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  [(SSVLoadURLOperation *)self->_loadOperation setOutputBlock:0];
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  if (v7)
  {
    [(SUUIViewController *)self showError:v7];
  }
  else
  {
    p_licensePage = &self->_licensePage;
    objc_storeStrong((id *)&self->_licensePage, a3);
    webView = self->_webView;
    if (webView)
    {
      id v11 = [(SUUIApplicationLicensePage *)*p_licensePage licenseAgreementHTML];
      [(UIWebView *)webView loadHTMLString:v11 baseURL:0];
    }
    id v12 = [(SUUIApplicationLicensePage *)*p_licensePage title];
    [(SUUIApplicationLicenseViewController *)self setTitle:v12];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_licensePage, 0);
}

@end