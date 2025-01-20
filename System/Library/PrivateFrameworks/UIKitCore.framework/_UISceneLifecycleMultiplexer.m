@interface _UISceneLifecycleMultiplexer
+ (UIScene)mostActiveScene;
+ (id)_mostActiveSceneForApplicationState;
+ (id)_mostActiveSceneIncludingInternal:(BOOL)a3 withTest:(id)a4;
+ (id)mostActiveSceneWithTest:(id)a3;
+ (id)mostActiveWindowSceneOnScreen:(id)a3;
+ (id)sharedInstance;
+ (int64_t)_compareLifecycleStateOfScene:(id)a3 toScene:(id)a4;
+ (void)configureInitialDeactivationReasons:(unint64_t)a3;
- (BOOL)_prepareForClientSuspensionWithScene:(id)a3;
- (BOOL)activatedOnce;
- (BOOL)isActive;
- (BOOL)isTrackingScene:(id)a3;
- (BOOL)lifecycleWantsUnnecessaryDelayForSceneDelivery;
- (BOOL)runningInTaskSwitcher;
- (BOOL)suspendedEventsOnly;
- (BOOL)suspendedUnderLock;
- (id)initForAppSingleton:(id)a3;
- (int64_t)applicationState;
- (void)_evalTransitionToSettings:(id)a3 fromSettings:(id)a4 forceExit:(BOOL)a5 withTransitionStore:(id)a6;
- (void)_globalTestRelatedActivationActionsForFirstActivation:(BOOL)a3 foreground:(BOOL)a4 interfaceStyle:(int64_t)a5 transitionContext:(id)a6;
- (void)_performBlock:(id)a3 withApplicationOfDeactivationReasons:(unint64_t)a4 fromReasons:(unint64_t)a5;
- (void)_scheduleFirstCommit;
- (void)collectBackingStores;
- (void)completeApplicationLaunchWithFBSScene:(id)a3 transitionContext:(id)a4;
- (void)forceExitWithTransitionContext:(id)a3 scene:(id)a4;
- (void)noteApplicationLaunchCompleted;
- (void)uiScene:(id)a3 transitionedFromState:(id)a4 withTransitionContext:(id)a5;
@end

@implementation _UISceneLifecycleMultiplexer

+ (int64_t)_compareLifecycleStateOfScene:(id)a3 toScene:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    goto LABEL_8;
  }
  if (!v5 || (uint64_t v7 = [v5 activationState], v8 = objc_msgSend(v6, "activationState"), v7 > v8))
  {
    int64_t v9 = -1;
    goto LABEL_9;
  }
  if (v7 != v8)
  {
LABEL_8:
    int64_t v9 = 1;
    goto LABEL_9;
  }
  id v10 = [v5 _effectiveSettings];
  if ([v10 underLock])
  {
    unint64_t v11 = 1;
  }
  else if (_UISceneLifecycleStateIsSEO(v10))
  {
    unint64_t v11 = 2;
  }
  else if (([v10 deactivationReasons] & 8) != 0)
  {
    unint64_t v11 = 3;
  }
  else if (+[UIScene _activationStateFromSceneSettings:v10])
  {
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v11 = -1;
  }

  id v13 = [v6 _effectiveSettings];
  if ([v13 underLock])
  {
    unint64_t v14 = 1;
  }
  else if (_UISceneLifecycleStateIsSEO(v13))
  {
    unint64_t v14 = 2;
  }
  else if (([v13 deactivationReasons] & 8) != 0)
  {
    unint64_t v14 = 3;
  }
  else if (+[UIScene _activationStateFromSceneSettings:v13])
  {
    unint64_t v14 = 0;
  }
  else
  {
    unint64_t v14 = -1;
  }

  if (v11 < v14) {
    int64_t v9 = -1;
  }
  else {
    int64_t v9 = 1;
  }
LABEL_9:

  return v9;
}

+ (id)_mostActiveSceneForApplicationState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [a1 mostActiveScene];
  v4 = [a1 _mostActiveSceneIncludingInternal:1 withTest:&__block_literal_global_14_1];
  if ([a1 _compareLifecycleStateOfScene:v3 toScene:v4] == -1) {
    id v5 = v4;
  }
  else {
    id v5 = v3;
  }
  id v6 = v5;
  uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("AppLifecycle", &_mostActiveSceneForApplicationState___s_category) + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    int64_t v9 = [v6 _sceneIdentifier];
    id v10 = [v6 _persistenceIdentifier];
    int v12 = 138543618;
    id v13 = v9;
    __int16 v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "sceneOfRecord: sceneID: %{public}@  persistentID: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  return v6;
}

