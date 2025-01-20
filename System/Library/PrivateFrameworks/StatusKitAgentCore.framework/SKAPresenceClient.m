@interface SKAPresenceClient
+ (id)_accountNotCapableError;
+ (id)_crossAccountError;
+ (id)_noChannelCreatedError;
+ (id)_noChannelError;
+ (id)_noClientIDError;
+ (id)_unableToResolveSenderHandleError;
+ (id)logger;
+ (id)oversizeLogger;
- (BOOL)activeAssertion;
- (BOOL)activeSubscription;
- (BOOL)presenceIdentifierMatchesClient:(id)a3;
- (NSSet)lastSeenPresentDevices;
- (NSString)activeSubscriptionIdentifier;
- (NSString)presenceIdenfifier;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)transaction;
- (SKADatabaseManaging)databaseManager;
- (SKAInvitationManaging)invitationManager;
- (SKAPresenceClient)initWithXPCConnection:(id)a3 queue:(id)a4 delegate:(id)a5 subscriptionManager:(id)a6 presenceManager:(id)a7 invitationManager:(id)a8 databaseManager:(id)a9;
- (SKAPresenceClientConnection)clientConnection;
- (SKAPresenceClientDelegate)delegate;
- (SKAPresenceManaging)presenceManager;
- (SKAStatusSubscriptionManaging)subscriptionManager;
- (SKPresenceOptions)options;
- (SKPresencePayload)currentPayload;
- (double)lastSelfInviteSentTimestamp;
- (id)_shortHashOfClientID:(id)a3;
- (id)clientPrefixedPresenceIdentifierForPresenceIdentifier:(id)a3;
- (id)rawPresenceIdentifierForPrefixedPresenceIdentifier:(id)a3;
- (void)accountIsPresenceCapableWithCompletion:(id)a3;
- (void)assertPresenceForIdentifier:(id)a3 withPresencePayload:(id)a4 completion:(id)a5;
- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forPresenceIdentifier:(id)a5 completion:(id)a6;
- (void)fetchPresenceCapability:(id)a3;
- (void)handleReceivedInvitationForPresenceIdentifier:(id)a3;
- (void)handleReceivedPresentDevicesUpdateForPresenceIdentifier:(id)a3;
- (void)hasInitialCloudKitImportOccurredWithCompletion:(id)a3;
- (void)initialCloudKitImportReceived;
- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 presenceIdentifier:(id)a5 completion:(id)a6;
- (void)invitedHandlesForPresenceIdentifier:(id)a3 completion:(id)a4;
- (void)isHandleInvited:(id)a3 fromSenderHandle:(id)a4 forPresenceIdentifier:(id)a5 completion:(id)a6;
- (void)presenceClientConnectionWasInterrupted:(id)a3;
- (void)presenceClientConnectionWasInvalidated:(id)a3;
- (void)presentDevicesForPresenceIdentifier:(id)a3 completion:(id)a4;
- (void)refreshAssertionsForPresenceIdentifier:(id)a3;
- (void)registerForDelegateCallbacksWithPresenceIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
- (void)releasePresenceForIdentifier:(id)a3 completion:(id)a4;
- (void)releaseTransientSubscriptionAssertionForPresenceIdentifier:(id)a3 completion:(id)a4;
- (void)removeInvitedHandles:(id)a3 presenceIdentifier:(id)a4 completion:(id)a5;
- (void)retainTransientSubscriptionAssertionForPresenceIdentifier:(id)a3 completion:(id)a4;
- (void)setActiveAssertion:(BOOL)a3;
- (void)setActiveSubscription:(BOOL)a3;
- (void)setActiveSubscriptionIdentifier:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setCurrentPayload:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInvitationManager:(id)a3;
- (void)setLastSeenPresentDevices:(id)a3;
- (void)setLastSelfInviteSentTimestamp:(double)a3;
- (void)setOptions:(id)a3;
- (void)setPresenceIdenfifier:(id)a3;
- (void)setPresenceManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSubscriptionManager:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation SKAPresenceClient

- (SKAPresenceClient)initWithXPCConnection:(id)a3 queue:(id)a4 delegate:(id)a5 subscriptionManager:(id)a6 presenceManager:(id)a7 invitationManager:(id)a8 databaseManager:(id)a9
{
  id v26 = a3;
  v15 = a4;
  id v16 = a5;
  id v25 = a6;
  id v24 = a7;
  id v17 = a8;
  id v18 = a9;
  dispatch_assert_queue_V2(v15);
  v27.receiver = self;
  v27.super_class = (Class)SKAPresenceClient;
  v19 = [(SKAPresenceClient *)&v27 init];
  if (v19)
  {
    v20 = [[SKAPresenceClientConnection alloc] initWithXPCConnection:v26 queue:v15 daemonProtocolDelegate:v19 connectionLifecycleDelegate:v19];
    clientConnection = v19->_clientConnection;
    v19->_clientConnection = v20;

    objc_storeWeak((id *)&v19->_delegate, v16);
    objc_storeStrong((id *)&v19->_databaseManager, a9);
    objc_storeStrong((id *)&v19->_subscriptionManager, a6);
    objc_storeStrong((id *)&v19->_invitationManager, a8);
    objc_storeStrong((id *)&v19->_presenceManager, a7);
    *(_WORD *)&v19->_activeSubscription = 0;
    objc_storeStrong((id *)&v19->_queue, a4);
    transaction = v19->_transaction;
    v19->_transaction = 0;

    v19->_lastSelfInviteSentTimestamp = 0.0;
  }

  return v19;
}

+ (id)_accountNotCapableError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"System iCloud account does not exist or is not presence capable";
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:-7000 userInfo:v4];

  return v5;
}

+ (id)_noChannelError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"No channel exists for presence identifier";
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:-7002 userInfo:v4];

  return v5;
}

+ (id)_noChannelCreatedError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79850];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"No channel exists or could be created for presence identifier";
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:v3 code:-7002 userInfo:v4];

  return v5;
}

+ (id)_unableToResolveSenderHandleError
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithFormat:@"Could not determine sender handle to use"];
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F79850];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v2;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 errorWithDomain:v4 code:-7003 userInfo:v5];

  return v6;
}

+ (id)_noClientIDError
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithFormat:@"Missing client ID entitlement"];
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F79850];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v2;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 errorWithDomain:v4 code:-7003 userInfo:v5];

  return v6;
}

+ (id)_crossAccountError
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithFormat:@"This action isn't available when isPersonal is True"];
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F79850];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v2;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 errorWithDomain:v4 code:-7011 userInfo:v5];

  return v6;
}

