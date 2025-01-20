@interface SBTraitsExternalDisplayPipelineManager
- (BOOL)supportsLiveDeviceRotation;
- (SBTraitsExternalDisplayPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5;
- (TRAArbitrationInputs)inputs;
- (id)ambientPresentationStageRoles;
- (id)orientationStageRoles;
- (id)userInterfaceStyleStageRoles;
- (id)zOrderStageRoles;
- (void)_noteInputsNeedUpdateWithAnimationSettings:(id)a3 fence:(id)a4 reason:(id)a5;
- (void)_updateInputsForCurrentUserInterfaceStyle;
- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4;
- (void)setupDefaultPipelineForArbiter:(id)a3;
- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4;
- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4;
@end

@implementation SBTraitsExternalDisplayPipelineManager

- (SBTraitsExternalDisplayPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsExternalDisplayPipelineManager;
  v5 = [(SBTraitsPipelineManager *)&v9 initWithArbiter:a3 sceneDelegate:a4 userInterfaceStyleProvider:a5];
  if (v5)
  {
    v6 = objc_alloc_init(SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider);
    rolesAndDefaultPoliciesProvider = v5->_rolesAndDefaultPoliciesProvider;
    v5->_rolesAndDefaultPoliciesProvider = v6;
  }
  return v5;
}

- (void)setupDefaultPipelineForArbiter:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v21 = [v4 inputsValidationStage];
    v5 = [(SBTraitsInputsValidator *)[SBTraitsInputsAllUnknownOrientationValidator alloc] initWithValidatorOrder:&unk_1F334A088];
    [v21 addInputsValidator:v5 update:0];

    v6 = [v4 zOrderResolutionStage];
    v7 = [(SBTraitsZOrderStageComponent *)[SBTraitsZOrderDefaultResolver alloc] initWithComponentOrder:&unk_1F334A088];
    [v6 addStageResolver:v7];

    v8 = [v4 orientationResolutionStage];
    objc_super v9 = [[SBTraitsOrientationDefaultResolutionPolicySpecifier alloc] initWithComponentOrder:&unk_1F334A088 dataSource:self->_rolesAndDefaultPoliciesProvider];
    [v8 addResolutionPolicySpecifier:v9 update:0];

    v10 = [(SBTraitsOrientationStageComponent *)[SBTraitsOrientationDefaultTreeNodesSpecifier alloc] initWithComponentOrder:&unk_1F334A088];
    [v8 addNodesSpecificationsSpecifier:v10];

    v11 = [[SBTraitsOrientationDefaultTreeResolver alloc] initWithComponentOrder:&unk_1F334A088];
    [v8 addStageResolver:v11];

    v12 = [v4 userInterfaceStyleResolutionStage];
    v13 = [(SBTraitsUserInterfaceStyleStageComponent *)[SBTraitsUserInterfaceStyleDefaultResolver alloc] initWithComponentOrder:&unk_1F334A088];
    [v12 addStageResolver:v13];

    v14 = [v4 acquireParticipantWithRole:@"SBTraitsParticipantRolePipelineManager" delegate:self];

    activeOrientationParticipant = self->_activeOrientationParticipant;
    self->_activeOrientationParticipant = v14;

    v16 = self->_activeOrientationParticipant;
    v17 = NSString;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = [v17 stringWithFormat:@"%@-Setup", v19];
    [(TRAParticipant *)v16 setNeedsUpdatePreferencesWithReason:v20];

    [(TRAParticipant *)self->_activeOrientationParticipant updatePreferencesIfNeeded];
  }
}

- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SBTraitsExternalDisplayPipelineManager *)self _updateInputsForCurrentUserInterfaceStyle];
  [(SBTraitsExternalDisplayPipelineManager *)self _noteInputsNeedUpdateWithAnimationSettings:v7 fence:v6 reason:@"User Interface Style Update"];
}

- (BOOL)supportsLiveDeviceRotation
{
  return 0;
}

