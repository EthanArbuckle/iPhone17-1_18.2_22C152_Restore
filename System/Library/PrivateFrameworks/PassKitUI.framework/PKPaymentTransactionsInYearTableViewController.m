@interface PKPaymentTransactionsInYearTableViewController
+ (id)titleForYear:(id)a3;
- (PKPaymentTransactionsInYearTableViewController)initWithDateFromYear:(id)a3 calendar:(id)a4 transactionSourceCollection:(id)a5 familyCollection:(id)a6 detailViewStyle:(int64_t)a7 paymentServiceDataProvider:(id)a8 contactResolver:(id)a9 peerPaymentWebService:(id)a10 account:(id)a11;
- (id)_transactionDetailViewControllerForTransaction:(id)a3;
- (id)_transactionMonthFormatter;
- (id)_withdrawalFeeMonthYearFormatter;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_sectionTypeForSection:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchDataAndRevealContent;
- (void)_fetchDataWithCompletion:(id)a3;
- (void)_loadBankConnectAccountWithCompletion:(id)a3;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updateWithTransactions:(id)a3 completion:(id)a4;
- (void)bankConnectConsentStatusDidChange:(unint64_t)a3;
- (void)didUpdateTransactions:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)transactionsChanged:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentTransactionsInYearTableViewController

- (PKPaymentTransactionsInYearTableViewController)initWithDateFromYear:(id)a3 calendar:(id)a4 transactionSourceCollection:(id)a5 familyCollection:(id)a6 detailViewStyle:(int64_t)a7 paymentServiceDataProvider:(id)a8 contactResolver:(id)a9 peerPaymentWebService:(id)a10 account:(id)a11
{
  id v17 = a3;
  id v35 = a4;
  id v34 = a5;
  id v30 = a6;
  id v33 = a6;
  id v32 = a8;
  id v18 = a9;
  id v31 = a10;
  id v19 = a11;
  v36.receiver = self;
  v36.super_class = (Class)PKPaymentTransactionsInYearTableViewController;
  v20 = -[PKPaymentTransactionsInYearTableViewController initWithStyle:](&v36, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"));
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_dateFromYear, a3);
    objc_storeStrong((id *)&v21->_calendar, a4);
    objc_storeStrong((id *)&v21->_transactionSourceCollection, a5);
    objc_storeStrong((id *)&v21->_paymentServiceDataProvider, a8);
    objc_storeStrong((id *)&v21->_contactResolver, a9);
    objc_storeStrong((id *)&v21->_peerPaymentWebService, a10);
    v21->_detailViewStyle = a7;
    objc_storeStrong((id *)&v21->_familyCollection, v30);
    v22 = [[PKPaymentTransactionCellController alloc] initWithContactResolver:v18];
    transactionCellController = v21->_transactionCellController;
    v21->_transactionCellController = v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionSourceCollection:v21->_transactionSourceCollection paymentDataProvider:v21->_paymentServiceDataProvider];
    transactionFetcher = v21->_transactionFetcher;
    v21->_transactionFetcher = (PKDashboardTransactionFetcher *)v24;

    [(PKDashboardTransactionFetcher *)v21->_transactionFetcher setDelegate:v21];
    v26 = [[PKPaymentTransactionDetailsFactory alloc] initWithContactResolver:v21->_contactResolver peerPaymentWebService:v21->_peerPaymentWebService paymentServiceDataProvider:v21->_paymentServiceDataProvider detailViewStyle:v21->_detailViewStyle];
    transactionDetailsFactory = v21->_transactionDetailsFactory;
    v21->_transactionDetailsFactory = v26;

    objc_storeStrong((id *)&v21->_account, a11);
  }

  return v21;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionsInYearTableViewController;
  [(PKPaymentTransactionsInYearTableViewController *)&v9 viewDidLoad];
  v3 = [(id)objc_opt_class() titleForYear:self->_dateFromYear];
  v4 = [(PKPaymentTransactionsInYearTableViewController *)self navigationItem];
  [v4 setTitle:v3];

  v5 = [(PKPaymentTransactionsInYearTableViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionTableCellReuseIdentifier"];
  [v5 setEstimatedRowHeight:76.0];
  [v5 setRowHeight:*MEMORY[0x1E4FB2F28]];
  objc_msgSend(v5, "pkui_setupForReadableContentGuide");
  [(PKPaymentTransactionsInYearTableViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
  if (self->_detailViewStyle == 2 || !PKBankConnectEnabled())
  {
    [(PKPaymentTransactionsInYearTableViewController *)self _fetchDataAndRevealContent];
  }
  else
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__PKPaymentTransactionsInYearTableViewController_viewDidLoad__block_invoke;
    v6[3] = &unk_1E59CB100;
    objc_copyWeak(&v7, &location);
    [(PKPaymentTransactionsInYearTableViewController *)self _loadBankConnectAccountWithCompletion:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __61__PKPaymentTransactionsInYearTableViewController_viewDidLoad__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _fetchDataAndRevealContent];
  }
}

- (void)_loadBankConnectAccountWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  v6 = [v5 primaryAccountIdentifier];

  id v7 = (FKBankConnectAccountsProvider *)[objc_alloc(MEMORY[0x1E4F26BB0]) initWithPrimaryAccountIdentifier:v6];
  bankConnectAccountsProvider = self->_bankConnectAccountsProvider;
  self->_bankConnectAccountsProvider = v7;

  [(FKBankConnectAccountsProvider *)self->_bankConnectAccountsProvider setDelegate:self];
  objc_initWeak(&location, self);
  objc_super v9 = self->_bankConnectAccountsProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__PKPaymentTransactionsInYearTableViewController__loadBankConnectAccountWithCompletion___block_invoke;
  v12[3] = &unk_1E59DDDD8;
  objc_copyWeak(&v16, &location);
  id v10 = v6;
  id v13 = v10;
  v14 = self;
  id v11 = v4;
  id v15 = v11;
  [(FKBankConnectAccountsProvider *)v9 accountAndReconsentStatusWithCompletion:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __88__PKPaymentTransactionsInYearTableViewController__loadBankConnectAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__PKPaymentTransactionsInYearTableViewController__loadBankConnectAccountWithCompletion___block_invoke_2;
  v12[3] = &unk_1E59D0DC8;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  id v13 = v5;
  id v14 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  objc_super v9 = *(void **)(a1 + 48);
  id v15 = v7;
  uint64_t v16 = v8;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v12);

  objc_destroyWeak(&v18);
}

void __88__PKPaymentTransactionsInYearTableViewController__loadBankConnectAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v15 = WeakRetained;
    uint64_t v4 = [*(id *)(a1 + 32) consentStatus];
    if (*(void *)(a1 + 40)
      || (uint64_t v5 = v4,
          [*(id *)(a1 + 32) account],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          !v6)
      || v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      uint64_t v7 = [*(id *)(a1 + 32) institution];
      uint64_t v8 = (void *)v15[148];
      v15[148] = v7;

      objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F26BE8]) initWithPrimaryAccountIdentifier:*(void *)(a1 + 48) dateFromYear:*(void *)(*(void *)(a1 + 56) + 1024) groupType:1];
      id v10 = objc_loadWeakRetained(v2);
      [v9 setDelegate:v10];

      [v9 performFetchAndStartObservingNotifications];
      id v11 = (void *)v15[147];
      v15[147] = v9;
      id v12 = v9;

      uint64_t v13 = [*(id *)(a1 + 32) institution];
      id v14 = (void *)v15[148];
      v15[148] = v13;

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    id WeakRetained = v15;
  }
}

- (void)_fetchDataAndRevealContent
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__PKPaymentTransactionsInYearTableViewController__fetchDataAndRevealContent__block_invoke;
  v3[3] = &unk_1E59CB268;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  [(PKPaymentTransactionsInYearTableViewController *)self _fetchDataWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __76__PKPaymentTransactionsInYearTableViewController__fetchDataAndRevealContent__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E4FB1EB0];
    id v4 = [*(id *)(a1 + 32) tableView];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __76__PKPaymentTransactionsInYearTableViewController__fetchDataAndRevealContent__block_invoke_2;
    v5[3] = &unk_1E59CA7D0;
    v5[4] = *(void *)(a1 + 32);
    [v3 transitionWithView:v4 duration:5242880 options:v5 animations:0 completion:0.3];

    WeakRetained[1152] = 1;
    [WeakRetained _setNeedsUpdateContentUnavailableConfiguration];
  }
}

