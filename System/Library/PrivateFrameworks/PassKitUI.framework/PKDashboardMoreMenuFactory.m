@interface PKDashboardMoreMenuFactory
- (BOOL)_canShowNotificationsInfo;
- (BOOL)_canShowPaymentCardNumberAction;
- (BOOL)_hasCombinedActions;
- (BOOL)_hasGroupActions;
- (BOOL)_hasTransitCardNumber;
- (BOOL)_hasValidEnteredValueActions;
- (BOOL)_hasValidSelectedItemActions;
- (BOOL)_isAppleBalancePass;
- (BOOL)_isCreditPass;
- (BOOL)_isPassActivated;
- (BOOL)_isPassActivating;
- (BOOL)_isPassRequiresActivation;
- (BOOL)_isPayLaterPass;
- (BOOL)_isPeerPaymentPass;
- (BOOL)forceShowMoreMenuIcon;
- (BOOL)homeKitHasHomeGuestAccessSchedule;
- (FKAccount)bankConnectAccount;
- (NSUUID)homeKitHomeIdentifier;
- (PKAccount)account;
- (PKDashboardMoreMenuFactory)init;
- (PKDashboardMoreMenuFactoryDelegate)delegate;
- (PKFamilyMemberCollection)familyCollection;
- (PKNavigationDashboardPassViewController)navigationDashboardPassVC;
- (PKPass)pass;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (UINavigationController)navigationController;
- (id)_accessPassMenuItems;
- (id)_addMoneyAppleBalanceAction;
- (id)_addMoneyPeerPaymentAction;
- (id)_appleBalanceMenuItems;
- (id)_appleCardMenuItems;
- (id)_appleCashMenuItems;
- (id)_barcodePassMenuItems;
- (id)_eMoneyPassMenuItems;
- (id)_openRewardsHubAction;
- (id)_passActions;
- (id)_paymentPassMenuItems;
- (id)_peerPaymentFamilyAction;
- (id)_recurringPeerPaymentsPaymentsAction;
- (id)_redeemAction;
- (id)_removePassAction;
- (id)_removePassLocalizedTitle;
- (id)_savingsDetailsAction;
- (id)_savingsMenuItems;
- (id)_showAccountManageNotifications;
- (id)_showCalendarAction;
- (id)_showCombinedPassActionsBuy;
- (id)_showCombinedPassActionsRenew;
- (id)_showEnteredValuePassActions;
- (id)_showHasHomeGuestAccessScheduleAction;
- (id)_showInstallmentPlansAction;
- (id)_showPassActionGroups;
- (id)_showPassInfoAction;
- (id)_showPassInfoLocalizedTitle;
- (id)_showPassManageNotifications;
- (id)_showPaymentCardNumberAction;
- (id)_showSavingsDebugAction;
- (id)_showSavingsDocumentsAction;
- (id)_showScheduledPaymentsAction;
- (id)_showSelectedItemPassActions;
- (id)_showSellAction;
- (id)_showTransferAction;
- (id)_showTransitCardNumberAction;
- (id)_transferToBankAction;
- (id)_transitPassMenuItems;
- (id)moreMenu;
- (int64_t)_moreMenuTypeValue;
- (int64_t)moreMenuType;
- (unint64_t)_feature;
- (void)_addEventsToCalendarWithEventStore:(id)a3;
- (void)_peerPaymentAccountChanged:(id)a3;
- (void)_performAddToCalendarRequestNeedingPermission:(BOOL)a3 eventStore:(id)a4;
- (void)_presentNeedsCalendarPermissionsAlert;
- (void)_recalculateTransitPassDetails;
- (void)_reevaluateMoreMenuType;
- (void)_reloadMoreMenuItems;
- (void)accountChanged:(id)a3;
- (void)dealloc;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)setAccount:(id)a3;
- (void)setBankConnectAccount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFamilyCollection:(id)a3;
- (void)setHomeKitHasHomeGuestAccessSchedule:(BOOL)a3;
- (void)setHomeKitHomeIdentifier:(id)a3;
- (void)setMoreMenuType:(int64_t)a3;
- (void)setNavigationController:(id)a3;
- (void)setNavigationDashboardPassVC:(id)a3;
- (void)setPass:(id)a3;
- (void)setPeerPaymentAccount:(id)a3;
@end

@implementation PKDashboardMoreMenuFactory

- (PKDashboardMoreMenuFactory)init
{
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardMoreMenuFactory;
  v2 = [(PKDashboardMoreMenuFactory *)&v14 init];
  if (v2)
  {
    v3 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    paymentServiceDataProvider = v2->_paymentServiceDataProvider;
    v2->_paymentServiceDataProvider = v3;

    [(PKPaymentDefaultDataProvider *)v2->_paymentServiceDataProvider addDelegate:v2];
    v5 = (PKPassLibraryDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E4F848A0]);
    passLibraryDataProvider = v2->_passLibraryDataProvider;
    v2->_passLibraryDataProvider = v5;

    uint64_t v7 = [MEMORY[0x1E4F84D50] sharedService];
    webService = v2->_webService;
    v2->_webService = (PKPaymentWebService *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F846D8]) initWithPaymentDataProvider:v2->_paymentServiceDataProvider passLibraryDataProvider:v2->_passLibraryDataProvider isForWatch:0];
    expressPassController = v2->_expressPassController;
    v2->_expressPassController = (PKExpressPassController *)v9;

    uint64_t v11 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v2->_accountService;
    v2->_accountService = (PKAccountService *)v11;

    [(PKAccountService *)v2->_accountService registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(PKPaymentDefaultDataProvider *)self->_paymentServiceDataProvider removeDelegate:self];
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardMoreMenuFactory;
  [(PKDashboardMoreMenuFactory *)&v3 dealloc];
}

- (id)moreMenu
{
  if (PKPreferenceBOOLforKey())
  {
    objc_super v3 = 0;
  }
  else
  {
    int64_t v4 = [(PKDashboardMoreMenuFactory *)self moreMenuType];
    v5 = 0;
    self->_forceShowMoreMenuIcon = 0;
    switch(v4)
    {
      case 1:
        uint64_t v6 = [(PKDashboardMoreMenuFactory *)self _barcodePassMenuItems];
        goto LABEL_17;
      case 2:
        uint64_t v6 = [(PKDashboardMoreMenuFactory *)self _paymentPassMenuItems];
        goto LABEL_17;
      case 4:
        if ([(PKDashboardMoreMenuFactory *)self _isPassActivating]) {
          self->_forceShowMoreMenuIcon = 1;
        }
        uint64_t v6 = [(PKDashboardMoreMenuFactory *)self _transitPassMenuItems];
        goto LABEL_17;
      case 5:
        uint64_t v6 = [(PKDashboardMoreMenuFactory *)self _accessPassMenuItems];
        goto LABEL_17;
      case 6:
        if ([(PKDashboardMoreMenuFactory *)self _isPassActivating]) {
          self->_forceShowMoreMenuIcon = 1;
        }
        uint64_t v6 = [(PKDashboardMoreMenuFactory *)self _eMoneyPassMenuItems];
        goto LABEL_17;
      case 7:
        uint64_t v6 = [(PKDashboardMoreMenuFactory *)self _savingsMenuItems];
        goto LABEL_17;
      case 8:
        uint64_t v6 = [(PKDashboardMoreMenuFactory *)self _appleCardMenuItems];
        goto LABEL_17;
      case 9:
        uint64_t v6 = [(PKDashboardMoreMenuFactory *)self _appleCashMenuItems];
        goto LABEL_17;
      case 11:
        uint64_t v6 = [(PKDashboardMoreMenuFactory *)self _appleBalanceMenuItems];
LABEL_17:
        v5 = (void *)v6;
        break;
      default:
        break;
    }
    if ([v5 count])
    {
      objc_super v3 = [MEMORY[0x1E4FB1970] menuWithChildren:v5];
      [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F856F8]];
    }
    else
    {
      objc_super v3 = 0;
    }
  }

  return v3;
}

- (id)_barcodePassMenuItems
{
  v20[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKDashboardMoreMenuFactory *)self _canShowNotificationsInfo];
  int64_t v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(PKDashboardMoreMenuFactory *)self _showCalendarAction];
  [v5 safelyAddObject:v6];

  uint64_t v7 = [(PKDashboardMoreMenuFactory *)self _showTransferAction];
  [v5 safelyAddObject:v7];

  v8 = [(PKDashboardMoreMenuFactory *)self _showSellAction];
  [v5 safelyAddObject:v8];

  if ([v5 count])
  {
    uint64_t v9 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EF1B5B50 image:0 identifier:0 options:1 children:v5];
    [v4 safelyAddObject:v9];
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = [(PKDashboardMoreMenuFactory *)self _showPassInfoAction];
  [v10 safelyAddObject:v11];

  if (v3)
  {
    v12 = [(PKDashboardMoreMenuFactory *)self _showPassManageNotifications];
    [v10 safelyAddObject:v12];
  }
  if ([v10 count])
  {
    v13 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EF1B5B50 image:0 identifier:0 options:1 children:v10];
    [v4 safelyAddObject:v13];
  }
  objc_super v14 = (void *)MEMORY[0x1E4FB1970];
  v15 = [(PKDashboardMoreMenuFactory *)self _removePassAction];
  v20[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v17 = [v14 menuWithTitle:&stru_1EF1B5B50 image:0 identifier:0 options:1 children:v16];
  [v4 safelyAddObject:v17];

  v18 = (void *)[v4 copy];

  return v18;
}

