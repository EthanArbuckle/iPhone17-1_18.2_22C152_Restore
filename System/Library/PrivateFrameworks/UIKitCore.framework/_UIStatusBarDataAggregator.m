@interface _UIStatusBarDataAggregator
+ (void)initialize;
- (Class)dataClass;
- (NSCountedSet)delayedKeys;
- (NSMutableDictionary)coalescedKeys;
- (NSMutableDictionary)coalescedTimers;
- (NSMutableDictionary)pendingUpdates;
- (NSSet)coalescedEntryKeys;
- (NSSet)delayedEntryKeys;
- (_UIStatusBarData)overlayData;
- (_UIStatusBarDataAggregator)initWithUpdateBlock:(id)a3;
- (id)_updatedDataFromData:(id)a3 delayedKeys:(id)a4;
- (id)updateBlock;
- (void)_coalescedUpdateForEntryKeys:(id)a3;
- (void)_updateForCoalescedKeysWithData:(id)a3;
- (void)_updateForDelayedKeysWithData:(id)a3;
- (void)_updateForOverlayWithData:(id)a3;
- (void)_updateFromPendingUpdatesForKeys:(id)a3 block:(id)a4;
- (void)beginCoalescingUpdatesForEntryKeys:(id)a3 delay:(double)a4;
- (void)beginDelayingUpdatesForEntryKeys:(id)a3;
- (void)endCoalescingUpdatesForEntryKeys:(id)a3;
- (void)endDelayingUpdatesForEntryKeys:(id)a3;
- (void)setCoalescedKeys:(id)a3;
- (void)setCoalescedTimers:(id)a3;
- (void)setDataClass:(Class)a3;
- (void)setDelayedKeys:(id)a3;
- (void)setOverlayData:(id)a3;
- (void)setPendingUpdates:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)updateWithData:(id)a3;
@end

@implementation _UIStatusBarDataAggregator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    v3 = (void *)_statusBarDelayedDataEntryKeys;
    _statusBarDelayedDataEntryKeys = (uint64_t)v2;
  }
}

- (_UIStatusBarDataAggregator)initWithUpdateBlock:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarDataAggregator;
  id v3 = a3;
  v4 = [(_UIStatusBarDataAggregator *)&v10 init];
  -[_UIStatusBarDataAggregator setUpdateBlock:](v4, "setUpdateBlock:", v3, v10.receiver, v10.super_class);

  id v5 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  [(_UIStatusBarDataAggregator *)v4 setDelayedKeys:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(_UIStatusBarDataAggregator *)v4 setPendingUpdates:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(_UIStatusBarDataAggregator *)v4 setCoalescedKeys:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(_UIStatusBarDataAggregator *)v4 setCoalescedTimers:v8];

  return v4;
}

- (void)updateWithData:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->_dataClass)
  {
    objc_opt_class();
    id v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    Class dataClass = self->_dataClass;
    self->_Class dataClass = v5;

    id v4 = v7;
  }
  [(_UIStatusBarDataAggregator *)self _updateForOverlayWithData:v4];
}

- (id)_updatedDataFromData:(id)a3 delayedKeys:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v7 count])
  {
    id v17 = v6;
    goto LABEL_21;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v19 = v7;
    id v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v15 = [v6 valueForKey:v14];
        if (v15)
        {
          if (!v11) {
            id v11 = (id)[v6 copy];
          }
          [v11 setValue:0 forKey:v14];
          v16 = +[_UIStatusBarDataAggregatorUpdate updateWithEntry:v15];
          [(NSMutableDictionary *)self->_pendingUpdates setObject:v16 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);

    id v7 = v19;
    if (v11)
    {
      if ([v11 isEmpty])
      {
        id v17 = 0;
      }
      else
      {
        id v11 = v11;
        id v17 = v11;
      }
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v17 = v6;
  id v11 = 0;
LABEL_20:

LABEL_21:
  return v17;
}

- (void)_updateFromPendingUpdatesForKeys:(id)a3 block:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    long long v22 = (void (**)(void, void))v7;
    uint64_t v10 = 0;
    id v11 = 0;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingUpdates, "objectForKeyedSubscript:", v14, v22);
        v16 = v15;
        if (v15)
        {
          int v17 = [v15 animated];
          if (v17) {
            v18 = v10;
          }
          else {
            v18 = v11;
          }
          if (!v18)
          {
            int v19 = v17;
            id v20 = objc_alloc_init(self->_dataClass);
            v18 = v20;
            if (v19) {
              uint64_t v10 = v20;
            }
            else {
              id v11 = v20;
            }
          }
          long long v21 = [v16 entry];
          [v18 setValue:v21 forKey:v14];

          [(NSMutableDictionary *)self->_pendingUpdates setObject:0 forKeyedSubscript:v14];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
    id v7 = v22;
    if (v11)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __69___UIStatusBarDataAggregator__updateFromPendingUpdatesForKeys_block___block_invoke;
      v24[3] = &unk_1E52DB330;
      v26 = v22;
      id v25 = v11;
      +[UIView performWithoutAnimation:v24];
    }
    if (v10) {
      ((void (**)(void, void *))v22)[2](v22, v10);
    }
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = 0;
  }
}

