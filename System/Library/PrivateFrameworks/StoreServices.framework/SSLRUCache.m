@interface SSLRUCache
- (NSMutableDictionary)backingDictionary;
- (OS_dispatch_queue)accessQueue;
- (SSDoubleLinkedList)backingList;
- (SSLRUCache)init;
- (SSLRUCache)initWithMaxSize:(unint64_t)a3;
- (SSLogConfig)logConfig;
- (id)allObjectsAndKeys;
- (id)description;
- (id)objectForKey:(id)a3;
- (unint64_t)_count;
- (unint64_t)count;
- (unint64_t)maxSize;
- (void)_addObject:(id)a3 forKey:(id)a4;
- (void)_removeObjectForKey:(id)a3;
- (void)removeAllObjects;
- (void)setAccessQueue:(id)a3;
- (void)setBackingDictionary:(id)a3;
- (void)setBackingList:(id)a3;
- (void)setLogConfig:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation SSLRUCache

- (SSLRUCache)init
{
  return [(SSLRUCache *)self initWithMaxSize:5];
}

- (SSLRUCache)initWithMaxSize:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SSLRUCache;
  v4 = [(SSLRUCache *)&v16 init];
  if (v4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.StoreServices.SSLRUCache.accessQueue.%p", v4);
    id v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    backingDictionary = v4->_backingDictionary;
    v4->_backingDictionary = v8;

    v10 = objc_alloc_init(SSDoubleLinkedList);
    backingList = v4->_backingList;
    v4->_backingList = v10;

    v4->_maxSize = a3;
    v12 = objc_alloc_init(SSMutableLogConfig);
    [(SSLogConfig *)v12 setCategory:@"SSLRUCache"];
    [(SSLogConfig *)v12 setSubsystem:@"com.apple.StoreServices"];
    [(SSLogConfig *)v12 setWriteToDisk:0];
    uint64_t v13 = [(SSMutableLogConfig *)v12 copy];
    logConfig = v4->_logConfig;
    v4->_logConfig = (SSLogConfig *)v13;
  }
  return v4;
}

void __31__SSLRUCache_setObject_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = WeakRetained;
  if (v3) {
    [WeakRetained _addObject:v3 forKey:v4];
  }
  else {
    [WeakRetained _removeObjectForKey:v4];
  }
}

void __27__SSLRUCache_objectForKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backingDictionary];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    dispatch_queue_t v6 = [*(id *)(a1 + 32) backingList];
    [v6 removeNode:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    id v7 = [*(id *)(a1 + 32) backingList];
    [v7 insertNode:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

- (void)_addObject:(id)a3 forKey:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    v8 = [(SSLRUCache *)self backingDictionary];
    v9 = [v8 objectForKey:v6];

    if (v9)
    {
      v10 = [(SSLRUCache *)self backingList];
      [v10 removeNode:v9];
    }
    v11 = [[SSLRUCacheItem alloc] initWithKey:v6 object:v7];

    v12 = [(SSLRUCache *)self backingList];
    uint64_t v13 = [v12 insertObject:v11];

    v14 = [(SSLRUCache *)self backingDictionary];
    [v14 setObject:v13 forKey:v6];

    unint64_t v15 = [(SSLRUCache *)self _count];
    if (v15 <= [(SSLRUCache *)self maxSize]) {
      goto LABEL_17;
    }
    objc_super v16 = [(SSLRUCache *)self logConfig];
    if (!v16)
    {
      objc_super v16 = +[SSLogConfig sharedConfig];
    }
    int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    v19 = [v16 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      LODWORD(v33) = 138412290;
      *(void *)((char *)&v33 + 4) = objc_opt_class();
      id v20 = *(id *)((char *)&v33 + 4);
      LODWORD(v32) = 12;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_16:

        v28 = [(SSLRUCache *)self backingList];
        v29 = [v28 tail];

        v30 = [v29 object];
        v31 = [v30 key];
        [(SSLRUCache *)self _removeObjectForKey:v31];

LABEL_17:
        goto LABEL_18;
      }
      v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v33, v32, v33);
      free(v21);
      SSFileLog(v16, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v19);
    }

    goto LABEL_16;
  }
LABEL_18:
}

