@interface SVXClientServiceServer
- (SVXClientServiceServer)initWithModule:(id)a3;
- (void)_addConnection:(id)a3;
- (void)_removeAllConnections;
- (void)_removeConnection:(id)a3;
- (void)addConnection:(id)a3;
- (void)dealloc;
- (void)removeConnection:(id)a3;
- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4;
- (void)stopWithModuleInstanceProvider:(id)a3;
@end

@implementation SVXClientServiceServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesisManager, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_deviceSetupManager, 0);
  objc_storeStrong((id *)&self->_connectionsByUUID, 0);

  objc_storeStrong((id *)&self->_module, 0);
}

- (void)_removeAllConnections
{
  connectionsByUUID = self->_connectionsByUUID;
  self->_connectionsByUUID = 0;
  v3 = connectionsByUUID;

  [(NSMutableDictionary *)v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_5510];
}

void __47__SVXClientServiceServer__removeAllConnections__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    v6 = "-[SVXClientServiceServer _removeAllConnections]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s connection = %@", (uint8_t *)&v5, 0x16u);
  }
  [v3 invalidate];
}

- (void)_removeConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 uuid];
  v6 = [(NSMutableDictionary *)self->_connectionsByUUID objectForKey:v5];

  if (v6)
  {
    __int16 v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[SVXClientServiceServer _removeConnection:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@", (uint8_t *)&v8, 0x16u);
    }
    [(NSMutableDictionary *)self->_connectionsByUUID removeObjectForKey:v5];
    [v4 invalidate];
  }
}

- (void)_addConnection:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 uuid];
  v6 = [(NSMutableDictionary *)self->_connectionsByUUID objectForKey:v5];

  if (!v6)
  {
    __int16 v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[SVXClientServiceServer _addConnection:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@", (uint8_t *)&v11, 0x16u);
    }
    connectionsByUUID = self->_connectionsByUUID;
    if (!connectionsByUUID)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      __int16 v10 = self->_connectionsByUUID;
      self->_connectionsByUUID = v9;

      connectionsByUUID = self->_connectionsByUUID;
    }
    [(NSMutableDictionary *)connectionsByUUID setObject:v4 forKey:v5];
    [v4 configureWithDeviceSetupManager:self->_deviceSetupManager sessionManager:self->_sessionManager speechSynthesizer:self->_speechSynthesizer synthesisManager:self->_synthesisManager];
  }
}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    __int16 v10 = "-[SVXClientServiceServer stopWithModuleInstanceProvider:]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  [(SVXClientServiceServer *)self _removeAllConnections];
  speechSynthesizer = self->_speechSynthesizer;
  self->_speechSynthesizer = 0;

  sessionManager = self->_sessionManager;
  self->_sessionManager = 0;

  deviceSetupManager = self->_deviceSetupManager;
  self->_deviceSetupManager = 0;

  synthesisManager = self->_synthesisManager;
  self->_synthesisManager = 0;
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v15 = 136315138;
    v16 = "-[SVXClientServiceServer startWithModuleInstanceProvider:platformDependencies:]";
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v15, 0xCu);
  }
  [(SVXClientServiceServer *)self _removeAllConnections];
  __int16 v7 = [v5 sessionManager];
  sessionManager = self->_sessionManager;
  self->_sessionManager = v7;

  int v9 = [v5 speechSynthesizer];
  speechSynthesizer = self->_speechSynthesizer;
  self->_speechSynthesizer = v9;

  uint64_t v11 = [v5 deviceSetupManager];
  deviceSetupManager = self->_deviceSetupManager;
  self->_deviceSetupManager = v11;

  __int16 v13 = [v5 synthesisManager];
  synthesisManager = self->_synthesisManager;
  self->_synthesisManager = v13;
}

- (SVXClientServiceServer)initWithModule:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXClientServiceServer;
  v6 = [(SVXClientServiceServer *)&v9 init];
  __int16 v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_module, a3);
  }

  return v7;
}

- (void)removeConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[SVXClientServiceServer removeConnection:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s connection = %@", buf, 0x16u);
  }
  v6 = [(SVXModule *)self->_module performer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__SVXClientServiceServer_removeConnection___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

uint64_t __43__SVXClientServiceServer_removeConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeConnection:*(void *)(a1 + 40)];
}

- (void)addConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[SVXClientServiceServer addConnection:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s connection = %@", buf, 0x16u);
  }
  v6 = [(SVXModule *)self->_module performer];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__SVXClientServiceServer_addConnection___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlock:v8];
}

uint64_t __40__SVXClientServiceServer_addConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addConnection:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(SVXClientServiceServer *)self _removeAllConnections];
  v3.receiver = self;
  v3.super_class = (Class)SVXClientServiceServer;
  [(SVXClientServiceServer *)&v3 dealloc];
}

@end