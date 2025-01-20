@interface SKAStatusServer
+ (id)logger;
+ (id)sharedInstance;
- (BOOL)_inTextTrafficMode;
- (BOOL)_kettleFeatureEnabled;
- (BOOL)_presenceServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)_publishingServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)_shouldDonateToBiomeForStatusTypeIdentifier:(id)a3;
- (BOOL)_subscriptionServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)trafficModeEnabled;
- (NSArray)idsDevices;
- (NSMutableArray)presenceConnectedClients;
- (NSMutableArray)publishingServiceConnectedClients;
- (NSMutableArray)subscriptionServiceConnectedClients;
- (NSXPCListener)presenceListener;
- (NSXPCListener)publishingServiceListener;
- (NSXPCListener)subscriptionServiceListener;
- (OS_dispatch_queue)invitationManagerMessagingQueue;
- (OS_dispatch_queue)presenceConnectionQueue;
- (OS_dispatch_queue)publishingServiceConnectionQueue;
- (OS_dispatch_queue)subscriptionServiceConnectionQueue;
- (SKAChannelManaging)channelManager;
- (SKADatabaseManaging)databaseManager;
- (SKADatabaseProviding)databaseProvider;
- (SKAInvitationManaging)invitationManager;
- (SKAMessagingProviding)invitationMessagingProvider;
- (SKAPresenceManaging)presenceManager;
- (SKAStatusEncryptionManaging)encryptionManager;
- (SKAStatusPublishingManaging)publishingManager;
- (SKAStatusReceivingManaging)statusReceivingManager;
- (SKAStatusServer)init;
- (SKAStatusSubscriptionManaging)subscriptionManager;
- (id)_senderHandlesForChannel:(id)a3;
- (id)registerIDSDeviceChangedObserver:(id)a3;
- (void)_notifyPresenceClientsIfNeededOfChannelChangeForChannel:(id)a3;
- (void)_setupMaintenanceActivity;
- (void)channelManager:(id)a3 didReceiveData:(id)a4 onChannel:(id)a5 identifier:(unint64_t)a6 dateReceived:(id)a7 dateExpired:(id)a8;
- (void)channelManager:(id)a3 failedToSubscribeToChannel:(id)a4 withError:(id)a5;
- (void)databaseDidReceiveRemoteChangesForChannels:(id)a3;
- (void)databaseManager:(id)a3 didCreateChannel:(id)a4;
- (void)donateReceivedStatusToBiomeOnChannel:(id)a3;
- (void)initialCloudKitImportReceived:(id)a3;
- (void)invitationManager:(id)a3 didReceiveInvitation:(id)a4 forChannel:(id)a5;
- (void)invitationManager:(id)a3 didRevokeInvitationOnChannel:(id)a4;
- (void)logState;
- (void)networkBecameReachable;
- (void)presenceClientWasInvalidated:(id)a3;
- (void)presenceManager:(id)a3 didCreateChannel:(id)a4;
- (void)presenceManager:(id)a3 didReceivePresentDevicesUpdateForPresenceIdentifier:(id)a4;
- (void)presenceManager:(id)a3 didRequestToRollChannel:(id)a4;
- (void)publishingServiceClientWasInvalidated:(id)a3;
- (void)service:(id)a3 didReceiveIncomingMessage:(id)a4 fromID:(id)a5 toID:(id)a6 messageGuid:(id)a7;
- (void)service:(id)a3 outgoingMessageWithIdentifier:(id)a4 fromID:(id)a5 toID:(id)a6 didSendWithSuccess:(BOOL)a7;
- (void)setChannelManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDatabaseProvider:(id)a3;
- (void)setEncryptionManager:(id)a3;
- (void)setInvitationManager:(id)a3;
- (void)setInvitationManagerMessagingQueue:(id)a3;
- (void)setInvitationMessagingProvider:(id)a3;
- (void)setPresenceConnectedClients:(id)a3;
- (void)setPresenceConnectionQueue:(id)a3;
- (void)setPresenceListener:(id)a3;
- (void)setPresenceManager:(id)a3;
- (void)setPublishingManager:(id)a3;
- (void)setPublishingServiceConnectedClients:(id)a3;
- (void)setPublishingServiceConnectionQueue:(id)a3;
- (void)setPublishingServiceListener:(id)a3;
- (void)setStatusReceivingManager:(id)a3;
- (void)setSubscriptionManager:(id)a3;
- (void)setSubscriptionServiceConnectedClients:(id)a3;
- (void)setSubscriptionServiceConnectionQueue:(id)a3;
- (void)setSubscriptionServiceListener:(id)a3;
- (void)setTrafficModeEnabled:(BOOL)a3;
- (void)shutdown;
- (void)statusReceivingManager:(id)a3 didReceiveStatusUpdate:(id)a4 onChannel:(id)a5;
- (void)subscriptionServiceClientWasInvalidated:(id)a3;
- (void)unregisterIDSDeviceChangedObserver:(id)a3;
@end

@implementation SKAStatusServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __33__SKAStatusServer_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_alloc_init(SKAStatusServer);
  return MEMORY[0x270F9A758]();
}

