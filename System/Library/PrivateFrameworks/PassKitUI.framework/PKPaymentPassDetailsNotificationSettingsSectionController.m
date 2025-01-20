@interface PKPaymentPassDetailsNotificationSettingsSectionController
+ (BOOL)_showsTransactionHistorySwitchForPass:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6;
+ (BOOL)canShowSectionforPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 bankConnectAccount:(id)a6 account:(id)a7 transactionSourceCollection:(id)a8;
+ (BOOL)validForPaymentPass:(id)a3;
+ (id)_updatedPeerPaymentAccountForPeerPaymentAccount:(id)a3 pass:(id)a4;
+ (int64_t)_countOfRowsForPass:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6;
- (BOOL)_shouldMapSection;
- (BOOL)_shouldShowBankConnectData;
- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3;
- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3;
- (PKPaymentPassDetailsNotificationSettingsSectionController)init;
- (PKPaymentPassDetailsNotificationSettingsSectionController)initWithPass:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6 paymentDataProvider:(id)a7 transactionSourceCollection:(id)a8 detailViewStyle:(int64_t)a9 delegate:(id)a10;
- (PKPaymentPassDetailsNotificationSettingsSectionControllerDelegate)delegate;
- (id)_accountServiceNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_cellForType:(int64_t)a3;
- (id)_indexPathForRowType:(int64_t)a3;
- (id)_peerPaymentNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)_transactionsSwitchCellForIndexPath:(id)a3 tableView:(id)a4;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)titleForFooterInSectionIdentifier:(id)a3;
- (id)titleForHeaderInSectionIdentifier:(id)a3;
- (int64_t)_countOfRows;
- (int64_t)notificationAuthorizationStatus;
- (unint64_t)_accountFeature;
- (void)_dailyCashSwitchChanged:(id)a3;
- (void)_notificationSwitchChanged:(id)a3;
- (void)_passSettingsChanged:(id)a3;
- (void)_transactionsSwitchChanged:(id)a3;
- (void)dealloc;
- (void)fetchAuthorizationStatusWithCompletion:(id)a3;
- (void)setTransactionsEnabled:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPaymentPassDetailsNotificationSettingsSectionController

+ (BOOL)validForPaymentPass:(id)a3
{
  return 1;
}

- (PKPaymentPassDetailsNotificationSettingsSectionController)init
{
  return 0;
}

- (PKPaymentPassDetailsNotificationSettingsSectionController)initWithPass:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6 paymentDataProvider:(id)a7 transactionSourceCollection:(id)a8 detailViewStyle:(int64_t)a9 delegate:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v28 = a5;
  id v19 = a5;
  id v32 = a6;
  id v31 = a7;
  id v30 = a8;
  id v20 = a10;
  v33.receiver = self;
  v33.super_class = (Class)PKPaymentPassDetailsNotificationSettingsSectionController;
  v21 = [(PKPaymentPassDetailSectionController *)&v33 init];
  v22 = v21;
  if (v21)
  {
    id obj = v20;
    objc_storeStrong((id *)&v21->_pass, a3);
    uint64_t v23 = [(PKPaymentPass *)v22->_pass devicePrimaryPaymentApplication];
    paymentApplication = v22->_paymentApplication;
    v22->_paymentApplication = (PKPaymentApplication *)v23;

    v25 = [(id)objc_opt_class() _updatedPeerPaymentAccountForPeerPaymentAccount:v18 pass:v17];

    if (v25) {
      objc_storeStrong((id *)&v22->_peerPaymentAccount, a4);
    }
    objc_storeStrong((id *)&v22->_paymentDataProvider, a7);
    objc_storeStrong((id *)&v22->_transactionSourceCollection, a8);
    objc_storeStrong((id *)&v22->_account, a6);
    v22->_detailViewStyle = a9;
    objc_storeWeak((id *)&v22->_delegate, obj);
    if ([(PKPaymentPassDetailsNotificationSettingsSectionController *)v22 _shouldShowBankConnectData])
    {
      objc_storeStrong((id *)&v22->_bankConnectAccount, v28);
    }
    [(PKPaymentPassDetailsNotificationSettingsSectionController *)v22 fetchAuthorizationStatusWithCompletion:0];
    PKObservePassSettingsChanged();
    v26 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v26 addObserver:v22 selector:sel__passSettingsChanged_ name:*MEMORY[0x1E4F87590] object:0];

    id v20 = obj;
  }

  return v22;
}

