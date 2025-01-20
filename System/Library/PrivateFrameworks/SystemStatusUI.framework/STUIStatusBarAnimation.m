@interface STUIStatusBarAnimation
+ (STUIStatusBarAnimation)animationWithBlock:(id)a3;
+ (void)_addAnimations:(id)a3 toDispatchGroup:(id)a4;
+ (void)_addAnimations:(id)a3 toPreparingAnimations:(id)a4 exclusiveAnimations:(id)a5 visitedDisplayItemIdentifiers:(id)a6;
+ (void)initialize;
+ (void)prepareAnimations:(id)a3 forStatusBar:(id)a4;
- (BOOL)delaysAnimatingItems;
- (BOOL)delaysDependentItems;
- (BOOL)isEnabled;
- (NSMutableArray)completionHandlers;
- (NSMutableArray)subAnimations;
- (NSSet)delayedDisplayItemPlacements;
- (NSSet)delayedItemIdentifiers;
- (NSSet)effectiveDelayedItemIdentifiers;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)exclusivityGroupIdentifier;
- (NSString)identifier;
- (STUIStatusBarAnimation)parentAnimation;
- (STUIStatusBarIdentifier)displayItemIdentifier;
- (double)timeout;
- (id)_dependentItemIdentifiersEnabledOnly:(BOOL)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)animationBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)prepareBlock;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)timeoutBlock;
- (int64_t)priority;
- (int64_t)type;
- (void)_prepareForStatusBar:(id)a3 preparingAnimations:(id)a4 exclusiveAnimations:(id)a5;
- (void)addCompletionHandler:(id)a3;
- (void)addSubAnimation:(id)a3 forDisplayItemWithIdentifier:(id)a4;
- (void)addTimeout:(double)a3 withHandler:(id)a4;
- (void)addTotalCompletionHandler:(id)a3;
- (void)cancel;
- (void)performForStatusBar:(id)a3;
- (void)setAnimationBlock:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setDelayedDisplayItemPlacements:(id)a3;
- (void)setDelayedItemIdentifiers:(id)a3;
- (void)setDelaysAnimatingItems:(BOOL)a3;
- (void)setDelaysDependentItems:(BOOL)a3;
- (void)setDisplayItemIdentifier:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExclusivityGroupIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setParentAnimation:(id)a3;
- (void)setPrepareBlock:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setSubAnimations:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutBlock:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation STUIStatusBarAnimation

+ (void)prepareAnimations:(id)a3 forStatusBar:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  v9 = [v7 dictionary];
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  v11 = [MEMORY[0x1E4F1CAD0] set];
  [a1 _addAnimations:v8 toPreparingAnimations:v9 exclusiveAnimations:v10 visitedDisplayItemIdentifiers:v11];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__STUIStatusBarAnimation_prepareAnimations_forStatusBar___block_invoke;
  v15[3] = &unk_1E6AA4880;
  id v16 = v6;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v6;
  [v13 enumerateKeysAndObjectsUsingBlock:v15];
}

+ (void)_addAnimations:(id)a3 toPreparingAnimations:(id)a4 exclusiveAnimations:(id)a5 visitedDisplayItemIdentifiers:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v28 = a6;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v9;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v17 = [v16 displayItemIdentifier];
        id v18 = v17;
        if (v17)
        {
          id v19 = v17;
        }
        else
        {
          id v19 = [MEMORY[0x1E4F1CA98] null];
        }
        v20 = v19;

        v21 = [v10 objectForKeyedSubscript:v20];
        if (!v21)
        {
          v21 = [MEMORY[0x1E4F1CA80] set];
          [v10 setObject:v21 forKeyedSubscript:v20];
        }
        [v21 addObject:v16];
        v22 = [v16 exclusivityGroupIdentifier];
        if (v22)
        {
          v23 = [v11 objectForKeyedSubscript:v22];
          if (!v23)
          {
            v23 = [MEMORY[0x1E4F1CA80] set];
            [v11 setObject:v23 forKeyedSubscript:v22];
          }
          [v23 addObject:v16];
        }
        v24 = [v16 subAnimations];
        v25 = [v28 setByAddingObject:v20];
        [a1 _addAnimations:v24 toPreparingAnimations:v10 exclusiveAnimations:v11 visitedDisplayItemIdentifiers:v25];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }
}

