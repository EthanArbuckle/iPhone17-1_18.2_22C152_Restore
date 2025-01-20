@interface NACXPCClient
+ (id)sharedClient;
- (NACXPCClient)init;
- (id)_proxy;
- (void)EULimitForTarget:(id)a3 result:(id)a4;
- (void)_createConnection;
- (void)_resumeListeningModesObservingIfNecessary;
- (void)_resumeRouteObservingIfNecessary;
- (void)_resumeVolumeObservingIfNecessary;
- (void)audioRoutesForCategory:(id)a3 result:(id)a4;
- (void)availableListeningModesForTarget:(id)a3 result:(id)a4;
- (void)beginObservingAudioRoutesForCategory:(id)a3;
- (void)beginObservingListeningModesForTarget:(id)a3;
- (void)beginObservingVolumeForTarget:(id)a3;
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

@implementation NACXPCClient

+ (id)sharedClient
{
  if (sharedClient___onceToken != -1) {
    dispatch_once(&sharedClient___onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedClient_sharedClient;

  return v2;
}

uint64_t __28__NACXPCClient_sharedClient__block_invoke()
{
  sharedClient_sharedClient = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (NACXPCClient)init
{
  v15.receiver = self;
  v15.super_class = (Class)NACXPCClient;
  v2 = [(NACXPCClient *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.NanoAudioControl.XPC", v4);
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    routeObservingCategories = v2->_routeObservingCategories;
    v2->_routeObservingCategories = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    volumeObservingTargets = v2->_volumeObservingTargets;
    v2->_volumeObservingTargets = (NSMutableSet *)v9;

    v11 = v2->_xpcConnectionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __20__NACXPCClient_init__block_invoke;
    block[3] = &unk_264CFC388;
    v14 = v2;
    dispatch_async(v11, block);
  }
  return v2;
}

uint64_t __20__NACXPCClient_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createConnection];
}

- (void)_resumeVolumeObservingIfNecessary
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_volumeObservingTargets;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NACXPCClient beginObservingVolumeForTarget:](self, "beginObservingVolumeForTarget:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_resumeListeningModesObservingIfNecessary
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_listeningModesObservingTargets;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NACXPCClient beginObservingListeningModesForTarget:](self, "beginObservingListeningModesForTarget:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_resumeRouteObservingIfNecessary
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_routeObservingCategories;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        -[NSMutableSet removeObject:](self->_routeObservingCategories, "removeObject:", v8, (void)v9);
        [(NACXPCClient *)self beginObservingAudioRoutesForCategory:v8];
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)beginObservingVolumeForTarget:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_volumeObservingTargets containsObject:v4] & 1) == 0)
  {
    xpcConnectionQueue = self->_xpcConnectionQueue;
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    long long v9 = __46__NACXPCClient_beginObservingVolumeForTarget___block_invoke;
    long long v10 = &unk_264CFC3B0;
    long long v11 = self;
    id v6 = v4;
    id v12 = v6;
    dispatch_async(xpcConnectionQueue, &v7);
    -[NSMutableSet addObject:](self->_volumeObservingTargets, "addObject:", v6, v7, v8, v9, v10, v11);
  }
}

void __46__NACXPCClient_beginObservingVolumeForTarget___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 beginObservingVolumeForTarget:*(void *)(a1 + 40)];
}

- (void)endObservingVolumeForTarget:(id)a3
{
  id v4 = a3;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  long long v9 = __44__NACXPCClient_endObservingVolumeForTarget___block_invoke;
  long long v10 = &unk_264CFC3B0;
  long long v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(xpcConnectionQueue, &v7);
  -[NSMutableSet removeObject:](self->_volumeObservingTargets, "removeObject:", v6, v7, v8, v9, v10, v11);
}

void __44__NACXPCClient_endObservingVolumeForTarget___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 endObservingVolumeForTarget:*(void *)(a1 + 40)];
}

- (void)beginObservingListeningModesForTarget:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_listeningModesObservingTargets containsObject:v4] & 1) == 0)
  {
    xpcConnectionQueue = self->_xpcConnectionQueue;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __54__NACXPCClient_beginObservingListeningModesForTarget___block_invoke;
    uint64_t v13 = &unk_264CFC3B0;
    uint64_t v14 = self;
    id v6 = v4;
    id v15 = v6;
    dispatch_async(xpcConnectionQueue, &v10);
    listeningModesObservingTargets = self->_listeningModesObservingTargets;
    if (!listeningModesObservingTargets)
    {
      objc_msgSend(MEMORY[0x263EFF9C0], "set", v10, v11, v12, v13, v14);
      uint64_t v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      long long v9 = self->_listeningModesObservingTargets;
      self->_listeningModesObservingTargets = v8;

      listeningModesObservingTargets = self->_listeningModesObservingTargets;
    }
    -[NSMutableSet addObject:](listeningModesObservingTargets, "addObject:", v6, v10, v11, v12, v13, v14);
  }
}

