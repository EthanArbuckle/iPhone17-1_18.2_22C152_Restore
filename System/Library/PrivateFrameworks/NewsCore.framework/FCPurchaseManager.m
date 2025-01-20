@interface FCPurchaseManager
- (BOOL)anyOngoingPurchases;
- (BOOL)isPurchaseOngoingForTagID:(id)a3;
- (BOOL)isPurchaseTimeElapsedWithEntry:(BOOL)result;
- (FCPurchaseFlowOverrideProviderType)purchaseFlowOverrideProvider;
- (FCPurchaseManager)init;
- (FCPurchaseManager)initWithCloudContext:(id)a3 purchaseIntegrityChecker:(id)a4 purchaseReceiptProvider:(id)a5 paymentTransactionManager:(id)a6 bundleSubscriptionManager:(id)a7 keyValueStoreOption:(unint64_t)a8;
- (FCPurchaseManagerDelegate)delegate;
- (id)fetchPurchaseMetadataForPurchaseID:(id)a3 restorePurchase:(BOOL)a4;
- (void)_purchaseFailedWithProductID:(uint64_t)a3 transactionState:(void *)a4 transactionError:(void *)a5 ongoingPurchaseEntry:;
- (void)activityObservingApplicationDidEnterBackground;
- (void)activityObservingApplicationWillEnterForeground;
- (void)cleanupStaleOngoingPurchaseEntries;
- (void)finishPurchaseTransactionWithProductID:(uint64_t)a1;
- (void)performEntitlementWithTagID:(void *)a3 completion:;
- (void)setDelegate:(id)a3;
- (void)setPurchaseFlowOverrideProvider:(id)a3;
- (void)simulateFailurePurchaseWithProductID:(id)a3 transactionState:(int64_t)a4 error:(id)a5;
- (void)simulateSuccessfulPurchaseWithProductID:(id)a3 tagID:(id)a4 purchaseID:(id)a5;
- (void)startBundlePurchaseWithPurchase:(id)a3 error:(id *)a4;
- (void)startPurchaseWithTagID:(id)a3 purchase:(id)a4 webAccessOptIn:(BOOL)a5 error:(id *)a6;
- (void)startPurchaseWithTagID:(void *)a3 productID:(void *)a4 purchaseID:(void *)a5 bundleID:(void *)a6 appAdamID:(void *)a7 storeExternalVersion:(void *)a8 price:(unsigned __int8)a9 webAccessOptIn:(void *)a10 payment:(void *)a11 error:;
- (void)transactionFailedWithProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5;
- (void)transactionPurchased:(id)a3;
@end

@implementation FCPurchaseManager

- (void)activityObservingApplicationWillEnterForeground
{
  if (self)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v7 = [v3 objectForKey:FCPurchaseModelCacheDate];

    v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v7];
    double v6 = v5;

    if (v6 > (double)(unint64_t)kPurchaseModelMaxAllowedCacheTime)
    {
      [(NFMutexLock *)self->_accessLock lock];
      [(NSMutableDictionary *)self->_cachedPurchaseModels removeAllObjects];
      [(NFMutexLock *)self->_accessLock unlock];
    }
  }
}

- (FCPurchaseManager)initWithCloudContext:(id)a3 purchaseIntegrityChecker:(id)a4 purchaseReceiptProvider:(id)a5 paymentTransactionManager:(id)a6 bundleSubscriptionManager:(id)a7 keyValueStoreOption:(unint64_t)a8
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v62 = a6;
  id v61 = a7;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v50 = v16;
    v51 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "cloudContext != nil");
    *(_DWORD *)buf = 136315906;
    v72 = "-[FCPurchaseManager initWithCloudContext:purchaseIntegrityChecker:purchaseReceiptProvider:paymentTransactionMa"
          "nager:bundleSubscriptionManager:keyValueStoreOption:]";
    __int16 v73 = 2080;
    v74 = "FCPurchaseManager.m";
    __int16 v75 = 1024;
    int v76 = 103;
    __int16 v77 = 2114;
    v78 = v51;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v16 = v50;
    if (v15) {
      goto LABEL_6;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v52 = v16;
    v53 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "purchaseIntegrityChecker != nil");
    *(_DWORD *)buf = 136315906;
    v72 = "-[FCPurchaseManager initWithCloudContext:purchaseIntegrityChecker:purchaseReceiptProvider:paymentTransactionMa"
          "nager:bundleSubscriptionManager:keyValueStoreOption:]";
    __int16 v73 = 2080;
    v74 = "FCPurchaseManager.m";
    __int16 v75 = 1024;
    int v76 = 104;
    __int16 v77 = 2114;
    v78 = v53;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v16 = v52;
  }
