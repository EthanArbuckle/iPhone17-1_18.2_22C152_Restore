@interface NACXPCServer
+ (id)server;
- (BOOL)_cachedProminentHapticState;
- (BOOL)_cachedSystemMutedState;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NACXPCServer)init;
- (float)_cachedHapticIntensity;
- (id)_audioRoutesRecordForCategory:(id)a3;
- (id)_cachedVolumeRecords;
- (id)_listeningModesRecordForTarget:(id)a3;
- (id)_routeObservationCategoriesForConnection:(id)a3;
- (id)_volumeRecordForTarget:(id)a3;
- (int64_t)_aggregatedCountOfObserversForTarget:(id)a3 inRecords:(id)a4;
- (int64_t)_cachedHapticState;
- (void)EULimitForTarget:(id)a3 result:(id)a4;
- (void)_beginObservingListeningModesForTarget:(id)a3 connection:(id)a4;
- (void)_beginObservingVolumeForTarget:(id)a3 connection:(id)a4;
- (void)_cachedVolumeRecords;
- (void)_cancelDeferredAudioRoutesUpdate;
- (void)_cleanupConnection:(id)a3;
- (void)_endObservingAudioRoutesForCategory:(id)a3 connection:(id)a4;
- (void)_endObservingListeningModesForTarget:(id)a3 connection:(id)a4;
- (void)_endObservingVolumeForTarget:(id)a3 connection:(id)a4;
- (void)_persistHapticIntensity;
- (void)_persistHapticState;
- (void)_persistProminentHapticState;
- (void)_persistSystemMutedState;
- (void)_persistVolumeRecords;
- (void)_scheduleDeferredAudioRoutesUpdate:(id)a3 category:(id)a4;
- (void)_updateAudioRoutes:(id)a3 category:(id)a4;
- (void)audioRoutesForCategory:(id)a3 result:(id)a4;
- (void)availableListeningModesForTarget:(id)a3 result:(id)a4;
- (void)beginObservingAudioRoutesForCategory:(id)a3;
- (void)beginObservingListeningModesForTarget:(id)a3;
- (void)beginObservingVolumeForTarget:(id)a3;
- (void)client:(id)a3 EULimit:(float)a4 didChangeForTarget:(id)a5;
- (void)client:(id)a3 audioRoutes:(id)a4 didChangeForCategory:(id)a5;
- (void)client:(id)a3 availableListeningModes:(id)a4 didChangeForTarget:(id)a5;
- (void)client:(id)a3 currentListeningMode:(id)a4 didChangeForTarget:(id)a5;
- (void)client:(id)a3 didFailToSetCurrentListeningModeForTarget:(id)a4 error:(id)a5;
- (void)client:(id)a3 hapticIntensityDidChange:(float)a4;
- (void)client:(id)a3 hapticStateDidChange:(int64_t)a4;
- (void)client:(id)a3 mutedState:(BOOL)a4 didChangeForTarget:(id)a5;
- (void)client:(id)a3 prominentHapticStateDidChange:(BOOL)a4;
- (void)client:(id)a3 routeObservationCancelledForCategory:(id)a4;
- (void)client:(id)a3 systemMutedStateDidChange:(BOOL)a4;
- (void)client:(id)a3 volumeControlAvailable:(BOOL)a4 didChangeForTarget:(id)a5;
- (void)client:(id)a3 volumeObservationCancelledForTarget:(id)a4;
- (void)client:(id)a3 volumeValue:(float)a4 didChangeForTarget:(id)a5;
- (void)client:(id)a3 volumeWarningEnabled:(BOOL)a4 volumeWarningState:(int64_t)a5 didChangeForTarget:(id)a6;
- (void)currentListeningModeForTarget:(id)a3 result:(id)a4;
- (void)endObservingAudioRoutesForCategory:(id)a3;
- (void)endObservingListeningModesForTarget:(id)a3;
- (void)endObservingVolumeForTarget:(id)a3;
- (void)hapticIntensity:(id)a3;
- (void)hapticState:(id)a3;
- (void)mutedStateForTarget:(id)a3 result:(id)a4;
- (void)pickAudioRouteWithIdentifier:(id)a3 category:(id)a4;
- (void)playAudioAndHapticPreview;
- (void)playDefaultHapticPreview;
- (void)playProminentHapticPreview;
- (void)playToneWithConfiguration:(id)a3;
- (void)prominentHapticEnabled:(id)a3;
- (void)setCurrentListeningMode:(id)a3 forTarget:(id)a4;
- (void)setHapticIntensity:(float)a3;
- (void)setHapticState:(int64_t)a3;
- (void)setMuted:(BOOL)a3 forTarget:(id)a4;
- (void)setProminentHapticEnabled:(BOOL)a3;
- (void)setSystemMuted:(BOOL)a3;
- (void)setVolumeValue:(float)a3 forTarget:(id)a4;
- (void)stopToneWithOptions:(id)a3;
- (void)systemMutedState:(id)a3;
- (void)volumeControlAvailabilityForTarget:(id)a3 result:(id)a4;
- (void)volumeValueForTarget:(id)a3 result:(id)a4;
- (void)volumeWarningForTarget:(id)a3 result:(id)a4;
@end

@implementation NACXPCServer

