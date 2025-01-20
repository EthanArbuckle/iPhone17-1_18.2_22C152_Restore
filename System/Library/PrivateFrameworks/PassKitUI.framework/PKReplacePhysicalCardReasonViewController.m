@interface PKReplacePhysicalCardReasonViewController
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKReplacePhysicalCardReasonViewController)initWithPhysicalCardController:(id)a3 context:(int64_t)a4;
- (id)_cellForReasonAtIndexPath:(id)a3 inTableView:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelButtonPressed:(id)a3;
- (void)_nextButtonPressed:(id)a3;
- (void)_reasonRowSelectedAtIndexPath:(id)a3 inTableView:(id)a4;
- (void)_updateNavigationButtons;
- (void)scrollViewDidScroll:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKReplacePhysicalCardReasonViewController

- (PKReplacePhysicalCardReasonViewController)initWithPhysicalCardController:(id)a3 context:(int64_t)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKReplacePhysicalCardReasonViewController;
  v8 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v20, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controller, a3);
    v9->_context = a4;
    v10 = [v7 account];
    v9->_feature = [v10 feature];

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v9 action:sel__cancelButtonPressed_];
    cancelButton = v9->_cancelButton;
    v9->_cancelButton = (UIBarButtonItem *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v14 = PKLocalizedPaymentString(&cfstr_Next.isa);
    uint64_t v15 = [v13 initWithTitle:v14 style:0 target:v9 action:sel__nextButtonPressed_];
    nextButton = v9->_nextButton;
    v9->_nextButton = (UIBarButtonItem *)v15;

    v17 = [(PKReplacePhysicalCardReasonViewController *)v9 navigationItem];
    objc_msgSend(v17, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v17, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    [v17 setLeftBarButtonItem:v9->_cancelButton];
    [v17 setRightBarButtonItem:v9->_nextButton];
    v18 = PKLocalizedFeatureString();
    [v17 setTitle:v18];

    [(PKReplacePhysicalCardReasonViewController *)v9 _updateNavigationButtons];
  }

  return v9;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKReplacePhysicalCardReasonViewController;
  [(PKSectionTableViewController *)&v4 viewDidLoad];
  v3 = [(PKReplacePhysicalCardReasonViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPhysicalCardReasonTableViewCellReuseIdentifier"];
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKReplacePhysicalCardReasonViewController;
  [(PKReplacePhysicalCardReasonViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(PKReplacePhysicalCardReasonViewController *)self tableView];
  objc_super v4 = [(PKReplacePhysicalCardReasonViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKReplacePhysicalCardReasonViewController *)self view];
  [v3 setNeedsLayout];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return [(PKReplacePhysicalCardReasonViewController *)self _cellForReasonAtIndexPath:a4 inTableView:a3];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return !self->_loadingCustomizationOptions;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return (id)PKLocalizedFeatureString();
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)PKLocalizedFeatureString();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (void)_reasonRowSelectedAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  int64_t v7 = [v12 row];
  [v12 section];
  if (!self->_hasSelectedRow || self->_selectedRow != v7)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:");
    v10 = [v6 cellForRowAtIndexPath:v9];

    [v10 setAccessoryType:0];
    uint64_t v11 = [v6 cellForRowAtIndexPath:v12];

    [v11 setAccessoryType:3];
    self->_hasSelectedRow = 1;
    self->_selectedRow = v7;
    [(PKReplacePhysicalCardReasonViewController *)self _updateNavigationButtons];
  }
  [v6 deselectRowAtIndexPath:v12 animated:1];
}

- (id)_cellForReasonAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v6 = a3;
  int64_t v7 = [a4 dequeueReusableCellWithIdentifier:@"PKPhysicalCardReasonTableViewCellReuseIdentifier" forIndexPath:v6];
  if ((unint64_t)[v6 row] > 4)
  {
    v8 = 0;
  }
  else
  {
    v8 = PKLocalizedFeatureString();
  }
  v9 = [v7 textLabel];
  [v9 setText:v8];

  if (self->_hasSelectedRow)
  {
    int64_t selectedRow = self->_selectedRow;
    if (selectedRow == [v6 row]) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  [v7 setAccessoryType:v11];

  return v7;
}

- (void)_updateNavigationButtons
{
  [(UIBarButtonItem *)self->_cancelButton setEnabled:!self->_loadingCustomizationOptions];
  BOOL v3 = self->_hasSelectedRow && !self->_loadingCustomizationOptions;
  [(UIBarButtonItem *)self->_nextButton setEnabled:v3];
  if (self->_loadingCustomizationOptions)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v6 startAnimating];
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v6];
    objc_super v5 = [(PKReplacePhysicalCardReasonViewController *)self navigationItem];
    [v5 setRightBarButtonItem:v4];
  }
  else
  {
    id v6 = [(PKReplacePhysicalCardReasonViewController *)self navigationItem];
    [v6 setRightBarButtonItem:self->_nextButton];
  }
}

