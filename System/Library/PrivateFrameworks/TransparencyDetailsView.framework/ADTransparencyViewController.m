@interface ADTransparencyViewController
- (ADTransparencyViewController)initWithTransparencyDetails:(id)a3;
- (ADTransparencyViewControllerDelegate)delegate;
- (BOOL)isiPad;
- (BOOL)renderingStatusForLocationPermission;
- (BOOL)renderingStatusForPAPermission;
- (NSDictionary)transparencyDetailsData;
- (NSString)transparencyDetails;
- (NSString)transparencyDetailsUnavailableMessage;
- (NSString)transparencyRendererPayload;
- (NSString)transparencyRendererURL;
- (UILabel)errorLabel;
- (UINavigationBar)transparencyNavBar;
- (WKWebView)myWebView;
- (id)notificationObserver;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (void)_closeViewController:(id)a3;
- (void)_commonInit;
- (void)_hideErrorMessage;
- (void)_postDismissedNotification;
- (void)_reportTransparencyViewControllerEventWithType:(id)a3 withCompletionHandler:(id)a4;
- (void)_showErrorMessage:(id)a3;
- (void)configureWebView;
- (void)errorDelegate;
- (void)prepareRenderingPayload;
- (void)presentViewDelegate;
- (void)renderWebView;
- (void)requestViewWithTransparencyDetails:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorLabel:(id)a3;
- (void)setIsiPad:(BOOL)a3;
- (void)setMyWebView:(id)a3;
- (void)setNotificationObserver:(id)a3;
- (void)setTransparencyDetails:(id)a3;
- (void)setTransparencyDetailsData:(id)a3;
- (void)setTransparencyNavBar:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation ADTransparencyViewController

- (ADTransparencyViewController)initWithTransparencyDetails:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ADTransparencyViewController;
  v5 = [(ADTransparencyViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(ADTransparencyViewController *)v5 setTransparencyDetails:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ADTransparencyViewController;
  [(ADTransparencyViewController *)&v3 viewDidLoad];
  [(ADTransparencyViewController *)self _commonInit];
  [(ADTransparencyViewController *)self configureWebView];
  [(ADTransparencyViewController *)self renderWebView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ADTransparencyViewController;
  [(ADTransparencyViewController *)&v13 viewDidAppear:a3];
  id v4 = (id)*MEMORY[0x263F1D0D8];
  objc_initWeak(&location, self);
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __46__ADTransparencyViewController_viewDidAppear___block_invoke;
  v10 = &unk_2646CDD58;
  objc_copyWeak(&v11, &location);
  v6 = [v5 addObserverForName:v4 object:0 queue:0 usingBlock:&v7];
  -[ADTransparencyViewController setNotificationObserver:](self, "setNotificationObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __46__ADTransparencyViewController_viewDidAppear___block_invoke(uint64_t a1)
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
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  v6 = [(ADTransparencyViewController *)self notificationObserver];
  [v5 removeObserver:v6];

  [(ADTransparencyViewController *)self _postDismissedNotification];
  v7.receiver = self;
  v7.super_class = (Class)ADTransparencyViewController;
  [(ADTransparencyViewController *)&v7 viewDidDisappear:v3];
}

- (void)requestViewWithTransparencyDetails:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF8F8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithBase64EncodedString:v5 options:0];

  id v21 = 0;
  objc_super v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v21];
  id v8 = v21;
  transparencyDetailsData = self->_transparencyDetailsData;
  self->_transparencyDetailsData = v7;

  if (v8)
  {
    v20 = (void *)[objc_alloc(MEMORY[0x263F24240]) initWithData:v6];
    v10 = [v20 dictionaryRepresentation];
    id v11 = self->_transparencyDetailsData;
    self->_transparencyDetailsData = v10;

    id v12 = objc_alloc_init(MEMORY[0x263F00A60]);
    BOOL v13 = [v12 authorizationStatus] - 3 < 2;
    id v14 = objc_alloc_init(MEMORY[0x263F51788]);
    uint64_t v15 = [v14 personalizedAds];
    v16 = self->_transparencyDetailsData;
    v17 = [NSNumber numberWithBool:v13];
    [(NSDictionary *)v16 setValue:v17 forKey:@"renderingStateForLocation"];

    v18 = self->_transparencyDetailsData;
    v19 = [NSNumber numberWithBool:v15];
    [(NSDictionary *)v18 setValue:v19 forKey:@"renderingStateForPA"];
  }
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  int64_t v3 = [v2 statusBarOrientation];

  return v3;
}

