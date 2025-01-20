@interface PKPaymentAuthorizationServiceViewController
- (BOOL)_abandonActiveEnrollmentAttempts;
- (BOOL)_passcodeAllowed;
- (BOOL)_passwordRequired;
- (BOOL)_setNavigationItemLeftItemFromNavigationTitle;
- (BOOL)_shouldShowSeparatorForRowAtIndexPath:(id)a3;
- (BOOL)_shouldShowUsePeerPaymentBalanceToggle;
- (BOOL)blockingHardwareCancels;
- (BOOL)paymentAuthorizationStateMachine:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5 withParam:(id)a6;
- (BOOL)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)_tableViewClassForDataItem:(id)a3;
- (Class)_viewPresenterClassForDataItem:(id)a3;
- (NSString)physicalButtonInstruction;
- (PKAuthenticator)authenticator;
- (PKPaymentAuthorizationHostProtocol)host;
- (PKPaymentAuthorizationPresenter)presenter;
- (PKPaymentAuthorizationServiceViewController)initWithLayout:(id)a3 presenter:(id)a4;
- (PKPaymentAuthorizationServiceViewControllerDelegate)delegate;
- (PKPaymentAuthorizationStateMachine)stateMachine;
- (id)_addCardEntry;
- (id)_availabilityStringForPass:(id)a3;
- (id)_availablePasses;
- (id)_compactNavigationController;
- (id)_evaluationRequestWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4;
- (id)_unavailablePasses;
- (id)dataItemForPaymentAuthorizationCouponCodeEntryViewController:(id)a3;
- (id)handlePaymentRequest:(id)a3 fromAppWithLocalizedName:(id)a4 andApplicationIdentifier:(id)a5;
- (id)handlePaymentRequest:(id)a3 relevantPassUniqueID:(id)a4 fromAppWithLocalizedName:(id)a5 applicationIdentifier:(id)a6 bundleIdentifier:(id)a7 teamIdentifier:(id)a8;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_authenticatorPolicy;
- (int64_t)_progressStateForAuthenticationWithBiometricFailure:(BOOL)a3;
- (int64_t)_totalViewStyle;
- (int64_t)coachingState;
- (int64_t)physicalButtonAnimationStyle;
- (int64_t)physicalButtonState;
- (int64_t)selectedPaymentApplicationIndexFromCardEntries:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_abandonPSD2StyleAMPBuy;
- (void)_addPassphraseViewControllerToHierarchy:(id)a3 withCompletion:(id)a4;
- (void)_createSubviews;
- (void)_didCancel:(BOOL)a3;
- (void)_didFailWithError:(id)a3;
- (void)_didFailWithFatalError:(id)a3;
- (void)_didSucceedWithAuthorizationStateParam:(id)a3;
- (void)_executeCompletionHandlers;
- (void)_handleModelUpdate;
- (void)_hostApplicationDidEnterBackground;
- (void)_hostApplicationWillEnterForeground;
- (void)_invalidPaymentDataWithParam:(id)a3;
- (void)_payWithPasswordPressed:(id)a3;
- (void)_processClientCallback:(id)a3;
- (void)_removePassphraseViewFromHierarchyWithCompletionHandler:(id)a3;
- (void)_resumeAuthenticationWithPreviousError:(id)a3 animated:(BOOL)a4;
- (void)_selectOptionsForDataItem:(id)a3;
- (void)_sendDidEncounterAuthorizationEventIfNecessary:(unint64_t)a3;
- (void)_setAuthenticating:(BOOL)a3;
- (void)_setNavigationItemLeftItemForAMP;
- (void)_setPasscodeViewController:(id)a3;
- (void)_setPassphraseViewController:(id)a3;
- (void)_setVisibility:(unsigned __int8)a3;
- (void)_setVisible:(BOOL)a3;
- (void)_setupBankAccounts;
- (void)_setupCouponCodeEntry;
- (void)_setupPaymentPassAndBillingAddress;
- (void)_setupShippingAddress;
- (void)_setupShippingContact;
- (void)_setupShippingMethods;
- (void)_setupWithPaymentRequest:(id)a3 relevantPassUniqueID:(id)a4 fromAppWithLocalizedName:(id)a5 applicationIdentifier:(id)a6 bundleIdentifier:(id)a7 teamIdentifier:(id)a8;
- (void)_showScrollIndicatorIfNeeded;
- (void)_showUnserviceableAddressAlertForErrors:(id)a3;
- (void)_startEvaluationWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4;
- (void)_suspendAuthentication;
- (void)_suspendAuthenticationAndForceReset:(BOOL)a3;
- (void)_updateAvailableCardsPreferences;
- (void)_updateBackgroundedState:(BOOL)a3;
- (void)_updateBankAccounts;
- (void)_updateCancelButtonEnabledForState:(unint64_t)a3 param:(id)a4;
- (void)_updateCoachingState;
- (void)_updateCouponCodeEntry;
- (void)_updateFooterStateIfAuthenticatingWithBiometricFailure:(BOOL)a3;
- (void)_updateLayoutForKeyboardAction:(id)a3;
- (void)_updatePendingTransaction:(id)a3 withAuthorizationStateParam:(id)a4;
- (void)_updatePhysicalButtonInstructionAndNotify:(BOOL)a3;
- (void)_updatePhysicalButtonState;
- (void)_updatePreferencesWithErrors:(id)a3;
- (void)_updatePreferredContentSize;
- (void)_updateShippingMethods;
- (void)_updateUserIntentStyle;
- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4;
- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4;
- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3;
- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3;
- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3;
- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4;
- (void)authorizationFooterViewDidChangeConstraints:(id)a3;
- (void)authorizationFooterViewPasscodeButtonPressed:(id)a3;
- (void)authorizationFooterViewWillChangeConstraints:(id)a3;
- (void)biometricAttemptFailed;
- (void)cancelPressed:(id)a3;
- (void)contextWillBeginPresentingSecondaryUI:(id)a3;
- (void)dealloc;
- (void)dismissPasscodeViewController;
- (void)dismissPassphraseViewController;
- (void)dismissPassphraseViewControllerWithCompletion:(id)a3;
- (void)handleDismissWithCompletion:(id)a3;
- (void)handleHostApplicationDidBecomeActive;
- (void)handleHostApplicationDidCancel;
- (void)handleHostApplicationWillResignActive:(BOOL)a3;
- (void)invalidate;
- (void)keyboardWillChange:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)paymentAuthorizationCouponCodeEntryViewController:(id)a3 didChangeCouponCode:(id)a4;
- (void)paymentAuthorizationCouponCodeEntryViewControllerDidFinish:(id)a3;
- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5;
- (void)resumeAndUpdateContentSize;
- (void)setAuthenticator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5;
- (void)setFooterState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6;
- (void)setHost:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PKPaymentAuthorizationServiceViewController

- (PKPaymentAuthorizationServiceViewController)initWithLayout:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v45.receiver = self;
  v45.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  v9 = [(PKPaymentAuthorizationServiceViewController *)&v45 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layout, a3);
    v10->_isAMPPayment = [v7 isAMPPayment];
    v10->_isInstallment = [v7 isInstallment];
    v10->_isPaymentSummaryPinned = [v7 isPaymentSummaryPinned];
    BOOL v11 = [(UIViewController *)v10 pkui_userInterfaceIdiomSupportsLargeLayouts];
    v10->_usingLargeLayout = v11;
    if (v11)
    {
      v12 = [(PKPaymentAuthorizationServiceViewController *)v10 traitCollection];
      if ([v12 userInterfaceIdiom] == 6 || (PKPearlIsAvailable() & 1) != 0) {
        char v13 = 0;
      }
      else {
        char v13 = PKHomeButtonIsAvailable() ^ 1;
      }
      p_allowBiometricPhysicalButtonInstruction = &v10->_allowBiometricPhysicalButtonInstruction;
      v10->_allowBiometricPhysicalButtonInstruction = v13;
    }
    else
    {
      p_allowBiometricPhysicalButtonInstruction = &v10->_allowBiometricPhysicalButtonInstruction;
      v10->_allowBiometricPhysicalButtonInstruction = 0;
    }
    BOOL v15 = (PKUserIntentIsAvailable() & 1) != 0 || *p_allowBiometricPhysicalButtonInstruction;
    v10->_allowCompactProcessing = v15;
    CGPoint v16 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v17 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v10->_lastKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v10->_lastKeyboardFrame.size = v17;
    v10->_keyboardFrame.origin = v16;
    v10->_keyboardFrame.size = v17;
    objc_storeWeak((id *)&v10->_presenter, v8);
    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    completionHandlers = v10->_completionHandlers;
    v10->_completionHandlers = v18;

    v20 = (PKPaymentAuthorizationStateMachine *)objc_alloc_init(MEMORY[0x1E4F84A38]);
    stateMachine = v10->_stateMachine;
    v10->_stateMachine = v20;

    [(PKPaymentAuthorizationStateMachine *)v10->_stateMachine setDelegate:v10];
    v22 = v10->_stateMachine;
    v23 = [MEMORY[0x1E4F84D50] sharedService];
    [(PKPaymentAuthorizationStateMachine *)v22 setPaymentWebService:v23];

    v24 = v10->_stateMachine;
    id v25 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    [(PKPaymentAuthorizationStateMachine *)v24 setPaymentService:v25];

    v26 = v10->_stateMachine;
    id v27 = objc_alloc_init(MEMORY[0x1E4F84270]);
    [(PKPaymentAuthorizationStateMachine *)v26 setAccountService:v27];

    v28 = v10->_stateMachine;
    v29 = [MEMORY[0x1E4F84E00] sharedInstance];
    [(PKPaymentAuthorizationStateMachine *)v28 setPeerPaymentService:v29];

    v30 = v10->_stateMachine;
    id v31 = objc_alloc_init(MEMORY[0x1E4F843D8]);
    [(PKPaymentAuthorizationStateMachine *)v30 setAggregateDictionary:v31];

    v32 = (PKAuthenticator *)objc_alloc_init(MEMORY[0x1E4F88108]);
    authenticator = v10->_authenticator;
    v10->_authenticator = v32;

    [(PKAuthenticator *)v10->_authenticator setDelegate:v10];
    [(PKPaymentAuthorizationServiceViewController *)v10 _updateUserIntentStyle];
    v34 = [MEMORY[0x1E4F84E10] sharedService];
    v35 = [v34 peerPaymentService];
    uint64_t v36 = [v35 account];
    peerPaymentAccount = v10->_peerPaymentAccount;
    v10->_peerPaymentAccount = (PKPeerPaymentAccount *)v36;

    v38 = [MEMORY[0x1E4F84D50] sharedService];
    v39 = [v38 context];
    v40 = [v39 configuration];
    v41 = [v40 contactFormatConfiguration];

    uint64_t v42 = [objc_alloc(MEMORY[0x1E4F845D8]) initWithConfiguration:v41];
    contactFormatValidator = v10->_contactFormatValidator;
    v10->_contactFormatValidator = (PKContactFormatValidator *)v42;

    [(PKPaymentAuthorizationServiceViewController *)v10 _createSubviews];
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine state];
  if ((PKPaymentAuthorizationStateIsTerminal() & 1) == 0)
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v6 = self;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): Deallocating service controller; will cancel",
        buf,
        0xCu);
    }

    [(PKPaymentAuthorizationServiceViewController *)self _didCancel:0];
  }
  [(PKPaymentAuthorizationServiceViewController *)self _removeSimulatorHIDListener];
  [(PKAuthenticator *)self->_authenticator invalidate];
  [(PKAuthenticator *)self->_authenticator setDelegate:0];
  +[PKPassSnapshotter purgeCache];
  [(PKPaymentAuthorizationServiceViewController *)self _executeCompletionHandlers];
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  [(PKPaymentAuthorizationServiceViewController *)&v4 dealloc];
}

- (void)_createSubviews
{
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  contentView = self->_contentView;
  self->_contentView = v3;

  id v5 = objc_alloc(MEMORY[0x1E4FB1D00]);
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  [(UITableView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v11 = [MEMORY[0x1E4FB1618] clearColor];
  [(UITableView *)v10 setBackgroundColor:v11];

  [(UITableView *)v10 setEstimatedRowHeight:66.0];
  [(UITableView *)v10 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [(UITableView *)v10 setSeparatorStyle:0];
  [(UITableView *)v10 setOpaque:0];
  detailTableView = self->_detailTableView;
  self->_detailTableView = v10;

  [(UITableView *)self->_detailTableView setScrollEnabled:0];
  if (self->_usingLargeLayout && !self->_isInstallment || self->_isPaymentSummaryPinned)
  {
    char v13 = objc_alloc_init(PKPaymentAuthorizationSummaryItemsView);
    summaryItemsView = self->_summaryItemsView;
    self->_summaryItemsView = v13;

    [(PKPaymentAuthorizationSummaryItemsView *)self->_summaryItemsView setShowsTopSeparator:self->_isPaymentSummaryPinned];
  }
  if (![(PKPaymentAuthorizationLayout *)self->_layout shouldSuppressTotal])
  {
    BOOL v15 = objc_alloc_init(PKPaymentAuthorizationTotalView);
    totalView = self->_totalView;
    self->_totalView = v15;
  }
  CGSize v17 = -[PKPaymentAuthorizationFooterView initWithFrame:layout:]([PKPaymentAuthorizationFooterView alloc], "initWithFrame:layout:", self->_layout, v6, v7, v8, v9);
  footerView = self->_footerView;
  self->_footerView = v17;

  [(PKPaymentAuthorizationFooterView *)self->_footerView setUserIntentStyle:self->_userIntentStyle];
  [(PKPaymentAuthorizationFooterView *)self->_footerView setDelegate:self];
  if (PKPearlIsAvailable()) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 0;
  }
  [(PKPaymentAuthorizationServiceViewController *)self setFooterState:v19 string:0 animated:0];
  objc_initWeak(&location, self);
  v20 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __62__PKPaymentAuthorizationServiceViewController__createSubviews__block_invoke;
  id v31 = &unk_1E59CBEE0;
  objc_copyWeak(&v32, &location);
  v21 = [v20 actionWithHandler:&v28];
  v22 = [PKPaymentAuthorizationPasswordButtonView alloc];
  v23 = -[PKPaymentAuthorizationPasswordButtonView initWithFrame:action:](v22, "initWithFrame:action:", v21, v6, v7, v8, v9, v28, v29, v30, v31);
  passwordButtonView = self->_passwordButtonView;
  self->_passwordButtonView = v23;

  [(PKPaymentAuthorizationPasswordButtonView *)self->_passwordButtonView setHidden:1];
  id v25 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(UIView *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = PKAuthorizationSeparatorColor();
  [(UIView *)v25 setBackgroundColor:v26];

  passphraseSeparatorView = self->_passphraseSeparatorView;
  self->_passphraseSeparatorView = v25;

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __62__PKPaymentAuthorizationServiceViewController__createSubviews__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_super v4 = [v3 sender];

  [WeakRetained _payWithPasswordPressed:v4];
}

- (void)viewDidLoad
{
  v92.receiver = self;
  v92.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  [(PKPaymentAuthorizationServiceViewController *)&v92 viewDidLoad];
  unint64_t v3 = [(PKPaymentAuthorizationLayout *)self->_layout requestType];
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
  [v4 addObserver:self selector:sel_keyboardWillChange_ name:*MEMORY[0x1E4FB2C48] object:0];
  v89 = v4;
  [v4 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  id v5 = [(PKPaymentAuthorizationServiceViewController *)self view];
  [v5 setAutoresizingMask:0];
  double v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v6];

  [(PKPaymentAuthorizationServiceViewController *)self setEdgesForExtendedLayout:0];
  double v7 = [(PKPaymentAuthorizationServiceViewController *)self navigationItem];
  if (!self->_isAMPPayment || v3 == 0)
  {
    BOOL v9 = v3 > 0xD || ((1 << v3) & 0x20C0) == 0;
    if (v9
      || ![(PKPaymentAuthorizationServiceViewController *)self _setNavigationItemLeftItemFromNavigationTitle])
    {
      v10 = +[PKPaymentAuthorizationNavigationBar applePayBarButtonItem];
      [v7 setLeftBarButtonItem:v10 animated:0];
    }
  }
  else
  {
    [(PKPaymentAuthorizationServiceViewController *)self _setNavigationItemLeftItemForAMP];
  }
  [v7 setLeftItemsSupplementBackButton:1];
  BOOL v11 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelPressed_];
  cancelBarButtonItem = self->_cancelBarButtonItem;
  self->_cancelBarButtonItem = v11;

  [v7 setRightBarButtonItem:self->_cancelBarButtonItem animated:0];
  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:self->_contentView];
  if ((!self->_usingLargeLayout || self->_isAMPPayment || self->_isInstallment) && !self->_isPaymentSummaryPinned)
  {
    summaryItemsView = self->_summaryItemsView;
    self->_summaryItemsView = 0;

    totalView = self->_totalView;
    if (!totalView) {
      totalView = self->_footerView;
    }
    v90 = totalView;
    v86 = self->_detailTableView;
  }
  else
  {
    [(PKPaymentAuthorizationSummaryItemsView *)self->_summaryItemsView setLayout:self->_layout];
    [(UIView *)self->_contentView addSubview:self->_summaryItemsView];
    v86 = self->_summaryItemsView;
    v90 = v86;
  }
  [(UITableView *)self->_detailTableView setDataSource:self];
  [(UITableView *)self->_detailTableView setDelegate:self];
  [(UIView *)self->_contentView addSubview:self->_detailTableView];
  [(PKPaymentAuthorizationFooterView *)self->_footerView setLayout:self->_layout];
  footerView = self->_footerView;
  CGPoint v16 = [MEMORY[0x1E4FB1618] clearColor];
  [(PKPaymentAuthorizationFooterView *)footerView setBackgroundColor:v16];

  [(UIView *)self->_contentView addSubview:self->_footerView];
  [(PKPaymentAuthorizationPasswordButtonView *)self->_passwordButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentView addSubview:self->_passwordButtonView];
  [v5 addSubview:self->_passphraseSeparatorView];
  CGSize v17 = self->_totalView;
  if (v17)
  {
    [(PKPaymentAuthorizationTotalView *)v17 setLayout:self->_layout];
    v18 = self->_totalView;
    uint64_t v19 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKPaymentAuthorizationTotalView *)v18 setBackgroundColor:v19];

    [(UIView *)self->_contentView addSubview:self->_totalView];
  }
  v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_contentView attribute:7 relatedBy:0 toItem:v5 attribute:7 multiplier:1.0 constant:0.0];
  [v5 addConstraint:v20];

  v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_contentView attribute:4 relatedBy:0 toItem:v5 attribute:4 multiplier:1.0 constant:0.0];
  [v5 addConstraint:v21];

  v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_contentView attribute:2 relatedBy:0 toItem:v5 attribute:2 multiplier:1.0 constant:0.0];
  contentViewRightConstraint = self->_contentViewRightConstraint;
  self->_contentViewRightConstraint = v22;

  [v5 addConstraint:self->_contentViewRightConstraint];
  v24 = [v5 safeAreaLayoutGuide];
  id v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_contentView attribute:3 relatedBy:0 toItem:v24 attribute:3 multiplier:1.0 constant:0.0];
  LODWORD(v26) = 1148829696;
  [v25 setPriority:v26];
  [v5 addConstraint:v25];
  id v27 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_contentView attribute:3 relatedBy:1 toItem:v24 attribute:3 multiplier:1.0 constant:0.0];

  LODWORD(v28) = 1148846080;
  [v27 setPriority:v28];
  v88 = v27;
  [v5 addConstraint:v27];
  uint64_t v29 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_contentView attribute:4 relatedBy:0 toItem:v24 attribute:4 multiplier:1.0 constant:0.0];
  LODWORD(v30) = 1148846080;
  [v29 setPriority:v30];
  v87 = v29;
  [v5 addConstraint:v29];
  contentView = self->_contentView;
  id v32 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_detailTableView attribute:1 relatedBy:0 toItem:contentView attribute:1 multiplier:1.0 constant:0.0];
  [(UIView *)contentView addConstraint:v32];

  v33 = self->_contentView;
  v34 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_detailTableView attribute:2 relatedBy:0 toItem:v33 attribute:2 multiplier:1.0 constant:0.0];
  [(UIView *)v33 addConstraint:v34];

  v35 = self->_contentView;
  uint64_t v36 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_detailTableView attribute:3 relatedBy:0 toItem:v35 attribute:3 multiplier:1.0 constant:0.0];
  [(UIView *)v35 addConstraint:v36];

  v37 = self->_contentView;
  v38 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_detailTableView attribute:4 relatedBy:0 toItem:v90 attribute:3 multiplier:1.0 constant:0.0];
  [(UIView *)v37 addConstraint:v38];

  if (self->_usingLargeLayout || self->_isPaymentSummaryPinned)
  {
    v39 = self->_summaryItemsView;
    if (v39)
    {
      v40 = self->_contentView;
      v41 = [MEMORY[0x1E4F28DC8] constraintWithItem:v39 attribute:1 relatedBy:0 toItem:v40 attribute:1 multiplier:1.0 constant:0.0];
      [(UIView *)v40 addConstraint:v41];

      uint64_t v42 = self->_contentView;
      v43 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_summaryItemsView attribute:2 relatedBy:0 toItem:v42 attribute:2 multiplier:1.0 constant:0.0];
      [(UIView *)v42 addConstraint:v43];

      v44 = self->_contentView;
      objc_super v45 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_summaryItemsView attribute:3 relatedBy:0 toItem:self->_detailTableView attribute:4 multiplier:1.0 constant:0.0];
      [(UIView *)v44 addConstraint:v45];

      v46 = self->_totalView;
      if (!v46) {
        v46 = self->_footerView;
      }
      v47 = self->_contentView;
      v48 = (void *)MEMORY[0x1E4F28DC8];
      v49 = self->_summaryItemsView;
      id v50 = v46;
      v51 = [v48 constraintWithItem:v49 attribute:4 relatedBy:0 toItem:v50 attribute:3 multiplier:1.0 constant:0.0];
      [(UIView *)v47 addConstraint:v51];

      v52 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_summaryItemsView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
      summaryHeightConstraint = self->_summaryHeightConstraint;
      self->_summaryHeightConstraint = v52;

      [(UIView *)self->_contentView addConstraint:self->_summaryHeightConstraint];
    }
  }
  v54 = self->_totalView;
  if (v54)
  {
    v55 = self->_contentView;
    v56 = [MEMORY[0x1E4F28DC8] constraintWithItem:v54 attribute:1 relatedBy:0 toItem:v55 attribute:1 multiplier:1.0 constant:0.0];
    [(UIView *)v55 addConstraint:v56];

    v57 = self->_contentView;
    v58 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_totalView attribute:2 relatedBy:0 toItem:v57 attribute:2 multiplier:1.0 constant:0.0];
    [(UIView *)v57 addConstraint:v58];

    v59 = self->_contentView;
    v60 = (PKPaymentAuthorizationTotalView *)v86;
    v61 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_totalView attribute:3 relatedBy:0 toItem:v86 attribute:4 multiplier:1.0 constant:0.0];
    [(UIView *)v59 addConstraint:v61];

    v62 = self->_contentView;
    v63 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_totalView attribute:4 relatedBy:0 toItem:self->_footerView attribute:3 multiplier:1.0 constant:0.0];
    [(UIView *)v62 addConstraint:v63];
  }
  else
  {
    v63 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v63, OS_LOG_TYPE_DEFAULT, "Card on file request suppressing total view", buf, 2u);
    }
    v60 = (PKPaymentAuthorizationTotalView *)v86;
  }

  v64 = self->_contentView;
  v65 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_footerView attribute:1 relatedBy:0 toItem:v64 attribute:1 multiplier:1.0 constant:0.0];
  [(UIView *)v64 addConstraint:v65];

  v66 = self->_contentView;
  v67 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_footerView attribute:2 relatedBy:0 toItem:v66 attribute:2 multiplier:1.0 constant:0.0];
  [(UIView *)v66 addConstraint:v67];

  v68 = self->_contentView;
  if (self->_totalView) {
    v69 = self->_totalView;
  }
  else {
    v69 = v60;
  }
  v70 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_footerView attribute:3 relatedBy:0 toItem:v69 attribute:4 multiplier:1.0 constant:0.0];
  [(UIView *)v68 addConstraint:v70];

  v71 = self->_contentView;
  v72 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passwordButtonView attribute:1 relatedBy:0 toItem:v71 attribute:1 multiplier:1.0 constant:0.0];
  [(UIView *)v71 addConstraint:v72];

  v73 = self->_contentView;
  v74 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passwordButtonView attribute:2 relatedBy:0 toItem:v73 attribute:2 multiplier:1.0 constant:0.0];
  [(UIView *)v73 addConstraint:v74];

  v75 = self->_contentView;
  v76 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passwordButtonView attribute:3 relatedBy:0 toItem:self->_footerView attribute:4 multiplier:1.0 constant:0.0];
  [(UIView *)v75 addConstraint:v76];

  v77 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passwordButtonView attribute:4 relatedBy:0 toItem:self->_contentView attribute:4 multiplier:1.0 constant:0.0];
  LODWORD(v78) = 1148829696;
  [v77 setPriority:v78];
  [(UIView *)self->_contentView addConstraint:v77];
  v79 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passphraseSeparatorView attribute:1 relatedBy:0 toItem:self->_contentView attribute:2 multiplier:1.0 constant:0.0];
  [v5 addConstraint:v79];

  v80 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passphraseSeparatorView attribute:3 relatedBy:0 toItem:v24 attribute:3 multiplier:1.0 constant:0.0];
  [v5 addConstraint:v80];

  v81 = (void *)MEMORY[0x1E4F28DC8];
  passphraseSeparatorView = self->_passphraseSeparatorView;
  PKFloatCeilToPixel();
  v84 = [v81 constraintWithItem:passphraseSeparatorView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v83];
  [v5 addConstraint:v84];

  v85 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_passphraseSeparatorView attribute:4 relatedBy:0 toItem:v5 attribute:4 multiplier:1.0 constant:0.0];
  [v5 addConstraint:v85];
}