- (id)_paymentPassMenuItems
{
  BOOL v3 = [(PKDashboardMoreMenuFactory *)self _canShowNotificationsInfo];
  BOOL v4 = [(PKDashboardMoreMenuFactory *)self _canShowPaymentCardNumberAction];
  BOOL v5 = v4;
  if (v3 || v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    if (v5)
    {
      v8 = [(PKDashboardMoreMenuFactory *)self _showPaymentCardNumberAction];
      [v7 safelyAddObject:v8];
    }
    uint64_t v9 = [(PKDashboardMoreMenuFactory *)self _showPassInfoAction];
    [v7 safelyAddObject:v9];

    if (v3)
    {
      id v10 = [(PKDashboardMoreMenuFactory *)self _showPassManageNotifications];
      [v7 safelyAddObject:v10];
    }
    uint64_t v6 = (void *)[v7 copy];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_transitPassMenuItems
{
  BOOL v3 = [(PKDashboardMoreMenuFactory *)self _hasValidEnteredValueActions];
  BOOL v4 = [(PKDashboardMoreMenuFactory *)self _hasTransitCardNumber];
  BOOL v5 = [(PKDashboardMoreMenuFactory *)self _canShowNotificationsInfo];
  BOOL v6 = [(PKDashboardMoreMenuFactory *)self _hasValidSelectedItemActions];
  BOOL v7 = [(PKDashboardMoreMenuFactory *)self _hasGroupActions];
  BOOL v8 = [(PKDashboardMoreMenuFactory *)self _hasCombinedActions];
  if (!v3 && !v4 && !v5 && !v6 && !v7)
  {
    uint64_t v9 = 0;
    goto LABEL_23;
  }
  id v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    v12 = [(PKDashboardMoreMenuFactory *)self _showEnteredValuePassActions];
    [v11 safelyAddObject:v12];
  }
  if (v8)
  {
    v13 = [(PKDashboardMoreMenuFactory *)self _showCombinedPassActionsBuy];
    [v11 safelyAddObject:v13];

    uint64_t v14 = [(PKDashboardMoreMenuFactory *)self _showCombinedPassActionsRenew];
  }
  else
  {
    if (v6)
    {
      v15 = [(PKDashboardMoreMenuFactory *)self _showSelectedItemPassActions];
      [v11 safelyAddObject:v15];
    }
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v14 = [(PKDashboardMoreMenuFactory *)self _showPassActionGroups];
  }
  v16 = (void *)v14;
  [v11 safelyAddObject:v14];

LABEL_16:
  if ([v11 count])
  {
    v17 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EF1B5B50 image:0 identifier:0 options:1 children:v11];
    [v10 safelyAddObject:v17];
  }
  if (v4)
  {
    v18 = [(PKDashboardMoreMenuFactory *)self _showTransitCardNumberAction];
    [v10 safelyAddObject:v18];
  }
  v19 = [(PKDashboardMoreMenuFactory *)self _showPassInfoAction];
  [v10 safelyAddObject:v19];

  if (v5)
  {
    v20 = [(PKDashboardMoreMenuFactory *)self _showPassManageNotifications];
    [v10 safelyAddObject:v20];
  }
  uint64_t v9 = (void *)[v10 copy];

LABEL_23:

  return v9;
}

- (id)_eMoneyPassMenuItems
{
  BOOL v3 = [(PKDashboardMoreMenuFactory *)self _hasValidEnteredValueActions];
  BOOL v4 = [(PKDashboardMoreMenuFactory *)self _hasTransitCardNumber];
  BOOL v5 = [(PKDashboardMoreMenuFactory *)self _canShowNotificationsInfo];
  BOOL v6 = v5;
  if (v3 || v4 || v5)
  {
    BOOL v8 = [MEMORY[0x1E4F1CA48] array];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v3)
    {
      id v10 = [(PKDashboardMoreMenuFactory *)self _showEnteredValuePassActions];
      [v9 safelyAddObject:v10];
    }
    if ([v9 count])
    {
      id v11 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EF1B5B50 image:0 identifier:0 options:1 children:v9];
      [v8 safelyAddObject:v11];
    }
    if (v4)
    {
      v12 = [(PKDashboardMoreMenuFactory *)self _showTransitCardNumberAction];
      [v8 safelyAddObject:v12];
    }
    v13 = [(PKDashboardMoreMenuFactory *)self _showPassInfoAction];
    [v8 safelyAddObject:v13];

    if (v6)
    {
      uint64_t v14 = [(PKDashboardMoreMenuFactory *)self _showPassManageNotifications];
      [v8 safelyAddObject:v14];
    }
    BOOL v7 = (void *)[v8 copy];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_accessPassMenuItems
{
  BOOL v3 = [(PKDashboardMoreMenuFactory *)self _canShowNotificationsInfo];
  BOOL homeKitHasHomeGuestAccessSchedule = self->_homeKitHasHomeGuestAccessSchedule;
  if (v3 || self->_homeKitHasHomeGuestAccessSchedule)
  {
    BOOL v6 = [MEMORY[0x1E4F1CA48] array];
    if (homeKitHasHomeGuestAccessSchedule)
    {
      BOOL v7 = [(PKDashboardMoreMenuFactory *)self _showHasHomeGuestAccessScheduleAction];
      [v6 safelyAddObject:v7];
    }
    BOOL v8 = [(PKDashboardMoreMenuFactory *)self _showPassInfoAction];
    [v6 safelyAddObject:v8];

    if (v3)
    {
      id v9 = [(PKDashboardMoreMenuFactory *)self _showPassManageNotifications];
      [v6 safelyAddObject:v9];
    }
    BOOL v5 = (void *)[v6 copy];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_savingsMenuItems
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(PKDashboardMoreMenuFactory *)self _savingsDetailsAction];
  [v3 safelyAddObject:v4];

  BOOL v5 = [(PKDashboardMoreMenuFactory *)self _showSavingsDocumentsAction];
  [v3 safelyAddObject:v5];

  BOOL v6 = [(PKDashboardMoreMenuFactory *)self _showAccountManageNotifications];
  [v3 safelyAddObject:v6];

  BOOL v7 = [(PKDashboardMoreMenuFactory *)self _showSavingsDebugAction];
  [v3 safelyAddObject:v7];

  BOOL v8 = (void *)[v3 copy];

  return v8;
}

- (id)_appleCardMenuItems
{
  BOOL v3 = ([(PKAccount *)self->_account blockAllAccountAccess] & 1) != 0
    || [(PKAccount *)self->_account state] == 3;
  BOOL v4 = [(PKAccount *)self->_account creditDetails];
  if (v4)
  {
    BOOL v5 = [(PKAccount *)self->_account creditDetails];
    BOOL v6 = [v5 accountSummary];
    int v7 = [v6 requiresDebtCollectionNotices];
  }
  else
  {
    int v7 = 0;
  }

  if ((v3 | v7)) {
    int v8 = 0;
  }
  else {
    int v8 = PKRewardsCenterEnabled();
  }
  id v9 = [(PKAccount *)self->_account creditDetails];
  id v10 = [v9 installmentPlans];

  BOOL v11 = !v3 && [v10 count] != 0;
  BOOL v12 = [(PKDashboardMoreMenuFactory *)self _canShowNotificationsInfo];
  BOOL v13 = v12;
  if (((v8 | v11) & 1) == 0 && !v12)
  {
    uint64_t v14 = 0;
    goto LABEL_26;
  }
  v15 = [MEMORY[0x1E4F1CA48] array];
  v16 = [(PKPass *)self->_pass paymentPass];
  if (!+[PKCreditAccountController shouldDisplayScheduledPaymentsWithAccount:self->_account andPass:v16])
  {
    if (!v11) {
      goto LABEL_18;
    }
LABEL_30:
    v27 = [(PKDashboardMoreMenuFactory *)self _showInstallmentPlansAction];
    [v15 safelyAddObject:v27];

    if (!v8) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v26 = [(PKDashboardMoreMenuFactory *)self _showScheduledPaymentsAction];
  [v15 safelyAddObject:v26];

  if (v11) {
    goto LABEL_30;
  }
LABEL_18:
  if (v8)
  {
LABEL_19:
    v17 = [(PKDashboardMoreMenuFactory *)self _openRewardsHubAction];
    [v15 safelyAddObject:v17];
  }
LABEL_20:
  v18 = [MEMORY[0x1E4F1CA48] array];
  v19 = [(PKDashboardMoreMenuFactory *)self _showPassInfoAction];
  [v18 safelyAddObject:v19];

  if (v13)
  {
    v20 = [(PKDashboardMoreMenuFactory *)self _showPassManageNotifications];
    [v18 safelyAddObject:v20];
  }
  uint64_t v21 = [v15 count];
  v22 = v18;
  if (v21)
  {
    uint64_t v23 = [v18 count];
    v22 = v15;
    if (v23)
    {
      v24 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EF1B5B50 image:0 identifier:0 options:1 children:v18];
      [v15 safelyAddObject:v24];

      v22 = v15;
    }
  }
  uint64_t v14 = (void *)[v22 copy];

LABEL_26:

  return v14;
}

