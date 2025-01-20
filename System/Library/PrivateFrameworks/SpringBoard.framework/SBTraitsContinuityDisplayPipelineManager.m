@interface SBTraitsContinuityDisplayPipelineManager
- (BOOL)supportsLiveDeviceRotation;
- (SBTraitsContinuityDisplayPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5;
- (TRAArbitrationInputs)inputs;
- (id)ambientPresentationStageRoles;
- (id)orientationStageRoles;
- (id)userInterfaceStyleStageRoles;
- (id)zOrderStageRoles;
- (void)_noteInputsNeedUpdateWithAnimationSettings:(id)a3 fence:(id)a4 reason:(id)a5;
- (void)_updateInputsForCurrentUserInterfaceStyle;
- (void)_updateInputsForDeviceOrientation:(int64_t)a3;
- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setupDefaultPipelineForArbiter:(id)a3;
- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4;
- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4;
@end

@implementation SBTraitsContinuityDisplayPipelineManager

- (SBTraitsContinuityDisplayPipelineManager)initWithArbiter:(id)a3 sceneDelegate:(id)a4 userInterfaceStyleProvider:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsContinuityDisplayPipelineManager;
  v5 = [(SBTraitsPipelineManager *)&v9 initWithArbiter:a3 sceneDelegate:a4 userInterfaceStyleProvider:a5];
  if (v5)
  {
    v6 = objc_alloc_init(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider);
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
    id v23 = [v4 inputsValidationStage];
    v5 = [(SBTraitsInputsValidator *)[SBTraitsInputsAllUnknownOrientationValidator alloc] initWithValidatorOrder:&unk_1F334AE80];
    [v23 addInputsValidator:v5 update:0];

    v6 = [v4 zOrderResolutionStage];
    v7 = [(SBTraitsZOrderStageComponent *)[SBTraitsZOrderDefaultResolver alloc] initWithComponentOrder:&unk_1F334AE80];
    [v6 addStageResolver:v7];

    v8 = [v4 orientationResolutionStage];
    objc_super v9 = [[SBTraitsOrientationDefaultResolutionPolicySpecifier alloc] initWithComponentOrder:&unk_1F334AE80 dataSource:self->_rolesAndDefaultPoliciesProvider];
    [v8 addResolutionPolicySpecifier:v9 update:0];

    v10 = [(SBTraitsOrientationStageComponent *)[SBTraitsOrientationDefaultTreeNodesSpecifier alloc] initWithComponentOrder:&unk_1F334AE80];
    [v8 addNodesSpecificationsSpecifier:v10];

    v11 = [(SBTraitsOrientationStageComponent *)[SBTraitsOrientationSupportTreeNodesSpecifier alloc] initWithComponentOrder:&unk_1F334AE98];
    orientationTreeNodesSpecifier = self->_orientationTreeNodesSpecifier;
    self->_orientationTreeNodesSpecifier = v11;

    [v8 addNodesSpecificationsSpecifier:self->_orientationTreeNodesSpecifier];
    v13 = [[SBTraitsOrientationDefaultTreeResolver alloc] initWithComponentOrder:&unk_1F334AE80];
    [v8 addStageResolver:v13];

    v14 = [v4 userInterfaceStyleResolutionStage];
    v15 = [(SBTraitsUserInterfaceStyleStageComponent *)[SBTraitsUserInterfaceStyleDefaultResolver alloc] initWithComponentOrder:&unk_1F334AE80];
    [v14 addStageResolver:v15];

    v16 = [v4 acquireParticipantWithRole:@"SBTraitsParticipantRolePipelineManager" delegate:self];

    activeOrientationParticipant = self->_activeOrientationParticipant;
    self->_activeOrientationParticipant = v16;

    v18 = self->_activeOrientationParticipant;
    v19 = NSString;
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    v22 = [v19 stringWithFormat:@"%@-Setup", v21];
    [(TRAParticipant *)v18 setNeedsUpdatePreferencesWithReason:v22];

    [(TRAParticipant *)self->_activeOrientationParticipant updatePreferencesIfNeeded];
  }
}

