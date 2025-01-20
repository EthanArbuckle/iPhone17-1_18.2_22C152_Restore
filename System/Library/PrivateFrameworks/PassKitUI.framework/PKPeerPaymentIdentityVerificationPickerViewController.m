@interface PKPeerPaymentIdentityVerificationPickerViewController
- (BOOL)isComplete;
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (PKPaymentSetupViewControllerDelegate)delegate;
- (PKPeerPaymentIdentityVerificationPickerViewController)initWithController:(id)a3 pickerField:(id)a4 footerText:(id)a5;
- (PKPeerPaymentIdentityVerificationPickerViewController)initWithController:(id)a3 setupDelegate:(id)a4 pickerField:(id)a5 footerText:(id)a6;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)headerView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleCancelButtonTapped:(id)a3;
- (void)_handleError:(id)a3;
- (void)_handleNextButtonTapped:(id)a3;
- (void)_processNextViewController;
- (void)_setIdleTimerDisabled:(BOOL)a3 title:(id)a4 subtitle:(id)a5;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)_setRightBarButtonItemsEnabled:(BOOL)a3;
- (void)_setTableViewHeaderActivitySpinnerAnimated:(BOOL)a3 title:(id)a4 subtitle:(id)a5;
- (void)_terminateFlow;
- (void)_updateNavigationItemAnimated:(BOOL)a3;
- (void)_updateRightBarButtonState;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)hideActivitySpinner;
- (void)hideActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setHeaderSubtitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4;
- (void)showActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPeerPaymentIdentityVerificationPickerViewController

- (PKPeerPaymentIdentityVerificationPickerViewController)initWithController:(id)a3 pickerField:(id)a4 footerText:(id)a5
{
  return [(PKPeerPaymentIdentityVerificationPickerViewController *)self initWithController:a3 setupDelegate:0 pickerField:a4 footerText:a5];
}

- (PKPeerPaymentIdentityVerificationPickerViewController)initWithController:(id)a3 setupDelegate:(id)a4 pickerField:(id)a5 footerText:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PKPeerPaymentIdentityVerificationPickerViewController;
  v15 = -[PKPaymentSetupTableViewController initWithContext:](&v25, sel_initWithContext_, [v11 context]);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_controller, a3);
    objc_storeStrong((id *)&v16->_pickerField, a5);
    objc_storeStrong((id *)&v16->_footerText, a6);
    objc_storeWeak((id *)&v16->_delegate, v12);
    v16->_navigationEnabled = 1;
    v16->_rightBarButtonItemsEnabled = 0;
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v16 action:sel__handleCancelButtonTapped_];
    v18 = (void *)v17;
    if (v17)
    {
      v27[0] = v17;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    }
    else
    {
      v19 = 0;
    }
    objc_storeStrong((id *)&v16->_leftBarButtonItems, v19);
    if (v18) {

    }
    id v20 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v21 = PKLocalizedPaymentString(&cfstr_Next.isa);
    v22 = (void *)[v20 initWithTitle:v21 style:2 target:v16 action:sel__handleNextButtonTapped_];

    [v22 setEnabled:v16->_rightBarButtonItemsEnabled];
    if (v22)
    {
      v26 = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    }
    else
    {
      v23 = 0;
    }
    objc_storeStrong((id *)&v16->_rightBarButtonItems, v23);
    if (v22) {

    }
    [(PKPeerPaymentIdentityVerificationPickerViewController *)v16 _updateNavigationItemAnimated:0];
  }

  return v16;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentIdentityVerificationPickerViewController;
  [(PKPeerPaymentIdentityVerificationPickerViewController *)&v6 viewDidLoad];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPeerPaymentIdentityVerificationPickerViewControllerCellIdentifier"];

  v4 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self headerView];
  v5 = [(PKPaymentSetupTableViewController *)self tableView];
  [v5 setTableHeaderView:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentIdentityVerificationPickerViewController;
  [(PKPaymentSetupTableViewController *)&v4 viewWillAppear:a3];
  [(PKPeerPaymentIdentityVerificationPickerViewController *)self _setRightBarButtonItemsEnabled:[(PKPeerPaymentIdentityVerificationPickerViewController *)self isComplete]];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentIdentityVerificationPickerViewController;
  [(PKPeerPaymentIdentityVerificationPickerViewController *)&v6 viewDidLayoutSubviews];
  v3 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self headerView];
  [v3 sizeToFit];

  objc_super v4 = [(PKPaymentSetupTableViewController *)self tableView];
  v5 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self headerView];
  [v5 bounds];
  [v4 _tableHeaderHeightDidChangeToHeight:CGRectGetHeight(v7)];
}

