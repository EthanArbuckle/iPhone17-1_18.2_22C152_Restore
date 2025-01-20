@interface SBSALayoutTransitionProvider
- (BOOL)isInitialized;
- (NSString)description;
- (id)_adjunctElementIdentificationInContext:(id)a3;
- (id)_elementLayoutModeSupportingChildProvider;
- (id)_layoutProviderForLayoutMode:(int64_t)a3;
- (id)preferencesFromContext:(id)a3;
- (int64_t)previousElementLayoutMode;
- (int64_t)targetElementLayoutMode;
- (void)_removeChildMitosisAndRecombinationProviders;
- (void)removeFromParentProvider;
@end

@implementation SBSALayoutTransitionProvider

- (NSString)description
{
  BOOL v3 = [(SBSALayoutTransitionProvider *)self isInitialized];
  id v4 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromBOOL();
  v7 = (void *)[v4 initWithFormat:@"<%@: %p; initialized: %@", v5, self, v6];

  if (v3)
  {
    [(SBSALayoutTransitionProvider *)self previousElementLayoutMode];
    v8 = SAUIStringFromElementViewLayoutMode();
    [(SBSALayoutTransitionProvider *)self targetElementLayoutMode];
    v9 = SAUIStringFromElementViewLayoutMode();
    [v7 appendFormat:@"; previousElementLayoutMode: %@; targetElementLayoutMode: %@", v8, v9];
  }
  [v7 appendString:@">"];
  return (NSString *)v7;
}

- (void)removeFromParentProvider
{
  [(SBSALayoutTransitionProvider *)self _removeChildMitosisAndRecombinationProviders];
  v3.receiver = self;
  v3.super_class = (Class)SBSALayoutTransitionProvider;
  [(SBSABasePreferencesProvider *)&v3 removeFromParentProvider];
}

