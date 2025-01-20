@interface MRNowPlayingOriginClient
- (BOOL)isOverrideApp;
- (BOOL)overrideApp;
- (MRApplicationActivity)activity;
- (MRClient)activeNowPlayingClient;
- (MRNowPlayingOriginClient)initWithOrigin:(id)a3 routingContextID:(id)a4;
- (MROrigin)origin;
- (NSArray)applicationPickedRoutes;
- (NSArray)nowPlayingClients;
- (NSString)overrideAppBundleID;
- (float)volume;
- (id)beginLyricsEventCallback;
- (id)clientMessageCallback;
- (id)commandCallback;
- (id)debugDescription;
- (id)description;
- (id)endLyricsEventCallback;
- (id)existingNowPlayingClientForPlayerPath:(id)a3;
- (id)nowPlayingClientForPlayerPath:(id)a3;
- (id)playbackQueueCallback;
- (id)playbackSessionCallback;
- (id)playbackSessionMigrateBeginCallback;
- (id)playbackSessionMigrateEndCallback;
- (id)playbackSessionMigrateRequestCallback;
- (unsigned)hardwareRemoteBehavior;
- (unsigned)inputMode;
- (unsigned)routeDiscoveryMode;
- (unsigned)volumeCapabilities;
- (void)_prepareToRestoreClientStateWithCompletion:(id)a3;
- (void)_restoreNowPlayingClientState;
- (void)dealloc;
- (void)removeAllClients;
- (void)removeClient:(id)a3;
- (void)restoreNowPlayingClientState;
- (void)setActiveNowPlayingClient:(id)a3;
- (void)setActivity:(id)a3;
- (void)setApplicationPickedRoutes:(id)a3;
- (void)setBeginLyricsEventCallback:(id)a3;
- (void)setClientMessageCallback:(id)a3;
- (void)setCommandCallback:(id)a3;
- (void)setEndLyricsEventCallback:(id)a3;
- (void)setHardwareRemoteBehavior:(unsigned int)a3;
- (void)setInputMode:(unsigned int)a3;
- (void)setIsOverrideApp:(BOOL)a3;
- (void)setOverrideApp:(BOOL)a3;
- (void)setOverrideAppBundleID:(id)a3;
- (void)setPlaybackQueueCallback:(id)a3;
- (void)setPlaybackSessionCallback:(id)a3;
- (void)setPlaybackSessionMigrateBeginCallback:(id)a3;
- (void)setPlaybackSessionMigrateEndCallback:(id)a3;
- (void)setPlaybackSessionMigrateRequestCallback:(id)a3;
- (void)setRouteDiscoveryMode:(unsigned int)a3;
- (void)setVolume:(float)a3;
- (void)setVolumeCapabilities:(unsigned int)a3;
@end

@implementation MRNowPlayingOriginClient

- (id)playbackQueueCallback
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__52;
  v8 = __Block_byref_object_dispose__53;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (id)nowPlayingClientForPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__40;
  v16 = __Block_byref_object_dispose__40;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MRNowPlayingOriginClient_nowPlayingClientForPlayerPath___block_invoke;
  block[3] = &unk_1E57D3118;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__MRNowPlayingOriginClient_nowPlayingClientForPlayerPath___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 160);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "client", (void)v14);
        id v9 = [*(id *)(a1 + 40) client];
        int v10 = [v8 isEqual:v9];

        if (v10)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v11 = [[MRNowPlayingClient alloc] initWithPlayerPath:*(void *)(a1 + 40)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    [*(id *)(*(void *)(a1 + 32) + 160) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

void __49__MRNowPlayingOriginClient_playbackQueueCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 80));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (MRNowPlayingOriginClient)initWithOrigin:(id)a3 routingContextID:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)MRNowPlayingOriginClient;
  id v9 = [(MRNowPlayingOriginClient *)&v24 init];
  if (!v9)
  {
LABEL_10:
    uint64_t v12 = v9;
    goto LABEL_11;
  }
  if (![v7 isHosted]
    || (+[MRUserSettings currentSettings],
        int v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 supportMultiplayerHost],
        v10,
        v8)
    || (v11 & 1) == 0)
  {
    objc_storeStrong((id *)&v9->_origin, a3);
    objc_storeStrong((id *)&v9->_routingContextID, a4);
    v13 = (objc_class *)objc_opt_class();
    Name = class_getName(v13);
    long long v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(Name, v15);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    nowPlayingClients = v9->_nowPlayingClients;
    v9->_nowPlayingClients = v18;

    v20 = +[MRUserSettings currentSettings];
    LODWORD(v15) = [v20 verboseOriginClientLogging];

    if (v15)
    {
      v21 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138412802;
        v26 = v9;
        __int16 v27 = 2112;
        id v28 = v7;
        __int16 v29 = 2112;
        v30 = v22;
        _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClient] Creating %@ for origin %@ at %@", buf, 0x20u);
      }
    }
    goto LABEL_10;
  }
  uint64_t v12 = 0;
