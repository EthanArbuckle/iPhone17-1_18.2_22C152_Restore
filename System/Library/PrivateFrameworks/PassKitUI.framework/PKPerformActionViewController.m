@interface PKPerformActionViewController
+ (id)alertControllerForUnableReason:(unint64_t)a3 action:(id)a4 displayableError:(id)a5 addCardActionHandler:(id)a6;
+ (id)alertControllerForUnableReason:(unint64_t)a3 action:(id)a4 displayableError:(id)a5 addCardActionHandler:(id)a6 unavailableActionHandler:(id)a7 cancelActionHandler:(id)a8;
- (BOOL)_shouldPresentPaymentRequest:(int64_t)a3;
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (BOOL)shouldHidePassView;
- (PKPaymentPass)pass;
- (PKPaymentPassAction)action;
- (PKPaymentWebService)webService;
- (PKPerformActionView)actionView;
- (PKPerformActionViewController)init;
- (PKPerformActionViewController)initWithPass:(id)a3 action:(id)a4;
- (PKPerformActionViewController)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5;
- (PKPerformActionViewController)initWithPass:(id)a3 action:(id)a4 viewStyle:(int64_t)a5 paymentDataProvider:(id)a6;
- (PKPerformActionViewControllerDelegate)delegate;
- (id)_actionViewForPass:(id)a3 action:(id)a4;
- (id)_generateGenericAlertWithCompletion:(id)a3;
- (id)_generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:(id)a3;
- (id)_generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion:(id)a3;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)_canPerformPaymentWithCompletion:(id)a3;
- (void)_cancelButtonPressed:(id)a3;
- (void)_fetchRemoteContentIfNeeded;
- (void)_presentAddAnotherCardFlowWithTransitNetworkIdentifiers:(id)a3;
- (void)_presentPaymentSetupControllerWithAllowedPaymentNetworks:(id)a3;
- (void)_reloadActionView;
- (void)_rightBarButtonPressed:(id)a3;
- (void)_showGenericErrorAlert:(id)a3;
- (void)_showLoadingView:(BOOL)a3;
- (void)_showNoActionsAvailableDueToConflictErrorAlert;
- (void)_showNoActionsAvailableDueToRemoteActionFailureAlert;
- (void)_showSpinner:(BOOL)a3;
- (void)autoReloadSetupController:(id)a3 requestsDismissViewController:(id)a4;
- (void)autoReloadSetupController:(id)a3 requestsPresentViewController:(id)a4;
- (void)autoReloadSetupControllerDidCompleteWithAmount:(id)a3 threshold:(id)a4;
- (void)didTapSetUpAutoReloadButton;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)paymentSetupDidFinish:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRightBarButtonEnabled:(BOOL)a3;
- (void)setWebService:(id)a3;
- (void)shakeCard;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFirstResponder;
- (void)updatePassViewVisibility;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPerformActionViewController

+ (id)alertControllerForUnableReason:(unint64_t)a3 action:(id)a4 displayableError:(id)a5 addCardActionHandler:(id)a6 unavailableActionHandler:(id)a7 cancelActionHandler:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (a3 == 6)
  {
    v18 = PKCreateAlertControllerForWalletUninstalled(0);
    goto LABEL_21;
  }
  if (!v14)
  {
    v18 = 0;
    goto LABEL_21;
  }
  v19 = (void *)MEMORY[0x1E4FB1418];
  v20 = PKTitleForDisplayableError();
  v21 = MEMORY[0x1A6221F20](v14);
  v18 = [v19 alertControllerWithTitle:v20 message:v21 preferredStyle:1];

  if (a3 == 5) {
    v22 = @"PASS_ACTION_UNAVAILABLE_OK_BUTTON_TITLE";
  }
  else {
    v22 = @"PASS_ACTION_UNAVAILABLE_CANCEL_BUTTON_TITLE";
  }
  v23 = PKLocalizedPaymentString(&v22->isa);
  v24 = (void *)MEMORY[0x1E4FB1410];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke;
  v43[3] = &unk_1E59CB150;
  id v44 = v17;
  v25 = [v24 actionWithTitle:v23 style:1 handler:v43];
  [v18 addAction:v25];
  if (a3 == 2 && v15)
  {
    v37 = v23;
    if (([v13 serviceProviderCapabilities] & 0xC) == 8) {
      v26 = @"PASS_ACTION_UNAVAILABLE_ADD_DEBIT_CARD_BUTTON_TITLE";
    }
    else {
      v26 = @"PASS_ACTION_UNAVAILABLE_ADD_CARD_BUTTON_TITLE";
    }
    v27 = (void *)MEMORY[0x1E4FB1410];
    v28 = PKLocalizedPaymentString(&v26->isa);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_2;
    v41[3] = &unk_1E59CB150;
    id v42 = v15;
    v29 = [v27 actionWithTitle:v28 style:0 handler:v41];

    [v18 addAction:v29];
    [v18 setPreferredAction:v29];

    v30 = v42;
LABEL_19:

    v23 = v37;
    goto LABEL_20;
  }
  if (a3 == 7)
  {
    v37 = v23;
    v31 = [v13 unavailableActionTitle];
    v32 = v31;
    if (v31)
    {
      id v33 = v31;
    }
    else
    {
      PKLocalizedPaymentString(&cfstr_PassActionUnav.isa);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v33;

    v34 = (void *)MEMORY[0x1E4FB1410];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_3;
    v38[3] = &unk_1E59D0C60;
    id v39 = v13;
    id v40 = v16;
    v35 = [v34 actionWithTitle:v30 style:0 handler:v38];
    [v18 addAction:v35];
    [v18 setPreferredAction:v35];

    goto LABEL_19;
  }
LABEL_20:

LABEL_21:

  return v18;
}

