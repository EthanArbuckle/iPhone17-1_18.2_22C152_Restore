@interface PKPayLaterView
+ (void)showSpinnerView:(BOOL)a3 spinnerView:(id)a4 showWebView:(BOOL)a5 webView:(id)a6 animate:(BOOL)a7 completion:(id)a8;
- (CGSize)intrinsicContentSize;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (PKPayLaterAction)action;
- (PKPayLaterDisplayStyle)displayStyle;
- (PKPayLaterView)initWithAmount:(NSDecimalNumber *)amount currencyCode:(NSString *)currencyCode;
- (PKPayLaterViewInternalDelegate)internalDelegate;
- (id)_configuration;
- (id)_javaScriptQueryForUpdatedConfigurationProperty:(unint64_t)a3 configuration:(id)a4;
- (id)_webViewConfiguration;
- (id)delegate;
- (unint64_t)environmentType;
- (unint64_t)theme;
- (void)_recalculateSizeWithCompletion:(id)a3;
- (void)_registerForUserInterfaceStyleChanges;
- (void)_reloadViewContentsForProperty:(unint64_t)a3 completion:(id)a4;
- (void)_setupWebView:(id)a3 completion:(id)a4;
- (void)clearWebViewCache;
- (void)didMoveToWindow;
- (void)setAction:(PKPayLaterAction)action;
- (void)setAmount:(NSDecimalNumber *)amount;
- (void)setCurrencyCode:(NSString *)currencyCode;
- (void)setDelegate:(id)delegate;
- (void)setDisplayStyle:(PKPayLaterDisplayStyle)displayStyle;
- (void)setEnvironmentType:(unint64_t)a3;
- (void)setInternalDelegate:(id)a3;
- (void)setTheme:(unint64_t)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewDidClose:(id)a3;
@end

@implementation PKPayLaterView

- (PKPayLaterView)initWithAmount:(NSDecimalNumber *)amount currencyCode:(NSString *)currencyCode
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v7 = amount;
  v8 = currencyCode;
  v25.receiver = self;
  v25.super_class = (Class)PKPayLaterView;
  v9 = [(PKPayLaterView *)&v25 init];
  if (v9)
  {
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v7;
      __int16 v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Creating PKPayLaterView with amount %@ and currencyCode %@", buf, 0x16u);
    }

    uint64_t v11 = [MEMORY[0x1E4F849C0] sharedInstance];
    v24 = v7;
    utilities = v9->_utilities;
    v9->_utilities = (PKPayLaterMerchandisingUtilities *)v11;

    [(PKPayLaterView *)v9 _registerForUserInterfaceStyleChanges];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v9->_spinner;
    v9->_spinner = (UIActivityIndicatorView *)v13;

    [(UIActivityIndicatorView *)v9->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v9->_spinner startAnimating];
    [(UIActivityIndicatorView *)v9->_spinner sizeToFit];
    [(PKPayLaterView *)v9 addSubview:v9->_spinner];
    +[PKPayLaterView showSpinnerView:1 spinnerView:v9->_spinner showWebView:0 webView:v9->_webView animate:0 completion:0];
    objc_storeStrong((id *)&v9->_amount, amount);
    objc_storeStrong((id *)&v9->_currencyCode, currencyCode);
    v9->_displayStyle = 0;
    v9->_action = 0;
    v9->_theme = 0;
    v9->_environmentType = 0;
    v15 = (void *)MEMORY[0x1E4F28DC8];
    v16 = [(UIActivityIndicatorView *)v9->_spinner centerXAnchor];
    v17 = [(PKPayLaterView *)v9 centerXAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v26[0] = v18;
    v19 = [(UIActivityIndicatorView *)v9->_spinner centerYAnchor];
    v20 = [(PKPayLaterView *)v9 centerYAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v26[1] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    [v15 activateConstraints:v22];

    v7 = v24;
  }

  return v9;
}

