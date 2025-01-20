@interface UserTransparencyViewController
- (ADUserTransparencyResponse)userTransparencyResponseData;
- (BOOL)isiPad;
- (BOOL)renderingStatusForPAPermission;
- (NSString)userTransparencyDetails;
- (NSString)userTransparencyDetailsUnavailableMessage;
- (NSString)userTransparencyRendererPayload;
- (NSString)userTransparencyRendererURL;
- (UILabel)errorLabel;
- (UINavigationBar)transparencyNavBar;
- (UserTransparencyViewController)initWithUserTransparencyDetails:(id)a3;
- (UserTransparencyViewControllerDelegate)delegate;
- (WKWebView)myUserPrivacyWebView;
- (id)normalizeChineseLanguage:(id)a3;
- (void)_closeViewController:(id)a3;
- (void)_commonInit;
- (void)_hideErrorMessage;
- (void)_reportUserTransparencyViewControllerEventWithType:(id)a3 withCompletionHandler:(id)a4;
- (void)_showErrorMessage:(id)a3;
- (void)errorDelegate;
- (void)immediatelyLoadViewControllerBeforeNetworkRequest;
- (void)loadWebView;
- (void)presentViewDelegate;
- (void)requestUserTransparencyDetailsWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorLabel:(id)a3;
- (void)setIsiPad:(BOOL)a3;
- (void)setMyUserPrivacyWebView:(id)a3;
- (void)setTransparencyNavBar:(id)a3;
- (void)setUserTransparencyDetails:(id)a3;
- (void)setUserTransparencyDetailsUnavailableMessage:(id)a3;
- (void)setUserTransparencyRendererPayload:(id)a3;
- (void)setUserTransparencyRendererURL:(id)a3;
- (void)setUserTransparencyResponseData:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation UserTransparencyViewController

- (UserTransparencyViewController)initWithUserTransparencyDetails:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UserTransparencyViewController;
  v5 = [(UserTransparencyViewController *)&v10 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(UserTransparencyViewController *)v5 setUserTransparencyDetails:v4];
    [(UserTransparencyViewController *)v6 setIsiPad:MGGetBoolAnswer()];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__UserTransparencyViewController_initWithUserTransparencyDetails___block_invoke;
    block[3] = &unk_2646CDC18;
    v9 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v6;
}

uint64_t __66__UserTransparencyViewController_initWithUserTransparencyDetails___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commonInit];
}

- (void)_commonInit
{
  if (self->_userTransparencyDetails)
  {
    v3 = [NSString stringWithFormat:@"[%@]: The initWithUserTransparencyDetails passed in a non nil payload.", objc_opt_class()];
    _ADLog();

    [(UserTransparencyViewController *)self errorDelegate];
  }
  else
  {
    id v4 = [MEMORY[0x263F241D8] sharedInstance];
    [v4 loadIDs];

    v5 = [MEMORY[0x263F241C0] sharedInstance];
    self->_renderingStatusForPAPermission = [v5 isPersonalizedAdsEnabled];

    [(UserTransparencyViewController *)self immediatelyLoadViewControllerBeforeNetworkRequest];
    [(UserTransparencyViewController *)self presentViewDelegate];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__UserTransparencyViewController__commonInit__block_invoke;
    v6[3] = &unk_2646CDC40;
    v6[4] = self;
    [(UserTransparencyViewController *)self requestUserTransparencyDetailsWithCompletionHandler:v6];
  }
}

void __45__UserTransparencyViewController__commonInit__block_invoke(uint64_t a1)
{
  v2 = [NSString stringWithFormat:@"Connection to UserTransparencyViewController established with TransparencyDetailsView framework."];
  _ADLog();

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__UserTransparencyViewController__commonInit__block_invoke_2;
  block[3] = &unk_2646CDC18;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __45__UserTransparencyViewController__commonInit__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadWebView];
}

- (void)requestUserTransparencyDetailsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F24230] sharedInstance];
  v6 = [MEMORY[0x263F241C0] sharedInstance];
  v7 = [v6 localeIdentifier];
  v8 = [v6 localeIdentifier];
  int v9 = [v8 hasPrefix:@"zh"];

  if (v9)
  {
    objc_super v10 = [v6 localeIdentifier];
    uint64_t v11 = [(UserTransparencyViewController *)self normalizeChineseLanguage:v10];

    v7 = (void *)v11;
  }
  v12 = [MEMORY[0x263F24230] workQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke;
  v17[3] = &unk_2646CDC90;
  id v18 = v6;
  id v19 = v7;
  id v20 = v5;
  v21 = self;
  id v22 = v4;
  id v13 = v4;
  id v14 = v5;
  id v15 = v7;
  id v16 = v6;
  [v12 addOperationWithBlock:v17];
}

void __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_2646CDC90;
  id v7 = v2;
  id v8 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v5;
  [v7 reloadStorefront:v6];
}

void __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F241D8] sharedInstance];
  id v3 = objc_alloc_init(MEMORY[0x263F24250]);
  uint64_t v4 = [v2 encryptedIDForClientType:3];
  [v3 setContentiAdID:v4];

  v5 = [v2 encryptedIDForClientType:5];
  [v3 setDPID:v5];

  v6 = [v2 encryptedIDForClientType:0];
  [v3 setIAdID:v6];

  id v7 = [*(id *)(a1 + 32) iTunesStorefront];
  [v3 setITunesStore:v7];

  [v3 setLocaleIdentifier:*(void *)(a1 + 40)];
  objc_msgSend(v3, "setLimitAdTracking:", objc_msgSend(*(id *)(a1 + 32), "isPersonalizedAdsEnabled") ^ 1);
  id v8 = [v2 activeDSIDRecord];
  id v9 = [v8 DSID];
  objc_msgSend(v3, "setIsSignedInToiTunes:", objc_msgSend(v9, "BOOLValue"));

  uint64_t v10 = *(void **)(a1 + 48);
  id v11 = [*(id *)(a1 + 32) defaultServerURL];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke_3;
  v13[3] = &unk_2646CDC68;
  v12 = *(void **)(a1 + 64);
  v13[4] = *(void *)(a1 + 56);
  id v14 = v12;
  [v10 handleRequest:v3 serverURL:v11 responseHandler:v13];
}

void __86__UserTransparencyViewController_requestUserTransparencyDetailsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v27 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [NSString stringWithFormat:@"[%@]: The requestUserTransparencyDetailsWithCompletionHandler failed with error %ld.", objc_opt_class(), objc_msgSend(v8, "code")];
    _ADLog();
  }
  else
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F24258]) initWithData:v27];
    [*(id *)(a1 + 32) setUserTransparencyResponseData:v10];

    id v11 = NSString;
    v12 = [*(id *)(a1 + 32) userTransparencyResponseData];
    id v13 = objc_msgSend(v12, "AD_jsonString");
    id v14 = [v11 stringWithFormat:@"Received response for ADUserTransparencyRequest: %@", v13];
    _ADLog();

    id v15 = [*(id *)(a1 + 32) userTransparencyResponseData];
    id v16 = [v15 transparencyDetails];
    v17 = [v16 transparencyRendererPayload];
    [*(id *)(a1 + 32) setUserTransparencyRendererPayload:v17];

    id v18 = [*(id *)(a1 + 32) userTransparencyResponseData];
    id v19 = [v18 transparencyDetails];
    id v20 = [v19 transparencyRendererURL];
    [*(id *)(a1 + 32) setUserTransparencyRendererURL:v20];

    v21 = [*(id *)(a1 + 32) userTransparencyResponseData];
    id v22 = [v21 transparencyDetails];
    v23 = [v22 transparencyDetailsUnavailableMessage];
    [*(id *)(a1 + 32) setUserTransparencyDetailsUnavailableMessage:v23];

    v24 = NSString;
    id v9 = [*(id *)(a1 + 32) userTransparencyRendererPayload];
    v25 = [v24 stringWithFormat:@"The privacy data key being used is: %@.", v9];
    _ADLog();
  }
  uint64_t v26 = *(void *)(a1 + 40);
  if (v26) {
    (*(void (**)(uint64_t, id))(v26 + 16))(v26, v8);
  }
}

