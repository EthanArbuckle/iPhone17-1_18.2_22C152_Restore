@interface _UISceneDisplayLink
+ (id)sceneDisplayLinkForWindowScene:(id)a3;
- (UIScene)_scene;
- (_UISceneDisplayLink)initWithScene:(id)a3;
- (void)_displayLinkTick:(id)a3;
- (void)_setScene:(id)a3;
- (void)_updateStatus;
- (void)registerTarget:(id)a3 action:(SEL)a4;
- (void)unregisterTarget:(id)a3 action:(SEL)a4;
@end

@implementation _UISceneDisplayLink

+ (id)sceneDisplayLinkForWindowScene:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 _sceneComponentForKey:@"_UISceneDisplayLinkKey"];
    if (!v6)
    {
      v6 = (void *)[objc_alloc((Class)a1) initWithScene:v5];
      [v5 _registerSceneComponent:v6 forKey:@"_UISceneDisplayLinkKey"];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_UISceneDisplayLink)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISceneDisplayLink;
  v5 = [(_UISceneDisplayLink *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v6;
}

- (void)registerTarget:(id)a3 action:(SEL)a4
{
  id v10 = a3;
  targetsAndActions = self->_targetsAndActions;
  if (!targetsAndActions)
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    objc_super v8 = self->_targetsAndActions;
    self->_targetsAndActions = v7;

    targetsAndActions = self->_targetsAndActions;
  }
  v9 = [[_UISceneDisplayLinkTargetAndAction alloc] initWithTarget:v10 action:a4];
  [(NSMutableArray *)targetsAndActions addObject:v9];

  [(_UISceneDisplayLink *)self _updateStatus];
}

- (void)unregisterTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  targetsAndActions = self->_targetsAndActions;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47___UISceneDisplayLink_unregisterTarget_action___block_invoke;
  v14[3] = &unk_1E52EC8C0;
  id v8 = v6;
  v16 = &v18;
  SEL v17 = a4;
  id v15 = v8;
  [(NSMutableArray *)targetsAndActions enumerateObjectsWithOptions:2 usingBlock:v14];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v10 = v19[3];
  if (has_internal_diagnostics)
  {
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "unregisterTarget: called with unregistered target/action", v13, 2u);
      }
    }
  }
  else if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &unregisterTarget_action____s_category) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "unregisterTarget: called with unregistered target/action", v13, 2u);
    }
  }
  if (v19[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_targetsAndActions, "removeObjectAtIndex:");
    [(_UISceneDisplayLink *)self _updateStatus];
  }

  _Block_object_dispose(&v18, 8);
}

- (void)_updateStatus
{
  p_scene = &self->_scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if (![WeakRetained activationState])
  {
    uint64_t v7 = [(NSMutableArray *)self->_targetsAndActions count];

    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  id v5 = objc_loadWeakRetained((id *)p_scene);
  if ([v5 activationState] != 1)
  {

    goto LABEL_10;
  }
  uint64_t v6 = [(NSMutableArray *)self->_targetsAndActions count];

  if (v6)
  {
LABEL_6:
    p_displayLink = &self->_displayLink;
    if (self->_displayLink) {
      return;
    }
    id v9 = objc_loadWeakRetained((id *)p_scene);
    uint64_t v10 = [v9 screen];
    id obj = [v10 displayLinkWithTarget:self selector:sel__displayLinkTick_];

    if (obj)
    {
      v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [obj addToRunLoop:v11 forMode:*MEMORY[0x1E4F1C4B0]];

      objc_storeStrong((id *)p_displayLink, obj);
    }
    else
    {
      id obj = 0;
    }
    goto LABEL_16;
  }
LABEL_10:
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    v13 = self->_displayLink;
    self->_displayLink = 0;
  }
  if (![(NSMutableArray *)self->_targetsAndActions count])
  {
    id obj = objc_loadWeakRetained((id *)p_scene);
    [obj _unregisterSceneComponentForKey:@"_UISceneDisplayLinkKey"];
LABEL_16:
  }
}

- (void)_displayLinkTick:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  uint64_t v6 = _UIMachTimeForMediaTime(v5);
  [v4 targetTimestamp];
  uint64_t v8 = _UIMachTimeForMediaTime(v7);
  _UIQOSProcessingBegin("UISceneDisplayLink", 0, v6, v8);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__76;
  v23 = __Block_byref_object_dispose__76;
  id v24 = 0;
  targetsAndActions = self->_targetsAndActions;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40___UISceneDisplayLink__displayLinkTick___block_invoke;
  v16[3] = &unk_1E52EC8E8;
  id v10 = v4;
  id v17 = v10;
  uint64_t v18 = &v19;
  [(NSMutableArray *)targetsAndActions enumerateObjectsUsingBlock:v16];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v12 = v20[5];
  if (has_internal_diagnostics)
  {
    if (v12)
    {
      v13 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "A _UISceneDisplayLink target was deallocated while registered.", v15, 2u);
      }
    }
  }
  else if (v12)
  {
    v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_displayLinkTick____s_category) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "A _UISceneDisplayLink target was deallocated while registered.", v15, 2u);
    }
  }
  if (v20[5])
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_targetsAndActions, "removeObjectsAtIndexes:");
    [(_UISceneDisplayLink *)self _updateStatus];
  }

  _Block_object_dispose(&v19, 8);
  _UIQOSProcessingEnd();
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_targetsAndActions, 0);
}

@end