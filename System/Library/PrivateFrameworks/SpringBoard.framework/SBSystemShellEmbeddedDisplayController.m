@interface SBSystemShellEmbeddedDisplayController
- (SBSystemShellEmbeddedDisplayController)initWithAppSwitcherDefaults:(id)a3 sceneManager:(id)a4 initialOrientation:(int64_t)a5;
- (id)_createSystemShellSceneWithOrientation:(int64_t)a3;
- (id)displayControllerInfoForConnectingDisplay:(id)a3 configuration:(id)a4;
- (void)_updateDisplayAssertionPreferences;
- (void)_updateSceneSettings;
- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayManager:(id)a5 sceneManager:(id)a6 caDisplayQueue:(id)a7 assertion:(id)a8;
- (void)dealloc;
- (void)displayAssertion:(id)a3 didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a4;
- (void)displayAssertion:(id)a3 didReceiveNewDeactivationReasons:(unint64_t)a4;
- (void)displayAssertionDidGainControlOfDisplay:(id)a3;
- (void)displayAssertionDidInvalidate:(id)a3;
- (void)displayIdentityDidDisconnect:(id)a3;
@end

@implementation SBSystemShellEmbeddedDisplayController

- (SBSystemShellEmbeddedDisplayController)initWithAppSwitcherDefaults:(id)a3 sceneManager:(id)a4 initialOrientation:(int64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBSystemShellEmbeddedDisplayController.m", 42, @"Invalid parameter not satisfying: %@", @"appSwitcherDefaults" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SBSystemShellEmbeddedDisplayController.m", 43, @"Invalid parameter not satisfying: %@", @"sceneManager" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)SBSystemShellEmbeddedDisplayController;
  v13 = [(SBSystemShellEmbeddedDisplayController *)&v26 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_appSwitcherDefaults, a3);
    objc_storeStrong((id *)&v14->_sceneManager, a4);
    v14->_initialOrientation = a5;
    objc_initWeak(&location, v14);
    appSwitcherDefaults = v14->_appSwitcherDefaults;
    v16 = [NSString stringWithUTF8String:"chamoisWindowingEnabled"];
    uint64_t v17 = MEMORY[0x1E4F14428];
    id v18 = MEMORY[0x1E4F14428];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __102__SBSystemShellEmbeddedDisplayController_initWithAppSwitcherDefaults_sceneManager_initialOrientation___block_invoke;
    v23[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v24, &location);
    id v19 = (id)[(SBAppSwitcherDefaults *)appSwitcherDefaults observeDefault:v16 onQueue:v17 withBlock:v23];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __102__SBSystemShellEmbeddedDisplayController_initWithAppSwitcherDefaults_sceneManager_initialOrientation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateDisplayAssertionPreferences];
    [v2 _updateSceneSettings];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  [(SBDisplayAssertion *)self->_displayAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemShellEmbeddedDisplayController;
  [(SBSystemShellEmbeddedDisplayController *)&v3 dealloc];
}

- (id)displayControllerInfoForConnectingDisplay:(id)a3 configuration:(id)a4
{
  if ([a3 isMainRootDisplay]) {
    v5 = [[SBDisplayControllerInfo alloc] initWithController:self windowingMode:1 priorityLevel:2 deactivationReasons:0];
  }
  else {
    v5 = 0;
  }
  return v5;
}

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayManager:(id)a5 sceneManager:(id)a6 caDisplayQueue:(id)a7 assertion:(id)a8
{
  id v27 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = (SBSceneManager *)a6;
  id v18 = a7;
  id v19 = (SBDisplayAssertion *)a8;
  if (self->_displayConfiguration)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SBSystemShellEmbeddedDisplayController.m", 85, @"embedded display controller connecting twice to a display. already connected to: %@", self->_displayConfiguration object file lineNumber description];
  }
  if (([v15 isMainRootDisplay] & 1) == 0)
  {
    objc_super v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SBSystemShellEmbeddedDisplayController.m", 86, @"Invalid parameter not satisfying: %@", @"[displayConfiguration isMainRootDisplay]" object file lineNumber description];
  }
  displayConfiguration = self->_displayConfiguration;
  self->_displayConfiguration = (FBSDisplayConfiguration *)v15;
  id v21 = v15;

  displayAssertion = self->_displayAssertion;
  self->_displayAssertion = v19;
  v23 = v19;

  sbSceneManager = self->_sbSceneManager;
  self->_sbSceneManager = v17;

  [(SBSystemShellEmbeddedDisplayController *)self _updateDisplayAssertionPreferences];
}

- (void)displayIdentityDidDisconnect:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"SBSystemShellEmbeddedDisplayController.m" lineNumber:101 description:@"told the embedded display disconnected. whoa."];
}

- (void)displayAssertionDidInvalidate:(id)a3
{
  if (![(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay])
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBSystemShellEmbeddedDisplayController.m" lineNumber:107 description:@"embedded display controller's assertion was invalidated."];
  }
}

- (void)displayAssertionDidGainControlOfDisplay:(id)a3
{
  id v11 = a3;
  if (self->_scene)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBSystemShellEmbeddedDisplayController.m" lineNumber:111 description:@"embedded display controller's assertion was activated multiple times"];
  }
  id v5 = [(SBSystemShellEmbeddedDisplayController *)self _createSystemShellSceneWithOrientation:self->_initialOrientation];
  scene = self->_scene;
  self->_scene = v5;

  v7 = [(FBScene *)self->_scene systemShellHostingEnvironment];
  v8 = SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration();
  [v7 setSystemShellHostingSpaceIdentifier:v8];

  if (!self->_scene)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBSystemShellEmbeddedDisplayController.m" lineNumber:114 description:@"failed to create system shell scene for embedded display"];
  }
}

