@interface PKAccountBankAccountsViewController
- (BOOL)_hasBankAccounts;
- (BOOL)_isBankAccountIndexPath:(id)a3;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKAccountBankAccountsViewController)initWithAccount:(id)a3 paymentWebService:(id)a4 context:(int64_t)a5;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_addBankAccountInformationViewController;
- (id)_bankAccountCellForRowAtIndexPath:(id)a3;
- (id)_fundingSourceForIndexPath:(id)a3;
- (id)_indexPathForFundingSourceIdentifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_sectionTypeForSection:(unint64_t)a3;
- (void)_configureBankAccountCell:(id)a3 withFundingSource:(id)a4;
- (void)_didSelectDeleteBankAccountAtIndexPath:(id)a3 withCompletionHandler:(id)a4;
- (void)_fetchAccountUserInfo:(id)a3;
- (void)_presentAddBankAccount;
- (void)_presentContactSupport;
- (void)_presentLinkAccountForFundingSource:(id)a3;
- (void)_reloadFundingSources;
- (void)_setAndFilterFundingSources:(id)a3;
- (void)_toggleEditingMode;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updateEditButtonIfNecessary;
- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4;
- (void)addBankAccountInformationViewController:(id)a3 didFailWithError:(id)a4;
- (void)addBankAccountInformationViewControllerDidFinish:(id)a3;
- (void)contactIssuerHelper:(id)a3 didRequestDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5;
- (void)contactIssuerHelper:(id)a3 didRequestPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)dealloc;
- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4;
- (void)preflightWithCompletion:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKAccountBankAccountsViewController

- (PKAccountBankAccountsViewController)initWithAccount:(id)a3 paymentWebService:(id)a4 context:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKAccountBankAccountsViewController;
  v11 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v20, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 2);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a3);
    v12->_accountFeatureIdentifier = [v9 feature];
    objc_storeStrong((id *)&v12->_paymentWebService, a4);
    uint64_t v13 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v12->_accountService;
    v12->_accountService = (PKAccountService *)v13;

    v12->_context = a5;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletingFundingSources = v12->_deletingFundingSources;
    v12->_deletingFundingSources = v15;

    v17 = [(PKAccountBankAccountsViewController *)v12 navigationItem];
    v18 = PKLocalizedFeatureString();
    [v17 setTitle:v18];

    v12->_loadingFundingSources = 0;
    [(PKAccountService *)v12->_accountService registerObserver:v12];
  }
  return v12;
}

- (void)dealloc
{
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKAccountBankAccountsViewController;
  [(PKSectionTableViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PKAccountBankAccountsViewController;
  [(PKSectionTableViewController *)&v13 viewDidLoad];
  objc_super v3 = [(PKAccountBankAccountsViewController *)self tableView];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v3 setAllowsSelectionDuringEditing:1];
  if (PKPaymentSetupContextIsBridge())
  {
    v4 = PKBridgeAppearanceGetAppearanceSpecifier();
    v5 = [v4 backgroundColor];
    [v3 setBackgroundColor:v5];

    v6 = [v3 backgroundView];
    v7 = [v4 backgroundColor];
    [v6 setBackgroundColor:v7];

    v8 = [v4 tableViewSeparatorColor];
    [v3 setSeparatorColor:v8];

    id v9 = [v4 tintColor];
    [v3 setSectionIndexColor:v9];

    id v10 = [v4 foregroundColor];
    [v3 setSectionIndexBackgroundColor:v10];

    if ([v4 hasDarkAppearance]) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 0;
    }
    [v3 setIndicatorStyle:v11];
  }
  if (![(PKAccountBankAccountsViewController *)self _hasBankAccounts]) {
    [(PKAccountBankAccountsViewController *)self _reloadFundingSources];
  }
  v12 = [(PKAccountBankAccountsViewController *)self view];
  [v12 setAccessibilityIdentifier:*MEMORY[0x1E4F852B0]];
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  if (self->_loadingFundingSources)
  {
    v4 = (void *)MEMORY[0x1E4FB1658];
    id v5 = a3;
    v6 = [v4 loadingConfiguration];
    id v7 = [v6 updatedConfigurationForState:v5];
  }
  else
  {
    id v7 = 0;
  }
  [(PKAccountBankAccountsViewController *)self _setContentUnavailableConfiguration:v7];
}

- (void)_reloadFundingSources
{
  if (!self->_loadingFundingSources)
  {
    self->_loadingFundingSources = 1;
    [(PKAccountBankAccountsViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
    availableFundingSources = self->_availableFundingSources;
    self->_availableFundingSources = 0;

    unavailableFundingSourcesWithVerification = self->_unavailableFundingSourcesWithVerification;
    self->_unavailableFundingSourcesWithVerification = 0;

    unavailableFundingSourcesWithoutVerification = self->_unavailableFundingSourcesWithoutVerification;
    self->_unavailableFundingSourcesWithoutVerification = 0;

    v6 = [(PKAccountBankAccountsViewController *)self tableView];
    [v6 reloadData];

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__PKAccountBankAccountsViewController__reloadFundingSources__block_invoke;
    v7[3] = &unk_1E59CEAC0;
    objc_copyWeak(&v8, &location);
    [(PKAccountBankAccountsViewController *)self preflightWithCompletion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __60__PKAccountBankAccountsViewController__reloadFundingSources__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v10 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1200) = 0;
    [WeakRetained _setNeedsUpdateContentUnavailableConfiguration];
    id v7 = [v6 tableView];
    [v7 reloadData];

    if (v10)
    {
      if ((a2 & 1) == 0)
      {
        [v6[136] feature];
        id v8 = PKAccountDisplayableError();
        id v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
        [v6 presentViewController:v9 animated:1 completion:0];
      }
    }
  }
}

- (void)_setAndFilterFundingSources:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [v10 fundingDetails];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          uint64_t v13 = [v12 status];
          v14 = v4;
          if (v13 == 2)
          {
            v15 = [v12 verificationDetails];

            if (v15) {
              v14 = v23;
            }
            else {
              v14 = v24;
            }
          }
          [(NSMutableArray *)v14 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  unavailableFundingSourcesWithVerification = self->_unavailableFundingSourcesWithVerification;
  self->_unavailableFundingSourcesWithVerification = v23;
  v17 = v23;

  unavailableFundingSourcesWithoutVerification = self->_unavailableFundingSourcesWithoutVerification;
  self->_unavailableFundingSourcesWithoutVerification = v24;
  v19 = v24;

  availableFundingSources = self->_availableFundingSources;
  self->_availableFundingSources = v4;

  v21 = [(PKAccountBankAccountsViewController *)self tableView];
  [v21 reloadData];
}

- (void)_toggleEditingMode
{
  id v3 = [(PKAccountBankAccountsViewController *)self tableView];
  objc_msgSend(v3, "setEditing:animated:", objc_msgSend(v3, "isEditing") ^ 1, 1);
  [(PKAccountBankAccountsViewController *)self _updateEditButtonIfNecessary];
}

- (void)_updateEditButtonIfNecessary
{
  id v7 = [(PKAccountBankAccountsViewController *)self navigationItem];
  if ([(PKAccountBankAccountsViewController *)self _hasBankAccounts])
  {
    id v3 = [(PKAccountBankAccountsViewController *)self tableView];
    int v4 = [v3 isEditing];

    if (v4) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = 2;
    }
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:v5 target:self action:sel__editButtonPressed_];
    [v7 setRightBarButtonItem:v6];
  }
  else
  {
    [v7 setRightBarButtonItem:0];
  }
}