uint64_t __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) unavailableActionURL];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F590F0]) initWithURL:v3];
    [v4 setShouldReturnErrorOnUserCancellation:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_4;
    v7[3] = &unk_1E59CD2D0;
    id v8 = v3;
    id v9 = *(id *)(a1 + 40);
    id v5 = v3;
    [v4 requestClipWithCompletion:v7];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
}

void __154__PKPerformActionViewController_alertControllerForUnableReason_action_displayableError_addCardActionHandler_unavailableActionHandler_cancelActionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPerformActionViewController launches app clip", v9, 2u);
    }
  }
  else
  {
    if ([v5 code] == 8) {
      goto LABEL_7;
    }
    v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v7 openURL:*(void *)(a1 + 32) configuration:0 completionHandler:0];
  }

LABEL_7:
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

+ (id)alertControllerForUnableReason:(unint64_t)a3 action:(id)a4 displayableError:(id)a5 addCardActionHandler:(id)a6
{
  return (id)[a1 alertControllerForUnableReason:a3 action:a4 displayableError:a5 addCardActionHandler:a6 unavailableActionHandler:0 cancelActionHandler:0];
}

- (PKPerformActionViewController)init
{
  return [(PKPerformActionViewController *)self initWithPass:0 action:0];
}

- (PKPerformActionViewController)initWithPass:(id)a3 action:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F84A88];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [(PKPerformActionViewController *)self initWithPass:v8 action:v7 paymentDataProvider:v9];

  return v10;
}

- (PKPerformActionViewController)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5
{
  return [(PKPerformActionViewController *)self initWithPass:a3 action:a4 viewStyle:0 paymentDataProvider:a5];
}

- (PKPerformActionViewController)initWithPass:(id)a3 action:(id)a4 viewStyle:(int64_t)a5 paymentDataProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = [v12 type];
  if (v14)
  {
    uint64_t v15 = v14;
    v34.receiver = self;
    v34.super_class = (Class)PKPerformActionViewController;
    id v16 = [(PKPerformActionViewController *)&v34 init];
    id v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_pass, a3);
      p_action = (id *)&v17->_action;
      objc_storeStrong((id *)&v17->_action, a4);
      uint64_t v19 = [MEMORY[0x1E4F84D50] sharedService];
      webService = v17->_webService;
      v17->_webService = (PKPaymentWebService *)v19;

      objc_storeStrong((id *)&v17->_paymentDataProvider, a6);
      v21 = [(PKPerformActionViewController *)v17 navigationItem];
      id v22 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
      [v22 configureWithTransparentBackground];
      v23 = PKProvisioningBackgroundColor();
      [v22 setBackgroundColor:v23];

      [v21 setStandardAppearance:v22];
      [v21 setScrollEdgeAppearance:v22];
      if (v15 != 5)
      {
        v24 = [*p_action title];
        [v21 setTitle:v24];
      }
      v25 = [*p_action confirmationTitle];
      uint64_t v26 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v25 style:2 target:v17 action:sel__rightBarButtonPressed_];
      button = v17->_button;
      v17->_button = (UIBarButtonItem *)v26;

      [v21 setRightBarButtonItem:v17->_button];
      v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      uint64_t v29 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v28];
      spinner = v17->_spinner;
      v17->_spinner = (UIBarButtonItem *)v29;

      [v28 startAnimating];
      v17->_fieldsVerified = 1;
      if (+[PKPaymentAutoReloadSetupController shouldOfferAutoReloadForPass:v11])
      {
        v31 = [[PKPaymentAutoReloadSetupController alloc] initWithPass:v11 paymentDataProvider:v13 viewStyle:a5 delegate:v17];
        autoReloadSetupController = v17->_autoReloadSetupController;
        v17->_autoReloadSetupController = v31;
      }
    }
  }
  else
  {

    id v17 = 0;
  }

  return v17;
}

- (void)autoReloadSetupController:(id)a3 requestsPresentViewController:(id)a4
{
}

- (void)autoReloadSetupController:(id)a3 requestsDismissViewController:(id)a4
{
}

