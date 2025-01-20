@interface PKContinuityPaymentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_updateActiveConstraints;
- (BOOL)paymentAuthorizationStateMachine:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5 withParam:(id)a6;
- (BOOL)paymentPass:(id *)a3 paymentApplication:(id *)a4 fromAID:(id)a5 selectedPaymentMethodType:(unint64_t)a6;
- (PKContinuityPaymentViewController)init;
- (PKContinuityPaymentViewController)initWithRemotePaymentRequest:(id)a3;
- (PKPaymentAuthorizationHostProtocol)delegate;
- (PKRemotePaymentRequest)remoteRequest;
- (id)_evaluationRequestWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4;
- (id)_formattedDateRangeWithStartDate:(id)a3 endDate:(id)a4;
- (int64_t)_authenticatorPolicy;
- (int64_t)_progressStateForAuthenticationWithBiometricFailure:(BOOL)a3;
- (void)_cancelPassphrasePressed;
- (void)_didCancel;
- (void)_didFailWithError:(id)a3;
- (void)_didFailWithFatalError:(id)a3;
- (void)_didSucceedWithAuthorizationStateParam:(id)a3;
- (void)_invalidPaymentDataWithParam:(id)a3;
- (void)_layoutAnimated;
- (void)_processClientCallback:(id)a3;
- (void)_resetAndScheduleTimeout;
- (void)_resumeAuthenticationWithPreviousError:(id)a3;
- (void)_setAuthenticating:(BOOL)a3;
- (void)_setPasscodeViewController:(id)a3;
- (void)_setPassphraseViewController:(id)a3;
- (void)_setUserIntentRequired:(BOOL)a3;
- (void)_startEvaluationWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4;
- (void)_suspendAuthentication;
- (void)_timeoutFired;
- (void)_updateCardView;
- (void)_updateCoachingState;
- (void)_updateFootnoteLabelWithTotalSummaryItem:(id)a3;
- (void)_updatePendingTransaction:(id)a3 withAuthorizationStateParam:(id)a4;
- (void)_updatePriceLabelWithTotalSummaryItem:(id)a3;
- (void)_updateProgressStateIfAuthenticatingWithBiometricFailure:(BOOL)a3;
- (void)_updateUserIntentRequired;
- (void)_updateUserIntentStyle;
- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4;
- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4;
- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3;
- (void)authorizationFooterViewDidChangeConstraints:(id)a3;
- (void)authorizationFooterViewPasscodeButtonPressed:(id)a3;
- (void)cancelPressed:(id)a3;
- (void)dealloc;
- (void)dismissPasscodeViewController;
- (void)dismissPassphraseViewController;
- (void)invalidate;
- (void)loadView;
- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5;
- (void)presentPassphraseViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setProgressState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5;
- (void)setProgressState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePaymentWithClientUpdate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PKContinuityPaymentViewController

- (PKContinuityPaymentViewController)init
{
  return [(PKContinuityPaymentViewController *)self initWithRemotePaymentRequest:0];
}

- (PKContinuityPaymentViewController)initWithRemotePaymentRequest:(id)a3
{
  id v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKContinuityPaymentViewController;
  v6 = [(PKContinuityPaymentViewController *)&v41 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    p_remoteRequest = (id *)&v6->_remoteRequest;
    objc_storeStrong((id *)&v6->_remoteRequest, a3);
    v9 = (PKAuthenticator *)objc_alloc_init(MEMORY[0x1E4F88108]);
    authenticator = v7->_authenticator;
    v7->_authenticator = v9;

    [(PKAuthenticator *)v7->_authenticator setDelegate:v7];
    v11 = [MEMORY[0x1E4F84D50] sharedService];
    v12 = [v11 context];
    v13 = [v12 configuration];
    v14 = [v13 contactFormatConfiguration];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F845D8]) initWithConfiguration:v14];
    v16 = (PKPaymentAuthorizationStateMachine *)objc_alloc_init(MEMORY[0x1E4F84A38]);
    stateMachine = v7->_stateMachine;
    v7->_stateMachine = v16;

    [(PKPaymentAuthorizationStateMachine *)v7->_stateMachine setDelegate:v7];
    id v18 = objc_alloc_init(MEMORY[0x1E4F84A18]);
    v19 = [MEMORY[0x1E4F84E00] sharedInstance];
    [v18 setPeerPaymentService:v19];

    v20 = [*p_remoteRequest paymentRequest];
    [v18 setPaymentRequest:v20];

    v21 = [*p_remoteRequest device];
    [v18 setRemoteDevice:v21];

    [v18 setContactFormatValidator:v15];
    [(PKPaymentAuthorizationStateMachine *)v7->_stateMachine setModel:v18];
    v22 = v7->_stateMachine;
    v23 = [MEMORY[0x1E4F84D50] sharedService];
    [(PKPaymentAuthorizationStateMachine *)v22 setPaymentWebService:v23];

    v24 = v7->_stateMachine;
    id v25 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    [(PKPaymentAuthorizationStateMachine *)v24 setPaymentService:v25];

    v26 = v7->_stateMachine;
    id v27 = objc_alloc_init(MEMORY[0x1E4F843D8]);
    [(PKPaymentAuthorizationStateMachine *)v26 setAggregateDictionary:v27];

    uint64_t v28 = [*p_remoteRequest selectedApplicationIdentifier];
    if (v28)
    {
      v29 = (void *)v28;
      id v39 = 0;
      id v40 = 0;
      v30 = [*p_remoteRequest selectedApplicationIdentifier];
      BOOL v31 = -[PKContinuityPaymentViewController paymentPass:paymentApplication:fromAID:selectedPaymentMethodType:](v7, "paymentPass:paymentApplication:fromAID:selectedPaymentMethodType:", &v40, &v39, v30, [*p_remoteRequest selectedPaymentMethodType]);
      id v32 = v40;
      id v33 = v39;

      if (v31)
      {
        [v18 setPass:v32];
        [v18 setPaymentApplication:v33];
      }
    }
    else
    {
      id v33 = 0;
      id v32 = 0;
    }
    v34 = [(PKContinuityPaymentViewController *)v7 navigationItem];
    id v35 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v35 configureWithTransparentBackground];
    [v34 setStandardAppearance:v35];
    v36 = +[PKPaymentAuthorizationNavigationBar applePayBarButtonItem];
    [v34 setLeftBarButtonItem:v36 animated:0];

    [v34 setLeftItemsSupplementBackButton:1];
    v37 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v7 action:sel_cancelPressed_];
    [v34 setRightBarButtonItem:v37 animated:0];
  }
  return v7;
}