- (id)preferencesFromContext:(id)a3
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
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

  v9 = self;
  v10 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:v9];

  v11 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
  if (!v8)
  {
LABEL_66:
    int v65 = 0;
    goto LABEL_67;
  }
  p_targetLayoutProvider = &self->_targetLayoutProvider;
  targetLayoutProvider = self->_targetLayoutProvider;
  if (!targetLayoutProvider)
  {
    v14 = SBLogSystemAperturePreferencesStackElements();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[SBSALayoutTransitionProvider preferencesFromContext:].cold.7(v8, v14);
    }

    [(SBSABasePreferencesProvider *)v10 removeFromParentProvider];
    v15 = [v8 elementContexts];
    v16 = objc_msgSend(v15, "bs_firstObjectPassingTest:", &__block_literal_global_163);

    uint64_t v17 = -[SBSALayoutTransitionProvider _layoutProviderForLayoutMode:](self, "_layoutProviderForLayoutMode:", [v16 layoutMode]);
    v18 = *p_targetLayoutProvider;
    *p_targetLayoutProvider = (SBSAElementLayoutModeSupporting *)v17;

    v19 = SBLogSystemAperturePreferencesStackElements();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[SBSALayoutTransitionProvider preferencesFromContext:].cold.6();
    }

    v20 = [(SBSALayoutTransitionProvider *)self _elementLayoutModeSupportingChildProvider];
    previousLayoutProvider = self->_previousLayoutProvider;
    self->_previousLayoutProvider = v20;
    v22 = v20;

    v23 = [v8 preferences];
    self->_BOOL awaitingCollision = [v23 isCollisionImminent];

    v24 = SBLogSystemAperturePreferencesStackElements();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[SBSALayoutTransitionProvider preferencesFromContext:].cold.5();
    }

    [(SBSAElementLayoutModeSupporting *)v22 removeFromParentProvider];
    v25 = [v8 preferences];
    v26 = [v25 lastChangingElementLayoutTransition];
    uint64_t v27 = +[SBSAElementContentProvider disappearanceTransitionElementContentProviderWithParentProvider:self staticLayoutTransition:v26];

    targetLayoutProvider = *p_targetLayoutProvider;
    v10 = (SBSAElementContentProvider *)v27;
    v11 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
  }
  v28 = [(SBSAElementLayoutModeSupporting *)targetLayoutProvider parentProvider];
  BOOL v29 = v28 != 0;

  if (v28)
  {
    if ([v8 containsAnyOfSignals:2])
    {
      v30 = SBLogSystemAperturePreferencesStackElements();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[SBSALayoutTransitionProvider preferencesFromContext:]();
      }
      uint64_t v31 = (uint64_t)v10;
LABEL_20:

      v10 = (SBSAElementContentProvider *)v31;
      goto LABEL_46;
    }
    BOOL v29 = 0;
  }
  else
  {
    v32 = SBLogSystemAperturePreferencesStackElements();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      -[SBSALayoutTransitionProvider preferencesFromContext:].cold.4();
    }

    BOOL awaitingCollision = self->_awaitingCollision;
    if (awaitingCollision) {
      BOOL awaitingCollision = ([v8 signals] & 1) == 0;
    }
    self->_BOOL awaitingCollision = awaitingCollision;
    v34 = [v8 preferences];
    v35 = [v34 elementLayoutTransition];
    int v36 = [v35 isSingleElementExpansion];

    if (!self->_awaitingCollision)
    {
      int v92 = v36;
      int v37 = self->_initialized ? 1 : v36;
      if (v37 == 1)
      {
        v38 = SBLogSystemAperturePreferencesStackElements();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v91 = [v8 queryIteration];
          NSStringFromBOOL();
          v80 = (SBSAElementContentProvider *)objc_claimAutoreleasedReturnValue();
          NSStringFromBOOL();
          v81 = (SBSAElementContentProvider *)objc_claimAutoreleasedReturnValue();
          NSStringFromBOOL();
          v82 = (SBSAElementLayoutModeSupporting *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134349826;
          uint64_t v96 = v91;
          __int16 v97 = 2112;
          v98 = v80;
          __int16 v99 = 2112;
          v100 = v81;
          __int16 v101 = 2112;
          v102 = v82;
          _os_log_debug_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_DEBUG, "[%{public}lu] awaitingCollision: %@; initialized: %@; isSingleElementExpansion: %@",
            buf,
            0x2Au);
        }
        [(SBSABasePreferencesProvider *)v10 removeFromParentProvider];
        v30 = [(SBSALayoutTransitionProvider *)self _elementLayoutModeSupportingChildProvider];
        [v30 removeFromParentProvider];
        childMitosisProvider = self->_childMitosisProvider;
        if (!childMitosisProvider)
        {
          childMitosisProvider = self->_childRecombinationProvider;
          if (!childMitosisProvider) {
            childMitosisProvider = self;
          }
        }
        id v89 = childMitosisProvider;
        [v89 setChildProvider:*p_targetLayoutProvider];
        v87 = *p_targetLayoutProvider;
        v40 = [v8 preferences];
        v41 = [v40 lastChangingElementLayoutTransition];
        uint64_t v31 = +[SBSAElementContentProvider appearanceTransitionElementContentProviderWithParentProvider:v87 staticLayoutTransition:v41];

        if (v92)
        {
          if ([(SBSAElementLayoutModeSupporting *)*p_targetLayoutProvider supportedElementLayoutMode] == 3)
          {
            v42 = [v8 elementInteractionResults];
            int v43 = objc_msgSend(v42, "bs_containsObjectPassingTest:", &__block_literal_global_13);

            if (v43)
            {
              v44 = [(SBSABasePreferencesProvider *)[SBSAPopTransitionProvider alloc] initWithParentProvider:self];
              childPopProvider = self->_childPopProvider;
              self->_childPopProvider = v44;

              v46 = SBLogSystemAperturePreferencesStackElements();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
                -[SBSALayoutTransitionProvider preferencesFromContext:]();
              }
            }
          }
        }
        v47 = SBLogSystemAperturePreferencesStackElements();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v83 = [v8 queryIteration];
          v84 = *p_targetLayoutProvider;
          *(_DWORD *)buf = 134350082;
          uint64_t v96 = v83;
          __int16 v97 = 2112;
          v98 = (SBSAElementContentProvider *)v31;
          __int16 v99 = 2112;
          v100 = (SBSAElementContentProvider *)v30;
          __int16 v101 = 2112;
          v102 = v84;
          __int16 v103 = 2112;
          uint64_t v104 = v31;
          _os_log_debug_impl(&dword_1D85BA000, v47, OS_LOG_TYPE_DEBUG, "[%{public}lu] Removed content provider '%@', removed layout provider '%@', inserted layout provider '%@', added content provider '%@'", buf, 0x34u);
        }

        v11 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
        goto LABEL_20;
      }
    }
    BOOL v29 = 0;
    v11 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
  }