- (void)dealloc
{
  PKUnregisterPassSettingsChangedObserver();
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F87590] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPassDetailsNotificationSettingsSectionController;
  [(PKPaymentPassDetailsNotificationSettingsSectionController *)&v4 dealloc];
}

- (void)fetchAuthorizationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [MEMORY[0x1E4F850F8] sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__PKPaymentPassDetailsNotificationSettingsSectionController_fetchAuthorizationStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E59D6ED0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 authorizationStatusWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __100__PKPaymentPassDetailsNotificationSettingsSectionController_fetchAuthorizationStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__PKPaymentPassDetailsNotificationSettingsSectionController_fetchAuthorizationStatusWithCompletion___block_invoke_2;
    block[3] = &unk_1E59D6EA8;
    block[4] = WeakRetained;
    uint64_t v8 = a2;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void *__100__PKPaymentPassDetailsNotificationSettingsSectionController_fetchAuthorizationStatusWithCompletion___block_invoke_2(void *result)
{
  *(void *)(result[4] + 128) = result[6];
  uint64_t v1 = result[5];
  if (v1) {
    return (void *)(*(uint64_t (**)(void, void))(v1 + 16))(result[5], *(void *)(result[4] + 128));
  }
  return result;
}

- (void)setTransactionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKPaymentPassDetailsNotificationSettingsSectionController *)self _cellForType:0];
  id v4 = [v5 settingSwitch];
  [v4 setOn:v3];
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"NotificationsSectionIdentifier";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)sectionIdentifiers
{
  if ([(PKPaymentPassDetailSectionController *)self currentSegment]
    || ![(PKPaymentPassDetailsNotificationSettingsSectionController *)self _shouldMapSection])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    BOOL v3 = [(PKPaymentPassDetailsNotificationSettingsSectionController *)self allSectionIdentifiers];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (PKEqualObjects())
  {
    if (self->_peerPaymentAccount)
    {
      uint64_t v9 = [(PKPaymentPassDetailsNotificationSettingsSectionController *)self _peerPaymentNotificationsSwitchCellForIndexPath:v8 tableView:v7];
    }
    else
    {
      v11 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
      uint64_t v12 = [v11 length];

      if (v12) {
        [(PKPaymentPassDetailsNotificationSettingsSectionController *)self _accountServiceNotificationsSwitchCellForIndexPath:v8 tableView:v7];
      }
      else {
      uint64_t v9 = [(PKPaymentPassDetailsNotificationSettingsSectionController *)self _transactionsSwitchCellForIndexPath:v8 tableView:v7];
      }
    }
    v10 = (void *)v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_indexPathForRowType:(int64_t)a3
{
  peerPaymentAccount = self->_peerPaymentAccount;
  uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v5 = a3 != 0;
  if (!a3) {
    uint64_t v4 = 0;
  }
  if (a3 == 2)
  {
    BOOL v5 = 0;
    uint64_t v4 = 1;
  }
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v7 = a3 != 0;
  if (!a3) {
    uint64_t v6 = 0;
  }
  if (a3 == 1)
  {
    BOOL v7 = 0;
    uint64_t v6 = 1;
  }
  if (peerPaymentAccount) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = v5;
  }
  if (peerPaymentAccount) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v11 = [WeakRetained indexOfSectionIdentifier:@"NotificationsSectionIdentifier"];

  if (v8)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:v9 inSection:v11];
  }

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  if (PKEqualObjects())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didSelectEditNotificationSettings:self];
  }
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  if (self->_peerPaymentAccount)
  {
    BOOL v3 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_0.isa);
  }
  else
  {
    BOOL v5 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      [(PKPaymentPassDetailsNotificationSettingsSectionController *)self _accountFeature];
      PKLocalizedFeatureString();
    }
    else
    {
      PKLocalizedPaymentString(&cfstr_TransactionsHe.isa);
    BOOL v3 = };
  }

  return v3;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  if ([(id)objc_opt_class() _showsTransactionHistorySwitchForPass:self->_pass peerPaymentAccount:self->_peerPaymentAccount bankConnectAccount:self->_bankConnectAccount account:self->_account])
  {
    uint64_t v4 = [(PKPaymentPass *)self->_pass organizationName];
    BOOL v5 = PKLocalizedPaymentString(&cfstr_TransactionsSe_0.isa, &stru_1EF1B4C70.isa, v4);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (int64_t)_countOfRows
{
  BOOL v3 = objc_opt_class();
  pass = self->_pass;
  peerPaymentAccount = self->_peerPaymentAccount;
  bankConnectAccount = self->_bankConnectAccount;
  account = self->_account;

  return [v3 _countOfRowsForPass:pass peerPaymentAccount:peerPaymentAccount bankConnectAccount:bankConnectAccount account:account];
}

- (unint64_t)_accountFeature
{
  unint64_t result = [(PKAccount *)self->_account feature];
  if (!result)
  {
    pass = self->_pass;
    return [(PKPaymentPass *)pass associatedAccountFeatureIdentifier];
  }
  return result;
}

+ (BOOL)_showsTransactionHistorySwitchForPass:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6
{
  id v9 = a3;
  if ([v9 supportsFPANNotifications])
  {
    if ((unint64_t)a4 | (unint64_t)a6)
    {
      BOOL v10 = 0;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v10 = a5 == 0;
    goto LABEL_8;
  }
  char v11 = [v9 supportsDPANNotifications];
  BOOL v10 = 0;
  if (!a6 && !a4 && (v11 & 1) != 0) {
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

- (id)_peerPaymentNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a3;
  BOOL v7 = [a4 dequeueReusableCellWithIdentifier:@"NotificationsInfoCell"];
  uint64_t v8 = [v6 row];

  if (v8 == 1)
  {
    if (v7) {
      goto LABEL_11;
    }
    id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_2.isa);
    uint64_t v12 = ([(PKPaymentPass *)self->_pass settings] & 0x400) == 0;
    v13 = self;
    v14 = v9;
    v15 = sel__dailyCashSwitchChanged_;
    uint64_t v11 = 1;
    goto LABEL_10;
  }
  if (!v8 && !v7)
  {
    id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_1.isa);
    unint64_t v10 = [(PKPaymentPass *)self->_pass settings];
    if (PKStoreDemoModeEnabled()) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = PKUIOnlyDemoModeEnabled() ^ 1;
    }
    uint64_t v12 = (v10 >> 3) & 1;
    v13 = self;
    v14 = v9;
    v15 = sel__transactionsSwitchChanged_;
LABEL_10:
    BOOL v7 = [(PKPaymentPassDetailSectionController *)v13 settingsTableCellWithTitle:v14 action:v15 setOn:v12 enabled:v11];
  }
LABEL_11:

  return v7;
}

