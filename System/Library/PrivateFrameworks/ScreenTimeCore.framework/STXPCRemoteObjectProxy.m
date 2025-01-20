@interface STXPCRemoteObjectProxy
+ (void)_proxyFromConnection:(id)a3 withRetryCount:(unint64_t)a4 proxyHandler:(id)a5;
+ (void)_synchronousProxyFromConnection:(id)a3 withRetryCount:(unint64_t)a4 proxyHandler:(id)a5;
+ (void)proxyFromConnection:(id)a3 proxyHandler:(id)a4;
+ (void)synchronousProxyFromConnection:(id)a3 proxyHandler:(id)a4;
@end

@implementation STXPCRemoteObjectProxy

+ (void)proxyFromConnection:(id)a3 proxyHandler:(id)a4
{
}

+ (void)_proxyFromConnection:(id)a3 withRetryCount:(unint64_t)a4 proxyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__STXPCRemoteObjectProxy__proxyFromConnection_withRetryCount_proxyHandler___block_invoke;
  v13[3] = &unk_1E6BC8358;
  unint64_t v16 = a4;
  id v17 = a1;
  id v14 = v8;
  id v15 = v9;
  v10 = (void (**)(id, void *, void))v9;
  id v11 = v8;
  v12 = [v11 remoteObjectProxyWithErrorHandler:v13];
  v10[2](v10, v12, 0);
}

void __75__STXPCRemoteObjectProxy__proxyFromConnection_withRetryCount_proxyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (!*(void *)(a1 + 48)) {
    goto LABEL_8;
  }
  v5 = [v3 domain];
  if (([v5 isEqualToString:*MEMORY[0x1E4F281F8]] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v6 = [v4 code];

  if (v6 != 4097)
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __75__STXPCRemoteObjectProxy__proxyFromConnection_withRetryCount_proxyHandler___block_invoke_cold_1(a1);
  }
  [*(id *)(a1 + 56) _proxyFromConnection:*(void *)(a1 + 32) withRetryCount:*(void *)(a1 + 48) - 1 proxyHandler:*(void *)(a1 + 40)];
LABEL_9:
}

+ (void)synchronousProxyFromConnection:(id)a3 proxyHandler:(id)a4
{
}

+ (void)_synchronousProxyFromConnection:(id)a3 withRetryCount:(unint64_t)a4 proxyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__STXPCRemoteObjectProxy__synchronousProxyFromConnection_withRetryCount_proxyHandler___block_invoke;
  v13[3] = &unk_1E6BC8358;
  unint64_t v16 = a4;
  id v17 = a1;
  id v14 = v8;
  id v15 = v9;
  v10 = (void (**)(id, void *, void))v9;
  id v11 = v8;
  v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v10[2](v10, v12, 0);
}

void __86__STXPCRemoteObjectProxy__synchronousProxyFromConnection_withRetryCount_proxyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (!*(void *)(a1 + 48)) {
    goto LABEL_8;
  }
  v5 = [v3 domain];
  if (([v5 isEqualToString:*MEMORY[0x1E4F281F8]] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v6 = [v4 code];

  if (v6 != 4097)
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __75__STXPCRemoteObjectProxy__proxyFromConnection_withRetryCount_proxyHandler___block_invoke_cold_1(a1);
  }
  [*(id *)(a1 + 56) _synchronousProxyFromConnection:*(void *)(a1 + 32) withRetryCount:*(void *)(a1 + 48) - 1 proxyHandler:*(void *)(a1 + 40)];
LABEL_9:
}

void __75__STXPCRemoteObjectProxy__proxyFromConnection_withRetryCount_proxyHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) serviceName];
  OUTLINED_FUNCTION_0_7();
  _os_log_error_impl(&dword_1DA519000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Connection error from %{public}@: %{public}@\nAttempts remaining: %lu", v2, 0x20u);
}

@end