LABEL_11:

  return v12;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[MRUserSettings currentSettings];
  int v4 = [v3 verboseOriginClientLogging];

  if (v4)
  {
    id v5 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      origin = self->_origin;
      id v7 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)buf = 138412802;
      int v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = origin;
      __int16 v13 = 2112;
      long long v14 = v7;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClient] Destroying %@ for origin %@ at %@", buf, 0x20u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)MRNowPlayingOriginClient;
  [(MRNowPlayingOriginClient *)&v8 dealloc];
}

- (void)setVolume:(float)a3
{
}

float __38__MRNowPlayingOriginClient_setVolume___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 52) = result;
  return result;
}

- (float)volume
{
  uint64_t v4 = 0;
  id v5 = (float *)&v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  msv_dispatch_sync_on_queue();
  float v2 = v5[6];
  _Block_object_dispose(&v4, 8);
  return v2;
}

float __34__MRNowPlayingOriginClient_volume__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 52);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setVolumeCapabilities:(unsigned int)a3
{
}

uint64_t __50__MRNowPlayingOriginClient_setVolumeCapabilities___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 56) = *(_DWORD *)(result + 40);
  return result;
}

- (unsigned)volumeCapabilities
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  msv_dispatch_sync_on_queue();
  unsigned int v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __46__MRNowPlayingOriginClient_volumeCapabilities__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 56);
  return result;
}

- (NSArray)nowPlayingClients
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__40;
  objc_super v8 = __Block_byref_object_dispose__40;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

uint64_t __45__MRNowPlayingOriginClient_nowPlayingClients__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setPlaybackQueueCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __53__MRNowPlayingOriginClient_setPlaybackQueueCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)commandCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__52;
  objc_super v8 = __Block_byref_object_dispose__53;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __43__MRNowPlayingOriginClient_commandCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 96));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setCommandCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __47__MRNowPlayingOriginClient_setCommandCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)playbackSessionCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__52;
  objc_super v8 = __Block_byref_object_dispose__53;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __51__MRNowPlayingOriginClient_playbackSessionCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 120));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setPlaybackSessionCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __55__MRNowPlayingOriginClient_setPlaybackSessionCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 120);
  *(void *)(v3 + 120) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)playbackSessionMigrateBeginCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__52;
  objc_super v8 = __Block_byref_object_dispose__53;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __63__MRNowPlayingOriginClient_playbackSessionMigrateBeginCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 128));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setPlaybackSessionMigrateBeginCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __67__MRNowPlayingOriginClient_setPlaybackSessionMigrateBeginCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 128);
  *(void *)(v3 + 128) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)playbackSessionMigrateEndCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__52;
  objc_super v8 = __Block_byref_object_dispose__53;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __61__MRNowPlayingOriginClient_playbackSessionMigrateEndCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 136));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setPlaybackSessionMigrateEndCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __65__MRNowPlayingOriginClient_setPlaybackSessionMigrateEndCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 136);
  *(void *)(v3 + 136) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)playbackSessionMigrateRequestCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__52;
  objc_super v8 = __Block_byref_object_dispose__53;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __65__MRNowPlayingOriginClient_playbackSessionMigrateRequestCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setPlaybackSessionMigrateRequestCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __69__MRNowPlayingOriginClient_setPlaybackSessionMigrateRequestCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 144);
  *(void *)(v3 + 144) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)beginLyricsEventCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__52;
  objc_super v8 = __Block_byref_object_dispose__53;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __52__MRNowPlayingOriginClient_beginLyricsEventCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 104));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setBeginLyricsEventCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __56__MRNowPlayingOriginClient_setBeginLyricsEventCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 104);
  *(void *)(v3 + 104) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)endLyricsEventCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__52;
  objc_super v8 = __Block_byref_object_dispose__53;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __50__MRNowPlayingOriginClient_endLyricsEventCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 112));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setEndLyricsEventCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __54__MRNowPlayingOriginClient_setEndLyricsEventCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 112);
  *(void *)(v3 + 112) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)clientMessageCallback
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__52;
  objc_super v8 = __Block_byref_object_dispose__53;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  uint64_t v2 = (void *)MEMORY[0x1997190F0](v5[5]);
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __49__MRNowPlayingOriginClient_clientMessageCallback__block_invoke(uint64_t a1)
{
  id v5 = (id)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 152));
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setClientMessageCallback:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __53__MRNowPlayingOriginClient_setClientMessageCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 152);
  *(void *)(v3 + 152) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSArray)applicationPickedRoutes
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__40;
  objc_super v8 = __Block_byref_object_dispose__40;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