- (id)_accountServiceNotificationsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"NotificationsInfoCell"];
  uint64_t v9 = [v7 row];

  if (v9 == 1)
  {
    if (self->_notificationAuthorizationStatus == 1)
    {
      if (self->_detailViewStyle == 2) {
        v13 = @"SETTINGS_ALLOW_NOTIFICATIONS_TITLE_WATCH";
      }
      else {
        v13 = @"SETTINGS_ALLOW_NOTIFICATIONS_TITLE_PHONE";
      }
      unint64_t v10 = PKLocalizedString(&v13->isa);
      uint64_t v18 = [(PKPaymentPassDetailSectionController *)self linkCellWithText:v10 forTableView:v6];

      uint64_t v8 = (void *)v18;
      goto LABEL_16;
    }
    if (v8) {
      goto LABEL_17;
    }
    [(PKPaymentPassDetailsNotificationSettingsSectionController *)self _accountFeature];
    unint64_t v10 = PKLocalizedFeatureString();
    uint64_t v14 = ([(PKPaymentPass *)self->_pass settings] & 0x80) == 0;
    v15 = self;
    v16 = v10;
    id v17 = sel__notificationSwitchChanged_;
    uint64_t v12 = 1;
LABEL_15:
    uint64_t v8 = [(PKPaymentPassDetailSectionController *)v15 settingsTableCellWithTitle:v16 action:v17 setOn:v14 enabled:v12];
LABEL_16:

    goto LABEL_17;
  }
  if (!v9 && !v8)
  {
    [(PKPaymentPassDetailsNotificationSettingsSectionController *)self _accountFeature];
    unint64_t v10 = PKLocalizedFeatureString();
    unint64_t v11 = [(PKPaymentPass *)self->_pass settings];
    if (PKStoreDemoModeEnabled()) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = PKUIOnlyDemoModeEnabled() ^ 1;
    }
    uint64_t v14 = (v11 >> 3) & 1;
    v15 = self;
    v16 = v10;
    id v17 = sel__transactionsSwitchChanged_;
    goto LABEL_15;
  }
