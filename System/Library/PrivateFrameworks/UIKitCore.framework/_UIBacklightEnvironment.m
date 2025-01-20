@interface _UIBacklightEnvironment
+ (BOOL)_alwaysOnSupported;
+ (BOOL)_backlightEnvironmentSupported;
+ (double)_defaultAnimationDuration;
+ (id)_postSynchronizeQueue;
+ (void)_performOnChildViewControllersForAlwaysOnTimelines:(id)a3 performBlock:(id)a4 withCompletion:(id)a5;
- (BOOL)isObserver:(id)a3;
- (BOOL)shouldDeferWakeAnimationStart;
- (UIScene)_scene;
- (UITraitCollection)_traitOverrides;
- (_UIBacklightEnvironment)initWithScene:(id)a3;
- (id)_windowScene;
- (void)_commit:(BOOL)a3 andPerformPostSynchronizeBlock:(id)a4;
- (void)_enumerateAllObserversWithBlock:(id)a3;
- (void)_notifyObserversEnvironmentVisualStateWillChangeToState:(id)a3;
- (void)_notifyObserversIfEnvironmentVisualStateDidChangeFromActiveOn:(id)a3;
- (void)_notifyObserversIfEnvironmentVisualStateDidChangeToActiveOn:(id)a3;
- (void)_setScene:(id)a3;
- (void)addObserver:(id)a3;
- (void)environment:(id)a3 performBacklightSceneUpdate:(id)a4;
- (void)environment:(id)a3 timelinesForDateInterval:(id)a4 previousSpecifier:(id)a5 completion:(id)a6;
- (void)removeObserver:(id)a3;
- (void)setShouldDeferWakeAnimationStart:(BOOL)a3;
- (void)transitionTraitsInUpdate:(id)a3 animations:(id)a4 completion:(id)a5;
- (void)updateSceneWithFrameSpecifier:(id)a3 layout:(BOOL)a4 completion:(id)a5;
@end

@implementation _UIBacklightEnvironment

- (_UIBacklightEnvironment)initWithScene:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIBacklightEnvironment;
  v5 = [(_UIBacklightEnvironment *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v7 = [v4 _backlightSceneEnvironment];
    v8 = [v7 delegate];

    if (!v8)
    {
      [v7 setDelegate:v6];
      objc_msgSend(v7, "setSupportsAlwaysOn:", objc_msgSend((id)objc_opt_class(), "_alwaysOnSupported"));
    }
  }
  return v6;
}

