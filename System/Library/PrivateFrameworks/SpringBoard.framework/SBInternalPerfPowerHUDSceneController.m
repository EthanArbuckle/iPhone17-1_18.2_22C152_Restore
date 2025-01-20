@interface SBInternalPerfPowerHUDSceneController
+ (id)_setupInfo;
- (BOOL)registeredBacklightSceneProvider;
- (FBScene)backlightParticipantScene;
- (id)_newSceneControllerForWindowScene:(id)a3 sceneRequestOptions:(id)a4 traitsRole:(id)a5 level:(double)a6;
- (id)scenesForBacklightSession;
- (void)_configureBacklightEnvironmentSceneProviderIfNecessary;
- (void)setBacklightParticipantScene:(id)a3;
- (void)setRegisteredBacklightSceneProvider:(BOOL)a3;
- (void)windowSceneDidConnect:(id)a3;
- (void)windowSceneDidDisconnect:(id)a3;
@end

@implementation SBInternalPerfPowerHUDSceneController

- (id)scenesForBacklightSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backlightParticipantScene);
  if ([WeakRetained isValid]) {
    [MEMORY[0x1E4F1CAD0] setWithObject:WeakRetained];
  }
  else {
  v3 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v3;
}

- (void)_configureBacklightEnvironmentSceneProviderIfNecessary
{
  if (!self->_registeredBacklightSceneProvider)
  {
    v3 = [(id)SBApp backlightEnvironmentSessionProvider];
    [v3 registerBacklightEnvironmentSceneProvider:self];

    self->_registeredBacklightSceneProvider = 1;
  }
}

- (void)windowSceneDidConnect:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backlightParticipantScene);

  if (!WeakRetained)
  {
    id v5 = [(SBSystemUISceneController *)self _newAppSceneRequestOptionsForWindowScene:v6 withBlueprintOptions:0];
  }
  [(SBInternalPerfPowerHUDSceneController *)self _configureBacklightEnvironmentSceneProviderIfNecessary];
}

- (void)windowSceneDidDisconnect:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBInternalPerfPowerHUDSceneController;
  [(SBSystemUISceneController *)&v5 windowSceneDidDisconnect:a3];
  objc_storeWeak((id *)&self->_backlightParticipantScene, 0);
  v4 = [(id)SBApp backlightEnvironmentSessionProvider];
  [v4 unregisterBacklightEnvironmentSceneProvider:self];

  self->_registeredBacklightSceneProvider = 0;
}

+ (id)_setupInfo
{
  v6[7] = *MEMORY[0x1E4F143B8];
  v5[0] = @"class";
  v6[0] = objc_opt_class();
  v6[1] = MEMORY[0x1E4F1CC38];
  v5[1] = @"enabled";
  v5[2] = @"jobLabel";
  v6[2] = @"com.apple.internal.PerfPowerHUD";
  v6[3] = @"SBTraitsParticipantRoleInternalPerfPowerHUD";
  v5[3] = @"traitsRole";
  v5[4] = @"hostLevel";
  v2 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43CF8] + 260.0];
  v6[4] = v2;
  v6[5] = &unk_1F3349DB8;
  v5[5] = @"vendingStrategy";
  v5[6] = @"workspaceID";
  v6[6] = @"com.apple.SpringBoard.SceneWorkspace.InternalPerfPowerHUD";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];

  return v3;
}

- (id)_newSceneControllerForWindowScene:(id)a3 sceneRequestOptions:(id)a4 traitsRole:(id)a5 level:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)SBInternalPerfPowerHUDSceneController;
  id v7 = [(SBSystemUISceneController *)&v11 _newSceneControllerForWindowScene:a3 sceneRequestOptions:a4 traitsRole:a5 level:a6];
  v8 = [v7 scene];
  objc_storeWeak((id *)&self->_backlightParticipantScene, v8);

  v9 = [(id)SBApp backlightEnvironmentSessionProvider];
  [v9 invalidateBacklightScenesForProvider:self];

  return v7;
}

- (BOOL)registeredBacklightSceneProvider
{
  return self->_registeredBacklightSceneProvider;
}

- (void)setRegisteredBacklightSceneProvider:(BOOL)a3
{
  self->_registeredBacklightSceneProvider = a3;
}

- (FBScene)backlightParticipantScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backlightParticipantScene);
  return (FBScene *)WeakRetained;
}

- (void)setBacklightParticipantScene:(id)a3
{
}

- (void).cxx_destruct
{
}

@end