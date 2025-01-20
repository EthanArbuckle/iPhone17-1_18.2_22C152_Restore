@interface NACVolumeControllerDemo
- (BOOL)isMuted;
- (BOOL)isProminentHapticEnabled;
- (BOOL)isSystemMuted;
- (BOOL)isVolumeControlAvailable;
- (BOOL)isVolumeWarningEnabled;
- (NACVolumeControllerDelegate)delegate;
- (NACVolumeControllerDemo)init;
- (NACVolumeControllerDemo)initWithAudioCategory:(id)a3;
- (NSOrderedSet)availableListeningModes;
- (NSString)currentListeningMode;
- (float)EUVolumeLimit;
- (float)hapticIntensity;
- (float)volumeValue;
- (id)_volumeDictionary;
- (int64_t)hapticState;
- (int64_t)volumeWarningState;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_persistVolumeValue:(id)a3;
- (void)_setNeedsVolumeReload;
- (void)allowUserToExceedEUVolumeLimit;
- (void)beginObservingListeningModes;
- (void)beginObservingVolume;
- (void)dealloc;
- (void)endObservingListeningModes;
- (void)setCurrentListeningMode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHapticIntensity:(float)a3;
- (void)setHapticState:(int64_t)a3;
- (void)setProminentHapticEnabled:(BOOL)a3;
- (void)setSystemMuted:(BOOL)a3;
- (void)setVolumeValue:(float)a3;
- (void)setVolumeValue:(float)a3 muted:(BOOL)a4 overrideEULimit:(BOOL)a5;
@end

@implementation NACVolumeControllerDemo

- (NACVolumeControllerDemo)init
{
  return 0;
}

- (NACVolumeControllerDemo)initWithAudioCategory:(id)a3
{
  v4 = (__CFString *)a3;
  v19.receiver = self;
  v19.super_class = (Class)NACVolumeControllerDemo;
  v5 = [(NACVolumeControllerDemo *)&v19 init];
  v6 = v5;
  if (v5)
  {
    if (v4) {
      v7 = v4;
    }
    else {
      v7 = @"Audio/Video";
    }
    objc_storeStrong((id *)&v5->_audioCategory, v7);
    objc_initWeak(&location, v6);
    uint64_t v8 = objc_opt_new();
    defaultsThrottler = v6->_defaultsThrottler;
    v6->_defaultsThrottler = (NACEventThrottler *)v8;

    [(NACEventThrottler *)v6->_defaultsThrottler setMinimumDelay:1.0];
    v10 = v6->_defaultsThrottler;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __49__NACVolumeControllerDemo_initWithAudioCategory___block_invoke;
    v16 = &unk_264CFCC28;
    objc_copyWeak(&v17, &location);
    [(NACEventThrottler *)v10 setEventBlock:&v13];
    v11 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v13, v14, v15, v16);
    [v11 addObserver:v6 selector:sel__applicationDidBecomeActiveNotification_ name:*MEMORY[0x263F1D038] object:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __49__NACVolumeControllerDemo_initWithAudioCategory___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _persistVolumeValue:v3];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NACVolumeControllerDemo;
  [(NACVolumeControllerDemo *)&v4 dealloc];
}

- (void)beginObservingVolume
{
  [(NACVolumeControllerDemo *)self _setNeedsVolumeReload];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 volumeControllerDidUpdateVolumeControlAvailibility:self];
  }
  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 volumeControllerDidUpdateVolumeValue:self];
  }
}

- (void)beginObservingListeningModes
{
  self->_observingListeningModes = 1;
}

- (void)endObservingListeningModes
{
  self->_observingListeningModes = 0;
}

- (float)volumeValue
{
  volumeValue = self->_volumeValue;
  if (!volumeValue)
  {
    char v4 = [(NACVolumeControllerDemo *)self _volumeDictionary];
    id v5 = [v4 objectForKeyedSubscript:self->_audioCategory];
    id v6 = v5;
    if (v5) {
      char v7 = v5;
    }
    else {
      char v7 = (NSNumber *)&unk_26EAE3EE0;
    }
    id v8 = self->_volumeValue;
    self->_volumeValue = v7;

    volumeValue = self->_volumeValue;
  }

  [(NSNumber *)volumeValue floatValue];
  return result;
}