- (void)dealloc
{
  [(PKAuthenticator *)self->_authenticator invalidate];
  [(PKAuthenticator *)self->_authenticator setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentViewController;
  [(PKContinuityPaymentViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v99[4] = *MEMORY[0x1E4F143B8];
  v98.receiver = self;
  v98.super_class = (Class)PKContinuityPaymentViewController;
  [(PKContinuityPaymentViewController *)&v98 loadView];
  [(PKContinuityPaymentViewController *)self _updateUserIntentStyle];
  id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
  id v5 = (UIVisualEffectView *)[v3 initWithEffect:v4];
  backdropView = self->_backdropView;
  self->_backdropView = v5;

  [(UIVisualEffectView *)self->_backdropView setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  dimmingBackgroundView = self->_dimmingBackgroundView;
  self->_dimmingBackgroundView = v7;

  v9 = self->_dimmingBackgroundView;
  v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.06];
  [(UIView *)v9 setBackgroundColor:v10];

  [(UIView *)self->_dimmingBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  compactRegion = self->_compactRegion;
  self->_compactRegion = v11;

  [(UIView *)self->_compactRegion setTranslatesAutoresizingMaskIntoConstraints:0];
  if (PKUserIntentIsAvailable())
  {
    v13 = [(PKContinuityPaymentViewController *)self traitCollection];
    uint64_t v14 = [v13 userInterfaceStyle];

    if (v14 == 2) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 2;
    }
    v16 = (LAUIPhysicalButtonView *)[objc_alloc(MEMORY[0x1E4F72FE0]) initWithStyle:v15];
    physicalButtonView = self->_physicalButtonView;
    self->_physicalButtonView = v16;

    id v18 = PKLocalizedPearlString(&cfstr_InAppPaymentPu_12.isa);
    v19 = [(PKRemotePaymentRequest *)self->_remoteRequest paymentRequest];
    unint64_t v20 = [v19 confirmationStyle];

    if (v20 <= 8)
    {
      uint64_t v21 = PKLocalizedPearlString(&off_1E59CC290[v20]->isa);

      id v18 = (void *)v21;
    }
    [(LAUIPhysicalButtonView *)self->_physicalButtonView setInstruction:v18];
  }
  v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  requestingDeviceLabel = self->_requestingDeviceLabel;
  self->_requestingDeviceLabel = v22;

  v24 = self->_requestingDeviceLabel;
  v95 = (NSString *)*MEMORY[0x1E4FB28F0];
  v94 = (NSString *)*MEMORY[0x1E4FB2790];
  id v25 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB2790]);
  [(UILabel *)v24 setFont:v25];

  [(UILabel *)self->_requestingDeviceLabel setTextAlignment:1];
  v26 = self->_requestingDeviceLabel;
  id v27 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)v26 setBackgroundColor:v27];

  uint64_t v28 = self->_requestingDeviceLabel;
  v29 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v28 setTextColor:v29];

  [(UILabel *)self->_requestingDeviceLabel setAlpha:0.42];
  [(UILabel *)self->_requestingDeviceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v30 = [(PKRemotePaymentRequest *)self->_remoteRequest device];
  BOOL v31 = [v30 deviceName];

  id v32 = [(PKRemotePaymentRequest *)self->_remoteRequest paymentRequest];
  id v33 = [v32 paymentSummaryItems];
  v34 = [v33 lastObject];
  v97 = [v34 label];

  id v35 = self->_requestingDeviceLabel;
  v36 = PKLocalizedPaymentString(&cfstr_ContinuityPaym.isa, &stru_1EF1B4C70.isa, v31);
  [(UILabel *)v35 setText:v36];

  v37 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  requestingSiteLabel = self->_requestingSiteLabel;
  self->_requestingSiteLabel = v37;

  id v39 = self->_requestingSiteLabel;
  id v40 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2998], (NSString *)*MEMORY[0x1E4FB2788]);
  [(UILabel *)v39 setFont:v40];

  [(UILabel *)self->_requestingSiteLabel setTextAlignment:1];
  objc_super v41 = self->_requestingSiteLabel;
  v42 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)v41 setBackgroundColor:v42];

  [(UILabel *)self->_requestingSiteLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_requestingSiteLabel setText:v97];
  v43 = self->_requestingSiteLabel;
  v44 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v43 setTextColor:v44];

  v45 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  priceView = self->_priceView;
  self->_priceView = v45;

  [(UIView *)self->_priceView setTranslatesAutoresizingMaskIntoConstraints:0];
  v47 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  priceLabel = self->_priceLabel;
  self->_priceLabel = v47;

  v49 = self->_priceLabel;
  v50 = [MEMORY[0x1E4FB08E0] _lightSystemFontOfSize:42.0];
  [(UILabel *)v49 setFont:v50];

  [(UILabel *)self->_priceLabel setTextAlignment:1];
  v51 = self->_priceLabel;
  v52 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)v51 setBackgroundColor:v52];

  [(UILabel *)self->_priceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_priceView addSubview:self->_priceLabel];
  v53 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  footnoteLabel = self->_footnoteLabel;
  self->_footnoteLabel = v53;

  v55 = self->_footnoteLabel;
  v56 = PKFontForDefaultDesign(v95, v94);
  [(UILabel *)v55 setFont:v56];

  [(UILabel *)self->_footnoteLabel setTextAlignment:1];
  v57 = self->_footnoteLabel;
  v58 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)v57 setBackgroundColor:v58];

  v59 = self->_footnoteLabel;
  v60 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v59 setTextColor:v60];

  [(UILabel *)self->_footnoteLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_footnoteLabel setAlpha:0.8];
  v61 = [(PKRemotePaymentRequest *)self->_remoteRequest paymentRequest];
  v62 = [v61 paymentSummaryItems];
  uint64_t v63 = [v62 lastObject];

  [(PKContinuityPaymentViewController *)self _updatePriceLabelWithTotalSummaryItem:v63];
  v96 = (void *)v63;
  [(PKContinuityPaymentViewController *)self _updateFootnoteLabelWithTotalSummaryItem:v63];
  v64 = [(PKRemotePaymentRequest *)self->_remoteRequest paymentRequest];
  v65 = [v64 thumbnailURLs];
  v66 = [v65 firstObject];

  v67 = [(PKRemotePaymentRequest *)self->_remoteRequest device];
  v68 = [v67 modelIdentifier];

  v69 = [PKContinuityPaymentFaviconView alloc];
  double v70 = *MEMORY[0x1E4F1DB28];
  double v71 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v72 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v73 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v74 = -[PKContinuityPaymentFaviconView initWithFrame:URL:modelIdentifier:merchantName:](v69, "initWithFrame:URL:modelIdentifier:merchantName:", v66, v68, v97, *MEMORY[0x1E4F1DB28], v71, v72, v73);
  faviconImage = self->_faviconImage;
  self->_faviconImage = v74;

  v76 = self->_faviconImage;
  v77 = [MEMORY[0x1E4FB1618] clearColor];
  [(PKContinuityPaymentFaviconView *)v76 setBackgroundColor:v77];

  [(PKContinuityPaymentFaviconView *)self->_faviconImage setTranslatesAutoresizingMaskIntoConstraints:0];
  id v78 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v79 = self->_priceView;
  v99[0] = self->_faviconImage;
  v99[1] = v79;
  v80 = self->_footnoteLabel;
  v99[2] = self->_requestingSiteLabel;
  v99[3] = v80;
  v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:4];
  v82 = (UIStackView *)[v78 initWithArrangedSubviews:v81];
  summaryContainerView = self->_summaryContainerView;
  self->_summaryContainerView = v82;

  [(UIStackView *)self->_summaryContainerView setAlignment:3];
  [(UIStackView *)self->_summaryContainerView setAxis:1];
  [(UIStackView *)self->_summaryContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v84 = [PKPaymentAuthorizationLayout alloc];
  v85 = [(PKRemotePaymentRequest *)self->_remoteRequest paymentRequest];
  v86 = [(PKPaymentAuthorizationLayout *)v84 initWithStyle:0 paymentRequest:v85];

  v87 = -[PKPaymentAuthorizationFooterView initWithFrame:layout:]([PKPaymentAuthorizationFooterView alloc], "initWithFrame:layout:", v86, v70, v71, v72, v73);
  authorizationView = self->_authorizationView;
  self->_authorizationView = v87;

  [(PKPaymentAuthorizationFooterView *)self->_authorizationView setUserIntentStyle:self->_userIntentStyle];
  [(PKPaymentAuthorizationFooterView *)self->_authorizationView setDelegate:self];
  [(PKPaymentAuthorizationFooterView *)self->_authorizationView setTranslatesAutoresizingMaskIntoConstraints:0];
  v89 = -[PKContinuityPaymentCardSummaryView initWithFrame:]([PKContinuityPaymentCardSummaryView alloc], "initWithFrame:", v70, v71, v72, v73);
  cardView = self->_cardView;
  self->_cardView = v89;

  [(PKContinuityPaymentViewController *)self _updateCardView];
  v91 = [(PKContinuityPaymentViewController *)self view];
  v92 = [MEMORY[0x1E4FB1618] clearColor];
  [v91 setBackgroundColor:v92];

  [v91 addSubview:self->_backdropView];
  [v91 addSubview:self->_dimmingBackgroundView];
  [v91 addSubview:self->_compactRegion];
  if (self->_physicalButtonView) {
    objc_msgSend(v91, "addSubview:");
  }
  [v91 addSubview:self->_requestingDeviceLabel];
  [v91 addSubview:self->_summaryContainerView];
  [v91 addSubview:self->_authorizationView];
  [v91 addSubview:self->_cardView];
  if (PKPearlIsAvailable()) {
    uint64_t v93 = 3;
  }
  else {
    uint64_t v93 = 0;
  }
  [(PKContinuityPaymentViewController *)self setProgressState:v93 string:0 animated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKContinuityPaymentViewController;
  [(PKContinuityPaymentViewController *)&v4 viewWillAppear:a3];
  if (!self->_viewAppeared) {
    self->_viewAppeared = 1;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKContinuityPaymentViewController;
  [(PKContinuityPaymentViewController *)&v4 viewDidAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x1E4FB24B0], self->_authorizationView);
  [(PKContinuityPaymentViewController *)self _resetAndScheduleTimeout];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKContinuityPaymentViewController;
  [(PKContinuityPaymentViewController *)&v4 viewWillDisappear:a3];
  [(NSTimer *)self->_timeoutTimer invalidate];
}

- (void)viewDidLoad
{
  v63[2] = *MEMORY[0x1E4F143B8];
  v61.receiver = self;
  v61.super_class = (Class)PKContinuityPaymentViewController;
  [(PKContinuityPaymentViewController *)&v61 viewDidLoad];
  id v3 = [(PKContinuityPaymentViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_backdropView attribute:1 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v4];

  id v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_backdropView attribute:2 relatedBy:0 toItem:v3 attribute:2 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v5];

  v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_backdropView attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v6];

  v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_backdropView attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v7];

  v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_dimmingBackgroundView attribute:1 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v8];

  v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_dimmingBackgroundView attribute:2 relatedBy:0 toItem:v3 attribute:2 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v9];

  v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_dimmingBackgroundView attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v10];

  v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_compactRegion attribute:1 relatedBy:0 toItem:self->_dimmingBackgroundView attribute:1 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v11];

  v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_compactRegion attribute:2 relatedBy:0 toItem:self->_dimmingBackgroundView attribute:2 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v12];

  v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_compactRegion attribute:7 relatedBy:0 toItem:self->_dimmingBackgroundView attribute:7 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v13];

  uint64_t v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_compactRegion attribute:4 relatedBy:0 toItem:self->_dimmingBackgroundView attribute:4 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v14];

  physicalButtonView = self->_physicalButtonView;
  if (physicalButtonView)
  {
    double v16 = 1.0;
    uint64_t v17 = 4;
  }
  else
  {
    physicalButtonView = self->_dimmingBackgroundView;
    double v16 = 1.0;
    uint64_t v17 = 3;
  }
  id v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_compactRegion attribute:3 relatedBy:0 toItem:physicalButtonView attribute:v17 multiplier:v16 constant:0.0];
  [v3 addConstraint:v18];

  v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_requestingDeviceLabel attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v19];

  unint64_t v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_requestingDeviceLabel attribute:4 relatedBy:0 toItem:self->_dimmingBackgroundView attribute:4 multiplier:1.0 constant:-16.0];
  [v3 addConstraint:v20];

  uint64_t v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_requestingDeviceLabel attribute:1 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v21];

  v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_requestingDeviceLabel attribute:2 relatedBy:0 toItem:v3 attribute:2 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v22];

  v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_summaryContainerView attribute:7 relatedBy:0 toItem:self->_dimmingBackgroundView attribute:7 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v23];

  v24 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_summaryContainerView attribute:9 relatedBy:0 toItem:self->_dimmingBackgroundView attribute:9 multiplier:1.0 constant:0.0];
  v63[0] = v24;
  id v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_summaryContainerView attribute:10 relatedBy:0 toItem:self->_dimmingBackgroundView attribute:10 multiplier:1.0 constant:0.0];
  v63[1] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  defaultConstraints = self->_defaultConstraints;
  self->_defaultConstraints = v26;

  uint64_t v28 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_summaryContainerView attribute:9 relatedBy:0 toItem:self->_compactRegion attribute:9 multiplier:1.0 constant:0.0];
  v62[0] = v28;
  v29 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_summaryContainerView attribute:10 relatedBy:0 toItem:self->_compactRegion attribute:10 multiplier:1.0 constant:0.0];
  v62[1] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  compactConstraints = self->_compactConstraints;
  self->_compactConstraints = v30;

  summaryContainerView = self->_summaryContainerView;
  id v33 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_priceView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:59.0];
  [(UIStackView *)summaryContainerView addConstraint:v33];

  v34 = self->_summaryContainerView;
  id v35 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_priceLabel attribute:4 relatedBy:0 toItem:self->_priceView attribute:4 multiplier:1.0 constant:0.0];
  [(UIStackView *)v34 addConstraint:v35];

  v36 = self->_summaryContainerView;
  v37 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_priceLabel attribute:9 relatedBy:0 toItem:self->_priceView attribute:9 multiplier:1.0 constant:0.0];
  [(UIStackView *)v36 addConstraint:v37];

  v38 = self->_summaryContainerView;
  id v39 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_priceLabel attribute:5 relatedBy:1 toItem:self->_priceView attribute:5 multiplier:1.0 constant:0.0];
  [(UIStackView *)v38 addConstraint:v39];

  id v40 = self->_summaryContainerView;
  objc_super v41 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_priceLabel attribute:6 relatedBy:-1 toItem:self->_priceView attribute:6 multiplier:1.0 constant:0.0];
  [(UIStackView *)v40 addConstraint:v41];

  footnoteLabel = self->_footnoteLabel;
  v43 = [MEMORY[0x1E4F28DC8] constraintWithItem:footnoteLabel attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:25.0];
  [(UILabel *)footnoteLabel addConstraint:v43];

  v44 = self->_summaryContainerView;
  v45 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_faviconImage attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:240.0];
  [(UIStackView *)v44 addConstraint:v45];

  v46 = self->_summaryContainerView;
  v47 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_faviconImage attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:150.0];
  [(UIStackView *)v46 addConstraint:v47];

  v48 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_cardView attribute:1 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v48];

  v49 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_cardView attribute:2 relatedBy:0 toItem:v3 attribute:2 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v49];

  v50 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_cardView attribute:3 relatedBy:0 toItem:self->_dimmingBackgroundView attribute:4 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v50];

  v51 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_cardView attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:56.0];
  [v3 addConstraint:v51];

  v52 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_authorizationView attribute:7 relatedBy:0 toItem:v3 attribute:7 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v52];

  v53 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_authorizationView attribute:3 relatedBy:0 toItem:self->_cardView attribute:4 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v53];

  v54 = [(PKPaymentAuthorizationFooterView *)self->_authorizationView bottomAnchor];
  v55 = [v3 safeAreaLayoutGuide];
  v56 = [v55 bottomAnchor];
  v57 = [v54 constraintEqualToAnchor:v56];
  [v3 addConstraint:v57];

  int IsAvailable = PKPearlIsAvailable();
  double v59 = 257.0;
  if (!IsAvailable) {
    double v59 = 237.0;
  }
  v60 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_authorizationView attribute:4 relatedBy:-1 toItem:self->_cardView attribute:3 multiplier:1.0 constant:v59];
  [v3 addConstraint:v60];

  [(PKContinuityPaymentViewController *)self _updateActiveConstraints];
  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine start];
}

