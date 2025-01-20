@interface SBIdleTimerService
+ (id)_sharedIdleTimerStateServiceCreatingIfNeeded:(BOOL)a3;
+ (id)_sharedIdleTimerStateServiceIfExists;
+ (id)sharedInstance;
+ (void)registerServices;
- (BOOL)_isMediaPlaybackClient:(id)a3;
- (BOOL)handleIdleTimerDidExpire;
- (BOOL)handleIdleTimerDidWarn;
- (BOOL)handleIdleTimerUserAttentionDidReset;
- (BOOL)isDisabledByMediaPlayback;
- (SBIdleTimerAggregateClientConfiguration)aggregateClientConfiguration;
- (SBIdleTimerServiceDelegate)delegate;
- (id)_acquireIdleTimerDisableAssertionForReason:(id)a3;
- (id)_init;
- (id)_stateCaptureDescription;
- (id)acquireIdleTimerAssertionWithConfiguration:(id)a3 fromClient:(id)a4 forReason:(id)a5;
- (void)_addConfigurationInfo:(id)a3 toSortedArray:(id)a4;
- (void)_addStateCaptureHandlers;
- (void)_aggregateConfigurations;
- (void)_removeAssertionsForReason:(id)a3;
- (void)_removeConfigurationInfoForReason:(id)a3 fromArray:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation SBIdleTimerService

+ (id)_sharedIdleTimerStateServiceCreatingIfNeeded:(BOOL)a3
{
  if (a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__SBIdleTimerService__sharedIdleTimerStateServiceCreatingIfNeeded___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_sharedIdleTimerStateServiceCreatingIfNeeded__onceToken != -1) {
      dispatch_once(&_sharedIdleTimerStateServiceCreatingIfNeeded__onceToken, block);
    }
  }
  v3 = (void *)_sharedIdleTimerStateServiceCreatingIfNeeded__stateService;
  return v3;
}

void __67__SBIdleTimerService__sharedIdleTimerStateServiceCreatingIfNeeded___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) sharedInstance];
  id v1 = objc_alloc(MEMORY[0x1E4F6F2F0]);
  uint64_t v2 = [v1 initWithDispatchQueue:__serviceCalloutQueue delegate:v4];
  v3 = (void *)_sharedIdleTimerStateServiceCreatingIfNeeded__stateService;
  _sharedIdleTimerStateServiceCreatingIfNeeded__stateService = v2;
}

+ (id)_sharedIdleTimerStateServiceIfExists
{
  return (id)[a1 _sharedIdleTimerStateServiceCreatingIfNeeded:0];
}

+ (void)registerServices
{
  id v2 = (id)[a1 _sharedIdleTimerStateServiceCreatingIfNeeded:1];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_21 != -1) {
    dispatch_once(&sharedInstance_onceToken_21, &__block_literal_global_161);
  }
  id v2 = (void *)sharedInstance_service;
  return v2;
}

void __36__SBIdleTimerService_sharedInstance__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("IdleTimerService", 0);
  id v1 = (void *)__serviceCalloutQueue;
  __serviceCalloutQueue = (uint64_t)v0;

  id v2 = [[SBIdleTimerService alloc] _init];
  v3 = (void *)sharedInstance_service;
  sharedInstance_service = (uint64_t)v2;
}

- (id)_init
{
  v19.receiver = self;
  v19.super_class = (Class)SBIdleTimerService;
  id v2 = [(SBIdleTimerService *)&v19 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    access_idleWarnHandlers = v3->_access_idleWarnHandlers;
    v3->_access_idleWarnHandlers = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    access_idleExpirationHandlers = v3->_access_idleExpirationHandlers;
    v3->_access_idleExpirationHandlers = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    access_idleUserAttentionResetHandlers = v3->_access_idleUserAttentionResetHandlers;
    v3->_access_idleUserAttentionResetHandlers = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    disableTimerConfigurations = v3->_disableTimerConfigurations;
    v3->_disableTimerConfigurations = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    minExpirationConfigurations = v3->_minExpirationConfigurations;
    v3->_minExpirationConfigurations = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    maxEpirationConfigurations = v3->_maxEpirationConfigurations;
    v3->_maxEpirationConfigurations = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mediaPlaybackDisableReasons = v3->_mediaPlaybackDisableReasons;
    v3->_mediaPlaybackDisableReasons = v16;

    [(SBIdleTimerService *)v3 _addStateCaptureHandlers];
  }
  return v3;
}

