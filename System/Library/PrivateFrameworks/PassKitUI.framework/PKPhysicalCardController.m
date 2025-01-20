@interface PKPhysicalCardController
- (BOOL)_userSupportsActivatingPhysicalCard;
- (BOOL)_userSupportsRequestingPhysicalCard;
- (BOOL)canActivatePhysicalCard;
- (BOOL)canReplacePhysicalCard;
- (BOOL)canRequestNewPhysicalCard;
- (BOOL)hasExpiredPhysicalCardOnly;
- (BOOL)hasPrimaryPhysicalCard;
- (BOOL)physicalCardBlocked;
- (BOOL)primaryPhysicalCardEnabled;
- (NSDate)primaryPhysicalCardExpirationDate;
- (NSSet)physicalCards;
- (PKAccount)account;
- (PKAccountUser)accountUser;
- (PKPaymentPass)paymentPass;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (PKPhysicalCard)expiredPhysicalCard;
- (PKPhysicalCard)primaryPhysicalCard;
- (PKPhysicalCard)unactivatedPhysicalCard;
- (PKPhysicalCardController)initWithAccountService:(id)a3 paymentPass:(id)a4 account:(id)a5 accountUser:(id)a6 physicalCards:(id)a7;
- (PKSetupFlowControllerProtocol)parentFlowController;
- (void)_updatePhysicalCards;
- (void)dealloc;
- (void)nextViewControllerWithCompletion:(id)a3;
- (void)orderFlowViewControllerForReason:(unint64_t)a3 content:(int64_t)a4 completion:(id)a5;
- (void)replaceFlowViewControllerForReason:(unint64_t)a3 content:(int64_t)a4 currentPhysicalCard:(id)a5 completion:(id)a6;
- (void)setParentFlowController:(id)a3;
- (void)setSetupDelegate:(id)a3;
- (void)updateWithAccount:(id)a3;
- (void)updateWithPhysicalCards:(id)a3;
@end

@implementation PKPhysicalCardController

- (PKPhysicalCardController)initWithAccountService:(id)a3 paymentPass:(id)a4 account:(id)a5 accountUser:(id)a6 physicalCards:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PKPhysicalCardController;
  v17 = [(PKPhysicalCardController *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a5);
    objc_storeStrong((id *)&v18->_accountService, a3);
    objc_storeStrong((id *)&v18->_paymentPass, a4);
    objc_storeStrong((id *)&v18->_accountUser, a6);
    uint64_t v19 = [v16 copy];
    physicalCards = v18->_physicalCards;
    v18->_physicalCards = (NSSet *)v19;

    [(PKPhysicalCardController *)v18 _updatePhysicalCards];
  }

  return v18;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPhysicalCardController;
  [(PKPhysicalCardController *)&v4 dealloc];
}

- (void)updateWithAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);

  [(PKPhysicalCardController *)self _updatePhysicalCards];
}

- (void)updateWithPhysicalCards:(id)a3
{
  objc_super v4 = (NSSet *)[a3 copy];
  physicalCards = self->_physicalCards;
  self->_physicalCards = v4;

  [(PKPhysicalCardController *)self _updatePhysicalCards];
}

- (BOOL)hasPrimaryPhysicalCard
{
  return self->_primaryPhysicalCard != 0;
}

- (BOOL)canActivatePhysicalCard
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_unactivatedPhysicalCard && [(PKAccount *)self->_account state] == 1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = [(PKPhysicalCard *)self->_unactivatedPhysicalCard orderActivity];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) activity] == 2)
          {

            return [(PKPhysicalCardController *)self _userSupportsActivatingPhysicalCard];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  return 0;
}

- (BOOL)canRequestNewPhysicalCard
{
  if ([(PKPhysicalCardController *)self canReplacePhysicalCard]) {
    return 0;
  }
  if (self->_unactivatedPhysicalCard) {
    return 0;
  }
  if (self->_primaryPhysicalCard) {
    return 0;
  }
  if ([(PKAccount *)self->_account state] != 1) {
    return 0;
  }
  if ([(PKAccountUser *)self->_accountUser accessLevel] == 2)
  {
    v3 = [(PKAccountUser *)self->_accountUser preferences];
    int v4 = [v3 spendingEnabled];

    if (!v4) {
      return 0;
    }
  }

  return [(PKPhysicalCardController *)self _userSupportsRequestingPhysicalCard];
}

- (BOOL)canReplacePhysicalCard
{
  if (![(PKPhysicalCardController *)self hasPrimaryPhysicalCard]
    && ![(PKPhysicalCardController *)self hasExpiredPhysicalCardOnly]
    || self->_unactivatedPhysicalCard
    || [(PKAccount *)self->_account state] != 1
    || [(PKPhysicalCard *)self->_primaryPhysicalCard state] == 4)
  {
    return 0;
  }

  return [(PKPhysicalCardController *)self _userSupportsRequestingPhysicalCard];
}

