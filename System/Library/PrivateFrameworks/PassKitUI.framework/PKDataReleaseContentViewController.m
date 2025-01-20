@interface PKDataReleaseContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldShowPhysicalButton;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (PKDataReleaseContentViewController)initWithRequest:(id)a3 delegate:(id)a4;
- (id)_compactNavigationController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configureFooterViewConfirmationTitle;
- (void)_finishedRemovingDoublePressCredentialWithError:(id)a3;
- (void)_reloadMerchantHeader;
- (void)_startEvaluationWithExternalizedContext:(id)a3;
- (void)_startInitialEvaluation;
- (void)_updateDataReleaseConfiguration;
- (void)_updateMerchantHeaderView:(id)a3 animated:(BOOL)a4;
- (void)_updatePhysicalButtonState;
- (void)_updatePreferredContentSize;
- (void)_updateSeparators;
- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4;
- (void)authorizationFooterViewPasscodeButtonPressed:(id)a3;
- (void)dataReleaseCompletedWithError:(id)a3;
- (void)dataReleaseHeaderDidTapDismiss;
- (void)dealloc;
- (void)dismissPasscodeViewController;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)presentPasscodeToExitLockout;
- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5;
- (void)setIdleTimerDisabled:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKDataReleaseContentViewController

- (PKDataReleaseContentViewController)initWithRequest:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    goto LABEL_12;
  }
  v43.receiver = self;
  v43.super_class = (Class)PKDataReleaseContentViewController;
  v9 = [(PKDataReleaseContentViewController *)&v43 init];
  self = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeWeak((id *)&self->_delegate, v8);
    v10 = (PKAuthenticator *)objc_alloc_init(MEMORY[0x1E4F88108]);
    authenticator = self->_authenticator;
    self->_authenticator = v10;

    [(PKAuthenticator *)self->_authenticator setDelegate:self];
    v12 = [v7 releasedData];
    v13 = [v12 elements];
    id v41 = 0;
    id v42 = 0;
    id v40 = 0;
    PKISO180135AcceptedFieldsFromElements(v13, 0, &v42, &v41, &v40);
    id v14 = v42;
    id v35 = v42;
    id v15 = v41;
    id v34 = v41;
    id v16 = v40;
    id v17 = v40;

    objc_storeStrong((id *)&self->_intentRetainElements, v14);
    objc_storeStrong((id *)&self->_intentDoNotRetainElements, v15);
    objc_storeStrong((id *)&self->_intentDisplayOnlyElements, v16);
    v18 = [v7 releasedData];
    dataToRelease = self->_dataToRelease;
    self->_dataToRelease = v18;

    v20 = [[PKPaymentTransactionIconGenerator alloc] initWithCache:1 scale:PKUIScreenScale()];
    iconGenerator = self->_iconGenerator;
    self->_iconGenerator = v20;

    v22 = [v7 iconData];

    if (v22)
    {
      id v23 = objc_alloc(MEMORY[0x1E4FB1818]);
      v24 = objc_msgSend(v7, "iconData", v34, v35);
      v25 = (UIImage *)[v23 initWithData:v24];
      merchantIcon = self->_merchantIcon;
      self->_merchantIcon = v25;

      BOOL v27 = self->_merchantIcon != 0;
    }
    else
    {
      BOOL v27 = 0;
    }
    objc_initWeak(&location, self);
    v28 = objc_alloc_init(PKDataReleaseEntityResolver);
    entityResolver = self->_entityResolver;
    self->_entityResolver = v28;

    v30 = self->_entityResolver;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke;
    v36[3] = &unk_1E59DBDB0;
    objc_copyWeak(&v37, &location);
    BOOL v38 = v27;
    [(PKDataReleaseEntityResolver *)v30 resolveEntityForRequest:v7 completion:v36];
    if (!PKIdentityPresentmentV2Enabled()) {
      goto LABEL_9;
    }
    [(PKDataReleaseContentViewController *)self _updateDataReleaseConfiguration];
    v31 = [(PKIdentityDataReleaseConfiguration *)self->_dataReleaseConfiguration recognizedElements];
    if ([v31 count])
    {
      [(PKTransactionReleasedData *)self->_dataToRelease setElements:v31];

LABEL_9:
      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);

      goto LABEL_10;
    }

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

LABEL_12:
    v32 = 0;
    goto LABEL_13;
  }
LABEL_10:
  self = self;
  v32 = self;
LABEL_13:

  return v32;
}

void __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_2;
  block[3] = &unk_1E59CFB30;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  char v8 = *(unsigned char *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v7);
}

void __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v4 = WeakRetained[142];
    if (v4)
    {
      v5 = [*(id *)(a1 + 32) displayName];
      id v6 = [v4 displayName];
      id v7 = v5;
      id v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
        int v10 = 0;
      }
      else
      {
        int v10 = 1;
        if (v7 && v8) {
          int v10 = [v7 isEqualToString:v8] ^ 1;
        }
      }
    }
    else
    {
      int v10 = 0;
    }
    objc_storeStrong(v3 + 142, *(id *)(a1 + 32));
    if ([*(id *)(a1 + 32) isValid])
    {
      id v11 = objc_loadWeakRetained(v3 + 124);
      [v11 dataReleaseContentViewController:v3 didResolveToMerchant:*(void *)(a1 + 32)];
    }
    if (*(unsigned char *)(a1 + 48))
    {
      if (!v10) {
        goto LABEL_20;
      }
    }
    else
    {
      id v12 = v3[141];
      id v13 = v3[139];
      uint64_t v14 = *(void *)(a1 + 32);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_3;
      v19[3] = &unk_1E59DBD88;
      v20 = v3;
      id v15 = v12;
      uint64_t v16 = objc_msgSend(v13, "iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:", v14, 0, 0, v19, 54.0, 54.0);
      id v17 = v3[141];
      v3[141] = (id)v16;

      if (v10)
      {
      }
      else
      {
        id v18 = v3[141];

        if (v15 == v18)
        {
LABEL_20:

          goto LABEL_21;
        }
      }
    }
    [v3 _reloadMerchantHeader];
    goto LABEL_20;
  }
LABEL_21:
}

void __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_4;
    v4[3] = &unk_1E59CA870;
    id v5 = *(id *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __63__PKDataReleaseContentViewController_initWithRequest_delegate___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1128), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return [v2 _reloadMerchantHeader];
}

