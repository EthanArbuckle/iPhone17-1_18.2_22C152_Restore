@interface _UINavigationBarItemStack
- (BOOL)isPopping;
- (BOOL)isPushing;
- (BOOL)isPushingOrPopping;
- (BOOL)stackItemsAreEqualTo:(id)a3;
- (NSArray)items;
- (UINavigationItem)backItem;
- (UINavigationItem)previousBackItem;
- (UINavigationItem)previousTopItem;
- (UINavigationItem)topItem;
- (_UINavigationBarItemStack)init;
- (_UINavigationBarItemStack)initWithItems:(id)a3;
- (_UINavigationBarItemStackEntry)backEntry;
- (_UINavigationBarItemStackEntry)previousBackEntry;
- (_UINavigationBarItemStackEntry)previousTopEntry;
- (_UINavigationBarItemStackEntry)topEntry;
- (_UINavigationBarTransitionAssistant)transitionAssistant;
- (_UINavigationItemChangeObserver)changeObserver;
- (id)_shim_popNestedNavigationItem;
- (id)description;
- (int)state;
- (int64_t)_effectiveDisplayModeForItem:(id)a3 inStack:(id)a4;
- (int64_t)effectiveDisplayModeForItemInCurrentStack:(id)a3;
- (int64_t)effectiveDisplayModeForItemInPreviousStack:(id)a3;
- (int64_t)itemCount;
- (void)_cleanupTransitionAssistant;
- (void)_completeTransition;
- (void)_prepareTransitionWithAssistant:(id)a3;
- (void)_shim_pushNestedNavigationItem:(id)a3;
- (void)_updateChangeObserversFor:(id)a3;
- (void)beginInteractiveTransition;
- (void)cancelOperation;
- (void)completeOperation;
- (void)endInteractiveTransition;
- (void)iterateEntries:(id)a3;
- (void)iterateItems:(id)a3;
- (void)popItemWithTransitionAssistant:(id)a3;
- (void)pushItem:(id)a3 withTransitionAssistant:(id)a4;
- (void)reverseIterateEntries:(id)a3;
- (void)setChangeObserver:(id)a3;
- (void)setItems:(id)a3 withTransitionAssistant:(id)a4;
@end

@implementation _UINavigationBarItemStack

- (int64_t)effectiveDisplayModeForItemInCurrentStack:(id)a3
{
  if (a3)
  {
    return -[_UINavigationBarItemStack _effectiveDisplayModeForItem:inStack:](self, "_effectiveDisplayModeForItem:inStack:");
  }
  else
  {
    v5 = [(_UINavigationBarItemStack *)self topItem];
    int64_t v6 = [(_UINavigationBarItemStack *)self _effectiveDisplayModeForItem:v5 inStack:self->_items];

    return v6;
  }
}

- (UINavigationItem)topItem
{
  v2 = [(_UINavigationBarItemStack *)self topEntry];
  v3 = [v2 item];

  return (UINavigationItem *)v3;
}

- (_UINavigationBarItemStackEntry)topEntry
{
  return (_UINavigationBarItemStackEntry *)[(NSMutableArray *)self->_items lastObject];
}

- (int64_t)_effectiveDisplayModeForItem:(id)a3 inStack:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "item", (void)v16);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v12 largeTitleDisplayMode];
        if (v13) {
          int64_t v9 = v13;
        }

        if (v12 == v5)
        {

          goto LABEL_16;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  uint64_t v14 = [v5 largeTitleDisplayMode];
  if (v14) {
    int64_t v9 = v14;
  }
LABEL_16:

  return v9;
}

- (UINavigationItem)previousTopItem
{
  v2 = [(_UINavigationBarItemStack *)self previousTopEntry];
  v3 = [v2 item];

  return (UINavigationItem *)v3;
}

- (_UINavigationBarItemStackEntry)previousTopEntry
{
  return (_UINavigationBarItemStackEntry *)[(NSArray *)self->_previousItems lastObject];
}

- (int64_t)itemCount
{
  return [(NSMutableArray *)self->_items count];
}

- (BOOL)isPushing
{
  return self->_state == 1;
}

- (BOOL)isPopping
{
  return self->_state == 2;
}

- (UINavigationItem)backItem
{
  v2 = [(_UINavigationBarItemStack *)self backEntry];
  v3 = [v2 item];

  return (UINavigationItem *)v3;
}

- (_UINavigationBarItemStackEntry)backEntry
{
  uint64_t v3 = [(NSMutableArray *)self->_items count];
  if (v3 < 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSMutableArray *)self->_items objectAtIndexedSubscript:v3 - 2];
  }
  return (_UINavigationBarItemStackEntry *)v4;
}

- (UINavigationItem)previousBackItem
{
  v2 = [(_UINavigationBarItemStack *)self previousBackEntry];
  uint64_t v3 = [v2 item];

  return (UINavigationItem *)v3;
}

