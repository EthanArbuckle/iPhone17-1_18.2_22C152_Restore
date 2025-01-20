@interface SBLoginAppSceneHoster
- (BOOL)deferHIDEvents;
- (NSString)hostedAppBundleID;
- (NSString)hostedSceneIdentifier;
- (SBApplication)hostedApp;
- (SBLoginAppSceneHoster)init;
- (SBLoginAppSceneHosterDelegate)delegate;
- (UIView)contentView;
- (id)_appClientSettingsDiffInspector;
- (void)_updateHIDEventDeferralsIfNecessary;
- (void)killLoginApp;
- (void)launchLoginAppWithInitialOrientation:(int64_t)a3 completion:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidInvalidate:(id)a3;
- (void)setDeferHIDEvents:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)updateSettingsWithTransitionBlock:(id)a3;
@end

@implementation SBLoginAppSceneHoster

- (SBLoginAppSceneHoster)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBLoginAppSceneHoster;
  v2 = [(SBLoginAppSceneHoster *)&v5 init];
  if (v2)
  {
    v3 = +[SBSceneManagerCoordinator sharedInstance];
    [v3 registerSceneWorkspaceIdentifierToIgnore:@"LoginWorkspace"];
  }
  return v2;
}

- (void)launchLoginAppWithInitialOrientation:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (self->_scene)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    objc_initWeak(location, self);
    v8 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    v9 = [(SBLoginAppSceneHoster *)self hostedApp];
    v10 = (void *)[v8 newSceneIdentityForApplication:v9];

    v11 = (void *)MEMORY[0x1E4F62A60];
    v12 = [v10 identifier];
    v13 = [v11 identityForIdentifier:v12 workspaceIdentifier:@"LoginWorkspace"];

    id v14 = objc_alloc(MEMORY[0x1E4F62410]);
    v15 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:@"com.apple.LoginUI"];
    v16 = (FBApplicationUpdateScenesTransaction *)[v14 initWithProcessIdentity:v15 executionContextProvider:&__block_literal_global_2];
    v35 = v10;
    sceneCreateTransaction = self->_sceneCreateTransaction;
    self->_sceneCreateTransaction = v16;

    v18 = self->_sceneCreateTransaction;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_2;
    v38[3] = &unk_1E6AF4CE8;
    objc_copyWeak(&v41, location);
    id v19 = v13;
    id v39 = v19;
    id v40 = v7;
    [(FBApplicationUpdateScenesTransaction *)v18 setCompletionBlock:v38];
    v20 = v8;
    v21 = [(SBLoginAppSceneHoster *)self hostedApp];
    v22 = [MEMORY[0x1E4F62420] mainIdentity];
    v23 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v21 sceneIdentity:v19 displayIdentity:v22];

    v24 = [SBDeviceApplicationSceneHandle alloc];
    v25 = [v23 application];
    v26 = [v23 sceneDefinition];
    v27 = [v23 displayIdentity];
    v28 = [(SBApplicationSceneHandle *)v24 _initWithApplication:v25 sceneDefinition:v26 displayIdentity:v27];
    sceneHandle = self->_sceneHandle;
    self->_sceneHandle = v28;

    v30 = (void *)MEMORY[0x1E4F629B8];
    v31 = [MEMORY[0x1E4FA7BD8] specification];
    v32 = [v30 parametersForSpecification:v31];

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_4;
    v37[3] = &unk_1E6AF4D10;
    v37[4] = self;
    v37[5] = a3;
    [v32 updateSettingsWithBlock:v37];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_5;
    v36[3] = &unk_1E6AF4D38;
    v36[4] = self;
    v36[5] = a3;
    [v32 updateClientSettingsWithBlock:v36];
    [(FBApplicationUpdateScenesTransaction *)self->_sceneCreateTransaction updateSceneWithIdentity:v19 parameters:v32 transitionContext:0];
    [(FBApplicationUpdateScenesTransaction *)self->_sceneCreateTransaction begin];
    int64_t v33 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle wallpaperStyle];
    v34 = +[SBWallpaperController sharedInstance];
    [v34 setWallpaperStyle:v33 forPriority:1 forVariant:1 withAnimationFactory:0];
    [v34 setWallpaperStyle:v33 forPriority:1 forVariant:0 withAnimationFactory:0];

    objc_destroyWeak(&v41);
    objc_destroyWeak(location);
  }
}

id __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F62440]);
  [v0 setLaunchIntent:4];
  return v0;
}