- (void)displayAssertion:(id)a3 didReceiveNewDeactivationReasons:(unint64_t)a4
{
  if (![(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBSystemShellEmbeddedDisplayController.m" lineNumber:118 description:@"embedded display controller's assertion was deactivated somehow."];
  }
}

- (void)displayAssertion:(id)a3 didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a4
{
  if (![(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBSystemShellEmbeddedDisplayController.m" lineNumber:122 description:@"embedded display controller's assertion was deactivated somehow."];
  }
}

- (id)_createSystemShellSceneWithOrientation:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F629B0] definition];
  id v6 = (void *)MEMORY[0x1E4F62A60];
  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 bundleIdentifier];
  v9 = [v6 identityForIdentifier:v8];
  [v5 setIdentity:v9];

  id v10 = [FBSSceneClientIdentity localIdentity];
  [v5 setClientIdentity:v10];

  id v11 = +[FBSSceneSpecification specification];
  [v5 setSpecification:v11];

  v12 = (void *)MEMORY[0x1E4F629B8];
  v13 = [v5 specification];
  v14 = [v12 parametersForSpecification:v13];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__SBSystemShellEmbeddedDisplayController__createSystemShellSceneWithOrientation___block_invoke;
  v18[3] = &unk_1E6AF8858;
  v18[4] = self;
  [v14 updateSettingsWithBlock:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__SBSystemShellEmbeddedDisplayController__createSystemShellSceneWithOrientation___block_invoke_2;
  v17[3] = &__block_descriptor_40_e39_v16__0__FBSMutableSceneClientSettings_8l;
  v17[4] = a3;
  [v14 updateClientSettingsWithBlock:v17];
  id v15 = [(FBSceneManager *)self->_sceneManager createSceneWithDefinition:v5 initialParameters:v14];

  return v15;
}

void __81__SBSystemShellEmbeddedDisplayController__createSystemShellSceneWithOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  [v10 setDisplayConfiguration:*(void *)(*(void *)(a1 + 32) + 40)];
  [*(id *)(*(void *)(a1 + 32) + 40) bounds];
  objc_msgSend(v10, "setFrame:");
  [v10 setLevel:0.0];
  [v10 setForeground:1];
  [v10 setInterfaceOrientation:1];
  if ([v10 isUISubclass])
  {
    id v3 = v10;
    [v3 setTargetOfEventDeferringEnvironments:0];
    [v3 setInterfaceOrientationMode:100];
    v4 = (void *)SBApp;
    id v5 = [*(id *)(*(void *)(a1 + 32) + 40) identity];
    id v6 = [v4 userInterfaceStyleProviderForDisplay:v5];
    objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v6, "currentStyle"));

    v7 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
    objc_msgSend(v7, "sb_applyDisplayEdgeInfoToSceneSettings:", v3);
    objc_msgSend(v3, "setEnhancedWindowingEnabled:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "chamoisWindowingEnabled"));
  }
  v8 = [v10 ignoreOcclusionReasons];
  [v8 addObject:@"SystemApp"];

  v9 = [v10 transientLocalSettings];
  [v9 setObject:*(void *)(*(void *)(a1 + 32) + 24) forSetting:4444];
}

void __81__SBSystemShellEmbeddedDisplayController__createSystemShellSceneWithOrientation___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isUISubclass])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = v5;
    [v4 setInterfaceOrientation:v3];
    [v4 setStatusBarStyle:0];
  }
}

- (void)_updateDisplayAssertionPreferences
{
  v9 = objc_alloc_init(SBDisplayAssertionPreferences);
  [(SBDisplayAssertionPreferences *)v9 setWantsControlOfDisplay:1];
  if ([(SBAppSwitcherDefaults *)self->_appSwitcherDefaults chamoisWindowingEnabled])uint64_t v4 = 3; {
  else
  }
    uint64_t v4 = 2;
  id v5 = [MEMORY[0x1E4F39B60] mainDisplay];
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBSystemShellEmbeddedDisplayController.m" lineNumber:178 description:@"-[CADisplay mainDisplay] returned nil. All's bad with the world."];
  }
  id v6 = +[SBDisplayPowerLogEntry forDisplay:self->_displayConfiguration mode:v4 zoom:0];
  [(SBDisplayAssertionPreferences *)v9 setPowerLogEntry:v6];
  [(SBDisplayAssertion *)self->_displayAssertion updateWithPreferences:v9];
  if (![(SBDisplayAssertion *)self->_displayAssertion hasControlOfDisplay])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBSystemShellEmbeddedDisplayController.m" lineNumber:185 description:@"embedded display controller failed to gain control of display"];
  }
}

- (void)_updateSceneSettings
{
  char v3 = [(SBAppSwitcherDefaults *)self->_appSwitcherDefaults chamoisWindowingEnabled];
  scene = self->_scene;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SBSystemShellEmbeddedDisplayController__updateSceneSettings__block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  char v6 = v3;
  [(FBScene *)scene updateSettingsWithBlock:v5];
}

void __62__SBSystemShellEmbeddedDisplayController__updateSceneSettings__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isUISubclass]) {
    [v3 setEnhancedWindowingEnabled:*(unsigned __int8 *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAssertion, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sbSceneManager, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
}

@end