- (SKAStatusServer)init
{
  v3 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Initializing", buf, 2u);
  }

  v49.receiver = self;
  v49.super_class = (Class)SKAStatusServer;
  v4 = [(SKAStatusServer *)&v49 init];
  v5 = v4;
  if (v4)
  {
    v6 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
    objc_storeStrong((id *)&v4->_publishingServiceConnectionQueue, MEMORY[0x263EF83A0]);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    publishingServiceConnectedClients = v5->_publishingServiceConnectedClients;
    v5->_publishingServiceConnectedClients = v7;

    subscriptionServiceConnectionQueue = v5->_subscriptionServiceConnectionQueue;
    v5->_subscriptionServiceConnectionQueue = v6;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    subscriptionServiceConnectedClients = v5->_subscriptionServiceConnectedClients;
    v5->_subscriptionServiceConnectedClients = v10;

    presenceConnectionQueue = v5->_presenceConnectionQueue;
    v5->_presenceConnectionQueue = v6;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    presenceConnectedClients = v5->_presenceConnectedClients;
    v5->_presenceConnectedClients = v13;

    v15 = [[SKADatabaseProvider alloc] initWithDelegate:v5];
    databaseProvider = v5->_databaseProvider;
    v5->_databaseProvider = (SKADatabaseProviding *)v15;

    v17 = [[SKADatabaseManager alloc] initWithDatabaseProvider:v5->_databaseProvider delegate:v5];
    databaseManager = v5->_databaseManager;
    v5->_databaseManager = (SKADatabaseManaging *)v17;

    BOOL v19 = [(SKAStatusServer *)v5 _inTextTrafficMode];
    v5->_trafficModeEnabled = v19;
    if (v19)
    {
      v20 = +[SKAStatusServer logger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22480C000, v20, OS_LOG_TYPE_DEFAULT, "In Traffic Mode--will not honor status subscriptions and will drop incoming status's", buf, 2u);
      }
    }
    v21 = [SKAPushManager alloc];
    v22 = +[SKASystemMonitor sharedInstance];
    v23 = [(SKAPushManager *)v21 initWithQueue:v6 systemMonitor:v22 inTrafficMode:v5->_trafficModeEnabled];

    v24 = objc_alloc_init(SKAAccountProvider);
    v25 = [[SKAChannelManager alloc] initWithPushManager:v23 accountProvider:v24 delegate:v5];
    channelManager = v5->_channelManager;
    v5->_channelManager = (SKAChannelManaging *)v25;

    v27 = [[SKAStatusSubscriptionManager alloc] initWithDatabaseManager:v5->_databaseManager channelManager:v5->_channelManager pushManager:v23];
    subscriptionManager = v5->_subscriptionManager;
    v5->_subscriptionManager = (SKAStatusSubscriptionManaging *)v27;

    invitationManagerMessagingQueue = v5->_invitationManagerMessagingQueue;
    v5->_invitationManagerMessagingQueue = v6;

    v30 = [[SKAMessagingProvider alloc] initWithDelegate:v5 serviceIdentifier:@"com.apple.private.alloy.status.keysharing" pushManager:v23 queue:v5->_invitationManagerMessagingQueue];
    invitationMessagingProvider = v5->_invitationMessagingProvider;
    v5->_invitationMessagingProvider = (SKAMessagingProviding *)v30;

    v32 = [[SKAPresenceManager alloc] initWithDatabaseManager:v5->_databaseManager channelManager:v5->_channelManager subscriptionManager:v5->_subscriptionManager accountProvider:v24 messagingProvider:v5->_invitationMessagingProvider delegate:v5];
    presenceManager = v5->_presenceManager;
    v5->_presenceManager = (SKAPresenceManaging *)v32;

    v34 = [[SKAInvitationManager alloc] initWithMessagingProvider:v5->_invitationMessagingProvider databaseManager:v5->_databaseManager accountProvider:v24 channelManager:v5->_channelManager presenceManager:v5->_presenceManager trafficMode:v5->_trafficModeEnabled];
    invitationManager = v5->_invitationManager;
    v5->_invitationManager = (SKAInvitationManaging *)v34;

    [(SKAInvitationManaging *)v5->_invitationManager setDelegate:v5];
    v36 = [[SKAStatusEncryptionManager alloc] initWithDatabaseManager:v5->_databaseManager invitationManager:v5->_invitationManager];
    encryptionManager = v5->_encryptionManager;
    v5->_encryptionManager = (SKAStatusEncryptionManaging *)v36;

    v38 = [[SKAStatusReceivingManager alloc] initWithDatabaseManager:v5->_databaseManager encryptionManager:v5->_encryptionManager delegate:v5];
    statusReceivingManager = v5->_statusReceivingManager;
    v5->_statusReceivingManager = (SKAStatusReceivingManaging *)v38;

    v40 = [[SKAStatusPublishingManager alloc] initWithDatabaseManager:v5->_databaseManager channelManager:v5->_channelManager accountProvider:v24 encryptionManager:v5->_encryptionManager invitationManager:v5->_invitationManager];
    publishingManager = v5->_publishingManager;
    v5->_publishingManager = (SKAStatusPublishingManaging *)v40;

    uint64_t v42 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.StatusKit.publish"];
    publishingServiceListener = v5->_publishingServiceListener;
    v5->_publishingServiceListener = (NSXPCListener *)v42;

    [(NSXPCListener *)v5->_publishingServiceListener setDelegate:v5];
    [(NSXPCListener *)v5->_publishingServiceListener _setQueue:v5->_publishingServiceConnectionQueue];
    [(NSXPCListener *)v5->_publishingServiceListener resume];
    uint64_t v44 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.StatusKit.subscribe"];
    subscriptionServiceListener = v5->_subscriptionServiceListener;
    v5->_subscriptionServiceListener = (NSXPCListener *)v44;

    [(NSXPCListener *)v5->_subscriptionServiceListener setDelegate:v5];
    [(NSXPCListener *)v5->_subscriptionServiceListener _setQueue:v5->_subscriptionServiceConnectionQueue];
    [(NSXPCListener *)v5->_subscriptionServiceListener resume];
    uint64_t v46 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.StatusKit.presence"];
    presenceListener = v5->_presenceListener;
    v5->_presenceListener = (NSXPCListener *)v46;

    [(NSXPCListener *)v5->_presenceListener setDelegate:v5];
    [(NSXPCListener *)v5->_presenceListener _setQueue:v5->_presenceConnectionQueue];
    [(NSXPCListener *)v5->_presenceListener resume];
    [(SKAStatusServer *)v5 _setupMaintenanceActivity];
  }
  return v5;
}

