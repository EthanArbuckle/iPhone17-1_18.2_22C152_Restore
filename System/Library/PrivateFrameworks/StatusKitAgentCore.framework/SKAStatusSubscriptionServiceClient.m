@interface SKAStatusSubscriptionServiceClient
+ (id)_accountNotCapableError;
+ (id)_genericMissingSubscriptionEntitlmentError;
+ (id)_inTrafficError;
+ (id)_missingEntitlmentErrorForStatusTypeIdentifier:(id)a3;
+ (id)_serverDisabledErrorForStatusTypeIdentifier:(id)a3;
+ (id)_subscriptionIdentifierNotFoundError:(id)a3;
+ (id)logger;
- (BOOL)_validateChannelIsKnownForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5;
- (BOOL)channelMatchesClientStatusTypeIdentifier:(id)a3;
- (BOOL)trafficModeEnabled;
- (NSString)statusTypeIdenfifier;
- (OS_dispatch_queue)queue;
- (SKADatabaseManaging)databaseManager;
- (SKAStatusEncryptionManaging)encryptionManager;
- (SKAStatusSubscriptionManaging)subscriptionManager;
- (SKAStatusSubscriptionServiceClient)initWithXPCConnection:(id)a3 queue:(id)a4 delegate:(id)a5 databaseManager:(id)a6 subscriptionManager:(id)a7 encryptionManager:(id)a8 inTrafficMode:(BOOL)a9;
- (SKAStatusSubscriptionServiceClientConnection)clientConnection;
- (SKAStatusSubscriptionServiceClientDelegate)delegate;
- (id)_currentStatusForChannel:(id)a3;
- (id)_handlesAssociatedWithChannel:(id)a3;
- (id)_subscriptionMetadataForChannel:(id)a3;
- (int64_t)validatePersonalChannel:(id)a3 matchesEncryptionValidationToken:(id)a4 fromSender:(id)a5;
- (int64_t)validatePersonalChannel:(id)a3 matchesSubscriptionValidationToken:(id)a4 fromSender:(id)a5;
- (void)accountIsStatusKitCapableWithCompletion:(id)a3;
- (void)allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5;
- (void)allSubscriptionMetadatasForStatusTypeIdentifier:(id)a3 includingPersonalSubscription:(BOOL)a4 completion:(id)a5;
- (void)allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier:(id)a3 completion:(id)a4;
- (void)allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier:(id)a3 completion:(id)a4;
- (void)deleteSubscriptionWithIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5;
- (void)handleReceivedInvitationForChannel:(id)a3;
- (void)handleReceivedStatusUpdate:(id)a3 onChannel:(id)a4;
- (void)handleRemoteDatabaseChangeForChannels:(id)a3;
- (void)registerForDelegateCallbacksWithStatusTypeIdentifier:(id)a3 completion:(id)a4;
- (void)releasePersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6;
- (void)releaseTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5;
- (void)retainPersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6;
- (void)retainTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5;
- (void)setClientConnection:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncryptionManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSubscriptionManager:(id)a3;
- (void)setTrafficModeEnabled:(BOOL)a3;
- (void)subscriptionMetadataForHandle:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5;
- (void)subscriptionMetadataForPersonalSubscriptionWithStatusTypeIdentifier:(id)a3 completion:(id)a4;
- (void)subscriptionServiceClientConnectionWasInterrupted:(id)a3;
- (void)subscriptionServiceClientConnectionWasInvalidated:(id)a3;
- (void)subscriptionValidationTokensForHandle:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5;
- (void)validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:(id)a3 fromSender:(id)a4 statusTypeIdentifier:(id)a5 completion:(id)a6;
@end

@implementation SKAStatusSubscriptionServiceClient

- (SKAStatusSubscriptionServiceClient)initWithXPCConnection:(id)a3 queue:(id)a4 delegate:(id)a5 databaseManager:(id)a6 subscriptionManager:(id)a7 encryptionManager:(id)a8 inTrafficMode:(BOOL)a9
{
  id v15 = a3;
  v16 = a4;
  id v17 = a5;
  id v24 = a6;
  id v18 = a7;
  id v19 = a8;
  dispatch_assert_queue_V2(v16);
  v25.receiver = self;
  v25.super_class = (Class)SKAStatusSubscriptionServiceClient;
  v20 = [(SKAStatusSubscriptionServiceClient *)&v25 init];
  if (v20)
  {
    v21 = [[SKAStatusSubscriptionServiceClientConnection alloc] initWithXPCConnection:v15 queue:v16 daemonProtocolDelegate:v20 connectionLifecycleDelegate:v20];
    clientConnection = v20->_clientConnection;
    v20->_clientConnection = v21;

    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_databaseManager, a6);
    objc_storeStrong((id *)&v20->_subscriptionManager, a7);
    objc_storeStrong((id *)&v20->_encryptionManager, a8);
    objc_storeStrong((id *)&v20->_queue, a4);
    v20->_trafficModeEnabled = a9;
  }

  return v20;
}

+ (id)_missingEntitlmentErrorForStatusTypeIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = [NSString stringWithFormat:@"Client is not entitled to subscription information for status of type \"%@\". Missing entitlement \"%@\", a3, @"com.apple.StatusKit.subscribe.types""];
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F79868];
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
  uint64_t v5 = *MEMORY[0x263F79868];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v10[0] = v3;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v4 errorWithDomain:v5 code:-2100 userInfo:v6];

  return v7;
}

+ (id)_genericMissingSubscriptionEntitlmentError
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [NSString stringWithFormat:@"Client is not entitled to subscription information for status. Missing entitlement \"%@\", @"com.apple.StatusKit.subscribe.types""];
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F79868];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = v2;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 errorWithDomain:v4 code:-2000 userInfo:v5];

  return v6;
}

+ (id)_accountNotCapableError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79868];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"System iCloud account does not exist or is not statuskit capable";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:-4000 userInfo:v4];

  return v5;
}

+ (id)_inTrafficError
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F79868];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"Traffic mode is enable and status access is unavailable";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:-5000 userInfo:v4];

  return v5;
}

+ (id)_subscriptionIdentifierNotFoundError:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSString stringWithFormat:@"Subscription not found matching subscription identifier: \"%@\"", a3];
  uint64_t v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F79868];
  uint64_t v9 = *MEMORY[0x263F07F80];
  v10[0] = v3;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v4 errorWithDomain:v5 code:-3000 userInfo:v6];

  return v7;
}

+ (id)logger
{
  if (logger_onceToken_9 != -1) {
    dispatch_once(&logger_onceToken_9, &__block_literal_global_9);
  }
  v2 = (void *)logger__logger_9;
  return v2;
}

