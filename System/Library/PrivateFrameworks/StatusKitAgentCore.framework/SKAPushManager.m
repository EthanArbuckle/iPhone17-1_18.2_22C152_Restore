@interface SKAPushManager
+ (id)logger;
- (APSConnection)connection;
- (BOOL)_sharedChannelsIsDisabledByServer;
- (BOOL)trafficModeEnabled;
- (FTMessageDelivery)messageDelivery;
- (OS_dispatch_queue)queue;
- (SKAPushManager)initWithQueue:(id)a3 systemMonitor:(id)a4 inTrafficMode:(BOOL)a5;
- (SKAPushManagingDelegate)delegate;
- (SKASystemMonitor)systemMonitor;
- (id)_pushEnvironment;
- (id)pushToken;
- (id)serverTime;
- (void)_initializeAPSConnection;
- (void)_sharedChannelsIsDisabledByServer;
- (void)_subscribeToChannels:(id)a3 forTopic:(id)a4;
- (void)_subscribedChannelsForTopic:(id)a3 WithCompletion:(id)a4;
- (void)_switchFilterToEnabledForTopic:(id)a3;
- (void)_switchFilterToNonwakingForTopic:(id)a3;
- (void)_unsubscribeFromChannels:(id)a3 forTopic:(id)a4;
- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)createChannelWithProtoData:(id)a3 completion:(id)a4;
- (void)disableActivityTracking;
- (void)enableActivityTracking;
- (void)provisionPayload:(id)a3 completion:(id)a4;
- (void)publishStatus:(id)a3 completion:(id)a4;
- (void)pushToken;
- (void)sendPresenceMessage:(id)a3 completion:(id)a4;
- (void)serverTime;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageDelivery:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setTrafficModeEnabled:(BOOL)a3;
- (void)subscribeToPresenceChannels:(id)a3;
- (void)subscribeToStatusChannels:(id)a3;
- (void)subscribedPresenceChannelsWithCompletion:(id)a3;
- (void)subscribedStatusChannelsWithCompletion:(id)a3;
- (void)switchPresenceFilterToEnabled;
- (void)switchPresenceFilterToNonwaking;
- (void)switchStatusFilterToEnabled;
- (void)switchStatusFilterToNonwaking;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)unsubscribeFromPresenceChannels:(id)a3;
- (void)unsubscribeFromStatusChannels:(id)a3;
@end

@implementation SKAPushManager

- (SKAPushManager)initWithQueue:(id)a3 systemMonitor:(id)a4 inTrafficMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SKAPushManager;
  v11 = [(SKAPushManager *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    objc_storeStrong((id *)&v12->_systemMonitor, a4);
    [(SKASystemMonitor *)v12->_systemMonitor addListener:v12];
    [(SKAPushManager *)v12 _initializeAPSConnection];
    v13 = [(SKAPushManager *)v12 _pushEnvironment];
    id v14 = objc_alloc(MEMORY[0x263F280F0]);
    v15 = (void *)[v14 initWithEnvironmentName:v13 namedDelegatePort:*MEMORY[0x263F280B8] queue:v9];
    v16 = [NSClassFromString(&cfstr_Immobilenetwor.isa) sharedInstance];
    uint64_t v17 = [objc_alloc(MEMORY[0x263F3BB30]) initWithAPSConnection:v15 mobileNetworkManager:v16];
    messageDelivery = v12->_messageDelivery;
    v12->_messageDelivery = (FTMessageDelivery *)v17;

    v12->_trafficModeEnabled = v5;
    if (v5)
    {
      v19 = +[SKAPushManager logger];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_22480C000, v19, OS_LOG_TYPE_DEFAULT, "In Traffic Mode--will not honor status subscriptions and will drop incoming status's", v21, 2u);
      }
    }
  }

  return v12;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  v3 = +[SKAPushManager logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Received did leave first unlock notification.", v4, 2u);
  }

  [(SKAPushManager *)self _initializeAPSConnection];
}

