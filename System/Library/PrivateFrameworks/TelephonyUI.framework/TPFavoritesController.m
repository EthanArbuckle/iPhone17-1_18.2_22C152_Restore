@interface TPFavoritesController
- (BOOL)canAddEntry;
- (BOOL)needsProvidersUpdates;
- (CNContactStore)contactStore;
- (CNFavorites)favoritesManager;
- (NSArray)favoritesEntries;
- (NSCache)contactCache;
- (NSCache)transportNameCache;
- (OS_dispatch_queue)completionDispatchQueue;
- (OS_dispatch_queue)serialDispatchQueue;
- (TPFavoritesController)init;
- (TPFavoritesController)initWithContactStore:(id)a3 prefetchCount:(unint64_t)a4;
- (TUCallProviderManager)callProviderManager;
- (id)contactCacheKeyForFavoritesEntry:(id)a3;
- (id)contactForFavoritesEntry:(id)a3;
- (id)contactForFavoritesEntry:(id)a3 keyDescriptors:(id)a4;
- (id)delayedFetchBlock;
- (id)fetchContactForFavoritesEntry:(id)a3;
- (id)fetchContactForFavoritesEntry:(id)a3 keyDescriptors:(id)a4;
- (id)fetchFavoritesEntries;
- (id)fetchTransportNameForFavoritesEntry:(id)a3;
- (id)transportNameCacheKeyForFavoritesEntry:(id)a3;
- (id)transportNameForFavoritesEntry:(id)a3;
- (unint64_t)absoluteIndexForIndex:(unint64_t)a3;
- (unint64_t)prefetchCount;
- (void)addEntry:(id)a3;
- (void)dealloc;
- (void)fetchIfNeeded;
- (void)handleContactsFavoritesDidChangeNotification:(id)a3;
- (void)moveEntryAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)performInitialFetchIfNeeded;
- (void)providersChangedForProviderManager:(id)a3;
- (void)removeEntriesAtIndexes:(id)a3;
- (void)setDelayedFetchBlock:(id)a3;
- (void)setFavoritesEntries:(id)a3;
- (void)setNeedsProvidersUpdates:(BOOL)a3;
@end

@implementation TPFavoritesController

- (TPFavoritesController)initWithContactStore:(id)a3 prefetchCount:(unint64_t)a4
{
  id v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TPFavoritesController;
  v8 = [(TPFavoritesController *)&v27 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("TPFavoritesController.serialQueue", v9);
    serialDispatchQueue = v8->_serialDispatchQueue;
    v8->_serialDispatchQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v8->_contactStore, a3);
    objc_storeStrong((id *)&v8->_completionDispatchQueue, MEMORY[0x1E4F14428]);
    v8->_prefetchCount = a4;
    v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    contactCache = v8->_contactCache;
    v8->_contactCache = v12;

    v14 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    transportNameCache = v8->_transportNameCache;
    v8->_transportNameCache = v14;

    objc_initWeak(&location, v8);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __60__TPFavoritesController_initWithContactStore_prefetchCount___block_invoke;
    v24 = &unk_1E647C218;
    objc_copyWeak(&v25, &location);
    dispatch_block_t v16 = dispatch_block_create((dispatch_block_flags_t)0, &v21);
    -[TPFavoritesController setDelayedFetchBlock:](v8, "setDelayedFetchBlock:", v16, v21, v22, v23, v24);

    dispatch_time_t v17 = dispatch_time(0, 1000000000);
    v18 = v8->_serialDispatchQueue;
    v19 = [(TPFavoritesController *)v8 delayedFetchBlock];
    dispatch_after(v17, v18, v19);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (void)setDelayedFetchBlock:(id)a3
{
}

- (id)delayedFetchBlock
{
  return self->_delayedFetchBlock;
}

- (TPFavoritesController)init
{
  return 0;
}

void __60__TPFavoritesController_initWithContactStore_prefetchCount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained performInitialFetchIfNeeded];
    id WeakRetained = v2;
  }
}

- (void)performInitialFetchIfNeeded
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2F24000, log, OS_LOG_TYPE_ERROR, "The application is not authorized to access contact data.", v1, 2u);
}

- (void)fetchIfNeeded
{
  v3 = [(TPFavoritesController *)self delayedFetchBlock];

  if (v3)
  {
    v4 = [(TPFavoritesController *)self delayedFetchBlock];
    dispatch_block_cancel(v4);
  }
  objc_initWeak(&location, self);
  serialDispatchQueue = self->_serialDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__TPFavoritesController_fetchIfNeeded__block_invoke;
  v6[3] = &unk_1E647C218;
  objc_copyWeak(&v7, &location);
  dispatch_async(serialDispatchQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __38__TPFavoritesController_fetchIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setDelayedFetchBlock:0];
    [v2 performInitialFetchIfNeeded];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TPFavoritesController;
  [(TPFavoritesController *)&v4 dealloc];
}

