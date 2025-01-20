@interface SKStatusSubscriptionService
+ (id)logger;
- (BOOL)registeredForDelegateCallbacks;
- (NSMapTable)delegates;
- (NSString)statusTypeIdentifier;
- (OS_dispatch_queue)privateWorkQueue;
- (SKStatusSubscription)personalStatusSubscription;
- (SKStatusSubscriptionDaemonConnection)daemonConnection;
- (SKStatusSubscriptionService)initWithStatusTypeIdentifier:(id)a3;
- (id)_allStatusSubscriptionsIncludingPersonalSubscription:(BOOL)a3;
- (id)allStatusSubscriptions;
- (id)allStatusSubscriptionsExceptPersonalSubscription;
- (id)allStatusSubscriptionsWithActiveAssertions;
- (id)allStatusSubscriptionsWithActiveSubscriptions;
- (id)statusSubscriptionForHandle:(id)a3;
- (id)subscriptionValidationTokenForHandle:(id)a3 error:(id *)a4;
- (id)subscriptionValidationTokensForHandle:(id)a3 error:(id *)a4;
- (void)_delegatesPerformOnResponseQueueForGroup:(id)a3 block:(id)a4;
- (void)_registerForDelegateCallbacksIfNecessary;
- (void)_simulateCrashIfNecessaryForError:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 completion:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)setDaemonConnection:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setPrivateWorkQueue:(id)a3;
- (void)setRegisteredForDelegateCallbacks:(BOOL)a3;
- (void)statusSubscriptionForHandle:(id)a3 completion:(id)a4;
- (void)subscriptionDaemonConnectionDidDisconnect:(id)a3;
- (void)subscriptionInvitationReceived:(id)a3 completion:(id)a4;
- (void)subscriptionReceivedStatusUpdate:(id)a3 completion:(id)a4;
- (void)subscriptionStateChangedForSubscriptions:(id)a3 completion:(id)a4;
- (void)subscriptionValidationTokenForHandle:(id)a3 completion:(id)a4;
- (void)subscriptionValidationTokensForHandle:(id)a3 completion:(id)a4;
- (void)validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:(id)a3 fromSender:(id)a4 completion:(id)a5;
- (void)validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:(id)a3 fromSender:(id)a4 completion:(id)a5;
@end

@implementation SKStatusSubscriptionService

- (SKStatusSubscriptionService)initWithStatusTypeIdentifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKStatusSubscriptionService;
  v5 = [(SKStatusSubscriptionService *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    statusTypeIdentifier = v5->_statusTypeIdentifier;
    v5->_statusTypeIdentifier = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    delegates = v5->_delegates;
    v5->_delegates = (NSMapTable *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.StatusKit.SubscriptionService", v11);
    privateWorkQueue = v5->_privateWorkQueue;
    v5->_privateWorkQueue = (OS_dispatch_queue *)v12;
  }
  return v5;
}

- (id)statusSubscriptionForHandle:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SKStatusSubscriptionService *)self _registerForDelegateCallbacksIfNecessary];
  v5 = [(SKStatusSubscriptionService *)self statusTypeIdentifier];
  uint64_t v6 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Fetching subscription (sync) for handle %@ statusType: %{public}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  v7 = [(SKStatusSubscriptionService *)self daemonConnection];
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke;
  v20[3] = &unk_2644B6838;
  objc_copyWeak(&v21, &location);
  v20[4] = buf;
  uint64_t v8 = [v7 synchronousRemoteDaemonWithErrorHandler:v20];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  objc_super v15 = __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_4;
  v16 = &unk_2644B6860;
  id v9 = v4;
  id v17 = v9;
  objc_copyWeak(&v19, &location);
  v18 = buf;
  [v8 subscriptionMetadataForHandle:v9 statusTypeIdentifier:v5 completion:&v13];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v10 = [SKStatusSubscription alloc];
    v11 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v10, "initWithSubscriptionMetadata:daemonConnection:", *(void *)(*(void *)&buf[8] + 40), v7, v13, v14, v15, v16, v17);
  }
  else
  {
    v11 = 0;
  }
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  return v11;
}

