@interface UIDynamicBehavior
+ (BOOL)_isPrimitiveBehavior;
+ (void)initialize;
- (BOOL)allowsAnimatorToStop;
- (NSArray)childBehaviors;
- (UIDynamicAnimator)dynamicAnimator;
- (UIDynamicBehavior)init;
- (id)_context;
- (id)_items;
- (id)_itemsDescription;
- (id)description;
- (id)items;
- (void)_addItem:(id)a3;
- (void)_associate;
- (void)_changedParameterForBody:(id)a3;
- (void)_detachAutolayoutFromItemIfNecessary:(id)a3;
- (void)_dissociate;
- (void)_reattachAutolayoutToItemIfNecessary:(id)a3;
- (void)_removeItem:(id)a3;
- (void)_setContext:(id)a3;
- (void)_setItems:(id)a3;
- (void)_updateAutolayoutEngagementForItemIfNecessary:(id)a3 detach:(BOOL)a4;
- (void)action;
- (void)addChildBehavior:(UIDynamicBehavior *)behavior;
- (void)removeChildBehavior:(UIDynamicBehavior *)behavior;
- (void)setAction:(void *)action;
- (void)willMoveToAnimator:(UIDynamicAnimator *)dynamicAnimator;
@end

@implementation UIDynamicBehavior

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _UISetupPhysicsKit();
  }
}

+ (BOOL)_isPrimitiveBehavior
{
  return 0;
}

- (void)_setContext:(id)a3
{
}

- (void)_setItems:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = self->_items;
  v7 = [(UIDynamicBehavior *)self _context];

  if (v7)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v21 = v6;
    v8 = v6;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      char v12 = 1;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if ([v5 containsObject:v14]) {
            char v12 = 0;
          }
          else {
            [(UIDynamicBehavior *)self _reattachAutolayoutToItemIfNecessary:v14];
          }
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }
    else
    {
      char v12 = 1;
    }

    objc_storeStrong((id *)&self->_items, a3);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v5;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * j);
          if ((v12 & 1) != 0
            || ([(NSMutableArray *)v8 containsObject:*(void *)(*((void *)&v22 + 1) + 8 * j)] & 1) == 0)
          {
            [(UIDynamicBehavior *)self _detachAutolayoutFromItemIfNecessary:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }

    v6 = v21;
  }
  else
  {
    objc_storeStrong((id *)&self->_items, a3);
  }
}

- (void)_addItem:(id)a3
{
  items = self->_items;
  id v5 = a3;
  [(NSMutableArray *)items addObject:v5];
  [(UIDynamicBehavior *)self _detachAutolayoutFromItemIfNecessary:v5];
}

- (void)_removeItem:(id)a3
{
  id v4 = a3;
  [(UIDynamicBehavior *)self _reattachAutolayoutToItemIfNecessary:v4];
  [(NSMutableArray *)self->_items removeObject:v4];
}

- (id)_items
{
  return self->_items;
}

- (id)_context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return WeakRetained;
}

- (UIDynamicAnimator)dynamicAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (UIDynamicAnimator *)WeakRetained;
}

- (id)items
{
  return 0;
}

- (UIDynamicBehavior)init
{
  v9.receiver = self;
  v9.super_class = (Class)UIDynamicBehavior;
  v2 = [(UIDynamicBehavior *)&v9 init];
  if (v2)
  {
    int v3 = [(id)objc_opt_class() _isPrimitiveBehavior];
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v3)
    {
      items = v2->_items;
      v2->_items = v4;
    }
    else
    {
      addedBehaviors = v2->_addedBehaviors;
      v2->_addedBehaviors = v4;

      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      items = v2->_behaviors;
      v2->_behaviors = v7;
    }
  }
  return v2;
}

- (void)willMoveToAnimator:(UIDynamicAnimator *)dynamicAnimator
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_items;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "_wantsAutolayout", (void)v12))
        {
          if (dynamicAnimator)
          {
            if (v9)
            {
              uint64_t v10 = [v9 _disableLayoutFlushingCount];
              if (v10 >= 1) {
                uint64_t v11 = v10 + 1;
              }
              else {
                uint64_t v11 = 1;
              }
              [v9 _setDisableLayoutFlushingCount:v11];
              [v9 _disableLayoutFlushing];
            }
          }
          else
          {
            -[UIView _popDisableLayoutFlushing](v9);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_updateAutolayoutEngagementForItemIfNecessary:(id)a3 detach:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  uint64_t v6 = [(UIDynamicBehavior *)self _context];

  uint64_t v7 = v12;
  if (v6)
  {
    char v8 = objc_opt_respondsToSelector();
    uint64_t v7 = v12;
    if (v8)
    {
      int v9 = [v12 _wantsAutolayout];
      uint64_t v7 = v12;
      if (v9)
      {
        if (v4)
        {
          if (!v12) {
            goto LABEL_12;
          }
          uint64_t v10 = [v12 _disableLayoutFlushingCount];
          if (v10 >= 1) {
            uint64_t v11 = v10 + 1;
          }
          else {
            uint64_t v11 = 1;
          }
          [v12 _setDisableLayoutFlushingCount:v11];
          [v12 _disableLayoutFlushing];
        }
        else
        {
          -[UIView _popDisableLayoutFlushing](v12);
        }
        uint64_t v7 = v12;
      }
    }
  }
LABEL_12:
}

- (void)_detachAutolayoutFromItemIfNecessary:(id)a3
{
}

- (void)_reattachAutolayoutToItemIfNecessary:(id)a3
{
}

- (void)_associate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v3 = self->_addedBehaviors;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        objc_msgSend(WeakRetained, "_checkBehavior:", v8, (void)v11);

        id v10 = objc_loadWeakRetained((id *)&self->_context);
        [v10 _registerBehavior:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_addedBehaviors removeAllObjects];
}