- (id)_appleCashMenuItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
  if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount isEligibleToAddMoneyForUser:v4])
  {
    BOOL v5 = [(PKDashboardMoreMenuFactory *)self _addMoneyPeerPaymentAction];
    [v3 safelyAddObject:v5];
  }
  if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount isEligibleToWithdrawForUser:v4])
  {
    BOOL v6 = [(PKDashboardMoreMenuFactory *)self _transferToBankAction];
    [v3 safelyAddObject:v6];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v8 = [(PKDashboardMoreMenuFactory *)self _recurringPeerPaymentsPaymentsAction];
  [v7 safelyAddObject:v8];

  id v9 = [(PKDashboardMoreMenuFactory *)self _peerPaymentFamilyAction];
  [v7 safelyAddObject:v9];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PKDashboardMoreMenuFactory *)self _canShowPaymentCardNumberAction])
  {
    BOOL v11 = [(PKDashboardMoreMenuFactory *)self _showPaymentCardNumberAction];
    [v10 safelyAddObject:v11];
  }
  BOOL v12 = [(PKDashboardMoreMenuFactory *)self _showPassInfoAction];
  [v10 safelyAddObject:v12];

  if ([(PKDashboardMoreMenuFactory *)self _canShowNotificationsInfo])
  {
    BOOL v13 = [(PKDashboardMoreMenuFactory *)self _showPassManageNotifications];
    [v10 safelyAddObject:v13];
  }
  if ([v7 count])
  {
    uint64_t v14 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EF1B5B50 image:0 identifier:0 options:1 children:v7];
    [v3 safelyAddObject:v14];
  }
  if ([v10 count])
  {
    v15 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EF1B5B50 image:0 identifier:0 options:1 children:v10];
    [v3 safelyAddObject:v15];
  }
  v16 = (void *)[v3 copy];

  return v16;
}

- (id)_appleBalanceMenuItems
{
  id v3 = [(PKPass *)self->_pass paymentPass];
  int v4 = PKCanShowAppleBalanceTopUpOptions();

  if ([(PKAccount *)self->_account supportsTopUp]) {
    int v5 = 0;
  }
  else {
    int v5 = [(PKAccount *)self->_account supportsAMPTopUp] ^ 1;
  }
  int v6 = [(PKAccount *)self->_account supportsAMPRedeemGiftcard];
  BOOL v7 = [(PKDashboardMoreMenuFactory *)self _canShowNotificationsInfo];
  int v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = [(PKDashboardMoreMenuFactory *)self _showPassInfoAction];
  [v9 safelyAddObject:v10];

  if (v7)
  {
    BOOL v11 = [(PKDashboardMoreMenuFactory *)self _showPassManageNotifications];
    [v9 safelyAddObject:v11];
  }
  if (((v4 ^ 1 | v5) & 1) == 0)
  {
    BOOL v12 = [(PKDashboardMoreMenuFactory *)self _addMoneyAppleBalanceAction];
    [v8 safelyAddObject:v12];
  }
  if ((v4 & v6) == 1)
  {
    BOOL v13 = [(PKDashboardMoreMenuFactory *)self _redeemAction];
    [v8 safelyAddObject:v13];
  }
  if ([v8 count])
  {
    uint64_t v14 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EF1B5B50 image:0 identifier:0 options:1 children:v9];
    [v8 safelyAddObject:v14];
  }
  else
  {
    [v8 addObjectsFromArray:v9];
  }
  v15 = (void *)[v8 copy];

  return v15;
}

- (id)_showPassManageNotifications
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  int v4 = PKLocalizedString(&cfstr_DashboardMoreM_2.isa);
  int v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"bell.badge"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PKDashboardMoreMenuFactory__showPassManageNotifications__block_invoke;
  v8[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  int v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85728]];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __58__PKDashboardMoreMenuFactory__showPassManageNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v3 = [WeakRetained navigationDashboardPassVC];
    int v4 = [*(id *)(*(void *)(a1 + 32) + 96) paymentPass];

    if (v4)
    {
      int v5 = *(void **)(a1 + 32);
      uint64_t v6 = v5[2];
      uint64_t v7 = v5[9];
      uint64_t v8 = v5[14];
      id v9 = [v5 account];
      [v3 presentManagePaymentPassNotificationsControllerWithDataProvider:v6 peerPaymentAccount:v7 bankConnectAccount:v8 account:v9];
    }
    else
    {
      [v3 presentManageBarcodePassNotifications];
    }

    id WeakRetained = v10;
  }
}

- (id)_showEnteredValuePassActions
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  int v4 = PKPassLocalizedStringWithFormat();
  int v5 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"plus", 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PKDashboardMoreMenuFactory__showEnteredValuePassActions__block_invoke;
  v8[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  uint64_t v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F854E8]];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __58__PKDashboardMoreMenuFactory__showEnteredValuePassActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationDashboardPassVC];
    [v3 presentActionsWithPaymentDataProvider:*(void *)(*(void *)(a1 + 32) + 16) webService:*(void *)(*(void *)(a1 + 32) + 40) actionType:1 transitBalanceModel:*(void *)(*(void *)(a1 + 32) + 32)];

    id WeakRetained = v4;
  }
}

- (id)_showCombinedPassActionsBuy
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  id v4 = PKPassLocalizedStringWithFormat();
  int v5 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"creditcard", 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PKDashboardMoreMenuFactory__showCombinedPassActionsBuy__block_invoke;
  v8[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  uint64_t v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85318]];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __57__PKDashboardMoreMenuFactory__showCombinedPassActionsBuy__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationDashboardPassVC];
    [v3 presentCombinedActionsWithPaymentDataProvider:*(void *)(*(void *)(a1 + 32) + 16) webService:*(void *)(*(void *)(a1 + 32) + 40) balanceModel:*(void *)(*(void *)(a1 + 32) + 32) mode:0];

    id WeakRetained = v4;
  }
}

- (id)_showCombinedPassActionsRenew
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  id v4 = PKPassLocalizedStringWithFormat();
  int v5 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"creditcard", 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PKDashboardMoreMenuFactory__showCombinedPassActionsRenew__block_invoke;
  v8[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  uint64_t v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F858F8]];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __59__PKDashboardMoreMenuFactory__showCombinedPassActionsRenew__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationDashboardPassVC];
    [v3 presentCombinedActionsWithPaymentDataProvider:*(void *)(*(void *)(a1 + 32) + 16) webService:*(void *)(*(void *)(a1 + 32) + 40) balanceModel:*(void *)(*(void *)(a1 + 32) + 32) mode:1];

    id WeakRetained = v4;
  }
}

- (id)_showSelectedItemPassActions
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  id v4 = PKPassLocalizedStringWithFormat();
  int v5 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"creditcard", 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PKDashboardMoreMenuFactory__showSelectedItemPassActions__block_invoke;
  v8[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  uint64_t v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F858F8]];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __58__PKDashboardMoreMenuFactory__showSelectedItemPassActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationDashboardPassVC];
    [v3 presentActionsWithPaymentDataProvider:*(void *)(*(void *)(a1 + 32) + 16) webService:*(void *)(*(void *)(a1 + 32) + 40) actionType:2 transitBalanceModel:*(void *)(*(void *)(a1 + 32) + 32)];

    id WeakRetained = v4;
  }
}

- (id)_showPassActionGroups
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  id v4 = PKPassLocalizedStringWithFormat();
  int v5 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"creditcard", 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PKDashboardMoreMenuFactory__showPassActionGroups__block_invoke;
  v8[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  uint64_t v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85318]];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __51__PKDashboardMoreMenuFactory__showPassActionGroups__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationDashboardPassVC];
    [v3 presentActionGroupsWithPaymentDataProvider:*(void *)(*(void *)(a1 + 32) + 16) balanceModel:*(void *)(*(void *)(a1 + 32) + 32) webService:*(void *)(*(void *)(a1 + 32) + 40)];

    id WeakRetained = v4;
  }
}

- (id)_showPassInfoAction
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  id v4 = [(PKDashboardMoreMenuFactory *)self _showPassInfoLocalizedTitle];
  int v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"info.circle"];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __49__PKDashboardMoreMenuFactory__showPassInfoAction__block_invoke;
  BOOL v11 = &unk_1E59CBEE0;
  objc_copyWeak(&v12, &location);
  uint64_t v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:&v8];

  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E4F85358], v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __49__PKDashboardMoreMenuFactory__showPassInfoAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained navigationDashboardPassVC];
    [v2 presentPassDetailsAnimated:1 action:0];

    id WeakRetained = v3;
  }
}

