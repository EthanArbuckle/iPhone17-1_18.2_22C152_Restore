@interface WFResourceManager
- (BOOL)currentlyRequiresResourceOfClass:(Class)a3;
- (BOOL)currentlyRequiresResourceOfClasses:(id)a3;
- (BOOL)didEvaluateAvailabilityOfNodes;
- (BOOL)nodeIsAvailable:(id)a3 error:(id *)a4;
- (BOOL)nodeIsRelevant:(id)a3;
- (BOOL)resourcesAvailable;
- (BOOL)resourcesRequiredForDisplayAvailable;
- (NSArray)resourceNodes;
- (NSMapTable)targetSelectorTable;
- (NSMutableOrderedSet)unavailableResources;
- (NSOrderedSet)unavailableResourceErrors;
- (NSSet)accessResources;
- (WFResourceManager)initWithDefinitions:(id)a3;
- (id)currentlyRequiredResourcesOfClass:(Class)a3;
- (id)relevantNodes;
- (id)resourceObjectsConformingToProtocol:(id)a3;
- (id)resourceObjectsOfClass:(Class)a3;
- (id)resourceObjectsOfClasses:(id)a3;
- (id)selectorSetForTarget:(id)a3;
- (os_unfair_lock_s)stateLock;
- (os_unfair_lock_s)targetSelectorLock;
- (void)addResource:(id)a3;
- (void)addResourceNodes:(id)a3;
- (void)addTarget:(id)a3 selector:(SEL)a4;
- (void)evaluateAvailabilityOfNodesIfNeeded;
- (void)evaluateAvailabilityOfNodesWithChangedNode:(id)a3;
- (void)makeAccessResourcesAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
- (void)notifyTargets;
- (void)refreshAvailabilityOfRequiredResourcesOfClasses:(id)a3;
- (void)removeResourceNodes:(id)a3;
- (void)removeTarget:(id)a3 selector:(SEL)a4;
- (void)resourceNodeAvailabilityChanged:(id)a3;
- (void)setResourceNodes:(id)a3;
- (void)setResourcesAvailable:(BOOL)a3;
- (void)setResourcesRequiredForDisplayAvailable:(BOOL)a3;
- (void)setTargetSelectorTable:(id)a3;
- (void)setUnavailableResourceErrors:(id)a3;
- (void)setUnavailableResources:(id)a3;
@end

@implementation WFResourceManager

- (WFResourceManager)initWithDefinitions:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFResourceManager;
  v5 = [(WFResourceManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    v5->_stateLock._os_unfair_lock_opaque = 0;
    v5->_targetSelectorLock._os_unfair_lock_opaque = 0;
    v7 = +[WFResourceNode nodesWithDefinitions:v4];
    uint64_t v8 = [v7 mutableCopy];
    resourceNodes = v6->_resourceNodes;
    v6->_resourceNodes = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    targetSelectorTable = v6->_targetSelectorTable;
    v6->_targetSelectorTable = (NSMapTable *)v10;

    [(NSMutableArray *)v6->_resourceNodes makeObjectsPerformSelector:sel_setDelegate_ withObject:v6];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSelectorTable, 0);
  objc_storeStrong((id *)&self->_unavailableResourceErrors, 0);
  objc_storeStrong((id *)&self->_unavailableResources, 0);
  objc_storeStrong((id *)&self->_resourceNodes, 0);
}

- (BOOL)resourcesAvailable
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  [(WFResourceManager *)v2 evaluateAvailabilityOfNodesIfNeeded];
  LOBYTE(v2) = v2->_resourcesAvailable;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (void)evaluateAvailabilityOfNodesIfNeeded
{
  if (!self->_didEvaluateAvailabilityOfNodes) {
    [(WFResourceManager *)self evaluateAvailabilityOfNodesWithChangedNode:0];
  }
}