- (BOOL)_isBankAccountIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", [v4 section]);
  if (v5 == 2)
  {
    unint64_t v6 = [v4 row];
    uint64_t v7 = 1152;
  }
  else
  {
    if (v5 == 1)
    {
      BOOL v8 = [v4 row] == 0;
      goto LABEL_9;
    }
    if (v5)
    {
      BOOL v8 = 0;
      goto LABEL_9;
    }
    unint64_t v6 = [v4 row];
    uint64_t v7 = 1136;
  }
  BOOL v8 = v6 < [*(id *)((char *)&self->super.super.super.super.super.isa + v7) count];
LABEL_9:

  return v8;
}

- (void)_didSelectDeleteBankAccountAtIndexPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(PKAccountBankAccountsViewController *)self _fundingSourceForIndexPath:v6];
  unint64_t v9 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", [v6 section]);
  if (v9 > 2)
  {
    id v10 = 0;
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    id v10 = *(id *)((char *)&self->super.super.super.super.super.isa + *off_1E59DAC80[v9]);
    if (!v8) {
      goto LABEL_7;
    }
  }
  if (([(NSMutableArray *)self->_deletingFundingSources containsObject:v8] & 1) == 0)
  {
    [(NSMutableArray *)self->_deletingFundingSources addObject:v8];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v11 startAnimating];
    id v12 = [(PKAccountBankAccountsViewController *)self tableView];
    uint64_t v13 = [v12 cellForRowAtIndexPath:v6];

    [v13 setEditingAccessoryView:v11];
    [v13 setAccessoryView:v11];
    id v14 = objc_alloc_init(MEMORY[0x1E4F84310]);
    v15 = [(PKAccount *)self->_account accountIdentifier];
    [v14 setAccountIdentifier:v15];

    v16 = [(PKAccount *)self->_account accountBaseURL];
    [v14 setBaseURL:v16];

    v17 = [v8 identifier];
    [v14 setFundingSourceIdentifier:v17];

    objc_initWeak(&location, self);
    paymentWebService = self->_paymentWebService;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __100__PKAccountBankAccountsViewController__didSelectDeleteBankAccountAtIndexPath_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E59DAB70;
    objc_copyWeak(&v23, &location);
    id v22 = v7;
    id v20 = v8;
    id v21 = v10;
    [(PKPaymentWebService *)paymentWebService deleteFundingSourceWithRequest:v14 completion:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
LABEL_7:
  (*((void (**)(id, void))v7 + 2))(v7, 0);
}

void __100__PKAccountBankAccountsViewController__didSelectDeleteBankAccountAtIndexPath_withCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__PKAccountBankAccountsViewController__didSelectDeleteBankAccountAtIndexPath_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E59DAB48;
  objc_copyWeak(&v15, a1 + 7);
  id v14 = a1[6];
  id v10 = a1[4];
  id v11 = v5;
  id v12 = v6;
  id v13 = a1[5];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v15);
}

void __100__PKAccountBankAccountsViewController__didSelectDeleteBankAccountAtIndexPath_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_9;
  }
  id v3 = [*(id *)(a1 + 32) identifier];
  id v4 = [WeakRetained _indexPathForFundingSourceIdentifier:v3];

  if (v4)
  {
    id v5 = [WeakRetained tableView];
    id v6 = [v5 cellForRowAtIndexPath:v4];

    [v6 setEditingAccessoryView:0];
    [v6 setAccessoryView:0];
  }
  [WeakRetained[146] removeObject:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 40) && !*(void *)(a1 + 48))
  {
    uint64_t v9 = objc_msgSend(WeakRetained, "_sectionTypeForSection:", objc_msgSend(v4, "section"));
    [*(id *)(a1 + 56) removeObject:*(void *)(a1 + 32)];
    if (!v4) {
      goto LABEL_25;
    }
    uint64_t v10 = [WeakRetained[143] count];
    uint64_t v11 = -[WeakRetained[144] count];
    if (v9 == 2)
    {
      if (v10 != v11)
      {
        uint64_t v18 = [WeakRetained[144] count];
        id v12 = [WeakRetained tableView];
        if (!v18)
        {
          id v22 = v4;
          id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
          [v12 deleteRowsAtIndexPaths:v20 withRowAnimation:100];

          id v12 = [WeakRetained tableView];
          id v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v4, "section"));
          [v12 _reloadSectionHeaderFooters:v15 withRowAnimation:100];
          goto LABEL_24;
        }
        id v21 = v4;
        id v13 = (void *)MEMORY[0x1E4F1C978];
        id v14 = &v21;
        goto LABEL_23;
      }
      id v12 = [WeakRetained tableView];
      id v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v4, "section"));
      v16 = v12;
      v17 = v15;
    }
    else
    {
      if (v9 != 1)
      {
        if (v9) {
          goto LABEL_25;
        }
        id v12 = [WeakRetained tableView];
        v23[0] = v4;
        id v13 = (void *)MEMORY[0x1E4F1C978];
        id v14 = (void **)v23;
LABEL_23:
        id v15 = objc_msgSend(v13, "arrayWithObjects:count:", v14, 1, v21);
        [v12 deleteRowsAtIndexPaths:v15 withRowAnimation:100];
        goto LABEL_24;
      }
      id v12 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndex:", objc_msgSend(v4, "section"));
      if (v10 == v11) {
        objc_msgSend(v12, "addIndex:", objc_msgSend(v4, "section") + 1);
      }
      v16 = [WeakRetained tableView];
      id v15 = v16;
      v17 = v12;
    }
    [v16 deleteSections:v17 withRowAnimation:100];