- (id)_showCalendarAction
{
  objc_initWeak(&location, self);
  uint64_t v3 = PKIsAuthorizedForEvents();
  if (v3 == 2 || [(PKPass *)self->_pass style] != 9)
  {
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  BOOL v4 = v3 == 1;
  int v5 = PKEventStore();
  uint64_t v6 = PKExistingCalendarEventsForPass();
  uint64_t v7 = v6;
  if (v3 == 1 && v6 && [v6 count])
  {
    uint64_t v8 = PKNextCalendarEventFromEvents();
    uint64_t v9 = (void *)MEMORY[0x1E4FB13F0];
    id v10 = PKLocalizedString(&cfstr_DashboardMoreM_5.isa);
    BOOL v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar"];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __49__PKDashboardMoreMenuFactory__showCalendarAction__block_invoke;
    v29[3] = &unk_1E59CFF30;
    id v12 = &v32;
    objc_copyWeak(&v32, &location);
    BOOL v13 = v8;
    v30 = v13;
    id v31 = v5;
    uint64_t v14 = [v9 actionWithTitle:v10 image:v11 identifier:0 handler:v29];
    v15 = (id *)&v30;

    v16 = v31;
LABEL_14:

    objc_destroyWeak(v12);
    [v14 setAccessibilityIdentifier:*MEMORY[0x1E4F85330]];
    goto LABEL_16;
  }
  v17 = [(PKPass *)self->_pass relevantDates];
  uint64_t v18 = [v17 count];

  if (v18 < 1
    || ([(PKPass *)self->_pass eventName],
        (id v19 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  v20 = v19;
  uint64_t v14 = (void *)[v19 length];

  if (v14)
  {
    uint64_t v21 = @"calendar";
    if ((unint64_t)v18 > 1) {
      uint64_t v21 = @"calendar.badge.plus";
    }
    BOOL v13 = v21;
    v22 = (void *)MEMORY[0x1E4FB13F0];
    v16 = PKLocalizedString(&cfstr_DashboardMoreM_6.isa);
    uint64_t v23 = [MEMORY[0x1E4FB1818] systemImageNamed:v13];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __49__PKDashboardMoreMenuFactory__showCalendarAction__block_invoke_2;
    v25[3] = &unk_1E59D3930;
    id v12 = &v27;
    objc_copyWeak(&v27, &location);
    BOOL v28 = v4;
    id v26 = v5;
    uint64_t v14 = [v22 actionWithTitle:v16 image:v23 identifier:0 handler:v25];
    v15 = &v26;

    goto LABEL_14;
  }
LABEL_16:

LABEL_17:
  objc_destroyWeak(&location);

  return v14;
}

void __49__PKDashboardMoreMenuFactory__showCalendarAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained navigationDashboardPassVC];
    [v3 presentExistingCalendarEvent:*(void *)(a1 + 32) eventStore:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

void __49__PKDashboardMoreMenuFactory__showCalendarAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _performAddToCalendarRequestNeedingPermission:*(unsigned char *)(a1 + 48) == 0 eventStore:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_performAddToCalendarRequestNeedingPermission:(BOOL)a3 eventStore:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v8, &location);
    id v7 = v6;
    PKRequestEventsAuthorization();

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKDashboardMoreMenuFactory *)self _addEventsToCalendarWithEventStore:v6];
  }
}

void __87__PKDashboardMoreMenuFactory__performAddToCalendarRequestNeedingPermission_eventStore___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__PKDashboardMoreMenuFactory__performAddToCalendarRequestNeedingPermission_eventStore___block_invoke_2;
    v7[3] = &unk_1E59CDC58;
    char v11 = a2;
    id v8 = v5;
    id v9 = WeakRetained;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __87__PKDashboardMoreMenuFactory__performAddToCalendarRequestNeedingPermission_eventStore___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) && !*(void *)(a1 + 32)) {
    return [*(id *)(a1 + 40) _addEventsToCalendarWithEventStore:*(void *)(a1 + 48)];
  }
  else {
    return [*(id *)(a1 + 40) _presentNeedsCalendarPermissionsAlert];
  }
}

- (void)_addEventsToCalendarWithEventStore:(id)a3
{
  id v8 = a3;
  BOOL v4 = PKGenerateCalendarEventsForPass();
  uint64_t v5 = [v4 count];
  if (v5)
  {
    if (v5 == 1)
    {
      id v6 = [(PKDashboardMoreMenuFactory *)self navigationDashboardPassVC];
      id v7 = [v4 firstObject];
      [v6 presentEditCalendarEvent:v7 eventStore:v8];
    }
    else
    {
      PKCommitCalendarEvents();
    }
  }
}

- (void)_presentNeedsCalendarPermissionsAlert
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  BOOL v4 = PKLocalizedString(&cfstr_DashboardMoreM_7.isa);
  uint64_t v5 = PKLocalizedString(&cfstr_DashboardMoreM_8.isa);
  id v13 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v6 = (void *)MEMORY[0x1E4FB1410];
  id v7 = PKLocalizedString(&cfstr_DashboardMoreM_9.isa);
  id v8 = [v6 actionWithTitle:v7 style:0 handler:&__block_literal_global_90];
  [v13 addAction:v8];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  id v10 = PKLocalizedString(&cfstr_Cancel.isa);
  char v11 = [v9 actionWithTitle:v10 style:1 handler:0];
  [v13 addAction:v11];

  id v12 = [(PKDashboardMoreMenuFactory *)self navigationDashboardPassVC];
  [v12 presentViewController:v13 animated:1 completion:0];
}

void __67__PKDashboardMoreMenuFactory__presentNeedsCalendarPermissionsAlert__block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Privacy&path=CALENDARS"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (id)_showTransferAction
{
  objc_initWeak(&location, self);
  id v3 = [(PKPass *)self->_pass transferURL];
  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v5 = PKLocalizedString(&cfstr_DashboardMoreM_10.isa);
    id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.line.dotted.person"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__PKDashboardMoreMenuFactory__showTransferAction__block_invoke;
    v9[3] = &unk_1E59CE6B8;
    objc_copyWeak(&v11, &location);
    id v10 = v3;
    id v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:v9];

    [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85AF8]];
    objc_destroyWeak(&v11);
  }
  else
  {
    id v7 = 0;
  }

  objc_destroyWeak(&location);

  return v7;
}

void __49__PKDashboardMoreMenuFactory__showTransferAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v3 openURL:*(void *)(a1 + 32) withOptions:0];

    id WeakRetained = v4;
  }
}

- (id)_showSellAction
{
  objc_initWeak(&location, self);
  id v3 = [(PKPass *)self->_pass sellURL];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v5 = PKLocalizedString(&cfstr_DashboardMoreM_11.isa);
    id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"banknote"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__PKDashboardMoreMenuFactory__showSellAction__block_invoke;
    v9[3] = &unk_1E59CE6B8;
    objc_copyWeak(&v11, &location);
    id v10 = v3;
    id v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:v9];

    [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F859A0]];
    objc_destroyWeak(&v11);
  }
  else
  {
    id v7 = 0;
  }

  objc_destroyWeak(&location);

  return v7;
}

void __45__PKDashboardMoreMenuFactory__showSellAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v3 openURL:*(void *)(a1 + 32) withOptions:0];

    id WeakRetained = v4;
  }
}

- (id)_showTransitCardNumberAction
{
  if ([(PKPass *)self->_pass passType] == PKPassTypeSecureElement)
  {
    id v3 = [(PKPass *)self->_pass paymentPass];
    if ([v3 isStoredValuePass])
    {
      objc_initWeak(&location, self);
      id v4 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v5 = PKLocalizedString(&cfstr_DashboardMoreM_12.isa);
      id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"creditcard.and.123"];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      id v11 = __58__PKDashboardMoreMenuFactory__showTransitCardNumberAction__block_invoke;
      id v12 = &unk_1E59CBEE0;
      objc_copyWeak(&v13, &location);
      id v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:&v9];

      objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E4F85368], v9, v10, v11, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
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

void __58__PKDashboardMoreMenuFactory__showTransitCardNumberAction__block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained navigationDashboardPassVC];
    [v3 presentTransitCardNumber];
    uint64_t v4 = *MEMORY[0x1E4F86380];
    uint64_t v5 = *MEMORY[0x1E4F86120];
    v8[0] = *MEMORY[0x1E4F86308];
    v8[1] = v5;
    uint64_t v6 = *MEMORY[0x1E4F86168];
    v9[0] = v4;
    v9[1] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    [v3 reportEventForPassIfNecessary:v7];
  }
}

- (BOOL)_canShowPaymentCardNumberAction
{
  if ([(PKPass *)self->_pass passType] != PKPassTypeSecureElement) {
    return 0;
  }
  id v3 = [(PKDashboardMoreMenuFactory *)self pass];
  uint64_t v4 = [v3 secureElementPass];

  if ([v4 isAppleCardPass])
  {
    account = self->_account;
    uint64_t v6 = [v4 paymentPass];
    BOOL v7 = +[PKCreditAccountController shouldShowCardNumbersWithAccount:account andPass:v6];
  }
  else
  {
    BOOL v7 = [v4 passActivationState] == 0;
  }

  return v7;
}

