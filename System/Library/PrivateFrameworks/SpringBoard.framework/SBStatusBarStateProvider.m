@interface SBStatusBarStateProvider
- (BOOL)_shouldPostForUpdatesToNonItemData:(id *)a3;
- (BOOL)_shouldPostForVisitedItem:(int)a3 withUpdates:(BOOL)a4 toAggregatorData:(id *)a5 lastPost:(id *)a6;
- (SBStatusBarStateAggregator)stateAggregator;
- (SBStatusBarStateProvider)init;
- (void)_didChangeDoubleHeightStatusStringForStyle:(int64_t)a3;
- (void)addStatusBarStateObserver:(id)a3;
- (void)beginCoalescentBlock;
- (void)dealloc;
- (void)endCoalescentBlock;
- (void)getStatusBarData:(id *)a3;
- (void)removeStatusBarStateObserver:(id)a3;
- (void)setStateAggregator:(id)a3;
- (void)statusBarStateAggregator:(id)a3 didUpdateNonItemData:(id *)a4;
- (void)statusBarStateAggregator:(id)a3 didVisitItem:(int)a4 withUpdates:(BOOL)a5 toData:(id *)a6;
- (void)statusBarStateAggregatorDidFinishPost:(id)a3 withData:(id *)a4 actions:(int)a5;
- (void)updateStatusBarItem:(int)a3;
@end

@implementation SBStatusBarStateProvider

- (void)beginCoalescentBlock
{
  if (self->_posting)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBStatusBarStateProvider.m", 75, @"calls to %s are not allowed from within a post", "-[SBStatusBarStateProvider beginCoalescentBlock]");
  }
  ++self->_coalescentBlockDepth;
}

- (void)statusBarStateAggregator:(id)a3 didVisitItem:(int)a4 withUpdates:(BOOL)a5 toData:(id *)a6
{
  if ([(SBStatusBarStateProvider *)self _shouldPostForVisitedItem:*(void *)&a4 withUpdates:a5 toAggregatorData:a6 lastPost:&self->_lastPost])
  {
    self->_itemNeedsPost[a4] = 1;
    self->_anyItemNeedsPost = 1;
  }
}

- (void)statusBarStateAggregatorDidFinishPost:(id)a3 withData:(id *)a4 actions:(int)a5
{
  memcpy(&self->_aggregatorData, a4, sizeof(self->_aggregatorData));
  self->_aggregatorActions = a5;
  [(SBStatusBarStateProvider *)self endCoalescentBlock];
}

- (void)endCoalescentBlock
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  p_anyItemNeedsPost = &self->_anyItemNeedsPost;
  if (self->_posting)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBStatusBarStateProvider.m", 80, @"calls to %s are not allowed from within a post", "-[SBStatusBarStateProvider endCoalescentBlock]");
  }
  unint64_t coalescentBlockDepth = self->_coalescentBlockDepth;
  if (!coalescentBlockDepth)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBStatusBarStateProvider.m", 81, @"unbalanced call to %s", "-[SBStatusBarStateProvider endCoalescentBlock]");

    unint64_t coalescentBlockDepth = self->_coalescentBlockDepth;
  }
  unint64_t v6 = coalescentBlockDepth - 1;
  self->_unint64_t coalescentBlockDepth = v6;
  if (!v6)
  {
    p_anyItemNeedsPost[2] = 1;
    memcpy(__dst, &self->_aggregatorData, sizeof(__dst));
    [(SBStatusBarStateProvider *)self _composePostDataFromAggregatorData:__dst];
    [(SBStatusBarStateProvider *)self _composePostActionsFromAggregatorActions:&self->_aggregatorActions];
    if (!self->_aggregatorActions && !p_anyItemNeedsPost[1])
    {
      p_lastPost = &self->_lastPost;
      if (!memcmp(__dst, &self->_lastPost, 0xF28uLL) || !*p_anyItemNeedsPost)
      {
LABEL_16:
        self->_aggregatorActions = 0;
        *(_OWORD *)self->_itemNeedsPost = 0u;
        *(_OWORD *)&self->_itemNeedsPost[16] = 0u;
        *(_OWORD *)&self->_itemNeedsPost[30] = 0u;
        v25 = p_anyItemNeedsPost;
        *(_WORD *)p_anyItemNeedsPost = 0;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        obj = self->_stylesWithDetailUpdates;
        uint64_t v28 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v28)
        {
          uint64_t v27 = *(void *)v34;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v34 != v27) {
                objc_enumerationMutation(obj);
              }
              uint64_t v13 = [*(id *)(*((void *)&v33 + 1) + 8 * v12) integerValue];
              long long v29 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              v14 = self->_stateObservers;
              uint64_t v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v29 objects:v41 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v30;
                do
                {
                  uint64_t v18 = 0;
                  do
                  {
                    if (*(void *)v30 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    v19 = *(void **)(*((void *)&v29 + 1) + 8 * v18);
                    if (objc_opt_respondsToSelector()) {
                      [v19 statusBarStateProvider:self didChangeDoubleHeightStatusStringForStyle:v13];
                    }
                    ++v18;
                  }
                  while (v16 != v18);
                  uint64_t v16 = [(NSHashTable *)v14 countByEnumeratingWithState:&v29 objects:v41 count:16];
                }
                while (v16);
              }

              ++v12;
            }
            while (v12 != v28);
            uint64_t v28 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v28);
        }

        [(NSMutableArray *)self->_stylesWithDetailUpdates removeAllObjects];
        v25[2] = 0;
        [(SBStatusBarStateProvider *)self _didFinishPost];
        return;
      }
      v21 = __dst;
      uint64_t v22 = 46;
      while (!p_lastPost[1].itemIsEnabled[8] || !*v21 && !p_lastPost->itemIsEnabled[0])
      {
        p_lastPost = ($D1AFE4C712074D7A4DFED30A4D6E293D *)((char *)p_lastPost + 1);
        ++v21;
        if (!--v22) {
          goto LABEL_16;
        }
      }
    }
    memcpy(&self->_lastPost, __dst, sizeof(self->_lastPost));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v7 = self->_stateObservers;
    uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v38;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v37 + 1) + 8 * v11++) statusBarStateProvider:self didPostStatusBarData:__dst withActions:self->_aggregatorActions];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v9);
    }

    goto LABEL_16;
  }
}

