@interface PKAddBankAccountInformationViewController
- (BOOL)_allCellsHavePastedContent;
- (BOOL)_cellValuesAreValid;
- (BOOL)_isAccountNumberCellValid;
- (BOOL)_isCellValidAtRow:(unint64_t)a3;
- (BOOL)_isRoutingNumberCellValid;
- (BOOL)offerKeychainPreFill;
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (BOOL)saveToBankCredentialCenter;
- (BOOL)showDeleteButton;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (PKAddBankAccountInformationViewController)init;
- (PKAddBankAccountInformationViewController)initWithDelegate:(id)a3 bankInformation:(id)a4 accountCountryCode:(id)a5;
- (PKAddBankAccountInformationViewController)initWithDelegate:(id)a3 bankInformation:(id)a4 accountCountryCode:(id)a5 featureAccount:(id)a6;
- (PKAddBankAccountInformationViewController)initWithState:(unint64_t)a3 delegate:(id)a4 bankInformation:(id)a5 accountCountryCode:(id)a6 featureAccount:(id)a7;
- (PKAddBankAccountInformationViewControllerDelegate)delegate;
- (double)_minimumRequiredWidthForCellText:(id)a3 withFont:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_bankInformationTextForRow:(unint64_t)a3;
- (id)_cellHasPastedContent;
- (id)_countrySpecificLocalizedStringKeyForKey:(id)a3;
- (id)_countrySpecificLocalizedStringKeyForKey:(id)a3 minDigits:(unint64_t)a4 maxDigits:(unint64_t)a5;
- (id)_countrySpecificLocalizedStringKeyForKey:(id)a3 numberOfDigits:(unint64_t)a4;
- (id)_footerView;
- (id)_headerSubTitle;
- (id)_headerTitle;
- (id)_placeholderTextForRow:(unint64_t)a3;
- (id)_textForRow:(unint64_t)a3;
- (id)_userEnteredTextForCellAtRow:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_maxTextLengthForRow:(unint64_t)a3;
- (unint64_t)_minTextLengthForRow:(unint64_t)a3;
- (unint64_t)_rowWithTextField:(id)a3;
- (void)_addPaymentFundingSourceWithCompletion:(id)a3;
- (void)_addToBankCredentialCenter;
- (void)_deleteBankInformation;
- (void)_hideHeaderActivitySpinner;
- (void)_reloadTableSection;
- (void)_setCellHasPastedContent:(BOOL)a3 forRow:(unint64_t)a4;
- (void)_setContentHidden:(BOOL)a3;
- (void)_setIdleTimerDisabled:(BOOL)a3 title:(id)a4 subtitle:(id)a5;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)_setNavigationBarItemsHidden:(BOOL)a3;
- (void)_setState:(unint64_t)a3;
- (void)_setTableFooterView;
- (void)_setTableViewHeaderActivitySpinnerAnimated:(BOOL)a3 title:(id)a4 subtitle:(id)a5;
- (void)_setText:(id)a3 forForCellAtRow:(unint64_t)a4;
- (void)_showHeaderActivitySpinner;
- (void)_showHowToFindAccountInformationViewController:(id)a3;
- (void)_updateBankAccountInformationWithValues:(id)a3 completion:(id)a4;
- (void)_updateHeaderAndNavigationItems;
- (void)cancel:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)next:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4;
- (void)setOfferKeychainPreFill:(BOOL)a3;
- (void)setSaveToBankCredentialCenter:(BOOL)a3;
- (void)setShowDeleteButton:(BOOL)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)textFieldDidClear:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAddBankAccountInformationViewController

- (PKAddBankAccountInformationViewController)init
{
  return [(PKAddBankAccountInformationViewController *)self initWithDelegate:0 bankInformation:0 accountCountryCode:@"US"];
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (PKAddBankAccountInformationViewController)initWithDelegate:(id)a3 bankInformation:(id)a4 accountCountryCode:(id)a5
{
  return [(PKAddBankAccountInformationViewController *)self initWithState:1 delegate:a3 bankInformation:a4 accountCountryCode:a5 featureAccount:0];
}

- (PKAddBankAccountInformationViewController)initWithDelegate:(id)a3 bankInformation:(id)a4 accountCountryCode:(id)a5 featureAccount:(id)a6
{
  return [(PKAddBankAccountInformationViewController *)self initWithState:1 delegate:a3 bankInformation:a4 accountCountryCode:a5 featureAccount:a6];
}

- (PKAddBankAccountInformationViewController)initWithState:(unint64_t)a3 delegate:(id)a4 bankInformation:(id)a5 accountCountryCode:(id)a6 featureAccount:(id)a7
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v44.receiver = self;
  v44.super_class = (Class)PKAddBankAccountInformationViewController;
  v16 = [(PKPaymentSetupTableViewController *)&v44 initWithContext:0];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_featureAccount, a7);
    v17->_state = a3;
    objc_storeWeak((id *)&v17->_delegate, v12);
    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    cells = v17->_cells;
    v17->_cells = (NSMutableDictionary *)v18;

    id v20 = v13;
    if (!v13) {
      id v20 = objc_alloc_init(MEMORY[0x1E4F84550]);
    }
    p_bankInformation = (id *)&v17->_bankInformation;
    objc_storeStrong((id *)&v17->_bankInformation, v20);
    if (!v13) {

    }
    v17->_saveToBankCredentialCenter = 1;
    v17->_showDeleteButton = 1;
    if (PKBankCredentialCenterEnabled())
    {
      v22 = (FKWalletBankCredentialImporter *)objc_alloc_init(MEMORY[0x1E4F26BF8]);
      fkCredentialImporter = v17->_fkCredentialImporter;
      v17->_fkCredentialImporter = v22;
    }
    uint64_t v24 = [v14 uppercaseString];
    accountCountryCode = v17->_accountCountryCode;
    v17->_accountCountryCode = (NSString *)v24;

    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    userEnteredValues = v17->_userEnteredValues;
    v17->_userEnteredValues = (NSMutableDictionary *)v26;

    v17->_isEditingBankInformation = [*p_bankInformation isValid];
    [(PKAddBankAccountInformationViewController *)v17 _setNavigationBarItemsHidden:0];
    if (v17->_isEditingBankInformation)
    {
      v28 = v17->_userEnteredValues;
      v45[0] = @"PKAddBankAccountRoutingNumberKey";
      v29 = [*p_bankInformation routingNumber];
      v45[1] = @"PKAddBankAccountAccountNumberKey";
      v46[0] = v29;
      v30 = [*p_bankInformation accountNumber];
      v46[1] = v30;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
      v32 = [NSNumber numberWithUnsignedInteger:v17->_state];
      [(NSMutableDictionary *)v28 setObject:v31 forKey:v32];
    }
    v33 = [MEMORY[0x1E4F1CA48] array];
    v34 = [MEMORY[0x1E4F1CA48] array];
    v35 = [(PKAddBankAccountInformationViewController *)v17 _textForRow:0];
    [v33 addObject:v35];

    v36 = [(PKAddBankAccountInformationViewController *)v17 _placeholderTextForRow:0];
    [v34 addObject:v36];

    v37 = [(PKAddBankAccountInformationViewController *)v17 _textForRow:1];
    [v33 addObject:v37];

    v38 = [(PKAddBankAccountInformationViewController *)v17 _placeholderTextForRow:1];
    [v34 addObject:v38];

    uint64_t v39 = [v33 copy];
    cellText = v17->_cellText;
    v17->_cellText = (NSArray *)v39;

    uint64_t v41 = [v34 copy];
    cellPlaceholderText = v17->_cellPlaceholderText;
    v17->_cellPlaceholderText = (NSArray *)v41;
  }
  return v17;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKAddBankAccountInformationViewController;
  [(PKPaymentSetupTableViewController *)&v4 dealloc];
}

