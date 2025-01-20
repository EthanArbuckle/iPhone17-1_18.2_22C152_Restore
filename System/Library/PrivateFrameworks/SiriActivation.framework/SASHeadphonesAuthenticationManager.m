@interface SASHeadphonesAuthenticationManager
- (BOOL)_inEarDetectionStateEligibleForState:(id)a3;
- (BOOL)_shouldIgnoreConnectionChangesForState:(id)a3;
- (BOOL)_wearingSessionEligible;
- (BOOL)isAuthenticated;
- (SASHeadphonesAuthenticationManager)init;
- (id)_headphonesMonitor;
- (id)_initForTesting;
- (id)_lockStateMonitor;
- (void)_fetchInitialState;
- (void)_invalidateAuthenticationWithReason:(int64_t)a3;
- (void)_logEligibilityForAuthenticatedState:(BOOL)a3 andTimedOut:(BOOL)a4;
- (void)_recomputeAuthentication;
- (void)_startObserving;
- (void)currentAudioRouteDidChange:(id)a3;
- (void)dealloc;
- (void)didChangeLockState:(unint64_t)a3;
- (void)getHeadphonesAuthenticationStatusWithCompletion:(id)a3;
- (void)inEarDetectionStateDidChangeForBTAddress:(id)a3 toState:(id)a4;
- (void)privateAudioSessionStateDidChange:(unint64_t)a3;
@end

@implementation SASHeadphonesAuthenticationManager

- (SASHeadphonesAuthenticationManager)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SASHeadphonesAuthenticationManager;
  v2 = [(SASHeadphonesAuthenticationManager *)&v10 init];
  if (v2)
  {
    v3 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[SASHeadphonesAuthenticationManager init]";
      _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s 🎧 Initializing SASHeadphonesAuthenticationManager", buf, 0xCu);
    }
    dispatch_queue_t v4 = dispatch_queue_create("SASHeadphonesAuthenticationManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_initWeak((id *)buf, v2);
    v6 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__SASHeadphonesAuthenticationManager_init__block_invoke;
    block[3] = &unk_1E6B675D8;
    objc_copyWeak(&v9, (id *)buf);
    dispatch_async(v6, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

void __42__SASHeadphonesAuthenticationManager_init__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x1E4FB36F0] sharedManager];
    int v3 = [v2 isSharedIPad];

    if (v3)
    {
      dispatch_queue_t v4 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        v6 = "-[SASHeadphonesAuthenticationManager init]_block_invoke";
        _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s 🎧 Headphones authentication is not supported on Shared iPads", (uint8_t *)&v5, 0xCu);
      }
    }
    else
    {
      [WeakRetained _startObserving];
      [WeakRetained didChangeLockState:2];
      [WeakRetained _fetchInitialState];
    }
  }
}

- (id)_headphonesMonitor
{
  headphonesMonitor = self->_headphonesMonitor;
  if (!headphonesMonitor)
  {
    dispatch_queue_t v4 = [MEMORY[0x1E4F4E5A0] sharedMonitor];
    int v5 = self->_headphonesMonitor;
    self->_headphonesMonitor = v4;

    headphonesMonitor = self->_headphonesMonitor;
  }
  return headphonesMonitor;
}

- (id)_lockStateMonitor
{
  lockStateMonitor = self->_lockStateMonitor;
  if (!lockStateMonitor)
  {
    dispatch_queue_t v4 = objc_alloc_init(SASLockStateMonitor);
    int v5 = self->_lockStateMonitor;
    self->_lockStateMonitor = v4;

    lockStateMonitor = self->_lockStateMonitor;
  }
  return lockStateMonitor;
}