uint64_t __44__SKAStatusSubscriptionServiceClient_logger__block_invoke()
{
  logger__logger_9 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAStatusSubscriptionServiceClient");
  return MEMORY[0x270F9A758]();
}

- (void)handleRemoteDatabaseChangeForChannels:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if ([(SKAStatusSubscriptionServiceClient *)self channelMatchesClientStatusTypeIdentifier:v11])
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v5;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = -[SKAStatusSubscriptionServiceClient _subscriptionMetadataForChannel:](self, "_subscriptionMetadataForChannel:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v15);
    }

    id v19 = [(SKAStatusSubscriptionServiceClientConnection *)self->_clientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:&__block_literal_global_29];
    v20 = [v12 array];
    [v19 subscriptionStateChangedForSubscriptions:v20 completion:&__block_literal_global_33];
  }
}

void __76__SKAStatusSubscriptionServiceClient_handleRemoteDatabaseChangeForChannels___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__SKAStatusSubscriptionServiceClient_handleRemoteDatabaseChangeForChannels___block_invoke_cold_1();
  }
}

void __76__SKAStatusSubscriptionServiceClient_handleRemoteDatabaseChangeForChannels___block_invoke_31()
{
  v0 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22480C000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of remote database changes.", v1, 2u);
  }
}

- (void)handleReceivedStatusUpdate:(id)a3 onChannel:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([(SKAStatusSubscriptionServiceClient *)self channelMatchesClientStatusTypeIdentifier:v5])
  {
    id v6 = [(SKAStatusSubscriptionServiceClient *)self _subscriptionMetadataForChannel:v5];
    uint64_t v7 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Notifying client of updated subscription: %@", (uint8_t *)&v10, 0xCu);
    }

    if (v6)
    {
      uint64_t v8 = [(SKAStatusSubscriptionServiceClientConnection *)self->_clientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:&__block_literal_global_35];
      [v8 subscriptionReceivedStatusUpdate:v6 completion:&__block_literal_global_38];
LABEL_8:
    }
  }
  else
  {
    id v6 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      statusTypeIdenfifier = self->_statusTypeIdenfifier;
      uint64_t v8 = [v5 statusType];
      int v10 = 138412546;
      uint64_t v11 = statusTypeIdenfifier;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Connected client does not match status type identifier of changed subscription. Client: %@ Status: %@", (uint8_t *)&v10, 0x16u);
      goto LABEL_8;
    }
  }
}

void __75__SKAStatusSubscriptionServiceClient_handleReceivedStatusUpdate_onChannel___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__SKAStatusSubscriptionServiceClient_handleReceivedStatusUpdate_onChannel___block_invoke_cold_1();
  }
}

void __75__SKAStatusSubscriptionServiceClient_handleReceivedStatusUpdate_onChannel___block_invoke_36()
{
  v0 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22480C000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of status update.", v1, 2u);
  }
}

- (void)handleReceivedInvitationForChannel:(id)a3
{
  id v4 = a3;
  if ([(SKAStatusSubscriptionServiceClient *)self channelMatchesClientStatusTypeIdentifier:v4])
  {
    id v5 = [(SKAStatusSubscriptionServiceClientConnection *)self->_clientConnection asynchronousRemoteDaemonDelegateWithErrorHandler:&__block_literal_global_40];
    id v6 = [(SKAStatusSubscriptionServiceClient *)self _subscriptionMetadataForChannel:v4];
    uint64_t v7 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Notifying connected client of received channel invitation.", buf, 2u);
    }

    [v5 subscriptionInvitationReceived:v6 completion:&__block_literal_global_43];
  }
  else
  {
    id v5 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Connected client does not match invited channel status type.", v8, 2u);
    }
  }
}

void __73__SKAStatusSubscriptionServiceClient_handleReceivedInvitationForChannel___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__SKAStatusSubscriptionServiceClient_handleReceivedInvitationForChannel___block_invoke_cold_1();
  }
}

void __73__SKAStatusSubscriptionServiceClient_handleReceivedInvitationForChannel___block_invoke_41()
{
  v0 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22480C000, v0, OS_LOG_TYPE_DEFAULT, "Connected client completed processing of channel invitation.", v1, 2u);
  }
}

- (id)_subscriptionMetadataForChannel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v4 statusType];
  uint64_t v7 = [v4 isPersonal];
  uint64_t v8 = [(SKAStatusSubscriptionServiceClient *)self _currentStatusForChannel:v4];
  uint64_t v9 = [(SKAStatusSubscriptionServiceClient *)self _handlesAssociatedWithChannel:v4];

  int v10 = (void *)[objc_alloc(MEMORY[0x263F79840]) initWithSubscriptionIdentifier:v5 statusTypeIdentifier:v6 isPersonalStatusSubscription:v7 currentStatus:v8 ownerHandles:v9];
  return v10;
}

- (id)_handlesAssociatedWithChannel:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isPersonal])
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v6 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
    uint64_t v7 = [(SKADatabaseManaging *)self->_databaseManager receivedInvitationsForChannel:v4 databaseContext:v6];
    id v8 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "senderSKHandle", (void)v16);
          if (v14) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    id v5 = [v8 array];
  }
  return v5;
}

- (id)_currentStatusForChannel:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  id v6 = [(SKADatabaseManaging *)self->_databaseManager existingStatusForChannel:v4 databaseContext:v5];
  uint64_t v7 = v6;
  if (!v6)
  {
    id v8 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "No existing status for channel";
      uint64_t v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    uint64_t v11 = 0;
    goto LABEL_10;
  }
  if ([v6 isExpired])
  {
    id v8 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = 0;
      id v9 = "Current status for channel is expired";
      uint64_t v10 = (uint8_t *)&v23;
LABEL_7:
      _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  long long v19 = [v7 uniqueIdentifier];
  uint64_t v12 = [v7 datePublished];
  v20 = [v7 dateReceived];
  id v13 = [v7 dateCreated];
  uint64_t v21 = [v7 rawData];
  uint64_t v14 = [(SKAStatusEncryptionManaging *)self->_encryptionManager decryptStatusPayloadFromStatusEnvelopeData:v21 channel:v4];
  uint64_t v15 = [v14 statusPayload];
  long long v16 = [v14 invitation];
  long long v17 = [v16 skInvitationPayload];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F79818]) initWithStatusPayload:v15 statusUniqueIdentifier:v19 datePublished:v12 dateCreated:v13 dateReceived:v20 invitationPayload:v17];