LABEL_24:

LABEL_25:
    if ([WeakRetained _hasBankAccounts])
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      v19 = [WeakRetained tableView];
      [v19 setEditing:0];

      [WeakRetained reloadData];
      [WeakRetained _updateEditButtonIfNecessary];
    }
    goto LABEL_7;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [WeakRetained[136] feature];
  id v7 = PKAccountDisplayableError();
  id v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
  [WeakRetained presentViewController:v8 animated:1 completion:0];

LABEL_7:
LABEL_9:
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  if (![(PKAccountBankAccountsViewController *)self _hasBankAccounts])
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__46;
    v21[4] = __Block_byref_object_dispose__46;
    id v22 = 0;
    objc_initWeak(&location, self);
    id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke;
    v18[3] = &unk_1E59DABC0;
    v18[4] = self;
    objc_copyWeak(&v19, &location);
    v18[5] = v21;
    [v5 addOperation:v18];
    unint64_t accountFeatureIdentifier = self->_accountFeatureIdentifier;
    if (accountFeatureIdentifier == 2)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_7;
      v14[3] = &unk_1E59DABE8;
      v14[4] = self;
      id v7 = &v15;
      objc_copyWeak(&v15, &location);
      [v5 addOperation:v14];
    }
    else
    {
      if (accountFeatureIdentifier != 5)
      {
LABEL_9:
        id v8 = [MEMORY[0x1E4F1CA98] null];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_10;
        v10[3] = &unk_1E59DAC10;
        objc_copyWeak(&v13, &location);
        id v12 = v21;
        id v11 = v4;
        id v9 = (id)[v5 evaluateWithInput:v8 completion:v10];

        objc_destroyWeak(&v13);
        objc_destroyWeak(&v19);

        objc_destroyWeak(&location);
        _Block_object_dispose(v21, 8);

        goto LABEL_10;
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_4;
      v16[3] = &unk_1E59DABE8;
      v16[4] = self;
      id v7 = &v17;
      objc_copyWeak(&v17, &location);
      [v5 addOperation:v16];
    }
    objc_destroyWeak(v7);
    goto LABEL_9;
  }
  if (v4) {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
LABEL_10:
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 1120);
  id v12 = [*(id *)(v10 + 1088) accountIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_2;
  v15[3] = &unk_1E59D78C0;
  objc_copyWeak(&v19, (id *)(a1 + 48));
  uint64_t v18 = *(void *)(a1 + 40);
  id v13 = v9;
  id v17 = v13;
  id v14 = v8;
  id v16 = v14;
  [v11 updatePaymentFundingSourcesForAccountIdentifier:v12 force:1 completion:v15];

  objc_destroyWeak(&v19);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_3;
  block[3] = &unk_1E59DAB98;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  id v12 = v6;
  id v13 = v5;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v10;
  long long v15 = v10;
  id v14 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v16);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v2 = *(void **)(a1 + 32);
    if (v2) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v2);
    }
    [WeakRetained _setAndFilterFundingSources:*(void *)(a1 + 40)];
    [WeakRetained _updateEditButtonIfNecessary];
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3) {
      (*(void (**)(uint64_t, void, BOOL))(v3 + 16))(v3, *(void *)(a1 + 48), *(void *)(a1 + 32) != 0);
    }
  }
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v10 = *(void **)(*(void *)(a1 + 32) + 1120);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_5;
  v13[3] = &unk_1E59CD410;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v14 = v12;
  [v10 defaultAccountForFeature:2 completion:v13];

  objc_destroyWeak(&v16);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_5(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_6;
  block[3] = &unk_1E59CD3E8;
  objc_copyWeak(&v14, a1 + 6);
  id v10 = v5;
  id v11 = v6;
  id v13 = a1[5];
  id v12 = a1[4];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_6(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    if (v4 && !*(void *)(a1 + 40))
    {
      id v8 = WeakRetained;
      objc_storeStrong(WeakRetained + 137, v4);
      uint64_t v3 = v8;
      uint64_t v7 = *(void *)(a1 + 56);
      if (!v7) {
        goto LABEL_9;
      }
      id v6 = *(void (**)(void))(v7 + 16);
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 56);
      if (!v5) {
        goto LABEL_9;
      }
      id v6 = *(void (**)(void))(v5 + 16);
      id v8 = v3;
    }
    v6();
    uint64_t v3 = v8;
  }
LABEL_9:
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(*(void *)(a1 + 32) + 1120);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_8;
  v13[3] = &unk_1E59CD410;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v14 = v12;
  [v10 defaultAccountForFeature:5 completion:v13];

  objc_destroyWeak(&v16);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_9;
  block[3] = &unk_1E59CD3E8;
  objc_copyWeak(&v14, a1 + 6);
  id v10 = v5;
  id v11 = v6;
  id v13 = a1[5];
  id v12 = a1[4];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_9(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    if (v4 && !*(void *)(a1 + 40))
    {
      id v8 = WeakRetained;
      objc_storeStrong(WeakRetained + 137, v4);
      uint64_t v3 = v8;
      uint64_t v7 = *(void *)(a1 + 56);
      if (!v7) {
        goto LABEL_9;
      }
      id v6 = *(void (**)(void))(v7 + 16);
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 56);
      if (!v5) {
        goto LABEL_9;
      }
      id v6 = *(void (**)(void))(v5 + 16);
      id v8 = v3;
    }
    v6();
    uint64_t v3 = v8;
  }
LABEL_9:
}