LABEL_46:
  if (self->_transitionKind) {
    goto LABEL_57;
  }
  v48 = [v8 preferences];
  int v49 = [v48 isCollisionImminent];

  int64_t v50 = [(SBSALayoutTransitionProvider *)self targetElementLayoutMode];
  if (!v49)
  {
    if (v50 == 1)
    {
      v54 = [v8 preferences];
      v55 = [v54 elementLayoutTransition];
      v56 = [v55 targetElementContexts];
      if ((unint64_t)[v56 count] >= 2)
      {

        v11 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
LABEL_56:
        self->_transitionKind = 2;
        v59 = [SBSAMitosisTransitionProvider alloc];
        v60 = [(SBSALayoutTransitionProvider *)self _adjunctElementIdentificationInContext:v8];
        v61 = [(SBSASequencedBehaviorProvider *)v59 initWithParticipantIdentifier:v60];
        v62 = self->_childMitosisProvider;
        self->_childMitosisProvider = v61;

        [(SBSABasePreferencesProvider *)self setChildProvider:self->_childMitosisProvider];
LABEL_57:
        if (v29) {
          goto LABEL_58;
        }
LABEL_62:
        if (self->_transitionKind == 4 && !self->_awaitingCollision)
        {
          childRecombinationProvider = self->_childRecombinationProvider;
          if (childRecombinationProvider)
          {
            [(SBSABasePreferencesProvider *)childRecombinationProvider removeFromParentProvider];
            v67 = self->_childRecombinationProvider;
            self->_childRecombinationProvider = 0;

            v68 = [SBSAMitosisTransitionProvider alloc];
            v69 = [(SBSALayoutTransitionProvider *)self _adjunctElementIdentificationInContext:v8];
            v70 = [(SBSASequencedBehaviorProvider *)v68 initWithParticipantIdentifier:v69];
            v71 = self->_childMitosisProvider;
            self->_childMitosisProvider = v70;

            [(SBSABasePreferencesProvider *)self setChildProvider:self->_childMitosisProvider];
          }
        }
        goto LABEL_66;
      }
      v88 = [v8 preferences];
      v85 = [v88 elementLayoutTransition];
      [v85 targetElementContexts];
      v57 = v93 = v55;
      [v57 firstObject];
      v58 = v90 = v54;
      unint64_t v86 = [v58 interfaceOrientation] - 3;

      v11 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
      if (v86 < 2) {
        goto LABEL_56;
      }
    }
    self->_transitionKind = 1;
    if (v29) {
      goto LABEL_58;
    }
    goto LABEL_62;
  }
  int64_t v51 = 3;
  if (v50 == 1) {
    int64_t v51 = 4;
  }
  self->_transitionKind = v51;
  v52 = [(SBSABasePreferencesProvider *)[SBSARecombinationTransitionProvider alloc] initWithParentProvider:self];
  v53 = self->_childRecombinationProvider;
  self->_childRecombinationProvider = v52;

  if (!v29) {
    goto LABEL_62;
  }
LABEL_58:
  [(SBSALayoutTransitionProvider *)self _removeChildMitosisAndRecombinationProviders];
  v63 = v10;
  [(SBSABasePreferencesProvider *)v63 removeFromParentProvider];
  v10 = [[SBSAElementContentProvider alloc] initWithParentProvider:*p_targetLayoutProvider];

  v64 = SBLogSystemAperturePreferencesStackElements();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v79 = [v8 queryIteration];
    *(_DWORD *)buf = 134349570;
    uint64_t v96 = v79;
    __int16 v97 = 2112;
    v98 = v63;
    __int16 v99 = 2112;
    v100 = v10;
    _os_log_debug_impl(&dword_1D85BA000, v64, OS_LOG_TYPE_DEBUG, "[%{public}lu] Transition complete – removed appearance content provider '%@', added steady state content provider '%@'", buf, 0x20u);
  }

  int v65 = 1;
LABEL_67:
  *((unsigned char *)&self->super.super.isa + v11[950]) = 1;
  v94.receiver = self;
  v94.super_class = (Class)SBSALayoutTransitionProvider;
  v72 = [(SBSABasePreferencesProvider *)&v94 preferencesFromContext:v8];
  uint64_t v73 = objc_opt_class();
  id v74 = v72;
  if (v73)
  {
    if (objc_opt_isKindOfClass()) {
      v75 = v74;
    }
    else {
      v75 = 0;
    }
  }
  else
  {
    v75 = 0;
  }
  id v76 = v75;

  if (v65)
  {
    v77 = SBLogSystemAperturePreferencesStackElements();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
      -[SBSALayoutTransitionProvider preferencesFromContext:]();
    }

    [(SBSALayoutTransitionProvider *)self removeFromParentProvider];
  }

  return v76;
}