- (UITraitCollection)_traitOverrides
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() _backlightEnvironmentSupported])
  {
    visualState = self->_visualState;
    if (visualState)
    {
      uint64_t v4 = [(BLSBacklightSceneVisualState *)visualState updateFidelity];
      uint64_t v5 = [(BLSBacklightSceneVisualState *)self->_visualState adjustedLuminance];
      uint64_t v6 = 1;
      if (v5 != 1) {
        uint64_t v6 = 2;
      }
      if (!v5) {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 2;
      uint64_t v4 = 3;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42___UIBacklightEnvironment__traitOverrides__block_invoke;
    v10[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
    v10[4] = v4;
    v10[5] = v6;
    v7 = +[UITraitCollection traitCollectionWithTraits:v10];
    v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIBacklightEnvironment", &_traitOverrides___s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Updated traitOverrides: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v7 = 0;
  }
  return (UITraitCollection *)v7;
}

+ (BOOL)_backlightEnvironmentSupported
{
  if ([(id)objc_opt_class() _alwaysOnSupported]) {
    return 1;
  }
  v3 = (void *)UIApp;
  return [v3 _supportsBacklightEnvironment];
}

+ (BOOL)_alwaysOnSupported
{
  return [(id)UIApp _supportsAlwaysOnDisplay];
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
  id v4 = [(_UIBacklightEnvironment *)self _windowScene];
  [v4 _componentDidUpdateTraitOverrides:self];
}

- (id)_windowScene
{
  v2 = [(_UIBacklightEnvironment *)self _scene];
  v3 = self;
  if (objc_opt_isKindOfClass()) {
    id v4 = v2;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

+ (id)_postSynchronizeQueue
{
  if (_MergedGlobals_1094 != -1) {
    dispatch_once(&_MergedGlobals_1094, &__block_literal_global_113_3);
  }
  v2 = (void *)qword_1EB260E98;
  return v2;
}

+ (double)_defaultAnimationDuration
{
  return 0.5;
}

- (BOOL)isObserver:(id)a3
{
  return a3 && -[NSHashTable containsObject:](self->_observers, "containsObject:");
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)_enumerateAllObserversWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      char v12 = 0;
      v4[2](v4, v11, &v12);
      if (v12) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_notifyObserversEnvironmentVisualStateWillChangeToState:(id)a3
{
  if (BLSBacklightStateForVisuaState() == 2) {
    id v4 = &__block_literal_global_121_0;
  }
  else {
    id v4 = &__block_literal_global_126;
  }
  [(_UIBacklightEnvironment *)self _enumerateAllObserversWithBlock:v4];
}

- (void)_notifyObserversIfEnvironmentVisualStateDidChangeToActiveOn:(id)a3
{
  id v4 = [a3 visualState];
  uint64_t v5 = BLSBacklightStateForVisuaState();

  if (v5 == 2)
  {
    [(_UIBacklightEnvironment *)self _enumerateAllObserversWithBlock:&__block_literal_global_131_1];
  }
}

- (void)_notifyObserversIfEnvironmentVisualStateDidChangeFromActiveOn:(id)a3
{
  id v4 = [a3 visualState];
  uint64_t v5 = BLSBacklightStateForVisuaState();

  if (v5 != 2)
  {
    [(_UIBacklightEnvironment *)self _enumerateAllObserversWithBlock:&__block_literal_global_136_0];
  }
}

- (void)transitionTraitsInUpdate:(id)a3 animations:(id)a4 completion:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  uint64_t v11 = [v8 context];
  char v12 = [v11 previousVisualState];
  long long v13 = [v8 context];
  long long v14 = [v13 visualState];
  kdebug_trace();

  long long v15 = [v8 context];
  long long v16 = [v15 visualState];

  char v17 = [(BLSBacklightSceneVisualState *)self->_visualState isEqual:v16];
  if ((v17 & 1) == 0) {
    objc_storeStrong((id *)&self->_visualState, v16);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke;
  aBlock[3] = &unk_1E52DA138;
  char v58 = v17 ^ 1;
  id v18 = v8;
  id v55 = v18;
  v56 = self;
  id v19 = v9;
  id v57 = v19;
  v20 = (void (**)(void))_Block_copy(aBlock);
  v21 = [v18 context];
  int v22 = [v21 isAnimated];

  if (v22)
  {
    id v44 = v19;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    v24 = [WeakRetained windows];

    uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v51;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v51 != v27) {
            objc_enumerationMutation(v24);
          }
          objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * v28++), "layoutIfNeeded", v44);
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v26);
    }

    [MEMORY[0x1E4F39CF8] begin];
    v29 = (void *)MEMORY[0x1E4F39CF8];
    [(id)objc_opt_class() _defaultAnimationDuration];
    objc_msgSend(v29, "setAnimationDuration:");
    [MEMORY[0x1E4F39CF8] begin];
    if (v10)
    {
      v30 = (void *)MEMORY[0x1E4F39CF8];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke_148;
      v48[3] = &unk_1E52DA040;
      v49 = v10;
      [v30 setCompletionBlock:v48];
    }
    v31 = objc_msgSend(MEMORY[0x1E4F39B48], "animationWithKeyPath:", @"com.apple.uikit.backlighttransition", v44);
    [(id)objc_opt_class() _defaultAnimationDuration];
    objc_msgSend(v31, "setDuration:");
    [v31 setFromValue:&unk_1ED3F1E38];
    [v31 setToValue:&unk_1ED3F1E48];
    id v32 = objc_loadWeakRetained((id *)&self->_scene);
    v33 = [v32 keyWindow];
    [v33 addAnimation:v31 forKey:@"uikit.backlightTransition"];

    [(id)objc_opt_class() _defaultAnimationDuration];
    objc_msgSend(v18, "performBacklightRampWithDuration:");
    [MEMORY[0x1E4F39CF8] commit];
    [(id)objc_opt_class() _defaultAnimationDuration];
    double v35 = v34;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __74___UIBacklightEnvironment_transitionTraitsInUpdate_animations_completion___block_invoke_159;
    v46[3] = &unk_1E52DB330;
    v46[4] = self;
    v47 = v20;
    +[UIView animateWithDuration:v46 animations:v35];
    [MEMORY[0x1E4F39CF8] commit];
    v36 = [v18 context];
    v37 = [v36 previousVisualState];
    v38 = [v18 context];
    v39 = [v38 visualState];
    kdebug_trace();

    id v19 = v45;
  }
  else
  {
    [MEMORY[0x1E4F39CF8] begin];
    v20[2](v20);
    [MEMORY[0x1E4F39CF8] commit];
    v40 = [v18 context];
    v41 = [v40 previousVisualState];
    v42 = [v18 context];
    v43 = [v42 visualState];
    kdebug_trace();

    [v18 performBacklightRampWithDuration:0.0];
    if (v10) {
      v10[2](v10);
    }
  }
}