- (void)_commonInit
{
  v58[3] = *MEMORY[0x263EF8340];
  int64_t v3 = [NSString stringWithFormat:@"Connection to ADTransparencyViewController established with TransparencyDetailsView framework."];
  _ADLog();

  v54 = [MEMORY[0x263F241C0] sharedInstance];
  v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [NSString stringWithFormat:@"The Storefront Bundle Locale that will be used is: %@", v53];
  _ADLog();

  [(ADTransparencyViewController *)self setIsiPad:MGGetBoolAnswer()];
  if ([(ADTransparencyViewController *)self isiPad]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [(ADTransparencyViewController *)self setModalPresentationStyle:v5];
  [(ADTransparencyViewController *)self setModalTransitionStyle:0];
  v6 = [MEMORY[0x263F1C550] systemBackgroundColor];
  objc_super v7 = [(ADTransparencyViewController *)self view];
  [v7 setBackgroundColor:v6];

  [(ADTransparencyViewController *)self setEdgesForExtendedLayout:0];
  id v8 = objc_alloc_init(MEMORY[0x263F1C7E0]);
  [(ADTransparencyViewController *)self setTransparencyNavBar:v8];

  v9 = [(ADTransparencyViewController *)self transparencyNavBar];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(ADTransparencyViewController *)self transparencyNavBar];
  [v10 setTranslucent:0];

  id v11 = [(ADTransparencyViewController *)self transparencyNavBar];
  [v11 setAutoresizesSubviews:1];

  id v12 = [(ADTransparencyViewController *)self transparencyNavBar];
  [v12 setAutoresizingMask:2];

  BOOL v13 = [(ADTransparencyViewController *)self view];
  id v14 = [(ADTransparencyViewController *)self transparencyNavBar];
  [v13 addSubview:v14];

  v46 = (void *)MEMORY[0x263F08938];
  v52 = [(ADTransparencyViewController *)self transparencyNavBar];
  v50 = [v52 topAnchor];
  v51 = [(ADTransparencyViewController *)self view];
  v49 = [v51 topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v58[0] = v48;
  v47 = [(ADTransparencyViewController *)self transparencyNavBar];
  v45 = [v47 rightAnchor];
  uint64_t v15 = [(ADTransparencyViewController *)self view];
  v16 = [v15 rightAnchor];
  v17 = [v45 constraintEqualToAnchor:v16];
  v58[1] = v17;
  v18 = [(ADTransparencyViewController *)self transparencyNavBar];
  v19 = [v18 leftAnchor];
  v20 = [(ADTransparencyViewController *)self view];
  id v21 = [v20 leftAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  v58[2] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:3];
  [v46 activateConstraints:v23];

  v24 = [MEMORY[0x263F086E0] mainBundle];
  id v25 = (id)[v24 localizedStringForKey:@"Done" value:&stru_26D73AD20 table:0];

  v26 = [v54 storefrontLocalizationLanguage];
  v27 = [v53 localizedStringForKey:@"Done" value:0 table:0 localization:v26];

  v28 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithTitle:v27 style:2 target:self action:sel__closeViewController_];
  v29 = [MEMORY[0x263F086E0] mainBundle];
  id v30 = (id)[v29 localizedStringForKey:@"About This Ad" value:&stru_26D73AD20 table:0];

  v31 = [v54 storefrontLocalizationLanguage];
  v32 = [v53 localizedStringForKey:@"About This Ad" value:0 table:0 localization:v31];

  v33 = (void *)[objc_alloc(MEMORY[0x263F1C800]) initWithTitle:v32];
  [v33 setRightBarButtonItem:v28];
  v34 = [MEMORY[0x263F1CB00] currentTraitCollection];
  uint64_t v35 = [v34 userInterfaceStyle];

  if (v35 == 2)
  {
    id v36 = objc_alloc_init(MEMORY[0x263F1C7E8]);
    [v36 configureWithOpaqueBackground];
    v37 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [v36 setBackgroundColor:v37];

    uint64_t v56 = *MEMORY[0x263F1C240];
    v38 = [MEMORY[0x263F1C550] whiteColor];
    v57 = v38;
    v39 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    [v36 setTitleTextAttributes:v39];

    v40 = [(ADTransparencyViewController *)self transparencyNavBar];
    [v40 setStandardAppearance:v36];

    v41 = [(ADTransparencyViewController *)self transparencyNavBar];
    [v41 setScrollEdgeAppearance:v36];

    v42 = [(ADTransparencyViewController *)self transparencyNavBar];
    [v42 setTranslucent:0];
  }
  v55 = v33;
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
  v44 = [(ADTransparencyViewController *)self transparencyNavBar];
  [v44 setItems:v43];

  [(ADTransparencyViewController *)self prepareRenderingPayload];
}

