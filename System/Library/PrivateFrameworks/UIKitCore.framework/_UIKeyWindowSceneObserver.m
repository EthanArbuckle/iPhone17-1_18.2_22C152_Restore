@interface _UIKeyWindowSceneObserver
- (NSString)description;
- (UIScene)_scene;
- (_UIKeyWindowSceneObserver)init;
- (_UIKeyWindowSceneObserver)initWithScene:(id)a3;
- (id)_settingsDiffActionsForScene:(id)a3;
- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_setScene:(id)a3;
- (void)evaluateTargetOfEventDeferringEnvironments;
- (void)observerDeliveryPolicyDidChange:(id)a3;
@end

@implementation _UIKeyWindowSceneObserver

- (id)_settingsDiffActionsForScene:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_observerFlags & 1) == 0) {
    goto LABEL_5;
  }
  if (qword_1EB262390 != -1) {
    dispatch_once(&qword_1EB262390, &__block_literal_global_440);
  }
  if (!_MergedGlobals_1192)
  {
    v5 = objc_opt_new();
    v6[0] = v5;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
LABEL_5:
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)&self->_observerFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    if (*(unsigned char *)__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262378))
    {
      v8 = (objc_class *)objc_opt_class();
      Name = class_getName(v8);
      _NSStringFromUISceneActivationState([WeakRetained activationState]);
      id v10 = objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 UTF8String];

      _NSStringFromUISceneActivationState(a4);
      id v12 = objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 UTF8String];

      v14 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(WeakRetained);
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262380);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v16 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = 136447234;
          v18 = Name;
          __int16 v19 = 2050;
          id v20 = WeakRetained;
          __int16 v21 = 2082;
          uint64_t v22 = v11;
          __int16 v23 = 2082;
          uint64_t v24 = v13;
          __int16 v25 = 2082;
          v26 = v14;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Scene will transition to activation state: %{public}s: %{public}p; from %{public}s to %{public}s; scene iden"
            "tity: %{public}s",
            (uint8_t *)&v17,
            0x34u);
        }
      }
    }
    -[_UIKeyWindowEvaluator windowScene:willTransitionToActivationState:]((uint64_t)self->_keyWindowEvaluator, WeakRetained, a4);
  }
}

- (void)_setScene:(id)a3
{
}

- (_UIKeyWindowSceneObserver)initWithScene:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v5 = +[_UIKeyWindowEvaluator sharedEvaluator];
  if (self)
  {
    v23.receiver = self;
    v23.super_class = (Class)_UIKeyWindowSceneObserver;
    v6 = [(_UIKeyWindowSceneObserver *)&v23 init];
    self = v6;
    if (v6)
    {
      objc_storeWeak((id *)&v6->_scene, a3);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      *(unsigned char *)&self->_observerFlags = *(unsigned char *)&self->_observerFlags & 0xFE | isKindOfClass & 1;
      if (isKindOfClass)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
        if (*(unsigned char *)__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262368))
        {
          v18 = (objc_class *)objc_opt_class();
          Name = class_getName(v18);
          id v20 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(WeakRetained);
          unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262370);
          if (*(unsigned char *)CategoryCachedImpl)
          {
            uint64_t v22 = *(NSObject **)(CategoryCachedImpl + 8);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              __int16 v25 = Name;
              __int16 v26 = 2050;
              id v27 = WeakRetained;
              __int16 v28 = 2082;
              v29 = v20;
              _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Scene did connect: %{public}s: %{public}p; scene identity: %{public}s",
                buf,
                0x20u);
            }
          }
        }
        if (qword_1EB262390 != -1) {
          dispatch_once(&qword_1EB262390, &__block_literal_global_440);
        }
        if (_MergedGlobals_1192)
        {
          v9 = [a3 _FBSScene];
          id v10 = [v9 identityToken];

          if (v10)
          {
            uint64_t v11 = (BKSHIDEventDeliveryPolicyObserver *)objc_opt_new();
            hidPolicyObserver = self->_hidPolicyObserver;
            self->_hidPolicyObserver = v11;

            [(BKSHIDEventDeliveryPolicyObserver *)self->_hidPolicyObserver addObserver:self];
            uint64_t v13 = self->_hidPolicyObserver;
            v14 = (void *)MEMORY[0x1E4F4F290];
            v15 = [v10 stringRepresentation];
            v16 = [v14 tokenForString:v15];
            [(BKSHIDEventDeliveryPolicyObserver *)v13 setDeferringToken:v16];
          }
        }
        objc_storeStrong((id *)&self->_keyWindowEvaluator, v5);
        -[_UIKeyWindowEvaluator windowSceneDidConnect:]((uint64_t)self->_keyWindowEvaluator, WeakRetained);
        -[_UIKeyWindowSceneObserver evaluateTargetOfEventDeferringEnvironments]((uint64_t)self);
      }
    }
  }

  return self;
}