- (CNContactStore)contactStore
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v3 = [(TPFavoritesController *)self serialDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__TPFavoritesController_contactStore__block_invoke;
  v6[3] = &unk_1E647C240;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CNContactStore *)v4;
}

void __37__TPFavoritesController_contactStore__block_invoke(uint64_t a1)
{
}

- (NSArray)favoritesEntries
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v3 = [(TPFavoritesController *)self serialDispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__TPFavoritesController_favoritesEntries__block_invoke;
  v6[3] = &unk_1E647C240;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __41__TPFavoritesController_favoritesEntries__block_invoke(uint64_t a1)
{
}

- (void)addEntry:(id)a3
{
  id v4 = a3;
  v5 = [(TPFavoritesController *)self serialDispatchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__TPFavoritesController_addEntry___block_invoke;
  v7[3] = &unk_1E647C268;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __34__TPFavoritesController_addEntry___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) favoritesManager];
  v3 = [v2 entries];
  uint64_t v4 = [v3 indexOfObject:*(void *)(a1 + 40)];

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [*(id *)(a1 + 32) favoritesManager];
    [v5 removeEntryAtIndex:v4];
  }
  id v6 = [*(id *)(a1 + 32) favoritesManager];
  char v7 = [v6 isFull];

  if (v7)
  {
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) favoritesManager];
    [v8 addEntry:*(void *)(a1 + 40)];
  }
  uint64_t v9 = [*(id *)(a1 + 32) favoritesManager];
  [v9 save];

  id v10 = [*(id *)(a1 + 32) fetchFavoritesEntries];
  [*(id *)(a1 + 32) setFavoritesEntries:v10];
}

- (BOOL)canAddEntry
{
  id v2 = self;
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(TPFavoritesController *)self serialDispatchQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__TPFavoritesController_canAddEntry__block_invoke;
  v5[3] = &unk_1E647C240;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __36__TPFavoritesController_canAddEntry__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) favoritesManager];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isFull] ^ 1;
}

- (void)moveEntryAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  char v7 = [(TPFavoritesController *)self serialDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__TPFavoritesController_moveEntryAtIndex_toIndex___block_invoke;
  block[3] = &unk_1E647C290;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(v7, block);
}

void __50__TPFavoritesController_moveEntryAtIndex_toIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) absoluteIndexForIndex:*(void *)(a1 + 40)];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = v2;
    if (*(void *)(a1 + 48))
    {
      uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "absoluteIndexForIndex:");
      if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
        return;
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
    v5 = [*(id *)(a1 + 32) favoritesManager];
    [v5 moveEntryAtIndex:v3 toIndex:v4];

    uint64_t v6 = [*(id *)(a1 + 32) favoritesManager];
    [v6 save];

    id v7 = [*(id *)(a1 + 32) fetchFavoritesEntries];
    [*(id *)(a1 + 32) setFavoritesEntries:v7];
  }
}

- (void)removeEntriesAtIndexes:(id)a3
{
  id v4 = a3;
  v5 = [(TPFavoritesController *)self serialDispatchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__TPFavoritesController_removeEntriesAtIndexes___block_invoke;
  v7[3] = &unk_1E647C268;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__TPFavoritesController_removeEntriesAtIndexes___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__TPFavoritesController_removeEntriesAtIndexes___block_invoke_2;
  v5[3] = &unk_1E647C2B8;
  v5[4] = *(void *)(a1 + 40);
  [v2 enumerateIndexesUsingBlock:v5];
  uint64_t v3 = [*(id *)(a1 + 40) favoritesManager];
  [v3 save];

  id v4 = [*(id *)(a1 + 40) fetchFavoritesEntries];
  [*(id *)(a1 + 40) setFavoritesEntries:v4];
}

void __48__TPFavoritesController_removeEntriesAtIndexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) favoritesManager];
  [v3 removeEntryAtIndex:a2];
}

- (id)contactForFavoritesEntry:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  dispatch_block_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v5 = [(TPFavoritesController *)self serialDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__TPFavoritesController_contactForFavoritesEntry___block_invoke;
  block[3] = &unk_1E647C2E0;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__TPFavoritesController_contactForFavoritesEntry___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) contactCacheKeyForFavoritesEntry:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) contactCache];
  uint64_t v3 = [v2 objectForKey:v10];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 32) fetchContactForFavoritesEntry:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    char v9 = [*(id *)(a1 + 32) contactCache];
    [v9 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v10];
  }
}

