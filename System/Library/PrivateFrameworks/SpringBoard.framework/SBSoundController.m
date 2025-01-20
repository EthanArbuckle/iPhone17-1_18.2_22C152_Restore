@interface SBSoundController
+ (SBSoundController)sharedInstance;
- (BOOL)_playFeedback:(id)a3;
- (BOOL)_playSystemSound:(id)a3;
- (BOOL)_playToneAlert:(id)a3;
- (BOOL)handleVolumeButtonDownEvent;
- (BOOL)isPlaying:(id)a3;
- (BOOL)isPlayingAnySound;
- (BOOL)playSound:(id)a3 environments:(int64_t)a4 completion:(id)a5;
- (BOOL)playSoundWithDefaultEnvironment:(id)a3;
- (BOOL)stopAllSounds;
- (BOOL)stopSound:(id)a3;
- (SBSoundController)init;
- (id)_activateFeedback:(id)a3 forReason:(id)a4;
- (id)activateSound:(id)a3 forReason:(id)a4;
- (void)_beginPendingCallbacksBlock;
- (void)_cleanupSystemSound:(unsigned int)a3 andKill:(BOOL)a4;
- (void)_cleanupToneAlertForSound:(id)a3 andKill:(BOOL)a4;
- (void)_configureWithFeedbackType:(int64_t)a3;
- (void)_endPendingCallbacksBlock;
- (void)_enqueueCallback:(id)a3;
- (void)_ringerStateChanged:(id)a3;
- (void)_soundDidFinishPlaying:(id)a3;
- (void)_soundDidStartPlaying:(id)a3;
- (void)addObserver:(id)a3;
- (void)handleVolumeButtonDownEvent;
- (void)isPlayingAnySound;
- (void)removeObserver:(id)a3;
- (void)stopAllSounds;
@end

@implementation SBSoundController

+ (SBSoundController)sharedInstance
{
  if (sharedInstance_pred_0 != -1) {
    dispatch_once(&sharedInstance_pred_0, &__block_literal_global_229);
  }
  v2 = (void *)sharedInstance___sharedInstance_16;
  return (SBSoundController *)v2;
}

uint64_t __35__SBSoundController_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBSoundController);
  v1 = (void *)sharedInstance___sharedInstance_16;
  sharedInstance___sharedInstance_16 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBSoundController)init
{
  v15.receiver = self;
  v15.super_class = (Class)SBSoundController;
  v2 = [(SBSoundController *)&v15 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    soundsBySystemSoundIDs = v2->_soundsBySystemSoundIDs;
    v2->_soundsBySystemSoundIDs = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    toneAlertsBySounds = v2->_toneAlertsBySounds;
    v2->_toneAlertsBySounds = (NSMapTable *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    soundsByToneAlerts = v2->_soundsByToneAlerts;
    v2->_soundsByToneAlerts = (NSMapTable *)v7;

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__ringerStateChanged_ name:@"SBRingerChangedNotification" object:0];
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendedCallbacks = v2->_pendedCallbacks;
    v2->_pendedCallbacks = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    usedNotificationTypes = v2->_usedNotificationTypes;
    v2->_usedNotificationTypes = v12;
  }
  return v2;
}

- (BOOL)isPlayingAnySound
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[SBSoundController isPlayingAnySound]();
  }
  return [(NSMutableDictionary *)self->_soundsBySystemSoundIDs count]
      || [(NSMapTable *)self->_toneAlertsBySounds count] != 0;
}

- (BOOL)isPlaying:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[SBSoundController isPlaying:]();
  }
  uint64_t v5 = [v4 soundType];
  if (v5 == 3)
  {
    v6 = [(NSMapTable *)self->_toneAlertsBySounds objectForKey:v4];
    char v8 = v6 != 0;
  }
  else
  {
    if (v5)
    {
      char v8 = 0;
      goto LABEL_8;
    }
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "_resolvedSystemSoundID"));
    uint64_t v7 = [(NSMutableDictionary *)self->_soundsBySystemSoundIDs objectForKey:v6];
    char v8 = [v7 isEqual:v4];
  }
LABEL_8:

  return v8;
}