void __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_2(uint64_t a1, int a2)
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v18 = WeakRetained;
  if (a2)
  {
    objc_super v5 = [MEMORY[0x1E4F62490] sharedInstance];
    id v6 = [*(id *)(a1 + 32) identifier];
    v7 = [v5 sceneWithIdentifier:v6];

    if (!v7)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"-[SBLoginAppSceneHoster launchLoginAppWithInitialOrientation:completion:]_block_invoke_2"];
      [v16 handleFailureInFunction:v17 file:@"SBLoginAppSceneHoster.m" lineNumber:90 description:@"Must have a scene if the FBApplicationUpdateScenesTransaction was successful."];
    }
    [v7 addObserver:v18];
    v8 = [v7 uiPresentationManager];
    [v8 modifyDefaultPresentationContext:&__block_literal_global_14];

    objc_storeStrong(v18 + 1, v7);
    v9 = [v7 uiPresentationManager];
    uint64_t v10 = [v9 createPresenterWithIdentifier:@"default"];
    id v11 = v18[2];
    v18[2] = (id)v10;

    [v18[2] activate];
    [v18 _updateHIDEventDeferralsIfNecessary];
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
LABEL_10:
      v13();
    }
  }
  else
  {
    v7 = [WeakRetained[3] error];
    if (!v7)
    {
      v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SpringBoard.LoginAppSceneHoster" code:1 userInfo:0];
    }
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14)
    {
      v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_10;
    }
  }

  id v15 = v18[3];
  v18[3] = 0;
}

uint64_t __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setAppearanceStyle:2];
}

void __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 ignoreOcclusionReasons];
  [v3 addObject:@"LoginAppContainer"];

  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 _referenceBounds];
  objc_msgSend(v6, "setFrame:");

  objc_super v5 = [MEMORY[0x1E4F62420] mainConfiguration];
  [v6 setDisplayConfiguration:v5];

  [v6 setInterfaceOrientation:*(void *)(a1 + 40)];
  [v6 setForeground:1];
  [*(id *)(*(void *)(a1 + 32) + 40) _populateSettingsWithDefaultStatusBarHeight:v6];
}

void __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setInterfaceOrientation:v3];
  objc_msgSend(v4, "setBackgroundStyle:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "backgroundStyle"));
  [v4 setIdleTimerMode:1];
}

- (void)killLoginApp
{
  if (self->_scene)
  {
    uint64_t v3 = [MEMORY[0x1E4F62490] sharedInstance];
    id v4 = [(FBScene *)self->_scene identifier];
    [v3 destroyScene:v4 withTransitionContext:0];
  }
  [(SBLoginAppSceneHoster *)self _updateHIDEventDeferralsIfNecessary];
}

- (void)setDeferHIDEvents:(BOOL)a3
{
  if (self->_deferHIDEvents != a3)
  {
    self->_deferHIDEvents = a3;
    [(SBLoginAppSceneHoster *)self _updateHIDEventDeferralsIfNecessary];
  }
}

- (void)updateSettingsWithTransitionBlock:(id)a3
{
}

- (UIView)contentView
{
  return (UIView *)[(UIScenePresenter *)self->_scenePresenter presentationView];
}

- (NSString)hostedAppBundleID
{
  return (NSString *)@"com.apple.LoginUI";
}

- (NSString)hostedSceneIdentifier
{
  return (NSString *)[(FBScene *)self->_scene identifier];
}

- (SBApplication)hostedApp
{
  v2 = +[SBApplicationController sharedInstance];
  uint64_t v3 = [v2 applicationWithBundleIdentifier:@"com.apple.LoginUI"];

  return (SBApplication *)v3;
}

- (id)_appClientSettingsDiffInspector
{
  appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  if (!appClientSettingsDiffInspector)
  {
    id v4 = (SBSUILoginUISceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4FA7BD0]);
    objc_super v5 = self->_appClientSettingsDiffInspector;
    self->_appClientSettingsDiffInspector = v4;

    id v6 = self->_appClientSettingsDiffInspector;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_3;
    v26[3] = &unk_1E6AF4D88;
    v26[4] = self;
    v8 = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(v7, v26);
    [(SBSUILoginUISceneClientSettingsDiffInspector *)v6 observeBackgroundStyleWithBlock:v8];

    v9 = self->_appClientSettingsDiffInspector;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_5;
    v25[3] = &unk_1E6AF4D88;
    v25[4] = self;
    id v11 = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(v10, v25);
    [(SBSUILoginUISceneClientSettingsDiffInspector *)v9 observeIdleTimerModeWithBlock:v11];

    uint64_t v12 = self->_appClientSettingsDiffInspector;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_6;
    v24[3] = &unk_1E6AF4D88;
    v24[4] = self;
    uint64_t v14 = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(v13, v24);
    [(SBSUILoginUISceneClientSettingsDiffInspector *)v12 observeStatusBarUserNameOverrideWithBlock:v14];

    id v15 = self->_appClientSettingsDiffInspector;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_7;
    v23[3] = &unk_1E6AF4D88;
    v23[4] = self;
    v17 = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(v16, v23);
    [(SBSUILoginUISceneClientSettingsDiffInspector *)v15 observeRotationModeWithBlock:v17];

    v18 = self->_appClientSettingsDiffInspector;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_8;
    v22[3] = &unk_1E6AF4D88;
    v22[4] = self;
    v20 = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(v19, v22);
    [(SBSUILoginUISceneClientSettingsDiffInspector *)v18 observeWallpaperModeWithBlock:v20];

    appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  }
  return appClientSettingsDiffInspector;
}

id __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E6AF4D60;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)[v6 copy];

  return v4;
}

