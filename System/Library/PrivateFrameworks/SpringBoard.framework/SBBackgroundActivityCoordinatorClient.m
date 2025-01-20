@interface SBBackgroundActivityCoordinatorClient
- (NSSet)registeredBackgroundActivityIdentifiers;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)registeredOverridesQueue;
- (SBBackgroundActivityCoordinatorClient)initWithConnection:(id)a3 andBackgroundActivityIdentifiers:(id)a4;
- (void)acquireAssertionAndDeliverTapContextToClient:(id)a3;
- (void)setConnection:(id)a3;
- (void)setRegisteredBackgroundActivityIdentifiers:(id)a3;
- (void)setRegisteredOverridesQueue:(id)a3;
@end

@implementation SBBackgroundActivityCoordinatorClient

- (SBBackgroundActivityCoordinatorClient)initWithConnection:(id)a3 andBackgroundActivityIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBBackgroundActivityCoordinatorClient;
  v8 = [(SBBackgroundActivityCoordinatorClient *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(SBBackgroundActivityCoordinatorClient *)v8 setConnection:v6];
    [(SBBackgroundActivityCoordinatorClient *)v9 setRegisteredBackgroundActivityIdentifiers:v7];
  }

  return v9;
}

- (void)acquireAssertionAndDeliverTapContextToClient:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4F390];
  id v5 = a3;
  id v6 = objc_msgSend([v4 alloc], "initWithPID:flags:reason:name:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), 3, 10002, @"SBSStatusBarStyleOverridesCoordinatorTapEventDeliveryAssertion");
  if (([v6 acquire] & 1) == 0)
  {
    id v7 = SBLogStatusBarish();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Could not acquire assertion to deliver tap event to process.", buf, 2u);
    }
  }
  connection = self->_connection;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke;
  v18[3] = &unk_1E6AFC6D0;
  v18[4] = self;
  v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v18];
  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  objc_super v11 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_2;
  block[3] = &unk_1E6AF4AC0;
  id v12 = v6;
  id v17 = v12;
  dispatch_after(v10, v11, block);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_4;
  v14[3] = &unk_1E6AF4AC0;
  id v15 = v12;
  id v13 = v12;
  [v9 statusBarTappedWithContext:v5 reply:v14];
}

void __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = SBLogStatusBarish();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Could not send tap event to coordinator (%@) due to xpc error retrieving remote proxy.", (uint8_t *)&v4, 0xCu);
  }
}

void __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) valid])
  {
    [*(id *)(a1 + 32) invalidate];
    v2 = SBLogStatusBarish();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_2_cold_1(v2);
    }
  }
}

uint64_t __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_4(uint64_t a1)
{
  v2 = SBLogStatusBarish();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "tap event reply block received", v4, 2u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSSet)registeredBackgroundActivityIdentifiers
{
  return self->_registeredBackgroundActivityIdentifiers;
}

- (void)setRegisteredBackgroundActivityIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)registeredOverridesQueue
{
  return self->_registeredOverridesQueue;
}

- (void)setRegisteredOverridesQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredOverridesQueue, 0);
  objc_storeStrong((id *)&self->_registeredBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __86__SBBackgroundActivityCoordinatorClient_acquireAssertionAndDeliverTapContextToClient___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Invalidating process assertion due to timeout of 10 seconds", v1, 2u);
}

@end