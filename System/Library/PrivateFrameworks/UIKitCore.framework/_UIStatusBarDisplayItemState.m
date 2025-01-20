@interface _UIStatusBarDisplayItemState
+ (id)stateForDisplayItemWithIdentifier:(id)a3 statusBar:(id)a4;
+ (void)setupRelationsBetweenDisplayItemStates:(id)a3 visualProvider:(id)a4;
- (BOOL)_resolveDependentItemStatesWithBlock:(id)a3;
- (BOOL)_updatePlacementWithRecursionBlock:(id)a3;
- (BOOL)_updateToNextPlacementStateIfNeeded;
- (BOOL)dataEnabled;
- (BOOL)floating;
- (BOOL)hasRunningAnimations;
- (BOOL)isCurrentPlacement:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEnabledIgnoringAnimations;
- (BOOL)prepareAnimation:(id)a3;
- (BOOL)updatePlacement;
- (BOOL)wasEnabled;
- (BOOL)wasVisible;
- (NSArray)potentialPlacementRegionIdentifiers;
- (NSMutableArray)placementStates;
- (NSMutableSet)animations;
- (_UIStatusBar)statusBar;
- (_UIStatusBarAnimation)addingAnimation;
- (_UIStatusBarAnimation)removingAnimation;
- (_UIStatusBarDisplayItem)displayItem;
- (_UIStatusBarDisplayItemPlacementState)currentPlacementState;
- (_UIStatusBarIdentifier)identifier;
- (_UIStatusBarItem)item;
- (_UIStatusBarStyleAttributes)overriddenStyleAttributes;
- (id)_animationWithUpdateAnimation:(id)a3;
- (id)_effectiveStyleAttributesFromStyleAttributes:(id)a3 data:(id)a4 styleAttributesChanged:(BOOL *)a5;
- (id)_updateForItem:(id)a3 data:(id)a4 styleAttributes:(id)a5;
- (id)_updateForUpdatedData:(id)a3 updatedStyleAttributes:(id)a4 updatedEnability:(id)a5;
- (id)description;
- (id)placementStateForPlacement:(id)a3;
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

@implementation _UIStatusBarDisplayItemState

+ (id)stateForDisplayItemWithIdentifier:(id)a3 statusBar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  v9 = (void *)*((void *)v8 + 3);
  *((void *)v8 + 3) = v6;
  id v10 = v6;

  objc_storeWeak((id *)v8 + 4, v7);
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = (void *)*((void *)v8 + 6);
  *((void *)v8 + 6) = v11;

  uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
  v14 = (void *)*((void *)v8 + 17);
  *((void *)v8 + 17) = v13;

  v15 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:v10];
  v16 = [v7 itemWithIdentifier:v15];

  objc_storeWeak((id *)v8 + 5, v16);
  id WeakRetained = objc_loadWeakRetained((id *)v8 + 5);
  v18 = [WeakRetained displayItemForIdentifier:v10];

  objc_storeWeak((id *)v8 + 2, v18);
  return v8;
}

- (BOOL)isEnabled
{
  if (self->_dataUpdateStatus != 2)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"_UIStatusBarDisplayItemState.m", 199, @"%@ should have been updated before checking if it's enabled (instead of %ld)", self, self->_dataUpdateStatus object file lineNumber description];
  }
  if ([(_UIStatusBarDisplayItemState *)self hasRunningAnimations] || self->_floating) {
    return 1;
  }
  return [(_UIStatusBarDisplayItemState *)self isEnabledIgnoringAnimations];
}

- (BOOL)isEnabledIgnoringAnimations
{
  if (!self->_dataEnabled) {
    return 0;
  }
  v3 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];

  if (!v3) {
    return 0;
  }
  v4 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];
  char v5 = [v4 isEnabled];

  return v5;
}

- (BOOL)hasRunningAnimations
{
  return self->_addingAnimation || self->_removingAnimation || [(NSMutableSet *)self->_animations count] != 0;
}

