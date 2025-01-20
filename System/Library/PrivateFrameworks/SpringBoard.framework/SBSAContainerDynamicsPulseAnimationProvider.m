@interface SBSAContainerDynamicsPulseAnimationProvider
- (BOOL)_isTimerExpiredWithIdentifier:(id)a3 context:(id)a4;
- (SAElementIdentifying)elementIdentity;
- (SBSAContainerDynamicsPulseAnimationProvider)initWithElementIdentity:(id)a3 pulseStyle:(int64_t)a4;
- (id)_pulseSettings;
- (id)_startTimerForDuration:(double)a3 preferencesMutator:(id)a4;
- (id)preferencesFromContext:(id)a3;
- (void)_checkContextForCompletedContractionAnimationMilestone:(id)a3;
- (void)_pulseContractWithPreferencesMutator:(id)a3 context:(id)a4;
- (void)_pulseExpandWithPreferencesMutator:(id)a3 context:(id)a4;
- (void)_pulseWaitingToExpandWithPreferencesMutator:(id)a3 context:(id)a4;
- (void)_updatePreferencesContainerWithInterfaceElementIdentifier:(id)a3 toScale:(double)a4 settings:(id)a5 preferencesMutator:(id)a6 context:(id)a7;
- (void)didRequestAdditionalPulse:(id)a3;
@end

@implementation SBSAContainerDynamicsPulseAnimationProvider

- (SBSAContainerDynamicsPulseAnimationProvider)initWithElementIdentity:(id)a3 pulseStyle:(int64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSAContainerDynamicsPulseAnimationProvider;
  v7 = [(SBSABasePreferencesProvider *)&v17 initWithParentProvider:0];
  if (v7)
  {
    uint64_t v8 = [v6 clientIdentifier];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [v6 elementIdentifier];

      if (v10)
      {
        v11 = [SBSAElementIdentification alloc];
        v12 = [v6 clientIdentifier];
        v13 = [v6 elementIdentifier];
        uint64_t v14 = [(SBSAElementIdentification *)v11 initWithClientIdentifier:v12 elementIdentifier:v13];
        elementIdentity = v7->_elementIdentity;
        v7->_elementIdentity = (SAElementIdentifying *)v14;
      }
    }
    v7->_pulseStyle = a4;
  }

  return v7;
}

- (id)preferencesFromContext:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int64_t phase = self->_phase;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__30;
  v43 = __Block_byref_object_dispose__30;
  id v44 = 0;
  id v7 = v5;
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v8 = self;
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  if (!v11)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    Class v13 = NSClassFromString(&cfstr_Sbsacontext.isa);
    uint64_t v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v12 handleFailureInMethod:a2, self, @"SBSAContainerDynamicsPulseAnimationProvider.m", 73, @"Unexpected class – expected '%@', got '%@'", v13, v15 object file lineNumber description];

LABEL_9:
    id v11 = 0;
  }

  v16 = (void *)v40[5];
  v40[5] = (uint64_t)v11;

  objc_super v17 = [(id)v40[5] preferences];
  uint64_t v18 = objc_opt_class();
  id v19 = v17;
  if (v18)
  {
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }
  id v21 = v20;

  uint64_t v22 = v40[5];
  v38.receiver = self;
  v38.super_class = (Class)SBSAContainerDynamicsPulseAnimationProvider;
  v23 = [(SBSABasePreferencesProvider *)&v38 preferencesFromContext:v22];
  uint64_t v24 = objc_opt_class();
  id v25 = v23;
  if (v24)
  {
    if (objc_opt_isKindOfClass()) {
      v26 = v25;
    }
    else {
      v26 = 0;
    }
  }
  else
  {
    v26 = 0;
  }
  id v27 = v26;

  [(SBSAContainerDynamicsPulseAnimationProvider *)self _checkContextForCompletedContractionAnimationMilestone:v40[5]];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __70__SBSAContainerDynamicsPulseAnimationProvider_preferencesFromContext___block_invoke;
  v37[3] = &unk_1E6AFDF60;
  v37[4] = self;
  v37[5] = &v39;
  v37[6] = a2;
  v28 = (void *)[v27 copyWithBlock:v37];

  if (phase != self->_phase)
  {
    v29 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = [(id)v40[5] queryIteration];
      if ((unint64_t)(phase - 1) > 3) {
        v34 = @"Idle";
      }
      else {
        v34 = off_1E6AFDFD0[phase - 1];
      }
      unint64_t v35 = self->_phase - 1;
      if (v35 > 3) {
        v36 = @"Idle";
      }
      else {
        v36 = off_1E6AFDFD0[v35];
      }
      *(_DWORD *)buf = 134349570;
      uint64_t v46 = v33;
      __int16 v47 = 2112;
      v48 = v34;
      __int16 v49 = 2112;
      v50 = v36;
      _os_log_debug_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_DEBUG, "[%{public}lu] Pulse phase changed from: %@ to: %@", buf, 0x20u);
    }
  }
  uint64_t v30 = [(id)v40[5] copyByUpdatingPreferences:v28];
  v31 = (void *)v40[5];
  v40[5] = v30;

  if (self->_phase == 4) {
    [(SBSABasePreferencesProvider *)self removeFromParentProvider];
  }
  _Block_object_dispose(&v39, 8);

  return v28;
}

