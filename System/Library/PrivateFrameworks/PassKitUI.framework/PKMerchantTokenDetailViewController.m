@interface PKMerchantTokenDetailViewController
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKMerchantTokenDetailViewController)initWithMerchantToken:(id)a3;
- (PKMerchantTokenDetailViewControllerDelegate)delegate;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_contactKeysToFetch;
- (id)_deletePaymentMethodCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_headerCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_manageAutoReloadCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_managePaymentMethodCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_manageRecurringPaymentCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)presentationSceneIdentifierForTopUpController:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_deleteMerchantToken;
- (void)_didSelectAutoReloadManagement;
- (void)_didSelectDeletePaymentMethod;
- (void)_didSelectRecurringPaymentAtIndexPath:(id)a3;
- (void)_disableNavigation;
- (void)_enableNavigation;
- (void)_hideLoadingView;
- (void)_setUpLoadingView;
- (void)_setUpTableView;
- (void)_setUpViews;
- (void)_showLoadingView;
- (void)_updateRecurringPaymentsWithCompletion:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)recurringPaymentsChanged;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsPopViewController:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4;
- (void)thresholdTopUpControllerCompletedSetup:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillLayoutSubviews;
@end

@implementation PKMerchantTokenDetailViewController

- (PKMerchantTokenDetailViewController)initWithMerchantToken:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKMerchantTokenDetailViewController;
  v6 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v23, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1), 5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_merchantToken, a3);
    v7->_showMerchantIcon = PKMerchantTokensForceMerchantIconsEnabled();
    uint64_t v8 = [MEMORY[0x1E4F84D50] sharedService];
    webService = v7->_webService;
    v7->_webService = (PKPaymentWebService *)v8;

    v10 = [(PKMerchantTokenDetailViewController *)v7 navigationItem];
    objc_msgSend(v10, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v10, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v11 = [v5 merchantName];
    v12 = v11;
    if (!v7->_showMerchantIcon && [v11 length]) {
      [v10 setTitle:v12];
    }
    if ([(PKMerchantToken *)v7->_merchantToken isAppleCashPaymentToken])
    {
      v13 = [MEMORY[0x1E4F84E00] sharedInstance];
      uint64_t v14 = [v13 account];
      peerPaymentAccount = v7->_peerPaymentAccount;
      v7->_peerPaymentAccount = (PKPeerPaymentAccount *)v14;

      [v13 registerObserver:v7];
      id v16 = objc_alloc_init(MEMORY[0x1E4F1B980]);
      id v17 = objc_alloc(MEMORY[0x1E4F845E8]);
      v18 = [(PKMerchantTokenDetailViewController *)v7 _contactKeysToFetch];
      v19 = (void *)[v17 initWithContactStore:v16 keysToFetch:v18];

      v20 = [[PKPaymentTransactionCellController alloc] initWithContactResolver:v19 context:0];
      transactionPresenter = v7->_transactionPresenter;
      v7->_transactionPresenter = v20;
    }
  }

  return v7;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(PKMerchantToken *)self->_merchantToken isAppleCashPaymentToken])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__PKMerchantTokenDetailViewController_preflightWithCompletion___block_invoke;
    v5[3] = &unk_1E59CAA98;
    id v6 = v4;
    [(PKMerchantTokenDetailViewController *)self _updateRecurringPaymentsWithCompletion:v5];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

uint64_t __63__PKMerchantTokenDetailViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F84E00] sharedInstance];
  objc_initWeak(&location, self);
  id v6 = [(PKMerchantToken *)self->_merchantToken merchantTokenId];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke;
  v9[3] = &unk_1E59D6F48;
  id v7 = v6;
  id v10 = v7;
  objc_copyWeak(&v12, &location);
  id v8 = v4;
  id v11 = v8;
  [v5 recurringPaymentsWithCompletion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke(id *a1, void *a2)
{
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_2;
  v16[3] = &unk_1E59D6EF8;
  id v17 = a1[4];
  id v4 = a2;
  id v5 = objc_msgSend(v4, "pk_firstObjectPassingTest:", v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_3;
  v14[3] = &unk_1E59D6F20;
  id v15 = a1[4];
  id v6 = objc_msgSend(v4, "pk_objectsPassingTest:", v14);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_4;
  v9[3] = &unk_1E59D11A8;
  objc_copyWeak(&v13, a1 + 6);
  id v10 = v5;
  id v11 = v6;
  id v12 = a1[5];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

uint64_t __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v3 fundingSource];
    id v6 = [v5 mpanIdentifier];
    id v7 = v4;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
      if (v7 && v8) {
        uint64_t v10 = [v7 isEqualToString:v8];
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 1 && objc_msgSend(v3, "sentByMe"))
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v3 fundingSource];
    id v6 = [v5 mpanIdentifier];
    id v7 = v4;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
      if (v7 && v8) {
        uint64_t v10 = [v7 isEqualToString:v8];
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __78__PKMerchantTokenDetailViewController__updateRecurringPaymentsWithCompletion___block_invoke_4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 141, *(id *)(a1 + 32));
    objc_storeStrong(WeakRetained + 143, *(id *)(a1 + 40));
    if ([WeakRetained isViewLoaded]) {
      [WeakRetained reloadData];
    }
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2) {
      (*(void (**)(void))(v2 + 16))();
    }
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKMerchantTokenDetailViewController;
  [(PKSectionTableViewController *)&v3 viewDidLoad];
  [(PKMerchantTokenDetailViewController *)self _setUpViews];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKMerchantTokenDetailViewController;
  [(PKMerchantTokenDetailViewController *)&v8 viewDidAppear:a3];
  objc_super v3 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v4 = *MEMORY[0x1E4F87038];
  uint64_t v5 = *MEMORY[0x1E4F86730];
  v9[0] = *MEMORY[0x1E4F86308];
  v9[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F86628];
  v10[0] = *MEMORY[0x1E4F864A0];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v3 subject:v4 sendEvent:v7];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKMerchantTokenDetailViewController;
  [(PKMerchantTokenDetailViewController *)&v10 viewDidDisappear:a3];
  if (([(PKMerchantTokenDetailViewController *)self isBeingDismissed] & 1) != 0
    || [(PKMerchantTokenDetailViewController *)self isMovingFromParentViewController])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v5 = *MEMORY[0x1E4F87038];
    uint64_t v6 = *MEMORY[0x1E4F86380];
    uint64_t v7 = *MEMORY[0x1E4F86120];
    v11[0] = *MEMORY[0x1E4F86308];
    v11[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F860D0];
    v12[0] = v6;
    v12[1] = v8;
    v11[2] = *MEMORY[0x1E4F86730];
    v12[2] = *MEMORY[0x1E4F86628];
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
    [v4 subject:v5 sendEvent:v9];
  }
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKMerchantTokenDetailViewController;
  [(PKMerchantTokenDetailViewController *)&v14 viewWillLayoutSubviews];
  objc_super v3 = [(PKMerchantTokenDetailViewController *)self tableView];
  uint64_t v4 = [(PKMerchantTokenDetailViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

  uint64_t v5 = [(PKMerchantTokenDetailViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[PKMerchantTokenLoadingView setFrame:](self->_loadingView, "setFrame:", v7, v9, v11, v13);
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)PKMerchantTokenDetailViewController;
  [(PKMerchantTokenDetailViewController *)&v2 viewDidLayoutSubviews];
}

- (void)viewLayoutMarginsDidChange
{
  v12.receiver = self;
  v12.super_class = (Class)PKMerchantTokenDetailViewController;
  [(PKMerchantTokenDetailViewController *)&v12 viewLayoutMarginsDidChange];
  objc_super v3 = [(PKMerchantTokenDetailViewController *)self view];
  [v3 layoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[PKMerchantTokenLoadingView setLayoutMargins:](self->_loadingView, "setLayoutMargins:", v5, v7, v9, v11);
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  objc_super v3 = self;
  LOBYTE(self) = 1;
  switch(a3)
  {
    case 1uLL:
      if ([(PKMerchantToken *)v3->_merchantToken isAppleCashPaymentToken]) {
        LOBYTE(self) = v3->_peerPaymentAccount == 0;
      }
      else {
        LOBYTE(self) = 1;
      }
      break;
    case 2uLL:
      LODWORD(self) = [(PKMerchantToken *)v3->_merchantToken isAppleCashPaymentToken];
      if (self)
      {
        peerPaymentAccount = v3->_peerPaymentAccount;
        LOBYTE(self) = [(PKPeerPaymentAccount *)peerPaymentAccount supportsRecurringPayments];
      }
      break;
    case 3uLL:
      LODWORD(self) = [(PKMerchantToken *)v3->_merchantToken isAppleCashPaymentToken];
      if (self)
      {
        double v4 = v3->_peerPaymentAccount;
        LOBYTE(self) = [(PKPeerPaymentAccount *)v4 supportsThresholdTopUp];
      }
      break;
    case 5uLL:
      LOBYTE(self) = 0;
      break;
    default:
      return (char)self;
  }
  return (char)self;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  int64_t result = 1;
  switch(v5)
  {
    case 0uLL:
      int64_t result = self->_showMerchantIcon;
      break;
    case 2uLL:
      recurringPayments = self->_recurringPayments;
      int64_t result = [(NSArray *)recurringPayments count];
      break;
    case 3uLL:
      int64_t result = self->_autoReload != 0;
      break;
    case 5uLL:
      int64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]))
  {
    case 0uLL:
      uint64_t v8 = [(PKMerchantTokenDetailViewController *)self _headerCellForTableView:v6 atIndexPath:v7];
      goto LABEL_8;
    case 1uLL:
      uint64_t v8 = [(PKMerchantTokenDetailViewController *)self _managePaymentMethodCellForTableView:v6 atIndexPath:v7];
      goto LABEL_8;
    case 2uLL:
      uint64_t v8 = [(PKMerchantTokenDetailViewController *)self _manageRecurringPaymentCellForTableView:v6 atIndexPath:v7];
      goto LABEL_8;
    case 3uLL:
      uint64_t v8 = [(PKMerchantTokenDetailViewController *)self _manageAutoReloadCellForTableView:v6 atIndexPath:v7];
      goto LABEL_8;
    case 4uLL:
      uint64_t v8 = [(PKMerchantTokenDetailViewController *)self _deletePaymentMethodCellForTableView:v6 atIndexPath:v7];
LABEL_8:
      double v9 = (void *)v8;
      break;
    default:
      double v9 = 0;
      break;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] == 2)
  {
    unint64_t v5 = [(NSArray *)self->_recurringPayments count];
    if (v5)
    {
      unint64_t v5 = PKLocalizedPeerPaymentRecurringString(&cfstr_MerchantTokenR.isa);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v5 == 4)
  {
    if ([(PKMerchantToken *)self->_merchantToken isAMPPaymentToken])
    {
      uint64_t v8 = @"MERCHANT_TOKEN_DETAIL_DELETE_APPLE_FOOTER";
LABEL_12:
      uint64_t v10 = PKLocalizedMerchantTokensString(&v8->isa);
LABEL_13:
      double v9 = (void *)v10;
      goto LABEL_23;
    }
    if ([(PKMerchantToken *)self->_merchantToken isDeferredPayment])
    {
      id v6 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_4.isa);
      id v7 = [(PKMerchantToken *)self->_merchantToken merchantName];
      double v13 = [(PKMerchantToken *)self->_merchantToken merchantName];
      double v9 = PKStringWithValidatedFormat();

LABEL_21:
      goto LABEL_22;
    }
    if (![(PKMerchantToken *)self->_merchantToken isAppleCashPaymentToken])
    {
      id v6 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_6.isa);
      id v7 = [(PKMerchantToken *)self->_merchantToken merchantName];
      goto LABEL_20;
    }
    double v11 = @"MERCHANT_TOKEN_DETAIL_DELETE_CASH_FOOTER";
LABEL_27:
    uint64_t v10 = PKLocalizedPeerPaymentRecurringString(&v11->isa);
    goto LABEL_13;
  }
  if (v5 != 1)
  {
    double v9 = 0;
    goto LABEL_23;
  }
  if (![(PKMerchantToken *)self->_merchantToken isAMPPaymentToken])
  {
    if (![(PKMerchantToken *)self->_merchantToken isAppleCashPaymentToken]
      || self->_peerPaymentAccount)
    {
      uint64_t v8 = @"MERCHANT_TOKEN_DETAIL_MANAGE_PAYMENT_METHOD_FOOTER";
      goto LABEL_12;
    }
    double v11 = @"MERCHANT_TOKEN_DETAIL_MANAGE_CASH_PAYMENT_METHOD_FOOTER";
    goto LABEL_27;
  }
  id v6 = PKPrimaryAppleAccountEmail();
  if (v6)
  {
    id v7 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD.isa);