LABEL_10:
  return v11;
}

- (BOOL)channelMatchesClientStatusTypeIdentifier:(id)a3
{
  id v4 = [a3 statusType];
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = v5->_statusTypeIdenfifier;
  objc_sync_exit(v5);

  if (-[NSString length](v6, "length") || [v4 length]) {
    char v7 = [v4 isEqualToString:v6];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)subscriptionServiceClientConnectionWasInterrupted:(id)a3
{
  id v4 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Beginning release of transient subscription assertions associated with interrupted client", v6, 2u);
  }

  [(SKAStatusSubscriptionManaging *)self->_subscriptionManager releaseAllTransientSubscriptionAssertionsAssociatedWithClient:self completion:&__block_literal_global_47];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained subscriptionServiceClientWasInvalidated:self];
}

void __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInterrupted___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[SKAStatusSubscriptionServiceClient logger];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInterrupted___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing transient subscription assertions associated with interrupted client", v5, 2u);
  }
}

- (void)subscriptionServiceClientConnectionWasInvalidated:(id)a3
{
  id v4 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Beginning release of transient subscription assertions associated with invalidated client", v6, 2u);
  }

  [(SKAStatusSubscriptionManaging *)self->_subscriptionManager releaseAllTransientSubscriptionAssertionsAssociatedWithClient:self completion:&__block_literal_global_49];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained subscriptionServiceClientWasInvalidated:self];
}

void __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInvalidated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[SKAStatusSubscriptionServiceClient logger];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInvalidated___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Success releasing transient subscription assertions associated with invalidated client", v5, 2u);
  }
}

- (void)subscriptionMetadataForHandle:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, uint64_t))a5;
  uint64_t v11 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v12 = [v11 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v9];

  if ((v12 & 1) == 0)
  {
    uint64_t v14 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient subscriptionMetadataForHandle:statusTypeIdentifier:completion:]();
    }

    uint64_t v15 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v9];
    goto LABEL_10;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v9])
  {
    long long v16 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v15 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v9];
LABEL_10:
    id v13 = (void *)v15;
    v10[2](v10, 0, v15);
    goto LABEL_11;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __100__SKAStatusSubscriptionServiceClient_subscriptionMetadataForHandle_statusTypeIdentifier_completion___block_invoke;
  v17[3] = &unk_2646E1068;
  uint64_t v21 = v10;
  id v18 = v8;
  long long v19 = self;
  id v20 = v9;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v17];

  id v13 = v21;
LABEL_11:
}

void __100__SKAStatusSubscriptionServiceClient_subscriptionMetadataForHandle_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = +[SKAStatusSubscriptionServiceClient logger];
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 32);
      int v16 = 138412290;
      long long v17 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving subscription information for handle: %@", (uint8_t *)&v16, 0xCu);
    }

    char v7 = [*(id *)(a1 + 40) databaseManager];
    id v8 = (void *)[v7 newBackgroundContext];

    id v9 = [*(id *)(a1 + 40) databaseManager];
    uint64_t v10 = [v9 existingChannelForHandle:*(void *)(a1 + 32) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:v8];

    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 40) _subscriptionMetadataForChannel:v10];
      char v12 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v16 = 138412546;
        long long v17 = v11;
        __int16 v18 = 2112;
        uint64_t v19 = v13;
        _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Found subscription metadata: %@ for handle %@", (uint8_t *)&v16, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      uint64_t v14 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void **)(a1 + 32);
        int v16 = 138412290;
        long long v17 = v15;
        _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Subscription information not found for handle: %@", (uint8_t *)&v16, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    id v8 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)allSubscriptionMetadatasForStatusTypeIdentifier:(id)a3 includingPersonalSubscription:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, uint64_t))a5;
  uint64_t v10 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v11 = [v10 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v8];

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient subscriptionMetadataForHandle:statusTypeIdentifier:completion:]();
    }

    uint64_t v14 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v8];
    goto LABEL_10;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v8])
  {
    uint64_t v15 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v14 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v8];
LABEL_10:
    char v12 = (void *)v14;
    v9[2](v9, 0, v14);
    goto LABEL_11;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __127__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasForStatusTypeIdentifier_includingPersonalSubscription_completion___block_invoke;
  v16[3] = &unk_2646E11C8;
  uint64_t v19 = v9;
  id v17 = v8;
  __int16 v18 = self;
  BOOL v20 = a4;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v16];

  char v12 = v19;
LABEL_11:
}

void __127__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasForStatusTypeIdentifier_includingPersonalSubscription_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = +[SKAStatusSubscriptionServiceClient logger];
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving all subscription information for statusTypeIdentifier: %@", buf, 0xCu);
    }

    char v7 = [*(id *)(a1 + 40) databaseManager];
    id v8 = (void *)[v7 newBackgroundContext];

    id v9 = [*(id *)(a1 + 40) databaseManager];
    uint64_t v10 = [v9 allExistingChannelsForStatusTypeIdentifier:*(void *)(a1 + 32) includingPersonalChannel:*(unsigned __int8 *)(a1 + 56) databaseContext:v8];

    char v11 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v10 count];
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Found %ld channels for status type %@", buf, 0x16u);
    }

    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          BOOL v20 = objc_msgSend(*(id *)(a1 + 40), "_subscriptionMetadataForChannel:", *(void *)(*((void *)&v21 + 1) + 8 * v19), (void)v21);
          [v14 addObject:v20];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v17);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    id v8 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, void, uint64_t))a4;
  id v8 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v9 = [v8 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v6];

  if ((v9 & 1) == 0)
  {
    char v11 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient subscriptionMetadataForHandle:statusTypeIdentifier:completion:]();
    }

    uint64_t v12 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v6];
    goto LABEL_10;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v6])
  {
    uint64_t v13 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v12 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v6];
LABEL_10:
    uint64_t v10 = (void *)v12;
    v7[2](v7, 0, v12);
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __117__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke;
  v14[3] = &unk_2646E1090;
  uint64_t v17 = v7;
  id v15 = v6;
  uint64_t v16 = self;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v14];

  uint64_t v10 = v17;
LABEL_11:
}