- (id)_showPaymentCardNumberAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = PKLocalizedString(&cfstr_DashboardMoreM_13.isa);
  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"creditcard.and.123"];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __58__PKDashboardMoreMenuFactory__showPaymentCardNumberAction__block_invoke;
  uint64_t v10 = &unk_1E59CBEE0;
  objc_copyWeak(&v11, &location);
  uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v7];

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E4F85368], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __58__PKDashboardMoreMenuFactory__showPaymentCardNumberAction__block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained navigationDashboardPassVC];
    [v3 presentCardNumbers];
    uint64_t v4 = *MEMORY[0x1E4F86380];
    uint64_t v5 = *MEMORY[0x1E4F86120];
    v8[0] = *MEMORY[0x1E4F86308];
    v8[1] = v5;
    uint64_t v6 = *MEMORY[0x1E4F86168];
    v9[0] = v4;
    v9[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    [v3 reportEventForPassIfNecessary:v7];
  }
}

- (id)_removePassAction
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v4 = [(PKDashboardMoreMenuFactory *)self _removePassLocalizedTitle];
  uint64_t v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle"];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __47__PKDashboardMoreMenuFactory__removePassAction__block_invoke;
  id v11 = &unk_1E59CBEE0;
  objc_copyWeak(&v12, &location);
  uint64_t v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:&v8];

  objc_msgSend(v6, "setAttributes:", 2, v8, v9, v10, v11);
  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F858F0]];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __47__PKDashboardMoreMenuFactory__removePassAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v17 = WeakRetained;
    if ([WeakRetained moreMenuType] == 1)
    {
      v2 = [v17 pass];
      id v3 = [v17 navigationDashboardPassVC];
      uint64_t v4 = [v17 navigationDashboardPassVC];
      +[PKPassDeleteHelper presentDeleteBarcodePassAlertForPass:v2 withHandler:v3 presentingViewController:v4];
    }
    uint64_t v5 = [v17 pass];
    uint64_t v6 = [v5 paymentPass];

    int v7 = [v6 hasMerchantTokens];
    uint64_t v8 = [v17 account];
    if (v7)
    {
      uint64_t v9 = [v17 navigationDashboardPassVC];
      id v10 = objc_alloc_init(MEMORY[0x1E4F848A0]);
      id v11 = [v17 navigationDashboardPassVC];
      id v12 = [v17 navigationDashboardPassVC];
      LOBYTE(v16) = 0;
      +[PKPassDeleteHelper presentMerchantTokenDeletePaymentPassAlertForPass:v6 withAccount:v8 merchantTokensResponse:0 deleteHander:v9 passLibraryDataProvider:v10 navigationController:v11 presentingViewController:v12 isBridge:v16];
    }
    else
    {
      uint64_t v14 = v17[3];
      uint64_t v13 = v17[4];
      uint64_t v15 = v17[2];
      uint64_t v9 = [v17 navigationDashboardPassVC];
      id v10 = objc_alloc_init(MEMORY[0x1E4F848A0]);
      id v11 = [v17 navigationDashboardPassVC];
      +[PKPassDeleteHelper presentDeletePaymentPassAlertForPass:v6 withAccount:v8 paymentServiceDataProvider:v15 transitBalanceModel:v13 transitPassProperties:v14 fkInstitution:0 detailViewStyle:0 deleteHander:v9 passLibraryDataProvider:v10 presentingViewController:v11];
    }

    id WeakRetained = v17;
  }
}

- (id)_addMoneyPeerPaymentAction
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v4 = PKLocalizedString(&cfstr_DashboardMoreM_3.isa);
  uint64_t v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"dollarsign.circle"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __56__PKDashboardMoreMenuFactory__addMoneyPeerPaymentAction__block_invoke;
  v8[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  uint64_t v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F851D0]];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __56__PKDashboardMoreMenuFactory__addMoneyPeerPaymentAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationDashboardPassVC];
    [v3 presentPeerPaymentActionViewControllerForAction:1 pass:*(void *)(*(void *)(a1 + 32) + 96) passLibraryDataProvider:*(void *)(*(void *)(a1 + 32) + 48)];

    id WeakRetained = v4;
  }
}

- (id)_transferToBankAction
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  id v4 = PKLocalizedString(&cfstr_DashboardMoreM_14.isa);
  uint64_t v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrowshape.turn.up.right"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __51__PKDashboardMoreMenuFactory__transferToBankAction__block_invoke;
  v8[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  uint64_t v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85B00]];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __51__PKDashboardMoreMenuFactory__transferToBankAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationDashboardPassVC];
    [v3 presentPeerPaymentActionViewControllerForAction:2 pass:*(void *)(*(void *)(a1 + 32) + 96) passLibraryDataProvider:*(void *)(*(void *)(a1 + 32) + 48)];

    id WeakRetained = v4;
  }
}

- (id)_peerPaymentFamilyAction
{
  id v3 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
  id v4 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount altDSID];
  uint64_t v5 = [v3 objectForKey:v4];

  if ([v5 isOrganizer]) {
    char v6 = 0;
  }
  else {
    char v6 = [v5 isParent] ^ 1;
  }
  uint64_t v7 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount role];
  int v8 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsFamilySharing];
  id v9 = 0;
  if (!v7 && v8 && (v6 & 1) == 0)
  {
    id v10 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembers];
    id v11 = +[PKPeerPaymentFamilyMemberRowModel sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:v10 peerPaymentAccount:self->_peerPaymentAccount];

    if ([v11 count])
    {
      objc_initWeak(&location, self);
      id v12 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v13 = PKLocalizedPeerPaymentLexingtonString(&cfstr_MoreMenuFamily.isa);
      uint64_t v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2"];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __54__PKDashboardMoreMenuFactory__peerPaymentFamilyAction__block_invoke;
      v16[3] = &unk_1E59CE6B8;
      objc_copyWeak(&v17, &location);
      v16[4] = self;
      id v9 = [v12 actionWithTitle:v13 image:v14 identifier:0 handler:v16];

      [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F85558]];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {

      id v9 = 0;
    }
  }

  return v9;
}

void __54__PKDashboardMoreMenuFactory__peerPaymentFamilyAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [PKPeerPaymentFamilySettingsViewController alloc];
    id v3 = [*(id *)(*(void *)(a1 + 32) + 96) paymentPass];
    id v4 = [(PKPeerPaymentFamilySettingsViewController *)v2 initWithPass:v3 dataProvider:*(void *)(*(void *)(a1 + 32) + 16) peerPaymentAccount:*(void *)(*(void *)(a1 + 32) + 72) familyCollection:*(void *)(*(void *)(a1 + 32) + 120)];

    uint64_t v5 = [WeakRetained navigationDashboardPassVC];
    [v5 pushViewController:v4 animated:1];
  }
}

- (id)_recurringPeerPaymentsPaymentsAction
{
  id v3 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
  id v4 = [(PKPass *)self->_pass secureElementPass];
  uint64_t v5 = [v4 devicePrimaryPaymentApplication];
  uint64_t v6 = [v5 state];

  if (![(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsRecurringPayments])goto LABEL_5; {
  uint64_t v7 = 0;
  }
  if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount isEligibleForRecurringPaymentsForUser:v3]&& v6 != 7)
  {
    if (PKIsVision())
    {
LABEL_5:
      uint64_t v7 = 0;
      goto LABEL_6;
    }
    objc_initWeak(&location, self);
    id v9 = (void *)MEMORY[0x1E4FB13F0];
    id v10 = PKLocalizedPeerPaymentRecurringString(&cfstr_DashboardMoreM.isa);
    id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"clock.arrow.2.circlepath"];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __66__PKDashboardMoreMenuFactory__recurringPeerPaymentsPaymentsAction__block_invoke;
    uint64_t v15 = &unk_1E59CBEE0;
    objc_copyWeak(&v16, &location);
    uint64_t v7 = [v9 actionWithTitle:v10 image:v11 identifier:0 handler:&v12];

    objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E4F858D8], v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
LABEL_6:

  return v7;
}

void __66__PKDashboardMoreMenuFactory__recurringPeerPaymentsPaymentsAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained navigationDashboardPassVC];
    [v2 presentPeerPaymentRecurringPaymentsWithIdentifier:0 completion:0];

    id WeakRetained = v3;
  }
}

- (id)_savingsDetailsAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = PKLocalizedFeatureString();
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"info.circle"];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __51__PKDashboardMoreMenuFactory__savingsDetailsAction__block_invoke;
  id v10 = &unk_1E59CBEE0;
  objc_copyWeak(&v11, &location);
  uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v7];

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E4F85478], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __51__PKDashboardMoreMenuFactory__savingsDetailsAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    v2 = [WeakRetained account];
    [(PKAccountViewInterfaceConfiguration *)v1 setAccount:v2];

    [(PKAccountViewInterfaceConfiguration *)v1 setViewStyle:0];
    id v3 = [[PKSavingsAccountDetailsViewController alloc] initWithConfiguration:v1];
    id v4 = [WeakRetained navigationController];
    [v4 pushViewController:v3 animated:1];
  }
}

- (id)_showSavingsDocumentsAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = PKLocalizedFeatureString();
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.plaintext"];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __57__PKDashboardMoreMenuFactory__showSavingsDocumentsAction__block_invoke;
  id v10 = &unk_1E59CBEE0;
  objc_copyWeak(&v11, &location);
  uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v7];

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E4F85498], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __57__PKDashboardMoreMenuFactory__showSavingsDocumentsAction__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(PKAccountDocumentsViewInterfaceConfiguration);
    id v3 = [WeakRetained account];
    v7[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(PKAccountDocumentsViewInterfaceConfiguration *)v2 setAccounts:v4];

    uint64_t v5 = [[PKAccountDocumentsViewController alloc] initWithConfiguration:v2];
    uint64_t v6 = [WeakRetained navigationController];
    [v6 pushViewController:v5 animated:1];
  }
}

