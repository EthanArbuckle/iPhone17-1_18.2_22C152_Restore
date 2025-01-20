@interface SBSASettlingBehaviorProvider
- (UIEdgeInsets)_overshootOutsetsForTransitionPhase:(int64_t)a3 baseOutsets:(UIEdgeInsets)a4 elementContext:(id)a5;
- (UIEdgeInsets)_overshootOutsetsTargetingContainerDescription:(id)a3 initialContainerDescription:(id)a4 settings:(id)a5 context:(id)a6;
- (double)_overshootFractionForDampingRatio:(double)a3;
- (double)_progressMilestoneForTransitionPhase:(int64_t)a3;
- (id)_fluidBehaviorSettingsForTransitionPhase:(int64_t)a3 forElementContext:(id)a4;
- (id)preferencesFromContext:(id)a3;
- (void)_setActivePhase:(int64_t)a3 context:(id)a4 logReason:(id)a5;
@end

@implementation SBSASettlingBehaviorProvider

uint64_t __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_42(uint64_t a1, void *a2)
{
  v3 = [a2 interfaceElementIdentifier];
  v4 = [*(id *)(a1 + 32) interfaceElementIdentifier];
  uint64_t v5 = BSEqualObjects();

  return v5;
}

- (id)_fluidBehaviorSettingsForTransitionPhase:(int64_t)a3 forElementContext:(id)a4
{
  uint64_t v5 = [a4 systemApertureCustomLayoutCustomAnimationStyle];
  v6 = [(id)objc_opt_class() settings];
  v7 = v6;
  if (v5 == 3)
  {
    v8 = [v6 jindoBoundsOval];
  }
  else
  {
    v9 = [v6 inertInterfaceElementTransitionSettings];
    v8 = [v9 boundsBehaviorSettings];
  }
  if (a3 == -2)
  {
    v10 = [(id)objc_opt_class() settings];
    v11 = [v10 inertCompensatingInterfaceElementTransitionSettings];
    goto LABEL_9;
  }
  if (a3 == -3 && v5 != 3)
  {
    v10 = [(id)objc_opt_class() settings];
    v11 = [v10 inertCollapsingInterfaceElementTransitionSettings];
LABEL_9:
    v12 = v11;
    uint64_t v13 = [v11 boundsBehaviorSettings];

    v8 = (void *)v13;
  }
  return v8;
}

- (id)preferencesFromContext:(id)a3
{
  uint64_t v269 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v194 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  uint64_t v5 = v4;
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
    uint64_t v13 = NSStringFromClass(v12);
    [v10 handleFailureInMethod:a2, self, @"SBSASettlingBehaviorProvider.m", 94, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v9 = 0;
  }
  id v14 = v9;

  v15 = [v14 preferences];
  v16 = [v15 lastChangingElementLayoutTransition];

  obuint64_t j = v16;
  int v200 = BSEqualObjects();
  if ((v200 & 1) == 0)
  {
    v17 = SBLogSystemAperturePreferencesStackSettling();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[SBSASettlingBehaviorProvider preferencesFromContext:].cold.5(v14);
    }

    objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, v16);
    [(SBSASettlingBehaviorProvider *)self _setActivePhase:0 context:v14 logReason:@"Element Layout Changed"];
    containerIDsToOvershootOutsets = self->_containerIDsToOvershootOutsets;
    self->_containerIDsToOvershootOutsets = 0;

    pendingPhaseTransitionPropertyIdentities = self->_pendingPhaseTransitionPropertyIdentities;
    self->_pendingPhaseTransitionPropertyIdentities = 0;
  }
  v20 = [v14 requests];
  v21 = objc_msgSend(v20, "bs_firstObjectOfClass:", objc_opt_class());

  if (v21)
  {
    self->_collisionImminent = 1;
  }
  else if ((v200 & 1) == 0)
  {
    self->_collisionImminent = [(SBSAElementLayoutTransition *)self->_lastChangingElementLayoutTransition isCollisionRequired];
  }
  [(SBSASettlingBehaviorProvider *)self _progressMilestoneForTransitionPhase:self->_activePhase];
  double v23 = v22;
  long long v253 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  long long v256 = 0u;
  id v215 = [v14 animatedTransitionResults];
  uint64_t v24 = [v215 countByEnumeratingWithState:&v253 objects:v268 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v254;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v254 != v26) {
          objc_enumerationMutation(v215);
        }
        v28 = *(void **)(*((void *)&v253 + 1) + 8 * v27);
        if (v23 <= 0.0) {
          goto LABEL_33;
        }
        v29 = self->_pendingPhaseTransitionPropertyIdentities;
        v30 = [*(id *)(*((void *)&v253 + 1) + 8 * v27) associatedInterfaceElementPropertyIdentity];
        BOOL v31 = [(NSSet *)v29 containsObject:v30];

        [v28 targetedMilestone];
        int v32 = BSFloatApproximatelyEqualToFloat();
        int v33 = [v28 isTransitionEndTargeted];
        if (v33) {
          int v33 = [v28 finished];
        }
        if ((v31 & (v32 | v33)) != 1) {
          goto LABEL_33;
        }
        v34 = self->_pendingPhaseTransitionPropertyIdentities;
        self->_pendingPhaseTransitionPropertyIdentities = 0;

        v35 = SBLogSystemAperturePreferencesStackSettling();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v53 = [v14 queryIteration];
          *(_DWORD *)buf = 134349314;
          v54 = @"skipped";
          if (v32) {
            v54 = @"hit";
          }
          uint64_t v258 = v53;
          __int16 v259 = 2112;
          v260 = v54;
          _os_log_debug_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEBUG, "[%{public}lu] Pending phase transition property identity %@.", buf, 0x16u);
        }

        if (self->_collisionImminent && self->_activePhase == -3)
        {
          v36 = (void *)[v14 copyByAddingSignals:1 debugRequestingProvider:self];

          v37 = SBLogSystemAperturePreferencesStackSettling();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
            -[SBSASettlingBehaviorProvider preferencesFromContext:].cold.4((uint64_t)v267, v36);
          }

          self->_collisionImminent = 0;
        }
        else
        {
LABEL_33:
          v36 = v14;
        }
        pendingCollisionPropertyIdentities = self->_pendingCollisionPropertyIdentities;
        v39 = [v28 associatedInterfaceElementPropertyIdentity];
        BOOL v40 = [(NSSet *)pendingCollisionPropertyIdentities containsObject:v39];

        [v28 targetedMilestone];
        v41 = [(id)objc_opt_class() settings];
        [v41 boundsCollisionProgress];
        int v42 = BSFloatApproximatelyEqualToFloat();

        int v43 = [v28 isTransitionEndTargeted];
        if (v43) {
          int v43 = [v28 finished];
        }
        if ((v40 & (v42 | v43)) == 1)
        {
          v44 = self->_pendingCollisionPropertyIdentities;
          self->_pendingCollisionPropertyIdentities = 0;

          id v14 = (id)[v36 copyByAddingSignals:1 debugRequestingProvider:self];
          v45 = SBLogSystemAperturePreferencesStackSettling();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v51 = [v14 queryIteration];
            *(_DWORD *)buf = 134349314;
            v52 = @"skipped";
            if (v42) {
              v52 = @"reached";
            }
            uint64_t v258 = v51;
            __int16 v259 = 2112;
            v260 = v52;
            _os_log_debug_impl(&dword_1D85BA000, v45, OS_LOG_TYPE_DEBUG, "[%{public}lu] Collision threshold %@ (explicit)", buf, 0x16u);
          }

          self->_collisionImminent = 0;
          if (self->_collisionIsNotOvershooting)
          {
            self->_collisionIsNotOvershooting = 0;
            [(SBSASettlingBehaviorProvider *)self _setActivePhase:0 context:v14 logReason:@"Reset due to handling collision with no overshooting"];
          }
        }
        else
        {
          id v14 = v36;
        }
        pendingSteadyPropertyIdentities = self->_pendingSteadyPropertyIdentities;
        v47 = [v28 associatedInterfaceElementPropertyIdentity];
        if ([(NSSet *)pendingSteadyPropertyIdentities containsObject:v47]
          && [v28 isTransitionEndTargeted])
        {
          int v48 = [v28 finished];

          if (!v48) {
            goto LABEL_48;
          }
          v49 = self->_pendingSteadyPropertyIdentities;
          self->_pendingSteadyPropertyIdentities = 0;

          v50 = (void *)[v14 copyByAddingSignals:2 debugRequestingProvider:self];
          v47 = SBLogSystemAperturePreferencesStackSettling();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
            -[SBSASettlingBehaviorProvider preferencesFromContext:]((uint64_t)v266, v50);
          }
        }
        else
        {
          v50 = v14;
        }

        id v14 = v50;