uint64_t __51__MRNowPlayingOriginClient_applicationPickedRoutes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setApplicationPickedRoutes:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __55__MRNowPlayingOriginClient_setApplicationPickedRoutes___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setIsOverrideApp:(BOOL)a3
{
}

uint64_t __45__MRNowPlayingOriginClient_setIsOverrideApp___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)overrideApp
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __39__MRNowPlayingOriginClient_overrideApp__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (NSString)overrideAppBundleID
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  char v7 = __Block_byref_object_copy__40;
  objc_super v8 = __Block_byref_object_dispose__40;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

uint64_t __47__MRNowPlayingOriginClient_overrideAppBundleID__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setOverrideAppBundleID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __51__MRNowPlayingOriginClient_setOverrideAppBundleID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setRouteDiscoveryMode:(unsigned int)a3
{
}

uint64_t __50__MRNowPlayingOriginClient_setRouteDiscoveryMode___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 32) = *(_DWORD *)(result + 40);
  return result;
}

- (unsigned)routeDiscoveryMode
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  msv_dispatch_sync_on_queue();
  unsigned int v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __46__MRNowPlayingOriginClient_routeDiscoveryMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)setInputMode:(unsigned int)a3
{
}

uint64_t __41__MRNowPlayingOriginClient_setInputMode___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 48) = *(_DWORD *)(result + 40);
  return result;
}

- (unsigned)inputMode
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  msv_dispatch_sync_on_queue();
  unsigned int v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __37__MRNowPlayingOriginClient_inputMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 48);
  return result;
}

- (void)setActiveNowPlayingClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__MRNowPlayingOriginClient_setActiveNowPlayingClient___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __54__MRNowPlayingOriginClient_setActiveNowPlayingClient___block_invoke(uint64_t a1)
{
}

- (MRClient)activeNowPlayingClient
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__40;
  int v10 = __Block_byref_object_dispose__40;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__MRNowPlayingOriginClient_activeNowPlayingClient__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRClient *)v3;
}

uint64_t __50__MRNowPlayingOriginClient_activeNowPlayingClient__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 176) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setActivity:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MRNowPlayingOriginClient_setActivity___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __40__MRNowPlayingOriginClient_setActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (MRApplicationActivity)activity
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__40;
  int v10 = __Block_byref_object_dispose__40;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__MRNowPlayingOriginClient_activity__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRApplicationActivity *)v3;
}