uint64_t __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_3(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_4;
  v4[3] = &unk_1E6AF4AC0;
  v4[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4F4F898] animateWithFactory:0 actions:v4];
  id v2 = +[SBWallpaperController sharedInstance];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) wallpaperStyle];
  [v2 setWallpaperStyle:v3 forPriority:1 forVariant:1 withAnimationFactory:0];
  [v2 setWallpaperStyle:v3 forPriority:1 forVariant:0 withAnimationFactory:0];
}

uint64_t __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) _noteMainSceneBackgroundStyleChanged];
}

void __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 delegate];
  id v4 = [v3 updatedClientSettings];

  objc_msgSend(v5, "sceneUpdatedIdleTimerMode:", objc_msgSend(v4, "idleTimerMode"));
}

void __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 delegate];
  id v4 = [v3 updatedClientSettings];

  id v5 = [v4 statusBarUserNameOverride];
  [v6 sceneUpdatedStatusBarUserName:v5];
}

void __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 delegate];
  id v4 = [v3 updatedClientSettings];

  objc_msgSend(v5, "sceneUpdatedRotationMode:", objc_msgSend(v4, "rotationMode"));
}

void __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 delegate];
  id v4 = [v3 updatedClientSettings];

  objc_msgSend(v5, "sceneUpdatedWallpaperMode:", objc_msgSend(v4, "wallpaperMode"));
}

- (void)_updateHIDEventDeferralsIfNecessary
{
  if (self->_deferHIDEvents != (self->_keyboardFocusRedirectAssertion != 0))
  {
    id v3 = +[SBMainWorkspace sharedInstance];
    id v14 = [v3 keyboardFocusController];

    id v4 = [(SBLoginAppSceneHoster *)self hostedAppBundleID];
    id v5 = [MEMORY[0x1E4F62448] sharedInstance];
    id v6 = [v5 processesForBundleIdentifier:v4];
    id v7 = [v6 firstObject];

    if (v7)
    {
      v8 = [v7 state];
      uint64_t v9 = [v8 pid];
    }
    else
    {
      uint64_t v9 = 0xFFFFFFFFLL;
    }
    if (self->_deferHIDEvents && (scene = self->_scene) != 0 && (v9 & 0x80000000) == 0)
    {
      id v11 = [(FBScene *)scene identityToken];
      uint64_t v12 = [v14 redirectSpringBoardLockFocusForReason:@"LoginWindow" toProcessidentifier:v9 toSceneIdentityToken:v11];
      keyboardFocusRedirectAssertion = self->_keyboardFocusRedirectAssertion;
      self->_keyboardFocusRedirectAssertion = v12;
    }
    else
    {
      [(BSInvalidatable *)self->_keyboardFocusRedirectAssertion invalidate];
      id v11 = self->_keyboardFocusRedirectAssertion;
      self->_keyboardFocusRedirectAssertion = 0;
    }
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8 = a4;
  id v9 = a3;
  id v21 = [v9 settings];
  uint64_t v10 = self;
  if (objc_opt_isKindOfClass()) {
    id v11 = v21;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = [v9 clientSettings];

  id v14 = self;
  if (objc_opt_isKindOfClass()) {
    id v15 = v13;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  v17 = objc_alloc_init(SBLoginAppClientSettingObserverContext);
  [(SBLoginAppClientSettingObserverContext *)v17 setSettings:v12];

  [(SBLoginAppClientSettingObserverContext *)v17 setUpdatedClientSettings:v16];
  if (!self->_appClientSettingsDiffInspector && v16)
  {
    v18 = [(SBLoginAppSceneHoster *)self delegate];
    objc_msgSend(v18, "sceneUpdatedIdleTimerMode:", objc_msgSend(v16, "idleTimerMode"));
    uint64_t v19 = [v16 statusBarUserNameOverride];
    [v18 sceneUpdatedStatusBarUserName:v19];

    objc_msgSend(v18, "sceneUpdatedRotationMode:", objc_msgSend(v16, "rotationMode"));
    objc_msgSend(v18, "sceneUpdatedWallpaperMode:", objc_msgSend(v16, "wallpaperMode"));
  }
  v20 = [(SBLoginAppSceneHoster *)self _appClientSettingsDiffInspector];
  [v20 inspectDiff:v8 withContext:v17];
}

- (void)sceneDidInvalidate:(id)a3
{
  [(UIScenePresenter *)self->_scenePresenter invalidate];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  scene = self->_scene;
  self->_scene = 0;

  id v7 = +[SBWallpaperController sharedInstance];
  [v7 removeWallpaperStyleForPriority:1 forVariant:1 withAnimationFactory:0];
  [v7 removeWallpaperStyleForPriority:1 forVariant:0 withAnimationFactory:0];
  id v6 = [(SBLoginAppSceneHoster *)self delegate];
  [v6 sceneInvalidated];
}

- (BOOL)deferHIDEvents
{
  return self->_deferHIDEvents;
}

- (SBLoginAppSceneHosterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLoginAppSceneHosterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyboardFocusRedirectAssertion, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_sceneCreateTransaction, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end