LABEL_6:
  if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v54 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "purchaseReceiptProvider != nil");
    *(_DWORD *)buf = 136315906;
    v72 = "-[FCPurchaseManager initWithCloudContext:purchaseIntegrityChecker:purchaseReceiptProvider:paymentTransactionMa"
          "nager:bundleSubscriptionManager:keyValueStoreOption:]";
    __int16 v73 = 2080;
    v74 = "FCPurchaseManager.m";
    __int16 v75 = 1024;
    int v76 = 105;
    __int16 v77 = 2114;
    v78 = v54;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v16 = 0;
  }
  if (!v62 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v55 = v16;
    v56 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "paymentTransactionManager != nil");
    *(_DWORD *)buf = 136315906;
    v72 = "-[FCPurchaseManager initWithCloudContext:purchaseIntegrityChecker:purchaseReceiptProvider:paymentTransactionMa"
          "nager:bundleSubscriptionManager:keyValueStoreOption:]";
    __int16 v73 = 2080;
    v74 = "FCPurchaseManager.m";
    __int16 v75 = 1024;
    int v76 = 106;
    __int16 v77 = 2114;
    v78 = v56;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v16 = v55;
  }
  v66.receiver = self;
  v66.super_class = (Class)FCPurchaseManager;
  v65 = [(FCPurchaseManager *)&v66 init];
  if (v65)
  {
    id v58 = v16;
    id v59 = v15;
    uint64_t v17 = [v14 purchaseController];
    purchaseController = v65->_purchaseController;
    v65->_purchaseController = (FCPurchaseController *)v17;

    objc_storeStrong((id *)&v65->_purchaseIntegrityChecker, a4);
    objc_storeStrong((id *)&v65->_purchaseReceiptProvider, a5);
    objc_storeStrong((id *)&v65->_paymentTransactionManager, a6);
    objc_storeStrong((id *)&v65->_bundleSubscriptionManager, a7);
    v19 = objc_alloc_init(FCReceiptRefresher);
    receiptRefresher = v65->_receiptRefresher;
    v65->_receiptRefresher = v19;

    [(FCPaymentTransactionManager *)v65->_paymentTransactionManager setDelegate:v65];
    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    cachedPurchaseModels = v65->_cachedPurchaseModels;
    v65->_cachedPurchaseModels = (NSMutableDictionary *)v21;

    v23 = (NFMutexLock *)objc_alloc_init(MEMORY[0x1E4F81BE0]);
    accessLock = v65->_accessLock;
    v65->_accessLock = v23;

    uint64_t v25 = [v14 privateDataDirectory];
    v26 = [FCKeyValueStore alloc];
    v57 = (void *)v25;
    uint64_t v27 = [(FCKeyValueStore *)v26 initWithName:FCPurchaseManagementFileName directory:v25 version:2 options:a8 classRegistry:0];
    localStore = v65->_localStore;
    v65->_localStore = (FCKeyValueStore *)v27;

    id v60 = v14;
    v29 = [v14 appActivityMonitor];
    [v29 addObserver:v65];

    uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
    ongoingPurchaseEntriesByProductID = v65->_ongoingPurchaseEntriesByProductID;
    v65->_ongoingPurchaseEntriesByProductID = (NSMutableDictionary *)v30;

    v32 = v65->_localStore;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v33 = [(FCKeyValueStore *)v32 allKeys];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v67 objects:buf count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v68;
      unint64_t v37 = 0x1E4F1C000uLL;
      v63 = v32;
      uint64_t v64 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v68 != v36) {
            objc_enumerationMutation(v33);
          }
          v39 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          objc_opt_class();
          v40 = [(FCKeyValueStore *)v32 objectForKey:v39];
          if (v40)
          {
            if (objc_opt_isKindOfClass()) {
              v41 = v40;
            }
            else {
              v41 = 0;
            }
          }
          else
          {
            v41 = 0;
          }
          id v42 = v41;

          if (v42 && [v39 hasPrefix:@"onpc-"])
          {
            v43 = [[FCOngoingPurchaseEntry alloc] initWithEntryID:v39 dictionaryRepresentation:v42];
            if (v43)
            {
              v44 = v65->_ongoingPurchaseEntriesByProductID;
              [(FCOngoingPurchaseEntry *)v43 productID];
              unint64_t v45 = v37;
              uint64_t v46 = v35;
              v48 = v47 = v33;
              [(NSMutableDictionary *)v44 setObject:v43 forKey:v48];

              v33 = v47;
              uint64_t v35 = v46;
              unint64_t v37 = v45;
              v32 = v63;
              uint64_t v36 = v64;
              [(FCPaymentTransactionManager *)v65->_paymentTransactionManager registerOngoingPurchaseTransactionsWithEntry:v43];
            }
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v67 objects:buf count:16];
      }
      while (v35);
    }

    id v15 = v59;
    id v14 = v60;
    id v16 = v58;
  }

  return v65;
}