- (NSMutableDictionary)backingDictionary
{
  return self->_backingDictionary;
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (SSDoubleLinkedList)backingList
{
  return self->_backingList;
}

- (unint64_t)_count
{
  v2 = [(SSLRUCache *)self backingDictionary];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(SSLRUCache *)self accessQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __31__SSLRUCache_setObject_forKey___block_invoke;
  v11[3] = &unk_1E5BA9318;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)objectForKey:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__50;
  long long v33 = __Block_byref_object_dispose__50;
  id v34 = 0;
  id v5 = [(SSLRUCache *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SSLRUCache_objectForKey___block_invoke;
  block[3] = &unk_1E5BA6F80;
  v28 = &v29;
  block[4] = self;
  id v6 = v4;
  id v27 = v6;
  dispatch_sync(v5, block);

  id v7 = [(id)v30[5] object];
  if (!v7)
  {
    v8 = [(SSLRUCache *)self logConfig];
    if (!v8)
    {
      v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    int v10 = [v8 shouldLogToDisk];
    v11 = [v8 OSLogObject];
    id v12 = v11;
    if (v10) {
      v9 |= 2u;
    }
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      v9 &= 2u;
    }
    if (v9)
    {
      id v13 = objc_opt_class();
      int v35 = 138412546;
      v36 = v13;
      __int16 v37 = 2112;
      id v38 = v6;
      id v14 = v13;
      LODWORD(v25) = 22;
      uint64_t v24 = &v35;
      unint64_t v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_12:

        goto LABEL_13;
      }
      id v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v35, v25);
      free(v15);
      SSFileLog(v8, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v12);
    }

    goto LABEL_12;
  }
LABEL_13:
  uint64_t v22 = objc_msgSend(v7, "object", v24);

  _Block_object_dispose(&v29, 8);
  return v22;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (SSLogConfig)logConfig
{
  return self->_logConfig;
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  unint64_t v3 = [(SSLRUCache *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __19__SSLRUCache_count__block_invoke;
  v6[3] = &unk_1E5BA6F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __19__SSLRUCache_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)allObjectsAndKeys
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v4 = [(SSLRUCache *)self accessQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__SSLRUCache_allObjectsAndKeys__block_invoke;
  v9[3] = &unk_1E5BA7018;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(v4, v9);

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __31__SSLRUCache_allObjectsAndKeys__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backingDictionary];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__SSLRUCache_allObjectsAndKeys__block_invoke_2;
  v3[3] = &unk_1E5BACBA8;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __31__SSLRUCache_allObjectsAndKeys__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v5 object];
  id v7 = [v6 object];

  if (v7)
  {
    v8 = [v5 object];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

- (void)removeAllObjects
{
  objc_initWeak(&location, self);
  id v3 = [(SSLRUCache *)self accessQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__SSLRUCache_removeAllObjects__block_invoke;
  v4[3] = &unk_1E5BA8810;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __30__SSLRUCache_removeAllObjects__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained backingDictionary];
  [v1 removeAllObjects];

  v2 = [WeakRetained backingList];
  [v2 removeAllNodes];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v16.receiver = self;
  v16.super_class = (Class)SSLRUCache;
  id v4 = [(SSLRUCache *)&v16 description];
  [v3 appendString:v4];

  [v3 appendString:@" {"];
  id v5 = [(SSLRUCache *)self accessQueue];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __25__SSLRUCache_description__block_invoke;
  id v13 = &unk_1E5BA7018;
  id v14 = self;
  id v6 = v3;
  id v15 = v6;
  dispatch_sync(v5, &v10);

  objc_msgSend(v6, "appendString:", @"\n}", v10, v11, v12, v13, v14);
  id v7 = v15;
  id v8 = v6;

  return v8;
}

void __25__SSLRUCache_description__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [*(id *)(a1 + 32) backingList];
  id v3 = [v2 allNodes];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v13 + 1) + 8 * v7) object];
        id v9 = v8;
        if (v8)
        {
          uint64_t v10 = *(void **)(a1 + 40);
          uint64_t v11 = [v8 key];
          id v12 = [v9 object];
          [v10 appendFormat:@"\n%@: %@,", v11, v12];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)_removeObjectForKey:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(SSLRUCache *)self backingDictionary];
  uint64_t v5 = [v4 objectForKey:v8];

  if (v5)
  {
    uint64_t v6 = [(SSLRUCache *)self backingList];
    [v6 removeNode:v5];

    uint64_t v7 = [(SSLRUCache *)self backingDictionary];
    [v7 removeObjectForKey:v8];
  }
}

- (void)setAccessQueue:(id)a3
{
}

- (void)setBackingDictionary:(id)a3
{
}

- (void)setBackingList:(id)a3
{
}

- (void)setLogConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logConfig, 0);
  objc_storeStrong((id *)&self->_backingList, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end