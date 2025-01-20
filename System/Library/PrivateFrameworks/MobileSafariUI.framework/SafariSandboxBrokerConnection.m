@interface SafariSandboxBrokerConnection
- (void)_connectionWithCompletionHandler:(id)a3;
@end

@implementation SafariSandboxBrokerConnection

- (void)_connectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  p_connection = &self->_connection;
  connection = self->_connection;
  if (connection)
  {
    (*((void (**)(id, NSXPCConnection *, void))v4 + 2))(v4, connection, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.Safari.SandboxBroker"];
    v9 = WBSUISafariSandboxBrokerInterface();
    [v8 setRemoteObjectInterface:v9];

    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __66__SafariSandboxBrokerConnection__connectionWithCompletionHandler___block_invoke;
    v13 = &unk_1E6D78630;
    objc_copyWeak(&v14, &location);
    [v8 setInvalidationHandler:&v10];
    objc_msgSend(v8, "resume", v10, v11, v12, v13);
    objc_storeStrong((id *)p_connection, v8);
    ((void (**)(void, void *, void))v5)[2](v5, v8, 0);
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
}

void __66__SafariSandboxBrokerConnection__connectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (void).cxx_destruct
{
}

@end