- (STUIStatusBarIdentifier)displayItemIdentifier
{
  return self->_displayItemIdentifier;
}

+ (void)_addAnimations:(id)a3 toDispatchGroup:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 isEnabled])
        {
          dispatch_group_enter(v7);
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __57__STUIStatusBarAnimation__addAnimations_toDispatchGroup___block_invoke;
          v14[3] = &unk_1E6AA36C8;
          v15 = v7;
          [v12 addCompletionHandler:v14];
        }
        uint64_t v13 = [v12 subAnimations];
        [a1 _addAnimations:v13 toDispatchGroup:v7];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (NSMutableArray)subAnimations
{
  return self->_subAnimations;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)exclusivityGroupIdentifier
{
  return self->_exclusivityGroupIdentifier;
}

- (NSSet)effectiveDelayedItemIdentifiers
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_enabled)
  {
    v3 = [(STUIStatusBarAnimation *)self delayedItemIdentifiers];
    v4 = (void *)[v3 mutableCopy];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v5 = [(STUIStatusBarAnimation *)self delayedDisplayItemPlacements];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v24 + 1) + 8 * i) identifier];
          id v11 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:v10];
          [v4 addObject:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    if (self->_delaysDependentItems || self->_delaysAnimatingItems)
    {
      uint64_t v12 = [(STUIStatusBarAnimation *)self _dependentItemIdentifiersEnabledOnly:!self->_delaysDependentItems];
      [v4 unionSet:v12];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v13 = [(STUIStatusBarAnimation *)self subAnimations];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = [*(id *)(*((void *)&v20 + 1) + 8 * j) effectiveDelayedItemIdentifiers];
          [v4 unionSet:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v4;
}

- (id)_dependentItemIdentifiersEnabledOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 && !self->_enabled)
  {
    v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA80] set];
    if (self->_displayItemIdentifier)
    {
      uint64_t v6 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:");
      [v5 addObject:v6];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [(STUIStatusBarAnimation *)self subAnimations];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) _dependentItemIdentifiersEnabledOnly:v3];
          [v5 unionSet:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v5;
}

- (NSSet)delayedItemIdentifiers
{
  return self->_delayedItemIdentifiers;
}

- (NSSet)delayedDisplayItemPlacements
{
  return self->_delayedDisplayItemPlacements;
}

void __46__STUIStatusBarAnimation_performForStatusBar___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v7 = [v8 priority];
  if (v7 <= [*(id *)(a1 + 32) priority])
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
  else
  {
    [v8 performForStatusBar:*(void *)(a1 + 40)];
  }
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)addSubAnimation:(id)a3 forDisplayItemWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_subAnimations)
  {
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    subAnimations = self->_subAnimations;
    self->_subAnimations = v8;
  }
  id v10 = (id)[v6 copy];

  [v10 setDisplayItemIdentifier:v7];
  [v10 setParentAnimation:self];
  [(NSMutableArray *)self->_subAnimations addObject:v10];
}

- (void)setDisplayItemIdentifier:(id)a3
{
}

- (void)setParentAnimation:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = _Block_copy(self->_animationBlock);
  id v6 = (void *)v4[13];
  v4[13] = v5;

  id v7 = _Block_copy(self->_prepareBlock);
  id v8 = (void *)v4[7];
  v4[7] = v7;

  v4[6] = self->_type;
  *((unsigned char *)v4 + 10) = self->_enabled;
  v4[2] = self->_priority;
  uint64_t v9 = [(NSString *)self->_identifier copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_exclusivityGroupIdentifier copy];
  uint64_t v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(STUIStatusBarIdentifier *)self->_displayItemIdentifier copy];
  long long v14 = (void *)v4[3];
  v4[3] = v13;

  uint64_t v15 = [(NSSet *)self->_delayedItemIdentifiers copy];
  long long v16 = (void *)v4[8];
  v4[8] = v15;

  uint64_t v17 = [(NSSet *)self->_delayedDisplayItemPlacements copy];
  long long v18 = (void *)v4[9];
  v4[9] = v17;

  *((unsigned char *)v4 + 8) = self->_delaysAnimatingItems;
  *((unsigned char *)v4 + 9) = self->_delaysDependentItems;
  v4[12] = *(void *)&self->_timeout;
  uint64_t v19 = _Block_copy(self->_timeoutBlock);
  long long v20 = (void *)v4[14];
  v4[14] = v19;

  return v4;
}