void __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_4_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _simulateCrashIfNecessaryForError:v6];
  }
  else
  {
    id WeakRetained = +[SKStatusSubscriptionService logger];
    BOOL v9 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v14 = 138412546;
        id v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = v10;
        _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Retreived subscription metadata for handle. subscriptionMetadata: %@ handle: %@", (uint8_t *)&v14, 0x16u);
      }

      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = v5;
      id WeakRetained = *(NSObject **)(v11 + 40);
      *(void *)(v11 + 40) = v12;
    }
    else if (v9)
    {
      uint64_t v13 = *(void **)(a1 + 32);
      int v14 = 138412290;
      id v15 = v13;
      _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Did not find subscription metadata for handle. handle: %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)statusSubscriptionForHandle:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SKStatusSubscriptionService *)self _registerForDelegateCallbacksIfNecessary];
  uint64_t v8 = [(SKStatusSubscriptionService *)self statusTypeIdentifier];
  BOOL v9 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "Fetching subscription (async) for handle %@ statusType: %{public}@", buf, 0x16u);
  }

  uint64_t v10 = [(SKStatusSubscriptionService *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __70__SKStatusSubscriptionService_statusSubscriptionForHandle_completion___block_invoke;
  v20[3] = &unk_2644B65F0;
  objc_copyWeak(&v21, (id *)buf);
  uint64_t v11 = [v10 asynchronousRemoteDaemonWithErrorHandler:v20];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__SKStatusSubscriptionService_statusSubscriptionForHandle_completion___block_invoke_7;
  v15[3] = &unk_2644B6888;
  id v12 = v6;
  id v16 = v12;
  objc_copyWeak(&v19, (id *)buf);
  id v13 = v7;
  id v18 = v13;
  id v14 = v10;
  id v17 = v14;
  [v11 subscriptionMetadataForHandle:v12 statusTypeIdentifier:v8 completion:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __70__SKStatusSubscriptionService_statusSubscriptionForHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  id v5 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_cold_1();
  }
}

void __70__SKStatusSubscriptionService_statusSubscriptionForHandle_completion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_4_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _simulateCrashIfNecessaryForError:v6];

    BOOL v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_5:
    v9();
    goto LABEL_10;
  }
  uint64_t v10 = +[SKStatusSubscriptionService logger];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v11)
    {
      id v14 = *(void **)(a1 + 32);
      int v15 = 138412290;
      id v16 = v14;
      _os_log_impl(&dword_21E62A000, v10, OS_LOG_TYPE_DEFAULT, "Did not find subscription metadata for handle. handle: %@", (uint8_t *)&v15, 0xCu);
    }

    BOOL v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_impl(&dword_21E62A000, v10, OS_LOG_TYPE_DEFAULT, "Retreived subscription metadata for handle. subscriptionMetadata: %@ handle: %@", (uint8_t *)&v15, 0x16u);
  }

  id v13 = [[SKStatusSubscription alloc] initWithSubscriptionMetadata:v5 daemonConnection:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_10:
}

- (SKStatusSubscription)personalStatusSubscription
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(SKStatusSubscriptionService *)self _registerForDelegateCallbacksIfNecessary];
  id v3 = [(SKStatusSubscriptionService *)self statusTypeIdentifier];
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_21E62A000, v4, OS_LOG_TYPE_DEFAULT, "Fetching personal subscription (sync) for statusType: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__1;
  __int16 v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  id v5 = [(SKStatusSubscriptionService *)self daemonConnection];
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke;
  v18[3] = &unk_2644B6838;
  objc_copyWeak(&v19, &location);
  v18[4] = &buf;
  id v6 = [v5 synchronousRemoteDaemonWithErrorHandler:v18];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_8;
  id v14 = &unk_2644B68B0;
  objc_copyWeak(&v17, &location);
  p_long long buf = &buf;
  id v7 = v3;
  id v15 = v7;
  [v6 subscriptionMetadataForPersonalSubscriptionWithStatusTypeIdentifier:v7 completion:&v11];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v8 = [SKStatusSubscription alloc];
    BOOL v9 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v8, "initWithSubscriptionMetadata:daemonConnection:", *(void *)(*((void *)&buf + 1) + 40), v5, v11, v12, v13, v14);
  }
  else
  {
    BOOL v9 = 0;
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return v9;
}

