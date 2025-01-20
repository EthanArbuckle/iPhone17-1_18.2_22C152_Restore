@interface SBSAShakeBehaviorProvider
- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4;
- (CGPoint)_defaultContainerParentViewCenterFromContext:(id)a3;
- (double)milestoneForPhase:(int64_t)a3;
- (id)_updatedIdlePreferencesFromPreferences:(id)a3 context:(id)a4;
- (id)_updatedKickingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (id)_updatedPreparingToSettlePreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (id)_updatedSettlingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (id)nameForPhase:(int64_t)a3;
- (id)updatedContextFromContext:(id)a3;
- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (int64_t)finalPhase;
@end

@implementation SBSAShakeBehaviorProvider

- (int64_t)finalPhase
{
  return 4;
}

- (id)nameForPhase:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSAShakeBehaviorProvider;
  v4 = -[SBSASequencedBehaviorProvider nameForPhase:](&v7, sel_nameForPhase_);
  if ((unint64_t)a3 <= 4)
  {
    v5 = off_1E6B05438[a3];

    v4 = v5;
  }
  return v4;
}

- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4
{
  id v6 = a3;
  objc_super v7 = [(SBSASequencedBehaviorProvider *)self participatingElementIdentification];
  if (v7)
  {
    v8 = [v6 elementContexts];
    v9 = [v8 firstObject];
    int v10 = SAElementIdentityEqualToIdentity();

    if (v10)
    {
      v11 = [v6 preferences];
      v12 = [v11 elementLayoutTransition];
      v13 = [v12 initialElementContexts];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __63__SBSAShakeBehaviorProvider_canProceedWithContext_shouldRetry___block_invoke;
      v18[3] = &unk_1E6AF9378;
      id v19 = v7;
      v14 = objc_msgSend(v13, "bs_firstObjectPassingTest:", v18);
      BOOL v15 = v14 != 0;

      BOOL v16 = 1;
      if (!a4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  BOOL v16 = 0;
  BOOL v15 = 0;
  if (a4) {
LABEL_6:
  }
    *a4 = v16;
LABEL_7:

  return v15;
}

uint64_t __63__SBSAShakeBehaviorProvider_canProceedWithContext_shouldRetry___block_invoke()
{
  return SAElementIdentityEqualToIdentity();
}

- (id)updatedContextFromContext:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SBSAShakeBehaviorProvider;
  v5 = [(SBSASequencedBehaviorProvider *)&v16 updatedContextFromContext:a3];
  if ([(SBSASequencedBehaviorProvider *)self activePhase] == 1
    || [(SBSASequencedBehaviorProvider *)self activePhase] == 2)
  {
    [v5 inertContainerFrame];
    id v6 = [(id)objc_opt_class() settings];
    [v6 shakeSensorExpansion];
    [v5 displayScale];
    uint64_t v14 = v7;
    UIRectCenteredXInRectScale();
    objc_msgSend(v6, "shakeSensorOffset", v14);
    [v5 layoutDirection];
    UIRectIntegralWithScale();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__SBSAShakeBehaviorProvider_updatedContextFromContext___block_invoke;
    v15[3] = &unk_1E6B053C8;
    v15[4] = self;
    v15[5] = a2;
    v15[6] = v8;
    v15[7] = v9;
    v15[8] = v10;
    v15[9] = v11;
    uint64_t v12 = [v5 copyWithBlock:v15];

    v5 = (void *)v12;
  }
  return v5;
}

void __55__SBSAShakeBehaviorProvider_updatedContextFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        v5 = v4;
      }
      else {
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    Class v10 = NSClassFromString(&cfstr_Sbsacontextmut.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAShakeBehaviorProvider.m", 90, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  objc_msgSend(v6, "setInertContainerFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  switch([(SBSASequencedBehaviorProvider *)self activePhase])
  {
    case 1:
      uint64_t v10 = [(SBSAShakeBehaviorProvider *)self _updatedKickingPreferencesFromPreferences:v8 context:v9 relevantPropertyIdentity:a5];
      break;
    case 2:
      uint64_t v10 = [(SBSAShakeBehaviorProvider *)self _updatedPreparingToSettlePreferencesFromPreferences:v8 context:v9 relevantPropertyIdentity:a5];
      break;
    case 3:
    case 4:
      uint64_t v10 = [(SBSAShakeBehaviorProvider *)self _updatedSettlingPreferencesFromPreferences:v8 context:v9 relevantPropertyIdentity:a5];
      break;
    default:
      uint64_t v10 = [(SBSAShakeBehaviorProvider *)self _updatedIdlePreferencesFromPreferences:v8 context:v9];
      break;
  }
  uint64_t v11 = (void *)v10;

  return v11;
}

- (double)milestoneForPhase:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSAShakeBehaviorProvider;
  -[SBSASequencedBehaviorProvider milestoneForPhase:](&v10, sel_milestoneForPhase_);
  if (a3 == 4)
  {
    objc_msgSend(&unk_1F3348CE8, "bs_CGFloatValue");
    return v8;
  }
  else
  {
    if (a3 == 3)
    {
      id v6 = [(id)objc_opt_class() settings];
      [v6 secondShakeMilestone];
      goto LABEL_7;
    }
    double v5 = v4;
    if (a3 == 2)
    {
      id v6 = [(id)objc_opt_class() settings];
      [v6 firstShakeMilestone];
LABEL_7:
      double v5 = v7;
    }
  }
  return v5;
}

- (id)_updatedKickingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__74;
  v22 = __Block_byref_object_dispose__74;
  id v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104__SBSAShakeBehaviorProvider__updatedKickingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v14[3] = &unk_1E6B05418;
  SEL v17 = a2;
  v14[4] = self;
  id v11 = v10;
  id v15 = v11;
  objc_super v16 = &v18;
  uint64_t v12 = (void *)[v9 copyWithBlock:v14];
  if (a5) {
    *a5 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __104__SBSAShakeBehaviorProvider__updatedKickingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  double v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAShakeBehaviorProvider.m", 135, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }
  v48 = v3;

  v47 = [(id)objc_opt_class() settings];
  v51 = [v47 jindoAuthErrorStretchOut];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = [v7 containerViewDescriptions];
  uint64_t v14 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v50 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v54 != v50) {
          objc_enumerationMutation(obj);
        }
        SEL v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v18 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v51];
        id v19 = [SBSAInterfaceElementPropertyIdentity alloc];
        uint64_t v20 = [v17 interfaceElementIdentifier];
        v21 = [(SBSAInterfaceElementPropertyIdentity *)v19 initWithAssociatedInterfaceElementIdentifier:v20 andProperty:@"bounds"];
        [v7 setAnimatedTransitionDescription:v18 forProperty:v21 withMilestones:0];

        v22 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v51];
        id v23 = [SBSAInterfaceElementPropertyIdentity alloc];
        v24 = [v17 interfaceElementIdentifier];
        v25 = [(SBSAInterfaceElementPropertyIdentity *)v23 initWithAssociatedInterfaceElementIdentifier:v24 andProperty:@"center"];
        [v7 setAnimatedTransitionDescription:v22 forProperty:v25 withMilestones:0];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v15);
  }

  v26 = [v7 containerParentViewDescription];
  v27 = v26;
  if (v26)
  {
    id v28 = v26;
  }
  else
  {
    id v28 = [*(id *)(a1 + 40) containerParentViewDescription];
  }

  [v28 center];
  double v30 = v29;
  uint64_t v32 = v31;
  [v47 shakeDisplacement];
  double v34 = v33;
  uint64_t v35 = [*(id *)(a1 + 40) layoutDirection];
  double v36 = -v34;
  if (v35 != 1) {
    double v36 = v34;
  }
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __104__SBSAShakeBehaviorProvider__updatedKickingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2;
  v52[3] = &unk_1E6B053F0;
  uint64_t v37 = *(void *)(a1 + 56);
  v52[4] = *(void *)(a1 + 32);
  v52[5] = v37;
  *(double *)&v52[6] = v30 - v36;
  v52[7] = v32;
  v38 = (void *)[v28 copyWithBlock:v52];

  [v7 setContainerParentViewDescription:v38];
  v39 = [SBSAInterfaceElementPropertyIdentity alloc];
  v40 = [v38 interfaceElementIdentifier];
  uint64_t v41 = [(SBSAInterfaceElementPropertyIdentity *)v39 initWithAssociatedInterfaceElementIdentifier:v40 andProperty:@"center"];
  uint64_t v42 = *(void *)(*(void *)(a1 + 48) + 8);
  v43 = *(void **)(v42 + 40);
  *(void *)(v42 + 40) = v41;

  v44 = objc_opt_class();
  v45 = [v47 jindoAuthErrorShakeInitialKick];
  v46 = (void *)[v44 newAnimatedTransitionDescriptionWithBehaviorSettings:v45];
  [v7 setAnimatedTransitionDescription:v46 forProperty:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withMilestones:0];
}

