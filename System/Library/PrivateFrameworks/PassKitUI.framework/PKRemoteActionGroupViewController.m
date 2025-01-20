@interface PKRemoteActionGroupViewController
- (BOOL)_canSkipSecondaryScreen;
- (BOOL)_shouldPresentPaymentRequest:(int64_t)a3;
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (PKRemoteActionGroupViewController)initWithPass:(id)a3 actionGroup:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6;
- (PKRemoteActionGroupViewControllerDelegate)delegate;
- (id)_generateGenericAlertForError:(id)a3;
- (id)_generateGenericAlertForError:(id)a3 completion:(id)a4;
- (id)_generateNoActionsAvailableDueToConflictErrorAlert;
- (id)_generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:(id)a3;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)_canPerformPaymentWithCompletion:(id)a3;
- (void)_cancelButtonPressed:(id)a3;
- (void)_fetchRemoteContentIfNeeded;
- (void)_presentAddAnotherCardFlowWithTransitNetworkIdentifiers:(id)a3;
- (void)_presentPaymentSetupControllerWithAllowedPaymentNetworks:(id)a3;
- (void)_reloadActionGroupActionsView;
- (void)_rightBarButtonPressed:(id)a3;
- (void)_rightBarButtonPressedForOslo:(id)a3;
- (void)_rightBarButtonPressedForPerformAction:(id)a3;
- (void)_showGenericErrorAlert:(id)a3;
- (void)_showGenericErrorAlertForError:(id)a3 completion:(id)a4;
- (void)_showSpinner:(BOOL)a3;
- (void)fetchServiceProviderDataWithCompletion:(id)a3;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)paymentSetupDidFinish:(id)a3;
- (void)performActionViewControllerDidCancel:(id)a3;
- (void)performActionViewControllerDidPerformAction:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)selectActionGroupActionsViewDidSelectActionGroupAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRightBarButtonEnabled:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKRemoteActionGroupViewController

- (PKRemoteActionGroupViewController)initWithPass:(id)a3 actionGroup:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PKRemoteActionGroupViewController;
  v15 = [(PKRemoteActionGroupViewController *)&v27 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pass, a3);
    objc_storeStrong((id *)&v16->_actionGroup, a4);
    objc_storeStrong((id *)&v16->_paymentDataProvider, a5);
    objc_storeStrong((id *)&v16->_webService, a6);
    v17 = [(PKRemoteActionGroupViewController *)v16 navigationItem];
    id v18 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v18 configureWithTransparentBackground];
    v19 = PKProvisioningBackgroundColor();
    [v18 setBackgroundColor:v19];

    [v17 setStandardAppearance:v18];
    [v17 setScrollEdgeAppearance:v18];
    v20 = PKLocalizedPaymentString(&cfstr_SetupPurchaseA_0.isa);
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v20 style:2 target:v16 action:sel__rightBarButtonPressed_];
    button = v16->_button;
    v16->_button = (UIBarButtonItem *)v21;

    [(UIBarButtonItem *)v16->_button setEnabled:0];
    [v17 setRightBarButtonItem:v16->_button];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v23];
    spinner = v16->_spinner;
    v16->_spinner = (UIBarButtonItem *)v24;

    [v23 startAnimating];
  }

  return v16;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKRemoteActionGroupViewController;
  [(PKRemoteActionGroupViewController *)&v3 viewDidLoad];
  [(PKRemoteActionGroupViewController *)self _reloadActionGroupActionsView];
  [(PKRemoteActionGroupViewController *)self _fetchRemoteContentIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKRemoteActionGroupViewController;
  [(PKRemoteActionGroupViewController *)&v11 viewWillAppear:a3];
  v4 = [(PKRemoteActionGroupViewController *)self navigationController];
  v5 = [(PKRemoteActionGroupViewController *)self presentingViewController];
  if (v5)
  {
    v6 = v5;
    if (v4)
    {
      v7 = [v4 viewControllers];
      uint64_t v8 = [v7 count];

      if (v8 != 1) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    v9 = [(PKRemoteActionGroupViewController *)self navigationItem];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonPressed_];
    [v9 setLeftBarButtonItem:v10];
  }
LABEL_7:
}