- (void)setAmount:(NSDecimalNumber *)amount
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = amount;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amount, amount);
    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView amount to %@", (uint8_t *)&v7, 0xCu);
    }

    [(PKPayLaterView *)self _reloadViewContentsForProperty:1 completion:0];
  }
}

- (void)setCurrencyCode:(NSString *)currencyCode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = currencyCode;
  v6 = self->_currencyCode;
  int v7 = v5;
  v8 = v6;
  if (v8 == v7)
  {
  }
  else
  {
    uint64_t v9 = v8;
    if (v7 && v8)
    {
      BOOL v10 = [(NSString *)v7 isEqualToString:v8];

      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_currencyCode, currencyCode);
    uint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v7;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView currencyCode to %@", (uint8_t *)&v12, 0xCu);
    }

    [(PKPayLaterView *)self _reloadViewContentsForProperty:2 completion:0];
  }
LABEL_11:
}

- (void)setDisplayStyle:(PKPayLaterDisplayStyle)displayStyle
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_displayStyle != displayStyle)
  {
    self->_displayStyle = displayStyle;
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = PKPayLaterDisplayStyleToString();
      int v6 = 138412290;
      int v7 = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView displayStyle to %@", (uint8_t *)&v6, 0xCu);
    }
    [(PKPayLaterView *)self _reloadViewContentsForProperty:16 completion:0];
  }
}

- (void)setAction:(PKPayLaterAction)action
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_action != action)
  {
    self->_action = action;
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = PKPayLaterActionToString();
      int v6 = 138412290;
      int v7 = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView action to %@", (uint8_t *)&v6, 0xCu);
    }
    [(PKPayLaterView *)self _reloadViewContentsForProperty:64 completion:0];
  }
}

- (void)setTheme:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_theme != a3)
  {
    self->_theme = a3;
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = PKPayLaterThemeToString();
      int v6 = 138412290;
      int v7 = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView theme to %@", (uint8_t *)&v6, 0xCu);
    }
    [(PKPayLaterView *)self _reloadViewContentsForProperty:32 completion:0];
  }
}

- (void)setEnvironmentType:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_environmentType != a3)
  {
    self->_environmentType = a3;
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = PKPayLaterEnvironmentTypeToString();
      int v6 = 138412290;
      int v7 = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Did update PKPayLaterView environmentType to %@", (uint8_t *)&v6, 0xCu);
    }
    [(PKPayLaterView *)self _reloadViewContentsForProperty:128 completion:0];
  }
}

- (void)setInternalDelegate:(id)a3
{
  self->_internalDelegate = (PKPayLaterViewInternalDelegate *)a3;
  self->_delegate = (PKPayLaterViewDelegate *)a3;
}

- (void)_reloadViewContentsForProperty:(unint64_t)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [(PKPayLaterView *)self window];

  if (v7)
  {
    uint64_t v8 = [(PKPayLaterView *)self _configuration];
    uint64_t v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = PKPayLaterMerchandisingConfigurationPropertyToString();
      *(_DWORD *)buf = 138412546;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKPayLaterView reloading for property %@ and configuration %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke;
    aBlock[3] = &unk_1E59DACC8;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = v6;
    uint64_t v11 = _Block_copy(aBlock);
    objc_copyWeak(v14, (id *)buf);
    id v13 = v11;
    v14[1] = (id)a3;
    id v12 = v8;
    PKPayLaterValidateConfiguration();

    objc_destroyWeak(v14);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained
    && ([*((id *)WeakRetained + 63) payLaterView:WeakRetained didUpdateViewWithInvalidProperties:v6],
        v8[424]))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_2;
    v10[3] = &unk_1E59D4388;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    BOOL v14 = v5 == 0;
    id v12 = *(id *)(a1 + 32);
    id v11 = v5;
    [v8 _recalculateSizeWithCompletion:v10];

    objc_destroyWeak(&v13);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
    }
  }
}