- (void)prepareRenderingPayload
{
  transparencyDetails = self->_transparencyDetails;
  if (transparencyDetails)
  {
    id v4 = NSString;
    uint64_t v5 = [(NSString *)transparencyDetails description];
    v6 = [v4 stringWithFormat:@"The privacy data key being used is: %@.", v5];
    _ADLog();

    [(ADTransparencyViewController *)self requestViewWithTransparencyDetails:self->_transparencyDetails];
    objc_super v7 = [(NSDictionary *)self->_transparencyDetailsData objectForKey:@"transparencyDetailsUnavailableMessage"];
    transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage;
    self->_transparencyDetailsUnavailableMessage = v7;

    v9 = [(NSDictionary *)self->_transparencyDetailsData objectForKey:@"transparencyRendererPayload"];
    transparencyRendererPayload = self->_transparencyRendererPayload;
    self->_transparencyRendererPayload = v9;

    id v11 = [(NSDictionary *)self->_transparencyDetailsData objectForKey:@"transparencyRendererURL"];
    transparencyRendererURL = self->_transparencyRendererURL;
    self->_transparencyRendererURL = v11;

    BOOL v13 = [(NSDictionary *)self->_transparencyDetailsData objectForKey:@"renderingStateForLocation"];
    self->_renderingStatusForLocationPermission = [v13 BOOLValue];

    id v14 = [(NSDictionary *)self->_transparencyDetailsData objectForKey:@"renderingStateForPA"];
    self->_renderingStatusForPAPermission = [v14 BOOLValue];
  }
  if (!self->_transparencyDetailsData)
  {
    [(ADTransparencyViewController *)self errorDelegate];
  }
}

