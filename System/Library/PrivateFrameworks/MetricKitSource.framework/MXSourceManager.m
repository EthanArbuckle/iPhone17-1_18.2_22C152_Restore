@interface MXSourceManager
+ (id)sharedManager;
- (MXSourceManager)init;
- (NSXPCConnection)connection;
- (OS_os_log)sourceManagerLogHandle;
- (id)_createXPCConnection;
- (void)sendDiagnostic:(id)a3 forDate:(id)a4 andSourceID:(int64_t)a5;
- (void)sendMetrics:(id)a3 forDate:(id)a4 andSourceID:(int64_t)a5;
- (void)setConnection:(id)a3;
- (void)setSourceManagerLogHandle:(id)a3;
- (void)simulatePayloadDeliveryForClient:(id)a3;
@end

@implementation MXSourceManager

- (MXSourceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MXSourceManager;
  v2 = [(MXSourceManager *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.metrickit.sourcemanager", "");
    sourceManagerLogHandle = v2->_sourceManagerLogHandle;
    v2->_sourceManagerLogHandle = (OS_os_log *)v3;
  }
  return v2;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__MXSourceManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;

  return v2;
}

uint64_t __32__MXSourceManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (id)_createXPCConnection
{
  connection = self->_connection;
  if (connection)
  {
    os_log_t v3 = connection;
  }
  else
  {
    os_log_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.metrickitsource.xpc" options:4096];
    if (v3)
    {
      v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D461EE8];
      [(NSXPCConnection *)v3 setRemoteObjectInterface:v5];

      objc_super v6 = (void *)MEMORY[0x263EFFA08];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
      v12 = (void *)MEMORY[0x263EFFA08];
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      v19 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
      v20 = [(NSXPCConnection *)v3 remoteObjectInterface];
      [v20 setClasses:v11 forSelector:sel_writeMetricDataWithPayload_ argumentIndex:0 ofReply:0];

      v21 = [(NSXPCConnection *)v3 remoteObjectInterface];
      [v21 setClasses:v19 forSelector:sel_writeDiagnosticDataWithPayload_ argumentIndex:0 ofReply:0];

      v22 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D460930];
      [(NSXPCConnection *)v3 setExportedInterface:v22];

      [(NSXPCConnection *)v3 setExportedObject:self];
      [(NSXPCConnection *)v3 resume];
    }
  }

  return v3;
}

- (void)sendMetrics:(id)a3 forDate:(id)a4 andSourceID:(int64_t)a5
{
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = [(MXSourceManager *)self _createXPCConnection];
  connection = self->_connection;
  self->_connection = v9;

  if (self->_connection)
  {
    v11 = [[MXSourceXPCPayload alloc] initWithSourceID:a5 withDateStamp:v8 andMetrics:v13];
    v12 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v12 writeMetricDataWithPayload:v11];
  }
}

- (void)sendDiagnostic:(id)a3 forDate:(id)a4 andSourceID:(int64_t)a5
{
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = [(MXSourceManager *)self _createXPCConnection];
  connection = self->_connection;
  self->_connection = v9;

  if (self->_connection)
  {
    v11 = [[MXSourceXPCPayload alloc] initWithSourceID:a5 withDateStamp:v8 andMetrics:v13];
    v12 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v12 writeDiagnosticDataWithPayload:v11];
  }
}

- (void)simulatePayloadDeliveryForClient:(id)a3
{
  id v8 = a3;
  v4 = [(MXSourceManager *)self _createXPCConnection];
  connection = self->_connection;
  self->_connection = v4;

  objc_super v6 = self->_connection;
  if (v6)
  {
    uint64_t v7 = [(NSXPCConnection *)v6 remoteObjectProxy];
    [v7 deliverDummyPayloadForClient:v8];
  }
}

- (OS_os_log)sourceManagerLogHandle
{
  return self->_sourceManagerLogHandle;
}

- (void)setSourceManagerLogHandle:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_sourceManagerLogHandle, 0);
}

@end