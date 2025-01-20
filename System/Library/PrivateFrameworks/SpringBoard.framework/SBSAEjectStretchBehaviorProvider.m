@interface SBSAEjectStretchBehaviorProvider
- (BOOL)_checkContextForExpiredContractionMilestone:(id)a3;
- (BOOL)_isTimerExpired:(id)a3;
- (id)preferencesFromContext:(id)a3;
- (void)_startTimerIfNecessary:(id)a3 context:(id)a4;
@end

@implementation SBSAEjectStretchBehaviorProvider

- (id)preferencesFromContext:(id)a3
{
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__55;
  v53 = __Block_byref_object_dispose__55;
  id v54 = 0;
  id v5 = a3;
  if (!v5) {
    goto LABEL_9;
  }
  v6 = self;
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  if (!v9)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    Class v11 = NSClassFromString(&cfstr_Sbsacontext.isa);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v10 handleFailureInMethod:a2, self, @"SBSAEjectStretchBehaviorProvider.m", 38, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v9 = 0;
  }

  v14 = (void *)v50[5];
  v50[5] = (uint64_t)v9;

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__55;
  v47 = __Block_byref_object_dispose__55;
  v15 = [(id)v50[5] preferences];
  uint64_t v16 = objc_opt_class();
  id v17 = v15;
  if (v16)
  {
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  id v19 = v18;

  id v48 = v19;
  v20 = [(id)objc_opt_class() settings];
  v21 = (void *)v44[5];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke;
  v39[3] = &unk_1E6B028C0;
  v39[4] = self;
  v41 = &v49;
  SEL v42 = a2;
  id v22 = v20;
  id v40 = v22;
  uint64_t v23 = [v21 copyWithBlock:v39];
  v24 = (void *)v44[5];
  v44[5] = v23;

  v25 = (void *)v50[5];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_29;
  v38[3] = &unk_1E6AFDF60;
  v38[4] = self;
  v38[5] = &v43;
  v38[6] = a2;
  uint64_t v26 = [v25 copyWithBlock:v38];
  v27 = (void *)v50[5];
  v50[5] = v26;

  uint64_t v28 = v50[5];
  v37.receiver = self;
  v37.super_class = (Class)SBSAEjectStretchBehaviorProvider;
  v29 = [(SBSABasePreferencesProvider *)&v37 preferencesFromContext:v28];
  uint64_t v30 = objc_opt_class();
  id v31 = v29;
  if (v30)
  {
    if (objc_opt_isKindOfClass()) {
      v32 = v31;
    }
    else {
      v32 = 0;
    }
  }
  else
  {
    v32 = 0;
  }
  id v33 = v32;

  v34 = (void *)v44[5];
  v44[5] = (uint64_t)v33;

  if (self->_phase == 3) {
    [(SBSABasePreferencesProvider *)self removeFromParentProvider];
  }
  id v35 = (id)v44[5];

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v35;
}

