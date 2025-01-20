@interface PKPayLaterMerchandisingModalViewController
- (BOOL)pkui_navigationBarHidden;
- (PKPayLaterMerchandisingModalViewController)initWithConfiguration:(id)a3;
- (id)_viewControllerDescription;
- (id)_webViewConfiguration;
- (void)_calculateWebViewHeightWithCompletion:(id)a3;
- (void)_setupWebView:(id)a3;
- (void)_showSpinnerView:(BOOL)a3 showWebView:(BOOL)a4 animate:(BOOL)a5 completion:(id)a6;
- (void)loadView;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
- (void)viewWillLayoutSubviews;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewDidClose:(id)a3;
@end

@implementation PKPayLaterMerchandisingModalViewController

- (PKPayLaterMerchandisingModalViewController)initWithConfiguration:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKPayLaterMerchandisingModalViewController;
  v6 = [(PKPayLaterMerchandisingModalViewController *)&v36 init];
  if (v6)
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(PKPayLaterMerchandisingModalViewController *)v6 _viewControllerDescription];
      *(_DWORD *)buf = 138412546;
      v39 = v8;
      __int16 v40 = 2112;
      id v41 = v5;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Creating %@ with configuration %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v9 = [MEMORY[0x1E4F849C0] sharedInstance];
    utilities = v6->_utilities;
    v6->_utilities = (PKPayLaterMerchandisingUtilities *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v6->_spinner;
    v6->_spinner = (UIActivityIndicatorView *)v11;

    [(UIActivityIndicatorView *)v6->_spinner startAnimating];
    [(UIActivityIndicatorView *)v6->_spinner sizeToFit];
    id v13 = objc_alloc(MEMORY[0x1E4F466F0]);
    v14 = [(PKPayLaterMerchandisingModalViewController *)v6 _webViewConfiguration];
    uint64_t v15 = objc_msgSend(v13, "initWithFrame:configuration:", v14, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    webView = v6->_webView;
    v6->_webView = (WKWebView *)v15;

    [(WKWebView *)v6->_webView setUIDelegate:v6];
    [(WKWebView *)v6->_webView setNavigationDelegate:v6];
    [(PKPayLaterMerchandisingModalViewController *)v6 _setupWebView:v6->_webView];
    v17 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    scrollView = v6->_scrollView;
    v6->_scrollView = v17;

    v19 = [(UIScrollView *)v6->_scrollView pinchGestureRecognizer];
    [v19 setEnabled:0];

    [(UIScrollView *)v6->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v6->_scrollView setShowsVerticalScrollIndicator:1];
    [(UIScrollView *)v6->_scrollView setMultipleTouchEnabled:0];
    v20 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:25.0];
    v21 = (void *)MEMORY[0x1E4FB1830];
    v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v37[0] = v22;
    v23 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    v37[1] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    v25 = [v21 configurationWithPaletteColors:v24];
    v26 = [v20 configurationByApplyingConfiguration:v25];

    v27 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill" withConfiguration:v26];
    v28 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v28 setImage:v27];
    objc_initWeak((id *)buf, v6);
    v29 = (void *)MEMORY[0x1E4FB13F0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __68__PKPayLaterMerchandisingModalViewController_initWithConfiguration___block_invoke;
    v34[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v35, (id *)buf);
    v30 = [v29 actionWithHandler:v34];
    uint64_t v31 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v28 primaryAction:v30];
    closeButton = v6->_closeButton;
    v6->_closeButton = (UIButton *)v31;

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  return v6;
}

void __68__PKPayLaterMerchandisingModalViewController_initWithConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained presentingViewController];
    [v2 dismissViewControllerAnimated:1 completion:0];

    id WeakRetained = v3;
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(PKPayLaterMerchandisingModalViewController *)self _viewControllerDescription];
    *(_DWORD *)buf = 138412290;
    id v13 = v9;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "%@ finished loading", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__PKPayLaterMerchandisingModalViewController_webView_didFinishNavigation___block_invoke;
  v10[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v11, (id *)buf);
  [(PKPayLaterMerchandisingModalViewController *)self _calculateWebViewHeightWithCompletion:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __74__PKPayLaterMerchandisingModalViewController_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _showSpinnerView:0 showWebView:1 animate:1 completion:0];
    id WeakRetained = v2;
  }
}

