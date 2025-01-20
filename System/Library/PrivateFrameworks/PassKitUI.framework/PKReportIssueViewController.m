@interface PKReportIssueViewController
+ (BOOL)canReportIssueForTransaction:(id)a3 bankConnectInstitution:(id)a4 paymentPass:(id)a5;
+ (BOOL)canSelectIssueTypeForTransaction:(id)a3;
- (BOOL)_issueTypeEnabled:(int64_t)a3;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKReportIssueViewController)initWithTransaction:(id)a3 transactionSourceCollection:(id)a4 paymentPass:(id)a5 familyCollection:(id)a6 account:(id)a7 accountUserCollection:(id)a8 bankConnectInstitution:(id)a9 physicalCards:(id)a10 detailViewStyle:(int64_t)a11 context:(unint64_t)a12;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_commentsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_createPrivacyFooterViewForContext:(unint64_t)a3;
- (id)_disputeTypeCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_formattedStatementNameFromRawName:(id)a3;
- (id)_issueTypeCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_mapsIssueCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_reportComments;
- (id)_statementName;
- (id)_statementNameCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_transactionCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)_issueTypeForRowIndex:(int64_t)a3;
- (int64_t)_rowIndexForIssueType:(int64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_numberOfIssueTypesEnabled;
- (void)_cancelButtonTapped:(id)a3;
- (void)_cancelPayment;
- (void)_handleDisputeTypeSelectedInTableView:(id)a3 atIndexPath:(id)a4;
- (void)_handleIssueTypeSelectedInTableView:(id)a3 atIndexPath:(id)a4;
- (void)_handleMapsIssueTypeSelectedInTableView:(id)a3 atIndexPath:(id)a4;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 dismissAfter:(BOOL)a5;
- (void)_reportBankConnectIssueToMaps;
- (void)_reportIssueInBusinessChat;
- (void)_reportIssueToMaps;
- (void)_reprocessTransactionMerchantWithIssueReportIdentifier:(id)a3 completion:(id)a4;
- (void)_resetMapsMerchantAndBrandWithIssueReportIdentifier:(id)a3 completion:(id)a4;
- (void)_submitBankConnectTicketToMaps:(id)a3 withCorrelationId:(id)a4;
- (void)_submitButtonTapped:(id)a3;
- (void)_updateNavigationButtons;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKReportIssueViewController

+ (BOOL)canReportIssueForTransaction:(id)a3 bankConnectInstitution:(id)a4 paymentPass:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  int v9 = [a4 problemReportingEnabled];
  int v10 = [v7 bankConnectTransactionWasClassifiedByMaps];
  if ([v7 isBankConnectTransaction] && (v9 & v10) == 0
    || [v8 associatedAccountFeatureIdentifier] == 4)
  {
    char v11 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    do
    {
      char v11 = PKPaymentTransactionSupportsIssueType(v13, v7, v8);
      if (v11) {
        break;
      }
    }
    while (v13++ != 5);
  }

  return v11;
}

+ (BOOL)canSelectIssueTypeForTransaction:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 transactionType];
  BOOL v5 = 1;
  if (v4 <= 0x16)
  {
    if (((1 << v4) & 0x7FFBFC) != 0) {
      goto LABEL_3;
    }
    if (v4 != 10) {
      goto LABEL_4;
    }
    if (!+[PKBusinessChatController deviceSupportsBusinessChat])
    {
LABEL_3:
      BOOL v5 = 0;
    }
    else
    {
      id v7 = [v3 payments];
      id v8 = [v7 firstObject];

      if ([v8 isCurrentlyCancellable]) {
        BOOL v5 = [v3 transactionStatus] != 5;
      }
      else {
        BOOL v5 = 0;
      }
    }
  }
LABEL_4:

  return v5;
}

- (PKReportIssueViewController)initWithTransaction:(id)a3 transactionSourceCollection:(id)a4 paymentPass:(id)a5 familyCollection:(id)a6 account:(id)a7 accountUserCollection:(id)a8 bankConnectInstitution:(id)a9 physicalCards:(id)a10 detailViewStyle:(int64_t)a11 context:(unint64_t)a12
{
  id v45 = a3;
  id v44 = a4;
  id v43 = a5;
  id v42 = a6;
  id v41 = a7;
  id v40 = a8;
  id v39 = a9;
  id v19 = a10;
  v46.receiver = self;
  v46.super_class = (Class)PKReportIssueViewController;
  v20 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v46, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 6);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_transaction, a3);
    objc_storeStrong((id *)&v21->_transactionSourceCollection, a4);
    p_paymentPass = (void **)&v21->_paymentPass;
    objc_storeStrong((id *)&v21->_paymentPass, a5);
    objc_storeStrong((id *)&v21->_account, a7);
    objc_storeStrong((id *)&v21->_accountUserCollection, a8);
    objc_storeStrong((id *)&v21->_bankConnectInstitution, a9);
    v23 = (FKPIIStringProcessor *)objc_alloc_init(MEMORY[0x1E4F26BF0]);
    bankConnectPIIStringProcessor = v21->_bankConnectPIIStringProcessor;
    v21->_bankConnectPIIStringProcessor = v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v21];
    paymentService = v21->_paymentService;
    v21->_paymentService = (PKPaymentService *)v25;

    v27 = [[PKPaymentTransactionCellController alloc] initWithContactResolver:0];
    transactionCellController = v21->_transactionCellController;
    v21->_transactionCellController = v27;

    objc_storeStrong((id *)&v21->_familyCollection, a6);
    uint64_t v29 = [v19 copy];
    physicalCards = v21->_physicalCards;
    v21->_physicalCards = (NSSet *)v29;

    v21->_context = a12;
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v21 action:sel__cancelButtonTapped_];
    cancelButton = v21->_cancelButton;
    v21->_cancelButton = (UIBarButtonItem *)v31;

    uint64_t v33 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v21 action:sel__submitButtonTapped_];
    submitButton = v21->_submitButton;
    v21->_submitButton = (UIBarButtonItem *)v33;

    v35 = [(PKReportIssueViewController *)v21 navigationItem];
    objc_msgSend(v35, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v35, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    if (a12 != 1) {
      [v35 setLeftBarButtonItem:v21->_cancelButton];
    }
    objc_msgSend(v35, "setRightBarButtonItem:", v21->_submitButton, a6, v39, v40, v41, v42, v43, v44);
    v36 = PKLocalizedPaymentString(&cfstr_TransactionDet_20.isa);
    [v35 setTitle:v36];

    v21->_canPerformUnrecognizedTransaction = PKPaymentTransactionSupportsIssueType(1, v45, *p_paymentPass);
    v21->_canPerformDispute = PKPaymentTransactionSupportsIssueType(0, v45, *p_paymentPass);
    v21->_canPerformOther = PKPaymentTransactionSupportsIssueType(5, v45, *p_paymentPass);
    v21->_canPerformIncorrectMerchant = PKPaymentTransactionSupportsIssueType(2, v45, *p_paymentPass);
    v21->_canPerformCancelAccountServicePayment = PKPaymentTransactionSupportsIssueType(3, v45, *p_paymentPass);
    if (a12 == 1)
    {
      v21->_selectedIssue = 2;
      v21->_hasIssueSelected = 1;
    }
    if ([(PKReportIssueViewController *)v21 _numberOfIssueTypesEnabled] == 1
      && !v21->_hasIssueSelected)
    {
      int64_t v37 = 0;
      while (![(PKReportIssueViewController *)v21 _issueTypeEnabled:v37])
      {
        if (++v37 == 6) {
          goto LABEL_13;
        }
      }
      v21->_selectedIssue = v37;
      v21->_hasIssueSelected = 1;
    }
LABEL_13:
    [(PKReportIssueViewController *)v21 _updateNavigationButtons];
  }
  return v21;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKReportIssueViewController;
  [(PKSectionTableViewController *)&v5 viewDidLoad];
  id v3 = [(PKReportIssueViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKReportIssueCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKTransactionCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKTransactionCommentsCellReuseIdentifier"];
  if (self->_context != 1
    && [(PKAccount *)self->_account feature] == 2
    && !+[PKReportIssueViewController canSelectIssueTypeForTransaction:self->_transaction])
  {
    self->_selectedIssue = 5;
    self->_hasIssueSelected = 1;
    [(PKReportIssueViewController *)self _reportIssueInBusinessChat];
  }
  unint64_t v4 = [(PKReportIssueViewController *)self view];
  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85900]];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKReportIssueViewController;
  [(PKReportIssueViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKReportIssueViewController *)self tableView];
  unint64_t v4 = [(PKReportIssueViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKReportIssueViewController *)self view];
  [v3 setNeedsLayout];
}

