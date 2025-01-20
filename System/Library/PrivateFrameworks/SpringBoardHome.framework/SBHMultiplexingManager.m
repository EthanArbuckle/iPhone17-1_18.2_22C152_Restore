@interface SBHMultiplexingManager
- (BOOL)_cacheLastDiscardedViewController:(id)a3 forIdentifier:(id)a4;
- (BOOL)hasViewControllerForIdentifier:(id)a3;
- (NSMutableDictionary)cachedRecentViewControllersForIdentifier;
- (NSMutableDictionary)multiplexingViewControllersForIdentifier;
- (NSMutableDictionary)viewControllersForIdentifier;
- (NSMutableOrderedSet)cachedRecentViewControllerIdentifiers;
- (SBHMultiplexingManager)initWithDelegate:(id)a3;
- (SBHMultiplexingManagerDelegate)delegate;
- (id)_activeMultiplexingViewControllerForIdentifier:(id)a3;
- (id)activeMultiplexingViewControllerForViewController:(id)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)newMultiplexingViewControllerForIdentifier:(id)a3 atLevel:(double)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)viewControllerForIdentifier:(id)a3;
- (unint64_t)cachedRecentViewControllerCountLimit;
- (void)_modifyViewControllersForIdentifier:(id)a3 reusingCacheViewControllersIfNecessary:(BOOL)a4 withBlock:(id)a5;
- (void)_trimCachedRecentViewControllers;
- (void)discardCachedRecentViewControllers;
- (void)discardCachedRecentViewControllersForIdentifier:(id)a3;
- (void)discardMultiplexingViewController:(id)a3;
- (void)enumerateAllViewControllersUsingBlock:(id)a3;
- (void)setCachedRecentViewControllerCountLimit:(unint64_t)a3;
- (void)setCachedRecentViewControllerIdentifiers:(id)a3;
- (void)setCachedRecentViewControllersForIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMultiplexingViewControllersForIdentifier:(id)a3;
- (void)setViewController:(id)a3 forIdentifier:(id)a4;
- (void)setViewControllersForIdentifier:(id)a3;
- (void)validateActiveMultiplexingViewControllerForIdentifier:(id)a3;
@end

@implementation SBHMultiplexingManager

- (SBHMultiplexingManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHMultiplexingManager;
  v5 = [(SBHMultiplexingManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)setViewController:(id)a3 forIdentifier:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_viewControllersForIdentifier)
  {
    if (v6)
    {
LABEL_3:
      objc_super v8 = SBLogWidgetMultiplexing();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        int v22 = 138544386;
        v23 = v10;
        __int16 v24 = 2048;
        v25 = self;
        __int16 v26 = 2114;
        v27 = v12;
        __int16 v28 = 2048;
        id v29 = v6;
        __int16 v30 = 2114;
        id v31 = v7;
        _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> set view controller controller <%{public}@:%p> for %{public}@", (uint8_t *)&v22, 0x34u);
      }
      [(NSMutableDictionary *)self->_viewControllersForIdentifier setObject:v6 forKey:v7];
      goto LABEL_12;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    viewControllersForIdentifier = self->_viewControllersForIdentifier;
    self->_viewControllersForIdentifier = v13;

    if (v6) {
      goto LABEL_3;
    }
  }
  v15 = [(NSMutableDictionary *)self->_viewControllersForIdentifier objectForKey:v7];
  objc_msgSend(v15, "bs_endAppearanceTransition:", 0);
  if (![(SBHMultiplexingManager *)self _cacheLastDiscardedViewController:v15 forIdentifier:v7])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained multiplexingManager:self willRemoveViewController:v15 forIdentifier:v7];
  }
  [(NSMutableDictionary *)self->_viewControllersForIdentifier removeObjectForKey:v7];
  v17 = SBLogWidgetMultiplexing();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    int v22 = 138544386;
    v23 = v19;
    __int16 v24 = 2048;
    v25 = self;
    __int16 v26 = 2114;
    v27 = v21;
    __int16 v28 = 2048;
    id v29 = v15;
    __int16 v30 = 2114;
    id v31 = v7;
    _os_log_impl(&dword_1D7F0A000, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> removed view controller controller <%{public}@:%p> for %{public}@", (uint8_t *)&v22, 0x34u);
  }
LABEL_12:
}

- (id)viewControllerForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_viewControllersForIdentifier objectForKey:v4];
  if (!v5)
  {
    v5 = [(NSMutableDictionary *)self->_cachedRecentViewControllersForIdentifier objectForKey:v4];
  }

  return v5;
}