void __76__PKPaymentTransactionsInYearTableViewController__fetchDataAndRevealContent__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  if (self->_contentRevealed)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __99__PKPaymentTransactionsInYearTableViewController__updateContentUnavailableConfigurationUsingState___block_invoke;
    v5[3] = &unk_1E59CA7D0;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 0, v5, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB1658], "loadingConfiguration", a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(PKPaymentTransactionsInYearTableViewController *)self _setContentUnavailableConfiguration:v4];
  }
}

uint64_t __99__PKPaymentTransactionsInYearTableViewController__updateContentUnavailableConfigurationUsingState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setContentUnavailableConfiguration:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v4 = [(NSArray *)self->_transactionsByMonth count];
  if ([(NSArray *)self->_instantWithdrawalFeesTransactionGroups count]) {
    return v4 + 1;
  }
  else {
    return v4;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v6 = [(PKPaymentTransactionsInYearTableViewController *)self _sectionTypeForSection:a4];
  if (v6 == 1)
  {
    instantWithdrawalFeesTransactionGroups = self->_instantWithdrawalFeesTransactionGroups;
    return [(NSArray *)instantWithdrawalFeesTransactionGroups count];
  }
  else if (v6)
  {
    return 0;
  }
  else
  {
    uint64_t v7 = [(NSArray *)self->_transactionsByMonth objectAtIndexedSubscript:a4];
    int64_t v8 = [v7 count];

    return v8;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[PKPaymentTransactionsInYearTableViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", [v7 section]);
  if (v8 == 1)
  {
    objc_super v9 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentInstantWithdrawalTableCellReuseIdentifier"];
    if (!v9) {
      objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PKPaymentInstantWithdrawalTableCellReuseIdentifier"];
    }
    id v10 = -[NSArray objectAtIndex:](self->_instantWithdrawalFeesTransactionGroups, "objectAtIndex:", [v7 row]);
    uint64_t v15 = [v7 row];
    if (v15 == [(NSArray *)self->_instantWithdrawalFeesTransactionGroups count] - 1)
    {
      id v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_12.isa);
    }
    else
    {
      uint64_t v16 = [(PKPaymentTransactionsInYearTableViewController *)self _withdrawalFeeMonthYearFormatter];
      id v17 = [v10 startDate];
      id v11 = [v16 stringFromDate:v17];
    }
    id v18 = [v9 textLabel];
    [v18 setText:v11];

    id v19 = [v9 detailTextLabel];
    v20 = [v10 totalAmount];
    v21 = [v20 formattedStringValue];
    [v19 setText:v21];
  }
  else
  {
    if (v8)
    {
      objc_super v9 = 0;
      goto LABEL_15;
    }
    objc_super v9 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionTableCellReuseIdentifier" forIndexPath:v7];
    id v10 = -[NSArray objectAtIndexedSubscript:](self->_transactionsByMonth, "objectAtIndexedSubscript:", [v7 section]);
    id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    id v12 = [(PKPaymentDataProvider *)self->_paymentServiceDataProvider deviceName];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      PKDeviceName();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v19 = v14;

    transactionSourceCollection = self->_transactionSourceCollection;
    v23 = [v11 transactionSourceIdentifier];
    v20 = [(PKTransactionSourceCollection *)transactionSourceCollection transactionSourceForTransactionSourceIdentifier:v23];

    v21 = [(PKFamilyMemberCollection *)self->_familyCollection familyMemberForTransactionSource:v20];
    [(PKPaymentTransactionCellController *)self->_transactionCellController configureCell:v9 forTransaction:v11 transactionSource:v20 familyMember:v21 account:self->_account detailStyle:self->_detailViewStyle deviceName:v19 avatarViewDelegate:self];
  }

LABEL_15:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v6 = [(PKPaymentTransactionsInYearTableViewController *)self _sectionTypeForSection:a4];
  if (v6 == 1)
  {
    id v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_13.isa);
  }
  else if (v6)
  {
    id v11 = 0;
  }
  else
  {
    id v7 = [(NSArray *)self->_transactionsByMonth objectAtIndexedSubscript:a4];
    int64_t v8 = [v7 firstObject];
    objc_super v9 = [v8 transactionDate];
    id v10 = [(PKPaymentTransactionsInYearTableViewController *)self _transactionMonthFormatter];
    id v11 = [v10 stringFromDate:v9];
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  [a3 deselectRowAtIndexPath:v10 animated:1];
  if (!-[PKPaymentTransactionsInYearTableViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", [v10 section]))
  {
    int64_t v6 = -[NSArray objectAtIndexedSubscript:](self->_transactionsByMonth, "objectAtIndexedSubscript:", [v10 section]);
    id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    int64_t v8 = [(PKPaymentTransactionsInYearTableViewController *)self _transactionDetailViewControllerForTransaction:v7];
    objc_super v9 = [(PKPaymentTransactionsInYearTableViewController *)self navigationController];
    [v9 pushViewController:v8 animated:1];
  }
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  if (-[PKPaymentTransactionsInYearTableViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", [v10 section]))
  {
    id v11 = 0;
  }
  else
  {
    id v12 = -[NSArray objectAtIndexedSubscript:](self->_transactionsByMonth, "objectAtIndexedSubscript:", [v10 section]);
    uint64_t v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v10, "row"));
    id v14 = [v9 cellForRowAtIndexPath:v10];
    uint64_t v15 = v14;
    if (v13) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16
      && ([v14 transactionView],
          id v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = objc_msgSend(v17, "shouldShowTransactionPreviewForTouchAtPoint:inView:", v9, x, y),
          v17,
          v18)
      && ([(PKPaymentTransactionsInYearTableViewController *)self _transactionDetailViewControllerForTransaction:v13], (id v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v20 = (void *)MEMORY[0x1E4FB1678];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __108__PKPaymentTransactionsInYearTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
      v23[3] = &unk_1E59D28F8;
      id v24 = v19;
      id v21 = v19;
      id v11 = [v20 configurationWithIdentifier:0 previewProvider:v23 actionProvider:&__block_literal_global_207];
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

id __108__PKPaymentTransactionsInYearTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __108__PKPaymentTransactionsInYearTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2()
{
  return 0;
}

- (int64_t)_sectionTypeForSection:(int64_t)a3
{
  return [(NSArray *)self->_transactionsByMonth count] <= a3;
}

- (id)_transactionDetailViewControllerForTransaction:(id)a3
{
  id v4 = a3;
  if (self->_peerPaymentWebService) {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85EC0], 0);
  }
  if ([v4 transactionType] == 9)
  {
    transactionFetcher = self->_transactionFetcher;
    int64_t v6 = [v4 identifier];
    id v7 = [(PKDashboardTransactionFetcher *)transactionFetcher cashbackGroupForTransactionWithIdentifier:v6 cashbackTransactionSourceCollection:0];

    int64_t v8 = [[PKTransactionHistoryViewController alloc] initWithTransactionGroup:v7 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:self->_account accountUserCollection:0 physicalCards:0 fetcher:0 transactionHistory:0 detailViewStyle:self->_detailViewStyle];
  }
  else
  {
    if ([(PKPaymentTransactionDetailsFactory *)self->_transactionDetailsFactory canShowTransactionHistoryForTransaction:v4 transactionSourceCollection:self->_transactionSourceCollection]&& !self->_detailViewStyle)
    {
      uint64_t v9 = [(PKPaymentTransactionDetailsFactory *)self->_transactionDetailsFactory historyViewControllerForTransaction:v4 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:self->_account accountUserCollection:0 physicalCards:0];
    }
    else
    {
      uint64_t v9 = [(PKPaymentTransactionDetailsFactory *)self->_transactionDetailsFactory detailViewControllerForTransaction:v4 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:self->_account accountUserCollection:0 bankConnectInstitution:self->_bankConnectInstitution physicalCards:0];
    }
    int64_t v8 = (PKTransactionHistoryViewController *)v9;
  }

  return v8;
}

+ (id)titleForYear:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v7 = (void *)[v6 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  [v5 setCalendar:v7];

  [v5 setLocalizedDateFormatFromTemplate:@"y"];
  int64_t v8 = [v5 stringFromDate:v4];

  uint64_t v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas.isa, &stru_1EF1B4C70.isa, v8);

  return v9;
}

- (id)_transactionMonthFormatter
{
  transactionMonthFormatter = self->_transactionMonthFormatter;
  if (!transactionMonthFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v5 = self->_transactionMonthFormatter;
    self->_transactionMonthFormatter = v4;

    [(NSDateFormatter *)self->_transactionMonthFormatter setCalendar:self->_calendar];
    [(NSDateFormatter *)self->_transactionMonthFormatter setLocalizedDateFormatFromTemplate:@"LLLL"];
    transactionMonthFormatter = self->_transactionMonthFormatter;
  }

  return transactionMonthFormatter;
}

- (id)_withdrawalFeeMonthYearFormatter
{
  withdrawalFeeMonthYearFormatter = self->_withdrawalFeeMonthYearFormatter;
  if (!withdrawalFeeMonthYearFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v5 = self->_withdrawalFeeMonthYearFormatter;
    self->_withdrawalFeeMonthYearFormatter = v4;

    [(NSDateFormatter *)self->_withdrawalFeeMonthYearFormatter setCalendar:self->_calendar];
    [(NSDateFormatter *)self->_withdrawalFeeMonthYearFormatter setLocalizedDateFormatFromTemplate:@"LLLL yyyy"];
    withdrawalFeeMonthYearFormatter = self->_withdrawalFeeMonthYearFormatter;
  }

  return withdrawalFeeMonthYearFormatter;
}

- (void)_fetchDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NSCalendar *)self->_calendar components:6 fromDate:self->_dateFromYear];
  calendar = self->_calendar;
  id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  int64_t v8 = [(NSCalendar *)calendar nextDateAfterDate:v7 matchingComponents:v5 options:4098];

  uint64_t v9 = [(NSCalendar *)self->_calendar dateByAddingUnit:4 value:1 toDate:v8 options:4098];
  id v10 = [(PKAccount *)self->_account createdDate];
  id v11 = v10;
  if (v10 && [v10 compare:v8] == 1 && objc_msgSend(v11, "compare:", v9) == -1)
  {
    id v12 = v11;

    int64_t v8 = v12;
  }
  [(PKDashboardTransactionFetcher *)self->_transactionFetcher setLimit:0 startDate:v8 endDate:v9];
  transactionFetcher = self->_transactionFetcher;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKPaymentTransactionsInYearTableViewController__fetchDataWithCompletion___block_invoke;
  v15[3] = &unk_1E59CAD40;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [(PKDashboardTransactionFetcher *)transactionFetcher reloadTransactionsWithCompletion:v15];
}

uint64_t __75__PKPaymentTransactionsInYearTableViewController__fetchDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateWithTransactions:a2 completion:*(void *)(a1 + 40)];
}