LABEL_20:
    double v9 = PKStringWithValidatedFormat();
    goto LABEL_21;
  }
  double v9 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_0.isa);
LABEL_22:

LABEL_23:

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3)) - 1 < 4;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 1) >= 3)
  {
    if (a4 == 4)
    {
      double v7 = 35.0;
    }
    else if (a4)
    {
      double v7 = 0.0;
    }
    else if (self->_showMerchantIcon)
    {
      double v7 = 26.0;
    }
    else
    {
      double v7 = 0.0;
    }
  }
  else if ([(PKMerchantTokenDetailViewController *)self tableView:v6 numberOfRowsInSection:a4] <= 0)
  {
    double v7 = 0.0;
  }
  else
  {
    double v7 = 25.0;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  [a3 deselectRowAtIndexPath:v13 animated:1];
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v13 section]))
  {
    case 1uLL:
      id v6 = [(PKMerchantToken *)self->_merchantToken merchantTokenManagementURL];
      if (!v6)
      {
        if (([(PKMerchantToken *)self->_merchantToken isAppleCashPaymentToken] & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_11;
      }
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v7 setObject:*MEMORY[0x1E4F86380] forKeyedSubscript:*MEMORY[0x1E4F86308]];
      [v7 setObject:*MEMORY[0x1E4F86628] forKeyedSubscript:*MEMORY[0x1E4F86730]];
      [v7 setObject:*MEMORY[0x1E4F86630] forKeyedSubscript:*MEMORY[0x1E4F86120]];
      uint64_t v8 = [(PKMerchantToken *)self->_merchantToken appleMerchantId];
      [v7 safelySetObject:v8 forKey:*MEMORY[0x1E4F86638]];

      [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F87038] sendEvent:v7];
      if ([(PKMerchantToken *)self->_merchantToken isAMPPaymentToken])
      {
        double v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        [v9 openSensitiveURL:v6 withOptions:0];
LABEL_12:

        goto LABEL_13;
      }
      if ([(PKMerchantToken *)self->_merchantToken isAppleCashPaymentToken])
      {
LABEL_11:
        double v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSBOOK"];
        [v9 openSensitiveURL:v10 withOptions:0];

        goto LABEL_12;
      }
      double v11 = [MEMORY[0x1E4FB1438] sharedApplication];
      int v12 = [v11 canOpenURL:v6];

      if (v12)
      {
        double v9 = [MEMORY[0x1E4FB1438] sharedApplication];
        [v9 openURL:v6 options:MEMORY[0x1E4F1CC08] completionHandler:0];
        goto LABEL_12;
      }
LABEL_13:

LABEL_14:

      return;
    case 2uLL:
      [(PKMerchantTokenDetailViewController *)self _didSelectRecurringPaymentAtIndexPath:v13];
      goto LABEL_14;
    case 3uLL:
      [(PKMerchantTokenDetailViewController *)self _didSelectAutoReloadManagement];
      goto LABEL_14;
    case 4uLL:
      [(PKMerchantTokenDetailViewController *)self _didSelectDeletePaymentMethod];
      goto LABEL_14;
    default:
      goto LABEL_14;
  }
}