- (void)configureWebView
{
  void v58[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F1FA38]);
  id v4 = NSString;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ADTransparencyViewController renderingStatusForLocationPermission](self, "renderingStatusForLocationPermission"));
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ADTransparencyViewController renderingStatusForPAPermission](self, "renderingStatusForPAPermission"));
  v57 = [v4 stringWithFormat:@"        window.transparency = {            isLocationPermissionGranted: () => { return %@ }, isPAEnabled: () => { return %@ }         }    ", v5, v6];

  v55 = v3;
  uint64_t v56 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v57 injectionTime:0 forMainFrameOnly:1];
  [v3 addUserScript:v56];
  id v54 = objc_alloc_init(MEMORY[0x263F1FA60]);
  [v54 setUserContentController:v3];
  id v7 = objc_alloc(MEMORY[0x263F1FA58]);
  id v8 = [(ADTransparencyViewController *)self view];
  [v8 frame];
  double v10 = v9;
  id v11 = [(ADTransparencyViewController *)self view];
  [v11 frame];
  BOOL v13 = objc_msgSend(v7, "initWithFrame:configuration:", v54, 0.0, 44.0, v10, v12 + -44.0);
  [(ADTransparencyViewController *)self setMyWebView:v13];

  id v14 = [(ADTransparencyViewController *)self myWebView];
  [v14 setAllowsLinkPreview:0];

  uint64_t v15 = [(ADTransparencyViewController *)self myWebView];
  [v15 setNavigationDelegate:self];

  v16 = [(ADTransparencyViewController *)self myWebView];
  [v16 setOpaque:0];

  v17 = [(ADTransparencyViewController *)self myWebView];
  v18 = [v17 scrollView];
  [v18 setContentInsetAdjustmentBehavior:2];

  v19 = [(ADTransparencyViewController *)self myWebView];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = [(ADTransparencyViewController *)self myWebView];
  [v20 setAutoresizesSubviews:1];

  id v21 = [(ADTransparencyViewController *)self myWebView];
  [v21 setAutoresizingMask:18];

  v22 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  activityIndicator = self->activityIndicator;
  self->activityIndicator = v22;

  v24 = [(ADTransparencyViewController *)self myWebView];
  [v24 frame];
  double v26 = v25 * 0.5;
  v27 = [(ADTransparencyViewController *)self myWebView];
  [v27 frame];
  -[UIActivityIndicatorView setCenter:](self->activityIndicator, "setCenter:", v26, v28 * 0.5 + -44.0);

  [(UIActivityIndicatorView *)self->activityIndicator setAutoresizingMask:45];
  [(UIActivityIndicatorView *)self->activityIndicator startAnimating];
  v29 = [(ADTransparencyViewController *)self myWebView];
  [v29 addSubview:self->activityIndicator];

  id v30 = [(ADTransparencyViewController *)self view];
  v31 = [(ADTransparencyViewController *)self myWebView];
  [v30 addSubview:v31];

  v44 = (void *)MEMORY[0x263F08938];
  v53 = [(ADTransparencyViewController *)self myWebView];
  v51 = [v53 topAnchor];
  v52 = [(ADTransparencyViewController *)self transparencyNavBar];
  v50 = [v52 bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v58[0] = v49;
  v48 = [(ADTransparencyViewController *)self myWebView];
  v46 = [v48 bottomAnchor];
  v47 = [(ADTransparencyViewController *)self view];
  v45 = [v47 bottomAnchor];
  v43 = [v46 constraintEqualToAnchor:v45];
  v58[1] = v43;
  v42 = [(ADTransparencyViewController *)self myWebView];
  v32 = [v42 rightAnchor];
  v33 = [(ADTransparencyViewController *)self view];
  v34 = [v33 rightAnchor];
  uint64_t v35 = [v32 constraintEqualToAnchor:v34];
  v58[2] = v35;
  id v36 = [(ADTransparencyViewController *)self myWebView];
  v37 = [v36 leftAnchor];
  v38 = [(ADTransparencyViewController *)self view];
  v39 = [v38 leftAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  v58[3] = v40;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:4];
  [v44 activateConstraints:v41];
}

- (void)renderWebView
{
  id v3 = [(ADTransparencyViewController *)self transparencyRendererURL];

  if (v3)
  {
    id v29 = [MEMORY[0x263F241C0] sharedInstance];
    id v4 = [MEMORY[0x263EFF980] array];
    uint64_t v5 = (void *)MEMORY[0x263F08BD0];
    v6 = [v29 localeIdentifier];
    id v7 = [v5 queryItemWithName:@"locale" value:v6];
    [v4 addObject:v7];

    id v8 = (void *)MEMORY[0x263F08BD0];
    double v9 = [v29 osIdentifier];
    double v10 = [v8 queryItemWithName:@"os" value:v9];
    [v4 addObject:v10];

    id v11 = (void *)MEMORY[0x263F08BD0];
    double v12 = [v29 bundleIdentifier];
    BOOL v13 = [v11 queryItemWithName:@"app_id" value:v12];
    [v4 addObject:v13];

    id v14 = (void *)MEMORY[0x263F08BD0];
    uint64_t v15 = [v29 shortBuildVersion];
    v16 = [v14 queryItemWithName:@"build" value:v15];
    [v4 addObject:v16];

    v17 = (void *)MEMORY[0x263F08BD0];
    v18 = [v29 shortModelType];
    v19 = [v17 queryItemWithName:@"model" value:v18];
    [v4 addObject:v19];

    v20 = (void *)MEMORY[0x263F08BA0];
    id v21 = [(ADTransparencyViewController *)self transparencyRendererURL];
    v22 = [v20 componentsWithString:v21];

    [v22 setQueryItems:v4];
    v23 = [v22 URL];
    v24 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v23];
    [v24 setHTTPMethod:@"POST"];
    double v25 = [(ADTransparencyViewController *)self transparencyRendererPayload];
    double v26 = [v25 dataUsingEncoding:4];
    [v24 setHTTPBody:v26];

    v27 = [(ADTransparencyViewController *)self myWebView];
    id v28 = (id)[v27 loadRequest:v24];
  }
  else
  {
    [(ADTransparencyViewController *)self _showErrorMessage:0];
  }
}

