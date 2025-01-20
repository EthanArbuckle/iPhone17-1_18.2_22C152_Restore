@interface SBSAAcceptanceBounceBehaviorProvider
- (BOOL)canPersistAcrossLayoutStateChangesToNewElementContexts:(id)a3;
- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4;
- (BOOL)phaseIsTimeDelayBased:(int64_t)a3;
- (CGRect)_expandedBouncingContainerViewFrameForBounceStyle:(int64_t)a3 unexpandedFrame:(CGRect)a4;
- (SBSAAcceptanceBounceBehaviorProvider)initWithParticipantIdentifier:(id)a3 style:(int64_t)a4 triggeredBlock:(id)a5;
- (double)delayForPhase:(int64_t)a3;
- (id)_updatedReboundingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (id)_updatedRevealAcceptedElementPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (id)_updatedStretchingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (id)nameForPhase:(int64_t)a3;
- (id)updatedContextFromContext:(id)a3;
- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (int64_t)finalPhase;
- (void)removeFromParentProvider;
@end

@implementation SBSAAcceptanceBounceBehaviorProvider

- (SBSAAcceptanceBounceBehaviorProvider)initWithParticipantIdentifier:(id)a3 style:(int64_t)a4 triggeredBlock:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
  v9 = [(SBSASequencedBehaviorProvider *)&v14 initWithParticipantIdentifier:a3];
  v10 = v9;
  if (v9)
  {
    v9->_style = a4;
    uint64_t v11 = [v8 copy];
    id triggeredBlock = v10->_triggeredBlock;
    v10->_id triggeredBlock = (id)v11;
  }
  return v10;
}

- (void)removeFromParentProvider
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "AcceptanceBounceBehaviorProvider triggered block upon removal", v1, 2u);
}

- (int64_t)finalPhase
{
  return 4;
}

- (id)nameForPhase:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
  v4 = -[SBSASequencedBehaviorProvider nameForPhase:](&v7, sel_nameForPhase_);
  if ((unint64_t)a3 <= 4)
  {
    v5 = off_1E6B0D8A0[a3];

    v4 = v5;
  }
  return v4;
}

- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4
{
  return 1;
}

- (BOOL)canPersistAcrossLayoutStateChangesToNewElementContexts:(id)a3
{
  int v4 = objc_msgSend(a3, "bs_containsObjectPassingTest:", &__block_literal_global_387) ^ 1;
  if (self->_shouldBeRemovedUponLayoutChange) {
    return 0;
  }
  else {
    return v4;
  }
}

BOOL __95__SBSAAcceptanceBounceBehaviorProvider_canPersistAcrossLayoutStateChangesToNewElementContexts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 layoutMode] == 3;
}

- (id)updatedContextFromContext:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
  v6 = [(SBSASequencedBehaviorProvider *)&v17 updatedContextFromContext:v5];
  if ([(SBSASequencedBehaviorProvider *)self activePhase] == 1 && self->_style)
  {
    [v6 inertContainerFrame];
    objc_super v7 = [(id)objc_opt_class() settings];
    [v7 acceptanceSideBounceXSensorExpansion];
    [v6 displayScale];
    uint64_t v15 = v8;
    UIRectCenteredXInRectScale();
    objc_msgSend(v7, "acceptanceSideBounceXSensorOffset", v15);
    UIRectIntegralWithScale();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__SBSAAcceptanceBounceBehaviorProvider_updatedContextFromContext___block_invoke;
    v16[3] = &unk_1E6B053C8;
    v16[4] = self;
    v16[5] = a2;
    v16[6] = v9;
    v16[7] = v10;
    v16[8] = v11;
    v16[9] = v12;
    uint64_t v13 = [v6 copyWithBlock:v16];

    v6 = (void *)v13;
  }

  return v5;
}

