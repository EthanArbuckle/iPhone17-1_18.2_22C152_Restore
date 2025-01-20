@interface SKAStatusPublishingServiceClient
+ (id)_accountNotCapableError;
+ (id)_dateCreatedDriftError;
+ (id)_missingEntitlmentErrorForStatusTypeIdentifier:(id)a3;
+ (id)_noPersonalChannelErrorForStatusTypeIdentifier:(id)a3;
+ (id)_noUsersToShareWithError;
+ (id)_serverDisabledErrorForStatusTypeIdentifier:(id)a3;
+ (id)_unableToResolveSenderHandleError;
+ (id)logger;
- (NSString)description;
- (NSString)statusTypeIdenfifier;
- (OS_dispatch_queue)queue;
- (SKAChannelManaging)channelManager;
- (SKADatabaseManaging)databaseManager;
- (SKADatabaseProviding)databaseProvider;
- (SKAInvitationManager)invitationManager;
- (SKAMessagingProviding)messagingProvider;
- (SKAStatusPublishingManaging)publishingManager;
- (SKAStatusPublishingServiceClient)initWithXPCConnection:(id)a3 queue:(id)a4 delegate:(id)a5 databaseManager:(id)a6 invitationManager:(id)a7 publishingManager:(id)a8 channelManager:(id)a9;
- (SKAStatusPublishingServiceClientConnection)clientConnection;
- (SKAStatusPublishingServiceClientDelegate)delegate;
- (double)_delayForStatusPublishRequest:(id)a3;
- (double)_randomScheduledPublishDelay;
- (double)_randomSecondaryDeviceRepublishDelay;
- (double)_randomUnscheduledPublishDelay;
- (double)_scheduledPublishMaxDelayTime;
- (double)_secondaryDeviceRepublishMaxDelayTime;
- (double)_secondaryDeviceRepublishMinDelayTime;
- (double)_serverBagTimeIntervalForKey:(id)a3 withDefaultValue:(double)a4;
- (double)_unscheduledPublishMaxDelayTime;
- (id)_serverBagNumberForKey:(id)a3;
- (void)accountIsStatusKitCapableWithCompletion:(id)a3;
- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6;
- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withInvitationPayload:(id)a5 statusTypeIdentifier:(id)a6 completion:(id)a7;
- (void)invitedHandlesForStatusTypeIdentifier:(id)a3 completion:(id)a4;
- (void)isHandleInviteable:(id)a3 fromHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6;
- (void)isHandleInvited:(id)a3 fromSenderHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6;
- (void)provisionPayloads:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5;
- (void)publishStatusRequest:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5;
- (void)publishingServiceClientConnectionWasInterrupted:(id)a3;
- (void)publishingServiceClientConnectionWasInvalidated:(id)a3;
- (void)registerForDelegateCallbacksWithStatusTypeIdentifier:(id)a3 completion:(id)a4;
- (void)removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier:(id)a3 completion:(id)a4;
- (void)removeInvitedHandles:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5;
- (void)setChannelManager:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDatabaseProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInvitationManager:(id)a3;
- (void)setMessagingProvider:(id)a3;
- (void)setPublishingManager:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SKAStatusPublishingServiceClient

- (SKAStatusPublishingServiceClient)initWithXPCConnection:(id)a3 queue:(id)a4 delegate:(id)a5 databaseManager:(id)a6 invitationManager:(id)a7 publishingManager:(id)a8 channelManager:(id)a9
{
  id v25 = a3;
  v15 = a4;
  id v16 = a5;
  id v24 = a6;
  id v23 = a7;
  id v17 = a8;
  id v18 = a9;
  dispatch_assert_queue_V2(v15);
  v26.receiver = self;
  v26.super_class = (Class)SKAStatusPublishingServiceClient;
  v19 = [(SKAStatusPublishingServiceClient *)&v26 init];
  if (v19)
  {
    v20 = [[SKAStatusPublishingServiceClientConnection alloc] initWithXPCConnection:v25 queue:v15 daemonProtocolDelegate:v19 connectionLifecycleDelegate:v19];
    clientConnection = v19->_clientConnection;
    v19->_clientConnection = v20;

    objc_storeWeak((id *)&v19->_delegate, v16);
    objc_storeStrong((id *)&v19->_databaseManager, a6);
    objc_storeStrong((id *)&v19->_invitationManager, a7);
    objc_storeStrong((id *)&v19->_channelManager, a9);
    objc_storeStrong((id *)&v19->_publishingManager, a8);
    objc_storeStrong((id *)&v19->_queue, a4);
  }

  return v19;
}

