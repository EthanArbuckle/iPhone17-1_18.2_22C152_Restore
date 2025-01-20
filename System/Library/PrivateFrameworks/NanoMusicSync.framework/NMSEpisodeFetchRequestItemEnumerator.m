@interface NMSEpisodeFetchRequestItemEnumerator
- (NMSEpisodeFetchRequestItemEnumerator)initWithFetchRequest:(id)a3 ctx:(id)a4;
- (NSArray)items;
- (id)nextItem;
@end

@implementation NMSEpisodeFetchRequestItemEnumerator

- (NMSEpisodeFetchRequestItemEnumerator)initWithFetchRequest:(id)a3 ctx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NMSEpisodeFetchRequestItemEnumerator;
  v9 = [(NMSEpisodeFetchRequestItemEnumerator *)&v11 init];
  if (v9)
  {
    if (![v7 fetchBatchSize]) {
      [v7 setFetchBatchSize:3];
    }
    objc_storeStrong((id *)&v9->_fetchRequest, a3);
    objc_storeStrong((id *)&v9->_ctx, a4);
  }

  return v9;
}

- (id)nextItem
{
  unint64_t itemIndex = self->_itemIndex;
  v4 = [(NMSEpisodeFetchRequestItemEnumerator *)self items];
  unint64_t v5 = [v4 count];

  if (itemIndex >= v5)
  {
    items = self->_items;
    self->_items = 0;

    id v7 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__9;
    v15 = __Block_byref_object_dispose__9;
    id v16 = 0;
    ctx = self->_ctx;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__NMSEpisodeFetchRequestItemEnumerator_nextItem__block_invoke;
    v10[3] = &unk_264633AA8;
    v10[4] = self;
    v10[5] = &v11;
    [(NSManagedObjectContext *)ctx performBlockAndWait:v10];
    id v7 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }

  return v7;
}

void __48__NMSEpisodeFetchRequestItemEnumerator_nextItem__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) items];
  v3 = [v2 objectAtIndex:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v4 = [v3 downloadInfo];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  ++*(void *)(*(void *)(a1 + 32) + 24);
}

- (NSArray)items
{
  items = self->_items;
  if (!items)
  {
    if (self->_itemIndex)
    {
      items = 0;
    }
    else
    {
      ctx = self->_ctx;
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __45__NMSEpisodeFetchRequestItemEnumerator_items__block_invoke;
      v6[3] = &unk_264633B20;
      v6[4] = self;
      [(NSManagedObjectContext *)ctx performBlockAndWait:v6];
      items = self->_items;
    }
  }

  return items;
}

void __45__NMSEpisodeFetchRequestItemEnumerator_items__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v2 + 8);
  v3 = *(void **)(v2 + 16);
  id v10 = 0;
  uint64_t v5 = [v3 executeFetchRequest:v4 error:&v10];
  id v6 = v10;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v5;

  if (v6)
  {
    v9 = NMLogForCategory(5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __45__NMSEpisodeFetchRequestItemEnumerator_items__block_invoke_cold_1((uint64_t)v6, v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_ctx, 0);

  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

void __45__NMSEpisodeFetchRequestItemEnumerator_items__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2228FD000, a2, OS_LOG_TYPE_ERROR, "NMSEpisodeFetchRequestItemEnumerator fetch request failed - %@", (uint8_t *)&v2, 0xCu);
}

@end