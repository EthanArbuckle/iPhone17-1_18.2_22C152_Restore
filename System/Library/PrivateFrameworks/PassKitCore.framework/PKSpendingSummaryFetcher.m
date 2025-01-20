@interface PKSpendingSummaryFetcher
+ (id)_sortedTransactions:(id)a3 ascending:(BOOL)a4;
+ (id)_spendingCategoriesFromTransactions:(id)a3 currencyCode:(id)a4;
+ (id)_spendingMerchantsFromTransaction:(id)a3 currencyCode:(id)a4;
+ (id)_summaryWithTransactions:(id)a3 currency:(id)a4 type:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 lastSummary:(id)a8 altDSID:(id)a9;
+ (id)nextStartOfWeekFromDate:(id)a3;
+ (id)previousStartOfWeekFromDate:(id)a3;
+ (id)summaryWithTransactions:(id)a3 transactionSourceCollection:(id)a4 accountUser:(id)a5 currency:(id)a6 type:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9 lastSummary:(id)a10;
- (PKAccountUser)accountUser;
- (PKSpendingSummaryFetcher)initWithTransactionSourceCollection:(id)a3 account:(id)a4 accountUser:(id)a5;
- (id)_cacheForType:(unint64_t)a3;
- (id)_cachedSpendingSummaryStartingWithDate:(id)a3 type:(unint64_t)a4 withLastPeriodChange:(BOOL)a5;
- (id)cachedSpendingSummaryStartingWithDate:(id)a3 type:(unint64_t)a4;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_addInsightsToSummary:(id)a3 completion:(id)a4;
- (void)_addInterestToSummaryIfNecessary:(id)a3 withLastPeriodChange:(BOOL)a4 completion:(id)a5;
- (void)_fetchStatementsIfNecessaryWithCompletion:(id)a3;
- (void)_invalidateSummariesForPendingTransactionUpdates;
- (void)_processNextRequest;
- (void)_resetCurrentCalendar;
- (void)_spendingSummaryStartingWithDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 withLastPeriodChange:(BOOL)a6 completion:(id)a7;
- (void)_startTimerIfNecessary;
- (void)_timeZoneChanged:(id)a3;
- (void)availableSummaries:(id)a3;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)spendingSummaryStartingWithDate:(id)a3 type:(unint64_t)a4 includingLastPeriodChange:(BOOL)a5 completion:(id)a6;
- (void)statementsChangedForAccountIdentifier:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation PKSpendingSummaryFetcher

- (PKSpendingSummaryFetcher)initWithTransactionSourceCollection:(id)a3 account:(id)a4 accountUser:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v62.receiver = self;
  v62.super_class = (Class)PKSpendingSummaryFetcher;
  v11 = [(PKSpendingSummaryFetcher *)&v62 init];
  if (v11)
  {
    if (v10)
    {
      id obj = a5;
      id v56 = v9;
      v12 = (PKTransactionSourceCollection *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v10 isCurrentUser])
      {
        v13 = objc_msgSend(v8, "transactionSourcesForType:", 0, a5);
        v14 = [v13 anyObject];
        [(PKTransactionSourceCollection *)v12 addObject:v14];
      }
      id v55 = a4;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v57 = v8;
      v15 = objc_msgSend(v8, "transactionSourcesForType:", 2, obj);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v59;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v59 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            uint64_t v21 = [v20 accountUser];
            if (v21)
            {
              v22 = (void *)v21;
              char v23 = [v10 isEqual:v21];

              if (v23)
              {
                [(PKTransactionSourceCollection *)v12 addObject:v20];
                goto LABEL_17;
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v58 objects:v63 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
LABEL_17:

      v25 = [PKTransactionSourceCollection alloc];
      v26 = (void *)[(PKTransactionSourceCollection *)v12 copy];
      uint64_t v27 = [(PKTransactionSourceCollection *)v25 initWithTransactionSources:v26];
      transactionSourceCollection = v11->_transactionSourceCollection;
      v11->_transactionSourceCollection = (PKTransactionSourceCollection *)v27;

      objc_storeStrong((id *)&v11->_accountUser, obja);
      id v9 = v56;
      id v8 = v57;
      a4 = v55;
    }
    else
    {
      v24 = (PKTransactionSourceCollection *)v8;
      v12 = v11->_transactionSourceCollection;
      v11->_transactionSourceCollection = v24;
    }

    objc_storeStrong((id *)&v11->_account, a4);
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.passkitui.spending.work", v29);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v30;

    dispatch_queue_t v32 = dispatch_queue_create("com.apple.passkitui.spending.reply", v29);
    replyQueue = v11->_replyQueue;
    v11->_replyQueue = (OS_dispatch_queue *)v32;

    v34 = objc_alloc_init(PKPaymentDefaultDataProvider);
    paymentDataProvider = v11->_paymentDataProvider;
    v11->_paymentDataProvider = v34;

    [(PKPaymentDefaultDataProvider *)v11->_paymentDataProvider addDelegate:v11];
    v36 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    weeklySummaryItemsPerStartDate = v11->_weeklySummaryItemsPerStartDate;
    v11->_weeklySummaryItemsPerStartDate = v36;

    v38 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    monthlySummaryItemsPerStartDate = v11->_monthlySummaryItemsPerStartDate;
    v11->_monthlySummaryItemsPerStartDate = v38;

    v40 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    yearlySummaryItemsPerStartDate = v11->_yearlySummaryItemsPerStartDate;
    v11->_yearlySummaryItemsPerStartDate = v40;

    [(PKSpendingSummaryFetcher *)v11 _resetCurrentCalendar];
    v42 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    pendingRequests = v11->_pendingRequests;
    v11->_pendingRequests = v42;

    v44 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    blockPendingRequests = v11->_blockPendingRequests;
    v11->_blockPendingRequests = v44;

    v11->_requestsLock._os_unfair_lock_opaque = 0;
    v11->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v46 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v11->_observers;
    v11->_observers = (NSHashTable *)v46;

    v48 = +[PKAccountService sharedInstance];
    [v48 registerObserver:v11];

    v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v49 addObserver:v11 selector:sel__timeZoneChanged_ name:*MEMORY[0x1E4F1C4F8] object:0];

    v50 = objc_alloc_init(PKSpendingInsightsFetcher);
    insightsFetcher = v11->_insightsFetcher;
    v11->_insightsFetcher = v50;
  }
  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKSpendingSummaryFetcher;
  [(PKSpendingSummaryFetcher *)&v4 dealloc];
}

- (void)_resetCurrentCalendar
{
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  currentCalendar = self->_currentCalendar;
  self->_currentCalendar = v3;

  v5 = self->_currentCalendar;
  [(NSCalendar *)v5 setFirstWeekday:2];
}

- (void)availableSummaries:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke;
  v7[3] = &unk_1E56D8A18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke(uint64_t a1)
{
  v2 = dispatch_group_create();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__36;
  v22[4] = __Block_byref_object_dispose__36;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__36;
  v20[4] = __Block_byref_object_dispose__36;
  id v21 = 0;
  dispatch_group_enter(v2);
  v3 = [*(id *)(*(void *)(a1 + 32) + 8) transactionSourceIdentifiers];
  id v4 = *(void **)(*(void *)(a1 + 32) + 80);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_59;
  v17[3] = &unk_1E56DE8D0;
  v19 = v22;
  v5 = v2;
  uint64_t v18 = v5;
  [v4 transactionsForTransactionSourceIdentifiers:v3 withTransactionSource:0 withBackingData:1 startDate:0 endDate:0 orderedByDate:-1 limit:1 completion:v17];
  dispatch_group_enter(v5);
  id v6 = *(void **)(*(void *)(a1 + 32) + 80);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_2;
  v14[3] = &unk_1E56DE8D0;
  uint64_t v16 = v20;
  v7 = v5;
  v15 = v7;
  [v6 transactionsForTransactionSourceIdentifiers:v3 withTransactionSource:0 withBackingData:1 startDate:0 endDate:0 orderedByDate:1 limit:1 completion:v14];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_3;
  block[3] = &unk_1E56E9068;
  block[4] = v8;
  v12 = v20;
  v13 = v22;
  id v11 = *(id *)(a1 + 40);
  dispatch_group_notify(v7, v9, block);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_59(uint64_t a1, void *a2)
{
  v3 = [a2 anyObject];
  uint64_t v4 = [v3 transactionDate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v7);
}

void __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 anyObject];
  uint64_t v4 = [v3 transactionDate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v7);
}

void __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_3(void *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  if (v4)
  {
    if ([v4 compare:v2] != -1) {
      goto LABEL_5;
    }
    uint64_t v3 = *(void *)(a1[6] + 8);
  }
  objc_storeStrong((id *)(v3 + 40), v2);
LABEL_5:
  uint64_t v5 = [*(id *)(a1[4] + 16) creditDetails];
  id v6 = [v5 createdDate];

  uint64_t v7 = a1[7];
  uint64_t v8 = *(void *)(v7 + 8);
  id v10 = (void **)(v8 + 40);
  id v9 = *(void **)(v8 + 40);
  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v6 == 0;
  }
  if (!v11) {
    goto LABEL_15;
  }
  if (v9) {
    BOOL v12 = v6 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    uint64_t v13 = [v9 compare:v6];
    uint64_t v7 = a1[7];
    uint64_t v8 = *(void *)(v7 + 8);
    id v10 = (void **)(v8 + 40);
    if (v13 == 1)
    {
LABEL_15:
      v14 = v6;
LABEL_16:
      id v15 = v14;
      uint64_t v16 = *v10;
      *id v10 = v15;

      uint64_t v7 = a1[7];
      goto LABEL_19;
    }
    id v9 = *v10;
  }
  if (!v9)
  {
    id v10 = (void **)(v8 + 40);
    v14 = v2;
    goto LABEL_16;
  }