LABEL_48:
        ++v27;
      }
      while (v25 != v27);
      uint64_t v55 = [v215 countByEnumeratingWithState:&v253 objects:v268 count:16];
      uint64_t v25 = v55;
    }
    while (v55);
  }

  if ((v200 & 1) == 0)
  {
    v56 = self->_pendingCollisionPropertyIdentities;
    self->_pendingCollisionPropertyIdentities = 0;
  }
  uint64_t v57 = 88;
  if (self->_collisionImminent)
  {
    v58 = [v14 preferences];
    v252[0] = MEMORY[0x1E4F143A8];
    v252[1] = 3221225472;
    v252[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke;
    v252[3] = &unk_1E6AF53A0;
    v252[5] = a2;
    v252[4] = self;
    v59 = (void *)[v58 copyWithBlock:v252];
    v60 = (void *)[v14 copyByUpdatingPreferences:v59];

    v61 = SBLogSystemAperturePreferencesStackSettling();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
      -[SBSASettlingBehaviorProvider preferencesFromContext:](v60);
    }
  }
  else
  {
    v60 = v14;
  }
  v208 = v60;
  v251.receiver = self;
  v251.super_class = (Class)SBSASettlingBehaviorProvider;
  v62 = [(SBSABasePreferencesProvider *)&v251 preferencesFromContext:v60];
  uint64_t v63 = objc_opt_class();
  id v64 = v62;
  if (v63)
  {
    if (objc_opt_isKindOfClass()) {
      v65 = v64;
    }
    else {
      v65 = 0;
    }
  }
  else
  {
    v65 = 0;
  }
  id v66 = v65;

  v204 = v66;
  v67 = [v66 containerViewDescriptions];
  v68 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v247 = 0u;
  long long v248 = 0u;
  long long v249 = 0u;
  long long v250 = 0u;
  id v69 = v67;
  uint64_t v70 = [v69 countByEnumeratingWithState:&v247 objects:v265 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v248;
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v248 != v72) {
          objc_enumerationMutation(v69);
        }
        v74 = *(void **)(*((void *)&v247 + 1) + 8 * i);
        v75 = (void *)MEMORY[0x1E4F29238];
        [v74 bounds];
        v76 = objc_msgSend(v75, "valueWithCGRect:");
        v77 = [v74 interfaceElementIdentifier];
        [v68 setObject:v76 forKey:v77];
      }
      uint64_t v71 = [v69 countByEnumeratingWithState:&v247 objects:v265 count:16];
    }
    while (v71);
  }

  v78 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:objc_opt_class()];

  v79 = v208;
  if (self->_activePhase)
  {
    if (v78)
    {
      stackContainerInterfaceElementIdentifiersToBounds = self->_stackContainerInterfaceElementIdentifiersToBounds;
      if (stackContainerInterfaceElementIdentifiersToBounds)
      {
        if (([(NSDictionary *)stackContainerInterfaceElementIdentifiersToBounds isEqual:v68] & 1) == 0)
        {
          objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, obj);
          [(SBSASettlingBehaviorProvider *)self _setActivePhase:0 context:v208 logReason:@"Reset due to container frames changing during dynamic animation"];
          v81 = self->_containerIDsToOvershootOutsets;
          self->_containerIDsToOvershootOutsets = 0;

          v82 = self->_pendingPhaseTransitionPropertyIdentities;
          self->_pendingPhaseTransitionPropertyIdentities = 0;
        }
      }
    }
  }
  v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v68];
  v84 = self->_stackContainerInterfaceElementIdentifiersToBounds;
  self->_stackContainerInterfaceElementIdentifiersToBounds = v83;

  id v216 = v69;
  v192 = v68;
  if ([v208 containsAnyOfSignals:1])
  {
    if (!self->_activePhase) {
      goto LABEL_106;
    }
    v85 = (void *)[(NSDictionary *)self->_containerIDsToOvershootOutsets mutableCopy];
    long long v243 = 0u;
    long long v244 = 0u;
    long long v245 = 0u;
    long long v246 = 0u;
    v86 = [v208 containerViewDescriptions];
    uint64_t v87 = [v86 countByEnumeratingWithState:&v243 objects:v264 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      char v89 = 0;
      uint64_t v90 = *(void *)v244;
      location = (id *)v86;
      do
      {
        for (uint64_t j = 0; j != v88; ++j)
        {
          if (*(void *)v244 != v90) {
            objc_enumerationMutation(v86);
          }
          v92 = *(void **)(*((void *)&v243 + 1) + 8 * j);
          v242[0] = MEMORY[0x1E4F143A8];
          v242[1] = 3221225472;
          v242[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_37;
          v242[3] = &unk_1E6AFBBB8;
          v242[4] = v92;
          v93 = objc_msgSend(v69, "bs_firstObjectPassingTest:", v242);
          [v92 bounds];
          CGFloat v95 = v94;
          CGFloat v97 = v96;
          CGFloat v99 = v98;
          CGFloat v101 = v100;
          [v93 bounds];
          CGFloat x = v270.origin.x;
          CGFloat y = v270.origin.y;
          CGFloat width = v270.size.width;
          CGFloat height = v270.size.height;
          v276.origin.CGFloat x = v95;
          v276.origin.CGFloat y = v97;
          v276.size.CGFloat width = v99;
          v276.size.CGFloat height = v101;
          if (CGRectContainsRect(v270, v276))
          {
            v271.origin.CGFloat x = x;
            v271.origin.CGFloat y = y;
            v271.size.CGFloat width = width;
            v271.size.CGFloat height = height;
            double v209 = CGRectGetHeight(v271);
            v272.origin.CGFloat x = v95;
            v272.origin.CGFloat y = v97;
            v272.size.CGFloat width = v99;
            v272.size.CGFloat height = v101;
            if (v209 > CGRectGetHeight(v272))
            {
              v273.origin.CGFloat x = x;
              v273.origin.CGFloat y = y;
              v273.size.CGFloat width = width;
              v273.size.CGFloat height = height;
              double v106 = CGRectGetWidth(v273);
              v274.origin.CGFloat x = v95;
              v274.origin.CGFloat y = v97;
              v274.size.CGFloat width = v99;
              v274.size.CGFloat height = v101;
              if (v106 > CGRectGetWidth(v274))
              {
                v107 = v85;
                v108 = SBLogSystemAperturePreferencesStackSettling();
                if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
                {
                  id v210 = (id)[v208 queryIteration];
                  v110 = [v92 interfaceElementIdentifier];
                  *(_DWORD *)buf = 134349314;
                  uint64_t v258 = (uint64_t)v210;
                  __int16 v259 = 2112;
                  v260 = v110;
                  _os_log_debug_impl(&dword_1D85BA000, v108, OS_LOG_TYPE_DEBUG, "[%{public}lu] Container is now Expanding, dropping overshoot offsets for: (%@)", buf, 0x16u);
                }
                v109 = [v92 interfaceElementIdentifier];
                v85 = v107;
                [v107 removeObjectForKey:v109];

                char v89 = 1;
                v86 = location;
              }
            }
          }

          id v69 = v216;
        }
        uint64_t v88 = [v86 countByEnumeratingWithState:&v243 objects:v264 count:16];
      }
      while (v88);

      v79 = v208;
      uint64_t v57 = 88;
      if ((v89 & 1) == 0) {
        goto LABEL_101;
      }
      if ([v85 count])
      {
        v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v85];
        v86 = self->_containerIDsToOvershootOutsets;
        self->_containerIDsToOvershootOutsets = v111;
      }
      else
      {
        [(SBSASettlingBehaviorProvider *)self _setActivePhase:0 context:v208 logReason:@"Reset due to No container overshoot offsets left after something started expanding"];
        v112 = self->_containerIDsToOvershootOutsets;
        self->_containerIDsToOvershootOutsets = 0;

        v86 = self->_pendingPhaseTransitionPropertyIdentities;
        self->_pendingPhaseTransitionPropertyIdentities = 0;
      }
    }

LABEL_101:
  }
  int64_t activePhase = self->_activePhase;
  if (activePhase)
  {
    if (activePhase >= -1) {
      int64_t activePhase = -1;
    }
    uint64_t v114 = activePhase + 1;
    goto LABEL_125;
  }