- (BOOL)_updateActiveConstraints
{
  BOOL v3 = [(PKPaymentAuthorizationFooterView *)self->_authorizationView isOffscreen];
  uint64_t v4 = 18;
  if (v3) {
    uint64_t v4 = 19;
  }
  id v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKContinuityPaymentViewController__remoteRequest[v4]);
  v6 = v5;
  p_activeConstraints = &self->_activeConstraints;
  activeConstraints = self->_activeConstraints;
  if (activeConstraints != v6)
  {
    if (activeConstraints) {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_activeConstraints];
    }
    objc_storeStrong((id *)p_activeConstraints, v5);
    if (*p_activeConstraints) {
      objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:");
    }
    [(PKContinuityPaymentViewController *)self _layoutAnimated];
  }

  return activeConstraints != v6;
}

- (void)_layoutAnimated
{
  BOOL v3 = [(PKContinuityPaymentViewController *)self viewIfLoaded];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 setNeedsLayout];
    if (self->_viewAppeared)
    {
      id v5 = (void *)MEMORY[0x1E4FB1EB0];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __52__PKContinuityPaymentViewController__layoutAnimated__block_invoke;
      v6[3] = &unk_1E59CA7D0;
      id v7 = v4;
      [v5 _animateUsingDefaultTimingWithOptions:134 animations:v6 completion:0];
    }
    else
    {
      [v4 layoutIfNeeded];
    }
  }
}