LABEL_19:
  objc_storeStrong((id *)(a1[4] + 48), *(id *)(*(void *)(v7 + 8) + 40));
  objc_storeStrong((id *)(a1[4] + 56), *(id *)(*(void *)(a1[6] + 8) + 40));
  uint64_t v17 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = a1[4];
    uint64_t v20 = *(void *)(v18 + 48);
    uint64_t v19 = *(void *)(v18 + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v38 = v20;
    __int16 v39 = 2112;
    uint64_t v40 = v19;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Summaries oldest %@, newest %@", buf, 0x16u);
  }

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v24 = [(id)objc_opt_class() previousStartOfWeekFromDate:*(void *)(a1[4] + 48)];
  if ([v24 compare:*(void *)(a1[4] + 56)] == -1)
  {
    do
    {
      [v21 addObject:v24];
      v25 = [(id)objc_opt_class() nextStartOfWeekFromDate:v24];

      v24 = v25;
    }
    while ([v25 compare:*(void *)(a1[4] + 56)] == -1);
  }
  else
  {
    v25 = v24;
  }
  v26 = PKStartOfMonth(*(void **)(a1[4] + 48));
  if ([v26 compare:*(void *)(a1[4] + 56)] == -1)
  {
    do
    {
      [v22 addObject:v26];
      uint64_t v27 = PKStartOfNextMonth(v26);

      v26 = v27;
    }
    while ([v27 compare:*(void *)(a1[4] + 56)] == -1);
  }
  else
  {
    uint64_t v27 = v26;
  }
  v28 = PKStartOfYear(*(void **)(a1[4] + 48));
  if ([v28 compare:*(void *)(a1[4] + 56)] == -1)
  {
    do
    {
      [v23 addObject:v28];
      v29 = PKStartOfNextYear(v28);

      v28 = v29;
    }
    while ([v29 compare:*(void *)(a1[4] + 56)] == -1);
  }
  else
  {
    v29 = v28;
  }
  dispatch_queue_t v30 = (void *)a1[5];
  if (v30)
  {
    v31 = *(NSObject **)(a1[4] + 72);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_62;
    v32[3] = &unk_1E56D8518;
    id v36 = v30;
    id v33 = v21;
    id v34 = v22;
    id v35 = v23;
    dispatch_async(v31, v32);
  }
}

void __47__PKSpendingSummaryFetcher_availableSummaries___block_invoke_62(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v5 = (id)[*(id *)(a1 + 32) copy];
  uint64_t v3 = (void *)[*(id *)(a1 + 40) copy];
  uint64_t v4 = (void *)[*(id *)(a1 + 48) copy];
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);
}

- (id)cachedSpendingSummaryStartingWithDate:(id)a3 type:(unint64_t)a4
{
  return [(PKSpendingSummaryFetcher *)self _cachedSpendingSummaryStartingWithDate:a3 type:a4 withLastPeriodChange:1];
}

- (id)_cachedSpendingSummaryStartingWithDate:(id)a3 type:(unint64_t)a4 withLastPeriodChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(PKSpendingSummaryFetcher *)self _cacheForType:a4];
  id v10 = [v9 objectForKey:v8];

  if (!v10 || !v5)
  {
    if (!v10)
    {
      id v11 = 0;
      goto LABEL_8;
    }
LABEL_6:
    id v11 = v10;
    goto LABEL_8;
  }
  id v11 = [v10 previousTotalSpending];

  if (v11) {
    goto LABEL_6;
  }
LABEL_8:

  return v11;
}

- (void)spendingSummaryStartingWithDate:(id)a3 type:(unint64_t)a4 includingLastPeriodChange:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v14 = a6;
  id v10 = a3;
  id v11 = objc_alloc_init(PKSpendingSummaryFetcherRequest);
  [(PKSpendingSummaryFetcherRequest *)v11 setStartDate:v10];

  [(PKSpendingSummaryFetcherRequest *)v11 setWithLastChange:v6];
  [(PKSpendingSummaryFetcherRequest *)v11 setType:a4];
  os_unfair_lock_lock(&self->_requestsLock);
  [(NSMutableOrderedSet *)self->_pendingRequests addObject:v11];
  id v12 = [(NSMutableDictionary *)self->_blockPendingRequests objectForKey:v11];
  if (!v12)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_blockPendingRequests setObject:v12 forKey:v11];
  }
  if (v14)
  {
    uint64_t v13 = (void *)[v14 copy];
    [v12 addObject:v13];
  }
  os_unfair_lock_unlock(&self->_requestsLock);
  [(PKSpendingSummaryFetcher *)self _processNextRequest];
}

- (void)_processNextRequest
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PKSpendingSummaryFetcher__processNextRequest__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __47__PKSpendingSummaryFetcher__processNextRequest__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 136))
  {
    uint64_t v3 = [*(id *)(v2 + 120) lastObject];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      *(unsigned char *)(v2 + 136) = 1;
      [*(id *)(*(void *)(a1 + 32) + 120) removeObject:v3];
      BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKey:v4];
      BOOL v6 = (void *)[v5 copy];

      [*(id *)(*(void *)(a1 + 32) + 128) removeObjectForKey:v4];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
      uint64_t v7 = [v4 type];
      if (v7 == 2)
      {
        id v9 = [v4 startDate];
        uint64_t v12 = PKEndOfYear(v9);
      }
      else
      {
        if (v7 != 1)
        {
          if (v7)
          {
            id v11 = 0;
            goto LABEL_15;
          }
          id v8 = objc_opt_class();
          id v9 = [v4 startDate];
          id v10 = [v8 nextStartOfWeekFromDate:v9];
          id v11 = [v10 dateByAddingTimeInterval:-1.0];

LABEL_13:
LABEL_15:
          uint64_t v13 = *(void **)(a1 + 32);
          id v14 = [v4 startDate];
          uint64_t v15 = [v4 type];
          uint64_t v16 = [v4 withLastChange];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __47__PKSpendingSummaryFetcher__processNextRequest__block_invoke_2;
          v18[3] = &unk_1E56E9090;
          v18[4] = *(void *)(a1 + 32);
          id v19 = v6;
          id v17 = v6;
          [v13 _spendingSummaryStartingWithDate:v14 endDate:v11 type:v15 withLastPeriodChange:v16 completion:v18];

          return;
        }
        id v9 = [v4 startDate];
        uint64_t v12 = PKEndOfMonth(v9);
      }
      id v11 = (void *)v12;
      goto LABEL_13;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 112));
}

void __47__PKSpendingSummaryFetcher__processNextRequest__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "_processNextRequest", (void)v9);
}

- (void)_spendingSummaryStartingWithDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 withLastPeriodChange:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__36;
  v73 = __Block_byref_object_dispose__36;
  id v74 = [(PKSpendingSummaryFetcher *)self _cachedSpendingSummaryStartingWithDate:v12 type:a5 withLastPeriodChange:v8];
  if (!v70[5])
  {
    id v17 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceIdentifiers];
    v29 = [(PKSpendingSummaryFetcher *)self _cacheForType:a5];
    uint64_t v18 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    id v19 = v18;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x3032000000;
    v64[3] = __Block_byref_object_copy__36;
    v64[4] = __Block_byref_object_dispose__36;
    id v65 = 0;
    if (!self->_earliestSpendingByAnotherUser)
    {
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_2;
      v63[3] = &unk_1E56E9040;
      v63[4] = self;
      [(PKAsyncUnaryOperationComposer *)v18 addOperation:v63];
    }
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_6;
    v57[3] = &unk_1E56E9150;
    BOOL v62 = v8;
    id v20 = v12;
    id v58 = v20;
    long long v59 = self;
    long long v60 = v64;
    unint64_t v61 = a5;
    [(PKAsyncUnaryOperationComposer *)v19 addOperation:v57];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_8;
    v51[3] = &unk_1E56E91A0;
    v53 = &v69;
    v51[4] = self;
    id v21 = v20;
    BOOL v56 = v8;
    id v52 = v21;
    v54 = v64;
    unint64_t v55 = a5;
    [(PKAsyncUnaryOperationComposer *)v19 addOperation:v51];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_11;
    v43[3] = &unk_1E56E9240;
    v43[4] = self;
    id v22 = v17;
    id v44 = v22;
    id v23 = v21;
    id v45 = v23;
    id v24 = v13;
    id v46 = v24;
    v47 = &v69;
    v48 = v64;
    unint64_t v49 = a5;
    BOOL v50 = v8;
    [(PKAsyncUnaryOperationComposer *)v19 addOperation:v43];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_15;
    v38[3] = &unk_1E56E9290;
    v38[4] = self;
    id v16 = v22;
    id v39 = v16;
    id v25 = v23;
    id v40 = v25;
    id v41 = v24;
    v42 = &v69;
    [(PKAsyncUnaryOperationComposer *)v19 addOperation:v38];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_17;
    v36[3] = &unk_1E56E92B8;
    BOOL v37 = v8;
    v36[4] = self;
    v36[5] = &v69;
    [(PKAsyncUnaryOperationComposer *)v19 addOperation:v36];
    v26 = [MEMORY[0x1E4F1CA98] null];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_19;
    v30[3] = &unk_1E56E92E0;
    id v27 = v29;
    id v31 = v27;
    id v35 = &v69;
    id v32 = v25;
    id v33 = self;
    id v34 = v14;
    id v28 = [(PKAsyncUnaryOperationComposer *)v19 evaluateWithInput:v26 completion:v30];

    _Block_object_dispose(v64, 8);
    goto LABEL_7;
  }
  if (v14)
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke;
    block[3] = &unk_1E56E90B8;
    id v67 = v14;
    v68 = &v69;
    dispatch_async(replyQueue, block);
    id v16 = v67;