+ (id)server
{
  if (server_onceToken != -1) {
    dispatch_once(&server_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)server_server;

  return v2;
}

uint64_t __22__NACXPCServer_server__block_invoke()
{
  server_server = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (NACXPCServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)NACXPCServer;
  v2 = [(NACXPCServer *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoAudioControl.Preview", v3);
    audioAndHapticPreviewQueue = v2->_audioAndHapticPreviewQueue;
    v2->_audioAndHapticPreviewQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.nanoaudiocontrol.NACXPCServer", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;

    v8 = v2->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __20__NACXPCServer_init__block_invoke;
    block[3] = &unk_264CFC388;
    v11 = v2;
    dispatch_sync(v8, block);
  }
  return v2;
}

uint64_t __20__NACXPCServer_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.NanoAudioControl"];
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  id v5 = (id)[*(id *)(*(void *)(a1 + 32) + 24) synchronize];
  uint64_t v6 = [*(id *)(a1 + 32) _cachedVolumeRecords];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v6;

  [*(id *)(a1 + 32) _cachedHapticIntensity];
  *(_DWORD *)(*(void *)(a1 + 32) + 72) = v9;
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = [*(id *)(a1 + 32) _cachedSystemMutedState];
  *(unsigned char *)(*(void *)(a1 + 32) + 76) = [*(id *)(a1 + 32) _cachedProminentHapticState];
  *(void *)(*(void *)(a1 + 32) + 80) = [*(id *)(a1 + 32) _cachedHapticState];
  uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v11 = *(void *)(a1 + 32);
  objc_super v12 = *(void **)(v11 + 48);
  *(void *)(v11 + 48) = v10;

  uint64_t v13 = objc_opt_new();
  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 64);
  *(void *)(v14 + 64) = v13;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setDelegate:");
  uint64_t v16 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.NanoAudioControl"];
  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(void **)(v17 + 56);
  *(void *)(v17 + 56) = v16;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setDelegate:");
  v19 = *(void **)(*(void *)(a1 + 32) + 56);

  return [v19 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EAE5A88];
  [v11 setClasses:v10 forSelector:sel_audioRoutesForCategory_result_ argumentIndex:0 ofReply:1];
  [v7 setExportedInterface:v11];
  [v7 setExportedObject:self];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __51__NACXPCServer_listener_shouldAcceptNewConnection___block_invoke;
  v18[3] = &unk_264CFC848;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  [v7 setInvalidationHandler:v18];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__NACXPCServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v15[3] = &unk_264CFC848;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  [v7 setInterruptionHandler:v15];
  [v7 resume];
  objc_super v12 = NMLogForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237CD4000, v12, OS_LOG_TYPE_DEFAULT, "[NACXPC] Accepted new XPC connection", buf, 2u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __51__NACXPCServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = NMLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237CD4000, v2, OS_LOG_TYPE_DEFAULT, "[NACXPC] XPC connection invalidated", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = v4;
  if (WeakRetained && v4)
  {
    id v6 = WeakRetained[1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__NACXPCServer_listener_shouldAcceptNewConnection___block_invoke_214;
    v7[3] = &unk_264CFC3B0;
    v7[4] = WeakRetained;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

uint64_t __51__NACXPCServer_listener_shouldAcceptNewConnection___block_invoke_214(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupConnection:*(void *)(a1 + 40)];
}

void __51__NACXPCServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = NMLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237CD4000, v2, OS_LOG_TYPE_DEFAULT, "[NACXPC] XPC connection interrupted", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = v4;
  if (WeakRetained && v4)
  {
    id v6 = WeakRetained[1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__NACXPCServer_listener_shouldAcceptNewConnection___block_invoke_215;
    v7[3] = &unk_264CFC3B0;
    v7[4] = WeakRetained;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

uint64_t __51__NACXPCServer_listener_shouldAcceptNewConnection___block_invoke_215(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupConnection:*(void *)(a1 + 40)];
}

- (void)beginObservingVolumeForTarget:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACXPC] Received request to begin observing volume for %@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x263F08D68] currentConnection];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NACXPCServer_beginObservingVolumeForTarget___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(internalQueue, block);
}

uint64_t __46__NACXPCServer_beginObservingVolumeForTarget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginObservingVolumeForTarget:*(void *)(a1 + 40) connection:*(void *)(a1 + 48)];
}

- (void)_beginObservingVolumeForTarget:(id)a3 connection:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NACXPCServer *)self _volumeRecordForTarget:v6];
  id v9 = [v8 observers];
  if (([v9 containsObject:v7] & 1) == 0)
  {
    [v9 addObject:v7];
    if ([(NACXPCServer *)self _aggregatedCountOfObserversForTarget:v6 inRecords:self->_volumeRecords] == 1)
    {
      uint64_t v10 = NMLogForCategory(4);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_237CD4000, v10, OS_LOG_TYPE_DEFAULT, "[NACXPC] Sending IDS beginObservingVolume request for %@ because first observer is added", (uint8_t *)&v11, 0xCu);
      }

      [(NACIDSClient *)self->_idsClient beginObservingVolumeForTarget:v6];
    }
  }
}

- (int64_t)_aggregatedCountOfObserversForTarget:(id)a3 inRecords:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if ([v5 isPairedDevice])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__NACXPCServer__aggregatedCountOfObserversForTarget_inRecords___block_invoke;
    v12[3] = &unk_264CFC870;
    v12[4] = &v13;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
  }
  else
  {
    id v7 = [v6 objectForKeyedSubscript:v5];
    id v8 = [v7 observers];
    uint64_t v9 = [v8 count];
    v14[3] = v9;
  }
  int64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __63__NACXPCServer__aggregatedCountOfObserversForTarget_inRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if ([a2 isPairedDevice])
  {
    id v5 = [v6 observers];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v5 count];
  }
}