void __66__SBSAAcceptanceBounceBehaviorProvider_updatedContextFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    v3 = self;
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
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    Class v10 = NSClassFromString(&cfstr_Sbsacontextmut.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAAcceptanceBounceBehaviorProvider.m", 109, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  objc_msgSend(v6, "setInertContainerFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(SBSASequencedBehaviorProvider *)self activePhase];
  switch(v10)
  {
    case 3:
      if (!self->_triggeredBlock)
      {
        lastSeenLastChangingElementTransition = self->_lastSeenLastChangingElementTransition;
        uint64_t v15 = [v8 lastChangingElementLayoutTransition];
        v16 = v15;
        if (lastSeenLastChangingElementTransition)
        {
          char v17 = BSEqualObjects();

          if ((v17 & 1) == 0) {
            self->_shouldBeRemovedUponLayoutChange = 1;
          }
        }
        else
        {
          v18 = self->_lastSeenLastChangingElementTransition;
          self->_lastSeenLastChangingElementTransition = v15;
        }
      }
      uint64_t v11 = [(SBSAAcceptanceBounceBehaviorProvider *)self _updatedRevealAcceptedElementPreferencesFromPreferences:v8 context:v9 relevantPropertyIdentity:a5];
      break;
    case 2:
      uint64_t v11 = [(SBSAAcceptanceBounceBehaviorProvider *)self _updatedReboundingPreferencesFromPreferences:v8 context:v9 relevantPropertyIdentity:a5];
      break;
    case 1:
      uint64_t v11 = [(SBSAAcceptanceBounceBehaviorProvider *)self _updatedStretchingPreferencesFromPreferences:v8 context:v9 relevantPropertyIdentity:a5];
      break;
    default:
      v19.receiver = self;
      v19.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
      uint64_t v11 = [(SBSASequencedBehaviorProvider *)&v19 updatedPreferencesFromPreferences:v8 context:v9 relevantPropertyIdentity:a5];
      break;
  }
  uint64_t v12 = (void *)v11;

  return v12;
}

- (BOOL)phaseIsTimeDelayBased:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
  BOOL result = -[SBSASequencedBehaviorProvider phaseIsTimeDelayBased:](&v6, sel_phaseIsTimeDelayBased_);
  if (a3 == 4 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return 1;
  }
  return result;
}

- (double)delayForPhase:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBSAAcceptanceBounceBehaviorProvider;
  -[SBSASequencedBehaviorProvider delayForPhase:](&v11, sel_delayForPhase_);
  double v6 = v5;
  objc_super v7 = [(id)objc_opt_class() settings];
  id v8 = v7;
  switch(a3)
  {
    case 4:
      if (self->_style) {
        [v7 acceptanceSideBounceFinishingDelay];
      }
      else {
        [v7 acceptanceUpBounceFinishingDelay];
      }
      goto LABEL_13;
    case 3:
      if (self->_style) {
        [v7 acceptanceSideBounceItemAppearanceDelayOffset];
      }
      else {
        [v7 acceptanceUpBounceItemAppearanceDelayOffset];
      }
      goto LABEL_13;
    case 2:
      if (self->_style) {
        [v7 acceptanceSideBounceReboundDelay];
      }
      else {
        [v7 acceptanceUpBounceReboundDelay];
      }
LABEL_13:
      double v6 = v9;
      break;
  }

  return v6;
}

- (id)_updatedStretchingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __118__SBSAAcceptanceBounceBehaviorProvider__updatedStretchingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v7[3] = &unk_1E6AF53A0;
  v7[4] = self;
  v7[5] = a2;
  double v5 = objc_msgSend(a3, "copyWithBlock:", v7, a4, a5);
  return v5;
}

void __118__SBSAAcceptanceBounceBehaviorProvider__updatedStretchingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (!v2) {
    goto LABEL_9;
  }
  v3 = self;
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    objc_super v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAAcceptanceBounceBehaviorProvider.m", 165, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];

LABEL_9:
    id v6 = 0;
  }

  id v13 = [(id)objc_opt_class() settings];
  v33 = v13;
  v34 = v2;
  if (*(void *)(*(void *)(a1 + 32) + 80)) {
    [v13 acceptanceBounceSideStretch];
  }
  else {
  objc_super v14 = [v13 acceptanceBounceStretch];
  }
  uint64_t v15 = [v6 containerViewDescriptions];
  v16 = (void *)[v15 mutableCopy];

  char v17 = [v16 firstObject];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __118__SBSAAcceptanceBounceBehaviorProvider__updatedStretchingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2;
  v42[3] = &unk_1E6AF9DA0;
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  id v43 = v17;
  uint64_t v44 = v18;
  v42[4] = v19;
  v32 = (void *)[v17 copyWithBlock:v42];
  objc_msgSend(v16, "replaceObjectAtIndex:withObject:", 0);
  [v6 setContainerViewDescriptions:v16];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v16;
  uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v36 = *(void *)v39;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v39 != v36) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v38 + 1) + 8 * v22);
        v24 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v14];
        v25 = [SBSAInterfaceElementPropertyIdentity alloc];
        v26 = [v23 interfaceElementIdentifier];
        v27 = [(SBSAInterfaceElementPropertyIdentity *)v25 initWithAssociatedInterfaceElementIdentifier:v26 andProperty:@"bounds"];
        [v6 setAnimatedTransitionDescription:v24 forProperty:v27 withMilestones:0];

        v28 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v14];
        v29 = [SBSAInterfaceElementPropertyIdentity alloc];
        v30 = [v23 interfaceElementIdentifier];
        v31 = [(SBSAInterfaceElementPropertyIdentity *)v29 initWithAssociatedInterfaceElementIdentifier:v30 andProperty:@"center"];
        [v6 setAnimatedTransitionDescription:v28 forProperty:v31 withMilestones:0];

        ++v22;
      }
      while (v21 != v22);
      uint64_t v21 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v21);
  }
}