- (id)activateSound:(id)a3 forReason:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[SBSoundController activateSound:forReason:]();
  }
  if (!v7)
  {
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  if (!v8)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reason != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSoundController activateSound:forReason:](a2, (uint64_t)self, (uint64_t)v14);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8B785ECLL);
  }
  v9 = SBLogSound();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v7;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Activating sound: %{public}@ for reason: %{public}@", buf, 0x16u);
  }

  uint64_t v10 = [v7 soundType];
  v11 = 0;
  if (v10 && v10 != 3)
  {
    if (v10 == 5)
    {
      v11 = [(SBSoundController *)self _activateFeedback:v7 forReason:v8];
      goto LABEL_14;
    }
    v12 = SBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBSoundController activateSound:forReason:]();
    }

    goto LABEL_13;
  }
LABEL_14:

  return v11;
}

- (BOOL)playSoundWithDefaultEnvironment:(id)a3
{
  return [(SBSoundController *)self playSound:a3 environments:1 completion:0];
}

- (BOOL)playSound:(id)a3 environments:(int64_t)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
LABEL_28:
    BOOL v20 = 0;
    goto LABEL_29;
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[SBSoundController playSound:environments:completion:]();
  }
  uint64_t v10 = [(id)SBApp notificationDispatcher];
  if ([v10 isCarDestinationActive]) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }

  v12 = SBLogSound();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if ((v11 & a4) == 0)
  {
    if (v13)
    {
      int v22 = 67109634;
      *(_DWORD *)v23 = a4;
      *(_WORD *)&v23[4] = 1024;
      *(_DWORD *)&v23[6] = v11;
      *(_WORD *)v24 = 2114;
      *(void *)&v24[2] = v8;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "SBSoundController: not playing sound - environments=%i allowed=%i -> %{public}@", (uint8_t *)&v22, 0x18u);
    }

    goto LABEL_28;
  }
  if (v13)
  {
    int v22 = 138543362;
    *(void *)v23 = v8;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "Play sound: %{public}@", (uint8_t *)&v22, 0xCu);
  }

  [(SBSoundController *)self stopSound:v8];
  uint64_t v14 = [v8 soundType];
  switch(v14)
  {
    case 5:
      BOOL v15 = [(SBSoundController *)self _playFeedback:v8];
      goto LABEL_18;
    case 3:
      BOOL v15 = [(SBSoundController *)self _playToneAlert:v8];
      goto LABEL_18;
    case 0:
      BOOL v15 = [(SBSoundController *)self _playSystemSound:v8];
LABEL_18:
      BOOL v16 = v15;
      goto LABEL_22;
  }
  __int16 v17 = SBLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[SBSoundController playSound:environments:completion:]();
  }

  BOOL v16 = 0;
LABEL_22:
  id v18 = SBLogSound();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = @"failed to play";
    int v22 = 138543874;
    if (v16) {
      uint64_t v19 = @"played";
    }
    *(void *)v23 = v19;
    *(_WORD *)&v23[8] = 1024;
    *(_DWORD *)v24 = a4;
    *(_WORD *)&v24[4] = 2114;
    *(void *)&v24[6] = v8;
    _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "SBSoundController: %{public}@ sound - environments=%i -> %{public}@", (uint8_t *)&v22, 0x1Cu);
  }

  if (!v16) {
    goto LABEL_28;
  }
  [v8 _setCompletionBlock:v9];
  [(SBSoundController *)self _soundDidStartPlaying:v8];
  BOOL v20 = 1;
LABEL_29:

  return v20;
}

- (BOOL)stopSound:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[SBSoundController stopSound:]();
  }
  BOOL v5 = [(SBSoundController *)self isPlaying:v4];
  if (v5)
  {
    v6 = SBLogSound();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "SBSoundController: stopping sound -> %{public}@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = [v4 soundType];
    if (v7 != 5)
    {
      if (v7 == 3)
      {
        [(SBSoundController *)self _cleanupToneAlertForSound:v4 andKill:1];
      }
      else if (v7)
      {
        id v8 = SBLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[SBSoundController stopSound:]();
        }
      }
      else
      {
        -[SBSoundController _cleanupSystemSound:andKill:](self, "_cleanupSystemSound:andKill:", [v4 _resolvedSystemSoundID], 1);
      }
    }
  }

  return v5;
}