+ (void)_performOnChildViewControllersForAlwaysOnTimelines:(id)a3 performBlock:(id)a4 withCompletion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (void (**)(id, uint64_t, void *))a4;
  char v17 = (void (**)(void))a5;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        [v11 addObject:v15];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __106___UIBacklightEnvironment__performOnChildViewControllersForAlwaysOnTimelines_performBlock_withCompletion___block_invoke;
        v18[3] = &unk_1E52F2008;
        SEL v23 = a2;
        id v24 = a1;
        id v19 = v11;
        uint64_t v20 = v15;
        int v22 = &v29;
        v21 = v17;
        v10[2](v10, v15, v18);
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v12);
  }

  if (![v11 count]) {
    v17[2]();
  }
  *((unsigned char *)v30 + 24) = 1;

  _Block_object_dispose(&v29, 8);
}

- (void)updateSceneWithFrameSpecifier:(id)a3 layout:(BOOL)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v25 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v11 = [WeakRetained windows];

  id obj = v11;
  uint64_t v28 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v41;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v12;
        uint64_t v13 = [*(id *)(*((void *)&v40 + 1) + 8 * v12) rootViewController];
        long long v14 = [v13 _effectiveControllersForAlwaysOnTimelines];

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v37;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v37 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v36 + 1) + 8 * v19);
              if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
              {
                [v9 addObject:v20];
              }
              else if (objc_opt_respondsToSelector())
              {
                [v20 performSelector:sel_puic_updateWithFrameSpecifier_ withObject:v7];
              }
              else
              {
                [v20 _updateWithFrameSpecifier:v7];
              }
              ++v19;
            }
            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v17);
        }

        uint64_t v12 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v28);
  }

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __75___UIBacklightEnvironment_updateSceneWithFrameSpecifier_layout_completion___block_invoke;
  v32[3] = &unk_1E52F2030;
  id v21 = v7;
  id v34 = v9;
  id v35 = v8;
  id v33 = v21;
  id v22 = v9;
  id v23 = v8;
  [(_UIBacklightEnvironment *)v25 _enumerateAllObserversWithBlock:v32];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __75___UIBacklightEnvironment_updateSceneWithFrameSpecifier_layout_completion___block_invoke_2;
  v30[3] = &unk_1E52F2058;
  id v31 = v21;
  id v24 = v21;
  +[_UIBacklightEnvironment _performOnChildViewControllersForAlwaysOnTimelines:v22 performBlock:v30 withCompletion:v23];
}

- (void)_commit:(BOOL)a3 andPerformPostSynchronizeBlock:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[_UIBacklightEnvironment _postSynchronizeQueue];
  [v6 enqueuePostSynchronizeBlock:v5];

  if (v4)
  {
    id v7 = (void *)MEMORY[0x1E4F39CF8];
    [v7 commit];
  }
}