- (void)autoReloadSetupControllerDidCompleteWithAmount:(id)a3 threshold:(id)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    id v9 = objc_loadWeakRetained((id *)p_delegate);
    id v10 = v9;
    if (v8) {
      [v9 performActionViewControllerDidCompleteAutoReload:self];
    }
    else {
      [v9 performActionViewControllerDidPerformAction:self];
    }
  }
  else
  {
    id v10 = [(PKPerformActionViewController *)self navigationController];
    [v10 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)didTapSetUpAutoReloadButton
{
}

- (id)_actionViewForPass:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 type];
  switch(v8)
  {
    case 1:
      id v9 = off_1E59C4EB8;
      goto LABEL_7;
    case 5:
      id v9 = off_1E59C4ED0;
      goto LABEL_7;
    case 2:
      id v9 = off_1E59C4EE0;
LABEL_7:
      id v10 = (void *)[objc_alloc(*v9) initWithPass:v6 action:v7 paymentDataProvider:self->_paymentDataProvider];
      goto LABEL_9;
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKPerformActionViewController;
  [(PKPerformActionViewController *)&v11 viewWillAppear:a3];
  [(PKPerformActionViewController *)self _fetchRemoteContentIfNeeded];
  v4 = [(PKPerformActionViewController *)self navigationController];
  id v5 = [(PKPerformActionViewController *)self presentingViewController];
  if (v5)
  {
    id v6 = v5;
    if (v4)
    {
      id v7 = [v4 viewControllers];
      uint64_t v8 = [v7 count];

      if (v8 != 1) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    id v9 = [(PKPerformActionViewController *)self navigationItem];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonPressed_];
    [v9 setLeftBarButtonItem:v10];
  }
LABEL_7:
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPerformActionViewController;
  [(PKPerformActionViewController *)&v4 viewWillDisappear:a3];
  if (objc_opt_respondsToSelector()) {
    [(PKPerformActionView *)self->_actionView willDismissViewController];
  }
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PKPerformActionViewController;
  [(PKPerformActionViewController *)&v10 viewDidLoad];
  v3 = [(PKPerformActionViewController *)self view];
  objc_super v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  id v5 = [PKPerformActionPassView alloc];
  pass = self->_pass;
  id v7 = [(PKPerformActionViewController *)self view];
  [v7 bounds];
  uint64_t v8 = -[PKPerformActionPassView initWithPass:frame:](v5, "initWithPass:frame:", pass);
  passView = self->_passView;
  self->_passView = v8;

  [(PKPerformActionPassView *)self->_passView setHidden:[(PKPerformActionViewController *)self shouldHidePassView]];
  [v3 addSubview:self->_passView];
  [(PKPerformActionViewController *)self _reloadActionView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPerformActionViewController;
  [(PKPerformActionViewController *)&v4 viewDidAppear:a3];
  [(PKPerformActionViewController *)self updateFirstResponder];
}

- (void)updateFirstResponder
{
  uint64_t v3 = [(PKPaymentPassAction *)self->_action type];
  objc_super v4 = [(PKPerformActionView *)self->_actionView amountTextField];
  id v5 = v4;
  if (v3 == 1) {
    [v4 becomeFirstResponder];
  }
  else {
    [v4 resignFirstResponder];
  }
}

- (void)viewWillLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PKPerformActionViewController;
  [(PKPerformActionViewController *)&v28 viewWillLayoutSubviews];
  uint64_t v3 = [(PKPerformActionViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double width = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12;
  double v15 = v14;
  double x = v5 + 0.0;
  double y = v7 + v17;
  double height = v11 - (v17 + v19);
  memset(&remainder, 0, sizeof(remainder));
  -[PKPerformActionPassView sizeThatFits:](self->_passView, "sizeThatFits:", width, height, 0, 0, 0, 0);
  CGFloat v22 = v21;
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  CGRectDivide(v29, &v26, &remainder, v22, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[PKPerformActionPassView setFrame:](self->_passView, "setFrame:");
  if (([(PKPerformActionPassView *)self->_passView isHidden] & 1) == 0)
  {
    double x = remainder.origin.x;
    double y = remainder.origin.y;
    double width = remainder.size.width;
    double height = remainder.size.height;
  }
  double v23 = v13 + x;
  double v24 = y + 0.0;
  double v25 = width - (v13 + v15);
  -[PKPerformActionView setFrame:](self->_actionView, "setFrame:", v23, v24, v25, height);
  -[PKPerformActionLoadingView setFrame:](self->_loadingView, "setFrame:", v23, v24, v25, height);
}

- (BOOL)shouldHidePassView
{
  if (!PKUIGetMinScreenWidthType()) {
    return 1;
  }
  uint64_t v3 = [(PKPerformActionViewController *)self traitCollection];
  BOOL v4 = [v3 verticalSizeClass] == 1;

  return v4;
}

- (void)updatePassViewVisibility
{
  BOOL v3 = [(PKPerformActionViewController *)self shouldHidePassView];
  if (v3 != [(PKPerformActionPassView *)self->_passView isHidden])
  {
    [(PKPerformActionPassView *)self->_passView setHidden:v3];
    id v4 = [(PKPerformActionViewController *)self viewIfLoaded];
    [v4 setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPerformActionViewController;
  [(PKPerformActionViewController *)&v4 traitCollectionDidChange:a3];
  [(PKPerformActionViewController *)self updatePassViewVisibility];
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)shakeCard
{
}

- (void)setRightBarButtonEnabled:(BOOL)a3
{
  self->_fieldsVerified = a3;
  -[UIBarButtonItem setEnabled:](self->_button, "setEnabled:");
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PKPerformActionViewController *)self navigationItem];
  id v7 = v5;
  uint64_t v6 = 4;
  if (v3) {
    uint64_t v6 = 5;
  }
  [v5 setRightBarButtonItem:*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKPerformActionViewController__pass[v6])];
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(PKPaymentPassAction *)self->_action remoteContentConfiguration];
  if (v5 && (BOOL remoteContentFetched = self->_remoteContentFetched, v5, !remoteContentFetched))
  {
    self->_BOOL remoteContentFetched = 1;
    objc_initWeak(&location, self);
    webService = self->_webService;
    action = self->_action;
    pass = self->_pass;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__PKPerformActionViewController_preflightWithCompletion___block_invoke;
    v10[3] = &unk_1E59DDE00;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    [(PKPaymentWebService *)webService passActionWithRemoteContentPassAction:action forPass:pass completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

void __57__PKPerformActionViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PKPerformActionViewController_preflightWithCompletion___block_invoke_2;
  v10[3] = &unk_1E59CFAE0;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v14);
}

void __57__PKPerformActionViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  double v17 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6) {
      goto LABEL_23;
    }
    id v5 = *(void (**)(void))(v6 + 16);
    goto LABEL_7;
  }
  BOOL v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_storeStrong(WeakRetained + 131, v3);
    uint64_t v4 = *(void *)(a1 + 48);
    if (!v4) {
      goto LABEL_23;
    }
    id v5 = *(void (**)(void))(v4 + 16);
