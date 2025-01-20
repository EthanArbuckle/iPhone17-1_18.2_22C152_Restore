@interface SBHungApplicationInteractionObserver
- (BOOL)_transitionContextRepresentsActivatingAppFromAppSwitcher:(id)a3;
- (BOOL)_transitionContextRepresentsActivatingDynamicIslandApp:(id)a3;
- (BOOL)_transitionContextRepresentsActivatingHomeScreen:(id)a3;
- (BOOL)_transitionContextRepresentsArcSwipingToPreviousApp:(id)a3;
- (BOOL)_transitionContextRepresentsTappingBreadcrumbToPreviousApp:(id)a3;
- (uint64_t)setPreviousLockState:(uint64_t)result;
- (void)_lockStateDidChange:(id)a3;
- (void)_notifyInteractionWithPossiblyHungApplicationSceneEntities:(id)a3 withInteractionType:(int64_t)a4;
- (void)activate;
- (void)observeBackgroundingApplicationSceneEntities:(id)a3 withTransitionContext:(id)a4;
- (void)observeRemovedApplicationSceneEntity:(id)a3;
@end

@implementation SBHungApplicationInteractionObserver

- (void)activate
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"void soft_HTInitializeHangTracerMonitor(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBHungApplicationInteractionObserver.m", 28, @"%s", dlerror());

  __break(1u);
}

- (void)observeBackgroundingApplicationSceneEntities:(id)a3 withTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SBHungApplicationInteractionObserver *)self _transitionContextRepresentsActivatingAppFromAppSwitcher:v7])
  {
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = 1;
    v11 = @"activate-app-from-app-switcher";
  }
  else if ([(SBHungApplicationInteractionObserver *)self _transitionContextRepresentsActivatingDynamicIslandApp:v7])
  {
    int v8 = 0;
    int v9 = 1;
    uint64_t v10 = 2;
    v11 = @"activate-app-from-dynamic-island";
  }
  else if ([(SBHungApplicationInteractionObserver *)self _transitionContextRepresentsActivatingHomeScreen:v7])
  {
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = 3;
    v11 = @"activate-home-screen";
  }
  else if ([(SBHungApplicationInteractionObserver *)self _transitionContextRepresentsArcSwipingToPreviousApp:v7])
  {
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = 4;
    v11 = @"arc-swipe-to-previous-app";
  }
  else if ([(SBHungApplicationInteractionObserver *)self _transitionContextRepresentsTappingBreadcrumbToPreviousApp:v7])
  {
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = 5;
    v11 = @"tap-breadcrumb-to-previous-app";
  }
  else
  {
    uint64_t v10 = 0;
    int v9 = 0;
    int v8 = 1;
    v11 = @"unspecified";
  }
  v12 = SBLogHangTracer();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SBHungApplicationInteractionObserver observeBackgroundingApplicationSceneEntities:withTransitionContext:]((uint64_t)v11, v12);
  }

  if (((v8 | v9) & 1) == 0) {
    [(SBHungApplicationInteractionObserver *)self _notifyInteractionWithPossiblyHungApplicationSceneEntities:v6 withInteractionType:v10];
  }
}

- (void)observeRemovedApplicationSceneEntity:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  [(SBHungApplicationInteractionObserver *)self _notifyInteractionWithPossiblyHungApplicationSceneEntities:v4 withInteractionType:7];
}

- (void)_lockStateDidChange:(id)a3
{
  v3 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t previousLockState = self->_previousLockState;
  v5 = [a3 userInfo];
  id v6 = [v5 objectForKey:@"SBAggregateLockStateKey"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if ((previousLockState & 2) == 0 && (v7 & 2) != 0)
  {
    uint64_t v25 = v7;
    v26 = v3;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    int v9 = [(id)SBApp windowSceneManager];
    uint64_t v10 = [v9 connectedWindowScenes];

    id obj = v10;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          v16 = [v15 switcherController];
          v17 = [v16 layoutState];
          v18 = [v17 elements];

          uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v29;
            do
            {
              uint64_t v22 = 0;
              do
              {
                if (*(void *)v29 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = [*(id *)(*((void *)&v28 + 1) + 8 * v22) workspaceEntity];
                v24 = [v23 applicationSceneEntity];

                objc_msgSend(v8, "bs_safeAddObject:", v24);
                ++v22;
              }
              while (v20 != v22);
              uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v20);
          }

          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v12);
    }

    v3 = v26;
    [(SBHungApplicationInteractionObserver *)v26 _notifyInteractionWithPossiblyHungApplicationSceneEntities:v8 withInteractionType:6];

    uint64_t v7 = v25;
  }
  v3->_unint64_t previousLockState = v7;
}

