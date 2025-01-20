@interface NACVolumeControllerLocal
- (BOOL)isMuted;
- (BOOL)isProminentHapticEnabled;
- (BOOL)isSystemMuted;
- (BOOL)isVolumeControlAvailable;
- (BOOL)isVolumeWarningEnabled;
- (NACVolumeControllerDelegate)delegate;
- (NACVolumeControllerLocal)init;
- (NACVolumeControllerLocal)initWithAudioCategory:(id)a3;
- (NACVolumeControllerLocal)initWithRoute:(id)a3;
- (NACVolumeControllerLocal)initWithTarget:(int64_t)a3 category:(id)a4;
- (NSOrderedSet)availableListeningModes;
- (NSString)currentListeningMode;
- (float)EUVolumeLimit;
- (float)hapticIntensity;
- (float)volumeValue;
- (id)_init;
- (id)_mediaControlsVolumeController;
- (id)_volumeController;
- (int64_t)hapticState;
- (int64_t)volumeWarningState;
- (void)_ignoreHapticObservation;
- (void)_setHapticIntensity:(id)a3;
- (void)_setVolumeValue:(id)a3;
- (void)_updateMutedStateFromVolumeController:(id)a3;
- (void)_updateVolumeState;
- (void)allowUserToExceedEUVolumeLimit;
- (void)beginObservingHapticState;
- (void)beginObservingHaptics;
- (void)beginObservingListeningModes;
- (void)beginObservingVolume;
- (void)endObservingHapticState;
- (void)endObservingHaptics;
- (void)endObservingListeningModes;
- (void)endObservingVolume;
- (void)mediaControlsVolumeController:(id)a3 didUpdateSplitRoute:(BOOL)a4;
- (void)playDefaultHapticPreview;
- (void)playPreview;
- (void)playProminentHapticPreview;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
- (void)setCurrentListeningMode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHapticIntensity:(float)a3;
- (void)setHapticState:(int64_t)a3;
- (void)setMuted:(BOOL)a3;
- (void)setProminentHapticEnabled:(BOOL)a3;
- (void)setSystemMuted:(BOOL)a3;
- (void)setVolumeValue:(float)a3;
- (void)setVolumeValue:(float)a3 muted:(BOOL)a4 overrideEULimit:(BOOL)a5;
- (void)updateCachedHapticState;
- (void)volumeController:(id)a3 EUVolumeLimitDidChange:(float)a4;
- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
- (void)volumeController:(id)a3 volumeWarningStateDidChange:(int64_t)a4;
@end

@implementation NACVolumeControllerLocal

- (BOOL)isVolumeControlAvailable
{
  int64_t target = self->_target;
  if (target == 1)
  {
    v8 = [(MPVolumeController *)self->_volumeController dataSource];
    v9 = [v8 groupRoute];
    if (v9) {
      char v2 = [(MPVolumeController *)self->_volumeController isVolumeControlAvailable];
    }
    else {
      char v2 = 0;
    }

    return v2 & 1;
  }
  if (target) {
    return v2 & 1;
  }
  if (self->_route)
  {
    v5 = [(NACVolumeControllerLocal *)self _volumeController];
    char v6 = [v5 isVolumeControlAvailable];

    return v6;
  }
  else
  {
    routingController = self->_routingController;
    return [(MPAVRoutingController *)routingController volumeControlIsAvailable];
  }
}