- (void)setDelegate:(id)a3
{
}

void __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    v8 = *(void **)(v7 + 104);
  }
  else {
    v8 = 0;
  }
  [v8 lock];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    v10 = *(void **)(v9 + 88);
  }
  else {
    v10 = 0;
  }
  v11 = [v10 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    v13 = *(void **)(v12 + 104);
  }
  else {
    v13 = 0;
  }
  [v13 unlock];
  if (v11)
  {
    v5[2](v5, v11);
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F81BF0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_2;
    v24[3] = &unk_1E5B4FDE8;
    id v25 = *(id *)(a1 + 40);
    char v26 = *(unsigned char *)(a1 + 48);
    id v15 = [v14 firstly:v24];
    id v16 = zalgo();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_3;
    v22[3] = &unk_1E5B4FE10;
    v22[4] = *(void *)(a1 + 32);
    v23 = v5;
    uint64_t v17 = [v15 thenOn:v16 then:v22];
    v18 = zalgo();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_4;
    v20[3] = &unk_1E5B4EF68;
    id v21 = v6;
    id v19 = (id)[v17 errorOn:v18 error:v20];
  }
}

id __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_2(uint64_t a1)
{
  v2 = objc_alloc_init(FCPurchaseMetadataFetcher);
  v3 = [(FCPurchaseMetadataFetcher *)v2 fetchPurchaseMetadataForPurchaseID:*(void *)(a1 + 32) restorePurchase:*(unsigned __int8 *)(a1 + 40)];

  return v3;
}

- (id)fetchPurchaseMetadataForPurchaseID:(id)a3 restorePurchase:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F81BF0]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke;
  v11[3] = &unk_1E5B4FE38;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  uint64_t v9 = (void *)[v7 initWithResolver:v11];

  return v9;
}

- (FCPurchaseManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCPurchaseManager init]";
    __int16 v9 = 2080;
    v10 = "FCPurchaseManager.m";
    __int16 v11 = 1024;
    int v12 = 93;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  double v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPurchaseManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)activityObservingApplicationDidEnterBackground
{
  [MEMORY[0x1E4F29060] isMainThread];
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setObject:v4 forKey:FCPurchaseModelCacheDate];

  -[FCPurchaseManager cleanupStaleOngoingPurchaseEntries]((uint64_t)self);
  if (self)
  {
    localStore = self->_localStore;
    [(FCKeyValueStore *)localStore saveWithCompletionHandler:0];
  }
}

- (void)cleanupStaleOngoingPurchaseEntries
{
  if (a1)
  {
    v2 = (void *)[*(id *)(a1 + 80) copy];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__FCPurchaseManager_cleanupStaleOngoingPurchaseEntries__block_invoke;
    v3[3] = &unk_1E5B4FF00;
    v3[4] = a1;
    [v2 enumerateKeysAndObjectsUsingBlock:v3];
  }
}

uint64_t __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    double v5 = *(void **)(v4 + 104);
  }
  else {
    double v5 = 0;
  }
  [v5 lock];
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id v6 = (void *)v6[11];
  }
  id v7 = v6;
  id v8 = [v3 purchaseID];
  [v7 setObject:v3 forKeyedSubscript:v8];

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    v10 = *(void **)(v9 + 104);
  }
  else {
    v10 = 0;
  }
  [v10 unlock];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return 0;
}

uint64_t __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startBundlePurchaseWithPurchase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = [v6 offerName];
  id v7 = [v6 purchaseID];
  id v8 = [v6 bundleID];
  uint64_t v9 = [v6 appAdamID];
  v10 = [v6 storeExternalVersion];
  __int16 v11 = [v6 price];
  int v12 = [v6 payment];

  -[FCPurchaseManager startPurchaseWithTagID:productID:purchaseID:bundleID:appAdamID:storeExternalVersion:price:webAccessOptIn:payment:error:]((id *)&self->super.isa, @"bundleSubscriptionTagID", v13, v7, v8, v9, v10, v11, 0, v12, a4);
}