- (void)endObservingVolumeForTarget:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACXPC] Received request to end observing volume for %@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x263F08D68] currentConnection];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__NACXPCServer_endObservingVolumeForTarget___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(internalQueue, block);
}

uint64_t __44__NACXPCServer_endObservingVolumeForTarget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endObservingVolumeForTarget:*(void *)(a1 + 40) connection:*(void *)(a1 + 48)];
}

- (void)_endObservingVolumeForTarget:(id)a3 connection:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NACXPCServer *)self _volumeRecordForTarget:v6];
  id v9 = [v8 observers];
  if ([v9 containsObject:v7])
  {
    [v9 removeObject:v7];
    if (![(NACXPCServer *)self _aggregatedCountOfObserversForTarget:v6 inRecords:self->_volumeRecords])
    {
      int64_t v10 = NMLogForCategory(4);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_237CD4000, v10, OS_LOG_TYPE_DEFAULT, "[NACXPC] Sending IDS endObservingVolume request for %@ because last observer is removed", (uint8_t *)&v11, 0xCu);
      }

      [(NACIDSClient *)self->_idsClient endObservingVolumeForTarget:v6];
    }
  }
}

- (void)volumeValueForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__NACXPCServer_volumeValueForTarget_result___block_invoke;
  block[3] = &unk_264CFC898;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __44__NACXPCServer_volumeValueForTarget_result___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    id v3 = [*(id *)(a1 + 32) _volumeRecordForTarget:*(void *)(a1 + 40)];
    uint64_t v2 = *(void *)(a1 + 48);
    [v3 volumeValue];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

- (void)volumeControlAvailabilityForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NACXPCServer_volumeControlAvailabilityForTarget_result___block_invoke;
  block[3] = &unk_264CFC898;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __58__NACXPCServer_volumeControlAvailabilityForTarget_result___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) _volumeRecordForTarget:*(void *)(a1 + 40)];
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v2 isVolumeControlAvailable]);
  }
}

- (void)mutedStateForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__NACXPCServer_mutedStateForTarget_result___block_invoke;
  block[3] = &unk_264CFC898;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __43__NACXPCServer_mutedStateForTarget_result___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) _volumeRecordForTarget:*(void *)(a1 + 40)];
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v2 isMuted]);
  }
}

- (void)EULimitForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__NACXPCServer_EULimitForTarget_result___block_invoke;
  block[3] = &unk_264CFC898;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __40__NACXPCServer_EULimitForTarget_result___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    id v3 = [*(id *)(a1 + 32) _volumeRecordForTarget:*(void *)(a1 + 40)];
    uint64_t v2 = *(void *)(a1 + 48);
    [v3 EUVolumeLimit];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

- (void)volumeWarningForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NACXPCServer_volumeWarningForTarget_result___block_invoke;
  block[3] = &unk_264CFC898;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, block);
}

void __46__NACXPCServer_volumeWarningForTarget_result___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    id v2 = [*(id *)(a1 + 32) _volumeRecordForTarget:*(void *)(a1 + 40)];
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v2 isVolumeWarningEnabled], objc_msgSend(v2, "volumeWarningState"));
  }
}

- (void)setVolumeValue:(float)a3 forTarget:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__NACXPCServer_setVolumeValue_forTarget___block_invoke;
  block[3] = &unk_264CFC428;
  float v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __41__NACXPCServer_setVolumeValue_forTarget___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  return [*(id *)(*(void *)(a1 + 32) + 64) setVolumeValue:*(void *)(a1 + 40) forTarget:a2];
}

- (void)setMuted:(BOOL)a3 forTarget:(id)a4
{
  id v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__NACXPCServer_setMuted_forTarget___block_invoke;
  block[3] = &unk_264CFC450;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __35__NACXPCServer_setMuted_forTarget___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setMuted:*(unsigned __int8 *)(a1 + 48) forTarget:*(void *)(a1 + 40)];
}

- (void)setSystemMuted:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__NACXPCServer_setSystemMuted___block_invoke;
  v4[3] = &unk_264CFC4A0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __31__NACXPCServer_setSystemMuted___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setSystemMuted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)beginObservingListeningModesForTarget:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACXPC] Received request to begin observing listening modes for %@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x263F08D68] currentConnection];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NACXPCServer_beginObservingListeningModesForTarget___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(internalQueue, block);
}

uint64_t __54__NACXPCServer_beginObservingListeningModesForTarget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginObservingListeningModesForTarget:*(void *)(a1 + 40) connection:*(void *)(a1 + 48)];
}

- (void)endObservingListeningModesForTarget:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = NMLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACXPC] Received request to end observing listening modes for %@", buf, 0xCu);
  }

  id v6 = [MEMORY[0x263F08D68] currentConnection];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__NACXPCServer_endObservingListeningModesForTarget___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(internalQueue, block);
}

uint64_t __52__NACXPCServer_endObservingListeningModesForTarget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endObservingListeningModesForTarget:*(void *)(a1 + 40) connection:*(void *)(a1 + 48)];
}

