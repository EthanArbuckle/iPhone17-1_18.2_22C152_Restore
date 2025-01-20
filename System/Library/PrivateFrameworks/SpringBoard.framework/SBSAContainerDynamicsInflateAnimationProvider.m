@interface SBSAContainerDynamicsInflateAnimationProvider
- (id)_identitiesWithMilestoneReached:(id)a3;
- (id)preferencesFromContext:(id)a3;
- (void)_addMilestonesIfNecessaryForUntrackedBoundsExpansionsForElementIdentities:(id)a3 preferencesMutator:(id)a4 context:(id)a5;
@end

@implementation SBSAContainerDynamicsInflateAnimationProvider

- (id)preferencesFromContext:(id)a3
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
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
  v110 = v7;

  v116 = v9;
  v10 = [v9 preferences];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  v15 = [v14 containerViewDescriptions];
  v118 = (void *)[v15 mutableCopy];

  v112 = v14;
  v16 = [v14 elementDescriptions];
  v114 = (void *)[v16 mutableCopy];

  uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
  v117 = [MEMORY[0x1E4F1CA80] set];
  v115 = [MEMORY[0x1E4F1CA80] set];
  elementIdentitiesWaitingToExpandBeforeInflation = self->_elementIdentitiesWaitingToExpandBeforeInflation;
  if (elementIdentitiesWaitingToExpandBeforeInflation)
  {
    v19 = elementIdentitiesWaitingToExpandBeforeInflation;
  }
  else
  {
    v19 = [MEMORY[0x1E4F1CA80] set];
  }
  v20 = self->_elementIdentitiesWaitingToExpandBeforeInflation;
  self->_elementIdentitiesWaitingToExpandBeforeInflation = v19;

  elementIdentitiesThatFinishedWaitingToExpandBeforeInflation = self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation;
  SEL v111 = a2;
  if (elementIdentitiesThatFinishedWaitingToExpandBeforeInflation)
  {
    v22 = elementIdentitiesThatFinishedWaitingToExpandBeforeInflation;
  }
  else
  {
    v22 = [MEMORY[0x1E4F1CA80] set];
  }
  v23 = self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation;
  self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation = v22;

  pendingMilestonePropertyIdentitiesToElementIdentities = self->_pendingMilestonePropertyIdentitiesToElementIdentities;
  v113 = (void *)v17;
  if (pendingMilestonePropertyIdentitiesToElementIdentities)
  {
    v25 = pendingMilestonePropertyIdentitiesToElementIdentities;
  }
  else
  {
    v25 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  }
  v26 = self->_pendingMilestonePropertyIdentitiesToElementIdentities;
  self->_pendingMilestonePropertyIdentitiesToElementIdentities = v25;

  [(SBSAContainerDynamicsInflateAnimationProvider *)self _identitiesWithMilestoneReached:v116];
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v123 = [obj countByEnumeratingWithState:&v157 objects:v167 count:16];
  if (v123)
  {
    uint64_t v120 = *(void *)v158;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v158 != v120) {
          objc_enumerationMutation(obj);
        }
        uint64_t v125 = v27;
        uint64_t v28 = *(void *)(*((void *)&v157 + 1) + 8 * v27);
        long long v153 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        v29 = [(NSMapTable *)self->_pendingMilestonePropertyIdentitiesToElementIdentities keyEnumerator];
        v30 = [v29 allObjects];

        uint64_t v31 = [v30 countByEnumeratingWithState:&v153 objects:v166 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v154;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v154 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v153 + 1) + 8 * i);
              v36 = [(NSMapTable *)self->_pendingMilestonePropertyIdentitiesToElementIdentities objectForKey:v35];
              int v37 = SAElementIdentityEqualToIdentity();

              if (v37) {
                [(NSMapTable *)self->_pendingMilestonePropertyIdentitiesToElementIdentities removeObjectForKey:v35];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v153 objects:v166 count:16];
          }
          while (v32);
        }

        [(NSMutableSet *)self->_elementIdentitiesWaitingToExpandBeforeInflation removeObject:v28];
        [(NSMutableSet *)self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation addObject:v28];
        uint64_t v27 = v125 + 1;
      }
      while (v125 + 1 != v123);
      uint64_t v123 = [obj countByEnumeratingWithState:&v157 objects:v167 count:16];
    }
    while (v123);
  }
  v38 = v118;
  if ([v118 count])
  {
    for (unint64_t j = 0; j < [v38 count]; ++j)
    {
      v40 = [v38 objectAtIndexedSubscript:j];
      v41 = [SBSAElementIdentification alloc];
      v42 = [v40 associatedSystemApertureElementIdentity];
      v43 = [(SBSAElementIdentification *)v41 initWithElementIdentification:v42];

      v44 = [v116 elementContexts];
      v45 = SBSAElementContextAssociatedWithContainerViewDescription(v40, v44, 0);

      uint64_t v46 = [v45 activeDynamicAnimation];
      if (v46 == 2)
      {
        [v113 addObject:v43];
        if (j) {
          goto LABEL_57;
        }
      }
      else
      {
        if ([(NSSet *)self->_elementIdentitiesWithInflateApplied containsObject:v43]) {
          BOOL v47 = j == 0;
        }
        else {
          BOOL v47 = 0;
        }
        if (!v47) {
          goto LABEL_57;
        }
      }
      v48 = [v116 preferences];
      v49 = [v48 lastChangingElementLayoutTransition];

      v50 = [v49 targetElementContexts];
      v51 = [v50 firstObject];

      if (![v49 isTransitionToSingleCompact]
        || !SAElementIdentityEqualToIdentity())
      {

        v38 = v118;
LABEL_53:
        if (v46 == 2) {
          v52 = v117;
        }
        else {
          v52 = v115;
        }
        [v52 addObject:v43];
        goto LABEL_57;
      }
      if (([(NSMutableSet *)self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation containsObject:v43] & 1) == 0)[(NSMutableSet *)self->_elementIdentitiesWaitingToExpandBeforeInflation addObject:v43]; {
      if ([(NSMutableSet *)self->_elementIdentitiesWaitingToExpandBeforeInflation containsObject:v43])
      }
      {

        v38 = v118;
      }
      else
      {
        int v53 = [(NSMutableSet *)self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation containsObject:v43];

        v38 = v118;
        if (v53) {
          goto LABEL_53;
        }
      }
LABEL_57:
    }
  }
  [(NSMutableSet *)self->_elementIdentitiesWaitingToExpandBeforeInflation intersectSet:v113];
  [(NSMutableSet *)self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation intersectSet:v113];
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  v54 = [(NSMapTable *)self->_pendingMilestonePropertyIdentitiesToElementIdentities keyEnumerator];
  v55 = [v54 allObjects];

  uint64_t v56 = [v55 countByEnumeratingWithState:&v149 objects:v165 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v150;
    do
    {
      for (uint64_t k = 0; k != v57; ++k)
      {
        if (*(void *)v150 != v58) {
          objc_enumerationMutation(v55);
        }
        uint64_t v60 = *(void *)(*((void *)&v149 + 1) + 8 * k);
        v61 = [(NSMapTable *)self->_pendingMilestonePropertyIdentitiesToElementIdentities objectForKey:v60];
        char v62 = [v113 containsObject:v61];

        if ((v62 & 1) == 0) {
          [(NSMapTable *)self->_pendingMilestonePropertyIdentitiesToElementIdentities removeObjectForKey:v60];
        }
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v149 objects:v165 count:16];
    }
    while (v57);
  }

  v146[0] = MEMORY[0x1E4F143A8];
  v146[1] = 3221225472;
  v146[2] = __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke;
  v146[3] = &unk_1E6AF9DA0;
  SEL v63 = v111;
  SEL v148 = v111;
  v146[4] = self;
  id v64 = v116;
  id v147 = v64;
  v122 = (void *)[v112 copyWithBlock:v146];

  v65 = v118;
  v126 = v64;
  if ([v118 count])
  {
    unint64_t v67 = 0;
    *(void *)&long long v66 = 134349314;
    long long v109 = v66;
    do
    {
      objc_msgSend(v65, "objectAtIndexedSubscript:", v67, v109);
      id v68 = (id)objc_claimAutoreleasedReturnValue();
      v69 = [SBSAElementIdentification alloc];
      v70 = [v68 associatedSystemApertureElementIdentity];
      v71 = [(SBSAElementIdentification *)v69 initWithElementIdentification:v70];

      v72 = [v64 elementContexts];
      v73 = SBSAElementContextAssociatedWithContainerViewDescription(v68, v72, 0);

      int v74 = [v117 containsObject:v71];
      if ([v115 containsObject:v71])
      {
        BOOL v75 = ([v73 systemApertureLayoutCustomizingOptions] & 1) == 0;
        if (v74) {
          goto LABEL_77;
        }
      }
      else
      {
        BOOL v75 = 0;
        if (v74) {
          goto LABEL_77;
        }
      }
      if (v75)
      {
LABEL_77:
        v121 = v73;
        v76 = v63;
        [v64 elementContexts];
        v78 = v77 = v64;
        uint64_t v79 = SBSAElementContextAssociatedWithContainerViewDescription(v68, v78, 0);

        *(void *)buf = 0x7FFFFFFFFFFFFFFFLL;
        v124 = (void *)v79;
        v80 = SBSAElementDescriptionAssociatedWithElementIdentity(v79, v114, buf);
        if (v74)
        {
          [v117 addObject:v71];
          v142[0] = MEMORY[0x1E4F143A8];
          v142[1] = 3221225472;
          v142[2] = __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_2;
          v142[3] = &unk_1E6AF93C8;
          SEL v63 = v76;
          v145 = v76;
          v142[4] = self;
          id v143 = v68;
          id v144 = v77;
          id v68 = (id)[v68 copyWithBlock:v142];
          [v118 replaceObjectAtIndex:v67 withObject:v68];
          if (v80)
          {
            v141[0] = MEMORY[0x1E4F143A8];
            v141[1] = 3221225472;
            v141[2] = __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_3;
            v141[3] = &unk_1E6AF53A0;
            v141[4] = self;
            v141[5] = v76;
            v81 = (void *)[v80 copyWithBlock:v141];
            [v114 replaceObjectAtIndex:*(void *)buf withObject:v81];
          }
        }
        else
        {
          SEL v63 = v76;
        }
        v136[0] = MEMORY[0x1E4F143A8];
        v136[1] = 3221225472;
        v73 = v121;
        v136[2] = __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_4;
        v136[3] = &unk_1E6AFBB90;
        SEL v139 = v63;
        v136[4] = self;
        char v140 = v74;
        id v68 = v68;
        id v137 = v68;
        id v138 = v80;
        id v82 = v80;
        uint64_t v83 = [v122 copyWithBlock:v136];

        v122 = (void *)v83;
        id v64 = v126;
      }
      if (v75)
      {
        v84 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v85 = [v64 queryIteration];
          *(_DWORD *)buf = v109;
          *(void *)&buf[4] = v85;
          __int16 v163 = 2112;
          v164 = v71;
          _os_log_debug_impl(&dword_1D85BA000, v84, OS_LOG_TYPE_DEBUG, "[%{public}lu] [Inflate] Applying deflate to element:'%@'", buf, 0x16u);
        }
      }
      ++v67;
      v65 = v118;
    }
    while (v67 < [v118 count]);
  }
  v86 = (void *)[v117 mutableCopy];
  v87 = v86;
  if (self->_elementIdentitiesWithInflateApplied)
  {
    objc_msgSend(v86, "minusSet:");
  }
  else
  {
    v88 = [MEMORY[0x1E4F1CAD0] set];
    [v87 minusSet:v88];
  }
  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v89 = v87;
  uint64_t v90 = [v89 countByEnumeratingWithState:&v132 objects:v161 count:16];
  if (v90)
  {
    uint64_t v91 = v90;
    uint64_t v92 = *(void *)v133;
    do
    {
      for (uint64_t m = 0; m != v91; ++m)
      {
        if (*(void *)v133 != v92) {
          objc_enumerationMutation(v89);
        }
        v94 = *(SBSAElementIdentification **)(*((void *)&v132 + 1) + 8 * m);
        v95 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v96 = [v126 queryIteration];
          *(_DWORD *)buf = 134349314;
          *(void *)&buf[4] = v96;
          __int16 v163 = 2112;
          v164 = v94;
          _os_log_debug_impl(&dword_1D85BA000, v95, OS_LOG_TYPE_DEBUG, "[%{public}lu] [Inflate] Applying inflate to element:'%@'", buf, 0x16u);
        }
      }
      uint64_t v91 = [v89 countByEnumeratingWithState:&v132 objects:v161 count:16];
    }
    while (v91);
  }

  v97 = (NSSet *)[v117 copy];
  elementIdentitiesWithInflateApplied = self->_elementIdentitiesWithInflateApplied;
  self->_elementIdentitiesWithInflateApplied = v97;

  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_45;
  v128[3] = &unk_1E6AF93C8;
  SEL v131 = v111;
  v128[4] = self;
  id v99 = v118;
  id v129 = v99;
  id v100 = v114;
  id v130 = v100;
  v101 = (void *)[v122 copyWithBlock:v128];

  v102 = (void *)[v126 copyByUpdatingPreferences:v101];
  v127.receiver = self;
  v127.super_class = (Class)SBSAContainerDynamicsInflateAnimationProvider;
  v103 = [(SBSABasePreferencesProvider *)&v127 preferencesFromContext:v102];
  uint64_t v104 = objc_opt_class();
  id v105 = v103;
  if (v104)
  {
    if (objc_opt_isKindOfClass()) {
      v106 = v105;
    }
    else {
      v106 = 0;
    }
  }
  else
  {
    v106 = 0;
  }
  id v107 = v106;

  if (![v113 count]) {
    [(SBSABasePreferencesProvider *)self removeFromParentProvider];
  }

  return v107;
}