- (void)presentViewDelegate
{
  id v3 = [(UserTransparencyViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(UserTransparencyViewController *)self delegate];
    [v5 userTransparencyViewControllerDidLoad:self];
  }
  [(UserTransparencyViewController *)self _reportUserTransparencyViewControllerEventWithType:@"PrivacyUserTransparencyDidAppear" withCompletionHandler:0];
}

- (void)errorDelegate
{
  id v3 = [(UserTransparencyViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(UserTransparencyViewController *)self delegate];
    v5 = [MEMORY[0x263F087E8] errorWithDomain:@"UserTransparencyViewControllerErrorDomain" code:0 userInfo:&unk_26D73D2E0];
    [v6 userTransparencyViewController:self didFailWithError:v5];
  }
}

- (void)_showErrorMessage:(id)a3
{
  id v26 = a3;
  [(UIActivityIndicatorView *)self->activityIndicator stopAnimating];
  char v4 = [(UserTransparencyViewController *)self errorLabel];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1C768]);
    id v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(UserTransparencyViewController *)self setErrorLabel:v6];

    id v7 = [(UserTransparencyViewController *)self errorLabel];
    [v7 setNumberOfLines:0];

    id v8 = [MEMORY[0x263F1C550] labelColor];
    id v9 = [(UserTransparencyViewController *)self errorLabel];
    [v9 setTextColor:v8];

    uint64_t v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    id v11 = [(UserTransparencyViewController *)self errorLabel];
    [v11 setFont:v10];

    v12 = [(UserTransparencyViewController *)self errorLabel];
    [v12 setAdjustsFontForContentSizeCategory:1];

    id v13 = [(UserTransparencyViewController *)self errorLabel];
    [v13 setTextAlignment:1];

    id v14 = [(UserTransparencyViewController *)self errorLabel];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v15 = [(UserTransparencyViewController *)self view];
    id v16 = [(UserTransparencyViewController *)self errorLabel];
    [v15 addSubview:v16];

    v17 = [(UserTransparencyViewController *)self errorLabel];
    id v18 = _NSDictionaryOfVariableBindings(&cfstr_Errorlabel.isa, v17, 0);
    id v19 = [(UserTransparencyViewController *)self view];
    id v20 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-20-[errorLabel]-20-|" options:0 metrics:0 views:v18];
    [v19 addConstraints:v20];

    v21 = [(UserTransparencyViewController *)self view];
    id v22 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-[errorLabel]-|" options:0 metrics:0 views:v18];
    [v21 addConstraints:v22];
  }
  if (!v26)
  {
    v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v26 = [v23 localizedStringForKey:@"Advertising information isn’t available right now. Try again later." value:&stru_26D73AD20 table:0];
  }
  v24 = [(UserTransparencyViewController *)self errorLabel];
  [v24 setText:v26];

  v25 = [(UserTransparencyViewController *)self errorLabel];
  [v25 setHidden:0];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  [(UIActivityIndicatorView *)self->activityIndicator stopAnimating];
  [(UserTransparencyViewController *)self _hideErrorMessage];
  [(UserTransparencyViewController *)self _reportUserTransparencyViewControllerEventWithType:@"PrivacyUserTransparencyDidRenderTransparency" withCompletionHandler:0];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  [v6 removeFromSuperview];

  [(UserTransparencyViewController *)self _showErrorMessage:0];
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  [v6 removeFromSuperview];

  [(UserTransparencyViewController *)self _showErrorMessage:0];
}

- (void)_hideErrorMessage
{
  id v3 = [(UserTransparencyViewController *)self errorLabel];

  if (v3)
  {
    id v4 = [(UserTransparencyViewController *)self errorLabel];
    [v4 setHidden:1];
  }
}