LABEL_7:
  }
  _Block_object_dispose(&v69, 8);
}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if ([*(id *)(*(void *)(a1 + 32) + 16) isSharedAccount])
  {
    BOOL v8 = [*(id *)(*(void *)(a1 + 32) + 8) transactionSources];
    long long v9 = [v8 objectsPassingTest:&__block_literal_global_117];

    long long v10 = [[PKTransactionSourceCollection alloc] initWithTransactionSources:v9];
    long long v11 = *(void **)(*(void *)(a1 + 32) + 80);
    id v12 = [(PKTransactionSourceCollection *)v10 transactionSourceIdentifiers];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_4;
    v16[3] = &unk_1E56E9100;
    v16[4] = *(void *)(a1 + 32);
    id v18 = v7;
    id v17 = v6;
    [v11 transactionsForTransactionSourceIdentifiers:v12 withTransactionSource:0 withBackingData:1 startDate:0 endDate:0 orderedByDate:-1 limit:1 completion:v16];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 160);
    *(void *)(v14 + 160) = v13;

    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type])
  {
    id v3 = [v2 accountUser];
    uint64_t v4 = [v3 isCurrentUser] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_5;
  v7[3] = &unk_1E56DEB98;
  id v8 = v3;
  uint64_t v9 = v4;
  id v11 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_5(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = [*(id *)(a1 + 32) anyObject];
    uint64_t v3 = [v2 transactionDate];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(v4 + 160);
    *(void *)(v4 + 160) = v3;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v7 = *(void *)(a1 + 40);
    id v2 = *(void **)(v7 + 160);
    *(void *)(v7 + 160) = v6;
  }

  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v8();
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v9 = [*(id *)(a1 + 32) dateByAddingTimeInterval:-1.0];
    id v10 = v9;
    uint64_t v11 = *(void *)(a1 + 56);
    if (v11)
    {
      if (v11 == 2)
      {
        uint64_t v12 = PKStartOfYear(v9);
      }
      else
      {
        if (v11 != 1)
        {
          uint64_t v13 = 0;
          goto LABEL_11;
        }
        uint64_t v12 = PKStartOfMonth(v9);
      }
    }
    else
    {
      uint64_t v12 = [(id)objc_opt_class() previousStartOfWeekFromDate:v9];
    }
    uint64_t v13 = (void *)v12;
    uint64_t v11 = *(void *)(a1 + 56);
LABEL_11:
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_7;
    v15[3] = &unk_1E56E9128;
    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    id v17 = v8;
    id v16 = v6;
    [v14 _spendingSummaryStartingWithDate:v13 endDate:v10 type:v11 withLastPeriodChange:0 completion:v15];

    goto LABEL_12;
  }
  (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
LABEL_12:
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) _cachedSpendingSummaryStartingWithDate:*(void *)(a1 + 40) type:*(void *)(a1 + 64) withLastPeriodChange:0];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v15 = *(unsigned __int8 *)(a1 + 72);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_9;
    v16[3] = &unk_1E56E9178;
    objc_copyWeak(&v20, &location);
    int8x16_t v19 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    id v18 = v9;
    id v17 = v8;
    [v13 _addInterestToSummaryIfNecessary:v14 withLastPeriodChange:v15 completion:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
  }
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v3) {
    BOOL v4 = WeakRetained == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_25;
  }
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v6 = [v3 totalSpending];
  [v5 setPreviousTotalSpending:v6];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) spendingsPerCalendarUnit];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) totalSpending];
        uint64_t v14 = [v13 amount];

        if (!v10 || [v14 compare:v10] == 1)
        {
          uint64_t v15 = v14;

          uint64_t v10 = v15;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);

    if (!v10) {
      goto LABEL_21;
    }
    id v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v7 = [WeakRetained[2] creditDetails];
    id v17 = [v7 currencyCode];
    id v18 = PKCurrencyAmountCreate(v10, v17, 0);
    [v16 setPreviousMaxAmount:v18];
  }
  else
  {
    uint64_t v10 = 0;
  }

LABEL_21:
  int8x16_t v19 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) insights];

  if (v19)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_10;
    v21[3] = &unk_1E56D83D8;
    id v23 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 32);
    [WeakRetained _addInsightsToSummary:v20 completion:v21];
  }
LABEL_25:
}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_11(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v8 + 80);
  uint64_t v11 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_12;
  v18[3] = &unk_1E56E9218;
  uint64_t v13 = *(void *)(a1 + 64);
  v18[4] = v8;
  uint64_t v23 = v13;
  uint64_t v25 = *(void *)(a1 + 80);
  id v19 = v11;
  id v14 = *(id *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 72);
  char v26 = *(unsigned char *)(a1 + 88);
  uint64_t v24 = v15;
  id v21 = v6;
  id v22 = v7;
  id v20 = v14;
  id v16 = v6;
  id v17 = v7;
  [v10 transactionsForTransactionSourceIdentifiers:v9 withTransactionSource:0 withBackingData:1 startDate:v19 endDate:v12 orderedByDate:1 limit:0 completion:v18];
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 64);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_13;
  v11[3] = &unk_1E56E91F0;
  uint64_t v6 = *(void *)(a1 + 72);
  v11[4] = v4;
  id v12 = v3;
  uint64_t v7 = *(void *)(a1 + 88);
  uint64_t v17 = v6;
  uint64_t v19 = v7;
  id v13 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 80);
  id v14 = v8;
  uint64_t v18 = v9;
  char v20 = *(unsigned char *)(a1 + 96);
  id v16 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 56);
  id v10 = v3;
  dispatch_async(v5, v11);
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_13(uint64_t a1)
{
  id v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v3 + 184);
  uint64_t v6 = *(void *)(v3 + 8);
  uint64_t v7 = [*(id *)(v3 + 16) creditDetails];
  id v8 = [v7 currencyCode];
  uint64_t v9 = [v2 summaryWithTransactions:v4 transactionSourceCollection:v6 accountUser:v5 currency:v8 type:*(void *)(a1 + 96) startDate:*(void *)(a1 + 48) endDate:*(void *)(a1 + 56) lastSummary:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  objc_initWeak(&location, *(id *)(a1 + 32));
  id v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 104);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_14;
  v17[3] = &unk_1E56E91C8;
  objc_copyWeak(&v20, &location);
  long long v16 = *(_OWORD *)(a1 + 72);
  id v15 = (id)v16;
  long long v19 = v16;
  id v18 = *(id *)(a1 + 64);
  [v12 _addInterestToSummaryIfNecessary:v13 withLastPeriodChange:v14 completion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_14(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v3 = [v2 endDate];
    objc_msgSend(v2, "setIsFamilySummary:", objc_msgSend(v3, "compare:", WeakRetained[20]) == 1);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_15(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  uint64_t v10 = *(void **)(v8 + 80);
  uint64_t v11 = [*(id *)(v8 + 16) accountIdentifier];
  uint64_t v12 = a1[6];
  uint64_t v13 = a1[7];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_16;
  v17[3] = &unk_1E56E9268;
  uint64_t v14 = a1[8];
  id v19 = v7;
  uint64_t v20 = v14;
  id v18 = v6;
  id v15 = v6;
  id v16 = v7;
  [v10 installmentPlanTransactionsForTransactionSourceIdentifiers:v9 accountIdentifier:v11 redeemed:1 withRedemptionType:0 startDate:v12 endDate:v13 completion:v17];
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) rewards];
    uint64_t v5 = [v4 totalAmount];
    uint64_t v24 = [v5 currency];

    id v6 = [v4 totalAmount];
    id v7 = [v6 amount];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = v7;
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F28C28] zero];
    }
    uint64_t v10 = v9;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v3;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v17 = [v16 rewardsTotalAmount];

          if (v17)
          {
            id v18 = [v16 rewardsTotalAmount];
            uint64_t v19 = [(NSDecimalNumber *)v10 decimalNumberByAdding:v18];

            uint64_t v10 = (NSDecimalNumber *)v19;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    uint64_t v20 = PKCurrencyAmountCreate(v10, v24, 0);
    [v4 setTotalAmount:v20];

    objc_msgSend(v4, "setTransactionCount:", objc_msgSend(v11, "count") + objc_msgSend(v4, "transactionCount"));
    id v21 = [v11 allObjects];
    id v22 = [v4 transactions];
    uint64_t v23 = [v21 arrayByAddingObjectsFromArray:v22];
    [v4 setTransactions:v23];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setRewards:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_17(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_18;
    v11[3] = &unk_1E56D83D8;
    id v13 = v7;
    id v12 = v6;
    [v9 _addInsightsToSummary:v10 completion:v11];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_19(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 56);
  if (v2)
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 48) + 72);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_20;
    v6[3] = &unk_1E56E90B8;
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 64);
    id v7 = v4;
    uint64_t v8 = v5;
    dispatch_async(v3, v6);
  }
}