void __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_11;
    block[3] = &unk_1E59CD8C8;
    long long v4 = *(_OWORD *)(a1 + 32);
    id v3 = (id)v4;
    long long v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __63__PKAccountBankAccountsViewController_preflightWithCompletion___block_invoke_11(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(v2 + 8) + 8) + 40))
  {
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
    }
  }
  else if (result)
  {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (id)_addBankAccountInformationViewController
{
  uint64_t v3 = [(PKAccount *)self->_account type];
  if (v3 == 4)
  {
    long long v4 = [(PKAccount *)self->_account savingsDetails];
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    long long v4 = [(PKAccount *)self->_account creditDetails];
LABEL_5:
    uint64_t v5 = v4;
    long long v6 = [v4 countryCode];

    goto LABEL_7;
  }
  long long v6 = 0;
LABEL_7:
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F84550]) initWithType:1];
  id v8 = [[PKAddBankAccountInformationViewController alloc] initWithDelegate:self bankInformation:v7 accountCountryCode:v6 featureAccount:self->_account];
  [(PKAddBankAccountInformationViewController *)v8 setOfferKeychainPreFill:[(PKAccountBankAccountsViewController *)self _hasBankAccounts] ^ 1];
  id v9 = [[PKNavigationController alloc] initWithRootViewController:v8];
  [(PKNavigationController *)v9 setSupportedInterfaceOrientations:2];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v9 setModalPresentationStyle:2];
  }

  return v9;
}

- (void)_presentAddBankAccount
{
  if ([(PKAccount *)self->_account stateReason] == 14)
  {
    uint64_t v3 = PKLocalizedMadisonString(&cfstr_AccountMergeIn.isa);
    long long v4 = PKLocalizedMadisonString(&cfstr_AccountMergeIn_0.isa);
    PKDisplayableErrorCustom();
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    id v5 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);
    long long v6 = [(PKAccountBankAccountsViewController *)self navigationController];
    [v6 presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    id v7 = [(PKAccountBankAccountsViewController *)self _addBankAccountInformationViewController];
    id v5 = [(PKAccountBankAccountsViewController *)self navigationController];
    [v5 presentViewController:v7 animated:1 completion:0];
  }
}

- (void)_presentContactSupport
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKAccount *)self->_account type];
  if (v3 == 1)
  {
    id v5 = [(PKAccount *)self->_account associatedPassUniqueID];
    long long v6 = [MEMORY[0x1E4F84898] sharedInstance];
    v19[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke_2;
    v16[3] = &unk_1E59CB328;
    v16[4] = self;
    [(PKAccountSupportTopicsViewController *)v6 getPassesWithUniqueIdentifiers:v7 handler:v16];
    goto LABEL_6;
  }
  if (v3 != 4) {
    return;
  }
  long long v4 = [(PKAccount *)self->_account savingsDetails];
  id v5 = [v4 contactNumber];

  if (+[PKBusinessChatController deviceSupportsBusinessChat])
  {
    long long v6 = [[PKAccountSupportTopicsViewController alloc] initWithAccount:self->_account];
    id v7 = [[PKNavigationController alloc] initWithRootViewController:v6];
    id v8 = [(PKAccountBankAccountsViewController *)self navigationController];
    [v8 presentViewController:v7 animated:1 completion:0];

LABEL_6:
    goto LABEL_7;
  }
  if (![v5 length]) {
    goto LABEL_8;
  }
  id v9 = (void *)MEMORY[0x1E4FB1418];
  id v10 = PKLocalizedFeatureString();
  long long v6 = [v9 alertControllerWithTitle:v10 message:0 preferredStyle:1];

  id v11 = (void *)MEMORY[0x1E4FB1410];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke;
  v17[3] = &unk_1E59CB1F0;
  id v5 = v5;
  id v18 = v5;
  id v12 = [v11 actionWithTitle:v5 style:0 handler:v17];
  [(PKAccountSupportTopicsViewController *)v6 addAction:v12];

  id v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = PKLocalizedString(&cfstr_Cancel.isa);
  id v15 = [v13 actionWithTitle:v14 style:1 handler:0];
  [(PKAccountSupportTopicsViewController *)v6 addAction:v15];

  [(PKAccountBankAccountsViewController *)self presentViewController:v6 animated:1 completion:0];
LABEL_7:

LABEL_8:
}

void __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = PKTelephoneURLFromPhoneNumber();
  [v1 openSensitiveURL:v0 withOptions:0];
}

void __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  if (v3)
  {
    if (+[PKBusinessChatController deviceSupportsBusinessChat])
    {
      long long v4 = [[PKBusinessChatPassDetailsContext alloc] initWithPass:v3];
      id v5 = objc_alloc_init(PKBusinessChatController);
      [(PKBusinessChatController *)v5 openBusinessChatWithContext:v4 completion:0];
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke_3;
      v6[3] = &unk_1E59CA870;
      v6[4] = *(void *)(a1 + 32);
      id v7 = v3;
      dispatch_async(MEMORY[0x1E4F14428], v6);
    }
  }
}

uint64_t __61__PKAccountBankAccountsViewController__presentContactSupport__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1184);
  if (!v2)
  {
    uint64_t v3 = objc_alloc_init(PKSecureElementPassContactIssuerHelper);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 1184);
    *(void *)(v4 + 1184) = v3;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1184), "setDelegate:");
    long long v6 = *(void **)(*(void *)(a1 + 32) + 1184);
    id v7 = [*(id *)(a1 + 40) secureElementPass];
    [v6 setPass:v7];

    [*(id *)(*(void *)(a1 + 32) + 1184) setFeatureIdentifier:*(void *)(*(void *)(a1 + 32) + 1128)];
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1184);
  }

  return [v2 presentContactViewController:1];
}