- (void)_beginObservingListeningModesForTarget:(id)a3 connection:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NACXPCServer *)self _listeningModesRecordForTarget:v6];
  id v9 = [v8 observers];
  char v10 = [v9 containsObject:v7];

  if ((v10 & 1) == 0)
  {
    id v11 = [v8 observers];

    if (!v11)
    {
      id v12 = [MEMORY[0x263EFF9C0] set];
      [v8 setObservers:v12];
    }
    id v13 = [v8 observers];
    [v13 addObject:v7];

    if ([(NACXPCServer *)self _aggregatedCountOfObserversForTarget:v6 inRecords:self->_listeningModesRecords] == 1)
    {
      id v14 = NMLogForCategory(4);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v6;
        _os_log_impl(&dword_237CD4000, v14, OS_LOG_TYPE_DEFAULT, "[NACXPC] Sending IDS beginObservingListeningModes request for %@ because first observer is added", (uint8_t *)&v15, 0xCu);
      }

      [(NACIDSClient *)self->_idsClient beginObservingListeningModesForTarget:v6];
    }
  }
}

- (void)_endObservingListeningModesForTarget:(id)a3 connection:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NACXPCServer *)self _listeningModesRecordForTarget:v6];
  id v9 = [v8 observers];
  if ([v9 containsObject:v7])
  {
    [v9 removeObject:v7];
    if (![(NACXPCServer *)self _aggregatedCountOfObserversForTarget:v6 inRecords:self->_listeningModesRecords])
    {
      char v10 = NMLogForCategory(4);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_237CD4000, v10, OS_LOG_TYPE_DEFAULT, "[NACXPC] Sending IDS endObservingListeningModes request for %@ because last observer is removed", (uint8_t *)&v11, 0xCu);
      }

      [(NACIDSClient *)self->_idsClient endObservingListeningModesForTarget:v6];
    }
  }
}

- (void)availableListeningModesForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__NACXPCServer_availableListeningModesForTarget_result___block_invoke;
    block[3] = &unk_264CFC3D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(internalQueue, block);
  }
}

void __56__NACXPCServer_availableListeningModesForTarget_result___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _listeningModesRecordForTarget:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [v4 availableListeningModes];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (void)currentListeningModeForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__NACXPCServer_currentListeningModeForTarget_result___block_invoke;
    block[3] = &unk_264CFC3D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(internalQueue, block);
  }
}

void __53__NACXPCServer_currentListeningModeForTarget_result___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _listeningModesRecordForTarget:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [v4 currentListeningMode];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (void)setCurrentListeningMode:(id)a3 forTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__NACXPCServer_setCurrentListeningMode_forTarget___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __50__NACXPCServer_setCurrentListeningMode_forTarget___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 64) setCurrentListeningMode:a1[5] forTarget:a1[6]];
}

- (void)hapticIntensity:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__NACXPCServer_hapticIntensity___block_invoke;
  v7[3] = &unk_264CFC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __32__NACXPCServer_hapticIntensity___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(float))(result + 16))(*(float *)(*(void *)(a1 + 32) + 72));
  }
  return result;
}

- (void)prominentHapticEnabled:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__NACXPCServer_prominentHapticEnabled___block_invoke;
  v7[3] = &unk_264CFC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __39__NACXPCServer_prominentHapticEnabled___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1 + 32) + 76));
  }
  return result;
}

- (void)hapticState:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__NACXPCServer_hapticState___block_invoke;
  v7[3] = &unk_264CFC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __28__NACXPCServer_hapticState___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 80));
  }
  return result;
}

- (void)systemMutedState:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__NACXPCServer_systemMutedState___block_invoke;
  v7[3] = &unk_264CFC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __33__NACXPCServer_systemMutedState___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1 + 32) + 88));
  }
  return result;
}

- (void)setHapticIntensity:(float)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__NACXPCServer_setHapticIntensity___block_invoke;
  v4[3] = &unk_264CFC478;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __35__NACXPCServer_setHapticIntensity___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 64) setHapticIntensity:a2];
}

- (void)setProminentHapticEnabled:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__NACXPCServer_setProminentHapticEnabled___block_invoke;
  v4[3] = &unk_264CFC4A0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __42__NACXPCServer_setProminentHapticEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setProminentHapticEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setHapticState:(int64_t)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__NACXPCServer_setHapticState___block_invoke;
  v4[3] = &unk_264CFC4C8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __31__NACXPCServer_setHapticState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setHapticState:*(void *)(a1 + 40)];
}

- (void)playAudioAndHapticPreview
{
}

void __41__NACXPCServer_playAudioAndHapticPreview__block_invoke()
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__NACXPCServer_playAudioAndHapticPreview__block_invoke_2;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v1 = 1429;
  if (_block_invoke_onceToken != -1) {
    dispatch_once(&_block_invoke_onceToken, block);
  }
  AudioServicesPlaySystemSoundWithCompletion(0x595u, 0);
}

uint64_t __41__NACXPCServer_playAudioAndHapticPreview__block_invoke_2(uint64_t a1)
{
  int inPropertyData = 1;
  return AudioServicesSetProperty(0x69666469u, 4u, (const void *)(a1 + 32), 4u, &inPropertyData);
}

- (void)playDefaultHapticPreview
{
}

void __40__NACXPCServer_playDefaultHapticPreview__block_invoke()
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__NACXPCServer_playDefaultHapticPreview__block_invoke_2;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v1 = 1437;
  if (_block_invoke_2_onceToken != -1) {
    dispatch_once(&_block_invoke_2_onceToken, block);
  }
  AudioServicesPlaySystemSoundWithCompletion(0x59Du, 0);
}

uint64_t __40__NACXPCServer_playDefaultHapticPreview__block_invoke_2(uint64_t a1)
{
  int inPropertyData = 1;
  return AudioServicesSetProperty(0x69666469u, 4u, (const void *)(a1 + 32), 4u, &inPropertyData);
}

- (void)playProminentHapticPreview
{
}