- (void)userInterfaceStyleDidUpdateWithAnimationSettings:(id)a3 fence:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SBTraitsContinuityDisplayPipelineManager *)self _updateInputsForCurrentUserInterfaceStyle];
  [(SBTraitsContinuityDisplayPipelineManager *)self _noteInputsNeedUpdateWithAnimationSettings:v7 fence:v6 reason:@"User Interface Style Update"];
}

- (BOOL)supportsLiveDeviceRotation
{
  return 1;
}

- (TRAArbitrationInputs)inputs
{
  inputs = self->_inputs;
  if (!inputs)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FAFF98]);
    v5 = [MEMORY[0x1E4F42948] currentDevice];
    id v6 = objc_msgSend(v4, "initWithIsPad:", objc_msgSend(v5, "userInterfaceIdiom") == 1);

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FAFF88]) initWithCurrentDeviceOrientation:1 nonFlatDeviceOrientation:1];
    id v8 = objc_alloc(MEMORY[0x1E4FAFFA8]);
    objc_super v9 = [(SBTraitsPipelineManager *)self userInterfaceStyleProvider];
    v10 = objc_msgSend(v8, "initWithUserInterfaceStyle:", objc_msgSend(v9, "currentStyle"));

    v11 = (TRAArbitrationInputs *)[objc_alloc(MEMORY[0x1E4FAFF90]) initWithInterfaceIdiomInputs:v6 userInterfaceStyleInputs:v10 deviceOrientationInputs:v7 keyboardInputs:0 ambientPresentationInputs:0];
    v12 = self->_inputs;
    self->_inputs = v11;

    inputs = self->_inputs;
  }
  return inputs;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  if (self->_currentDeviceOrientation != a3)
  {
    self->_currentDeviceOrientation = a3;
    -[SBTraitsContinuityDisplayPipelineManager _updateInputsForDeviceOrientation:](self, "_updateInputsForDeviceOrientation:");
    id v4 = [(SBTraitsPipelineManager *)self defaultOrientationAnimationSettingsAnimatable:1];
    [(SBTraitsContinuityDisplayPipelineManager *)self _noteInputsNeedUpdateWithAnimationSettings:v4 fence:0 reason:@"Device orientation update"];
  }
}

- (id)zOrderStageRoles
{
  return [(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider orientationStageRoles];
}

- (id)orientationStageRoles
{
  return [(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider orientationStageRoles];
}

- (id)ambientPresentationStageRoles
{
  return [(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider ambientPresentationStageRoles];
}

- (id)userInterfaceStyleStageRoles
{
  return [(SBTraitsEmbeddedDisplayRolesAndDefaultPoliciesProvider *)self->_rolesAndDefaultPoliciesProvider userInterfaceStyleStageRoles];
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v4 = a4;
  [v4 updateZOrderLevelPreferencesWithBlock:&__block_literal_global_312];
  [v4 updateOrientationPreferencesWithBlock:&__block_literal_global_86_1];
}

uint64_t __84__SBTraitsContinuityDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredZOrderLevel:1.79769313e308];
}

uint64_t __84__SBTraitsContinuityDisplayPipelineManager_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSupportedOrientations:30];
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [(SBTraitsOrientationSupportTreeNodesSpecifier *)self->_orientationTreeNodesSpecifier supportedOrientations];
  uint64_t v7 = [v5 currentOrientation];
  uint64_t v25 = [v5 previousOrientation];
  if (v7 != v25 || self->_currentSupportedInterfaceOrientations != v6)
  {
    id v8 = [(SBTraitsPipelineManager *)self sceneDelegate];
    uint64_t v9 = [v8 windowScene];
    v10 = (void *)v9;
    if (v7 != v25)
    {
      v20 = (void *)v9;
      unint64_t v21 = v6;
      v22 = self;
      id v23 = v5;
      v24 = [MEMORY[0x1E4F42FF0] _currentAnimationSettings];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v11 = [MEMORY[0x1E4F42D90] screens];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            v17 = [v16 displayIdentity];
            if ([v17 isContinuityDisplay])
            {
              char v18 = objc_opt_respondsToSelector();

              if (v18)
              {
                [(id)SBApp noteActiveInterfaceOrientationWillChangeToOrientation:v7 screen:v16];
                [(id)SBApp noteActiveInterfaceOrientationDidChangeToOrientation:v7 willAnimateWithSettings:v24 fromOrientation:v25 screen:v16];
              }
            }
            else
            {
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v13);
      }

      v10 = v20;
      v19 = [v20 displayLayoutPublisher];
      [v19 setInterfaceOrientation:v7];

      self = v22;
      id v5 = v23;
      unint64_t v6 = v21;
    }
    self->_currentSupportedInterfaceOrientations = v6;
    [v8 setInterfaceOrientation:v7 supportedInterfaceOrientations:v6];
  }
}

