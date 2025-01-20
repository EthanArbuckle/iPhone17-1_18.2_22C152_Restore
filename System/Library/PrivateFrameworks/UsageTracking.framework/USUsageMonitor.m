@interface USUsageMonitor
- (BOOL)startMonitoringBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 error:(id *)a6;
- (NSXPCConnection)xpcConnection;
- (USUsageMonitor)init;
- (id)checkStatusOfBudgets:(id)a3 clientIdentifiers:(id)a4 error:(id *)a5;
- (id)checkStatusOfBudgets:(id)a3 error:(id *)a4;
- (void)checkStatusOfAllBudgetsWithCompletionHandler:(id)a3;
- (void)checkStatusOfBudgets:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5;
- (void)checkStatusOfBudgets:(id)a3 clientIdentifiers:(id)a4 completionHandler:(id)a5;
- (void)checkStatusOfBudgets:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)startMonitoringBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 clientIdentifier:(id)a6 completionHandler:(id)a7;
- (void)startMonitoringBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 completionHandler:(id)a6;
- (void)stopMonitoringAllBudgetsWithCompletionHandler:(id)a3;
- (void)stopMonitoringBudgets:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5;
- (void)stopMonitoringBudgets:(id)a3 completionHandler:(id)a4;
@end

@implementation USUsageMonitor

- (USUsageMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)USUsageMonitor;
  v2 = [(USUsageMonitor *)&v6 init];
  v3 = +[USTrackingAgentPrivateConnection newConnection];
  xpcConnection = v2->_xpcConnection;
  v2->_xpcConnection = v3;

  [(NSXPCConnection *)v2->_xpcConnection resume];
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)USUsageMonitor;
  [(USUsageMonitor *)&v3 dealloc];
}

- (void)startMonitoringBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 completionHandler:(id)a6
{
}

- (void)startMonitoringBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 clientIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(USUsageMonitor *)self xpcConnection];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __117__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_clientIdentifier_completionHandler___block_invoke;
  v23[3] = &unk_26431DCC8;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  v28 = self;
  id v29 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  +[USXPCRemoteObjectProxy proxyFromConnection:v17 withRetryCount:1 proxyHandler:v23];
}

void __117__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_clientIdentifier_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __117__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_clientIdentifier_completionHandler___block_invoke_2;
    v9[3] = &unk_26431DCA0;
    v7 = (void *)a1[9];
    v9[4] = a1[8];
    id v10 = v7;
    [a2 startMonitoringBudgets:v3 darwinNotificationName:v4 notificationTimes:v5 clientIdentifier:v6 replyHandler:v9];
  }
  else
  {
    v8 = *(void (**)(void))(a1[9] + 16);
    v8();
  }
}

uint64_t __117__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_clientIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)startMonitoringBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  id v13 = [(USUsageMonitor *)self xpcConnection];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __88__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_error___block_invoke;
  v19[3] = &unk_26431DD18;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  v23 = &v24;
  +[USXPCRemoteObjectProxy synchronousProxyFromConnection:v13 withRetryCount:1 proxyHandler:v19];

  v17 = (void *)v25[5];
  if (a6 && v17) {
    *a6 = v17;
  }

  _Block_object_dispose(&v24, 8);
  return v17 == 0;
}

void __88__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __88__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_error___block_invoke_2;
    v10[3] = &unk_26431DCF0;
    uint64_t v9 = a1[6];
    v10[4] = a1[7];
    [a2 startMonitoringBudgets:v7 darwinNotificationName:v8 notificationTimes:v9 clientIdentifier:0 replyHandler:v10];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  }
}

void __88__USUsageMonitor_startMonitoringBudgets_darwinNotificationName_notificationTimes_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)stopMonitoringBudgets:(id)a3 completionHandler:(id)a4
{
}

- (void)stopMonitoringBudgets:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(USUsageMonitor *)self xpcConnection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__USUsageMonitor_stopMonitoringBudgets_clientIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_26431DD40;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  +[USXPCRemoteObjectProxy proxyFromConnection:v11 withRetryCount:1 proxyHandler:v15];
}

void __75__USUsageMonitor_stopMonitoringBudgets_clientIdentifier_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__USUsageMonitor_stopMonitoringBudgets_clientIdentifier_completionHandler___block_invoke_2;
    v7[3] = &unk_26431DCA0;
    uint64_t v5 = (void *)a1[7];
    v7[4] = a1[6];
    id v8 = v5;
    [a2 stopMonitoringBudgets:v3 clientIdentifier:v4 replyHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(a1[7] + 16);
    v6();
  }
}

uint64_t __75__USUsageMonitor_stopMonitoringBudgets_clientIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stopMonitoringAllBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(USUsageMonitor *)self xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__USUsageMonitor_stopMonitoringAllBudgetsWithCompletionHandler___block_invoke;
  v7[3] = &unk_26431DD68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[USXPCRemoteObjectProxy proxyFromConnection:v5 withRetryCount:1 proxyHandler:v7];
}

void __64__USUsageMonitor_stopMonitoringAllBudgetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __64__USUsageMonitor_stopMonitoringAllBudgetsWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_26431DCA0;
    uint64_t v3 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    [a2 stopMonitoringAllBudgetsWithReplyHandler:v5];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

