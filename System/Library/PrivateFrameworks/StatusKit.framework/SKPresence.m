@interface SKPresence
+ (id)_logger;
+ (id)_oversizeLogger;
- (BOOL)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4;
- (BOOL)hasAssertion;
- (BOOL)hasPresenceAssertion;
- (BOOL)hasTransientSubscription;
- (BOOL)isHandleInvitedFromPrimaryAccountHandle:(id)a3;
- (BOOL)isPersonal;
- (BOOL)registeredForDelegateCallbacks;
- (NSArray)invitedHandles;
- (NSArray)presentDevices;
- (NSMapTable)delegates;
- (NSString)presenceIdentifier;
- (OS_dispatch_queue)privateWorkQueue;
- (SKPresence)initWithPresenceIdentifier:(id)a3;
- (SKPresence)initWithPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4;
- (SKPresence)initWithPresenceIdentifier:(id)a3 options:(id)a4;
- (SKPresenceDaemonConnection)daemonConnection;
- (SKPresenceOptions)options;
- (SKPresencePayload)payload;
- (os_unfair_lock_s)delegateLock;
- (os_unfair_lock_s)lock;
- (void)_attemptReconnectingToDaemon;
- (void)_delegatesPerformOnResponseQueueForGroup:(id)a3 block:(id)a4;
- (void)_fetchHandleInvitability:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5;
- (void)_inviteHandle:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5;
- (void)_inviteHandles:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5;
- (void)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5;
- (void)_reRetainTransientSubscriptionWithCompletion:(id)a3;
- (void)_reassertPresenceWithCompletion:(id)a3;
- (void)_registerForDelegateCallbacksIfNecessary;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)assertPresenceWithCompletion:(id)a3;
- (void)assertPresenceWithPresencePayload:(id)a3 completion:(id)a4;
- (void)fetchHandleInvitabilityFromPrimaryAccountHandle:(id)a3 completion:(id)a4;
- (void)fetchPresenceCapability:(id)a3;
- (void)hasInitialCloudKitImportOccurredWithCompletion:(id)a3;
- (void)initialCloudKitImportReceivedWithCompletion:(id)a3;
- (void)inviteHandleFromPrimaryAccountHandle:(id)a3 completion:(id)a4;
- (void)inviteHandlesFromPrimaryAccountHandle:(id)a3 completion:(id)a4;
- (void)invitedHandlesChangedForPresenceIdentifier:(id)a3 completion:(id)a4;
- (void)isHandleInvitedFromPrimaryAccountHandle:(id)a3 completion:(id)a4;
- (void)presenceDaemonConnectionDidDisconnect:(id)a3;
- (void)presentHandlesChangedForPresenceIdentifier:(id)a3 completion:(id)a4;
- (void)releaseDaemonConnection;
- (void)releasePresenceWithCompletion:(id)a3;
- (void)releaseTransientSubscriptionAssertionWithCompletion:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeInvitedHandle:(id)a3 completion:(id)a4;
- (void)removeInvitedHandles:(id)a3 completion:(id)a4;
- (void)retainTransientSubscriptionAssertionWithCompletion:(id)a3;
- (void)setDaemonConnection:(id)a3;
- (void)setDelegateLock:(os_unfair_lock_s)a3;
- (void)setDelegates:(id)a3;
- (void)setHasAssertion:(BOOL)a3;
- (void)setHasPresenceAssertion:(BOOL)a3;
- (void)setHasTransientSubscription:(BOOL)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setOptions:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPrivateWorkQueue:(id)a3;
- (void)setRegisteredForDelegateCallbacks:(BOOL)a3;
@end

@implementation SKPresence

- (SKPresence)initWithPresenceIdentifier:(id)a3 isPersonal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [[SKPresenceOptions alloc] initWithServiceIdentifier:&stru_26CF91F18];
  [(SKPresenceOptions *)v7 setIsPersonal:v4];
  v8 = [(SKPresence *)self initWithPresenceIdentifier:v6 options:v7];

  return v8;
}

- (SKPresence)initWithPresenceIdentifier:(id)a3
{
  return [(SKPresence *)self initWithPresenceIdentifier:a3 isPersonal:0];
}

- (SKPresence)initWithPresenceIdentifier:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[SKPresence initWithPresenceIdentifier:options:]();
  }
  v8 = v7;
  v22.receiver = self;
  v22.super_class = (Class)SKPresence;
  v9 = [(SKPresence *)&v22 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    presenceIdentifier = v9->_presenceIdentifier;
    v9->_presenceIdentifier = (NSString *)v10;

    uint64_t v12 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    delegates = v9->_delegates;
    v9->_delegates = (NSMapTable *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    v16 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("com.apple.StatusKit.Presence", v15, v16);
    privateWorkQueue = v9->_privateWorkQueue;
    v9->_privateWorkQueue = (OS_dispatch_queue *)v17;

    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_delegateLock._os_unfair_lock_opaque = 0;
    v19 = +[SKPresence _logger];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21E62A000, v19, OS_LOG_TYPE_DEFAULT, "_delegateLock init", v21, 2u);
    }

    objc_storeStrong((id *)&v9->_options, a4);
  }

  return v9;
}

- (BOOL)isPersonal
{
  v2 = [(SKPresence *)self options];
  char v3 = [v2 isPersonal];

  return v3;
}

- (void)hasInitialCloudKitImportOccurredWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[SKPresence _logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Checking if the initial cloud kit import has occurred.", buf, 2u);
  }

  id v6 = [(SKPresence *)self daemonConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke;
  v12[3] = &unk_2644B63B8;
  id v7 = v4;
  id v13 = v7;
  v8 = [v6 asynchronousRemoteDaemonWithErrorHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_19;
  v10[3] = &unk_2644B6718;
  id v11 = v7;
  id v9 = v7;
  [v8 hasInitialCloudKitImportOccurredWithCompletion:v10];
}

void __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_19(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = +[SKPresence _logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_19_cold_1();
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a3, v5);
  }
}

- (void)assertPresenceWithCompletion:(id)a3
{
}

- (void)assertPresenceWithPresencePayload:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(SKPresence *)self presenceIdentifier];
  id v9 = +[SKPresence _logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v8;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "Asserting presence for %@ with payload %@", buf, 0x16u);
  }

  [(SKPresence *)self _registerForDelegateCallbacksIfNecessary];
  uint64_t v10 = [(SKPresence *)self daemonConnection];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke;
  v21[3] = &unk_2644B63B8;
  id v11 = v7;
  id v22 = v11;
  uint64_t v12 = [v10 asynchronousRemoteDaemonWithErrorHandler:v21];
  objc_initWeak((id *)buf, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_21;
  v16[3] = &unk_2644B6740;
  id v13 = v8;
  id v17 = v13;
  objc_copyWeak(&v20, (id *)buf);
  id v14 = v6;
  id v18 = v14;
  id v15 = v11;
  id v19 = v15;
  [v12 assertPresenceForIdentifier:v13 withPresencePayload:v14 completion:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_21_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully asserted presence for presence identifier %@", (uint8_t *)&v9, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v5 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained setHasPresenceAssertion:1];
      [v5 setPayload:*(void *)(a1 + 40)];
    }
  }

  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)releasePresenceWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SKPresence *)self presenceIdentifier];
  uint64_t v6 = +[SKPresence _logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Releasing presence for  %@", buf, 0xCu);
  }

  id v7 = [(SKPresence *)self daemonConnection];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __44__SKPresence_releasePresenceWithCompletion___block_invoke;
  v17[3] = &unk_2644B63B8;
  id v8 = v4;
  id v18 = v8;
  int v9 = [v7 asynchronousRemoteDaemonWithErrorHandler:v17];
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__SKPresence_releasePresenceWithCompletion___block_invoke_22;
  v12[3] = &unk_2644B6740;
  id v10 = v5;
  id v13 = v10;
  objc_copyWeak(&v16, (id *)buf);
  id v14 = self;
  id v11 = v8;
  id v15 = v11;
  [v9 releasePresenceForIdentifier:v10 completion:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __44__SKPresence_releasePresenceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44__SKPresence_releasePresenceWithCompletion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __44__SKPresence_releasePresenceWithCompletion___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__SKPresence_releasePresenceWithCompletion___block_invoke_22_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released presence for presence identifier %@", (uint8_t *)&v9, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v5 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained setHasPresenceAssertion:0];
      [v5 setPayload:0];
    }
  }

  if (([*(id *)(a1 + 40) hasTransientSubscription] & 1) == 0) {
    [*(id *)(a1 + 40) releaseDaemonConnection];
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)retainTransientSubscriptionAssertionWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SKPresence *)self presenceIdentifier];
  uint64_t v6 = +[SKPresence _logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Retaining transient subscription assertion for presenceIdentifier %@", buf, 0xCu);
  }

  id v7 = [(SKPresence *)self daemonConnection];
  uint64_t v8 = +[SKPresence _logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "calling _registerForDelegateCallbacksIfNecessary for presenceIdentifier %@", buf, 0xCu);
  }

  [(SKPresence *)self _registerForDelegateCallbacksIfNecessary];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__SKPresence_retainTransientSubscriptionAssertionWithCompletion___block_invoke;
  v19[3] = &unk_2644B63B8;
  id v9 = v4;
  id v20 = v9;
  uint64_t v10 = [v7 asynchronousRemoteDaemonWithErrorHandler:v19];
  objc_initWeak(&location, self);
  uint64_t v11 = +[SKPresence _logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl(&dword_21E62A000, v11, OS_LOG_TYPE_DEFAULT, "calling daemon retainTransientSubscriptionAssertionForPresenceIdentifier for presenceIdentifier %@", buf, 0xCu);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__SKPresence_retainTransientSubscriptionAssertionWithCompletion___block_invoke_23;
  v14[3] = &unk_2644B6460;
  id v12 = v5;
  id v15 = v12;
  objc_copyWeak(&v17, &location);
  id v13 = v9;
  id v16 = v13;
  [v10 retainTransientSubscriptionAssertionForPresenceIdentifier:v12 completion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __65__SKPresence_retainTransientSubscriptionAssertionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __65__SKPresence_retainTransientSubscriptionAssertionWithCompletion___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__SKStatusSubscription_retainTransientSubscriptionAssertionWithCompletion___block_invoke_1_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained transient subscription assertion for presence identifier %@", (uint8_t *)&v9, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v5 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained setHasTransientSubscription:1];
    }
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)releaseTransientSubscriptionAssertionWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SKPresence *)self presenceIdentifier];
  uint64_t v6 = +[SKPresence _logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Releasing transient subscription assertion for presenceIdentifier %@", buf, 0xCu);
  }

  id v7 = [(SKPresence *)self daemonConnection];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__SKPresence_releaseTransientSubscriptionAssertionWithCompletion___block_invoke;
  v17[3] = &unk_2644B63B8;
  id v8 = v4;
  id v18 = v8;
  int v9 = [v7 asynchronousRemoteDaemonWithErrorHandler:v17];
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__SKPresence_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_24;
  v12[3] = &unk_2644B6740;
  id v10 = v5;
  id v13 = v10;
  objc_copyWeak(&v16, (id *)buf);
  id v14 = self;
  id v11 = v8;
  id v15 = v11;
  [v9 releaseTransientSubscriptionAssertionForPresenceIdentifier:v10 completion:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __66__SKPresence_releaseTransientSubscriptionAssertionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __66__SKPresence_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__SKStatusSubscription_releaseTransientSubscriptionAssertionWithCompletion___block_invoke_4_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released transient subscription assertion for presence identifier %@", (uint8_t *)&v9, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v5 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained setHasTransientSubscription:0];
    }
  }

  if (([*(id *)(a1 + 40) hasPresenceAssertion] & 1) == 0) {
    [*(id *)(a1 + 40) releaseDaemonConnection];
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (NSArray)presentDevices
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  [(SKPresence *)self _registerForDelegateCallbacksIfNecessary];
  id v3 = [(SKPresence *)self presenceIdentifier];
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_21E62A000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving present decives. Presence: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v5 = [(SKPresence *)self daemonConnection];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __28__SKPresence_presentDevices__block_invoke;
  v15[3] = &unk_2644B64B0;
  id v6 = v3;
  id v16 = v6;
  objc_copyWeak(&v18, &location);
  p_long long buf = &buf;
  id v7 = [v5 synchronousRemoteDaemonWithErrorHandler:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __28__SKPresence_presentDevices__block_invoke_25;
  v12[3] = &unk_2644B64D8;
  id v8 = v6;
  id v13 = v8;
  id v14 = &buf;
  [v7 presentDevicesForPresenceIdentifier:v8 completion:v12];
  int v9 = *(void **)(*((void *)&buf + 1) + 40);
  if (!v9) {
    int v9 = (void *)MEMORY[0x263EFFA68];
  }
  id v10 = v9;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return (NSArray *)v10;
}

void __28__SKPresence_presentDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __28__SKPresence_presentDevices__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __28__SKPresence_presentDevices__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[SKPresence _oversizeLogger];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v13 = 138543874;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl(&dword_21E62A000, v8, OS_LOG_TYPE_ERROR, "Retrieved present devices. Presence: %{public}@ Handles: %@ Error: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v13 = 138543618;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Retrieved present devices. Presence: %{public}@ Handles: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
}

- (NSArray)invitedHandles
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  [(SKPresence *)self _registerForDelegateCallbacksIfNecessary];
  id v3 = [(SKPresence *)self presenceIdentifier];
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_21E62A000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving invited handles. Presence: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  id v5 = [(SKPresence *)self daemonConnection];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __28__SKPresence_invitedHandles__block_invoke;
  v15[3] = &unk_2644B64B0;
  id v6 = v3;
  id v16 = v6;
  objc_copyWeak(&v18, &location);
  p_long long buf = &buf;
  id v7 = [v5 synchronousRemoteDaemonWithErrorHandler:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __28__SKPresence_invitedHandles__block_invoke_27;
  v12[3] = &unk_2644B64D8;
  id v8 = v6;
  id v13 = v8;
  uint64_t v14 = &buf;
  [v7 invitedHandlesForPresenceIdentifier:v8 completion:v12];
  uint64_t v9 = *(void **)(*((void *)&buf + 1) + 40);
  if (!v9) {
    uint64_t v9 = (void *)MEMORY[0x263EFFA68];
  }
  id v10 = v9;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return (NSArray *)v10;
}

void __28__SKPresence_invitedHandles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __28__SKPresence_presentDevices__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __28__SKPresence_invitedHandles__block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[SKPresence _logger];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v13 = 138543874;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl(&dword_21E62A000, v8, OS_LOG_TYPE_ERROR, "Retrieved invited handles. Presence: %{public}@ Handles: %@ Error: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v13 = 138543618;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Retrieved invited handles. Presence: %{public}@ Handles: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
}

- (BOOL)isHandleInvitedFromPrimaryAccountHandle:(id)a3
{
  return [(SKPresence *)self _isHandleInvited:a3 fromSenderHandle:0];
}

- (BOOL)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SKPresence *)self _registerForDelegateCallbacksIfNecessary];
  id v8 = [(SKPresence *)self presenceIdentifier];
  uint64_t v9 = +[SKPresence _logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    id v24 = v8;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "Checking if handle %@ has already been invited (sync) from handle: %@. Presence: %{public}@", buf, 0x20u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v24) = 0;
  uint64_t v10 = [(SKPresence *)self daemonConnection];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke;
  v20[3] = &unk_2644B6500;
  id v11 = v8;
  id v21 = v11;
  id v22 = buf;
  id v12 = [v10 synchronousRemoteDaemonWithErrorHandler:v20];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke_28;
  v16[3] = &unk_2644B6528;
  id v13 = v11;
  id v17 = v13;
  id v14 = v6;
  id v18 = v14;
  uint64_t v19 = buf;
  [v12 isHandleInvited:v14 fromSenderHandle:v7 forPresenceIdentifier:v13 completion:v16];
  LOBYTE(v11) = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return (char)v11;
}

