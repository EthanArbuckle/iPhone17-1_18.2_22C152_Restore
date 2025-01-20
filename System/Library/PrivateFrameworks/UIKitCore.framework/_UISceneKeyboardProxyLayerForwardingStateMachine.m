@interface _UISceneKeyboardProxyLayerForwardingStateMachine
- (NSString)debugDescription;
- (_UISceneKeyboardProxyLayerForwardingStateMachine)initWithPresentationEnvironment:(id)a3;
- (id)_newProxyLayers;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)hostingEnvironmentForWindow:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)_state;
- (void)_addLayers:(id)a3 toEnvironment:(id)a4;
- (void)_noteHostedInWindow:(id)a3;
- (void)_removeLayers:(id)a3 fromEnvironment:(id)a4;
- (void)_setState:(unint64_t)a3;
- (void)dealloc;
- (void)hostingEnvironmentDidInvalidate:(id)a3;
- (void)noteKeyboardLayersBeingTracked:(id)a3;
- (void)presentationEnvironment:(id)a3 didMoveToWindow:(id)a4;
- (void)presentationEnvironmentDidInvalidate:(id)a3;
- (void)presentationEnvironmentDidUpdateKeyboardLayers:(id)a3;
- (void)window:(id)a3 changedFromLevel:(double)a4 toLevel:(double)a5;
@end

@implementation _UISceneKeyboardProxyLayerForwardingStateMachine

- (_UISceneKeyboardProxyLayerForwardingStateMachine)initWithPresentationEnvironment:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UISceneKeyboardProxyLayerForwardingStateMachine.m", 78, @"Invalid parameter not satisfying: %@", @"presentationEnvironment != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UISceneKeyboardProxyLayerForwardingStateMachine;
  v6 = [(_UISceneKeyboardProxyLayerForwardingStateMachine *)&v13 init];
  v7 = v6;
  if (v6)
  {
    id v8 = objc_storeWeak((id *)&v6->_presentationEnvironment, v5);
    v7->_state = 0;
    id v9 = v8;
    [v5 addObserver:v7];

    v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", initWithPresentationEnvironment____s_category)+ 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v15 = v7;
      __int16 v16 = 2048;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Created with presentation environment: <%p:%@>", buf, 0x20u);
    }
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationEnvironment);
  [WeakRetained removeObserver:self];

  [(UIWindow *)self->_hostingWindow _removeWindowLevelChangedObserver:self];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self->_windowDidMoveToSceneNotificationToken];

  id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &dealloc___s_category_5) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v8 = self;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Dealloc.", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UISceneKeyboardProxyLayerForwardingStateMachine;
  [(_UISceneKeyboardProxyLayerForwardingStateMachine *)&v6 dealloc];
}

