@interface _UISceneKeyboardProxyLayerForwardingPresentationScene
+ (BOOL)forwardsLayersToRootSystemShell;
- (FBSSceneIdentityToken)keyboardOwnerIdentityToken;
- (NSString)description;
- (id)keyboardLayers;
- (void)_presentationManager:(id)a3 willPrioritizePresenter:(id)a4;
- (void)_sendDelegateDidMoveToWindow:(id)a3;
- (void)_updateKeyboardLayersForScene:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)initWithScene:(void *)a1;
- (void)presentationView:(id)a3 didMoveToWindow:(id)a4;
- (void)removeObserver:(id)a3;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidInvalidate:(id)a3;
@end

@implementation _UISceneKeyboardProxyLayerForwardingPresentationScene

- (void)_updateKeyboardLayersForScene:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 presentationEnvironmentDidUpdateKeyboardLayers:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  layersChangedClientSettingsDiffInspector = self->_layersChangedClientSettingsDiffInspector;
  if (!layersChangedClientSettingsDiffInspector)
  {
    uint64_t v15 = (FBSSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F62A40]);
    v16 = self->_layersChangedClientSettingsDiffInspector;
    self->_layersChangedClientSettingsDiffInspector = v15;

    objc_initWeak(&location, self);
    v17 = self->_layersChangedClientSettingsDiffInspector;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __131___UISceneKeyboardProxyLayerForwardingPresentationScene_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
    v21 = &unk_1E52E06E0;
    objc_copyWeak(&v22, &location);
    [(FBSSceneClientSettingsDiffInspector *)v17 observeLayersWithBlock:&v18];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    layersChangedClientSettingsDiffInspector = self->_layersChangedClientSettingsDiffInspector;
  }
  -[FBSSceneClientSettingsDiffInspector inspectDiff:withContext:](layersChangedClientSettingsDiffInspector, "inspectDiff:withContext:", v11, v10, v18, v19, v20, v21);
}

- (void)initWithScene:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)_UISceneKeyboardProxyLayerForwardingPresentationScene;
    id v4 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 5, v3);
      uint64_t v5 = [v3 identityToken];
      uint64_t v6 = (void *)a1[4];
      a1[4] = v5;

      [v3 addObserver:a1];
    }
  }

  return a1;
}

- (void)_presentationManager:(id)a3 willPrioritizePresenter:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (_UIScenePresenter *)a4;
  prioritizedPresenter = self->_prioritizedPresenter;
  if (prioritizedPresenter != v6)
  {
    objc_super v8 = [(_UIScenePresenter *)prioritizedPresenter presentationView];
    [v8 removeObserver:self];

    objc_storeStrong((id *)&self->_prioritizedPresenter, a4);
    v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &_presentationManager_willPrioritizePresenter____s_category)+ 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      id v13 = self;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "<ForwardingPresentationScene:%p> Prioritized presenter: %@.", (uint8_t *)&v12, 0x16u);
    }
    id v10 = [(_UIScenePresenter *)self->_prioritizedPresenter presentationView];
    [v10 addObserver:self];
    id v11 = [v10 window];
    [(_UISceneKeyboardProxyLayerForwardingPresentationScene *)self _sendDelegateDidMoveToWindow:v11];
  }
}

- (void)presentationView:(id)a3 didMoveToWindow:(id)a4
{
  id v11 = a4;
  prioritizedPresenter = self->_prioritizedPresenter;
  id v8 = a3;
  id v9 = [(_UIScenePresenter *)prioritizedPresenter presentationView];

  if (v9 != v8)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UISceneKeyboardProxyLayerForwardingPresentationScene.m" lineNumber:123 description:@"Presentation view mismatch."];
  }
  [(_UISceneKeyboardProxyLayerForwardingPresentationScene *)self _sendDelegateDidMoveToWindow:v11];
}

- (void)_sendDelegateDidMoveToWindow:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 presentationEnvironment:self didMoveToWindow:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

+ (BOOL)forwardsLayersToRootSystemShell
{
  return 0;
}

- (id)keyboardLayers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  id v3 = objc_msgSend(WeakRetained, "clientSettings", 0);
  id v4 = [v3 layers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v10 isKeyboardLayer] & 1) != 0 || objc_msgSend(v10, "isKeyboardProxyLayer"))
        {
          if (!v7)
          {
            uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
          }
          [v7 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  long long v11 = (void *)[v7 copy];
  return v11;
}

- (void)addObserver:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UISceneKeyboardProxyLayerForwardingPresentationScene.m", 75, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v9];
}

- (void)removeObserver:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  id v4 = v7;
  if (v7)
  {
    [(NSHashTable *)self->_observers removeObject:v7];
    NSUInteger v5 = [(NSHashTable *)self->_observers count];
    id v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      id v4 = v7;
    }
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a3 removeObserver:self];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 presentationEnvironmentDidInvalidate:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> Tracking scene: %@", v4, self, WeakRetained];

  return (NSString *)v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  [WeakRetained removeObserver:self];

  uint64_t v4 = [(_UIScenePresenter *)self->_prioritizedPresenter presentationView];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)_UISceneKeyboardProxyLayerForwardingPresentationScene;
  [(_UISceneKeyboardProxyLayerForwardingPresentationScene *)&v5 dealloc];
}

- (FBSSceneIdentityToken)keyboardOwnerIdentityToken
{
  return self->_keyboardOwnerIdentityToken;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_keyboardOwnerIdentityToken, 0);
  objc_storeStrong((id *)&self->_prioritizedPresenter, 0);
  objc_storeStrong((id *)&self->_layersChangedClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end