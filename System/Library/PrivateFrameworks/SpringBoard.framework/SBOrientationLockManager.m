@interface SBOrientationLockManager
+ (SBOrientationLockManager)sharedInstance;
- (BOOL)isEffectivelyLocked;
- (BOOL)isUserLocked;
- (BOOL)lockOverrideEnabled;
- (SBOrientationLockManager)init;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)deviceOrientationAsFarAsAppsAreConcerned;
- (int64_t)effectiveLockedOrientation;
- (int64_t)userLockOrientation;
- (void)_addLockOverrideReason:(id)a3 orientation:(int64_t)a4 force:(BOOL)a5;
- (void)_beginShimmingForReason:(id)a3;
- (void)_endShimmingForReason:(id)a3;
- (void)_handler_runLoopObserverDispose;
- (void)_removeLockOverrideReason:(id)a3;
- (void)_setupRunLoopObserverIfNecessaryForOrientation:(int64_t)a3 andInitialLockState:(BOOL)a4;
- (void)_updateLockStateWithChanges:(id)a3;
- (void)_updateLockStateWithOrientation:(int64_t)a3 forceUpdateHID:(BOOL)a4 changes:(id)a5;
- (void)dealloc;
- (void)enableLockOverrideForReason:(id)a3 forceOrientation:(int64_t)a4;
- (void)enableLockOverrideForReason:(id)a3 suggestOrientation:(int64_t)a4;
- (void)lock;
- (void)lock:(int64_t)a3;
- (void)restoreStateFromPrefs;
- (void)setLockOverrideEnabled:(BOOL)a3 forReason:(id)a4;
- (void)unlock;
- (void)updateLockOverrideForCurrentDeviceOrientation;
@end

@implementation SBOrientationLockManager

+ (SBOrientationLockManager)sharedInstance
{
  v2 = (void *)sharedInstance___instance_4;
  if (!sharedInstance___instance_4)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBOrientationLockManager);
    v4 = (void *)sharedInstance___instance_4;
    sharedInstance___instance_4 = (uint64_t)v3;

    kdebug_trace();
    BKSHIDServicesUnlockOrientation();
    v2 = (void *)sharedInstance___instance_4;
  }
  return (SBOrientationLockManager *)v2;
}

- (int64_t)userLockOrientation
{
  return self->_userLockedOrientation;
}

- (BOOL)isUserLocked
{
  return self->_userLockedOrientation != 0;
}

- (void)restoreStateFromPrefs
{
  v3 = +[SBDefaults localDefaults];
  v4 = [v3 rotationDefaults];
  uint64_t v5 = [v4 lastLockedOrientation];

  if (v5 && v5 != self->_userLockedOrientation)
  {
    [(SBOrientationLockManager *)self lock:v5];
  }
}

- (SBOrientationLockManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBOrientationLockManager;
  v2 = [(SBOrientationLockManager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    lockOverrideReasons = v2->_lockOverrideReasons;
    v2->_lockOverrideReasons = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    shimmedDeviceOrientationAssertions = v2->_shimmedDeviceOrientationAssertions;
    v2->_shimmedDeviceOrientationAssertions = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)dealloc
{
  if ([(SBOrientationLockManager *)self isEffectivelyLocked]) {
    BKSHIDServicesUnlockOrientation();
  }
  self->_runLoopObserver = 0;
  v3.receiver = self;
  v3.super_class = (Class)SBOrientationLockManager;
  [(SBOrientationLockManager *)&v3 dealloc];
}

- (void)lock
{
  uint64_t v3 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  if (__sb__runningInSpringBoard())
  {
    BOOL v4 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v4 = [v5 userInterfaceIdiom] == 1;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  [(SBOrientationLockManager *)self lock:v6];
}

- (void)lock:(int64_t)a3
{
  -[SBOrientationLockManager _updateLockStateWithOrientation:forceUpdateHID:changes:](self, "_updateLockStateWithOrientation:forceUpdateHID:changes:", MEMORY[0x1E4F143A8], 3221225472, __33__SBOrientationLockManager_lock___block_invoke, &unk_1E6AF4A70, self, a3);
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:*MEMORY[0x1E4FA7A88] object:self];

  uint64_t v6 = +[SBDefaults localDefaults];
  v7 = [v6 rotationDefaults];

  if ([v7 lastLockedOrientation] != a3) {
    [v7 setLastLockedOrientation:self->_userLockedOrientation];
  }
}

void __33__SBOrientationLockManager_lock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2 != *(void *)(a1 + 40))
  {
    BOOL v4 = BKLogOrientationGlobal();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Enabling global orientation lock for user", v5, 2u);
    }

    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
  }
  *(void *)(v1 + 8) = v2;
}

