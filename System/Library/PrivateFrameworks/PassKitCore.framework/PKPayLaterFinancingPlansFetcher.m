@interface PKPayLaterFinancingPlansFetcher
+ (id)_financingPlanStates;
- (PKAccount)payLaterAccount;
- (PKPayLaterFinancingPlansFetcher)initWithPayLaterAccount:(id)a3;
- (id)cachedInstallmentsMonthWithStartDate:(id)a3;
- (id)monthDates;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_addRequest:(id)a3;
- (void)_executeNextRequestIfPossible;
- (void)_executeRequest:(id)a3;
- (void)_queue_clearAllCache;
- (void)_queue_clearCacheWithMonths:(id)a3;
- (void)_queue_financingPlanUpdated:(id)a3;
- (void)_timeZoneChanged;
- (void)accountChanged:(id)a3;
- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4;
- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4;
- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5;
- (void)dealloc;
- (void)financingPlansWithQueries:(id)a3 completion:(id)a4;
- (void)financingPlansWithQueryItems:(unint64_t)a3 completion:(id)a4;
- (void)installmentsMonthWithDate:(id)a3 completion:(id)a4;
- (void)preflightDataIfNecessaryWithCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setPayLaterAccount:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PKPayLaterFinancingPlansFetcher

- (PKPayLaterFinancingPlansFetcher)initWithPayLaterAccount:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKPayLaterFinancingPlansFetcher;
  v6 = [(PKPayLaterFinancingPlansFetcher *)&v31 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payLaterAccount, a3);
    v8 = [(PKAccount *)v7->_payLaterAccount payLaterDetails];
    v9 = [v8 currencyCode];

    if (v9)
    {
      v10 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v11 = PKCurrencyAmountCreate(v10, v9, 0);
      fallbackAmount = v7->_fallbackAmount;
      v7->_fallbackAmount = (PKCurrencyAmount *)v11;
    }
    else
    {
      v10 = (NSDecimalNumber *)v7->_fallbackAmount;
      v7->_fallbackAmount = 0;
    }

    uint64_t v13 = +[PKAccountService sharedInstance];
    accountService = v7->_accountService;
    v7->_accountService = (PKAccountService *)v13;

    [(PKAccountService *)v7->_accountService registerObserver:v7];
    v15 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    financingPlanCache = v7->_financingPlanCache;
    v7->_financingPlanCache = v15;

    v17 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    installmentMonthCache = v7->_installmentMonthCache;
    v7->_installmentMonthCache = v17;

    *(void *)&v7->_requestsLock._os_unfair_lock_opaque = 0;
    v7->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingRequests = v7->_pendingRequests;
    v7->_pendingRequests = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dateRangeCompletions = v7->_dateRangeCompletions;
    v7->_dateRangeCompletions = v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.passkitui.plansfetcher.work", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v25;

    dispatch_queue_t v27 = dispatch_queue_create("com.apple.passkitui.plansfetcher.reply", 0);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v27;

    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v7 selector:sel__timeZoneChanged name:*MEMORY[0x1E4F1C4F8] object:0];
  }
  return v7;
}

- (void)dealloc
{
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterFinancingPlansFetcher;
  [(PKPayLaterFinancingPlansFetcher *)&v4 dealloc];
}

- (id)cachedInstallmentsMonthWithStartDate:(id)a3
{
  objc_super v4 = PKStartOfMonth(a3);
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  v6 = [(NSCache *)self->_installmentMonthCache objectForKey:v4];
  os_unfair_lock_unlock(p_cacheLock);

  return v6;
}

- (void)installmentsMonthWithDate:(id)a3 completion:(id)a4
{
  v9 = (void (**)(id, void *))a4;
  v6 = PKStartOfMonth(a3);
  v7 = [(PKPayLaterFinancingPlansFetcher *)self cachedInstallmentsMonthWithStartDate:v6];
  if (v7)
  {
    if (v9) {
      v9[2](v9, v7);
    }
  }
  else
  {
    v8 = [[PKPayLaterFinancingPlansFetcherRequest alloc] initWithStartDate:v6 completion:v9];
    [(PKPayLaterFinancingPlansFetcher *)self _addRequest:v8];
  }
}