- (BOOL)stopAllSounds
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[SBSoundController stopAllSounds]();
  }
  id v4 = SBLogSound();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "SBSoundController: stopping all sounds", buf, 2u);
  }

  if ([(NSMutableDictionary *)self->_soundsBySystemSoundIDs count]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(NSMapTable *)self->_toneAlertsBySounds count] != 0;
  }
  [(SBSoundController *)self _beginPendingCallbacksBlock];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v6 = [(NSMutableDictionary *)self->_soundsBySystemSoundIDs allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        -[SBSoundController _cleanupSystemSound:andKill:](self, "_cleanupSystemSound:andKill:", [*(id *)(*((void *)&v24 + 1) + 8 * i) unsignedIntValue], 1);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v8);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = (void *)[(NSMapTable *)self->_toneAlertsBySounds copy];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        [(SBSoundController *)self _cleanupToneAlertForSound:*(void *)(*((void *)&v20 + 1) + 8 * j) andKill:0];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v13);
  }

  int v16 = [MEMORY[0x1E4FAF5E0] _stopAllAlerts] | v5;
  if ([(NSMutableDictionary *)self->_soundsBySystemSoundIDs count]
    || [(NSMapTable *)self->_soundsByToneAlerts count]
    || [(NSMapTable *)self->_toneAlertsBySounds count])
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBSoundController.m", 246, @"systemSounds=%@ : tones=%@ (alerts=%@)", self->_soundsBySystemSoundIDs, self->_soundsByToneAlerts, self->_toneAlertsBySounds object file lineNumber description];

    if (!v16) {
      goto LABEL_28;
    }
  }
  else if (!v16)
  {
    goto LABEL_28;
  }
  __int16 v17 = SBLogSound();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_INFO, "SBSoundController: stopped all sounds", buf, 2u);
  }

LABEL_28:
  [(SBSoundController *)self _endPendingCallbacksBlock];
  return v16;
}

- (void)addObserver:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[SBSoundController addObserver:]();
  }
  id v4 = v9;
  if (v9)
  {
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v9];
    id v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        uint64_t v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      [(NSHashTable *)observers addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[SBSoundController removeObserver:]();
  }
  id v4 = v5;
  if (v5)
  {
    [(NSHashTable *)self->_observers removeObject:v5];
    id v4 = v5;
  }
}

- (BOOL)handleVolumeButtonDownEvent
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[SBSoundController handleVolumeButtonDownEvent]();
  }
  v3 = SBLogSound();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Volume button down", v5, 2u);
  }

  return [(SBSoundController *)self stopAllSounds];
}

- (void)_cleanupSystemSound:(unsigned int)a3 andKill:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[SBSoundController _cleanupSystemSound:andKill:]();
  }
  id v8 = [NSNumber numberWithUnsignedInt:v5];
  AudioServicesRemoveSystemSoundCompletion(v5);
  if (v4) {
    AudioServicesStopSystemSound();
  }
  uint64_t v7 = [(NSMutableDictionary *)self->_soundsBySystemSoundIDs objectForKey:v8];
  if (v7)
  {
    [(NSMutableDictionary *)self->_soundsBySystemSoundIDs removeObjectForKey:v8];
    [(SBSoundController *)self _soundDidFinishPlaying:v7];
  }
}

- (void)_cleanupToneAlertForSound:(id)a3 andKill:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  v6 = -[NSMapTable objectForKey:](self->_toneAlertsBySounds, "objectForKey:");
  uint64_t v7 = v6;
  if (v6)
  {
    if (v4) {
      [v6 stop];
    }
    [(NSMapTable *)self->_toneAlertsBySounds removeObjectForKey:v8];
    [(NSMapTable *)self->_soundsByToneAlerts removeObjectForKey:v7];
    [(SBSoundController *)self _soundDidFinishPlaying:v8];
  }
}

