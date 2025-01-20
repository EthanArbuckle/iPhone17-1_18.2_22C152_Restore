@interface PKPayLaterPaymentIntentController
- (PKAccount)payLaterAccount;
- (PKPayLaterAvailableFundingSourcesFilter)availableFundingSourcesFilter;
- (PKPayLaterPaymentIntentController)initWithPayLaterAccount:(id)a3 paymentWebService:(id)a4 passLibrary:(id)a5 peerPaymentWebService:(id)a6 accountService:(id)a7 defaultPassUniqueIdentifier:(id)a8;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (id)availableFundingSourcesForPaymentIntentDetails:(id)a3 currencyAmount:(id)a4 planIdentifier:(id)a5 primaryPaymentSource:(id)a6;
- (id)payLaterPaymentRequestWithIntentDetails:(id)a3 financingPlan:(id)a4 primaryPaymentSource:(id)a5 intent:(unint64_t)a6 currencyAmount:(id)a7;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)_executeNextRequest:(id)a3;
- (void)_peerPaymentAccountChanged;
- (void)_presentPaymentAuthorizationWithPaymentRequest:(id)a3 presentationSceneIdentifier:(id)a4 completion:(id)a5;
- (void)accountChanged:(id)a3;
- (void)dealloc;
- (void)intentDetailsForFinancingPlan:(id)a3 intent:(unint64_t)a4 completion:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
- (void)presentPaymentAuthorizationForFinancingPlan:(id)a3 primaryPaymentSource:(id)a4 intentDetails:(id)a5 intent:(unint64_t)a6 currencyAmount:(id)a7 presentationSceneIdentifier:(id)a8 completion:(id)a9;
- (void)setPayLaterAccount:(id)a3;
@end

@implementation PKPayLaterPaymentIntentController

- (PKPayLaterPaymentIntentController)initWithPayLaterAccount:(id)a3 paymentWebService:(id)a4 passLibrary:(id)a5 peerPaymentWebService:(id)a6 accountService:(id)a7 defaultPassUniqueIdentifier:(id)a8
{
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v35.receiver = self;
  v35.super_class = (Class)PKPayLaterPaymentIntentController;
  v18 = [(PKPayLaterPaymentIntentController *)&v35 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_paymentWebService, a4);
    objc_storeStrong((id *)&v19->_passLibrary, a5);
    objc_storeStrong((id *)&v19->_defaultPassUniqueIdentifier, a8);
    objc_storeStrong((id *)&v19->_payLaterAccount, a3);
    objc_storeStrong((id *)&v19->_peerPaymentWebService, a6);
    v20 = [(PKPeerPaymentWebService *)v19->_peerPaymentWebService targetDevice];
    uint64_t v21 = [v20 account];
    peerPaymentAccount = v19->_peerPaymentAccount;
    v19->_peerPaymentAccount = (PKPeerPaymentAccount *)v21;

    objc_storeStrong((id *)&v19->_accountService, a7);
    [(PKAccountService *)v19->_accountService registerObserver:v19];
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cacheByIntentType = v19->_cacheByIntentType;
    v19->_cacheByIntentType = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requests = v19->_requests;
    v19->_requests = v25;

    v27 = [[PKPayLaterAvailableFundingSourcesFilter alloc] initWithPassLibrary:v19->_passLibrary peerPaymentAccount:v19->_peerPaymentAccount defaultPassUniqueIdentifier:v19->_defaultPassUniqueIdentifier];
    availableFundingSourcesFilter = v19->_availableFundingSourcesFilter;
    v19->_availableFundingSourcesFilter = v27;

    v19->_lock._os_unfair_lock_opaque = 0;
    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v30 = [(PKPeerPaymentWebService *)v19->_peerPaymentWebService targetDevice];
    [v29 addObserver:v19 selector:sel__peerPaymentAccountChanged name:@"PKPeerPaymentTargetDeviceAccountDidChangeNotification" object:v30];
  }
  return v19;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
  [v3 removeObserver:self name:@"PKPeerPaymentTargetDeviceAccountDidChangeNotification" object:v4];

  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterPaymentIntentController;
  [(PKPayLaterPaymentIntentController *)&v5 dealloc];
}