void __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_8_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _simulateCrashIfNecessaryForError:v6];
  }
  else
  {
    id WeakRetained = +[SKStatusSubscriptionService logger];
    BOOL v9 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        int v13 = 138412290;
        id v14 = v5;
        _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Retreived personal subscription metadata. subscriptionMetadata: %@", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      id v11 = v5;
      id WeakRetained = *(NSObject **)(v10 + 40);
      *(void *)(v10 + 40) = v11;
    }
    else if (v9)
    {
      uint64_t v12 = *(void **)(a1 + 32);
      int v13 = 138412290;
      id v14 = v12;
      _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Did not find personal subscription metadata for status type: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (id)allStatusSubscriptions
{
  return [(SKStatusSubscriptionService *)self _allStatusSubscriptionsIncludingPersonalSubscription:1];
}

- (id)allStatusSubscriptionsExceptPersonalSubscription
{
  return [(SKStatusSubscriptionService *)self _allStatusSubscriptionsIncludingPersonalSubscription:1];
}

- (id)allStatusSubscriptionsWithActiveAssertions
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  [(SKStatusSubscriptionService *)self _registerForDelegateCallbacksIfNecessary];
  id v3 = [(SKStatusSubscriptionService *)self statusTypeIdentifier];
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_21E62A000, v4, OS_LOG_TYPE_DEFAULT, "Fetching all subscription assertions (sync) for statusType: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  id v5 = [(SKStatusSubscriptionService *)self daemonConnection];
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke;
  v27[3] = &unk_2644B6838;
  id v17 = &v28;
  objc_copyWeak(&v28, &location);
  v27[4] = &buf;
  id v6 = [v5 synchronousRemoteDaemonWithErrorHandler:v27];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9;
  v23[3] = &unk_2644B68D8;
  id v7 = v3;
  id v24 = v7;
  uint64_t v18 = &v26;
  objc_copyWeak(&v26, &location);
  p_long long buf = &buf;
  [v6 allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier:v7 completion:v23];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v14 = [SKStatusSubscription alloc];
        uint64_t v15 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v14, "initWithSubscriptionMetadata:daemonConnection:", v13, v5, v17, v18, (void)v19);
        if (v15) {
          [v8 addObject:v15];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v10);
  }

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9_cold_2();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _simulateCrashIfNecessaryForError:v6];
  }
  else
  {
    id v9 = +[SKStatusSubscriptionService logger];
    id WeakRetained = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v13 = 138412546;
        id v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Retreived subscription assertions metadatas for status type. subscriptionMetadata: %@ statusType: %@", (uint8_t *)&v13, 0x16u);
      }

      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = v5;
      id WeakRetained = *(NSObject **)(v11 + 40);
      *(void *)(v11 + 40) = v12;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9_cold_1();
    }
  }
}

- (id)allStatusSubscriptionsWithActiveSubscriptions
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  [(SKStatusSubscriptionService *)self _registerForDelegateCallbacksIfNecessary];
  id v3 = [(SKStatusSubscriptionService *)self statusTypeIdentifier];
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_21E62A000, v4, OS_LOG_TYPE_DEFAULT, "Fetching all active subscription (sync) for statusType: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  id v5 = [(SKStatusSubscriptionService *)self daemonConnection];
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke;
  v27[3] = &unk_2644B6838;
  uint64_t v17 = &v28;
  objc_copyWeak(&v28, &location);
  v27[4] = &buf;
  id v6 = [v5 synchronousRemoteDaemonWithErrorHandler:v27];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12;
  v23[3] = &unk_2644B68D8;
  id v7 = v3;
  id v24 = v7;
  uint64_t v18 = &v26;
  objc_copyWeak(&v26, &location);
  p_long long buf = &buf;
  [v6 allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier:v7 completion:v23];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v14 = [SKStatusSubscription alloc];
        __int16 v15 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v14, "initWithSubscriptionMetadata:daemonConnection:", v13, v5, v17, v18, (void)v19);
        if (v15) {
          [v8 addObject:v15];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v10);
  }

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12_cold_2();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _simulateCrashIfNecessaryForError:v6];
  }
  else
  {
    id v9 = +[SKStatusSubscriptionService logger];
    id WeakRetained = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v13 = 138412546;
        id v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Retreived active subscription metadatas for status type. subscriptionMetadata: %@ statusType: %@", (uint8_t *)&v13, 0x16u);
      }

      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = v5;
      id WeakRetained = *(NSObject **)(v11 + 40);
      *(void *)(v11 + 40) = v12;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12_cold_1();
    }
  }
}

- (id)_allStatusSubscriptionsIncludingPersonalSubscription:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  [(SKStatusSubscriptionService *)self _registerForDelegateCallbacksIfNecessary];
  id v5 = [(SKStatusSubscriptionService *)self statusTypeIdentifier];
  id v6 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Fetching all subscription (sync) for statusType: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__1;
  uint64_t v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  id v7 = [(SKStatusSubscriptionService *)self daemonConnection];
  objc_initWeak(&location, self);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke;
  v29[3] = &unk_2644B6838;
  long long v19 = &v30;
  objc_copyWeak(&v30, &location);
  v29[4] = &buf;
  id v8 = [v7 synchronousRemoteDaemonWithErrorHandler:v29];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13;
  v25[3] = &unk_2644B68D8;
  id v9 = v5;
  id v26 = v9;
  long long v20 = &v28;
  objc_copyWeak(&v28, &location);
  p_long long buf = &buf;
  [v8 allSubscriptionMetadatasForStatusTypeIdentifier:v9 includingPersonalSubscription:v3 completion:v25];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v16 = [SKStatusSubscription alloc];
        uint64_t v17 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v16, "initWithSubscriptionMetadata:daemonConnection:", v15, v7, v19, v20, (void)v21);
        if (v17) {
          [v10 addObject:v17];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v32 count:16];
    }
    while (v12);
  }

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return v10;
}

