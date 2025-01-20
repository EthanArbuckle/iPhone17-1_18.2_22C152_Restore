@interface _UISceneHostingEventDeferringHostComponent
- (BOOL)clientIsEligibleForEventDeferring;
- (BOOL)maintainHostFirstResponderWhenClientWantsKeyboard;
- (id)scene:(id)a3 handleActions:(id)a4;
- (void)_scene:(id)a3 isMovingToParent:(id)a4;
- (void)beginObservingNotifications;
- (void)configureEventDeferringRulesWithParentScene:(id)a3;
- (void)configurePendingEventDeferringIfNecessary;
- (void)firstResponderDidChange:(id)a3;
- (void)handleEventDeferringRequestFromClient;
- (void)invalidate;
- (void)scene:(id)a3 clientDidConnect:(id)a4;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
- (void)setMaintainHostFirstResponderWhenClientWantsKeyboard:(BOOL)a3;
- (void)setScene:(id)a3;
- (void)severEventDeferringRules;
- (void)stopObservingNotifications;
- (void)tearDownEventDeferringRulesIfNecessaryWithReason:(id)a3;
@end

@implementation _UISceneHostingEventDeferringHostComponent

- (void)setScene:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UISceneHostingEventDeferringHostComponent;
  [(FBSSceneComponent *)&v4 setScene:a3];
  [(_UISceneHostingEventDeferringHostComponent *)self beginObservingNotifications];
}

- (void)setMaintainHostFirstResponderWhenClientWantsKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  v6 = [(FBSSceneComponent *)self hostScene];
  v7 = [v6 identityToken];
  v8 = [v7 stringRepresentation];
  if (v3) {
    [v5 addIgnoredSceneIdentityTokenString:v8];
  }
  else {
    [v5 removeIgnoredSceneIdentityTokenString:v8];
  }

  v9 = [(FBSSceneComponent *)self hostScene];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99___UISceneHostingEventDeferringHostComponent_setMaintainHostFirstResponderWhenClientWantsKeyboard___block_invoke;
  v10[3] = &__block_descriptor_33_e72_v16__0__FBSMutableSceneSettings__UISceneHostingEventDeferringSettings__8l;
  BOOL v11 = v3;
  [v9 updateSettingsWithBlock:v10];
}

- (BOOL)maintainHostFirstResponderWhenClientWantsKeyboard
{
  v2 = [(FBSSceneComponent *)self hostScene];
  BOOL v3 = [v2 settings];
  char v4 = [v3 maintainHostFirstResponderWhenClientWantsKeyboard];

  return v4;
}

- (void)configureEventDeferringRulesWithParentScene:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDeferringParentScene);
  if (WeakRetained == v5)
  {
  }
  else
  {
    v7 = WeakRetained;
    BOOL v8 = [(_UISceneHostingEventDeferringHostComponent *)self clientIsEligibleForEventDeferring];

    if (v8)
    {
      [(_UISceneHostingEventDeferringHostComponent *)self tearDownEventDeferringRulesIfNecessaryWithReason:@"scene hosting view is moving to a new scene"];
      if (!v5)
      {
        v28 = [MEMORY[0x1E4F28B00] currentHandler];
        [v28 handleFailureInMethod:a2 object:self file:@"_UISceneHostingEventDeferringHostComponent.m" lineNumber:90 description:@"A valid parent scene is required to configure event deferring"];
      }
      if (![(_UISceneHostingEventDeferringHostComponent *)self maintainHostFirstResponderWhenClientWantsKeyboard])
      {
        v9 = [(FBSSceneComponent *)self hostScene];
        v10 = [v9 _uiHostingController];
        BOOL v11 = [v10 sceneView];

        [v11 becomeFirstResponder];
      }
      id v12 = objc_alloc_init(MEMORY[0x1E4F4F368]);
      v13 = [(FBSSceneComponent *)self hostScene];
      v37 = [v13 clientHandle];
      v14 = [v37 processHandle];
      uint64_t v15 = [v14 pid];

      [v12 setPid:v15];
      v38 = v13;
      v16 = [v13 identityToken];
      uint64_t v17 = [v16 stringRepresentation];

      v36 = (void *)v17;
      v35 = [MEMORY[0x1E4F4F290] tokenForString:v17];
      objc_msgSend(v12, "setToken:");
      v18 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
      v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v18];
      v20 = [NSString stringWithFormat:@"%@: %p: begin deferring to hosted scene in %@", objc_opt_class(), self, v18];
      v21 = [(FBSSceneComponent *)self hostScene];
      v22 = [v21 _uiHostingController];
      v23 = [v22 sceneViewController];

      v24 = [v5 _eventDeferringManager];
      -[_UIEventDeferringManager beginRemoteEventDeferringInEnvironments:forOwningInterfaceElement:toTarget:withReason:](v24, v19, v23, v12, v20);
      v25 = (_UIEventDeferringOwnershipToken *)objc_claimAutoreleasedReturnValue();
      eventDeferringOwnershipToken = self->_eventDeferringOwnershipToken;
      self->_eventDeferringOwnershipToken = v25;

      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UISceneHosting", &configureEventDeferringRulesWithParentScene____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v29 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          log = v29;
          v30 = objc_opt_class();
          v31 = self->_eventDeferringOwnershipToken;
          id v33 = v30;
          v32 = [(_UIEventDeferringOwnershipToken *)v31 description];
          *(_DWORD *)buf = 138412802;
          v40 = v30;
          __int16 v41 = 2048;
          v42 = self;
          __int16 v43 = 2112;
          v44 = v32;
          _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "<%@: %p> Deferring events with token %@", buf, 0x20u);
        }
      }
      objc_storeWeak((id *)&self->_eventDeferringParentScene, v5);
    }
  }
}