+ (id)_missingEntitlmentErrorForStatusTypeIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = [NSString stringWithFormat:@"Client is not entitled to publish status of type \"%@\". Missing entitlement \"%@\", a3, @"com.apple.StatusKit.publish.types""];
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F79860];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v10[0] = v3;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v4 errorWithDomain:v5 code:-2000 userInfo:v6];

  return v7;
}

+ (id)_serverDisabledErrorForStatusTypeIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = [NSString stringWithFormat:@"Status of type \"%@\" is disabled by the server", a3];
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F79860];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v10[0] = v3;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v4 errorWithDomain:v5 code:-2100 userInfo:v6];

  return v7;
}

+ (id)_noPersonalChannelErrorForStatusTypeIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = [NSString stringWithFormat:@"Could not find or create a channel to publish status of type \"%@\".", a3];
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F79860];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v10[0] = v3;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v4 errorWithDomain:v5 code:-3000 userInfo:v6];

  return v7;
}

+ (id)_noUsersToShareWithError
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithFormat:@"Could not determine any users to share with from request"];
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F79860];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v2;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 errorWithDomain:v4 code:-4000 userInfo:v5];

  return v6;
}

+ (id)_accountNotCapableError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79860];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"System iCloud account does not exist or is not statuskit capable";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:-7000 userInfo:v4];

  return v5;
}

+ (id)_unableToResolveSenderHandleError
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithFormat:@"Could not determine sender handle to use"];
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F79860];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v2;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 errorWithDomain:v4 code:-8000 userInfo:v5];

  return v6;
}

+ (id)_dateCreatedDriftError
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithFormat:@"dateCreated of StatusPayload differs too much from server time"];
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F79860];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v2;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 errorWithDomain:v4 code:-9003 userInfo:v5];

  return v6;
}

- (void)publishingServiceClientConnectionWasInterrupted:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[SKAStatusPublishingServiceClient logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Publishing service client connection was interrupted: %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained publishingServiceClientWasInvalidated:self];
}

- (void)publishingServiceClientConnectionWasInvalidated:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[SKAStatusPublishingServiceClient logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Publishing service client connection was invalidated: %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained publishingServiceClientWasInvalidated:self];
}

+ (id)logger
{
  if (logger_onceToken_8 != -1) {
    dispatch_once(&logger_onceToken_8, &__block_literal_global_8);
  }
  v2 = (void *)logger__logger_8;
  return v2;
}

uint64_t __42__SKAStatusPublishingServiceClient_logger__block_invoke()
{
  logger__logger_8 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAStatusPublishingServiceClient");
  return MEMORY[0x270F9A758]();
}

- (void)publishStatusRequest:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, uint64_t))a5;
  v11 = +[SKAStatusPublishingServiceClient logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Received request to publish status: %@", buf, 0xCu);
  }

  v12 = [(SKAStatusPublishingServiceClient *)self clientConnection];
  char v13 = [v12 clientIsEntitledForPublishingWithStatusTypeIdentifier:v9];

  if ((v13 & 1) == 0)
  {
    v15 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v16 = +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v9];
    goto LABEL_12;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v9])
  {
    id v17 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v16 = +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:v9];
LABEL_12:
    v14 = (void *)v16;
    v10[2](v10, 0, v16);
    goto LABEL_13;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke;
  v18[3] = &unk_2646E1068;
  v22 = v10;
  id v19 = v8;
  v20 = self;
  id v21 = v9;
  [(SKAStatusPublishingServiceClient *)self accountIsStatusKitCapableWithCompletion:v18];

  v14 = v22;