uint64_t __52__PKContinuityPaymentViewController__layoutAnimated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKContinuityPaymentViewController;
  [(PKContinuityPaymentViewController *)&v4 viewWillLayoutSubviews];
  physicalButtonView = self->_physicalButtonView;
  if (physicalButtonView) {
    [(LAUIPhysicalButtonView *)physicalButtonView updateFrame];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts]&& PKUserIntentIsAvailable())
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__PKContinuityPaymentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v9[3] = &unk_1E59CC1F8;
    v9[4] = self;
    [v7 animateAlongsideTransition:v9 completion:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)PKContinuityPaymentViewController;
  -[PKContinuityPaymentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __88__PKContinuityPaymentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1064) updateRotation];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKContinuityPaymentViewController;
  [(PKContinuityPaymentViewController *)&v6 traitCollectionDidChange:a3];
  objc_super v4 = [(PKContinuityPaymentViewController *)self traitCollection];
  if ([v4 userInterfaceStyle] == 2) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }

  [(LAUIPhysicalButtonView *)self->_physicalButtonView setStyle:v5];
}

- (void)setProgressState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5
{
}

- (void)setProgressState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  [(PKPaymentAuthorizationFooterView *)self->_authorizationView setState:a3 string:a4 animated:a5 withCompletion:a6];

  [(PKContinuityPaymentViewController *)self _updateUserIntentRequired];
}

- (void)_setAuthenticating:(BOOL)a3
{
  if (self->_authenticating != a3)
  {
    self->_authenticating = a3;
    [(PKContinuityPaymentViewController *)self _updateUserIntentRequired];
    [(PKContinuityPaymentViewController *)self _updateCoachingState];
  }
}

- (void)_setPasscodeViewController:(id)a3
{
  uint64_t v5 = (UIViewController *)a3;
  if (self->_passcodeViewController != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_passcodeViewController, a3);
    [(PKContinuityPaymentViewController *)self _updateUserIntentRequired];
    [(PKContinuityPaymentViewController *)self _updateCoachingState];
    uint64_t v5 = v6;
  }
}

- (void)_setPassphraseViewController:(id)a3
{
  uint64_t v5 = (UIViewController *)a3;
  if (self->_passphraseViewController != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_passphraseViewController, a3);
    [(PKContinuityPaymentViewController *)self _updateUserIntentRequired];
    [(PKContinuityPaymentViewController *)self _updateCoachingState];
    uint64_t v5 = v6;
  }
}

- (void)_updateUserIntentStyle
{
  int64_t v3 = [MEMORY[0x1E4F88108] userIntentStyle];
  if (self->_userIntentStyle != v3)
  {
    int64_t v4 = v3;
    self->_userIntentStyle = v3;
    authorizationView = self->_authorizationView;
    [(PKPaymentAuthorizationFooterView *)authorizationView setUserIntentStyle:v4];
  }
}

- (void)_updateUserIntentRequired
{
  BOOL v3 = PKUserIntentIsAvailable()
    && self->_authenticating
    && [(PKPaymentAuthorizationFooterView *)self->_authorizationView state] == 3
    && !self->_passcodeViewController
    && self->_passphraseViewController == 0;

  [(PKContinuityPaymentViewController *)self _setUserIntentRequired:v3];
}

- (void)_updateCoachingState
{
  if (PKPearlIsAvailable()
    && self->_authenticating
    && !self->_passcodeViewController
    && !self->_passphraseViewController)
  {
    int64_t internalCoachingState = self->_internalCoachingState;
  }
  else
  {
    int64_t internalCoachingState = 0;
  }
  if (self->_coachingState != internalCoachingState)
  {
    self->_coachingState = internalCoachingState;
    [(PKContinuityPaymentViewController *)self _updateProgressStateIfAuthenticatingWithBiometricFailure:0];
  }
}

- (void)_updateProgressStateIfAuthenticatingWithBiometricFailure:(BOOL)a3
{
  if (self->_authenticating)
  {
    BOOL v3 = a3;
    int64_t v5 = -[PKContinuityPaymentViewController _progressStateForAuthenticationWithBiometricFailure:](self, "_progressStateForAuthenticationWithBiometricFailure:");
    if ([(PKPaymentAuthorizationFooterView *)self->_authorizationView state] != v5) {
      [(PKContinuityPaymentViewController *)self setProgressState:v5 string:0 animated:1];
    }
    if (v3)
    {
      [(PKContinuityPaymentViewController *)self setProgressState:9 string:0 animated:1];
    }
  }
}

- (void)_setUserIntentRequired:(BOOL)a3
{
  if (self->_userIntentRequired != a3)
  {
    self->_userIntentRequired = a3;
    -[LAUIPhysicalButtonView setAnimating:](self->_physicalButtonView, "setAnimating:");
    [(PKContinuityPaymentViewController *)self _updateActiveConstraints];
  }
}

- (void)cancelPressed:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134349056;
    objc_super v6 = self;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKContinuityPaymentViewController (%{public}p): User cancelled payment", (uint8_t *)&v5, 0xCu);
  }

  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didCancel];
}

- (void)_cancelPassphrasePressed
{
  [(PKContinuityPaymentViewController *)self _suspendAuthentication];

  [(PKContinuityPaymentViewController *)self _resumeAuthenticationWithPreviousError:0];
}

- (void)_resetAndScheduleTimeout
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer) {
    [(NSTimer *)timeoutTimer invalidate];
  }
  int64_t v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__timeoutFired selector:0 userInfo:0 repeats:120.0];
  int v5 = self->_timeoutTimer;
  self->_timeoutTimer = v4;
}

- (void)_timeoutFired
{
  if (!self->_attemptedTimeout
    && ([(PKPaymentAuthorizationStateMachine *)self->_stateMachine state] == 10
     || [(PKPaymentAuthorizationStateMachine *)self->_stateMachine state] == 11))
  {
    [(PKContinuityPaymentViewController *)self _resetAndScheduleTimeout];
    self->_attemptedTimeout = 1;
  }
  else
  {
    [(PKContinuityPaymentViewController *)self _didFailWithFatalError:0];
  }
}

- (void)_updateCardView
{
  BOOL v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  int64_t v4 = [v3 pass];

  PKPassFrontFaceContentSize();
  PKFloatRoundToPixel();
  double v6 = v5;
  uint64_t v7 = +[PKPassSnapshotter sharedInstance];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __52__PKContinuityPaymentViewController__updateCardView__block_invoke;
  v32[3] = &unk_1E59CA898;
  v32[4] = self;
  objc_msgSend(v7, "snapshotWithPass:size:completion:", v4, v32, 41.0, v6);

  uint64_t v8 = [v4 hasAssociatedPeerPaymentAccount];
  if (!v8)
  {
    v19 = [v4 localizedDescription];
    uint64_t v14 = objc_msgSend(v19, "pk_uppercaseStringForPreferredLocale");

    unint64_t v20 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    v9 = [v20 acceptedPaymentApplicationsForPass:v4];

    uint64_t v21 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    double v16 = [v21 unavailablePaymentApplicationsForPass:v4];

    v22 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v17 = [v22 paymentApplication];

    if (v17)
    {
      v23 = [v17 displayName];
      if (!v23 || ![v9 count]) {
        goto LABEL_9;
      }
      uint64_t v24 = [v9 count];
      unint64_t v25 = [v16 count] + v24;

      if (v25 >= 2)
      {
        v26 = NSString;
        v23 = [v17 displayName];
        uint64_t v27 = [v26 stringWithFormat:@"%@ - %@", v14, v23];

        uint64_t v14 = (void *)v27;
LABEL_9:
      }
    }
    uint64_t v28 = PKSanitizedPrimaryAccountRepresentationForPass();
    v29 = [NSString stringWithFormat:@"(%@)", v28];
    uint64_t v30 = [v28 length];
    BOOL v31 = &stru_1EF1B5B50;
    if (v30) {
      BOOL v31 = v29;
    }
    id v18 = v31;

    goto LABEL_13;
  }
  v9 = [v4 peerPaymentBalance];
  v10 = NSString;
  v11 = [v4 localizedDescription];
  v12 = objc_msgSend(v11, "pk_uppercaseStringForPreferredLocale");
  v13 = [v9 minimalFormattedStringValue];
  uint64_t v14 = [v10 stringWithFormat:@"%@ - %@", v12, v13];

  uint64_t v15 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  double v16 = [v15 itemForType:3];

  if ([v16 status] != 5)
  {
    uint64_t v8 = 0;
    id v18 = 0;
    goto LABEL_15;
  }
  uint64_t v17 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr.isa);
  objc_msgSend(v17, "pk_uppercaseStringForPreferredLocale");
  id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_15:
  [(PKContinuityPaymentCardSummaryView *)self->_cardView setCardDescription:v14];
  [(PKContinuityPaymentCardSummaryView *)self->_cardView setSubtitle:v18];
  [(PKContinuityPaymentCardSummaryView *)self->_cardView setShowsAlert:v8];
  [(PKContinuityPaymentCardSummaryView *)self->_cardView setNeedsLayout];
}

