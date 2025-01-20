@interface _UISceneKeyboardProxyLayerForwardingPresentationViewService
+ (BOOL)forwardsLayersToRootSystemShell;
- (FBSSceneIdentityToken)keyboardOwnerIdentityToken;
- (NSString)description;
- (id)initWithRemoteViewController:(id *)a1;
- (id)keyboardLayers;
- (void)addObserver:(id)a3;
- (void)invalidate;
- (void)keyboardLayersDidChange;
- (void)removeObserver:(id)a3;
- (void)sizeTrackingViewDidMoveToWindow:(uint64_t)a1;
@end

@implementation _UISceneKeyboardProxyLayerForwardingPresentationViewService

- (id)initWithRemoteViewController:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_UISceneKeyboardProxyLayerForwardingPresentationViewService;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4) {
      objc_storeWeak(v4 + 2, v3);
    }
  }

  return a1;
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", invalidate___s_category) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      *(_DWORD *)buf = 134218242;
      uint64_t v17 = a1;
      __int16 v18 = 2112;
      id v19 = WeakRetained;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "<ForwardingPresentationViewService:%p> Remote view controller invalidated: %@.", buf, 0x16u);
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = objc_msgSend(*(id *)(a1 + 8), "copy", 0);
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
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 presentationEnvironmentDidInvalidate:a1];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)sizeTrackingViewDidMoveToWindow:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &sizeTrackingViewDidMoveToWindow____s_category)+ 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v17 = a1;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "<ForwardingPresentationViewService:%p> Size tracking view moved to window: %@.", buf, 0x16u);
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = objc_msgSend(*(id *)(a1 + 8), "copy", 0);
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
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 presentationEnvironment:a1 didMoveToWindow:v3];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)keyboardLayersDidChange
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("KBProxyForwarding", &keyboardLayersDidChange___s_category) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      *(_DWORD *)buf = 134218242;
      uint64_t v17 = a1;
      __int16 v18 = 2112;
      id v19 = WeakRetained;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "<ForwardingPresentationViewService:%p> Remote view controller keyboard layers changed: %@.", buf, 0x16u);
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = objc_msgSend(*(id *)(a1 + 8), "copy", 0);
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
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 presentationEnvironmentDidUpdateKeyboardLayers:a1];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (FBSSceneIdentityToken)keyboardOwnerIdentityToken
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UISceneKeyboardProxyLayerForwardingPresentationViewService.m" lineNumber:57 description:@"View services should never create keyboard proxy layers - they should only forward them"];

  return 0;
}

- (id)keyboardLayers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  id v3 = [WeakRetained _keyboardSceneLayers];

  return v3;
}

+ (BOOL)forwardsLayersToRootSystemShell
{
  return 1;
}

- (void)addObserver:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UISceneKeyboardProxyLayerForwardingPresentationViewService.m", 76, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
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
  v4 = v7;
  if (v7)
  {
    [(NSHashTable *)self->_observers removeObject:v7];
    NSUInteger v5 = [(NSHashTable *)self->_observers count];
    v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      v4 = v7;
    }
  }
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> Tracking remote view controller: %@", v4, self, WeakRetained];

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteViewController);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end