- (id)_createPrivacyFooterViewForContext:(unint64_t)a3
{
  unint64_t v4 = objc_msgSend(MEMORY[0x1E4F83AC8], "pk_privacyFlowForContext:", a3);
  if (v4)
  {
    objc_super v5 = PKLocalizedBankConnectString(&cfstr_BankConnectRap.isa);
    v6 = [v4 localizedButtonTitle];
    id v7 = v6;
    if (v5)
    {
      PKLocalizedBankConnectString(&cfstr_BankConnectRap_0.isa, &stru_1EF1B5770.isa, v5, v6);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = v6;
    }
    int v10 = v8;
    char v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = NSString;
    uint64_t v13 = [v4 identifier];
    v14 = [v12 stringWithFormat:@"onboarding:%@", v13];
    v15 = [v11 URLWithString:v14];

    int v9 = objc_alloc_init(PKFooterHyperlinkView);
    v16 = PKAttributedStringByAddingLinkToSubstring(v10, v7, v15);
    [(PKFooterHyperlinkView *)v9 setAttributedText:v16];

    v17 = PKGenericOnboardingPresenter(self, 0);
    v18 = PKOpenOnboardingHyperlinkAction(v17);
    [(PKFooterHyperlinkView *)v9 setAction:v18];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)_statementName
{
  v2 = [(PKPaymentTransaction *)self->_transaction merchant];
  id v3 = [v2 rawName];
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 name];
  }
  v6 = v5;

  return v6;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  unint64_t context = self->_context;
  BOOL v4 = context == 1;
  switch(a3)
  {
    case 0uLL:
      BOOL v6 = context == 1;
      return !v6;
    case 1uLL:
      id v7 = [(PKPaymentTransaction *)self->_transaction merchant];
      id v8 = [(PKReportIssueViewController *)self _statementName];
      if (!v8)
      {
        BOOL v4 = 0;
        goto LABEL_27;
      }
      int v9 = [v7 displayName];
      id v10 = v8;
      id v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {

LABEL_24:
        BOOL v4 = 0;
        goto LABEL_26;
      }
      BOOL v4 = context != 1;
      if (v11)
      {
        int v13 = [v10 isEqualToString:v11];

        if (!v13) {
          goto LABEL_26;
        }
        goto LABEL_24;
      }

LABEL_26:
LABEL_27:

      return v4;
    case 2uLL:
      if ([(PKReportIssueViewController *)self _numberOfIssueTypesEnabled]) {
        BOOL v6 = context == 1;
      }
      else {
        BOOL v6 = 1;
      }
      return !v6;
    case 3uLL:
      if (!self->_hasIssueSelected) {
        return 0;
      }
      if (self->_selectedIssue) {
        BOOL v6 = 1;
      }
      else {
        BOOL v6 = context == 1;
      }
      return !v6;
    case 4uLL:
    case 5uLL:
      if (self->_hasIssueSelected && self->_selectedIssue == 2) {
        return 1;
      }
      return v4;
    default:
      return 0;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]))
  {
    case 0uLL:
      uint64_t v8 = [(PKReportIssueViewController *)self _transactionCellForTableView:v6 atIndexPath:v7];
      goto LABEL_9;
    case 1uLL:
      uint64_t v8 = [(PKReportIssueViewController *)self _statementNameCellForTableView:v6 atIndexPath:v7];
      goto LABEL_9;
    case 2uLL:
      uint64_t v8 = [(PKReportIssueViewController *)self _issueTypeCellForTableView:v6 atIndexPath:v7];
      goto LABEL_9;
    case 3uLL:
      uint64_t v8 = [(PKReportIssueViewController *)self _disputeTypeCellForTableView:v6 atIndexPath:v7];
      goto LABEL_9;
    case 4uLL:
      uint64_t v8 = [(PKReportIssueViewController *)self _mapsIssueCellForTableView:v6 atIndexPath:v7];
      goto LABEL_9;
    case 5uLL:
      uint64_t v8 = [(PKReportIssueViewController *)self _commentsCellForTableView:v6 atIndexPath:v7];
LABEL_9:
      int v9 = (void *)v8;
      break;
    default:
      int v9 = 0;
      break;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unint64_t v4 = [(PKSectionTableViewController *)self sectionForIndex:a4] - 1;
  if (v4 > 4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = PKLocalizedPaymentString(&off_1E59DCBA8[v4]->isa);
  }

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unint64_t v7 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v6 section]);
  switch(v7)
  {
    case 4uLL:
      [(PKReportIssueViewController *)self _handleMapsIssueTypeSelectedInTableView:v8 atIndexPath:v6];
      break;
    case 3uLL:
      [(PKReportIssueViewController *)self _handleDisputeTypeSelectedInTableView:v8 atIndexPath:v6];
      break;
    case 2uLL:
      [(PKReportIssueViewController *)self _handleIssueTypeSelectedInTableView:v8 atIndexPath:v6];
      break;
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3)) - 2 <= 2
      && !self->_reportingIssue;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  unint64_t v4 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3));
  double result = *MEMORY[0x1E4FB2F28];
  if (v4 == 5) {
    return 200.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] == 5
    && [(PKPaymentTransaction *)self->_transaction isBankConnectTransaction])
  {
    id v5 = [(PKReportIssueViewController *)self _createPrivacyFooterViewForContext:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PKReportIssueViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __54__PKReportIssueViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  id obj = (id)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 32)];
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1160), obj);
    [*(id *)(a1 + 40) reloadSection:0];
  }
}