- (void)_startObserving
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[SASHeadphonesAuthenticationManager _startObserving]";
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s 🎧 Adding delegates", (uint8_t *)&v7, 0xCu);
  }
  dispatch_queue_t v4 = [(SASHeadphonesAuthenticationManager *)self _lockStateMonitor];
  [v4 setDelegate:self];

  int v5 = [(SASHeadphonesAuthenticationManager *)self _headphonesMonitor];
  [v5 addDelegate:self];

  v6 = [(SASHeadphonesAuthenticationManager *)self _headphonesMonitor];
  [v6 startObservingBluetoothConnections];
}

- (void)_fetchInitialState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SASHeadphonesAuthenticationManager _fetchInitialState]";
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s 🎧 Fetching initial state", buf, 0xCu);
  }
  dispatch_queue_t v4 = [(SASHeadphonesAuthenticationManager *)self _headphonesMonitor];
  int v5 = [v4 currentAudioRoute];

  [(SASHeadphonesAuthenticationManager *)self currentAudioRouteDidChange:v5];
  objc_initWeak((id *)buf, self);
  if ([v5 hasAuthenticationCapability])
  {
    v6 = [(SASHeadphonesAuthenticationManager *)self _headphonesMonitor];
    int v7 = [v5 btAddress];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke;
    v11[3] = &unk_1E6B67B28;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v5;
    [v6 fetchInEarDetctionStateForBTAddress:v7 withCompletion:v11];

    objc_destroyWeak(&v13);
  }
  v8 = [(SASHeadphonesAuthenticationManager *)self _headphonesMonitor];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_3;
  v9[3] = &unk_1E6B67B50;
  objc_copyWeak(&v10, (id *)buf);
  [v8 fetchPrivateSessionStateWithCompletion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    int v5 = WeakRetained[2];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_2;
    v6[3] = &unk_1E6B67B00;
    objc_copyWeak(&v9, &location);
    id v7 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v5, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) btAddress];
    [WeakRetained inEarDetectionStateDidChangeForBTAddress:v2 toState:*(void *)(a1 + 40)];
  }
}

void __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    dispatch_queue_t v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_4;
    block[3] = &unk_1E6B675B0;
    objc_copyWeak(v6, &location);
    v6[1] = a2;
    dispatch_async(v4, block);
    objc_destroyWeak(v6);
    objc_destroyWeak(&location);
  }
}

void __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained privateAudioSessionStateDidChange:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (id)_initForTesting
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SASHeadphonesAuthenticationManager;
  v2 = [(SASHeadphonesAuthenticationManager *)&v7 init];
  if (v2)
  {
    id v3 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[SASHeadphonesAuthenticationManager _initForTesting]";
      _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s 🎧 Initializing SASHeadphonesAuthenticationManager for testing", buf, 0xCu);
    }
    dispatch_queue_t v4 = dispatch_queue_create("SASHeadphonesAuthenticationManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)privateAudioSessionStateDidChange:(unint64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SASHeadphonesAuthenticationManager_privateAudioSessionStateDidChange___block_invoke;
  block[3] = &unk_1E6B675B0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __72__SASHeadphonesAuthenticationManager_privateAudioSessionStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 40) != WeakRetained[8])
  {
    dispatch_queue_t v4 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v6 = v3[8];
      objc_super v7 = v4;
      id v8 = [v5 numberWithUnsignedInteger:v6];
      id v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 40)];
      int v10 = 136315650;
      v11 = "-[SASHeadphonesAuthenticationManager privateAudioSessionStateDidChange:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s 🎧 AFPrivateAudioSessionState changed from %@ to %@", (uint8_t *)&v10, 0x20u);
    }
    [v3 _invalidateAuthenticationWithReason:4];
    *((unsigned char *)v3 + 57) = 0;
    v3[8] = *(void *)(a1 + 40);
    if (!*((unsigned char *)v3 + 40) && *(void *)(a1 + 40) == 1)
    {
      *((unsigned char *)v3 + 57) = 1;
      [v3 _recomputeAuthentication];
    }
  }
}