- (void)beginObservingVolume
{
  if (!self->_route && !self->_routingController)
  {
    int64_t target = self->_target;
    if (target == 1)
    {
      id v7 = objc_alloc(MEMORY[0x263F11D28]);
      id v8 = objc_alloc_init(MEMORY[0x263F11CF0]);
      v9 = (MPAVRoutingController *)[v7 initWithDataSource:v8 name:0];
      routingController = self->_routingController;
      self->_routingController = v9;

      uint64_t v6 = 3;
    }
    else
    {
      if (target) {
        goto LABEL_8;
      }
      v4 = (MPAVRoutingController *)objc_alloc_init(MEMORY[0x263F11D28]);
      v5 = self->_routingController;
      self->_routingController = v4;

      [(MPAVRoutingController *)self->_routingController setCategory:self->_audioCategory];
      uint64_t v6 = 0;
    }
    [(MPAVRoutingController *)self->_routingController setDelegate:self];
    [(MPAVRoutingController *)self->_routingController setDiscoveryMode:v6];
  }
LABEL_8:
  if (!self->_shouldIgnoreHaptics) {
    [(NACVolumeControllerLocal *)self beginObservingHaptics];
  }
  v11 = [(NACVolumeControllerLocal *)self _volumeController];

  if (v11)
  {
    [(NACVolumeControllerLocal *)self _updateVolumeState];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 volumeControllerDidUpdateVolumeValue:self];
    }
  }
  else
  {
    self->_validCachedMutedValue = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__NACVolumeControllerLocal_beginObservingVolume__block_invoke;
    block[3] = &unk_264CFC388;
    block[4] = self;
    dispatch_async(serialQueue, block);
  }
}

- (void)_updateVolumeState
{
  id v3 = [(NACVolumeControllerLocal *)self _volumeController];
  [v3 updateVolumeValue];
  [v3 updateVolumeWarningState];
  [(NACVolumeControllerLocal *)self _updateMutedStateFromVolumeController:v3];
}

- (float)volumeValue
{
  char v2 = [(NACVolumeControllerLocal *)self _volumeController];
  [v2 volumeValue];
  float v4 = v3;

  return v4;
}

- (BOOL)isMuted
{
  if (!self->_validCachedMutedValue)
  {
    float v3 = [(NACVolumeControllerLocal *)self _volumeController];
    self->_muted = [v3 isMuted];

    self->_validCachedMutedValue = 1;
  }
  return self->_muted;
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  volumeSetHistory = self->_volumeSetHistory;
  id v7 = [NSNumber numberWithFloat:a3];
  int v8 = [(NSCountedSet *)volumeSetHistory containsObject:v7];

  v10 = self->_volumeSetHistory;
  if (v8)
  {
    *(float *)&double v9 = a4;
    id v11 = [NSNumber numberWithFloat:v9];
    [(NSCountedSet *)v10 removeObject:v11];
  }
  else
  {
    [(NSCountedSet *)self->_volumeSetHistory removeAllObjects];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__NACVolumeControllerLocal_volumeController_volumeValueDidChange___block_invoke;
    block[3] = &unk_264CFC388;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __66__NACVolumeControllerLocal_volumeController_volumeValueDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    [v4 volumeControllerDidUpdateVolumeValue:*(void *)(a1 + 32)];
  }
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__NACVolumeControllerLocal_routingControllerAvailableRoutesDidChange___block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __70__NACVolumeControllerLocal_routingControllerAvailableRoutesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8) == 1)
  {
    char v3 = [*(id *)(v2 + 40) availableRoutes];
    id v4 = [v3 firstObject];
    v5 = [*(id *)(*(void *)(a1 + 32) + 32) dataSource];
    [v5 setGroupRoute:v4];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  [(id)v2 _updateVolumeState];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    [v8 volumeControllerDidUpdateVolumeControlAvailibility:*(void *)(a1 + 32)];
  }
}

- (BOOL)isVolumeWarningEnabled
{
  uint64_t v2 = [(NACVolumeControllerLocal *)self _volumeController];
  char v3 = [v2 volumeWarningEnabled];

  return v3;
}

- (NACVolumeControllerLocal)initWithAudioCategory:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(NACVolumeControllerLocal *)self _init];
  char v7 = v6;
  if (v6)
  {
    v6->_int64_t target = 0;
    objc_storeStrong((id *)&v6->_audioCategory, a3);
  }

  return v7;
}