void __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke_28(void *a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SKPresence _logger];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      int v12 = 138544130;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      int v17 = a2;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_21E62A000, v7, OS_LOG_TYPE_ERROR, "Checked if handle is invited (sync). Presence: %{public}@ Handle: %@ isInvited:%d Error: %@", (uint8_t *)&v12, 0x26u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "Determined if handle is invited (sync). Presence: %{public}@ Handle: %@ isInvited: %d", (uint8_t *)&v12, 0x1Cu);
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
}

- (void)isHandleInvitedFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
}

- (void)_isHandleInvited:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(SKPresence *)self _registerForDelegateCallbacksIfNecessary];
  uint64_t v11 = [(SKPresence *)self presenceIdentifier];
  int v12 = +[SKPresence _logger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2114;
    v34 = v11;
    _os_log_impl(&dword_21E62A000, v12, OS_LOG_TYPE_DEFAULT, "Checking if handle %@ has already been invited (async) from handle: %@. Presence: %{public}@", buf, 0x20u);
  }

  uint64_t v13 = [(SKPresence *)self daemonConnection];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke;
  v25[3] = &unk_2644B6550;
  id v14 = v11;
  id v26 = v14;
  id v15 = v8;
  id v27 = v15;
  id v16 = v10;
  id v28 = v16;
  int v17 = [v13 asynchronousRemoteDaemonWithErrorHandler:v25];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke_30;
  v21[3] = &unk_2644B6578;
  id v22 = v14;
  id v23 = v15;
  id v24 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  [v17 isHandleInvited:v19 fromSenderHandle:v9 forPresenceIdentifier:v20 completion:v21];
}