uint64_t __106__PKSpendingSummaryFetcher__spendingSummaryStartingWithDate_endDate_type_withLastPeriodChange_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)_addInterestToSummaryIfNecessary:(id)a3 withLastPeriodChange:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  if (v6 && [v8 summaryType] == 1)
  {
    uint64_t v10 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceIdentifiers];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke;
    v12[3] = &unk_1E56D8BA8;
    v12[4] = self;
    id v13 = v8;
    id v14 = v10;
    id v15 = v9;
    id v11 = v10;
    [(PKSpendingSummaryFetcher *)self _fetchStatementsIfNecessaryWithCompletion:v12];
  }
  else
  {
    v9[2](v9);
  }
}

void __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 144);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_2;
  v30[3] = &unk_1E56E9308;
  id v31 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "pk_objectsPassingTest:", v30);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_3;
  v28[3] = &unk_1E56E9330;
  id v29 = *(id *)(a1 + 40);
  id v4 = (id)[v3 sortedArrayUsingComparator:v28];
  uint64_t v5 = [v3 firstObject];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = [v5 openingDate];
    id v8 = [v6 closingDate];
  }
  else
  {
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 88);
    uint64_t v10 = [*(id *)(a1 + 40) startDate];
    id v11 = *(void **)(*(void *)(a1 + 32) + 88);
    id v12 = [MEMORY[0x1E4F1C9C8] date];
    id v13 = [v11 components:14 fromDate:v12];
    LODWORD(v9) = [v9 date:v10 matchesComponents:v13];

    if (!v9)
    {
      id v8 = 0;
      id v7 = 0;
LABEL_11:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_12;
    }
    id v14 = [*(id *)(*(void *)(a1 + 32) + 16) creditDetails];
    id v15 = [v14 accountSummary];
    id v16 = [v15 balanceSummary];
    id v7 = [v16 openingDate];

    uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 16) creditDetails];
    id v18 = [v17 accountSummary];
    uint64_t v19 = [v18 balanceSummary];
    id v8 = [v19 closingDate];
  }
  if (v7) {
    BOOL v20 = v8 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20) {
    goto LABEL_11;
  }
  id v21 = *(void **)(*(void *)(a1 + 32) + 80);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_4;
  v23[3] = &unk_1E56E9358;
  uint64_t v22 = *(void *)(a1 + 48);
  id v24 = *(id *)(a1 + 40);
  id v7 = v7;
  id v25 = v7;
  id v8 = v8;
  id v26 = v8;
  id v27 = *(id *)(a1 + 56);
  [v21 transactionsForTransactionSourceIdentifiers:v22 withTransactionType:11 withTransactionSource:0 withBackingData:1 startDate:v7 endDate:v8 limit:0 completion:v23];

LABEL_12:
}

BOOL __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 closingDate];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) startDate];
    if ([v3 compare:v4] == 1)
    {
      uint64_t v5 = [*(id *)(a1 + 32) endDate];
      BOOL v6 = PKStartOfNextMonth(v5);
      BOOL v7 = [v3 compare:v6] == -1;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = [a2 closingDate];
  BOOL v7 = [*(id *)(a1 + 32) endDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  uint64_t v10 = [v5 closingDate];

  id v11 = [*(id *)(a1 + 32) endDate];
  [v10 timeIntervalSinceDate:v11];
  double v13 = v12;

  if (v9 >= v13) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = -1;
  }
  if (v9 > v13) {
    return 1;
  }
  else {
    return v14;
  }
}

void __93__PKSpendingSummaryFetcher__addInterestToSummaryIfNecessary_withLastPeriodChange_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v19 = v4;
    id v5 = objc_alloc_init(PKPaymentTransactionGroup);
    [(PKPaymentTransactionGroup *)v5 setType:7];
    BOOL v6 = [MEMORY[0x1E4F28C28] zero];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = [*(id *)(*((void *)&v20 + 1) + 8 * v11) amount];
          double v13 = v12;
          if (v12 && (objc_msgSend(v12, "pk_isNotANumber") & 1) == 0)
          {
            uint64_t v14 = [(NSDecimalNumber *)v6 decimalNumberByAdding:v13];

            BOOL v6 = (NSDecimalNumber *)v14;
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    id v15 = [*(id *)(a1 + 32) totalSpending];
    id v16 = [v15 currency];
    uint64_t v17 = PKCurrencyAmountCreate(v6, v16, 0);
    [(PKPaymentTransactionGroup *)v5 setTotalAmount:v17];

    [(PKPaymentTransactionGroup *)v5 setStartDate:*(void *)(a1 + 40)];
    [(PKPaymentTransactionGroup *)v5 setEndDate:*(void *)(a1 + 48)];
    id v18 = [v7 allObjects];
    [(PKPaymentTransactionGroup *)v5 setTransactions:v18];

    [(PKPaymentTransactionGroup *)v5 setTransactionCount:v19];
    [*(id *)(a1 + 32) setInterest:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_fetchStatementsIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_statements)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    BOOL v6 = +[PKAccountService sharedInstance];
    id v7 = [(PKAccount *)self->_account accountIdentifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__PKSpendingSummaryFetcher__fetchStatementsIfNecessaryWithCompletion___block_invoke;
    v8[3] = &unk_1E56E9380;
    v8[4] = self;
    id v9 = v5;
    [v6 creditStatementsForAccountIdentifier:v7 completion:v8];
  }
}

uint64_t __70__PKSpendingSummaryFetcher__fetchStatementsIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 allObjects];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v3;

  BOOL v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v6();
}

- (void)_addInsightsToSummary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (PKFinHealthInsightsEnabled())
  {
    uint64_t v8 = [v6 altDSID];
    if ([v8 length])
    {
    }
    else
    {
      BOOL v9 = [(PKAccount *)self->_account hideSpendingInsights];

      if (!v9)
      {
        insightsFetcher = self->_insightsFetcher;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __61__PKSpendingSummaryFetcher__addInsightsToSummary_completion___block_invoke;
        v12[3] = &unk_1E56E93A8;
        id v13 = v6;
        uint64_t v14 = v7;
        [(PKSpendingInsightsFetcher *)insightsFetcher fetchInsightTrendsForSummary:v13 completion:v12];

        goto LABEL_11;
      }
    }
  }
  if ([(PKAccount *)self->_account hideSpendingInsights])
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Skipping adding insights to summary because hideSpendingInsights supportedFeature is present", buf, 2u);
    }
  }
  if (v7) {
    v7[2](v7);
  }
LABEL_11:
}

void __61__PKSpendingSummaryFetcher__addInsightsToSummary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v5;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Received trends: %@ error: %@", buf, 0x16u);
  }

  [*(id *)(a1 + 32) setInsights:v5];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "orderedSpendingCategories", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v5, "spendingTrendForMerchantCategory:", objc_msgSend(v13, "merchantCategory"));
        if (v14) {
          [v13 setTrend:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(void))(v15 + 16))();
  }
}

- (id)_cacheForType:(unint64_t)a3
{
  if (a3 > 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = (&self->_weeklySummaryItemsPerStartDate)[a3];
  }
  return v4;
}