- (void)_reloadActionGroupActionsView
{
  id v10 = [(PKRemoteActionGroupViewController *)self view];
  [(PKSelectActionGroupActionsView *)self->_actionGroupActionView removeFromSuperview];
  [(PKSelectActionGroupActionsView *)self->_actionGroupActionView setDelegate:0];
  actionGroupActionView = self->_actionGroupActionView;
  self->_actionGroupActionView = 0;

  v4 = [(PKPaymentPassActionGroup *)self->_actionGroup remoteContentConfiguration];
  if (v4) {
    BOOL v5 = !self->_remoteContentFetched;
  }
  else {
    BOOL v5 = 0;
  }

  v6 = [[PKSelectActionGroupActionsView alloc] initWithPass:self->_pass actionGroup:self->_actionGroup];
  v7 = self->_actionGroupActionView;
  self->_actionGroupActionView = v6;

  [(PKSelectActionGroupActionsView *)self->_actionGroupActionView setLoading:v5];
  uint64_t v8 = self->_actionGroupActionView;
  v9 = PKProvisioningBackgroundColor();
  [(PKSelectActionGroupActionsView *)v8 setBackgroundColor:v9];

  [(PKSelectActionGroupActionsView *)self->_actionGroupActionView setDelegate:self];
  [v10 addSubview:self->_actionGroupActionView];
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PKRemoteActionGroupViewController;
  [(PKRemoteActionGroupViewController *)&v15 viewWillLayoutSubviews];
  objc_super v3 = [(PKRemoteActionGroupViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  -[PKSelectActionGroupActionsView setFrame:](self->_actionGroupActionView, "setFrame:", v13 + v5 + 0.0, v7 + v12 + 0.0, v9 - (v13 + v14), v11 - (v12 + 0.0));
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PKRemoteActionGroupViewController *)self navigationItem];
  id v7 = v5;
  uint64_t v6 = 4;
  if (v3) {
    uint64_t v6 = 5;
  }
  [v5 setRightBarButtonItem:*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKRemoteActionGroupViewController__pass[v6])];
}

- (void)_rightBarButtonPressed:(id)a3
{
  id v4 = a3;
  if ([(PKRemoteActionGroupViewController *)self _canSkipSecondaryScreen]) {
    [(PKRemoteActionGroupViewController *)self _rightBarButtonPressedForOslo:v4];
  }
  else {
    [(PKRemoteActionGroupViewController *)self _rightBarButtonPressedForPerformAction:v4];
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(PKPaymentPassActionGroup *)self->_actionGroup remoteContentConfiguration];
  if (v5 && (BOOL remoteContentFetched = self->_remoteContentFetched, v5, !remoteContentFetched))
  {
    self->_BOOL remoteContentFetched = 1;
    objc_initWeak(&location, self);
    webService = self->_webService;
    actionGroup = self->_actionGroup;
    pass = self->_pass;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__PKRemoteActionGroupViewController_preflightWithCompletion___block_invoke;
    v10[3] = &unk_1E59DA5A0;
    objc_copyWeak(&v12, &location);
    v10[4] = self;
    id v11 = v4;
    [(PKPaymentWebService *)webService passActionGroupWithRemoteContentPassActionGroup:actionGroup forPass:pass completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

void __61__PKRemoteActionGroupViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKRemoteActionGroupViewController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CEF00;
  block[4] = WeakRetained;
  id v13 = v5;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v6;
  uint64_t v15 = v9;
  id v16 = v8;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __61__PKRemoteActionGroupViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1) {
    return;
  }
  BOOL v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_storeStrong((id *)(v1 + 984), v3);
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
    return;
  }
  id v6 = *(void **)(a1 + 48);
  if (!v6) {
    goto LABEL_13;
  }
  id v7 = [v6 domain];
  if (([v7 isEqualToString:*MEMORY[0x1E4F87C30]] & 1) == 0)
  {

    goto LABEL_13;
  }
  uint64_t v8 = [*(id *)(a1 + 48) code];

  if (v8 != 60091)
  {
LABEL_13:
    uint64_t v9 = *(void *)(a1 + 64);
    if (!v9) {
      return;
    }
    uint64_t v10 = [*(id *)(a1 + 56) _generateGenericAlertForError:*(void *)(a1 + 48)];
    goto LABEL_15;
  }
  uint64_t v9 = *(void *)(a1 + 64);
  if (!v9) {
    return;
  }
  uint64_t v10 = [*(id *)(a1 + 56) _generateNoActionsAvailableDueToConflictErrorAlert];
LABEL_15:
  id v11 = (id)v10;
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 16))(v9, 0, v10);
}