- (void)currentAudioRouteDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SASHeadphonesAuthenticationManager_currentAudioRouteDidChange___block_invoke;
  block[3] = &unk_1E6B676F8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__SASHeadphonesAuthenticationManager_currentAudioRouteDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) hash];
    if (v3 != [WeakRetained[9] hash])
    {
      id v4 = (void *)*MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(void **)(a1 + 32);
        id v6 = v4;
        objc_super v7 = [v5 avscRouteDescription];
        int v9 = 136315394;
        int v10 = "-[SASHeadphonesAuthenticationManager currentAudioRouteDidChange:]_block_invoke";
        __int16 v11 = 2112;
        __int16 v12 = v7;
        _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s 🎧 AFSiriAudioRoute changed to %@", (uint8_t *)&v9, 0x16u);
      }
      [WeakRetained _invalidateAuthenticationWithReason:2];
      *((unsigned char *)WeakRetained + 59) = 0;
      id v8 = [*(id *)(a1 + 32) btAddress];
      [WeakRetained inEarDetectionStateDidChangeForBTAddress:v8 toState:0];

      objc_storeStrong(WeakRetained + 9, *(id *)(a1 + 32));
      if (!*((unsigned char *)WeakRetained + 40) && [*(id *)(a1 + 32) hasAuthenticationCapability])
      {
        *((unsigned char *)WeakRetained + 59) = 1;
        [WeakRetained _recomputeAuthentication];
      }
    }
  }
}

- (void)inEarDetectionStateDidChangeForBTAddress:(id)a3 toState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__SASHeadphonesAuthenticationManager_inEarDetectionStateDidChangeForBTAddress_toState___block_invoke;
  v11[3] = &unk_1E6B67B00;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __87__SASHeadphonesAuthenticationManager_inEarDetectionStateDidChangeForBTAddress_toState___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained
    && (![a1[4] isEqualToString:WeakRetained[10]]
     || ([a1[5] isEqual:WeakRetained[11]] & 1) == 0))
  {
    uint64_t v3 = (os_log_t *)MEMORY[0x1E4F4E360];
    id v4 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = a1[4];
      id v6 = a1[5];
      int v8 = 136315650;
      id v9 = "-[SASHeadphonesAuthenticationManager inEarDetectionStateDidChangeForBTAddress:toState:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s 🎧 InEarDetectionState changed to (%@)%@", (uint8_t *)&v8, 0x20u);
    }
    if ([WeakRetained _shouldIgnoreConnectionChangesForState:a1[5]])
    {
      id v7 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        id v9 = "-[SASHeadphonesAuthenticationManager inEarDetectionStateDidChangeForBTAddress:toState:]_block_invoke";
        _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s 🎧 Ignoring invalidation for in-ear detection state changes for the secondary bud inside the case", (uint8_t *)&v8, 0xCu);
      }
      objc_storeStrong(WeakRetained + 11, a1[5]);
    }
    else
    {
      [WeakRetained _invalidateAuthenticationWithReason:3];
      *((unsigned char *)WeakRetained + 56) = 0;
      objc_storeStrong(WeakRetained + 10, a1[4]);
      objc_storeStrong(WeakRetained + 11, a1[5]);
      if (!*((unsigned char *)WeakRetained + 40)
        && [WeakRetained _inEarDetectionStateEligibleForState:a1[5]])
      {
        *((unsigned char *)WeakRetained + 56) = 1;
        [WeakRetained _recomputeAuthentication];
      }
    }
  }
}