void __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[52];
    uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v6 = WeakRetained[51];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_3;
    v7[3] = &unk_1E59CAD68;
    id v9 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    +[PKPayLaterView showSpinnerView:0 spinnerView:v4 showWebView:v5 webView:v6 animate:1 completion:v7];
  }
}

uint64_t __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (!WeakRetained)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  if (v5)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_5:
    v9();
    goto LABEL_13;
  }
  BOOL v10 = [WeakRetained _javaScriptQueryForUpdatedConfigurationProperty:*(void *)(a1 + 64) configuration:*(void *)(a1 + 32)];
  if ([v10 length] && *(void *)(*(void *)(a1 + 40) + 408))
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKPayLaterView evaluating javascript query \"%@\"", buf, 0xCu);
    }

    id v12 = (void *)v8[51];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_16;
    v13[3] = &unk_1E59DACF0;
    id v14 = *(id *)(a1 + 48);
    [v12 evaluateJavaScript:v10 completionHandler:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

LABEL_13:
}

void __60__PKPayLaterView__reloadViewContentsForProperty_completion___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Javascript query evaluation response %@, error: %@", buf, 0x16u);
  }

  if (v6)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F87538];
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v13[0] = *MEMORY[0x1E4F28568];
    v13[1] = v10;
    v14[0] = @"Error updating view with configuration";
    v14[1] = v6;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v12 = [v8 errorWithDomain:v9 code:1 userInfo:v11];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)clearWebViewCache
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPayLaterView clearing website data store cache", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4F46710] defaultDataStore];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F467E8], *MEMORY[0x1E4F46800], 0);
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  [v4 removeDataOfTypes:v5 modifiedSince:v6 completionHandler:&__block_literal_global_174];

  [(PKPayLaterMerchandisingUtilities *)self->_utilities clearWebRequestCache];
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterView;
  [(PKPayLaterView *)&v7 didMoveToWindow];
  v3 = [(PKPayLaterView *)self window];

  if (v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __33__PKPayLaterView_didMoveToWindow__block_invoke;
    v4[3] = &unk_1E59CB240;
    objc_copyWeak(&v5, &location);
    [(PKPayLaterView *)self _reloadViewContentsForProperty:255 completion:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __33__PKPayLaterView_didMoveToWindow__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F466F0]);
    objc_super v7 = [WeakRetained _webViewConfiguration];
    uint64_t v8 = objc_msgSend(v6, "initWithFrame:configuration:", v7, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v9 = WeakRetained[51];
    WeakRetained[51] = (id)v8;

    [WeakRetained[51] setUIDelegate:WeakRetained];
    [WeakRetained[51] setTranslatesAutoresizingMaskIntoConstraints:0];
    [WeakRetained[51] setNavigationDelegate:WeakRetained];
    id v10 = WeakRetained[51];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__PKPayLaterView_didMoveToWindow__block_invoke_2;
    v11[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v12, v4);
    [WeakRetained _setupWebView:v10 completion:v11];
    objc_destroyWeak(&v12);
  }
}

void __33__PKPayLaterView_didMoveToWindow__block_invoke_2(uint64_t a1)
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addSubview:WeakRetained[51]];
    id v12 = (void *)MEMORY[0x1E4F28DC8];
    id v16 = [v2[51] topAnchor];
    v15 = [v2 topAnchor];
    id v14 = [v16 constraintEqualToAnchor:v15];
    v17[0] = v14;
    id v13 = [v2[51] leadingAnchor];
    id v3 = [v2 leadingAnchor];
    uint64_t v4 = [v13 constraintEqualToAnchor:v3];
    v17[1] = v4;
    id v5 = [v2[51] bottomAnchor];
    id v6 = [v2 bottomAnchor];
    objc_super v7 = [v5 constraintEqualToAnchor:v6];
    v17[2] = v7;
    uint64_t v8 = [v2[51] trailingAnchor];
    id v9 = [v2 trailingAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9];
    v17[3] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
    [v12 activateConstraints:v11];

    [v2 setNeedsLayout];
  }
}

