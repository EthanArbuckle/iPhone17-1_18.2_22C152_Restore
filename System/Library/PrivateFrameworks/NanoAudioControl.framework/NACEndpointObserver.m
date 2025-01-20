@interface NACEndpointObserver
+ (NACEndpointObserver)sharedObserver;
- (NACEndpointObserver)init;
- (void)fetchRouteForOriginIdentifier:(id)a3 completion:(id)a4;
- (void)invalidateDiscoverySession;
@end

@implementation NACEndpointObserver

+ (NACEndpointObserver)sharedObserver
{
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedObserver_sharedInstance;

  return (NACEndpointObserver *)v2;
}

uint64_t __37__NACEndpointObserver_sharedObserver__block_invoke()
{
  sharedObserver_sharedInstance = objc_alloc_init(NACEndpointObserver);

  return MEMORY[0x270F9A758]();
}

- (NACEndpointObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)NACEndpointObserver;
  v2 = [(NACEndpointObserver *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoAudioControl.EndpointObserver", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_invalidateDiscoverySession name:*MEMORY[0x263F12378] object:0];
  }
  return v2;
}

- (void)invalidateDiscoverySession
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NACEndpointObserver_invalidateDiscoverySession__block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __49__NACEndpointObserver_invalidateDiscoverySession__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = NMLogForCategory(4);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
      int v6 = 138412290;
      uint64_t v7 = v3;
      _os_log_impl(&dword_237CD4000, v2, OS_LOG_TYPE_DEFAULT, "[NACEndpointObserver] Invalidating session %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;
  }
}

- (void)fetchRouteForOriginIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__NACEndpointObserver_fetchRouteForOriginIdentifier_completion___block_invoke;
  block[3] = &unk_264CFC3D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

uint64_t __64__NACEndpointObserver_fetchRouteForOriginIdentifier_completion___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1[4] + 16);
  if (!v2)
  {
    uint64_t v3 = objc_alloc_init(_NACAVRoutingDiscoverySession);
    uint64_t v4 = a1[4];
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v6 = NMLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1[4] + 16);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_237CD4000, v6, OS_LOG_TYPE_DEFAULT, "[NACEndpointObserver] Starting a new discovery session %@", (uint8_t *)&v9, 0xCu);
    }

    v2 = *(void **)(a1[4] + 16);
  }
  return [v2 fetchRouteForOriginIdentifier:a1[5] completion:a1[6]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nacDiscoverySession, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end