- (void)_handleIssueTypeSelectedInTableView:(id)a3 atIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  int64_t v7 = -[PKReportIssueViewController _issueTypeForRowIndex:](self, "_issueTypeForRowIndex:", [v6 row]);
  int64_t v8 = v7;
  if (self->_hasIssueSelected)
  {
    if (v7 == self->_selectedIssue) {
      goto LABEL_5;
    }
    int v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[PKReportIssueViewController _rowIndexForIssueType:](self, "_rowIndexForIssueType:"), -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 2));
    id v10 = [v13 cellForRowAtIndexPath:v9];

    [v10 setAccessoryType:0];
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[PKReportIssueViewController _rowIndexForIssueType:](self, "_rowIndexForIssueType:", v8), -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 2));
  v12 = [v13 cellForRowAtIndexPath:v11];

  [v12 setAccessoryType:3];
  self->_hasIssueSelected = 1;
  self->_selectedIssue = v8;
  self->_hasMapsIssueSelected = 0;
  self->_hasDisputeTypeSelected = 0;
  [(PKReportIssueViewController *)self _updateNavigationButtons];
  [(PKSectionTableViewController *)self updateSectionVisibilityAndReloadIfNecessaryForSections:&unk_1EF2BA1E8];

LABEL_5:
  [v13 deselectRowAtIndexPath:v6 animated:1];
}

- (void)_handleDisputeTypeSelectedInTableView:(id)a3 atIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 row];
  int64_t v8 = v7;
  if (self->_hasDisputeTypeSelected)
  {
    int64_t selectedDisputeType = self->_selectedDisputeType;
    if (v7 == selectedDisputeType) {
      goto LABEL_5;
    }
    id v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", selectedDisputeType, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 3));
    id v11 = [v14 cellForRowAtIndexPath:v10];

    [v11 setAccessoryType:0];
  }
  v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v8, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 3));
  id v13 = [v14 cellForRowAtIndexPath:v12];

  [v13 setAccessoryType:3];
  self->_hasDisputeTypeSelected = 1;
  self->_int64_t selectedDisputeType = v8;
  [(PKReportIssueViewController *)self _updateNavigationButtons];

LABEL_5:
  [v14 deselectRowAtIndexPath:v6 animated:1];
}

- (void)_handleMapsIssueTypeSelectedInTableView:(id)a3 atIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 row];
  int64_t v8 = v7;
  if (self->_hasMapsIssueSelected)
  {
    int64_t selectedMapsIssue = self->_selectedMapsIssue;
    if (v7 == selectedMapsIssue) {
      goto LABEL_5;
    }
    id v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", selectedMapsIssue, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 4));
    id v11 = [v14 cellForRowAtIndexPath:v10];

    [v11 setAccessoryType:0];
  }
  v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v8, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 4));
  id v13 = [v14 cellForRowAtIndexPath:v12];

  [v13 setAccessoryType:3];
  self->_hasMapsIssueSelected = 1;
  self->_int64_t selectedMapsIssue = v8;
  [(PKReportIssueViewController *)self _updateNavigationButtons];

LABEL_5:
  [v14 deselectRowAtIndexPath:v6 animated:1];
}

- (id)_transactionCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = [a3 dequeueReusableCellWithIdentifier:@"PKTransactionCellReuseIdentifier" forIndexPath:a4];
  transactionSourceCollection = self->_transactionSourceCollection;
  uint64_t v7 = [(PKPaymentTransaction *)self->_transaction transactionSourceIdentifier];
  int64_t v8 = [(PKTransactionSourceCollection *)transactionSourceCollection transactionSourceForTransactionSourceIdentifier:v7];

  int v9 = [(PKFamilyMemberCollection *)self->_familyCollection familyMemberForTransactionSource:v8];
  [(PKPaymentTransactionCellController *)self->_transactionCellController configureCell:v5 forTransaction:self->_transaction transactionSource:v8 familyMember:v9 account:self->_account detailStyle:0 deviceName:0 avatarViewDelegate:0];
  id v10 = [v5 transactionView];
  [v10 setShowsDisclosureView:0];

  return v5;
}

- (id)_statementNameCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = [a3 dequeueReusableCellWithIdentifier:@"PKReportIssueCellReuseIdentifier" forIndexPath:a4];
  if (!self->_statementName)
  {
    id v6 = [(PKReportIssueViewController *)self _statementName];
    uint64_t v7 = [(PKReportIssueViewController *)self _formattedStatementNameFromRawName:v6];
    int64_t v8 = [v7 uppercaseString];
    statementName = self->_statementName;
    self->_statementName = v8;
  }
  id v10 = [v5 textLabel];
  [v10 setText:self->_statementName];

  [v5 setAccessoryType:0];
  PKAccessibilityIDCellSet(v5, (void *)*MEMORY[0x1E4F85A48]);

  return v5;
}

- (id)_issueTypeCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"PKReportIssueCellReuseIdentifier" forIndexPath:v6];
  uint64_t v8 = [v6 row];

  unint64_t v9 = [(PKReportIssueViewController *)self _issueTypeForRowIndex:v8];
  unint64_t v10 = v9;
  if (v9 > 5)
  {
    id v13 = 0;
    v12 = 0;
  }
  else
  {
    id v11 = (id *)qword_1E59DCC00[v9];
    v12 = PKLocalizedPaymentString(&off_1E59DCBD0[v9]->isa);
    id v13 = *v11;
  }
  id v14 = [v7 textLabel];
  [v14 setText:v12];

  if (self->_hasIssueSelected)
  {
    if (self->_selectedIssue == v10) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  [v7 setAccessoryType:v15];
  PKAccessibilityIDCellSet(v7, v13);

  return v7;
}