void __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13_cold_2();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _simulateCrashIfNecessaryForError:v6];
  }
  else
  {
    id v9 = +[SKStatusSubscriptionService logger];
    id WeakRetained = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v13 = 138412546;
        id v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Retreived subscription metadatas for status type. subscriptionMetadata: %@ statusType: %@", (uint8_t *)&v13, 0x16u);
      }

      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = v5;
      id WeakRetained = *(NSObject **)(v11 + 40);
      *(void *)(v11 + 40) = v12;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13_cold_1();
    }
  }
}

- (void)allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SKStatusSubscriptionService *)self _registerForDelegateCallbacksIfNecessary];
  id v8 = [(SKStatusSubscriptionService *)self statusTypeIdentifier];
  id v9 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "Fetching all subscription with persistent assertion for statusType: %{public}@ application identifer: %@", buf, 0x16u);
  }

  uint64_t v10 = [(SKStatusSubscriptionService *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke;
  v21[3] = &unk_2644B65C8;
  objc_copyWeak(&v23, (id *)buf);
  id v11 = v7;
  id v22 = v11;
  id v12 = [v10 asynchronousRemoteDaemonWithErrorHandler:v21];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_14;
  v16[3] = &unk_2644B6900;
  id v13 = v8;
  id v17 = v13;
  objc_copyWeak(&v20, (id *)buf);
  id v14 = v11;
  id v19 = v14;
  id v15 = v10;
  id v18 = v15;
  [v12 allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier:v6 statusTypeIdentifier:v13 completion:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

void __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[SKStatusSubscriptionService logger];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13_cold_2();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _simulateCrashIfNecessaryForError:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v5 count];
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 134218498;
      uint64_t v27 = v10;
      __int16 v28 = 2112;
      id v29 = v5;
      __int16 v30 = 2112;
      uint64_t v31 = v11;
      _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Retreived %ld subscription metadatas for status type. subscriptionMetadata: %@ statusType: %@", buf, 0x20u);
    }

    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v5;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * v17);
          id v19 = [SKStatusSubscription alloc];
          id v20 = -[SKStatusSubscription initWithSubscriptionMetadata:daemonConnection:](v19, "initWithSubscriptionMetadata:daemonConnection:", v18, *(void *)(a1 + 40), (void)v21);
          if (v20) {
            [v12 addObject:v20];
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)subscriptionValidationTokensForHandle:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(SKStatusSubscriptionService *)self _registerForDelegateCallbacksIfNecessary];
  id v7 = [(SKStatusSubscriptionService *)self statusTypeIdentifier];
  id v8 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 handleString];
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Fetching channel validation token (sync) for statusType: %{public}@ handle: %@", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v29 = __Block_byref_object_copy__1;
  __int16 v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__1;
  __int16 v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  uint64_t v10 = [(SKStatusSubscriptionService *)self daemonConnection];
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke;
  v19[3] = &unk_2644B6928;
  objc_copyWeak(&v20, &location);
  v19[4] = buf;
  v19[5] = &v22;
  uint64_t v11 = [v10 synchronousRemoteDaemonWithErrorHandler:v19];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15;
  v15[3] = &unk_2644B6950;
  objc_copyWeak(&v18, &location);
  id v12 = v6;
  id v16 = v12;
  uint64_t v17 = buf;
  [v11 subscriptionValidationTokensForHandle:v12 statusTypeIdentifier:v7 completion:v15];
  if (a4) {
    *a4 = (id) v23[5];
  }
  id v13 = *(id *)(*(void *)&buf[8] + 40);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

  return v13;
}

void __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15_cold_2();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _simulateCrashIfNecessaryForError:v6];
  }
  else
  {
    id v9 = +[SKStatusSubscriptionService logger];
    id WeakRetained = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 32) handleString];
        int v13 = 138412546;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Subscription validation (sync) token for handle: %@ is \"%@\"", (uint8_t *)&v13, 0x16u);
      }
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = v5;
      id WeakRetained = *(NSObject **)(v11 + 40);
      *(void *)(v11 + 40) = v12;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15_cold_1(WeakRetained);
    }
  }
}

