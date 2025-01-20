@interface SBWindowSceneManager
- (NSMutableSet)mutableConnectedWindowScenes;
- (NSSet)connectedWindowScenes;
- (SBMultiDisplayUserInteractionCoordinator)userInteractionCoordinator;
- (SBWindowScene)activeDisplayWindowScene;
- (SBWindowScene)activeDisplayWindowSceneFollowingKeyboard;
- (SBWindowScene)activeDisplayWindowSceneFollowingUserInteraction;
- (SBWindowSceneManager)initWithUserInteractionCoordinator:(id)a3;
- (_SBActiveDisplayKeyboardFocusTracker)keyboardFocusTracker;
- (id)_continuityDisplayWindowScene;
- (id)_embeddedDisplayWindowScene;
- (id)_extendedDisplayWindowScene;
- (id)_validateSuggestedActiveWindowScene:(id)a3 usingMethodology:(int64_t)a4;
- (id)windowSceneForDisplayIdentity:(id)a3;
- (id)windowSceneForPersistentIdentifier:(id)a3;
- (id)windowSceneForSceneHandle:(id)a3;
- (id)windowSceneForSceneIdentifier:(id)a3;
- (void)_sceneDidDisconnect:(id)a3;
- (void)_sceneWillConnect:(id)a3;
- (void)setKeyboardFocusTracker:(id)a3;
- (void)setUserInteractionCoordinator:(id)a3;
@end

@implementation SBWindowSceneManager

- (id)windowSceneForSceneHandle:(id)a3
{
  v4 = [a3 displayIdentity];
  v5 = [(SBWindowSceneManager *)self windowSceneForDisplayIdentity:v4];

  return v5;
}

- (SBWindowScene)activeDisplayWindowScene
{
  v3 = +[SBExternalDisplaySettingsDomain rootSettings];
  uint64_t v4 = [v3 activeDisplayTrackingMethodology];

  if (v4 == 1)
  {
    v5 = [(SBWindowSceneManager *)self activeDisplayWindowSceneFollowingUserInteraction];
  }
  else if (!v4)
  {
    v5 = [(SBWindowSceneManager *)self activeDisplayWindowSceneFollowingKeyboard];
  }
  return (SBWindowScene *)v5;
}

- (SBWindowScene)activeDisplayWindowSceneFollowingUserInteraction
{
  v3 = [(SBMultiDisplayUserInteractionCoordinator *)self->_userInteractionCoordinator activeWindowScene];
  uint64_t v4 = [(SBWindowSceneManager *)self _validateSuggestedActiveWindowScene:v3 usingMethodology:1];

  return (SBWindowScene *)v4;
}

- (id)_validateSuggestedActiveWindowScene:(id)a3 usingMethodology:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isInvalidating])
  {
    v7 = SBLogActiveDisplay();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = SBStringForActiveDisplayTrackingMethodology(a4);
      v9 = [v6 _fbsDisplayIdentity];
      *(_DWORD *)v14 = 138543874;
      *(void *)&v14[4] = v8;
      *(_WORD *)&v14[12] = 2048;
      *(void *)&v14[14] = v6;
      *(_WORD *)&v14[22] = 2114;
      v15 = v9;
      v10 = "[%{public}@] focus scene <%p> on display %{public}@ is in the process of invalidating, falling back to repor"
            "ting the embedded scene as the active scene";
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, v10, v14, 0x20u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([v6 isInvalidated])
  {
    v7 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = SBStringForActiveDisplayTrackingMethodology(a4);
      v9 = [v6 _fbsDisplayIdentity];
      *(_DWORD *)v14 = 138543874;
      *(void *)&v14[4] = v8;
      *(_WORD *)&v14[12] = 2048;
      *(void *)&v14[14] = v6;
      *(_WORD *)&v14[22] = 2114;
      v15 = v9;
      v10 = "[%{public}@] focus scene <%p> on display %{public}@ is invalidated!?!?!?!?, falling back to reporting the em"
            "bedded scene as the active scene";
      goto LABEL_7;
    }
LABEL_8:

LABEL_9:
    id v11 = [(SBWindowSceneManager *)self _embeddedDisplayWindowScene];
    goto LABEL_10;
  }
  if (!v6) {
    goto LABEL_9;
  }
  id v11 = v6;
LABEL_10:
  v12 = v11;

  return v12;
}

- (id)windowSceneForDisplayIdentity:(id)a3
{
  id v4 = a3;
  if ([v4 expectsSecureRendering] || !objc_msgSend(v4, "sb_displayWindowingMode"))
  {
    id v6 = [(SBWindowSceneManager *)self _embeddedDisplayWindowScene];
  }
  else
  {
    mutableConnectedWindowScenes = self->_mutableConnectedWindowScenes;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__SBWindowSceneManager_windowSceneForDisplayIdentity___block_invoke;
    v8[3] = &unk_1E6AFBF38;
    id v9 = v4;
    id v6 = [(NSMutableSet *)mutableConnectedWindowScenes bs_firstObjectPassingTest:v8];
  }
  return v6;
}

- (NSSet)connectedWindowScenes
{
  v2 = (void *)[(NSMutableSet *)self->_mutableConnectedWindowScenes copy];
  return (NSSet *)v2;
}

uint64_t __54__SBWindowSceneManager_windowSceneForDisplayIdentity___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _fbsDisplayIdentity];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