- (id)_generateGenericAlertForError:(id)a3
{
  return [(PKRemoteActionGroupViewController *)self _generateGenericAlertForError:a3 completion:0];
}

- (id)_generateGenericAlertForError:(id)a3 completion:(id)a4
{
  id v4 = a4;
  id v5 = (void *)MEMORY[0x1E4FB1418];
  id v6 = PKLocalizedPaymentString(&cfstr_PassActionUnav_0.isa);
  id v7 = PKLocalizedPaymentString(&cfstr_PassActionUnav_1.isa);
  uint64_t v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  uint64_t v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = PKLocalizedPaymentString(&cfstr_PassActionUnav.isa);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__PKRemoteActionGroupViewController__generateGenericAlertForError_completion___block_invoke;
  v14[3] = &unk_1E59CB150;
  id v15 = v4;
  id v11 = v4;
  id v12 = [v9 actionWithTitle:v10 style:1 handler:v14];
  [v8 addAction:v12];

  return v8;
}

uint64_t __78__PKRemoteActionGroupViewController__generateGenericAlertForError_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_showGenericErrorAlertForError:(id)a3 completion:(id)a4
{
  id v5 = [(PKRemoteActionGroupViewController *)self _generateGenericAlertForError:a3 completion:a4];
  [(PKRemoteActionGroupViewController *)self presentViewController:v5 animated:1 completion:0];
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
  id v6 = [(PKPaymentPass *)self->_pass devicePaymentApplications];
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
    id v14 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1, 0);
    id v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = PKLocalizedPaymentString(&cfstr_PassActionUnav.isa);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __102__PKRemoteActionGroupViewController__generateNoActionsAvailableDueToConflictErrorAlertWithCompletion___block_invoke;
    v20[3] = &unk_1E59CB150;
    id v21 = v4;
    v17 = [v15 actionWithTitle:v16 style:1 handler:v20];

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

    id v14 = [(PKRemoteActionGroupViewController *)self _generateGenericAlertForError:0 completion:v4];
  }

  return v14;
}

uint64_t __102__PKRemoteActionGroupViewController__generateNoActionsAvailableDueToConflictErrorAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_generateNoActionsAvailableDueToConflictErrorAlert
{
  return [(PKRemoteActionGroupViewController *)self _generateNoActionsAvailableDueToConflictErrorAlertWithCompletion:0];
}

- (void)_fetchRemoteContentIfNeeded
{
  BOOL v3 = [(PKPaymentPassActionGroup *)self->_actionGroup remoteContentConfiguration];
  if (v3)
  {
    BOOL remoteContentFetched = self->_remoteContentFetched;

    if (!remoteContentFetched)
    {
      self->_BOOL remoteContentFetched = 1;
      [(PKSelectActionGroupActionsView *)self->_actionGroupActionView setLoading:1];
      objc_initWeak(&location, self);
      webService = self->_webService;
      actionGroup = self->_actionGroup;
      pass = self->_pass;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke;
      v8[3] = &unk_1E59DA5C8;
      objc_copyWeak(&v9, &location);
      [(PKPaymentWebService *)webService passActionGroupWithRemoteContentPassActionGroup:actionGroup forPass:pass completion:v8];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke_2;
    block[3] = &unk_1E59CC220;
    block[4] = WeakRetained;
    id v8 = v3;
    objc_copyWeak(&v9, v4);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v9);
  }
}

void __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 992) setLoading:0];
  id v3 = *(id **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_storeStrong(v3 + 123, v2);
    id v4 = *(void **)(a1 + 32);
    [v4 _reloadActionGroupActionsView];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke_3;
    v5[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v6, (id *)(a1 + 48));
    [v3 _showGenericErrorAlert:v5];
    objc_destroyWeak(&v6);
  }
}