- (BOOL)_setNavigationItemLeftItemFromNavigationTitle
{
  v13[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PKPaymentAuthorizationServiceViewController *)self navigationItem];
  objc_super v4 = [(PKPaymentAuthorizationLayout *)self->_layout localizedNavigationTitle];
  uint64_t v5 = [v4 length];
  if (v5)
  {
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v4 style:0 target:0 action:0];
    [v6 setEnabled:0];
    v12[0] = *MEMORY[0x1E4FB06F8];
    double v7 = (void *)MEMORY[0x1E4FB08E0];
    [MEMORY[0x1E4FB08E0] buttonFontSize];
    double v8 = objc_msgSend(v7, "boldSystemFontOfSize:");
    v13[0] = v8;
    v12[1] = *MEMORY[0x1E4FB0700];
    BOOL v9 = [MEMORY[0x1E4FB1618] labelColor];
    v13[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

    [v6 setTitleTextAttributes:v10 forState:2];
    [v6 setTitleTextAttributes:v10 forState:0];
    [v3 setLeftBarButtonItem:v6 animated:0];
  }
  return v5 != 0;
}

- (void)_setNavigationItemLeftItemForAMP
{
  if (![(PKPaymentAuthorizationServiceViewController *)self _setNavigationItemLeftItemFromNavigationTitle])
  {
    id v4 = [(PKPaymentAuthorizationServiceViewController *)self navigationItem];
    unint64_t v3 = +[PKPaymentAuthorizationNavigationBar cardOnFileBarButtonItemForRequestor:[(PKPaymentAuthorizationLayout *)self->_layout requestor]];
    [v4 setLeftBarButtonItem:v3 animated:0];
  }
}

- (void)_setVisibility:(unsigned __int8)a3
{
  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    [(PKPaymentAuthorizationServiceViewController *)self _setVisible:PKViewVisibilityStateIsVisible()];
    id v4 = [(PKPaymentAuthorizationServiceViewController *)self viewIfLoaded];
    [v4 setNeedsLayout];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  [(PKPaymentAuthorizationServiceViewController *)&v5 viewWillAppear:a3];
  [(PKPaymentAuthorizationServiceViewController *)self _setVisibility:1];
  passphraseViewController = self->_passphraseViewController;
  if (passphraseViewController) {
    [(UIViewController *)passphraseViewController becomeFirstResponder];
  }
  [(PKPaymentAuthorizationServiceViewController *)self _startSimulatorHIDListener];
  [(PKPaymentAuthorizationServiceViewController *)self resumeAndUpdateContentSize];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  [(PKPaymentAuthorizationServiceViewController *)&v10 viewDidAppear:a3];
  [(PKPaymentAuthorizationServiceViewController *)self _setVisibility:2];
  [(PKPaymentAuthorizationServiceViewController *)self _showScrollIndicatorIfNeeded];
  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87020];
  uint64_t v6 = *MEMORY[0x1E4F864A0];
  uint64_t v7 = *MEMORY[0x1E4F86988];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86420];
  v12[0] = v6;
  v12[1] = v8;
  v11[2] = *MEMORY[0x1E4F86730];
  void v12[2] = *MEMORY[0x1E4F86840];
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v4 subject:v5 sendEvent:v9];

  kdebug_trace();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  [(PKPaymentAuthorizationServiceViewController *)&v4 viewWillDisappear:a3];
  [(UIViewController *)self->_passphraseViewController resignFirstResponder];
  [(PKPaymentAuthorizationServiceViewController *)self _setVisibility:3];
  [(PKPaymentAuthorizationServiceViewController *)self _removeSimulatorHIDListener];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  [(PKPaymentAuthorizationServiceViewController *)&v9 viewDidDisappear:a3];
  [(PKPaymentAuthorizationServiceViewController *)self _setVisibility:0];
  objc_super v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87020];
  uint64_t v6 = *MEMORY[0x1E4F86730];
  v10[0] = *MEMORY[0x1E4F86308];
  v10[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86840];
  v11[0] = *MEMORY[0x1E4F864A8];
  v11[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 subject:v5 sendEvent:v8];
}

- (void)viewWillLayoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  [(PKPaymentAuthorizationServiceViewController *)&v30 viewWillLayoutSubviews];
  ++self->_layoutRecursionCounter;
  unint64_t v3 = [(PKPaymentAuthorizationServiceViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  if (PKViewVisibilityStateIsVisible())
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if (!CGRectIsNull(self->_keyboardFrame))
    {
      CGPoint v16 = [v3 window];
      CGSize v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
        objc_msgSend(v3, "convertRect:fromView:", 0);
        CGFloat x = v18;
        CGFloat y = v19;
        CGFloat width = v20;
        CGFloat height = v21;
      }
    }
  }
  else
  {
    CGFloat x = self->_lastKeyboardFrame.origin.x;
    CGFloat y = self->_lastKeyboardFrame.origin.y;
    CGFloat width = self->_lastKeyboardFrame.size.width;
    CGFloat height = self->_lastKeyboardFrame.size.height;
  }
  self->_lastKeyboardFrame.origin.CGFloat x = x;
  self->_lastKeyboardFrame.origin.CGFloat y = y;
  self->_lastKeyboardFrame.size.CGFloat width = width;
  self->_lastKeyboardFrame.size.CGFloat height = height;
  if (self->_passphraseBottomConstraint && self->_needsToAccommodateKeyboard && !self->_usingLargeLayout)
  {
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    if (CGRectIsNull(v31))
    {
      passphraseBottomConstraint = self->_passphraseBottomConstraint;
      double v23 = 0.0;
    }
    else
    {
      v32.origin.CGFloat x = v5;
      v32.origin.CGFloat y = v7;
      v32.size.CGFloat width = v9;
      v32.size.CGFloat height = v11;
      CGFloat MaxY = CGRectGetMaxY(v32);
      passphraseBottomConstraint = self->_passphraseBottomConstraint;
      double v23 = -fmax(MaxY - self->_lastKeyboardFrame.origin.y, 0.0);
    }
    [(NSLayoutConstraint *)passphraseBottomConstraint setConstant:v23];
  }
  summaryItemsView = self->_summaryItemsView;
  if (summaryItemsView)
  {
    summaryHeightConstraint = self->_summaryHeightConstraint;
    if (summaryHeightConstraint)
    {
      id v27 = [(PKPaymentAuthorizationServiceViewController *)self view];
      [v27 bounds];
      -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:](summaryItemsView, "sizeThatFits:", v28, 1.79769313e308);
      [(NSLayoutConstraint *)summaryHeightConstraint setConstant:v29];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  [(PKPaymentAuthorizationServiceViewController *)&v4 viewDidLayoutSubviews];
  unsigned __int16 v3 = self->_layoutRecursionCounter - 1;
  self->_layoutRecursionCounter = v3;
  if (!v3) {
    [(PKPaymentAuthorizationServiceViewController *)self _updatePreferredContentSize];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  [(PKPaymentAuthorizationServiceViewController *)&v11 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    [(UITableView *)self->_detailTableView beginUpdates];
    [(UITableView *)self->_detailTableView endUpdates];
    [(PKPaymentAuthorizationServiceViewController *)self _updatePreferredContentSize];
    CGFloat v7 = [(PKPaymentAuthorizationServiceViewController *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 1)
    {
      if (PKPearlIsAvailable())
      {
        CGFloat v9 = (void *)MEMORY[0x1E4F72FC8];
        double v10 = [v6 screen];
        self->_faceIDCameraEdge = objc_msgSend(v9, "pkui_cameraEdgeForScreen:", v10);

        [(PKPaymentAuthorizationServiceViewController *)self _updateCoachingState];
      }
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  uint64_t v8 = [(PKPaymentAuthorizationServiceViewController *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 == 1)
  {
    if (PKPearlIsAvailable())
    {
      double v10 = (void *)MEMORY[0x1E4F72FC8];
      objc_super v11 = [(PKPaymentAuthorizationServiceViewController *)self viewIfLoaded];
      v12 = [v11 window];
      char v13 = [v12 screen];
      self->_faceIDCameraEdge = objc_msgSend(v10, "pkui_cameraEdgeForScreen:", v13);

      [(PKPaymentAuthorizationServiceViewController *)self _updateCoachingState];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __98__PKPaymentAuthorizationServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_1E59CC1F8;
    v15[4] = self;
    [v7 animateAlongsideTransition:v15 completion:0];
  }
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  -[PKPaymentAuthorizationServiceViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __98__PKPaymentAuthorizationServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1024) updateRotation];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationServiceViewController;
  [(PKPaymentAuthorizationServiceViewController *)&v4 traitCollectionDidChange:a3];
  [(PKPaymentAuthorizationSummaryItemsView *)self->_summaryItemsView setNeedsLayout];
  [(PKPaymentAuthorizationTotalView *)self->_totalView setNeedsUpdateConstraints];
  [(PKPaymentAuthorizationFooterView *)self->_footerView setNeedsUpdateConstraints];
  [(PKPaymentAuthorizationPasswordButtonView *)self->_passwordButtonView setNeedsUpdateConstraints];
}

- (void)keyboardWillShow:(id)a3
{
  objc_super v4 = [a3 userInfo];
  CGFloat v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PKPaymentAuthorizationServiceViewController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E59CADB8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKPaymentAuthorizationServiceViewController *)self _updateLayoutForKeyboardAction:v7];
}

BOOL __64__PKPaymentAuthorizationServiceViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGFloat v3 = *(double *)(v2 + 1152);
  CGFloat v4 = *(double *)(v2 + 1160);
  CGFloat v5 = *(double *)(v2 + 1168);
  CGFloat v6 = *(double *)(v2 + 1176);
  *(unsigned char *)(v2 + 1144) = 1;
  uint64_t v8 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  uint64_t v9 = (void *)(v8 + 1152);
  if (v7)
  {
    [v7 CGRectValue];
    void *v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)uint64_t v9 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v8 + 1168) = v14;
  }
  v16.origin.CGFloat x = v3;
  v16.origin.CGFloat y = v4;
  v16.size.double width = v5;
  v16.size.double height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1152), v16);
}

- (void)keyboardWillChange:(id)a3
{
  if (self->_keyboardVisible)
  {
    CGFloat v4 = [a3 userInfo];
    CGFloat v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __66__PKPaymentAuthorizationServiceViewController_keyboardWillChange___block_invoke;
      v6[3] = &unk_1E59CADB8;
      v6[4] = self;
      id v7 = v5;
      [(PKPaymentAuthorizationServiceViewController *)self _updateLayoutForKeyboardAction:v6];
    }
  }
}

BOOL __66__PKPaymentAuthorizationServiceViewController_keyboardWillChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CGFloat v3 = v2 + 144;
  CGFloat v4 = *((double *)v2 + 144);
  CGFloat v5 = *((double *)v2 + 145);
  CGFloat v6 = *((double *)v2 + 146);
  CGFloat v7 = *((double *)v2 + 147);
  [*(id *)(a1 + 40) CGRectValue];
  void *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.CGFloat x = v4;
  v13.origin.CGFloat y = v5;
  v13.size.double width = v6;
  v13.size.double height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1152), v13);
}

- (void)keyboardWillHide:(id)a3
{
  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __64__PKPaymentAuthorizationServiceViewController_keyboardWillHide___block_invoke;
    v3[3] = &unk_1E59CADE0;
    v3[4] = self;
    [(PKPaymentAuthorizationServiceViewController *)self _updateLayoutForKeyboardAction:v3];
  }
}

BOOL __64__PKPaymentAuthorizationServiceViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CGRect v8 = *(CGRect *)(v1 + 1152);
  *(unsigned char *)(v1 + 1144) = 0;
  uint64_t v2 = (_OWORD *)(*(void *)(a1 + 32) + 1152);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  _OWORD *v2 = *MEMORY[0x1E4F1DB20];
  v2[1] = v3;
  *(void *)&long long v3 = *(void *)(*(void *)(a1 + 32) + 1152);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1160);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1168);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1176);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t v4 = (uint64_t (**)(void))a3;
  if (v4)
  {
    uint64_t v5 = [(PKPaymentAuthorizationServiceViewController *)self viewIfLoaded];
    int IsVisible = PKViewVisibilityStateIsVisible();
    int v7 = IsVisible;
    if (v5 && IsVisible) {
      [v5 layoutIfNeeded];
    }
    int v8 = v4[2](v4);
    if (v5)
    {
      if (v8)
      {
        [v5 setNeedsLayout];
        [(PKPaymentAuthorizationServiceViewController *)self _updatePreferredContentSize];
        if (v7)
        {
          uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          void v10[2] = __78__PKPaymentAuthorizationServiceViewController__updateLayoutForKeyboardAction___block_invoke;
          v10[3] = &unk_1E59CA7D0;
          id v11 = v5;
          [v9 _animateUsingDefaultTimingWithOptions:134 animations:v10 completion:0];
        }
      }
    }
  }
}

uint64_t __78__PKPaymentAuthorizationServiceViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (id)handlePaymentRequest:(id)a3 fromAppWithLocalizedName:(id)a4 andApplicationIdentifier:(id)a5
{
  return [(PKPaymentAuthorizationServiceViewController *)self handlePaymentRequest:a3 relevantPassUniqueID:0 fromAppWithLocalizedName:a4 applicationIdentifier:a5 bundleIdentifier:0 teamIdentifier:0];
}

- (id)handlePaymentRequest:(id)a3 relevantPassUniqueID:(id)a4 fromAppWithLocalizedName:(id)a5 applicationIdentifier:(id)a6 bundleIdentifier:(id)a7 teamIdentifier:(id)a8
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  double v20 = [MEMORY[0x1E4F84C18] validatorWithObject:v14];
  id v25 = 0;
  char v21 = [v20 isValidWithError:&v25];
  id v22 = v25;

  if (v21)
  {
    [(PKPaymentAuthorizationServiceViewController *)self _setupWithPaymentRequest:v14 relevantPassUniqueID:v15 fromAppWithLocalizedName:v16 applicationIdentifier:v17 bundleIdentifier:v18 teamIdentifier:v19];
    if (!v22) {
      goto LABEL_8;
    }
LABEL_7:
    [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didEncounterFatalError:v22];
    goto LABEL_8;
  }
  double v23 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v22;
    _os_log_error_impl(&dword_19F450000, v23, OS_LOG_TYPE_ERROR, "Payment is invalid: %{public}@", buf, 0xCu);
  }

  if (v22) {
    goto LABEL_7;
  }
LABEL_8:

  return v22;
}

- (void)invalidate
{
  [(PKPaymentAuthorizationServiceViewController *)self _suspendAuthenticationAndForceReset:0];
  authenticator = self->_authenticator;

  [(PKAuthenticator *)authenticator invalidate];
}

- (BOOL)paymentAuthorizationStateMachine:(id)a3 didTransitionFromState:(unint64_t)a4 toState:(unint64_t)a5 withParam:(id)a6
{
  id v8 = a6;
  [(PKPaymentAuthorizationServiceViewController *)self _updateCancelButtonEnabledForState:a5 param:v8];
  switch(a5)
  {
    case 3uLL:
      [(PKPaymentAuthorizationServiceViewController *)self _invalidPaymentDataWithParam:v8];
      break;
    case 5uLL:
      [(PKPaymentAuthorizationServiceViewController *)self _resumeAuthenticationWithPreviousError:v8 animated:1];
      break;
    case 6uLL:
      [(PKPaymentAuthorizationServiceViewController *)self _suspendAuthentication];
      break;
    case 7uLL:
      [(PKPaymentAuthorizationServiceViewController *)self _processClientCallback:v8];
      break;
    case 9uLL:
      [(PKPaymentAuthorizationServiceViewController *)self setFooterState:11 string:0 animated:1];
      break;
    case 0xDuLL:
      [(PKPaymentAuthorizationServiceViewController *)self _didCancel:1];
      break;
    case 0xEuLL:
      [(PKPaymentAuthorizationServiceViewController *)self _didFailWithError:v8];
      break;
    case 0xFuLL:
      [(PKPaymentAuthorizationServiceViewController *)self _didFailWithFatalError:v8];
      break;
    case 0x10uLL:
      [(PKPaymentAuthorizationServiceViewController *)self _didSucceedWithAuthorizationStateParam:v8];
      break;
    default:
      break;
  }

  return 1;
}

- (void)_updateCancelButtonEnabledForState:(unint64_t)a3 param:(id)a4
{
  id v11 = a4;
  uint64_t v6 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  int v7 = [v6 paymentRequest];

  BOOL v8 = ([v7 isPeerPaymentRequest] & 1) != 0 || objc_msgSend(v7, "APIType") == 3;
  if (a3 == 7)
  {
    BOOL v9 = [v11 kind] >= 5 && objc_msgSend(v11, "kind") < 9;
  }
  else
  {
    BOOL v9 = a3 == 16;
    if (a3 - 9 < 4) {
      BOOL v9 = 1;
    }
  }
  self->_cancelButtonDisabled = v9;
  [(UIBarButtonItem *)self->_cancelBarButtonItem setEnabled:!v9];
  BOOL v10 = self->_cancelButtonDisabled && v8;
  self->_blockingHardwareCancels = v10;
}

- (void)_processClientCallback:(id)a3
{
  id v11 = a3;
  [(PKPaymentAuthorizationServiceViewController *)self setFooterState:10 string:0 animated:1];
  switch([v11 kind])
  {
    case 0:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      [WeakRetained authorizationDidRequestMerchantSession];
      goto LABEL_16;
    case 1:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      uint64_t v5 = [v11 shippingContact];
      [WeakRetained authorizationDidSelectShippingAddress:v5];
      goto LABEL_15;
    case 2:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      uint64_t v5 = [v11 shippingMethod];
      [WeakRetained authorizationDidSelectShippingMethod:v5];
      goto LABEL_15;
    case 3:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      uint64_t v5 = [v11 paymentMethod];
      [WeakRetained authorizationDidSelectPaymentMethod:v5];
      goto LABEL_15;
    case 4:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      [WeakRetained authorizationDidAuthorizeContext];
      goto LABEL_16;
    case 5:
      if (self->_isAMPPayment)
      {
        uint64_t v6 = [v11 payment];
        [v6 setBiometricAuthorizationAttempts:self->_biometryAttempts];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      uint64_t v5 = [v11 payment];
      [WeakRetained authorizationDidAuthorizePayment:v5];
      goto LABEL_15;
    case 6:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      uint64_t v5 = [v11 purchase];
      [WeakRetained authorizationDidAuthorizePurchase:v5];
      goto LABEL_15;
    case 7:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      uint64_t v5 = [v11 authorizedPeerPaymentQuote];
      [WeakRetained authorizationDidAuthorizePeerPaymentQuote:v5];
      goto LABEL_15;
    case 8:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      uint64_t v5 = [v11 applePayTrustSignature];
      [WeakRetained authorizationDidAuthorizeApplePayTrustSignature:v5];
      goto LABEL_15;
    case 9:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      uint64_t v5 = [v11 accountServicePaymentMethod];
      [WeakRetained authorizationDidUpdateAccountServicePaymentMethod:v5];
      goto LABEL_15;
    case 10:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      uint64_t v5 = [v11 couponCode];
      [WeakRetained authorizationDidChangeCouponCode:v5];
LABEL_15:

LABEL_16:
      break;
    default:
      break;
  }
  int v7 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  uint64_t v8 = [v7 mode];

  if (v8 != 3)
  {
    BOOL v9 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    BOOL v10 = [v9 paymentErrors];
    [(PKPaymentAuthorizationServiceViewController *)self _updatePreferencesWithErrors:v10];
  }
}

- (void)_invalidPaymentDataWithParam:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 error];
  uint64_t v6 = [v5 localizedFailureReason];
  [(PKPaymentAuthorizationServiceViewController *)self setFooterState:13 string:v6 animated:1];

  int v7 = [v4 clientErrors];

  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    BOOL v10 = v7;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Invalid data with client errors: %@", (uint8_t *)&v9, 0xCu);
  }

  [(PKPaymentAuthorizationServiceViewController *)self _updatePreferencesWithErrors:v7];
  [(PKPaymentAuthorizationServiceViewController *)self _showUnserviceableAddressAlertForErrors:v7];
}

- (void)_resumeAuthenticationWithPreviousError:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v7 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  uint64_t v8 = [v7 paymentRequest];

  if (([v8 _isAMPPayment] & 1) != 0
    || [v8 requestType] == 7
    || [v8 requestType] == 13)
  {
    if ([v8 accesssControlRef]) {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F88108], "currentStateForAccessControl:", objc_msgSend(v8, "accesssControlRef"));
    }
    else {
      uint64_t v9 = 0;
    }
    BOOL v10 = v9 == 0;
    if ([v8 _isAMPPayment])
    {
      uint64_t v11 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      uint64_t v12 = [v11 mode];

      if (v12 == 1)
      {
        int v13 = [v8 _isPSD2StyleRequest];
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F88108], "currentStateForPolicy:", -[PKPaymentAuthorizationServiceViewController _authenticatorPolicy](self, "_authenticatorPolicy"));
        if (v13)
        {
          v9 &= v14;
          if ((v9 & 0xE) == 0)
          {
            [(PKPaymentAuthorizationServiceViewController *)self _abandonPSD2StyleAMPBuy];
            if ((v9 & 6) == 0) {
              goto LABEL_28;
            }
            goto LABEL_24;
          }
        }
        else if ((v9 & v14 & 6) == 0)
        {
          id v15 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v21) = 0;
            _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Abandoning enrollment due to authenticator policy", (uint8_t *)&v21, 2u);
          }

          [(PKPaymentAuthorizationServiceViewController *)self _abandonActiveEnrollmentAttempts];
        }
      }
    }
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F88108], "currentStateForPolicy:", -[PKPaymentAuthorizationServiceViewController _authenticatorPolicy](self, "_authenticatorPolicy"));
    BOOL v10 = 0;
  }
  if ((v9 & 1) != 0 || v10)
  {
    if ((v9 & 6) == 0)
    {
      if (v10)
      {
LABEL_28:
        id v18 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "In bypass auth mode and passcode required: dropping authentication and falling back to password auth", (uint8_t *)&v21, 2u);
        }

        [(PKPaymentAuthorizationServiceViewController *)self _suspendAuthentication];
        id v19 = [(PKPaymentAuthorizationServiceViewController *)self view];
        [v19 setNeedsUpdateConstraints];

        int v20 = 0;
        int64_t v17 = 4;
        goto LABEL_35;
      }
      if (PKUserIntentIsAvailable()) {
        int64_t v17 = 3;
      }
      else {
        int64_t v17 = 4;
      }
LABEL_34:
      int v20 = 1;
LABEL_35:
      if (self->_authenticating) {
        int64_t v17 = [(PKPaymentAuthorizationServiceViewController *)self _progressStateForAuthenticationWithBiometricFailure:0];
      }
      if (a3)
      {
        PKLocalizedPaymentString(&cfstr_InAppPaymentTr.isa);
        a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      [(PKPaymentAuthorizationServiceViewController *)self setFooterState:v17 string:a3 animated:v4];
      if (v20) {
        [(PKPaymentAuthorizationServiceViewController *)self _startEvaluationWithHasInitialAuthenticatorState:1 initialAuthenticatorState:v9];
      }

      goto LABEL_42;
    }
LABEL_24:
    if (PKPearlIsAvailable()) {
      int64_t v17 = 3;
    }
    else {
      int64_t v17 = 0;
    }
    goto LABEL_34;
  }
  id v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134349056;
    id v22 = self;
    _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): Unable to evaluate policy; will cancel.",
      (uint8_t *)&v21,
      0xCu);
  }

  [(PKPaymentAuthorizationServiceViewController *)self _didCancel:1];
LABEL_42:
}

- (BOOL)_abandonActiveEnrollmentAttempts
{
  uint64_t v2 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  long long v3 = [v2 paymentRequest];
  if ([v3 requestType] != 1)
  {

    goto LABEL_5;
  }
  uint64_t v4 = [v2 mode];

  if (v4 != 1)
  {
LABEL_5:
    BOOL v5 = 0;
    goto LABEL_6;
  }
  [v2 fallbackToBypassMode];
  BOOL v5 = 1;
LABEL_6:

  return v5;
}

- (void)_abandonPSD2StyleAMPBuy
{
  id v6 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  long long v3 = [v6 paymentRequest];
  if ([v3 _isPSD2StyleRequest])
  {
    uint64_t v4 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v5 = [v4 mode];

    if (v5 != 1) {
      return;
    }
    [(PKPaymentAuthorizationServiceViewController *)self _setNavigationItemLeftItemForAMP];
    id v6 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    [v6 fallbackToBypassMode];
  }
  else
  {
  }
}

- (void)_suspendAuthentication
{
}

- (void)_suspendAuthenticationAndForceReset:(BOOL)a3
{
  if (self->_authenticating)
  {
    authenticator = self->_authenticator;
    if (a3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 1;
    }
    [(PKAuthenticator *)authenticator cancelEvaluationWithOptions:v5];
    [(PKPaymentAuthorizationServiceViewController *)self _setAuthenticating:0];
  }
}

