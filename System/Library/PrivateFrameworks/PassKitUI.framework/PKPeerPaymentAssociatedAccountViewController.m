@interface PKPeerPaymentAssociatedAccountViewController
- (BOOL)_actionsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4;
- (BOOL)_detailsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4;
- (BOOL)_disableCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4;
- (BOOL)_enableCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4;
- (BOOL)_notificationsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4;
- (BOOL)_receiveRestrictionsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4;
- (BOOL)_recurringPaymentsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4;
- (BOOL)_sendRestrictionsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKPeerPaymentAssociatedAccountViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 account:(id)a5 context:(int64_t)a6;
- (id)_actionsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_balanceCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_defaultCellWithTextColor:(id)a3 forTableView:(id)a4;
- (id)_detailsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_disableCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_enableCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_linkCellWithText:(id)a3 color:(id)a4 forTableView:(id)a5;
- (id)_notificationTransactionsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_notificationsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3;
- (id)_receiveRestrictionAnyoneCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_receiveRestrictionFamilyCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_receiveRestrictionsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_recurringPaymentsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_sendRestrictionAnyoneCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_sendRestrictionContactsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_sendRestrictionFamilyCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_sendRestrictionScreenTimeSettingsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_sendRestrictionsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_switchCellWithTextColor:(id)a3 forTableView:(id)a4;
- (id)_transactionsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)familyMemberTransactionViewController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_actionsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4;
- (void)_addPreferencesUpdateWithRequest:(id)a3;
- (void)_applyDefaultStylingToCell:(id)a3 textLabelColor:(id)a4;
- (void)_detailsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4;
- (void)_disableCellSelectedForTableView:(id)a3 atIndexPath:(id)a4;
- (void)_enableCellSelectedForTableView:(id)a3 atIndexPath:(id)a4;
- (void)_executeNextPreferencesUpdateRequestIfPossible;
- (void)_loadRecurringPayments;
- (void)_modifyPeerPaymentAccountState:(unint64_t)a3 atIndexPath:(id)a4;
- (void)_notificationTransactionsSelectionHasChanged:(id)a3;
- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4;
- (void)_peerPaymentAccountChanged:(id)a3;
- (void)_peerPaymentPreferencesChanged:(id)a3;
- (void)_presentPassworkPromptWithCompletion:(id)a3;
- (void)_receiveRestrictionsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4;
- (void)_recurringPaymentsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4;
- (void)_sendRestrictionsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4;
- (void)_updateCellLoadingState:(id)a3 indexPath:(id)a4;
- (void)_updatePeerPaymentAccountWithNewAccount:(id)a3;
- (void)_updatePreferencesFromPeerPaymentServiceAndReloadView;
- (void)paymentSetupDidFinish:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PKPeerPaymentAssociatedAccountViewController

- (PKPeerPaymentAssociatedAccountViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 account:(id)a5 context:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v47.receiver = self;
  v47.super_class = (Class)PKPeerPaymentAssociatedAccountViewController;
  v14 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v47, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1), 7);
  v15 = v14;
  if (v14)
  {
    v14->_context = a6;
    p_familyMember = &v14->_familyMember;
    objc_storeStrong((id *)&v14->_familyMember, a3);
    objc_storeStrong((id *)&v15->_familyCollection, a4);
    uint64_t v16 = [MEMORY[0x1E4F84E10] sharedService];
    peerPaymentWebSerivce = v15->_peerPaymentWebSerivce;
    v15->_peerPaymentWebSerivce = (PKPeerPaymentWebService *)v16;

    uint64_t v18 = [(PKPeerPaymentWebService *)v15->_peerPaymentWebSerivce peerPaymentService];
    peerPaymentService = v15->_peerPaymentService;
    v15->_peerPaymentService = (PKPeerPaymentService *)v18;

    v20 = v13;
    if (!v13)
    {
      v20 = [(PKPeerPaymentService *)v15->_peerPaymentService account];
    }
    p_peerPaymentAccount = (id *)&v15->_peerPaymentAccount;
    objc_storeStrong((id *)&v15->_peerPaymentAccount, v20);
    if (!v13) {

    }
    v22 = [(PKPeerPaymentService *)v15->_peerPaymentService preferences];
    uint64_t v23 = [v22 copy];
    preferences = v15->_preferences;
    v15->_preferences = (PKPeerPaymentPreferences *)v23;

    v25 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
    paymentService = v15->_paymentService;
    v15->_paymentService = v25;

    [(PKPaymentService *)v15->_paymentService setDelegate:v15];
    v15->_detailViewStyle = 1;
    id v27 = *p_peerPaymentAccount;
    v28 = [v11 altDSID];
    uint64_t v29 = [v27 peerPaymentAccountWithAltDSID:v28];
    associatedAccount = v15->_associatedAccount;
    v15->_associatedAccount = (PKPeerPaymentAccount *)v29;

    if (v15->_associatedAccount)
    {
      uint64_t v31 = [objc_alloc(MEMORY[0x1E4F850C0]) initWithPeerPaymentAccount:v15->_associatedAccount];
      transactionSource = v15->_transactionSource;
      v15->_transactionSource = (PKTransactionSource *)v31;
    }
    [(PKPeerPaymentAssociatedAccountViewController *)v15 _updatePeerPaymentAccountWithNewAccount:*p_peerPaymentAccount];
    if ([*p_peerPaymentAccount supportsFamilySharing])
    {
      v33 = v15->_paymentService;
      v34 = [(PKTransactionSource *)v15->_transactionSource transactionSourceIdentifiers];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __102__PKPeerPaymentAssociatedAccountViewController_initWithFamilyMember_familyCollection_account_context___block_invoke;
      v45[3] = &unk_1E59CB6D8;
      v46 = v15;
      [(PKPaymentService *)v33 hasTransactionsForTransactionSourceIdentifiers:v34 completion:v45];

      p_super = &v46->super.super.super.super.super;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, p_super, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", buf, 2u);
      }
    }

    if ([*p_peerPaymentAccount supportsRecurringPayments])
    {
      v36 = [[PKPaymentTransactionCellController alloc] initWithContactResolver:0 context:1];
      transactionPresenter = v15->_transactionPresenter;
      v15->_transactionPresenter = v36;

      [(PKPeerPaymentAssociatedAccountViewController *)v15 _loadRecurringPayments];
    }
    v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 addObserver:v15 selector:sel__peerPaymentAccountChanged_ name:*MEMORY[0x1E4F87CB0] object:v15->_peerPaymentService];

    v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 addObserver:v15 selector:sel__peerPaymentPreferencesChanged_ name:*MEMORY[0x1E4F87CB8] object:v15->_peerPaymentService];

    [(PKPeerPaymentService *)v15->_peerPaymentService registerObserver:v15];
    if (v15->_context == 3) {
      PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentFam.isa);
    }
    else {
    v40 = [*v43 labelName];
    }
    [(PKPeerPaymentAssociatedAccountViewController *)v15 setTitle:v40];
  }
  return v15;
}