void __64__PKRemoteActionGroupViewController__fetchRemoteContentIfNeeded__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 remoteGroupActionsViewControllerDidCancel:v3];
}

- (void)fetchServiceProviderDataWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentPassAction *)self->_selectedAction type];
  if (v5 == 5)
  {
    id v12 = [(PKPaymentPassAction *)self->_selectedAction purchaseNewActionItems];
    id v13 = [v12 firstObject];

    id v14 = [(PKPaymentPass *)self->_pass secureElementPass];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__PKRemoteActionGroupViewController_fetchServiceProviderDataWithCompletion___block_invoke_2;
    v15[3] = &unk_1E59DA5F0;
    id v16 = v13;
    id v17 = v4;
    id v8 = v13;
    [v8 serviceProviderDataWithItemForPass:v14 completion:v15];
  }
  else
  {
    if (v5 != 2)
    {
      (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
      goto LABEL_7;
    }
    id v6 = [(PKPaymentPassAction *)self->_selectedAction selectedActionItems];
    uint64_t v7 = [v6 firstObject];

    id v8 = [MEMORY[0x1E4F84720] passPropertiesForPass:self->_pass];
    id v9 = [v8 balance];
    uint64_t v10 = [(PKPaymentPass *)self->_pass secureElementPass];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__PKRemoteActionGroupViewController_fetchServiceProviderDataWithCompletion___block_invoke;
    v18[3] = &unk_1E59DA5F0;
    id v19 = v7;
    id v20 = v4;
    id v11 = v7;
    [v11 serviceProviderDataWithPass:v10 currentLocalBalance:v9 completion:v18];
  }
LABEL_7:
}

void __76__PKRemoteActionGroupViewController_fetchServiceProviderDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  id v7 = [v4 currency];
  id v6 = [*(id *)(a1 + 32) amount];
  (*(void (**)(uint64_t, id, id, void *))(v3 + 16))(v3, v5, v7, v6);
}

void __76__PKRemoteActionGroupViewController_fetchServiceProviderDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  id v7 = [v4 currency];
  id v6 = [*(id *)(a1 + 32) amount];
  (*(void (**)(uint64_t, id, id, void *))(v3 + 16))(v3, v5, v7, v6);
}