- (void)_startEvaluationWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4
{
  v90[1] = *MEMORY[0x1E4F143B8];
  if (self->_authenticating) {
    return;
  }
  BOOL v79 = a3;
  [(PKPaymentAuthorizationServiceViewController *)self _setAuthenticating:1];
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v78 = *MEMORY[0x1E4F86308];
  uint64_t v89 = *MEMORY[0x1E4F86308];
  v90[0] = *MEMORY[0x1E4F86470];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
  uint64_t v77 = *MEMORY[0x1E4F87020];
  objc_msgSend(v5, "subject:sendEvent:");

  id v7 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = [v7 currencyCode];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F86D58]];

  BOOL v10 = [v7 totalSummaryItem];
  BOOL v11 = [v10 type] == 0;

  if (v11)
  {
    id v15 = [v7 transactionAmount];
    id v16 = [v7 totalSummaryItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0
      && ([MEMORY[0x1E4F28C28] zero],
          id v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v15 isEqual:v18],
          v18,
          v19))
    {
      int v20 = PKAnalyticsReportSwitchToggleResultValue();
      [v8 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F86D38]];

      [v8 setObject:@"Free" forKeyedSubscript:*MEMORY[0x1E4F86D48]];
    }
    else
    {
      int v21 = [v7 initialTransactionAmount];
      if (v21)
      {
        id v22 = [MEMORY[0x1E4F28C28] zero];
        char v23 = [v21 isEqual:v22];

        if ((v23 & 1) == 0)
        {
          v24 = [v15 decimalNumberBySubtracting:v21];
          id v25 = (void *)[v21 copy];
          double v26 = [MEMORY[0x1E4F28C28] zero];
          BOOL v27 = [v25 compare:v26] == -1;

          if (v27)
          {
            uint64_t v28 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"-1"];
            uint64_t v29 = [v25 decimalNumberByMultiplyingBy:v28];

            id v25 = (void *)v29;
          }
          objc_super v30 = [v24 decimalNumberByDividingBy:v25];
          CGRect v31 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"100"];
          CGRect v32 = [v30 decimalNumberByMultiplyingBy:v31];

          v33 = NSString;
          [v32 doubleValue];
          v35 = objc_msgSend(v33, "stringWithFormat:", @"%.2lf", v34);
          [v8 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F86D40]];
        }
      }
      uint64_t v36 = PKAnalyticsReportSwitchToggleResultValue();
      [v8 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F86D38]];
    }
  }
  else
  {
    uint64_t v12 = [v7 totalSummaryItem];
    BOOL v13 = [v12 type] == 1;

    if (v13)
    {
      uint64_t v14 = PKAnalyticsReportSwitchToggleResultValue();
      [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F86D38]];

      [v8 setObject:@"Amount Pending" forKeyedSubscript:*MEMORY[0x1E4F86D48]];
    }
  }
  id v37 = v7;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v37 hasAnyPayLaterOptions];
  uint64_t v39 = [v37 fundingMode];
  if (!v39 || v39 == 2)
  {
    uint64_t v46 = [v37 mode];
    if (v46 == 2)
    {
      v54 = [v37 remotePaymentInstrument];
      v84 = [v54 organizationName];

      v55 = [v37 remotePaymentInstrument];
      double v83 = [v55 issuerCountryCode];

      v56 = [v37 remotePaymentInstrument];
      v85 = [v56 isCobranded];

      v76 = [v37 remotePaymentInstrument];
      v82 = [v76 cobrandName];
      v43 = 0;
      v44 = 0;
      objc_super v45 = 0;
      v81 = 0;

      goto LABEL_48;
    }
    if (v46 != 1)
    {
      v43 = 0;
      v44 = 0;
      objc_super v45 = 0;
      v81 = 0;
      v82 = 0;
      v84 = 0;
      v85 = 0;
      double v83 = 0;
      goto LABEL_48;
    }
    v75 = [v37 pass];
    v47 = [v37 pass];
    v73 = [v47 uniqueID];

    v84 = [v75 organizationName];
    double v83 = [v75 issuerCountryCode];
    v85 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v75, "isCobranded"));
    v82 = [v75 cobrandName];
    if ([v37 fundingMode] == 2)
    {
      v48 = [v37 selectedPaymentOffer];
      BOOL v49 = v48 == 0;

      v81 = @"payInFull";
      if (v49)
      {
LABEL_35:
        v74 = [v37 paymentOffersController];
        v57 = [v74 eligiblePaymentOfferCriteriaForPassUniqueID:v73 type:1];
        v43 = [NSNumber numberWithInt:v57 != 0];
        if (v57)
        {
          v44 = [v74 ineligibleDetailsForCriteria:v57];
        }
        else
        {
          v44 = 0;
        }
        v72 = [v74 eligiblePaymentOfferCriteriaForPassUniqueID:v73 type:2];
        objc_super v45 = [NSNumber numberWithInt:v72 != 0];
        if (PKBankConnectEnabled())
        {
          v58 = [v37 pass];
          uint64_t v59 = [v37 connectedCardStateForPass:v58];

          if (v59)
          {
            if (v59 == 2)
            {
              v60 = @"false";
            }
            else if (v59 == 1)
            {
              v60 = @"true";
            }
            else
            {
              v60 = 0;
            }
            [v38 setObject:v60 forKeyedSubscript:*MEMORY[0x1E4F86578]];
          }
        }

LABEL_48:
        v61 = [v37 paymentApplication];
        v41 = v61;
        if (v61)
        {
          [v61 paymentNetworkIdentifier];
          v53 = PKPaymentNetworkNameForPaymentCredentialType();
          [v41 paymentType];
          uint64_t v42 = PKPaymentMethodTypeToString();
LABEL_52:

          goto LABEL_53;
        }
        goto LABEL_50;
      }
      id v50 = [v37 selectedPaymentOffer];
      uint64_t v51 = [v50 type];

      v52 = @"installments";
      if (v51 != 1) {
        v52 = @"payInFull";
      }
      if (v51 == 2) {
        v52 = @"rewards";
      }
    }
    else
    {
      v52 = @"payInFull";
    }
    v81 = v52;
    goto LABEL_35;
  }
  if (v39 == 1)
  {
    v40 = [v37 selectedFinancingOption];
    v41 = v40;
    if (v40)
    {
      [v40 productType];
      uint64_t v42 = PKPayLaterAccountProductTypeToString();
      v43 = 0;
      v44 = 0;
      objc_super v45 = 0;
      v81 = 0;
      v82 = 0;
      v84 = 0;
      v85 = 0;
      double v83 = 0;
LABEL_51:
      v53 = 0;
      goto LABEL_52;
    }
    v43 = 0;
    v44 = 0;
    objc_super v45 = 0;
    v81 = 0;
    v82 = 0;
    v84 = 0;
    v85 = 0;
    double v83 = 0;
LABEL_50:
    uint64_t v42 = 0;
    goto LABEL_51;
  }
  v43 = 0;
  v44 = 0;
  objc_super v45 = 0;
  v81 = 0;
  v82 = 0;
  v84 = 0;
  v85 = 0;
  double v83 = 0;
  uint64_t v42 = 0;
  v53 = 0;
LABEL_53:
  [v38 setObject:v53 forKeyedSubscript:*MEMORY[0x1E4F86860]];
  [v38 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F86858]];
  [v38 setObject:v84 forKeyedSubscript:*MEMORY[0x1E4F867C0]];
  [v38 setObject:v83 forKeyedSubscript:*MEMORY[0x1E4F867B8]];
  if (v85)
  {
    [v85 BOOLValue];
    v62 = PKAnalyticsReportSwitchToggleResultValue();
    [v38 setObject:v62 forKeyedSubscript:*MEMORY[0x1E4F867B0]];
  }
  [v38 setObject:v82 forKeyedSubscript:*MEMORY[0x1E4F86748]];
  v63 = PKAnalyticsReportSwitchToggleResultValue();
  [v38 setObject:v63 forKeyedSubscript:*MEMORY[0x1E4F86700]];

  PKHideCardBenefitPayLater();
  v64 = PKAnalyticsReportSwitchToggleResultValue();
  [v38 setObject:v64 forKeyedSubscript:*MEMORY[0x1E4F86800]];

  PKHidePayLaterOptions();
  v65 = PKAnalyticsReportSwitchToggleResultValue();
  [v38 setObject:v65 forKeyedSubscript:*MEMORY[0x1E4F86570]];

  PKHideCardBenefitRewards();
  v66 = PKAnalyticsReportSwitchToggleResultValue();
  [v38 setObject:v66 forKeyedSubscript:*MEMORY[0x1E4F86820]];

  if (v81) {
    [v38 setObject:v81 forKeyedSubscript:*MEMORY[0x1E4F86850]];
  }
  if (v43)
  {
    [v43 BOOLValue];
    v67 = PKAnalyticsReportSwitchToggleResultValue();
    [v38 setObject:v67 forKeyedSubscript:*MEMORY[0x1E4F86568]];
  }
  if (v44)
  {
    v68 = [v44 analyticsValue];
    [v38 setObject:v68 forKeyedSubscript:*MEMORY[0x1E4F86558]];
  }
  if (v45)
  {
    [v45 BOOLValue];
    v69 = PKAnalyticsReportSwitchToggleResultValue();
    [v38 setObject:v69 forKeyedSubscript:*MEMORY[0x1E4F86818]];
  }
  [v8 addEntriesFromDictionary:v38];

  if ([v8 count]) {
    [v8 setObject:*MEMORY[0x1E4F86430] forKeyedSubscript:v78];
  }

  if ([v8 count]) {
    [MEMORY[0x1E4F843E0] subject:v77 sendEvent:v8];
  }
  authenticator = self->_authenticator;
  v71 = [(PKPaymentAuthorizationServiceViewController *)self _evaluationRequestWithHasInitialAuthenticatorState:v79 initialAuthenticatorState:a4];
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke;
  v86[3] = &unk_1E59CC468;
  objc_copyWeak(&v87, &location);
  v86[4] = self;
  [(PKAuthenticator *)authenticator evaluateRequest:v71 withCompletion:v86];

  objc_destroyWeak(&v87);
  objc_destroyWeak(&location);
}

void __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_2(id *a1)
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setAuthenticating:0];
    uint64_t v4 = [a1[4] result];
    switch(v4)
    {
      case 0:
        BOOL v11 = [v3 stateMachine];
        [v11 state];
        char IsAuthentication = PKPaymentAuthorizationStateIsAuthentication();

        if (IsAuthentication)
        {
          BOOL v13 = (void *)MEMORY[0x1E4F843E0];
          uint64_t v61 = *MEMORY[0x1E4F86308];
          v62[0] = *MEMORY[0x1E4F86360];
          uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
          [v13 subject:*MEMORY[0x1E4F87020] sendEvent:v14];

          v3[164] = (char *)v3[164] + 1;
          id v15 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Authentication successful.", buf, 2u);
          }

          if ([a1[4] biometricMatch])
          {
            [MEMORY[0x1E4F88120] invokeSuccessFeedback];
            [v3 setFooterState:8 string:0 animated:1];
          }
          if ((PKPearlIsAvailable() & 1) == 0)
          {
            [*((id *)a1[5] + 172) beginDelayingAuthorizedState];
            objc_initWeak((id *)buf, *((id *)a1[5] + 172));
            id v16 = a1[5];
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_95;
            v43[3] = &unk_1E59CB100;
            objc_copyWeak(&v44, (id *)buf);
            [v16 setFooterState:11 string:0 animated:1 withCompletion:v43];
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            id v18 = (id *)a1[5];
            if (*((double *)v18 + 169) - Current + 0.5 > 0.0) {
              objc_msgSend(v18[172], "delayAuthorizedStateByDuration:");
            }
            objc_destroyWeak(&v44);
            objc_destroyWeak((id *)buf);
          }
          id v19 = objc_loadWeakRetained(v3 + 179);
          [v19 authorizationWillStart];

          id v20 = v3[172];
          int v21 = [a1[4] credential];
          [v20 didAuthenticateWithCredential:v21];
        }
        else
        {
          uint64_t v42 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v42, OS_LOG_TYPE_DEFAULT, "Authentication successful but in wrong state - discarding credential", buf, 2u);
          }
        }
        break;
      case 1:
        goto LABEL_7;
      case 2:
      case 7:
LABEL_3:
        id v5 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Authentication canceled by app.", buf, 2u);
        }

        id v6 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v57 = *MEMORY[0x1E4F86308];
        uint64_t v58 = *MEMORY[0x1E4F86338];
        id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        [v6 subject:*MEMORY[0x1E4F87020] sendEvent:v7];

        break;
      case 3:
      case 6:
        [a1[5] _sendDidEncounterAuthorizationEventIfNecessary:2];
        if ([a1[5] _abandonActiveEnrollmentAttempts])
        {
LABEL_7:
          uint64_t v8 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Authentication canceled by user.", buf, 2u);
          }

          id v9 = (void *)MEMORY[0x1E4F843E0];
          uint64_t v59 = *MEMORY[0x1E4F86308];
          uint64_t v60 = *MEMORY[0x1E4F86340];
          BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
          [v9 subject:*MEMORY[0x1E4F87020] sendEvent:v10];

          [v3[172] didResolveError];
          if (!*((unsigned char *)v3 + 1283)) {
            [v3[129] setHidden:1];
          }
        }
        else
        {
          switch(v4)
          {
            case 3:
            case 6:
              goto LABEL_3;
            case 4:
              goto LABEL_22;
            case 5:
              goto LABEL_25;
            default:
              goto LABEL_31;
          }
        }
        break;
      case 4:
LABEL_22:
        id v22 = [MEMORY[0x1E4F28F80] processInfo];
        char v23 = [v22 processName];
        int v24 = [v22 processIdentifier];
        id v25 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v54 = v23;
          __int16 v55 = 2048;
          uint64_t v56 = v24;
          _os_log_impl(&dword_19F450000, v25, OS_LOG_TYPE_DEFAULT, "Authentication by %@[%ld] preempted by another process.", buf, 0x16u);
        }

        double v26 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v51 = *MEMORY[0x1E4F86308];
        uint64_t v52 = *MEMORY[0x1E4F86358];
        BOOL v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        [v26 subject:*MEMORY[0x1E4F87020] sendEvent:v27];

        id v28 = v3[172];
        uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
        BOOL v49 = @"PKAuthenticatorResult";
        objc_super v30 = [NSNumber numberWithInteger:4];
        id v50 = v30;
        CGRect v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
        CGRect v32 = [v29 errorWithDomain:*MEMORY[0x1E4F87538] code:-1 userInfo:v31];
        [v28 didEncounterFatalError:v32];

        break;
      case 5:
LABEL_25:
        v33 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v54 = 0;
          _os_log_impl(&dword_19F450000, v33, OS_LOG_TYPE_DEFAULT, "Failed to authenticate for e-commerce: %@", buf, 0xCu);
        }

        uint64_t v34 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v47 = *MEMORY[0x1E4F86308];
        uint64_t v48 = *MEMORY[0x1E4F86348];
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        [v34 subject:*MEMORY[0x1E4F87020] sendEvent:v35];

        uint64_t v36 = (void *)MEMORY[0x1E4F84A20];
        id v37 = (void *)MEMORY[0x1E4F28C58];
        objc_super v45 = @"PKAuthenticatorResult";
        id v38 = [NSNumber numberWithInteger:5];
        uint64_t v46 = v38;
        uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        v40 = [v37 errorWithDomain:*MEMORY[0x1E4F87538] code:-1 userInfo:v39];
        v41 = [v36 paramWithError:v40];
        [v3 _didFailWithError:v41];

        break;
      default:
        break;
    }
  }
LABEL_31:
}

void __122__PKPaymentAuthorizationServiceViewController__startEvaluationWithHasInitialAuthenticatorState_initialAuthenticatorState___block_invoke_95(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endDelayingAuthorizedState];
}

- (void)_selectOptionsForDataItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPaymentAuthorizationServiceViewController *)self _suspendAuthentication];
  switch([v4 type])
  {
    case 0:
      goto LABEL_20;
    case 2:
      id v5 = &OBJC_IVAR___PKPaymentAuthorizationServiceViewController__paymentCardPreferencesController;
      id v6 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      id v7 = [v6 paymentRequest];

      if ([v7 isPeerPaymentRequest]) {
        goto LABEL_5;
      }
      if ([v7 requestType] == 2)
      {
        id v5 = &OBJC_IVAR___PKPaymentAuthorizationServiceViewController__bankAccountPreferencesController;
LABEL_5:
        uint64_t v8 = *(id *)((char *)&self->super.super.super.isa + *v5);
      }
      else
      {
        uint64_t v8 = 0;
      }

      if (v8) {
        goto LABEL_15;
      }
      goto LABEL_20;
    case 3:
      uint64_t v9 = 1112;
      goto LABEL_14;
    case 5:
      uint64_t v9 = 1096;
      goto LABEL_14;
    case 6:
      uint64_t v9 = 1088;
      goto LABEL_14;
    case 7:
      uint64_t v9 = 1104;
      goto LABEL_14;
    case 9:
      uint64_t v9 = 1120;
      goto LABEL_14;
    case 11:
      uint64_t v9 = 1128;
LABEL_14:
      uint64_t v8 = *(id *)((char *)&self->super.super.super.isa + v9);
      if (!v8) {
        goto LABEL_20;
      }
LABEL_15:
      BOOL v10 = [(PKPaymentAuthorizationServiceViewController *)self navigationController];
      BOOL v11 = v10;
      if (v10)
      {
        [v10 pushViewController:v8 animated:1];
      }
      else
      {
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
        [(PKPaymentAuthorizationServiceViewController *)self presentViewController:v12 animated:1 completion:0];
      }
      [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didResignActive:0];

LABEL_19:
LABEL_20:

      return;
    default:
      uint64_t v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138543362;
        id v14 = v4;
        _os_log_error_impl(&dword_19F450000, v8, OS_LOG_TYPE_ERROR, "No options view controller is available for selected data item %{public}@", (uint8_t *)&v13, 0xCu);
      }
      goto LABEL_19;
  }
}

- (void)setFooterState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5
{
}

- (void)setFooterState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v12 = a4;
  id v10 = a6;
  if (a3 == 3)
  {
    BOOL v11 = 1;
LABEL_6:
    self->_allowCompactProcessing = v11;
    goto LABEL_7;
  }
  if (a3 != 10 && self->_allowCompactProcessing)
  {
    BOOL v11 = (unint64_t)a3 < 2;
    goto LABEL_6;
  }
LABEL_7:
  [(PKPaymentAuthorizationFooterView *)self->_footerView setState:a3 string:v12 animated:v7 withCompletion:v10];
  [(PKPaymentAuthorizationServiceViewController *)self _updatePhysicalButtonState];
}

- (void)_showScrollIndicatorIfNeeded
{
  if ([(UITableView *)self->_detailTableView isScrollEnabled])
  {
    if (self->_scrollIndicatorShown) {
      return;
    }
    [(UITableView *)self->_detailTableView flashScrollIndicators];
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = 0;
  }
  self->_scrollIndicatorShown = v3;
}

- (void)handleHostApplicationDidCancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134349056;
    id v6 = self;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): Presenting remote view controller cancelled payment", (uint8_t *)&v5, 0xCu);
  }

  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didCancel];
  if (self->_needsFinalCallback)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    [WeakRetained authorizationDidFinishWithError:0];

    self->_needsFinalCallback = 0;
  }
}

- (void)handleDismissWithCompletion:(id)a3
{
  id v4 = a3;
  [(PKPaymentAuthorizationServiceViewController *)self _executeCompletionHandlers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  [WeakRetained dismissWithReason:2 error:0 completion:v4];
}

- (void)handleHostApplicationWillResignActive:(BOOL)a3
{
  self->_hostApplicationResignedActive = 1;
  [(PKPaymentAuthorizationServiceViewController *)self _updateBackgroundedState:a3];
}

- (void)handleHostApplicationDidBecomeActive
{
  self->_hostApplicationResignedActive = 0;
  [(PKPaymentAuthorizationServiceViewController *)self _updateBackgroundedState:0];
}

- (void)_hostApplicationWillEnterForeground
{
  self->_hostApplicationEnteredBackground = 0;
  [(PKPaymentAuthorizationServiceViewController *)self _updateBackgroundedState:0];
}

- (void)_hostApplicationDidEnterBackground
{
  self->_hostApplicationEnteredBackground = 1;
  [(PKPaymentAuthorizationServiceViewController *)self _updateBackgroundedState:0];
}

- (void)_updateBackgroundedState:(BOOL)a3
{
  if (self->_hostApplicationEnteredBackground)
  {
    if (self->_hostApplicationResignedActive)
    {
      if (self->_treatingHostAsBackgrounded) {
        return;
      }
      self->_treatingHostAsBackgrounded = 1;
      goto LABEL_10;
    }
    if (self->_treatingHostAsBackgrounded)
    {
      self->_treatingHostAsBackgrounded = 0;
LABEL_13:
      [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didBecomeActive:1];
    }
  }
  else
  {
    BOOL v3 = self->_hostApplicationResignedActive && a3;
    if (((v3 ^ !self->_treatingHostAsBackgrounded) & 1) == 0)
    {
      self->_treatingHostAsBackgrounded = v3;
      if (v3)
      {
LABEL_10:
        [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didResignActive:1];
        return;
      }
      goto LABEL_13;
    }
  }
}

- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3
{
}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F84A30]);
  [v5 setStatus:a3];
  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didReceivePaymentAuthorizationResult:v5];
}

- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3
{
}

- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3
{
}

- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
}

- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3
{
}

- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3
{
  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didReceiveShippingContactCompleteWithUpdate:a3];

  [(PKPaymentAuthorizationServiceViewController *)self _updateShippingMethods];
}

- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3
{
}

- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3
{
}

- (void)_executeCompletionHandlers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)[(NSMutableSet *)self->_completionHandlers copy];
  [(NSMutableSet *)self->_completionHandlers removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_didCancel:(BOOL)a3
{
  BOOL v3 = a3;
  -[PKPaymentAuthorizationServiceViewController _suspendAuthenticationAndForceReset:](self, "_suspendAuthenticationAndForceReset:");
  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didCancel];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    [WeakRetained authorizationDidFinishWithError:0];
  }
}

- (void)_didFailWithError:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 error];
  uint64_t v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "In-app payment failed, error: %@", buf, 0xCu);
  }

  uint64_t v7 = [v5 domain];
  if (![v7 isEqualToString:*MEMORY[0x1E4F87538]]) {
    goto LABEL_20;
  }
  BOOL v8 = [v5 code] == -2007;

  if (!v8) {
    goto LABEL_21;
  }
  long long v9 = [v5 userInfo];
  uint64_t v7 = [v9 objectForKey:*MEMORY[0x1E4F28A50]];

  long long v10 = [v7 domain];
  uint64_t v11 = [v7 code];
  int v12 = [v10 isEqualToString:*MEMORY[0x1E4F87C30]];
  if (v11 == 2) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  if (v13 == 1)
  {
    uint64_t v14 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v15 = [v14 paymentRequest];
    id v16 = [v15 originatingURL];

    if (v16)
    {
      int64_t v17 = PKLocalizedPaymentString(&cfstr_WebPaymentErro.isa);
      id v18 = 0;
    }
    else
    {
      int v21 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      id v22 = [v21 hostAppLocalizedName];
      int64_t v17 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_3.isa, &stru_1EF1B4C70.isa, v22);

      id v18 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_4.isa);
    }
    char v23 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v17 message:v18 preferredStyle:1];
    int v24 = (void *)MEMORY[0x1E4FB1410];
    id v25 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    double v26 = [v24 actionWithTitle:v25 style:1 handler:0];
    [v23 addAction:v26];

    [(PKPaymentAuthorizationServiceViewController *)self presentViewController:v23 animated:1 completion:0];
  }
  else
  {
    int v19 = [v10 isEqualToString:*MEMORY[0x1E4F88098]];
    if (v11 == 4) {
      int v20 = v19;
    }
    else {
      int v20 = 0;
    }
    if (v20 != 1) {
      goto LABEL_19;
    }
    int64_t v17 = v5;
    uint64_t v5 = 0;
  }

LABEL_19:
LABEL_20:

LABEL_21:
  BOOL v27 = [v5 localizedFailureReason];
  if (!v27)
  {
    id v28 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v29 = [v28 paymentRequest];
    objc_super v30 = [v29 localizedErrorMessage];
    CGRect v31 = v30;
    if (v30)
    {
      id v32 = v30;
    }
    else
    {
      PKLocalizedPaymentString(&cfstr_InAppPaymentEr_0.isa);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v27 = v32;
  }
  [(PKPaymentAuthorizationServiceViewController *)self _suspendAuthentication];
  objc_initWeak((id *)buf, self);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __65__PKPaymentAuthorizationServiceViewController__didFailWithError___block_invoke;
  v33[3] = &unk_1E59CB100;
  objc_copyWeak(&v34, (id *)buf);
  [(PKPaymentAuthorizationServiceViewController *)self setFooterState:13 string:v27 animated:1 withCompletion:v33];
  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);
}

void __65__PKPaymentAuthorizationServiceViewController__didFailWithError___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 450000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKPaymentAuthorizationServiceViewController__didFailWithError___block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __65__PKPaymentAuthorizationServiceViewController__didFailWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v2 = WeakRetained;
    [WeakRetained[172] didResolveError];
    id WeakRetained = v2;
  }
}

