@interface WFVariableAvailability
+ (BOOL)actionIsEligibleForOutputVariable:(id)a3;
- (BOOL)areActionOutputVariablesAvailableAtIndex:(unint64_t)a3;
- (BOOL)areVariablesAvailableAtIndex:(unint64_t)a3;
- (BOOL)isShortcutInputVariableUsed;
- (BOOL)isVariableAvailableAtIndex:(unint64_t)a3 withActionTest:(id)a4;
- (BOOL)isVariableWithName:(id)a3 availableAtIndex:(unint64_t)a4;
- (BOOL)isVariableWithOutputUUIDAvailable:(id)a3 atIndex:(unint64_t)a4;
- (NSCache)cachedContentClassesForVariableNameAtIndex;
- (NSHashTable)actionsUsingShortcutInputVariable;
- (NSHashTable)variableObservers;
- (NSMapTable)actionOutputVariableActionsByUUID;
- (NSMapTable)providingActionsByVariableName;
- (NSMapTable)variableScopeEndActionsByStartAction;
- (NSMapTable)variableScopeLevelsByGroupingIdentifier;
- (OS_dispatch_queue)queue;
- (WFVariableAvailability)initWithWorkflow:(id)a3;
- (WFWorkflow)workflow;
- (id)_possibleContentClassesForVariableNamed:(id)a3 atIndex:(unint64_t)a4 context:(id)a5 excludingAction:(id)a6;
- (id)actionProvidingVariableWithOutputUUID:(id)a3;
- (id)actionsProvidingVariableName:(id)a3 atIndex:(unint64_t)a4;
- (id)availableOutputActionsAtIndex:(unint64_t)a3;
- (id)availableVariableNamesAtIndex:(unint64_t)a3;
- (id)availableVariableNamesExcludingThoseProvidedByAction:(id)a3;
- (id)possibleContentClassesForVariableNamed:(id)a3 atIndex:(unint64_t)a4 context:(id)a5 excludingAction:(id)a6;
- (unint64_t)variableScopeLevelForGroupingIdentifier:(id)a3;
- (void)actionDidChange:(id)a3 moved:(BOOL)a4 removed:(BOOL)a5;
- (void)addVariableObserver:(id)a3;
- (void)enumerateActionsInScopeAtIndex:(unint64_t)a3 usingBlock:(id)a4;
- (void)invalidateActionOutputProviderCache;
- (void)invalidateActionsUsingShortcutInputVariableCache;
- (void)invalidateCache;
- (void)invalidateContentClassCache;
- (void)notifyContentClassesChanged;
- (void)notifyVariablesChanged;
- (void)populateActionOutputVariableActionsByUUID;
- (void)populateActionsUsingShortcutInputVariableCache;
- (void)populateCache;
- (void)removeVariableObserver:(id)a3;
- (void)renameVariable:(id)a3 to:(id)a4 fromAction:(id)a5;
- (void)setActionOutputVariableActionsByUUID:(id)a3;
- (void)setActionsUsingShortcutInputVariable:(id)a3;
- (void)setCachedContentClassesForVariableNameAtIndex:(id)a3;
- (void)setProvidingActionsByVariableName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVariableObservers:(id)a3;
- (void)setVariableScopeEndActionsByStartAction:(id)a3;
- (void)setVariableScopeLevelsByGroupingIdentifier:(id)a3;
- (void)updateShortcutInputVariableUsageForChangeInAction:(id)a3 removed:(BOOL)a4;
@end

@implementation WFVariableAvailability

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_variableObservers, 0);
  objc_storeStrong((id *)&self->_cachedContentClassesForVariableNameAtIndex, 0);
  objc_storeStrong((id *)&self->_actionsUsingShortcutInputVariable, 0);
  objc_storeStrong((id *)&self->_actionOutputVariableActionsByUUID, 0);
  objc_storeStrong((id *)&self->_variableScopeEndActionsByStartAction, 0);
  objc_storeStrong((id *)&self->_variableScopeLevelsByGroupingIdentifier, 0);
  objc_storeStrong((id *)&self->_providingActionsByVariableName, 0);
  objc_destroyWeak((id *)&self->_workflow);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setVariableObservers:(id)a3
{
}

