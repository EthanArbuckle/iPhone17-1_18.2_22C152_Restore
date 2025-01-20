@interface PKAccountUserDetailViewController
- (BOOL)_hasPhysicalCardAction;
- (BOOL)_shouldShowRewardsBalance;
- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUser:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9;
- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUser:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9 hideUserDetailHeader:(BOOL)a10;
- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUserInvitation:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9;
- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUserInvitation:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9 hideUserDetailHeader:(BOOL)a10;
- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 familyMemberCollection:(id)a6 avatarManager:(id)a7 contactResolver:(id)a8 hideUserDetailHeader:(BOOL)a9;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_currentConfigurationForAccountUser;
- (id)_currentConfigurationForAccountUserInvitation;
- (id)_footerForTransactionLimitSection;
- (id)_footerViewForPeerPaymentAccountSetup;
- (id)presentationSceneIdentifierForPhysicalCardActionController:(id)a3;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_appendActionsSectionToConfiguration:(id)a3;
- (void)_appendNotificationsSectionToConfiguration:(id)a3;
- (void)_appendPhysicalCardSectionToConfiguration:(id)a3;
- (void)_appendRewardsBalanceToConfiguration:(id)a3;
- (void)_appendShowAvailableCreditToConfiguration:(id)a3;
- (void)_appendSpendNotificationsSectionToConfiguration:(id)a3;
- (void)_appendTransactionLimitToConfiguration:(id)a3;
- (void)_loadPeerPaymentAccount;
- (void)_presentAccountUserInvitation;
- (void)_presentCancelInvitationAlert;
- (void)_presentDisplayableError:(id)a3;
- (void)_presentPasswordAuthorizationWithReason:(id)a3 completion:(id)a4;
- (void)_presentPeerPaymentFamilySharingSetupForFamilyMember:(id)a3;
- (void)_presentStopSharingAlert;
- (void)_setPerformingAction:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateConfigurationAnimated:(BOOL)a3;
- (void)_updateContactInfoAndHeaderViewAnimated:(BOOL)a3;
- (void)_updateMonthlySpendLimit:(id)a3;
- (void)_updateMonthlySpendNotificationThreshold:(id)a3;
- (void)_updateNotificationSettings:(id)a3;
- (void)_updatePreferences:(id)a3;
- (void)_updateShowAvailableCredit:(BOOL)a3;
- (void)_updateSpendingEnabled:(BOOL)a3;
- (void)_updateTransactionLimit:(id)a3;
- (void)_updateTransactionNotificationThreshold:(id)a3;
- (void)_updateTransactionNotificationsEnabled:(BOOL)a3;
- (void)accountChanged:(id)a3;
- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)dealloc;
- (void)featureApplicationChanged:(id)a3;
- (void)featureApplicationRemoved:(id)a3;
- (void)physicalCardActionController:(id)a3 didChangeToState:(int64_t)a4 withError:(id)a5;
- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAccountUserDetailViewController

- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUser:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9 hideUserDetailHeader:(BOOL)a10
{
  id v16 = a5;
  id v17 = a6;
  LOBYTE(v26) = a10;
  v18 = [(PKAccountUserDetailViewController *)self initWithPaymentPass:a3 style:a4 account:v16 familyMemberCollection:a7 avatarManager:a8 contactResolver:a9 hideUserDetailHeader:v26];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountUser, a6);
    v20 = [MEMORY[0x1E4F84D50] sharedService];
    uint64_t v21 = [v20 _appleAccountInformation];
    appleAccountInformation = v19->_appleAccountInformation;
    v19->_appleAccountInformation = (PKAppleAccountInformation *)v21;

    accountService = v19->_accountService;
    v24 = [v16 accountIdentifier];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __157__PKAccountUserDetailViewController_initWithPaymentPass_style_account_accountUser_familyMemberCollection_avatarManager_contactResolver_hideUserDetailHeader___block_invoke;
    v27[3] = &unk_1E59CE000;
    v28 = v19;
    [(PKAccountService *)accountService physicalCardsForAccountWithIdentifier:v24 completion:v27];
  }
  return v19;
}

void __157__PKAccountUserDetailViewController_initWithPaymentPass_style_account_accountUser_familyMemberCollection_avatarManager_contactResolver_hideUserDetailHeader___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __157__PKAccountUserDetailViewController_initWithPaymentPass_style_account_accountUser_familyMemberCollection_avatarManager_contactResolver_hideUserDetailHeader___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __157__PKAccountUserDetailViewController_initWithPaymentPass_style_account_accountUser_familyMemberCollection_avatarManager_contactResolver_hideUserDetailHeader___block_invoke_2(uint64_t a1)
{
  v2 = [[PKPhysicalCardController alloc] initWithAccountService:*(void *)(*(void *)(a1 + 32) + 1136) paymentPass:*(void *)(*(void *)(a1 + 32) + 1040) account:*(void *)(*(void *)(a1 + 32) + 1056) accountUser:*(void *)(*(void *)(a1 + 32) + 1064) physicalCards:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1152);
  *(void *)(v3 + 1152) = v2;

  v5 = -[PKPhysicalCardActionController initWithAccountService:account:accountUser:delegate:]([PKPhysicalCardActionController alloc], "initWithAccountService:account:accountUser:delegate:", *(void *)(*(void *)(a1 + 32) + 1136), *(void *)(*(void *)(a1 + 32) + 1056), *(void *)(*(void *)(a1 + 32) + 1064));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1160);
  *(void *)(v6 + 1160) = v5;

  v8 = *(void **)(a1 + 32);

  return [v8 _updateConfigurationAnimated:1];
}

- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUser:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9
{
  LOBYTE(v10) = 0;
  return [(PKAccountUserDetailViewController *)self initWithPaymentPass:a3 style:a4 account:a5 accountUser:a6 familyMemberCollection:a7 avatarManager:a8 contactResolver:a9 hideUserDetailHeader:v10];
}

- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUserInvitation:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9 hideUserDetailHeader:(BOOL)a10
{
  id v17 = a6;
  LOBYTE(v21) = a10;
  v18 = [(PKAccountUserDetailViewController *)self initWithPaymentPass:a3 style:a4 account:a5 familyMemberCollection:a7 avatarManager:a8 contactResolver:a9 hideUserDetailHeader:v21];
  v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_accountUserInvitation, a6);
  }

  return v19;
}

- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 accountUserInvitation:(id)a6 familyMemberCollection:(id)a7 avatarManager:(id)a8 contactResolver:(id)a9
{
  LOBYTE(v10) = 0;
  return [(PKAccountUserDetailViewController *)self initWithPaymentPass:a3 style:a4 account:a5 accountUserInvitation:a6 familyMemberCollection:a7 avatarManager:a8 contactResolver:a9 hideUserDetailHeader:v10];
}

- (PKAccountUserDetailViewController)initWithPaymentPass:(id)a3 style:(int64_t)a4 account:(id)a5 familyMemberCollection:(id)a6 avatarManager:(id)a7 contactResolver:(id)a8 hideUserDetailHeader:(BOOL)a9
{
  id v16 = a3;
  id v17 = a5;
  id v29 = a6;
  id v28 = a7;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)PKAccountUserDetailViewController;
  v19 = -[PKAccountUserDetailViewController initWithStyle:](&v30, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1));
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_paymentPass, a3);
    v20->_style = a4;
    objc_storeStrong((id *)&v20->_account, a5);
    objc_storeStrong((id *)&v20->_familyMemberCollection, a6);
    objc_storeStrong((id *)&v20->_avatarManager, a7);
    objc_storeStrong((id *)&v20->_contactResolver, a8);
    v20->_hideUserDetailHeader = a9;
    uint64_t v21 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v20->_accountService;
    v20->_accountService = (PKAccountService *)v21;

    [(PKAccountService *)v20->_accountService registerObserver:v20];
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v20];
    paymentService = v20->_paymentService;
    v20->_paymentService = (PKPaymentService *)v23;

    v25 = [(PKAccountUserDetailViewController *)v20 navigationItem];
    objc_msgSend(v25, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v25, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    if (v20->_hideUserDetailHeader)
    {
      uint64_t v26 = PKLocalizedMadisonString(&cfstr_SharingSetting.isa);
      [v25 setTitle:v26];
    }
  }

  return v20;
}

