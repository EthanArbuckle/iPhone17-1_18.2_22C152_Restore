@interface BKDisplayRenderOverlayManager
+ (id)sharedInstance;
- (BOOL)applyOverlay:(id)a3 withAnimationSettings:(id)a4;
- (BOOL)backlightLocked;
- (BOOL)freezeOverlay:(id)a3;
- (BOOL)isShowingNonBootUIOverlays;
- (BOOL)removeOverlay:(id)a3 withAnimationSettings:(id)a4;
- (NSMutableSet)activeOverlays;
- (NSMutableSet)overlaysDisablingUpdates;
- (id)_initWithPersistenceCoordinator:(id)a3 orientationManager:(id)a4 backlightManager:(id)a5 windowServer:(id)a6;
- (id)_updateWindowServerUpdatesForOverlays:(id)a3;
- (id)activeOverlayWithDescriptor:(id)a3;
- (id)description;
- (int64_t)lockedOrientation;
- (void)_lock_freezeOverlay:(id)a3;
- (void)_lock_setBacklightLocked:(BOOL)a3;
- (void)_lock_setLockedOrientation:(int64_t)a3;
- (void)_lock_setOverlaysDisablingUpdates:(id)a3;
- (void)_lock_updateStateForActiveOverlayChange;
- (void)prepareForRestart;
@end

@implementation BKDisplayRenderOverlayManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenDisplayIDs, 0);
  objc_storeStrong((id *)&self->_overlaysDisablingUpdates, 0);
  objc_storeStrong((id *)&self->_activeOverlays, 0);
  objc_storeStrong((id *)&self->_backlightManager, 0);
  objc_storeStrong((id *)&self->_orientationManager, 0);

  objc_storeStrong((id *)&self->_windowServer, 0);
}

- (int64_t)lockedOrientation
{
  return self->_lockedOrientation;
}

- (BOOL)backlightLocked
{
  return self->_backlightLocked;
}

- (NSMutableSet)overlaysDisablingUpdates
{
  return self->_overlaysDisablingUpdates;
}

- (id)_updateWindowServerUpdatesForOverlays:(id)a3
{
  id v4 = a3;
  id v38 = objc_alloc_init((Class)NSMutableSet);
  v5 = [(CAWindowServer *)self->_windowServer displays];
  id v6 = [v5 mutableCopy];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v48;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if ([v13 disablesDisplayUpdates])
        {
          windowServer = self->_windowServer;
          v15 = [v13 display];
          v16 = -[CAWindowServer displayWithDisplayId:](windowServer, "displayWithDisplayId:", [v15 displayId]);

          [v38 addObject:v13];
          [v6 removeObject:v16];
          [v7 addObject:v16];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v10);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v17 = v7;
  id v18 = [v17 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v18)
  {
    id v20 = v18;
    uint64_t v21 = *(void *)v44;
    *(void *)&long long v19 = 67109120;
    long long v36 = v19;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
        if ((objc_msgSend(v23, "disablesUpdates", v36) & 1) == 0)
        {
          v24 = sub_10005FD84();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v25 = [v23 displayId];
            *(_DWORD *)buf = v36;
            unsigned int v53 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Disabling framebuffer changes on display (%d) because we have overlays that require disabled updates.", buf, 8u);
          }

          [v23 setDisablesUpdates:1];
        }
      }
      id v20 = [v17 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v20);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v26 = v6;
  id v27 = [v26 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v27)
  {
    id v29 = v27;
    uint64_t v30 = *(void *)v40;
    *(void *)&long long v28 = 67109120;
    long long v37 = v28;
    do
    {
      for (k = 0; k != v29; k = (char *)k + 1)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(v26);
        }
        v32 = *(void **)(*((void *)&v39 + 1) + 8 * (void)k);
        if (objc_msgSend(v32, "disablesUpdates", v37))
        {
          v33 = sub_10005FD84();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v34 = [v32 displayId];
            *(_DWORD *)buf = v37;
            unsigned int v53 = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Enabling framebuffer changes on display (%d) because we have don't have any overlays that require disabled updates.", buf, 8u);
          }

          [v32 setDisablesUpdates:0];
        }
      }
      id v29 = [v26 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v29);
  }

  return v38;
}

- (void)_lock_setBacklightLocked:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_backlightLocked != v3)
  {
    self->_backlightLocked = v3;
    backlightManager = self->_backlightManager;
    id v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(BKDisplayBrightnessController *)backlightManager setBacklightLocked:v3 forReason:v7];
  }
}

- (void)_lock_setLockedOrientation:(int64_t)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lockedOrientation != a3)
  {
    self->_lockedOrientation = a3;
    int IsValid = BSInterfaceOrientationIsValid();
    orientationManager = self->_orientationManager;
    uint64_t v7 = BSGetVersionedPID();
    if (IsValid)
    {
      sub_100094F9C((uint64_t)orientationManager, 4, a3, v7);
    }
    else
    {
      sub_100095604((uint64_t)orientationManager, 4, v7);
    }
  }
}

