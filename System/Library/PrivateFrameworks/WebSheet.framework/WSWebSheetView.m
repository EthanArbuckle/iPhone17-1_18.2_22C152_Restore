@interface WSWebSheetView
- (BOOL)_handleCertificateError:(__SecTrust *)a3 newhost:(id)a4;
- (BOOL)_isSecureAddress;
- (BOOL)_shouldShowPromptLabels;
- (BOOL)enableTVMode;
- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3;
- (BOOL)formAutoFillControllerShouldDisableStreamlinedLogin:(id)a3;
- (BOOL)hasEVCert;
- (BOOL)isCertTrustDone;
- (BOOL)isChinaRegion;
- (BOOL)isConfigurationProfileMIMEType:(id)a3;
- (BOOL)isSetupAssistantRunning;
- (BOOL)isUserAprroved:(id)a3;
- (BOOL)shouldShowStayConnectedOptions;
- (NSDictionary)proxyConfiguration;
- (NSMutableDictionary)resultOptions;
- (NSURL)currentURL;
- (NSURL)probeURL;
- (NSUUID)tabIDForAutoFill;
- (WKWebView)webView;
- (WSWebSheetView)initWithFrame:(CGRect)a3 webSheetViewController:(id)a4;
- (WSWebSheetViewController)webSheetViewController;
- (WSWebSheetViewDelegate)delegate;
- (double)_promptLabelFontLineHeight;
- (double)getAddressViewHeight;
- (double)getHeaderFrameHeight;
- (id)_evCertColor;
- (id)_lockIconImage;
- (id)_presentingViewControllerForWebView:(id)a3;
- (id)_promptLabelFont;
- (id)_sheetController;
- (id)_specializedMessageForError:(id)a3;
- (id)_titleForError:(id)a3;
- (id)_titleString:(BOOL)a3;
- (id)appNametoOpenURL:(id)a3;
- (id)formAutoFillControllerURLForFormAutoFill:(id)a3;
- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6;
- (void)_addAndRemoveAddressViewsAsNeeded;
- (void)_backButtonPressed;
- (void)_captiveProbeDispatchTimerDidFire:(id)a3;
- (void)_forwardButtonPressed;
- (void)_precheckTrustForServerCertificate:(__SecTrust *)a3 host:(id)a4;
- (void)_showGenericDownloadAlert;
- (void)_showProfileDownloadAlert;
- (void)_showProfileInstallAlert;
- (void)_startCaptiveProbeDispatchTimer;
- (void)_stopCaptiveProbeDispatchTimer;
- (void)_updateBackForwardButtons;
- (void)_updateTitle;
- (void)_webView:(id)a3 accessoryViewCustomButtonTappedInFormInputSession:(id)a4;
- (void)_webView:(id)a3 didStartInputSession:(id)a4;
- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5;
- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4;
- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4;
- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6;
- (void)addAlert:(id)a3;
- (void)cancelTapped;
- (void)dealloc;
- (void)dequeueRedirectTypeQueue;
- (void)dismissWebSheetWithCaptiveWebSheetResult:(int64_t)a3;
- (void)dispatchCaptiveProbe;
- (void)doneTapped;
- (void)downloadDidFinish:(id)a3;
- (void)handleProbeResult:(int64_t)a3;
- (void)layoutSubviews;
- (void)pushBackToRedirectTypeQueue;
- (void)setCurrentURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableTVMode:(BOOL)a3;
- (void)setHasEVCert:(BOOL)a3;
- (void)setIsCertTrustDone:(BOOL)a3;
- (void)setProbeURL:(id)a3;
- (void)setProxyConfiguration:(id)a3;
- (void)setResultOptions:(id)a3;
- (void)setSSID:(id)a3;
- (void)setShouldShowStayConnectedOptions:(BOOL)a3;
- (void)setWebSheetViewController:(id)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewWithInterfaceName:(id)a3;
- (void)updateRedirectURLTypeSetting;
- (void)updateResultOptions;
- (void)updateToDoneButton;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4;
- (void)webView:(id)a3 didCommitNavigation:(id)a4;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation WSWebSheetView

- (WSWebSheetView)initWithFrame:(CGRect)a3 webSheetViewController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v59[2] = *MEMORY[0x263EF8340];
  id v10 = a4;
  v58.receiver = self;
  v58.super_class = (Class)WSWebSheetView;
  v11 = -[WSWebSheetView initWithFrame:](&v58, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_webSheetViewController, a4);
    v13 = (UINavigationBar *)objc_alloc_init(MEMORY[0x263F1C7E0]);
    navigationBar = v12->_navigationBar;
    v12->_navigationBar = v13;

    v15 = v12->_navigationBar;
    v16 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
    [(UINavigationBar *)v15 setBarTintColor:v16];

    [(UINavigationBar *)v12->_navigationBar setTranslucent:0];
    v17 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
    [(WSWebSheetView *)v12 setBackgroundColor:v17];

    [(UINavigationBar *)v12->_navigationBar setRequestedContentSize:2];
    uint64_t v18 = [objc_alloc(MEMORY[0x263F1C800]) initWithTitle:&stru_26F2A9070];
    navigationItem = v12->_navigationItem;
    v12->_navigationItem = (UINavigationItem *)v18;

    id v20 = objc_alloc(MEMORY[0x263F1C468]);
    v21 = GetLocalizedString((uint64_t)"Cancel");
    uint64_t v22 = [v20 initWithTitle:v21 style:2 target:v12 action:sel_cancelTapped];
    cancelDoneBarButtonItem = v12->_cancelDoneBarButtonItem;
    v12->_cancelDoneBarButtonItem = (UIBarButtonItem *)v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:101 target:v12 action:sel__backButtonPressed];
    backButtonItem = v12->_backButtonItem;
    v12->_backButtonItem = (UIBarButtonItem *)v24;

    v26 = [MEMORY[0x263F1C550] linkColor];
    [(UIBarButtonItem *)v12->_backButtonItem setTintColor:v26];

    uint64_t v27 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:102 target:v12 action:sel__forwardButtonPressed];
    forwardButtonItem = v12->_forwardButtonItem;
    v12->_forwardButtonItem = (UIBarButtonItem *)v27;

    v29 = [MEMORY[0x263F1C550] linkColor];
    [(UIBarButtonItem *)v12->_forwardButtonItem setTintColor:v29];

    [(UIBarButtonItem *)v12->_backButtonItem setEnabled:0];
    [(UIBarButtonItem *)v12->_forwardButtonItem setEnabled:0];
    v30 = v12->_navigationItem;
    v59[0] = v12->_backButtonItem;
    v59[1] = v12->_forwardButtonItem;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];
    [(UINavigationItem *)v30 setLeftBarButtonItems:v31];

    [(UINavigationItem *)v12->_navigationItem setRightBarButtonItem:v12->_cancelDoneBarButtonItem];
    [(UINavigationBar *)v12->_navigationBar pushNavigationItem:v12->_navigationItem animated:0];
    [(UINavigationBar *)v12->_navigationBar setDelegate:v12];
    v32 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    addressView = v12->_addressView;
    v12->_addressView = v32;

    v34 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    addressLabel = v12->_addressLabel;
    v12->_addressLabel = v34;

    v36 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    ssidLabel = v12->_ssidLabel;
    v12->_ssidLabel = v36;

    v38 = v12->_addressLabel;
    v39 = [(WSWebSheetView *)v12 _promptLabelFont];
    [(UILabel *)v38 setFont:v39];

    [(WSWebSheetView *)v12 addSubview:v12->_addressView];
    v40 = v12->_ssidLabel;
    v41 = [(WSWebSheetView *)v12 _promptLabelFont];
    [(UILabel *)v40 setFont:v41];

    [(UILabel *)v12->_ssidLabel setTextAlignment:1];
    id v42 = objc_alloc(MEMORY[0x263F1C6D0]);
    v43 = [(WSWebSheetView *)v12 _lockIconImage];
    uint64_t v44 = [v42 initWithImage:v43];
    lockIconView = v12->_lockIconView;
    v12->_lockIconView = (UIImageView *)v44;

    v46 = [(UIImageView *)v12->_lockIconView image];
    v47 = [v46 imageWithRenderingMode:2];
    [(UIImageView *)v12->_lockIconView setImage:v47];

    v48 = v12->_lockIconView;
    v49 = [MEMORY[0x263F1C550] labelColor];
    [(UIImageView *)v48 setTintColor:v49];

    [(WSWebSheetView *)v12 addSubview:v12->_navigationBar];
    dispatch_queue_t v50 = dispatch_queue_create("_redirectTypeQueue access thread", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v50;

    v52 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    resultOptions = v12->_resultOptions;
    v12->_resultOptions = v52;

    v54 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    redirectTypeQueue = v12->_redirectTypeQueue;
    v12->_redirectTypeQueue = v54;

    v12->_currentRedirectURLTypeSet = 0;
    v12->_firstNavigation = 1;
    navigationURLAtStart = v12->_navigationURLAtStart;
    v12->_navigationURLAtStart = 0;

    v12->_everReceivedUntrustedCertificate = 0;
  }

  return v12;
}

