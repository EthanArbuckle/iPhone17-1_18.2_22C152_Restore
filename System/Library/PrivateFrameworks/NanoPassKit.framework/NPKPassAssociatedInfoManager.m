@interface NPKPassAssociatedInfoManager
- (BOOL)_isPassEligible:(id)a3;
- (BOOL)_isPassWithAccountBalanceForPass:(id)a3;
- (BOOL)_shouldUseBalanceForAccount:(id)a3;
- (BOOL)canPerformRKEActionsForPassWithUniqueID:(id)a3;
- (BOOL)isHomeAccessRestrictedForPass:(id)a3;
- (BOOL)paymentServiceWasInterrupted;
- (NPKPassAssociatedInfoManager)init;
- (NPKPassAssociatedInfoManager)initWithPaymentService:(id)a3 accountService:(id)a4 precursorPassManager:(id)a5;
- (NPKPrecursorPassUpgradeRequestsManager)precursorPassManager;
- (NSHashTable)observers;
- (NSMutableDictionary)passUniqueIDsByAccountIdentifier;
- (NSSet)passes;
- (PKAccountService)accountService;
- (PKPaymentService)paymentService;
- (id)_transitPassBalanceModelWithPass:(id)a3 currentModel:(id)a4;
- (id)homeAccessoryForPass:(id)a3 withReaderIdentifier:(id)a4;
- (id)npkBankConnectedAccountForPass:(id)a3;
- (id)npkBankConnectedDebitAccountForPass:(id)a3;
- (id)passInfoForPassWithUniqueID:(id)a3;
- (id)readerIdentifierForAccessory:(id)a3 withPass:(id)a4;
- (unint64_t)rangingSuspensionReasonForPassWithUniqueID:(id)a3;
- (void)_fetchHomeAccessStatusForPass:(id)a3;
- (void)_fetchMostRecentAccountBalanceForPass:(id)a3;
- (void)_fetchMostRecentBalancesForPass:(id)a3;
- (void)_fetchMostRecentCommutePlansForPass:(id)a3;
- (void)_fetchMostRecentInfoForPass:(id)a3;
- (void)_fetchMostRecentRangingSuspensionReasonForPass:(id)a3;
- (void)_fetchMostRecentTilesForPass:(id)a3;
- (void)_fetchMostRecentTransitPropertiesAndAppletStateForPass:(id)a3;
- (void)_fetchPrecursorPassDescriptionForPass:(id)a3;
- (void)_handleReceivedAccountUpdateWithAccount:(id)a3;
- (void)_internalQueue_processReceivedAccountUpdateWithAccount:(id)a3;
- (void)_internalQueue_regenerateAssociatedInfoModelForPass:(id)a3 inModelsByID:(id)a4;
- (void)_internalQueue_removePassWithUniqueIDs:(id)a3;
- (void)_loadPassContentIfNeeded:(id)a3;
- (void)_notifyObservers:(id)a3;
- (void)_notifyObserversOfUpdatedTransitPassInfoForModel:(id)a3;
- (void)_processAccountBalancesForPassWithUniqueID:(id)a3 withAccount:(id)a4;
- (void)_refreshAccountBalanceIfApplicableForPass:(id)a3 withAccount:(id)a4;
- (void)_updateAllPassesItemsFieldsPendingUpdateStatus;
- (void)_updateModelWithAccessory:(id)a3 forPassID:(id)a4 withReaderID:(id)a5;
- (void)_updatePassInfoManagerForPassUniqueID:(id)a3 updateBlock:(id)a4;
- (void)accountChanged:(id)a3;
- (void)addPass:(id)a3;
- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5;
- (void)fetchHomeAccessoryForPass:(id)a3 withReaderIdentifier:(id)a4 completion:(id)a5;
- (void)npkRefreshConnectedAccountDataForPassWithUniqueID:(id)a3;
- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)paymentServiceEstablishedConnection;
- (void)paymentServiceReceivedInterruption;
- (void)precursorPassRequestsManager:(id)a3 didUpdateUpgradePrequestDescription:(id)a4 forPassUniqueID:(id)a5;
- (void)refreshAllPasses;
- (void)refreshInfoForPass:(id)a3;
- (void)registerObserver:(id)a3;
- (void)removePassWithUniqueID:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPassUniqueIDsByAccountIdentifier:(id)a3;
- (void)setPasses:(id)a3;
- (void)setPaymentServiceWasInterrupted:(BOOL)a3;
- (void)setPendingAmount:(id)a3 forBalanceField:(id)a4 passWithUniqueID:(id)a5;
- (void)setPendingExpirationDate:(id)a3 forCommutePlanField:(id)a4 passWithUniqueID:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation NPKPassAssociatedInfoManager

- (id)npkBankConnectedAccountForPass:(id)a3
{
  v4 = [a3 uniqueID];
  v5 = [(NPKPassAssociatedInfoManager *)self passInfoForPassWithUniqueID:v4];

  v6 = [v5 bankConnectAccount];

  return v6;
}

- (id)npkBankConnectedDebitAccountForPass:(id)a3
{
  v3 = [(NPKPassAssociatedInfoManager *)self npkBankConnectedAccountForPass:a3];
  v4 = [v3 authorizedFKAccount];
  v5 = v4;
  if (!v4 || ![v4 npkIsDebit])
  {
    id v8 = 0;
    goto LABEL_9;
  }
  v6 = [v5 balance];
  v7 = [v6 availableBalance];
  if (v7)
  {

LABEL_7:
    id v8 = v5;
    goto LABEL_8;
  }
  id v8 = [v6 bookedBalance];

  if (v8) {
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
  return v8;
}

- (void)npkRefreshConnectedAccountDataForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKPassAssociatedInfoManager *)self bankConnectDataProvider];
  [v5 refreshAccountDataForPassWithUniqueID:v4];
}

- (NPKPassAssociatedInfoManager)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F5C0A8]);
  id v4 = [MEMORY[0x263F5BCE8] sharedInstance];
  id v5 = objc_alloc_init(NPKPrecursorPassUpgradeRequestsManager);
  v6 = [(NPKPassAssociatedInfoManager *)self initWithPaymentService:v3 accountService:v4 precursorPassManager:v5];

  return v6;
}

- (NPKPassAssociatedInfoManager)initWithPaymentService:(id)a3 accountService:(id)a4 precursorPassManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)NPKPassAssociatedInfoManager;
  v12 = [(NPKPassAssociatedInfoManager *)&v28 init];
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.NanoPasskit.PassesAssociatedInfoManager", 0);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_observerQueue, MEMORY[0x263EF83A0]);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    passAssociatedInfoModelsByPassUniqueID = v12->_passAssociatedInfoModelsByPassUniqueID;
    v12->_passAssociatedInfoModelsByPassUniqueID = v15;

    objc_storeStrong((id *)&v12->_paymentService, a3);
    [v9 setDelegate:v12];
    objc_storeStrong((id *)&v12->_accountService, a4);
    uint64_t v17 = objc_msgSend(MEMORY[0x263F088B0], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v17;

    objc_storeStrong((id *)&v12->_precursorPassManager, a5);
    objc_initWeak(&location, v12);
    v19 = (const char *)[@"com.apple.nanopasskit.transitpassinformationmanager.pendingaddvalueupdated" UTF8String];
    v20 = v12->_internalQueue;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __91__NPKPassAssociatedInfoManager_initWithPaymentService_accountService_precursorPassManager___block_invoke;
    v25 = &unk_2644D2870;
    objc_copyWeak(&v26, &location);
    notify_register_dispatch(v19, &v12->_pendingAddValueUpdatedNotifyToken, v20, &v22);
    -[PKAccountService registerObserver:](v12->_accountService, "registerObserver:", v12, v22, v23, v24, v25);
    [(NPKPrecursorPassUpgradeRequestsManager *)v12->_precursorPassManager addObserver:v12];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __91__NPKPassAssociatedInfoManager_initWithPaymentService_accountService_precursorPassManager___block_invoke(uint64_t a1)
{
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: received pending add value updated notification", buf, 2u);
    }
  }
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v5 = objc_loadWeakRetained(&to);
  [v5 _updateAllPassesItemsFieldsPendingUpdateStatus];

  objc_destroyWeak(&to);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__NPKPassAssociatedInfoManager_registerObserver___block_invoke;
  v7[3] = &unk_2644D2E08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __49__NPKPassAssociatedInfoManager_registerObserver___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(*(void *)(result + 40) + 64), "containsObject:");
    if ((result & 1) == 0)
    {
      uint64_t v2 = *(void *)(v1 + 32);
      BOOL v3 = *(void **)(*(void *)(v1 + 40) + 64);
      return [v3 addObject:v2];
    }
  }
  return result;
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__NPKPassAssociatedInfoManager_unregisterObserver___block_invoke;
  v7[3] = &unk_2644D2E08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __51__NPKPassAssociatedInfoManager_unregisterObserver___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(*(void *)(result + 40) + 64), "containsObject:");
    if (result)
    {
      uint64_t v2 = *(void *)(v1 + 32);
      BOOL v3 = *(void **)(*(void *)(v1 + 40) + 64);
      return [v3 removeObject:v2];
    }
  }
  return result;
}