LABEL_13:
}

void __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) statusUniqueIdentifier];

    if (!v3)
    {
      id v4 = [MEMORY[0x263F08C38] UUID];
      uint64_t v5 = [v4 UUIDString];
      [*(id *)(a1 + 32) setStatusUniqueIdentifier:v5];
    }
    v6 = [*(id *)(a1 + 40) channelManager];
    int v7 = [v6 serverTime];

    id v8 = [*(id *)(a1 + 32) dateCreated];

    if (!v8)
    {
      id v9 = +[SKAStatusPublishingServiceClient logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v27 = 138412546;
        uint64_t v28 = v10;
        __int16 v29 = 2112;
        v30 = v7;
        _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "dateCreated not set on statusPublishRequest:%@. Setting to serverTime: %@", (uint8_t *)&v27, 0x16u);
      }

      [*(id *)(a1 + 32) setDateCreated:v7];
    }
    v11 = [*(id *)(a1 + 32) dateCreated];
    [v11 timeIntervalSinceDate:v7];
    double v13 = v12;

    if (v13 <= 300.0)
    {
      [*(id *)(a1 + 40) _delayForStatusPublishRequest:*(void *)(a1 + 32)];
      double v25 = v24;
      objc_super v26 = [*(id *)(a1 + 40) publishingManager];
      [v26 removePendingPublishRequestsForStatusTypeIdentifier:*(void *)(a1 + 48) olderThanRequest:*(void *)(a1 + 32)];

      v22 = [*(id *)(a1 + 40) publishingManager];
      [v22 publishStatusRequest:*(void *)(a1 + 32) statusTypeIdentifier:*(void *)(a1 + 48) afterTime:0 isPendingPublish:*(void *)(a1 + 56) completion:v25];
    }
    else
    {
      v14 = +[SKAStatusPublishingServiceClient logger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
      }

      v22 = +[SKAStatusPublishingServiceClient _dateCreatedDriftError];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v23 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    int v7 = +[SKAStatusPublishingServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)provisionPayloads:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, uint64_t))a5;
  v11 = [(SKAStatusPublishingServiceClient *)self clientConnection];
  char v12 = [v11 clientIsEntitledForPublishingWithStatusTypeIdentifier:v9];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v9];
LABEL_8:
    uint64_t v15 = (void *)v13;
    v10[2](v10, 0, v13);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v9])
  {
    v14 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v13 = +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:v9];
    goto LABEL_8;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __86__SKAStatusPublishingServiceClient_provisionPayloads_statusTypeIdentifier_completion___block_invoke;
  v16[3] = &unk_2646E1068;
  uint64_t v19 = v10;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  [(SKAStatusPublishingServiceClient *)self accountIsStatusKitCapableWithCompletion:v16];

LABEL_9:
}

void __86__SKAStatusPublishingServiceClient_provisionPayloads_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) publishingManager];
    [v5 provisionPayloads:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v3 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    id v4 = +[SKAStatusPublishingServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)invitedHandlesForStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void, uint64_t))a4;
  id v8 = [(SKAStatusPublishingServiceClient *)self clientConnection];
  char v9 = [v8 clientIsEntitledForPublishingWithStatusTypeIdentifier:v6];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v6];
LABEL_8:
    char v12 = (void *)v10;
    v7[2](v7, 0, v10);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v6])
  {
    v11 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v10 = +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:v6];
    goto LABEL_8;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __85__SKAStatusPublishingServiceClient_invitedHandlesForStatusTypeIdentifier_completion___block_invoke;
  v13[3] = &unk_2646E1090;
  uint64_t v15 = v7;
  v13[4] = self;
  id v14 = v6;
  [(SKAStatusPublishingServiceClient *)self accountIsStatusKitCapableWithCompletion:v13];

LABEL_9:
}