void __70__SBSAContainerDynamicsPulseAnimationProvider_preferencesFromContext___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v15 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  v4 = self;
  id v5 = v15;
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

  id v3 = v15;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = a1[6];
    uint64_t v10 = a1[4];
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    v12 = (objc_class *)objc_opt_class();
    Class v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerDynamicsPulseAnimationProvider.m", 78, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v15;
LABEL_9:
    id v7 = 0;
  }

  uint64_t v14 = (void *)a1[4];
  switch(v14[4])
  {
    case 0:
      v14[4] = 1;
      uint64_t v14 = (void *)a1[4];
      goto LABEL_12;
    case 1:
LABEL_12:
      [v14 _pulseWaitingToExpandWithPreferencesMutator:v7 context:*(void *)(*(void *)(a1[5] + 8) + 40)];
      break;
    case 2:
      [v14 _pulseExpandWithPreferencesMutator:v7 context:*(void *)(*(void *)(a1[5] + 8) + 40)];
      break;
    case 3:
      [v14 _pulseContractWithPreferencesMutator:v7 context:*(void *)(*(void *)(a1[5] + 8) + 40)];
      break;
    default:
      break;
  }
}

- (void)didRequestAdditionalPulse:(id)a3
{
  id v17 = a3;
  int64_t phase = self->_phase;
  if (phase == 1)
  {
    id v5 = &OBJC_IVAR___SBSAContainerDynamicsPulseAnimationProvider__waitingToExpandTimerIdentifier;
    goto LABEL_5;
  }
  if (phase == 2)
  {
    id v5 = &OBJC_IVAR___SBSAContainerDynamicsPulseAnimationProvider__expandingTimerIdentifier;
LABEL_5:
    uint64_t v6 = *v5;
    id v7 = *(Class *)((char *)&self->super.super.isa + v6);
    *(Class *)((char *)&self->super.super.isa + v6) = 0;
  }
  self->_int64_t phase = 0;
  uint64_t v8 = [v17 participantIdentifier];
  uint64_t v9 = [v8 clientIdentifier];
  if (v9
    && (uint64_t v10 = (void *)v9,
        [v8 elementIdentifier],
        Class v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v12 = [SBSAElementIdentification alloc];
    Class v13 = [v8 clientIdentifier];
    uint64_t v14 = [v8 elementIdentifier];
    id v15 = [(SBSAElementIdentification *)v12 initWithClientIdentifier:v13 elementIdentifier:v14];
    elementIdentity = self->_elementIdentity;
    self->_elementIdentity = v15;
  }
  else
  {
    Class v13 = self->_elementIdentity;
    self->_elementIdentity = 0;
  }

  self->_pulseStyle = [v17 pulseStyle];
}

- (id)_pulseSettings
{
  id v3 = [(id)objc_opt_class() settings];
  v4 = v3;
  int64_t pulseStyle = self->_pulseStyle;
  if (pulseStyle)
  {
    if (pulseStyle != 1) {
      goto LABEL_6;
    }
    uint64_t v6 = [v3 pulseIndicatorSettings];
  }
  else
  {
    uint64_t v6 = [v3 pulseNoActionSettings];
  }
  self = v6;
LABEL_6:

  return self;
}

- (void)_pulseWaitingToExpandWithPreferencesMutator:(id)a3 context:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([(SBSAContainerDynamicsPulseAnimationProvider *)self _isTimerExpiredWithIdentifier:self->_expandingTimerIdentifier context:v6])
  {
    self->_int64_t phase = 2;
    [(SBSAContainerDynamicsPulseAnimationProvider *)self _pulseExpandWithPreferencesMutator:v10 context:v6];
  }
  else if (!self->_expandingTimerIdentifier)
  {
    id v7 = [(SBSAContainerDynamicsPulseAnimationProvider *)self _pulseSettings];
    [v7 expandDelay];
    -[SBSAContainerDynamicsPulseAnimationProvider _startTimerForDuration:preferencesMutator:](self, "_startTimerForDuration:preferencesMutator:", v10);
    uint64_t v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    expandingTimerIdentifier = self->_expandingTimerIdentifier;
    self->_expandingTimerIdentifier = v8;
  }
}