void __117__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = +[SKAStatusSubscriptionServiceClient logger];
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving all active assertions for statusTypeIdentifier: %@", buf, 0xCu);
    }

    char v7 = [*(id *)(a1 + 40) subscriptionManager];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __117__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke_52;
    v11[3] = &unk_2646E11F0;
    int8x16_t v10 = *(int8x16_t *)(a1 + 32);
    id v8 = (id)v10.i64[0];
    int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
    id v13 = *(id *)(a1 + 48);
    [v7 allSubscriptionIdentifiersWithActiveAssertionsForStatusTypeIdentifier:v8 completion:v11];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    char v9 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __117__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveAssertionsForStatusTypeIdentifier_completion___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) databaseManager];
  id v5 = (void *)[v4 newBackgroundContext];

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        id v13 = objc_msgSend(*(id *)(a1 + 32), "databaseManager", (void)v18);
        id v14 = [v13 existingChannelForSubscriptionIdentifier:v12 databaseContext:v5];

        if (v14)
        {
          uint64_t v15 = [v14 statusType];
          int v16 = [v15 isEqualToString:*(void *)(a1 + 40)];

          if (v16)
          {
            uint64_t v17 = [*(id *)(a1 + 32) _subscriptionMetadataForChannel:v14];
            [v6 addObject:v17];
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v8 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v9 = [v8 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v6];

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient subscriptionMetadataForHandle:statusTypeIdentifier:completion:]();
    }

    uint64_t v12 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v6];
    goto LABEL_10;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v6])
  {
    id v13 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v12 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v6];
LABEL_10:
    uint64_t v10 = (void *)v12;
    v7[2](v7, 0, v12);
    goto LABEL_11;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __120__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier_completion___block_invoke;
  v14[3] = &unk_2646E1090;
  uint64_t v17 = v7;
  id v15 = v6;
  int v16 = self;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v14];

  uint64_t v10 = v17;
LABEL_11:
}

void __120__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = +[SKAStatusSubscriptionServiceClient logger];
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v6;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving all active assertions for statusTypeIdentifier: %@", buf, 0xCu);
    }

    id v7 = [*(id *)(a1 + 40) subscriptionManager];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __120__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier_completion___block_invoke_54;
    v11[3] = &unk_2646E11F0;
    int8x16_t v10 = *(int8x16_t *)(a1 + 32);
    id v8 = (id)v10.i64[0];
    int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
    id v13 = *(id *)(a1 + 48);
    [v7 allStatusSubscriptionIdentifiersWithActiveSubscriptionsWithCompletion:v11];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    char v9 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __120__SKAStatusSubscriptionServiceClient_allSubscriptionMetadatasWithActiveSubscriptionsForStatusTypeIdentifier_completion___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) databaseManager];
  id v5 = (void *)[v4 newBackgroundContext];

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        id v13 = objc_msgSend(*(id *)(a1 + 32), "databaseManager", (void)v18);
        id v14 = [v13 existingChannelForSubscriptionIdentifier:v12 databaseContext:v5];

        if (v14)
        {
          uint64_t v15 = [v14 statusType];
          int v16 = [v15 isEqualToString:*(void *)(a1 + 40)];

          if (v16)
          {
            uint64_t v17 = [*(id *)(a1 + 32) _subscriptionMetadataForChannel:v14];
            [v6 addObject:v17];
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, uint64_t))a5;
  uint64_t v11 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v12 = [v11 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v9];

  if ((v12 & 1) == 0)
  {
    id v14 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient subscriptionMetadataForHandle:statusTypeIdentifier:completion:]();
    }

    uint64_t v15 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v9];
    goto LABEL_10;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v9])
  {
    int v16 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v15 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v9];
LABEL_10:
    id v13 = (void *)v15;
    v10[2](v10, 0, v15);
    goto LABEL_11;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __152__SKAStatusSubscriptionServiceClient_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_statusTypeIdentifier_completion___block_invoke;
  v17[3] = &unk_2646E1068;
  long long v21 = v10;
  id v18 = v9;
  id v19 = v8;
  long long v20 = self;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v17];

  id v13 = v21;
LABEL_11:
}

void __152__SKAStatusSubscriptionServiceClient_allStatusSubscriptionsWithPersistentSubscriptionAssertionForApplicationIdentifier_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = +[SKAStatusSubscriptionServiceClient logger];
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v6;
      __int16 v31 = 2112;
      uint64_t v32 = v7;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Retrieving all subscription assertions for statusTypeIdentifier: %@ applicationIdentifier: %@", buf, 0x16u);
    }

    id v8 = [*(id *)(a1 + 48) databaseManager];
    id v9 = (void *)[v8 newBackgroundContext];

    uint64_t v10 = [*(id *)(a1 + 48) databaseManager];
    uint64_t v11 = [v10 existingSubscriptionAssertionsForStatusTypeIdentifier:*(void *)(a1 + 32) applicationIdentifier:*(void *)(a1 + 40) databaseContext:v9];

    char v12 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v11 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = v13;
      _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Found %ld subscription assertions", buf, 0xCu);
    }

    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v19), "channelIdentifier", (void)v24);
          long long v21 = [*(id *)(a1 + 48) databaseManager];
          long long v22 = [v21 existingChannelForSubscriptionIdentifier:v20 databaseContext:v9];

          uint64_t v23 = [*(id *)(a1 + 48) _subscriptionMetadataForChannel:v22];
          [v14 addObject:v23];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    id v9 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)subscriptionMetadataForPersonalSubscriptionWithStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, uint64_t))a4;
  id v8 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v9 = [v8 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v6];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v6];
LABEL_8:
    char v12 = (void *)v10;
    v7[2](v7, 0, v10);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v6])
  {
    uint64_t v11 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v10 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v6];
    goto LABEL_8;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __117__SKAStatusSubscriptionServiceClient_subscriptionMetadataForPersonalSubscriptionWithStatusTypeIdentifier_completion___block_invoke;
  v13[3] = &unk_2646E1090;
  id v15 = v7;
  v13[4] = self;
  id v14 = v6;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v13];

LABEL_9:
}

void __117__SKAStatusSubscriptionServiceClient_subscriptionMetadataForPersonalSubscriptionWithStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) databaseManager];
    id v4 = (void *)[v3 newBackgroundContext];

    id v5 = [*(id *)(a1 + 32) databaseManager];
    id v6 = [v5 existingPersonalChannelForStatusTypeIdentifier:*(void *)(a1 + 40) databaseContext:v4];

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) _subscriptionMetadataForChannel:v6];
      id v8 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        uint64_t v13 = v7;
        _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Found subscription metadata for personal channel: %@", (uint8_t *)&v12, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v10 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void **)(a1 + 40);
        int v12 = 138412290;
        uint64_t v13 = v11;
        _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Subscription information not found for personal channel with statusTypeIdentifier: %@", (uint8_t *)&v12, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    char v9 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    id v4 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)registerForDelegateCallbacksWithStatusTypeIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v9 = [v8 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v6];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v6];