- (void)shutdown
{
  v3 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Shutting down", v10, 2u);
  }

  [(NSMutableArray *)self->_publishingServiceConnectedClients removeAllObjects];
  publishingServiceConnectedClients = self->_publishingServiceConnectedClients;
  self->_publishingServiceConnectedClients = 0;

  [(NSXPCListener *)self->_publishingServiceListener invalidate];
  publishingServiceListener = self->_publishingServiceListener;
  self->_publishingServiceListener = 0;

  [(NSMutableArray *)self->_subscriptionServiceConnectedClients removeAllObjects];
  subscriptionServiceConnectedClients = self->_subscriptionServiceConnectedClients;
  self->_subscriptionServiceConnectedClients = 0;

  [(NSXPCListener *)self->_subscriptionServiceListener invalidate];
  subscriptionServiceListener = self->_subscriptionServiceListener;
  self->_subscriptionServiceListener = 0;

  [(NSMutableArray *)self->_presenceConnectedClients removeAllObjects];
  presenceConnectedClients = self->_presenceConnectedClients;
  self->_presenceConnectedClients = 0;

  [(NSXPCListener *)self->_presenceListener invalidate];
  presenceListener = self->_presenceListener;
  self->_presenceListener = 0;
}

- (void)logState
{
  v2 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_22480C000, v2, OS_LOG_TYPE_DEFAULT, "Logging state", v3, 2u);
  }
}

+ (id)logger
{
  if (logger_onceToken_21 != -1) {
    dispatch_once(&logger_onceToken_21, &__block_literal_global_30);
  }
  v2 = (void *)logger__logger_21;
  return v2;
}

uint64_t __25__SKAStatusServer_logger__block_invoke()
{
  logger__logger_21 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAStatusServer");
  return MEMORY[0x270F9A758]();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 serviceName];
  if ([v8 isEqualToString:@"com.apple.StatusKit.publish"])
  {
    v9 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      uint64_t v18 = (int)[v7 processIdentifier];
      _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Receiving XPC connection from PID %ld for publishing service", (uint8_t *)&v17, 0xCu);
    }

    BOOL v10 = [(SKAStatusServer *)self _publishingServiceListener:v6 shouldAcceptNewConnection:v7];
LABEL_13:
    BOOL v15 = v10;
    goto LABEL_14;
  }
  if ([v8 isEqualToString:@"com.apple.StatusKit.subscribe"])
  {
    v11 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      uint64_t v18 = (int)[v7 processIdentifier];
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Receiving XPC connection from PID %ld for subscription service", (uint8_t *)&v17, 0xCu);
    }

    BOOL v10 = [(SKAStatusServer *)self _subscriptionServiceListener:v6 shouldAcceptNewConnection:v7];
    goto LABEL_13;
  }
  int v12 = [v8 isEqualToString:@"com.apple.StatusKit.presence"];
  v13 = +[SKAStatusServer logger];
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      uint64_t v18 = (int)[v7 processIdentifier];
      _os_log_impl(&dword_22480C000, v14, OS_LOG_TYPE_DEFAULT, "Receiving XPC connection from PID %ld for presence", (uint8_t *)&v17, 0xCu);
    }

    BOOL v10 = [(SKAStatusServer *)self _presenceServiceListener:v6 shouldAcceptNewConnection:v7];
    goto LABEL_13;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[SKAStatusServer listener:shouldAcceptNewConnection:](v7, (uint64_t)v8, v14);
  }

  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)_publishingServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = +[SKAStatusPublishingServiceClientConnection clientIsEntitledForAtLeastOnePublishingServiceType:v5];
  id v7 = +[SKAStatusServer logger];
  v8 = (SKAStatusPublishingServiceClient *)v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = (int)[v5 processIdentifier];
      _os_log_impl(&dword_22480C000, &v8->super, OS_LOG_TYPE_DEFAULT, "Accepted XPC connection from PID %ld for publishing service", buf, 0xCu);
    }

    v8 = [[SKAStatusPublishingServiceClient alloc] initWithXPCConnection:v5 queue:self->_publishingServiceConnectionQueue delegate:self databaseManager:self->_databaseManager invitationManager:self->_invitationManager publishingManager:self->_publishingManager channelManager:self->_channelManager];
    [(NSMutableArray *)self->_publishingServiceConnectedClients addObject:v8];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[SKAStatusServer _publishingServiceListener:shouldAcceptNewConnection:](v5);
  }

  return v6;
}

- (BOOL)_presenceServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = (int)[v5 processIdentifier];
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Incoming XPC connection from PID %ld for presence service", buf, 0xCu);
  }

  id v7 = objc_msgSend(v5, "sk_stringValueForEntitlement:", @"com.apple.StatusKit.presence.clientID");
  uint64_t v8 = [v7 length];
  v9 = +[SKAStatusServer logger];
  BOOL v10 = (SKAPresenceClient *)v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [v5 processIdentifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_22480C000, &v10->super, OS_LOG_TYPE_DEFAULT, "Accepting XPC connection from PID %ld for presence service with clientid:%@", buf, 0x16u);
    }

    BOOL v10 = [[SKAPresenceClient alloc] initWithXPCConnection:v5 queue:self->_presenceConnectionQueue delegate:self subscriptionManager:self->_subscriptionManager presenceManager:self->_presenceManager invitationManager:self->_invitationManager databaseManager:self->_databaseManager];
    [(NSMutableArray *)self->_presenceConnectedClients addObject:v10];
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[SKAStatusServer _presenceServiceListener:shouldAcceptNewConnection:](v5, &v10->super);
  }

  return v8 != 0;
}