void __85__SKAStatusPublishingServiceClient_invitedHandlesForStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) databaseManager];
    id v4 = (void *)[v3 newBackgroundContext];

    id v5 = [*(id *)(a1 + 32) databaseManager];
    id v6 = [v5 existingPersonalChannelForStatusTypeIdentifier:*(void *)(a1 + 40) databaseContext:v4];

    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = objc_msgSend(v6, "invitedUsers", 0);
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

      id v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      uint64_t v16 = +[SKAStatusPublishingServiceClient logger];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Personal channel does not exist for status type identifier", buf, 2u);
      }

      id v7 = +[SKAStatusPublishingServiceClient _noPersonalChannelErrorForStatusTypeIdentifier:*(void *)(a1 + 40)];
      id v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v14();
  }
  else
  {
    uint64_t v15 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    id v4 = +[SKAStatusPublishingServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)isHandleInvited:(id)a3 fromSenderHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, uint64_t))a6;
  id v14 = +[SKAStatusPublishingServiceClient logger];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Attempting to determine if handle %@ has already been invited from handle: %@", buf, 0x16u);
  }

  uint64_t v15 = [(SKAStatusPublishingServiceClient *)self clientConnection];
  char v16 = [v15 clientIsEntitledForPublishingWithStatusTypeIdentifier:v12];

  if ((v16 & 1) == 0)
  {
    uint64_t v18 = +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v12];
LABEL_10:
    long long v17 = (void *)v18;
    v13[2](v13, 0, v18);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v12])
  {
    long long v19 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v18 = +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:v12];
    goto LABEL_10;
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __104__SKAStatusPublishingServiceClient_isHandleInvited_fromSenderHandle_forStatusTypeIdentifier_completion___block_invoke;
  v20[3] = &unk_2646E10B8;
  double v24 = v13;
  v20[4] = self;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  [(SKAStatusPublishingServiceClient *)self accountIsStatusKitCapableWithCompletion:v20];

  long long v17 = v24;
LABEL_11:
}

void __104__SKAStatusPublishingServiceClient_isHandleInvited_fromSenderHandle_forStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) databaseManager];
    id v4 = (void *)[v3 newBackgroundContext];

    id v5 = [*(id *)(a1 + 32) databaseManager];
    id v6 = [v5 existingPersonalChannelForStatusTypeIdentifier:*(void *)(a1 + 40) databaseContext:v4];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) invitationManager];
      id v8 = [v7 resolveSenderHandleWithPreferredSenderHandle:*(void *)(a1 + 48)];

      if (!v8)
      {
        id v23 = +[SKAStatusPublishingServiceClient logger];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          __104__SKAStatusPublishingServiceClient_isHandleInvited_fromSenderHandle_forStatusTypeIdentifier_completion___block_invoke_cold_1(a1 + 48, v23, v24, v25, v26, v27, v28, v29);
        }

        v30 = +[SKAStatusPublishingServiceClient _unableToResolveSenderHandleError];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

        goto LABEL_33;
      }
      uint64_t v31 = v6;
      v32 = v4;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v9 = [v6 invitedUsers];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v34 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v15 = [v14 invitedSKHandle];
            if ([*(id *)(a1 + 56) isNormalizedEqualToHandle:v15])
            {
              char v16 = [v14 senderSKHandle];
              int v17 = [v8 isNormalizedEqualToHandle:v16];
              uint64_t v18 = +[SKAStatusPublishingServiceClient logger];
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
                v38 = v16;
                __int16 v39 = 2112;
                v40 = v8;
                _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "We found an existing invited user matching the requested user, but that invitation was sent with handle %@ instead of handle %@. Ignoring.", buf, 0x16u);
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      uint64_t v9 = +[SKAStatusPublishingServiceClient logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "We did not find a match to any existing invited user", buf, 2u);
      }
LABEL_31:
      id v6 = v31;
      id v4 = v32;

      id v22 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      id v21 = +[SKAStatusPublishingServiceClient logger];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v21, OS_LOG_TYPE_DEFAULT, "Personal channel does not exist for status type identifier", buf, 2u);
      }

      id v8 = +[SKAStatusPublishingServiceClient _noPersonalChannelErrorForStatusTypeIdentifier:*(void *)(a1 + 40)];
      id v22 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    v22();
