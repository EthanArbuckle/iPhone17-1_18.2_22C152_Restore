@interface SBSASequencedBehaviorProvider
- (BOOL)_isTimerExpired:(id)a3 duration:(double *)a4;
- (BOOL)canPersistAcrossLayoutStateChangesToNewElementContexts:(id)a3;
- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4;
- (BOOL)milestoneForPhaseRequiresAnimationFinished:(int64_t)a3;
- (BOOL)phaseIsTimeDelayBased:(int64_t)a3;
- (NSUUID)participatingInterfaceElementIdentifier;
- (SAElementIdentifying)participatingElementIdentification;
- (SBSASequencedBehaviorProvider)initWithParticipantIdentifier:(id)a3;
- (double)delayForPhase:(int64_t)a3;
- (double)milestoneForPhase:(int64_t)a3;
- (id)nameForPhase:(int64_t)a3;
- (id)preferencesFromContext:(id)a3;
- (id)updatedContextFromContext:(id)a3;
- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5;
- (int64_t)activePhase;
- (int64_t)finalPhase;
- (void)_setActivePhase:(int64_t)a3 context:(id)a4 reason:(id)a5;
- (void)_startTimerIfNecessary:(id)a3 withInterval:(double)a4;
@end

@implementation SBSASequencedBehaviorProvider

- (SBSASequencedBehaviorProvider)initWithParticipantIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSASequencedBehaviorProvider;
  v5 = [(SBSABasePreferencesProvider *)&v13 initWithParentProvider:0];
  if (v5)
  {
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v6 = [SBSAElementIdentification alloc];
      participatingInterfaceElementIdentifier = [v4 clientIdentifier];
      v8 = [v4 elementIdentifier];
      uint64_t v9 = [(SBSAElementIdentification *)v6 initWithClientIdentifier:participatingInterfaceElementIdentifier elementIdentifier:v8];
      participatingElementIdentification = v5->_participatingElementIdentification;
      v5->_participatingElementIdentification = (SAElementIdentifying *)v9;

LABEL_7:
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v4 copy];
      participatingInterfaceElementIdentifier = v5->_participatingInterfaceElementIdentifier;
      v5->_participatingInterfaceElementIdentifier = (NSUUID *)v11;
      goto LABEL_7;
    }
  }
LABEL_8:

  return v5;
}