- (void)presenceClientConnectionWasInterrupted:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Presence client connection was interrupted: %@", (uint8_t *)&v10, 0xCu);
  }

  v6 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Beginning release of transient subscription assertions associated with interrupted client", (uint8_t *)&v10, 2u);
  }

  [(SKAStatusSubscriptionManaging *)self->_subscriptionManager releaseAllPresenceSubscriptionAssertionsAssociatedWithClient:self completion:&__block_literal_global_26];
  presenceManager = self->_presenceManager;
  uint64_t v8 = [(SKAPresenceClient *)self options];
  [(SKAPresenceManaging *)presenceManager releaseAllPresenceAssertionsAssociatedWithClient:self options:v8 completion:&__block_literal_global_26];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained presenceClientWasInvalidated:self];
}

void __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[SKAPresenceClient logger];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing transient subscription assertions associated with interrupted client", v5, 2u);
  }
}

void __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[SKAPresenceClient logger];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke_24_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing presence assertions associated with interrupted client", v5, 2u);
  }
}

- (void)presenceClientConnectionWasInvalidated:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Presence client connection was invalidated: %@", (uint8_t *)&v11, 0xCu);
  }

  v6 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Beginning release of presence subscription assertions associated with interrupted client", (uint8_t *)&v11, 2u);
  }

  [(SKAStatusSubscriptionManaging *)self->_subscriptionManager releaseAllPresenceSubscriptionAssertionsAssociatedWithClient:self completion:&__block_literal_global_28];
  uint64_t v7 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Beginning release of presence assertions associated with interrupted client", (uint8_t *)&v11, 2u);
  }

  presenceManager = self->_presenceManager;
  v9 = [(SKAPresenceClient *)self options];
  [(SKAPresenceManaging *)presenceManager releaseAllPresenceAssertionsAssociatedWithClient:self options:v9 completion:&__block_literal_global_31];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained presenceClientWasInvalidated:self];
}

void __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[SKAPresenceClient logger];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing presence subscription assertions associated with invalidated client", v5, 2u);
  }
}

void __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke_29(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[SKAPresenceClient logger];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke_29_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing presence assertions associated with invalidated client", v5, 2u);
  }
}

+ (id)logger
{
  if (logger_onceToken_26 != -1) {
    dispatch_once(&logger_onceToken_26, &__block_literal_global_34);
  }
  id v2 = (void *)logger__logger_26;
  return v2;
}

uint64_t __27__SKAPresenceClient_logger__block_invoke()
{
  logger__logger_26 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAPresenceClient");
  return MEMORY[0x270F9A758]();
}

+ (id)oversizeLogger
{
  if (oversizeLogger_onceToken_0[0] != -1) {
    dispatch_once(oversizeLogger_onceToken_0, &__block_literal_global_38_0);
  }
  id v2 = (void *)oversizeLogger__logger_0;
  return v2;
}

uint64_t __35__SKAPresenceClient_oversizeLogger__block_invoke()
{
  oversizeLogger__logger_0 = (uint64_t)os_log_create("com.apple.StatusKit", "StatusKit-oversized");
  return MEMORY[0x270F9A758]();
}

- (void)hasInitialCloudKitImportOccurredWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SKAPresenceClient *)self databaseManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__SKAPresenceClient_hasInitialCloudKitImportOccurredWithCompletion___block_invoke;
  v7[3] = &unk_2646E0C60;
  id v8 = v4;
  id v6 = v4;
  [v5 hasInitialCloudKitImportOccurred:v7];
}

uint64_t __68__SKAPresenceClient_hasInitialCloudKitImportOccurredWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)assertPresenceForIdentifier:(id)a3 withPresencePayload:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SKAPresenceClient *)self clientPrefixedPresenceIdentifierForPresenceIdentifier:v8];
  id v12 = (void *)v11;
  if (v9)
  {
    if (v11)
    {
LABEL_3:
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke;
      v16[3] = &unk_2646E10B8;
      id v21 = v10;
      id v17 = v12;
      id v18 = self;
      id v19 = v9;
      id v20 = v8;
      [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v16];

      uint64_t v13 = v21;
      goto LABEL_10;
    }
  }
  else
  {
    v14 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Client did not specify a payload", buf, 2u);
    }

    id v9 = (id)[objc_alloc(MEMORY[0x263F79800]) initWithData:0];
    if (v12) {
      goto LABEL_3;
    }
  }
  v15 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:]();
  }

  uint64_t v13 = +[SKAPresenceClient _noClientIDError];
  (*((void (**)(id, void *))v10 + 2))(v10, v13);
LABEL_10:
}

void __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = +[SKAPresenceClient logger];
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Retaining presence assertion for presenceIdentifier: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) setActiveAssertion:1];
    [*(id *)(a1 + 40) setCurrentPayload:*(void *)(a1 + 48)];
    uint64_t v7 = [*(id *)(a1 + 40) presenceManager];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) options];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_42;
    v16[3] = &unk_2646E22C0;
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    v14 = *(void **)(a1 + 48);
    id v17 = v12;
    uint64_t v18 = v13;
    id v19 = v14;
    id v20 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 64);
    [v7 retainPresenceAssertionForPresenceIdentifier:v9 withPresencePayload:v8 options:v10 client:v11 completion:v16];

    v15 = v17;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    v15 = +[SKAPresenceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKAPresenceClient logger];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_42_cold_1();
    }

    [*(id *)(a1 + 40) setActiveAssertion:0];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained presence assertion for presenceIdentifier: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) setCurrentPayload:*(void *)(a1 + 48)];
    uint64_t v7 = [*(id *)(a1 + 40) options];
    int v8 = [v7 isPersonal];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263EFF910] now];
      [v9 timeIntervalSince1970];
      double v11 = v10;
      [*(id *)(a1 + 40) lastSelfInviteSentTimestamp];
      double v13 = v11 - v12;

      v14 = +[SKAPresenceClient logger];
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13 <= 21600.0)
      {
        if (v15)
        {
          id v20 = [*(id *)(a1 + 40) presenceIdenfifier];
          [*(id *)(a1 + 40) lastSelfInviteSentTimestamp];
          *(_DWORD *)buf = 138412546;
          uint64_t v24 = v20;
          __int16 v25 = 2048;
          uint64_t v26 = v21;
          _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Not sending self invitation for personal channel with presenceIdentifier: %@ as last self invite was sent at %f", buf, 0x16u);
        }
      }
      else
      {
        if (v15)
        {
          id v16 = [*(id *)(a1 + 40) presenceIdenfifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = v16;
          _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Sending self invitation for personal channel with presenceIdentifier: %@", buf, 0xCu);
        }
        v14 = [*(id *)(a1 + 40) invitationManager];
        uint64_t v17 = *(void *)(a1 + 56);
        uint64_t v18 = [*(id *)(a1 + 40) options];
        uint64_t v19 = [v18 isPersonal];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_44;
        v22[3] = &unk_2646E0FC8;
        v22[4] = *(void *)(a1 + 40);
        [v14 sendSelfInvitationForPresenceChannelWithPresenceIdentifier:v17 isPersonal:v19 completion:v22];
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_44(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v9 = 138412546;
    double v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Sent self invites for personal channel %@, with error %@", (uint8_t *)&v9, 0x16u);
  }

  if (!v5)
  {
    int v8 = [MEMORY[0x263EFF910] now];
    [v8 timeIntervalSince1970];
    objc_msgSend(*(id *)(a1 + 32), "setLastSelfInviteSentTimestamp:");
  }
}

- (void)releasePresenceForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SKAPresenceClient *)self clientPrefixedPresenceIdentifierForPresenceIdentifier:a3];
  if (v7)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke;
    v10[3] = &unk_2646E1090;
    id v12 = v6;
    v10[4] = self;
    id v11 = v7;
    [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v10];

    int v8 = v12;
  }
  else
  {
    int v9 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:]();
    }

    int v8 = +[SKAPresenceClient _noClientIDError];
    (*((void (**)(id, void *))v6 + 2))(v6, v8);
  }
}