- (void)dequeueRedirectTypeQueue
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__WSWebSheetView_dequeueRedirectTypeQueue__block_invoke;
  block[3] = &unk_26504AE20;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__WSWebSheetView_dequeueRedirectTypeQueue__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 512) count];
  if (result)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 512);
    return [v3 removeObjectAtIndex:0];
  }
  return result;
}

- (void)pushBackToRedirectTypeQueue
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__WSWebSheetView_pushBackToRedirectTypeQueue__block_invoke;
  block[3] = &unk_26504AE20;
  block[4] = self;
  dispatch_async(queue, block);
}

void __45__WSWebSheetView_pushBackToRedirectTypeQueue__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 512) count])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 512) firstObject];
    [*(id *)(*(void *)(a1 + 32) + 512) addObject:v2];
    [*(id *)(*(void *)(a1 + 32) + 512) removeObjectAtIndex:0];
  }
}

- (void)updateResultOptions
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WSWebSheetView_updateResultOptions__block_invoke;
  block[3] = &unk_26504AE20;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__WSWebSheetView_updateResultOptions__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 512) count])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 512) firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = [v2 unsignedIntegerValue];
    }
    else {
      uint64_t v3 = 0;
    }
    [*(id *)(*(void *)(a1 + 32) + 512) removeAllObjects];
  }
  else
  {
    uint64_t v3 = 0;
  }
  v4 = [*(id *)(a1 + 32) delegate];

  if (v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __37__WSWebSheetView_updateResultOptions__block_invoke_2;
    v5[3] = &unk_26504AE48;
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

void __37__WSWebSheetView_updateResultOptions__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 handleCompleteNotificationWithRedirectURLtype:*(void *)(a1 + 40) result:0];
}

- (void)updateToDoneButton
{
  self->_inDoneState = 1;
  [(WSWebSheetView *)self setShouldShowStayConnectedOptions:0];
  [(UIBarButtonItem *)self->_cancelDoneBarButtonItem setAction:sel_doneTapped];
  cancelDoneBarButtonItem = self->_cancelDoneBarButtonItem;
  GetLocalizedString((uint64_t)"Done");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIBarButtonItem *)cancelDoneBarButtonItem setTitle:v4];
}

- (void)setWebViewWithInterfaceName:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F1FAB0];
  id v5 = a3;
  id v24 = objc_alloc_init(v4);
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 builtInPlugInsURL];
  v8 = [v7 URLByAppendingPathComponent:@"SafariServices.wkbundle"];
  [v24 setInjectedBundleURL:v8];

  if (objc_opt_respondsToSelector()) {
    [v24 setJITEnabled:0];
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263F1FA28]) _initWithConfiguration:v24];
  id v10 = objc_alloc_init(MEMORY[0x263F1FA60]);
  [v10 _setApplePayEnabled:1];
  [v10 setAllowsInlineMediaPlayback:1];
  [v10 setDataDetectorTypes:3];
  v11 = (void *)[objc_alloc(MEMORY[0x263F1FAC8]) initNonPersistentConfiguration];
  [v11 setBoundInterfaceIdentifier:v5];

  [v11 setAllowsCellularAccess:0];
  if (objc_opt_respondsToSelector()) {
    [v11 setLegacyTLSEnabled:1];
  }
  [v11 setProxyConfiguration:self->_proxyConfiguration];
  v12 = (void *)[objc_alloc(MEMORY[0x263F1FA68]) _initWithConfiguration:v11];
  [v10 setWebsiteDataStore:v12];

  [v10 setProcessPool:v9];
  [v10 _setClientNavigationsRunAtForegroundPriority:1];
  v13 = [v10 preferences];
  [v13 _setDeviceOrientationEventEnabled:0];

  id v14 = objc_alloc(MEMORY[0x263F1FA58]);
  [(WSWebSheetView *)self frame];
  v15 = (WKWebView *)objc_msgSend(v14, "initWithFrame:configuration:", v10);
  webView = self->_webView;
  self->_webView = v15;

  v17 = objc_alloc_init(WSWebSheetDownloadManager);
  downloadManager = self->_downloadManager;
  self->_downloadManager = v17;

  [(WSWebSheetDownloadManager *)self->_downloadManager setDelegate:self];
  v19 = self->_downloadManager;
  id v20 = [(WKWebView *)self->_webView configuration];
  v21 = [v20 processPool];
  [v21 _setDownloadDelegate:v19];

  [(WKWebView *)self->_webView setNavigationDelegate:self];
  [(WKWebView *)self->_webView setUIDelegate:self];
  [(WKWebView *)self->_webView _setInputDelegate:self];
  [(WKWebView *)self->_webView becomeFirstResponder];
  [(WKWebView *)self->_webView setAllowsBackForwardNavigationGestures:1];
  uint64_t v22 = (_SFFormAutoFillController *)[objc_alloc(MEMORY[0x263F16998]) initWithWebView:self->_webView delegate:self];
  autoFillController = self->_autoFillController;
  self->_autoFillController = v22;

  [(WSWebSheetView *)self insertSubview:self->_webView belowSubview:self->_navigationBar];
}

- (void)setSSID:(id)a3
{
  objc_storeStrong((id *)&self->_ssid, a3);
  id v5 = a3;
  [(UILabel *)self->_ssidLabel setText:v5];

  [(WSWebSheetView *)self _updateTitle];
}

- (id)_titleString:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(WSWebSheetView *)self isChinaRegion];
  v6 = NSString;
  if (v3)
  {
    if (v5) {
      v7 = "Captive WLAN - %@";
    }
    else {
      v7 = "Captive Wi-Fi - %@";
    }
    v8 = GetLocalizedString((uint64_t)v7);
    objc_msgSend(v6, "stringWithFormat:", v8, self->_ssid);
  }
  else
  {
    if (v5) {
      v9 = "Captive WLAN";
    }
    else {
      v9 = "Captive Wi-Fi";
    }
    v8 = GetLocalizedString((uint64_t)v9);
    objc_msgSend(v6, "stringWithFormat:", v8, v12);
  id v10 = };

  return v10;
}

- (void)_updateTitle
{
  BOOL v3 = ![(WSWebSheetView *)self _shouldShowPromptLabels] && self->_ssid != 0;
  id v4 = [(WSWebSheetView *)self _titleString:v3];
  [(UINavigationItem *)self->_navigationItem setTitle:v4];
}

- (double)getHeaderFrameHeight
{
  return 44.0;
}

- (double)getAddressViewHeight
{
  [(WSWebSheetView *)self _promptLabelFontLineHeight];
  return v2 * 2.0 + 10.0;
}