- (_UIStatusBarDisplayItemPlacementState)currentPlacementState
{
  unint64_t currentPlacementStateIndex = self->_currentPlacementStateIndex;
  if (currentPlacementStateIndex >= [(NSMutableArray *)self->_placementStates count])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSMutableArray *)self->_placementStates objectAtIndexedSubscript:self->_currentPlacementStateIndex];
  }
  return (_UIStatusBarDisplayItemPlacementState *)v4;
}

- (void)updateToNextEnabledPlacement
{
}

- (BOOL)_updateToNextPlacementStateIfNeeded
{
  uint64_t v3 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];
  if (v3)
  {
    v4 = (void *)v3;
    char v5 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];
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

- (void)addPlacement:(id)a3 inRegion:(id)a4
{
  char v6 = +[_UIStatusBarDisplayItemPlacementState stateForDisplayItemPlacement:a3 region:a4];
  placementStates = self->_placementStates;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __54___UIStatusBarDisplayItemState_addPlacement_inRegion___block_invoke;
  v18 = &unk_1E5307868;
  id v8 = v6;
  id v19 = v8;
  uint64_t v9 = [(NSMutableArray *)placementStates indexOfObjectPassingTest:&v15];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_placementStates addObject:v8];
  }
  else
  {
    uint64_t v10 = v9;
    uint64_t v11 = [v8 priority];
    v12 = [(NSMutableArray *)self->_placementStates objectAtIndexedSubscript:v10];
    uint64_t v13 = [v12 priority];

    if (v11 == v13)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"_UIStatusBarDisplayItemState.m", 257, @"2 placements have the same priority for display item identifier %@", self->_identifier, v15, v16, v17, v18 object file lineNumber description];
    }
    [(NSMutableArray *)self->_placementStates insertObject:v8 atIndex:v10];
  }
}

- (id)placementStateForPlacement:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = self->_placementStates;
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
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "placement", (void)v13);
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

+ (void)setupRelationsBetweenDisplayItemStates:(id)a3 visualProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86___UIStatusBarDisplayItemState_setupRelationsBetweenDisplayItemStates_visualProvider___block_invoke;
  v11[3] = &unk_1E5307890;
  SEL v14 = a2;
  id v15 = a1;
  id v12 = v8;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
}

- (void)prepareForOverflowDataUpdate
{
  self->_dataUpdateStatus = 0;
  self->_visibilityStatus = 3;
}

- (void)prepareForDataUpdate
{
  self->_dataUpdateStatus = 0;
  self->_unint64_t currentPlacementStateIndex = 0;
  self->_enabilityStatus = 0;
  self->_visibilityStatus = 0;
}

- (void)_updateStatuses
{
  BOOL v3 = [(_UIStatusBarDisplayItemState *)self isEnabledIgnoringAnimations];
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
  [(_UIStatusBarDisplayItemState *)self setEnabilityStatus:v5];
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
  [(_UIStatusBarDisplayItemState *)self setVisibilityStatus:v9];
}

- (BOOL)_resolveDependentItemStatesWithBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (unsigned int (**)(id, void))a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];
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
        int v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        BOOL v12 = objc_msgSend(v11, "itemStates", 0);
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

- (BOOL)_updatePlacementWithRecursionBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayItem);
  -[_UIStatusBarDisplayItemState setFloating:](self, "setFloating:", [WeakRetained floating]);

  if ([(_UIStatusBarDisplayItemState *)self floating])
  {
    self->_unint64_t currentPlacementStateIndex = -1;
LABEL_5:
    [(_UIStatusBarDisplayItemState *)self _updateStatuses];
    BOOL v7 = 1;
    goto LABEL_6;
  }
  int v6 = [(_UIStatusBarDisplayItemState *)self removingAnimation];

  if (v6)
  {
    self->_unint64_t currentPlacementStateIndex = self->_previousPlacementStateIndex;
    [(_UIStatusBarDisplayItemState *)self _resolveDependentItemStatesWithBlock:v4];
    goto LABEL_5;
  }
  uint64_t v9 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];

  if (!v9) {
    goto LABEL_5;
  }
  while (1)
  {
    int v10 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];
    int v11 = [v10 canBeEnabled];

    if (v11)
    {
      if (![(_UIStatusBarDisplayItemState *)self _resolveDependentItemStatesWithBlock:v4])break; {
    }
      }
    if (![(_UIStatusBarDisplayItemState *)self _updateToNextPlacementStateIfNeeded])goto LABEL_5; {
  }
    }
  BOOL v7 = 0;