LABEL_7:
    v5();
    goto LABEL_23;
  }
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = [v7 domain];
    uint64_t v9 = *MEMORY[0x1E4F87C30];
    if ([v8 isEqualToString:*MEMORY[0x1E4F87C30]])
    {
      uint64_t v10 = [*(id *)(a1 + 40) code];

      if (v10 == 60091)
      {
        uint64_t v11 = *(void *)(a1 + 48);
        if (!v11) {
          goto LABEL_23;
        }
        uint64_t v12 = [v17 _generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:0];
        goto LABEL_22;
      }
    }
    else
    {
    }
    id v13 = *(void **)(a1 + 40);
    if (v13)
    {
      id v14 = [v13 domain];
      if ([v14 isEqualToString:v9])
      {
        uint64_t v15 = [*(id *)(a1 + 40) code];

        if (v15 == 60086)
        {
          uint64_t v11 = *(void *)(a1 + 48);
          if (!v11) {
            goto LABEL_23;
          }
          uint64_t v12 = [v17 _generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion:0];
          goto LABEL_22;
        }
      }
      else
      {
      }
    }
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (!v11) {
    goto LABEL_23;
  }
  uint64_t v12 = [v17 _generateGenericAlertWithCompletion:0];
LABEL_22:
  id v16 = (void *)v12;
  (*(void (**)(uint64_t, void, uint64_t))(v11 + 16))(v11, 0, v12);

LABEL_23:
}