- (void)_notifyObservers:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__NPKPassAssociatedInfoManager__notifyObservers___block_invoke;
  v7[3] = &unk_2644D2E58;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

void __49__NPKPassAssociatedInfoManager__notifyObservers___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) allObjects];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
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
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setPasses:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F08A98];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__NPKPassAssociatedInfoManager_setPasses___block_invoke;
  v13[3] = &unk_2644D70F0;
  v13[4] = self;
  id v5 = a3;
  uint64_t v6 = [v4 predicateWithBlock:v13];
  long long v7 = [v5 filteredSetUsingPredicate:v6];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NPKPassAssociatedInfoManager_setPasses___block_invoke_2;
  block[3] = &unk_2644D2E08;
  id v11 = v7;
  uint64_t v12 = self;
  id v9 = v7;
  dispatch_async(internalQueue, block);
}

uint64_t __42__NPKPassAssociatedInfoManager_setPasses___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isPassEligible:a2];
}

void __42__NPKPassAssociatedInfoManager_setPasses___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "pk_setByApplyingBlock:", &__block_literal_global_27);
  uint64_t v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v20 = v2;
      __int16 v21 = 2112;
      uint64_t v22 = v6;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: setting Passes:%@ to:%@", buf, 0x16u);
    }
  }
  long long v7 = [*(id *)(*(void *)(a1 + 40) + 24) allKeys];
  long long v8 = [MEMORY[0x263EFF9C0] setWithArray:v7];
  [v8 minusSet:v2];
  objc_msgSend(*(id *)(a1 + 40), "_internalQueue_removePassWithUniqueIDs:", v8);
  id v9 = *(void **)(a1 + 40);
  if (v9[9])
  {
    long long v10 = [v9 passUniqueIDsByAccountIdentifier];
    [v10 removeAllObjects];
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __42__NPKPassAssociatedInfoManager_setPasses___block_invoke_60;
  v17[3] = &unk_2644D7138;
  uint64_t v12 = *(void **)(a1 + 32);
  v17[4] = *(void *)(a1 + 40);
  id v13 = v11;
  id v18 = v13;
  [v12 enumerateObjectsUsingBlock:v17];
  uint64_t v14 = *(void *)(a1 + 40);
  v15 = *(void **)(v14 + 24);
  *(void *)(v14 + 24) = v13;
  id v16 = v13;
}

uint64_t __42__NPKPassAssociatedInfoManager_setPasses___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 uniqueID];
}

uint64_t __42__NPKPassAssociatedInfoManager_setPasses___block_invoke_60(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_regenerateAssociatedInfoModelForPass:inModelsByID:", a2, *(void *)(a1 + 40));
}

- (void)addPass:(id)a3
{
  id v4 = a3;
  if ([(NPKPassAssociatedInfoManager *)self _isPassEligible:v4])
  {
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__NPKPassAssociatedInfoManager_addPass___block_invoke;
    v6[3] = &unk_2644D2E08;
    id v7 = v4;
    long long v8 = self;
    dispatch_async(internalQueue, v6);
  }
}

uint64_t __40__NPKPassAssociatedInfoManager_addPass___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) uniqueID];
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Adding pass with uniqueID:%@ to:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "_internalQueue_regenerateAssociatedInfoModelForPass:inModelsByID:", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 24));
}

- (NSSet)passes
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__NPKPassAssociatedInfoManager_passes__block_invoke;
  v9[3] = &unk_2644D2E08;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(internalQueue, v9);
  uint64_t v6 = v10;
  id v7 = (NSSet *)v5;

  return v7;
}

void __38__NPKPassAssociatedInfoManager_passes__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __38__NPKPassAssociatedInfoManager_passes__block_invoke_2;
  v2[3] = &unk_2644D7160;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __38__NPKPassAssociatedInfoManager_passes__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 pass];
  [v3 addObject:v4];
}

- (void)removePassWithUniqueID:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__NPKPassAssociatedInfoManager_removePassWithUniqueID___block_invoke;
  v7[3] = &unk_2644D2E08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __55__NPKPassAssociatedInfoManager_removePassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
  objc_msgSend(v1, "_internalQueue_removePassWithUniqueIDs:", v2);
}

- (void)_internalQueue_removePassWithUniqueIDs:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__NPKPassAssociatedInfoManager__internalQueue_removePassWithUniqueIDs___block_invoke;
  v3[3] = &unk_2644D65E8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __71__NPKPassAssociatedInfoManager__internalQueue_removePassWithUniqueIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Removing model for pass with unique ID %@", (uint8_t *)&buf, 0xCu);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:0 forKeyedSubscript:v3];
  id v7 = *(void **)(a1 + 32);
  if (v7[9])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__21;
    v20 = __Block_byref_object_dispose__21;
    id v21 = 0;
    id v8 = [v7 passUniqueIDsByAccountIdentifier];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __71__NPKPassAssociatedInfoManager__internalQueue_removePassWithUniqueIDs___block_invoke_64;
    uint64_t v14 = &unk_2644D7188;
    id v15 = v3;
    p_long long buf = &buf;
    [v8 enumerateKeysAndObjectsUsingBlock:&v11];

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      id v9 = objc_msgSend(*(id *)(a1 + 32), "passUniqueIDsByAccountIdentifier", v11, v12, v13, v14);
      [v9 setObject:0 forKeyedSubscript:*(void *)(*((void *)&buf + 1) + 40)];
    }
    _Block_object_dispose(&buf, 8);

    id v7 = *(void **)(a1 + 32);
  }
  id v10 = objc_msgSend(v7, "precursorPassManager", v11, v12, v13, v14);
  [v10 invalidateUpgradeControllerForPassWithUniqueID:v3];
}

void __71__NPKPassAssociatedInfoManager__internalQueue_removePassWithUniqueIDs___block_invoke_64(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:a3])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)setPendingAmount:(id)a3 forBalanceField:(id)a4 passWithUniqueID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __82__NPKPassAssociatedInfoManager_setPendingAmount_forBalanceField_passWithUniqueID___block_invoke;
  v15[3] = &unk_2644D3BE0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

void __82__NPKPassAssociatedInfoManager_setPendingAmount_forBalanceField_passWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v11 = 138412802;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: setPendingAmount:%@ forBalanceField:%@ passWithUniqueID:%@", (uint8_t *)&v11, 0x20u);
    }
  }
  id v8 = [*(id *)(*(void *)(a1 + 56) + 24) objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (v8)
  {
    id v9 = (void *)MEMORY[0x263F5BF50];
    id v10 = [*(id *)(a1 + 32) amount];
    [v9 npkHandleTransitValuePendingAmount:v10 forBalanceField:*(void *)(a1 + 40) passWithUniqueID:*(void *)(a1 + 48)];

    [v8 updateItemFields];
    [*(id *)(a1 + 56) _notifyObserversOfUpdatedTransitPassInfoForModel:v8];
    notify_post((const char *)[@"com.apple.nanopasskit.transitpassinformationmanager.pendingaddvalueupdated" UTF8String]);
  }
}