void __104__SBSAShakeBehaviorProvider__updatedKickingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    Class v10 = NSClassFromString(&cfstr_Sbsaviewdescri.isa);
    Class v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAShakeBehaviorProvider.m", 147, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  objc_msgSend(v6, "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (CGPoint)_defaultContainerParentViewCenterFromContext:(id)a3
{
  [a3 systemContainerBounds];
  UIRectGetCenter();
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)_updatedPreparingToSettlePreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__74;
  v22 = __Block_byref_object_dispose__74;
  id v23 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __114__SBSAShakeBehaviorProvider__updatedPreparingToSettlePreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v14[3] = &unk_1E6B05418;
  SEL v17 = a2;
  v14[4] = self;
  id v11 = v10;
  id v15 = v11;
  objc_super v16 = &v18;
  uint64_t v12 = (void *)[v9 copyWithBlock:v14];
  if (a5) {
    *a5 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __114__SBSAShakeBehaviorProvider__updatedPreparingToSettlePreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  double v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAShakeBehaviorProvider.m", 167, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  uint64_t v14 = [v7 containerParentViewDescription];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [*(id *)(a1 + 40) containerParentViewDescription];
  }
  SEL v17 = v16;

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __114__SBSAShakeBehaviorProvider__updatedPreparingToSettlePreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2;
  v30[3] = &unk_1E6AF9DA0;
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(a1 + 40);
  uint64_t v32 = *(void *)(a1 + 56);
  v30[4] = v18;
  id v31 = v19;
  uint64_t v20 = (void *)[v17 copyWithBlock:v30];

  [v7 setContainerParentViewDescription:v20];
  v21 = [SBSAInterfaceElementPropertyIdentity alloc];
  v22 = [v20 interfaceElementIdentifier];
  uint64_t v23 = [(SBSAInterfaceElementPropertyIdentity *)v21 initWithAssociatedInterfaceElementIdentifier:v22 andProperty:@"center"];
  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  v26 = objc_opt_class();
  v27 = [(id)objc_opt_class() settings];
  id v28 = [v27 jindoAuthErrorShakeSettle];
  double v29 = (void *)[v26 newAnimatedTransitionDescriptionWithBehaviorSettings:v28];
  [v7 setAnimatedTransitionDescription:v29 forProperty:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withMilestones:0];
}

