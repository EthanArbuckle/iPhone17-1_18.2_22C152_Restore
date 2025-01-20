@interface _UISceneFocusMovementBSActionsHandler
- (_UISceneFocusMovementBSActionsHandler)init;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (void)_focusSystemSceneComponentDidPerformInitialSetupNotification:(id)a3;
@end

@implementation _UISceneFocusMovementBSActionsHandler

- (_UISceneFocusMovementBSActionsHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UISceneFocusMovementBSActionsHandler;
  v2 = [(_UISceneFocusMovementBSActionsHandler *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingFocusMovementActions = v2->_pendingFocusMovementActions;
    v2->_pendingFocusMovementActions = (NSMutableDictionary *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__focusSystemSceneComponentDidPerformInitialSetupNotification_ name:@"_UIFocusSystemSceneComponentDidFinishInitialization" object:0];
  }
  return v2;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 objectsPassingTest:&__block_literal_global_319];
  if ([v10 count])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v9 _focusSystemSceneComponent];
      v12 = [v11 focusSystem];

      if (v12)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v13 = v10;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v13);
              }
              objc_msgSend(v12, "_handleFocusMovementAction:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25);
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v15);
        }
      }
      else
      {
        v18 = [v9 _FBSScene];
        v19 = [v18 identityToken];
        v20 = [v19 stringRepresentation];

        pendingFocusMovementActions = self->_pendingFocusMovementActions;
        v22 = [v10 allObjects];
        [(NSMutableDictionary *)pendingFocusMovementActions setObject:v22 forKey:v20];
      }
    }
  }
  v23 = objc_msgSend(v8, "mutableCopy", (void)v25);
  [v23 minusSet:v10];

  return v23;
}

- (void)_focusSystemSceneComponentDidPerformInitialSetupNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 object];
  v6 = [v4 userInfo];
  objc_super v7 = [v6 objectForKey:0x1ED0EAF20];

  if (v5)
  {
    if (v7)
    {
      id v8 = [(NSMutableDictionary *)self->_pendingFocusMovementActions objectForKey:v7];
      uint64_t v9 = [v8 count];

      if (v9)
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        v10 = -[NSMutableDictionary objectForKey:](self->_pendingFocusMovementActions, "objectForKey:", v7, 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [v5 _handleFocusMovementAction:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v12);
        }
      }
    }
  }
  [(NSMutableDictionary *)self->_pendingFocusMovementActions removeObjectForKey:v7];
}

- (void).cxx_destruct
{
}

@end