- (void)didChangeLockState:(unint64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SASHeadphonesAuthenticationManager_didChangeLockState___block_invoke;
  block[3] = &unk_1E6B675B0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __57__SASHeadphonesAuthenticationManager_didChangeLockState___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 58) = 0;
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = (os_log_t *)MEMORY[0x1E4F4E360];
    id v6 = *MEMORY[0x1E4F4E360];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT);
    if ((v4 & 2) != 0)
    {
      if (v7)
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v15 = *((unsigned __int8 *)v3 + 40);
        id v11 = v6;
        __int16 v12 = [v14 numberWithBool:v15];
        int v16 = 136315394;
        v17 = "-[SASHeadphonesAuthenticationManager didChangeLockState:]_block_invoke";
        __int16 v18 = 2112;
        v19 = v12;
        id v13 = "%s 🎧 Phone locked! _authenticated: %@";
        goto LABEL_10;
      }
    }
    else
    {
      if (v7)
      {
        int v16 = 136315138;
        v17 = "-[SASHeadphonesAuthenticationManager didChangeLockState:]_block_invoke";
        _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s 🎧 Phone unlocked!", (uint8_t *)&v16, 0xCu);
      }
      *((unsigned char *)v3 + 58) = 1;
      if (!*((unsigned char *)v3 + 40))
      {
        [v3 _recomputeAuthentication];
        goto LABEL_12;
      }
      v3[6] = CFAbsoluteTimeGetCurrent();
      os_log_t v8 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (void *)MEMORY[0x1E4F28ED0];
        double v10 = v3[6];
        id v11 = v8;
        __int16 v12 = [v9 numberWithDouble:v10];
        int v16 = 136315394;
        v17 = "-[SASHeadphonesAuthenticationManager didChangeLockState:]_block_invoke";
        __int16 v18 = 2112;
        v19 = v12;
        id v13 = "%s 🎧 Authenticated time bumped to: %@";
LABEL_10:
        _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0x16u);
      }
    }
  }
LABEL_12:
}

- (BOOL)isAuthenticated
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (os_log_t *)MEMORY[0x1E4F4E360];
  uint64_t v4 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)MEMORY[0x1E4F29060];
    id v6 = v4;
    BOOL v7 = [v5 currentThread];
    int v15 = 136315394;
    int v16 = "-[SASHeadphonesAuthenticationManager isAuthenticated]";
    __int16 v17 = 2048;
    uint64_t v18 = [v7 qualityOfService];
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock about to lock with qos: %zd", (uint8_t *)&v15, 0x16u);
  }
  os_unfair_lock_lock(&self->_authenticatedLock);
  os_log_t v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    int v16 = "-[SASHeadphonesAuthenticationManager isAuthenticated]";
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock successfully locked", (uint8_t *)&v15, 0xCu);
  }
  BOOL authenticated = self->_authenticated;
  BOOL v10 = self->_authenticated;
  double authenticatedTime = self->_authenticatedTime;
  os_unfair_lock_unlock(&self->_authenticatedLock);
  __int16 v12 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    int v16 = "-[SASHeadphonesAuthenticationManager isAuthenticated]";
    _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock unlocked", (uint8_t *)&v15, 0xCu);
  }
  double v13 = CFAbsoluteTimeGetCurrent() - authenticatedTime;
  if (authenticated && v13 >= 5400.0)
  {
    [(SASHeadphonesAuthenticationManager *)self _invalidateAuthenticationWithReason:1];
    BOOL v10 = 0;
  }
  [(SASHeadphonesAuthenticationManager *)self _logEligibilityForAuthenticatedState:v10 andTimedOut:v13 >= 5400.0];
  return v10;
}