+ (id)mostActiveWindowSceneOnScreen:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62___UISceneLifecycleMultiplexer_mostActiveWindowSceneOnScreen___block_invoke;
  v8[3] = &unk_1E52DFF48;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 mostActiveSceneWithTest:v8];

  return v6;
}

+ (id)_mostActiveSceneIncludingInternal:(BOOL)a3 withTest:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75___UISceneLifecycleMultiplexer__mostActiveSceneIncludingInternal_withTest___block_invoke;
  aBlock[3] = &unk_1E52DFED0;
  id v7 = v6;
  id v30 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = +[UIScene _scenesIncludingInternal:v4];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__25;
  v27 = __Block_byref_object_dispose__25;
  id v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = -1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75___UISceneLifecycleMultiplexer__mostActiveSceneIncludingInternal_withTest___block_invoke_10;
  v14[3] = &unk_1E52DFEF8;
  id v10 = v8;
  id v15 = v10;
  uint64_t v16 = &v23;
  v17 = &v19;
  id v18 = a1;
  [v9 enumerateObjectsUsingBlock:v14];
  if (v20[3] == -1) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = (void *)v24[5];
  }
  id v12 = v11;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

+ (id)mostActiveSceneWithTest:(id)a3
{
  return (id)[a1 _mostActiveSceneIncludingInternal:0 withTest:a3];
}

+ (UIScene)mostActiveScene
{
  return (UIScene *)[a1 mostActiveSceneWithTest:0];
}

+ (id)sharedInstance
{
  if (qword_1EB25F430 != -1) {
    dispatch_once(&qword_1EB25F430, &__block_literal_global_85);
  }
  v2 = (void *)_MergedGlobals_980;
  return v2;
}

- (int64_t)applicationState
{
  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  if (WeakRetained)
  {
  }
  else if ([(id)UIApp isFrontBoard])
  {
    return 0;
  }
  if (self->_transitionalLifecycleState)
  {
    int64_t v6 = +[UIScene _activationStateFromSceneSettings:](UIScene, "_activationStateFromSceneSettings:");
    if (v6 != -1 && v6 != 2) {
      return v6 || (*(_DWORD *)(UIApp + 176) & 0x3FFFF) != 0;
    }
    return 2;
  }
  id v8 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);

  if (!v8) {
    return 2;
  }
  id v9 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);
  uint64_t v10 = [v9 activationState];
  if (v10 == -1 || v10 == 2)
  {
    int64_t v5 = 2;
  }
  else if (v10)
  {
    int64_t v5 = 1;
  }
  else
  {
    int64_t v5 = (*(_DWORD *)(UIApp + 176) & 0x3FFFF) != 0;
  }

  return v5;
}

- (BOOL)suspendedEventsOnly
{
  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  if (WeakRetained)
  {
  }
  else if ([(id)UIApp isFrontBoard])
  {
    return 0;
  }
  transitionalLifecycleState = self->_transitionalLifecycleState;
  if (transitionalLifecycleState)
  {
    return _UISceneLifecycleStateIsSEO(transitionalLifecycleState);
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);
    char v8 = [v7 _isSuspendedEventsOnly];

    return v8;
  }
}

