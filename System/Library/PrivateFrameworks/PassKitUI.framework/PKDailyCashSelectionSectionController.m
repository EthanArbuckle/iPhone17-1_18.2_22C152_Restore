@interface PKDailyCashSelectionSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (NSArray)identifiers;
- (PKDailyCashSelectionSectionController)initWithSectionIdentifier:(id)a3 account:(id)a4 accountService:(id)a5 delegate:(id)a6;
- (id)_applyAccessory;
- (id)_checkmarkAccessory;
- (id)_disclosureAccessory;
- (id)_eligibleAccountOfType:(unint64_t)a3;
- (id)_hasRedeemedAccessory;
- (id)_pendingApplicationAccessory;
- (id)_presentingViewController;
- (id)_setupAccessory;
- (id)_spinnerAccessory;
- (id)analyticsEventReportWithPreSelect:(BOOL)a3;
- (id)cellRegistrationForItem:(id)a3;
- (id)dailyCashSelectionItems;
- (id)footerTitle;
- (id)headerTitle;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_applyRewardsAsStatementCredit;
- (void)_changeRewardsDestination:(unint64_t)a3;
- (void)_changeRewardsDestinationAndOpenAccountIfNeeded:(unint64_t)a3;
- (void)_presentPeerPaymentNotEnabledAlert;
- (void)_reloadSection;
- (void)_reportDailyCashConfirmationEventWithRedemptionType:(unint64_t)a3 button:(id)a4;
- (void)_reportDestinationButtonTapWithRedemptionType:(unint64_t)a3;
- (void)accountAdded:(id)a3;
- (void)accountChanged:(id)a3;
- (void)accountRemoved:(id)a3;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)didSelectItem:(id)a3;
- (void)featureApplicationAdded:(id)a3;
- (void)featureApplicationChanged:(id)a3;
- (void)featureApplicationRemoved:(id)a3;
- (void)paymentSetupDidFinish:(id)a3;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)preflightWithCompletion:(id)a3;
- (void)presentConfirmationAlertWithTitle:(id)a3 redemptionType:(unint64_t)a4 confirmationHandler:(id)a5;
@end

@implementation PKDailyCashSelectionSectionController

- (PKDailyCashSelectionSectionController)initWithSectionIdentifier:(id)a3 account:(id)a4 accountService:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKDailyCashSelectionSectionController;
  v15 = [(PKDailyCashSelectionSectionController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeWeak((id *)&v16->_delegate, v14);
    objc_storeStrong((id *)&v16->_account, a4);
    objc_storeStrong((id *)&v16->_accountService, a5);
    v17 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
    applyService = v16->_applyService;
    v16->_applyService = v17;
  }
  return v16;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PKAccount *)self->_account creditDetails];
  self->_currentDestination = [v5 rewardsDestination];

  v6 = [MEMORY[0x1E4F84E00] sharedInstance];
  v7 = [v6 account];
  peerPaymentAccount = self->_peerPaymentAccount;
  self->_peerPaymentAccount = v7;

  v9 = [PKPeerPaymentAccountResolutionController alloc];
  v10 = self->_peerPaymentAccount;
  id v11 = [MEMORY[0x1E4F84E10] sharedService];
  id v12 = objc_alloc_init(MEMORY[0x1E4F848A0]);
  id v13 = [(PKPeerPaymentAccountResolutionController *)v9 initWithAccount:v10 webService:v11 context:0 delegate:self passLibraryDataProvider:v12];
  peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
  self->_peerPaymentAccountResolutionController = v13;

  [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController setSetupDelegate:self];
  [(PKAccountService *)self->_accountService registerObserver:self];
  [(PKPaymentService *)self->_applyService setDelegate:self];
  id v15 = objc_alloc_init(MEMORY[0x1E4F84518]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke;
  v24[3] = &unk_1E59CFB08;
  v24[4] = self;
  [v15 addOperation:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_4;
  v23[3] = &unk_1E59CFB08;
  v23[4] = self;
  [v15 addOperation:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_8;
  v22[3] = &unk_1E59CFB08;
  v22[4] = self;
  [v15 addOperation:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_11;
  v21[3] = &unk_1E59CFB08;
  v21[4] = self;
  [v15 addOperation:v21];
  v16 = [MEMORY[0x1E4F1CA98] null];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_14;
  v19[3] = &unk_1E59D1338;
  id v20 = v4;
  id v17 = v4;
  id v18 = (id)[v15 evaluateWithInput:v16 completion:v19];
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 88);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_2;
  v12[3] = &unk_1E59CE578;
  id v13 = v6;
  id v14 = v7;
  v12[4] = v8;
  id v10 = v6;
  id v11 = v7;
  [v9 accountsWithCompletion:v12];
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_3;
  v5[3] = &unk_1E59CE9B0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 104);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_5;
  v12[3] = &unk_1E59CEB88;
  id v13 = v6;
  id v14 = v7;
  v12[4] = v8;
  id v10 = v6;
  id v11 = v7;
  [v9 featureApplicationsWithCompletion:v12];
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_6;
  v5[3] = &unk_1E59CE9B0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "pk_firstObjectPassingTest:", &__block_literal_global_194);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 112);
  *(void *)(v3 + 112) = v2;

  v5 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v5();
}

BOOL __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 feature] == 5 && objc_msgSend(v2, "applicationState") == 5;

  return v3;
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 88);
  id v10 = [*(id *)(v8 + 24) accountIdentifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_9;
  v14[3] = &unk_1E59CEBB0;
  uint64_t v11 = *(void *)(a1 + 32);
  id v15 = v6;
  id v16 = v7;
  v14[4] = v11;
  id v12 = v6;
  id v13 = v7;
  [v9 accountUsersForAccountWithIdentifier:v10 completion:v14];
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_10;
  v5[3] = &unk_1E59CE9B0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_10(void *a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F842C8]) initWithAccountUsers:a1[5]];
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  v5 = *(uint64_t (**)(void))(a1[7] + 16);

  return v5();
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v10 + 24);
  id v12 = [*(id *)(v10 + 32) currentAccountUser];
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_12;
  v16[3] = &unk_1E59DC548;
  objc_copyWeak(&v19, &location);
  id v14 = v9;
  id v18 = v14;
  id v15 = v8;
  id v17 = v15;
  +[PKCreditAccountController resolutionToReceiveCashbackForAccount:v11 accountUser:v12 withPeerPaymentAccount:v13 completion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_12(id *a1, uint64_t a2, char a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_13;
  v5[3] = &unk_1E59D4388;
  objc_copyWeak(&v8, a1 + 6);
  char v9 = a3;
  id v7 = a1[5];
  id v6 = a1[4];
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v8);
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_13(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    WeakRetained[81] = *(unsigned char *)(a1 + 56);
    uint64_t v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }
}

