@interface SBFAlwaysOnLiveRenderingAssertionManager
- (NSString)debugDescription;
- (NSString)description;
- (SBFAlwaysOnLiveRenderingAssertionManager)initWithBacklight:(id)a3 assertionProvider:(id)a4 attributesProvider:(id)a5;
- (id)_nextLiveRenderingAssertionProxyIfAny;
- (id)acquireLiveRenderingAssertionWithReason:(id)a3;
- (id)backlight;
- (void)_acquireLiveRenderingAssertionIfNeededForProxy:(id)a3 backlight:(id)a4;
- (void)_acquireLiveRenderingAssertionProxy:(id)a3;
- (void)_invalidateWithReason:(id)a3;
- (void)_releaseLiveRenderingAssertionProxy:(id)a3;
- (void)_releaseLiveRenderingAssertionWithReason:(id)a3;
- (void)assertion:(id)a3 didCancelWithError:(id)a4;
- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4;
- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBFAlwaysOnLiveRenderingAssertionManager

- (SBFAlwaysOnLiveRenderingAssertionManager)initWithBacklight:(id)a3 assertionProvider:(id)a4 attributesProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBFAlwaysOnLiveRenderingAssertionManager;
  v12 = [(SBFAlwaysOnLiveRenderingAssertionManager *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_backlight, a3);
    objc_storeStrong((id *)&v13->_assertionProvider, a4);
    objc_storeStrong((id *)&v13->_attributesProvider, a5);
    v14 = objc_alloc_init(SBFAlwaysOnLiveRenderingAssertionWeakCollection);
    liveRenderingAssertionProxies = v13->_liveRenderingAssertionProxies;
    v13->_liveRenderingAssertionProxies = v14;

    [(BLSBacklightStateObservable *)v13->_backlight addObserver:v13];
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = SBLogLiveRendering();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_INFO, "Deallocated %@", buf, 0xCu);
  }

  [(SBFAlwaysOnLiveRenderingAssertionManager *)self _invalidateWithReason:@"dealloc"];
  v4.receiver = self;
  v4.super_class = (Class)SBFAlwaysOnLiveRenderingAssertionManager;
  [(SBFAlwaysOnLiveRenderingAssertionManager *)&v4 dealloc];
}

- (id)acquireLiveRenderingAssertionWithReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [SBFAlwaysOnLiveRenderingAssertion alloc];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __84__SBFAlwaysOnLiveRenderingAssertionManager_acquireLiveRenderingAssertionWithReason___block_invoke;
  id v11 = &unk_1E548CFC8;
  objc_copyWeak(&v12, &location);
  v6 = [(SBFAlwaysOnLiveRenderingAssertion *)v5 initWithReason:v4 timeout:&v8 invalidationHandler:10.0];
  -[SBFAlwaysOnLiveRenderingAssertionManager _acquireLiveRenderingAssertionProxy:](self, "_acquireLiveRenderingAssertionProxy:", v6, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __84__SBFAlwaysOnLiveRenderingAssertionManager_acquireLiveRenderingAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _releaseLiveRenderingAssertionProxy:v5];
  }
}

- (void)invalidate
{
}

- (void)_invalidateWithReason:(id)a3
{
  liveRenderingAssertionProxies = self->_liveRenderingAssertionProxies;
  id v5 = a3;
  [(SBFAlwaysOnLiveRenderingAssertionWeakCollection *)liveRenderingAssertionProxies invalidateAll];
  [(SBFAlwaysOnLiveRenderingAssertionManager *)self _releaseLiveRenderingAssertionWithReason:v5];
}

- (void)_acquireLiveRenderingAssertionProxy:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBFAlwaysOnLiveRenderingAssertionWeakCollection *)self->_liveRenderingAssertionProxies addAssertion:v4];
  id v5 = SBLogLiveRendering();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_INFO, "%@ Acquired live-rendering %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = [(SBFAlwaysOnLiveRenderingAssertionManager *)self backlight];
  [(SBFAlwaysOnLiveRenderingAssertionManager *)self _acquireLiveRenderingAssertionIfNeededForProxy:v4 backlight:v6];
}

- (void)_releaseLiveRenderingAssertionProxy:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBFAlwaysOnLiveRenderingAssertionWeakCollection *)self->_liveRenderingAssertionProxies removeAssertion:v4];
  id v5 = SBLogLiveRendering();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_INFO, "%@ Released live-rendering  %@", (uint8_t *)&v6, 0x16u);
  }

  if ([(SBFAlwaysOnLiveRenderingAssertionWeakCollection *)self->_liveRenderingAssertionProxies isEmpty]) {
    [(SBFAlwaysOnLiveRenderingAssertionManager *)self _releaseLiveRenderingAssertionWithReason:@"All live-rendering assertion proxies have been released"];
  }
}

- (id)_nextLiveRenderingAssertionProxyIfAny
{
  return [(SBFAlwaysOnLiveRenderingAssertionWeakCollection *)self->_liveRenderingAssertionProxies mostRecentlyCreatedValidAssertion];
}

