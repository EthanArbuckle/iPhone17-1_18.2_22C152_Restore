@interface NPKCompanionViewServiceConnection
- (NPKCompanionViewServiceConnection)init;
- (NPKCompanionViewServiceConnectionDelegate)delegate;
- (id)_errorHandlerWithCompletion:(id)a3;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (void)dealloc;
- (void)handleCompanionItemSelectionRequestCancelledForRequestIdentifier:(id)a3;
- (void)handleCompanionItemSelectionRequestFinishedWithRenewalAmount:(id)a3 serviceProviderData:(id)a4 forRequestIdentifier:(id)a5;
- (void)handleCompanionValueEntryCancelledForRequestIdentifier:(id)a3;
- (void)handleCompanionValueEntryFinishedWithCurrencyAmount:(id)a3 forRequestIdentifier:(id)a4;
- (void)presentRemotePassItemSelectionViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5;
- (void)presentRemotePassValueEntryViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5;
- (void)remoteService:(id)a3 didEstablishConnection:(id)a4;
- (void)remoteService:(id)a3 didInterruptConnection:(id)a4;
- (void)serviceResumed;
- (void)serviceSuspended;
- (void)setDelegate:(id)a3;
@end

@implementation NPKCompanionViewServiceConnection

- (NPKCompanionViewServiceConnection)init
{
  v9.receiver = self;
  v9.super_class = (Class)NPKCompanionViewServiceConnection;
  v2 = [(NPKCompanionViewServiceConnection *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F5C2F0]);
    v4 = NPKCompanionViewServiceConnectionServerProtocolInterface();
    v5 = NPKCompanionViewServiceConnectionClientProtocolInterface();
    uint64_t v6 = [v3 initWithMachServiceName:@"com.apple.NanoPassbook.NPKCompanionViewService.connection.server" remoteObjectInterface:v4 exportedObjectInterface:v5 exportedObject:v2];
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v6;

    [(PKXPCService *)v2->_remoteService setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[NPKCompanionViewServiceConnection dealloc]";
      __int16 v9 = 2112;
      v10 = self;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: %s, %@", buf, 0x16u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)NPKCompanionViewServiceConnection;
  [(NPKCompanionViewServiceConnection *)&v6 dealloc];
}

- (void)presentRemotePassValueEntryViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x223C37380](v10);
      *(_DWORD *)buf = 138412802;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Requested to present remote pass value entry view controller for request: %@ contact: %@ with completion: %@", buf, 0x20u);
    }
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __108__NPKCompanionViewServiceConnection_presentRemotePassValueEntryViewControllerForRequest_contact_completion___block_invoke;
  v22[3] = &unk_2644D2B40;
  id v23 = v8;
  id v24 = v9;
  id v15 = v10;
  id v25 = v15;
  id v16 = v9;
  id v17 = v8;
  v18 = [(NPKCompanionViewServiceConnection *)self _remoteObjectProxyWithFailureHandler:v22];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __108__NPKCompanionViewServiceConnection_presentRemotePassValueEntryViewControllerForRequest_contact_completion___block_invoke_49;
  v20[3] = &unk_2644D2B68;
  v20[4] = self;
  id v21 = v15;
  id v19 = v15;
  [v18 presentRemotePassValueEntryViewControllerForRequest:v17 contact:v16 completion:v20];
}