- (void)_updateWithTransactions:(id)a3 completion:(id)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"transactionDate" ascending:0];
  v50[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  id v10 = [v6 sortedArrayUsingDescriptors:v9];

  unint64_t v11 = 0x1E4F1C000uLL;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![v10 count]) {
    goto LABEL_16;
  }
  id v34 = v7;
  objc_super v36 = v8;
  id v37 = v6;
  id v12 = [v10 firstObject];
  uint64_t v13 = [v12 transactionDate];

  uint64_t v14 = 1032;
  uint64_t v15 = [(NSCalendar *)self->_calendar components:14 fromDate:v13];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v35 = v10;
  id obj = v10;
  uint64_t v40 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v40) {
    goto LABEL_13;
  }
  uint64_t v17 = *(void *)v46;
  do
  {
    uint64_t v18 = 0;
    id v19 = v13;
    do
    {
      if (*(void *)v46 != v17) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v45 + 1) + 8 * v18);
      uint64_t v13 = [v20 transactionDate];

      if (([*(id *)((char *)&self->super.super.super.super.isa + v14) date:v13 matchesComponents:v15] & 1) == 0)
      {
        if (![v16 count]) {
          goto LABEL_11;
        }
        id v21 = (void *)[v16 copy];
        [v38 addObject:v21];

        id v22 = objc_alloc_init(*(Class *)(v11 + 2632));
        uint64_t v23 = [*(id *)((char *)&self->super.super.super.super.isa + v14) components:14 fromDate:v13];
        id v24 = v15;
        uint64_t v25 = v17;
        uint64_t v26 = v14;
        unint64_t v27 = v11;
        v28 = self;
        uint64_t v29 = v23;

        id v16 = v22;
        id v30 = (void *)v29;
        self = v28;
        unint64_t v11 = v27;
        uint64_t v14 = v26;
        uint64_t v17 = v25;
        uint64_t v15 = v30;
      }
      [v16 addObject:v20];
