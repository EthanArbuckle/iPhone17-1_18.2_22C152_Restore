@interface NPKPeerPaymentMessagesTransactionsManager
+ (id)sharedInstance;
- (NPKPeerPaymentMessagesTransactionsManager)initWithPeerPaymentPassUniqueID:(id)a3;
- (NPKPeerPaymentMessagesTransactionsManager)initWithPeerPaymentPassUniqueID:(id)a3 paymentService:(id)a4;
- (NSMutableDictionary)transactionDetails;
- (NSMutableSet)currentLookupIdentifiers;
- (NSString)peerPaymentPassUniqueID;
- (PKPaymentService)paymentService;
- (id)_sharedPeerPaymentWebService;
- (id)_transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:(id)a3;
- (id)availableActionsForPaymentTransactionWithServiceIdentifier:(id)a3;
- (id)peerPaymentTransactionWithServiceIdentifier:(id)a3;
- (unint64_t)_transactionQueue_statusOfPaymentTransactionWithServiceIdentifier:(id)a3;
- (unint64_t)statusOfPaymentTransactionWithServiceIdentifier:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_fetchAllPeerPaymentTransactionsWithPeerPaymentPassID:(id)a3;
- (void)_passLibraryChanged:(id)a3;
- (void)_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:(id)a3;
- (void)_transactionsQueue_setStatus:(unint64_t)a3 forPaymentTransactionWithServiceIdentifier:(id)a4 notifyUpdate:(BOOL)a5;
- (void)dealloc;
- (void)lookupTransactionActionsIfNeededWithServiceIdentifier:(id)a3;
- (void)setPeerPaymentPassUniqueID:(id)a3;
- (void)setStatus:(unint64_t)a3 forPaymentTransactionWithServiceIdentifier:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
@end

@implementation NPKPeerPaymentMessagesTransactionsManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_17);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

void __59__NPKPeerPaymentMessagesTransactionsManager_sharedInstance__block_invoke()
{
  v0 = [MEMORY[0x263F5BF80] sharedInstance];
  id v3 = [v0 peerPaymentPassUniqueID];

  v1 = [[NPKPeerPaymentMessagesTransactionsManager alloc] initWithPeerPaymentPassUniqueID:v3];
  v2 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v1;
}

- (NPKPeerPaymentMessagesTransactionsManager)initWithPeerPaymentPassUniqueID:(id)a3
{
  return [(NPKPeerPaymentMessagesTransactionsManager *)self initWithPeerPaymentPassUniqueID:a3 paymentService:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NPKPeerPaymentMessagesTransactionsManager;
  [(NPKPeerPaymentMessagesTransactionsManager *)&v4 dealloc];
}

- (NPKPeerPaymentMessagesTransactionsManager)initWithPeerPaymentPassUniqueID:(id)a3 paymentService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NPKPeerPaymentMessagesTransactionsManager;
  v8 = [(NPKPeerPaymentMessagesTransactionsManager *)&v25 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nanopasskit.peerPaymentmessagesTransactionManager.transactions", 0);
    transactionsQueue = v8->_transactionsQueue;
    v8->_transactionsQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.nanopasskit.peerPaymentmessagesTransactionManager.peerPaymentPass", 0);
    peerPaymentPassQueue = v8->_peerPaymentPassQueue;
    v8->_peerPaymentPassQueue = (OS_dispatch_queue *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    transactionDetails = v8->_transactionDetails;
    v8->_transactionDetails = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    currentLookupIdentifiers = v8->_currentLookupIdentifiers;
    v8->_currentLookupIdentifiers = v15;

    uint64_t v17 = [v6 copy];
    peerPaymentPassUniqueID = v8->_peerPaymentPassUniqueID;
    v8->_peerPaymentPassUniqueID = (NSString *)v17;

    if (v7) {
      v19 = (PKPaymentService *)v7;
    }
    else {
      v19 = (PKPaymentService *)[objc_alloc(MEMORY[0x263F5C0A8]) initWithDelegate:v8];
    }
    paymentService = v8->_paymentService;
    v8->_paymentService = v19;

    [(PKPaymentService *)v8->_paymentService setDelegate:v8];
    [(NPKPeerPaymentMessagesTransactionsManager *)v8 _fetchAllPeerPaymentTransactionsWithPeerPaymentPassID:v8->_peerPaymentPassUniqueID];
    v21 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v22 = *MEMORY[0x263F5C650];
    v23 = [MEMORY[0x263F5BF80] sharedInstance];
    [v21 addObserver:v8 selector:sel__passLibraryChanged_ name:v22 object:v23];

    [v21 addObserver:v8 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F5C888] object:0];
  }

  return v8;
}