- (void)dealloc
{
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKAccountUserDetailViewController;
  [(PKAccountUserDetailViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PKAccountUserDetailViewController;
  [(PKSettingsTableViewController *)&v7 viewDidLoad];
  objc_super v3 = [(PKAccountUserDetailViewController *)self tableView];
  if (!self->_hideUserDetailHeader)
  {
    id v4 = [PKAccountUserDetailHeaderView alloc];
    v5 = -[PKAccountUserDetailHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    headerView = self->_headerView;
    self->_headerView = v5;

    [v3 setTableHeaderView:self->_headerView];
  }
  [(PKAccountUserDetailViewController *)self _loadPeerPaymentAccount];
  [(PKAccountUserDetailViewController *)self _updateContactInfoAndHeaderViewAnimated:0];
  [(PKAccountUserDetailViewController *)self _updateConfigurationAnimated:0];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F851A0]];
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKAccountUserDetailViewController;
  [(PKAccountUserDetailViewController *)&v12 viewWillLayoutSubviews];
  if (!self->_hideUserDetailHeader)
  {
    headerView = self->_headerView;
    id v4 = [(PKAccountUserDetailViewController *)self view];
    [v4 bounds];
    -[PKAccountUserDetailHeaderView sizeThatFits:](headerView, "sizeThatFits:", CGRectGetWidth(v13), 1.79769313e308);
    double v6 = v5;
    double v8 = v7;

    if (self->_previousHeaderHeight != v8)
    {
      self->_previousHeaderHeight = v8;
      -[PKAccountUserDetailHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v6, v8);
      v9 = [(PKAccountUserDetailViewController *)self tableView];
      [v9 _tableHeaderHeightDidChangeToHeight:v8];
    }
  }
  uint64_t v10 = [(PKAccountUserDetailViewController *)self tableView];
  v11 = [(PKAccountUserDetailViewController *)self navigationItem];
  objc_msgSend(v10, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v11);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  double v6 = [v5 dataSource];
  uint64_t v7 = [v6 tableView:v5 titleForHeaderInSection:a4];

  if (a4 | v7) {
    double v8 = *MEMORY[0x1E4FB2F28];
  }
  else {
    double v8 = 20.0;
  }

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  double v6 = [v5 dataSource];
  uint64_t v7 = [v6 tableView:v5 titleForHeaderInSection:a4];

  id v8 = 0;
  if (!a4 && !v7) {
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  }

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 dataSource];
  id v8 = [v7 tableView:v6 titleForFooterInSection:a4];

  if (v8
    || [(PKSettingsTableViewController *)self indexOfSectionWithIdentifier:@"rewardsBalance"] != a4)
  {
    v9 = 0;
  }
  else
  {
    v9 = [(PKAccountUserDetailViewController *)self _footerViewForPeerPaymentAccountSetup];
  }

  return v9;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)featureApplicationChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PKAccountUserDetailViewController_featureApplicationChanged___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __63__PKAccountUserDetailViewController_featureApplicationChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) applicationIdentifier];
  objc_super v3 = [*(id *)(*(void *)(a1 + 40) + 1088) applicationIdentifier];
  id v11 = v2;
  id v4 = v3;
  if (v11 == v4)
  {
  }
  else
  {
    if (v11) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {

LABEL_13:

      return;
    }
    char v6 = [v11 isEqualToString:v4];

    if ((v6 & 1) == 0) {
      return;
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 1088) applicationState];
  char IsTerminal = PKFeatureApplicationStateIsTerminal();
  [*(id *)(a1 + 32) applicationState];
  int v8 = PKFeatureApplicationStateIsTerminal();
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 1088), *(id *)(a1 + 32));
  v9 = *(void **)(a1 + 40);
  if ((IsTerminal & 1) == 0 && v8)
  {
    id v11 = [v9 navigationController];
    id v10 = (id)[v11 popViewControllerAnimated:1];
    goto LABEL_13;
  }

  [v9 _updateConfigurationAnimated:1];
}

- (void)featureApplicationRemoved:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PKAccountUserDetailViewController_featureApplicationRemoved___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __63__PKAccountUserDetailViewController_featureApplicationRemoved___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) applicationIdentifier];
  objc_super v3 = [*(id *)(*(void *)(a1 + 40) + 1088) applicationIdentifier];
  id v8 = v2;
  id v4 = v3;
  if (v8 == v4)
  {

LABEL_10:
    id v8 = [*(id *)(a1 + 40) navigationController];
    id v7 = (id)[v8 popViewControllerAnimated:1];
    goto LABEL_11;
  }
  if (v8) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    char v6 = [v8 isEqualToString:v4];

    if ((v6 & 1) == 0) {
      return;
    }
    goto LABEL_10;
  }

LABEL_11:
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PKAccountUserDetailViewController_accountChanged___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __52__PKAccountUserDetailViewController_accountChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accountIdentifier];
  objc_super v3 = [*(id *)(*(void *)(a1 + 40) + 1056) accountIdentifier];
  id v8 = v2;
  id v4 = v3;
  if (v8 == v4)
  {

LABEL_12:
    if (([*(id *)(*(void *)(a1 + 40) + 1056) isContentEqualToAccount:*(void *)(a1 + 32)] & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 1056), *(id *)(a1 + 32));
      [*(id *)(*(void *)(a1 + 40) + 1152) updateWithAccount:*(void *)(*(void *)(a1 + 40) + 1056)];
      id v7 = *(void **)(a1 + 40);
      [v7 _updateConfigurationAnimated:1];
    }
    return;
  }
  if (v8) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    char v6 = [v8 isEqualToString:v4];

    if ((v6 & 1) == 0) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKAccountUserDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  objc_super v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__PKAccountUserDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  objc_super v3 = [*(id *)(a1[5] + 1056) accountIdentifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_12:
    [*(id *)(a1[5] + 1152) updateWithPhysicalCards:a1[6]];
    id v8 = (void *)a1[5];
    [v8 _updateConfigurationAnimated:1];
    return;
  }
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  id v9 = v5;
  if (!v6)
  {
    int v7 = [v4 isEqualToString:v5];

    if (!v7) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKAccountUserDetailViewController_accountUsersChanged_forAccountIdentifier___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  objc_super v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__PKAccountUserDetailViewController_accountUsersChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [*(id *)(*(void *)(a1 + 40) + 1056) accountIdentifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {
  }
  else
  {
    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    id v24 = v5;
    if (v6)
    {

      return;
    }
    int v7 = [v4 isEqualToString:v5];

    if (!v7) {
      return;
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(v8 + 1064);
  if (v9 && !*(unsigned char *)(v8 + 1184))
  {
    id v10 = [v9 altDSID];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
LABEL_16:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
        id v17 = [v16 altDSID];
        id v18 = v10;
        v19 = v18;
        if (v17 == v18) {
          break;
        }
        if (v10 && v17)
        {
          char v20 = [v17 isEqualToString:v18];

          if (v20) {
            goto LABEL_29;
          }
        }
        else
        {
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v13) {
            goto LABEL_16;
          }
          goto LABEL_27;
        }
      }

LABEL_29:
      id v21 = v16;

      if (!v21) {
        goto LABEL_32;
      }
      if ((PKEqualObjects() & 1) == 0)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 40) + 1064), v16);
        [*(id *)(a1 + 40) _updateConfigurationAnimated:1];
      }
    }
    else
    {
LABEL_27:

LABEL_32:
      v22 = [*(id *)(a1 + 40) navigationController];
      id v23 = (id)[v22 popViewControllerAnimated:1];

      id v21 = 0;
    }
  }
}

- (void)physicalCardActionController:(id)a3 didChangeToState:(int64_t)a4 withError:(id)a5
{
  id v7 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKAccountUserDetailViewController_physicalCardActionController_didChangeToState_withError___block_invoke;
  block[3] = &unk_1E59CC648;
  id v10 = v7;
  int64_t v11 = a4;
  void block[4] = self;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __93__PKAccountUserDetailViewController_physicalCardActionController_didChangeToState_withError___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  switch(*(void *)(result + 48))
  {
    case 0:
    case 2:
      v2 = *(void **)(result + 32);
      uint64_t v3 = 0;
      goto LABEL_4;
    case 1:
      v2 = *(void **)(result + 32);
      uint64_t v3 = 1;
LABEL_4:
      result = [v2 _setPerformingAction:v3 animated:1];
      break;
    case 3:
      result = [*(id *)(result + 32) _setPerformingAction:0 animated:1];
      if (*(void *)(v1 + 40))
      {
        id v4 = *(void **)(v1 + 32);
        result = objc_msgSend(v4, "_presentDisplayableError:");
      }
      break;
    default:
      return result;
  }
  return result;
}

- (id)presentationSceneIdentifierForPhysicalCardActionController:(id)a3
{
  uint64_t v3 = [(PKAccountUserDetailViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  BOOL v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)_updateContactInfoAndHeaderViewAnimated:(BOOL)a3
{
  id v4 = [(PKFeatureApplication *)self->_accountUserInvitation invitationDetails];
  id v5 = [(PKAccountUser *)self->_accountUser altDSID];
  if (!v5)
  {
    id v5 = [v4 accountUserAltDSID];
    if (!v5) {
      goto LABEL_18;
    }
  }
  BOOL v6 = [(PKContactAvatarManager *)self->_avatarManager cachedAvatarForAltDSID:v5];
  id v7 = [(PKFamilyMemberCollection *)self->_familyMemberCollection familyMemberForAltDSID:v5];
  if (!v6)
  {
    objc_initWeak(&location, self);
    avatarManager = self->_avatarManager;
    accountUser = self->_accountUser;
    accountUserInvitation = self->_accountUserInvitation;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke;
    v23[3] = &unk_1E59D0588;
    objc_copyWeak(&v25, &location);
    id v24 = v7;
    [(PKContactAvatarManager *)avatarManager avatarForFamilyMember:v24 accountUser:accountUser invitation:accountUserInvitation completion:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  int64_t v11 = self->_accountUser;
  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F845E8];
    uint64_t v13 = [(PKAccountUser *)v11 nameComponents];
LABEL_9:
    uint64_t v14 = (void *)v13;
    if (v6)
    {
      uint64_t v15 = UIImagePNGRepresentation(v6);
    }
    else
    {
      uint64_t v15 = 0;
    }
    id v16 = [v12 contactForFamilyMember:v7 nameComponents:v14 imageData:v15];
    contact = self->_contact;
    self->_contact = v16;

    if (v6) {
    goto LABEL_15;
    }
  }
  if (v4)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F845E8];
    uint64_t v13 = [v4 accountUserNameComponents];
    goto LABEL_9;
  }
LABEL_15:
  if (!self->_hideUserDetailHeader)
  {
    [(PKAccountUserDetailHeaderView *)self->_headerView setContactForDisplay:self->_contact];
    if (!self->_hideUserDetailHeader)
    {
      if (self->_accountUser)
      {
        int v18 = -[PKContactResolver hasCachedResultForAccountUser:](self->_contactResolver, "hasCachedResultForAccountUser:");
        contactResolver = self->_contactResolver;
        char v20 = self->_accountUser;
        if (v18)
        {
          id v21 = [(PKContactResolver *)contactResolver contactForAccountUser:v20];
          [(PKAccountUserDetailHeaderView *)self->_headerView setContactForActions:v21];
        }
        else
        {
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_3;
          v22[3] = &unk_1E59D25A8;
          v22[4] = self;
          [(PKContactResolver *)contactResolver contactForAccountUser:v20 withCompletion:v22];
        }
      }
    }
  }

LABEL_18:
}

