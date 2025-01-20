@interface STUIStatusBarDisplayItemState
+ (id)stateForDisplayItemWithIdentifier:(id)a3 statusBar:(id)a4;
+ (void)setupRelationsBetweenDisplayItemStates:(id)a3 visualProvider:(id)a4;
- (BOOL)_resolveDependentItemStatesWithBlock:(id)a3;
- (BOOL)_updatePlacementWithRecursionBlock:(id)a3;
- (BOOL)_updateToNextPlacementStateIfNeeded;
- (BOOL)hasRunningAnimations;
- (BOOL)isCurrentPlacement:(id)a3;
- (BOOL)isDataEnabled;
- (BOOL)isEnabled;
- (BOOL)isEnabledIgnoringAnimations;
- (BOOL)isFloating;
- (BOOL)prepareAnimation:(id)a3;
- (BOOL)updatePlacement;
- (BOOL)wasEnabled;
- (BOOL)wasVisible;
- (NSArray)potentialPlacementRegionIdentifiers;
- (NSMutableArray)placementStates;
- (NSMutableSet)animations;
- (NSString)debugDescription;
- (NSString)description;
- (STUIStatusBar)statusBar;
- (STUIStatusBarAnimation)addingAnimation;
- (STUIStatusBarAnimation)removingAnimation;
- (STUIStatusBarDisplayItem)displayItem;
- (STUIStatusBarDisplayItemPlacementState)currentPlacementState;
- (STUIStatusBarIdentifier)identifier;
- (STUIStatusBarItem)item;
- (STUIStatusBarStyleAttributes)overriddenStyleAttributes;
- (id)_animationWithUpdateAnimation:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)_effectiveStyleAttributesFromStyleAttributes:(id)a3 data:(id)a4 styleAttributesChanged:(BOOL *)a5;
- (id)_updateForItem:(id)a3 data:(id)a4 styleAttributes:(id)a5;
- (id)_updateForUpdatedData:(id)a3 updatedStyleAttributes:(id)a4 updatedEnability:(id)a5;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)placementStateForPlacement:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)updateWithData:(id)a3 styleAttributes:(id)a4;
- (int64_t)_animationType;
- (int64_t)currentPlacementStateIndex;
- (int64_t)dataUpdateStatus;
- (int64_t)enabilityStatus;
- (int64_t)placementUpdateStatus;
- (int64_t)preferredPlacementStateIndex;
- (int64_t)previousPlacementStateIndex;
- (int64_t)priority;
- (int64_t)visibilityStatus;
- (void)_cancelObsoleteAnimations;
- (void)_updateStatuses;
- (void)addPlacement:(id)a3 inRegion:(id)a4;
- (void)prepareForDataUpdate;
- (void)prepareForOverflowDataUpdate;
- (void)resetToPreferredPlacement;
- (void)setAddingAnimation:(id)a3;
- (void)setCurrentPlacementStateIndex:(int64_t)a3;
- (void)setDataEnabled:(BOOL)a3;
- (void)setDataUpdateStatus:(int64_t)a3;
- (void)setDisplayItem:(id)a3;
- (void)setEnabilityStatus:(int64_t)a3;
- (void)setFloating:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setItem:(id)a3;
- (void)setOverriddenStyleAttributes:(id)a3;
- (void)setPlacementStates:(id)a3;
- (void)setPlacementUpdateStatus:(int64_t)a3;
- (void)setPreferredPlacementStateIndex:(int64_t)a3;
- (void)setPreviousPlacementStateIndex:(int64_t)a3;
- (void)setRemovingAnimation:(id)a3;
- (void)setStatusBar:(id)a3;
- (void)setVisibilityStatus:(int64_t)a3;
- (void)setWasEnabled:(BOOL)a3;
- (void)setWasVisible:(BOOL)a3;
- (void)updateToNextEnabledPlacement;
@end

@implementation STUIStatusBarDisplayItemState

- (void)prepareForDataUpdate
{
  self->_dataUpdateStatus = 0;
  self->_currentPlacementStateIndex = 0;
  self->_enabilityStatus = 0;
  self->_visibilityStatus = 0;
}