- (void)intentDetailsForFinancingPlan:(id)a3 intent:(unint64_t)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 planIdentifier];
  v11 = (void *)v10;
  if (!a4 || !v10 || [v8 state] == 6 || objc_msgSend(v8, "state") == 5 || objc_msgSend(v8, "state") == 8)
  {
    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    cacheByIntentType = self->_cacheByIntentType;
    v14 = [NSNumber numberWithUnsignedInteger:a4];
    id v15 = [(NSMutableDictionary *)cacheByIntentType objectForKey:v14];

    v25 = v15;
    id v16 = [v15 objectForKey:v11];
    id v17 = [[PKPayLaterFinancingPlanPaymentIntentRequest alloc] initWithPlanIdentifier:v11 intent:a4 completion:v9];
    requests = self->_requests;
    v19 = [(PKPayLaterFinancingPlanPaymentIntentRequest *)v17 identifier];
    v20 = [(NSMutableDictionary *)requests objectForKey:v19];

    if (v16)
    {
      uint64_t v21 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = PKFinancingPlanPaymentIntentTypeToString(a4);
        *(_DWORD *)buf = 138412802;
        v27 = v16;
        __int16 v28 = 2112;
        v29 = v11;
        __int16 v30 = 2112;
        v31 = v22;
        _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Using cached financing plan intent details %@ for planIdentifier %@, intent \"%@\"", buf, 0x20u);
      }
      os_unfair_lock_unlock(p_lock);
      if (v9) {
        (*((void (**)(id, void *, void))v9 + 2))(v9, v16, 0);
      }
    }
    else if (v20)
    {
      [v20 coalesceWithRequest:v17];

      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v23 = self->_requests;
      v24 = [(PKPayLaterFinancingPlanPaymentIntentRequest *)v17 identifier];
      [(NSMutableDictionary *)v23 setObject:v17 forKey:v24];

      os_unfair_lock_unlock(&self->_lock);
      if (v17)
      {
        [(PKPayLaterPaymentIntentController *)self _executeNextRequest:v17];
      }
    }
  }
}

- (id)payLaterPaymentRequestWithIntentDetails:(id)a3 financingPlan:(id)a4 primaryPaymentSource:(id)a5 intent:(unint64_t)a6 currencyAmount:(id)a7
{
  id v12 = a7;
  peerPaymentAccount = self->_peerPaymentAccount;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(PKPeerPaymentAccount *)peerPaymentAccount currentBalance];
  v18 = [v17 currency];
  v19 = [v12 currency];
  id v20 = v18;
  id v21 = v19;
  unint64_t v34 = a6;
  if (v20 == v21)
  {
  }
  else
  {
    v22 = v21;
    if (!v20 || !v21)
    {

      BOOL v24 = 0;
      goto LABEL_9;
    }
    char v23 = [v20 isEqualToString:v21];

    if ((v23 & 1) == 0)
    {
      BOOL v24 = 0;
      goto LABEL_10;
    }
  }
  id v20 = [v17 amount];
  v22 = [v12 amount];
  BOOL v24 = [v20 compare:v22] != -1;
LABEL_9:

LABEL_10:
  v25 = [v15 planIdentifier];
  v26 = [(PKPayLaterPaymentIntentController *)self availableFundingSourcesForPaymentIntentDetails:v16 currencyAmount:v12 planIdentifier:v25 primaryPaymentSource:v14];

  v27 = [PKPayLaterPaymentRequest alloc];
  payLaterAccount = self->_payLaterAccount;
  v29 = [(PKAccount *)payLaterAccount payLaterDetails];
  __int16 v30 = [v29 countryCode];
  LOBYTE(v33) = v24;
  v31 = [(PKPayLaterPaymentRequest *)v27 initWithIntentDetails:v16 payLaterAccount:payLaterAccount financingPlan:v15 intent:v34 acceptedFundingSources:v26 currencyAmount:v12 hasAdequateAppleCashBalance:v33 countryCode:v30];

  return v31;
}