- (void)evaluateAvailabilityOfNodesWithChangedNode:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_stateLock);
  if (v4)
  {
    uint64_t v5 = [(NSMutableOrderedSet *)self->_unavailableResources mutableCopy];
    BOOL resourcesAvailable = self->_resourcesAvailable;
    BOOL resourcesRequiredForDisplayAvailable = self->_resourcesRequiredForDisplayAvailable;
    if ([(WFResourceManager *)self nodeIsAvailable:v4 error:0])
    {
      BOOL v8 = resourcesRequiredForDisplayAvailable;
      BOOL v9 = resourcesAvailable;
      uint64_t v10 = [v4 resource];
      [(id)v5 removeObject:v10];

      uint64_t v11 = [(id)v5 count];
      if (v11) {
        char v12 = v8;
      }
      else {
        char v12 = 1;
      }
      if (v11) {
        char v13 = v9;
      }
      else {
        char v13 = 1;
      }
    }
    else
    {
      v23 = [v4 resource];
      char v24 = [(id)objc_opt_class() mustBeAvailableForDisplay];

      if (resourcesRequiredForDisplayAvailable) {
        char v12 = v24 ^ 1;
      }
      else {
        char v12 = 0;
      }
      v25 = [v4 resource];
      [(id)v5 addObject:v25];

      char v13 = 0;
    }
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v14 = self->_resourceNodes;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      char v12 = 1;
      char v13 = 1;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (![(WFResourceManager *)self nodeIsAvailable:v19 error:0])
          {
            v20 = [v19 resource];
            char v21 = [(id)objc_opt_class() mustBeAvailableForDisplay];

            v12 &= v21 ^ 1;
            v22 = [v19 resource];
            [(id)v5 addObject:v22];

            char v13 = 0;
          }
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v16);
    }
    else
    {
      char v12 = 1;
      char v13 = 1;
    }

    self->_didEvaluateAvailabilityOfNodes = 1;
    id v4 = 0;
  }
  uint64_t v26 = objc_msgSend((id)v5, "if_compactMap:", &__block_literal_global_175_67548);
  unavailableResources = self->_unavailableResources;
  if (v5 | (unint64_t)unavailableResources
    && ([(NSMutableOrderedSet *)unavailableResources isEqualToOrderedSet:v5] & 1) == 0)
  {
    [(WFResourceManager *)self setUnavailableResources:v5];
  }
  unavailableResourceErrors = self->_unavailableResourceErrors;
  if ((unint64_t)unavailableResourceErrors | v26
    && ![(NSOrderedSet *)unavailableResourceErrors isEqualToOrderedSet:v26])
  {
    [(WFResourceManager *)self setUnavailableResourceErrors:v26];
    int v29 = 1;
  }
  else
  {
    int v29 = 0;
  }
  if (self->_resourcesAvailable != (v13 & 1))
  {
    -[WFResourceManager setResourcesAvailable:](self, "setResourcesAvailable:");
    int v29 = 1;
  }
  if (self->_resourcesRequiredForDisplayAvailable != (v12 & 1)) {
    -[WFResourceManager setResourcesRequiredForDisplayAvailable:](self, "setResourcesRequiredForDisplayAvailable:");
  }
  if (v29) {
    [(WFResourceManager *)self notifyTargets];
  }
}

- (void)setUnavailableResources:(id)a3
{
}

- (void)setUnavailableResourceErrors:(id)a3
{
}

- (void)setResourcesRequiredForDisplayAvailable:(BOOL)a3
{
  self->_BOOL resourcesRequiredForDisplayAvailable = a3;
}

- (void)setResourcesAvailable:(BOOL)a3
{
  self->_BOOL resourcesAvailable = a3;
}

- (void)notifyTargets
{
  p_targetSelectorLock = &self->_targetSelectorLock;
  os_unfair_lock_lock(&self->_targetSelectorLock);
  id v4 = [(WFResourceManager *)self targetSelectorTable];
  uint64_t v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_targetSelectorLock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__WFResourceManager_notifyTargets__block_invoke;
  v7[3] = &unk_1E6558938;
  id v8 = v5;
  BOOL v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

- (NSMapTable)targetSelectorTable
{
  return self->_targetSelectorTable;
}

- (id)resourceObjectsOfClass:(Class)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  uint64_t v5 = [(WFResourceManager *)self resourceObjectsOfClasses:v4];

  return v5;
}

- (id)resourceObjectsOfClasses:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if ([v4 anyObject])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(WFResourceManager *)self resourceNodes];
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
          [*(id *)(*((void *)&v12 + 1) + 8 * i) addResourceObjectsOfClassesOrProtocols:v4 toSet:v5];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (NSArray)resourceNodes
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  id v4 = (void *)[(NSMutableArray *)self->_resourceNodes copy];
  os_unfair_lock_unlock(p_stateLock);
  return (NSArray *)v4;
}