LABEL_106:
  v115 = SBLogSystemAperturePreferencesStackSettling();
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG)) {
    -[SBSASettlingBehaviorProvider preferencesFromContext:](v79);
  }

  locationa = (id *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v238 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  id v211 = [v79 containerViewDescriptions];
  uint64_t v116 = [v211 countByEnumeratingWithState:&v238 objects:v263 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v213 = *(void *)v239;
    do
    {
      for (uint64_t k = 0; k != v117; ++k)
      {
        if (*(void *)v239 != v213) {
          objc_enumerationMutation(v211);
        }
        v119 = *(void **)(*((void *)&v238 + 1) + 8 * k);
        v237[0] = MEMORY[0x1E4F143A8];
        v237[1] = 3221225472;
        v237[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_42;
        v237[3] = &unk_1E6AFBBB8;
        v237[4] = v119;
        v120 = objc_msgSend(v69, "bs_firstObjectPassingTest:", v237);
        if (v120)
        {
          v121 = [v79 elementContexts];
          v122 = SBSAElementContextAssociatedWithContainerViewDescription(v120, v121, 0);

          v123 = [(SBSASettlingBehaviorProvider *)self _fluidBehaviorSettingsForTransitionPhase:-3 forElementContext:v122];
          [(SBSASettlingBehaviorProvider *)self _overshootOutsetsTargetingContainerDescription:v120 initialContainerDescription:v119 settings:v123 context:v79];
          CGFloat v128 = v124;
          CGFloat v129 = v125;
          CGFloat v130 = v126;
          CGFloat v131 = v127;
          if (v124 != 0.0 || v126 != 0.0 || v125 != 0.0 || v127 != 0.0)
          {
            *(double *)v236 = v124;
            *(double *)&v236[1] = v125;
            *(double *)&v236[2] = v126;
            *(double *)&v236[3] = v127;
            v132 = [MEMORY[0x1E4F29238] valueWithBytes:v236 objCType:"{UIEdgeInsets=dddd}"];
            v133 = [v119 interfaceElementIdentifier];
            [locationa setObject:v132 forKey:v133];

            v134 = SBLogSystemAperturePreferencesStackSettling();
            if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v201 = [v208 queryIteration];
              v135 = [v119 interfaceElementIdentifier];
              v275.top = v128;
              v275.left = v129;
              v275.bottom = v130;
              v275.right = v131;
              NSStringFromUIEdgeInsets(v275);
              v136 = (SBSAInterfaceElementPropertyIdentity *)(id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134349570;
              uint64_t v258 = v201;
              __int16 v259 = 2112;
              v260 = v135;
              __int16 v261 = 2112;
              v262 = v136;
              _os_log_debug_impl(&dword_1D85BA000, v134, OS_LOG_TYPE_DEBUG, "[%{public}lu] Updated overshoot outsets for container description '%@': %@", buf, 0x20u);
            }
            v79 = v208;
          }

          id v69 = v216;
        }
      }
      uint64_t v117 = [v211 countByEnumeratingWithState:&v238 objects:v263 count:16];
    }
    while (v117);
  }

  objc_storeStrong((id *)&self->_containerIDsToOvershootOutsets, locationa);
  uint64_t v114 = -3;
  uint64_t v57 = 88;
  v68 = v192;
LABEL_125:
  NSUInteger v137 = [(NSDictionary *)self->_containerIDsToOvershootOutsets count];
  v138 = (id *)v137;
  BOOL v197 = v137 != 0;
  if (self->_collisionImminent)
  {
    int64_t v139 = self->_activePhase;
    BOOL v140 = v139 == 0;
    if (!v137)
    {
      if (v139) {
        goto LABEL_134;
      }
      self->_collisionIsNotOvershooting = 1;
      goto LABEL_133;
    }
  }
  else
  {
    if (!v137) {
      goto LABEL_134;
    }
    BOOL v140 = 0;
  }
  if (!self->_pendingPhaseTransitionPropertyIdentities || v140) {
LABEL_133:
  }
    [(SBSASettlingBehaviorProvider *)self _setActivePhase:v114 context:v79 logReason:@"Incremented Phase"];
LABEL_134:
  v199 = (void *)[v69 mutableCopy];
  uint64_t v202 = [v69 count];
  if (v202)
  {
    id v195 = objc_alloc_init(MEMORY[0x1E4F1CA80]);

    id v198 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v196 = objc_alloc_init(MEMORY[0x1E4F1CA80]);

    uint64_t v141 = 0;
    v142 = @"Will Not Overshoot";
    if (v138) {
      v142 = @"Will Overshoot";
    }
    v191 = v142;
    locationb = v138;
    do
    {
      v143 = [v216 objectAtIndex:v141];
      v144 = [SBSAInterfaceElementPropertyIdentity alloc];
      v145 = [v143 interfaceElementIdentifier];
      v212 = [(SBSAInterfaceElementPropertyIdentity *)v144 initWithAssociatedInterfaceElementIdentifier:v145 andProperty:@"bounds"];

      v146 = self->_containerIDsToOvershootOutsets;
      v147 = [v143 interfaceElementIdentifier];
      v148 = [(NSDictionary *)v146 objectForKey:v147];

      id v149 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v214 = v149;
      if (v138 && v148)
      {
        id v150 = v149;
        [v148 UIEdgeInsetsValue];
        double v152 = v151;
        double v154 = v153;
        double v156 = v155;
        double v158 = v157;
        v159 = [v79 elementContexts];
        SBSAElementContextAssociatedWithContainerViewDescription(v143, v159, 0);
        v161 = v160 = v150;

        -[SBSASettlingBehaviorProvider _overshootOutsetsForTransitionPhase:baseOutsets:elementContext:](self, "_overshootOutsetsForTransitionPhase:baseOutsets:elementContext:", self->_activePhase, v161, v152, v154, v156, v158);
        v229[0] = MEMORY[0x1E4F143A8];
        v229[1] = 3221225472;
        v229[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_52;
        v229[3] = &unk_1E6B03630;
        SEL v231 = a2;
        v229[4] = self;
        uint64_t v232 = v162;
        uint64_t v233 = v163;
        uint64_t v234 = v164;
        uint64_t v235 = v165;
        id v166 = v79;
        id v230 = v166;
        v167 = (void *)[v143 copyWithBlock:v229];
        [v199 replaceObjectAtIndex:v141 withObject:v167];

        v221[0] = MEMORY[0x1E4F143A8];
        v221[1] = 3221225472;
        v221[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_57;
        v221[3] = &unk_1E6B0ADF0;
        SEL v227 = a2;
        v221[4] = self;
        BOOL v228 = v197;
        id v222 = v143;
        id v223 = v166;
        v224 = v212;
        id v225 = v160;
        id v226 = v198;
        uint64_t v168 = [v204 copyWithBlock:v221];

        v138 = locationb;
        v204 = (void *)v168;
      }
      if (*((unsigned char *)&self->super.super.isa + v57))
      {
        if (self->_activePhase == -3)
        {
          if (!v148 || ([v148 UIEdgeInsetsValue], BSFloatIsZero()))
          {
            v169 = NSNumber;
            v170 = [(id)objc_opt_class() settings];
            [v170 boundsCollisionProgress];
            v171 = objc_msgSend(v169, "numberWithDouble:");
            [v214 addObject:v171];

            [v195 addObject:v212];
            v172 = SBLogSystemAperturePreferencesStackSettling();
            if (os_log_type_enabled(v172, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v184 = [v208 queryIteration];
              *(_DWORD *)buf = 134349314;
              uint64_t v258 = v184;
              __int16 v259 = 2112;
              v260 = (__CFString *)v212;
              _os_log_debug_impl(&dword_1D85BA000, v172, OS_LOG_TYPE_DEBUG, "[%{public}lu] Added pending collision property ID: %@", buf, 0x16u);
            }
          }
        }
      }
      v173 = [v204 elementLayoutTransition];
      int v174 = [v173 isLayoutChange];

      int64_t v175 = self->_activePhase;
      if (v138)
      {
        BOOL v176 = v175 == -1;
      }
      else
      {
        BOOL v176 = v175 == 0;
        int v177 = v200 ^ 1;
        if (!v176) {
          int v177 = 1;
        }
        BOOL v176 = (v177 | v174) == 1;
      }
      v79 = v208;
      if (v176)
      {
        [v214 addObject:0x1F3348CE8];
        [v196 addObject:v212];
        v178 = SBLogSystemAperturePreferencesStackSettling();
        if (os_log_type_enabled(v178, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v183 = [v208 queryIteration];
          *(_DWORD *)buf = 134349570;
          uint64_t v258 = v183;
          __int16 v259 = 2112;
          v260 = v191;
          __int16 v261 = 2112;
          v262 = v212;
          _os_log_debug_impl(&dword_1D85BA000, v178, OS_LOG_TYPE_DEBUG, "[%{public}lu] Added pending steady state (%@) property ID: %@", buf, 0x20u);
        }
      }
      uint64_t v179 = v57;
      v180 = v214;
      if ([v214 count])
      {
        v217[0] = MEMORY[0x1E4F143A8];
        v217[1] = 3221225472;
        v217[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_74;
        v217[3] = &unk_1E6AF93C8;
        SEL v220 = a2;
        v217[4] = self;
        id v218 = v214;
        v181 = v212;
        v219 = v212;
        uint64_t v182 = [v204 copyWithBlock:v217];

        v138 = locationb;
        v204 = (void *)v182;
        v180 = v214;
      }
      else
      {
        v181 = v212;
      }

      ++v141;
      uint64_t v57 = v179;
    }
    while (v202 != v141);
    v68 = v192;
    v185 = v195;
    v186 = v198;
    v187 = v196;
  }
  else
  {
    v186 = 0;
    v185 = 0;
    v187 = 0;
  }
  if ([v185 count]) {
    objc_storeStrong((id *)&self->_pendingCollisionPropertyIdentities, v185);
  }
  if ([v186 count]) {
    objc_storeStrong((id *)&self->_pendingPhaseTransitionPropertyIdentities, v186);
  }
  if ([v187 count]) {
    objc_storeStrong((id *)&self->_pendingSteadyPropertyIdentities, v187);
  }
  v188 = (void *)[v204 copyByUpdatingContainerViewDescriptions:v199];

  id v189 = v188;
  return v189;
}

- (double)_progressMilestoneForTransitionPhase:(int64_t)a3
{
  if (a3 == -2)
  {
    id v4 = [(id)objc_opt_class() settings];
    [v4 boundsCompensatingPhaseChangeProgress];
    goto LABEL_5;
  }
  double v3 = 0.0;
  if (a3 == -3)
  {
    id v4 = [(id)objc_opt_class() settings];
    [v4 boundsCollapsingPhaseChangeProgress];
LABEL_5:
    double v3 = v5;
  }
  return v3;
}

- (UIEdgeInsets)_overshootOutsetsTargetingContainerDescription:(id)a3 initialContainerDescription:(id)a4 settings:(id)a5 context:(id)a6
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v75 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v73 = *MEMORY[0x1E4F437F8];
  double v74 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  [v11 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [v10 bounds];
  CGFloat height = v87.size.height;
  CGFloat x = v87.origin.x;
  CGFloat width = v87.size.width;
  CGFloat y = v87.origin.y;
  v100.origin.CGFloat x = v16;
  v100.origin.CGFloat y = v18;
  CGFloat aRect = v20;
  v100.size.CGFloat width = v20;
  v100.size.CGFloat height = v22;
  if (CGRectContainsRect(v87, v100)) {
    goto LABEL_5;
  }
  double v67 = v14;
  double v23 = SBLogSystemAperturePreferencesStackSettling();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v65 = [v13 queryIteration];
    v97.origin.CGFloat x = v16;
    v97.origin.CGFloat y = v18;
    v97.size.CGFloat width = v20;
    v97.size.CGFloat height = v22;
    v58 = NSStringFromRect(v97);
    v98.size.CGFloat height = height;
    v98.origin.CGFloat x = x;
    v98.size.CGFloat width = width;
    v98.origin.CGFloat y = y;
    v59 = NSStringFromRect(v98);
    id v66 = [v10 associatedSystemApertureElementIdentity];
    v60 = [v66 elementIdentifier];
    v61 = [v10 interfaceElementIdentifier];
    *(_DWORD *)buf = 134350082;
    uint64_t v77 = v65;
    __int16 v78 = 2112;
    v79 = v58;
    __int16 v80 = 2112;
    v81 = v59;
    __int16 v82 = 2112;
    v83 = v60;
    __int16 v84 = 2112;
    v85 = v61;
    _os_log_debug_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEBUG, "[%{public}lu] initial:(%@) target:(%@) '%@' -> %@", buf, 0x34u);
  }
  [v12 dampingRatio];
  -[SBSASettlingBehaviorProvider _overshootFractionForDampingRatio:](self, "_overshootFractionForDampingRatio:");
  if (BSFloatIsZero())
  {
LABEL_5:
    double v24 = v73;
  }
  else
  {
    [v10 boundsVelocity];
    CGFloat v30 = v29;
    CGFloat v63 = v31;
    CGFloat v64 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v62 = v33;
    CGFloat v36 = v35;
    v88.origin.CGFloat x = v16;
    v88.origin.CGFloat y = v18;
    v88.size.CGFloat height = v22;
    v88.size.CGFloat width = aRect;
    CGRectGetMaxX(v88);
    v89.size.CGFloat width = width;
    v89.origin.CGFloat y = y;
    v89.size.CGFloat height = height;
    v89.origin.CGFloat x = x;
    CGRectGetMaxX(v89);
    v90.origin.CGFloat x = v30;
    v90.origin.CGFloat y = v32;
    v90.size.CGFloat width = v34;
    v90.size.CGFloat height = v36;
    CGRectGetWidth(v90);
    v91.origin.CGFloat y = v18;
    v91.origin.CGFloat x = v16;
    v91.size.CGFloat width = aRect;
    v91.size.CGFloat height = v22;
    CGRectGetMaxY(v91);
    v92.origin.CGFloat x = x;
    v92.origin.CGFloat y = y;
    v92.size.CGFloat width = width;
    v92.size.CGFloat height = height;
    CGRectGetMaxY(v92);
    v93.origin.CGFloat y = v63;
    v93.origin.CGFloat x = v64;
    v93.size.CGFloat width = v62;
    v93.size.CGFloat height = v36;
    CGRectGetHeight(v93);
    objc_msgSend(v13, "displayScale", *(void *)&v18);
    BSFloatRoundForScale();
    double v38 = v37;
    BSFloatRoundForScale();
    double v40 = v39;
    v94.origin.CGFloat x = x;
    v94.origin.CGFloat y = y;
    v94.size.CGFloat width = width;
    v94.size.CGFloat height = height;
    CGRectGetWidth(v94);
    v95.origin.CGFloat x = x;
    v95.origin.CGFloat y = y;
    v95.size.CGFloat width = width;
    v95.size.CGFloat height = height;
    CGRectGetHeight(v95);
    BSRectWithSize();
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    [v13 inertContainerFrame];
    BSRectWithSize();
    v101.origin.CGFloat x = v49;
    v101.origin.CGFloat y = v50;
    v101.size.CGFloat width = v51;
    v101.size.CGFloat height = v52;
    v96.origin.CGFloat x = v42;
    v96.origin.CGFloat y = v44;
    v96.size.CGFloat width = v46;
    v96.size.CGFloat height = v48;
    double v14 = v67;
    double v24 = v73;
    if (!CGRectContainsRect(v96, v101))
    {
      uint64_t v53 = [v13 elementContexts];
      v54 = SBSAElementContextAssociatedWithContainerViewDescription(v11, v53, 0);

      unint64_t v55 = [v54 interfaceOrientation];
      double v56 = v38 * -2.0;
      if (v55 == 3) {
        double v57 = v38 * -2.0;
      }
      else {
        double v57 = -v38;
      }
      if (v55 == 4) {
        double v57 = -v38;
      }
      else {
        double v56 = -v38;
      }
      if (v55 < 3) {
        double v57 = -v38;
      }
      double v74 = v57;
      double v75 = -v40;
      if (v55 >= 3) {
        double v14 = v56;
      }
      else {
        double v14 = -v38;
      }
      if (v55 >= 3) {
        double v24 = -v40;
      }
      else {
        double v24 = v40 * -2.0;
      }
    }
  }

  double v25 = v24;
  double v26 = v14;
  double v28 = v74;
  double v27 = v75;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

void __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    double v3 = self;
    id v4 = v14;
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
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = a1 + 32;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v10 + 8);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v7 handleFailureInMethod:v9, v8, @"SBSASettlingBehaviorProvider.m", 152, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setCollisionImminent:1];
}

uint64_t __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_37(uint64_t a1, void *a2)
{
  double v3 = [a2 interfaceElementIdentifier];
  id v4 = [*(id *)(a1 + 32) interfaceElementIdentifier];
  uint64_t v5 = BSEqualObjects();

  return v5;
}

void __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSASettlingBehaviorProvider.m", 266, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  [v7 bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v19 = v18 - (*(double *)(a1 + 64) + *(double *)(a1 + 80));
  double v21 = v20 - (*(double *)(a1 + 56) + *(double *)(a1 + 72));
  objc_msgSend(v7, "setBounds:", v14, v16, v19, v21);
  CGFloat v22 = SBLogSystemAperturePreferencesStackSettling();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = [*(id *)(a1 + 40) queryIteration];
    double v31 = [v7 interfaceElementIdentifier];
    v43.origin.CGFloat x = v15;
    v43.origin.CGFloat y = v17;
    v43.size.CGFloat width = v19;
    v43.size.CGFloat height = v21;
    CGFloat v32 = NSStringFromCGRect(v43);
    LODWORD(buf.a) = 134349570;
    *(void *)((char *)&buf.a + 4) = v30;
    WORD2(buf.b) = 2112;
    *(void *)((char *)&buf.b + 6) = v31;
    HIWORD(buf.c) = 2112;
    *(void *)&buf.d = v32;
    _os_log_debug_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEBUG, "[%{public}lu] Updated bounds for container description '%@': %@", (uint8_t *)&buf, 0x20u);
  }
  [v7 center];
  double v24 = v23 + (*(double *)(a1 + 64) - *(double *)(a1 + 80)) * 0.5;
  double v26 = v25 + (*(double *)(a1 + 56) - *(double *)(a1 + 72)) * 0.5;
  objc_msgSend(v7, "setCenter:", v24, v26);
  double v27 = SBLogSystemAperturePreferencesStackSettling();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = [*(id *)(a1 + 40) queryIteration];
    CGFloat v34 = [v7 interfaceElementIdentifier];
    v40.CGFloat x = v24;
    v40.CGFloat y = v26;
    double v35 = NSStringFromCGPoint(v40);
    LODWORD(buf.a) = 134349570;
    *(void *)((char *)&buf.a + 4) = v33;
    WORD2(buf.b) = 2112;
    *(void *)((char *)&buf.b + 6) = v34;
    HIWORD(buf.c) = 2112;
    *(void *)&buf.d = v35;
    _os_log_debug_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEBUG, "[%{public}lu] Updated center for container description '%@': %@", (uint8_t *)&buf, 0x20u);
  }
  memset(&buf, 0, sizeof(buf));
  [v7 contentScale];
  SBSAAffineTransformFromContentScale((uint64_t)&buf, v28, v29);
  CGAffineTransform v36 = buf;
  CGAffineTransformInvert(&v37, &v36);
  v41.origin.CGFloat x = v15;
  v41.origin.CGFloat y = v17;
  v41.size.CGFloat width = v19;
  v41.size.CGFloat height = v21;
  CGRect v42 = CGRectApplyAffineTransform(v41, &v37);
  objc_msgSend(v7, "setContentBounds:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");
}