- (SBStatusBarStateProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBStatusBarStateProvider;
  v2 = [(SBStatusBarStateProvider *)&v7 init];
  if (v2)
  {
    v3 = [(id)SBApp statusBarStateAggregator];
    [v3 addPostingObserver:v2];
    objc_storeWeak((id *)&v2->_stateAggregator, v3);
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    stateObservers = v2->_stateObservers;
    v2->_stateObservers = (NSHashTable *)v4;
  }
  return v2;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateAggregator);
  [WeakRetained removePostingObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBStatusBarStateProvider;
  [(SBStatusBarStateProvider *)&v4 dealloc];
}

- (void)addStatusBarStateObserver:(id)a3
{
}

- (void)removeStatusBarStateObserver:(id)a3
{
}

- (void)getStatusBarData:(id *)a3
{
  if (a3)
  {
    memcpy(a3, &self->_aggregatorData, sizeof($6C45178016D353444451090973A2A97F));
    [(SBStatusBarStateProvider *)self _composePostDataFromAggregatorData:a3];
  }
}

- (void)updateStatusBarItem:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(SBStatusBarStateProvider *)self beginCoalescentBlock];
  if ([(SBStatusBarStateProvider *)self _shouldPostForVisitedItem:v3 withUpdates:0 toAggregatorData:&self->_aggregatorData lastPost:&self->_lastPost])
  {
    self->_itemNeedsPost[v3] = 1;
    self->_anyItemNeedsPost = 1;
  }
  [(SBStatusBarStateProvider *)self endCoalescentBlock];
}

- (void)_didChangeDoubleHeightStatusStringForStyle:(int64_t)a3
{
  [(SBStatusBarStateProvider *)self beginCoalescentBlock];
  stylesWithDetailUpdates = self->_stylesWithDetailUpdates;
  if (!stylesWithDetailUpdates)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v7 = self->_stylesWithDetailUpdates;
    self->_stylesWithDetailUpdates = v6;

    stylesWithDetailUpdates = self->_stylesWithDetailUpdates;
  }
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  [(NSMutableArray *)stylesWithDetailUpdates addObject:v8];

  [(SBStatusBarStateProvider *)self endCoalescentBlock];
}

- (BOOL)_shouldPostForVisitedItem:(int)a3 withUpdates:(BOOL)a4 toAggregatorData:(id *)a5 lastPost:(id *)a6
{
  return a4;
}

- (BOOL)_shouldPostForUpdatesToNonItemData:(id *)a3
{
  return 1;
}

- (void)statusBarStateAggregator:(id)a3 didUpdateNonItemData:(id *)a4
{
  if ([(SBStatusBarStateProvider *)self _shouldPostForUpdatesToNonItemData:a4]) {
    self->_nonItemDataNeedsPost = 1;
  }
}

- (SBStatusBarStateAggregator)stateAggregator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateAggregator);
  return (SBStatusBarStateAggregator *)WeakRetained;
}

- (void)setStateAggregator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateAggregator);
  objc_storeStrong((id *)&self->_stylesWithDetailUpdates, 0);
  objc_storeStrong((id *)&self->_stateObservers, 0);
}

@end