void __102__PKPeerPaymentAssociatedAccountViewController_initWithFamilyMember_familyCollection_account_context___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __102__PKPeerPaymentAssociatedAccountViewController_initWithFamilyMember_familyCollection_account_context___block_invoke_2;
  v3[3] = &unk_1E59CDA78;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __102__PKPeerPaymentAssociatedAccountViewController_initWithFamilyMember_familyCollection_account_context___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1192) = *(unsigned char *)(a1 + 40);
  if ([*(id *)(a1 + 32) isViewLoaded])
  {
    id v3 = [*(id *)(a1 + 32) tableView];
    v2 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [v3 reloadSections:v2 withRowAnimation:100];
  }
}

- (id)familyMemberTransactionViewController
{
  id v3 = [PKFamilyMemberTransactionsViewController alloc];
  familyMember = self->_familyMember;
  familyCollection = self->_familyCollection;
  transactionSource = self->_transactionSource;
  peerPaymentAccount = self->_peerPaymentAccount;
  peerPaymentWebSerivce = self->_peerPaymentWebSerivce;
  id v9 = objc_alloc_init(MEMORY[0x1E4F84A88]);
  v10 = [(PKFamilyMemberTransactionsViewController *)v3 initWithFamilyMember:familyMember familyCollection:familyCollection transactionSource:transactionSource account:0 peerPaymentAccount:peerPaymentAccount peerPaymentWebService:peerPaymentWebSerivce detailViewStyle:1 paymentServiceDataProvider:v9 mode:1];

  return v10;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsFamilySharing])
  {
    int v5 = [(PKPeerPaymentAccount *)self->_associatedAccount isParticipantAccountLockedByOwner];
    int v6 = v5;
    switch(a3)
    {
      case 0uLL:
        LOBYTE(v8) = 1;
        return v8;
      case 1uLL:
        if (![(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsRecurringPayments])goto LABEL_10; {
        return PKPaymentSetupContextIsBridge() ^ 1;
        }
      case 2uLL:
      case 3uLL:
      case 5uLL:
        v7 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
        int v8 = [v7 isOrganizer] & (v6 ^ 1);
        goto LABEL_4;
      case 4uLL:
        LOBYTE(v8) = v5 ^ 1;
        return v8;
      case 6uLL:
        if ([(PKPeerPaymentAssociatedAccountViewController *)self shouldMapSection:5]) {
          goto LABEL_10;
        }
        v7 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
        int v8 = [v7 isOrganizer] & v6;
LABEL_4:

        break;
      default:
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentAssociatedAccountViewController;
  [(PKPeerPaymentAssociatedAccountViewController *)&v13 viewDidAppear:a3];
  if (([(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsFamilySharing] & 1) == 0)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", v12, 2u);
    }

    int v5 = (void *)MEMORY[0x1E4FB1418];
    int v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentFea.isa);
    v7 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentFea_0.isa);
    int v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

    id v9 = (void *)MEMORY[0x1E4FB1410];
    v10 = PKLocalizedString(&cfstr_Ok.isa);
    id v11 = [v9 actionWithTitle:v10 style:0 handler:0];

    [v8 addAction:v11];
    PKAccessibilityIDAlertSet(v8, (void *)*MEMORY[0x1E4F85500]);
    [(PKPeerPaymentAssociatedAccountViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)_peerPaymentAccountChanged:(id)a3
{
  peerPaymentService = self->_peerPaymentService;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__PKPeerPaymentAssociatedAccountViewController__peerPaymentAccountChanged___block_invoke;
  v4[3] = &unk_1E59CE240;
  v4[4] = self;
  [(PKPeerPaymentService *)peerPaymentService updateAccountWithCompletion:v4];
}

void __75__PKPeerPaymentAssociatedAccountViewController__peerPaymentAccountChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PKPeerPaymentAssociatedAccountViewController__peerPaymentAccountChanged___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __75__PKPeerPaymentAssociatedAccountViewController__peerPaymentAccountChanged___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePeerPaymentAccountWithNewAccount:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 updateSectionVisibilityAndReloadIfNecessaryForAllSections];
}

- (void)_peerPaymentPreferencesChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPeerPaymentAssociatedAccountViewController__peerPaymentPreferencesChanged___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__PKPeerPaymentAssociatedAccountViewController__peerPaymentPreferencesChanged___block_invoke(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentAssociatedAccountViewController preferences changed", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  if (v3[147])
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Not updating associated account preferences since another preferences update is in flight", v4, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 1194) = 1;
  }
  else
  {
    [v3 _updatePreferencesFromPeerPaymentServiceAndReloadView];
  }
}

- (void)_updatePreferencesFromPeerPaymentServiceAndReloadView
{
  id v3 = [(PKPeerPaymentService *)self->_peerPaymentService preferences];
  id obj = (id)[v3 copy];

  self->_preferencesChanged = 0;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferences, obj);
    [(PKSectionTableViewController *)self updateSectionVisibilityAndReloadIfNecessaryForAllSections];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  switch([(PKSectionTableViewController *)self sectionForIndex:a4])
  {
    case 0uLL:
      if (self->_hasPaymentTransactions) {
        int64_t result = 3;
      }
      else {
        int64_t result = 2;
      }
      break;
    case 1uLL:
      int64_t result = [(NSArray *)self->_recurringPayments count] + 1;
      break;
    case 2uLL:
      int64_t result = 4;
      break;
    case 3uLL:
      int64_t result = 2;
      break;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      int64_t result = 1;
      break;
    default:
      int64_t result = 0;
      break;
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
      uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _detailsCellForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 1uLL:
      uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _recurringPaymentsCellForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 2uLL:
      uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _sendRestrictionsCellForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 3uLL:
      uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _receiveRestrictionsCellForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 4uLL:
      uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _notificationsCellForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 5uLL:
      uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _disableCellForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 6uLL:
      uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _enableCellForTableView:v6 atIndexPath:v7];
LABEL_10:
      id v9 = (void *)v8;
      break;
    default:
      id v9 = 0;
      break;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v6 section]))
  {
    case 0uLL:
      [(PKPeerPaymentAssociatedAccountViewController *)self _detailsCellSelectedForTableView:v7 atIndexPath:v6];
      break;
    case 1uLL:
      [(PKPeerPaymentAssociatedAccountViewController *)self _recurringPaymentsCellSelectedForTableView:v7 atIndexPath:v6];
      break;
    case 2uLL:
      [(PKPeerPaymentAssociatedAccountViewController *)self _sendRestrictionsCellSelectedForTableView:v7 atIndexPath:v6];
      break;
    case 3uLL:
      [(PKPeerPaymentAssociatedAccountViewController *)self _receiveRestrictionsCellSelectedForTableView:v7 atIndexPath:v6];
      break;
    case 5uLL:
      [(PKPeerPaymentAssociatedAccountViewController *)self _disableCellSelectedForTableView:v7 atIndexPath:v6];
      break;
    case 6uLL:
      [(PKPeerPaymentAssociatedAccountViewController *)self _enableCellSelectedForTableView:v7 atIndexPath:v6];
      break;
    default:
      break;
  }
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]))
  {
    case 0uLL:
      BOOL v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _detailsCellShouldHighlightForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 1uLL:
      BOOL v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _recurringPaymentsCellShouldHighlightForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 2uLL:
      BOOL v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _sendRestrictionsCellShouldHighlightForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 3uLL:
      BOOL v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _receiveRestrictionsCellShouldHighlightForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 4uLL:
      BOOL v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _notificationsCellShouldHighlightForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 5uLL:
      BOOL v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _disableCellShouldHighlightForTableView:v6 atIndexPath:v7];
      goto LABEL_10;
    case 6uLL:
      BOOL v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _enableCellShouldHighlightForTableView:v6 atIndexPath:v7];
