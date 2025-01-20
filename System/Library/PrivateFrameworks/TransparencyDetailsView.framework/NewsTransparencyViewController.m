@interface NewsTransparencyViewController
- (BOOL)isClientTodayWidget;
- (BOOL)isDeviceLocked;
- (BOOL)isiPad;
- (BOOL)renderingStatusForLocationPermission;
- (BOOL)renderingStatusForPAPermission;
- (NSDictionary)transparencyDetailsDictionary;
- (NSString)transparencyDetailsUnavailableMessage;
- (NSString)transparencyRendererPayload;
- (NSString)transparencyRendererURL;
- (NewsTransparencyViewController)initWithNewsTransparencyDetailsDictionary:(id)a3;
- (NewsTransparencyViewControllerDelegate)delegate;
- (UILabel)errorLabel;
- (WKWebView)myNewsPrivacyWebView;
- (id)notificationObserver;
- (void)_closeViewController:(id)a3;
- (void)_commonInit;
- (void)_hideErrorMessage;
- (void)_openDebugView:(id)a3;
- (void)_showErrorMessage:(id)a3;
- (void)debugDetailsViewControllerReady:(id)a3;
- (void)displayDebugButtonWaitingIndicator;
- (void)errorDelegate;
- (void)loadWebView;
- (void)presentViewDelegate;
- (void)requestUserPassCodeUnlockUIWithBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorLabel:(id)a3;
- (void)setIsClientTodayWidget:(BOOL)a3;
- (void)setIsiPad:(BOOL)a3;
- (void)setMyNewsPrivacyWebView:(id)a3;
- (void)setNotificationObserver:(id)a3;
- (void)setTransparencyDetailsDictionary:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation NewsTransparencyViewController

- (NewsTransparencyViewController)initWithNewsTransparencyDetailsDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NewsTransparencyViewController;
  v5 = [(NewsTransparencyViewController *)&v14 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = NSString;
    v7 = objc_msgSend(v4, "AD_jsonString");
    v8 = [v6 stringWithFormat:@"AdLib provided TransparencyDetailsView the following transparencyDetailsDictionary: %@.", v7];
    _ADLog();

    [(NewsTransparencyViewController *)v5 setTransparencyDetailsDictionary:v4];
    [(NewsTransparencyViewController *)v5 setIsiPad:MGGetBoolAnswer()];
    v9 = [MEMORY[0x263F086E0] mainBundle];
    v10 = [v9 bundleIdentifier];

    -[NewsTransparencyViewController setIsClientTodayWidget:](v5, "setIsClientTodayWidget:", [v10 isEqualToString:*MEMORY[0x263F24170]]);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke;
    block[3] = &unk_2646CDC18;
    v13 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v5;
}

void __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke_2;
  v5[3] = &unk_2646CDD30;
  id v6 = *(id *)(a1 + 32);
  v2 = (void *)MEMORY[0x223CBA0E0](v5);
  int v3 = [*(id *)(a1 + 32) isDeviceLocked];
  id v4 = *(void **)(a1 + 32);
  if (v3) {
    [v4 requestUserPassCodeUnlockUIWithBlock:v2];
  }
  else {
    [v4 _commonInit];
  }
}

void __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke_2(uint64_t a1, int a2)
{
  int v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 _commonInit];
  }
  else
  {
    [v3 errorDelegate];
    id v4 = [*(id *)(a1 + 32) presentingViewController];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke_3;
    v5[3] = &unk_2646CDC18;
    id v6 = *(id *)(a1 + 32);
    [v4 dismissViewControllerAnimated:1 completion:v5];
  }
}