- (id)preferencesFromContext:(id)a3
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v8 = v7;

    if (!v8)
    {
      v81 = [MEMORY[0x1E4F28B00] currentHandler];
      Class v82 = NSClassFromString(&cfstr_Sbsacontext.isa);
      v83 = (objc_class *)objc_opt_class();
      v84 = NSStringFromClass(v83);
      [v81 handleFailureInMethod:a2, self, @"SBSASequencedBehaviorProvider.m", 50, @"Unexpected class – expected '%@', got '%@'", v82, v84 object file lineNumber description];
    }
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v9 = [v8 preferences];
  if (v9)
  {
    v10 = self;
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v13 = v12;

    if (!v13)
    {
      v85 = [MEMORY[0x1E4F28B00] currentHandler];
      Class v86 = NSClassFromString(&cfstr_Sbsapreference.isa);
      v87 = (objc_class *)objc_opt_class();
      v88 = NSStringFromClass(v87);
      [v85 handleFailureInMethod:a2, self, @"SBSASequencedBehaviorProvider.m", 51, @"Unexpected class – expected '%@', got '%@'", v86, v88 object file lineNumber description];
    }
  }
  else
  {
    id v13 = 0;
  }

  v14 = [v8 elementContexts];
  char v117 = 0;
  v97 = v14;
  if (!self->_activePhase
    && ![(SBSASequencedBehaviorProvider *)self canProceedWithContext:v8 shouldRetry:&v117])
  {
LABEL_45:
    [(SBSASequencedBehaviorProvider *)self _setActivePhase:0 context:v8 reason:&__block_literal_global_45_0];
LABEL_46:
    char v32 = 1;
    goto LABEL_56;
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v15 = [v13 gestureDescriptions];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v113 objects:v132 count:16];
  id v96 = v4;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v114;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v114 != v18) {
          objc_enumerationMutation(v15);
        }
        if ([*(id *)(*((void *)&v113 + 1) + 8 * i) gestureRecognizerState] < 0)
        {
          id v20 = v13;
          int v21 = 1;
          goto LABEL_31;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v113 objects:v132 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  id v20 = v13;
  int v21 = 0;
LABEL_31:

  elementContexts = self->_elementContexts;
  if (elementContexts)
  {
    BOOL v23 = SBSAAreElementLayoutsEqualToLayouts(elementContexts, v14);
    int64_t activePhase = self->_activePhase;
    BOOL v25 = activePhase == [(SBSASequencedBehaviorProvider *)self finalPhase];
    if (v23)
    {
      int v26 = 0;
    }
    else
    {
      v28 = (void *)[v14 copy];
      int v26 = ![(SBSASequencedBehaviorProvider *)self canPersistAcrossLayoutStateChangesToNewElementContexts:v28];
    }
  }
  else
  {
    int64_t v27 = self->_activePhase;
    int v26 = 0;
    BOOL v25 = v27 == [(SBSASequencedBehaviorProvider *)self finalPhase];
  }
  if (((v21 | v26) & 1) != 0 || v25)
  {
    v31 = SBLogSystemAperturePreferencesStackSequencedBehaviors();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v78 = NSStringFromBOOL();
      v79 = NSStringFromBOOL();
      v80 = NSStringFromBOOL();
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = self;
      __int16 v126 = 2112;
      v127 = v78;
      __int16 v128 = 2112;
      v129 = v79;
      __int16 v130 = 2112;
      v131 = v80;
      _os_log_debug_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_DEBUG, "Will remove behavior provider %@ (gestureActive:%@, layoutStateChange:%@, finalPhase:%@)", buf, 0x2Au);
    }
    id v13 = v20;
    id v4 = v96;
    if (v25) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if (!self->_elementContexts)
  {
    if (v14) {
      v33 = v14;
    }
    else {
      v33 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&self->_elementContexts, v33);
    int v34 = [(SBSASequencedBehaviorProvider *)self finalPhase];
    if (v34 >= 1) {
      int v35 = 1;
    }
    else {
      int v35 = v34;
    }
    [(SBSASequencedBehaviorProvider *)self _setActivePhase:v35 context:v8 reason:&__block_literal_global_259];
    id v13 = v20;
    v30 = v8;
LABEL_54:
    id v4 = v96;
    goto LABEL_55;
  }
  int64_t v29 = self->_activePhase + 1;
  if ([(SBSASequencedBehaviorProvider *)self phaseIsTimeDelayBased:v29])
  {
    *(void *)buf = 0;
    id v13 = v20;
    v30 = v8;
    if ([(SBSASequencedBehaviorProvider *)self _isTimerExpired:v8 duration:buf])
    {
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_3;
      v107[3] = &__block_descriptor_40_e15___NSString_8__0l;
      v107[4] = *(void *)buf;
      [(SBSASequencedBehaviorProvider *)self _setActivePhase:v29 context:v8 reason:v107];
    }
    goto LABEL_54;
  }
  id v13 = v20;
  v30 = v8;
  id v4 = v96;
  if (self->_pendingPhaseTransitionPropertyIdentity)
  {
    [(SBSASequencedBehaviorProvider *)self milestoneForPhase:v29];
    double v65 = v64;
    objc_msgSend(&unk_1F3348CE8, "bs_CGFloatValue");
    BOOL v66 = BSFloatEqualToFloat()
       && [(SBSASequencedBehaviorProvider *)self milestoneForPhaseRequiresAnimationFinished:v29];
    if (v65 > 0.0)
    {
      int64_t v98 = v29;
      id v99 = v8;
      id v94 = v13;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      v68 = [v8 animatedTransitionResults];
      uint64_t v69 = [v68 countByEnumeratingWithState:&v109 objects:v124 count:16];
      if (!v69) {
        goto LABEL_103;
      }
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v110;
      while (1)
      {
        for (uint64_t j = 0; j != v70; ++j)
        {
          if (*(void *)v110 != v71) {
            objc_enumerationMutation(v68);
          }
          v73 = *(void **)(*((void *)&v109 + 1) + 8 * j);
          v74 = [v73 associatedInterfaceElementPropertyIdentity];
          if (!BSEqualObjects()
            || ([v73 targetedMilestone], !BSFloatApproximatelyEqualToFloat()))
          {

            continue;
          }
          if (!v66)
          {

LABEL_100:
            v108[0] = MEMORY[0x1E4F143A8];
            v108[1] = 3221225472;
            v108[2] = __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_2;
            v108[3] = &unk_1E6AFD560;
            v108[4] = v73;
            v76 = (void *)MEMORY[0x1D948C7A0](v108);
            [(SBSASequencedBehaviorProvider *)self _setActivePhase:v98 context:v99 reason:v76];
            pendingPhaseTransitionPropertyIdentity = self->_pendingPhaseTransitionPropertyIdentity;
            self->_pendingPhaseTransitionPropertyIdentity = 0;

            continue;
          }
          char v75 = [v73 finished];

          if (v75) {
            goto LABEL_100;
          }
        }
        uint64_t v70 = [v68 countByEnumeratingWithState:&v109 objects:v124 count:16];
        if (!v70)
        {
LABEL_103:

          id v4 = v96;
          id v13 = v94;
          v30 = v99;
          break;
        }
      }
    }
  }