LABEL_10:
      BOOL v9 = v8;
      break;
    default:
      BOOL v9 = 0;
      break;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  switch([(PKSectionTableViewController *)self sectionForIndex:a4])
  {
    case 1uLL:
      uint64_t v5 = PKLocalizedPeerPaymentRecurringString(&cfstr_TransactionHis.isa);
      goto LABEL_6;
    case 2uLL:
      uint64_t v5 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss.isa);
      goto LABEL_6;
    case 3uLL:
      uint64_t v5 = PKLocalizedNearbyPeerPaymentString(&cfstr_PeerPaymentAss_0.isa);
LABEL_6:
      id v6 = (void *)v5;
      break;
    case 4uLL:
      id v7 = [(PKFamilyMember *)self->_familyMember firstName];
      id v6 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_1.isa, &stru_1EF1B4C70.isa, v7);

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v4 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v4 == 4)
  {
    uint64_t v5 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_2.isa);
  }
  else if (v4 == 1)
  {
    uint64_t v5 = PKLocalizedPeerPaymentRecurringString(&cfstr_FamilySettingF.isa);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] == 2)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/HT211325"];
    uint64_t v5 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentAss_3.isa);
    id v6 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentAss_4.isa, &stru_1EF1B4C70.isa, v5);
    id v7 = objc_alloc_init(PKFooterHyperlinkView);
    BOOL v8 = PKAttributedStringByAddingLinkToSubstring(v6, v5, v4);
    [(PKFooterHyperlinkView *)v7 setAttributedText:v8];

    [(PKFooterHyperlinkView *)v7 setAction:&__block_literal_global_44];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __81__PKPeerPaymentAssociatedAccountViewController_tableView_viewForFooterInSection___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = (void *)MEMORY[0x1E4F223E0];
    id v3 = a2;
    id v4 = [v2 defaultWorkspace];
    [v4 openURL:v3 configuration:0 completionHandler:0];
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __98__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1144) transactionSourceIdentifiers];
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v4 + 1192))
    {
      *(unsigned char *)(v4 + 1192) = 1;
      id v6 = [*(id *)(a1 + 32) tableView];
      id v5 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
      [v6 reloadSections:v5 withRowAnimation:100];
    }
  }
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  v7[3] = &unk_1E59CA870;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 1144) transactionSourceIdentifiers];
  if ([v6 containsObject:*(void *)(a1 + 40)])
  {
    int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1192);

    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void **)(v3 + 1152);
      id v5 = [*(id *)(v3 + 1144) transactionSourceIdentifiers];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2;
      v7[3] = &unk_1E59CB6D8;
      v7[4] = *(void *)(a1 + 32);
      [v4 hasTransactionsForTransactionSourceIdentifiers:v5 completion:v7];
    }
  }
  else
  {
  }
}

void __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_3;
  v2[3] = &unk_1E59CDA78;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __111__PKPeerPaymentAssociatedAccountViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1192) = 0;
    id v2 = [*(id *)(a1 + 32) tableView];
    v1 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [v2 reloadSections:v1 withRowAnimation:100];
  }
}

- (void)_detailsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 row];
  if (v7 == 1)
  {
    [(PKPeerPaymentAssociatedAccountViewController *)self _actionsCellSelectedForTableView:v10 atIndexPath:v6];
  }
  else if (v7 == 2)
  {
    id v8 = [(PKPeerPaymentAssociatedAccountViewController *)self navigationController];
    BOOL v9 = [(PKPeerPaymentAssociatedAccountViewController *)self familyMemberTransactionViewController];
    [v8 pushViewController:v9 animated:1];
  }
}

- (void)_recurringPaymentsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  unint64_t v5 = objc_msgSend(a4, "row", a3);
  id v6 = objc_alloc(MEMORY[0x1E4F84D80]);
  uint64_t v7 = [MEMORY[0x1E4F84E10] sharedService];
  id v8 = (void *)[v6 initWithPeerPaymentWebService:v7];

  BOOL v9 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount recurringPaymentsFeatureDescriptor];
  if (v5 < [(NSArray *)self->_recurringPayments count])
  {
    id v10 = [(NSArray *)self->_recurringPayments objectAtIndex:v5];
    id v11 = [PKPeerPaymentRecurringPaymentDetailViewController alloc];
    id v12 = [v10 recipientAddress];
    objc_super v13 = [(PKPeerPaymentRecurringPaymentDetailViewController *)v11 initWithRecurringPayment:v10 recipientAddress:v12 mode:2 context:0 peerPaymentController:v8 remoteMessagesComposer:0];

    v14 = [v9 minimumAmount];
    [(PKPeerPaymentRecurringPaymentDetailViewController *)v13 setMinimumAmount:v14];

    v15 = [v9 maximumAmount];
    [(PKPeerPaymentRecurringPaymentDetailViewController *)v13 setMaximumAmount:v15];

    uint64_t v16 = [(PKPeerPaymentAssociatedAccountViewController *)self navigationController];
    [v16 pushViewController:v13 animated:1];
LABEL_6:

    goto LABEL_7;
  }
  id v24 = 0;
  uint64_t v25 = 0;
  BOOL v17 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:3 account:self->_peerPaymentAccount unableReason:&v25 displayableError:&v24];
  id v10 = v24;
  if (!v17)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __103__PKPeerPaymentAssociatedAccountViewController__recurringPaymentsCellSelectedForTableView_atIndexPath___block_invoke;
    v23[3] = &unk_1E59CA7D0;
    v23[4] = self;
    objc_super v13 = +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:v25 displayableError:v10 addCardActionHandler:v23];
    uint64_t v16 = [(PKPeerPaymentAssociatedAccountViewController *)self navigationController];
    [v16 presentViewController:v13 animated:1 completion:0];
    goto LABEL_6;
  }
  uint64_t v18 = [(PKFamilyMember *)self->_familyMember appleID];
  v19 = [[PKPeerPaymentRemoteMessagesComposer alloc] initWithPeerPaymentController:v8 presentingViewController:self actionType:2 sourceType:1];
  v20 = [[PKAmountKeypadViewController alloc] initWithRemoteMessagesComposer:v19 recipientAddress:v18 sendFlowType:2 familyCollection:self->_familyCollection];
  [(PKAmountKeypadViewController *)v20 setShowCancelButton:1];
  v21 = [[PKNavigationController alloc] initWithRootViewController:v20];
  v22 = [(PKPeerPaymentAssociatedAccountViewController *)self navigationController];

  [v22 presentViewController:v21 animated:1 completion:0];
  id v10 = (id)v18;
LABEL_7:
}