- (BOOL)_playSystemSound:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  SystemSoundID v17 = [v4 systemSoundID];
  uint64_t v5 = [v4 songPath];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    strlen((const char *)[v7 UTF8String]);
    if (AudioServicesCreateSystemSoundIDWithPath())
    {
      id v8 = SBLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SBSoundController _playSystemSound:]((uint64_t)v7, v8);
      }
    }
  }
  uint64_t v9 = [v4 vibrationPattern];
  int v10 = (void *)v9;
  if (!v17 && v9) {
    SystemSoundID v17 = 4095;
  }
  id v11 = objc_msgSend(NSNumber, "numberWithInt:");
  [v4 soundBehavior];
  [(SBSoundController *)self _cleanupSystemSound:v17 andKill:1];
  Current = CFRunLoopGetCurrent();
  OSStatus v13 = AudioServicesAddSystemSoundCompletion(v17, Current, (CFStringRef)*MEMORY[0x1E4F1D410], (AudioServicesSystemSoundCompletionProc)SystemSoundCompleted, 0);
  if (v13)
  {
    uint64_t v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v4;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Failed to register a completion handler for sound: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    [v4 _setResolvedSoundID:v17];
    [(NSMutableDictionary *)self->_soundsBySystemSoundIDs setObject:v4 forKey:v11];
    BOOL v15 = SBLogSound();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v17;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "Play SystemSoundID: %ul", buf, 8u);
    }

    AudioServicesPlaySystemSoundWithVibration();
  }

  return v13 == 0;
}

- (BOOL)_playToneAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 toneAlert];
  if (v5)
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    int v10 = __36__SBSoundController__playToneAlert___block_invoke;
    id v11 = &unk_1E6B05B38;
    id v6 = v4;
    id v12 = v6;
    OSStatus v13 = self;
    [v5 playWithCompletionHandler:&v8];
    -[NSMapTable setObject:forKey:](self->_toneAlertsBySounds, "setObject:forKey:", v5, v6, v8, v9, v10, v11);
    [(NSMapTable *)self->_soundsByToneAlerts setObject:v6 forKey:v5];
  }
  return v5 != 0;
}

void __36__SBSoundController__playToneAlert___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SBSoundController__playToneAlert___block_invoke_2;
  v7[3] = &unk_1E6AF6F98;
  uint64_t v11 = a2;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 40);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __36__SBSoundController__playToneAlert___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 56) == 5)
  {
    v2 = SBLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __36__SBSoundController__playToneAlert___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  return [*(id *)(a1 + 48) _cleanupToneAlertForSound:*(void *)(a1 + 32) andKill:0];
}

- (id)_activateFeedback:(id)a3 forReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SBSoundController _configureWithFeedbackType:](self, "_configureWithFeedbackType:", [v6 eventType]);
  uint64_t v8 = self->_hapticFeedbackGenerator;
  [(UINotificationFeedbackGenerator *)v8 activateWithCompletionBlock:0];
  id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__SBSoundController__activateFeedback_forReason___block_invoke;
  v15[3] = &unk_1E6B05B60;
  id v16 = v6;
  id v17 = v7;
  id v18 = v8;
  uint64_t v10 = v8;
  id v11 = v7;
  id v12 = v6;
  OSStatus v13 = (void *)[v9 initWithIdentifier:@"SBSoundController-Activation" forReason:v11 invalidationBlock:v15];

  return v13;
}

uint64_t __49__SBSoundController__activateFeedback_forReason___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = SBLogSound();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Deactivating feedback: %{public}@ (activated for reason: %{public}@)", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 48) deactivate];
}

- (void)_configureWithFeedbackType:(int64_t)a3
{
  usedNotificationTypes = self->_usedNotificationTypes;
  int v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  LOBYTE(usedNotificationTypes) = [(NSMutableSet *)usedNotificationTypes containsObject:v6];

  if ((usedNotificationTypes & 1) == 0)
  {
    uint64_t v7 = self->_usedNotificationTypes;
    __int16 v8 = [NSNumber numberWithInteger:a3];
    [(NSMutableSet *)v7 addObject:v8];

    id v9 = objc_alloc(MEMORY[0x1E4F42C10]);
    id v12 = [MEMORY[0x1E4F43268] privateConfigurationForTypes:self->_usedNotificationTypes];
    uint64_t v10 = (UINotificationFeedbackGenerator *)[v9 initWithConfiguration:v12];
    hapticFeedbackGenerator = self->_hapticFeedbackGenerator;
    self->_hapticFeedbackGenerator = v10;
  }
}