- (void)_closeViewController:(id)a3
{
  id v4 = [(UserTransparencyViewController *)self presentingViewController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__UserTransparencyViewController__closeViewController___block_invoke;
  v5[3] = &unk_2646CDC18;
  v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];

  [(UserTransparencyViewController *)self _reportUserTransparencyViewControllerEventWithType:@"PrivacyUserTransparencyDidDisappear" withCompletionHandler:0];
}

void __55__UserTransparencyViewController__closeViewController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 userTransparencyViewControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)immediatelyLoadViewControllerBeforeNetworkRequest
{
  v105[3] = *MEMORY[0x263EF8340];
  if ([(UserTransparencyViewController *)self isiPad]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(UserTransparencyViewController *)self setModalPresentationStyle:v3];
  [(UserTransparencyViewController *)self setModalTransitionStyle:0];
  id v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
  id v5 = [(UserTransparencyViewController *)self view];
  [v5 setBackgroundColor:v4];

  [(UserTransparencyViewController *)self setEdgesForExtendedLayout:0];
  v100 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = objc_alloc_init(MEMORY[0x263F1C7E0]);
  [(UserTransparencyViewController *)self setTransparencyNavBar:v6];

  id v7 = [(UserTransparencyViewController *)self transparencyNavBar];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [(UserTransparencyViewController *)self transparencyNavBar];
  [v8 setTranslucent:0];

  id v9 = [(UserTransparencyViewController *)self transparencyNavBar];
  [v9 setAutoresizesSubviews:1];

  uint64_t v10 = [(UserTransparencyViewController *)self transparencyNavBar];
  [v10 setAutoresizingMask:18];

  id v11 = [(UserTransparencyViewController *)self view];
  v12 = [(UserTransparencyViewController *)self transparencyNavBar];
  [v11 addSubview:v12];

  v86 = (void *)MEMORY[0x263F08938];
  v98 = [(UserTransparencyViewController *)self transparencyNavBar];
  v94 = [v98 topAnchor];
  v96 = [(UserTransparencyViewController *)self view];
  v92 = [v96 topAnchor];
  v90 = [v94 constraintEqualToAnchor:v92];
  v105[0] = v90;
  v88 = [(UserTransparencyViewController *)self transparencyNavBar];
  v84 = [v88 rightAnchor];
  id v13 = [(UserTransparencyViewController *)self view];
  id v14 = [v13 rightAnchor];
  id v15 = [v84 constraintEqualToAnchor:v14];
  v105[1] = v15;
  id v16 = [(UserTransparencyViewController *)self transparencyNavBar];
  v17 = [v16 leftAnchor];
  id v18 = [(UserTransparencyViewController *)self view];
  id v19 = [v18 leftAnchor];
  id v20 = [v17 constraintEqualToAnchor:v19];
  v105[2] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:3];
  [v86 activateConstraints:v21];

  id v22 = objc_alloc(MEMORY[0x263F1C800]);
  v23 = [v100 localizedStringForKey:@"Ad Targeting Information" value:&stru_26D73AD20 table:0];
  v24 = (void *)[v22 initWithTitle:v23];

  [v24 setStyle:0];
  id v25 = objc_alloc(MEMORY[0x263F1C468]);
  id v26 = [v100 localizedStringForKey:@"Done" value:&stru_26D73AD20 table:0];
  uint64_t v27 = [v25 initWithTitle:v26 style:2 target:self action:sel__closeViewController_];

  v97 = (void *)v27;
  [v24 setRightBarButtonItem:v27];
  v99 = v24;
  v104 = v24;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v104 count:1];
  v29 = [(UserTransparencyViewController *)self transparencyNavBar];
  [v29 setItems:v28];

  v30 = [MEMORY[0x263F1CB00] currentTraitCollection];
  uint64_t v31 = [v30 userInterfaceStyle];

  if (v31 == 2)
  {
    id v32 = objc_alloc_init(MEMORY[0x263F1C7E8]);
    [v32 configureWithOpaqueBackground];
    v33 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [v32 setBackgroundColor:v33];

    uint64_t v102 = *MEMORY[0x263F1C240];
    v34 = [MEMORY[0x263F1C550] whiteColor];
    v103 = v34;
    v35 = [NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
    [v32 setTitleTextAttributes:v35];

    v36 = [(UserTransparencyViewController *)self transparencyNavBar];
    [v36 setStandardAppearance:v32];

    v37 = [(UserTransparencyViewController *)self transparencyNavBar];
    [v37 setScrollEdgeAppearance:v32];

    v38 = [(UserTransparencyViewController *)self transparencyNavBar];
    [v38 setTranslucent:0];
  }
  id v39 = objc_alloc_init(MEMORY[0x263F1FA38]);
  v40 = NSString;
  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[UserTransparencyViewController renderingStatusForPAPermission](self, "renderingStatusForPAPermission"));
  v95 = [v40 stringWithFormat:@"        window.transparency = {            isLocationPermissionGranted: () => { return 0 }, isPAEnabled: () => { return %@ }         }    ", v41];

  v91 = v39;
  v93 = (void *)[objc_alloc(MEMORY[0x263F1FA40]) initWithSource:v95 injectionTime:0 forMainFrameOnly:1];
  [v39 addUserScript:v93];
  id v89 = objc_alloc_init(MEMORY[0x263F1FA60]);
  [v89 setUserContentController:v39];
  id v42 = objc_alloc(MEMORY[0x263F1FA58]);
  v43 = objc_msgSend(v42, "initWithFrame:configuration:", v89, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(UserTransparencyViewController *)self setMyUserPrivacyWebView:v43];

  v44 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];

  v45 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  [v45 setNavigationDelegate:self];

  v46 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  [v46 setOpaque:0];

  v47 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  v48 = [v47 scrollView];
  [v48 setContentInsetAdjustmentBehavior:2];

  v49 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  [v49 setAutoresizesSubviews:1];

  v50 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  [v50 setAutoresizingMask:18];

  v51 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  activityIndicator = self->activityIndicator;
  self->activityIndicator = v51;

  v53 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  [v53 frame];
  double v55 = v54 * 0.5;
  v56 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  [v56 frame];
  double v58 = v57 * 0.5;
  v59 = [(UserTransparencyViewController *)self transparencyNavBar];
  [v59 frame];
  -[UIActivityIndicatorView setCenter:](self->activityIndicator, "setCenter:", v55, v58 - v60);

  [(UIActivityIndicatorView *)self->activityIndicator setAutoresizingMask:45];
  [(UIActivityIndicatorView *)self->activityIndicator startAnimating];
  v61 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  [v61 addSubview:self->activityIndicator];

  v62 = [(UserTransparencyViewController *)self view];
  v63 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  [v62 addSubview:v63];

  v76 = (void *)MEMORY[0x263F08938];
  v87 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  v83 = [v87 topAnchor];
  v85 = [(UserTransparencyViewController *)self transparencyNavBar];
  v82 = [v85 bottomAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v101[0] = v81;
  v80 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  v78 = [v80 bottomAnchor];
  v79 = [(UserTransparencyViewController *)self view];
  v77 = [v79 bottomAnchor];
  v75 = [v78 constraintEqualToAnchor:v77];
  v101[1] = v75;
  v74 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  v64 = [v74 rightAnchor];
  v65 = [(UserTransparencyViewController *)self view];
  v66 = [v65 rightAnchor];
  v67 = [v64 constraintEqualToAnchor:v66];
  v101[2] = v67;
  v68 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
  v69 = [v68 leftAnchor];
  v70 = [(UserTransparencyViewController *)self view];
  v71 = [v70 leftAnchor];
  v72 = [v69 constraintEqualToAnchor:v71];
  v101[3] = v72;
  v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:4];
  [v76 activateConstraints:v73];
}

