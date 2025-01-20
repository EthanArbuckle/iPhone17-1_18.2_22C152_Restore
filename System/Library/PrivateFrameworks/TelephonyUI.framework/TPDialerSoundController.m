@interface TPDialerSoundController
+ (void)_delayedDeactivate;
- (TPDialerSoundController)init;
- (unint64_t)incompleteSoundCount;
- (void)_stopAllSoundsForcingCallbacks:(BOOL)a3;
- (void)applicationResumedNotification:(id)a3;
- (void)applicationSuspendedNotification:(id)a3;
- (void)dealloc;
- (void)playSoundForDialerCharacter:(int64_t)a3;
- (void)setIncompleteSoundCount:(unint64_t)a3;
- (void)setSoundsActivated:(BOOL)a3;
- (void)soundCompletedPlaying:(unsigned int)a3;
- (void)stopSoundForDialerCharacter:(int64_t)a3;
@end

@implementation TPDialerSoundController

- (TPDialerSoundController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPDialerSoundController;
  v2 = [(TPDialerSoundController *)&v5 init];
  if (v2)
  {
    v2->_inflightSounds = CFSetCreateMutable(0, 12, 0);
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_applicationSuspendedNotification_ name:*MEMORY[0x1E4FB2718] object:0];
    [v3 addObserver:v2 selector:sel_applicationSuspendedNotification_ name:*MEMORY[0x1E4FB2710] object:0];
    [v3 addObserver:v2 selector:sel_applicationResumedNotification_ name:*MEMORY[0x1E4FB2700] object:0];
    [v3 addObserver:v2 selector:sel_applicationResumedNotification_ name:*MEMORY[0x1E4FB26F8] object:0];
    [(TPDialerSoundController *)v2 setSoundsActivated:1];
  }
  return v2;
}

- (void)dealloc
{
  [(TPDialerSoundController *)self setSoundsActivated:0];
  if (self->_inflightSounds)
  {
    [(TPDialerSoundController *)self _stopAllSoundsForcingCallbacks:1];
    CFRelease(self->_inflightSounds);
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TPDialerSoundController;
  [(TPDialerSoundController *)&v4 dealloc];
}

- (void)applicationResumedNotification:(id)a3
{
}

- (void)applicationSuspendedNotification:(id)a3
{
}

- (void)playSoundForDialerCharacter:(int64_t)a3
{
  if (a3 <= 11)
  {
    SystemSoundID v4 = kSoundIDs_0[a3];
    if (v4)
    {
      v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 postNotificationName:@"TPDialerSoundControllerWillBeginSoundsNotification" object:self];

      Current = CFRunLoopGetCurrent();
      AudioServicesAddSystemSoundCompletion(v4, Current, (CFStringRef)*MEMORY[0x1E4F1D410], (AudioServicesSystemSoundCompletionProc)_SoundCompletedPlaying_0, self);
      [(TPDialerSoundController *)self setIncompleteSoundCount:[(TPDialerSoundController *)self incompleteSoundCount] + 1];
      AudioServicesStartSystemSound();
      inflightSounds = self->_inflightSounds;
      CFSetAddValue(inflightSounds, (const void *)a3);
    }
  }
}

- (void)stopSoundForDialerCharacter:(int64_t)a3
{
  if (a3 <= 11 && kSoundIDs_0[a3])
  {
    AudioServicesStopSystemSound();
    inflightSounds = self->_inflightSounds;
    CFSetRemoveValue(inflightSounds, (const void *)a3);
  }
}

- (void)soundCompletedPlaying:(unsigned int)a3
{
  if ([(TPDialerSoundController *)self incompleteSoundCount])
  {
    [(TPDialerSoundController *)self setIncompleteSoundCount:[(TPDialerSoundController *)self incompleteSoundCount] - 1];
    if (![(TPDialerSoundController *)self incompleteSoundCount])
    {
      AudioServicesRemoveSystemSoundCompletion(a3);
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"TPDialerSoundControllerWillEndSoundsNotification" object:self];
    }
  }
}

- (void)setSoundsActivated:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v5 = *((unsigned char *)self + 16);
  if (!a3)
  {
    if ((*((unsigned char *)self + 16) & 1) == 0) {
      return;
    }
    if (!--__SystemSoundActivationCount_0)
    {
      [(id)objc_opt_class() performSelector:sel__delayedDeactivate withObject:0 afterDelay:0.0];
      __PendingDeactivate_0 = 1;
    }
    goto LABEL_14;
  }
  v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  if (([v6 isSuspended] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    char v8 = v5 ^ [v7 isSuspendedEventsOnly];

    if (v8) {
      return;
    }
    goto LABEL_9;
  }

  if (v5)
  {
LABEL_9:
    int v9 = __SystemSoundActivationCount_0++;
    if (!v9 && (__PendingDeactivate_0 & 1) == 0)
    {
      int inPropertyData = 1;
      AudioServicesSetProperty(0x61637421u, 4u, kSoundIDs_0, 4u, &inPropertyData);
      v10 = TPDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v13 = inPropertyData;
        _os_log_impl(&dword_1C2F24000, v10, OS_LOG_TYPE_DEFAULT, "Called AudioServicesSetProperty() with kAudioServicesPropertyActivate and active=%d", buf, 8u);
      }
    }
LABEL_14:
    *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFE | a3;
  }
}

+ (void)_delayedDeactivate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!__SystemSoundActivationCount_0)
  {
    int inPropertyData = 0;
    AudioServicesSetProperty(0x61637421u, 4u, kSoundIDs_0, 4u, &inPropertyData);
    v2 = TPDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v5 = inPropertyData;
      _os_log_impl(&dword_1C2F24000, v2, OS_LOG_TYPE_DEFAULT, "Called AudioServicesSetProperty() with kAudioServicesPropertyActivate and active=%d", buf, 8u);
    }

    __PendingDeactivate_0 = 0;
  }
}

- (void)_stopAllSoundsForcingCallbacks:(BOOL)a3
{
  inflightSounds = self->_inflightSounds;
  if (inflightSounds)
  {
    BOOL v5 = a3;
    CFSetApplyFunction(inflightSounds, (CFSetApplierFunction)__TPStopSoundForKeyCallback_0, self);
    CFSetRemoveAllValues(self->_inflightSounds);
    if (v5)
    {
      for (uint64_t i = 0; i != 12; ++i)
        AudioServicesRemoveSystemSoundCompletion(kSoundIDs_0[i]);
      if ([(TPDialerSoundController *)self incompleteSoundCount])
      {
        v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v7 postNotificationName:@"TPDialerSoundControllerWillEndSoundsNotification" object:self];
      }
      [(TPDialerSoundController *)self setIncompleteSoundCount:0];
    }
  }
}

- (unint64_t)incompleteSoundCount
{
  return self->_incompleteSoundCount;
}

- (void)setIncompleteSoundCount:(unint64_t)a3
{
  self->_incompleteSoundCount = a3;
}

@end