- (void)noteKeyboardLayersBeingTracked:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = self->_keyboardLayersTracked;
  if ((BSEqualObjects() & 1) == 0)
  {
    v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &noteKeyboardLayersBeingTracked____s_category)
                      + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 134218242;
      v24 = self;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Keyboard layers being tracked: %@", (uint8_t *)&v23, 0x16u);
    }
    objc_storeStrong((id *)&self->_keyboardLayersTracked, a3);
    NSUInteger v8 = [(NSSet *)self->_keyboardLayersTracked count];
    unint64_t state = self->_state;
    if (v8)
    {
      if (state == 2)
      {
        __int16 v18 = (void *)[(NSSet *)self->_keyboardLayersAddedToHostingEnvironment copy];
        id v19 = [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _newProxyLayers];
        keyboardLayersAddedToHostingEnvironment = self->_keyboardLayersAddedToHostingEnvironment;
        self->_keyboardLayersAddedToHostingEnvironment = v19;

        v21 = (void *)[(NSSet *)self->_keyboardLayersAddedToHostingEnvironment mutableCopy];
        [v21 minusSet:v18];
        v22 = (void *)[v18 mutableCopy];
        [v22 minusSet:self->_keyboardLayersAddedToHostingEnvironment];
        [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _addLayers:v21 toEnvironment:self->_hostingEnvironment];
        [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _removeLayers:v22 fromEnvironment:self->_hostingEnvironment];

        goto LABEL_17;
      }
      if (!state)
      {
        hostingEnvironment = self->_hostingEnvironment;
        if (hostingEnvironment) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = 1;
        }
        if (hostingEnvironment)
        {
          v12 = [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _newProxyLayers];
          [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _addLayers:v12 toEnvironment:self->_hostingEnvironment];
          objc_super v13 = (void *)[(NSSet *)self->_keyboardLayersAddedToHostingEnvironment mutableCopy];
          [v13 minusSet:v12];
          [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _removeLayers:v13 fromEnvironment:self->_hostingEnvironment];
          v14 = self->_keyboardLayersAddedToHostingEnvironment;
          self->_keyboardLayersAddedToHostingEnvironment = v12;
        }
        v15 = self;
        uint64_t v16 = v11;
        goto LABEL_15;
      }
    }
    else if (state - 1 <= 1)
    {
      [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _removeLayers:self->_keyboardLayersAddedToHostingEnvironment fromEnvironment:self->_hostingEnvironment];
      id v17 = self->_keyboardLayersAddedToHostingEnvironment;
      self->_keyboardLayersAddedToHostingEnvironment = 0;

      v15 = self;
      uint64_t v16 = 0;
LABEL_15:
      [(_UISceneKeyboardProxyLayerForwardingStateMachine *)v15 _setState:v16];
    }
  }
LABEL_17:
}

- (unint64_t)_state
{
  return self->_state;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UISceneKeyboardProxyLayerForwardingStateMachine *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78___UISceneKeyboardProxyLayerForwardingStateMachine_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E52D9F98;
  id v4 = v3;
  id v9 = v4;
  v10 = self;
  id v5 = (id)[v4 modifyProem:v8];
  id v6 = v4;

  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_hostingEnvironment withName:@"hostingEnvironment"];
  id v6 = (id)[v4 appendObject:self->_hostingWindow withName:@"hostingWindow"];
  v7 = [(NSSet *)self->_keyboardLayersTracked allObjects];
  [v4 appendArraySection:v7 withName:@"keyboardLayersTracked" skipIfEmpty:1];

  NSUInteger v8 = [(NSSet *)self->_keyboardLayersAddedToHostingEnvironment allObjects];
  [v4 appendArraySection:v8 withName:@"keyboardLayersForwarded" skipIfEmpty:1];

  return v4;
}

- (void)presentationEnvironment:(id)a3 didMoveToWindow:(id)a4
{
}

- (void)presentationEnvironmentDidUpdateKeyboardLayers:(id)a3
{
  id v4 = [a3 keyboardLayers];
  [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self noteKeyboardLayersBeingTracked:v4];
}

- (void)presentationEnvironmentDidInvalidate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &presentationEnvironmentDidInvalidate____s_category)+ 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Presentation environment invalidated: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)hostingEnvironmentDidInvalidate:(id)a3
{
}

- (void)window:(id)a3 changedFromLevel:(double)a4 toLevel:(double)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = (UIWindow *)a3;
  if (self->_hostingWindow != v9)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UISceneKeyboardProxyLayerForwardingStateMachine.m" lineNumber:232 description:@"Window changed must match the window being tracked."];
  }
  uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &window_changedFromLevel_toLevel____s_category)
                     + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218496;
    v15 = self;
    __int16 v16 = 2048;
    double v17 = a4;
    __int16 v18 = 2048;
    double v19 = a5;
    _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Parent window level changed from %f to %f.", (uint8_t *)&v14, 0x20u);
  }
  if ([(NSSet *)self->_keyboardLayersTracked count])
  {
    id v11 = [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _newProxyLayers];
    if ((BSEqualObjects() & 1) == 0)
    {
      objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"_UISceneKeyboardProxyLayerForwardingStateMachine.m", 241, @"Proxy layers should be equal, but have different levels." object file lineNumber description];
    }
    [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _addLayers:v11 toEnvironment:self->_hostingEnvironment];
  }
}