void __52__PKContinuityPaymentViewController__updateCardView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PKContinuityPaymentViewController__updateCardView__block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __52__PKContinuityPaymentViewController__updateCardView__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1056) thumbnailView];
  [v2 setImage:*(void *)(a1 + 40)];
}

- (void)_updatePriceLabelWithTotalSummaryItem:(id)a3
{
  id v10 = a3;
  id v4 = [(PKRemotePaymentRequest *)self->_remoteRequest paymentRequest];
  double v5 = [v4 currencyCode];

  id v6 = [v10 amount];
  uint64_t v7 = PKFormattedCurrencyStringFromNumber();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v10;
    [v8 intervalCount];
    [v8 intervalUnit];

    uint64_t v9 = PKLocalizedIntervalTermStringWithAmount();

    uint64_t v7 = (void *)v9;
  }
  [(UILabel *)self->_priceLabel setText:v7];
}

- (void)_updateFootnoteLabelWithTotalSummaryItem:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v9;
    double v5 = [v4 startDate];
    id v6 = [v4 endDate];
    uint64_t v7 = [(PKContinuityPaymentViewController *)self _formattedDateRangeWithStartDate:v5 endDate:v6];

    if (!v7)
    {
      id v8 = 0;
      goto LABEL_9;
    }
    PKLocalizedPaymentString(&cfstr_InAppPaymentSt_0.isa, &stru_1EF1B4C70.isa, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = 0;
      goto LABEL_10;
    }
    id v4 = [v9 deferredDate];
    uint64_t v7 = PKMediumDateString();
    PKLocalizedPaymentString(&cfstr_InAppPaymentOn.isa, &stru_1EF1B4C70.isa, v7);
  id v8 = };
LABEL_9:

LABEL_10:
  [(UILabel *)self->_footnoteLabel setText:v8];
  [(UILabel *)self->_footnoteLabel setHidden:v8 == 0];
}

- (id)_formattedDateRangeWithStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v5)
    {
      uint64_t v7 = PKDateRangeStringFromDateToDate();
LABEL_6:
      id v8 = (void *)v7;
      goto LABEL_9;
    }
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    id v8 = PKDateRangeStringFromDateToDate();
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = PKMediumDateString();
      goto LABEL_6;
    }
    id v8 = 0;
  }
LABEL_9:

  return v8;
}

- (void)updatePaymentWithClientUpdate:(id)a3
{
  id v4 = a3;
  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine state];
  if (PKPaymentAuthorizationStateIsTerminal())
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Received client update but in terminal state", buf, 2u);
    }
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__PKContinuityPaymentViewController_updatePaymentWithClientUpdate___block_invoke;
    v6[3] = &unk_1E59CA870;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __67__PKContinuityPaymentViewController_updatePaymentWithClientUpdate___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1184) model];
  [*(id *)(a1 + 32) _resetAndScheduleTimeout];
  id v3 = [v2 paymentApplication];
  uint64_t v4 = [*(id *)(a1 + 40) selectedPaymentMethodType];
  id v5 = [*(id *)(a1 + 40) selectedAID];
  id v6 = [v3 applicationIdentifier];
  if ([v5 isEqualToString:v6])
  {
    if (!v4)
    {

LABEL_13:
      id v12 = v3;
      goto LABEL_14;
    }
    uint64_t v7 = [v3 paymentType];

    if (v4 == v7) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  id v25 = v3;
  id v26 = 0;
  id v8 = *(void **)(a1 + 32);
  id v9 = objc_msgSend(*(id *)(a1 + 40), "selectedAID", v3);
  int v10 = [v8 paymentPass:&v26 paymentApplication:&v25 fromAID:v9 selectedPaymentMethodType:v4];
  id v11 = v26;
  id v12 = v25;

  if (v10)
  {
    [v2 setPass:v11 withSelectedPaymentApplication:v12];
    [*(id *)(*(void *)(a1 + 32) + 1184) didSelectPaymentPass:v11 paymentApplication:v12];
    [*(id *)(a1 + 32) _updateCardView];
  }
  else
  {
    v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [*(id *)(a1 + 40) selectedAID];
      uint64_t v15 = PKPaymentMethodTypeToString();
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v14;
      __int16 v29 = 2112;
      uint64_t v30 = v15;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Payment client update provided AID %@, payment type %@, but a match wasn't found", buf, 0x16u);
    }
  }

LABEL_14:
  double v16 = [*(id *)(a1 + 40) paymentSummaryItems];
  uint64_t v17 = [v2 paymentSummaryItems];
  char v18 = [v16 isEqualToArray:v17];

  if ((v18 & 1) == 0)
  {
    v19 = [*(id *)(a1 + 40) paymentSummaryItems];
    [v2 setPaymentSummaryItems:v19];

    unint64_t v20 = [*(id *)(a1 + 40) paymentSummaryItems];
    uint64_t v21 = [v20 lastObject];

    [*(id *)(a1 + 32) _updatePriceLabelWithTotalSummaryItem:v21];
    [*(id *)(a1 + 32) _updateFootnoteLabelWithTotalSummaryItem:v21];
  }
  v22 = [*(id *)(a1 + 40) multiTokenContexts];
  [v2 setMultiTokenContexts:v22];

  v23 = [*(id *)(a1 + 40) recurringPaymentRequest];
  [v2 setRecurringPaymentRequest:v23];

  uint64_t v24 = [*(id *)(a1 + 40) automaticReloadPaymentRequest];
  [v2 setAutomaticReloadPaymentRequest:v24];
}

- (void)invalidate
{
  [(PKContinuityPaymentViewController *)self _suspendAuthentication];
  authenticator = self->_authenticator;

  [(PKAuthenticator *)authenticator invalidate];
}

- (BOOL)paymentAuthorizationStateMachine:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5 withParam:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  switch(a5)
  {
    case 3uLL:
      [(PKContinuityPaymentViewController *)self _invalidPaymentDataWithParam:v10];
      break;
    case 5uLL:
      [(PKContinuityPaymentViewController *)self _resumeAuthenticationWithPreviousError:v10];
      break;
    case 6uLL:
      [(PKContinuityPaymentViewController *)self _suspendAuthentication];
      break;
    case 7uLL:
      [(PKContinuityPaymentViewController *)self _processClientCallback:v10];
      break;
    case 9uLL:
      [(PKContinuityPaymentViewController *)self setProgressState:11 string:0 animated:1];
      break;
    case 0xDuLL:
      [(PKContinuityPaymentViewController *)self _didCancel];
      break;
    case 0xEuLL:
      [(PKContinuityPaymentViewController *)self _didFailWithError:v10];
      break;
    case 0xFuLL:
      [(PKContinuityPaymentViewController *)self _didFailWithFatalError:v10];
      break;
    case 0x10uLL:
      [(PKContinuityPaymentViewController *)self _didSucceedWithAuthorizationStateParam:v10];
      break;
    default:
      break;
  }

  return 1;
}