LABEL_33:

    goto LABEL_34;
  }
  long long v20 = +[SKAStatusPublishingServiceClient logger];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
  }

  id v4 = +[SKAStatusPublishingServiceClient _accountNotCapableError];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_34:
}

- (void)isHandleInviteable:(id)a3 fromHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, uint64_t))a6;
  id v14 = [(SKAStatusPublishingServiceClient *)self clientConnection];
  char v15 = [v14 clientIsEntitledForPublishingWithStatusTypeIdentifier:v12];

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v12];
LABEL_8:
    uint64_t v18 = (void *)v16;
    v13[2](v13, 0, v16);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v12])
  {
    int v17 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v16 = +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:v12];
    goto LABEL_8;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __101__SKAStatusPublishingServiceClient_isHandleInviteable_fromHandle_forStatusTypeIdentifier_completion___block_invoke;
  v19[3] = &unk_2646E1068;
  id v22 = v13;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  [(SKAStatusPublishingServiceClient *)self accountIsStatusKitCapableWithCompletion:v19];

LABEL_9:
}

void __101__SKAStatusPublishingServiceClient_isHandleInviteable_fromHandle_forStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) invitationManager];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __101__SKAStatusPublishingServiceClient_isHandleInviteable_fromHandle_forStatusTypeIdentifier_completion___block_invoke_33;
    v8[3] = &unk_2646E1040;
    id v9 = *(id *)(a1 + 56);
    [v3 isHandleInviteable:v4 fromHandle:v5 completion:v8];

    id v6 = v9;
  }
  else
  {
    id v7 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    id v6 = +[SKAStatusPublishingServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __101__SKAStatusPublishingServiceClient_isHandleInviteable_fromHandle_forStatusTypeIdentifier_completion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchHandleInvitability:(id)a3 fromHandle:(id)a4 forStatusTypeIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, uint64_t))a6;
  id v14 = [(SKAStatusPublishingServiceClient *)self clientConnection];
  char v15 = [v14 clientIsEntitledForPublishingWithStatusTypeIdentifier:v12];

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v12];
LABEL_8:
    uint64_t v18 = (void *)v16;
    v13[2](v13, 0, v16);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v12])
  {
    int v17 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v16 = +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:v12];
    goto LABEL_8;
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __106__SKAStatusPublishingServiceClient_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke;
  v19[3] = &unk_2646E10B8;
  id v23 = v13;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  [(SKAStatusPublishingServiceClient *)self accountIsStatusKitCapableWithCompletion:v19];

LABEL_9:
}

void __106__SKAStatusPublishingServiceClient_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) invitationManager];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __106__SKAStatusPublishingServiceClient_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke_35;
    v9[3] = &unk_2646E10E0;
    uint64_t v6 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    [v3 fetchHandleInvitability:v4 fromHandle:v5 forStatusTypeIdentifier:v6 completion:v9];

    id v7 = v10;
  }
  else
  {
    id v8 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    id v7 = +[SKAStatusPublishingServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __106__SKAStatusPublishingServiceClient_fetchHandleInvitability_fromHandle_forStatusTypeIdentifier_completion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)inviteHandles:(id)a3 fromSenderHandle:(id)a4 withInvitationPayload:(id)a5 statusTypeIdentifier:(id)a6 completion:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, uint64_t))a7;
  int v17 = +[SKAStatusPublishingServiceClient logger];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v15;
    __int16 v31 = 2112;
    id v32 = v12;
    _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Received request to send invitation for personal channel with statusTypeIdentifier %@ to handles: %@", buf, 0x16u);
  }

  uint64_t v18 = [(SKAStatusPublishingServiceClient *)self clientConnection];
  char v19 = [v18 clientIsEntitledForPublishingWithStatusTypeIdentifier:v15];

  if ((v19 & 1) == 0)
  {
    uint64_t v21 = +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v15];