- (void)_setUpViews
{
  [(PKMerchantTokenDetailViewController *)self _setUpTableView];

  [(PKMerchantTokenDetailViewController *)self _setUpLoadingView];
}

- (void)_setUpTableView
{
  id v2 = [(PKMerchantTokenDetailViewController *)self tableView];
  [v2 registerClass:objc_opt_class() forCellReuseIdentifier:@"HeaderCell"];
  [v2 registerClass:objc_opt_class() forCellReuseIdentifier:@"ManagePaymentMethodCell"];
  [v2 registerClass:objc_opt_class() forCellReuseIdentifier:@"ManageAutoReloadCell"];
  [v2 registerClass:objc_opt_class() forCellReuseIdentifier:@"ManageRecurringPayment"];
  [v2 setAlwaysBounceVertical:0];
}

- (void)_setUpLoadingView
{
  id v8 = [(PKMerchantTokenDetailViewController *)self view];
  objc_super v3 = [PKMerchantTokenLoadingView alloc];
  double v4 = -[PKMerchantTokenLoadingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  loadingView = self->_loadingView;
  self->_loadingView = v4;

  id v6 = self->_loadingView;
  id v7 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_7.isa);
  [(PKMerchantTokenLoadingView *)v6 setLoadingText:v7];

  [(PKMerchantTokenLoadingView *)self->_loadingView setHidden:1];
  [v8 addSubview:self->_loadingView];
}