+ (id)summaryWithTransactions:(id)a3 transactionSourceCollection:(id)a4 accountUser:(id)a5 currency:(id)a6 type:(unint64_t)a7 startDate:(id)a8 endDate:(id)a9 lastSummary:(id)a10
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = [a5 altDSID];
  id v49 = a1;
  unint64_t v50 = a7;
  v54 = v18;
  unint64_t v55 = v16;
  id v52 = v20;
  v53 = v19;
  v51 = v21;
  __int16 v23 = [a1 _summaryWithTransactions:v16 currency:v18 type:a7 startDate:v19 endDate:v20 lastSummary:v21 altDSID:v22];

  id v24 = [v17 transactionSourcesForType:2];

  if (a5 || !v24) {
    goto LABEL_28;
  }
  id v46 = v23;
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v25 = PKCurrentUserAltDSID();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v47 = v17;
  id v26 = [v17 transactionSources];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (!v27) {
    goto LABEL_25;
  }
  uint64_t v28 = v27;
  uint64_t v29 = *(void *)v59;
  do
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v59 != v29) {
        objc_enumerationMutation(v26);
      }
      id v31 = *(void **)(*((void *)&v58 + 1) + 8 * i);
      id v32 = [v31 transactionSourceIdentifiers];
      if (![v32 count])
      {
LABEL_12:
        id v34 = 0;
        goto LABEL_23;
      }
      uint64_t v33 = [v31 type];
      if (v33 != 2)
      {
        if (v33) {
          goto LABEL_12;
        }
        id v34 = v25;
LABEL_20:
        if (!v34) {
          goto LABEL_23;
        }
LABEL_21:
        id v40 = [v55 allObjects];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __136__PKSpendingSummaryFetcher_summaryWithTransactions_transactionSourceCollection_accountUser_currency_type_startDate_endDate_lastSummary___block_invoke;
        v56[3] = &unk_1E56E93D0;
        id v57 = v32;
        id v41 = objc_msgSend(v40, "pk_objectsPassingTest:", v56);

        v42 = [MEMORY[0x1E4F1CAD0] setWithArray:v41];
        v43 = [v49 _summaryWithTransactions:v42 currency:v54 type:v50 startDate:v53 endDate:v52 lastSummary:v51 altDSID:v34];

        [v48 setObject:v43 forKey:v34];
        id v37 = v57;
LABEL_22:

        goto LABEL_23;
      }
      id v35 = [v31 accountUser];
      id v36 = [v35 altDSID];

      id v37 = v25;
      id v38 = v36;
      if (v37 == v38)
      {

        id v34 = v37;
        goto LABEL_22;
      }
      id v34 = v38;
      if (!v25 || !v38)
      {

        goto LABEL_20;
      }
      char v39 = [v37 isEqualToString:v38];

      if ((v39 & 1) == 0) {
        goto LABEL_21;
      }
LABEL_23:
    }
    uint64_t v28 = [v26 countByEnumeratingWithState:&v58 objects:v62 count:16];
  }
  while (v28);
LABEL_25:

  __int16 v23 = v46;
  if ([v48 count])
  {
    id v44 = (void *)[v48 copy];
    [v46 setSpendingsPerAltDSID:v44];
  }
  id v17 = v47;
LABEL_28:

  return v23;
}

uint64_t __136__PKSpendingSummaryFetcher_summaryWithTransactions_transactionSourceCollection_accountUser_currency_type_startDate_endDate_lastSummary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 transactionSourceIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

+ (id)_summaryWithTransactions:(id)a3 currency:(id)a4 type:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 lastSummary:(id)a8 altDSID:(id)a9
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v132 = (NSString *)a4;
  id v15 = a6;
  id v16 = a7;
  id v129 = a8;
  id v17 = a9;
  id v18 = objc_alloc_init(PKSpendingSummary);
  [(PKSpendingSummary *)v18 setStartDate:v15];
  [(PKSpendingSummary *)v18 setEndDate:v16];
  [(PKSpendingSummary *)v18 setSummaryType:a5];
  v133 = v18;
  v126 = v17;
  context = (void *)MEMORY[0x192FDC630]([(PKSpendingSummary *)v18 setAltDSID:v17]);
  v134 = [MEMORY[0x1E4F28C28] zero];
  id v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v20 = v19;
  unint64_t v148 = a5;
  if (a5 > 2) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = *(void *)&__const__Z21PDOSTransactionCreatePKc_prefix[8 * a5 + 16];
  }
  -[PKSpendingSummary setSummaryUnit:](v18, "setSummaryUnit:", [v19 component:v21 fromDate:v15]);
  id v137 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v141 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v144 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v146 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v139 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v149 = [MEMORY[0x1E4F28C28] zero];
  id v143 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v136 = [MEMORY[0x1E4F28C28] zero];
  id v135 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [MEMORY[0x1E4F28C28] zero];
  uint64_t v22 = v147 = v20;
  v127 = v14;
  id obj = [a1 _sortedTransactions:v14 ascending:0];
  id v23 = v15;
  id v130 = v23;
  uint64_t v24 = v22;
  do
  {
    uint64_t v25 = objc_alloc_init(PKSpendingSummary);
    [(PKSpendingSummary *)v25 setStartDate:v23];
    if (v148)
    {
      if (v148 == 2)
      {
        uint64_t v29 = PKEndOfMonth(v23);

        PKStartOfNextMonth(v23);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = [v147 component:4 fromDate:v29];
        uint64_t v31 = [v147 component:2 fromDate:v29];
        uint64_t v32 = [v147 component:4 fromDate:v27];
        uint64_t v33 = [v147 component:2 fromDate:v27];
        BOOL v34 = v30 == v32 && v31 == v33;
        int v28 = !v34;
        if (v34) {
          id v35 = v27;
        }
        else {
          id v35 = (void *)v29;
        }
        id v36 = v35;

        v145 = v36;
        id v16 = (id)v29;
      }
      else
      {
        if (v148 != 1)
        {
          v145 = v23;
          int v28 = 0;
          goto LABEL_32;
        }
        id v26 = [v147 nextDateAfterDate:v23 matchingUnit:512 value:2 options:512];
        if (!v26) {
          id v26 = v16;
        }
        id v27 = v26;

        if ([v16 compare:v27] == 1)
        {
          int v28 = 0;
          v145 = v27;
        }
        else
        {
          id v16 = v16;

          int v28 = 1;
          v145 = v16;
        }
      }
    }
    else
    {
      uint64_t v37 = [v147 component:512 fromDate:v23];
      if (v37 == 1)
      {
        id v38 = v16;
        id v16 = v38;
        int v28 = 1;
      }
      else
      {
        if (v37 == 7) {
          uint64_t v39 = 1;
        }
        else {
          uint64_t v39 = v37 + 1;
        }
        id v38 = [v147 nextDateAfterDate:v23 matchingUnit:512 value:v39 options:512];
        int v28 = 0;
      }
      id v27 = v23;
      v145 = v38;
    }

    uint64_t v22 = v24;
LABEL_32:
    id v23 = v145;
    id v40 = [v145 dateByAddingTimeInterval:-1.0];
    [(PKSpendingSummary *)v25 setEndDate:v40];

    [v141 addObject:v25];
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v144 addObject:v41];

    v42 = (void *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithFloat:0.0];
    [v146 addObject:v42];
  }
  while (!v28);
  id v128 = v16;
  unint64_t v43 = 0x1E4F28000uLL;
  v142 = [MEMORY[0x1E4F28C28] zero];
  v138 = [MEMORY[0x1E4F28C28] zero];
  [v147 setFirstWeekday:2];
  long long v168 = 0u;
  long long v169 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  id obja = obj;
  uint64_t v44 = [obja countByEnumeratingWithState:&v166 objects:v173 count:16];
  if (!v44) {
    goto LABEL_75;
  }
  uint64_t v45 = v44;
  uint64_t v46 = *(void *)v167;
  id v47 = v144;
  id v48 = v139;
  uint64_t v150 = *(void *)v167;
  while (2)
  {
    uint64_t v49 = 0;
    while (2)
    {
      if (*(void *)v167 != v46) {
        objc_enumerationMutation(obja);
      }
      unint64_t v50 = *(void **)(*((void *)&v166 + 1) + 8 * v49);
      if (!TransactionIsValidForSummary(v50)) {
        goto LABEL_73;
      }
      uint64_t v51 = [v50 transactionType];
      if ([v50 transactionType] != 1)
      {
        if (v51 == 7)
        {
          id v52 = [v50 amount];
          if (!v52) {
            goto LABEL_72;
          }
          v53 = (void *)v22;
          long long v59 = [*(id *)(v43 + 3112) notANumber];
          uint64_t v60 = [v52 compare:v59];

          if (!v60) {
            goto LABEL_71;
          }
          [v135 addObject:v50];
          BOOL v56 = v53;
          v53 = [v53 decimalNumberByAdding:v52];
          goto LABEL_70;
        }
        if (v51 == 10)
        {
          [v143 addObject:v50];
          if ((unint64_t)[v50 transactionStatus] > 1) {
            goto LABEL_73;
          }
          id v52 = [v50 amount];
          if (!v52) {
            goto LABEL_72;
          }
          v53 = (void *)v22;
          id v57 = [*(id *)(v43 + 3112) notANumber];
          uint64_t v58 = [v52 compare:v57];

          if (!v58) {
            goto LABEL_71;
          }
          BOOL v56 = v136;
          v136 = [(NSDecimalNumber *)v136 decimalNumberByAdding:v52];
LABEL_70:

          goto LABEL_71;
        }
        id v52 = [v50 transactionDate];
        switch(v148)
        {
          case 0uLL:
            unint64_t v64 = ([v147 component:512 fromDate:v52] + 5) % 7;
            goto LABEL_60;
          case 1uLL:
            uint64_t v61 = [v147 rangeOfUnit:4096 inUnit:8 forDate:v52];
            BOOL v62 = v147;
            uint64_t v46 = v150;
            uint64_t v63 = 4096;
            break;
          case 2uLL:
            uint64_t v61 = [v147 rangeOfUnit:8 inUnit:4 forDate:v52];
            BOOL v62 = v147;
            uint64_t v46 = v150;
            uint64_t v63 = 8;
            break;
          default:
            unint64_t v64 = 0;
LABEL_60:
            unint64_t v65 = [v47 count];
            if ((v64 & 0x8000000000000000) != 0 || v65 <= v64) {
              goto LABEL_72;
            }
            v53 = (void *)v22;
            v66 = [v47 objectAtIndex:v64];
            [v66 addObject:v50];

            BOOL v56 = [v50 amount];
            if (v56)
            {
              id v67 = [v146 objectAtIndex:v64];
              v68 = [v67 decimalNumberByAdding:v56];
              unint64_t v43 = 0x1E4F28000;
              [v146 replaceObjectAtIndex:v64 withObject:v68];
            }
            uint64_t v69 = [v50 rewardsTotalAmount];
            v70 = v69;
            if (v69 && [v69 compare:v134])
            {
              [v137 addObject:v50];
              uint64_t v71 = [(NSDecimalNumber *)v138 decimalNumberByAdding:v70];

              v138 = (NSDecimalNumber *)v71;
            }
            else
            {
              v72 = [v50 rewards];
              v73 = [v72 rewardsItems];
              uint64_t v140 = [v73 count];

              if (v140) {
                [v137 addObject:v50];
              }
            }
            id v48 = v139;
            uint64_t v74 = [(NSDecimalNumber *)v142 decimalNumberByAdding:v56];

            v142 = (NSDecimalNumber *)v74;
            id v47 = v144;
            goto LABEL_70;
        }
        unint64_t v64 = [v62 component:v63 fromDate:v52] - v61;
        goto LABEL_60;
      }
      id v52 = [v50 amount];
      if (v52)
      {
        v53 = (void *)v22;
        v54 = [*(id *)(v43 + 3112) notANumber];
        uint64_t v55 = [v52 compare:v54];

        if (v55)
        {
          [v48 addObject:v50];
          BOOL v56 = v149;
          v149 = [(NSDecimalNumber *)v149 decimalNumberByAdding:v52];
          goto LABEL_70;
        }
LABEL_71:
        uint64_t v22 = (uint64_t)v53;
        uint64_t v46 = v150;
      }
LABEL_72:

LABEL_73:
      if (v45 != ++v49) {
        continue;
      }
      break;
    }
    uint64_t v45 = [obja countByEnumeratingWithState:&v166 objects:v173 count:16];
    if (v45) {
      continue;
    }
    break;
  }