- (BOOL)isComplete
{
  v2 = [(PKPaymentSetupTableViewController *)self selectedIndexPath];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(PKPaymentSetupFieldPicker *)self->_pickerField pickerItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  CGRect v7 = [a3 dequeueReusableCellWithIdentifier:@"PKPeerPaymentIdentityVerificationPickerViewControllerCellIdentifier" forIndexPath:v6];
  v8 = [(PKPaymentSetupFieldPicker *)self->_pickerField pickerItems];
  v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));

  v10 = [v7 textLabel];
  id v11 = [v9 localizedDisplayName];
  [v10 setText:v11];

  id v12 = [(PKPaymentSetupTableViewController *)self selectedIndexPath];
  LODWORD(v10) = [v12 isEqual:v6];

  if (v10) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  [v7 setAccessoryType:v13];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PKPaymentSetupTableViewController *)self selectedIndexPath];
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentIdentityVerificationPickerViewController;
  [(PKPaymentSetupTableViewController *)&v15 tableView:v7 didSelectRowAtIndexPath:v6];
  [v7 deselectRowAtIndexPath:v6 animated:1];

  v9 = [v7 cellForRowAtIndexPath:v8];
  [v9 setAccessoryType:0];
  v10 = [(PKPaymentSetupTableViewController *)self selectedIndexPath];
  id v11 = [v7 cellForRowAtIndexPath:v10];

  [v11 setAccessoryType:3];
  id v12 = [(PKPaymentSetupFieldPicker *)self->_pickerField pickerItems];
  uint64_t v13 = [(PKPaymentSetupTableViewController *)self selectedIndexPath];
  id v14 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v13, "row"));

  [(PKPaymentSetupFieldPicker *)self->_pickerField setCurrentValue:v14];
  [(PKPeerPaymentIdentityVerificationPickerViewController *)self _setRightBarButtonItemsEnabled:[(PKPeerPaymentIdentityVerificationPickerViewController *)self isComplete]];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return self->_footerText;
}

- (void)showActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4
{
}

- (void)hideActivitySpinner
{
}

- (void)hideActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4
{
}

- (void)_setTableViewHeaderActivitySpinnerAnimated:(BOOL)a3 title:(id)a4 subtitle:(id)a5
{
  BOOL v6 = a3;
  BOOL v8 = !a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self view];
  [v11 setUserInteractionEnabled:v8];

  [(PKPeerPaymentIdentityVerificationPickerViewController *)self _setNavigationBarEnabled:v8];
  id v14 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self headerView];
  id v12 = [v14 activityIndicator];
  uint64_t v13 = v12;
  if (v8)
  {
    [v12 stopAnimating];
  }
  else if (([v12 isAnimating] & 1) == 0)
  {
    [v13 startAnimating];
  }
  [v14 setNeedsLayout];
  [(PKPeerPaymentIdentityVerificationPickerViewController *)self setHeaderViewTitle:v10 subtitle:v9];
  [(PKPeerPaymentIdentityVerificationPickerViewController *)self _setIdleTimerDisabled:v6 title:v10 subtitle:v9];
}