+ (STUIStatusBarAnimation)animationWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setAnimationBlock:v4];

  id v6 = [MEMORY[0x1E4F1CAD0] set];
  [v5 setDelayedItemIdentifiers:v6];

  id v7 = [MEMORY[0x1E4F1CAD0] set];
  [v5 setDelayedDisplayItemPlacements:v7];

  return (STUIStatusBarAnimation *)v5;
}

- (void)setDelayedDisplayItemPlacements:(id)a3
{
}

- (void)setDelayedItemIdentifiers:(id)a3
{
}

- (void)setAnimationBlock:(id)a3
{
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void)setPrepareBlock:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setDelaysAnimatingItems:(BOOL)a3
{
  self->_delaysAnimatingItems = a3;
}

- (void)performForStatusBar:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_enabled)
  {
    id v5 = _STUIStatusBar_Log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1D7E39000, v5, OS_LOG_TYPE_DEBUG, "perform %@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v35 = 0x2020000000;
    uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
    id v6 = [(STUIStatusBarAnimation *)self subAnimations];
    id v7 = STUIStatusBarGetPriorityComparator();
    id v8 = [v6 sortedArrayUsingComparator:v7];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __46__STUIStatusBarAnimation_performForStatusBar___block_invoke;
    v30[3] = &unk_1E6AA48A8;
    v30[4] = self;
    id v9 = v4;
    id v31 = v9;
    p_long long buf = &buf;
    [v8 enumerateObjectsUsingBlock:v30];
    [(id)_statusBarRunningAnimations addObject:self];
    if (self->_displayItemIdentifier)
    {
      id v10 = objc_msgSend(v9, "displayItemWithIdentifier:");
    }
    else
    {
      id v10 = 0;
    }
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__STUIStatusBarAnimation_performForStatusBar___block_invoke_2;
    aBlock[3] = &unk_1E6AA48D0;
    aBlock[4] = self;
    aBlock[5] = v28;
    uint64_t v11 = _Block_copy(aBlock);
    (*((void (**)(void))self->_animationBlock + 2))();
    double timeout = self->_timeout;
    if (timeout > 0.0)
    {
      dispatch_time_t v13 = dispatch_time(0, (uint64_t)(timeout * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__STUIStatusBarAnimation_performForStatusBar___block_invoke_23;
      block[3] = &unk_1E6AA48F8;
      long long v26 = v28;
      block[4] = self;
      id v25 = v11;
      dispatch_after(v13, MEMORY[0x1E4F14428], block);
    }
    uint64_t v14 = *(void *)(*((void *)&buf + 1) + 24);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = [v8 count];
      objc_msgSend(v8, "subarrayWithRange:", v14, v15 - *(void *)(*((void *)&buf + 1) + 24));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v33 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v16);
            }
            objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "performForStatusBar:", v9, (void)v20);
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v33 count:16];
        }
        while (v17);
      }
    }
    _Block_object_dispose(v28, 8);

    _Block_object_dispose(&buf, 8);
  }
}

- (int64_t)type
{
  return self->_type;
}

- (void)setTimeoutBlock:(id)a3
{
}

- (void)addTimeout:(double)a3 withHandler:(id)a4
{
  if (self->_timeout == 0.0)
  {
    self->_double timeout = a3;
    [(STUIStatusBarAnimation *)self setTimeoutBlock:a4];
  }
}

void __57__STUIStatusBarAnimation_prepareAnimations_forStatusBar___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = v4;
  while ([v4 count])
  {
    id v5 = [v6 anyObject];
    [v5 _prepareForStatusBar:a1[4] preparingAnimations:a1[5] exclusiveAnimations:a1[6]];

    id v4 = v6;
  }
}