void __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke(uint64_t *a1, void *a2)
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
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[4];
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAContainerDynamicsInflateAnimationProvider.m", 113, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [(id)a1[4] _addMilestonesIfNecessaryForUntrackedBoundsExpansionsForElementIdentities:*(void *)(a1[4] + 48) preferencesMutator:v6 context:a1[5]];
}

void __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
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
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerDynamicsInflateAnimationProvider.m", 130, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  long long v43 = 0u;
  long long v44 = 0u;
  [*(id *)(a1 + 40) bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [*(id *)(a1 + 40) center];
  double v23 = v22;
  double v25 = v24;
  v26 = [(id)objc_opt_class() settings];
  [v26 inflateAnimationScale];
  CGFloat v28 = v27;
  v29 = [(id)objc_opt_class() settings];
  [v29 inflateVerticalOffsetProportion];
  SBSAScaledAndClippedFrameByScalingLeadingTrailingViews((CGFloat *)&v43, *(void **)(a1 + 48), v15, v17, v19, v21, v23, v25, v28, v30);

  BSRectWithSize();
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  UIRectGetCenter();
  double v40 = v39;
  double v42 = v41;
  objc_msgSend(v7, "setBounds:", v32, v34, v36, v38);
  objc_msgSend(v7, "setCenter:", v40, v42);
  objc_msgSend(v7, "setContentBounds:", v43, v44);
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");
}