- (void)tearDownEventDeferringRulesIfNecessaryWithReason:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  eventDeferringOwnershipToken = self->_eventDeferringOwnershipToken;
  if (eventDeferringOwnershipToken)
  {
    endDeferringBlock = (void (**)(id, _UIEventDeferringOwnershipToken *, id))eventDeferringOwnershipToken->_endDeferringBlock;
    if (endDeferringBlock)
    {
      endDeferringBlock[2](endDeferringBlock, eventDeferringOwnershipToken, a3);
      id v6 = eventDeferringOwnershipToken->_endDeferringBlock;
      eventDeferringOwnershipToken->_endDeferringBlock = 0;
    }
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UISceneHosting", &tearDownEventDeferringRulesIfNecessaryWithReason____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v9 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = v9;
        BOOL v11 = objc_opt_class();
        id v12 = self->_eventDeferringOwnershipToken;
        id v13 = v11;
        v14 = [(_UIEventDeferringOwnershipToken *)v12 description];
        int v15 = 138412802;
        v16 = v11;
        __int16 v17 = 2048;
        v18 = self;
        __int16 v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "<%@: %p> Stopped deferring events with token %@", (uint8_t *)&v15, 0x20u);
      }
    }
    BOOL v8 = self->_eventDeferringOwnershipToken;
    self->_eventDeferringOwnershipToken = 0;

    objc_storeWeak((id *)&self->_eventDeferringParentScene, 0);
  }
}

- (BOOL)clientIsEligibleForEventDeferring
{
  v2 = [(FBSSceneComponent *)self hostScene];
  BOOL v3 = [v2 clientHandle];
  LOBYTE(v4) = 0;
  if ([v2 isActive] && v3)
  {
    id v5 = [v3 identity];
    int v4 = [v5 isLocal] ^ 1;
  }
  return v4;
}

- (void)configurePendingEventDeferringIfNecessary
{
  if (!self->_eventDeferringOwnershipToken)
  {
    p_parentScenePendingEventDeferringRules = &self->_parentScenePendingEventDeferringRules;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentScenePendingEventDeferringRules);

    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)p_parentScenePendingEventDeferringRules);
      [(_UISceneHostingEventDeferringHostComponent *)self configureEventDeferringRulesWithParentScene:v5];

      objc_storeWeak((id *)p_parentScenePendingEventDeferringRules, 0);
    }
    else
    {
      *(unsigned char *)&self->_flags |= 1u;
    }
  }
}