- (void)_didFailWithFatalError:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  [(PKPaymentAuthorizationServiceViewController *)self _suspendAuthentication];
  val = self;
  v43 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v4 = [v43 paymentRequest];
  uint64_t v5 = [v4 localizedErrorMessage];
  uint64_t v6 = v5;
  if (v5)
  {
    id v40 = v5;
  }
  else
  {
    PKLocalizedPaymentString(&cfstr_InAppPaymentEr_0.isa);
    id v40 = (id)objc_claimAutoreleasedReturnValue();
  }

  if ([v43 mode] == 1)
  {
    uint64_t v39 = [v43 pass];
    if (([v39 hasAssociatedPeerPaymentAccount] & 1) != 0
      || ([v39 associatedAccountServiceAccountIdentifier],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F84C38]);
      long long v9 = [v43 pendingTransactions];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v53 objects:v63 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v54 != v11) {
              objc_enumerationMutation(v9);
            }
            int v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            uint64_t v14 = [v13 transaction];
            uint64_t v15 = [v13 paymentApplication];
            id v16 = [v13 pass];
            int64_t v17 = [v16 uniqueID];

            id v18 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v58 = v14;
              __int16 v59 = 2112;
              uint64_t v60 = v17;
              __int16 v61 = 2112;
              v62 = v15;
              _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Inserting transaction: %@ for pass: %@ paymentApplication: %@", buf, 0x20u);
            }

            [v8 insertOrUpdatePaymentTransaction:v14 forPassUniqueIdentifier:v17 paymentApplication:v15 completion:0];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v53 objects:v63 count:16];
        }
        while (v10);
      }
    }
  }
  int v19 = [v41 error];
  int v20 = [v19 domain];
  if ([v20 isEqualToString:*MEMORY[0x1E4F87538]]) {
    BOOL v21 = [v19 code] == -2001;
  }
  else {
    BOOL v21 = 0;
  }

  objc_initWeak((id *)buf, val);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke;
  aBlock[3] = &unk_1E59CB010;
  objc_copyWeak(&v52, (id *)buf);
  id v44 = v41;
  id v51 = v44;
  id v22 = _Block_copy(aBlock);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_2;
  v47[3] = &unk_1E59DB5C0;
  BOOL v49 = v21;
  id v23 = v22;
  id v48 = v23;
  [(PKPaymentAuthorizationServiceViewController *)val setFooterState:13 string:v40 animated:1 withCompletion:v47];
  if (v21)
  {
    int v24 = [(PKPaymentAuthorizationStateMachine *)val->_stateMachine model];
    id v25 = [v24 paymentRequest];

    if ([v25 requestType] == 7 || objc_msgSend(v25, "requestType") == 13)
    {
      double v26 = [v25 localizedCallbackErrorTitle];
      BOOL v27 = [v25 localizedCallbackErrorMessage];
    }
    else
    {
      double v26 = 0;
      BOOL v27 = 0;
    }
    if ([v26 length] && objc_msgSend(v27, "length"))
    {
      id v28 = v27;
LABEL_36:
      v35 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v26 message:v28 preferredStyle:1];
      uint64_t v36 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v37 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_4;
      v45[3] = &unk_1E59CB150;
      id v46 = v23;
      id v38 = [v36 actionWithTitle:v37 style:1 handler:v45];
      [v35 addAction:v38];

      [(PKPaymentAuthorizationServiceViewController *)val presentViewController:v35 animated:1 completion:0];
      goto LABEL_37;
    }
    uint64_t v29 = [v25 originatingURL];

    if (v29)
    {
      uint64_t v30 = PKLocalizedPaymentString(&cfstr_WebPaymentErro_0.isa);

      CGRect v31 = [(PKPaymentAuthorizationStateMachine *)val->_stateMachine model];
      id v32 = [v31 merchantName];
      uint64_t v33 = PKLocalizedPaymentString(&cfstr_WebPaymentErro_1.isa, &stru_1EF1B4C70.isa, v32);
    }
    else
    {
      if ([v25 isPeerPaymentRequest])
      {
        uint64_t v34 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInA_1.isa);

        id v28 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInA_2.isa);
        double v26 = (void *)v34;
LABEL_35:

        goto LABEL_36;
      }
      uint64_t v30 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_5.isa);

      CGRect v31 = [(PKPaymentAuthorizationStateMachine *)val->_stateMachine model];
      id v32 = [v31 merchantName];
      uint64_t v33 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_6.isa, &stru_1EF1B4C70.isa, v32);
    }
    id v28 = (void *)v33;
    double v26 = (void *)v30;

    BOOL v27 = v31;
    goto LABEL_35;
  }
LABEL_37:

  objc_destroyWeak(&v52);
  objc_destroyWeak((id *)buf);
}

void __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 179);
    id v4 = [*(id *)(a1 + 32) error];
    [v3 authorizationDidFinishWithError:v4];

    id WeakRetained = v5;
  }
}

void __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    dispatch_time_t v2 = dispatch_time(0, 450000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_3;
    block[3] = &unk_1E59CAA98;
    id v4 = *(id *)(a1 + 32);
    dispatch_after(v2, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__PKPaymentAuthorizationServiceViewController__didFailWithFatalError___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_didSucceedWithAuthorizationStateParam:(id)a3
{
  self->_needsFinalCallback = 1;
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke;
  void v13[3] = &unk_1E59CB6D8;
  uint64_t v5 = v4;
  uint64_t v14 = v5;
  [(PKPaymentAuthorizationServiceViewController *)self setFooterState:12 string:0 animated:1 withCompletion:v13];
  uint64_t v6 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  uint64_t v7 = [v6 paymentRequest];

  if ([v7 isPeerPaymentRequest])
  {
    id v8 = [v7 originatingURL];

    long long v9 = (void *)MEMORY[0x1E4F85EF8];
    if (v8) {
      long long v9 = (void *)MEMORY[0x1E4F85F18];
    }
    MEMORY[0x1A6220EC0](*v9, 0);
  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v11, &location);
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke(uint64_t a1)
{
}

void __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 700000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke_3;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __86__PKPaymentAuthorizationServiceViewController__didSucceedWithAuthorizationStateParam___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((unsigned char *)WeakRetained + 1288))
  {
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 179);
    [v2 authorizationDidFinishWithError:0];

    id WeakRetained = v3;
    *((unsigned char *)v3 + 1288) = 0;
  }
}

- (void)_updatePendingTransaction:(id)a3 withAuthorizationStateParam:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  uint64_t v6 = [v15 paymentApplication];
  uint64_t v7 = [v6 dpanIdentifier];

  id v8 = [v5 peerPaymentTransactionMetadata];

  if (v8)
  {
    long long v9 = [v8 dpanIdentifier];
    int v10 = [v9 isEqual:v7];

    if (v10)
    {
      id v11 = [v15 transaction];
      int v12 = [v8 serviceIdentifier];
      [v11 setServiceIdentifier:v12];

      int v13 = [v8 requestDeviceScoreIdentifier];
      [v11 setRequestDeviceScoreIdentifier:v13];

      uint64_t v14 = [v8 sendDeviceScoreIdentifier];
      [v11 setSendDeviceScoreIdentifier:v14];
    }
  }
}

- (int64_t)_progressStateForAuthenticationWithBiometricFailure:(BOOL)a3
{
  int64_t result = PKPaymentProgressStateBaseStateForAuthenticatorEvaluationState(self->_internalAuthenticationEvaluationState, [(PKPaymentAuthorizationFooterView *)self->_footerView state], self->_idleStateIsPasscode, a3);
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
  int64_t v6 = 7;
  if (!self->_showPoseOutOfRangeDownCoaching) {
    int64_t v6 = result;
  }
  int64_t coachingState = self->_coachingState;
  if (coachingState == 4) {
    int64_t v6 = 6;
  }
  if (coachingState == 3) {
    return 4;
  }
  else {
    return v6;
  }
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  unint64_t v7 = a4.var1 - 1;
  if (PKPearlIsAvailable())
  {
    BOOL v8 = v7 < 2
      || (unint64_t)(self->_internalAuthenticationEvaluationState - 1) < 2
      || var1 == 3 && self->_isAMPPayment;
    self->_idleStateIsPasscode = v8;
  }
  else
  {
    self->_idleStateIsPasscode = 0;
  }
  self->_int64_t internalAuthenticationEvaluationState = var0;
  if (var1 == 3 && self->_isAMPPayment) {
    [(PKPaymentAuthorizationServiceViewController *)self _sendDidEncounterAuthorizationEventIfNecessary:1];
  }

  [(PKPaymentAuthorizationServiceViewController *)self _updateFooterStateIfAuthenticatingWithBiometricFailure:v7 < 2];
}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  if (self->_internalCoachingState != a4)
  {
    self->_internalCoachingState = a4;
    [(PKPaymentAuthorizationServiceViewController *)self _updateCoachingState];
  }
}

- (void)biometricAttemptFailed
{
  [(PKPaymentAuthorizationServiceViewController *)self setFooterState:9 string:0 animated:1];
  ++self->_biometryAttempts;
  if ((PKPearlIsAvailable() & 1) == 0 && self->_isAMPPayment)
  {
    id v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    id v4 = [v3 paymentRequest];
    char v5 = [v4 _isPSD2StyleRequest];

    if ((v5 & 1) == 0)
    {
      [(PKPaymentAuthorizationPasswordButtonView *)self->_passwordButtonView setHidden:0];
      int64_t v6 = [(PKPaymentAuthorizationServiceViewController *)self view];
      [v6 setNeedsLayout];
    }
  }

  [(PKPaymentAuthorizationServiceViewController *)self _sendDidEncounterAuthorizationEventIfNecessary:1];
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v8 = a3;
  long long v9 = (void (**)(id, uint64_t))a4;
  id v10 = a5;
  if (self->_passcodeViewController)
  {
    if (v9) {
      v9[2](v9, 1);
    }
  }
  else if ([(PKPaymentAuthorizationStateMachine *)self->_stateMachine state] == 5)
  {
    if ([(PKPaymentAuthorizationServiceViewController *)self _passcodeAllowed])
    {
      [(PKPaymentAuthorizationServiceViewController *)self _setPasscodeViewController:v8];
      [v8 setModalPresentationStyle:5];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __101__PKPaymentAuthorizationServiceViewController_presentPasscodeViewController_completionHandler_reply___block_invoke;
      void v11[3] = &unk_1E59CAA98;
      int v12 = v9;
      [(PKPaymentAuthorizationServiceViewController *)self presentViewController:v8 animated:1 completion:v11];
    }
    else
    {
      if (v9) {
        v9[2](v9, 0);
      }
      [(PKPaymentAuthorizationServiceViewController *)self _payWithPasswordPressed:0];
    }
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }
}

uint64_t __101__PKPaymentAuthorizationServiceViewController_presentPasscodeViewController_completionHandler_reply___block_invoke(uint64_t a1)
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

    [(PKPaymentAuthorizationServiceViewController *)self _setPasscodeViewController:0];
  }
}

- (void)dismissPassphraseViewController
{
}

- (void)dismissPassphraseViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine state];
  if ((PKPaymentAuthorizationStateIsTerminal() & 1) == 0) {
    [(PKPaymentAuthorizationServiceViewController *)self _removePassphraseViewFromHierarchyWithCompletionHandler:v4];
  }
}

- (void)authorizationFooterViewPasscodeButtonPressed:(id)a3
{
  [(PKPaymentAuthorizationServiceViewController *)self _sendDidEncounterAuthorizationEventIfNecessary:7];
  if ([(PKPaymentAuthorizationServiceViewController *)self _passwordRequired])
  {
    [(PKPaymentAuthorizationServiceViewController *)self _payWithPasswordPressed:0];
  }
  else if ([(PKPaymentAuthorizationStateMachine *)self->_stateMachine state] == 5)
  {
    if (self->_authenticating)
    {
      authenticator = self->_authenticator;
      [(PKAuthenticator *)authenticator fallbackToSystemPasscodeUI];
    }
    else
    {
      [(PKPaymentAuthorizationServiceViewController *)self _startEvaluationWithHasInitialAuthenticatorState:0 initialAuthenticatorState:0];
    }
  }
}

- (void)authorizationFooterViewWillChangeConstraints:(id)a3
{
  if (self->_viewAppeared)
  {
    id v3 = [(PKPaymentAuthorizationServiceViewController *)self viewIfLoaded];
    [v3 layoutIfNeeded];
  }
}

- (void)authorizationFooterViewDidChangeConstraints:(id)a3
{
  if (self->_viewAppeared)
  {
    id v4 = [(PKPaymentAuthorizationServiceViewController *)self viewIfLoaded];
    [v4 setNeedsLayout];
    char v5 = (void *)MEMORY[0x1E4FB1EB0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__PKPaymentAuthorizationServiceViewController_authorizationFooterViewDidChangeConstraints___block_invoke;
    v7[3] = &unk_1E59CA7D0;
    id v8 = v4;
    id v6 = v4;
    [v5 _animateUsingDefaultTimingWithOptions:134 animations:v7 completion:0];
    [(PKPaymentAuthorizationServiceViewController *)self _updatePreferredContentSize];
  }
}

uint64_t __91__PKPaymentAuthorizationServiceViewController_authorizationFooterViewDidChangeConstraints___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (id)dataItemForPaymentAuthorizationCouponCodeEntryViewController:(id)a3
{
  id v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v4 = [v3 itemForType:11];

  return v4;
}

- (void)paymentAuthorizationCouponCodeEntryViewController:(id)a3 didChangeCouponCode:(id)a4
{
}

- (void)paymentAuthorizationCouponCodeEntryViewControllerDidFinish:(id)a3
{
  id v10 = a3;
  id v4 = [(PKPaymentAuthorizationServiceViewController *)self navigationController];
  char v5 = v4;
  if (v4)
  {
    id v6 = [v4 topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 wrappedViewController];

      id v6 = (id)v7;
    }
    if (v6 == v10) {
      id v8 = (id)[v5 popViewControllerAnimated:1];
    }
  }
  else
  {
    id v9 = [(PKPaymentAuthorizationServiceViewController *)self presentedViewController];

    if (v9 == v10) {
      [(PKPaymentAuthorizationServiceViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101__PKPaymentAuthorizationServiceViewController_signInViewController_didAuthenticateWithResults_error___block_invoke;
  v14[3] = &unk_1E59CB8B0;
  id v15 = v10;
  id v16 = self;
  id v17 = v8;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __101__PKPaymentAuthorizationServiceViewController_signInViewController_didAuthenticateWithResults_error___block_invoke(id *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v2;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Error authenticating: %@", buf, 0xCu);
    }

    id v4 = a1[4];
  }
  else
  {
    id v4 = 0;
  }
  char v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F4ED70]];

  if (v6)
  {
    uint64_t v7 = [a1[4] code];
    if (v7 == -7006)
    {
      id v8 = a1[5];
      uint64_t v9 = 5;
      goto LABEL_14;
    }
    if (v7 == -7003)
    {
      id v8 = a1[5];
      uint64_t v9 = 4;
LABEL_14:
      [v8 _sendDidEncounterAuthorizationEventIfNecessary:v9];
      return;
    }
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Did authenticate with results", buf, 2u);
  }

  [a1[5] _abandonActiveEnrollmentAttempts];
  [a1[5] _abandonPSD2StyleAMPBuy];
  [*((id *)a1[5] + 129) setHidden:1];
  [a1[6] resignFirstResponder];
  id v11 = a1[5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __101__PKPaymentAuthorizationServiceViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_147;
  v12[3] = &unk_1E59CA870;
  void v12[4] = v11;
  id v13 = a1[7];
  [v11 dismissPassphraseViewControllerWithCompletion:v12];
}

uint64_t __101__PKPaymentAuthorizationServiceViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_147(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1376) didAuthenticateWithCredential:*(void *)(a1 + 40)];
}

- (BOOL)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  return 1;
}

- (BOOL)_shouldShowSeparatorForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  if (self->_usingLargeLayout && !self->_isAMPPayment && !self->_isInstallment
    || self->_totalView
    || ([(UITableView *)self->_detailTableView isScrollEnabled] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    NSInteger v7 = -[UITableView numberOfRowsInSection:](self->_detailTableView, "numberOfRowsInSection:", [v4 section]);
    BOOL v5 = [v4 row] + 1 != v7;
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  int v6 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  NSInteger v7 = [v6 items];
  int64_t v8 = [v7 count];

  if (!self->_usingLargeLayout
    || self->_isAMPPayment
    || self->_isInstallment
    || ([v6 paymentSummaryItems],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        unint64_t v10 = [v9 count],
        v9,
        v10 < 2))
  {
    if (self->_isPaymentSummaryPinned)
    {
      id v11 = [v6 paymentSummaryItems];
      uint64_t v12 = (unint64_t)[v11 count] > 1;

      v8 -= v12;
    }
  }
  else
  {
    --v8;
  }
  id v13 = [v6 paymentRequest];
  if ([v13 requestType] == 1 && objc_msgSend(v6, "mode") == 1)
  {
    uint64_t v14 = [v6 pass];
    uint64_t v15 = v14 != 0;

    v8 -= v15;
  }
  else
  {
  }
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  uint64_t v9 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  unint64_t v10 = [v9 items];
  id v11 = [v10 objectAtIndex:v8];

  uint64_t v12 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v13 = [v12 paymentRequest];

  BOOL v14 = [(PKPaymentAuthorizationServiceViewController *)self _shouldShowSeparatorForRowAtIndexPath:v7];
  uint64_t v15 = [(PKPaymentAuthorizationServiceViewController *)self _tableViewClassForDataItem:v11];
  uint64_t v16 = NSStringFromClass(v15);
  id v17 = [v6 dequeueReusableCellWithIdentifier:v16];
  if (!v17)
  {
    id v17 = (void *)[[v15 alloc] initWithLayout:self->_layout reuseIdentifier:v16];
    objc_msgSend(v17, "setSelectionStyle:", 2 * (objc_msgSend(v11, "type") != 8));
  }
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __79__PKPaymentAuthorizationServiceViewController_tableView_cellForRowAtIndexPath___block_invoke;
  double v26 = &unk_1E59DB5E8;
  BOOL v27 = self;
  id v28 = v11;
  id v29 = v6;
  id v30 = v7;
  id v18 = v7;
  id v19 = v6;
  id v20 = v11;
  BOOL v21 = _Block_copy(&v23);
  -[objc_class presentCell:withDataItem:shouldShowSeperator:forPaymentRequest:cellProvider:](-[PKPaymentAuthorizationServiceViewController _viewPresenterClassForDataItem:](self, "_viewPresenterClassForDataItem:", v20, v23, v24, v25, v26, v27), "presentCell:withDataItem:shouldShowSeperator:forPaymentRequest:cellProvider:", v17, v20, v14, v13, v21);

  return v17;
}

id __79__PKPaymentAuthorizationServiceViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1376) model];
  id v3 = [v2 items];
  uint64_t v4 = [v3 indexOfObject:*(void *)(a1 + 40)];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v4, objc_msgSend(*(id *)(a1 + 56), "section"));
    id v5 = [v6 cellForRowAtIndexPath:v7];
  }

  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return [(PKPaymentAuthorizationStateMachine *)self->_stateMachine canSelectPaymentOptions];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  stateMachine = self->_stateMachine;
  id v5 = a4;
  if ([(PKPaymentAuthorizationStateMachine *)stateMachine canSelectPaymentOptions])id v6 = v5; {
  else
  }
    id v6 = 0;
  id v7 = v6;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  uint64_t v8 = [v7 items];
  uint64_t v9 = [v6 row];

  unint64_t v10 = [v8 objectAtIndex:v9];

  id v11 = [v7 paymentRequest];
  unint64_t v12 = [v11 requestType];

  uint64_t v13 = [v10 type];
  BOOL v14 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v15 = *MEMORY[0x1E4F87020];
  uint64_t v16 = *MEMORY[0x1E4F86468];
  uint64_t v17 = *MEMORY[0x1E4F86730];
  v29[0] = *MEMORY[0x1E4F86308];
  v29[1] = v17;
  uint64_t v18 = *MEMORY[0x1E4F86840];
  v30[0] = v16;
  v30[1] = v18;
  v29[2] = *MEMORY[0x1E4F86BB0];
  unint64_t v19 = [v10 type];
  if (v19 > 0x13) {
    id v20 = @"unknown";
  }
  else {
    id v20 = off_1E59DB760[v19];
  }
  v30[2] = v20;
  BOOL v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
  [v14 subject:v15 sendEvent:v21];

  unsigned int v22 = (v12 < 0xB) & (0x735u >> v12);
  if ([(PKPaymentAuthorizationServiceViewController *)self _shouldShowUsePeerPaymentBalanceToggle])
  {
    uint64_t v23 = [v7 peerPaymentQuote];
    uint64_t v24 = v23;
    if (v13 == 2)
    {
      id v25 = [v23 firstQuoteItemOfType:1];
      BOOL v26 = v25 == 0;
    }
    else
    {
      BOOL v26 = 0;
    }

    if (v22) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if (v12 == 2 && v13 == 2)
  {
    BOOL v27 = [v7 itemForType:9];

    if (!v27)
    {
      if (v22)
      {
        LOBYTE(v26) = 1;
        goto LABEL_20;
      }
LABEL_24:
      [(PKPaymentAuthorizationServiceViewController *)self _selectOptionsForDataItem:v10];
      goto LABEL_25;
    }
  }
  BOOL v26 = self->_isAMPPayment && v13 == 5;
  if ((v22 & 1) == 0)
  {
LABEL_23:
    if (!v26) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_20:
  [v10 type];
  if ((PKPaymentAuthorizationDataTypeIsSelectable() & 1) != 0 || v26) {
    goto LABEL_24;
  }
LABEL_25:
}

- (void)_payWithPasswordPressed:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87020];
  uint64_t v14 = *MEMORY[0x1E4F86308];
  v15[0] = *MEMORY[0x1E4F86350];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v4 subject:v5 sendEvent:v6];

  [(PKPaymentAuthorizationServiceViewController *)self setFooterState:10 string:0 animated:1];
  [(PKPaymentAuthorizationServiceViewController *)self _abandonPSD2StyleAMPBuy];
  id v7 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  uint64_t v8 = [v7 paymentRequest];
  uint64_t v9 = [v8 appleIDAuthenticationContext];

  if (v9)
  {
    [(PKPaymentAuthorizationServiceViewController *)self _suspendAuthentication];
    unint64_t v10 = objc_msgSend(v9, "pk_AKAppleIDAuthenticationInAppContext");
    [v10 setPresentingViewController:self];
    [v10 setDelegate:self];
    id v11 = objc_alloc_init(getAKModalSignInViewControllerClass());
    [v11 setDelegate:self];
    [v11 setContext:v10];
    [(PKPaymentAuthorizationServiceViewController *)self _addPassphraseViewControllerToHierarchy:v11 withCompletion:0];
  }
  else
  {
    unint64_t v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Password requested but no authentication context found, bypassing", v13, 2u);
    }

    [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didAuthenticateWithCredential:MEMORY[0x1E4F1CC08]];
  }
}

- (void)cancelPressed:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self->_cancelButtonDisabled)
  {
    uint64_t v4 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v5 = [v4 paymentRequest];

    if ([v5 isPeerPaymentRequest]) {
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85EF0], 0);
    }
    if (self->_passphraseViewController)
    {
      [(PKPaymentAuthorizationServiceViewController *)self _sendDidEncounterAuthorizationEventIfNecessary:8];
      [(PKPaymentAuthorizationServiceViewController *)self _suspendAuthentication];
      [(PKPaymentAuthorizationServiceViewController *)self _updatePreferredContentSize];
      [(PKPaymentAuthorizationServiceViewController *)self _resumeAuthenticationWithPreviousError:0 animated:0];
      id v6 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      id v7 = [v6 paymentRequest];
      int v8 = [v7 _isAMPPayment];

      if (v8) {
        [(PKPaymentAuthorizationServiceViewController *)self dismissPassphraseViewController];
      }
    }
    else
    {
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134349056;
        id v11 = self;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): User pressed cancel button", (uint8_t *)&v10, 0xCu);
      }

      [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didCancel];
    }
  }
}

- (void)resumeAndUpdateContentSize
{
  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine didBecomeActive:0];

  [(PKPaymentAuthorizationServiceViewController *)self _updatePreferredContentSize];
}

- (void)_addPassphraseViewControllerToHierarchy:(id)a3 withCompletion:(id)a4
{
  v35[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (self->_passphraseViewController)
  {
    if (v7) {
      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    }
  }
  else
  {
    uint64_t v9 = [v6 view];
    int v10 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v10];

    id v11 = [(PKPaymentAuthorizationServiceViewController *)self view];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaymentAuthorizationServiceViewController *)self addChildViewController:v6];
    [v11 addSubview:v9];
    [v9 bottomAnchor];
    v12 = CGRect v31 = v8;
    uint64_t v13 = [v11 bottomAnchor];
    uint64_t v14 = [v12 constraintEqualToAnchor:v13];
    passphraseBottomConstraint = self->_passphraseBottomConstraint;
    self->_passphraseBottomConstraint = v14;

    id v30 = [v9 leftAnchor];
    id v29 = [(UIView *)self->_passphraseSeparatorView rightAnchor];
    id v28 = [v30 constraintEqualToAnchor:v29];
    v35[0] = v28;
    BOOL v26 = [v9 topAnchor];
    BOOL v27 = [v11 safeAreaLayoutGuide];
    uint64_t v16 = [v27 topAnchor];
    uint64_t v17 = [v26 constraintEqualToAnchor:v16];
    v35[1] = v17;
    uint64_t v18 = [v9 widthAnchor];
    unint64_t v19 = [v11 widthAnchor];
    id v20 = [v18 constraintEqualToAnchor:v19];
    BOOL v21 = self->_passphraseBottomConstraint;
    v35[2] = v20;
    v35[3] = v21;
    unsigned int v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
    [v11 addConstraints:v22];

    int v8 = v31;
    objc_opt_class();
    self->_needsToAccommodateKeyboard = (objc_opt_isKindOfClass() & 1) == 0;
    [v6 didMoveToParentViewController:self];
    [v11 layoutIfNeeded];
    [(PKPaymentAuthorizationServiceViewController *)self _setPassphraseViewController:v6];
    [v9 setNeedsUpdateConstraints];
    [v6 becomeFirstResponder];
    contentViewRightConstraint = self->_contentViewRightConstraint;
    [v11 bounds];
    [(NSLayoutConstraint *)contentViewRightConstraint setConstant:-v24];
    id v25 = (void *)MEMORY[0x1E4FB1EB0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __102__PKPaymentAuthorizationServiceViewController__addPassphraseViewControllerToHierarchy_withCompletion___block_invoke;
    v34[3] = &unk_1E59CA7D0;
    v34[4] = self;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __102__PKPaymentAuthorizationServiceViewController__addPassphraseViewControllerToHierarchy_withCompletion___block_invoke_2;
    v32[3] = &unk_1E59CA9F8;
    id v33 = v31;
    [v25 animateWithDuration:4 delay:v34 options:v32 animations:0.3 completion:0.0];
  }
}

void __102__PKPaymentAuthorizationServiceViewController__addPassphraseViewControllerToHierarchy_withCompletion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