- (void)_fetchRemoteContentIfNeeded
{
  BOOL v3 = [(PKPaymentPassAction *)self->_action remoteContentConfiguration];
  if (v3)
  {
    BOOL remoteContentFetched = self->_remoteContentFetched;

    if (!remoteContentFetched)
    {
      self->_BOOL remoteContentFetched = 1;
      [(PKPerformActionViewController *)self _showLoadingView:1];
      objc_initWeak(&location, self);
      webService = self->_webService;
      action = self->_action;
      pass = self->_pass;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke;
      v8[3] = &unk_1E59DDE28;
      objc_copyWeak(&v9, &location);
      [(PKPaymentWebService *)webService passActionWithRemoteContentPassAction:action forPass:pass completion:v8];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showLoadingView:0];
    id v5 = *(void **)(a1 + 32);
    if (!v5)
    {
      id v6 = *(void **)(a1 + 40);
      if (v6)
      {
        id v7 = [v6 domain];
        uint64_t v8 = *MEMORY[0x1E4F87C30];
        if ([v7 isEqualToString:*MEMORY[0x1E4F87C30]])
        {
          uint64_t v9 = [*(id *)(a1 + 40) code];

          if (v9 == 60091)
          {
            [v4 _showNoActionsAvailableDueToConflictErrorAlert];
            goto LABEL_15;
          }
        }
        else
        {
        }
        id v10 = *(void **)(a1 + 40);
        if (v10)
        {
          id v11 = [v10 domain];
          if ([v11 isEqualToString:v8])
          {
            uint64_t v12 = [*(id *)(a1 + 40) code];

            if (v12 == 60086)
            {
              [v4 _showNoActionsAvailableDueToRemoteActionFailureAlert];
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
      }
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke_3;
      v13[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v14, v2);
      [v4 _showGenericErrorAlert:v13];
      objc_destroyWeak(&v14);
      goto LABEL_15;
    }
    objc_storeStrong(v4 + 131, v5);
    [v4 _reloadActionView];
  }
LABEL_15:
}

void __60__PKPerformActionViewController__fetchRemoteContentIfNeeded__block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 performActionViewControllerDidCancel:v3];
}

- (void)_showLoadingView:(BOOL)a3
{
  loadingView = self->_loadingView;
  if (a3)
  {
    if (!loadingView)
    {
      id v5 = [PKPerformActionLoadingView alloc];
      [(PKPerformActionView *)self->_actionView frame];
      id v6 = -[PKPerformActionLoadingView initWithFrame:](v5, "initWithFrame:");
      id v7 = self->_loadingView;
      self->_loadingView = v6;
    }
    uint64_t v8 = [(PKPerformActionViewController *)self view];
    [v8 addSubview:self->_loadingView];

    [(PKPerformActionView *)self->_actionView setDelegate:0];
    [(PKPerformActionView *)self->_actionView removeFromSuperview];
    actionView = self->_actionView;
    self->_actionView = 0;
  }
  else
  {
    [(PKPerformActionLoadingView *)loadingView removeFromSuperview];
  }
}

- (void)_reloadActionView
{
  [(PKPerformActionView *)self->_actionView setDelegate:0];
  [(PKPerformActionView *)self->_actionView removeFromSuperview];
  id v3 = [(PKPerformActionViewController *)self _actionViewForPass:self->_pass action:self->_action];
  actionView = self->_actionView;
  self->_actionView = v3;

  [(PKPerformActionView *)self->_actionView setDelegate:self];
  id v5 = [(PKPerformActionViewController *)self view];
  [v5 insertSubview:self->_actionView belowSubview:self->_passView];
}

- (void)_rightBarButtonPressed:(id)a3
{
  id v4 = a3;
  if (self->_fieldsVerified)
  {
    if ([MEMORY[0x1E4F84A10] canMakePayments])
    {
      [(PKPerformActionViewController *)self setModalInPresentation:1];
      [(PKPerformActionViewController *)self setRightBarButtonEnabled:0];
      id v5 = [(PKPerformActionView *)self->_actionView amountTextField];
      [v5 resignFirstResponder];

      id v6 = [(PKPerformActionViewController *)self actionView];
      objc_initWeak(location, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke;
      v9[3] = &unk_1E59DDE78;
      id v7 = v6;
      id v10 = v7;
      objc_copyWeak(&v12, location);
      id v11 = self;
      [(PKPerformActionViewController *)self _canPerformPaymentWithCompletion:v9];
      objc_destroyWeak(&v12);

      objc_destroyWeak(location);
    }
    else
    {
      uint64_t v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_error_impl(&dword_19F450000, v8, OS_LOG_TYPE_ERROR, "Error: Device is unable to make in-app payments.", (uint8_t *)location, 2u);
      }

      [(PKPerformActionViewController *)self _showGenericErrorAlert:0];
    }
  }
}

void __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_2;
  v10[3] = &unk_1E59DDE50;
  objc_copyWeak(v13, (id *)(a1 + 48));
  int8x16_t v9 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  v13[1] = a3;
  id v8 = v5;
  id v12 = v8;
  [v6 fetchServiceProviderDataWithCompletion:v10];

  objc_destroyWeak(v13);
}