- (void)_logEligibilityForAuthenticatedState:(BOOL)a3 andTimedOut:(BOOL)a4
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__SASHeadphonesAuthenticationManager__logEligibilityForAuthenticatedState_andTimedOut___block_invoke;
  block[3] = &unk_1E6B67B78;
  objc_copyWeak(&v9, &location);
  BOOL v10 = a3;
  BOOL v11 = a4;
  dispatch_async(queue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __87__SASHeadphonesAuthenticationManager__logEligibilityForAuthenticatedState_andTimedOut___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
      uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
      id v6 = v3;
      BOOL v7 = [v4 numberWithBool:v5];
      os_log_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:WeakRetained[58]];
      id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:WeakRetained[59]];
      BOOL v10 = [MEMORY[0x1E4F28ED0] numberWithBool:WeakRetained[56]];
      BOOL v11 = [MEMORY[0x1E4F28ED0] numberWithBool:WeakRetained[57]];
      __int16 v12 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 41)];
      int v13 = 136316674;
      uint64_t v14 = "-[SASHeadphonesAuthenticationManager _logEligibilityForAuthenticatedState:andTimedOut:]_block_invoke";
      __int16 v15 = 2112;
      int v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      v22 = v10;
      __int16 v23 = 2112;
      v24 = v11;
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s 🎧 authenticated: %@, _lockStateEligible: %@, _routeEligible: %@, _inEarStateEligible: %@, _sessionStateEligible: %@, timedOut: %@", (uint8_t *)&v13, 0x48u);
    }
  }
}

- (void)getHeadphonesAuthenticationStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__SASHeadphonesAuthenticationManager_getHeadphonesAuthenticationStatusWithCompletion___block_invoke;
    block[3] = &unk_1E6B67BA0;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_async(queue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      -[SASHeadphonesAuthenticationManager getHeadphonesAuthenticationStatusWithCompletion:](v6);
    }
  }
}

void __86__SASHeadphonesAuthenticationManager_getHeadphonesAuthenticationStatusWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [WeakRetained isAuthenticated]);
    id WeakRetained = v3;
  }
}

- (BOOL)_inEarDetectionStateEligibleForState:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 isEnabled]
    && ([v3 primaryInEarStatus] == 3 || objc_msgSend(v3, "secondaryInEarStatus") == 3)
    && [v3 primaryInEarStatus] != 2
    && [v3 secondaryInEarStatus] != 2;

  return v4;
}

- (BOOL)_shouldIgnoreConnectionChangesForState:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = -[AFBluetoothHeadphoneInEarDetectionState secondaryInEarStatus](self->_inEarDetectionState, "secondaryInEarStatus") == 1&& [v4 secondaryInEarStatus] == 0;
  if ([(AFBluetoothHeadphoneInEarDetectionState *)self->_inEarDetectionState secondaryInEarStatus])
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [v4 secondaryInEarStatus] == 1;
  }
  BOOL v7 = v5 || v6;
  if (v5 || v6)
  {
    id v8 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)MEMORY[0x1E4F28ED0];
      BOOL v10 = v8;
      BOOL v11 = [v9 numberWithBool:v5];
      __int16 v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
      int v14 = 136315650;
      __int16 v15 = "-[SASHeadphonesAuthenticationManager _shouldIgnoreConnectionChangesForState:]";
      __int16 v16 = 2112;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      __int16 v19 = v12;
      _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s 🎧 Secondary bud (in-case): disconnected: %@, reconnected: %@", (uint8_t *)&v14, 0x20u);
    }
  }

  return v7;
}

- (BOOL)_wearingSessionEligible
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)MEMORY[0x1E4F28ED0];
    BOOL authenticated = self->_authenticated;
    BOOL v6 = v3;
    BOOL v7 = [v4 numberWithBool:authenticated];
    id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_lockStateEligible];
    id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_routeEligible];
    BOOL v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_inEarStateEligible];
    BOOL v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_sessionStateEligible];
    int v13 = 136316418;
    int v14 = "-[SASHeadphonesAuthenticationManager _wearingSessionEligible]";
    __int16 v15 = 2112;
    __int16 v16 = v7;
    __int16 v17 = 2112;
    __int16 v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s 🎧 _authenticated: %@, _lockStateEligible: %@, _routeEligible: %@, _inEarStateEligible: %@, _sessionStateEligible: %@", (uint8_t *)&v13, 0x3Eu);
  }
  return !self->_authenticated
      && self->_routeEligible
      && self->_lockStateEligible
      && self->_sessionStateEligible
      && self->_inEarStateEligible;
}

