@interface NFMPlayCommands
- (AVQueuePlayer)avQueuePlayer;
- (BOOL)_isDeviceLocked;
- (BOOL)_isFaceTimeOrCameraFrontmost;
- (BOOL)_isInFaceTimeCall;
- (BOOL)_isInPhoneOrFaceTimeCall;
- (BOOL)_isInternalInstall;
- (BOOL)_playSoundAtPath:(id)a3;
- (BOOL)flashEnabled;
- (BOOL)flashLEDIfAppropriate;
- (BOOL)flashLights;
- (BOOL)playFindLocallySound;
- (BOOL)playSoundAndFlash;
- (NFMPlayCommands)init;
- (NSTimer)flashScheduler;
- (int64_t)flashCount;
- (void)beginObservingTUChanges;
- (void)cancelAllAlerts:(id)a3;
- (void)dealloc;
- (void)flashLED;
- (void)playNearbySound;
- (void)playSoundAndFlash;
- (void)playbackStateChanged:(id)a3;
- (void)setAvQueuePlayer:(id)a3;
- (void)setFlashCount:(int64_t)a3;
- (void)setFlashEnabled:(BOOL)a3;
- (void)setFlashScheduler:(id)a3;
- (void)updateFlashState;
@end

@implementation NFMPlayCommands

- (NFMPlayCommands)init
{
  v8.receiver = self;
  v8.super_class = (Class)NFMPlayCommands;
  v2 = [(NFMPlayCommands *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(NFMPlayCommands *)v2 beginObservingTUChanges];
    if ([(NFMPlayCommands *)v3 _isInternalInstall])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)HandleAlertCancellation, @"3780-9e0b-fded-d875-7ab7-ac8e", 0, (CFNotificationSuspensionBehavior)0);
      v5 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v5, v3, (CFNotificationCallback)HandlePlaySound, @"1def-b278-bc84-97f5-8ec2-2b7a", 0, (CFNotificationSuspensionBehavior)0);
      v6 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v6, v3, (CFNotificationCallback)HandlePlaySoundAndLED, @"7e6e-6f4c-e43b-89f6-6a8c-af04", 0, (CFNotificationSuspensionBehavior)0);
    }
  }
  return v3;
}

- (void)dealloc
{
  if ([(NFMPlayCommands *)self _isInternalInstall])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"3780-9e0b-fded-d875-7ab7-ac8e", 0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, self, @"1def-b278-bc84-97f5-8ec2-2b7a", 0);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v5, self, @"7e6e-6f4c-e43b-89f6-6a8c-af04", 0);
  }
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)NFMPlayCommands;
  [(NFMPlayCommands *)&v7 dealloc];
}

- (BOOL)_isInternalInstall
{
  if (_isInternalInstall_onceToken != -1) {
    dispatch_once(&_isInternalInstall_onceToken, &__block_literal_global_0);
  }
  return _isInternalInstall___isInternalInstall;
}

uint64_t __37__NFMPlayCommands__isInternalInstall__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _isInternalInstall___isInternalInstall = result;
  return result;
}

- (BOOL)playFindLocallySound
{
  v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NanoLeash.framework"];
  v4 = [v3 pathForResource:@"ping" ofType:@"caf"];

  LOBYTE(self) = [(NFMPlayCommands *)self _playSoundAtPath:v4];
  return (char)self;
}

