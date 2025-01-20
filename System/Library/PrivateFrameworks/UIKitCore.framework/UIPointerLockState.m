@interface UIPointerLockState
- (BOOL)isLocked;
- (UIPointerLockState)initWithScene:(id)a3;
- (UIScene)_scene;
- (id)_settingsDiffActionsForScene:(id)a3;
- (id)_windowScene;
- (id)windowHostingScene;
- (void)_pointerLockStatusUpdated;
- (void)_preferredPointerLockStatusUpdated;
- (void)_setScene:(id)a3;
@end

@implementation UIPointerLockState

- (UIPointerLockState)initWithScene:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPointerLockState;
  v6 = [(UIPointerLockState *)&v11 init];
  if (v6)
  {
    if (([v5 _hostsWindows] & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, v6, @"UIPointerLockState.m", 74, @"Invalid parameter not satisfying: %@", @"[scene _hostsWindows]" object file lineNumber description];
    }
    objc_storeWeak((id *)&v6->_scene, v5);
    v7 = [(UIPointerLockState *)v6 windowHostingScene];
    v8 = [v7 _effectiveUISettings];
    v6->_status = [v8 pointerLockStatus];
  }
  return v6;
}

- (BOOL)isLocked
{
  return self->_status == 1;
}

- (id)windowHostingScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return WeakRetained;
}

- (id)_windowScene
{
  v2 = [(UIPointerLockState *)self windowHostingScene];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)_preferredPointerLockStatusUpdated
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(UIPointerLockState *)self windowHostingScene];
  if (v2)
  {
    v3 = +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:v2];
    id v4 = [v3 rootViewController];
    id v5 = [v4 _effectivePointerLockViewController];

    if (v5) {
      uint64_t v6 = [v5 prefersPointerLocked];
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("PointerLockState", &_preferredPointerLockStatusUpdated___s_category)+ 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = [v2 succinctDescription];
      v10 = @"_UIPointerLockStatusLocked";
      if (!v6) {
        v10 = @"_UIPointerLockStatusUnlocked";
      }
      objc_super v11 = v10;
      *(_DWORD *)buf = 138412802;
      v14 = v9;
      __int16 v15 = 2112;
      v16 = v5;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "preferredPointerLockStatus updated: scene: %@; viewController: %@; preferredPointerLockStatus: %@",
        buf,
        0x20u);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__UIPointerLockState__preferredPointerLockStatusUpdated__block_invoke;
    v12[3] = &__block_descriptor_40_e89_B24__0__UIMutableApplicationSceneClientSettings_8__UIApplicationSceneTransitionContext_16l;
    v12[4] = v6;
    [v2 _updateUIClientSettingsWithUITransitionBlock:v12];
  }
}

uint64_t __56__UIPointerLockState__preferredPointerLockStatusUpdated__block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (void)_pointerLockStatusUpdated
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(UIPointerLockState *)self windowHostingScene];
  id v4 = [v3 _effectiveUISettings];
  int64_t v5 = [v4 pointerLockStatus];

  if (self->_status != v5)
  {
    [(UIPointerLockState *)self willChangeValueForKey:@"locked"];
    self->_status = v5;
    uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("PointerLockState", &_pointerLockStatusUpdated___s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = [(UIPointerLockState *)self windowHostingScene];
      v9 = [v8 succinctDescription];
      if (self->_status) {
        v10 = @"_UIPointerLockStatusLocked";
      }
      else {
        v10 = @"_UIPointerLockStatusUnlocked";
      }
      objc_super v11 = v10;
      *(_DWORD *)buf = 138412546;
      v18 = v9;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "pointerLockStatus updated: scene: %@; pointerLockStatus: %@",
        buf,
        0x16u);
    }
    [(UIPointerLockState *)self didChangeValueForKey:@"locked"];
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v13 = [(UIPointerLockState *)self windowHostingScene];
    v16 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v12 postNotificationName:@"UIPointerLockStateDidChangeNotification" object:self userInfo:v14];
  }
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
}

@end