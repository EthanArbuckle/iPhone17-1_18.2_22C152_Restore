@interface WiFiP2PDNSServiceDiscoveryManager
- (id)exportedInterface;
- (id)initUsingWiFiAware:(BOOL)a3 serviceCallback:(id)a4;
- (id)remoteObjectInterface;
- (void)handleConnectionEstablishedWithProxy:(id)a3;
- (void)handleEventType:(unint64_t)a3 keyData:(id)a4 valueData:(id)a5;
- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4;
- (void)startServiceDiscoveryWithConfiguration:(id)a3;
- (void)startServiceDiscoveryWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)stopServiceDiscoveryWithConfiguration:(id)a3;
@end

@implementation WiFiP2PDNSServiceDiscoveryManager

- (id)initUsingWiFiAware:(BOOL)a3 serviceCallback:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WiFiP2PDNSServiceDiscoveryManager;
  v7 = [(WiFiP2PDNSServiceDiscoveryManager *)&v20 init];
  v8 = v7;
  if (v7)
  {
    v7->_useWiFiAware = a3;
    uint64_t v9 = MEMORY[0x1C187F470](v6);
    id serviceCallback = v8->_serviceCallback;
    v8->_id serviceCallback = (id)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    registeredServices = v8->_registeredServices;
    v8->_registeredServices = v11;

    v13 = [WiFiP2PXPCConnection alloc];
    if (v8->_useWiFiAware) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }
    v15 = +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop];
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiP2PDNSServiceDiscoveryManager", 0, v15);
    uint64_t v17 = [(WiFiP2PXPCConnection *)v13 initWithEndpointType:v14 queue:v16 retryTimeout:+[WiFiP2PXPCConnection defaultRetryTimeout]];
    xpcConnection = v8->_xpcConnection;
    v8->_xpcConnection = (WiFiP2PXPCConnection *)v17;

    [(WiFiP2PXPCConnection *)v8->_xpcConnection setDelegate:v8];
  }

  return v8;
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1815658];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18132A8];
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  if (self->_useWiFiAware) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  [a3 createXPCResponderWithType:v5 completionHandler:a4];
}

- (void)handleConnectionEstablishedWithProxy:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_registeredServices;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "startServiceDiscoveryWithConfiguration:completionHandler:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), &__block_literal_global_6, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)handleEventType:(unint64_t)a3 keyData:(id)a4 valueData:(id)a5
{
  id v9 = a4;
  id v8 = a5;
  if (a3 <= 3) {
    (*((void (**)(void))self->_serviceCallback + 2))();
  }
}

- (void)startServiceDiscoveryWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  xpcConnection = self->_xpcConnection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__WiFiP2PDNSServiceDiscoveryManager_startServiceDiscoveryWithConfiguration_completionHandler___block_invoke;
  v15[3] = &unk_1E633F2E8;
  v15[4] = self;
  id v16 = v6;
  uint64_t v17 = v18;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__WiFiP2PDNSServiceDiscoveryManager_startServiceDiscoveryWithConfiguration_completionHandler___block_invoke_2;
  v11[3] = &unk_1E633F310;
  uint64_t v14 = v18;
  v11[4] = self;
  id v9 = v16;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v15 clientCompletionHandler:v11];

  _Block_object_dispose(v18, 8);
}

void __94__WiFiP2PDNSServiceDiscoveryManager_startServiceDiscoveryWithConfiguration_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 24);
  id v7 = a3;
  id v8 = a2;
  [v6 addObject:v5];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  [v8 startServiceDiscoveryWithConfiguration:a1[5] completionHandler:v7];
}

uint64_t __94__WiFiP2PDNSServiceDiscoveryManager_startServiceDiscoveryWithConfiguration_completionHandler___block_invoke_2(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    [*(id *)(a1[4] + 24) addObject:a1[5]];
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  uint64_t result = a1[6];
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)startServiceDiscoveryWithConfiguration:(id)a3
{
}

- (void)stopServiceDiscoveryWithConfiguration:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__WiFiP2PDNSServiceDiscoveryManager_stopServiceDiscoveryWithConfiguration___block_invoke;
  v10[3] = &unk_1E633F2E8;
  v10[4] = self;
  id v11 = v4;
  id v12 = v13;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__WiFiP2PDNSServiceDiscoveryManager_stopServiceDiscoveryWithConfiguration___block_invoke_2;
  v7[3] = &unk_1E633F338;
  id v9 = v13;
  v7[4] = self;
  id v6 = v11;
  id v8 = v6;
  [(WiFiP2PXPCConnection *)xpcConnection withRemoteObjectProxy:v10 clientCompletionHandler:v7];

  _Block_object_dispose(v13, 8);
}

void __75__WiFiP2PDNSServiceDiscoveryManager_stopServiceDiscoveryWithConfiguration___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 24);
  id v7 = a3;
  id v8 = a2;
  [v6 removeObject:v5];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  [v8 stopServiceDiscoveryWithConfiguration:a1[5] completionHandler:v7];
}

uint64_t __75__WiFiP2PDNSServiceDiscoveryManager_stopServiceDiscoveryWithConfiguration___block_invoke_2(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    [*(id *)(a1[4] + 24) removeObject:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  uint64_t result = [*(id *)(a1[4] + 24) count];
  if (!result)
  {
    v3 = *(void **)(a1[4] + 32);
    return [v3 stop];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_registeredServices, 0);

  objc_storeStrong(&self->_serviceCallback, 0);
}

@end