void __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke(id *a1, char a2)
{
  if (a2)
  {
    [a1[4] setActiveAssertion:0];
    id v3 = [a1[4] presenceManager];
    id v4 = a1[5];
    id v5 = [a1[4] options];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke_52;
    v9[3] = &unk_2646E1158;
    id v6 = a1[4];
    id v10 = a1[5];
    id v11 = a1[6];
    [v3 releasePresenceAssertionForPresenceIdentifier:v4 options:v5 client:v6 completion:v9];

    uint64_t v7 = v10;
  }
  else
  {
    int v8 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v7 = +[SKAPresenceClient _accountNotCapableError];
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKAPresenceClient logger];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke_52_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released presence assertion for presenceIdentifier: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forPresenceIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(SKAPresenceClient *)self clientPrefixedPresenceIdentifierForPresenceIdentifier:a5];
  if (v13)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __89__SKAPresenceClient_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke;
    v16[3] = &unk_2646E10B8;
    id v20 = v12;
    void v16[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v13;
    [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v16];

    v14 = v20;
  }
  else
  {
    BOOL v15 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:]();
    }

    v14 = +[SKAPresenceClient _noClientIDError];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v14);
  }
}

void __89__SKAPresenceClient_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) invitationManager];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __89__SKAPresenceClient_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke_53;
    v9[3] = &unk_2646E10E0;
    uint64_t v6 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    [v3 fetchHandleInvitability:v4 fromHandle:v5 forPresenceIdentifier:v6 completion:v9];

    int v7 = v10;
  }
  else
  {
    uint64_t v8 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    int v7 = +[SKAPresenceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __89__SKAPresenceClient_fetchHandleInvitability_fromHandle_forPresenceIdentifier_completion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPresenceCapability:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SKAPresenceClient_fetchPresenceCapability___block_invoke;
  v6[3] = &unk_2646E0C60;
  id v7 = v4;
  id v5 = v4;
  [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v6];
}

uint64_t __45__SKAPresenceClient_fetchPresenceCapability___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Presence account check completed with result: %d", (uint8_t *)v6, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 presenceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *))a6;
  v14 = [(SKAPresenceClient *)self options];
  int v15 = [v14 isPersonal];

  id v16 = +[SKAPresenceClient logger];
  id v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceClient inviteHandles:fromSenderHandle:presenceIdentifier:completion:]();
    }

    id v18 = +[SKAPresenceClient _crossAccountError];
    v13[2](v13, v18);
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Received request to send invitation for presence channel with presence identifier %@ to handles: %@", buf, 0x16u);
    }

    id v18 = [(SKAPresenceClient *)self clientPrefixedPresenceIdentifierForPresenceIdentifier:v12];
    if (v18)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke;
      v21[3] = &unk_2646E10B8;
      __int16 v25 = v13;
      v21[4] = self;
      id v22 = v18;
      id v23 = v10;
      id v24 = v11;
      [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v21];

      id v19 = v25;
    }
    else
    {
      id v20 = +[SKAPresenceClient logger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:]();
      }

      id v19 = +[SKAPresenceClient _noClientIDError];
      v13[2](v13, v19);
    }
  }
}

void __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) invitationManager];
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 32) options];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_55;
    v10[3] = &unk_2646E1108;
    id v12 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 48);
    [v3 sendInvitationForPresenceChannelWithPresenceIdentifier:v6 toHandles:v4 fromSenderHandle:v5 options:v7 completion:v10];

    uint64_t v8 = v12;
  }
  else
  {
    uint64_t v9 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1();
    }

    uint64_t v8 = +[SKAPresenceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_55(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[SKAPresenceClient logger];
  uint64_t v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_55_cold_1();
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Successfully sent invitation to handles: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (void)invitedHandlesForPresenceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = [(SKAPresenceClient *)self options];
  int v9 = [v8 isPersonal];

  if (v9)
  {
    int v10 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceClient inviteHandles:fromSenderHandle:presenceIdentifier:completion:]();
    }

    uint64_t v11 = +[SKAPresenceClient _crossAccountError];
    v7[2](v7, 0, v11);
  }
  else
  {
    uint64_t v11 = [(SKAPresenceClient *)self clientPrefixedPresenceIdentifierForPresenceIdentifier:v6];
    if (v11)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __68__SKAPresenceClient_invitedHandlesForPresenceIdentifier_completion___block_invoke;
      v14[3] = &unk_2646E1090;
      id v16 = v7;
      v14[4] = self;
      id v15 = v11;
      [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v14];

      uint64_t v12 = v16;
    }
    else
    {
      uint64_t v13 = +[SKAPresenceClient logger];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:]();
      }

      uint64_t v12 = +[SKAPresenceClient _noClientIDError];
      v7[2](v7, 0, v12);
    }
  }
}