- (void)_presentLinkAccountForFundingSource:(id)a3
{
  id v4 = a3;
  if (!self->_loadingLinkAccountFlow)
  {
    self->_loadingLinkAccountFlow = 1;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v5 startAnimating];
    long long v6 = (void *)MEMORY[0x1E4F28D58];
    id v7 = [v4 identifier];
    id v8 = [(PKAccountBankAccountsViewController *)self _indexPathForFundingSourceIdentifier:v7];
    id v9 = objc_msgSend(v6, "indexPathForRow:inSection:", 1, objc_msgSend(v8, "section"));

    id v10 = [(PKAccountBankAccountsViewController *)self tableView];
    id v11 = [v10 cellForRowAtIndexPath:v9];

    [v11 setAccessoryView:v5];
    id v12 = objc_alloc(MEMORY[0x1E4F84BB8]);
    id v13 = [MEMORY[0x1E4F84D50] sharedService];
    id v14 = (void *)[v12 initWithWebService:v13];

    id v15 = [[PKApplyControllerConfiguration alloc] initWithSetupDelegate:self context:0 provisioningController:v14];
    [(PKApplyControllerConfiguration *)v15 setFeature:[(PKAccount *)self->_account feature]];
    [(PKApplyControllerConfiguration *)v15 setApplicationType:6];
    [(PKApplyControllerConfiguration *)v15 setVerificationType:2];
    [(PKApplyControllerConfiguration *)v15 setFundingSource:v4];
    [(PKApplyControllerConfiguration *)v15 setAccount:self->_account];
    id v16 = [[PKApplyController alloc] initWithApplyConfiguration:v15];
    applyController = self->_applyController;
    self->_applyController = v16;

    id v18 = self->_applyController;
    id v19 = [(PKAccount *)self->_account applyServiceURL];
    [(PKApplyController *)v18 setApplyServiceURL:v19];

    objc_initWeak(&location, self);
    id v20 = self->_applyController;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__PKAccountBankAccountsViewController__presentLinkAccountForFundingSource___block_invoke;
    v21[3] = &unk_1E59CCD58;
    objc_copyWeak(&v23, &location);
    id v22 = v4;
    [(PKApplyController *)v20 nextViewControllerWithCompletion:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void __75__PKAccountBankAccountsViewController__presentLinkAccountForFundingSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__PKAccountBankAccountsViewController__presentLinkAccountForFundingSource___block_invoke_2;
  v9[3] = &unk_1E59CE888;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __75__PKAccountBankAccountsViewController__presentLinkAccountForFundingSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      uint64_t v3 = [[PKNavigationController alloc] initWithRootViewController:*(void *)(a1 + 32)];
    }
    else
    {
      id v4 = *(void **)(a1 + 40);
      if (!v4)
      {
LABEL_7:
        id v6 = (void *)MEMORY[0x1E4F28D58];
        id v7 = [*(id *)(a1 + 48) identifier];
        id v8 = [v12 _indexPathForFundingSourceIdentifier:v7];
        id v9 = objc_msgSend(v6, "indexPathForRow:inSection:", 1, objc_msgSend(v8, "section"));

        id v10 = [v12 tableView];
        id v11 = [v10 cellForRowAtIndexPath:v9];

        [v11 setAccessoryView:0];
        v12[1202] = 0;

        id WeakRetained = v12;
        goto LABEL_8;
      }
      uint64_t v3 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
    }
    id v5 = v3;
    [v12 presentViewController:v3 animated:1 completion:0];

    goto LABEL_7;
  }
LABEL_8:
}

- (BOOL)_hasBankAccounts
{
  uint64_t v3 = [(NSMutableArray *)self->_availableFundingSources count];
  uint64_t v4 = [(NSMutableArray *)self->_unavailableFundingSourcesWithVerification count] + v3;
  return v4 + [(NSMutableArray *)self->_unavailableFundingSourcesWithoutVerification count] != 0;
}

- (void)_fetchAccountUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_loadingAccountUserInfo)
  {
    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
  else
  {
    self->_loadingAccountUserInfo = 1;
    [(PKSectionTableViewController *)self reloadData];
    objc_initWeak(&location, self);
    accountService = self->_accountService;
    id v7 = [(PKAccount *)self->_account accountIdentifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__PKAccountBankAccountsViewController__fetchAccountUserInfo___block_invoke;
    v8[3] = &unk_1E59DAC38;
    objc_copyWeak(&v10, &location);
    id v9 = v5;
    [(PKAccountService *)accountService userInfoForAccountIdentifier:v7 forceFetch:1 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __61__PKAccountBankAccountsViewController__fetchAccountUserInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__PKAccountBankAccountsViewController__fetchAccountUserInfo___block_invoke_2;
  v9[3] = &unk_1E59D11A8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v6;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __61__PKAccountBankAccountsViewController__fetchAccountUserInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1201) = 0;
    id v8 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      id v4 = PKAccountDisplayableError();
      id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      [v8 presentViewController:v5 animated:1 completion:0];
      uint64_t v6 = *(void *)(a1 + 48);
      if (v6) {
        (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
      }
    }
    else
    {
      objc_storeStrong(WeakRetained + 138, *(id *)(a1 + 40));
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7) {
        (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, *(void *)(a1 + 40) != 0);
      }
    }
    [v8 reloadData];
    uint64_t v3 = v8;
  }
}

- (id)_fundingSourceForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  unint64_t v7 = [(PKAccountBankAccountsViewController *)self _sectionTypeForSection:v6];
  if (v7 == 2)
  {
    uint64_t v8 = 1152;
    goto LABEL_6;
  }
  if (v7 != 1)
  {
    if (v7) {
      goto LABEL_9;
    }
    uint64_t v8 = 1136;
LABEL_6:
    p_unavailableFundingSourcesWithVerification = (NSMutableArray **)((char *)self + v8);
    if (v5 < [(NSMutableArray *)*p_unavailableFundingSourcesWithVerification count]) {
      goto LABEL_11;
    }
LABEL_9:
    id v10 = 0;
    goto LABEL_12;
  }
  if (v5) {
    goto LABEL_9;
  }
  unint64_t v5 = v6 - 1;
  p_unavailableFundingSourcesWithVerification = &self->_unavailableFundingSourcesWithVerification;
LABEL_11:
  id v10 = [(NSMutableArray *)*p_unavailableFundingSourcesWithVerification objectAtIndex:v5];
LABEL_12:

  return v10;
}

- (id)_indexPathForFundingSourceIdentifier:(id)a3
{
  id v4 = a3;
  availableFundingSources = self->_availableFundingSources;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke;
  v21[3] = &unk_1E59DAC60;
  id v6 = v4;
  id v22 = v6;
  uint64_t v7 = [(NSMutableArray *)availableFundingSources indexOfObjectPassingTest:v21];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unavailableFundingSourcesWithVerification = self->_unavailableFundingSourcesWithVerification;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke_2;
    v19[3] = &unk_1E59DAC60;
    id v9 = v6;
    id v20 = v9;
    uint64_t v10 = [(NSMutableArray *)unavailableFundingSourcesWithVerification indexOfObjectPassingTest:v19];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unavailableFundingSourcesWithoutVerification = self->_unavailableFundingSourcesWithoutVerification;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke_3;
      v17[3] = &unk_1E59DAC60;
      id v18 = v9;
      uint64_t v12 = [(NSMutableArray *)unavailableFundingSourcesWithoutVerification indexOfObjectPassingTest:v17];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = 0;
      }
      else
      {
        uint64_t v14 = v12;
        uint64_t v15 = [(NSMutableArray *)self->_unavailableFundingSourcesWithVerification count];
        id v13 = [MEMORY[0x1E4F28D58] indexPathForRow:v14 inSection:v15 + 1];
      }
    }
    else
    {
      id v13 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v10 + 1];
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 inSection:0];
  }

  return v13;
}