- (id)placementStateForPlacement:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_placementStates;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "placement", (void)v13);
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)updateWithData:(id)a3 styleAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_dataUpdateStatus == 2)
  {
    id v8 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_23;
  }
  self->_dataUpdateStatus = 1;
  v9 = [MEMORY[0x1E4F1CA48] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayItem);
  int v11 = [WeakRetained clearPreviousTokenDisablementIfNecessary];

  if (v11)
  {
    [(STUIStatusBarDisplayItemState *)self setWasEnabled:0];
  }
  else
  {
    id v12 = objc_loadWeakRetained((id *)&self->_displayItem);
    -[STUIStatusBarDisplayItemState setWasEnabled:](self, "setWasEnabled:", [v12 isEnabled]);
  }
  id v13 = objc_loadWeakRetained((id *)&self->_displayItem);
  -[STUIStatusBarDisplayItemState setWasVisible:](self, "setWasVisible:", [v13 visible]);

  [(STUIStatusBarDisplayItemState *)self setPreviousPlacementStateIndex:[(STUIStatusBarDisplayItemState *)self currentPlacementStateIndex]];
  id v14 = objc_loadWeakRetained((id *)&self->_displayItem);
  -[STUIStatusBarDisplayItemState setFloating:](self, "setFloating:", [v14 floating]);

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __64__STUIStatusBarDisplayItemState_updateWithData_styleAttributes___block_invoke;
  v40[3] = &unk_1E6AA3BF0;
  id v15 = v6;
  id v41 = v15;
  id v16 = v7;
  id v42 = v16;
  id v17 = v9;
  id v43 = v17;
  if ([(STUIStatusBarDisplayItemState *)self _updatePlacementWithRecursionBlock:v40])
  {
    id v39 = v7;
    location = (id *)&self->_item;
    id v18 = objc_loadWeakRetained((id *)&self->_item);
    id v19 = objc_loadWeakRetained((id *)&self->_displayItem);
    id v20 = objc_loadWeakRetained((id *)&self->_statusBar);
    v21 = [v20 currentAggregatedData];
    -[STUIStatusBarDisplayItemState setDataEnabled:](self, "setDataEnabled:", [v18 canEnableDisplayItem:v19 fromData:v21]);

    [(STUIStatusBarDisplayItemState *)self _updateStatuses];
    int64_t v22 = [(STUIStatusBarDisplayItemState *)self enabilityStatus];
    switch(v22)
    {
      case 1:
        id v23 = objc_loadWeakRetained(location);
        v27 = [(STUIStatusBarDisplayItemState *)self _updateForItem:v23 data:v15 styleAttributes:v16];
        break;
      case 3:
        v27 = -[STUIStatusBarDisplayItemState _updateForUpdatedData:updatedStyleAttributes:updatedEnability:](self, "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", 0, 0, MEMORY[0x1E4F1CC28], location);
LABEL_15:
        id v7 = v39;
        if (v27)
        {
          v28 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];
          v29 = [v28 placement];
          v30 = [v29 itemInfo];
          [v27 setPlacementInfo:v30];

          id v31 = objc_loadWeakRetained(location);
          id v32 = objc_loadWeakRetained((id *)&self->_displayItem);
          v33 = [v31 _applyUpdate:v27 toDisplayItem:v32];

          id v34 = objc_loadWeakRetained((id *)&self->_displayItem);
          -[STUIStatusBarDisplayItemState setDataEnabled:](self, "setDataEnabled:", [v34 isEnabled]);
        }
        else
        {
          v33 = 0;
        }
        goto LABEL_19;
      case 2:
        id v23 = objc_loadWeakRetained((id *)&self->_statusBar);
        v24 = objc_msgSend(v23, "currentAggregatedData", location);
        id v25 = objc_loadWeakRetained((id *)&self->_statusBar);
        v26 = [v25 styleAttributes];
        v27 = [(STUIStatusBarDisplayItemState *)self _updateForUpdatedData:v24 updatedStyleAttributes:v26 updatedEnability:MEMORY[0x1E4F1CC38]];

        break;
      default:
        v27 = 0;
        v33 = 0;
        id v7 = v39;
LABEL_19:
        [(STUIStatusBarDisplayItemState *)self _updateStatuses];
        [(STUIStatusBarDisplayItemState *)self _cancelObsoleteAnimations];
        v35 = [(STUIStatusBarDisplayItemState *)self _animationWithUpdateAnimation:v33];

        if (v35)
        {
          v36 = [(STUIStatusBarDisplayItemState *)self identifier];
          [v35 setDisplayItemIdentifier:v36];

          [v17 addObject:v35];
        }
        *(_OWORD *)&self->_dataUpdateStatus = xmmword_1D7ED59D0;
        self->_preferredPlacementStateIndex = self->_currentPlacementStateIndex;
        id v8 = v17;

        goto LABEL_22;
    }

    goto LABEL_15;
  }
  self->_dataUpdateStatus = 0;
  id v8 = (id)MEMORY[0x1E4F1CBF0];
LABEL_22:

LABEL_23:
  return v8;
}

- (void)setVisibilityStatus:(int64_t)a3
{
  self->_visibilityStatus = a3;
}

- (BOOL)_updatePlacementWithRecursionBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayItem);
  -[STUIStatusBarDisplayItemState setFloating:](self, "setFloating:", [WeakRetained floating]);

  if ([(STUIStatusBarDisplayItemState *)self isFloating])
  {
    self->_currentPlacementStateIndex = -1;
LABEL_5:
    [(STUIStatusBarDisplayItemState *)self _updateStatuses];
    BOOL v7 = 1;
    goto LABEL_6;
  }
  id v6 = [(STUIStatusBarDisplayItemState *)self removingAnimation];

  if (v6)
  {
    self->_currentPlacementStateIndex = self->_previousPlacementStateIndex;
    [(STUIStatusBarDisplayItemState *)self _resolveDependentItemStatesWithBlock:v4];
    goto LABEL_5;
  }
  v9 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];

  if (!v9) {
    goto LABEL_5;
  }
  while (1)
  {
    v10 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];
    int v11 = [v10 canBeEnabled];

    if (v11)
    {
      if (![(STUIStatusBarDisplayItemState *)self _resolveDependentItemStatesWithBlock:v4])break; {
    }
      }
    if (![(STUIStatusBarDisplayItemState *)self _updateToNextPlacementStateIfNeeded])goto LABEL_5; {
  }
    }
  BOOL v7 = 0;
LABEL_6:

  return v7;
}

- (BOOL)isCurrentPlacement:(id)a3
{
  id v4 = a3;
  v5 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];
  id v6 = [v5 placement];
  uint64_t v7 = [v6 priority];
  uint64_t v8 = [v4 priority];

  BOOL v9 = v7 == v8 && [(STUIStatusBarDisplayItemState *)self isEnabled];
  return v9;
}

- (STUIStatusBarDisplayItemPlacementState)currentPlacementState
{
  unint64_t currentPlacementStateIndex = self->_currentPlacementStateIndex;
  if (currentPlacementStateIndex >= [(NSMutableArray *)self->_placementStates count])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(NSMutableArray *)self->_placementStates objectAtIndexedSubscript:self->_currentPlacementStateIndex];
  }
  return (STUIStatusBarDisplayItemPlacementState *)v4;
}

- (void)_updateStatuses
{
  BOOL v3 = [(STUIStatusBarDisplayItemState *)self isEnabledIgnoringAnimations];
  BOOL v4 = v3;
  if (self->_wasEnabled || !v3)
  {
    int v6 = !self->_wasEnabled || v3;
    uint64_t v7 = self->_wasEnabled && v3;
    if (v6 == 1) {
      uint64_t v5 = v7;
    }
    else {
      uint64_t v5 = 3;
    }
  }
  else
  {
    uint64_t v5 = 2;
  }
  [(STUIStatusBarDisplayItemState *)self setEnabilityStatus:v5];
  if (!self->_wasVisible && v4)
  {
    uint64_t v9 = 1;
  }
  else
  {
    int v10 = !v4;
    int v11 = !self->_wasVisible || v4;
    if (!self->_wasVisible) {
      int v10 = 1;
    }
    BOOL v12 = v10 == 0;
    uint64_t v13 = 2;
    if (!v12) {
      uint64_t v13 = 0;
    }
    if (v11 == 1) {
      uint64_t v9 = v13;
    }
    else {
      uint64_t v9 = 3;
    }
  }
  [(STUIStatusBarDisplayItemState *)self setVisibilityStatus:v9];
}

- (BOOL)isEnabledIgnoringAnimations
{
  if (!self->_dataEnabled) {
    return 0;
  }
  BOOL v3 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];
  char v5 = [v4 isEnabled];

  return v5;
}

- (void)setEnabilityStatus:(int64_t)a3
{
  self->_enabilityStatus = a3;
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (BOOL)_updateToNextPlacementStateIfNeeded
{
  uint64_t v3 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    char v5 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];
    char v6 = [v5 isEnabled];

    if (v6)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      ++self->_currentPlacementStateIndex;
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (STUIStatusBarAnimation)removingAnimation
{
  return self->_removingAnimation;
}

- (BOOL)isFloating
{
  return self->_floating;
}

- (void)setDataEnabled:(BOOL)a3
{
  self->_dataEnabled = a3;
}

- (int64_t)enabilityStatus
{
  return self->_enabilityStatus;
}

- (BOOL)isEnabled
{
  if ([(STUIStatusBarDisplayItemState *)self hasRunningAnimations] || self->_floating) {
    return 1;
  }
  return [(STUIStatusBarDisplayItemState *)self isEnabledIgnoringAnimations];
}

- (BOOL)hasRunningAnimations
{
  return self->_addingAnimation || self->_removingAnimation || [(NSMutableSet *)self->_animations count] != 0;
}

- (void)setWasVisible:(BOOL)a3
{
  self->_wasVisible = a3;
}

- (void)setWasEnabled:(BOOL)a3
{
  self->_wasEnabled = a3;
}

- (void)setPreviousPlacementStateIndex:(int64_t)a3
{
  self->_previousPlacementStateIndex = a3;
}

- (int64_t)currentPlacementStateIndex
{
  return self->_currentPlacementStateIndex;
}

- (void)_cancelObsoleteAnimations
{
  int64_t v3 = [(STUIStatusBarDisplayItemState *)self _animationType];
  if (v3 == 2)
  {
    char v6 = [(STUIStatusBarDisplayItemState *)self addingAnimation];

    if (v6)
    {
      uint64_t v7 = [(STUIStatusBarDisplayItemState *)self addingAnimation];
      [v7 cancel];

      [(STUIStatusBarDisplayItemState *)self setAddingAnimation:0];
    }
    uint64_t v8 = [(STUIStatusBarDisplayItemState *)self animations];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      int v10 = [(STUIStatusBarDisplayItemState *)self animations];
      id v12 = (id)[v10 copy];

      [v12 makeObjectsPerformSelector:sel_cancel];
      int v11 = [(STUIStatusBarDisplayItemState *)self animations];
      [v11 removeAllObjects];
    }
  }
  else if (v3 == 1)
  {
    BOOL v4 = [(STUIStatusBarDisplayItemState *)self removingAnimation];

    if (v4)
    {
      char v5 = [(STUIStatusBarDisplayItemState *)self removingAnimation];
      [v5 cancel];

      [(STUIStatusBarDisplayItemState *)self setRemovingAnimation:0];
    }
  }
}

