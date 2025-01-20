@interface TUUserNotificationProviderXPCClient
+ (NSXPCInterface)userNotificationProviderServerXPCInterface;
+ (TUUserNotificationsProviderXPCServer)asynchronousServer;
+ (TUUserNotificationsProviderXPCServer)synchronousServer;
+ (void)setAsynchronousServer:(id)a3;
+ (void)setSynchronousServer:(id)a3;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (TUUserNotificationProviderXPCClient)init;
- (id)serverWithErrorHandler:(id)a3;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)momentCapturedForStreamToken:(int64_t)a3 requesterID:(id)a4 reply:(id)a5;
- (void)setXpcConnection:(id)a3;
@end

@implementation TUUserNotificationProviderXPCClient

+ (TUUserNotificationsProviderXPCServer)asynchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_0);

  return (TUUserNotificationsProviderXPCServer *)WeakRetained;
}

+ (void)setAsynchronousServer:(id)a3
{
}

+ (TUUserNotificationsProviderXPCServer)synchronousServer
{
  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_0);

  return (TUUserNotificationsProviderXPCServer *)WeakRetained;
}

+ (void)setSynchronousServer:(id)a3
{
}

- (TUUserNotificationProviderXPCClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUUserNotificationProviderXPCClient;
  v2 = [(TUUserNotificationProviderXPCClient *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.usernotificationproviderxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUUserNotificationProviderXPCClient;
  [(TUUserNotificationProviderXPCClient *)&v3 dealloc];
}

- (void)momentCapturedForStreamToken:(int64_t)a3 requesterID:(id)a4 reply:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v19 = a3;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "momentCapturedForStreamToken: %ld requesterID: %@", buf, 0x16u);
  }

  v11 = [(TUUserNotificationProviderXPCClient *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__TUUserNotificationProviderXPCClient_momentCapturedForStreamToken_requesterID_reply___block_invoke;
  v14[3] = &unk_1E58E62E8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

void __86__TUUserNotificationProviderXPCClient_momentCapturedForStreamToken_requesterID_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverWithErrorHandler:&__block_literal_global_4];
  [v2 momentCapturedForStreamToken:*(void *)(a1 + 56) requesterID:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __86__TUUserNotificationProviderXPCClient_momentCapturedForStreamToken_requesterID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __86__TUUserNotificationProviderXPCClient_momentCapturedForStreamToken_requesterID_reply___block_invoke_2_cold_1((uint64_t)v2, v3);
  }
}

- (NSXPCConnection)xpcConnection
{
  objc_super v3 = [(TUUserNotificationProviderXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.telephonyutilities.callservicesdaemon.usernotificationprovider" options:0];
    objc_super v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    v7 = +[TUUserNotificationProviderXPCClient userNotificationProviderServerXPCInterface];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke;
    v11[3] = &unk_1E58E5C50;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke_7;
    v9[3] = &unk_1E58E5C50;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v9];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

void __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "user notification provider xpc connection invalidated (client side)", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;
}

void __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained queue];
    dispatch_async(v2, &__block_literal_global_10);

    id WeakRetained = v3;
  }
}

void __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke_2_8()
{
  v0 = TUDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19C496000, v0, OS_LOG_TYPE_DEFAULT, "user notification provider XPC connection interrupted (client side)", v1, 2u);
  }
}

- (id)serverWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(TUUserNotificationProviderXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_0);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
  }
  else
  {
    id v9 = [(TUUserNotificationProviderXPCClient *)self xpcConnection];
    id v8 = [v9 remoteObjectProxyWithErrorHandler:v4];
  }

  return v8;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(TUUserNotificationProviderXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id WeakRetained = objc_loadWeakRetained(&sSynchronousServer_0);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
  }
  else
  {
    id v9 = [(TUUserNotificationProviderXPCClient *)self xpcConnection];
    id v8 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v8;
}

+ (NSXPCInterface)userNotificationProviderServerXPCInterface
{
  if (userNotificationProviderServerXPCInterface_onceToken != -1) {
    dispatch_once(&userNotificationProviderServerXPCInterface_onceToken, &__block_literal_global_12);
  }
  id v2 = (void *)userNotificationProviderServerXPCInterface_userNotificationProviderServerXPCInterface;

  return (NSXPCInterface *)v2;
}

uint64_t __81__TUUserNotificationProviderXPCClient_userNotificationProviderServerXPCInterface__block_invoke()
{
  userNotificationProviderServerXPCInterface_userNotificationProviderServerXPCInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED2ACF8];

  return MEMORY[0x1F41817F8]();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __86__TUUserNotificationProviderXPCClient_momentCapturedForStreamToken_requesterID_reply___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Error registering moments captured stream token: %@", (uint8_t *)&v2, 0xCu);
}

@end