void __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)MEMORY[0x1E4F845E8];
    uint64_t v5 = *(void *)(a1 + 32);
    int64_t v11 = WeakRetained;
    id v6 = [WeakRetained[133] nameComponents];
    id v7 = *(UIImage **)(a1 + 40);
    if (v7)
    {
      id v8 = UIImagePNGRepresentation(v7);
    }
    else
    {
      id v8 = 0;
    }
    uint64_t v9 = [v4 contactForFamilyMember:v5 nameComponents:v6 imageData:v8];
    id v10 = v11[147];
    v11[147] = (id)v9;

    if (v7) {
    id v3 = v11;
    }
    if (!*((unsigned char *)v11 + 1216))
    {
      [v11[150] setContactForDisplay:v11[147]];
      id v3 = v11;
    }
  }
}

void __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_4;
  v5[3] = &unk_1E59CA870;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __77__PKAccountUserDetailViewController__updateContactInfoAndHeaderViewAnimated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1200) setContactForActions:*(void *)(a1 + 40)];
}

- (void)_updateConfigurationAnimated:(BOOL)a3
{
  BOOL v15 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_accountUser)
  {
    uint64_t v4 = [(PKAccountUserDetailViewController *)self _currentConfigurationForAccountUser];
LABEL_5:
    uint64_t v5 = (void *)v4;
    goto LABEL_6;
  }
  if (self->_accountUserInvitation)
  {
    uint64_t v4 = [(PKAccountUserDetailViewController *)self _currentConfigurationForAccountUserInvitation];
    goto LABEL_5;
  }
  uint64_t v5 = 0;
LABEL_6:
  [v5 sections];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [v5 rowsForSection:*(void *)(*((void *)&v21 + 1) + 8 * v9)];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v17 + 1) + 8 * v14++) setEnabled:!self->_performingAction];
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
  if (v5) {
    [(PKSettingsTableViewController *)self applyConfiguration:v5 animated:v15];
  }
}

- (id)_currentConfigurationForAccountUserInvitation
{
  id v3 = objc_alloc_init(PKSettingsTableViewConfiguration);
  uint64_t v4 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"actions"];
  uint64_t v5 = [(CNContact *)self->_contact givenName];
  uint64_t v6 = [(PKFeatureApplication *)self->_accountUserInvitation applicationState];
  if (v6 == 8)
  {
    uint64_t v12 = [(PKFeatureApplication *)self->_accountUserInvitation applicationStateReason];
    if (v12 == 11)
    {
      uint64_t v7 = PKLocalizedMadisonString(&cfstr_AccountUserPen_3.isa);
      PKLocalizedMadisonString(&cfstr_AccountUserPen_4.isa, &stru_1EF1B4C70.isa, v5);
    }
    else
    {
      if (v12 != 10)
      {
LABEL_10:
        uint64_t v7 = 0;
        uint64_t v11 = 0;
        uint64_t v8 = 0;
        goto LABEL_20;
      }
      uint64_t v7 = PKLocalizedMadisonString(&cfstr_AccountUserPen_1.isa);
      PKLocalizedMadisonString(&cfstr_AccountUserPen_2.isa, &stru_1EF1B4C70.isa, v5);
    uint64_t v15 = };
LABEL_16:
    uint64_t v8 = (void *)v15;
    uint64_t v11 = 0;
    if (v7) {
      goto LABEL_17;
    }
LABEL_20:
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    goto LABEL_21;
  }
  if (v6 == 6)
  {
    uint64_t v7 = PKLocalizedMadisonString(&cfstr_AccountUserOff_0.isa);
    uint64_t v8 = PKLocalizedMadisonString(&cfstr_AccountUserJoi_0.isa);
    uint64_t v13 = [PKButtonTableViewSettingsRow alloc];
    uint64_t v14 = PKLocalizedMadisonString(&cfstr_AccountUserJoi_1.isa);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82__PKAccountUserDetailViewController__currentConfigurationForAccountUserInvitation__block_invoke_2;
    v21[3] = &unk_1E59D2CC8;
    v21[4] = self;
    uint64_t v11 = [(PKButtonTableViewSettingsRow *)v13 initWithIdentifier:@"invitationOfferReady" title:v14 tapHandler:v21];

    if (!v7) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  if (v6 != 5) {
    goto LABEL_10;
  }
  if ([(PKFeatureApplication *)self->_accountUserInvitation applicationStateReason] != 9)
  {
    uint64_t v7 = PKLocalizedMadisonString(&cfstr_AccountUserPen.isa);
    uint64_t v15 = PKLocalizedMadisonString(&cfstr_AccountUserPen_0.isa);
    goto LABEL_16;
  }
  uint64_t v7 = PKLocalizedMadisonString(&cfstr_AccountUserInv.isa);
  uint64_t v8 = PKLocalizedMadisonString(&cfstr_AccountUserInv_1.isa, &stru_1EF1B4C70.isa, v5);
  uint64_t v9 = [PKButtonTableViewSettingsRow alloc];
  id v10 = PKLocalizedMadisonString(&cfstr_CancelInvitati_2.isa);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__PKAccountUserDetailViewController__currentConfigurationForAccountUserInvitation__block_invoke;
  v22[3] = &unk_1E59D2CC8;
  v22[4] = self;
  uint64_t v11 = [(PKButtonTableViewSettingsRow *)v9 initWithIdentifier:@"invitationCancel" title:v10 tapHandler:v22];

  [(PKButtonTableViewSettingsRow *)v11 setStyle:1];
  if (!v7) {
    goto LABEL_20;
  }
LABEL_17:
  if (!v8) {
    goto LABEL_20;
  }
  id v16 = [[PKTitleSubtitleTableViewSettingsRow alloc] initWithIdentifier:@"stateExplanation" title:v7 subtitle:v8];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v18 = v17;
  if (v16)
  {
    [v17 addObject:v16];
  }
LABEL_21:
  if (v11) {
    [v18 addObject:v11];
  }
  if ([v18 count])
  {
    long long v19 = (void *)[v18 copy];
    [(PKSettingsTableViewConfiguration *)v3 appendSection:v4 rows:v19];
  }

  return v3;
}

uint64_t __82__PKAccountUserDetailViewController__currentConfigurationForAccountUserInvitation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentCancelInvitationAlert];
}

uint64_t __82__PKAccountUserDetailViewController__currentConfigurationForAccountUserInvitation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentAccountUserInvitation];
}

- (id)_currentConfigurationForAccountUser
{
  id v3 = objc_alloc_init(PKSettingsTableViewConfiguration);
  uint64_t v4 = [(PKAccount *)self->_account accessLevel];
  uint64_t v5 = [(PKAccountUser *)self->_accountUser accessLevel];
  if (v4 == 1)
  {
    uint64_t v6 = v5;
    if (v5 == 2)
    {
      [(PKAccountUserDetailViewController *)self _appendTransactionLimitToConfiguration:v3];
      if ([(PKAccountUserDetailViewController *)self _shouldShowRewardsBalance]) {
        [(PKAccountUserDetailViewController *)self _appendRewardsBalanceToConfiguration:v3];
      }
      if (([(PKAccountUser *)self->_accountUser supportsMonthlySpendLimit] & 1) == 0) {
        [(PKAccountUserDetailViewController *)self _appendShowAvailableCreditToConfiguration:v3];
      }
    }
    [(PKAccountUserDetailViewController *)self _appendNotificationsSectionToConfiguration:v3];
    uint64_t v7 = [(PKAccountUser *)self->_accountUser notificationSettings];
    int v8 = [v7 transactionNotificationsEnabled];

    if (v8) {
      [(PKAccountUserDetailViewController *)self _appendSpendNotificationsSectionToConfiguration:v3];
    }
    if (v6 == 2)
    {
      if ([(PKAccountUserDetailViewController *)self _hasPhysicalCardAction]) {
        [(PKAccountUserDetailViewController *)self _appendPhysicalCardSectionToConfiguration:v3];
      }
      [(PKAccountUserDetailViewController *)self _appendActionsSectionToConfiguration:v3];
    }
  }

  return v3;
}

- (BOOL)_hasPhysicalCardAction
{
  physicalCardController = self->_physicalCardController;
  if (!physicalCardController) {
    return 0;
  }
  BOOL v4 = [(PKPhysicalCardController *)physicalCardController hasPrimaryPhysicalCard];
  uint64_t v5 = [(PKPhysicalCardController *)self->_physicalCardController primaryPhysicalCard];
  BOOL v6 = ([v5 state] & 0xFFFFFFFFFFFFFFFELL) == 2;
  BOOL v8 = v4 && v5 != 0 && v6;
  BOOL v9 = [(PKPhysicalCardController *)self->_physicalCardController canRequestNewPhysicalCard]
    || [(PKPhysicalCardController *)self->_physicalCardController canReplacePhysicalCard]
    || v8
    || [(PKPhysicalCardController *)self->_physicalCardController canActivatePhysicalCard];

  return v9;
}