- (BOOL)hasViewControllerForIdentifier:(id)a3
{
  v3 = [(SBHMultiplexingManager *)self viewControllerForIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)activeMultiplexingViewControllerForViewController:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_viewControllersForIdentifier;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      -[NSMutableDictionary objectForKey:](self->_viewControllersForIdentifier, "objectForKey:", v10, (void)v15);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v4) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (v13)
    {
      v12 = [(SBHMultiplexingManager *)self activeMultiplexingViewControllerForIdentifier:v13];
      v5 = v13;
      goto LABEL_12;
    }
    v12 = 0;
  }
  else
  {
LABEL_9:
    v12 = 0;
LABEL_12:
  }
  return v12;
}

- (id)newMultiplexingViewControllerForIdentifier:(id)a3 atLevel:(double)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![(SBHMultiplexingManager *)self hasViewControllerForIdentifier:v7])
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[self hasViewControllerForIdentifier:identifier]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBHMultiplexingManager newMultiplexingViewControllerForIdentifier:atLevel:](a2, (uint64_t)self, (uint64_t)v21);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8109AECLL);
  }
  if (!self->_multiplexingViewControllersForIdentifier)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    multiplexingViewControllersForIdentifier = self->_multiplexingViewControllersForIdentifier;
    self->_multiplexingViewControllersForIdentifier = v8;
  }
  v10 = [[SBHMultiplexingViewController alloc] initWithLevel:v7 identifier:a4];
  [(SBHMultiplexingViewController *)v10 setMultiplexingManager:self];
  id v11 = SBLogWidgetMultiplexing();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = (objc_class *)objc_opt_class();
    long long v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138544642;
    __int16 v26 = v13;
    __int16 v27 = 2048;
    __int16 v28 = self;
    __int16 v29 = 2114;
    __int16 v30 = v15;
    __int16 v31 = 2048;
    uint64_t v32 = v10;
    __int16 v33 = 2114;
    id v34 = v7;
    __int16 v35 = 2048;
    double v36 = a4;
    _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> creating new multiplexing view controller controller <%{public}@:%p> for %{public}@ at level: %.f", buf, 0x3Eu);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__SBHMultiplexingManager_newMultiplexingViewControllerForIdentifier_atLevel___block_invoke;
  v22[3] = &unk_1E6AACDE0;
  v22[4] = self;
  id v23 = v7;
  long long v16 = v10;
  __int16 v24 = v16;
  id v17 = v7;
  [(SBHMultiplexingManager *)self _modifyViewControllersForIdentifier:v17 reusingCacheViewControllersIfNecessary:1 withBlock:v22];
  long long v18 = v24;
  v19 = v16;

  return v19;
}

void __77__SBHMultiplexingManager_newMultiplexingViewControllerForIdentifier_atLevel___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    [*(id *)(a1[4] + 32) setObject:v3 forKey:a1[5]];
    v2 = v3;
  }
  id v4 = v2;
  [v2 addPointer:a1[6]];
  [v4 compact];
}

- (void)discardMultiplexingViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = [v8 identifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__SBHMultiplexingManager_discardMultiplexingViewController___block_invoke;
    v11[3] = &unk_1E6AACDE0;
    v11[4] = self;
    id v12 = v9;
    id v13 = v8;
    id v10 = v9;
    [(SBHMultiplexingManager *)self _modifyViewControllersForIdentifier:v10 reusingCacheViewControllersIfNecessary:0 withBlock:v11];
  }
}

void __60__SBHMultiplexingManager_discardMultiplexingViewController___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) multiplexingViewControllersForIdentifier];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  objc_msgSend(v3, "sbh_removePointer:", *(void *)(a1 + 48));
  [v3 compact];
  id v4 = SBLogWidgetMultiplexing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    int v13 = 138544386;
    v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2114;
    long long v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    __int16 v21 = 2114;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> removing multiplexing view controller controller <%{public}@:%p> for %{public}@", (uint8_t *)&v13, 0x34u);
  }
  if (![v3 count])
  {
    id v12 = [*(id *)(a1 + 32) multiplexingViewControllersForIdentifier];
    [v12 removeObjectForKey:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) setViewController:0 forIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)validateActiveMultiplexingViewControllerForIdentifier:(id)a3
{
}