- (_UINavigationBarItemStackEntry)previousBackEntry
{
  uint64_t v3 = [(NSArray *)self->_previousItems count];
  if (v3 < 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSArray *)self->_previousItems objectAtIndexedSubscript:v3 - 2];
  }
  return (_UINavigationBarItemStackEntry *)v4;
}

- (void)setChangeObserver:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_changeObserver, obj);
    [(_UINavigationBarItemStack *)self _updateChangeObserversFor:self->_items];
    id v5 = obj;
    if (self->_previousItems)
    {
      -[_UINavigationBarItemStack _updateChangeObserversFor:](self, "_updateChangeObserversFor:");
      id v5 = obj;
    }
  }
}

- (_UINavigationBarItemStack)initWithItems:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarItemStack;
  id v5 = [(_UINavigationBarItemStack *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    items = v5->_items;
    v5->_items = (NSMutableArray *)v6;

    _WrapItemsAndAddToArray(v5->_items, v4);
    uint64_t v8 = [(_UINavigationBarItemStack *)v5 topItem];
    [v8 _movingToTopOfStack];
    [v8 _movedToTopOfStack:1];
  }
  return v5;
}

- (NSArray)items
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_items;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "item", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (_UINavigationBarTransitionAssistant)transitionAssistant
{
  return self->_transitionAssistant;
}

- (void)completeOperation
{
  if (self->_state)
  {
    uint64_t v3 = [(_UINavigationBarItemStack *)self previousTopItem];
    [v3 _movedFromTopOfStack:1];

    id v4 = [(_UINavigationBarItemStack *)self topItem];
    [v4 _movedToTopOfStack:1];

    [(_UINavigationBarItemStack *)self _completeTransition];
  }
}

- (void)_completeTransition
{
  previousItems = self->_previousItems;
  self->_previousItems = 0;

  [(_UINavigationBarItemStack *)self _cleanupTransitionAssistant];
  self->_state = 0;
}

- (void)_cleanupTransitionAssistant
{
  int state = self->_state;
  BOOL v4 = [(_UINavigationBarTransitionAssistant *)self->_transitionAssistant needsLifetimeExtended];
  if (!state && !v4)
  {
    transitionAssistant = self->_transitionAssistant;
    self->_transitionAssistant = 0;
  }
}

- (void)setItems:(id)a3 withTransitionAssistant:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (self->_state) {
    NSLog(&cfstr_ChangingItemsW.isa);
  }
  uint64_t v7 = (NSArray *)[(NSMutableArray *)self->_items copy];
  previousItems = self->_previousItems;
  self->_previousItems = v7;

  [(NSMutableArray *)self->_items removeAllObjects];
  _WrapItemsAndAddToArray(self->_items, v9);
  [(_UINavigationBarItemStack *)self _prepareTransitionWithAssistant:v6];
  [(_UINavigationBarItemStack *)self _updateChangeObserversFor:self->_items];
  self->_int state = 3;
}

- (void)_updateChangeObserversFor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "item", (void)v12);
        [v11 _setChangeObserver:WeakRetained];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_prepareTransitionWithAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_transitionAssistant, a3);
  id v5 = a3;
  [(_UINavigationBarTransitionAssistant *)self->_transitionAssistant startInteractiveTransition];

  id v6 = [(_UINavigationBarItemStack *)self previousTopItem];
  [v6 _movingFromTopOfStack];

  id v7 = [(_UINavigationBarItemStack *)self topItem];
  [v7 _movingToTopOfStack];
}

- (BOOL)stackItemsAreEqualTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_items count];
  uint64_t v6 = v5;
  if (v4)
  {
    if (v5 == [v4 count])
    {
      if (v6 < 1)
      {
        BOOL v7 = 1;
      }
      else
      {
        BOOL v7 = 0;
        for (i = 0; i != v6; BOOL v7 = i >= v6)
        {
          uint64_t v9 = [(NSMutableArray *)self->_items objectAtIndexedSubscript:i];
          uint64_t v10 = [v4 objectAtIndexedSubscript:i];
          char v11 = [v9 isEqual:v10];

          if ((v11 & 1) == 0) {
            break;
          }
          ++i;
        }
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = v5 == 0;
  }

  return v7;
}

- (_UINavigationBarItemStack)init
{
  return [(_UINavigationBarItemStack *)self initWithItems:0];
}

- (int)state
{
  return self->_state;
}

- (void)iterateEntries:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_items;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)isPushingOrPopping
{
  if ([(_UINavigationBarItemStack *)self isPushing]) {
    return 1;
  }
  return [(_UINavigationBarItemStack *)self isPopping];
}

- (void)pushItem:(id)a3 withTransitionAssistant:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (self->_state) {
    NSLog(&cfstr_NestedPushAnim.isa);
  }
  uint64_t v7 = (NSArray *)[(NSMutableArray *)self->_items copy];
  previousItems = self->_previousItems;
  self->_previousItems = v7;

  items = self->_items;
  id v10 = +[_UINavigationBarItemStackEntry newEntryForItem:v11];
  [(NSMutableArray *)items addObject:v10];

  [(_UINavigationBarItemStack *)self _prepareTransitionWithAssistant:v6];
  [(_UINavigationBarItemStack *)self _updateChangeObserversFor:self->_items];
  self->_int state = 1;
}