void __34__WFResourceManager_notifyTargets__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [*(id *)(a1 + 32) keyEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7, 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [v7 performSelector:NSSelectorFromString(*(NSString **)(*((void *)&v13 + 1) + 8 * v12++)) withObject:*(void *)(a1 + 40)];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

- (os_unfair_lock_s)targetSelectorLock
{
  return self->_targetSelectorLock;
}

- (os_unfair_lock_s)stateLock
{
  return self->_stateLock;
}

- (BOOL)didEvaluateAvailabilityOfNodes
{
  return self->_didEvaluateAvailabilityOfNodes;
}

- (void)setTargetSelectorTable:(id)a3
{
}

- (void)setResourceNodes:(id)a3
{
}

- (void)removeResourceNodes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        -[NSMutableArray removeObject:](self->_resourceNodes, "removeObject:", v10, (void)v11);
        [(WFResourceManager *)self evaluateAvailabilityOfNodesWithChangedNode:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)addResourceNodes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "setDelegate:", self, (void)v11);
        [(NSMutableArray *)self->_resourceNodes addObject:v10];
        [(WFResourceManager *)self evaluateAvailabilityOfNodesWithChangedNode:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)addResource:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[WFResourceNode alloc] initWithResource:v4];

  v7[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(WFResourceManager *)self addResourceNodes:v6];
}

- (void)removeTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  uint64_t v7 = NSStringFromSelector(a4);
  p_targetSelectorLock = &self->_targetSelectorLock;
  os_unfair_lock_lock(&self->_targetSelectorLock);
  uint64_t v9 = [(WFResourceManager *)self targetSelectorTable];
  uint64_t v10 = [v9 objectForKey:v6];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__WFResourceManager_removeTarget_selector___block_invoke;
  v14[3] = &unk_1E6557F18;
  id v15 = v7;
  id v11 = v7;
  long long v12 = [v10 objectsPassingTest:v14];

  if ([v12 count])
  {
    long long v13 = [(WFResourceManager *)self targetSelectorTable];
    [v13 setObject:v12 forKey:v6];
LABEL_5:

    goto LABEL_6;
  }
  if (v12)
  {
    long long v13 = [(WFResourceManager *)self targetSelectorTable];
    [v13 removeObjectForKey:v6];
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock(p_targetSelectorLock);
}

uint64_t __43__WFResourceManager_removeTarget_selector___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToString:a2] ^ 1;
}

- (void)addTarget:(id)a3 selector:(SEL)a4
{
  id v11 = a3;
  id v6 = NSStringFromSelector(a4);
  p_targetSelectorLock = &self->_targetSelectorLock;
  os_unfair_lock_lock(&self->_targetSelectorLock);
  uint64_t v8 = [(WFResourceManager *)self selectorSetForTarget:v11];
  if (([v8 containsObject:v6] & 1) == 0)
  {
    uint64_t v9 = [(WFResourceManager *)self targetSelectorTable];
    uint64_t v10 = [v8 setByAddingObject:v6];
    [v9 setObject:v10 forKey:v11];
  }
  os_unfair_lock_unlock(p_targetSelectorLock);
}

- (id)selectorSetForTarget:(id)a3
{
  p_targetSelectorLock = &self->_targetSelectorLock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_targetSelectorLock);
  id v6 = [(WFResourceManager *)self targetSelectorTable];
  uint64_t v7 = [v6 objectForKey:v5];

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  uint64_t v9 = v8;

  return v9;
}

- (void)resourceNodeAvailabilityChanged:(id)a3
{
  p_stateLock = &self->_stateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  [(WFResourceManager *)self evaluateAvailabilityOfNodesIfNeeded];
  [(WFResourceManager *)self evaluateAvailabilityOfNodesWithChangedNode:v5];

  os_unfair_lock_unlock(p_stateLock);
}

- (NSOrderedSet)unavailableResourceErrors
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  [(WFResourceManager *)self evaluateAvailabilityOfNodesIfNeeded];
  id v4 = self->_unavailableResourceErrors;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (NSMutableOrderedSet)unavailableResources
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  [(WFResourceManager *)self evaluateAvailabilityOfNodesIfNeeded];
  id v4 = self->_unavailableResources;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (BOOL)resourcesRequiredForDisplayAvailable
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  [(WFResourceManager *)v2 evaluateAvailabilityOfNodesIfNeeded];
  LOBYTE(v2) = v2->_resourcesRequiredForDisplayAvailable;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