uint64_t __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)dailyCashSelectionItems
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PKAccount *)self->_account redeemRewardsFeatureDescriptor];
  v5 = [v4 supportedDestinations];

  if (!v5 || ![v5 count])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v7 = PKAccountRewardRedemptionTypeToString();
    uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);

    v5 = (void *)v8;
  }
  char v9 = PKAccountRewardRedemptionTypeToString();
  if (([v5 containsObject:v9] & 1) == 0)
  {
    uint64_t v10 = [v5 arrayByAddingObject:v9];

    v5 = (void *)v10;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v12)
  {

    goto LABEL_43;
  }
  uint64_t v13 = v12;
  v39 = v9;
  v40 = v3;
  unint64_t v14 = 0;
  uint64_t v15 = *(void *)v43;
  id v41 = v11;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v43 != v15) {
        objc_enumerationMutation(v11);
      }
      uint64_t v17 = PKAccountRewardRedemptionTypeFromString();
      id v18 = objc_alloc_init(PKDailyCashSelectionItem);
      [(PKDailyCashSelectionItem *)v18 setRedemptionType:v17];
      [(PKDailyCashSelectionItem *)v18 setLoading:v17 == self->_loadingDestination];
      [(PKDailyCashSelectionItem *)v18 setSelected:v17 == self->_currentDestination];
      if (v17 == 1)
      {
        unint64_t v31 = [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController currentPeerPaymentAccountResolution];
        if ((PKSavingsFDICSignageEnabled() & 1) == 0 && !v31)
        {
          v32 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
          [(PKDailyCashSelectionItem *)v18 setBalance:v32];
        }
        ++v14;
        if (self->_peerPaymentAccount) {
          BOOL v33 = v31 == 1;
        }
        else {
          BOOL v33 = 1;
        }
        uint64_t v34 = !v33;
        [(PKDailyCashSelectionItem *)v18 setHasAccount:v34];
        uint64_t v35 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount state];
        if ((unint64_t)(v35 - 1) >= 4) {
          uint64_t v36 = 0;
        }
        else {
          uint64_t v36 = v35;
        }
        [(PKDailyCashSelectionItem *)v18 setState:v36];
        [v3 addObject:v18];
      }
      else
      {
        if (v17 == 3)
        {
          v21 = [(PKDailyCashSelectionSectionController *)self _eligibleAccountOfType:4];
          [(PKDailyCashSelectionItem *)v18 setHasAccount:v21 != 0];
          [(PKDailyCashSelectionItem *)v18 setHasPendingApplication:self->_pendingSavingsApplication != 0];
          v25 = [v21 savingsDetails];
          v26 = [v25 accountSummary];
          v27 = [v26 currentBalance];

          v28 = [v21 savingsDetails];
          v29 = [v28 currencyCode];

          if ((!PKSavingsFDICSignageEnabled()
             || [v21 FDICBehaviorShowCreditRewardsHubBalance])
            && v27
            && v29)
          {
            v30 = PKCurrencyAmountMake();
            [(PKDailyCashSelectionItem *)v18 setBalance:v30];
          }
          ++v14;
          -[PKDailyCashSelectionItem setState:](v18, "setState:", [v21 state]);
          id v3 = v40;
          [v40 addObject:v18];

          goto LABEL_24;
        }
        if (v17 == 2 && self->_allowStatementCreditRedemption)
        {
          id v19 = [(PKAccount *)self->_account creditDetails];
          id v20 = [v19 accountSummary];
          v21 = [v20 rewardsBalance];

          if (v21)
          {
            v22 = [(PKAccount *)self->_account creditDetails];
            v23 = [v22 currencyCode];
            v24 = PKCurrencyAmountMake();

            [(PKDailyCashSelectionItem *)v18 setBalance:v24];
            id v3 = v40;
          }
          [(PKDailyCashSelectionItem *)v18 setHasRedeemed:self->_hasRedeemed];
          [(PKDailyCashSelectionItem *)v18 setHasAccount:1];
          [v3 addObject:v18];
LABEL_24:

          id v11 = v41;
        }
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
  }
  while (v13);

  char v9 = v39;
  if (v14 > 1)
  {
LABEL_44:
    [v3 sortUsingComparator:&__block_literal_global_132];
    v37 = (void *)[v3 copy];
    goto LABEL_46;
  }
LABEL_43:
  if (self->_allowStatementCreditRedemption) {
    goto LABEL_44;
  }
  v37 = 0;
LABEL_46:

  return v37;
}

uint64_t __64__PKDailyCashSelectionSectionController_dailyCashSelectionItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 redemptionType] - 1;
  if (v5 > 2) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = qword_1A0445268[v5];
  }
  uint64_t v7 = [v4 redemptionType];

  if ((unint64_t)(v7 - 1) > 2) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = qword_1A0445268[v7 - 1];
  }
  BOOL v9 = v6 >= v8;
  BOOL v10 = v6 > v8;
  if (v9) {
    return v10;
  }
  else {
    return -1;
  }
}

- (id)analyticsEventReportWithPreSelect:(BOOL)a3
{
  BOOL v21 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = (id)*MEMORY[0x1E4F861F0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_currentDailyCashSelectionItems;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v6)
  {
    uint64_t v12 = v5;
    goto LABEL_25;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v26;
  uint64_t v23 = *MEMORY[0x1E4F86208];
  id v9 = (id)*MEMORY[0x1E4F861E0];
  BOOL v10 = (void *)*MEMORY[0x1E4F861E8];
  id v11 = (void *)*MEMORY[0x1E4F86200];
  uint64_t v12 = v5;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(obj);
      }
      unint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      uint64_t v15 = [v14 redemptionType];
      switch(v15)
      {
        case 3:
          if ([v14 hasAccount]) {
            id v18 = v9;
          }
          else {
            id v18 = v5;
          }
          [v4 setObject:v18 forKeyedSubscript:v11];
          if ([v14 selected])
          {
            id v17 = v11;
            goto LABEL_20;
          }
          break;
        case 2:
          [v4 setObject:v5 forKeyedSubscript:v23];
          continue;
        case 1:
          id v16 = [v14 hasAccount] ? v9 : v5;
          [v4 setObject:v16 forKeyedSubscript:v10];
          if ([v14 selected])
          {
            id v17 = v10;
LABEL_20:
            id v19 = v17;

            uint64_t v12 = v19;
            continue;
          }
          break;
      }
    }
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v7);
LABEL_25:

  [v22 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F861D8]];
  if (v21) {
    [v22 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F861F8]];
  }

  return v22;
}

