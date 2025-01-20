@interface _UISceneKeyboardProxyLayerForwardingHostingScene
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initWithScene:(id *)a1;
- (void)addLayers:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeLayers:(id)a3;
- (void)removeObserver:(id)a3;
- (void)sceneWillInvalidate:(id)a3;
@end

@implementation _UISceneKeyboardProxyLayerForwardingHostingScene

- (id)initWithScene:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_UISceneKeyboardProxyLayerForwardingHostingScene;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 2, a2);
      [a1[2] addObserver:a1];
    }
  }

  return a1;
}

- (void)addLayers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(a3, "copy", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (self) {
          scene = self->_scene;
        }
        else {
          scene = 0;
        }
        [(FBSScene *)scene attachLayer:*(void *)(*((void *)&v11 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v10 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v6 = v10;
    }
    while (v10);
  }
}

- (void)removeLayers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(a3, "copy", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (self) {
          scene = self->_scene;
        }
        else {
          scene = 0;
        }
        [(FBSScene *)scene detachLayer:*(void *)(*((void *)&v11 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v10 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v6 = v10;
    }
    while (v10);
  }
}

- (void)addObserver:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UISceneKeyboardProxyLayerForwardingHostingScene.m", 47, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
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

- (void)sceneWillInvalidate:(id)a3
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
          [v9 hostingEnvironmentDidInvalidate:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (self) {
      scene = self->_scene;
    }
    else {
      scene = 0;
    }
    uint64_t v7 = scene;
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
  v3 = [(FBSScene *)self->_scene identifier];
  id v4 = [v2 stringWithFormat:@"FBSScene:%@", v3];

  return (NSString *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end