- (void)layoutSubviews
{
  [(WSWebSheetView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(WSWebSheetView *)self getHeaderFrameHeight];
  double v8 = v7;
  BOOL v9 = [(WSWebSheetView *)self _shouldShowPromptLabels];
  [(WSWebSheetView *)self _addAndRemoveAddressViewsAsNeeded];
  [(WSWebSheetView *)self _updateTitle];
  double v10 = 0.0;
  if (v9)
  {
    [(WSWebSheetView *)self getTopSafeAreaInsetTop];
    double v12 = v11;
    [(WSWebSheetView *)self getAddressViewHeight];
    double v10 = v12 + v13;
    -[UIView setFrame:](self->_addressView, "setFrame:", 0.0, v12, v4, v13);
  }
  -[UINavigationBar setFrame:](self->_navigationBar, "setFrame:", 0.0, v10, v4, v8);
  if (v9)
  {
    double v30 = v6;
    BOOL v14 = [(WSWebSheetView *)self _isSecureAddress];
    [(WSWebSheetView *)self _promptLabelFontLineHeight];
    double v16 = v15;
    v17 = [(UIImageView *)self->_lockIconView image];
    [v17 size];
    double v19 = v18;
    uint64_t v29 = v20;

    if (v14) {
      double v21 = v19 + 5.0;
    }
    else {
      double v21 = 0.0;
    }
    -[UILabel sizeThatFits:](self->_addressLabel, "sizeThatFits:", v4 + -20.0 - v21, v16, v29);
    double v24 = v23;
    if (v22 >= v4 + -20.0 - v21) {
      double v25 = v4 + -20.0 - v21;
    }
    else {
      double v25 = v22;
    }
    double v26 = v21 + RoundFloatToPixels((v4 - v25 - v21) * 0.5);
    if (v14) {
      -[UIImageView setFrame:](self->_lockIconView, "setFrame:");
    }
    -[UILabel setFrame:](self->_addressLabel, "setFrame:", v26, 2.0, v25, v24);
    -[UILabel setFrame:](self->_ssidLabel, "setFrame:", 10.0, v16 + 4.0, v4 + -20.0, v16);
    [(UIView *)self->_addressView addSubview:self->_addressLabel];
    [(UIView *)self->_addressView addSubview:self->_ssidLabel];
    double v6 = v30;
  }
  else
  {
    [(UILabel *)self->_addressLabel removeFromSuperview];
    [(UILabel *)self->_ssidLabel removeFromSuperview];
  }
  [(UINavigationBar *)self->_navigationBar frame];
  double MaxY = CGRectGetMaxY(v32);
  webView = self->_webView;
  -[WKWebView setFrame:](webView, "setFrame:", 0.0, MaxY, v4, v6 - MaxY);
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  WebThreadLock();
  [(WSWebSheetDownloadManager *)self->_downloadManager setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)WSWebSheetView;
  [(WSWebSheetView *)&v4 dealloc];
}

- (void)setProbeURL:(id)a3
{
  self->_probeURL = (NSURL *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setCurrentURL:(id)a3
{
  double v5 = (NSURL *)a3;
  p_currentURL = &self->_currentURL;
  if (self->_currentURL != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_currentURL, a3);
    p_currentURL = (NSURL **)[(WSWebSheetView *)self _updateAddress];
    double v5 = v7;
  }
  MEMORY[0x270F9A758](p_currentURL, v5);
}

- (id)_evCertColor
{
  double v2 = (void *)_evCertColor_color_0;
  if (!_evCertColor_color_0)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F1C550]) initWithRed:0.262745098 green:0.749019608 blue:0.345098039 alpha:1.0];
    objc_super v4 = (void *)_evCertColor_color_0;
    _evCertColor_color_0 = v3;

    double v2 = (void *)_evCertColor_color_0;
  }
  return v2;
}

- (id)_lockIconImage
{
  double v2 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v3 = GetBundle();
  objc_super v4 = [v2 imageNamed:@"Lock" inBundle:v3];

  return v4;
}

- (void)setHasEVCert:(BOOL)a3
{
  if (self->_hasEVCert != a3)
  {
    self->_hasEVCert = a3;
    if (a3) {
      [(WSWebSheetView *)self _evCertColor];
    }
    else {
    id v6 = [MEMORY[0x263F1C550] labelColor];
    }
    [(UILabel *)self->_addressLabel setTextColor:v6];
    objc_super v4 = [(UIImageView *)self->_lockIconView image];
    double v5 = [v4 imageWithRenderingMode:2];
    [(UIImageView *)self->_lockIconView setImage:v5];

    [(UIImageView *)self->_lockIconView setTintColor:v6];
    [(WSWebSheetView *)self _updateAddress];
  }
}

- (void)_addAndRemoveAddressViewsAsNeeded
{
  if ([(WSWebSheetView *)self _shouldShowPromptLabels])
  {
    [(UIView *)self->_addressView setHidden:0];
    id v4 = [(NSURL *)self->_currentURL _lp_simplifiedDisplayString];
    -[UILabel setText:](self->_addressLabel, "setText:");
    if ([(WSWebSheetView *)self _isSecureAddress]) {
      [(UIView *)self->_addressView addSubview:self->_lockIconView];
    }
    else {
      [(UIImageView *)self->_lockIconView removeFromSuperview];
    }
  }
  else
  {
    [(UIImageView *)self->_lockIconView removeFromSuperview];
    addressView = self->_addressView;
    [(UIView *)addressView setHidden:1];
  }
}

- (BOOL)_isSecureAddress
{
  double v2 = [(NSURL *)self->_currentURL scheme];
  uint64_t v3 = [v2 lowercaseString];
  char v4 = [v3 isEqualToString:@"https"];

  return v4;
}

- (BOOL)_shouldShowPromptLabels
{
  double v2 = [(WSWebSheetView *)self window];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  return v4 < v6 || (v8 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (id)_promptLabelFont
{
  return (id)[MEMORY[0x263F1C658] systemFontOfSize:13.0];
}

- (double)_promptLabelFontLineHeight
{
  double v2 = [(WSWebSheetView *)self _promptLabelFont];
  [v2 lineHeight];
  double v4 = RoundFloatToPixels(v3);

  return v4;
}

- (void)_updateBackForwardButtons
{
  [(UIBarButtonItem *)self->_backButtonItem setEnabled:[(WKWebView *)self->_webView canGoBack]];
  forwardButtonItem = self->_forwardButtonItem;
  BOOL v4 = [(WKWebView *)self->_webView canGoForward];
  [(UIBarButtonItem *)forwardButtonItem setEnabled:v4];
}

- (void)_backButtonPressed
{
  id v2 = [(WKWebView *)self->_webView goBack];
}

- (void)_forwardButtonPressed
{
  id v2 = [(WKWebView *)self->_webView goForward];
}

- (BOOL)isSetupAssistantRunning
{
  return MEMORY[0x270F5D220](self, a2);
}

- (void)cancelTapped
{
  NSLog(&cfstr_UserTappedCanc.isa, a2);
  if (self->_shouldShowStayConnectedOptions)
  {
    BOOL v3 = [(WSWebSheetView *)self isChinaRegion];
    BOOL v4 = NSString;
    if (v3) {
      double v5 = "The WLAN “%@” is not connected to the Internet.";
    }
    else {
      double v5 = "The Wi-Fi network “%@” is not connected to the Internet.";
    }
    double v6 = GetLocalizedString((uint64_t)v5);
    double v7 = objc_msgSend(v4, "stringWithFormat:", v6, self->_ssid);

    uint64_t v8 = GetLocalizedString((uint64_t)"Cancel (stay connected sheet)");
    BOOL v9 = GetLocalizedString((uint64_t)"Use Other Network");
    double v10 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v7 message:&stru_26F2A9070 preferredStyle:0];
    stayConnectedAlertController = self->_stayConnectedAlertController;
    self->_stayConnectedAlertController = v10;

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __30__WSWebSheetView_cancelTapped__block_invoke;
    v24[3] = &unk_26504AE70;
    v24[4] = self;
    double v12 = [MEMORY[0x263F1C3F0] actionWithTitle:v9 style:0 handler:v24];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __30__WSWebSheetView_cancelTapped__block_invoke_2;
    v23[3] = &unk_26504AE70;
    v23[4] = self;
    double v13 = [MEMORY[0x263F1C3F0] actionWithTitle:v8 style:1 handler:v23];
    BOOL v14 = [(WSWebSheetView *)self isSetupAssistantRunning];
    BOOL v15 = v14;
    double v16 = "is not";
    if (v14) {
      double v16 = "is";
    }
    NSLog(&cfstr_SetupAssistant.isa, v16);
    if (!v15)
    {
      v17 = GetLocalizedString((uint64_t)"Use Without Internet");
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __30__WSWebSheetView_cancelTapped__block_invoke_3;
      v22[3] = &unk_26504AE70;
      v22[4] = self;
      double v18 = [MEMORY[0x263F1C3F0] actionWithTitle:v17 style:2 handler:v22];
      [(UIAlertController *)self->_stayConnectedAlertController addAction:v18];
    }
    [(UIAlertController *)self->_stayConnectedAlertController addAction:v12];
    [(UIAlertController *)self->_stayConnectedAlertController addAction:v13];
    [(UIAlertController *)self->_stayConnectedAlertController setModalPresentationStyle:7];
    cancelDoneBarButtonItem = self->_cancelDoneBarButtonItem;
    uint64_t v20 = [(UIAlertController *)self->_stayConnectedAlertController popoverPresentationController];
    [v20 setBarButtonItem:cancelDoneBarButtonItem];

    double v21 = [(WSWebSheetView *)self webSheetViewController];
    [v21 presentViewController:self->_stayConnectedAlertController animated:1 completion:&__block_literal_global];
  }
  else
  {
    [(WSWebSheetView *)self dismissWebSheetWithCaptiveWebSheetResult:1];
  }
}

uint64_t __30__WSWebSheetView_cancelTapped__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 568);
  *(void *)(v2 + 568) = 0;

  BOOL v4 = *(void **)(a1 + 32);
  return [v4 dismissWebSheetWithCaptiveWebSheetResult:7];
}