- (NSArray)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_identifier;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v4 = a3;
  if (PKStoreDemoModeEnabled())
  {
    char v5 = 0;
  }
  else
  {
    id v6 = v4;
    uint64_t v7 = [v6 redemptionType];
    if (v7 == self->_currentDestination) {
      char v8 = [v6 hasAccount];
    }
    else {
      char v8 = 0;
    }
    char v9 = [v6 hasPendingApplication];
    char v5 = 0;
    if (v7 != 2 && (v8 & 1) == 0)
    {
      if (self->_loadingDestination) {
        char v5 = 0;
      }
      else {
        char v5 = v9 ^ 1;
      }
    }
  }
  return v5;
}

- (void)didSelectItem:(id)a3
{
  id v4 = a3;
  if ((PKStoreDemoModeEnabled() & 1) == 0)
  {
    dispatch_time_t v5 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PKDailyCashSelectionSectionController_didSelectItem___block_invoke;
    block[3] = &unk_1E59CA7D0;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
    uint64_t v6 = [v4 redemptionType];
    [(PKDailyCashSelectionSectionController *)self _changeRewardsDestinationAndOpenAccountIfNeeded:v6];
    [(PKDailyCashSelectionSectionController *)self _reportDestinationButtonTapWithRedemptionType:v6];
  }
}

void __55__PKDailyCashSelectionSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained deselectCells];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  identifier = self->_identifier;
  char v8 = (NSString *)v5;
  char v9 = identifier;
  if (v9 == v8)
  {

    goto LABEL_7;
  }
  BOOL v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_9;
  }
  BOOL v11 = [(NSString *)v8 isEqualToString:v9];

  if (v11)
  {
LABEL_7:
    uint64_t v12 = [(PKDailyCashSelectionSectionController *)self dailyCashSelectionItems];
    currentDailyCashSelectionItems = self->_currentDailyCashSelectionItems;
    self->_currentDailyCashSelectionItems = v12;

    [v6 appendItems:self->_currentDailyCashSelectionItems];
  }
LABEL_9:

  return v6;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_initWeak(&location, self);
  id v6 = (void *)MEMORY[0x1E4FB1578];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PKDailyCashSelectionSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E59DC590;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  uint64_t v7 = [v6 registrationWithCellClass:v5 configurationHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __65__PKDailyCashSelectionSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_48;
  }
  char v9 = [v6 traitCollection];
  id v10 = [v9 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

  uint64_t v12 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  objc_msgSend(v12, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  uint64_t v13 = [v12 secondaryTextProperties];
  unint64_t v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v13 setColor:v14];

  uint64_t v15 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], 0);
  v52 = v13;
  [v13 setFont:v15];

  id v16 = [v12 imageProperties];
  [v16 setCornerRadius:6.0];

  uint64_t v17 = [v7 redemptionType];
  v53 = [v7 balance];
  switch([v7 state])
  {
    case 1:
      if (v53)
      {
        id v18 = [v53 formattedStringValue];
        id v19 = PKLocalizedFeatureString();
        objc_msgSend(v12, "setSecondaryText:", v19, v18);
        goto LABEL_7;
      }
      break;
    case 2:
    case 3:
      id v20 = PKLocalizedFeatureString();
      [v12 setSecondaryText:v20];

      id v18 = [v12 secondaryTextProperties];
      id v19 = [MEMORY[0x1E4FB1618] systemRedColor];
      [v18 setColor:v19];
LABEL_7:

      goto LABEL_8;
    case 4:
    case 5:
      id v18 = PKLocalizedFeatureString();
      [v12 setSecondaryText:v18];
LABEL_8:

      break;
    default:
      break;
  }
  if ([v7 hasPendingApplication])
  {
    if (IsAccessibilityCategory)
    {
      BOOL v21 = PKLocalizedFeatureString();
      [v12 setSecondaryText:v21];

LABEL_15:
      long long v25 = 0;
      goto LABEL_21;
    }
    id v22 = [WeakRetained _pendingApplicationAccessory];
    v60[0] = v22;
    uint64_t v23 = (void *)MEMORY[0x1E4F1C978];
    v24 = (void **)v60;
  }
  else if ([v7 hasAccount])
  {
    if (![v7 selected]) {
      goto LABEL_15;
    }
    id v22 = [WeakRetained _checkmarkAccessory];
    v57 = v22;
    uint64_t v23 = (void *)MEMORY[0x1E4F1C978];
    v24 = &v57;
  }
  else
  {
    if (!IsAccessibilityCategory)
    {
      id v22 = [WeakRetained _setupAccessory];
      v58[0] = v22;
      v37 = [WeakRetained _disclosureAccessory];
      v58[1] = v37;
      long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];

      goto LABEL_20;
    }
    long long v26 = PKLocalizedFeatureString();
    [v12 setSecondaryText:v26];

    id v22 = [WeakRetained _disclosureAccessory];
    v59 = v22;
    uint64_t v23 = (void *)MEMORY[0x1E4F1C978];
    v24 = &v59;
  }
  long long v25 = [v23 arrayWithObjects:v24 count:1];
LABEL_20:

LABEL_21:
  switch(v17)
  {
    case 1:
      v32 = PKLocalizedFeatureString();
      [v12 setText:v32];

      char v28 = 0;
      BOOL v33 = @"AppleCashIcon";
      break;
    case 3:
      uint64_t v34 = [*(id *)(a1 + 32) _eligibleAccountOfType:4];
      uint64_t v35 = v34;
      if (v34)
      {
        if ([v34 supportsOneTimeDeposit]) {
          uint64_t v36 = 1;
        }
        else {
          uint64_t v36 = [v35 supportsOneTimeDepositWithAppleCash];
        }
        [v6 setUserInteractionEnabled:v36];
      }
      v38 = PKLocalizedFeatureString();
      [v12 setText:v38];

      char v28 = 0;
      BOOL v33 = @"SAVINGS_Icon";
      break;
    case 2:
      long long v27 = PKLocalizedFeatureString();
      [v12 setText:v27];

      char v28 = (char)v53;
      if (!v53)
      {
        [v12 setSecondaryText:0];
LABEL_42:
        BOOL v33 = @"AppleCardIcon";
        break;
      }
      v50 = [v53 formattedStringValue];
      v29 = PKLocalizedFeatureString();

      objc_msgSend(v12, "setSecondaryText:", v29, v50);
      if ([v7 hasRedeemed])
      {
        uint64_t v30 = [WeakRetained _hasRedeemedAccessory];
        v56 = v30;
        unint64_t v31 = &v56;
      }
      else
      {
        v51 = v29;
        v39 = [v53 amount];
        v40 = [MEMORY[0x1E4F28C28] zero];
        uint64_t v41 = [v39 compare:v40];

        if (v41 != 1)
        {
          v29 = v51;
          goto LABEL_41;
        }
        uint64_t v30 = [WeakRetained _applyAccessory];
        v55 = v30;
        unint64_t v31 = &v55;
        v29 = v51;
      }
      uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];

      long long v25 = (void *)v42;
LABEL_41:

      char v28 = 0;
      goto LABEL_42;
    default:
      BOOL v33 = 0;
      char v28 = 1;
      break;
  }
  if ([v7 loading])
  {
    long long v43 = [WeakRetained _spinnerAccessory];
    v54 = v43;
    uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];

    long long v25 = (void *)v44;
  }
  if ((v28 & 1) == 0)
  {
    long long v45 = PKPassKitUIBundle();
    v46 = [v45 URLForResource:v33 withExtension:@"pdf"];
    double v47 = PKUIScreenScale();
    v48 = PKUIImageFromPDF(v46, 29.0, 29.0, v47);
    [v12 setImage:v48];
  }
  [v6 setAccessories:v25];
  [v6 setContentConfiguration:v12];
  id v49 = **((id **)&unk_1E59DC620 + v17);
  [v6 setAccessibilityIdentifier:v49];

LABEL_48:
}

- (id)_eligibleAccountOfType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_accounts;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (void)v12) == a3 && objc_msgSend(v9, "state") != 4)
        {
          id v10 = v9;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4FB1558];
  id v6 = a3;
  uint64_t v7 = (void *)[[v5 alloc] initWithAppearance:2];
  char v8 = [(PKDailyCashSelectionSectionController *)self headerTitle];
  BOOL v9 = [v8 length] != 0;

  id v10 = [(PKDailyCashSelectionSectionController *)self footerTitle];
  uint64_t v11 = [v10 length];

  [v7 setHeaderMode:v9];
  [v7 setFooterMode:v11 != 0];
  long long v12 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v7 layoutEnvironment:v6];

  [v12 contentInsets];
  objc_msgSend(v12, "setContentInsets:");

  return v12;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)*MEMORY[0x1E4FB2770];
  id v8 = v5;
  id v9 = v7;
  if (v9 == v8)
  {
  }
  else
  {
    id v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_9;
    }
    char v11 = [v8 isEqualToString:v9];

    if ((v11 & 1) == 0)
    {
LABEL_9:
      long long v12 = (void *)*MEMORY[0x1E4FB2760];
      id v13 = v8;
      id v14 = v12;
      if (v14 == v13)
      {
      }
      else
      {
        long long v15 = v14;
        if (v8 && v14)
        {
          [v13 isEqualToString:v14];
        }
        else
        {
        }
      }
    }
  }
  id v16 = objc_opt_class();

  return (Class)v16;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)*MEMORY[0x1E4FB2770];
  id v11 = v8;
  id v12 = v10;
  if (v12 == v11)
  {

    goto LABEL_7;
  }
  id v13 = v12;
  if (!v11 || !v12)
  {

    goto LABEL_14;
  }
  int v14 = [v11 isEqualToString:v12];

  if (v14)
  {
LABEL_7:
    long long v15 = (PKFDICSignageView *)v22;
    [(PKFDICSignageView *)v15 setUseLargeBottomInset:1];
    id v16 = [(PKDailyCashSelectionSectionController *)self headerTitle];
    [(PKFDICSignageView *)v15 setTitle:v16];
    goto LABEL_8;
  }
LABEL_14:
  uint64_t v17 = (void *)*MEMORY[0x1E4FB2760];
  id v16 = (PKFDICSignageView *)v11;
  id v18 = v17;
  if (v18 == v16)
  {

LABEL_20:
    id v16 = (PKFDICSignageView *)v22;
    [(PKFDICSignageView *)v16 setBottomInsetType:2];
    [(PKFDICSignageView *)v16 setHorizontalAlignment:0];
    id v20 = [(PKDailyCashSelectionSectionController *)self footerTitle];
    [(PKFDICSignageView *)v16 setFooterText:v20];

    int v21 = [(NSArray *)self->_currentDailyCashSelectionItems pk_containsObjectPassingTest:&__block_literal_global_192];
    if (!PKSavingsFDICSignageEnabled()
      || !v21
      || ([(PKAccount *)self->_account FDICBehaviorHideCreditRewardsHubSignage] & 1) != 0)
    {
      goto LABEL_9;
    }
    long long v15 = [[PKFDICSignageView alloc] initWithFeature:5 displayingBankName:0];
    [(PKFDICSignageView *)v16 setAdditionalView:v15];
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  long long v15 = v18;
  if (!v11 || !v18) {
    goto LABEL_8;
  }
  int v19 = [(PKFDICSignageView *)v16 isEqualToString:v18];

  if (v19) {
    goto LABEL_20;
  }
LABEL_10:
}

uint64_t __106__PKDailyCashSelectionSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 redemptionType] == 3) {
    uint64_t v3 = [v2 hasAccount] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)headerTitle
{
  return (id)PKLocalizedFeatureString();
}