- (id)_showAccountManageNotifications
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = PKLocalizedString(&cfstr_DashboardMoreM_2.isa);
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"bell.badge"];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __61__PKDashboardMoreMenuFactory__showAccountManageNotifications__block_invoke;
  id v10 = &unk_1E59CBEE0;
  objc_copyWeak(&v11, &location);
  uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v7];

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E4F85728], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __61__PKDashboardMoreMenuFactory__showAccountManageNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    v2 = [WeakRetained account];
    [(PKAccountViewInterfaceConfiguration *)v1 setAccount:v2];

    [(PKAccountViewInterfaceConfiguration *)v1 setViewStyle:0];
    id v3 = [[PKAccountManageNotificationsViewController alloc] initWithConfiguration:v1];
    id v4 = [WeakRetained navigationController];
    [v4 pushViewController:v3 animated:1];
  }
}

- (id)_showSavingsDebugAction
{
  if ((PKSavingsDemoAccountEnabled() & 1) == 0
    && os_variant_has_internal_ui()
    && PKTransactionDebugDetailsEnabled())
  {
    objc_initWeak(&location, self);
    id v3 = (void *)MEMORY[0x1E4FB13F0];
    id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ant"];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __53__PKDashboardMoreMenuFactory__showSavingsDebugAction__block_invoke;
    id v10 = &unk_1E59CBEE0;
    objc_copyWeak(&v11, &location);
    uint64_t v5 = [v3 actionWithTitle:@"[INTERNAL] Diagnostics" image:v4 identifier:0 handler:&v7];

    objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E4F85450], v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __53__PKDashboardMoreMenuFactory__showSavingsDebugAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    v2 = [WeakRetained account];
    [(PKAccountViewInterfaceConfiguration *)v1 setAccount:v2];

    [(PKAccountViewInterfaceConfiguration *)v1 setViewStyle:0];
    id v3 = [[PKAccountDebugViewController alloc] initWithConfiguration:v1];
    id v4 = [WeakRetained navigationController];
    [v4 pushViewController:v3 animated:1];
  }
}

- (id)_openRewardsHubAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = PKLocalizedFeatureString();
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star"];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __51__PKDashboardMoreMenuFactory__openRewardsHubAction__block_invoke;
  id v10 = &unk_1E59CBEE0;
  objc_copyWeak(&v11, &location);
  uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v7];

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E4F85920], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __51__PKDashboardMoreMenuFactory__openRewardsHubAction__block_invoke(uint64_t a1)
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && PKRewardsCenterEnabled())
  {
    v2 = [WeakRetained navigationDashboardPassVC];
    [v2 presentRewardsHubWithCompletion:0];
    uint64_t v3 = *MEMORY[0x1E4F86380];
    uint64_t v4 = *MEMORY[0x1E4F86120];
    v7[0] = *MEMORY[0x1E4F86308];
    v7[1] = v4;
    uint64_t v5 = *MEMORY[0x1E4F86FA8];
    v8[0] = v3;
    v8[1] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
    [v2 reportEventForPassIfNecessary:v6];
  }
}

- (id)_showScheduledPaymentsAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v3 = PKLocalizedFeatureString();
  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"clock.arrow.2.circlepath"];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __58__PKDashboardMoreMenuFactory__showScheduledPaymentsAction__block_invoke;
  id v10 = &unk_1E59CBEE0;
  objc_copyWeak(&v11, &location);
  uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v7];

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E4F85968], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __58__PKDashboardMoreMenuFactory__showScheduledPaymentsAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained navigationDashboardPassVC];
    [v2 presentScheduledPayments];

    id WeakRetained = v3;
  }
}

- (id)_showInstallmentPlansAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = PKLocalizedFeatureString();
  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar.badge.clock"];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __57__PKDashboardMoreMenuFactory__showInstallmentPlansAction__block_invoke;
  id v10 = &unk_1E59CBEE0;
  objc_copyWeak(&v11, &location);
  uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v7];

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E4F85628], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __57__PKDashboardMoreMenuFactory__showInstallmentPlansAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained navigationDashboardPassVC];
    [v2 presentInstallmentPlans];

    id WeakRetained = v3;
  }
}

- (id)_addMoneyAppleBalanceAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = PKLocalizedFeatureString();
  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"dollarsign.circle"];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __57__PKDashboardMoreMenuFactory__addMoneyAppleBalanceAction__block_invoke;
  id v10 = &unk_1E59CBEE0;
  objc_copyWeak(&v11, &location);
  uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v7];

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E4F851D0], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __57__PKDashboardMoreMenuFactory__addMoneyAppleBalanceAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained navigationDashboardPassVC];
    [v2 presentAddMoneyAppleBalance];

    id WeakRetained = v3;
  }
}

- (id)_redeemAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = PKLocalizedFeatureString();
  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"giftcard"];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __43__PKDashboardMoreMenuFactory__redeemAction__block_invoke;
  id v10 = &unk_1E59CBEE0;
  objc_copyWeak(&v11, &location);
  uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:&v7];

  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E4F858E0], v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __43__PKDashboardMoreMenuFactory__redeemAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained navigationDashboardPassVC];
    [v2 presentRedeemGiftcard];

    id WeakRetained = v3;
  }
}

- (id)_showHasHomeGuestAccessScheduleAction
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = PKLocalizedHomeKitUWBString(&cfstr_PassDetailsSho.isa);
  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __67__PKDashboardMoreMenuFactory__showHasHomeGuestAccessScheduleAction__block_invoke;
  v7[3] = &unk_1E59CBEE0;
  objc_copyWeak(&v8, &location);
  uint64_t v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

void __67__PKDashboardMoreMenuFactory__showHasHomeGuestAccessScheduleAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained navigationDashboardPassVC];
    [v2 presentRestrictedGuestAccessScheduleWithHomeIdentifier:v3[16]];

    id WeakRetained = v3;
  }
}

- (void)setPass:(id)a3
{
  id v14 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pass, a3);
    [(PKDashboardMoreMenuFactory *)self _reevaluateMoreMenuType];
    if (self->_moreMenuType == 3)
    {
      uint64_t v5 = [PKIdentityReplaceFingerprintHelper alloc];
      uint64_t v6 = [v14 secureElementPass];
      uint64_t v7 = [(PKIdentityReplaceFingerprintHelper *)v5 initWithPass:v6 isRemote:0];
      fingerprintHelper = self->_fingerprintHelper;
      self->_fingerprintHelper = v7;
    }
    else
    {
      uint64_t v6 = self->_fingerprintHelper;
      self->_fingerprintHelper = 0;
    }

    [(PKDashboardMoreMenuFactory *)self _recalculateTransitPassDetails];
    if ([(PKDashboardMoreMenuFactory *)self _isPeerPaymentPass])
    {
      id v9 = [MEMORY[0x1E4F84E10] sharedService];
      id v10 = [v9 targetDevice];

      if (!self->_peerPaymentAccount)
      {
        id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v11 addObserver:self selector:sel__peerPaymentAccountChanged_ name:*MEMORY[0x1E4F87CC8] object:v10];
      }
      uint64_t v12 = [v10 account];
      peerPaymentAccount = self->_peerPaymentAccount;
      self->_peerPaymentAccount = v12;
    }
  }
}

- (void)setAccount:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_account, a3);
    [(PKDashboardMoreMenuFactory *)self _reevaluateMoreMenuType];
  }
}

- (void)_reevaluateMoreMenuType
{
  self->_moreMenuType = [(PKDashboardMoreMenuFactory *)self _moreMenuTypeValue];
}

- (int64_t)_moreMenuTypeValue
{
  pass = self->_pass;
  account = self->_account;
  if ((unint64_t)pass | (unint64_t)account)
  {
    if ([(PKAccount *)account type] == 4) {
      return 7;
    }
    uint64_t v6 = self->_pass;
    if (v6)
    {
      if ([(PKPass *)v6 passType] == PKPassTypeBarcode) {
        return 1;
      }
      uint64_t v7 = [(PKPass *)self->_pass secureElementPass];
      id v8 = v7;
      if (!v7)
      {
        int64_t v5 = 0;
        goto LABEL_31;
      }
      if ([v7 isTransitPass])
      {
        int64_t v5 = 4;
LABEL_31:

        return v5;
      }
      if ([v8 isEMoneyPass])
      {
        int64_t v5 = 6;
        goto LABEL_31;
      }
      if ([v8 isAccessPass])
      {
        int64_t v5 = 5;
        goto LABEL_31;
      }
      if ([(PKDashboardMoreMenuFactory *)self _isCreditPass])
      {
        int64_t v5 = 8;
        goto LABEL_31;
      }
      if ([(PKDashboardMoreMenuFactory *)self _isPeerPaymentPass])
      {
        int64_t v5 = 9;
        goto LABEL_31;
      }
      if ([(PKDashboardMoreMenuFactory *)self _isPayLaterPass])
      {
        int64_t v5 = 10;
        goto LABEL_31;
      }
      if ([(PKDashboardMoreMenuFactory *)self _isAppleBalancePass])
      {
        int64_t v5 = 11;
        goto LABEL_31;
      }
      id v9 = [v8 associatedAccountServiceAccountIdentifier];
      uint64_t v10 = [v9 length];

      if ([v8 cardType] == 1)
      {
        if (v10) {
          goto LABEL_26;
        }
      }
      else if ([v8 cardType] | v10)
      {
LABEL_26:
        if ([v8 isIdentityPass]) {
          int64_t v5 = 3;
        }
        else {
          int64_t v5 = 0;
        }
        goto LABEL_31;
      }
      int64_t v5 = 2;
      goto LABEL_31;
    }
  }
  return 0;
}