void __76__NewsTransparencyViewController_initWithNewsTransparencyDetailsDictionary___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 newsTransparencyViewControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)viewDidLoad
{
  v15[1] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)NewsTransparencyViewController;
  [(NewsTransparencyViewController *)&v13 viewDidLoad];
  char v3 = [(NewsTransparencyViewController *)self navigationController];
  if (v3)
  {
    id v4 = [MEMORY[0x263F1CB00] currentTraitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    if (v5 == 2)
    {
      id v6 = objc_alloc_init(MEMORY[0x263F1C7E8]);
      [v6 configureWithOpaqueBackground];
      v7 = [MEMORY[0x263F1C550] systemBackgroundColor];
      [v6 setBackgroundColor:v7];

      uint64_t v14 = *MEMORY[0x263F1C240];
      v8 = [MEMORY[0x263F1C550] whiteColor];
      v15[0] = v8;
      v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      [v6 setTitleTextAttributes:v9];

      v10 = [v3 navigationBar];
      [v10 setStandardAppearance:v6];

      v11 = [v3 navigationBar];
      [v11 setScrollEdgeAppearance:v6];

      v12 = [v3 navigationBar];
      [v12 setTranslucent:0];
    }
  }
}

- (BOOL)isDeviceLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

- (void)requestUserPassCodeUnlockUIWithBlock:(id)a3
{
}

- (void)_commonInit
{
  transparencyDetailsDictionary = self->_transparencyDetailsDictionary;
  if (transparencyDetailsDictionary)
  {
    id v4 = [(NSDictionary *)transparencyDetailsDictionary objectForKey:@"transparencyDetailsUnavailableMessage"];
    transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage;
    self->_transparencyDetailsUnavailableMessage = v4;

    id v6 = [(NSDictionary *)self->_transparencyDetailsDictionary objectForKey:@"transparencyRendererPayload"];
    transparencyRendererPayload = self->_transparencyRendererPayload;
    self->_transparencyRendererPayload = v6;

    v8 = [(NSDictionary *)self->_transparencyDetailsDictionary objectForKey:@"transparencyRendererURL"];
    transparencyRendererURL = self->_transparencyRendererURL;
    self->_transparencyRendererURL = v8;

    v10 = [(NSDictionary *)self->_transparencyDetailsDictionary objectForKey:@"renderingStateForLocation"];
    self->_renderingStatusForLocationPermission = [v10 BOOLValue];

    v11 = [(NSDictionary *)self->_transparencyDetailsDictionary objectForKey:@"renderingStateForPA"];
    self->_renderingStatusForPAPermission = [v11 BOOLValue];
  }
  else
  {
    [(NewsTransparencyViewController *)self errorDelegate];
  }
  v12 = [NSString stringWithFormat:@"Connection to NewsTransparencyViewController established with TransparencyDetailsView framework."];
  _ADLog();

  if ([(NewsTransparencyViewController *)self isiPad]) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  [(NewsTransparencyViewController *)self setModalPresentationStyle:v13];
  [(NewsTransparencyViewController *)self setModalTransitionStyle:0];
  uint64_t v14 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v15 = [(NewsTransparencyViewController *)self view];
  [v15 setBackgroundColor:v14];

  [(NewsTransparencyViewController *)self setEdgesForExtendedLayout:0];
  id v51 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v16 = objc_alloc(MEMORY[0x263F1C468]);
  v17 = [v51 localizedStringForKey:@"Done" value:&stru_26D73AD20 table:0];
  v18 = (void *)[v16 initWithTitle:v17 style:2 target:self action:sel__closeViewController_];

  v19 = [MEMORY[0x263F1C550] systemBlueColor];
  [v18 setTintColor:v19];

  v20 = [(NewsTransparencyViewController *)self navigationItem];
  [v20 setRightBarButtonItem:v18];

  v21 = [v51 localizedStringForKey:@"About This Ad" value:&stru_26D73AD20 table:0];
  [(NewsTransparencyViewController *)self setTitle:v21];

  id v22 = objc_alloc_init(MEMORY[0x263F1FA38]);
  v23 = NSString;
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[NewsTransparencyViewController renderingStatusForLocationPermission](self, "renderingStatusForLocationPermission"));
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[NewsTransparencyViewController renderingStatusForPAPermission](self, "renderingStatusForPAPermission"));
  v26 = [v23 stringWithFormat:@"        window.transparency = {            isLocationPermissionGranted: () => { return %@ }, isPAEnabled: () => { return %@ }         }    ", v24, v25];

  v27 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v26 injectionTime:0 forMainFrameOnly:1];
  [v22 addUserScript:v27];
  id v28 = objc_alloc_init(MEMORY[0x263F1FA60]);
  [v28 setUserContentController:v22];
  id v29 = objc_alloc(MEMORY[0x263F1FA58]);
  v30 = objc_msgSend(v29, "initWithFrame:configuration:", v28, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(NewsTransparencyViewController *)self setMyNewsPrivacyWebView:v30];

  v31 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

  v32 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  [v32 setAllowsLinkPreview:0];

  v33 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  [v33 setNavigationDelegate:self];

  v34 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  [v34 setOpaque:0];

  v35 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  v36 = [v35 scrollView];
  [v36 setContentInsetAdjustmentBehavior:2];

  if ([(NewsTransparencyViewController *)self isClientTodayWidget])
  {
    v37 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
    v38 = [v37 scrollView];
    [v38 setScrollEnabled:0];

    v39 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
    v40 = [v39 scrollView];
    [v40 setBounces:0];
  }
  v41 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  [v41 setAutoresizesSubviews:1];

  v42 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  [v42 setAutoresizingMask:18];

  v43 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  activityIndicator = self->activityIndicator;
  self->activityIndicator = v43;

  v45 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  [v45 frame];
  double v47 = v46 * 0.5;
  v48 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  [v48 frame];
  -[UIActivityIndicatorView setCenter:](self->activityIndicator, "setCenter:", v47, v49 * 0.5);

  [(UIActivityIndicatorView *)self->activityIndicator setAutoresizingMask:45];
  [(UIActivityIndicatorView *)self->activityIndicator startAnimating];
  v50 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  [v50 addSubview:self->activityIndicator];

  [(NewsTransparencyViewController *)self presentViewDelegate];
  [(NewsTransparencyViewController *)self loadWebView];
}

