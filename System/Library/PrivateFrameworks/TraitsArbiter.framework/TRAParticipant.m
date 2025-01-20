@interface TRAParticipant
- (BOOL)_debugDelegateDidValidateLastSettings;
- (BOOL)hasAnyActuationContext;
- (NSString)_debugLastOrientationValidationFailureReason;
- (NSString)debugDescription;
- (NSString)role;
- (NSString)uniqueIdentifier;
- (TRAArbiter)arbiter;
- (TRAOrientationResolutionPolicyInfo)orientationResolutionPolicyInfo;
- (TRAParticipant)initWithRole:(id)a3 uniqueIdentifier:(id)a4 delegate:(id)a5 arbiter:(id)a6;
- (TRAParticipantDelegate)delegate;
- (TRAPreferencesOrientation)orientationPreferences;
- (TRAPreferencesZOrderLevel)zOrderLevelPreferences;
- (TRASettings)currentSettings;
- (TRASettings)previousSettings;
- (TRASettingsActuationContext)orientationActuationContext;
- (TRASettingsActuationContext)userInterfaceStyleActuationContext;
- (TRAUserInterfaceStyleResolutionPolicyInfo)userInterfaceStyleResolutionPolicyInfo;
- (double)currentZOrderLevel;
- (double)previousZOrderLevel;
- (id)_setupStateDump;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)currentAmbientDisplayStyle;
- (int64_t)currentAmbientPresentedFlag;
- (int64_t)currentDeviceOrientation;
- (int64_t)currentOrientation;
- (int64_t)currentUserInterfaceStyle;
- (int64_t)previousAmbientDisplayStyle;
- (int64_t)previousAmbientPresentedFlag;
- (int64_t)previousDeviceOrientation;
- (int64_t)previousOrientation;
- (int64_t)previousUserInterfaceStyle;
- (void)dealloc;
- (void)invalidate;
- (void)setArbiter:(id)a3;
- (void)setCurrentSettings:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsUpdatePreferencesWithReason:(id)a3;
- (void)setNeedsUpdatePreferencesWithReason:(id)a3 animate:(BOOL)a4;
- (void)setNeedsUpdatePreferencesWithReason:(id)a3 force:(BOOL)a4;
- (void)setNeedsUpdatePreferencesWithReason:(id)a3 force:(BOOL)a4 animate:(BOOL)a5;
- (void)setOrientationPreferences:(id)a3;
- (void)setOrientationResolutionPolicyInfo:(id)a3;
- (void)setPreviousSettings:(id)a3;
- (void)setRole:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUserInterfaceStyleResolutionPolicyInfo:(id)a3;
- (void)setZOrderLevelPreferences:(id)a3;
- (void)set_debugDelegateDidValidateLastSettings:(BOOL)a3;
- (void)set_debugLastOrientationValidationFailureReason:(id)a3;
- (void)updateAmbientPresentationSettingsWithBlock:(id)a3;
- (void)updateOrientationPreferencesWithBlock:(id)a3;
- (void)updateOrientationSettingsWithBlock:(id)a3;
- (void)updatePreferencesIfNeeded;
- (void)updateUserInterfaceOrientationSettingsWithBlock:(id)a3;
- (void)updateZOrderLevelPreferencesWithBlock:(id)a3;
- (void)updateZOrderLevelSettingsWithBlock:(id)a3;
@end

@implementation TRAParticipant

- (TRASettings)currentSettings
{
  return self->_currentSettings;
}

- (void)setOrientationResolutionPolicyInfo:(id)a3
{
}

- (void)updatePreferencesIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  [WeakRetained updateArbitrationIfNeeded];
}

- (int64_t)currentUserInterfaceStyle
{
  v2 = [(TRASettings *)self->_currentSettings userInterfaceStyleSettings];
  v3 = [v2 userInterfaceStyleInputs];
  int64_t v4 = [v3 userInterfaceStyle];

  return v4;
}

