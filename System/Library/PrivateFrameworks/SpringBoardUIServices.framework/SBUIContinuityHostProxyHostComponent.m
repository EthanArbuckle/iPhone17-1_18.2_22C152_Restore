@interface SBUIContinuityHostProxyHostComponent
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
- (void)scene:(id)a3 willUpdateSettings:(id)a4;
- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4;
- (void)setScene:(id)a3;
@end

@implementation SBUIContinuityHostProxyHostComponent

- (void)setScene:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBUIContinuityHostProxyHostComponent;
  [(FBSSceneComponent *)&v8 setScene:a3];
  v4 = +[SBUIContinuityAccessorySceneManager sharedInstance];
  v5 = [(FBSSceneComponent *)self hostScene];
  v6 = [v4 registerPrimaryScene:v5];
  sceneRegistration = self->_sceneRegistration;
  self->_sceneRegistration = v6;
}

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  v6 = [v5 settings];
  v7 = [v6 displayConfiguration];

  objc_super v8 = [v5 previousSettings];

  v9 = [v8 displayConfiguration];

  if (v7 != v9)
  {
    v10 = [v14 _keyboardHostComponent];
    v11 = [v7 hardwareIdentifier];
    [v10 setHardwareKeyboardExclusivityIdentifier:v11];

    v12 = [v14 systemShellHostingEnvironment];
    v13 = SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration(v7);
    [v12 setSystemShellHostingSpaceIdentifier:v13];
  }
}

- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4
{
  [(BSInvalidatable *)self->_sceneRegistration invalidate];
  sceneRegistration = self->_sceneRegistration;
  self->_sceneRegistration = 0;
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = [v5 uiSettings];
    if (!v7)
    {
LABEL_9:

      goto LABEL_10;
    }
    objc_super v8 = [v5 clientSettings];
    uint64_t v9 = [v8 hostProxyUserInterfaceStyle];

    v10 = [v5 clientSettings];
    char v11 = [v10 hostProxyIsCapturingContentForAdditionalRenderingDestination];

    v12 = [v5 clientSettings];
    v13 = [v12 hostProxySceneRenderingEnvironmentIdentifier];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__SBUIContinuityHostProxyHostComponent_scene_didUpdateClientSettings___block_invoke;
    v23[3] = &unk_1E5CCE3B0;
    uint64_t v26 = v9;
    id v14 = v5;
    id v24 = v14;
    char v27 = v11;
    id v15 = v13;
    id v25 = v15;
    v16 = (void *)MEMORY[0x1AD0CF1C0](v23);
    if ([v14 isActive])
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __70__SBUIContinuityHostProxyHostComponent_scene_didUpdateClientSettings___block_invoke_2;
      v20[3] = &unk_1E5CCD5B0;
      v17 = &v22;
      id v22 = v16;
      id v21 = v6;
      [v14 performUpdate:v20];
    }
    else
    {
      if ([v7 userInterfaceStyle] == v9)
      {
LABEL_8:

        goto LABEL_9;
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __70__SBUIContinuityHostProxyHostComponent_scene_didUpdateClientSettings___block_invoke_3;
      v18[3] = &unk_1E5CCD5D8;
      v17 = &v19;
      id v19 = v16;
      [v14 updateSettings:v18];
    }

    goto LABEL_8;
  }
LABEL_10:
}

void __70__SBUIContinuityHostProxyHostComponent_scene_didUpdateClientSettings___block_invoke(uint64_t a1, void *a2)
{
  [a2 setUserInterfaceStyle:*(void *)(a1 + 48)];
  v3 = [*(id *)(a1 + 32) renderingEnvironment];
  [v3 setIsCapturingContentForAdditionalRenderingDestination:*(unsigned __int8 *)(a1 + 56)];

  id v4 = [*(id *)(a1 + 32) renderingEnvironment];
  [v4 setSystemDisplayIdentifier:*(void *)(a1 + 40)];
}

void __70__SBUIContinuityHostProxyHostComponent_scene_didUpdateClientSettings___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = [*(id *)(a1 + 32) transitionContext];
  id v5 = [v4 animationSettings];
  if (v5) {
    [v7 setAnimationSettings:v5];
  }
  id v6 = [v4 animationFence];
  if (v6) {
    [v7 setAnimationFence:v6];
  }
}

uint64_t __70__SBUIContinuityHostProxyHostComponent_scene_didUpdateClientSettings___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end