LABEL_11:
      ++v18;
      id v19 = v13;
    }
    while (v40 != v18);
    uint64_t v40 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  }
  while (v40);
LABEL_13:

  if ([v16 count])
  {
    id v31 = (void *)[v16 copy];
    [v38 addObject:v31];
  }
  int64_t v8 = v36;
  id v6 = v37;
  id v7 = v34;
  id v10 = v35;
LABEL_16:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentTransactionsInYearTableViewController__updateWithTransactions_completion___block_invoke;
  block[3] = &unk_1E59CE110;
  id v42 = v38;
  v43 = self;
  id v44 = v7;
  id v32 = v7;
  id v33 = v38;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __85__PKPaymentTransactionsInYearTableViewController__updateWithTransactions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) copy];
  v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v11 = v2;
  if (*(void *)(v4 + 1040))
  {
    int v5 = objc_msgSend(v2, "isEqualToArray:");
    v3 = v11;
    uint64_t v6 = v5 ^ 1u;
    uint64_t v4 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v6 = 1;
  }
  objc_storeStrong((id *)(v4 + 1040), v3);
  uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 1128) instantWithdrawalFeesTransactionGroups];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(v8 + 1048);
  *(void *)(v8 + 1048) = v7;

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v6);
  }
}

- (void)transactionsChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (self->_contentRevealed)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __70__PKPaymentTransactionsInYearTableViewController_transactionsChanged___block_invoke;
    v5[3] = &unk_1E59CB100;
    objc_copyWeak(&v6, &location);
    [(PKPaymentTransactionsInYearTableViewController *)self _updateWithTransactions:v4 completion:v5];
    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);
}