- (void)updateZOrderLevelPreferencesWithBlock:(id)a3
{
  v12 = (void (**)(id, TRAMutablePreferencesZOrderLevel *))a3;
  if (!v12)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRAParticipant.m", 135, @"Invalid parameter not satisfying: %@", @"preferencesUpdateBlock" object file lineNumber description];
  }
  v5 = [(TRAParticipant *)self zOrderLevelPreferences];
  if (v5)
  {
    v6 = [(TRAParticipant *)self zOrderLevelPreferences];
    v7 = (TRAMutablePreferencesZOrderLevel *)[v6 mutableCopy];
  }
  else
  {
    v7 = objc_alloc_init(TRAMutablePreferencesZOrderLevel);
  }

  v12[2](v12, v7);
  if (![(TRAPreferencesZOrderLevel *)self->_zOrderLevelPreferences isEqualToZOrderLevelPreferences:v7])
  {
    v8 = (TRAPreferencesZOrderLevel *)[(TRAMutablePreferencesZOrderLevel *)v7 copy];
    zOrderLevelPreferences = self->_zOrderLevelPreferences;
    self->_zOrderLevelPreferences = v8;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [WeakRetained _participantDidUpdatePreferences:self];
  }
}

- (TRAPreferencesZOrderLevel)zOrderLevelPreferences
{
  return self->_zOrderLevelPreferences;
}

- (int64_t)currentOrientation
{
  v2 = [(TRASettings *)self->_currentSettings orientationSettings];
  int64_t v3 = [v2 orientation];

  return v3;
}

- (void)updateOrientationPreferencesWithBlock:(id)a3
{
  v12 = (void (**)(id, TRAMutablePreferencesOrientation *))a3;
  if (!v12)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRAParticipant.m", 147, @"Invalid parameter not satisfying: %@", @"preferencesUpdateBlock" object file lineNumber description];
  }
  v5 = [(TRAParticipant *)self orientationPreferences];
  if (v5)
  {
    v6 = [(TRAParticipant *)self orientationPreferences];
    v7 = (TRAMutablePreferencesOrientation *)[v6 mutableCopy];
  }
  else
  {
    v7 = objc_alloc_init(TRAMutablePreferencesOrientation);
  }

  v12[2](v12, v7);
  if (![(TRAPreferencesOrientation *)self->_orientationPreferences isEqualToOrientationPreferences:v7])
  {
    v8 = (TRAPreferencesOrientation *)[(TRAMutablePreferencesOrientation *)v7 copy];
    orientationPreferences = self->_orientationPreferences;
    self->_orientationPreferences = v8;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [WeakRetained _participantDidUpdatePreferences:self];
  }
}

- (TRAPreferencesOrientation)orientationPreferences
{
  return self->_orientationPreferences;
}

- (double)currentZOrderLevel
{
  v2 = [(TRASettings *)self->_currentSettings zOrderLevelSettings];
  [v2 zOrderLevel];
  double v4 = v3;

  return v4;
}

