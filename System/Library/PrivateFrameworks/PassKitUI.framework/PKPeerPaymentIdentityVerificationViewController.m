@interface PKPeerPaymentIdentityVerificationViewController
- (BOOL)showCancelButton;
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (PKPeerPaymentIdentityVerificationViewController)initWithController:(id)a3 setupDelegate:(id)a4 visibleFieldIdentifiers:(id)a5;
- (PKPeerPaymentIdentityVerificationViewController)initWithController:(id)a3 visibleFieldIdentifiers:(id)a4;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (id)visibleFieldIdentifiers;
- (void)_handleCancelButtonTapped:(id)a3;
- (void)_showNavigationBarSpinner:(BOOL)a3;
- (void)_terminateFlow;
- (void)_updateNavigationBarItems;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)handleNextButtonTapped:(id)a3;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)setHeaderSubtitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setShowCancelButton:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PKPeerPaymentIdentityVerificationViewController

- (PKPeerPaymentIdentityVerificationViewController)initWithController:(id)a3 visibleFieldIdentifiers:(id)a4
{
  return [(PKPeerPaymentIdentityVerificationViewController *)self initWithController:a3 setupDelegate:0 visibleFieldIdentifiers:a4];
}

- (PKPeerPaymentIdentityVerificationViewController)initWithController:(id)a3 setupDelegate:(id)a4 visibleFieldIdentifiers:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = [v9 context];
  v13 = [v9 fieldsModel];
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentIdentityVerificationViewController;
  v14 = [(PKPaymentSetupFieldsViewController *)&v16 initWithWebService:0 context:v12 setupDelegate:v11 setupFieldsModel:v13];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_controller, a3);
    objc_storeStrong((id *)&v14->_visibleFieldIdentifiers, a5);
    v14->_showCancelButton = 1;
    [(PKPeerPaymentIdentityVerificationViewController *)v14 _updateNavigationBarItems];
  }

  return v14;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentIdentityVerificationViewController;
  [(PKPeerPaymentIdentityVerificationViewController *)&v4 viewDidDisappear:a3];
  if (([(PKPeerPaymentIdentityVerificationViewController *)self isBeingDismissed] & 1) != 0
    || [(PKPeerPaymentIdentityVerificationViewController *)self isMovingFromParentViewController])
  {
    [(PKPeerPaymentIdentityVerificationController *)self->_controller didDismissViewController];
  }
}

- (void)setShowCancelButton:(BOOL)a3
{
  if (self->_showCancelButton != a3)
  {
    self->_showCancelButton = a3;
    [(PKPeerPaymentIdentityVerificationViewController *)self _updateNavigationBarItems];
  }
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = a3;
  v5 = v4;
  switch(self->_identityVerificaionError)
  {
    case 2uLL:
      uint64_t v12 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);
      v13 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
      v6 = PKDisplayableErrorCustom();

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __84__PKPeerPaymentIdentityVerificationViewController_explanationViewDidSelectContinue___block_invoke_26;
      v20[3] = &unk_1E59CA7D0;
      v20[4] = self;
      id v8 = PKAlertForDisplayableErrorWithHandlers(v6, 0, v20, 0);
      v14 = [(PKPeerPaymentIdentityVerificationViewController *)self navigationController];
      [v14 presentViewController:v8 animated:1 completion:0];

      goto LABEL_7;
    case 3uLL:
      v15 = [v4 dockView];
      [v15 setButtonsEnabled:0];

      objc_super v16 = [v5 dockView];
      v17 = [v16 primaryButton];
      [v17 setShowSpinner:1];

      v18 = [v5 dockView];
      v19 = [v18 footerView];
      [v19 setButtonsEnabled:0];

      [(PKPeerPaymentIdentityVerificationViewController *)self handleNextButtonTapped:0];
      break;
    case 5uLL:
    case 6uLL:
      v6 = [(PKPeerPaymentIdentityVerificationController *)self->_controller webService];
      v7 = [v6 peerPaymentService];
      id v8 = [v7 account];

      id v9 = objc_alloc_init(MEMORY[0x1E4F848A0]);
      id v10 = [[PKPeerPaymentAccountResolutionController alloc] initWithAccount:v8 webService:v6 context:[(PKPaymentSetupTableViewController *)self context] delegate:self passLibraryDataProvider:v9];
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Presenting contact apple support alert...", buf, 2u);
      }

      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E70], 0);
      [(PKPeerPaymentAccountResolutionController *)v10 presentFlowForAccountResolution:3 configuration:0 completion:&__block_literal_global_248];

LABEL_7:
      break;
    default:
      [(PKPeerPaymentIdentityVerificationViewController *)self _terminateFlow];
      break;
  }
}

void __84__PKPeerPaymentIdentityVerificationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"NO";
    if (a2) {
      id v4 = @"YES";
    }
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Presented contact apple support alert with success %@", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t __84__PKPeerPaymentIdentityVerificationViewController_explanationViewDidSelectContinue___block_invoke_26(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCancelButtonTapped:0];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
}

- (id)visibleFieldIdentifiers
{
  return self->_visibleFieldIdentifiers;
}