- (void)startPurchaseWithTagID:(void *)a3 productID:(void *)a4 purchaseID:(void *)a5 bundleID:(void *)a6 appAdamID:(void *)a7 storeExternalVersion:(void *)a8 price:(unsigned __int8)a9 webAccessOptIn:(void *)a10 payment:(void *)a11 error:
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  id v19 = a3;
  v20 = a4;
  id v21 = a5;
  id v58 = a6;
  id v57 = a7;
  id v56 = a8;
  id v22 = a10;
  if (!a1) {
    goto LABEL_29;
  }
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v51 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "productID");
    *(_DWORD *)buf = 136315906;
    objc_super v66 = "-[FCPurchaseManager startPurchaseWithTagID:productID:purchaseID:bundleID:appAdamID:storeExternalVersion:price:"
          "webAccessOptIn:payment:error:]";
    __int16 v67 = 2080;
    long long v68 = "FCPurchaseManager.m";
    __int16 v69 = 1024;
    *(_DWORD *)long long v70 = 250;
    *(_WORD *)&v70[4] = 2114;
    *(void *)&v70[6] = v51;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v20)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v52 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "purchaseID");
        *(_DWORD *)buf = 136315906;
        objc_super v66 = "-[FCPurchaseManager startPurchaseWithTagID:productID:purchaseID:bundleID:appAdamID:storeExternalVersion:pr"
              "ice:webAccessOptIn:payment:error:]";
        __int16 v67 = 2080;
        long long v68 = "FCPurchaseManager.m";
        __int16 v69 = 1024;
        *(_DWORD *)long long v70 = 251;
        *(_WORD *)&v70[4] = 2114;
        *(void *)&v70[6] = v52;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v20)
  {
    goto LABEL_5;
  }
  if (!v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v53 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "payment");
    *(_DWORD *)buf = 136315906;
    objc_super v66 = "-[FCPurchaseManager startPurchaseWithTagID:productID:purchaseID:bundleID:appAdamID:storeExternalVersion:price:"
          "webAccessOptIn:payment:error:]";
    __int16 v67 = 2080;
    long long v68 = "FCPurchaseManager.m";
    __int16 v69 = 1024;
    *(_DWORD *)long long v70 = 252;
    *(_WORD *)&v70[4] = 2114;
    *(void *)&v70[6] = v53;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if ([a1 anyOngoingPurchases]) {
    -[FCPurchaseManager cleanupStaleOngoingPurchaseEntries]((uint64_t)a1);
  }
  v23 = +[FCAppleAccount sharedAccount];
  v24 = [v23 iTunesAccountDSID];
  objc_setProperty_nonatomic_copy(a1, v25, v24, 96);

  uint64_t v26 = [a1 purchaseFlowOverrideProvider];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    v28 = [a1 purchaseFlowOverrideProvider];
    int v29 = [v28 shouldOverridePurchaseFlow];

    if (v29)
    {
      dispatch_time_t v30 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __140__FCPurchaseManager_startPurchaseWithTagID_productID_purchaseID_bundleID_appAdamID_storeExternalVersion_price_webAccessOptIn_payment_error___block_invoke;
      block[3] = &unk_1E5B4C738;
      id v60 = (FCOngoingPurchaseEntry *)v19;
      id v61 = a1;
      id v62 = v18;
      dispatch_after(v30, MEMORY[0x1E4F14428], block);

      v31 = v60;
LABEL_28:

      goto LABEL_29;
    }
  }
  if ([a1[4] canMakePayments])
  {
    v31 = [a1[10] objectForKey:v19];
    v32 = FCPurchaseLog;
    BOOL v33 = os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v33)
      {
        *(_DWORD *)buf = 138412802;
        objc_super v66 = (const char *)v18;
        __int16 v67 = 2112;
        long long v68 = v20;
        __int16 v69 = 2112;
        *(void *)long long v70 = v19;
        _os_log_impl(&dword_1A460D000, v32, OS_LOG_TYPE_DEFAULT, "ongoingPurchaseEntry already exists for tagID:%@ purchaseID:%@ productIdentifier:%@", buf, 0x20u);
      }
      if (a11)
      {
        id v34 = v21;
        uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = FCOngoingPurchaseErrorCode;
        uint64_t v63 = *MEMORY[0x1E4F28568];
        uint64_t v64 = @"There is a ongoing purchase transaction for the given product identifier";
        unint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        v38 = v35;
        id v21 = v34;
        *a11 = [v38 errorWithDomain:@"com.apple.news.purchase" code:v36 userInfo:v37];
      }
    }
    else
    {
      if (v33)
      {
        *(_DWORD *)buf = 138544130;
        objc_super v66 = (const char *)v18;
        __int16 v67 = 2114;
        long long v68 = v20;
        __int16 v69 = 2114;
        *(void *)long long v70 = v19;
        *(_WORD *)&v70[8] = 2114;
        *(void *)&v70[10] = v21;
        _os_log_impl(&dword_1A460D000, v32, OS_LOG_TYPE_DEFAULT, "Starting purchase for tagID: %{public}@ purchaseID: %{public}@ productIdentifier: %{public}@, bundleID: %{public}@", buf, 0x2Au);
      }
      id v42 = [FCOngoingPurchaseEntry alloc];
      v43 = [NSString stringWithFormat:@"%@%@", @"onpc-", v19];
      FCDeviceIdentifierForVendor();
      v44 = id v55 = v21;
      unint64_t v45 = [MEMORY[0x1E4F1C9C8] date];
      v31 = [(FCOngoingPurchaseEntry *)v42 initWithEntryID:v43 tagID:v18 purchaseID:v20 productID:v19 bundleID:v55 webAccessOptIn:a9 appAdamID:v58 storeExternalVersion:v57 vendorIdentifier:v44 purchaseInitiatedTime:v45 price:v56];

      id v46 = a1[10];
      v47 = [(FCOngoingPurchaseEntry *)v31 productID];
      [v46 setObject:v31 forKey:v47];

      id v48 = a1[3];
      v49 = [(FCOngoingPurchaseEntry *)v31 dictionaryRepresentation];
      id v50 = [(FCOngoingPurchaseEntry *)v31 identifier];
      [v48 setObject:v49 forKey:v50];

      id v21 = v55;
      LOBYTE(v54) = a9;
      [a1[4] startPurchaseWithTagID:v18 productID:v19 purchaseID:v20 bundleID:v55 appAdamID:v58 storeExternalVersion:v57 price:v56 webAccessOptIn:v54 payment:v22];
    }
    goto LABEL_28;
  }
  v39 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v39, OS_LOG_TYPE_DEFAULT, "In-App purchase is disabled in this device.", buf, 2u);
  }
  if (a11)
  {
    v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = FCPaymentRestrictedErrorCode;
    uint64_t v71 = *MEMORY[0x1E4F28568];
    v72[0] = @"This device is not able or allowed to make payments";
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
    *a11 = [v40 errorWithDomain:@"com.apple.news.purchase" code:v41 userInfo:v31];
    goto LABEL_28;
  }