- (void)subscriptionValidationTokensForHandle:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SKStatusSubscriptionService *)self _registerForDelegateCallbacksIfNecessary];
  uint64_t v8 = [(SKStatusSubscriptionService *)self statusTypeIdentifier];
  id v9 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v6 handleString];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    __int16 v26 = v10;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "Fetching channel validation token (async) for statusType: %{public}@ handle: %@", buf, 0x16u);
  }
  uint64_t v11 = [(SKStatusSubscriptionService *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke;
  v20[3] = &unk_2644B65C8;
  objc_copyWeak(&v22, (id *)buf);
  id v12 = v7;
  id v21 = v12;
  int v13 = [v11 asynchronousRemoteDaemonWithErrorHandler:v20];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17;
  v16[3] = &unk_2644B6978;
  objc_copyWeak(&v19, (id *)buf);
  id v14 = v12;
  id v18 = v14;
  id v15 = v6;
  id v17 = v15;
  [v13 subscriptionValidationTokensForHandle:v15 statusTypeIdentifier:v8 completion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

void __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17_cold_2();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _simulateCrashIfNecessaryForError:v6];

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v10 = +[SKStatusSubscriptionService logger];
    uint64_t v11 = v10;
    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [*(id *)(a1 + 32) handleString];
        int v13 = 138412546;
        id v14 = v12;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_21E62A000, v11, OS_LOG_TYPE_DEFAULT, "Subscription validation token (async) for handle: %@ is \"%@\"", (uint8_t *)&v13, 0x16u);
      }
      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17_cold_1(v11);
      }

      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
  }
  v9();
}

- (void)validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:(id)a3 fromSender:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(SKStatusSubscriptionService *)self _registerForDelegateCallbacksIfNecessary];
  uint64_t v11 = [(SKStatusSubscriptionService *)self statusTypeIdentifier];
  id v12 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [v9 handleString];
    *(_DWORD *)long long buf = 138412802;
    id v29 = v8;
    __int16 v30 = 2114;
    id v31 = v11;
    __int16 v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_21E62A000, v12, OS_LOG_TYPE_DEFAULT, "Validating subscription validation token \"%@\" for statusType: %{public}@ fromHandle: %@", buf, 0x20u);
  }
  id v14 = [(SKStatusSubscriptionService *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke;
  v25[3] = &unk_2644B65C8;
  objc_copyWeak(&v27, (id *)buf);
  id v15 = v10;
  id v26 = v15;
  id v16 = [v14 asynchronousRemoteDaemonWithErrorHandler:v25];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18;
  v20[3] = &unk_2644B69A0;
  objc_copyWeak(&v24, (id *)buf);
  id v17 = v8;
  id v21 = v17;
  id v18 = v9;
  id v22 = v18;
  id v19 = v15;
  id v23 = v19;
  [v16 validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:v17 fromSender:v18 statusTypeIdentifier:v11 completion:v20];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_3();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _simulateCrashIfNecessaryForError:v5];
  }
  else if (a2 == 2)
  {
    id WeakRetained = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_2(a1);
    }
  }
  else if (a2 == 1)
  {
    id WeakRetained = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [*(id *)(a1 + 40) handleString];
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Subscription validation token \"%@\" from %@ is valid", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (a2) {
      goto LABEL_6;
    }
    id WeakRetained = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_1(a1);
    }
  }

LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = self->_delegates;
  objc_sync_enter(v7);
  uint64_t v8 = [[SKDelegateResponseQueue alloc] initWithQueue:v6];
  [(NSMapTable *)self->_delegates setObject:v8 forKey:v9];

  objc_sync_exit(v7);
  [(SKStatusSubscriptionService *)self _registerForDelegateCallbacksIfNecessary];
}