- (void)webViewDidClose:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(PKPayLaterMerchandisingModalViewController *)self _viewControllerDescription];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "%@ did close web view", (uint8_t *)&v6, 0xCu);
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, uint64_t))a5;
  utilities = self->_utilities;
  configuration = self->_configuration;
  id v10 = a4;
  id v11 = [(PKPayLaterMerchandisingUtilities *)utilities merchandisingBaseURLForEnviornmentType:[(PKPayLaterMerchandisingConfiguration *)configuration environmentType]];
  v12 = [v10 request];

  id v13 = [v12 URL];

  uint64_t v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(PKPayLaterMerchandisingModalViewController *)self _viewControllerDescription];
    int v23 = 138412546;
    v24 = v15;
    __int16 v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "%@ deciding policy for action: \"%@\"", (uint8_t *)&v23, 0x16u);
  }
  v16 = [v13 host];
  v17 = [v11 host];
  id v18 = v16;
  id v19 = v17;
  if (v18 == v19)
  {

    uint64_t v22 = 1;
LABEL_12:

    goto LABEL_14;
  }
  v20 = v19;
  if (!v18 || !v19)
  {

    goto LABEL_10;
  }
  char v21 = [v18 isEqualToString:v19];

  if ((v21 & 1) == 0)
  {
LABEL_10:
    if (!v13)
    {
      uint64_t v22 = 0;
      goto LABEL_14;
    }
    id v18 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v18 openURL:v13 withOptions:0];
    uint64_t v22 = 0;
    goto LABEL_12;
  }
  uint64_t v22 = 1;
LABEL_14:
  v7[2](v7, v22);
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterMerchandisingModalViewController;
  [(PKPayLaterMerchandisingModalViewController *)&v6 loadView];
  id v3 = [(PKPayLaterMerchandisingModalViewController *)self view];
  [v3 addSubview:self->_scrollView];
  [v3 addSubview:self->_spinner];
  [v3 addSubview:self->_closeButton];
  [(UIScrollView *)self->_scrollView addSubview:self->_webView];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  [(PKPayLaterMerchandisingModalViewController *)self _showSpinnerView:1 showWebView:0 animate:0 completion:0];
  id v5 = [(PKPayLaterMerchandisingModalViewController *)self navigationItem];
  objc_msgSend(v5, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v5, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  [v5 setBackButtonDisplayMode:2];
}

- (void)viewWillLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterMerchandisingModalViewController;
  [(PKPayLaterMerchandisingModalViewController *)&v24 viewWillLayoutSubviews];
  id v3 = [(PKPayLaterMerchandisingModalViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12;
  double v15 = v14;
  spinner = self->_spinner;
  [(UIActivityIndicatorView *)spinner frame];
  PKRectCenteredIntegralRect();
  -[UIActivityIndicatorView setFrame:](spinner, "setFrame:");
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v5 + 0.0, v7 + v13, v9, v11 - (v13 + v15));
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v9, self->_webViewHeight);
  [(UIScrollView *)self->_scrollView bounds];
  -[WKWebView setFrame:](self->_webView, "setFrame:", *MEMORY[0x1E4F1DAD8] + 16.0, *(double *)(MEMORY[0x1E4F1DAD8] + 8) + 0.0, v17 + -32.0, self->_webViewHeight);
  [(UIButton *)self->_closeButton frame];
  id v18 = [(UIButton *)self->_closeButton configuration];
  id v19 = [v18 image];
  [v19 size];
  double v21 = v20;
  double v23 = v22;

  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  -[UIButton setFrame:](self->_closeButton, "setFrame:", v9 - v21 + -20.0, CGRectGetMinY(v25) + 20.0, v21, v23);
}

- (BOOL)pkui_navigationBarHidden
{
  return 1;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [a4 name];
    int v7 = 138412290;
    double v8 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController received script message with name \"%@\"", (uint8_t *)&v7, 0xCu);
  }
}

- (id)_webViewConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F466A0]);
  [v3 addScriptMessageHandler:self name:@"modal"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  double v5 = [v4 defaultWebpagePreferences];
  [v5 setAllowsContentJavaScript:1];

  [v4 setUserContentController:v3];
  [v4 setApplicationNameForUserAgent:@"modal"];
  id v6 = objc_alloc(MEMORY[0x1E4F466A8]);
  int v7 = (void *)[v6 initWithSource:*MEMORY[0x1E4F87968] injectionTime:1 forMainFrameOnly:1];
  [v3 addUserScript:v7];

  return v4;
}