- (void)loadView
{
  v16.receiver = self;
  v16.super_class = (Class)PKAddBankAccountInformationViewController;
  [(PKPaymentSetupTableViewController *)&v16 loadView];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  objc_super v4 = [PKCollapsibleHeaderView alloc];
  v5 = -[PKCollapsibleHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  v7 = self->_headerView;
  v8 = [(PKAddBankAccountInformationViewController *)self _headerTitle];
  v9 = [(PKAddBankAccountInformationViewController *)self _headerSubTitle];
  [(PKCollapsibleHeaderView *)v7 setTitle:v8 subtitle:v9];

  [(PKCollapsibleHeaderView *)self->_headerView setTitleAccessoriesEnabled:0];
  [(PKCollapsibleHeaderView *)self->_headerView setAdditionalBottomPadding:11.0];
  [v3 setTableHeaderView:self->_headerView];
  if (self->_isEditingBankInformation && self->_showDeleteButton)
  {
    v10 = [(PKPaymentSetupTableViewController *)self dockView];
    v11 = [v10 footerView];
    id v12 = [v11 secondaryActionButton];

    id v13 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_4.isa);
    [v12 setTitle:v13 forState:0];

    [v12 addTarget:self action:sel__deleteBankInformation forControlEvents:0x2000];
  }
  [(PKAddBankAccountInformationViewController *)self _setTableFooterView];
  id v14 = [(PKPaymentSetupTableViewController *)self dockView];
  id v15 = [v14 footerView];
  [v15 setManualEntryButton:0];
}

- (void)viewWillLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)PKAddBankAccountInformationViewController;
  [(PKPaymentSetupTableViewController *)&v21 viewWillLayoutSubviews];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 bounds];
  double v5 = v4;
  [(PKCollapsibleHeaderView *)self->_headerView frame];
  double v7 = v6;
  double v9 = v8;
  -[PKCollapsibleHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v5, 1.79769313e308);
  if (v7 != v11 || v9 != v10)
  {
    headerView = self->_headerView;
    [v3 _rectForTableHeaderView];
    -[PKCollapsibleHeaderView setFrame:](headerView, "setFrame:");
    [v3 setTableHeaderView:0];
    [v3 setTableHeaderView:self->_headerView];
  }
  id v14 = [v3 tableFooterView];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(v14, "sizeThatFits:", v5, 1.79769313e308);
  if (v14 && (v16 != v19 || v18 != v20))
  {
    [v3 _rectForTableFooterView];
    objc_msgSend(v14, "setFrame:");
    [v3 setTableFooterView:0];
    [v3 setTableFooterView:v14];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAddBankAccountInformationViewController;
  [(PKPaymentSetupTableViewController *)&v6 viewWillAppear:a3];
  double v4 = [(PKAddBankAccountInformationViewController *)self navigationItem];
  double v5 = [v4 rightBarButtonItem];
  objc_msgSend(v5, "setEnabled:", -[PKAddBankAccountInformationViewController _cellValuesAreValid](self, "_cellValuesAreValid"));
}

- (void)viewDidAppear:(BOOL)a3
{
  v25.receiver = self;
  v25.super_class = (Class)PKAddBankAccountInformationViewController;
  [(PKPaymentSetupTableViewController *)&v25 viewDidAppear:a3];
  if (!self->_isEditingBankInformation)
  {
    double v4 = [(NSMutableDictionary *)self->_cells objectForKey:&unk_1EF2B98D0];
    double v5 = [v4 editableTextField];
    [v5 becomeFirstResponder];
  }
  if ([(PKBankAccountInformation *)self->_bankInformation type] == 1
    && [(PKAddBankAccountInformationViewController *)self offerKeychainPreFill])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F84550]);
    if ([v6 isValid])
    {
      [(PKAccount *)self->_featureAccount feature];
      double v7 = (void *)MEMORY[0x1E4FB1418];
      double v8 = PKLocalizedFeatureString();
      double v9 = PKLocalizedFeatureString();
      double v10 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

      double v11 = (void *)MEMORY[0x1E4FB1410];
      id v12 = PKLocalizedFeatureString();
      id v13 = [v11 actionWithTitle:v12 style:1 handler:0];
      [v10 addAction:v13];

      id v14 = (void *)MEMORY[0x1E4FB1410];
      double v15 = PKLocalizedFeatureString();
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      objc_super v21 = __59__PKAddBankAccountInformationViewController_viewDidAppear___block_invoke;
      v22 = &unk_1E59CB218;
      id v23 = v6;
      uint64_t v24 = self;
      double v16 = [v14 actionWithTitle:v15 style:0 handler:&v19];

      objc_msgSend(v10, "addAction:", v16, v19, v20, v21, v22);
      [v10 setPreferredAction:v16];
      [(PKAddBankAccountInformationViewController *)self presentViewController:v10 animated:1 completion:0];
    }
  }
  if ([(PKAccount *)self->_featureAccount type] == 4)
  {
    double v17 = (PKSavingsAccountAssessmentManager *)[objc_alloc(MEMORY[0x1E4F84F70]) initWithType:1];
    assessmentManager = self->_assessmentManager;
    self->_assessmentManager = v17;
  }
}

void __59__PKAddBankAccountInformationViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"PKAddBankAccountRoutingNumberKey";
  v2 = [*(id *)(a1 + 32) routingNumber];
  v6[1] = @"PKAddBankAccountAccountNumberKey";
  v7[0] = v2;
  v3 = [*(id *)(a1 + 32) accountNumber];
  v7[1] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  [*(id *)(*(void *)(a1 + 40) + 1168) setObject:v4 forKey:&unk_1EF2B98E8];
  [*(id *)(*(void *)(a1 + 40) + 1168) setObject:v4 forKey:&unk_1EF2B9900];
  [*(id *)(*(void *)(a1 + 40) + 1168) setObject:v4 forKey:&unk_1EF2B9918];
  *(unsigned char *)(*(void *)(a1 + 40) + 1178) = 1;
  double v5 = [*(id *)(a1 + 40) tableView];
  [v5 reloadData];

  *(void *)(*(void *)(a1 + 40) + 1112) = 3;
  [*(id *)(a1 + 40) _setState:*(void *)(*(void *)(a1 + 40) + 1112)];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2 * !self->_shouldHideContent;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"PKPeerPaymentBankAccountDetailCell"];
  uint64_t v8 = [v6 row];

  if (v7)
  {
    double v9 = [(PKPeerPaymentBankAccountDetailCell *)v7 editableTextField];
    [v9 setEnabled:1];
  }
  else
  {
    double v7 = [[PKPeerPaymentBankAccountDetailCell alloc] initWithStyle:1000 reuseIdentifier:@"PKPeerPaymentBankAccountDetailCell"];
    double v10 = [(PKPeerPaymentBankAccountDetailCell *)v7 editableTextField];
    [v10 setDelegate:self];

    double v11 = [(PKPeerPaymentBankAccountDetailCell *)v7 editableTextField];
    [v11 setKeyboardType:11];

    [(PKPeerPaymentBankAccountDetailCell *)v7 setShouldDrawSeperator:1];
  }
  id v12 = [(PKPeerPaymentBankAccountDetailCell *)v7 editableTextField];
  id v13 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], 0, 0, 4);
  [v12 setFont:v13];

  id v14 = [(PKPeerPaymentBankAccountDetailCell *)v7 editableTextField];
  double v15 = [(PKAddBankAccountInformationViewController *)self _bankInformationTextForRow:v8];
  [v14 setText:v15];

  double v16 = [(PKPeerPaymentBankAccountDetailCell *)v7 textLabel];
  double v17 = [(NSArray *)self->_cellText objectAtIndex:v8];
  [v16 setText:v17];

  double v18 = [(PKPeerPaymentBankAccountDetailCell *)v7 editableTextField];
  uint64_t v19 = [(NSArray *)self->_cellPlaceholderText objectAtIndex:v8];
  [v18 setPlaceholder:v19];

  uint64_t v20 = [(PKPeerPaymentBankAccountDetailCell *)v7 editableTextField];
  objc_super v21 = v20;
  v22 = (uint64_t *)MEMORY[0x1E4F85938];
  id v23 = (uint64_t *)MEMORY[0x1E4F85190];
  if (v8 != 1) {
    id v23 = (uint64_t *)MEMORY[0x1E4F85B28];
  }
  if (v8) {
    v22 = v23;
  }
  uint64_t v24 = *v22;
  [v20 setAccessibilityIdentifier:*v22];

  objc_super v25 = [(PKPeerPaymentBankAccountDetailCell *)v7 textLabel];
  uint64_t v26 = [v25 font];

  [(PKAddBankAccountInformationViewController *)self _minimumRequiredWidthForCellText:self->_cellText withFont:v26];
  PKFloatCeilToPixel();
  -[PKPeerPaymentBankAccountDetailCell setMinimumTextLabelWidth:](v7, "setMinimumTextLabelWidth:");
  [(PKPeerPaymentBankAccountDetailCell *)v7 setAccessibilityIdentifier:v24];
  v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v28 = *MEMORY[0x1E4FB3018];
  v29 = [(PKPeerPaymentBankAccountDetailCell *)v7 editableTextField];
  [v27 addObserver:self selector:sel_textFieldDidChange_ name:v28 object:v29];

  cells = self->_cells;
  v31 = [NSNumber numberWithUnsignedInteger:v8];
  [(NSMutableDictionary *)cells setObject:v7 forKey:v31];

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)PKAddBankAccountInformationViewController;
  id v8 = a4;
  [(PKPaymentSetupTableViewController *)&v11 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:a5];
  double v9 = objc_msgSend(v8, "textLabel", v11.receiver, v11.super_class);
  double v10 = [v9 font];

  [(PKAddBankAccountInformationViewController *)self _minimumRequiredWidthForCellText:self->_cellText withFont:v10];
  PKFloatCeilToPixel();
  objc_msgSend(v8, "setMinimumTextLabelWidth:");
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  if (self->_isEditingBankInformation && self->_state == 1)
  {
    id v8 = v4;
    double v5 = [(PKPaymentSetupTableViewController *)self tableView];
    id v6 = [(PKAddBankAccountInformationViewController *)self _footerView];
    [v5 setTableFooterView:v6];

    double v7 = [(PKPaymentSetupTableViewController *)self tableView];
    [v7 setNeedsLayout];

    if (!self->_hasInteractedWithCell)
    {
      [(PKAddBankAccountInformationViewController *)self _setText:0 forForCellAtRow:1];
      [(PKAddBankAccountInformationViewController *)self _setText:0 forForCellAtRow:0];
    }
    self->_hasInteractedWithCell = 1;
    id v4 = v8;
  }
}

- (void)textFieldDidChange:(id)a3
{
  id v5 = [(PKAddBankAccountInformationViewController *)self navigationItem];
  id v4 = [v5 rightBarButtonItem];
  objc_msgSend(v4, "setEnabled:", -[PKAddBankAccountInformationViewController _cellValuesAreValid](self, "_cellValuesAreValid"));
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = a3;
  objc_super v11 = [v10 text];
  id v12 = objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  id v13 = objc_msgSend(v12, "pk_zString");

  unint64_t v14 = [(PKAddBankAccountInformationViewController *)self _rowWithTextField:v10];
  unint64_t v15 = [v13 length];
  unint64_t v16 = [(PKAddBankAccountInformationViewController *)self _maxTextLengthForRow:v14];
  double v17 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  double v18 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v9];
  int v19 = [v17 isSupersetOfSet:v18];
  if (v15 <= v16) {
    BOOL v20 = v19;
  }
  else {
    BOOL v20 = 0;
  }
  if (v20)
  {
    id v21 = v13;
    id v22 = v9;
    id v23 = v22;
    if (v21 == v22)
    {
    }
    else
    {
      if (!v22 || !v21)
      {

LABEL_13:
        BOOL v25 = 0;
        goto LABEL_14;
      }
      int v24 = [v21 isEqualToString:v22];

      if (!v24) {
        goto LABEL_13;
      }
    }
    BOOL v25 = (unint64_t)[v23 length] > 1;
LABEL_14:
    [(PKAddBankAccountInformationViewController *)self _setCellHasPastedContent:v25 forRow:v14];
  }

  return v20;
}

- (void)cancel:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained bankAccountInformationViewControllerChangedBankAccountInformation:self];
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained addBankAccountInformationViewControllerDidFinish:self];
  }
  else
  {
    id v4 = [(PKAddBankAccountInformationViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)next:(id)a3
{
}

- (id)_cellHasPastedContent
{
  v10[2] = *MEMORY[0x1E4F143B8];
  cellHasPastedContent = self->_cellHasPastedContent;
  if (!cellHasPastedContent)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA60];
    v9[0] = &unk_1EF2B98E8;
    v9[1] = &unk_1EF2B98D0;
    v10[0] = MEMORY[0x1E4F1CC28];
    v10[1] = MEMORY[0x1E4F1CC28];
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    id v6 = [v4 dictionaryWithDictionary:v5];
    double v7 = self->_cellHasPastedContent;
    self->_cellHasPastedContent = v6;

    cellHasPastedContent = self->_cellHasPastedContent;
  }

  return cellHasPastedContent;
}

