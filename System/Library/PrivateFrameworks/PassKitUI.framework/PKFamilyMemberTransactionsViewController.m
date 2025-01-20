@interface PKFamilyMemberTransactionsViewController
- (BOOL)_updateWithTransactionGroups:(id)a3;
- (BOOL)_updateWithTransactions:(id)a3;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKFamilyMemberTransactionsViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 transactionSource:(id)a5 account:(id)a6 peerPaymentAccount:(id)a7 peerPaymentWebService:(id)a8 detailViewStyle:(int64_t)a9 paymentServiceDataProvider:(id)a10 mode:(unint64_t)a11;
- (id)_contactKeysToFetch;
- (id)_transactionDetailViewControllerForTransaction:(id)a3;
- (id)_viewControllerForTransactionGroup:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didSelectRequestStatementAtIndexPath:(id)a3;
- (void)_fetchDataWithCompletion:(id)a3;
- (void)_reloadTransactionGroupsWithCompletion:(id)a3;
- (void)_reloadTransactionsWithCompletion:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)transactionsChanged:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKFamilyMemberTransactionsViewController

- (PKFamilyMemberTransactionsViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 transactionSource:(id)a5 account:(id)a6 peerPaymentAccount:(id)a7 peerPaymentWebService:(id)a8 detailViewStyle:(int64_t)a9 paymentServiceDataProvider:(id)a10 mode:(unint64_t)a11
{
  id v18 = a3;
  id v19 = a4;
  id v48 = a5;
  id obj = a6;
  id v20 = a6;
  id v21 = a7;
  id v47 = a8;
  id v46 = a10;
  v49.receiver = self;
  v49.super_class = (Class)PKFamilyMemberTransactionsViewController;
  v22 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v49, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 3);
  v23 = v22;
  if (v22)
  {
    id v44 = v20;
    objc_storeStrong((id *)&v22->_familyMember, a3);
    objc_storeStrong((id *)&v23->_familyCollection, a4);
    v23->_detailViewStyle = a9;
    objc_storeStrong((id *)&v23->_peerPaymentAccount, a7);
    objc_storeStrong((id *)&v23->_peerPaymentWebService, a8);
    objc_storeStrong((id *)&v23->_paymentServiceDataProvider, a10);
    v23->_mode = a11;
    objc_storeStrong((id *)&v23->_account, obj);
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F850C8]) initWithTransactionSource:v48];
    transactionSourceCollection = v23->_transactionSourceCollection;
    v23->_transactionSourceCollection = (PKTransactionSourceCollection *)v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionSourceCollection:v23->_transactionSourceCollection paymentDataProvider:v23->_paymentServiceDataProvider];
    transactionFetcher = v23->_transactionFetcher;
    v23->_transactionFetcher = (PKDashboardTransactionFetcher *)v26;

    [(PKDashboardTransactionFetcher *)v23->_transactionFetcher setDelegate:v23];
    id v28 = objc_alloc(MEMORY[0x1E4F845E8]);
    id v29 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    v30 = [(PKFamilyMemberTransactionsViewController *)v23 _contactKeysToFetch];
    uint64_t v31 = [v28 initWithContactStore:v29 keysToFetch:v30];
    contactResolver = v23->_contactResolver;
    v23->_contactResolver = (PKContactResolver *)v31;

    v33 = [[PKPaymentTransactionCellController alloc] initWithContactResolver:v23->_contactResolver];
    transactionCellController = v23->_transactionCellController;
    v23->_transactionCellController = v33;

    v35 = [[PKPaymentTransactionDetailsFactory alloc] initWithContactResolver:v23->_contactResolver peerPaymentWebService:v23->_peerPaymentWebService paymentServiceDataProvider:v23->_paymentServiceDataProvider detailViewStyle:v23->_detailViewStyle];
    transactionDetailsFactory = v23->_transactionDetailsFactory;
    v23->_transactionDetailsFactory = v35;

    v37 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterYear = v23->_formatterYear;
    v23->_formatterYear = v37;

    v39 = v23->_formatterYear;
    id v40 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v41 = (void *)[v40 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    v42 = v39;
    id v20 = v44;
    [(NSDateFormatter *)v42 setCalendar:v41];

    [(NSDateFormatter *)v23->_formatterYear setLocalizedDateFormatFromTemplate:@"y"];
  }

  return v23;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKFamilyMemberTransactionsViewController;
  [(PKSectionTableViewController *)&v8 viewDidLoad];
  v3 = PKLocalizedPaymentString(&cfstr_TransactionsHe.isa);
  [(PKFamilyMemberTransactionsViewController *)self setTitle:v3];

  v4 = [(PKFamilyMemberTransactionsViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionTableCellReuseIdentifier"];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionStatementTableCellReuseIdentifier"];
  [v4 setEstimatedRowHeight:76.0];
  [v4 setRowHeight:*MEMORY[0x1E4FB2F28]];
  objc_msgSend(v4, "pkui_setupForReadableContentGuide");
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PKFamilyMemberTransactionsViewController_viewDidLoad__block_invoke;
  v5[3] = &unk_1E59CB100;
  objc_copyWeak(&v6, &location);
  [(PKFamilyMemberTransactionsViewController *)self _fetchDataWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__PKFamilyMemberTransactionsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1216] = 1;
    v2 = WeakRetained;
    [WeakRetained updateSectionVisibilityAndReloadIfNecessaryForSections:&unk_1EF2BA1B8];
    WeakRetained = v2;
  }
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      if (self->_allContentIsLoaded)
      {
        uint64_t v4 = 1200;
        return [*(id *)((char *)&self->super.super.super.super.super.isa + v4) count] != 0;
      }
    }
    else if (!a3 && self->_allContentIsLoaded)
    {
      uint64_t v4 = 1208;
      return [*(id *)((char *)&self->super.super.super.super.super.isa + v4) count] != 0;
    }
    return 0;
  }
  id v6 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
  if ([v6 isOrganizer]) {
    BOOL v5 = self->_mode == 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v5 == 3) {
    return 0;
  }
  if (v5 == 1)
  {
    if (self->_allContentIsLoaded)
    {
      uint64_t v6 = 1200;
      goto LABEL_8;
    }
    return 0;
  }
  if (v5) {
    return 1;
  }
  if (!self->_allContentIsLoaded) {
    return 0;
  }
  uint64_t v6 = 1208;