LABEL_55:
  id v8 = [(SBSASequencedBehaviorProvider *)self updatedContextFromContext:v30];

  char v32 = 0;
LABEL_56:
  v36 = (void *)[v8 copyByUpdatingPreferences:v13];

  v106.receiver = self;
  v106.super_class = (Class)SBSASequencedBehaviorProvider;
  v37 = [(SBSABasePreferencesProvider *)&v106 preferencesFromContext:v36];
  if (v37)
  {
    v38 = self;
    id v39 = v37;
    if (v38)
    {
      if (objc_opt_isKindOfClass()) {
        v40 = v39;
      }
      else {
        v40 = 0;
      }
    }
    else
    {
      v40 = 0;
    }
    id v41 = v40;

    if (!v41)
    {
      v89 = [MEMORY[0x1E4F28B00] currentHandler];
      Class v90 = NSClassFromString(&cfstr_Sbsapreference.isa);
      v91 = (objc_class *)objc_opt_class();
      v92 = NSStringFromClass(v91);
      [v89 handleFailureInMethod:a2, self, @"SBSASequencedBehaviorProvider.m", 122, @"Unexpected class – expected '%@', got '%@'", v90, v92 object file lineNumber description];
    }
  }
  else
  {
    id v41 = 0;
  }

  if (v32)
  {
    v42 = [(SBSASequencedBehaviorProvider *)self updatedPreferencesFromPreferences:v41 context:v36 relevantPropertyIdentity:0];

    if (v117)
    {
      v43 = [SBSAPreferencesDidChangeAction alloc];
      v118 = @"containerSequencedBehaviorProvider.retry";
      v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
      v45 = [(SBSAPreferencesDidChangeAction *)v43 initWithReasons:v44];
      v119 = v45;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
      uint64_t v47 = [v42 copyByAddingActions:v46];

      v42 = (void *)v47;
    }
    else
    {
      [(SBSABasePreferencesProvider *)self removeFromParentProvider];
    }
  }
  else
  {
    int64_t v48 = self->_activePhase + 1;
    if ([(SBSASequencedBehaviorProvider *)self phaseIsTimeDelayBased:v48])
    {
      [(SBSASequencedBehaviorProvider *)self delayForPhase:v48];
      uint64_t v50 = v49;
      v42 = [(SBSASequencedBehaviorProvider *)self updatedPreferencesFromPreferences:v41 context:v36 relevantPropertyIdentity:0];

      if (!self->_pendingTimerIdentifier)
      {
        v100[0] = MEMORY[0x1E4F143A8];
        v100[1] = 3221225472;
        v100[2] = __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_6;
        v100[3] = &unk_1E6AF8AB0;
        v100[4] = self;
        v100[5] = a2;
        v100[6] = v50;
        v51 = (void *)[v42 copyWithBlock:v100];

        v52 = [SBSAPreferencesDidChangeAction alloc];
        v120 = @"containerSequencedBehaviorProvider.phaseChange";
        v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
        v54 = [(SBSAPreferencesDidChangeAction *)v52 initWithReasons:v53];
        v121 = v54;
        v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
        v42 = (void *)[v51 copyByAddingActions:v55];
      }
    }
    else
    {
      [(SBSASequencedBehaviorProvider *)self milestoneForPhase:v48];
      if (v56 <= 0.0)
      {
        v42 = v41;
      }
      else
      {
        double v57 = v56;
        id v105 = 0;
        v42 = [(SBSASequencedBehaviorProvider *)self updatedPreferencesFromPreferences:v41 context:v36 relevantPropertyIdentity:&v105];
        id v58 = v105;

        if (!self->_pendingPhaseTransitionPropertyIdentity)
        {
          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v101[2] = __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_5;
          v101[3] = &unk_1E6B07830;
          SEL v103 = a2;
          v101[4] = self;
          double v104 = v57;
          id v102 = v58;
          v59 = (void *)[v42 copyWithBlock:v101];

          v60 = [SBSAPreferencesDidChangeAction alloc];
          v122 = @"containerSequencedBehaviorProvider.phaseChange";
          v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
          v62 = [(SBSAPreferencesDidChangeAction *)v60 initWithReasons:v61];
          v123 = v62;
          v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
          v42 = (void *)[v59 copyByAddingActions:v63];
        }
      }
    }
    if (self->_pendingTimerIdentifier && self->_pendingPhaseTransitionPropertyIdentity)
    {
      v93 = [MEMORY[0x1E4F28B00] currentHandler];
      [v93 handleFailureInMethod:a2 object:self file:@"SBSASequencedBehaviorProvider.m" lineNumber:151 description:@"Waiting for both a timer and a milestone; something's gone wrong."];
    }
  }

  return v42;
}