- (void)uiScene:(id)a3 transitionedFromState:(id)a4 withTransitionContext:(id)a5
{
  id v19 = a3;
  id v18 = a4;
  id v8 = a5;
  id v9 = [(id)objc_opt_class() _mostActiveSceneForApplicationState];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  objc_storeWeak((id *)&self->_uiSceneOfRecord, v9);
  unint64_t v11 = [v19 _FBSScene];
  id v12 = v8;
  id v13 = [v9 _effectiveUISettings];
  char v14 = [WeakRetained isEqual:v19];
  id v15 = v18;
  if ((v14 & 1) == 0)
  {
    id v15 = [WeakRetained _effectiveUISettings];
  }
  id v16 = v11;
  id v17 = v12;
  if (self)
  {
    -[_UISceneLifecycleMultiplexer _evalTransitionToSettings:fromSettings:forceExit:withTransitionStore:](self, "_evalTransitionToSettings:fromSettings:forceExit:withTransitionStore:", v13, v15, 0, v16, v17);
    if (v14) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  if ((v14 & 1) == 0) {
LABEL_5:
  }

LABEL_6:
}

- (void)_evalTransitionToSettings:(id)a3 fromSettings:(id)a4 forceExit:(BOOL)a5 withTransitionStore:(id)a6
{
  id var1 = a6.var1;
  id var0 = a6.var0;
  BOOL v8 = a5;
  id v11 = a3;
  id v12 = a4;
  if (_UISceneLifecycleStateIsEqual(v11, v12))
  {
    if (v8) {
      [(id)UIApp _handleTaskCompletionAndTerminate:var1];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_transitionalLifecycleState, a4);
    id v32 = var0;
    id v33 = var1;
    int64_t v13 = +[UIScene _activationStateFromSceneSettings:v12];
    BOOL v31 = v8;
    unsigned int v14 = _UISceneLifecycleCompositeActionMaskFromStateToState__staticStateMap[4 * v13
                                                                             + 5
                                                                             + +[UIScene _activationStateFromSceneSettings:v11]];
    _UISceneLifecycleCompositeActionMaskHighestLifecycleActionType(v14);
    char multiplexerFlags = (char)self->_multiplexerFlags;
    unsigned int v16 = multiplexerFlags & 2;
    *(unsigned char *)&self->_char multiplexerFlags = multiplexerFlags | 2;
    id v17 = var0;
    id v30 = +[UIScene _sceneForFBSScene:v17];
    id v18 = +[UIScene _sceneForFBSScene:v17];
    id v19 = [v17 uiSettings];
    v29 = [v17 uiClientSettings];
    int v20 = (v16 == 0) & (v14 >> 5) | ((v14 & 4) >> 2);
    if (v20) {
      -[_UISceneLifecycleMultiplexer _globalTestRelatedActivationActionsForFirstActivation:foreground:interfaceStyle:transitionContext:](self, "_globalTestRelatedActivationActionsForFirstActivation:foreground:interfaceStyle:transitionContext:", v16 == 0, [v11 isForeground], objc_msgSend(v19, "userInterfaceStyle"), var1);
    }
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3254779904;
    v34[2] = __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke;
    v34[3] = &unk_1ED0BEAF8;
    unsigned int v21 = v16 >> 1;
    uint64_t v22 = var1;
    char v23 = v21 ^ 1;
    unsigned int v43 = v14;
    v34[4] = self;
    id v35 = v11;
    id v36 = v17;
    id v24 = v36;
    id v41 = v24;
    id v42 = v22;
    id v25 = v19;
    id v37 = v25;
    id v26 = v30;
    id v38 = v26;
    id v39 = v12;
    char v44 = v23;
    BOOL v45 = v31;
    id v27 = v18;
    id v40 = v27;
    char v46 = v20;
    -[_UISceneLifecycleMultiplexer _performBlock:withApplicationOfDeactivationReasons:fromReasons:](self, "_performBlock:withApplicationOfDeactivationReasons:fromReasons:", v34, [v35 deactivationReasons], objc_msgSend(v39, "deactivationReasons"));

    id var0 = v32;
    id var1 = v33;
  }
  transitionalLifecycleState = self->_transitionalLifecycleState;
  self->_transitionalLifecycleState = 0;
}

- (void)noteApplicationLaunchCompleted
{
  *(unsigned char *)&self->_multiplexerFlags |= 1u;
}

- (BOOL)suspendedUnderLock
{
  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  if (WeakRetained)
  {
  }
  else if ([(id)UIApp isFrontBoard])
  {
    return 0;
  }
  transitionalLifecycleState = self->_transitionalLifecycleState;
  if (transitionalLifecycleState)
  {
    return [(UIApplicationSceneSettings *)transitionalLifecycleState underLock];
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);
    char v8 = [v7 _isSuspendedUnderLock];

    return v8;
  }
}

