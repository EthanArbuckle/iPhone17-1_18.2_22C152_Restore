@interface PKRemoteDocumentationViewController
- (BOOL)isLoading;
- (BOOL)isWithinBuddy;
- (NSURL)url;
- (PKRemoteDocumentationViewController)initWithContext:(int64_t)a3 URL:(id)a4;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIBarButtonItem)dismissButton;
- (WKWebView)webView;
- (int64_t)context;
- (int64_t)handleNavigationAction:(id)a3;
- (void)dismiss;
- (void)loadContent;
- (void)navigation:(id)a3 didFinishWithError:(id)a4;
- (void)openURLInSafari:(id)a3;
- (void)presentFatalErrorAlert;
- (void)setActivityIndicatorView:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setDismissButton:(id)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setWebView:(id)a3;
- (void)setupActivityIndicatorView;
- (void)setupDismissButton;
- (void)setupWebView;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation PKRemoteDocumentationViewController

- (WKWebView)webView
{
  webView = self->_webView;
  if (!webView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F466F0]);
    v5 = (WKWebView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_webView;
    self->_webView = v5;

    [(WKWebView *)self->_webView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WKWebView *)self->_webView setNavigationDelegate:self];
    webView = self->_webView;
  }

  return webView;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    id v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
    v5 = self->_activityIndicatorView;
    self->_activityIndicatorView = v4;

    [(UIActivityIndicatorView *)self->_activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    activityIndicatorView = self->_activityIndicatorView;
  }

  return activityIndicatorView;
}

- (UIBarButtonItem)dismissButton
{
  dismissButton = self->_dismissButton;
  if (!dismissButton)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_handleDismiss_];
    v5 = self->_dismissButton;
    self->_dismissButton = v4;

    dismissButton = self->_dismissButton;
  }

  return dismissButton;
}

- (void)setIsLoading:(BOOL)a3
{
  if (self->_isLoading != a3)
  {
    self->_isLoading = a3;
    if (a3)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke;
      v5[3] = &unk_1E59CA7D0;
      v5[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.3];
    }
    else
    {
      v3[4] = self;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke_2;
      v4[3] = &unk_1E59CA7D0;
      v4[4] = self;
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke_3;
      v3[3] = &unk_1E59CB6D8;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:v3 completion:0.3];
    }
  }
}

void __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activityIndicatorView];
  [v1 setAlpha:1.0];
}

void __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activityIndicatorView];
  [v1 setAlpha:0.0];
}

void __52__PKRemoteDocumentationViewController_setIsLoading___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activityIndicatorView];
  [v1 stopAnimating];
}