LABEL_8:
  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v6);

  return [v7 count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]);
  if (v8 == 2)
  {
    v9 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionStatementTableCellReuseIdentifier" forIndexPath:v7];
    v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_3.isa);
    v14 = [v9 textLabel];
    [v14 setText:v10];
    v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v14 setTextColor:v15];

    if (self->_requestingStatement)
    {
      v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v16 startAnimating];
      [v9 setAccessoryView:v16];
      v17 = [v9 textLabel];
      id v18 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [v17 setTextColor:v18];

      id v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_4.isa);
      [v17 setText:v19];
    }
    else
    {
      BOOL sentStatement = self->_sentStatement;
      [v9 setAccessoryView:0];
      uint64_t v26 = v9;
      if (!sentStatement)
      {
        uint64_t v27 = 0;
LABEL_11:
        [v26 setAccessoryType:v27];
        goto LABEL_18;
      }
      [v9 setAccessoryType:3];
      v16 = [v9 textLabel];
      v32 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [v16 setTextColor:v32];

      v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_5.isa);
      [v16 setText:v17];
    }

    goto LABEL_18;
  }
  if (v8 == 1)
  {
    v9 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionForYearTableCellReuseIdentifier"];
    if (!v9) {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PKPaymentTransactionForYearTableCellReuseIdentifier"];
    }
    v10 = -[NSArray objectAtIndexedSubscript:](self->_transactionGroups, "objectAtIndexedSubscript:", [v7 row]);
    formatterYear = self->_formatterYear;
    id v21 = [v10 startDate];
    v22 = [(NSDateFormatter *)formatterYear stringFromDate:v21];
    v14 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas.isa, &stru_1EF1B4C70.isa, v22);

    v23 = [v9 textLabel];
    [v23 setText:v14];

    uint64_t v24 = [v9 detailTextLabel];
    v25 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v10, "transactionCount"));
    [v24 setText:v25];

    uint64_t v26 = v9;
    uint64_t v27 = 1;
    goto LABEL_11;
  }
  if (v8)
  {
    v9 = 0;
    goto LABEL_19;
  }
  v9 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionTableCellReuseIdentifier" forIndexPath:v7];
  v10 = -[NSArray objectAtIndexedSubscript:](self->_transactions, "objectAtIndexedSubscript:", [v7 row]);
  v11 = [(PKPaymentDataProvider *)self->_paymentServiceDataProvider deviceName];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    PKDeviceName();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  transactionSourceCollection = self->_transactionSourceCollection;
  id v29 = [v10 transactionSourceIdentifier];
  v30 = [(PKTransactionSourceCollection *)transactionSourceCollection transactionSourceForTransactionSourceIdentifier:v29];

  [(PKPaymentTransactionCellController *)self->_transactionCellController configureCell:v9 forTransaction:v10 transactionSource:v30 familyMember:self->_familyMember account:self->_account detailStyle:self->_detailViewStyle deviceName:v14 avatarViewDelegate:self];