- (void)dealloc
{
  [(PKAuthenticator *)self->_authenticator invalidate];
  [(PKAuthenticator *)self->_authenticator setDelegate:0];
  [(PKDataReleaseContentViewController *)self setIdleTimerDisabled:0];
  accessControl = self->_accessControl;
  if (accessControl) {
    CFRelease(accessControl);
  }
  [(LAContext *)self->_localAuthenticationContext invalidate];
  id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v4, "pkui_resetSharedRootAuthenticationContext");

  v5.receiver = self;
  v5.super_class = (Class)PKDataReleaseContentViewController;
  [(PKDataReleaseContentViewController *)&v5 dealloc];
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  idleTimerAssertion = self->_idleTimerAssertion;
  if (a3)
  {
    if (!idleTimerAssertion)
    {
      objc_super v5 = [[PKIdleTimerAssertion alloc] initWithReason:@"ID Presentment"];
      id v6 = self->_idleTimerAssertion;
      self->_idleTimerAssertion = v5;
    }
    id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    idleTimer = self->_idleTimer;
    self->_idleTimer = v7;

    v9 = self->_idleTimer;
    dispatch_time_t v10 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    id v11 = self->_idleTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __59__PKDataReleaseContentViewController_setIdleTimerDisabled___block_invoke;
    handler[3] = &unk_1E59CA7D0;
    handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume((dispatch_object_t)self->_idleTimer);
  }
  else
  {
    [(PKIdleTimerAssertion *)idleTimerAssertion invalidate];
    id v12 = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0;

    id v13 = self->_idleTimer;
    if (v13)
    {
      dispatch_source_cancel(v13);
      uint64_t v14 = self->_idleTimer;
      self->_idleTimer = 0;
    }
  }
}

uint64_t __59__PKDataReleaseContentViewController_setIdleTimerDisabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIdleTimerDisabled:0];
}

- (void)viewDidLoad
{
  v39.receiver = self;
  v39.super_class = (Class)PKDataReleaseContentViewController;
  [(PKDataReleaseContentViewController *)&v39 viewDidLoad];
  id v3 = [(PKDataReleaseContentViewController *)self view];
  id v4 = (void *)MEMORY[0x1E4FB1618];
  objc_super v5 = PKPassKitUIBundle();
  id v6 = [v4 colorNamed:@"color/sheetBackground" inBundle:v5 compatibleWithTraitCollection:0];

  [v3 setBackgroundColor:v6];
  if (PKIdentityPresentmentV2Enabled()) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 2;
  }
  id v8 = objc_alloc(MEMORY[0x1E4FB1D00]);
  double v9 = *MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v13 = (UITableView *)objc_msgSend(v8, "initWithFrame:style:", v7, *MEMORY[0x1E4F1DB28], v10, v11, v12);
  tableViewReleaseData = self->_tableViewReleaseData;
  self->_tableViewReleaseData = v13;

  id v15 = self->_tableViewReleaseData;
  uint64_t v16 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [(UITableView *)v15 setBackgroundColor:v16];

  [(UITableView *)self->_tableViewReleaseData setDelegate:self];
  [(UITableView *)self->_tableViewReleaseData setDataSource:self];
  [(UITableView *)self->_tableViewReleaseData registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"merchantCellIdentifier"];
  [(UITableView *)self->_tableViewReleaseData registerClass:objc_opt_class() forCellReuseIdentifier:@"dataReleaseElementsCellIdentifier"];
  [(UITableView *)self->_tableViewReleaseData registerClass:objc_opt_class() forCellReuseIdentifier:@"requestedDataCellIdentifier"];
  -[UITableView setContentInset:](self->_tableViewReleaseData, "setContentInset:", 0.0, 0.0, 0.0, 0.0);
  [(UITableView *)self->_tableViewReleaseData setScrollEnabled:0];
  id v17 = self->_tableViewReleaseData;
  id v18 = [MEMORY[0x1E4FB1618] clearColor];
  [(UITableView *)v17 setSeparatorColor:v18];

  [(UITableView *)self->_tableViewReleaseData _setBottomPadding:0.0];
  [v3 addSubview:self->_tableViewReleaseData];
  [(UITableView *)self->_tableViewReleaseData reloadData];
  v19 = [[PKDataReleaseHeader alloc] initWithDelegate:self];
  header = self->_header;
  self->_header = v19;

  [v3 addSubview:self->_header];
  v21 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  bottomSeparator = self->_bottomSeparator;
  self->_bottomSeparator = v21;

  id v23 = self->_bottomSeparator;
  v24 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
  [(UIView *)v23 setBackgroundColor:v24];

  [(UIView *)self->_bottomSeparator setClipsToBounds:0];
  [(UIView *)self->_bottomSeparator setAlpha:0.0];
  [v3 addSubview:self->_bottomSeparator];
  v25 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
  v26 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v25];
  footerMaterial = self->_footerMaterial;
  self->_footerMaterial = v26;

  [v3 addSubview:self->_footerMaterial];
  v28 = [[PKPaymentAuthorizationLayout alloc] initWithStyle:1 paymentRequest:0];
  v29 = -[PKPaymentAuthorizationFooterView initWithFrame:layout:]([PKPaymentAuthorizationFooterView alloc], "initWithFrame:layout:", v28, v9, v10, v11, v12);
  footerView = self->_footerView;
  self->_footerView = v29;

  [(PKPaymentAuthorizationFooterView *)self->_footerView setCompletionStyle:1];
  -[PKPaymentAuthorizationFooterView setUserIntentStyle:](self->_footerView, "setUserIntentStyle:", [MEMORY[0x1E4F88108] userIntentStyle]);
  [(PKPaymentAuthorizationFooterView *)self->_footerView setDelegate:self];
  v31 = self->_footerView;
  if (PKPearlIsAvailable()) {
    uint64_t v32 = 3;
  }
  else {
    uint64_t v32 = 0;
  }
  [(PKPaymentAuthorizationFooterView *)v31 setState:v32 string:0 animated:0];
  v33 = self->_footerView;
  id v34 = PKLocalizedIdentityString(&cfstr_PresentmentFoo_0.isa);
  [(PKPaymentAuthorizationFooterView *)v33 setBiometricConfirmationTitle:v34];

  id v35 = self->_footerView;
  v36 = PKLocalizedIdentityString(&cfstr_PresentmentFoo.isa);
  [(PKPaymentAuthorizationFooterView *)v35 setConfirmationTitle:v36];

  id v37 = self->_footerView;
  BOOL v38 = PKLocalizedIdentityString(&cfstr_PresentmentFoo_1.isa);
  [(PKPaymentAuthorizationFooterView *)v37 setAuthorizingTitle:v38];

  [(PKDataReleaseContentViewController *)self _configureFooterViewConfirmationTitle];
  [(PKPaymentAuthorizationFooterView *)self->_footerView setTranslatesAutoresizingMaskIntoConstraints:1];
  [(PKPaymentAuthorizationFooterView *)self->_footerView setHidesSeparatorView:1];
  [(PKPaymentAuthorizationFooterView *)self->_footerView setPreventPasscodeFallbackForBiometricFailure:1];
  [v3 addSubview:self->_footerView];
  [(PKDataReleaseContentViewController *)self _startInitialEvaluation];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKDataReleaseContentViewController;
  [(PKDataReleaseContentViewController *)&v4 viewWillAppear:a3];
  [(PKDataReleaseContentViewController *)self _updatePreferredContentSize];
}