void __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke_30(void *a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SKPresence _logger];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      int v12 = 138544130;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      int v17 = a2;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_21E62A000, v7, OS_LOG_TYPE_ERROR, "Error while checking if handle has already been invited (async). Presence: %{public}@ Handle: %@ isInvited:%d Error: %@", (uint8_t *)&v12, 0x26u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "Checked if handle is invited (async). Presence: %{public}@ Handle: %@ isInvited: %d", (uint8_t *)&v12, 0x1Cu);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)fetchHandleInvitabilityFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
}

- (void)_fetchHandleInvitability:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    -[SKPresence _fetchHandleInvitability:fromSenderHandle:completion:]();
  }
  uint64_t v11 = v10;
  [(SKPresence *)self _registerForDelegateCallbacksIfNecessary];
  int v12 = [(SKPresence *)self presenceIdentifier];
  uint64_t v13 = +[SKPresence _logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v31 = v8;
    __int16 v32 = 2114;
    __int16 v33 = v12;
    _os_log_impl(&dword_21E62A000, v13, OS_LOG_TYPE_DEFAULT, "Fetching handle %@ invitability. Presence: %{public}@", buf, 0x16u);
  }

  __int16 v14 = [(SKPresence *)self daemonConnection];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke;
  v26[3] = &unk_2644B6550;
  id v15 = v12;
  id v27 = v15;
  id v16 = v8;
  id v28 = v16;
  id v17 = v11;
  id v29 = v17;
  __int16 v18 = [v14 asynchronousRemoteDaemonWithErrorHandler:v26];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_32;
  v22[3] = &unk_2644B65A0;
  id v23 = v15;
  id v24 = v16;
  id v25 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  [v18 fetchHandleInvitability:v20 fromHandle:v9 forPresenceIdentifier:v21 completion:v22];
}

void __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_32(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[SKPresence _logger];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = a1[5];
      int v13 = 138544130;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_error_impl(&dword_21E62A000, v8, OS_LOG_TYPE_ERROR, "Error fetching handle invitability. Presence: %{public}@ Handle: %@ invitability:%@ Error: %@", (uint8_t *)&v13, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    int v13 = 138543874;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Checked if handle is invitable. Presence: %{public}@ Handle: %@ invitability: %@", (uint8_t *)&v13, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)inviteHandleFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
}

- (void)_inviteHandle:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 arrayWithObjects:&v13 count:1];

  -[SKPresence inviteHandles:fromSenderHandle:completion:](self, "inviteHandles:fromSenderHandle:completion:", v12, v10, v9, v13, v14);
}

- (void)inviteHandlesFromPrimaryAccountHandle:(id)a3 completion:(id)a4
{
}

- (void)_inviteHandles:(id)a3 fromSenderHandle:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    -[SKPresence _inviteHandles:fromSenderHandle:completion:]();
  }
  id v11 = v10;
  [(SKPresence *)self _registerForDelegateCallbacksIfNecessary];
  uint64_t v12 = [(SKPresence *)self presenceIdentifier];
  id v13 = +[SKPresence _logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v29 = v8;
    __int16 v30 = 2114;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_21E62A000, v13, OS_LOG_TYPE_DEFAULT, "Received request to invite handles: %@ to presenceIdentifier: %{public}@ from sender handle: %@", buf, 0x20u);
  }

  uint64_t v14 = [(SKPresence *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke;
  v23[3] = &unk_2644B6410;
  id v15 = v12;
  id v24 = v15;
  id v16 = v8;
  id v25 = v16;
  objc_copyWeak(&v27, (id *)buf);
  id v17 = v11;
  id v26 = v17;
  id v18 = [v14 asynchronousRemoteDaemonWithErrorHandler:v23];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke_35;
  v20[3] = &unk_2644B65C8;
  objc_copyWeak(&v22, (id *)buf);
  id v19 = v17;
  id v21 = v19;
  [v18 inviteHandles:v16 fromSenderHandle:v9 presenceIdentifier:v15 completion:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v27);

  objc_destroyWeak((id *)buf);
}

void __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  id WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __94__SKStatusPublishingService__inviteHandles_fromSenderHandle_withInvitationPayload_completion___block_invoke_16_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _simulateCrashIfNecessaryForError:v3];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Inviting handles completed.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeInvitedHandle:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[SKPresence removeInvitedHandles:completion:](self, "removeInvitedHandles:completion:", v9, v7, v10, v11);
}

