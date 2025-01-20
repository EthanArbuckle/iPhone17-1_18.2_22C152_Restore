@interface PKUIForegroundActiveArbiter
+ (BOOL)isBackgroundedForReasons:(unsigned int)a3;
+ (BOOL)isDeactivedForReasons:(unsigned int)a3;
+ (id)sharedInstance;
- ($96EE1C12479E9B303E9C2794B92A11A2)registerObserver:(id)a3;
- (PKUIForegroundActiveArbiter)init;
- (id)_init;
- (unsigned)registerDeactivationObserver:(id)a3;
- (void)_beginEnteringForegroundTimer;
- (void)_didRemoveDeactivationReasonNotification:(id)a3;
- (void)_updateForegroundActiveWithEnteringForegroundPolicy:(int64_t)a3;
- (void)_willAddDeactivationReasonNotification:(id)a3;
- (void)dealloc;
- (void)didBecomeActive;
- (void)didEnterBackground;
- (void)unregisterDeactivationObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)willEnterForegroundPostlude;
- (void)willEnterForegroundPrelude;
- (void)willResignActive;
- (void)willTerminate;
@end

@implementation PKUIForegroundActiveArbiter

- (void)_willAddDeactivationReasonNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB3158]];
  char v7 = [v6 integerValue];

  os_unfair_lock_lock(&self->_lock);
  unsigned int deactivationReasons = self->_deactivationReasons;
  unsigned int v9 = deactivationReasons | (1 << v7);
  if (deactivationReasons == v9)
  {
    v10 = 0;
  }
  else
  {
    self->_unsigned int deactivationReasons = v9;
    v10 = [(NSHashTable *)self->_deactivationObservers allObjects];
  }
  os_unfair_lock_unlock(&self->_lock);
  v11 = (void *)MEMORY[0x1A6224460]();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "foregroundActiveArbiter:didUpdateDeactivationReasons:", self, self->_deactivationReasons, (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)_didRemoveDeactivationReasonNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB3158]];
  char v7 = [v6 integerValue];

  os_unfair_lock_lock(&self->_lock);
  unsigned int deactivationReasons = self->_deactivationReasons;
  unsigned int v9 = deactivationReasons & ~(1 << v7);
  if (deactivationReasons == v9)
  {
    v10 = 0;
  }
  else
  {
    self->_unsigned int deactivationReasons = v9;
    v10 = [(NSHashTable *)self->_deactivationObservers allObjects];
  }
  os_unfair_lock_unlock(&self->_lock);
  v11 = (void *)MEMORY[0x1A6224460]();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "foregroundActiveArbiter:didUpdateDeactivationReasons:", self, self->_deactivationReasons, (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- ($96EE1C12479E9B303E9C2794B92A11A2)registerObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  $77BFE790A1370D46B4241309C9753022 foregroundActiveState = self->_foregroundActiveState;
  if (v5) {
    [(NSHashTable *)self->_observers addObject:v5];
  }
  os_unfair_lock_unlock(p_lock);

  return *($96EE1C12479E9B303E9C2794B92A11A2 *)&foregroundActiveState;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_688 != -1) {
    dispatch_once(&_MergedGlobals_688, &__block_literal_global_186);
  }
  v2 = (void *)qword_1EB545CE8;

  return v2;
}

void __45__PKUIForegroundActiveArbiter_sharedInstance__block_invoke()
{
  if (PKRunningInRemoteContext()) {
    id v0 = 0;
  }
  else {
    id v0 = [[PKUIForegroundActiveArbiter alloc] _init];
  }
  v1 = (void *)qword_1EB545CE8;
  qword_1EB545CE8 = (uint64_t)v0;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)PKUIForegroundActiveArbiter;
  v2 = [(PKUIForegroundActiveArbiter *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    deactivationObservers = v2->_deactivationObservers;
    v2->_deactivationObservers = (NSHashTable *)v5;

    v2->_backgroundTaskIdentifier = *MEMORY[0x1E4FB2748];
    v2->_lock._os_unfair_lock_opaque = 0;
    char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__willAddDeactivationReasonNotification_ name:*MEMORY[0x1E4FB31A0] object:0];
    [v7 addObserver:v2 selector:sel__didRemoveDeactivationReasonNotification_ name:*MEMORY[0x1E4FB3160] object:0];
  }
  return v2;
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)didBecomeActive
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: didBecomeActive.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_active = 1;
  *(_WORD *)&self->_foreground = 1;
  [(PKUIForegroundActiveArbiter *)self _updateForegroundActiveWithEnteringForegroundPolicy:0];
}

- (void)willEnterForegroundPrelude
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v7 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: willEnterForegroundPrelude.", v7, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_active)
  {
    BOOL v4 = 0;
    uint64_t v5 = 0;
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
    self->_enteringForegroundExpired = 0;
    BOOL v4 = 1;
    uint64_t v5 = 1;
  }
  self->_foreground = v6;
  self->_enteringForeground = v4;
  [(PKUIForegroundActiveArbiter *)self _updateForegroundActiveWithEnteringForegroundPolicy:v5];
}

