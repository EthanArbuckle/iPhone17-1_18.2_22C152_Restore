@interface PXReusableObjectPool
- (NSMutableDictionary)maximumPoolSizeByReuseIdentifier;
- (NSMutableDictionary)objectCreationBlocksByReuseIdentifier;
- (NSMutableDictionary)reusableObjectsByReuseIdentifier;
- (PXReusableObjectPool)init;
- (PXReusableObjectPoolDelegate)delegate;
- (id)checkOutReusableObjectWithReuseIdentifier:(int64_t)a3;
- (void)checkInReusableObject:(id)a3;
- (void)registerReusableObjectForReuseIdentifier:(int64_t)a3 creationHandler:(id)a4;
- (void)registerReusableObjectForReuseIdentifier:(int64_t)a3 maximumPoolSize:(int64_t)a4 creationHandler:(id)a5;
- (void)removeAllReusableObjectsWithReuseIdentifier:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PXReusableObjectPool

- (void)registerReusableObjectForReuseIdentifier:(int64_t)a3 maximumPoolSize:(int64_t)a4 creationHandler:(id)a5
{
  v8 = NSNumber;
  id v9 = a5;
  id v15 = [v8 numberWithInteger:a3];
  v10 = (void *)[v9 copy];

  v11 = _Block_copy(v10);
  v12 = [(PXReusableObjectPool *)self objectCreationBlocksByReuseIdentifier];
  [v12 setObject:v11 forKeyedSubscript:v15];

  v13 = [NSNumber numberWithInteger:a4];
  v14 = [(PXReusableObjectPool *)self maximumPoolSizeByReuseIdentifier];
  [v14 setObject:v13 forKeyedSubscript:v15];
}

- (void)checkInReusableObject:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 becomeReusable];
  if (self->_delegateFlags.respondsToObjectBecameReusable)
  {
    v5 = [(PXReusableObjectPool *)self delegate];
    [v5 reusableObjectPool:self objectBecameReusable:v4];
  }
  uint64_t v6 = objc_msgSend(v4, "_px_reuseIdentifier");
  v7 = [NSNumber numberWithInteger:v6];
  v8 = [(PXReusableObjectPool *)self reusableObjectsByReuseIdentifier];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  if (v9)
  {
    id v10 = (id)v9;
    v11 = [(PXReusableObjectPool *)self maximumPoolSizeByReuseIdentifier];
    v12 = [v11 objectForKeyedSubscript:v7];
    unint64_t v13 = [v12 unsignedIntegerValue];

    if (v13 && [v10 count] >= v13)
    {
      v14 = PFUIGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = 134218242;
        unint64_t v16 = v13;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl(&dword_259CDA000, v14, OS_LOG_TYPE_ERROR, "Dropping reusable object because we have reached our max pool size of %ld: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      [v10 addObject:v4];
    }
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v8 setObject:v10 forKeyedSubscript:v7];
  }
}

- (id)checkOutReusableObjectWithReuseIdentifier:(int64_t)a3
{
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [(PXReusableObjectPool *)self reusableObjectsByReuseIdentifier];
  v8 = [v7 objectForKeyedSubscript:v6];
  if ([v8 count])
  {
    uint64_t v9 = [v8 firstObject];
    [v8 removeObjectAtIndex:0];
    [v9 prepareForReuse];
    if (!self->_delegateFlags.respondsToObjectPreparedForReuse) {
      goto LABEL_9;
    }
    id v10 = [(PXReusableObjectPool *)self delegate];
    [v10 reusableObjectPool:self objectPreparedForReuse:v9];
  }
  else
  {
    v11 = [(PXReusableObjectPool *)self objectCreationBlocksByReuseIdentifier];
    id v10 = [v11 objectForKeyedSubscript:v6];

    if (!v10)
    {
      v14 = [MEMORY[0x263F08690] currentHandler];
      int v15 = [NSNumber numberWithInteger:a3];
      [v14 handleFailureInMethod:a2, self, @"PXReusableObjectPool.m", 77, @"no creation handlers registered for reuse identifier %@", v15 object file lineNumber description];
    }
    uint64_t v9 = v10[2](v10);
    objc_msgSend(v9, "_px_setReuseIdentifier:", a3);
    if (self->_delegateFlags.respondsToDidCreateReusableObject)
    {
      v12 = [(PXReusableObjectPool *)self delegate];
      [v12 reusableObjectPool:self didCreateReusableObject:v9];
    }
  }

LABEL_9:

  return v9;
}

- (NSMutableDictionary)reusableObjectsByReuseIdentifier
{
  return self->_reusableObjectsByReuseIdentifier;
}

- (NSMutableDictionary)maximumPoolSizeByReuseIdentifier
{
  return self->_maximumPoolSizeByReuseIdentifier;
}

- (NSMutableDictionary)objectCreationBlocksByReuseIdentifier
{
  return self->_objectCreationBlocksByReuseIdentifier;
}

- (void)registerReusableObjectForReuseIdentifier:(int64_t)a3 creationHandler:(id)a4
{
}

- (PXReusableObjectPool)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXReusableObjectPool;
  v2 = [(PXReusableObjectPool *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    objectCreationBlocksByReuseIdentifier = v2->_objectCreationBlocksByReuseIdentifier;
    v2->_objectCreationBlocksByReuseIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    reusableObjectsByReuseIdentifier = v2->_reusableObjectsByReuseIdentifier;
    v2->_reusableObjectsByReuseIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    maximumPoolSizeByReuseIdentifier = v2->_maximumPoolSizeByReuseIdentifier;
    v2->_maximumPoolSizeByReuseIdentifier = v7;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableObjectsByReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_maximumPoolSizeByReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_objectCreationBlocksByReuseIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (PXReusableObjectPoolDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PXReusableObjectPoolDelegate *)WeakRetained;
}

- (void)removeAllReusableObjectsWithReuseIdentifier:(int64_t)a3
{
  id v6 = [NSNumber numberWithInteger:a3];
  id v4 = [(PXReusableObjectPool *)self reusableObjectsByReuseIdentifier];
  v5 = [v4 objectForKeyedSubscript:v6];
  [v5 removeAllObjects];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToDidCreateReusableObject = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToObjectBecameReusable = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToObjectPreparedForReuse = objc_opt_respondsToSelector() & 1;
  }
}

@end