- (void)removeInvitedHandles:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SKPresence *)self _registerForDelegateCallbacksIfNecessary];
  id v8 = [(SKPresence *)self presenceIdentifier];
  id v9 = +[SKPresence _logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "Removing invited handles. Presence: %{public}@ Handles: %@", buf, 0x16u);
  }

  id v10 = [(SKPresence *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __46__SKPresence_removeInvitedHandles_completion___block_invoke;
  v19[3] = &unk_2644B6410;
  id v11 = v8;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  objc_copyWeak(&v23, (id *)buf);
  id v13 = v7;
  id v22 = v13;
  uint64_t v14 = [v10 asynchronousRemoteDaemonWithErrorHandler:v19];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__SKPresence_removeInvitedHandles_completion___block_invoke_36;
  v16[3] = &unk_2644B65C8;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v13;
  id v17 = v15;
  [v14 removeInvitedHandles:v12 presenceIdentifier:v11 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v23);

  objc_destroyWeak((id *)buf);
}

void __46__SKPresence_removeInvitedHandles_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__SKPresence_removeInvitedHandles_completion___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __46__SKPresence_removeInvitedHandles_completion___block_invoke_36(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  id WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__SKStatusPublishingService_removeInvitedHandles_completion___block_invoke_17_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _simulateCrashIfNecessaryForError:v3];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Remove invited handles completed.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPresenceCapability:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[SKPresence fetchPresenceCapability:]();
  }
  id v5 = v4;
  [(SKPresence *)self _registerForDelegateCallbacksIfNecessary];
  id v6 = +[SKPresence _logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Fetching presence capability.", buf, 2u);
  }

  id v7 = [(SKPresence *)self daemonConnection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__SKPresence_fetchPresenceCapability___block_invoke;
  v13[3] = &unk_2644B63B8;
  id v8 = v5;
  id v14 = v8;
  id v9 = [v7 asynchronousRemoteDaemonWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__SKPresence_fetchPresenceCapability___block_invoke_37;
  v11[3] = &unk_2644B6768;
  id v12 = v8;
  id v10 = v8;
  [v9 fetchPresenceCapability:v11];
}

void __38__SKPresence_fetchPresenceCapability___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__SKPresence_fetchPresenceCapability___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __38__SKPresence_fetchPresenceCapability___block_invoke_37(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_21E62A000, v4, OS_LOG_TYPE_DEFAULT, "Checked if account is presence capable: %d", (uint8_t *)v6, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SKPresence _logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "_delegateLock addDelegate waiting", buf, 2u);
  }

  os_unfair_lock_lock(&self->_delegateLock);
  id v9 = +[SKPresence _logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "_delegateLock addDelegate Locked", v13, 2u);
  }

  id v10 = [[SKDelegateResponseQueue alloc] initWithQueue:v6];
  [(NSMapTable *)self->_delegates setObject:v10 forKey:v7];

  id v11 = +[SKPresence _logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_21E62A000, v11, OS_LOG_TYPE_DEFAULT, "_delegateLock addDelegate unlock", v12, 2u);
  }

  os_unfair_lock_unlock(&self->_delegateLock);
  [(SKPresence *)self _registerForDelegateCallbacksIfNecessary];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[SKPresence _logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "_delegateLock removeDelegate waiting", buf, 2u);
  }

  os_unfair_lock_lock(&self->_delegateLock);
  id v6 = +[SKPresence _logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "_delegateLock removeDelegate locked", v9, 2u);
  }

  [(NSMapTable *)self->_delegates removeObjectForKey:v4];
  id v7 = +[SKPresence _logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "_delegateLock removeDelegate unlocked", v8, 2u);
  }

  os_unfair_lock_unlock(&self->_delegateLock);
}

- (void)_registerForDelegateCallbacksIfNecessary
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = +[SKPresence _logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21E62A000, v3, OS_LOG_TYPE_DEFAULT, "_delegateLock _registerForDelegateCallbacksIfNecessary waiting", buf, 2u);
  }

  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  id v5 = +[SKPresence _logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "_delegateLock _registerForDelegateCallbacksIfNecessary locked", buf, 2u);
  }

  if (self->_registeredForDelegateCallbacks)
  {
    id v6 = +[SKPresence _logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "_delegateLock _registerForDelegateCallbacksIfNecessary unlocked already registered", buf, 2u);
    }