- (int64_t)currentAmbientPresentedFlag
{
  v2 = [(TRASettings *)self->_currentSettings ambientPresentationSettings];
  double v3 = [v2 ambientPresentationInputs];

  if (v3)
  {
    [v3 isAmbientPresented];
    int64_t v4 = BSSettingFlagForBool();
  }
  else
  {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (void)updateOrientationSettingsWithBlock:(id)a3
{
  v26 = (void (**)(id, TRAMutableSettingsOrientation *))a3;
  if (!v26)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRAParticipant.m", 187, @"Invalid parameter not satisfying: %@", @"settingsUpdateBlock" object file lineNumber description];
  }
  v5 = [(TRASettings *)self->_currentSettings orientationSettings];
  v6 = v5;
  if (v5) {
    v7 = (TRAMutableSettingsOrientation *)[v5 mutableCopy];
  }
  else {
    v7 = objc_alloc_init(TRAMutableSettingsOrientation);
  }
  v8 = v7;
  v26[2](v26, v7);
  v9 = [(TRASettings *)self->_currentSettings orientationSettings];
  char v10 = [v9 isEqualToOrientationSettings:v8];

  if ((v10 & 1) == 0)
  {
    if (self->_currentSettings)
    {
      v11 = [TRASettings alloc];
      v12 = [(TRASettings *)self->_previousSettings zOrderLevelSettings];
      v13 = [(TRASettings *)self->_currentSettings orientationSettings];
      v14 = [(TRASettings *)self->_previousSettings ambientPresentationSettings];
      v15 = [(TRASettings *)self->_previousSettings userInterfaceStyleSettings];
      v16 = [(TRASettings *)v11 initWithZOrderLevelSettings:v12 orientationSettings:v13 ambientPresentationSettings:v14 userInterfaceStyleSettings:v15];
      previousSettings = self->_previousSettings;
      self->_previousSettings = v16;
    }
    else
    {
      v12 = self->_previousSettings;
      self->_previousSettings = 0;
    }

    currentSettings = self->_currentSettings;
    if (currentSettings) {
      v19 = (TRAMutableSettings *)[(TRASettings *)currentSettings mutableCopy];
    }
    else {
      v19 = objc_alloc_init(TRAMutableSettings);
    }
    v20 = v19;
    v21 = (void *)[(TRAMutableSettingsOrientation *)v8 copy];
    [(TRAMutableSettings *)v20 setOrientationSettings:v21];

    v22 = (TRASettings *)[(TRAMutableSettings *)v20 copy];
    v23 = self->_currentSettings;
    self->_currentSettings = v22;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [WeakRetained _participantDidUpdateSettings:self];
  }
}

- (void)updateUserInterfaceOrientationSettingsWithBlock:(id)a3
{
  v26 = (void (**)(id, TRAMutableSettingsUserInterfaceStyle *))a3;
  if (!v26)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRAParticipant.m", 219, @"Invalid parameter not satisfying: %@", @"settingsUpdateBlock" object file lineNumber description];
  }
  v5 = [(TRASettings *)self->_currentSettings userInterfaceStyleSettings];
  v6 = v5;
  if (v5) {
    v7 = (TRAMutableSettingsUserInterfaceStyle *)[v5 mutableCopy];
  }
  else {
    v7 = objc_alloc_init(TRAMutableSettingsUserInterfaceStyle);
  }
  v8 = v7;
  v26[2](v26, v7);
  v9 = [(TRASettings *)self->_currentSettings userInterfaceStyleSettings];
  char v10 = [v9 isEqualToUserInterfaceStyleSettings:v8];

  if ((v10 & 1) == 0)
  {
    if (self->_currentSettings)
    {
      v11 = [TRASettings alloc];
      v12 = [(TRASettings *)self->_previousSettings zOrderLevelSettings];
      v13 = [(TRASettings *)self->_previousSettings orientationSettings];
      v14 = [(TRASettings *)self->_previousSettings ambientPresentationSettings];
      v15 = [(TRASettings *)self->_currentSettings userInterfaceStyleSettings];
      v16 = [(TRASettings *)v11 initWithZOrderLevelSettings:v12 orientationSettings:v13 ambientPresentationSettings:v14 userInterfaceStyleSettings:v15];
      previousSettings = self->_previousSettings;
      self->_previousSettings = v16;
    }
    else
    {
      v12 = self->_previousSettings;
      self->_previousSettings = 0;
    }

    currentSettings = self->_currentSettings;
    if (currentSettings) {
      v19 = (TRAMutableSettings *)[(TRASettings *)currentSettings mutableCopy];
    }
    else {
      v19 = objc_alloc_init(TRAMutableSettings);
    }
    v20 = v19;
    v21 = (void *)[(TRAMutableSettingsUserInterfaceStyle *)v8 copy];
    [(TRAMutableSettings *)v20 setUserInterfaceStyleSettings:v21];

    v22 = (TRASettings *)[(TRAMutableSettings *)v20 copy];
    v23 = self->_currentSettings;
    self->_currentSettings = v22;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [WeakRetained _participantDidUpdateSettings:self];
  }
}

