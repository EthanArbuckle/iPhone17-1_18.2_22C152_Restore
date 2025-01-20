@interface ContextualPowerModesClient
- (BOOL)connectionInterrupted;
- (ContextualPowerModesClient)init;
- (NSSet)interestedModes;
- (NSString)identifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)callback_queue;
- (id)callback;
- (void)init;
- (void)reRegister;
- (void)registerWithIdentifier:(id)a3 queue:(id)a4 callback:(id)a5;
- (void)registerWithIdentitifer:(id)a3 forModes:(id)a4 queue:(id)a5 callback:(id)a6;
- (void)setCallback:(id)a3;
- (void)setCallback_queue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionInterrupted:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterestedModes:(id)a3;
- (void)updateState:(BOOL)a3 forMode:(id)a4;
@end

@implementation ContextualPowerModesClient

- (void)registerWithIdentifier:(id)a3 queue:(id)a4 callback:(id)a5
{
  v19[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(ContextualPowerModesClient *)self setIdentifier:v8];
  [(ContextualPowerModesClient *)self setCallback:v9];

  [(ContextualPowerModesClient *)self setCallback_queue:v10];
  v11 = (void *)MEMORY[0x263EFFA08];
  v19[0] = @"RestrictedPerfMode";
  v19[1] = @"InUseChargingMode";
  v19[2] = @"AcceleratedChargingMode";
  v19[3] = @"LongChargingMode";
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
  v13 = [v11 setWithArray:v12];

  [(ContextualPowerModesClient *)self setInterestedModes:v13];
  v14 = [(ContextualPowerModesClient *)self connection];
  v15 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_16];
  [v15 registerWithIdentifier:v8 forModes:v13];

  v16 = _log_2;
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_25A13D000, v16, OS_LOG_TYPE_DEFAULT, "Registered %@ for all modes", (uint8_t *)&v17, 0xCu);
  }
}

void __68__ContextualPowerModesClient_registerWithIdentifier_queue_callback___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _log_2;
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR)) {
    __68__ContextualPowerModesClient_registerWithIdentifier_queue_callback___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)registerWithIdentitifer:(id)a3 forModes:(id)a4 queue:(id)a5 callback:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  [(ContextualPowerModesClient *)self setIdentifier:v10];
  [(ContextualPowerModesClient *)self setCallback:v12];

  [(ContextualPowerModesClient *)self setCallback_queue:v13];
  [(ContextualPowerModesClient *)self setInterestedModes:v11];
  v14 = [(ContextualPowerModesClient *)self connection];
  v15 = [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_18];
  [v15 registerWithIdentifier:v10 forModes:v11];

  v16 = _log_2;
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_25A13D000, v16, OS_LOG_TYPE_DEFAULT, "Registered %@ for modes %@", (uint8_t *)&v17, 0x16u);
  }
}

void __78__ContextualPowerModesClient_registerWithIdentitifer_forModes_queue_callback___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _log_2;
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR)) {
    __68__ContextualPowerModesClient_registerWithIdentifier_queue_callback___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)updateState:(BOOL)a3 forMode:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ContextualPowerModesClient *)self callback_queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ContextualPowerModesClient_updateState_forMode___block_invoke;
  block[3] = &unk_265476890;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __50__ContextualPowerModesClient_updateState_forMode___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callback];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)reRegister
{
  id v6 = [(ContextualPowerModesClient *)self connection];
  v3 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_20];
  uint64_t v4 = [(ContextualPowerModesClient *)self identifier];
  uint64_t v5 = [(ContextualPowerModesClient *)self interestedModes];
  [v3 registerWithIdentifier:v4 forModes:v5];
}

void __40__ContextualPowerModesClient_reRegister__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _log_2;
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR)) {
    __68__ContextualPowerModesClient_registerWithIdentifier_queue_callback___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (ContextualPowerModesClient)init
{
  v24.receiver = self;
  v24.super_class = (Class)ContextualPowerModesClient;
  id v2 = [(ContextualPowerModesClient *)&v24 init];
  p_isa = (id *)&v2->super.isa;
  if (initLogging_onceToken == -1)
  {
    if (v2) {
      goto LABEL_3;
    }
LABEL_14:
    if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR)) {
      -[ResourceConnection init]();
    }
    goto LABEL_16;
  }
  dispatch_once(&initLogging_onceToken, &__block_literal_global_2);
  if (!p_isa) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v4 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.powerexperienced.powermodesservice" options:4096];
  id v5 = p_isa[2];
  p_isa[2] = (id)v4;

  uint64_t v6 = _log_2;
  if (p_isa[2])
  {
    if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_25A13D000, v6, OS_LOG_TYPE_INFO, "established connection to powerexperienced", (uint8_t *)buf, 2u);
    }
    uint64_t v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_27081E128];
    [p_isa[2] setRemoteObjectInterface:v7];

    [p_isa[2] setExportedObject:p_isa];
    uint64_t v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_27081DB08];
    [p_isa[2] setExportedInterface:v8];

    objc_initWeak(buf, p_isa);
    id v9 = p_isa[2];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __34__ContextualPowerModesClient_init__block_invoke;
    v21[3] = &unk_2654767A8;
    objc_copyWeak(&v22, buf);
    [v9 setInterruptionHandler:v21];
    id v10 = p_isa[2];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __34__ContextualPowerModesClient_init__block_invoke_32;
    v19[3] = &unk_2654767A8;
    objc_copyWeak(&v20, buf);
    [v10 setInvalidationHandler:v19];
    [p_isa[2] resume];
    BOOL v11 = MEMORY[0x263EF83A0];
    id v12 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __34__ContextualPowerModesClient_init__block_invoke_34;
    handler[3] = &unk_2654768B8;
    objc_copyWeak(&v18, buf);
    uint32_t v13 = notify_register_dispatch("com.apple.powerexperienced.restart", (int *)&init_syncToken, v11, handler);

    if (v13)
    {
      v14 = _log_2;
      if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR)) {
        [(ContextualPowerModesClient *)v13 init];
      }
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(buf);
LABEL_16:
    v15 = p_isa;
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR)) {
    -[ContextualPowerModesClient init]();
  }
  v15 = 0;
LABEL_17:

  return v15;
}

void __34__ContextualPowerModesClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR)) {
      __26__ResourceConnection_init__block_invoke_cold_1();
    }
    [WeakRetained setConnectionInterrupted:1];
  }
}

void __34__ContextualPowerModesClient_init__block_invoke_32(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_ERROR)) {
    __26__ResourceConnection_init__block_invoke_56_cold_1();
  }
}

void __34__ContextualPowerModesClient_init__block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && [WeakRetained connectionInterrupted])
  {
    v3 = _log_2;
    if (os_log_type_enabled((os_log_t)_log_2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_25A13D000, v3, OS_LOG_TYPE_DEFAULT, "powerexperienced has restarted", v4, 2u);
    }
    [v2 reRegister];
    [v2 setConnectionInterrupted:0];
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)callback_queue
{
  return self->_callback_queue;
}

- (void)setCallback_queue:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (NSSet)interestedModes
{
  return self->_interestedModes;
}

- (void)setInterestedModes:(id)a3
{
}

- (BOOL)connectionInterrupted
{
  return self->_connectionInterrupted;
}

- (void)setConnectionInterrupted:(BOOL)a3
{
  self->_connectionInterrupted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestedModes, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_callback_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __68__ContextualPowerModesClient_registerWithIdentifier_queue_callback___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_25A13D000, a2, OS_LOG_TYPE_ERROR, "Failed to register for reconnect with powerd 0x%x", (uint8_t *)v2, 8u);
}

@end