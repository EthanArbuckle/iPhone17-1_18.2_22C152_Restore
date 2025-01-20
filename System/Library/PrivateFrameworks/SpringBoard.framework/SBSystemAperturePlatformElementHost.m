@interface SBSystemAperturePlatformElementHost
- (SAInvalidatable)urgentAndImportantAssertion;
- (SBSystemAperturePlatformElementHost)initWithElement:(id)a3 delegate:(id)a4;
- (id)_urgencyAssertionWithReason:(id)a3 creatingIfNecessary:(BOOL)a4;
- (id)elementRequestsPersistentAnimationOfType:(int64_t)a3;
- (id)requestUrgentAndImportantPriorityWithReason:(id)a3;
- (void)elementRequestsDiscreteAnimationOfType:(int64_t)a3;
@end

@implementation SBSystemAperturePlatformElementHost

- (SBSystemAperturePlatformElementHost)initWithElement:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSystemAperturePlatformElementHost;
  v8 = [(SBSystemAperturePlatformElementHost *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_element, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

- (void)elementRequestsDiscreteAnimationOfType:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = objc_loadWeakRetained((id *)&self->_element);
  [WeakRetained element:v5 requestsDiscreteAnimationOfType:a3];
}

- (id)elementRequestsPersistentAnimationOfType:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = objc_loadWeakRetained((id *)&self->_element);
  id v7 = [WeakRetained element:v6 requestsPersistentAnimationOfType:a3];

  return v7;
}

- (id)requestUrgentAndImportantPriorityWithReason:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_urgentAndImportantAssertion);
  id v7 = self;
  id v8 = WeakRetained;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10)
  {
    id v10 = [(SBSystemAperturePlatformElementHost *)v5 _urgencyAssertionWithReason:v4 creatingIfNecessary:1];
    objc_initWeak(&location, v5);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__SBSystemAperturePlatformElementHost_requestUrgentAndImportantPriorityWithReason___block_invoke;
    v13[3] = &unk_1E6AF7BE8;
    objc_copyWeak(&v14, &location);
    v13[4] = v5;
    [v10 addInvalidationBlock:v13];
    objc_storeWeak((id *)&v5->_urgentAndImportantAssertion, v10);
    id v11 = objc_loadWeakRetained((id *)&v5->_delegate);
    [v11 invalidateElementUrgencyPreferences];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v5);

  return v10;
}

void __83__SBSystemAperturePlatformElementHost_requestUrgentAndImportantPriorityWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 4);

    if (v5 == v7)
    {
      objc_storeWeak(v4 + 4, 0);
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
      [v6 invalidateElementUrgencyPreferences];
    }
  }
}

- (id)_urgencyAssertionWithReason:(id)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_element);
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(NSMapTable *)v8->_reasonsToUrgencyAssertions objectForKey:v6];
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FA92F0]);
    id v11 = SBLogSystemApertureController();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = MEMORY[0x1D948A070](WeakRetained);
      *(_DWORD *)buf = 138543874;
      id v25 = v9;
      __int16 v26 = 2114;
      id v27 = v6;
      __int16 v28 = 2114;
      v29 = v12;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Created urgency assertion (%{public}@) with reason '%{public}@' for element: %{public}@", buf, 0x20u);
    }
    objc_initWeak((id *)buf, v8);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __87__SBSystemAperturePlatformElementHost__urgencyAssertionWithReason_creatingIfNecessary___block_invoke;
    v21 = &unk_1E6AF7BE8;
    objc_copyWeak(&v23, (id *)buf);
    id v13 = v6;
    id v22 = v13;
    [v9 addInvalidationBlock:&v18];
    reasonsToUrgencyAssertions = v8->_reasonsToUrgencyAssertions;
    if (!reasonsToUrgencyAssertions)
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28E10], "strongToWeakObjectsMapTable", v18, v19, v20, v21);
      v16 = v8->_reasonsToUrgencyAssertions;
      v8->_reasonsToUrgencyAssertions = (NSMapTable *)v15;

      reasonsToUrgencyAssertions = v8->_reasonsToUrgencyAssertions;
    }
    -[NSMapTable setObject:forKey:](reasonsToUrgencyAssertions, "setObject:forKey:", v9, v13, v18, v19, v20, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v8);

  return v9;
}

void __87__SBSystemAperturePlatformElementHost__urgencyAssertionWithReason_creatingIfNecessary___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[1] removeObjectForKey:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (SAInvalidatable)urgentAndImportantAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_urgentAndImportantAssertion);
  return (SAInvalidatable *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_urgentAndImportantAssertion);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_element);
  objc_storeStrong((id *)&self->_reasonsToUrgencyAssertions, 0);
}

@end