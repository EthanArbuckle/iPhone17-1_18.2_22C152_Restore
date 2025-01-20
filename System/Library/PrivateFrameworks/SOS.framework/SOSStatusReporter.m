@interface SOSStatusReporter
+ (id)sharedInstance;
- (NSXPCConnection)connection;
- (SOSStatusReporter)init;
- (int)connectionRequestNotificationToken;
- (int64_t)flowState;
- (void)_updateSOSFlowState;
- (void)handleSosdLaunch;
- (void)setConnection:(id)a3;
- (void)setConnectionRequestNotificationToken:(int)a3;
- (void)setFlowState:(int64_t)a3;
- (void)updateSOSFlowState:(int64_t)a3;
@end

@implementation SOSStatusReporter

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SOSStatusReporter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, block);
  }
  v2 = (void *)sharedInstance_sosStatusReporter;

  return v2;
}

uint64_t __35__SOSStatusReporter_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sosStatusReporter = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (SOSStatusReporter)init
{
  if (+[SOSEntitlement currentProcessHasEntitlement:@"com.apple.sos.trigger"])
  {
    v13.receiver = self;
    v13.super_class = (Class)SOSStatusReporter;
    v3 = [(SOSStatusReporter *)&v13 init];
    if (v3)
    {
      v4 = sos_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "initializing SOSStatusReporter", (uint8_t *)buf, 2u);
      }

      v3->_flowState = 0;
      objc_initWeak(buf, v3);
      v5 = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
      v6 = MEMORY[0x1E4F14428];
      id v7 = MEMORY[0x1E4F14428];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __25__SOSStatusReporter_init__block_invoke;
      handler[3] = &unk_1E6064D40;
      objc_copyWeak(&v11, buf);
      notify_register_dispatch(v5, &v3->_connectionRequestNotificationToken, v6, handler);

      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
    self = v3;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __25__SOSStatusReporter_init__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v4 = 136315138;
    *(void *)&v4[4] = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by requesting current state", v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(void *)v4 = 0;
  notify_get_state([WeakRetained connectionRequestNotificationToken], (uint64_t *)v4);
  if (*(void *)v4) {
    [WeakRetained handleSosdLaunch];
  }
}

- (void)handleSosdLaunch
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(SOSStatusReporter *)self flowState])
  {
    v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = SOSStringForSOSFlowState([(SOSStatusReporter *)self flowState]);
      int v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusReporter, sosd launched, updating state %@", (uint8_t *)&v5, 0xCu);
    }
    [(SOSStatusReporter *)self _updateSOSFlowState];
  }
}

- (void)updateSOSFlowState:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__SOSStatusReporter_updateSOSFlowState___block_invoke;
  v3[3] = &unk_1E6064D18;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __40__SOSStatusReporter_updateSOSFlowState___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = SOSStringForSOSFlowState(*(void *)(a1 + 40));
    int v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "SOSStatusReporter, updateSOSFlowState with state %@", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) setFlowState:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _updateSOSFlowState];
}

- (void)_updateSOSFlowState
{
  id v4 = [(SOSStatusReporter *)self connection];
  v3 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_10];
  objc_msgSend(v3, "updateSOSFlowState:", -[SOSStatusReporter flowState](self, "flowState"));
}

void __40__SOSStatusReporter__updateSOSFlowState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = sos_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__SOSStatusReporter__updateSOSFlowState__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)setConnection:(id)a3
{
  int v5 = (NSXPCConnection *)a3;
  v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusReporter, setting connection", v10, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  connection = self->_connection;
  p_connection = &self->_connection;
  uint64_t v7 = connection;
  if (connection != v5)
  {
    if (v7)
    {
      [(NSXPCConnection *)v7 invalidate];
      [(NSXPCConnection *)*p_connection setInvalidationHandler:0];
      [(NSXPCConnection *)*p_connection setInterruptionHandler:0];
    }
    objc_storeStrong((id *)p_connection, a3);
  }
}

- (NSXPCConnection)connection
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.sos.status" options:4096];
    int v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    uint64_t v7 = SOSStatusManagerServerInterface();
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    v8 = self->_connection;
    v9 = SOSStatusManagerClientInterface();
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_initWeak(&location, self);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_5];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    objc_super v13 = __31__SOSStatusReporter_connection__block_invoke_6;
    v14 = &unk_1E6064830;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:&v11];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __31__SOSStatusReporter_connection__block_invoke()
{
  v0 = sos_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B3A94000, v0, OS_LOG_TYPE_DEFAULT, "SOSStatusReporter, connection interrupted", v1, 2u);
  }
}

void __31__SOSStatusReporter_connection__block_invoke_6(uint64_t a1)
{
  id v2 = sos_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v2, OS_LOG_TYPE_DEFAULT, "SOSStatusReporter, connection invalidated", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SOSStatusReporter_connection__block_invoke_7;
  block[3] = &unk_1E6064830;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __31__SOSStatusReporter_connection__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnection:0];
}

- (int)connectionRequestNotificationToken
{
  return self->_connectionRequestNotificationToken;
}

- (void)setConnectionRequestNotificationToken:(int)a3
{
  self->_connectionRequestNotificationToken = a3;
}

- (int64_t)flowState
{
  return self->_flowState;
}

- (void)setFlowState:(int64_t)a3
{
  self->_flowState = a3;
}

- (void).cxx_destruct
{
}

void __40__SOSStatusReporter__updateSOSFlowState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "Could not send a flow state update due to connection error %@", (uint8_t *)&v2, 0xCu);
}

@end