LABEL_75:
  v151 = (NSDecimalNumber *)v22;

  v75 = PKCurrencyAmountCreate(v142, v132, 0);
  [(PKSpendingSummary *)v133 setTotalSpending:v75];

  v76 = (void *)[v141 copy];
  [(PKSpendingSummary *)v133 setSpendingsPerCalendarUnit:v76];

  v77 = [a1 _spendingCategoriesFromTransactions:obja currencyCode:v132];
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  uint64_t v78 = [v77 countByEnumeratingWithState:&v162 objects:v172 count:16];
  v79 = v128;
  if (v78)
  {
    uint64_t v80 = v78;
    uint64_t v81 = *(void *)v163;
    do
    {
      for (uint64_t i = 0; i != v80; ++i)
      {
        if (*(void *)v163 != v81) {
          objc_enumerationMutation(v77);
        }
        v83 = *(void **)(*((void *)&v162 + 1) + 8 * i);
        [v83 setStartDate:v130];
        [v83 setEndDate:v128];
      }
      uint64_t v80 = [v77 countByEnumeratingWithState:&v162 objects:v172 count:16];
    }
    while (v80);
  }
  [(PKSpendingSummary *)v133 setOrderedSpendingCategories:v77];
  v84 = [a1 _spendingMerchantsFromTransaction:obja currencyCode:v132];
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  uint64_t v85 = [v84 countByEnumeratingWithState:&v158 objects:v171 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v159;
    do
    {
      for (uint64_t j = 0; j != v86; ++j)
      {
        if (*(void *)v159 != v87) {
          objc_enumerationMutation(v84);
        }
        v89 = *(void **)(*((void *)&v158 + 1) + 8 * j);
        [v89 setStartDate:v130];
        [v89 setEndDate:v128];
      }
      uint64_t v86 = [v84 countByEnumeratingWithState:&v158 objects:v171 count:16];
    }
    while (v86);
  }
  [(PKSpendingSummary *)v133 setOrderedSpendingPerMerchants:v84];
  v90 = v141;
  if ([v141 count])
  {
    unint64_t v91 = 0;
    do
    {
      v92 = [v90 objectAtIndex:v91];
      v93 = [v144 objectAtIndex:v91];
      v94 = [a1 _spendingCategoriesFromTransactions:v93 currencyCode:v132];
      [v92 setOrderedSpendingCategories:v94];

      v95 = [a1 _spendingMerchantsFromTransaction:v93 currencyCode:v132];
      [v92 setOrderedSpendingPerMerchants:v95];

      v96 = [v146 objectAtIndex:v91];
      v97 = PKCurrencyAmountCreate(v96, v132, 0);
      [v92 setTotalSpending:v97];

      v90 = v141;
      ++v91;
    }
    while (v91 < [v141 count]);
  }
  v98 = objc_alloc_init(PKPaymentTransactionGroup);
  [(PKPaymentTransactionGroup *)v98 setType:4];
  v99 = PKCurrencyAmountCreate(v138, v132, 0);
  [(PKPaymentTransactionGroup *)v98 setTotalAmount:v99];

  v100 = v130;
  [(PKPaymentTransactionGroup *)v98 setStartDate:v130];
  [(PKPaymentTransactionGroup *)v98 setEndDate:v128];
  v101 = (void *)[v137 copy];
  [(PKPaymentTransactionGroup *)v98 setTransactions:v101];

  -[PKPaymentTransactionGroup setTransactionCount:](v98, "setTransactionCount:", [v137 count]);
  [(PKSpendingSummary *)v133 setRewards:v98];
  v102 = v129;
  if (v129)
  {
    v103 = [v129 totalSpending];
    [(PKSpendingSummary *)v133 setPreviousTotalSpending:v103];

    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    v104 = [v129 spendingsPerCalendarUnit];
    uint64_t v105 = [(NSDecimalNumber *)v104 countByEnumeratingWithState:&v154 objects:v170 count:16];
    if (v105)
    {
      uint64_t v106 = v105;
      v107 = 0;
      uint64_t v108 = *(void *)v155;
      do
      {
        for (uint64_t k = 0; k != v106; ++k)
        {
          if (*(void *)v155 != v108) {
            objc_enumerationMutation(v104);
          }
          v110 = [*(id *)(*((void *)&v154 + 1) + 8 * k) totalSpending];
          v111 = [v110 amount];

          if (!v107 || [v111 compare:v107] == 1)
          {
            v112 = v111;

            v107 = v112;
          }
        }
        uint64_t v106 = [(NSDecimalNumber *)v104 countByEnumeratingWithState:&v154 objects:v170 count:16];
      }
      while (v106);

      v79 = v128;
      v102 = v129;
      v100 = v130;
      if (v107)
      {
        v113 = PKCurrencyAmountCreate(v107, v132, 0);
        [(PKSpendingSummary *)v133 setPreviousMaxAmount:v113];

        goto LABEL_106;
      }
    }
    else
    {
      v107 = v104;
      v102 = v129;
      v100 = v130;
LABEL_106:
    }
  }
  if ([v139 count])
  {
    v114 = objc_alloc_init(PKPaymentTransactionGroup);
    [(PKPaymentTransactionGroup *)v114 setType:10];
    v115 = PKCurrencyAmountCreate(v149, v132, 0);
    [(PKPaymentTransactionGroup *)v114 setTotalAmount:v115];

    [(PKPaymentTransactionGroup *)v114 setStartDate:v100];
    [(PKPaymentTransactionGroup *)v114 setEndDate:v79];
    v116 = (void *)[v139 copy];
    [(PKPaymentTransactionGroup *)v114 setTransactions:v116];

    -[PKPaymentTransactionGroup setTransactionCount:](v114, "setTransactionCount:", [v139 count]);
    [(PKSpendingSummary *)v133 setRefunds:v114];
  }
  v117 = v143;
  if ([v143 count])
  {
    v118 = objc_alloc_init(PKPaymentTransactionGroup);
    [(PKPaymentTransactionGroup *)v118 setType:9];
    v119 = PKCurrencyAmountCreate(v136, v132, 0);
    [(PKPaymentTransactionGroup *)v118 setTotalAmount:v119];

    [(PKPaymentTransactionGroup *)v118 setStartDate:v100];
    [(PKPaymentTransactionGroup *)v118 setEndDate:v79];
    v120 = (void *)[v143 copy];
    [(PKPaymentTransactionGroup *)v118 setTransactions:v120];

    v117 = v143;
    -[PKPaymentTransactionGroup setTransactionCount:](v118, "setTransactionCount:", [v143 count]);
    [(PKSpendingSummary *)v133 setPayments:v118];
  }
  if ([v135 count])
  {
    v121 = objc_alloc_init(PKPaymentTransactionGroup);
    [(PKPaymentTransactionGroup *)v121 setType:11];
    v122 = PKCurrencyAmountCreate(v151, v132, 0);
    [(PKPaymentTransactionGroup *)v121 setTotalAmount:v122];

    [(PKPaymentTransactionGroup *)v121 setStartDate:v100];
    [(PKPaymentTransactionGroup *)v121 setEndDate:v79];
    v123 = (void *)[v135 copy];
    [(PKPaymentTransactionGroup *)v121 setTransactions:v123];

    v117 = v143;
    -[PKPaymentTransactionGroup setTransactionCount:](v121, "setTransactionCount:", [v135 count]);
    [(PKSpendingSummary *)v133 setAdjustments:v121];
  }

  return v133;
}