LABEL_6:

  return v7;
}

- (void)resetToPreferredPlacement
{
  self->_unint64_t currentPlacementStateIndex = self->_preferredPlacementStateIndex;
  self->_placementUpdateStatus = 0;
}

- (BOOL)updatePlacement
{
  if (self->_dataUpdateStatus != 2)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIStatusBarDisplayItemState.m" lineNumber:425 description:@"The item state should have been data updated before updating its placement"];
  }
  int64_t placementUpdateStatus = self->_placementUpdateStatus;
  if (placementUpdateStatus == 2) {
    return 1;
  }
  if (placementUpdateStatus == 1) {
    return 0;
  }
  self->_int64_t placementUpdateStatus = 1;
  return [(_UIStatusBarDisplayItemState *)self _updatePlacementWithRecursionBlock:&__block_literal_global_500];
}

- (id)updateWithData:(id)a3 styleAttributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int64_t dataUpdateStatus = self->_dataUpdateStatus;
  if ((dataUpdateStatus & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"_UIStatusBarDisplayItemState.m" lineNumber:446 description:@"The update status must be needsUpdate or updated"];

    int64_t dataUpdateStatus = self->_dataUpdateStatus;
  }
  if (dataUpdateStatus == 2)
  {
    id v10 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_25;
  }
  self->_int64_t dataUpdateStatus = 1;
  int v11 = [MEMORY[0x1E4F1CA48] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayItem);
  int v13 = [WeakRetained clearPreviousTokenDisablementIfNecessary];

  if (v13)
  {
    [(_UIStatusBarDisplayItemState *)self setWasEnabled:0];
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)&self->_displayItem);
    -[_UIStatusBarDisplayItemState setWasEnabled:](self, "setWasEnabled:", [v14 isEnabled]);
  }
  id v15 = objc_loadWeakRetained((id *)&self->_displayItem);
  -[_UIStatusBarDisplayItemState setWasVisible:](self, "setWasVisible:", [v15 visible]);

  [(_UIStatusBarDisplayItemState *)self setPreviousPlacementStateIndex:[(_UIStatusBarDisplayItemState *)self currentPlacementStateIndex]];
  id v16 = objc_loadWeakRetained((id *)&self->_displayItem);
  -[_UIStatusBarDisplayItemState setFloating:](self, "setFloating:", [v16 floating]);

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __63___UIStatusBarDisplayItemState_updateWithData_styleAttributes___block_invoke;
  v43[3] = &unk_1E53078D8;
  id v17 = v7;
  id v44 = v17;
  id v18 = v8;
  id v45 = v18;
  id v19 = v11;
  id v46 = v19;
  if ([(_UIStatusBarDisplayItemState *)self _updatePlacementWithRecursionBlock:v43])
  {
    id v42 = v8;
    location = (id *)&self->_item;
    id v20 = objc_loadWeakRetained((id *)&self->_item);
    id v21 = objc_loadWeakRetained((id *)&self->_displayItem);
    id v22 = objc_loadWeakRetained((id *)&self->_statusBar);
    long long v23 = [v22 currentAggregatedData];
    -[_UIStatusBarDisplayItemState setDataEnabled:](self, "setDataEnabled:", [v20 canEnableDisplayItem:v21 fromData:v23]);

    [(_UIStatusBarDisplayItemState *)self _updateStatuses];
    int64_t v24 = [(_UIStatusBarDisplayItemState *)self enabilityStatus];
    switch(v24)
    {
      case 1:
        id v25 = objc_loadWeakRetained(location);
        uint64_t v29 = [(_UIStatusBarDisplayItemState *)self _updateForItem:v25 data:v17 styleAttributes:v18];
        break;
      case 3:
        uint64_t v29 = -[_UIStatusBarDisplayItemState _updateForUpdatedData:updatedStyleAttributes:updatedEnability:](self, "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", 0, 0, MEMORY[0x1E4F1CC28], location);
LABEL_17:
        if (v29)
        {
          v30 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];
          v31 = [v30 placement];
          v32 = [v31 itemInfo];
          [v29 setPlacementInfo:v32];

          id v33 = objc_loadWeakRetained(location);
          id v34 = objc_loadWeakRetained((id *)&self->_displayItem);
          v35 = [v33 _applyUpdate:v29 toDisplayItem:v34];

          id v36 = objc_loadWeakRetained((id *)&self->_displayItem);
          -[_UIStatusBarDisplayItemState setDataEnabled:](self, "setDataEnabled:", [v36 isEnabled]);
        }
        else
        {
          v35 = 0;
        }
        goto LABEL_21;
      case 2:
        id v25 = objc_loadWeakRetained((id *)&self->_statusBar);
        long long v26 = objc_msgSend(v25, "currentAggregatedData", location);
        id v27 = objc_loadWeakRetained((id *)&self->_statusBar);
        v28 = [v27 styleAttributes];
        uint64_t v29 = [(_UIStatusBarDisplayItemState *)self _updateForUpdatedData:v26 updatedStyleAttributes:v28 updatedEnability:MEMORY[0x1E4F1CC38]];

        break;
      default:
        uint64_t v29 = 0;
        v35 = 0;
LABEL_21:
        id v8 = v42;
        [(_UIStatusBarDisplayItemState *)self _updateStatuses];
        [(_UIStatusBarDisplayItemState *)self _cancelObsoleteAnimations];
        v37 = [(_UIStatusBarDisplayItemState *)self _animationWithUpdateAnimation:v35];

        if (v37)
        {
          v38 = [(_UIStatusBarDisplayItemState *)self identifier];
          [v37 setDisplayItemIdentifier:v38];

          [v19 addObject:v37];
        }
        *(_OWORD *)&self->_int64_t dataUpdateStatus = xmmword_186B88DC0;
        self->_preferredPlacementStateIndex = self->_currentPlacementStateIndex;
        id v10 = v19;

        goto LABEL_24;
    }

    goto LABEL_17;
  }
  self->_int64_t dataUpdateStatus = 0;
  id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_24:

LABEL_25:
  return v10;
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
    BOOL v12 = objc_msgSend(v8, "dependentEntryKeys", 0);
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
    id v21 = [(_UIStatusBarDisplayItemState *)v18 _updateForUpdatedData:v19 updatedStyleAttributes:v20 updatedEnability:0];
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

- (id)_updateForUpdatedData:(id)a3 updatedStyleAttributes:(id)a4 updatedEnability:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = _UIStatusBarItemUpdate;
  id v11 = a4;
  BOOL v12 = objc_alloc_init(_UIStatusBarItemUpdate);
  [(_UIStatusBarItemUpdate *)v12 setDataChanged:v8 != 0];
  if (v8)
  {
    [(_UIStatusBarItemUpdate *)v12 setData:v8];
  }
  else
  {
    id WeakRetained = (__objc2_class *)objc_loadWeakRetained((id *)&self->_statusBar);
    uint64_t v13 = [(__objc2_class *)WeakRetained currentAggregatedData];
    [(_UIStatusBarItemUpdate *)v12 setData:v13];
  }
  BOOL v19 = v11 != 0;
  uint64_t v14 = v11;
  if (!v11)
  {
    id WeakRetained = (__objc2_class *)objc_loadWeakRetained((id *)&self->_statusBar);
    uint64_t v14 = [(__objc2_class *)WeakRetained styleAttributes];
  }
  uint64_t v15 = [(_UIStatusBarItemUpdate *)v12 data];
  uint64_t v16 = [(_UIStatusBarDisplayItemState *)self _effectiveStyleAttributesFromStyleAttributes:v14 data:v15 styleAttributesChanged:&v19];

  [(_UIStatusBarItemUpdate *)v12 setStyleAttributes:v16];
  if (!v11)
  {
  }
  [(_UIStatusBarItemUpdate *)v12 setStyleAttributesChanged:v19];
  [(_UIStatusBarItemUpdate *)v12 setEnabilityChanged:v9 != 0];
  if (v9) {
    uint64_t v17 = [v9 BOOLValue];
  }
  else {
    uint64_t v17 = 1;
  }
  [(_UIStatusBarItemUpdate *)v12 setEnabled:v17];

  return v12;
}

