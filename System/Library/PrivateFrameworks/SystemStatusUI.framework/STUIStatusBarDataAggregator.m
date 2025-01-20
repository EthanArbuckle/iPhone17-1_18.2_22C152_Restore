@interface STUIStatusBarDataAggregator
+ (void)initialize;
- (BSInvalidatable)stateCaptureHandle;
- (Class)dataClass;
- (NSCountedSet)delayedKeys;
- (NSMutableDictionary)coalescedKeys;
- (NSMutableDictionary)coalescedTimers;
- (NSMutableDictionary)pendingUpdates;
- (NSSet)coalescedEntryKeys;
- (NSSet)delayedEntryKeys;
- (NSString)description;
- (STStatusBarData)overlayData;
- (STUIStatusBarDataAggregator)initWithUpdateBlock:(id)a3;
- (id)_updatedDataFromData:(id)a3 delayedKeys:(id)a4;
- (id)beginDelayingUpdatesForEntryKeys:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)updateBlock;
- (void)_coalescedUpdateForEntryKeys:(id)a3;
- (void)_updateForCoalescedKeysWithData:(id)a3;
- (void)_updateForDelayedKeysWithData:(id)a3;
- (void)_updateForOverlayWithData:(id)a3;
- (void)_updateFromPendingUpdatesForKeys:(id)a3 block:(id)a4;
- (void)beginCoalescingUpdatesForEntryKeys:(id)a3 delay:(double)a4;
- (void)dealloc;
- (void)endCoalescingUpdatesForEntryKeys:(id)a3;
- (void)endDelayingUpdates:(id)a3;
- (void)setCoalescedKeys:(id)a3;
- (void)setCoalescedTimers:(id)a3;
- (void)setDataClass:(Class)a3;
- (void)setDelayedKeys:(id)a3;
- (void)setOverlayData:(id)a3;
- (void)setPendingUpdates:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)updateWithData:(id)a3;
@end

@implementation STUIStatusBarDataAggregator

- (STStatusBarData)overlayData
{
  return self->_overlayData;
}

- (NSSet)delayedEntryKeys
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithSet:self->_delayedKeys];
}

- (void)updateWithData:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->_dataClass)
  {
    objc_opt_class();
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    Class dataClass = self->_dataClass;
    self->_Class dataClass = v5;

    id v4 = v7;
  }
  [(STUIStatusBarDataAggregator *)self _updateForOverlayWithData:v4];
}

- (void)_updateForOverlayWithData:(id)a3
{
  id v4 = [a3 dataByApplyingOverlay:self->_overlayData];
  [(STUIStatusBarDataAggregator *)self _updateForDelayedKeysWithData:v4];
}

- (void)_updateForDelayedKeysWithData:(id)a3
{
  delayedKeys = self->_delayedKeys;
  id v7 = a3;
  if ([(NSCountedSet *)delayedKeys count])
  {
    uint64_t v5 = [(STUIStatusBarDataAggregator *)self _updatedDataFromData:v7 delayedKeys:self->_delayedKeys];

    if (v5)
    {
      [(STUIStatusBarDataAggregator *)self _updateForCoalescedKeysWithData:v5];
      v6 = (void *)v5;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    [(STUIStatusBarDataAggregator *)self _updateForCoalescedKeysWithData:v7];
    v6 = v7;
  }
}

- (void)_updateForCoalescedKeysWithData:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_coalescedKeys count])
  {
    uint64_t v5 = [(STUIStatusBarDataAggregator *)self coalescedEntryKeys];
    v6 = [(STUIStatusBarDataAggregator *)self _updatedDataFromData:v4 delayedKeys:v5];

    coalescedKeys = self->_coalescedKeys;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __63__STUIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke;
    v13 = &unk_1E6AA4A30;
    id v14 = v4;
    v15 = self;
    [(NSMutableDictionary *)coalescedKeys enumerateKeysAndObjectsUsingBlock:&v10];
    if (v6)
    {
      v8 = [(STUIStatusBarDataAggregator *)self updateBlock];
      ((void (**)(void, void *))v8)[2](v8, v6);
    }
  }
  else
  {
    v9 = [(STUIStatusBarDataAggregator *)self updateBlock];
    ((void (**)(void, id))v9)[2](v9, v4);
  }
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (STUIStatusBarDataAggregator)initWithUpdateBlock:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STUIStatusBarDataAggregator;
  uint64_t v5 = [(STUIStatusBarDataAggregator *)&v19 init];
  [(STUIStatusBarDataAggregator *)v5 setUpdateBlock:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  [(STUIStatusBarDataAggregator *)v5 setDelayedKeys:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(STUIStatusBarDataAggregator *)v5 setPendingUpdates:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(STUIStatusBarDataAggregator *)v5 setCoalescedKeys:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(STUIStatusBarDataAggregator *)v5 setCoalescedTimers:v9];

  uint64_t v10 = NSString;
  uint64_t v11 = [(STUIStatusBarDataAggregator *)v5 succinctDescription];
  v12 = [v10 stringWithFormat:@"SystemStatusUI - StatusBar - %@", v11];

  objc_initWeak(&location, v5);
  id v13 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v17, &location);
  uint64_t v14 = BSLogAddStateCaptureBlockWithTitle();
  stateCaptureHandle = v5->_stateCaptureHandle;
  v5->_stateCaptureHandle = (BSInvalidatable *)v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v5;
}

