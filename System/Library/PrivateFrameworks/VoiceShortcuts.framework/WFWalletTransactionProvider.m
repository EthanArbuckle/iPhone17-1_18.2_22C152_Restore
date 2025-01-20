@interface WFWalletTransactionProvider
+ (id)sharedProvider;
- (BOOL)transactionIsValid:(id)a3;
- (NPKCompanionAgentConnection)remotePaymentServiceConnection;
- (NSMutableDictionary)requests;
- (NSMutableDictionary)timers;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)transaction;
- (PKPaymentService)paymentService;
- (WFWalletTransactionProvider)init;
- (void)fetchLocalTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)fetchRemoteTransactionWithIdentifier:(id)a3 passUniqueID:(id)a4 completion:(id)a5;
- (void)observeForUpdatesWithInitialTransactionIfNeeded:(id)a3 transactionIdentifier:(id)a4 completion:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithCredentials:(id)a4 completion:(id)a5;
- (void)queue_endTransactionIfNeeded;
- (void)queue_finishWithPaymentTransaction:(id)a3;
- (void)queue_takeTransactionIfNeeded;
- (void)setPaymentService:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemotePaymentServiceConnection:(id)a3;
- (void)setRequests:(id)a3;
- (void)setTimers:(id)a3;
- (void)setTransaction:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
@end

@implementation WFWalletTransactionProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remotePaymentServiceConnection, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTimers:(id)a3
{
}

- (NSMutableDictionary)timers
{
  return self->_timers;
}

- (void)setRequests:(id)a3
{
}

- (NSMutableDictionary)requests
{
  return self->_requests;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setRemotePaymentServiceConnection:(id)a3
{
}

- (void)setPaymentService:(id)a3
{
}

- (BOOL)transactionIsValid:(id)a3
{
  id v3 = a3;
  v4 = [v3 merchant];
  v5 = [v4 displayName];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [v3 merchantProvidedTitle];
    BOOL v6 = [v7 length] != 0;
  }
  return v6;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithCredentials:(id)a4 completion:(id)a5
{
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(WFWalletTransactionProvider *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__WFWalletTransactionProvider_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v8[3] = &unk_1E6541F68;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __81__WFWalletTransactionProvider_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) requests];
  id v3 = [*(id *)(a1 + 40) identifier];
  v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    int v5 = [*(id *)(a1 + 32) transactionIsValid:*(void *)(a1 + 40)];
    BOOL v6 = getWFTriggersLogObject();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        int v9 = 136315394;
        v10 = "-[WFWalletTransactionProvider transactionSourceIdentifier:didReceiveTransaction:]_block_invoke";
        __int16 v11 = 2112;
        uint64_t v12 = v8;
        _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Found valid payment transaction (%@) finishing.", (uint8_t *)&v9, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "queue_finishWithPaymentTransaction:", *(void *)(a1 + 40));
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        v10 = "-[WFWalletTransactionProvider transactionSourceIdentifier:didReceiveTransaction:]_block_invoke";
        _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_ERROR, "%s Found valid transaction but it was incomplete, waiting.", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)queue_finishWithPaymentTransaction:(id)a3
{
  id v4 = a3;
  int v5 = [(WFWalletTransactionProvider *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(WFWalletTransactionProvider *)self timers];
  id v7 = [v4 identifier];
  id v15 = [v6 objectForKey:v7];

  [v15 cancel];
  uint64_t v8 = [(WFWalletTransactionProvider *)self timers];
  int v9 = [v4 identifier];
  [v8 removeObjectForKey:v9];

  v10 = [(WFWalletTransactionProvider *)self requests];
  __int16 v11 = [v4 identifier];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];

  uint64_t v13 = [(WFWalletTransactionProvider *)self requests];
  v14 = [v4 identifier];
  [v13 removeObjectForKey:v14];

  ((void (**)(void, id, void))v12)[2](v12, v4, 0);
  [(WFWalletTransactionProvider *)self queue_endTransactionIfNeeded];
}

- (void)queue_endTransactionIfNeeded
{
  id v3 = [(WFWalletTransactionProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(WFWalletTransactionProvider *)self transaction];
  if (v4)
  {
    int v5 = (void *)v4;
    BOOL v6 = [(WFWalletTransactionProvider *)self requests];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      uint64_t v8 = [(WFWalletTransactionProvider *)self transaction];
    }
  }
}

