@interface _UISceneKeyboardProxyLayerForwardingHostingViewService
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_keyboardOwnerIdentityTokensForLayers:(id)a3;
- (id)initWithViewServiceOperator:(id *)a1;
- (void)addLayers:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeLayers:(id)a3;
- (void)removeObserver:(id)a3;
- (void)viewServiceWillInvalidate:(id)a3;
@end

@implementation _UISceneKeyboardProxyLayerForwardingHostingViewService

- (id)initWithViewServiceOperator:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_UISceneKeyboardProxyLayerForwardingHostingViewService;
    v4 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 2, v3);
      v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:a1 selector:sel_viewServiceWillInvalidate_ name:@"_UIViewServiceSessionDidInvalidateNotification" object:0];
    }
  }

  return a1;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIViewServiceSessionDidInvalidateNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UISceneKeyboardProxyLayerForwardingHostingViewService;
  [(_UISceneKeyboardProxyLayerForwardingHostingViewService *)&v4 dealloc];
}

- (void)addLayers:(id)a3
{
  p_viewControllerOperator = &self->_viewControllerOperator;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewControllerOperator);
  v6 = [(_UISceneKeyboardProxyLayerForwardingHostingViewService *)self _keyboardOwnerIdentityTokensForLayers:v5];

  [WeakRetained _addSceneForwardingLayersForOwners:v6];
}

- (void)removeLayers:(id)a3
{
  p_viewControllerOperator = &self->_viewControllerOperator;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewControllerOperator);
  v6 = [(_UISceneKeyboardProxyLayerForwardingHostingViewService *)self _keyboardOwnerIdentityTokensForLayers:v5];

  [WeakRetained _removeSceneForwardingLayersForOwners:v6];
}

- (void)addObserver:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UISceneKeyboardProxyLayerForwardingHostingViewService.m", 45, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    objc_super v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v9];
}

- (void)removeObserver:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  objc_super v4 = v7;
  if (v7)
  {
    [(NSHashTable *)self->_observers removeObject:v7];
    NSUInteger v5 = [(NSHashTable *)self->_observers count];
    objc_super v4 = v7;
    if (!v5)
    {
      observers = self->_observers;
      self->_observers = 0;

      objc_super v4 = v7;
    }
  }
}

- (void)viewServiceWillInvalidate:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [a3 object];
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
  v8 = v7;

  if (v8) {
    id v9 = (void *)v8[7];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerOperator);
  v12 = [WeakRetained _sessionIdentifier];
  id v13 = v10;
  id v14 = v12;
  if (v13 == v14)
  {
  }
  else
  {
    v15 = v14;
    if (!v13 || !v14)
    {

      goto LABEL_25;
    }
    char v16 = [v13 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_25;
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v17 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v22 hostingEnvironmentDidInvalidate:self];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v19);
  }

LABEL_25:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (id *)v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerOperator);
    if (v5) {
      id v7 = objc_loadWeakRetained(v5 + 2);
    }
    else {
      id v7 = 0;
    }
    char v8 = BSEqualObjects();
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  v2 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerOperator);
  id v4 = objc_msgSend(v2, "stringWithFormat:", @"_UIViewServiceViewControllerOperator:%p", WeakRetained);

  return (NSString *)v4;
}

- (id)_keyboardOwnerIdentityTokensForLayers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = (void *)[v5 copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [MEMORY[0x1E4F28B00] currentHandler];
          id v19 = v5;
          id v14 = self;
          char v16 = v15 = a2;
          [v16 handleFailureInMethod:v15, v14, @"_UISceneKeyboardProxyLayerForwardingHostingViewService.m", 97, @"%@ is not a FBSKeyboardProxyLayer", v12 object file lineNumber description];

          a2 = v15;
          self = v14;
          id v5 = v19;
        }
        id v13 = [v12 keyboardOwner];
        [v6 addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  v17 = (void *)[v6 copy];
  return v17;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerOperator);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end