- (void)loadWebView
{
  uint64_t v3 = [(UserTransparencyViewController *)self userTransparencyRendererURL];

  if (v3)
  {
    id v4 = NSURL;
    id v5 = [(UserTransparencyViewController *)self userTransparencyRendererURL];
    id v12 = [v4 URLWithString:v5];

    id v6 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v12];
    [v6 setHTTPMethod:@"POST"];
    id v7 = [(UserTransparencyViewController *)self userTransparencyRendererPayload];
    id v8 = [v7 dataUsingEncoding:4];
    [v6 setHTTPBody:v8];

    id v9 = [(UserTransparencyViewController *)self myUserPrivacyWebView];
    id v10 = (id)[v9 loadRequest:v6];
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"[%@]: We don't have the URL for the rendering server.", objc_opt_class()];
    _ADLog();

    [(UserTransparencyViewController *)self _showErrorMessage:0];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void))a5;
  id v9 = [v7 request];
  id v10 = [v9 URL];

  id v11 = NSString;
  uint64_t v12 = objc_opt_class();
  id v13 = [v10 absoluteString];
  id v14 = [v11 stringWithFormat:@"%@ The URL for the link generated by the rendering server is: %@.", v12, v13];
  _ADLog();

  id v15 = [MEMORY[0x263F08BA0] componentsWithURL:v10 resolvingAgainstBaseURL:0];
  id v16 = [v15 path];
  v17 = [v16 lastPathComponent];
  if ([v17 rangeOfString:@"prefs:root=Privacy&path=ADVERTISING" options:1] != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_7;
  }
  id v18 = [v15 path];
  id v19 = [v18 lastPathComponent];
  if ([v19 rangeOfString:@"App-Prefs:root=Privacy&path=ADVERTISING" options:1] != 0x7FFFFFFFFFFFFFFFLL)
  {

LABEL_7:
    goto LABEL_8;
  }
  [v10 absoluteString];
  id v20 = v15;
  v21 = v8;
  v23 = id v22 = v7;
  char v32 = [v23 containsString:@"Privacy_Advertising"];

  id v7 = v22;
  id v8 = v21;
  id v15 = v20;

  if (v32)
  {
LABEL_8:
    v24 = [MEMORY[0x263F01880] defaultWorkspace];
    id v25 = [NSURL URLWithString:@"prefs:root=Privacy&path=ADVERTISING"];
    [v24 openSensitiveURL:v25 withOptions:MEMORY[0x263EFFA78]];

    id v26 = [(UserTransparencyViewController *)self presentingViewController];
    uint64_t v27 = v26;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __90__UserTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
    v34[3] = &unk_2646CDC18;
    v34[4] = self;
    v28 = v34;
LABEL_9:
    [v26 dismissViewControllerAnimated:1 completion:v28];

    [(UserTransparencyViewController *)self _reportUserTransparencyViewControllerEventWithType:@"PrivacyUserTransparencyDidLinkOut" withCompletionHandler:0];
    [(UserTransparencyViewController *)self _reportUserTransparencyViewControllerEventWithType:@"PrivacyUserTransparencyDidDisappear" withCompletionHandler:0];
    v8[2](v8, 0);
    goto LABEL_10;
  }
  if (![v7 navigationType])
  {
    v29 = [MEMORY[0x263F1C408] sharedApplication];
    v30 = [v7 request];
    uint64_t v31 = [v30 URL];
    [v29 openURL:v31 options:MEMORY[0x263EFFA78] completionHandler:&__block_literal_global];

    id v26 = [(UserTransparencyViewController *)self presentingViewController];
    uint64_t v27 = v26;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __90__UserTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_3;
    v33[3] = &unk_2646CDC18;
    v33[4] = self;
    v28 = v33;
    goto LABEL_9;
  }
  v8[2](v8, 1);