- (void)presentViewDelegate
{
  id v3 = [(ADTransparencyViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(ADTransparencyViewController *)self delegate];
    [v5 adTransparencyViewControllerDidLoad:self];
  }
  [(ADTransparencyViewController *)self _reportTransparencyViewControllerEventWithType:@"PrivacyAdTransparencyDidAppear" withCompletionHandler:0];
}

- (void)errorDelegate
{
  id v3 = [(ADTransparencyViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(ADTransparencyViewController *)self delegate];
    uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"ADTransparencyViewControllerErrorDomain" code:0 userInfo:&unk_26D73D330];
    [v6 adTransparencyViewController:self didFailWithError:v5];
  }
}

- (void)_closeViewController:(id)a3
{
  char v4 = [(ADTransparencyViewController *)self presentingViewController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__ADTransparencyViewController__closeViewController___block_invoke;
  v5[3] = &unk_2646CDC18;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];

  [(ADTransparencyViewController *)self _reportTransparencyViewControllerEventWithType:@"PrivacyAdTransparencyDidDisappear" withCompletionHandler:0];
}

void __53__ADTransparencyViewController__closeViewController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 adTransparencyViewControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)_showErrorMessage:(id)a3
{
  id v31 = a3;
  [(UIActivityIndicatorView *)self->activityIndicator stopAnimating];
  id v4 = [(ADTransparencyViewController *)self errorLabel];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1C768]);
    id v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(ADTransparencyViewController *)self setErrorLabel:v6];

    id v7 = [(ADTransparencyViewController *)self errorLabel];
    [v7 setNumberOfLines:0];

    id v8 = [MEMORY[0x263F1C550] labelColor];
    double v9 = [(ADTransparencyViewController *)self errorLabel];
    [v9 setTextColor:v8];

    double v10 = [MEMORY[0x263F1C658] systemFontOfSize:13.0];
    id v11 = [(ADTransparencyViewController *)self errorLabel];
    [v11 setFont:v10];

    double v12 = [(ADTransparencyViewController *)self errorLabel];
    [v12 setTextAlignment:1];

    BOOL v13 = [(ADTransparencyViewController *)self errorLabel];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v14 = [(ADTransparencyViewController *)self view];
    uint64_t v15 = [(ADTransparencyViewController *)self errorLabel];
    [v14 addSubview:v15];

    v16 = [(ADTransparencyViewController *)self errorLabel];
    v17 = _NSDictionaryOfVariableBindings(&cfstr_Errorlabel.isa, v16, 0);
    v18 = [(ADTransparencyViewController *)self view];
    v19 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-20-[errorLabel]-20-|" options:0 metrics:0 views:v17];
    [v18 addConstraints:v19];

    v20 = [(ADTransparencyViewController *)self view];
    id v21 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-[errorLabel]-|" options:0 metrics:0 views:v17];
    [v20 addConstraints:v21];
  }
  if (!v31)
  {
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [MEMORY[0x263F241C0] sharedInstance];
    v24 = [MEMORY[0x263F086E0] mainBundle];
    id v25 = (id)[v24 localizedStringForKey:@"Advertising information isn’t available right now. Try again later." value:&stru_26D73AD20 table:0];

    double v26 = [v23 storefrontLocalizationLanguage];
    id v31 = [v22 localizedStringForKey:@"Advertising information isn’t available right now. Try again later." value:0 table:0 localization:v26];
  }
  v27 = [(ADTransparencyViewController *)self myWebView];
  id v28 = [v27 scrollView];
  [v28 setScrollEnabled:0];

  id v29 = [(ADTransparencyViewController *)self errorLabel];
  [v29 setText:v31];

  id v30 = [(ADTransparencyViewController *)self errorLabel];
  [v30 setHidden:0];

  [(ADTransparencyViewController *)self presentViewDelegate];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  [(UIActivityIndicatorView *)self->activityIndicator stopAnimating];
  [(ADTransparencyViewController *)self _hideErrorMessage];
  [(ADTransparencyViewController *)self presentViewDelegate];
  [(ADTransparencyViewController *)self _reportTransparencyViewControllerEventWithType:@"PrivacyAdTransparencyDidRenderTransparency" withCompletionHandler:0];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void (**)(id, void))a5;
  double v9 = [v7 request];
  double v10 = [v9 URL];

  id v11 = NSString;
  v68 = self;
  uint64_t v12 = objc_opt_class();
  BOOL v13 = [v10 absoluteString];
  id v14 = [v11 stringWithFormat:@"%@ The URL for the link generated by the rendering server is: %@.", v12, v13];
  _ADLog();

  uint64_t v15 = [MEMORY[0x263F08BA0] componentsWithURL:v10 resolvingAgainstBaseURL:0];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v16 = [v15 queryItems];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v65 = v15;
    v66 = v10;
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
    id v8 = v19;
    uint64_t v15 = v65;
    double v10 = v66;
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
  v67 = v8;
  id v29 = v7;
  id v30 = v26;
  id v31 = v15;
  v32 = [v15 path];
  v33 = [v32 lastPathComponent];
  if ([v33 rangeOfString:@"App-Prefs:root=Privacy&path=ADVERTISING" options:1] != 0x7FFFFFFFFFFFFFFFLL)
  {

    id v26 = v30;
    id v7 = v29;
    id v8 = v67;
    uint64_t v15 = v31;
LABEL_24:

    goto LABEL_25;
  }
  v34 = [v10 absoluteString];
  char v35 = [v34 containsString:@"Privacy_Advertising"];

  id v26 = v30;
  id v7 = v29;
  id v8 = v67;
  uint64_t v15 = v31;
  if (v35)
  {
LABEL_25:
    v53 = [MEMORY[0x263F01880] defaultWorkspace];
    id v54 = [NSURL URLWithString:@"prefs:root=Privacy&path=ADVERTISING"];
    [v53 openSensitiveURL:v54 withOptions:MEMORY[0x263EFFA78]];

    v55 = v68;
    uint64_t v56 = [(ADTransparencyViewController *)v68 presentingViewController];
    v57 = v56;
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
    v71[3] = &unk_2646CDC18;
    v71[4] = v68;
    v58 = v71;
LABEL_26:
    [v56 dismissViewControllerAnimated:1 completion:v58];

    [(ADTransparencyViewController *)v55 _reportTransparencyViewControllerEventWithType:@"PrivacyAdTransparencyDidLinkOut" withCompletionHandler:0];
    [(ADTransparencyViewController *)v55 _reportTransparencyViewControllerEventWithType:@"PrivacyAdTransparencyDidDisappear" withCompletionHandler:0];
    v8[2](v8, 0);
    goto LABEL_27;
  }
  id v36 = [v31 path];
  v37 = [v36 lastPathComponent];
  uint64_t v38 = [v37 rangeOfString:@"prefs:root=Privacy&path=LOCATION" options:1];

  if (v38 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v59 = [NSString stringWithFormat:@"This is the Settings->App Settings->Location link. Launch this in the settings app."];
    _ADLog();

    v60 = [MEMORY[0x263F01880] defaultWorkspace];
    v61 = [NSURL URLWithString:@"prefs:root=STORE"];
    [v60 openSensitiveURL:v61 withOptions:MEMORY[0x263EFFA78]];

    v55 = v68;
    uint64_t v56 = [(ADTransparencyViewController *)v68 presentingViewController];
    v57 = v56;
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2;
    v70[3] = &unk_2646CDC18;
    v70[4] = v68;
    v58 = v70;
    goto LABEL_26;
  }
  v39 = [v31 path];
  v40 = [v39 lastPathComponent];
  uint64_t v41 = [v40 rangeOfString:@"embedded:root=Privacy" options:1];

  if (!v26 || v41 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v7 navigationType])
    {
      v67[2](v67, 1);
      goto LABEL_27;
    }
    v62 = [MEMORY[0x263F1C408] sharedApplication];
    v63 = [v7 request];
    v64 = [v63 URL];
    [v62 openURL:v64 options:MEMORY[0x263EFFA78] completionHandler:&__block_literal_global_1];

    v55 = v68;
    uint64_t v56 = [(ADTransparencyViewController *)v68 presentingViewController];
    v57 = v56;
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_4;
    v69[3] = &unk_2646CDC18;
    v69[4] = v68;
    v58 = v69;
    goto LABEL_26;
  }
  v42 = (void *)MEMORY[0x263F5B8F8];
  v43 = NSString;
  v44 = [v26 value];
  v45 = [v43 stringWithFormat:@"com.apple.onboarding.%@", v44];
  v46 = [v42 presenterForPrivacySplashWithIdentifier:v45];

  [v46 setPresentingViewController:v68];
  if ([(ADTransparencyViewController *)v68 isiPad]) {
    uint64_t v47 = 2;
  }
  else {
    uint64_t v47 = 1;
  }
  [v46 setModalPresentationStyle:v47];
  v48 = [(ADTransparencyViewController *)v68 navigationController];
  [v46 presentInNavigationStack:v48];

  v49 = NSString;
  [v26 value];
  v51 = v50 = v10;
  v52 = [v49 stringWithFormat:@"This is the Data & Privacy link for the about page with path %@. Present this in the modal sheet.", v51];
  _ADLog();

  double v10 = v50;
  v67[2](v67, 0);