- (void)viewDidAppear:(BOOL)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PKDataReleaseContentViewController;
  [(PKDataReleaseContentViewController *)&v21 viewDidAppear:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:*MEMORY[0x1E4F864A0] forKeyedSubscript:*MEMORY[0x1E4F86308]];
  [v4 setObject:*MEMORY[0x1E4F861B0] forKeyedSubscript:*MEMORY[0x1E4F86730]];
  int v5 = [(PKISO18013DataReleaseRequest *)self->_request isTrustedRelyingParty];
  char v6 = v5;
  if (v5) {
    uint64_t v7 = @"true";
  }
  else {
    uint64_t v7 = @"false";
  }
  [v4 setObject:v7 forKeyedSubscript:@"authenticatedTerminal"];
  if (PKLocationServicesEnabled()) {
    id v8 = @"true";
  }
  else {
    id v8 = @"false";
  }
  [v4 setObject:v8 forKeyedSubscript:@"locationSet"];
  if ((v6 & 1) == 0)
  {
    double v9 = [(PKISO18013DataReleaseRequest *)self->_request analyticsIdentifier];
    [v4 setObject:v9 forKeyedSubscript:@"relyingPartyID"];

    double v10 = [(PKISO18013DataReleaseRequest *)self->_request analyticsOrganizationName];
    [v4 setObject:v10 forKeyedSubscript:@"relyingPartyName"];
  }
  double v11 = [(PKISO18013DataReleaseRequest *)self->_request releasedData];
  double v12 = [v11 certificateData];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    BOOL v14 = [(NSArray *)self->_intentDisplayOnlyElements count]
       && ![(NSArray *)self->_intentRetainElements count]
       && [(NSArray *)self->_intentDoNotRetainElements count] == 0;
    [v4 setObject:@"tapToVerify" forKeyedSubscript:@"presentmentReaderType"];
    id v17 = PKAnalyticsReportDataTransferTypeDisplayOnly;
    if (!v14) {
      id v17 = &PKAnalyticsReportDataTransferTypeDataTransfer;
    }
    id v15 = *v17;
    uint64_t v16 = PKAnalyticsReportDataTransferTypeKey;
  }
  else
  {
    id v15 = @"other";
    uint64_t v16 = PKAnalyticsReportPresentmentReaderTypeKey;
  }
  [v4 setObject:v15 forKeyedSubscript:*v16];
  id v18 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v19 = *MEMORY[0x1E4F87058];
  v22[0] = *MEMORY[0x1E4F87010];
  v22[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v18 subjects:v20 sendEvent:v4];

  [(PKDataReleaseContentViewController *)self _updatePreferredContentSize];
  if ([(UITableView *)self->_tableViewReleaseData isScrollEnabled]) {
    [(UITableView *)self->_tableViewReleaseData flashScrollIndicators];
  }
  [(PKDataReleaseContentViewController *)self setIdleTimerDisabled:1];
  if (!self->_hasPlayedHaptics)
  {
    AudioServicesPlaySystemSound(0x487u);
    self->_hasPlayedHaptics = 1;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKDataReleaseContentViewController;
  [(PKDataReleaseContentViewController *)&v8 viewWillDisappear:a3];
  [(PKDataReleaseContentViewController *)self setIdleTimerDisabled:0];
  if ([(PKPaymentAuthorizationFooterView *)self->_footerView state] != 12
    && [(PKPaymentAuthorizationFooterView *)self->_footerView state] != 13)
  {
    id v4 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v5 = *MEMORY[0x1E4F87058];
    v11[0] = *MEMORY[0x1E4F87010];
    v11[1] = v5;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    uint64_t v9 = *MEMORY[0x1E4F862F8];
    double v10 = @"userCancelled";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v4 subjects:v6 sendEvent:v7];
  }
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKDataReleaseContentViewController;
  [(PKDataReleaseContentViewController *)&v9 viewWillLayoutSubviews];
  ++self->_layoutRecursionCounter;
  id v3 = [(PKDataReleaseContentViewController *)self view];
  [v3 bounds];
  [(PKDataReleaseContentViewController *)self _layoutWithBounds:"_layoutWithBounds:"];

  [(PKDataReleaseContentViewController *)self _updateSeparators];
  id v4 = [(PKDataReleaseContentViewController *)self _compactNavigationController];
  if (v4)
  {
    [(PKDataReleaseContentViewController *)self preferredContentSize];
    objc_msgSend(v4, "childViewControllerPreferredContentSizeForSize:isRoot:", 1);
    double v6 = v5;
    objc_msgSend(v4, "navigationControllerSizeForChildViewControllerPreferredContentSize:isRoot:", 1);
    objc_msgSend(v4, "childViewControllerSizeForNavigationControllerSize:");
    BOOL v8 = v6 - v7 >= PKUIPixelLength();
  }
  else
  {
    BOOL v8 = 1;
  }
  if (v8 != [(UITableView *)self->_tableViewReleaseData isScrollEnabled])
  {
    [(UITableView *)self->_tableViewReleaseData setScrollEnabled:v8];
    [(PKDataReleaseContentViewController *)self _updateSeparators];
  }
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKDataReleaseContentViewController;
  [(PKDataReleaseContentViewController *)&v4 viewDidLayoutSubviews];
  int64_t v3 = self->_layoutRecursionCounter - 1;
  self->_layoutRecursionCounter = v3;
  if (!v3) {
    [(PKDataReleaseContentViewController *)self _updatePreferredContentSize];
  }
}

