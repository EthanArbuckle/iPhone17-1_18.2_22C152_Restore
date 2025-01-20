@interface SBEmbeddedChamoisKeyboardFocusCoalition
- (SBEmbeddedChamoisKeyboardFocusCoalition)init;
- (id)updatePolicyForArbitrationRequestFromMember:(id)a3 reason:(id)a4;
@end

@implementation SBEmbeddedChamoisKeyboardFocusCoalition

- (SBEmbeddedChamoisKeyboardFocusCoalition)init
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SBEmbeddedChamoisKeyboardFocusCoalition;
  v2 = [(SBKeyboardFocusCoalition *)&v10 _initWithDebugName:@"Embedded+Chamois Coalition"];
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
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBExclusiveMultiDisplayCoalition *)self embeddedMember];
  id v9 = [(SBExclusiveMultiDisplayCoalition *)self externalMember];
  objc_super v10 = [v9 preferences];
  v11 = [v8 preferences];
  v12 = [v9 updateCoalitionPreferencesWithReason:v7];
  v13 = [v8 updateCoalitionPreferencesWithReason:v7];

  if ([v9 hasFocus]) {
    v14 = v9;
  }
  else {
    v14 = v8;
  }
  id v15 = v14;
  uint64_t v16 = [v13 focusLockReasonStrength];
  uint64_t v17 = [v12 focusLockReasonStrength];
  v44 = v15;
  if (!v6)
  {
    if ((v20 = v15, id v6 = v20, v20 == v9) && (v21 = v9, v17 == 2) || v20 == v8 && (v21 = v8, v16 == 2))
    {
      id v22 = v21;
      id v19 = v6;
      if (v6) {
        goto LABEL_47;
      }
    }
  }
  if (v16 != 2 || v17 == 2)
  {
    if (v16 == 2 || v17 != 2)
    {
      if (v16 == 2)
      {
        v41 = v11;
        v23 = [v13 lockReasons];
        v24 = +[SBKeyboardFocusLockReason mostRecentReasonInSet:v23 strength:2];

        v25 = [v12 lockReasons];
        v26 = +[SBKeyboardFocusLockReason mostRecentReasonInSet:v25 strength:2];

        id v27 = [v24 isMoreRecentThanReason:v26] ? v8 : v9;
        id v19 = v27;

        v11 = v41;
        if (v19) {
          goto LABEL_47;
        }
      }
      goto LABEL_24;
    }
    id v18 = v9;
  }
  else
  {
    id v18 = v8;
  }
  id v19 = v18;
  if (v18) {
    goto LABEL_47;
  }
LABEL_24:
  v43 = v10;
  v28 = [v13 lockReasons];
  +[SBKeyboardFocusLockReason mostRecentReasonInSet:v28 strength:1];
  uint64_t v30 = v29 = v11;

  v42 = v29;
  v31 = [v29 lockReasons];
  v32 = +[SBKeyboardFocusLockReason mostRecentReasonInSet:v31 strength:1];

  v39 = v32;
  if (v32
    && objc_msgSend(v32, "isEqual:", v30, v32)
    && ([(id)v30 isMoreRecentThanReason:v32] & 1) == 0)
  {

    uint64_t v30 = 0;
  }
  v33 = objc_msgSend(v12, "lockReasons", v39);
  uint64_t v34 = +[SBKeyboardFocusLockReason mostRecentReasonInSet:v33 strength:1];

  v35 = [v10 lockReasons];
  v36 = +[SBKeyboardFocusLockReason mostRecentReasonInSet:v35 strength:1];

  if (v36
    && [v36 isEqual:v34]
    && ([(id)v34 isMoreRecentThanReason:v36] & 1) == 0)
  {

    uint64_t v34 = 0;
    id v19 = 0;
    v37 = v8;
    objc_super v10 = v43;
    if (!v30) {
      goto LABEL_44;
    }
  }
  else
  {
    if (v30 && v34)
    {
      if ([(id)v30 isMoreRecentThanReason:v34]) {
        v37 = v8;
      }
      else {
        v37 = v9;
      }
    }
    else
    {
      if (v30) {
        v37 = v8;
      }
      else {
        v37 = v9;
      }
      if (!(v30 | v34))
      {
        id v19 = 0;
        objc_super v10 = v43;
        goto LABEL_44;
      }
    }
    objc_super v10 = v43;
  }
  id v19 = v37;

LABEL_44:
  if (!v19)
  {
    id v6 = v6;
    id v19 = v6;
  }
  v11 = v42;
LABEL_47:

  return v19;
}

@end