LABEL_27:
}

void __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 adTransparencyViewControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

void __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 adTransparencyViewControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

void __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_3(uint64_t a1, int a2)
{
  v2 = @"NOT";
  if (a2) {
    v2 = @"successfully";
  }
  id v3 = [NSString stringWithFormat:@"This is NOT the Settings->Privacy->Advertising link. Launch this in Safari and not our WebView. The link can %@ be opened", v2];
  _ADLog();
}

void __88__ADTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 adTransparencyViewControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6 = [(ADTransparencyViewController *)self myWebView];
  [v6 removeFromSuperview];

  [(ADTransparencyViewController *)self _showErrorMessage:0];
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6 = [(ADTransparencyViewController *)self myWebView];
  [v6 removeFromSuperview];

  [(ADTransparencyViewController *)self _showErrorMessage:0];
}

- (void)_hideErrorMessage
{
  char v3 = [(ADTransparencyViewController *)self errorLabel];

  if (v3)
  {
    id v4 = [(ADTransparencyViewController *)self errorLabel];
    [v4 setHidden:1];
  }
}

- (void)_reportTransparencyViewControllerEventWithType:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F24230] workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __101__ADTransparencyViewController__reportTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke;
  v10[3] = &unk_2646CDD00;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 addOperationWithBlock:v10];
}