- (void)_startInitialEvaluation
{
  uint64_t v3 = [(PKISO18013DataReleaseRequest *)self->_request externalizedAuthenticationContext];
  if (v3 && (objc_super v4 = (void *)v3, IsAvailable = PKUserIntentIsAvailable(), v4, IsAvailable))
  {
    double v6 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFTypeRef)*MEMORY[0x1E4F3B578], 0x40000000uLL, 0);
    SecAccessControlSetConstraints();
    self->_accessControl = v6;
    double v7 = (LAContext *)objc_alloc_init(MEMORY[0x1E4F30B50]);
    localAuthenticationContext = self->_localAuthenticationContext;
    self->_localAuthenticationContext = v7;

    [(LAContext *)self->_localAuthenticationContext setUiDelegate:self];
    objc_initWeak(&location, self);
    objc_super v9 = self->_localAuthenticationContext;
    accessControl = self->_accessControl;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__PKDataReleaseContentViewController__startInitialEvaluation__block_invoke;
    void v11[3] = &unk_1E59D6618;
    objc_copyWeak(&v12, &location);
    [(LAContext *)v9 evaluateAccessControl:accessControl operation:3 options:0 reply:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKDataReleaseContentViewController *)self _startEvaluationWithExternalizedContext:0];
  }
}

void __61__PKDataReleaseContentViewController__startInitialEvaluation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _finishedRemovingDoublePressCredentialWithError:v4];
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v7 = a5;
  if (a3 == 5) {
    [(PKDataReleaseContentViewController *)self _finishedRemovingDoublePressCredentialWithError:0];
  }
  (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CC08], 0);
}

- (void)_finishedRemovingDoublePressCredentialWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__PKDataReleaseContentViewController__finishedRemovingDoublePressCredentialWithError___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __86__PKDataReleaseContentViewController__finishedRemovingDoublePressCredentialWithError___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 1176);
  if (!v2) {
    return;
  }
  [v2 invalidate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1176);
  *(void *)(v3 + 1176) = 0;

  id v5 = *(const void **)(*(void *)(a1 + 32) + 1184);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(*(void *)(a1 + 32) + 1184) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = PKLogFacilityTypeGetObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)uint64_t v13 = 138412290;
      *(void *)&v13[4] = v6;
      objc_super v9 = "Finished cleaning double press with error: %@";
      double v10 = v7;
      uint32_t v11 = 12;
LABEL_9:
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, v9, v13, v11);
    }
  }
  else if (v8)
  {
    *(_WORD *)uint64_t v13 = 0;
    objc_super v9 = "Successfully finished cleaning double press";
    double v10 = v7;
    uint32_t v11 = 2;
    goto LABEL_9;
  }

  if (*(void *)(a1 + 40))
  {
    id v12 = 0;
  }
  else
  {
    id v12 = [*(id *)(*(void *)(a1 + 32) + 976) externalizedAuthenticationContext];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "setExternalizedAuthenticationContext:", 0, *(_OWORD *)v13);
  [*(id *)(a1 + 32) _startEvaluationWithExternalizedContext:v12];
}

- (void)_startEvaluationWithExternalizedContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_authenticating = 1;
  self->_isInBioLockout = 0;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F88110]) initWithPolicy:9];
  [v5 setExternalizedContext:v4];
  uint64_t v6 = PKLocalizedIdentityString(&cfstr_PresentmentFoo.isa);
  [v5 setPasscodeTitle:v6];

  id v7 = [(PKISO18013DataReleaseRequest *)self->_request authenticationACL];
  BOOL v8 = PKLogFacilityTypeGetObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "No custom ACL provided for data release", buf, 2u);
    }
    goto LABEL_12;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Using custom ACL for data release", buf, 2u);
  }

  v14[1] = 0;
  uint64_t v10 = SecAccessControlCreateFromData();
  uint64_t v11 = v10;
  if (!v10)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = 0;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Could not create access control ref from provided data with error %@", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  [v5 setAccessControlRef:v10];
  if (([MEMORY[0x1E4F88108] currentStateForAccessControl:v11] & 6) == 0) {
    [(PKPaymentAuthorizationFooterView *)self->_footerView setPreventBiometricStateFallbacks:1];
  }
