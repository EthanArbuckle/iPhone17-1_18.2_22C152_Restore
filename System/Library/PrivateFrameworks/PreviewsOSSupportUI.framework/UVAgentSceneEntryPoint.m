@interface UVAgentSceneEntryPoint
- (UIScene)_scene;
- (UVAgentSceneEntryPoint)initWithScene:(id)a3;
- (void)_forceApplicationLaunchCompletion;
- (void)_setScene:(id)a3;
@end

@implementation UVAgentSceneEntryPoint

- (UVAgentSceneEntryPoint)initWithScene:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UVAgentSceneEntryPoint;
  v6 = [(UVAgentSceneEntryPoint *)&v14 init];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2 object:v6 file:@"UVAgentSceneEntryPoint.m" lineNumber:40 description:@"Scene wasn't a window scene."];
    }
    objc_storeWeak((id *)&v6->_scene, v5);
    v7 = UVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v5 _FBSScene];
      v9 = [v8 identifier];
      *(_DWORD *)buf = 138412546;
      id v16 = v5;
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_23B530000, v7, OS_LOG_TYPE_DEFAULT, "UVPreviewSceneEntryPoint init: %@ (identifier = %@)", buf, 0x16u);
    }
    [(UVAgentSceneEntryPoint *)v6 _forceApplicationLaunchCompletion];
    v10 = [v5 _FBSScene];
    v11 = [v10 identifier];

    +[UVAgentSceneRegistry deliverScene:v5 forIdentifier:v11];
  }

  return v6;
}

- (void)_forceApplicationLaunchCompletion
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 _compellApplicationLaunchToCompleteUnconditionally];
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