void __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_2(uint64_t a1, void *a2)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F84838]);
  id v7 = [*(id *)(*(void *)(a1 + 32) + 1048) actionDescription];
  [v6 setItemDescription:v7];

  [v6 setServiceProviderData:v4];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 1048) serviceProviderIdentifier];
  [v6 setServiceProviderIdentifier:v8];

  int8x16_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F84FF0]) initWithServiceProviderOrder:v6];
  id v10 = [*(id *)(a1 + 40) transactionCurrency];
  [v9 setCurrencyCode:v10];
  int8x16_t v11 = [*(id *)(*(void *)(a1 + 32) + 1048) serviceProviderAcceptedNetworks];
  [v9 setSupportedNetworks:v11];

  objc_msgSend(v9, "setMerchantCapabilities:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "serviceProviderCapabilities"));
  id v12 = [*(id *)(*(void *)(a1 + 32) + 1048) serviceProviderCountryCode];
  [v9 setCountryCode:v12];

  id v13 = [*(id *)(*(void *)(a1 + 32) + 1048) serviceProviderSupportedCountries];
  [v9 setSupportedCountries:v13];

  id v14 = [*(id *)(a1 + 40) transactionAmount];
  uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 1048) serviceProviderLocalizedDisplayName];
  id v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [*(id *)(*(void *)(a1 + 32) + 1040) organizationName];
  }
  v18 = v17;

  double v19 = [MEMORY[0x1E4F84CE0] summaryItemWithLabel:v18 amount:v14];
  v31[0] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  [v9 setPaymentSummaryItems:v20];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_3;
  aBlock[3] = &unk_1E59CA870;
  id v21 = v9;
  id v29 = v21;
  id v30 = WeakRetained;
  CGFloat v22 = _Block_copy(aBlock);
  double v23 = v22;
  if (*(void *)(a1 + 64) == 2)
  {
    double v24 = [MEMORY[0x1E4F84898] sharedInstance];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_2_87;
    v25[3] = &unk_1E59DA618;
    v25[4] = WeakRetained;
    id v27 = v23;
    id v26 = *(id *)(a1 + 48);
    [v24 canPresentPaymentRequest:v21 completion:v25];
  }
  else if (*(void *)(a1 + 48))
  {
    [WeakRetained setRightBarButtonEnabled:1];
    [WeakRetained presentViewController:*(void *)(a1 + 48) animated:1 completion:0];
  }
  else
  {
    (*((void (**)(void *))v22 + 2))(v22);
  }
}

void __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_3(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F84A10]) initWithPaymentRequest:*(void *)(a1 + 32)];
  [v2 setDelegate:*(void *)(a1 + 40)];
  [v2 _setPrivateDelegate:*(void *)(a1 + 40)];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_4;
  v3[3] = &unk_1E59CB6D8;
  v3[4] = *(void *)(a1 + 40);
  [v2 presentWithCompletion:v3];
}

void __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_4(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_5;
  block[3] = &unk_1E59CA7D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  if ((a2 & 1) == 0)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19F450000, v4, OS_LOG_TYPE_ERROR, "Error: Device failed to present payment coordinator!", buf, 2u);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_84;
    v6[3] = &unk_1E59CA7D0;
    v6[4] = *(void *)(a1 + 32);
    id v5 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRightBarButtonEnabled:1];
}

uint64_t __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_84(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showGenericErrorAlert:0];
}

void __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_2_87(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_3_88;
  v3[3] = &unk_1E59CD398;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __56__PKPerformActionViewController__rightBarButtonPressed___block_invoke_3_88(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldPresentPaymentRequest:*(void *)(a1 + 56)])
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v2();
  }
  else
  {
    [*(id *)(a1 + 32) setRightBarButtonEnabled:1];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 presentViewController:v5 animated:1 completion:0];
  }
}

- (void)_canPerformPaymentWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(PKPaymentPassAction *)self->_action type] == 5)
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      goto LABEL_15;
    }
    if ([(PKPaymentPassAction *)self->_action type] == 2)
    {
      id v5 = [(PKPaymentPass *)self->_pass uniqueID];
      uint64_t v6 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
      if (objc_opt_respondsToSelector())
      {
        paymentDataProvider = self->_paymentDataProvider;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke;
        v15[3] = &unk_1E59DA690;
        id v16 = v6;
        id v17 = self;
        id v18 = v4;
        [(PKPaymentDataProvider *)paymentDataProvider transitStateWithPassUniqueIdentifier:v5 paymentApplication:v16 completion:v15];
      }
      else
      {
        (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      }
    }
    else
    {
      id v13 = 0;
      uint64_t v14 = 0;
      char v8 = [(PKPaymentPass *)self->_pass canPerformAction:self->_action unableReason:&v14 displayableError:&v13];
      id v5 = v13;
      if (v8)
      {
        (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
LABEL_14:

        goto LABEL_15;
      }
      action = self->_action;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_2_103;
      v12[3] = &unk_1E59CA7D0;
      v12[4] = self;
      uint64_t v6 = +[PKPerformActionViewController alertControllerForUnableReason:v14 action:action displayableError:v5 addCardActionHandler:v12];
      if ([(PKPaymentPass *)self->_pass isTransitPass])
      {
        id v10 = [(id)objc_opt_class() displayableErrorForTransitAction:self->_action andReason:v14];
        int8x16_t v11 = MEMORY[0x1A6221F20]();
        [v6 setMessage:v11];
      }
      (*((void (**)(id, void *, uint64_t))v4 + 2))(v4, v6, v14);
    }

    goto LABEL_14;
  }
LABEL_15:
}

void __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_2;
  v8[3] = &unk_1E59CB728;
  id v9 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  if (v2
    && ([v2 transitPassPropertiesWithPaymentApplication:a1[5] pass:*(void *)(a1[6] + 1040)],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isEnRoute],
        v3,
        v4))
  {
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Device unable to make in-app payments while in transit.", buf, 2u);
    }

    uint64_t v6 = PKLocalizedPaymentString(&cfstr_CardInTransit.isa);
    id v7 = PKPassLocalizedStringWithFormat();
    char v8 = PKDisplayableErrorCustom();

    uint64_t v9 = a1[6];
    uint64_t v10 = *(void *)(v9 + 1048);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v13[2] = __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_101;
    v13[3] = &unk_1E59CA7D0;
    void v13[4] = v9;
    uint64_t v11 = +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", 5, v10, v8, v13, 0);
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    id v12 = *(void (**)(void))(a1[7] + 16);
    v12();
  }
}