LABEL_13:
  objc_initWeak((id *)buf, self);
  authenticator = self->_authenticator;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__PKDataReleaseContentViewController__startEvaluationWithExternalizedContext___block_invoke;
  v13[3] = &unk_1E59DBDD8;
  objc_copyWeak(v14, (id *)buf);
  [(PKAuthenticator *)authenticator evaluateRequest:v5 withCompletion:v13];
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __78__PKDataReleaseContentViewController__startEvaluationWithExternalizedContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__PKDataReleaseContentViewController__startEvaluationWithExternalizedContext___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __78__PKDataReleaseContentViewController__startEvaluationWithExternalizedContext___block_invoke_2(uint64_t a1)
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1144) = 0;
    switch([*(id *)(a1 + 32) result])
    {
      case 0:
        uint64_t v11 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Authentication successful.", buf, 2u);
        }

        id v12 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v13 = *MEMORY[0x1E4F87058];
        v60[0] = *MEMORY[0x1E4F87010];
        v60[1] = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
        uint64_t v58 = *MEMORY[0x1E4F86308];
        uint64_t v59 = *MEMORY[0x1E4F86360];
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        [v12 subjects:v14 sendEvent:v15];

        if ([*(id *)(a1 + 32) biometricMatch])
        {
          [MEMORY[0x1E4F88120] invokeSuccessFeedback];
          if (PKSystemApertureIsAvailable()) {
            uint64_t v16 = 10;
          }
          else {
            uint64_t v16 = 8;
          }
          [v3[127] setState:v16];
        }
        [v3[127] setState:11];
        id v37 = objc_loadWeakRetained(v3 + 124);
        BOOL v38 = [*(id *)(a1 + 32) credential];
        [v37 dataReleaseContentViewController:v3 didAuthorizeWithExternalAuthorizationData:v38 dataToRelease:v3[138]];

        break;
      case 1:
        uint64_t v17 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Authentication canceled by user.", buf, 2u);
        }

        id v18 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v19 = *MEMORY[0x1E4F87058];
        v57[0] = *MEMORY[0x1E4F87010];
        v57[1] = v19;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
        uint64_t v55 = *MEMORY[0x1E4F86308];
        uint64_t v56 = *MEMORY[0x1E4F86340];
        objc_super v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        [v18 subjects:v20 sendEvent:v21];

        [v3 _startEvaluationWithExternalizedContext:0];
        break;
      case 2:
      case 3:
        id v4 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Authentication canceled by app.", buf, 2u);
        }

        id v5 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v6 = *MEMORY[0x1E4F87058];
        v54[0] = *MEMORY[0x1E4F87010];
        v54[1] = v6;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
        uint64_t v52 = *MEMORY[0x1E4F86308];
        uint64_t v53 = *MEMORY[0x1E4F86338];
        BOOL v8 = (void *)MEMORY[0x1E4F1C9E8];
        BOOL v9 = &v53;
        uint64_t v10 = &v52;
        goto LABEL_27;
      case 4:
        v22 = [MEMORY[0x1E4F28F80] processInfo];
        id v23 = [v22 processName];
        int v24 = [v22 processIdentifier];
        v25 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v23;
          __int16 v47 = 2048;
          uint64_t v48 = v24;
          _os_log_impl(&dword_19F450000, v25, OS_LOG_TYPE_DEFAULT, "Authentication by %@[%ld] preempted by another process.", buf, 0x16u);
        }

        v26 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v27 = *MEMORY[0x1E4F87058];
        v44[0] = *MEMORY[0x1E4F87010];
        v44[1] = v27;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
        uint64_t v42 = *MEMORY[0x1E4F86308];
        uint64_t v43 = *MEMORY[0x1E4F86358];
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        [v26 subjects:v28 sendEvent:v29];

        v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKDataReleaseErrorDomain" code:1 userInfo:0];
        [v3 dataReleaseCompletedWithError:v30];

        goto LABEL_28;
      case 5:
        v31 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v31, OS_LOG_TYPE_DEFAULT, "Failed to authenticate", buf, 2u);
        }

        id v5 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v32 = *MEMORY[0x1E4F87058];
        v41[0] = *MEMORY[0x1E4F87010];
        v41[1] = v32;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
        uint64_t v39 = *MEMORY[0x1E4F86308];
        uint64_t v40 = *MEMORY[0x1E4F86348];
        BOOL v8 = (void *)MEMORY[0x1E4F1C9E8];
        BOOL v9 = &v40;
        uint64_t v10 = &v39;
        goto LABEL_27;
      case 6:
        v33 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v33, OS_LOG_TYPE_DEFAULT, "Authentication biolockout occured, prompting for passcode", buf, 2u);
        }

        [v3[127] setState:4];
        *((unsigned char *)v3 + 1146) = 1;
        [v3 _updatePhysicalButtonState];
        if (*((unsigned char *)v3 + 1145))
        {
          *((unsigned char *)v3 + 1145) = 0;
          [v3 presentPasscodeToExitLockout];
        }
        break;
      case 7:
        id v34 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v34, OS_LOG_TYPE_DEFAULT, "Authentication selected fallback - this is not supported", buf, 2u);
        }

        id v5 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v35 = *MEMORY[0x1E4F87058];
        v51[0] = *MEMORY[0x1E4F87010];
        v51[1] = v35;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
        uint64_t v49 = *MEMORY[0x1E4F86308];
        uint64_t v50 = *MEMORY[0x1E4F86338];
        BOOL v8 = (void *)MEMORY[0x1E4F1C9E8];
        BOOL v9 = &v50;
        uint64_t v10 = &v49;
LABEL_27:
        v36 = objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1, v39, v40);
        [v5 subjects:v7 sendEvent:v36];

        v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKDataReleaseErrorDomain" code:1 userInfo:0];
        [v3 dataReleaseCompletedWithError:v22];
LABEL_28:

        break;
      default:
        break;
    }
  }
}

- (BOOL)shouldShowPhysicalButton
{
  if (self->_isInBioLockout || [MEMORY[0x1E4F88108] userIntentStyle] != 1) {
    return 0;
  }
  if ([(PKAuthenticator *)self->_authenticator evaluationState] == 3) {
    return 1;
  }
  return [(PKPaymentAuthorizationFooterView *)self->_footerView state] == 3;
}

- (void)_updatePhysicalButtonState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained dataReleaseContentViewControllerDidChangePhysicalButtonState:self];
    id WeakRetained = v4;
  }
}

- (id)_compactNavigationController
{
  v2 = [(PKDataReleaseContentViewController *)self navigationController];
  id v3 = objc_msgSend(v2, "pkui_compactNavigationContainer");

  return v3;
}