- (void)handleNextButtonTapped:(id)a3
{
  id v4 = a3;
  [(PKPeerPaymentIdentityVerificationViewController *)self _showNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  controller = self->_controller;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke;
  v6[3] = &unk_1E59CB2D8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [(PKPeerPaymentIdentityVerificationController *)controller nextViewControllerWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_2;
    v13[3] = &unk_1E59CB2B0;
    v13[4] = *(void *)(a1 + 32);
    uint64_t v18 = a5;
    id v14 = v9;
    id v15 = WeakRetained;
    id v16 = v11;
    id v17 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v13);
  }
}

void __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _showNavigationBarSpinner:0];
  *(void *)(*(void *)(a1 + 32) + 1240) = *(void *)(a1 + 72);
  if (!*(void *)(a1 + 40))
  {
    if (*(void *)(a1 + 56))
    {
      id v4 = objc_msgSend(MEMORY[0x1E4F84D80], "displayableErrorForError:");
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_3;
      v18[3] = &unk_1E59CA7D0;
      v18[4] = *(void *)(a1 + 32);
      id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v18, 0);
      v6 = [*(id *)(a1 + 32) navigationController];
      [v6 presentViewController:v5 animated:1 completion:0];
    }
    else
    {
      id v7 = *(void **)(a1 + 64);
      if (v7)
      {
        id v8 = [v7 explanationView];
        [v8 setDelegate:*(void *)(a1 + 32)];

        v2 = [*(id *)(a1 + 32) navigationController];
        id v15 = v2;
        uint64_t v3 = *(void *)(a1 + 64);
        goto LABEL_3;
      }
      id v9 = *(void **)(a1 + 32);
      if (v9[155] != 1) {
        return;
      }
      id v4 = [v9 headerView];
      id v10 = [v4 checkmarkLayer];
      [v10 setRevealed:1 animated:0];

      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_0.isa);
      [v11 setHeaderViewTitle:v12 subtitle:&stru_1EF1B5B50];

      [v4 setNeedsLayout];
      [*(id *)(a1 + 32) _setNavigationBarEnabled:0 animated:1];
      [*(id *)(a1 + 32) _destroyNavigationBarButtonItemsAnimated:1];
      v13 = [*(id *)(a1 + 32) view];
      [v13 setUserInteractionEnabled:0];

      dispatch_time_t v14 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_4;
      block[3] = &unk_1E59CA7D0;
      id v17 = *(id *)(a1 + 48);
      dispatch_after(v14, MEMORY[0x1E4F14428], block);
    }
    return;
  }
  v2 = [*(id *)(a1 + 48) navigationController];
  id v15 = v2;
  uint64_t v3 = *(void *)(a1 + 40);
LABEL_3:
  [v2 pushViewController:v3 animated:1];
}

uint64_t __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCancelButtonTapped:0];
}

uint64_t __74__PKPeerPaymentIdentityVerificationViewController_handleNextButtonTapped___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateFlow];
}

- (id)defaultHeaderViewTitle
{
  return self->_headerTitle;
}

- (id)defaultHeaderViewSubTitle
{
  return self->_headerSubtitle;
}

- (void)_showNavigationBarSpinner:(BOOL)a3
{
  BOOL v4 = !a3;
  [(PKPaymentSetupFieldsViewController *)self _setNavigationBarEnabled:!a3 animated:1];
  if (v4)
  {
    id v7 = [(PKPeerPaymentIdentityVerificationViewController *)self navigationItem];
    [v7 setRightBarButtonItem:0];

    id v8 = [(PKPeerPaymentIdentityVerificationViewController *)self navigationItem];
    [v8 setLeftBarButtonItem:0];
  }
  else
  {
    id v8 = (id)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v8 startAnimating];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v8];
    v6 = [(PKPeerPaymentIdentityVerificationViewController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
}

- (void)_updateNavigationBarItems
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_showCancelButton)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__handleCancelButtonTapped_];
    [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
    if (v3)
    {
      v5[0] = v3;
      BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
      [(PKPaymentSetupFieldsViewController *)self _setLeftBarButtonItems:v4 animated:0];
    }
    else
    {
      [(PKPaymentSetupFieldsViewController *)self _setLeftBarButtonItems:0 animated:0];
    }
    [(PKPaymentSetupFieldsViewController *)self setHidesBackButton:1 animated:0];
  }
  else
  {
    [(PKPaymentSetupFieldsViewController *)self _setLeftBarButtonItems:0 animated:0];
    [(PKPaymentSetupFieldsViewController *)self setHidesBackButton:0 animated:0];
  }
}

- (void)_handleCancelButtonTapped:(id)a3
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E68], 0, a3);
  id v4 = [(PKPaymentSetupFieldsViewController *)self setupDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 viewControllerDidCancelSetupFlow:self];
  }
  else {
    [(PKPeerPaymentIdentityVerificationViewController *)self _terminateFlow];
  }
}

- (void)_terminateFlow
{
  uint64_t v3 = [(PKPaymentSetupFieldsViewController *)self setupDelegate];
  id v5 = v3;
  if (v3)
  {
    [v3 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v4 = [(PKPeerPaymentIdentityVerificationViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (void)setHeaderSubtitle:(id)a3
{
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_visibleFieldIdentifiers, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end