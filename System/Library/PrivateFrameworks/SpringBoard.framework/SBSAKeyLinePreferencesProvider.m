@interface SBSAKeyLinePreferencesProvider
- (id)behaviorSettingsForProperty:(id)a3;
- (id)preferencesFromContext:(id)a3;
@end

@implementation SBSAKeyLinePreferencesProvider

- (id)preferencesFromContext:(id)a3
{
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
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
      v120 = [MEMORY[0x1E4F28B00] currentHandler];
      Class v121 = NSClassFromString(&cfstr_Sbsacontext.isa);
      v122 = (objc_class *)objc_opt_class();
      v123 = NSStringFromClass(v122);
      [v120 handleFailureInMethod:a2, self, @"SBSAKeyLinePreferencesProvider.m", 54, @"Unexpected class – expected '%@', got '%@'", v121, v123 object file lineNumber description];
    }
  }
  else
  {
    id v9 = 0;
  }

  v10 = [v9 preferences];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  v125 = v5;
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
  id v128 = v13;

  v14 = [v9 elementContexts];
  v15 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  obuint64_t j = v14;
  uint64_t v16 = [obj countByEnumeratingWithState:&v168 objects:v180 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v169;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v169 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v168 + 1) + 8 * i);
        v21 = [v20 elementIdentifier];
        v22 = [v20 keyColor];
        if (v22) {
          [v15 setObject:v22 forKey:v21];
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v168 objects:v180 count:16];
    }
    while (v17);
  }

  int v23 = [v128 isBlobEnabled];
  int v24 = [v9 containsAnyOfSignals:1];
  v25 = [v9 preferences];
  v26 = [v25 lastChangingElementLayoutTransition];

  v124 = v26;
  if (BSEqualObjects())
  {
    BOOL v27 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, v26);
    v28 = [v26 initialElementContexts];
    if ((unint64_t)[v28 count] > 1)
    {
      BOOL v27 = 0;
    }
    else
    {
      v29 = [v26 targetElementContexts];
      BOOL v27 = [v29 count] == 2;
    }
  }
  v133 = v9;
  unint64_t mitosisSuppressionState = self->_mitosisSuppressionState;
  v130 = self;
  SEL v126 = a2;
  v127 = v15;
  if (!v23)
  {
    if (mitosisSuppressionState == 2)
    {
      v49 = SBLogSystemApertureController();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v49, OS_LOG_TYPE_DEFAULT, "Key Line: Mitosis restoration milestone not hit! Falling back to visible.", buf, 2u);
      }
    }
    int64_t v31 = 0;
    pendingMitosisKeyLineSuppressionUnhidePropertyIdentity = self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity;
    self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity = 0;
    goto LABEL_59;
  }
  if (mitosisSuppressionState <= 1) {
    int64_t v31 = 1;
  }
  else {
    int64_t v31 = self->_mitosisSuppressionState;
  }
  if ((v24 | v27) == 1)
  {
    BOOL v32 = !mitosisSuppressionState && v27;
    if (mitosisSuppressionState == 1 || v32)
    {
      v33 = [v128 containerViewDescriptions];
      v34 = [v33 lastObject];
      v35 = [v34 interfaceElementIdentifier];

      v36 = [[SBSAInterfaceElementPropertyIdentity alloc] initWithAssociatedInterfaceElementIdentifier:v35 andProperty:@"bounds"];
      v37 = self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity;
      self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity = v36;

      v167[0] = MEMORY[0x1E4F143A8];
      v167[1] = 3221225472;
      v167[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke;
      v167[3] = &unk_1E6AF53A0;
      v167[5] = a2;
      v167[4] = self;
      uint64_t v38 = [v128 copyWithBlock:v167];

      unint64_t mitosisSuppressionState = self->_mitosisSuppressionState;
      int64_t v31 = 2;
      id v128 = (id)v38;
    }
  }
  if (mitosisSuppressionState == 2 && self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity)
  {
    long long v165 = 0u;
    long long v166 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    pendingMitosisKeyLineSuppressionUnhidePropertyIdentity = [v9 animatedTransitionResults];
    uint64_t v40 = [pendingMitosisKeyLineSuppressionUnhidePropertyIdentity countByEnumeratingWithState:&v163 objects:v179 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v164;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v164 != v42) {
            objc_enumerationMutation(pendingMitosisKeyLineSuppressionUnhidePropertyIdentity);
          }
          v44 = *(void **)(*((void *)&v163 + 1) + 8 * j);
          v45 = [v44 associatedInterfaceElementPropertyIdentity];
          int v46 = [v45 isEqual:v130->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity];

          if (v46)
          {
            [v44 targetedMilestone];
            if (v47 >= 0.7)
            {
              v48 = v130->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity;
              v130->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity = 0;

              int64_t v31 = 3;
            }
          }
        }
        uint64_t v41 = [pendingMitosisKeyLineSuppressionUnhidePropertyIdentity countByEnumeratingWithState:&v163 objects:v179 count:16];
      }
      while (v41);
      self = v130;
    }