- (void)_passLibraryChanged:(id)a3
{
  objc_msgSend(MEMORY[0x263F5BF80], "sharedInstance", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v4 = [v5 peerPaymentPassUniqueID];
  [(NPKPeerPaymentMessagesTransactionsManager *)self setPeerPaymentPassUniqueID:v4];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  objc_super v4 = [(NPKPeerPaymentMessagesTransactionsManager *)self peerPaymentPassUniqueID];
  if (v4)
  {
    id v5 = v4;
    [(NPKPeerPaymentMessagesTransactionsManager *)self _fetchAllPeerPaymentTransactionsWithPeerPaymentPassID:v4];
    objc_super v4 = v5;
  }
}

- (void)setPeerPaymentPassUniqueID:(id)a3
{
  objc_super v4 = (void *)[a3 copy];
  peerPaymentPassQueue = self->_peerPaymentPassQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__NPKPeerPaymentMessagesTransactionsManager_setPeerPaymentPassUniqueID___block_invoke;
  v7[3] = &unk_2644D2E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(peerPaymentPassQueue, v7);
}

uint64_t __72__NPKPeerPaymentMessagesTransactionsManager_setPeerPaymentPassUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 24);
  if (result != v2)
  {
    uint64_t result = objc_msgSend((id)result, "isEqualToString:");
    if ((result & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
      objc_super v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      return [v4 _fetchAllPeerPaymentTransactionsWithPeerPaymentPassID:v5];
    }
  }
  return result;
}