- (id)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    objc_super v4 = [PKTableHeaderView alloc];
    int64_t v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v6 = self->_headerView;
    self->_headerView = v5;

    id v7 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];

    id v9 = self->_headerView;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(PKPaymentSetupTableViewController *)self context];
      uint64_t IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    }
    else
    {
      uint64_t IsSetupAssistant = 0;
    }
    [(PKTableHeaderView *)v9 setStyle:IsSetupAssistant];
    id v11 = [(PKTableHeaderView *)self->_headerView titleLabel];
    [v11 setText:self->_headerTitle];

    id v12 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
    [v12 setText:self->_headerSubtitle];

    uint64_t v13 = self->_headerView;
    id v14 = [(PKPaymentSetupTableViewController *)self tableView];
    [v14 bounds];
    -[PKTableHeaderView sizeThatFits:](v13, "sizeThatFits:", CGRectGetWidth(v21), 3.40282347e38);
    double v16 = v15;
    double v18 = v17;

    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v16, v18);
    headerView = self->_headerView;
  }

  return headerView;
}

- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4
{
  id v18 = a4;
  BOOL v6 = (NSString *)a3;
  id v7 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self headerView];
  headerTitle = v6;
  if (!v6) {
    headerTitle = self->_headerTitle;
  }
  id v9 = headerTitle;

  id v10 = [v7 titleLabel];
  [v10 setText:v9];

  if (v18)
  {
    id v11 = [v7 subtitleLabel];
    [v11 setText:v18];
  }
  id v12 = [(PKPaymentSetupTableViewController *)self tableView];
  [v7 frame];
  double v14 = v13;
  [v12 bounds];
  objc_msgSend(v7, "sizeThatFits:", v15, 1.79769313e308);
  if (v16 > v14)
  {
    double v17 = v16;
    [v12 _rectForTableHeaderView];
    objc_msgSend(v7, "setFrame:");
    [v12 _tableHeaderHeightDidChangeToHeight:v17];
  }
  [v7 setNeedsLayout];
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
  int64_t v5 = v4;
  switch(self->_identityVerificaionError)
  {
    case 2uLL:
      BOOL v6 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);
      id v7 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
      uint64_t v8 = PKDisplayableErrorCustom();

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __90__PKPeerPaymentIdentityVerificationPickerViewController_explanationViewDidSelectContinue___block_invoke_46;
      v20[3] = &unk_1E59CA7D0;
      v20[4] = self;
      id v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, v20, 0);
      id v10 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self navigationController];
      [v10 presentViewController:v9 animated:1 completion:0];

      goto LABEL_8;
    case 3uLL:
      id v11 = [v4 dockView];
      [v11 setButtonsEnabled:0];

      id v12 = [v5 dockView];
      double v13 = [v12 primaryButton];
      [v13 setShowSpinner:1];

      double v14 = [v5 dockView];
      double v15 = [v14 footerView];
      [v15 setButtonsEnabled:0];

      [(PKPeerPaymentIdentityVerificationPickerViewController *)self _processNextViewController];
      break;
    case 5uLL:
      uint64_t v8 = [(PKPeerPaymentIdentityVerificationController *)self->_controller webService];
      double v16 = [v8 peerPaymentService];
      id v9 = [v16 account];

      id v17 = objc_alloc_init(MEMORY[0x1E4F848A0]);
      id v18 = [[PKPeerPaymentAccountResolutionController alloc] initWithAccount:v9 webService:v8 context:[(PKPaymentSetupTableViewController *)self context] delegate:self passLibraryDataProvider:v17];
      v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Presenting contact apple support alert...", buf, 2u);
      }

      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E70], 0);
      [(PKPeerPaymentAccountResolutionController *)v18 presentFlowForAccountResolution:3 configuration:0 completion:&__block_literal_global_3];

LABEL_8:
      break;
    default:
      [(PKPeerPaymentIdentityVerificationPickerViewController *)self _terminateFlow];
      break;
  }
}