- (void)_setCellHasPastedContent:(BOOL)a3 forRow:(unint64_t)a4
{
  if (a4 <= 1)
  {
    id v9 = [NSNumber numberWithBool:a3];
    double v7 = [(PKAddBankAccountInformationViewController *)self _cellHasPastedContent];
    id v8 = [NSNumber numberWithUnsignedInteger:a4];
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
}

- (BOOL)_allCellsHavePastedContent
{
  v3 = [(PKAddBankAccountInformationViewController *)self _cellHasPastedContent];
  uint64_t v4 = [v3 objectForKeyedSubscript:&unk_1EF2B98E8];

  id v5 = [(PKAddBankAccountInformationViewController *)self _cellHasPastedContent];
  id v6 = [v5 objectForKeyedSubscript:&unk_1EF2B98D0];

  if ([v4 BOOLValue]) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)_setTableFooterView
{
  if (self->_state != 1 || self->_isEditingBankInformation || self->_shouldHideContent)
  {
    id v4 = [(PKPaymentSetupTableViewController *)self tableView];
    [v4 setTableFooterView:0];
  }
  else
  {
    id v4 = [(PKPaymentSetupTableViewController *)self tableView];
    v3 = [(PKAddBankAccountInformationViewController *)self _footerView];
    [v4 setTableFooterView:v3];
  }
}

- (unint64_t)_rowWithTextField:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  cells = self->_cells;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __63__PKAddBankAccountInformationViewController__rowWithTextField___block_invoke;
  v9[3] = &unk_1E59DAEC8;
  id v6 = v4;
  id v10 = v6;
  objc_super v11 = &v12;
  [(NSMutableDictionary *)cells enumerateKeysAndObjectsUsingBlock:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__PKAddBankAccountInformationViewController__rowWithTextField___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  unint64_t v7 = [a3 editableTextField];
  id v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 unsignedIntegerValue];
    *a4 = 1;
  }
}

- (double)_minimumRequiredWidthForCellText:(id)a3 withFont:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4FB06F8];
  v22[0] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "sizeWithAttributes:", v7, (void)v16);
        if (v14 > v12) {
          double v12 = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

- (void)textFieldDidClear:(id)a3
{
  unint64_t v4 = [(PKAddBankAccountInformationViewController *)self _rowWithTextField:a3];

  [(PKAddBankAccountInformationViewController *)self _setCellHasPastedContent:0 forRow:v4];
}

- (BOOL)_cellValuesAreValid
{
  BOOL v3 = [(PKAddBankAccountInformationViewController *)self _isAccountNumberCellValid];
  if (v3)
  {
    LOBYTE(v3) = [(PKAddBankAccountInformationViewController *)self _isRoutingNumberCellValid];
  }
  return v3;
}

- (BOOL)_isAccountNumberCellValid
{
  return [(PKAddBankAccountInformationViewController *)self _isCellValidAtRow:1];
}

- (BOOL)_isRoutingNumberCellValid
{
  return [(PKAddBankAccountInformationViewController *)self _isCellValidAtRow:0];
}

- (BOOL)_isCellValidAtRow:(unint64_t)a3
{
  id v5 = -[PKAddBankAccountInformationViewController _userEnteredTextForCellAtRow:](self, "_userEnteredTextForCellAtRow:");
  unint64_t v6 = [v5 length];
  if (v6 >= [(PKAddBankAccountInformationViewController *)self _minTextLengthForRow:a3])
  {
    unint64_t v8 = [v5 length];
    BOOL v7 = v8 <= [(PKAddBankAccountInformationViewController *)self _maxTextLengthForRow:a3];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_userEnteredTextForCellAtRow:(unint64_t)a3
{
  cells = self->_cells;
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSMutableDictionary *)cells objectForKey:v4];

  unint64_t v6 = [v5 editableTextField];
  BOOL v7 = [v6 text];

  return v7;
}

- (void)_setText:(id)a3 forForCellAtRow:(unint64_t)a4
{
  cells = self->_cells;
  BOOL v7 = NSNumber;
  id v8 = a3;
  uint64_t v9 = [v7 numberWithUnsignedInteger:a4];
  id v11 = [(NSMutableDictionary *)cells objectForKey:v9];

  uint64_t v10 = [v11 editableTextField];
  [v10 setText:v8];

  [(PKAddBankAccountInformationViewController *)self _setCellHasPastedContent:0 forRow:a4];
}

- (void)_setState:(unint64_t)a3
{
  unint64_t state = a3;
  v61[2] = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    id v5 = [(PKAddBankAccountInformationViewController *)self _userEnteredTextForCellAtRow:1];
    unint64_t v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    BOOL v7 = [v5 stringByTrimmingCharactersInSet:v6];

    id v8 = [(PKAddBankAccountInformationViewController *)self _userEnteredTextForCellAtRow:0];
    uint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];

    if (state == 1)
    {
      self->_unint64_t state = 1;
    }
    else
    {
      userEnteredValues = self->_userEnteredValues;
      v60[0] = @"PKAddBankAccountRoutingNumberKey";
      v60[1] = @"PKAddBankAccountAccountNumberKey";
      v61[0] = v10;
      v61[1] = v7;
      double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
      id v13 = [NSNumber numberWithUnsignedInteger:self->_state];
      [(NSMutableDictionary *)userEnteredValues setObject:v12 forKey:v13];

      self->_unint64_t state = state;
      if (state == 2
        && [(PKAddBankAccountInformationViewController *)self _allCellsHavePastedContent])
      {
        self->_unint64_t state = 3;
        double v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Skipping Bank Account 'confirm' step since both fields have were pasted into", buf, 2u);
        }
      }
    }

    unint64_t state = self->_state;
  }
  if (state == 4)
  {
    self->_unint64_t state = 2;
    [(PKAddBankAccountInformationViewController *)self _updateHeaderAndNavigationItems];
    [(PKAddBankAccountInformationViewController *)self _setTableFooterView];
  }
  else if (state == 3)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    long long v16 = [MEMORY[0x1E4F1CA80] set];
    *(void *)buf = 0;
    v55 = buf;
    uint64_t v56 = 0x2020000000;
    BOOL v57 = 0;
    BOOL v57 = [(NSMutableDictionary *)self->_userEnteredValues count] != 0;
    long long v17 = self->_userEnteredValues;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __55__PKAddBankAccountInformationViewController__setState___block_invoke;
    v50[3] = &unk_1E59DAEF0;
    id v18 = v15;
    id v51 = v18;
    id v19 = v16;
    id v52 = v19;
    v53 = buf;
    [(NSMutableDictionary *)v17 enumerateKeysAndObjectsUsingBlock:v50];
    if (v55[24])
    {
      BOOL v20 = [(PKPaymentSetupTableViewController *)self tableView];
      [(PKAddBankAccountInformationViewController *)self _showHeaderActivitySpinner];
      [(PKAddBankAccountInformationViewController *)self _setNavigationBarItemsHidden:1];
      [v20 setUserInteractionEnabled:0];
      uint64_t v21 = [(NSMutableDictionary *)self->_cells objectForKey:&unk_1EF2B98E8];
      id v22 = [v21 editableTextField];
      [v22 setEnabled:0];

      id v23 = [(NSMutableDictionary *)self->_cells objectForKey:&unk_1EF2B98D0];
      int v24 = [v23 editableTextField];
      [v24 setEnabled:0];

      v58[0] = @"PKAddBankAccountAccountNumberKey";
      BOOL v25 = [v18 anyObject];
      v58[1] = @"PKAddBankAccountRoutingNumberKey";
      v59[0] = v25;
      uint64_t v26 = [v19 anyObject];
      v59[1] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__PKAddBankAccountInformationViewController__setState___block_invoke_3;
      aBlock[3] = &unk_1E59DAF18;
      aBlock[4] = self;
      id v28 = v20;
      id v48 = v28;
      v29 = _Block_copy(aBlock);
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      v43 = __55__PKAddBankAccountInformationViewController__setState___block_invoke_6;
      objc_super v44 = &unk_1E59CAD18;
      v45 = self;
      id v30 = v29;
      id v46 = v30;
      [(PKAddBankAccountInformationViewController *)self _updateBankAccountInformationWithValues:v27 completion:&v41];
    }
    else
    {
      v31 = (void *)MEMORY[0x1E4FB1418];
      v32 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_5.isa);
      v33 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_6.isa);
      id v28 = [v31 alertControllerWithTitle:v32 message:v33 preferredStyle:1];

      v34 = (void *)MEMORY[0x1E4FB1410];
      v35 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_7.isa);
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __55__PKAddBankAccountInformationViewController__setState___block_invoke_2;
      v49[3] = &unk_1E59CB1F0;
      v49[4] = self;
      v36 = [v34 actionWithTitle:v35 style:0 handler:v49];
      [v28 addAction:v36];

      [(PKAddBankAccountInformationViewController *)self presentViewController:v28 animated:1 completion:0];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [(PKAddBankAccountInformationViewController *)self _updateHeaderAndNavigationItems];
    [(PKAddBankAccountInformationViewController *)self _setTableFooterView];
    [(PKAddBankAccountInformationViewController *)self _reloadTableSection];
  }
  v37 = [(PKPaymentSetupTableViewController *)self dockView];
  v38 = [v37 footerView];
  [v38 setSecondaryActionButton:0];

  uint64_t v39 = [(PKAddBankAccountInformationViewController *)self navigationItem];
  v40 = [v39 rightBarButtonItem];
  objc_msgSend(v40, "setEnabled:", -[PKAddBankAccountInformationViewController _cellValuesAreValid](self, "_cellValuesAreValid"));
}