- (void)environment:(id)a3 performBacklightSceneUpdate:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 context];
  long long v39 = [v8 frameSpecifier];
  id v9 = [v8 visualState];
  uint64_t v10 = BLSBacklightStateForVisuaState();
  BOOL v11 = v10 == 2;

  uint64_t v12 = [v8 previousVisualState];

  if (v12)
  {
    uint64_t v13 = [v8 previousVisualState];
    BOOL v14 = BLSBacklightStateForVisuaState() == 2;
  }
  else
  {
    BOOL v14 = v10 != 2;
  }
  id v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIBacklightEnvironment", &environment_performBacklightSceneUpdate____s_category)+ 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v73 = v10 == 2;
    __int16 v74 = 1024;
    BOOL v75 = v14;
    _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "performBacklightSceneUpdate isOn = %d wasOn = %d", buf, 0xEu);
  }
  char v16 = (v10 == 2) ^ v14 ^ 1;
  if ((v10 != 2) | v16 & 1)
  {
    if (v10 == 2) {
      char v16 = 1;
    }
    uint64_t v17 = v6;
    if (v16)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_12;
      aBlock[3] = &unk_1E52DA070;
      SEL v46 = a2;
      void aBlock[4] = self;
      id v45 = v7;
      uint64_t v18 = _Block_copy(aBlock);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_16;
      v40[3] = &unk_1E52E3298;
      uint64_t v19 = v39;
      id v41 = v39;
      long long v42 = self;
      id v43 = v18;
      id v20 = v18;
      +[UIView performWithoutAnimation:v40];
    }
    else
    {
      id v35 = [v8 visualState];
      [(_UIBacklightEnvironment *)self _notifyObserversEnvironmentVisualStateWillChangeToState:v35];

      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_11;
      v47[3] = &unk_1E52DCB30;
      id v36 = v7;
      id v48 = v36;
      v49 = self;
      id v50 = v6;
      [(_UIBacklightEnvironment *)self transitionTraitsInUpdate:v36 animations:&__block_literal_global_171 completion:v47];
      [v36 sceneContentsDidUpdate];

      uint64_t v19 = v39;
    }
  }
  else
  {
    id v21 = [v8 previousVisualState];
    id v22 = [v8 visualState];
    kdebug_trace();

    id v23 = [v8 visualState];
    [(_UIBacklightEnvironment *)self _notifyObserversEnvironmentVisualStateWillChangeToState:v23];

    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke;
    v69[3] = &unk_1E52DCB30;
    v69[4] = self;
    id v24 = v8;
    id v70 = v24;
    id v37 = v7;
    id v25 = v7;
    id v71 = v25;
    long long v26 = _Block_copy(v69);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_2;
    v62[3] = &unk_1E52F2080;
    SEL v66 = a2;
    v62[4] = self;
    id v63 = v25;
    BOOL v67 = v14;
    BOOL v27 = v11;
    BOOL v68 = v11;
    id v28 = v26;
    id v65 = v28;
    uint64_t v17 = v6;
    id v64 = v6;
    uint64_t v29 = _Block_copy(v62);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_7;
    v56[3] = &unk_1E52F20A8;
    id v57 = v24;
    id v30 = v28;
    id v60 = v30;
    char v58 = self;
    uint64_t v19 = v39;
    id v31 = v39;
    id v59 = v31;
    id v32 = v29;
    id v61 = v32;
    id v33 = _Block_copy(v56);
    id v34 = v33;
    if (v31)
    {
      [MEMORY[0x1E4F39CF8] begin];
      kdebug_trace();
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __67___UIBacklightEnvironment_environment_performBacklightSceneUpdate___block_invoke_9;
      v51[3] = &unk_1E52F2148;
      v51[4] = self;
      BOOL v54 = v14;
      BOOL v55 = v27;
      id v52 = v31;
      id v53 = v34;
      [(_UIBacklightEnvironment *)self updateSceneWithFrameSpecifier:v52 layout:1 completion:v51];
    }
    else
    {
      (*((void (**)(void *))v33 + 2))(v33);
    }

    id v7 = v37;
  }
}

- (void)environment:(id)a3 timelinesForDateInterval:(id)a4 previousSpecifier:(id)a5 completion:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v34 = a6;
  BOOL v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIBacklightEnvironment", &environment_timelinesForDateInterval_previousSpecifier_completion____s_category)+ 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v63 = v9;
    __int16 v64 = 2114;
    id v65 = v10;
    _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "Fetching timelines for dateInterval : %{public}@ previousSpecifier : %{public}@", buf, 0x16u);
  }
  id v35 = v10;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v33 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  id v15 = [WeakRetained windows];

  id obj = v15;
  uint64_t v38 = [v15 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v57;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v57 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = v16;
        uint64_t v17 = [*(id *)(*((void *)&v56 + 1) + 8 * v16) rootViewController];
        uint64_t v18 = [v17 _effectiveControllersForAlwaysOnTimelines];

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v53;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v53 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(void **)(*((void *)&v52 + 1) + 8 * v23);
              if (objc_opt_respondsToSelector())
              {
                [v12 addObject:v24];
              }
              else
              {
                id v25 = [v24 _timelinesForDateInterval:v9];
                [v13 addObjectsFromArray:v25];
              }
              ++v23;
            }
            while (v21 != v23);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v52 objects:v60 count:16];
          }
          while (v21);
        }

        uint64_t v16 = v39 + 1;
      }
      while (v39 + 1 != v38);
      uint64_t v38 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v38);
  }

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke;
  v48[3] = &unk_1E52F20D0;
  id v26 = v9;
  id v49 = v26;
  id v27 = v13;
  id v50 = v27;
  id v51 = v12;
  id v28 = v12;
  [(_UIBacklightEnvironment *)v33 _enumerateAllObserversWithBlock:v48];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_2;
  v43[3] = &unk_1E52F2120;
  SEL v47 = a2;
  id v44 = v26;
  id v45 = v33;
  id v46 = v27;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __93___UIBacklightEnvironment_environment_timelinesForDateInterval_previousSpecifier_completion___block_invoke_4;
  v40[3] = &unk_1E52DA160;
  id v41 = v46;
  id v42 = v34;
  id v29 = v26;
  id v30 = v46;
  id v31 = v34;
  +[_UIBacklightEnvironment _performOnChildViewControllersForAlwaysOnTimelines:v28 performBlock:v43 withCompletion:v40];
}

- (BOOL)shouldDeferWakeAnimationStart
{
  return self->_shouldDeferWakeAnimationStart;
}

- (void)setShouldDeferWakeAnimationStart:(BOOL)a3
{
  self->_shouldDeferWakeAnimationStart = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_visualState, 0);
}

@end