- (NSString)peerPaymentPassUniqueID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  peerPaymentPassQueue = self->_peerPaymentPassQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__NPKPeerPaymentMessagesTransactionsManager_peerPaymentPassUniqueID__block_invoke;
  v5[3] = &unk_2644D2960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(peerPaymentPassQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __68__NPKPeerPaymentMessagesTransactionsManager_peerPaymentPassUniqueID__block_invoke(uint64_t a1)
{
}

- (unint64_t)statusOfPaymentTransactionWithServiceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 2;
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__NPKPeerPaymentMessagesTransactionsManager_statusOfPaymentTransactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_2644D42D8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(transactionsQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __93__NPKPeerPaymentMessagesTransactionsManager_statusOfPaymentTransactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_transactionQueue_statusOfPaymentTransactionWithServiceIdentifier:", *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)availableActionsForPaymentTransactionWithServiceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__NPKPeerPaymentMessagesTransactionsManager_availableActionsForPaymentTransactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_2644D42D8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(transactionsQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __104__NPKPeerPaymentMessagesTransactionsManager_availableActionsForPaymentTransactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) transactionDetails];
  uint64_t v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 availableActions];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unint64_t)_transactionQueue_statusOfPaymentTransactionWithServiceIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  uint64_t v5 = [(NPKPeerPaymentMessagesTransactionsManager *)self peerPaymentPassUniqueID];

  if (v5)
  {
    id v6 = [(NPKPeerPaymentMessagesTransactionsManager *)self transactionDetails];
    id v7 = [v6 objectForKey:v4];

    if (v7)
    {
      uint64_t v8 = [v7 paymentStatus];
      if (v8)
      {
LABEL_18:
        v19 = pk_Payment_log();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

        if (v20)
        {
          v21 = pk_Payment_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = NSStringWithNPKPeerPaymentStatus(v8);
            int v24 = 138412802;
            objc_super v25 = v22;
            __int16 v26 = 2112;
            v27 = v7;
            __int16 v28 = 2112;
            v29 = v4;
            _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Returning status %@ for transaction details %@ (service identifier %@)", (uint8_t *)&v24, 0x20u);
          }
        }
LABEL_22:

        goto LABEL_23;
      }
    }
    if (NPKShouldHonorUserPreferenceTransactionStatus())
    {
      dispatch_queue_t v9 = NPKGlobalDomainPreferencesGetValue(@"NPKUserPreferenceTransactionsStatus");
      uint64_t v8 = NPKPeerPaymentStatusWithNSString(v9);
      id v10 = pk_General_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (!v11)
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = NSStringWithNPKPeerPaymentStatus(v8);
        int v24 = 138412546;
        objc_super v25 = v13;
        __int16 v26 = 2112;
        v27 = v4;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Using mock SURF server; will return status %@ for transaction with identifier %@",
          (uint8_t *)&v24,
          0x16u);
      }
    }
    else
    {
      id v17 = [v7 transaction];
      dispatch_queue_t v9 = v17;
      if (!v17)
      {
        uint64_t v8 = 0;
        goto LABEL_17;
      }
      uint64_t v18 = [v17 peerPaymentStatus];
      uint64_t v12 = [v7 availableActions];
      uint64_t v8 = NPKPeerPaymentStatusWithPKPeerPaymentStatusAndActions(v18, v12);
    }

    goto LABEL_17;
  }
  uint64_t v14 = pk_Payment_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSStringWithNPKPeerPaymentStatus(0);
      int v24 = 138412546;
      objc_super v25 = v16;
      __int16 v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Returning status %@ (service identifier %@). We don't have a peer payment pass setup.", (uint8_t *)&v24, 0x16u);
    }
    uint64_t v8 = 1;
    goto LABEL_22;
  }
  uint64_t v8 = 1;
LABEL_23:

  return v8;
}

- (void)setStatus:(unint64_t)a3 forPaymentTransactionWithServiceIdentifier:(id)a4
{
  id v6 = a4;
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__NPKPeerPaymentMessagesTransactionsManager_setStatus_forPaymentTransactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_2644D3288;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(transactionsQueue, block);
}

uint64_t __98__NPKPeerPaymentMessagesTransactionsManager_setStatus_forPaymentTransactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_setStatus:forPaymentTransactionWithServiceIdentifier:notifyUpdate:", *(void *)(a1 + 48), *(void *)(a1 + 40), 1);
}

- (void)_transactionsQueue_setStatus:(unint64_t)a3 forPaymentTransactionWithServiceIdentifier:(id)a4 notifyUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionsQueue);
  dispatch_queue_t v9 = [(NPKPeerPaymentMessagesTransactionsManager *)self _transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:v8];
  id v10 = [v9 transaction];
  unint64_t v11 = v10;
  if (v10
    && (unint64_t v12 = NPKPeerPaymentStatusWithPKPeerPaymentStatus([v10 peerPaymentStatus]), v12 > a3)
    && (v12 > 7 || ((1 << v12) & 0xB0) == 0))
  {
    id v17 = pk_General_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      v19 = pk_General_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v20 = NSStringWithNPKPeerPaymentStatus(a3);
        int v21 = 138412802;
        uint64_t v22 = v20;
        __int16 v23 = 2112;
        id v24 = v8;
        __int16 v25 = 2112;
        __int16 v26 = v11;
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Ignoring new peer payment transaction status %@ for transaction with identifier: %@ transaction: %@", (uint8_t *)&v21, 0x20u);
      }
    }
  }
  else
  {
    v13 = pk_General_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      BOOL v15 = pk_General_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = NSStringWithNPKPeerPaymentStatus(a3);
        int v21 = 138412546;
        uint64_t v22 = v16;
        __int16 v23 = 2112;
        id v24 = v8;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Setting new peer payment transaction status %@ for transaction with identifier: %@", (uint8_t *)&v21, 0x16u);
      }
    }
    [v9 setPaymentStatus:a3];
    if (v5) {
      [(NPKPeerPaymentMessagesTransactionsManager *)self _transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:v8];
    }
  }
}

- (id)peerPaymentTransactionWithServiceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__NPKPeerPaymentMessagesTransactionsManager_peerPaymentTransactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_2644D42D8;
  id v10 = v4;
  unint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(transactionsQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __89__NPKPeerPaymentMessagesTransactionsManager_peerPaymentTransactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) transactionDetails];
  uint64_t v2 = [v6 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 transaction];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)lookupTransactionActionsIfNeededWithServiceIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    transactionsQueue = self->_transactionsQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke;
    v7[3] = &unk_2644D2E08;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(transactionsQueue, v7);
  }
}

void __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) currentLookupIdentifiers];
  if (![v2 containsObject:*(void *)(a1 + 40)])
  {
    unint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_transactionQueue_statusOfPaymentTransactionWithServiceIdentifier:", *(void *)(a1 + 40));
    id v8 = [*(id *)(a1 + 32) transactionDetails];
    dispatch_queue_t v9 = [v8 objectForKey:*(void *)(a1 + 40)];
    BOOL v5 = [v9 availableActionsFetchDate];

    if (v7 <= 3 && v7 != 1)
    {
      if (!v5 || ([v5 timeIntervalSinceNow], fabs(v10) >= 60.0))
      {
        [v2 addObject:*(void *)(a1 + 40)];
        unint64_t v11 = pk_General_log();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

        if (v12)
        {
          v13 = pk_General_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = v14;
            _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Starting looking up actions for transaction with service identifier: %@", buf, 0xCu);
          }
        }
        BOOL v15 = [*(id *)(a1 + 32) _sharedPeerPaymentWebService];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke_108;
        v17[3] = &unk_2644D55F8;
        uint64_t v16 = *(void *)(a1 + 40);
        v17[4] = *(void *)(a1 + 32);
        id v18 = v2;
        id v19 = *(id *)(a1 + 40);
        [v15 peerPaymentStatusWithPaymentIdentifier:v16 completion:v17];
      }
    }
    goto LABEL_14;
  }
  uint64_t v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v6;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: We are currently looking up actions for transaction with service identifier: %@", buf, 0xCu);
    }
LABEL_14:
  }
}

void __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke_2;
  block[3] = &unk_2644D3B90;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  id v15 = v5;
  uint64_t v16 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48) || !*(void *)(a1 + 56))
  {
    uint64_t v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (!v3) {
      return;
    }
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(void **)(a1 + 48);
      int v18 = 138412546;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Warning: Error when looking up actions for transaction with service identifier %@: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    BOOL v4 = objc_msgSend(*(id *)(a1 + 64), "_transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:", *(void *)(a1 + 40));
    unint64_t v7 = [*(id *)(a1 + 56) actions];
    [v4 setAvailableActions:v7];

    uint64_t v8 = [MEMORY[0x263EFF910] date];
    [v4 setAvailableActionsFetchDate:v8];

    uint64_t v9 = [*(id *)(a1 + 56) status];
    id v10 = [*(id *)(a1 + 56) actions];
    uint64_t v11 = NPKPeerPaymentStatusWithPKPeerPaymentStatusAndActions(v9, v10);

    id v12 = pk_General_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      id v14 = pk_General_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        uint64_t v16 = [v4 availableActions];
        id v17 = NSStringWithNPKPeerPaymentStatus(v11);
        int v18 = 138412802;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        uint64_t v21 = v16;
        __int16 v22 = 2112;
        __int16 v23 = v17;
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Finished looking up actions for transaction with service identifier %@: actions %@, status %@", (uint8_t *)&v18, 0x20u);
      }
    }
    objc_msgSend(*(id *)(a1 + 64), "_transactionsQueue_setStatus:forPaymentTransactionWithServiceIdentifier:notifyUpdate:", v11, *(void *)(a1 + 40), 1);
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: TransactionManager: transactionSourceIdentifier:%@ didReceiveTransaction:%@", buf, 0x16u);
    }
  }
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  block[3] = &unk_2644D31B0;
  void block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(transactionsQueue, block);
}