- (void)_showLoadingView
{
  id v3 = [(PKMerchantTokenDetailViewController *)self view];
  [(PKMerchantTokenLoadingView *)self->_loadingView setHidden:0];
  [v3 bringSubviewToFront:self->_loadingView];
  [(PKMerchantTokenDetailViewController *)self _disableNavigation];
}

- (void)_hideLoadingView
{
  [(PKMerchantTokenLoadingView *)self->_loadingView setHidden:1];

  [(PKMerchantTokenDetailViewController *)self _enableNavigation];
}

- (void)_enableNavigation
{
  id v3 = [(PKMerchantTokenDetailViewController *)self navigationController];
  double v4 = [v3 navigationBar];
  [v4 setUserInteractionEnabled:1];

  id v6 = [(PKMerchantTokenDetailViewController *)self navigationController];
  unint64_t v5 = [v6 interactivePopGestureRecognizer];
  [v5 setEnabled:1];
}

- (void)_disableNavigation
{
  id v3 = [(PKMerchantTokenDetailViewController *)self navigationController];
  double v4 = [v3 navigationBar];
  [v4 setUserInteractionEnabled:0];

  id v6 = [(PKMerchantTokenDetailViewController *)self navigationController];
  unint64_t v5 = [v6 interactivePopGestureRecognizer];
  [v5 setEnabled:0];
}

- (id)_headerCellForTableView:(id)a3 atIndexPath:(id)a4
{
  unint64_t v5 = [a3 dequeueReusableCellWithIdentifier:@"HeaderCell" forIndexPath:a4];
  [v5 updateCellWithMerchantToken:self->_merchantToken];

  return v5;
}

- (id)_managePaymentMethodCellForTableView:(id)a3 atIndexPath:(id)a4
{
  unint64_t v5 = [a3 dequeueReusableCellWithIdentifier:@"ManagePaymentMethodCell" forIndexPath:a4];
  id v6 = [v5 defaultContentConfiguration];
  if ([(PKMerchantToken *)self->_merchantToken isAMPPaymentToken])
  {
    uint64_t v7 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_8.isa);
LABEL_3:
    id v8 = (void *)v7;
    [v6 setText:v7];
    goto LABEL_7;
  }
  if ([(PKMerchantToken *)self->_merchantToken isAppleCashPaymentToken]
    && !self->_peerPaymentAccount)
  {
    uint64_t v7 = PKLocalizedPeerPaymentRecurringString(&cfstr_MerchantTokenD_9.isa);
    goto LABEL_3;
  }
  id v8 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_10.isa);
  double v9 = [(PKMerchantToken *)self->_merchantToken merchantName];
  uint64_t v10 = PKStringWithValidatedFormat();
  objc_msgSend(v6, "setText:", v10, v9);