- (id)_effectiveStyleAttributesFromStyleAttributes:(id)a3 data:(id)a4 styleAttributesChanged:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];
  BOOL v12 = [v11 region];

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__185;
  id v44 = __Block_byref_object_dispose__185;
  id v45 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v37 = __105___UIStatusBarDisplayItemState__effectiveStyleAttributesFromStyleAttributes_data_styleAttributesChanged___block_invoke;
  v38 = &unk_1E5307900;
  v39 = &v40;
  uint64_t v13 = [v12 effectiveStyle];
  if (v13 != 4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
    uint64_t v15 = [WeakRetained styleAttributesForStyle:v13];
    v37((uint64_t)v36, v15);
  }
  uint64_t v16 = [v12 overriddenStyleAttributes];
  v37((uint64_t)v36, v16);

  id v17 = objc_loadWeakRetained((id *)&self->_displayItem);
  id v18 = [v17 overriddenStyleAttributes];
  v37((uint64_t)v36, v18);

  id v19 = objc_loadWeakRetained((id *)&self->_item);
  id v20 = [v19 overriddenStyleAttributesForData:v9 identifier:self->_identifier];
  v37((uint64_t)v36, v20);

  id v21 = objc_loadWeakRetained((id *)&self->_statusBar);
  id v22 = [v21 visualProvider];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_statusBar);
    long long v25 = [v24 visualProvider];
    long long v26 = [(_UIStatusBarDisplayItemState *)self identifier];
    id v27 = [v25 overriddenStyleAttributesForDisplayItemWithIdentifier:v26];
    v37((uint64_t)v36, v27);
  }
  overriddenStyleAttributes = self->_overriddenStyleAttributes;
  p_overriddenStyleAttributes = &self->_overriddenStyleAttributes;
  v30 = (_UIStatusBarStyleAttributes *)(id)v41[5];
  v31 = overriddenStyleAttributes;
  if (v30 == v31)
  {

    goto LABEL_13;
  }
  v32 = v31;
  if (!v30 || !v31)
  {

    goto LABEL_12;
  }
  BOOL v33 = [(_UIStatusBarStyleAttributes *)v30 isEqual:v31];

  if (!v33)
  {
LABEL_12:
    objc_storeStrong((id *)p_overriddenStyleAttributes, (id)v41[5]);
    *a5 = 1;
  }
LABEL_13:
  id v34 = [v10 styleAttributesWithOverrides:v41[5]];

  _Block_object_dispose(&v40, 8);
  return v34;
}