- (void)_updatePreferredContentSize
{
  if (!self->_layoutRecursionCounter)
  {
    self->_isTemplateLayout = 1;
    id v3 = [(PKDataReleaseContentViewController *)self view];
    [v3 bounds];
    [(PKDataReleaseContentViewController *)self _layoutWithBounds:"_layoutWithBounds:"];
    double v5 = v4;
    double v7 = v6;

    self->_isTemplateLayout = 0;
    -[PKDataReleaseContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
  }
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[PKDataReleaseHeader sizeThatFits:](self->_header, "sizeThatFits:", a3.size.width, 1.79769313e308);
  double v9 = v8;
  -[UITableView sizeThatFits:](self->_tableViewReleaseData, "sizeThatFits:", width, 1.79769313e308);
  double v11 = v10;
  -[PKPaymentAuthorizationFooterView systemLayoutSizeFittingSize:](self->_footerView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  CGFloat v13 = v12;
  double v14 = PKUIPixelLength();
  if (!self->_isTemplateLayout)
  {
    double v23 = v11;
    remainder.origin.double x = x;
    memset(&slice, 0, sizeof(slice));
    remainder.origin.double y = y;
    remainder.size.double width = width;
    remainder.size.double height = height;
    -[UITableView setFrame:](self->_tableViewReleaseData, "setFrame:", x, y, width, height);
    id v15 = [(PKDataReleaseContentViewController *)self _compactNavigationController];
    uint64_t v16 = [v15 view];
    [v16 safeAreaInsets];
    CGFloat v18 = v17;

    if (v18 > 0.0)
    {
      v27.origin.double x = x;
      v27.origin.double y = y;
      v27.size.double width = width;
      v27.size.double height = height;
      CGRectDivide(v27, &slice, &remainder, v18, CGRectMaxYEdge);
    }
    CGFloat v19 = v9 + PKUIPixelLength();
    CGRectDivide(remainder, &slice, &remainder, v19, CGRectMinYEdge);
    -[PKDataReleaseHeader setFrame:](self->_header, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(remainder, &slice, &remainder, v13, CGRectMaxYEdge);
    -[PKPaymentAuthorizationFooterView setFrame:](self->_footerView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UIVisualEffectView setFrame:](self->_footerMaterial, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, v18 + slice.size.height);
    double v20 = PKUIPixelLength();
    CGRectDivide(remainder, &slice, &remainder, v20, CGRectMaxYEdge);
    -[UIView setFrame:](self->_bottomSeparator, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UITableView setContentInset:](self->_tableViewReleaseData, "setContentInset:", v9, 0.0, v13, 0.0);
    -[UITableView setVerticalScrollIndicatorInsets:](self->_tableViewReleaseData, "setVerticalScrollIndicatorInsets:", v9, 0.0, v13, 0.0);
    double v11 = v23;
  }
  double v21 = v9 + 0.0 + v11 + v13 + v14 * 2.0;
  double v22 = width;
  result.double height = v21;
  result.double width = v22;
  return result;
}

- (void)dataReleaseCompletedWithError:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  if (v4) {
    uint64_t v5 = 13;
  }
  else {
    uint64_t v5 = 12;
  }
  double v6 = [v4 domain];
  double v7 = @"PKDataReleaseErrorDomain";
  if (v6 == v7)
  {
  }
  else
  {
    double v8 = v7;
    if (!v6 || !v7)
    {

LABEL_13:
      double v10 = 0;
      double v11 = @"other";
      goto LABEL_14;
    }
    int v9 = [(__CFString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_13;
    }
  }
  switch([v4 code])
  {
    case 1:
      double v10 = PKLocalizedIdentityString(&cfstr_PresentmentFoo_3.isa);
      double v11 = @"authenticationFailed";
      break;
    case 2:
      double v10 = 0;
      double v11 = @"userCancelled";
      break;
    case 3:
      double v10 = PKLocalizedIdentityString(&cfstr_PresentmentFoo_2.isa);
      double v11 = @"transactionFailed";
      break;
    case 4:
      double v10 = PKLocalizedIdentityString(&cfstr_PresentmentFoo_2.isa);
      double v11 = @"sessionFailed";
      break;
    default:
      goto LABEL_13;
  }
LABEL_14:
  double v12 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v13 = *MEMORY[0x1E4F87058];
  v28[0] = *MEMORY[0x1E4F87010];
  v28[1] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  id v15 = @"failure";
  if (!v4) {
    id v15 = @"success";
  }
  uint64_t v16 = *MEMORY[0x1E4F86428];
  uint64_t v17 = *MEMORY[0x1E4F86838];
  v26[0] = *MEMORY[0x1E4F86308];
  v26[1] = v17;
  v27[0] = v16;
  v27[1] = v15;
  uint64_t v18 = *MEMORY[0x1E4F862F8];
  v26[2] = *MEMORY[0x1E4F86730];
  v26[3] = v18;
  v27[2] = v17;
  v27[3] = v11;
  CGFloat v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  [v12 subjects:v14 sendEvent:v19];

  footerView = self->_footerView;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__PKDataReleaseContentViewController_dataReleaseCompletedWithError___block_invoke;
  void v22[3] = &unk_1E59CB268;
  objc_copyWeak(&v24, &location);
  id v21 = v4;
  id v23 = v21;
  [(PKPaymentAuthorizationFooterView *)footerView setState:v5 string:v10 animated:1 withCompletion:v22];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __68__PKDataReleaseContentViewController_dataReleaseCompletedWithError___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PKDataReleaseContentViewController_dataReleaseCompletedWithError___block_invoke_2;
  v3[3] = &unk_1E59CB010;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);

  objc_destroyWeak(&v5);
}

void __68__PKDataReleaseContentViewController_dataReleaseCompletedWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 124);
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v3 dataReleaseContentViewController:v4 didFinishWithError:*(void *)(a1 + 32)];
    }
    else {
      [v4 dismissViewControllerAnimated:1 completion:0];
    }

    id WeakRetained = v4;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_configureFooterViewConfirmationTitle
{
  if (self->_footerView)
  {
    id v3 = PKLocalizedIdentityString(&cfstr_PresentmentFoo.isa);
    id v4 = [(PKISO18013DataReleaseRequest *)self->_request authenticationACL];
    if (v4)
    {
      uint64_t v5 = SecAccessControlCreateFromData();
      if (v5)
      {
        double v6 = (const void *)v5;
        if (([MEMORY[0x1E4F88108] currentStateForAccessControl:v5] & 8) != 0)
        {
          uint64_t v7 = PKLocalizedIdentityString(&cfstr_PresentmentFoo_4.isa);

          id v3 = (void *)v7;
        }
        CFRelease(v6);
      }
    }
    [(PKPaymentAuthorizationFooterView *)self->_footerView setConfirmationTitle:v3];
  }
}