- (void)_pulseExpandWithPreferencesMutator:(id)a3 context:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(SBSAContainerDynamicsPulseAnimationProvider *)self _isTimerExpiredWithIdentifier:self->_expandingTimerIdentifier context:v7])
  {
    self->_int64_t phase = 3;
    [(SBSAContainerDynamicsPulseAnimationProvider *)self _pulseContractWithPreferencesMutator:v6 context:v7];
  }
  else
  {
    if (!self->_expandingTimerIdentifier)
    {
      uint64_t v8 = [(SBSAContainerDynamicsPulseAnimationProvider *)self _pulseSettings];
      [v8 expandDuration];
      -[SBSAContainerDynamicsPulseAnimationProvider _startTimerForDuration:preferencesMutator:](self, "_startTimerForDuration:preferencesMutator:", v6);
      uint64_t v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      expandingTimerIdentifier = self->_expandingTimerIdentifier;
      self->_expandingTimerIdentifier = v9;
    }
    Class v11 = [v6 containerViewDescriptions];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __90__SBSAContainerDynamicsPulseAnimationProvider__pulseExpandWithPreferencesMutator_context___block_invoke;
    v22[3] = &unk_1E6AFBBB8;
    v22[4] = self;
    v12 = objc_msgSend(v11, "bs_firstObjectPassingTest:", v22);

    Class v13 = [v12 interfaceElementIdentifier];
    if (v13)
    {
      uint64_t v14 = [(SBSAContainerDynamicsPulseAnimationProvider *)self _pulseSettings];
      [v14 expandScale];
      double v16 = v15;
      id v17 = [(SBSAContainerDynamicsPulseAnimationProvider *)self _pulseSettings];
      uint64_t v18 = [v17 expandBehaviorSettings];
      [(SBSAContainerDynamicsPulseAnimationProvider *)self _updatePreferencesContainerWithInterfaceElementIdentifier:v13 toScale:v18 settings:v6 preferencesMutator:v7 context:v16];

      objc_storeWeak((id *)&self->_expandedInterfaceElementIdentifier, v13);
    }
    else
    {
      self->_int64_t phase = 4;
      id v19 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [v7 queryIteration];
        elementIdentity = self->_elementIdentity;
        *(_DWORD *)buf = 134349314;
        uint64_t v24 = v20;
        __int16 v25 = 2112;
        v26 = elementIdentity;
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}lu] [Pulse] Element requested for pulse not found. Ignoring pulse request for: '%@'", buf, 0x16u);
      }
    }
  }
}

uint64_t __90__SBSAContainerDynamicsPulseAnimationProvider__pulseExpandWithPreferencesMutator_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 associatedSystemApertureElementIdentity];
  uint64_t v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