- (void)_initializeAPSConnection
{
  v13[2] = *MEMORY[0x263EF8340];
  if (!self->_connection)
  {
    BOOL v3 = [(SKASystemMonitor *)self->_systemMonitor isUnderFirstDataProtectionLock];
    v4 = +[SKAPushManager logger];
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Deferring connection initialization as device is before first unlock.", v11, 2u);
      }
    }
    else
    {
      if (v5)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Initializing APS connection.", v11, 2u);
      }

      v4 = [(SKAPushManager *)self _pushEnvironment];
      v6 = (APSConnection *)[objc_alloc(MEMORY[0x263F280F0]) initWithEnvironmentName:v4 namedDelegatePort:@"com.apple.aps.StatusKit" queue:self->_queue];
      connection = self->_connection;
      self->_connection = v6;

      [(APSConnection *)self->_connection setDelegate:self];
      v13[0] = @"com.apple.icloud.presence.mode.status";
      v13[1] = @"com.apple.icloud.presence.shared.experience";
      v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
      [(APSConnection *)self->_connection _setNonWakingTopics:v8];

      id v9 = self->_connection;
      v12 = @"com.apple.icloud.presence.mode.status";
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
      [(APSConnection *)v9 setUltraConstrainedTopics:v10];

      [(APSConnection *)self->_connection setTrackActivityPresence:0];
    }
  }
}

- (id)_pushEnvironment
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"useSandbox", @"com.apple.StatusKitAgent", &keyExistsAndHasValidFormat);
  int v3 = keyExistsAndHasValidFormat;
  v4 = +[SKAPushManager logger];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3) {
    BOOL v6 = AppBooleanValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (v5)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Using production push environment", v10, 2u);
    }
    v7 = (id *)MEMORY[0x263F280D0];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Using sandbox push environment", buf, 2u);
    }
    v7 = (id *)MEMORY[0x263F280C8];
  }

  id v8 = *v7;
  return v8;
}

- (void)createChannelWithProtoData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  if ([(SKAPushManager *)self _sharedChannelsIsDisabledByServer])
  {
    id v8 = +[SKAPushManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }

    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = -999;
LABEL_16:
    v13 = [v9 errorWithDomain:@"SKPushManagerErrorDomain" code:v10 userInfo:0];
    v7[2](v7, 0, v13);
    goto LABEL_17;
  }
  if (!self->_connection)
  {
    uint64_t v17 = +[SKAPushManager logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }

    if (![(SKASystemMonitor *)self->_systemMonitor isUnderFirstDataProtectionLock])
    {
      v18 = +[SKAPushManager logger];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[SKAPushManager createChannelWithProtoData:completion:]();
      }
    }
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = -1000;
    goto LABEL_16;
  }
  v11 = self->_queue;
  v12 = (void *)[objc_alloc(MEMORY[0x263F3BB60]) initWithProtoData:v6 messageType:1];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke;
  v22[3] = &unk_2646E1B70;
  v13 = v11;
  v23 = v13;
  v24 = v7;
  [v12 setCompletionBlock:v22];
  [v12 setTimeout:5.0];
  id v14 = +[SKAPushManager logger];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Sending create channel message.", buf, 2u);
  }

  queue = self->_queue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_34;
  v19[3] = &unk_2646E1B98;
  v19[4] = self;
  id v20 = v12;
  id v16 = v12;
  dispatch_async(queue, v19);

LABEL_17:
}

void __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v7;
  uint64_t v10 = +[SKAPushManager logger];
  v11 = v10;
  if (a4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_cold_1((uint64_t)v8, v11);
    }

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_30;
    v20[3] = &unk_2646E1790;
    v12 = &v22;
    v13 = *(NSObject **)(a1 + 32);
    id v22 = *(id *)(a1 + 40);
    id v14 = &v21;
    id v21 = v8;
    v15 = v20;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Create channel reverse push completed, calling completion with proto response", buf, 2u);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_32;
    v16[3] = &unk_2646E1790;
    v12 = &v18;
    v13 = *(NSObject **)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v14 = &v17;
    id v17 = v9;
    v15 = v16;
  }
  dispatch_async(v13, v15);
}

