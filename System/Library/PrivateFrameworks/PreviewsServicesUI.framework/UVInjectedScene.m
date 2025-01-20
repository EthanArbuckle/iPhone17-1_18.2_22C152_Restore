@interface UVInjectedScene
+ (id)_baseSceneSettings:(id)a3 sceneIdentifier:(id)a4 parentSettings:(id)a5;
+ (id)_injectInProcessHandle:(id)a3 error:(id *)a4;
+ (id)injectInProcess:(int)a3 error:(id *)a4;
+ (id)injectInRunningTarget:(id)a3 error:(id *)a4;
- (BOOL)_computeAndUpdateSceneSettings:(id *)a3;
- (BOOL)setMaximizedWithParent:(id)a3 error:(id *)a4;
- (BOOL)setMinimizedWithParent:(id)a3 size:(CGSize)a4 maximumSize:(CGSize)a5 error:(id *)a6;
- (CGSize)sceneSize;
- (FBScene)scene;
- (NSString)description;
- (NSString)sceneIdentifier;
- (id)_computeSceneSettingsUsing:(id)a3 error:(id *)a4;
- (id)_initWithScene:(id)a3;
- (id)_prepareSceneSettingsForUpdate:(id)a3;
- (id)actionHandler;
- (id)invalidationHandler;
- (id)sceneResizeHandler;
- (void)_handleActionsFromHostedScene:(id)a3;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_setParentScene:(id)a3;
- (void)_updateSceneSettings:(id)a3 transitionContext:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidInvalidate:(id)a3;
- (void)sendAction:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setSceneResizeHandler:(id)a3;
@end

@implementation UVInjectedScene

- (id)_initWithScene:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UVInjectedScene;
  v6 = [(UVInjectedScene *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scene, a3);
    v7->_maximized = 1;
    CGSize v8 = (CGSize)*MEMORY[0x263F001B0];
    v7->_overrideSceneSize = (CGSize)*MEMORY[0x263F001B0];
    v7->_overrideMaximumSize = v8;
    [(FBScene *)v7->_scene setDelegate:v7];
  }

  return v7;
}

- (NSString)sceneIdentifier
{
  return (NSString *)[(FBScene *)self->_scene identifier];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(FBScene *)self->_scene identifier];
  v7 = [v3 stringWithFormat:@"<%@ %p, identifier: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [MEMORY[0x263F08B88] callStackSymbols];
  int v6 = 138412546;
  v7 = v4;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_23995F000, a2, OS_LOG_TYPE_FAULT, "%@ deallocated without being invalidated: %@", (uint8_t *)&v6, 0x16u);
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!self->_invalidated)
  {
    v3 = UVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = self;
      _os_log_impl(&dword_23995F000, v3, OS_LOG_TYPE_DEFAULT, "Invalidation of %@", (uint8_t *)&v12, 0xCu);
    }

    self->_invalidated = 1;
    [(FBScene *)self->_scene setDelegate:0];
    v4 = [MEMORY[0x263F3F4F0] sharedInstance];
    id v5 = [(FBScene *)self->_scene identifier];
    int v6 = [v4 sceneWithIdentifier:v5];

    if (v6)
    {
      v7 = [(FBScene *)self->_scene identifier];
      [v4 destroyScene:v7 withTransitionContext:0];
    }
    [(UVInjectedScene *)self _setParentScene:0];
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v9 = self->_invalidationHandler;
    }
    else
    {
      id v9 = 0;
    }
    self->_invalidationHandler = 0;

    id sceneResizeHandler = self->_sceneResizeHandler;
    self->_id sceneResizeHandler = 0;

    id actionHandler = self->_actionHandler;
    self->_id actionHandler = 0;
  }
}

- (void)setInvalidationHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  if (self->_invalidated)
  {
    if (!v4) {
      goto LABEL_6;
    }
    v7 = v4;
    v4[2]();
  }
  else
  {
    v7 = v4;
    id v5 = _Block_copy(v4);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = v5;
  }
  v4 = v7;
LABEL_6:
}

- (void)setSceneResizeHandler:(id)a3
{
  if (!self->_invalidated)
  {
    v4 = _Block_copy(a3);
    id sceneResizeHandler = self->_sceneResizeHandler;
    self->_id sceneResizeHandler = v4;
    MEMORY[0x270F9A758](v4, sceneResizeHandler);
  }
}