void __68__SKAPresenceClient_invitedHandlesForPresenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) databaseManager];
    uint64_t v4 = (void *)[v3 newBackgroundContext];

    id v5 = [*(id *)(a1 + 32) databaseManager];
    id v6 = [v5 existingChannelForPresenceIdentifier:*(void *)(a1 + 40) isPersonal:0 databaseContext:v4];

    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v8 = objc_msgSend(v6, "invitedUsers", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) invitedSKHandle];
            if (v13) {
              [v7 addObject:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v10);
      }

      v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      id v16 = +[SKAPresenceClient logger];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Personal channel does not exist for presence identifier", buf, 2u);
      }

      id v7 = +[SKAPresenceClient _noChannelError];
      v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v14();
  }
  else
  {
    id v15 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1();
    }

    uint64_t v4 = +[SKAPresenceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)isHandleInvited:(id)a3 fromSenderHandle:(id)a4 forPresenceIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, void *))a6;
  v14 = [(SKAPresenceClient *)self options];
  int v15 = [v14 isPersonal];

  if (v15)
  {
    id v16 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceClient inviteHandles:fromSenderHandle:presenceIdentifier:completion:]();
    }

    long long v17 = +[SKAPresenceClient _crossAccountError];
    v13[2](v13, 0, v17);
  }
  else
  {
    long long v17 = [(SKAPresenceClient *)self clientPrefixedPresenceIdentifierForPresenceIdentifier:v12];
    if (v17)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __87__SKAPresenceClient_isHandleInvited_fromSenderHandle_forPresenceIdentifier_completion___block_invoke;
      v20[3] = &unk_2646E10B8;
      id v24 = v13;
      v20[4] = self;
      id v21 = v17;
      id v22 = v11;
      id v23 = v10;
      [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v20];

      long long v18 = v24;
    }
    else
    {
      long long v19 = +[SKAPresenceClient logger];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:]();
      }

      long long v18 = +[SKAPresenceClient _noClientIDError];
      v13[2](v13, 0, v18);
    }
  }
}

void __87__SKAPresenceClient_isHandleInvited_fromSenderHandle_forPresenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) databaseManager];
    uint64_t v4 = (void *)[v3 newBackgroundContext];

    id v5 = [*(id *)(a1 + 32) databaseManager];
    id v6 = [v5 existingChannelForPresenceIdentifier:*(void *)(a1 + 40) isPersonal:0 databaseContext:v4];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) invitationManager];
      uint64_t v8 = [v7 resolveSenderHandleWithPreferredSenderHandle:*(void *)(a1 + 48)];

      if (!v8)
      {
        id v23 = +[SKAPresenceClient logger];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          __87__SKAPresenceClient_isHandleInvited_fromSenderHandle_forPresenceIdentifier_completion___block_invoke_cold_1();
        }

        id v24 = +[SKAPresenceClient _unableToResolveSenderHandleError];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

        goto LABEL_33;
      }
      __int16 v25 = v6;
      uint64_t v26 = v4;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v9 = [v6 invitedUsers];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            int v15 = [v14 invitedSKHandle];
            if ([*(id *)(a1 + 56) isNormalizedEqualToHandle:v15])
            {
              id v16 = [v14 senderSKHandle];
              int v17 = [v8 isNormalizedEqualToHandle:v16];
              long long v18 = +[SKAPresenceClient logger];
              BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
              if (v17)
              {
                if (v19)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "We found a match to an existing invited user", buf, 2u);
                }

                goto LABEL_31;
              }
              if (v19)
              {
                *(_DWORD *)buf = 138412546;
                v32 = v16;
                __int16 v33 = 2112;
                v34 = v8;
                _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "We found an existing invitated user matching the requested user, but that invitation was sent with handle %@ instead of handle %@. Ignoring.", buf, 0x16u);
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      uint64_t v9 = +[SKAPresenceClient logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "We did not find a match to any existing invited user", buf, 2u);
      }
LABEL_31:
      id v6 = v25;
      uint64_t v4 = v26;

      id v22 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      id v21 = +[SKAPresenceClient logger];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v21, OS_LOG_TYPE_DEFAULT, "Personal channel does not exist for presence identifier", buf, 2u);
      }

      uint64_t v8 = +[SKAPresenceClient _noChannelError];
      id v22 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    v22();
LABEL_33:

    goto LABEL_34;
  }
  long long v20 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1();
  }

  uint64_t v4 = +[SKAPresenceClient _accountNotCapableError];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_34:
}

- (void)registerForDelegateCallbacksWithPresenceIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v8;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Registering for delegate callbacks with presence identifier %@", buf, 0xCu);
  }

  uint64_t v12 = [(SKAPresenceClient *)self clientPrefixedPresenceIdentifierForPresenceIdentifier:v8];
  if (v12)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __91__SKAPresenceClient_registerForDelegateCallbacksWithPresenceIdentifier_options_completion___block_invoke;
    v15[3] = &unk_2646E1068;
    id v18 = v10;
    v15[4] = self;
    id v16 = v12;
    id v17 = v9;
    [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v15];

    uint64_t v13 = v18;
  }
  else
  {
    v14 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:]();
    }

    uint64_t v13 = +[SKAPresenceClient _noClientIDError];
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }
}

void __91__SKAPresenceClient_registerForDelegateCallbacksWithPresenceIdentifier_options_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    uint64_t v4 = (void *)[*(id *)(a1 + 40) copy];
    [*(id *)(a1 + 32) setPresenceIdenfifier:v4];

    [*(id *)(a1 + 32) setOptions:*(void *)(a1 + 48)];
    if (!*(void *)(*(void *)(a1 + 32) + 24))
    {
      id v5 = [NSString stringWithFormat:@"com.apple.statuskit.presence.%@", *(void *)(a1 + 40)];
      id v6 = +[SKAPresenceClient logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v5;
        _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "SKATransaction: Creating transaction {%@}", buf, 0xCu);
      }

      id v7 = v5;
      [v7 cStringUsingEncoding:4];
      uint64_t v8 = os_transaction_create();
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 24);
      *(void *)(v9 + 24) = v8;
    }
    objc_sync_exit(v3);

    uint64_t v11 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      id v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Client %@ has registered for delegate callbacks for presence identifier: %@.", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v14 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1();
    }

    int v15 = +[SKAPresenceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)removeInvitedHandles:(id)a3 presenceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  uint64_t v11 = [(SKAPresenceClient *)self options];
  int v12 = [v11 isPersonal];

  if (v12)
  {
    uint64_t v13 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceClient removeInvitedHandles:presenceIdentifier:completion:]();
    }

    v14 = +[SKAPresenceClient _crossAccountError];
    v10[2](v10, v14);
  }
  else
  {
    v14 = [(SKAPresenceClient *)self clientPrefixedPresenceIdentifierForPresenceIdentifier:v9];
    if (v14)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke;
      v17[3] = &unk_2646E1068;
      uint64_t v20 = v10;
      v17[4] = self;
      id v18 = v14;
      id v19 = v8;
      [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v17];

      int v15 = v20;
    }
    else
    {
      id v16 = +[SKAPresenceClient logger];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:]();
      }

      int v15 = +[SKAPresenceClient _noClientIDError];
      v10[2](v10, v15);
    }
  }
}