LABEL_29:
}

- (void)startPurchaseWithTagID:(id)a3 purchase:(id)a4 webAccessOptIn:(BOOL)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  id v18 = [v9 offerName];
  __int16 v11 = [v9 purchaseID];
  int v12 = [v9 bundleID];
  id v13 = [v9 appAdamID];
  id v14 = [v9 storeExternalVersion];
  uint64_t v15 = [v9 price];
  id v16 = [v9 payment];

  -[FCPurchaseManager startPurchaseWithTagID:productID:purchaseID:bundleID:appAdamID:storeExternalVersion:price:webAccessOptIn:payment:error:]((id *)&self->super.isa, v10, v18, v11, v12, v13, v14, v15, a5, v16, a6);
}

void __140__FCPurchaseManager_startPurchaseWithTagID_productID_purchaseID_bundleID_appAdamID_storeExternalVersion_price_webAccessOptIn_payment_error___block_invoke(uint64_t a1)
{
  id v7 = [[FCCompletedPaymentTransaction alloc] initWithProductID:*(void *)(a1 + 32) receipt:@"receipt" appleIDAccountDetails:0];
  v2 = [*(id *)(a1 + 40) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[FCOngoingPurchaseEntry dummyOngoingPurchaseEntryWithTagID:*(void *)(a1 + 48)];
  [v2 purchaseSuccessWithProductID:v3 transaction:v7 chargeCurrencyCode:@"USD" ongoingPurchaseEntry:v4];

  -[FCPurchaseManager finishPurchaseTransactionWithProductID:](*(void *)(a1 + 40), *(void **)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    id v6 = *(void **)(v5 + 56);
  }
  else {
    id v6 = 0;
  }
  [v6 refreshBundleSubscriptionWithCachePolicy:2 completion:0];
}

- (void)finishPurchaseTransactionWithProductID:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = *(void **)(a1 + 80);
    id v4 = a2;
    [v3 removeObjectForKey:v4];
    uint64_t v5 = *(void **)(a1 + 24);
    id v6 = NSString;
    id v7 = v5;
    id v8 = [v6 stringWithFormat:@"%@%@", @"onpc-", v4];

    [v7 removeObjectForKey:v8];
  }
}

