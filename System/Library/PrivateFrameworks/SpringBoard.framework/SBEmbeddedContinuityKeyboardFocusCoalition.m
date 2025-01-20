@interface SBEmbeddedContinuityKeyboardFocusCoalition
- (SBEmbeddedContinuityKeyboardFocusCoalition)init;
- (id)updatePolicyForArbitrationRequestFromMember:(id)a3 reason:(id)a4;
@end

@implementation SBEmbeddedContinuityKeyboardFocusCoalition

- (SBEmbeddedContinuityKeyboardFocusCoalition)init
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SBEmbeddedContinuityKeyboardFocusCoalition;
  v2 = [(SBKeyboardFocusCoalition *)&v10 _initWithDebugName:@"Embedded+Continuity Coalition"];
  if (v2)
  {
    v3 = objc_alloc_init(SBKeyboardFocusCoalitionPolicyEnforcer);
    v4 = objc_alloc_init(SBSystemKeyCommandCoalitionPolicyEnforcer);
    v5 = objc_alloc_init(SBCameraButtonPolicyEnforcer);
    v6 = [SBKeyboardFocusPolicyEnforcerPipeline alloc];
    v11[0] = v3;
    v11[1] = v4;
    v11[2] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    v8 = [(SBKeyboardFocusPolicyEnforcerPipeline *)v6 initWithEnforcers:v7];

    [(SBKeyboardFocusCoalition *)v2 setPolicyEnforcer:v8];
  }
  return v2;
}

- (id)updatePolicyForArbitrationRequestFromMember:(id)a3 reason:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBExclusiveMultiDisplayCoalition *)self embeddedMember];
  v9 = [(SBExclusiveMultiDisplayCoalition *)self externalMember];
  id v10 = (id)[v8 updateCoalitionPreferencesWithReason:v7];
  id v11 = (id)[v9 updateCoalitionPreferencesWithReason:v7];
  v12 = [v8 preferences];
  int v13 = 0;
  if ([v7 isKeyboardArbiterSuggestion] && v8 == v6)
  {
    v14 = [v12 policy];
    if ([v14 advicePolicy] == 1)
    {
      int v13 = 0;
    }
    else
    {
      v15 = [v12 lockReasons];
      int v13 = objc_msgSend(v15, "bs_containsObjectPassingTest:", &__block_literal_global_256) ^ 1;
    }
  }
  if (v6 && ([v7 isKeyboardArbiterSuggestion] ^ 1 | v13) != 1)
  {
    id v17 = v6;
  }
  else
  {
    if ([v9 hasFocus]) {
      v16 = v9;
    }
    else {
      v16 = v8;
    }
    id v17 = v16;
    v18 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(SBKeyboardFocusCoalition *)self debugName];
      [v17 uniqueIdentifier];
      v20 = v24 = v12;
      v21 = [v6 uniqueIdentifier];
      *(_DWORD *)buf = 138544386;
      v26 = v19;
      __int16 v27 = 2114;
      v28 = v20;
      __int16 v29 = 2114;
      v30 = v21;
      __int16 v31 = 2114;
      id v32 = v7;
      __int16 v33 = 1024;
      int v34 = v13;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: selecting member %{public}@, original requester %{public}@, reason: %{public}@, was overruled by hard focus lock: %d", buf, 0x30u);

      v12 = v24;
    }
  }
  id v22 = v17;

  return v22;
}

BOOL __97__SBEmbeddedContinuityKeyboardFocusCoalition_updatePolicyForArbitrationRequestFromMember_reason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 strength] == 1;
}

@end