LABEL_10:
    id v20 = (void *)v21;
    v16[2](v16, v21);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v15])
  {
    id v22 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v21 = +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:v15];
    goto LABEL_10;
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke;
  v23[3] = &unk_2646E1130;
  uint64_t v28 = v16;
  v23[4] = self;
  id v24 = v15;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  [(SKAStatusPublishingServiceClient *)self accountIsStatusKitCapableWithCompletion:v23];

  id v20 = v28;
LABEL_11:
}

void __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) invitationManager];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke_37;
    v10[3] = &unk_2646E1108;
    id v12 = *(id *)(a1 + 72);
    id v11 = *(id *)(a1 + 48);
    [v3 sendInvitationForPersonalChannelWithStatusTypeIdentifier:v4 toHandles:v5 fromSenderHandle:v6 withInvitationPayload:v7 completion:v10];

    id v8 = v12;
  }
  else
  {
    id v9 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    id v8 = +[SKAStatusPublishingServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke_37(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[SKAStatusPublishingServiceClient logger];
  uint64_t v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke_37_cold_1();
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
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

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

- (void)removeInvitedHandles:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, uint64_t))a5;
  uint64_t v11 = +[SKAStatusPublishingServiceClient logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Received request to remove invitation from personal channel with statusTypeIdentifier %@ for handles: %@", buf, 0x16u);
  }

  uint64_t v12 = [(SKAStatusPublishingServiceClient *)self clientConnection];
  char v13 = [v12 clientIsEntitledForPublishingWithStatusTypeIdentifier:v9];

  if ((v13 & 1) == 0)
  {
    uint64_t v15 = +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v9];
LABEL_10:
    id v14 = (void *)v15;
    v10[2](v10, v15);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v9])
  {
    uint64_t v16 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v15 = +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:v9];
    goto LABEL_10;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke;
  v17[3] = &unk_2646E1068;
  id v20 = v10;
  v17[4] = self;
  id v18 = v9;
  id v19 = v8;
  [(SKAStatusPublishingServiceClient *)self accountIsStatusKitCapableWithCompletion:v17];

  id v14 = v20;
LABEL_11:
}

void __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) invitationManager];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 48);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke_38;
    v8[3] = &unk_2646E1158;
    id v9 = v4;
    id v10 = *(id *)(a1 + 56);
    [v3 revokeInvitationFromPersonalChannelWithStatusTypeIdentifier:v5 forHandles:v9 completion:v8];

    uint64_t v6 = v9;
  }
  else
  {
    uint64_t v7 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v6 = +[SKAStatusPublishingServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[SKAStatusPublishingServiceClient logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke_38_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Invitation revocation for handles %@ completed successfully", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t))a4;
  uint64_t v8 = +[SKAStatusPublishingServiceClient logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Received request to remove all invitations from personal channel with statusTypeIdentifier %@", buf, 0xCu);
  }

  uint64_t v9 = [(SKAStatusPublishingServiceClient *)self clientConnection];
  char v10 = [v9 clientIsEntitledForPublishingWithStatusTypeIdentifier:v6];

  if ((v10 & 1) == 0)
  {
    uint64_t v12 = +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v6];
LABEL_10:
    uint64_t v11 = (void *)v12;
    v7[2](v7, v12);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v6])
  {
    char v13 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v12 = +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:v6];
    goto LABEL_10;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke;
  v14[3] = &unk_2646E1090;
  uint64_t v16 = v7;
  v14[4] = self;
  id v15 = v6;
  [(SKAStatusPublishingServiceClient *)self accountIsStatusKitCapableWithCompletion:v14];

  uint64_t v11 = v16;
LABEL_11:
}