void __55__PKAddBankAccountInformationViewController__setState___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v8 = [v6 objectForKey:@"PKAddBankAccountAccountNumberKey"];
  BOOL v7 = [v6 objectForKey:@"PKAddBankAccountRoutingNumberKey"];

  [*(id *)(a1 + 32) addObject:v8];
  [*(id *)(a1 + 40) addObject:v7];
  if ([*(id *)(a1 + 32) count] != 1 || objc_msgSend(*(id *)(a1 + 40), "count") != 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __55__PKAddBankAccountInformationViewController__setState___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1168) removeAllObjects];
  [*(id *)(a1 + 32) _setText:0 forForCellAtRow:1];
  [*(id *)(a1 + 32) _setText:0 forForCellAtRow:0];
  v2 = *(void **)(a1 + 32);

  return [v2 _setState:1];
}

void __55__PKAddBankAccountInformationViewController__setState___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PKAddBankAccountInformationViewController__setState___block_invoke_4;
  void v10[3] = &unk_1E59CB8B0;
  BOOL v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v5;
  id v13 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __55__PKAddBankAccountInformationViewController__setState___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _hideHeaderActivitySpinner];
  v2 = *(id **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    if (v2[149])
    {
      unint64_t v4 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v3, [v2[149] feature], 0, 0);
      id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      [*(id *)(*(void *)(a1 + 32) + 1168) removeAllObjects];
      [*(id *)(a1 + 32) _setState:1];
      [*(id *)(a1 + 32) _updateHeaderAndNavigationItems];
      [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];

      v2 = *(id **)(a1 + 32);
    }
    [v2 _setContentHidden:0];
    [*(id *)(a1 + 32) _setNavigationBarItemsHidden:0];
    id v6 = *(void **)(a1 + 56);
    [v6 setUserInteractionEnabled:1];
  }
  else
  {
    [v2 _addToBankCredentialCenter];
    BOOL v7 = *(void **)(a1 + 48);
    if (v7 && [v7 verificationType] == 2)
    {
      id v12 = [[PKApplyVerificationTrialDepositViewController alloc] initWithSetupDelegate:*(void *)(a1 + 32) context:0 verificationPage:*(void *)(a1 + 48) account:*(void *)(*(void *)(a1 + 32) + 1192)];
      id v8 = [*(id *)(a1 + 32) navigationController];
      [v8 pushViewController:v12 animated:1];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 1096) setTitleAccessoriesEnabled:1];
      [*(id *)(*(void *)(a1 + 32) + 1096) showCheckmark:1 animated:1];
      if (*(unsigned char *)(*(void *)(a1 + 32) + 1176)) {
        id v9 = @"PEER_PAYMENT_BANK_DONE";
      }
      else {
        id v9 = @"PEER_PAYMENT_BANK_INFO_ADDED";
      }
      uint64_t v10 = PKLocalizedPeerPaymentString(&v9->isa);
      [*(id *)(a1 + 32) setHeaderViewTitle:v10 subtitle:&stru_1EF1B5B50];
      dispatch_time_t v11 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__PKAddBankAccountInformationViewController__setState___block_invoke_5;
      block[3] = &unk_1E59CA7D0;
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v11, MEMORY[0x1E4F14428], block);
    }
  }
}

void __55__PKAddBankAccountInformationViewController__setState___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1216));
  [WeakRetained bankAccountInformationViewControllerChangedBankAccountInformation:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) cancel:0];
}

uint64_t __55__PKAddBankAccountInformationViewController__setState___block_invoke_6(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 1120) type] == 1)
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 _addPaymentFundingSourceWithCompletion:v3];
  }
  else
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
}

- (void)_reloadTableSection
{
  uint64_t v3 = [(PKPaymentSetupTableViewController *)self tableView];
  unint64_t v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v3 reloadSections:v4 withRowAnimation:2];

  id v6 = [(NSMutableDictionary *)self->_cells objectForKey:&unk_1EF2B98D0];
  id v5 = [v6 editableTextField];
  [v5 becomeFirstResponder];
}

- (id)_bankInformationTextForRow:(unint64_t)a3
{
  userEnteredValues = self->_userEnteredValues;
  id v6 = [NSNumber numberWithUnsignedInteger:self->_state];
  BOOL v7 = [(NSMutableDictionary *)userEnteredValues objectForKey:v6];

  if (!a3)
  {
    id v8 = @"PKAddBankAccountRoutingNumberKey";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v8 = @"PKAddBankAccountAccountNumberKey";
LABEL_5:
    id v9 = [v7 objectForKey:v8];
    goto LABEL_7;
  }
  id v9 = 0;
LABEL_7:
  if (self->_state == 1 && [v9 length] || self->_prefilledFromKeychain)
  {
    uint64_t v10 = PKSanitizedBankAccountNumber();

    id v9 = (void *)v10;
  }

  return v9;
}