- (id)_disputeTypeCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"PKReportIssueCellReuseIdentifier" forIndexPath:v6];
  unint64_t v8 = [v6 row];

  if (v8 > 3)
  {
    id v11 = 0;
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v9 = (id *)qword_1E59DCC50[v8];
    unint64_t v10 = PKLocalizedPaymentString(&off_1E59DCC30[v8]->isa);
    id v11 = *v9;
  }
  v12 = [v7 textLabel];
  [v12 setText:v10];

  if (self->_hasDisputeTypeSelected)
  {
    if (self->_selectedDisputeType == v8) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  [v7 setAccessoryType:v13];
  PKAccessibilityIDCellSet(v7, v11);

  return v7;
}

- (id)_mapsIssueCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"PKReportIssueCellReuseIdentifier" forIndexPath:v6];
  unint64_t v8 = [v6 row];

  if (v8 > 2)
  {
    id v11 = 0;
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v9 = (id *)qword_1E59DCC88[v8];
    unint64_t v10 = PKLocalizedPaymentString(&off_1E59DCC70[v8]->isa);
    id v11 = *v9;
  }
  v12 = [v7 textLabel];
  [v12 setText:v10];

  if (self->_hasMapsIssueSelected)
  {
    if (self->_selectedMapsIssue == v8) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  [v7 setAccessoryType:v13];
  PKAccessibilityIDCellSet(v7, v11);

  return v7;
}

- (id)_commentsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = [a3 dequeueReusableCellWithIdentifier:@"PKTransactionCommentsCellReuseIdentifier" forIndexPath:a4];
  id v6 = [v5 textView];
  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  unint64_t v8 = PKLocalizedPaymentString(&cfstr_TransactionDet_43.isa);
  unint64_t v9 = (void *)[v7 initWithString:v8];

  [v6 setAttributedPlaceholder:v9];
  [v6 setDelegate:self];
  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F853A0]];

  return v5;
}

- (id)_formattedStatementNameFromRawName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v3];
  id v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  [v5 setCharactersToBeSkipped:v6];
  id v15 = 0;
  int v7 = [v5 scanUpToCharactersFromSet:v6 intoString:&v15];
  id v8 = v15;
  unint64_t v9 = v8;
  if (v7)
  {
    do
    {
      if ([v9 length])
      {
        if ([v5 isAtEnd]) {
          unint64_t v10 = &stru_1EF1B5B50;
        }
        else {
          unint64_t v10 = @" ";
        }
        [v4 appendFormat:@"%@%@", v9, v10];
      }
      id v15 = v9;
      char v11 = [v5 scanUpToCharactersFromSet:v6 intoString:&v15];
      id v12 = v15;

      unint64_t v9 = v12;
    }
    while ((v11 & 1) != 0);
  }
  else
  {
    id v12 = v8;
  }
  uint64_t v13 = (void *)[v4 copy];

  return v13;
}

- (unint64_t)_numberOfIssueTypesEnabled
{
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  do
    v4 += [(PKReportIssueViewController *)self _issueTypeEnabled:v3++];
  while (v3 != 6);
  return v4;
}

- (int64_t)_issueTypeForRowIndex:(int64_t)a3
{
  int64_t v5 = 0;
  uint64_t v6 = 0;
  do
  {
    if ([(PKReportIssueViewController *)self _issueTypeEnabled:v5])
    {
      if (v6 == a3) {
        return v5;
      }
      ++v6;
    }
    ++v5;
  }
  while (v5 != 6);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_rowIndexForIssueType:(int64_t)a3
{
  uint64_t v5 = 0;
  int64_t v6 = 0;
  do
  {
    if ([(PKReportIssueViewController *)self _issueTypeEnabled:v5])
    {
      if (a3 == v5) {
        return v6;
      }
      ++v6;
    }
    ++v5;
  }
  while (v5 != 6);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_issueTypeEnabled:(int64_t)a3
{
  return (unint64_t)a3 <= 5 && *((unsigned char *)&self->super.super.super.super.super.isa + *off_1E59DCCA0[a3]) != 0;
}

- (void)_updateNavigationButtons
{
  [(UIBarButtonItem *)self->_cancelButton setEnabled:!self->_reportingIssue];
  if (self->_hasIssueSelected && !self->_reportingIssue)
  {
    int64_t selectedIssue = self->_selectedIssue;
    if (selectedIssue)
    {
      if (selectedIssue == 2)
      {
        if ([(PKSectionTableViewController *)self isSectionMapped:5])
        {
          int v7 = [(PKReportIssueViewController *)self tableView];
          id v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 5));
          unint64_t v9 = [v7 cellForRowAtIndexPath:v8];

          unint64_t v10 = [v9 textView];
          char v11 = [v10 text];
          BOOL v12 = [v11 length] != 0;
        }
        else
        {
          BOOL v12 = 0;
        }
        uint64_t hasDisputeTypeSelected = self->_hasMapsIssueSelected && v12;
      }
      else
      {
        uint64_t hasDisputeTypeSelected = 1;
      }
    }
    else
    {
      uint64_t hasDisputeTypeSelected = self->_hasDisputeTypeSelected;
    }
  }
  else
  {
    uint64_t hasDisputeTypeSelected = 0;
  }
  [(UIBarButtonItem *)self->_submitButton setEnabled:hasDisputeTypeSelected];
  if (self->_reportingIssue)
  {
    id v13 = (id)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v13 startAnimating];
    unint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v13];
    uint64_t v5 = [(PKReportIssueViewController *)self navigationItem];
    [v5 setRightBarButtonItem:v4];
  }
  else
  {
    id v13 = [(PKReportIssueViewController *)self navigationItem];
    [v13 setRightBarButtonItem:self->_submitButton];
  }
}