- (id)footerTitle
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t currentDestination = self->_currentDestination;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = self->_currentDailyCashSelectionItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v27;
    uint64_t v10 = currentDestination | 2;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "redemptionType", (void)v26);
        uint64_t v14 = [v12 state];
        if (v13 == 3)
        {
          char v8 = 1;
        }
        else if (v13 != 1)
        {
          continue;
        }
        if (v14 != 1 && (self->_currentDestination == v13 || v10 == 2))
        {
          id v16 = [NSNumber numberWithUnsignedInteger:v13];
          [v3 addObject:v16];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v7) {
        goto LABEL_21;
      }
    }
  }
  char v8 = 0;
LABEL_21:

  if (self->_allowStatementCreditRedemption
    && [v3 count] == 1
    && ([v3 anyObject],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = [v17 integerValue],
        v17,
        v18 == 1))
  {
    int v19 = PKLocalizedFeatureString();
    id v20 = [v19 stringByAppendingString:@"\n"];
  }
  else
  {
    id v20 = &stru_1EF1B5B50;
  }
  int v21 = PKLocalizedFeatureString();
  id v22 = [(__CFString *)v20 stringByAppendingString:v21];

  if (v8)
  {
    uint64_t v23 = [v22 stringByAppendingString:@"\n"];

    v24 = PKLocalizedFeatureString();
    id v22 = [v23 stringByAppendingString:v24];
  }

  return v22;
}

- (id)_presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v3 = [WeakRetained rewardsHubCollectionView];
  id v4 = objc_msgSend(v3, "pkui_viewControllerFromResponderChain");

  return v4;
}

- (id)_setupAccessory
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1528]);
  id v3 = PKLocalizedFeatureString();
  id v4 = (void *)[v2 initWithText:v3];

  return v4;
}

- (id)_pendingApplicationAccessory
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1528]);
  id v3 = PKLocalizedFeatureString();
  id v4 = (void *)[v2 initWithText:v3];

  return v4;
}

- (id)_disclosureAccessory
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1518]);

  return v2;
}

- (id)_checkmarkAccessory
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB14F8]);

  return v2;
}

- (id)_hasRedeemedAccessory
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1528]);
  id v3 = PKLocalizedFeatureString();
  id v4 = (void *)[v2 initWithText:v3];

  return v4;
}

- (id)_applyAccessory
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __56__PKDailyCashSelectionSectionController__applyAccessory__block_invoke;
  long long v15 = &unk_1E59CBEE0;
  objc_copyWeak(&v16, &location);
  id v3 = [v2 actionWithHandler:&v12];
  id v4 = (void *)MEMORY[0x1E4FB14D0];
  id v5 = objc_msgSend(MEMORY[0x1E4FB14D8], "plainButtonConfiguration", v12, v13, v14, v15);
  uint64_t v6 = [v4 buttonWithConfiguration:v5 primaryAction:v3];

  uint64_t v7 = [v6 configuration];
  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  [v6 setConfiguration:v7];
  char v8 = [v6 titleLabel];
  [v8 setLineBreakMode:4];

  uint64_t v9 = PKLocalizedFeatureString();
  objc_msgSend(v6, "pkui_updateConfigurationWithTitle:", v9);

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v6 placement:1];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __56__PKDailyCashSelectionSectionController__applyAccessory__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _applyRewardsAsStatementCredit];
}

- (id)_spinnerAccessory
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1400]);
  [v2 startAnimating];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v2 placement:1];

  return v3;
}

- (void)_reloadSection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadDataForSectionIdentifier:self->_identifier animated:1];
}

- (void)_applyRewardsAsStatementCredit
{
  if (self->_loadingDestination)
  {
    id v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Already changing rewards destination", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    id v4 = [(PKAccount *)self->_account creditDetails];
    id v5 = [v4 accountSummary];
    uint64_t v6 = [(PKAccountUserCollection *)self->_accountUserCollection currentAccountUser];
    uint64_t v7 = v6;
    if (!v6) {
      goto LABEL_6;
    }
    char v8 = [v6 altDSID];
    uint64_t v9 = [v5 accountUserActivityForAccountUserAltDSID:v8];
    uint64_t v10 = [v9 rewardsBalance];

    if (!v10)
    {
LABEL_6:
      uint64_t v10 = [v5 rewardsBalance];
    }
    objc_initWeak(buf, self);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke;
    uint64_t v17 = &unk_1E59DA0C8;
    objc_copyWeak(&v21, buf);
    id v11 = v10;
    id v18 = v11;
    id v2 = v4;
    int v19 = v2;
    id v20 = self;
    uint64_t v12 = _Block_copy(&v14);
    uint64_t v13 = PKLocalizedFeatureString();
    -[PKDailyCashSelectionSectionController presentConfirmationAlertWithTitle:redemptionType:confirmationHandler:](self, "presentConfirmationAlertWithTitle:redemptionType:confirmationHandler:", v13, 2, v12, v14, v15, v16, v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }
}

void __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[9] = 2;
    [WeakRetained _reloadSection];
    id v6 = objc_alloc_init(MEMORY[0x1E4F841B0]);
    [v6 setActionType:0];
    [v6 setAmount:*(void *)(a1 + 32)];
    uint64_t v7 = [*(id *)(a1 + 40) currencyCode];
    [v6 setCurrencyCode:v7];

    [v6 setRedemptionType:2];
    char v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    [v6 setIdentifier:v9];

    uint64_t v10 = (void *)v5[11];
    id v11 = [(id)v5[3] accountIdentifier];
    uint64_t v12 = [(id)v5[4] currentAccountUser];
    uint64_t v13 = [v12 altDSID];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke_2;
    uint64_t v17 = &unk_1E59D1DB0;
    objc_copyWeak(&v19, (id *)(a1 + 56));
    uint64_t v18 = *(void *)(a1 + 48);
    [v10 performAccountAction:v6 withAccountIdentifier:v11 accountUserAltDSID:v13 completion:&v14];

    objc_msgSend(*(id *)(a1 + 48), "_reportDailyCashConfirmationEventWithRedemptionType:button:", 2, *MEMORY[0x1E4F861A8], v14, v15, v16, v17);
    objc_destroyWeak(&v19);
  }
}

void __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke_3;
  v10[3] = &unk_1E59CE888;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v14);
}

void __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v7 = WeakRetained;
      id v3 = PKAccountDisplayableError();
      id v4 = [*(id *)(a1 + 40) _presentingViewController];
      id v5 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      [v4 presentViewController:v5 animated:1 completion:0];
    }
    else
    {
      id v6 = *(void **)(a1 + 48);
      if (!v6) {
        goto LABEL_7;
      }
      uint64_t v7 = WeakRetained;
      objc_storeStrong(WeakRetained + 3, v6);
      v7[9] = 0;
      *((unsigned char *)v7 + 80) = 1;
      [v7 _reloadSection];
    }
    id WeakRetained = v7;
  }
