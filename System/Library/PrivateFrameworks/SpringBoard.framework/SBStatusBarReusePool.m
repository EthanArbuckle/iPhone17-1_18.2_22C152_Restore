@interface SBStatusBarReusePool
- (NSString)description;
- (SBStatusBarReusePool)initWithWindowScene:(id)a3;
- (SBWindowScene)windowScene;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)getReusableStatusBarWithReason:(id)a3;
- (id)getReusableStatusBarWithReason:(id)a3 withFrame:(CGRect)a4;
- (id)newStatusBarConfigurationHandler;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)_statusBarInstanceLimit;
- (void)_removeStatusBarContainer:(id)a3;
- (void)_resetStatusBar:(id)a3 clearOverrides:(BOOL)a4;
- (void)enumerateStatusBars:(id)a3;
- (void)recycleStatusBar:(id)a3;
- (void)setNewStatusBarConfigurationHandler:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation SBStatusBarReusePool

void __55__SBStatusBarReusePool__resetStatusBar_clearOverrides___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:0];
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v8];
  objc_msgSend(*(id *)(a1 + 32), "sb_setEnabledStatusBarPartIdentifiersForStatusBarParts:", 0xFFFFLL);
  [*(id *)(a1 + 32) setStyleDelegate:SBApp];
  [*(id *)(a1 + 32) _setDisablesRasterization:1];
  if (*(unsigned char *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "sb_setLocalDataOverrides:", 0);
    [*(id *)(a1 + 32) forceUpdateData:0];
  }
  v4 = [*(id *)(a1 + 40) windowScene];
  v5 = [v4 statusBarManager];
  v6 = [v5 assertionManager];
  [*(id *)(a1 + 32) setManager:v6];
  v7 = [*(id *)(a1 + 32) statusBar];
  [v7 setOverlayData:0];
  [v7 setBackgroundColor:0];
  [*(id *)(a1 + 32) setBackgroundColor:0];
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (id)getReusableStatusBarWithReason:(id)a3
{
  p_windowScene = &self->_windowScene;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_windowScene);
  v7 = [WeakRetained statusBarManager];
  [v7 statusBarFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = -[SBStatusBarReusePool getReusableStatusBarWithReason:withFrame:](self, "getReusableStatusBarWithReason:withFrame:", v5, v9, v11, v13, v15);

  return v16;
}

- (id)getReusableStatusBarWithReason:(id)a3 withFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  double v10 = [(NSMutableArray *)self->_recycledStatusBars _sb_dequeue];
  double v11 = SBLogStatusBarish();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    if (v10) {
      v19 = @"cached";
    }
    else {
      v19 = @"uncached";
    }
    uint64_t v20 = [(NSMutableArray *)self->_recycledStatusBars count];
    int v21 = 138412802;
    v22 = v19;
    __int16 v23 = 2048;
    uint64_t v24 = v20;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "SBStatusBarReusePool vending %@ Status Bar (cache size %lu) for reason: %@", (uint8_t *)&v21, 0x20u);
  }

  if (v10)
  {
    objc_getAssociatedObject(v10, "SBStatusBarContainerKey");
    double v12 = (SBStatusBarContainer *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrame:", x, y, width, height);
  }
  else
  {
    SBStatusBarIsSpeakeasy();
    double v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", x, y, width, height);
    double v13 = [v10 statusBar];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    double v15 = [WeakRetained screen];
    [v13 setTargetScreen:v15];

    [(SBStatusBarReusePool *)self _resetStatusBar:v10 clearOverrides:0];
    double v12 = objc_alloc_init(SBStatusBarContainer);
    [(SBStatusBarContainer *)v12 setStatusBar:v10];
    [(SBStatusBarContainer *)v12 setReusePool:self];
    [(NSHashTable *)self->_statusBars addObject:v12];
    objc_setAssociatedObject(v10, "SBStatusBarContainerKey", v12, (void *)0x301);
    v16 = [(SBStatusBarReusePool *)self newStatusBarConfigurationHandler];

    if (v16)
    {
      v17 = [(SBStatusBarReusePool *)self newStatusBarConfigurationHandler];
      ((void (**)(void, void *))v17)[2](v17, v10);
    }
  }
  [(SBStatusBarContainer *)v12 setReason:v9];

  return v10;
}

- (id)newStatusBarConfigurationHandler
{
  return self->_newStatusBarConfigurationHandler;
}

