@interface SymptomLinkAdvisoryConnectionManager
+ (id)sharedInstance;
- (ALUManager)aluManager;
- (SymptomLinkAdvisoryConnectionManager)init;
- (SymptomLinkAdvisoryNWActivityReporter)nwActivityReporter;
- (void)_handleALUMessageFromSymptomsd:(id)a3;
- (void)_handleNWActivityFragmentMessageFromSymptomsd;
- (void)_setupXPCConnection;
- (void)dealloc;
- (void)setAluManager:(id)a3;
- (void)setNwActivityReporter:(id)a3;
@end

@implementation SymptomLinkAdvisoryConnectionManager

- (SymptomLinkAdvisoryConnectionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SymptomLinkAdvisoryConnectionManager;
  v2 = [(SymptomLinkAdvisoryConnectionManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SymptomLinkAdvisoryConnectionManager *)v2 _setupXPCConnection];
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __54__SymptomLinkAdvisoryConnectionManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(SymptomLinkAdvisoryConnectionManager);
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
    [(NSXPCConnection *)self->_connection invalidate];
    v4 = self->_connection;
    self->_connection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SymptomLinkAdvisoryConnectionManager;
  [(SymptomLinkAdvisoryConnectionManager *)&v5 dealloc];
}

- (void)_setupXPCConnection
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!self->_connection)
  {
    v3 = connManagerLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25E6CC000, v3, OS_LOG_TYPE_DEFAULT, "ConnManager: Creating XPC connection for symptomsd<->terminusd communication", buf, 2u);
    }

    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.symptom_analytics" options:4096];
    connection = self->_connection;
    self->_connection = v4;

    if (self->_connection)
    {
      if (_setupXPCConnection_onceToken != -1) {
        dispatch_once(&_setupXPCConnection_onceToken, &__block_literal_global_9);
      }
      [(NSXPCConnection *)self->_connection setRemoteObjectInterface:_setupXPCConnection_remoteObjectInterface];
      [(NSXPCConnection *)self->_connection setExportedInterface:_setupXPCConnection_exportedInterface];
      [(NSXPCConnection *)self->_connection setExportedObject:self];
      objc_initWeak(&location, self);
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      v11 = __59__SymptomLinkAdvisoryConnectionManager__setupXPCConnection__block_invoke_2;
      v12 = &unk_26552AA70;
      objc_copyWeak(&v13, &location);
      [(NSXPCConnection *)self->_connection setInvalidationHandler:&v9];
      -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_114, v9, v10, v11, v12);
      [(NSXPCConnection *)self->_connection resume];
      v6 = connManagerLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = self->_connection;
        *(_DWORD *)buf = 138477827;
        v16 = v7;
        _os_log_impl(&dword_25E6CC000, v6, OS_LOG_TYPE_DEFAULT, "ConnManager: started %{private}@", buf, 0xCu);
      }

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      v8 = connManagerLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25E6CC000, v8, OS_LOG_TYPE_ERROR, "ConnManager: Error creating XPC connection, returning", buf, 2u);
      }
    }
  }
}

void __59__SymptomLinkAdvisoryConnectionManager__setupXPCConnection__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270B446C8];
  v1 = (void *)_setupXPCConnection_exportedInterface;
  _setupXPCConnection_exportedInterface = v0;

  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270B45350];
  v3 = (void *)_setupXPCConnection_remoteObjectInterface;
  _setupXPCConnection_remoteObjectInterface = v2;

  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_setupXPCConnection_exportedInterface setClasses:v8 forSelector:sel__handleALUMessageFromSymptomsd_ argumentIndex:0 ofReply:0];
}

void __59__SymptomLinkAdvisoryConnectionManager__setupXPCConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = connManagerLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25E6CC000, v2, OS_LOG_TYPE_DEFAULT, "ConnManager: symptomsd<->terminusd XPC connection invalidated", buf, 2u);
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v5 = connManagerLogHandle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    __int16 v10 = 0;
    uint64_t v6 = "ConnManager: instance has gone away, returning";
    uint64_t v7 = (uint8_t *)&v10;
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_10:
    _os_log_impl(&dword_25E6CC000, v8, v9, v6, v7, 2u);
    goto LABEL_11;
  }
  uint64_t v5 = WeakRetained[1];
  if (!v5)
  {
    uint64_t v5 = connManagerLogHandle();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)v11 = 0;
    uint64_t v6 = "ConnManager: connection is already nil";
    uint64_t v7 = v11;
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_10;
  }
  WeakRetained[1] = 0;
LABEL_11:
}

void __59__SymptomLinkAdvisoryConnectionManager__setupXPCConnection__block_invoke_112()
{
  uint64_t v0 = connManagerLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_25E6CC000, v0, OS_LOG_TYPE_DEFAULT, "ConnManager: symptomsd<->terminusd XPC connection interrupted", v1, 2u);
  }
}

- (void)_handleALUMessageFromSymptomsd:(id)a3
{
  aluManager = self->_aluManager;
  if (aluManager) {
    [(ALUManager *)aluManager _handleALUMessageFromSymptomsd:a3];
  }
}

- (void)_handleNWActivityFragmentMessageFromSymptomsd
{
  nwActivityReporter = self->_nwActivityReporter;
  if (nwActivityReporter) {
    [(SymptomLinkAdvisoryNWActivityReporter *)nwActivityReporter _handleNWActivityFragmentMessageFromSymptomsd];
  }
}

- (ALUManager)aluManager
{
  return (ALUManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAluManager:(id)a3
{
}

- (SymptomLinkAdvisoryNWActivityReporter)nwActivityReporter
{
  return (SymptomLinkAdvisoryNWActivityReporter *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNwActivityReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwActivityReporter, 0);
  objc_storeStrong((id *)&self->_aluManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end