void __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
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
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    Class v11 = NSClassFromString(&cfstr_Sbsaelementdes.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerDynamicsInflateAnimationProvider.m", 143, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  double v14 = [(id)objc_opt_class() settings];
  [v14 inflateAnimationContentScale];
  CGFloat v16 = v15;

  if (v7) {
    [v7 leadingViewTransform];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  CGAffineTransformScale(&v22, &v21, v16, v16);
  [v7 setLeadingViewTransform:&v22];
  if (v7) {
    [v7 trailingViewTransform];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }
  CGAffineTransformScale(&v20, &v19, v16, v16);
  [v7 setTrailingViewTransform:&v20];
  if (v7) {
    [v7 minimalViewTransform];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CGAffineTransformScale(&v18, &v17, v16, v16);
  [v7 setMinimalViewTransform:&v18];
}

void __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v44 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v44;
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

  id v3 = v44;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerDynamicsInflateAnimationProvider.m", 153, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v44;
LABEL_9:
    id v7 = 0;
  }

  int v14 = *(unsigned __int8 *)(a1 + 64);
  double v15 = [(id)objc_opt_class() settings];
  CGFloat v16 = v15;
  if (v14) {
    [v15 inflateAnimationScaleUpSettings];
  }
  else {
  CGAffineTransform v17 = [v15 inflateAnimationScaleDownSettings];
  }

  CGAffineTransform v18 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v17];
  CGAffineTransform v19 = [SBSAInterfaceElementPropertyIdentity alloc];
  CGAffineTransform v20 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  CGAffineTransform v21 = [(SBSAInterfaceElementPropertyIdentity *)v19 initWithAssociatedInterfaceElementIdentifier:v20 andProperty:@"bounds"];

  [v7 setAnimatedTransitionDescription:v18 forProperty:v21 withMilestones:0];
  CGAffineTransform v22 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v17];
  double v23 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v24 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  double v25 = [(SBSAInterfaceElementPropertyIdentity *)v23 initWithAssociatedInterfaceElementIdentifier:v24 andProperty:@"center"];

  [v7 setAnimatedTransitionDescription:v22 forProperty:v25 withMilestones:0];
  v26 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v27 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  CGFloat v28 = [(SBSAInterfaceElementPropertyIdentity *)v26 initWithAssociatedInterfaceElementIdentifier:v27 andProperty:@"contentBounds"];
  [v7 associateAnimatedTransitionDescriptionOfProperty:v21 withProperty:v28 withMilestones:0];

  v29 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v30 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  double v31 = [(SBSAInterfaceElementPropertyIdentity *)v29 initWithAssociatedInterfaceElementIdentifier:v30 andProperty:@"contentCenter"];
  [v7 associateAnimatedTransitionDescriptionOfProperty:v25 withProperty:v31 withMilestones:0];

  if (*(void *)(a1 + 48))
  {
    double v32 = [SBSAInterfaceElementPropertyIdentity alloc];
    double v33 = [*(id *)(a1 + 48) interfaceElementIdentifier];
    double v34 = [(SBSAInterfaceElementPropertyIdentity *)v32 initWithAssociatedInterfaceElementIdentifier:v33 andProperty:@"leadingViewTransform"];

    [v7 associateAnimatedTransitionDescriptionOfProperty:v21 withProperty:v34 withMilestones:0];
    double v35 = [SBSAInterfaceElementPropertyIdentity alloc];
    [*(id *)(a1 + 48) interfaceElementIdentifier];
    double v36 = v22;
    double v37 = v17;
    v39 = double v38 = v18;
    double v40 = [(SBSAInterfaceElementPropertyIdentity *)v35 initWithAssociatedInterfaceElementIdentifier:v39 andProperty:@"trailingViewTransform"];

    [v7 associateAnimatedTransitionDescriptionOfProperty:v21 withProperty:v40 withMilestones:0];
    double v41 = [SBSAInterfaceElementPropertyIdentity alloc];
    double v42 = [*(id *)(a1 + 48) interfaceElementIdentifier];
    long long v43 = [(SBSAInterfaceElementPropertyIdentity *)v41 initWithAssociatedInterfaceElementIdentifier:v42 andProperty:@"minimalViewTransform"];

    [v7 associateAnimatedTransitionDescriptionOfProperty:v21 withProperty:v43 withMilestones:0];
    CGAffineTransform v18 = v38;
    CGAffineTransform v17 = v37;
    CGAffineTransform v22 = v36;
  }
}