- (BOOL)_shouldShowRewardsBalance
{
  if (!self->_peerPaymentAccount) {
    goto LABEL_12;
  }
  accountUser = self->_accountUser;
  if (!accountUser || !self->_familyMemberCollection) {
    goto LABEL_12;
  }
  uint64_t v4 = [(PKAccountUser *)accountUser accessLevel];
  uint64_t v5 = [(PKFamilyMemberCollection *)self->_familyMemberCollection currentUser];
  int v6 = [v5 isOrganizer];

  int v7 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsFamilySharing];
  BOOL v8 = v4 != 2 || v6 == 0;
  if (!v8 && v7 != 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F84898] sharedInstance];
    uint64_t v13 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
    uint64_t v14 = [v12 passWithUniqueID:v13];
    uint64_t v15 = [v14 paymentPass];

    if (v15)
    {
      id v16 = [(PKAccountUser *)self->_accountUser altDSID];
      id v17 = [(PKFamilyMemberCollection *)self->_familyMemberCollection familyMemberForAltDSID:v16];
      if ((unint64_t)([v17 memberType] - 3) >= 0xFFFFFFFFFFFFFFFELL)
      {
        uint64_t v18 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount peerPaymentAccountWithAltDSID:v16];
        uint64_t v19 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount accountInvitationWithAltDSID:v16];
        if (v18 | v19)
        {
          LOBYTE(v10) = 0;
        }
        else
        {
          long long v20 = [(PKAccount *)self->_account creditDetails];
          long long v21 = [v20 accountSummary];
          long long v22 = [v21 accountUserActivityForAccountUserAltDSID:v16];
          long long v23 = [v22 rewardsBalance];

          if (v23)
          {
            long long v24 = [MEMORY[0x1E4F28C28] zero];
            int v10 = [v23 isEqualToNumber:v24] ^ 1;
          }
          else
          {
            LOBYTE(v10) = 0;
          }
        }
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
LABEL_12:
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (void)_loadPeerPaymentAccount
{
  if (!self->_peerPaymentAccount)
  {
    id v3 = [MEMORY[0x1E4F84E00] sharedInstance];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__PKAccountUserDetailViewController__loadPeerPaymentAccount__block_invoke;
    v4[3] = &unk_1E59CE240;
    v4[4] = self;
    [v3 accountWithCompletion:v4];
  }
}

void __60__PKAccountUserDetailViewController__loadPeerPaymentAccount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PKAccountUserDetailViewController__loadPeerPaymentAccount__block_invoke_2;
  v5[3] = &unk_1E59CA870;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

id *__60__PKAccountUserDetailViewController__loadPeerPaymentAccount__block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  result = (id *)(*(void *)(a1 + 32) + 1120);
  if (*result != v2)
  {
    objc_storeStrong(result, v2);
    id v4 = *(void **)(a1 + 32);
    return (id *)[v4 _updateConfigurationAnimated:1];
  }
  return result;
}

- (void)_appendTransactionLimitToConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"transactionLimit"];
  id v6 = [(PKAccountUserDetailViewController *)self _footerForTransactionLimitSection];
  id v29 = v5;
  [(PKTableViewDiffableDataSourceSection *)v5 setFooter:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v8 = [(PKAccount *)self->_account creditDetails];
  uint64_t v9 = [v8 currencyCode];

  if ([(PKAccountUser *)self->_accountUser supportsMonthlySpendLimit])
  {
    uint64_t v10 = v9;
    uint64_t v11 = [[PKCurrencyAmountSelectorOptionProvider alloc] initWithType:0 accountUser:self->_accountUser currencyCode:v9];
    uint64_t v12 = PKLocalizedMadisonString(&cfstr_MonthlySpendLi.isa);
    objc_initWeak(location, self);
    uint64_t v13 = [PKSelectionTableViewSettingsRow alloc];
    uint64_t v14 = [(PKCurrencyAmountSelectorOptionProvider *)v11 selectedOption];
    uint64_t v15 = [v14 displayValue];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke;
    v35[3] = &unk_1E59DC168;
    id v16 = v12;
    id v36 = v16;
    id v17 = v11;
    v37 = v17;
    v38 = self;
    objc_copyWeak(&v39, location);
    uint64_t v18 = [(PKSelectionTableViewSettingsRow *)v13 initWithIdentifier:@"monthlySpendLimit" title:v16 value:v15 tapHandler:v35];

    [v7 addObject:v18];
    objc_destroyWeak(&v39);

    objc_destroyWeak(location);
    uint64_t v9 = v10;
  }
  uint64_t v19 = (void *)v9;
  long long v20 = [[PKCurrencyAmountSelectorOptionProvider alloc] initWithType:0 accountUser:self->_accountUser currencyCode:v9];
  long long v21 = PKLocalizedMadisonString(&cfstr_TransactionLim.isa);
  objc_initWeak(location, self);
  long long v22 = [PKSelectionTableViewSettingsRow alloc];
  long long v23 = [(PKCurrencyAmountSelectorOptionProvider *)v20 selectedOption];
  long long v24 = [v23 displayValue];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_3;
  v30[3] = &unk_1E59DC168;
  id v25 = v21;
  id v31 = v25;
  long long v26 = v20;
  v32 = v26;
  v33 = self;
  objc_copyWeak(&v34, location);
  uint64_t v27 = [(PKSelectionTableViewSettingsRow *)v22 initWithIdentifier:@"transactionLimitSwitch" title:v25 value:v24 tapHandler:v30];

  [v7 addObject:v27];
  long long v28 = (void *)[v7 copy];
  [v4 appendSection:v29 rows:v28];

  objc_destroyWeak(&v34);
  objc_destroyWeak(location);
}

void __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PKSpendNotificationLimitViewController alloc] initWithTitle:*(void *)(a1 + 32) footerText:0 provider:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 48) + 1056) creditDetails];
  id v6 = [v5 accountSummary];
  id v7 = [v6 creditLimit];
  uint64_t v8 = [v7 integerValue];

  [(PKSpendNotificationLimitViewController *)v4 setMaximumInput:v8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_2;
  v10[3] = &unk_1E59DC140;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  [(PKSpendNotificationLimitViewController *)v4 setChangeHandler:v10];
  uint64_t v9 = [*(id *)(a1 + 48) navigationController];
  [v9 pushViewController:v4 animated:1];

  objc_destroyWeak(&v11);
}

void __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v6 currencyAmount];
    uint64_t v5 = [v4 amount];

    [WeakRetained _updateMonthlySpendLimit:v5];
  }
}

void __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PKSpendNotificationLimitViewController alloc] initWithTitle:*(void *)(a1 + 32) footerText:0 provider:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 48) + 1056) creditDetails];
  id v6 = [v5 accountSummary];
  id v7 = [v6 creditLimit];
  uint64_t v8 = [v7 integerValue];

  [(PKSpendNotificationLimitViewController *)v4 setMaximumInput:v8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_4;
  v10[3] = &unk_1E59DC140;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  [(PKSpendNotificationLimitViewController *)v4 setChangeHandler:v10];
  uint64_t v9 = [*(id *)(a1 + 48) navigationController];
  [v9 pushViewController:v4 animated:1];

  objc_destroyWeak(&v11);
}

void __76__PKAccountUserDetailViewController__appendTransactionLimitToConfiguration___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v6 currencyAmount];
    uint64_t v5 = [v4 amount];

    [WeakRetained _updateTransactionLimit:v5];
  }
}

- (id)_footerForTransactionLimitSection
{
  id v3 = [(PKAccountUser *)self->_accountUser preferences];
  id v4 = [(PKAccount *)self->_account creditDetails];
  uint64_t v5 = [v4 currencyCode];

  id v6 = [v3 transactionSpendLimitAmount];
  int v7 = [v3 transactionSpendLimitEnabled];
  if (v6) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (v7) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  id v11 = [v3 monthlySpendLimitAmount];
  int v12 = [(PKAccountUser *)self->_accountUser supportsMonthlySpendLimit];
  int v13 = [v3 monthlySpendLimitEnabled];
  if (v11) {
    BOOL v14 = v5 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  int v15 = !v14;
  if (v13) {
    BOOL v16 = v12 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16) {
    int v17 = 0;
  }
  else {
    int v17 = v15;
  }
  uint64_t v18 = [(CNContact *)self->_contact givenName];
  uint64_t v19 = (void *)v18;
  if ((v17 & v10) == 1)
  {
    long long v20 = PKCurrencyAmountMake();
    long long v21 = PKCurrencyAmountMake();
    long long v22 = [v20 formattedStringValue];
    long long v23 = [v21 formattedStringValue];
    long long v24 = PKLocalizedMadisonString(&cfstr_TransactionLim_1.isa, &cfstr_123.isa, v19, v22, v23);
  }
  else
  {
    if (v17)
    {
      long long v20 = PKCurrencyAmountMake();
      long long v21 = [v20 formattedStringValue];
      PKLocalizedMadisonString(&cfstr_TransactionLim_2.isa, &cfstr_12.isa, v19, v21);
    }
    else
    {
      if (!v10)
      {
        if (v12) {
          PKLocalizedMadisonString(&cfstr_TransactionLim_5.isa, &stru_1EF1B4C70.isa, v18);
        }
        else {
        long long v24 = PKLocalizedMadisonString(&cfstr_TransactionLim_6.isa, &stru_1EF1B4C70.isa, v18);
        }
        goto LABEL_33;
      }
      long long v20 = PKCurrencyAmountMake();
      long long v21 = [v20 formattedStringValue];
      if (v12) {
        id v25 = @"TRANSACTION_LIMIT_FOOTER_TRANSACTION_LIMIT_VIEW_BALANCE";
      }
      else {
        id v25 = @"TRANSACTION_LIMIT_FOOTER_TRANSACTION_LIMIT";
      }
      PKLocalizedMadisonString(&v25->isa, &cfstr_12.isa, v19, v21);
    long long v24 = };
  }

LABEL_33:

  return v24;
}

- (void)_appendRewardsBalanceToConfiguration:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"rewardsBalance"];
  id v6 = PKLocalizedMadisonString(&cfstr_AccountUserAss.isa);
  int v7 = [(PKAccount *)self->_account creditDetails];
  BOOL v8 = [v7 currencyCode];
  int v9 = [v7 accountSummary];
  int v10 = [(PKAccountUser *)self->_accountUser altDSID];
  id v11 = [v9 accountUserActivityForAccountUserAltDSID:v10];
  int v12 = [v11 rewardsBalance];

  if (v12) {
    BOOL v13 = v8 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    int v15 = 0;
  }
  else
  {
    BOOL v14 = PKCurrencyAmountMake();
    int v15 = [v14 formattedStringValue];
  }
  BOOL v16 = [[PKKeyValueTableViewSettingsRow alloc] initWithIdentifier:@"rewardsBalance" title:v6 value:v15];
  v18[0] = v16;
  int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v4 appendSection:v5 rows:v17];
}