- (id)succinctDescription
{
  v2 = [(STUIStatusBarDataAggregator *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void)setUpdateBlock:(id)a3
{
}

- (void)setPendingUpdates:(id)a3
{
}

- (void)setDelayedKeys:(id)a3
{
}

- (void)setCoalescedTimers:(id)a3
{
}

- (void)setCoalescedKeys:(id)a3
{
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureHandle invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarDataAggregator;
  [(STUIStatusBarDataAggregator *)&v3 dealloc];
}

- (void)endDelayingUpdates:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (([v5 isInvalidated] & 1) == 0)
    {
      [v5 invalidate];
      id v6 = [MEMORY[0x1E4F1CA80] setWithSet:self->_delayedKeys];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = [v5 delayedKeys];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            [(NSCountedSet *)self->_delayedKeys removeObject:v12];
            [(id)_statusBarDelayedDataEntryKeys removeObject:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
        }
        while (v9);
      }

      id v13 = _STUIStatusBar_Log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = [v5 delayedKeys];
        delayedKeys = self->_delayedKeys;
        *(_DWORD *)buf = 138412546;
        v22 = v14;
        __int16 v23 = 2112;
        v24 = delayedKeys;
        _os_log_impl(&dword_1D7E39000, v13, OS_LOG_TYPE_DEBUG, "end delaying updates for %@, remaining keys: %@", buf, 0x16u);
      }
      [v6 minusSet:self->_delayedKeys];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __50__STUIStatusBarDataAggregator_endDelayingUpdates___block_invoke;
      v16[3] = &unk_1E6AA49E0;
      v16[4] = self;
      [(STUIStatusBarDataAggregator *)self _updateFromPendingUpdatesForKeys:v6 block:v16];
    }
  }
}

- (void)_updateFromPendingUpdatesForKeys:(id)a3 block:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v26 = (void (**)(void, void))v7;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingUpdates, "objectForKeyedSubscript:", v14, v26);
        v16 = v15;
        if (v15)
        {
          int v17 = [v15 animated];
          if (v17) {
            long long v18 = v10;
          }
          else {
            long long v18 = v11;
          }
          if (!v18)
          {
            int v19 = v17;
            id v20 = objc_alloc_init(MEMORY[0x1E4FA9418]);
            long long v18 = v20;
            if (v19) {
              uint64_t v10 = v20;
            }
            else {
              uint64_t v11 = v20;
            }
          }
          v21 = [v16 entry];
          [v18 setEntry:v21 forKey:v14];

          [(NSMutableDictionary *)self->_pendingUpdates setObject:0 forKeyedSubscript:v14];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v9);
    id v7 = v26;
    if (v11)
    {
      v22 = _STUIStatusBar_Log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v11;
        _os_log_impl(&dword_1D7E39000, v22, OS_LOG_TYPE_DEBUG, "performing pending non-animated updates with data: %@", buf, 0xCu);
      }

      __int16 v23 = (void *)MEMORY[0x1E4FB1EB0];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __70__STUIStatusBarDataAggregator__updateFromPendingUpdatesForKeys_block___block_invoke;
      v28[3] = &unk_1E6AA4990;
      v30 = v26;
      id v29 = v11;
      [v23 performWithoutAnimation:v28];
    }
    if (v10)
    {
      v24 = _STUIStatusBar_Log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v10;
        _os_log_impl(&dword_1D7E39000, v24, OS_LOG_TYPE_DEBUG, "performing pending animated updates with data: %@", buf, 0xCu);
      }

      v25 = [v10 immutableCopy];
      ((void (**)(void, void *))v26)[2](v26, v25);
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
}