uint64_t __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

uint64_t __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

uint64_t __76__PKAccountBankAccountsViewController__indexPathForFundingSourceIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (unint64_t)_sectionTypeForSection:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 - 1 < [(NSMutableArray *)self->_unavailableFundingSourcesWithVerification count]) {
    return 1;
  }
  return 2;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return !self->_loadingFundingSources;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_loadingFundingSources) {
    return 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_unavailableFundingSourcesWithVerification count];
  if ([(NSMutableArray *)self->_unavailableFundingSourcesWithoutVerification count]
    || [(NSMutableArray *)self->_unavailableFundingSourcesWithVerification count])
  {
    return v5 + 2;
  }
  else
  {
    return v5 + 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5 = [(PKAccountBankAccountsViewController *)self _sectionTypeForSection:a4];
  if (v5 == 2)
  {
    uint64_t v7 = [(NSMutableArray *)self->_unavailableFundingSourcesWithVerification count];
    uint64_t v8 = [(NSMutableArray *)self->_unavailableFundingSourcesWithoutVerification count];
    if (v8) {
      return v8 + 1;
    }
    else {
      return v7 != 0;
    }
  }
  else if (v5 == 1)
  {
    return 2;
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    return [(NSMutableArray *)self->_availableFundingSources count] + 1;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", [v7 section]);
  unint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v10 = &OBJC_IVAR___PKAccountBankAccountsViewController__availableFundingSources;
    goto LABEL_6;
  }
  if (v8 != 1)
  {
    if (v8 != 2)
    {
      id v16 = 0;
      goto LABEL_20;
    }
    uint64_t v10 = &OBJC_IVAR___PKAccountBankAccountsViewController__unavailableFundingSourcesWithoutVerification;
LABEL_6:
    unint64_t v11 = [*(id *)((char *)&self->super.super.super.super.super.isa + *v10) count];
    if ([v7 row] >= v11)
    {
      if (v9 == 2)
      {
        uint64_t v12 = PKLocalizedFeatureString();
        id v13 = 0;
        uint64_t v14 = (id *)MEMORY[0x1E4F853C0];
        uint64_t v15 = @"ContactSupportCell";
      }
      else
      {
        [(PKAccountBankAccountsViewController *)self _hasBankAccounts];
        uint64_t v12 = PKLocalizedFeatureString();
        if (self->_loadingAccountUserInfo)
        {
          id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
          [v13 startAnimating];
        }
        else
        {
          id v13 = 0;
        }
        uint64_t v15 = @"AddBankAccountCell";
        uint64_t v14 = (id *)MEMORY[0x1E4F851C8];
      }
      goto LABEL_17;
    }
LABEL_12:
    id v16 = [(PKAccountBankAccountsViewController *)self _bankAccountCellForRowAtIndexPath:v7];
    goto LABEL_20;
  }
  [(NSMutableArray *)self->_unavailableFundingSourcesWithVerification count];
  if (![v7 row]) {
    goto LABEL_12;
  }
  uint64_t v12 = PKLocalizedFeatureString();
  id v13 = 0;
  uint64_t v14 = (id *)MEMORY[0x1E4F85680];
  uint64_t v15 = @"LinkAccountCell";
LABEL_17:
  id v17 = *v14;
  id v16 = [v6 dequeueReusableCellWithIdentifier:v15];
  if (!v16)
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:v15];
    id v18 = [v16 textLabel];
    id v19 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v18 setTextColor:v19];
  }
  id v20 = [v16 textLabel];
  id v21 = [v16 detailTextLabel];
  [v20 setText:v12];
  [v20 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  [v21 setText:0];
  [v21 setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
  [v16 setAccessoryView:v13];
  [v16 setAccessibilityIdentifier:v17];

LABEL_20:

  return v16;
}

- (id)_bankAccountCellForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKAccountBankAccountsViewController *)self tableView];
  id v6 = [v5 dequeueReusableCellWithIdentifier:@"BankAccountCell"];

  if (!v6) {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"BankAccountCell"];
  }
  id v7 = [(PKAccountBankAccountsViewController *)self _fundingSourceForIndexPath:v4];
  if (![(NSMutableArray *)self->_deletingFundingSources containsObject:v7])
  {
    [v6 setAccessoryView:0];
    if (!v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v8 startAnimating];
  [v6 setAccessoryView:v8];

  if (v6) {
LABEL_7:
  }
    [(PKAccountBankAccountsViewController *)self _configureBankAccountCell:v6 withFundingSource:v7];
LABEL_8:

  return v6;
}

