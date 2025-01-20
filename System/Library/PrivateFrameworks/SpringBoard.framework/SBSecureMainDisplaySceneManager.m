@interface SBSecureMainDisplaySceneManager
- (BOOL)_shouldAutoHostScene:(id)a3;
- (BOOL)_shouldTrackScenesForDeactivation;
- (id)_sceneIdentifierForBundleIdentifier:(id)a3;
- (id)newSceneIdentityForApplication:(id)a3;
- (id)sceneIdentityForApplication:(id)a3;
- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4;
- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4;
- (void)_noteDidChangeToVisibility:(unint64_t)a3 previouslyExisted:(BOOL)a4 forScene:(id)a5;
- (void)addActionHandler:(id)a3 forScene:(id)a4;
- (void)removeActionHandler:(id)a3 forScene:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
@end

@implementation SBSecureMainDisplaySceneManager

- (BOOL)_shouldAutoHostScene:(id)a3
{
  id v3 = a3;
  v4 = [v3 clientProcess];
  if ([v4 isApplicationProcess])
  {
    v5 = [v3 clientProcess];
    char v6 = [v5 isCurrentProcess];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)_shouldTrackScenesForDeactivation
{
  return 1;
}

- (id)newSceneIdentityForApplication:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  char v6 = [(SBSecureMainDisplaySceneManager *)self _sceneIdentifierForBundleIdentifier:v5];

  v7 = [(SBSecureMainDisplaySceneManager *)self sceneIdentityForApplication:v4 uniqueIdentifier:v6];

  return v7;
}

- (id)sceneIdentityForApplication:(id)a3
{
  id v3 = [(SBSecureMainDisplaySceneManager *)self newSceneIdentityForApplication:a3];
  return v3;
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [a3 bundleIdentifier];
    id v8 = [(SBSecureMainDisplaySceneManager *)self _sceneIdentifierForBundleIdentifier:v9];
  }
  v10 = [MEMORY[0x1E4F62A60] identityForIdentifier:v8];

  return v10;
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4
{
  id v4 = -[SBSecureMainDisplaySceneManager newSceneIdentityForApplication:](self, "newSceneIdentityForApplication:", a3, a4);
  return v4;
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)[a4 mutableCopy];
  id v8 = [(NSMapTable *)self->_blsActionHandlersForScenes objectForKey:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) respondToActions:v7 forFBScene:v6];
        [v7 intersectSet:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  v14.receiver = self;
  v14.super_class = (Class)SBSecureMainDisplaySceneManager;
  [(SBSceneManager *)&v14 scene:v6 didReceiveActions:v7];
}

- (void)addActionHandler:(id)a3 forScene:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  if (!blsActionHandlersForScenes)
  {
    id v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v9 = self->_blsActionHandlersForScenes;
    self->_blsActionHandlersForScenes = v8;

    blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  }
  id v10 = [(NSMapTable *)blsActionHandlersForScenes objectForKey:v6];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28D30]);
    [(NSMapTable *)self->_blsActionHandlersForScenes setObject:v10 forKey:v6];
  }
  [v10 addObject:v11];
}

- (void)removeActionHandler:(id)a3 forScene:(id)a4
{
  blsActionHandlersForScenes = self->_blsActionHandlersForScenes;
  id v6 = a3;
  id v7 = [(NSMapTable *)blsActionHandlersForScenes objectForKey:a4];
  [v7 removeObject:v6];
}

- (id)_sceneIdentifierForBundleIdentifier:(id)a3
{
  return (id)[a3 stringByAppendingString:@" (Secure)"];
}

- (void)_noteDidChangeToVisibility:(unint64_t)a3 previouslyExisted:(BOOL)a4 forScene:(id)a5
{
  id v7 = a5;
  id v13 = [(SBSceneManager *)self externalForegroundApplicationSceneHandles];
  id v8 = +[SBBackgroundActivityAttributionManager sharedInstance];
  [v8 updateForegroundApplicationSceneHandles:v13 withOptions:-1 completion:0];

  uint64_t v9 = [v7 clientProcess];

  id v10 = 0;
  if ([v9 isApplicationProcess])
  {
    id v11 = +[SBApplicationController sharedInstance];
    uint64_t v12 = [v9 bundleIdentifier];
    id v10 = [v11 applicationWithBundleIdentifier:v12];

    if (v10)
    {
      [v10 setHasProminentlyIndicatedLocationUseWhileForeground:0];
      if (a3 == 1)
      {
        if ([v10 hasRegisteredBackgroundActivityWithIdentifier:*MEMORY[0x1E4FA95C0]]) {
          [(id)SBApp nowLocatingAppDidEnterForeground:v10];
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end