- (void)setCachedContentClassesForVariableNameAtIndex:(id)a3
{
}

- (NSCache)cachedContentClassesForVariableNameAtIndex
{
  return self->_cachedContentClassesForVariableNameAtIndex;
}

- (void)setActionsUsingShortcutInputVariable:(id)a3
{
}

- (void)setActionOutputVariableActionsByUUID:(id)a3
{
}

- (void)setVariableScopeEndActionsByStartAction:(id)a3
{
}

- (void)setVariableScopeLevelsByGroupingIdentifier:(id)a3
{
}

- (void)setProvidingActionsByVariableName:(id)a3
{
}

- (WFWorkflow)workflow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  return (WFWorkflow *)WeakRetained;
}

- (void)invalidateContentClassCache
{
  [(NSCache *)self->_cachedContentClassesForVariableNameAtIndex removeAllObjects];
  [(WFVariableAvailability *)self notifyContentClassesChanged];
}

- (void)renameVariable:(id)a3 to:(id)a4 fromAction:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(WFVariableAvailability *)self providingActionsByVariableName];
  v11 = [v10 objectForKey:v17];
  if ((unint64_t)[v11 count] < 2) {
    [v10 removeObjectForKey:v17];
  }
  else {
    [v11 removeObject:v9];
  }
  v12 = [v10 objectForKey:v8];
  if (!v12)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    [v10 setObject:v12 forKey:v8];
  }
  [v12 addObject:v9];
  v13 = [(WFVariableAvailability *)self workflow];
  v14 = [v13 actions];
  uint64_t v15 = [v14 indexOfObject:v9];
  v16 = [NSString stringWithFormat:@"%@-!-%lu", v17, v15];

  [(NSCache *)self->_cachedContentClassesForVariableNameAtIndex removeObjectForKey:v16];
  [(WFVariableAvailability *)self notifyVariablesChanged];
}

- (void)actionDidChange:(id)a3 moved:(BOOL)a4 removed:(BOOL)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v52 = objc_opt_new();
  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = [v8 providedVariableNames];
  v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
  }
  v13 = (void *)[v9 initWithArray:v12];

  uint64_t v14 = [v8 UUID];
  v53 = v13;
  v51 = (void *)v14;
  if ([v13 count]) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v14 == 0;
  }
  if (!v15)
  {
    BOOL v43 = v6;
    unsigned int v44 = v5;
    v45 = self;
    id v46 = v8;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v16 = [(WFVariableAvailability *)self workflow];
    id v17 = [v16 actions];

    obuint64_t j = v17;
    uint64_t v49 = [v17 countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (!v49) {
      goto LABEL_33;
    }
    uint64_t v48 = *(void *)v68;
    v18 = &off_1E6549000;
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v68 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = v19;
        v20 = *(void **)(*((void *)&v67 + 1) + 8 * v19);
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v54 = [v20 containedVariables];
        uint64_t v21 = [v54 countByEnumeratingWithState:&v63 objects:v73 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v64;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v64 != v23) {
                objc_enumerationMutation(v54);
              }
              v25 = *(void **)(*((void *)&v63 + 1) + 8 * i);
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              if (isKindOfClass)
              {
                uint64_t v5 = [v25 name];
                if ([v53 containsObject:v5])
                {

LABEL_28:
                  [v52 addObject:v25];
                  continue;
                }
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v27 = v18;
                v28 = [v25 outputUUID];
                int v29 = [v51 isEqualToString:v28];

                if ((isKindOfClass & 1) == 0)
                {
                  v18 = v27;
                  if (!v29) {
                    continue;
                  }
                  goto LABEL_28;
                }

                v18 = v27;
                if (v29) {
                  goto LABEL_28;
                }
              }
              else if (isKindOfClass)
              {
              }
            }
            uint64_t v22 = [v54 countByEnumeratingWithState:&v63 objects:v73 count:16];
          }
          while (v22);
        }

        uint64_t v19 = v50 + 1;
      }
      while (v50 + 1 != v49);
      uint64_t v49 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
      if (!v49)
      {
LABEL_33:

        self = v45;
        id v8 = v46;
        BOOL v6 = v43;
        uint64_t v5 = v44;
        break;
      }
    }
  }
  if (v6)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v30 = [v8 containedVariables];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v60 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v59 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
          }
          [v52 addObject:v35];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }
      while (v32);
    }
  }
  if ([v52 count] || objc_msgSend(v53, "count")) {
    [(WFVariableAvailability *)self invalidateCache];
  }
  else {
    [(WFVariableAvailability *)self updateShortcutInputVariableUsageForChangeInAction:v8 removed:v5];
  }
  [(WFVariableAvailability *)self actionsDidMove];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v36 = v52;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v55 objects:v71 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v56 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v55 + 1) + 8 * k);
        v42 = [v41 name];
        [v41 variableProvider:v8 variableWasMoved:v42];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v55 objects:v71 count:16];
    }
    while (v38);
  }
}