LABEL_7:
  double v11 = [v6 textProperties];
  if (PKBridgeUsesDarkAppearance()) {
    BPSBridgeTintColor();
  }
  else {
  int v12 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  [v11 setColor:v12];

  [v5 setContentConfiguration:v6];

  return v5;
}

- (id)_deletePaymentMethodCellForTableView:(id)a3 atIndexPath:(id)a4
{
  unint64_t v5 = [a3 dequeueReusableCellWithIdentifier:@"ManagePaymentMethodCell" forIndexPath:a4];
  id v6 = [v5 defaultContentConfiguration];
  if ([(PKMerchantToken *)self->_merchantToken isDeferredPayment]) {
    uint64_t v7 = @"MERCHANT_TOKEN_DETAIL_DELETE_DEFERRED_BUTTON_TEXT";
  }
  else {
    uint64_t v7 = @"MERCHANT_TOKEN_DETAIL_DELETE_BUTTON_TEXT";
  }
  id v8 = PKLocalizedMerchantTokensString(&v7->isa);
  [v6 setText:v8];

  double v9 = [v6 textProperties];
  uint64_t v10 = [MEMORY[0x1E4FB1618] systemRedColor];
  [v9 setColor:v10];

  [v5 setContentConfiguration:v6];

  return v5;
}

- (id)_manageRecurringPaymentCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"ManageRecurringPayment" forIndexPath:v6];
  if (!v7) {
    uint64_t v7 = [[PKPaymentTransactionTableCell alloc] initWithStyle:0 reuseIdentifier:@"ManageRecurringPayment"];
  }
  -[PKPaymentTransactionTableCell setAdditionalInsets:](v7, "setAdditionalInsets:", 0.0, 7.0, 0.0, 7.0);
  recurringPayments = self->_recurringPayments;
  uint64_t v9 = [v6 row];

  uint64_t v10 = [(NSArray *)recurringPayments objectAtIndex:v9];
  double v11 = PKPeerPaymentTransactionForRecurringPayment();
  [(PKPaymentTransactionCellController *)self->_transactionPresenter configureCell:v7 forTransaction:v11 transactionSource:0 familyMember:0 account:0 detailStyle:0 deviceName:0 avatarViewDelegate:0];

  return v7;
}

- (id)_manageAutoReloadCellForTableView:(id)a3 atIndexPath:(id)a4
{
  double v4 = [a3 dequeueReusableCellWithIdentifier:@"ManageAutoReloadCell" forIndexPath:a4];
  unint64_t v5 = [v4 defaultContentConfiguration];
  id v6 = PKLocalizedPeerPaymentRecurringString(&cfstr_MerchantTokenM.isa);
  [v5 setText:v6];

  [v4 setAccessoryType:1];
  [v4 setContentConfiguration:v5];

  return v4;
}

- (void)_didSelectAutoReloadManagement
{
  autoReloadController = self->_autoReloadController;
  if (!autoReloadController)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F848A0]);
    unint64_t v5 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
    id v6 = [v4 passWithUniqueID:v5];
    uint64_t v7 = [v6 paymentPass];

    id v8 = [[PKPeerPaymentThresholdTopUpController alloc] initWithPeerPaymentAccount:self->_peerPaymentAccount pass:v7 context:0 passLibraryDataProvider:v4 delegate:self];
    uint64_t v9 = self->_autoReloadController;
    self->_autoReloadController = v8;

    autoReloadController = self->_autoReloadController;
  }
  autoReload = self->_autoReload;

  [(PKPeerPaymentThresholdTopUpController *)autoReloadController presentTopUpFlowForRecurringPayment:autoReload];
}

