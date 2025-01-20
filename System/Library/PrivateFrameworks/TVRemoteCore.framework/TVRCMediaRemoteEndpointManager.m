@interface TVRCMediaRemoteEndpointManager
+ (id)sharedInstance;
- (OS_dispatch_queue)mediaRemoteQueue;
- (TVRCMediaRemoteEndpointManager)init;
- (void)fetchActiveEndpointWithCompletion:(id)a3;
- (void)setMediaRemoteQueue:(id)a3;
- (void)updateActiveEndpoint:(id)a3 withCompletion:(id)a4;
@end

@implementation TVRCMediaRemoteEndpointManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return v2;
}

uint64_t __48__TVRCMediaRemoteEndpointManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_alloc_init(TVRCMediaRemoteEndpointManager);

  return MEMORY[0x270F9A758]();
}

- (TVRCMediaRemoteEndpointManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVRCMediaRemoteEndpointManager;
  v2 = [(TVRCMediaRemoteEndpointManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TVRemoteCore.mediaremote", 0);
    mediaRemoteQueue = v2->_mediaRemoteQueue;
    v2->_mediaRemoteQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)updateActiveEndpoint:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TVRCMediaRemoteEndpointManager *)self mediaRemoteQueue];
  v11 = v7;
  id v9 = v6;
  id v10 = v7;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();
}

void __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke(id *a1, int a2)
{
  v20[1] = *MEMORY[0x263EF8340];
  if (a2 == 1)
  {
    if (!a1[7]) {
      return;
    }
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = @"Skipping MediaRemote endpoint update because MRPlaybackState is MRPlaybackStatePlaying";
    dispatch_queue_t v3 = NSDictionary;
    v4 = (__CFString **)v20;
    v5 = &v19;
    goto LABEL_12;
  }
  id v6 = _TVRCMediaRemoteLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v18 = v7;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Requesting MediaRemote to update active endpoint to %@", buf, 0xCu);
  }

  if ([a1[4] length])
  {
    v8 = [a1[6] mediaRemoteQueue];
    id v12 = a1[4];
    id v13 = a1[5];
    id v14 = a1[7];
    MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReason();

    id v9 = v12;
LABEL_13:

    return;
  }
  id v10 = _TVRCMediaRemoteLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke_cold_1(v10);
  }

  if (a1[7])
  {
    uint64_t v15 = *MEMORY[0x263F08320];
    v16 = @"Requested MediaRemote to update endpoint with an invalid UID";
    dispatch_queue_t v3 = NSDictionary;
    v4 = &v16;
    v5 = &v15;
LABEL_12:
    v11 = [v3 dictionaryWithObjects:v4 forKeys:v5 count:1];
    id v9 = TVRCMakeError(200, (uint64_t)v11);

    (*((void (**)(void))a1[7] + 2))();
    goto LABEL_13;
  }
}

void __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke_7(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = _TVRCMediaRemoteLog();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke_7_cold_1((uint64_t)a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReason completion with reason=MRMediaRemoteActiveEndpointOperationActivate, endpointUID=%@, reason=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = a1[6];
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)fetchActiveEndpointWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _TVRCMediaRemoteLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Fetching active endpoint from MediaRemote", buf, 2u);
  }

  uint64_t v6 = [(TVRCMediaRemoteEndpointManager *)self mediaRemoteQueue];
  uint64_t v8 = v4;
  id v7 = v4;
  MRAVEndpointGetActiveSystemEndpointUID();
}

void __68__TVRCMediaRemoteEndpointManager_fetchActiveEndpointWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _TVRCMediaRemoteLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "MRAVEndpointGetActiveSystemEndpointUID returned %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (OS_dispatch_queue)mediaRemoteQueue
{
  return self->_mediaRemoteQueue;
}

- (void)setMediaRemoteQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

void __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  v2 = @"Requested MediaRemote to update endpoint with an invalid UID";
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

void __70__TVRCMediaRemoteEndpointManager_updateActiveEndpoint_withCompletion___block_invoke_7_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "MRAVEndpointUpdateActiveSystemEndpointForOutputDeviceUIDWithReason completion with reason=MRMediaRemoteActiveEndpointOperationActivate, endpointUID=%@, reason=%{public}@, error=%{public}@", (uint8_t *)&v5, 0x20u);
}

@end