- (void)unlock
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__SBOrientationLockManager_unlock__block_invoke;
  v6[3] = &unk_1E6AF4AC0;
  v6[4] = self;
  [(SBOrientationLockManager *)self _updateLockStateWithChanges:v6];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:*MEMORY[0x1E4FA7A88] object:self];

  BOOL v4 = +[SBDefaults localDefaults];
  uint64_t v5 = [v4 rotationDefaults];
  [v5 setLastLockedOrientation:0];
}

void __34__SBOrientationLockManager_unlock__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    uint64_t v3 = BKLogOrientationGlobal();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Disabling global orientation lock for user", v4, 2u);
    }

    uint64_t v1 = *(void *)(a1 + 32);
  }
  *(void *)(v1 + 8) = 0;
}

- (BOOL)isEffectivelyLocked
{
  return [(SBOrientationLockManager *)self lockOverrideEnabled]
      || self->_userLockedOrientation != 0;
}

- (int64_t)effectiveLockedOrientation
{
  if ([(SBOrientationLockManager *)self isEffectivelyLocked]) {
    return self->_previousLockedOrientation;
  }
  else {
    return 0;
  }
}

- (int64_t)deviceOrientationAsFarAsAppsAreConcerned
{
  int64_t result = self->_userLockedOrientation;
  if (!result)
  {
    uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
    int64_t v4 = [v3 orientation];

    return v4;
  }
  return result;
}

- (void)_addLockOverrideReason:(id)a3 orientation:(int64_t)a4 force:(BOOL)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([(NSMutableSet *)self->_lockOverrideReasons containsObject:v6] & 1) == 0)
  {
    v7 = BKLogOrientationGlobal();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = BSInterfaceOrientationDescription();
      v9 = NSStringFromBOOL();
      int v10 = 138543874;
      id v11 = v6;
      __int16 v12 = 2114;
      v13 = v8;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Enabling global orientation lock override for reason: %{public}@, new orientation: %{public}@, forced %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  [(NSMutableSet *)self->_lockOverrideReasons addObject:v6];
}

- (void)_removeLockOverrideReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_lockOverrideReasons containsObject:v4])
  {
    uint64_t v5 = BKLogOrientationGlobal();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Disabling global orientation lock override for reason: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(NSMutableSet *)self->_lockOverrideReasons removeObject:v4];
}

- (void)setLockOverrideEnabled:(BOOL)a3 forReason:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SBOrientationLockManager_setLockOverrideEnabled_forReason___block_invoke;
  v8[3] = &unk_1E6AF5770;
  BOOL v10 = a3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(SBOrientationLockManager *)self _updateLockStateWithChanges:v8];
}

uint64_t __61__SBOrientationLockManager_setLockOverrideEnabled_forReason___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 _addLockOverrideReason:v4 orientation:0 force:0];
  }
  else {
    return [v3 _removeLockOverrideReason:v4];
  }
}

- (void)enableLockOverrideForReason:(id)a3 suggestOrientation:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__SBOrientationLockManager_enableLockOverrideForReason_suggestOrientation___block_invoke;
  v8[3] = &unk_1E6AF6FC0;
  v8[4] = self;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  [(SBOrientationLockManager *)self _updateLockStateWithOrientation:a4 forceUpdateHID:0 changes:v8];
}

uint64_t __75__SBOrientationLockManager_enableLockOverrideForReason_suggestOrientation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addLockOverrideReason:*(void *)(a1 + 40) orientation:*(void *)(a1 + 48) force:0];
}

- (void)enableLockOverrideForReason:(id)a3 forceOrientation:(int64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__SBOrientationLockManager_enableLockOverrideForReason_forceOrientation___block_invoke;
  v8[3] = &unk_1E6AF6FC0;
  v8[4] = self;
  id v9 = v6;
  int64_t v10 = a4;
  id v7 = v6;
  [(SBOrientationLockManager *)self _updateLockStateWithOrientation:a4 forceUpdateHID:1 changes:v8];
}