void __54__NACXPCClient_beginObservingListeningModesForTarget___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 beginObservingListeningModesForTarget:*(void *)(a1 + 40)];
}

- (void)endObservingListeningModesForTarget:(id)a3
{
  id v4 = a3;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  long long v9 = __52__NACXPCClient_endObservingListeningModesForTarget___block_invoke;
  uint64_t v10 = &unk_264CFC3B0;
  uint64_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(xpcConnectionQueue, &v7);
  -[NSMutableSet removeObject:](self->_listeningModesObservingTargets, "removeObject:", v6, v7, v8, v9, v10, v11);
}

void __52__NACXPCClient_endObservingListeningModesForTarget___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 endObservingListeningModesForTarget:*(void *)(a1 + 40)];
}

- (void)volumeValueForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__NACXPCClient_volumeValueForTarget_result___block_invoke;
  block[3] = &unk_264CFC3D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __44__NACXPCClient_volumeValueForTarget_result___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 volumeValueForTarget:*(void *)(a1 + 40) result:*(void *)(a1 + 48)];
}

- (void)volumeControlAvailabilityForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NACXPCClient_volumeControlAvailabilityForTarget_result___block_invoke;
  block[3] = &unk_264CFC3D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __58__NACXPCClient_volumeControlAvailabilityForTarget_result___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 volumeControlAvailabilityForTarget:*(void *)(a1 + 40) result:*(void *)(a1 + 48)];
}

- (void)mutedStateForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__NACXPCClient_mutedStateForTarget_result___block_invoke;
  block[3] = &unk_264CFC3D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __43__NACXPCClient_mutedStateForTarget_result___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 mutedStateForTarget:*(void *)(a1 + 40) result:*(void *)(a1 + 48)];
}

- (void)hapticState:(id)a3
{
  id v4 = a3;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__NACXPCClient_hapticState___block_invoke;
  v7[3] = &unk_264CFC400;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(xpcConnectionQueue, v7);
}

void __28__NACXPCClient_hapticState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 hapticState:*(void *)(a1 + 40)];
}

- (void)hapticIntensity:(id)a3
{
  id v4 = a3;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__NACXPCClient_hapticIntensity___block_invoke;
  v7[3] = &unk_264CFC400;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(xpcConnectionQueue, v7);
}

void __32__NACXPCClient_hapticIntensity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 hapticIntensity:*(void *)(a1 + 40)];
}

- (void)prominentHapticEnabled:(id)a3
{
  id v4 = a3;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__NACXPCClient_prominentHapticEnabled___block_invoke;
  v7[3] = &unk_264CFC400;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(xpcConnectionQueue, v7);
}

void __39__NACXPCClient_prominentHapticEnabled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 prominentHapticEnabled:*(void *)(a1 + 40)];
}

- (void)systemMutedState:(id)a3
{
  id v4 = a3;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__NACXPCClient_systemMutedState___block_invoke;
  v7[3] = &unk_264CFC400;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(xpcConnectionQueue, v7);
}

void __33__NACXPCClient_systemMutedState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 systemMutedState:*(void *)(a1 + 40)];
}

- (void)EULimitForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__NACXPCClient_EULimitForTarget_result___block_invoke;
  block[3] = &unk_264CFC3D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __40__NACXPCClient_EULimitForTarget_result___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 EULimitForTarget:*(void *)(a1 + 40) result:*(void *)(a1 + 48)];
}

- (void)volumeWarningForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NACXPCClient_volumeWarningForTarget_result___block_invoke;
  block[3] = &unk_264CFC3D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __46__NACXPCClient_volumeWarningForTarget_result___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 volumeWarningForTarget:*(void *)(a1 + 40) result:*(void *)(a1 + 48)];
}

- (void)setVolumeValue:(float)a3 forTarget:(id)a4
{
  id v6 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__NACXPCClient_setVolumeValue_forTarget___block_invoke;
  block[3] = &unk_264CFC428;
  float v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __41__NACXPCClient_setVolumeValue_forTarget___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _proxy];
  LODWORD(v2) = *(_DWORD *)(a1 + 48);
  [v3 setVolumeValue:*(void *)(a1 + 40) forTarget:v2];
}