- (CGSize)intrinsicContentSize
{
  if (self->_didFinishInitialViewLoad)
  {
    [(WKWebView *)self->_webView alpha];
    if (v3 > 0.0)
    {
      p_size = &self->_size;
LABEL_9:
      double width = p_size->width;
      double height = p_size->height;
      goto LABEL_10;
    }
    [(UIActivityIndicatorView *)self->_spinner alpha];
    if (v6 <= 0.0)
    {
      p_size = (CGSize *)MEMORY[0x1E4F1DB30];
      goto LABEL_9;
    }
    spinner = self->_spinner;
  }
  else
  {
    spinner = self->_spinner;
  }
  [(UIActivityIndicatorView *)spinner frame];
  double width = v7;
  double height = v9;
LABEL_10:
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView finished loading", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  self->_didFinishInitialViewLoad = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PKPayLaterView_webView_didFinishNavigation___block_invoke;
  v9[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v10, buf);
  [(PKPayLaterView *)self _recalculateSizeWithCompletion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

void __46__PKPayLaterView_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    +[PKPayLaterView showSpinnerView:0 spinnerView:WeakRetained[52] showWebView:1 webView:WeakRetained[51] animate:1 completion:0];
    id WeakRetained = v2;
  }
}

- (void)webViewDidClose:(id)a3
{
  double v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPayLaterView did close web view", v4, 2u);
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, uint64_t))a5;
  utilities = self->_utilities;
  unint64_t environmentType = self->_environmentType;
  id v10 = a4;
  id v11 = [(PKPayLaterMerchandisingUtilities *)utilities merchandisingBaseURLForEnviornmentType:environmentType];
  id v12 = [v10 request];

  id v13 = [v12 URL];

  id v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    v23 = v13;
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "PKPayLaterView deciding policy for action: \"%@\"", (uint8_t *)&v22, 0xCu);
  }

  v15 = [v13 host];
  id v16 = [v11 host];
  id v17 = v15;
  id v18 = v16;
  if (v17 == v18)
  {

    uint64_t v21 = 1;
LABEL_12:

    goto LABEL_14;
  }
  uint64_t v19 = v18;
  if (!v17 || !v18)
  {

    goto LABEL_10;
  }
  char v20 = [v17 isEqualToString:v18];

  if ((v20 & 1) == 0)
  {
LABEL_10:
    if (!v13)
    {
      uint64_t v21 = 0;
      goto LABEL_14;
    }
    id v17 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v17 openURL:v13 withOptions:0];
    uint64_t v21 = 0;
    goto LABEL_12;
  }
  uint64_t v21 = 1;
LABEL_14:
  v7[2](v7, v21);
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 name];
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    v27 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPayLaterView received script message with name \"%@\"", (uint8_t *)&v26, 0xCu);
  }

  uint64_t v8 = v6;
  double v9 = v8;
  if (v8 == @"applePayDetails"
    || v8
    && (int v10 = [(__CFString *)v8 isEqualToString:@"applePayDetails"], v9, v10))
  {
    id v11 = [v5 body];
    if (v11)
    {
      id v12 = (void *)*MEMORY[0x1E4F87970];
      id v13 = v9;
      id v14 = v12;
      if (v13 == v14)
      {

LABEL_16:
        id v17 = v11;
        if (v17 != @"show-modal")
        {
          id v18 = v17;
          int v19 = [(__CFString *)v17 isEqualToString:@"show-modal"];

          if (!v19) {
            goto LABEL_28;
          }
        }
        char v20 = [PKPayLaterMerchandisingModalViewController alloc];
        uint64_t v21 = [(PKPayLaterView *)self _configuration];
        id v13 = [(PKPayLaterMerchandisingModalViewController *)v20 initWithConfiguration:v21];

        int v22 = [[PKNavigationController alloc] initWithRootViewController:v13];
        v23 = PKUIKeyWindow();
        uint64_t v24 = v23;
        if (v23)
        {
          objc_super v25 = [v23 rootViewController];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 138412290;
            v27 = v25;
            _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPayLaterView presenting modal view controller with rootVC %@", (uint8_t *)&v26, 0xCu);
          }

          [v25 presentViewController:v22 animated:1 completion:0];
        }
        else
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPayLaterView cannot find window to present modal view controller", (uint8_t *)&v26, 2u);
          }
          objc_super v25 = v7;
        }

        goto LABEL_27;
      }
      v15 = v14;
      if (v13 && v14)
      {
        int v16 = [(PKPayLaterMerchandisingModalViewController *)v13 isEqualToString:v14];

        if (!v16) {
          goto LABEL_28;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPayLaterView received script message with a nil message body", (uint8_t *)&v26, 2u);
      }
      id v13 = (PKPayLaterMerchandisingModalViewController *)v7;
    }