- (void)_ignoreHapticObservation
{
  self->_shouldIgnoreHaptics = 1;
  if (self->_monitoringHaptics) {
    [(NACVolumeControllerLocal *)self endObservingHaptics];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)endObservingVolume
{
  self->_validCachedMutedValue = 0;
  [(NACVolumeControllerLocal *)self endObservingHaptics];
}

- (void)endObservingHaptics
{
  if (self->_monitoringHaptics)
  {
    [(NACVolumeControllerLocal *)self endObservingHapticState];
    self->_monitoringHaptics = 0;
  }
}

- (NACVolumeControllerLocal)init
{
  return 0;
}

- (NACVolumeControllerLocal)initWithRoute:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(NACVolumeControllerLocal *)self _init];
  char v7 = v6;
  if (v6)
  {
    v6->_int64_t target = 0;
    objc_storeStrong((id *)&v6->_route, a3);
  }

  return v7;
}

- (NACVolumeControllerLocal)initWithTarget:(int64_t)a3 category:(id)a4
{
  id v7 = a4;
  id v8 = [(NACVolumeControllerLocal *)self _init];
  double v9 = v8;
  if (v8)
  {
    v8->_int64_t target = a3;
    objc_storeStrong((id *)&v8->_audioCategory, a4);
  }

  return v9;
}

- (id)_init
{
  v19.receiver = self;
  v19.super_class = (Class)NACVolumeControllerLocal;
  uint64_t v2 = [(NACVolumeControllerLocal *)&v19 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    volumeSetHistory = v2->_volumeSetHistory;
    v2->_volumeSetHistory = (NSCountedSet *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("NACVolumeControllerLocal", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    uint64_t v7 = objc_opt_new();
    volumeThrottler = v2->_volumeThrottler;
    v2->_volumeThrottler = (NACEventThrottler *)v7;

    [(NACEventThrottler *)v2->_volumeThrottler setMinimumDelay:0.1];
    double v9 = v2->_volumeThrottler;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __33__NACVolumeControllerLocal__init__block_invoke;
    v16[3] = &unk_264CFC730;
    objc_copyWeak(&v17, &location);
    [(NACEventThrottler *)v9 setEventBlock:v16];
    uint64_t v10 = objc_opt_new();
    hapticThrottler = v2->_hapticThrottler;
    v2->_hapticThrottler = (NACEventThrottler *)v10;

    [(NACEventThrottler *)v2->_hapticThrottler setMinimumDelay:0.5];
    v12 = v2->_hapticThrottler;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __33__NACVolumeControllerLocal__init__block_invoke_2;
    v14[3] = &unk_264CFC730;
    objc_copyWeak(&v15, &location);
    [(NACEventThrottler *)v12 setEventBlock:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__NACVolumeControllerLocal__init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setVolumeValue:v3];
}

void __33__NACVolumeControllerLocal__init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setHapticIntensity:v3];
}

void __48__NACVolumeControllerLocal_beginObservingVolume__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  if (v3 == 1)
  {
    id v5 = objc_alloc(MEMORY[0x263F12330]);
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 40) availableRoutes];
    uint64_t v7 = [v6 firstObject];
    id v4 = (id)[v5 initWithGroupRoute:v7 outputDeviceRoute:0];
  }
  else if (v3)
  {
    id v4 = 0;
  }
  else if (*(void *)(v2 + 24))
  {
    id v4 = (id)[objc_alloc(MEMORY[0x263F12330]) initWithGroupRoute:*(void *)(*(void *)(a1 + 32) + 24) outputDeviceRoute:0];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263F12338]);
    [v4 setVolumeAudioCategory:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x263F12328]) initWithDataSource:v4];
  [v8 setDelegate:*(void *)(a1 + 32)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v8);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__NACVolumeControllerLocal_beginObservingVolume__block_invoke_2;
  v10[3] = &unk_264CFC3B0;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v8;
  id v9 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __48__NACVolumeControllerLocal_beginObservingVolume__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateMutedStateFromVolumeController:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    [v4 volumeControllerDidUpdateVolumeValue:*(void *)(a1 + 32)];
  }
}