LABEL_18:

LABEL_19:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] == 1)
  {
    uint64_t v4 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_6.isa);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a4;
  [a3 deselectRowAtIndexPath:v12 animated:1];
  unint64_t v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v12 section]);
  if (v6 == 2)
  {
    [(PKFamilyMemberTransactionsViewController *)self _didSelectRequestStatementAtIndexPath:v12];
  }
  else
  {
    if (v6 == 1)
    {
      unint64_t v8 = -[NSArray objectAtIndexedSubscript:](self->_transactionGroups, "objectAtIndexedSubscript:", [v12 row]);
      uint64_t v9 = [(PKFamilyMemberTransactionsViewController *)self _viewControllerForTransactionGroup:v8];
    }
    else
    {
      id v7 = v12;
      if (v6) {
        goto LABEL_9;
      }
      unint64_t v8 = -[NSArray objectAtIndexedSubscript:](self->_transactions, "objectAtIndexedSubscript:", [v12 row]);
      uint64_t v9 = [(PKFamilyMemberTransactionsViewController *)self _transactionDetailViewControllerForTransaction:v8];
    }
    v10 = (void *)v9;
    v11 = [(PKFamilyMemberTransactionsViewController *)self navigationController];
    [v11 pushViewController:v10 animated:1];
  }
  id v7 = v12;
LABEL_9:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  unint64_t v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3));
  if (v5 == 3) {
    return 0;
  }
  if (v5 != 2) {
    return 1;
  }
  if (self->_requestingStatement) {
    return 0;
  }
  return !self->_sentStatement;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v10 section]))
  {
    v11 = 0;
  }
  else
  {
    id v12 = -[NSArray objectAtIndexedSubscript:](self->_transactions, "objectAtIndexedSubscript:", [v10 row]);
    id v13 = [v9 cellForRowAtIndexPath:v10];
    v14 = v13;
    if (v12) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15
      && ([v13 transactionView],
          v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = objc_msgSend(v16, "shouldShowTransactionPreviewForTouchAtPoint:inView:", v9, x, y),
          v16,
          v17)
      && ([(PKFamilyMemberTransactionsViewController *)self _transactionDetailViewControllerForTransaction:v12], (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v19 = (void *)MEMORY[0x1E4FB1678];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __102__PKFamilyMemberTransactionsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
      v22[3] = &unk_1E59D28F8;
      id v23 = v18;
      id v20 = v18;
      v11 = [v19 configurationWithIdentifier:0 previewProvider:v22 actionProvider:&__block_literal_global_192];
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

id __102__PKFamilyMemberTransactionsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __102__PKFamilyMemberTransactionsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2()
{
  return 0;
}

- (void)transactionsChanged:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PKFamilyMemberTransactionsViewController_transactionsChanged___block_invoke;
  v3[3] = &unk_1E59CB6D8;
  v3[4] = self;
  [(PKFamilyMemberTransactionsViewController *)self _fetchDataWithCompletion:v3];
}

uint64_t __64__PKFamilyMemberTransactionsViewController_transactionsChanged___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) updateSectionVisibilityAndReloadIfNecessaryForSections:&unk_1EF2BA1D0];
  }
  return result;
}