- (void)setMuted:(BOOL)a3 forTarget:(id)a4
{
  id v6 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__NACXPCClient_setMuted_forTarget___block_invoke;
  block[3] = &unk_264CFC450;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __35__NACXPCClient_setMuted_forTarget___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 setMuted:*(unsigned __int8 *)(a1 + 48) forTarget:*(void *)(a1 + 40)];
}

- (void)setHapticIntensity:(float)a3
{
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__NACXPCClient_setHapticIntensity___block_invoke;
  v4[3] = &unk_264CFC478;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(xpcConnectionQueue, v4);
}

void __35__NACXPCClient_setHapticIntensity___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _proxy];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 setHapticIntensity:v2];
}

- (void)setProminentHapticEnabled:(BOOL)a3
{
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__NACXPCClient_setProminentHapticEnabled___block_invoke;
  v4[3] = &unk_264CFC4A0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(xpcConnectionQueue, v4);
}

void __42__NACXPCClient_setProminentHapticEnabled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 setProminentHapticEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setHapticState:(int64_t)a3
{
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__NACXPCClient_setHapticState___block_invoke;
  v4[3] = &unk_264CFC4C8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(xpcConnectionQueue, v4);
}

void __31__NACXPCClient_setHapticState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 setHapticState:*(void *)(a1 + 40)];
}

- (void)setSystemMuted:(BOOL)a3
{
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__NACXPCClient_setSystemMuted___block_invoke;
  v4[3] = &unk_264CFC4A0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(xpcConnectionQueue, v4);
}

void __31__NACXPCClient_setSystemMuted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 setSystemMuted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)availableListeningModesForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__NACXPCClient_availableListeningModesForTarget_result___block_invoke;
  block[3] = &unk_264CFC3D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __56__NACXPCClient_availableListeningModesForTarget_result___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 availableListeningModesForTarget:*(void *)(a1 + 40) result:*(void *)(a1 + 48)];
}

- (void)currentListeningModeForTarget:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NACXPCClient_currentListeningModeForTarget_result___block_invoke;
  block[3] = &unk_264CFC3D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __53__NACXPCClient_currentListeningModeForTarget_result___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 currentListeningModeForTarget:*(void *)(a1 + 40) result:*(void *)(a1 + 48)];
}

- (void)setCurrentListeningMode:(id)a3 forTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__NACXPCClient_setCurrentListeningMode_forTarget___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __50__NACXPCClient_setCurrentListeningMode_forTarget___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 setCurrentListeningMode:*(void *)(a1 + 40) forTarget:*(void *)(a1 + 48)];
}

- (void)audioRoutesForCategory:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NACXPCClient_audioRoutesForCategory_result___block_invoke;
  block[3] = &unk_264CFC3D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __46__NACXPCClient_audioRoutesForCategory_result___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 audioRoutesForCategory:*(void *)(a1 + 40) result:*(void *)(a1 + 48)];
}

- (void)beginObservingAudioRoutesForCategory:(id)a3
{
  id v4 = a3;
  BOOL v5 = NACCategoryStringWithRouteCategory(v4);
  if (([(NSMutableSet *)self->_routeObservingCategories containsObject:v5] & 1) == 0)
  {
    xpcConnectionQueue = self->_xpcConnectionQueue;
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    id v9 = __53__NACXPCClient_beginObservingAudioRoutesForCategory___block_invoke;
    id v10 = &unk_264CFC3B0;
    BOOL v11 = self;
    id v12 = v4;
    dispatch_async(xpcConnectionQueue, &v7);
    -[NSMutableSet addObject:](self->_routeObservingCategories, "addObject:", v5, v7, v8, v9, v10, v11);
  }
}

void __53__NACXPCClient_beginObservingAudioRoutesForCategory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 beginObservingAudioRoutesForCategory:*(void *)(a1 + 40)];
}

- (void)endObservingAudioRoutesForCategory:(id)a3
{
  id v4 = a3;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __51__NACXPCClient_endObservingAudioRoutesForCategory___block_invoke;
  BOOL v11 = &unk_264CFC3B0;
  id v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_async(xpcConnectionQueue, &v8);
  uint64_t v7 = NACCategoryStringWithRouteCategory(v6);
  -[NSMutableSet removeObject:](self->_routeObservingCategories, "removeObject:", v7, v8, v9, v10, v11, v12);
}

void __51__NACXPCClient_endObservingAudioRoutesForCategory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 endObservingAudioRoutesForCategory:*(void *)(a1 + 40)];
}

- (void)pickAudioRouteWithIdentifier:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NACXPCClient_pickAudioRouteWithIdentifier_category___block_invoke;
  block[3] = &unk_264CFC4F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(xpcConnectionQueue, block);
}