uint64_t __73__SBOrientationLockManager_enableLockOverrideForReason_forceOrientation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addLockOverrideReason:*(void *)(a1 + 40) orientation:*(void *)(a1 + 48) force:1];
}

- (void)_beginShimmingForReason:(id)a3
{
  id v7 = a3;
  uint64_t v4 = -[NSMutableDictionary objectForKey:](self->_shimmedDeviceOrientationAssertions, "objectForKey:");
  if (!v4)
  {
    shimmedDeviceOrientationAssertions = self->_shimmedDeviceOrientationAssertions;
    id v6 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:v7];
    [(NSMutableDictionary *)shimmedDeviceOrientationAssertions setObject:v6 forKey:v7];
  }
}

- (void)_endShimmingForReason:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[NSMutableDictionary objectForKey:](self->_shimmedDeviceOrientationAssertions, "objectForKey:");
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 invalidate];
    [(NSMutableDictionary *)self->_shimmedDeviceOrientationAssertions removeObjectForKey:v6];
  }
}

- (BOOL)lockOverrideEnabled
{
  return [(NSMutableSet *)self->_lockOverrideReasons count] != 0;
}

- (void)updateLockOverrideForCurrentDeviceOrientation
{
  if ([(SBOrientationLockManager *)self lockOverrideEnabled])
  {
    BKSHIDServicesUnlockOrientation();
    uint64_t NonFlatDeviceOrientation = BKHIDServicesGetNonFlatDeviceOrientation();
    [(SBOrientationLockManager *)self _updateLockStateWithOrientation:NonFlatDeviceOrientation forceUpdateHID:1 changes:0];
  }
}

- (void)_updateLockStateWithChanges:(id)a3
{
}

- (void)_updateLockStateWithOrientation:(int64_t)a3 forceUpdateHID:(BOOL)a4 changes:(id)a5
{
  BOOL v5 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(void))a5;
  BOOL v8 = [(SBOrientationLockManager *)self isEffectivelyLocked];
  BOOL v9 = [(SBOrientationLockManager *)self lockOverrideEnabled];
  if (v7) {
    v7[2](v7);
  }
  BOOL v10 = [(SBOrientationLockManager *)self isEffectivelyLocked];
  BOOL v11 = [(SBOrientationLockManager *)self isUserLocked];
  BOOL v12 = [(SBOrientationLockManager *)self lockOverrideEnabled];
  BOOL v13 = 0;
  int v14 = v8 ^ v10;
  BOOL v27 = v8;
  if (v11 && !v12)
  {
    int64_t previousLockedOrientation = self->_previousLockedOrientation;
    int64_t userLockedOrientation = self->_userLockedOrientation;
    BOOL v17 = !a3 && v9;
    BOOL v13 = previousLockedOrientation != userLockedOrientation;
    if (previousLockedOrientation != userLockedOrientation && v17)
    {
      v18 = BKLogOrientationDevice();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[SBOrientationLockManager _updateLockStateWithOrientation:forceUpdateHID:changes:]((uint64_t)&self->_userLockedOrientation, (uint64_t)&self->_previousLockedOrientation, v18);
      }

      a3 = self->_userLockedOrientation;
      BOOL v13 = 1;
    }
  }
  int v19 = (v10 && v5) | v14 | v13;
  v20 = BKLogOrientationDevice();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = NSStringFromBOOL();
    [(SBOrientationLockManager *)self isUserLocked];
    v22 = NSStringFromBOOL();
    v23 = NSStringFromBOOL();
    v24 = BSDeviceOrientationDescription();
    BOOL v25 = [(SBOrientationLockManager *)self lockOverrideEnabled];
    if (v25)
    {
      v26 = [(NSMutableSet *)self->_lockOverrideReasons description];
    }
    else
    {
      v26 = @"NO";
    }
    *(_DWORD *)buf = 138544386;
    v30 = v21;
    __int16 v31 = 2114;
    v32 = v22;
    __int16 v33 = 2114;
    v34 = v23;
    __int16 v35 = 2114;
    v36 = v24;
    __int16 v37 = 2114;
    v38 = v26;
    _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "SB orientation locked: %{public}@; user lock: %{public}@, was stale: %{public}@, orientation: %{public}@ overrides: %{public}@, ",
      buf,
      0x34u);
    if (v25) {
  }
    }
  if (v19) {
    [(SBOrientationLockManager *)self _setupRunLoopObserverIfNecessaryForOrientation:a3 andInitialLockState:v27];
  }
}

