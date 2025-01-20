@interface _UIStatusBarAnimation
+ (_UIStatusBarAnimation)animationWithBlock:(id)a3;
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
- (NSString)exclusivityGroupIdentifier;
- (NSString)identifier;
- (_UIStatusBarAnimation)parentAnimation;
- (_UIStatusBarIdentifier)displayItemIdentifier;
- (double)timeout;
- (id)_dependentItemIdentifiersEnabledOnly:(BOOL)a3;
- (id)animationBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)prepareBlock;
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

@implementation _UIStatusBarAnimation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
    v3 = (void *)_statusBarRunningAnimations;
    _statusBarRunningAnimations = v2;
  }
}

+ (_UIStatusBarAnimation)animationWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setAnimationBlock:v4];

  v6 = [MEMORY[0x1E4F1CAD0] set];
  [v5 setDelayedItemIdentifiers:v6];

  v7 = [MEMORY[0x1E4F1CAD0] set];
  [v5 setDelayedDisplayItemPlacements:v7];

  return (_UIStatusBarAnimation *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = _Block_copy(self->_animationBlock);
  v6 = (void *)v4[13];
  v4[13] = v5;

  v7 = _Block_copy(self->_prepareBlock);
  v8 = (void *)v4[7];
  v4[7] = v7;

  v4[6] = self->_type;
  *((unsigned char *)v4 + 10) = self->_enabled;
  v4[2] = self->_priority;
  uint64_t v9 = [(NSString *)self->_identifier copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_exclusivityGroupIdentifier copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(_UIStatusBarIdentifier *)self->_displayItemIdentifier copy];
  v14 = (void *)v4[3];
  v4[3] = v13;

  uint64_t v15 = [(NSSet *)self->_delayedItemIdentifiers copy];
  v16 = (void *)v4[8];
  v4[8] = v15;

  uint64_t v17 = [(NSSet *)self->_delayedDisplayItemPlacements copy];
  v18 = (void *)v4[9];
  v4[9] = v17;

  *((unsigned char *)v4 + 8) = self->_delaysAnimatingItems;
  *((unsigned char *)v4 + 9) = self->_delaysDependentItems;
  v4[12] = *(void *)&self->_timeout;
  v19 = _Block_copy(self->_timeoutBlock);
  v20 = (void *)v4[14];
  v4[14] = v19;

  return v4;
}

- (void)addCompletionHandler:(id)a3
{
  id v4 = a3;
  completionHandlers = self->_completionHandlers;
  aBlock = v4;
  if (!completionHandlers)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_completionHandlers;
    self->_completionHandlers = v6;

    id v4 = aBlock;
    completionHandlers = self->_completionHandlers;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)completionHandlers addObject:v8];
}

- (void)addTotalCompletionHandler:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = dispatch_group_create();
  v7[0] = self;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  +[_UIStatusBarAnimation _addAnimations:v6 toDispatchGroup:v5];

  dispatch_group_notify(v5, MEMORY[0x1E4F14428], v4);
}

+ (void)prepareAnimations:(id)a3 forStatusBar:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  uint64_t v9 = [v7 dictionary];
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
  [a1 _addAnimations:v8 toPreparingAnimations:v9 exclusiveAnimations:v10 visitedDisplayItemIdentifiers:v11];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56___UIStatusBarAnimation_prepareAnimations_forStatusBar___block_invoke;
  v15[3] = &unk_1E5307588;
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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v9;
  uint64_t v13 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v32 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
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

        uint64_t v21 = [v16 displayItemIdentifier];
        if (v21)
        {
          v22 = (void *)v21;
          int v23 = [v12 containsObject:v20];

          if (v23)
          {
            v29 = [MEMORY[0x1E4F28B00] currentHandler];
            [v29 handleFailureInMethod:a2, a1, @"_UIStatusBarAnimation.m", 115, @"Several animations are targeting the same display item with identifier %@ in the same tree", v20 object file lineNumber description];
          }
        }
        v24 = [v10 objectForKeyedSubscript:v20];
        if (!v24)
        {
          v24 = [MEMORY[0x1E4F1CA80] set];
          [v10 setObject:v24 forKeyedSubscript:v20];
        }
        [v24 addObject:v16];
        v25 = [v16 exclusivityGroupIdentifier];
        if (v25)
        {
          v26 = [v11 objectForKeyedSubscript:v25];
          if (!v26)
          {
            v26 = [MEMORY[0x1E4F1CA80] set];
            [v11 setObject:v26 forKeyedSubscript:v25];
          }
          [v26 addObject:v16];
        }
        v27 = [v16 subAnimations];
        v28 = [v12 setByAddingObject:v20];
        [a1 _addAnimations:v27 toPreparingAnimations:v10 exclusiveAnimations:v11 visitedDisplayItemIdentifiers:v28];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v14);
  }
}