__CFString *__56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke()
{
  return @"Captured layout states";
}

id __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isTransitionEndTargeted])
  {
    int v2 = [*(id *)(a1 + 32) finished];
    v3 = @"<end>";
    if (v2) {
      v3 = @"<end, finished>";
    }
    id v4 = v3;
  }
  else
  {
    v5 = NSString;
    [*(id *)(a1 + 32) targetedMilestone];
    objc_msgSend(v5, "stringWithFormat:", @"%f", v6);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v4;
  id v8 = [*(id *)(a1 + 32) associatedInterfaceElementPropertyIdentity];
  uint64_t v9 = [v8 interfaceElementProperty];

  v10 = [*(id *)(a1 + 32) associatedInterfaceElementPropertyIdentity];
  id v11 = [v10 associatedInterfaceElementIdentifier];

  v12 = [NSString stringWithFormat:@"Reached Milestone: (%@, %@, %@)", v7, v9, v11];

  return v12;
}

uint64_t __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"Timer Expired: (%fs)", *(void *)(a1 + 32));
}

__CFString *__56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_4()
{
  return @"Removed without reaching final phase";
}

void __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_5(uint64_t a1, void *a2)
{
  id v19 = a2;
  if (v19)
  {
    v3 = self;
    id v4 = v19;
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
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSASequencedBehaviorProvider.m", 133, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v14 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v15 = objc_msgSend(v13, "initWithObjects:", v14, 0);
  [v6 addMilestones:v15 forPropertyIdentity:*(void *)(a1 + 40)];

  uint64_t v16 = [*(id *)(a1 + 40) copy];
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void **)(v17 + 48);
  *(void *)(v17 + 48) = v16;
}

void __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_6(uint64_t a1, void *a2)
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
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSASequencedBehaviorProvider.m", 145, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [*(id *)(a1 + 32) _startTimerIfNecessary:v6 withInterval:*(double *)(a1 + 48)];
}