LABEL_17:

  return v8;
}

- (id)_transactionsSwitchCellForIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 dequeueReusableCellWithIdentifier:@"NotificationsInfoCell"];
  if ([(id)objc_opt_class() _showsTransactionHistorySwitchForPass:self->_pass peerPaymentAccount:self->_peerPaymentAccount bankConnectAccount:self->_bankConnectAccount account:self->_account])
  {
    if (![v6 row])
    {
      if (v8) {
        goto LABEL_18;
      }
      unint64_t v10 = PKLocalizedPaymentString(&cfstr_TransactionsSe_1.isa);
      unint64_t v16 = [(PKPaymentPass *)self->_pass settings];
      if (PKStoreDemoModeEnabled()) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = PKUIOnlyDemoModeEnabled() ^ 1;
      }
      uint64_t v11 = (v16 >> 3) & 1;
      uint64_t v12 = self;
      v13 = v10;
      uint64_t v14 = sel__transactionsSwitchChanged_;
      goto LABEL_16;
    }
    if ([v6 row] != 1) {
      goto LABEL_18;
    }
  }
  if (self->_notificationAuthorizationStatus == 1)
  {
    if (self->_detailViewStyle == 2) {
      uint64_t v9 = @"SETTINGS_ALLOW_NOTIFICATIONS_TITLE_WATCH";
    }
    else {
      uint64_t v9 = @"SETTINGS_ALLOW_NOTIFICATIONS_TITLE_PHONE";
    }
    unint64_t v10 = PKLocalizedString(&v9->isa);
    uint64_t v17 = [(PKPaymentPassDetailSectionController *)self linkCellWithText:v10 forTableView:v7];

    uint64_t v8 = (void *)v17;
    goto LABEL_17;
  }
  if (v8) {
    goto LABEL_18;
  }
  unint64_t v10 = PKLocalizedString(&cfstr_SettingsShowNo.isa);
  uint64_t v11 = ([(PKPaymentPass *)self->_pass settings] & 0x80) == 0;
  uint64_t v12 = self;
  v13 = v10;
  uint64_t v14 = sel__notificationSwitchChanged_;
  uint64_t v15 = 1;
LABEL_16:
  uint64_t v8 = [(PKPaymentPassDetailSectionController *)v12 settingsTableCellWithTitle:v13 action:v14 setOn:v11 enabled:v15];
LABEL_17:

LABEL_18:

  return v8;
}