uint64_t __102__PKPaymentAuthorizationServiceViewController__addPassphraseViewControllerToHierarchy_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_removePassphraseViewFromHierarchyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_passphraseViewController)
  {
    [(PKPaymentAuthorizationServiceViewController *)self _setPassphraseViewController:0];
    [(NSLayoutConstraint *)self->_contentViewRightConstraint setConstant:0.0];
    passphraseBottomConstraint = self->_passphraseBottomConstraint;
    self->_passphraseBottomConstraint = 0;

    id v7 = [(PKPaymentAuthorizationServiceViewController *)self childViewControllers];
    int v8 = [v7 firstObject];

    [v8 resignFirstResponder];
    uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __103__PKPaymentAuthorizationServiceViewController__removePassphraseViewFromHierarchyWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E59CA7D0;
    void v14[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __103__PKPaymentAuthorizationServiceViewController__removePassphraseViewFromHierarchyWithCompletionHandler___block_invoke_2;
    void v11[3] = &unk_1E59CF408;
    id v12 = v8;
    id v13 = v5;
    id v10 = v8;
    [v9 animateWithDuration:4 delay:v14 options:v11 animations:0.3 completion:0.0];
    [(PKPaymentAuthorizationServiceViewController *)self _updatePhysicalButtonState];
  }
  else if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

void __103__PKPaymentAuthorizationServiceViewController__removePassphraseViewFromHierarchyWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

uint64_t __103__PKPaymentAuthorizationServiceViewController__removePassphraseViewFromHierarchyWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (Class)_tableViewClassForDataItem:(id)a3
{
  [a3 type];
  id v3 = objc_opt_class();

  return (Class)v3;
}

- (Class)_viewPresenterClassForDataItem:(id)a3
{
  uint64_t v3 = [a3 type];
  if (unint64_t)(v3 - 1) <= 0xB && ((0xFF7u >> (v3 - 1)))
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }

  return (Class)v4;
}

- (void)_handleModelUpdate
{
  id v36 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  uint64_t v3 = [v36 paymentRequest];
  unint64_t v4 = [v3 requestType];
  uint64_t v5 = [v3 paymentSummaryItems];
  v35 = [v5 lastObject];

  uint64_t v6 = [v3 _isAMPPayment];
  [(UITableView *)self->_detailTableView reloadData];
  [(UITableView *)self->_detailTableView layoutIfNeeded];
  id v7 = [v36 itemForType:8];
  summaryItemsView = self->_summaryItemsView;
  if (summaryItemsView)
  {
    if (v7)
    {
      [(PKPaymentAuthorizationSummaryItemsView *)summaryItemsView removeLabelsAndValues];
      [(objc_class *)[(PKPaymentAuthorizationServiceViewController *)self _viewPresenterClassForDataItem:v7] presentView:self->_summaryItemsView withDataItem:v7 forPaymentRequest:v3];
LABEL_6:
      [(PKPaymentAuthorizationSummaryItemsView *)self->_summaryItemsView layoutIfNeeded];
      goto LABEL_7;
    }
    if (self->_usingLargeLayout)
    {
      [(PKPaymentAuthorizationSummaryItemsView *)summaryItemsView removeLabelsAndValues];
      goto LABEL_6;
    }
  }
LABEL_7:
  uint64_t v9 = [v36 merchantName];
  BOOL v10 = v4 > 8 || ((1 << v4) & 0x121) == 0;
  if (!v10 && (([v3 isPeerPaymentRequest] | v6) & 1) == 0)
  {
    uint64_t v11 = PKLocalizedPaymentString(&cfstr_InAppPaymentPa_2.isa, &stru_1EF1B4C70.isa, v9);

    uint64_t v9 = (void *)v11;
  }
  id v12 = v36;
  if (!v6) {
    goto LABEL_17;
  }
  id v13 = [v35 localizedAmount];
  if (v13) {
    goto LABEL_18;
  }
  uint64_t v14 = [v35 amount];
  uint64_t v15 = [MEMORY[0x1E4F28C28] zero];
  int v16 = [v14 isEqualToNumber:v15];

  id v12 = v36;
  if (v16)
  {
    id v13 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_15.isa);
  }
  else
  {
LABEL_17:
    uint64_t v17 = [v12 transactionAmount];
    uint64_t v18 = [v36 currencyCode];
    id v13 = PKFormattedCurrencyStringFromNumber();
  }
LABEL_18:
  totalView = self->_totalView;
  if (!totalView) {
    goto LABEL_33;
  }
  [(PKPaymentAuthorizationTotalView *)totalView setShowsBoldValueText:v6];
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v20 = [MEMORY[0x1E4F28C28] zero];
    BOOL v21 = [v36 transactionAmount];
    uint64_t v22 = [v20 compare:v21];

    if (!v22)
    {
      BOOL v26 = self->_totalView;
      id v29 = v9;
      id v30 = 0;
      goto LABEL_25;
    }
  }
  uint64_t v23 = [v3 paymentSummaryItems];
  double v24 = [v23 lastObject];
  uint64_t v25 = [v24 type];

  BOOL v26 = self->_totalView;
  if (!v25)
  {
    id v29 = v9;
    id v30 = v13;
LABEL_25:
    [(PKPaymentAuthorizationTotalView *)v26 setLabel:v29 value:v30];
    goto LABEL_26;
  }
  [(PKPaymentAuthorizationTotalView *)v26 setIsPendingTotal:1];
  BOOL v27 = self->_totalView;
  id v28 = PKLocalizedPaymentString(&cfstr_InAppPaymentPe.isa);
  [(PKPaymentAuthorizationTotalView *)v27 setLabel:v9 value:v28];

LABEL_26:
  int v31 = [v3 isPeerPaymentRequest];
  if (v4 == 2) {
    int v32 = 1;
  }
  else {
    int v32 = v31;
  }
  if (v32) {
    uint64_t v33 = 0;
  }
  else {
    uint64_t v33 = 2;
  }
  [(PKPaymentAuthorizationTotalView *)self->_totalView setLabelNumberOfLines:v33];
LABEL_33:
  if ([v36 mode] != 3)
  {
    [(PKPaymentAuthorizationServiceViewController *)self _updateAvailableCardsPreferences];
    uint64_t v34 = [v36 allErrors];
    [(PKPaymentAuthorizationServiceViewController *)self _updatePreferencesWithErrors:v34];
  }
  [(PKPaymentAuthorizationServiceViewController *)self _updateCouponCodeEntry];
  [(PKPaymentAuthorizationServiceViewController *)self _updatePreferredContentSize];
}

- (void)_setupWithPaymentRequest:(id)a3 relevantPassUniqueID:(id)a4 fromAppWithLocalizedName:(id)a5 applicationIdentifier:(id)a6 bundleIdentifier:(id)a7 teamIdentifier:(id)a8
{
  v70[5] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v65 = a4;
  id v64 = a5;
  id v63 = a6;
  id v62 = a7;
  id v61 = a8;
  unint64_t v15 = [v14 requestType];
  self->_isAMPPayment = [v14 _isAMPPayment];
  self->_isInstallment = v15 == 5;
  if (self->_isAMPPayment)
  {
    if ([v14 _isPSD2StyleRequest])
    {
LABEL_3:
      uint64_t v16 = 1;
      goto LABEL_10;
    }
    uint64_t v17 = [v14 merchantSession];

    if (v17) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 3;
    }
  }
  else
  {
    if (v15 > 0xD || ((1 << v15) & 0x20C0) == 0) {
      goto LABEL_3;
    }
    uint64_t v16 = 3;
  }
LABEL_10:
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F84A18]) initWithMode:v16];
  id v19 = objc_alloc_init(MEMORY[0x1E4F84E00]);
  [v18 setPeerPaymentService:v19];

  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine setModel:v18];
  objc_initWeak(&location, self);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __172__PKPaymentAuthorizationServiceViewController__setupWithPaymentRequest_relevantPassUniqueID_fromAppWithLocalizedName_applicationIdentifier_bundleIdentifier_teamIdentifier___block_invoke;
  v66[3] = &unk_1E59CA7F8;
  __int16 v59 = &v67;
  objc_copyWeak(&v67, &location);
  [v18 setUpdateHandler:v66];
  [v18 beginUpdates];
  [v18 setRelevantPassUniqueID:v65];
  [v18 setHostAppLocalizedName:v64];
  [v18 setHostApplicationIdentifier:v63];
  [v18 setBundleIdentifier:v62];
  [v18 setTeamIdentifier:v61];
  [v18 setPaymentRequest:v14];
  [v18 setContactFormatValidator:self->_contactFormatValidator];
  if (v15 == 5)
  {
    objc_msgSend(v14, "paymentSummaryItems", &v67);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v21 = [v20 count];
    if (v21 >= 2)
    {
      uint64_t v22 = [v20 lastObject];
      uint64_t v23 = [v22 amount];

      uint64_t v24 = objc_msgSend(v20, "subarrayWithRange:", 0, v21 - 1);

      [v18 setInstallmentAuthorizationAmount:v23];
      id v20 = (id)v24;
    }
    [v18 setPaymentSummaryItems:v20];
  }
  else
  {
    if ((v15 & 0xFFFFFFFFFFFFFFF7) != 0) {
      goto LABEL_26;
    }
    uint64_t v25 = objc_msgSend(v18, "pass", &v67);
    BOOL v26 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v27 = *MEMORY[0x1E4F86478];
    uint64_t v28 = *MEMORY[0x1E4F86730];
    v69[0] = *MEMORY[0x1E4F86308];
    v69[1] = v28;
    uint64_t v29 = *MEMORY[0x1E4F86840];
    v70[0] = v27;
    v70[1] = v29;
    id v30 = @"true";
    if (!v25) {
      id v30 = @"false";
    }
    uint64_t v31 = *MEMORY[0x1E4F86AC8];
    v69[2] = *MEMORY[0x1E4F86AE0];
    v69[3] = v31;
    v70[2] = v30;
    v70[3] = @"card";
    v69[4] = *MEMORY[0x1E4F86890];
    id v20 = v25;
    int v32 = [v20 associatedAccountServiceAccountIdentifier];

    if (v32)
    {
      uint64_t v33 = @"appleCard";
    }
    else if ([v20 hasAssociatedPeerPaymentAccount])
    {
      uint64_t v33 = @"appleCash";
    }
    else
    {
      uint64_t v34 = [v20 devicePrimaryPaymentApplication];
      BOOL v35 = [v34 paymentNetworkIdentifier] == 123;

      if (v35) {
        uint64_t v33 = @"barcode";
      }
      else {
        uint64_t v33 = @"other";
      }
    }

    v70[4] = v33;
    id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:5];
    [v26 subject:*MEMORY[0x1E4F87020] sendEvent:v36];
  }
LABEL_26:
  uint64_t v37 = objc_msgSend(v14, "originatingURL", v59);

  self->_preferencesStyle = 4 * (v37 != 0);
  if (v15 == 3)
  {
    id v38 = [v14 passTypeIdentifier];
    uint64_t v39 = [v14 passSerialNumber];
    [v18 setPaymentPassWithPassTypeIdentifier:v38 serialNumber:v39];
  }
  if (self->_isAMPPayment)
  {
    if ([v14 accesssControlRef])
    {
      uint64_t v40 = objc_msgSend(MEMORY[0x1E4F88108], "currentStateForAccessControl:", objc_msgSend(v14, "accesssControlRef"));
      self->_bypassAuthenticator = v40 == 0;
      if (!v40) {
        [(PKPaymentAuthorizationServiceViewController *)self _abandonActiveEnrollmentAttempts];
      }
    }
    else
    {
      self->_bypassAuthenticator = 1;
      [(PKPaymentAuthorizationServiceViewController *)self _abandonActiveEnrollmentAttempts];
    }
    [(PKPaymentAuthorizationServiceViewController *)self _updatePhysicalButtonState];
  }
  if (v15 <= 0xA && ((1 << v15) & 0x721) != 0)
  {
    [(PKPaymentAuthorizationServiceViewController *)self _setupShippingMethods];
    [(PKPaymentAuthorizationServiceViewController *)self _setupShippingAddress];
    [(PKPaymentAuthorizationServiceViewController *)self _setupShippingContact];
    [(PKPaymentAuthorizationServiceViewController *)self _setupPaymentPassAndBillingAddress];
  }
  else if (self->_isAMPPayment)
  {
    [(PKPaymentAuthorizationServiceViewController *)self _setupShippingMethods];
    [(PKPaymentAuthorizationServiceViewController *)self _setupShippingAddress];
    [(PKPaymentAuthorizationServiceViewController *)self _setupShippingContact];
  }
  [(PKPaymentAuthorizationServiceViewController *)self _setupCouponCodeEntry];
  if (v15 == 3
    || self->_isAMPPayment
    || ([v14 isPeerPaymentRequest] & 1) != 0
    || v15 <= 0xD && ((1 << v15) & 0x20D4) != 0)
  {
    footerView = self->_footerView;
    uint64_t v42 = [v14 localizedBiometricConfirmationTitle];
    [(PKPaymentAuthorizationFooterView *)footerView setBiometricConfirmationTitle:v42];

    v43 = self->_footerView;
    id v44 = [v14 localizedConfirmationTitle];
    [(PKPaymentAuthorizationFooterView *)v43 setConfirmationTitle:v44];

    -[PKPaymentAuthorizationFooterView setConfirmationStyle:](self->_footerView, "setConfirmationStyle:", [v14 confirmationStyle]);
    objc_super v45 = self->_footerView;
    id v46 = [v14 localizedAuthorizingTitle];
    [(PKPaymentAuthorizationFooterView *)v45 setAuthorizingTitle:v46];

    -[PKPaymentAuthorizationFooterView setRequestType:](self->_footerView, "setRequestType:", [v14 requestType]);
    uint64_t v47 = [v14 localizedPasswordButtonTitle];
    id v48 = v47;
    if (v47)
    {
      id v49 = v47;
    }
    else
    {
      PKLocalizedPaymentString(&cfstr_InAppPaymentEn.isa);
      id v49 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v50 = v49;
    [(PKPaymentAuthorizationPasswordButtonView *)self->_passwordButtonView setActionTitle:v49];
    if (self->_bypassAuthenticator) {
      [(PKPaymentAuthorizationServiceViewController *)self setFooterState:4 string:0 animated:0];
    }
    if (v15 == 2) {
      [(PKPaymentAuthorizationServiceViewController *)self _setupBankAccounts];
    }
    if (self->_physicalButtonState == 1) {
      [(PKPaymentAuthorizationServiceViewController *)self _updatePhysicalButtonInstructionAndNotify:1];
    }
  }
  id v51 = [v18 peerPaymentQuote];
  int v52 = [v14 isPeerPaymentRequest];
  if (v51) {
    int v53 = v52;
  }
  else {
    int v53 = 0;
  }
  if (v53 == 1)
  {
    long long v54 = [v51 recipient];
    BOOL v55 = v54 == 0;

    if (!v55)
    {
      long long v56 = [v51 firstQuoteItemOfType:2];

      uint64_t v57 = [v51 firstQuoteItemOfType:1];
      BOOL v58 = v57 != 0;

      [v18 updatePeerPaymentPromotionForPeerPaymentQuote:(v56 == 0) & v58];
    }
  }
  [v18 endUpdates];
  [(PKPaymentAuthorizationStateMachine *)self->_stateMachine start];

  objc_destroyWeak(v60);
  objc_destroyWeak(&location);
}

void __172__PKPaymentAuthorizationServiceViewController__setupWithPaymentRequest_relevantPassUniqueID_fromAppWithLocalizedName_applicationIdentifier_bundleIdentifier_teamIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleModelUpdate];
    id WeakRetained = v2;
  }
}

- (void)_setupShippingMethods
{
  uint64_t v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v15 = [v3 paymentRequest];

  unint64_t v4 = [v15 availableShippingMethods];
  uint64_t v5 = [v4 methods];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = NSString;
    int v8 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v9 = [v8 shippingType];
    BOOL v10 = [v7 stringWithFormat:@"IN_APP_PAYMENT_OPTIONS_%@_METHOD_VC_TITLE", v9];
    uint64_t v11 = PKLocalizedPaymentString(v10);

    id v12 = [PKPaymentPreferencesViewController alloc];
    id v13 = [(PKPaymentPreferencesViewController *)v12 initWithStyle:self->_preferencesStyle preferences:MEMORY[0x1E4F1CBF0] title:v11 handler:0 contactFormatValidator:self->_contactFormatValidator];
    shippingMethodPreferencesController = self->_shippingMethodPreferencesController;
    self->_shippingMethodPreferencesController = v13;

    [(PKPaymentAuthorizationServiceViewController *)self _updateShippingMethods];
  }
}

- (void)_setupShippingAddress
{
  v73[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v62 = [v3 paymentRequest];

  unint64_t v4 = [v62 requiredShippingContactFields];
  int v5 = [v4 containsObject:*MEMORY[0x1E4F87130]];

  if (v5)
  {
    uint64_t v6 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    id v7 = [v6 shippingEditableMessage];

    if (v7)
    {
      int v8 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      uint64_t v60 = [v8 shippingEditableMessage];
    }
    else
    {
      uint64_t v9 = NSString;
      int v8 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      BOOL v10 = [v8 shippingType];
      uint64_t v11 = [v9 stringWithFormat:@"IN_APP_PAYMENT_OPTIONS_%@ADDRESSES_GROUP_NAME", v10];
      uint64_t v60 = PKLocalizedPaymentString(v11);
    }
    id v61 = [MEMORY[0x1E4F1CA48] array];
    id v12 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    id v13 = [v12 shippingAddress];
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F84B40] defaults];
      id v15 = [v16 defaultShippingAddress];
    }
    [v61 safelyAddObject:v15];
    BOOL v58 = v15;
    uint64_t v17 = (void *)MEMORY[0x1E4F843E0];
    if (v15) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v19 = *MEMORY[0x1E4F86478];
    uint64_t v20 = *MEMORY[0x1E4F86730];
    v72[0] = *MEMORY[0x1E4F86308];
    v72[1] = v20;
    uint64_t v21 = *MEMORY[0x1E4F86840];
    v73[0] = v19;
    v73[1] = v21;
    uint64_t v22 = *MEMORY[0x1E4F86AE0];
    v72[2] = *MEMORY[0x1E4F86AC8];
    v72[3] = v22;
    uint64_t v23 = @"true";
    if (!v15) {
      uint64_t v23 = @"false";
    }
    v73[2] = @"shippingAddress";
    v73[3] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:4];
    [v17 subject:*MEMORY[0x1E4F87020] sendEvent:v24];

    id v25 = objc_alloc(MEMORY[0x1E4F84B88]);
    BOOL v26 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v27 = objc_msgSend(v25, "initWithTitle:preferences:selectedIndex:readOnly:", v60, v61, v18, objc_msgSend(v26, "isShippingEditable") ^ 1);

    uint64_t v28 = NSString;
    uint64_t v29 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    id v30 = [v29 shippingType];
    uint64_t v31 = [v28 stringWithFormat:@"IN_APP_PAYMENT_OPTIONS_ADD_NEW_%@ADDRESSES", v30];
    int v32 = PKLocalizedPaymentString(v31);
    [v27 setAddNewTitle:v32];

    uint64_t v33 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_4.isa);
    [v27 setAddExistingTitle:v33];

    uint64_t v34 = NSString;
    BOOL v35 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    id v36 = [v35 shippingType];
    uint64_t v37 = [v34 stringWithFormat:@"IN_APP_PAYMENT_OPTIONS_EDIT_EXISTING_%@ADDRESSES", v36];
    id v38 = PKLocalizedPaymentString(v37);
    [v27 setEditExistingTitle:v38];

    [v27 setContactKey:*MEMORY[0x1E4F1AF10]];
    [v27 setType:1];
    uint64_t v39 = [v62 requiredShippingContactFields];
    objc_msgSend(v27, "setShowPhoneticName:", objc_msgSend(v39, "containsObject:", *MEMORY[0x1E4F87128]));

    [v27 mergeRecentsAndMeCard];
    uint64_t v40 = [v27 preferences];
    __int16 v59 = [v40 firstObject];

    id v41 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    [v41 setShippingAddress:v59];

    uint64_t v42 = [v27 preferences];
    v43 = [v42 firstObject];

    unint64_t v44 = [v43 contactSource];
    if (v44 > 4) {
      objc_super v45 = @"none";
    }
    else {
      objc_super v45 = off_1E59DB860[v44];
    }
    v70 = @"source";
    v71 = v45;
    id v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85D18], v46);

    objc_initWeak(&location, self);
    objc_initWeak(&from, v27);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PKPaymentAuthorizationServiceViewController__setupShippingAddress__block_invoke;
    aBlock[3] = &unk_1E59DB630;
    objc_copyWeak(&v65, &location);
    objc_copyWeak(&v66, &from);
    id v64 = v62;
    uint64_t v47 = _Block_copy(aBlock);
    id v48 = NSString;
    id v49 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    id v50 = [v49 shippingType];
    id v51 = [v48 stringWithFormat:@"IN_APP_PAYMENT_OPTIONS_%@_ADDRESS_VC_TITLE", v50];
    int v52 = PKLocalizedPaymentString(v51);

    int v53 = [PKPaymentPreferencesViewController alloc];
    int64_t preferencesStyle = self->_preferencesStyle;
    v69 = v27;
    BOOL v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
    long long v56 = [(PKPaymentPreferencesViewController *)v53 initWithStyle:preferencesStyle preferences:v55 title:v52 handler:v47 contactFormatValidator:self->_contactFormatValidator];
    shippingAddressPreferencesController = self->_shippingAddressPreferencesController;
    self->_shippingAddressPreferencesController = v56;

    objc_destroyWeak(&v66);
    objc_destroyWeak(&v65);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __68__PKPaymentAuthorizationServiceViewController__setupShippingAddress__block_invoke(id *a1)
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 5);
  if (!WeakRetained) {
    goto LABEL_12;
  }
  id v3 = objc_loadWeakRetained(a1 + 6);
  uint64_t v4 = [v3 selectedIndex];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v5 = [WeakRetained stateMachine];
    [v5 didSelectShippingContact:0];
    uint64_t v6 = 0;
LABEL_8:

    goto LABEL_9;
  }
  id v7 = objc_loadWeakRetained(a1 + 6);
  int v8 = [v7 preferences];
  id v9 = objc_loadWeakRetained(a1 + 6);
  uint64_t v6 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v9, "selectedIndex"));

  BOOL v10 = [WeakRetained stateMachine];
  [v10 didSelectShippingContact:v6];

  int v5 = [a1[4] requiredBillingContactFields];
  if (![v5 containsObject:*MEMORY[0x1E4F87130]]) {
    goto LABEL_8;
  }
  id v11 = WeakRetained[139];

  if (v11)
  {
    id v12 = [WeakRetained[139] preferences];
    id v13 = objc_msgSend(v12, "pk_objectsPassingTest:", &__block_literal_global_181);
    int v5 = [v13 firstObject];

    if ([v5 indexOfContact:v6] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = [v5 preferences];
      id v15 = [v14 arrayByAddingObject:v6];

      [v5 setPreferences:v15];
    }
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v16 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v17 = *MEMORY[0x1E4F87020];
  uint64_t v18 = *MEMORY[0x1E4F86478];
  uint64_t v19 = *MEMORY[0x1E4F86730];
  v24[0] = *MEMORY[0x1E4F86308];
  v24[1] = v19;
  uint64_t v20 = *MEMORY[0x1E4F86880];
  v25[0] = v18;
  v25[1] = v20;
  uint64_t v21 = *MEMORY[0x1E4F86AE0];
  v24[2] = *MEMORY[0x1E4F86AC8];
  v24[3] = v21;
  uint64_t v22 = @"false";
  if (v6) {
    uint64_t v22 = @"true";
  }
  v25[2] = @"shippingAddress";
  v25[3] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  [v16 subject:v17 sendEvent:v23];

LABEL_12:
}

uint64_t __68__PKPaymentAuthorizationServiceViewController__setupShippingAddress__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v5 type])
  {
    uint64_t v6 = 1;
    *a4 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_setupShippingContact
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  v91 = [v3 paymentRequest];

  v90 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [v91 requiredShippingContactFields];
  char v5 = [v4 containsObject:*MEMORY[0x1E4F87118]];
  if ((v5 & 1) == 0)
  {
    id v3 = [v91 requiredShippingContactFields];
    if (([v3 containsObject:*MEMORY[0x1E4F87128]] & 1) == 0)
    {

LABEL_10:
      id val = 0;
      goto LABEL_17;
    }
  }
  uint64_t v6 = [v91 requiredShippingContactFields];
  char v7 = [v6 containsObject:*MEMORY[0x1E4F87130]];

  if ((v5 & 1) == 0) {
  if (v7)
  }
    goto LABEL_10;
  int v8 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v9 = [v8 shippingName];

  id v10 = [v9 nameComponents];
  id v11 = [MEMORY[0x1E4F84B48] defaultInstance];
  id v12 = [v11 meCard];
  id v13 = [v12 nameComponents];

  if (v10 || !v13)
  {
    if (!v10)
    {
      id v14 = [MEMORY[0x1E4F84B40] defaults];
      id v15 = [v14 defaultContactName];
      id v10 = [v15 nameComponents];
    }
  }
  else
  {
    id v10 = v13;
  }
  uint64_t v16 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_21.isa);
  id v17 = objc_alloc(MEMORY[0x1E4F84B90]);
  uint64_t v18 = v17;
  if (v10)
  {
    v107[0] = v10;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:1];
    id val = (id)[v18 initWithTitle:v16 preferences:v19 selectedIndex:0x7FFFFFFFFFFFFFFFLL readOnly:0];

    uint64_t v20 = [v91 requiredShippingContactFields];
    objc_msgSend(val, "setShowPhoneticName:", objc_msgSend(v20, "containsObject:", *MEMORY[0x1E4F87128]));

    uint64_t v21 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v22 = (void *)MEMORY[0x1E4F1B8F8];
    uint64_t v23 = [val preferences];
    uint64_t v24 = [v23 firstObject];
    id v25 = [v22 pkContactWithNameComponents:v24 labeledValues:0];
    [v21 setShippingName:v25];

    BOOL v26 = @"true";
  }
  else
  {
    id val = (id)[v17 initWithTitle:v16 preferences:MEMORY[0x1E4F1CBF0] selectedIndex:0x7FFFFFFFFFFFFFFFLL readOnly:0];
    uint64_t v27 = [v91 requiredShippingContactFields];
    objc_msgSend(val, "setShowPhoneticName:", objc_msgSend(v27, "containsObject:", *MEMORY[0x1E4F87128]));

    BOOL v26 = @"false";
  }
  uint64_t v28 = *MEMORY[0x1E4F86478];
  uint64_t v29 = *MEMORY[0x1E4F86730];
  v105[0] = *MEMORY[0x1E4F86308];
  v105[1] = v29;
  uint64_t v30 = *MEMORY[0x1E4F86840];
  v106[0] = v28;
  v106[1] = v30;
  uint64_t v31 = *MEMORY[0x1E4F864E0];
  v105[2] = *MEMORY[0x1E4F86AC8];
  v105[3] = v31;
  uint64_t v32 = *MEMORY[0x1E4F864E8];
  v106[2] = @"shippingContact";
  v106[3] = v32;
  uint64_t v33 = (void *)MEMORY[0x1E4F843E0];
  v105[4] = *MEMORY[0x1E4F86AE0];
  v106[4] = v26;
  uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:5];
  [v33 subject:*MEMORY[0x1E4F87020] sendEvent:v34];

  [v90 addObject:val];