uint64_t __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_32(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) protoResponse];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_34(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageDelivery];
  [v2 sendMessage:*(void *)(a1 + 40)];
}

- (void)switchStatusFilterToNonwaking
{
}

- (void)switchStatusFilterToEnabled
{
}

- (void)switchPresenceFilterToNonwaking
{
}

- (void)switchPresenceFilterToEnabled
{
}

- (void)_switchFilterToNonwakingForTopic:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  connection = self->_connection;
  id v6 = +[SKAPushManager logger];
  id v7 = v6;
  if (connection)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Switching %@ to non-waking", (uint8_t *)&v12, 0xCu);
    }

    id v8 = [(APSConnection *)self->_connection nonWakingTopics];
    id v9 = [v8 mutableCopy];

    uint64_t v10 = [(APSConnection *)self->_connection enabledTopics];
    v11 = (void *)[v10 mutableCopy];

    if (![v9 containsObject:v4]
      || [v11 containsObject:v4])
    {
      if ([v11 containsObject:v4]) {
        [v11 removeObject:v4];
      }
      if (([v9 containsObject:v4] & 1) == 0) {
        [v9 addObject:v4];
      }
      [(APSConnection *)self->_connection setEnabledTopics:v11 ignoredTopics:MEMORY[0x263EFFA68] opportunisticTopics:MEMORY[0x263EFFA68] nonWakingTopics:v9];
    }

LABEL_17:
    goto LABEL_18;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SKAPushManager createChannelWithProtoData:completion:]();
  }

  if (![(SKASystemMonitor *)self->_systemMonitor isUnderFirstDataProtectionLock])
  {
    id v9 = +[SKAPushManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (void)_switchFilterToEnabledForTopic:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  connection = self->_connection;
  id v6 = +[SKAPushManager logger];
  id v7 = v6;
  if (connection)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Switching %@ to enabled", (uint8_t *)&v12, 0xCu);
    }

    id v8 = [(APSConnection *)self->_connection nonWakingTopics];
    id v9 = [v8 mutableCopy];

    uint64_t v10 = [(APSConnection *)self->_connection enabledTopics];
    v11 = (void *)[v10 mutableCopy];

    if (([v9 containsObject:v4] & 1) != 0
      || ([v11 containsObject:v4] & 1) == 0)
    {
      if ([v9 containsObject:v4]) {
        [v9 removeObject:v4];
      }
      if (([v11 containsObject:v4] & 1) == 0) {
        [v11 addObject:v4];
      }
      [(APSConnection *)self->_connection setEnabledTopics:v11 ignoredTopics:MEMORY[0x263EFFA68] opportunisticTopics:MEMORY[0x263EFFA68] nonWakingTopics:v9];
    }

LABEL_17:
    goto LABEL_18;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SKAPushManager createChannelWithProtoData:completion:]();
  }

  if (![(SKASystemMonitor *)self->_systemMonitor isUnderFirstDataProtectionLock])
  {
    id v9 = +[SKAPushManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (void)publishStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([(SKAPushManager *)self _sharedChannelsIsDisabledByServer])
  {
    id v8 = +[SKAPushManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }

    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = -999;
LABEL_9:
    int v12 = [v9 errorWithDomain:@"SKPushManagerErrorDomain" code:v10 userInfo:0];
    v7[2](v7, 0, v12);
    goto LABEL_10;
  }
  if (self->_trafficModeEnabled)
  {
    v11 = +[SKAPushManager logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager publishStatus:completion:].cold.4();
    }

    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = -1001;
    goto LABEL_9;
  }
  connection = self->_connection;
  uint64_t v14 = +[SKAPushManager logger];
  v15 = v14;
  if (!connection)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }

    if (![(SKASystemMonitor *)self->_systemMonitor isUnderFirstDataProtectionLock])
    {
      id v20 = +[SKAPushManager logger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[SKAPushManager createChannelWithProtoData:completion:]();
      }
    }
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = -1000;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Publishing status", buf, 2u);
  }

  id v16 = self->_queue;
  id v17 = (void *)[objc_alloc(MEMORY[0x263F3BB60]) initWithProtoData:v6 messageType:2];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __43__SKAPushManager_publishStatus_completion___block_invoke;
  v23[3] = &unk_2646E1B70;
  v24 = v16;
  v25 = v7;
  int v12 = v16;
  [v17 setCompletionBlock:v23];
  [v17 setTimeout:5.0];
  queue = self->_queue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __43__SKAPushManager_publishStatus_completion___block_invoke_2;
  v21[3] = &unk_2646E1B98;
  v21[4] = self;
  id v22 = v17;
  id v19 = v17;
  dispatch_async(queue, v21);