- (int64_t)_animationType
{
  int64_t result = [(STUIStatusBarDisplayItemState *)self visibilityStatus];
  if (result)
  {
    if (result == 3)
    {
      return 2;
    }
    else if (result == 2)
    {
      if ([(STUIStatusBarDisplayItemState *)self enabilityStatus] == 2) {
        return 1;
      }
      else {
        return 3;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (int64_t)visibilityStatus
{
  return self->_visibilityStatus;
}

- (id)_animationWithUpdateAnimation:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  int v6 = [WeakRetained areAnimationsEnabled];

  if (!v6) {
    goto LABEL_7;
  }
  id v7 = v4;
  if (v7) {
    goto LABEL_8;
  }
  int64_t v8 = [(STUIStatusBarDisplayItemState *)self _animationType];
  if (v8 != 2)
  {
    if (v8 == 1)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_item);
      id v7 = [v9 additionAnimationForDisplayItemWithIdentifier:self->_identifier];

      id v10 = objc_loadWeakRetained((id *)&self->_statusBar);
      int v11 = [v10 visualProvider];
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        goto LABEL_8;
      }
      id v13 = objc_loadWeakRetained((id *)&self->_statusBar);
      id v14 = [v13 visualProvider];
      uint64_t v15 = [v14 additionAnimationForDisplayItemWithIdentifier:self->_identifier itemAnimation:v7];
      goto LABEL_13;
    }
LABEL_7:
    id v7 = 0;
    goto LABEL_8;
  }
  id v17 = objc_loadWeakRetained((id *)&self->_item);
  id v7 = [v17 removalAnimationForDisplayItemWithIdentifier:self->_identifier];

  id v18 = objc_loadWeakRetained((id *)&self->_statusBar);
  id v19 = [v18 visualProvider];
  char v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) == 0) {
    goto LABEL_8;
  }
  id v13 = objc_loadWeakRetained((id *)&self->_statusBar);
  id v14 = [v13 visualProvider];
  uint64_t v15 = [v14 removalAnimationForDisplayItemWithIdentifier:self->_identifier itemAnimation:v7];
LABEL_13:
  v21 = (void *)v15;

  id v7 = v21;
LABEL_8:

  return v7;
}