LABEL_17:
  BOOL v35 = [v91 requiredShippingContactFields];
  int v36 = [v35 containsObject:*MEMORY[0x1E4F87120]];

  if (v36)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA48] array];
    id v38 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v39 = [v38 shippingPhone];
    uint64_t v40 = v39;
    if (v39)
    {
      id v41 = v39;
    }
    else
    {
      v43 = [MEMORY[0x1E4F84B40] defaults];
      id v41 = [v43 defaultContactPhone];
    }
    [v37 safelyAddObject:v41];
    if (v41) {
      uint64_t v44 = 0;
    }
    else {
      uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_super v45 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_10.isa);
    uint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F84B88]) initWithTitle:v45 preferences:v37 selectedIndex:v44 readOnly:0];
    id v46 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_11.isa);
    [v42 setAddNewTitle:v46];

    uint64_t v47 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_12.isa);
    [v42 setAddExistingTitle:v47];

    id v48 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_13.isa);
    [v42 setEditExistingTitle:v48];

    [v42 setContactKey:*MEMORY[0x1E4F1AEE0]];
    [v42 setType:1];
    [v42 mergeRecentsAndMeCard];
    id v49 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    id v50 = [v42 preferences];
    id v51 = [v50 firstObject];
    [v49 setShippingPhone:v51];

    uint64_t v52 = *MEMORY[0x1E4F86478];
    uint64_t v53 = *MEMORY[0x1E4F86730];
    v103[0] = *MEMORY[0x1E4F86308];
    v103[1] = v53;
    uint64_t v54 = *MEMORY[0x1E4F86840];
    v104[0] = v52;
    v104[1] = v54;
    uint64_t v55 = *MEMORY[0x1E4F864E0];
    v103[2] = *MEMORY[0x1E4F86AC8];
    v103[3] = v55;
    uint64_t v56 = *MEMORY[0x1E4F864F0];
    v104[2] = @"shippingContact";
    v104[3] = v56;
    v103[4] = *MEMORY[0x1E4F86AE0];
    uint64_t v57 = @"true";
    BOOL v58 = (void *)MEMORY[0x1E4F843E0];
    if (!v41) {
      uint64_t v57 = @"false";
    }
    v104[4] = v57;
    __int16 v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:5];
    [v58 subject:*MEMORY[0x1E4F87020] sendEvent:v59];

    [v90 addObject:v42];
  }
  else
  {
    uint64_t v42 = 0;
  }
  uint64_t v60 = [v91 requiredShippingContactFields];
  int v61 = [v60 containsObject:*MEMORY[0x1E4F87110]];

  if (v61)
  {
    id v62 = [MEMORY[0x1E4F1CA48] array];
    id v63 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    id v64 = [v63 shippingEmail];
    id v65 = v64;
    if (v64)
    {
      id v66 = v64;
    }
    else
    {
      v68 = [MEMORY[0x1E4F84B40] defaults];
      id v66 = [v68 defaultContactEmail];
    }
    [v62 safelyAddObject:v66];
    if (v66) {
      uint64_t v69 = 0;
    }
    else {
      uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v70 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_6.isa);
    id v67 = (void *)[objc_alloc(MEMORY[0x1E4F84B88]) initWithTitle:v70 preferences:v62 selectedIndex:v69 readOnly:0];
    v71 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_7.isa);
    [v67 setAddNewTitle:v71];

    v72 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_8.isa);
    [v67 setAddExistingTitle:v72];

    v73 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_9.isa);
    [v67 setEditExistingTitle:v73];

    [v67 setContactKey:*MEMORY[0x1E4F1ADC8]];
    [v67 setType:1];
    [v67 mergeRecentsAndMeCard];
    v74 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    v75 = [v67 preferences];
    v76 = [v75 firstObject];
    [v74 setShippingEmail:v76];

    uint64_t v77 = *MEMORY[0x1E4F86478];
    uint64_t v78 = *MEMORY[0x1E4F86730];
    v101[0] = *MEMORY[0x1E4F86308];
    v101[1] = v78;
    uint64_t v79 = *MEMORY[0x1E4F86840];
    v102[0] = v77;
    v102[1] = v79;
    uint64_t v80 = *MEMORY[0x1E4F864E0];
    v101[2] = *MEMORY[0x1E4F86AC8];
    v101[3] = v80;
    uint64_t v81 = *MEMORY[0x1E4F864D8];
    v102[2] = @"shippingContact";
    v102[3] = v81;
    v101[4] = *MEMORY[0x1E4F86AE0];
    v82 = @"true";
    double v83 = (void *)MEMORY[0x1E4F843E0];
    if (!v66) {
      v82 = @"false";
    }
    v102[4] = v82;
    v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:5];
    [v83 subject:*MEMORY[0x1E4F87020] sendEvent:v84];

    [v90 addObject:v67];
  }
  else
  {
    id v67 = 0;
  }
  v85 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_22.isa);
  if ([v90 count])
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v67);
    objc_initWeak(&v98, v42);
    objc_initWeak(&v97, val);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PKPaymentAuthorizationServiceViewController__setupShippingContact__block_invoke;
    aBlock[3] = &unk_1E59DB658;
    objc_copyWeak(&v93, &location);
    objc_copyWeak(&v94, &from);
    objc_copyWeak(&v95, &v98);
    objc_copyWeak(&v96, &v97);
    v86 = _Block_copy(aBlock);
    id v87 = [[PKPaymentPreferencesViewController alloc] initWithStyle:self->_preferencesStyle preferences:v90 title:v85 handler:v86 contactFormatValidator:self->_contactFormatValidator];
    shippingContactPreferencesController = self->_shippingContactPreferencesController;
    self->_shippingContactPreferencesController = v87;

    objc_destroyWeak(&v96);
    objc_destroyWeak(&v95);
    objc_destroyWeak(&v94);
    objc_destroyWeak(&v93);
    objc_destroyWeak(&v97);
    objc_destroyWeak(&v98);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __68__PKPaymentAuthorizationServiceViewController__setupShippingContact__block_invoke(id *a1)
{
  v75[5] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained stateMachine];
    char v5 = [v4 model];
    uint64_t v69 = [v5 shippingEmail];

    uint64_t v6 = [v3 stateMachine];
    char v7 = [v6 model];
    v68 = [v7 shippingPhone];

    int v8 = [v3 stateMachine];
    id v9 = [v8 model];
    uint64_t v10 = [v9 shippingName];

    id v11 = objc_loadWeakRetained(a1 + 5);
    unint64_t v12 = [v11 selectedIndex];
    id v13 = objc_loadWeakRetained(a1 + 5);
    id v14 = [v13 preferences];
    unint64_t v15 = [v14 count];

    id v67 = (void *)v10;
    if (v12 >= v15)
    {
      uint64_t v20 = [v3 stateMachine];
      [v20 didSelectShippingEmail:0];
      uint64_t v19 = 0;
    }
    else
    {
      id v16 = objc_loadWeakRetained(a1 + 5);
      id v17 = [v16 preferences];
      id v18 = objc_loadWeakRetained(a1 + 5);
      uint64_t v19 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v18, "selectedIndex"));

      uint64_t v20 = [v3 stateMachine];
      [v20 didSelectShippingEmail:v19];
    }

    if (v19 != v69)
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F843E0];
      uint64_t v22 = *MEMORY[0x1E4F87020];
      uint64_t v23 = *MEMORY[0x1E4F86478];
      uint64_t v24 = *MEMORY[0x1E4F86730];
      v74[0] = *MEMORY[0x1E4F86308];
      v74[1] = v24;
      uint64_t v25 = *MEMORY[0x1E4F86880];
      v75[0] = v23;
      v75[1] = v25;
      uint64_t v26 = *MEMORY[0x1E4F864E0];
      v74[2] = *MEMORY[0x1E4F86AC8];
      v74[3] = v26;
      uint64_t v27 = *MEMORY[0x1E4F864D8];
      v75[2] = @"shippingContact";
      v75[3] = v27;
      v74[4] = *MEMORY[0x1E4F86AE0];
      if (v19) {
        uint64_t v28 = @"true";
      }
      else {
        uint64_t v28 = @"false";
      }
      v75[4] = v28;
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:5];
      [v21 subject:v22 sendEvent:v29];
    }
    id v30 = objc_loadWeakRetained(a1 + 6);
    unint64_t v31 = [v30 selectedIndex];
    id v32 = objc_loadWeakRetained(a1 + 6);
    uint64_t v33 = [v32 preferences];
    unint64_t v34 = [v33 count];

    if (v31 >= v34)
    {
      uint64_t v39 = [v3 stateMachine];
      [v39 didSelectShippingPhoneNumber:0];
      id v38 = 0;
    }
    else
    {
      id v35 = objc_loadWeakRetained(a1 + 6);
      int v36 = [v35 preferences];
      id v37 = objc_loadWeakRetained(a1 + 6);
      id v38 = objc_msgSend(v36, "objectAtIndex:", objc_msgSend(v37, "selectedIndex"));

      uint64_t v39 = [v3 stateMachine];
      [v39 didSelectShippingPhoneNumber:v38];
    }

    if (v38 != v68)
    {
      uint64_t v40 = (void *)MEMORY[0x1E4F843E0];
      uint64_t v41 = *MEMORY[0x1E4F87020];
      uint64_t v42 = *MEMORY[0x1E4F86478];
      uint64_t v43 = *MEMORY[0x1E4F86730];
      v72[0] = *MEMORY[0x1E4F86308];
      v72[1] = v43;
      uint64_t v44 = *MEMORY[0x1E4F86880];
      v73[0] = v42;
      v73[1] = v44;
      uint64_t v45 = *MEMORY[0x1E4F864E0];
      v72[2] = *MEMORY[0x1E4F86AC8];
      v72[3] = v45;
      uint64_t v46 = *MEMORY[0x1E4F864F0];
      v73[2] = @"shippingContact";
      v73[3] = v46;
      void v72[4] = *MEMORY[0x1E4F86AE0];
      uint64_t v47 = @"false";
      if (v38) {
        uint64_t v47 = @"true";
      }
      v73[4] = v47;
      id v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:5];
      [v40 subject:v41 sendEvent:v48];
    }
    id v49 = a1 + 7;
    id v50 = objc_loadWeakRetained(v49);
    id v51 = [v50 preferences];
    uint64_t v52 = [v51 count];

    if (v52)
    {
      id v53 = objc_loadWeakRetained(v49);
      uint64_t v54 = [v53 preferences];
      uint64_t v55 = [v54 firstObject];

      uint64_t v56 = [MEMORY[0x1E4F1B8F8] pkContactWithNameComponents:v55 labeledValues:0];
      uint64_t v57 = [v3 stateMachine];
      [v57 didSelectShippingName:v56];
    }
    else
    {
      uint64_t v55 = [v3 stateMachine];
      [v55 didSelectShippingName:0];
      uint64_t v56 = 0;
    }

    if (v56 != v67)
    {
      BOOL v58 = (void *)MEMORY[0x1E4F843E0];
      uint64_t v59 = *MEMORY[0x1E4F87020];
      uint64_t v60 = *MEMORY[0x1E4F86478];
      uint64_t v61 = *MEMORY[0x1E4F86730];
      v70[0] = *MEMORY[0x1E4F86308];
      v70[1] = v61;
      uint64_t v62 = *MEMORY[0x1E4F86880];
      v71[0] = v60;
      v71[1] = v62;
      uint64_t v63 = *MEMORY[0x1E4F864E0];
      v70[2] = *MEMORY[0x1E4F86AC8];
      v70[3] = v63;
      uint64_t v64 = *MEMORY[0x1E4F864E8];
      v71[2] = @"shippingContact";
      v71[3] = v64;
      v70[4] = *MEMORY[0x1E4F86AE0];
      id v65 = @"false";
      if (v56) {
        id v65 = @"true";
      }
      v71[4] = v65;
      id v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:5];
      [v58 subject:v59 sendEvent:v66];
    }
  }
}

- (BOOL)_shouldShowUsePeerPaymentBalanceToggle
{
  id v2 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v3 = [v2 peerPaymentQuote];
  if ([v2 supportsPreservePeerPaymentBalance]) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    BOOL v6 = 0;
  }
  else
  {
    char v5 = [v3 recipient];
    BOOL v6 = v5 != 0;
  }
  return v6;
}

- (void)_setupBankAccounts
{
  id v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  BOOL v4 = [v3 paymentRequest];
  char v5 = [v4 bankAccounts];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    char v7 = [PKPaymentPreferencesViewController alloc];
    int v8 = [(PKPaymentPreferencesViewController *)v7 initWithStyle:self->_preferencesStyle preferences:MEMORY[0x1E4F1CBF0] title:0 handler:0 contactFormatValidator:0];
    bankAccountPreferencesController = self->_bankAccountPreferencesController;
    self->_bankAccountPreferencesController = v8;

    [(PKPaymentAuthorizationServiceViewController *)self _updateBankAccounts];
  }
}

- (void)_updateBankAccounts
{
  v68[1] = *MEMORY[0x1E4F143B8];
  if (self->_bankAccountPreferencesController)
  {
    p_stateMachine = &self->_stateMachine;
    BOOL v4 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    char v5 = [v4 paymentRequest];
    id v53 = [v5 bankAccounts];

    uint64_t v6 = [(PKPaymentAuthorizationStateMachine *)*p_stateMachine model];
    char v7 = [v6 bankAccount];
    uint64_t v8 = [v53 indexOfObject:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F84B70]);
    uint64_t v10 = PKLocalizedFeatureString();
    id val = (id)[v9 initWithTitle:v10 preferences:v53 selectedIndex:v8 readOnly:0];

    id v11 = [(PKPaymentAuthorizationStateMachine *)*p_stateMachine model];
    unint64_t v12 = [v11 peerPaymentPass];
    id v13 = [(PKPaymentAuthorizationStateMachine *)*p_stateMachine model];
    id v50 = [v13 paymentRequest];

    id v51 = [v12 peerPaymentBalance];
    id v49 = [MEMORY[0x1E4F28C28] zero];
    if (v51)
    {
      id v14 = [v51 amount];
      BOOL v15 = [v49 compare:v14] == -1;
    }
    else
    {
      BOOL v15 = 0;
    }
    int v16 = [v50 deviceSupportsPeerPaymentAccountPayment];
    if (!v12 || (int v17 = v16, ![v50 accountPaymentSupportsPeerPayment]))
    {
      uint64_t v19 = 0;
LABEL_31:
      objc_initWeak(&location, self);
      objc_initWeak(&v61, val);
      objc_initWeak(&from, v19);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke_287;
      aBlock[3] = &unk_1E59DB6A8;
      objc_copyWeak(&v57, &location);
      id v37 = v11;
      id v55 = v37;
      objc_copyWeak(&v58, &from);
      id v38 = v12;
      id v56 = v38;
      objc_copyWeak(&v59, &v61);
      uint64_t v39 = _Block_copy(aBlock);
      uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", val, 0);
      [v40 safelyAddObject:v19];
      [(PKPaymentPreferencesViewController *)self->_bankAccountPreferencesController setPreferences:v40];
      [(PKPaymentPreferencesViewController *)self->_bankAccountPreferencesController setHandler:v39];

      objc_destroyWeak(&v59);
      objc_destroyWeak(&v58);

      objc_destroyWeak(&v57);
      objc_destroyWeak(&from);
      objc_destroyWeak(&v61);
      objc_destroyWeak(&location);

      return;
    }
    uint64_t v18 = v17 & v15;
    if (v17 & v15)
    {
      id v48 = 0;
    }
    else
    {
      id v48 = PKLocalizedFeatureString();
    }
    id v20 = objc_alloc(MEMORY[0x1E4F84BA0]);
    v68[0] = v12;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
    uint64_t v19 = (void *)[v20 initWithTitle:v48 preferences:v21 selectedIndex:0x7FFFFFFFFFFFFFFFLL readOnly:v18 ^ 1];

    [v19 setPeerPaymentPass:v12];
    [v19 setPeerPaymentBalance:v51];
    objc_msgSend(v19, "setOn:", objc_msgSend(v50, "accountPaymentUsePeerPaymentBalance"));
    [v19 setEnabled:v18];
    if (v18)
    {
LABEL_28:
      unint64_t v34 = objc_msgSend(v19, "footer", v45);
      BOOL v35 = v34 == 0;

      if (v35)
      {
        int v36 = PKLocalizedFeatureString();
        [v19 setFooter:v36];
      }
      goto LABEL_31;
    }
    uint64_t v22 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();
    uint64_t v46 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount stage];
    uint64_t v23 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount state];
    uint64_t v24 = v23;
    if (v22 == 2)
    {
      if (v23 == 1) {
        [(PKPeerPaymentAccount *)self->_peerPaymentAccount termsAcceptanceRequired];
      }
      goto LABEL_22;
    }
    if (v23 != 1) {
      goto LABEL_19;
    }
    int v30 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount termsAcceptanceRequired];
    if (v46 == 2)
    {
LABEL_22:
      uint64_t v25 = PKLocalizedFeatureString();
      uint64_t v45 = v25;
      uint64_t v26 = PKLocalizedFeatureString();
      uint64_t v28 = PKPeerPaymentGetVerifyIdentitySensitiveURL();
      uint64_t v29 = @"Apple Cash Resolution: Identity Verification";
      goto LABEL_23;
    }
    if (v30)
    {
      uint64_t v25 = PKLocalizedFeatureString();
      uint64_t v45 = v25;
      uint64_t v26 = PKLocalizedFeatureString();
      uint64_t v28 = PKPeerPaymentGetTermsAcceptanceSensitiveURL();
      uint64_t v29 = @"Apple Cash Resolution: Terms Acceptance";
    }
    else
    {
LABEL_19:
      uint64_t v25 = PKLocalizedFeatureString();
      uint64_t v45 = v25;
      uint64_t v26 = PKLocalizedFeatureString();
      if (v22 == 1)
      {
        id v27 = objc_alloc_init(MEMORY[0x1E4F84D60]);
        objc_msgSend(v27, "setRegistrationFlowState:", 0, v25);
        uint64_t v28 = PKPeerPaymentGetSetupSensitiveURLWithConfiguration();

        uint64_t v29 = @"Apple Cash Resolution: Activate";
      }
      else
      {
        char v42 = v24 != 1 || v46 != 3 || v15;
        if ((v42 & 1) != 0 || v22)
        {
          uint64_t v43 = NSString;
          uint64_t v44 = PKPeerPaymentAccountResolutionStateToString();
          uint64_t v47 = [v43 stringWithFormat:@"Apple Cash Generic Resolution: %@", v44];

          uint64_t v28 = 0;
          if (v26) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
        uint64_t v28 = PKPeerPaymentGetTopUpSensitiveURL();
        uint64_t v29 = @"Apple Cash Resolution: Top Up";
      }
    }
LABEL_23:
    uint64_t v47 = v29;
    if (v26)
    {
LABEL_24:
      objc_msgSend(v19, "setFooter:", v26, v45);
      if (v25)
      {
        uint64_t v32 = [v26 rangeOfString:v25];
        if (v32 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v33 = v31;
          objc_initWeak(&location, self);
          objc_msgSend(v19, "setFooterLinkRange:", v32, v33);
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          void v62[2] = __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke;
          v62[3] = &unk_1E59DB680;
          objc_copyWeak(&v66, &location);
          id v63 = v28;
          uint64_t v64 = self;
          id v65 = v47;
          [v19 setFooterLinkActionBlock:v62];

          objc_destroyWeak(&v66);
          objc_destroyWeak(&location);
        }
      }
    }
LABEL_27:

    goto LABEL_28;
  }

  [(PKPaymentAuthorizationServiceViewController *)self _setupBankAccounts];
}

void __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (void *)*((void *)WeakRetained + 167);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke_2;
    id v14 = &unk_1E59CB010;
    objc_copyWeak(&v16, (id *)(a1 + 56));
    id v15 = *(id *)(a1 + 32);
    char v7 = _Block_copy(&v11);
    objc_msgSend(v6, "addObject:", v7, v11, v12, v13, v14);

    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134349314;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      uint64_t v20 = v10;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): Cancelling for %{public}@", buf, 0x16u);
    }

    [v5 _didCancel:1];
    objc_destroyWeak(&v16);
  }
}

void __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      BOOL v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v4 openSensitiveURL:*(void *)(a1 + 32) withOptions:0];
    }
    else
    {
      BOOL v4 = (id *)objc_loadWeakRetained(v2);
      char v5 = [v4[165] associatedPassUniqueID];
      PKOpenPassDetails();
    }
    id WeakRetained = v6;
  }
}

void __66__PKPaymentAuthorizationServiceViewController__updateBankAccounts__block_invoke_287(id *a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained stateMachine];
    [a1[4] beginUpdates];
    id v5 = objc_loadWeakRetained(a1 + 7);

    if (v5)
    {
      id v6 = [v4 model];
      id v7 = objc_loadWeakRetained(a1 + 7);
      uint64_t v8 = [v7 isOn];

      uint64_t v9 = [v6 paymentRequest];
      [v9 setAccountPaymentUsePeerPaymentBalance:v8];

      if (v8)
      {
        uint64_t v10 = [a1[5] peerPaymentBalance];
      }
      else
      {
        uint64_t v10 = 0;
      }
      [v6 setPeerPaymentBalanceForAccountPayment:v10];
    }
    uint64_t v11 = [a1[4] paymentSummaryItems];
    if ([v11 count])
    {
      uint64_t v12 = [v11 lastObject];
      v29[0] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

      uint64_t v11 = (void *)v13;
    }
    [a1[4] setPaymentSummaryItems:v11];
    id v14 = objc_loadWeakRetained(a1 + 8);
    id v15 = [v14 preferences];
    id v16 = objc_loadWeakRetained(a1 + 8);
    int v17 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v16, "selectedIndex"));

    [v4 didSelectBankAccount:v17];
    uint64_t v18 = [a1[4] itemForType:9];
    __int16 v19 = [a1[4] peerPaymentPass];
    uint64_t v20 = [v19 peerPaymentBalance];
    [v18 setPeerPaymentBalance:v20];

    [a1[4] endUpdates];
    uint64_t v21 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v22 = *MEMORY[0x1E4F87020];
    uint64_t v23 = *MEMORY[0x1E4F86478];
    uint64_t v24 = *MEMORY[0x1E4F86730];
    v27[0] = *MEMORY[0x1E4F86308];
    v27[1] = v24;
    uint64_t v25 = *MEMORY[0x1E4F86880];
    v28[0] = v23;
    v28[1] = v25;
    v27[2] = *MEMORY[0x1E4F86AC8];
    v28[2] = @"bankAccount";
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    [v21 subject:v22 sendEvent:v26];
  }
}

- (id)_availablePasses
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v56 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v56 acceptedPasses];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v53 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v70;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v70 != v52)
        {
          uint64_t v4 = v3;
          objc_enumerationMutation(obj);
          uint64_t v3 = v4;
        }
        uint64_t v54 = v3;
        id v5 = *(void **)(*((void *)&v69 + 1) + 8 * v3);
        id v6 = objc_alloc_init(MEMORY[0x1E4F84B80]);
        [v6 setPass:v5];
        [v6 setShouldShowCardUI:1];
        [v2 addObject:v6];
        id v57 = [v56 acceptedPaymentApplicationsForPass:v5];
        id v55 = [v56 unavailablePaymentApplicationsForPass:v5];
        id v7 = [v56 paymentRequest];
        BOOL v8 = [v7 requestType] == 5;

        if (v8)
        {
          [v6 setPaymentApplication:0];
          [v6 setIsSelectable:1];
          goto LABEL_43;
        }
        if ([v57 count] == 1 && !objc_msgSend(v55, "count"))
        {
          uint64_t v24 = [v57 firstObject];
          [v6 setPaymentApplication:v24];

          [v6 setIsSelectable:1];
          uint64_t v25 = [v5 uniqueID];
          uint64_t v26 = [v56 peerPaymentPass];
          id v27 = [v26 uniqueID];
          int v28 = PKEqualObjects();

          if (v28)
          {
            id v49 = [v26 peerPaymentBalance];
            id v50 = [v56 paymentRequest];
            uint64_t v29 = [v50 paymentSummaryItems];
            uint64_t v47 = [v29 lastObject];

            int v30 = [v49 currency];
            uint64_t v31 = [v50 currencyCode];
            BOOL v32 = [v30 caseInsensitiveCompare:v31] == 0;

            if (v32)
            {
              unint64_t v34 = [v49 amount];
              BOOL v35 = [v47 amount];
              BOOL v33 = [v34 compare:v35] == -1;
            }
            else
            {
              BOOL v33 = 0;
            }
            int v36 = [v49 amount];
            id v37 = [MEMORY[0x1E4F28C28] zero];
            uint64_t v38 = [v36 compare:v37];

            uint64_t v39 = [v50 requestType];
            if (v33)
            {
              self->_peerPaymentBalanceIsInsufficient = 1;
              goto LABEL_40;
            }
            if (v38) {
              BOOL v40 = 1;
            }
            else {
              BOOL v40 = v39 == 3;
            }
            BOOL v41 = !v40;
            self->_peerPaymentBalanceIsInsufficient = v41;
            if (!v40)
            {
LABEL_40:
              id v42 = objc_alloc_init(MEMORY[0x1E4F84B80]);
              [v42 setPass:v5];
              [v42 setIsSelectable:1];
              [v42 setInsetsSeparatorByTextOffset:1];
              [v42 setShouldShowCardUI:0];
              uint64_t v43 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_23.isa);
              [v42 setDisplayName:v43];

              objc_initWeak(&location, self);
              v66[0] = MEMORY[0x1E4F143A8];
              v66[1] = 3221225472;
              v66[2] = __63__PKPaymentAuthorizationServiceViewController__availablePasses__block_invoke;
              v66[3] = &unk_1E59CB010;
              objc_copyWeak(&v67, &location);
              void v66[4] = self;
              [v42 setActionBlock:v66];
              [v2 addObject:v42];
              objc_destroyWeak(&v67);
              objc_destroyWeak(&location);
            }
          }

          goto LABEL_43;
        }
        uint64_t v9 = [v57 count];
        if ((unint64_t)([v55 count] + v9) < 2)
        {
          [v2 removeObject:v6];
        }
        else
        {
          [v6 setIsSelectable:0];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v10 = v57;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v62 objects:v74 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v63;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v63 != v12) {
                  objc_enumerationMutation(v10);
                }
                id v14 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                id v15 = objc_alloc_init(MEMORY[0x1E4F84B80]);
                [v15 setPass:v5];
                [v15 setPaymentApplication:v14];
                [v15 setIsSelectable:1];
                [v15 setInsetsSeparatorByTextOffset:1];
                [v15 setShouldShowCardUI:0];
                id v16 = [v14 displayName];
                [v15 setDisplayName:v16];

                [v2 addObject:v15];
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v62 objects:v74 count:16];
            }
            while (v11);
          }

          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v17 = v55;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v73 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v59;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v59 != v19) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v21 = *(void **)(*((void *)&v58 + 1) + 8 * j);
                id v22 = objc_alloc_init(MEMORY[0x1E4F84B80]);
                [v22 setPass:v5];
                [v22 setPaymentApplication:v21];
                [v22 setIsSelectable:0];
                [v22 setInsetsSeparatorByTextOffset:1];
                [v22 setShouldShowCardUI:0];
                uint64_t v23 = [v21 displayName];
                [v22 setDisplayName:v23];

                [v2 addObject:v22];
              }
              uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v73 count:16];
            }
            while (v18);
          }
        }