void __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_57(uint64_t a1, void *a2)
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
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSASettlingBehaviorProvider.m", 282, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  if (*(unsigned char *)(a1 + 88))
  {
    double v14 = *(void **)(a1 + 40);
    CGFloat v15 = [*(id *)(a1 + 48) elementContexts];
    double v16 = SBSAElementContextAssociatedWithContainerViewDescription(v14, v15, 0);

    CGFloat v17 = [*(id *)(a1 + 32) _fluidBehaviorSettingsForTransitionPhase:*(void *)(*(void *)(a1 + 32) + 40) forElementContext:v16];
    double v18 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v17];
    [v7 setAnimatedTransitionDescription:v18 forProperty:*(void *)(a1 + 56) withMilestones:0];
    uint64_t v19 = *(void *)(a1 + 56);
    double v20 = [SBSAInterfaceElementPropertyIdentity alloc];
    double v21 = [*(id *)(a1 + 40) interfaceElementIdentifier];
    CGFloat v22 = [(SBSAInterfaceElementPropertyIdentity *)v20 initWithAssociatedInterfaceElementIdentifier:v21 andProperty:@"center"];
    [v7 associateAnimatedTransitionDescriptionOfProperty:v19 withProperty:v22 withMilestones:0];

    uint64_t v23 = *(void *)(a1 + 56);
    double v24 = [SBSAInterfaceElementPropertyIdentity alloc];
    double v25 = [*(id *)(a1 + 40) interfaceElementIdentifier];
    double v26 = [(SBSAInterfaceElementPropertyIdentity *)v24 initWithAssociatedInterfaceElementIdentifier:v25 andProperty:@"contentBounds"];
    [v7 associateAnimatedTransitionDescriptionOfProperty:v23 withProperty:v26 withMilestones:0];

    uint64_t v27 = *(void *)(a1 + 56);
    CGFloat v28 = [SBSAInterfaceElementPropertyIdentity alloc];
    CGFloat v29 = [*(id *)(a1 + 40) interfaceElementIdentifier];
    uint64_t v30 = [(SBSAInterfaceElementPropertyIdentity *)v28 initWithAssociatedInterfaceElementIdentifier:v29 andProperty:@"contentCenter"];
    [v7 associateAnimatedTransitionDescriptionOfProperty:v27 withProperty:v30 withMilestones:0];
  }
  double v31 = *(void **)(a1 + 32);
  if (!v31[7])
  {
    [v31 _progressMilestoneForTransitionPhase:v31[5]];
    if (v32 > 0.0)
    {
      uint64_t v33 = *(void **)(a1 + 64);
      CGFloat v34 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v33 addObject:v34];

      [*(id *)(a1 + 72) addObject:*(void *)(a1 + 56)];
      double v35 = SBLogSystemAperturePreferencesStackSettling();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_57_cold_1(a1, a1 + 56, v35);
      }
    }
  }
}