void __87__STUIStatusBarDisplayItemState_setupRelationsBetweenDisplayItemStates_visualProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  obuint64_t j = [v3 placementStates];
  uint64_t v58 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
  if (v58)
  {
    uint64_t v57 = *(void *)v87;
    id v59 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v87 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = v4;
        v63 = *(void **)(*((void *)&v86 + 1) + 8 * v4);
        char v5 = [v63 placement];
        int v6 = [MEMORY[0x1E4F1CA80] set];
        id v7 = [v5 excludedPlacements];
        int64_t v8 = [v7 allObjects];
        [v6 addObjectsFromArray:v8];

        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v61 = [v5 excludedRegionIdentifiers];
        uint64_t v64 = [v61 countByEnumeratingWithState:&v82 objects:v94 count:16];
        if (v64)
        {
          uint64_t v62 = *(void *)v83;
          do
          {
            for (uint64_t i = 0; i != v64; ++i)
            {
              if (*(void *)v83 != v62) {
                objc_enumerationMutation(v61);
              }
              id v10 = [*(id *)(a1 + 32) orderedDisplayItemPlacementsInRegionWithIdentifier:*(void *)(*((void *)&v82 + 1) + 8 * i)];
              long long v78 = 0u;
              long long v79 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              uint64_t v11 = [v10 countByEnumeratingWithState:&v78 objects:v93 count:16];
              if (v11)
              {
                uint64_t v12 = v11;
                uint64_t v13 = *(void *)v79;
                do
                {
                  for (uint64_t j = 0; j != v12; ++j)
                  {
                    if (*(void *)v79 != v13) {
                      objc_enumerationMutation(v10);
                    }
                    uint64_t v15 = *(void *)(*((void *)&v78 + 1) + 8 * j);
                    id v16 = [v5 includedPlacements];
                    char v17 = [v16 containsObject:v15];

                    if ((v17 & 1) == 0) {
                      [v6 addObject:v15];
                    }
                  }
                  uint64_t v12 = [v10 countByEnumeratingWithState:&v78 objects:v93 count:16];
                }
                while (v12);
              }
            }
            uint64_t v64 = [v61 countByEnumeratingWithState:&v82 objects:v94 count:16];
          }
          while (v64);
        }

        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v18 = v6;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v74 objects:v92 count:16];
        id v3 = v59;
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v75;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v75 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = *(void **)(*((void *)&v74 + 1) + 8 * k);
              v24 = +[STUIStatusBarDisplayItemRelation exclusionWithDisplayItemState:v59 placement:v5];
              id v25 = *(void **)(a1 + 40);
              v26 = [v23 identifier];
              v27 = [v25 objectForKeyedSubscript:v26];

              v28 = [v27 placementStateForPlacement:v23];
              v29 = [v28 relations];
              [v29 addObject:v24];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v74 objects:v92 count:16];
          }
          while (v20);
        }

        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        v30 = [v5 allRequiredPlacements];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v70 objects:v91 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v71;
          do
          {
            for (uint64_t m = 0; m != v32; ++m)
            {
              if (*(void *)v71 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = *(void **)(*((void *)&v70 + 1) + 8 * m);
              v36 = *(void **)(a1 + 40);
              v37 = [v35 identifier];
              v38 = [v36 objectForKeyedSubscript:v37];

              id v39 = +[STUIStatusBarDisplayItemRelation requirementWithDisplayItemState:v38 placement:v35];
              v40 = [v63 relations];
              [v40 addObject:v39];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v70 objects:v91 count:16];
          }
          while (v32);
        }

        id v41 = [v5 anyRequiredPlacements];
        uint64_t v42 = [v41 count];

        if (v42)
        {
          id v43 = [MEMORY[0x1E4F1CA48] array];
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          v44 = [v5 anyRequiredPlacements];
          uint64_t v45 = [v44 countByEnumeratingWithState:&v66 objects:v90 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v67;
            do
            {
              for (uint64_t n = 0; n != v46; ++n)
              {
                if (*(void *)v67 != v47) {
                  objc_enumerationMutation(v44);
                }
                v49 = *(void **)(*((void *)&v66 + 1) + 8 * n);
                v50 = *(void **)(a1 + 40);
                v51 = [v49 identifier];
                v52 = [v50 objectForKeyedSubscript:v51];

                v53 = +[STUIStatusBarDisplayItemRelation requirementWithDisplayItemState:v52 placement:v49];
                [v43 addObject:v53];
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v66 objects:v90 count:16];
            }
            while (v46);
          }

          v54 = [v63 relations];
          v55 = +[STUIStatusBarDisplayItemRelation anyRelationWithRelations:v43];
          [v54 addObject:v55];

          id v3 = v59;
        }

        uint64_t v4 = v60 + 1;
      }
      while (v60 + 1 != v58);
      uint64_t v58 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
    }
    while (v58);
  }
}

- (BOOL)_resolveDependentItemStatesWithBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (unsigned int (**)(id, void))a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  char v5 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];
  int v6 = [v5 relations];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v12 = objc_msgSend(v11, "itemStates", 0);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              if (!v4[2](v4, *(void *)(*((void *)&v19 + 1) + 8 * j)))
              {

                BOOL v17 = 0;
                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      BOOL v17 = 1;
    }
    while (v8);
  }
  else
  {
    BOOL v17 = 1;
  }
LABEL_19:

  return v17;
}

- (BOOL)updatePlacement
{
  int64_t placementUpdateStatus = self->_placementUpdateStatus;
  if (placementUpdateStatus == 2) {
    return 1;
  }
  if (placementUpdateStatus == 1) {
    return 0;
  }
  self->_int64_t placementUpdateStatus = 1;
  return [(STUIStatusBarDisplayItemState *)self _updatePlacementWithRecursionBlock:&__block_literal_global_1];
}

uint64_t __64__STUIStatusBarDisplayItemState_updateWithData_styleAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 dataUpdateStatus];
  if (v4 != 2)
  {
    if (v4)
    {
      uint64_t v6 = 0;
      goto LABEL_6;
    }
    char v5 = [v3 updateWithData:*(void *)(a1 + 32) styleAttributes:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) addObjectsFromArray:v5];
  }
  uint64_t v6 = 1;
LABEL_6:

  return v6;
}

- (int64_t)dataUpdateStatus
{
  return self->_dataUpdateStatus;
}

+ (id)stateForDisplayItemWithIdentifier:(id)a3 statusBar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  uint64_t v9 = (void *)*((void *)v8 + 3);
  *((void *)v8 + 3) = v6;
  id v10 = v6;

  objc_storeWeak((id *)v8 + 4, v7);
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = (void *)*((void *)v8 + 6);
  *((void *)v8 + 6) = v11;

  uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v14 = (void *)*((void *)v8 + 17);
  *((void *)v8 + 17) = v13;

  uint64_t v15 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:v10];
  id v16 = [v7 itemWithIdentifier:v15];

  objc_storeWeak((id *)v8 + 5, v16);
  id WeakRetained = objc_loadWeakRetained((id *)v8 + 5);
  id v18 = [WeakRetained displayItemForIdentifier:v10];

  objc_storeWeak((id *)v8 + 2, v18);
  return v8;
}