- (void)_appendShowAvailableCreditToConfiguration:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CNContact *)self->_contact givenName];
  id v6 = PKLocalizedMadisonString(&cfstr_ShowAvailableC.isa, &stru_1EF1B4C70.isa, v5);

  int v7 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"showAvailableCredit"];
  [(PKTableViewDiffableDataSourceSection *)v7 setFooter:v6];
  BOOL v8 = [(PKAccountUser *)self->_accountUser preferences];
  uint64_t v9 = [v8 showAvailableCredit];

  pendingAccountUserPreferences = self->_pendingAccountUserPreferences;
  if (pendingAccountUserPreferences) {
    uint64_t v9 = [(PKMutableAccountUserPreferences *)pendingAccountUserPreferences showAvailableCredit];
  }
  objc_initWeak(&location, self);
  id v11 = [PKSwitchTableViewSettingsRow alloc];
  int v12 = PKLocalizedMadisonString(&cfstr_ShowAvailableC_0.isa);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__PKAccountUserDetailViewController__appendShowAvailableCreditToConfiguration___block_invoke;
  v15[3] = &unk_1E59DC190;
  objc_copyWeak(&v16, &location);
  BOOL v13 = [(PKSwitchTableViewSettingsRow *)v11 initWithIdentifier:@"showAvailableCreditSwitch" title:v12 value:v9 changeHandler:v15];

  v18[0] = v13;
  BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v4 appendSection:v7 rows:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __79__PKAccountUserDetailViewController__appendShowAvailableCreditToConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_updateShowAvailableCredit:", objc_msgSend(v4, "BOOLValue"));
  }
}

- (void)_appendNotificationsSectionToConfiguration:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CNContact *)self->_contact givenName];
  id v6 = PKLocalizedMadisonString(&cfstr_NotificationsF.isa, &stru_1EF1B4C70.isa, v5);

  int v7 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"notifications"];
  [(PKTableViewDiffableDataSourceSection *)v7 setFooter:v6];
  BOOL v8 = [(PKAccountUser *)self->_accountUser notificationSettings];
  pendingAccountUserNotificationSettings = self->_pendingAccountUserNotificationSettings;
  if (pendingAccountUserNotificationSettings)
  {
    int v10 = pendingAccountUserNotificationSettings;

    BOOL v8 = v10;
  }
  objc_initWeak(&location, self);
  id v11 = [PKSwitchTableViewSettingsRow alloc];
  int v12 = PKLocalizedMadisonString(&cfstr_Notifications_0.isa);
  uint64_t v13 = [v8 transactionNotificationsEnabled];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__PKAccountUserDetailViewController__appendNotificationsSectionToConfiguration___block_invoke;
  v16[3] = &unk_1E59DC190;
  objc_copyWeak(&v17, &location);
  BOOL v14 = [(PKSwitchTableViewSettingsRow *)v11 initWithIdentifier:@"notificationsSwitch" title:v12 value:v13 changeHandler:v16];

  v19[0] = v14;
  int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v4 appendSection:v7 rows:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __80__PKAccountUserDetailViewController__appendNotificationsSectionToConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "_updateTransactionNotificationsEnabled:", objc_msgSend(v4, "BOOLValue"));
  }
}

- (void)_appendSpendNotificationsSectionToConfiguration:(id)a3
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  uint64_t v27 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"spendNotifications"];
  id v4 = PKLocalizedMadisonString(&cfstr_AccountUserSpe_6.isa);
  [(PKTableViewDiffableDataSourceSection *)v27 setTitle:v4];

  uint64_t v5 = [(PKAccount *)self->_account creditDetails];
  long long v28 = [v5 currencyCode];

  objc_initWeak(&location, self);
  id v6 = [[PKCurrencyAmountSelectorOptionProvider alloc] initWithType:2 accountUser:self->_accountUser currencyCode:v28];
  int v7 = PKLocalizedMadisonString(&cfstr_AccountUserSpe_7.isa);
  BOOL v8 = [PKSelectionTableViewSettingsRow alloc];
  uint64_t v9 = [(PKCurrencyAmountSelectorOptionProvider *)v6 selectedOption];
  int v10 = [v9 displayValue];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke;
  v35[3] = &unk_1E59DC168;
  id v26 = v7;
  id v36 = v26;
  long long v24 = v6;
  v37 = v24;
  v38 = self;
  objc_copyWeak(&v39, &location);
  id v11 = [(PKSelectionTableViewSettingsRow *)v8 initWithIdentifier:@"transactionThreshold" title:v26 value:v10 tapHandler:v35];

  int v12 = [[PKCurrencyAmountSelectorOptionProvider alloc] initWithType:1 accountUser:self->_accountUser currencyCode:v28];
  uint64_t v13 = PKLocalizedMadisonString(&cfstr_AccountUserSpe_8.isa);
  BOOL v14 = [(CNContact *)self->_contact givenName];
  int v15 = PKLocalizedMadisonString(&cfstr_AccountUserSpe_9.isa, &stru_1EF1B4C70.isa, v14);

  id v16 = [PKSelectionTableViewSettingsRow alloc];
  id v17 = [(PKCurrencyAmountSelectorOptionProvider *)v12 selectedOption];
  uint64_t v18 = [v17 displayValue];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_3;
  v29[3] = &unk_1E59DC1B8;
  id v19 = v13;
  id v30 = v19;
  id v20 = v15;
  id v31 = v20;
  long long v21 = v12;
  v32 = v21;
  v33 = self;
  objc_copyWeak(&v34, &location);
  long long v22 = [(PKSelectionTableViewSettingsRow *)v16 initWithIdentifier:@"monthlySpendThreshold" title:v19 value:v18 tapHandler:v29];

  v41[0] = v11;
  v41[1] = v22;
  long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  [v25 appendSection:v27 rows:v23];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&location);
}

void __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PKSpendNotificationLimitViewController alloc] initWithTitle:*(void *)(a1 + 32) footerText:0 provider:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 48) + 1056) creditDetails];
  id v6 = [v5 accountSummary];
  int v7 = [v6 creditLimit];
  uint64_t v8 = [v7 integerValue];

  [(PKSpendNotificationLimitViewController *)v4 setMaximumInput:v8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_2;
  v10[3] = &unk_1E59DC140;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  [(PKSpendNotificationLimitViewController *)v4 setChangeHandler:v10];
  uint64_t v9 = [*(id *)(a1 + 48) navigationController];
  [v9 pushViewController:v4 animated:1];

  objc_destroyWeak(&v11);
}

void __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v6 currencyAmount];
    uint64_t v5 = [v4 amount];

    [WeakRetained _updateTransactionNotificationThreshold:v5];
  }
}

void __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PKSpendNotificationLimitViewController alloc] initWithTitle:*(void *)(a1 + 32) footerText:*(void *)(a1 + 40) provider:*(void *)(a1 + 48)];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 56) + 1056) creditDetails];
  id v6 = [v5 accountSummary];
  int v7 = [v6 creditLimit];
  uint64_t v8 = [v7 integerValue];

  [(PKSpendNotificationLimitViewController *)v4 setMaximumInput:v8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_4;
  v10[3] = &unk_1E59DC140;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  [(PKSpendNotificationLimitViewController *)v4 setChangeHandler:v10];
  uint64_t v9 = [*(id *)(a1 + 56) navigationController];
  [v9 pushViewController:v4 animated:1];

  objc_destroyWeak(&v11);
}

void __85__PKAccountUserDetailViewController__appendSpendNotificationsSectionToConfiguration___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v6 currencyAmount];
    uint64_t v5 = [v4 amount];

    [WeakRetained _updateMonthlySpendNotificationThreshold:v5];
  }
}

