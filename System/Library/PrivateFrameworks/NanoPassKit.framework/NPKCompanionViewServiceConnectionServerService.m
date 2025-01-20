@interface NPKCompanionViewServiceConnectionServerService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NPKCompanionViewServiceConnectionServerService)init;
- (NPKCompanionViewServiceConnectionServerServiceDelegate)delegate;
- (void)_addConnection:(id)a3;
- (void)_addServer:(id)a3;
- (void)_removeServer:(id)a3;
- (void)dealloc;
- (void)handleCompanionItemSelectionRequestDidCancelForRequestIdentifier:(id)a3;
- (void)handleCompanionItemSelectionRequestFinishedWithRenewalAmount:(id)a3 serviceProviderData:(id)a4 forRequestIdentifier:(id)a5;
- (void)handleCompanionValueEntryRequestDidCancelForRequestIdentifier:(id)a3;
- (void)handleCompanionValueEntryRequestFinishedWithCurrencyAmount:(id)a3 forRequestIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)viewServiceConnectionServer:(id)a3 didRequestPresentRemotePassItemSelectionViewControllerForRequest:(id)a4 contact:(id)a5 completion:(id)a6;
- (void)viewServiceConnectionServer:(id)a3 didRequestPresentRemotePassValueEntryViewControllerForRequest:(id)a4 contact:(id)a5 completion:(id)a6;
@end

@implementation NPKCompanionViewServiceConnectionServerService

- (NPKCompanionViewServiceConnectionServerService)init
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)NPKCompanionViewServiceConnectionServerService;
  v2 = [(NPKCompanionViewServiceConnectionServerService *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    connectionServers = v2->_connectionServers;
    v2->_connectionServers = v3;

    v5 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.NanoPassbook.NPKCompanionViewService.connection.server"];
    [(NSXPCListener *)v5 setDelegate:v2];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v5;
    v7 = v5;

    [(NSXPCListener *)v7 resume];
    v8 = pk_Payment_log();
    LODWORD(xpcListener) = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (xpcListener)
    {
      v9 = pk_Payment_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v2;
        __int16 v14 = 2112;
        v15 = @"com.apple.NanoPassbook.NPKCompanionViewService.connection.server";
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: New view service connection listener created:%@ with serviceName:%@", buf, 0x16u);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  [(NSMutableSet *)self->_connectionServers enumerateObjectsUsingBlock:&__block_literal_global_29];
  connectionServers = self->_connectionServers;
  self->_connectionServers = 0;

  v4.receiver = self;
  v4.super_class = (Class)NPKCompanionViewServiceConnectionServerService;
  [(NPKCompanionViewServiceConnectionServerService *)&v4 dealloc];
}

void __57__NPKCompanionViewServiceConnectionServerService_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v2 = [v3 connection];
  [v2 invalidate];

  [v3 clearConnectionReference];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v6 = (NSXPCListener *)a3;
  v7 = (NSXPCListener *)a4;
  xpcListener = self->_xpcListener;
  v9 = pk_Payment_log();
  v10 = v9;
  if (xpcListener == v6)
  {
    BOOL v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        v19 = v7;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Requested new connection:%@", (uint8_t *)&v18, 0xCu);
      }
    }
    objc_super v11 = [(NSXPCListener *)v7 valueForEntitlement:@"com.apple.NanoPassbook.NPKCompanionViewService.client"];
    if (!v11
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([v11 BOOLValue] & 1) != 0)
    {
      [(NPKCompanionViewServiceConnectionServerService *)self _addConnection:v7];
      LOBYTE(self) = 1;
      goto LABEL_14;
    }
    v15 = pk_Payment_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      v17 = pk_Payment_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_ERROR, "Error: NPKCompanionViewService: Client doesn't have required entitlement to establish the connection", (uint8_t *)&v18, 2u);
      }
    }
LABEL_5:
    LOBYTE(self) = 0;
LABEL_14:

    goto LABEL_15;
  }
  LODWORD(self) = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

  if (self)
  {
    objc_super v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: NPKCompanionViewService: Unknown requested connection from listener:%@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_5;
  }
LABEL_15:

  return (char)self;
}

- (void)handleCompanionValueEntryRequestFinishedWithCurrencyAmount:(id)a3 forRequestIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionServers = self->_connectionServers;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __130__NPKCompanionViewServiceConnectionServerService_handleCompanionValueEntryRequestFinishedWithCurrencyAmount_forRequestIdentifier___block_invoke;
  v11[3] = &unk_2644D7628;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSMutableSet *)connectionServers enumerateObjectsUsingBlock:v11];
}

void __130__NPKCompanionViewServiceConnectionServerService_handleCompanionValueEntryRequestFinishedWithCurrencyAmount_forRequestIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObjectProxy];
  [v3 handleCompanionValueEntryFinishedWithCurrencyAmount:*(void *)(a1 + 32) forRequestIdentifier:*(void *)(a1 + 40)];
}

- (void)handleCompanionValueEntryRequestDidCancelForRequestIdentifier:(id)a3
{
  id v4 = a3;
  connectionServers = self->_connectionServers;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __112__NPKCompanionViewServiceConnectionServerService_handleCompanionValueEntryRequestDidCancelForRequestIdentifier___block_invoke;
  v7[3] = &unk_2644D7650;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableSet *)connectionServers enumerateObjectsUsingBlock:v7];
}