void __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_74(void *a1, void *a2)
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
    uint64_t v8 = a1[7];
    uint64_t v9 = a1[4];
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    Class v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSASettlingBehaviorProvider.m", 319, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 addMilestones:a1[5] forPropertyIdentity:a1[6]];
}

- (void)_setActivePhase:(int64_t)a3 context:(id)a4 logReason:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (__CFString *)a5;
  int64_t activePhase = self->_activePhase;
  Class v11 = SBLogSystemAperturePreferencesStackSettling();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (activePhase == a3)
  {
    if (v12)
    {
      uint64_t v13 = [v8 queryIteration];
      int64_t v14 = self->_activePhase + 3;
      if (v14 != 3 && self->_activePhase < 0xFFFFFFFFFFFFFFFDLL) {
        CGFloat v15 = @"[invalid]";
      }
      else {
        CGFloat v15 = off_1E6B0AE10[v14];
      }
      int v23 = 134349570;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      double v26 = v15;
      __int16 v27 = 2112;
      CGFloat v28 = v9;
      uint64_t v19 = "[%{public}lu] (%@) Active Phase Not updated: %@";
      double v20 = v11;
      uint32_t v21 = 32;
LABEL_16:
      _os_log_debug_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&v23, v21);
    }
  }
  else if (v12)
  {
    uint64_t v16 = [v8 queryIteration];
    int64_t v17 = self->_activePhase + 3;
    if (v17 != 3 && self->_activePhase < 0xFFFFFFFFFFFFFFFDLL) {
      double v18 = @"[invalid]";
    }
    else {
      double v18 = off_1E6B0AE10[v17];
    }
    if (a3 != 0 && (unint64_t)a3 < 0xFFFFFFFFFFFFFFFDLL) {
      CGFloat v22 = @"[invalid]";
    }
    else {
      CGFloat v22 = off_1E6B0AE10[a3 + 3];
    }
    int v23 = 134349826;
    uint64_t v24 = v16;
    __int16 v25 = 2112;
    double v26 = v18;
    __int16 v27 = 2112;
    CGFloat v28 = v22;
    __int16 v29 = 2112;
    uint64_t v30 = v9;
    uint64_t v19 = "[%{public}lu] (%@) -> (%@) Active Phase Updated: %@";
    double v20 = v11;
    uint32_t v21 = 42;
    goto LABEL_16;
  }

  self->_int64_t activePhase = a3;
}