- (void)_cancelButtonTapped:(id)a3
{
  id v3 = [(PKReportIssueViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_submitButtonTapped:(id)a3
{
  id v4 = a3;
  if (self->_hasIssueSelected)
  {
    if ([(PKPaymentTransaction *)self->_transaction isBankConnectTransaction])
    {
      if (self->_selectedIssue == 2) {
        [(PKReportIssueViewController *)self _reportBankConnectIssueToMaps];
      }
    }
    else if (self->_canPerformCancelAccountServicePayment)
    {
      if (!self->_cancelingPayment)
      {
        self->_cancelingPayment = 1;
        uint64_t v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        activityIndicator = self->_activityIndicator;
        self->_activityIndicator = v5;

        [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
        int v7 = [(PKReportIssueViewController *)self navigationItem];
        id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_activityIndicator];
        [v7 setRightBarButtonItem:v8];

        unint64_t v9 = (void *)MEMORY[0x1E4FB1418];
        unint64_t v10 = PKLocalizedFeatureString();
        char v11 = PKLocalizedFeatureString();
        BOOL v12 = [v9 alertControllerWithTitle:v10 message:v11 preferredStyle:1];

        id v13 = (void *)MEMORY[0x1E4FB1410];
        id v14 = PKLocalizedFeatureString();
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __51__PKReportIssueViewController__submitButtonTapped___block_invoke;
        v21[3] = &unk_1E59CB1F0;
        v21[4] = self;
        id v15 = [v13 actionWithTitle:v14 style:2 handler:v21];
        [v12 addAction:v15];

        v16 = (void *)MEMORY[0x1E4FB1410];
        v17 = PKLocalizedFeatureString();
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __51__PKReportIssueViewController__submitButtonTapped___block_invoke_2;
        v20[3] = &unk_1E59CB1F0;
        v20[4] = self;
        v18 = [v16 actionWithTitle:v17 style:1 handler:v20];
        [v12 addAction:v18];

        [(PKReportIssueViewController *)self presentViewController:v12 animated:1 completion:0];
      }
    }
    else
    {
      unint64_t selectedIssue = self->_selectedIssue;
      if (selectedIssue <= 5)
      {
        if (selectedIssue == 2) {
          [(PKReportIssueViewController *)self _reportIssueToMaps];
        }
        else {
          [(PKReportIssueViewController *)self _reportIssueInBusinessChat];
        }
      }
    }
  }
}

uint64_t __51__PKReportIssueViewController__submitButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelPayment];
}

uint64_t __51__PKReportIssueViewController__submitButtonTapped___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _reportIssueInBusinessChat];
  *(unsigned char *)(*(void *)(a1 + 32) + 1264) = 0;
  return result;
}

- (void)_cancelPayment
{
  id v3 = [(PKPaymentTransaction *)self->_transaction payments];
  id v4 = [v3 firstObject];

  id v5 = objc_alloc_init(MEMORY[0x1E4F842F8]);
  int64_t v6 = [(PKAccount *)self->_account accountIdentifier];
  [v5 setAccountIdentifier:v6];

  int v7 = [(PKAccount *)self->_account accountBaseURL];
  [v5 setBaseURL:v7];

  id v8 = [v4 referenceIdentifier];
  [v5 setPaymentReferenceIdentifier:v8];

  objc_initWeak(&location, self);
  paymentWebService = self->_paymentWebService;
  if (!paymentWebService)
  {
    unint64_t v10 = [MEMORY[0x1E4F84D50] sharedService];
    char v11 = self->_paymentWebService;
    self->_paymentWebService = v10;

    paymentWebService = self->_paymentWebService;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__PKReportIssueViewController__cancelPayment__block_invoke;
  v12[3] = &unk_1E59DCAE8;
  objc_copyWeak(&v13, &location);
  [(PKPaymentWebService *)paymentWebService cancelPaymentWithRequest:v5 completion:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __45__PKReportIssueViewController__cancelPayment__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Cancel Payment => %@:%@", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PKReportIssueViewController__cancelPayment__block_invoke_151;
  v9[3] = &unk_1E59CB010;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  id v10 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v11);
}

void __45__PKReportIssueViewController__cancelPayment__block_invoke_151(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1264] = 0;
    id v4 = [WeakRetained navigationItem];
    [v4 setRightBarButtonItem:*((void *)v3 + 148)];

    if (*(void *)(a1 + 32))
    {
      id v5 = (void *)MEMORY[0x1E4FB1418];
      id v6 = PKLocalizedFeatureString();
      int v7 = PKLocalizedFeatureString();
      id v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

      unint64_t v9 = (void *)MEMORY[0x1E4FB1410];
      id v10 = PKLocalizedFeatureString();
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __45__PKReportIssueViewController__cancelPayment__block_invoke_2;
      v18[3] = &unk_1E59CB1F0;
      v18[4] = v3;
      id v11 = [v9 actionWithTitle:v10 style:0 handler:v18];
      [v8 addAction:v11];

      BOOL v12 = (void *)MEMORY[0x1E4FB1410];
      id v13 = PKLocalizedFeatureString();
      __int16 v14 = [v12 actionWithTitle:v13 style:1 handler:0];
      [v8 addAction:v14];

      [v3 presentViewController:v8 animated:1 completion:0];
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F84C38]);
      id v15 = *((id *)v3 + 136);
      [v15 setTransactionStatus:5];
      uint64_t v16 = [v15 transactionSourceIdentifier];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __45__PKReportIssueViewController__cancelPayment__block_invoke_3;
      v17[3] = &unk_1E59D09C8;
      v17[4] = v3;
      [v8 insertOrUpdatePaymentTransaction:v15 forTransactionSourceIdentifier:v16 completion:v17];
    }
  }
}

uint64_t __45__PKReportIssueViewController__cancelPayment__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportIssueInBusinessChat];
}

void __45__PKReportIssueViewController__cancelPayment__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PKReportIssueViewController__cancelPayment__block_invoke_4;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __45__PKReportIssueViewController__cancelPayment__block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)_reportIssueInBusinessChat
{
  if (+[PKBusinessChatController deviceSupportsBusinessChat]&& !self->_reportingIssue)
  {
    int64_t selectedIssue = self->_selectedIssue;
    if ((unint64_t)(selectedIssue - 3) >= 3)
    {
      if (selectedIssue)
      {
        if (selectedIssue == 1) {
          uint64_t v4 = 0;
        }
        else {
          uint64_t v4 = 5;
        }
      }
      else
      {
        unint64_t selectedDisputeType = self->_selectedDisputeType;
        if (selectedDisputeType < 4) {
          uint64_t v4 = selectedDisputeType + 1;
        }
        else {
          uint64_t v4 = 5;
        }
      }
    }
    else if ([(PKPaymentTransaction *)self->_transaction transactionType] == 10)
    {
      uint64_t v4 = 9;
    }
    else
    {
      uint64_t v4 = 5;
    }
    self->_reportingIssue = 1;
    [(PKReportIssueViewController *)self _updateNavigationButtons];
    id v6 = [(PKAccountUserCollection *)self->_accountUserCollection accountUserForTransaction:self->_transaction];
    familyCollection = self->_familyCollection;
    id v8 = [v6 altDSID];
    unint64_t v9 = [(PKFamilyMemberCollection *)familyCollection familyMemberForAltDSID:v8];

    id v10 = [PKBusinessChatTransactionDisputeContext alloc];
    id v11 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
    BOOL v12 = [(PKBusinessChatTransactionDisputeContext *)v10 initWithPaymentPass:v11 transaction:self->_transaction account:self->_account accountUser:v6 familyMember:v9 physicalCards:self->_physicalCards intent:v4];

    if (!self->_businessChatController)
    {
      id v13 = objc_alloc_init(PKBusinessChatController);
      businessChatController = self->_businessChatController;
      self->_businessChatController = v13;
    }
    objc_initWeak(&location, self);
    id v15 = self->_businessChatController;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__PKReportIssueViewController__reportIssueInBusinessChat__block_invoke;
    v16[3] = &unk_1E59CB240;
    objc_copyWeak(&v17, &location);
    [(PKBusinessChatController *)v15 openBusinessChatWithContext:v12 completion:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __57__PKReportIssueViewController__reportIssueInBusinessChat__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PKReportIssueViewController__reportIssueInBusinessChat__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __57__PKReportIssueViewController__reportIssueInBusinessChat__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[1248] = 0;
    id v5 = WeakRetained;
    [WeakRetained _updateNavigationButtons];
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      [v5 presentViewController:v4 animated:1 completion:0];
    }
    else
    {
      id v4 = [v5 presentingViewController];
      [v4 dismissViewControllerAnimated:1 completion:0];
    }

    WeakRetained = v5;
  }
}

