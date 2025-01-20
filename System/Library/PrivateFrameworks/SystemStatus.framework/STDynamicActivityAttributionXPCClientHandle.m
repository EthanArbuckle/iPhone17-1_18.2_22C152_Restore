@interface STDynamicActivityAttributionXPCClientHandle
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (NSXPCConnection)connection;
- (STDynamicActivityAttributionServerHandle)serverHandle;
- (STDynamicActivityAttributionXPCClientHandle)initWithXPCConnection:(id)a3 serverHandle:(id)a4;
- (void)currentAttributionsDidChange:(id)a3;
- (void)setCurrentAttributionKey:(id)a3 application:(id)a4 reply:(id)a5;
- (void)setCurrentAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 reply:(id)a5;
- (void)setCurrentAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 reply:(id)a5;
- (void)setCurrentAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 reply:(id)a5;
- (void)subscribeToUpdates;
@end

@implementation STDynamicActivityAttributionXPCClientHandle

- (STDynamicActivityAttributionXPCClientHandle)initWithXPCConnection:(id)a3 serverHandle:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 valueForEntitlement:@"com.apple.systemstatus.activityattribution"];
  char v10 = [v9 BOOLValue];

  if (v10)
  {
    v26.receiver = self;
    v26.super_class = (Class)STDynamicActivityAttributionXPCClientHandle;
    v11 = [(STDynamicActivityAttributionXPCClientHandle *)&v26 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_connection, a3);
      objc_storeWeak((id *)&v12->_serverHandle, v8);
      if (v7)
      {
        [v7 auditToken];
      }
      else
      {
        *(_OWORD *)location = 0u;
        long long v28 = 0u;
      }
      long long v15 = v28;
      *(_OWORD *)v12->_auditToken.val = *(_OWORD *)location;
      *(_OWORD *)&v12->_auditToken.val[4] = v15;
      objc_initWeak(location, v12);
      v16 = STDynamicAttributionXPCClientInterface();
      [v7 setRemoteObjectInterface:v16];

      v17 = STDynamicAttributionXPCServerInterface();
      [v7 setExportedInterface:v17];

      [v7 setExportedObject:v12];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __82__STDynamicActivityAttributionXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke;
      v24[3] = &unk_1E6B630F8;
      objc_copyWeak(&v25, location);
      [v7 setInterruptionHandler:v24];
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __82__STDynamicActivityAttributionXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2;
      v22 = &unk_1E6B630F8;
      objc_copyWeak(&v23, location);
      [v7 setInvalidationHandler:&v19];
      objc_msgSend(v7, "resume", v19, v20, v21, v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(location);
    }
    self = v12;
    v14 = self;
  }
  else
  {
    v13 = STSystemStatusLogDynamicAttribution();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v7;
      _os_log_error_impl(&dword_1D9514000, v13, OS_LOG_TYPE_ERROR, "Client (%@) attempting to access dynamic attribution without entitlement", (uint8_t *)location, 0xCu);
    }

    v14 = 0;
  }

  return v14;
}

void __82__STDynamicActivityAttributionXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 5);
    [v2 unsubscribeFromUpdates:v4];

    [v4[6] invalidate];
    id v3 = v4[6];
    v4[6] = 0;

    WeakRetained = v4;
  }
}

void __82__STDynamicActivityAttributionXPCClientHandle_initWithXPCConnection_serverHandle___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 5);
    [v2 unsubscribeFromUpdates:v4];

    [v4[6] invalidate];
    id v3 = v4[6];
    v4[6] = 0;

    WeakRetained = v4;
  }
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)currentAttributionsDidChange:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 currentAttributionsDidChange:v4];
}

- (void)setCurrentAttributionKey:(id)a3 application:(id)a4 reply:(id)a5
{
  p_serverHandle = &self->_serverHandle;
  v12 = (void (**)(id, uint64_t))a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_serverHandle);
  [WeakRetained setLocalizableAttributionKey:v10 andApplication:v9 forClient:self];

  v12[2](v12, 1);
}

- (void)setCurrentAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 reply:(id)a5
{
  p_serverHandle = &self->_serverHandle;
  id v9 = (void (**)(id, uint64_t))a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_serverHandle);
  long long v12 = *(_OWORD *)&a4->var0[4];
  v13[0] = *(_OWORD *)a4->var0;
  v13[1] = v12;
  [WeakRetained setAttributionLocalizableKey:v10 maskingClientAuditToken:v13 forClient:self];

  v9[2](v9, 1);
}

- (void)setCurrentAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 reply:(id)a5
{
  p_serverHandle = &self->_serverHandle;
  id v9 = (void (**)(id, uint64_t))a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_serverHandle);
  long long v12 = *(_OWORD *)&a4->var0[4];
  v13[0] = *(_OWORD *)a4->var0;
  v13[1] = v12;
  [WeakRetained setAttributionStringWithFormat:v10 maskingClientAuditToken:v13 forClient:self];

  v9[2](v9, 1);
}

- (void)setCurrentAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 reply:(id)a5
{
  p_serverHandle = &self->_serverHandle;
  id v9 = (void (**)(id, uint64_t))a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_serverHandle);
  long long v12 = *(_OWORD *)&a4->var0[4];
  v13[0] = *(_OWORD *)a4->var0;
  v13[1] = v12;
  [WeakRetained setAttributionWebsiteString:v10 maskingClientAuditToken:v13 forClient:self];

  v9[2](v9, 1);
}

- (void)subscribeToUpdates
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverHandle);
  [WeakRetained subscribeToUpdates:self];
}

- (STDynamicActivityAttributionServerHandle)serverHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverHandle);

  return (STDynamicActivityAttributionServerHandle *)WeakRetained;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_serverHandle);
}

@end