- (void)loadWebView
{
  v61[4] = *MEMORY[0x263EF8340];
  char v3 = [(NewsTransparencyViewController *)self transparencyRendererURL];

  if (v3)
  {
    id v4 = [MEMORY[0x263F241C0] sharedInstance];
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    id v6 = (void *)MEMORY[0x263F08BD0];
    v7 = v4;
    v8 = [v4 localeIdentifier];
    v9 = [v6 queryItemWithName:@"locale" value:v8];
    [v5 addObject:v9];

    v10 = (void *)MEMORY[0x263F08BD0];
    v11 = [v7 osIdentifier];
    v12 = [v10 queryItemWithName:@"os" value:v11];
    [v5 addObject:v12];

    uint64_t v13 = (void *)MEMORY[0x263F08BD0];
    uint64_t v14 = [v7 bundleIdentifier];
    v15 = [v13 queryItemWithName:@"app_id" value:v14];
    [v5 addObject:v15];

    id v16 = (void *)MEMORY[0x263F08BD0];
    v60 = v7;
    v17 = [v7 shortBuildVersion];
    v18 = [v16 queryItemWithName:@"build" value:v17];
    [v5 addObject:v18];

    v19 = (void *)MEMORY[0x263F08BD0];
    v20 = [v7 shortModelType];
    v21 = [v19 queryItemWithName:@"model" value:v20];
    v59 = v5;
    [v5 addObject:v21];

    id v22 = (void *)MEMORY[0x263F08BA0];
    v23 = [(NewsTransparencyViewController *)self transparencyRendererURL];
    v58 = [v22 componentsWithString:v23];

    [v58 setQueryItems:v5];
    v57 = [v58 URL];
    v24 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v57];
    [v24 setHTTPMethod:@"POST"];
    v25 = [(NewsTransparencyViewController *)self transparencyRendererPayload];
    v26 = [v25 dataUsingEncoding:4];
    v56 = v24;
    [v24 setHTTPBody:v26];

    v27 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
    id v28 = (id)[v27 loadRequest:v24];

    id v29 = [(NewsTransparencyViewController *)self navigationController];
    v30 = [v29 navigationBar];
    [v30 setTranslucent:0];

    v31 = [(NewsTransparencyViewController *)self view];
    v32 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
    [v31 addSubview:v32];

    double v46 = (void *)MEMORY[0x263F08938];
    v55 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
    v53 = [v55 topAnchor];
    v54 = [(NewsTransparencyViewController *)self view];
    v52 = [v54 topAnchor];
    id v51 = [v53 constraintEqualToAnchor:v52];
    v61[0] = v51;
    v50 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
    v48 = [v50 bottomAnchor];
    double v49 = [(NewsTransparencyViewController *)self view];
    double v47 = [v49 bottomAnchor];
    v45 = [v48 constraintEqualToAnchor:v47];
    v61[1] = v45;
    v44 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
    v33 = [v44 rightAnchor];
    v34 = [(NewsTransparencyViewController *)self view];
    v35 = [v34 rightAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];
    v61[2] = v36;
    v37 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
    v38 = [v37 leftAnchor];
    v39 = [(NewsTransparencyViewController *)self view];
    v40 = [v39 leftAnchor];
    v41 = [v38 constraintEqualToAnchor:v40];
    v61[3] = v41;
    v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:4];
    [v46 activateConstraints:v42];
  }
  else
  {
    v43 = [NSString stringWithFormat:@"[%@]: We don't have the URL for the rendering server.", objc_opt_class()];
    _ADLog();

    [(NewsTransparencyViewController *)self _showErrorMessage:0];
  }
}