LABEL_8:
    int v12 = (void *)v10;
    v7[2](v7, v10);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v6])
  {
    uint64_t v11 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v10 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v6];
    goto LABEL_8;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __102__SKAStatusSubscriptionServiceClient_registerForDelegateCallbacksWithStatusTypeIdentifier_completion___block_invoke;
  v13[3] = &unk_2646E1090;
  id v15 = v7;
  v13[4] = self;
  id v14 = v6;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v13];

LABEL_9:
}

void __102__SKAStatusSubscriptionServiceClient_registerForDelegateCallbacksWithStatusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    uint64_t v4 = [*(id *)(a1 + 40) copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    objc_sync_exit(v3);
    uint64_t v7 = +[SKAStatusSubscriptionServiceClient logger];
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
    uint64_t v10 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v11 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)retainTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Received request to retain transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", buf, 0x16u);
  }

  int v12 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v13 = [v12 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v9];

  if (v13)
  {
    if (+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v9])
    {
      if (!self->_trafficModeEnabled)
      {
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke;
        v19[3] = &unk_2646E1068;
        id v22 = v10;
        v19[4] = self;
        id v20 = v8;
        id v21 = v9;
        [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v19];

        uint64_t v18 = v22;
        goto LABEL_16;
      }
      __int16 v14 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusSubscriptionServiceClient retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:]();
      }

      uint64_t v15 = +[SKAStatusSubscriptionServiceClient _inTrafficError];
    }
    else
    {
      uint64_t v17 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
      }

      uint64_t v15 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v9];
    }
  }
  else
  {
    uint64_t v16 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:]();
    }

    uint64_t v15 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v9];
  }
  uint64_t v18 = (void *)v15;
  (*((void (**)(id, uint64_t))v10 + 2))(v10, v15);
LABEL_16:
}

void __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) databaseManager];
    uint64_t v4 = (void *)[v3 newBackgroundContext];

    if ([*(id *)(a1 + 32) _validateChannelIsKnownForSubscriptionIdentifier:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:v4])
    {
      uint64_t v5 = [*(id *)(a1 + 32) subscriptionManager];
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 32);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_55;
      v12[3] = &unk_2646E1218;
      id v13 = v6;
      id v14 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      [v5 retainTransientSubscriptionAssertionForSubscriptionIdentifier:v13 statusTypeIdentifier:v7 client:v8 completion:v12];

      id v9 = v13;
    }
    else
    {
      uint64_t v11 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_cold_1();
      }

      id v9 = +[SKAStatusSubscriptionServiceClient _subscriptionIdentifierNotFoundError:*(void *)(a1 + 40)];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v10 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v4 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_55(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[SKAStatusSubscriptionServiceClient logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_55_cold_1();
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
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)releaseTransientSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, uint64_t))a5;
  uint64_t v11 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Received request to release transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", buf, 0x16u);
  }

  uint64_t v12 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v13 = [v12 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v9];

  if ((v13 & 1) == 0)
  {
    id v15 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient releaseTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:]();
    }

    uint64_t v16 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v9];
    goto LABEL_12;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v9])
  {
    uint64_t v17 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v16 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v9];
LABEL_12:
    id v14 = (void *)v16;
    v10[2](v10, v16);
    goto LABEL_13;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke;
  v18[3] = &unk_2646E1068;
  id v21 = v10;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v18];

  id v14 = v21;
LABEL_13:
}

void __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) databaseManager];
    uint64_t v4 = (void *)[v3 newBackgroundContext];

    if ([*(id *)(a1 + 32) _validateChannelIsKnownForSubscriptionIdentifier:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:v4])
    {
      uint64_t v5 = [*(id *)(a1 + 32) subscriptionManager];
      uint64_t v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 32);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_56;
      v12[3] = &unk_2646E1218;
      id v13 = v6;
      id v14 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      [v5 releaseTransientSubscriptionAssertionForSubscriptionIdentifier:v13 statusTypeIdentifier:v7 client:v8 completion:v12];

      id v9 = v13;
    }
    else
    {
      uint64_t v11 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_cold_1();
      }

      id v9 = +[SKAStatusSubscriptionServiceClient _subscriptionIdentifierNotFoundError:*(void *)(a1 + 40)];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    __int16 v10 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v4 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_56(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[SKAStatusSubscriptionServiceClient logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_56_cold_1();
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
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)retainPersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Received request to retain persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", buf, 0x16u);
  }

  id v15 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v16 = [v15 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v11];

  if (v16)
  {
    if (+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v11])
    {
      if (!self->_trafficModeEnabled)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke;
        v22[3] = &unk_2646E10B8;
        id v26 = v13;
        v22[4] = self;
        id v23 = v10;
        id v24 = v11;
        id v25 = v12;
        [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v22];

        id v21 = v26;
        goto LABEL_16;
      }
      uint64_t v17 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusSubscriptionServiceClient retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:]();
      }

      uint64_t v18 = +[SKAStatusSubscriptionServiceClient _inTrafficError];
    }
    else
    {
      id v20 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
      }

      uint64_t v18 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v11];
    }
  }
  else
  {
    id v19 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient retainPersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:]();
    }

    uint64_t v18 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v11];
  }
  id v21 = (void *)v18;
  (*((void (**)(id, uint64_t))v13 + 2))(v13, v18);
LABEL_16:
}

void __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) databaseManager];
    uint64_t v4 = (void *)[v3 newBackgroundContext];

    if ([*(id *)(a1 + 32) _validateChannelIsKnownForSubscriptionIdentifier:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:v4])
    {
      uint64_t v5 = [*(id *)(a1 + 32) subscriptionManager];
      uint64_t v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_57;
      v12[3] = &unk_2646E1218;
      id v13 = v6;
      id v14 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 64);
      [v5 retainPersistentSubscriptionAssertionForSubscriptionIdentifier:v13 statusTypeIdentifier:v7 applicationIdentifier:v8 completion:v12];

      uint64_t v9 = v13;
    }
    else
    {
      id v11 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_cold_1();
      }

      uint64_t v9 = +[SKAStatusSubscriptionServiceClient _subscriptionIdentifierNotFoundError:*(void *)(a1 + 40)];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    id v10 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v4 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_57(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[SKAStatusSubscriptionServiceClient logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_57_cold_1();
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
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retained persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)releasePersistentSubscriptionAssertionForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t))a6;
  id v14 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Received request to release persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", buf, 0x16u);
  }

  id v15 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v16 = [v15 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v11];

  if ((v16 & 1) == 0)
  {
    uint64_t v18 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient releasePersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:]();
    }

    uint64_t v19 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v11];
    goto LABEL_12;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v11])
  {
    id v20 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v19 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v11];