- (TRAArbitrationInputs)inputs
{
  inputs = self->_inputs;
  if (!inputs)
  {
    id v4 = [(SBTraitsPipelineManager *)self sceneDelegate];
    v5 = [v4 windowScene];
    uint64_t v6 = [v5 interfaceOrientation];

    id v7 = objc_alloc(MEMORY[0x1E4FAFF98]);
    v8 = [MEMORY[0x1E4F42948] currentDevice];
    objc_super v9 = objc_msgSend(v7, "initWithIsPad:", objc_msgSend(v8, "userInterfaceIdiom") == 1);

    v10 = (void *)[objc_alloc(MEMORY[0x1E4FAFF88]) initWithCurrentDeviceOrientation:v6 nonFlatDeviceOrientation:v6];
    id v11 = objc_alloc(MEMORY[0x1E4FAFFA8]);
    v12 = [(SBTraitsPipelineManager *)self userInterfaceStyleProvider];
    v13 = objc_msgSend(v11, "initWithUserInterfaceStyle:", objc_msgSend(v12, "currentStyle"));

    v14 = (TRAArbitrationInputs *)[objc_alloc(MEMORY[0x1E4FAFF90]) initWithInterfaceIdiomInputs:v9 userInterfaceStyleInputs:v13 deviceOrientationInputs:v10 keyboardInputs:0 ambientPresentationInputs:0];
    v15 = self->_inputs;
    self->_inputs = v14;

    inputs = self->_inputs;
  }
  return inputs;
}

- (id)zOrderStageRoles
{
  return [(SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider orientationStageRoles];
}

- (id)orientationStageRoles
{
  return [(SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider orientationStageRoles];
}

- (id)ambientPresentationStageRoles
{
  return [(SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider ambientPresentationStageRoles];
}

- (id)userInterfaceStyleStageRoles
{
  return [(SBTraitsExternalDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider userInterfaceStyleStageRoles];
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v4 = a4;
  [v4 updateZOrderLevelPreferencesWithBlock:&__block_literal_global_149];
  [v4 updateOrientationPreferencesWithBlock:&__block_literal_global_20_0];
}

uint64_t __82__SBTraitsExternalDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredZOrderLevel:1.79769313e308];
}

uint64_t __82__SBTraitsExternalDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSupportedOrientations:30];
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  id v11 = a3;
  v5 = [v11 role];
  int v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

  if (v6)
  {
    uint64_t v7 = [v11 currentOrientation];
    if (v7 != [v11 previousOrientation])
    {
      v8 = [(SBTraitsPipelineManager *)self sceneDelegate];
      objc_super v9 = [v8 windowScene];
      v10 = [v9 displayLayoutPublisher];
      [v10 setInterfaceOrientation:v7];
    }
  }
}

- (void)_updateInputsForCurrentUserInterfaceStyle
{
  id v3 = objc_alloc(MEMORY[0x1E4FAFFA8]);
  id v4 = [(SBTraitsPipelineManager *)self userInterfaceStyleProvider];
  id v12 = (id)objc_msgSend(v3, "initWithUserInterfaceStyle:", objc_msgSend(v4, "currentStyle"));

  id v5 = objc_alloc(MEMORY[0x1E4FAFF90]);
  int v6 = [(TRAArbitrationInputs *)self->_inputs interfaceIdiomInputs];
  uint64_t v7 = [(TRAArbitrationInputs *)self->_inputs deviceOrientationInputs];
  v8 = [(TRAArbitrationInputs *)self->_inputs keyboardInputs];
  objc_super v9 = [(TRAArbitrationInputs *)self->_inputs ambientPresentationInputs];
  v10 = (TRAArbitrationInputs *)[v5 initWithInterfaceIdiomInputs:v6 userInterfaceStyleInputs:v12 deviceOrientationInputs:v7 keyboardInputs:v8 ambientPresentationInputs:v9];
  inputs = self->_inputs;
  self->_inputs = v10;
}

- (void)_noteInputsNeedUpdateWithAnimationSettings:(id)a3 fence:(id)a4 reason:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(SBTraitsPipelineManager *)self arbiter];
  id v13 = objc_alloc(MEMORY[0x1E4FAFF78]);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __98__SBTraitsExternalDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke;
  id v21 = &unk_1E6B004E0;
  id v22 = v9;
  id v23 = v10;
  id v24 = v11;
  SEL v25 = a2;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  v17 = (void *)[v13 initWithBuilder:&v18];
  objc_msgSend(v12, "setNeedsUpdateArbitrationWithContext:", v17, v18, v19, v20, v21);
}

void __98__SBTraitsExternalDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[ExternalPipeline] %{public}@ updating inputs with animation settings: %{public}@ fence: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FAFFC8]) initWithAnimationSettings:*(void *)(a1 + 32) drawingFence:*(void *)(a1 + 40)];
  [v3 setOrientationActuationContext:v8];
  [v3 setUserInterfaceStyleActuationContext:v8];
  [v3 setReason:*(void *)(a1 + 48)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeOrientationParticipant, 0);
  objc_storeStrong((id *)&self->_rolesAndDefaultPoliciesProvider, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end