uint64_t __103__PKPeerPaymentAssociatedAccountViewController__recurringPaymentsCellSelectedForTableView_atIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openPaymentSetupWithNetworkWhitelist:0 paymentSetupMode:0];
}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F84BB8]);
  id v8 = [MEMORY[0x1E4F84D50] sharedService];
  BOOL v9 = (void *)[v7 initWithWebService:v8];

  [v9 setAllowedPaymentNetworks:v6];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v9 setAllowedFeatureIdentifiers:v10];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E59CAEF8;
  objc_copyWeak(v14, &location);
  id v11 = v9;
  id v13 = v11;
  v14[1] = (id)a4;
  [v11 preflightWithCompletion:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E59CAED0;
  objc_copyWeak(v11, a1 + 5);
  char v12 = a2;
  id v6 = a1[4];
  v11[1] = a1[6];
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v11);
}

void __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v4 = [WeakRetained _paymentSetupNavigationControllerForProvisioningController:*(void *)(a1 + 32)];
      [v4 setPaymentSetupMode:*(void *)(a1 + 56)];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v10[3] = &unk_1E59CAEA8;
      v10[4] = v3;
      id v11 = v4;
      id v5 = v4;
      [v5 preflightWithCompletion:v10];
    }
    else
    {
      id v6 = *(void **)(a1 + 40);
      if (v6)
      {
        id v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v5 = v7;
      id v8 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:v7];
      id v9 = [v3 navigationController];
      [v9 presentViewController:v8 animated:1 completion:0];
    }
  }
}

void __103__PKPeerPaymentAssociatedAccountViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v4 context:0];

  [(PKNavigationController *)v5 setCustomFormSheetPresentationStyleForiPad];
  [(PKPaymentSetupNavigationController *)v5 setSetupDelegate:self];
  [(PKPaymentSetupNavigationController *)v5 setShowsWelcomeViewController:0];

  return v5;
}

- (void)_sendRestrictionsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  familyMember = self->_familyMember;
  id v6 = a4;
  id v13 = [(PKFamilyMember *)familyMember altDSID];
  uint64_t v7 = [v6 row];

  uint64_t v8 = 1;
  switch(v7)
  {
    case 0:
      goto LABEL_4;
    case 1:
      uint64_t v8 = 2;
      goto LABEL_4;
    case 2:
      uint64_t v8 = 3;
LABEL_4:
      [(PKPeerPaymentPreferences *)self->_preferences addSendRestrictionType:v8 altDSID:v13];
      goto LABEL_5;
    case 3:
      objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", 1);
      id v11 = (PKPeerPaymentPreferencesUpdateRequest *)objc_claimAutoreleasedReturnValue();
      char v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=SCREEN_TIME&path=COMMUNICATION_LIMITS"];
      [(PKPeerPaymentPreferencesUpdateRequest *)v11 openSensitiveURL:v12 withOptions:0];

      goto LABEL_7;
    case 4:
      goto LABEL_8;
    default:
LABEL_5:
      id v9 = [PKPeerPaymentPreferencesUpdateRequest alloc];
      id v10 = (void *)[(PKPeerPaymentPreferences *)self->_preferences copy];
      id v11 = [(PKPeerPaymentPreferencesUpdateRequest *)v9 initWithUpdatedPreferences:v10 section:2];

      [(PKPeerPaymentAssociatedAccountViewController *)self _addPreferencesUpdateWithRequest:v11];
LABEL_7:

LABEL_8:

      return;
  }
}

- (void)_receiveRestrictionsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  familyMember = self->_familyMember;
  id v6 = a4;
  id v12 = [(PKFamilyMember *)familyMember altDSID];
  uint64_t v7 = [v6 row];

  switch(v7)
  {
    case 0:
      uint64_t v8 = 1;
      goto LABEL_6;
    case 4:
      goto LABEL_8;
    case 1:
      uint64_t v8 = 2;
LABEL_6:
      [(PKPeerPaymentPreferences *)self->_preferences addReceiveRestrictionType:v8 altDSID:v12];
      break;
  }
  id v9 = [PKPeerPaymentPreferencesUpdateRequest alloc];
  id v10 = (void *)[(PKPeerPaymentPreferences *)self->_preferences copy];
  id v11 = [(PKPeerPaymentPreferencesUpdateRequest *)v9 initWithUpdatedPreferences:v10 section:3];

  [(PKPeerPaymentAssociatedAccountViewController *)self _addPreferencesUpdateWithRequest:v11];
LABEL_8:
}

- (void)_actionsCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  id v10 = [(PKFamilyMember *)self->_familyMember appleID];
  id v5 = [MEMORY[0x1E4F28C28] zero];
  id v6 = [(PKPeerPaymentAccount *)self->_associatedAccount currentBalance];
  uint64_t v7 = [v6 currency];

  uint64_t v8 = PKPeerPaymentGetSendPaymentSensitiveURL();
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v9 openSensitiveURL:v8 withOptions:0];
  }
}

- (void)_disableCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v7 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_5.isa);
  uint64_t v8 = [(PKFamilyMember *)self->_familyMember firstName];
  id v9 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_6.isa, &stru_1EF1B4C70.isa, v8);
  id v10 = [v6 alertControllerWithTitle:v7 message:v9 preferredStyle:0];

  id v11 = (void *)MEMORY[0x1E4FB1410];
  id v12 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_7.isa);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__PKPeerPaymentAssociatedAccountViewController__disableCellSelectedForTableView_atIndexPath___block_invoke;
  v18[3] = &unk_1E59CB218;
  v18[4] = self;
  id v19 = v5;
  id v13 = v5;
  v14 = [v11 actionWithTitle:v12 style:2 handler:v18];

  [v14 setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
  [v10 addAction:v14];
  v15 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v16 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_8.isa);
  BOOL v17 = [v15 actionWithTitle:v16 style:1 handler:0];

  [v17 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
  [v10 addAction:v17];
  [(PKPeerPaymentAssociatedAccountViewController *)self presentViewController:v10 animated:1 completion:0];
}

uint64_t __93__PKPeerPaymentAssociatedAccountViewController__disableCellSelectedForTableView_atIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _modifyPeerPaymentAccountState:3 atIndexPath:*(void *)(a1 + 40)];
}

- (void)_enableCellSelectedForTableView:(id)a3 atIndexPath:(id)a4
{
}

- (BOOL)_detailsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_modifyingAccount) {
    goto LABEL_2;
  }
  uint64_t v11 = [v7 row];
  if (v11 == 2) {
    goto LABEL_7;
  }
  if (v11 == 1)
  {
    BOOL v9 = [(PKPeerPaymentAssociatedAccountViewController *)self _actionsCellShouldHighlightForTableView:v6 atIndexPath:v8];
    goto LABEL_3;
  }
  if (v11) {
LABEL_2:
  }
    BOOL v9 = 0;
  else {
LABEL_7:
  }
    BOOL v9 = 1;
LABEL_3:

  return v9;
}

- (BOOL)_recurringPaymentsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount;
}

- (BOOL)_sendRestrictionsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount && (unint64_t)objc_msgSend(a4, "row", a3) < 4;
}

- (BOOL)_receiveRestrictionsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount && (unint64_t)objc_msgSend(a4, "row", a3) < 2;
}

- (BOOL)_notificationsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount;
}

- (BOOL)_actionsCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount;
}

- (BOOL)_disableCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount;
}

