@interface NPKRemotePassActionUIService
- (NPKCompanionViewServiceConnection)connection;
- (NPKRemotePassActionUIServiceDelegate)delegate;
- (void)companionViewServiceConnection:(id)a3 handleCompanionItemSelectionDidCancelForRequestIdentifier:(id)a4;
- (void)companionViewServiceConnection:(id)a3 handleCompanionItemSelectionDidFinishWithRenewalAmount:(id)a4 serviceProviderData:(id)a5 forRequestWithIdentifier:(id)a6;
- (void)companionViewServiceConnection:(id)a3 handleCompanionValueEntryDidCancelForRequestIdentifier:(id)a4;
- (void)companionViewServiceConnection:(id)a3 handleCompanionValueEntryDidFinishWithCurrencyAmount:(id)a4 forRequestWithIdentifier:(id)a5;
- (void)presentRemotePassItemSelectionViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5;
- (void)presentRemotePassValueEntryViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NPKRemotePassActionUIService

- (NPKCompanionViewServiceConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = objc_alloc_init(NPKCompanionViewServiceConnection);
    v5 = self->_connection;
    self->_connection = v4;

    [(NPKCompanionViewServiceConnection *)self->_connection setDelegate:self];
    connection = self->_connection;
  }
  return connection;
}

- (void)presentRemotePassValueEntryViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = pk_RemotePassAction_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x223C37380](v10);
      int v16 = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKRemotePassActionUIService: Present remote pass value entry view controller for request: %@ contact: %@ completion: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  v15 = [(NPKRemotePassActionUIService *)self connection];
  [v15 presentRemotePassValueEntryViewControllerForRequest:v8 contact:v9 completion:v10];
}

- (void)presentRemotePassItemSelectionViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = pk_RemotePassAction_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x223C37380](v10);
      int v16 = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKRemotePassActionUIService: Present remote pass value select item controller for request: %@ contact: %@ completion: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  v15 = [(NPKRemotePassActionUIService *)self connection];
  [v15 presentRemotePassItemSelectionViewControllerForRequest:v8 contact:v9 completion:v10];
}

- (void)companionViewServiceConnection:(id)a3 handleCompanionValueEntryDidFinishWithCurrencyAmount:(id)a4 forRequestWithIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(NPKRemotePassActionUIService *)self delegate];
  [v9 remotePassActionUIService:self didSelectEnteredValueAmount:v8 forRequestIdentifier:v7];
}

- (void)companionViewServiceConnection:(id)a3 handleCompanionValueEntryDidCancelForRequestIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(NPKRemotePassActionUIService *)self delegate];
  [v6 remotePassActionUIService:self didCancelForRequestIdentifier:v5];
}

- (void)companionViewServiceConnection:(id)a3 handleCompanionItemSelectionDidFinishWithRenewalAmount:(id)a4 serviceProviderData:(id)a5 forRequestWithIdentifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(NPKRemotePassActionUIService *)self delegate];
  [v12 remotePassActionUIService:self didSelectItemForRenewalAmount:v11 serviceProviderData:v10 forRequestIdentifier:v9];
}

- (void)companionViewServiceConnection:(id)a3 handleCompanionItemSelectionDidCancelForRequestIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(NPKRemotePassActionUIService *)self delegate];
  [v6 remotePassActionUIService:self didCancelForRequestIdentifier:v5];
}

- (NPKRemotePassActionUIServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKRemotePassActionUIServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end