- (BOOL)_userSupportsRequestingPhysicalCard
{
  p_accountUser = &self->_accountUser;
  accountUser = self->_accountUser;
  if (!accountUser || [(PKAccountUser *)accountUser isCurrentUser]) {
    p_accountUser = &self->_account;
  }
  uint64_t v5 = *p_accountUser;

  return [(PKAccountUser *)v5 supportsRequestPhysicalCard];
}

- (BOOL)_userSupportsActivatingPhysicalCard
{
  p_accountUser = &self->_accountUser;
  accountUser = self->_accountUser;
  if (!accountUser || [(PKAccountUser *)accountUser isCurrentUser]) {
    p_accountUser = &self->_account;
  }
  uint64_t v5 = *p_accountUser;

  return [(PKAccountUser *)v5 supportsPhysicalCardActivation];
}

- (BOOL)primaryPhysicalCardEnabled
{
  BOOL v3 = [(PKPhysicalCardController *)self hasPrimaryPhysicalCard];
  if (v3) {
    LOBYTE(v3) = [(PKPhysicalCard *)self->_primaryPhysicalCard state] == 2;
  }
  return v3;
}

- (BOOL)physicalCardBlocked
{
  BOOL v3 = [(PKPhysicalCardController *)self hasPrimaryPhysicalCard];
  if (v3) {
    LOBYTE(v3) = [(PKPhysicalCard *)self->_primaryPhysicalCard state] == 4
  }
              && self->_unactivatedPhysicalCard == 0;
  return v3;
}

- (BOOL)hasExpiredPhysicalCardOnly
{
  return ![(PKPhysicalCardController *)self hasPrimaryPhysicalCard]
      && !self->_unactivatedPhysicalCard
      && self->_expiredPhysicalCard != 0;
}

- (NSDate)primaryPhysicalCardExpirationDate
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  int v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v5 = [(PKAccount *)self->_account productTimeZone];
  [v4 setTimeZone:v5];

  uint64_t v6 = [(PKPhysicalCard *)self->_primaryPhysicalCard expirationDateInCalendar:v4];

  return (NSDate *)v6;
}

- (void)replaceFlowViewControllerForReason:(unint64_t)a3 content:(int64_t)a4 currentPhysicalCard:(id)a5 completion:(id)a6
{
  id v10 = a6;
  if (v10)
  {
    id v11 = a5;
    long long v12 = [PKOrderPhysicalCardController alloc];
    accountService = self->_accountService;
    uint64_t v14 = [MEMORY[0x1E4F84D50] sharedService];
    id v15 = [(PKOrderPhysicalCardController *)v12 initWithAccountService:accountService paymentWebService:v14 paymentPass:self->_paymentPass account:self->_account accountUser:self->_accountUser orderReason:a3 context:a4 currentPhysicalCard:v11];

    [(PKOrderPhysicalCardController *)v15 setParentFlowController:self];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke;
    v17[3] = &unk_1E59D2210;
    v18 = v15;
    uint64_t v19 = self;
    id v20 = v10;
    id v16 = v15;
    [(PKOrderPhysicalCardController *)v16 updateCustomizationOptionsWithCompletion:v17];
  }
}

void __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke_2;
  block[3] = &unk_1E59CEAE8;
  char v15 = a2;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v14 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = [[PKOrderPhysicalCardAddressConfirmationViewController alloc] initWithOrderPhysicalCardController:*(void *)(a1 + 32)];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
    [(PKOrderPhysicalCardAddressConfirmationViewController *)v2 setDelegate:WeakRetained];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke_3;
    v7[3] = &unk_1E59CA820;
    id v4 = *(id *)(a1 + 56);
    v8 = v2;
    id v9 = v4;
    id v5 = v2;
    [(PKOrderPhysicalCardAddressConfirmationViewController *)v5 preflightWithCompletion:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

uint64_t __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Failed to preflight: %@", (uint8_t *)&v8, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)orderFlowViewControllerForReason:(unint64_t)a3 content:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = [PKOrderPhysicalCardController alloc];
    accountService = self->_accountService;
    id v11 = [MEMORY[0x1E4F84D50] sharedService];
    uint64_t v12 = [(PKOrderPhysicalCardController *)v9 initWithAccountService:accountService paymentWebService:v11 paymentPass:self->_paymentPass account:self->_account accountUser:self->_accountUser orderReason:a3 context:a4 currentPhysicalCard:0];

    [(PKOrderPhysicalCardController *)v12 setParentFlowController:self];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke;
    v14[3] = &unk_1E59D2210;
    char v15 = v12;
    id v16 = self;
    id v17 = v8;
    id v13 = v12;
    [(PKOrderPhysicalCardController *)v13 updateCustomizationOptionsWithCompletion:v14];
  }
}