- (void)dealloc
{
  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    [(BSInvalidatable *)stateCaptureAssertion invalidate];
    id v4 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBIdleTimerService;
  [(SBIdleTimerService *)&v5 dealloc];
}

- (BOOL)isDisabledByMediaPlayback
{
  return [(NSMutableSet *)self->_mediaPlaybackDisableReasons count] != 0;
}

- (id)acquireIdleTimerAssertionWithConfiguration:(id)a3 fromClient:(id)a4 forReason:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BSDispatchQueueAssert();
  v11 = SBLogIdleTimer();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = [v9 bundleIdentifier];
    *(_DWORD *)buf = 138544130;
    v37 = v13;
    __int16 v38 = 2114;
    id v39 = v8;
    __int16 v40 = 2114;
    v41 = v14;
    __int16 v42 = 2114;
    id v43 = v10;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@ - acquireIdleTimerAssertionWithConfiguration:%{public}@ fromClient:%{public}@ forReason:%{public}@]", buf, 0x2Au);
  }
  if ([v8 disablesTimer])
  {
    if ([(SBIdleTimerService *)self _isMediaPlaybackClient:v9])
    {
      [(NSMutableSet *)self->_mediaPlaybackDisableReasons addObject:v10];
      v15 = +[SBScreenLongevityController sharedInstanceIfExists];
      [v15 evaluateEnablement];
    }
    [(NSMutableDictionary *)self->_disableTimerConfigurations setObject:v8 forKeyedSubscript:v10];
LABEL_21:
    objc_initWeak((id *)buf, self);
    v20 = NSString;
    v21 = [v9 bundleIdentifier];
    v22 = [v20 stringWithFormat:@"%@:%@", @"IdleTimerClient", v21];

    id v23 = objc_alloc(MEMORY[0x1E4F4F838]);
    uint64_t v24 = __serviceCalloutQueue;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __86__SBIdleTimerService_acquireIdleTimerAssertionWithConfiguration_fromClient_forReason___block_invoke;
    v33[3] = &unk_1E6B01F68;
    v34 = @"IdleTimerClient";
    objc_copyWeak(&v35, (id *)buf);
    v25 = (void *)[v23 initWithIdentifier:v22 forReason:v10 queue:v24 invalidationBlock:v33];
    [(SBIdleTimerService *)self _aggregateConfigurations];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v27 = [v9 bundleIdentifier];
    [WeakRetained idleTimerServiceTimeoutAssertionsDidChange:self fromClient:v27];

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v8;
    if ([v16 hasMaxExpirationTimeout]) {
      [(NSMutableDictionary *)self->_maxEpirationConfigurations setObject:v16 forKeyedSubscript:v10];
    }
    if ([v16 hasMinExpirationTimeout]) {
      [(NSMutableDictionary *)self->_minExpirationConfigurations setObject:v16 forKeyedSubscript:v10];
    }
    uint64_t v17 = [v16 idleEventMask];
    char v18 = v17;
    if (v17)
    {
      objc_super v19 = [[_SBIdleTimerConfigurationInfo alloc] initWithConfiguration:v16 reason:v10];
      if ((v18 & 2) != 0) {
        [(SBIdleTimerService *)self _addConfigurationInfo:v19 toSortedArray:self->_access_idleExpirationHandlers];
      }
      if (v18) {
        [(SBIdleTimerService *)self _addConfigurationInfo:v19 toSortedArray:self->_access_idleWarnHandlers];
      }
      if ((v18 & 4) != 0) {
        [(SBIdleTimerService *)self _addConfigurationInfo:v19 toSortedArray:self->_access_idleUserAttentionResetHandlers];
      }
    }
    goto LABEL_21;
  }
  v28 = SBLogIdleTimer();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    v32 = [v9 bundleIdentifier];
    *(_DWORD *)buf = 138543874;
    v37 = v31;
    __int16 v38 = 2114;
    id v39 = v8;
    __int16 v40 = 2114;
    v41 = v32;
    _os_log_error_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_ERROR, "[%{public}@ - requested configuration: %{public}@ from client: %{public}@ is not supported.]", buf, 0x20u);
  }
  v25 = 0;