- (void)_rightBarButtonPressedForPerformAction:(id)a3
{
  id v8 = 0;
  uint64_t v9 = 0;
  char v4 = [(PKPaymentPass *)self->_pass canPerformAction:self->_selectedAction unableReason:&v9 displayableError:&v8];
  id v5 = v8;
  if ((v4 & 1) != 0 || v9 == 2)
  {
    id v6 = [[PKPerformActionViewController alloc] initWithPass:self->_pass action:self->_selectedAction paymentDataProvider:self->_paymentDataProvider];
    [(PKPerformActionViewController *)v6 setDelegate:self];
    [(PKPerformActionViewController *)v6 setWebService:self->_webService];
    id v7 = [[PKNavigationController alloc] initWithRootViewController:v6];
    [(PKNavigationController *)v7 setSupportedInterfaceOrientations:2];
    [(PKRemoteActionGroupViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    id v6 = +[PKPerformActionViewController alertControllerForUnableReason:v9 action:self->_selectedAction displayableError:v5 addCardActionHandler:0];
    [(PKRemoteActionGroupViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

- (void)_rightBarButtonPressedForOslo:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F84A10] canMakePayments])
  {
    [(PKRemoteActionGroupViewController *)self setRightBarButtonEnabled:0];
    objc_initWeak(location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke;
    v6[3] = &unk_1E59DA668;
    v6[4] = self;
    objc_copyWeak(&v7, location);
    [(PKRemoteActionGroupViewController *)self _canPerformPaymentWithCompletion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(location);
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_19F450000, v5, OS_LOG_TYPE_ERROR, "Error: Device is unable to make in-app payments.", (uint8_t *)location, 2u);
    }

    [(PKRemoteActionGroupViewController *)self _showGenericErrorAlert:0];
  }
}

void __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_2;
  v8[3] = &unk_1E59DA640;
  objc_copyWeak(v10, (id *)(a1 + 40));
  void v8[4] = *(void *)(a1 + 32);
  v10[1] = a3;
  id v7 = v5;
  id v9 = v7;
  [v6 fetchServiceProviderDataWithCompletion:v8];

  objc_destroyWeak(v10);
}

void __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = (id *)(a1 + 48);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  id v12 = objc_alloc_init(MEMORY[0x1E4F84838]);
  id v13 = [*(id *)(*(void *)(a1 + 32) + 1000) actionDescription];
  [v12 setItemDescription:v13];

  [v12 setServiceProviderData:v10];
  id v14 = [*(id *)(*(void *)(a1 + 32) + 1000) serviceProviderIdentifier];
  [v12 setServiceProviderIdentifier:v14];

  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F84FF0]) initWithServiceProviderOrder:v12];
  [v15 setCurrencyCode:v9];

  id v16 = [*(id *)(*(void *)(a1 + 32) + 1000) serviceProviderAcceptedNetworks];
  [v15 setSupportedNetworks:v16];

  objc_msgSend(v15, "setMerchantCapabilities:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "serviceProviderCapabilities"));
  id v17 = [*(id *)(*(void *)(a1 + 32) + 1000) serviceProviderCountryCode];
  [v15 setCountryCode:v17];

  id v18 = [*(id *)(*(void *)(a1 + 32) + 1000) serviceProviderSupportedCountries];
  [v15 setSupportedCountries:v18];

  id v19 = [*(id *)(*(void *)(a1 + 32) + 1000) serviceProviderLocalizedDisplayName];
  id v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [*(id *)(*(void *)(a1 + 32) + 976) organizationName];
  }
  v22 = v21;

  long long v23 = [MEMORY[0x1E4F84CE0] summaryItemWithLabel:v22 amount:v8];

  v39[0] = v23;
  long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  [v15 setPaymentSummaryItems:v24];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_3;
  aBlock[3] = &unk_1E59CA870;
  id v25 = v15;
  id v37 = v25;
  id v38 = WeakRetained;
  long long v26 = _Block_copy(aBlock);
  objc_super v27 = v26;
  if (*(void *)(a1 + 56) == 2)
  {
    uint64_t v28 = [MEMORY[0x1E4F84898] sharedInstance];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_2_71;
    v33[3] = &unk_1E59DA618;
    v33[4] = WeakRetained;
    id v35 = v27;
    id v34 = *(id *)(a1 + 40);
    [v28 canPresentPaymentRequest:v25 completion:v33];

    v29 = v35;
  }
  else
  {
    v30 = *(void **)(a1 + 40);
    if (!v30)
    {
      (*((void (**)(void *))v26 + 2))(v26);
      goto LABEL_9;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_4_74;
    block[3] = &unk_1E59CA870;
    block[4] = WeakRetained;
    id v32 = v30;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v29 = v32;
  }

LABEL_9:
}

void __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_3(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F84A10]) initWithPaymentRequest:*(void *)(a1 + 32)];
  [v2 setDelegate:*(void *)(a1 + 40)];
  [v2 _setPrivateDelegate:*(void *)(a1 + 40)];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_4;
  v3[3] = &unk_1E59CB6D8;
  v3[4] = *(void *)(a1 + 40);
  [v2 presentWithCompletion:v3];
}

void __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_4(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_5;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
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
    v6[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_68;
    v6[3] = &unk_1E59CA7D0;
    v6[4] = *(void *)(a1 + 32);
    id v5 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRightBarButtonEnabled:1];
}

uint64_t __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showGenericErrorAlert:0];
}

void __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_2_71(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_3_72;
  v3[3] = &unk_1E59CD398;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_3_72(uint64_t a1)
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

uint64_t __67__PKRemoteActionGroupViewController__rightBarButtonPressedForOslo___block_invoke_4_74(uint64_t a1)
{
  [*(id *)(a1 + 32) setRightBarButtonEnabled:1];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 presentViewController:v3 animated:1 completion:0];
}