- (NSMutableArray)placementStates
{
  return self->_placementStates;
}

uint64_t __48__STUIStatusBarDisplayItemState_updatePlacement__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updatePlacement];
}

- (id)_updateForUpdatedData:(id)a3 updatedStyleAttributes:(id)a4 updatedEnability:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = STUIStatusBarItemUpdate;
  id v11 = a4;
  uint64_t v12 = objc_alloc_init(STUIStatusBarItemUpdate);
  [(STUIStatusBarItemUpdate *)v12 setDataChanged:v8 != 0];
  if (v8)
  {
    [(STUIStatusBarItemUpdate *)v12 setData:v8];
  }
  else
  {
    id WeakRetained = (__objc2_class *)objc_loadWeakRetained((id *)&self->_statusBar);
    uint64_t v13 = [(__objc2_class *)WeakRetained currentAggregatedData];
    [(STUIStatusBarItemUpdate *)v12 setData:v13];
  }
  BOOL v19 = v11 != 0;
  uint64_t v14 = v11;
  if (!v11)
  {
    id WeakRetained = (__objc2_class *)objc_loadWeakRetained((id *)&self->_statusBar);
    uint64_t v14 = [(__objc2_class *)WeakRetained styleAttributes];
  }
  uint64_t v15 = [(STUIStatusBarItemUpdate *)v12 data];
  id v16 = [(STUIStatusBarDisplayItemState *)self _effectiveStyleAttributesFromStyleAttributes:v14 data:v15 styleAttributesChanged:&v19];

  [(STUIStatusBarItemUpdate *)v12 setStyleAttributes:v16];
  if (!v11)
  {
  }
  [(STUIStatusBarItemUpdate *)v12 setStyleAttributesChanged:v19];
  [(STUIStatusBarItemUpdate *)v12 setEnablementChanged:v9 != 0];
  if (v9) {
    uint64_t v17 = [v9 BOOLValue];
  }
  else {
    uint64_t v17 = 1;
  }
  [(STUIStatusBarItemUpdate *)v12 setEnabled:v17];

  return v12;
}

- (id)_effectiveStyleAttributesFromStyleAttributes:(id)a3 data:(id)a4 styleAttributesChanged:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];
  uint64_t v12 = [v11 region];

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  id v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  uint64_t v32 = __106__STUIStatusBarDisplayItemState__effectiveStyleAttributesFromStyleAttributes_data_styleAttributesChanged___block_invoke;
  uint64_t v33 = &unk_1E6AA3C18;
  id v34 = &v35;
  uint64_t v13 = [v12 effectiveStyle];
  if (v13 != 4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
    uint64_t v15 = [WeakRetained styleAttributesForStyle:v13];
    v32((uint64_t)v31, v15);
  }
  id v16 = [v12 overriddenStyleAttributes];
  v32((uint64_t)v31, v16);

  id v17 = objc_loadWeakRetained((id *)&self->_displayItem);
  id v18 = [v17 overriddenStyleAttributes];
  v32((uint64_t)v31, v18);

  id v19 = objc_loadWeakRetained((id *)&self->_item);
  long long v20 = [v19 overriddenStyleAttributesForData:v9 identifier:self->_identifier];
  v32((uint64_t)v31, v20);

  id v21 = objc_loadWeakRetained((id *)&self->_statusBar);
  long long v22 = [v21 visualProvider];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_statusBar);
    long long v25 = [v24 visualProvider];
    long long v26 = [(STUIStatusBarDisplayItemState *)self identifier];
    v27 = [v25 overriddenStyleAttributesForDisplayItemWithIdentifier:v26];
    v32((uint64_t)v31, v27);
  }
  p_overriddenStyleAttributes = &self->_overriddenStyleAttributes;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)p_overriddenStyleAttributes, (id)v36[5]);
    *a5 = 1;
  }
  uint64_t v29 = [v10 styleAttributesWithOverrides:v36[5]];

  _Block_object_dispose(&v35, 8);
  return v29;
}