- (int64_t)_animationType
{
  int64_t result = [(_UIStatusBarDisplayItemState *)self visibilityStatus];
  if (result)
  {
    if (result == 3)
    {
      return 2;
    }
    else if (result == 2)
    {
      if ([(_UIStatusBarDisplayItemState *)self enabilityStatus] == 2) {
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

- (void)_cancelObsoleteAnimations
{
  int64_t v3 = [(_UIStatusBarDisplayItemState *)self _animationType];
  if (v3 == 2)
  {
    int v6 = [(_UIStatusBarDisplayItemState *)self addingAnimation];

    if (v6)
    {
      id v7 = [(_UIStatusBarDisplayItemState *)self addingAnimation];
      [v7 cancel];

      [(_UIStatusBarDisplayItemState *)self setAddingAnimation:0];
    }
    id v8 = [(_UIStatusBarDisplayItemState *)self animations];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v10 = [(_UIStatusBarDisplayItemState *)self animations];
      id v12 = (id)[v10 copy];

      [v12 makeObjectsPerformSelector:sel_cancel];
      id v11 = [(_UIStatusBarDisplayItemState *)self animations];
      [v11 removeAllObjects];
    }
  }
  else if (v3 == 1)
  {
    id v4 = [(_UIStatusBarDisplayItemState *)self removingAnimation];

    if (v4)
    {
      uint64_t v5 = [(_UIStatusBarDisplayItemState *)self removingAnimation];
      [v5 cancel];

      [(_UIStatusBarDisplayItemState *)self setRemovingAnimation:0];
    }
  }
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
  int64_t v8 = [(_UIStatusBarDisplayItemState *)self _animationType];
  if (v8 != 2)
  {
    if (v8 == 1)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_item);
      id v7 = [v9 additionAnimationForDisplayItemWithIdentifier:self->_identifier];

      id v10 = objc_loadWeakRetained((id *)&self->_statusBar);
      id v11 = [v10 visualProvider];
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        goto LABEL_8;
      }
      id v13 = objc_loadWeakRetained((id *)&self->_statusBar);
      uint64_t v14 = [v13 visualProvider];
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
  uint64_t v14 = [v13 visualProvider];
  uint64_t v15 = [v14 removalAnimationForDisplayItemWithIdentifier:self->_identifier itemAnimation:v7];
LABEL_13:
  id v21 = (void *)v15;

  id v7 = v21;
LABEL_8:

  return v7;
}

- (BOOL)prepareAnimation:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  int v6 = [WeakRetained animationContextId];

  switch([(_UIStatusBarDisplayItemState *)self _animationType])
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
      v25[2] = __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke;
      v25[3] = &unk_1E52DC698;
      v25[4] = self;
      [v4 addCompletionHandler:v25];
      [(_UIStatusBarDisplayItemState *)self setAddingAnimation:v4];
      break;
    case 2:
      [v4 setType:2];
      id v8 = objc_loadWeakRetained((id *)&self->_item);
      id v9 = objc_loadWeakRetained((id *)&self->_displayItem);
      [v8 prepareAnimation:v4 forDisplayItem:v9];

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke_2;
      v23[3] = &unk_1E5307928;
      v23[4] = self;
      int v24 = v6;
      [v4 addCompletionHandler:v23];
      [(_UIStatusBarDisplayItemState *)self setRemovingAnimation:v4];
      goto LABEL_6;
    case 3:
      [v4 setType:3];
      id v10 = objc_loadWeakRetained((id *)&self->_item);
      id v11 = objc_loadWeakRetained((id *)&self->_displayItem);
      [v10 prepareAnimation:v4 forDisplayItem:v11];

      objc_initWeak(&location, v4);
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke_3;
      id v19 = &unk_1E52EAC80;
      char v20 = self;
      objc_copyWeak(&v21, &location);
      [v4 addCompletionHandler:&v16];
      char v12 = [(_UIStatusBarDisplayItemState *)self animations];
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

- (BOOL)isCurrentPlacement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];
  int v6 = [v5 placement];
  uint64_t v7 = [v6 priority];
  uint64_t v8 = [v4 priority];

  BOOL v9 = v7 == v8 && [(_UIStatusBarDisplayItemState *)self isEnabled];
  return v9;
}

- (NSArray)potentialPlacementRegionIdentifiers
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA48] array];
  placementStates = self->_placementStates;
  uint64_t v5 = _UIStatusBarGetPriorityComparator();
  int v6 = [(NSMutableArray *)placementStates sortedArrayUsingComparator:v5];

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
        char v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "region", (void)v18);
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

- (int64_t)priority
{
  if (![(_UIStatusBarDisplayItemState *)self isEnabled]) {
    return 0;
  }
  int64_t v3 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];
  int64_t v4 = [v3 priority];

  return v4;
}