LABEL_27:

LABEL_28:
  }
}

- (id)_javaScriptQueryForUpdatedConfigurationProperty:(unint64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3)
  {
    int v8 = 1;
    unint64_t v9 = 1;
    do
    {
      if ((v9 & a3) != 0)
      {
        int v10 = [v6 stringValueForProperty:v9];
        id v11 = PKPayLaterMerchandisingConfigurationPropertyToString();
        id v12 = [(PKPayLaterMerchandisingUtilities *)self->_utilities generateJavaScriptQueryForUpdatedProperty:v11 newValue:v10];
        [v7 safelyAddObject:v12];
      }
      unint64_t v9 = 1 << v8++;
    }
    while (v9 <= a3);
  }
  id v13 = [v7 componentsJoinedByString:@" "];

  return v13;
}

- (void)_registerForUserInterfaceStyleChanges
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v8[0] = objc_opt_class();
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PKPayLaterView__registerForUserInterfaceStyleChanges__block_invoke;
  v5[3] = &unk_1E59DAD40;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  id v4 = (id)[(PKPayLaterView *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__PKPayLaterView__registerForUserInterfaceStyleChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 traitCollection];
  unint64_t v7 = [v6 userInterfaceStyle];

  uint64_t v8 = [v5 userInterfaceStyle];
  if (v8 != v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      int v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        unint64_t v13 = v7;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKPayLaterView did change trait collection to %ld", (uint8_t *)&v12, 0xCu);
      }

      if (v7 >= 3) {
        unint64_t v11 = *(void *)(*(void *)(a1 + 32) + 520);
      }
      else {
        unint64_t v11 = v7;
      }
      [WeakRetained setTheme:v11];
    }
  }
}

+ (void)showSpinnerView:(BOOL)a3 spinnerView:(id)a4 showWebView:(BOOL)a5 webView:(id)a6 animate:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  BOOL v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke;
  aBlock[3] = &unk_1E59DAD68;
  id v16 = v14;
  id v29 = v16;
  double v31 = (double)v11;
  id v17 = v13;
  id v30 = v17;
  double v32 = (double)v12;
  id v18 = (void (**)(void))_Block_copy(aBlock);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  void v26[2] = __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_2;
  v26[3] = &unk_1E59CAA98;
  id v19 = v15;
  id v27 = v19;
  char v20 = (void (**)(void))_Block_copy(v26);
  if (v9)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4FB1EB0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_3;
    v24[3] = &unk_1E59CAA98;
    objc_super v25 = v18;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_4;
    v22[3] = &unk_1E59CA9F8;
    v23 = v20;
    objc_msgSend(v21, "pkui_animateUsingOptions:animations:completion:", 4, v24, v22);
  }
  else
  {
    v18[2](v18);
    v20[2](v20);
  }
}

uint64_t __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 56);

  return [v2 setAlpha:v3];
}