void __114__SBSAShakeBehaviorProvider__updatedPreparingToSettlePreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2(uint64_t *a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[4];
    Class v10 = NSClassFromString(&cfstr_Sbsaviewdescri.isa);
    Class v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAShakeBehaviorProvider.m", 170, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [(id)a1[4] _defaultContainerParentViewCenterFromContext:a1[5]];
  objc_msgSend(v6, "setCenter:");
}

- (id)_updatedSettlingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  SEL v17 = __Block_byref_object_copy__74;
  uint64_t v18 = __Block_byref_object_dispose__74;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __105__SBSAShakeBehaviorProvider__updatedSettlingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v13[3] = &unk_1E6AFDF60;
  v13[5] = &v14;
  v13[6] = a2;
  v13[4] = self;
  Class v11 = (void *)[v9 copyWithBlock:v13];
  if (a5) {
    *a5 = (id) v15[5];
  }
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __105__SBSAShakeBehaviorProvider__updatedSettlingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = a1[6];
    uint64_t v10 = a1[4];
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAShakeBehaviorProvider.m", 187, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }
  double v30 = v3;

  uint64_t v14 = [(id)objc_opt_class() settings];
  uint64_t v32 = [v14 jindoAuthErrorStretchSettle];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [v7 containerViewDescriptions];
  uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v33 + 1) + 8 * v18);
        uint64_t v20 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v32];
        v21 = [SBSAInterfaceElementPropertyIdentity alloc];
        v22 = [v19 interfaceElementIdentifier];
        uint64_t v23 = [(SBSAInterfaceElementPropertyIdentity *)v21 initWithAssociatedInterfaceElementIdentifier:v22 andProperty:@"bounds"];
        [v7 setAnimatedTransitionDescription:v20 forProperty:v23 withMilestones:0];

        uint64_t v24 = [SBSAInterfaceElementPropertyIdentity alloc];
        v25 = [v19 interfaceElementIdentifier];
        v26 = [(SBSAInterfaceElementPropertyIdentity *)v24 initWithAssociatedInterfaceElementIdentifier:v25 andProperty:@"center"];

        uint64_t v27 = *(void *)(a1[5] + 8);
        uint64_t v29 = *(void *)(v27 + 40);
        id v28 = (id *)(v27 + 40);
        if (!v29) {
          objc_storeStrong(v28, v26);
        }
        [v7 setAnimatedTransitionDescription:v20 forProperty:v26 withMilestones:0];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v16);
  }
}