- (BOOL)isMuted
{
  return 0;
}

- (BOOL)isVolumeControlAvailable
{
  return 1;
}

- (float)EUVolumeLimit
{
  return 1.0;
}

- (BOOL)isVolumeWarningEnabled
{
  return 0;
}

- (int64_t)volumeWarningState
{
  return 0;
}

- (void)setVolumeValue:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  char v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  volumeValue = self->_volumeValue;
  self->_volumeValue = v4;

  defaultsThrottler = self->_defaultsThrottler;
  char v7 = self->_volumeValue;

  [(NACEventThrottler *)defaultsThrottler setValue:v7];
}

- (void)setVolumeValue:(float)a3 muted:(BOOL)a4 overrideEULimit:(BOOL)a5
{
  BOOL v5 = a4;
  -[NACVolumeControllerDemo setVolumeValue:](self, "setVolumeValue:", a4, a5);

  [(NACVolumeControllerDemo *)self setMuted:v5];
}

- (void)allowUserToExceedEUVolumeLimit
{
  self->_allowUserToExceedEUVolumeLimit = 1;
}

- (NSOrderedSet)availableListeningModes
{
  return 0;
}

- (NSString)currentListeningMode
{
  currentListeningMode = self->_currentListeningMode;
  if (!currentListeningMode)
  {
    char v4 = [(NACVolumeControllerDemo *)self availableListeningModes];
    BOOL v5 = [v4 firstObject];
    id v6 = self->_currentListeningMode;
    self->_currentListeningMode = v5;

    currentListeningMode = self->_currentListeningMode;
  }

  return currentListeningMode;
}

- (void)setCurrentListeningMode:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__NACVolumeControllerDemo_setCurrentListeningMode___block_invoke;
  v7[3] = &unk_264CFC3B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x263EF83A0], v7);
}

void __51__NACVolumeControllerDemo_setCurrentListeningMode___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 56));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
      [v5 volumeControllerDidUpdateCurrentListeningMode:*(void *)(a1 + 32)];
    }
  }
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NACVolumeControllerDemo__applicationDidBecomeActiveNotification___block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __67__NACVolumeControllerDemo__applicationDidBecomeActiveNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setNeedsVolumeReload];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [v4 volumeControllerDidUpdateVolumeValue:*(void *)(a1 + 32)];
  }
}

- (void)_setNeedsVolumeReload
{
  self->_volumeValue = 0;
  MEMORY[0x270F9A758]();
}

- (void)_persistVolumeValue:(id)a3
{
  id v4 = a3;
  id v5 = [(NACVolumeControllerDemo *)self _volumeDictionary];
  value = (void *)[v5 mutableCopy];

  [value setObject:v4 forKeyedSubscript:self->_audioCategory];
  CFPreferencesSetAppValue(@"DemoVolume", value, @"com.apple.NanoAudioControl");
  CFPreferencesAppSynchronize(@"com.apple.NanoAudioControl");
}

- (id)_volumeDictionary
{
  CFPreferencesAppSynchronize(@"com.apple.NanoAudioControl");
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"DemoVolume", @"com.apple.NanoAudioControl");
  char v3 = (void *)[v2 copy];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)MEMORY[0x263EFFA78];
  }

  return v4;
}

- (NACVolumeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NACVolumeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (float)hapticIntensity
{
  return self->_hapticIntensity;
}

- (void)setHapticIntensity:(float)a3
{
  self->_hapticIntensity = a3;
}

- (BOOL)isSystemMuted
{
  return self->_systemMuted;
}

- (void)setSystemMuted:(BOOL)a3
{
  self->_systemMuted = a3;
}

- (BOOL)isProminentHapticEnabled
{
  return self->_prominentHapticEnabled;
}

- (void)setProminentHapticEnabled:(BOOL)a3
{
  self->_prominentHapticEnabled = a3;
}

- (int64_t)hapticState
{
  return self->_hapticState;
}

- (void)setHapticState:(int64_t)a3
{
  self->_hapticState = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentListeningMode, 0);
  objc_storeStrong((id *)&self->_volumeValue, 0);
  objc_storeStrong((id *)&self->_defaultsThrottler, 0);

  objc_storeStrong((id *)&self->_audioCategory, 0);
}

@end