LABEL_10:
}

void __43__SKAPushManager_publishStatus_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v7;
  uint64_t v10 = +[SKAPushManager logger];
  v11 = v10;
  if (a4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __43__SKAPushManager_publishStatus_completion___block_invoke_cold_1();
    }

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __43__SKAPushManager_publishStatus_completion___block_invoke_35;
    v20[3] = &unk_2646E1790;
    int v12 = &v22;
    id v13 = *(NSObject **)(a1 + 32);
    id v22 = *(id *)(a1 + 40);
    uint64_t v14 = &v21;
    id v21 = v8;
    v15 = v20;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Publishing status, reverse push completed, calling completion with protobuf response data", buf, 2u);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __43__SKAPushManager_publishStatus_completion___block_invoke_36;
    v16[3] = &unk_2646E1790;
    int v12 = &v18;
    id v13 = *(NSObject **)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    uint64_t v14 = &v17;
    id v17 = v9;
    v15 = v16;
  }
  dispatch_async(v13, v15);
}

uint64_t __43__SKAPushManager_publishStatus_completion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __43__SKAPushManager_publishStatus_completion___block_invoke_36(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) protoResponse];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __43__SKAPushManager_publishStatus_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageDelivery];
  [v2 sendMessage:*(void *)(a1 + 40)];
}

- (void)provisionPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([(SKAPushManager *)self _sharedChannelsIsDisabledByServer])
  {
    id v8 = +[SKAPushManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }

    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = -999;
LABEL_9:
    int v12 = [v9 errorWithDomain:@"SKPushManagerErrorDomain" code:v10 userInfo:0];
    v7[2](v7, 0, v12);
    goto LABEL_10;
  }
  if (self->_trafficModeEnabled)
  {
    v11 = +[SKAPushManager logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager provisionPayload:completion:].cold.4();
    }

    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = -1001;
    goto LABEL_9;
  }
  connection = self->_connection;
  uint64_t v14 = +[SKAPushManager logger];
  v15 = v14;
  if (!connection)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }

    if (![(SKASystemMonitor *)self->_systemMonitor isUnderFirstDataProtectionLock])
    {
      id v20 = +[SKAPushManager logger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[SKAPushManager createChannelWithProtoData:completion:]();
      }
    }
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = -1000;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v15, OS_LOG_TYPE_DEFAULT, "Provisioning", buf, 2u);
  }

  id v16 = self->_queue;
  id v17 = (void *)[objc_alloc(MEMORY[0x263F3BB60]) initWithProtoData:v6 messageType:3];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __46__SKAPushManager_provisionPayload_completion___block_invoke;
  v23[3] = &unk_2646E1B70;
  v24 = v16;
  v25 = v7;
  int v12 = v16;
  [v17 setCompletionBlock:v23];
  [v17 setTimeout:5.0];
  queue = self->_queue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __46__SKAPushManager_provisionPayload_completion___block_invoke_2;
  v21[3] = &unk_2646E1B98;
  v21[4] = self;
  id v22 = v17;
  id v19 = v17;
  dispatch_async(queue, v21);

LABEL_10:
}