- (void)_resetMapsMerchantAndBrandWithIssueReportIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  paymentService = self->_paymentService;
  transaction = self->_transaction;
  id v9 = a3;
  id v10 = [(PKPaymentTransaction *)transaction identifier];
  id v11 = [(PKPaymentTransaction *)self->_transaction transactionSourceIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__PKReportIssueViewController__resetMapsMerchantAndBrandWithIssueReportIdentifier_completion___block_invoke;
  v13[3] = &unk_1E59DCB10;
  id v14 = v6;
  id v12 = v6;
  [(PKPaymentService *)paymentService removeMapsDataForTransactionWithIdentifier:v10 forTransactionSourceIdentifier:v11 issueReportIdentifier:v9 completion:v13];
}

uint64_t __94__PKReportIssueViewController__resetMapsMerchantAndBrandWithIssueReportIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (void)_reprocessTransactionMerchantWithIssueReportIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPaymentTransaction *)self->_transaction transactionSourceIdentifier];
  id v9 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceForTransactionSourceIdentifier:v8];
  id v10 = [v9 paymentPass];

  id v11 = objc_alloc(MEMORY[0x1E4F850A0]);
  transaction = self->_transaction;
  id v13 = [v10 devicePrimaryPaymentApplication];
  id v14 = (void *)[v11 initWithTransaction:transaction paymentApplication:v13];

  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F847F0]) initWithSource:v14];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke;
  v19[3] = &unk_1E59DCB38;
  v19[4] = self;
  id v20 = v6;
  id v21 = v8;
  id v22 = v7;
  id v16 = v7;
  id v17 = v8;
  id v18 = v6;
  [v15 startLookupWithCompletion:v19];
}

void __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E59CF3E0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) result];
  id v3 = *(id **)(a1 + 40);
  if (v2 == 2)
  {
    uint64_t v4 = [v3[136] merchant];
    uint64_t v5 = [*(id *)(a1 + 32) merchant];
    uint64_t v6 = [*(id *)(a1 + 32) brand];
    uint64_t v7 = [(id)v5 identifier];
    id v8 = [v4 mapsMerchant];
    if (v7 == [v8 identifier])
    {
      uint64_t v9 = [(id)v6 identifier];
      id v10 = [v4 mapsBrand];
      uint64_t v11 = [v10 identifier];

      if (v9 == v11 && (!(v5 | v6) || ![v4 mapsDataIsFromLocalMatch]))
      {
        [*(id *)(a1 + 40) _resetMapsMerchantAndBrandWithIssueReportIdentifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
LABEL_12:

        return;
      }
    }
    else
    {
    }
    [v4 setMapsMerchant:v5];
    [v4 setMapsBrand:v6];
    objc_msgSend(v4, "setFallbackcategory:", objc_msgSend(*(id *)(a1 + 32), "fallbackCategory"));
    [v4 setMapsDataIsFromLocalMatch:0];
    [*(id *)(*(void *)(a1 + 40) + 1088) setIssueReportIdentifier:*(void *)(a1 + 48)];
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(void **)(v14 + 1136);
    uint64_t v16 = *(void *)(v14 + 1088);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke_3;
    v18[3] = &unk_1E59DCB10;
    uint64_t v17 = *(void *)(a1 + 56);
    id v19 = *(id *)(a1 + 64);
    [v15 insertOrUpdatePaymentTransaction:v16 forTransactionSourceIdentifier:v17 completion:v18];

    goto LABEL_12;
  }
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 64);

  [v3 _resetMapsMerchantAndBrandWithIssueReportIdentifier:v12 completion:v13];
}

uint64_t __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