- (void)_acquireLiveRenderingAssertionIfNeededForProxy:(id)a3 backlight:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 || ([v6 isValid] & 1) == 0)
  {
    __int16 v8 = SBLogLiveRendering();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      v28 = self;
      _os_log_impl(&dword_18B52E000, v8, OS_LOG_TYPE_INFO, "%@ Ignoring live-rendering assertion acquisition request because of there are no valid pending proxies", (uint8_t *)&v27, 0xCu);
    }
    goto LABEL_21;
  }
  __int16 v8 = [(SBFAlwaysOnLiveRenderingBLSAttributesProvider *)self->_attributesProvider assertionAttributes];
  if (![v8 count])
  {
    id v12 = SBLogLiveRendering();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBFAlwaysOnLiveRenderingAssertionManager _acquireLiveRenderingAssertionIfNeededForProxy:backlight:]((uint64_t)self, (uint64_t)v6, v12);
    }
    goto LABEL_20;
  }
  if ([v7 backlightState] != 1)
  {
    id v12 = SBLogLiveRendering();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    [v7 backlightState];
    NSStringFromBLSBacklightState();
    v14 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
    int v27 = 138412802;
    v28 = self;
    __int16 v29 = 2112;
    v30 = (BLSAssertion *)v6;
    __int16 v31 = 2112;
    v32 = v14;
    v16 = "%@ Ignoring live-rendering assertion acquisition request for %@ because backlight state is %@";
LABEL_18:
    objc_super v17 = v12;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint32_t v19 = 32;
LABEL_19:
    _os_log_impl(&dword_18B52E000, v17, v18, v16, (uint8_t *)&v27, v19);

    goto LABEL_20;
  }
  if (![v7 flipbookState])
  {
    id v12 = SBLogLiveRendering();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    [v7 flipbookState];
    NSStringFromBLSFlipbookState();
    v14 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
    int v27 = 138412802;
    v28 = self;
    __int16 v29 = 2112;
    v30 = (BLSAssertion *)v6;
    __int16 v31 = 2112;
    v32 = v14;
    v16 = "%@ Ignoring live-rendering assertion acquisition request for %@ because flipbook state is %@";
    goto LABEL_18;
  }
  liveRenderingAssertion = self->_liveRenderingAssertion;
  if (liveRenderingAssertion)
  {
    int v10 = [(BLSAssertion *)liveRenderingAssertion isAcquired];
    uint64_t v11 = self->_liveRenderingAssertion;
    if (v10)
    {
      [(BLSAssertion *)v11 restartTimeoutTimer];
      id v12 = SBLogLiveRendering();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
        v15 = self->_liveRenderingAssertion;
        int v27 = 138413058;
        v28 = self;
        __int16 v29 = 2112;
        v30 = v14;
        __int16 v31 = 2048;
        v32 = v15;
        __int16 v33 = 2112;
        v34 = (BLSAssertion *)v6;
        v16 = "%@ Tickled live-rendering <%@; %p> for %@";
        objc_super v17 = v12;
        os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
LABEL_25:
        uint32_t v19 = 42;
        goto LABEL_19;
      }
LABEL_20:

      goto LABEL_21;
    }
    if (v11)
    {
      id v12 = SBLogLiveRendering();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v14 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
      v21 = self->_liveRenderingAssertion;
      int v27 = 138413058;
      v28 = self;
      __int16 v29 = 2112;
      v30 = (BLSAssertion *)v6;
      __int16 v31 = 2112;
      v32 = v14;
      __int16 v33 = 2048;
      v34 = v21;
      v16 = "%@ Ignoring live-rendering assertion acquisition for %@ because <%@; %p> is pending acquisition";
      objc_super v17 = v12;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
      goto LABEL_25;
    }
  }
  v22 = SBLogLiveRendering();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    int v27 = 138412546;
    v28 = self;
    __int16 v29 = 2112;
    v30 = (BLSAssertion *)v6;
    _os_log_impl(&dword_18B52E000, v22, OS_LOG_TYPE_INFO, "%@ Will acquire live-rendering assertion for %@", (uint8_t *)&v27, 0x16u);
  }

  assertionProvider = self->_assertionProvider;
  v24 = [v6 reason];
  v25 = [(SBFAlwaysOnLiveRenderingBLSAssertionProvider *)assertionProvider acquireWithExplanation:v24 attributes:v8];
  v26 = self->_liveRenderingAssertion;
  self->_liveRenderingAssertion = v25;

  [(BLSAssertion *)self->_liveRenderingAssertion addObserver:self];
LABEL_21:
}