uint64_t __64__USUsageMonitor_stopMonitoringAllBudgetsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)checkStatusOfBudgets:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__USUsageMonitor_checkStatusOfBudgets_completionHandler___block_invoke;
  v8[3] = &unk_26431DD90;
  id v9 = v6;
  id v7 = v6;
  [(USUsageMonitor *)self checkStatusOfBudgets:a3 clientIdentifier:0 completionHandler:v8];
}

void __57__USUsageMonitor_checkStatusOfBudgets_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v12 = a2;
  id v9 = a5;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v12)
  {
    id v11 = (void *)[objc_alloc(NSDictionary) initWithObjects:v9 forKeys:v12];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v10 + 16))(v10, 0, a6);
  }
}

- (void)checkStatusOfBudgets:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(USUsageMonitor *)self xpcConnection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__USUsageMonitor_checkStatusOfBudgets_clientIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_26431DD40;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  +[USXPCRemoteObjectProxy proxyFromConnection:v11 withRetryCount:1 proxyHandler:v15];
}

void __74__USUsageMonitor_checkStatusOfBudgets_clientIdentifier_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__USUsageMonitor_checkStatusOfBudgets_clientIdentifier_completionHandler___block_invoke_2;
    v7[3] = &unk_26431DDB8;
    uint64_t v5 = (void *)a1[7];
    v7[4] = a1[6];
    id v8 = v5;
    [a2 checkStatusOfBudgets:v3 clientIdentifier:v4 replyHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(a1[7] + 16);
    v6();
  }
}

uint64_t __74__USUsageMonitor_checkStatusOfBudgets_clientIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)checkStatusOfBudgets:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  id v7 = [(USUsageMonitor *)self xpcConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__USUsageMonitor_checkStatusOfBudgets_error___block_invoke;
  v12[3] = &unk_26431DE08;
  id v8 = v6;
  id v13 = v8;
  id v14 = &v22;
  id v15 = &v16;
  +[USXPCRemoteObjectProxy synchronousProxyFromConnection:v7 withRetryCount:1 proxyHandler:v12];

  id v9 = (void *)v23[5];
  if (a4 && !v9)
  {
    *a4 = (id) v17[5];
    id v9 = (void *)v23[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __45__USUsageMonitor_checkStatusOfBudgets_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__USUsageMonitor_checkStatusOfBudgets_error___block_invoke_2;
    v8[3] = &unk_26431DDE0;
    long long v9 = *(_OWORD *)(a1 + 40);
    [a2 checkStatusOfBudgets:v7 clientIdentifier:0 replyHandler:v8];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
}

void __45__USUsageMonitor_checkStatusOfBudgets_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v16 = a2;
  id v9 = a5;
  id v10 = a6;
  if (v16)
  {
    uint64_t v11 = [objc_alloc(NSDictionary) initWithObjects:v9 forKeys:v16];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = v10;
    id v13 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }
}

- (void)checkStatusOfAllBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(USUsageMonitor *)self xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__USUsageMonitor_checkStatusOfAllBudgetsWithCompletionHandler___block_invoke;
  v7[3] = &unk_26431DD68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[USXPCRemoteObjectProxy proxyFromConnection:v5 withRetryCount:1 proxyHandler:v7];
}

void __63__USUsageMonitor_checkStatusOfAllBudgetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __63__USUsageMonitor_checkStatusOfAllBudgetsWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_26431DDB8;
    uint64_t v3 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    [a2 checkStatusOfAllBudgetsWithReplyHandler:v5];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

uint64_t __63__USUsageMonitor_checkStatusOfAllBudgetsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)checkStatusOfBudgets:(id)a3 clientIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(USUsageMonitor *)self xpcConnection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_completionHandler___block_invoke;
  v15[3] = &unk_26431DD40;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  +[USXPCRemoteObjectProxy proxyFromConnection:v11 withRetryCount:1 proxyHandler:v15];
}

void __75__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_completionHandler___block_invoke_2;
    v7[3] = &unk_26431DDB8;
    uint64_t v5 = (void *)a1[7];
    v7[4] = a1[6];
    id v8 = v5;
    [a2 checkStatusOfBudgets:v3 clientIdentifiers:v4 replyHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(a1[7] + 16);
    v6();
  }
}

uint64_t __75__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)checkStatusOfBudgets:(id)a3 clientIdentifiers:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v10 = [(USUsageMonitor *)self xpcConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_error___block_invoke;
  v16[3] = &unk_26431DE30;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v19 = &v27;
  id v20 = &v21;
  +[USXPCRemoteObjectProxy synchronousProxyFromConnection:v10 withRetryCount:1 proxyHandler:v16];

  id v13 = (void *)v28[5];
  if (a5 && !v13)
  {
    *a5 = (id) v22[5];
    id v13 = (void *)v28[5];
  }
  id v14 = v13;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __63__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_error___block_invoke_2;
    v9[3] = &unk_26431DDE0;
    long long v10 = *(_OWORD *)(a1 + 48);
    [a2 checkStatusOfBudgets:v7 clientIdentifiers:v8 replyHandler:v9];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
}

void __63__USUsageMonitor_checkStatusOfBudgets_clientIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v16 = a2;
  id v9 = a5;
  id v10 = a6;
  if (v16)
  {
    uint64_t v11 = [objc_alloc(NSDictionary) initWithObjects:v9 forKeys:v16];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = v10;
    id v13 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end