LABEL_12:
    uint64_t v17 = (void *)v19;
    v13[2](v13, v19);
    goto LABEL_13;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke;
  v21[3] = &unk_2646E10B8;
  id v25 = v13;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v21];

  uint64_t v17 = v25;
LABEL_13:
}

void __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) databaseManager];
    uint64_t v4 = (void *)[v3 newBackgroundContext];

    if ([*(id *)(a1 + 32) _validateChannelIsKnownForSubscriptionIdentifier:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:v4])
    {
      uint64_t v5 = [*(id *)(a1 + 32) subscriptionManager];
      uint64_t v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_58;
      v12[3] = &unk_2646E1218;
      id v13 = v6;
      id v14 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 64);
      [v5 releasePersistentSubscriptionAssertionForSubscriptionIdentifier:v13 statusTypeIdentifier:v7 applicationIdentifier:v8 completion:v12];

      uint64_t v9 = v13;
    }
    else
    {
      id v11 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_cold_1();
      }

      uint64_t v9 = +[SKAStatusSubscriptionServiceClient _subscriptionIdentifierNotFoundError:*(void *)(a1 + 40)];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    id v10 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v4 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_58(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[SKAStatusSubscriptionServiceClient logger];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_58_cold_1();
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
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Successfully released persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)deleteSubscriptionWithIdentifier:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, uint64_t))a5;
  uint64_t v11 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v12 = [v11 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v9];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v9];
LABEL_8:
    id v15 = (void *)v13;
    v10[2](v10, v13);

    goto LABEL_9;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v9])
  {
    id v14 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v13 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v9];
    goto LABEL_8;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __103__SKAStatusSubscriptionServiceClient_deleteSubscriptionWithIdentifier_statusTypeIdentifier_completion___block_invoke;
  v16[3] = &unk_2646E1068;
  uint64_t v19 = v10;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v16];

LABEL_9:
}

void __103__SKAStatusSubscriptionServiceClient_deleteSubscriptionWithIdentifier_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) databaseManager];
    id v7 = (id)[v3 newBackgroundContext];

    if ([*(id *)(a1 + 32) _validateChannelIsKnownForSubscriptionIdentifier:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:v7])
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      uint64_t v6 = +[SKAStatusSubscriptionServiceClient _subscriptionIdentifierNotFoundError:*(void *)(a1 + 40)];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    uint64_t v4 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v5 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)subscriptionValidationTokensForHandle:(id)a3 statusTypeIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, void, uint64_t))a5;
  uint64_t v11 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = [v8 handleString];
    *(_DWORD *)buf = 138412546;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Received request for subscription and encryption validation token for handle \"%@\" statusTypeIdentifier: %@", buf, 0x16u);
  }
  uint64_t v13 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v14 = [v13 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v9];

  if ((v14 & 1) == 0)
  {
    uint64_t v16 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v9];
LABEL_10:
    id v15 = (void *)v16;
    v10[2](v10, 0, v16);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v9])
  {
    id v17 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v16 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v9];
    goto LABEL_10;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __108__SKAStatusSubscriptionServiceClient_subscriptionValidationTokensForHandle_statusTypeIdentifier_completion___block_invoke;
  v18[3] = &unk_2646E1068;
  id v21 = v10;
  v18[4] = self;
  id v19 = v8;
  id v20 = v9;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v18];

  id v15 = v21;
LABEL_11:
}

void __108__SKAStatusSubscriptionServiceClient_subscriptionValidationTokensForHandle_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) databaseManager];
    uint64_t v4 = (void *)[v3 newBackgroundContext];

    uint64_t v5 = [*(id *)(a1 + 32) databaseManager];
    uint64_t v6 = [v5 existingChannelForHandle:*(void *)(a1 + 40) statusTypeIdentifier:*(void *)(a1 + 48) databaseContext:v4];

    id v7 = +[SKAStatusSubscriptionServiceClient logger];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        id v9 = [*(id *)(a1 + 40) handleString];
        int v19 = 138412546;
        id v20 = v6;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Found channel %@ matching handle: %@", (uint8_t *)&v19, 0x16u);
      }
      __int16 v10 = [v6 identifier];
      unint64_t v11 = [v10 length];
      if (v11 >= 4) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = v11;
      }
      uint64_t v13 = [v10 substringToIndex:v12];
      char v14 = [*(id *)(a1 + 32) encryptionManager];
      id v15 = [v14 encryptionValidationTokenForChannel:v6];

      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F79848]) initWithSubscriptionValidationToken:v13 encryptionValidationToken:v15];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      if (v8)
      {
        id v18 = [*(id *)(a1 + 40) handleString];
        int v19 = 138412290;
        id v20 = v18;
        _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Did not find a channel matching handle: \"%@\". Returning empty string to indicate no match.", (uint8_t *)&v19, 0xCu);
      }
      __int16 v10 = (void *)[objc_alloc(MEMORY[0x263F79848]) initWithSubscriptionValidationToken:&stru_26D7A90B0 encryptionValidationToken:&stru_26D7A90B0];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v17 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v4 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:(id)a3 fromSender:(id)a4 statusTypeIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, uint64_t))a6;
  char v14 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v11 handleString];
    *(_DWORD *)buf = 138412802;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v12;
    _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Received request for validate token \"%@\" from handle \"%@\" for statusTypeIdentifier: %@", buf, 0x20u);
  }
  uint64_t v16 = [(SKAStatusSubscriptionServiceClient *)self clientConnection];
  char v17 = [v16 clientIsEntitledForSubscriptionWithStatusTypeIdentifier:v12];

  if ((v17 & 1) == 0)
  {
    uint64_t v19 = +[SKAStatusSubscriptionServiceClient _missingEntitlmentErrorForStatusTypeIdentifier:v12];
LABEL_10:
    id v18 = (void *)v19;
    v13[2](v13, 0, v19);
    goto LABEL_11;
  }
  if (!+[SKAServerBag statusEnabledByServerForStatusTypeIdentifier:v12])
  {
    id v20 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusPublishingServiceClient publishStatusRequest:statusTypeIdentifier:completion:]();
    }

    uint64_t v19 = +[SKAStatusSubscriptionServiceClient _serverDisabledErrorForStatusTypeIdentifier:v12];
    goto LABEL_10;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __151__SKAStatusSubscriptionServiceClient_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_statusTypeIdentifier_completion___block_invoke;
  v21[3] = &unk_2646E10B8;
  id v25 = v13;
  v21[4] = self;
  id v22 = v12;
  id v23 = v10;
  id v24 = v11;
  [(SKAStatusSubscriptionServiceClient *)self accountIsStatusKitCapableWithCompletion:v21];

  id v18 = v25;
