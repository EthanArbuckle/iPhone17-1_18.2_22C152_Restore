@interface WRMClientInterface
- (WRMClientInterface)init;
- (void)registerClient:(int)a3 queue:(id)a4 notificationHandler:(id)a5;
- (void)unregisterClient;
- (void)unregisterClientWithNotificationBlockRelease;
@end

@implementation WRMClientInterface

void __63__WRMClientInterface_registerClient_queue_notificationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_7;
  }
  uint64_t v4 = MEMORY[0x2166AF130](v7);
  if (v4 == MEMORY[0x263EF8708])
  {
    v6 = *(void (**)(void))(WeakRetained[4] + 16);
LABEL_6:
    v6();
    goto LABEL_7;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    v5 = (void *)MEMORY[0x2166AF060](v7);
    free(v5);
    goto LABEL_7;
  }
  NSLog(&cfstr_Wrmclientinter.isa);
  if (v7 == (id)MEMORY[0x263EF86A0])
  {
    NSLog(&cfstr_Wrmclientinter_0.isa);
    v6 = *(void (**)(void))(WeakRetained[4] + 16);
    goto LABEL_6;
  }
  if (v7 == (id)MEMORY[0x263EF86A8]) {
    NSLog(&cfstr_Wrmclientinter_1.isa);
  }
LABEL_7:
}

void __63__WRMClientInterface_registerClient_queue_notificationHandler___block_invoke(uint64_t a1)
{
  keys[1] = *(char **)MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = MEMORY[0x2166AEE70](*(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;

    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", *(dispatch_queue_t *)(*(void *)(a1 + 32) + 24), 0);
    v6 = *(void **)(*(void *)(a1 + 32) + 8);
    *(void *)(*(void *)(a1 + 32) + 8) = mach_service;

    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 8);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__WRMClientInterface_registerClient_queue_notificationHandler___block_invoke_2;
    v14[3] = &unk_26422A630;
    objc_copyWeak(&v15, &location);
    xpc_connection_set_event_handler(v7, v14);
    xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8));
    keys[0] = "kWCMRegisterProcess_ProcessId";
    xpc_object_t v8 = xpc_uint64_create(*(unsigned int *)(a1 + 48));
    xpc_object_t values = v8;
    xpc_object_t v9 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    *(_OWORD *)v18 = xmmword_26422A650;
    xpc_object_t v10 = xpc_uint64_create(1uLL);
    v17[0] = v10;
    id v11 = v9;
    v17[1] = v11;
    xpc_object_t v12 = xpc_dictionary_create((const char *const *)v18, v17, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8), v12);

    for (uint64_t i = 1; i != -1; --i)
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (WRMClientInterface)init
{
  v9.receiver = self;
  v9.super_class = (Class)WRMClientInterface;
  uint64_t v2 = [(WRMClientInterface *)&v9 init];
  uint64_t v3 = v2;
  if (v2)
  {
    mConnection = v2->mConnection;
    v2->mConnection = 0;

    mQueue = v3->mQueue;
    v3->mQueue = 0;

    v3->mProcessId = 0;
    id mNotificationBlock = v3->mNotificationBlock;
    v3->id mNotificationBlock = 0;

    id v7 = v3;
  }

  return v3;
}

- (void)registerClient:(int)a3 queue:(id)a4 notificationHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    xpc_object_t v10 = (OS_dispatch_queue *)v8;
    mQueue = self->mQueue;
    self->mQueue = v10;
  }
  else
  {
    xpc_object_t v12 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
    id v13 = MEMORY[0x263EF83A0];
    mQueue = self->mQueue;
    self->mQueue = v12;
  }

  self->mProcessId = a3;
  v14 = self->mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__WRMClientInterface_registerClient_queue_notificationHandler___block_invoke;
  block[3] = &unk_26422A3A0;
  block[4] = self;
  id v17 = v9;
  int v18 = a3;
  id v15 = v9;
  dispatch_async(v14, block);
}

- (void)unregisterClient
{
  mQueue = self->mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WRMClientInterface_unregisterClient__block_invoke;
  block[3] = &unk_26422A2D8;
  block[4] = self;
  dispatch_async(mQueue, block);
}

void __38__WRMClientInterface_unregisterClient__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  if (v2)
  {
    *(void *)(v1 + 8) = 0;

    uint64_t v1 = *(void *)(a1 + 32);
  }
  uint64_t v4 = *(void **)(v1 + 32);
  if (v4)
  {
    *(void *)(v1 + 32) = 0;
  }
}

- (void)unregisterClientWithNotificationBlockRelease
{
  mQueue = self->mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__WRMClientInterface_unregisterClientWithNotificationBlockRelease__block_invoke;
  block[3] = &unk_26422A2D8;
  block[4] = self;
  dispatch_async(mQueue, block);
}

void __66__WRMClientInterface_unregisterClientWithNotificationBlockRelease__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  if (v2)
  {
    *(void *)(v1 + 8) = 0;

    uint64_t v1 = *(void *)(a1 + 32);
  }
  uint64_t v4 = *(void **)(v1 + 32);
  if (v4)
  {
    *(void *)(v1 + 32) = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mNotificationBlock, 0);
  objc_storeStrong((id *)&self->mQueue, 0);
  objc_storeStrong((id *)&self->mConnection, 0);
}

@end