- (id)monthDates
{
  return self->_months;
}

- (void)preflightDataIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 88))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    id v5 = *(void **)(v2 + 96);
    id v6 = _Block_copy(*(const void **)(a1 + 40));
    [v5 safelyAddObject:v6];

    uint64_t v7 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v7 + 89))
    {
      *(unsigned char *)(v7 + 89) = 1;
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 8);
      v10 = [*(id *)(v8 + 136) accountIdentifier];
      uint64_t v11 = [(id)objc_opt_class() _financingPlanStates];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_2;
      v12[3] = &unk_1E56ED430;
      v12[4] = *(void *)(a1 + 32);
      [v9 financingPlanInstallmentsDueDateRangeForAccountIdentifier:v10 financingPlanStates:v11 completion:v12];
    }
  }
}

void __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = PKStartOfMonth(a2);
  uint64_t v7 = PKEndOfMonth(v5);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v6 compare:v7] == -1)
  {
    do
    {
      [v8 addObject:v6];
      v9 = PKStartOfNextMonth(v6);

      id v6 = v9;
    }
    while ([v9 compare:v7] == -1);
  }
  else
  {
    v9 = v6;
  }
  v10 = [v8 firstObject];

  uint64_t v11 = [v8 lastObject];

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(NSObject **)(v12 + 72);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_3;
  v17[3] = &unk_1E56DB988;
  id v18 = v10;
  id v19 = v11;
  uint64_t v20 = v12;
  id v21 = v8;
  id v14 = v8;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);
}

void __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Financing plans date range %@ to %@", buf, 0x16u);
  }

  *(unsigned char *)(*(void *)(a1 + 48) + 88) = 1;
  *(unsigned char *)(*(void *)(a1 + 48) + 89) = 0;
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 112), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 120), *(id *)(a1 + 40));
  uint64_t v5 = [*(id *)(a1 + 56) copy];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v5;

  id v8 = (void *)[*(id *)(*(void *)(a1 + 48) + 96) copy];
  [*(id *)(*(void *)(a1 + 48) + 96) removeAllObjects];
  v9 = *(NSObject **)(*(void *)(a1 + 48) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_22;
  block[3] = &unk_1E56D8AE0;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

void __74__PKPayLaterFinancingPlansFetcher_preflightDataIfNecessaryWithCompletion___block_invoke_22(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)setPayLaterAccount:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PKPayLaterFinancingPlansFetcher_setPayLaterAccount___block_invoke;
  v7[3] = &unk_1E56D8A90;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

uint64_t __54__PKPayLaterFinancingPlansFetcher_setPayLaterAccount___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void **)(result + 32);
  uint64_t v3 = *(void *)(result + 40);
  id v4 = *(void **)(v3 + 136);
  if (v2) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (v2 == v4) {
      return result;
    }
  }
  else
  {
    result = objc_msgSend(*(id *)(result + 32), "isEqual:");
    if (result) {
      return result;
    }
    uint64_t v2 = *(void **)(v1 + 32);
    uint64_t v3 = *(void *)(v1 + 40);
  }
  objc_storeStrong((id *)(v3 + 136), v2);
  id v6 = *(void **)(v1 + 40);
  return objc_msgSend(v6, "_queue_clearAllCache");
}

- (void)financingPlansWithQueries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke;
    block[3] = &unk_1E56D89F0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

void __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke_2;
  v4[3] = &unk_1E56DE680;
  v4[4] = v1;
  id v5 = *(id *)(a1 + 48);
  [v3 financingPlansWithQueries:v2 completion:v4];
}