LABEL_25:

  return v25;
}

void __86__SBIdleTimerService_acquireIdleTimerAssertionWithConfiguration_fromClient_forReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 reason];
  objc_super v5 = [v3 identifier];

  v6 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 32), "length"));
  v7 = SBLogIdleTimer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[SBIdleTimerService - Invalidating idle timer expiration timeout assertion forReason:%{public}@]", (uint8_t *)&v11, 0xCu);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _removeAssertionsForReason:v4];
    [v9 _aggregateConfigurations];
    id v10 = objc_loadWeakRetained(v9 + 10);
    [v10 idleTimerServiceTimeoutAssertionsDidChange:v9 fromClient:v6];
  }
}

- (BOOL)handleIdleTimerDidWarn
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  lock = p_accessLock;
  os_unfair_lock_lock(p_accessLock);
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(NSMutableArray *)self->_access_idleWarnHandlers reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__SBIdleTimerService_handleIdleTimerDidWarn__block_invoke;
      block[3] = &unk_1E6AF70B0;
      void block[5] = self;
      block[6] = &v17;
      block[4] = v8;
      dispatch_sync((dispatch_queue_t)__serviceCalloutQueue, block);
      if (*((unsigned char *)v18 + 24)) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16, lock);
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  os_unfair_lock_unlock(lock);
  char v9 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v9;
}

void __44__SBIdleTimerService_handleIdleTimerDidWarn__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) configuration];
  id v2 = [(id)objc_opt_class() _sharedIdleTimerStateServiceIfExists];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 clientConfiguration:v3 handleIdleEvent:1];
}

- (BOOL)handleIdleTimerDidExpire
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  lock = p_accessLock;
  os_unfair_lock_lock(p_accessLock);
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(NSMutableArray *)self->_access_idleExpirationHandlers reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__SBIdleTimerService_handleIdleTimerDidExpire__block_invoke;
      block[3] = &unk_1E6AF70B0;
      void block[5] = self;
      block[6] = &v17;
      block[4] = v8;
      dispatch_sync((dispatch_queue_t)__serviceCalloutQueue, block);
      if (*((unsigned char *)v18 + 24)) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16, lock);
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  os_unfair_lock_unlock(lock);
  char v9 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v9;
}

void __46__SBIdleTimerService_handleIdleTimerDidExpire__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) configuration];
  id v2 = [(id)objc_opt_class() _sharedIdleTimerStateServiceIfExists];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 clientConfiguration:v3 handleIdleEvent:2];
}

- (BOOL)handleIdleTimerUserAttentionDidReset
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  lock = p_accessLock;
  os_unfair_lock_lock(p_accessLock);
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(NSMutableArray *)self->_access_idleUserAttentionResetHandlers reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__SBIdleTimerService_handleIdleTimerUserAttentionDidReset__block_invoke;
      block[3] = &unk_1E6AF70B0;
      void block[5] = self;
      block[6] = &v17;
      block[4] = v8;
      dispatch_sync((dispatch_queue_t)__serviceCalloutQueue, block);
      if (*((unsigned char *)v18 + 24)) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16, lock);
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  os_unfair_lock_unlock(lock);
  char v9 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v9;
}

void __58__SBIdleTimerService_handleIdleTimerUserAttentionDidReset__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) configuration];
  id v2 = [(id)objc_opt_class() _sharedIdleTimerStateServiceIfExists];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 clientConfiguration:v3 handleIdleEvent:4];
}

- (id)_acquireIdleTimerDisableAssertionForReason:(id)a3
{
  id v3 = a3;
  BSDispatchQueueAssert();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__53;
  v12[4] = __Block_byref_object_dispose__53;
  id v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke;
  block[3] = &unk_1E6AF4B88;
  int v11 = v12;
  id v4 = v3;
  id v10 = v4;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke_2;
  v8[3] = &unk_1E6B01F90;
  v8[4] = v12;
  uint64_t v6 = (void *)[v5 initWithIdentifier:@"DisableIdleTimer" forReason:v4 queue:__serviceCalloutQueue invalidationBlock:v8];

  _Block_object_dispose(v12, 8);
  return v6;
}

