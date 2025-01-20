@interface SBTraitsPipelineManager
- (BOOL)supportsLiveDeviceRotation;
- (SBTraitsPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5;
- (SBTraitsPipelineManager)initWithUserInterfaceStyleProvider:(id)a3;
- (SBUserInterfaceStyleProvider)userInterfaceStyleProvider;
- (SBWindowSceneDelegate)sceneDelegate;
- (TRAArbiter)arbiter;
- (TRAArbitrationInputs)inputs;
- (UIKBArbiterClientFocusContext)keyboardFocusContext;
- (id)ambientPresentationStageRoles;
- (id)defaultOrientationAnimationSettingsAnimatable:(BOOL)a3;
- (id)newBlockBasedOrientationPolicySpecifier:(id)a3 forParticipant:(id)a4;
- (id)newBlockBasedOrientationPolicySpecifier:(id)a3 forRole:(id)a4;
- (id)orientationStageRoles;
- (id)userInterfaceStyleStageRoles;
- (id)zOrderStageRoles;
- (void)setArbiter:(id)a3;
- (void)setKeyboardFocusContext:(id)a3;
- (void)setSceneDelegate:(id)a3;
- (void)setupDefaultPipelineForArbiter:(id)a3;
- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4;
@end

@implementation SBTraitsPipelineManager

- (id)defaultOrientationAnimationSettingsAnimatable:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_medusaSettings)
  {
    v5 = +[SBMedusaDomain rootSettings];
    v6 = [v5 medusa1oSettings];
    medusaSettings = self->_medusaSettings;
    self->_medusaSettings = v6;
  }
  v8 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  double v10 = dbl_1D8FD1390[(v9 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  [(SBMedusa1oSettings *)self->_medusaSettings rotationSlowdownFactor];
  double v12 = v10 * v11;
  if (v3) {
    double v13 = v12;
  }
  else {
    double v13 = 0.0;
  }
  v14 = (void *)MEMORY[0x1E4F4F680];
  v15 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  v16 = [v14 settingsWithDuration:v15 delay:v13 timingFunction:0.0];

  return v16;
}

- (TRAArbiter)arbiter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  return (TRAArbiter *)WeakRetained;
}

- (SBTraitsPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBTraitsPipelineManager.m", 21, @"Invalid parameter not satisfying: %@", @"userInterfaceStyleProvider" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)SBTraitsPipelineManager;
  double v12 = [(SBTraitsPipelineManager *)&v16 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_arbiter, v9);
    objc_storeWeak((id *)&v13->_sceneDelegate, v10);
    objc_storeStrong((id *)&v13->_userInterfaceStyleProvider, a5);
  }

  return v13;
}

- (SBTraitsPipelineManager)initWithUserInterfaceStyleProvider:(id)a3
{
  return [(SBTraitsPipelineManager *)self initWithArbiter:0 sceneDelegate:0 userInterfaceStyleProvider:a3];
}

- (id)newBlockBasedOrientationPolicySpecifier:(id)a3 forRole:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [SBTraitsPipelineBlockBasedPolicySpecifier alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  id v10 = [(SBTraitsPipelineBlockBasedPolicySpecifier *)v8 initWithPolicySpecifierBlock:v7 specifierDescription:v6 componentOrder:&unk_1F3349E48 arbiter:WeakRetained];

  return v10;
}

- (id)newBlockBasedOrientationPolicySpecifier:(id)a3 forParticipant:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [SBTraitsPipelineBlockBasedPolicySpecifier alloc];
  id v9 = [v6 role];
  id v10 = NSNumber;
  [v6 currentZOrderLevel];
  double v12 = v11;

  double v13 = [v10 numberWithDouble:v12];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  v15 = [(SBTraitsPipelineBlockBasedPolicySpecifier *)v8 initWithPolicySpecifierBlock:v7 specifierDescription:v9 componentOrder:v13 arbiter:WeakRetained];

  return v15;
}

- (BOOL)supportsLiveDeviceRotation
{
  return 0;
}

- (SBUserInterfaceStyleProvider)userInterfaceStyleProvider
{
  return self->_userInterfaceStyleProvider;
}

- (void)setArbiter:(id)a3
{
}

- (SBWindowSceneDelegate)sceneDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  return (SBWindowSceneDelegate *)WeakRetained;
}

- (void)setSceneDelegate:(id)a3
{
}

- (UIKBArbiterClientFocusContext)keyboardFocusContext
{
  return self->_keyboardFocusContext;
}

- (void)setKeyboardFocusContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardFocusContext, 0);
  objc_destroyWeak((id *)&self->_sceneDelegate);
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong((id *)&self->_userInterfaceStyleProvider, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
}

- (void)setupDefaultPipelineForArbiter:(id)a3
{
  OUTLINED_FUNCTION_1_13();
  NSRequestConcreteImplementation();
}

- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4
{
  OUTLINED_FUNCTION_1_13();
  NSRequestConcreteImplementation();
}

- (TRAArbitrationInputs)inputs
{
  return 0;
}

- (id)zOrderStageRoles
{
  return 0;
}

- (id)orientationStageRoles
{
  return 0;
}

- (id)ambientPresentationStageRoles
{
  return 0;
}

- (id)userInterfaceStyleStageRoles
{
  return 0;
}

@end