- (BOOL)_playSoundAtPath:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v4 isDirectory:0];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F28D90]) initAuxiliarySession];
    uint64_t v7 = *MEMORY[0x263F28D58];
    id v39 = 0;
    [v6 setCategory:v7 error:&v39];
    id v8 = v39;
    if (v8)
    {
      v9 = nfm_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[NFMPlayCommands _playSoundAtPath:](v9);
      }

      BOOL v10 = 0;
    }
    else
    {
      avQueuePlayer = self->_avQueuePlayer;
      if (avQueuePlayer)
      {
        v12 = [(AVQueuePlayer *)avQueuePlayer items];
        v13 = [(AVQueuePlayer *)self->_avQueuePlayer items];
        uint64_t v14 = [v13 count];

        if (v14)
        {
          v34 = v12;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v15 = v12;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v42 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v36;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v36 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "asset", v34);
                v21 = [v20 URL];

                if ([v21 isEqual:v5])
                {
                  v32 = nfm_log();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v41 = v21;
                    _os_log_impl(&dword_24011F000, v32, OS_LOG_TYPE_DEFAULT, "Already playing requested sound - %@, skipping", buf, 0xCu);
                  }

                  BOOL v10 = 0;
                  id v8 = 0;
                  goto LABEL_31;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v42 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          v12 = v34;
          id v8 = 0;
        }
        v22 = nfm_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24011F000, v22, OS_LOG_TYPE_DEFAULT, "Queing a sound", buf, 2u);
        }

        v23 = self->_avQueuePlayer;
        v24 = [MEMORY[0x263EFA800] playerItemWithURL:v5];
        [(AVQueuePlayer *)v23 insertItem:v24 afterItem:0];
      }
      else
      {
        v25 = (AVQueuePlayer *)[objc_alloc(MEMORY[0x263EFA860]) initWithURL:v5];
        v12 = self->_avQueuePlayer;
        self->_avQueuePlayer = v25;
      }

      [(AVQueuePlayer *)self->_avQueuePlayer setAllowsExternalPlayback:0];
      LODWORD(v26) = 1.0;
      [(AVQueuePlayer *)self->_avQueuePlayer setVolume:v26];
      [(AVQueuePlayer *)self->_avQueuePlayer _setClientName:@"LocatePhone"];
      [(AVQueuePlayer *)self->_avQueuePlayer setAudioSession:v6];
      if ([(NFMPlayCommands *)self _isInFaceTimeCall])
      {
        v27 = nfm_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24011F000, v27, OS_LOG_TYPE_DEFAULT, "User is in a FaceTime Video Call.", buf, 2u);
        }

        uint64_t v28 = 9;
      }
      else
      {
        uint64_t v28 = 10;
      }
      -[AVQueuePlayer _setClientPriority:](self->_avQueuePlayer, "_setClientPriority:", v28, v34);
      v29 = [MEMORY[0x263F08A00] defaultCenter];
      [v29 addObserver:self selector:sel_playbackStateChanged_ name:*MEMORY[0x263EFA050] object:0];

      v30 = [MEMORY[0x263F08A00] defaultCenter];
      [v30 addObserver:self selector:sel_playbackStateChanged_ name:*MEMORY[0x263EFA060] object:0];

      v31 = [MEMORY[0x263F08A00] defaultCenter];
      [v31 addObserver:self selector:sel_playbackStateChanged_ name:*MEMORY[0x263EFA108] object:0];

      [(AVQueuePlayer *)self->_avQueuePlayer play];
      BOOL v10 = 1;
    }
LABEL_31:
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)playSoundAndFlash
{
  BOOL v3 = [(NFMPlayCommands *)self playFindLocallySound];
  id v4 = nfm_log();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "########### Played Sound", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[NFMPlayCommands playSoundAndFlash](v5);
  }

  [(NFMPlayCommands *)self flashLights];
  return v3;
}

- (BOOL)flashLights
{
  BOOL v2 = [(NFMPlayCommands *)self flashLEDIfAppropriate];
  system("/System/Library/PrivateFrameworks/NanoLeash.framework/findme");
  return v2;
}

- (void)playNearbySound
{
  if (CFPreferencesGetAppBooleanValue(@"disableNearbySound", @"com.apple.internal.watchprecisionfinding", 0)&& [(NFMPlayCommands *)self _isInternalInstall])
  {
    BOOL v3 = nfm_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "########### Watch is nearby, default set, skipping sound", buf, 2u);
    }
  }
  else
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 pathForResource:@"chirp" ofType:@"caf"];

    [(NFMPlayCommands *)self _playSoundAtPath:v5];
  }
}