- (void)_transactionsSwitchChanged:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  pass = self->_pass;
  id v5 = a3;
  uint64_t v6 = [(PKPaymentPass *)pass settings];
  uint64_t v7 = [v5 isOn];

  if (((v7 ^ ((v6 & 8) == 0)) & 1) == 0)
  {
    uint64_t v8 = 8;
    if (!v7) {
      uint64_t v8 = 0;
    }
    unint64_t v9 = v8 | v6 & 0xFFFFFFFFFFFFFFF7;
    uint64_t v10 = *MEMORY[0x1E4F85E10];
    unint64_t v16 = @"transactions";
    uint64_t v11 = [NSNumber numberWithBool:v7];
    v17[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    MEMORY[0x1A6220EC0](v10, v12);

    v13 = [(PKPaymentPassDetailsNotificationSettingsSectionController *)self _cellForType:0];
    uint64_t v14 = [v13 settingSwitch];
    [v14 setEnabled:0];

    [(PKPaymentPass *)self->_pass setSettings:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reloadSectionIdentifier:@"NotificationsSectionIdentifier"];

    [(PKPaymentPassDetailSectionController *)self reportPassDetailsAnalyticsForToggleTag:*MEMORY[0x1E4F86D60] toggleResult:v7 additionalAnalytics:0 pass:self->_pass];
  }
}

- (void)_notificationSwitchChanged:(id)a3
{
  pass = self->_pass;
  id v5 = a3;
  unint64_t v6 = [(PKPaymentPass *)pass settings];
  int v7 = [v5 isOn];

  if (v7 == ((v6 >> 7) & 1))
  {
    uint64_t v8 = 128;
    if (v7) {
      uint64_t v8 = 0;
    }
    unint64_t v9 = self->_pass;
    [(PKPaymentPass *)v9 setSettings:v8 | v6 & 0xFFFFFFFFFFFFFF7FLL];
  }
}

- (void)_dailyCashSwitchChanged:(id)a3
{
  pass = self->_pass;
  id v5 = a3;
  unint64_t v6 = [(PKPaymentPass *)pass settings];
  int v7 = [v5 isOn];

  if (v7 == ((v6 >> 10) & 1))
  {
    uint64_t v8 = 1024;
    if (v7) {
      uint64_t v8 = 0;
    }
    unint64_t v9 = self->_pass;
    [(PKPaymentPass *)v9 setSettings:v8 | v6 & 0xFFFFFFFFFFFFFBFFLL];
  }
}

+ (BOOL)canShowSectionforPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 bankConnectAccount:(id)a6 account:(id)a7 transactionSourceCollection:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [a1 _updatedPeerPaymentAccountForPeerPaymentAccount:a5 pass:v14];
  if ([v14 activationState]) {
    char v20 = [v14 isShellPass] ^ 1;
  }
  else {
    char v20 = 0;
  }
  uint64_t v21 = [a1 _countOfRowsForPass:v14 peerPaymentAccount:v19 bankConnectAccount:v16 account:v17];
  char v22 = 0;
  if (v21 >= 1 && (v20 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v15 supportsTransactionsForPass:v14])
    {
      if (v19
        || ([v14 supportsDPANNotifications] & 1) != 0
        || ([v14 supportsFPANNotifications] & 1) != 0)
      {
        char v22 = 1;
      }
      else
      {
        v24 = [v14 devicePrimaryPaymentApplication];
        if (([v24 generatesLocalTransactions] & 1) != 0
          || v17
          && +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", v18, v17)|| ([v14 isAppleCardPass] & 1) != 0|| (objc_msgSend(v14, "isPeerPaymentPass") & 1) != 0)
        {
          char v22 = 1;
        }
        else
        {
          char v22 = [v14 isAppleBalancePass];
        }
      }
    }
    else
    {
      char v22 = 0;
    }
  }

  return v22;
}