- (void)handleEventDeferringRequestFromClient
{
  BOOL v3 = [(FBSSceneComponent *)self hostScene];
  int v4 = [v3 _keyboardHostComponent];
  int v5 = [v4 suppressKeyboardFocusRequests];

  if (v5)
  {
    [(_UISceneHostingEventDeferringHostComponent *)self severEventDeferringRules];
  }
  else
  {
    [(_UISceneHostingEventDeferringHostComponent *)self configurePendingEventDeferringIfNecessary];
    id v6 = [(FBSSceneComponent *)self hostScene];
    v7 = [v6 _uiHostingController];
    BOOL v8 = [v7 sceneView];
    id v11 = [v8 _window];

    if (v11)
    {
      uint64_t v9 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
      v10 = (void *)v9;
      if (v9) {
        -[_UIRemoteKeyboards performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:servicePID:](v9, v11, 0);
      }
    }
  }
}

- (void)severEventDeferringRules
{
  if (self->_eventDeferringOwnershipToken)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDeferringParentScene);
    objc_storeWeak((id *)&self->_parentScenePendingEventDeferringRules, WeakRetained);

    [(_UISceneHostingEventDeferringHostComponent *)self tearDownEventDeferringRulesIfNecessaryWithReason:@"host requested severance"];
  }
}

- (void)beginObservingNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_firstResponderDidChange_ name:@"UIWindowFirstResponderDidChangeNotification" object:0];
}

- (void)stopObservingNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIWindowFirstResponderDidChangeNotification" object:0];
}

- (void)firstResponderDidChange:(id)a3
{
  id v10 = [a3 object];
  int v4 = [v10 _windowHostingScene];
  int v5 = [v10 firstResponder];

  id v6 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  int v7 = [v6 handlingRemoteEvent];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDeferringParentScene);
    int v9 = BSEqualObjects();

    if (((v9 ^ 1 | v7) & 1) == 0) {
      [(_UISceneHostingEventDeferringHostComponent *)self severEventDeferringRules];
    }
  }
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "UIActionType", (void)v15) == 58)
        {
          [v6 addObject:v12];
          [(_UISceneHostingEventDeferringHostComponent *)self handleEventDeferringRequestFromClient];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = (void *)[v6 copy];
  return v13;
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  if (*(unsigned char *)&self->_flags)
  {
    [(_UISceneHostingEventDeferringHostComponent *)self configurePendingEventDeferringIfNecessary];
    *(unsigned char *)&self->_flags &= ~1u;
  }
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  if (self->_eventDeferringOwnershipToken)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDeferringParentScene);
    objc_storeWeak((id *)&self->_parentScenePendingEventDeferringRules, WeakRetained);

    [(_UISceneHostingEventDeferringHostComponent *)self tearDownEventDeferringRulesIfNecessaryWithReason:@"scene is deactivating"];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void)invalidate
{
  if ([(_UISceneHostingEventDeferringHostComponent *)self maintainHostFirstResponderWhenClientWantsKeyboard])
  {
    id v3 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    int v4 = [(FBSSceneComponent *)self hostScene];
    id v5 = [v4 identityToken];
    id v6 = [v5 stringRepresentation];
    [v3 removeIgnoredSceneIdentityTokenString:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)_UISceneHostingEventDeferringHostComponent;
  [(FBSSceneComponent *)&v7 invalidate];
  [(_UISceneHostingEventDeferringHostComponent *)self stopObservingNotifications];
}

- (void)_scene:(id)a3 isMovingToParent:(id)a4
{
  id v5 = objc_msgSend(a4, "_windowHostingScene", a3);
  id v7 = v5;
  if (v5)
  {
    if (self->_eventDeferringOwnershipToken || (*(unsigned char *)&self->_flags & 1) != 0)
    {
      [(_UISceneHostingEventDeferringHostComponent *)self configureEventDeferringRulesWithParentScene:v5];
      id v6 = v7;
      *(unsigned char *)&self->_flags &= ~1u;
      goto LABEL_8;
    }
    objc_storeWeak((id *)&self->_parentScenePendingEventDeferringRules, v5);
  }
  else
  {
    [(_UISceneHostingEventDeferringHostComponent *)self tearDownEventDeferringRulesIfNecessaryWithReason:@"scene hosting view was removed from the hierarchy"];
  }
  id v6 = v7;
LABEL_8:
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentScenePendingEventDeferringRules);
  objc_destroyWeak((id *)&self->_eventDeferringParentScene);
  objc_storeStrong((id *)&self->_eventDeferringOwnershipToken, 0);
}

@end