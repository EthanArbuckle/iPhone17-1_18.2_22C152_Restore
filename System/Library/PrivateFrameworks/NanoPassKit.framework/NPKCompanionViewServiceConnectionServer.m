@interface NPKCompanionViewServiceConnectionServer
- (NPKCompanionViewServiceConnectionServerDelegate)delegate;
- (id)_checkCompanionViewServiceConnectionEntitlement;
- (void)presentRemotePassItemSelectionViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5;
- (void)presentRemotePassValueEntryViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation NPKCompanionViewServiceConnectionServer

- (void)presentRemotePassValueEntryViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x223C37380](v10);
      int v17 = 138412802;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Requested present remote pass action entry view controller for request: %@ contact: %@ completion %@", (uint8_t *)&v17, 0x20u);
    }
  }
  v15 = [(NPKCompanionViewServiceConnectionServer *)self _checkCompanionViewServiceConnectionEntitlement];
  if (v15)
  {
    v10[2](v10, 0);
  }
  else
  {
    v16 = [(NPKCompanionViewServiceConnectionServer *)self delegate];
    [v16 viewServiceConnectionServer:self didRequestPresentRemotePassValueEntryViewControllerForRequest:v8 contact:v9 completion:v10];
  }
}

- (void)presentRemotePassItemSelectionViewControllerForRequest:(id)a3 contact:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x223C37380](v10);
      int v17 = 138412802;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Requested present remote pass action selection view controller for request: %@ contact: %@ completion %@", (uint8_t *)&v17, 0x20u);
    }
  }
  v15 = [(NPKCompanionViewServiceConnectionServer *)self _checkCompanionViewServiceConnectionEntitlement];
  if (v15)
  {
    v10[2](v10, 0);
  }
  else
  {
    v16 = [(NPKCompanionViewServiceConnectionServer *)self delegate];
    [v16 viewServiceConnectionServer:self didRequestPresentRemotePassItemSelectionViewControllerForRequest:v8 contact:v9 completion:v10];
  }
}

- (id)_checkCompanionViewServiceConnectionEntitlement
{
  v2 = [(PDXPCService *)self connection];
  v3 = [v2 valueForEntitlement:@"com.apple.NanoPassbook.NPKCompanionViewService.client"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 BOOLValue])
  {
    v4 = 0;
  }
  else
  {
    v4 = NPKCompanionViewServiceError(-1000, 0);
  }

  return v4;
}

- (NPKCompanionViewServiceConnectionServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKCompanionViewServiceConnectionServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end