- (void)_modifyViewControllersForIdentifier:(id)a3 reusingCacheViewControllersIfNecessary:(BOOL)a4 withBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  uint64_t v10 = [(SBHMultiplexingManager *)self _activeMultiplexingViewControllerForIdentifier:v8];
  v9[2](v9);

  uint64_t v11 = [(SBHMultiplexingManager *)self _activeMultiplexingViewControllerForIdentifier:v8];
  id v12 = (void *)v11;
  if (v10 == (void *)v11)
  {
    if (!v10) {
      goto LABEL_26;
    }
    uint64_t v20 = [v10 multiplexedViewController];

    if (v20) {
      goto LABEL_26;
    }
    int v13 = SBLogWidgetMultiplexing();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    __int16 v21 = (objc_class *)objc_opt_class();
    __int16 v15 = NSStringFromClass(v21);
    uint64_t v22 = (objc_class *)objc_opt_class();
    __int16 v17 = NSStringFromClass(v22);
    *(_DWORD *)uint64_t v32 = 138544386;
    *(void *)&v32[4] = v15;
    *(_WORD *)&v32[12] = 2048;
    *(void *)&v32[14] = self;
    *(_WORD *)&v32[22] = 2114;
    id v33 = v17;
    *(_WORD *)id v34 = 2048;
    *(void *)&v34[2] = v10;
    *(_WORD *)&v34[10] = 2114;
    *(void *)&v34[12] = v8;
    uint64_t v23 = "<%{public}@:%p> active view controller did not change but does not have the active multiplexed view controller"
          ": <%{public}@:%p> for %{public}@";
    goto LABEL_16;
  }
  if (!v10 || !v11)
  {
    if (v10)
    {
      int v13 = SBLogWidgetMultiplexing();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      __int16 v24 = (objc_class *)objc_opt_class();
      __int16 v15 = NSStringFromClass(v24);
      v25 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v25);
      *(_DWORD *)uint64_t v32 = 138544386;
      *(void *)&v32[4] = v15;
      *(_WORD *)&v32[12] = 2048;
      *(void *)&v32[14] = self;
      *(_WORD *)&v32[22] = 2114;
      id v33 = v17;
      *(_WORD *)id v34 = 2048;
      *(void *)&v34[2] = v10;
      *(_WORD *)&v34[10] = 2114;
      *(void *)&v34[12] = v8;
      uint64_t v23 = "<%{public}@:%p> active view controller changed from <%{public}@:%p> to NONE for %{public}@";
    }
    else
    {
      if (!v11) {
        goto LABEL_19;
      }
      int v13 = SBLogWidgetMultiplexing();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      __int16 v26 = (objc_class *)objc_opt_class();
      __int16 v15 = NSStringFromClass(v26);
      __int16 v27 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v27);
      *(_DWORD *)uint64_t v32 = 138544386;
      *(void *)&v32[4] = v15;
      *(_WORD *)&v32[12] = 2048;
      *(void *)&v32[14] = self;
      *(_WORD *)&v32[22] = 2114;
      id v33 = v17;
      *(_WORD *)id v34 = 2048;
      *(void *)&v34[2] = v12;
      *(_WORD *)&v34[10] = 2114;
      *(void *)&v34[12] = v8;
      uint64_t v23 = "<%{public}@:%p> active view controller changed NONE to <%{public}@:%p> for %{public}@";
    }
LABEL_16:
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, v23, v32, 0x34u);
    goto LABEL_17;
  }
  int v13 = SBLogWidgetMultiplexing();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    __int16 v15 = NSStringFromClass(v14);
    uint64_t v16 = (objc_class *)objc_opt_class();
    __int16 v17 = NSStringFromClass(v16);
    long long v18 = (objc_class *)objc_opt_class();
    __int16 v19 = NSStringFromClass(v18);
    *(_DWORD *)uint64_t v32 = 138544898;
    *(void *)&v32[4] = v15;
    *(_WORD *)&v32[12] = 2048;
    *(void *)&v32[14] = self;
    *(_WORD *)&v32[22] = 2114;
    id v33 = v17;
    *(_WORD *)id v34 = 2048;
    *(void *)&v34[2] = v10;
    *(_WORD *)&v34[10] = 2114;
    *(void *)&v34[12] = v19;
    *(_WORD *)&v34[20] = 2048;
    *(void *)&v34[22] = v12;
    __int16 v35 = 2114;
    id v36 = v8;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> active view controller changed from <%{public}@:%p> to <%{public}@:%p> for %{public}@", v32, 0x48u);

LABEL_17:
  }
LABEL_18:

LABEL_19:
  __int16 v28 = -[NSMutableDictionary objectForKey:](self->_viewControllersForIdentifier, "objectForKey:", v8, *(_OWORD *)v32, *(void *)&v32[16], v33, *(_OWORD *)v34, *(void *)&v34[16]);
  if (!v28 && v6)
  {
    __int16 v28 = [(NSMutableDictionary *)self->_cachedRecentViewControllersForIdentifier objectForKey:v8];
    if (v28)
    {
      __int16 v29 = SBLogWidgetMultiplexing();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v30 = (objc_class *)objc_opt_class();
        __int16 v31 = NSStringFromClass(v30);
        *(_DWORD *)uint64_t v32 = 138543874;
        *(void *)&v32[4] = v31;
        *(_WORD *)&v32[12] = 2048;
        *(void *)&v32[14] = self;
        *(_WORD *)&v32[22] = 2114;
        id v33 = v8;
        _os_log_impl(&dword_1D7F0A000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Reusing recent view controller for identifier: %{public}@", v32, 0x20u);
      }
      [(NSMutableDictionary *)self->_viewControllersForIdentifier setObject:v28 forKey:v8];
      [(NSMutableDictionary *)self->_cachedRecentViewControllersForIdentifier removeObjectForKey:v8];
      [(NSMutableOrderedSet *)self->_cachedRecentViewControllerIdentifiers removeObject:v8];
    }
  }
  [v12 activateWithViewController:v28];
  [v10 deactivate];

LABEL_26:
}

- (id)_activeMultiplexingViewControllerForIdentifier:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_multiplexingViewControllersForIdentifier objectForKey:a3];
  id v4 = [v3 allObjects];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_13_1];
  BOOL v6 = [v5 lastObject];

  return v6;
}

uint64_t __73__SBHMultiplexingManager__activeMultiplexingViewControllerForIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 level];
  BOOL v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 level];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (BOOL)_cacheLastDiscardedViewController:(id)a3 forIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(SBHMultiplexingManager *)self cachedRecentViewControllerCountLimit];
  BOOL v9 = 0;
  if (v6 && v8)
  {
    uint64_t v10 = [(SBHMultiplexingManager *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![v10 multiplexingManager:self shouldCacheRecentViewController:v6 forIdentifier:v7])
    {
      BOOL v9 = 0;
    }
    else
    {
      uint64_t v11 = SBLogWidgetMultiplexing();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = (objc_class *)objc_opt_class();
        int v13 = NSStringFromClass(v12);
        int v21 = 138543874;
        uint64_t v22 = v13;
        __int16 v23 = 2048;
        __int16 v24 = self;
        __int16 v25 = 2114;
        id v26 = v7;
        _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Caching recent view controller for identifier: %{public}@", (uint8_t *)&v21, 0x20u);
      }
      cachedRecentViewControllersForIdentifier = self->_cachedRecentViewControllersForIdentifier;
      if (!cachedRecentViewControllersForIdentifier)
      {
        __int16 v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v16 = self->_cachedRecentViewControllersForIdentifier;
        self->_cachedRecentViewControllersForIdentifier = v15;

        cachedRecentViewControllersForIdentifier = self->_cachedRecentViewControllersForIdentifier;
      }
      [(NSMutableDictionary *)cachedRecentViewControllersForIdentifier setObject:v6 forKey:v7];
      cachedRecentViewControllerIdentifiers = self->_cachedRecentViewControllerIdentifiers;
      if (!cachedRecentViewControllerIdentifiers)
      {
        long long v18 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
        __int16 v19 = self->_cachedRecentViewControllerIdentifiers;
        self->_cachedRecentViewControllerIdentifiers = v18;

        cachedRecentViewControllerIdentifiers = self->_cachedRecentViewControllerIdentifiers;
      }
      [(NSMutableOrderedSet *)cachedRecentViewControllerIdentifiers removeObject:v7];
      [(NSMutableOrderedSet *)self->_cachedRecentViewControllerIdentifiers insertObject:v7 atIndex:0];
      [(SBHMultiplexingManager *)self _trimCachedRecentViewControllers];
      BOOL v9 = 1;
    }
  }
  return v9;
}

- (void)_trimCachedRecentViewControllers
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SBHMultiplexingManager *)self cachedRecentViewControllerCountLimit];
  unint64_t v4 = [(NSMutableOrderedSet *)self->_cachedRecentViewControllerIdentifiers count];
  if (v4 >= v3) {
    unint64_t v6 = v4 - v3;
  }
  else {
    unint64_t v6 = 0;
  }
  if (v4 > v3)
  {
    unint64_t v7 = 0;
    *(void *)&long long v5 = 138543874;
    long long v15 = v5;
    do
    {
      uint64_t v8 = [(NSMutableOrderedSet *)self->_cachedRecentViewControllerIdentifiers lastObject];
      if (!v8) {
        break;
      }
      BOOL v9 = (void *)v8;
      uint64_t v10 = SBLogWidgetMultiplexing();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = v15;
        __int16 v17 = v12;
        __int16 v18 = 2048;
        __int16 v19 = self;
        __int16 v20 = 2114;
        int v21 = v9;
        _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Discarding oldest view controller for identifier: %{public}@", buf, 0x20u);
      }
      int v13 = [(NSMutableDictionary *)self->_cachedRecentViewControllersForIdentifier objectForKey:v9];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained multiplexingManager:self willRemoveViewController:v13 forIdentifier:v9];

      [(NSMutableDictionary *)self->_cachedRecentViewControllersForIdentifier removeObjectForKey:v9];
      [(NSMutableOrderedSet *)self->_cachedRecentViewControllerIdentifiers removeObject:v9];

      ++v7;
    }
    while (v7 < v6);
  }
}