void __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) invitationManager];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_40;
    v7[3] = &unk_2646E0DF0;
    uint64_t v4 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    [v3 revokeAllInvitationsFromPersonalChannelWithStatusTypeIdentifier:v4 completion:v7];

    uint64_t v5 = v8;
  }
  else
  {
    id v6 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v5 = +[SKAStatusPublishingServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_40(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[SKAStatusPublishingServiceClient logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_40_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Invitation revocation for all handles completed successfully", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerForDelegateCallbacksWithStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(SKAStatusPublishingServiceClient *)self clientConnection];
  char v9 = [v8 clientIsEntitledForPublishingWithStatusTypeIdentifier:v6];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = +[SKAStatusPublishingServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v6];
LABEL_8:
    uint64_t v12 = (void *)v10;
    v7[2](v7, v10);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v6])
  {
    uint64_t v11 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v10 = +[SKAStatusPublishingServiceClient _serverDisabledErrorForStatusTypeIdentifier:v6];
    goto LABEL_8;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __100__SKAStatusPublishingServiceClient_registerForDelegateCallbacksWithStatusTypeIdentifier_completion___block_invoke;
  v13[3] = &unk_2646E1090;
  id v15 = v7;
  v13[4] = self;
  id v14 = v6;
  [(SKAStatusPublishingServiceClient *)self accountIsStatusKitCapableWithCompletion:v13];

LABEL_9:
}

void __100__SKAStatusPublishingServiceClient_registerForDelegateCallbacksWithStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    uint64_t v4 = [*(id *)(a1 + 40) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v4;

    objc_sync_exit(v3);
    int v7 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Client %@ has registered for delegate callbacks for statusTypeIdentifier: %@.", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v10 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v11 = +[SKAStatusPublishingServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ PID=%ld>", v5, -[SKAStatusPublishingServiceClientConnection processIdentifier](self->_clientConnection, "processIdentifier")];

  return (NSString *)v6;
}

- (void)accountIsStatusKitCapableWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(SKAStatusPublishingServiceClient *)v5 databaseManager];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __76__SKAStatusPublishingServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke;
  v8[3] = &unk_2646E0CD8;
  void v8[4] = v5;
  id v7 = v4;
  id v9 = v7;
  [v6 deviceToDeviceEncryptedDatabaseCapableWithCompletion:v8];

  objc_sync_exit(v5);
}

void __76__SKAStatusPublishingServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __76__SKAStatusPublishingServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke_2;
  v5[3] = &unk_2646E1180;
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __76__SKAStatusPublishingServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)_serverBagNumberForKey:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  uint64_t v5 = [v4 objectForKey:v3];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      goto LABEL_8;
    }
    char v7 = +[SKAStatusPublishingServiceClient logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient _serverBagNumberForKey:]();
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (double)_serverBagTimeIntervalForKey:(id)a3 withDefaultValue:(double)a4
{
  uint64_t v5 = [(SKAStatusPublishingServiceClient *)self _serverBagNumberForKey:a3];
  id v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    a4 = v7;
  }

  return a4;
}

- (double)_scheduledPublishMaxDelayTime
{
  [(SKAStatusPublishingServiceClient *)self _serverBagTimeIntervalForKey:@"shared-channels-scheduled-publish-variance-max-slop-period-seconds" withDefaultValue:20.0];
  return result;
}

- (double)_unscheduledPublishMaxDelayTime
{
  [(SKAStatusPublishingServiceClient *)self _serverBagTimeIntervalForKey:@"shared-channels-unscheduled-publish-variance-max-slop-period-seconds" withDefaultValue:0.0];
  return result;
}

- (double)_randomScheduledPublishDelay
{
  [(SKAStatusPublishingServiceClient *)self _scheduledPublishMaxDelayTime];
  return (double)arc4random_uniform(v2);
}

- (double)_randomUnscheduledPublishDelay
{
  [(SKAStatusPublishingServiceClient *)self _unscheduledPublishMaxDelayTime];
  return (double)arc4random_uniform(v2);
}

- (double)_secondaryDeviceRepublishMaxDelayTime
{
  [(SKAStatusPublishingServiceClient *)self _serverBagTimeIntervalForKey:@"shared-channels-secondary-device-republish-variance-min-slop-period-seconds" withDefaultValue:30.0];
  return result;
}