- (id)_textForRow:(unint64_t)a3
{
  if (!a3)
  {
    id v5 = @"PEER_PAYMENT_BANK_INFO_ROUTING_NUMBER_FIELD_TITLE";
LABEL_5:
    id v6 = -[PKAddBankAccountInformationViewController _countrySpecificLocalizedStringKeyForKey:](self, "_countrySpecificLocalizedStringKeyForKey:", v5, v3);
    return v6;
  }
  if (a3 == 1)
  {
    id v5 = @"PEER_PAYMENT_BANK_INFO_ACCOUNT_NUMBER_FIELD_TITLE";
    goto LABEL_5;
  }
  id v6 = 0;
  return v6;
}

- (id)_placeholderTextForRow:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = [(PKAddBankAccountInformationViewController *)self _countrySpecificLocalizedStringKeyForKey:@"PEER_PAYMENT_BANK_INFO_ACCOUNT_NUMBER_FIELD_PLACEHOLDER" minDigits:4 maxDigits:17];
  }
  else if (a3)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(PKAddBankAccountInformationViewController *)self _countrySpecificLocalizedStringKeyForKey:@"PEER_PAYMENT_BANK_INFO_ROUTING_NUMBER_FIELD_PLACEHOLDER" numberOfDigits:9];
  }

  return v3;
}

- (void)_showHeaderActivitySpinner
{
  PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_14.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(PKAddBankAccountInformationViewController *)self _setTableViewHeaderActivitySpinnerAnimated:1 title:v3 subtitle:&stru_1EF1B5B50];
}

- (void)_hideHeaderActivitySpinner
{
}

- (void)_setTableViewHeaderActivitySpinnerAnimated:(BOOL)a3 title:(id)a4 subtitle:(id)a5
{
  BOOL v6 = a3;
  BOOL v8 = !a3;
  id v9 = a5;
  id v11 = a4;
  uint64_t v10 = [(PKAddBankAccountInformationViewController *)self view];
  [v10 setUserInteractionEnabled:v8];

  [(PKAddBankAccountInformationViewController *)self _setNavigationBarEnabled:v8];
  if (!v8) {
    [(PKAddBankAccountInformationViewController *)self _setContentHidden:1];
  }
  if ([(PKCollapsibleHeaderView *)self->_headerView showSpinner] != v6) {
    [(PKCollapsibleHeaderView *)self->_headerView setTitleAccessoriesEnabled:v6];
  }
  [(PKCollapsibleHeaderView *)self->_headerView setShowSpinner:v6];
  [(PKAddBankAccountInformationViewController *)self setHeaderViewTitle:v11 subtitle:v9];
  [(PKAddBankAccountInformationViewController *)self _setIdleTimerDisabled:v6 title:v11 subtitle:v9];
}

- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4
{
  [(PKCollapsibleHeaderView *)self->_headerView setTitle:a3 subtitle:a4];
  id v10 = [(PKPaymentSetupTableViewController *)self tableView];
  headerView = self->_headerView;
  [v10 bounds];
  -[PKCollapsibleHeaderView sizeThatFits:](headerView, "sizeThatFits:", v6, 1.79769313e308);
  double v8 = v7;
  id v9 = self->_headerView;
  [v10 _rectForTableHeaderView];
  -[PKCollapsibleHeaderView setFrame:](v9, "setFrame:");
  [v10 _tableHeaderHeightDidChangeToHeight:v8];
  [(PKCollapsibleHeaderView *)self->_headerView setNeedsLayout];
}

- (void)_setContentHidden:(BOOL)a3
{
  if (self->_shouldHideContent != a3)
  {
    self->_shouldHideContent = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __63__PKAddBankAccountInformationViewController__setContentHidden___block_invoke;
    v3[3] = &unk_1E59CA7D0;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
  }
}

uint64_t __63__PKAddBankAccountInformationViewController__setContentHidden___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  id v3 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v2 reloadSections:v3 withRowAnimation:5];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _setTableFooterView];
}

- (void)_setIdleTimerDisabled:(BOOL)a3 title:(id)a4 subtitle:(id)a5
{
  BOOL v6 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"enabled";
    int v12 = 138413058;
    if (v6) {
      id v10 = @"disabled";
    }
    id v13 = v10;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = @"PKAddBankAccountInformation";
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Payment Setup has %@ the Idle Timer. (For: %@ - %@) - %@.", (uint8_t *)&v12, 0x2Au);
  }

  id v11 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v11 _setIdleTimerDisabled:v6 forReason:@"PKAddBankAccountInformation"];
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PKAddBankAccountInformationViewController *)self navigationController];
  id v5 = [v10 navigationBar];
  [v5 setUserInteractionEnabled:v3];

  BOOL v6 = [v10 interactivePopGestureRecognizer];
  [v6 setEnabled:v3];

  id v7 = [(PKAddBankAccountInformationViewController *)self navigationItem];
  id v8 = v7;
  BOOL v9 = !v3 || self->_state == 3;
  [v7 setHidesBackButton:v9 animated:1];
}

- (void)_setNavigationBarItemsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(PKAddBankAccountInformationViewController *)self navigationItem];
  if (v3)
  {
    [v9 setLeftBarButtonItem:0];
    [v9 setRightBarButtonItem:0];
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
    [v9 setLeftBarButtonItem:v5];
    id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v7 = PKLocalizedPaymentString(&cfstr_Next.isa);
    id v8 = (void *)[v6 initWithTitle:v7 style:2 target:self action:sel_next_];

    [v9 setRightBarButtonItem:v8];
  }
}

- (void)_deleteBankInformation
{
  BOOL v3 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v4 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_4.isa);
  id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_15.isa);
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_16.isa);
  id v9 = [v7 actionWithTitle:v8 style:1 handler:0];
  [v6 addAction:v9];

  id v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_17.isa);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PKAddBankAccountInformationViewController__deleteBankInformation__block_invoke;
  v13[3] = &unk_1E59CB1F0;
  v13[4] = self;
  int v12 = [v10 actionWithTitle:v11 style:2 handler:v13];
  [v6 addAction:v12];

  [(PKAddBankAccountInformationViewController *)self presentViewController:v6 animated:1 completion:0];
}

void __67__PKAddBankAccountInformationViewController__deleteBankInformation__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1120) deleteAllBankInformation];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1216));
  [WeakRetained bankAccountInformationViewControllerChangedBankAccountInformation:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_updateBankAccountInformationWithValues:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectForKey:@"PKAddBankAccountAccountNumberKey"];
  id v9 = [v7 objectForKey:@"PKAddBankAccountRoutingNumberKey"];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke;
  aBlock[3] = &unk_1E59DAF40;
  aBlock[4] = self;
  id v10 = v9;
  id v27 = v10;
  id v11 = v8;
  id v28 = v11;
  id v12 = v6;
  id v29 = v12;
  id v13 = _Block_copy(aBlock);
  if (self->_featureAccount)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F842F0]);
    [v14 setCountryCode:self->_accountCountryCode];
    [v14 setQuery:v10];
    id v15 = [(PKAccount *)self->_featureAccount accountBaseURL];
    [v14 setBaseURL:v15];

    id v16 = [MEMORY[0x1E4F84D50] sharedService];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke_2;
    v22[3] = &unk_1E59DAF68;
    id v23 = v10;
    int v24 = self;
    id v25 = v13;
    id v17 = v13;
    [v16 accountBankLookupWithRequest:v14 completion:v22];
  }
  else
  {
    id v14 = [MEMORY[0x1E4F84E10] sharedService];
    accountCountryCode = self->_accountCountryCode;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke_193;
    v19[3] = &unk_1E59DAF90;
    id v20 = v10;
    id v21 = v13;
    id v16 = v13;
    [v14 peerPaymentBankLookupWithCountryCode:accountCountryCode query:v20 completion:v19];

    id v17 = v20;
  }
}

