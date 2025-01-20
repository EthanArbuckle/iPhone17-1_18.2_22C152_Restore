@interface PXPhotosDetailsLoadCoordinator
+ (id)loadCoordinatorForContext:(id)a3;
- (BOOL)_canPerformRelatedFetch;
- (BOOL)_canPerformSuggestionsFetch;
- (NSHashTable)_tokens;
- (NSMutableArray)_relatedBlocks;
- (NSMutableArray)_suggestionsBlocks;
- (PXPhotosDetailsLoadCoordinator)init;
- (double)timeoutDelay;
- (id)_createToken;
- (id)tokenForLivePhotoVariations;
- (void)_tokenDidComplete:(id)a3;
- (void)performBlockWhenReadyToFetchRelated:(id)a3;
- (void)performBlockWhenReadyToFetchSuggestions:(id)a3;
- (void)setTimeoutDelay:(double)a3;
@end

@implementation PXPhotosDetailsLoadCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__suggestionsBlocks, 0);
  objc_storeStrong((id *)&self->__relatedBlocks, 0);
  objc_storeStrong((id *)&self->__tokens, 0);
}

- (void)setTimeoutDelay:(double)a3
{
  self->_timeoutDelay = a3;
}

- (double)timeoutDelay
{
  return self->_timeoutDelay;
}

- (NSMutableArray)_suggestionsBlocks
{
  return self->__suggestionsBlocks;
}

- (NSMutableArray)_relatedBlocks
{
  return self->__relatedBlocks;
}

- (NSHashTable)_tokens
{
  return self->__tokens;
}

- (BOOL)_canPerformSuggestionsFetch
{
  v2 = [(PXPhotosDetailsLoadCoordinator *)self _tokens];
  v3 = [v2 objectEnumerator];
  v4 = [v3 nextObject];
  BOOL v5 = v4 == 0;

  return v5;
}

- (BOOL)_canPerformRelatedFetch
{
  v2 = [(PXPhotosDetailsLoadCoordinator *)self _tokens];
  v3 = [v2 objectEnumerator];
  v4 = [v3 nextObject];
  BOOL v5 = v4 == 0;

  return v5;
}

- (void)_tokenDidComplete:(id)a3
{
  id v3 = a3;
  px_dispatch_on_main_queue();
}

void __52__PXPhotosDetailsLoadCoordinator__tokenDidComplete___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) _tokens];
    [v2 removeObject:*(void *)(a1 + 32)];
  }
  if ([*(id *)(a1 + 40) _canPerformRelatedFetch])
  {
    id v3 = [*(id *)(a1 + 40) _relatedBlocks];
    v4 = (void *)[v3 copy];

    BOOL v5 = [*(id *)(a1 + 40) _relatedBlocks];
    [v5 removeAllObjects];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
  }
  if ([*(id *)(a1 + 40) _canPerformSuggestionsFetch])
  {
    v11 = [*(id *)(a1 + 40) _suggestionsBlocks];
    v12 = (void *)[v11 copy];

    v13 = [*(id *)(a1 + 40) _suggestionsBlocks];
    [v13 removeAllObjects];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v18) + 16))(*(void *)(*((void *)&v19 + 1) + 8 * v18));
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }
  }
}

- (void)performBlockWhenReadyToFetchSuggestions:(id)a3
{
  uint64_t v7 = (void (**)(void))a3;
  if ([(PXPhotosDetailsLoadCoordinator *)self _canPerformSuggestionsFetch])
  {
    v7[2]();
  }
  else
  {
    v4 = [(PXPhotosDetailsLoadCoordinator *)self _suggestionsBlocks];
    BOOL v5 = (void *)[v7 copy];
    id v6 = _Block_copy(v5);
    [v4 addObject:v6];
  }
}

- (void)performBlockWhenReadyToFetchRelated:(id)a3
{
  uint64_t v7 = (void (**)(void))a3;
  if ([(PXPhotosDetailsLoadCoordinator *)self _canPerformRelatedFetch])
  {
    v7[2]();
  }
  else
  {
    v4 = [(PXPhotosDetailsLoadCoordinator *)self _relatedBlocks];
    BOOL v5 = (void *)[v7 copy];
    id v6 = _Block_copy(v5);
    [v4 addObject:v6];
  }
}

- (id)tokenForLivePhotoVariations
{
  id v2 = [[PXPhotosDetailsLoadCoordinationToken alloc] _initWithLoadCoordinator:0];
  return v2;
}

- (id)_createToken
{
  id v3 = [[PXPhotosDetailsLoadCoordinationToken alloc] _initWithLoadCoordinator:self];
  v4 = [(PXPhotosDetailsLoadCoordinator *)self _tokens];
  [v4 addObject:v3];

  return v3;
}

- (PXPhotosDetailsLoadCoordinator)init
{
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosDetailsLoadCoordinator;
  id v2 = [(PXPhotosDetailsLoadCoordinator *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    v2->_timeoutDelay = 10.0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    tokens = v3->__tokens;
    v3->__tokens = (NSHashTable *)v4;

    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    relatedBlocks = v3->__relatedBlocks;
    v3->__relatedBlocks = v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    suggestionsBlocks = v3->__suggestionsBlocks;
    v3->__suggestionsBlocks = v8;
  }
  return v3;
}

+ (id)loadCoordinatorForContext:(id)a3
{
  id v3 = a3;
  objc_getAssociatedObject(v3, (const void *)PXPhotosDetailsLoadCoordinatorAssociationKey);
  uint64_t v4 = (PXPhotosDetailsLoadCoordinator *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    uint64_t v4 = objc_alloc_init(PXPhotosDetailsLoadCoordinator);
    objc_setAssociatedObject(v3, (const void *)PXPhotosDetailsLoadCoordinatorAssociationKey, v4, (void *)1);
  }

  return v4;
}

@end