- (void)_configureBankAccountCell:(id)a3 withFundingSource:(id)a4
{
  id v19 = a3;
  unint64_t v5 = [a4 bankAccountRepresentation];
  id v6 = [v5 bankName];
  id v7 = [v5 maskedAccountNumber];
  uint64_t v8 = [v5 status];
  unint64_t v9 = [v19 textLabel];
  uint64_t v10 = [v19 detailTextLabel];
  [v9 setText:v6];
  [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  [v10 setText:v7];
  [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
  if (PKPaymentSetupContextIsBridge())
  {
    unint64_t v11 = PKBridgeAppearanceGetAppearanceSpecifier();
    uint64_t v12 = v11;
    if (v8 == 2) {
      [v11 altTextColor];
    }
    else {
    id v13 = [v11 textColor];
    }
    [v9 setTextColor:v13];

    uint64_t v14 = PKBridgeAppearanceGetAppearanceSpecifier();
    uint64_t v15 = [v14 altTextColor];
    [v10 setTextColor:v15];

    id v16 = PKBridgeAppearanceGetAppearanceSpecifier();
    id v17 = [v16 foregroundColor];
    [v19 setBackgroundColor:v17];
  }
  else
  {
    if (v8 == 2) {
      [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    else {
    id v18 = [MEMORY[0x1E4FB1618] labelColor];
    }
    [v9 setTextColor:v18];

    id v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v10 setTextColor:v16];
  }

  [v19 setAccessibilityIdentifier:*MEMORY[0x1E4F852B0]];
  objc_msgSend(v19, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return [(PKAccountBankAccountsViewController *)self _isBankAccountIndexPath:a4];
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = (void *)MEMORY[0x1E4FB1688];
  unint64_t v9 = PKLocalizedFeatureString();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __100__PKAccountBankAccountsViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
  v16[3] = &unk_1E59D7B90;
  objc_copyWeak(&v18, &location);
  id v10 = v7;
  id v17 = v10;
  unint64_t v11 = [v8 contextualActionWithStyle:1 title:v9 handler:v16];

  uint64_t v12 = (void *)MEMORY[0x1E4FB1CC0];
  v20[0] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v14 = [v12 configurationWithActions:v13];

  [v14 setPerformsFirstActionWithFullSwipe:0];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

void __100__PKAccountBankAccountsViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _didSelectDeleteBankAccountAtIndexPath:*(void *)(a1 + 32) withCompletionHandler:v7];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(PKAccountBankAccountsViewController *)self _sectionTypeForSection:a4] == 2)
  {
    unint64_t v5 = (void *)[(NSMutableArray *)self->_unavailableFundingSourcesWithoutVerification count];
    if (v5)
    {
      unint64_t v5 = PKLocalizedFeatureString();
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
  unint64_t v6 = [(PKAccountBankAccountsViewController *)self _sectionTypeForSection:a4];
  switch(v6)
  {
    case 2uLL:
      if ([(PKAccount *)self->_account type] == 4)
      {
        id v7 = (void *)[(NSMutableArray *)self->_unavailableFundingSourcesWithoutVerification count];
        if (!v7) {
          goto LABEL_17;
        }
        goto LABEL_15;
      }
      break;
    case 1uLL:
      if ([(PKAccountBankAccountsViewController *)self _sectionTypeForSection:a4 + 1] == 2) {
        goto LABEL_15;
      }
      break;
    case 0uLL:
      if ([(PKAccount *)self->_account type] == 4)
      {
        if ([(PKAccount *)self->_associatedAccount isCoOwner]) {
          break;
        }
      }
      else if ([(PKAccount *)self->_account type] != 1 {
             || ([(PKAccount *)self->_account isCoOwner] & 1) != 0
      }
             || [(PKAccount *)self->_associatedAccount type] != 4)
      {
        break;
      }
LABEL_15:
      id v7 = PKLocalizedFeatureString();
      goto LABEL_17;
  }
  id v7 = 0;
LABEL_17:

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PKAccountBankAccountsViewController *)self tableView:v6 titleForHeaderInSection:a4];
  if ([v7 length]
    || ([(PKAccountBankAccountsViewController *)self tableView:v6 heightForHeaderInSection:a4], v8 == *MEMORY[0x1E4FB2F28]))
  {
    unint64_t v9 = 0;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    unint64_t v9 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  unint64_t v6 = [(PKAccountBankAccountsViewController *)self _sectionTypeForSection:a4];
  if (v6 != 1)
  {
    if (!v6
      && [(PKAccount *)self->_account type] == 4
      && [(PKAccount *)self->_associatedAccount isCoOwner])
    {
      id v7 = PKLocalizedFeatureString();
      double v8 = PKLocalizedFeatureString();
      unint64_t v9 = objc_alloc_init(PKFooterHyperlinkView);
      id v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", @"https://support.apple.com/kb/HT213452#family", v7);
      id v11 = PKAttributedStringByAddingLinkToSubstring(v8, v7, v10);
      [(PKFooterHyperlinkView *)v9 setAttributedText:v11];

      id v12 = &__block_literal_global_47;
      [(PKFooterHyperlinkView *)v9 setAction:&__block_literal_global_47];

      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ([(PKAccountBankAccountsViewController *)self _sectionTypeForSection:a4 + 1] == 2)
  {
LABEL_7:
    unint64_t v9 = 0;
    goto LABEL_8;
  }
  id v14 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  unint64_t v9 = (PKFooterHyperlinkView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
LABEL_8:

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  unint64_t v6 = [(PKAccountBankAccountsViewController *)self _sectionTypeForSection:a4];
  if (v6 == 2) {
    return *MEMORY[0x1E4FB2F28];
  }
  if (v6 != 1)
  {
    double result = 16.0;
    if (v6) {
      return result;
    }
    return *MEMORY[0x1E4FB2F28];
  }
  unint64_t v8 = [(PKAccountBankAccountsViewController *)self _sectionTypeForSection:a4 - 1];
  double result = *MEMORY[0x1E4FB2F28];
  if (v8) {
    return 16.0;
  }
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  unint64_t v6 = [(PKAccountBankAccountsViewController *)self _sectionTypeForSection:a4];
  if (v6 == 2) {
    return *MEMORY[0x1E4FB2F28];
  }
  if (v6 != 1)
  {
    double result = 0.0;
    if (v6) {
      return result;
    }
    return *MEMORY[0x1E4FB2F28];
  }
  unint64_t v8 = [(PKAccountBankAccountsViewController *)self _sectionTypeForSection:a4 + 1];
  double result = *MEMORY[0x1E4FB2F28];
  if (v8 != 2) {
    return 0.0;
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", [v5 section]);
  if (v6 == 2)
  {
    uint64_t v9 = [v5 row];
    BOOL v10 = v9 == [(NSMutableArray *)self->_unavailableFundingSourcesWithoutVerification count];
    goto LABEL_10;
  }
  if (v6 == 1)
  {
    if ([v5 row] == 1)
    {
      uint64_t v8 = 1202;
      goto LABEL_9;
    }
LABEL_13:
    BOOL v11 = 0;
    goto LABEL_14;
  }
  if (v6) {
    goto LABEL_13;
  }
  uint64_t v7 = [v5 row];
  if (v7 != [(NSMutableArray *)self->_availableFundingSources count]) {
    goto LABEL_13;
  }
  uint64_t v8 = 1201;
LABEL_9:
  BOOL v10 = *((unsigned char *)&self->super.super.super.super.super.isa + v8) == 0;
LABEL_10:
  BOOL v11 = v10;
LABEL_14:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEditing]) {
    [(PKAccountBankAccountsViewController *)self _toggleEditingMode];
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
  uint64_t v8 = [v7 row];
  unint64_t v9 = -[PKAccountBankAccountsViewController _sectionTypeForSection:](self, "_sectionTypeForSection:", [v7 section]);
  if (v9 == 2)
  {
    if (v8 == [(NSMutableArray *)self->_unavailableFundingSourcesWithoutVerification count]) {
      [(PKAccountBankAccountsViewController *)self _presentContactSupport];
    }
  }
  else if (v9 == 1)
  {
    if (v8 == 1)
    {
      BOOL v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, objc_msgSend(v7, "section"));
      BOOL v11 = [(PKAccountBankAccountsViewController *)self _fundingSourceForIndexPath:v10];
      [(PKAccountBankAccountsViewController *)self _presentLinkAccountForFundingSource:v11];
    }
  }
  else if (!v9 && v8 == [(NSMutableArray *)self->_availableFundingSources count])
  {
    if (self->_accountFeatureIdentifier == 5 && !self->_userInfo)
    {
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__PKAccountBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v12[3] = &unk_1E59CB100;
      objc_copyWeak(&v13, &location);
      [(PKAccountBankAccountsViewController *)self _fetchAccountUserInfo:v12];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PKAccountBankAccountsViewController *)self _presentAddBankAccount];
    }
  }
}

void __73__PKAccountBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__PKAccountBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v3[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __73__PKAccountBankAccountsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained;
    uint64_t v3 = [WeakRetained[138] savingsUserInfo];
    id v4 = [v3 primaryUser];
    char v5 = [v4 emailAddresses];
    id v6 = [v5 firstObject];
    id v7 = [v6 value];

    if (*(unsigned char *)(a1 + 40) && v7) {
      [v8 _presentAddBankAccount];
    }

    id WeakRetained = v8;
  }
}

- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKAccountBankAccountsViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __99__PKAccountBankAccountsViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) fundingDetails];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      if ([v4 status] == 2)
      {
        id v5 = [v4 verificationDetails];

        uint64_t v6 = *(void *)(a1 + 32);
        if (v5) {
          uint64_t v7 = 143;
        }
        else {
          uint64_t v7 = 144;
        }
        id v8 = &v9[v7];
      }
      else
      {
        id v8 = v9 + 142;
        uint64_t v6 = *(void *)(a1 + 32);
      }
      [*v8 addObject:v6];
      objc_storeStrong(v9 + 147, *(id *)(a1 + 32));
      [v9 reloadData];
      [v9 _updateEditButtonIfNecessary];
    }
    id WeakRetained = v9;
  }
}