uint64_t __64__WFResourceManager_evaluateAvailabilityOfNodesWithChangedNode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 availabilityError];
}

- (BOOL)nodeIsAvailable:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(WFResourceManager *)self nodeIsRelevant:v6]
    && ([v6 resource],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isAvailable],
        v7,
        (v8 & 1) == 0))
  {
    if (a4)
    {
      uint64_t v10 = [v6 resource];
      id v11 = [v10 availabilityError];

      if (v11)
      {
        long long v12 = [v6 resource];
        *a4 = [v12 availabilityError];
      }
      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (BOOL)nodeIsRelevant:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(a3, "subnodes", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![(WFResourceManager *)self nodeIsAvailable:*(void *)(*((void *)&v11 + 1) + 8 * i) error:0])
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (id)relevantNodes
{
  uint64_t v3 = [(WFResourceManager *)self resourceNodes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__WFResourceManager_relevantNodes__block_invoke;
  v6[3] = &unk_1E6557ED0;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "if_objectsPassingTest:", v6);

  return v4;
}

uint64_t __34__WFResourceManager_relevantNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) nodeIsRelevant:a2];
}

- (id)resourceObjectsConformingToProtocol:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(WFResourceManager *)self resourceNodes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
        [v11 addResourceObjectsOfClassesOrProtocols:v12 toSet:v5];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)makeAccessResourcesAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFResourceManager *)self relevantNodes];
  uint64_t v9 = objc_msgSend(v8, "if_compactMap:", &__block_literal_global_67553);

  if ([v9 count])
  {
    uint64_t v10 = objc_opt_new();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_2;
    v15[3] = &unk_1E6557E80;
    id v16 = v6;
    id v17 = v10;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_4;
    v12[3] = &unk_1E6557EA8;
    id v13 = v17;
    id v14 = v7;
    id v11 = v17;
    objc_msgSend(v9, "if_enumerateAsynchronouslyInSequence:completionHandler:", v15, v12);
  }
  else
  {
    id v11 = (id)objc_opt_new();
    (*((void (**)(id, id))v7 + 2))(v7, v11);
  }
}

void __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_3;
  v9[3] = &unk_1E6557E58;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v6;
  id v8 = v6;
  [a2 makeAvailableWithUserInterface:v7 completionHandler:v9];
}

void __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

id __85__WFResourceManager_makeAccessResourcesAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 resource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [v2 resource];
    uint64_t v6 = [v5 status];
    int v7 = [(id)objc_opt_class() alwaysMakeAvailable];
    if (v6 == 1) {
      int v8 = 1;
    }
    else {
      int v8 = v7;
    }
    if (v8) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)currentlyRequiredResourcesOfClass:(Class)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v5 = [(WFResourceManager *)self relevantNodes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__WFResourceManager_currentlyRequiredResourcesOfClass___block_invoke;
  v9[3] = &__block_descriptor_40_e39___WFResource_24__0__WFResourceNode_8Q16lu32l8;
  void v9[4] = a3;
  uint64_t v6 = objc_msgSend(v5, "if_compactMap:", v9);
  int v7 = [v4 orderedSetWithArray:v6];

  return v7;
}

id __55__WFResourceManager_currentlyRequiredResourcesOfClass___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 resource];
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v2 resource];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSSet)accessResources
{
  uint64_t v3 = objc_opt_class();
  return (NSSet *)[(WFResourceManager *)self resourceObjectsOfClass:v3];
}

- (BOOL)currentlyRequiresResourceOfClasses:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(WFResourceManager *)self resourceNodes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 resource];
        char v12 = WFResourceClassIsInArray(v11, v4);

        if (v12)
        {
          BOOL v13 = [(WFResourceManager *)self nodeIsRelevant:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)currentlyRequiresResourceOfClass:(Class)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = a3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  LOBYTE(self) = [(WFResourceManager *)self currentlyRequiresResourceOfClasses:v4];

  return (char)self;
}

- (void)refreshAvailabilityOfRequiredResourcesOfClasses:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(WFResourceManager *)self resourceNodes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 resource];
        int v12 = WFResourceClassIsInArray(v11, v4);

        if (v12) {
          [v10 refreshAvailability];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

@end