- (BOOL)_enableCellShouldHighlightForTableView:(id)a3 atIndexPath:(id)a4
{
  return !self->_modifyingAccount;
}

- (id)_detailsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  switch(v8)
  {
    case 2:
      uint64_t v9 = [(PKPeerPaymentAssociatedAccountViewController *)self _transactionsCellForTableView:v6 atIndexPath:v7];
      goto LABEL_7;
    case 1:
      uint64_t v9 = [(PKPeerPaymentAssociatedAccountViewController *)self _actionsCellForTableView:v6 atIndexPath:v7];
      goto LABEL_7;
    case 0:
      uint64_t v9 = [(PKPeerPaymentAssociatedAccountViewController *)self _balanceCellForTableView:v6 atIndexPath:v7];
LABEL_7:
      id v10 = (void *)v9;
      goto LABEL_9;
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

- (id)_balanceCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPeerPaymentAssociatedAccountViewController *)self _defaultCellWithTextColor:0 forTableView:a3];
  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v7 indexPath:v6];

  uint64_t v8 = [v7 textLabel];
  uint64_t v9 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_9.isa);
  [v8 setText:v9];

  id v10 = [v7 detailTextLabel];
  uint64_t v11 = [(PKPeerPaymentAccount *)self->_associatedAccount currentBalance];
  id v12 = [v11 formattedStringValue];
  [v10 setText:v12];

  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E4F852A8]);

  return v7;
}

- (id)_recurringPaymentsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v7 row];
  if (v8 >= [(NSArray *)self->_recurringPayments count])
  {
    if ([(NSArray *)self->_recurringPayments count])
    {
      v14 = PKLocalizedPeerPaymentRecurringString(&cfstr_FamilySettingS.isa);
    }
    else
    {
      uint64_t v16 = [(PKFamilyMember *)self->_familyMember firstName];
      v14 = PKLocalizedPeerPaymentRecurringString(&cfstr_FamilySettingS_0.isa, &stru_1EF1B4C70.isa, v16);
    }
    id v13 = [(PKPeerPaymentAssociatedAccountViewController *)self _linkCellWithText:v14 color:0 forTableView:v6];
    [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v13 indexPath:v7];
  }
  else
  {
    uint64_t v9 = [v6 dequeueReusableCellWithIdentifier:@"PKPeerPaymentFamilyMemberViewControllerTransactionCell"];
    if (!v9) {
      uint64_t v9 = [[PKPaymentTransactionTableCell alloc] initWithStyle:0 reuseIdentifier:@"PKPeerPaymentFamilyMemberViewControllerTransactionCell"];
    }
    unint64_t v10 = PKUIGetMinScreenWidthType();
    double v11 = 4.0;
    if (v10 >= 2) {
      double v11 = 7.0;
    }
    -[PKPaymentTransactionTableCell setAdditionalInsets:](v9, "setAdditionalInsets:", 0.0, v11, 0.0, v11);
    recurringPayments = self->_recurringPayments;
    id v13 = v9;
    v14 = [(NSArray *)recurringPayments objectAtIndex:v8];
    v15 = PKPeerPaymentTransactionForRecurringPayment();
    [(PKPaymentTransactionCellController *)self->_transactionPresenter configureCell:v13 forTransaction:v15 transactionSource:self->_transactionSource familyMember:self->_familyMember account:0 detailStyle:self->_detailViewStyle deviceName:0 avatarViewDelegate:self];
  }
  PKAccessibilityIDCellSet(v13, (void *)*MEMORY[0x1E4F858D8]);

  return v13;
}

- (id)_transactionsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPeerPaymentAssociatedAccountViewController *)self _defaultCellWithTextColor:0 forTableView:a3];
  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v7 indexPath:v6];

  unint64_t v8 = [v7 textLabel];
  uint64_t v9 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_10.isa);
  [v8 setText:v9];

  [v7 setAccessoryType:1];
  PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E4F85AF0]);

  return v7;
}

- (id)_sendRestrictionsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([v7 row])
  {
    case 0:
      uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _sendRestrictionAnyoneCellForTableView:v6 atIndexPath:v7];
      goto LABEL_7;
    case 1:
      uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _sendRestrictionContactsCellForTableView:v6 atIndexPath:v7];
      goto LABEL_7;
    case 2:
      uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _sendRestrictionFamilyCellForTableView:v6 atIndexPath:v7];
      goto LABEL_7;
    case 3:
      uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _sendRestrictionScreenTimeSettingsCellForTableView:v6 atIndexPath:v7];
LABEL_7:
      uint64_t v9 = (void *)v8;
      break;
    default:
      uint64_t v9 = 0;
      break;
  }
  unint64_t v10 = [v7 row];
  if (v10 > 3) {
    double v11 = (void **)MEMORY[0x1E4F85B28];
  }
  else {
    double v11 = (void **)qword_1E59CEA98[v10];
  }
  PKAccessibilityIDCellSet(v9, *v11);

  return v9;
}

- (id)_sendRestrictionAnyoneCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPeerPaymentAssociatedAccountViewController *)self _defaultCellWithTextColor:0 forTableView:a3];
  uint64_t v8 = [v7 textLabel];
  uint64_t v9 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_11.isa);
  [v8 setText:v9];

  preferences = self->_preferences;
  double v11 = [(PKFamilyMember *)self->_familyMember altDSID];
  id v12 = [(PKPeerPaymentPreferences *)preferences restrictionsForAltDSID:v11];

  if ([v12 sendRestrictionType] == 1) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  [v7 setAccessoryType:v13];
  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v7 indexPath:v6];

  return v7;
}

- (id)_sendRestrictionContactsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPeerPaymentAssociatedAccountViewController *)self _defaultCellWithTextColor:0 forTableView:a3];
  uint64_t v8 = [v7 textLabel];
  uint64_t v9 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_12.isa);
  [v8 setText:v9];

  preferences = self->_preferences;
  double v11 = [(PKFamilyMember *)self->_familyMember altDSID];
  id v12 = [(PKPeerPaymentPreferences *)preferences restrictionsForAltDSID:v11];

  if ([v12 sendRestrictionType] == 2) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  [v7 setAccessoryType:v13];
  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v7 indexPath:v6];

  return v7;
}

- (id)_sendRestrictionFamilyCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPeerPaymentAssociatedAccountViewController *)self _defaultCellWithTextColor:0 forTableView:a3];
  uint64_t v8 = [v7 textLabel];
  uint64_t v9 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_13.isa);
  [v8 setText:v9];

  preferences = self->_preferences;
  double v11 = [(PKFamilyMember *)self->_familyMember altDSID];
  id v12 = [(PKPeerPaymentPreferences *)preferences restrictionsForAltDSID:v11];

  if ([v12 sendRestrictionType] == 3) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  [v7 setAccessoryType:v13];
  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v7 indexPath:v6];

  return v7;
}

- (id)_sendRestrictionScreenTimeSettingsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_14.isa);
  uint64_t v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
  unint64_t v10 = [(PKPeerPaymentAssociatedAccountViewController *)self _linkCellWithText:v8 color:v9 forTableView:v7];

  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v10 indexPath:v6];

  return v10;
}

