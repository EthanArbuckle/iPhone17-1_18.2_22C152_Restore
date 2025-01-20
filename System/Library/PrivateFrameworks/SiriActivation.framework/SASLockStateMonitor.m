@interface SASLockStateMonitor
- (BOOL)hasUnlockedSinceBoot;
- (BOOL)isBlocked;
- (BOOL)isScreenOn;
- (BOOL)unlockedByTouchID;
- (NSNumber)assistantIsEnabled;
- (SASLockStateMonitor)init;
- (SASLockStateMonitorDelegate)delegate;
- (unint64_t)_currentLockState;
- (unint64_t)lockState;
- (void)_lockStateDidChange:(id)a3;
- (void)_updateLockState;
- (void)dealloc;
- (void)setAssistantIsEnabled:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLockState:(unint64_t)a3;
- (void)setUnlockedByTouchID:(BOOL)a3;
@end

@implementation SASLockStateMonitor

- (unint64_t)lockState
{
  return self->_lockState;
}

- (SASLockStateMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)SASLockStateMonitor;
  v2 = [(SASLockStateMonitor *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__lockStateDidChange_ name:@"SBDeviceLockStateChangedNotification" object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_PasscodeLockStateDidChange, @"com.apple.springboard.DeviceLockStatusChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__lockStateDidChange_ name:@"SBBiometricEventMonitorHasAuthenticated" object:0];

    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)_AFPreferencesDidChangeCallback, (CFStringRef)*MEMORY[0x1E4F4E6B0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__SASLockStateMonitor_init__block_invoke;
    block[3] = &unk_1E6B678E8;
    v9 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  return v2;
}

uint64_t __27__SASLockStateMonitor_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _currentLockState];
  v3 = *(void **)(a1 + 32);
  return [v3 setLockState:v2];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.springboard.DeviceLockStatusChanged", 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, (CFNotificationName)*MEMORY[0x1E4F4E6B0], 0);
  v6.receiver = self;
  v6.super_class = (Class)SASLockStateMonitor;
  [(SASLockStateMonitor *)&v6 dealloc];
}

- (BOOL)isBlocked
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [MEMORY[0x1E4F29060] mainThread];
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    v5 = soft_SBUIGetUserAgent_0();
    char v6 = [v5 deviceIsBlocked];
    *((unsigned char *)v11 + 24) = v6;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__SASLockStateMonitor_isBlocked__block_invoke;
    block[3] = &unk_1E6B677B8;
    void block[4] = &v10;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __32__SASLockStateMonitor_isBlocked__block_invoke(uint64_t a1)
{
  soft_SBUIGetUserAgent_0();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 deviceIsBlocked];
}

- (BOOL)hasUnlockedSinceBoot
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v2 = (unsigned int (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v9 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v5[3] = &unk_1E6B677B8;
    v5[4] = &v6;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)v5);
    id v2 = (unsigned int (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    char v4 = (_Unwind_Exception *)soft_SBUIGetUserAgent_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  return v2() == 1;
}

- (BOOL)isScreenOn
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [MEMORY[0x1E4F29060] mainThread];
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    v5 = soft_SBUIGetUserAgent_0();
    char v6 = [v5 isScreenOn];
    *((unsigned char *)v11 + 24) = v6;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__SASLockStateMonitor_isScreenOn__block_invoke;
    block[3] = &unk_1E6B677B8;
    void block[4] = &v10;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __33__SASLockStateMonitor_isScreenOn__block_invoke(uint64_t a1)
{
  soft_SBUIGetUserAgent_0();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 isScreenOn];
}

- (unint64_t)_currentLockState
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__SASLockStateMonitor__currentLockState__block_invoke;
  aBlock[3] = &unk_1E6B677B8;
  aBlock[4] = &v9;
  id v2 = (void (**)(void))_Block_copy(aBlock);
  v3 = [MEMORY[0x1E4F29060] currentThread];
  char v4 = [MEMORY[0x1E4F29060] mainThread];
  char v5 = [v3 isEqual:v4];

  if (v5) {
    v2[2](v2);
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], v2);
  }
  unint64_t v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __40__SASLockStateMonitor__currentLockState__block_invoke(uint64_t a1)
{
  id v2 = soft_SBUIGetUserAgent_0();
  int v3 = [v2 lockScreenIsShowing];

  if (v3) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 1uLL;
  }
  char v4 = soft_SBUIGetUserAgent_0();
  int v5 = [v4 deviceIsPasscodeLocked];

  if (v5) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 2uLL;
  }
}

- (void)_lockStateDidChange:(id)a3
{
  id v11 = a3;
  char v4 = [v11 name];
  uint64_t v5 = [v4 isEqual:@"SBBiometricEventMonitorHasAuthenticated"];

  if (v5) {
    goto LABEL_4;
  }
  unint64_t v6 = [v11 name];
  int v7 = [v6 isEqual:@"SBDeviceLockStateChangedNotification"];

  if (v7)
  {
    uint64_t v8 = [v11 userInfo];
    uint64_t v9 = [v8 valueForKey:@"kSBNotificationKeyState"];
    int v10 = [v9 BOOLValue];

    if (v10) {
LABEL_4:
    }
      [(SASLockStateMonitor *)self setUnlockedByTouchID:v5];
  }
  [(SASLockStateMonitor *)self _updateLockState];
}

- (void)_updateLockState
{
  unint64_t v3 = [(SASLockStateMonitor *)self _currentLockState];
  if ([(SASLockStateMonitor *)self lockState] != v3)
  {
    unint64_t v4 = [(SASLockStateMonitor *)self lockState];
    [(SASLockStateMonitor *)self setLockState:v3];
    id v10 = [(SASLockStateMonitor *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v10, "didChangeLockState:toState:", v4, -[SASLockStateMonitor lockState](self, "lockState"));
    }
    else if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v10, "didChangeLockState:", -[SASLockStateMonitor lockState](self, "lockState"));
    }
    uint64_t v5 = [(SASLockStateMonitor *)self assistantIsEnabled];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      int v7 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
      uint64_t v8 = v7;
      if (v3) {
        uint64_t v9 = 1435;
      }
      else {
        uint64_t v9 = 1436;
      }
      [v7 logEventWithType:v9 context:0];
    }
  }
}

- (NSNumber)assistantIsEnabled
{
  assistantIsEnabled = self->_assistantIsEnabled;
  if (!assistantIsEnabled)
  {
    unint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v5 = [MEMORY[0x1E4F4E538] sharedPreferences];
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "assistantIsEnabled"));
    int v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    int v7 = self->_assistantIsEnabled;
    self->_assistantIsEnabled = v6;

    assistantIsEnabled = self->_assistantIsEnabled;
  }
  return assistantIsEnabled;
}

- (SASLockStateMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SASLockStateMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

- (BOOL)unlockedByTouchID
{
  return self->_unlockedByTouchID;
}

- (void)setUnlockedByTouchID:(BOOL)a3
{
  self->_unlockedByTouchID = a3;
}

- (void)setAssistantIsEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantIsEnabled, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end