- (void)setCachedRecentViewControllerCountLimit:(unint64_t)a3
{
  if (self->_cachedRecentViewControllerCountLimit != a3)
  {
    self->_cachedRecentViewControllerCountLimit = a3;
    [(SBHMultiplexingManager *)self _trimCachedRecentViewControllers];
  }
}

- (void)discardCachedRecentViewControllersForIdentifier:(id)a3
{
  id v6 = a3;
  unint64_t v4 = -[NSMutableDictionary objectForKey:](self->_cachedRecentViewControllersForIdentifier, "objectForKey:");
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained multiplexingManager:self willRemoveViewController:v4 forIdentifier:v6];

    [(NSMutableDictionary *)self->_cachedRecentViewControllersForIdentifier removeObjectForKey:v6];
    [(NSMutableOrderedSet *)self->_cachedRecentViewControllerIdentifiers removeObject:v6];
  }
}

- (void)discardCachedRecentViewControllers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NSMutableDictionary *)self->_cachedRecentViewControllersForIdentifier allKeys];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SBHMultiplexingManager *)self discardCachedRecentViewControllersForIdentifier:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)enumerateAllViewControllersUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  long long v11 = __64__SBHMultiplexingManager_enumerateAllViewControllersUsingBlock___block_invoke;
  id v12 = &unk_1E6AB38A0;
  id v5 = v4;
  id v13 = v5;
  v14 = &v15;
  uint64_t v6 = _Block_copy(&v9);
  uint64_t v7 = [(SBHMultiplexingManager *)self viewControllersForIdentifier];
  [v7 enumerateKeysAndObjectsUsingBlock:v6];

  if (!*((unsigned char *)v16 + 24))
  {
    long long v8 = [(SBHMultiplexingManager *)self cachedRecentViewControllersForIdentifier];
    [v8 enumerateKeysAndObjectsUsingBlock:v6];
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __64__SBHMultiplexingManager_enumerateAllViewControllersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)description
{
  return [(SBHMultiplexingManager *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(SBHMultiplexingManager *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_viewControllersForIdentifier withName:@"viewControllersForIdentifier"];
  id v6 = (id)[v4 appendObject:self->_multiplexingViewControllersForIdentifier withName:@"multiplexingViewControllersForIdentifier"];
  id v7 = (id)[v4 appendObject:self->_cachedRecentViewControllersForIdentifier withName:@"cachedRecentViewControllersForIdentifier" skipIfNil:1];
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBHMultiplexingManager *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (unint64_t)cachedRecentViewControllerCountLimit
{
  return self->_cachedRecentViewControllerCountLimit;
}

- (SBHMultiplexingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHMultiplexingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)viewControllersForIdentifier
{
  return self->_viewControllersForIdentifier;
}

- (void)setViewControllersForIdentifier:(id)a3
{
}

- (NSMutableDictionary)multiplexingViewControllersForIdentifier
{
  return self->_multiplexingViewControllersForIdentifier;
}

- (void)setMultiplexingViewControllersForIdentifier:(id)a3
{
}

- (NSMutableDictionary)cachedRecentViewControllersForIdentifier
{
  return self->_cachedRecentViewControllersForIdentifier;
}

- (void)setCachedRecentViewControllersForIdentifier:(id)a3
{
}

- (NSMutableOrderedSet)cachedRecentViewControllerIdentifiers
{
  return self->_cachedRecentViewControllerIdentifiers;
}

- (void)setCachedRecentViewControllerIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecentViewControllerIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedRecentViewControllersForIdentifier, 0);
  objc_storeStrong((id *)&self->_multiplexingViewControllersForIdentifier, 0);
  objc_storeStrong((id *)&self->_viewControllersForIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)newMultiplexingViewControllerForIdentifier:(uint64_t)a3 atLevel:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  long long v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  uint64_t v15 = @"SBHMultiplexingManager.m";
  __int16 v16 = 1024;
  int v17 = 95;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D7F0A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end