void __112__NPKCompanionViewServiceConnectionServerService_handleCompanionValueEntryRequestDidCancelForRequestIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObjectProxy];
  [v3 handleCompanionValueEntryCancelledForRequestIdentifier:*(void *)(a1 + 32)];
}

- (void)handleCompanionItemSelectionRequestFinishedWithRenewalAmount:(id)a3 serviceProviderData:(id)a4 forRequestIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connectionServers = self->_connectionServers;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __152__NPKCompanionViewServiceConnectionServerService_handleCompanionItemSelectionRequestFinishedWithRenewalAmount_serviceProviderData_forRequestIdentifier___block_invoke;
  v15[3] = &unk_2644D7678;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(NSMutableSet *)connectionServers enumerateObjectsUsingBlock:v15];
}

void __152__NPKCompanionViewServiceConnectionServerService_handleCompanionItemSelectionRequestFinishedWithRenewalAmount_serviceProviderData_forRequestIdentifier___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 remoteObjectProxy];
  [v3 handleCompanionItemSelectionRequestFinishedWithRenewalAmount:a1[4] serviceProviderData:a1[5] forRequestIdentifier:a1[6]];
}

- (void)handleCompanionItemSelectionRequestDidCancelForRequestIdentifier:(id)a3
{
  id v4 = a3;
  connectionServers = self->_connectionServers;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __115__NPKCompanionViewServiceConnectionServerService_handleCompanionItemSelectionRequestDidCancelForRequestIdentifier___block_invoke;
  v7[3] = &unk_2644D7650;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableSet *)connectionServers enumerateObjectsUsingBlock:v7];
}

void __115__NPKCompanionViewServiceConnectionServerService_handleCompanionItemSelectionRequestDidCancelForRequestIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObjectProxy];
  [v3 handleCompanionItemSelectionRequestCancelledForRequestIdentifier:*(void *)(a1 + 32)];
}

- (void)_addConnection:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PDXPCService *)[NPKCompanionViewServiceConnectionServer alloc] initWithConnection:v4];
  [(NPKCompanionViewServiceConnectionServer *)v5 setDelegate:self];
  id v6 = NPKCompanionViewServiceConnectionServerProtocolInterface();
  [v4 setExportedInterface:v6];

  [v4 setExportedObject:v5];
  id v7 = NPKCompanionViewServiceConnectionClientProtocolInterface();
  [v4 setRemoteObjectInterface:v7];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __65__NPKCompanionViewServiceConnectionServerService__addConnection___block_invoke;
  v21[3] = &unk_2644D3260;
  objc_copyWeak(&v23, &from);
  objc_copyWeak(&v24, &location);
  id v8 = v5;
  v22 = v8;
  [v4 setInvalidationHandler:v21];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __65__NPKCompanionViewServiceConnectionServerService__addConnection___block_invoke_7;
  id v17 = &unk_2644D3260;
  objc_copyWeak(&v19, &from);
  objc_copyWeak(&v20, &location);
  id v9 = v8;
  id v18 = v9;
  [v4 setInterruptionHandler:&v14];
  -[NPKCompanionViewServiceConnectionServerService _addServer:](self, "_addServer:", v9, v14, v15, v16, v17);
  [v4 resume];
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v4 processIdentifier];
      *(_DWORD *)buf = 138412546;
      id v28 = v4;
      __int16 v29 = 1024;
      int v30 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Added new connection:{%@, PID:%d}", buf, 0x12u);
    }
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __65__NPKCompanionViewServiceConnectionServerService__addConnection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 _removeServer:*(void *)(a1 + 32)];
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2112;
      id v10 = WeakRetained;
      __int16 v11 = 1024;
      int v12 = [WeakRetained processIdentifier];
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: %@ Connection invalidated:{%@, PID:%d}", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void __65__NPKCompanionViewServiceConnectionServerService__addConnection___block_invoke_7(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 _removeServer:*(void *)(a1 + 32)];
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2112;
      id v10 = WeakRetained;
      __int16 v11 = 1024;
      int v12 = [WeakRetained processIdentifier];
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: %@ Connection interrupted:{%@, PID:%d}", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)_addServer:(id)a3
{
}

- (void)_removeServer:(id)a3
{
  id v5 = a3;
  id v4 = [v5 connection];
  [v4 invalidate];

  [v5 clearConnectionReference];
  [(NSMutableSet *)self->_connectionServers removeObject:v5];
}

- (void)viewServiceConnectionServer:(id)a3 didRequestPresentRemotePassValueEntryViewControllerForRequest:(id)a4 contact:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(NPKCompanionViewServiceConnectionServerService *)self delegate];
  [v12 viewServiceConnectionServerService:self didRequestPresentRemotePassValueEntryViewControllerForRequest:v11 contact:v10 completion:v9];
}

- (void)viewServiceConnectionServer:(id)a3 didRequestPresentRemotePassItemSelectionViewControllerForRequest:(id)a4 contact:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(NPKCompanionViewServiceConnectionServerService *)self delegate];
  [v12 viewServiceConnectionServerService:self didRequestPresentRemotePassItemSelectionViewControllerForRequest:v11 contact:v10 completion:v9];
}

- (NPKCompanionViewServiceConnectionServerServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKCompanionViewServiceConnectionServerServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionServers, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end