- (double)_overshootFractionForDampingRatio:(double)a3
{
  if (!BSFloatLessThanFloat()) {
    return 0.0;
  }
  double v4 = a3 * -3.14159265 / sqrt(1.0 - a3 * a3);
  return exp(v4);
}

- (UIEdgeInsets)_overshootOutsetsForTransitionPhase:(int64_t)a3 baseOutsets:(UIEdgeInsets)a4 elementContext:(id)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v10 = a5;
  Class v11 = v10;
  if ((unint64_t)(a3 + 1) < 2)
  {
    double top = *MEMORY[0x1E4F437F8];
    double left = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double bottom = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double right = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  else if (a3 == -2)
  {
    unint64_t v15 = [v10 interfaceOrientation];
    double v16 = top + top;
    double v17 = bottom + bottom;
    double v18 = right + left;
    double v19 = left + right;
    if (v15 == 3) {
      double v20 = 0.0;
    }
    else {
      double v20 = right;
    }
    if (v15 == 3) {
      double v21 = bottom + bottom;
    }
    else {
      double v21 = bottom;
    }
    if (v15 == 3)
    {
      double v22 = top + top;
    }
    else
    {
      double v19 = left;
      double v22 = top;
    }
    if (v15 == 4)
    {
      double v19 = 0.0;
    }
    else
    {
      double v18 = v20;
      double v17 = v21;
      double v16 = v22;
    }
    if (v15 >= 3) {
      double right = v18;
    }
    else {
      double right = right + right;
    }
    if (v15 >= 3) {
      double bottom = v17;
    }
    else {
      double bottom = bottom + top;
    }
    if (v15 >= 3) {
      double left = v19;
    }
    else {
      double left = left + left;
    }
    if (v15 >= 3) {
      double top = v16;
    }
    else {
      double top = 0.0;
    }
  }
  else if (a3 == -3)
  {
    unint64_t v12 = [v10 interfaceOrientation];
    double v13 = right * 0.5;
    double v14 = left * 0.5;
    if (v12 != 3) {
      double v14 = left;
    }
    if (v12 == 4) {
      double v14 = left;
    }
    else {
      double v13 = right;
    }
    if (v12 < 3) {
      double bottom = 0.0;
    }
    else {
      double right = v13;
    }
    if (v12 >= 3) {
      double left = v14;
    }
  }

  double v23 = top;
  double v24 = left;
  double v25 = bottom;
  double v26 = right;
  result.double right = v26;
  result.double bottom = v25;
  result.double left = v24;
  result.double top = v23;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackContainerInterfaceElementIdentifiersToBounds, 0);
  objc_storeStrong((id *)&self->_pendingSteadyPropertyIdentities, 0);
  objc_storeStrong((id *)&self->_pendingCollisionPropertyIdentities, 0);
  objc_storeStrong((id *)&self->_pendingPhaseTransitionPropertyIdentities, 0);
  objc_storeStrong((id *)&self->_containerIDsToOvershootOutsets, 0);
  objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, 0);
}

