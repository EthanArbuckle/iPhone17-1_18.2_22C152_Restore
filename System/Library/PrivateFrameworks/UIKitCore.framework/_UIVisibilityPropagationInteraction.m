@interface _UIVisibilityPropagationInteraction
+ (_UIVisibilityPropagationInteraction)interactionWithPID:(int)a3 environmentIdentifier:(id)a4;
- (UIView)view;
- (uint64_t)_visibilityLock_didMoveToWindow:(uint64_t)a1;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_setVisibilityPropagationEnabled:(uint64_t)a1;
- (void)_setVisibilityTarget:(uint64_t)a1;
- (void)_viewVisibilityDidChange;
- (void)_visibilityLock_enqueueUpdateIfNecessary;
- (void)_visibilityLock_setSource:(uint64_t)a1;
- (void)_visibilityLock_updateVisibility;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIVisibilityPropagationInteraction

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  p_visibilityLock = &self->_visibilityLock;
  id v6 = a4;
  os_unfair_lock_lock(p_visibilityLock);
  -[_UIVisibilityPropagationInteraction _visibilityLock_didMoveToWindow:]((uint64_t)self, v6);

  os_unfair_lock_unlock(p_visibilityLock);
}

- (void)willMoveToView:(id)a3
{
  p_visibilityLock = &self->_visibilityLock;
  os_unfair_lock_lock(&self->_visibilityLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityLock_view);
  if (!a3 || self->_visibilityLock_invalidated || !WeakRetained && self->_visibilityLock_isTrackingView) {
    -[_UIVisibilityPropagationInteraction _visibilityLock_didMoveToWindow:]((uint64_t)self, 0);
  }
  os_unfair_lock_unlock(p_visibilityLock);
}

- (UIView)view
{
  p_visibilityLock = &self->_visibilityLock;
  os_unfair_lock_lock(&self->_visibilityLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityLock_view);
  os_unfair_lock_unlock(p_visibilityLock);
  return (UIView *)WeakRetained;
}

- (void)didMoveToView:(id)a3
{
  p_visibilityLock = &self->_visibilityLock;
  id v5 = a3;
  os_unfair_lock_lock(p_visibilityLock);
  id v6 = v5;
  v7 = v6;
  if (self)
  {
    os_unfair_lock_assert_owner(p_visibilityLock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityLock_view);
    v9 = WeakRetained;
    if (self->_visibilityLock_invalidated || !v6 || (v11 = v6, v7 = v6, WeakRetained != v6))
    {
      BOOL visibilityLock_isViewVisible = self->_visibilityLock_isViewVisible;
      if (self->_visibilityLock_isTrackingView)
      {
        self->_visibilityLock_isTrackingView = 0;
        BOOL visibilityLock_isViewVisible = 1;
      }
      if (WeakRetained)
      {
        objc_storeWeak((id *)&self->_visibilityLock_view, 0);

        if (!v6 || self->_visibilityLock_invalidated) {
          goto LABEL_16;
        }
LABEL_14:
        self->_BOOL visibilityLock_isViewVisible = [v6 isHidden] ^ 1;
        objc_storeWeak((id *)&self->_visibilityLock_view, v6);
        self->_visibilityLock_isTrackingView = 1;
        v7 = v6;
LABEL_17:
        v12 = [v7 window];
        char v13 = -[_UIVisibilityPropagationInteraction _visibilityLock_didMoveToWindow:]((uint64_t)self, v12);

        if ((v13 & 1) == 0) {
          -[_UIVisibilityPropagationInteraction _visibilityLock_updateVisibility]((uint64_t)self);
        }
        v11 = 0;
        goto LABEL_20;
      }
      if (v6 && !self->_visibilityLock_invalidated) {
        goto LABEL_14;
      }
      if (visibilityLock_isViewVisible)
      {
LABEL_16:

        v7 = 0;
        goto LABEL_17;
      }
      v11 = 0;
      v7 = v6;
    }
LABEL_20:
  }
  os_unfair_lock_unlock(p_visibilityLock);
}

