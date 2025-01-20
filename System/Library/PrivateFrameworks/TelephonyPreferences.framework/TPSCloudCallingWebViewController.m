@interface TPSCloudCallingWebViewController
- (BOOL)isPresentingURL;
- (NSData)body;
- (NSURL)url;
- (TPSCloudCallingWebViewController)init;
- (TPSCloudCallingWebViewController)initWithCoder:(id)a3;
- (TPSCloudCallingWebViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TPSCloudCallingWebViewController)initWithType:(int64_t)a3;
- (UIActivityIndicatorView)activityIndicator;
- (UIWebView)webView;
- (id)completionBlock;
- (int64_t)type;
- (void)_cancelButtonClicked:(id)a3;
- (void)cancelWebView;
- (void)doProvisioningCanceled;
- (void)doProvisioningDone;
- (void)doProvisioningFailed;
- (void)doWebViewTimedOut;
- (void)loadURL:(id)a3 body:(id)a4 completion:(id)a5;
- (void)loadView;
- (void)loadWebViewWithSpinner:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setBody:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUrl:(id)a3;
- (void)setupControllerInWebFrame:(id)a3;
- (void)uiWebView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4;
@end

@implementation TPSCloudCallingWebViewController

- (TPSCloudCallingWebViewController)init
{
  return 0;
}

- (TPSCloudCallingWebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (TPSCloudCallingWebViewController)initWithCoder:(id)a3
{
  return 0;
}

- (TPSCloudCallingWebViewController)initWithType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPSCloudCallingWebViewController;
  v4 = [(TPSCloudCallingWebViewController *)&v9 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = (UIWebView *)objc_alloc_init(MEMORY[0x1E4FB1F40]);
    webView = v5->_webView;
    v5->_webView = v6;
  }
  return v5;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  id v21 = (id)objc_msgSend(v3, "initWithFrame:");

  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v21 setBackgroundColor:v5];

  [v21 setAutoresizingMask:18];
  [(TPSCloudCallingWebViewController *)self setView:v21];
  [v21 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(TPSCloudCallingWebViewController *)self webView];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  v15 = [(TPSCloudCallingWebViewController *)self webView];
  [v15 setScalesPageToFit:1];

  v16 = [(TPSCloudCallingWebViewController *)self webView];
  [v16 setDelegate:self];

  v17 = [(TPSCloudCallingWebViewController *)self webView];
  [v17 setAutoresizingMask:18];

  v18 = [(TPSCloudCallingWebViewController *)self webView];
  [v21 addSubview:v18];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonClicked_];
  v20 = [(TPSCloudCallingWebViewController *)self navigationItem];
  [v20 setLeftBarButtonItem:v19];
}

- (BOOL)isPresentingURL
{
  return self->_url || self->_body != 0;
}

- (void)loadWebViewWithSpinner:(id)a3
{
  id v4 = a3;
  v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "loadWebViewWithSpinner", buf, 2u);
  }

  [(TPSCloudCallingWebViewController *)self setCompletionBlock:v4];
  if (!self->_activityIndicator)
  {
    double v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:2];
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v6;

    [(UIActivityIndicatorView *)self->_activityIndicator setAutoresizingMask:45];
    double v8 = [(TPSCloudCallingWebViewController *)self view];
    [v8 center];
    -[UIActivityIndicatorView setCenter:](self->_activityIndicator, "setCenter:");

    [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
    [(UIWebView *)self->_webView addSubview:self->_activityIndicator];
  }
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__TPSCloudCallingWebViewController_loadWebViewWithSpinner___block_invoke;
  block[3] = &unk_1E6EB2258;
  block[4] = self;
  dispatch_after(v9, MEMORY[0x1E4F14428], block);
  [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
}

void __59__TPSCloudCallingWebViewController_loadWebViewWithSpinner___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) url];
  if (!v2
    || (id v3 = (void *)v2,
        [*(id *)(a1 + 32) body],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    v5 = TPSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Timed out trying to load carrier URL", v6, 2u);
    }

    [*(id *)(a1 + 32) doWebViewTimedOut];
  }
}

- (void)loadURL:(id)a3 body:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v8 = (NSURL *)a3;
  dispatch_time_t v9 = (NSData *)a4;
  id v10 = a5;
  double v11 = TPSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v8;
    __int16 v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1E4DD4000, v11, OS_LOG_TYPE_DEFAULT, "LoadURL: %@ body: %@", buf, 0x16u);
  }

  url = self->_url;
  self->_url = v8;
  double v13 = v8;

  body = self->_body;
  self->_body = v9;
  v15 = v9;

  [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
  [(UIActivityIndicatorView *)self->_activityIndicator removeFromSuperview];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = 0;

  [(TPSCloudCallingWebViewController *)self setCompletionBlock:v10];
  v17 = (NSURL *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v13 cachePolicy:1 timeoutInterval:30.0];
  [(NSURL *)v17 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  v18 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v19 = [v18 firstObject];

  if (v19) {
    v20 = v19;
  }
  else {
    v20 = @"en";
  }
  [(NSURL *)v17 setValue:v20 forHTTPHeaderField:@"Accept-Language"];
  [(NSURL *)v17 setHTTPMethod:@"POST"];
  [(NSURL *)v17 setHTTPBody:v15];
  id v21 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[NSData length](v15, "length"));

  [(NSURL *)v17 setValue:v21 forHTTPHeaderField:@"Content-Length"];
  v22 = TPSLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v17;
    _os_log_impl(&dword_1E4DD4000, v22, OS_LOG_TYPE_DEFAULT, "Loading URL request: %@", buf, 0xCu);
  }

  v23 = [(TPSCloudCallingWebViewController *)self webView];
  [v23 loadRequest:v17];
}