- (NSString)role
{
  return self->_role;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)updateZOrderLevelSettingsWithBlock:(id)a3
{
  v24 = (void (**)(id, TRAMutableSettingsZOrderLevel *))a3;
  if (!v24)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRAParticipant.m", 171, @"Invalid parameter not satisfying: %@", @"settingsUpdateBlock" object file lineNumber description];
  }
  v5 = [(TRASettings *)self->_currentSettings zOrderLevelSettings];
  v6 = v5;
  if (v5) {
    v7 = (TRAMutableSettingsZOrderLevel *)[v5 mutableCopy];
  }
  else {
    v7 = objc_alloc_init(TRAMutableSettingsZOrderLevel);
  }
  v8 = v7;
  v24[2](v24, v7);
  if (([v6 isEqualToZOrderLevelSettings:v8] & 1) == 0)
  {
    if (self->_currentSettings)
    {
      v9 = [TRASettings alloc];
      char v10 = [(TRASettings *)self->_currentSettings zOrderLevelSettings];
      v11 = [(TRASettings *)self->_previousSettings orientationSettings];
      v12 = [(TRASettings *)self->_previousSettings ambientPresentationSettings];
      v13 = [(TRASettings *)self->_previousSettings userInterfaceStyleSettings];
      v14 = [(TRASettings *)v9 initWithZOrderLevelSettings:v10 orientationSettings:v11 ambientPresentationSettings:v12 userInterfaceStyleSettings:v13];
      previousSettings = self->_previousSettings;
      self->_previousSettings = v14;
    }
    else
    {
      char v10 = self->_previousSettings;
      self->_previousSettings = 0;
    }

    currentSettings = self->_currentSettings;
    if (currentSettings) {
      v17 = (TRAMutableSettings *)[(TRASettings *)currentSettings mutableCopy];
    }
    else {
      v17 = objc_alloc_init(TRAMutableSettings);
    }
    v18 = v17;
    v19 = (void *)[(TRAMutableSettingsZOrderLevel *)v8 copy];
    [(TRAMutableSettings *)v18 setZOrderLevelSettings:v19];

    v20 = (TRASettings *)[(TRAMutableSettings *)v18 copy];
    v21 = self->_currentSettings;
    self->_currentSettings = v20;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [WeakRetained _participantDidUpdateSettings:self];
  }
}

- (void)set_debugLastOrientationValidationFailureReason:(id)a3
{
}

- (void)set_debugDelegateDidValidateLastSettings:(BOOL)a3
{
  self->__debugDelegateDidValidateLastSettings = a3;
}

- (void)setNeedsUpdatePreferencesWithReason:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRAParticipant.m", 74, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  [(TRAParticipant *)self setNeedsUpdatePreferencesWithReason:v5 force:0 animate:1];
}

- (TRAParticipantDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TRAParticipantDelegate *)WeakRetained;
}

- (void)setNeedsUpdatePreferencesWithReason:(id)a3 force:(BOOL)a4 animate:(BOOL)a5
{
  id v9 = a3;
  if (!v9)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRAParticipant.m", 88, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  char v10 = [TRAArbiterUpdateContext alloc];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__TRAParticipant_setNeedsUpdatePreferencesWithReason_force_animate___block_invoke;
  v15[3] = &unk_265543D68;
  BOOL v18 = a4;
  id v16 = v9;
  v17 = self;
  BOOL v19 = a5;
  id v11 = v9;
  v12 = [(TRAArbiterUpdateContext *)v10 initWithBuilder:v15];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  [WeakRetained setNeedsUpdateArbitrationWithContext:v12];
}

void __68__TRAParticipant_setNeedsUpdatePreferencesWithReason_force_animate___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 setReason:*(void *)(a1 + 32)];
  [v3 setForceOrientationResolution:*(unsigned __int8 *)(a1 + 48)];
  v6[0] = *(void *)(*(void *)(a1 + 40) + 104);
  int64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v3 setRequestingParticipantsUniqueIdentifiers:v4];

  if (!*(unsigned char *)(a1 + 49))
  {
    id v5 = [[TRASettingsActuationContext alloc] initWithAnimationSettings:0 drawingFence:0];
    [v3 setOrientationActuationContext:v5];
  }
}

- (TRAOrientationResolutionPolicyInfo)orientationResolutionPolicyInfo
{
  return self->_orientationResolutionPolicyInfo;
}