- (id)_receiveRestrictionsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  if (v8 == 1)
  {
    uint64_t v9 = [(PKPeerPaymentAssociatedAccountViewController *)self _receiveRestrictionFamilyCellForTableView:v6 atIndexPath:v7];
    goto LABEL_5;
  }
  if (!v8)
  {
    uint64_t v9 = [(PKPeerPaymentAssociatedAccountViewController *)self _receiveRestrictionAnyoneCellForTableView:v6 atIndexPath:v7];
LABEL_5:
    unint64_t v10 = (void *)v9;
    goto LABEL_7;
  }
  unint64_t v10 = 0;
LABEL_7:
  uint64_t v11 = [v7 row];
  id v12 = (void **)MEMORY[0x1E4F85510];
  uint64_t v13 = (void **)MEMORY[0x1E4F85548];
  if (v11 != 1) {
    uint64_t v13 = (void **)MEMORY[0x1E4F85B28];
  }
  if (v11) {
    id v12 = v13;
  }
  PKAccessibilityIDCellSet(v10, *v12);

  return v10;
}

- (id)_receiveRestrictionAnyoneCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPeerPaymentAssociatedAccountViewController *)self _defaultCellWithTextColor:0 forTableView:a3];
  uint64_t v8 = [v7 textLabel];
  uint64_t v9 = PKLocalizedNearbyPeerPaymentString(&cfstr_PeerPaymentAss_15.isa);
  [v8 setText:v9];

  preferences = self->_preferences;
  uint64_t v11 = [(PKFamilyMember *)self->_familyMember altDSID];
  id v12 = [(PKPeerPaymentPreferences *)preferences restrictionsForAltDSID:v11];

  if ([v12 receiveRestrictionType] == 1) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  [v7 setAccessoryType:v13];
  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v7 indexPath:v6];

  return v7;
}

- (id)_receiveRestrictionFamilyCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPeerPaymentAssociatedAccountViewController *)self _defaultCellWithTextColor:0 forTableView:a3];
  uint64_t v8 = [v7 textLabel];
  uint64_t v9 = PKLocalizedNearbyPeerPaymentString(&cfstr_PeerPaymentAss_16.isa);
  [v8 setText:v9];

  preferences = self->_preferences;
  uint64_t v11 = [(PKFamilyMember *)self->_familyMember altDSID];
  id v12 = [(PKPeerPaymentPreferences *)preferences restrictionsForAltDSID:v11];

  if ([v12 receiveRestrictionType] == 2) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  [v7 setAccessoryType:v13];
  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v7 indexPath:v6];

  return v7;
}

- (id)_notificationsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 row])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(PKPeerPaymentAssociatedAccountViewController *)self _notificationTransactionsCellForTableView:v6 atIndexPath:v7];
  }

  return v8;
}

- (id)_notificationTransactionsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(PKPeerPaymentAssociatedAccountViewController *)self _switchCellWithTextColor:0 forTableView:a3];
  uint64_t v8 = [v7 textLabel];
  uint64_t v9 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_17.isa);
  [v8 setText:v9];

  [v7 setTarget:self action:sel__notificationTransactionsSelectionHasChanged_];
  preferences = self->_preferences;
  uint64_t v11 = [(PKFamilyMember *)self->_familyMember altDSID];
  id v12 = [(PKPeerPaymentPreferences *)preferences notificationWithType:1 altDSID:v11];

  objc_msgSend(v7, "setOn:", objc_msgSend(v12, "value"));
  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v7 indexPath:v6];

  return v7;
}

- (id)_actionsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_18.isa);
  uint64_t v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
  unint64_t v10 = [(PKPeerPaymentAssociatedAccountViewController *)self _linkCellWithText:v8 color:v9 forTableView:v7];

  PKAccessibilityIDCellSet(v10, (void *)*MEMORY[0x1E4F859A8]);
  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v10 indexPath:v6];

  return v10;
}

- (id)_disableCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_7.isa);
  uint64_t v9 = [MEMORY[0x1E4FB1618] systemRedColor];
  unint64_t v10 = [(PKPeerPaymentAssociatedAccountViewController *)self _linkCellWithText:v8 color:v9 forTableView:v7];

  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v10 indexPath:v6];
  if (self->_modifyingAccount)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v11 startAnimating];
    [v10 setAccessoryView:v11];
  }
  else
  {
    [v10 setAccessoryView:0];
  }
  PKAccessibilityIDCellSet(v10, (void *)*MEMORY[0x1E4F85698]);

  return v10;
}

- (id)_enableCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentAss_19.isa);
  uint64_t v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
  unint64_t v10 = [(PKPeerPaymentAssociatedAccountViewController *)self _linkCellWithText:v8 color:v9 forTableView:v7];

  [(PKPeerPaymentAssociatedAccountViewController *)self _updateCellLoadingState:v10 indexPath:v6];
  if (self->_modifyingAccount)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v11 startAnimating];
    [v10 setAccessoryView:v11];
  }
  else
  {
    [v10 setAccessoryView:0];
  }
  PKAccessibilityIDCellSet(v10, (void *)*MEMORY[0x1E4F85B30]);

  return v10;
}

- (id)_defaultCellWithTextColor:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  id v7 = [a4 dequeueReusableCellWithIdentifier:@"PKPeerPaymentFamilyMemberViewControllerDefaultCell"];
  if (!v7) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PKPeerPaymentFamilyMemberViewControllerDefaultCell"];
  }
  PKAccessibilityIDCellSet(v7, 0);
  [(PKPeerPaymentAssociatedAccountViewController *)self _applyDefaultStylingToCell:v7 textLabelColor:v6];

  return v7;
}

- (id)_switchCellWithTextColor:(id)a3 forTableView:(id)a4
{
  id v6 = a3;
  id v7 = [a4 dequeueReusableCellWithIdentifier:@"PKPeerPaymentFamilyMemberViewControllerSwitchCell"];
  if (!v7) {
    id v7 = [[PKSettingTableCell alloc] initWithStyle:0 reuseIdentifier:@"PKPeerPaymentFamilyMemberViewControllerSwitchCell"];
  }
  [(PKPeerPaymentAssociatedAccountViewController *)self _applyDefaultStylingToCell:v7 textLabelColor:v6];

  return v7;
}

- (id)_linkCellWithText:(id)a3 color:(id)a4 forTableView:(id)a5
{
  if (a4)
  {
    id v8 = a5;
    id v9 = a3;
    unint64_t v10 = [(PKPeerPaymentAssociatedAccountViewController *)self _defaultCellWithTextColor:a4 forTableView:v8];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4FB1618];
    id v12 = a5;
    id v13 = a3;
    id v8 = [v11 systemBlueColor];
    unint64_t v10 = [(PKPeerPaymentAssociatedAccountViewController *)self _defaultCellWithTextColor:v8 forTableView:v12];
  }
  v14 = [v10 textLabel];
  [v14 setText:a3];

  return v10;
}

- (void)_applyDefaultStylingToCell:(id)a3 textLabelColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = [v6 textLabel];
  [v10 setText:0];
  [v10 setTextColor:v5];

  id v7 = [v6 detailTextLabel];
  [v7 setText:0];
  [v6 setAccessoryType:0];
  [v6 setSelectionStyle:3];
  [v6 setUserInteractionEnabled:1];
  id v8 = [v6 textLabel];
  [v8 setEnabled:1];

  id v9 = [v6 detailTextLabel];

  [v9 setEnabled:1];
}