- (void)setPendingExpirationDate:(id)a3 forCommutePlanField:(id)a4 passWithUniqueID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __94__NPKPassAssociatedInfoManager_setPendingExpirationDate_forCommutePlanField_passWithUniqueID___block_invoke;
  v15[3] = &unk_2644D3BE0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

void __94__NPKPassAssociatedInfoManager_setPendingExpirationDate_forCommutePlanField_passWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v9 = 138412802;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: setExpirationDate:%@ forCommutePlanField:%@ passWithUniqueID:%@", (uint8_t *)&v9, 0x20u);
    }
  }
  id v8 = [*(id *)(*(void *)(a1 + 56) + 24) objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (v8)
  {
    [MEMORY[0x263F5BF50] npkHandleTransitValuePendingExpiryDate:*(void *)(a1 + 32) forCommutePlanField:*(void *)(a1 + 40) passWithUniqueID:*(void *)(a1 + 48)];
    [v8 updateItemFields];
    [*(id *)(a1 + 56) _notifyObserversOfUpdatedTransitPassInfoForModel:v8];
    notify_post((const char *)[@"com.apple.nanopasskit.transitpassinformationmanager.pendingaddvalueupdated" UTF8String]);
  }
}

- (void)refreshAllPasses
{
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested refresh all pass Balance", buf, 2u);
    }
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__NPKPassAssociatedInfoManager_refreshAllPasses__block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __48__NPKPassAssociatedInfoManager_refreshAllPasses__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__NPKPassAssociatedInfoManager_refreshAllPasses__block_invoke_2;
  v4[3] = &unk_2644D7160;
  v4[4] = v1;
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __48__NPKPassAssociatedInfoManager_refreshAllPasses__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    int v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Updating refresh balance for with uniqueID:%@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v10 = *(void **)(a1 + 32);
  __int16 v11 = [v6 pass];
  [v10 _fetchMostRecentInfoForPass:v11];
}

- (void)refreshInfoForPass:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [v4 uniqueID];
      *(_DWORD *)long long buf = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested refresh for pass with uniqueID %@", buf, 0xCu);
    }
  }
  int v9 = [v4 paymentPass];
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__NPKPassAssociatedInfoManager_refreshInfoForPass___block_invoke;
  v12[3] = &unk_2644D2E08;
  id v13 = v9;
  uint64_t v14 = self;
  id v11 = v9;
  dispatch_async(internalQueue, v12);
}

uint64_t __51__NPKPassAssociatedInfoManager_refreshInfoForPass___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "_fetchMostRecentInfoForPass:");
  }
  return result;
}

- (id)passInfoForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__21;
    id v16 = __Block_byref_object_dispose__21;
    id v17 = 0;
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__NPKPassAssociatedInfoManager_passInfoForPassWithUniqueID___block_invoke;
    block[3] = &unk_2644D5B30;
    void block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync(internalQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __60__NPKPassAssociatedInfoManager_passInfoForPassWithUniqueID___block_invoke(void *a1)
{
  id v17 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  if (v17)
  {
    id v16 = [NPKPassAssociatedInfo alloc];
    id v2 = [v17 transitPassProperties];
    BOOL v3 = [v17 transitAppletState];
    id v4 = [v17 balanceFields];
    id v5 = [v17 commutePlanFields];
    BOOL v6 = [v17 tiles];
    uint64_t v7 = [v17 rangingSuspensionReason];
    BOOL v8 = [v17 accessories];
    char v9 = [v17 isHomeAccessRestricted];
    id v10 = [v17 precursorPassDescription];
    LOBYTE(v15) = [v17 hasDeviceBoundCommutePlans];
    LOBYTE(v14) = v9;
    uint64_t v11 = [(NPKPassAssociatedInfo *)v16 initWithTransitProperties:v2 appletState:v3 balanceFields:v4 commutePlanFields:v5 tiles:v6 rangingSuspensionReason:v7 accessories:v8 isHomeAccessRestricted:v14 precursorPassDescription:v10 hasDeviceBoundCommutePlans:v15];
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (void)fetchHomeAccessoryForPass:(id)a3 withReaderIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = dispatch_get_global_queue(25, 0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke;
  v15[3] = &unk_2644D3540;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Creating home manager for initial fetch of accessory.", buf, 2u);
    }
  }
  id v5 = objc_alloc_init(MEMORY[0x263F5BEB0]);
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 32) hexEncoding];
      *(_DWORD *)long long buf = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Finished creating home manager. Now fetching lock for reader with identifier %@", buf, 0xCu);
    }
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke_70;
  v12[3] = &unk_2644D71B0;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 48);
  void v12[4] = *(void *)(a1 + 40);
  id v13 = v11;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 56);
  [v5 fetchLockAccessoryWithTerminalReaderIdentifier:v10 withCompletion:v12];
}

void __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [v3 uniqueIdentifier];
      *(_DWORD *)long long buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Found lock: %@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) uniqueID];
  [v8 _updateModelWithAccessory:v3 forPassID:v9 withReaderID:*(void *)(a1 + 48)];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke_71;
  v12[3] = &unk_2644D3FF0;
  id v10 = *(id *)(a1 + 56);
  id v13 = v3;
  id v14 = v10;
  id v11 = v3;
  NPKGuaranteeMainThread(v12);
}

uint64_t __90__NPKPassAssociatedInfoManager_fetchHomeAccessoryForPass_withReaderIdentifier_completion___block_invoke_71(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_updateModelWithAccessory:(id)a3 forPassID:(id)a4 withReaderID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__NPKPassAssociatedInfoManager__updateModelWithAccessory_forPassID_withReaderID___block_invoke;
  v14[3] = &unk_2644D71D8;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  [(NPKPassAssociatedInfoManager *)self _updatePassInfoManagerForPassUniqueID:v11 updateBlock:v14];
}

BOOL __81__NPKPassAssociatedInfoManager__updateModelWithAccessory_forPassID_withReaderID___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 accessories];

    id v6 = objc_alloc(MEMORY[0x263EFF9A0]);
    BOOL v7 = v6;
    if (v5)
    {
      id v8 = [v4 accessories];
      id v9 = [v7 initWithDictionary:v8];
    }
    else
    {
      id v9 = [v6 initWithCapacity:1];
    }
    uint64_t v13 = a1[4];
    if (v13) {
      [v9 setObject:v13 forKey:a1[5]];
    }
    else {
      [v9 removeObjectForKey:a1[5]];
    }
    [v4 setAccessories:v9];
LABEL_12:

    goto LABEL_13;
  }
  id v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[6];
      int v15 = 138412290;
      uint64_t v16 = v12;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Warning: No existing model found for pass with ID %@", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:

  return v4 != 0;
}

- (id)homeAccessoryForPass:(id)a3 withReaderIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uniqueID];
  id v9 = [(NPKPassAssociatedInfoManager *)self passInfoForPassWithUniqueID:v8];

  if (v9)
  {
    id v10 = [v9 accessories];
    BOOL v11 = [v10 objectForKey:v7];

    if (v11)
    {
      uint64_t v12 = pk_General_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (v13)
      {
        id v14 = pk_General_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = [v11 uniqueIdentifier];
          int v17 = 138412290;
          uint64_t v18 = v15;
          _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Found existing accessory with identifier %@.\n Performing fetch in background to update cache.", (uint8_t *)&v17, 0xCu);
        }
      }
      [(NPKPassAssociatedInfoManager *)self fetchHomeAccessoryForPass:v6 withReaderIdentifier:v7 completion:&__block_literal_global_75_0];
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __74__NPKPassAssociatedInfoManager_homeAccessoryForPass_withReaderIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v2 uniqueIdentifier];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: updated accessory %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)readerIdentifierForAccessory:(id)a3 withPass:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__21;
  id v26 = __Block_byref_object_dispose__21;
  id v27 = 0;
  if (v6 && v7)
  {
    uint64_t v9 = [v7 uniqueID];
    id v10 = [(NPKPassAssociatedInfoManager *)self passInfoForPassWithUniqueID:v9];

    if (v10)
    {
      BOOL v11 = [v10 accessories];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __70__NPKPassAssociatedInfoManager_readerIdentifierForAccessory_withPass___block_invoke;
      v19[3] = &unk_2644D7220;
      id v20 = v6;
      id v21 = &v22;
      [v11 enumerateKeysAndObjectsUsingBlock:v19];
    }
  }
  uint64_t v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v23[5];
      uint64_t v16 = [v6 uniqueIdentifier];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v29 = v15;
      __int16 v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Found reader identifer %@ for accessory %@", buf, 0x16u);
    }
  }
  id v17 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v17;
}