LABEL_43:

        uint64_t v3 = v54 + 1;
      }
      while (v54 + 1 != v53);
      uint64_t v53 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v53);
  }

  uint64_t v44 = [v56 paymentRequest];
  if (![v44 requestType])
  {
    char v45 = PKHideAddCardInOsloChooseCardsScreen();

    if (v45) {
      goto LABEL_49;
    }
    uint64_t v44 = [(PKPaymentAuthorizationServiceViewController *)self _addCardEntry];
    [v2 addObject:v44];
  }

LABEL_49:

  return v2;
}

void __63__PKPaymentAuthorizationServiceViewController__availablePasses__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = (void *)WeakRetained[167];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPaymentAuthorizationServiceViewController__availablePasses__block_invoke_2;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v9, v2);
  id v5 = _Block_copy(aBlock);
  [v4 addObject:v5];

  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134349056;
    uint64_t v11 = v7;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationServiceViewController (%{public}p): Cancelling for insufficient balance", buf, 0xCu);
  }

  [WeakRetained _didCancel:1];
  objc_destroyWeak(&v9);
}

void __63__PKPaymentAuthorizationServiceViewController__availablePasses__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = PKPeerPaymentGetTopUpSensitiveURL();
    uint64_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v3 openSensitiveURL:v2 withOptions:0];

    id WeakRetained = v4;
  }
}

- (id)_addCardEntry
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F84B80]);
  [v3 setIsSelectable:1];
  [v3 setInsetsSeparatorByTextOffset:0];
  [v3 setShouldShowCardUI:0];
  id v4 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_24.isa);
  [v3 setDisplayName:v4];

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PKPaymentAuthorizationServiceViewController__addCardEntry__block_invoke;
  v6[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v7, &location);
  [v3 setActionBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v3;
}

void __60__PKPaymentAuthorizationServiceViewController__addCardEntry__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(WeakRetained + 178);
  [v1 authorizationViewControllerDidRequestPaymentSetup];
}

- (int64_t)selectedPaymentApplicationIndexFromCardEntries:(id)a3
{
  id v4 = a3;
  id v17 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  if ([v4 count])
  {
    int64_t v5 = 0;
    while (1)
    {
      id v6 = [v4 objectAtIndex:v5];
      id v7 = [v6 pass];
      BOOL v8 = [v6 paymentApplication];
      int v9 = [v6 isSelectable];
      id v10 = [v17 pass];
      uint64_t v11 = [v10 uniqueID];
      uint64_t v12 = [v7 uniqueID];
      int v13 = [v11 isEqualToString:v12];

      if (v9)
      {
        if (!v8 && v13) {
          break;
        }
      }
      if (v13)
      {
        id v14 = [v17 paymentApplication];
        char v15 = [v14 isEqual:v8];

        if (v15)
        {

          break;
        }
      }

      if (++v5 >= (unint64_t)[v4 count]) {
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)_unavailablePasses
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v4 = [v3 unavailablePasses];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v4 count])
  {
    char v15 = v3;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v12 = objc_alloc_init(MEMORY[0x1E4F84B80]);
          [v12 setPass:v11];
          [v12 setShouldShowCardUI:1];
          [v12 setIsSelectable:0];
          int v13 = [(PKPaymentAuthorizationServiceViewController *)self _availabilityStringForPass:v11];
          [v12 setAvailabilityString:v13];

          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    id v3 = v15;
  }

  return v5;
}

- (void)_updateAvailableCardsPreferences
{
  if (self->_paymentCardPreferencesController)
  {
    PKLocalizedPaymentString(&cfstr_InAppPaymentOp_1.isa);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [(PKPaymentAuthorizationServiceViewController *)self _availablePasses];
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F84B78]), "initWithTitle:preferences:selectedIndex:readOnly:", v11, v3, -[PKPaymentAuthorizationServiceViewController selectedPaymentApplicationIndexFromCardEntries:](self, "selectedPaymentApplicationIndexFromCardEntries:", v3), 0);
    id v5 = [(PKPaymentPreferencesViewController *)self->_paymentCardPreferencesController preferences];
    id v6 = (void *)[v5 mutableCopy];

    uint64_t v7 = objc_opt_class();
    uint64_t PreferenceWithClass = _IndexOfFirstPreferenceWithClass(v6, v7);
    if (PreferenceWithClass != 0x7FFFFFFFFFFFFFFFLL) {
      [v6 replaceObjectAtIndex:PreferenceWithClass withObject:v4];
    }
    paymentCardPreferencesController = self->_paymentCardPreferencesController;
    id v10 = (void *)[v6 copy];
    [(PKPaymentPreferencesViewController *)paymentCardPreferencesController setPreferences:v10];
  }
}

- (void)_setupPaymentPassAndBillingAddress
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  long long v58 = [v3 paymentRequest];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v60 = [(PKPaymentAuthorizationServiceViewController *)self _availablePasses];
  if ([(PKPaymentAuthorizationServiceViewController *)self _shouldShowUsePeerPaymentBalanceToggle])
  {
    id v5 = [v3 peerPaymentPass];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 peerPaymentBalance];
      id v8 = objc_alloc(MEMORY[0x1E4F84BA0]);
      v69[0] = v6;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
      id v10 = (void *)[v8 initWithTitle:0 preferences:v9 selectedIndex:0x7FFFFFFFFFFFFFFFLL readOnly:0];

      [v10 setPeerPaymentPass:v6];
      [v10 setPeerPaymentBalance:v7];
      objc_msgSend(v10, "setOn:", objc_msgSend(v3, "usePeerPaymentBalance"));
      id v11 = [MEMORY[0x1E4F28C28] zero];
      id v12 = [v7 amount];
      BOOL v13 = [v11 compare:v12] == -1 && objc_msgSend(v60, "count") != 0;
      [v10 setEnabled:v13];

      id v14 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentUse.isa);
      [v10 setFooter:v14];
    }
    else
    {
      id v10 = 0;
    }
    [v4 safelyAddObject:v10];
  }
  id v57 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_1.isa);
  id v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F84B78]), "initWithTitle:preferences:selectedIndex:readOnly:", v57, v60, -[PKPaymentAuthorizationServiceViewController selectedPaymentApplicationIndexFromCardEntries:](self, "selectedPaymentApplicationIndexFromCardEntries:", v60), 0);
  [v4 addObject:v56];
  long long v59 = [(PKPaymentAuthorizationServiceViewController *)self _unavailablePasses];
  if ([v59 count])
  {
    char v15 = [v3 paymentRequest];
    long long v16 = [v15 originatingURL];

    if (v16) {
      long long v17 = @"IN_WEB_PAYMENT_OPTIONS_UNAVAILABLE_CARDS_GROUP_NAME";
    }
    else {
      long long v17 = @"IN_APP_PAYMENT_OPTIONS_UNAVAILABLE_CARDS_GROUP_NAME";
    }
    long long v18 = PKLocalizedPaymentString(&v17->isa);
    long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F84B78]) initWithTitle:v18 preferences:v59 selectedIndex:0x7FFFFFFFFFFFFFFFLL readOnly:1];
    [v4 addObject:v19];
  }
  uint64_t v20 = [v58 requiredBillingContactFields];
  int v21 = [v20 containsObject:*MEMORY[0x1E4F87130]];

  if (v21)
  {
    id v22 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v23 = [v3 billingAddress];
    uint64_t v24 = v23;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      id v27 = [MEMORY[0x1E4F84B40] defaults];
      int v28 = [v3 pass];
      id v25 = [v27 defaultBillingAddressForPaymentPass:v28];
    }
    [v22 safelyAddObject:v25];
    uint64_t v29 = [MEMORY[0x1E4F84B40] defaults];
    int v30 = [v29 defaultBillingAddresses];
    uint64_t v31 = [v30 allKeys];
    [v22 addObjectsFromArray:v31];

    BOOL v32 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v33 = *MEMORY[0x1E4F86478];
    uint64_t v34 = *MEMORY[0x1E4F86730];
    v67[0] = *MEMORY[0x1E4F86308];
    v67[1] = v34;
    uint64_t v35 = *MEMORY[0x1E4F86840];
    v68[0] = v33;
    v68[1] = v35;
    uint64_t v36 = *MEMORY[0x1E4F86AB8];
    uint64_t v37 = *MEMORY[0x1E4F864E0];
    v67[2] = *MEMORY[0x1E4F86AC8];
    v67[3] = v37;
    uint64_t v38 = *MEMORY[0x1E4F864D0];
    v68[2] = v36;
    void v68[3] = v38;
    v67[4] = *MEMORY[0x1E4F86AE0];
    uint64_t v39 = [v3 billingAddress];
    BOOL v40 = @"true";
    if (!v39) {
      BOOL v40 = @"false";
    }
    v68[4] = v40;
    BOOL v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:5];
    [v32 subject:*MEMORY[0x1E4F87020] sendEvent:v41];

    if (v25) {
      uint64_t v42 = 0;
    }
    else {
      uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v43 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_26.isa);
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F84B88]) initWithTitle:v43 preferences:v22 selectedIndex:v42 readOnly:0];
    [v26 setContactKey:*MEMORY[0x1E4F1AF10]];
    [v26 setType:0];
    uint64_t v44 = [v58 requiredBillingContactFields];
    objc_msgSend(v26, "setShowPhoneticName:", objc_msgSend(v44, "containsObject:", *MEMORY[0x1E4F87128]));

    [v26 mergeRecentsAndMeCard];
    char v45 = [v26 preferences];
    uint64_t v46 = [v45 firstObject];
    [v3 setBillingAddress:v46];

    uint64_t v47 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_27.isa);
    [v26 setAddNewTitle:v47];

    id v48 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_28.isa);
    [v26 setAddExistingTitle:v48];

    id v49 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_29.isa);
    [v26 setEditExistingTitle:v49];

    [v4 addObject:v26];
  }
  else
  {
    uint64_t v26 = 0;
  }
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PKPaymentAuthorizationServiceViewController__setupPaymentPassAndBillingAddress__block_invoke;
  aBlock[3] = &unk_1E59DB6D0;
  objc_copyWeak(&v64, &location);
  char v65 = v21;
  id v50 = v58;
  id v62 = v50;
  id v51 = v3;
  id v63 = v51;
  uint64_t v52 = _Block_copy(aBlock);
  uint64_t v53 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_30.isa);
  uint64_t v54 = [[PKPaymentPreferencesViewController alloc] initWithStyle:self->_preferencesStyle preferences:v4 title:v53 handler:v52 contactFormatValidator:self->_contactFormatValidator];
  paymentCardPreferencesController = self->_paymentCardPreferencesController;
  self->_paymentCardPreferencesController = v54;

  objc_destroyWeak(&v64);
  objc_destroyWeak(&location);
}

void __81__PKPaymentAuthorizationServiceViewController__setupPaymentPassAndBillingAddress__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_61;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t PreferenceWithClass = _IndexOfFirstPreferenceWithClass(v4, v6);
  if (PreferenceWithClass == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v4 objectAtIndexedSubscript:PreferenceWithClass];
  }
  if (*(unsigned char *)(a1 + 56))
  {
    v75 = [v4 lastObject];
  }
  else
  {
    v75 = 0;
  }
  if ([WeakRetained _shouldShowUsePeerPaymentBalanceToggle])
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v82;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v82 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            goto LABEL_20;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v81 objects:v90 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_20:
  }
  else
  {
    id v15 = 0;
  }
  long long v16 = [v8 preferences];
  v74 = v8;
  long long v17 = objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v8, "selectedIndex"));

  long long v18 = [v17 pass];
  v73 = v17;
  uint64_t v77 = [v17 paymentApplication];
  uint64_t v19 = [*(id *)(a1 + 32) requestType];
  uint64_t v20 = [WeakRetained stateMachine];
  uint64_t v76 = (void *)v20;
  if (v15)
  {
    int v21 = (void *)v20;
    uint64_t v22 = [v15 isOn];
    uint64_t v23 = [v21 model];
    int v24 = v22 ^ [v23 usePeerPaymentBalance];
  }
  else
  {
    int v24 = 0;
    uint64_t v22 = 0;
  }
  id v25 = [*(id *)(a1 + 40) pass];
  int v26 = [v25 isEqual:v18];
  char v27 = v26;
  if (v26 && v19 != 5)
  {
    int v28 = [*(id *)(a1 + 40) paymentApplication];
    char v27 = [v28 isEqual:v77];
  }
  if ((v27 & 1) == 0)
  {
    [*(id *)(a1 + 40) setPass:v18 withSelectedPaymentApplication:v77];
    [v76 didSelectPaymentPass:v18 paymentApplication:v77];
    int v30 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v31 = *MEMORY[0x1E4F87020];
    uint64_t v32 = *MEMORY[0x1E4F86478];
    uint64_t v33 = *MEMORY[0x1E4F86730];
    v88[0] = *MEMORY[0x1E4F86308];
    v88[1] = v33;
    uint64_t v34 = *MEMORY[0x1E4F86880];
    v89[0] = v32;
    v89[1] = v34;
    uint64_t v35 = @"true";
    if (!v18) {
      uint64_t v35 = @"false";
    }
    uint64_t v36 = *MEMORY[0x1E4F86AC8];
    v88[2] = *MEMORY[0x1E4F86AE0];
    v88[3] = v36;
    v89[2] = v35;
    v89[3] = @"card";
    v88[4] = *MEMORY[0x1E4F86890];
    id v37 = v18;
    uint64_t v38 = [v37 associatedAccountServiceAccountIdentifier];

    if (v38)
    {
      uint64_t v39 = @"appleCard";
    }
    else if ([v37 hasAssociatedPeerPaymentAccount])
    {
      uint64_t v39 = @"appleCash";
    }
    else
    {
      uint64_t v54 = [v37 devicePrimaryPaymentApplication];
      uint64_t v55 = [v54 paymentNetworkIdentifier];

      if (v55 == 123) {
        uint64_t v39 = @"barcode";
      }
      else {
        uint64_t v39 = @"other";
      }
    }
    uint64_t v29 = v74;

    v89[4] = v39;
    id v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:5];
    [v30 subject:v31 sendEvent:v56];

    id v57 = [*(id *)(a1 + 32) requiredBillingContactFields];
    LODWORD(v56) = [v57 containsObject:*MEMORY[0x1E4F87130]];

    if (!v56) {
      goto LABEL_53;
    }
    long long v58 = [MEMORY[0x1E4F84B40] defaults];
    uint64_t v44 = [v58 defaultBillingAddressForPaymentPass:v37];

    if (v44)
    {
      long long v59 = [v75 preferences];
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __81__PKPaymentAuthorizationServiceViewController__setupPaymentPassAndBillingAddress__block_invoke_2;
      v78[3] = &unk_1E59D9248;
      id v60 = v44;
      id v79 = v60;
      id v61 = v75;
      id v80 = v61;
      uint64_t v62 = [v59 indexOfObjectPassingTest:v78];

      if (v62 == 0x7FFFFFFFFFFFFFFFLL) {
        id v63 = 0;
      }
      else {
        id v63 = v60;
      }
      [v76 didSelectBillingAddress:v63];
      [v61 setSelectedIndex:v62];

      uint64_t v29 = v74;
    }
    goto LABEL_52;
  }
  if (!v24)
  {
    unint64_t v40 = [v75 selectedIndex];
    BOOL v41 = [v75 preferences];
    unint64_t v42 = [v41 count];

    if (v40 >= v42)
    {
      uint64_t v44 = 0;
    }
    else
    {
      uint64_t v43 = [v75 preferences];
      uint64_t v44 = objc_msgSend(v43, "objectAtIndex:", objc_msgSend(v75, "selectedIndex"));
    }
    uint64_t v29 = v74;
    [v76 didSelectBillingAddress:v44];
    char v45 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v46 = *MEMORY[0x1E4F86478];
    uint64_t v47 = *MEMORY[0x1E4F86730];
    v86[0] = *MEMORY[0x1E4F86308];
    v86[1] = v47;
    uint64_t v48 = *MEMORY[0x1E4F86880];
    v87[0] = v46;
    v87[1] = v48;
    uint64_t v49 = *MEMORY[0x1E4F864E0];
    v86[2] = *MEMORY[0x1E4F86AC8];
    v86[3] = v49;
    uint64_t v50 = *MEMORY[0x1E4F864D0];
    v87[2] = *MEMORY[0x1E4F86AB8];
    v87[3] = v50;
    v86[4] = *MEMORY[0x1E4F86AE0];
    uint64_t v51 = *MEMORY[0x1E4F87020];
    if (v44) {
      uint64_t v52 = @"true";
    }
    else {
      uint64_t v52 = @"false";
    }
    v87[4] = v52;
    uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:5];
    [v45 subject:v51 sendEvent:v53];

LABEL_52:
    goto LABEL_53;
  }
  [*(id *)(a1 + 40) setUsePeerPaymentBalance:v22];
  [v76 didSelectPaymentPass:v18 paymentApplication:v77];
  uint64_t v29 = v74;
LABEL_53:
  if (v15)
  {
    [*(id *)(a1 + 40) beginUpdates];
    id v64 = [*(id *)(a1 + 40) paymentSummaryItems];
    if ([v64 count])
    {
      char v65 = [v64 lastObject];
      v85 = v65;
      uint64_t v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];

      id v64 = (void *)v66;
    }
    [*(id *)(a1 + 40) setPaymentSummaryItems:v64];
    id v67 = [v64 lastObject];
    v68 = [v67 amount];

    long long v69 = [v15 peerPaymentBalance];
    long long v70 = [v69 amount];

    uint64_t v71 = [v15 isOn];
    if (v71) {
      BOOL v72 = [v68 compare:v70] == 1;
    }
    else {
      BOOL v72 = 1;
    }
    [*(id *)(a1 + 40) showPeerPaymentCardDataItem:v71 withCardDataItem:v72];
    [*(id *)(a1 + 40) endUpdates];
  }
LABEL_61:
}

uint64_t __81__PKPaymentAuthorizationServiceViewController__setupPaymentPassAndBillingAddress__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == a2) {
    return 1;
  }
  else {
    return objc_msgSend(*(id *)(a1 + 40), "preferenceObject:representsContact:", a2);
  }
}

- (id)_availabilityStringForPass:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_peerPaymentAccount)
  {
    uint64_t v6 = [v4 uniqueID];
    uint64_t v7 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
    int v8 = [v6 isEqualToString:v7];

    uint64_t v9 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount state];
    if (v8) {
      BOOL v10 = v9 == 3;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      uint64_t v12 = @"PEER_PAYMENT_SETTINGS_ACCOUNT_STATE_LOCKED";
      goto LABEL_17;
    }
    if (v9 == 4) {
      int v11 = v8;
    }
    else {
      int v11 = 0;
    }
    if (v11 == 1)
    {
      uint64_t v12 = @"PEER_PAYMENT_SETTINGS_ACCOUNT_STATE_CLOSED";
LABEL_17:
      uint64_t v19 = PKLocalizedPeerPaymentString(&v12->isa);
LABEL_29:
      uint64_t v23 = (void *)v19;
      goto LABEL_36;
    }
    if (v9 == 1) {
      int v21 = v8;
    }
    else {
      int v21 = 0;
    }
    if (v21 == 1
      && ([MEMORY[0x1E4F84DB8] peerPaymentPassIsProvisionedOnDeviceForAccount:self->_peerPaymentAccount] & 1) == 0)
    {
      uint64_t v12 = @"PEER_PAYMENT_SETTINGS_REGISTRATION_NOT_SET_UP";
      goto LABEL_17;
    }
  }
  else
  {
    [0 state];
  }
  BOOL v13 = [v5 deviceInAppPaymentApplications];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
    if (self->_preferencesStyle == 4) {
      uint64_t v20 = @"WEB";
    }
    else {
      uint64_t v20 = @"APP";
    }
    [NSString stringWithFormat:@"IN_%@_PAYMENT_OPTIONS_UNAVAILABLE_CARD_REASON_CARD_NOT_SUPPORTED", v20];
    goto LABEL_34;
  }
  if (([v5 isDevicePrimaryPaymentApplicationPersonalized] & 1) == 0)
  {
    uint64_t v22 = [v5 devicePrimaryPaymentApplication];
    [v22 state];

    uint64_t v19 = PKDisplayableStringForPaymentApplicationState();
    goto LABEL_29;
  }
  id v15 = [v5 devicePrimaryInAppPaymentApplication];
  uint64_t v16 = [v15 paymentNetworkIdentifier];

  if (v16 != 100)
  {
    if (self->_preferencesStyle == 4) {
      int v24 = @"WEB";
    }
    else {
      int v24 = @"APP";
    }
    [NSString stringWithFormat:@"IN_%@_PAYMENT_OPTIONS_UNAVAILABLE_CARD_REASON_DOES_NOT_SUPPORT_NETWORK", v24];
LABEL_34:
    long long v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = PKLocalizedPaymentString(v17);
    goto LABEL_35;
  }
  long long v17 = [v5 organizationName];
  uint64_t v18 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_31.isa, &stru_1EF1B4C70.isa, v17);
LABEL_35:
  uint64_t v23 = (void *)v18;

LABEL_36:

  return v23;
}

- (void)_updateShippingMethods
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (self->_shippingMethodPreferencesController)
  {
    p_stateMachine = &self->_stateMachine;
    id v4 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v23 = [v4 paymentRequest];

    id v5 = [v23 availableShippingMethods];
    uint64_t v6 = [v5 methods];

    uint64_t v7 = [(PKPaymentAuthorizationStateMachine *)*p_stateMachine model];
    int v8 = [v7 shippingMethod];
    uint64_t v9 = [v6 indexOfObject:v8];

    BOOL v10 = NSString;
    int v11 = [(PKPaymentAuthorizationStateMachine *)*p_stateMachine model];
    uint64_t v12 = [v11 shippingType];
    BOOL v13 = [v10 stringWithFormat:@"IN_APP_PAYMENT_OPTIONS_%@METHOD_GROUP_NAME", v12];
    uint64_t v14 = PKLocalizedPaymentString(v13);

    id v15 = objc_alloc(MEMORY[0x1E4F84B98]);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v9;
    }
    long long v17 = (void *)[v15 initWithTitle:v14 preferences:v6 selectedIndex:v16 readOnly:0];
    uint64_t v18 = [(PKPaymentAuthorizationStateMachine *)*p_stateMachine model];
    uint64_t v19 = [v18 currencyCode];
    [v17 setCurrency:v19];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v17);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKPaymentAuthorizationServiceViewController__updateShippingMethods__block_invoke;
    aBlock[3] = &unk_1E59DB6F8;
    objc_copyWeak(&v25, &location);
    objc_copyWeak(&v26, &from);
    uint64_t v20 = _Block_copy(aBlock);
    shippingMethodPreferencesController = self->_shippingMethodPreferencesController;
    v29[0] = v17;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    [(PKPaymentPreferencesViewController *)shippingMethodPreferencesController setPreferences:v22];

    [(PKPaymentPreferencesViewController *)self->_shippingMethodPreferencesController setHandler:v20];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKPaymentAuthorizationServiceViewController *)self _setupShippingMethods];
  }
}

void __69__PKPaymentAuthorizationServiceViewController__updateShippingMethods__block_invoke(uint64_t a1)
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = (id *)(a1 + 40);
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = [v4 preferences];
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v7 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v6, "selectedIndex"));

    int v8 = [WeakRetained stateMachine];
    uint64_t v9 = [v8 model];
    [v9 setShippingMethod:v7];

    BOOL v10 = [WeakRetained stateMachine];
    [v10 didSelectShippingMethod:v7];

    int v11 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v12 = *MEMORY[0x1E4F87020];
    uint64_t v13 = *MEMORY[0x1E4F86478];
    uint64_t v14 = *MEMORY[0x1E4F86730];
    v20[0] = *MEMORY[0x1E4F86308];
    v20[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4F86880];
    v21[0] = v13;
    v21[1] = v15;
    v20[2] = *MEMORY[0x1E4F86AE0];
    id v16 = objc_loadWeakRetained(v3);
    uint64_t v17 = [v16 selectedIndex];
    uint64_t v18 = @"true";
    if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v18 = @"false";
    }
    v20[3] = *MEMORY[0x1E4F86AC8];
    v21[2] = v18;
    v21[3] = @"shippingMethod";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    [v11 subject:v12 sendEvent:v19];
  }
}