- (void)cancelWebView
{
  id v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "Asked to cancel web view", v4, 2u);
  }

  [(TPSCloudCallingWebViewController *)self doProvisioningCanceled];
}

- (void)_cancelButtonClicked:(id)a3
{
  id v4 = TPSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E4DD4000, v4, OS_LOG_TYPE_DEFAULT, "_cancelButtonClicked", v5, 2u);
  }

  [(TPSCloudCallingWebViewController *)self doProvisioningCanceled];
}

- (void)doProvisioningDone
{
  id v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "doProvisioningDone", buf, 2u);
  }

  id v4 = [(TPSCloudCallingWebViewController *)self completionBlock];
  v5 = (void *)[v4 copy];

  [(TPSCloudCallingWebViewController *)self setCompletionBlock:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__TPSCloudCallingWebViewController_doProvisioningDone__block_invoke;
  v7[3] = &unk_1E6EB25C8;
  id v8 = v5;
  id v6 = v5;
  [(TPSCloudCallingWebViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

uint64_t __54__TPSCloudCallingWebViewController_doProvisioningDone__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)doProvisioningCanceled
{
  id v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "doProvisioningCanceled", buf, 2u);
  }

  id v4 = [(TPSCloudCallingWebViewController *)self completionBlock];
  v5 = (void *)[v4 copy];

  [(TPSCloudCallingWebViewController *)self setCompletionBlock:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__TPSCloudCallingWebViewController_doProvisioningCanceled__block_invoke;
  v7[3] = &unk_1E6EB25C8;
  id v8 = v5;
  id v6 = v5;
  [(TPSCloudCallingWebViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

uint64_t __58__TPSCloudCallingWebViewController_doProvisioningCanceled__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)doProvisioningFailed
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4DD4000, log, OS_LOG_TYPE_ERROR, "doProvisioningFailed", v1, 2u);
}

uint64_t __56__TPSCloudCallingWebViewController_doProvisioningFailed__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 3);
  }
  return result;
}

- (void)doWebViewTimedOut
{
  id v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "doWebViewTimedOut", buf, 2u);
  }

  id v4 = [(TPSCloudCallingWebViewController *)self completionBlock];
  v5 = (void *)[v4 copy];

  [(TPSCloudCallingWebViewController *)self setCompletionBlock:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__TPSCloudCallingWebViewController_doWebViewTimedOut__block_invoke;
  v7[3] = &unk_1E6EB25C8;
  id v8 = v5;
  id v6 = v5;
  [(TPSCloudCallingWebViewController *)self dismissViewControllerAnimated:1 completion:v7];
}

uint64_t __53__TPSCloudCallingWebViewController_doWebViewTimedOut__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  }
  return result;
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4
{
  id v5 = a4;
  id v6 = TPSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[TPSCloudCallingWebViewController webView:didFailLoadWithError:]((uint64_t)v5, v6);
  }

  if ([v5 code] != -999) {
    [(TPSCloudCallingWebViewController *)self doProvisioningFailed];
  }
}

- (void)uiWebView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5
{
}

- (void)setupControllerInWebFrame:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 globalContext];
  if (!v4) {
    -[TPSCloudCallingWebViewController setupControllerInWebFrame:]();
  }
  id v5 = (const OpaqueJSContext *)v4;
  id v6 = (OpaqueJSClass *)CloudCallingWebViewController_controllerClass;
  if (!CloudCallingWebViewController_controllerClass)
  {
    id v6 = JSClassCreate(&CloudCallingWebViewController_classDefinition);
    CloudCallingWebViewController_controllerClass = (uint64_t)v6;
  }
  JSObjectRef v7 = JSObjectMake(v5, v6, self);
  if (!v7) {
    -[TPSCloudCallingWebViewController setupControllerInWebFrame:]();
  }
  id v8 = v7;
  dispatch_time_t v9 = [v12 windowObject];
  id v10 = (OpaqueJSValue *)[v9 JSObject];

  if (!v10) {
    -[TPSCloudCallingWebViewController setupControllerInWebFrame:]();
  }
  double v11 = JSStringCreateWithCFString(@"WiFiCallingWebViewController");
  JSObjectSetProperty(v5, v10, v11, v8, 0, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)webView:(uint64_t)a1 didFailLoadWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4DD4000, a2, OS_LOG_TYPE_ERROR, "didFailLoadWithError: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setupControllerInWebFrame:.cold.1()
{
}

- (void)setupControllerInWebFrame:.cold.2()
{
}

- (void)setupControllerInWebFrame:.cold.3()
{
}

@end