- (void)setActionHandler:(id)a3
{
  if (!self->_invalidated)
  {
    v4 = _Block_copy(a3);
    id actionHandler = self->_actionHandler;
    self->_id actionHandler = v4;
    MEMORY[0x270F9A758](v4, actionHandler);
  }
}

- (void)sendAction:(id)a3
{
  scene = self->_scene;
  id v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  [(FBScene *)scene sendActions:v4];
}

- (void)_handleActionsFromHostedScene:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (self->_actionHandler)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            (*((void (**)(void))self->_actionHandler + 2))();
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  objc_msgSend(a6, "actions", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(UVInjectedScene *)self _handleActionsFromHostedScene:v7];
}

- (void)sceneDidInvalidate:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = UVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_23995F000, v4, OS_LOG_TYPE_DEFAULT, "Scene triggered invalidation of %@", (uint8_t *)&v5, 0xCu);
  }

  [(UVInjectedScene *)self invalidate];
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13 = a7;
  long long v10 = [a4 settings];
  long long v11 = [(UVInjectedScene *)self _computeSceneSettingsUsing:v10 error:0];

  if (v11)
  {
    long long v12 = (void *)[v13 copy];

    [v12 setActions:0];
    [(UVInjectedScene *)self _updateSceneSettings:v11 transitionContext:v12];
    id v13 = v12;
  }
}

- (void)_setParentScene:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  int v5 = (UIWindowScene *)a3;
  parentScene = self->_parentScene;
  if (parentScene != v5)
  {
    uint64_t v7 = [(FBScene *)self->_scene identifier];
    [(UIWindowScene *)parentScene _unregisterSettingsDiffActionArrayForKey:v7];

    objc_storeStrong((id *)&self->_parentScene, a3);
    uint64_t v8 = self->_parentScene;
    v11[0] = self;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    long long v10 = [(FBScene *)self->_scene identifier];
    [(UIWindowScene *)v8 _registerSettingsDiffActionArray:v9 forKey:v10];
  }
}

- (BOOL)setMaximizedWithParent:(id)a3 error:(id *)a4
{
  [(UVInjectedScene *)self _setParentScene:a3];
  self->_maximized = 1;

  return [(UVInjectedScene *)self _computeAndUpdateSceneSettings:a4];
}

- (BOOL)setMinimizedWithParent:(id)a3 size:(CGSize)a4 maximumSize:(CGSize)a5 error:(id *)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v9 = a4.height;
  CGFloat v10 = a4.width;
  [(UVInjectedScene *)self _setParentScene:a3];
  self->_maximized = 0;
  self->_overrideSceneSize.CGFloat width = v10;
  self->_overrideSceneSize.CGFloat height = v9;
  self->_overrideMaximumSize.CGFloat width = width;
  self->_overrideMaximumSize.CGFloat height = height;

  return [(UVInjectedScene *)self _computeAndUpdateSceneSettings:a6];
}