uint64_t __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__PKPayLaterView_showSpinnerView_spinnerView_showWebView_webView_animate_completion___block_invoke_4(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)_webViewConfiguration
{
  uint64_t v3 = *MEMORY[0x1E4F87970];
  id v4 = objc_alloc_init(MEMORY[0x1E4F466A0]);
  [v4 addScriptMessageHandler:self name:v3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F46690]);
  [v5 setProcessPool:v6];

  [v5 setApplicationNameForUserAgent:v3];
  id v7 = objc_alloc_init(MEMORY[0x1E4F46688]);
  [v5 setPreferences:v7];

  [v5 setUserContentController:v4];
  uint64_t v8 = [v5 defaultWebpagePreferences];
  [v8 setAllowsContentJavaScript:1];

  return v5;
}

- (void)_setupWebView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKPayLaterMerchandisingUtilities *)self->_utilities merchandisingBaseURLForEnviornmentType:self->_environmentType];
  utilities = self->_utilities;
  int v10 = [(PKPayLaterView *)self _configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __43__PKPayLaterView__setupWebView_completion___block_invoke;
  v13[3] = &unk_1E59CCDC0;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  [(PKPayLaterMerchandisingUtilities *)utilities merchandisingWidgetHTMLWithConfiguration:v10 completion:v13];
}