- (id)availableFundingSourcesForPaymentIntentDetails:(id)a3 currencyAmount:(id)a4 planIdentifier:(id)a5 primaryPaymentSource:(id)a6
{
  return [(PKPayLaterAvailableFundingSourcesFilter *)self->_availableFundingSourcesFilter availableFundingSourcesForPaymentIntentDetails:a3 currencyAmount:a4 planIdentifier:a5 primaryPaymentSource:a6];
}

- (void)setPayLaterAccount:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PKPayLaterPaymentIntentController_setPayLaterAccount___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__PKPayLaterPaymentIntentController_setPayLaterAccount___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(void *)(a1 + 40) + 104);
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (v2 == v3) {
      return;
    }
  }
  else
  {
    char v5 = objc_msgSend(v2, "isEqual:");
    if (v5) {
      return;
    }
    v3 = *(void **)(*(void *)(a1 + 40) + 104);
  }
  v6 = [v3 accountIdentifier];
  id v7 = [*(id *)(a1 + 32) accountIdentifier];
  id v12 = v6;
  id v8 = v7;
  if (v12 == v8)
  {

LABEL_21:
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 104), *(id *)(a1 + 32));
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 80));
    [*(id *)(*(void *)(a1 + 40) + 64) removeAllObjects];
    v11 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 80);
    os_unfair_lock_unlock(v11);
    return;
  }
  if (v12) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char v10 = [v12 isEqualToString:v8];

    if ((v10 & 1) == 0) {
      return;
    }
    goto LABEL_21;
  }
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_authorizationCoordinator == v4)
  {
    char v5 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      char v10 = "-[PKPayLaterPaymentIntentController paymentAuthorizationCoordinatorDidFinish:]";
      __int16 v11 = 2048;
      id v12 = self;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "%s %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    block[3] = &unk_1E56DD038;
    objc_copyWeak(&v8, (id *)buf);
    block[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    char v5 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

    v6 = (void *)v4[11];
    v4[11] = 0;

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
    uint64_t v7 = *(void *)(a1 + 32);
    char v8 = *(unsigned char *)(v7 + 84) ^ 1;
    *(unsigned char *)(v7 + 84) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
    BOOL v9 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
    v10[3] = &unk_1E56E0450;
    objc_copyWeak(&v11, v2);
    char v12 = v8;
    [v9 dismissWithCompletion:v10];
    objc_destroyWeak(&v11);
  }
}

void __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3;
  v2[3] = &unk_1E56E0450;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  char v4 = *(unsigned char *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
}

void __78__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[2];
    v6 = v3;
    if (v4)
    {
      (*(void (**)(uint64_t, void, uint64_t, void))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 40), 1, 0);
      id v3 = v6;
      char v5 = (void *)v6[2];
    }
    else
    {
      char v5 = 0;
    }
    v3[2] = 0;

    id v3 = v6;
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[PKPayLaterPaymentIntentController paymentAuthorizationCoordinator:didAuthorizePayment:handler:]";
    __int16 v19 = 2048;
    id v20 = self;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "%s %p: didAuthorizePayment: callback called.", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_didAuthorizePayment = 1;
  [(NSMutableDictionary *)self->_cacheByIntentType removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Updating financing plans following a successful one time payment.", buf, 2u);
  }

  accountService = self->_accountService;
  uint64_t v13 = [(PKAccount *)self->_payLaterAccount accountIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke;
  v15[3] = &unk_1E56D90D8;
  id v16 = v10;
  id v14 = v10;
  [(PKAccountService *)accountService updateFinancingPlansForAccountWithIdentifier:v13 pageOffset:0 limit:0 ignoreLastUpdatedDate:0 forceFetch:0 completion:v15];
}

