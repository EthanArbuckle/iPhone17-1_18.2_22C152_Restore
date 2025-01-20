@interface ICQUIEnableiCloudSyncHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (ICQUIEnableiCloudSyncHook)initWithAccount:(id)a3 dataclasses:(id)a4;
- (RUIServerHookDelegate)delegate;
- (id)continuationResponseBody;
- (void)_turnOniCloudSyncWithCompletion:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)signInOperationManager:(id)a3 didSaveAccount:(id)a4 error:(id)a5;
@end

@implementation ICQUIEnableiCloudSyncHook

- (ICQUIEnableiCloudSyncHook)initWithAccount:(id)a3 dataclasses:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQUIEnableiCloudSyncHook;
  v9 = [(ICQUIEnableiCloudSyncHook *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_dataclasses, a4);
  }

  return v10;
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"TURN_ON_ICLOUD_SYNC"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  char v5 = [v4 isEqualToString:@"TURN_ON_ICLOUD_SYNC"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a6;
  v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v8 name];
    int v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Processing iCloudSync RUI hook with element %@", (uint8_t *)&v12, 0xCu);
  }
  [(ICQUIEnableiCloudSyncHook *)self _turnOniCloudSyncWithCompletion:v9];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 clientInfo];
    v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F63818]];
    int v11 = 138412290;
    int v12 = v10;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Processing iCloudSync RUI hook with object model action %@", (uint8_t *)&v11, 0xCu);
  }
  [(ICQUIEnableiCloudSyncHook *)self _turnOniCloudSyncWithCompletion:v7];
}

- (id)continuationResponseBody
{
  return 0;
}

- (void)_turnOniCloudSyncWithCompletion:(id)a3
{
  char v4 = _Block_copy(a3);
  id hookCompletion = self->_hookCompletion;
  self->_id hookCompletion = v4;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [WeakRetained presentationContextForHook:self];

  id v7 = (AAUISignInOperationManager *)[objc_alloc(MEMORY[0x263F25D50]) initWithPresentingViewController:v9];
  dataclassOperationManager = self->_dataclassOperationManager;
  self->_dataclassOperationManager = v7;

  [(AAUISignInOperationManager *)self->_dataclassOperationManager setDelegate:self];
  [(AAUISignInOperationManager *)self->_dataclassOperationManager enableDataclasses:self->_dataclasses forAccount:self->_account];
}

- (void)signInOperationManager:(id)a3 didSaveAccount:(id)a4 error:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = _ICQGetLogSystem();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICQUIEnableiCloudSyncHook signInOperationManager:didSaveAccount:error:]((uint64_t)self, (uint64_t)v8, v10);
    }

    int v11 = (void (*)(void))*((void *)self->_hookCompletion + 2);
    goto LABEL_5;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v7;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Successfully enabled iCloud sync for account (%@)", (uint8_t *)&v13, 0xCu);
  }

  if (![(NSSet *)self->_dataclasses containsObject:*MEMORY[0x263EFACC0]]
    && ![(NSSet *)self->_dataclasses containsObject:*MEMORY[0x263EFAC58]])
  {
    int v11 = (void (*)(void))*((void *)self->_hookCompletion + 2);
LABEL_5:
    v11();
    goto LABEL_13;
  }
  int v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "Procedding to enable iCloud sync for Photos.", (uint8_t *)&v13, 2u);
  }

  +[ICQUIPhotosHelper enableCloudPhotosLibraryWithCompletion:self->_hookCompletion];
LABEL_13:
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataclassOperationManager, 0);
  objc_storeStrong(&self->_hookCompletion, 0);
  objc_storeStrong((id *)&self->_dataclasses, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)signInOperationManager:(uint64_t)a1 didSaveAccount:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Failed to turn on iCloud sync for account (%@), dataclasses (%@) with error: %@", (uint8_t *)&v5, 0x20u);
}

@end