- (id)hostingEnvironmentForWindow:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  id v5 = v4;
  if (!v4)
  {
    id v9 = 0;
    goto LABEL_25;
  }
  int v6 = [v4[100] _FBSScene];
  uint64_t v7 = [v5 windowScene];
  __int16 v8 = (id *)v7;
  if (!v6)
  {
    if (!v7)
    {
      id v9 = 0;
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = v5;
LABEL_8:
      id v11 = [v10 rootViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        id v9 = -[_UISceneKeyboardProxyLayerForwardingHostingViewService initWithViewServiceOperator:]((id *)[_UISceneKeyboardProxyLayerForwardingHostingViewService alloc], v12);

LABEL_23:
        goto LABEL_24;
      }

LABEL_20:
      v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &qword_1EB260270) + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134217984;
        __int16 v18 = self;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Unable to find an appropriate hosting environment for a scene that appears to be in a view service.", (uint8_t *)&v17, 0xCu);
      }
      id v9 = 0;
      goto LABEL_23;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v8[43];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = (id *)v13;
        int v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &_MergedGlobals_1016) + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 134218242;
          __int16 v18 = self;
          __int16 v19 = 2112;
          uint64_t v20 = v10;
          _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Hosting environment for a view service is the text effects window, falling back to the key window (%@) for layer forwarding", (uint8_t *)&v17, 0x16u);
        }

        if (!v10) {
          goto LABEL_20;
        }
        goto LABEL_8;
      }
    }
    uint64_t v10 = 0;
    goto LABEL_20;
  }
  id v9 = -[_UISceneKeyboardProxyLayerForwardingHostingScene initWithScene:]((id *)[_UISceneKeyboardProxyLayerForwardingHostingScene alloc], v6);
LABEL_24:

LABEL_25:
  return v9;
}

- (void)_noteHostedInWindow:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = (UIWindow *)a3;
  int v6 = self->_hostingEnvironment;
  uint64_t v7 = [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self hostingEnvironmentForWindow:v5];
  p_hostingWindow = (id *)&self->_hostingWindow;
  id v9 = self->_hostingWindow;
  if BSEqualObjects() && (BSEqualObjects()) {
    goto LABEL_25;
  }
  if (v9 != v5)
  {
    uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &qword_1EB260278) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v32 = self;
      __int16 v33 = 2112;
      v34 = (_UISceneKeyboardProxyLayerForwardingHostingEnvironment *)v5;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Hosting window did change to %@.", buf, 0x16u);
    }
    [(UIWindow *)self->_hostingWindow _removeWindowLevelChangedObserver:self];
    objc_storeStrong((id *)&self->_hostingWindow, a3);
    [(UIWindow *)self->_hostingWindow _addWindowLevelChangedObserver:self];
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 removeObserver:self->_windowDidMoveToSceneNotificationToken];

    if (self->_hostingWindow && !self->_hostingEnvironment)
    {
      id v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &qword_1EB260280) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v32 = self;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Waiting for a hosting window.", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v27 = *p_hostingWindow;
      int v14 = [MEMORY[0x1E4F28F08] mainQueue];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __72___UISceneKeyboardProxyLayerForwardingStateMachine__noteHostedInWindow___block_invoke;
      v29[3] = &unk_1E52DA728;
      objc_copyWeak(&v30, (id *)buf);
      v15 = [v13 addObserverForName:0x1ED1601E0 object:v27 queue:v14 usingBlock:v29];
      id windowDidMoveToSceneNotificationToken = self->_windowDidMoveToSceneNotificationToken;
      self->_id windowDidMoveToSceneNotificationToken = v15;

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
  }
  if (v6 != v7)
  {
    int v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &qword_1EB260288) + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = v17;
      __int16 v19 = [(_UISceneKeyboardProxyLayerForwardingHostingEnvironment *)v7 description];
      *(_DWORD *)buf = 134218498;
      v32 = self;
      __int16 v33 = 2048;
      v34 = v7;
      __int16 v35 = 2112;
      v36 = v19;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Hosting environment did change to <%p:%@>.", buf, 0x20u);
    }
    [(_UISceneKeyboardProxyLayerForwardingHostingEnvironment *)self->_hostingEnvironment removeObserver:self];
    objc_storeStrong((id *)&self->_hostingEnvironment, v7);
    [(_UISceneKeyboardProxyLayerForwardingHostingEnvironment *)v7 addObserver:self];
    if (v5)
    {
      if (self->_state - 1 <= 1)
      {
        uint64_t v20 = [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _newProxyLayers];
        [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _addLayers:v20 toEnvironment:v7];
        [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _removeLayers:v20 fromEnvironment:v6];
        keyboardLayersAddedToHostingEnvironment = self->_keyboardLayersAddedToHostingEnvironment;
        self->_keyboardLayersAddedToHostingEnvironment = v20;

        [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _setState:2];
      }
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  if (!v5)
  {
LABEL_23:
    if (self->_state == 2)
    {
      [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _removeLayers:self->_keyboardLayersAddedToHostingEnvironment fromEnvironment:v6];
      __int16 v25 = self->_keyboardLayersAddedToHostingEnvironment;
      self->_keyboardLayersAddedToHostingEnvironment = 0;

      [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _setState:1];
    }
    goto LABEL_25;
  }
  if (BSEqualObjects())
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"_UISceneKeyboardProxyLayerForwardingStateMachine.m" lineNumber:372 description:@"Windows must be different."];
  }
  if (self->_state == 2)
  {
    [*p_hostingWindow windowLevel];
    [(UIWindow *)v5 windowLevel];
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      v22 = [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _newProxyLayers];
      [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _addLayers:v22 toEnvironment:v6];
      int v23 = (void *)[(NSSet *)self->_keyboardLayersAddedToHostingEnvironment mutableCopy];
      [v23 minusSet:v22];
      [(_UISceneKeyboardProxyLayerForwardingStateMachine *)self _removeLayers:v23 fromEnvironment:self->_hostingEnvironment];
      v24 = self->_keyboardLayersAddedToHostingEnvironment;
      self->_keyboardLayersAddedToHostingEnvironment = v22;
    }
  }