+ (id)_spendingMerchantsFromTransaction:(id)a3 currencyCode:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v48 = (NSString *)a4;
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke;
  aBlock[3] = &unk_1E56E93F8;
  id v43 = v9;
  id v60 = v43;
  id v47 = v8;
  id v61 = v47;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = objc_msgSend(v6, "pk_objectsPassingTest:", &__block_literal_global_81_0);

  double v12 = v10;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v55 objects:v63 count:16];
  uint64_t v44 = v13;
  uint64_t v45 = (void (**)(void, void, void))v12;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v56;
    uint64_t v46 = v7;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v56 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v19 = objc_msgSend(v18, "merchant", v43);
        id v20 = [v19 uniqueIdentifier];
        uint64_t v21 = [v7 objectForKey:v20];

        if (v21)
        {
          (*((void (**)(void *, void *, void *))v12 + 2))(v12, v20, v18);
        }
        else
        {
          uint64_t v22 = v7;
          uint64_t v23 = v15;
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke_3;
          v53[3] = &unk_1E56E9440;
          id v24 = v19;
          id v54 = v24;
          uint64_t v25 = [v22 keysOfEntriesPassingTest:v53];
          if ([v25 count])
          {
            id v26 = [v25 anyObject];
            id v27 = [v22 objectForKey:v26];

            uint64_t v28 = [v27 uniqueIdentifier];

            if ([v24 hasBetterVisualPropertiesThanMerchant:v27]) {
              [v46 setObject:v24 forKey:v28];
            }
            double v12 = v45;
            ((void (**)(void, uint64_t, void *))v45)[2](v45, v28, v18);

            id v20 = (void *)v28;
            id v13 = v44;
          }
          else
          {
            [v22 setObject:v24 forKey:v20];
            double v12 = v45;
            ((void (**)(void, void *, void *))v45)[2](v45, v20, v18);
          }

          uint64_t v15 = v23;
          id v7 = v46;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v15);
  }

  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v30 = v43;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v50 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v49 + 1) + 8 * j);
        id v36 = objc_alloc_init(PKPaymentTransactionGroup);
        uint64_t v37 = [v47 objectForKey:v35];
        id v38 = PKCurrencyAmountCreate(v37, v48, 0);
        [(PKPaymentTransactionGroup *)v36 setTotalAmount:v38];

        uint64_t v39 = [v30 objectForKey:v35];
        [(PKPaymentTransactionGroup *)v36 setTransactions:v39];
        -[PKPaymentTransactionGroup setTransactionCount:](v36, "setTransactionCount:", [v39 count]);
        id v40 = [v7 objectForKey:v35];
        [(PKPaymentTransactionGroup *)v36 setMerchant:v40];
        [(PKPaymentTransactionGroup *)v36 setType:1];
        [v29 addObject:v36];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v49 objects:v62 count:16];
    }
    while (v32);
  }

  [v29 sortUsingComparator:&__block_literal_global_85];
  id v41 = (void *)[v29 copy];

  return v41;
}

void __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:v13];
  uint64_t v7 = [*(id *)(a1 + 40) objectForKey:v13];
  id v8 = (void *)v7;
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(a1 + 32) setObject:v6 forKey:v13];
    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!v7)
  {
LABEL_3:
    id v8 = [MEMORY[0x1E4F28C28] zero];
  }
LABEL_4:
  uint64_t v9 = [v5 amount];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    if ([v5 transactionType] != 1
      || (objc_msgSend(v10, "pk_isNegativeNumber") & 1) != 0
      || (objc_msgSend(v10, "pk_negativeValue"),
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v10,
          (uint64_t v10 = (void *)v11) != 0))
    {
      uint64_t v12 = [v8 decimalNumberByAdding:v10];

      id v8 = (void *)v12;
    }
  }
  [*(id *)(a1 + 40) setObject:v8 forKey:v13];
  [v6 addObject:v5];
}

BOOL __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (TransactionIsValidForSummary(v2))
  {
    uint64_t v3 = [v2 merchant];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 shouldBeCombinedWithMerchant:*(void *)(a1 + 32)];
  if (result) {
    *a4 = 1;
  }
  return result;
}

uint64_t __75__PKSpendingSummaryFetcher__spendingMerchantsFromTransaction_currencyCode___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 totalAmount];
  id v6 = [v5 amount];
  uint64_t v7 = [v4 totalAmount];

  id v8 = [v7 amount];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

+ (id)_spendingCategoriesFromTransactions:(id)a3 currencyCode:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v42 = (NSString *)a4;
  context = (void *)MEMORY[0x192FDC630]();
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
  id v40 = v6;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    uint64_t v39 = *(void *)v49;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v48 + 1) + 8 * v10);
        if (TransactionIsValidForSummary(v11))
        {
          uint64_t v12 = objc_msgSend(v11, "merchant", context);
          if (v12)
          {
            id v13 = (void *)v12;
            uint64_t v14 = [v11 transactionType];

            if (v14 != 1)
            {
              uint64_t v15 = [v11 merchant];
              uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "category"));
              id v17 = [v41 objectForKey:v16];
              uint64_t v18 = [v43 objectForKey:v16];
              id v19 = (void *)v18;
              if (v17)
              {
                if (v18)
                {
LABEL_11:
                  id v20 = objc_alloc(MEMORY[0x1E4F28C28]);
                  uint64_t v21 = [v11 amount];
                  [v21 floatValue];
                  uint64_t v22 = objc_msgSend(v20, "initWithFloat:");
                  uint64_t v23 = [v19 decimalNumberByAdding:v22];

                  [v43 setObject:v23 forKey:v16];
                  [v17 addObject:v11];

                  uint64_t v9 = v39;
                  id v6 = v40;
                  goto LABEL_12;
                }
              }
              else
              {
                id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [v41 setObject:v17 forKey:v16];
                if (v19) {
                  goto LABEL_11;
                }
              }
              id v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithFloat:0.0];
              goto LABEL_11;
            }
          }
        }
LABEL_12:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v24 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
      uint64_t v8 = v24;
    }
    while (v24);
  }

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v26 = v41;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v32 = objc_alloc_init(PKPaymentTransactionGroup);
        uint64_t v33 = [v43 objectForKey:v31];
        BOOL v34 = PKCurrencyAmountCreate(v33, v42, 0);
        [(PKPaymentTransactionGroup *)v32 setTotalAmount:v34];

        uint64_t v35 = [v26 objectForKey:v31];
        [(PKPaymentTransactionGroup *)v32 setTransactions:v35];
        -[PKPaymentTransactionGroup setTransactionCount:](v32, "setTransactionCount:", [v35 count]);
        -[PKPaymentTransactionGroup setMerchantCategory:](v32, "setMerchantCategory:", [v31 integerValue]);
        [(PKPaymentTransactionGroup *)v32 setType:0];
        [v25 addObject:v32];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v28);
  }

  [v25 sortUsingComparator:&__block_literal_global_88];
  id v36 = (void *)[v25 copy];

  return v36;
}

uint64_t __77__PKSpendingSummaryFetcher__spendingCategoriesFromTransactions_currencyCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 totalAmount];
  id v6 = [v5 amount];
  uint64_t v7 = [v4 totalAmount];

  uint64_t v8 = [v7 amount];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

+ (id)_sortedTransactions:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F29008];
  id v6 = a3;
  uint64_t v7 = [v5 sortDescriptorWithKey:@"transactionDate" ascending:v4];
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v9 = [v6 sortedArrayUsingDescriptors:v8];

  return v9;
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceIdentifiers];
    int v9 = [v8 containsObject:v6];

    if (v9)
    {
      workQueue = self->_workQueue;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __78__PKSpendingSummaryFetcher_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
      v11[3] = &unk_1E56D8A90;
      void v11[4] = self;
      id v12 = v7;
      dispatch_async(workQueue, v11);
    }
  }
}

uint64_t __78__PKSpendingSummaryFetcher_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 176);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 176);
    *(void *)(v4 + 176) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 176);
  }
  id v6 = [*(id *)(a1 + 40) transactionDate];
  [v2 addObject:v6];

  id v7 = *(void **)(a1 + 32);
  return [v7 _startTimerIfNecessary];
}