- (void)queue_takeTransactionIfNeeded
{
  id v3 = [(WFWalletTransactionProvider *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(WFWalletTransactionProvider *)self transaction];

  if (!v4)
  {
    id v5 = (id)os_transaction_create();
    [(WFWalletTransactionProvider *)self setTransaction:v5];
  }
}

- (void)observeForUpdatesWithInitialTransactionIfNeeded:(id)a3 transactionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(WFWalletTransactionProvider *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__WFWalletTransactionProvider_observeForUpdatesWithInitialTransactionIfNeeded_transactionIdentifier_completion___block_invoke;
  v15[3] = &unk_1E6541538;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __112__WFWalletTransactionProvider_observeForUpdatesWithInitialTransactionIfNeeded_transactionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) transactionIsValid:*(void *)(a1 + 40)])
  {
    v2 = getWFTriggersLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFWalletTransactionProvider observeForUpdatesWithInitialTransactionIfNeeded:transactionIdentifier:completi"
            "on:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v3;
      _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEFAULT, "%s Found valid payment transaction (%@) returning", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "queue_endTransactionIfNeeded");
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 56) copy];
    id v5 = _Block_copy(v4);
    BOOL v6 = [*(id *)(a1 + 32) requests];
    [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 48)];

    id v7 = objc_alloc(MEMORY[0x1E4F30840]);
    id v8 = [*(id *)(a1 + 32) queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __112__WFWalletTransactionProvider_observeForUpdatesWithInitialTransactionIfNeeded_transactionIdentifier_completion___block_invoke_216;
    v15[3] = &unk_1E65420A0;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    __int16 v11 = *(void **)(a1 + 40);
    id v16 = v9;
    uint64_t v17 = v10;
    id v18 = v11;
    id v12 = (void *)[v7 initWithTimeoutInterval:v8 onQueue:v15 timeoutHandler:60.0];

    [v12 start];
    id v13 = [*(id *)(a1 + 32) timers];
    [v13 setObject:v12 forKey:*(void *)(a1 + 48)];

    id v14 = getWFTriggersLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WFWalletTransactionProvider observeForUpdatesWithInitialTransactionIfNeeded:transactionIdentifier:completi"
            "on:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEFAULT, "%s Did not find valid payment transaction waiting...", buf, 0xCu);
    }
  }
}

uint64_t __112__WFWalletTransactionProvider_observeForUpdatesWithInitialTransactionIfNeeded_transactionIdentifier_completion___block_invoke_216(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    BOOL v6 = "-[WFWalletTransactionProvider observeForUpdatesWithInitialTransactionIfNeeded:transactionIdentifier:completion:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_ERROR, "%s Hit timeout waiting for transaction with identifier: %@, finishing.", (uint8_t *)&v5, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "queue_finishWithPaymentTransaction:", *(void *)(a1 + 48));
}

- (void)fetchRemoteTransactionWithIdentifier:(id)a3 passUniqueID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(WFWalletTransactionProvider *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke;
  v15[3] = &unk_1E6541538;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_takeTransactionIfNeeded");
  v2 = [*(id *)(a1 + 32) remotePaymentServiceConnection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_2;
  v4[3] = &unk_1E65400F8;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v2 paymentPassWithUniqueID:v5 synchronous:0 reply:v4];
}