- (void)_didSelectRequestStatementAtIndexPath:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  peerPaymentAccount = self->_peerPaymentAccount;
  unint64_t v5 = [(PKFamilyMember *)self->_familyMember altDSID];
  unint64_t v6 = [(PKPeerPaymentAccount *)peerPaymentAccount peerPaymentAccountWithAltDSID:v5];

  id v7 = [v6 identifier];
  if (v7)
  {
    unint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_7.isa);
    id v9 = PKPrimaryAppleAccountFormattedUsername();
    PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_8.isa, &stru_1EF1B4C70.isa, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:v10 preferredStyle:1];
    id v12 = (void *)MEMORY[0x1E4FB1410];
    id v13 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_9.isa);
    v14 = [v12 actionWithTitle:v13 style:1 handler:0];

    BOOL v15 = (void *)MEMORY[0x1E4FB1410];
    v16 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_10.isa);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke;
    v21[3] = &unk_1E59CB218;
    v21[4] = self;
    id v22 = v7;
    int v17 = [v15 actionWithTitle:v16 style:0 handler:v21];

    [v11 addAction:v14];
    [v11 addAction:v17];
    [v11 setPreferredAction:v17];
    PKAccessibilityIDAlertSet(v11, (void *)*MEMORY[0x1E4F853B8]);
    [(PKFamilyMemberTransactionsViewController *)self presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v6;
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Cannot request statement for family member if the account identifier is not defined for accounts %@", buf, 0xCu);
    }

    id v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentEma.isa);
    id v20 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentEma_0.isa);
    unint64_t v8 = PKDisplayableErrorCustom();

    id v10 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
    [(PKFamilyMemberTransactionsViewController *)self presentViewController:v10 animated:1 completion:0];
  }
}

void __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 1218) = 1;
  [*(id *)(a1 + 32) updateSectionVisibilityAndReloadIfNecessaryForSection:2];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = *(void **)(*(void *)(a1 + 32) + 1112);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke_2;
  v6[3] = &unk_1E59DC3B8;
  objc_copyWeak(&v7, &location);
  [v5 peerPaymentRequestStatementForAccountIdentifier:v4 withCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke_3;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __82__PKFamilyMemberTransactionsViewController__didSelectRequestStatementAtIndexPath___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    WeakRetained[1218] = 0;
    if (*(void *)(a1 + 32)) {
      BOOL v3 = *(void *)(a1 + 40) == 0;
    }
    else {
      BOOL v3 = 0;
    }
    id v9 = WeakRetained;
    if (v3)
    {
      WeakRetained[1219] = 1;
    }
    else
    {
      uint64_t v4 = objc_msgSend(MEMORY[0x1E4F84D80], "displayableErrorForError:");
      if (!*(void *)(a1 + 40))
      {
        id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentEma.isa);
        id v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentEma_0.isa);
        uint64_t v7 = PKDisplayableErrorCustom();

        uint64_t v4 = (void *)v7;
      }
      id v8 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      [v9 presentViewController:v8 animated:1 completion:0];
    }
    [v9 updateSectionVisibilityAndReloadIfNecessaryForSection:2];
    WeakRetained = v9;
  }
}

- (id)_viewControllerForTransactionGroup:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 3)
  {
    id v5 = [PKPaymentTransactionsInYearTableViewController alloc];
    id v6 = [v4 startDate];
    uint64_t v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v8 = [(PKPaymentTransactionsInYearTableViewController *)v5 initWithDateFromYear:v6 calendar:v7 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection detailViewStyle:self->_detailViewStyle paymentServiceDataProvider:self->_paymentServiceDataProvider contactResolver:self->_contactResolver peerPaymentWebService:self->_peerPaymentWebService account:self->_account];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_transactionDetailViewControllerForTransaction:(id)a3
{
  id v4 = a3;
  if ([v4 transactionType] == 9)
  {
    transactionFetcher = self->_transactionFetcher;
    id v6 = [v4 identifier];
    id v12 = 0;
    uint64_t v7 = [(PKDashboardTransactionFetcher *)transactionFetcher cashbackGroupForTransactionWithIdentifier:v6 cashbackTransactionSourceCollection:&v12];
    id v8 = v12;

    id v9 = [[PKTransactionHistoryViewController alloc] initWithTransactionGroup:v7 transactionSourceCollection:v8 familyCollection:self->_familyCollection account:0 accountUserCollection:0 physicalCards:0 fetcher:0 transactionHistory:0 detailViewStyle:self->_detailViewStyle];
  }
  else
  {
    if ([(PKPaymentTransactionDetailsFactory *)self->_transactionDetailsFactory canShowTransactionHistoryForTransaction:v4 transactionSourceCollection:self->_transactionSourceCollection]&& !self->_detailViewStyle)
    {
      uint64_t v10 = [(PKPaymentTransactionDetailsFactory *)self->_transactionDetailsFactory historyViewControllerForTransaction:v4 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:0 accountUserCollection:0 physicalCards:0];
    }
    else
    {
      uint64_t v10 = [(PKPaymentTransactionDetailsFactory *)self->_transactionDetailsFactory detailViewControllerForTransaction:v4 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:0 accountUserCollection:0 bankConnectInstitution:0 physicalCards:0];
    }
    id v9 = (PKTransactionHistoryViewController *)v10;
  }

  return v9;
}

- (void)_fetchDataWithCompletion:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke;
  v15[3] = &unk_1E59CFF08;
  int v17 = v18;
  id v6 = v5;
  v16 = v6;
  [(PKFamilyMemberTransactionsViewController *)self _reloadTransactionsWithCompletion:v15];
  dispatch_group_enter(v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke_2;
  v12[3] = &unk_1E59CFF08;
  v14 = v18;
  uint64_t v7 = v6;
  id v13 = v7;
  [(PKFamilyMemberTransactionsViewController *)self _reloadTransactionGroupsWithCompletion:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke_3;
  v9[3] = &unk_1E59D1FE0;
  id v10 = v4;
  id v11 = v18;
  id v8 = v4;
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], v9);

  _Block_object_dispose(v18, 8);
}