- (void)_lock_updateStateForActiveOverlayChange
{
  os_unfair_lock_assert_owner(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v13 = self;
  BOOL v3 = self->_activeOverlays;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v10 interfaceOrientation];
        if (BSInterfaceOrientationIsValid())
        {
          if (BSInterfaceOrientationIsValid() && v7 != [v10 interfaceOrientation])
          {
            uint64_t v11 = sub_10005FD84();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              v12 = [v10 succinctDescription];
              *(_DWORD *)buf = 138543362;
              long long v19 = v12;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Conflicting choices for orientation lock, choosing orientation for this overlay: %{public}@", buf, 0xCu);
            }
          }
          id v7 = [v10 interfaceOrientation];
        }
        v6 |= [v10 lockBacklight];
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
    id v7 = 0;
  }

  [(BKDisplayRenderOverlayManager *)v13 _lock_setLockedOrientation:v7];
  [(BKDisplayRenderOverlayManager *)v13 _lock_setBacklightLocked:v6 & 1];
}

- (void)_lock_freezeOverlay:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  unsigned __int8 v5 = [v4 isFrozen];
  int v6 = sub_10005FD84();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      v16[0] = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Requested freezing of an already frozen overlay; ignoring freeze request for overlay:%{public}@",
        (uint8_t *)&v15,
        0xCu);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    v16[0] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Freezing overlay:%{public}@", (uint8_t *)&v15, 0xCu);
  }

  [v4 freeze];
  uint64_t v8 = [(BKDisplayRenderOverlayManager *)self _updateWindowServerUpdatesForOverlays:self->_overlaysDisablingUpdates];
  [(BKDisplayRenderOverlayManager *)self _lock_setOverlaysDisablingUpdates:v8];

  if ([v4 disablesDisplayUpdates])
  {
    id v7 = [v4 display];
    id v9 = [v7 displayId];
    if ([(NSMutableIndexSet *)self->_frozenDisplayIDs containsIndex:v9])
    {
      id v10 = sub_10005FD84();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = 67109378;
        LODWORD(v16[0]) = v9;
        WORD2(v16[0]) = 2114;
        *(void *)((char *)v16 + 6) = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Display %d previously frozen; ignoring freeze request for overlay:%{public}@",
          (uint8_t *)&v15,
          0x12u);
      }
    }
    else
    {
      frozenDisplayIDs = self->_frozenDisplayIDs;
      if (!frozenDisplayIDs)
      {
        v12 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
        v13 = self->_frozenDisplayIDs;
        self->_frozenDisplayIDs = v12;

        frozenDisplayIDs = self->_frozenDisplayIDs;
      }
      [(NSMutableIndexSet *)frozenDisplayIDs addIndex:v9];
      id v10 = [(CAWindowServer *)self->_windowServer displayWithDisplayId:v9];
      if (v10)
      {
        long long v14 = sub_10005FD84();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138543362;
          v16[0] = v10;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Freezing display: %{public}@", (uint8_t *)&v15, 0xCu);
        }

        [v10 freeze];
      }
    }

    goto LABEL_17;
  }
LABEL_18:
}

- (void)_lock_setOverlaysDisablingUpdates:(id)a3
{
  id v7 = (NSMutableSet *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  overlaysDisablingUpdates = self->_overlaysDisablingUpdates;
  p_overlaysDisablingUpdates = &self->_overlaysDisablingUpdates;
  if (overlaysDisablingUpdates != v7) {
    objc_storeStrong((id *)p_overlaysDisablingUpdates, a3);
  }
}

- (BOOL)isShowingNonBootUIOverlays
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_activeOverlays;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (void)v10) != (id)2 && objc_msgSend(v8, "type") != (id)3)
        {
          LOBYTE(v5) = 1;
          goto LABEL_12;
        }
      }
      id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  os_unfair_lock_unlock(p_lock);
  return (char)v5;
}

- (void)prepareForRestart
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_activeOverlays;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[BKDisplayRenderOverlayManager _lock_freezeOverlay:](self, "_lock_freezeOverlay:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)freezeOverlay:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v5 = [(NSMutableSet *)self->_activeOverlays containsObject:v4];
  if (v5) {
    [(BKDisplayRenderOverlayManager *)self _lock_freezeOverlay:v4];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (BOOL)removeOverlay:(id)a3 withAnimationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v8 = [(NSMutableSet *)self->_activeOverlays containsObject:v6];
  if (v8)
  {
    [v6 dismissWithAnimationSettings:v7];
    [(NSMutableSet *)self->_activeOverlays removeObject:v6];
    [(NSMutableSet *)self->_overlaysDisablingUpdates removeObject:v6];
    long long v9 = [(BKDisplayRenderOverlayManager *)self _updateWindowServerUpdatesForOverlays:self->_overlaysDisablingUpdates];
    [(BKDisplayRenderOverlayManager *)self _lock_setOverlaysDisablingUpdates:v9];

    [(BKDisplayRenderOverlayManager *)self _lock_updateStateForActiveOverlayChange];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (BOOL)applyOverlay:(id)a3 withAnimationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v8 = [v6 presentWithAnimationSettings:v7];

  if (v8)
  {
    [(NSMutableSet *)self->_activeOverlays addObject:v6];
    [(BKDisplayRenderOverlayManager *)self _lock_updateStateForActiveOverlayChange];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (NSMutableSet)activeOverlays
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableSet *)self->_activeOverlays copy];
  os_unfair_lock_unlock(p_lock);

  return (NSMutableSet *)v4;
}

- (id)activeOverlayWithDescriptor:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_activeOverlays;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [v10 descriptor:v14];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)description
{
  BOOL v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_activeOverlays withName:@"activeOverlays"];
  unsigned int v5 = [v3 build];

  return v5;
}