- (CGSize)sceneSize
{
  v2 = [(FBScene *)self->_scene settings];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (BOOL)_computeAndUpdateSceneSettings:(id *)a3
{
  double v5 = [(UIWindowScene *)self->_parentScene _FBSScene];
  double v6 = [v5 settings];

  double v7 = [(UVInjectedScene *)self _computeSceneSettingsUsing:v6 error:a3];
  if (v7) {
    [(UVInjectedScene *)self _updateSceneSettings:v7 transitionContext:0];
  }

  return v7 != 0;
}

- (id)_computeSceneSettingsUsing:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = v6;
  if (v6)
  {
    id v15 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = [v15 displayConfiguration];
      if (v23)
      {
        if (self->_maximized)
        {
          v24 = [(FBSSettings *)[UVMutablePreviewSceneSettings alloc] initWithSettings:v15];
          [(UVMutablePreviewSceneSettings *)v24 frame];
          -[UVMutablePreviewSceneSettings setPreviewMaximumSize:](v24, "setPreviewMaximumSize:", v25, v26);
          [(UVMutablePreviewSceneSettings *)v24 setInterruptionPolicy:1];
        }
        else
        {
          v24 = [(id)objc_opt_class() _baseSceneSettings:v23 sceneIdentifier:0 parentSettings:0];
          [(UVMutablePreviewSceneSettings *)v24 setInterruptionPolicy:1];
          -[UVMutablePreviewSceneSettings setForeground:](v24, "setForeground:", [v15 isForeground]);
          -[UVMutablePreviewSceneSettings setUserInterfaceStyle:](v24, "setUserInterfaceStyle:", [v15 userInterfaceStyle]);
          -[UVMutablePreviewSceneSettings setInterfaceOrientation:](v24, "setInterfaceOrientation:", [v15 interfaceOrientation]);
          -[UVMutablePreviewSceneSettings setDeviceOrientation:](v24, "setDeviceOrientation:", [v15 deviceOrientation]);
          [(UVMutablePreviewSceneSettings *)v24 interfaceOrientation];
          int IsLandscape = BSInterfaceOrientationIsLandscape();
          uint64_t v41 = 40;
          if (IsLandscape) {
            uint64_t v42 = 32;
          }
          else {
            uint64_t v42 = 40;
          }
          if (!IsLandscape) {
            uint64_t v41 = 32;
          }
          -[UVMutablePreviewSceneSettings setFrame:](v24, "setFrame:", 0.0, 0.0, *(double *)((char *)&self->super.isa + v41), *(double *)((char *)&self->super.isa + v42));
          -[UVMutablePreviewSceneSettings setPreviewMaximumSize:](v24, "setPreviewMaximumSize:", self->_overrideMaximumSize.width, self->_overrideMaximumSize.height);
        }
        v28 = (void *)[(UVMutablePreviewSceneSettings *)v24 copy];

        goto LABEL_28;
      }
      v38 = UVPreviewsServicesError(@"cannot compute settings from parent settings with nil display config", v16, v17, v18, v19, v20, v21, v22, v44);
      v39 = UVLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
        -[UVInjectedScene _computeSceneSettingsUsing:error:](v38);
      }

      if (a4) {
        *a4 = v38;
      }
    }
    else
    {
      uint64_t v29 = objc_opt_class();
      UVPreviewsServicesError(@"cannot compute settings from parent scene with non-UI settings: %@", v30, v31, v32, v33, v34, v35, v36, v29);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      v37 = UVLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        -[UVInjectedScene _computeSceneSettingsUsing:error:](v23);
      }

      if (a4)
      {
        id v23 = v23;
        v28 = 0;
        *a4 = v23;
LABEL_28:

        goto LABEL_29;
      }
    }
    v28 = 0;
    goto LABEL_28;
  }
  UVPreviewsServicesError(@"cannot compute settings without parent settings", v7, v8, v9, v10, v11, v12, v13, v44);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v27 = UVLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
    -[UVInjectedScene _computeSceneSettingsUsing:error:](v15);
  }

  v28 = 0;
  if (a4) {
    *a4 = v15;
  }
LABEL_29:

  return v28;
}

- (id)_prepareSceneSettingsForUpdate:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)_updateSceneSettings:(id)a3 transitionContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(UVInjectedScene *)self sceneSize];
  double v9 = v8;
  double v11 = v10;
  id v15 = [(UVInjectedScene *)self _prepareSceneSettingsForUpdate:v7];

  [(FBScene *)self->_scene updateSettings:v15 withTransitionContext:v6];
  [(UVInjectedScene *)self sceneSize];
  if (v9 != v13 || v11 != v12)
  {
    id sceneResizeHandler = (void (**)(void))self->_sceneResizeHandler;
    if (sceneResizeHandler) {
      sceneResizeHandler[2]();
    }
  }
}

+ (id)_baseSceneSettings:(id)a3 sceneIdentifier:(id)a4 parentSettings:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  double v10 = [(FBSSettings *)[UVMutablePreviewSceneSettings alloc] initWithSettings:v8];

  if (v7)
  {
    double v12 = UVSceneIdentifierToPersistenceIdentifier(v7, v11);
    [(UVMutablePreviewSceneSettings *)v10 setPersistenceIdentifier:v12];
  }
  [(UVMutablePreviewSceneSettings *)v10 setDisplayConfiguration:v9];
  [(UVMutablePreviewSceneSettings *)v10 setLevel:1.0];
  [(UVMutablePreviewSceneSettings *)v10 setForeground:1];
  [(UVMutablePreviewSceneSettings *)v10 setInterfaceOrientation:1];
  [(UVMutablePreviewSceneSettings *)v10 setStatusBarDisabled:1];
  [v9 bounds];
  -[UVMutablePreviewSceneSettings setFrame:](v10, "setFrame:");
  [v9 bounds];
  double v14 = v13;
  double v16 = v15;

  -[UVMutablePreviewSceneSettings setPreviewMaximumSize:](v10, "setPreviewMaximumSize:", v14, v16);

  return v10;
}