- (void)_setupWebView:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setAllowsLinkPreview:0];
  double v5 = [v4 scrollView];
  [v5 setScrollEnabled:0];
  id v6 = [v5 pinchGestureRecognizer];
  [v6 setEnabled:0];

  [v5 setShowsHorizontalScrollIndicator:0];
  [v5 setShowsVerticalScrollIndicator:0];
  [v5 setMultipleTouchEnabled:0];
  int v7 = [(PKPayLaterMerchandisingUtilities *)self->_utilities merchandisingModalURLWithConfiguration:self->_configuration];
  double v8 = [MEMORY[0x1E4F290D0] requestWithURL:v7 cachePolicy:0 timeoutInterval:10.0];
  id v9 = (id)[v4 loadRequest:v8];
  double v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = [(PKPayLaterMerchandisingModalViewController *)self _viewControllerDescription];
    int v12 = 138412546;
    double v13 = v11;
    __int16 v14 = 2112;
    double v15 = v8;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "%@ loading request %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)_calculateWebViewHeightWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke;
  aBlock[3] = &unk_1E59CB128;
  objc_copyWeak(&v22, &location);
  id v6 = v4;
  id v21 = v6;
  int v7 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_2;
  v19[3] = &unk_1E59CFB08;
  v19[4] = self;
  [v5 addOperation:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_46;
  v17[3] = &unk_1E59D2F50;
  v17[4] = self;
  objc_copyWeak(&v18, &location);
  v17[5] = v23;
  [v5 addOperation:v17];
  double v8 = [MEMORY[0x1E4F1CA98] null];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_52;
  v12[3] = &unk_1E59D2F78;
  objc_copyWeak(&v16, &location);
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v14 = v10;
  double v15 = v23;
  id v11 = (id)[v5 evaluateWithInput:v8 completion:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v22);
  _Block_object_dispose(v23, 8);
  objc_destroyWeak(&location);
}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((void *)WeakRetained + 129) = 0;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      id v3 = v5;
    }
  }
}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  double v8 = *(void **)(*(void *)(a1 + 32) + 1000);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_3;
  v11[3] = &unk_1E59D2F00;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 evaluateJavaScript:@"document.readyState" completionHandler:v11];
}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 stringValue];
  uint64_t v4 = v3;
  if (v3 != @"complete" && v3) {
    [(__CFString *)v3 caseInsensitiveCompare:@"complete"];
  }

  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController readyState: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_46(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(*(void *)(a1 + 32) + 1000);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_2_50;
  v14[3] = &unk_1E59D2F28;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  uint64_t v13 = *(void *)(a1 + 40);
  id v15 = v12;
  uint64_t v17 = v13;
  [v10 evaluateJavaScript:@"document.body.scrollHeight" completionHandler:v14];

  objc_destroyWeak(&v18);
}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_2_50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [v5 floatValue];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
    id v9 = PKLogFacilityTypeGetObject();
    id v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController encountered error getting height %@", (uint8_t *)&v12, 0xCu);
      }
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v12 = 134217984;
      id v13 = v11;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController recalcuated height to %f", (uint8_t *)&v12, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_52(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    goto LABEL_11;
  }
  if ([v5 isCanceled])
  {
    uint64_t v7 = *((void *)WeakRetained + 129) + 1;
    *((void *)WeakRetained + 129) = v7;
    float v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v14 = 25;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController WKWebView document wasn't ready to load. Trying again in %ld miliseconds. Current rety count %ld", buf, 0x16u);
    }

    if (*((void *)WeakRetained + 129) != 200)
    {
      dispatch_time_t v10 = dispatch_time(0, 25000000);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_53;
      v11[3] = &unk_1E59CAD18;
      void v11[4] = WeakRetained;
      id v12 = *(id *)(a1 + 40);
      dispatch_after(v10, MEMORY[0x1E4F14428], v11);

      goto LABEL_12;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingModalViewController WKWebView retry limit reached.", buf, 2u);
    }
    goto LABEL_10;
  }
  double v9 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v9 != WeakRetained[128])
  {
    WeakRetained[128] = v9;
    float v8 = [WeakRetained view];
    [v8 setNeedsLayout];
LABEL_10:
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_12:
}

uint64_t __84__PKPayLaterMerchandisingModalViewController__calculateWebViewHeightWithCompletion___block_invoke_53(uint64_t a1)
{
  return [*(id *)(a1 + 32) _calculateWebViewHeightWithCompletion:*(void *)(a1 + 40)];
}

- (void)_showSpinnerView:(BOOL)a3 showWebView:(BOOL)a4 animate:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke;
  aBlock[3] = &unk_1E59CBCB8;
  void aBlock[4] = self;
  *(double *)&aBlock[5] = (double)v7;
  *(double *)&aBlock[6] = (double)v8;
  id v11 = (void (**)(void))_Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_2;
  v19[3] = &unk_1E59CAA98;
  id v12 = v10;
  id v20 = v12;
  id v13 = (void (**)(void))_Block_copy(v19);
  if (v6)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4FB1EB0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_3;
    v17[3] = &unk_1E59CAA98;
    id v18 = v11;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_4;
    v15[3] = &unk_1E59CA9F8;
    uint64_t v16 = v13;
    objc_msgSend(v14, "pkui_animateUsingOptions:animations:completion:", 4, v17, v15);
  }
  else
  {
    v11[2](v11);
    v13[2](v13);
  }
}

uint64_t __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1000) setAlpha:*(double *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 992);
  double v3 = *(double *)(a1 + 48);

  return [v2 setAlpha:v3];
}

uint64_t __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__PKPayLaterMerchandisingModalViewController__showSpinnerView_showWebView_animate_completion___block_invoke_4(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)_viewControllerDescription
{
  return (id)[NSString stringWithFormat:@"%@: %p", objc_opt_class(), self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_utilities, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end