void __95__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F5BF80] sharedInstance];
  BOOL v3 = [*(id *)(a1 + 32) peerPaymentPassUniqueID];
  BOOL v4 = [v2 passWithUniqueID:v3];
  uint64_t v5 = [v4 paymentPass];

  id v6 = [v5 deviceTransactionSourceIdentifiers];
  if ([v6 containsObject:*(void *)(a1 + 40)])
  {
    id v7 = [*(id *)(a1 + 48) serviceIdentifier];
    if (v7)
    {
      uint64_t v8 = pk_General_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        id v10 = pk_General_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412290;
          id v13 = v7;
          _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: TransactionManager: did update transaction detail with service Identifier:%@", (uint8_t *)&v12, 0xCu);
        }
      }
      uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:", v7);
      [v11 setTransaction:*(void *)(a1 + 48)];
      [v11 setPaymentStatus:0];
      objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:", v7);
    }
  }
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __108__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  block[3] = &unk_2644D31B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(transactionsQueue, block);
}

void __108__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F5BF80] sharedInstance];
  BOOL v3 = [*(id *)(a1 + 32) peerPaymentPassUniqueID];
  BOOL v4 = [v2 passWithUniqueID:v3];
  uint64_t v5 = [v4 paymentPass];

  id v6 = [v5 deviceTransactionSourceIdentifiers];
  if ([v6 containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__12;
    __int16 v19 = __Block_byref_object_dispose__12;
    id v20 = 0;
    id v7 = [*(id *)(a1 + 32) transactionDetails];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __108__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2;
    id v12 = &unk_2644D5620;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = &v15;
    [v7 enumerateKeysAndObjectsUsingBlock:&v9];

    if (v16[5])
    {
      uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "transactionDetails", v9, v10, v11, v12);
      [v8 removeObjectForKey:v16[5]];

      objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:", v16[5]);
    }

    _Block_object_dispose(&v15, 8);
  }
}

void __108__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v13 = a3;
  id v6 = [v13 transaction];
  id v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = [v13 transaction];
    uint64_t v10 = [v9 serviceIdentifier];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (id)_transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPKPeerPaymentMessagesTransactionsManager *)self transactionDetails];
  id v6 = [v5 objectForKey:v4];

  if (v4 && !v6)
  {
    id v6 = objc_alloc_init(NPKPeerPaymentTransactionDetails);
    [(NPKPeerPaymentTransactionDetails *)v6 setServiceIdentifier:v4];
    id v7 = [(NPKPeerPaymentMessagesTransactionsManager *)self transactionDetails];
    [v7 setObject:v6 forKey:v4];
  }
  return v6;
}

- (void)_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionsQueue);
  unint64_t v5 = [(NPKPeerPaymentMessagesTransactionsManager *)self _transactionQueue_statusOfPaymentTransactionWithServiceIdentifier:v4];
  id v6 = [(NPKPeerPaymentMessagesTransactionsManager *)self transactionDetails];
  id v7 = [v6 objectForKeyedSubscript:v4];
  uint64_t v8 = [v7 availableActions];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  id v11 = v10;

  id v12 = dispatch_get_global_queue(33, 0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __117__NPKPeerPaymentMessagesTransactionsManager__transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier___block_invoke;
  v15[3] = &unk_2644D38A8;
  id v16 = v11;
  id v17 = v4;
  id v18 = self;
  unint64_t v19 = v5;
  id v13 = v4;
  id v14 = v11;
  dispatch_async(v12, v15);
}