- (BOOL)_subscriptionServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = +[SKAStatusSubscriptionServiceClientConnection clientIsEntitledForAtLeastOneSubscriptionServiceType:v5];
  id v7 = +[SKAStatusServer logger];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = (int)[v5 processIdentifier];
      _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Accepted XPC connection from PID %ld for subscription service", buf, 0xCu);
    }

    v9 = [SKAStatusSubscriptionServiceClient alloc];
    LOBYTE(v11) = self->_trafficModeEnabled;
    uint64_t v8 = [(SKAStatusSubscriptionServiceClient *)v9 initWithXPCConnection:v5 queue:self->_publishingServiceConnectionQueue delegate:self databaseManager:self->_databaseManager subscriptionManager:self->_subscriptionManager encryptionManager:self->_encryptionManager inTrafficMode:v11];
    [(NSMutableArray *)self->_subscriptionServiceConnectedClients addObject:v8];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[SKAStatusServer _subscriptionServiceListener:shouldAcceptNewConnection:](v5);
  }

  return v6;
}

- (void)subscriptionServiceClientWasInvalidated:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  subscriptionServiceConnectionQueue = self->_subscriptionServiceConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SKAStatusServer_subscriptionServiceClientWasInvalidated___block_invoke;
  block[3] = &unk_2646E1DF0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(subscriptionServiceConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__SKAStatusServer_subscriptionServiceClientWasInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Subscription service client was invalidated. Removing client: %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [WeakRetained subscriptionServiceConnectedClients];
  [v5 removeObject:*(void *)(a1 + 32)];
}

- (void)publishingServiceClientWasInvalidated:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  publishingServiceConnectionQueue = self->_publishingServiceConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SKAStatusServer_publishingServiceClientWasInvalidated___block_invoke;
  block[3] = &unk_2646E1DF0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(publishingServiceConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__SKAStatusServer_publishingServiceClientWasInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Publishing service client was invalidated. Removing client: %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [WeakRetained publishingServiceConnectedClients];
  [v5 removeObject:*(void *)(a1 + 32)];
}

- (void)presenceClientWasInvalidated:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  presenceConnectionQueue = self->_presenceConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SKAStatusServer_presenceClientWasInvalidated___block_invoke;
  block[3] = &unk_2646E1DF0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(presenceConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__SKAStatusServer_presenceClientWasInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    int v9 = 138412290;
    BOOL v10 = v4;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Presence client was invalidated. Removing client: %@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = [WeakRetained presenceConnectedClients];
  [v5 removeObject:*(void *)(a1 + 32)];

  id v6 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) transaction];
    id v8 = [v7 description];
    int v9 = 138412290;
    BOOL v10 = v8;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "SKATransaction: Completed transaction %@", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 32) setTransaction:0];
}

- (void)databaseDidReceiveRemoteChangesForChannels:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Received remote database changes for channels: %@", buf, 0xCu);
  }

  [(SKAStatusSubscriptionManaging *)self->_subscriptionManager updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:&__block_literal_global_43_0];
  objc_initWeak((id *)buf, self);
  subscriptionServiceConnectionQueue = self->_subscriptionServiceConnectionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_44;
  v8[3] = &unk_2646E1DF0;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(subscriptionServiceConnectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[SKAStatusServer logger];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_cold_1((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Success updating subscriptions following remote database changes", v5, 2u);
  }
}

void __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_44(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained databaseManager];
  v3 = (void *)[v2 newBackgroundContext];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v11 = [v2 existingChannelForSubscriptionIdentifier:v10 databaseContext:v3];
        if (v11)
        {
          [v4 addObject:v11];
        }
        else
        {
          id v12 = +[SKAStatusServer logger];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v40 = v10;
            _os_log_error_impl(&dword_22480C000, v12, OS_LOG_TYPE_ERROR, "Could not find channel matching changed channelIdentifier: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v13 = WeakRetained;
    uint64_t v14 = [WeakRetained subscriptionServiceConnectedClients];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * j) handleRemoteDatabaseChangeForChannels:v4];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v16);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v19 = v4;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          [WeakRetained _notifyPresenceClientsIfNeededOfChannelChangeForChannel:*(void *)(*((void *)&v25 + 1) + 8 * k)];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v21);
    }
  }
  else
  {
    uint64_t v19 = +[SKAStatusServer logger];
    uint64_t v13 = WeakRetained;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_44_cold_1();
    }
  }
}

- (void)initialCloudKitImportReceived:(id)a3
{
  objc_initWeak(&location, self);
  presenceConnectionQueue = self->_presenceConnectionQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__SKAStatusServer_initialCloudKitImportReceived___block_invoke;
  v5[3] = &unk_2646E1E18;
  objc_copyWeak(&v6, &location);
  dispatch_async(presenceConnectionQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __49__SKAStatusServer_initialCloudKitImportReceived___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(WeakRetained, "presenceConnectedClients", 0);
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) initialCloudKitImportReceived];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)service:(id)a3 didReceiveIncomingMessage:(id)a4 fromID:(id)a5 toID:(id)a6 messageGuid:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a6;
  uint64_t v17 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412802;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v14;
    __int16 v27 = 2112;
    id v28 = v13;
    _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Incoming message received. Service: %@ senderID: %@ guid: %@", (uint8_t *)&v23, 0x20u);
  }

  uint64_t v18 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Handling message as key invite", (uint8_t *)&v23, 2u);
  }

  uint64_t v19 = (void *)IDSCopyRawAddressForDestination();
  uint64_t v20 = (void *)IDSCopyRawAddressForDestination();

  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F797B8]) initWithString:v19];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F797B8]) initWithString:v20];
  [(SKAInvitationManaging *)self->_invitationManager handleIncomingInvitationMessage:v13 fromHandle:v21 fromID:v14 toHandle:v22 messageGuid:v15];
}