LABEL_8:

    os_unfair_lock_unlock(p_delegateLock);
    return;
  }
  if (![(NSMapTable *)self->_delegates count])
  {
    id v6 = +[SKPresence _logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "_delegateLock _registerForDelegateCallbacksIfNecessary unlocked already delegate count 0", buf, 2u);
    }
    goto LABEL_8;
  }
  self->_registeredForDelegateCallbacks = 1;
  id v7 = +[SKPresence _logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "_delegateLock _registerForDelegateCallbacksIfNecessary unlocked registering", buf, 2u);
  }

  os_unfair_lock_unlock(&self->_delegateLock);
  id v8 = [(SKPresence *)self presenceIdentifier];
  id v9 = +[SKPresence _logger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v20 = v8;
    _os_log_impl(&dword_21E62A000, v9, OS_LOG_TYPE_DEFAULT, "Registering for delegate callbacks for presenceIdentifier: %{public}@", buf, 0xCu);
  }

  id v10 = [(SKPresence *)self daemonConnection];
  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__SKPresence__registerForDelegateCallbacksIfNecessary__block_invoke;
  v17[3] = &unk_2644B65F0;
  objc_copyWeak(&v18, (id *)buf);
  id v11 = [v10 asynchronousRemoteDaemonWithErrorHandler:v17];
  id v12 = [(SKPresence *)self options];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__SKPresence__registerForDelegateCallbacksIfNecessary__block_invoke_40;
  v14[3] = &unk_2644B6618;
  objc_copyWeak(&v16, (id *)buf);
  id v13 = v8;
  id v15 = v13;
  [v11 registerForDelegateCallbacksWithPresenceIdentifier:v13 options:v12 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __54__SKPresence__registerForDelegateCallbacksIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__SKStatusPublishingService__registerForDelegateCallbacksIfNecessary__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _simulateCrashIfNecessaryForError:v3];
}

void __54__SKPresence__registerForDelegateCallbacksIfNecessary__block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKPresence _logger];
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
    _os_log_impl(&dword_21E62A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Completed registration for delegate callbacks for presence identifier: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_delegatesPerformOnResponseQueueForGroup:(id)a3 block:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v6 = a3;
  id v7 = a4;
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  uint64_t v9 = (void *)[(NSMapTable *)self->_delegates copy];
  os_unfair_lock_unlock(p_delegateLock);
  if (![v9 count])
  {
    id v10 = +[SKPresence _logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E62A000, v10, OS_LOG_TYPE_DEFAULT, "No delegates available to perform presence delegate callback", buf, 2u);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [v9 keyEnumerator];
  uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v16 = [v9 objectForKey:v15];
        id v17 = [v16 dispatchQueue];
        dispatch_group_enter(v6);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __61__SKPresence__delegatesPerformOnResponseQueueForGroup_block___block_invoke;
        block[3] = &unk_2644B6640;
        id v21 = v7;
        block[4] = v15;
        id v20 = v6;
        dispatch_async(v17, block);
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v12);
  }
}

void __61__SKPresence__delegatesPerformOnResponseQueueForGroup_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

- (void)presentHandlesChangedForPresenceIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SKPresence _logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Present devices changed on presence: %@", buf, 0xCu);
  }

  uint64_t v9 = dispatch_group_create();
  id v10 = [(SKPresence *)self presenceIdentifier];
  char v11 = [v10 isEqualToString:v6];

  if (v11)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke;
    v17[3] = &unk_2644B6790;
    void v17[4] = self;
    [(SKPresence *)self _delegatesPerformOnResponseQueueForGroup:v9 block:v17];
  }
  else
  {
    uint64_t v12 = +[SKPresence _logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_21E62A000, v12, OS_LOG_TYPE_DEFAULT, "Delegate received message for other identifier: %@", buf, 0xCu);
    }
  }
  privateWorkQueue = self->_privateWorkQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke_45;
  v15[3] = &unk_2644B67B8;
  id v16 = v7;
  id v14 = v7;
  dispatch_group_notify(v9, privateWorkQueue, v15);
}

void __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = objc_opt_respondsToSelector();
  id v5 = +[SKPresence _logger];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate of present devices update. Delegate: %@", (uint8_t *)&v7, 0xCu);
    }

    [v3 presentDevicesChangedForPresence:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke_cold_1();
    }
  }
}

uint64_t __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invitedHandlesChangedForPresenceIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SKPresence _logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_21E62A000, v8, OS_LOG_TYPE_DEFAULT, "Invited handles changed for presence identifier: %@", buf, 0xCu);
  }

  uint64_t v9 = dispatch_group_create();
  id v10 = [(SKPresence *)self presenceIdentifier];
  char v11 = [v10 isEqualToString:v6];

  if (v11)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __68__SKPresence_invitedHandlesChangedForPresenceIdentifier_completion___block_invoke;
    v17[3] = &unk_2644B6790;
    void v17[4] = self;
    [(SKPresence *)self _delegatesPerformOnResponseQueueForGroup:v9 block:v17];
  }
  else
  {
    uint64_t v12 = +[SKPresence _logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_21E62A000, v12, OS_LOG_TYPE_DEFAULT, "Delegate received message for other identifier: %@", buf, 0xCu);
    }
  }
  privateWorkQueue = self->_privateWorkQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__SKPresence_invitedHandlesChangedForPresenceIdentifier_completion___block_invoke_48;
  v15[3] = &unk_2644B67B8;
  id v16 = v7;
  id v14 = v7;
  dispatch_group_notify(v9, privateWorkQueue, v15);
}

void __68__SKPresence_invitedHandlesChangedForPresenceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = objc_opt_respondsToSelector();
  id v5 = +[SKPresence _logger];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "Informing delegate of invited handle update. Delegate: %@", (uint8_t *)&v7, 0xCu);
    }

    [v3 invitedHandlesChangedForPresence:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke_cold_1();
    }
  }
}