- (id)contactForFavoritesEntry:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  id v8 = [(TPFavoritesController *)self serialDispatchQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__TPFavoritesController_contactForFavoritesEntry_keyDescriptors___block_invoke;
  v13[3] = &unk_1E647C308;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  dispatch_block_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __65__TPFavoritesController_contactForFavoritesEntry_keyDescriptors___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchContactForFavoritesEntry:*(void *)(a1 + 40) keyDescriptors:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)transportNameForFavoritesEntry:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  dispatch_block_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v5 = [(TPFavoritesController *)self serialDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__TPFavoritesController_transportNameForFavoritesEntry___block_invoke;
  block[3] = &unk_1E647C2E0;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__TPFavoritesController_transportNameForFavoritesEntry___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) transportNameCacheKeyForFavoritesEntry:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) transportNameCache];
  uint64_t v3 = [v2 objectForKey:v10];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
  {
    uint64_t v6 = [*(id *)(a1 + 32) fetchTransportNameForFavoritesEntry:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v9 = [*(id *)(a1 + 32) transportNameCache];
      [v9 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v10];
    }
  }
}

- (unint64_t)absoluteIndexForIndex:(unint64_t)a3
{
  v5 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = self->_favoritesEntries;
  if ([(NSArray *)v6 count] <= a3)
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = [(NSArray *)v6 objectAtIndex:a3];
    if (v7)
    {
      id v8 = [(TPFavoritesController *)self favoritesManager];
      id v9 = [v8 entries];
      unint64_t v10 = [v9 indexOfObject:v7];
    }
    else
    {
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v10;
}

- (id)contactCacheKeyForFavoritesEntry:(id)a3
{
  id v4 = a3;
  v5 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = NSString;
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v4 hash];

  id v9 = [v7 numberWithUnsignedInteger:v8];
  unint64_t v10 = [v6 stringWithFormat:@"%@", v9];

  return v10;
}

- (id)fetchContactForFavoritesEntry:(id)a3
{
  id v4 = a3;
  v5 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TPFavoritesController *)self fetchContactForFavoritesEntry:v4 keyDescriptors:0];

  if (!v6)
  {
    uint64_t v7 = TPDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[TPFavoritesController fetchContactForFavoritesEntry:](v7);
    }

    id v6 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
  }
  return v6;
}

- (id)fetchContactForFavoritesEntry:(id)a3 keyDescriptors:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 contactProperty];
  unint64_t v10 = [v9 contact];

  if (v7 && v10 && ([v10 areKeysAvailable:v7] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F1CA48] arrayWithArray:v7];
    uint64_t v12 = [v10 availableKeyDescriptor];
    if (v12) {
      [v11 addObject:v12];
    }
    contactStore = self->_contactStore;
    uint64_t v14 = [v10 identifier];
    id v20 = 0;
    uint64_t v15 = [(CNContactStore *)contactStore unifiedContactWithIdentifier:v14 keysToFetch:v11 error:&v20];
    id v16 = v20;

    if (!v15)
    {
      id v17 = TPDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = self->_contactStore;
        *(_DWORD *)buf = 138412802;
        id v22 = v19;
        __int16 v23 = 2112;
        id v24 = v6;
        __int16 v25 = 2112;
        id v26 = v16;
        _os_log_error_impl(&dword_1C2F24000, v17, OS_LOG_TYPE_ERROR, "Could not retrieve a contact using contact store (%@), favorites entry (%@) error (%@)", buf, 0x20u);
      }
    }
    unint64_t v10 = (void *)v15;
  }

  return v10;
}