void __70__NPKPassAssociatedInfoManager_readerIdentifierForAccessory_withPass___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  uint64_t v9 = [v7 uniqueIdentifier];
  id v10 = [v8 uniqueIdentifier];

  LODWORD(v8) = [v9 isEqual:v10];
  if (v8)
  {
    uint64_t v11 = [v14 hexEncoding];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a4 = 1;
  }
}

- (void)_fetchHomeAccessStatusForPass:(id)a3
{
  id v4 = a3;
  BOOL v5 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke;
  v7[3] = &unk_2644D2E08;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F5BEB0]);
  id v3 = [*(id *)(a1 + 32) serialNumber];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke_2;
  v6[3] = &unk_2644D3E38;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 isHomeAccessRestrictedForPassSerialNumber:v3 withCompletion:v6];
}

void __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke_2(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) uniqueID];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke_3;
  v5[3] = &__block_descriptor_33_e36_B16__0__NPKPassAssociatedInfoModel_8l;
  char v6 = a2;
  [v3 _updatePassInfoManagerForPassUniqueID:v4 updateBlock:v5];
}

uint64_t __62__NPKPassAssociatedInfoManager__fetchHomeAccessStatusForPass___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3 && *(unsigned __int8 *)(a1 + 32) != [v3 isHomeAccessRestricted])
  {
    char v6 = pk_General_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = pk_General_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = NSStringFromBOOL();
        int v11 = 138412290;
        uint64_t v12 = v9;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Access status fetched. Is restricted: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    [v4 setIsHomeAccessRestricted:*(unsigned __int8 *)(a1 + 32)];
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isHomeAccessRestrictedForPass:(id)a3
{
  id v4 = a3;
  if (NPKMockAccessRestricted())
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [v4 uniqueID];
    BOOL v7 = [(NPKPassAssociatedInfoManager *)self passInfoForPassWithUniqueID:v6];

    char v5 = [v7 isHomeAccessRestricted];
  }

  return v5;
}

- (BOOL)canPerformRKEActionsForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__NPKPassAssociatedInfoManager_canPerformRKEActionsForPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D5B30;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

void __72__NPKPassAssociatedInfoManager_canPerformRKEActionsForPassWithUniqueID___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(v2, "tiles", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) state];
        id v9 = [v8 action];
        uint64_t v10 = [v9 type];

        if (v10 == 4)
        {
          *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (unint64_t)rangingSuspensionReasonForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__NPKPassAssociatedInfoManager_rangingSuspensionReasonForPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D5B30;
  void block[4] = self;
  id v10 = v4;
  long long v11 = &v12;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __75__NPKPassAssociatedInfoManager_rangingSuspensionReasonForPassWithUniqueID___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v2 rangingSuspensionReason];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: didReceiveBalanceUpdate %@ for pass uniqueID %@", buf, 0x16u);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v13[3] = &unk_2644D7268;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [(NPKPassAssociatedInfoManager *)self _updatePassInfoManagerForPassUniqueID:v11 updateBlock:v13];
}

uint64_t __88__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 balances];
  char v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if (v5)
  {
    id v6 = [v3 pass];
    int v7 = [v6 npkIsAddValuePending];

    if (!v7)
    {
      uint64_t v12 = 0;
      goto LABEL_11;
    }
    id v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v14 = 138412290;
        uint64_t v15 = v11;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: pass with uniqueID:%@ has add value pending", (uint8_t *)&v14, 0xCu);
      }
    }
    [v3 updateItemFields];
  }
  else
  {
    [v3 setBalances:*(void *)(a1 + 32)];
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: didReceivePlanUpdate %@ for pass uniqueID %@", buf, 0x16u);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __85__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  v13[3] = &unk_2644D7268;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [(NPKPassAssociatedInfoManager *)self _updatePassInfoManagerForPassUniqueID:v11 updateBlock:v13];
}

uint64_t __85__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 dynamicPlans];
  char v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if (v5)
  {
    id v6 = [v3 pass];
    int v7 = [v6 npkIsAddValuePending];

    if (!v7)
    {
      uint64_t v12 = 0;
      goto LABEL_11;
    }
    id v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v14 = 138412290;
        uint64_t v15 = v11;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: pass with uniqueID:%@ has add value pending", (uint8_t *)&v14, 0xCu);
      }
    }
    [v3 updateItemFields];
  }
  else
  {
    [v3 setDynamicPlans:*(void *)(a1 + 32)];
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: didUpdateWithTransitPassProperties:%@ for pass uniqueID:%@", buf, 0x16u);
    }
  }
  uint64_t v11 = [(NSMutableDictionary *)self->_passAssociatedInfoModelsByPassUniqueID objectForKey:v6];
  uint64_t v12 = [v11 pass];
  long long v13 = [v12 paymentPass];

  if (v13)
  {
    [(NPKPassAssociatedInfoManager *)self _fetchMostRecentTransitPropertiesAndAppletStateForPass:v13];
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __99__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    v14[3] = &unk_2644D7268;
    id v15 = v7;
    id v16 = v6;
    [(NPKPassAssociatedInfoManager *)self _updatePassInfoManagerForPassUniqueID:v16 updateBlock:v14];
  }
}

uint64_t __99__NPKPassAssociatedInfoManager_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 transitPassProperties];
  char v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if (v5)
  {
    id v6 = [v3 pass];
    int v7 = [v6 npkIsAddValuePending];

    if (!v7)
    {
      uint64_t v12 = 0;
      goto LABEL_11;
    }
    id v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v14 = 138412290;
        uint64_t v15 = v11;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: pass with uniqueID:%@ has add value pending", (uint8_t *)&v14, 0xCu);
      }
    }
    [v3 updateItemFields];
  }
  else
  {
    [v3 setTransitPassProperties:*(void *)(a1 + 32)];
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412802;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2048;
      int64_t v21 = a5;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: didUpdateTiles %@ for pass uniqueID %@ for context %ld", buf, 0x20u);
    }
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__NPKPassAssociatedInfoManager_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
  v14[3] = &unk_2644D7290;
  id v15 = v9;
  id v13 = v9;
  [(NPKPassAssociatedInfoManager *)self _updatePassInfoManagerForPassUniqueID:v8 updateBlock:v14];
}

uint64_t __83__NPKPassAssociatedInfoManager_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 tiles];
  int v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if ((v5 & 1) == 0) {
    [v3 setTiles:*(void *)(a1 + 32)];
  }

  return v5 ^ 1u;
}

- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [v7 identifier];
      *(_DWORD *)long long buf = 134218242;
      unint64_t v18 = a5;
      __int16 v19 = 2112;
      __int16 v20 = v11;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: didUpdateRangingSuspensionReasons (%lu) for pass with subcredential identifier %@", buf, 0x16u);
    }
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke;
  block[3] = &unk_2644D3288;
  void block[4] = self;
  id v15 = v7;
  unint64_t v16 = a5;
  id v13 = v7;
  dispatch_async(internalQueue, block);
}

void __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__21;
  id v13 = __Block_byref_object_dispose__21;
  id v14 = 0;
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke_2;
  v6[3] = &unk_2644D72B8;
  id v7 = *(id *)(a1 + 40);
  id v8 = &v9;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v10[5];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke_3;
  v5[3] = &__block_descriptor_40_e36_B16__0__NPKPassAssociatedInfoModel_8l;
  void v5[4] = *(void *)(a1 + 48);
  [v3 _updatePassInfoManagerForPassUniqueID:v4 updateBlock:v5];

  _Block_object_dispose(&v9, 8);
}