LABEL_11:
}

void __151__SKAStatusSubscriptionServiceClient_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_statusTypeIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) databaseManager];
    uint64_t v4 = (void *)[v3 newBackgroundContext];

    uint64_t v5 = [*(id *)(a1 + 32) databaseManager];
    uint64_t v6 = [v5 existingPersonalChannelForStatusTypeIdentifier:*(void *)(a1 + 40) databaseContext:v4];

    if (v6)
    {
      id v7 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        __int16 v21 = v6;
        _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Validating tokens against personal channel: %@", (uint8_t *)&v20, 0xCu);
      }

      BOOL v8 = [*(id *)(a1 + 48) subscriptionValidationToken];
      uint64_t v9 = [*(id *)(a1 + 32) validatePersonalChannel:v6 matchesSubscriptionValidationToken:v8 fromSender:*(void *)(a1 + 56)];
      id v10 = +[SKAStatusSubscriptionServiceClient logger];
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9 == 1)
      {
        if (v11)
        {
          int v20 = 138412290;
          __int16 v21 = v6;
          _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Validating tokens against personal channel: %@", (uint8_t *)&v20, 0xCu);
        }

        id v12 = [*(id *)(a1 + 48) encryptionValidationToken];
        [*(id *)(a1 + 32) validatePersonalChannel:v6 matchesEncryptionValidationToken:v12 fromSender:*(void *)(a1 + 56)];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      else
      {
        if (v11)
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Received invalid validity for subscription channel validation. Not validating encryption token.", (uint8_t *)&v20, 2u);
        }

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
    }
    else
    {
      char v14 = [*(id *)(a1 + 48) subscriptionValidationToken];
      uint64_t v15 = [v14 length];

      uint64_t v16 = +[SKAStatusSubscriptionServiceClient logger];
      char v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __151__SKAStatusSubscriptionServiceClient_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_statusTypeIdentifier_completion___block_invoke_cold_1(a1, v17);
        }

        id v18 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [*(id *)(a1 + 56) handleString];
          int v20 = 138412290;
          __int16 v21 = v19;
          _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Sender \"%@\" asked us to verify that we do not have a personal channel, and they are correct", (uint8_t *)&v20, 0xCu);
        }
        id v18 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      }
      v18();
    }
  }
  else
  {
    uint64_t v13 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __89__SKAStatusPublishingServiceClient_publishStatusRequest_statusTypeIdentifier_completion___block_invoke_cold_2();
    }

    uint64_t v4 = +[SKAStatusSubscriptionServiceClient _accountNotCapableError];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (int64_t)validatePersonalChannel:(id)a3 matchesSubscriptionValidationToken:(id)a4 fromSender:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 identifier];
  id v10 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_22480C000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to validate subscription channel token \"%@\" against personal channel with identifier \"%@\"", (uint8_t *)&v18, 0x16u);
  }

  if (![v7 length])
  {
    uint64_t v13 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient validatePersonalChannel:matchesSubscriptionValidationToken:fromSender:]();
    }
    goto LABEL_12;
  }
  int v11 = [v9 hasPrefix:v7];
  id v12 = +[SKAStatusSubscriptionServiceClient logger];
  uint64_t v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v17 = [v8 handleString];
      int v18 = 138412802;
      id v19 = v17;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_error_impl(&dword_22480C000, v13, OS_LOG_TYPE_ERROR, "Sender \"%@\" has supplied a subscription channel validation token \"%@\", that does not match our current personal channel identifier \"%@\". Informing client that validation token is invalid, allowing them to re-invite the sender, if appropriate.", (uint8_t *)&v18, 0x20u);
    }
LABEL_12:
    int64_t v15 = 2;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    char v14 = [v8 handleString];
    int v18 = 138412290;
    id v19 = v14;
    _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Sender \"%@\" has supplied a valid subscription channel validation token", (uint8_t *)&v18, 0xCu);
  }
  int64_t v15 = 1;
LABEL_13:

  return v15;
}

- (int64_t)validatePersonalChannel:(id)a3 matchesEncryptionValidationToken:(id)a4 fromSender:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[SKAStatusSubscriptionServiceClient logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to validate encryption token \"%@\" against personal channel %@", (uint8_t *)&v21, 0x16u);
  }

  id v12 = [(SKAStatusSubscriptionServiceClient *)self encryptionManager];
  uint64_t v13 = [v12 encryptionValidationTokenForChannel:v8];

  if (![v13 length])
  {
    uint64_t v16 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient validatePersonalChannel:matchesEncryptionValidationToken:fromSender:]();
    }
    goto LABEL_13;
  }
  if (!v9)
  {
    uint64_t v16 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient validatePersonalChannel:matchesEncryptionValidationToken:fromSender:]();
    }
    goto LABEL_13;
  }
  if (![v9 length])
  {
    uint64_t v16 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient validatePersonalChannel:matchesEncryptionValidationToken:fromSender:]();
    }
    goto LABEL_18;
  }
  int v14 = [v13 hasPrefix:v9];
  int64_t v15 = +[SKAStatusSubscriptionServiceClient logger];
  uint64_t v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = [v10 handleString];
      int v21 = 138412802;
      id v22 = v20;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      _os_log_error_impl(&dword_22480C000, v16, OS_LOG_TYPE_ERROR, "Sender \"%@\" has supplied an encryptoin validation token \"%@\", that does not match our expected value \"%@\". Informing client that validation token is invalid, allowing them to re-invite the sender, if appropriate.", (uint8_t *)&v21, 0x20u);
    }
LABEL_18:
    int64_t v18 = 2;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    char v17 = [v10 handleString];
    int v21 = 138412802;
    id v22 = v17;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Sender \"%@\" has supplied a valid encryption validation token. Provided: \"%@\" Expected: \"%@\"", (uint8_t *)&v21, 0x20u);
  }
LABEL_13:
  int64_t v18 = 1;
LABEL_19:

  return v18;
}

