@interface UNSDaemonLauncher
- (UNSDaemonLauncher)init;
- (id)_queue_ensureConnectionForBundleIdentifier:(id)a3;
- (void)_queue_interruptedConnectionForBundleIdentifier:(id)a3;
- (void)_queue_invalidatedConnectionForBundleIdentifier:(id)a3;
- (void)didChangeSettings:(id)a3 forBundleIdentifier:(id)a4;
- (void)didOpenApplicationForResponse:(id)a3 forBundleIdentifier:(id)a4;
- (void)didReceiveNotificationResponse:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UNSDaemonLauncher

- (UNSDaemonLauncher)init
{
  v12.receiver = self;
  v12.super_class = (Class)UNSDaemonLauncher;
  v2 = [(UNSDaemonLauncher *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    connectionByBundleIdentifier = v2->_connectionByBundleIdentifier;
    v2->_connectionByBundleIdentifier = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.usernotifications.UNSDaemonLauncher", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.usernotifications.UNSDaemonLauncher.call-out", v8);
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)didReceiveNotificationResponse:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v9;
    _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending didReceiveNotificationResponse:forBundleIdentifier:", buf, 0xCu);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke;
  v16[3] = &unk_26462F628;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(queue, v16);
}

void __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnectionForBundleIdentifier:", *(void *)(a1 + 40));
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_26462F5B0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v15 = v3;
  uint64_t v16 = v4;
  id v17 = *(id *)(a1 + 56);
  v5 = [v2 remoteObjectProxyWithErrorHandler:v14];
  dispatch_queue_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2_5;
  v10[3] = &unk_26462F600;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = v9;
  id v13 = *(id *)(a1 + 56);
  [v5 didReceiveNotificationResponse:v7 forBundleIdentifier:v8 withCompletionHandler:v10];
}

void __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  block[3] = &unk_26462F588;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2_5(uint64_t a1, char a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] didReceiveNotificationResponse:forBundleIdentifier: succeeded", buf, 0xCu);
  }
  id v6 = *(NSObject **)(*(void *)(a1 + 40) + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_6;
  v7[3] = &unk_26462F5D8;
  id v8 = *(id *)(a1 + 48);
  char v9 = a2;
  dispatch_async(v6, v7);
}

uint64_t __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)didOpenApplicationForResponse:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v7;
    _os_log_impl(&dword_22289A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending didOpenApplicationForResponse:forBundleIdentifier:", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke;
  block[3] = &unk_26462F678;
  void block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnectionForBundleIdentifier:", *(void *)(a1 + 40));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke_2;
  v4[3] = &unk_26462F650;
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 didOpenApplicationForResponse:*(void *)(a1 + 48) forBundleIdentifier:*(void *)(a1 + 40)];
}

void __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke_2_cold_1();
  }
}

- (void)didChangeSettings:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v7;
    _os_log_impl(&dword_22289A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending didChangeSettings:forBundleIdentifier:", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke;
  block[3] = &unk_26462F678;
  void block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnectionForBundleIdentifier:", *(void *)(a1 + 40));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke_2;
  v4[3] = &unk_26462F650;
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 didChangeSettings:*(void *)(a1 + 48) forBundleIdentifier:*(void *)(a1 + 40)];
}

void __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke_2_cold_1();
  }
}

- (id)_queue_ensureConnectionForBundleIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(NSMutableDictionary *)self->_connectionByBundleIdentifier objectForKey:v4];
  if (!v5)
  {
    objc_initWeak(&location, self);
    id v6 = [MEMORY[0x263F1DFB8] serviceNameForBundleIdentifier:v4];
    id v5 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v6 options:0];
    [(NSMutableDictionary *)self->_connectionByBundleIdentifier setObject:v5 forKey:v4];
    id v7 = [MEMORY[0x263F1DFB8] serverInterface];
    [v5 setRemoteObjectInterface:v7];

    objc_initWeak(&from, self->_queue);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke;
    v17[3] = &unk_26462F6C8;
    objc_copyWeak(&v19, &from);
    objc_copyWeak(&v20, &location);
    id v8 = v4;
    id v18 = v8;
    [v5 setInterruptionHandler:v17];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_3;
    id v13 = &unk_26462F6C8;
    objc_copyWeak(&v15, &from);
    objc_copyWeak(&v16, &location);
    id v14 = v8;
    [v5 setInvalidationHandler:&v10];
    objc_msgSend(v5, "resume", v10, v11, v12, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke(id *a1)
{
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_2;
    v3[3] = &unk_26462F6A0;
    objc_copyWeak(&v5, a1 + 6);
    id v4 = a1[4];
    dispatch_async(WeakRetained, v3);

    objc_destroyWeak(&v5);
  }
}

void __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_interruptedConnectionForBundleIdentifier:", *(void *)(a1 + 32));
}

void __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_4;
    v3[3] = &unk_26462F6A0;
    objc_copyWeak(&v5, a1 + 6);
    id v4 = a1[4];
    dispatch_async(WeakRetained, v3);

    objc_destroyWeak(&v5);
  }
}

void __64__UNSDaemonLauncher__queue_ensureConnectionForBundleIdentifier___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_invalidatedConnectionForBundleIdentifier:", *(void *)(a1 + 32));
}

- (void)_queue_interruptedConnectionForBundleIdentifier:(id)a3
{
}

- (void)_queue_invalidatedConnectionForBundleIdentifier:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(NSMutableDictionary *)self->_connectionByBundleIdentifier objectForKey:v5];
  [v6 invalidate];
  [v6 setInterruptionHandler:0];
  [v6 setInvalidationHandler:0];
  [v6 setExportedObject:0];
  [(NSMutableDictionary *)self->_connectionByBundleIdentifier removeObjectForKey:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __94__UNSDaemonLauncher_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "[%{public}@] didReceiveNotificationResponse:forBundleIdentifier: failed with error: %{public}@");
}

void __71__UNSDaemonLauncher_didOpenApplicationForResponse_forBundleIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "[%{public}@] didOpenApplicationForResponse:forBundleIdentifier: failed with error: %{public}@");
}

void __59__UNSDaemonLauncher_didChangeSettings_forBundleIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "[%{public}@] didChangeSettings:forBundleIdentifier: failed with error: %{public}@");
}

@end