- (void)_canPerformPaymentWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(PKPaymentPassAction *)self->_selectedAction type] == 5)
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      goto LABEL_15;
    }
    if ([(PKPaymentPassAction *)self->_selectedAction type] == 2)
    {
      id v5 = [(PKPaymentPass *)self->_pass uniqueID];
      uint64_t v6 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
      if (objc_opt_respondsToSelector())
      {
        paymentDataProvider = self->_paymentDataProvider;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke;
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
      char v8 = [(PKPaymentPass *)self->_pass canPerformAction:self->_selectedAction unableReason:&v14 displayableError:&v13];
      id v5 = v13;
      if (v8)
      {
        (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
LABEL_14:

        goto LABEL_15;
      }
      selectedAction = self->_selectedAction;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_2_87;
      v12[3] = &unk_1E59CA7D0;
      v12[4] = self;
      uint64_t v6 = +[PKPerformActionViewController alertControllerForUnableReason:v14 action:selectedAction displayableError:v5 addCardActionHandler:v12];
      if ([(PKPaymentPass *)self->_pass isTransitPass])
      {
        id v10 = [(id)objc_opt_class() displayableErrorForTransitAction:self->_selectedAction andReason:v14];
        id v11 = MEMORY[0x1A6221F20]();
        [v6 setMessage:v11];
      }
      (*((void (**)(id, void *, uint64_t))v4 + 2))(v4, v6, v14);
    }

    goto LABEL_14;
  }
LABEL_15:
}

void __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_2;
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

void __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  if (v2
    && ([v2 transitPassPropertiesWithPaymentApplication:a1[5] pass:*(void *)(a1[6] + 976)],
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
    uint64_t v10 = *(void *)(v9 + 1000);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_85;
    v13[3] = &unk_1E59CA7D0;
    v13[4] = v9;
    uint64_t v11 = +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", 5, v10, v8, v13, 0);
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    id v12 = *(void (**)(void))(a1[7] + 16);
    v12();
  }
}

void __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_85(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  id v2 = [v1[125] serviceProviderAcceptedNetworks];
  [v1 _presentPaymentSetupControllerWithAllowedPaymentNetworks:v2];
}

void __70__PKRemoteActionGroupViewController__canPerformPaymentWithCompletion___block_invoke_2_87(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  id v2 = [v1[125] serviceProviderAcceptedNetworks];
  [v1 _presentPaymentSetupControllerWithAllowedPaymentNetworks:v2];
}

- (void)_presentPaymentSetupControllerWithAllowedPaymentNetworks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v5];
  [v6 setAllowedPaymentNetworks:v4];
  [(PKRemoteActionGroupViewController *)self _showSpinner:1];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke;
  v8[3] = &unk_1E59CBA18;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [v7 preflightWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      char v8 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:*(void *)(a1 + 32) context:0];
      [(PKPaymentSetupNavigationController *)v8 setShowsWelcomeViewController:0];
      [(PKNavigationController *)v8 setCustomFormSheetPresentationStyleForiPad];
      objc_initWeak(&location, v7);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_2;
      v11[3] = &unk_1E59CB268;
      objc_copyWeak(&v13, &location);
      id v9 = v8;
      id v12 = v9;
      [(PKPaymentSetupNavigationController *)v9 preflightWithCompletion:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
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
        id v10[2] = __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_3;
        v10[3] = &unk_1E59CA7D0;
        v10[4] = v7;
        [v7 _showGenericErrorAlert:v10];
      }
    }
  }
}

void __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _showSpinner:0];
    [v3 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
    id WeakRetained = v3;
  }
}

uint64_t __94__PKRemoteActionGroupViewController__presentPaymentSetupControllerWithAllowedPaymentNetworks___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_presentAddAnotherCardFlowWithTransitNetworkIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v5];
  [v6 setRequiredTransitNetworkIdentifiers:v4];
  [(PKRemoteActionGroupViewController *)self _showSpinner:1];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke;
  v8[3] = &unk_1E59CBA18;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [v7 preflightWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      char v8 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:*(void *)(a1 + 32) context:0];
      [(PKPaymentSetupNavigationController *)v8 setShowsWelcomeViewController:0];
      [(PKNavigationController *)v8 setCustomFormSheetPresentationStyleForiPad];
      [(PKPaymentSetupNavigationController *)v8 setPaymentSetupMode:3];
      [(PKPaymentSetupNavigationController *)v8 setSetupDelegate:v7];
      objc_initWeak(&location, v7);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_2;
      v11[3] = &unk_1E59CB268;
      objc_copyWeak(&v13, &location);
      id v9 = v8;
      id v12 = v9;
      [(PKPaymentSetupNavigationController *)v9 preflightWithCompletion:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
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
        id v10[2] = __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_3;
        v10[3] = &unk_1E59CA7D0;
        v10[4] = v7;
        [v7 _showGenericErrorAlert:v10];
      }
    }
  }
}