void __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAEjectStretchBehaviorProvider.m", 42, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  uint64_t v14 = *(void *)(a1 + 32);
  if (*(void *)(v14 + 32) <= 1uLL)
  {
    *(void *)(v14 + 32) = 1;
    char v15 = [*(id *)(a1 + 32) _isTimerExpired:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v16 = *(void **)(a1 + 32);
    if (v15)
    {
      v16[4] = 2;
      id v17 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_cold_2(a1 + 48);
      }
    }
    else
    {
      [v16 _startTimerIfNecessary:v7 context:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      v18 = [v7 containerViewDescriptions];
      id v17 = [v18 mutableCopy];

      id v19 = [v17 firstObject];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_2;
      v54[3] = &unk_1E6AF93C8;
      uint64_t v20 = *(void *)(a1 + 32);
      v21 = *(void **)(a1 + 40);
      uint64_t v57 = *(void *)(a1 + 56);
      v54[4] = v20;
      id v55 = v21;
      id v56 = v19;
      id v53 = v19;
      id v22 = (void *)[v53 copyWithBlock:v54];
      [v17 replaceObjectAtIndex:0 withObject:v22];
      [v7 setContainerViewDescriptions:v17];
      uint64_t v23 = [*(id *)(a1 + 40) ejectionStretchSettings];
      v24 = [SBSAInterfaceElementPropertyIdentity alloc];
      v25 = [v22 interfaceElementIdentifier];
      uint64_t v26 = [(SBSAInterfaceElementPropertyIdentity *)v24 initWithAssociatedInterfaceElementIdentifier:v25 andProperty:@"bounds"];

      v27 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v23];
      [v7 setAnimatedTransitionDescription:v27 forProperty:v26 withMilestones:0];

      uint64_t v28 = [SBSAInterfaceElementPropertyIdentity alloc];
      v29 = [v22 interfaceElementIdentifier];
      uint64_t v30 = [(SBSAInterfaceElementPropertyIdentity *)v28 initWithAssociatedInterfaceElementIdentifier:v29 andProperty:@"center"];
      [v7 associateAnimatedTransitionDescriptionOfProperty:v26 withProperty:v30 withMilestones:0];

      id v31 = [SBSAInterfaceElementPropertyIdentity alloc];
      v32 = [v22 interfaceElementIdentifier];
      id v33 = [(SBSAInterfaceElementPropertyIdentity *)v31 initWithAssociatedInterfaceElementIdentifier:v32 andProperty:@"cornerRadius"];
      [v7 associateAnimatedTransitionDescriptionOfProperty:v26 withProperty:v33 withMilestones:0];
    }
  }
  v34 = *(void **)(a1 + 32);
  if (v34[4] == 2)
  {
    if ([v34 _checkContextForExpiredContractionMilestone:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)])
    {
      *(void *)(*(void *)(a1 + 32) + 32) = 3;
      id v35 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_cold_1(a1 + 48);
      }
    }
    else
    {
      v36 = [v7 containerViewDescriptions];
      id v35 = [v36 mutableCopy];

      objc_super v37 = [v35 firstObject];
      v38 = [*(id *)(a1 + 40) ejectionContractionSettings];
      v39 = [SBSAInterfaceElementPropertyIdentity alloc];
      id v40 = [v37 interfaceElementIdentifier];
      v41 = [(SBSAInterfaceElementPropertyIdentity *)v39 initWithAssociatedInterfaceElementIdentifier:v40 andProperty:@"bounds"];

      if (!*(void *)(*(void *)(a1 + 32) + 48))
      {
        uint64_t v42 = [(SBSAInterfaceElementPropertyIdentity *)v41 copy];
        uint64_t v43 = *(void *)(a1 + 32);
        v44 = *(void **)(v43 + 48);
        *(void *)(v43 + 48) = v42;
      }
      uint64_t v45 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v38];
      v46 = [MEMORY[0x1E4F1CAD0] setWithObject:0x1F3348CE8];
      [v7 setAnimatedTransitionDescription:v45 forProperty:v41 withMilestones:v46];

      v47 = [SBSAInterfaceElementPropertyIdentity alloc];
      id v48 = [v37 interfaceElementIdentifier];
      uint64_t v49 = [(SBSAInterfaceElementPropertyIdentity *)v47 initWithAssociatedInterfaceElementIdentifier:v48 andProperty:@"center"];
      [v7 associateAnimatedTransitionDescriptionOfProperty:v41 withProperty:v49 withMilestones:0];

      v50 = [SBSAInterfaceElementPropertyIdentity alloc];
      uint64_t v51 = [v37 interfaceElementIdentifier];
      v52 = [(SBSAInterfaceElementPropertyIdentity *)v50 initWithAssociatedInterfaceElementIdentifier:v51 andProperty:@"cornerRadius"];
      [v7 associateAnimatedTransitionDescriptionOfProperty:v41 withProperty:v52 withMilestones:0];
    }
  }
}