- (void)preferencesFromContext:(void *)a1 .cold.1(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] Steady state – recalculating overshoot outsets", v3, v4, v5, v6, v7);
}

- (void)preferencesFromContext:(void *)a1 .cold.2(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] Collision imminent", v3, v4, v5, v6, v7);
}

- (void)preferencesFromContext:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_2_20(a1, a2);
  _DWORD *v3 = 134349056;
  *uint64_t v2 = v4;
  OUTLINED_FUNCTION_3_8(&dword_1D85BA000, v5, v6, "[%{public}lu] Steady state reached");
}

- (void)preferencesFromContext:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_2_20(a1, a2);
  _DWORD *v3 = 134349056;
  *uint64_t v2 = v4;
  OUTLINED_FUNCTION_3_8(&dword_1D85BA000, v5, v6, "[%{public}lu] Collision threshold reached (collapsing)");
}

- (void)preferencesFromContext:(void *)a1 .cold.5(void *a1)
{
  [a1 queryIteration];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}lu] New transition", v3, v4, v5, v6, v7);
}

void __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_57_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 48) queryIteration];
  OUTLINED_FUNCTION_1_0();
  __int16 v6 = 2112;
  uint64_t v7 = v4;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "[%{public}lu] Added pending phase transition property ID: %@", v5, 0x16u);
}

@end