void __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke_3;
  v7[3] = &unk_1E56D83D8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __72__PKPayLaterFinancingPlansFetcher_financingPlansWithQueries_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)financingPlansWithQueryItems:(unint64_t)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = [PKAccountServicePayLaterFinancingPlanQuery alloc];
    id v8 = [(PKAccount *)self->_payLaterAccount accountIdentifier];
    id v9 = [(PKAccountServicePayLaterFinancingPlanQuery *)v7 initWithAccountIdentifier:v8 queryItems:a3];

    v15[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__PKPayLaterFinancingPlansFetcher_financingPlansWithQueryItems_completion___block_invoke;
    v12[3] = &unk_1E56ED2E8;
    v12[4] = self;
    uint64_t v13 = v9;
    id v14 = v6;
    id v11 = v9;
    [(PKPayLaterFinancingPlansFetcher *)self financingPlansWithQueries:v10 completion:v12];
  }
}

void __75__PKPayLaterFinancingPlansFetcher_financingPlansWithQueryItems_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = a2;
  id v6 = [v3 queryIdentifier];
  id v5 = [v4 objectForKeyedSubscript:v6];

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

- (void)_addRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock(&self->_requestsLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_pendingRequests;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "coalesceRequest:", v4, (void)v10))
        {

          goto LABEL_12;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    [(NSMutableArray *)self->_pendingRequests addObject:v4];
    id v5 = v4;
LABEL_12:
  }
  os_unfair_lock_unlock(&self->_requestsLock);
  [(PKPayLaterFinancingPlansFetcher *)self _executeNextRequestIfPossible];
}

- (void)_executeNextRequestIfPossible
{
  p_requestsLock = &self->_requestsLock;
  os_unfair_lock_lock(&self->_requestsLock);
  if (self->_currentRequest)
  {
    os_unfair_lock_unlock(p_requestsLock);
  }
  else
  {
    id v4 = [(NSMutableArray *)self->_pendingRequests firstObject];
    currentRequest = self->_currentRequest;
    self->_currentRequest = v4;

    uint64_t v6 = self->_currentRequest;
    if (v6)
    {
      [(NSMutableArray *)self->_pendingRequests removeObjectAtIndex:0];
      uint64_t v6 = self->_currentRequest;
    }
    uint64_t v7 = v6;
    os_unfair_lock_unlock(p_requestsLock);
    if (v7)
    {
      [(PKPayLaterFinancingPlansFetcher *)self _executeRequest:v7];
    }
  }
}

- (void)_executeRequest:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke;
    v7[3] = &unk_1E56D8A90;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, v7);
  }
}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 136) accountIdentifier];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2;
  v24[3] = &unk_1E56E9040;
  v24[4] = *(void *)(a1 + 32);
  [(PKAsyncUnaryOperationComposer *)v2 addOperation:v24];
  id v4 = [*(id *)(a1 + 40) startDate];
  id v5 = PKEndOfMonth(v4);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__51;
  v22[4] = __Block_byref_object_dispose__51;
  id v23 = 0;
  uint64_t v6 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v4;
    __int16 v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Fetching financing plan installments for start date %@ and end date %@", buf, 0x16u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_30;
  v17[3] = &unk_1E56E9290;
  void v17[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v18 = v7;
  id v8 = v4;
  id v19 = v8;
  id v9 = v5;
  id v20 = v9;
  id v21 = v22;
  [(PKAsyncUnaryOperationComposer *)v2 addOperation:v17];
  long long v10 = [MEMORY[0x1E4F1CA98] null];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_36;
  v13[3] = &unk_1E56ED4A8;
  v13[4] = *(void *)(a1 + 32);
  uint64_t v16 = v22;
  id v11 = v8;
  id v14 = v11;
  id v15 = *(id *)(a1 + 40);
  id v12 = [(PKAsyncUnaryOperationComposer *)v2 evaluateWithInput:v10 completion:v13];

  _Block_object_dispose(v22, 8);
}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3;
  v11[3] = &unk_1E56D83D8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 preflightDataIfNecessaryWithCompletion:v11];
}

