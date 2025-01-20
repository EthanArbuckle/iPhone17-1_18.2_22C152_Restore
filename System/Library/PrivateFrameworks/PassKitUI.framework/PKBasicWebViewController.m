@interface PKBasicWebViewController
- (NSURL)url;
- (PKBasicWebViewController)initWithURL:(id)a3;
- (UIActivityIndicatorView)activityIndicator;
- (WKWebView)webView;
- (void)setActivityIndicator:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWebView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation PKBasicWebViewController

- (PKBasicWebViewController)initWithURL:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKBasicWebViewController;
  v6 = [(PKBasicWebViewController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = (WKWebView *)objc_alloc_init(MEMORY[0x1E4F466F0]);
    webView = v7->_webView;
    v7->_webView = v8;

    [(WKWebView *)v7->_webView setNavigationDelegate:v7];
    v10 = [(PKBasicWebViewController *)v7 view];
    [v10 addSubview:v7->_webView];
  }
  return v7;
}

- (void)viewDidLoad
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PKBasicWebViewController;
  [(PKBasicWebViewController *)&v17 viewDidLoad];
  v3 = [(PKBasicWebViewController *)self navigationItem];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__PKBasicWebViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_1E59CBEE0;
  objc_copyWeak(&v15, &location);
  v6 = [v5 actionWithHandler:v14];
  v7 = (void *)[v4 initWithBarButtonSystemItem:24 primaryAction:v6];

  v8 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v8;

  v10 = self->_activityIndicator;
  v11 = [MEMORY[0x1E4FB1618] systemGray3Color];
  [(UIActivityIndicatorView *)v10 setColor:v11];

  [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
  objc_super v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_activityIndicator];
  v18[0] = v7;
  v18[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v3 setRightBarButtonItems:v13];

  [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __39__PKBasicWebViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKBasicWebViewController;
  [(PKBasicWebViewController *)&v6 viewWillAppear:a3];
  id v4 = [MEMORY[0x1E4F290D0] requestWithURL:self->_url];
  id v5 = [(WKWebView *)self->_webView loadRequest:v4];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKBasicWebViewController;
  [(PKBasicWebViewController *)&v5 viewWillLayoutSubviews];
  webView = self->_webView;
  id v4 = [(PKBasicWebViewController *)self view];
  [v4 bounds];
  -[WKWebView setFrame:](webView, "setFrame:");
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKBasicWebViewController_webView_didFinishNavigation___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56__PKBasicWebViewController_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) stopAnimating];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  v11 = (void (**)(id, uint64_t))a5;
  v7 = [a4 request];
  v8 = [v7 URL];

  if (v8)
  {
    if ([v8 isEqual:self->_url])
    {
      uint64_t v9 = 1;
      goto LABEL_6;
    }
    v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v10 openURL:v8 withOptions:0];
  }
  uint64_t v9 = 0;
LABEL_6:
  v11[2](v11, v9);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_webView, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end