+ (void)configureInitialDeactivationReasons:(unint64_t)a3
{
  BOOL v4 = [a1 sharedInstance];
  char v5 = [v4 activatedOnce];

  if (a3 && (v5 & 1) == 0)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = (1 << v6);
      if ((a3 & v7) != 0)
      {
        if (v6 <= 0x12 && ((0x43FFFu >> v6) & 1) != 0) {
          [(id)UIApp _deactivateForReason:dword_186B93968[v6]];
        }
        a3 &= ~v7;
      }
      if (v6 > 0x11) {
        break;
      }
      ++v6;
    }
    while (a3);
  }
}

- (BOOL)activatedOnce
{
  return (*(unsigned char *)&self->_multiplexerFlags >> 1) & 1;
}

- (BOOL)lifecycleWantsUnnecessaryDelayForSceneDelivery
{
  if (lifecycleWantsUnnecessaryDelayForSceneDelivery_onceToken != -1) {
    dispatch_once(&lifecycleWantsUnnecessaryDelayForSceneDelivery_onceToken, &__block_literal_global_2_2);
  }
  return lifecycleWantsUnnecessaryDelayForSceneDelivery__lifecycleWantsUnnecessaryDelayForSceneDelivery;
}

- (void)_performBlock:(id)a3 withApplicationOfDeactivationReasons:(unint64_t)a4 fromReasons:(unint64_t)a5
{
  unsigned int v16 = (void (**)(void))a3;
  int v7 = [(id)UIApp _isSpringBoardShowingAnAlert];
  char v8 = v7;
  if (v7) {
    [(id)UIApp _deactivateForReason:13];
  }
  id v9 = v16;
  if (!v16 || a5 == a4)
  {
    if (v16)
    {
      v16[2](v16);
      id v9 = v16;
    }
  }
  else
  {
    unint64_t v10 = a4 & ~a5;
    if (v10)
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v12 = (1 << v11);
        if ((v10 & v12) != 0)
        {
          if (v11 <= 0x12 && ((0x43FFFu >> v11) & 1) != 0)
          {
            [(id)UIApp _deactivateForReason:dword_186B93968[v11]];
            id v9 = v16;
          }
          v10 &= ~v12;
        }
        if (v11 > 0x11) {
          break;
        }
        ++v11;
      }
      while (v10);
    }
    v9[2](v16);
    id v9 = v16;
    unint64_t v13 = a5 & ~a4;
    if (v13)
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v15 = (1 << v14);
        if ((v13 & v15) != 0)
        {
          if (v14 <= 0x12 && ((0x43FFFu >> v14) & 1) != 0)
          {
            [(id)UIApp _stopDeactivatingForReason:dword_186B93968[v14]];
            id v9 = v16;
          }
          v13 &= ~v15;
        }
        if (v14 > 0x11) {
          break;
        }
        ++v14;
      }
      while (v13);
    }
  }
  if ((v8 & 1) == 0)
  {
    [(id)UIApp _stopDeactivatingForReason:13];
    id v9 = v16;
  }
}

- (void)_scheduleFirstCommit
{
  v2 = [(id)UIApp _firstCommitBlock];
  v2[2]();
}

- (id)initForAppSingleton:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UISceneLifecycleMultiplexer;
  v3 = [(_UISceneLifecycleMultiplexer *)&v7 init];
  BOOL v4 = v3;
  if (v3)
  {
    objc_storeWeak((id *)&v3->_uiSceneOfRecord, 0);
    transitionalLifecycleState = v4->_transitionalLifecycleState;
    v4->_transitionalLifecycleState = 0;

    *(unsigned char *)&v4->_multiplexerFlags &= ~2u;
  }
  return v4;
}

- (void)_globalTestRelatedActivationActionsForFirstActivation:(BOOL)a3 foreground:(BOOL)a4 interfaceStyle:(int64_t)a5 transitionContext:(id)a6
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  char v8 = (void *)UIApp;
  *(void *)(UIApp + 176) |= 0x200000000uLL;
  objc_msgSend(v8, "_configureLaunchOptions:", a6, a4, a5);
  id v9 = (void *)UIApp;
  [v9 _initiateLaunchActionsBackgrounded:!v6 firstActivation:v7];
}