uint64_t __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void **)(a1[4] + 1120);
  id v5 = a2;
  [v4 setRoutingNumber:v3];
  [*(id *)(a1[4] + 1120) setAccountNumber:a1[6]];
  [*(id *)(a1[4] + 1120) setBankName:v5];

  uint64_t result = a1[7];
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = [v5 success];
  if (v6 || (v7 & 1) == 0)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[4];
      int v14 = 138412546;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Error looking up bank name with query: %@, error: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  id v10 = [v5 displayName];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    [*(id *)(a1[5] + 1192) feature];
    PKLocalizedFeatureString();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v13 = v12;

  (*(void (**)(void))(a1[6] + 16))();
}

void __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = [v5 success];
  if (v6 || (v7 & 1) == 0)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Error looking up bank name with query: %@, error: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v10 = [v5 displayName];
  if (v10) {
    [v5 displayName];
  }
  else {
  id v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_18.isa);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_addPaymentFundingSourceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F84D50] sharedService];
  id v6 = objc_alloc_init(MEMORY[0x1E4F84300]);
  [v6 setDestination:2];
  char v7 = [(PKAccount *)self->_featureAccount accountBaseURL];
  [v6 setBaseURL:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke;
  void v10[3] = &unk_1E59DB080;
  v10[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [v9 accountServiceCertificatesWithRequest:v6 completion:v10];
}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__47;
    v21[4] = __Block_byref_object_dispose__47;
    id v22 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__47;
    void v19[4] = __Block_byref_object_dispose__47;
    id v20 = 0;
    if ([*(id *)(*(void *)(a1 + 32) + 1192) type] == 4)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_200;
      v18[3] = &unk_1E59DAFE0;
      v18[4] = v21;
      [v8 addOperation:v18];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_3;
      v17[3] = &unk_1E59CDD98;
      v17[4] = *(void *)(a1 + 32);
      v17[5] = v19;
      [v8 addOperation:v17];
    }
    id v9 = [MEMORY[0x1E4F1CA98] null];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_5;
    v11[3] = &unk_1E59DB058;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    id v15 = v21;
    uint64_t v16 = v19;
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    id v10 = (id)[v8 evaluateWithInput:v9 completion:v11];

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v21, 8);
  }
}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_200(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F84D50] sharedService];
  id v9 = [v8 targetDevice];
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_2;
    void v10[3] = &unk_1E59DAFB8;
    uint64_t v13 = *(void *)(a1 + 32);
    id v12 = v7;
    id v11 = v6;
    [v9 paymentWebService:v8 deviceMetadataWithFields:251 completion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(*(void *)(a1 + 32) + 1200);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_4;
  v12[3] = &unk_1E59DB008;
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v9;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v8 waitForAssessmentWithCompletion:v12];
}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1192) accountIdentifier];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F84218]) initWithType:1];
  id v4 = objc_alloc_init(MEMORY[0x1E4F84210]);
  [v4 setAccountIdentifier:v2];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1120) bankName];
  [v4 setName:v5];

  id v6 = [*(id *)(*(void *)(a1 + 32) + 1120) accountNumber];
  [v4 setAccountNumber:v6];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 1120) routingNumber];
  [v4 setRoutingNumber:v7];

  [v3 setFundingDetails:v4];
  id v8 = objc_alloc_init(MEMORY[0x1E4F842E0]);
  [v8 setAccountIdentifier:v2];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1192) accountBaseURL];
  [v8 setBaseURL:v9];

  [v8 setFundingSource:v3];
  [v8 setCertificatesResponse:*(void *)(a1 + 40)];
  id v10 = [*(id *)(*(void *)(a1 + 32) + 1192) addFundingSourceFeatureDescriptor];
  id v11 = [v10 fundingSourceTermsIdentifier];
  [v8 setFundingSourceTermsIdentifier:v11];

  [v8 setDeviceMetadata:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [v8 setOdiAssessment:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_6;
  v13[3] = &unk_1E59DB030;
  v13[4] = *(void *)(a1 + 32);
  id v12 = *(void **)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  [v12 addFundingSourceWithRequest:v8 completion:v13];
}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v26 = a2;
  id v5 = a3;
  if (!v26 || v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1216));
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1216));
      [v24 addBankAccountInformationViewController:*(void *)(a1 + 32) didFailWithError:v5];
    }
    uint64_t v25 = *(void *)(a1 + 40);
    id v6 = [v26 confirmationPage];
    (*(void (**)(uint64_t, void *, id))(v25 + 16))(v25, v6, v5);
  }
  else
  {
    id v6 = [v26 fundingSource];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 1192);
    if (v8)
    {
      uint64_t v9 = [v8 accountIdentifier];
      id v10 = [v6 identifier];
      PKSetLastBankAccountIdentifierForAccountTransfer();

      uint64_t v7 = *(void *)(a1 + 32);
    }
    id v11 = objc_loadWeakRetained((id *)(v7 + 1216));
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1216));
      [v13 addBankAccountInformationViewController:*(void *)(a1 + 32) didAddFundingSource:v6];
    }
    id v14 = *(void **)(*(void *)(a1 + 32) + 1200);
    if (v14) {
      [v14 provideSessionFeedbackIngested];
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F84550]);
    [v15 updateToLatestKeychainData];
    if (([v15 isValid] & 1) == 0)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F84550]);
      id v17 = [*(id *)(*(void *)(a1 + 32) + 1120) accountNumber];
      [v16 setAccountNumber:v17];

      uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 1120) routingNumber];
      [v16 setRoutingNumber:v18];

      id v19 = [*(id *)(*(void *)(a1 + 32) + 1120) bankName];
      [v16 setBankName:v19];
    }
    uint64_t v20 = *(void *)(a1 + 40);
    id v21 = [v26 confirmationPage];
    (*(void (**)(uint64_t, void *, void))(v20 + 16))(v20, v21, 0);
  }
}

- (void)_addToBankCredentialCenter
{
  if (self->_saveToBankCredentialCenter) {
    [(FKWalletBankCredentialImporter *)self->_fkCredentialImporter insertBankCredentialFromBankInformation:self->_bankInformation completion:&__block_literal_global_176];
  }
}