- (void)removeDelegate:(id)a3
{
  id v5 = a3;
  id v4 = self->_delegates;
  objc_sync_enter(v4);
  [(NSMapTable *)self->_delegates removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (void)_registerForDelegateCallbacksIfNecessary
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  obj = self->_delegates;
  objc_sync_enter(obj);
  if (self->_registeredForDelegateCallbacks || ![(NSMapTable *)self->_delegates count])
  {
    objc_sync_exit(obj);
  }
  else
  {
    self->_registeredForDelegateCallbacks = 1;
    objc_sync_exit(obj);

    id v3 = [(SKStatusSubscriptionService *)self statusTypeIdentifier];
    id v4 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v15 = v3;
      _os_log_impl(&dword_21E62A000, v4, OS_LOG_TYPE_DEFAULT, "Registering for delegate callbacks for statusTypeIdentifier: %{public}@", buf, 0xCu);
    }

    id v5 = [(SKStatusSubscriptionService *)self daemonConnection];
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__SKStatusSubscriptionService__registerForDelegateCallbacksIfNecessary__block_invoke;
    v12[3] = &unk_2644B65F0;
    objc_copyWeak(&v13, (id *)buf);
    id v6 = [v5 asynchronousRemoteDaemonWithErrorHandler:v12];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71__SKStatusSubscriptionService__registerForDelegateCallbacksIfNecessary__block_invoke_21;
    v9[3] = &unk_2644B6618;
    objc_copyWeak(&v11, (id *)buf);
    id v7 = v3;
    id v10 = v7;
    [v6 registerForDelegateCallbacksWithStatusTypeIdentifier:v7 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __71__SKStatusSubscriptionService__registerForDelegateCallbacksIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];
}

void __71__SKStatusSubscriptionService__registerForDelegateCallbacksIfNecessary__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKStatusSubscriptionService logger];
  id WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_20_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _simulateCrashIfNecessaryForError:v3];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Completed registration for delegate callbacks for statusTypeIdentifier: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)subscriptionDaemonConnectionDidDisconnect:(id)a3
{
  id v4 = self->_delegates;
  objc_sync_enter(v4);
  self->_registeredForDelegateCallbacks = 0;
  objc_sync_exit(v4);

  dispatch_group_t v5 = dispatch_group_create();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__SKStatusSubscriptionService_subscriptionDaemonConnectionDidDisconnect___block_invoke;
  v6[3] = &unk_2644B69C8;
  v6[4] = self;
  [(SKStatusSubscriptionService *)self _delegatesPerformOnResponseQueueForGroup:v5 block:v6];
}

void __73__SKStatusSubscriptionService_subscriptionDaemonConnectionDidDisconnect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = objc_opt_respondsToSelector();
  dispatch_group_t v5 = +[SKStatusSubscriptionService logger];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Notifying subscription service delegate that the XPC connection has disconnected", buf, 2u);
    }

    [v3 subscriptionServiceDaemonDisconnected:*(void *)(a1 + 32)];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Subscription service delegate does not implement the delegate method to be notified the XPC connection has disconnected", v7, 2u);
    }
  }
}

- (void)subscriptionStateChangedForSubscriptions:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v17 = a4;
  int v7 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v29 = v6;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "Subscription state changed: %@", buf, 0xCu);
  }

  uint64_t v8 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = [[SKStatusSubscription alloc] initWithSubscriptionMetadata:*(void *)(*((void *)&v23 + 1) + 8 * v12) daemonConnection:self->_daemonConnection];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke;
        v21[3] = &unk_2644B69C8;
        id v22 = v13;
        uint64_t v14 = v13;
        [(SKStatusSubscriptionService *)self _delegatesPerformOnResponseQueueForGroup:v8 block:v21];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  privateWorkQueue = self->_privateWorkQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke_27;
  block[3] = &unk_2644B67B8;
  id v20 = v17;
  id v16 = v17;
  dispatch_group_notify(v8, privateWorkQueue, block);
}

void __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = objc_opt_respondsToSelector();
  dispatch_group_t v5 = +[SKStatusSubscriptionService logger];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate of state change. Delegate: %@", (uint8_t *)&v7, 0xCu);
    }

    [v3 subscriptionStateChanged:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke_cold_1();
    }
  }
}

uint64_t __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscriptionReceivedStatusUpdate:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Subscription received a status update: %@", buf, 0xCu);
  }

  uint64_t v9 = dispatch_group_create();
  uint64_t v10 = [[SKStatusSubscription alloc] initWithSubscriptionMetadata:v6 daemonConnection:self->_daemonConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke;
  v16[3] = &unk_2644B69C8;
  id v17 = v10;
  uint64_t v11 = v10;
  [(SKStatusSubscriptionService *)self _delegatesPerformOnResponseQueueForGroup:v9 block:v16];
  privateWorkQueue = self->_privateWorkQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke_31;
  v14[3] = &unk_2644B67B8;
  id v15 = v7;
  id v13 = v7;
  dispatch_group_notify(v9, privateWorkQueue, v14);
}

void __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = objc_opt_respondsToSelector();
  dispatch_group_t v5 = +[SKStatusSubscriptionService logger];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate of status update. Delegate: %@", (uint8_t *)&v7, 0xCu);
    }

    [v3 subscriptionReceivedStatusUpdate:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke_cold_1();
    }
  }
}

