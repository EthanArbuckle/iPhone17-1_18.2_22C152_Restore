@interface SBSAMitosisTransitionProvider
- (BOOL)canPersistAcrossLayoutStateChangesToNewElementContexts:(id)a3;
- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4;
- (BOOL)phaseIsTimeDelayBased:(int64_t)a3;
- (double)delayForPhase:(int64_t)a3;
- (double)milestoneForPhase:(int64_t)a3;
- (id)_updatedBabyHeadstartPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (id)_updatedInitialUnanimatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (id)_updatedPrimaryLayoutPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (id)nameForPhase:(int64_t)a3;
- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (int64_t)finalPhase;
@end

@implementation SBSAMitosisTransitionProvider

- (int64_t)finalPhase
{
  return 5;
}

- (id)nameForPhase:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSAMitosisTransitionProvider;
  v4 = -[SBSASequencedBehaviorProvider nameForPhase:](&v7, sel_nameForPhase_);
  if ((unint64_t)a3 <= 5)
  {
    v5 = off_1E6B07A78[a3];

    v4 = v5;
  }
  return v4;
}

- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = [(SBSASequencedBehaviorProvider *)self participatingElementIdentification];
  if (v7)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v8 = [v6 elementContexts];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    BOOL v10 = v9 != 0;
    if (!v9) {
      goto LABEL_17;
    }
    int v11 = 0;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        v11 |= SAElementIdentityEqualToIdentity();
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);

    if (v11)
    {
      v14 = [v6 preferences];
      v15 = [v14 elementLayoutTransition];
      v16 = [v15 initialElementContexts];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __67__SBSAMitosisTransitionProvider_canProceedWithContext_shouldRetry___block_invoke;
      v20[3] = &unk_1E6AF9378;
      id v21 = v7;
      v17 = objc_msgSend(v16, "bs_firstObjectPassingTest:", v20);

      if (v17)
      {
        v18 = [v6 preferences];
        LODWORD(v9) = [v18 isCollisionImminent] ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
      v8 = v21;
LABEL_17:

      if (!a4) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  BOOL v10 = 0;
  LOBYTE(v9) = 0;
  if (a4) {
LABEL_13:
  }
    *a4 = v10;
LABEL_14:

  return v9;
}

uint64_t __67__SBSAMitosisTransitionProvider_canProceedWithContext_shouldRetry___block_invoke()
{
  return SAElementIdentityEqualToIdentity();
}

- (BOOL)canPersistAcrossLayoutStateChangesToNewElementContexts:(id)a3
{
  return 1;
}

- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  int64_t v11 = [(SBSASequencedBehaviorProvider *)self activePhase];
  switch(v11)
  {
    case 3:
      v14 = SBLogSystemAperturePreferencesStackMitosis();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[SBSAMitosisTransitionProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:].cold.4(v10);
      }

      v13 = [(SBSAMitosisTransitionProvider *)self _updatedPrimaryLayoutPreferencesFromPreferences:v9 context:v10 relevantPropertyIdentity:a5];
      break;
    case 2:
      v15 = SBLogSystemAperturePreferencesStackMitosis();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[SBSAMitosisTransitionProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:](v10);
      }

      v13 = [(SBSAMitosisTransitionProvider *)self _updatedBabyHeadstartPreferencesFromPreferences:v9 context:v10 relevantPropertyIdentity:a5];
      break;
    case 1:
      uint64_t v12 = SBLogSystemAperturePreferencesStackMitosis();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[SBSAMitosisTransitionProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:](v10);
      }

      v13 = [(SBSAMitosisTransitionProvider *)self _updatedInitialUnanimatedPreferencesFromPreferences:v9 context:v10 relevantPropertyIdentity:a5];
      break;
    default:
      v16 = SBLogSystemAperturePreferencesStackMitosis();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[SBSAMitosisTransitionProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:](v10);
      }

      v21.receiver = self;
      v21.super_class = (Class)SBSAMitosisTransitionProvider;
      v13 = [(SBSASequencedBehaviorProvider *)&v21 updatedPreferencesFromPreferences:v9 context:v10 relevantPropertyIdentity:a5];
      break;
  }
  v17 = v13;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __100__SBSAMitosisTransitionProvider_updatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v20[3] = &unk_1E6AF53A0;
  void v20[4] = self;
  v20[5] = a2;
  v18 = (void *)[v13 copyWithBlock:v20];

  return v18;
}

void __100__SBSAMitosisTransitionProvider_updatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    v3 = self;
    id v4 = v14;
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
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = a1 + 32;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v10 + 8);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v7 handleFailureInMethod:v9, v8, @"SBSAMitosisTransitionProvider.m", 115, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setBlobEnabled:1];
}

- (BOOL)phaseIsTimeDelayBased:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (double)milestoneForPhase:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSAMitosisTransitionProvider;
  -[SBSASequencedBehaviorProvider milestoneForPhase:](&v5, sel_milestoneForPhase_);
  if (a3 == 4) {
    objc_msgSend(&unk_1F3348CE8, "bs_CGFloatValue");
  }
  return result;
}