- (void)_pulseContractWithPreferencesMutator:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandedInterfaceElementIdentifier);
  if (!WeakRetained)
  {
    self->_int64_t phase = 4;
    contractionCompletionMilestonePropertyIdentity = self->_contractionCompletionMilestonePropertyIdentity;
    self->_contractionCompletionMilestonePropertyIdentity = 0;

    Class v13 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SBSAContainerDynamicsPulseAnimationProvider _pulseContractWithPreferencesMutator:context:](v7);
    }
    goto LABEL_6;
  }
  uint64_t v9 = [(SBSAContainerDynamicsPulseAnimationProvider *)self _pulseSettings];
  id v10 = [v9 contractBehaviorSettings];
  [(SBSAContainerDynamicsPulseAnimationProvider *)self _updatePreferencesContainerWithInterfaceElementIdentifier:WeakRetained toScale:v10 settings:v6 preferencesMutator:v7 context:1.0];

  if (!self->_contractionCompletionMilestonePropertyIdentity)
  {
    Class v11 = [[SBSAInterfaceElementPropertyIdentity alloc] initWithAssociatedInterfaceElementIdentifier:WeakRetained andProperty:@"bounds"];
    v12 = self->_contractionCompletionMilestonePropertyIdentity;
    self->_contractionCompletionMilestonePropertyIdentity = v11;

    Class v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", 0x1F3348CE8, 0);
    [v6 addMilestones:v13 forPropertyIdentity:self->_contractionCompletionMilestonePropertyIdentity];
LABEL_6:
  }
  objc_storeWeak((id *)&self->_expandedInterfaceElementIdentifier, 0);
}

- (void)_checkContextForCompletedContractionAnimationMilestone:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_phase == 3)
  {
    if (!self->_contractionCompletionMilestonePropertyIdentity)
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"SBSAContainerDynamicsPulseAnimationProvider.m", 205, @"If we are in the contract phase, we should be tracking the contraction milestone" object file lineNumber description];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v16 = v5;
    id v6 = [v5 animatedTransitionResults];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          Class v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v12 = [v11 associatedInterfaceElementPropertyIdentity];
          int v13 = BSEqualObjects();

          if (v13 && [v11 isTransitionEndTargeted])
          {
            self->_int64_t phase = 4;
            contractionCompletionMilestonePropertyIdentity = self->_contractionCompletionMilestonePropertyIdentity;
            self->_contractionCompletionMilestonePropertyIdentity = 0;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    id v5 = v16;
  }
}

- (BOOL)_isTimerExpiredWithIdentifier:(id)a3 context:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 elapsedTimerDescriptions];
  if ([v7 count])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__SBSAContainerDynamicsPulseAnimationProvider__isTimerExpiredWithIdentifier_context___block_invoke;
    v12[3] = &unk_1E6AFDF88;
    id v13 = v6;
    uint64_t v8 = [v7 indexOfObjectPassingTest:v12];
    BOOL v9 = v8 != 0x7FFFFFFFFFFFFFFFLL;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      expandingTimerIdentifier = self->_expandingTimerIdentifier;
      self->_expandingTimerIdentifier = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __85__SBSAContainerDynamicsPulseAnimationProvider__isTimerExpiredWithIdentifier_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 timerDescriptionIdentifier];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

- (id)_startTimerForDuration:(double)a3 preferencesMutator:(id)a4
{
  id v5 = a4;
  id v6 = [[SBSATimerDescription alloc] initWithTimeInterval:a3];
  uint64_t v7 = [(SBSATimerDescription *)v6 timerDescriptionIdentifier];
  uint64_t v8 = [v5 timerDescriptions];
  if (v8)
  {
    BOOL v9 = [v5 timerDescriptions];
    id v10 = (id)[v9 mutableCopy];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }

  [v10 addObject:v6];
  [v5 setTimerDescriptions:v10];

  return v7;
}