- (id)_showPassInfoLocalizedTitle
{
  switch([(PKDashboardMoreMenuFactory *)self moreMenuType])
  {
    case 2:
      id v3 = @"DASHBOARD_MORE_MENU_SHOW_PAYMENT_PASS_INFO";
      goto LABEL_13;
    case 3:
      id v3 = @"DASHBOARD_MORE_MENU_SHOW_IDENTITY_PASS_INFO";
      goto LABEL_13;
    case 4:
      id v3 = @"DASHBOARD_MORE_MENU_SHOW_TRANSIT_PASS_INFO";
      goto LABEL_13;
    case 5:
      uint64_t v4 = [(PKPass *)self->_pass secureElementPass];
      uint64_t v5 = [v4 accessType];

      switch(v5)
      {
        case 1:
          id v3 = @"DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_HOSPITALITY_INFO";
          break;
        case 2:
          id v3 = @"DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_CORPORATE_INFO";
          break;
        case 3:
          id v3 = @"DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_HOME_INFO";
          break;
        case 4:
          id v3 = @"DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_CAR_INFO";
          break;
        case 5:
          id v3 = @"DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_MULTI_FAMILY_HOME_INFO";
          break;
        case 6:
          id v3 = @"DASHBOARD_MORE_MENU_SHOW_ACCESS_PASS_URBAN_MOBILITY";
          break;
        default:
          id v3 = @"DASHBOARD_MORE_MENU_SHOW_GENERIC_CARD_INFO";
          break;
      }
      goto LABEL_13;
    case 6:
      id v3 = @"DASHBOARD_MORE_MENU_SHOW_EMONEY_PASS_INFO";
      goto LABEL_13;
    case 8:
      id v3 = @"DASHBOARD_MORE_MENU_SHOW_APPLE_CARD_PASS_INFO";
      goto LABEL_13;
    case 9:
      id v3 = @"DASHBOARD_MORE_MENU_SHOW_APPLE_CASH_PASS_INFO";
      goto LABEL_13;
    case 10:
      uint64_t v6 = PKLocalizedCocoonString(&cfstr_DashboardMoreM_23.isa);
      goto LABEL_14;
    case 11:
      uint64_t v6 = PKLocalizedLynxString(&cfstr_DashboardMoreM_24.isa);
      goto LABEL_14;
    default:
      id v3 = @"DASHBOARD_MORE_MENU_SHOW_GENERIC_PASS_INFO";
LABEL_13:
      uint64_t v6 = PKLocalizedString(&v3->isa);
LABEL_14:
      return v6;
  }
}

- (id)_removePassLocalizedTitle
{
  switch([(PKDashboardMoreMenuFactory *)self moreMenuType])
  {
    case 2:
      id v3 = @"DASHBOARD_MORE_MENU_REMOVE_PAYMENT_PASS";
      goto LABEL_11;
    case 3:
      id v3 = @"DASHBOARD_MORE_MENU_REMOVE_IDENTITY_PASS";
      goto LABEL_11;
    case 4:
      id v3 = @"DASHBOARD_MORE_MENU_REMOVE_TRANSIT_PASS";
      goto LABEL_11;
    case 5:
      uint64_t v4 = [(PKPass *)self->_pass secureElementPass];
      uint64_t v5 = [v4 accessType];

      switch(v5)
      {
        case 1:
          id v3 = @"DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_HOSPITALITY";
          break;
        case 2:
          id v3 = @"DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_CORPORATE";
          break;
        case 3:
          id v3 = @"DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_HOME";
          break;
        case 4:
          id v3 = @"DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_CAR";
          break;
        case 5:
          id v3 = @"DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_MULTI_FAMILY_HOME";
          break;
        case 6:
          id v3 = @"DASHBOARD_MORE_MENU_REMOVE_ACCESS_PASS_URBAN_MOBILITY";
          break;
        default:
          id v3 = @"DASHBOARD_MORE_MENU_REMOVE_GENERIC_CARD";
          break;
      }
      goto LABEL_11;
    case 6:
      id v3 = @"DASHBOARD_MORE_MENU_REMOVE_EMONEY_PASS";
      goto LABEL_11;
    case 8:
      id v3 = @"DASHBOARD_MORE_MENU_REMOVE_APPLE_CARD_PASS";
      goto LABEL_11;
    case 9:
      id v3 = @"DASHBOARD_MORE_MENU_REMOVE_APPLE_CASH_PASS";
      goto LABEL_11;
    case 11:
      uint64_t v6 = PKLocalizedLynxString(&cfstr_DashboardMoreM_39.isa);
      goto LABEL_12;
    default:
      id v3 = @"DASHBOARD_MORE_MENU_REMOVE_GENERIC_PASS";
LABEL_11:
      uint64_t v6 = PKLocalizedString(&v3->isa);
LABEL_12:
      return v6;
  }
}

- (BOOL)_canShowNotificationsInfo
{
  PKPassType v3 = [(PKPass *)self->_pass passType];
  if (v3 == PKPassTypeSecureElement)
  {
    uint64_t v6 = [(PKPass *)self->_pass paymentPass];
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    peerPaymentAccount = self->_peerPaymentAccount;
    bankConnectAccount = self->_bankConnectAccount;
    uint64_t v10 = [(PKDashboardMoreMenuFactory *)self account];
    BOOL v11 = +[PKManagePaymentPassNotificationsViewController canShowForPass:v6 dataProvider:paymentServiceDataProvider peerPaymentAccount:peerPaymentAccount bankConnectAccount:bankConnectAccount account:v10];

    return v11;
  }
  else if (v3)
  {
    return 0;
  }
  else
  {
    pass = self->_pass;
    return +[PKManageBarcodePassNotificationsViewController canShowForPass:pass];
  }
}

- (void)_recalculateTransitPassDetails
{
  PKPassType v3 = [(PKPass *)self->_pass paymentPass];
  uint64_t v4 = v3;
  if (!v3 || ([v3 isStoredValuePass] & 1) == 0)
  {
    transitPassProperties = self->_transitPassProperties;
    self->_transitPassProperties = 0;

    transitBalanceModel = self->_transitBalanceModel;
    self->_transitBalanceModel = 0;

    goto LABEL_13;
  }
  uint64_t v5 = [MEMORY[0x1E4F850D8] passPropertiesForPass:v4];
  uint64_t v6 = self->_transitPassProperties;
  self->_transitPassProperties = v5;

  uint64_t v7 = (PKTransitBalanceModel *)[objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v4];
  id v8 = self->_transitBalanceModel;
  self->_transitBalanceModel = v7;

  [(PKTransitBalanceModel *)self->_transitBalanceModel setTransitProperties:self->_transitPassProperties andApplyStoredValueBalances:1];
  id v9 = [v4 uniqueID];
  uint64_t v10 = [v4 devicePrimaryPaymentApplication];
  BOOL v11 = dispatch_group_create();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__22;
  v42[4] = __Block_byref_object_dispose__22;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__22;
  v40[4] = __Block_byref_object_dispose__22;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__22;
  v38[4] = __Block_byref_object_dispose__22;
  id v39 = 0;
  if (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(v11);
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke;
    v33[3] = &unk_1E59D17F0;
    v37 = v42;
    id v34 = v10;
    id v35 = v4;
    v36 = v11;
    [(PKPaymentDefaultDataProvider *)paymentServiceDataProvider transitStateWithPassUniqueIdentifier:v9 paymentApplication:v34 completion:v33];
  }
  uint64_t v13 = [v4 balanceFields];
  if (![v13 count]) {
    goto LABEL_8;
  }
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    dispatch_group_enter(v11);
    uint64_t v15 = self->_paymentServiceDataProvider;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_2;
    v30[3] = &unk_1E59D1818;
    id v32 = v40;
    id v31 = v11;
    [(PKPaymentDefaultDataProvider *)v15 balancesForPaymentPassWithUniqueIdentifier:v9 completion:v30];
    uint64_t v13 = v31;
LABEL_8:
  }
  if (objc_opt_respondsToSelector())
  {
    dispatch_group_enter(v11);
    id v16 = self->_paymentServiceDataProvider;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_3;
    v27[3] = &unk_1E59CC5A8;
    v29 = v38;
    BOOL v28 = v11;
    [(PKPaymentDefaultDataProvider *)v16 plansForPaymentPassWithUniqueIdentifier:v9 completion:v27];
  }
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_4;
  v20[3] = &unk_1E59D3958;
  objc_copyWeak(&v25, &location);
  id v21 = v9;
  v22 = v42;
  uint64_t v23 = v40;
  v24 = v38;
  id v17 = v9;
  dispatch_group_notify(v11, MEMORY[0x1E4F14428], v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

LABEL_13:
}