void __30__WSWebSheetView_cancelTapped__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 568);
  *(void *)(v1 + 568) = 0;
}

uint64_t __30__WSWebSheetView_cancelTapped__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 568);
  *(void *)(v2 + 568) = 0;

  BOOL v4 = *(void **)(a1 + 32);
  return [v4 dismissWebSheetWithCaptiveWebSheetResult:5];
}

- (void)doneTapped
{
}

- (BOOL)shouldShowStayConnectedOptions
{
  return self->_shouldShowStayConnectedOptions;
}

- (void)dismissWebSheetWithCaptiveWebSheetResult:(int64_t)a3
{
  NSLog(&cfstr_DismissingShee.isa, a2, a3);
  double v5 = [(WSWebSheetView *)self delegate];

  if (v5)
  {
    double v6 = [(WSWebSheetView *)self delegate];
    [v6 handleCompleteNotificationWithRedirectURLtype:self->_currentRedirectURLType result:a3];

    id v7 = [(WSWebSheetView *)self delegate];
    [v7 handleDismissal];
  }
}

- (id)_sheetController
{
  sheetController = self->_sheetController;
  if (!sheetController)
  {
    BOOL v4 = (WBUSheetController *)[objc_alloc(MEMORY[0x263F86260]) initWithDelegate:self];
    double v5 = self->_sheetController;
    self->_sheetController = v4;

    sheetController = self->_sheetController;
  }
  return sheetController;
}

- (void)addAlert:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (WebThreadIsCurrent())
  {
    double v5 = WebThreadMakeNSInvocation();
    [v5 setArgument:&v10 atIndex:2];
    WebThreadCallDelegate();

    id v4 = v10;
  }
  else
  {
    alerts = self->_alerts;
    if (!alerts)
    {
      id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v8 = self->_alerts;
      self->_alerts = v7;

      alerts = self->_alerts;
    }
    [(NSMutableArray *)alerts addObject:v4];
    BOOL v9 = [(WSWebSheetView *)self _sheetController];
    [v9 showSheetForAlert:v4 inView:0];
  }
}

- (BOOL)isChinaRegion
{
  if (isChinaRegion_once != -1) {
    dispatch_once(&isChinaRegion_once, &__block_literal_global_113);
  }
  return isChinaRegion_isChinaRegion;
}

uint64_t __31__WSWebSheetView_isChinaRegion__block_invoke()
{
  uint64_t v0 = CPGetDeviceRegionCode();
  NSLog(&cfstr_DeviceRegionCo.isa, v0);
  uint64_t result = [(id)CPGetDeviceRegionCode() isEqualToString:@"CH"];
  isChinaRegion_isChinaRegion = result;
  return result;
}

- (void)_precheckTrustForServerCertificate:(__SecTrust *)a3 host:(id)a4
{
  if (!self->_inDoneState)
  {
    SecTrustResultType result = kSecTrustResultInvalid;
    CFErrorRef error = 0;
    BOOL v6 = SecTrustEvaluateWithError(a3, &error);
    uint64_t TrustResult = SecTrustGetTrustResult(a3, &result);
    if (!v6 && error)
    {
      NSLog(&cfstr_Sectrustevalua.isa, error);
      CFRelease(error);
    }
    if (TrustResult)
    {
      NSLog(&cfstr_Sectrustgettru.isa, TrustResult);
LABEL_7:
      self->_everReceivedUntrustedCertificate = 1;
      int64_t v8 = 3;
    }
    else
    {
      switch(result)
      {
        case kSecTrustResultProceed:
        case kSecTrustResultUnspecified:
          NSLog(&cfstr_GotSectrusteva.isa, result);
          int64_t v8 = 2;
          break;
        case kSecTrustResultDeny:
          NSLog(&cfstr_GotSectrusteva_1.isa, 3);
          goto LABEL_7;
        case kSecTrustResultRecoverableTrustFailure:
          NSLog(&cfstr_GotSectrusteva_0.isa, 5);
          goto LABEL_7;
        default:
          NSLog(&cfstr_DonTKnowHowToH.isa, result);
          goto LABEL_7;
      }
    }
    self->_currentRedirectURLType = v8;
    self->_currentRedirectURLTypeSet = 1;
  }
}

- (BOOL)_handleCertificateError:(__SecTrust *)a3 newhost:(id)a4
{
  return [MEMORY[0x263F86270] userAllowsCertificateTrust:a3 host:a4];
}

- (id)_specializedMessageForError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  double v5 = [v4 objectForKey:@"NSErrorFailingURLKey"];

  if (!v5)
  {
    id v10 = 0;
    goto LABEL_35;
  }
  BOOL v6 = objc_msgSend(v5, "_web_userVisibleString");
  id v7 = [v6 stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets];

  if (objc_msgSend(v3, "_web_errorIsInDomain:", *MEMORY[0x263F08570]))
  {
    uint64_t v8 = [v3 code];
    if (v8 > -1103)
    {
      switch(v8)
      {
        case -1018:
          BOOL v9 = "Data Roaming is turned off. You can enable Data Roaming in the Cellular Data section of Settings.";
          goto LABEL_33;
        case -1017:
        case -1016:
        case -1015:
        case -1013:
        case -1012:
          goto LABEL_18;
        case -1014:
        case -1008:
          BOOL v9 = "Hotspot login cannot open the page because it could not load any data.";
          goto LABEL_33;
        case -1011:
          BOOL v9 = "Hotspot login cannot open the page because the page is invalid.";
          goto LABEL_33;
        case -1010:
          BOOL v9 = "Hotspot login cannot open the page because the page does not exist.";
          goto LABEL_33;
        case -1009:
          goto LABEL_14;
        case -1007:
          BOOL v9 = "Hotspot login cannot open the page because too many redirects occurred.";
          goto LABEL_33;
        case -1006:
        case -1003:
          BOOL v9 = "Hotspot login cannot open the page because the server cannot be found.";
          goto LABEL_33;
        case -1005:
          BOOL v9 = "Hotspot login cannot open the page because the network connection was lost.";
          goto LABEL_33;
        case -1004:
          BOOL v9 = "Hotspot login cannot open the page because it could not connect to the server.";
          goto LABEL_33;
        case -1002:
          BOOL v15 = NSString;
          GetLocalizedString((uint64_t)"Hotspot login cannot open the page because it cannot redirect to locations startin"
          double v12 = "g with “%@:”.");
          double v13 = [v7 URLScheme];
          id v10 = objc_msgSend(v15, "stringWithFormat:", v12, v13);
          goto LABEL_40;
        case -1001:
          BOOL v9 = "Hotspot login could not open the page because the server stopped responding.";
          goto LABEL_33;
        case -1000:
          BOOL v9 = "Hotspot login cannot open the page because the address is invalid.";
          goto LABEL_33;
        default:
          if (v8 == -1102)
          {
            v17 = NSString;
            double v12 = GetLocalizedString((uint64_t)"You do not have permission to view “%@”.");
            double v13 = [MEMORY[0x263F08850] defaultManager];
            BOOL v14 = [v5 path];
            double v18 = [v13 displayNameAtPath:v14];
            id v10 = objc_msgSend(v17, "stringWithFormat:", v12, v18);
          }
          else
          {
            if (v8 != -1100) {
              goto LABEL_18;
            }
            double v11 = NSString;
            double v12 = GetLocalizedString((uint64_t)"No file exists at the address “%@”.");
            double v13 = [v5 path];
            BOOL v14 = [v13 stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets];
            id v10 = objc_msgSend(v11, "stringWithFormat:", v12, v14);
          }

LABEL_40:
          break;
      }
      goto LABEL_34;
    }
    if (v8 > -1201)
    {
      if (v8 == -1200)
      {
        BOOL v9 = "Hotspot login cannot open the page because it could not establish a secure connection to the server.";
        goto LABEL_33;
      }
      if (v8 == -1103)
      {
        BOOL v9 = "Hotspot login cannot open the page because it is too large.";
        goto LABEL_33;
      }
    }
    else
    {
      if (v8 == -2000)
      {
LABEL_14:
        BOOL v9 = "Hotspot login cannot open the page because it is not connected to the Internet.";
        goto LABEL_33;
      }
      if (v8 == -1205)
      {
        BOOL v9 = "The website did not accept the certificate.";
LABEL_33:
        id v10 = GetLocalizedString((uint64_t)v9);
        goto LABEL_34;
      }
    }
  }