- (void)beginObservingHaptics
{
  if (!self->_monitoringHaptics)
  {
    *(_WORD *)&self->_shouldIgnoreHaptics = 256;
    [(NACVolumeControllerLocal *)self beginObservingHapticState];
    [(NACVolumeControllerLocal *)self updateCachedHapticState];
  }
}

- (void)beginObservingListeningModes
{
  id v3 = [(NACVolumeControllerLocal *)self _mediaControlsVolumeController];
  [v3 addObserver:self];
}

- (void)endObservingListeningModes
{
}

- (float)EUVolumeLimit
{
  uint64_t v2 = [(NACVolumeControllerLocal *)self _volumeController];
  [v2 EUVolumeLimit];
  float v4 = v3;

  return v4;
}

- (int64_t)volumeWarningState
{
  uint64_t v2 = [(NACVolumeControllerLocal *)self _volumeController];
  int64_t v3 = [v2 volumeWarningState];

  return v3;
}

- (void)setVolumeValue:(float)a3
{
  volumeThrottler = self->_volumeThrottler;
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NACEventThrottler *)volumeThrottler setValue:v4];
}

- (void)_setVolumeValue:(id)a3
{
  id v4 = a3;
  [v4 floatValue];
  int v6 = v5;
  [(NSCountedSet *)self->_volumeSetHistory addObject:v4];

  uint64_t v7 = [(NACVolumeControllerLocal *)self _volumeController];
  LODWORD(v8) = 0.5;
  LODWORD(v9) = v6;
  [v7 setVolume:v9 withNotificationDelay:v8];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__NACVolumeControllerLocal__setVolumeValue___block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __44__NACVolumeControllerLocal__setVolumeValue___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) isEqualToString:@"Ringtone"];
  if (result)
  {
    int64_t v3 = *(void **)(a1 + 32);
    return [v3 playPreview];
  }
  return result;
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NACVolumeControllerLocal *)self _volumeController];
  [v4 setMuted:v3];
}

- (void)setVolumeValue:(float)a3 muted:(BOOL)a4 overrideEULimit:(BOOL)a5
{
  BOOL v5 = a4;
  -[NACVolumeControllerLocal setVolumeValue:](self, "setVolumeValue:", a4, a5);

  [(NACVolumeControllerLocal *)self setMuted:v5];
}

- (void)allowUserToExceedEUVolumeLimit
{
  if (!self->_route)
  {
    id v2 = [MEMORY[0x263F544E0] sharedAVSystemController];
    [v2 allowUserToExceedEUVolumeLimit];
  }
}

- (NSOrderedSet)availableListeningModes
{
  id v2 = (void *)MEMORY[0x263EFF9D8];
  BOOL v3 = [(NACVolumeControllerLocal *)self _mediaControlsVolumeController];
  id v4 = [v3 availableBluetoothListeningModeForRouteType:0];
  BOOL v5 = [v2 orderedSetWithArray:v4];

  return (NSOrderedSet *)v5;
}

- (NSString)currentListeningMode
{
  id v2 = [(NACVolumeControllerLocal *)self _mediaControlsVolumeController];
  BOOL v3 = [v2 currentBluetoothListeningModeForRouteType:0];

  return (NSString *)v3;
}

- (void)setCurrentListeningMode:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NACVolumeControllerLocal *)self _mediaControlsVolumeController];
  id v11 = 0;
  char v6 = [v5 setCurrentBluetoothListeningModeForRouteType:0 bluetoothListeningMode:v4 error:&v11];

  id v7 = v11;
  if ((v6 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 volumeController:self didFailToSetCurrentListeningModeWithError:v7];
    }
  }
}