uint64_t __36__MRNowPlayingOriginClient_activity__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)existingNowPlayingClientForPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__40;
  dispatch_queue_t v16 = __Block_byref_object_dispose__40;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MRNowPlayingOriginClient_existingNowPlayingClientForPlayerPath___block_invoke;
  block[3] = &unk_1E57D3118;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __66__MRNowPlayingOriginClient_existingNowPlayingClientForPlayerPath___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 160);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "client", (void)v11);
        id v9 = [*(id *)(a1 + 40) client];
        int v10 = [v8 isEqual:v9];

        if (v10)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__MRNowPlayingOriginClient_removeClient___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __41__MRNowPlayingOriginClient_removeClient___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 160);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "client", (void)v11);
        id v9 = [*(id *)(a1 + 40) client];
        int v10 = [v8 isEqual:v9];

        if (v10)
        {
          [*(id *)(*(void *)(a1 + 32) + 160) removeObject:v7];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)removeAllClients
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MRNowPlayingOriginClient_removeAllClients__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __44__MRNowPlayingOriginClient_removeAllClients__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) removeAllObjects];
}

- (void)restoreNowPlayingClientState
{
  if ([(MROrigin *)self->_origin isHosted])
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__MRNowPlayingOriginClient_restoreNowPlayingClientState__block_invoke;
    v3[3] = &unk_1E57D8B18;
    objc_copyWeak(&v4, &location);
    [(MRNowPlayingOriginClient *)self _prepareToRestoreClientStateWithCompletion:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
  else
  {
    [(MRNowPlayingOriginClient *)self _restoreNowPlayingClientState];
  }
}

void __56__MRNowPlayingOriginClient_restoreNowPlayingClientState__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _restoreNowPlayingClientState];
  }
}

- (void)_prepareToRestoreClientStateWithCompletion:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_origin;
  id v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = [v6 UUIDString];

  id v8 = [MEMORY[0x1E4F1C9C8] now];
  id v9 = (void *)[[NSString alloc] initWithFormat:@"restoreClientState<%@>", v7];
  id v10 = [NSString alloc];
  long long v11 = [(MROrigin *)self->_origin displayName];
  long long v12 = (void *)[v10 initWithFormat:@"origin=%@ routingContext=%@", v11, self->_routingContextID];

  long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"restoreClientState", v7];
  long long v14 = v13;
  if (v12) {
    [v13 appendFormat:@" for %@", v12];
  }
  uint64_t v15 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v41 = v14;
    _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke;
  v34[3] = &unk_1E57D8118;
  id v39 = v4;
  id v35 = v12;
  v36 = @"restoreClientState";
  id v16 = v7;
  id v37 = v16;
  id v38 = v8;
  id v27 = v8;
  id v17 = v12;
  id v28 = v4;
  v18 = (void *)MEMORY[0x1997190F0](v34);
  uint64_t v19 = [[MRRequestDetails alloc] initWithInitiator:@"StateRestoration" requestID:v16 reason:@"restoreClientState"];
  v20 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  routingContextID = self->_routingContextID;
  serialQueue = self->_serialQueue;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_79;
  v29[3] = &unk_1E57D8EC8;
  id v30 = v9;
  id v31 = v16;
  v32 = v5;
  id v33 = v18;
  v23 = v5;
  id v24 = v16;
  id v25 = v9;
  id v26 = v18;
  [(MRAVLightweightReconnaissanceSession *)v20 searchEndpointsForRoutingContextUID:routingContextID timeout:v19 details:serialQueue queue:v29 completion:20.0];
}

void __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  (*(void (**)(void))(a1[8] + 16))();
  uint64_t v4 = a1[4];
  uint64_t v5 = _MRLogForCategory(0xAuLL);
  id v6 = v5;
  if (!v3)
  {
    BOOL v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13) {
        goto LABEL_15;
      }
      uint64_t v15 = a1[5];
      uint64_t v14 = a1[6];
      id v16 = (void *)a1[4];
      id v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:a1[7]];
      int v25 = 138544130;
      uint64_t v26 = v15;
      __int16 v27 = 2114;
      uint64_t v28 = v14;
      __int16 v29 = 2114;
      id v30 = v16;
      __int16 v31 = 2048;
      uint64_t v32 = v18;
      uint64_t v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v20 = v6;
      uint32_t v21 = 42;
    }
    else
    {
      if (!v13) {
        goto LABEL_15;
      }
      uint64_t v22 = a1[5];
      uint64_t v23 = a1[6];
      id v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:a1[7]];
      int v25 = 138543874;
      uint64_t v26 = v22;
      __int16 v27 = 2114;
      uint64_t v28 = v23;
      __int16 v29 = 2048;
      id v30 = v24;
      uint64_t v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v20 = v6;
      uint32_t v21 = 32;
    }
    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v25, v21);

    goto LABEL_15;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v7)
    {
      uint64_t v9 = a1[5];
      uint64_t v8 = a1[6];
      uint64_t v10 = a1[4];
      long long v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:a1[7]];
      int v25 = 138544386;
      uint64_t v26 = v9;
      __int16 v27 = 2114;
      uint64_t v28 = v8;
      __int16 v29 = 2114;
      id v30 = v3;
      __int16 v31 = 2114;
      uint64_t v32 = v10;
      __int16 v33 = 2048;
      uint64_t v34 = v12;
      _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v25, 0x34u);
    }
  }
  else if (v7)
  {
    __MRMediaRemoteRequestNowPlayingPlaybackQueueCapabilitiesForPlayer_block_invoke_2_cold_1((uint64_t)a1);
  }

  id v6 = _MRLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_cold_1((uint64_t)a1, (uint64_t)v3, v6);
  }