- (double)_secondaryDeviceRepublishMinDelayTime
{
  [(SKAStatusPublishingServiceClient *)self _serverBagTimeIntervalForKey:@"shared-channels-secondary-device-republish-variance-min-slop-period-seconds" withDefaultValue:20.0];
  return result;
}

- (double)_randomSecondaryDeviceRepublishDelay
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(SKAStatusPublishingServiceClient *)self _secondaryDeviceRepublishMaxDelayTime];
  double v4 = v3;
  [(SKAStatusPublishingServiceClient *)self _secondaryDeviceRepublishMinDelayTime];
  double v6 = v5;
  double v7 = v5 + (double)arc4random_uniform((v4 - v5));
  uint64_t v8 = +[SKAStatusPublishingServiceClient logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218496;
    double v11 = v7;
    __int16 v12 = 2048;
    double v13 = v6;
    __int16 v14 = 2048;
    double v15 = v4;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Resolved secondary device republish delay of %.1f seconds, within allowed range of (%.1f,%.1f) seconds.", (uint8_t *)&v10, 0x20u);
  }

  return v7;
}

- (double)_delayForStatusPublishRequest:(id)a3
{
  id v4 = a3;
  if ([v4 isSecondaryDeviceRepublish])
  {
    [(SKAStatusPublishingServiceClient *)self _randomSecondaryDeviceRepublishDelay];
  }
  else if ([v4 isScheduledRequest])
  {
    [(SKAStatusPublishingServiceClient *)self _randomScheduledPublishDelay];
  }
  else
  {
    [(SKAStatusPublishingServiceClient *)self _randomUnscheduledPublishDelay];
  }
  double v6 = v5;

  return v6;
}

- (NSString)statusTypeIdenfifier
{
  return self->_statusTypeIdenfifier;
}

- (SKAStatusPublishingServiceClientConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
}

- (SKAStatusPublishingServiceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKAStatusPublishingServiceClientDelegate *)WeakRetained;
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

- (SKADatabaseProviding)databaseProvider
{
  return self->_databaseProvider;
}

- (void)setDatabaseProvider:(id)a3
{
}

- (SKAMessagingProviding)messagingProvider
{
  return self->_messagingProvider;
}

- (void)setMessagingProvider:(id)a3
{
}

- (SKAInvitationManager)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
}

- (SKAChannelManaging)channelManager
{
  return self->_channelManager;
}

- (void)setChannelManager:(id)a3
{
}

- (SKAStatusPublishingManaging)publishingManager
{
  return self->_publishingManager;
}

- (void)setPublishingManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_publishingManager, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_messagingProvider, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_statusTypeIdenfifier, 0);
}

- (void)publishStatusRequest:statusTypeIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Status type %@ disabled by server.", v2, v3, v4, v5, v6);
}

- (void)publishStatusRequest:statusTypeIdentifier:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Rejecting publish request, client is not entitled", v2, v3, v4, v5, v6);
}

void __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22480C000, a1, a3, "dateCreated time differs too much from server time.  delta = %f", a5, a6, a7, a8, 0);
}

void __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Account is not StatusKit capable", v2, v3, v4, v5, v6);
}

void __104__SKAStatusPublishingServiceClient_isHandleInvited_fromSenderHandle_forStatusTypeIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __121__SKAStatusPublishingServiceClient_inviteHandles_fromSenderHandle_withInvitationPayload_statusTypeIdentifier_completion___block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Failed to send invitation to handles with error: %@", v2, v3, v4, v5, v6);
}

void __89__SKAStatusPublishingServiceClient_removeInvitedHandles_statusTypeIdentifier_completion___block_invoke_38_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4(&dword_22480C000, a2, a3, "Invitation revocation for handles %@ failed with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __114__SKAStatusPublishingServiceClient_removeAllInvitedHandlesFromPersonalChannelWithStatusTypeIdentifier_completion___block_invoke_40_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Invitation revocation for all handles failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_serverBagNumberForKey:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Server bag unexpected value type for key \"%@\". Value: %@");
}

@end