uint64_t __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_30(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2_31;
  block[3] = &unk_1E56ED480;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v16 = v9;
  uint64_t v17 = v10;
  id v18 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  id v21 = v7;
  uint64_t v22 = v12;
  id v19 = v11;
  id v20 = v6;
  id v13 = v6;
  id v14 = v7;
  dispatch_async(v8, block);
}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2_31(uint64_t a1)
{
  uint64_t v2 = [[PKAccountServicePayLaterFinancingPlanQuery alloc] initWithAccountIdentifier:*(void *)(a1 + 32) queryItems:32];
  id v3 = [(id)objc_opt_class() _financingPlanStates];
  [(PKAccountServicePayLaterFinancingPlanQuery *)v2 setRelevantFinancingPlanStates:v3];

  [(PKAccountServicePayLaterFinancingPlanQuery *)v2 setInstallmentDueOrPaidDateStart:*(void *)(a1 + 48)];
  [(PKAccountServicePayLaterFinancingPlanQuery *)v2 setInstallmentDueOrPaidDateEnd:*(void *)(a1 + 56)];
  id v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3_32;
  v9[3] = &unk_1E56ED458;
  id v10 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v6;
  long long v8 = *(_OWORD *)(a1 + 72);
  id v7 = (id)v8;
  long long v14 = v8;
  id v13 = *(id *)(a1 + 64);
  [v4 financingPlansWithQuery:v2 completion:v9];
}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3_32(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 relevantFinancingPlans];
  id v4 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 count];
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v11 = 134218498;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Received %ld financing plan for start date %@ and end date %@", (uint8_t *)&v11, 0x20u);
  }

  long long v8 = [[PKPayLaterInstallmentsMonth alloc] initWithFinancingPlans:v3 fallbackAmount:*(void *)(a1[6] + 16) startDate:a1[4] endDate:a1[5]];
  uint64_t v9 = *(void *)(a1[9] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  (*(void (**)(void))(a1[8] + 16))();
}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_36(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
  [*(id *)(*(void *)(a1 + 32) + 48) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 60));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2_37;
  block[3] = &unk_1E56E4F00;
  void block[4] = v2;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v3, block);
}

void __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_2_37(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  [*(id *)(a1 + 32) _executeNextRequestIfPossible];
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3_38;
  v7[3] = &unk_1E56DC618;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v4, v7);
}