- (void)iterateItems:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42___UINavigationBarItemStack_iterateItems___block_invoke;
  v6[3] = &unk_1E52DE1D0;
  id v7 = v4;
  id v5 = v4;
  [(_UINavigationBarItemStack *)self iterateEntries:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionAssistant, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_previousItems, 0);
}

- (void)popItemWithTransitionAssistant:(id)a3
{
  id v6 = a3;
  if (self->_state) {
    NSLog(&cfstr_NestedPopAnima.isa);
  }
  id v4 = (NSArray *)[(NSMutableArray *)self->_items copy];
  previousItems = self->_previousItems;
  self->_previousItems = v4;

  [(NSMutableArray *)self->_items removeLastObject];
  [(_UINavigationBarItemStack *)self _prepareTransitionWithAssistant:v6];
  self->_int state = 2;
}

- (void)cancelOperation
{
  if (self->_state)
  {
    uint64_t v3 = [(_UINavigationBarItemStack *)self previousTopItem];
    [v3 _movedFromTopOfStack:0];

    id v4 = [(_UINavigationBarItemStack *)self topItem];
    [v4 _movedToTopOfStack:0];

    [(NSMutableArray *)self->_items setArray:self->_previousItems];
    [(_UINavigationBarItemStack *)self _completeTransition];
  }
}

- (void)beginInteractiveTransition
{
}

- (void)endInteractiveTransition
{
  [(_UINavigationBarTransitionAssistant *)self->_transitionAssistant setNeedsLifetimeExtended:0];
  [(_UINavigationBarItemStack *)self _cleanupTransitionAssistant];
}

- (void)_shim_pushNestedNavigationItem:(id)a3
{
  id v4 = a3;
  id v7 = [(_UINavigationBarItemStack *)self topItem];
  [v7 _movingFromTopOfStack];
  [v4 _movingToTopOfStack];
  items = self->_items;
  id v6 = +[_UINavigationBarItemStackEntry entryForItem:v4 replaceExistingWithNew:0];
  [(NSMutableArray *)items addObject:v6];

  [v7 _movedFromTopOfStack:1];
  [v4 _movedToTopOfStack:1];
}

- (id)_shim_popNestedNavigationItem
{
  uint64_t v3 = [(_UINavigationBarItemStack *)self topItem];
  id v4 = [(_UINavigationBarItemStack *)self backItem];
  [v3 _movingFromTopOfStack];
  [v4 _movingToTopOfStack];
  [(NSMutableArray *)self->_items removeLastObject];
  [v3 _movedFromTopOfStack:1];
  [v4 _movedToTopOfStack:1];

  return v3;
}

- (void)reverseIterateEntries:(id)a3
{
  id v4 = a3;
  items = self->_items;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___UINavigationBarItemStack_reverseIterateEntries___block_invoke;
  v7[3] = &unk_1E52DE1F8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)items enumerateObjectsWithOptions:2 usingBlock:v7];
}

- (int64_t)effectiveDisplayModeForItemInPreviousStack:(id)a3
{
  if (a3)
  {
    return -[_UINavigationBarItemStack _effectiveDisplayModeForItem:inStack:](self, "_effectiveDisplayModeForItem:inStack:");
  }
  else
  {
    id v5 = [(_UINavigationBarItemStack *)self previousTopItem];
    int64_t v6 = [(_UINavigationBarItemStack *)self _effectiveDisplayModeForItem:v5 inStack:self->_previousItems];

    return v6;
  }
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)_UINavigationBarItemStack;
  uint64_t v3 = [(_UINavigationBarItemStack *)&v12 description];
  id v4 = (void *)[v3 mutableCopy];

  unsigned int v5 = self->_state - 1;
  if (v5 >= 3)
  {
    id v8 = [(_UINavigationBarItemStack *)self topEntry];
    uint64_t v9 = [(_UINavigationBarItemStack *)self backEntry];
    objc_msgSend(v4, "appendFormat:", @" topEntry=%p backEntry=%p items=%p", v8, v9, self->_items, v11);
  }
  else
  {
    [v4 appendString:off_1E52DE218[v5]];
    int64_t v6 = [(_UINavigationBarItemStack *)self topEntry];
    id v7 = [(_UINavigationBarItemStack *)self backEntry];
    objc_msgSend(v4, "appendFormat:", @" topEntry=%p backEntry=%p items=%p", v6, v7, self->_items);

    id v8 = [(_UINavigationBarItemStack *)self previousTopEntry];
    uint64_t v9 = [(_UINavigationBarItemStack *)self previousBackEntry];
    objc_msgSend(v4, "appendFormat:", @" previousTopEntry=%p previousBackEntry=%p previousItems=%p transitionAssistant=%p", v8, v9, self->_previousItems, self->_transitionAssistant);
  }

  return v4;
}

- (_UINavigationItemChangeObserver)changeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  return (_UINavigationItemChangeObserver *)WeakRetained;
}

@end