- (void)_updateInputsForDeviceOrientation:(int64_t)a3
{
  id v11 = (id)[objc_alloc(MEMORY[0x1E4FAFF88]) initWithCurrentDeviceOrientation:a3 nonFlatDeviceOrientation:a3];
  id v4 = objc_alloc(MEMORY[0x1E4FAFF90]);
  id v5 = [(TRAArbitrationInputs *)self->_inputs interfaceIdiomInputs];
  unint64_t v6 = [(TRAArbitrationInputs *)self->_inputs userInterfaceStyleInputs];
  uint64_t v7 = [(TRAArbitrationInputs *)self->_inputs keyboardInputs];
  id v8 = [(TRAArbitrationInputs *)self->_inputs ambientPresentationInputs];
  uint64_t v9 = (TRAArbitrationInputs *)[v4 initWithInterfaceIdiomInputs:v5 userInterfaceStyleInputs:v6 deviceOrientationInputs:v11 keyboardInputs:v7 ambientPresentationInputs:v8];
  inputs = self->_inputs;
  self->_inputs = v9;
}

- (void)_updateInputsForCurrentUserInterfaceStyle
{
  id v3 = objc_alloc(MEMORY[0x1E4FAFFA8]);
  id v4 = [(SBTraitsPipelineManager *)self userInterfaceStyleProvider];
  id v12 = (id)objc_msgSend(v3, "initWithUserInterfaceStyle:", objc_msgSend(v4, "currentStyle"));

  id v5 = objc_alloc(MEMORY[0x1E4FAFF90]);
  unint64_t v6 = [(TRAArbitrationInputs *)self->_inputs interfaceIdiomInputs];
  uint64_t v7 = [(TRAArbitrationInputs *)self->_inputs deviceOrientationInputs];
  id v8 = [(TRAArbitrationInputs *)self->_inputs keyboardInputs];
  uint64_t v9 = [(TRAArbitrationInputs *)self->_inputs ambientPresentationInputs];
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
  v20 = __100__SBTraitsContinuityDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke;
  unint64_t v21 = &unk_1E6B004E0;
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

void __100__SBTraitsContinuityDisplayPipelineManager__noteInputsNeedUpdateWithAnimationSettings_fence_reason___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[ContinuityPipeline] %{public}@ updating inputs with animation settings: %{public}@ fence: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FAFFC8]) initWithAnimationSettings:*(void *)(a1 + 32) drawingFence:*(void *)(a1 + 40)];
  [v3 setOrientationActuationContext:v8];
  [v3 setUserInterfaceStyleActuationContext:v8];
  [v3 setReason:*(void *)(a1 + 48)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeOrientationParticipant, 0);
  objc_storeStrong((id *)&self->_orientationTreeNodesSpecifier, 0);
  objc_storeStrong((id *)&self->_rolesAndDefaultPoliciesProvider, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end