- (void)service:(id)a3 outgoingMessageWithIdentifier:(id)a4 fromID:(id)a5 toID:(id)a6 didSendWithSuccess:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a6;
  id v11 = a4;
  id v15 = (id)IDSCopyRawAddressForDestination();
  id v12 = (void *)IDSCopyRawAddressForDestination();

  id v13 = (void *)[objc_alloc(MEMORY[0x263F797B8]) initWithString:v15];
  id v14 = (void *)[objc_alloc(MEMORY[0x263F797B8]) initWithString:v12];
  [(SKAInvitationManaging *)self->_invitationManager outgoingMessageWithIdentifier:v11 fromHandle:v13 toHandle:v14 didSendWithSuccess:v7];
}

- (void)networkBecameReachable
{
  uint64_t v3 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Received network reachable notification", buf, 2u);
  }

  if ([(SKAStatusServer *)self _kettleFeatureEnabled])
  {
    [(SKAStatusPublishingManaging *)self->_publishingManager publishPendingRequestForReason:0];
  }
  else
  {
    uint64_t v4 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Kettle feature flag not enabled.  Exiting.", v5, 2u);
    }
  }
}

- (void)channelManager:(id)a3 didReceiveData:(id)a4 onChannel:(id)a5 identifier:(unint64_t)a6 dateReceived:(id)a7 dateExpired:(id)a8
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v14;
    __int16 v32 = 2048;
    unint64_t v33 = a6;
    _os_log_impl(&dword_22480C000, v17, OS_LOG_TYPE_DEFAULT, "Received data on channel: %@ identifier: %lu", buf, 0x16u);
  }

  uint64_t v18 = [(SKAStatusServer *)self databaseManager];
  uint64_t v19 = (void *)[v18 newBackgroundContext];

  uint64_t v20 = [(SKAStatusServer *)self databaseManager];
  uint64_t v21 = [v20 existingChannelForSubscriptionIdentifier:v14 databaseContext:v19];

  if (!v21)
  {
    id v26 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusServer channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:]();
    }
    goto LABEL_21;
  }
  if (![v21 channelType])
  {
    __int16 v27 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v27, OS_LOG_TYPE_DEFAULT, "Handling as status update", buf, 2u);
    }

    if (self->_trafficModeEnabled)
    {
      id v26 = +[SKAStatusServer logger];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusServer channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:]();
      }
    }
    else
    {
      statusReceivingManager = self->_statusReceivingManager;
      id v26 = [(SKAChannelManaging *)self->_channelManager serverTime];
      [(SKAStatusReceivingManaging *)statusReceivingManager handleIncomingStatusData:v13 onChannelIdentifier:v14 dateReceived:v15 dateExpired:v16 serverTime:v26];
    }
LABEL_21:

    goto LABEL_22;
  }
  id v29 = v16;
  id v22 = v15;
  uint64_t v23 = [v21 channelType];
  id v24 = +[SKAStatusServer logger];
  __int16 v25 = v24;
  if (v23 == 1)
  {
    id v15 = v22;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v25, OS_LOG_TYPE_DEFAULT, "Handling as presence update", buf, 2u);
    }

    [(SKAPresenceManaging *)self->_presenceManager channelReceivedIncomingPayloadUpdate:v13 channel:v21 withIdentifier:a6];
  }
  else
  {
    id v15 = v22;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SKAStatusServer channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:]();
    }
  }
  id v16 = v29;
LABEL_22:
}

- (void)channelManager:(id)a3 failedToSubscribeToChannel:(id)a4 withError:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  long long v8 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[SKAStatusServer channelManager:failedToSubscribeToChannel:withError:]((uint64_t)v6, (uint64_t)v7, v8);
  }
}

- (void)statusReceivingManager:(id)a3 didReceiveStatusUpdate:(id)a4 onChannel:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v9;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Server received status update: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  subscriptionServiceConnectionQueue = self->_subscriptionServiceConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__SKAStatusServer_statusReceivingManager_didReceiveStatusUpdate_onChannel___block_invoke;
  block[3] = &unk_2646E1970;
  objc_copyWeak(&v18, (id *)buf);
  id v13 = v9;
  id v16 = v13;
  id v14 = v10;
  id v17 = v14;
  dispatch_async(subscriptionServiceConnectionQueue, block);
  [(SKAStatusServer *)self donateReceivedStatusToBiomeOnChannel:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __75__SKAStatusServer_statusReceivingManager_didReceiveStatusUpdate_onChannel___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = objc_msgSend(WeakRetained, "subscriptionServiceConnectedClients", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) handleReceivedStatusUpdate:*(void *)(a1 + 32) onChannel:*(void *)(a1 + 40)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)donateReceivedStatusToBiomeOnChannel:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 statusType];
  if ([(SKAStatusServer *)self _shouldDonateToBiomeForStatusTypeIdentifier:v5])
  {
    uint64_t v6 = [(SKAStatusServer *)self _senderHandlesForChannel:v4];
    uint64_t v7 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = [v6 allObjects];
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v5;
      _os_log_impl(&dword_22480C000, v7, OS_LOG_TYPE_DEFAULT, "Writing to Biome event with IDSHandle: %@, statusTypeIdentifier %@", (uint8_t *)&v16, 0x16u);
    }
    long long v9 = BiomeLibrary();
    long long v10 = [v9 UserFocus];
    long long v11 = [v10 StatusChange];

    id v12 = objc_alloc(MEMORY[0x263F2A5B0]);
    uint64_t v13 = [v6 allObjects];
    id v14 = (void *)[v12 initWithIdsHandle:0 statusChangeType:v5 idsHandles:v13];

    id v15 = [v11 source];
    [v15 sendEvent:v14];
  }
}

- (id)_senderHandlesForChannel:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  uint64_t v6 = [(SKADatabaseManaging *)self->_databaseManager receivedInvitationsForChannel:v4 databaseContext:v5];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "senderHandle", (void)v18);

        if (v14)
        {
          id v15 = [v13 senderHandle];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  int v16 = (void *)[v7 copy];
  return v16;
}

