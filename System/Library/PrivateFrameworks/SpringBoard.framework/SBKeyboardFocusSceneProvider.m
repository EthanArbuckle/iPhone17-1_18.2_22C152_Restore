@interface SBKeyboardFocusSceneProvider
- (BOOL)anyConnectedSBWindowSceneContainsSceneIdentity:(id)a3;
- (BOOL)isOverlayUIScene:(id)a3;
- (BOOL)isSystemUISceneIdentityToken:(id)a3;
- (FBScene)spotlightScene;
- (id)sceneForFocusTarget:(id)a3;
- (id)sceneForIdentityToken:(id)a3;
- (id)sceneForIdentityTokenStringRepresentation:(id)a3;
@end

@implementation SBKeyboardFocusSceneProvider

- (id)sceneForFocusTarget:(id)a3
{
  v4 = [a3 sceneIdentityToken];
  v5 = [(SBKeyboardFocusSceneProvider *)self sceneForIdentityToken:v4];

  return v5;
}

- (id)sceneForIdentityToken:(id)a3
{
  v4 = [a3 stringRepresentation];
  v5 = [(SBKeyboardFocusSceneProvider *)self sceneForIdentityTokenStringRepresentation:v4];

  return v5;
}

- (id)sceneForIdentityTokenStringRepresentation:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F62490] sharedInstance];
    v5 = [v4 sceneFromIdentityTokenStringRepresentation:v3];

    if (!v5)
    {
      v6 = [(id)SBApp systemUIScenesCoordinator];
      v5 = [v6 sceneFromIdentityTokenStringRepresentation:v3];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isOverlayUIScene:(id)a3
{
  id v3 = (void *)SBApp;
  id v4 = a3;
  v5 = [v3 systemUIScenesCoordinator];
  v6 = [v5 overlayUISceneController];
  v7 = [v6 jobLabel];
  v8 = [v4 clientHandle];

  v9 = [v8 processHandle];
  v10 = [v9 consistentJobLabel];
  char v11 = [v7 isEqualToString:v10];

  return v11;
}

- (FBScene)spotlightScene
{
  v2 = +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController];
  id v3 = [v2 sceneIdentifier];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F62490] sharedInstance];
    v5 = [v4 sceneWithIdentifier:v3];
  }
  else
  {
    v5 = 0;
  }

  return (FBScene *)v5;
}

- (BOOL)isSystemUISceneIdentityToken:(id)a3
{
  id v3 = (void *)SBApp;
  id v4 = a3;
  v5 = [v3 systemUIScenesCoordinator];
  v6 = [v5 overlayUISceneController];
  v7 = [v6 sceneFromIdentityToken:v4];

  return v7 != 0;
}

- (BOOL)anyConnectedSBWindowSceneContainsSceneIdentity:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v4 = [(id)SBApp windowSceneManager];
    v5 = [v4 connectedWindowScenes];

    uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v21)
    {
      uint64_t v6 = *(void *)v27;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v5);
          }
          v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          v9 = objc_msgSend(v8, "sceneManager", v20);
          v10 = [v9 externalApplicationSceneHandles];

          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v23 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = [*(id *)(*((void *)&v22 + 1) + 8 * j) scene];
                v16 = [v15 identityToken];
                char v17 = BSEqualObjects();

                if (v17)
                {

                  BOOL v18 = 1;
                  goto LABEL_21;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }

          uint64_t v6 = v20;
        }
        BOOL v18 = 0;
        uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v21);
    }
    else
    {
      BOOL v18 = 0;
    }
LABEL_21:
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

@end