- (void)_processClientCallback:(id)a3
{
  id v18 = a3;
  [(PKContinuityPaymentViewController *)self _suspendAuthentication];
  switch([v18 kind])
  {
    case 1:
      id v4 = objc_alloc(MEMORY[0x1E4F84C08]);
      id v5 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      id v6 = [v5 paymentSummaryItems];
      id v7 = (id)[v4 initWithPaymentSummaryItems:v6];

      id v8 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      id v9 = [v8 paymentRequest];
      id v10 = [v9 availableShippingMethods];
      [v7 setAvailableShippingMethods:v10];

      [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didReceiveShippingContactCompleteWithUpdate:v7];
      goto LABEL_7;
    case 2:
      id v7 = objc_alloc_init(MEMORY[0x1E4F84C10]);
      [v7 setStatus:0];
      id v11 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      id v12 = [v11 paymentSummaryItems];
      [v7 setPaymentSummaryItems:v12];

      [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didReceiveShippingMethodCompleteWithUpdate:v7];
      goto LABEL_7;
    case 3:
      id v7 = objc_alloc_init(MEMORY[0x1E4F84C00]);
      v13 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      uint64_t v14 = [v13 paymentSummaryItems];
      [v7 setPaymentSummaryItems:v14];

      [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didReceivePaymentMethodCompleteWithUpdate:v7];
      goto LABEL_7;
    case 5:
      id v7 = [(PKContinuityPaymentViewController *)self delegate];
      uint64_t v15 = [v18 payment];
      [v7 authorizationDidAuthorizePayment:v15];

      goto LABEL_7;
    case 10:
      id v7 = objc_alloc_init(MEMORY[0x1E4F84BF0]);
      double v16 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      uint64_t v17 = [v16 paymentSummaryItems];
      [v7 setPaymentSummaryItems:v17];

      [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didReceiveCouponCodeCompleteWithUpdate:v7];
LABEL_7:

      break;
    default:
      break;
  }
}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
}

- (void)_resumeAuthenticationWithPreviousError:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 error];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F88108], "currentStateForPolicy:", -[PKContinuityPaymentViewController _authenticatorPolicy](self, "_authenticatorPolicy"));
  uint64_t v6 = v5;
  if (v5)
  {
    if ((v5 & 6) != 0)
    {
      if (PKPearlIsAvailable()) {
        int64_t v8 = 3;
      }
      else {
        int64_t v8 = 0;
      }
    }
    else if (PKUserIntentIsAvailable())
    {
      int64_t v8 = 3;
    }
    else
    {
      int64_t v8 = 4;
    }
    if (self->_authenticating) {
      int64_t v8 = [(PKContinuityPaymentViewController *)self _progressStateForAuthenticationWithBiometricFailure:0];
    }
    if (v4)
    {
      id v9 = PKLocalizedPaymentString(&cfstr_InAppPaymentTr.isa);
    }
    else
    {
      id v9 = 0;
    }
    [(PKContinuityPaymentViewController *)self setProgressState:v8 string:v9 animated:1];
    [(PKContinuityPaymentViewController *)self _startEvaluationWithHasInitialAuthenticatorState:1 initialAuthenticatorState:v6];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134349056;
      id v11 = self;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKContinuityPaymentViewController (%{public}p): Unable to evaluate policy; cancelling payment",
        (uint8_t *)&v10,
        0xCu);
    }

    [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didCancel];
  }
}

- (void)_suspendAuthentication
{
  if (self->_authenticating)
  {
    [(PKAuthenticator *)self->_authenticator cancelEvaluationWithOptions:1];
    [(PKContinuityPaymentViewController *)self _setAuthenticating:0];
  }
}

- (void)_startEvaluationWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4
{
  if (!self->_authenticating)
  {
    BOOL v5 = a3;
    [(PKContinuityPaymentViewController *)self _setAuthenticating:1];
    objc_initWeak(&location, self);
    authenticator = self->_authenticator;
    int64_t v8 = [(PKContinuityPaymentViewController *)self _evaluationRequestWithHasInitialAuthenticatorState:v5 initialAuthenticatorState:a4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __112__PKContinuityPaymentViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke;
    v9[3] = &unk_1E59CC248;
    v9[4] = self;
    objc_copyWeak(&v10, &location);
    [(PKAuthenticator *)authenticator evaluateRequest:v8 withCompletion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __112__PKContinuityPaymentViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__PKContinuityPaymentViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_2;
  block[3] = &unk_1E59CC220;
  block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v7);
}

void __112__PKContinuityPaymentViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_2(id *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [a1[4] _setAuthenticating:0];
  uint64_t v2 = [a1[5] result];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  switch(v2)
  {
    case 0:
      [*((id *)a1[4] + 148) state];
      char IsAuthentication = PKPaymentAuthorizationStateIsAuthentication();
      id v7 = PKLogFacilityTypeGetObject();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (IsAuthentication)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Authentication successful.", buf, 2u);
        }

        if ([a1[5] biometricMatch])
        {
          [MEMORY[0x1E4F88120] invokeSuccessFeedback];
          [a1[4] setProgressState:8 string:0 animated:1];
        }
        id v9 = a1[5];
        id v10 = (void *)*((void *)a1[4] + 148);
        id v7 = [v9 credential];
        [v10 didAuthenticateWithCredential:v7];
      }
      else if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Authentication successful but in wrong state - discarding credential", buf, 2u);
      }

      break;
    case 1:
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Authentication canceled by user.", buf, 2u);
      }

      [*((id *)a1[4] + 148) didResolveError];
      break;
    case 2:
    case 3:
    case 6:
      id v4 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      BOOL v5 = "Authentication canceled by app.";
      goto LABEL_21;
    case 4:
      id v4 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v12 = [v4 processName];
      int v13 = [v4 processIdentifier];
      uint64_t v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v35 = v12;
        __int16 v36 = 2048;
        uint64_t v37 = v13;
        _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Authentication by %@[%ld] preempted by another process.", buf, 0x16u);
      }

      uint64_t v15 = (void *)MEMORY[0x1E4F84A20];
      double v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F87538];
      id v32 = @"PKAuthenticatorResult";
      id v18 = [NSNumber numberWithInteger:4];
      id v33 = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      unint64_t v20 = [v16 errorWithDomain:v17 code:-1 userInfo:v19];
      uint64_t v21 = [v15 paramWithError:v20];
      [WeakRetained _didFailWithFatalError:v21];

      goto LABEL_22;
    case 5:
      v22 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = 0;
        _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Failed to authenticate for e-commerce: %@", buf, 0xCu);
      }

      v23 = (void *)MEMORY[0x1E4F84A20];
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F87538];
      id v26 = objc_msgSend(NSNumber, "numberWithInteger:", 5, @"PKAuthenticatorResult");
      uint64_t v31 = v26;
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v28 = [v24 errorWithDomain:v25 code:-1 userInfo:v27];
      __int16 v29 = [v23 paramWithError:v28];
      [WeakRetained _didFailWithError:v29];

      break;
    case 7:
      id v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        BOOL v5 = "Authentication selected fallback - this is not supported.";
LABEL_21:
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
      }
LABEL_22:

      break;
    default:
      break;
  }
}

- (int64_t)_authenticatorPolicy
{
  uint64_t v2 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  if ([v2 pinRequired]) {
    int64_t v3 = 3;
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (id)_evaluationRequestWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(PKContinuityPaymentViewController *)self _authenticatorPolicy];
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F88110]) initWithPolicy:v7];
  id v9 = v8;
  if (v5) {
    [v8 setInitialAuthenticatorState:a4];
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 0xA) {
      id v11 = 0;
    }
    else {
      id v11 = off_1E59CC2D8[v7];
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v11;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "New authenticator policy is %@", buf, 0xCu);
  }

  uint64_t v12 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  int v13 = [v12 pinRequired];

  if (v13)
  {
    uint64_t v14 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v15 = [v14 pass];
    double v16 = [v15 localizedDescription];
    uint64_t v17 = PKLocalizedPaymentString(&cfstr_InAppPaymentPi.isa, &stru_1EF1B4C70.isa, v16);

    [v9 setPINTitle:v17];
    id v18 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F87178]];
    [v9 setPINLength:v18];
  }

  return v9;
}