- (BOOL)_shouldDonateToBiomeForStatusTypeIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v5 = [v4 objectForKey:@"BiomeDonationEnabled"];
    uint64_t v6 = v5;
    if (v5 && ![v5 BOOLValue]) {
      char v7 = 0;
    }
    else {
      char v7 = [&unk_26D7BA160 containsObject:v3];
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)databaseManager:(id)a3 didCreateChannel:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 identifier];
  char v7 = [v5 statusType];
  id v8 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Channel created with identifier: %@ type: %@", (uint8_t *)&v11, 0x16u);
  }

  if ([v5 isPersonal])
  {
    uint64_t v9 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Updating registered subscription to allow self subscription to personal channel, if necessary", (uint8_t *)&v11, 2u);
    }

    uint64_t v10 = [(SKAStatusServer *)self subscriptionManager];
    [v10 updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:&__block_literal_global_56];
  }
}

void __52__SKAStatusServer_databaseManager_didCreateChannel___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SKAStatusServer logger];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __52__SKAStatusServer_databaseManager_didCreateChannel___block_invoke_cold_1((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Updating registered subscription to allow self subscriptions completed", v5, 2u);
  }
}

- (void)presenceManager:(id)a3 didReceivePresentDevicesUpdateForPresenceIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Server received present devices update on presence identifier: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  presenceConnectionQueue = self->_presenceConnectionQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__SKAStatusServer_presenceManager_didReceivePresentDevicesUpdateForPresenceIdentifier___block_invoke;
  v9[3] = &unk_2646E1DF0;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v5;
  id v8 = v5;
  dispatch_async(presenceConnectionQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __87__SKAStatusServer_presenceManager_didReceivePresentDevicesUpdateForPresenceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(WeakRetained, "presenceConnectedClients", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) handleReceivedPresentDevicesUpdateForPresenceIdentifier:*(void *)(a1 + 32)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)presenceManager:(id)a3 didCreateChannel:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "New presence channel created. Sending self invite for channel: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = [(SKAStatusServer *)self invitationManager];
  long long v8 = [v5 presenceIdentifier];
  objc_msgSend(v7, "sendSelfInvitationForPresenceChannelWithPresenceIdentifier:isPersonal:completion:", v8, objc_msgSend(v5, "isPersonal"), &__block_literal_global_59);
}

void __52__SKAStatusServer_presenceManager_didCreateChannel___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Sent self-invite with success:%d and error:%@", (uint8_t *)v6, 0x12u);
  }
}

- (void)presenceManager:(id)a3 didRequestToRollChannel:(id)a4
{
  id v5 = a4;
  id v8 = [(SKAStatusServer *)self invitationManager];
  uint64_t v6 = [v5 presenceIdentifier];
  uint64_t v7 = [v5 isPersonal];

  [v8 rollPresenceChannelWithPresenceIdentifier:v6 isPersonal:v7 completion:&__block_literal_global_62];
}

void __59__SKAStatusServer_presenceManager_didRequestToRollChannel___block_invoke(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Finished rolling channel with success %d", (uint8_t *)v4, 8u);
  }
}

- (void)invitationManager:(id)a3 didReceiveInvitation:(id)a4 forChannel:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v10;
    _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "Received channel invitation on channel: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  if ([v9 invitationType])
  {
    id v12 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v26 = 0;
      _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Handling invitation as presence invite", v26, 2u);
    }

    [(SKAStatusServer *)self _notifyPresenceClientsIfNeededOfChannelChangeForChannel:v10];
    presenceConnectionQueue = self->_presenceConnectionQueue;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __69__SKAStatusServer_invitationManager_didReceiveInvitation_forChannel___block_invoke_63;
    v20[3] = &unk_2646E1DF0;
    uint64_t v14 = &v22;
    objc_copyWeak(&v22, (id *)buf);
    uint64_t v15 = &v21;
    id v21 = v10;
    id v16 = v10;
    id v17 = v20;
  }
  else
  {
    long long v18 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v26 = 0;
      _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Handling invitation as status invite", v26, 2u);
    }

    presenceConnectionQueue = self->_subscriptionServiceConnectionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__SKAStatusServer_invitationManager_didReceiveInvitation_forChannel___block_invoke;
    block[3] = &unk_2646E1DF0;
    uint64_t v14 = &v25;
    objc_copyWeak(&v25, (id *)buf);
    uint64_t v15 = &v24;
    id v24 = v10;
    id v19 = v10;
    id v17 = block;
  }
  dispatch_async(presenceConnectionQueue, v17);

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)buf);
}

void __69__SKAStatusServer_invitationManager_didReceiveInvitation_forChannel___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(WeakRetained, "subscriptionServiceConnectedClients", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) handleReceivedInvitationForChannel:*(void *)(a1 + 32)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __69__SKAStatusServer_invitationManager_didReceiveInvitation_forChannel___block_invoke_63(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(WeakRetained, "presenceConnectedClients", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        long long v9 = [*(id *)(a1 + 32) presenceIdentifier];
        [v8 handleReceivedInvitationForPresenceIdentifier:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_notifyPresenceClientsIfNeededOfChannelChangeForChannel:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  uint64_t v6 = [v4 presenceIdentifier];
  objc_initWeak(&location, self);
  if (v6)
  {
    uint64_t v7 = -[SKADatabaseManaging existingChannelForPresenceIdentifier:isPersonal:databaseContext:](self->_databaseManager, "existingChannelForPresenceIdentifier:isPersonal:databaseContext:", v6, [v4 isPersonal], v5);
    long long v8 = [v7 identifier];
    long long v9 = [v4 identifier];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      long long v11 = +[SKAStatusServer logger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v18 = v6;
        _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "New received invitation for presence identifier %@ updated the mapped channel.  Notifying connected clients to reassert if needed", buf, 0xCu);
      }

      presenceConnectionQueue = self->_presenceConnectionQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __75__SKAStatusServer__notifyPresenceClientsIfNeededOfChannelChangeForChannel___block_invoke;
      block[3] = &unk_2646E1DF0;
      objc_copyWeak(&v15, &location);
      id v14 = v6;
      dispatch_async(presenceConnectionQueue, block);

      objc_destroyWeak(&v15);
    }
  }
  objc_destroyWeak(&location);
}