void __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = (a2 & 1) != 0 || *(unsigned char *)(v2 + 24) != 0;
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v3 = (a2 & 1) != 0 || *(unsigned char *)(v2 + 24) != 0;
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __69__PKFamilyMemberTransactionsViewController__fetchDataWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
  return result;
}

- (void)_reloadTransactionsWithCompletion:(id)a3
{
  id v4 = a3;
  transactionFetcher = self->_transactionFetcher;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PKFamilyMemberTransactionsViewController__reloadTransactionsWithCompletion___block_invoke;
  v7[3] = &unk_1E59CAD40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PKDashboardTransactionFetcher *)transactionFetcher reloadTransactionsWithCompletion:v7];
}

void __78__PKFamilyMemberTransactionsViewController__reloadTransactionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKFamilyMemberTransactionsViewController__reloadTransactionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CE110;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __78__PKFamilyMemberTransactionsViewController__reloadTransactionsWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateWithTransactions:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_reloadTransactionGroupsWithCompletion:(id)a3
{
  id v4 = a3;
  transactionFetcher = self->_transactionFetcher;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PKFamilyMemberTransactionsViewController__reloadTransactionGroupsWithCompletion___block_invoke;
  v7[3] = &unk_1E59CAD40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PKDashboardTransactionFetcher *)transactionFetcher transactionCountByPeriod:4 withCompletion:v7];
}

void __83__PKFamilyMemberTransactionsViewController__reloadTransactionGroupsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKFamilyMemberTransactionsViewController__reloadTransactionGroupsWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CE110;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __83__PKFamilyMemberTransactionsViewController__reloadTransactionGroupsWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateWithTransactionGroups:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)_updateWithTransactions:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_transactions) {
    int v6 = objc_msgSend(v4, "isEqualToArray:") ^ 1;
  }
  else {
    LOBYTE(v6) = 1;
  }
  id v7 = (NSArray *)[v5 copy];
  transactions = self->_transactions;
  self->_transactions = v7;

  return v6;
}

- (BOOL)_updateWithTransactionGroups:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_transactionGroups) {
    int v6 = objc_msgSend(v4, "isEqualToArray:") ^ 1;
  }
  else {
    LOBYTE(v6) = 1;
  }
  id v7 = (NSArray *)[v5 copy];
  transactionGroups = self->_transactionGroups;
  self->_transactionGroups = v7;

  return v6;
}

- (id)_contactKeysToFetch
{
  v11[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v11[0] = v2;
  Class v3 = _MergedGlobals_9_1();
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v5 = -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", [v4 _supportsForceTouch]);
  v11[1] = v5;
  int v6 = [(Class)off_1EC34A148() descriptorForRequiredKeys];
  v11[2] = v6;
  id v7 = [(Class)off_1EC34A150() descriptorForRequiredKeys];
  uint64_t v8 = *MEMORY[0x1E4F1ADC8];
  v11[3] = v7;
  v11[4] = v8;
  v11[5] = *MEMORY[0x1E4F1AEE0];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_transactionGroups, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_formatterYear, 0);
  objc_storeStrong((id *)&self->_transactionCellController, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_transactionDetailsFactory, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);

  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end