LABEL_7:
}

- (void)_changeRewardsDestinationAndOpenAccountIfNeeded:(unint64_t)a3
{
  if (self->_loadingDestination)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Already changing rewards destination", (uint8_t *)buf, 2u);
    }
  }
  else if (a3 == 3)
  {
    id v5 = [(PKDailyCashSelectionSectionController *)self _eligibleAccountOfType:4];
    if (v5)
    {
      [(PKDailyCashSelectionSectionController *)self _changeRewardsDestination:3];
    }
    else
    {
      self->_loadingDestination = 3;
      [(PKDailyCashSelectionSectionController *)self _reloadSection];
      uint64_t v10 = [(PKAccount *)self->_account redeemRewardsFeatureDescriptor];
      id v11 = [v10 productForFeature:5];

      if (v11)
      {
        id v12 = objc_alloc(MEMORY[0x1E4F84BB8]);
        id v13 = [MEMORY[0x1E4F84D50] sharedService];
        id v14 = (void *)[v12 initWithWebService:v13];

        [v14 setReferrerIdentifier:@"cid%3Dapy-930-10001"];
        uint64_t v15 = [PKFeatureOnBoardingViewController alloc];
        id v16 = [v11 onboardingItems];
        uint64_t v17 = [v16 firstObject];
        uint64_t v18 = [(PKFeatureOnBoardingViewController *)v15 initWithParentFlowController:0 setupDelegate:0 setupContext:0 onboardingContext:0 featureIdentifier:5 provisioningController:v14 paymentSetupProduct:v11 currentPage:v17];

        objc_initWeak(buf, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __89__PKDailyCashSelectionSectionController__changeRewardsDestinationAndOpenAccountIfNeeded___block_invoke_240;
        aBlock[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v24, buf);
        id v19 = _Block_copy(aBlock);
        id v20 = [[PKNavigationController alloc] initWithRootViewController:v18];
        [(PKNavigationController *)v20 setModalInPresentation:1];
        id v21 = [(PKDailyCashSelectionSectionController *)self _presentingViewController];
        [v21 presentViewController:v20 animated:1 completion:v19];

        objc_destroyWeak(&v24);
        objc_destroyWeak(buf);
      }
      else
      {
        id v22 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Cannot retrieve savings product to present apply flow", (uint8_t *)buf, 2u);
        }

        self->_loadingDestination = 0;
        [(PKDailyCashSelectionSectionController *)self _reloadSection];
      }
    }
  }
  else if (a3 == 1)
  {
    if (PKUserHasDisabledPeerPayment())
    {
      [(PKDailyCashSelectionSectionController *)self _presentPeerPaymentNotEnabledAlert];
    }
    else
    {
      unint64_t v6 = [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController currentPeerPaymentAccountResolution];
      if (v6)
      {
        unint64_t v7 = v6;
        objc_initWeak(buf, self);
        self->_loadingDestination = 1;
        [(PKDailyCashSelectionSectionController *)self _reloadSection];
        id v8 = objc_alloc_init(MEMORY[0x1E4F84D60]);
        [v8 setRegistrationFlowState:6];
        peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __89__PKDailyCashSelectionSectionController__changeRewardsDestinationAndOpenAccountIfNeeded___block_invoke;
        v25[3] = &unk_1E59CB100;
        objc_copyWeak(&v26, buf);
        [(PKPeerPaymentAccountResolutionController *)peerPaymentAccountResolutionController presentFlowForAccountResolution:v7 configuration:v8 completion:v25];
        objc_destroyWeak(&v26);

        objc_destroyWeak(buf);
      }
      else
      {
        [(PKDailyCashSelectionSectionController *)self _changeRewardsDestination:1];
      }
    }
  }
}

void __89__PKDailyCashSelectionSectionController__changeRewardsDestinationAndOpenAccountIfNeeded___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[9] = 0;
    id v2 = WeakRetained;
    [WeakRetained _reloadSection];
    id WeakRetained = v2;
  }
}

void __89__PKDailyCashSelectionSectionController__changeRewardsDestinationAndOpenAccountIfNeeded___block_invoke_240(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[9] = 0;
    id v2 = WeakRetained;
    [WeakRetained _reloadSection];
    id WeakRetained = v2;
  }
}

- (void)_changeRewardsDestination:(unint64_t)a3
{
  if (self->_loadingDestination)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Already changing rewards destination", (uint8_t *)buf, 2u);
    }
  }
  if (a3 != 3)
  {
    if (a3 != 1)
    {
      unint64_t v6 = 0;
      id v7 = 0;
      goto LABEL_12;
    }
    unint64_t v6 = PKLocalizedFeatureString();
    id v7 = 0;
    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  unint64_t v6 = PKLocalizedFeatureString();
  id v8 = [(PKDailyCashSelectionSectionController *)self _eligibleAccountOfType:4];
  id v7 = [v8 accountIdentifier];

  if (v6)
  {
LABEL_10:
    objc_initWeak(buf, self);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke;
    id v13 = &unk_1E59DC600;
    objc_copyWeak(v16, buf);
    v16[1] = (id)a3;
    id v7 = v7;
    id v14 = v7;
    uint64_t v15 = self;
    id v9 = _Block_copy(&v10);
    -[PKDailyCashSelectionSectionController presentConfirmationAlertWithTitle:redemptionType:confirmationHandler:](self, "presentConfirmationAlertWithTitle:redemptionType:confirmationHandler:", v6, a3, v9, v10, v11, v12, v13);

    objc_destroyWeak(v16);
    objc_destroyWeak(buf);
  }
LABEL_12:
}