void __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_101(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v2 = [v1[131] serviceProviderAcceptedNetworks];
  [v1 _presentPaymentSetupControllerWithAllowedPaymentNetworks:v2];
}

void __66__PKPerformActionViewController__canPerformPaymentWithCompletion___block_invoke_2_103(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v2 = [v1[131] serviceProviderAcceptedNetworks];
  [v1 _presentPaymentSetupControllerWithAllowedPaymentNetworks:v2];
}

- (id)_generateGenericAlertWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F84B50] displayableErrorForAction:self->_action andReason:1];
  uint64_t v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = [v5 localizedDescription];
  char v8 = [v5 localizedRecoverySuggestion];
  uint64_t v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v11 = PKLocalizedPaymentString(&cfstr_PassActionUnav.isa);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PKPerformActionViewController__generateGenericAlertWithCompletion___block_invoke;
  v15[3] = &unk_1E59CB150;
  id v16 = v4;
  id v12 = v4;
  id v13 = [v10 actionWithTitle:v11 style:1 handler:v15];
  [v9 addAction:v13];

  return v9;
}

uint64_t __69__PKPerformActionViewController__generateGenericAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_showGenericErrorAlert:(id)a3
{
  id v4 = [(PKPerformActionViewController *)self _generateGenericAlertWithCompletion:a3];
  [(PKPerformActionViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)_generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentPass *)self->_pass localizedDescription];
  uint64_t v6 = PKLocalizedPaymentString(&cfstr_PassActionUnav_7.isa);
  id v7 = PKLocalizedPaymentString(&cfstr_PassActionUnav_8.isa, &stru_1EF1B4C70.isa, v5);
  char v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  uint64_t v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = PKLocalizedPaymentString(&cfstr_PassActionUnav.isa);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104__PKPerformActionViewController__generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion___block_invoke;
  v14[3] = &unk_1E59CB150;
  id v15 = v4;
  id v11 = v4;
  id v12 = [v9 actionWithTitle:v10 style:1 handler:v14];
  [v8 addAction:v12];

  return v8;
}

uint64_t __104__PKPerformActionViewController__generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [(PKPaymentPass *)self->_pass devicePaymentApplications];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v23 + 1) + 8 * i) supportedTransitNetworkIdentifiers];
        if (v11) {
          [v5 addObjectsFromArray:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    id v12 = PKPassLocalizedStringWithFormat();
    id v13 = PKPassLocalizedStringWithFormat();
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1, 0);
    id v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = PKLocalizedPaymentString(&cfstr_PassActionUnav.isa);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __98__PKPerformActionViewController__generateNoActionsAvailableDueToConflictErrorAlertWithCompletion___block_invoke;
    v20[3] = &unk_1E59CB150;
    id v21 = v4;
    id v17 = [v15 actionWithTitle:v16 style:1 handler:v20];

    [v14 addAction:v17];
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "PKPerformActionViewController unable to find transit network identifiers for pass", buf, 2u);
    }

    uint64_t v14 = [(PKPerformActionViewController *)self _generateGenericAlertWithCompletion:v4];
  }

  return v14;
}

uint64_t __98__PKPerformActionViewController__generateNoActionsAvailableDueToConflictErrorAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_showNoActionsAvailableDueToRemoteActionFailureAlert
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __85__PKPerformActionViewController__showNoActionsAvailableDueToRemoteActionFailureAlert__block_invoke;
  uint64_t v8 = &unk_1E59CA7F8;
  objc_copyWeak(&v9, &location);
  id v3 = _Block_copy(&v5);
  id v4 = -[PKPerformActionViewController _generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion:](self, "_generateNoActionsAvailableDueToRemoteActionFailureAlertWithCompletion:", v3, v5, v6, v7, v8);
  [(PKPerformActionViewController *)self presentViewController:v4 animated:1 completion:0];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __85__PKPerformActionViewController__showNoActionsAvailableDueToRemoteActionFailureAlert__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 performActionViewControllerDidCancel:v3];
}

- (void)_showNoActionsAvailableDueToConflictErrorAlert
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __79__PKPerformActionViewController__showNoActionsAvailableDueToConflictErrorAlert__block_invoke;
  uint64_t v8 = &unk_1E59CA7F8;
  objc_copyWeak(&v9, &location);
  id v3 = _Block_copy(&v5);
  id v4 = -[PKPerformActionViewController _generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:](self, "_generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:", v3, v5, v6, v7, v8);
  [(PKPerformActionViewController *)self presentViewController:v4 animated:1 completion:0];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __79__PKPerformActionViewController__showNoActionsAvailableDueToConflictErrorAlert__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 performActionViewControllerDidCancel:v3];
}