void __42__NACXPCServer_playProminentHapticPreview__block_invoke()
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NACXPCServer_playProminentHapticPreview__block_invoke_2;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v1 = 1498;
  if (_block_invoke_3_onceToken != -1) {
    dispatch_once(&_block_invoke_3_onceToken, block);
  }
  AudioServicesPlaySystemSoundWithCompletion(0x5DAu, 0);
}

uint64_t __42__NACXPCServer_playProminentHapticPreview__block_invoke_2(uint64_t a1)
{
  int inPropertyData = 1;
  return AudioServicesSetProperty(0x69666469u, 4u, (const void *)(a1 + 32), 4u, &inPropertyData);
}

- (void)audioRoutesForCategory:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NACXPCServer_audioRoutesForCategory_result___block_invoke;
  block[3] = &unk_264CFC3D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __46__NACXPCServer_audioRoutesForCategory_result___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _audioRoutesRecordForCategory:*(void *)(a1 + 40)];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [v2 timestamp];
  if (v4 - v5 <= 300.0)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      id v9 = [v2 audioRoutes];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
  else
  {
    id v6 = NMLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_237CD4000, v6, OS_LOG_TYPE_DEFAULT, "Audio route cache expired, waiting for an update from companion", v10, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
}

- (void)beginObservingAudioRoutesForCategory:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x263F08D68] currentConnection];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NACXPCServer_beginObservingAudioRoutesForCategory___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(internalQueue, block);
}

void __53__NACXPCServer_beginObservingAudioRoutesForCategory___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _audioRoutesRecordForCategory:*(void *)(a1 + 40)];
  uint64_t v2 = [v3 observers];
  if (([v2 containsObject:*(void *)(a1 + 48)] & 1) == 0)
  {
    [v2 addObject:*(void *)(a1 + 48)];
    if ([v2 count] == 1) {
      [*(id *)(*(void *)(a1 + 32) + 64) beginObservingAudioRoutesForCategory:*(void *)(a1 + 40)];
    }
  }
}

- (void)endObservingAudioRoutesForCategory:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x263F08D68] currentConnection];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NACXPCServer_endObservingAudioRoutesForCategory___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(internalQueue, block);
}

uint64_t __51__NACXPCServer_endObservingAudioRoutesForCategory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endObservingAudioRoutesForCategory:*(void *)(a1 + 40) connection:*(void *)(a1 + 48)];
}

- (void)_endObservingAudioRoutesForCategory:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__NACXPCServer__endObservingAudioRoutesForCategory_connection___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void __63__NACXPCServer__endObservingAudioRoutesForCategory_connection___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _audioRoutesRecordForCategory:*(void *)(a1 + 40)];
  uint64_t v2 = [v3 observers];
  if ([v2 containsObject:*(void *)(a1 + 48)])
  {
    [v2 removeObject:*(void *)(a1 + 48)];
    if (![v2 count]) {
      [*(id *)(*(void *)(a1 + 32) + 64) endObservingAudioRoutesForCategory:*(void *)(a1 + 40)];
    }
  }
}

- (void)pickAudioRouteWithIdentifier:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NACXPCServer_pickAudioRouteWithIdentifier_category___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __54__NACXPCServer_pickAudioRouteWithIdentifier_category___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 64) pickAudioRouteWithIdentifier:a1[5] category:a1[6]];
}

- (void)playToneWithConfiguration:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__NACXPCServer_playToneWithConfiguration___block_invoke;
  v7[3] = &unk_264CFC3B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __42__NACXPCServer_playToneWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) playToneWithConfiguration:*(void *)(a1 + 40)];
}

- (void)stopToneWithOptions:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__NACXPCServer_stopToneWithOptions___block_invoke;
  v7[3] = &unk_264CFC3B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __36__NACXPCServer_stopToneWithOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) stopToneWithOptions:*(void *)(a1 + 40)];
}

- (void)client:(id)a3 volumeValue:(float)a4 didChangeForTarget:(id)a5
{
  id v7 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NACXPCServer_client_volumeValue_didChangeForTarget___block_invoke;
  block[3] = &unk_264CFC428;
  void block[4] = self;
  id v11 = v7;
  float v12 = a4;
  id v9 = v7;
  dispatch_sync(internalQueue, block);
}

void __54__NACXPCServer_client_volumeValue_didChangeForTarget___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _volumeRecordForTarget:*(void *)(a1 + 40)];
  LODWORD(v2) = *(_DWORD *)(a1 + 48);
  [v4 setVolumeValue:v2];
  [*(id *)(a1 + 32) _persistVolumeRecords];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACVolumeValueDidChangeNotification", 0, 0, 1u);
}

- (void)client:(id)a3 volumeControlAvailable:(BOOL)a4 didChangeForTarget:(id)a5
{
  id v7 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__NACXPCServer_client_volumeControlAvailable_didChangeForTarget___block_invoke;
  block[3] = &unk_264CFC450;
  void block[4] = self;
  id v11 = v7;
  BOOL v12 = a4;
  id v9 = v7;
  dispatch_sync(internalQueue, block);
}

void __65__NACXPCServer_client_volumeControlAvailable_didChangeForTarget___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _volumeRecordForTarget:*(void *)(a1 + 40)];
  [v3 setVolumeControlAvailable:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) _persistVolumeRecords];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACVolumeControlAvailabilityDidChangeNotification", 0, 0, 1u);
}