- (void)_showErrorMessage:(id)a3
{
  id v25 = a3;
  [(UIActivityIndicatorView *)self->activityIndicator stopAnimating];
  id v4 = [(NewsTransparencyViewController *)self errorLabel];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1C768]);
    id v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(NewsTransparencyViewController *)self setErrorLabel:v6];

    v7 = [(NewsTransparencyViewController *)self errorLabel];
    [v7 setNumberOfLines:0];

    v8 = [MEMORY[0x263F1C550] labelColor];
    v9 = [(NewsTransparencyViewController *)self errorLabel];
    [v9 setTextColor:v8];

    v10 = [MEMORY[0x263F1C658] systemFontOfSize:13.0];
    v11 = [(NewsTransparencyViewController *)self errorLabel];
    [v11 setFont:v10];

    v12 = [(NewsTransparencyViewController *)self errorLabel];
    [v12 setTextAlignment:1];

    uint64_t v13 = [(NewsTransparencyViewController *)self errorLabel];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v14 = [(NewsTransparencyViewController *)self view];
    v15 = [(NewsTransparencyViewController *)self errorLabel];
    [v14 addSubview:v15];

    id v16 = [(NewsTransparencyViewController *)self errorLabel];
    v17 = _NSDictionaryOfVariableBindings(&cfstr_Errorlabel.isa, v16, 0);
    v18 = [(NewsTransparencyViewController *)self view];
    v19 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-20-[errorLabel]-20-|" options:0 metrics:0 views:v17];
    [v18 addConstraints:v19];

    v20 = [(NewsTransparencyViewController *)self view];
    v21 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-[errorLabel]-|" options:0 metrics:0 views:v17];
    [v20 addConstraints:v21];
  }
  if (!v25)
  {
    id v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v25 = [v22 localizedStringForKey:@"Advertising information isn’t available right now. Try again later." value:&stru_26D73AD20 table:0];
  }
  v23 = [(NewsTransparencyViewController *)self errorLabel];
  [v23 setText:v25];

  v24 = [(NewsTransparencyViewController *)self errorLabel];
  [v24 setHidden:0];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  [(UIActivityIndicatorView *)self->activityIndicator stopAnimating];
  [(NewsTransparencyViewController *)self _hideErrorMessage];
  id v5 = [(NewsTransparencyViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NewsTransparencyViewController *)self delegate];
    [v7 newsTransparencyViewControllerDidRenderView:self];
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  char v6 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  [v6 removeFromSuperview];

  [(NewsTransparencyViewController *)self _showErrorMessage:0];
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  char v6 = [(NewsTransparencyViewController *)self myNewsPrivacyWebView];
  [v6 removeFromSuperview];

  [(NewsTransparencyViewController *)self _showErrorMessage:0];
}

