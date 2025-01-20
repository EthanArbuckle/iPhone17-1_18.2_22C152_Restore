@interface SBTraitsOrientationDefaultResolutionPolicySpecifier
- (SBTraitsOrientationDefaultResolutionPolicySpecifier)initWithComponentOrder:(id)a3 dataSource:(id)a4;
- (SBTraitsOrientationPolicySpecifierDataSource)dataSource;
- (void)setDataSource:(id)a3;
- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4;
@end

@implementation SBTraitsOrientationDefaultResolutionPolicySpecifier

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v35 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (!WeakRetained)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    [v31 handleFailureInMethod:a2, self, @"SBTraitsOrientationStageComponents.m", 109, @"%@ cannot start being queried without a policy data source in place", v33 object file lineNumber description];
  }
  id v9 = objc_loadWeakRetained((id *)&self->_dataSource);
  v38 = [v9 defaultKeyboardFocusDrivenRoles];
  v10 = [v9 defaultDeviceOrientationDrivenRoles];
  uint64_t v11 = [v9 defaultActiveOrientationBelowDrivenRoles];
  v34 = v9;
  v12 = v9;
  v13 = (void *)v11;
  v14 = [v12 defaultOtherParticipantDrivenRoles];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v40;
    id v36 = v15;
    v37 = v10;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v21 = [v20 role];
        if ([v10 containsObject:v21])
        {
          uint64_t v22 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoDeviceOrientation];
LABEL_12:
          v23 = (void *)v22;
          goto LABEL_22;
        }
        if ([v13 containsObject:v21])
        {
          uint64_t v22 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoOrientationBelow];
          goto LABEL_12;
        }
        v24 = v13;
        if ([v38 containsObject:v21])
        {
          v25 = [v35 validatedInputs];
          v26 = [v25 keyboardInputs];
          v27 = [v26 focusedParticipantUniqueIdentifier];

          if (v27) {
            [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoForAssociatedParticipantWithUniqueID:v27];
          }
          else {
          v23 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoOrientationBelow];
          }
          id v15 = v36;
        }
        else
        {
          v28 = [v14 objectForKey:v21];

          v29 = (void *)MEMORY[0x1E4FAFFB0];
          if (v28)
          {
            v30 = [v14 objectForKey:v21];
            v23 = [v29 resolutionPolicyInfoForAssociatedParticipantWithRole:v30];

            id v15 = v36;
          }
          else
          {
            v23 = [MEMORY[0x1E4FAFFB0] resolutionPolicyInfoIsolation];
          }
        }
        v13 = v24;
        v10 = v37;
LABEL_22:
        [v20 setOrientationResolutionPolicyInfo:v23];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v17);
  }
}

- (SBTraitsOrientationDefaultResolutionPolicySpecifier)initWithComponentOrder:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBTraitsOrientationStageComponents.m", 98, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SBTraitsOrientationDefaultResolutionPolicySpecifier;
  id v9 = [(SBTraitsOrientationStageComponent *)&v13 initWithComponentOrder:v7];
  v10 = v9;
  if (v9) {
    objc_storeWeak((id *)&v9->_dataSource, v8);
  }

  return v10;
}

- (SBTraitsOrientationPolicySpecifierDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBTraitsOrientationPolicySpecifierDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end