- (void)client:(id)a3 mutedState:(BOOL)a4 didChangeForTarget:(id)a5
{
  id v7 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NACXPCServer_client_mutedState_didChangeForTarget___block_invoke;
  block[3] = &unk_264CFC450;
  void block[4] = self;
  id v11 = v7;
  BOOL v12 = a4;
  id v9 = v7;
  dispatch_sync(internalQueue, block);
}

void __53__NACXPCServer_client_mutedState_didChangeForTarget___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _volumeRecordForTarget:*(void *)(a1 + 40)];
  [v3 setMuted:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) _persistVolumeRecords];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACMutedStateDidChangeNotificaton", 0, 0, 1u);
}

- (void)client:(id)a3 hapticIntensityDidChange:(float)a4
{
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__NACXPCServer_client_hapticIntensityDidChange___block_invoke;
  v5[3] = &unk_264CFC478;
  v5[4] = self;
  float v6 = a4;
  dispatch_sync(internalQueue, v5);
}

void __48__NACXPCServer_client_hapticIntensityDidChange___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 72) = *(_DWORD *)(a1 + 40);
  [*(id *)(a1 + 32) _persistHapticIntensity];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACHapticIntensityDidChangeNotification", 0, 0, 1u);
}

- (void)client:(id)a3 prominentHapticStateDidChange:(BOOL)a4
{
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__NACXPCServer_client_prominentHapticStateDidChange___block_invoke;
  v5[3] = &unk_264CFC4A0;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_sync(internalQueue, v5);
}

void __53__NACXPCServer_client_prominentHapticStateDidChange___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 76) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) _persistProminentHapticState];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACProminentHapticStateDidChangeNotification", 0, 0, 1u);
}

- (void)client:(id)a3 hapticStateDidChange:(int64_t)a4
{
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__NACXPCServer_client_hapticStateDidChange___block_invoke;
  v5[3] = &unk_264CFC4C8;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_sync(internalQueue, v5);
}

void __44__NACXPCServer_client_hapticStateDidChange___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) _persistHapticState];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACHapticStateDidChangeNotification", 0, 0, 1u);
}

- (void)client:(id)a3 systemMutedStateDidChange:(BOOL)a4
{
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__NACXPCServer_client_systemMutedStateDidChange___block_invoke;
  v5[3] = &unk_264CFC4A0;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_sync(internalQueue, v5);
}

void __49__NACXPCServer_client_systemMutedStateDidChange___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) _persistSystemMutedState];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACSystemMutedStateDidChangeNotification", 0, 0, 1u);
}

- (void)client:(id)a3 EULimit:(float)a4 didChangeForTarget:(id)a5
{
  id v7 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__NACXPCServer_client_EULimit_didChangeForTarget___block_invoke;
  block[3] = &unk_264CFC428;
  void block[4] = self;
  id v11 = v7;
  float v12 = a4;
  id v9 = v7;
  dispatch_sync(internalQueue, block);
}

void __50__NACXPCServer_client_EULimit_didChangeForTarget___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _volumeRecordForTarget:*(void *)(a1 + 40)];
  LODWORD(v2) = *(_DWORD *)(a1 + 48);
  [v4 setEUVolumeLimit:v2];
  [*(id *)(a1 + 32) _persistVolumeRecords];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACEULimitDidChangeNotification", 0, 0, 1u);
}

- (void)client:(id)a3 volumeWarningEnabled:(BOOL)a4 volumeWarningState:(int64_t)a5 didChangeForTarget:(id)a6
{
  id v9 = a6;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__NACXPCServer_client_volumeWarningEnabled_volumeWarningState_didChangeForTarget___block_invoke;
  v12[3] = &unk_264CFC908;
  v12[4] = self;
  id v13 = v9;
  BOOL v15 = a4;
  int64_t v14 = a5;
  id v11 = v9;
  dispatch_sync(internalQueue, v12);
}

void __82__NACXPCServer_client_volumeWarningEnabled_volumeWarningState_didChangeForTarget___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _volumeRecordForTarget:*(void *)(a1 + 40)];
  [v3 setVolumeWarningEnabled:*(unsigned __int8 *)(a1 + 56)];
  [v3 setVolumeWarningState:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _persistVolumeRecords];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACVolumeWarningDidChangeNotification", 0, 0, 1u);
}

- (void)client:(id)a3 availableListeningModes:(id)a4 didChangeForTarget:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__NACXPCServer_client_availableListeningModes_didChangeForTarget___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(internalQueue, block);
}

void __66__NACXPCServer_client_availableListeningModes_didChangeForTarget___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _listeningModesRecordForTarget:*(void *)(a1 + 40)];
  [v3 setAvailableListeningModes:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _persistVolumeRecords];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACAvailableListeningModesDidChangeNotification", 0, 0, 1u);
}

- (void)client:(id)a3 currentListeningMode:(id)a4 didChangeForTarget:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__NACXPCServer_client_currentListeningMode_didChangeForTarget___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(internalQueue, block);
}

void __63__NACXPCServer_client_currentListeningMode_didChangeForTarget___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _listeningModesRecordForTarget:*(void *)(a1 + 40)];
  [v3 setCurrentListeningMode:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _persistVolumeRecords];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACCurrentListeningModeDidChangeNotification", 0, 0, 1u);
}

- (void)client:(id)a3 didFailToSetCurrentListeningModeForTarget:(id)a4 error:(id)a5
{
  id v6 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__NACXPCServer_client_didFailToSetCurrentListeningModeForTarget_error___block_invoke;
  block[3] = &unk_264CFC388;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(internalQueue, block);
}