LABEL_15:
}

void __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_79(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"MREndpointConnectionReasonUserInfoKey"];
    [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"MREndpointConnectionCorrelationIDUserInfoKey"];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_2;
    v5[3] = &unk_1E57D11C0;
    id v8 = *(id *)(a1 + 56);
    id v6 = v3;
    id v7 = *(id *)(a1 + 48);
    [v6 connectToExternalDeviceWithUserInfo:v4 completion:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) origin];
    id v8 = v4;
    if (v4)
    {
      if (([v4 isEqual:*(void *)(a1 + 40)] & 1) == 0)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        id v7 = [NSString stringWithUTF8String:"-[MRNowPlayingOriginClient _prepareToRestoreClientStateWithCompletion:]_block_invoke_2"];
        [v6 handleFailureInFunction:v7, @"MRNowPlayingOriginClient.m", 302, @"Invalid parameter not satisfying: %@", @"[endpointOrigin isEqual:origin]" file lineNumber description];
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:117];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)_restoreNowPlayingClientState
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MRNowPlayingOriginClient__restoreNowPlayingClientState__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __57__MRNowPlayingOriginClient__restoreNowPlayingClientState__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[MRPlayerPath alloc] initWithOrigin:*(void *)(*(void *)(a1 + 32) + 184) client:0 player:0];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 16))
  {
    id v4 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetNowPlayingAppOverride(v4, 1);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (*(void *)(v3 + 24))
  {
    uint64_t v5 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetOverriddenNowPlayingApplication(v5, *(void **)(*(void *)(a1 + 32) + 24));
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (*(_DWORD *)(v3 + 32))
  {
    id v6 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetRouteDiscoveryMode(v6, *(_DWORD *)(*(void *)(a1 + 32) + 32));
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (*(_DWORD *)(v3 + 48))
  {
    id v7 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetGameControllerRemoteInputMode(v7, *(_DWORD *)(*(void *)(a1 + 32) + 48), 0, 0);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (*(_DWORD *)(v3 + 56))
  {
    id v8 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetPickedRouteVolumeControlCapabilities(v8, v2, *(_DWORD *)(*(void *)(a1 + 32) + 56), 0, 0);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = *(id *)(v3 + 160);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13++), "restoreNowPlayingClientState", (void)v18);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  if (*(void *)(v14 + 176))
  {
    uint64_t v15 = [[MRPlayerPath alloc] initWithOrigin:*(void *)(*(void *)(a1 + 32) + 184) client:*(void *)(*(void *)(a1 + 32) + 176) player:0];
    id v16 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetNowPlayingClient(v16, v15, 0, 0);

    uint64_t v14 = *(void *)(a1 + 32);
  }
  if (*(void *)(v14 + 64))
  {
    id v17 = (void *)MRGetSharedService();
    MRMediaRemoteServiceBeginActivity(v17, *(void *)(*(void *)(a1 + 32) + 64), 0, 0);
  }
}

- (id)description
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__40;
  id v8 = __Block_byref_object_dispose__40;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __39__MRNowPlayingOriginClient_description__block_invoke(uint64_t a1)
{
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)MRNowPlayingOriginClient;
  id v2 = objc_msgSendSuper2(&v6, sel_description);
  uint64_t v3 = [v2 stringByAppendingFormat:@"Origin: %@ Clients: %@", *(void *)(*(void *)(a1 + 32) + 184), *(void *)(*(void *)(a1 + 32) + 160)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)debugDescription
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__40;
  id v8 = __Block_byref_object_dispose__40;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __44__MRNowPlayingOriginClient_debugDescription__block_invoke(uint64_t a1)
{
  long long v20 = NSString;
  long long v21 = *(void ***)(a1 + 32);
  int v25 = MRCreateIndentedDebugDescriptionFromObject(v21[23]);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v19 = *(void *)(v2 + 72);
  uint64_t v3 = @"YES";
  if (!*(unsigned char *)(v2 + 16)) {
    uint64_t v3 = @"NO";
  }
  long long v18 = v3;
  id v24 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(v2 + 32));
  uint64_t v23 = MRCreateIndentedDebugDescriptionFromArray(*(void **)(*(void *)(a1 + 32) + 40));
  Description = MRGameControllerInputModeCreateDescription(*(_DWORD *)(*(void *)(a1 + 32) + 48));
  uint64_t v4 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(*(_DWORD *)(*(void *)(a1 + 32) + 56));
  uint64_t v5 = (void *)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 80));
  uint64_t v6 = (void *)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 88));
  id v7 = (void *)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 96));
  id v8 = (void *)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 104));
  id v9 = (void *)MEMORY[0x1997190F0](*(void *)(*(void *)(a1 + 32) + 112));
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MRCreateIndentedDebugDescriptionFromObject(*(void **)(v10 + 176));
  uint64_t v13 = MRCreateIndentedDebugDescriptionFromArray(*(void **)(*(void *)(a1 + 32) + 160));
  uint64_t v14 = [v20 stringWithFormat:@"    origin = %@\n    routingContextID = %@\n    isOverrideApp = %@\n    routeDiscoveryMode = %@\n    applicationPickedRoutes = %@\n    inputMode = %@\n    volumeCapabilities = %@\n    playbackQueueCallback = %@\n    capabilitiesCallback = %@\n    commandCallback = %@\n    beginLyricsEventCallback = %@\n    endLyricsEventCallback = %@\n    activity = %@\n    activeNowPlayingClient = %@\n    nowPlayingClients = %@\n", v25, v19, v18, v24, v23, Description, v4, v5, v6, v7, v8, v9, v11, v12, v13];
  uint64_t v15 = MRCreateFormattedDebugDescriptionFromClass(v21, v14);
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