- (void)_prepareForStatusBar:(id)a3 preparingAnimations:(id)a4 exclusiveAnimations:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _STUIStatusBar_Log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    v44 = self;
    _os_log_impl(&dword_1D7E39000, v11, OS_LOG_TYPE_DEBUG, "prepare %@", buf, 0xCu);
  }

  if (!self->_displayItemIdentifier)
  {
    dispatch_time_t v13 = 0;
    goto LABEL_17;
  }
  uint64_t v12 = objc_msgSend(v9, "objectForKeyedSubscript:");
  dispatch_time_t v13 = v12;
  if (!v12)
  {
LABEL_17:
    if (self->_exclusivityGroupIdentifier
      && (objc_msgSend(v10, "objectForKeyedSubscript:"), (long long v20 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v14 = v20;
      uint64_t v21 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v14);
            }
            id v25 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (objc_msgSend(v25, "priority", (void)v33) > self->_priority)
            {
              [v25 _prepareForStatusBar:v8 preparingAnimations:v9 exclusiveAnimations:v10];
              if ([v25 isEnabled])
              {
                uint64_t v30 = v14;
                goto LABEL_46;
              }
            }
          }
          uint64_t v22 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      id v14 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAnimation);

    if (WeakRetained)
    {
      id v27 = objc_loadWeakRetained((id *)&self->_parentAnimation);
      [v27 _prepareForStatusBar:v8 preparingAnimations:v9 exclusiveAnimations:v10];

      id v28 = objc_loadWeakRetained((id *)&self->_parentAnimation);
      LODWORD(v27) = [v28 isEnabled];

      if (!v27) {
        goto LABEL_47;
      }
    }
    if (self->_displayItemIdentifier)
    {
      char v29 = objc_msgSend(v8, "stateForDisplayItemWithIdentifier:");
      uint64_t v30 = [v29 displayItem];
      self->_enabled = [v29 prepareAnimation:self];

      if (!self->_enabled) {
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v30 = 0;
      self->_enabled = 1;
    }
    prepareBlock = (uint64_t (**)(id, STUIStatusBarAnimation *, void *))self->_prepareBlock;
    if (prepareBlock && (prepareBlock[2](prepareBlock, self, v30) & 1) == 0) {
      [(STUIStatusBarAnimation *)self cancel];
    }
    if (self->_enabled && self->_displayItemIdentifier) {
      [v13 removeAllObjects];
    }
LABEL_43:
    long long v32 = _STUIStatusBar_Log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      v44 = self;
      _os_log_impl(&dword_1D7E39000, v32, OS_LOG_TYPE_DEBUG, "prepared %@", buf, 0xCu);
    }

LABEL_46:
LABEL_47:

    goto LABEL_48;
  }
  if ([v12 containsObject:self])
  {
    [v13 removeObject:self];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = (id)[v13 copy];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v38;
LABEL_8:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * v18);
        if ([v19 priority] > self->_priority)
        {
          [v19 _prepareForStatusBar:v8 preparingAnimations:v9 exclusiveAnimations:v10];
          if ([v19 isEnabled]) {
            goto LABEL_47;
          }
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
          if (v16) {
            goto LABEL_8;
          }
          break;
        }
      }
    }

    goto LABEL_17;
  }
LABEL_48:
}

- (void)cancel
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_enabled)
  {
    BOOL v3 = _STUIStatusBar_Log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v25 = self;
      _os_log_impl(&dword_1D7E39000, v3, OS_LOG_TYPE_DEBUG, "cancel %@", buf, 0xCu);
    }

    self->_enabled = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = self->_completionHandlers;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v6);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = [(STUIStatusBarAnimation *)self subAnimations];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) cancel];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