void __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_45(void *a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    id v3 = self;
    id v4 = self;
    id v5 = v14;
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

    if (v7) {
      goto LABEL_10;
    }
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = a1[7];
    uint64_t v10 = a1[4];
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_1.isa);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerDynamicsInflateAnimationProvider.m", 185, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];
  }
  id v7 = 0;
LABEL_10:

  [v7 setContainerViewDescriptions:a1[5]];
  [v7 setElementDescriptions:a1[6]];
}

- (id)_identitiesWithMilestoneReached:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  id v5 = [(id)objc_opt_class() settings];
  [v5 expansionToCompactBeginInflationProgress];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v23 = self;
  id v6 = [(NSMapTable *)self->_pendingMilestonePropertyIdentitiesToElementIdentities keyEnumerator];
  id v7 = [v6 allObjects];

  obuint64_t j = v7;
  uint64_t v24 = [v7 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v10 = [(NSMapTable *)v23->_pendingMilestonePropertyIdentitiesToElementIdentities objectForKey:v9];
        if (v10)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          Class v11 = [v25 animatedTransitionResults];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v38 count:16];
          if (!v12) {
            goto LABEL_21;
          }
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v27;
          while (1)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v27 != v14) {
                objc_enumerationMutation(v11);
              }
              CGFloat v16 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              CGAffineTransform v17 = [v16 associatedInterfaceElementPropertyIdentity];
              if (BSEqualObjects())
              {
                [v16 targetedMilestone];
                if (BSFloatApproximatelyEqualToFloat())
                {
                }
                else
                {
                  char v18 = [v16 finished];

                  if ((v18 & 1) == 0) {
                    continue;
                  }
                }
                [v4 addObject:v10];
                CGAffineTransform v17 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v19 = [v25 queryIteration];
                  *(_DWORD *)buf = 134349314;
                  uint64_t v35 = v19;
                  __int16 v36 = 2112;
                  uint64_t v37 = v9;
                  _os_log_debug_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEBUG, "[%{public}lu] [Inflate] Reached milestone for expansion'%@'", buf, 0x16u);
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v38 count:16];
            if (!v13)
            {
LABEL_21:

              break;
            }
          }
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v24);
  }

  return v4;
}