- (void)_dissociate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_addedBehaviors addObjectsFromArray:self->_behaviors];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v3 = self->_behaviors;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    p_context = &self->_context;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id WeakRetained = objc_loadWeakRetained((id *)p_context);
        objc_msgSend(WeakRetained, "_unregisterBehavior:", v9, (void)v11);

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (BOOL)allowsAnimatorToStop
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() _isPrimitiveBehavior]) {
    return 0;
  }
  if (![(NSMutableArray *)self->_behaviors count])
  {
    uint64_t v9 = [(UIDynamicBehavior *)self action];

    if (v9) {
      return 0;
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_behaviors;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    char v3 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (v3) {
          char v3 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "allowsAnimatorToStop", (void)v11);
        }
        else {
          char v3 = 0;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

- (void)addChildBehavior:(UIDynamicBehavior *)behavior
{
  uint64_t v7 = behavior;
  if ((-[NSMutableArray containsObject:](self->_behaviors, "containsObject:") & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_context);
      [v5 _checkBehavior:v7];

      id v6 = objc_loadWeakRetained((id *)&self->_context);
      [v6 _registerBehavior:v7];
    }
    else
    {
      [(NSMutableArray *)self->_addedBehaviors addObject:v7];
    }
    [(NSMutableArray *)self->_behaviors addObject:v7];
  }
}

- (void)removeChildBehavior:(UIDynamicBehavior *)behavior
{
  id v6 = behavior;
  if (-[NSMutableArray containsObject:](self->_behaviors, "containsObject:"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

    if (WeakRetained)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_context);
      [v5 _unregisterBehavior:v6];
    }
    else
    {
      [(NSMutableArray *)self->_addedBehaviors removeObject:v6];
    }
    [(NSMutableArray *)self->_behaviors removeObject:v6];
  }
}

- (NSArray)childBehaviors
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_behaviors];
}

- (void)_changedParameterForBody:(id)a3
{
  [a3 setResting:0];
  id v4 = [(UIDynamicBehavior *)self _context];
  [v4 _tickle];
}

- (id)_itemsDescription
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  char v3 = [(UIDynamicBehavior *)self _items];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(UIDynamicBehavior *)self _items];
    unint64_t v6 = [v5 count];

    if (v6 < 4)
    {
      id v10 = [MEMORY[0x1E4F1CA48] array];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v26 = self;
      long long v11 = [(UIDynamicBehavior *)self _items];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            uint64_t v17 = NSString;
            uint64_t v18 = (objc_class *)objc_opt_class();
            v19 = NSStringFromClass(v18);
            uint64_t v20 = [v17 stringWithFormat:@"%@:%p", v19, v16];
            [v10 addObject:v20];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v13);
      }

      v21 = NSString;
      long long v22 = [(UIDynamicBehavior *)v26 _items];
      uint64_t v23 = [v22 count];
      long long v24 = [v10 componentsJoinedByString:@", "];
      uint64_t v9 = [v21 stringWithFormat:@"(%lu items: [%@])", v23, v24];
    }
    else
    {
      uint64_t v7 = NSString;
      uint64_t v8 = [(UIDynamicBehavior *)self _items];
      objc_msgSend(v7, "stringWithFormat:", @"(%lu items)", objc_msgSend(v8, "count"));
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v9 = &stru_1ED0E84C0;
  }
  return v9;
}

- (id)description
{
  char v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)UIDynamicBehavior;
  uint64_t v4 = [(UIDynamicBehavior *)&v7 description];
  id v5 = [v3 stringWithString:v4];

  if ([(UIDynamicBehavior *)self allowsAnimatorToStop]) {
    [v5 appendString:@" (Stoppable)"];
  }
  if (self->_action) {
    [v5 appendString:@" (A)"];
  }
  return v5;
}

- (void)action
{
  return self->_action;
}

- (void)setAction:(void *)action
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_addedBehaviors, 0);
  objc_storeStrong((id *)&self->_behaviors, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end