+ (id)_updatedPeerPaymentAccountForPeerPaymentAccount:(id)a3 pass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 associatedPassUniqueID];
  uint64_t v8 = [v6 uniqueID];

  LODWORD(v6) = [v7 isEqualToString:v8];
  if (v6) {
    id v9 = v5;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

+ (int64_t)_countOfRowsForPass:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  v13 = [a1 _updatedPeerPaymentAccountForPeerPaymentAccount:a4 pass:v10];
  LOBYTE(a4) = [(id)objc_opt_class() _showsTransactionHistorySwitchForPass:v10 peerPaymentAccount:v13 bankConnectAccount:v12 account:v11];

  if (a4)
  {
    if (([v10 settings] & 8) != 0) {
      int64_t v14 = 2;
    }
    else {
      int64_t v14 = 1;
    }
  }
  else if (v13)
  {
    if ([v13 role]) {
      int64_t v14 = 1;
    }
    else {
      int64_t v14 = 2;
    }
  }
  else
  {
    int64_t v14 = 1;
  }

  return v14;
}

- (BOOL)_shouldShowBankConnectData
{
  int v3 = PKBankConnectEnabled();
  if (v3) {
    LOBYTE(v3) = self->_detailViewStyle < 2uLL;
  }
  return v3;
}

- (BOOL)_shouldMapSection
{
  int v3 = objc_opt_class();
  pass = self->_pass;
  paymentDataProvider = self->_paymentDataProvider;
  peerPaymentAccount = self->_peerPaymentAccount;
  bankConnectAccount = self->_bankConnectAccount;
  account = self->_account;
  transactionSourceCollection = self->_transactionSourceCollection;

  return [v3 canShowSectionforPass:pass dataProvider:paymentDataProvider peerPaymentAccount:peerPaymentAccount bankConnectAccount:bankConnectAccount account:account transactionSourceCollection:transactionSourceCollection];
}

- (id)_cellForType:(int64_t)a3
{
  uint64_t v4 = [(PKPaymentPassDetailsNotificationSettingsSectionController *)self _indexPathForRowType:a3];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [WeakRetained cellForRowAtIndexPath:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_passSettingsChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentPassDetailsNotificationSettingsSectionController *)self _cellForType:0];
  id v6 = [(PKPaymentPassDetailsNotificationSettingsSectionController *)self _cellForType:2];
  int v7 = [v4 userInfo];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F875C0]];
  id v9 = [(PKPaymentPass *)self->_pass uniqueID];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = [v4 userInfo];
    id v12 = [v11 objectForKey:*MEMORY[0x1E4F875B8]];

    if (v12)
    {
      uint64_t v13 = [v12 unsignedIntegerValue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __82__PKPaymentPassDetailsNotificationSettingsSectionController__passSettingsChanged___block_invoke;
      v14[3] = &unk_1E59CEF78;
      v14[4] = self;
      uint64_t v17 = v13;
      id v15 = v5;
      id v16 = v6;
      dispatch_async(MEMORY[0x1E4F14428], v14);
    }
  }
}

void __82__PKPaymentPassDetailsNotificationSettingsSectionController__passSettingsChanged___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) setSettingsWithoutUpdatingDataAccessor:*(void *)(a1 + 56)];
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    char v3 = [v2 isOn] ^ ((*(unsigned char *)(a1 + 56) & 8) == 0);
    v2 = *(void **)(a1 + 40);
  }
  else
  {
    char v3 = 1;
  }
  id v6 = [v2 settingSwitch];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 setOn:(*(void *)(a1 + 56) >> 3) & 1];
  }
  id v4 = [*(id *)(a1 + 48) settingSwitch];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 setOn:(*(void *)(a1 + 56) & 0x80) == 0];
  }
  if ((v3 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 136));
    [WeakRetained reloadSectionIdentifier:@"NotificationsSectionIdentifier"];
  }
}

- (int64_t)notificationAuthorizationStatus
{
  return self->_notificationAuthorizationStatus;
}

- (PKPaymentPassDetailsNotificationSettingsSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentPassDetailsNotificationSettingsSectionControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bankConnectAccount, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end