LABEL_25:
}

- (void)_setState:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2uLL:
      if (!self->_keyboardLayersTracked)
      {
        __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:self file:@"_UISceneKeyboardProxyLayerForwardingStateMachine.m" lineNumber:406 description:@"Must have a keyboard layer tracked if we're forwarding kb layers."];
      }
      if (!self->_keyboardLayersAddedToHostingEnvironment)
      {
        __int16 v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:a2 object:self file:@"_UISceneKeyboardProxyLayerForwardingStateMachine.m" lineNumber:407 description:@"Must have a keyboard layer added to a host if we're forwarding kb layers."];
      }
      if (!self->_hostingEnvironment)
      {
        int v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = v6;
        __int16 v8 = @"Must have a hosting environment if we're forwarding kb layers.";
        SEL v9 = a2;
        uint64_t v10 = self;
        uint64_t v11 = 408;
        goto LABEL_27;
      }
      break;
    case 1uLL:
      if (!self->_keyboardLayersTracked)
      {
        uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"_UISceneKeyboardProxyLayerForwardingStateMachine.m" lineNumber:401 description:@"Must have a keyboard layer tracked if we're eligible for forwarding."];
      }
      if (self->_keyboardLayersAddedToHostingEnvironment)
      {
        int v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = v6;
        __int16 v8 = @"Cannot have a keyboard layer added to a host if we're eligible for forwarding.";
        SEL v9 = a2;
        uint64_t v10 = self;
        uint64_t v11 = 402;
        goto LABEL_27;
      }
      break;
    case 0uLL:
      if (self->_keyboardLayersTracked)
      {
        int v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2 object:self file:@"_UISceneKeyboardProxyLayerForwardingStateMachine.m" lineNumber:396 description:@"Cannot have a keyboard layer tracked if we're not eligible for forwarding."];
      }
      if (self->_keyboardLayersAddedToHostingEnvironment)
      {
        int v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = v6;
        __int16 v8 = @"Cannot have a keyboard layer added to a host if we're not eligible for forwarding.";
        SEL v9 = a2;
        uint64_t v10 = self;
        uint64_t v11 = 397;
LABEL_27:
        [v6 handleFailureInMethod:v9 object:v10 file:@"_UISceneKeyboardProxyLayerForwardingStateMachine.m" lineNumber:v11 description:v8];
      }
      break;
  }
  id v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &_setState____s_category) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_state;
    if (state > 2) {
      int v14 = @"(unknown)";
    }
    else {
      int v14 = off_1E52EB280[state];
    }
    if (a3 > 2) {
      v15 = @"(unknown)";
    }
    else {
      v15 = off_1E52EB280[a3];
    }
    int v21 = 134218498;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    id v26 = v15;
    __int16 v16 = v12;
  }
  self->_unint64_t state = a3;
}