- (id)fetchFavoritesEntries
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [(TPFavoritesController *)self contactCache];
  [v5 removeAllObjects];

  id v6 = [(TPFavoritesController *)self transportNameCache];
  [v6 removeAllObjects];

  id v7 = [(TPFavoritesController *)self favoritesManager];
  uint64_t v8 = [v7 entries];
  id v9 = (void *)[v8 copy];

  unint64_t v10 = v4;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v40;
    uint64_t v14 = *MEMORY[0x1E4F1AD20];
    uint64_t v37 = *MEMORY[0x1E4F1AD78];
    do
    {
      uint64_t v15 = 0;
      uint64_t v36 = v12;
      do
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(id *)(*((void *)&v39 + 1) + 8 * v15);
        id v17 = [v16 actionType];
        if ([v17 isEqualToString:v14])
        {
        }
        else
        {
          v18 = [v16 actionType];
          int v19 = [v18 isEqualToString:v37];

          id v20 = v16;
          if (!v19) {
            goto LABEL_15;
          }
        }
        uint64_t v21 = [(TPFavoritesController *)self callProviderManager];
        id v22 = [v21 providerForFavoritesEntry:v16];

        if (!v22) {
          [(TPFavoritesController *)self setNeedsProvidersUpdates:1];
        }
        id v20 = v16;
        if (([v22 supportsAudioAndVideo] & 1) == 0)
        {
          id v20 = v16;
          if (([v22 supportsAudioOnly] & 1) == 0)
          {

            id v20 = 0;
          }
        }

LABEL_15:
        if (v20)
        {
          [v10 addObject:v20];
          if (![(TPFavoritesController *)self prefetchCount]
            || (unint64_t v23 = -[TPFavoritesController prefetchCount](self, "prefetchCount"), v23 >= [v10 count]))
          {
            id v24 = [(TPFavoritesController *)self contactCache];
            __int16 v25 = [(TPFavoritesController *)self fetchContactForFavoritesEntry:v20];
            [(TPFavoritesController *)self contactCacheKeyForFavoritesEntry:v20];
            uint64_t v26 = v14;
            uint64_t v27 = v13;
            v29 = v28 = v10;
            [v24 setObject:v25 forKey:v29];

            v30 = [(TPFavoritesController *)self transportNameCache];
            v31 = [(TPFavoritesController *)self fetchTransportNameForFavoritesEntry:v16];
            v32 = [(TPFavoritesController *)self transportNameCacheKeyForFavoritesEntry:v16];
            [v30 setObject:v31 forKey:v32];

            unint64_t v10 = v28;
            uint64_t v13 = v27;
            uint64_t v14 = v26;
            uint64_t v12 = v36;
            id v33 = (id)[v20 name];
          }
        }

        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v12);
  }

  v34 = (void *)[v10 copy];
  return v34;
}

- (id)fetchTransportNameForFavoritesEntry:(id)a3
{
  id v4 = a3;
  v5 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 localizedBundleName];

  return v6;
}

- (id)transportNameCacheKeyForFavoritesEntry:(id)a3
{
  id v4 = a3;
  v5 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = NSString;
  id v7 = NSNumber;
  uint64_t v8 = [v4 hash];

  id v9 = [v7 numberWithUnsignedInteger:v8];
  unint64_t v10 = [v6 stringWithFormat:@"%@", v9];

  return v10;
}

- (TUCallProviderManager)callProviderManager
{
  uint64_t v3 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v3);

  callProviderManager = self->_callProviderManager;
  return callProviderManager;
}

- (NSCache)contactCache
{
  uint64_t v3 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v3);

  contactCache = self->_contactCache;
  return contactCache;
}

- (void)setFavoritesEntries:(id)a3
{
  id v4 = (NSArray *)a3;
  v5 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_favoritesEntries != v4)
  {
    id v6 = (NSArray *)[(NSArray *)v4 copy];
    favoritesEntries = self->_favoritesEntries;
    self->_favoritesEntries = v6;

    uint64_t v8 = [(TPFavoritesController *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__TPFavoritesController_setFavoritesEntries___block_invoke;
    block[3] = &unk_1E647C1D0;
    block[4] = self;
    dispatch_async(v8, block);
  }
}

void __45__TPFavoritesController_setFavoritesEntries___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"TPFavoritesControllerFavoritesEntriesDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (NSCache)transportNameCache
{
  uint64_t v3 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v3);

  transportNameCache = self->_transportNameCache;
  return transportNameCache;
}

- (void)handleContactsFavoritesDidChangeNotification:(id)a3
{
  id v4 = [(TPFavoritesController *)self serialDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__TPFavoritesController_handleContactsFavoritesDidChangeNotification___block_invoke;
  block[3] = &unk_1E647C1D0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __70__TPFavoritesController_handleContactsFavoritesDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchFavoritesEntries];
  [*(id *)(a1 + 32) setFavoritesEntries:v2];
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = [(TPFavoritesController *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v4);

  if ([(TPFavoritesController *)self needsProvidersUpdates])
  {
    [(TPFavoritesController *)self setNeedsProvidersUpdates:0];
    id v5 = [(TPFavoritesController *)self fetchFavoritesEntries];
    [(TPFavoritesController *)self setFavoritesEntries:v5];
  }
}

- (CNFavorites)favoritesManager
{
  return self->_favoritesManager;
}

- (unint64_t)prefetchCount
{
  return self->_prefetchCount;
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (BOOL)needsProvidersUpdates
{
  return self->_needsProvidersUpdates;
}

- (void)setNeedsProvidersUpdates:(BOOL)a3
{
  self->_needsProvidersUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delayedFetchBlock, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_transportNameCache, 0);
  objc_storeStrong((id *)&self->_favoritesManager, 0);
  objc_storeStrong((id *)&self->_favoritesEntries, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
}

- (void)fetchContactForFavoritesEntry:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1C2F24000, log, OS_LOG_TYPE_ERROR, "Creating an empty contact for favorites entry %@.", (uint8_t *)&v1, 0xCu);
}

@end