void __101__ADTransparencyViewController__reportTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F241C0] sharedInstance];
  char v3 = [v2 defaultServerURL];
  id v4 = [NSString stringWithFormat:@"Requesting ADLogAnalyticsRequest with ADAnalyticsEvent for %@ event to: %@", *(void *)(a1 + 32), v3];
  _ADLog();

  id v5 = [MEMORY[0x263F24230] sharedInstance];
  id v6 = [MEMORY[0x263F241D8] sharedInstance];
  id v7 = objc_alloc_init(MEMORY[0x263F241E8]);
  [v7 setBundleID:*MEMORY[0x263F24168]];
  id v8 = [v6 encryptedIDForClientType:3];
  [v7 setContentiAdID:v8];

  id v9 = [v6 encryptedIDForClientType:5];
  [v7 setDPID:v9];

  double v10 = [v6 encryptedIDForClientType:0];
  [v7 setIAdID:v10];

  id v11 = objc_alloc_init(MEMORY[0x263F24178]);
  id v12 = [MEMORY[0x263EFF910] date];
  objc_msgSend(v11, "setTimestamp:", (double)(int)objc_msgSend(v12, "AD_toServerTime"));

  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = 0;
  if (([v13 isEqualToString:@"PrerollRequested"] & 1) == 0)
  {
    if ([v13 isEqualToString:@"PrivacyUserTransparencyDidAppear"])
    {
      uint64_t v14 = 1;
    }
    else if ([v13 isEqualToString:@"PrivacyUserTransparencyDidRenderTransparency"])
    {
      uint64_t v14 = 2;
    }
    else if ([v13 isEqualToString:@"PrivacyUserTransparencyDidDisappear"])
    {
      uint64_t v14 = 3;
    }
    else if ([v13 isEqualToString:@"PrivacyUserTransparencyDidLinkOut"])
    {
      uint64_t v14 = 4;
    }
    else if ([v13 isEqualToString:@"PrivacyAdTransparencyDidAppear"])
    {
      uint64_t v14 = 5;
    }
    else if ([v13 isEqualToString:@"PrivacyAdTransparencyDidRenderTransparency"])
    {
      uint64_t v14 = 6;
    }
    else if ([v13 isEqualToString:@"PrivacyAdTransparencyDidDisappear"])
    {
      uint64_t v14 = 7;
    }
    else if ([v13 isEqualToString:@"PrivacyAdTransparencyDidLinkOut"])
    {
      uint64_t v14 = 8;
    }
    else
    {
      uint64_t v14 = 0;
    }
  }

  [v11 setEvent:v14];
  uint64_t v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v11, 0);
  [v7 setEvents:v15];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __101__ADTransparencyViewController__reportTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke_2;
  v18[3] = &unk_2646CDCD8;
  id v16 = *(id *)(a1 + 40);
  id v19 = v7;
  id v20 = v16;
  id v17 = v7;
  [v5 handleRequest:v17 serverURL:v3 responseHandler:v18];
}