void __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v15 = [a3 pass];
  id v6 = [v15 devicePrimaryContactlessPaymentApplication];
  id v7 = [v6 subcredentials];
  id v8 = [v7 anyObject];

  uint64_t v9 = [v8 identifier];
  id v10 = [*(id *)(a1 + 32) identifier];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    uint64_t v12 = [v15 uniqueID];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
}

BOOL __99__NPKPassAssociatedInfoManager_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 rangingSuspensionReason];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4 != v5) {
    [v3 setRangingSuspensionReason:v5];
  }

  return v4 != v5;
}

- (void)paymentServiceReceivedInterruption
{
  self->_paymentServiceWasInterrupted = 1;
}

- (void)paymentServiceEstablishedConnection
{
  if (self->_paymentServiceWasInterrupted)
  {
    self->_paymentServiceWasInterrupted = 0;
    id v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      uint64_t v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Refreshing all associated pass info following re-establishment of connection", v6, 2u);
      }
    }
    [(NPKPassAssociatedInfoManager *)self refreshAllPasses];
  }
}

- (void)accountChanged:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 accountIdentifier];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: received accountChanged for account with identifier %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [(NPKPassAssociatedInfoManager *)self _handleReceivedAccountUpdateWithAccount:v4];
}

- (void)precursorPassRequestsManager:(id)a3 didUpdateUpgradePrequestDescription:(id)a4 forPassUniqueID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __113__NPKPassAssociatedInfoManager_precursorPassRequestsManager_didUpdateUpgradePrequestDescription_forPassUniqueID___block_invoke;
  block[3] = &unk_2644D31B0;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(internalQueue, block);
}

void __113__NPKPassAssociatedInfoManager_precursorPassRequestsManager_didUpdateUpgradePrequestDescription_forPassUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __113__NPKPassAssociatedInfoManager_precursorPassRequestsManager_didUpdateUpgradePrequestDescription_forPassUniqueID___block_invoke_2;
  v3[3] = &unk_2644D7290;
  id v4 = *(id *)(a1 + 48);
  [v1 _updatePassInfoManagerForPassUniqueID:v2 updateBlock:v3];
}

uint64_t __113__NPKPassAssociatedInfoManager_precursorPassRequestsManager_didUpdateUpgradePrequestDescription_forPassUniqueID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 precursorPassDescription];
  int v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if ((v5 & 1) == 0) {
    [v3 setPrecursorPassDescription:*(void *)(a1 + 32)];
  }

  return v5 ^ 1u;
}

- (id)_transitPassBalanceModelWithPass:(id)a3 currentModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v8 = [[NPKPassAssociatedInfoModel alloc] initWithPass:v6];
  int v9 = [v7 balances];
  [(NPKPassAssociatedInfoModel *)v8 setBalances:v9];

  id v10 = [v7 transitPassProperties];
  if (v10)
  {
    [(NPKPassAssociatedInfoModel *)v8 setTransitPassProperties:v10];
  }
  else
  {
    id v11 = [MEMORY[0x263F5C2C8] passPropertiesForPass:v6];
    [(NPKPassAssociatedInfoModel *)v8 setTransitPassProperties:v11];
  }
  uint64_t v12 = [v7 transitAppletState];
  [(NPKPassAssociatedInfoModel *)v8 setTransitAppletState:v12];

  id v13 = [v7 tiles];
  [(NPKPassAssociatedInfoModel *)v8 setTiles:v13];

  -[NPKPassAssociatedInfoModel setRangingSuspensionReason:](v8, "setRangingSuspensionReason:", [v7 rangingSuspensionReason]);
  id v14 = [v7 accessories];
  [(NPKPassAssociatedInfoModel *)v8 setAccessories:v14];

  return v8;
}

- (void)_fetchMostRecentInfoForPass:(id)a3
{
  id v4 = a3;
  [(NPKPassAssociatedInfoManager *)self _fetchMostRecentBalancesForPass:v4];
  if (NPKIsTruthOnCardTransitPass(v4))
  {
    [(NPKPassAssociatedInfoManager *)self _fetchMostRecentTransitPropertiesAndAppletStateForPass:v4];
    [(NPKPassAssociatedInfoManager *)self _fetchMostRecentCommutePlansForPass:v4];
  }
  if ([v4 isAccessPass]) {
    [(NPKPassAssociatedInfoManager *)self _fetchMostRecentTilesForPass:v4];
  }
  if ([v4 npkSupportsBluetooth]) {
    [(NPKPassAssociatedInfoManager *)self _fetchMostRecentRangingSuspensionReasonForPass:v4];
  }
  if ([v4 isHomeKeyPass]) {
    [(NPKPassAssociatedInfoManager *)self _fetchHomeAccessStatusForPass:v4];
  }
  if ([v4 npkIsPrecursorPass]) {
    [(NPKPassAssociatedInfoManager *)self _fetchPrecursorPassDescriptionForPass:v4];
  }
}

- (void)_loadPassContentIfNeeded:(id)a3
{
  id v4 = a3;
  if (([v4 isContentLoaded] & 1) == 0)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __57__NPKPassAssociatedInfoManager__loadPassContentIfNeeded___block_invoke;
    v5[3] = &unk_2644D2E08;
    void v5[4] = self;
    id v6 = v4;
    [v6 loadContentAsyncWithCompletion:v5];
  }
}

void __57__NPKPassAssociatedInfoManager__loadPassContentIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__NPKPassAssociatedInfoManager__loadPassContentIfNeeded___block_invoke_2;
  v3[3] = &unk_2644D2E08;
  void v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __57__NPKPassAssociatedInfoManager__loadPassContentIfNeeded___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 40) uniqueID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    int v5 = [*(id *)(a1 + 32) _transitPassBalanceModelWithPass:*(void *)(a1 + 40) currentModel:v4];
    if ((NPKIsEqual(v4, v5) & 1) == 0)
    {
      id v6 = pk_General_log();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

      if (v7)
      {
        id v8 = pk_General_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138412546;
          uint64_t v12 = v4;
          __int16 v13 = 2112;
          id v14 = v5;
          _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: transit pass model did change from:%@ to:%@", (uint8_t *)&v11, 0x16u);
        }
      }
      int v9 = *(void **)(*(void *)(a1 + 32) + 24);
      id v10 = [*(id *)(a1 + 40) uniqueID];
      [v9 setObject:v5 forKeyedSubscript:v10];

      [*(id *)(a1 + 32) _notifyObserversOfUpdatedTransitPassInfoForModel:v5];
    }
  }
}

- (void)_fetchMostRecentBalancesForPass:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NPKPassAssociatedInfoManager *)self _isPassWithAccountBalanceForPass:v4])
  {
    [(NPKPassAssociatedInfoManager *)self _fetchMostRecentAccountBalanceForPass:v4];
  }
  else
  {
    int v5 = [v4 uniqueID];

    id v6 = pk_General_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = pk_General_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v14 = v5;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested fetch most recent balances for pass with unique ID %@", buf, 0xCu);
      }
    }
    int v9 = [(NPKPassAssociatedInfoManager *)self paymentService];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__NPKPassAssociatedInfoManager__fetchMostRecentBalancesForPass___block_invoke;
    v10[3] = &unk_2644D5670;
    id v11 = v5;
    uint64_t v12 = self;
    id v4 = v5;
    [v9 balancesForPaymentPassWithUniqueIdentifier:v4 completion:v10];
  }
}

void __64__NPKPassAssociatedInfoManager__fetchMostRecentBalancesForPass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      id v15 = v3;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: received most recent balances %@ for pass with unique ID %@", buf, 0x16u);
    }
  }
  uint64_t v10 = a1 + 32;
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(v10 + 8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__NPKPassAssociatedInfoManager__fetchMostRecentBalancesForPass___block_invoke_81;
  v12[3] = &unk_2644D7290;
  id v13 = v3;
  id v11 = v3;
  [v9 _updatePassInfoManagerForPassUniqueID:v8 updateBlock:v12];
}