uint64_t __68__SKPresence_invitedHandlesChangedForPresenceIdentifier_completion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presenceDaemonConnectionDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = +[SKPresence _logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "_delegateLock presenceDaemonConnectionDidDisconnect waiting", (uint8_t *)buf, 2u);
  }

  os_unfair_lock_lock(&self->_delegateLock);
  id v6 = +[SKPresence _logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21E62A000, v6, OS_LOG_TYPE_DEFAULT, "_delegateLock presenceDaemonConnectionDidDisconnect locked", (uint8_t *)buf, 2u);
  }

  self->_registeredForDelegateCallbacks = 0;
  int v7 = +[SKPresence _logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21E62A000, v7, OS_LOG_TYPE_DEFAULT, "_delegateLock presenceDaemonConnectionDidDisconnect unlocked", (uint8_t *)buf, 2u);
  }

  os_unfair_lock_unlock(&self->_delegateLock);
  dispatch_group_t v8 = dispatch_group_create();
  objc_initWeak(buf, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__SKPresence_presenceDaemonConnectionDidDisconnect___block_invoke;
  v9[3] = &unk_2644B67E0;
  v9[4] = self;
  objc_copyWeak(&v10, buf);
  [(SKPresence *)self _delegatesPerformOnResponseQueueForGroup:v8 block:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

void __52__SKPresence_presenceDaemonConnectionDidDisconnect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = objc_opt_respondsToSelector();
  id v5 = +[SKPresence _logger];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Notifying presence delegate that the XPC connection has disconnected", buf, 2u);
    }

    [v3 presenceDaemonDisconnected:*(void *)(a1 + 32)];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Presence delegate does not implement the delegate method to be notified the XPC connection has disconnected", v9, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    dispatch_group_t v8 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained releaseDaemonConnection];
      [v8 _attemptReconnectingToDaemon];
    }
  }
}

- (void)initialCloudKitImportReceivedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__SKPresence_initialCloudKitImportReceivedWithCompletion___block_invoke;
  v10[3] = &unk_2644B6790;
  void v10[4] = self;
  [(SKPresence *)self _delegatesPerformOnResponseQueueForGroup:v5 block:v10];
  privateWorkQueue = self->_privateWorkQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__SKPresence_initialCloudKitImportReceivedWithCompletion___block_invoke_53;
  v8[3] = &unk_2644B67B8;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(v5, privateWorkQueue, v8);
}

void __58__SKPresence_initialCloudKitImportReceivedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = objc_opt_respondsToSelector();
  id v5 = +[SKPresence _logger];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Notifying presence delegate that the initial cloud kit import was received.", buf, 2u);
    }

    [v3 initialCloudKitImportReceived:*(void *)(a1 + 32)];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "Presence delegate does not implement the delegate method to be notified the initial cloud kit import was received.", v7, 2u);
    }
  }
}

uint64_t __58__SKPresence_initialCloudKitImportReceivedWithCompletion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_attemptReconnectingToDaemon
{
  id v3 = +[SKPresence _logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21E62A000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to reconnect with the daemon", (uint8_t *)buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  daemonConnection = self->_daemonConnection;
  os_unfair_lock_unlock(&self->_lock);
  if (!daemonConnection)
  {
    objc_initWeak(buf, self);
    if ([(SKPresence *)self hasPresenceAssertion]
      && [(SKPresence *)self hasTransientSubscription])
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __42__SKPresence__attemptReconnectingToDaemon__block_invoke;
      v5[3] = &unk_2644B6690;
      objc_copyWeak(&v6, buf);
      [(SKPresence *)self _reassertPresenceWithCompletion:v5];
      objc_destroyWeak(&v6);
    }
    else if ([(SKPresence *)self hasPresenceAssertion])
    {
      [(SKPresence *)self _reassertPresenceWithCompletion:&__block_literal_global_55];
    }
    else if ([(SKPresence *)self hasTransientSubscription])
    {
      [(SKPresence *)self _reRetainTransientSubscriptionWithCompletion:&__block_literal_global_57];
    }
    objc_destroyWeak(buf);
  }
}

void __42__SKPresence__attemptReconnectingToDaemon__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _reRetainTransientSubscriptionWithCompletion:&__block_literal_global_8];
    id WeakRetained = v2;
  }
}

- (void)_reassertPresenceWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SKPresence *)self payload];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__SKPresence__reassertPresenceWithCompletion___block_invoke;
  v7[3] = &unk_2644B6808;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [(SKPresence *)self assertPresenceWithPresencePayload:v5 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__SKPresence__reassertPresenceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained releaseDaemonConnection];
      dispatch_time_t v5 = dispatch_walltime(0, 10000000000);
      id v6 = v4[8];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__SKPresence__reassertPresenceWithCompletion___block_invoke_2;
      block[3] = &unk_2644B6690;
      objc_copyWeak(&v9, v2);
      dispatch_after(v5, v6, block);
      objc_destroyWeak(&v9);
    }
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v7();
  }
}

void __46__SKPresence__reassertPresenceWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _attemptReconnectingToDaemon];
    id WeakRetained = v2;
  }
}

- (void)_reRetainTransientSubscriptionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __59__SKPresence__reRetainTransientSubscriptionWithCompletion___block_invoke;
  v6[3] = &unk_2644B6808;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [(SKPresence *)self retainTransientSubscriptionAssertionWithCompletion:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __59__SKPresence__reRetainTransientSubscriptionWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained releaseDaemonConnection];
      dispatch_time_t v5 = dispatch_walltime(0, 10000000000);
      id v6 = v4[8];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__SKPresence__reRetainTransientSubscriptionWithCompletion___block_invoke_2;
      block[3] = &unk_2644B6690;
      objc_copyWeak(&v9, v2);
      dispatch_after(v5, v6, block);
      objc_destroyWeak(&v9);
    }
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v7();
  }
}

void __59__SKPresence__reRetainTransientSubscriptionWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _attemptReconnectingToDaemon];
    id WeakRetained = v2;
  }
}