- (void)completeApplicationLaunchWithFBSScene:(id)a3 transitionContext:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ((*(unsigned char *)&self->_multiplexerFlags & 1) == 0)
  {
    entr_act_end();
    _requestHardwareEventsIfNeeded();
    [(id)UIApp _deactivateForReason:11];
    BOOL v7 = (void *)UIApp;
    if (v6)
    {
      [(id)UIApp _runWithMainScene:v9 transitionContext:v6 completion:0];
    }
    else
    {
      char v8 = +[FBSSceneTransitionContext transitionContext];
      [v7 _runWithMainScene:v9 transitionContext:v8 completion:0];
    }
  }
}

- (BOOL)isActive
{
  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  if (WeakRetained)
  {
  }
  else if ([(id)UIApp isFrontBoard])
  {
    return 1;
  }
  transitionalLifecycleState = self->_transitionalLifecycleState;
  if (transitionalLifecycleState)
  {
    return _UISceneLifecycleStateIsForegroundActive(transitionalLifecycleState);
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);
    char v8 = [v7 _isActive];

    return v8;
  }
}

- (BOOL)runningInTaskSwitcher
{
  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  if (WeakRetained)
  {
  }
  else if ([(id)UIApp isFrontBoard])
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  transitionalLifecycleState = self->_transitionalLifecycleState;
  if (transitionalLifecycleState)
  {
    return ([(UIApplicationSceneSettings *)transitionalLifecycleState deactivationReasons] >> 3) & 1;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);
    char v8 = [v7 _isRunningInTaskSwitcher];

    LOBYTE(v5) = v8;
  }
  return v5;
}

- (BOOL)isTrackingScene:(id)a3
{
  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_uiSceneOfRecord);

  return WeakRetained == v4;
}

- (void)forceExitWithTransitionContext:(id)a3 scene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 uiSettings];
  id v9 = (void *)[v8 mutableCopy];
  [v9 setForeground:0];
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = (void *)[v9 copy];
  id v13 = v10;
  id v14 = v11;
  id v15 = v14;
  if (self)
  {
    -[_UISceneLifecycleMultiplexer _evalTransitionToSettings:fromSettings:forceExit:withTransitionStore:](self, "_evalTransitionToSettings:fromSettings:forceExit:withTransitionStore:", v12, v8, 1, v13, v14);
  }
  else
  {
  }
}

- (void)collectBackingStores
{
  [MEMORY[0x1E4F39CF8] flush];
  v2 = +[_UISceneLifecycleMultiplexer sharedInstance];
  uint64_t v3 = [v2 applicationState];

  if (v3 == 2)
  {
    [(id)UIApp _beginBackgroundTaskWithName:@"com.apple.UIKit.CABackingStoreCollect" expirationHandler:0];
    CABackingStoreCollectWithCompletionHandler();
  }
  else
  {
    v4.n128_f64[0] = CACurrentMediaTime();
    MEMORY[0x1F40F4A30](v4);
  }
}

- (BOOL)_prepareForClientSuspensionWithScene:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [(id)UIApp defaultImageSnapshotExpiration];
  uint64_t v7 = v6;
  char v8 = objc_opt_respondsToSelector();
  id v9 = (void *)UIApp;
  if (v8)
  {
    LOBYTE(v10) = [(id)UIApp applicationSuspendWithSettings:v5];
    if ((*(unsigned char *)(UIApp + 184) & 8) == 0)
    {
      id v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v11 synchronize];
    }
    uint64_t v12 = [v5 valueForKey:@"UISuspendedDefaultPNGKey"];
    id v13 = (void *)[v12 copy];

    if (v13) {
      id v14 = v13;
    }
  }
  else
  {
    *(void *)(UIApp + 176) &= ~0x400000000uLL;
    [v9 applicationSuspend];
    id v13 = 0;
    int v10 = (*(unsigned __int8 *)(UIApp + 180) >> 2) & 1;
  }
  id v15 = +[UIScene _sceneForFBSScene:v4];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69___UISceneLifecycleMultiplexer__prepareForClientSuspensionWithScene___block_invoke;
  v19[3] = &unk_1E52DFF20;
  id v20 = v5;
  id v21 = v13;
  uint64_t v22 = v7;
  id v16 = v13;
  id v17 = v5;
  [v15 _updateUIClientSettingsWithBlock:v19];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionalLifecycleState, 0);
  objc_destroyWeak((id *)&self->_uiSceneOfRecord);
}

@end