- (BOOL)hasAnyActuationContext
{
  id v3 = [(TRAOrientationResolutionPolicyInfo *)self->_orientationResolutionPolicyInfo actuationContext];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(TRAUserInterfaceStyleResolutionPolicyInfo *)self->_userInterfaceStyleResolutionPolicyInfo actuationContext];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (TRAParticipant)initWithRole:(id)a3 uniqueIdentifier:(id)a4 delegate:(id)a5 arbiter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"TRAParticipant.m", 59, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_10:
      v26 = [MEMORY[0x263F08690] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"TRAParticipant.m", 59, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"TRAParticipant.m", 59, @"Invalid parameter not satisfying: %@", @"uniqueIdentifier" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_4:
  if (v14) {
    goto LABEL_5;
  }
LABEL_11:
  v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"TRAParticipant.m", 59, @"Invalid parameter not satisfying: %@", @"arbiter" object file lineNumber description];

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)TRAParticipant;
  v15 = [(TRAParticipant *)&v28 init];
  id v16 = v15;
  if (v15)
  {
    v15->_invalidated = 0;
    uint64_t v17 = [v11 copy];
    role = v16->_role;
    v16->_role = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    uniqueIdentifier = v16->_uniqueIdentifier;
    v16->_uniqueIdentifier = (NSString *)v19;

    objc_storeWeak((id *)&v16->_delegate, v13);
    objc_storeWeak((id *)&v16->_arbiter, v14);
    uint64_t v21 = [(TRAParticipant *)v16 _setupStateDump];
    stateDumpHandle = v16->_stateDumpHandle;
    v16->_stateDumpHandle = (BSInvalidatable *)v21;

    v16->__debugDelegateDidValidateLastSettings = 1;
  }

  return v16;
}

- (id)_setupStateDump
{
  objc_initWeak(&location, self);
  id v3 = MEMORY[0x263EF83A0];
  BOOL v4 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  v6 = [v4 stringWithFormat:@"TraitsArbiter - %p - Participants - %@", WeakRetained, self->_uniqueIdentifier];
  objc_copyWeak(&v9, &location);
  id v7 = BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v7;
}

- (void)setNeedsUpdatePreferencesWithReason:(id)a3 animate:(BOOL)a4
{
}

- (TRASettingsActuationContext)userInterfaceStyleActuationContext
{
  return [(TRAUserInterfaceStyleResolutionPolicyInfo *)self->_userInterfaceStyleResolutionPolicyInfo actuationContext];
}

- (TRASettings)previousSettings
{
  return self->_previousSettings;
}

- (TRASettingsActuationContext)orientationActuationContext
{
  return [(TRAOrientationResolutionPolicyInfo *)self->_orientationResolutionPolicyInfo actuationContext];
}

- (void)setNeedsUpdatePreferencesWithReason:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v9 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRAParticipant.m", 79, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v7 = 0;
  }
  [(TRAParticipant *)self setNeedsUpdatePreferencesWithReason:v7 force:v4 animate:1];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [WeakRetained _invalidateParticipant:self];
  }
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateDumpHandle invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TRAParticipant;
  [(TRAParticipant *)&v3 dealloc];
}

- (NSString)debugDescription
{
  return (NSString *)[(TRAParticipant *)self descriptionWithMultilinePrefix:0];
}

- (void)setZOrderLevelPreferences:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRAParticipant.m", 159, @"Invalid parameter not satisfying: %@", @"zOrderLevelPreferences" object file lineNumber description];

    id v5 = 0;
  }
  v6 = (TRAPreferencesZOrderLevel *)[v5 copy];
  zOrderLevelPreferences = self->_zOrderLevelPreferences;
  self->_zOrderLevelPreferences = v6;
}

- (void)setOrientationPreferences:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRAParticipant.m", 164, @"Invalid parameter not satisfying: %@", @"orientationPreferences" object file lineNumber description];

    id v5 = 0;
  }
  v6 = (TRAPreferencesOrientation *)[v5 copy];
  orientationPreferences = self->_orientationPreferences;
  self->_orientationPreferences = v6;
}