- (void)_updateDataReleaseConfiguration
{
  if (PKIdentityPresentmentV2Enabled())
  {
    id v3 = [(PKMerchant *)self->_merchant displayName];
    if ([v3 length]) {
      [(PKMerchant *)self->_merchant displayName];
    }
    else {
    id v16 = [(PKISO18013DataReleaseRequest *)self->_request organizationName];
    }

    merchantIcon = self->_merchantIcon;
    if (merchantIcon)
    {
      uint64_t v5 = merchantIcon;
    }
    else
    {
      double v6 = PKUIScreenScale();
      PKIconForMerchant(0, 0, 0, 0, 54.0, 54.0, v6);
      uint64_t v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v7 = v5;
    double v8 = [_TtC9PassKitUI34PKIdentityDataReleaseConfiguration alloc];
    int v9 = [(PKISO18013DataReleaseRequest *)self->_request releasedData];
    double v10 = [v9 documentType];
    double v11 = [(PKISO18013DataReleaseRequest *)self->_request releasedData];
    double v12 = [v11 elements];
    uint64_t v13 = v7;
    double v14 = [(PKIdentityDataReleaseConfiguration *)v8 initWithDocumentType:v10 elements:v12 relyingPartyName:v16 relyingPartyLogo:[(UIImage *)v13 CGImage]];
    dataReleaseConfiguration = self->_dataReleaseConfiguration;
    self->_dataReleaseConfiguration = v14;
  }
}

- (void)_updateSeparators
{
  if ([(UITableView *)self->_tableViewReleaseData isScrollEnabled])
  {
    [(UITableView *)self->_tableViewReleaseData layoutIfNeeded];
    [(UITableView *)self->_tableViewReleaseData contentOffset];
    double v4 = v3;
    [(UITableView *)self->_tableViewReleaseData pkui_naturalRestingBounds];
    double v6 = v4 - v5;
    if (v4 - v5 > 4.0 || v6 <= 0.0)
    {
      header = self->_header;
      if (v6 <= 4.0) {
        double v8 = 0.0;
      }
      else {
        double v8 = 1.0;
      }
    }
    else
    {
      header = self->_header;
      double v8 = v6 * 0.25;
    }
    [(PKDataReleaseHeader *)header setBackgroundViewAlpha:v8];
    [(UITableView *)self->_tableViewReleaseData bounds];
    double v12 = v11;
    [(UITableView *)self->_tableViewReleaseData adjustedContentInset];
    double v14 = v12 - v13;
    [(UITableView *)self->_tableViewReleaseData adjustedContentInset];
    double v16 = v14 - v15;
    [(UITableView *)self->_tableViewReleaseData contentSize];
    double v18 = v17 - v6 - v16;
    bottomSeparator = self->_bottomSeparator;
    if (v18 <= 4.0 && v18 > 0.0)
    {
      double v9 = v18 * 0.25;
      double v19 = v18 * 0.25;
      goto LABEL_16;
    }
    if (v18 > 4.0)
    {
      double v9 = 1.0;
      double v19 = 1.0;
      goto LABEL_16;
    }
    double v9 = 0.0;
  }
  else
  {
    double v9 = 0.0;
    [(PKDataReleaseHeader *)self->_header setBackgroundViewAlpha:0.0];
    bottomSeparator = self->_bottomSeparator;
  }
  double v19 = 0.0;
LABEL_16:
  [(UIView *)bottomSeparator setAlpha:v19];
  footerMaterial = self->_footerMaterial;

  [(UIVisualEffectView *)footerMaterial setAlpha:v9];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (PKIdentityPresentmentV2Enabled())
  {
    double v8 = [v7 dequeueReusableCellWithIdentifier:@"dataReleaseElementsCellIdentifier" forIndexPath:v6];

    [v8 setDataReleaseConfiguration:self->_dataReleaseConfiguration];
  }
  else
  {
    double v8 = [v7 dequeueReusableCellWithIdentifier:@"requestedDataCellIdentifier" forIndexPath:v6];

    double v9 = [(PKMerchant *)self->_merchant displayName];
    if (![v9 length])
    {
      uint64_t v10 = [(PKISO18013DataReleaseRequest *)self->_request organizationName];

      double v9 = (void *)v10;
    }
    if ([(NSArray *)self->_intentRetainElements count])
    {
      if ([v9 length]) {
        PKLocalizedIdentityString(&cfstr_PresentmentDat.isa, &stru_1EF1B4C70.isa, v9);
      }
      else {
      double v11 = PKLocalizedIdentityString(&cfstr_PresentmentDat_0.isa);
      }
    }
    else
    {
      double v11 = 0;
    }
    if ([(NSArray *)self->_intentDoNotRetainElements count])
    {
      if ([v9 length]) {
        PKLocalizedIdentityString(&cfstr_PresentmentDat_1.isa, &stru_1EF1B4C70.isa, v9);
      }
      else {
      double v12 = PKLocalizedIdentityString(&cfstr_PresentmentDat_2.isa);
      }
    }
    else
    {
      double v12 = 0;
    }
    if ([(NSArray *)self->_intentDisplayOnlyElements count])
    {
      if ([v9 length]) {
        PKLocalizedIdentityString(&cfstr_PresentmentDat_3.isa, &stru_1EF1B4C70.isa, v9);
      }
      else {
      double v13 = PKLocalizedIdentityString(&cfstr_PresentmentDat_4.isa);
      }
    }
    else
    {
      double v13 = 0;
    }
    double v14 = PKLocalizedIdentityString(&cfstr_PresentmentDat_5.isa);
    [v8 setTitle:v14];

    [v8 setIntentRetainElements:self->_intentRetainElements];
    [v8 setIntentRetainTitle:v11];
    [v8 setIntentDoNotRetainElements:self->_intentDoNotRetainElements];
    [v8 setIntentDoNotRetainTitle:v12];
    [v8 setIntentDisplayOnlyElements:self->_intentDisplayOnlyElements];
    [v8 setIntentDisplayOnlyTitle:v13];
  }

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  if (PKIdentityPresentmentV2Enabled()) {
    goto LABEL_2;
  }
  id v6 = [(PKISO18013DataReleaseRequest *)self->_request rpIdentifier];
  if (v6)
  {
    id v7 = [(PKISO18013DataReleaseRequest *)self->_request organizationName];
    uint64_t v8 = [v7 length];

    if (!v8)
    {
LABEL_2:
      id v6 = 0;
      goto LABEL_6;
    }
    id v6 = [v5 dequeueReusableHeaderFooterViewWithIdentifier:@"merchantCellIdentifier"];
    [(PKDataReleaseContentViewController *)self _updateMerchantHeaderView:v6 animated:0];
  }
LABEL_6:

  return v6;
}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  return PKIdentityPresentmentV2Enabled() ^ 1;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)_reloadMerchantHeader
{
  [(PKDataReleaseContentViewController *)self _updateDataReleaseConfiguration];
  tableViewReleaseData = self->_tableViewReleaseData;
  void v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PKDataReleaseContentViewController__reloadMerchantHeader__block_invoke;
  v5[3] = &unk_1E59CA7D0;
  void v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PKDataReleaseContentViewController__reloadMerchantHeader__block_invoke_2;
  v4[3] = &unk_1E59CB6D8;
  [(UITableView *)tableViewReleaseData performBatchUpdates:v5 completion:v4];
}

void __59__PKDataReleaseContentViewController__reloadMerchantHeader__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 1000);
  id v2 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v1 reloadSections:v2 withRowAnimation:0];
}

uint64_t __59__PKDataReleaseContentViewController__reloadMerchantHeader__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreferredContentSize];
}

- (void)_updateMerchantHeaderView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  merchant = self->_merchant;
  id v7 = a3;
  id v11 = [(PKMerchant *)merchant displayName];
  if (![v11 length])
  {
    uint64_t v8 = [(PKISO18013DataReleaseRequest *)self->_request organizationName];

    id v11 = (id)v8;
  }
  double v9 = self->_merchantIcon;
  if (!v9)
  {
    double v10 = PKUIScreenScale();
    PKIconForMerchant(0, 0, 0, 0, 54.0, 54.0, v10);
    double v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  [v7 setTitle:v11];
  [v7 setImage:v9 animated:v4];
}