- (MROrigin)origin
{
  return self->_origin;
}

- (BOOL)isOverrideApp
{
  return self->_overrideApp;
}

- (void)setOverrideApp:(BOOL)a3
{
  self->_overrideApp = a3;
}

- (unsigned)hardwareRemoteBehavior
{
  return self->_hardwareRemoteBehavior;
}

- (void)setHardwareRemoteBehavior:(unsigned int)a3
{
  self->_hardwareRemoteBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_activeNowPlayingClient, 0);
  objc_storeStrong((id *)&self->_nowPlayingClients, 0);
  objc_storeStrong(&self->_clientMessageCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateRequestCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateEndCallback, 0);
  objc_storeStrong(&self->_playbackSessionMigrateBeginCallback, 0);
  objc_storeStrong(&self->_playbackSessionCallback, 0);
  objc_storeStrong(&self->_endLyricsEventCallback, 0);
  objc_storeStrong(&self->_beginLyricsEventCallback, 0);
  objc_storeStrong(&self->_commandCallback, 0);
  objc_storeStrong(&self->_capabilitiesCallback, 0);
  objc_storeStrong(&self->_playbackQueueCallback, 0);
  objc_storeStrong((id *)&self->_routingContextID, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_applicationPickedRoutes, 0);
  objc_storeStrong((id *)&self->_overrideAppBundleID, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __71__MRNowPlayingOriginClient__prepareToRestoreClientStateWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_194F3C000, log, OS_LOG_TYPE_FAULT, "Error trying to restoreClientState<%@> %@", (uint8_t *)&v4, 0x16u);
}

@end