void __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[9] = *(void *)(a1 + 56);
    [WeakRetained _reloadSection];
    id v6 = objc_alloc_init(MEMORY[0x1E4F841B0]);
    [v6 setActionType:2];
    [v6 setRedemptionType:*(void *)(a1 + 56)];
    [v6 setIdentifier:*(void *)(a1 + 32)];
    objc_initWeak(&location, *(id *)(a1 + 40));
    id v7 = (void *)v5[11];
    id v8 = [(id)v5[3] accountIdentifier];
    id v9 = [(id)v5[4] currentAccountUser];
    uint64_t v10 = [v9 altDSID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke_2;
    v11[3] = &unk_1E59DC5D8;
    objc_copyWeak(v12, &location);
    v12[1] = *(id *)(a1 + 56);
    [v7 performAccountAction:v6 withAccountIdentifier:v8 accountUserAltDSID:v10 completion:v11];

    [*(id *)(a1 + 40) _reportDailyCashConfirmationEventWithRedemptionType:*(void *)(a1 + 56) button:*MEMORY[0x1E4F861A8]];
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

void __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke_3;
  v9[3] = &unk_1E59CE838;
  objc_copyWeak(v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  v12[1] = *(id *)(a1 + 40);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(v12);
}

void __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      id v3 = PKAccountDisplayableError();
      id v4 = [v7 _presentingViewController];
      id v5 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      [v4 presentViewController:v5 animated:1 completion:0];

      id WeakRetained = v7;
    }
    else
    {
      id v6 = *(void **)(a1 + 40);
      if (v6)
      {
        objc_storeStrong((id *)WeakRetained + 3, v6);
        id WeakRetained = v7;
        v7[8] = *(void *)(a1 + 56);
      }
    }
    *((void *)WeakRetained + 9) = 0;
    [WeakRetained _reloadSection];
    id WeakRetained = v7;
  }
}

- (void)_reportDailyCashConfirmationEventWithRedemptionType:(unint64_t)a3 button:(id)a4
{
  id v6 = a4;
  id v11 = [(PKDailyCashSelectionSectionController *)self analyticsEventReportWithPreSelect:0];
  if (a3 - 1 > 2) {
    id v7 = @"unknown";
  }
  else {
    id v7 = (__CFString *)**((id **)&unk_1E59DC658 + a3 - 1);
  }
  [v11 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F86730]];
  [v11 setObject:*MEMORY[0x1E4F86380] forKeyedSubscript:*MEMORY[0x1E4F86308]];
  [v11 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F86120]];

  id v8 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v9 = *MEMORY[0x1E4F86FF0];
  id v10 = (void *)[v11 copy];
  [v8 subject:v9 sendEvent:v10];
}

- (void)_reportDestinationButtonTapWithRedemptionType:(unint64_t)a3
{
  id v8 = [(PKDailyCashSelectionSectionController *)self analyticsEventReportWithPreSelect:0];
  [v8 setObject:*MEMORY[0x1E4F86210] forKeyedSubscript:*MEMORY[0x1E4F86730]];
  [v8 setObject:*MEMORY[0x1E4F86380] forKeyedSubscript:*MEMORY[0x1E4F86308]];
  if (a3 - 1 > 2) {
    id v4 = @"unknown";
  }
  else {
    id v4 = (__CFString *)**((id **)&unk_1E59DC640 + a3 - 1);
  }
  [v8 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F86120]];
  id v5 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v6 = *MEMORY[0x1E4F86FF0];
  id v7 = (void *)[v8 copy];
  [v5 subject:v6 sendEvent:v7];
}

- (void)presentConfirmationAlertWithTitle:(id)a3 redemptionType:(unint64_t)a4 confirmationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9 && [v8 length])
  {
    id v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:0 preferredStyle:1];
    id v11 = (void *)MEMORY[0x1E4FB1410];
    id v12 = PKLocalizedFeatureString();
    id v13 = [v11 actionWithTitle:v12 style:0 handler:v9];
    [v10 addAction:v13];

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __110__PKDailyCashSelectionSectionController_presentConfirmationAlertWithTitle_redemptionType_confirmationHandler___block_invoke;
    aBlock[3] = &unk_1E59D7D40;
    objc_copyWeak(v21, &location);
    v21[1] = (id)a4;
    id v14 = _Block_copy(aBlock);
    uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = PKLocalizedFeatureString();
    uint64_t v17 = [v15 actionWithTitle:v16 style:1 handler:v14];
    [v10 addAction:v17];

    uint64_t v18 = [(PKDailyCashSelectionSectionController *)self _presentingViewController];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __110__PKDailyCashSelectionSectionController_presentConfirmationAlertWithTitle_redemptionType_confirmationHandler___block_invoke_2;
    v19[3] = &unk_1E59CB460;
    void v19[4] = self;
    v19[5] = a4;
    [v18 presentViewController:v10 animated:1 completion:v19];

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
}

void __110__PKDailyCashSelectionSectionController_presentConfirmationAlertWithTitle_redemptionType_confirmationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _reportDailyCashConfirmationEventWithRedemptionType:*(void *)(a1 + 40) button:*MEMORY[0x1E4F86148]];
    id WeakRetained = v3;
  }
}

void __110__PKDailyCashSelectionSectionController_presentConfirmationAlertWithTitle_redemptionType_confirmationHandler___block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) analyticsEventReportWithPreSelect:0];
  unint64_t v2 = *(void *)(a1 + 40) - 1;
  if (v2 > 2) {
    id v3 = @"unknown";
  }
  else {
    id v3 = (__CFString *)**((id **)&unk_1E59DC658 + v2);
  }
  [v7 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F86730]];
  [v7 setObject:*MEMORY[0x1E4F864A0] forKeyedSubscript:*MEMORY[0x1E4F86308]];
  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F86FF0];
  uint64_t v6 = (void *)[v7 copy];
  [v4 subject:v5 sendEvent:v6];
}

- (void)_presentPeerPaymentNotEnabledAlert
{
  PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentErr_1.isa);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentErr_2.isa);
  id v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v3 preferredStyle:1];
  uint64_t v5 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v6 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentErr_5.isa);
  id v7 = [v5 actionWithTitle:v6 style:0 handler:&__block_literal_global_270];

  [v4 addAction:v7];
  id v8 = (void *)MEMORY[0x1E4FB1410];
  id v9 = PKLocalizedString(&cfstr_Cancel.isa);
  id v10 = [v8 actionWithTitle:v9 style:1 handler:0];
  [v4 addAction:v10];

  id v11 = [(PKDailyCashSelectionSectionController *)self _presentingViewController];
  [v11 presentViewController:v4 animated:1 completion:0];
}