- (void)_didSelectRecurringPaymentAtIndexPath:(id)a3
{
  -[NSArray objectAtIndex:](self->_recurringPayments, "objectAtIndex:", [a3 row]);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = objc_alloc(MEMORY[0x1E4F84D80]);
  unint64_t v5 = [MEMORY[0x1E4F84E10] sharedService];
  id v6 = (void *)[v4 initWithPeerPaymentWebService:v5];

  uint64_t v7 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount recurringPaymentsFeatureDescriptor];
  id v8 = [PKPeerPaymentRecurringPaymentDetailViewController alloc];
  uint64_t v9 = [v14 recipientAddress];
  uint64_t v10 = [(PKPeerPaymentRecurringPaymentDetailViewController *)v8 initWithRecurringPayment:v14 recipientAddress:v9 mode:2 context:0 peerPaymentController:v6 remoteMessagesComposer:0];

  double v11 = [v7 minimumAmount];
  [(PKPeerPaymentRecurringPaymentDetailViewController *)v10 setMinimumAmount:v11];

  int v12 = [v7 maximumAmount];
  [(PKPeerPaymentRecurringPaymentDetailViewController *)v10 setMaximumAmount:v12];

  id v13 = [(PKMerchantTokenDetailViewController *)self navigationController];
  [v13 pushViewController:v10 animated:1];
}

- (void)_didSelectDeletePaymentMethod
{
  uint64_t v3 = [(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
  if ([(PKMerchantToken *)self->_merchantToken isAMPPaymentToken])
  {
    uint64_t v4 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_13.isa);
    goto LABEL_7;
  }
  if ([(PKMerchantToken *)self->_merchantToken isDeferredPayment])
  {
    unint64_t v5 = @"MERCHANT_TOKEN_DETAIL_DELETE_DEFERRED_SHEET_MESSAGE";
    goto LABEL_10;
  }
  if (![(PKMerchantToken *)self->_merchantToken isAppleCashPaymentToken])
  {
    unint64_t v5 = @"MERCHANT_TOKEN_DETAIL_DELETE_SHEET_MESSAGE";
LABEL_10:
    id v8 = PKLocalizedMerchantTokensString(&v5->isa);
    id v16 = [(PKMerchantToken *)self->_merchantToken merchantName];
    id v6 = PKStringWithValidatedFormat();

    if (v3) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  uint64_t v4 = PKLocalizedPeerPaymentRecurringString(&cfstr_MerchantTokenD_15.isa);
LABEL_7:
  id v6 = (void *)v4;
  if (v3)
  {
LABEL_8:
    PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_17.isa);
    id v6 = v7 = v6;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v7 = 0;
LABEL_12:
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v6, v7, v3, v16);
  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  double v11 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_18.isa);
  int v12 = [v10 actionWithTitle:v11 style:1 handler:0];
  [v9 addAction:v12];

  if ([(PKMerchantToken *)self->_merchantToken isDeferredPayment]) {
    id v13 = @"MERCHANT_TOKEN_DETAIL_DELETE_DEFERRED_SHEET_CONFIRM";
  }
  else {
    id v13 = @"MERCHANT_TOKEN_DETAIL_DELETE_SHEET_CONFIRM";
  }
  id v14 = PKLocalizedMerchantTokensString(&v13->isa);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__PKMerchantTokenDetailViewController__didSelectDeletePaymentMethod__block_invoke;
  v17[3] = &unk_1E59CB1F0;
  v17[4] = self;
  id v15 = [MEMORY[0x1E4FB1410] actionWithTitle:v14 style:2 handler:v17];
  [v9 addAction:v15];
  [v9 setPreferredAction:v15];
  if (v9) {
    [(PKMerchantTokenDetailViewController *)self presentViewController:v9 animated:1 completion:0];
  }
}