- (void)_releaseLiveRenderingAssertionWithReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  liveRenderingAssertion = self->_liveRenderingAssertion;
  id v6 = SBLogLiveRendering();
  id v7 = v6;
  if (liveRenderingAssertion)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v10 = self->_liveRenderingAssertion;
      int v12 = 138413058;
      v13 = self;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2048;
      objc_super v17 = v10;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_18B52E000, v7, OS_LOG_TYPE_DEFAULT, "%@ Will release live-rendering <%@; %p> with reason '%@'",
        (uint8_t *)&v12,
        0x2Au);
    }
    uint64_t v11 = self->_liveRenderingAssertion;
    self->_liveRenderingAssertion = 0;
    id v7 = v11;

    [v7 invalidate];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_18B52E000, v7, OS_LOG_TYPE_INFO, "%@ Ignored live-rendering assertion release with reason '%@' because we are not holding any", (uint8_t *)&v12, 0x16u);
  }
}

- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_liveRenderingAssertion == a3)
  {
    id v7 = SBLogLiveRendering();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v9);
      liveRenderingAssertion = self->_liveRenderingAssertion;
      *(_DWORD *)buf = 138413058;
      v13 = self;
      __int16 v14 = 2112;
      id v15 = v10;
      __int16 v16 = 2048;
      objc_super v17 = liveRenderingAssertion;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl(&dword_18B52E000, v7, OS_LOG_TYPE_ERROR, "%@ Could not acquire live-rendering <%@; %p> with error '%@'",
        buf,
        0x2Au);
    }
    __int16 v8 = [NSString stringWithFormat:@"Failed to acquire assertion with error '%@'", v6];
    [(SBFAlwaysOnLiveRenderingAssertionManager *)self _releaseLiveRenderingAssertionWithReason:v8];
  }
}

- (void)assertion:(id)a3 didCancelWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_liveRenderingAssertion == a3)
  {
    id v7 = SBLogLiveRendering();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v9);
      liveRenderingAssertion = self->_liveRenderingAssertion;
      *(_DWORD *)buf = 138413058;
      v13 = self;
      __int16 v14 = 2112;
      id v15 = v10;
      __int16 v16 = 2048;
      objc_super v17 = liveRenderingAssertion;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl(&dword_18B52E000, v7, OS_LOG_TYPE_ERROR, "%@ Received unexpected cancellation for <%@; %p> with error '%@'",
        buf,
        0x2Au);
    }
    __int16 v8 = [NSString stringWithFormat:@"Received unexpected cancellation with error '%@'", v6];
    [(SBFAlwaysOnLiveRenderingAssertionManager *)self _releaseLiveRenderingAssertionWithReason:v8];
  }
}

- (id)backlight
{
  return self->_backlight;
}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v7 = dispatch_time(0, 30000000);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__SBFAlwaysOnLiveRenderingAssertionManager_backlight_didChangeAlwaysOnEnabled___block_invoke;
  v9[3] = &unk_1E548CFF0;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __79__SBFAlwaysOnLiveRenderingAssertionManager_backlight_didChangeAlwaysOnEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (*(unsigned char *)(a1 + 48))
    {
      v3 = [WeakRetained _nextLiveRenderingAssertionProxyIfAny];
      [v4 _acquireLiveRenderingAssertionIfNeededForProxy:v3 backlight:*(void *)(a1 + 32)];
    }
    else
    {
      [WeakRetained _releaseLiveRenderingAssertionWithReason:@"AOD is disabled"];
    }
    id WeakRetained = v4;
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  id v7 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v8 = dispatch_time(0, 30000000);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__SBFAlwaysOnLiveRenderingAssertionManager_backlight_didCompleteUpdateToState_forEvent___block_invoke;
  v10[3] = &unk_1E548D018;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a4;
  id v11 = v7;
  id v9 = v7;
  dispatch_after(v8, MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

uint64_t __88__SBFAlwaysOnLiveRenderingAssertionManager_backlight_didCompleteUpdateToState_forEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_time_t v8 = WeakRetained;
    if (*(void *)(a1 + 48) == 1)
    {
      id v4 = [WeakRetained _nextLiveRenderingAssertionProxyIfAny];
      [v8 _acquireLiveRenderingAssertionIfNeededForProxy:v4 backlight:*(void *)(a1 + 32)];
    }
    else
    {
      id v5 = NSString;
      id v4 = NSStringFromBLSBacklightState();
      id v6 = [v5 stringWithFormat:@"Backlight state is %@", v4];
      [v8 _releaseLiveRenderingAssertionWithReason:v6];
    }
    id v3 = v8;
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p>", v5, self];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; proxyAssertions:%@; assertions:%@>",
    v5,
    self,
    self->_liveRenderingAssertionProxies,
  id v6 = self->_liveRenderingAssertion);

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlight, 0);
  objc_storeStrong((id *)&self->_attributesProvider, 0);
  objc_storeStrong((id *)&self->_assertionProvider, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertionProxies, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertion, 0);
}

- (void)_acquireLiveRenderingAssertionIfNeededForProxy:(os_log_t)log backlight:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18B52E000, log, OS_LOG_TYPE_ERROR, "%@ Ignoring live-rendering assertion acquisition request for %@ because of invalid attributes", (uint8_t *)&v3, 0x16u);
}

@end