void __46__SKAPushManager_provisionPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v7;
  uint64_t v10 = +[SKAPushManager logger];
  v11 = v10;
  if (a4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __46__SKAPushManager_provisionPayload_completion___block_invoke_cold_1();
    }

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __46__SKAPushManager_provisionPayload_completion___block_invoke_37;
    v20[3] = &unk_2646E1790;
    int v12 = &v22;
    id v13 = *(NSObject **)(a1 + 32);
    id v22 = *(id *)(a1 + 40);
    uint64_t v14 = &v21;
    id v21 = v8;
    v15 = v20;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Provisioning, reverse push completed, calling completion with protobuf response data", buf, 2u);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__SKAPushManager_provisionPayload_completion___block_invoke_38;
    v16[3] = &unk_2646E1790;
    int v12 = &v18;
    id v13 = *(NSObject **)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    uint64_t v14 = &v17;
    id v17 = v9;
    v15 = v16;
  }
  dispatch_async(v13, v15);
}

uint64_t __46__SKAPushManager_provisionPayload_completion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __46__SKAPushManager_provisionPayload_completion___block_invoke_38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) protoResponse];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __46__SKAPushManager_provisionPayload_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageDelivery];
  [v2 sendMessage:*(void *)(a1 + 40)];
}

- (void)enableActivityTracking
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Asked to enable activity tracking but we're missing a connection.  Likely before first unlock", v2, v3, v4, v5, v6);
}

- (void)disableActivityTracking
{
  connection = self->_connection;
  if (connection)
  {
    if ([(APSConnection *)connection trackActivityPresence])
    {
      uint64_t v4 = self->_connection;
      [(APSConnection *)v4 setTrackActivityPresence:0];
    }
  }
  else
  {
    uint64_t v5 = +[SKAPushManager logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager enableActivityTracking]();
    }
  }
}

- (id)pushToken
{
  connection = self->_connection;
  if (connection)
  {
    uint64_t v3 = [(APSConnection *)connection publicToken];
  }
  else
  {
    uint64_t v4 = +[SKAPushManager logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager pushToken]();
    }

    uint64_t v3 = 0;
  }
  return v3;
}

- (void)sendPresenceMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([(SKAPushManager *)self _sharedChannelsIsDisabledByServer])
  {
    id v8 = +[SKAPushManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }

    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = -999;
LABEL_16:
    id v16 = [v9 errorWithDomain:@"SKPushManagerErrorDomain" code:v10 userInfo:0];
    v7[2](v7, 0, v16);
    goto LABEL_17;
  }
  connection = self->_connection;
  int v12 = +[SKAPushManager logger];
  id v13 = v12;
  if (!connection)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }

    if (![(SKASystemMonitor *)self->_systemMonitor isUnderFirstDataProtectionLock])
    {
      id v19 = +[SKAPushManager logger];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[SKAPushManager createChannelWithProtoData:completion:]();
      }
    }
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = -1000;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Sending presence protobuff message to server", buf, 2u);
  }

  uint64_t v14 = self->_queue;
  v15 = (void *)[objc_alloc(MEMORY[0x263F3BB48]) initWithPushTopic:@"com.apple.icloud.presence.channel.management" protoData:v6];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __49__SKAPushManager_sendPresenceMessage_completion___block_invoke;
  v22[3] = &unk_2646E1B70;
  v23 = v14;
  v24 = v7;
  id v16 = v14;
  [v15 setCompletionBlock:v22];
  [v15 setTimeout:5.0];
  queue = self->_queue;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_2;
  v20[3] = &unk_2646E1B98;
  void v20[4] = self;
  id v21 = v15;
  id v18 = v15;
  dispatch_async(queue, v20);

LABEL_17:
}