void __75__SKAStatusServer__notifyPresenceClientsIfNeededOfChannelChangeForChannel___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(WeakRetained, "presenceConnectedClients", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) refreshAssertionsForPresenceIdentifier:*(void *)(a1 + 32)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)invitationManager:(id)a3 didRevokeInvitationOnChannel:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v5;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Revoked invitation(s) on channel: %@. Republishing current status", buf, 0xCu);
  }

  uint64_t v7 = [v5 statusType];
  long long v8 = (void *)[(SKADatabaseManaging *)self->_databaseManager newBackgroundContext];
  long long v9 = [(SKADatabaseManaging *)self->_databaseManager existingStatusForChannel:v5 databaseContext:v8];
  long long v10 = v9;
  if (v9)
  {
    long long v11 = [v9 rawData];
    long long v12 = [(SKAStatusEncryptionManaging *)self->_encryptionManager decryptStatusPayloadFromStatusEnvelopeData:v11 channel:v5];
    uint64_t v13 = v12;
    if (v12)
    {
      uint64_t v21 = [v12 statusPayload];
      id v14 = (void *)[objc_alloc(MEMORY[0x263F79828]) initWithStatusPayload:v21 isScheduledRequest:0];
      id v15 = [v10 dateCreated];
      [v15 dateByAddingTimeInterval:1.0];
      id v16 = v8;
      v18 = id v17 = v7;
      [v14 setDateCreated:v18];

      uint64_t v7 = v17;
      long long v8 = v16;

      publishingManager = self->_publishingManager;
      long long v20 = v21;
      [(SKAStatusPublishingManaging *)publishingManager publishStatusRequest:v14 statusTypeIdentifier:v7 afterTime:0 isPendingPublish:&__block_literal_global_67 completion:0.0];
    }
    else
    {
      long long v20 = +[SKAStatusServer logger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SKAStatusServer invitationManager:didRevokeInvitationOnChannel:]();
      }
    }
  }
  else
  {
    long long v11 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v11, OS_LOG_TYPE_DEFAULT, "No current status to republish", buf, 2u);
    }
  }
}

void __66__SKAStatusServer_invitationManager_didRevokeInvitationOnChannel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_22480C000, v6, OS_LOG_TYPE_DEFAULT, "Finished republishing status.  ID:%@ error:%@", (uint8_t *)&v7, 0x16u);
  }
}

- (BOOL)_kettleFeatureEnabled
{
  if (_kettleFeatureEnabled_onceToken[0] != -1) {
    dispatch_once(_kettleFeatureEnabled_onceToken, &__block_literal_global_69);
  }
  return _kettleFeatureEnabled_kettleEnabled;
}

uint64_t __40__SKAStatusServer__kettleFeatureEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  _kettleFeatureEnabled_kettleEnabled = result;
  return result;
}

- (BOOL)_inTextTrafficMode
{
  id v2 = objc_msgSend((id)MEMORY[0x22A619920](@"LockdownModeManager", @"LockdownMode"), "shared");
  char v3 = [v2 enabled];

  return v3;
}

- (void)_setupMaintenanceActivity
{
  objc_initWeak(&location, self);
  id v2 = (void *)*MEMORY[0x263EF8188];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__SKAStatusServer__setupMaintenanceActivity__block_invoke;
  v3[3] = &unk_2646E1EA0;
  objc_copyWeak(&v4, &location);
  xpc_activity_register("com.apple.statuskit.maintenance", v2, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __44__SKAStatusServer__setupMaintenanceActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    id v10 = [WeakRetained subscriptionManager];
    [v10 updateRegisteredSubscriptionsForActiveAssertionsWithCompletion:&__block_literal_global_81];

    uint64_t v11 = [WeakRetained databaseManager];
    xpc_object_t v6 = (xpc_object_t)[v11 newBackgroundContext];

    long long v12 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Removing decomissioned channels", (uint8_t *)&v13, 2u);
    }

    id v8 = [WeakRetained databaseManager];
    [v8 cleanupDecommisionedChannelsWithDatabaseContext:v6];
    goto LABEL_12;
  }
  if (!state)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x263EF8180], 0);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF81E8]);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x263EF82D0], 1);
    xpc_object_t v7 = xpc_activity_copy_criteria(v3);
    id v8 = v7;
    if (!v7 || !xpc_equal(v7, v6)) {
      xpc_activity_set_criteria(v3, v6);
    }
    __int16 v9 = +[SKAStatusServer logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      xpc_object_t v14 = v6;
      _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Scheduling maintenance XPC activity %@", (uint8_t *)&v13, 0xCu);
    }

LABEL_12:
  }
}