- (void)notifyContentClassesChanged
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(WFVariableAvailability *)self variableObservers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 variableContentClassesDidChange];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)notifyVariablesChanged
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(WFVariableAvailability *)self variableObservers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) availableVariablesDidChange];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)removeVariableObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WFVariableAvailability *)self variableObservers];
  [v5 removeObject:v4];
}

- (void)addVariableObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WFVariableAvailability *)self variableObservers];
  [v5 addObject:v4];
}

- (NSHashTable)variableObservers
{
  variableObservers = self->_variableObservers;
  if (!variableObservers)
  {
    id v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v5 = self->_variableObservers;
    self->_variableObservers = v4;

    variableObservers = self->_variableObservers;
  }
  return variableObservers;
}

- (unint64_t)variableScopeLevelForGroupingIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFVariableAvailability *)self variableScopeLevelsByGroupingIdentifier];
  uint64_t v6 = [v5 objectForKey:v4];

  unint64_t v7 = [v6 unsignedIntegerValue];
  return v7;
}

- (id)possibleContentClassesForVariableNamed:(id)a3 atIndex:(unint64_t)a4 context:(id)a5 excludingAction:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6)
  {
    id v12 = [(WFVariableAvailability *)self _possibleContentClassesForVariableNamed:v10 atIndex:a4 context:v11 excludingAction:a6];
  }
  else
  {
    uint64_t v13 = [NSString stringWithFormat:@"%@-!-%lu", v10, a4];
    uint64_t v14 = [(NSCache *)self->_cachedContentClassesForVariableNameAtIndex objectForKey:v13];
    BOOL v15 = v14;
    if (v14)
    {
      id v12 = v14;
    }
    else
    {
      id v12 = [(WFVariableAvailability *)self _possibleContentClassesForVariableNamed:v10 atIndex:a4 context:v11 excludingAction:0];
      [(NSCache *)self->_cachedContentClassesForVariableNameAtIndex setObject:v12 forKey:v13];
    }
  }
  return v12;
}

- (id)_possibleContentClassesForVariableNamed:(id)a3 atIndex:(unint64_t)a4 context:(id)a5 excludingAction:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v25 = a5;
  id v11 = a6;
  id v12 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v23 = self;
  v24 = v10;
  uint64_t v13 = [(WFVariableAvailability *)self actionsProvidingVariableName:v10 atIndex:a4];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(id *)(*((void *)&v26 + 1) + 8 * i);
        if (v18 != v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v19 = [v18 groupingIdentifier];
            id WeakRetained = objc_msgSend(v18, "indexVariableNameWithScopeLevel:", -[WFVariableAvailability variableScopeLevelForGroupingIdentifier:](v23, "variableScopeLevelForGroupingIdentifier:", v19));

            if ([v24 isEqualToString:WeakRetained])
            {
              [v12 addObject:objc_opt_class()];
LABEL_12:

              continue;
            }
          }
          id WeakRetained = objc_loadWeakRetained((id *)&v23->_workflow);
          uint64_t v21 = [v18 inheritedOutputContentClassesInWorkflow:WeakRetained context:v25];
          [v12 addObjectsFromArray:v21];

          goto LABEL_12;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  return v12;
}