- (void)_hideErrorMessage
{
  char v3 = [(NewsTransparencyViewController *)self errorLabel];

  if (v3)
  {
    id v4 = [(NewsTransparencyViewController *)self errorLabel];
    [v4 setHidden:1];
  }
}

- (void)_closeViewController:(id)a3
{
  id v3 = [(NewsTransparencyViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentViewDelegate
{
  id v3 = [(NewsTransparencyViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(NewsTransparencyViewController *)self delegate];
    [v5 newsTransparencyViewControllerDidLoad:self];
  }
}

- (void)errorDelegate
{
  id v3 = [(NewsTransparencyViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(NewsTransparencyViewController *)self delegate];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"NewsTransparencyViewControllerErrorDomain" code:0 userInfo:&unk_26D73D308];
    [v6 newsTransparencyViewController:self didFailWithError:v5];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NewsTransparencyViewController;
  [(NewsTransparencyViewController *)&v13 viewDidAppear:a3];
  id v4 = (id)*MEMORY[0x263F1D0D8];
  objc_initWeak(&location, self);
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __48__NewsTransparencyViewController_viewDidAppear___block_invoke;
  v10 = &unk_2646CDD58;
  objc_copyWeak(&v11, &location);
  id v6 = [v5 addObserverForName:v4 object:0 queue:0 usingBlock:&v7];
  -[NewsTransparencyViewController setNotificationObserver:](self, "setNotificationObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __48__NewsTransparencyViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v3 _closeViewController:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NewsTransparencyViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(NewsTransparencyViewController *)self delegate];
    [v7 newsTransparencyViewControllerDidDismiss:self];
  }
  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  v9 = [(NewsTransparencyViewController *)self notificationObserver];
  [v8 removeObserver:v9];

  v10.receiver = self;
  v10.super_class = (Class)NewsTransparencyViewController;
  [(NewsTransparencyViewController *)&v10 viewDidDisappear:v3];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void))a5;
  v9 = [v7 request];
  objc_super v10 = [v9 URL];

  id v11 = NSString;
  v69 = self;
  uint64_t v12 = objc_opt_class();
  objc_super v13 = [v10 absoluteString];
  uint64_t v14 = [v11 stringWithFormat:@"%@ The URL for the link generated by the rendering server is: %@.", v12, v13];
  _ADLog();

  v15 = [MEMORY[0x263F08BA0] componentsWithURL:v10 resolvingAgainstBaseURL:0];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v16 = [v15 queryItems];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v72 objects:v76 count:16];
  v70 = v10;
  if (v17)
  {
    uint64_t v18 = v17;
    v68 = v15;
    v19 = v8;
    id v20 = v7;
    uint64_t v21 = *(void *)v73;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v73 != v21) {
          objc_enumerationMutation(v16);
        }
        v23 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        v24 = [v23 name];
        int v25 = [v24 isEqualToString:@"path"];

        if (v25)
        {
          id v26 = v23;
          goto LABEL_11;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v18) {
        continue;
      }
      break;
    }
    id v26 = 0;
