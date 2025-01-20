@interface PKAsyncCache
- (PKAsyncCache)init;
- (PKAsyncCache)initWithCache:(id)a3;
- (void)_executeRetrievalBlock:(id)a3 forKey:(id)a4;
- (void)retrieveItemForKey:(id)a3 synchronous:(BOOL)a4 retrievalBlock:(id)a5 deliveryBlock:(id)a6;
@end

@implementation PKAsyncCache

- (void)retrieveItemForKey:(id)a3 synchronous:(BOOL)a4 retrievalBlock:(id)a5 deliveryBlock:(id)a6
{
  BOOL v8 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = (void (**)(id, void *))a6;
  os_unfair_lock_lock(&self->_lock);
  v13 = [(NSCache *)self->_itemByKey objectForKey:v10];
  if (v13) {
    goto LABEL_4;
  }
  uint64_t v14 = [(NSMapTable *)self->_weakItemByKey objectForKey:v10];
  if (!v14)
  {
    uint64_t v23 = [(NSMutableDictionary *)self->_outstandingRetrievals objectForKeyedSubscript:v10];
    if (v23)
    {
      v17 = (PKAsyncCacheRetrievalInfo *)v23;
      os_unfair_lock_unlock(&self->_lock);
      id v28 = 0;
      if (!v8) {
        goto LABEL_27;
      }
    }
    else
    {
      v17 = objc_alloc_init(PKAsyncCacheRetrievalInfo);
      [(NSMutableDictionary *)self->_outstandingRetrievals setObject:v17 forKeyedSubscript:v10];
      os_unfair_lock_unlock(&self->_lock);
      id v28 = 0;
      if (!v8)
      {
        [(PKAsyncCache *)self _executeRetrievalBlock:v11 forKey:v10];
LABEL_27:
        [(PKAsyncCacheRetrievalInfo *)v17 addDeliveryBlock:v12];
        v16 = 0;
        v13 = 0;
        goto LABEL_16;
      }
    }
    v13 = [(PKAsyncCacheRetrievalInfo *)v17 synchronouslyRetrieve:v11 outDeliveryBlocks:&v28];
    os_unfair_lock_lock(&self->_lock);
    if (v13)
    {
      [(NSCache *)self->_itemByKey setObject:v13 forKey:v10];
      [(NSMapTable *)self->_weakItemByKey setObject:v13 forKey:v10];
    }
    v16 = [(NSMutableDictionary *)self->_outstandingRetrievals objectForKeyedSubscript:v10];
    [(NSMutableDictionary *)self->_outstandingRetrievals setObject:0 forKeyedSubscript:v10];
    if (v17 == v16)
    {

      v16 = 0;
    }
    os_unfair_lock_unlock(&self->_lock);
    id v15 = v28;
    goto LABEL_5;
  }
  v13 = (void *)v14;
  [(NSCache *)self->_itemByKey setObject:v14 forKey:v10];
LABEL_4:
  os_unfair_lock_unlock(&self->_lock);
  id v15 = 0;
  v16 = 0;
  v17 = 0;
  id v28 = 0;
LABEL_5:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v15;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v24 + 1) + 8 * i));
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v20);
  }

  if (v16) {
    -[PKAsyncCacheRetrievalInfo deliverItem:](v16, "deliverItem:", v13, (void)v24);
  }
  if (v12) {
    v12[2](v12, v13);
  }
LABEL_16:
}

- (PKAsyncCache)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v4 = [(PKAsyncCache *)self initWithCache:v3];

  return v4;
}

- (PKAsyncCache)initWithCache:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAsyncCache;
  v6 = [(PKAsyncCache *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_itemByKey, a3);
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    weakItemByKey = v7->_weakItemByKey;
    v7->_weakItemByKey = (NSMapTable *)v8;

    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    outstandingRetrievals = v7->_outstandingRetrievals;
    v7->_outstandingRetrievals = v10;
  }
  return v7;
}

- (void)_executeRetrievalBlock:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PKAsyncCache__executeRetrievalBlock_forKey___block_invoke;
  v9[3] = &unk_1E56DDDA8;
  v9[4] = self;
  id v10 = v6;
  v7 = (void (*)(id, void *))*((void *)a3 + 2);
  id v8 = v6;
  v7(a3, v9);
}

void __46__PKAsyncCache__executeRetrievalBlock_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (v4)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v4 forKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v4 forKey:*(void *)(a1 + 40)];
  }
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [v3 deliverItem:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRetrievals, 0);
  objc_storeStrong((id *)&self->_weakItemByKey, 0);
  objc_storeStrong((id *)&self->_itemByKey, 0);
}

@end