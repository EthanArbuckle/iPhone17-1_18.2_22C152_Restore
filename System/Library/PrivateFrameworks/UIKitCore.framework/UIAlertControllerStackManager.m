@interface UIAlertControllerStackManager
- (BOOL)_alertControllerShouldBeTrackedInStack:(id)a3;
- (UIAlertControllerStackManager)initWithScene:(id)a3;
- (UIScene)_scene;
- (id)_topAlertControllerInStack;
- (int64_t)_alertControllerStackCount;
- (void)_addAlertControllerToStack:(id)a3;
- (void)_alertControllerDidDisappear:(id)a3;
- (void)_alertControllerWillAppear:(id)a3;
- (void)_alertControllerWillDisappear:(id)a3;
- (void)_didHideAlertController:(id)a3;
- (void)_hideStackedAlertControllers;
- (void)_removeAlertControllerFromStack:(id)a3;
- (void)_setScene:(id)a3;
- (void)_showHiddenStackedAlertControllers;
- (void)_willShowAlertController:(id)a3;
@end

@implementation UIAlertControllerStackManager

- (UIAlertControllerStackManager)initWithScene:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIAlertControllerStackManager;
  v5 = [(UIAlertControllerStackManager *)&v11 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    alertControllerStack = v5->_alertControllerStack;
    v5->_alertControllerStack = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hiddenAlertControllers = v5->_hiddenAlertControllers;
    v5->_hiddenAlertControllers = v8;

    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v5;
}

- (void)_setScene:(id)a3
{
}

- (void)_alertControllerWillAppear:(id)a3
{
  id v4 = a3;
  if ([(UIAlertControllerStackManager *)self _alertControllerShouldBeTrackedInStack:v4])
  {
    [(UIAlertControllerStackManager *)self _willShowAlertController:v4];
    [(UIAlertControllerStackManager *)self _addAlertControllerToStack:v4];
    if (([(id)UIApp _isSpringBoard] & 1) == 0)
    {
      if ([(id)UIApp _isSpringBoardShowingAnAlert])
      {
        v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIAlertControllerStackManager", &_alertControllerWillAppear____s_category)+ 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "_alertControllerWillAppear: Hiding stacked Alerts", v6, 2u);
        }
        [(UIAlertControllerStackManager *)self _hideStackedAlertControllers];
      }
    }
  }
}

- (void)_alertControllerWillDisappear:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(UIAlertControllerStackManager *)self _alertControllerShouldBeTrackedInStack:v4])
  {
    v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIAlertControllerStackManager", &_alertControllerWillDisappear____s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "_alertControllerWillDisappear: will hide alert : %@", (uint8_t *)&v6, 0xCu);
    }
    [(UIAlertControllerStackManager *)self _willHideAlertController:v4];
    [(UIAlertControllerStackManager *)self _removeAlertControllerFromStack:v4];
  }
}

- (void)_alertControllerDidDisappear:(id)a3
{
  id v4 = a3;
  if (-[UIAlertControllerStackManager _alertControllerShouldBeTrackedInStack:](self, "_alertControllerShouldBeTrackedInStack:"))
  {
    [(UIAlertControllerStackManager *)self _didHideAlertController:v4];
  }
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)_hideStackedAlertControllers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_alertControllerStack;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v13;
    *(void *)&long long v5 = 138412290;
    long long v11 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isViewLoaded", v11, (void)v12)
          && ([v9 _isHidden] & 1) == 0)
        {
          [(UIAlertControllerStackManager *)self _willHideAlertController:v9];
          v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIAlertControllerStackManager", &_hideStackedAlertControllers___s_category)+ 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v11;
            v17 = v9;
            _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "_hideStackedAlertControllers: Hiding alert : %@", buf, 0xCu);
          }
          [v9 _setHidden:1];
          [(UIAlertControllerStackManager *)self _didHideAlertController:v9];
          [(NSMutableArray *)self->_hiddenAlertControllers addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)_showHiddenStackedAlertControllers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_hiddenAlertControllers count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v3 = self->_hiddenAlertControllers;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v15;
      *(void *)&long long v5 = 138412290;
      long long v13 = v5;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v3);
          }
          v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          -[UIAlertControllerStackManager _willShowAlertController:](self, "_willShowAlertController:", v9, v13, (void)v14);
          v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIAlertControllerStackManager", &qword_1EB25EF20) + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v20 = v9;
            _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "_showHiddenStackedAlertControllers: Showing Hidden alert : %@", buf, 0xCu);
          }
          [v9 _setHidden:0];
        }
        uint64_t v6 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    [(NSMutableArray *)self->_hiddenAlertControllers removeAllObjects];
  }
  else
  {
    long long v11 = [(UIAlertControllerStackManager *)self _topAlertControllerInStack];
    long long v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIAlertControllerStackManager", &_MergedGlobals_935) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "_showHiddenStackedAlertControllers : Showing top alert : %@", buf, 0xCu);
    }
    [(UIAlertControllerStackManager *)self _willShowAlertController:v11];
  }
}

- (void)_addAlertControllerToStack:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIAlertControllerStackManager", &_addAlertControllerToStack____s_category)+ 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "_addAlertControllerToStack: Adding Alert to stack : %@", (uint8_t *)&v6, 0xCu);
  }
  [(NSMutableArray *)self->_alertControllerStack addObject:v4];
}

- (void)_removeAlertControllerFromStack:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIAlertControllerStackManager", &_removeAlertControllerFromStack____s_category)+ 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "_removeAlertControllerFromStack: Removing Alert from stack : %@", (uint8_t *)&v6, 0xCu);
  }
  [(NSMutableArray *)self->_alertControllerStack removeObject:v4];
}

- (id)_topAlertControllerInStack
{
  return (id)[(NSMutableArray *)self->_alertControllerStack lastObject];
}

- (void)_willShowAlertController:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIAlertControllerStackManager", &_willShowAlertController____s_category)+ 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "_willShowAlertController: %@", (uint8_t *)&v5, 0xCu);
  }
  if (v3) {
    [(id)UIApp willDisplayMiniAlert];
  }
}

- (void)_didHideAlertController:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIAlertControllerStackManager", &_didHideAlertController____s_category)+ 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "_didHideAlertController: %@", (uint8_t *)&v5, 0xCu);
  }
  if (v3) {
    [(id)UIApp didDismissMiniAlert];
  }
}

- (BOOL)_alertControllerShouldBeTrackedInStack:(id)a3
{
  id v3 = a3;
  if ([v3 _resolvedStyle] == 1)
  {
    id v4 = [v3 _window];
    int v5 = [v4 _windowHostingScene];
    if ([v5 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal])
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      uint64_t v7 = [v3 _window];
      int v6 = [v7 _isHostedInAnotherProcess] ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (int64_t)_alertControllerStackCount
{
  return [(NSMutableArray *)self->_alertControllerStack count];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_hiddenAlertControllers, 0);
  objc_storeStrong((id *)&self->_alertControllerStack, 0);
}

@end