void __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) invitationManager];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke_60;
    v11[3] = &unk_2646E22E8;
    id v6 = v4;
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    id v12 = v6;
    uint64_t v13 = v7;
    id v14 = v8;
    id v15 = *(id *)(a1 + 56);
    [v3 revokeInvitationFromPresenceChannelWithPresenceIdentifier:v5 forHandles:v6 completion:v11];

    id v9 = v12;
  }
  else
  {
    id v10 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1();
    }

    id v9 = +[SKAPresenceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke_60_cold_1();
    }
  }
  else
  {
    if (([*(id *)(a1 + 40) activeAssertion] & 1) != 0
      || [*(id *)(a1 + 40) activeSubscription])
    {
      [*(id *)(a1 + 40) refreshAssertionsForPresenceIdentifier:*(void *)(a1 + 48)];
    }
    uint64_t v4 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Invitation revocation for handles %@ completed successfully", (uint8_t *)&v6, 0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)retainTransientSubscriptionAssertionForPresenceIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Retaining transient subscription assertion for presence identifier %@", buf, 0xCu);
  }

  id v9 = [(SKAPresenceClient *)self clientPrefixedPresenceIdentifierForPresenceIdentifier:v6];
  if (v9)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke;
    v12[3] = &unk_2646E1068;
    id v16 = v7;
    id v13 = v6;
    id v14 = self;
    id v15 = v9;
    [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v12];

    id v10 = v16;
  }
  else
  {
    uint64_t v11 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:]();
    }

    id v10 = +[SKAPresenceClient _noClientIDError];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

void __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = +[SKAPresenceClient logger];
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Account is presence capable, finding channel for identifier %@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) setActiveSubscription:1];
    id v7 = [*(id *)(a1 + 40) databaseManager];
    uint64_t v8 = (void *)[v7 newBackgroundContext];

    id v9 = [*(id *)(a1 + 40) presenceManager];
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = [*(id *)(a1 + 40) options];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_61;
    v13[3] = &unk_2646E0C38;
    id v14 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = v12;
    [v9 findOrCreatePresenceChannelForPresenceIdentifier:v10 options:v11 databaseContext:v8 completion:v13];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v8 = +[SKAPresenceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_61(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (!v5 || a3)
  {
    id v13 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_61_cold_1();
    }

    id v12 = +[SKAPresenceClient _noChannelCreatedError];
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v7 = [v5 identifier];
    [a1[5] setActiveSubscriptionIdentifier:v7];
    uint64_t v8 = [a1[5] subscriptionManager];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_62;
    v14[3] = &unk_2646E22C0;
    id v15 = v7;
    id v9 = a1[5];
    id v10 = a1[4];
    id v11 = a1[5];
    id v16 = v10;
    id v17 = v11;
    id v18 = v6;
    id v19 = a1[6];
    id v12 = v7;
    [v8 retainPresenceSubscriptionAssertionForSubscriptionIdentifier:v12 client:v9 completion:v14];
  }
}

void __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[SKAPresenceClient logger];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_62_cold_1();
    }

    [*(id *)(a1 + 48) setActiveSubscription:0];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@", (uint8_t *)&v10, 0x16u);
    }

    if (([*(id *)(a1 + 48) activeAssertion] & 1) == 0)
    {
      uint64_t v8 = +[SKAPresenceClient logger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Polling for current state as there is no active assertion", (uint8_t *)&v10, 2u);
      }

      id v9 = [*(id *)(a1 + 48) presenceManager];
      [v9 sendPollingMessageForChannel:*(void *)(a1 + 56)];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)releaseTransientSubscriptionAssertionForPresenceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SKAPresenceClient *)self clientPrefixedPresenceIdentifierForPresenceIdentifier:a3];
  if (v7)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke;
    v10[3] = &unk_2646E1090;
    id v12 = v6;
    void v10[4] = self;
    id v11 = v7;
    [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v10];

    uint64_t v8 = v12;
  }
  else
  {
    id v9 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:]();
    }

    uint64_t v8 = +[SKAPresenceClient _noClientIDError];
    (*((void (**)(id, void *))v6 + 2))(v6, v8);
  }
}

void __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke(id *a1, char a2)
{
  if (a2)
  {
    [a1[4] setActiveSubscription:0];
    id v3 = [a1[4] databaseManager];
    uint64_t v4 = (void *)[v3 newBackgroundContext];

    id v5 = [a1[4] presenceManager];
    id v6 = a1[5];
    uint64_t v7 = [a1[4] options];
    uint64_t v8 = [v7 isPersonal];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_64;
    v11[3] = &unk_2646E0C38;
    id v12 = a1[5];
    id v9 = a1[6];
    id v13 = a1[4];
    id v14 = v9;
    [v5 findPresenceChannelForPresenceIdentifier:v6 isPersonal:v8 databaseContext:v4 completion:v11];
  }
  else
  {
    int v10 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v4 = +[SKAPresenceClient _accountNotCapableError];
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_64(id *a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    uint64_t v8 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_61_cold_1();
    }

    id v7 = +[SKAPresenceClient _noChannelCreatedError];
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    uint64_t v4 = [a2 identifier];
    id v5 = [a1[5] subscriptionManager];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_65;
    v9[3] = &unk_2646E1218;
    id v10 = v4;
    id v6 = a1[5];
    id v11 = a1[4];
    id v12 = a1[6];
    id v7 = v4;
    [v5 releasePresenceSubscriptionAssertionForSubscriptionIdentifier:v7 client:v6 completion:v9];
  }
}

void __91__SKAPresenceClient_releaseTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_65(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[SKAPresenceClient logger];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_62_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)presentDevicesForPresenceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SKAPresenceClient *)self clientPrefixedPresenceIdentifierForPresenceIdentifier:a3];
  if (v7)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__SKAPresenceClient_presentDevicesForPresenceIdentifier_completion___block_invoke;
    v11[3] = &unk_2646E1090;
    id v13 = v6;
    void v11[4] = self;
    id v12 = v7;
    [(SKAPresenceClient *)self accountIsPresenceCapableWithCompletion:v11];

    int v8 = v13;
  }
  else
  {
    uint64_t v9 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKAPresenceClient assertPresenceForIdentifier:withPresencePayload:completion:]();
    }

    int v8 = +[SKAPresenceClient _noClientIDError];
    id v10 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    (*((void (**)(id, id, void *))v6 + 2))(v6, v10, v8);
  }
}