void __71__NACXPCServer_client_didFailToSetCurrentListeningModeForTarget_error___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  double v2 = [MEMORY[0x263F087C8] defaultCenter];
  v6[0] = @"errorDomain";
  id v3 = [*(id *)(a1 + 32) domain];
  v6[1] = @"errorCode";
  v7[0] = v3;
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v7[1] = v4;
  double v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [v2 postNotificationName:@"NACFailedToSetCurrentListeningModeNotification" object:0 userInfo:v5];
}

- (void)client:(id)a3 audioRoutes:(id)a4 didChangeForCategory:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__NACXPCServer_client_audioRoutes_didChangeForCategory___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(internalQueue, block);
}

void __56__NACXPCServer_client_audioRoutes_didChangeForCategory___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _audioRoutesRecordForCategory:*(void *)(a1 + 40)];
  id v3 = [v2 audioRoutes];
  unint64_t v4 = [*(id *)(a1 + 48) count];
  if (v4 >= [v3 count])
  {
    [*(id *)(a1 + 32) _updateAudioRoutes:*(void *)(a1 + 48) category:*(void *)(a1 + 40)];
  }
  else
  {
    double v5 = NMLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NACXPC] Existing route list is larger, scheduling deferred update", v6, 2u);
    }

    [*(id *)(a1 + 32) _scheduleDeferredAudioRoutesUpdate:*(void *)(a1 + 48) category:*(void *)(a1 + 40)];
  }
}

- (void)_scheduleDeferredAudioRoutesUpdate:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NACXPCServer *)self _audioRoutesRecordForCategory:v6];
  [v8 setDeferredAudioRoutes:v7];

  if (!self->_audioRouteDeferTimer)
  {
    id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_internalQueue);
    audioRouteDeferTimer = self->_audioRouteDeferTimer;
    self->_audioRouteDeferTimer = v9;

    objc_initWeak(&location, self);
    id v11 = self->_audioRouteDeferTimer;
    dispatch_time_t v12 = dispatch_time(0, 3000000000);
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x11E1A300uLL);
    id v13 = self->_audioRouteDeferTimer;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__NACXPCServer__scheduleDeferredAudioRoutesUpdate_category___block_invoke;
    v14[3] = &unk_264CFC668;
    objc_copyWeak(&v17, &location);
    id v15 = v8;
    id v16 = v6;
    dispatch_source_set_event_handler(v13, v14);
    dispatch_resume((dispatch_object_t)self->_audioRouteDeferTimer);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __60__NACXPCServer__scheduleDeferredAudioRoutesUpdate_category___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v2 = [*(id *)(a1 + 32) deferredAudioRoutes];
  [WeakRetained _updateAudioRoutes:v2 category:*(void *)(a1 + 40)];
}

- (void)_updateAudioRoutes:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NACXPCServer *)self _cancelDeferredAudioRoutesUpdate];
  id v9 = [(NACXPCServer *)self _audioRoutesRecordForCategory:v6];

  [v9 setAudioRoutes:v7];
  [v9 setDeferredAudioRoutes:0];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v9, "setTimestamp:");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NACAudioRoutesDidChangeNotification", 0, 0, 1u);
}

- (void)_cancelDeferredAudioRoutesUpdate
{
  audioRouteDeferTimer = self->_audioRouteDeferTimer;
  if (audioRouteDeferTimer)
  {
    dispatch_source_cancel(audioRouteDeferTimer);
    unint64_t v4 = self->_audioRouteDeferTimer;
    self->_audioRouteDeferTimer = 0;
  }
}

- (void)client:(id)a3 volumeObservationCancelledForTarget:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = NMLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_237CD4000, v6, OS_LOG_TYPE_DEFAULT, "[NACXPC] Got IDS volume observation cancelled message for %@", buf, 0xCu);
  }

  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__NACXPCServer_client_volumeObservationCancelledForTarget___block_invoke;
  v9[3] = &unk_264CFC3B0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_sync(internalQueue, v9);
}

uint64_t __59__NACXPCServer_client_volumeObservationCancelledForTarget___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) _aggregatedCountOfObserversForTarget:*(void *)(a1 + 40) inRecords:*(void *)(*(void *)(a1 + 32) + 32)];
  if (result >= 1)
  {
    uint64_t v3 = result;
    unint64_t v4 = NMLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134218242;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_237CD4000, v4, OS_LOG_TYPE_DEFAULT, "[NACXPC] Still have %ld observers. Resending IDS beginObservingVolume request for %@", (uint8_t *)&v6, 0x16u);
    }

    return [*(id *)(*(void *)(a1 + 32) + 64) beginObservingVolumeForTarget:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)client:(id)a3 routeObservationCancelledForCategory:(id)a4
{
  id v5 = a4;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__NACXPCServer_client_routeObservationCancelledForCategory___block_invoke;
  v8[3] = &unk_264CFC3B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(internalQueue, v8);
}

void __60__NACXPCServer_client_routeObservationCancelledForCategory___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _audioRoutesRecordForCategory:*(void *)(a1 + 40)];
  double v2 = [v3 observers];
  if ([v2 count]) {
    [*(id *)(*(void *)(a1 + 32) + 64) beginObservingAudioRoutesForCategory:*(void *)(a1 + 40)];
  }
}