- (void)_presentPaymentSetupControllerWithAllowedPaymentNetworks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v5];
  [v6 setAllowedPaymentNetworks:v4];
  [(PKPerformActionViewController *)self _showSpinner:1];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke;
  v8[3] = &unk_1E59CBA18;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [v7 preflightWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v8 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:*(void *)(a1 + 32) context:0];
      [(PKPaymentSetupNavigationController *)v8 setShowsWelcomeViewController:0];
      [(PKNavigationController *)v8 setCustomFormSheetPresentationStyleForiPad];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_2;
      v11[3] = &unk_1E59CAEA8;
      v11[4] = v7;
      id v12 = v8;
      id v9 = v8;
      [(PKPaymentSetupNavigationController *)v9 preflightWithCompletion:v11];
    }
    else
    {
      [WeakRetained _showSpinner:0];
      id v9 = [*(id *)(a1 + 32) alertForDisplayableError:v5];
      if (v9)
      {
        [v7 presentViewController:v9 animated:1 completion:0];
      }
      else
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_3;
        v10[3] = &unk_1E59CA7D0;
        void v10[4] = v7;
        [v7 _showGenericErrorAlert:v10];
      }
    }
  }
}

uint64_t __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _showSpinner:0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 presentViewController:v3 animated:1 completion:0];
}

void __90__PKPerformActionViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 performActionViewControllerDidCancel:*(void *)(a1 + 32)];
}

- (void)_presentAddAnotherCardFlowWithTransitNetworkIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v5];
  [v6 setRequiredTransitNetworkIdentifiers:v4];
  [(PKPerformActionViewController *)self _showSpinner:1];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke;
  v8[3] = &unk_1E59CBA18;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [v7 preflightWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v8 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:*(void *)(a1 + 32) context:0];
      [(PKPaymentSetupNavigationController *)v8 setShowsWelcomeViewController:0];
      [(PKNavigationController *)v8 setCustomFormSheetPresentationStyleForiPad];
      [(PKPaymentSetupNavigationController *)v8 setPaymentSetupMode:3];
      [(PKPaymentSetupNavigationController *)v8 setSetupDelegate:v7];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_2;
      v11[3] = &unk_1E59CAEA8;
      v11[4] = v7;
      id v12 = v8;
      id v9 = v8;
      [(PKPaymentSetupNavigationController *)v9 preflightWithCompletion:v11];
    }
    else
    {
      [WeakRetained _showSpinner:0];
      id v9 = [*(id *)(a1 + 32) alertForDisplayableError:v5];
      if (v9)
      {
        [v7 presentViewController:v9 animated:1 completion:0];
      }
      else
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_3;
        v10[3] = &unk_1E59CA7D0;
        void v10[4] = v7;
        [v7 _showGenericErrorAlert:v10];
      }
    }
  }
}

uint64_t __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _showSpinner:0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 presentViewController:v3 animated:1 completion:0];
}

void __89__PKPerformActionViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 performActionViewControllerDidCancel:*(void *)(a1 + 32)];
}

- (BOOL)_shouldPresentPaymentRequest:(int64_t)a3
{
  return ((unint64_t)a3 > 0xA) | (0x5Au >> a3) & 1;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v5 = (objc_class *)MEMORY[0x1E4F84A30];
  uint64_t v6 = (void (**)(id, id))a5;
  id v7 = objc_alloc_init(v5);
  [v7 setStatus:1];
  v6[2](v6, v7);
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__PKPerformActionViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [a3 dismissWithCompletion:v3];
}

void __74__PKPerformActionViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKPerformActionViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__PKPerformActionViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setModalInPresentation:0];
  id v2 = *(void **)(a1 + 32);
  if (v2[126])
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(*(void *)(a1 + 32) + 1056) willDismissViewController];
    }
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 performActionViewControllerDidPerformAction:*(void *)(a1 + 32)];
  }
  else
  {
    [v2 updateFirstResponder];
  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id v3 = [(PKPerformActionViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  uint64_t v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
{
  id v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)&self->_completedPurchase, a4);
    uint64_t v8 = (void (**)(id, void))a5;
    [(PKPerformActionView *)self->_actionView saveLastInputValues];
    v8[2](v8, 0);
  }
  else
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }
}

- (void)paymentSetupDidFinish:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained performActionViewControllerDidCancel:self];
}

- (void)_cancelButtonPressed:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    [(PKPerformActionView *)self->_actionView willDismissViewController];
  }
  id v4 = [(PKPerformActionViewController *)self delegate];
  [v4 performActionViewControllerDidCancel:self];
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (PKPerformActionView)actionView
{
  return self->_actionView;
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
}

- (PKPerformActionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPerformActionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_autoReloadSetupController, 0);
  objc_storeStrong((id *)&self->_completedPurchase, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);

  objc_storeStrong((id *)&self->_passView, 0);
}

@end