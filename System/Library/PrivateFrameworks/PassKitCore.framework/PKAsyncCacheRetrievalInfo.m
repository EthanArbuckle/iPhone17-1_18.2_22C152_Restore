@interface PKAsyncCacheRetrievalInfo
- (PKAsyncCacheRetrievalInfo)init;
- (id)synchronouslyRetrieve:(id)a3 outDeliveryBlocks:(id *)a4;
- (void)addDeliveryBlock:(id)a3;
- (void)deliverItem:(id)a3;
@end

@implementation PKAsyncCacheRetrievalInfo

- (id)synchronouslyRetrieve:(id)a3 outDeliveryBlocks:(id *)a4
{
  v6 = (void (**)(id, void *))a3;
  uint64_t v12 = 0;
  v13 = (id *)&v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  os_unfair_lock_lock(&self->_lock);
  if (self->_itemFetched)
  {
    objc_storeStrong(v13 + 5, self->_item);
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__PKAsyncCacheRetrievalInfo_synchronouslyRetrieve_outDeliveryBlocks___block_invoke;
    v11[3] = &unk_1E56DDD80;
    v11[4] = &v12;
    v6[2](v6, v11);
  }
  objc_storeStrong(&self->_item, v13[5]);
  self->_itemFetched = 1;
  if (a4)
  {
LABEL_7:
    v7 = (void *)[(NSMutableArray *)self->_deliveryBlocks count];
    if (v7) {
      v7 = (void *)[(NSMutableArray *)self->_deliveryBlocks copy];
    }
    id v8 = *a4;
    *a4 = v7;

    [(NSMutableArray *)self->_deliveryBlocks removeAllObjects];
  }
LABEL_10:
  os_unfair_lock_unlock(&self->_lock);
  id v9 = v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (PKAsyncCacheRetrievalInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKAsyncCacheRetrievalInfo;
  v2 = [(PKAsyncCacheRetrievalInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deliveryBlocks = v3->_deliveryBlocks;
    v3->_deliveryBlocks = v4;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryBlocks, 0);
  objc_storeStrong(&self->_item, 0);
}

void __69__PKAsyncCacheRetrievalInfo_synchronouslyRetrieve_outDeliveryBlocks___block_invoke(uint64_t a1, void *a2)
{
}

- (void)addDeliveryBlock:(id)a3
{
  v4 = (void (**)(id, id))a3;
  if (v4)
  {
    v10 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_itemFetched)
    {
      id v6 = self->_item;
      os_unfair_lock_unlock(p_lock);
      v10[2](v10, v6);
    }
    else
    {
      deliveryBlocks = self->_deliveryBlocks;
      id v8 = (void *)[v10 copy];
      id v9 = _Block_copy(v8);
      [(NSMutableArray *)deliveryBlocks addObject:v9];

      os_unfair_lock_unlock(p_lock);
    }
    v4 = v10;
  }
}

- (void)deliverItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong(&self->_item, a3);
  self->_itemFetched = 1;
  if ([(NSMutableArray *)self->_deliveryBlocks count]) {
    id v6 = (void *)[(NSMutableArray *)self->_deliveryBlocks copy];
  }
  else {
    id v6 = 0;
  }
  [(NSMutableArray *)self->_deliveryBlocks removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

@end