uint64_t __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscriptionInvitationReceived:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SKStatusSubscriptionService logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Invitation received for subscription: %@", buf, 0xCu);
  }

  uint64_t v9 = dispatch_group_create();
  uint64_t v10 = [[SKStatusSubscription alloc] initWithSubscriptionMetadata:v6 daemonConnection:self->_daemonConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke;
  v16[3] = &unk_2644B69C8;
  id v17 = v10;
  uint64_t v11 = v10;
  [(SKStatusSubscriptionService *)self _delegatesPerformOnResponseQueueForGroup:v9 block:v16];
  privateWorkQueue = self->_privateWorkQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke_34;
  v14[3] = &unk_2644B67B8;
  id v15 = v7;
  id v13 = v7;
  dispatch_group_notify(v9, privateWorkQueue, v14);
}

void __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = objc_opt_respondsToSelector();
  dispatch_group_t v5 = +[SKStatusSubscriptionService logger];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate of invitation received. Delegate: %@", (uint8_t *)&v7, 0xCu);
    }

    [v3 subscriptionInvitationReceived:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke_cold_1();
    }
  }
}

uint64_t __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_delegatesPerformOnResponseQueueForGroup:(id)a3 block:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_delegates;
  objc_sync_enter(v8);
  uint64_t v9 = (void *)[(NSMapTable *)self->_delegates copy];
  objc_sync_exit(v8);

  if (![v9 count])
  {
    uint64_t v10 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E62A000, v10, OS_LOG_TYPE_DEFAULT, "No delegates available to perform subscription service delegate callback", buf, 2u);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v9 keyEnumerator];
  uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [v9 objectForKey:v14];
        id v16 = [v15 dispatchQueue];
        dispatch_group_enter(v6);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __78__SKStatusSubscriptionService__delegatesPerformOnResponseQueueForGroup_block___block_invoke;
        block[3] = &unk_2644B6640;
        id v20 = v7;
        void block[4] = v14;
        id v19 = v6;
        dispatch_async(v16, block);
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }
}

void __78__SKStatusSubscriptionService__delegatesPerformOnResponseQueueForGroup_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

- (void)_simulateCrashIfNecessaryForError:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:@"SKStatusSubscriptionErrorDomain"];

  if (v6 && [v4 code] == -2000)
  {
    id v7 = +[SKStatusSubscriptionService logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SKStatusSubscriptionService _simulateCrashIfNecessaryForError:](self, v7);
    }
  }
}

+ (id)logger
{
  if (logger_onceToken_8 != -1) {
    dispatch_once(&logger_onceToken_8, &__block_literal_global_9);
  }
  v2 = (void *)logger__logger_8;
  return v2;
}

uint64_t __37__SKStatusSubscriptionService_logger__block_invoke()
{
  logger__logger_8 = (uint64_t)os_log_create("com.apple.StatusKit", "SubscriptionService");
  return MEMORY[0x270F9A758]();
}

- (SKStatusSubscriptionDaemonConnection)daemonConnection
{
  v2 = self;
  objc_sync_enter(v2);
  daemonConnection = v2->_daemonConnection;
  if (!daemonConnection)
  {
    id v4 = [[SKStatusSubscriptionDaemonConnection alloc] initWithSubscriptionDaemonDelegate:v2 connectionDelegate:v2];
    dispatch_group_t v5 = v2->_daemonConnection;
    v2->_daemonConnection = v4;

    daemonConnection = v2->_daemonConnection;
  }
  int v6 = daemonConnection;
  objc_sync_exit(v2);

  return v6;
}

- (void)setDaemonConnection:(id)a3
{
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSMapTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (BOOL)registeredForDelegateCallbacks
{
  return self->_registeredForDelegateCallbacks;
}

- (void)setRegisteredForDelegateCallbacks:(BOOL)a3
{
  self->_registeredForDelegateCallbacks = a3;
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

- (id)subscriptionValidationTokenForHandle:(id)a3 error:(id *)a4
{
  id v4 = [(SKStatusSubscriptionService *)self subscriptionValidationTokensForHandle:a3 error:a4];
  dispatch_group_t v5 = [v4 subscriptionValidationToken];

  return v5;
}

- (void)subscriptionValidationTokenForHandle:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__SKStatusSubscriptionService_Deprecated__subscriptionValidationTokenForHandle_completion___block_invoke;
  v8[3] = &unk_2644B69F0;
  id v9 = v6;
  id v7 = v6;
  [(SKStatusSubscriptionService *)self subscriptionValidationTokensForHandle:a3 completion:v8];
}

void __91__SKStatusSubscriptionService_Deprecated__subscriptionValidationTokenForHandle_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 subscriptionValidationToken];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:(id)a3 fromSender:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[SKSubscriptionValidationTokens alloc] initWithSubscriptionValidationToken:v10 encryptionValidationToken:0];

  [(SKStatusSubscriptionService *)self validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:v11 fromSender:v9 completion:v8];
}