void __43__PKPayLaterView__setupWebView_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PKPayLaterView__setupWebView_completion___block_invoke_2;
  v6[3] = &unk_1E59CB728;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v4 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __43__PKPayLaterView__setupWebView_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setOpaque:0];
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setBackgroundColor:v3];

  [*(id *)(a1 + 32) setAllowsLinkPreview:0];
  id v4 = (id)[*(id *)(a1 + 32) loadHTMLString:*(void *)(a1 + 40) baseURL:*(void *)(a1 + 48)];
  id v8 = [*(id *)(a1 + 32) scrollView];
  [v8 setScrollEnabled:0];
  id v5 = [MEMORY[0x1E4FB1618] clearColor];
  [v8 setBackgroundColor:v5];

  id v6 = [v8 pinchGestureRecognizer];
  [v6 setEnabled:0];

  [v8 setShowsHorizontalScrollIndicator:0];
  [v8 setShowsVerticalScrollIndicator:0];
  [v8 setMultipleTouchEnabled:0];
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)_recalculateSizeWithCompletion:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3010000000;
  v19[3] = "";
  CGSize size = self->_size;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke;
  v17[3] = &unk_1E59CFB08;
  v17[4] = self;
  [v5 addOperation:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_61;
  v15[3] = &unk_1E59D2F50;
  v15[4] = self;
  objc_copyWeak(&v16, &location);
  v15[5] = v19;
  [v5 addOperation:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_66;
  v13[3] = &unk_1E59D2F50;
  void v13[4] = self;
  objc_copyWeak(&v14, &location);
  v13[5] = v19;
  [v5 addOperation:v13];
  id v6 = [MEMORY[0x1E4F1CA98] null];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_72;
  v9[3] = &unk_1E59DAD90;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v10 = v7;
  id v11 = v19;
  id v8 = (id)[v5 evaluateWithInput:v6 completion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  _Block_object_dispose(v19, 8);
}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(*(void *)(a1 + 32) + 408);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2;
  v11[3] = &unk_1E59D2F00;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 evaluateJavaScript:@"document.readyState" completionHandler:v11];
}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 stringValue];
  id v4 = v3;
  if (v3 != @"complete" && v3) {
    [(__CFString *)v3 caseInsensitiveCompare:@"complete"];
  }

  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPayLaterView readyState: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_61(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(*(void *)(a1 + 32) + 408);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2_65;
  v14[3] = &unk_1E59D2F28;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  uint64_t v13 = *(void *)(a1 + 40);
  id v15 = v12;
  uint64_t v17 = v13;
  [v10 evaluateJavaScript:@"document.querySelector('apple-pay-merchandising').getBoundingClientRect().height" completionHandler:v14];

  objc_destroyWeak(&v18);
}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2_65(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView encountered error getting height %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      [v5 floatValue];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = fmin(v9, 350.0);
      id v8 = PKLogFacilityTypeGetObject();
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v11 = WeakRetained[55];
      int v12 = 134218240;
      id v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = v11;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView recalcuated height to %f from old height %f", (uint8_t *)&v12, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_66(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(*(void *)(a1 + 32) + 408);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2_70;
  v14[3] = &unk_1E59D2F28;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  uint64_t v13 = *(void *)(a1 + 40);
  id v15 = v12;
  uint64_t v17 = v13;
  [v10 evaluateJavaScript:@"document.querySelector('apple-pay-merchandising').getBoundingClientRect().width" completionHandler:v14];

  objc_destroyWeak(&v18);
}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_2_70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView encountered error getting width %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      [v5 floatValue];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v9;
      id v8 = PKLogFacilityTypeGetObject();
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
      uint64_t v11 = WeakRetained[54];
      int v12 = 134218240;
      id v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = v11;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView recalcuated width to %f from old width %f", (uint8_t *)&v12, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_72(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ([v5 isCanceled])
    {
      uint64_t v7 = *((void *)WeakRetained + 56) + 1;
      *((void *)WeakRetained + 56) = v7;
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v21 = 25;
        __int16 v22 = 2048;
        uint64_t v23 = v7;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterView WKWebView document wasn't ready to load. Trying again in %ld miliseconds. Retry count %ld", buf, 0x16u);
      }

      dispatch_time_t v9 = dispatch_time(0, 25000000);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_73;
      v18[3] = &unk_1E59CAD18;
      v18[4] = WeakRetained;
      id v19 = *(id *)(a1 + 32);
      dispatch_after(v9, MEMORY[0x1E4F14428], v18);
    }
    else
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      double v11 = *((double *)WeakRetained + 54);
      double v12 = *((double *)WeakRetained + 55);
      if (*(double *)(v10 + 32) != v11 || *(double *)(v10 + 40) != v12)
      {
        __int16 v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v25.double width = v11;
          v25.double height = v12;
          uint64_t v15 = NSStringFromCGSize(v25);
          uint64_t v16 = NSStringFromCGSize(*(CGSize *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
          *(_DWORD *)buf = 138412546;
          uint64_t v21 = (uint64_t)v15;
          __int16 v22 = 2112;
          uint64_t v23 = (uint64_t)v16;
          _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "PKPayLaterView did update size from %@ to %@", buf, 0x16u);
        }
        *((_OWORD *)WeakRetained + 27) = *(_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
        [WeakRetained invalidateIntrinsicContentSize];
        [*((id *)WeakRetained + 58) payLaterViewDidUpdateHeight:WeakRetained];
      }
      uint64_t v17 = *(void *)(a1 + 32);
      if (v17) {
        (*(void (**)(void))(v17 + 16))();
      }
    }
  }
}

uint64_t __49__PKPayLaterView__recalculateSizeWithCompletion___block_invoke_73(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recalculateSizeWithCompletion:*(void *)(a1 + 40)];
}

- (id)_configuration
{
  id v3 = objc_alloc(MEMORY[0x1E4F849B8]);
  id v4 = [(PKPayLaterView *)self amount];
  id v5 = [(PKPayLaterView *)self currencyCode];
  id v6 = objc_msgSend(v3, "initWithAmount:currency:displayStyle:action:theme:environmentType:", v4, v5, -[PKPayLaterView displayStyle](self, "displayStyle"), -[PKPayLaterView action](self, "action"), -[PKPayLaterView theme](self, "theme"), -[PKPayLaterView environmentType](self, "environmentType"));

  return v6;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (PKPayLaterViewDelegate *)delegate;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (PKPayLaterDisplayStyle)displayStyle
{
  return self->_displayStyle;
}

- (PKPayLaterAction)action
{
  return self->_action;
}

- (PKPayLaterViewInternalDelegate)internalDelegate
{
  return self->_internalDelegate;
}

- (unint64_t)environmentType
{
  return self->_environmentType;
}

- (unint64_t)theme
{
  return self->_theme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end