- (void)_appendPhysicalCardSectionToConfiguration:(id)a3
{
  id v4 = a3;
  [(PKAccount *)self->_account feature];
  BOOL v5 = [(PKPhysicalCardController *)self->_physicalCardController canRequestNewPhysicalCard];
  BOOL v6 = [(PKPhysicalCardController *)self->_physicalCardController canReplacePhysicalCard];
  BOOL v7 = [(PKPhysicalCardController *)self->_physicalCardController hasPrimaryPhysicalCard];
  BOOL v8 = [(PKPhysicalCardController *)self->_physicalCardController canActivatePhysicalCard];
  BOOL v36 = v5;
  if (v5)
  {
    uint64_t v9 = [(CNContact *)self->_contact givenName];
    uint64_t v10 = PKLocalizedMadisonString(&cfstr_AccountUserPhy.isa, &stru_1EF1B4C70.isa, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"physicalCard"];
  int v12 = PKLocalizedFeatureString();
  [(PKTableViewDiffableDataSourceSection *)v11 setTitle:v12];

  v35 = (void *)v10;
  [(PKTableViewDiffableDataSourceSection *)v11 setFooter:v10];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v37 = [(PKPhysicalCardController *)self->_physicalCardController primaryPhysicalCard];
  objc_initWeak(location, self);
  if (v7 && ([v37 state] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v34 = v4;
    BOOL v14 = PKLocalizedFeatureString();
    int v15 = [PKButtonTableViewSettingsRow alloc];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke;
    v46[3] = &unk_1E59DC1E0;
    objc_copyWeak(&v49, location);
    id v47 = v37;
    v48 = self;
    id v16 = [(PKButtonTableViewSettingsRow *)v15 initWithIdentifier:@"lockUnlockPhysicalCard" title:v14 tapHandler:v46];
    [v13 addObject:v16];

    objc_destroyWeak(&v49);
    id v4 = v34;
  }
  if (v8)
  {
    id v17 = [PKButtonTableViewSettingsRow alloc];
    uint64_t v18 = PKLocalizedFeatureString();
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_4;
    v44[3] = &unk_1E59D2CF0;
    objc_copyWeak(&v45, location);
    id v19 = [(PKButtonTableViewSettingsRow *)v17 initWithIdentifier:@"activatePhysicalCard" title:v18 tapHandler:v44];

    [v13 addObject:v19];
    objc_destroyWeak(&v45);
  }
  if (v6)
  {
    id v20 = [PKButtonTableViewSettingsRow alloc];
    long long v21 = PKLocalizedFeatureString();
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_5;
    v42[3] = &unk_1E59D2CF0;
    objc_copyWeak(&v43, location);
    long long v22 = [(PKButtonTableViewSettingsRow *)v20 initWithIdentifier:@"replacePhysicalCard" title:v21 tapHandler:v42];

    [v13 addObject:v22];
    objc_destroyWeak(&v43);
  }
  long long v23 = [(PKPhysicalCardController *)self->_physicalCardController unactivatedPhysicalCard];
  long long v24 = v23;
  if (v23)
  {
    id v25 = [v23 latestShippingActivity];
    id v26 = [v25 shipmentTrackingURL];
    if (v26)
    {
    }
    else
    {
      id v26 = [v24 shipmentTrackingURL];

      if (!v26) {
        goto LABEL_16;
      }
    }
    uint64_t v27 = [PKButtonTableViewSettingsRow alloc];
    long long v28 = PKLocalizedFeatureString();
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_6;
    v40[3] = &unk_1E59D2CC8;
    id v29 = v26;
    id v41 = v29;
    id v30 = [(PKButtonTableViewSettingsRow *)v27 initWithIdentifier:@"trackPhysicalCard" title:v28 tapHandler:v40];

    [v13 addObject:v30];
  }
LABEL_16:
  if (v36)
  {
    id v31 = [PKButtonTableViewSettingsRow alloc];
    v32 = PKLocalizedMadisonString(&cfstr_AccountUserPhy_0.isa);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_7;
    v38[3] = &unk_1E59D2CF0;
    objc_copyWeak(&v39, location);
    v33 = [(PKButtonTableViewSettingsRow *)v31 initWithIdentifier:@"requestPhysicalCard" title:v32 tapHandler:v38];

    [v13 addObject:v33];
    objc_destroyWeak(&v39);
  }
  [v4 appendSection:v11 rows:v13];

  objc_destroyWeak(location);
}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = [WeakRetained[144] primaryPhysicalCardEnabled];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_2;
    aBlock[3] = &unk_1E59CD7B0;
    char v13 = v4;
    aBlock[4] = v3;
    id v12 = *(id *)(a1 + 32);
    BOOL v5 = _Block_copy(aBlock);
    BOOL v6 = v5;
    if (v4)
    {
      (*((void (**)(void *))v5 + 2))(v5);
    }
    else
    {
      [*(id *)(*(void *)(a1 + 40) + 1056) feature];
      BOOL v8 = [*(id *)(*(void *)(a1 + 40) + 1128) appleID];
      BOOL v7 = PKLocalizedFeatureString();

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_3;
      v9[3] = &unk_1E59CF340;
      v9[4] = v3;
      id v10 = v6;
      objc_msgSend(v3, "_presentPasswordAuthorizationWithReason:completion:", v7, v9, v8);
    }
  }
}

uint64_t __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_2(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 1160);
  if (v1) {
    return [v3 disablePhysicalCard:v2];
  }
  else {
    return [v3 enablePhysicalCard:v2];
  }
}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v7 = v5;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v7 = v5;
    id v6 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
  }
  id v5 = v7;
LABEL_6:
}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v1 = [PKPhysicalCardManualActivationViewController alloc];
    uint64_t v2 = *((void *)WeakRetained + 142);
    uint64_t v3 = *((void *)WeakRetained + 132);
    uint64_t v4 = *((void *)WeakRetained + 133);
    uint64_t v5 = *((void *)WeakRetained + 130);
    id v6 = [*((id *)WeakRetained + 144) unactivatedPhysicalCard];
    id v7 = [(PKPhysicalCardManualActivationViewController *)v1 initWithAccountService:v2 account:v3 accountUser:v4 paymentPass:v5 physicalCard:v6 activationCode:0];

    BOOL v8 = [[PKNavigationController alloc] initWithRootViewController:v7];
    [WeakRetained presentViewController:v8 animated:1 completion:0];
  }
}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v1 = [PKReplacePhysicalCardReasonViewController alloc];
    uint64_t v2 = WeakRetained[131];
    uint64_t v3 = 3;
    if (v2 != 1) {
      uint64_t v3 = 0;
    }
    if (v2 == 2) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = v3;
    }
    uint64_t v5 = [(PKReplacePhysicalCardReasonViewController *)v1 initWithPhysicalCardController:WeakRetained[144] context:v4];
    id v6 = [[PKNavigationController alloc] initWithRootViewController:v5];
    [WeakRetained presentViewController:v6 animated:1 completion:0];
  }
}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_6(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openURL:*(void *)(a1 + 32) configuration:0 completionHandler:0];
}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setPerformingAction:1 animated:1];
    uint64_t v3 = (void *)v2[144];
    uint64_t v4 = v2[131];
    uint64_t v5 = 3;
    if (v4 != 1) {
      uint64_t v5 = 0;
    }
    if (v4 == 2) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = v5;
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_8;
    v7[3] = &unk_1E59D9FE0;
    v7[4] = v2;
    [v3 orderFlowViewControllerForReason:0 content:v6 completion:v7];
  }
}

void __79__PKAccountUserDetailViewController__appendPhysicalCardSectionToConfiguration___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _setPerformingAction:0 animated:1];
  if (v7)
  {
    uint64_t v6 = [[PKNavigationController alloc] initWithRootViewController:v7];
    [(PKNavigationController *)v6 setModalPresentationStyle:2];
    [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
  }
  else if (v5)
  {
    [*(id *)(a1 + 32) _presentDisplayableError:v5];
  }
}

- (void)_appendActionsSectionToConfiguration:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"actions"];
  uint64_t v6 = [(PKAccountUser *)self->_accountUser preferences];
  int v7 = [v6 spendingEnabled];

  BOOL v8 = @"UNLOCK_USER_BUTTON";
  if (v7) {
    BOOL v8 = @"LOCK_USER_BUTTON";
  }
  uint64_t v9 = v8;
  objc_initWeak(&location, self);
  id v10 = [PKButtonTableViewSettingsRow alloc];
  id v11 = PKLocalizedMadisonString(v9);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke;
  v19[3] = &unk_1E59DC208;
  objc_copyWeak(&v20, &location);
  char v21 = v7;
  id v12 = [(PKButtonTableViewSettingsRow *)v10 initWithIdentifier:@"lockUnlockAccountUser" title:v11 tapHandler:v19];

  char v13 = [PKButtonTableViewSettingsRow alloc];
  BOOL v14 = PKLocalizedMadisonString(&cfstr_StopSharing.isa);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_4;
  v17[3] = &unk_1E59D2CF0;
  objc_copyWeak(&v18, &location);
  int v15 = [(PKButtonTableViewSettingsRow *)v13 initWithIdentifier:@"stopSharingAccountUser" title:v14 tapHandler:v17];

  [(PKButtonTableViewSettingsRow *)v15 setStyle:1];
  v23[0] = v12;
  v23[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [v4 appendSection:v5 rows:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_2;
    aBlock[3] = &unk_1E59CDA78;
    aBlock[4] = WeakRetained;
    char v12 = *(unsigned char *)(a1 + 40);
    id v4 = _Block_copy(aBlock);
    id v5 = v4;
    if (*(unsigned char *)(a1 + 40))
    {
      (*((void (**)(void *))v4 + 2))(v4);
    }
    else
    {
      uint64_t v6 = [v3[147] givenName];
      if (*(unsigned char *)(a1 + 40)) {
        int v7 = @"LOCK_ACCOUNT_USER_PASSWORD_PROMPT_REASON";
      }
      else {
        int v7 = @"UNLOCK_ACCOUNT_USER_PASSWORD_PROMPT_REASON";
      }
      BOOL v8 = PKLocalizedMadisonString(&v7->isa, &stru_1EF1B4C70.isa, v6);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_3;
      v9[3] = &unk_1E59CF340;
      v9[4] = v3;
      id v10 = v5;
      [v3 _presentPasswordAuthorizationWithReason:v8 completion:v9];
    }
  }
}