- (void)_updateForegroundActiveWithEnteringForegroundPolicy:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = *MEMORY[0x1E4FB2748];
  if ((a3 | 2) == 2)
  {
    enteringForegroundTimeout = self->_enteringForegroundTimeout;
    if (enteringForegroundTimeout)
    {
      dispatch_source_cancel(enteringForegroundTimeout);
      char v7 = self->_enteringForegroundTimeout;
      self->_enteringForegroundTimeout = 0;
    }
    BOOL v9 = a3 == 2 && self->_enteringForeground;
    self->_enteringForegroundExpired = v9;
    unint64_t backgroundTaskIdentifier = self->_backgroundTaskIdentifier;
    self->_unint64_t backgroundTaskIdentifier = v4;
  }
  else
  {
    unint64_t backgroundTaskIdentifier = *MEMORY[0x1E4FB2748];
  }
  if (self->_foreground && self->_active || self->_enteringForeground && !self->_enteringForegroundExpired)
  {
    BOOL v11 = 1;
    unint64_t v12 = 256;
    BOOL foreground = 1;
  }
  else
  {
    BOOL v11 = 0;
    unint64_t v12 = 0;
    BOOL foreground = self->_foreground;
  }
  if (self->_foregroundActiveState.foregroundActive == v11 && self->_foregroundActiveState.foreground == foreground)
  {
    uint64_t v14 = 0;
  }
  else
  {
    self->_foregroundActiveState.BOOL foreground = foreground;
    self->_foregroundActiveState.foregroundActive = v11;
    uint64_t v14 = [(NSHashTable *)self->_observers allObjects];
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v15 = (void *)MEMORY[0x1A6224460]();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    unint64_t v20 = v12 | foreground;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        unint64_t v12 = v20 | v12 & 0xFFFFFFFFFFFF0000;
        [*(id *)(*((void *)&v25 + 1) + 8 * i) foregroundActiveArbiter:self didUpdateForegroundActiveState:v12];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  if (backgroundTaskIdentifier != v4)
  {
    uint64_t v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: ending background task.", v24, 2u);
    }

    v23 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v23 endBackgroundTask:backgroundTaskIdentifier];
  }
}

- (void)willEnterForegroundPostlude
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: willEnterForegroundPostlude.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_enteringForeground) {
    [(PKUIForegroundActiveArbiter *)self _beginEnteringForegroundTimer];
  }
  else {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_beginEnteringForegroundTimer
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKUIForegroundActiveArbiter__beginEnteringForegroundTimer__block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  uint64_t v3 = _Block_copy(aBlock);
  enteringForegroundTimeout = self->_enteringForegroundTimeout;
  if (enteringForegroundTimeout)
  {
    dispatch_source_cancel(enteringForegroundTimeout);
    uint64_t v5 = self->_enteringForegroundTimeout;
    self->_enteringForegroundTimeout = 0;
  }
  unint64_t backgroundTaskIdentifier = self->_backgroundTaskIdentifier;
  uint64_t v7 = *MEMORY[0x1E4FB2748];
  if (backgroundTaskIdentifier == *MEMORY[0x1E4FB2748])
  {
    v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    self->_unint64_t backgroundTaskIdentifier = [v8 beginBackgroundTaskWithName:@"Entering Foreground" expirationHandler:v3];

    unint64_t backgroundTaskIdentifier = self->_backgroundTaskIdentifier;
  }
  if (backgroundTaskIdentifier == v7)
  {
    BOOL v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: expiring entering foreground state (failed to acquire background task).", v14, 2u);
    }

    self->_enteringForegroundExpired = 1;
    [(PKUIForegroundActiveArbiter *)self _updateForegroundActiveWithEnteringForegroundPolicy:2];
  }
  else
  {
    v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    BOOL v11 = self->_enteringForegroundTimeout;
    self->_enteringForegroundTimeout = v10;

    unint64_t v12 = self->_enteringForegroundTimeout;
    dispatch_time_t v13 = dispatch_time(0, 2500000000);
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    dispatch_source_set_event_handler((dispatch_source_t)self->_enteringForegroundTimeout, v3);
    dispatch_resume((dispatch_object_t)self->_enteringForegroundTimeout);
    os_unfair_lock_unlock(&self->_lock);
  }
}

+ (BOOL)isDeactivedForReasons:(unsigned int)a3
{
  if ((a3 & 0xA05F) != 0) {
    return 1;
  }
  else {
    return objc_msgSend(a1, "isBackgroundedForReasons:");
  }
}

+ (BOOL)isBackgroundedForReasons:(unsigned int)a3
{
  return (a3 & 0x1800) != 0;
}

- (PKUIForegroundActiveArbiter)init
{
  return 0;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKUIForegroundActiveArbiter;
  [(PKUIForegroundActiveArbiter *)&v4 dealloc];
}

- (void)didEnterBackground
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: didEnterBackground.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  *(_WORD *)&self->_BOOL foreground = 0;
  [(PKUIForegroundActiveArbiter *)self _updateForegroundActiveWithEnteringForegroundPolicy:0];
}

- (void)willResignActive
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: willResignActive.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_active = 0;
  self->_enteringForeground = 0;
  [(PKUIForegroundActiveArbiter *)self _updateForegroundActiveWithEnteringForegroundPolicy:0];
}

- (void)willTerminate
{
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: willTerminate.", v4, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  self->_active = 0;
  *(_WORD *)&self->_BOOL foreground = 0;
  [(PKUIForegroundActiveArbiter *)self _updateForegroundActiveWithEnteringForegroundPolicy:0];
}

uint64_t __60__PKUIForegroundActiveArbiter__beginEnteringForegroundTimer__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKUIForegroundActiveArbiter: expiring entering foreground state.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _updateForegroundActiveWithEnteringForegroundPolicy:2];
}

- (unsigned)registerDeactivationObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  unsigned int deactivationReasons = self->_deactivationReasons;
  if (v5) {
    [(NSHashTable *)self->_deactivationObservers addObject:v5];
  }
  os_unfair_lock_unlock(p_lock);

  return deactivationReasons;
}

- (void)unregisterDeactivationObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSHashTable *)self->_deactivationObservers removeObject:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enteringForegroundTimeout, 0);
  objc_storeStrong((id *)&self->_deactivationObservers, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end