- (id)actionsProvidingVariableName:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(WFVariableAvailability *)self providingActionsByVariableName];
  long long v8 = [v7 objectForKey:v6];

  if ([v8 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
    id v10 = [WeakRetained actions];

    if ([v10 count] - 1 == a4)
    {
      id v11 = [v8 allObjects];
    }
    else
    {
      id v12 = objc_opt_new();
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __63__WFVariableAvailability_actionsProvidingVariableName_atIndex___block_invoke;
      v16[3] = &unk_1E6552EC8;
      id v17 = v8;
      id v13 = v12;
      id v18 = v13;
      [(WFVariableAvailability *)self enumerateActionsInScopeAtIndex:a4 usingBlock:v16];
      uint64_t v14 = v18;
      id v11 = v13;
    }
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

void __63__WFVariableAvailability_actionsProvidingVariableName_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (void)invalidateActionsUsingShortcutInputVariableCache
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WFVariableAvailability_invalidateActionsUsingShortcutInputVariableCache__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __74__WFVariableAvailability_invalidateActionsUsingShortcutInputVariableCache__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(void *)(v1 + 48) = 0;
}

- (void)populateActionsUsingShortcutInputVariableCache
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_actionsUsingShortcutInputVariable)
  {
    id v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    actionsUsingShortcutInputVariable = self->_actionsUsingShortcutInputVariable;
    self->_actionsUsingShortcutInputVariable = v3;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(WFVariableAvailability *)self workflow];
    id v6 = [v5 actions];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (WFActionUsesInputVariable(v11)) {
            [(NSHashTable *)self->_actionsUsingShortcutInputVariable addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (NSHashTable)actionsUsingShortcutInputVariable
{
  actionsUsingShortcutInputVariable = self->_actionsUsingShortcutInputVariable;
  if (!actionsUsingShortcutInputVariable)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__WFVariableAvailability_actionsUsingShortcutInputVariable__block_invoke;
    block[3] = &unk_1E6558B28;
    block[4] = self;
    dispatch_sync(queue, block);
    actionsUsingShortcutInputVariable = self->_actionsUsingShortcutInputVariable;
  }
  return actionsUsingShortcutInputVariable;
}

uint64_t __59__WFVariableAvailability_actionsUsingShortcutInputVariable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) populateActionsUsingShortcutInputVariableCache];
}

- (void)updateShortcutInputVariableUsageForChangeInAction:(id)a3 removed:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFVariableAvailability.m", 283, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  uint64_t v8 = [(WFVariableAvailability *)self actionsUsingShortcutInputVariable];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__WFVariableAvailability_updateShortcutInputVariableUsageForChangeInAction_removed___block_invoke;
  block[3] = &unk_1E6552EF0;
  BOOL v16 = a4;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(queue, block);
}

uint64_t __84__WFVariableAvailability_updateShortcutInputVariableUsageForChangeInAction_removed___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t result = WFActionUsesInputVariable(*(void **)(a1 + 32));
    if (!result) {
      return result;
    }
LABEL_3:
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    return [v3 removeObject:v4];
  }
  int v5 = [*(id *)(a1 + 40) containsObject:*(void *)(a1 + 32)];
  uint64_t result = WFActionUsesInputVariable(*(void **)(a1 + 32));
  if (!result || (v5 & 1) != 0)
  {
    if ((result | v5 ^ 1)) {
      return result;
    }
    goto LABEL_3;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  return [v6 addObject:v7];
}