- (void)_addMilestonesIfNecessaryForUntrackedBoundsExpansionsForElementIdentities:(id)a3 preferencesMutator:(id)a4 context:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v36 = a4;
  id v37 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = [(NSMapTable *)self->_pendingMilestonePropertyIdentitiesToElementIdentities objectEnumerator];
  Class v11 = [v10 allObjects];
  uint64_t v12 = [v9 setWithArray:v11];

  double v34 = v8;
  uint64_t v13 = (void *)[v8 mutableCopy];
  long long v33 = (void *)v12;
  [v13 minusSet:v12];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * v17);
        uint64_t v19 = [v37 preferences];
        CGAffineTransform v20 = [v19 containerViewDescriptions];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __150__SBSAContainerDynamicsInflateAnimationProvider__addMilestonesIfNecessaryForUntrackedBoundsExpansionsForElementIdentities_preferencesMutator_context___block_invoke;
        v38[3] = &unk_1E6AFBBB8;
        v38[4] = v18;
        CGAffineTransform v21 = objc_msgSend(v20, "bs_firstObjectPassingTest:", v38);

        uint64_t v22 = [SBSAInterfaceElementPropertyIdentity alloc];
        double v23 = [v21 interfaceElementIdentifier];
        uint64_t v24 = [(SBSAInterfaceElementPropertyIdentity *)v22 initWithAssociatedInterfaceElementIdentifier:v23 andProperty:@"bounds"];

        id v25 = [(id)objc_opt_class() settings];
        [v25 expansionToCompactBeginInflationProgress];
        double v27 = v26;

        long long v28 = (void *)MEMORY[0x1E4F1CAD0];
        long long v29 = [NSNumber numberWithDouble:v27];
        long long v30 = [v28 setWithObject:v29];
        [v36 addMilestones:v30 forPropertyIdentity:v24];

        [(NSMapTable *)self->_pendingMilestonePropertyIdentitiesToElementIdentities setObject:v18 forKey:v24];
        long long v31 = SBLogSystemAperturePreferencesStackDynamicsAnimations();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v32 = [v37 queryIteration];
          *(_DWORD *)buf = 134349314;
          uint64_t v44 = v32;
          __int16 v45 = 2112;
          uint64_t v46 = v24;
          _os_log_debug_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_DEBUG, "[%{public}lu] [Inflate] Adding milestone for expansion'%@'", buf, 0x16u);
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v15);
  }
}

uint64_t __150__SBSAContainerDynamicsInflateAnimationProvider__addMilestonesIfNecessaryForUntrackedBoundsExpansionsForElementIdentities_preferencesMutator_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 associatedSystemApertureElementIdentity];
  uint64_t v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation, 0);
  objc_storeStrong((id *)&self->_elementIdentitiesWaitingToExpandBeforeInflation, 0);
  objc_storeStrong((id *)&self->_pendingMilestonePropertyIdentitiesToElementIdentities, 0);
  objc_storeStrong((id *)&self->_elementIdentitiesWithInflateApplied, 0);
}

@end