- (BOOL)_playFeedback:(id)a3
{
  uint64_t v4 = [a3 eventType];
  [(SBSoundController *)self _configureWithFeedbackType:v4];
  [(UINotificationFeedbackGenerator *)self->_hapticFeedbackGenerator _privateNotificationOccurred:v4];
  return 1;
}

- (void)_ringerStateChanged:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"SBRingerChangedRingerMutedUserInfoKey"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    uint64_t v7 = SBLogSound();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v8 = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Ringer was muted.", v8, 2u);
    }

    [(SBSoundController *)self stopAllSounds];
  }
}

- (void)_soundDidStartPlaying:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SBSoundController__soundDidStartPlaying___block_invoke;
  v6[3] = &unk_1E6AF5290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBSoundController *)self _enqueueCallback:v6];
}

void __43__SBSoundController__soundDidStartPlaying___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 48) count])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "allObjects", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            [v7 soundDidBeginPlaying:*(void *)(a1 + 40)];
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_soundDidFinishPlaying:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _completionBlock];
  if (v5)
  {
    [(SBSoundController *)self _enqueueCallback:v5];
    [v4 _setCompletionBlock:0];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SBSoundController__soundDidFinishPlaying___block_invoke;
  v7[3] = &unk_1E6AF5290;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SBSoundController *)self _enqueueCallback:v7];
}

void __44__SBSoundController__soundDidFinishPlaying___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 48) count])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "allObjects", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (objc_opt_respondsToSelector()) {
            [v7 soundDidFinishPlaying:*(void *)(a1 + 40)];
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)_beginPendingCallbacksBlock
{
}

- (void)_endPendingCallbacksBlock
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t pendingCallbacks = self->_pendingCallbacks;
  if (!pendingCallbacks)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBSoundController.m" lineNumber:458 description:@"unbalanced begin/end for pending callbacks"];

    unint64_t pendingCallbacks = self->_pendingCallbacks;
  }
  unint64_t v4 = pendingCallbacks - 1;
  self->_unint64_t pendingCallbacks = v4;
  if (!v4)
  {
    uint64_t v5 = (void *)[(NSMutableArray *)self->_pendedCallbacks copy];
    [(NSMutableArray *)self->_pendedCallbacks removeAllObjects];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_enqueueCallback:(id)a3
{
  if (self->_pendingCallbacks)
  {
    pendedCallbacks = self->_pendedCallbacks;
    id v6 = (id)[a3 copy];
    unint64_t v4 = (void *)MEMORY[0x1D948C7A0]();
    [(NSMutableArray *)pendedCallbacks addObject:v4];
  }
  else
  {
    uint64_t v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendedCallbacks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_soundsByToneAlerts, 0);
  objc_storeStrong((id *)&self->_toneAlertsBySounds, 0);
  objc_storeStrong((id *)&self->_hapticFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_usedNotificationTypes, 0);
  objc_storeStrong((id *)&self->_soundsBySystemSoundIDs, 0);
}

- (void)isPlayingAnySound
{
}

- (void)isPlaying:.cold.1()
{
}

- (void)activateSound:(uint64_t)a3 forReason:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  long long v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  long long v15 = @"SBSoundController.m";
  __int16 v16 = 1024;
  int v17 = 125;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)activateSound:forReason:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_21(&dword_1D85BA000, v0, v1, "%s doesn't know how to activate this sound type: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)activateSound:forReason:.cold.3()
{
}

- (void)playSound:environments:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_21(&dword_1D85BA000, v0, v1, "%s doesn't know how to play this sound type: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)playSound:environments:completion:.cold.2()
{
}

- (void)stopSound:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_21(&dword_1D85BA000, v0, v1, "%s doesn't know how to kill this sound type: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)stopSound:.cold.2()
{
}

- (void)stopAllSounds
{
}

- (void)addObserver:.cold.1()
{
}

- (void)removeObserver:.cold.1()
{
}

- (void)handleVolumeButtonDownEvent
{
}

- (void)_cleanupSystemSound:andKill:.cold.1()
{
}

- (void)_playSystemSound:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "No alert sound found at path '%{public}@'", (uint8_t *)&v2, 0xCu);
}

void __36__SBSoundController__playToneAlert___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end