void __54__NACXPCClient_pickAudioRouteWithIdentifier_category___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 pickAudioRouteWithIdentifier:*(void *)(a1 + 40) category:*(void *)(a1 + 48)];
}

- (void)playAudioAndHapticPreview
{
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__NACXPCClient_playAudioAndHapticPreview__block_invoke;
  block[3] = &unk_264CFC388;
  void block[4] = self;
  dispatch_async(xpcConnectionQueue, block);
}

void __41__NACXPCClient_playAudioAndHapticPreview__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _proxy];
  [v1 playAudioAndHapticPreview];
}

- (void)playDefaultHapticPreview
{
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__NACXPCClient_playDefaultHapticPreview__block_invoke;
  block[3] = &unk_264CFC388;
  void block[4] = self;
  dispatch_async(xpcConnectionQueue, block);
}

void __40__NACXPCClient_playDefaultHapticPreview__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _proxy];
  [v1 playDefaultHapticPreview];
}

- (void)playProminentHapticPreview
{
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__NACXPCClient_playProminentHapticPreview__block_invoke;
  block[3] = &unk_264CFC388;
  void block[4] = self;
  dispatch_async(xpcConnectionQueue, block);
}

void __42__NACXPCClient_playProminentHapticPreview__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _proxy];
  [v1 playProminentHapticPreview];
}

- (void)playToneWithConfiguration:(id)a3
{
  id v4 = a3;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__NACXPCClient_playToneWithConfiguration___block_invoke;
  v7[3] = &unk_264CFC3B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(xpcConnectionQueue, v7);
}

void __42__NACXPCClient_playToneWithConfiguration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 playToneWithConfiguration:*(void *)(a1 + 40)];
}

- (void)stopToneWithOptions:(id)a3
{
  id v4 = a3;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__NACXPCClient_stopToneWithOptions___block_invoke;
  v7[3] = &unk_264CFC3B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(xpcConnectionQueue, v7);
}

void __36__NACXPCClient_stopToneWithOptions___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _proxy];
  [v2 stopToneWithOptions:*(void *)(a1 + 40)];
}

- (void)_createConnection
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EAE5A88];
  [v6 setClasses:v5 forSelector:sel_audioRoutesForCategory_result_ argumentIndex:0 ofReply:1];
  objc_initWeak(&location, self);
  id v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.NanoAudioControl" options:0];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v7;

  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v6];
  id v9 = self->_xpcConnection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __33__NACXPCClient__createConnection__block_invoke;
  v13[3] = &unk_264CFC518;
  objc_copyWeak(&v14, &location);
  [(NSXPCConnection *)v9 setInterruptionHandler:v13];
  id v10 = self->_xpcConnection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__NACXPCClient__createConnection__block_invoke_2;
  v11[3] = &unk_264CFC518;
  objc_copyWeak(&v12, &location);
  [(NSXPCConnection *)v10 setInvalidationHandler:v11];
  [(NSXPCConnection *)self->_xpcConnection resume];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __33__NACXPCClient__createConnection__block_invoke(uint64_t a1)
{
  id v2 = NMLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237CD4000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__NACXPCClient__createConnection__block_invoke_108;
    block[3] = &unk_264CFC388;
    void block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __33__NACXPCClient__createConnection__block_invoke_108(uint64_t a1)
{
  [*(id *)(a1 + 32) _resumeVolumeObservingIfNecessary];
  [*(id *)(a1 + 32) _resumeListeningModesObservingIfNecessary];
  id v2 = *(void **)(a1 + 32);

  return [v2 _resumeRouteObservingIfNecessary];
}

void __33__NACXPCClient__createConnection__block_invoke_2(uint64_t a1)
{
  id v2 = NMLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237CD4000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated", buf, 2u);
  }

  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__NACXPCClient__createConnection__block_invoke_109;
    block[3] = &unk_264CFC388;
    void block[4] = v4;
    dispatch_async(v5, block);
  }
}

void __33__NACXPCClient__createConnection__block_invoke_109(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (id)_proxy
{
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    [(NACXPCClient *)self _createConnection];
    xpcConnection = self->_xpcConnection;
  }

  return [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_112];
}

void __22__NACXPCClient__proxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = NMLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __22__NACXPCClient__proxy__block_invoke_cold_1(v2, v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeningModesObservingTargets, 0);
  objc_storeStrong((id *)&self->_volumeObservingTargets, 0);
  objc_storeStrong((id *)&self->_routeObservingCategories, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __22__NACXPCClient__proxy__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_237CD4000, a2, OS_LOG_TYPE_ERROR, "Error getting proxy object: %@", (uint8_t *)&v4, 0xCu);
}

@end