- (id)_mediaControlsVolumeController
{
  mediaControlsVolumeController = self->_mediaControlsVolumeController;
  if (!mediaControlsVolumeController)
  {
    id v4 = objc_alloc_init(MediaControlsVolumeController);
    BOOL v5 = self->_mediaControlsVolumeController;
    self->_mediaControlsVolumeController = v4;

    [(MediaControlsVolumeController *)self->_mediaControlsVolumeController setVolumeAudioCategory:self->_audioCategory];
    mediaControlsVolumeController = self->_mediaControlsVolumeController;
  }

  return mediaControlsVolumeController;
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 volumeControllerDidUpdateVolumeControlAvailibility:self];
  }
}

- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__NACVolumeControllerLocal_volumeController_mutedStateDidChange___block_invoke;
  v4[3] = &unk_264CFC4A0;
  v4[4] = self;
  BOOL v5 = a4;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __65__NACVolumeControllerLocal_volumeController_mutedStateDidChange___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = *(unsigned char *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    [v4 volumeControllerDidUpdateVolumeValue:*(void *)(a1 + 32)];
  }
}

- (void)volumeController:(id)a3 EUVolumeLimitDidChange:(float)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__NACVolumeControllerLocal_volumeController_EUVolumeLimitDidChange___block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __68__NACVolumeControllerLocal_volumeController_EUVolumeLimitDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    [v4 volumeControllerDidUpdateEUVolumeLimit:*(void *)(a1 + 32)];
  }
}

- (void)volumeController:(id)a3 volumeWarningStateDidChange:(int64_t)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__NACVolumeControllerLocal_volumeController_volumeWarningStateDidChange___block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __73__NACVolumeControllerLocal_volumeController_volumeWarningStateDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    [v4 volumeControllerDidUpdateVolumeWarningState:*(void *)(a1 + 32)];
  }
}

- (void)mediaControlsVolumeController:(id)a3 didUpdateSplitRoute:(BOOL)a4
{
  obj = [(NACVolumeControllerLocal *)self availableListeningModes];
  BOOL v5 = self->_lastNotifiedAvailableListeningModes;
  id v6 = obj;
  if (obj == v5) {
    goto LABEL_5;
  }
  char v7 = [(NSOrderedSet *)obj isEqual:v5];

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastNotifiedAvailableListeningModes, obj);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 volumeControllerDidUpdateAvailableListeningModes:self];
LABEL_5:
    }
  }
  id v10 = [(NACVolumeControllerLocal *)self currentListeningMode];
  id v11 = self->_lastNotifiedCurrentListeningMode;
  id v12 = v10;
  if (v10 == v11)
  {
LABEL_10:

    goto LABEL_11;
  }
  char v13 = v11;
  char v14 = [(NSString *)v10 isEqual:v11];

  if ((v14 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastNotifiedCurrentListeningMode, v10);
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 volumeControllerDidUpdateCurrentListeningMode:self];
      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)setHapticState:(int64_t)a3
{
  BOOL v5 = NACProminentEnabledFromState(a3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__NACVolumeControllerLocal_setHapticState___block_invoke;
  v7[3] = &unk_264CFC4A0;
  BOOL v8 = v5;
  v7[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v7);
  *(float *)&double v6 = NACIntensityFromState(a3);
  [(NACVolumeControllerLocal *)self setHapticIntensity:v6];
  [(NACVolumeControllerLocal *)self setProminentHapticEnabled:NACProminentEnabledFromState(a3)];
}

uint64_t __43__NACVolumeControllerLocal_setHapticState___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 playProminentHapticPreview];
  }
  else {
    return [v2 playDefaultHapticPreview];
  }
}

- (int64_t)hapticState
{
  [(NACVolumeControllerLocal *)self hapticIntensity];
  float v4 = v3;
  int v5 = [(NACVolumeControllerLocal *)self isProminentHapticEnabled];

  return NACStateFromIntensityAndProminentEnabled(v5, v4);
}