uint64_t __64__NPKPassAssociatedInfoManager__fetchMostRecentBalancesForPass___block_invoke_81(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 balances];
  int v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if ((v5 & 1) == 0) {
    [v3 setBalances:*(void *)(a1 + 32)];
  }

  return v5 ^ 1u;
}

- (void)_fetchMostRecentCommutePlansForPass:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [a3 uniqueID];
  int v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested fetch most recent commute plans for pass with unique ID %@", buf, 0xCu);
    }
  }
  uint64_t v8 = [(NPKPassAssociatedInfoManager *)self paymentService];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__NPKPassAssociatedInfoManager__fetchMostRecentCommutePlansForPass___block_invoke;
  v10[3] = &unk_2644D7300;
  id v11 = v4;
  uint64_t v12 = self;
  id v9 = v4;
  [v8 plansForPaymentPassWithUniqueIdentifier:v9 completion:v10];
}

void __68__NPKPassAssociatedInfoManager__fetchMostRecentCommutePlansForPass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      id v15 = v3;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: received most recent commute plans %@ for pass with unique ID %@", buf, 0x16u);
    }
  }
  uint64_t v10 = a1 + 32;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v10 + 8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__NPKPassAssociatedInfoManager__fetchMostRecentCommutePlansForPass___block_invoke_83;
  v12[3] = &unk_2644D7290;
  id v13 = v3;
  id v11 = v3;
  [v9 _updatePassInfoManagerForPassUniqueID:v8 updateBlock:v12];
}

uint64_t __68__NPKPassAssociatedInfoManager__fetchMostRecentCommutePlansForPass___block_invoke_83(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 commutePlanFields];
  [v3 setDynamicPlans:*(void *)(a1 + 32)];
  BOOL v5 = [v3 commutePlanFields];

  uint64_t v6 = NPKIsEqual(v5, v4) ^ 1;
  return v6;
}

- (BOOL)_isPassWithAccountBalanceForPass:(id)a3
{
  unint64_t v3 = [a3 associatedAccountFeatureIdentifier];
  return v3 > 5 || (v3 & 0x3F) == 4;
}

- (void)_fetchMostRecentAccountBalanceForPass:(id)a3
{
  id v4 = a3;
  if ([(NPKPassAssociatedInfoManager *)self _isPassWithAccountBalanceForPass:v4])
  {
    objc_initWeak(&location, self);
    BOOL v5 = (void *)[v4 associatedAccountFeatureIdentifier];
    uint64_t v6 = [(NPKPassAssociatedInfoManager *)self accountService];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__NPKPassAssociatedInfoManager__fetchMostRecentAccountBalanceForPass___block_invoke;
    v7[3] = &unk_2644D7328;
    objc_copyWeak(v9, &location);
    v9[1] = v5;
    id v8 = v4;
    [v6 defaultAccountForFeature:v5 completion:v7];

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void __70__NPKPassAssociatedInfoManager__fetchMostRecentAccountBalanceForPass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__NPKPassAssociatedInfoManager__fetchMostRecentAccountBalanceForPass___block_invoke_2;
    block[3] = &unk_2644D2DE0;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 48);
    id v13 = v10;
    uint64_t v17 = v11;
    id v14 = v6;
    id v15 = v8;
    id v16 = *(id *)(a1 + 32);
    dispatch_async(v9, block);
  }
}

void __70__NPKPassAssociatedInfoManager__fetchMostRecentAccountBalanceForPass___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      if (v5) {
        id v6 = &stru_26CFEBA18;
      }
      else {
        id v6 = @"not ";
      }
      uint64_t v7 = [v5 accountIdentifier];
      id v8 = PKFeatureIdentifierToString();
      uint64_t v9 = *(void *)(a1 + 40);
      int v13 = 138413058;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Did %@receive account with identifier %@ for feature identifier %@. Error?: %@", (uint8_t *)&v13, 0x2Au);
    }
  }
  if (*(void *)(a1 + 32))
  {
    id v10 = [*(id *)(a1 + 48) passUniqueIDsByAccountIdentifier];
    uint64_t v11 = [*(id *)(a1 + 56) uniqueID];
    uint64_t v12 = [*(id *)(a1 + 32) accountIdentifier];
    [v10 setObject:v11 forKey:v12];

    objc_msgSend(*(id *)(a1 + 48), "_internalQueue_processReceivedAccountUpdateWithAccount:", *(void *)(a1 + 32));
    [*(id *)(a1 + 48) _refreshAccountBalanceIfApplicableForPass:*(void *)(a1 + 56) withAccount:*(void *)(a1 + 32)];
  }
}

- (void)_refreshAccountBalanceIfApplicableForPass:(id)a3 withAccount:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [MEMORY[0x263EFF910] date];
    uint64_t v9 = [v7 lastUpdated];
    [v8 timeIntervalSinceDate:v9];
    BOOL v11 = v10 > 300.0;
  }
  else
  {
    BOOL v11 = 0;
  }
  uint64_t v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (v11) {
        __int16 v15 = &stru_26CFEBA18;
      }
      else {
        __int16 v15 = @"not ";
      }
      id v16 = [v7 accountIdentifier];
      [v6 associatedAccountFeatureIdentifier];
      __int16 v17 = PKFeatureIdentifierToString();
      *(_DWORD *)long long buf = 138412802;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      id v26 = v16;
      __int16 v27 = 2112;
      objc_super v28 = v17;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Will %@request refreshed account with identifier %@ for feature identifier %@.", buf, 0x20u);
    }
  }
  if (v11)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v18 = [MEMORY[0x263F5BCE8] sharedInstance];
    __int16 v19 = [v7 accountIdentifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __86__NPKPassAssociatedInfoManager__refreshAccountBalanceIfApplicableForPass_withAccount___block_invoke;
    v20[3] = &unk_2644D7350;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v6;
    [v18 updateAccountWithIdentifier:v19 extended:0 completion:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __86__NPKPassAssociatedInfoManager__refreshAccountBalanceIfApplicableForPass_withAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained[1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __86__NPKPassAssociatedInfoManager__refreshAccountBalanceIfApplicableForPass_withAccount___block_invoke_2;
    v10[3] = &unk_2644D3BE0;
    id v11 = v5;
    id v12 = *(id *)(a1 + 32);
    id v13 = v6;
    id v14 = v8;
    dispatch_async(v9, v10);
  }
}

void __86__NPKPassAssociatedInfoManager__refreshAccountBalanceIfApplicableForPass_withAccount___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) accountIdentifier];
      [*(id *)(a1 + 40) associatedAccountFeatureIdentifier];
      id v6 = PKFeatureIdentifierToString();
      uint64_t v7 = *(void *)(a1 + 48);
      int v11 = 138412802;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: received refreshed account with identifier %@ for feature identifier %@. Error?: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  if (*(void *)(a1 + 32))
  {
    id v8 = [*(id *)(a1 + 56) passUniqueIDsByAccountIdentifier];
    uint64_t v9 = [*(id *)(a1 + 40) uniqueID];
    double v10 = [*(id *)(a1 + 32) accountIdentifier];
    [v8 setObject:v9 forKey:v10];

    objc_msgSend(*(id *)(a1 + 56), "_internalQueue_processReceivedAccountUpdateWithAccount:", *(void *)(a1 + 32));
  }
}

- (void)_handleReceivedAccountUpdateWithAccount:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__NPKPassAssociatedInfoManager__handleReceivedAccountUpdateWithAccount___block_invoke;
  v7[3] = &unk_2644D2E08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __72__NPKPassAssociatedInfoManager__handleReceivedAccountUpdateWithAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_processReceivedAccountUpdateWithAccount:", *(void *)(a1 + 40));
}