- (id)description
{
  v16[7] = *MEMORY[0x1E4F143B8];
  v15[0] = @"identifier";
  int64_t v3 = [(_UIStatusBarDisplayItemState *)self identifier];
  v16[0] = v3;
  v15[1] = @"enabled";
  int64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_UIStatusBarDisplayItemState isEnabled](self, "isEnabled"));
  v16[1] = v4;
  v15[2] = @"enabilityStatus";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UIStatusBarDisplayItemState enabilityStatus](self, "enabilityStatus"));
  v16[2] = v5;
  v15[3] = @"visibilityStatus";
  int v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UIStatusBarDisplayItemState visibilityStatus](self, "visibilityStatus"));
  v16[3] = v6;
  v15[4] = @"currentPlacementState";
  uint64_t v7 = [(_UIStatusBarDisplayItemState *)self currentPlacementState];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = @"none";
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  v16[4] = v9;
  v15[5] = @"dataEnabled";
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_UIStatusBarDisplayItemState dataEnabled](self, "dataEnabled"));
  v16[5] = v10;
  v15[6] = @"floating";
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_UIStatusBarDisplayItemState floating](self, "floating"));
  v16[6] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:7];
  id v13 = +[UIDescriptionBuilder descriptionForObject:self namesAndObjects:v12];

  return v13;
}

- (_UIStatusBarDisplayItem)displayItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayItem);
  return (_UIStatusBarDisplayItem *)WeakRetained;
}

- (void)setDisplayItem:(id)a3
{
}

- (_UIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (_UIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (_UIStatusBar *)WeakRetained;
}

- (void)setStatusBar:(id)a3
{
}

- (_UIStatusBarItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (_UIStatusBarItem *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (NSMutableArray)placementStates
{
  return self->_placementStates;
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

- (int64_t)currentPlacementStateIndex
{
  return self->_currentPlacementStateIndex;
}

- (void)setCurrentPlacementStateIndex:(int64_t)a3
{
  self->_unint64_t currentPlacementStateIndex = a3;
}

- (_UIStatusBarStyleAttributes)overriddenStyleAttributes
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

- (void)setWasEnabled:(BOOL)a3
{
  self->_wasEnabled = a3;
}

- (BOOL)wasVisible
{
  return self->_wasVisible;
}

- (void)setWasVisible:(BOOL)a3
{
  self->_wasVisible = a3;
}

- (int64_t)previousPlacementStateIndex
{
  return self->_previousPlacementStateIndex;
}

- (void)setPreviousPlacementStateIndex:(int64_t)a3
{
  self->_previousPlacementStateIndex = a3;
}

- (int64_t)dataUpdateStatus
{
  return self->_dataUpdateStatus;
}

- (void)setDataUpdateStatus:(int64_t)a3
{
  self->_int64_t dataUpdateStatus = a3;
}

- (int64_t)placementUpdateStatus
{
  return self->_placementUpdateStatus;
}

- (void)setPlacementUpdateStatus:(int64_t)a3
{
  self->_int64_t placementUpdateStatus = a3;
}

- (BOOL)dataEnabled
{
  return self->_dataEnabled;
}

- (void)setDataEnabled:(BOOL)a3
{
  self->_dataEnabled = a3;
}

- (BOOL)floating
{
  return self->_floating;
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (int64_t)enabilityStatus
{
  return self->_enabilityStatus;
}

- (void)setEnabilityStatus:(int64_t)a3
{
  self->_enabilityStatus = a3;
}

- (int64_t)visibilityStatus
{
  return self->_visibilityStatus;
}

- (void)setVisibilityStatus:(int64_t)a3
{
  self->_visibilityStatus = a3;
}

- (_UIStatusBarAnimation)addingAnimation
{
  return self->_addingAnimation;
}

- (void)setAddingAnimation:(id)a3
{
}

- (_UIStatusBarAnimation)removingAnimation
{
  return self->_removingAnimation;
}

- (void)setRemovingAnimation:(id)a3
{
}

- (NSMutableSet)animations
{
  return self->_animations;
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

@end