- (PKRemoteDocumentationViewController)initWithContext:(int64_t)a3 URL:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKRemoteDocumentationViewController;
  v8 = [(PKRemoteDocumentationViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_context = a3;
    objc_storeStrong((id *)&v8->_url, a4);
  }

  return v9;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKRemoteDocumentationViewController;
  [(PKRemoteDocumentationViewController *)&v5 viewDidLoad];
  v3 = PKProvisioningBackgroundColor();
  id v4 = [(PKRemoteDocumentationViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(PKRemoteDocumentationViewController *)self setupWebView];
  [(PKRemoteDocumentationViewController *)self setupActivityIndicatorView];
  [(PKRemoteDocumentationViewController *)self setupDismissButton];
  [(PKRemoteDocumentationViewController *)self loadContent];
}

- (void)setupWebView
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v3 = [(PKRemoteDocumentationViewController *)self webView];
  [v3 setAlpha:0.0];

  id v4 = [(PKRemoteDocumentationViewController *)self webView];
  objc_super v5 = [v4 scrollView];
  [v5 setContentInsetAdjustmentBehavior:3];

  v6 = [(PKRemoteDocumentationViewController *)self view];
  id v7 = [(PKRemoteDocumentationViewController *)self webView];
  [v6 addSubview:v7];

  v8 = [(PKRemoteDocumentationViewController *)self view];
  v29 = [(PKRemoteDocumentationViewController *)self view];
  v27 = [v29 topAnchor];
  v28 = [(PKRemoteDocumentationViewController *)self webView];
  v26 = [v28 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v30[0] = v25;
  v24 = [(PKRemoteDocumentationViewController *)self view];
  v22 = [v24 bottomAnchor];
  v23 = [(PKRemoteDocumentationViewController *)self webView];
  v21 = [v23 bottomAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v30[1] = v20;
  v19 = [(PKRemoteDocumentationViewController *)self view];
  v18 = [v19 leftAnchor];
  v9 = [(PKRemoteDocumentationViewController *)self webView];
  v10 = [v9 leftAnchor];
  objc_super v11 = [v18 constraintEqualToAnchor:v10];
  v30[2] = v11;
  v12 = [(PKRemoteDocumentationViewController *)self view];
  v13 = [v12 rightAnchor];
  v14 = [(PKRemoteDocumentationViewController *)self webView];
  v15 = [v14 rightAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v30[3] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  [v8 addConstraints:v17];
}

- (void)setupActivityIndicatorView
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PKRemoteDocumentationViewController *)self view];
  id v4 = [(PKRemoteDocumentationViewController *)self activityIndicatorView];
  [v3 addSubview:v4];

  objc_super v5 = [(PKRemoteDocumentationViewController *)self view];
  v16 = [(PKRemoteDocumentationViewController *)self view];
  v14 = [v16 centerXAnchor];
  v15 = [(PKRemoteDocumentationViewController *)self activityIndicatorView];
  v6 = [v15 centerXAnchor];
  id v7 = [v14 constraintEqualToAnchor:v6];
  v17[0] = v7;
  v8 = [(PKRemoteDocumentationViewController *)self view];
  v9 = [v8 centerYAnchor];
  v10 = [(PKRemoteDocumentationViewController *)self activityIndicatorView];
  objc_super v11 = [v10 centerYAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v17[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [v5 addConstraints:v13];

  [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
}

- (void)setupDismissButton
{
  id v4 = [(PKRemoteDocumentationViewController *)self dismissButton];
  v3 = [(PKRemoteDocumentationViewController *)self navigationItem];
  [v3 setRightBarButtonItem:v4];
}

- (void)loadContent
{
  [(PKRemoteDocumentationViewController *)self setIsLoading:1];
  v3 = (void *)MEMORY[0x1E4F290D0];
  id v4 = [(PKRemoteDocumentationViewController *)self url];
  id v6 = [v3 requestWithURL:v4];

  id v5 = [(WKWebView *)self->_webView loadRequest:v6];
}

- (void)dismiss
{
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)navigation:(id)a3 didFinishWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKRemoteDocumentationViewController_navigation_didFinishWithError___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __69__PKRemoteDocumentationViewController_navigation_didFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setIsLoading:0];
  if (*(void *)(a1 + 40))
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = [*(id *)(a1 + 32) url];
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKRemoteDocumentationViewController - Error trying to load %@: %@", buf, 0x16u);
    }
    id v5 = [*(id *)(a1 + 32) dismissButton];
    [v5 setEnabled:0];

    return [*(id *)(a1 + 32) presentFatalErrorAlert];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__PKRemoteDocumentationViewController_navigation_didFinishWithError___block_invoke_21;
    v7[3] = &unk_1E59CA7D0;
    v7[4] = *(void *)(a1 + 32);
    return [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:0.3];
  }
}

void __69__PKRemoteDocumentationViewController_navigation_didFinishWithError___block_invoke_21(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) webView];
  [v1 setAlpha:1.0];
}

- (void)presentFatalErrorAlert
{
  v3 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v4 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);
  id v5 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PKRemoteDocumentationViewController_presentFatalErrorAlert__block_invoke;
  v10[3] = &unk_1E59CB1F0;
  v10[4] = self;
  v9 = [v7 actionWithTitle:v8 style:1 handler:v10];

  [v6 addAction:v9];
  [(PKRemoteDocumentationViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __61__PKRemoteDocumentationViewController_presentFatalErrorAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7 = (void (**)(id, int64_t))a5;
  v7[2](v7, [(PKRemoteDocumentationViewController *)self handleNavigationAction:a4]);
}

- (int64_t)handleNavigationAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 navigationType];
  if (v5 == -1)
  {
    int64_t v8 = 1;
  }
  else
  {
    if (!v5 && ![(PKRemoteDocumentationViewController *)self isWithinBuddy])
    {
      id v6 = [v4 request];
      id v7 = [v6 URL];

      [(PKRemoteDocumentationViewController *)self openURLInSafari:v7];
    }
    int64_t v8 = 0;
  }

  return v8;
}

- (BOOL)isWithinBuddy
{
  [(PKRemoteDocumentationViewController *)self context];

  return PKPaymentSetupContextIsSetupAssistant();
}

- (void)openURLInSafari:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F223E0];
  id v4 = a3;
  id v5 = [v3 defaultWorkspace];
  [v5 openURL:v4 configuration:0 completionHandler:0];
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void)setWebView:(id)a3
{
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (void)setDismissButton:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_webView, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end