uint64_t __51__SBWindowSceneManager__embeddedDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isMainDisplayWindowScene]) {
    uint64_t v3 = [v2 isExternalDisplayWindowScene] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_embeddedDisplayWindowScene
{
  return (id)[(NSMutableSet *)self->_mutableConnectedWindowScenes bs_firstObjectPassingTest:&__block_literal_global_76];
}

- (id)windowSceneForSceneIdentifier:(id)a3
{
  id v4 = [MEMORY[0x1E4F62A60] identityForIdentifier:a3];
  mutableConnectedWindowScenes = self->_mutableConnectedWindowScenes;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SBWindowSceneManager_windowSceneForSceneIdentifier___block_invoke;
  v9[3] = &unk_1E6AFBF38;
  id v10 = v4;
  id v6 = v4;
  v7 = [(NSMutableSet *)mutableConnectedWindowScenes bs_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __54__SBWindowSceneManager_windowSceneForSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSceneManagerCoordinator sharedInstance];
  v5 = [v3 _fbsDisplayIdentity];

  id v6 = [v4 sceneManagerForDisplayIdentity:v5];

  v7 = [v6 existingSceneHandleForSceneIdentity:*(void *)(a1 + 32)];
  v8 = v7;
  if (v7)
  {
    id v9 = [v7 sceneIfExists];
    id v10 = [v9 settings];
    id v11 = objc_msgSend(v10, "sb_displayIdentityForSceneManagers");
    v12 = [v6 displayIdentity];
    uint64_t v13 = [v11 isEqual:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (SBWindowSceneManager)initWithUserInteractionCoordinator:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBWindowSceneManager;
  id v6 = [(SBWindowSceneManager *)&v12 init];
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    mutableConnectedWindowScenes = v6->_mutableConnectedWindowScenes;
    v6->_mutableConnectedWindowScenes = v7;

    id v9 = objc_alloc_init(_SBActiveDisplayKeyboardFocusTracker);
    keyboardFocusTracker = v6->_keyboardFocusTracker;
    v6->_keyboardFocusTracker = v9;

    objc_storeStrong((id *)&v6->_userInteractionCoordinator, a3);
  }

  return v6;
}

- (SBWindowScene)activeDisplayWindowSceneFollowingKeyboard
{
  id v3 = [(_SBActiveDisplayKeyboardFocusTracker *)self->_keyboardFocusTracker activeWindowScene];
  id v4 = [(SBWindowSceneManager *)self _validateSuggestedActiveWindowScene:v3 usingMethodology:0];

  return (SBWindowScene *)v4;
}

- (id)windowSceneForPersistentIdentifier:(id)a3
{
  id v4 = a3;
  mutableConnectedWindowScenes = self->_mutableConnectedWindowScenes;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SBWindowSceneManager_windowSceneForPersistentIdentifier___block_invoke;
  v9[3] = &unk_1E6AFBF38;
  id v10 = v4;
  id v6 = v4;
  v7 = [(NSMutableSet *)mutableConnectedWindowScenes bs_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __59__SBWindowSceneManager_windowSceneForPersistentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSceneManagerCoordinator sharedInstance];
  id v5 = [v3 _fbsDisplayIdentity];

  id v6 = [v4 sceneManagerForDisplayIdentity:v5];

  v7 = [v6 existingSceneHandleForPersistenceIdentifier:*(void *)(a1 + 32)];
  v8 = v7;
  if (v7)
  {
    id v9 = [v7 sceneIfExists];
    id v10 = [v9 settings];
    id v11 = objc_msgSend(v10, "sb_displayIdentityForSceneManagers");
    objc_super v12 = [v6 displayIdentity];
    uint64_t v13 = [v11 isEqual:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)_sceneWillConnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v8 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    [(NSMutableSet *)self->_mutableConnectedWindowScenes addObject:v7];
  }
}

- (void)_sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v8 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    [(NSMutableSet *)self->_mutableConnectedWindowScenes removeObject:v7];
  }
}

- (id)_continuityDisplayWindowScene
{
  return (id)[(NSMutableSet *)self->_mutableConnectedWindowScenes bs_firstObjectPassingTest:&__block_literal_global_7_1];
}

uint64_t __53__SBWindowSceneManager__continuityDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isContinuityDisplayWindowScene];
}

- (id)_extendedDisplayWindowScene
{
  return (id)[(NSMutableSet *)self->_mutableConnectedWindowScenes bs_firstObjectPassingTest:&__block_literal_global_9];
}

uint64_t __51__SBWindowSceneManager__extendedDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isExtendedDisplayWindowScene];
}

- (NSMutableSet)mutableConnectedWindowScenes
{
  return self->_mutableConnectedWindowScenes;
}

- (_SBActiveDisplayKeyboardFocusTracker)keyboardFocusTracker
{
  return self->_keyboardFocusTracker;
}

- (void)setKeyboardFocusTracker:(id)a3
{
}

- (SBMultiDisplayUserInteractionCoordinator)userInteractionCoordinator
{
  return self->_userInteractionCoordinator;
}

- (void)setUserInteractionCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInteractionCoordinator, 0);
  objc_storeStrong((id *)&self->_keyboardFocusTracker, 0);
  objc_storeStrong((id *)&self->_mutableConnectedWindowScenes, 0);
}

@end