- (BOOL)isShortcutInputVariableUsed
{
  v2 = [(WFVariableAvailability *)self actionsUsingShortcutInputVariable];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)invalidateActionOutputProviderCache
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WFVariableAvailability_invalidateActionOutputProviderCache__block_invoke;
  block[3] = &unk_1E6558B28;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __61__WFVariableAvailability_invalidateActionOutputProviderCache__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (id)actionProvidingVariableWithOutputUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__39869;
  BOOL v16 = __Block_byref_object_dispose__39870;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WFVariableAvailability_actionProvidingVariableWithOutputUUID___block_invoke;
  block[3] = &unk_1E6558270;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __64__WFVariableAvailability_actionProvidingVariableWithOutputUUID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) populateActionOutputVariableActionsByUUID];
  id v5 = [*(id *)(a1 + 32) actionOutputVariableActionsByUUID];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isVariableWithOutputUUIDAvailable:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__WFVariableAvailability_isVariableWithOutputUUIDAvailable_atIndex___block_invoke;
  v9[3] = &unk_1E6552E28;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = [(WFVariableAvailability *)self isVariableAvailableAtIndex:a4 withActionTest:v9];

  return a4;
}

uint64_t __68__WFVariableAvailability_isVariableWithOutputUUIDAvailable_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 UUID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)populateActionOutputVariableActionsByUUID
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_actionOutputVariableActionsByUUID)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    actionOutputVariableActionsByUUID = self->_actionOutputVariableActionsByUUID;
    self->_actionOutputVariableActionsByUUID = v3;

    long long v28 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
    id v6 = [WeakRetained actions];

    id v7 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v13 = objc_msgSend(v12, "containedVariables", v28);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v35 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v19 = [v18 outputUUID];
                  [v7 addObject:v19];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v15);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v9);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v20 = obj;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
    uint64_t v22 = v28;
    if (v21)
    {
      uint64_t v23 = v21;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v20);
          }
          long long v26 = *(void **)(*((void *)&v30 + 1) + 8 * k);
          long long v27 = objc_msgSend(v26, "UUID", v28);
          if ([v7 containsObject:v27]) {
            [(NSMapTable *)v22->_actionOutputVariableActionsByUUID setObject:v26 forKey:v27];
          }
        }
        uint64_t v23 = [v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v23);
    }
  }
}

- (NSMapTable)actionOutputVariableActionsByUUID
{
  actionOutputVariableActionsByUUID = self->_actionOutputVariableActionsByUUID;
  if (!actionOutputVariableActionsByUUID)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__WFVariableAvailability_actionOutputVariableActionsByUUID__block_invoke;
    block[3] = &unk_1E6558B28;
    void block[4] = self;
    dispatch_sync(queue, block);
    actionOutputVariableActionsByUUID = self->_actionOutputVariableActionsByUUID;
  }
  return actionOutputVariableActionsByUUID;
}

uint64_t __59__WFVariableAvailability_actionOutputVariableActionsByUUID__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) populateActionOutputVariableActionsByUUID];
}

- (id)availableOutputActionsAtIndex:(unint64_t)a3
{
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"is.workflow.actions.getvariable", @"is.workflow.actions.setvariable", @"is.workflow.actions.appendvariable", 0);
  id v6 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__WFVariableAvailability_availableOutputActionsAtIndex___block_invoke;
  v12[3] = &unk_1E6552EC8;
  id v13 = v5;
  id v7 = v6;
  id v14 = v7;
  id v8 = v5;
  [(WFVariableAvailability *)self enumerateActionsInScopeAtIndex:a3 usingBlock:v12];
  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __56__WFVariableAvailability_availableOutputActionsAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (WFActionHasEligibleOutput(v3, *(void **)(a1 + 32))) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (BOOL)areActionOutputVariablesAvailableAtIndex:(unint64_t)a3
{
  id v5 = [(WFVariableAvailability *)self workflow];
  id v6 = [v5 inputAction];

  if (v6) {
    return 1;
  }
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"is.workflow.actions.getvariable", @"is.workflow.actions.setvariable", @"is.workflow.actions.appendvariable", 0);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__WFVariableAvailability_areActionOutputVariablesAvailableAtIndex___block_invoke;
  v11[3] = &unk_1E6552EA0;
  id v9 = v8;
  id v12 = v9;
  id v13 = &v14;
  [(WFVariableAvailability *)self enumerateActionsInScopeAtIndex:a3 usingBlock:v11];
  BOOL v7 = *((unsigned char *)v15 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  return v7;
}