- (void)_didSucceedWithAuthorizationStateParam:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v5 = objc_alloc_init(MEMORY[0x1E4F84C38]);
  [v14 pendingTransactions];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        -[PKContinuityPaymentViewController _updatePendingTransaction:withAuthorizationStateParam:](self, "_updatePendingTransaction:withAuthorizationStateParam:", v9, v4, v14);
        id v10 = [v9 transaction];
        id v11 = [v9 paymentApplication];
        uint64_t v12 = [v9 pass];
        int v13 = [v12 uniqueID];

        [v5 insertOrUpdatePaymentTransaction:v10 forPassUniqueIdentifier:v13 paymentApplication:v11 completion:0];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__PKContinuityPaymentViewController__didSucceedWithAuthorizationStateParam___block_invoke;
  v16[3] = &unk_1E59CB100;
  objc_copyWeak(&v17, &location);
  [(PKContinuityPaymentViewController *)self setProgressState:12 string:0 animated:1 withCompletion:v16];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __76__PKContinuityPaymentViewController__didSucceedWithAuthorizationStateParam___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1200000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKContinuityPaymentViewController__didSucceedWithAuthorizationStateParam___block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __76__PKContinuityPaymentViewController__didSucceedWithAuthorizationStateParam___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int64_t v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 151);
    [v2 authorizationDidFinishWithError:0];

    id WeakRetained = v3;
  }
}

- (void)_updatePendingTransaction:(id)a3 withAuthorizationStateParam:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  uint64_t v6 = [v15 paymentApplication];
  uint64_t v7 = [v6 dpanIdentifier];

  BOOL v8 = [v5 peerPaymentTransactionMetadata];

  if (v8)
  {
    id v9 = [v8 dpanIdentifier];
    int v10 = [v9 isEqual:v7];

    if (v10)
    {
      id v11 = [v15 transaction];
      uint64_t v12 = [v8 serviceIdentifier];
      [v11 setServiceIdentifier:v12];

      int v13 = [v8 requestDeviceScoreIdentifier];
      [v11 setRequestDeviceScoreIdentifier:v13];

      uint64_t v14 = [v8 sendDeviceScoreIdentifier];
      [v11 setSendDeviceScoreIdentifier:v14];
    }
  }
}

- (void)_didFailWithError:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 error];
  uint64_t v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v29 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "In-app payment failed, error: %@", buf, 0xCu);
  }

  uint64_t v7 = [v5 domain];
  if ([v7 isEqualToString:*MEMORY[0x1E4F87538]])
  {
    BOOL v8 = [v5 code] == -2007;

    if (v8)
    {
      id v9 = [v5 userInfo];
      int v10 = [v9 objectForKey:*MEMORY[0x1E4F28A50]];

      id v11 = [v10 domain];
      uint64_t v12 = [v10 code];
      int v13 = [v11 isEqualToString:*MEMORY[0x1E4F87C30]];
      if (v12 == 2) {
        int v14 = v13;
      }
      else {
        int v14 = 0;
      }
      if (v14 == 1)
      {
        id v15 = PKLocalizedPaymentString(&cfstr_WebPaymentErro.isa);
        double v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v15 message:0 preferredStyle:1];
        id v17 = (void *)MEMORY[0x1E4FB1410];
        id v18 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
        long long v19 = [v17 actionWithTitle:v18 style:1 handler:0];
        [v16 addAction:v19];

        [(PKContinuityPaymentViewController *)self presentViewController:v16 animated:1 completion:0];
      }
      else
      {
        int v24 = [v11 isEqualToString:*MEMORY[0x1E4F88098]];
        if (v12 == 4) {
          int v25 = v24;
        }
        else {
          int v25 = 0;
        }
        if (v25 == 1)
        {
          v23 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_0.isa);
          goto LABEL_23;
        }
      }
      v23 = 0;
LABEL_23:

      [(PKContinuityPaymentViewController *)self _suspendAuthentication];
      if (v23) {
        goto LABEL_16;
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  [(PKContinuityPaymentViewController *)self _suspendAuthentication];
LABEL_12:
  long long v20 = [v5 localizedFailureReason];
  long long v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    PKLocalizedPaymentString(&cfstr_InAppPaymentEr_0.isa);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

LABEL_16:
  objc_initWeak((id *)buf, self);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__PKContinuityPaymentViewController__didFailWithError___block_invoke;
  v26[3] = &unk_1E59CB100;
  objc_copyWeak(&v27, (id *)buf);
  [(PKContinuityPaymentViewController *)self setProgressState:13 string:v23 animated:1 withCompletion:v26];
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

void __55__PKContinuityPaymentViewController__didFailWithError___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1200000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PKContinuityPaymentViewController__didFailWithError___block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __55__PKContinuityPaymentViewController__didFailWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v2 = WeakRetained;
    [WeakRetained[148] didResolveError];
    id WeakRetained = v2;
  }
}

- (void)_didFailWithFatalError:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  [(PKContinuityPaymentViewController *)self _suspendAuthentication];
  val = self;
  id v4 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  v23 = [v4 pass];

  if (([v23 hasAssociatedPeerPaymentAccount] & 1) != 0
    || ([v23 associatedAccountServiceAccountIdentifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = [(PKPaymentAuthorizationStateMachine *)val->_stateMachine model];
    uint64_t v7 = [v6 mode];

    if (v7 == 1)
    {
      long long v21 = [(PKPaymentAuthorizationStateMachine *)val->_stateMachine model];
      id v8 = objc_alloc_init(MEMORY[0x1E4F84C38]);
      id v9 = [v21 pendingTransactions];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v9);
            }
            int v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            int v14 = objc_msgSend(v13, "transaction", v21);
            id v15 = [v13 paymentApplication];
            double v16 = [v13 pass];
            id v17 = [v16 uniqueID];

            id v18 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v33 = v14;
              __int16 v34 = 2112;
              id v35 = v17;
              __int16 v36 = 2112;
              uint64_t v37 = v15;
              _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Inserting transaction: %@ for pass: %@ paymentApplication: %@", buf, 0x20u);
            }

            [v8 insertOrUpdatePaymentTransaction:v14 forPassUniqueIdentifier:v17 paymentApplication:v15 completion:0];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
        }
        while (v10);
      }
    }
  }
  objc_initWeak((id *)buf, val);
  long long v19 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_0.isa);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __60__PKContinuityPaymentViewController__didFailWithFatalError___block_invoke;
  v25[3] = &unk_1E59CB268;
  objc_copyWeak(&v27, (id *)buf);
  id v20 = v22;
  id v26 = v20;
  [(PKContinuityPaymentViewController *)val setProgressState:13 string:v19 animated:1 withCompletion:v25];

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

void __60__PKContinuityPaymentViewController__didFailWithFatalError___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1200000000);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__PKContinuityPaymentViewController__didFailWithFatalError___block_invoke_2;
  v3[3] = &unk_1E59CB010;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);

  objc_destroyWeak(&v5);
}

void __60__PKContinuityPaymentViewController__didFailWithFatalError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 151);
    id v4 = [*(id *)(a1 + 32) error];
    [v3 authorizationDidFinishWithError:v4];

    id WeakRetained = v5;
  }
}

- (void)_didCancel
{
  [(PKContinuityPaymentViewController *)self _suspendAuthentication];
  id v3 = [(PKContinuityPaymentViewController *)self delegate];
  [v3 authorizationDidFinishWithError:0];
}

- (void)_invalidPaymentDataWithParam:(id)a3
{
  id v4 = a3;
  [(PKContinuityPaymentViewController *)self _suspendAuthentication];
  BOOL v5 = [v4 dataType] != 3 || objc_msgSend(v4, "status") != 5;
  objc_initWeak(&location, self);
  uint64_t v6 = [v4 error];
  uint64_t v7 = [v6 localizedFailureReason];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PKContinuityPaymentViewController__invalidPaymentDataWithParam___block_invoke;
  v8[3] = &unk_1E59CC270;
  BOOL v10 = v5;
  objc_copyWeak(&v9, &location);
  [(PKContinuityPaymentViewController *)self setProgressState:13 string:v7 animated:1 withCompletion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __66__PKContinuityPaymentViewController__invalidPaymentDataWithParam___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    dispatch_time_t v2 = dispatch_time(0, 1200000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PKContinuityPaymentViewController__invalidPaymentDataWithParam___block_invoke_2;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v4, (id *)(a1 + 32));
    dispatch_after(v2, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v4);
  }
}