uint64_t __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSpendingEnabled:*(unsigned char *)(a1 + 40) == 0];
}

void __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v7 = v5;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v7 = v5;
    id v6 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
  }
  id v5 = v7;
LABEL_6:
}

void __74__PKAccountUserDetailViewController__appendActionsSectionToConfiguration___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentStopSharingAlert];
    id WeakRetained = v2;
  }
}

- (void)_presentCancelInvitationAlert
{
  uint64_t v3 = [(CNContact *)self->_contact givenName];
  id v4 = PKLocalizedMadisonString(&cfstr_CancelInvitati_3.isa, &stru_1EF1B4C70.isa, v3);
  id v5 = PKLocalizedMadisonString(&cfstr_CancelInvitati_4.isa, &stru_1EF1B4C70.isa, v3);
  id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v5 preferredStyle:0];
  id v7 = (void *)MEMORY[0x1E4FB1410];
  BOOL v8 = PKLocalizedString(&cfstr_Cancel.isa);
  uint64_t v9 = [v7 actionWithTitle:v8 style:1 handler:0];
  [v6 addAction:v9];

  id v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = PKLocalizedMadisonString(&cfstr_CancelInvitati_2.isa);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke;
  v13[3] = &unk_1E59CB1F0;
  v13[4] = self;
  char v12 = [v10 actionWithTitle:v11 style:2 handler:v13];
  [v6 addAction:v12];

  [(PKAccountUserDetailViewController *)self presentViewController:v6 animated:1 completion:0];
}

void __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F844B0]);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1088) applicationBaseURL];
  [v2 setBaseURL:v3];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 1088) applicationIdentifier];
  [v2 setApplicationIdentifier:v4];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 1144);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke_2;
  v7[3] = &unk_1E59CD658;
  v7[4] = v5;
  [v6 submitDeleteRequest:v2 completion:v7];
}

void __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke_3;
  v6[3] = &unk_1E59CA870;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKAccountUserDetailViewController__presentCancelInvitationAlert__block_invoke_3(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "_presentDisplayableError:");
  }
  return result;
}

- (void)_presentStopSharingAlert
{
  id v3 = [(CNContact *)self->_contact givenName];
  uint64_t v4 = PKLocalizedMadisonString(&cfstr_StopSharingAle.isa, &stru_1EF1B4C70.isa, v3);
  id v5 = PKLocalizedMadisonString(&cfstr_StopSharingAle_0.isa, &stru_1EF1B5770.isa, v3, v3);
  id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v5 preferredStyle:0];
  id v7 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v8 = PKLocalizedString(&cfstr_Cancel.isa);
  uint64_t v9 = [v7 actionWithTitle:v8 style:1 handler:0];
  [v6 addAction:v9];

  id v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = PKLocalizedMadisonString(&cfstr_StopSharing.isa);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke;
  v13[3] = &unk_1E59CB1F0;
  v13[4] = self;
  char v12 = [v10 actionWithTitle:v11 style:2 handler:v13];
  [v6 addAction:v12];

  [(PKAccountUserDetailViewController *)self presentViewController:v6 animated:1 completion:0];
}

void __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1136);
  uint64_t v4 = [*(id *)(v2 + 1064) altDSID];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1056) accountIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke_2;
  v6[3] = &unk_1E59CD658;
  void v6[4] = *(void *)(a1 + 32);
  [v3 deleteAccountUserWithAltDSID:v4 forAccountWithIdentifier:v5 completion:v6];
}

void __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke_3;
  v6[3] = &unk_1E59CA870;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __61__PKAccountUserDetailViewController__presentStopSharingAlert__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_presentDisplayableError:");
  }
  else
  {
    id v4 = [v1 navigationController];
    id v3 = (id)[v4 popViewControllerAnimated:1];
  }
}

- (void)_presentAccountUserInvitation
{
  if (self->_accountUserInvitation && !self->_performingAction)
  {
    [(PKAccountUserDetailViewController *)self _setPerformingAction:1 animated:1];
    id v3 = objc_alloc(MEMORY[0x1E4F84BB8]);
    id v4 = [MEMORY[0x1E4F84D50] sharedService];
    id v5 = (void *)[v3 initWithWebService:v4];

    id v6 = [PKApplyControllerConfiguration alloc];
    int64_t style = self->_style;
    uint64_t v8 = 3;
    if (style != 1) {
      uint64_t v8 = 0;
    }
    if (style == 2) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = v8;
    }
    id v10 = [(PKApplyControllerConfiguration *)v6 initWithSetupDelegate:0 context:v9 provisioningController:v5];
    [(PKApplyControllerConfiguration *)v10 setFeatureApplication:self->_accountUserInvitation];
    id v11 = [[PKApplyController alloc] initWithApplyConfiguration:v10];
    applyController = self->_applyController;
    self->_applyController = v11;

    char v13 = self->_applyController;
    BOOL v14 = [MEMORY[0x1E4F841A8] analyticsAccountTypeForAccount:self->_account];
    [(PKApplyController *)v13 setAnalyticsExistingAccountType:v14];

    int v15 = self->_applyController;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__PKAccountUserDetailViewController__presentAccountUserInvitation__block_invoke;
    v16[3] = &unk_1E59CB6B0;
    void v16[4] = self;
    [(PKApplyController *)v15 nextViewControllerWithCompletion:v16];
  }
}

void __66__PKAccountUserDetailViewController__presentAccountUserInvitation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = [[PKNavigationController alloc] initWithRootViewController:v8];
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v6 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
  }
  id v7 = v6;
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];

LABEL_6:
  [*(id *)(a1 + 32) _setPerformingAction:0 animated:1];
}

- (void)_updateTransactionLimit:(id)a3
{
  BOOL v4 = a3 != 0;
  accountUser = self->_accountUser;
  id v6 = a3;
  id v7 = [(PKAccountUser *)accountUser preferences];
  id v9 = (id)[v7 mutableCopy];

  [v9 setTransactionSpendLimitEnabled:v4];
  [v9 setTransactionSpendLimitAmount:v6];

  id v8 = (void *)[v9 copy];
  [(PKAccountUserDetailViewController *)self _updatePreferences:v8];
}

- (void)_updateMonthlySpendLimit:(id)a3
{
  BOOL v4 = a3 != 0;
  accountUser = self->_accountUser;
  id v6 = a3;
  id v7 = [(PKAccountUser *)accountUser preferences];
  id v9 = (id)[v7 mutableCopy];

  [v9 setMonthlySpendLimitEnabled:v4];
  [v9 setMonthlySpendLimitAmount:v6];

  id v8 = (void *)[v9 copy];
  [(PKAccountUserDetailViewController *)self _updatePreferences:v8];
}

- (void)_updateShowAvailableCredit:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKAccountUser *)self->_accountUser preferences];
  id v7 = (id)[v5 mutableCopy];

  [v7 setShowAvailableCredit:v3];
  id v6 = (void *)[v7 copy];
  [(PKAccountUserDetailViewController *)self _updatePreferences:v6];
}

- (void)_updateSpendingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKAccountUser *)self->_accountUser preferences];
  id v7 = (id)[v5 mutableCopy];

  [v7 setSpendingEnabled:v3];
  id v6 = (void *)[v7 copy];
  [(PKAccountUserDetailViewController *)self _updatePreferences:v6];
}

- (void)_updateMonthlySpendNotificationThreshold:(id)a3
{
  accountUser = self->_accountUser;
  id v5 = a3;
  id v6 = [(PKAccountUser *)accountUser notificationSettings];
  id v8 = (id)[v6 mutableCopy];

  [v8 setMonthlySpendNotificationThreshold:v5];
  id v7 = (void *)[v8 copy];
  [(PKAccountUserDetailViewController *)self _updateNotificationSettings:v7];
}

- (void)_updatePreferences:(id)a3
{
  id v4 = a3;
  id v5 = (PKMutableAccountUserPreferences *)[v4 copy];
  pendingAccountUserPreferences = self->_pendingAccountUserPreferences;
  self->_pendingAccountUserPreferences = v5;

  [(PKAccountUserDetailViewController *)self _setPerformingAction:1 animated:1];
  accountService = self->_accountService;
  id v8 = (void *)[v4 copy];

  id v9 = [(PKAccountUser *)self->_accountUser altDSID];
  id v10 = [(PKAccount *)self->_account accountIdentifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PKAccountUserDetailViewController__updatePreferences___block_invoke;
  v11[3] = &unk_1E59DC230;
  v11[4] = self;
  [(PKAccountService *)accountService updateAccountUserPreferences:v8 forAccountUserWithAltDSID:v9 forAccountWithIdentifier:v10 completion:v11];
}

void __56__PKAccountUserDetailViewController__updatePreferences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKAccountUserDetailViewController__updatePreferences___block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56__PKAccountUserDetailViewController__updatePreferences___block_invoke_2(uint64_t a1)
{
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(id **)(a1 + 40);
  if (v3)
  {
    objc_storeStrong(v2 + 133, v3);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 1072);
    *(void *)(v4 + 1072) = 0;

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 1080);
    *(void *)(v6 + 1080) = 0;
  }
  else
  {
    [v2 _presentDisplayableError:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 40) _setPerformingAction:0 animated:1];
  id v8 = *(void **)(a1 + 40);

  return [v8 _updateConfigurationAnimated:1];
}