void __68__SKAPresenceClient_presentDevicesForPresenceIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) presenceManager];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) options];
    uint64_t v6 = [v5 isPersonal];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__SKAPresenceClient_presentDevicesForPresenceIdentifier_completion___block_invoke_67;
    v11[3] = &unk_2646E2310;
    id v12 = *(id *)(a1 + 48);
    [v3 presentDevicesForPresenceIdentifier:v4 isPersonal:v6 completion:v11];

    uint64_t v7 = v12;
  }
  else
  {
    int v8 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v7 = +[SKAPresenceClient _accountNotCapableError];
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v10, v7);
  }
}

void __68__SKAPresenceClient_presentDevicesForPresenceIdentifier_completion___block_invoke_67(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, a2, 0);
  }
}

- (id)clientPrefixedPresenceIdentifierForPresenceIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SKAPresenceClient *)self clientConnection];
    uint64_t v6 = [v5 clientID];

    if (v6)
    {
      id v7 = [(SKAPresenceClient *)self _shortHashOfClientID:v6];
      id v8 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"%@-%@-%@", v6, v4, v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)rawPresenceIdentifierForPrefixedPresenceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (unint64_t)[v4 length] >= 4)
  {
    id v7 = [(SKAPresenceClient *)self clientConnection];
    id v8 = [v7 clientID];

    if (v8)
    {
      uint64_t v9 = [(SKAPresenceClient *)self _shortHashOfClientID:v8];
      id v10 = [v5 componentsSeparatedByString:@"-"];
      uint64_t v11 = [v10 firstObject];
      if ([v11 isEqualToString:v8])
      {
        id v12 = [v10 lastObject];
        if ([v12 isEqualToString:v9])
        {
          id v13 = objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v10, "count") - 2);
          uint64_t v6 = [v13 componentsJoinedByString:@"-"];
        }
        else
        {
          uint64_t v6 = 0;
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_shortHashOfClientID:(id)a3
{
  id v3 = objc_msgSend(a3, "ska_sha256Hash");
  id v4 = [v3 substringToIndex:4];

  return v4;
}

- (void)accountIsPresenceCapableWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Checking if account is presence capable...", buf, 2u);
  }

  uint64_t v6 = self;
  objc_sync_enter(v6);
  id v7 = [(SKAPresenceClient *)v6 databaseManager];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __60__SKAPresenceClient_accountIsPresenceCapableWithCompletion___block_invoke;
  v9[3] = &unk_2646E0CD8;
  void v9[4] = v6;
  id v8 = v4;
  id v10 = v8;
  [v7 deviceToDeviceEncryptedDatabaseCapableWithCompletion:v9];

  objc_sync_exit(v6);
}

void __60__SKAPresenceClient_accountIsPresenceCapableWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__SKAPresenceClient_accountIsPresenceCapableWithCompletion___block_invoke_2;
  v5[3] = &unk_2646E1180;
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __60__SKAPresenceClient_accountIsPresenceCapableWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)presenceIdentifierMatchesClient:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = v5->_presenceIdenfifier;
  objc_sync_exit(v5);

  if (-[NSString length](v6, "length") || [v4 length]) {
    char v7 = [v4 isEqualToString:v6];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)handleReceivedPresentDevicesUpdateForPresenceIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(SKAPresenceClient *)self presenceIdentifierMatchesClient:v4];
  id v6 = +[SKAPresenceClient logger];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Notifying client of updated present devices", buf, 2u);
    }

    id v8 = [(SKAPresenceClientConnection *)self->_clientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:&__block_literal_global_77];
    uint64_t v9 = [(SKAPresenceClient *)self presenceManager];
    id v10 = [(SKAPresenceClient *)self options];
    uint64_t v11 = [v10 isPersonal];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke_78;
    v13[3] = &unk_2646E2338;
    id v14 = v4;
    id v15 = self;
    id v16 = v8;
    id v6 = v8;
    [v9 presentDevicesForPresenceIdentifier:v14 isPersonal:v11 completion:v13];
  }
  else if (v7)
  {
    presenceIdenfifier = self->_presenceIdenfifier;
    *(_DWORD *)buf = 138412546;
    id v18 = presenceIdenfifier;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Connected client does not match presence identifier of changed channel. Client: %@ Presence: %@", buf, 0x16u);
  }
}

void __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke_cold_1();
  }
}

void __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = +[SKAPresenceClient oversizeLogger];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v19 = 138543874;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      id v22 = v5;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_error_impl(&dword_22480C000, v8, OS_LOG_TYPE_ERROR, "Retrieved present devices. Presence: %{public}@ Handles: %@ Error: %@", (uint8_t *)&v19, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v19 = 138543618;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Retrieved present devices. Presence: %{public}@ Handles: %@", (uint8_t *)&v19, 0x16u);
  }

  if (v5)
  {
    id v11 = [MEMORY[0x263EFFA08] setWithArray:v5];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFFA08]);
  }
  id v12 = v11;
  uint64_t v13 = *(void *)(a1 + 40);
  id v16 = *(void **)(v13 + 96);
  id v14 = (id *)(v13 + 96);
  id v15 = v16;
  if (v16)
  {
    if ([v15 isEqualToSet:v12])
    {
      id v17 = +[SKAPresenceClient logger];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "No change in present devices - not notifying delegate", (uint8_t *)&v19, 2u);
      }
      goto LABEL_17;
    }
  }
  else
  {
    objc_storeStrong(v14, v12);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 96), v12);
  id v18 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Notifying delegate of present devices change", (uint8_t *)&v19, 2u);
  }

  id v17 = [*(id *)(a1 + 40) rawPresenceIdentifierForPrefixedPresenceIdentifier:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) presentHandlesChangedForPresenceIdentifier:v17 completion:&__block_literal_global_82];
LABEL_17:
}

void __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke_80()
{
  v0 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22480C000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of present devices update.", v1, 2u);
  }
}

- (void)handleReceivedInvitationForPresenceIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(SKAPresenceClient *)self presenceIdentifierMatchesClient:v4];
  id v6 = +[SKAPresenceClient logger];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Notifying client of updated invitations", (uint8_t *)&v10, 2u);
    }

    id v6 = [(SKAPresenceClientConnection *)self->_clientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:&__block_literal_global_84];
    id v8 = [(SKAPresenceClient *)self rawPresenceIdentifierForPrefixedPresenceIdentifier:v4];
    [v6 invitedHandlesChangedForPresenceIdentifier:v8 completion:&__block_literal_global_87];
  }
  else if (v7)
  {
    presenceIdenfifier = self->_presenceIdenfifier;
    int v10 = 138412546;
    id v11 = presenceIdenfifier;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Connected client does not match presence identifier of changed channel. Client: %@ Presence: %@", (uint8_t *)&v10, 0x16u);
  }
}

void __67__SKAPresenceClient_handleReceivedInvitationForPresenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__SKAPresenceClient_handleReceivedInvitationForPresenceIdentifier___block_invoke_cold_1();
  }
}

void __67__SKAPresenceClient_handleReceivedInvitationForPresenceIdentifier___block_invoke_85()
{
  v0 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22480C000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of invited handles update.", v1, 2u);
  }
}

- (void)refreshAssertionsForPresenceIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SKAPresenceClient *)self presenceIdentifierMatchesClient:v4])
  {
    BOOL v5 = [(SKAPresenceClient *)self databaseManager];
    id v6 = [v5 newBackgroundContext];

    if ([(SKAPresenceClient *)self activeSubscription])
    {
      BOOL v7 = [(SKAPresenceClient *)self presenceManager];
      id v8 = [(SKAPresenceClient *)self options];
      uint64_t v9 = [v8 isPersonal];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke;
      v17[3] = &unk_2646E23D8;
      int v10 = (id *)v18;
      v18[0] = v4;
      v18[1] = self;
      [v7 findPresenceChannelForPresenceIdentifier:v18[0] isPersonal:v9 databaseContext:v6 completion:v17];
LABEL_10:

      goto LABEL_11;
    }
    if ([(SKAPresenceClient *)self activeAssertion])
    {
      __int16 v12 = +[SKAPresenceClient logger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        presenceIdenfifier = self->_presenceIdenfifier;
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = presenceIdenfifier;
        _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Reasserting presence to handle change in underlying channel for presenceIdentifier %@", buf, 0xCu);
      }

      BOOL v7 = [(SKAPresenceClient *)self presenceManager];
      id v8 = [(SKAPresenceClient *)self currentPayload];
      uint64_t v14 = [(SKAPresenceClient *)self options];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_91;
      v15[3] = &unk_2646E2400;
      int v10 = (id *)v16;
      v16[0] = v4;
      v16[1] = self;
      [v7 retainPresenceAssertionForPresenceIdentifier:v16[0] withPresencePayload:v8 options:v14 client:self completion:v15];

      goto LABEL_10;
    }
  }
  else
  {
    id v6 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_presenceIdenfifier;
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Connected client does not match presence identifier of changed channel. Client: %@ Presence: %@", buf, 0x16u);
    }
  }
LABEL_11:
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (!v5 || a3)
  {
    BOOL v7 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_cold_1();
    }
  }
  else
  {
    BOOL v7 = [v5 identifier];
    id v8 = [*(id *)(a1 + 40) activeSubscriptionIdentifier];
    char v9 = [v7 isEqualToString:v8];

    int v10 = +[SKAPresenceClient logger];
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        __int16 v12 = [*(id *)(a1 + 40) presenceIdenfifier];
        id v13 = [*(id *)(a1 + 40) activeSubscriptionIdentifier];
        *(_DWORD *)buf = 138412802;
        id v24 = v12;
        __int16 v25 = 2112;
        uint64_t v26 = v13;
        __int16 v27 = 2112;
        long long v28 = v7;
        _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Not moving over to new channel for presence identifier %@. Old channel %@ is same as the New channel %@", buf, 0x20u);
      }
    }
    else
    {
      if (v11)
      {
        uint64_t v14 = [*(id *)(a1 + 40) presenceIdenfifier];
        id v15 = [*(id *)(a1 + 40) activeSubscriptionIdentifier];
        *(_DWORD *)buf = 138412802;
        id v24 = v14;
        __int16 v25 = 2112;
        uint64_t v26 = v15;
        __int16 v27 = 2112;
        long long v28 = v7;
        _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Moving over to new channel for presence identifier %@. Old channel %@ New channel %@", buf, 0x20u);
      }
      id v16 = [*(id *)(a1 + 40) subscriptionManager];
      id v17 = [*(id *)(a1 + 40) activeSubscriptionIdentifier];
      uint64_t v18 = *(void *)(a1 + 40);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_88;
      v19[3] = &unk_2646E23B0;
      v19[4] = v18;
      id v20 = *(id *)(a1 + 32);
      BOOL v7 = v7;
      __int16 v21 = v7;
      id v22 = v6;
      [v16 releasePresenceSubscriptionAssertionForSubscriptionIdentifier:v17 client:v18 completion:v19];
    }
  }
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[SKAPresenceClient logger];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_88_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) activeSubscriptionIdentifier];
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    __int16 v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) setActiveSubscriptionIdentifier:*(void *)(a1 + 48)];
  id v8 = [*(id *)(a1 + 32) subscriptionManager];
  uint64_t v9 = *(void *)(a1 + 32);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_89;
  v14[3] = &unk_2646E2388;
  id v15 = v3;
  int v10 = *(void **)(a1 + 48);
  id v16 = v10;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v17 = v11;
  uint64_t v18 = v12;
  id v19 = *(id *)(a1 + 56);
  id v13 = v3;
  [v8 retainPresenceSubscriptionAssertionForSubscriptionIdentifier:v10 client:v9 completion:v14];
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[SKAPresenceClient logger];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_89_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v7;
      __int16 v25 = 2112;
      uint64_t v26 = v8;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Successfully retained presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@", buf, 0x16u);
    }

    uint64_t v9 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Polling for current state as we've migrated channels", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 56) presenceManager];
    [v6 sendPollingMessageForChannel:*(void *)(a1 + 64)];
  }

  if ([*(id *)(a1 + 56) activeAssertion])
  {
    int v10 = +[SKAPresenceClient logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*(id *)(a1 + 56) presenceIdenfifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v11;
      _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Reasserting presence to handle change in underlying channel for presenceIdentifier %@", buf, 0xCu);
    }
    uint64_t v12 = [*(id *)(a1 + 56) presenceManager];
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = [*(id *)(a1 + 56) currentPayload];
    id v15 = [*(id *)(a1 + 56) options];
    uint64_t v16 = *(void *)(a1 + 56);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_90;
    v19[3] = &unk_2646E2360;
    id v20 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 56);
    id v21 = v17;
    uint64_t v22 = v18;
    [v12 retainPresenceAssertionForPresenceIdentifier:v13 withPresencePayload:v14 options:v15 client:v16 completion:v19];
  }
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[SKAPresenceClient logger];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_90_cold_1();
    }

    [*(id *)(a1 + 48) setActiveAssertion:0];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Successfully retained presence assertion for presenceIdentifier: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_91(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[SKAPresenceClient logger];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_42_cold_1();
    }

    [*(id *)(a1 + 40) setActiveAssertion:0];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained presence assertion for presenceIdentifier: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)initialCloudKitImportReceived
{
  id v3 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Notifying client of initial cloud kit import.", v5, 2u);
  }

  uint64_t v4 = [(SKAPresenceClientConnection *)self->_clientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:&__block_literal_global_93];
  [v4 initialCloudKitImportReceivedWithCompletion:&__block_literal_global_96];
}