- (void)transactionFailedWithProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self) {
    ongoingPurchaseEntriesByProductID = self->_ongoingPurchaseEntriesByProductID;
  }
  else {
    ongoingPurchaseEntriesByProductID = 0;
  }
  __int16 v11 = ongoingPurchaseEntriesByProductID;
  int v12 = [(NSMutableDictionary *)v11 objectForKey:v8];

  if (!v12)
  {
    id v18 = self;
    id v19 = v8;
    int64_t v20 = a4;
    id v21 = v9;
    id v22 = 0;
LABEL_10:
    -[FCPurchaseManager _purchaseFailedWithProductID:transactionState:transactionError:ongoingPurchaseEntry:]((uint64_t)v18, v19, v20, v21, v22);
    goto LABEL_11;
  }
  if (!self
    || (+[FCAppleAccount sharedAccount],
        id v13 = objc_claimAutoreleasedReturnValue(),
        [v13 iTunesAccountDSID],
        id v14 = objc_claimAutoreleasedReturnValue(),
        lastSignedInItunesAccountDSID = self->_lastSignedInItunesAccountDSID,
        v14,
        v13,
        lastSignedInItunesAccountDSID)
    || !v14)
  {
    id v18 = self;
    id v19 = v8;
    int64_t v20 = a4;
    id v21 = v9;
    id v22 = v12;
    goto LABEL_10;
  }
  id v16 = [v12 purchaseID];
  purchaseIntegrityChecker = self->_purchaseIntegrityChecker;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__FCPurchaseManager_transactionFailedWithProductID_transactionState_transactionError___block_invoke;
  v23[3] = &unk_1E5B4FE60;
  v23[4] = self;
  id v24 = v8;
  int64_t v27 = a4;
  id v25 = v12;
  id v26 = v9;
  [(FCPurchaseIntegrityChecker *)purchaseIntegrityChecker isUserEntitledToSubscriptionForPurchaseID:v16 completion:v23];

LABEL_11:
}

void __86__FCPurchaseManager_transactionFailedWithProductID_transactionState_transactionError___block_invoke(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = FCAlreadyPurchasedErrorCode;
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"Subscription already purchased by this itunes account";
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v6 = [v3 errorWithDomain:@"com.apple.news.purchase" code:v4 userInfo:v5];

    -[FCPurchaseManager _purchaseFailedWithProductID:transactionState:transactionError:ongoingPurchaseEntry:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 64), v6, *(void **)(a1 + 48));
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    id v10 = *(void **)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    __int16 v11 = *(void **)(a1 + 48);
    -[FCPurchaseManager _purchaseFailedWithProductID:transactionState:transactionError:ongoingPurchaseEntry:](v7, v8, v9, v10, v11);
  }
}

- (void)_purchaseFailedWithProductID:(uint64_t)a3 transactionState:(void *)a4 transactionError:(void *)a5 ongoingPurchaseEntry:
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __105__FCPurchaseManager__purchaseFailedWithProductID_transactionState_transactionError_ongoingPurchaseEntry___block_invoke;
    v12[3] = &unk_1E5B4DD30;
    v12[4] = a1;
    id v13 = v9;
    uint64_t v16 = a3;
    id v14 = v10;
    id v15 = v11;
    FCPerformBlockOnMainThread(v12);
  }
}

void __105__FCPurchaseManager__purchaseFailedWithProductID_transactionState_transactionError_ongoingPurchaseEntry___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 purchaseFailedWithProductID:*(void *)(a1 + 40) transactionState:*(void *)(a1 + 64) transactionError:*(void *)(a1 + 48) ongoingPurchaseEntry:*(void *)(a1 + 56)];

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  -[FCPurchaseManager finishPurchaseTransactionWithProductID:](v3, v4);
}

- (void)transactionPurchased:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self) {
    ongoingPurchaseEntriesByProductID = self->_ongoingPurchaseEntriesByProductID;
  }
  else {
    ongoingPurchaseEntriesByProductID = 0;
  }
  id v6 = ongoingPurchaseEntriesByProductID;
  uint64_t v7 = [v4 productID];
  id v8 = [(NSMutableDictionary *)v6 objectForKey:v7];

  if (v8)
  {
    id v9 = [v8 tagID];
    id v10 = [v8 purchaseID];
    id v11 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      id v13 = [v8 bundleID];
      *(_DWORD *)buf = 138543874;
      id v24 = v9;
      __int16 v25 = 2114;
      id v26 = v10;
      __int16 v27 = 2114;
      v28 = v13;
      _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "transaction purchase callback with ongoingPurchaseEntry tagID: %{public}@ purchaseID: %{public}@ bundleID: %{public}@", buf, 0x20u);
    }
    if (self) {
      purchaseIntegrityChecker = self->_purchaseIntegrityChecker;
    }
    else {
      purchaseIntegrityChecker = 0;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__FCPurchaseManager_transactionPurchased___block_invoke;
    v19[3] = &unk_1E5B4FE88;
    v19[4] = self;
    id v20 = v9;
    id v21 = v8;
    id v22 = v4;
    id v15 = v9;
    [(FCPurchaseIntegrityChecker *)purchaseIntegrityChecker isUserEntitledToSubscriptionForPurchaseID:v10 completion:v19];
  }
  else
  {
    uint64_t v16 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = v16;
      id v18 = [v4 productID];
      *(_DWORD *)buf = 138543362;
      id v24 = v18;
      _os_log_error_impl(&dword_1A460D000, v17, OS_LOG_TYPE_ERROR, "ongoingPurchaseEntry not found for productID: %{public}@", buf, 0xCu);
    }
  }
}