- (void)_prepareForStatusBar:(id)a3 preparingAnimations:(id)a4 exclusiveAnimations:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_displayItemIdentifier)
  {
    id v12 = 0;
    goto LABEL_15;
  }
  id v11 = objc_msgSend(v9, "objectForKeyedSubscript:");
  id v12 = v11;
  if (!v11)
  {
LABEL_15:
    if (self->_exclusivityGroupIdentifier
      && (objc_msgSend(v10, "objectForKeyedSubscript:"), (id v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v13 = v19;
      uint64_t v20 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v32 != v22) {
              objc_enumerationMutation(v13);
            }
            v24 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (objc_msgSend(v24, "priority", (void)v31) > self->_priority)
            {
              [v24 _prepareForStatusBar:v8 preparingAnimations:v9 exclusiveAnimations:v10];
              if ([v24 isEnabled])
              {
                v29 = v13;
                goto LABEL_41;
              }
            }
          }
          uint64_t v21 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      id v13 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAnimation);

    if (WeakRetained)
    {
      id v26 = objc_loadWeakRetained((id *)&self->_parentAnimation);
      [v26 _prepareForStatusBar:v8 preparingAnimations:v9 exclusiveAnimations:v10];

      id v27 = objc_loadWeakRetained((id *)&self->_parentAnimation);
      LODWORD(v26) = [v27 isEnabled];

      if (!v26) {
        goto LABEL_42;
      }
    }
    if (self->_displayItemIdentifier)
    {
      v28 = objc_msgSend(v8, "stateForDisplayItemWithIdentifier:");
      v29 = [v28 displayItem];
      self->_enabled = [v28 prepareAnimation:self];

      if (!self->_enabled)
      {
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
    }
    else
    {
      v29 = 0;
      self->_enabled = 1;
    }
    prepareBlock = (uint64_t (**)(id, _UIStatusBarAnimation *, void *))self->_prepareBlock;
    if (prepareBlock && (prepareBlock[2](prepareBlock, self, v29) & 1) == 0) {
      [(_UIStatusBarAnimation *)self cancel];
    }
    if (self->_enabled && self->_displayItemIdentifier) {
      [v12 removeAllObjects];
    }
    goto LABEL_41;
  }
  if ([v11 containsObject:self])
  {
    [v12 removeObject:self];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v13 = (id)[v12 copy];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
LABEL_6:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v35 + 1) + 8 * v17);
        if ([v18 priority] > self->_priority)
        {
          [v18 _prepareForStatusBar:v8 preparingAnimations:v9 exclusiveAnimations:v10];
          if ([v18 isEnabled]) {
            goto LABEL_42;
          }
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v15) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    goto LABEL_15;
  }
LABEL_43:
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
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 isEnabled])
        {
          dispatch_group_enter(v7);
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __56___UIStatusBarAnimation__addAnimations_toDispatchGroup___block_invoke;
          v14[3] = &unk_1E52DC698;
          uint64_t v15 = v7;
          [v12 addCompletionHandler:v14];
        }
        id v13 = [v12 subAnimations];
        [a1 _addAnimations:v13 toDispatchGroup:v7];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)performForStatusBar:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_enabled)
  {
    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
    id v5 = [(_UIStatusBarAnimation *)self subAnimations];
    id v6 = _UIStatusBarGetPriorityComparator();
    v7 = [v5 sortedArrayUsingComparator:v6];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __45___UIStatusBarAnimation_performForStatusBar___block_invoke;
    v29[3] = &unk_1E53075B0;
    v29[4] = self;
    id v8 = v4;
    id v30 = v8;
    long long v31 = &v32;
    [v7 enumerateObjectsUsingBlock:v29];
    [(id)_statusBarRunningAnimations addObject:self];
    if (self->_displayItemIdentifier)
    {
      uint64_t v9 = objc_msgSend(v8, "displayItemWithIdentifier:");
    }
    else
    {
      uint64_t v9 = 0;
    }
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    char v28 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __45___UIStatusBarAnimation_performForStatusBar___block_invoke_2;
    aBlock[3] = &unk_1E52E5B98;
    aBlock[4] = self;
    aBlock[5] = v27;
    uint64_t v10 = _Block_copy(aBlock);
    (*((void (**)(void))self->_animationBlock + 2))();
    double timeout = self->_timeout;
    if (timeout > 0.0)
    {
      dispatch_time_t v12 = dispatch_time(0, (uint64_t)(timeout * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45___UIStatusBarAnimation_performForStatusBar___block_invoke_3;
      block[3] = &unk_1E53075D8;
      v25 = v27;
      block[4] = self;
      id v24 = v10;
      dispatch_after(v12, MEMORY[0x1E4F14428], block);
    }
    uint64_t v13 = v33[3];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = [v7 count];
      objc_msgSend(v7, "subarrayWithRange:", v13, v14 - v33[3]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v36 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v20 != v17) {
              objc_enumerationMutation(v15);
            }
            objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "performForStatusBar:", v8, (void)v19);
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v36 count:16];
        }
        while (v16);
      }
    }
    _Block_object_dispose(v27, 8);

    _Block_object_dispose(&v32, 8);
  }
}