- (void)addCompletionHandler:(id)a3
{
  id v4 = a3;
  completionHandlers = self->_completionHandlers;
  aBlock = v4;
  if (!completionHandlers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_completionHandlers;
    self->_completionHandlers = v6;

    id v4 = aBlock;
    completionHandlers = self->_completionHandlers;
  }
  uint64_t v8 = _Block_copy(v4);
  [(NSMutableArray *)completionHandlers addObject:v8];
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong(&self->_timeoutBlock, 0);
  objc_storeStrong(&self->_animationBlock, 0);
  objc_destroyWeak((id *)&self->_parentAnimation);
  objc_storeStrong((id *)&self->_subAnimations, 0);
  objc_storeStrong((id *)&self->_delayedDisplayItemPlacements, 0);
  objc_storeStrong((id *)&self->_delayedItemIdentifiers, 0);
  objc_storeStrong(&self->_prepareBlock, 0);
  objc_storeStrong((id *)&self->_exclusivityGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayItemIdentifier, 0);
}

- (void)addTotalCompletionHandler:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = dispatch_group_create();
  v7[0] = self;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  +[STUIStatusBarAnimation _addAnimations:v6 toDispatchGroup:v5];

  dispatch_group_notify(v5, MEMORY[0x1E4F14428], v4);
}

void __46__STUIStatusBarAnimation_performForStatusBar___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
    uint64_t v5 = _STUIStatusBar_Log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 67109378;
      int v19 = a2;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1D7E39000, v5, OS_LOG_TYPE_DEBUG, "perform completed (finished: %d) for %@", buf, 0x12u);
    }

    [(id)_statusBarRunningAnimations removeObject:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v7 + 10))
    {
      *(unsigned char *)(v7 + 10) = 0;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = *(id *)(*(void *)(a1 + 32) + 120);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * i));
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
  }
}

void __57__STUIStatusBarAnimation__addAnimations_toDispatchGroup___block_invoke(uint64_t a1)
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v3 = _statusBarRunningAnimations;
    _statusBarRunningAnimations = v2;
    MEMORY[0x1F41817F8](v2, v3);
  }
}

uint64_t __46__STUIStatusBarAnimation_performForStatusBar___block_invoke_23(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    uint64_t v2 = _STUIStatusBar_Log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D7E39000, v2, OS_LOG_TYPE_FAULT, "Status bar animation took longer than expected and was ended early.", v4, 2u);
    }

    uint64_t v3 = *(void *)(*(void *)(v1 + 32) + 112);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[(STUIStatusBarAnimation *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STUIStatusBarAnimation *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(STUIStatusBarAnimation *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(STUIStatusBarAnimation *)self displayItemIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"displayItemIdentifier" skipIfNil:1];

  uint64_t v6 = [(STUIStatusBarAnimation *)self identifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"identifier" skipIfNil:1];

  unint64_t v8 = [(STUIStatusBarAnimation *)self type];
  if (v8 > 3) {
    uint64_t v9 = @"(unknown)";
  }
  else {
    uint64_t v9 = off_1E6AA4918[v8];
  }
  [v3 appendString:v9 withName:@"type"];
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarAnimation isEnabled](self, "isEnabled"), @"enabled");
  id v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[STUIStatusBarAnimation priority](self, "priority"), @"priority");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STUIStatusBarAnimation *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STUIStatusBarAnimation *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarAnimation *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(STUIStatusBarAnimation *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  unint64_t v8 = [(STUIStatusBarAnimation *)self delayedItemIdentifiers];
  uint64_t v9 = [v8 allObjects];
  [v7 appendArraySection:v9 withName:@"delayedItemIdentifiers" skipIfEmpty:1];

  id v10 = [(STUIStatusBarAnimation *)self subAnimations];
  [v7 appendArraySection:v10 withName:@"subAnimations" skipIfEmpty:1];

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setExclusivityGroupIdentifier:(id)a3
{
}

- (id)prepareBlock
{
  return self->_prepareBlock;
}

- (BOOL)delaysAnimatingItems
{
  return self->_delaysAnimatingItems;
}

- (BOOL)delaysDependentItems
{
  return self->_delaysDependentItems;
}

- (void)setDelaysDependentItems:(BOOL)a3
{
  self->_delaysDependentItems = a3;
}

- (void)setSubAnimations:(id)a3
{
}

- (STUIStatusBarAnimation)parentAnimation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAnimation);
  return (STUIStatusBarAnimation *)WeakRetained;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_double timeout = a3;
}

- (id)animationBlock
{
  return self->_animationBlock;
}

- (id)timeoutBlock
{
  return self->_timeoutBlock;
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end