- (BOOL)flashLEDIfAppropriate
{
  if (![(NFMPlayCommands *)self _isDeviceLocked]
    || [(NFMPlayCommands *)self _isFaceTimeOrCameraFrontmost]
    || [(NFMPlayCommands *)self _isInFaceTimeCall])
  {
    if (self->_flashEnabled)
    {
      [(NFMPlayCommands *)self setFlashEnabled:0];
      self->_flashEnabled = 0;
    }
    [(NSTimer *)self->_flashScheduler invalidate];
    flashScheduler = self->_flashScheduler;
    self->_flashScheduler = 0;

    BOOL result = 0;
    self->_flashCount = 0;
  }
  else
  {
    [(NFMPlayCommands *)self flashLED];
    return 1;
  }
  return result;
}

- (void)cancelAllAlerts:(id)a3
{
  [(AVQueuePlayer *)self->_avQueuePlayer pause];
  avQueuePlayer = self->_avQueuePlayer;
  self->_avQueuePlayer = 0;

  [(NSTimer *)self->_flashScheduler invalidate];
  flashScheduler = self->_flashScheduler;
  self->_flashScheduler = 0;

  self->_flashCount = 0;
  self->_flashEnabled = 0;
  [(NFMPlayCommands *)self setFlashEnabled:0];
}

- (void)beginObservingTUChanges
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_cancelAllAlerts_ name:*MEMORY[0x263F7E310] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_cancelAllAlerts_ name:*MEMORY[0x263F7E328] object:0];

  id v5 = (id)[MEMORY[0x263F7E1A0] sharedInstance];
}

- (void)playbackStateChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = nfm_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 name];
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_24011F000, v5, OS_LOG_TYPE_DEFAULT, "Playback state changed: %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v7 = [v4 name];
  uint64_t v8 = *MEMORY[0x263EFA108];
  int v9 = [v7 isEqualToString:*MEMORY[0x263EFA108]];

  if (v9) {
    [(AVQueuePlayer *)self->_avQueuePlayer pause];
  }
  avQueuePlayer = self->_avQueuePlayer;
  self->_avQueuePlayer = 0;

  v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 removeObserver:self name:*MEMORY[0x263EFA050] object:0];

  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 removeObserver:self name:*MEMORY[0x263EFA060] object:0];

  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 removeObserver:self name:v8 object:0];
}

- (void)flashLED
{
  BOOL v3 = nfm_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_24011F000, v3, OS_LOG_TYPE_DEFAULT, "########### Flash Torch", v13, 2u);
  }

  flashScheduler = self->_flashScheduler;
  self->_flashCount += 10;
  if (!flashScheduler)
  {
    id v5 = objc_alloc(MEMORY[0x263EFFA20]);
    v6 = [MEMORY[0x263EFF910] date];
    uint64_t v7 = [v6 dateByAddingTimeInterval:0.2];
    uint64_t v8 = (NSTimer *)[v5 initWithFireDate:v7 interval:self target:sel_updateFlashState selector:0 userInfo:1 repeats:0.2];
    int v9 = self->_flashScheduler;
    self->_flashScheduler = v8;

    BOOL v10 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v10 addTimer:self->_flashScheduler forMode:*MEMORY[0x263EFF588]];

    v11 = [MEMORY[0x263EFF9F0] currentRunLoop];
    v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.2];
    [v11 runUntilDate:v12];
  }
}

- (void)setFlashEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = nfm_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v3;
    _os_log_impl(&dword_24011F000, v4, OS_LOG_TYPE_DEFAULT, "########### setFlashEnabled: %d", buf, 8u);
  }

  id v5 = [MEMORY[0x263EFA598] defaultDeviceWithMediaType:*MEMORY[0x263EF9D48]];
  if ([v5 hasTorch])
  {
    id v8 = 0;
    [v5 lockForConfiguration:&v8];
    v6 = v8;
    [v5 setTorchMode:v3];
    [v5 unlockForConfiguration];
    if (v6)
    {
      uint64_t v7 = nfm_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(NFMPlayCommands *)(uint64_t)v6 setFlashEnabled:v7];
      }
    }
  }
  else
  {
    v6 = nfm_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NFMPlayCommands setFlashEnabled:]((uint64_t)v5, v6);
    }
  }
}