- (void)addBankAccountInformationViewControllerDidFinish:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 32) navigationController];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2;
  v3[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, &location);
  void v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained[147] type] == 1)
    {
      id v4 = [v3[147] fundingDetails];
    }
    else
    {
      id v4 = 0;
    }
    if ([v4 status] == 2)
    {
      id v5 = [v4 verificationDetails];

      if (!v5)
      {
        uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1104) savingsUserInfo];
        uint64_t v7 = [v6 primaryUser];
        id v8 = [v7 emailAddresses];
        id v9 = [v8 firstObject];
        BOOL v10 = [v9 value];

        if (v10)
        {
          BOOL v11 = PKLocalizedFeatureString();
          id v12 = PKLocalizedFeatureString();
          id v13 = PKLocalizedFeatureString();
          id v14 = PKLocalizedFeatureString();
          uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1, v10);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_155;
          v18[3] = &unk_1E59CB1F0;
          v18[4] = *(void *)(a1 + 32);
          id v16 = [MEMORY[0x1E4FB1410] actionWithTitle:v13 style:0 handler:v18];
          [v15 addAction:v16];

          id v17 = [MEMORY[0x1E4FB1410] actionWithTitle:v14 style:0 handler:0];
          [v15 addAction:v17];

          [v3 presentViewController:v15 animated:1 completion:0];
        }
        else
        {
          BOOL v11 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Missing account user info email! Alert cannot be displayed", buf, 2u);
          }
        }
      }
    }
  }
}

uint64_t __88__PKAccountBankAccountsViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_155(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentAddBankAccount];
}

- (void)addBankAccountInformationViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__PKAccountBankAccountsViewController_addBankAccountInformationViewController_didFailWithError___block_invoke;
  v10[3] = &unk_1E59CB378;
  objc_copyWeak(&v13, &location);
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __96__PKAccountBankAccountsViewController_addBankAccountInformationViewController_didFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = (void *)WeakRetained[147];
    WeakRetained[147] = 0;
    id v6 = WeakRetained;

    id v4 = PKAccountDisplayableError();
    id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
    [*(id *)(a1 + 40) presentViewController:v5 animated:1 completion:0];

    id WeakRetained = v6;
  }
}

- (void)contactIssuerHelper:(id)a3 didRequestPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
}

- (void)contactIssuerHelper:(id)a3 didRequestDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  [(PKAccountBankAccountsViewController *)self _reloadFundingSources];
  id v4 = [(PKAccountBankAccountsViewController *)self presentedViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKAccount *)self->_account accountIdentifier];
  id v9 = v7;
  BOOL v10 = v9;
  if (v8 == v9)
  {
  }
  else
  {
    if (!v9 || !v8)
    {

      goto LABEL_9;
    }
    int v11 = [v8 isEqualToString:v9];

    if (!v11) {
      goto LABEL_9;
    }
  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKAccountBankAccountsViewController_didUpdatePaymentFundingSources_accountIdentifier___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v14, &location);
  id v13 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
LABEL_9:
}

void __88__PKAccountBankAccountsViewController_didUpdatePaymentFundingSources_accountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setAndFilterFundingSources:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_contactIssuerHelper, 0);
  objc_storeStrong((id *)&self->_lastAddedFundingSource, 0);
  objc_storeStrong((id *)&self->_deletingFundingSources, 0);
  objc_storeStrong((id *)&self->_unavailableFundingSourcesWithoutVerification, 0);
  objc_storeStrong((id *)&self->_unavailableFundingSourcesWithVerification, 0);
  objc_storeStrong((id *)&self->_availableFundingSources, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_associatedAccount, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end