void __49__SKAPushManager_sendPresenceMessage_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v7;
  uint64_t v10 = +[SKAPushManager logger];
  v11 = v10;
  if (a4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_cold_1();
    }

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_40;
    v20[3] = &unk_2646E1790;
    int v12 = &v22;
    id v13 = *(NSObject **)(a1 + 32);
    id v22 = *(id *)(a1 + 40);
    uint64_t v14 = &v21;
    id v21 = v8;
    v15 = v20;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Presence protobuff sent, reverse push completed, calling completion with protobuf response data", buf, 2u);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_41;
    v16[3] = &unk_2646E1790;
    int v12 = &v18;
    id v13 = *(NSObject **)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    uint64_t v14 = &v17;
    id v17 = v9;
    v15 = v16;
  }
  dispatch_async(v13, v15);
}

uint64_t __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_41(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) protoResponse];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageDelivery];
  [v2 sendMessage:*(void *)(a1 + 40)];
}

- (void)subscribeToStatusChannels:(id)a3
{
  if (self->_trafficModeEnabled)
  {
    uint64_t v3 = +[SKAPushManager logger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Not subscribing to status channels because traffic mode is enabled", v4, 2u);
    }
  }
  else
  {
    [(SKAPushManager *)self _subscribeToChannels:a3 forTopic:@"com.apple.icloud.presence.mode.status"];
  }
}

- (void)unsubscribeFromStatusChannels:(id)a3
{
}

- (void)subscribedStatusChannelsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SKAPushManager_subscribedStatusChannelsWithCompletion___block_invoke;
  v6[3] = &unk_2646E19F0;
  id v7 = v4;
  id v5 = v4;
  [(SKAPushManager *)self _subscribedChannelsForTopic:@"com.apple.icloud.presence.mode.status" WithCompletion:v6];
}

uint64_t __57__SKAPushManager_subscribedStatusChannelsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscribeToPresenceChannels:(id)a3
{
}

- (void)unsubscribeFromPresenceChannels:(id)a3
{
}

- (void)subscribedPresenceChannelsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__SKAPushManager_subscribedPresenceChannelsWithCompletion___block_invoke;
  v6[3] = &unk_2646E19F0;
  id v7 = v4;
  id v5 = v4;
  [(SKAPushManager *)self _subscribedChannelsForTopic:@"com.apple.icloud.presence.shared.experience" WithCompletion:v6];
}

uint64_t __59__SKAPushManager_subscribedPresenceChannelsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_subscribeToChannels:(id)a3 forTopic:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(SKAPushManager *)self _sharedChannelsIsDisabledByServer])
  {
    id v8 = +[SKAPushManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }
LABEL_20:

    goto LABEL_21;
  }
  connection = self->_connection;
  uint64_t v10 = +[SKAPushManager logger];
  v11 = v10;
  if (connection)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Subscribing to channels: %@ for topic %@", buf, 0x16u);
    }

    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * v16);
          id v18 = objc_alloc(MEMORY[0x263F15718]);
          id v19 = objc_msgSend(v18, "initWithChannelID:", v17, (void)v22);
          [v8 addObject:v19];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    id v20 = [(SKAPushManager *)self connection];
    id v21 = [v8 copy];
    [v20 subscribeToChannels:v21 forTopic:v7];

    goto LABEL_20;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SKAPushManager createChannelWithProtoData:completion:]();
  }

  if (![(SKASystemMonitor *)self->_systemMonitor isUnderFirstDataProtectionLock])
  {
    id v8 = +[SKAPushManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (void)_unsubscribeFromChannels:(id)a3 forTopic:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(SKAPushManager *)self _sharedChannelsIsDisabledByServer])
  {
    id v8 = +[SKAPushManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }
LABEL_20:

    goto LABEL_21;
  }
  connection = self->_connection;
  uint64_t v10 = +[SKAPushManager logger];
  v11 = v10;
  if (connection)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Unsubscribing from channels: %@", buf, 0xCu);
    }

    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * v16);
          id v18 = objc_alloc(MEMORY[0x263F15718]);
          id v19 = objc_msgSend(v18, "initWithChannelID:", v17, (void)v22);
          [v8 addObject:v19];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    id v20 = [(SKAPushManager *)self connection];
    id v21 = [v8 copy];
    [v20 unsubscribeFromChannels:v21 forTopic:v7];

    goto LABEL_20;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SKAPushManager createChannelWithProtoData:completion:]();
  }

  if (![(SKASystemMonitor *)self->_systemMonitor isUnderFirstDataProtectionLock])
  {
    id v8 = +[SKAPushManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (void)_subscribedChannelsForTopic:(id)a3 WithCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if ([(SKAPushManager *)self _sharedChannelsIsDisabledByServer])
  {
    id v8 = +[SKAPushManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }
    goto LABEL_4;
  }
  connection = self->_connection;
  v11 = +[SKAPushManager logger];
  id v12 = v11;
  if (!connection)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }

    if ([(SKASystemMonitor *)self->_systemMonitor isUnderFirstDataProtectionLock]) {
      goto LABEL_5;
    }
    id v8 = +[SKAPushManager logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }
LABEL_4:

LABEL_5:
    id v9 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    v7[2](v7, v9);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Fetching subscribed channels for topic %@", buf, 0xCu);
  }

  uint64_t v13 = [(SKAPushManager *)self connection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__SKAPushManager__subscribedChannelsForTopic_WithCompletion___block_invoke;
  v14[3] = &unk_2646E1BC0;
  id v15 = v6;
  uint64_t v16 = v7;
  [v13 getRegisteredChannelsForTopic:v15 withCompletion:v14];

  id v9 = v15;
LABEL_10:
}