LABEL_18:
  if (objc_msgSend(v3, "_web_errorIsInDomain:", *MEMORY[0x263F08438]) && objc_msgSend(v3, "code") == 54)
  {
    BOOL v9 = "Hotspot login cannot open the page because the network connection was reset. The server may be busy.";
    goto LABEL_33;
  }
  id v10 = 0;
LABEL_34:

LABEL_35:
  return v10;
}

- (id)_titleForError:(id)a3
{
  uint64_t v3 = [a3 code];
  switch(v3)
  {
    case -1205:
      id v4 = "Certificate Error";
      goto LABEL_7;
    case -1100:
      id v4 = "No File Exists";
      goto LABEL_7;
    case -1102:
      id v4 = "No Permission";
LABEL_7:
      double v5 = GetLocalizedString((uint64_t)v4);
      goto LABEL_9;
  }
  double v5 = 0;
LABEL_9:
  return v5;
}

- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4
{
  id v18 = a4;
  double v5 = [v18 dataSource];
  BOOL v6 = [v5 request];
  id v7 = [v6 URL];

  uint64_t v8 = [v7 host];
  BOOL v9 = [v7 absoluteString];
  id v10 = v9;
  if (v8 && v9)
  {
    if ([v9 rangeOfString:v8] != 0x7FFFFFFFFFFFFFFFLL) {
      [(WSWebSheetView *)self setCurrentURL:v7];
    }
    if ([v10 hasPrefix:@"https://"])
    {
      double v11 = [v18 dataSource];
      double v12 = [v11 response];

      [v12 _CFURLResponse];
      CFDictionaryRef SSLCertificateContext = (const __CFDictionary *)_CFURLResponseGetSSLCertificateContext();
      if (SSLCertificateContext && CFDictionaryGetValue(SSLCertificateContext, (const void *)*MEMORY[0x263EFC7F8]))
      {
        BOOL v14 = (void *)SecTrustCopyInfo();
        BOOL v15 = v14;
        if (v14)
        {
          double v16 = [v14 objectForKey:*MEMORY[0x263F17548]];
          if (v16)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([v16 BOOLValue])
              {
                v17 = [v15 objectForKey:*MEMORY[0x263F17540]];
                [(WSWebSheetView *)self setHasEVCert:v17 != 0];
              }
            }
          }
        }
      }
    }
  }
}

- (void)_showProfileDownloadAlert
{
  id v3 = objc_alloc(MEMORY[0x263F86268]);
  id v4 = GetLocalizedString((uint64_t)"Cannot Download Profile");
  double v5 = GetLocalizedString((uint64_t)"Hotspot login could not download this profile due to an unknown error.");
  id v6 = (id)[v3 initWithType:8 title:v4 bodyText:v5 defaultAction:1 otherAction:0];

  [(WSWebSheetView *)self addAlert:v6];
}

- (void)_showGenericDownloadAlert
{
  id v3 = objc_alloc(MEMORY[0x263F86268]);
  id v4 = GetLocalizedString((uint64_t)"Download Failed");
  double v5 = GetLocalizedString((uint64_t)"This file cannot be downloaded.");
  id v6 = (id)[v3 initWithType:9 title:v4 bodyText:v5 defaultAction:1 otherAction:0];

  [(WSWebSheetView *)self addAlert:v6];
}

- (void)handleProbeResult:(int64_t)a3
{
  if (a3 != 3)
  {
    if (!a3)
    {
      NSLog(&cfstr_CaptiveProbeWa.isa, a2);
      id v4 = [(WSWebSheetView *)self delegate];
      double v5 = v4;
      if (v4 && self->_postMessage)
      {
        loginURL = self->_loginURL;

        if (!loginURL)
        {
LABEL_8:
          [(WSWebSheetView *)self updateToDoneButton];
          [(WSWebSheetView *)self updateResultOptions];
          return;
        }
        double v5 = [(WSWebSheetView *)self delegate];
        [v5 scrapeCredentialsUsingPOSTMessage:self->_postMessage loginURL:self->_loginURL];
      }

      goto LABEL_8;
    }
    goto LABEL_12;
  }
  if (self->_lastResultWasTimeoutError)
  {
LABEL_12:
    NSLog(&cfstr_CaptiveProbeFa.isa, a2, a3);
    [(WSWebSheetView *)self dequeueRedirectTypeQueue];
    return;
  }
  NSLog(&cfstr_CaptiveProbeTi.isa, a2);
  self->_lastResultWasTimeoutError = 1;
  [(WSWebSheetView *)self pushBackToRedirectTypeQueue];
  [(WSWebSheetView *)self dispatchCaptiveProbe];
}

- (void)_showProfileInstallAlert
{
  id v3 = objc_alloc(MEMORY[0x263F86268]);
  id v4 = GetLocalizedString((uint64_t)"Cannot Install Profile");
  double v5 = GetLocalizedString((uint64_t)"Hotspot login could not install this profile due to an unknown error.");
  id v6 = (id)[v3 initWithType:7 title:v4 bodyText:v5 defaultAction:1 otherAction:0];

  [(WSWebSheetView *)self addAlert:v6];
}

- (void)downloadDidFinish:(id)a3
{
  id v4 = [(WSWebSheetDownloadManager *)self->_downloadManager fileDownloadPath];
  if (v4)
  {
    double v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4];
    if (v5)
    {
      id v6 = [MEMORY[0x263F53C50] sharedConnection];
      id v7 = [v4 lastPathComponent];
      id v11 = 0;
      id v8 = (id)[v6 queueFileDataForAcceptance:v5 originalFileName:v7 outError:&v11];
      id v9 = v11;

      [(WSWebSheetDownloadManager *)self->_downloadManager removeFromDisk];
      if (v9)
      {
        NSLog(&cfstr_FailedToInstal.isa, v9);
        [(WSWebSheetView *)self _showProfileInstallAlert];
      }
    }
    else
    {
      NSLog(&cfstr_FailedToReadDa.isa);
      [(WSWebSheetView *)self _showProfileDownloadAlert];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__WSWebSheetView_downloadDidFinish___block_invoke;
    block[3] = &unk_26504AE20;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    NSLog(&cfstr_FailedToFindDo.isa);
  }
}