uint64_t __51__PKPayLaterFinancingPlansFetcher__executeRequest___block_invoke_3_38(uint64_t a1)
{
  return [*(id *)(a1 + 32) callCompletionsWithResult:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PKPayLaterFinancingPlansFetcher_accountChanged___block_invoke;
  v7[3] = &unk_1E56D8A90;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __50__PKPayLaterFinancingPlansFetcher_accountChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountIdentifier];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 136) accountIdentifier];
  id v12 = v2;
  id v4 = v3;
  if (v12 == v4)
  {

LABEL_10:
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v7 = *(void **)(v10 + 136);
    *(void *)(v10 + 136) = v11;
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

- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPayLaterFinancingPlansFetcher_accountFinancingPlanAdded_accountIdentifier___block_invoke;
  block[3] = &unk_1E56D8AB8;
  id v12 = v7;
  __int16 v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

void __79__PKPayLaterFinancingPlansFetcher_accountFinancingPlanAdded_accountIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [*(id *)(a1[5] + 136) accountIdentifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_12:
    char v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    objc_msgSend(v8, "_queue_financingPlanUpdated:", v9);
    return;
  }
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  id v10 = v5;
  if (!v6)
  {
    int v7 = [v4 isEqualToString:v5];

    if (!v7) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PKPayLaterFinancingPlansFetcher_accountFinancingPlanRemoved_accountIdentifier___block_invoke;
  block[3] = &unk_1E56D8AB8;
  id v12 = v7;
  __int16 v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

void __81__PKPayLaterFinancingPlansFetcher_accountFinancingPlanRemoved_accountIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [*(id *)(a1[5] + 136) accountIdentifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_12:
    char v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    objc_msgSend(v8, "_queue_financingPlanUpdated:", v9);
    return;
  }
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  id v10 = v5;
  if (!v6)
  {
    int v7 = [v4 isEqualToString:v5];

    if (!v7) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PKPayLaterFinancingPlansFetcher_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke;
  block[3] = &unk_1E56D8AB8;
  id v13 = v8;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(workQueue, block);
}

void __98__PKPayLaterFinancingPlansFetcher_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [*(id *)(a1[5] + 136) accountIdentifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_12:
    id v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    objc_msgSend(v8, "_queue_financingPlanUpdated:", v9);
    return;
  }
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  id v10 = v5;
  if (!v6)
  {
    int v7 = [v4 isEqualToString:v5];

    if (!v7) {
      return;
    }
    goto LABEL_12;
  }
}

- (void)_queue_financingPlanUpdated:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v5 = [v38 planSummary];
  BOOL v6 = [v5 transactionDate];

  if (v6)
  {
    v36 = PKStartOfMonth(v6);
  }
  else
  {
    v36 = 0;
  }
  int v7 = [v38 scheduleSummary];
  v37 = [v7 installments];

  id v8 = [v37 lastObject];
  uint64_t v9 = [v8 dueDate];
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v6;
  }
  id v12 = v11;

  v34 = v12;
  if (v12)
  {
    v35 = PKEndOfMonth(v12);
  }
  else
  {
    v35 = 0;
  }
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  id v13 = PKStartOfMonth(v36);
  id v14 = PKEndOfMonth(v35);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while ([v13 compare:v14] == -1)
  {
    [v15 addObject:v13];
    uint64_t v16 = PKStartOfNextMonth(v13);

    id v13 = (void *)v16;
  }
  if (!v6)
  {
    uint64_t v17 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v38 planIdentifier];
      *(_DWORD *)buf = 138412290;
      v55 = v18;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Error: No transactionDate defined for fiancing plan %@", buf, 0xCu);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPayLaterFinancingPlansFetcher__queue_financingPlanUpdated___block_invoke;
  aBlock[3] = &unk_1E56ED4D0;
  id v19 = v4;
  id v42 = v19;
  v43 = self;
  v44 = &v50;
  v45 = &v46;
  id v20 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v21 = [v15 firstObject];
  v20[2](v20, v21);

  uint64_t v22 = [v15 lastObject];
  v20[2](v20, v22);

  int v23 = *((unsigned __int8 *)v51 + 24);
  if (*((unsigned char *)v51 + 24) || *((unsigned char *)v47 + 24))
  {
    v24 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v33 = self;
      dispatch_queue_t v25 = v6;
      id v26 = v19;
      int v27 = *((unsigned __int8 *)v47 + 24);
      uint64_t v28 = [v38 planIdentifier];
      uint64_t v29 = (void *)v28;
      v30 = @"YES";
      if (v27) {
        objc_super v31 = @"YES";
      }
      else {
        objc_super v31 = @"NO";
      }
      *(_DWORD *)buf = 138543874;
      if (!v23) {
        v30 = @"NO";
      }
      v55 = v30;
      __int16 v56 = 2114;
      v57 = v31;
      __int16 v58 = 2114;
      uint64_t v59 = v28;
      _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Invalidating financing plan months older: %{public}@, newer: %{public}@, financingPlan: %{public}@", buf, 0x20u);

      id v19 = v26;
      BOOL v6 = v25;
      self = v33;
    }

    [(PKPayLaterFinancingPlansFetcher *)self _queue_clearAllCache];
    [(PKPayLaterFinancingPlansFetcher *)self _accessObserversWithHandler:&__block_literal_global_149];
  }
  [(PKPayLaterFinancingPlansFetcher *)self _queue_clearCacheWithMonths:v15];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __63__PKPayLaterFinancingPlansFetcher__queue_financingPlanUpdated___block_invoke_2;
  v39[3] = &unk_1E56ED518;
  id v32 = v15;
  id v40 = v32;
  [(PKPayLaterFinancingPlansFetcher *)self _accessObserversWithHandler:v39];

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
}

