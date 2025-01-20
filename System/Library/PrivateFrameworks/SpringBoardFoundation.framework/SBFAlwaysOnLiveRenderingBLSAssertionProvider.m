@interface SBFAlwaysOnLiveRenderingBLSAssertionProvider
- (BLSAssertionObserving)assertionObserver;
- (SBFAlwaysOnLiveRenderingBLSAssertionProvider)init;
- (id)acquireWithExplanation:(id)a3 attributes:(id)a4;
- (int64_t)acquiredAssertionsCount;
- (void)assertion:(id)a3 didCancelWithError:(id)a4;
- (void)assertionWasAcquired:(id)a3;
- (void)setAssertionObserver:(id)a3;
@end

@implementation SBFAlwaysOnLiveRenderingBLSAssertionProvider

- (SBFAlwaysOnLiveRenderingBLSAssertionProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBFAlwaysOnLiveRenderingBLSAssertionProvider;
  v2 = [(SBFAlwaysOnLiveRenderingBLSAssertionProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    assertions = v2->_assertions;
    v2->_assertions = (NSMapTable *)v3;
  }
  return v2;
}

- (id)acquireWithExplanation:(id)a3 attributes:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F4F4C0] acquireWithExplanation:v6 observer:self attributes:a4];
  v8 = SBLogLiveRendering();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    int v12 = 138543874;
    v13 = v10;
    __int16 v14 = 2048;
    v15 = v7;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_18B52E000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> live-rendering assertion created with reason '%@'", (uint8_t *)&v12, 0x20u);
  }
  return v7;
}

- (int64_t)acquiredAssertionsCount
{
  v2 = [(NSMapTable *)self->_assertions keyEnumerator];
  uint64_t v3 = 0;
  int64_t v4 = -1;
  do
  {
    uint64_t v5 = [v2 nextObject];

    ++v4;
    uint64_t v3 = (void *)v5;
  }
  while (v5);

  return v4;
}

- (void)assertionWasAcquired:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  assertions = self->_assertions;
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  v7 = [v4 identifier];
  [(NSMapTable *)assertions setObject:v6 forKey:v7];

  v8 = [v4 explanation];
  int v9 = [(SBFAlwaysOnLiveRenderingBLSAssertionProvider *)self acquiredAssertionsCount];
  v10 = SBLogLiveRendering();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    int v12 = NSStringFromClass(v11);
    int v13 = 138544130;
    __int16 v14 = v12;
    __int16 v15 = 2048;
    id v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    int v20 = v9;
    _os_log_impl(&dword_18B52E000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> live-rendering assertion acquired with reason '%@' (activeCount: %d)", (uint8_t *)&v13, 0x26u);
  }
}

- (void)assertion:(id)a3 didCancelWithError:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  int v9 = [(NSMapTable *)self->_assertions objectForKey:v8];
  if (v9)
  {
    [(NSMapTable *)self->_assertions removeObjectForKey:v8];
    v10 = [v6 explanation];
    int v11 = [(SBFAlwaysOnLiveRenderingBLSAssertionProvider *)self acquiredAssertionsCount];
    int v12 = [v7 debugDescription];
    [v9 timeIntervalSinceNow];
    double v14 = v13;
    __int16 v15 = SBLogLiveRendering();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v14 < 0.0) {
        double v14 = -v14;
      }
      id v16 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v16);
      int v19 = 138544642;
      int v20 = v17;
      __int16 v21 = 2048;
      id v22 = v6;
      __int16 v23 = 2048;
      double v24 = v14;
      __int16 v25 = 2112;
      v26 = v10;
      __int16 v27 = 2112;
      v28 = v12;
      __int16 v29 = 1024;
      int v30 = v11;
      _os_log_impl(&dword_18B52E000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> live-rendering assertion released after %.2f seconds with reason '%@' (error: %@, activeCount: %d)", (uint8_t *)&v19, 0x3Au);
    }
    goto LABEL_8;
  }
  v10 = SBLogLiveRendering();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    int v12 = NSStringFromClass(v18);
    __int16 v15 = [v6 explanation];
    int v19 = 138543874;
    int v20 = v12;
    __int16 v21 = 2048;
    id v22 = v6;
    __int16 v23 = 2112;
    double v24 = *(double *)&v15;
    _os_log_impl(&dword_18B52E000, v10, OS_LOG_TYPE_INFO, "<%{public}@: %p> live-rendering assertion release ignored because is not ours (reason: '%@')", (uint8_t *)&v19, 0x20u);
LABEL_8:
  }
}

- (BLSAssertionObserving)assertionObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assertionObserver);
  return (BLSAssertionObserving *)WeakRetained;
}

- (void)setAssertionObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assertionObserver);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end