void __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 transitPassPropertiesWithPaymentApplication:a1[4] pass:a1[5]];
  uint64_t v4 = *(void *)(a1[7] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = a1[6];

  dispatch_group_leave(v6);
}

void __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__PKDashboardMoreMenuFactory__recalculateTransitPassDetails__block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    uint64_t v3 = [WeakRetained[12] paymentPass];
    id v4 = [v3 uniqueID];

    if ([v4 isEqualToString:*(void *)(a1 + 32)])
    {
      objc_storeStrong(v5 + 3, *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      [v5[4] setTransitProperties:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      [v5[4] setDynamicBalances:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v5[4] updateWithDynamicCommutePlans:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      [v5 _reloadMoreMenuItems];
    }

    id WeakRetained = v5;
  }
}

- (BOOL)_isCreditPass
{
  return [(PKDashboardMoreMenuFactory *)self _feature] == 2;
}

- (BOOL)_isPeerPaymentPass
{
  return [(PKDashboardMoreMenuFactory *)self _feature] == 1;
}

- (BOOL)_isPayLaterPass
{
  return [(PKDashboardMoreMenuFactory *)self _feature] == 3;
}

- (BOOL)_isAppleBalancePass
{
  return [(PKDashboardMoreMenuFactory *)self _feature] == 4;
}

- (unint64_t)_feature
{
  uint64_t v3 = [(PKDashboardMoreMenuFactory *)self pass];
  id v4 = [v3 paymentPass];

  unint64_t v5 = [(PKAccount *)self->_account feature];
  if (!v5)
  {
    unint64_t v5 = [v4 associatedAccountFeatureIdentifier];
    if (!v5) {
      unint64_t v5 = [v4 hasAssociatedPeerPaymentAccount];
    }
  }

  return v5;
}

- (id)_passActions
{
  v2 = [(PKDashboardMoreMenuFactory *)self pass];
  uint64_t v3 = [v2 paymentPass];

  id v4 = [v3 availableActions];

  return v4;
}

- (BOOL)_isPassActivating
{
  v2 = [(PKDashboardMoreMenuFactory *)self pass];
  uint64_t v3 = [v2 paymentPass];

  LOBYTE(v2) = [v3 activationState] == 2;
  return (char)v2;
}

- (BOOL)_isPassActivated
{
  v2 = [(PKDashboardMoreMenuFactory *)self pass];
  uint64_t v3 = [v2 paymentPass];

  LOBYTE(v2) = [v3 activationState] == 0;
  return (char)v2;
}

- (BOOL)_isPassRequiresActivation
{
  v2 = [(PKDashboardMoreMenuFactory *)self pass];
  uint64_t v3 = [v2 paymentPass];

  LOBYTE(v2) = [v3 activationState] == 1;
  return (char)v2;
}

- (BOOL)_hasValidEnteredValueActions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(PKDashboardMoreMenuFactory *)self _isPassActivated]) {
    return 0;
  }
  uint64_t v3 = [(PKDashboardMoreMenuFactory *)self _passActions];
  id v4 = objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_336);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "unavailableActionBehavior", (void)v12) & 4) != 0)
        {

          BOOL v10 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v10 = [v5 count] != 0;
LABEL_13:

  return v10;
}

BOOL __58__PKDashboardMoreMenuFactory__hasValidEnteredValueActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (BOOL)_hasCombinedActions
{
  BOOL v3 = [(PKDashboardMoreMenuFactory *)self _hasValidSelectedItemActions];
  if (v3)
  {
    LOBYTE(v3) = [(PKDashboardMoreMenuFactory *)self _hasGroupActions];
  }
  return v3;
}

- (BOOL)_hasValidSelectedItemActions
{
  if (![(PKDashboardMoreMenuFactory *)self _isPassActivated]) {
    return 0;
  }
  BOOL v3 = [(PKTransitBalanceModel *)self->_transitBalanceModel displayableCommutePlanActions];
  id v4 = objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_338);

  BOOL v5 = [v4 count] != 0;
  return v5;
}

BOOL __58__PKDashboardMoreMenuFactory__hasValidSelectedItemActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 2
    && [v2 isActionAvailable]
    && ([v2 unavailableActionBehavior] & 4) == 0;

  return v3;
}

- (BOOL)_hasGroupActions
{
  if (![(PKDashboardMoreMenuFactory *)self _isPassActivated]) {
    return 0;
  }
  BOOL v3 = [(PKDashboardMoreMenuFactory *)self pass];
  id v4 = [v3 paymentPass];

  BOOL v5 = [v4 actionGroups];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (BOOL)_hasTransitCardNumber
{
  if ([(PKDashboardMoreMenuFactory *)self _isPassActivating]) {
    return 0;
  }
  id v4 = [(PKPass *)self->_pass paymentPass];
  BOOL v5 = +[PKTransitCardNumberViewController canShowForPass:v4 expressPassController:self->_expressPassController];

  return v5;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a4;
  pass = self->_pass;
  id v8 = a3;
  id v9 = [(PKPass *)pass uniqueID];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __97__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

uint64_t __97__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v3 setTransitProperties:v2];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6 = a4;
  pass = self->_pass;
  id v8 = a3;
  id v9 = [(PKPass *)pass uniqueID];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

uint64_t __83__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) updateWithDynamicCommutePlans:*(void *)(a1 + 40)];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a4;
  pass = self->_pass;
  id v8 = a3;
  id v9 = [(PKPass *)pass uniqueID];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
    v11[3] = &unk_1E59CA870;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

uint64_t __86__PKDashboardMoreMenuFactory_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setDynamicBalances:*(void *)(a1 + 40)];
}

- (void)_reloadMoreMenuItems
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained menuFactoryDidUpdateMenu:self];
  }
}

- (void)_peerPaymentAccountChanged:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PKDashboardMoreMenuFactory__peerPaymentAccountChanged___block_invoke;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __57__PKDashboardMoreMenuFactory__peerPaymentAccountChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    int v3 = [WeakRetained _isPeerPaymentPass];
    uint64_t v2 = v8;
    if (v3)
    {
      id v4 = [MEMORY[0x1E4F84E10] sharedService];
      BOOL v5 = [v4 targetDevice];
      uint64_t v6 = [v5 account];
      uint64_t v7 = (void *)v8[9];
      v8[9] = v6;

      [v8 _reloadMoreMenuItems];
      uint64_t v2 = v8;
    }
  }
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PKDashboardMoreMenuFactory_accountChanged___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __45__PKDashboardMoreMenuFactory_accountChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    int v3 = [*(id *)(a1 + 32) accountIdentifier];
    if (v3)
    {
      id v4 = [v8[13] accountIdentifier];
      id v5 = v3;
      uint64_t v6 = v5;
      if (v4 == v5)
      {
      }
      else
      {
        if (!v4)
        {

          goto LABEL_10;
        }
        int v7 = [v4 isEqualToString:v5];

        if (!v7) {
          goto LABEL_10;
        }
      }
      objc_storeStrong(v8 + 13, *(id *)(a1 + 32));
    }
LABEL_10:

    id WeakRetained = v8;
  }
}

- (PKPass)pass
{
  return self->_pass;
}

- (PKAccount)account
{
  return self->_account;
}

- (FKAccount)bankConnectAccount
{
  return self->_bankConnectAccount;
}

- (void)setBankConnectAccount:(id)a3
{
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void)setPeerPaymentAccount:(id)a3
{
}

- (BOOL)homeKitHasHomeGuestAccessSchedule
{
  return self->_homeKitHasHomeGuestAccessSchedule;
}

- (void)setHomeKitHasHomeGuestAccessSchedule:(BOOL)a3
{
  self->_BOOL homeKitHasHomeGuestAccessSchedule = a3;
}

- (NSUUID)homeKitHomeIdentifier
{
  return self->_homeKitHomeIdentifier;
}

- (void)setHomeKitHomeIdentifier:(id)a3
{
}

- (PKNavigationDashboardPassViewController)navigationDashboardPassVC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDashboardPassVC);

  return (PKNavigationDashboardPassViewController *)WeakRetained;
}

- (void)setNavigationDashboardPassVC:(id)a3
{
}

- (PKDashboardMoreMenuFactoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDashboardMoreMenuFactoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)forceShowMoreMenuIcon
{
  return self->_forceShowMoreMenuIcon;
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  return (UINavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (int64_t)moreMenuType
{
  return self->_moreMenuType;
}

- (void)setMoreMenuType:(int64_t)a3
{
  self->_moreMenuType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_navigationDashboardPassVC);
  objc_storeStrong((id *)&self->_homeKitHomeIdentifier, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_bankConnectAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_expressPassController, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_transitPassProperties, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);

  objc_storeStrong((id *)&self->_fingerprintHelper, 0);
}

@end