BOOL __67__WFVariableAvailability_areActionOutputVariablesAvailableAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL result = WFActionHasEligibleOutput(a2, *(void **)(a1 + 32));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateActionsInScopeAtIndex:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  id v8 = [WeakRetained actions];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__WFVariableAvailability_enumerateActionsInScopeAtIndex_usingBlock___block_invoke;
  v10[3] = &unk_1E6552E78;
  id v12 = v14;
  unint64_t v13 = a3;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  [v8 enumerateObjectsUsingBlock:v10];

  _Block_object_dispose(v14, 8);
}

void __68__WFVariableAvailability_enumerateActionsInScopeAtIndex_usingBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  if (*(void *)(a1 + 56) <= a3 && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v7 = [v17 mode];
  if (!v7)
  {
    uint64_t v8 = 1;
    goto LABEL_8;
  }
  if (v7 == 2)
  {
    uint64_t v8 = -1;
LABEL_8:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v8;
  }
LABEL_9:
  unint64_t v9 = *(void *)(a1 + 56);
  if (v9 <= a3 && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
LABEL_15:
    *a4 = 1;
    goto LABEL_18;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v11 = [WeakRetained actions];
  id v12 = [*(id *)(a1 + 32) variableScopeEndActionsByStartAction];
  id v13 = v17;
  id v14 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_17:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_18;
  }
  uint64_t v15 = [v12 objectForKey:v13];
  unint64_t v16 = [v14 indexOfObject:v15];

  if (v9 > a3 && v16 > v9) {
    goto LABEL_17;
  }
LABEL_18:
}

- (BOOL)isVariableAvailableAtIndex:(unint64_t)a3 withActionTest:(id)a4
{
  id v6 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__WFVariableAvailability_isVariableAvailableAtIndex_withActionTest___block_invoke;
  v9[3] = &unk_1E6552E50;
  id v11 = &v12;
  id v7 = v6;
  id v10 = v7;
  [(WFVariableAvailability *)self enumerateActionsInScopeAtIndex:a3 usingBlock:v9];
  LOBYTE(a3) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return a3;
}

uint64_t __68__WFVariableAvailability_isVariableAvailableAtIndex_withActionTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a4 = result;
  return result;
}

- (BOOL)isVariableWithName:(id)a3 availableAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(WFVariableAvailability *)self providingActionsByVariableName];
  uint64_t v8 = [v7 objectForKey:v6];

  if ([v8 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__WFVariableAvailability_isVariableWithName_availableAtIndex___block_invoke;
    v11[3] = &unk_1E6552E28;
    id v12 = v8;
    BOOL v9 = [(WFVariableAvailability *)self isVariableAvailableAtIndex:a4 withActionTest:v11];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __62__WFVariableAvailability_isVariableWithName_availableAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (BOOL)areVariablesAvailableAtIndex:(unint64_t)a3
{
  return [(WFVariableAvailability *)self isVariableAvailableAtIndex:a3 withActionTest:&__block_literal_global_39885];
}

BOOL __55__WFVariableAvailability_areVariablesAvailableAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 providedVariableNames];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)availableVariableNamesAtIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  id v5 = WFWorkflowGetAvailableVariableNamesAndDetails(WeakRetained, a3, 1, 0, 0, 0);
  id v6 = [v5 array];

  return v6;
}