void __61__SKAPushManager__subscribedChannelsForTopic_WithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[SKAPushManager logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__SKAPushManager__subscribedChannelsForTopic_WithCompletion___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "channelID", (void)v20);
          if ([v15 length]) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v12);
    }

    uint64_t v16 = +[SKAPushManager logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Fetching subscribed channels completed for topic %@ with channels: %@", buf, 0x16u);
    }

    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = (void *)[v9 copy];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
}

- (id)serverTime
{
  connection = self->_connection;
  if (connection && ([(APSConnection *)connection isConnected] & 1) != 0)
  {
    [MEMORY[0x263F280F0] serverTime];
    double v4 = v3;
    id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:0.0];
    [v5 timeIntervalSince1970];
    double v7 = v6;

    if (v4 > v7)
    {
      uint64_t v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v4];
      goto LABEL_8;
    }
    id v9 = +[SKAPushManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager serverTime]();
    }
  }
  else
  {
    id v9 = +[SKAPushManager logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager serverTime]();
    }
  }

  uint64_t v8 = [MEMORY[0x263EFF910] now];
LABEL_8:
  return v8;
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = +[SKAPushManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 identifier];
    uint64_t v8 = [v5 expirationDate];
    *(_DWORD *)buf = 134218498;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Receieved aps incoming message %lu : %@ -- expiration: %@", buf, 0x20u);
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__SKAPushManager_connection_didReceiveIncomingMessage___block_invoke;
  v11[3] = &unk_2646E1B98;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(queue, v11);
}