LABEL_10:
}

void __90__UserTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 userTransparencyViewControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

void __90__UserTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1, int a2)
{
  v2 = @"NOT";
  if (a2) {
    v2 = @"successfully";
  }
  id v3 = [NSString stringWithFormat:@"This is an external link. Launch it in Safari and not our WebView. The link can %@ be opened", v2];
  _ADLog();
}

void __90__UserTransparencyViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 userTransparencyViewControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)_reportUserTransparencyViewControllerEventWithType:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F24230] workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __107__UserTransparencyViewController__reportUserTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke;
  v10[3] = &unk_2646CDD00;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 addOperationWithBlock:v10];
}

void __107__UserTransparencyViewController__reportUserTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F241C0] sharedInstance];
  char v3 = [v2 defaultServerURL];
  id v4 = [NSString stringWithFormat:@"Requesting ADLogAnalyticsRequest with ADAnalyticsEvent for %@ event to: %@", *(void *)(a1 + 32), v3];
  _ADLog();

  id v5 = [MEMORY[0x263F24230] sharedInstance];
  id v6 = [MEMORY[0x263F241D8] sharedInstance];
  id v7 = objc_alloc_init(MEMORY[0x263F241E8]);
  [v7 setBundleID:*MEMORY[0x263F24270]];
  id v8 = [v6 encryptedIDForClientType:3];
  [v7 setContentiAdID:v8];

  id v9 = [v6 encryptedIDForClientType:5];
  [v7 setDPID:v9];

  id v10 = [v6 encryptedIDForClientType:0];
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
  id v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v11, 0);
  [v7 setEvents:v15];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __107__UserTransparencyViewController__reportUserTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke_2;
  v18[3] = &unk_2646CDCD8;
  id v16 = *(id *)(a1 + 40);
  id v19 = v7;
  id v20 = v16;
  id v17 = v7;
  [v5 handleRequest:v17 serverURL:v3 responseHandler:v18];
}