void __42__FCPurchaseManager_transactionPurchased___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = FCPurchaseLog;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "Purchase is found in entitlements response.", buf, 2u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__FCPurchaseManager_transactionPurchased___block_invoke_63;
    v12[3] = &unk_1E5B4DD08;
    v12[4] = v5;
    uint64_t v7 = &v13;
    id v13 = *(id *)(a1 + 48);
    id v8 = &v14;
    id v14 = *(id *)(a1 + 56);
    id v15 = v3;
    -[FCPurchaseManager performEntitlementWithTagID:completion:](v5, v6, v12);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "Purchase is not found in entitlements response. Could be an illegal purchase attempt.", buf, 2u);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__FCPurchaseManager_transactionPurchased___block_invoke_64;
    v9[3] = &unk_1E5B4C738;
    v9[4] = *(void *)(a1 + 32);
    uint64_t v7 = &v10;
    id v10 = *(id *)(a1 + 56);
    id v8 = &v11;
    id v11 = *(id *)(a1 + 48);
    FCPerformBlockOnMainThread(v9);
  }
}

void __42__FCPurchaseManager_transactionPurchased___block_invoke_63(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__FCPurchaseManager_transactionPurchased___block_invoke_2;
  v3[3] = &unk_1E5B4DD08;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  FCPerformBlockOnMainThread(v3);
}

void __42__FCPurchaseManager_transactionPurchased___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[6];
  }
  id v3 = *(void **)(a1 + 40);
  id v4 = v2;
  id v5 = [v3 bundleID];
  id v6 = [v4 purchaseReceiptWithBundleID:v5];

  uint64_t v7 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "PurchaseReceipt:  %@", (uint8_t *)&v17, 0xCu);
  }
  id v8 = [FCCompletedPaymentTransaction alloc];
  id v9 = [*(id *)(a1 + 48) productID];
  id v10 = [*(id *)(a1 + 48) appleIDAccountDetails];
  id v11 = [(FCCompletedPaymentTransaction *)v8 initWithProductID:v9 receipt:v6 appleIDAccountDetails:v10];

  uint64_t v12 = [*(id *)(a1 + 32) delegate];
  id v13 = [(FCCompletedPaymentTransaction *)v11 productID];
  id v14 = [*(id *)(a1 + 56) chargeCurrencyCode];
  [v12 purchaseSuccessWithProductID:v13 transaction:v11 chargeCurrencyCode:v14 ongoingPurchaseEntry:*(void *)(a1 + 40)];

  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = [*(id *)(a1 + 48) productID];
  -[FCPurchaseManager finishPurchaseTransactionWithProductID:](v15, v16);
}

- (void)performEntitlementWithTagID:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ([v5 isEqualToString:@"bundleSubscriptionTagID"])
    {
      uint64_t v7 = *(void **)(a1 + 56);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __60__FCPurchaseManager_performEntitlementWithTagID_completion___block_invoke;
      v8[3] = &unk_1E5B4F828;
      id v9 = v6;
      [v7 refreshBundleSubscriptionWithCachePolicy:2 completion:v8];
    }
    else
    {
      v6[2](v6);
    }
  }
}

void __42__FCPurchaseManager_transactionPurchased___block_invoke_64(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [*(id *)(a1 + 40) productID];
  [v2 purchaseFailedForInvalidPurchaseReceiptWithProductID:v3 ongoingPurchaseEntry:*(void *)(a1 + 48)];

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) productID];
  -[FCPurchaseManager finishPurchaseTransactionWithProductID:](v4, v5);
}

uint64_t __60__FCPurchaseManager_performEntitlementWithTagID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)isPurchaseOngoingForTagID:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (self) {
    ongoingPurchaseEntriesByProductID = self->_ongoingPurchaseEntriesByProductID;
  }
  else {
    ongoingPurchaseEntriesByProductID = 0;
  }
  id v6 = ongoingPurchaseEntriesByProductID;
  uint64_t v7 = (void *)[(NSMutableDictionary *)v6 copy];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__FCPurchaseManager_isPurchaseOngoingForTagID___block_invoke;
  v11[3] = &unk_1E5B4FED8;
  id v8 = v4;
  id v12 = v8;
  id v13 = self;
  id v14 = &v15;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  char v9 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __47__FCPurchaseManager_isPurchaseOngoingForTagID___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v13 = a3;
  id v6 = [v13 tagID];
  int v7 = [v6 isEqualToString:a1[4]];

  id v9 = v13;
  if (v7)
  {
    BOOL v8 = -[FCPurchaseManager isPurchaseTimeElapsedWithEntry:](a1[5], v13);
    if (v8)
    {
      uint64_t v10 = a1[5];
      id v11 = [v13 productID];
      -[FCPurchaseManager finishPurchaseTransactionWithProductID:](v10, v11);
    }
    else
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    *a4 = 1;
    id v9 = v13;
  }
  return MEMORY[0x1F41817F8](v8, v9);
}