- (void)_resetStatusBar:(id)a3 clearOverrides:(BOOL)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F42FF0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SBStatusBarReusePool__resetStatusBar_clearOverrides___block_invoke;
  v9[3] = &unk_1E6AF5770;
  BOOL v12 = a4;
  id v10 = v6;
  double v11 = self;
  id v8 = v6;
  [v7 _performWithoutRetargetingAnimations:v9];
  [v8 _removeAllAnimations:1];
}

- (SBStatusBarReusePool)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBStatusBarReusePool;
  id v5 = [(SBStatusBarReusePool *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
    statusBars = v5->_statusBars;
    v5->_statusBars = (NSHashTable *)v6;

    id v8 = [[SBStatusBarReusePoolWindow alloc] initWithWindowScene:v4];
    recycledStatusBarsContainerWindow = v5->_recycledStatusBarsContainerWindow;
    v5->_recycledStatusBarsContainerWindow = &v8->super;

    [(UIWindow *)v5->_recycledStatusBarsContainerWindow setHidden:1];
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    recycledStatusBars = v5->_recycledStatusBars;
    v5->_recycledStatusBars = (NSMutableArray *)v10;

    objc_storeWeak((id *)&v5->_windowScene, v4);
  }

  return v5;
}

- (void)recycleStatusBar:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_getAssociatedObject(v4, "SBStatusBarContainerKey");
    p_recycledStatusBars = &self->_recycledStatusBars;
    unint64_t v8 = [(NSMutableArray *)self->_recycledStatusBars count];
    if (v8 >= [(SBStatusBarReusePool *)self _statusBarInstanceLimit])
    {
      objc_setAssociatedObject(v5, "SBStatusBarContainerKey", 0, (void *)0x301);
      [v5 removeFromSuperview];
      uint64_t v10 = SBLogStatusBarish();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[SBStatusBarReusePool recycleStatusBar:]((id *)p_recycledStatusBars, v6);
      }
    }
    else
    {
      id v9 = SBLogStatusBarish();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[SBStatusBarReusePool recycleStatusBar:]((id *)&self->_recycledStatusBars, v6);
      }

      [v6 setReason:@"RecycledStatusBar"];
      [(SBStatusBarReusePool *)self _resetStatusBar:v5 clearOverrides:1];
      [(UIWindow *)self->_recycledStatusBarsContainerWindow addSubview:v5];
      [(NSMutableArray *)self->_recycledStatusBars _sb_enqueue:v5];
    }
  }
}

- (void)enumerateStatusBars:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSHashTable *)self->_statusBars allObjects];
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
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) statusBar];
        v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (unint64_t)_statusBarInstanceLimit
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v4 = [WeakRetained screen];
  id v5 = [v4 displayConfiguration];
  if ([v5 isExternal]) {
    unint64_t v6 = 3;
  }
  else {
    unint64_t v6 = 15;
  }

  return v6;
}

- (void)_removeStatusBarContainer:(id)a3
{
}

- (NSString)description
{
  return (NSString *)[(SBStatusBarReusePool *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBStatusBarReusePool *)self succinctDescriptionBuilder];
  long long v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  long long v3 = [(SBStatusBarReusePool *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBStatusBarReusePool *)self succinctDescriptionBuilder];
  unint64_t v6 = [(NSHashTable *)self->_statusBars allObjects];
  [v5 appendArraySection:v6 withName:@"Status Bars" multilinePrefix:v4 skipIfEmpty:1];

  return v5;
}

- (void)setNewStatusBarConfigurationHandler:(id)a3
{
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong(&self->_newStatusBarConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_recycledStatusBars, 0);
  objc_storeStrong((id *)&self->_recycledStatusBarsContainerWindow, 0);
  objc_storeStrong((id *)&self->_statusBars, 0);
}

- (void)recycleStatusBar:(id *)a1 .cold.1(id *a1, void *a2)
{
  [*a1 count];
  long long v3 = [a2 reason];
  OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v4, v5, "SBStatusBarReusePool recycling Status Bar (cache size %lu) for reason: %@", v6, v7, v8, v9, v10);
}

- (void)recycleStatusBar:(id *)a1 .cold.2(id *a1, void *a2)
{
  [*a1 count];
  long long v3 = [a2 reason];
  OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v4, v5, "SBStatusBarReusePool NOT recycling Status Bar (cache size %lu) for reason: %@", v6, v7, v8, v9, v10);
}

@end