- (uint64_t)_visibilityLock_didMoveToWindow:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 80));
    location = (id *)(a1 + 24);
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 24));
    id v5 = WeakRetained;
    if (!*(unsigned char *)(a1 + 93) && v3 && WeakRetained == v3)
    {
      a1 = 0;
      v16 = v3;
LABEL_35:

      goto LABEL_36;
    }
    v7 = (id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 32);
    BOOL v8 = v6 != 0;
    if (v6)
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v10 = *v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v38 != v12) {
              objc_enumerationMutation(v10);
            }
            [v9 removeObserver:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v11);
      }

      id v14 = *v7;
      id *v7 = 0;
    }
    v15 = *(void **)(a1 + 40);
    if (v15)
    {
      *(void *)(a1 + 40) = 0;

      BOOL v8 = 1;
    }
    if (*(unsigned char *)(a1 + 91))
    {
      *(unsigned char *)(a1 + 91) = 0;
      BOOL v8 = 1;
    }
    if (v5)
    {
      objc_storeWeak(location, 0);

      if (!v3 || *(unsigned char *)(a1 + 93)) {
        goto LABEL_34;
      }
    }
    else if (!v3 || *(unsigned char *)(a1 + 93))
    {
      if (!v8)
      {
        v16 = 0;
        a1 = 0;
        goto LABEL_35;
      }
      goto LABEL_34;
    }
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v18 = [MEMORY[0x1E4F28F08] mainQueue];
    objc_initWeak(&from, (id)a1);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71___UIVisibilityPropagationInteraction__visibilityLock_didMoveToWindow___block_invoke;
    aBlock[3] = &unk_1E52DA728;
    objc_copyWeak(&v35, &from);
    v19 = _Block_copy(aBlock);
    v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    v21 = [v17 addObserverForName:@"UIWindowDidMoveToScreenNotification" object:v3 queue:v18 usingBlock:v19];
    [v20 addObject:v21];

    v22 = [v17 addObserverForName:0x1ED1601E0 object:v3 queue:v18 usingBlock:v19];
    [v20 addObject:v22];

    v23 = [v17 addObserverForName:@"UIWindowDidBecomeVisibleNotification" object:v3 queue:v18 usingBlock:v19];
    [v20 addObject:v23];

    v24 = [v17 addObserverForName:@"UIWindowDidBecomeHiddenNotification" object:v3 queue:v18 usingBlock:v19];
    [v20 addObject:v24];

    objc_storeStrong((id *)(a1 + 32), v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"UIRootWindow:%p", v3);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 && ![v3 _isRemoteInputHostWindow])
          {
            v28 = -[UIWindow _fbsScene](v3);
            v26 = v28;
            if (v28)
            {
              v29 = [v28 identityToken];
              v30 = [v29 stringRepresentation];
              uint64_t v31 = _UISVisibilityEnvironmentForSceneIdentityTokenString();
              v32 = *(void **)(a1 + 40);
              *(void *)(a1 + 40) = v31;
            }
            else
            {
              v29 = *(void **)(a1 + 40);
              *(void *)(a1 + 40) = 0;
            }

            goto LABEL_33;
          }
        }
      }
      [v3 _contextId];
      uint64_t v25 = _UISVisibilityEnvironmentForUIHostedWindowContextID();
    }
    v26 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v25;
LABEL_33:

    objc_storeWeak(location, v3);
    *(unsigned char *)(a1 + 91) = 1;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&from);

LABEL_34:
    -[_UIVisibilityPropagationInteraction _visibilityLock_updateVisibility](a1);
    v16 = 0;
    a1 = 1;
    goto LABEL_35;
  }
LABEL_36:

  return a1;
}

- (void)_visibilityLock_updateVisibility
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 80));
    if (!*(unsigned char *)(a1 + 93) && *(unsigned char *)(a1 + 88) && *(unsigned char *)(a1 + 90))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      id v2 = objc_loadWeakRetained((id *)(a1 + 24));
      v3 = 0;
      if (WeakRetained && v2)
      {
        if ([v2 isHidden]) {
          v3 = 0;
        }
        else {
          v3 = *(void **)(a1 + 40);
        }
      }
      -[_UIVisibilityPropagationInteraction _visibilityLock_setSource:](a1, v3);
    }
    else
    {
      -[_UIVisibilityPropagationInteraction _visibilityLock_setSource:](a1, 0);
    }
  }
}

- (void)_visibilityLock_setSource:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 80));
    if ((BSEqualStrings() & 1) == 0)
    {
      uint64_t v3 = [v5 copy];
      v4 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v3;

      -[_UIVisibilityPropagationInteraction _visibilityLock_enqueueUpdateIfNecessary](a1);
    }
  }
}

- (void)_visibilityLock_enqueueUpdateIfNecessary
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 80));
    if (!*(unsigned char *)(a1 + 92))
    {
      objc_initWeak(&location, (id)a1);
      *(unsigned char *)(a1 + 92) = 1;
      id v2 = dispatch_get_global_queue(25, 0);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __79___UIVisibilityPropagationInteraction__visibilityLock_enqueueUpdateIfNecessary__block_invoke;
      v3[3] = &unk_1E52DC308;
      objc_copyWeak(&v4, &location);
      dispatch_async(v2, v3);

      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setVisibilityTarget:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((BSEqualObjects() & 1) == 0)
    {
      uint64_t v4 = [v6 copy];
      id v5 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v4;

      -[_UIVisibilityPropagationInteraction _visibilityLock_enqueueUpdateIfNecessary](a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v3 = v6;
  }
}

- (void)_setVisibilityPropagationEnabled:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if (*(unsigned __int8 *)(a1 + 88) != a2)
    {
      *(unsigned char *)(a1 + 88) = a2;
      -[_UIVisibilityPropagationInteraction _visibilityLock_updateVisibility](a1);
    }
    os_unfair_lock_unlock(v4);
  }
}