- (void)_updateForOverlayWithData:(id)a3
{
  id v4 = [a3 dataByApplyingOverlay:self->_overlayData];
  [(_UIStatusBarDataAggregator *)self _updateForDelayedKeysWithData:v4];
}

- (void)_updateForDelayedKeysWithData:(id)a3
{
  delayedKeys = self->_delayedKeys;
  id v7 = a3;
  if ([(NSCountedSet *)delayedKeys count])
  {
    uint64_t v5 = [(_UIStatusBarDataAggregator *)self _updatedDataFromData:v7 delayedKeys:self->_delayedKeys];

    if (v5)
    {
      [(_UIStatusBarDataAggregator *)self _updateForCoalescedKeysWithData:v5];
      id v6 = (void *)v5;
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    [(_UIStatusBarDataAggregator *)self _updateForCoalescedKeysWithData:v7];
    id v6 = v7;
  }
}

- (void)beginDelayingUpdatesForEntryKeys:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        [(NSCountedSet *)self->_delayedKeys addObject:v9];
        [(id)_statusBarDelayedDataEntryKeys addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)endDelayingUpdatesForEntryKeys:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithSet:self->_delayedKeys];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    unint64_t v11 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (![(NSCountedSet *)self->_delayedKeys countForObject:v13])
        {
          uint64_t v14 = [*(id *)(v11 + 2816) currentHandler];
          [v14 handleFailureInMethod:a2, self, @"_UIStatusBarDataAggregator.m", 187, @"Ending delayed updates for non-delayed key %@", v13 object file lineNumber description];

          unint64_t v11 = 0x1E4F28000;
        }
        [(NSCountedSet *)self->_delayedKeys removeObject:v13];
        [(id)_statusBarDelayedDataEntryKeys removeObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [v6 minusSet:self->_delayedKeys];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61___UIStatusBarDataAggregator_endDelayingUpdatesForEntryKeys___block_invoke;
  v15[3] = &unk_1E53077C0;
  v15[4] = self;
  [(_UIStatusBarDataAggregator *)self _updateFromPendingUpdatesForKeys:v6 block:v15];
}

- (NSSet)delayedEntryKeys
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithSet:self->_delayedKeys];
}

- (void)_updateForCoalescedKeysWithData:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_coalescedKeys count])
  {
    id v5 = [(_UIStatusBarDataAggregator *)self coalescedEntryKeys];
    uint64_t v6 = [(_UIStatusBarDataAggregator *)self _updatedDataFromData:v4 delayedKeys:v5];

    coalescedKeys = self->_coalescedKeys;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    long long v12 = __62___UIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke;
    uint64_t v13 = &unk_1E53077E8;
    id v14 = v4;
    uint64_t v15 = self;
    [(NSMutableDictionary *)coalescedKeys enumerateKeysAndObjectsUsingBlock:&v10];
    if (v6)
    {
      uint64_t v8 = [(_UIStatusBarDataAggregator *)self updateBlock];
      ((void (**)(void, void *))v8)[2](v8, v6);
    }
  }
  else
  {
    uint64_t v9 = [(_UIStatusBarDataAggregator *)self updateBlock];
    ((void (**)(void, id))v9)[2](v9, v4);
  }
}

- (void)_coalescedUpdateForEntryKeys:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_UIStatusBarDataAggregator *)self updateBlock];
  [(_UIStatusBarDataAggregator *)self _updateFromPendingUpdatesForKeys:v4 block:v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_coalescedTimers, "objectForKeyedSubscript:", v11, (void)v13);
        [v12 invalidate];

        [(NSMutableDictionary *)self->_coalescedTimers setObject:0 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)beginCoalescingUpdatesForEntryKeys:(id)a3 delay:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v12 = [(NSMutableDictionary *)self->_coalescedKeys objectForKeyedSubscript:v11];

        if (!v12)
        {
          long long v13 = [NSNumber numberWithDouble:a4];
          [(NSMutableDictionary *)self->_coalescedKeys setObject:v13 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)endCoalescingUpdatesForEntryKeys:(id)a3
{
  id v4 = a3;
  id v7 = (id)[v4 mutableCopy];
  [v7 minusSet:self->_delayedKeys];
  [(_UIStatusBarDataAggregator *)self _coalescedUpdateForEntryKeys:v7];
  coalescedKeys = self->_coalescedKeys;
  id v6 = [v4 allObjects];

  [(NSMutableDictionary *)coalescedKeys removeObjectsForKeys:v6];
}

- (NSSet)coalescedEntryKeys
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(NSMutableDictionary *)self->_coalescedKeys allKeys];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (_UIStatusBarData)overlayData
{
  return self->_overlayData;
}

- (void)setOverlayData:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (Class)dataClass
{
  return self->_dataClass;
}

- (void)setDataClass:(Class)a3
{
}

- (NSCountedSet)delayedKeys
{
  return self->_delayedKeys;
}

- (void)setDelayedKeys:(id)a3
{
}

- (NSMutableDictionary)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
}

- (NSMutableDictionary)coalescedKeys
{
  return self->_coalescedKeys;
}

- (void)setCoalescedKeys:(id)a3
{
}

- (NSMutableDictionary)coalescedTimers
{
  return self->_coalescedTimers;
}

- (void)setCoalescedTimers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedTimers, 0);
  objc_storeStrong((id *)&self->_coalescedKeys, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_delayedKeys, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_overlayData, 0);
}

@end