LABEL_59:
  }
  if (v31 != self->_mitosisSuppressionState)
  {
    v50 = SBLogSystemApertureController();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v51 = self->_mitosisSuppressionState - 1;
      if (v51 > 2) {
        v52 = @"idle";
      }
      else {
        v52 = off_1E6AF9DC0[v51];
      }
      if ((unint64_t)(v31 - 1) > 2) {
        v53 = @"idle";
      }
      else {
        v53 = off_1E6AF9DC0[v31 - 1];
      }
      *(_DWORD *)buf = 138543618;
      v176 = v52;
      __int16 v177 = 2114;
      v178 = v53;
      _os_log_impl(&dword_1D85BA000, v50, OS_LOG_TYPE_DEFAULT, "Key Line: Updating mitosis suppression state: (%{public}@) -> (%{public}@)", buf, 0x16u);
    }

    self->_unint64_t mitosisSuppressionState = v31;
  }
  v135 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  v54 = [v128 containerViewDescriptions];
  uint64_t v55 = [v54 countByEnumeratingWithState:&v159 objects:v174 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v160;
    do
    {
      for (uint64_t k = 0; k != v56; ++k)
      {
        if (*(void *)v160 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = *(void **)(*((void *)&v159 + 1) + 8 * k);
        v60 = [v59 associatedSystemApertureElementIdentity];
        v61 = [v60 elementIdentifier];

        v62 = SBSAElementContextAssociatedWithContainerViewDescription(v59, obj, 0);
        if (v62)
        {
          unint64_t v63 = self->_mitosisSuppressionState - 1;
          [v59 bounds];
          [v59 center];
          SBUnintegralizedRectCenteredAboutPoint();
          [v133 inertContainerFrame];
          unsigned int v64 = SBSARectApproximatelyEqualToRect() ^ 1;
          if (v63 > 1) {
            uint64_t v65 = v64;
          }
          else {
            uint64_t v65 = 0;
          }
          v66 = objc_msgSend(NSNumber, "numberWithInteger:", v65, 0x3F847AE147AE147BLL);
          [v135 setObject:v66 forKey:v61];
        }
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v159 objects:v174 count:16];
    }
    while (v56);
  }

  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v131 = [v133 containerViewDescriptions];
  uint64_t v67 = [v131 countByEnumeratingWithState:&v155 objects:v173 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = 0;
    uint64_t v70 = *(void *)v156;
    uint64_t v132 = 2;
    do
    {
      uint64_t v71 = 0;
      uint64_t v129 = v69;
      uint64_t v72 = -v69;
      do
      {
        if (*(void *)v156 != v70) {
          objc_enumerationMutation(v131);
        }
        v73 = *(void **)(*((void *)&v155 + 1) + 8 * v71);
        v74 = [v73 associatedSystemApertureElementIdentity];
        v75 = [v74 elementIdentifier];

        if (v72 == v71) {
          int v76 = [v133 isKeyLineRequiredForTransition];
        }
        else {
          int v76 = 0;
        }
        v77 = [v135 objectForKey:v75];
        int v78 = [v77 isEqualToNumber:&unk_1F33497D0];

        if (v78) {
          BOOL v79 = v76 == 0;
        }
        else {
          BOOL v79 = 0;
        }
        if (!v79)
        {
          uint64_t v80 = [v73 sampledBackgroundLuminanceLevel];
          uint64_t v81 = v132;
          if (v80 == 1) {
            uint64_t v81 = 1;
          }
          uint64_t v132 = v81;
        }

        ++v71;
      }
      while (v68 != v71);
      uint64_t v69 = v129 + v68;
      uint64_t v68 = [v131 countByEnumeratingWithState:&v155 objects:v173 count:16];
    }
    while (v68);
  }
  else
  {
    uint64_t v132 = 2;
  }

  v82 = obj;
  if (v130->_lastKnownConsensusBackgroundLuma != v132)
  {
    v83 = SBLogSystemApertureController();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      SBStringFromSystemApertureBackgroundLuminanceLevel(v130->_lastKnownConsensusBackgroundLuma);
      v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      SBStringFromSystemApertureBackgroundLuminanceLevel(v132);
      v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v176 = v84;
      __int16 v177 = 2114;
      v178 = v85;
      _os_log_impl(&dword_1D85BA000, v83, OS_LOG_TYPE_DEFAULT, "Key Line: Updating consensus background luma (%{public}@) -> (%{public}@)", buf, 0x16u);
    }
    v130->_lastKnownConsensusBackgroundLuma = v132;
  }
  if (v132 == 2)
  {
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    v86 = (void *)[v135 copy];
    uint64_t v87 = [v86 countByEnumeratingWithState:&v151 objects:v172 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v152;
      do
      {
        for (uint64_t m = 0; m != v88; ++m)
        {
          if (*(void *)v152 != v89) {
            objc_enumerationMutation(v86);
          }
          uint64_t v91 = *(void *)(*((void *)&v151 + 1) + 8 * m);
          v92 = [v135 objectForKey:v91];
          uint64_t v93 = [v92 integerValue];

          if (v93 == 1) {
            [v135 setObject:&unk_1F33497E8 forKey:v91];
          }
        }
        uint64_t v88 = [v86 countByEnumeratingWithState:&v151 objects:v172 count:16];
      }
      while (v88);
    }

    v82 = obj;
  }
  v94 = [v128 containerViewDescriptions];
  v95 = (void *)[v94 mutableCopy];

  v96 = v95;
  if ([v82 count])
  {
    unint64_t v97 = 0;
    do
    {
      v98 = [v82 objectAtIndex:v97];
      v99 = [v98 elementIdentifier];
      v149[0] = MEMORY[0x1E4F143A8];
      v149[1] = 3221225472;
      v149[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_30;
      v149[3] = &unk_1E6AF9D50;
      id v100 = v98;
      id v150 = v100;
      uint64_t v101 = [v95 indexOfObjectPassingTest:v149];
      if (v101 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v102 = v101;
        uint64_t v103 = [v95 objectAtIndexedSubscript:v101];
        if (v103)
        {
          v104 = (void *)v103;
          v144[0] = MEMORY[0x1E4F143A8];
          v144[1] = 3221225472;
          v144[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_2;
          v144[3] = &unk_1E6AF9D78;
          SEL v148 = v126;
          v144[4] = v130;
          id v145 = v135;
          id v146 = v99;
          id v147 = v127;
          v105 = (void *)[v104 copyWithBlock:v144];

          v141[0] = MEMORY[0x1E4F143A8];
          v141[1] = 3221225472;
          v141[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_3;
          v141[3] = &unk_1E6AF9DA0;
          id v142 = v105;
          SEL v143 = v126;
          v141[4] = v130;
          id v106 = v105;
          uint64_t v107 = [v128 copyWithBlock:v141];

          [v96 replaceObjectAtIndex:v102 withObject:v106];
          id v128 = (id)v107;
          v95 = v96;
        }
      }

      ++v97;
      v82 = obj;
    }
    while (v97 < [obj count]);
  }
  id v108 = [v95 firstObject];
  if ([v133 isKeyLineRequiredForTransition])
  {
    v109 = v124;
    if (![v108 keyLineMode] && v108)
    {
      v140[0] = MEMORY[0x1E4F143A8];
      v140[1] = 3221225472;
      v140[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_4;
      v140[3] = &unk_1E6AF8AB0;
      v140[4] = v130;
      v140[5] = v126;
      v140[6] = v132;
      v110 = (void *)[v108 copyWithBlock:v140];

      v137[0] = MEMORY[0x1E4F143A8];
      v137[1] = 3221225472;
      v137[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_5;
      v137[3] = &unk_1E6AF9DA0;
      SEL v139 = v126;
      v137[4] = v130;
      id v108 = v110;
      id v138 = v108;
      uint64_t v111 = [v128 copyWithBlock:v137];

      [v95 replaceObjectAtIndex:0 withObject:v108];
      id v128 = (id)v111;
    }
  }
  else
  {
    v109 = v124;
  }
  v112 = (void *)[v128 copyByUpdatingContainerViewDescriptions:v95];

  v113 = (void *)[v133 copyByUpdatingPreferences:v112];
  v136.receiver = v130;
  v136.super_class = (Class)SBSAKeyLinePreferencesProvider;
  v114 = [(SBSABasePreferencesProvider *)&v136 preferencesFromContext:v113];
  uint64_t v115 = objc_opt_class();
  id v116 = v114;
  if (v115)
  {
    if (objc_opt_isKindOfClass()) {
      v117 = v116;
    }
    else {
      v117 = 0;
    }
  }
  else
  {
    v117 = 0;
  }
  id v118 = v117;

  return v118;
}

- (id)behaviorSettingsForProperty:(id)a3
{
  id v4 = a3;
  if ((BSEqualStrings() & 1) != 0 || BSEqualStrings())
  {
    id v5 = [(id)objc_opt_class() settings];
    v6 = [v5 keyLineStyleTransition];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSAKeyLinePreferencesProvider;
    v6 = [(SBSABasePreferencesProvider *)&v8 behaviorSettingsForProperty:v4];
  }

  return v6;
}

void __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    v3 = self;
    id v4 = v14;
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
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    uint64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAKeyLinePreferencesProvider.m", 106, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  v13 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F3348AC8];
  [v6 addMilestones:v13 forPropertyIdentity:*(void *)(*(void *)(a1 + 32) + 48)];
}

uint64_t __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_30(uint64_t a1, void *a2)
{
  v2 = [a2 associatedSystemApertureElementIdentity];
  uint64_t v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

void __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v16 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v16;
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

  id v3 = v16;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    id v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAKeyLinePreferencesProvider.m", 200, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v16;
LABEL_9:
    id v7 = 0;
  }

  id v14 = [*(id *)(a1 + 40) objectForKey:*(void *)(a1 + 48)];
  objc_msgSend(v7, "setKeyLineMode:", objc_msgSend(v14, "integerValue"));

  v15 = [*(id *)(a1 + 56) objectForKey:*(void *)(a1 + 48)];
  if (v15) {
    [v7 setKeyLineTintColor:v15];
  }
}

void __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v21 = a2;
  if (v21)
  {
    id v3 = self;
    id v4 = v21;
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
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    Class v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAKeyLinePreferencesProvider.m", 208, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  v13 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"keyLineMode"];
  id v14 = [SBSAInterfaceElementPropertyIdentity alloc];
  v15 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  id v16 = [(SBSAInterfaceElementPropertyIdentity *)v14 initWithAssociatedInterfaceElementIdentifier:v15 andProperty:@"keyLineMode"];
  [v6 setAnimatedTransitionDescription:v13 forProperty:v16 withMilestones:0];

  uint64_t v17 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"keyLineTintColor"];
  uint64_t v18 = [SBSAInterfaceElementPropertyIdentity alloc];
  v19 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  v20 = [(SBSAInterfaceElementPropertyIdentity *)v18 initWithAssociatedInterfaceElementIdentifier:v19 andProperty:@"keyLineTintColor"];
  [v6 setAnimatedTransitionDescription:v17 forProperty:v20 withMilestones:0];
}

void __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_4(void *a1, void *a2)
{
  id v14 = a2;
  if (!v14) {
    goto LABEL_9;
  }
  id v3 = self;
  id v4 = v14;
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

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = a1[4];
    uint64_t v8 = a1[5];
    Class v10 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    Class v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAKeyLinePreferencesProvider.m", 222, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];

LABEL_9:
    id v6 = 0;
  }

  if (a1[6] == 2) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  [v6 setKeyLineMode:v13];
}