void __118__SBSAAcceptanceBounceBehaviorProvider__updatedStretchingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        double v5 = v4;
      }
      else {
        double v5 = 0;
      }
    }
    else
    {
      double v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsaviewdescri.isa);
    objc_super v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAAcceptanceBounceBehaviorProvider.m", 171, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [*(id *)(a1 + 40) bounds];
  [*(id *)(a1 + 40) center];
  SBUnintegralizedRectCenteredAboutPoint();
  objc_msgSend(*(id *)(a1 + 32), "_expandedBouncingContainerViewFrameForBounceStyle:unexpandedFrame:", *(void *)(*(void *)(a1 + 32) + 80));
  SBRectWithSize();
  objc_msgSend(v6, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");
}

- (id)_updatedReboundingPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __118__SBSAAcceptanceBounceBehaviorProvider__updatedReboundingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v7[3] = &unk_1E6AF53A0;
  v7[4] = self;
  v7[5] = a2;
  double v5 = objc_msgSend(a3, "copyWithBlock:", v7, a4, a5);
  return v5;
}

void __118__SBSAAcceptanceBounceBehaviorProvider__updatedReboundingPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(id)objc_opt_class() settings];
  uint64_t v34 = a1;
  v31 = v4;
  if (*(void *)(*(void *)(a1 + 32) + 80)) {
    [v4 acceptanceBounceSideRebound];
  }
  else {
  v35 = [v4 acceptanceBounceRebound];
  }
  id v5 = v3;
  if (!v5) {
    goto LABEL_12;
  }
  id v6 = self;
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (!v9)
  {
    Class v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = *(void *)(v34 + 32);
    uint64_t v11 = *(void *)(v34 + 40);
    Class v13 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    objc_super v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    [v10 handleFailureInMethod:v11, v12, @"SBSAAcceptanceBounceBehaviorProvider.m", 191, @"Unexpected class – expected '%@', got '%@'", v13, v15 object file lineNumber description];

LABEL_12:
    id v9 = 0;
  }
  v30 = v5;

  v16 = [v9 containerViewDescriptions];
  char v17 = (void *)[v16 mutableCopy];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v33 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v22 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v35];
        v23 = [SBSAInterfaceElementPropertyIdentity alloc];
        v24 = [v21 interfaceElementIdentifier];
        v25 = [(SBSAInterfaceElementPropertyIdentity *)v23 initWithAssociatedInterfaceElementIdentifier:v24 andProperty:@"bounds"];
        [v9 setAnimatedTransitionDescription:v22 forProperty:v25 withMilestones:0];

        v26 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v35];
        v27 = [SBSAInterfaceElementPropertyIdentity alloc];
        v28 = [v21 interfaceElementIdentifier];
        v29 = [(SBSAInterfaceElementPropertyIdentity *)v27 initWithAssociatedInterfaceElementIdentifier:v28 andProperty:@"center"];
        [v9 setAnimatedTransitionDescription:v26 forProperty:v29 withMilestones:0];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v19);
  }
}

- (id)_updatedRevealAcceptedElementPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__119;
  v25 = __Block_byref_object_dispose__119;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __129__SBSAAcceptanceBounceBehaviorProvider__updatedRevealAcceptedElementPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v20[3] = &unk_1E6AFDF60;
  v20[5] = &v21;
  v20[6] = a2;
  v20[4] = self;
  uint64_t v11 = (void *)[v9 copyWithBlock:v20];
  if (self->_triggeredBlock)
  {
    uint64_t v12 = [SBSACalloutBlockAction alloc];
    id triggeredBlock = self->_triggeredBlock;
    v28[0] = @"acceptanceBounceProvider.completion";
    objc_super v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    uint64_t v15 = [(SBSACalloutBlockAction *)v12 initWithCalloutBlock:triggeredBlock reasons:v14];

    id v16 = self->_triggeredBlock;
    self->_id triggeredBlock = 0;

    v27 = v15;
    char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    uint64_t v18 = [v11 copyByAddingActions:v17];

    uint64_t v11 = (void *)v18;
  }
  if (a5) {
    *a5 = (id) v22[5];
  }
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __129__SBSAAcceptanceBounceBehaviorProvider__updatedRevealAcceptedElementPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(void *a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(id)objc_opt_class() settings];
  id v5 = v4;
  id v6 = a1;
  if (*(void *)(a1[4] + 80)) {
    [v4 acceptanceBounceSideLayout];
  }
  else {
  v49 = [v4 acceptanceBounceLayout];
  }
  if (*(void *)(a1[4] + 80)) {
    [v5 acceptanceBounceSideLayoutY];
  }
  else {
  v48 = [v5 acceptanceBounceLayoutY];
  }
  id v7 = v3;
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v8 = self;
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;

  if (!v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = v6[6];
    uint64_t v14 = v6[4];
    Class v15 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v16 = (objc_class *)objc_opt_class();
    char v17 = NSStringFromClass(v16);
    [v12 handleFailureInMethod:v13, v14, @"SBSAAcceptanceBounceBehaviorProvider.m", 209, @"Unexpected class – expected '%@', got '%@'", v15, v17 object file lineNumber description];

LABEL_15:
    id v11 = 0;
  }
  v45 = v7;
  uint64_t v46 = v5;

  uint64_t v18 = [v11 containerViewDescriptions];
  uint64_t v19 = (void *)[v18 mutableCopy];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v19;
  uint64_t v20 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    char v22 = 1;
    uint64_t v23 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v51 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        id v26 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v49];
        v27 = v26;
        if (v22)
        {
          uint64_t v28 = [v26 copyBySettingAuxillaryBehaviorSettings:v48 forKeyPath:@"size.height"];

          v27 = (void *)v28;
        }
        v29 = [SBSAInterfaceElementPropertyIdentity alloc];
        v30 = [v25 interfaceElementIdentifier];
        v31 = [(SBSAInterfaceElementPropertyIdentity *)v29 initWithAssociatedInterfaceElementIdentifier:v30 andProperty:@"bounds"];
        [v11 setAnimatedTransitionDescription:v27 forProperty:v31 withMilestones:0];

        v32 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v49];
        uint64_t v33 = v32;
        if (v22)
        {
          uint64_t v34 = [v32 copyBySettingAuxillaryBehaviorSettings:v48 forKeyPath:@"y"];

          uint64_t v33 = (void *)v34;
        }
        v35 = [SBSAInterfaceElementPropertyIdentity alloc];
        long long v36 = [v25 interfaceElementIdentifier];
        long long v37 = [(SBSAInterfaceElementPropertyIdentity *)v35 initWithAssociatedInterfaceElementIdentifier:v36 andProperty:@"center"];
        [v11 setAnimatedTransitionDescription:v33 forProperty:v37 withMilestones:0];

        char v22 = 0;
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      char v22 = 0;
    }
    while (v21);
  }

  long long v38 = [v11 containerViewDescriptions];
  long long v39 = [v38 firstObject];

  long long v40 = [SBSAInterfaceElementPropertyIdentity alloc];
  uint64_t v41 = [v39 interfaceElementIdentifier];
  uint64_t v42 = [(SBSAInterfaceElementPropertyIdentity *)v40 initWithAssociatedInterfaceElementIdentifier:v41 andProperty:@"bounds"];
  uint64_t v43 = *(void *)(v6[5] + 8);
  uint64_t v44 = *(void **)(v43 + 40);
  *(void *)(v43 + 40) = v42;
}

- (CGRect)_expandedBouncingContainerViewFrameForBounceStyle:(int64_t)a3 unexpandedFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = [(id)objc_opt_class() settings];
  id v10 = v9;
  if (a3 == 2)
  {
    [v9 acceptanceSideBounceYPadding];
    double v12 = -v19;
    [v10 acceptanceSideBounceYPadding];
    double v16 = -v20;
    [v10 acceptanceSideBounceXStretch];
    double v18 = -v21;
    double v14 = 0.0;
  }
  else if (a3 == 1)
  {
    [v9 acceptanceSideBounceYPadding];
    double v12 = -v22;
    [v10 acceptanceSideBounceXStretch];
    double v14 = -v23;
    [v10 acceptanceSideBounceYPadding];
    double v16 = -v24;
    double v18 = 0.0;
  }
  else if (a3)
  {
    double v12 = *MEMORY[0x1E4F437F8];
    double v14 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  else
  {
    [v9 acceptanceUpBounceYStretch];
    double v12 = -v11;
    [v10 acceptanceUpBounceXPadding];
    double v14 = -v13;
    [v10 acceptanceUpBounceYDownStretch];
    double v16 = -v15;
    [v10 acceptanceUpBounceXPadding];
    double v18 = -v17;
  }
  double v25 = width - (v18 + v14);

  double v26 = x + v14;
  double v27 = y + v12;
  double v28 = v25;
  double v29 = height - (v16 + v12);
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenLastChangingElementTransition, 0);
  objc_storeStrong(&self->_triggeredBlock, 0);
}

@end