- (void)_updateCellLoadingState:(id)a3 indexPath:(id)a4
{
  id v8 = a3;
  [v8 setUserInteractionEnabled:!self->_modifyingAccount];
  id v5 = [v8 textLabel];
  [v5 setEnabled:!self->_modifyingAccount];

  id v6 = [v8 detailTextLabel];
  [v6 setEnabled:!self->_modifyingAccount];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v8 settingSwitch];
    [v7 setEnabled:!self->_modifyingAccount];
  }
  else
  {
    [v8 setAccessoryView:0];
  }
}

- (void)_notificationTransactionsSelectionHasChanged:(id)a3
{
  id v8 = [(PKFamilyMember *)self->_familyMember altDSID];
  id v4 = [(PKPeerPaymentPreferences *)self->_preferences notificationWithType:1 altDSID:v8];
  objc_msgSend(v4, "setValue:", objc_msgSend(v4, "value") ^ 1);
  [(PKPeerPaymentPreferences *)self->_preferences didUpdateNotification:v4];
  id v5 = [PKPeerPaymentPreferencesUpdateRequest alloc];
  id v6 = (void *)[(PKPeerPaymentPreferences *)self->_preferences copy];
  id v7 = [(PKPeerPaymentPreferencesUpdateRequest *)v5 initWithUpdatedPreferences:v6 section:4];

  [(PKPeerPaymentAssociatedAccountViewController *)self _addPreferencesUpdateWithRequest:v7];
}

- (void)_modifyPeerPaymentAccountState:(unint64_t)a3 atIndexPath:(id)a4
{
  if (!self->_modifyingAccount)
  {
    id v6 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedAccountStateActionFeatureDescriptor];
    id v7 = [v6 identifier];

    if (v7)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke;
      aBlock[3] = &unk_1E59CA7D0;
      aBlock[4] = self;
      id v8 = _Block_copy(aBlock);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_2;
      v15[3] = &unk_1E59CEA00;
      v15[4] = self;
      id v16 = v7;
      unint64_t v18 = a3;
      id v9 = v8;
      id v17 = v9;
      id v10 = (void (**)(void))_Block_copy(v15);
      self->_modifyingAccount = 1;
      [(PKSectionTableViewController *)self updateSectionVisibilityAndReloadIfNecessaryForAllSections];
      if (a3 - 2 >= 3 && a3)
      {
        if (a3 == 1)
        {
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_7;
          v12[3] = &unk_1E59CEA28;
          void v12[4] = self;
          id v13 = v9;
          v14 = v10;
          [(PKPeerPaymentAssociatedAccountViewController *)self _presentPassworkPromptWithCompletion:v12];
        }
      }
      else
      {
        v10[2](v10);
      }
    }
    else
    {
      uint64_t v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Error: no feature identifier defined for associatedAccountStateActionFeatureDescriptor", buf, 2u);
      }
    }
  }
}

uint64_t __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1193) = 0;
  return [*(id *)(a1 + 32) updateSectionVisibilityAndReloadIfNecessaryForAllSections];
}

void __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F84D70]);
  char v3 = [*(id *)(*(void *)(a1 + 32) + 1128) identifier];
  id v4 = (void *)[v2 initWithAssociatedAccountIdentifier:v3];

  [v4 setFeatureIdentifier:*(void *)(a1 + 40)];
  id v5 = PKPeerPaymentAccountStateToString();
  [v4 setValue:v5];

  id v6 = *(void **)(*(void *)(a1 + 32) + 1104);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_3;
  v8[3] = &unk_1E59CE9D8;
  id v7 = *(id *)(a1 + 48);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v6 peerPaymentAssociatedAccountActionWithRequest:v4 completion:v8];
}

void __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_4;
  v10[3] = &unk_1E59CE9B0;
  id v11 = v5;
  id v12 = v6;
  id v7 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = *(void **)(v7 + 1120);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_5;
    v11[3] = &unk_1E59CE988;
    v11[4] = v7;
    id v12 = *(id *)(a1 + 56);
    [v8 updateAssociatedAccountsWithCompletion:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v2 = [MEMORY[0x1E4F84D80] displayableErrorForError:*(void *)(a1 + 40)];
    if (!*(void *)(a1 + 40))
    {
      id v9 = v2;
      char v3 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentEma.isa);
      id v4 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentEma_0.isa);
      uint64_t v5 = PKDisplayableErrorCustom();

      id v2 = (void *)v5;
    }
    id v10 = v2;
    id v6 = PKAlertForDisplayableErrorWithHandlers(v2, 0, 0, 0);
    [*(id *)(a1 + 48) presentViewController:v6 animated:1 completion:0];
  }
}

void __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_6;
  block[3] = &unk_1E59CE110;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePeerPaymentAccountWithNewAccount:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    uint64_t v8 = *(void *)(a1 + 48);
LABEL_12:
    (*(void (**)(void))(v8 + 16))();
    goto LABEL_13;
  }
  id v5 = [v3 domain];
  uint64_t v6 = *MEMORY[0x1E4F4ED70];
  if ([v5 isEqual:*MEMORY[0x1E4F4ED70]])
  {
    uint64_t v7 = [v4 code];

    if (v7 == -7003) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v9 = [v4 domain];
  if (![v9 isEqual:v6])
  {

    goto LABEL_11;
  }
  uint64_t v10 = [v4 code];

  if (v10 != -7005)
  {
LABEL_11:
    uint64_t v8 = *(void *)(a1 + 40);
    goto LABEL_12;
  }
  id v11 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);
  id v12 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
  uint64_t v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v11 message:v12 preferredStyle:1];
  id v14 = (void *)MEMORY[0x1E4FB1410];
  v15 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_8;
  v17[3] = &unk_1E59CB150;
  id v18 = *(id *)(a1 + 40);
  id v16 = [v14 actionWithTitle:v15 style:1 handler:v17];
  [v13 addAction:v16];

  PKAccessibilityIDAlertSet(v13, (void *)*MEMORY[0x1E4F85500]);
  [*(id *)(a1 + 32) presentViewController:v13 animated:0 completion:0];

LABEL_13:
}

uint64_t __91__PKPeerPaymentAssociatedAccountViewController__modifyPeerPaymentAccountState_atIndexPath___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentPassworkPromptWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentWebService *)self->_peerPaymentWebSerivce _appleAccountInformation];
  id v6 = objc_alloc_init(MEMORY[0x1E4F4F100]);
  [v6 setPresentingViewController:self];
  uint64_t v7 = [v5 appleID];
  [v6 setUsername:v7];

  uint64_t v8 = [v5 aaAlternateDSID];
  [v6 setAltDSID:v8];

  [v6 setIsUsernameEditable:0];
  [v6 setShouldPromptForPasswordOnly:1];
  [v6 setAuthenticationType:2];
  id v9 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __85__PKPeerPaymentAssociatedAccountViewController__presentPassworkPromptWithCompletion___block_invoke;
  v11[3] = &unk_1E59CEA50;
  id v12 = v4;
  id v10 = v4;
  [v9 authenticateWithContext:v6 completion:v11];
}