uint64_t __68__PKMerchantTokenDetailViewController__didSelectDeletePaymentMethod__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteMerchantToken];
}

- (void)_deleteMerchantToken
{
  v14[3] = *MEMORY[0x1E4F143B8];
  [(PKMerchantTokenDetailViewController *)self _showLoadingView];
  id v3 = objc_alloc_init(MEMORY[0x1E4F84640]);
  uint64_t v4 = [(PKMerchantToken *)self->_merchantToken merchantTokenId];
  [v3 setMerchantTokenId:v4];

  unint64_t v5 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v6 = *MEMORY[0x1E4F87038];
  uint64_t v7 = *MEMORY[0x1E4F86380];
  uint64_t v8 = *MEMORY[0x1E4F86730];
  v13[0] = *MEMORY[0x1E4F86308];
  v13[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F86628];
  v14[0] = v7;
  v14[1] = v9;
  v13[2] = *MEMORY[0x1E4F86120];
  v14[2] = *MEMORY[0x1E4F86648];
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  [v5 subject:v6 sendEvent:v10];

  webService = self->_webService;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__PKMerchantTokenDetailViewController__deleteMerchantToken__block_invoke;
  v12[3] = &unk_1E59CDF18;
  void v12[4] = self;
  [(PKPaymentWebService *)webService deleteMerchantTokenWithRequest:v3 completion:v12];
}

void __59__PKMerchantTokenDetailViewController__deleteMerchantToken__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__PKMerchantTokenDetailViewController__deleteMerchantToken__block_invoke_2;
  v2[3] = &unk_1E59CDA78;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __59__PKMerchantTokenDetailViewController__deleteMerchantToken__block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  char v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 _enableNavigation];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1160));
    [WeakRetained merchantTokenDetailViewController:*(void *)(a1 + 32) didDeleteMerchantToken:*(void *)(*(void *)(a1 + 32) + 1088)];
  }
  else
  {
    [v3 _hideLoadingView];
    PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_21.isa);
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_22.isa);
    unint64_t v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:WeakRetained message:v4 preferredStyle:1];
    uint64_t v6 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v7 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenD_23.isa);
    uint64_t v8 = [v6 actionWithTitle:v7 style:0 handler:0];
    [v5 addAction:v8];

    if (v5) {
      [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
    }
  }
}

- (void)recurringPaymentsChanged
{
}

- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(PKMerchantTokenDetailViewController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4
{
}

- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4
{
}

- (void)thresholdTopUpController:(id)a3 requestsPopViewController:(id)a4
{
  id v5 = [(PKMerchantTokenDetailViewController *)self navigationController];
  id v4 = (id)[v5 popViewControllerAnimated:1];
}

- (id)presentationSceneIdentifierForTopUpController:(id)a3
{
  char v3 = [(PKMerchantTokenDetailViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)thresholdTopUpControllerCompletedSetup:(id)a3
{
  id v4 = [(PKMerchantTokenDetailViewController *)self navigationController];
  char v3 = [v4 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (id)_contactKeysToFetch
{
  v10[5] = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v10[0] = v2;
  Class v3 = _MergedGlobals_5_9();
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v5 = -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", [v4 _supportsForceTouch]);
  v10[1] = v5;
  id v6 = [(Class)off_1EC34A0A0() descriptorForRequiredKeys];
  uint64_t v7 = *MEMORY[0x1E4F1ADC8];
  v10[2] = v6;
  void v10[3] = v7;
  v10[4] = *MEMORY[0x1E4F1AEE0];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];

  return v8;
}

- (PKMerchantTokenDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKMerchantTokenDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactionPresenter, 0);
  objc_storeStrong((id *)&self->_recurringPayments, 0);
  objc_storeStrong((id *)&self->_autoReloadController, 0);
  objc_storeStrong((id *)&self->_autoReload, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_webService, 0);

  objc_storeStrong((id *)&self->_merchantToken, 0);
}

@end