- (id)_updatedIdlePreferencesFromPreferences:(id)a3 context:(id)a4
{
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__SBSAShakeBehaviorProvider__updatedIdlePreferencesFromPreferences_context___block_invoke;
  v11[3] = &unk_1E6AF9DA0;
  id v12 = v7;
  SEL v13 = a2;
  v11[4] = self;
  id v8 = v7;
  uint64_t v9 = (void *)[a3 copyWithBlock:v11];

  return v9;
}

void __76__SBSAShakeBehaviorProvider__updatedIdlePreferencesFromPreferences_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v12 = (objc_class *)objc_opt_class();
    SEL v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAShakeBehaviorProvider.m", 207, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  uint64_t v14 = [*(id *)(a1 + 40) containerParentViewDescription];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__SBSAShakeBehaviorProvider__updatedIdlePreferencesFromPreferences_context___block_invoke_2;
  v22[3] = &unk_1E6AF9DA0;
  v22[4] = *(void *)(a1 + 32);
  long long v21 = *(_OWORD *)(a1 + 40);
  id v15 = (id)v21;
  long long v23 = v21;
  uint64_t v16 = (void *)[v14 copyWithBlock:v22];
  [v7 setContainerParentViewDescription:v16];
  uint64_t v17 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"center"];
  uint64_t v18 = [SBSAInterfaceElementPropertyIdentity alloc];
  id v19 = [v14 interfaceElementIdentifier];
  uint64_t v20 = [(SBSAInterfaceElementPropertyIdentity *)v18 initWithAssociatedInterfaceElementIdentifier:v19 andProperty:@"center"];
  [v7 setAnimatedTransitionDescription:v17 forProperty:v20 withMilestones:0];
}

void __76__SBSAShakeBehaviorProvider__updatedIdlePreferencesFromPreferences_context___block_invoke_2(uint64_t *a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[4];
    Class v10 = NSClassFromString(&cfstr_Sbsaviewdescri.isa);
    Class v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAShakeBehaviorProvider.m", 210, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [(id)a1[4] _defaultContainerParentViewCenterFromContext:a1[5]];
  objc_msgSend(v6, "setCenter:");
}

@end