- (id)availableVariableNamesExcludingThoseProvidedByAction:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(WFVariableAvailability *)self providingActionsByVariableName];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v6 objectForKey:v11];
        id v13 = v12;
        if (!v4
          || [v12 count] != 1
          || ([v13 anyObject], id v14 = (id)objc_claimAutoreleasedReturnValue(),
                                              v14,
                                              v14 != v4))
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)invalidateCache
{
  variableScopeLevelsByGroupingIdentifier = self->_variableScopeLevelsByGroupingIdentifier;
  self->_variableScopeLevelsByGroupingIdentifier = 0;

  providingActionsByVariableName = self->_providingActionsByVariableName;
  self->_providingActionsByVariableName = 0;

  variableScopeEndActionsByStartAction = self->_variableScopeEndActionsByStartAction;
  self->_variableScopeEndActionsByStartAction = 0;

  [(WFVariableAvailability *)self invalidateActionsUsingShortcutInputVariableCache];
  [(WFVariableAvailability *)self invalidateActionOutputProviderCache];
  [(WFVariableAvailability *)self invalidateContentClassCache];
}

- (NSMapTable)variableScopeEndActionsByStartAction
{
  variableScopeEndActionsByStartAction = self->_variableScopeEndActionsByStartAction;
  if (!variableScopeEndActionsByStartAction)
  {
    [(WFVariableAvailability *)self populateCache];
    variableScopeEndActionsByStartAction = self->_variableScopeEndActionsByStartAction;
  }
  return variableScopeEndActionsByStartAction;
}

- (NSMapTable)variableScopeLevelsByGroupingIdentifier
{
  variableScopeLevelsByGroupingIdentifier = self->_variableScopeLevelsByGroupingIdentifier;
  if (!variableScopeLevelsByGroupingIdentifier)
  {
    [(WFVariableAvailability *)self populateCache];
    variableScopeLevelsByGroupingIdentifier = self->_variableScopeLevelsByGroupingIdentifier;
  }
  return variableScopeLevelsByGroupingIdentifier;
}

- (NSMapTable)providingActionsByVariableName
{
  providingActionsByVariableName = self->_providingActionsByVariableName;
  if (!providingActionsByVariableName)
  {
    [(WFVariableAvailability *)self populateCache];
    providingActionsByVariableName = self->_providingActionsByVariableName;
  }
  return providingActionsByVariableName;
}

- (void)populateCache
{
  BOOL v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  variableScopeLevelsByGroupingIdentifier = self->_variableScopeLevelsByGroupingIdentifier;
  self->_variableScopeLevelsByGroupingIdentifier = v3;

  id v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  providingActionsByVariableName = self->_providingActionsByVariableName;
  self->_providingActionsByVariableName = v5;

  uint64_t v7 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  variableScopeEndActionsByStartAction = self->_variableScopeEndActionsByStartAction;
  self->_variableScopeEndActionsByStartAction = v7;

  id v11 = [(WFVariableAvailability *)self workflow];
  uint64_t v9 = [v11 actions];
  id v10 = WFWorkflowGetAvailableVariableNamesAndDetails(v11, [v9 count] - 1, 0, self->_variableScopeLevelsByGroupingIdentifier, self->_variableScopeEndActionsByStartAction, self->_providingActionsByVariableName);
}

- (WFVariableAvailability)initWithWorkflow:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFVariableAvailability;
  id v5 = [(WFVariableAvailability *)&v16 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_workflow, v4);
    uint64_t v7 = objc_opt_new();
    cachedContentClassesForVariableNameAtIndex = v6->_cachedContentClassesForVariableNameAtIndex;
    v6->_cachedContentClassesForVariableNameAtIndex = (NSCache *)v7;

    uint64_t v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    id v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    id v14 = v6;
  }

  return v6;
}

+ (BOOL)actionIsEligibleForOutputVariable:(id)a3
{
  return WFActionHasEligibleOutput(a3, 0);
}

@end