- (double)delayForPhase:(int64_t)a3
{
  if (a3 != 3) {
    return 0.0;
  }
  v3 = [(id)objc_opt_class() settings];
  [v3 mitosisHeadstartDelay];
  double v5 = v4;

  return v5;
}

- (id)_updatedInitialUnanimatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __118__SBSAMitosisTransitionProvider__updatedInitialUnanimatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v12[3] = &unk_1E6AF9DA0;
  id v13 = v8;
  SEL v14 = a2;
  v12[4] = self;
  id v9 = v8;
  uint64_t v10 = (void *)[a3 copyWithBlock:v12];

  return v10;
}

void __118__SBSAMitosisTransitionProvider__updatedInitialUnanimatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v43 = a1;
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
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(v43 + 48);
    uint64_t v10 = *(void *)(v43 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAMitosisTransitionProvider.m", 151, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    a1 = v43;
LABEL_9:
    id v7 = 0;
  }
  v41 = v3;

  v44 = v7;
  SEL v14 = [v7 containerViewDescriptions];
  v15 = (void *)[v14 mutableCopy];

  v16 = [*(id *)(a1 + 40) elementContexts];
  if ([v15 count])
  {
    unint64_t v17 = 0;
    v42 = v16;
    do
    {
      v18 = [v15 objectAtIndex:v17];
      v19 = SBSAElementContextAssociatedWithContainerViewDescription(v18, v16, 0);
      uint64_t v20 = [v16 indexOfObject:v19];
      objc_super v21 = [*(id *)(a1 + 32) participatingElementIdentification];
      int v22 = SAElementIdentityEqualToIdentity();

      if (v22)
      {
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __118__SBSAMitosisTransitionProvider__updatedInitialUnanimatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2;
        v45[3] = &unk_1E6AFDFB0;
        long long v23 = *(void **)(a1 + 40);
        uint64_t v24 = *(void *)(a1 + 32);
        uint64_t v48 = *(void *)(a1 + 48);
        v45[4] = v24;
        id v46 = v23;
        uint64_t v49 = v20;
        id v47 = v16;
        long long v25 = (void *)[v18 copyWithBlock:v45];

        [v15 replaceObjectAtIndex:v17 withObject:v25];
        v26 = [SBSAInterfaceElementPropertyIdentity alloc];
        uint64_t v27 = [v25 interfaceElementIdentifier];
        v28 = [(SBSAInterfaceElementPropertyIdentity *)v26 initWithAssociatedInterfaceElementIdentifier:v27 andProperty:@"bounds"];

        v29 = (void *)[(id)objc_opt_class() newUnanimatedTransitionDescription];
        [v44 setAnimatedTransitionDescription:v29 forProperty:v28 withMilestones:0];

        v30 = [SBSAInterfaceElementPropertyIdentity alloc];
        v31 = [v25 interfaceElementIdentifier];
        v32 = [(SBSAInterfaceElementPropertyIdentity *)v30 initWithAssociatedInterfaceElementIdentifier:v31 andProperty:@"center"];

        v33 = (void *)[(id)objc_opt_class() newUnanimatedTransitionDescription];
        [v44 setAnimatedTransitionDescription:v33 forProperty:v32 withMilestones:0];

        v34 = [SBSAInterfaceElementPropertyIdentity alloc];
        v35 = [v25 interfaceElementIdentifier];
        v36 = [(SBSAInterfaceElementPropertyIdentity *)v34 initWithAssociatedInterfaceElementIdentifier:v35 andProperty:@"contentBounds"];

        v37 = [SBSAInterfaceElementPropertyIdentity alloc];
        [v25 interfaceElementIdentifier];
        v39 = v38 = v15;
        v40 = [(SBSAInterfaceElementPropertyIdentity *)v37 initWithAssociatedInterfaceElementIdentifier:v39 andProperty:@"contentCenter"];

        v15 = v38;
        [v44 associateAnimatedTransitionDescriptionOfProperty:v28 withProperty:v36 withMilestones:0];
        v16 = v42;
        [v44 associateAnimatedTransitionDescriptionOfProperty:v32 withProperty:v40 withMilestones:0];

        a1 = v43;
        v18 = v25;
      }

      ++v17;
    }
    while (v17 < [v15 count]);
  }
  [v44 setContainerViewDescriptions:v15];
}