void __90__PKPeerPaymentIdentityVerificationPickerViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"NO";
    if (a2) {
      id v4 = @"YES";
    }
    int v5 = 138412290;
    BOOL v6 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Presented contact apple support alert with success %@", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t __90__PKPeerPaymentIdentityVerificationPickerViewController_explanationViewDidSelectContinue___block_invoke_46(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCancelButtonTapped:0];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
}

- (void)_processNextViewController
{
  [(PKPeerPaymentIdentityVerificationPickerViewController *)self _showNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  controller = self->_controller;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke;
  v4[3] = &unk_1E59CB2D8;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [(PKPeerPaymentIdentityVerificationController *)controller nextViewControllerWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_2;
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

void __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _showNavigationBarSpinner:0];
  *(void *)(*(void *)(a1 + 32) + 1128) = *(void *)(a1 + 72);
  if (!*(void *)(a1 + 40))
  {
    if (*(void *)(a1 + 56))
    {
      id v4 = objc_msgSend(MEMORY[0x1E4F84D80], "displayableErrorForError:");
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_3;
      v22[3] = &unk_1E59CA7D0;
      v22[4] = *(void *)(a1 + 32);
      id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v22, 0);
      BOOL v6 = [*(id *)(a1 + 32) navigationController];
      [v6 presentViewController:v5 animated:1 completion:0];
    }
    else
    {
      uint64_t v7 = *(void **)(a1 + 64);
      if (v7)
      {
        uint64_t v8 = [v7 explanationView];
        [v8 setDelegate:*(void *)(a1 + 32)];

        v2 = [*(id *)(a1 + 32) navigationController];
        id v19 = v2;
        uint64_t v3 = *(void *)(a1 + 64);
        goto LABEL_3;
      }
      id v9 = *(void **)(a1 + 32);
      if (v9[141] != 1) {
        return;
      }
      id v4 = [v9 headerView];
      id v10 = [v4 checkmarkLayer];
      [v10 setRevealed:1 animated:0];

      id v11 = *(void **)(a1 + 32);
      id v12 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_0.isa);
      [v11 setHeaderViewTitle:v12 subtitle:&stru_1EF1B5B50];

      [v4 setNeedsLayout];
      [*(id *)(a1 + 32) _setNavigationBarEnabled:0];
      double v13 = [*(id *)(a1 + 32) view];
      [v13 setUserInteractionEnabled:0];

      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 1144);
      *(void *)(v14 + 1144) = 0;

      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = *(void **)(v16 + 1136);
      *(void *)(v16 + 1136) = 0;

      dispatch_time_t v18 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_4;
      block[3] = &unk_1E59CA7D0;
      id v21 = *(id *)(a1 + 48);
      dispatch_after(v18, MEMORY[0x1E4F14428], block);
    }
    return;
  }
  v2 = [*(id *)(a1 + 48) navigationController];
  id v19 = v2;
  uint64_t v3 = *(void *)(a1 + 40);
LABEL_3:
  [v2 pushViewController:v3 animated:1];
}

uint64_t __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCancelButtonTapped:0];
}

uint64_t __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateFlow];
}

- (void)_handleNextButtonTapped:(id)a3
{
  if (self->_rightBarButtonItemsEnabled)
  {
    id v4 = [(PKPaymentSetupTableViewController *)self tableView];
    id v5 = [(PKPaymentSetupTableViewController *)self tableView];
    [v5 safeAreaInsets];
    objc_msgSend(v4, "setContentOffset:animated:", 1, 0.0, -v6);

    uint64_t v7 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self navigationController];
    uint64_t v8 = [v7 navigationBar];
    [v8 setUserInteractionEnabled:0];

    dispatch_time_t v9 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__PKPeerPaymentIdentityVerificationPickerViewController__handleNextButtonTapped___block_invoke;
    block[3] = &unk_1E59CA7D0;
    void block[4] = self;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);
  }
}