void __44__SKAStatusServer__setupMaintenanceActivity__block_invoke_79(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  char v3 = +[SKAStatusServer logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_22480C000, v3, OS_LOG_TYPE_DEFAULT, "Finished maintenance subscription update with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (NSArray)idsDevices
{
  return (NSArray *)[(SKAMessagingProviding *)self->_invitationMessagingProvider idsDevices];
}

- (id)registerIDSDeviceChangedObserver:(id)a3
{
  return (id)[(SKAMessagingProviding *)self->_invitationMessagingProvider registerIDSDeviceChangedObserver:a3];
}

- (void)unregisterIDSDeviceChangedObserver:(id)a3
{
}

- (SKADatabaseProviding)databaseProvider
{
  return self->_databaseProvider;
}

- (void)setDatabaseProvider:(id)a3
{
}

- (NSXPCListener)publishingServiceListener
{
  return self->_publishingServiceListener;
}

- (void)setPublishingServiceListener:(id)a3
{
}

- (OS_dispatch_queue)publishingServiceConnectionQueue
{
  return self->_publishingServiceConnectionQueue;
}

- (void)setPublishingServiceConnectionQueue:(id)a3
{
}

- (NSMutableArray)publishingServiceConnectedClients
{
  return self->_publishingServiceConnectedClients;
}

- (void)setPublishingServiceConnectedClients:(id)a3
{
}

- (NSXPCListener)subscriptionServiceListener
{
  return self->_subscriptionServiceListener;
}

- (void)setSubscriptionServiceListener:(id)a3
{
}

- (OS_dispatch_queue)subscriptionServiceConnectionQueue
{
  return self->_subscriptionServiceConnectionQueue;
}

- (void)setSubscriptionServiceConnectionQueue:(id)a3
{
}

- (NSMutableArray)subscriptionServiceConnectedClients
{
  return self->_subscriptionServiceConnectedClients;
}

- (void)setSubscriptionServiceConnectedClients:(id)a3
{
}

- (NSXPCListener)presenceListener
{
  return self->_presenceListener;
}

- (void)setPresenceListener:(id)a3
{
}

- (OS_dispatch_queue)presenceConnectionQueue
{
  return self->_presenceConnectionQueue;
}

- (void)setPresenceConnectionQueue:(id)a3
{
}

- (NSMutableArray)presenceConnectedClients
{
  return self->_presenceConnectedClients;
}

- (void)setPresenceConnectedClients:(id)a3
{
}

- (SKADatabaseManaging)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (OS_dispatch_queue)invitationManagerMessagingQueue
{
  return self->_invitationManagerMessagingQueue;
}

- (void)setInvitationManagerMessagingQueue:(id)a3
{
}

- (SKAMessagingProviding)invitationMessagingProvider
{
  return self->_invitationMessagingProvider;
}

- (void)setInvitationMessagingProvider:(id)a3
{
}

- (SKAInvitationManaging)invitationManager
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

- (SKAStatusSubscriptionManaging)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
}

- (SKAPresenceManaging)presenceManager
{
  return self->_presenceManager;
}

- (void)setPresenceManager:(id)a3
{
}

- (SKAStatusEncryptionManaging)encryptionManager
{
  return self->_encryptionManager;
}

- (void)setEncryptionManager:(id)a3
{
}

- (SKAStatusReceivingManaging)statusReceivingManager
{
  return self->_statusReceivingManager;
}

- (void)setStatusReceivingManager:(id)a3
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
  objc_storeStrong((id *)&self->_statusReceivingManager, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_presenceManager, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_publishingManager, 0);
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_invitationMessagingProvider, 0);
  objc_storeStrong((id *)&self->_invitationManagerMessagingQueue, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_presenceConnectedClients, 0);
  objc_storeStrong((id *)&self->_presenceConnectionQueue, 0);
  objc_storeStrong((id *)&self->_presenceListener, 0);
  objc_storeStrong((id *)&self->_subscriptionServiceConnectedClients, 0);
  objc_storeStrong((id *)&self->_subscriptionServiceConnectionQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionServiceListener, 0);
  objc_storeStrong((id *)&self->_publishingServiceConnectedClients, 0);
  objc_storeStrong((id *)&self->_publishingServiceConnectionQueue, 0);
  objc_storeStrong((id *)&self->_publishingServiceListener, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

- (void)listener:(NSObject *)a3 shouldAcceptNewConnection:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 processIdentifier];
  OUTLINED_FUNCTION_1_1();
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_22480C000, a3, OS_LOG_TYPE_FAULT, "Receiving XPC connection from PID %ld for unknown service name: %{public}@", v5, 0x16u);
}

- (void)_publishingServiceListener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  [a1 processIdentifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_22480C000, v1, v2, "Rejected XPC connection from PID %ld for publishing service. Client is not entitled for any publishing service.", v3, v4, v5, v6, v7);
}

- (void)_presenceServiceListener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = (int)[a1 processIdentifier];
  __int16 v5 = 2112;
  uint64_t v6 = @"com.apple.StatusKit.presence.clientID";
  _os_log_error_impl(&dword_22480C000, a2, OS_LOG_TYPE_ERROR, "Rejecting incoming XPC connection from PID %ld because of missing or blank entitlement: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_subscriptionServiceListener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  [a1 processIdentifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_22480C000, v1, v2, "Rejected XPC connection from PID %ld for subscription service. Client is not entitled for any subscription service.", v3, v4, v5, v6, v7);
}

void __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22480C000, a2, OS_LOG_TYPE_ERROR, "Error updating subscriptions following remote database changes: %@", (uint8_t *)&v2, 0xCu);
}

void __62__SKAStatusServer_databaseDidReceiveRemoteChangesForChannels___block_invoke_44_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Could not find any database channel matching changed channelIdentifiers", v2, v3, v4, v5, v6);
}

- (void)channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Unable to find database channel for channel id for incoming message", v2, v3, v4, v5, v6);
}

- (void)channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "We're in traffic mode--dropping incoming status", v2, v3, v4, v5, v6);
}

- (void)channelManager:didReceiveData:onChannel:identifier:dateReceived:dateExpired:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Unrecognized channel type for incoming message", v2, v3, v4, v5, v6);
}

- (void)channelManager:(uint64_t)a1 failedToSubscribeToChannel:(uint64_t)a2 withError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22480C000, log, OS_LOG_TYPE_ERROR, "Failed to subscribe to channel %@ with error: %@", (uint8_t *)&v3, 0x16u);
}

void __52__SKAStatusServer_databaseManager_didCreateChannel___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22480C000, a2, OS_LOG_TYPE_ERROR, "Updating registered subscription failed with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)invitationManager:didRevokeInvitationOnChannel:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Couldn't decrypt current status on channel", v2, v3, v4, v5, v6);
}

@end