- (void)_notifyInteractionWithPossiblyHungApplicationSceneEntities:(id)a3 withInteractionType:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((unint64_t)(a4 - 1) > 6) {
    id v6 = @"unspecified";
  }
  else {
    id v6 = off_1E6B09C60[a4 - 1];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v23;
    uint64_t v20 = (char *)&v32 + 8;
    *(void *)&long long v8 = 67109378;
    long long v19 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "sceneHandle", v19, v20);
        uint64_t v12 = [v11 application];
        uint64_t v13 = [v12 processState];
        uint64_t v14 = [v13 pid];

        v15 = SBLogHangTracer();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v19;
          *(_DWORD *)&buf[4] = v14;
          LOWORD(v32) = 2112;
          *(void *)((char *)&v32 + 2) = v6;
          _os_log_debug_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEBUG, "Calling HTUserSwitchedAwayFromApp with pid %d, reason %@", buf, 0x12u);
        }

        uint64_t v26 = 0;
        v27 = &v26;
        uint64_t v28 = 0x2020000000;
        v16 = (void (*)(uint64_t, __CFString *))getHTUserSwitchedAwayFromAppSymbolLoc_ptr;
        long long v29 = getHTUserSwitchedAwayFromAppSymbolLoc_ptr;
        if (!getHTUserSwitchedAwayFromAppSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&long long v32 = 3221225472;
          *((void *)&v32 + 1) = __getHTUserSwitchedAwayFromAppSymbolLoc_block_invoke;
          long long v33 = &unk_1E6AF56B0;
          long long v34 = &v26;
          v17 = (void *)HangTracerLibrary();
          v18 = dlsym(v17, "HTUserSwitchedAwayFromApp");
          *(void *)(v34[1] + 24) = v18;
          getHTUserSwitchedAwayFromAppSymbolLoc_ptr = *(_UNKNOWN **)(v34[1] + 24);
          v16 = (void (*)(uint64_t, __CFString *))v27[3];
        }
        _Block_object_dispose(&v26, 8);
        if (!v16) {
          -[SBHungApplicationInteractionObserver _notifyInteractionWithPossiblyHungApplicationSceneEntities:withInteractionType:]();
        }
        v16(v14, v6);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v7);
  }
}

- (BOOL)_transitionContextRepresentsActivatingAppFromAppSwitcher:(id)a3
{
  id v3 = a3;
  id v4 = [v3 previousLayoutState];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v3 layoutState];

  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  BOOL v14 = [v8 unlockedEnvironmentMode] == 2 && objc_msgSend(v13, "unlockedEnvironmentMode") == 3;
  return v14;
}

- (BOOL)_transitionContextRepresentsActivatingDynamicIslandApp:(id)a3
{
  id v3 = a3;
  id v4 = [v3 previousLayoutState];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v3 layoutState];
  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  BOOL v14 = [v3 request];
  uint64_t v15 = [v14 source];

  BOOL v17 = [v8 unlockedEnvironmentMode] == 3
     && [v13 unlockedEnvironmentMode] == 3
     && v15 == 61;

  return v17;
}

- (BOOL)_transitionContextRepresentsArcSwipingToPreviousApp:(id)a3
{
  id v3 = a3;
  id v4 = [v3 previousLayoutState];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v3 layoutState];
  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  BOOL v14 = [v3 request];
  uint64_t v15 = [v14 source];

  if ([v8 unlockedEnvironmentMode] == 3)
  {
    LOBYTE(v16) = 0;
    if ([v13 unlockedEnvironmentMode] == 3 && v15 == 11)
    {
      BOOL v17 = [v13 elements];
      v18 = [v8 elements];
      int v16 = [v17 intersectsSet:v18] ^ 1;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)_transitionContextRepresentsActivatingHomeScreen:(id)a3
{
  id v3 = [a3 layoutState];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 unlockedEnvironmentMode];
  return v8 == 1;
}

- (BOOL)_transitionContextRepresentsTappingBreadcrumbToPreviousApp:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 previousLayoutState];
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

  uint64_t v9 = [v3 layoutState];
  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  BOOL v14 = [v3 request];
  uint64_t v15 = [v14 source];

  BOOL v17 = [v8 unlockedEnvironmentMode] == 3
     && [v13 unlockedEnvironmentMode] == 3
     && v15 == 15;

  return v17;
}

- (uint64_t)setPreviousLockState:(uint64_t)result
{
  if (result) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (void)observeBackgroundingApplicationSceneEntities:(uint64_t)a1 withTransitionContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Observed backgrounding application scene(s) with interaction type %@", (uint8_t *)&v2, 0xCu);
}

- (void)_notifyInteractionWithPossiblyHungApplicationSceneEntities:withInteractionType:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void soft_HTUserSwitchedAwayFromApp(pid_t, NSString * _Nonnull __strong)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBHungApplicationInteractionObserver.m", 29, @"%s", dlerror());

  __break(1u);
}

@end