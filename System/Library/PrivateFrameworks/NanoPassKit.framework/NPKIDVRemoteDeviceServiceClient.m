@interface NPKIDVRemoteDeviceServiceClient
- (NPKIDVRemoteDeviceServiceClient)initWithRemoteServiceName:(id)a3;
- (NSString)serviceName;
- (id)_errorHandlerWithCompletion:(id)a3;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (void)didReceiveEvent:(unint64_t)a3 fromRemoteDeviceWithID:(id)a4;
- (void)remoteService:(id)a3 didEstablishConnection:(id)a4;
- (void)remoteService:(id)a3 didInterruptConnection:(id)a4;
@end

@implementation NPKIDVRemoteDeviceServiceClient

- (NPKIDVRemoteDeviceServiceClient)initWithRemoteServiceName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKIDVRemoteDeviceServiceClient;
  v5 = [(NPKIDVRemoteDeviceServiceClient *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    id v8 = objc_alloc(MEMORY[0x263F5C2F0]);
    v9 = NPKIDVRemoteDeviceServiceServerProtocolInterface();
    uint64_t v10 = [v8 initWithMachServiceName:v4 remoteObjectInterface:v9 exportedObjectInterface:0 exportedObject:v5];
    remoteService = v5->_remoteService;
    v5->_remoteService = (PKXPCService *)v10;

    [(PKXPCService *)v5->_remoteService setDelegate:v5];
  }

  return v5;
}

- (void)didReceiveEvent:(unint64_t)a3 fromRemoteDeviceWithID:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v7 = self->_serviceName;
  id v8 = a4;
  v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      *(_DWORD *)buf = 138412546;
      v24 = v7;
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Will Notify notify remote process with service Names:%@ event:%@", buf, 0x16u);
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __74__NPKIDVRemoteDeviceServiceClient_didReceiveEvent_fromRemoteDeviceWithID___block_invoke;
  v20[3] = &unk_2644D7028;
  objc_super v13 = v7;
  v21 = v13;
  unint64_t v22 = a3;
  v14 = [(NPKIDVRemoteDeviceServiceClient *)self _remoteObjectProxyWithFailureHandler:v20];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__NPKIDVRemoteDeviceServiceClient_didReceiveEvent_fromRemoteDeviceWithID___block_invoke_47;
  v16[3] = &unk_2644D3288;
  v18 = self;
  unint64_t v19 = a3;
  v17 = v13;
  v15 = v13;
  [v14 didReceiveEvent:a3 fromRemoteDeviceWithID:v8 ackHandler:v16];
}

void __74__NPKIDVRemoteDeviceServiceClient_didReceiveEvent_fromRemoteDeviceWithID___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(*(void *)(a1 + 40));
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      BOOL v10 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Fail to notify remote process with service Names:%@ event:%@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void __74__NPKIDVRemoteDeviceServiceClient_didReceiveEvent_fromRemoteDeviceWithID___block_invoke_47(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(*(void *)(a1 + 48));
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      BOOL v10 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did Notify notify remote process with service Names:%@ event:%@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  remoteService = self->_remoteService;
  id v4 = [(NPKIDVRemoteDeviceServiceClient *)self _errorHandlerWithCompletion:a3];
  uint64_t v5 = [(PKXPCService *)remoteService remoteObjectProxyWithErrorHandler:v4];

  return v5;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__NPKIDVRemoteDeviceServiceClient__errorHandlerWithCompletion___block_invoke;
  v8[3] = &unk_2644D2B90;
  id v9 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x223C37380](v8);
  uint64_t v6 = (void *)MEMORY[0x223C37380]();

  return v6;
}

void __63__NPKIDVRemoteDeviceServiceClient__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    uint64_t v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error on connection: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)remoteService:(id)a3 didEstablishConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412802;
      v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@, remote service:%@ did establish connection:%@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412802;
      v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@, remote service:%@ did interrupt connection:%@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end