void __97__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2;
  block[3] = &unk_1E56D8360;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __97__PKPayLaterPaymentIntentController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Completed updating financing plans following a successful one time payment.", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = [[PKPaymentAuthorizationResult alloc] initWithStatus:0 errors:0];
    (*(void (**)(uint64_t, PKPaymentAuthorizationResult *))(v3 + 16))(v3, v4);
  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  return self->_presentationSceneIdentifier;
}

- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
{
  if (a5)
  {
    v6 = (void (**)(id, id, void))a5;
    uint64_t v7 = [PKPaymentRequestPaymentMethodUpdate alloc];
    id v8 = [(PKPaymentRequest *)self->_currentPaymentRequest paymentSummaryItems];
    id v9 = [(PKPaymentRequestPaymentMethodUpdate *)v7 initWithPaymentSummaryItems:v8];

    v6[2](v6, v9, 0);
  }
}

- (void)_executeNextRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 intent];
  v6 = [v4 planIdentifier];
  uint64_t v7 = objc_alloc_init(PKAccountWebServiceFinancingPlanPaymentIntentRequest);
  id v8 = [(PKAccount *)self->_payLaterAccount accountIdentifier];
  [(PKAccountWebServiceFinancingPlanPaymentIntentRequest *)v7 setAccountIdentifier:v8];

  [(PKAccountWebServiceFinancingPlanPaymentIntentRequest *)v7 setIntent:v5];
  [(PKAccountWebServiceFinancingPlanPaymentIntentRequest *)v7 setPlanIdentifier:v6];
  id v9 = [(PKAccount *)self->_payLaterAccount accountBaseURL];
  [(PKAccountWebServiceFinancingPlanPaymentIntentRequest *)v7 setBaseURL:v9];

  id v10 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = PKFinancingPlanPaymentIntentTypeToString(v5);
    *(_DWORD *)buf = 138412546;
    __int16 v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Fetching financing plan intent details for planIdentifier %@, intent \"%@\"", buf, 0x16u);
  }
  paymentWebService = self->_paymentWebService;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__PKPayLaterPaymentIntentController__executeNextRequest___block_invoke;
  v14[3] = &unk_1E56E0478;
  v14[4] = self;
  id v15 = v4;
  id v16 = v6;
  unint64_t v17 = v5;
  id v13 = v4;
  [(PKPaymentWebService *)paymentWebService accountFinancingPlanPaymentIntentWithRequest:v7 completion:v14];
}

void __57__PKPayLaterPaymentIntentController__executeNextRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  if (!v5 || v6)
  {
    [*(id *)(a1 + 40) callCompletionsWithResponse:0 error:v6];
    id v15 = *(void **)(*(void *)(a1 + 32) + 72);
    id v16 = [*(id *)(a1 + 40) identifier];
    [v15 removeObjectForKey:v16];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  }
  else
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = PKFinancingPlanPaymentIntentTypeToString(*(void *)(a1 + 56));
      int v22 = 138412802;
      id v23 = v5;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      __int16 v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Setting financing plan intent details cache with response %@ for planIdentifier %@, intent \"%@\"", (uint8_t *)&v22, 0x20u);
    }
    id v10 = *(void **)(*(void *)(a1 + 32) + 64);
    id v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    char v12 = [v10 objectForKey:v11];
    id v13 = v12;
    if (v12) {
      id v14 = v12;
    }
    else {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    }
    unint64_t v17 = v14;

    v18 = *(void **)(*(void *)(a1 + 32) + 64);
    __int16 v19 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    [v18 setObject:v17 forKey:v19];

    [v17 setObject:v5 forKey:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) callCompletionsWithResponse:v5 error:0];
    __int16 v20 = *(void **)(*(void *)(a1 + 32) + 72);
    uint64_t v21 = [*(id *)(a1 + 40) identifier];
    [v20 removeObjectForKey:v21];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  }
}