+ (id)_logger
{
  if (_logger_onceToken != -1) {
    dispatch_once(&_logger_onceToken, &__block_literal_global_59);
  }
  id v2 = (void *)_logger__logger;
  return v2;
}

uint64_t __21__SKPresence__logger__block_invoke()
{
  _logger__logger = (uint64_t)os_log_create("com.apple.StatusKit", "SKPresence");
  return MEMORY[0x270F9A758]();
}

+ (id)_oversizeLogger
{
  if (_oversizeLogger_onceToken != -1) {
    dispatch_once(&_oversizeLogger_onceToken, &__block_literal_global_63);
  }
  id v2 = (void *)_oversizeLogger__logger;
  return v2;
}

uint64_t __29__SKPresence__oversizeLogger__block_invoke()
{
  _oversizeLogger__logger = (uint64_t)os_log_create("com.apple.StatusKit", "StatusKit-oversized");
  return MEMORY[0x270F9A758]();
}

- (SKPresenceDaemonConnection)daemonConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  daemonConnection = self->_daemonConnection;
  if (!daemonConnection)
  {
    dispatch_time_t v5 = [[SKPresenceDaemonConnection alloc] initWithPresenceDaemonDelegate:self connectionDelegate:self];
    id v6 = self->_daemonConnection;
    self->_daemonConnection = v5;

    daemonConnection = self->_daemonConnection;
  }
  id v7 = daemonConnection;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)releaseDaemonConnection
{
  id v3 = +[SKPresence _logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21E62A000, v3, OS_LOG_TYPE_DEFAULT, "_delegateLock releaseDaemonConnection waiting", buf, 2u);
  }

  os_unfair_lock_lock(&self->_delegateLock);
  id v4 = +[SKPresence _logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_21E62A000, v4, OS_LOG_TYPE_DEFAULT, "_delegateLock releaseDaemonConnection locked", v8, 2u);
  }

  self->_registeredForDelegateCallbacks = 0;
  dispatch_time_t v5 = +[SKPresence _logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21E62A000, v5, OS_LOG_TYPE_DEFAULT, "_delegateLock releaseDaemonConnection unlocked", v7, 2u);
  }

  os_unfair_lock_unlock(&self->_delegateLock);
  os_unfair_lock_lock(&self->_lock);
  [(SKPresenceDaemonConnection *)self->_daemonConnection invalidate];
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setHasAssertion:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasPresenceAssertion = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasAssertion
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasPresenceAssertion;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasTransientSubscription:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasTransientSubscription = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasTransientSubscription
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasTransientSubscription;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPayload:(id)a3
{
  id v4 = (SKPresencePayload *)a3;
  os_unfair_lock_lock(&self->_lock);
  payload = self->_payload;
  self->_payload = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (SKPresencePayload)payload
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_payload;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDaemonConnection:(id)a3
{
}

- (BOOL)hasPresenceAssertion
{
  return self->_hasPresenceAssertion;
}

- (void)setHasPresenceAssertion:(BOOL)a3
{
  self->_hasPresenceAssertion = a3;
}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (SKPresenceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
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

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)delegateLock
{
  return self->_delegateLock;
}

- (void)setDelegateLock:(os_unfair_lock_s)a3
{
  self->_delegateLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

- (void)initWithPresenceIdentifier:options:.cold.1()
{
}

void __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error checking initial cloud kit import. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __61__SKPresence_hasInitialCloudKitImportOccurredWithCompletion___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error checking if the cloudkit import has occurred. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error retaining presence assertion. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __59__SKPresence_assertPresenceWithPresencePayload_completion___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Error asserting presence. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __44__SKPresence_releasePresenceWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error releasing presence assertion. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __44__SKPresence_releasePresenceWithCompletion___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Error releasing presence. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __28__SKPresence_presentDevices__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21E62A000, v0, v1, "XPC Error retrieving invited handles. Presence: %{public}@ Error: %{public}@");
}

void __48__SKPresence__isHandleInvited_fromSenderHandle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21E62A000, v0, v1, "XPC Error checking if handle is invited (sync). Presence: %{public}@ Error: %{public}@");
}

void __59__SKPresence__isHandleInvited_fromSenderHandle_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E62A000, v0, v1, "XPC Error checking if handle is invited (async). Presence: %{public}@ handle:%@ Error: %{public}@");
}

- (void)_fetchHandleInvitability:fromSenderHandle:completion:.cold.1()
{
}

void __67__SKPresence__fetchHandleInvitability_fromSenderHandle_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E62A000, v0, v1, "XPC Error checking invitability. Presence: %{public}@ handle:%@ Error: %{public}@");
}

- (void)_inviteHandles:fromSenderHandle:completion:.cold.1()
{
}

void __57__SKPresence__inviteHandles_fromSenderHandle_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E62A000, v0, v1, "XPC Error inviting handles. Presence: %{public}@ handles:%@ Error: %{public}@");
}

void __46__SKPresence_removeInvitedHandles_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21E62A000, v0, v1, "XPC Error removing invited handles. Presence: %{public}@ handles:%@ Error: %{public}@");
}

- (void)fetchPresenceCapability:.cold.1()
{
}

void __38__SKPresence_fetchPresenceCapability___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "XPC Error checking presence capability.  Error: %{public}@", v2, v3, v4, v5, v6);
}

void __68__SKPresence_presentHandlesChangedForPresenceIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21E62A000, v0, v1, "Delegate does not implement presentHandlesChangedForPresence:, not informing delegate: %@", v2, v3, v4, v5, v6);
}

@end