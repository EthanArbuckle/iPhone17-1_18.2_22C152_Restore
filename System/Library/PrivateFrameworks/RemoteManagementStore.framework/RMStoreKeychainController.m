@interface RMStoreKeychainController
+ (void)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 completionHandler:(id)a7;
+ (void)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 completionHandler:(id)a7;
@end

@implementation RMStoreKeychainController

+ (void)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[RMStoreXPCProxy newConnectionWithScope:a6];
  [v14 resume];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke;
  v22[3] = &unk_26548F148;
  id v15 = v11;
  id v23 = v15;
  v16 = [v14 remoteObjectProxyWithErrorHandler:v22];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6;
  v19[3] = &unk_26548F0D0;
  id v20 = v14;
  id v21 = v15;
  id v17 = v14;
  id v18 = v15;
  [v16 setTrustForCertificateRef:v13 configurationKey:v12 fullTrust:v8 completionHandler:v19];
}

void __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263F635B0] storeKeychainController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263F635B0] storeKeychainController];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6_cold_1(v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

+ (void)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[RMStoreXPCProxy newConnectionWithScope:a6];
  [v14 resume];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke;
  v22[3] = &unk_26548F148;
  id v15 = v11;
  id v23 = v15;
  v16 = [v14 remoteObjectProxyWithErrorHandler:v22];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7;
  v19[3] = &unk_26548F0D0;
  id v20 = v14;
  id v21 = v15;
  id v17 = v14;
  id v18 = v15;
  [v16 removeTrustForCertificateRef:v13 configurationKey:v12 fullTrust:v8 completionHandler:v19];
}

void __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263F635B0] storeKeychainController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263F635B0] storeKeychainController];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7_cold_1(v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed XPC connection while setting certificate trust: %{public}@", v2, v3, v4, v5, v6);
}

void __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_25B003000, log, OS_LOG_TYPE_DEBUG, "Set certificate trust", v1, 2u);
}

void __106__RMStoreKeychainController_setTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_6_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Could not set certificate trust: %{public}@", v2, v3, v4, v5, v6);
}

void __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Failed XPC connection while removing certificate trust: %{public}@", v2, v3, v4, v5, v6);
}

void __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_25B003000, log, OS_LOG_TYPE_DEBUG, "Removed certificate trust", v1, 2u);
}

void __109__RMStoreKeychainController_removeTrustForCertificateRef_configurationKey_fullTrust_scope_completionHandler___block_invoke_7_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Could not remove certificate trust: %{public}@", v2, v3, v4, v5, v6);
}

@end