- (void)_internalQueue_processReceivedAccountUpdateWithAccount:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_passUniqueIDsByAccountIdentifier)
  {
    id v5 = [(NPKPassAssociatedInfoManager *)self passUniqueIDsByAccountIdentifier];
    id v6 = [v4 accountIdentifier];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([v7 length])
  {
    [(NPKPassAssociatedInfoManager *)self _processAccountBalancesForPassWithUniqueID:v7 withAccount:v4];
  }
  else
  {
    id v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      double v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = [v4 accountIdentifier];
        int v12 = 138412290;
        __int16 v13 = v11;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Not processing balances for not-tracked account with identifier %@ ", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)_processAccountBalancesForPassWithUniqueID:(id)a3 withAccount:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    double v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Processing account balances for pass with uniqueID %@ with account %@", buf, 0x16u);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __87__NPKPassAssociatedInfoManager__processAccountBalancesForPassWithUniqueID_withAccount___block_invoke;
  v13[3] = &unk_2644D71D8;
  void v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [(NPKPassAssociatedInfoManager *)self _updatePassInfoManagerForPassUniqueID:v11 updateBlock:v13];
}

uint64_t __87__NPKPassAssociatedInfoManager__processAccountBalancesForPassWithUniqueID_withAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _shouldUseBalanceForAccount:*(void *)(a1 + 40)])
  {
    if ([*(id *)(a1 + 40) feature] == 4)
    {
      id v4 = [(id)objc_opt_class() accountBalanceForAccount:*(void *)(a1 + 40)];
      if (v4)
      {
        id v5 = [MEMORY[0x263EFFA08] setWithObject:v4];
      }
      else
      {
        id v5 = 0;
      }

      goto LABEL_12;
    }
  }
  else
  {
    id v6 = pk_General_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = pk_General_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        double v10 = [*(id *)(a1 + 40) accountIdentifier];
        [*(id *)(a1 + 40) state];
        id v11 = PKAccountStateToString();
        int v15 = 138412802;
        uint64_t v16 = v9;
        __int16 v17 = 2112;
        __int16 v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v11;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Not using account balance for pass with unique ID %@. Account identifier %@ state %@", (uint8_t *)&v15, 0x20u);
      }
    }
  }
  id v5 = 0;
LABEL_12:
  id v12 = [v3 balances];
  int v13 = NPKIsEqual(v12, v5);

  if ((v13 & 1) == 0) {
    [v3 setBalances:v5];
  }

  return v13 ^ 1u;
}

- (void)_fetchMostRecentTransitPropertiesAndAppletStateForPass:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 devicePrimaryPaymentApplication];
  id v6 = [v4 uniqueID];
  BOOL v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = [v5 applicationIdentifier];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v21 = v6;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested fetch most recent transit pass properties for pass with unique ID %@ payment application %@", buf, 0x16u);
    }
  }
  id v11 = [(NPKPassAssociatedInfoManager *)self paymentService];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__NPKPassAssociatedInfoManager__fetchMostRecentTransitPropertiesAndAppletStateForPass___block_invoke;
  v15[3] = &unk_2644D7378;
  id v16 = v5;
  id v17 = v4;
  id v18 = v6;
  __int16 v19 = self;
  id v12 = v6;
  id v13 = v4;
  id v14 = v5;
  [v11 transitStateWithPassUniqueIdentifier:v12 paymentApplication:v14 completion:v15];
}

void __87__NPKPassAssociatedInfoManager__fetchMostRecentTransitPropertiesAndAppletStateForPass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 transitPassPropertiesWithPaymentApplication:*(void *)(a1 + 32) pass:*(void *)(a1 + 40)];
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = [*(id *)(a1 + 32) applicationIdentifier];
      *(_DWORD *)long long buf = 138412802;
      __int16 v19 = v4;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Received most recent transit pass properties: %@ for pass with unique ID %@ payment application %@", buf, 0x20u);
    }
  }
  uint64_t v12 = a1 + 48;
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = *(void **)(v12 + 8);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__NPKPassAssociatedInfoManager__fetchMostRecentTransitPropertiesAndAppletStateForPass___block_invoke_93;
  v15[3] = &unk_2644D7268;
  id v16 = v3;
  id v17 = v4;
  id v13 = v4;
  id v14 = v3;
  [v11 _updatePassInfoManagerForPassUniqueID:v10 updateBlock:v15];
}

uint64_t __87__NPKPassAssociatedInfoManager__fetchMostRecentTransitPropertiesAndAppletStateForPass___block_invoke_93(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 transitAppletState];
  if ((NPKIsEqual(v4, *(void **)(a1 + 32)) & 1) == 0)
  {

    goto LABEL_5;
  }
  id v5 = [v3 transitPassProperties];
  char v6 = NPKIsEqual(v5, *(void **)(a1 + 40));

  if ((v6 & 1) == 0)
  {
LABEL_5:
    [v3 setTransitAppletState:*(void *)(a1 + 32)];
    [v3 setTransitPassProperties:*(void *)(a1 + 40)];
    uint64_t v7 = 1;
    goto LABEL_6;
  }
  uint64_t v7 = 0;
LABEL_6:

  return v7;
}

- (void)_fetchMostRecentTilesForPass:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uniqueID];
  char v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      int v15 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested fetch most recent tiles for pass with unique ID %@", buf, 0xCu);
    }
  }
  objc_initWeak((id *)buf, self);
  uint64_t v9 = [(NPKPassAssociatedInfoManager *)self paymentService];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__NPKPassAssociatedInfoManager__fetchMostRecentTilesForPass___block_invoke;
  v11[3] = &unk_2644D73A0;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v5;
  id v12 = v10;
  [v9 tilesForPassWithUniqueIdentifier:v10 context:1 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __61__NPKPassAssociatedInfoManager__fetchMostRecentTilesForPass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      id v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Received most recent tiles: %@ for pass with unique ID %@", buf, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__NPKPassAssociatedInfoManager__fetchMostRecentTilesForPass___block_invoke_95;
  v11[3] = &unk_2644D7290;
  id v12 = v3;
  id v10 = v3;
  [WeakRetained _updatePassInfoManagerForPassUniqueID:v9 updateBlock:v11];
}

uint64_t __61__NPKPassAssociatedInfoManager__fetchMostRecentTilesForPass___block_invoke_95(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 tiles];
  int v5 = NPKIsEqual(v4, *(void **)(a1 + 32));

  if ((v5 & 1) == 0) {
    [v3 setTiles:*(void *)(a1 + 32)];
  }

  return v5 ^ 1u;
}

- (void)_fetchMostRecentRangingSuspensionReasonForPass:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 uniqueID];
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested fetch most recent secure ranging suspension reason for pass with unique ID %@", buf, 0xCu);
    }
  }
  uint64_t v9 = [v4 devicePrimaryContactlessPaymentApplication];
  id v10 = [v9 subcredentials];
  id v11 = [v10 anyObject];

  id v12 = [(NPKPassAssociatedInfoManager *)self paymentService];
  id v13 = [v9 applicationIdentifier];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__NPKPassAssociatedInfoManager__fetchMostRecentRangingSuspensionReasonForPass___block_invoke;
  v15[3] = &unk_2644D73C8;
  void v15[4] = self;
  id v16 = v5;
  id v14 = v5;
  [v12 rangingSuspensionReasonForAppletSubcredential:v11 forPaymentApplicationID:v13 completion:v15];
}

uint64_t __79__NPKPassAssociatedInfoManager__fetchMostRecentRangingSuspensionReasonForPass___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__NPKPassAssociatedInfoManager__fetchMostRecentRangingSuspensionReasonForPass___block_invoke_2;
  v5[3] = &__block_descriptor_40_e36_B16__0__NPKPassAssociatedInfoModel_8l;
  void v5[4] = a2;
  return [v3 _updatePassInfoManagerForPassUniqueID:v2 updateBlock:v5];
}

BOOL __79__NPKPassAssociatedInfoManager__fetchMostRecentRangingSuspensionReasonForPass___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 rangingSuspensionReason];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4 != v5) {
    [v3 setRangingSuspensionReason:v5];
  }

  return v4 != v5;
}

- (void)_fetchPrecursorPassDescriptionForPass:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKPassAssociatedInfoManager *)self precursorPassManager];
  [v5 loadUpgradeControllerForPass:v4];
}