- (void)presentPaymentAuthorizationForFinancingPlan:(id)a3 primaryPaymentSource:(id)a4 intentDetails:(id)a5 intent:(unint64_t)a6 currencyAmount:(id)a7 presentationSceneIdentifier:(id)a8 completion:(id)a9
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (v20)
  {
    if (self->_paymentAuthorizationCompletion)
    {
      uint64_t v21 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Cannot display oslo sheet when one is already being displayed", buf, 2u);
      }

      (*((void (**)(id, void, void, void))v20 + 2))(v20, 0, 0, 0);
    }
    else if (v17)
    {
      int v22 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = [v15 planIdentifier];
        id v23 = PKFinancingPlanPaymentIntentTypeToString(a6);
        *(_DWORD *)buf = 138412802;
        id v33 = v18;
        __int16 v34 = 2112;
        objc_super v35 = v28;
        __int16 v36 = 2112;
        v37 = v23;
        _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Presenting financing plan payment intent authorization for amount %@, planIdentifier %@, intent %@", buf, 0x20u);
      }
      __int16 v24 = [(PKPayLaterPaymentIntentController *)self payLaterPaymentRequestWithIntentDetails:v17 financingPlan:v15 primaryPaymentSource:v16 intent:a6 currencyAmount:v18];
      objc_initWeak((id *)buf, self);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __177__PKPayLaterPaymentIntentController_presentPaymentAuthorizationForFinancingPlan_primaryPaymentSource_intentDetails_intent_currencyAmount_presentationSceneIdentifier_completion___block_invoke;
      v29[3] = &unk_1E56E04A0;
      objc_copyWeak(&v31, (id *)buf);
      v29[4] = self;
      id v30 = v20;
      [(PKPayLaterPaymentIntentController *)self _presentPaymentAuthorizationWithPaymentRequest:v24 presentationSceneIdentifier:v19 completion:v29];

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v25 = PKLocalizedPaymentString(&cfstr_GenericErrorTi.isa, 0);
      __int16 v26 = PKLocalizedPaymentString(&cfstr_GenericErrorMe.isa, 0);
      v27 = PKDisplayableErrorCustomWithType(-1, v25, v26, 0, 0);

      (*((void (**)(id, void, void, void *))v20 + 2))(v20, 0, 0, v27);
    }
  }
}

void __177__PKPayLaterPaymentIntentController_presentPaymentAuthorizationForFinancingPlan_primaryPaymentSource_intentDetails_intent_currencyAmount_presentationSceneIdentifier_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(0xEuLL);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v8)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v13 = 136315394;
        id v14 = "-[PKPayLaterPaymentIntentController presentPaymentAuthorizationForFinancingPlan:primaryPaymentSource:inten"
              "tDetails:intent:currencyAmount:presentationSceneIdentifier:completion:]_block_invoke";
        __int16 v15 = 2048;
        uint64_t v16 = v9;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "%s %p: Succeeded presenting PKPaymentAuthorizationCoordinator.", (uint8_t *)&v13, 0x16u);
      }

      uint64_t v10 = [*(id *)(a1 + 40) copy];
      id v11 = (void *)WeakRetained[2];
      WeakRetained[2] = v10;
    }
    else
    {
      if (v8)
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v13 = 136315394;
        id v14 = "-[PKPayLaterPaymentIntentController presentPaymentAuthorizationForFinancingPlan:primaryPaymentSource:inten"
              "tDetails:intent:currencyAmount:presentationSceneIdentifier:completion:]_block_invoke";
        __int16 v15 = 2048;
        uint64_t v16 = v12;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "%s %p: Failed to present PKPaymentAuthorizationCoordinator.", (uint8_t *)&v13, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)_presentPaymentAuthorizationWithPaymentRequest:(id)a3 presentationSceneIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (NSString *)a4;
  id v11 = a5;
  uint64_t v12 = [[PKPaymentAuthorizationCoordinator alloc] initWithPaymentRequest:v9];
  authorizationCoordinator = self->_authorizationCoordinator;
  self->_authorizationCoordinator = v12;

  [(PKPaymentAuthorizationCoordinator *)self->_authorizationCoordinator setDelegate:self];
  [(PKPaymentAuthorizationCoordinator *)self->_authorizationCoordinator _setPrivateDelegate:self];
  objc_storeStrong((id *)&self->_currentPaymentRequest, a3);
  presentationSceneIdentifier = self->_presentationSceneIdentifier;
  self->_presentationSceneIdentifier = v10;
  __int16 v15 = v10;

  uint64_t v16 = self->_authorizationCoordinator;
  if (v16)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __123__PKPayLaterPaymentIntentController__presentPaymentAuthorizationWithPaymentRequest_presentationSceneIdentifier_completion___block_invoke;
    v22[3] = &unk_1E56D86A8;
    id v23 = v9;
    id v24 = v11;
    [(PKPaymentAuthorizationCoordinator *)v16 presentWithCompletion:v22];

    uint64_t v17 = v15;
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v28 = "-[PKPayLaterPaymentIntentController _presentPaymentAuthorizationWithPaymentRequest:presentationSceneIdentifier:completion:]";
      __int16 v29 = 2048;
      id v30 = self;
      __int16 v31 = 2048;
      id v32 = v9;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "%s %p: PKPaymentAuthorizationCoordinator could not be instantiated with paymentRequest: %p.", buf, 0x20u);
    }

    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    id v20 = [NSString stringWithFormat:@"PKPaymentAuthorizationCoordinator could not be instantiated with paymentRequest: %@.", v9];
    __int16 v26 = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v17 = [v19 errorWithDomain:@"PKPassKitErrorDomain" code:0 userInfo:v21];

    if (v11) {
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v17);
    }
  }
}

