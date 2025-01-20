@interface RadioNetworkObserver
+ (id)sharedNetworkObserver;
- (BOOL)isCellularNetworkingAllowed;
- (BOOL)isUsingNetwork;
- (RadioNetworkObserver)init;
- (id)_init;
- (void)_cellularNetworkAllowedDidChangeNotification:(id)a3;
- (void)beginUsingNetwork;
- (void)dealloc;
- (void)endUsingNetwork;
@end

@implementation RadioNetworkObserver

- (void).cxx_destruct
{
}

- (BOOL)isUsingNetwork
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  networkUsageQueue = self->_networkUsageQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__RadioNetworkObserver_isUsingNetwork__block_invoke;
  v5[3] = &unk_2643AA670;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(networkUsageQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__RadioNetworkObserver_isUsingNetwork__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8) > 0;
  return result;
}

- (BOOL)isCellularNetworkingAllowed
{
  return CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", @"com.apple.itunesstored", 0) != 0;
}

- (void)endUsingNetwork
{
  networkUsageQueue = self->_networkUsageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__RadioNetworkObserver_endUsingNetwork__block_invoke;
  block[3] = &unk_2643AA648;
  block[4] = self;
  dispatch_async(networkUsageQueue, block);
}

void __39__RadioNetworkObserver_endUsingNetwork__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    *(void *)(v1 + 8) = v4;
    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(void *)(v5 + 8))
    {
      uint64_t v6 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__RadioNetworkObserver_endUsingNetwork__block_invoke_2;
      block[3] = &unk_2643AA648;
      block[4] = v5;
      dispatch_async(v6, block);
    }
  }
}

void __39__RadioNetworkObserver_endUsingNetwork__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"RadioNetworkObserverIsUsingNetworkDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)beginUsingNetwork
{
  networkUsageQueue = self->_networkUsageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__RadioNetworkObserver_beginUsingNetwork__block_invoke;
  block[3] = &unk_2643AA648;
  block[4] = self;
  dispatch_async(networkUsageQueue, block);
}

void __41__RadioNetworkObserver_beginUsingNetwork__block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8) == 1)
  {
    id v2 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__RadioNetworkObserver_beginUsingNetwork__block_invoke_2;
    block[3] = &unk_2643AA648;
    block[4] = v1;
    dispatch_async(v2, block);
  }
}

void __41__RadioNetworkObserver_beginUsingNetwork__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"RadioNetworkObserverIsUsingNetworkDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_cellularNetworkAllowedDidChangeNotification:(id)a3
{
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__RadioNetworkObserver__cellularNetworkAllowedDidChangeNotification___block_invoke;
  block[3] = &unk_2643AA648;
  block[4] = self;
  dispatch_async(v4, block);
}

void __69__RadioNetworkObserver__cellularNetworkAllowedDidChangeNotification___block_invoke(uint64_t a1)
{
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"RadioNetworkObserverIsCellularNetworkingAllowedDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F7B4D0];
  uint64_t v5 = [MEMORY[0x263F7B148] currentDevice];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)RadioNetworkObserver;
  [(RadioNetworkObserver *)&v6 dealloc];
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)RadioNetworkObserver;
  id v2 = [(RadioNetworkObserver *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Radio.RadioNetworkObserver", 0);
    networkUsageQueue = v2->_networkUsageQueue;
    v2->_networkUsageQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = *MEMORY[0x263F7B4D0];
    v7 = [MEMORY[0x263F7B148] currentDevice];
    [v5 addObserver:v2 selector:sel__cellularNetworkAllowedDidChangeNotification_ name:v6 object:v7];
  }
  return v2;
}

- (RadioNetworkObserver)init
{
  return 0;
}

+ (id)sharedNetworkObserver
{
  if (sharedNetworkObserver___once != -1) {
    dispatch_once(&sharedNetworkObserver___once, &__block_literal_global_1317);
  }
  id v2 = (void *)sharedNetworkObserver___sharedNetworkObserver;
  return v2;
}

uint64_t __45__RadioNetworkObserver_sharedNetworkObserver__block_invoke()
{
  sharedNetworkObserver___sharedNetworkObserver = [[RadioNetworkObserver alloc] _init];
  return MEMORY[0x270F9A758]();
}

@end