uint64_t __36__WSWebSheetView_downloadDidFinish___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWebSheetWithCaptiveWebSheetResult:0];
}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  id v7 = a3;
  id v8 = [a5 request];
  id v9 = (id)[v7 loadRequest:v8];

  return 0;
}

- (id)_presentingViewControllerForWebView:(id)a3
{
  return self->_webSheetViewController;
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  self->_currentRedirectURLTypeSet = 0;
  NSLog(&cfstr_WebSheetLoggin.isa, v6);
  [(WSWebSheetView *)self displayLoadingSpinner:0];
  uint64_t v7 = [v6 code];
  if ((!objc_msgSend(v6, "_web_errorIsInDomain:", *MEMORY[0x263F86258]) || v7 != 102 && v7 != 204)
    && (!objc_msgSend(v6, "_web_errorIsInDomain:", *MEMORY[0x263F08570]) || v7 != -1012 && v7 != -999))
  {
    uint64_t v8 = [v6 userInfo];
    id v9 = (void *)v8;
    if (v8) {
      NSLog(&cfstr_WebsheetDidFai.isa, v8);
    }
    id v10 = [(WSWebSheetView *)self _specializedMessageForError:v6];
    if (!v10)
    {
      id v10 = GetLocalizedString((uint64_t)"An error occurred. The page could not be opened.");
    }
    id v11 = [(WSWebSheetView *)self _titleForError:v6];
    if (!v11)
    {
      id v11 = GetLocalizedString((uint64_t)"Error Opening Page");
    }
    double v12 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v11 message:v10 preferredStyle:1];
    double v13 = (void *)MEMORY[0x263F1C3F0];
    BOOL v14 = GetLocalizedString((uint64_t)"OK");
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __54__WSWebSheetView_webView_didFailNavigation_withError___block_invoke;
    v17[3] = &unk_26504AE70;
    v17[4] = self;
    BOOL v15 = [v13 actionWithTitle:v14 style:0 handler:v17];

    [v12 addAction:v15];
    double v16 = [(WSWebSheetView *)self webSheetViewController];
    [v16 presentViewController:v12 animated:1 completion:&__block_literal_global_196];
  }
}

void __54__WSWebSheetView_webView_didFailNavigation_withError___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__WSWebSheetView_webView_didFailNavigation_withError___block_invoke_2;
  block[3] = &unk_26504AE20;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __54__WSWebSheetView_webView_didFailNavigation_withError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWebSheetWithCaptiveWebSheetResult:1];
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  self->_currentRedirectURLTypeSet = 0;
  NSLog(&cfstr_WebSheetLoggin_0.isa, v6);
  uint64_t v7 = [v6 code];
  if ((!objc_msgSend(v6, "_web_errorIsInDomain:", *MEMORY[0x263F86258]) || v7 != 102 && v7 != 204)
    && (!objc_msgSend(v6, "_web_errorIsInDomain:", *MEMORY[0x263F08570]) || v7 != -1012 && v7 != -999))
  {
    uint64_t v8 = [v6 userInfo];
    id v9 = (void *)v8;
    if (v8) {
      NSLog(&cfstr_WebsheetDidFai.isa, v8);
    }
    id v10 = [(WSWebSheetView *)self _specializedMessageForError:v6];
    if (!v10)
    {
      id v10 = GetLocalizedString((uint64_t)"An error occurred. The page could not be opened.");
    }
    id v11 = [(WSWebSheetView *)self _titleForError:v6];
    if (!v11)
    {
      id v11 = GetLocalizedString((uint64_t)"Error Opening Page");
    }
    double v12 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v11 message:v10 preferredStyle:1];
    double v13 = (void *)MEMORY[0x263F1C3F0];
    BOOL v14 = GetLocalizedString((uint64_t)"OK");
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __65__WSWebSheetView_webView_didFailProvisionalNavigation_withError___block_invoke;
    v17[3] = &unk_26504AE70;
    v17[4] = self;
    BOOL v15 = [v13 actionWithTitle:v14 style:0 handler:v17];

    [v12 addAction:v15];
    double v16 = [(WSWebSheetView *)self webSheetViewController];
    [v16 presentViewController:v12 animated:1 completion:&__block_literal_global_201];
  }
}

void __65__WSWebSheetView_webView_didFailProvisionalNavigation_withError___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__WSWebSheetView_webView_didFailProvisionalNavigation_withError___block_invoke_2;
  block[3] = &unk_26504AE20;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __65__WSWebSheetView_webView_didFailProvisionalNavigation_withError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWebSheetWithCaptiveWebSheetResult:1];
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  id v12 = a3;
  double v5 = [v12 _committedURL];
  [(WSWebSheetView *)self setCurrentURL:v5];

  uint64_t v6 = [v12 hasOnlySecureContent];
  id v7 = v12;
  if (v6)
  {
    uint64_t v6 = [v12 serverTrust];
    id v7 = v12;
    if (v6)
    {
      [v12 serverTrust];
      uint64_t v8 = (void *)SecTrustCopyInfo();
      id v9 = v8;
      if (v8)
      {
        id v10 = [v8 objectForKey:*MEMORY[0x263F17548]];
        if (v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v10 BOOLValue])
            {
              id v11 = [v9 objectForKey:*MEMORY[0x263F17540]];
              [(WSWebSheetView *)self setHasEVCert:v11 != 0];
            }
          }
        }
      }
      id v7 = v12;
    }
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (BOOL)isUserAprroved:(id)a3
{
  CFOptionFlags v12 = 0;
  id v3 = a3;
  id v4 = GetLocalizedString((uint64_t)"Open in “%@”?");
  objc_msgSend(NSString, "stringWithFormat:", v4, v3);
  double v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFStringRef LocalizedString = (const __CFString *)GetLocalizedString((uint64_t)"SCHEME_APPROVAL_OPEN_BUTTON");
  CFStringRef v7 = (const __CFString *)GetLocalizedString((uint64_t)"SCHEME_APPROVAL_DO_NOT_OPEN_BUTTON");
  SInt32 v8 = CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v5, 0, LocalizedString, v7, 0, &v12);
  BOOL v10 = (v12 & 3) == 0 && v8 == 0;

  return v10;
}