void __81__PKPeerPaymentIdentityVerificationPickerViewController__handleNextButtonTapped___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _processNextViewController];
  id v3 = [*(id *)(a1 + 32) navigationController];
  v2 = [v3 navigationBar];
  [v2 setUserInteractionEnabled:1];
}

- (void)_handleError:(id)a3
{
  id v4 = [MEMORY[0x1E4F84D80] displayableErrorForError:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKPeerPaymentIdentityVerificationPickerViewController__handleError___block_invoke;
  v7[3] = &unk_1E59CA7D0;
  v7[4] = self;
  id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v7, 0);
  double v6 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self navigationController];
  [v6 presentViewController:v5 animated:1 completion:0];
}

uint64_t __70__PKPeerPaymentIdentityVerificationPickerViewController__handleError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminateFlow];
}

- (void)_terminateFlow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v4 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_handleCancelButtonTapped:(id)a3
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85E68], 0, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained viewControllerDidCancelSetupFlow:self];
  }
  else {
    [(PKPeerPaymentIdentityVerificationPickerViewController *)self _terminateFlow];
  }
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  if (self->_navigationEnabled != a3)
  {
    BOOL v3 = a3;
    self->_navigationEnabled = a3;
    id v7 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self navigationController];
    id v5 = [v7 navigationBar];
    [v5 setUserInteractionEnabled:v3];

    double v6 = [v7 interactivePopGestureRecognizer];
    [v6 setEnabled:v3];

    [(PKPeerPaymentIdentityVerificationPickerViewController *)self _updateNavigationItemAnimated:1];
  }
}

- (void)_setRightBarButtonItemsEnabled:(BOOL)a3
{
  if (self->_rightBarButtonItemsEnabled != a3)
  {
    self->_rightBarButtonItemsEnabled = a3;
    [(PKPeerPaymentIdentityVerificationPickerViewController *)self _updateRightBarButtonState];
  }
}

- (void)_updateNavigationItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKPeerPaymentIdentityVerificationPickerViewController *)self navigationItem];
  BOOL navigationEnabled = self->_navigationEnabled;
  id v15 = v5;
  if (((navigationEnabled ^ [v5 hidesBackButton]) & 1) == 0) {
    [v15 setHidesBackButton:!self->_navigationEnabled animated:v3];
  }
  if (self->_navigationEnabled) {
    leftBarButtonItems = self->_leftBarButtonItems;
  }
  else {
    leftBarButtonItems = 0;
  }
  uint64_t v8 = leftBarButtonItems;
  dispatch_time_t v9 = [v15 leftBarButtonItems];
  char v10 = PKEqualObjects();

  if ((v10 & 1) == 0) {
    [v15 setLeftBarButtonItems:v8 animated:v3];
  }
  if (self->_navigationEnabled) {
    rightBarButtonItems = self->_rightBarButtonItems;
  }
  else {
    rightBarButtonItems = 0;
  }
  id v12 = rightBarButtonItems;

  double v13 = [v15 rightBarButtonItems];
  char v14 = PKEqualObjects();

  if ((v14 & 1) == 0) {
    [v15 setRightBarButtonItems:v12 animated:v3];
  }
  [(PKPeerPaymentIdentityVerificationPickerViewController *)self _updateRightBarButtonState];
}

- (void)_updateRightBarButtonState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_rightBarButtonItems;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setEnabled:", self->_rightBarButtonItemsEnabled, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_setIdleTimerDisabled:(BOOL)a3 title:(id)a4 subtitle:(id)a5
{
  BOOL v6 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  long long v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = @"enabled";
    int v12 = 138413058;
    if (v6) {
      long long v10 = @"disabled";
    }
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = @"PeerPaymentIdentityVerification";
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Payment Setup has %@ the Idle Timer. (For: %@ - %@) - %@.", (uint8_t *)&v12, 0x2Au);
  }

  long long v11 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v11 _setIdleTimerDisabled:v6 forReason:@"PeerPaymentIdentityVerification"];
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

- (PKPaymentSetupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_pickerField, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end