- (void)_reportBankConnectIssueToMaps
{
  if (self->_reportingIssue || !self->_hasMapsIssueSelected) {
    return;
  }
  self->_reportingIssue = 1;
  [(PKReportIssueViewController *)self _updateNavigationButtons];
  unint64_t selectedMapsIssue = self->_selectedMapsIssue;
  if (selectedMapsIssue > 2) {
    uint64_t v98 = 0;
  }
  else {
    uint64_t v98 = qword_1A0445488[selectedMapsIssue];
  }
  transaction = self->_transaction;
  bankConnectInstitution = self->_bankConnectInstitution;
  uint64_t v6 = [(PKReportIssueViewController *)self _reportComments];
  bankConnectPIIStringProcessor = self->_bankConnectPIIStringProcessor;
  paymentPass = self->_paymentPass;
  uint64_t v9 = transaction;
  id v10 = bankConnectInstitution;
  id v11 = v6;
  uint64_t v12 = bankConnectPIIStringProcessor;
  uint64_t v13 = paymentPass;
  uint64_t v14 = [(PKPaymentTransaction *)v9 merchant];
  id v15 = [v14 mapsMerchant];
  v123 = [v14 mapsBrand];
  uint64_t v16 = [v15 postalAddress];
  v120 = v11;
  if (v16)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1BA88];
    id v18 = [v15 postalAddress];
    uint64_t v19 = [v17 stringFromPostalAddress:v18 style:0];
  }
  else
  {
    uint64_t v19 = 0;
  }

  id v20 = [(PKPaymentTransaction *)v9 location];
  [v20 coordinate];
  double v22 = v21;
  double v24 = v23;

  id v124 = objc_alloc(off_1EC34A178());
  uint64_t v112 = [v14 industryCode];
  v118 = v15;
  if ([v15 identifier]) {
    uint64_t v25 = v15;
  }
  else {
    uint64_t v25 = v123;
  }
  uint64_t v110 = [v25 identifier];
  v115 = [v14 name];
  v114 = [v14 rawName];
  v113 = [v14 industryCategory];
  v111 = [v14 originURL];
  v109 = [v111 absoluteString];
  v26 = &stru_1EF1B5B50;
  v117 = (void *)v19;
  if (v19) {
    v26 = (__CFString *)v19;
  }
  v106 = v26;
  v108 = [(PKPaymentTransaction *)v9 transactionDate];
  [v108 timeIntervalSince1970];
  double v28 = v27;
  [(PKPaymentTransaction *)v9 transactionType];
  v107 = PKPaymentTransactionTypeToString();
  uint64_t v29 = v9;
  v30 = v12;
  uint64_t v31 = v13;
  v116 = v10;
  v32 = [(PKPaymentTransaction *)v29 bankConnectMetadata];
  id v33 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v121 = v31;
  v34 = [(PKPaymentPass *)v31 issuerCountryCode];
  uint64_t v35 = objc_msgSend(v33, "initWithObjects:", v34, 0);

  v36 = [(PKPaymentTransaction *)v29 merchantProvidedDescription];
  v100 = [(FKPIIStringProcessor *)v30 redactFromString:v36 forCountryCodes:v35];

  int64_t v37 = [v32 originalTransactionDescription];
  uint64_t v38 = [(FKPIIStringProcessor *)v30 redactFromString:v37 forCountryCodes:v35];

  id v39 = objc_alloc_init(off_1EC34A180());
  unint64_t v40 = [(PKPaymentTransaction *)v29 transactionType];
  uint64_t v41 = 0;
  if (v40 <= 0x16) {
    uint64_t v41 = qword_1A0445370[v40];
  }
  [v39 setTransactionType:v41];
  [v39 setBankTransactionDescription:v38];
  id v42 = [(PKPaymentTransaction *)v29 transactionDate];
  [v42 timeIntervalSinceReferenceDate];
  objc_msgSend(v39, "setTransactionTimestamp:");

  id v43 = [v32 bankMerchantCategoryCode];
  uint64_t v44 = [v43 integerValue];
  if (v44)
  {
    [v39 setIndustryCode:v44];
  }
  else
  {
    [(PKPaymentTransaction *)v29 merchant];
    uint64_t v45 = v38;
    v47 = objc_super v46 = v32;
    objc_msgSend(v39, "setIndustryCode:", objc_msgSend(v47, "industryCode"));

    v32 = v46;
    uint64_t v38 = v45;
  }

  [v39 setEnableBrandMuidFallback:1];
  v48 = [(PKPaymentTransaction *)v29 currencyCode];
  [v39 setTransactionCurrencyCode:v48];

  unint64_t v49 = [(PKPaymentTransaction *)v29 transactionStatus];
  v119 = v14;
  v105 = v32;
  v102 = (void *)v38;
  v103 = (void *)v35;
  v101 = self;
  if (v49 > 3) {
    uint64_t v50 = 0;
  }
  else {
    uint64_t v50 = qword_1A0445428[v49];
  }
  [v39 setTransactionStatus:v50];
  v51 = v29;
  v52 = (Class (__cdecl *)())off_1EC34A188;
  v53 = v30;
  v54 = v121;
  id v55 = objc_alloc_init(v52());
  v56 = [(PKPaymentTransaction *)v51 bankConnectMetadata];
  v99 = v51;
  v57 = [(PKPaymentTransaction *)v51 merchant];
  v58 = [v56 bankMerchantAddress];
  v59 = [v56 bankMerchantName];
  id v60 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v61 = [(PKPaymentPass *)v54 issuerCountryCode];
  v122 = v54;

  v62 = objc_msgSend(v60, "initWithObjects:", v61, 0);
  v63 = [(FKPIIStringProcessor *)v53 redactFromString:v59 forCountryCodes:v62];
  v104 = v53;

  v64 = [v56 bankMerchantNumber];
  [v55 setMerchantId:v64];

  [v55 setMerchantDoingBusinessAsName:v63];
  [v55 setMerchantEnhancedName:v63];
  v65 = [v58 city];
  if (v65)
  {
    [v55 setMerchantCity:v65];
  }
  else
  {
    v66 = [v57 city];
    [v55 setMerchantCity:v66];
  }
  v67 = [v57 rawCity];
  [v55 setMerchantRawCity:v67];

  v68 = [v58 state];
  if (v68)
  {
    [v55 setMerchantState:v68];
  }
  else
  {
    v69 = [v57 state];
    [v55 setMerchantState:v69];
  }
  v70 = [v57 rawState];
  [v55 setMerchantRawState:v70];

  v71 = [v58 postalCode];
  if (v71)
  {
    [v55 setMerchantZip:v71];
  }
  else
  {
    v72 = [v57 zip];
    [v55 setMerchantZip:v72];
  }
  v73 = [v58 street];
  [v55 setMerchantAddress:v73];

  v74 = [v58 street];
  [v55 setMerchantRawAddress:v74];

  objc_msgSend(v55, "setMerchantCleanConfidenceLevel:", objc_msgSend(v57, "cleanConfidenceLevel"));
  v75 = [v57 rawCANL];
  [v55 setMerchantCanl:v75];

  v76 = [(PKPaymentTransaction *)v99 clearingNetworkData];

  if (v76)
  {
    v77 = (void *)MEMORY[0x1E4F28D90];
    v78 = [(PKPaymentTransaction *)v99 clearingNetworkData];
LABEL_36:
    v80 = v78;
    v81 = [v78 dataUsingEncoding:4];
    v82 = [v77 JSONObjectWithData:v81 options:0 error:0];

    if (v82)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v83 = [v82 objectForKeyedSubscript:*MEMORY[0x1E4F87C10]];
        if (v83)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v84 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v83 options:0 error:0];
            v85 = (void *)[[NSString alloc] initWithData:v84 encoding:4];
            [v55 setMerchantAdditionalData:v85];
          }
        }
        v86 = [v82 objectForKeyedSubscript:*MEMORY[0x1E4F87C00]];
        [v55 setMerchantCountryCode:v86];

        v87 = [v82 objectForKeyedSubscript:*MEMORY[0x1E4F87C08]];
        [v55 setMerchantType:v87];
      }
    }
    goto LABEL_43;
  }
  v79 = [(PKPaymentTransaction *)v99 authNetworkData];

  if (v79)
  {
    v77 = (void *)MEMORY[0x1E4F28D90];
    v78 = [(PKPaymentTransaction *)v99 authNetworkData];
    goto LABEL_36;
  }
  v82 = 0;