void __107__UserTransparencyViewController__reportUserTransparencyViewControllerEventWithType_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
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
    id v10 = NSString;
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

- (id)normalizeChineseLanguage:(id)a3
{
  id v3 = a3;
  id v4 = @"zh_HK";
  if (([v3 hasPrefix:@"zh_HK"] & 1) == 0)
  {
    id v4 = @"zh_TW";
    if (([v3 hasPrefix:@"zh_TW"] & 1) == 0)
    {
      if ([v3 hasPrefix:@"zh-Hant"])
      {
        id v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v3];
        id v6 = [v5 regionCode];

        if ([v6 isEqualToString:@"HK"]) {
          id v7 = @"zh_HK";
        }
        else {
          id v7 = @"zh_TW";
        }
        id v4 = v7;
      }
      else
      {
        id v4 = @"zh_CN";
      }
    }
  }

  return v4;
}

- (UserTransparencyViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)userTransparencyDetails
{
  return self->_userTransparencyDetails;
}

- (void)setUserTransparencyDetails:(id)a3
{
}

- (ADUserTransparencyResponse)userTransparencyResponseData
{
  return self->_userTransparencyResponseData;
}

- (void)setUserTransparencyResponseData:(id)a3
{
}

- (NSString)userTransparencyDetailsUnavailableMessage
{
  return self->_userTransparencyDetailsUnavailableMessage;
}

- (void)setUserTransparencyDetailsUnavailableMessage:(id)a3
{
}

- (NSString)userTransparencyRendererPayload
{
  return self->_userTransparencyRendererPayload;
}

- (void)setUserTransparencyRendererPayload:(id)a3
{
}

- (NSString)userTransparencyRendererURL
{
  return self->_userTransparencyRendererURL;
}

- (void)setUserTransparencyRendererURL:(id)a3
{
}

- (BOOL)renderingStatusForPAPermission
{
  return self->_renderingStatusForPAPermission;
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
}

- (UINavigationBar)transparencyNavBar
{
  return self->_transparencyNavBar;
}

- (void)setTransparencyNavBar:(id)a3
{
}

- (WKWebView)myUserPrivacyWebView
{
  return self->_myUserPrivacyWebView;
}

- (void)setMyUserPrivacyWebView:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myUserPrivacyWebView, 0);
  objc_storeStrong((id *)&self->_transparencyNavBar, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_userTransparencyRendererURL, 0);
  objc_storeStrong((id *)&self->_userTransparencyRendererPayload, 0);
  objc_storeStrong((id *)&self->_userTransparencyDetailsUnavailableMessage, 0);
  objc_storeStrong((id *)&self->_userTransparencyResponseData, 0);
  objc_storeStrong((id *)&self->_userTransparencyDetails, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->activityIndicator, 0);
}

@end