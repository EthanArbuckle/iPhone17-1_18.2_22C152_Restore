@interface SBLockdownManager
+ (id)sharedInstance;
- (BOOL)brickedDevice;
- (SBLockdownManager)init;
- (int)lockdownState;
- (void)_resetActivationState;
- (void)_setupActivationState;
@end

@implementation SBLockdownManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_54);
  }
  v2 = (void *)sharedInstance___sharedInstance_3;
  return v2;
}

void __35__SBLockdownManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBLockdownManager);
  v1 = (void *)sharedInstance___sharedInstance_3;
  sharedInstance___sharedInstance_3 = (uint64_t)v0;
}

- (SBLockdownManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBLockdownManager;
  v2 = [(SBLockdownManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)lockdownActivationChanged, (CFStringRef)*MEMORY[0x1E4F77F10], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)_resetActivationState
{
  self->_state = 0;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SBLockdownDeviceActivatedChangedNotification" object:self];
}

- (void)_setupActivationState
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "MobileActivation didn't return an ActivationState value or did return an error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (BOOL)brickedDevice
{
  return [(SBLockdownManager *)self lockdownState] != 2;
}

- (int)lockdownState
{
  int result = self->_state;
  if (!result)
  {
    [(SBLockdownManager *)self _setupActivationState];
    return self->_state;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unqiueDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_activatingAlertItem, 0);
}

@end