void __55__SKAPushManager_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _sharedChannelsIsDisabledByServer])
  {
    id v2 = +[SKAPushManager logger];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager createChannelWithProtoData:completion:]();
    }
  }
  else
  {
    id v2 = [*(id *)(a1 + 40) userInfo];
    double v3 = [v2 objectForKeyedSubscript:@"StatusKitDataKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v4 = (objc_class *)MEMORY[0x263EFF8F8];
      id v5 = v3;
      double v6 = (void *)[[v4 alloc] initWithBase64EncodedString:v5 options:0];
    }
    else
    {
      uint64_t v7 = +[SKAPushManager logger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __55__SKAPushManager_connection_didReceiveIncomingMessage___block_invoke_cold_2();
      }

      double v6 = 0;
    }
    uint64_t v8 = [*(id *)(a1 + 32) delegate];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) channelID];
    uint64_t v11 = [*(id *)(a1 + 40) identifier];
    id v12 = [*(id *)(a1 + 40) timestamp];
    uint64_t v13 = [*(id *)(a1 + 40) expirationDate];
    [v8 pushManager:v9 didReceiveData:v6 onChannel:v10 identifier:v11 dateReceived:v12 dateExpired:v13];
  }
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = +[SKAPushManager logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[SKAPushManager connection:channelSubscriptionsFailedWithFailures:]((uint64_t)v5, v6);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [v12 channelID];
        queue = self->_queue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __68__SKAPushManager_connection_channelSubscriptionsFailedWithFailures___block_invoke;
        block[3] = &unk_2646E1BE8;
        block[4] = v12;
        block[5] = self;
        id v17 = v13;
        id v15 = v13;
        dispatch_async(queue, block);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

void __68__SKAPushManager_connection_channelSubscriptionsFailedWithFailures___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F79868], (int)objc_msgSend(*(id *)(a1 + 32), "failureReason"), 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 40) delegate];
  [v2 pushManager:*(void *)(a1 + 40) failedToSubscribeToChannel:*(void *)(a1 + 48) withError:v3];
}

- (BOOL)_sharedChannelsIsDisabledByServer
{
  id v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"shared-channels-disabled"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 BOOLValue])
  {
    double v4 = +[SKAPushManager logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SKAPushManager _sharedChannelsIsDisabledByServer]();
    }

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)logger
{
  if (logger_onceToken_17 != -1) {
    dispatch_once(&logger_onceToken_17, &__block_literal_global_17);
  }
  id v2 = (void *)logger__logger_17;
  return v2;
}

uint64_t __24__SKAPushManager_logger__block_invoke()
{
  logger__logger_17 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAPushManager");
  return MEMORY[0x270F9A758]();
}

- (SKAPushManagingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SKAPushManagingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SKASystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
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
  objc_storeStrong((id *)&self->_messageDelivery, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)createChannelWithProtoData:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Shared channels disabled by server! Aborting", v2, v3, v4, v5, v6);
}

- (void)createChannelWithProtoData:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_3(&dword_22480C000, v0, v1, "Not under first data protection lock but no APS connection!", v2, v3, v4, v5, v6);
}

- (void)createChannelWithProtoData:completion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "No active APS connection. Cannot change topic filter.", v2, v3, v4, v5, v6);
}

void __56__SKAPushManager_createChannelWithProtoData_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22480C000, a2, OS_LOG_TYPE_ERROR, "Trying to create a channel resulted in error %@", (uint8_t *)&v2, 0xCu);
}

- (void)publishStatus:completion:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Traffic mode is enabled. Aborting publish", v2, v3, v4, v5, v6);
}

void __43__SKAPushManager_publishStatus_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Publishing status failed with resultCode %ld error: %@");
}

- (void)provisionPayload:completion:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Traffic mode is enabled. Aborting provision", v2, v3, v4, v5, v6);
}

void __46__SKAPushManager_provisionPayload_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Provisioning failed with resultCode %ld error: %@");
}

- (void)pushToken
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "No APSConnection. Cannot fetch push token", v2, v3, v4, v5, v6);
}

void __49__SKAPushManager_sendPresenceMessage_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_22480C000, v0, v1, "Presence protobuff send failed with resultCode %ld error: %@");
}

void __61__SKAPushManager__subscribedChannelsForTopic_WithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4(&dword_22480C000, a2, a3, "Error fetching subscribed channels for topic %@! Error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)serverTime
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "APSConnection server time is invalid. Using current system time", v2, v3, v4, v5, v6);
}

void __55__SKAPushManager_connection_didReceiveIncomingMessage___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Status kit message data undecodable", v2, v3, v4, v5, v6);
}

- (void)connection:(uint64_t)a1 channelSubscriptionsFailedWithFailures:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22480C000, a2, OS_LOG_TYPE_ERROR, "Channel subscription failed. Failures: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_sharedChannelsIsDisabledByServer
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Shared channels has been disabled in the server bag!", v2, v3, v4, v5, v6);
}

@end