void __63__PKPayLaterFinancingPlansFetcher__queue_financingPlanUpdated___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "components:fromDate:", 4110);
  if (*(void *)(*(void *)(a1 + 40) + 112))
  {
    if (objc_msgSend(v6, "compare:") == -1) {
      char v4 = [*(id *)(a1 + 32) date:*(void *)(*(void *)(a1 + 40) + 112) matchesComponents:v3] ^ 1;
    }
    else {
      char v4 = 0;
    }
  }
  else
  {
    char v4 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  if (*(void *)(*(void *)(a1 + 40) + 120))
  {
    if (objc_msgSend(v6, "compare:") == 1) {
      char v5 = [*(id *)(a1 + 32) date:*(void *)(*(void *)(a1 + 40) + 120) matchesComponents:v3] ^ 1;
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
}

void __63__PKPayLaterFinancingPlansFetcher__queue_financingPlanUpdated___block_invoke_48(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 invalidatedInstallmentsMonth];
  }
}

void __63__PKPayLaterFinancingPlansFetcher__queue_financingPlanUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 invalidatedInstallmentsMonthsWithDates:*(void *)(a1 + 32)];
  }
}

- (void)_queue_clearAllCache
{
  oldestDate = self->_oldestDate;
  self->_oldestDate = 0;

  newestDate = self->_newestDate;
  self->_newestDate = 0;

  months = self->_months;
  self->_months = 0;

  self->_hasDateRange = 0;
  installmentMonthCache = self->_installmentMonthCache;
  [(NSCache *)installmentMonthCache removeAllObjects];
}

- (void)_queue_clearCacheWithMonths:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if (self->_oldestDate && objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "compare:") == -1)
        {
          oldestDate = self->_oldestDate;
          self->_oldestDate = 0;

          self->_hasDateRange = 0;
        }
        if (self->_newestDate && objc_msgSend(v9, "compare:") == 1)
        {
          newestDate = self->_newestDate;
          self->_newestDate = 0;

          self->_hasDateRange = 0;
        }
        os_unfair_lock_lock(&self->_cacheLock);
        [(NSCache *)self->_installmentMonthCache removeObjectForKey:v9];
        os_unfair_lock_unlock(&self->_cacheLock);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_timeZoneChanged
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PKPayLaterFinancingPlansFetcher__timeZoneChanged__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __51__PKPayLaterFinancingPlansFetcher__timeZoneChanged__block_invoke(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Invalidate financing plan months due to time zone change", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_clearAllCache");
  return [*(id *)(a1 + 32) _accessObserversWithHandler:&__block_literal_global_56_2];
}

void __51__PKPayLaterFinancingPlansFetcher__timeZoneChanged__block_invoke_54(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 invalidatedInstallmentsMonth];
  }
}

+ (id)_financingPlanStates
{
  if (_MergedGlobals_250 != -1) {
    dispatch_once(&_MergedGlobals_250, &__block_literal_global_58_0);
  }
  id v2 = (void *)qword_1EB403208;
  return v2;
}

void __55__PKPayLaterFinancingPlansFetcher__financingPlanStates__block_invoke()
{
  v0 = (void *)qword_1EB403208;
  qword_1EB403208 = (uint64_t)&unk_1EE22B0F0;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_observersLock);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__PKPayLaterFinancingPlansFetcher__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E56D8A18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __63__PKPayLaterFinancingPlansFetcher__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_months, 0);
  objc_storeStrong((id *)&self->_newestDate, 0);
  objc_storeStrong((id *)&self->_oldestDate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dateRangeCompletions, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_installmentMonthCache, 0);
  objc_storeStrong((id *)&self->_financingPlanCache, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_fallbackAmount, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
}

@end