void __101__ADTransparencyViewController__reportTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [NSString stringWithFormat:@"Received an ADLogAnalyticsResponse ERROR: %@", v8];
    _ADLog();
  }
  else
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F241F0]) initWithData:v15];
    double v10 = NSString;
    id v11 = [v9 dictionaryRepresentation];
    id v12 = [v10 stringWithFormat:@"Received an ADLogAnalyticsResponse: %@", v11];
    _ADLog();
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13)
  {
    uint64_t v14 = [*(id *)(a1 + 32) dictionaryRepresentation];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
}

- (void)_postDismissedNotification
{
  v2 = [NSString stringWithFormat:@"Posting ADTransparencyViewControllerDismissed notification."];
  _ADLog();

  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"ADTransparencyViewControllerDismissed" object:0];
}

- (ADTransparencyViewControllerDelegate)delegate
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

- (NSString)transparencyDetails
{
  return self->_transparencyDetails;
}

- (void)setTransparencyDetails:(id)a3
{
}

- (NSDictionary)transparencyDetailsData
{
  return self->_transparencyDetailsData;
}

- (void)setTransparencyDetailsData:(id)a3
{
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
}

- (WKWebView)myWebView
{
  return self->_myWebView;
}

- (void)setMyWebView:(id)a3
{
}

- (UINavigationBar)transparencyNavBar
{
  return self->_transparencyNavBar;
}

- (void)setTransparencyNavBar:(id)a3
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
  objc_storeStrong((id *)&self->_transparencyNavBar, 0);
  objc_storeStrong((id *)&self->_myWebView, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsData, 0);
  objc_storeStrong((id *)&self->_transparencyDetails, 0);
  objc_storeStrong((id *)&self->_transparencyRendererURL, 0);
  objc_storeStrong((id *)&self->_transparencyRendererPayload, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsUnavailableMessage, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->activityIndicator, 0);
}

@end