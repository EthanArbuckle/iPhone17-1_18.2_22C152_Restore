@interface TUIAppleAccountManager
- (TUIAppleAccountManager)initWithAccountStore:(id)a3;
- (void)silentRenewAppleAccountWithCompletionHandler:(id)a3;
@end

@implementation TUIAppleAccountManager

- (TUIAppleAccountManager)initWithAccountStore:(id)a3
{
  id v5 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2, &__block_literal_global_2);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_DEBUG)) {
    -[TUIAppleAccountManager initWithAccountStore:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)TUIAppleAccountManager;
  v6 = [(TUIAppleAccountManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountStore, a3);
  }

  return v7;
}

uint64_t __47__TUIAppleAccountManager_initWithAccountStore___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)silentRenewAppleAccountWithCompletionHandler:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2, &__block_literal_global_4);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_DEBUG)) {
    -[TUIAppleAccountManager silentRenewAppleAccountWithCompletionHandler:]();
  }
  id v5 = [(ACAccountStore *)self->_accountStore aida_accountForPrimaryiCloudAccount];
  uint64_t v6 = *MEMORY[0x263EFB390];
  v14[0] = *MEMORY[0x263EFB388];
  v14[1] = v6;
  v15[0] = MEMORY[0x263EFFA88];
  v15[1] = MEMORY[0x263EFFA80];
  v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  id location = 0;
  objc_initWeak(&location, self);
  accountStore = self->_accountStore;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__TUIAppleAccountManager_silentRenewAppleAccountWithCompletionHandler___block_invoke_5;
  v10[3] = &unk_2655533F8;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [(ACAccountStore *)accountStore renewCredentialsForAccount:v5 options:v7 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

uint64_t __71__TUIAppleAccountManager_silentRenewAppleAccountWithCompletionHandler___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __71__TUIAppleAccountManager_silentRenewAppleAccountWithCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2, &__block_literal_global_7);
    }
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "-[TUIAppleAccountManager silentRenewAppleAccountWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", (uint8_t *)&v9, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2, &__block_literal_global_10);
  }
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315906;
    v10 = "-[TUIAppleAccountManager silentRenewAppleAccountWithCompletionHandler:]_block_invoke_2";
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2114;
    id v14 = v5;
    __int16 v15 = 2114;
    id v16 = WeakRetained;
    _os_log_debug_impl(&dword_260338000, v8, OS_LOG_TYPE_DEBUG, "%s renewResult = %ld, error = %{public}@ on %{public}@", (uint8_t *)&v9, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__TUIAppleAccountManager_silentRenewAppleAccountWithCompletionHandler___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __71__TUIAppleAccountManager_silentRenewAppleAccountWithCompletionHandler___block_invoke_8()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
}

- (void)initWithAccountStore:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_260338000, v2, OS_LOG_TYPE_DEBUG, "%s accountStore = %{public}@ on %{public}@", (uint8_t *)v3, 0x20u);
}

- (void)silentRenewAppleAccountWithCompletionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

@end