- (void)_updateTransactionNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKAccountUser *)self->_accountUser notificationSettings];
  id v7 = (id)[v5 mutableCopy];

  [v7 setTransactionNotificationsEnabled:v3];
  uint64_t v6 = (void *)[v7 copy];
  [(PKAccountUserDetailViewController *)self _updateNotificationSettings:v6];
}

- (void)_updateTransactionNotificationThreshold:(id)a3
{
  accountUser = self->_accountUser;
  id v5 = a3;
  uint64_t v6 = [(PKAccountUser *)accountUser notificationSettings];
  id v8 = (id)[v6 mutableCopy];

  [v8 setTransactionNotificationThreshold:v5];
  id v7 = (void *)[v8 copy];
  [(PKAccountUserDetailViewController *)self _updateNotificationSettings:v7];
}

- (void)_updateNotificationSettings:(id)a3
{
  id v4 = a3;
  id v5 = (PKMutableAccountUserNotificationSettings *)[v4 copy];
  pendingAccountUserNotificationSettings = self->_pendingAccountUserNotificationSettings;
  self->_pendingAccountUserNotificationSettings = v5;

  [(PKAccountUserDetailViewController *)self _setPerformingAction:1 animated:1];
  accountService = self->_accountService;
  id v8 = [(PKAccountUser *)self->_accountUser altDSID];
  id v9 = [(PKAccount *)self->_account accountIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PKAccountUserDetailViewController__updateNotificationSettings___block_invoke;
  v10[3] = &unk_1E59DC230;
  void v10[4] = self;
  [(PKAccountService *)accountService updateAccountUserNotificationSettings:v4 forAccountUserWithAltDSID:v8 forAccountWithIdentifier:v9 completion:v10];
}

void __65__PKAccountUserDetailViewController__updateNotificationSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKAccountUserDetailViewController__updateNotificationSettings___block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__PKAccountUserDetailViewController__updateNotificationSettings___block_invoke_2(uint64_t a1)
{
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(id **)(a1 + 40);
  if (v3)
  {
    objc_storeStrong(v2 + 133, v3);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 1072);
    *(void *)(v4 + 1072) = 0;

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 1080);
    *(void *)(v6 + 1080) = 0;
  }
  else
  {
    [v2 _presentDisplayableError:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 40) _setPerformingAction:0 animated:1];
  id v8 = *(void **)(a1 + 40);

  return [v8 _updateConfigurationAnimated:1];
}

- (void)_setPerformingAction:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_performingAction ^ a3) & 1) == 0)
  {
    self->_performingAction = a3;
    [(PKAccountUserDetailViewController *)self _updateConfigurationAnimated:a4];
  }
}

- (void)_presentDisplayableError:(id)a3
{
  id v4 = PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
  [(PKAccountUserDetailViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_presentPeerPaymentFamilySharingSetupForFamilyMember:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [PKPeerPaymentAssociatedAccountsController alloc];
    familyMemberCollection = self->_familyMemberCollection;
    avatarManager = self->_avatarManager;
    id v8 = objc_alloc_init(MEMORY[0x1E4F848A0]);
    int64_t style = self->_style;
    uint64_t v10 = 3;
    if (style != 1) {
      uint64_t v10 = 0;
    }
    if (style == 2) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v12 = [(PKPeerPaymentAssociatedAccountsController *)v5 initWithFamilyCollection:familyMemberCollection avatarManager:avatarManager passLibraryDataProvider:v8 context:v11];
    associatedAccountsController = self->_associatedAccountsController;
    self->_associatedAccountsController = v12;

    id v16 = [[PKPeerPaymentAssociatedAccountPresentationContext alloc] initWithPKFamilyMember:v4 setupType:1];
    BOOL v14 = self->_associatedAccountsController;
    int v15 = [(PKAccountUserDetailViewController *)self navigationController];
    [(PKPeerPaymentAssociatedAccountsController *)v14 presentAssociatedAccountsFlowWithPresentationContext:v16 fromNavigationController:v15];
  }
}

- (void)_presentPasswordAuthorizationWithReason:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F4F100];
    id v8 = a3;
    id v9 = objc_alloc_init(v7);
    [v9 setPresentingViewController:self];
    uint64_t v10 = [(PKAppleAccountInformation *)self->_appleAccountInformation appleID];
    [v9 setUsername:v10];

    uint64_t v11 = [(PKAppleAccountInformation *)self->_appleAccountInformation aaAlternateDSID];
    [v9 setAltDSID:v11];

    [v9 setIsUsernameEditable:0];
    [v9 setShouldPromptForPasswordOnly:1];
    [v9 setAuthenticationType:2];
    [v9 setReason:v8];

    id v12 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __88__PKAccountUserDetailViewController__presentPasswordAuthorizationWithReason_completion___block_invoke;
    v13[3] = &unk_1E59DC258;
    v13[4] = self;
    id v14 = v6;
    [v12 authenticateWithContext:v9 completion:v13];
  }
}

void __88__PKAccountUserDetailViewController__presentPasswordAuthorizationWithReason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKAccountUserDetailViewController__presentPasswordAuthorizationWithReason_completion___block_invoke_2;
  block[3] = &unk_1E59CA938;
  id v8 = v4;
  id v5 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__PKAccountUserDetailViewController__presentPasswordAuthorizationWithReason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v15 = 138412290;
    uint64_t v16 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Request for user authentication returned with error: %@", (uint8_t *)&v15, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_8;
  }
  id v5 = [v4 domain];
  uint64_t v6 = *MEMORY[0x1E4F4ED70];
  if ([v5 isEqual:*MEMORY[0x1E4F4ED70]])
  {
    uint64_t v7 = [*(id *)(a1 + 32) code];

    if (v7 == -7003)
    {
      id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_8:
      v8();
      return;
    }
  }
  else
  {
  }
  uint64_t v9 = [*(id *)(a1 + 32) domain];
  if ([v9 isEqual:v6])
  {
    uint64_t v10 = [*(id *)(a1 + 32) code];

    if (v10 == -7005)
    {
      uint64_t v11 = PKLocalizedPaymentString(&cfstr_CouldNotConnec.isa);
      id v12 = PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
      id v13 = PKDisplayableErrorCustom();

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      return;
    }
  }
  else
  {
  }
  id v14 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(void *)(a1 + 32), [*(id *)(*(void *)(a1 + 40) + 1056) feature], 0, 0);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_footerViewForPeerPaymentAccountSetup
{
  uint64_t v3 = objc_alloc_init(PKFooterHyperlinkView);
  id v4 = [(CNContact *)self->_contact givenName];
  id v5 = [(PKFamilyMemberCollection *)self->_familyMemberCollection currentUser];
  int v6 = [v5 isOrganizer];

  if (v6)
  {
    uint64_t v7 = PKLocalizedMadisonString(&cfstr_AccountUserAss_0.isa);
    id v8 = PKLocalizedMadisonString(&cfstr_AccountUserAss_1.isa, &stru_1EF1B5770.isa, v4, v7);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PKAccountUserDetailViewController__footerViewForPeerPaymentAccountSetup__block_invoke_2;
    aBlock[3] = &unk_1E59CA7D0;
    aBlock[4] = self;
    uint64_t v9 = _Block_copy(aBlock);
  }
  else
  {
    uint64_t v7 = PKLocalizedMadisonString(&cfstr_AccountUserAss_2.isa);
    id v8 = PKLocalizedMadisonString(&cfstr_AccountUserAss_3.isa, &stru_1EF1B5770.isa, v4, v7);
    uint64_t v9 = &__block_literal_global_330;
  }
  uint64_t v10 = PKAttributedStringByAddingLinkToSubstring(v8, v7, 0);
  [(PKFooterHyperlinkView *)v3 setAttributedText:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PKAccountUserDetailViewController__footerViewForPeerPaymentAccountSetup__block_invoke_4;
  v13[3] = &unk_1E59CF038;
  id v14 = v9;
  id v11 = v9;
  [(PKFooterHyperlinkView *)v3 setAction:v13];

  return v3;
}

void __74__PKAccountUserDetailViewController__footerViewForPeerPaymentAccountSetup__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1096);
  id v4 = [*(id *)(v2 + 1064) altDSID];
  id v5 = [v3 familyMemberForAltDSID:v4];

  [*(id *)(a1 + 32) _presentPeerPaymentFamilySharingSetupForFamilyMember:v5];
}

void __74__PKAccountUserDetailViewController__footerViewForPeerPaymentAccountSetup__block_invoke_3()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/kb/HT211324"];
  [v1 openURL:v0 configuration:0 completionHandler:0];
}

uint64_t __74__PKAccountUserDetailViewController__footerViewForPeerPaymentAccountSetup__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_associatedAccountsController, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_physicalCardActionController, 0);
  objc_storeStrong((id *)&self->_physicalCardController, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_appleAccountInformation, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_accountUserInvitation, 0);
  objc_storeStrong((id *)&self->_pendingAccountUserNotificationSettings, 0);
  objc_storeStrong((id *)&self->_pendingAccountUserPreferences, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end