- (void)_cancelButtonPressed:(id)a3
{
}

- (void)_nextButtonPressed:(id)a3
{
  id v4 = a3;
  if (!self->_loadingCustomizationOptions && self->_hasSelectedRow)
  {
    self->_loadingCustomizationOptions = 1;
    [(PKReplacePhysicalCardReasonViewController *)self _updateNavigationButtons];
    v18 = [PKOrderPhysicalCardController alloc];
    v19 = [MEMORY[0x1E4F84270] sharedInstance];
    objc_super v5 = [MEMORY[0x1E4F84D50] sharedService];
    id v6 = [(PKPhysicalCardController *)self->_controller paymentPass];
    int64_t v7 = [(PKPhysicalCardController *)self->_controller account];
    v8 = [(PKPhysicalCardController *)self->_controller accountUser];
    unint64_t selectedRow = self->_selectedRow;
    if (selectedRow > 4) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = qword_1A0445690[selectedRow];
    }
    uint64_t v17 = v10;
    int64_t context = self->_context;
    id v12 = [(PKPhysicalCardController *)self->_controller primaryPhysicalCard];
    id v13 = v12;
    if (!v12)
    {
      id v13 = [(PKPhysicalCardController *)self->_controller unactivatedPhysicalCard];
    }
    v14 = [(PKOrderPhysicalCardController *)v18 initWithAccountService:v19 paymentWebService:v5 paymentPass:v6 account:v7 accountUser:v8 orderReason:v17 context:context currentPhysicalCard:v13];
    orderController = self->_orderController;
    self->_orderController = v14;

    if (!v12) {
    objc_initWeak(&location, self);
    }
    v16 = self->_orderController;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke;
    v20[3] = &unk_1E59CEAC0;
    objc_copyWeak(&v21, &location);
    [(PKOrderPhysicalCardController *)v16 updateCustomizationOptionsWithCompletion:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_2;
    block[3] = &unk_1E59CA7D0;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_2(uint64_t a1)
{
  v2 = [[PKOrderPhysicalCardAddressConfirmationViewController alloc] initWithOrderPhysicalCardController:*(void *)(*(void *)(a1 + 32) + 1152)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_3;
  v4[3] = &unk_1E59CAEA8;
  v4[4] = *(void *)(a1 + 32);
  objc_super v5 = v2;
  BOOL v3 = v2;
  [(PKOrderPhysicalCardAddressConfirmationViewController *)v3 preflightWithCompletion:v4];
}

void __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_3(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_4;
  block[3] = &unk_1E59CD7B0;
  v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  char v5 = a2;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__PKReplacePhysicalCardReasonViewController__nextButtonPressed___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1144) = 0;
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) navigationController];
    [v2 pushViewController:*(void *)(a1 + 40) animated:1];
  }
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 _updateNavigationButtons];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderController, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end