- (BOOL)_validateChannelIsKnownForSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 databaseContext:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SKADatabaseManaging *)self->_databaseManager existingChannelForSubscriptionIdentifier:v8 databaseContext:a5];
  int v11 = v10;
  if (v10)
  {
    id v12 = [v10 statusType];
    if ([v12 length] && [v12 isEqualToString:v9])
    {
      uint64_t v13 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Validated subscriptionIdentifier: %@ statusTypeIdentifier: %@", (uint8_t *)&v16, 0x16u);
      }
      BOOL v14 = 1;
    }
    else
    {
      uint64_t v13 = +[SKAStatusSubscriptionServiceClient logger];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusSubscriptionServiceClient _validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:]();
      }
      BOOL v14 = 0;
    }
  }
  else
  {
    id v12 = +[SKAStatusSubscriptionServiceClient logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusSubscriptionServiceClient _validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:]();
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (void)accountIsStatusKitCapableWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(SKAStatusSubscriptionServiceClient *)v5 databaseManager];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __78__SKAStatusSubscriptionServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke;
  v8[3] = &unk_2646E0CD8;
  v8[4] = v5;
  id v7 = v4;
  id v9 = v7;
  [v6 deviceToDeviceEncryptedDatabaseCapableWithCompletion:v8];

  objc_sync_exit(v5);
}

void __78__SKAStatusSubscriptionServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__SKAStatusSubscriptionServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke_2;
  v5[3] = &unk_2646E1180;
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  dispatch_async(v4, v5);
}

uint64_t __78__SKAStatusSubscriptionServiceClient_accountIsStatusKitCapableWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (NSString)statusTypeIdenfifier
{
  return self->_statusTypeIdenfifier;
}

- (SKAStatusSubscriptionServiceClientConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
}

- (SKAStatusSubscriptionServiceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKAStatusSubscriptionServiceClientDelegate *)WeakRetained;
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

- (SKAStatusEncryptionManaging)encryptionManager
{
  return self->_encryptionManager;
}

- (void)setEncryptionManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)trafficModeEnabled
{
  return self->_trafficModeEnabled;
}

- (void)setTrafficModeEnabled:(BOOL)a3
{
  self->_trafficModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_statusTypeIdenfifier, 0);
}

void __76__SKAStatusSubscriptionServiceClient_handleRemoteDatabaseChangeForChannels___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "XPC Error notifying of remote database changes. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __75__SKAStatusSubscriptionServiceClient_handleReceivedStatusUpdate_onChannel___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "XPC Error notifying client of status update. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __73__SKAStatusSubscriptionServiceClient_handleReceivedInvitationForChannel___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "XPC Error notifying of received invitation. Error: %{public}@", v2, v3, v4, v5, v6);
}

void __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInterrupted___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error releasing transient subscription assertions associated with interrupted client: %@", v2, v3, v4, v5, v6);
}

void __88__SKAStatusSubscriptionServiceClient_subscriptionServiceClientConnectionWasInvalidated___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Error releasing transient subscription assertions associated with invalidated client: %@", v2, v3, v4, v5, v6);
}

- (void)subscriptionMetadataForHandle:statusTypeIdentifier:completion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Client is not entitled to access subscription information for status type: %@", v2, v3, v4, v5, v6);
}

- (void)retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "We're in traffic mode -- rejecting subscription request", v2, v3, v4, v5, v6);
}

- (void)retainTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Client is not entitled to retain transient subscription assertion for status type: %@", v2, v3, v4, v5, v6);
}

void __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "No subscription was found matching subscriptionIdentifier: %@ statusTypeIdentifier: %@");
}

void __132__SKAStatusSubscriptionServiceClient_retainTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9(&dword_22480C000, v0, v1, "Error retaining transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@ error: %@");
}

- (void)releaseTransientSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:completion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Client is not entitled to release transient subscription assertion for status type: %@", v2, v3, v4, v5, v6);
}

void __133__SKAStatusSubscriptionServiceClient_releaseTransientSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_completion___block_invoke_56_cold_1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9(&dword_22480C000, v0, v1, "Error releasing transient subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@ error: %@");
}

- (void)retainPersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Client is not entitled to retain persistent subscription assertion for status type: %@", v2, v3, v4, v5, v6);
}

void __155__SKAStatusSubscriptionServiceClient_retainPersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_57_cold_1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9(&dword_22480C000, v0, v1, "Error retaining persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@ error: %@");
}

- (void)releasePersistentSubscriptionAssertionForSubscriptionIdentifier:statusTypeIdentifier:applicationIdentifier:completion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Client is not entitled to release persistent subscription assertion for status type: %@", v2, v3, v4, v5, v6);
}

void __156__SKAStatusSubscriptionServiceClient_releasePersistentSubscriptionAssertionForSubscriptionIdentifier_statusTypeIdentifier_applicationIdentifier_completion___block_invoke_58_cold_1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_9(&dword_22480C000, v0, v1, "Error releasing persistent subscription assertion for subscriptionIdentifier: %@ statusTypeIdentifier: %@ error: %@");
}

void __151__SKAStatusSubscriptionServiceClient_validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens_fromSender_statusTypeIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 56) handleString];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22480C000, a2, OS_LOG_TYPE_ERROR, "Sender \"%@\" asked us to verify a channel validation token, but we don't have a personal channel, this device may be out of sync, returning unknown", v4, 0xCu);
}

- (void)validatePersonalChannel:matchesSubscriptionValidationToken:fromSender:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 handleString];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_22480C000, v0, v3, "Sender \"%@\" asked us to verify that we do not have a personal channel, but we do have channel %@. Informing client that validation token is invalid, allowing them to re-invite the sender, if appropriate.", v4);
}

- (void)validatePersonalChannel:matchesEncryptionValidationToken:fromSender:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 handleString];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_22480C000, v0, v3, "Sender \"%@\" provided encryption validation token \"%@\", but we do not have a local value to validate against. Returning valid.", v4);
}

- (void)validatePersonalChannel:matchesEncryptionValidationToken:fromSender:.cold.2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 handleString];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_22480C000, v0, v3, "Sender \"%@\" provided an nil encryption validation token, but we expected \"%@\". For backward compatibility, we assume nil means they are on an older OS and we should not fail validation. Returning valid.", v4);
}

- (void)validatePersonalChannel:matchesEncryptionValidationToken:fromSender:.cold.3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 handleString];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_22480C000, v0, v3, "Sender \"%@\" provided an empty encryption validation token, but we expected \"%@\". Informing client that validation token is invalid, allowing them to re-invite the sender, if appropriate.", v4);
}

- (void)_validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Failed to validate subscriptionIdentifier: %@ statusTypeIdentifier: %@");
}

- (void)_validateChannelIsKnownForSubscriptionIdentifier:statusTypeIdentifier:databaseContext:.cold.2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Failed to validate. subscriptionIdentifier: %@ does not match statusTypeIdentifier: %@");
}

@end