- (void)_updatePassInfoManagerForPassUniqueID:(id)a3 updateBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NPKPassAssociatedInfoManager__updatePassInfoManagerForPassUniqueID_updateBlock___block_invoke;
  block[3] = &unk_2644D3388;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __82__NPKPassAssociatedInfoManager__updatePassInfoManagerForPassUniqueID_updateBlock___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Requested to update associated info model for pass unique ID %@", (uint8_t *)&v11, 0xCu);
    }
  }
  id v6 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKeyedSubscript:*(void *)(a1 + 32)];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    [*(id *)(a1 + 40) _notifyObserversOfUpdatedTransitPassInfoForModel:v6];
  }
  else
  {
    id v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      id v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 138412290;
        uint64_t v12 = v10;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: did not update associated info model for pass uniqueID:%@.", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_updateAllPassesItemsFieldsPendingUpdateStatus
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(NSMutableDictionary *)self->_passAssociatedInfoModelsByPassUniqueID allValues];
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v16 = 0;
        uint64_t v17 = &v16;
        uint64_t v18 = 0x2020000000;
        char v19 = 0;
        id v7 = [v6 balanceFields];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __78__NPKPassAssociatedInfoManager__updateAllPassesItemsFieldsPendingUpdateStatus__block_invoke;
        v15[3] = &unk_2644D73F0;
        void v15[4] = &v16;
        [v7 enumerateObjectsUsingBlock:v15];

        [v6 updateItemFields];
        uint64_t v11 = 0;
        uint64_t v12 = &v11;
        uint64_t v13 = 0x2020000000;
        char v14 = 0;
        BOOL v8 = [v6 balanceFields];
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __78__NPKPassAssociatedInfoManager__updateAllPassesItemsFieldsPendingUpdateStatus__block_invoke_2;
        v10[3] = &unk_2644D73F0;
        void v10[4] = &v11;
        [v8 enumerateObjectsUsingBlock:v10];

        if (*((unsigned __int8 *)v17 + 24) != *((unsigned __int8 *)v12 + 24)) {
          [(NPKPassAssociatedInfoManager *)self _notifyObserversOfUpdatedTransitPassInfoForModel:v6];
        }
        _Block_object_dispose(&v11, 8);
        _Block_object_dispose(&v16, 8);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }
}

uint64_t __78__NPKPassAssociatedInfoManager__updateAllPassesItemsFieldsPendingUpdateStatus__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 hasPendingUpdate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __78__NPKPassAssociatedInfoManager__updateAllPassesItemsFieldsPendingUpdateStatus__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 hasPendingUpdate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)_notifyObserversOfUpdatedTransitPassInfoForModel:(id)a3
{
  internalQueue = self->_internalQueue;
  id v4 = a3;
  dispatch_assert_queue_V2(internalQueue);
  uint64_t v5 = [v4 pass];
  long long v22 = [v5 uniqueID];

  long long v21 = [NPKPassAssociatedInfo alloc];
  long long v20 = [v4 transitPassProperties];
  id v6 = [v4 transitAppletState];
  id v7 = [v4 balanceFields];
  BOOL v8 = [v4 commutePlanFields];
  id v9 = [v4 tiles];
  uint64_t v10 = [v4 rangingSuspensionReason];
  uint64_t v11 = [v4 accessories];
  char v12 = [v4 isHomeAccessRestricted];
  uint64_t v13 = [v4 precursorPassDescription];
  LOBYTE(v5) = [v4 hasDeviceBoundCommutePlans];

  LOBYTE(v19) = (_BYTE)v5;
  LOBYTE(v18) = v12;
  char v14 = [(NPKPassAssociatedInfo *)v21 initWithTransitProperties:v20 appletState:v6 balanceFields:v7 commutePlanFields:v8 tiles:v9 rangingSuspensionReason:v10 accessories:v11 isHomeAccessRestricted:v18 precursorPassDescription:v13 hasDeviceBoundCommutePlans:v19];

  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__NPKPassAssociatedInfoManager__notifyObserversOfUpdatedTransitPassInfoForModel___block_invoke;
  block[3] = &unk_2644D31B0;
  void block[4] = self;
  uint64_t v25 = v14;
  id v26 = v22;
  id v16 = v22;
  uint64_t v17 = v14;
  dispatch_async(observerQueue, block);
}

void __81__NPKPassAssociatedInfoManager__notifyObserversOfUpdatedTransitPassInfoForModel___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__NPKPassAssociatedInfoManager__notifyObserversOfUpdatedTransitPassInfoForModel___block_invoke_2;
  v3[3] = &unk_2644D7418;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _notifyObservers:v3];
}

uint64_t __81__NPKPassAssociatedInfoManager__notifyObserversOfUpdatedTransitPassInfoForModel___block_invoke_2(void *a1, void *a2)
{
  return [a2 passAssociatedInfoManager:a1[4] didUpdatePassInfo:a1[5] withPassUniqueID:a1[6]];
}

- (void)_internalQueue_regenerateAssociatedInfoModelForPass:(id)a3 inModelsByID:(id)a4
{
  internalQueue = self->_internalQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(internalQueue);
  passAssociatedInfoModelsByPassUniqueID = self->_passAssociatedInfoModelsByPassUniqueID;
  uint64_t v10 = [v8 uniqueID];
  id v13 = [(NSMutableDictionary *)passAssociatedInfoModelsByPassUniqueID objectForKeyedSubscript:v10];

  uint64_t v11 = [(NPKPassAssociatedInfoManager *)self _transitPassBalanceModelWithPass:v8 currentModel:v13];
  char v12 = [v8 uniqueID];
  [v7 setObject:v11 forKeyedSubscript:v12];

  [(NPKPassAssociatedInfoManager *)self _loadPassContentIfNeeded:v8];
  [(NPKPassAssociatedInfoManager *)self _fetchMostRecentInfoForPass:v8];

  if ((NPKIsEqual(v13, v11) & 1) == 0) {
    [(NPKPassAssociatedInfoManager *)self _notifyObserversOfUpdatedTransitPassInfoForModel:v11];
  }
}

- (BOOL)_isPassEligible:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isStoredValuePass] & 1) != 0
    || ([v4 isAccessPass] & 1) != 0
    || [(NPKPassAssociatedInfoManager *)self _isPassWithAccountBalanceForPass:v4]
    || ([v4 npkIsPrecursorPass] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    BOOL v5 = 0;
    if (v8)
    {
      id v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v4 uniqueID];
        int v11 = 138412290;
        char v12 = v10;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassAssociatedInfoManager: Pass is not eligible (non-transit, non-eMoney, non-Access, non-Apple Balance) with uniqueID:%@", (uint8_t *)&v11, 0xCu);
      }
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_shouldUseBalanceForAccount:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 state];
    if (v5 <= 5) {
      unsigned int v6 = (0x23u >> v5) & 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSMutableDictionary)passUniqueIDsByAccountIdentifier
{
  passUniqueIDsByAccountIdentifier = self->_passUniqueIDsByAccountIdentifier;
  if (!passUniqueIDsByAccountIdentifier)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    unint64_t v5 = self->_passUniqueIDsByAccountIdentifier;
    self->_passUniqueIDsByAccountIdentifier = v4;

    passUniqueIDsByAccountIdentifier = self->_passUniqueIDsByAccountIdentifier;
  }
  return passUniqueIDsByAccountIdentifier;
}

- (PKPaymentService)paymentService
{
  return self->_paymentService;
}

- (PKAccountService)accountService
{
  return self->_accountService;
}

- (NPKPrecursorPassUpgradeRequestsManager)precursorPassManager
{
  return self->_precursorPassManager;
}

- (BOOL)paymentServiceWasInterrupted
{
  return self->_paymentServiceWasInterrupted;
}

- (void)setPaymentServiceWasInterrupted:(BOOL)a3
{
  self->_paymentServiceWasInterrupted = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void)setPassUniqueIDsByAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIDsByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_precursorPassManager, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_passAssociatedInfoModelsByPassUniqueID, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end