void __118__SBSAMitosisTransitionProvider__updatedInitialUnanimatedPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2(uint64_t a1, void *a2)
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
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAMitosisTransitionProvider.m", 161, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  [*(id *)(a1 + 40) inertContainerFrame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  SBSAAdjunctContainerMinimalSize(*(void **)(a1 + 40));
  BSRectWithSize();
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGAffineTransformMakeScale(&v52, 0.5, 0.5);
  v53.origin.x = v23;
  v53.origin.y = v25;
  v53.size.width = v27;
  v53.size.height = v29;
  CGRectApplyAffineTransform(v53, &v52);
  int v30 = SBSAAdjunctFrameIsOnLeft(*(void *)(a1 + 64), *(void **)(a1 + 48), *(void **)(a1 + 40));
  CGFloat v31 = v15;
  CGFloat v32 = v17;
  CGFloat v33 = v19;
  CGFloat v34 = v21;
  if (v30) {
    CGRectGetMinX(*(CGRect *)&v31);
  }
  else {
    CGRectGetMaxX(*(CGRect *)&v31);
  }
  v54.origin.x = v15;
  v54.origin.y = v17;
  v54.size.width = v19;
  v54.size.height = v21;
  CGRectGetMidY(v54);
  BSRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  BSRectWithSize();
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  UIRectGetCenter();
  double v44 = v43;
  double v46 = v45;
  objc_msgSend(v7, "setBounds:", v36, v38, v40, v42);
  objc_msgSend(v7, "setCenter:", v44, v46);
  memset(&v51, 0, sizeof(v51));
  [v7 contentScale];
  SBSAAffineTransformFromContentScale((uint64_t)&v51, v47, v48);
  CGAffineTransform v49 = v51;
  CGAffineTransformInvert(&v50, &v49);
  v55.origin.x = v36;
  v55.origin.y = v38;
  v55.size.width = v40;
  v55.size.height = v42;
  CGRect v56 = CGRectApplyAffineTransform(v55, &v50);
  objc_msgSend(v7, "setContentBounds:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");
}

- (id)_updatedBabyHeadstartPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __114__SBSAMitosisTransitionProvider__updatedBabyHeadstartPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke;
  v12[3] = &unk_1E6AF9DA0;
  id v13 = v8;
  SEL v14 = a2;
  v12[4] = self;
  id v9 = v8;
  uint64_t v10 = (void *)[a3 copyWithBlock:v12];

  return v10;
}

void __114__SBSAMitosisTransitionProvider__updatedBabyHeadstartPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke(uint64_t a1, void *a2)
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
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAMitosisTransitionProvider.m", 203, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  SEL v14 = [v7 containerViewDescriptions];
  CGFloat v15 = (void *)[v14 mutableCopy];

  if ([v15 count])
  {
    unint64_t v16 = 0;
    do
    {
      CGFloat v17 = [v15 objectAtIndex:v16];
      double v18 = [*(id *)(a1 + 40) elementContexts];
      CGFloat v19 = [*(id *)(a1 + 40) elementContexts];
      double v20 = SBSAElementContextAssociatedWithContainerViewDescription(v17, v19, 0);

      uint64_t v21 = [v18 indexOfObject:v20];
      double v22 = [*(id *)(a1 + 40) elementContexts];
      LODWORD(v21) = SBSAIsElementInCollectionSensorAttached(v21, v22);

      if (v21)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __114__SBSAMitosisTransitionProvider__updatedBabyHeadstartPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2;
        v26[3] = &unk_1E6AF9DA0;
        v26[4] = *(void *)(a1 + 32);
        long long v25 = *(_OWORD *)(a1 + 40);
        id v23 = (id)v25;
        long long v27 = v25;
        uint64_t v24 = [v17 copyWithBlock:v26];

        [v15 replaceObjectAtIndex:v16 withObject:v24];
        CGFloat v17 = (void *)v24;
      }

      ++v16;
    }
    while (v16 < [v15 count]);
  }
  [v7 setContainerViewDescriptions:v15];
}

void __114__SBSAMitosisTransitionProvider__updatedBabyHeadstartPreferencesFromPreferences_context_relevantPropertyIdentity___block_invoke_2(uint64_t a1, void *a2)
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
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    Class v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAMitosisTransitionProvider.m", 213, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [*(id *)(a1 + 40) inertContainerFrame];
  BSRectWithSize();
  objc_msgSend(v6, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");
}

- (id)_updatedPrimaryLayoutPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 containerViewDescriptions];
  Class v10 = [v8 containerViewDescriptions];

  Class v11 = objc_msgSend(v9, "objectAtIndex:", (unint64_t)objc_msgSend(v10, "count") > 1);

  uint64_t v12 = [v11 interfaceElementIdentifier];
  *a5 = [[SBSAInterfaceElementPropertyIdentity alloc] initWithAssociatedInterfaceElementIdentifier:v12 andProperty:@"bounds"];

  return v7;
}

- (void)updatedPreferencesFromPreferences:(void *)a1 context:relevantPropertyIdentity:.cold.1(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] Mitosis Provider: Default Case", v3, v4, v5, v6, v7);
}

- (void)updatedPreferencesFromPreferences:(void *)a1 context:relevantPropertyIdentity:.cold.2(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] Mitosis Provider: Unanimated layout", v3, v4, v5, v6, v7);
}

- (void)updatedPreferencesFromPreferences:(void *)a1 context:relevantPropertyIdentity:.cold.3(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] Mitosis Provider: Baby Headstart", v3, v4, v5, v6, v7);
}

- (void)updatedPreferencesFromPreferences:(void *)a1 context:relevantPropertyIdentity:.cold.4(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] Mitosis Provider: Primary Layout", v3, v4, v5, v6, v7);
}

@end