@interface VOSOutputEventDispatcher
+ (VOSOutputEventDispatcher)sharedInstance;
- (BOOL)shouldPlayHapticForEvent:(id)a3;
- (BOOL)shouldPlaySoundForEvent:(id)a3;
- (id)_activeHapticPack;
- (id)_activeSoundPack;
- (id)_init;
- (void)addEventHandler:(id)a3;
- (void)removeEventHandler:(id)a3;
- (void)sendEvent:(id)a3;
@end

@implementation VOSOutputEventDispatcher

+ (VOSOutputEventDispatcher)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance__Shared_0;

  return (VOSOutputEventDispatcher *)v2;
}

uint64_t __42__VOSOutputEventDispatcher_sharedInstance__block_invoke()
{
  sharedInstance__Shared_0 = [[VOSOutputEventDispatcher alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)VOSOutputEventDispatcher;
  v2 = [(VOSOutputEventDispatcher *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("VOSOutputEventDispatcher", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    eventHandlers = v2->_eventHandlers;
    v2->_eventHandlers = (NSHashTable *)v6;
  }
  return v2;
}

- (id)_activeSoundPack
{
  cachedActiveSoundPack = self->_cachedActiveSoundPack;
  if (!cachedActiveSoundPack)
  {
    dispatch_queue_t v4 = objc_alloc_init(VOSDefaultSoundPack);
    v5 = self->_cachedActiveSoundPack;
    self->_cachedActiveSoundPack = (VOSSoundPack *)v4;

    cachedActiveSoundPack = self->_cachedActiveSoundPack;
  }

  return cachedActiveSoundPack;
}

- (id)_activeHapticPack
{
  cachedActiveHapticPack = self->_cachedActiveHapticPack;
  if (!cachedActiveHapticPack)
  {
    dispatch_queue_t v4 = objc_alloc_init(VOSDefaultHapticPack);
    v5 = self->_cachedActiveHapticPack;
    self->_cachedActiveHapticPack = (VOSHapticPack *)v4;

    cachedActiveHapticPack = self->_cachedActiveHapticPack;
  }

  return cachedActiveHapticPack;
}

- (void)addEventHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__VOSOutputEventDispatcher_addEventHandler___block_invoke;
  v7[3] = &unk_2643FD750;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __44__VOSOutputEventDispatcher_addEventHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)removeEventHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__VOSOutputEventDispatcher_removeEventHandler___block_invoke;
  v7[3] = &unk_2643FD750;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __47__VOSOutputEventDispatcher_removeEventHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)shouldPlaySoundForEvent:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F22938] sharedInstance];
  if ([v4 voiceOverSoundEffectsEnabled])
  {
    v5 = [v3 rawValue];
    id v6 = [v4 voiceOverSoundEnabledForEvent:v5];

    if (v6) {
      char v7 = [v6 BOOLValue];
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)shouldPlayHapticForEvent:(id)a3
{
  id v3 = a3;
  if (_AXSVibrationDisabled())
  {
    char v4 = 0;
  }
  else
  {
    v5 = [MEMORY[0x263F22938] sharedInstance];
    if ([v5 voiceOverHapticsEnabled])
    {
      id v6 = [v3 rawValue];
      char v7 = [v5 voiceOverHapticEnabledForEvent:v6];
      char v4 = [v7 BOOLValue];
    }
    else
    {
      char v4 = 0;
    }
  }
  return v4;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__VOSOutputEventDispatcher_sendEvent___block_invoke;
  v7[3] = &unk_2643FD750;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __38__VOSOutputEventDispatcher_sendEvent___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = VOTLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __38__VOSOutputEventDispatcher_sendEvent___block_invoke_cold_1(a1, v2);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 40) + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = *(void *)(a1 + 32);
        objc_super v9 = *(void **)(a1 + 40);
        v11 = objc_msgSend(v9, "_activeSoundPack", (void)v13);
        v12 = [*(id *)(a1 + 40) _activeHapticPack];
        [v8 dispatcher:v9 handleEvent:v10 soundPack:v11 hapticPack:v12];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedActiveHapticPack, 0);
  objc_storeStrong((id *)&self->_cachedActiveSoundPack, 0);
  objc_storeStrong((id *)&self->_eventHandlers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __38__VOSOutputEventDispatcher_sendEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21C3F9000, a2, OS_LOG_TYPE_DEBUG, "Sending output event: %@", (uint8_t *)&v3, 0xCu);
}

@end