- (id)appNametoOpenURL:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_LookingForAnAp.isa, v4);
  double v5 = [v4 scheme];
  if ([v5 isEqual:@"http"])
  {
  }
  else
  {
    uint64_t v6 = [v4 scheme];
    int v7 = [v6 isEqual:@"https"];

    if (!v7)
    {
      BOOL v15 = [MEMORY[0x263F01880] defaultWorkspace];
      double v16 = [v15 applicationsAvailableForOpeningURL:v4];
      BOOL v10 = [v16 firstObject];

      if (v10)
      {
        v17 = (void *)MEMORY[0x263F01868];
        id v18 = [v10 applicationIdentifier];
        double v19 = [v17 applicationProxyForIdentifier:v18];
        BOOL v14 = [v19 localizedNameForContext:0];

        NSLog(&cfstr_AppCanOpenTheU.isa, v14);
      }
      else
      {
        NSLog(&cfstr_FailedToFindAn.isa, self);
        BOOL v14 = 0;
      }
      goto LABEL_16;
    }
  }
  id v21 = 0;
  SInt32 v8 = (void *)[objc_alloc(MEMORY[0x263F01898]) initWithURL:v4 error:&v21];
  id v9 = v21;
  BOOL v10 = v9;
  if (v8)
  {
    id v11 = [v8 bundleRecord];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
      if ([v12 isWebBrowser])
      {
        double v13 = [v12 localizedName];
        NSLog(&cfstr_AppIsAWebBrows.isa, v13);

        BOOL v14 = [v12 localizedName];
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    NSLog(&cfstr_FailedToFindCl.isa, v9);
    BOOL v14 = 0;
  }

LABEL_16:
  return v14;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void))a5;
  id v11 = [v9 request];
  unint64_t v12 = [v9 navigationType];
  double v13 = [v11 URL];
  BOOL v14 = v13;
  if (v12 <= 1)
  {
    if ([v13 hasTelephonyScheme])
    {
      NSLog(&cfstr_FoundTelephony.isa);
      BOOL v15 = [MEMORY[0x263F01880] defaultWorkspace];
      double v16 = NSURL;
      v17 = [v14 phoneNumber];
      id v18 = [v16 telephonyURLWithDestinationID:v17 promptUser:1];
      [v15 openURL:v18 withOptions:0];

LABEL_4:
LABEL_15:
      v10[2](v10, 0);
      goto LABEL_16;
    }
    double v19 = [v14 scheme];
    int v20 = [v19 isEqualToString:@"mailto"];

    if (v20)
    {
      NSLog(&cfstr_FoundMailtoSch.isa);
      uint64_t v21 = [v9 targetFrame];
      if (v21)
      {
        double v22 = (void *)v21;
        double v23 = [v9 targetFrame];
        int v24 = [v23 isMainFrame];

        if (!v24) {
          goto LABEL_15;
        }
      }
      if (![(id)*MEMORY[0x263F1D020] canOpenURL:v14]
        || ![(WSWebSheetView *)self isUserAprroved:@"Mail"])
      {
        goto LABEL_15;
      }
      BOOL v15 = [MEMORY[0x263F01880] defaultWorkspace];
      [v15 openURL:v14 withOptions:0];
      goto LABEL_4;
    }
  }
  if (self->_inDoneState && !self->_enableTVMode)
  {
    NSLog(&cfstr_AuthenticatedS.isa, v14);
    uint64_t v27 = [(WSWebSheetView *)self appNametoOpenURL:v14];
    if (v12)
    {
      v10[2](v10, 1);
    }
    else
    {
      NSLog(&cfstr_ThisIsANavigat.isa);
      if (v27)
      {
        if (![(WSWebSheetView *)self isUserAprroved:v27])
        {
          NSLog(&cfstr_AuthenticatedS_0.isa);
          v10[2](v10, 0);
          goto LABEL_19;
        }
        v28 = [MEMORY[0x263F01880] defaultWorkspace];
        id v51 = 0;
        int v29 = [v28 openURL:v14 withOptions:0 error:&v51];
        id v30 = v51;

        if (v29)
        {
          NSLog(&cfstr_AuthenticatedS_1.isa);
          v10[2](v10, 0);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __74__WSWebSheetView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
          block[3] = &unk_26504AE20;
          block[4] = self;
          dispatch_async(MEMORY[0x263EF83A0], block);

          goto LABEL_19;
        }
        NSLog(&cfstr_AuthenticatedS_2.isa, v30);
      }
      else
      {
        id v30 = 0;
      }
      v31 = (void *)MEMORY[0x263F86250];
      CGRect v32 = [v9 request];
      LODWORD(v31) = [v31 _canHandleRequest:v32];

      if (!v31)
      {

        goto LABEL_14;
      }
      id v48 = v30;
      v33 = [MEMORY[0x263F089D8] stringWithString:@"com-apple-mobilesafari-tab:"];
      v34 = [v11 URL];
      v35 = escapedStringFromURL(v34);
      [v33 appendString:v35];

      v36 = [v8 URL];

      if (v36)
      {
        [v33 appendString:@"?back="];
        v37 = [v8 URL];
        v38 = escapedStringFromURL(v37);
        [v33 appendString:v38];
      }
      v39 = [v14 host];
      int v40 = [v39 isEqualToString:@"itunes.apple.com"];
      v41 = @"Safari";
      if (v40) {
        v41 = @"iTunes Store";
      }
      id v42 = v41;

      if ([(WSWebSheetView *)self isUserAprroved:v42])
      {
        v47 = v42;
        v43 = [MEMORY[0x263F01880] defaultWorkspace];
        uint64_t v44 = [NSURL URLWithString:v33];
        char v45 = [v43 openSensitiveURL:v44 withOptions:0];

        if ((v45 & 1) == 0) {
          NSLog(&cfstr_AuthenticatedS_3.isa, v33);
        }
        v10[2](v10, 0);
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __74__WSWebSheetView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2;
        v49[3] = &unk_26504AE20;
        v49[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], v49);
        id v42 = v47;
        v46 = v48;
      }
      else
      {
        NSLog(&cfstr_AuthenticatedS_0.isa);
        v10[2](v10, 0);
        v46 = v48;
      }

      uint64_t v27 = v42;
    }
LABEL_19:

    goto LABEL_16;
  }
  NSLog(&cfstr_PreAuthenticat.isa, v14);
  double v25 = (void *)MEMORY[0x263F86250];
  double v26 = [v9 request];
  LOBYTE(v25) = [v25 _canHandleRequest:v26];

  if ((v25 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_14:
  v10[2](v10, 3);
LABEL_16:
}

uint64_t __74__WSWebSheetView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWebSheetWithCaptiveWebSheetResult:0];
}

uint64_t __74__WSWebSheetView_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWebSheetWithCaptiveWebSheetResult:0];
}

- (BOOL)isConfigurationProfileMIMEType:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", 0);
  double v5 = [v4 acceptedMIMETypes];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (![v3 caseInsensitiveCompare:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  BOOL v14 = (void (**)(void))a5;
  id v7 = a4;
  NSLog(&cfstr_Decidepolicyfo.isa);
  id v8 = [v7 response];

  id v9 = [v8 MIMEType];
  if ([(WSWebSheetView *)self isConfigurationProfileMIMEType:v9])
  {
    long long v10 = [v8 suggestedFilename];
    long long v11 = [v10 lastPathComponent];
    long long v12 = [v11 pathExtension];
    long long v13 = [v12 lowercaseString];
    [v13 isEqualToString:@"mobileconfig"];

    v14[2]();
  }
  else
  {
    [(WSWebSheetView *)self dispatchCaptiveProbe];
    ((void (*)(void (**)(void), uint64_t))v14[2])(v14, 1);
  }
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = (void (**)(id, uint64_t, void))a5;
  long long v11 = [v9 protectionSpace];
  long long v12 = [v11 authenticationMethod];
  if (![v12 isEqualToString:*MEMORY[0x263EFC5A0]]) {
    goto LABEL_6;
  }
  long long v13 = [v9 protectionSpace];
  if (![v13 serverTrust])
  {

LABEL_6:
    goto LABEL_7;
  }
  double v25 = self;
  BOOL v14 = [v9 protectionSpace];
  uint64_t v15 = [v14 host];
  [v8 URL];
  v17 = id v16 = v8;
  id v18 = [v17 host];
  int v26 = [v15 isEqualToString:v18];

  id v8 = v16;
  if (!v26)
  {
LABEL_7:
    v10[2](v10, 1, 0);
    goto LABEL_8;
  }
  double v19 = [v9 protectionSpace];
  uint64_t v20 = [v19 serverTrust];

  uint64_t v21 = [v9 protectionSpace];
  double v22 = [v21 host];

  [(WSWebSheetView *)v25 _precheckTrustForServerCertificate:v20 host:v22];
  double v23 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__WSWebSheetView_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke;
  block[3] = &unk_26504AEE0;
  uint64_t v30 = v20;
  block[4] = v25;
  id v28 = v22;
  int v29 = v10;
  id v24 = v22;
  dispatch_async(v23, block);

LABEL_8:
}

void __78__WSWebSheetView_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _handleCertificateError:*(void *)(a1 + 56) newhost:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__WSWebSheetView_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2;
  v5[3] = &unk_26504AEB8;
  char v8 = v2;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = v3;
  uint64_t v7 = v4;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __78__WSWebSheetView_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [MEMORY[0x263EFC610] credentialForTrust:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v4);
  }
  else
  {
    (*(void (**)(void, uint64_t, void))(v2 + 16))(*(void *)(a1 + 40), 2, 0);
    id v3 = *(void **)(a1 + 32);
    [v3 dismissWebSheetWithCaptiveWebSheetResult:1];
  }
}