- (void)updateFlashState
{
  int64_t flashCount = self->_flashCount;
  id v4 = nfm_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (flashCount <= 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24011F000, v4, OS_LOG_TYPE_DEFAULT, "########### Cleared Flash", buf, 2u);
    }

    [(NSTimer *)self->_flashScheduler invalidate];
    flashScheduler = self->_flashScheduler;
    self->_flashScheduler = 0;

    self->_int64_t flashCount = 0;
    self->_flashEnabled = 0;
    [(NFMPlayCommands *)self setFlashEnabled:0];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_24011F000, v4, OS_LOG_TYPE_DEFAULT, "########### Schedule Flash", v8, 2u);
    }

    BOOL v6 = !self->_flashEnabled;
    self->_flashEnabled ^= 1u;
    [(NFMPlayCommands *)self setFlashEnabled:v6];
    --self->_flashCount;
  }
}

- (BOOL)_isDeviceLocked
{
  return SBSGetScreenLockStatus() != 0;
}

- (BOOL)_isFaceTimeOrCameraFrontmost
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v19 = [MEMORY[0x263EFFA08] setWithArray:&unk_26F3F6890];
  uint64_t v2 = objc_msgSend(MEMORY[0x263F645D8], "predicateMatchingBundleIdentifiers:");
  BOOL v3 = (void *)MEMORY[0x263F645E0];
  id v4 = [MEMORY[0x263F645E8] descriptor];
  uint64_t v18 = (void *)v2;
  BOOL v5 = [v3 statesForPredicate:v2 withDescriptor:v4 error:0];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v12 = nfm_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [v11 process];
          int v14 = [v13 bundle];
          id v15 = [v14 identifier];
          uint64_t v16 = [v11 description];
          *(_DWORD *)buf = 138412546;
          double v26 = v15;
          __int16 v27 = 2112;
          uint64_t v28 = v16;
          _os_log_impl(&dword_24011F000, v12, OS_LOG_TYPE_DEFAULT, "########### Application state: %@, %@", buf, 0x16u);
        }
        v8 |= [v11 taskState] == 4;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)_isInFaceTimeCall
{
  uint64_t v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  BOOL v3 = [v2 currentVideoCallCount] != 0;

  return v3;
}

- (BOOL)_isInPhoneOrFaceTimeCall
{
  BOOL v3 = [MEMORY[0x263F7E1A0] sharedInstance];
  id v4 = [v3 currentCalls];
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(NFMPlayCommands *)self _isInFaceTimeCall];
  }

  return v5;
}

- (NSTimer)flashScheduler
{
  return self->_flashScheduler;
}

- (void)setFlashScheduler:(id)a3
{
}

- (int64_t)flashCount
{
  return self->_flashCount;
}

- (void)setFlashCount:(int64_t)a3
{
  self->_int64_t flashCount = a3;
}

- (BOOL)flashEnabled
{
  return self->_flashEnabled;
}

- (AVQueuePlayer)avQueuePlayer
{
  return self->_avQueuePlayer;
}

- (void)setAvQueuePlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avQueuePlayer, 0);
  objc_storeStrong((id *)&self->_flashScheduler, 0);
}

- (void)_playSoundAtPath:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24011F000, log, OS_LOG_TYPE_ERROR, "Unable to Category AVAudioSessionCategoryFindMyPhone", v1, 2u);
}

- (void)playSoundAndFlash
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24011F000, log, OS_LOG_TYPE_ERROR, "########### Failed to play sound!", v1, 2u);
}

- (void)setFlashEnabled:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_24011F000, log, OS_LOG_TYPE_ERROR, "########### Error adjusting flash: %@ (For Device: %@)", (uint8_t *)&v3, 0x16u);
}

- (void)setFlashEnabled:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24011F000, a2, OS_LOG_TYPE_ERROR, "########### No Torch! (%@)", (uint8_t *)&v2, 0xCu);
}

@end