void __50__SKAPresenceClient_initialCloudKitImportReceived__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__SKAPresenceClient_initialCloudKitImportReceived__block_invoke_cold_1();
  }
}

void __50__SKAPresenceClient_initialCloudKitImportReceived__block_invoke_94()
{
  v0 = +[SKAPresenceClient logger];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22480C000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of initial cloud kit import.", v1, 2u);
  }
}

- (NSString)presenceIdenfifier
{
  return self->_presenceIdenfifier;
}

- (void)setPresenceIdenfifier:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (SKAPresenceClientConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
}

- (SKAPresenceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKAPresenceClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (SKAStatusSubscriptionManaging)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
}

- (SKAInvitationManaging)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
}

- (SKAPresenceManaging)presenceManager
{
  return self->_presenceManager;
}

- (void)setPresenceManager:(id)a3
{
}

- (BOOL)activeSubscription
{
  return self->_activeSubscription;
}

- (void)setActiveSubscription:(BOOL)a3
{
  self->_activeSubscription = a3;
}

- (NSString)activeSubscriptionIdentifier
{
  return self->_activeSubscriptionIdentifier;
}

- (void)setActiveSubscriptionIdentifier:(id)a3
{
}

- (BOOL)activeAssertion
{
  return self->_activeAssertion;
}

- (void)setActiveAssertion:(BOOL)a3
{
  self->_activeAssertion = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSSet)lastSeenPresentDevices
{
  return self->_lastSeenPresentDevices;
}

- (void)setLastSeenPresentDevices:(id)a3
{
}

- (SKPresencePayload)currentPayload
{
  return self->_currentPayload;
}

- (void)setCurrentPayload:(id)a3
{
}

- (SKPresenceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (double)lastSelfInviteSentTimestamp
{
  return self->_lastSelfInviteSentTimestamp;
}

- (void)setLastSelfInviteSentTimestamp:(double)a3
{
  self->_lastSelfInviteSentTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_currentPayload, 0);
  objc_storeStrong((id *)&self->_lastSeenPresentDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_presenceManager, 0);
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_presenceIdenfifier, 0);
}

void __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error releasing transient subscription assertions associated with interrupted client: %@", v2, v3, v4, v5, v6);
}

void __60__SKAPresenceClient_presenceClientConnectionWasInterrupted___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error releasing presence assertions associated with interrupted client: %@", v2, v3, v4, v5, v6);
}

void __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error releasing presence subscription assertions associated with invalidated client: %@", v2, v3, v4, v5, v6);
}

void __60__SKAPresenceClient_presenceClientConnectionWasInvalidated___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error releasing presence assertions associated with invalidated client: %@", v2, v3, v4, v5, v6);
}

- (void)assertPresenceForIdentifier:withPresencePayload:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Missing client ID entitlement or presence identifier", v2, v3, v4, v5, v6);
}

void __80__SKAPresenceClient_assertPresenceForIdentifier_withPresencePayload_completion___block_invoke_42_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Error retaining presence assertion for presenceIdentifier: %@ error: %@");
}

void __61__SKAPresenceClient_releasePresenceForIdentifier_completion___block_invoke_52_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Error releasing presence assertion for presenceIdentifier: %@ error: %@");
}

- (void)inviteHandles:fromSenderHandle:presenceIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Inviting handles isn't available when isPersonal is true", v2, v3, v4, v5, v6);
}

void __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Account is not Presence capable", v2, v3, v4, v5, v6);
}

void __82__SKAPresenceClient_inviteHandles_fromSenderHandle_presenceIdentifier_completion___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to send invitation to handles with error: %@", v2, v3, v4, v5, v6);
}

void __87__SKAPresenceClient_isHandleInvited_fromSenderHandle_forPresenceIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error resolving sender handle for isInvited check. UnresolvedSenderHandle: %@", v2, v3, v4, v5, v6);
}

- (void)removeInvitedHandles:presenceIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Inviting (or removing) handles isn't available when isPersonal is true", v2, v3, v4, v5, v6);
}

void __72__SKAPresenceClient_removeInvitedHandles_presenceIdentifier_completion___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Invitation revocation for handles %@ failed with error: %@");
}

void __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_61_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Unable to find or create channel for presenceIdentifier: %@", v2, v3, v4, v5, v6);
}

void __90__SKAPresenceClient_retainTransientSubscriptionAssertionForPresenceIdentifier_completion___block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9(&dword_22480C000, v0, v1, "Error retaining presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@ error: %@");
}

void __77__SKAPresenceClient_handleReceivedPresentDevicesUpdateForPresenceIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "XPC Error notifying client of present devices update. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __67__SKAPresenceClient_handleReceivedInvitationForPresenceIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "XPC Error notifying client of invitations update. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Unable to find channel for presenceIdentifier: %@", v2, v3, v4, v5, v6);
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_88_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) activeSubscriptionIdentifier];
  OUTLINED_FUNCTION_2();
  __int16 v8 = 2112;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_22480C000, a3, OS_LOG_TYPE_ERROR, "Error releasing presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@ error: %@", v7, 0x20u);
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_89_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9(&dword_22480C000, v0, v1, "Error retaining presence subscription assertion for subscriptionIdentifier: %@ presenceIdentifier: %@ error: %@");
}

void __60__SKAPresenceClient_refreshAssertionsForPresenceIdentifier___block_invoke_90_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Error retaining presence assertion for presenceIdentifier: %@ error: %@");
}

void __50__SKAPresenceClient_initialCloudKitImportReceived__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "XPC Error notifying client of initial cloud kit import. Error: %{public}@", v2, v3, v4, v5, v6);
}

@end