void __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = [a1[4] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_3;
    block[3] = &unk_1E6541F40;
    id v5 = a1[5];
    id v6 = a1[4];
    id v17 = v5;
    id v18 = v6;
    id v19 = a1[7];
    dispatch_async(v4, block);
  }
  id v7 = [v3 deviceTransactionSourceIdentifiers];
  id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1800.0];
  objc_initWeak(&location, a1[4]);
  id v9 = [a1[4] remotePaymentServiceConnection];
  id v10 = [MEMORY[0x1E4F1C9C8] now];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_210;
  v11[3] = &unk_1E65400D0;
  objc_copyWeak(&v14, &location);
  id v12 = a1[6];
  id v13 = a1[7];
  [v9 transactionsForTransactionSourceIdentifiers:v7 withTransactionSource:0 withBackingData:0 startDate:v8 endDate:v10 orderedByDate:1 limit:10 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = getWFTriggersLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[WFWalletTransactionProvider fetchRemoteTransactionWithIdentifier:passUniqueID:completion:]_block_invoke_3";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_ERROR, "%s Failed to get pass with id: %@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue_endTransactionIfNeeded");
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_210(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [v4 allObjects];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_2_211;
  v8[3] = &unk_1E65400A8;
  id v9 = *(id *)(a1 + 32);
  __int16 v7 = objc_msgSend(v6, "if_firstObjectPassingTest:", v8);

  [WeakRetained observeForUpdatesWithInitialTransactionIfNeeded:v7 transactionIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

uint64_t __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_2_211(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  id v4 = v2;
  id v5 = v3;
  id v6 = v5;
  if (v4 == v5)
  {
    uint64_t v8 = 1;
  }
  else
  {
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [v4 isEqualToString:v5];
    }
  }

  return v8;
}

- (void)fetchLocalTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFWalletTransactionProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WFWalletTransactionProvider_fetchLocalTransactionWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E6541F40;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __78__WFWalletTransactionProvider_fetchLocalTransactionWithIdentifier_completion___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "queue_takeTransactionIfNeeded");
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] paymentService];
  id v3 = a1[5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__WFWalletTransactionProvider_fetchLocalTransactionWithIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E6540080;
  objc_copyWeak(&v7, &location);
  id v5 = a1[5];
  id v6 = a1[6];
  [v2 transactionWithTransactionIdentifier:v3 completion:v4];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __78__WFWalletTransactionProvider_fetchLocalTransactionWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained observeForUpdatesWithInitialTransactionIfNeeded:v4 transactionIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (NPKCompanionAgentConnection)remotePaymentServiceConnection
{
  remotePaymentServiceConnection = self->_remotePaymentServiceConnection;
  if (!remotePaymentServiceConnection)
  {
    uint64_t v10 = 0;
    __int16 v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getNPKCompanionAgentConnectionClass_softClass;
    uint64_t v13 = getNPKCompanionAgentConnectionClass_softClass;
    if (!getNPKCompanionAgentConnectionClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getNPKCompanionAgentConnectionClass_block_invoke;
      v9[3] = &unk_1E6541E40;
      v9[4] = &v10;
      __getNPKCompanionAgentConnectionClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (NPKCompanionAgentConnection *)objc_alloc_init(v5);
    id v7 = self->_remotePaymentServiceConnection;
    self->_remotePaymentServiceConnection = v6;

    [(NPKCompanionAgentConnection *)self->_remotePaymentServiceConnection setDelegate:self];
    remotePaymentServiceConnection = self->_remotePaymentServiceConnection;
  }
  return remotePaymentServiceConnection;
}

- (PKPaymentService)paymentService
{
  paymentService = self->_paymentService;
  if (!paymentService)
  {
    uint64_t v10 = 0;
    __int16 v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getPKPaymentServiceClass_softClass;
    uint64_t v13 = getPKPaymentServiceClass_softClass;
    if (!getPKPaymentServiceClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getPKPaymentServiceClass_block_invoke;
      v9[3] = &unk_1E6541E40;
      v9[4] = &v10;
      __getPKPaymentServiceClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (PKPaymentService *)[[v5 alloc] initWithDelegate:self];
    id v7 = self->_paymentService;
    self->_paymentService = v6;

    paymentService = self->_paymentService;
  }
  return paymentService;
}

- (WFWalletTransactionProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)WFWalletTransactionProvider;
  v2 = [(WFWalletTransactionProvider *)&v13 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.shortcuts.queue.WFWalletTransactionProvider", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    timers = v2->_timers;
    v2->_timers = (NSMutableDictionary *)v9;

    __int16 v11 = v2;
  }

  return v2;
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_172);
  }
  v2 = (void *)sharedProvider_provider;
  return v2;
}

uint64_t __45__WFWalletTransactionProvider_sharedProvider__block_invoke()
{
  sharedProvider_provider = objc_alloc_init(WFWalletTransactionProvider);
  return MEMORY[0x1F41817F8]();
}

@end