- (void)updateCachedHapticState
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NACVolumeControllerLocal_updateCachedHapticState__block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __51__NACVolumeControllerLocal_updateCachedHapticState__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) hapticState];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 80) != v2)
  {
    *(void *)(v3 + 80) = v2;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__NACVolumeControllerLocal_updateCachedHapticState__block_invoke_2;
    block[3] = &unk_264CFC388;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __51__NACVolumeControllerLocal_updateCachedHapticState__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    [v4 volumeControllerDidUpdateHapticState:*(void *)(a1 + 32)];
  }
}

- (void)beginObservingHapticState
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_237CD4000, a2, OS_LOG_TYPE_ERROR, "Failed to set AVSC notifications attribute: %@", (uint8_t *)&v2, 0xCu);
}

- (void)endObservingHapticState
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v4 removeObserver:self name:*MEMORY[0x263F544B8] object:v3];
  [v4 removeObserver:self name:*MEMORY[0x263F7FD90] object:0];
}

- (void)setHapticIntensity:(float)a3
{
  hapticThrottler = self->_hapticThrottler;
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NACEventThrottler *)hapticThrottler setValue:v4];
}

- (void)_setHapticIntensity:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [a3 floatValue];
  float v5 = NACSystemHapticValueForUIValue(v4);
  double v6 = NMLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    double v10 = v5;
    _os_log_impl(&dword_237CD4000, v6, OS_LOG_TYPE_DEFAULT, "Handling set haptic intensity. Setting haptic intensity: %f", (uint8_t *)&v9, 0xCu);
  }

  char v7 = [MEMORY[0x263F544E0] sharedAVSystemController];
  *(float *)&double v8 = v5;
  [v7 setVibeIntensityTo:v8];
  [(NACVolumeControllerLocal *)self updateCachedHapticState];
}

- (float)hapticIntensity
{
  float v5 = 0.0;
  int v2 = [MEMORY[0x263F544E0] sharedAVSystemController];
  if ([v2 getVibeIntensity:&v5]) {
    float v3 = NACUIValueForSystemHapticValue(v5);
  }
  else {
    float v3 = NAN;
  }

  return v3;
}

- (void)playPreview
{
  id v2 = +[NACXPCClient sharedClient];
  [v2 playAudioAndHapticPreview];
}

- (void)playDefaultHapticPreview
{
  id v2 = +[NACXPCClient sharedClient];
  [v2 playDefaultHapticPreview];
}

- (void)playProminentHapticPreview
{
  id v2 = +[NACXPCClient sharedClient];
  [v2 playProminentHapticPreview];
}

- (void)setProminentHapticEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NACVolumeControllerLocal *)self isProminentHapticEnabled] != a3)
  {
    [MEMORY[0x263F7FC68] _setWatchPrefersSalientToneAndVibration:v3];
    [(NACVolumeControllerLocal *)self updateCachedHapticState];
  }
}

- (BOOL)isProminentHapticEnabled
{
  return [MEMORY[0x263F7FC68] _watchPrefersSalientToneAndVibration];
}

- (void)_updateMutedStateFromVolumeController:(id)a3
{
  if (!self->_validCachedMutedValue)
  {
    self->_muted = [a3 isMuted];
    self->_validCachedMutedValue = 1;
  }
}

- (id)_volumeController
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__0;
  double v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__NACVolumeControllerLocal__volumeController__block_invoke;
  v5[3] = &unk_264CFCC00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__NACVolumeControllerLocal__volumeController__block_invoke(uint64_t a1)
{
}

- (NACVolumeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NACVolumeControllerDelegate *)WeakRetained;
}

- (BOOL)isSystemMuted
{
  return self->_systemMuted;
}

- (void)setSystemMuted:(BOOL)a3
{
  self->_systemMuted = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastNotifiedCurrentListeningMode, 0);
  objc_storeStrong((id *)&self->_lastNotifiedAvailableListeningModes, 0);
  objc_storeStrong((id *)&self->_mediaControlsVolumeController, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_hapticThrottler, 0);
  objc_storeStrong((id *)&self->_volumeThrottler, 0);
  objc_storeStrong((id *)&self->_volumeSetHistory, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_audioCategory, 0);
}

@end