+ (_UIVisibilityPropagationInteraction)interactionWithPID:(int)a3 environmentIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ((int)v4 <= 0)
  {
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"invalid pid %i", v4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(a2);
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)v26 = 138544642;
      *(void *)&v26[4] = v15;
      *(_WORD *)&v26[12] = 2114;
      *(void *)&v26[14] = v17;
      __int16 v27 = 2048;
      id v28 = a1;
      __int16 v29 = 2114;
      v30 = @"_UIVisibilityPropagationView.m";
      __int16 v31 = 1024;
      int v32 = 63;
      __int16 v33 = 2114;
      v34 = v14;
      _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v26, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1858A0510);
  }
  id v8 = v7;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v8)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = NSStringFromSelector(a2);
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)v26 = 138544642;
      *(void *)&v26[4] = v19;
      *(_WORD *)&v26[12] = 2114;
      *(void *)&v26[14] = v21;
      __int16 v27 = 2048;
      id v28 = a1;
      __int16 v29 = 2114;
      v30 = @"_UIVisibilityPropagationView.m";
      __int16 v31 = 1024;
      int v32 = 64;
      __int16 v33 = 2114;
      v34 = v18;
      _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v26, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1858A0608);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v23 = NSStringFromSelector(a2);
      v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      *(_DWORD *)v26 = 138544642;
      *(void *)&v26[4] = v23;
      *(_WORD *)&v26[12] = 2114;
      *(void *)&v26[14] = v25;
      __int16 v27 = 2048;
      id v28 = a1;
      __int16 v29 = 2114;
      v30 = @"_UIVisibilityPropagationView.m";
      __int16 v31 = 1024;
      int v32 = 64;
      __int16 v33 = 2114;
      v34 = v22;
      _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v26, 0x3Au);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1858A0700);
  }

  v9 = [_UIVisibilityPropagationInteraction alloc];
  if (v9)
  {
    *(void *)v26 = v9;
    *(void *)&v26[8] = _UIVisibilityPropagationInteraction;
    id v10 = objc_msgSendSuper2((objc_super *)v26, sel_init);
    uint64_t v11 = v10;
    if (v10) {
      *((void *)v10 + 10) = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [MEMORY[0x1E4F96478] targetWithPid:v4 environmentIdentifier:v8];
  -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)v11, v12);

  -[_UIVisibilityPropagationInteraction _setVisibilityPropagationEnabled:]((uint64_t)v11, 1);
  return (_UIVisibilityPropagationInteraction *)v11;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_visibilityProcessingLock = &self->_visibilityProcessingLock;
  os_unfair_lock_lock(&self->_visibilityProcessingLock);
  os_unfair_lock_lock(&self->_visibilityLock);
  self->_visibilityLock_invalidated = 1;
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_visibilityLock_windowChangeNotifications;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 removeObserver:*(void *)(*((void *)&v12 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  visibilityLock_windowChangeNotifications = self->_visibilityLock_windowChangeNotifications;
  self->_visibilityLock_windowChangeNotifications = 0;

  os_unfair_lock_unlock(&self->_visibilityLock);
  [(BSServiceConnectionEndpointInjector *)self->_visibilityProcessingLock_endpointInjector invalidate];
  os_unfair_lock_unlock(p_visibilityProcessingLock);

  v11.receiver = self;
  v11.super_class = (Class)_UIVisibilityPropagationInteraction;
  [(_UIVisibilityPropagationInteraction *)&v11 dealloc];
}

- (void)_viewVisibilityDidChange
{
  p_visibilityLock = &self->_visibilityLock;
  os_unfair_lock_lock(&self->_visibilityLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityLock_view);
  if (WeakRetained)
  {
    int v4 = [WeakRetained isHidden];
    if (self->_visibilityLock_isViewVisible != (v4 ^ 1))
    {
      self->_BOOL visibilityLock_isViewVisible = v4 ^ 1;
      -[_UIVisibilityPropagationInteraction _visibilityLock_updateVisibility]((uint64_t)self);
    }
  }
  os_unfair_lock_unlock(p_visibilityLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityProcessingLock_endpointInjector, 0);
  objc_storeStrong((id *)&self->_visibilityProcessingLock_sourceEnvironment, 0);
  objc_storeStrong((id *)&self->_visibilityProcessingLock_target, 0);
  objc_storeStrong((id *)&self->_visibilityLock_sourceEnvironment, 0);
  objc_storeStrong((id *)&self->_visibilityLock_windowEnvironment, 0);
  objc_storeStrong((id *)&self->_visibilityLock_windowChangeNotifications, 0);
  objc_destroyWeak((id *)&self->_visibilityLock_window);
  objc_destroyWeak((id *)&self->_visibilityLock_view);
  objc_storeStrong((id *)&self->_visibilityLock_target, 0);
}

@end