- (void)updateAmbientPresentationSettingsWithBlock:(id)a3
{
  v26 = (void (**)(id, TRAMutableSettingsAmbientPresentation *))a3;
  if (!v26)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRAParticipant.m", 203, @"Invalid parameter not satisfying: %@", @"settingsUpdateBlock" object file lineNumber description];
  }
  id v5 = [(TRASettings *)self->_currentSettings ambientPresentationSettings];
  v6 = v5;
  if (v5) {
    id v7 = (TRAMutableSettingsAmbientPresentation *)[v5 mutableCopy];
  }
  else {
    id v7 = objc_alloc_init(TRAMutableSettingsAmbientPresentation);
  }
  v8 = v7;
  v26[2](v26, v7);
  id v9 = [(TRASettings *)self->_currentSettings ambientPresentationSettings];
  char v10 = [v9 isEqualToAmbientPresentationSettings:v8];

  if ((v10 & 1) == 0)
  {
    if (self->_currentSettings)
    {
      id v11 = [TRASettings alloc];
      id v12 = [(TRASettings *)self->_previousSettings zOrderLevelSettings];
      id v13 = [(TRASettings *)self->_previousSettings orientationSettings];
      id v14 = [(TRASettings *)self->_currentSettings ambientPresentationSettings];
      v15 = [(TRASettings *)self->_previousSettings userInterfaceStyleSettings];
      id v16 = [(TRASettings *)v11 initWithZOrderLevelSettings:v12 orientationSettings:v13 ambientPresentationSettings:v14 userInterfaceStyleSettings:v15];
      previousSettings = self->_previousSettings;
      self->_previousSettings = v16;
    }
    else
    {
      id v12 = self->_previousSettings;
      self->_previousSettings = 0;
    }

    currentSettings = self->_currentSettings;
    if (currentSettings) {
      uint64_t v19 = (TRAMutableSettings *)[(TRASettings *)currentSettings mutableCopy];
    }
    else {
      uint64_t v19 = objc_alloc_init(TRAMutableSettings);
    }
    v20 = v19;
    uint64_t v21 = (void *)[(TRAMutableSettingsAmbientPresentation *)v8 copy];
    [(TRAMutableSettings *)v20 setAmbientPresentationSettings:v21];

    v22 = (TRASettings *)[(TRAMutableSettings *)v20 copy];
    v23 = self->_currentSettings;
    self->_currentSettings = v22;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    [WeakRetained _participantDidUpdateSettings:self];
  }
}

- (id)succinctDescription
{
  v2 = [(TRAParticipant *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  BOOL v4 = v3;
  if (self->_invalidated)
  {
    id v5 = [@"invalidated" uppercaseString];
    [v4 appendString:v5 withName:0 skipIfEmpty:1];
  }
  else
  {
    [v3 appendString:&stru_270BF7BE8 withName:0 skipIfEmpty:1];
  }
  [v4 appendString:self->_role withName:@"role"];
  [v4 appendString:self->_uniqueIdentifier withName:@"uniqueIdentifier"];
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(TRAParticipant *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(TRAParticipant *)self succinctDescriptionBuilder];
  if (!self->_invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    id v6 = (id)[v4 appendPointer:WeakRetained withName:@"arbiter"];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_265543D90;
    id v9 = v4;
    char v10 = @"    ";
    id v11 = self;
    [v9 appendBodySectionWithName:0 multilinePrefix:0 block:v8];
  }
  return v4;
}

void __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v31[3] = &unk_265543D20;
  id v4 = v2;
  uint64_t v5 = a1[6];
  id v32 = v4;
  uint64_t v33 = v5;
  [v4 appendBodySectionWithName:@"Preferences" multilinePrefix:v3 block:v31];
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v28[3] = &unk_265543D20;
  id v8 = v6;
  uint64_t v9 = a1[6];
  id v29 = v8;
  uint64_t v30 = v9;
  [v8 appendBodySectionWithName:@"Resolved Settings" multilinePrefix:v7 block:v28];
  if (!*(unsigned char *)(a1[6] + 72))
  {
    char v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_4;
    v25[3] = &unk_265543D20;
    id v12 = v10;
    uint64_t v13 = a1[6];
    id v26 = v12;
    uint64_t v27 = v13;
    [v12 appendBodySectionWithName:@"Settings Validation" multilinePrefix:v11 block:v25];
  }
  id v14 = (void *)a1[4];
  uint64_t v15 = a1[5];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_5;
  v22 = &unk_265543D20;
  id v16 = v14;
  uint64_t v17 = a1[6];
  id v23 = v16;
  uint64_t v24 = v17;
  [v16 appendBodySectionWithName:@"Resolution Policies" multilinePrefix:v15 block:&v19];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 112));
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "appendDescriptionForParticipant:withBuilder:multilinePrefix:", a1[6], a1[4], a1[5], v19, v20, v21, v22);
  }
}