- (void)_updatePreferencesContainerWithInterfaceElementIdentifier:(id)a3 toScale:(double)a4 settings:(id)a5 preferencesMutator:(id)a6 context:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v17 = [v15 containerViewDescriptions];
  long long v18 = (void *)[v17 mutableCopy];

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __149__SBSAContainerDynamicsPulseAnimationProvider__updatePreferencesContainerWithInterfaceElementIdentifier_toScale_settings_preferencesMutator_context___block_invoke;
  v46[3] = &unk_1E6AFBBB8;
  id v19 = v13;
  id v47 = v19;
  long long v20 = objc_msgSend(v18, "bs_firstObjectPassingTest:", v46);
  id v21 = v20;
  if (v20)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __149__SBSAContainerDynamicsPulseAnimationProvider__updatePreferencesContainerWithInterfaceElementIdentifier_toScale_settings_preferencesMutator_context___block_invoke_2;
    v41[3] = &unk_1E6AFDFB0;
    SEL v44 = a2;
    v41[4] = self;
    id v22 = v20;
    id v42 = v22;
    double v45 = a4;
    id v43 = v16;
    objc_super v38 = (void *)[v22 copyWithBlock:v41];
    [v18 replaceObjectAtIndex:0 withObject:v38];
    [v15 setContainerViewDescriptions:v18];
    v23 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v14];
    uint64_t v24 = [SBSAInterfaceElementPropertyIdentity alloc];
    [v22 interfaceElementIdentifier];
    __int16 v25 = v40 = v14;
    v26 = [(SBSAInterfaceElementPropertyIdentity *)v24 initWithAssociatedInterfaceElementIdentifier:v25 andProperty:@"bounds"];

    [v15 setAnimatedTransitionDescription:v23 forProperty:v26 withMilestones:0];
    uint64_t v27 = [SBSAInterfaceElementPropertyIdentity alloc];
    [v22 interfaceElementIdentifier];
    id v39 = v19;
    v29 = id v28 = v16;
    uint64_t v30 = [(SBSAInterfaceElementPropertyIdentity *)v27 initWithAssociatedInterfaceElementIdentifier:v29 andProperty:@"contentScale"];
    [v15 associateAnimatedTransitionDescriptionOfProperty:v26 withProperty:v30 withMilestones:0];

    v31 = [SBSAInterfaceElementPropertyIdentity alloc];
    v32 = [v22 interfaceElementIdentifier];
    uint64_t v33 = [(SBSAInterfaceElementPropertyIdentity *)v31 initWithAssociatedInterfaceElementIdentifier:v32 andProperty:@"contentBounds"];
    [v15 associateAnimatedTransitionDescriptionOfProperty:v26 withProperty:v33 withMilestones:0];

    v34 = [SBSAInterfaceElementPropertyIdentity alloc];
    unint64_t v35 = [v22 interfaceElementIdentifier];
    v36 = [(SBSAInterfaceElementPropertyIdentity *)v34 initWithAssociatedInterfaceElementIdentifier:v35 andProperty:@"contentCenter"];
    [v15 associateAnimatedTransitionDescriptionOfProperty:v26 withProperty:v36 withMilestones:0];

    id v14 = v40;
    id v16 = v28;
    id v19 = v39;
  }
  else
  {
    self->_int64_t phase = 4;
    v37 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[SBSAContainerDynamicsPulseAnimationProvider _updatePreferencesContainerWithInterfaceElementIdentifier:toScale:settings:preferencesMutator:context:](v16);
    }
  }
}

uint64_t __149__SBSAContainerDynamicsPulseAnimationProvider__updatePreferencesContainerWithInterfaceElementIdentifier_toScale_settings_preferencesMutator_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 interfaceElementIdentifier];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

void __149__SBSAContainerDynamicsPulseAnimationProvider__updatePreferencesContainerWithInterfaceElementIdentifier_toScale_settings_preferencesMutator_context___block_invoke_2(uint64_t a1, void *a2)
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
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerDynamicsPulseAnimationProvider.m", 253, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  double v24 = 0.0;
  double v25 = 0.0;
  [*(id *)(a1 + 40) bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [*(id *)(a1 + 40) center];
  SBSAScaledAndClippedFrameByScalingDimensions(&v24, *(void **)(a1 + 48), v15, v17, v19, v21, v22, v23, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 64));
  BSRectWithSize();
  objc_msgSend(v7, "setBounds:");
  objc_msgSend(v7, "setContentScale:", v24, v25);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v7, "setContentBounds:");
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");
}

- (SAElementIdentifying)elementIdentity
{
  return self->_elementIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentity, 0);
  objc_destroyWeak((id *)&self->_expandedInterfaceElementIdentifier);
  objc_storeStrong((id *)&self->_contractionCompletionMilestonePropertyIdentity, 0);
  objc_storeStrong((id *)&self->_expandingTimerIdentifier, 0);
  objc_storeStrong((id *)&self->_waitingToExpandTimerIdentifier, 0);
}

- (void)_pulseContractWithPreferencesMutator:(void *)a1 context:.cold.1(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "[%{public}lu] [Pulse] Expanded interface element not found, skipping pulse contract animation for: '%@'", v3, v4, v5, v6, 2u);
}

- (void)_updatePreferencesContainerWithInterfaceElementIdentifier:(void *)a1 toScale:settings:preferencesMutator:context:.cold.1(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "[%{public}lu] [Pulse] Container requested for pulse scaling not found. Ignoring scaling for: '%@'", v3, v4, v5, v6, 2u);
}

@end