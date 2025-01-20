@interface _UIWindowSceneFBSSceneLifecycleMonitor
- (_UIWindowSceneFBSSceneLifecycleMonitor)initWithScene:(id)a3;
- (id)_windowScene;
- (int64_t)currentActivationState;
- (void)didEnterBackground;
- (void)transitionToTargetState:(id)a3 fromState:(id)a4 withTransitionContext:(id)a5 preparations:(id)a6;
- (void)willBecomeActive;
@end

@implementation _UIWindowSceneFBSSceneLifecycleMonitor

- (int64_t)currentActivationState
{
  if (!self->_connected) {
    return -1;
  }
  if (self->_transitioning)
  {
    transitioningState = self->_transitioningState;
    return [(NSNumber *)transitioningState integerValue];
  }
  else
  {
    v4 = [(_UISceneLifecycleMonitor *)self _scene];
    v5 = [v4 _effectiveSettings];
    int64_t v6 = +[UIScene _activationStateFromSceneSettings:v5];

    return v6;
  }
}

- (void)transitionToTargetState:(id)a3 fromState:(id)a4 withTransitionContext:(id)a5 preparations:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, void *))a6;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__24;
  v49 = __Block_byref_object_dispose__24;
  id v50 = [(_UISceneLifecycleMonitor *)self _scene];
  if (([(id)v46[5] _hasLifecycle] & 1) == 0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    [v28 handleFailureInMethod:a2, self, @"_UISceneLifecycleMonitor.m", 189, @"attemmpting to use %@ for invalid frame subtype: %@ that doesn't expect lifecycle", v30, v32 object file lineNumber description];
  }
  v15 = [(id)v46[5] _FBSScene];
  int64_t v16 = +[UIScene _activationStateFromSceneSettings:v12];
  SEL v17 = a2;
  v33 = v13;
  v34 = v12;
  v18 = v11;
  unsigned int v19 = _UISceneLifecycleCompositeActionMaskFromStateToState__staticStateMap[4 * v16
                                                                           + 5
                                                                           + +[UIScene _activationStateFromSceneSettings:v11]];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke;
  aBlock[3] = &unk_1E52D9900;
  aBlock[4] = &v45;
  v20 = _Block_copy(aBlock);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_2;
  v43[3] = &unk_1E52D9900;
  v43[4] = &v45;
  v21 = _Block_copy(v43);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_3;
  v42[3] = &unk_1E52DFD40;
  v42[4] = self;
  v22 = (void (**)(void *, int64_t, BOOL))_Block_copy(v42);
  v22[2](v22, v16, v19 == 1);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_4;
  v35[3] = &unk_1E52DFD90;
  unsigned int v41 = v19;
  v35[4] = self;
  v23 = v22;
  v36 = v23;
  v39 = &v45;
  id v24 = v20;
  id v37 = v24;
  id v25 = v21;
  id v38 = v25;
  SEL v40 = v17;
  v26 = _Block_copy(v35);
  v27 = v26;
  if (v14) {
    v14[2](v14, v26);
  }
  else {
    (*((void (**)(void *, void))v26 + 2))(v26, 0);
  }

  _Block_object_dispose(&v45, 8);
}

- (void)willBecomeActive
{
  v6.receiver = self;
  v6.super_class = (Class)_UIWindowSceneFBSSceneLifecycleMonitor;
  [(_UISceneLifecycleMonitor *)&v6 willBecomeActive];
  v3 = [(_UIWindowSceneFBSSceneLifecycleMonitor *)self _windowScene];
  if ((-[UIScene _systemShellOwnsInterfaceOrientation](v3) & 1) == 0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58___UIWindowSceneFBSSceneLifecycleMonitor_willBecomeActive__block_invoke;
    v4[3] = &unk_1E52D9F70;
    id v5 = v3;
    [v5 _enqueuePostSettingsUpdateResponseBlock:v4 inPhase:0x1ED0EB360];
  }
}

- (id)_windowScene
{
  v2 = [(_UISceneLifecycleMonitor *)self _scene];
  v3 = self;
  if (objc_opt_isKindOfClass()) {
    v4 = v2;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (_UIWindowSceneFBSSceneLifecycleMonitor)initWithScene:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIWindowSceneFBSSceneLifecycleMonitor;
  v3 = [(_UISceneLifecycleMonitor *)&v7 initWithScene:a3];
  v4 = v3;
  if (v3)
  {
    transitioningState = v3->_transitioningState;
    v3->_transitioningState = 0;

    v4->_transitioning = 0;
    v4->_connected = 0;
  }
  return v4;
}

- (void)didEnterBackground
{
  v6.receiver = self;
  v6.super_class = (Class)_UIWindowSceneFBSSceneLifecycleMonitor;
  [(_UISceneLifecycleMonitor *)&v6 didEnterBackground];
  v3 = [(_UIWindowSceneFBSSceneLifecycleMonitor *)self _windowScene];
  if ((-[UIScene _systemShellOwnsInterfaceOrientation](v3) & 1) == 0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60___UIWindowSceneFBSSceneLifecycleMonitor_didEnterBackground__block_invoke;
    v4[3] = &unk_1E52D9F70;
    id v5 = v3;
    [v5 _enqueuePostSettingsUpdateResponseBlock:v4 inPhase:0x1ED0EB360];
  }
}

- (void).cxx_destruct
{
}

@end