void __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke(uint64_t a1)
{
  id v5 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  uint64_t v2 = [v5 acquireIdleTimerDisableAssertionForReason:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke_3;
  v6[3] = &unk_1E6AF52B8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_sync(MEMORY[0x1E4F14428], v6);
}

uint64_t __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogIdleTimer();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) reason];
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[SBIdleTimerService - Invalidating idle timer disable assertion forReason:%{public}@]", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
}

- (void)_aggregateConfigurations
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssert();
  id v3 = objc_alloc_init(SBIdleTimerAggregateClientConfiguration);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_disableTimerConfigurations allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v44;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v44 != v7) {
        objc_enumerationMutation(v4);
      }
      char v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
      uint64_t v10 = objc_opt_class();
      id v11 = v9;
      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
      id v13 = v12;

      if (v13) {
        unint64_t v14 = [v13 precedence];
      }
      else {
        unint64_t v14 = 0;
      }
      long long v15 = [(SBIdleTimerAggregateClientConfiguration *)v3 disableTimerSetting];
      long long v16 = v15;
      if (!v15 || v14 > [v15 precedence]) {
        [(SBIdleTimerAggregateClientConfiguration *)v3 setDisablesTimerWithPrecedence:v14];
      }

      if (v14 == 2) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v17 = [(NSMutableDictionary *)self->_minExpirationConfigurations allValues];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v23 = [v22 precedence];
        [v22 minExpirationTimeout];
        -[SBIdleTimerAggregateClientConfiguration setMinExpirationTimeout:ifGreatestForPrecedence:](v3, "setMinExpirationTimeout:ifGreatestForPrecedence:", v23);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v19);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v24 = [(NSMutableDictionary *)self->_maxEpirationConfigurations allValues];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        uint64_t v30 = [v29 precedence];
        [v29 maxExpirationTimeout];
        -[SBIdleTimerAggregateClientConfiguration setMaxExpirationTimeout:ifLeastForPrecedence:](v3, "setMaxExpirationTimeout:ifLeastForPrecedence:", v30);
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v26);
  }

  v31 = [(SBIdleTimerAggregateClientConfiguration *)v3 disableTimerSetting];
  if (v31
    || ([(SBIdleTimerAggregateClientConfiguration *)v3 minExpirationTimeoutSettings],
        (v31 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v34 = [(SBIdleTimerAggregateClientConfiguration *)v3 maxExpirationTimeoutSettings];

    if (!v34)
    {
      aggregateClientConfiguration = self->_aggregateClientConfiguration;
      self->_aggregateClientConfiguration = 0;
      goto LABEL_38;
    }
  }
  v32 = v3;
  aggregateClientConfiguration = self->_aggregateClientConfiguration;
  self->_aggregateClientConfiguration = v32;
LABEL_38:
}

- (void)_removeAssertionsForReason:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBIdleTimerService.m", 323, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  BSDispatchQueueAssert();
  [(NSMutableSet *)self->_mediaPlaybackDisableReasons removeObject:v7];
  uint64_t v5 = +[SBScreenLongevityController sharedInstanceIfExists];
  [v5 evaluateEnablement];

  [(NSMutableDictionary *)self->_disableTimerConfigurations removeObjectForKey:v7];
  [(NSMutableDictionary *)self->_minExpirationConfigurations removeObjectForKey:v7];
  [(NSMutableDictionary *)self->_maxEpirationConfigurations removeObjectForKey:v7];
  [(SBIdleTimerService *)self _removeConfigurationInfoForReason:v7 fromArray:self->_access_idleExpirationHandlers];
  [(SBIdleTimerService *)self _removeConfigurationInfoForReason:v7 fromArray:self->_access_idleWarnHandlers];
  [(SBIdleTimerService *)self _removeConfigurationInfoForReason:v7 fromArray:self->_access_idleUserAttentionResetHandlers];
}