void __117__NPKPeerPaymentMessagesTransactionsManager__transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier___block_invoke(void *a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"kNPKPeerPaymentMessagesTransactionsManagerTransactionStatus";
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:a1[7]];
  v5[1] = @"kNPKPeerPaymentMessagesTransactionsManagerAvailableActions";
  v6[0] = v2;
  v6[1] = a1[4];
  BOOL v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:a1[5] object:a1[6] userInfo:v3];
}

- (void)_fetchAllPeerPaymentTransactionsWithPeerPaymentPassID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Start fetching all peer payment transactions With peer payment pass ID: %@", buf, 0xCu);
    }
  }
  if (v4)
  {
    uint64_t v8 = [MEMORY[0x263F5BF80] sharedInstance];
    uint64_t v9 = [v8 passWithUniqueID:v4];
    uint64_t v10 = [v9 paymentPass];

    if (v10)
    {
      id v11 = [v10 deviceTransactionSourceIdentifiers];
      id v12 = [(NPKPeerPaymentMessagesTransactionsManager *)self paymentService];
      uint64_t v13 = *MEMORY[0x263F5C5A8];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_2;
      v15[3] = &unk_2644D5670;
      id v16 = v4;
      id v17 = self;
      [v12 transactionsForTransactionSourceIdentifiers:v11 withTransactionSource:0 withBackingData:0 limit:v13 completion:v15];
    }
  }
  else
  {
    transactionsQueue = self->_transactionsQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke;
    block[3] = &unk_2644D2910;
    void block[4] = self;
    dispatch_async(transactionsQueue, block);
  }
}

void __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke(uint64_t a1)
{
  uint64_t v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: New peer payment pass identifier is nil. Removing existing transactions.", buf, 2u);
    }
  }
  unint64_t v5 = [*(id *)(a1 + 32) transactionDetails];
  BOOL v6 = [v5 allKeys];

  id v7 = [*(id *)(a1 + 32) transactionDetails];
  [v7 removeAllObjects];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_115;
  v8[3] = &unk_2644D3188;
  v8[4] = *(void *)(a1 + 32);
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_115(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:", a2);
}

void __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v3 count];
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received %ld transactions for peer payment pass with unique ID %@", buf, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(NSObject **)(v9 + 8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_117;
  v12[3] = &unk_2644D2E08;
  id v13 = v3;
  uint64_t v14 = v9;
  id v11 = v3;
  dispatch_async(v10, v12);
}

uint64_t __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_117(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_2_118;
  v3[3] = &unk_2644D5648;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_2_118(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 serviceIdentifier];
  if (v3)
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:", v3);
    [v4 setTransaction:v7];
    if ([v7 peerPaymentStatus]) {
      [v4 setPaymentStatus:0];
    }
    BOOL v5 = *(void **)(a1 + 32);
    BOOL v6 = [v7 serviceIdentifier];
    objc_msgSend(v5, "_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:", v6);
  }
}

- (id)_sharedPeerPaymentWebService
{
  return (id)[MEMORY[0x263F5C178] sharedService];
}

- (PKPaymentService)paymentService
{
  return self->_paymentService;
}

- (NSMutableDictionary)transactionDetails
{
  return self->_transactionDetails;
}

- (NSMutableSet)currentLookupIdentifiers
{
  return self->_currentLookupIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLookupIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionDetails, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_peerPaymentPassUniqueID, 0);
  objc_storeStrong((id *)&self->_peerPaymentPassQueue, 0);
  objc_storeStrong((id *)&self->_transactionsQueue, 0);
}

@end