void __108__NPKCompanionViewServiceConnection_presentRemotePassValueEntryViewControllerForRequest_contact_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    objc_super v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      id v9 = (void *)MEMORY[0x223C37380](a1[6]);
      int v10 = 138413058;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Error presenting remote pass value entry view controller for request: %@ contact: %@ with completion: %@. Error:%@", (uint8_t *)&v10, 0x2Au);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __108__NPKCompanionViewServiceConnection_presentRemotePassValueEntryViewControllerForRequest_contact_completion___block_invoke_49(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    objc_super v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"NO";
      if (a2) {
        uint64_t v7 = @"YES";
      }
      int v9 = 138412290;
      int v10 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Finished presenting remote pass value entry view controller with success: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)presentRemotePassItemSelectionViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    uint64_t v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = (void *)MEMORY[0x223C37380](v10);
      *(_DWORD *)buf = 138412802;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Requested to present remote pass item selection view controller for request: %@ contact: %@ with completion: %@", buf, 0x20u);
    }
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __111__NPKCompanionViewServiceConnection_presentRemotePassItemSelectionViewControllerForRequest_contact_completion___block_invoke;
  v22[3] = &unk_2644D2B40;
  id v23 = v8;
  id v24 = v9;
  id v15 = v10;
  id v25 = v15;
  id v16 = v9;
  id v17 = v8;
  uint64_t v18 = [(NPKCompanionViewServiceConnection *)self _remoteObjectProxyWithFailureHandler:v22];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __111__NPKCompanionViewServiceConnection_presentRemotePassItemSelectionViewControllerForRequest_contact_completion___block_invoke_57;
  v20[3] = &unk_2644D2B68;
  v20[4] = self;
  id v21 = v15;
  id v19 = v15;
  [v18 presentRemotePassItemSelectionViewControllerForRequest:v17 contact:v16 completion:v20];
}

void __111__NPKCompanionViewServiceConnection_presentRemotePassItemSelectionViewControllerForRequest_contact_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    objc_super v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      id v9 = (void *)MEMORY[0x223C37380](a1[6]);
      int v10 = 138413058;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Error presenting remote pass item selection view controller for request: %@ contact: %@ with completion: %@. Error:%@", (uint8_t *)&v10, 0x2Au);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __111__NPKCompanionViewServiceConnection_presentRemotePassItemSelectionViewControllerForRequest_contact_completion___block_invoke_57(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    objc_super v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = @"NO";
      if (a2) {
        uint64_t v7 = @"YES";
      }
      int v9 = 138412290;
      int v10 = v7;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Finished presenting remote pass item selection view controller with success: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  remoteService = self->_remoteService;
  BOOL v4 = [(NPKCompanionViewServiceConnection *)self _errorHandlerWithCompletion:a3];
  BOOL v5 = [(PKXPCService *)remoteService remoteObjectProxyWithErrorHandler:v4];

  return v5;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v3 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__NPKCompanionViewServiceConnection__errorHandlerWithCompletion___block_invoke;
  v8[3] = &unk_2644D2B90;
  id v9 = v3;
  id v4 = v3;
  BOOL v5 = (void *)MEMORY[0x223C37380](v8);
  objc_super v6 = (void *)MEMORY[0x223C37380]();

  return v6;
}

void __65__NPKCompanionViewServiceConnection__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    objc_super v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKCompanionViewService: Error on connection: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)handleCompanionValueEntryFinishedWithCurrencyAmount:(id)a3 forRequestIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKCompanionViewServiceConnection *)self delegate];
  [v8 companionViewServiceConnection:self handleCompanionValueEntryDidFinishWithCurrencyAmount:v7 forRequestWithIdentifier:v6];
}

- (void)handleCompanionValueEntryCancelledForRequestIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionViewServiceConnection *)self delegate];
  [v5 companionViewServiceConnection:self handleCompanionValueEntryDidCancelForRequestIdentifier:v4];
}

- (void)handleCompanionItemSelectionRequestFinishedWithRenewalAmount:(id)a3 serviceProviderData:(id)a4 forRequestIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPKCompanionViewServiceConnection *)self delegate];
  [v11 companionViewServiceConnection:self handleCompanionItemSelectionDidFinishWithRenewalAmount:v10 serviceProviderData:v9 forRequestWithIdentifier:v8];
}

- (void)handleCompanionItemSelectionRequestCancelledForRequestIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKCompanionViewServiceConnection *)self delegate];
  [v5 companionViewServiceConnection:self handleCompanionItemSelectionDidCancelForRequestIdentifier:v4];
}

- (void)serviceResumed
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: View service connection resumed", v5, 2u);
    }
  }
}

- (void)serviceSuspended
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: View service connection suspended", v5, 2u);
    }
  }
}

- (void)remoteService:(id)a3 didEstablishConnection:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Remote service (%@) did establish connection (%@)", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = self;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: NPKCompanionViewServiceConnection (%@): XPC connection to daemon was interrupted", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (NPKCompanionViewServiceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKCompanionViewServiceConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end