LABEL_11:
    id v7 = v20;
    uint64_t v8 = v19;
    v15 = v68;
  }
  else
  {
    id v26 = 0;
  }

  v27 = [v15 path];
  id v28 = [v27 lastPathComponent];
  if ([v28 rangeOfString:@"prefs:root=Privacy&path=ADVERTISING" options:1] != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_24;
  }
  id v29 = v8;
  id v30 = v7;
  id v31 = v26;
  v32 = [v15 path];
  v33 = [v32 lastPathComponent];
  if ([v33 rangeOfString:@"App-Prefs:root=Privacy&path=ADVERTISING" options:1] != 0x7FFFFFFFFFFFFFFFLL)
  {

    id v26 = v31;
    id v7 = v30;
    uint64_t v8 = v29;
LABEL_24:

    goto LABEL_25;
  }
  v34 = [v70 absoluteString];
  char v35 = [v34 containsString:@"Privacy_Advertising"];

  id v26 = v31;
  id v7 = v30;
  uint64_t v8 = v29;
  if (v35)
  {
LABEL_25:
    v54 = [MEMORY[0x263F01880] defaultWorkspace];
    uint64_t v55 = [NSURL URLWithString:@"prefs:root=Privacy&path=ADVERTISING"];
    [v54 openSensitiveURL:v55 withOptions:MEMORY[0x263EFFA78]];

    v56 = [(NewsTransparencyViewController *)v69 delegate];
    LOBYTE(v55) = objc_opt_respondsToSelector();

    if (v55)
    {
      v57 = [(NewsTransparencyViewController *)v69 delegate];
      [v57 newsTransparencyViewControllerDidLinkOut:v69];
    }
    v8[2](v8, 0);
    v43 = v70;
    goto LABEL_28;
  }
  v36 = [v15 path];
  v37 = [v36 lastPathComponent];
  v38 = @"prefs:root=Privacy&path=LOCATION";
  uint64_t v39 = [v37 rangeOfString:@"prefs:root=Privacy&path=LOCATION" options:1];

  if (v39 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v58 = [NSString stringWithFormat:@"This is the Settings->App Settings->Location link. Launch this in the settings app."];
    _ADLog();

    v59 = [MEMORY[0x263F241C0] sharedInstance];
    v48 = [v59 bundleIdentifier];

    v43 = v70;
    if ([v48 isEqualToString:@"com.apple.news"])
    {
      v38 = @"prefs:root=NEWS";
    }
    else if ([v48 isEqualToString:@"com.apple.stocks"])
    {
      v38 = @"prefs:root=STOCKS";
    }
    v60 = [MEMORY[0x263F01880] defaultWorkspace];
    v61 = [NSURL URLWithString:v38];
    [v60 openSensitiveURL:v61 withOptions:MEMORY[0x263EFFA78]];

    v62 = [(NewsTransparencyViewController *)v69 presentingViewController];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __90__NewsTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
    v71[3] = &unk_2646CDC18;
    v71[4] = v69;
    [v62 dismissViewControllerAnimated:1 completion:v71];

    goto LABEL_36;
  }
  v40 = [v15 path];
  v41 = [v40 lastPathComponent];
  uint64_t v42 = [v41 rangeOfString:@"embedded:root=Privacy" options:1];

  v43 = v70;
  if (v26 && v42 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v44 = (void *)MEMORY[0x263F5B8F8];
    v45 = NSString;
    double v46 = [v26 value];
    double v47 = [v45 stringWithFormat:@"com.apple.onboarding.%@", v46];
    v48 = [v44 presenterForPrivacySplashWithIdentifier:v47];

    [v48 setPresentingViewController:v69];
    if ([(NewsTransparencyViewController *)v69 isiPad]) {
      uint64_t v49 = 2;
    }
    else {
      uint64_t v49 = 1;
    }
    [v48 setModalPresentationStyle:v49];
    v50 = [(NewsTransparencyViewController *)v69 navigationController];
    [v48 presentInNavigationStack:v50];

    id v51 = NSString;
    v52 = [v26 value];
    v53 = [v51 stringWithFormat:@"This is the Data & Privacy link for the about page with path %@. Present this in the modal sheet.", v52];
    _ADLog();

    v43 = v70;
LABEL_36:
    v8[2](v8, 0);

    goto LABEL_28;
  }
  if ([v7 navigationType])
  {
    v8[2](v8, 1);
  }
  else
  {
    v63 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v64 = [v7 request];
    v65 = [(id)v64 URL];
    [v63 openURL:v65 options:MEMORY[0x263EFFA78] completionHandler:&__block_literal_global_0];

    v66 = [(NewsTransparencyViewController *)v69 delegate];
    LOBYTE(v64) = objc_opt_respondsToSelector();

    if (v64)
    {
      v67 = [(NewsTransparencyViewController *)v69 delegate];
      [v67 newsTransparencyViewControllerDidLinkOut:v69];
    }
    v8[2](v8, 0);
  }