void __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _showSpinner:0];
    [v3 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
    id WeakRetained = v3;
  }
}

uint64_t __93__PKRemoteActionGroupViewController__presentAddAnotherCardFlowWithTransitNetworkIdentifiers___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)_shouldPresentPaymentRequest:(int64_t)a3
{
  return ((unint64_t)a3 > 0xA) | (0x5Au >> a3) & 1;
}

- (BOOL)_canSkipSecondaryScreen
{
  uint64_t v3 = [(PKPaymentPassAction *)self->_selectedAction type];
  if (v3 == 5)
  {
    id v4 = [(PKPaymentPassAction *)self->_selectedAction purchaseNewActionItems];
  }
  else
  {
    if (v3 != 2) {
      return 0;
    }
    id v4 = [(PKPaymentPassAction *)self->_selectedAction selectedActionItems];
  }
  id v5 = v4;
  BOOL v6 = [v4 count] == 1;

  return v6;
}

- (void)_showGenericErrorAlert:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB1418];
  BOOL v6 = PKLocalizedPaymentString(&cfstr_PassActionUnav_0.isa);
  id v7 = PKLocalizedPaymentString(&cfstr_PassActionUnav_1.isa);
  char v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  id v10 = PKLocalizedPaymentString(&cfstr_PassActionUnav.isa);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PKRemoteActionGroupViewController__showGenericErrorAlert___block_invoke;
  v13[3] = &unk_1E59CB150;
  id v14 = v4;
  id v11 = v4;
  id v12 = [v9 actionWithTitle:v10 style:1 handler:v13];
  [v8 addAction:v12];

  [(PKRemoteActionGroupViewController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __60__PKRemoteActionGroupViewController__showGenericErrorAlert___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  [a3 setDelegate:0];
  id v4 = [(PKRemoteActionGroupViewController *)self delegate];
  [v4 remoteGroupActionsViewControllerDidCancel:self];
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  [a3 setDelegate:0];
  id v4 = [(PKRemoteActionGroupViewController *)self delegate];
  [v4 remoteGroupActionsViewControllerDidPerformFetchActionGroup:self];
}

- (void)selectActionGroupActionsViewDidSelectActionGroupAction:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_selectedAction, a3);
  if ([(PKRemoteActionGroupViewController *)self _canSkipSecondaryScreen]) {
    [(PKPaymentPassAction *)self->_selectedAction confirmationTitle];
  }
  else {
  id v5 = PKLocalizedPaymentString(&cfstr_Next.isa);
  }
  BOOL v6 = [(PKRemoteActionGroupViewController *)self navigationItem];
  id v7 = [v6 rightBarButtonItem];
  [v7 setTitle:v5];
}

- (void)_cancelButtonPressed:(id)a3
{
  id v4 = [(PKRemoteActionGroupViewController *)self delegate];
  [v4 remoteGroupActionsViewControllerDidCancel:self];
}

- (void)setRightBarButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKRemoteActionGroupViewController *)self navigationItem];
  id v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v5 = (objc_class *)MEMORY[0x1E4F84A30];
  BOOL v6 = (void (**)(id, id))a5;
  id v7 = objc_alloc_init(v5);
  [v7 setStatus:1];
  v6[2](v6, v7);
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__PKRemoteActionGroupViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [a3 dismissWithCompletion:v3];
}

void __78__PKRemoteActionGroupViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKRemoteActionGroupViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__PKRemoteActionGroupViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteGroupActionsViewControllerDidPerformPayment:*(void *)(a1 + 32)];
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  BOOL v3 = [(PKRemoteActionGroupViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  BOOL v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
{
  (*((void (**)(id, BOOL))a5 + 2))(a5, a4 == 0);
}

- (void)paymentSetupDidFinish:(id)a3
{
}

- (PKRemoteActionGroupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKRemoteActionGroupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_actionGroupActionView, 0);
  objc_storeStrong((id *)&self->_actionGroup, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end