void __70__PKPaymentTransactionsInYearTableViewController_transactionsChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained tableView];
    [v2 reloadData];

    id WeakRetained = v3;
  }
}

- (void)didUpdateTransactions:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_contentRevealed)
  {
    self->_contentRevealed = 1;
    [(PKPaymentTransactionsInYearTableViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
  }
  int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4F84CF8]) initFromFKTransaction:*(void *)(*((void *)&v18 + 1) + 8 * i) institution:self->_bankConnectInstitution];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v12 = (void *)MEMORY[0x1E4F84CF8];
  uint64_t v13 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceIdentifiers];
  uint64_t v14 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  uint64_t v15 = [v14 uniqueID];
  paymentServiceDataProvider = self->_paymentServiceDataProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PKPaymentTransactionsInYearTableViewController_didUpdateTransactions___block_invoke;
  v17[3] = &unk_1E59CB328;
  v17[4] = self;
  [v12 augmentTransactionsIfNeeded:v5 transactionSourceIdentifiers:v13 passUniqueID:v15 usingDataProvider:paymentServiceDataProvider completion:v17];
}

uint64_t __72__PKPaymentTransactionsInYearTableViewController_didUpdateTransactions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transactionsChanged:a2];
}

- (void)bankConnectConsentStatusDidChange:(unint64_t)a3
{
  if (a3)
  {
    id v4 = [(PKPaymentTransactionsInYearTableViewController *)self navigationController];
    id v3 = (id)[v4 popViewControllerAnimated:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankConnectInstitution, 0);
  objc_storeStrong((id *)&self->_bankConnectTransactionsProvider, 0);
  objc_storeStrong((id *)&self->_bankConnectAccountsProvider, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionDetailsFactory, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_withdrawalFeeMonthYearFormatter, 0);
  objc_storeStrong((id *)&self->_transactionMonthFormatter, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_transactionCellController, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_instantWithdrawalFeesTransactionGroups, 0);
  objc_storeStrong((id *)&self->_transactionsByMonth, 0);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_dateFromYear, 0);
}

@end