- (void)updateRedirectURLTypeSetting
{
  if (!self->_inDoneState)
  {
    if (self->_firstNavigation
      && ([(WKWebView *)self->_webView URL],
          id v3 = objc_claimAutoreleasedReturnValue(),
          int v4 = [v3 isEqual:self->_probeURL],
          v3,
          v4))
    {
      NSLog(&cfstr_FirstNavigatio.isa);
      self->_firstNavigation = 0;
      self->_int64_t currentRedirectURLType = 1;
    }
    else
    {
      navigationURLAtStart = self->_navigationURLAtStart;
      if (!navigationURLAtStart) {
        return;
      }
      id v6 = [(NSURL *)navigationURLAtStart scheme];
      uint64_t v7 = v6;
      if (v6 && ![v6 caseInsensitiveCompare:@"http"])
      {
        int64_t v9 = 3;
        if (!self->_everReceivedUntrustedCertificate) {
          int64_t v9 = 1;
        }
        self->_int64_t currentRedirectURLType = v9;
      }
      else
      {
        if (self->_currentRedirectURLTypeSet) {
          int64_t currentRedirectURLType = self->_currentRedirectURLType;
        }
        else {
          int64_t currentRedirectURLType = 2;
        }
        self->_int64_t currentRedirectURLType = currentRedirectURLType;
        if (self->_everReceivedUntrustedCertificate) {
          int64_t currentRedirectURLType = 3;
        }
        self->_int64_t currentRedirectURLType = currentRedirectURLType;
      }
    }
    self->_currentRedirectURLTypeSet = 1;
    long long v10 = self->_navigationURLAtStart;
    if (v10)
    {
      self->_navigationURLAtStart = 0;
    }
  }
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  objc_msgSend((id)*MEMORY[0x263F1D020], "_beginShowingNetworkActivityIndicator", a3, a4);
  if (!self->_inDoneState)
  {
    self->_currentRedirectURLTypeSet = 0;
    navigationURLAtStart = self->_navigationURLAtStart;
    if (navigationURLAtStart)
    {
      self->_navigationURLAtStart = 0;
    }
    id v6 = [(WKWebView *)self->_webView URL];
    uint64_t v7 = self->_navigationURLAtStart;
    self->_navigationURLAtStart = v6;
    MEMORY[0x270F9A758](v6, v7);
  }
}

- (void)dispatchCaptiveProbe
{
  if (!self->_inDoneState)
  {
    if (self->_currentRedirectURLTypeSet)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke;
      block[3] = &unk_26504AE20;
      block[4] = self;
      dispatch_async(queue, block);
    }
    int v4 = [(WSWebSheetView *)self delegate];

    if (v4)
    {
      double v5 = [(WSWebSheetView *)self delegate];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke_2;
      v6[3] = &unk_26504AF08;
      v6[4] = self;
      [v5 handleWebNavigationWithCompletionHandler:v6];
    }
  }
}

void __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 512);
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(v1 + 528)];
  [v2 addObject:v3];
}

void __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke_3;
  v2[3] = &unk_26504AE48;
  v2[4] = *(void *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __38__WSWebSheetView_dispatchCaptiveProbe__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleProbeResult:*(void *)(a1 + 40)];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  NSLog(&cfstr_Didfinishnavig.isa, a2, a3, a4);
  [(id)*MEMORY[0x263F1D020] _endShowingNetworkActivityIndicator];
  [(WSWebSheetView *)self _stopCaptiveProbeDispatchTimer];
  [(WSWebSheetView *)self _updateBackForwardButtons];
  [(WSWebSheetView *)self updateRedirectURLTypeSetting];
  [(WSWebSheetView *)self dispatchCaptiveProbe];
}

- (void)_webView:(id)a3 didStartInputSession:(id)a4
{
}

- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = (void (**)(void))a6;
  long long v13 = [v10 objectForKeyedSubscript:@"username"];
  if (!v13)
  {
    long long v13 = [v10 objectForKeyedSubscript:@"user"];
  }
  uint64_t v14 = [v10 objectForKeyedSubscript:@"password"];
  uint64_t v15 = (void *)v14;
  if (v13 && v14)
  {
    NSLog(&cfstr_FoundValidCred.isa);
    [NSString stringWithFormat:@"username=%@&password=%@", v13, v15];
    id v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    postMessage = self->_postMessage;
    self->_postMessage = v16;

    id v18 = [v21 _committedURL];
    double v19 = [v18 relativeString];
    loginURL = self->_loginURL;
    self->_loginURL = v19;

    v12[2](v12);
  }
  else
  {
    [(_SFFormAutoFillController *)self->_autoFillController willSubmitFormValues:v10 userObject:v11 submissionHandler:v12];
  }
}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
}

- (void)_webView:(id)a3 accessoryViewCustomButtonTappedInFormInputSession:(id)a4
{
}

- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5
{
}

- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3
{
  return 0;
}

- (BOOL)formAutoFillControllerShouldDisableStreamlinedLogin:(id)a3
{
  return 1;
}

- (id)formAutoFillControllerURLForFormAutoFill:(id)a3
{
  return [(WKWebView *)self->_webView URL];
}

- (void)_captiveProbeDispatchTimerDidFire:(id)a3
{
  [(WSWebSheetView *)self dispatchCaptiveProbe];
  [(WSWebSheetView *)self _stopCaptiveProbeDispatchTimer];
}

- (void)_stopCaptiveProbeDispatchTimer
{
  [(NSTimer *)self->_captiveProbeDispatchTimer invalidate];
  captiveProbeDispatchTimer = self->_captiveProbeDispatchTimer;
  self->_captiveProbeDispatchTimer = 0;
}

- (void)_startCaptiveProbeDispatchTimer
{
  [(WSWebSheetView *)self _stopCaptiveProbeDispatchTimer];
  id v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__captiveProbeDispatchTimerDidFire_ selector:0 userInfo:0 repeats:10.0];
  captiveProbeDispatchTimer = self->_captiveProbeDispatchTimer;
  self->_captiveProbeDispatchTimer = v3;
  MEMORY[0x270F9A758](v3, captiveProbeDispatchTimer);
}

- (NSUUID)tabIDForAutoFill
{
  return self->tabIDForAutoFill;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (WSWebSheetViewController)webSheetViewController
{
  return self->_webSheetViewController;
}

- (void)setWebSheetViewController:(id)a3
{
}

- (NSURL)currentURL
{
  return self->_currentURL;
}

- (NSURL)probeURL
{
  return self->_probeURL;
}

- (void)setShouldShowStayConnectedOptions:(BOOL)a3
{
  self->_shouldShowStayConnectedOptions = a3;
}

- (BOOL)enableTVMode
{
  return self->_enableTVMode;
}

- (void)setEnableTVMode:(BOOL)a3
{
  self->_enableTVMode = a3;
}

- (NSDictionary)proxyConfiguration
{
  return self->_proxyConfiguration;
}

- (void)setProxyConfiguration:(id)a3
{
}

- (NSMutableDictionary)resultOptions
{
  return self->_resultOptions;
}

- (void)setResultOptions:(id)a3
{
}

- (WSWebSheetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WSWebSheetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasEVCert
{
  return self->_hasEVCert;
}

- (BOOL)isCertTrustDone
{
  return self->_isCertTrustDone;
}

- (void)setIsCertTrustDone:(BOOL)a3
{
  self->_isCertTrustDone = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resultOptions, 0);
  objc_storeStrong((id *)&self->_proxyConfiguration, 0);
  objc_storeStrong((id *)&self->_probeURL, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_webSheetViewController, 0);
  objc_storeStrong((id *)&self->tabIDForAutoFill, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_postMessage, 0);
  objc_storeStrong((id *)&self->_loginURL, 0);
  objc_storeStrong((id *)&self->_captiveProbeDispatchTimer, 0);
  objc_storeStrong((id *)&self->_stayConnectedAlertController, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_navigationURLAtStart, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_redirectTypeQueue, 0);
  objc_storeStrong((id *)&self->_sheetController, 0);
  objc_storeStrong((id *)&self->_alerts, 0);
  objc_storeStrong((id *)&self->_ssidLabel, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_lockIconView, 0);
  objc_storeStrong((id *)&self->_addressView, 0);
  objc_storeStrong((id *)&self->_forwardButtonItem, 0);
  objc_storeStrong((id *)&self->_backButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelDoneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_autoFillController, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end