void __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = a2;
  if (v15)
  {
    id v3 = self;
    id v4 = v15;
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
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    Class v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAEjectStretchBehaviorProvider.m", 51, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [*(id *)(a1 + 40) ejectionMaxCornerRadius];
  double v14 = v13;
  [*(id *)(a1 + 48) bounds];
  [*(id *)(a1 + 48) center];
  SBUnintegralizedRectCenteredAboutPoint();
  [*(id *)(a1 + 40) ejectionYUpOffset];
  [*(id *)(a1 + 40) ejectionYStretch];
  SBRectWithSize();
  objc_msgSend(v6, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");
  [v6 setCornerRadius:v14];
}

void __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_29(void *a1, void *a2)
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
    Class v10 = NSClassFromString(&cfstr_Sbsacontextmut.isa);
    Class v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAEjectStretchBehaviorProvider.m", 94, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setKeyLineRequiredForTransition:1];
  [v6 setPreferences:*(void *)(*(void *)(a1[5] + 8) + 40)];
}

- (BOOL)_isTimerExpired:(id)a3
{
  id v4 = a3;
  id v5 = [v4 elapsedTimerDescriptions];
  if ([v5 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__SBSAEjectStretchBehaviorProvider__isTimerExpired___block_invoke;
    v11[3] = &unk_1E6AFDF88;
    v11[4] = self;
    uint64_t v6 = [v5 indexOfObjectPassingTest:v11];
    BOOL v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      identifierOfActiveTimer = self->_identifierOfActiveTimer;
      self->_identifierOfActiveTimer = 0;

      uint64_t v9 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[SBSAEjectStretchBehaviorProvider _isTimerExpired:](v4);
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __52__SBSAEjectStretchBehaviorProvider__isTimerExpired___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 timerDescriptionIdentifier];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

- (void)_startTimerIfNecessary:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_identifierOfActiveTimer)
  {
    uint64_t v8 = [SBSATimerDescription alloc];
    uint64_t v9 = [(id)objc_opt_class() settings];
    [v9 ejectionStretchDuration];
    Class v10 = -[SBSATimerDescription initWithTimeInterval:](v8, "initWithTimeInterval:");

    Class v11 = [(SBSATimerDescription *)v10 timerDescriptionIdentifier];
    identifierOfActiveTimer = self->_identifierOfActiveTimer;
    self->_identifierOfActiveTimer = v11;

    id v13 = [v6 timerDescriptions];
    if (v13)
    {
      double v14 = [v6 timerDescriptions];
      id v15 = (id)[v14 mutableCopy];
    }
    else
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }

    [v15 addObject:v10];
    [v6 setTimerDescriptions:v15];
    uint64_t v16 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[SBSAEjectStretchBehaviorProvider _startTimerIfNecessary:context:](v7);
    }
  }
}

- (BOOL)_checkContextForExpiredContractionMilestone:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_pendingCollapsePropertyIdentity) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(a3, "animatedTransitionResults", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        Class v10 = [v9 associatedInterfaceElementPropertyIdentity];
        if (BSEqualObjects())
        {
          int v11 = [v9 isTransitionEndTargeted];

          if (v11)
          {
            pendingCollapsePropertyIdentity = self->_pendingCollapsePropertyIdentity;
            self->_pendingCollapsePropertyIdentity = 0;

            BOOL v13 = 1;
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCollapsePropertyIdentity, 0);
  objc_storeStrong((id *)&self->_identifierOfActiveTimer, 0);
}

void __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_1_15(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] [Eject] Complete", v3, v4, v5, v6, v7);
}

void __59__SBSAEjectStretchBehaviorProvider_preferencesFromContext___block_invoke_cold_2(uint64_t a1)
{
  OUTLINED_FUNCTION_1_15(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] [Eject] Moving to Contracting phase", v3, v4, v5, v6, v7);
}

- (void)_isTimerExpired:(void *)a1 .cold.1(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] [Eject] Timer Expired", v3, v4, v5, v6, v7);
}

- (void)_startTimerIfNecessary:(void *)a1 context:.cold.1(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] [Eject] Stretching, starting timer", v3, v4, v5, v6, v7);
}

@end