- (void)evaluateTargetOfEventDeferringEnvironments
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    char v4 = [WeakRetained _allowsEventUIWindowRouting];

    id v5 = objc_loadWeakRetained(v2);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (v4 & 1) != 0 || (isKindOfClass)
    {
      v7 = objc_loadWeakRetained(v2);
      if (qword_1EB262390 != -1) {
        dispatch_once(&qword_1EB262390, &__block_literal_global_440);
      }
      if (_MergedGlobals_1192)
      {
        uint64_t v8 = [*(id *)(a1 + 16) policyStatus];
        -[UIScene _targetOfKeyboardEventDeferringEnvironmentDidUpdate:](v7, v8 > 0);
        if (v8 >= 1) {
          goto LABEL_8;
        }
      }
      else
      {
        id v16 = objc_loadWeakRetained(v2);
        int v17 = [v16 _FBSScene];
        v18 = [v17 settings];
        char v19 = [v18 isUISubclass];

        if (v19)
        {
          id v20 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
          id v21 = objc_loadWeakRetained(v2);
          uint64_t v22 = [v21 _FBSScene];
          objc_super v23 = [v22 uiSettings];
          uint64_t v24 = [v23 targetOfEventDeferringEnvironments];

          LODWORD(v21) = [v24 containsObject:v20];
          -[UIScene _targetOfKeyboardEventDeferringEnvironmentDidUpdate:](v7, (int)v21);
          if (v21)
          {
LABEL_8:
            +[_UIEventDeferringManager targetOfEventDeferringEnvironmentsDidUpdateForScene:]((uint64_t)_UIEventDeferringManager, v7);
            if (isKindOfClass)
            {
              id v9 = objc_loadWeakRetained(v2);
              id v10 = (objc_class *)objc_opt_class();
              Name = class_getName(v10);
              id v12 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(v9);
              uint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB262388) + 8);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                int v25 = 136446722;
                __int16 v26 = Name;
                __int16 v27 = 2050;
                id v28 = v9;
                __int16 v29 = 2080;
                uint64_t v30 = v12;
                _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "Scene became target of keyboard event deferring environment: %{public}s: %{public}p; scene identity: %s",
                  (uint8_t *)&v25,
                  0x20u);
              }
              -[_UIKeyWindowEvaluator windowSceneDidBecomeTargetOfKeyboardEventDeferringEnvironment:](*(char **)(a1 + 8), v9);
              v14 = -[UIWindowScene _keyWindow]((id *)v9);

              if (v14)
              {
                v15 = -[UIWindowScene _keyWindow]((id *)v9);
                [v15 _restoreFirstResponder];
              }
            }
          }
        }
        else
        {
          -[UIScene _targetOfKeyboardEventDeferringEnvironmentDidUpdate:](v7, 0);
        }
      }
    }
  }
}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v3, &location);
  BSDispatchMain();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (_UIKeyWindowSceneObserver)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIKeyWindowSceneObserver.m", 122, @"%s: init is not allowed on %@", "-[_UIKeyWindowSceneObserver init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)_sceneWillInvalidate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)&self->_observerFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    id v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    v7 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(WeakRetained);
    uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("KeyWindow", &_sceneWillInvalidate____s_category_0) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136446722;
      id v10 = Name;
      __int16 v11 = 2050;
      id v12 = WeakRetained;
      __int16 v13 = 2082;
      v14 = v7;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Scene will invalidate: %{public}s: %{public}p; scene identity: %{public}s",
        (uint8_t *)&v9,
        0x20u);
    }
    -[_UIKeyWindowEvaluator windowSceneWillInvalidate:]((uint64_t)self->_keyWindowEvaluator, WeakRetained);
  }
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v6 = objc_opt_class();
  id v7 = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p; windowScene: <%@: %p>>", v4, self, v6, v7];

  return (NSString *)v8;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_hidPolicyObserver, 0);
  objc_storeStrong((id *)&self->_keyWindowEvaluator, 0);
}

@end