void __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_5(uint64_t a1, void *a2)
{
  id v23 = a2;
  if (v23)
  {
    id v3 = self;
    id v4 = v23;
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
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    Class v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAKeyLinePreferencesProvider.m", 228, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  uint64_t v13 = [(id)objc_opt_class() settings];
  id v14 = [v13 keyLineAppearForSwoopTransition];

  v15 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v14];
  id v16 = [SBSAInterfaceElementPropertyIdentity alloc];
  uint64_t v17 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  uint64_t v18 = [(SBSAInterfaceElementPropertyIdentity *)v16 initWithAssociatedInterfaceElementIdentifier:v17 andProperty:@"keyLineMode"];
  [v6 setAnimatedTransitionDescription:v15 forProperty:v18 withMilestones:0];

  v19 = (void *)[(id)objc_opt_class() newAnimatedTransitionDescriptionWithBehaviorSettings:v14];
  v20 = [SBSAInterfaceElementPropertyIdentity alloc];
  id v21 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  v22 = [(SBSAInterfaceElementPropertyIdentity *)v20 initWithAssociatedInterfaceElementIdentifier:v21 andProperty:@"keyLineTintColor"];
  [v6 setAnimatedTransitionDescription:v19 forProperty:v22 withMilestones:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity, 0);
  objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, 0);
}

@end