+ (id)injectInRunningTarget:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F645D8] predicateMatchingBundleIdentifier:v6];
  id v16 = 0;
  id v8 = [MEMORY[0x263F64570] handleForPredicate:v7 error:&v16];
  id v9 = v16;
  if (v8)
  {
    double v10 = [a1 _injectInProcessHandle:v8 error:a4];
  }
  else
  {
    double v11 = [NSString stringWithFormat:@"Failed to get process handle for %@: %@", v6, v9];
    double v12 = UVLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[UVInjectedScene injectInRunningTarget:error:]();
    }

    if (a4)
    {
      double v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F08320];
      v18[0] = v11;
      double v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      *a4 = [v13 errorWithDomain:@"UVErrorDomain" code:1 userInfo:v14];
    }
    double v10 = 0;
  }

  return v10;
}

+ (id)injectInProcess:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = objc_msgSend(MEMORY[0x263F64580], "identifierWithPid:");
  id v16 = 0;
  id v8 = [MEMORY[0x263F64570] handleForIdentifier:v7 error:&v16];
  id v9 = v16;
  if (v8)
  {
    double v10 = [a1 _injectInProcessHandle:v8 error:a4];
  }
  else
  {
    double v11 = [NSString stringWithFormat:@"Failed to get process handle for pid %d: %@", v5, v9];
    double v12 = UVLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[UVInjectedScene injectInRunningTarget:error:]();
    }

    if (a4)
    {
      double v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F08320];
      v18[0] = v11;
      double v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      *a4 = [v13 errorWithDomain:@"UVErrorDomain" code:1 userInfo:v14];
    }
    double v10 = 0;
  }

  return v10;
}

+ (id)_injectInProcessHandle:(id)a3 error:(id *)a4
{
  v36[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F3F460] sharedInstance];
  uint64_t v33 = v6;
  uint64_t v31 = a4;
  if (v6) {
    [v6 auditToken];
  }
  else {
    memset(v34, 0, sizeof(v34));
  }
  id v8 = [v7 registerProcessForAuditToken:v34];

  id v9 = (void *)MEMORY[0x263F3F7A8];
  double v10 = [v8 identity];
  double v11 = [v9 identityForProcessIdentity:v10];

  double v12 = NSString;
  uint64_t v13 = getpid();
  double v14 = [v12 stringWithFormat:@"%@-(%d)-%d", @"UV-InjectedScene", v13, ++_NextIdentifier_identifier];
  double v15 = +[FBSSceneSpecification specification];
  id v16 = [MEMORY[0x263F3F768] parametersForSpecification:v15];
  uint64_t v17 = [MEMORY[0x263F82B60] mainScreen];
  uint64_t v18 = [v17 displayConfiguration];

  uint64_t v32 = (void *)v18;
  uint64_t v19 = [a1 _baseSceneSettings:v18 sceneIdentifier:v14 parentSettings:0];
  uint64_t v20 = (void *)[v19 copy];
  [v16 setSettings:v20];

  uint64_t v21 = [MEMORY[0x263F3F760] definition];
  uint64_t v22 = [MEMORY[0x263F3F7C8] identityForIdentifier:v14];
  [v21 setIdentity:v22];

  [v21 setClientIdentity:v11];
  [v21 setSpecification:v15];
  id v23 = [MEMORY[0x263F3F4F0] sharedInstance];
  v24 = [v23 createSceneWithDefinition:v21 initialParameters:v16];

  if (v24)
  {
    id v25 = [[UVInjectedScene alloc] _initWithScene:v24];
  }
  else
  {
    double v26 = [NSString stringWithFormat:@"Failed to create scene for process %@", v8];
    v27 = UVLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[UVInjectedScene injectInRunningTarget:error:]();
    }

    if (v31)
    {
      uint64_t v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263F08320];
      v36[0] = v26;
      v28 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
      *uint64_t v31 = [v30 errorWithDomain:@"UVErrorDomain" code:2 userInfo:v28];
    }
    id v25 = 0;
  }

  return v25;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (id)sceneResizeHandler
{
  return self->_sceneResizeHandler;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (FBScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong(&self->_sceneResizeHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_parentScene, 0);
}

- (void)_computeSceneSettingsUsing:(void *)a1 error:.cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23995F000, v2, v3, "%{public}@", v4, v5, v6, v7, v8);
}

+ (void)injectInRunningTarget:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_23995F000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

@end