- (void)_invalidateSummariesForPendingTransactionUpdates
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(NSMutableArray *)self->_pendingTransactionDates count];
    *(_DWORD *)buf = 134349056;
    uint64_t v68 = v4;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Summary fetcher timer fired, updating for %{public}lu new transactions", buf, 0xCu);
  }
  oslog = v3;

  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v44 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = self->_pendingTransactionDates;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v60 objects:v71 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    LOBYTE(v7) = 0;
    LOBYTE(v8) = 0;
    uint64_t v43 = *(void *)v61;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v61 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v44, "components:fromDate:", 4110, v10, oslog);
        if ((v8 & 1) != 0 || !self->_oldestTransactionDate)
        {
          int v8 = 1;
          if (v7) {
            goto LABEL_19;
          }
        }
        else if (objc_msgSend(v10, "compare:") == -1)
        {
          int v8 = [v44 date:self->_oldestTransactionDate matchesComponents:v11] ^ 1;
          if (v7)
          {
LABEL_19:
            int v7 = 1;
            goto LABEL_20;
          }
        }
        else
        {
          int v8 = 0;
          if (v7) {
            goto LABEL_19;
          }
        }
        if (!self->_newestTransactionDate) {
          goto LABEL_19;
        }
        if (objc_msgSend(v10, "compare:") == 1) {
          int v7 = [v44 date:self->_newestTransactionDate matchesComponents:v11] ^ 1;
        }
        else {
          int v7 = 0;
        }
LABEL_20:
        id v12 = [(id)objc_opt_class() previousStartOfWeekFromDate:v10];
        id v13 = [(NSCache *)self->_weeklySummaryItemsPerStartDate objectForKey:v12];

        if (v13) {
          [v40 addObject:v12];
        }
        uint64_t v14 = PKStartOfMonth(v10);
        uint64_t v15 = [(NSCache *)self->_monthlySummaryItemsPerStartDate objectForKey:v14];

        if (v15) {
          [v41 addObject:v14];
        }
        uint64_t v16 = PKStartOfYear(v10);
        id v17 = [(NSCache *)self->_yearlySummaryItemsPerStartDate objectForKey:v16];

        if (v17) {
          [v42 addObject:v16];
        }
      }
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v60 objects:v71 count:16];
      if (!v6) {
        goto LABEL_30;
      }
    }
  }
  int v7 = 0;
  int v8 = 0;
LABEL_30:

  if ((v8 & 1) != 0 || v7)
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = @"NO";
      if (v8) {
        id v19 = @"YES";
      }
      else {
        id v19 = @"NO";
      }
      if (v7) {
        uint64_t v18 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v68 = (uint64_t)v19;
      __int16 v69 = 2114;
      v70 = v18;
      _os_log_impl(&dword_190E10000, oslog, OS_LOG_TYPE_DEFAULT, "Summary fetcher invalidating available summaries due to hasTransactionOlderThanOldestDate: %{public}@, hasTransactionNewerThanNewestDate: %{public}@", buf, 0x16u);
    }

    [(PKSpendingSummaryFetcher *)self _accessObserversWithHandler:&__block_literal_global_103_0];
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v20 = v40;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v57 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v56 + 1) + 8 * j);
        -[NSCache removeObjectForKey:](self->_weeklySummaryItemsPerStartDate, "removeObjectForKey:", v25, oslog);
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_2;
        v55[3] = &unk_1E56E94A8;
        v55[4] = v25;
        [(PKSpendingSummaryFetcher *)self _accessObserversWithHandler:v55];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v22);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v26 = v41;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v52 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v51 + 1) + 8 * k);
        -[NSCache removeObjectForKey:](self->_monthlySummaryItemsPerStartDate, "removeObjectForKey:", v31, oslog);
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_3;
        v50[3] = &unk_1E56E94A8;
        v50[4] = v31;
        [(PKSpendingSummaryFetcher *)self _accessObserversWithHandler:v50];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v28);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v32 = v42;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v64 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v47;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v47 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v46 + 1) + 8 * m);
        -[NSCache removeObjectForKey:](self->_yearlySummaryItemsPerStartDate, "removeObjectForKey:", v37, oslog);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_4;
        v45[3] = &unk_1E56E94A8;
        v45[4] = v37;
        [(PKSpendingSummaryFetcher *)self _accessObserversWithHandler:v45];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v46 objects:v64 count:16];
    }
    while (v34);
  }

  [(NSMutableArray *)self->_pendingTransactionDates removeAllObjects];
}

void __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 invalidatedSummariesAvailable];
  }
}

void __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 invalidatedSpendingSummaryOfType:0 startingWithDate:*(void *)(a1 + 32)];
  }
}

void __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 invalidatedSpendingSummaryOfType:1 startingWithDate:*(void *)(a1 + 32)];
  }
}

void __76__PKSpendingSummaryFetcher__invalidateSummariesForPendingTransactionUpdates__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 invalidatedSpendingSummaryOfType:2 startingWithDate:*(void *)(a1 + 32)];
  }
}

- (void)_startTimerIfNecessary
{
  pendingTransactionTimer = self->_pendingTransactionTimer;
  uint64_t v4 = PKLogFacilityTypeGetObject(0xEuLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (pendingTransactionTimer)
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Summary fetcher postponing pending update timer", (uint8_t *)buf, 2u);
    }

    uint64_t v6 = self->_pendingTransactionTimer;
    dispatch_time_t v7 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  }
  else
  {
    if (v5)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Summary fetcher starting pending update timer", (uint8_t *)buf, 2u);
    }

    int v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_workQueue);
    int v9 = self->_pendingTransactionTimer;
    self->_pendingTransactionTimer = v8;

    uint64_t v10 = self->_pendingTransactionTimer;
    dispatch_time_t v11 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    objc_initWeak(buf, self);
    id v12 = self->_pendingTransactionTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __50__PKSpendingSummaryFetcher__startTimerIfNecessary__block_invoke;
    handler[3] = &unk_1E56DD818;
    objc_copyWeak(&v17, buf);
    dispatch_source_set_event_handler(v12, handler);
    id v13 = self->_pendingTransactionTimer;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__PKSpendingSummaryFetcher__startTimerIfNecessary__block_invoke_2;
    v14[3] = &unk_1E56DD818;
    objc_copyWeak(&v15, buf);
    dispatch_source_set_cancel_handler(v13, v14);
    dispatch_resume((dispatch_object_t)self->_pendingTransactionTimer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(buf);
  }
}

void __50__PKSpendingSummaryFetcher__startTimerIfNecessary__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[21];
    id v3 = WeakRetained;
    if (v2)
    {
      WeakRetained[21] = 0;
    }
    [v3 _invalidateSummariesForPendingTransactionUpdates];
    WeakRetained = v3;
  }
}

void __50__PKSpendingSummaryFetcher__startTimerIfNecessary__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[21];
    WeakRetained[21] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
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
    BOOL v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_observersLock);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__PKSpendingSummaryFetcher__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E56D8A18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __56__PKSpendingSummaryFetcher__accessObserversWithHandler___block_invoke(uint64_t a1)
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

+ (id)previousStartOfWeekFromDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  uint64_t v5 = [v3 currentCalendar];
  if ([v5 component:512 fromDate:v4] != 2)
  {
    uint64_t v6 = [v5 nextDateAfterDate:v4 matchingUnit:512 value:2 options:260];

    id v4 = (id)v6;
  }
  long long v7 = [v5 components:28702 fromDate:v4];

  long long v8 = [v5 dateFromComponents:v7];

  return v8;
}

+ (id)nextStartOfWeekFromDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  uint64_t v5 = [v3 currentCalendar];
  uint64_t v6 = [v5 nextDateAfterDate:v4 matchingUnit:512 value:2 options:256];

  return v6;
}

- (void)statementsChangedForAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKAccount *)self->_account accountIdentifier];
  id v6 = v4;
  id v7 = v5;
  if (v7 == v6)
  {
  }
  else
  {
    long long v8 = v7;
    if (!v6 || !v7)
    {

      goto LABEL_11;
    }
    int v9 = [v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_11;
    }
  }
  long long v10 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Invalidating summaries due to statement change", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKSpendingSummaryFetcher_statementsChangedForAccountIdentifier___block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(workQueue, block);
LABEL_11:
}

uint64_t __66__PKSpendingSummaryFetcher_statementsChangedForAccountIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  id v2 = *(void **)(a1 + 32);
  return [v2 _accessObserversWithHandler:&__block_literal_global_109];
}

void __66__PKSpendingSummaryFetcher_statementsChangedForAccountIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 invalidatedSpendingSummariesOfType:1];
  }
}

- (void)_timeZoneChanged:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Invalidate summaries due to time zone change", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PKSpendingSummaryFetcher__timeZoneChanged___block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __45__PKSpendingSummaryFetcher__timeZoneChanged___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  [*(id *)(a1 + 32) _resetCurrentCalendar];
  id v2 = *(void **)(a1 + 32);
  return [v2 _accessObserversWithHandler:&__block_literal_global_113_0];
}

void __45__PKSpendingSummaryFetcher__timeZoneChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 invalidatedSummariesAvailable];
  }
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_pendingTransactionDates, 0);
  objc_storeStrong((id *)&self->_pendingTransactionTimer, 0);
  objc_storeStrong((id *)&self->_earliestSpendingByAnotherUser, 0);
  objc_storeStrong((id *)&self->_insightsFetcher, 0);
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong((id *)&self->_blockPendingRequests, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_newestTransactionDate, 0);
  objc_storeStrong((id *)&self->_oldestTransactionDate, 0);
  objc_storeStrong((id *)&self->_yearlySummaryItemsPerStartDate, 0);
  objc_storeStrong((id *)&self->_monthlySummaryItemsPerStartDate, 0);
  objc_storeStrong((id *)&self->_weeklySummaryItemsPerStartDate, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end