- (void)presentPasscodeToExitLockout
{
  objc_initWeak(&location, self);
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F88110]) initWithPolicy:1];
  [v3 setPasscodeOnly:1];
  BOOL v4 = PKLocalizedIdentityString(&cfstr_PresentmentFoo.isa);
  [v3 setPasscodeTitle:v4];

  authenticator = self->_authenticator;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDataReleaseContentViewController_presentPasscodeToExitLockout__block_invoke;
  v6[3] = &unk_1E59DBDD8;
  objc_copyWeak(&v7, &location);
  [(PKAuthenticator *)authenticator evaluateRequest:v3 withCompletion:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

void __66__PKDataReleaseContentViewController_presentPasscodeToExitLockout__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PKDataReleaseContentViewController_presentPasscodeToExitLockout__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __66__PKDataReleaseContentViewController_presentPasscodeToExitLockout__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if ([*(id *)(a1 + 32) result])
    {
      id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKDataReleaseErrorDomain" code:1 userInfo:0];
      [v4 dataReleaseCompletedWithError:v3];
    }
    else
    {
      [v4 _startEvaluationWithExternalizedContext:0];
    }
    id WeakRetained = v4;
  }
}

- (void)dataReleaseHeaderDidTapDismiss
{
  id v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v4 = *MEMORY[0x1E4F87058];
  v14[0] = *MEMORY[0x1E4F87010];
  v14[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v6 = *MEMORY[0x1E4F86380];
  uint64_t v7 = *MEMORY[0x1E4F86120];
  v12[0] = *MEMORY[0x1E4F86308];
  v12[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F862C8];
  v13[0] = v6;
  v13[1] = v8;
  v12[2] = *MEMORY[0x1E4F86730];
  v13[2] = *MEMORY[0x1E4F861B0];
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  [v3 subjects:v5 sendEvent:v9];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKDataReleaseErrorDomain" code:2 userInfo:0];
    [WeakRetained dataReleaseContentViewController:self didFinishWithError:v11];
  }
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v7 = a3;
  p_BOOL lastFailureWasUnboundBiometric = &self->_lastFailureWasUnboundBiometric;
  BOOL lastFailureWasUnboundBiometric = self->_lastFailureWasUnboundBiometric;
  BOOL v10 = lastFailureWasUnboundBiometric;
  if (var0 == 2)
  {
    BOOL v10 = 0;
    BOOL *p_lastFailureWasUnboundBiometric = 0;
  }
  p_hasFailedBiometrics = &self->_lastFailureWasUnboundBiometric;
  if (var1 == 2) {
    goto LABEL_14;
  }
  if (var1 == 1 && !v10)
  {
    BOOL *p_lastFailureWasUnboundBiometric = 0;
    p_hasFailedBiometrics = &self->_hasFailedBiometrics;
LABEL_14:
    BOOL *p_hasFailedBiometrics = 1;
    if (PKPearlIsAvailable())
    {
      double v15 = PKLocalizedPearlString(&cfstr_GenericPearlFa.isa);
      AudioServicesPlaySystemSound(0x573u);
      unint64_t v12 = 13;
    }
    else
    {
      double v15 = 0;
      unint64_t v12 = 9;
    }
    goto LABEL_17;
  }
  unint64_t v12 = PKPaymentProgressStateBaseStateForAuthenticatorEvaluationState(var0, [(PKPaymentAuthorizationFooterView *)self->_footerView state], 0, 0);
  int IsAvailable = PKSystemApertureIsAvailable();
  uint64_t v14 = 10;
  if (((0x1E5u >> v12) & 1) == 0) {
    uint64_t v14 = v12;
  }
  if (v12 > 8) {
    uint64_t v14 = v12;
  }
  double v15 = 0;
  if (IsAvailable) {
    unint64_t v12 = v14;
  }
LABEL_17:
  if ((PKPearlIsAvailable() & 1) == 0 && *p_lastFailureWasUnboundBiometric)
  {
    if (lastFailureWasUnboundBiometric) {
      double v16 = @"PRESENTMENT_FOOTER_CONFIRM_TOUCHID_IDENTITY_FINGERPRINT";
    }
    else {
      double v16 = @"PRESENTMENT_FOOTER_TOUCHID_WRONG_FINGERPRINT";
    }
    uint64_t v17 = PKLocalizedIdentityString(&v16->isa);

    double v15 = (void *)v17;
  }
  objc_initWeak(&location, self);
  footerView = self->_footerView;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__PKDataReleaseContentViewController_authenticator_didTransitionToEvaluationStateWithEvent___block_invoke;
  v19[3] = &unk_1E59DBE00;
  objc_copyWeak(v20, &location);
  v20[1] = (id)v12;
  [(PKPaymentAuthorizationFooterView *)footerView setState:v12 string:v15 animated:1 withCompletion:v19];
  [(PKDataReleaseContentViewController *)self _updatePhysicalButtonState];
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __92__PKDataReleaseContentViewController_authenticator_didTransitionToEvaluationStateWithEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(void *)(a1 + 40) == 13)
  {
    id v3 = WeakRetained;
    [WeakRetained[127] setState:3 string:0 animated:1];
    [v3 _updatePhysicalButtonState];
    id WeakRetained = v3;
  }
}

- (void)authorizationFooterViewPasscodeButtonPressed:(id)a3
{
  if (self->_authenticating) {
    [(PKAuthenticator *)self->_authenticator fallbackToSystemPasscodeUI];
  }
  else {
    [(PKDataReleaseContentViewController *)self presentPasscodeToExitLockout];
  }
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, uint64_t))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeViewController);

  if (WeakRetained)
  {
    if (v8) {
      v8[2](v8, 1);
    }
  }
  else
  {
    objc_storeWeak((id *)&self->_passcodeViewController, v7);
    [v7 setModalPresentationStyle:5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __92__PKDataReleaseContentViewController_presentPasscodeViewController_completionHandler_reply___block_invoke;
    v10[3] = &unk_1E59CAA98;
    id v11 = v8;
    [(PKDataReleaseContentViewController *)self presentViewController:v7 animated:1 completion:v10];
  }
}

uint64_t __92__PKDataReleaseContentViewController_presentPasscodeViewController_completionHandler_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)dismissPasscodeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passcodeViewController);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained presentingViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_merchantIcon, 0);
  objc_storeStrong((id *)&self->_entityResolver, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_dataToRelease, 0);
  objc_storeStrong((id *)&self->_intentDisplayOnlyElements, 0);
  objc_storeStrong((id *)&self->_intentDoNotRetainElements, 0);
  objc_storeStrong((id *)&self->_intentRetainElements, 0);
  objc_destroyWeak((id *)&self->_passcodeViewController);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_footerMaterial, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_tableViewReleaseData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataReleaseConfiguration, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end