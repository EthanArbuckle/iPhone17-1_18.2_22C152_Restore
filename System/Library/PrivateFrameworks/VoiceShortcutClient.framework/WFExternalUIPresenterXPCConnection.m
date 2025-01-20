@interface WFExternalUIPresenterXPCConnection
- (BOOL)connected;
- (NSXPCConnection)xpcConnection;
- (NSXPCListenerEndpoint)endpoint;
- (WFExternalUIPresenterXPCConnection)initWithEndpoint:(id)a3;
- (id)presenterWithErrorHandler:(id)a3;
- (void)resumeConnectionIfNecessary;
- (void)setConnected:(BOOL)a3;
@end

@implementation WFExternalUIPresenterXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (id)presenterWithErrorHandler:(id)a3
{
  id v4 = a3;
  [(WFExternalUIPresenterXPCConnection *)self resumeConnectionIfNecessary];
  v5 = [(WFExternalUIPresenterXPCConnection *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__WFExternalUIPresenterXPCConnection_presenterWithErrorHandler___block_invoke;
  v9[3] = &unk_1E6079C90;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __64__WFExternalUIPresenterXPCConnection_presenterWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [v3 localizedDescription];
      int v7 = 136315394;
      v8 = "-[WFExternalUIPresenterXPCConnection presenterWithErrorHandler:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_ERROR, "%s Siri XPC connection error: %@", (uint8_t *)&v7, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    }
  }
}

- (void)resumeConnectionIfNecessary
{
  if (![(WFExternalUIPresenterXPCConnection *)self connected])
  {
    id v3 = [(WFExternalUIPresenterXPCConnection *)self xpcConnection];
    [v3 resume];

    [(WFExternalUIPresenterXPCConnection *)self setConnected:1];
  }
}

- (WFExternalUIPresenterXPCConnection)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFExternalUIPresenterXPCConnection;
  uint64_t v6 = [(WFExternalUIPresenterXPCConnection *)&v13 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v5];
    xpcConnection = v7->_xpcConnection;
    v7->_xpcConnection = (NSXPCConnection *)v8;

    id v10 = WFExternalUIPresenterXPCInterface();
    [(NSXPCConnection *)v7->_xpcConnection setRemoteObjectInterface:v10];

    [(NSXPCConnection *)v7->_xpcConnection setInterruptionHandler:&__block_literal_global_99];
    [(NSXPCConnection *)v7->_xpcConnection setInvalidationHandler:&__block_literal_global_101_9850];
    uint64_t v11 = v7;
  }

  return v7;
}

@end