uint64_t __106__STUIStatusBarDisplayItemState__effectiveStyleAttributesFromStyleAttributes_data_styleAttributesChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    char v5 = *(void **)(v4 + 40);
    if (v5)
    {
      uint64_t v6 = [v5 styleAttributesWithOverrides:v3];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    else
    {
      id v9 = v3;
      id v8 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v9;
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (STUIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (void)resetToPreferredPlacement
{
  self->_unint64_t currentPlacementStateIndex = self->_preferredPlacementStateIndex;
  self->_int64_t placementUpdateStatus = 0;
}

BOOL __55__STUIStatusBarDisplayItemState_addPlacement_inRegion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 priority];
  return v3 <= [*(id *)(a1 + 32) priority];
}

- (void)addPlacement:(id)a3 inRegion:(id)a4
{
  char v5 = +[STUIStatusBarDisplayItemPlacementState stateForDisplayItemPlacement:a3 region:a4];
  placementStates = self->_placementStates;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__STUIStatusBarDisplayItemState_addPlacement_inRegion___block_invoke;
  v10[3] = &unk_1E6AA3B80;
  id v11 = v5;
  id v7 = v5;
  uint64_t v8 = [(NSMutableArray *)placementStates indexOfObjectPassingTest:v10];
  id v9 = self->_placementStates;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)v9 addObject:v7];
  }
  else {
    -[NSMutableArray insertObject:atIndex:](v9, "insertObject:atIndex:", v7);
  }
}

- (id)_updateForItem:(id)a3 data:(id)a4 styleAttributes:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 needsUpdate];
  if (v9)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = objc_msgSend(v8, "dependentEntryKeys", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [v9 valueForKey:*(void *)(*((void *)&v23 + 1) + 8 * v16)];

        if (v17) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v14) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      id v18 = self;
      id v19 = v9;
      if (!v10) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
LABEL_10:
  }
  if (v10)
  {
    id v18 = self;
    id v19 = 0;
LABEL_14:
    id v20 = v10;
LABEL_18:
    id v21 = [(STUIStatusBarDisplayItemState *)v18 _updateForUpdatedData:v19 updatedStyleAttributes:v20 updatedEnability:0];
    goto LABEL_19;
  }
  if (v11)
  {
    id v18 = self;
    id v19 = 0;
LABEL_17:
    id v20 = 0;
    goto LABEL_18;
  }
  id v21 = 0;
LABEL_19:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_removingAnimation, 0);
  objc_storeStrong((id *)&self->_addingAnimation, 0);
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, 0);
  objc_storeStrong((id *)&self->_placementStates, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_destroyWeak((id *)&self->_statusBar);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_displayItem);
}

+ (void)setupRelationsBetweenDisplayItemStates:(id)a3 visualProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__STUIStatusBarDisplayItemState_setupRelationsBetweenDisplayItemStates_visualProvider___block_invoke;
  v9[3] = &unk_1E6AA3BA8;
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

- (NSArray)potentialPlacementRegionIdentifiers
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  placementStates = self->_placementStates;
  id v5 = STUIStatusBarGetPriorityComparator();
  id v6 = [(NSMutableArray *)placementStates sortedArrayUsingComparator:v5];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "region", (void)v18);
        int v14 = [v13 isEnabled];

        if (v14)
        {
          uint64_t v15 = [v12 region];
          uint64_t v16 = [v15 identifier];
          [v3 addObject:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return (NSArray *)v3;
}

- (BOOL)prepareAnimation:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  int v6 = [WeakRetained animationContextId];

  switch([(STUIStatusBarDisplayItemState *)self _animationType])
  {
    case 0:
      [v4 cancel];
      goto LABEL_3;
    case 1:
      BOOL v7 = 1;
      [v4 setType:1];
      id v13 = objc_loadWeakRetained((id *)&self->_item);
      id v14 = objc_loadWeakRetained((id *)&self->_displayItem);
      [v13 prepareAnimation:v4 forDisplayItem:v14];

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke;
      v25[3] = &unk_1E6AA36C8;
      v25[4] = self;
      [v4 addCompletionHandler:v25];
      [(STUIStatusBarDisplayItemState *)self setAddingAnimation:v4];
      break;
    case 2:
      [v4 setType:2];
      id v8 = objc_loadWeakRetained((id *)&self->_item);
      id v9 = objc_loadWeakRetained((id *)&self->_displayItem);
      [v8 prepareAnimation:v4 forDisplayItem:v9];

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke_2;
      v23[3] = &unk_1E6AA3C40;
      v23[4] = self;
      int v24 = v6;
      [v4 addCompletionHandler:v23];
      [(STUIStatusBarDisplayItemState *)self setRemovingAnimation:v4];
      goto LABEL_6;
    case 3:
      [v4 setType:3];
      id v10 = objc_loadWeakRetained((id *)&self->_item);
      id v11 = objc_loadWeakRetained((id *)&self->_displayItem);
      [v10 prepareAnimation:v4 forDisplayItem:v11];

      objc_initWeak(&location, v4);
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      long long v18 = __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke_3;
      long long v19 = &unk_1E6AA3C68;
      long long v20 = self;
      objc_copyWeak(&v21, &location);
      [v4 addCompletionHandler:&v16];
      uint64_t v12 = [(STUIStatusBarDisplayItemState *)self animations];
      [v12 addObject:v4];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
LABEL_6:
      BOOL v7 = 1;
      break;
    default:
LABEL_3:
      BOOL v7 = 0;
      break;
  }

  return v7;
}