- (void)_addLayers:(id)a3 toEnvironment:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &_addLayers_toEnvironment____s_category) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    SEL v9 = v8;
    uint64_t v10 = [v7 description];
    int v11 = 134218754;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2048;
    id v16 = v7;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Add layers %@ to environment: <%p: %@>.", (uint8_t *)&v11, 0x2Au);
  }
  [v7 addLayers:v6];
}

- (void)_removeLayers:(id)a3 fromEnvironment:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &_removeLayers_fromEnvironment____s_category) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    SEL v9 = v8;
    uint64_t v10 = [v7 description];
    int v11 = 134218754;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2048;
    id v16 = v7;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Remove layers %@ from environment: <%p: %@>.", (uint8_t *)&v11, 0x2Au);
  }
  [v7 removeLayers:v6];
}

- (id)_newProxyLayers
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!self->_hostingWindow)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"_UISceneKeyboardProxyLayerForwardingStateMachine.m" lineNumber:427 description:@"Must have a hosting window to fetch new proxy layers."];
  }
  if (![(NSSet *)self->_keyboardLayersTracked count])
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:v22 object:self file:@"_UISceneKeyboardProxyLayerForwardingStateMachine.m" lineNumber:428 description:@"Must have a keyboard layer tracked."];
  }
  [(UIWindow *)self->_hostingWindow windowLevel];
  double v4 = v3 + 1.0;
  id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &_newProxyLayers___s_category) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v29 = self;
    __int16 v30 = 2048;
    double v31 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "<StateMachine:%p> Current level is %f", buf, 0x16u);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = (void *)[(NSSet *)self->_keyboardLayersTracked copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v12 isKeyboardLayer])
        {
          id v13 = objc_alloc(MEMORY[0x1E4F62988]);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationEnvironment);
          __int16 v15 = [WeakRetained keyboardOwnerIdentityToken];
          id v16 = (void *)[v13 initWithLevel:v15 keyboardOwner:v4];
          [v6 addObject:v16];

LABEL_16:
          goto LABEL_18;
        }
        if ([v12 isKeyboardProxyLayer])
        {
          id v17 = objc_alloc(MEMORY[0x1E4F62988]);
          id WeakRetained = [v12 keyboardOwner];
          __int16 v15 = (void *)[v17 initWithLevel:WeakRetained keyboardOwner:v4];
          [v6 addObject:v15];
          goto LABEL_16;
        }
        id WeakRetained = [MEMORY[0x1E4F28B00] currentHandler];
        [WeakRetained handleFailureInMethod:v22 object:self file:@"_UISceneKeyboardProxyLayerForwardingStateMachine.m" lineNumber:440 description:@"Layers other than a keyboard should not be in this data structure."];
LABEL_18:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardLayersAddedToHostingEnvironment, 0);
  objc_storeStrong((id *)&self->_keyboardLayersTracked, 0);
  objc_storeStrong((id *)&self->_hostingWindow, 0);
  objc_storeStrong(&self->_windowDidMoveToSceneNotificationToken, 0);
  objc_storeStrong((id *)&self->_hostingEnvironment, 0);
  objc_destroyWeak((id *)&self->_presentationEnvironment);
}

@end