- (void)addTimeout:(double)a3 withHandler:(id)a4
{
  if (self->_timeout == 0.0)
  {
    self->_double timeout = a3;
    [(_UIStatusBarAnimation *)self setTimeoutBlock:a4];
  }
}

- (void)cancel
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_enabled)
  {
    self->_enabled = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v3 = self->_completionHandlers;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v5);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = [(_UIStatusBarAnimation *)self subAnimations];
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
          [*(id *)(*((void *)&v13 + 1) + 8 * v12++) cancel];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (void)addSubAnimation:(id)a3 forDisplayItemWithIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = (_UIStatusBarIdentifier *)a4;
  uint64_t v9 = v8;
  if (v8 && self->_displayItemIdentifier == v8)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UIStatusBarAnimation.m" lineNumber:343 description:@"Can't add a sub-animation for the same display item"];
  }
  if (self->_enabled)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UIStatusBarAnimation.m" lineNumber:344 description:@"Sub-animations can't be added during prepare"];
  }
  if (!self->_subAnimations)
  {
    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    subAnimations = self->_subAnimations;
    self->_subAnimations = v10;
  }
  id v14 = (id)[v7 copy];

  [v14 setDisplayItemIdentifier:v9];
  [v14 setParentAnimation:self];
  [(NSMutableArray *)self->_subAnimations addObject:v14];
}

- (NSMutableArray)subAnimations
{
  return self->_subAnimations;
}

- (NSSet)effectiveDelayedItemIdentifiers
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_enabled)
  {
    v3 = [(_UIStatusBarAnimation *)self delayedItemIdentifiers];
    uint64_t v4 = (void *)[v3 mutableCopy];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v5 = [(_UIStatusBarAnimation *)self delayedDisplayItemPlacements];
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
          uint64_t v11 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:v10];
          [v4 addObject:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    if (self->_delaysDependentItems || self->_delaysAnimatingItems)
    {
      uint64_t v12 = [(_UIStatusBarAnimation *)self _dependentItemIdentifiersEnabledOnly:!self->_delaysDependentItems];
      [v4 unionSet:v12];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v13 = [(_UIStatusBarAnimation *)self subAnimations];
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
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v4;
}

- (id)_dependentItemIdentifiersEnabledOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 && !self->_enabled)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    if (self->_displayItemIdentifier)
    {
      uint64_t v6 = +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:");
      [v5 addObject:v6];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [(_UIStatusBarAnimation *)self subAnimations];
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

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = NSStringFromSelector(sel_displayItemIdentifier);
  long long v13 = v3;
  uint64_t v4 = NSStringFromSelector(sel_identifier);
  long long v14 = v4;
  uint64_t v5 = NSStringFromSelector(sel_type);
  long long v15 = v5;
  uint64_t v6 = NSStringFromSelector(sel_enabled);
  long long v16 = v6;
  uint64_t v7 = NSStringFromSelector(sel_priority);
  long long v17 = v7;
  uint64_t v8 = NSStringFromSelector(sel_delayedItemIdentifiers);
  long long v18 = v8;
  uint64_t v9 = NSStringFromSelector(sel_subAnimations);
  uint64_t v19 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:7];
  uint64_t v11 = +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v10, v13, v14, v15, v16, v17, v18);

  return v11;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (_UIStatusBarIdentifier)displayItemIdentifier
{
  return self->_displayItemIdentifier;
}

- (void)setDisplayItemIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)exclusivityGroupIdentifier
{
  return self->_exclusivityGroupIdentifier;
}

- (void)setExclusivityGroupIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)prepareBlock
{
  return self->_prepareBlock;
}

- (void)setPrepareBlock:(id)a3
{
}

- (NSSet)delayedItemIdentifiers
{
  return self->_delayedItemIdentifiers;
}

- (void)setDelayedItemIdentifiers:(id)a3
{
}

- (NSSet)delayedDisplayItemPlacements
{
  return self->_delayedDisplayItemPlacements;
}

- (void)setDelayedDisplayItemPlacements:(id)a3
{
}

- (BOOL)delaysAnimatingItems
{
  return self->_delaysAnimatingItems;
}

- (void)setDelaysAnimatingItems:(BOOL)a3
{
  self->_delaysAnimatingItems = a3;
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

- (_UIStatusBarAnimation)parentAnimation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAnimation);
  return (_UIStatusBarAnimation *)WeakRetained;
}

- (void)setParentAnimation:(id)a3
{
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

- (void)setAnimationBlock:(id)a3
{
}

- (id)timeoutBlock
{
  return self->_timeoutBlock;
}

- (void)setTimeoutBlock:(id)a3
{
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
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

@end