void __75__PKDailyCashSelectionSectionController__presentPeerPaymentNotEnabledAlert__block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSBOOK"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (void)accountAdded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PKDailyCashSelectionSectionController_accountAdded___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __54__PKDailyCashSelectionSectionController_accountAdded___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) arrayByAddingObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  id v5 = *(void **)(a1 + 32);

  return [v5 _reloadSection];
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PKDailyCashSelectionSectionController_accountChanged___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__PKDailyCashSelectionSectionController_accountChanged___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  id v3 = (id)[v2 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v7 = objc_msgSend(*(id *)(a1 + 40), "accountIdentifier", (void)v28);
        id v8 = [v6 accountIdentifier];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {

LABEL_18:
          id v3 = v6;
          goto LABEL_19;
        }
        id v11 = v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {
        }
        else
        {
          char v13 = [v9 isEqualToString:v10];

          if (v13) {
            goto LABEL_18;
          }
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  uint64_t v14 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "pk_arrayByRemovingObject:", v3);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 48);
  *(void *)(v15 + 48) = v14;

  uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 48) arrayByAddingObject:*(void *)(a1 + 40)];
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 48);
  *(void *)(v18 + 48) = v17;

  id v20 = [*(id *)(a1 + 40) accountIdentifier];
  id v21 = [*(id *)(*(void *)(a1 + 32) + 24) accountIdentifier];
  id v22 = v20;
  id v23 = v21;
  if (v22 == v23)
  {
  }
  else
  {
    id v24 = v23;
    if (!v22 || !v23)
    {

      goto LABEL_27;
    }
    char v25 = [v22 isEqualToString:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_28;
    }
  }
  uint64_t v26 = *(void *)(a1 + 32);
  id v27 = *(id *)(a1 + 40);
  id v22 = *(id *)(v26 + 24);
  *(void *)(v26 + 24) = v27;
LABEL_27:

LABEL_28:
  objc_msgSend(*(id *)(a1 + 32), "_reloadSection", (void)v28);
}

- (void)accountRemoved:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PKDailyCashSelectionSectionController_accountRemoved___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__PKDailyCashSelectionSectionController_accountRemoved___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  id v3 = (id)[v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v7 = objc_msgSend(*(id *)(a1 + 40), "accountIdentifier", (void)v17);
        id v8 = [v6 accountIdentifier];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {

LABEL_18:
          id v3 = v6;
          goto LABEL_19;
        }
        id v11 = v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {
        }
        else
        {
          char v13 = [v9 isEqualToString:v10];

          if (v13) {
            goto LABEL_18;
          }
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  uint64_t v14 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "pk_arrayByRemovingObject:", v3);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 48);
  *(void *)(v15 + 48) = v14;

  [*(id *)(a1 + 32) _reloadSection];
}

- (void)featureApplicationAdded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKDailyCashSelectionSectionController_featureApplicationAdded___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __65__PKDailyCashSelectionSectionController_featureApplicationAdded___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) arrayByAddingObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "pk_firstObjectPassingTest:", &__block_literal_global_280);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v5;

  id v8 = *(void **)(a1 + 32);

  return [v8 _reloadSection];
}

BOOL __65__PKDailyCashSelectionSectionController_featureApplicationAdded___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 feature] == 5 && objc_msgSend(v2, "applicationState") == 5;

  return v3;
}

- (void)featureApplicationChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PKDailyCashSelectionSectionController_featureApplicationChanged___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __67__PKDailyCashSelectionSectionController_featureApplicationChanged___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  id v3 = (id)[v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v7 = objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier", (void)v23);
        id v8 = [v6 accountIdentifier];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {

LABEL_18:
          id v3 = v6;
          goto LABEL_19;
        }
        id v11 = v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {
        }
        else
        {
          char v13 = [v9 isEqualToString:v10];

          if (v13) {
            goto LABEL_18;
          }
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  uint64_t v14 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "pk_arrayByRemovingObject:", v3);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 56);
  *(void *)(v15 + 56) = v14;

  uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 56) arrayByAddingObject:*(void *)(a1 + 40)];
  uint64_t v18 = *(void *)(a1 + 32);
  long long v19 = *(void **)(v18 + 56);
  *(void *)(v18 + 56) = v17;

  uint64_t v20 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "pk_firstObjectPassingTest:", &__block_literal_global_282);
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v22 = *(void **)(v21 + 112);
  *(void *)(v21 + 112) = v20;

  [*(id *)(a1 + 32) _reloadSection];
}

BOOL __67__PKDailyCashSelectionSectionController_featureApplicationChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 feature] == 5 && objc_msgSend(v2, "applicationState") == 5;

  return v3;
}

- (void)featureApplicationRemoved:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PKDailyCashSelectionSectionController_featureApplicationRemoved___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __67__PKDailyCashSelectionSectionController_featureApplicationRemoved___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  id v3 = (id)[v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v7 = objc_msgSend(*(id *)(a1 + 40), "accountIdentifier", (void)v20);
        id v8 = [v6 accountIdentifier];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {

LABEL_18:
          id v3 = v6;
          goto LABEL_19;
        }
        id v11 = v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {
        }
        else
        {
          char v13 = [v9 isEqualToString:v10];

          if (v13) {
            goto LABEL_18;
          }
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  uint64_t v14 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "pk_arrayByRemovingObject:", v3);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 56);
  *(void *)(v15 + 56) = v14;

  uint64_t v17 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "pk_firstObjectPassingTest:", &__block_literal_global_284);
  uint64_t v18 = *(void *)(a1 + 32);
  long long v19 = *(void **)(v18 + 112);
  *(void *)(v18 + 112) = v17;

  [*(id *)(a1 + 32) _reloadSection];
}

BOOL __67__PKDailyCashSelectionSectionController_featureApplicationRemoved___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 feature] == 5 && objc_msgSend(v2, "applicationState") == 5;

  return v3;
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(PKDailyCashSelectionSectionController *)self _presentingViewController];
  [v7 presentViewController:v6 animated:1 completion:0];
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  [(PKDailyCashSelectionSectionController *)self _reloadSection];
  id v5 = [(PKDailyCashSelectionSectionController *)self _presentingViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)paymentSetupDidFinish:(id)a3
{
  [(PKDailyCashSelectionSectionController *)self _reloadSection];
  id v4 = [(PKDailyCashSelectionSectionController *)self _presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDailyCashSelectionItems, 0);
  objc_storeStrong((id *)&self->_pendingSavingsApplication, 0);
  objc_storeStrong((id *)&self->_applyService, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end