- (STUIStatusBarDisplayItem)displayItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayItem);
  return (STUIStatusBarDisplayItem *)WeakRetained;
}

- (NSMutableSet)animations
{
  return self->_animations;
}

- (void)setAddingAnimation:(id)a3
{
}

void __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) animations];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 removeObject:WeakRetained];
}

uint64_t __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAddingAnimation:0];
}

- (void)updateToNextEnabledPlacement
{
}

- (void)prepareForOverflowDataUpdate
{
  self->_dataUpdateStatus = 0;
  self->_visibilityStatus = 3;
}

void __50__STUIStatusBarDisplayItemState_prepareAnimation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  int v5 = [WeakRetained animationContextId];

  if (a2 != 1 || !v5)
  {
    [*(id *)(a1 + 32) setRemovingAnimation:0];
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v8 setFloating:0];

    goto LABEL_6;
  }
  int v6 = *(_DWORD *)(a1 + 40);
  [*(id *)(a1 + 32) setRemovingAnimation:0];
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v7 setFloating:0];

  if (v5 != v6)
  {
LABEL_6:
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v9 setContainerView:0];

    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v10 setAlpha:1.0];

    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v13[0] = *MEMORY[0x1E4F1DAB8];
    v13[1] = v12;
    v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v11 setTransform:v13];
  }
}

- (int64_t)priority
{
  if (![(STUIStatusBarDisplayItemState *)self isEnabled]) {
    return 0;
  }
  id v3 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];
  int64_t v4 = [v3 priority];

  return v4;
}

- (NSString)description
{
  return (NSString *)[(STUIStatusBarDisplayItemState *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STUIStatusBarDisplayItemState *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STUIStatusBarDisplayItemState *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  int64_t v4 = [(STUIStatusBarDisplayItemState *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"identifier"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarDisplayItemState isEnabled](self, "isEnabled"), @"enabled");
  unint64_t v7 = [(STUIStatusBarDisplayItemState *)self enabilityStatus];
  if (v7 > 3) {
    id v8 = @"(unknown)";
  }
  else {
    id v8 = off_1E6AA3C88[v7];
  }
  [v3 appendString:v8 withName:@"enabilityStatus"];
  unint64_t v9 = [(STUIStatusBarDisplayItemState *)self visibilityStatus];
  if (v9 > 3) {
    id v10 = @"(unknown)";
  }
  else {
    id v10 = off_1E6AA3CA8[v9];
  }
  [v3 appendString:v10 withName:@"visibilityStatus"];
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarDisplayItemState isDataEnabled](self, "isDataEnabled"), @"dataEnabled");
  id v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarDisplayItemState isFloating](self, "isFloating"), @"floating");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STUIStatusBarDisplayItemState *)self descriptionBuilderWithMultilinePrefix:a3];
  int64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STUIStatusBarDisplayItemState *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  int64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarDisplayItemState *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(STUIStatusBarDisplayItemState *)self succinctDescriptionBuilder];
  [v6 setUseDebugDescription:v4];
  unint64_t v7 = [(STUIStatusBarDisplayItemState *)self currentPlacementState];
  id v8 = (id)[v6 appendObject:v7 withName:@"currentPlacementState" skipIfNil:1];

  return v6;
}

- (void)setDisplayItem:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (STUIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (STUIStatusBar *)WeakRetained;
}

- (void)setStatusBar:(id)a3
{
}

- (STUIStatusBarItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (STUIStatusBarItem *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (void)setPlacementStates:(id)a3
{
}

- (int64_t)preferredPlacementStateIndex
{
  return self->_preferredPlacementStateIndex;
}

- (void)setPreferredPlacementStateIndex:(int64_t)a3
{
  self->_preferredPlacementStateIndex = a3;
}

- (void)setCurrentPlacementStateIndex:(int64_t)a3
{
  self->_unint64_t currentPlacementStateIndex = a3;
}

- (STUIStatusBarStyleAttributes)overriddenStyleAttributes
{
  return self->_overriddenStyleAttributes;
}

- (void)setOverriddenStyleAttributes:(id)a3
{
}

- (BOOL)wasEnabled
{
  return self->_wasEnabled;
}

- (BOOL)wasVisible
{
  return self->_wasVisible;
}

- (int64_t)previousPlacementStateIndex
{
  return self->_previousPlacementStateIndex;
}

- (void)setDataUpdateStatus:(int64_t)a3
{
  self->_dataUpdateStatus = a3;
}

- (int64_t)placementUpdateStatus
{
  return self->_placementUpdateStatus;
}

- (void)setPlacementUpdateStatus:(int64_t)a3
{
  self->_int64_t placementUpdateStatus = a3;
}

- (BOOL)isDataEnabled
{
  return self->_dataEnabled;
}

- (STUIStatusBarAnimation)addingAnimation
{
  return self->_addingAnimation;
}

- (void)setRemovingAnimation:(id)a3
{
}

@end