- (void)_recomputeAuthentication
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v4 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = (void *)MEMORY[0x1E4F29060];
    BOOL v6 = v4;
    BOOL v7 = [v5 currentThread];
    int v10 = 136315394;
    BOOL v11 = "-[SASHeadphonesAuthenticationManager _recomputeAuthentication]";
    __int16 v12 = 2048;
    uint64_t v13 = [v7 qualityOfService];
    _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock about to lock with qos: %zd", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock(&self->_authenticatedLock);
  id v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    BOOL v11 = "-[SASHeadphonesAuthenticationManager _recomputeAuthentication]";
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock successfully locked", (uint8_t *)&v10, 0xCu);
  }
  if ([(SASHeadphonesAuthenticationManager *)self _wearingSessionEligible])
  {
    self->_BOOL authenticated = 1;
    self->_double authenticatedTime = CFAbsoluteTimeGetCurrent();
  }
  os_unfair_lock_unlock(&self->_authenticatedLock);
  id v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    BOOL v11 = "-[SASHeadphonesAuthenticationManager _recomputeAuthentication]";
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock unlocked", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_invalidateAuthenticationWithReason:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  BOOL v6 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = (void *)MEMORY[0x1E4F29060];
    id v8 = v6;
    id v9 = [v7 currentThread];
    int v15 = 136315394;
    __int16 v16 = "-[SASHeadphonesAuthenticationManager _invalidateAuthenticationWithReason:]";
    __int16 v17 = 2048;
    uint64_t v18 = [v9 qualityOfService];
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock about to lock with qos: %zd", (uint8_t *)&v15, 0x16u);
  }
  os_unfair_lock_lock(&self->_authenticatedLock);
  int v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    __int16 v16 = "-[SASHeadphonesAuthenticationManager _invalidateAuthenticationWithReason:]";
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock successfully locked", (uint8_t *)&v15, 0xCu);
  }
  if (self->_authenticated)
  {
    os_log_t v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = v11;
      uint64_t v13 = SASHeadphonesAuthenticationInvalidationReasonGetName(a3);
      int v15 = 136315394;
      __int16 v16 = "-[SASHeadphonesAuthenticationManager _invalidateAuthenticationWithReason:]";
      __int16 v17 = 2112;
      uint64_t v18 = (uint64_t)v13;
      _os_log_impl(&dword_1D9588000, v12, OS_LOG_TYPE_DEFAULT, "%s 🎧 Invalidating authentication for reason: %@", (uint8_t *)&v15, 0x16u);
    }
    self->_BOOL authenticated = 0;
  }
  os_unfair_lock_unlock(&self->_authenticatedLock);
  uint64_t v14 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    __int16 v16 = "-[SASHeadphonesAuthenticationManager _invalidateAuthenticationWithReason:]";
    _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock unlocked", (uint8_t *)&v15, 0xCu);
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v7 = "-[SASHeadphonesAuthenticationManager dealloc]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s 🎧 Deallocating: %@", buf, 0x16u);
  }
  lockStateMonitor = self->_lockStateMonitor;
  self->_lockStateMonitor = 0;

  v5.receiver = self;
  v5.super_class = (Class)SASHeadphonesAuthenticationManager;
  [(SASHeadphonesAuthenticationManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inEarDetectionState, 0);
  objc_storeStrong((id *)&self->_inEarDetectionBTAddress, 0);
  objc_storeStrong((id *)&self->_audioRoute, 0);
  objc_storeStrong((id *)&self->_headphonesMonitor, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)getHeadphonesAuthenticationStatusWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[SASHeadphonesAuthenticationManager getHeadphonesAuthenticationStatusWithCompletion:]";
  _os_log_error_impl(&dword_1D9588000, log, OS_LOG_TYPE_ERROR, "%s 🎧 No completion handler provided.", (uint8_t *)&v1, 0xCu);
}

@end