- (id)beginDelayingUpdatesForEntryKeys:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _STUIStatusBar_Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl(&dword_1D7E39000, v5, OS_LOG_TYPE_DEBUG, "begin delaying updates for %@", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        [(NSCountedSet *)self->_delayedKeys addObject:v10];
        [(id)_statusBarDelayedDataEntryKeys addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v11 = [STUIStatusBarDataAggregatorUpdateDelayToken alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__STUIStatusBarDataAggregator_beginDelayingUpdatesForEntryKeys___block_invoke;
  v14[3] = &unk_1E6AA49B8;
  objc_copyWeak(&v15, (id *)buf);
  uint64_t v12 = [(STUIStatusBarDataAggregatorUpdateDelayToken *)v11 initWithEntryKeys:v6 timeout:v14 timeoutBlock:5.0];
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_coalescedTimers, 0);
  objc_storeStrong((id *)&self->_coalescedKeys, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_delayedKeys, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_overlayData, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v3 = _statusBarDelayedDataEntryKeys;
    _statusBarDelayedDataEntryKeys = (uint64_t)v2;
    MEMORY[0x1F41817F8](v2, v3);
  }
}

id __51__STUIStatusBarDataAggregator_initWithUpdateBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained description];

  return v2;
}

- (id)_updatedDataFromData:(id)a3 delayedKeys:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v7;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v14 = [v6 valueForKey:v13];
          if (v14)
          {
            id v15 = +[STUIStatusBarDataAggregatorUpdate updateWithEntry:v14];
            [(NSMutableDictionary *)self->_pendingUpdates setObject:v15 forKeyedSubscript:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    long long v16 = [v6 dataByRemovingEntriesForKeys:v8];
    if ([v16 isEmpty]) {
      id v17 = 0;
    }
    else {
      id v17 = v16;
    }

    id v7 = v19;
  }
  else
  {
    id v17 = v6;
  }

  return v17;
}

void __70__STUIStatusBarDataAggregator__updateFromPendingUpdatesForKeys_block___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) immutableCopy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __64__STUIStatusBarDataAggregator_beginDelayingUpdatesForEntryKeys___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4 && WeakRetained) {
    [WeakRetained endDelayingUpdates:v4];
  }
}

uint64_t __50__STUIStatusBarDataAggregator_endDelayingUpdates___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateForCoalescedKeysWithData:a2];
}

void __63__STUIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) valueForKey:v5];
  if (v7)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    id v8 = (void *)MEMORY[0x1E4F1CB00];
    [v6 doubleValue];
    double v10 = v9;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__STUIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke_2;
    v13[3] = &unk_1E6AA4A08;
    objc_copyWeak(&v14, &location);
    v13[4] = v5;
    uint64_t v11 = [v8 scheduledTimerWithTimeInterval:0 repeats:v13 block:v10];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:v5];
    [v12 invalidate];

    [*(id *)(*(void *)(a1 + 40) + 56) setObject:v11 forKeyedSubscript:v5];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __63__STUIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  [WeakRetained _coalescedUpdateForEntryKeys:v2];
}

- (void)_coalescedUpdateForEntryKeys:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(STUIStatusBarDataAggregator *)self updateBlock];
  [(STUIStatusBarDataAggregator *)self _updateFromPendingUpdatesForKeys:v4 block:v5];

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
        uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_coalescedTimers, "objectForKeyedSubscript:", v11, (void)v13);
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
        uint64_t v12 = [(NSMutableDictionary *)self->_coalescedKeys objectForKeyedSubscript:v11];

        if (!v12)
        {
          long long v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:a4];
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
  [(STUIStatusBarDataAggregator *)self _coalescedUpdateForEntryKeys:v7];
  coalescedKeys = self->_coalescedKeys;
  id v6 = [v4 allObjects];

  [(NSMutableDictionary *)coalescedKeys removeObjectsForKeys:v6];
}

- (NSSet)coalescedEntryKeys
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(NSMutableDictionary *)self->_coalescedKeys allKeys];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (NSString)description
{
  return (NSString *)[(STUIStatusBarDataAggregator *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STUIStatusBarDataAggregator *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(STUIStatusBarDataAggregator *)self succinctDescriptionBuilder];
  [v5 setActiveMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__STUIStatusBarDataAggregator_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AA39F0;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __69__STUIStatusBarDataAggregator_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) delayedKeys];
  id v4 = [v3 allObjects];
  [v2 appendArraySection:v4 withName:@"delayedKeys" skipIfEmpty:1];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) coalescedKeys];
  id v6 = [v7 allKeys];
  [v5 appendArraySection:v6 withName:@"coalescedKeys" skipIfEmpty:1];
}

- (void)setOverlayData:(id)a3
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

- (NSMutableDictionary)pendingUpdates
{
  return self->_pendingUpdates;
}

- (NSMutableDictionary)coalescedKeys
{
  return self->_coalescedKeys;
}

- (NSMutableDictionary)coalescedTimers
{
  return self->_coalescedTimers;
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

@end