- (void)_setActivePhase:(int64_t)a3 context:(id)a4 reason:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a5;
  if (self->_activePhase != a3)
  {
    Class v10 = SBLogSystemAperturePreferencesStackSequencedBehaviors();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11)
    {
      v12 = [(SBSASequencedBehaviorProvider *)self nameForPhase:self->_activePhase];
      id v13 = [(SBSASequencedBehaviorProvider *)self nameForPhase:a3];
      if (v9)
      {
        v14 = NSString;
        v15 = v9[2](v9);
        uint64_t v16 = [v14 stringWithFormat:@" - %@", v15];
      }
      else
      {
        uint64_t v16 = &stru_1F3084718;
      }
      uint64_t v17 = SBLogSystemAperturePreferencesStackSequencedBehaviors();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134350082;
        uint64_t v19 = [v8 queryIteration];
        __int16 v20 = 2112;
        int v21 = self;
        __int16 v22 = 2112;
        BOOL v23 = v12;
        __int16 v24 = 2112;
        BOOL v25 = v13;
        __int16 v26 = 2112;
        int64_t v27 = v16;
        _os_log_debug_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEBUG, "[%{public}lu] %@ Phase Transition: (%@ -> %@)%@", buf, 0x34u);
      }
    }
    self->_int64_t activePhase = a3;
  }
}

- (BOOL)_isTimerExpired:(id)a3 duration:(double *)a4
{
  id v6 = [a3 elapsedTimerDescriptions];
  if ([v6 count])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__SBSASequencedBehaviorProvider__isTimerExpired_duration___block_invoke;
    v14[3] = &unk_1E6B07858;
    v14[4] = self;
    uint64_t v7 = [v6 indexOfObjectPassingTest:v14];
    BOOL v8 = v7 != 0x7FFFFFFFFFFFFFFFLL;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v7;
      pendingTimerIdentifier = self->_pendingTimerIdentifier;
      self->_pendingTimerIdentifier = 0;

      if (a4)
      {
        BOOL v11 = [v6 objectAtIndex:v9];
        [v11 timeInterval];
        *(void *)a4 = v12;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __58__SBSASequencedBehaviorProvider__isTimerExpired_duration___block_invoke(uint64_t a1, void *a2)
{
  int v2 = [a2 timerDescriptionIdentifier];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

- (void)_startTimerIfNecessary:(id)a3 withInterval:(double)a4
{
  id v6 = a3;
  if (!self->_pendingTimerIdentifier)
  {
    id v13 = v6;
    uint64_t v7 = [[SBSATimerDescription alloc] initWithTimeInterval:a4];
    BOOL v8 = [(SBSATimerDescription *)v7 timerDescriptionIdentifier];
    pendingTimerIdentifier = self->_pendingTimerIdentifier;
    self->_pendingTimerIdentifier = v8;

    Class v10 = [v13 timerDescriptions];
    if (v10)
    {
      BOOL v11 = [v13 timerDescriptions];
      id v12 = (id)[v11 mutableCopy];
    }
    else
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }

    [v12 addObject:v7];
    [v13 setTimerDescriptions:v12];

    id v6 = v13;
  }
}

- (NSUUID)participatingInterfaceElementIdentifier
{
  return self->_participatingInterfaceElementIdentifier;
}

- (SAElementIdentifying)participatingElementIdentification
{
  return self->_participatingElementIdentification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participatingElementIdentification, 0);
  objc_storeStrong((id *)&self->_participatingInterfaceElementIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingTimerIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingPhaseTransitionPropertyIdentity, 0);
  objc_storeStrong((id *)&self->_elementContexts, 0);
}

- (int64_t)activePhase
{
  return self->_activePhase;
}

- (int64_t)finalPhase
{
  return 0;
}

- (id)nameForPhase:(int64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"Idle";
  }
  return v4;
}

- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4
{
  return 0;
}

- (BOOL)canPersistAcrossLayoutStateChangesToNewElementContexts:(id)a3
{
  return 0;
}

- (id)updatedContextFromContext:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  id v5 = a3;
  return v5;
}

- (BOOL)phaseIsTimeDelayBased:(int64_t)a3
{
  return 0;
}

- (double)milestoneForPhase:(int64_t)a3
{
  return 0.0;
}

- (BOOL)milestoneForPhaseRequiresAnimationFinished:(int64_t)a3
{
  return 0;
}

- (double)delayForPhase:(int64_t)a3
{
  return 0.0;
}

@end