- (id)_initWithPersistenceCoordinator:(id)a3 orientationManager:(id)a4 backlightManager:(id)a5 windowServer:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v49.receiver = self;
  v49.super_class = (Class)BKDisplayRenderOverlayManager;
  long long v15 = [(BKDisplayRenderOverlayManager *)&v49 init];
  long long v16 = v15;
  if (v15)
  {
    if (!v14)
    {
      id v29 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"windowServer"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = NSStringFromSelector(a2);
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        *(_DWORD *)buf = 138544642;
        v52 = v30;
        __int16 v53 = 2114;
        v54 = v32;
        __int16 v55 = 2048;
        v56 = v16;
        __int16 v57 = 2114;
        CFStringRef v58 = @"BKDisplayRenderOverlayManager.m";
        __int16 v59 = 1024;
        int v60 = 55;
        __int16 v61 = 2114;
        v62 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v29 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x10009A490);
    }
    if (!v13)
    {
      v33 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"backlightManager"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        unsigned int v34 = NSStringFromSelector(a2);
        v35 = (objc_class *)objc_opt_class();
        long long v36 = NSStringFromClass(v35);
        *(_DWORD *)buf = 138544642;
        v52 = v34;
        __int16 v53 = 2114;
        v54 = v36;
        __int16 v55 = 2048;
        v56 = v16;
        __int16 v57 = 2114;
        CFStringRef v58 = @"BKDisplayRenderOverlayManager.m";
        __int16 v59 = 1024;
        int v60 = 56;
        __int16 v61 = 2114;
        v62 = v33;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v33 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x10009A588);
    }
    if (!v12)
    {
      long long v37 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"orientationManager"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v38 = NSStringFromSelector(a2);
        long long v39 = (objc_class *)objc_opt_class();
        long long v40 = NSStringFromClass(v39);
        *(_DWORD *)buf = 138544642;
        v52 = v38;
        __int16 v53 = 2114;
        v54 = v40;
        __int16 v55 = 2048;
        v56 = v16;
        __int16 v57 = 2114;
        CFStringRef v58 = @"BKDisplayRenderOverlayManager.m";
        __int16 v59 = 1024;
        int v60 = 57;
        __int16 v61 = 2114;
        v62 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v37 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x10009A680);
    }
    if (!v11)
    {
      long long v41 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"persistenceCoordinator"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        long long v42 = NSStringFromSelector(a2);
        long long v43 = (objc_class *)objc_opt_class();
        long long v44 = NSStringFromClass(v43);
        *(_DWORD *)buf = 138544642;
        v52 = v42;
        __int16 v53 = 2114;
        v54 = v44;
        __int16 v55 = 2048;
        v56 = v16;
        __int16 v57 = 2114;
        CFStringRef v58 = @"BKDisplayRenderOverlayManager.m";
        __int16 v59 = 1024;
        int v60 = 58;
        __int16 v61 = 2114;
        v62 = v41;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v41 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x10009A778);
    }
    objc_storeStrong((id *)&v15->_windowServer, a6);
    objc_storeStrong((id *)&v16->_orientationManager, a4);
    objc_storeStrong((id *)&v16->_backlightManager, a5);
    long long v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeOverlays = v16->_activeOverlays;
    v16->_activeOverlays = v17;

    v16->_lock._os_unfair_lock_opaque = 0;
    v16->_lockedOrientation = 0;
    v16->_backlightLocked = 0;
    long long v19 = [v11 rebuildPersistentOverlays];
    id v20 = +[NSSet setWithArray:v19];

    uint64_t v21 = [(BKDisplayRenderOverlayManager *)v16 _updateWindowServerUpdatesForOverlays:v20];
    overlaysDisablingUpdates = v16->_overlaysDisablingUpdates;
    v16->_overlaysDisablingUpdates = (NSMutableSet *)v21;

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v23 = v20;
    id v24 = [v23 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v46;
      do
      {
        id v27 = 0;
        do
        {
          if (*(void *)v46 != v26) {
            objc_enumerationMutation(v23);
          }
          [(BKDisplayRenderOverlayManager *)v16 applyOverlay:*(void *)(*((void *)&v45 + 1) + 8 * (void)v27) withAnimationSettings:0];
          id v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        id v25 = [v23 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v25);
    }
  }
  return v16;
}

+ (id)sharedInstance
{
  if (qword_100123198 != -1) {
    dispatch_once(&qword_100123198, &stru_1000F8D98);
  }
  v2 = (void *)qword_100123190;

  return v2;
}

@end