LABEL_43:

  [v39 setMerchantInformation:v55];
  [v39 setBankTransactionDescriptionClean:v100];
  v88 = [(FKInstitution *)v116 institutionIdentifier];

  [v39 setBankIdentifier:v88];
  v125 = objc_msgSend(v124, "initForMerchantIssue:merchantIndustryCode:mapsIdentifier:merchantName:merchantRawName:merchantIndustryCategory:merchantURL:merchantFormattedAddress:transactionTime:transactionType:transactionLocation:bankTransactionInformation:", v98, v112, v110, v115, v114, v113, v28, v22, v24, v109, v106, v107, v39);

  if (v125)
  {
    v89 = [(PKPaymentTransaction *)v99 issueReportIdentifier];
    if (![v89 length])
    {
      v90 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v91 = [v90 UUIDString];

      v89 = (void *)v91;
    }
    [v125 setIsAppleCard:0];
    uint64_t v92 = [(PKPaymentTransaction *)v99 transactionSource];
    [(PKPaymentTransaction *)v99 transactionType];
    if ((unint64_t)(v92 - 1) > 7) {
      uint64_t v93 = 0;
    }
    else {
      uint64_t v93 = qword_1A0445448[v92 - 1];
    }
    [v125 setLookupTransactionType:v93];
    if ([(PKPaymentTransaction *)v99 hasEffectiveTransactionSource])
    {
      v94 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v119, "adamIdentifier"));
      v95 = [v94 stringValue];
      [v125 setMerchantAdamId:v95];
    }
    [v125 setCorrelationId:v89];
    [v125 setReportersComment:v120];
  }
  v96 = _MergedGlobals_19(v125, 1);
  v97 = [v125 correlationId];
  [(PKReportIssueViewController *)v101 _submitBankConnectTicketToMaps:v96 withCorrelationId:v97];
}

- (void)_submitBankConnectTicketToMaps:(id)a3 withCorrelationId:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__PKReportIssueViewController__submitBankConnectTicketToMaps_withCorrelationId___block_invoke;
  v4[3] = &unk_1E59DCB60;
  v4[4] = self;
  [a3 submitWithHandler:v4 networkActivity:0];
}

void __80__PKReportIssueViewController__submitBankConnectTicketToMaps_withCorrelationId___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PKReportIssueViewController__submitBankConnectTicketToMaps_withCorrelationId___block_invoke_2;
  v8[3] = &unk_1E59CA870;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __80__PKReportIssueViewController__submitBankConnectTicketToMaps_withCorrelationId___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Submitted merchant issue to maps with error: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  *(unsigned char *)(*(void *)(a1 + 40) + 1248) = 0;
  [*(id *)(a1 + 40) _updateNavigationButtons];
  id v5 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v6 = PKLocalizedPaymentString(&cfstr_TransactionDet_46.isa);
    id v7 = @"TRANSACTION_DETAILS_REPORT_PROBLEM_ERROR_MESSAGE";
  }
  else
  {
    uint64_t v6 = PKLocalizedPaymentString(&cfstr_TransactionDet_44.isa);
    id v7 = @"TRANSACTION_DETAILS_REPORT_PROBLEM_SUCCESS_MESSAGE";
  }
  id v8 = PKLocalizedPaymentString(&v7->isa);
  [v5 _presentAlertWithTitle:v6 message:v8 dismissAfter:1];
}

- (void)_reportIssueToMaps
{
  if (!self->_reportingIssue && self->_hasMapsIssueSelected)
  {
    self->_reportingIssue = 1;
    [(PKReportIssueViewController *)self _updateNavigationButtons];
    unint64_t selectedMapsIssue = self->_selectedMapsIssue;
    if (selectedMapsIssue > 2) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = qword_1A0445488[selectedMapsIssue];
    }
    id v5 = [(PKReportIssueViewController *)self _reportComments];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F310C0]) initForMerchantIssue:v4 transaction:self->_transaction account:self->_account comments:v5];
    id v7 = [MEMORY[0x1E4F30F28] sharedService];
    id v8 = [v7 feedbackTicketForWalletRAPReport:v6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__PKReportIssueViewController__reportIssueToMaps__block_invoke;
    v10[3] = &unk_1E59DCB88;
    v10[4] = self;
    id v11 = v6;
    id v9 = v6;
    [v8 submitWithHandler:v10 networkActivity:0];
  }
}

void __49__PKReportIssueViewController__reportIssueToMaps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Submitted merchant issue to maps with error: %@", buf, 0xCu);
  }

  uint64_t v4 = *(unsigned char **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    v4[1248] = 0;
    [*(id *)(a1 + 40) _updateNavigationButtons];
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = PKLocalizedPaymentString(&cfstr_TransactionDet_46.isa);
    id v7 = PKLocalizedPaymentString(&cfstr_TransactionDet_47.isa);
    [v5 _presentAlertWithTitle:v6 message:v7 dismissAfter:1];
  }
  else
  {
    id v8 = [*(id *)(a1 + 48) correlationId];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_186;
    v9[3] = &unk_1E59CB6D8;
    void v9[4] = *(void *)(a1 + 40);
    [v4 _reprocessTransactionMerchantWithIssueReportIdentifier:v8 completion:v9];
  }
}

void __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_186(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_2_187;
  v2[3] = &unk_1E59CDA78;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_2_187(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1248) = 0;
  [*(id *)(a1 + 32) _updateNavigationButtons];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  char v3 = *(void **)(a1 + 32);
  if (v2)
  {
    PKLocalizedPaymentString(&cfstr_TransactionDet_44.isa);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = @"TRANSACTION_DETAILS_REPORT_PROBLEM_SUCCESS_MESSAGE";
  }
  else
  {
    PKLocalizedPaymentString(&cfstr_TransactionDet_46.isa);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = @"TRANSACTION_DETAILS_REPORT_PROBLEM_ERROR_MESSAGE";
  }
  id v5 = PKLocalizedPaymentString(&v4->isa);
  [v3 _presentAlertWithTitle:v6 message:v5 dismissAfter:1];
}

- (id)_reportComments
{
  if ([(PKSectionTableViewController *)self isSectionMapped:5])
  {
    char v3 = [(PKReportIssueViewController *)self tableView];
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 5));
    id v5 = [v3 cellForRowAtIndexPath:v4];

    id v6 = [v5 textView];
    id v7 = [v6 text];

    if (!v7 || ![v7 length])
    {

      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 dismissAfter:(BOOL)a5
{
  id v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v8 = (void *)MEMORY[0x1E4FB1410];
  id v9 = PKLocalizedPaymentString(&cfstr_TransactionDet_21.isa);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PKReportIssueViewController__presentAlertWithTitle_message_dismissAfter___block_invoke;
  v11[3] = &unk_1E59D09A0;
  BOOL v12 = a5;
  v11[4] = self;
  id v10 = [v8 actionWithTitle:v9 style:0 handler:v11];
  [v7 addAction:v10];

  [(PKReportIssueViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __75__PKReportIssueViewController__presentAlertWithTitle_message_dismissAfter___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v1 = [*(id *)(a1 + 32) presentingViewController];
    [v1 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankConnectPIIStringProcessor, 0);
  objc_storeStrong((id *)&self->_bankConnectInstitution, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_statementName, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_submitButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_transactionCellController, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end