- (void)_setupRunLoopObserverIfNecessaryForOrientation:(int64_t)a3 andInitialLockState:(BOOL)a4
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v9 = [NSString stringWithUTF8String:"-[SBOrientationLockManager _setupRunLoopObserverIfNecessaryForOrientation:andInitialLockState:]"];
    [v8 handleFailureInFunction:v9 file:@"SBOrientationLockManager.m" lineNumber:271 description:@"this call must be made on the main thread"];
  }
  if (!self->_runLoopObserver)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__SBOrientationLockManager__setupRunLoopObserverIfNecessaryForOrientation_andInitialLockState___block_invoke;
    block[3] = &unk_1E6B019E0;
    objc_copyWeak(v11, &location);
    BOOL v12 = a4;
    v11[1] = (id)a3;
    block[4] = self;
    self->_runLoopObserver = CFRunLoopObserverCreateWithHandler(0, 0xA0uLL, 0, 0x7FFFFFFFLL, block);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __95__SBOrientationLockManager__setupRunLoopObserverIfNecessaryForOrientation_andInitialLockState___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = [WeakRetained isEffectivelyLocked];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v4 = [v6 orientation];
  }
  if (*(unsigned __int8 *)(a1 + 56) == v3 && v4 == *(void *)(*(void *)(a1 + 32) + 16))
  {
    int v7 = 0;
  }
  else
  {
    if (*(unsigned char *)(a1 + 56))
    {
      BKSHIDServicesUnlockOrientation();
      *(void *)(*(void *)(a1 + 32) + 16) = 0;
    }
    if (v3)
    {
      [WeakRetained isUserLocked];
      BKSHIDServicesLockOrientation();
      *(void *)(*(void *)(a1 + 32) + 16) = v4;
    }
    int v7 = 1;
  }
  BOOL v8 = BKLogOrientationGlobal();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = @"NO";
    if (v3) {
      BOOL v10 = @"YES";
    }
    else {
      BOOL v10 = @"NO";
    }
    if (v7) {
      BOOL v9 = @"YES";
    }
    int v11 = 138543618;
    BOOL v12 = v10;
    __int16 v13 = 2114;
    int v14 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SB orientation lock change handler fired! is locked: %{public}@; performed update: %{public}@",
      (uint8_t *)&v11,
      0x16u);
  }

  objc_msgSend(WeakRetained, "_handler_runLoopObserverDispose");
}

- (void)_handler_runLoopObserverDispose
{
  self->_runLoopObserver = 0;
}

- (id)succinctDescription
{
  int v2 = [(SBOrientationLockManager *)self succinctDescriptionBuilder];
  int v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  int v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBOrientationLockManager isEffectivelyLocked](self, "isEffectivelyLocked"), @"effectivelyLocked");
  int64_t userLockedOrientation = self->_userLockedOrientation;
  if (userLockedOrientation != [(SBOrientationLockManager *)self effectiveLockedOrientation])
  {
    [(SBOrientationLockManager *)self effectiveLockedOrientation];
    id v6 = BSInterfaceOrientationDescription();
    id v7 = (id)[v3 appendObject:v6 withName:@"effectiveLockedOrientation"];
  }
  if (self->_userLockedOrientation)
  {
    BOOL v8 = BSInterfaceOrientationDescription();
    id v9 = (id)[v3 appendObject:v8 withName:@"userLockedInterfaceOrientation"];
  }
  if ([(SBOrientationLockManager *)self lockOverrideEnabled])
  {
    BOOL v10 = [(NSMutableSet *)self->_lockOverrideReasons allObjects];
    int v11 = [v10 componentsJoinedByString:@","];
    id v12 = (id)[v3 appendObject:v11 withName:@"overrideReasons"];
  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v3 = [(SBOrientationLockManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shimmedDeviceOrientationAssertions, 0);
  objc_storeStrong((id *)&self->_lockOverrideReasons, 0);
}

- (void)_updateLockStateWithOrientation:(uint64_t)a1 forceUpdateHID:(uint64_t)a2 changes:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = BSDeviceOrientationDescription();
  BOOL v5 = BSDeviceOrientationDescription();
  int v6 = 138543618;
  id v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "Restoring user locked orientation: %{public}@, was locked to: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end