LABEL_28:
}

void __90__NewsTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 newsTransparencyViewControllerDidLinkOut:*(void *)(a1 + 32)];
  }
}

void __90__NewsTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1, int a2)
{
  v2 = @"NOT";
  if (a2) {
    v2 = @"successfully";
  }
  id v3 = [NSString stringWithFormat:@"This is NOT the Settings->Privacy->Advertising link. Launch this in Safari and not our WebView. The link can %@ be opened", v2];
  _ADLog();
}

- (void)displayDebugButtonWaitingIndicator
{
  id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C3D8]), "initWithFrame:", 0.0, 0.0, 15.0, 15.0);
  [v6 sizeToFit];
  id v3 = [MEMORY[0x263F1C550] systemGrayColor];
  [v6 setColor:v3];

  [v6 startAnimating];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v6];
  id v5 = [(NewsTransparencyViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:v4];
}

- (void)debugDetailsViewControllerReady:(id)a3
{
  id v4 = (UIViewController *)a3;
  id v5 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithTitle:@"Debug" style:0 target:self action:sel__openDebugView_];
  leftButton = self->leftButton;
  self->leftButton = v5;

  id v7 = self->leftButton;
  uint64_t v8 = [(NewsTransparencyViewController *)self navigationItem];
  [v8 setLeftBarButtonItem:v7];

  debugViewController = self->debugViewController;
  self->debugViewController = v4;
}

- (void)_openDebugView:(id)a3
{
  [(UIViewController *)self->debugViewController setModalPresentationStyle:7];
  id v4 = [(UIViewController *)self->debugViewController popoverPresentationController];
  [v4 setBarButtonItem:self->leftButton];
  [(NewsTransparencyViewController *)self presentViewController:self->debugViewController animated:1 completion:0];
}

- (NewsTransparencyViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)transparencyDetailsUnavailableMessage
{
  return self->_transparencyDetailsUnavailableMessage;
}

- (NSString)transparencyRendererPayload
{
  return self->_transparencyRendererPayload;
}

- (NSString)transparencyRendererURL
{
  return self->_transparencyRendererURL;
}

- (BOOL)renderingStatusForLocationPermission
{
  return self->_renderingStatusForLocationPermission;
}

- (BOOL)renderingStatusForPAPermission
{
  return self->_renderingStatusForPAPermission;
}

- (NSDictionary)transparencyDetailsDictionary
{
  return self->_transparencyDetailsDictionary;
}

- (void)setTransparencyDetailsDictionary:(id)a3
{
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
}

- (WKWebView)myNewsPrivacyWebView
{
  return self->_myNewsPrivacyWebView;
}

- (void)setMyNewsPrivacyWebView:(id)a3
{
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (void)setIsiPad:(BOOL)a3
{
  self->_isiPad = a3;
}

- (BOOL)isClientTodayWidget
{
  return self->_isClientTodayWidget;
}

- (void)setIsClientTodayWidget:(BOOL)a3
{
  self->_isClientTodayWidget = a3;
}

- (id)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_myNewsPrivacyWebView, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsDictionary, 0);
  objc_storeStrong((id *)&self->_transparencyRendererURL, 0);
  objc_storeStrong((id *)&self->_transparencyRendererPayload, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsUnavailableMessage, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->debugViewController, 0);
  objc_storeStrong((id *)&self->leftButton, 0);
  objc_storeStrong((id *)&self->activityIndicator, 0);
}

@end