- (void)_updatePreferencesWithErrors:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKPaymentPreferencesViewController *)self->_shippingAddressPreferencesController setErrors:v4 animated:0];
  [(PKPaymentPreferencesViewController *)self->_shippingContactPreferencesController setErrors:v4 animated:0];
  id v5 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  if ([v5 mode] == 1)
  {
    id v6 = [v5 pass];
    uint64_t v7 = [v5 peerPaymentPass];
    int v8 = (void *)[v4 copy];
    uint64_t v9 = [v5 itemForType:3];
    if ([v9 status] == 5)
    {
      id v36 = 0;
      [v9 isValidWithError:&v36];
      id v10 = v36;
      int v11 = v10;
      if (v10)
      {
        int v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v33 = *MEMORY[0x1E4F879E0];
        uint64_t v40 = *MEMORY[0x1E4F28568];
        uint64_t v12 = v40;
        uint64_t v31 = [v10 userInfo];
        uint64_t v13 = [v31 objectForKey:v12];
        v41[0] = v13;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
        uint64_t v15 = v14 = v9;
        [v30 errorWithDomain:v33 code:-1001 userInfo:v15];
        id v16 = v34 = v6;

        uint64_t v9 = v14;
        uint64_t v17 = [v8 arrayByAddingObject:v16];

        id v6 = v34;
        int v8 = (void *)v17;
      }
    }
    [(PKPaymentPreferencesViewController *)self->_paymentCardPreferencesController setErrors:v8 selectedPass:v6 animated:0];
    if (!self->_peerPaymentBalanceIsInsufficient || v7 == 0)
    {
      if (!self->_peerPaymentBalanceIsInsufficient && v7 != 0) {
        [(PKPaymentPreferencesViewController *)self->_paymentCardPreferencesController setErrors:MEMORY[0x1E4F1CBF0] otherPass:v7 animated:0];
      }
    }
    else
    {
      uint64_t v20 = [v7 peerPaymentBalance];
      [v20 minimalFormattedStringValue];
      int v21 = v35 = v6;
      uint64_t v32 = PKLocalizedPaymentString(&cfstr_InAppPaymentEr_7.isa, &stru_1EF1B4C70.isa, v21);

      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F879E0];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      uint64_t v39 = v32;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      int v24 = v8;
      v26 = id v25 = v9;
      char v27 = [v22 errorWithDomain:v23 code:-1001 userInfo:v26];

      uint64_t v9 = v25;
      int v8 = v24;
      paymentCardPreferencesController = self->_paymentCardPreferencesController;
      id v37 = v27;
      uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      [(PKPaymentPreferencesViewController *)paymentCardPreferencesController setErrors:v29 otherPass:v7 animated:0];

      id v6 = v35;
    }
  }
}

- (void)_showUnserviceableAddressAlertForErrors:(id)a3
{
  id v21 = a3;
  id v4 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v5 = [v4 shippingAddress];

  if (([v5 isEqualIgnoringIdentifiers:self->_lastUnserviceableAddress] & 1) == 0
    && objc_msgSend(v21, "pk_containsObjectPassingTest:", &__block_literal_global_358))
  {
    objc_storeStrong((id *)&self->_lastUnserviceableAddress, v5);
    id v6 = NSString;
    uint64_t v7 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    int v8 = [v7 shippingType];
    uint64_t v9 = [v6 stringWithFormat:@"IN_APP_PAYMENT_%@_ADDRESS_UNAVAILABLE_ALERT_TITLE", v8];

    id v10 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    int v11 = [v10 paymentRequest];
    uint64_t v12 = [v11 originatingURL];

    if (v12)
    {
      uint64_t v13 = PKLocalizedPaymentString(&cfstr_WebPaymentAddr.isa);
      uint64_t v14 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      [v14 merchantName];
    }
    else
    {
      uint64_t v13 = PKLocalizedPaymentString(&cfstr_InAppPaymentAd.isa);
      uint64_t v14 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      [v14 hostAppLocalizedName];
    uint64_t v15 = };
    id v16 = PKLocalizedPaymentString(v9, &stru_1EF1B4C70.isa, v15);

    uint64_t v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v16 message:v13 preferredStyle:1];
    uint64_t v18 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v19 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    uint64_t v20 = [v18 actionWithTitle:v19 style:0 handler:0];

    [v17 addAction:v20];
    [(PKPaymentAuthorizationServiceViewController *)self presentViewController:v17 animated:1 completion:0];
  }
}

BOOL __87__PKPaymentAuthorizationServiceViewController__showUnserviceableAddressAlertForErrors___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 domain];
  if ([v3 isEqualToString:*MEMORY[0x1E4F879E0]]) {
    BOOL v4 = [v2 code] == 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_setupCouponCodeEntry
{
  id v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  id v6 = [v3 paymentRequest];

  if ([v6 supportsCouponCode])
  {
    BOOL v4 = [[PKPaymentAuthorizationCouponCodeEntryViewController alloc] initWithStyle:self->_preferencesStyle];
    couponCodeEntryViewController = self->_couponCodeEntryViewController;
    self->_couponCodeEntryViewController = v4;

    [(PKPaymentAuthorizationCouponCodeEntryViewController *)self->_couponCodeEntryViewController setDelegate:self];
  }
}

- (void)_updateCouponCodeEntry
{
}

- (void)_updatePreferredContentSize
{
  if (!self->_layoutRecursionCounter)
  {
    [(PKPaymentAuthorizationServiceViewController *)self preferredContentSize];
    double v4 = v3;
    double v6 = v5;
    id v48 = [(PKPaymentAuthorizationServiceViewController *)self viewIfLoaded];
    uint64_t v7 = [(PKPaymentAuthorizationServiceViewController *)self navigationController];
    int v8 = [v7 navigationBar];
    [v8 bounds];
    double v10 = v9;

    if (self->_passphraseViewController)
    {
      getAKModalSignInViewControllerClass();
      if (objc_opt_isKindOfClass())
      {
        id v16 = [(UIViewController *)self->_passphraseViewController view];
        uint64_t v17 = [v16 subviews];
        uint64_t v18 = [v17 firstObject];
        LODWORD(v19) = 1148846080;
        LODWORD(v20) = 1112014848;
        objc_msgSend(v18, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, 0.0, v19, v20);
        double v6 = v21 + 0.0;

        if (!self->_usingLargeLayout)
        {
          if (!CGRectIsNull(self->_keyboardFrame))
          {
            double height = self->_keyboardFrame.size.height;
            [v48 safeAreaInsets];
            double v6 = v6 + height - v15.n128_f64[0];
          }
          double v6 = v6 + 17.0;
        }
      }
      else if (self->_usingLargeLayout)
      {
        double v10 = v4;
      }
      else
      {
        double v6 = 406.0;
      }
    }
    else
    {
      totalView = self->_totalView;
      if (totalView)
      {
        LODWORD(v11) = 1148846080;
        LODWORD(v12) = 1112014848;
        -[PKPaymentAuthorizationTotalView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](totalView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, 0.0, v11, v12);
        double v25 = v24;
      }
      else
      {
        double v25 = 0.0;
      }
      if ([(PKPaymentAuthorizationPasswordButtonView *)self->_passwordButtonView isHidden])
      {
        double v28 = 0.0;
      }
      else
      {
        LODWORD(v26) = 1148846080;
        LODWORD(v27) = 1112014848;
        -[PKPaymentAuthorizationPasswordButtonView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_passwordButtonView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, 0.0, v26, v27);
        double v28 = v29;
      }
      LODWORD(v26) = 1148846080;
      LODWORD(v27) = 1112014848;
      -[PKPaymentAuthorizationFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_footerView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, 0.0, v26, v27);
      double v31 = v25 + v28 + v30;
      double v32 = 0.0;
      double v33 = v31 + 0.0;
      summaryItemsView = self->_summaryItemsView;
      if (summaryItemsView)
      {
        uint64_t v35 = [(PKPaymentAuthorizationServiceViewController *)self view];
        [v35 bounds];
        -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:](summaryItemsView, "sizeThatFits:", v36, 1.79769313e308);
        double v32 = v37;
      }
      [(UITableView *)self->_detailTableView contentSize];
      double v6 = v33 + v32 + v14.n128_f64[0];
    }
    v13.n128_f64[0] = v10;
    v14.n128_f64[0] = v6;
    PKSizeRoundToPixel(v13, v14, v15);
    double v39 = v38;
    double v41 = v40;
    [(PKPaymentAuthorizationServiceViewController *)self preferredContentSize];
    if (v39 != v43 || v41 != v42) {
      -[PKPaymentAuthorizationServiceViewController setPreferredContentSize:](self, "setPreferredContentSize:", v39, v41);
    }
    int64_t v45 = [(PKPaymentAuthorizationServiceViewController *)self _totalViewStyle];
    [(PKPaymentAuthorizationTotalView *)self->_totalView setStyle:v45];
    BOOL v46 = v45 == 2;
    [(PKPaymentAuthorizationSummaryItemsView *)self->_summaryItemsView setOccludesBodyView:v46];
    [(PKPaymentAuthorizationFooterView *)self->_footerView setOccludesBodyView:v46];
    int v47 = [(UITableView *)self->_detailTableView isScrollEnabled];
    [(UITableView *)self->_detailTableView setScrollEnabled:v46];
    if (v46 != v47) {
      [(UITableView *)self->_detailTableView reloadData];
    }
  }
}

- (int64_t)_totalViewStyle
{
  double v3 = [(PKPaymentAuthorizationServiceViewController *)self _compactNavigationController];
  double v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  double v5 = [v3 viewIfLoaded];
  [v5 layoutIfNeeded];

  [(PKPaymentAuthorizationServiceViewController *)self preferredContentSize];
  objc_msgSend(v4, "childViewControllerPreferredContentSizeForSize:isRoot:", 1);
  double v7 = v6;
  objc_msgSend(v4, "navigationControllerSizeForChildViewControllerPreferredContentSize:isRoot:", 1);
  objc_msgSend(v4, "childViewControllerSizeForNavigationControllerSize:");
  if (v7 - v8 < PKUIPixelLength())
  {
    double v9 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    double v10 = [v9 paymentSummaryItems];
    int64_t v11 = (unint64_t)[v10 count] < 2;
  }
  else
  {
LABEL_4:
    int64_t v11 = 2;
  }

  return v11;
}

- (id)_compactNavigationController
{
  id v2 = [(PKPaymentAuthorizationServiceViewController *)self navigationController];
  double v3 = objc_msgSend(v2, "pkui_compactNavigationContainer");

  return v3;
}

- (int64_t)_authenticatorPolicy
{
  id v2 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  double v3 = [v2 paymentRequest];
  uint64_t v4 = [v3 requestType];

  uint64_t v5 = [v2 mode];
  double v6 = [v2 paymentRequest];
  int v7 = [v6 useLocationBasedAuthorization];

  if (v5 == 3)
  {
    if (v4 == 6) {
      int64_t v12 = 8;
    }
    else {
      int64_t v12 = 2;
    }
  }
  else if (v5 == 1)
  {
    int v8 = [v2 praguePolicyRequired];
    int v9 = [v2 pinRequired];
    uint64_t v10 = 2;
    if (v7) {
      uint64_t v10 = 4;
    }
    if (v9) {
      uint64_t v10 = 3;
    }
    uint64_t v11 = 5;
    if (v7) {
      uint64_t v11 = 7;
    }
    if (v9) {
      uint64_t v11 = 6;
    }
    if (v8) {
      int64_t v12 = v11;
    }
    else {
      int64_t v12 = v10;
    }
  }
  else
  {
    int64_t v12 = 2;
  }

  return v12;
}

- (id)_evaluationRequestWithHasInitialAuthenticatorState:(BOOL)a3 initialAuthenticatorState:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(PKPaymentAuthorizationServiceViewController *)self _authenticatorPolicy];
  int v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 0xA) {
      int v9 = 0;
    }
    else {
      int v9 = off_1E59DB888[v7];
    }
    *(_DWORD *)buf = 138412290;
    double v26 = v9;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "New authenticator policy is %@", buf, 0xCu);
  }

  uint64_t v10 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  uint64_t v11 = [v10 paymentRequest];
  uint64_t v12 = [v11 requestType];
  __n128 v13 = (void *)[objc_alloc(MEMORY[0x1E4F88110]) initWithPolicy:v7];
  __n128 v14 = v13;
  if (v5) {
    [v13 setInitialAuthenticatorState:a4];
  }
  if ([v11 _isAMPPayment]) {
    goto LABEL_15;
  }
  if (v12 == 6)
  {
    double v24 = [v11 externalizedContext];
    [v14 setExternalizedContext:v24];

    goto LABEL_16;
  }
  if (v12 == 13 || v12 == 7)
  {
LABEL_15:
    id v16 = [v11 externalizedContext];
    [v14 setExternalizedContext:v16];

    objc_msgSend(v14, "setAccessControlRef:", objc_msgSend(v11, "accesssControlRef"));
  }
LABEL_16:
  if ([v11 _isAMPPayment]) {
    [v14 setMaxBiometryFailures:*MEMORY[0x1E4F870C8]];
  }
  if (v7 == 6 || v7 == 3)
  {
    uint64_t v17 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
    uint64_t v18 = [v17 pass];
    double v19 = [v18 localizedDescription];
    double v20 = PKLocalizedPaymentString(&cfstr_InAppPaymentPi.isa, &stru_1EF1B4C70.isa, v19);

    [v14 setPINTitle:v20];
    double v21 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F87178]];
    [v14 setPINLength:v21];
  }
  if ([v11 confirmationStyle] == 1)
  {
    uint64_t v22 = PKLocalizedPaymentString(&cfstr_InAppPaymentPa.isa);
  }
  else
  {
    uint64_t v22 = 0;
  }
  [v14 setPasscodeTitle:v22];

  return v14;
}

- (void)_setVisible:(BOOL)a3
{
  if (((!self->_visible ^ a3) & 1) == 0)
  {
    self->_visible = a3;
    if (a3) {
      self->_viewAppeared = 1;
    }
    [(PKPaymentAuthorizationServiceViewController *)self _updatePhysicalButtonState];
    [(PKPaymentAuthorizationServiceViewController *)self _updateCoachingState];
  }
}

- (void)_setAuthenticating:(BOOL)a3
{
  if (((!self->_authenticating ^ a3) & 1) == 0)
  {
    self->_authenticating = a3;
    [(PKPaymentAuthorizationServiceViewController *)self _updatePhysicalButtonState];
    [(PKPaymentAuthorizationServiceViewController *)self _updateCoachingState];
  }
}

- (void)_setPasscodeViewController:(id)a3
{
  BOOL v5 = (UIViewController *)a3;
  if (self->_passcodeViewController != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_passcodeViewController, a3);
    [(PKPaymentAuthorizationServiceViewController *)self _updatePhysicalButtonState];
    [(PKPaymentAuthorizationServiceViewController *)self _updateCoachingState];
    BOOL v5 = v6;
  }
}

- (void)_setPassphraseViewController:(id)a3
{
  BOOL v5 = (UIViewController *)a3;
  if (self->_passphraseViewController != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_passphraseViewController, a3);
    [(PKPaymentAuthorizationServiceViewController *)self _updatePhysicalButtonState];
    [(PKPaymentAuthorizationServiceViewController *)self _updateCoachingState];
    BOOL v5 = v6;
  }
}

- (void)_updateUserIntentStyle
{
  int64_t v3 = [MEMORY[0x1E4F88108] userIntentStyle];
  if (self->_userIntentStyle != v3)
  {
    int64_t v4 = v3;
    self->_userIntentStyle = v3;
    footerView = self->_footerView;
    [(PKPaymentAuthorizationFooterView *)footerView setUserIntentStyle:v4];
  }
}

- (void)_updatePhysicalButtonState
{
  if (self->_bypassAuthenticator || self->_passphraseViewController) {
    goto LABEL_3;
  }
  unint64_t v11 = [(PKPaymentAuthorizationFooterView *)self->_footerView state];
  int64_t userIntentStyle = self->_userIntentStyle;
  if (userIntentStyle == 1 && v11 == 3)
  {
    int v16 = 0;
    BOOL v3 = 0;
    goto LABEL_39;
  }
  if (!self->_allowBiometricPhysicalButtonInstruction || v11 > 5 || ((1 << v11) & 0x25) == 0)
  {
    if (!self->_allowCompactProcessing)
    {
LABEL_3:
      BOOL v3 = 0;
      int v4 = 0;
      int64_t v5 = 0;
      goto LABEL_4;
    }
    if (userIntentStyle == 1)
    {
      BOOL v3 = 0;
      if (v11 != 10)
      {
        int64_t v5 = 0;
LABEL_44:
        int v4 = 0;
        goto LABEL_4;
      }
    }
    else
    {
      int64_t v5 = 0;
      BOOL v3 = 0;
      if (!self->_allowBiometricPhysicalButtonInstruction || v11 != 10) {
        goto LABEL_44;
      }
    }
    int v16 = 1;
    goto LABEL_39;
  }
  int v16 = 0;
  BOOL v3 = 1;
LABEL_39:
  if (self->_visible && self->_authenticating && ((self->_passcodeViewController == 0) & ~v16) != 0)
  {
    int v4 = 1;
    int64_t v5 = 1;
  }
  else
  {
    int v4 = 0;
    int64_t v5 = 2;
  }
LABEL_4:
  if (self->_physicalButtonState != v5 || self->_useBiometricPhysicalButtonInstruction != v3)
  {
    self->_physicalButtonState = v5;
    self->_useBiometricPhysicalButtonInstruction = v3;
    BOOL physicalButtonVisibleOnce = self->_physicalButtonVisibleOnce;
    if ((self->_physicalButtonVisibleOnce & ~v4) == 0)
    {
      if (v3) {
        int64_t v7 = 2;
      }
      else {
        int64_t v7 = 1;
      }
      self->_physicalButtonAnimationStyle = v7;
      char v8 = v4 ^ 1;
      if (physicalButtonVisibleOnce) {
        char v8 = 1;
      }
      if ((v8 & 1) == 0) {
        self->_BOOL physicalButtonVisibleOnce = 1;
      }
    }
    [(PKPaymentAuthorizationServiceViewController *)self _updatePhysicalButtonInstructionAndNotify:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v17 = WeakRetained;
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 authorizationViewControllerDidChangePhysicalButtonState:self];

      id WeakRetained = v17;
    }
  }
}

- (void)_updatePhysicalButtonInstructionAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  if (((PKUserIntentIsAvailable() & 1) != 0 || self->_allowBiometricPhysicalButtonInstruction)
    && (self->_physicalButtonState == 1 || !self->_physicalButtonVisibleOnce))
  {
    if (self->_useBiometricPhysicalButtonInstruction)
    {
      uint64_t v5 = PKLocalizedPaymentString(&cfstr_GenericTouchId.isa);
    }
    else
    {
      double v6 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
      int64_t v7 = [v6 paymentRequest];

      uint64_t v8 = [v7 confirmationStyle];
      int v9 = [v7 localizedBiometricConfirmationTitle];
      id v10 = v9;
      if (!v9)
      {
        switch(v8)
        {
          case 0:
            uint64_t v12 = @"IN_APP_PAYMENT_PUSH_BUTTON";
            goto LABEL_21;
          case 1:
            uint64_t v12 = @"IN_APP_PAYMENT_PUSH_BUTTON_CONFIRM";
            goto LABEL_21;
          case 2:
            uint64_t v12 = @"IN_APP_PAYMENT_PUSH_BUTTON_GET";
            goto LABEL_21;
          case 3:
            uint64_t v12 = @"IN_APP_PAYMENT_PUSH_BUTTON_INSTALL";
            goto LABEL_21;
          case 4:
            uint64_t v12 = @"IN_APP_PAYMENT_PUSH_BUTTON_RENT";
            goto LABEL_21;
          case 5:
            uint64_t v12 = @"IN_APP_PAYMENT_PUSH_BUTTON_REDEEM";
            goto LABEL_21;
          case 6:
            uint64_t v12 = @"IN_APP_PAYMENT_PUSH_BUTTON_ADD";
            goto LABEL_21;
          case 7:
            uint64_t v12 = @"IN_APP_PAYMENT_PUSH_BUTTON_SUBSCRIBE";
            goto LABEL_21;
          case 8:
            uint64_t v12 = @"IN_APP_PAYMENT_PUSH_BUTTON_SUBSCRIBE_AND_INSTALL";
LABEL_21:
            PKLocalizedPearlString(&v12->isa);
            id v11 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          default:
            id v17 = 0;
            goto LABEL_23;
        }
      }
      id v11 = v9;
LABEL_22:
      id v17 = v11;
LABEL_23:

      uint64_t v5 = (uint64_t)v17;
    }
    id v18 = (id)v5;
    if ((PKEqualObjects() & 1) == 0)
    {
      __n128 v13 = (NSString *)[v18 copy];
      physicalButtonInstruction = self->_physicalButtonInstruction;
      self->_physicalButtonInstruction = v13;

      if (v3)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        int v16 = WeakRetained;
        if (WeakRetained) {
          [WeakRetained authorizationViewControllerDidChangePhysicalButtonState:self];
        }
      }
    }
  }
}

- (void)_updateCoachingState
{
  if (PKPearlIsAvailable()
    && self->_visible
    && self->_authenticating
    && !self->_passcodeViewController
    && !self->_passphraseViewController)
  {
    int64_t internalCoachingState = self->_internalCoachingState;
    BOOL v4 = self->_faceIDCameraEdge == 3;
  }
  else
  {
    int64_t internalCoachingState = 0;
    BOOL v4 = 0;
  }
  if (self->_coachingState == internalCoachingState)
  {
    if (self->_showPoseOutOfRangeDownCoaching != v4)
    {
      self->_int64_t coachingState = internalCoachingState;
      self->_showPoseOutOfRangeDownCoaching = v4;
      [(PKPaymentAuthorizationServiceViewController *)self _updateFooterStateIfAuthenticatingWithBiometricFailure:0];
    }
  }
  else
  {
    self->_int64_t coachingState = internalCoachingState;
    self->_showPoseOutOfRangeDownCoaching = v4;
    [(PKPaymentAuthorizationServiceViewController *)self _updateFooterStateIfAuthenticatingWithBiometricFailure:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained authorizationViewControllerDidChangeCoachingState:self];
  }
}

- (void)_updateFooterStateIfAuthenticatingWithBiometricFailure:(BOOL)a3
{
  if (self->_authenticating)
  {
    BOOL v3 = a3;
    int64_t v5 = -[PKPaymentAuthorizationServiceViewController _progressStateForAuthenticationWithBiometricFailure:](self, "_progressStateForAuthenticationWithBiometricFailure:");
    if ([(PKPaymentAuthorizationFooterView *)self->_footerView state] != v5) {
      [(PKPaymentAuthorizationServiceViewController *)self setFooterState:v5 string:0 animated:1];
    }
    if (v3)
    {
      [(PKPaymentAuthorizationServiceViewController *)self biometricAttemptFailed];
    }
  }
}

- (BOOL)_passcodeAllowed
{
  BOOL v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  BOOL v4 = [v3 paymentRequest];

  if (self->_isAMPPayment) {
    char v5 = [v4 _isPSD2StyleRequest];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)_passwordRequired
{
  if (![(PKPaymentAuthorizationServiceViewController *)self _passcodeAllowed]) {
    return 1;
  }
  BOOL v3 = [(PKPaymentAuthorizationStateMachine *)self->_stateMachine model];
  BOOL v4 = [v3 paymentRequest];
  if ([v4 _isPSD2StyleRequest])
  {
    if ([v3 mode] == 3)
    {
      BOOL v5 = 1;
    }
    else
    {
      int v6 = objc_msgSend(MEMORY[0x1E4F88108], "currentStateForAccessControl:", objc_msgSend(v4, "accesssControlRef"));
      BOOL v5 = (v6 & objc_msgSend(MEMORY[0x1E4F88108], "currentStateForPolicy:", -[PKPaymentAuthorizationServiceViewController _authenticatorPolicy](self, "_authenticatorPolicy")) & 8) == 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_sendDidEncounterAuthorizationEventIfNecessary:(unint64_t)a3
{
  if (self->_isAMPPayment)
  {
    p_host = &self->_host;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_host);
      [v7 didEncounterAuthorizationEvent:a3];
    }
  }
}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
}

- (PKPaymentAuthorizationStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (PKAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void)setAuthenticator:(id)a3
{
}

- (int64_t)physicalButtonState
{
  return self->_physicalButtonState;
}

- (int64_t)physicalButtonAnimationStyle
{
  return self->_physicalButtonAnimationStyle;
}

- (NSString)physicalButtonInstruction
{
  return self->_physicalButtonInstruction;
}

- (int64_t)coachingState
{
  return self->_coachingState;
}

- (PKPaymentAuthorizationServiceViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentAuthorizationServiceViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentAuthorizationHostProtocol)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (PKPaymentAuthorizationHostProtocol *)WeakRetained;
}

- (void)setHost:(id)a3
{
}

- (BOOL)blockingHardwareCancels
{
  return self->_blockingHardwareCancels;
}

- (PKPaymentAuthorizationPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (PKPaymentAuthorizationPresenter *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_host);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_physicalButtonInstruction, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_lastUnserviceableAddress, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_passphraseViewController, 0);
  objc_storeStrong((id *)&self->_passcodeViewController, 0);
  objc_storeStrong((id *)&self->_couponCodeEntryViewController, 0);
  objc_storeStrong((id *)&self->_bankAccountPreferencesController, 0);
  objc_storeStrong((id *)&self->_paymentCardPreferencesController, 0);
  objc_storeStrong((id *)&self->_shippingContactPreferencesController, 0);
  objc_storeStrong((id *)&self->_shippingAddressPreferencesController, 0);
  objc_storeStrong((id *)&self->_shippingMethodPreferencesController, 0);
  objc_storeStrong((id *)&self->_contentViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_passphraseSeparatorView, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_passphraseBottomConstraint, 0);
  objc_storeStrong((id *)&self->_passwordButtonView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_totalView, 0);
  objc_storeStrong((id *)&self->_summaryHeightConstraint, 0);
  objc_storeStrong((id *)&self->_summaryItemsView, 0);
  objc_storeStrong((id *)&self->_detailTableView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_layout, 0);
}

@end