void __66__PKContinuityPaymentViewController__invalidPaymentDataWithParam___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v2 = WeakRetained;
    [WeakRetained _resumeAuthenticationWithPreviousError:0];
    [v2[148] didResolveError];
    id WeakRetained = v2;
  }
}

- (BOOL)paymentPass:(id *)a3 paymentApplication:(id *)a4 fromAID:(id)a5 selectedPaymentMethodType:(unint64_t)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v11 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v12 = [v11 acceptedPasses];
  uint64_t v33 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v33)
  {
    long long v30 = a3;
    long long v31 = a4;
    uint64_t v13 = *(void *)v41;
    id v32 = v11;
    id v35 = v12;
    uint64_t v29 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v12);
        }
        id v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        double v16 = [v15 deviceInAppPaymentApplications];
        id v17 = [v16 allObjects];
        id v34 = v15;
        id v18 = [v15 sortedPaymentApplications:v17 ascending:1];

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v37;
          while (2)
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v37 != v22) {
                objc_enumerationMutation(v19);
              }
              int v24 = *(void **)(*((void *)&v36 + 1) + 8 * j);
              int v25 = [v24 applicationIdentifier];
              if ([v25 isEqualToString:v10])
              {
                if (!a6)
                {

LABEL_23:
                  id *v30 = v34;
                  *long long v31 = v24;

                  BOOL v27 = 1;
                  uint64_t v11 = v32;
                  uint64_t v12 = v35;
                  goto LABEL_24;
                }
                uint64_t v26 = [v24 paymentType];

                if (v26 == a6) {
                  goto LABEL_23;
                }
              }
              else
              {
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        uint64_t v12 = v35;
        uint64_t v13 = v29;
      }
      BOOL v27 = 0;
      uint64_t v11 = v32;
      uint64_t v33 = [v35 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v33);
  }
  else
  {
    BOOL v27 = 0;
  }
LABEL_24:

  return v27;
}

- (int64_t)_progressStateForAuthenticationWithBiometricFailure:(BOOL)a3
{
  int64_t result = PKPaymentProgressStateBaseStateForAuthenticatorEvaluationState(self->_internalAuthenticationEvaluationState, [(PKPaymentAuthorizationFooterView *)self->_authorizationView state], self->_idleStateIsPasscode, a3);
  int64_t internalAuthenticationEvaluationState = self->_internalAuthenticationEvaluationState;
  if (internalAuthenticationEvaluationState == 2)
  {
LABEL_4:
    if (self->_coachingState == 3) {
      return 4;
    }
    return result;
  }
  if (internalAuthenticationEvaluationState != 1)
  {
    if (internalAuthenticationEvaluationState) {
      return result;
    }
    goto LABEL_4;
  }
  int64_t coachingState = self->_coachingState;
  int64_t v7 = 6;
  if (coachingState != 4) {
    int64_t v7 = result;
  }
  if (coachingState == 3) {
    return 4;
  }
  else {
    return v7;
  }
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  if (PKPearlIsAvailable())
  {
    BOOL v7 = var1 == 1 || (unint64_t)(self->_internalAuthenticationEvaluationState - 1) < 2;
    self->_idleStateIsPasscode = v7;
  }
  else
  {
    self->_idleStateIsPasscode = 0;
  }
  self->_int64_t internalAuthenticationEvaluationState = var0;

  [(PKContinuityPaymentViewController *)self _updateProgressStateIfAuthenticatingWithBiometricFailure:var1 == 1];
}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  if (self->_internalCoachingState != a4)
  {
    self->_int64_t internalCoachingState = a4;
    [(PKContinuityPaymentViewController *)self _updateCoachingState];
  }
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a4;
  id v10 = a5;
  if (self->_passcodeViewController)
  {
    if (v9) {
      v9[2](v9, 1);
    }
  }
  else if ([(PKPaymentAuthorizationStateMachine *)self->_stateMachine state] == 5)
  {
    [(PKContinuityPaymentViewController *)self _setPasscodeViewController:v8];
    [(UIViewController *)self->_passcodeViewController setModalPresentationStyle:5];
    passcodeViewController = self->_passcodeViewController;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91__PKContinuityPaymentViewController_presentPasscodeViewController_completionHandler_reply___block_invoke;
    v12[3] = &unk_1E59CAA98;
    uint64_t v13 = v9;
    [(PKContinuityPaymentViewController *)self presentViewController:passcodeViewController animated:1 completion:v12];
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }
}

uint64_t __91__PKContinuityPaymentViewController_presentPasscodeViewController_completionHandler_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)dismissPasscodeViewController
{
  passcodeViewController = self->_passcodeViewController;
  if (passcodeViewController)
  {
    id v4 = [(UIViewController *)passcodeViewController presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    [(PKContinuityPaymentViewController *)self _setPasscodeViewController:0];
  }
}

- (void)presentPassphraseViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a4;
  id v10 = a5;
  if (self->_passphraseViewController)
  {
    if (v9) {
      v9[2](v9, 1);
    }
  }
  else
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
    [v11 setModalPresentationStyle:6];
    uint64_t v12 = [v11 view];
    uint64_t v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v12 setBackgroundColor:v13];

    int v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPassphrasePressed];
    id v15 = [v8 navigationItem];
    [v15 setRightBarButtonItem:v14];

    [(PKContinuityPaymentViewController *)self _setPassphraseViewController:v11];
    passphraseViewController = self->_passphraseViewController;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __93__PKContinuityPaymentViewController_presentPassphraseViewController_completionHandler_reply___block_invoke;
    v17[3] = &unk_1E59CAA98;
    id v18 = v9;
    [(PKContinuityPaymentViewController *)self presentViewController:passphraseViewController animated:1 completion:v17];
  }
}

uint64_t __93__PKContinuityPaymentViewController_presentPassphraseViewController_completionHandler_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)dismissPassphraseViewController
{
  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine state];
  if ((PKPaymentAuthorizationStateIsTerminal() & 1) == 0)
  {
    passphraseViewController = self->_passphraseViewController;
    if (passphraseViewController)
    {
      id v4 = [(UIViewController *)passphraseViewController presentingViewController];
      [v4 dismissViewControllerAnimated:1 completion:0];

      [(PKContinuityPaymentViewController *)self _setPassphraseViewController:0];
    }
  }
}

- (void)authorizationFooterViewPasscodeButtonPressed:(id)a3
{
  if ([(PKPaymentAuthorizationStateMachine *)self->_stateMachine state] == 5)
  {
    if (self->_authenticating)
    {
      authenticator = self->_authenticator;
      [(PKAuthenticator *)authenticator fallbackToSystemPasscodeUI];
    }
    else
    {
      [(PKContinuityPaymentViewController *)self _startEvaluationWithHasInitialAuthenticatorState:0 initialAuthenticatorState:0];
    }
  }
}

- (void)authorizationFooterViewDidChangeConstraints:(id)a3
{
  id v4 = a3;
  if (self->_viewAppeared)
  {
    id v6 = v4;
    BOOL v5 = [(PKContinuityPaymentViewController *)self _updateActiveConstraints];
    id v4 = v6;
    if (!v5)
    {
      [(PKContinuityPaymentViewController *)self _layoutAnimated];
      id v4 = v6;
    }
  }
}

- (PKPaymentAuthorizationHostProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentAuthorizationHostProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKRemotePaymentRequest)remoteRequest
{
  return self->_remoteRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_compactConstraints, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_passphraseViewController, 0);
  objc_storeStrong((id *)&self->_passcodeViewController, 0);
  objc_storeStrong((id *)&self->_faviconImage, 0);
  objc_storeStrong((id *)&self->_authorizationView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_summaryContainerView, 0);
  objc_storeStrong((id *)&self->_priceView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_requestingSiteLabel, 0);
  objc_storeStrong((id *)&self->_requestingDeviceLabel, 0);
  objc_storeStrong((id *)&self->_physicalButtonView, 0);
  objc_storeStrong((id *)&self->_compactRegion, 0);
  objc_storeStrong((id *)&self->_dimmingBackgroundView, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end