- (id)_cachedVolumeRecords
{
  double v2 = [(NPSDomainAccessor *)self->_domainAccessor objectForKey:@"VolumeRecords"];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (v2)
  {
    unint64_t v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
    id v16 = 0;
    uint64_t v10 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v9 fromData:v2 error:&v16];
    id v11 = v16;
    if (v11)
    {
      id v12 = NMLogForCategory(4);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(NACXPCServer *)(uint64_t)v11 _cachedVolumeRecords];
      }
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __36__NACXPCServer__cachedVolumeRecords__block_invoke;
    v14[3] = &unk_264CFC930;
    id v15 = v3;
    [v10 enumerateKeysAndObjectsUsingBlock:v14];
  }

  return v3;
}

void __36__NACXPCServer__cachedVolumeRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = +[NACProxyVolumeControlTarget volumeControlTargetWithCategory:v7];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
    }
  }
}

- (void)_persistVolumeRecords
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_237CD4000, a2, OS_LOG_TYPE_ERROR, "[NACXPC] Failed to archive volumeRecords due to %@", (uint8_t *)&v2, 0xCu);
}

- (float)_cachedHapticIntensity
{
  int v2 = [(NPSDomainAccessor *)self->_domainAccessor objectForKey:@"HapticIntensity"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)_persistHapticIntensity
{
  domainAccessor = self->_domainAccessor;
  *(float *)&double v2 = self->_hapticIntensity;
  id v5 = [NSNumber numberWithFloat:v2];
  [(NPSDomainAccessor *)domainAccessor setObject:v5 forKey:@"HapticIntensity"];

  id v6 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
}

- (BOOL)_cachedSystemMutedState
{
  return [(NPSDomainAccessor *)self->_domainAccessor BOOLForKey:@"SystemMutedState"];
}

- (void)_persistSystemMutedState
{
  domainAccessor = self->_domainAccessor;
  float v4 = [NSNumber numberWithBool:self->_systemMutedState];
  [(NPSDomainAccessor *)domainAccessor setObject:v4 forKey:@"SystemMutedState"];

  id v5 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
}

- (BOOL)_cachedProminentHapticState
{
  return [(NPSDomainAccessor *)self->_domainAccessor BOOLForKey:@"ProminentHapticState"];
}

- (void)_persistProminentHapticState
{
  domainAccessor = self->_domainAccessor;
  float v4 = [NSNumber numberWithBool:self->_prominentHapticEnabled];
  [(NPSDomainAccessor *)domainAccessor setObject:v4 forKey:@"ProminentHapticState"];

  id v5 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
}

- (int64_t)_cachedHapticState
{
  float v3 = [(NPSDomainAccessor *)self->_domainAccessor objectForKey:@"HapticState"];
  float v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 unsignedIntegerValue];
  }
  else
  {
    [(NACXPCServer *)self _cachedHapticIntensity];
    uint64_t v5 = NACStateFromIntensityAndProminentEnabled([(NACXPCServer *)self _cachedProminentHapticState], v6);
  }
  int64_t v7 = v5;

  return v7;
}

- (void)_persistHapticState
{
  domainAccessor = self->_domainAccessor;
  float v4 = [NSNumber numberWithInteger:self->_hapticState];
  [(NPSDomainAccessor *)domainAccessor setObject:v4 forKey:@"HapticState"];

  id v5 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
}

- (void)_cleanupConnection:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(NSMutableDictionary *)self->_volumeRecords allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        [(NACXPCServer *)self _endObservingVolumeForTarget:v10 connection:v4];
        [(NACXPCServer *)self _endObservingListeningModesForTarget:v10 connection:v4];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  id v11 = [(NACXPCServer *)self _routeObservationCategoriesForConnection:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [(NACXPCServer *)self _endObservingAudioRoutesForCategory:*(void *)(*((void *)&v16 + 1) + 8 * j) connection:v4];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (id)_volumeRecordForTarget:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_volumeRecords objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = objc_opt_new();
    [(NSMutableDictionary *)self->_volumeRecords setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)_listeningModesRecordForTarget:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_listeningModesRecords objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(_NACListeningModesRecord);
    listeningModesRecords = self->_listeningModesRecords;
    if (!listeningModesRecords)
    {
      uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v8 = self->_listeningModesRecords;
      self->_listeningModesRecords = v7;

      listeningModesRecords = self->_listeningModesRecords;
    }
    [(NSMutableDictionary *)listeningModesRecords setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)_audioRoutesRecordForCategory:(id)a3
{
  id v4 = NACCategoryStringWithRouteCategory(a3);
  id v5 = [(NSMutableDictionary *)self->_audioRoutesRecords objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = objc_opt_new();
    uint64_t v6 = objc_opt_new();
    [v5 setObservers:v6];

    [(NSMutableDictionary *)self->_audioRoutesRecords setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)_routeObservationCategoriesForConnection:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  audioRoutesRecords = self->_audioRoutesRecords;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__NACXPCServer__routeObservationCategoriesForConnection___block_invoke;
  v12[3] = &unk_264CFC958;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(NSMutableDictionary *)audioRoutesRecords enumerateKeysAndObjectsUsingBlock:v12];
  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __57__NACXPCServer__routeObservationCategoriesForConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 observers];
  if ([v5 containsObject:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioRouteDeferTimer, 0);
  objc_storeStrong((id *)&self->_idsClient, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_audioRoutesRecords, 0);
  objc_storeStrong((id *)&self->_listeningModesRecords, 0);
  objc_storeStrong((id *)&self->_volumeRecords, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_audioAndHapticPreviewQueue, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)_cachedVolumeRecords
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_237CD4000, a2, OS_LOG_TYPE_ERROR, "[NACXPC] Failed to unarchive cached volume records due to %@", (uint8_t *)&v2, 0xCu);
}

@end