BOOL __55__SBSALayoutTransitionProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 layoutMode] > 0;
}

BOOL __55__SBSALayoutTransitionProvider_preferencesFromContext___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 interactionSource] == 2 && objc_msgSend(v2, "viewInteractionResult") == 1;

  return v3;
}

- (int64_t)previousElementLayoutMode
{
  return [(SBSAElementLayoutModeSupporting *)self->_previousLayoutProvider supportedElementLayoutMode];
}

- (int64_t)targetElementLayoutMode
{
  return [(SBSAElementLayoutModeSupporting *)self->_targetLayoutProvider supportedElementLayoutMode];
}

- (void)_removeChildMitosisAndRecombinationProviders
{
  [(SBSABasePreferencesProvider *)self->_childMitosisProvider removeFromParentProvider];
  childMitosisProvider = self->_childMitosisProvider;
  self->_childMitosisProvider = 0;

  [(SBSABasePreferencesProvider *)self->_childRecombinationProvider removeFromParentProvider];
  childRecombinationProvider = self->_childRecombinationProvider;
  self->_childRecombinationProvider = 0;

  [(SBSABasePreferencesProvider *)self->_childPopProvider removeFromParentProvider];
  childPopProvider = self->_childPopProvider;
  self->_childPopProvider = 0;
}

- (id)_layoutProviderForLayoutMode:(int64_t)a3
{
  if (a3 < 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [[SBSALayoutModeLayoutProvider alloc] initWithLayoutMode:a3];
  }
  return v4;
}

- (id)_elementLayoutModeSupportingChildProvider
{
  uint64_t v3 = self;
  id v4 = [(SBSABasePreferencesProvider *)self firstChildPreferenceProviderOfClass:v3];

  return v4;
}

- (id)_adjunctElementIdentificationInContext:(id)a3
{
  uint64_t v3 = [a3 elementContexts];
  if ([v3 count])
  {
    uint64_t v4 = 0;
    while (SBSAIsElementInCollectionSensorAttached(v4, v3))
    {
      if (++v4 >= (unint64_t)[v3 count]) {
        goto LABEL_5;
      }
    }
    uint64_t v5 = [v3 objectAtIndex:v4];
  }
  else
  {
LABEL_5:
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childPopProvider, 0);
  objc_storeStrong((id *)&self->_childMitosisProvider, 0);
  objc_storeStrong((id *)&self->_childRecombinationProvider, 0);
  objc_storeStrong((id *)&self->_targetLayoutProvider, 0);
  objc_storeStrong((id *)&self->_previousLayoutProvider, 0);
}

- (void)preferencesFromContext:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  [v0 queryIteration];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "[%{public}lu] Removing layout transition provider '%@'", v3, v4, v5, v6, v7);
}

- (void)preferencesFromContext:.cold.2()
{
  OUTLINED_FUNCTION_3_3();
  [v0 queryIteration];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "[%{public}lu] Steady state reached – safe to remove layout transition provider '%@'", v3, v4, v5, v6, v7);
}

- (void)preferencesFromContext:.cold.3()
{
  OUTLINED_FUNCTION_3_3();
  [v0 queryIteration];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "[%{public}lu] Adding pop transition provider for long press expansion animation: '%@'", v3, v4, v5, v6, v7);
}

- (void)preferencesFromContext:.cold.4()
{
  OUTLINED_FUNCTION_3_3();
  [v0 queryIteration];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "[%{public}lu] No parent for target layout provider '%@'", v3, v4, v5, v6, v7);
}

- (void)preferencesFromContext:.cold.5()
{
  OUTLINED_FUNCTION_3_3();
  [v0 queryIteration];
  uint8_t v7 = NSStringFromBOOL();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "[%{public}lu] awaitingCollision: %@", v3, v4, v5, v6, 2u);
}

- (void)preferencesFromContext:.cold.6()
{
  OUTLINED_FUNCTION_3_3();
  [v0 queryIteration];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "[%{public}lu] Instantiated new target layout provider '%@'", v3, v4, v5, v6, v7);
}

- (void)preferencesFromContext:(void *)a1 .cold.7(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134349056;
  uint64_t v4 = [a1 queryIteration];
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[%{public}lu] No target layout provider", (uint8_t *)&v3, 0xCu);
}

@end