void __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke_2;
  block[3] = &unk_1E59CEAE8;
  char v15 = a2;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v14 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = [[PKOrderPhysicalCardViewController alloc] initWithController:*(void *)(a1 + 32)];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
    [(PKOrderPhysicalCardViewController *)v2 setDelegate:WeakRetained];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke_3;
    v7[3] = &unk_1E59CA820;
    id v4 = *(id *)(a1 + 56);
    id v8 = v2;
    id v9 = v4;
    id v5 = v2;
    [(PKOrderPhysicalCardViewController *)v5 preflightWithCompletion:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

uint64_t __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Failed to preflight: %@", (uint8_t *)&v8, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  parentFlowController = self->_parentFlowController;
  if (parentFlowController)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__PKPhysicalCardController_nextViewControllerWithCompletion___block_invoke;
    v7[3] = &unk_1E59D5740;
    void v7[4] = self;
    id v8 = v4;
    [(PKSetupFlowControllerProtocol *)parentFlowController nextViewControllerWithCompletion:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __61__PKPhysicalCardController_nextViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;
}

- (void)_updatePhysicalCards
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PKCurrentUserAltDSID();
  uint64_t v4 = [(PKAccountUser *)self->_accountUser altDSID];
  id v5 = (void *)v4;
  v37 = (void *)v3;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = (void *)v3;
  }
  id v36 = v6;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v33 = self;
  obj = self->_physicalCards;
  uint64_t v7 = [(NSSet *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v7)
  {
    v34 = 0;
    id v9 = 0;
    id v10 = 0;
    goto LABEL_34;
  }
  uint64_t v8 = v7;
  v34 = 0;
  id v9 = 0;
  id v10 = 0;
  uint64_t v11 = *(void *)v39;
  uint64_t v32 = *MEMORY[0x1E4F1C318];
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v39 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      uint64_t v14 = objc_msgSend(v13, "accountUserAltDSID", v32);
      char v15 = (void *)v14;
      id v16 = v37;
      if (v14) {
        id v16 = (void *)v14;
      }
      id v17 = v16;

      if (!v17) {
        goto LABEL_17;
      }
      id v18 = v17;
      id v19 = v36;
      id v20 = v19;
      if (v18 == v19)
      {

LABEL_17:
        uint64_t v22 = [v13 state];
        if ((unint64_t)(v22 - 2) >= 3)
        {
          if (v22 == 5)
          {
            objc_super v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v32];
            v24 = [(PKAccount *)v33->_account productTimeZone];
            [v23 setTimeZone:v24];

            if ([v13 isExpiredInCalendar:v23])
            {
              id v25 = v13;

              v34 = v25;
            }
          }
          else
          {
            if (v22 != 1)
            {
LABEL_26:
              if (v10 && v9 && v34)
              {

                goto LABEL_34;
              }
              goto LABEL_29;
            }
            objc_super v23 = v9;
            id v9 = v13;
          }
        }
        else
        {
          objc_super v23 = v10;
          id v10 = v13;
        }

        goto LABEL_26;
      }
      if (!v36)
      {

        goto LABEL_29;
      }
      int v21 = [v18 isEqualToString:v19];

      if (v21) {
        goto LABEL_17;
      }
LABEL_29:
    }
    uint64_t v8 = [(NSSet *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_34:

  unactivatedPhysicalCard = v33->_unactivatedPhysicalCard;
  v33->_unactivatedPhysicalCard = (PKPhysicalCard *)v9;
  id v27 = v9;

  primaryPhysicalCard = v33->_primaryPhysicalCard;
  v33->_primaryPhysicalCard = (PKPhysicalCard *)v10;
  id v29 = v10;

  expiredPhysicalCard = v33->_expiredPhysicalCard;
  v33->_expiredPhysicalCard = (PKPhysicalCard *)v34;
  id v31 = v34;
}

- (PKAccount)account
{
  return self->_account;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (PKSetupFlowControllerProtocol)parentFlowController
{
  return self->_parentFlowController;
}

- (void)setParentFlowController:(id)a3
{
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (PKPhysicalCard)unactivatedPhysicalCard
{
  return self->_unactivatedPhysicalCard;
}

- (PKPhysicalCard)primaryPhysicalCard
{
  return self->_primaryPhysicalCard;
}

- (PKPhysicalCard)expiredPhysicalCard
{
  return self->_expiredPhysicalCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiredPhysicalCard, 0);
  objc_storeStrong((id *)&self->_primaryPhysicalCard, 0);
  objc_storeStrong((id *)&self->_unactivatedPhysicalCard, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_parentFlowController, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_accountService, 0);
}

@end