id __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"zOrder"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"orientation"];
}

id __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"current"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"previous"];
}

uint64_t __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:0 withName:@"did validate last settings"];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 120);
  return [v3 appendString:v4 withName:@"last validation failure reason" skipIfEmpty:1];
}

id __56__TRAParticipant_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"orientation"];
}

__CFString *__33__TRAParticipant__setupStateDump__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained debugDescription];
  }
  else
  {
    uint64_t v3 = &stru_270BF7BE8;
  }

  return v3;
}

- (TRAUserInterfaceStyleResolutionPolicyInfo)userInterfaceStyleResolutionPolicyInfo
{
  return self->_userInterfaceStyleResolutionPolicyInfo;
}

- (void)setUserInterfaceStyleResolutionPolicyInfo:(id)a3
{
}

- (void)setCurrentSettings:(id)a3
{
}

- (void)setPreviousSettings:(id)a3
{
}

- (void)setRole:(id)a3
{
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (TRAArbiter)arbiter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
  return (TRAArbiter *)WeakRetained;
}

- (void)setArbiter:(id)a3
{
}

- (BOOL)_debugDelegateDidValidateLastSettings
{
  return self->__debugDelegateDidValidateLastSettings;
}

- (NSString)_debugLastOrientationValidationFailureReason
{
  return self->__debugLastOrientationValidationFailureReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debugLastOrientationValidationFailureReason, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->userInterfaceStyleActuationContext, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleResolutionPolicyInfo, 0);
  objc_storeStrong((id *)&self->_orientationResolutionPolicyInfo, 0);
  objc_storeStrong((id *)&self->_previousSettings, 0);
  objc_storeStrong((id *)&self->_currentSettings, 0);
  objc_storeStrong((id *)&self->_zOrderLevelPreferences, 0);
  objc_storeStrong((id *)&self->_orientationPreferences, 0);
  objc_destroyWeak((id *)&self->_arbiter);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
}

- (int64_t)previousUserInterfaceStyle
{
  id v2 = [(TRASettings *)self->_previousSettings userInterfaceStyleSettings];
  uint64_t v3 = [v2 userInterfaceStyleInputs];
  int64_t v4 = [v3 userInterfaceStyle];

  return v4;
}

- (double)previousZOrderLevel
{
  id v2 = [(TRASettings *)self->_previousSettings zOrderLevelSettings];
  [v2 zOrderLevel];
  double v4 = v3;

  return v4;
}

- (int64_t)previousOrientation
{
  id v2 = [(TRASettings *)self->_previousSettings orientationSettings];
  int64_t v3 = [v2 orientation];

  return v3;
}

- (int64_t)currentDeviceOrientation
{
  id v2 = [(TRASettings *)self->_currentSettings orientationSettings];
  int64_t v3 = [v2 validatedOrientationInputs];
  int64_t v4 = [v3 currentDeviceOrientation];

  return v4;
}

- (int64_t)previousDeviceOrientation
{
  id v2 = [(TRASettings *)self->_previousSettings orientationSettings];
  int64_t v3 = [v2 validatedOrientationInputs];
  int64_t v4 = [v3 currentDeviceOrientation];

  return v4;
}

- (int64_t)previousAmbientPresentedFlag
{
  id v2 = [(TRASettings *)self->_previousSettings ambientPresentationSettings];
  int64_t v3 = [v2 ambientPresentationInputs];

  if (v3)
  {
    [v3 isAmbientPresented];
    int64_t v4 = BSSettingFlagForBool();
  }
  else
  {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (int64_t)currentAmbientDisplayStyle
{
  id v2 = [(TRASettings *)self->_currentSettings ambientPresentationSettings];
  int64_t v3 = [v2 ambientPresentationInputs];

  if (v3) {
    int64_t v4 = [v3 ambientDisplayStyle];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)previousAmbientDisplayStyle
{
  id v2 = [(TRASettings *)self->_previousSettings ambientPresentationSettings];
  int64_t v3 = [v2 ambientPresentationInputs];

  if (v3) {
    int64_t v4 = [v3 ambientDisplayStyle];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

@end