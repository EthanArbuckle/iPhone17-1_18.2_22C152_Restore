@interface _UIContextMenuSceneComponent
+ (id)sceneComponentForView:(id)a3;
- (NSMutableSet)activePresentations;
- (UIScene)_scene;
- (_UIContextMenuSceneComponent)initWithScene:(id)a3;
- (void)_setScene:(id)a3;
- (void)dismissActiveMenus;
- (void)registerPresentation:(id)a3;
- (void)removePresentation:(id)a3;
- (void)setActivePresentations:(id)a3;
@end

@implementation _UIContextMenuSceneComponent

- (_UIContextMenuSceneComponent)initWithScene:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"_UIContextMenuSceneComponent.m", 37, @"Only UIWindowScene is supported by %@.", v13 object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuSceneComponent;
  v6 = [(_UIContextMenuSceneComponent *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_scene, v5);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    activePresentations = v7->_activePresentations;
    v7->_activePresentations = (NSMutableSet *)v8;
  }
  return v7;
}

- (void)registerPresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuSceneComponent *)self activePresentations];
  [v5 addObject:v4];
}

- (void)removePresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuSceneComponent *)self activePresentations];
  [v5 removeObject:v4];
}

- (void)dismissActiveMenus
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(_UIContextMenuSceneComponent *)self activePresentations];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) requestMenuDismissal];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (id)sceneComponentForView:(id)a3
{
  uint64_t v3 = [a3 _window];
  uint64_t v4 = [v3 windowScene];
  uint64_t v5 = [v4 _contextMenuSceneComponent];

  return v5;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (NSMutableSet)activePresentations
{
  return self->_activePresentations;
}

- (void)setActivePresentations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePresentations, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end