- (void)_addStateCaptureHandlers
{
  uint64_t v5 = self;
  uint64_t v2 = v5;
  uint64_t v3 = BSLogAddStateCaptureBlockWithTitle();
  stateCaptureAssertion = v2->_stateCaptureAssertion;
  v2->_stateCaptureAssertion = (BSInvalidatable *)v3;
}

__CFString *__46__SBIdleTimerService__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = [v1 _stateCaptureDescription];
  }
  else
  {
    uint64_t v2 = &stru_1F3084718;
  }
  return v2;
}

- (id)_stateCaptureDescription
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __46__SBIdleTimerService__stateCaptureDescription__block_invoke;
  id v11 = &unk_1E6AF5290;
  id v12 = v3;
  id v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:0 multilinePrefix:0 block:&v8];
  os_unfair_lock_unlock(p_accessLock);
  uint64_t v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return v6;
}

uint64_t __46__SBIdleTimerService__stateCaptureDescription__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 88) withName:@"AggregateClientConfiguration" skipIfNil:1];
  [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 40) withName:@"DisableTimerConfigurations" skipIfEmpty:1];
  [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 48) withName:@"MinExpirationConfigurations" skipIfEmpty:1];
  [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 56) withName:@"maxExpirationConfigurations" skipIfEmpty:1];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 64) allObjects];
  [v3 appendArraySection:v4 withName:@"mediaPlaybackDisableReasons" skipIfEmpty:1];

  [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 16) withName:@"idleExpirationHandlers" skipIfEmpty:1];
  [*(id *)(a1 + 32) appendArraySection:*(void *)(*(void *)(a1 + 40) + 24) withName:@"idleWarnHandlers" skipIfEmpty:1];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 32);
  return [v5 appendArraySection:v6 withName:@"idleUserAttentionResetHandlers" skipIfEmpty:1];
}

- (void)_addConfigurationInfo:(id)a3 toSortedArray:(id)a4
{
  p_accessLock = &self->_accessLock;
  id v6 = a4;
  id v7 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [v6 addObject:v7];

  [v6 sortUsingComparator:&__block_literal_global_67_0];
  os_unfair_lock_unlock(p_accessLock);
}

uint64_t __58__SBIdleTimerService__addConfigurationInfo_toSortedArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 configuration];
  unint64_t v6 = [v5 precedence];

  id v7 = [v4 configuration];

  unint64_t v8 = [v7 precedence];
  uint64_t v9 = 1;
  if (v6 <= v8) {
    uint64_t v9 = -1;
  }
  if (v6 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

- (void)_removeConfigurationInfoForReason:(id)a3 fromArray:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  if ([v6 count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [v6 objectAtIndex:v8];
      uint64_t v10 = [v9 reason];
      int v11 = [v10 isEqualToString:v12];

      if (v11) {
        break;
      }
      if ([v6 count] <= (unint64_t)++v8) {
        goto LABEL_8;
      }
    }
    if ((v8 & 0x8000000000000000) == 0) {
      [v6 removeObjectAtIndex:v8];
    }
  }
LABEL_8:
  os_unfair_lock_unlock(p_accessLock);
}

- (BOOL)_isMediaPlaybackClient:(id)a3
{
  uint64_t v3 = [a3 bundleIdentifier];
  char v4 = [v3 isEqual:@"com.apple.mediaplaybackd"];

  return v4;
}

- (SBIdleTimerServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIdleTimerServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBIdleTimerAggregateClientConfiguration)aggregateClientConfiguration
{
  return self->_aggregateClientConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateClientConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackDisableReasons, 0);
  objc_storeStrong((id *)&self->_maxEpirationConfigurations, 0);
  objc_storeStrong((id *)&self->_minExpirationConfigurations, 0);
  objc_storeStrong((id *)&self->_disableTimerConfigurations, 0);
  objc_storeStrong((id *)&self->_access_idleUserAttentionResetHandlers, 0);
  objc_storeStrong((id *)&self->_access_idleWarnHandlers, 0);
  objc_storeStrong((id *)&self->_access_idleExpirationHandlers, 0);
}

@end