void __85__PKPeerPaymentAssociatedAccountViewController__presentPassworkPromptWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PKPeerPaymentAssociatedAccountViewController__presentPassworkPromptWithCompletion___block_invoke_2;
  v7[3] = &unk_1E59CAD68;
  id v5 = *(id *)(a1 + 32);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __85__PKPeerPaymentAssociatedAccountViewController__presentPassworkPromptWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_updatePeerPaymentAccountWithNewAccount:(id)a3
{
  p_peerPaymentAccount = &self->_peerPaymentAccount;
  objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
  id v12 = a3;
  id v6 = *p_peerPaymentAccount;
  uint64_t v7 = [(PKFamilyMember *)self->_familyMember altDSID];
  id v8 = [(PKPeerPaymentAccount *)v6 peerPaymentAccountWithAltDSID:v7];
  associatedAccount = self->_associatedAccount;
  self->_associatedAccount = v8;

  id v10 = (PKTransactionSource *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPeerPaymentAccount:self->_associatedAccount];
  transactionSource = self->_transactionSource;
  self->_transactionSource = v10;
}

- (void)_addPreferencesUpdateWithRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  pendingPreferencesUpdateRequest = self->_pendingPreferencesUpdateRequest;
  if (pendingPreferencesUpdateRequest)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = pendingPreferencesUpdateRequest;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Associated Account preferences request coalesced %@ onto pending request %@", (uint8_t *)&v10, 0x16u);
    }

    [(PKPeerPaymentPreferencesUpdateRequest *)self->_pendingPreferencesUpdateRequest coalesceWithRequest:v5];
  }
  else
  {
    objc_storeStrong((id *)&self->_pendingPreferencesUpdateRequest, a3);
    uint64_t v7 = PKLogFacilityTypeGetObject();
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Associated Account preferences request queued %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = [v5 sections];
  id v9 = [v8 allObjects];
  [(PKSectionTableViewController *)self updateSectionVisibilityAndReloadIfNecessaryForSections:v9];

  [(PKPeerPaymentAssociatedAccountViewController *)self _executeNextPreferencesUpdateRequestIfPossible];
}

- (void)_executeNextPreferencesUpdateRequestIfPossible
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_currentPreferencesUpdateRequest = (id *)&self->_currentPreferencesUpdateRequest;
  if (!self->_currentPreferencesUpdateRequest)
  {
    objc_storeStrong((id *)&self->_currentPreferencesUpdateRequest, self->_pendingPreferencesUpdateRequest);
    if (*p_currentPreferencesUpdateRequest
      && (pendingPreferencesUpdateRequest = self->_pendingPreferencesUpdateRequest,
          self->_pendingPreferencesUpdateRequest = 0,
          pendingPreferencesUpdateRequest,
          (id v5 = *p_currentPreferencesUpdateRequest) != 0))
    {
      id v6 = v5;
      uint64_t v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v6;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Peer Payment Associated Account preferences request starting %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      peerPaymentService = self->_peerPaymentService;
      id v9 = [v6 updatedPreferences];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke;
      v12[3] = &unk_1E59CEA78;
      objc_copyWeak(&v14, (id *)buf);
      id v10 = v6;
      id v13 = v10;
      [(PKPeerPaymentService *)peerPaymentService setPreferences:v9 completion:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
    else if (self->_preferencesChanged)
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Updating preferences from peer payment since since this is the last associated accounts preference update request.", buf, 2u);
      }

      [(PKPeerPaymentAssociatedAccountViewController *)self _updatePreferencesFromPeerPaymentServiceAndReloadView];
    }
  }
}

void __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke_2;
  v9[3] = &unk_1E59CE888;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = *(id *)(a1 + 32);
  id v11 = v6;
  id v12 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v4;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment Associated Account preferences request completed %@", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v5;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Error updating peer payment preferences for associated account %@", buf, 0xCu);
      }

      objc_storeStrong(WeakRetained + 142, *(id *)(a1 + 48));
      id v6 = [*(id *)(a1 + 32) sections];
      id v7 = [v6 allObjects];
      [WeakRetained updateSectionVisibilityAndReloadIfNecessaryForSections:v7];

      id v8 = [WeakRetained[136] firstName];
      id v9 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentErr.isa);
      id v10 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentErr_0.isa, &stru_1EF1B4C70.isa, v8);
      id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
      id v12 = (void *)MEMORY[0x1E4FB1410];
      id v13 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      id v14 = [v12 actionWithTitle:v13 style:0 handler:0];
      [v11 addAction:v14];

      v15 = [WeakRetained navigationController];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke_198;
      v17[3] = &unk_1E59CA7D0;
      void v17[4] = WeakRetained;
      [v15 presentViewController:v11 animated:1 completion:v17];
    }
    else
    {
      id v16 = WeakRetained[147];
      WeakRetained[147] = 0;

      [WeakRetained _executeNextPreferencesUpdateRequestIfPossible];
    }
  }
}

uint64_t __94__PKPeerPaymentAssociatedAccountViewController__executeNextPreferencesUpdateRequestIfPossible__block_invoke_198(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1176);
  *(void *)(v2 + 1176) = 0;

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _executeNextPreferencesUpdateRequestIfPossible];
}

- (void)_loadRecurringPayments
{
  peerPaymentService = self->_peerPaymentService;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__PKPeerPaymentAssociatedAccountViewController__loadRecurringPayments__block_invoke;
  v3[3] = &unk_1E59CB328;
  void v3[4] = self;
  [(PKPeerPaymentService *)peerPaymentService recurringPaymentsWithCompletion:v3];
}

void __70__PKPeerPaymentAssociatedAccountViewController__loadRecurringPayments__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = a1;
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 1088) altDSID];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v11 recipientAltDSID];
        id v13 = v5;
        id v14 = v13;
        if (v12 == v13)
        {

LABEL_12:
          [v4 addObject:v11];
          continue;
        }
        if (v5 && v12)
        {
          int v15 = [v12 isEqualToString:v13];

          if (v15) {
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPeerPaymentAssociatedAccountViewController__loadRecurringPayments__block_invoke_2;
  block[3] = &unk_1E59CA870;
  void block[4] = *(void *)(v17 + 32);
  id v19 = v4;
  id v16 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __70__PKPeerPaymentAssociatedAccountViewController__loadRecurringPayments__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1208);
  *(void *)(v3 + 1208) = v2;

  if ([*(id *)(a1 + 32) isViewLoaded])
  {
    id v6 = [*(id *)(a1 + 32) tableView];
    uint64_t v5 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v6 reloadSections:v5 withRowAnimation:100];
  }
}

- (void)paymentSetupDidFinish:(id)a3
{
  id v4 = [(PKPeerPaymentAssociatedAccountViewController *)self navigationController];
  uint64_t v3 = objc_msgSend(v4, "pkui_frontMostViewController");
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurringPayments, 0);
  objc_storeStrong((id *)&self->_pendingPreferencesUpdateRequest, 0);
  objc_storeStrong((id *)&self->_currentPreferencesUpdateRequest, 0);
  objc_storeStrong((id *)&self->_transactionPresenter, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_transactionSource, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_associatedAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebSerivce, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);

  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end