void __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error retrieving subscription. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __59__SKStatusSubscriptionService_statusSubscriptionForHandle___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_21E62A000, v0, v1, "Error retrieving subscription for handle. Error: %@ handle: %@");
}

void __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error retrieving personal subscription. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __57__SKStatusSubscriptionService_personalStatusSubscription__block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Error retrieving personal subscription. Error: %@", v2, v3, v4, v5, v6);
}

void __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error retrieving all subscription assertions. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Did not find subscription assertions for status type: %@", v2, v3, v4, v5, 2u);
}

void __73__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveAssertions__block_invoke_9_cold_2()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_21E62A000, v0, v1, "Error retrieving all subscription assertions for status type: %@. Error: %@");
}

void __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error retrieving all active subscriptions. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Did not find active subscriptions for status type: %@", v2, v3, v4, v5, 2u);
}

void __76__SKStatusSubscriptionService_allStatusSubscriptionsWithActiveSubscriptions__block_invoke_12_cold_2()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_21E62A000, v0, v1, "Error retrieving all active subscription for status type: %@. Error: %@");
}

void __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error retrieving all subscriptions. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Did not find subscriptions for status type: %@", v2, v3, v4, v5, 2u);
}

void __84__SKStatusSubscriptionService__allStatusSubscriptionsIncludingPersonalSubscription___block_invoke_13_cold_2()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_21E62A000, v0, v1, "Error retrieving all subscription for status type: %@. Error: %@");
}

void __124__SKStatusSubscriptionService_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error retrieving all subscriptions with persistent assertion. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error fetching channel validation token (sync). Error: %{public}@", v2, v3, v4, v5, v6);
}

void __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_21E62A000, log, OS_LOG_TYPE_FAULT, "Daemon returned neither a subscription validation token nor an error (sync), this should not happen, daemon should return empty string to indicate a value is not found.", v1, 2u);
}

void __75__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_error___block_invoke_15_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Error fetching channel validation token (sync). Error: %@", v2, v3, v4, v5, v6);
}

void __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error fetching channel validation token (async). Error: %{public}@", v2, v3, v4, v5, v6);
}

void __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_21E62A000, log, OS_LOG_TYPE_FAULT, "Daemon returned neither a subscription validation token nor an error (async), this should not happen, daemon should return empty string to indicate a value is not found.", v1, 2u);
}

void __80__SKStatusSubscriptionService_subscriptionValidationTokensForHandle_completion___block_invoke_17_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Error fetching channel validation token (async). Error: %@", v2, v3, v4, v5, v6);
}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error validating validation token (async). Error: %{public}@", v2, v3, v4, v5, v6);
}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) handleString];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_0(&dword_21E62A000, v2, v3, "Subscription validation token \"%@\" from %@ has an UNKNOWN VALIDITY (!?), with no error. This is likely a bug in StatusKit.", v4, v5, v6, v7, v8);
}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) handleString];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_0(&dword_21E62A000, v2, v3, "Subscription validation token \"%@\" from %@ is NOT VALID. Client should re-invite this handle if appropriate.", v4, v5, v6, v7, v8);
}

void __123__SKStatusSubscriptionService_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_completion___block_invoke_18_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Error validating subscription validation token (async). Error: %@", v2, v3, v4, v5, v6);
}

void __83__SKStatusSubscriptionService_subscriptionStateChangedForSubscriptions_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Delegate does not implement subscriptionStateChanged:, not informing delegate: %@", v2, v3, v4, v5, v6);
}

void __75__SKStatusSubscriptionService_subscriptionReceivedStatusUpdate_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Delegate does not implement subscriptionReceivedStatusUpdate:, not informing delegate: %@", v2, v3, v4, v5, v6);
}

void __73__SKStatusSubscriptionService_subscriptionInvitationReceived_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Delegate does not implement subscriptionInvitationReceived:, not informing delegate: %@", v2, v3, v4, v5, v6);
}

- (void)_simulateCrashIfNecessaryForError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 statusTypeIdentifier];
  OUTLINED_FUNCTION_5();
  __int16 v5 = 2114;
  uint8_t v6 = @"com.apple.StatusKit.subscribe.types";
  _os_log_fault_impl(&dword_21E62A000, a2, OS_LOG_TYPE_FAULT, "Client is attempting to access StatusKit subscription information of type %{public}@ but is not entitled. Client needs %{public}@ entitlement with this status type identifier.", v4, 0x16u);
}

@end