- (BOOL)isPurchaseTimeElapsedWithEntry:(BOOL)result
{
  if (result)
  {
    v2 = (void *)MEMORY[0x1E4F1C9C8];
    id v3 = a2;
    id v4 = [v2 date];
    id v5 = [v3 purchaseInitiatedTime];

    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;

    return v7 > (double)(unint64_t)kOngoingPurchaseMaxAllowedPurchaseTime;
  }
  return result;
}

- (BOOL)anyOngoingPurchases
{
  if (self) {
    self = (FCPurchaseManager *)self->_ongoingPurchaseEntriesByProductID;
  }
  return [(FCPurchaseManager *)self count] != 0;
}

void __55__FCPurchaseManager_cleanupStaleOngoingPurchaseEntries__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (-[FCPurchaseManager isPurchaseTimeElapsedWithEntry:](*(void *)(a1 + 32), v6))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [v6 productID];
    -[FCPurchaseManager finishPurchaseTransactionWithProductID:](v4, v5);
  }
}

void __67__FCPurchaseManager_simulateSuccessfulPurchaseWithProductID_tagID___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__FCPurchaseManager_simulateSuccessfulPurchaseWithProductID_tagID___block_invoke_2;
  v5[3] = &unk_1E5B4C738;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  id v8 = v4;
  FCPerformBlockOnMainThread(v5);
}

void __67__FCPurchaseManager_simulateSuccessfulPurchaseWithProductID_tagID___block_invoke_2(uint64_t a1)
{
  id v5 = [[FCCompletedPaymentTransaction alloc] initWithProductID:*(void *)(a1 + 32) receipt:@"purchaseReceipt" appleIDAccountDetails:0];
  id v2 = [*(id *)(a1 + 40) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[FCOngoingPurchaseEntry dummyOngoingPurchaseEntryWithTagID:*(void *)(a1 + 48)];
  [v2 purchaseSuccessWithProductID:v3 transaction:v5 chargeCurrencyCode:@"currencyCode" ongoingPurchaseEntry:v4];
}

- (void)simulateSuccessfulPurchaseWithProductID:(id)a3 tagID:(id)a4 purchaseID:(id)a5
{
  if (self)
  {
    purchaseController = self->_purchaseController;
    id v9 = a3;
    [(FCPurchaseController *)purchaseController addAppStorePurchaseWithTagID:a4 purchaseID:a5];
    id v10 = v9;
    id v11 = @"tagID";
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__FCPurchaseManager_simulateSuccessfulPurchaseWithProductID_tagID___block_invoke;
    v17[3] = &unk_1E5B4C738;
    id v18 = v10;
    uint64_t v19 = self;
    id v12 = @"tagID";
    id v20 = @"tagID";
    -[FCPurchaseManager performEntitlementWithTagID:completion:]((uint64_t)self, @"tagID", v17);
  }
  else
  {
    id v13 = a3;
    [0 addAppStorePurchaseWithTagID:a4 purchaseID:a5];
    id v14 = v13;
    uint64_t v15 = @"tagID";
  }
}

- (void)simulateFailurePurchaseWithProductID:(id)a3 transactionState:(int64_t)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = [(FCPurchaseManager *)self delegate];
  id v10 = +[FCOngoingPurchaseEntry dummyOngoingPurchaseEntryWithTagID:@"tagID"];
  [v11 purchaseFailedWithProductID:v9 transactionState:a4 transactionError:v8 ongoingPurchaseEntry:v10];
}

- (FCPurchaseManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCPurchaseManagerDelegate *)WeakRetained;
}

- (FCPurchaseFlowOverrideProviderType)purchaseFlowOverrideProvider
{
  return self->purchaseFlowOverrideProvider;
}

- (void)setPurchaseFlowOverrideProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_lastSignedInItunesAccountDSID, 0);
  objc_storeStrong((id *)&self->_cachedPurchaseModels, 0);
  objc_storeStrong((id *)&self->_ongoingPurchaseEntriesByProductID, 0);
  objc_storeStrong((id *)&self->_receiptRefresher, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_purchaseReceiptProvider, 0);
  objc_storeStrong((id *)&self->_purchaseIntegrityChecker, 0);
  objc_storeStrong((id *)&self->_paymentTransactionManager, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->purchaseFlowOverrideProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end