void __123__PKPayLaterPaymentIntentController__presentPaymentAuthorizationWithPaymentRequest_presentationSceneIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__PKPayLaterPaymentIntentController__presentPaymentAuthorizationWithPaymentRequest_presentationSceneIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E56D8A68;
  char v6 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __123__PKPayLaterPaymentIntentController__presentPaymentAuthorizationWithPaymentRequest_presentationSceneIdentifier_completion___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = 0;
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    id v4 = [NSString stringWithFormat:@"PKPaymentAuthorizationCoordinator could not be presented with paymentRequest: %@.", *(void *)(a1 + 32), *MEMORY[0x1E4F28568]];
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v2 = [v3 errorWithDomain:@"PKPassKitErrorDomain" code:0 userInfo:v5];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, *(unsigned __int8 *)(a1 + 48), v2);
  }
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PKPayLaterPaymentIntentController_accountChanged___block_invoke;
  v6[3] = &unk_1E56D8A90;
  id v7 = v4;
  BOOL v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __52__PKPayLaterPaymentIntentController_accountChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accountIdentifier];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 104) accountIdentifier];
  id v12 = v2;
  id v4 = v3;
  if (v12 == v4)
  {

LABEL_10:
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v7 = *(void **)(v10 + 104);
    *(void *)(v10 + 104) = v11;
    goto LABEL_11;
  }
  id v5 = v4;
  if (v12) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    char v8 = [v12 isEqualToString:v4];

    if ((v8 & 1) == 0) {
      return;
    }
    goto LABEL_10;
  }

  id v7 = v12;
LABEL_11:
}

- (void)_peerPaymentAccountChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPayLaterPaymentIntentController__peerPaymentAccountChanged__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PKPayLaterPaymentIntentController__peerPaymentAccountChanged__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) targetDevice];
  uint64_t v3 = [v2 account];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v6 + 112);
  id v7 = *(void **)(v6 + 120);
  return [v7 setPeerPaymentAccount:v8];
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKPayLaterAvailableFundingSourcesFilter)availableFundingSourcesFilter
{
  return self->_availableFundingSourcesFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableFundingSourcesFilter, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_presentationSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_currentPaymentRequest, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_cacheByIntentType, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_defaultPassUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong(&self->_paymentAuthorizationCompletion, 0);
  objc_storeStrong((id *)&self->_authorizationCoordinator, 0);
}

@end