void __71__PKAddBankAccountInformationViewController__addToBankCredentialCenter__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Failed to insert bank credential from bank information: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (id)_headerSubTitle
{
  unint64_t state = self->_state;
  if (state == 1)
  {
    uint64_t v3 = @"PEER_PAYMENT_BANK_INFO_COMPLETE_ACCOUNT_INFO";
    goto LABEL_5;
  }
  if (state == 2)
  {
    uint64_t v3 = @"PEER_PAYMENT_BANK_INFO_CONFIRM_ACCOUNT_NUMBER";
LABEL_5:
    PKLocalizedPeerPaymentString(&v3->isa);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  int v4 = &stru_1EF1B5B50;
LABEL_7:

  return v4;
}

- (void)_updateHeaderAndNavigationItems
{
  uint64_t v3 = [(PKAddBankAccountInformationViewController *)self _headerTitle];
  int v4 = [(PKAddBankAccountInformationViewController *)self _headerSubTitle];
  [(PKAddBankAccountInformationViewController *)self setHeaderViewTitle:v3 subtitle:v4];

  id v6 = [(PKAddBankAccountInformationViewController *)self navigationItem];
  id v5 = [v6 rightBarButtonItem];
  objc_msgSend(v5, "setEnabled:", -[PKAddBankAccountInformationViewController _cellValuesAreValid](self, "_cellValuesAreValid"));
}

- (id)_headerTitle
{
  if (self->_isEditingBankInformation) {
    id v2 = @"PEER_PAYMENT_PERFORM_ACTION_EDIT_BANK_ACCOUNT";
  }
  else {
    id v2 = @"PEER_PAYMENT_PERFORM_ACTION_ADD_BANK_ACCOUNT";
  }
  uint64_t v3 = PKLocalizedPeerPaymentString(&v2->isa);

  return v3;
}

- (id)_footerView
{
  footerView = self->_footerView;
  if (!footerView)
  {
    objc_initWeak(&location, self);
    int v4 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __56__PKAddBankAccountInformationViewController__footerView__block_invoke;
    id v19 = &unk_1E59CBEE0;
    objc_copyWeak(&v20, &location);
    id v5 = [v4 actionWithHandler:&v16];
    id v6 = [PKFindBankAccountInformationFooterView alloc];
    uint64_t v7 = -[PKFindBankAccountInformationFooterView initWithFrame:action:](v6, "initWithFrame:action:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v16, v17, v18, v19);
    id v8 = self->_footerView;
    self->_footerView = v7;

    uint64_t v9 = self->_footerView;
    id v10 = [(PKPaymentSetupTableViewController *)self tableView];
    [v10 bounds];
    -[PKFindBankAccountInformationFooterView sizeThatFits:](v9, "sizeThatFits:", CGRectGetWidth(v23), 3.40282347e38);
    double v12 = v11;
    double v14 = v13;

    -[PKFindBankAccountInformationFooterView setFrame:](self->_footerView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v12, v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    footerView = self->_footerView;
  }

  return footerView;
}

void __56__PKAddBankAccountInformationViewController__footerView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  int v4 = [v3 sender];

  [WeakRetained _showHowToFindAccountInformationViewController:v4];
}

- (void)_showHowToFindAccountInformationViewController:(id)a3
{
  double v12 = [[PKExplanationViewController alloc] initWithContext:0];
  int v4 = [(PKExplanationViewController *)v12 explanationView];
  id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_21.isa);
  [v4 setTitleText:v5];

  id v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_22.isa);
  [v4 setBodyText:v6];

  uint64_t v7 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB2788], 2, 0);
  [v4 setTitleFont:v7];
  [v4 setBodyTextAlignment:4];
  [(PKExplanationViewController *)v12 setShowDoneButton:1];
  [(PKExplanationViewController *)v12 setShowCancelButton:0];
  [v4 setShowPrivacyView:0];
  id v8 = [v4 dockView];
  [v8 setPrimaryButton:0];

  uint64_t v9 = PKUIImageNamed(@"CheckInfo");
  [v4 setImage:v9];

  id v10 = [[PKNavigationController alloc] initWithRootViewController:v12];
  [(PKNavigationController *)v10 setSupportedInterfaceOrientations:2];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v10 setModalPresentationStyle:2];
  }
  double v11 = [(PKAddBankAccountInformationViewController *)self navigationController];
  [v11 presentViewController:v10 animated:1 completion:0];
}

- (unint64_t)_minTextLengthForRow:(unint64_t)a3
{
  if (a3) {
    return 4 * (a3 == 1);
  }
  else {
    return 9;
  }
}

- (unint64_t)_maxTextLengthForRow:(unint64_t)a3
{
  unint64_t v3 = 17;
  if (a3 != 1) {
    unint64_t v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return 9;
  }
}

- (id)_countrySpecificLocalizedStringKeyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [v4 stringByAppendingFormat:@"_%@", self->_accountCountryCode];
  id v6 = PKLocalizedPeerPaymentString(v5);

  if (!v6)
  {
    uint64_t v7 = [v4 stringByAppendingString:@"_DEFAULT"];
    id v6 = PKLocalizedPeerPaymentString(v7);
  }

  return v6;
}

- (id)_countrySpecificLocalizedStringKeyForKey:(id)a3 numberOfDigits:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F28EE0];
  uint64_t v7 = NSNumber;
  id v8 = a3;
  uint64_t v9 = [v7 numberWithUnsignedInteger:a4];
  id v10 = [v6 localizedStringFromNumber:v9 numberStyle:0];

  double v11 = [(PKAddBankAccountInformationViewController *)self _countrySpecificLocalizedStringKeyForKey:v8];

  double v12 = PKStringWithValidatedFormat();

  return v12;
}

- (id)_countrySpecificLocalizedStringKeyForKey:(id)a3 minDigits:(unint64_t)a4 maxDigits:(unint64_t)a5
{
  id v8 = (void *)MEMORY[0x1E4F28EE0];
  uint64_t v9 = NSNumber;
  id v10 = a3;
  double v11 = [v9 numberWithUnsignedInteger:a4];
  double v12 = [v8 localizedStringFromNumber:v11 numberStyle:0];

  double v13 = (void *)MEMORY[0x1E4F28EE0];
  double v14 = [NSNumber numberWithUnsignedInteger:a5];
  id v15 = [v13 localizedStringFromNumber:v14 numberStyle:0];

  uint64_t v16 = [(PKAddBankAccountInformationViewController *)self _countrySpecificLocalizedStringKeyForKey:v10];

  uint64_t v17 = PKStringWithValidatedFormat();

  return v17;
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
}

- (BOOL)saveToBankCredentialCenter
{
  return self->_saveToBankCredentialCenter;
}

- (void)setSaveToBankCredentialCenter:(BOOL)a3
{
  self->_saveToBankCredentialCenter = a3;
}

- (BOOL)showDeleteButton
{
  return self->_showDeleteButton;
}

- (void)setShowDeleteButton:(BOOL)a3
{
  self->_showDeleteButton = a3;
}

- (BOOL)offerKeychainPreFill
{
  return self->_offerKeychainPreFill;
}

- (void)setOfferKeychainPreFill:(BOOL)a3
{
  self->_offerKeychainPreFill = a3;
}

- (PKAddBankAccountInformationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAddBankAccountInformationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assessmentManager, 0);
  objc_storeStrong((id *)&self->_featureAccount, 0);
  objc_storeStrong((id *)&self->_cellHasPastedContent, 0);
  objc_storeStrong((id *)&self->_userEnteredValues, 0);
  objc_storeStrong((id *)&self->_accountCountryCode, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_cellPlaceholderText, 0);
  objc_storeStrong((id *)&self->_cellText, 0);
  objc_storeStrong((id *)&self->_fkCredentialImporter, 0);
  objc_storeStrong((id *)&self->_bankInformation, 0);
  objc_storeStrong((id *)&self->_footerView, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end