@interface WFContentItemCache
+ (BOOL)supportsSecureCoding;
- (NSMapTable)cache;
- (OS_dispatch_queue)dispatchQueue;
- (WFContentItemCache)init;
- (WFContentItemCache)initWithCache:(id)a3;
- (WFContentItemCache)initWithCoder:(id)a3;
- (id)contentItemForUUID:(id)a3;
- (void)addContentCollection:(id)a3;
- (void)clear;
- (void)deleteContentCollection:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContentItemCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSMapTable)cache
{
  return self->_cache;
}

- (WFContentItemCache)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"cache"];

  if (v9)
  {
    self = [(WFContentItemCache *)self initWithCache:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentItemCache *)self cache];
  [v4 encodeObject:v5 forKey:@"cache"];
}

- (void)clear
{
  v3 = [(WFContentItemCache *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__WFContentItemCache_clear__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __27__WFContentItemCache_clear__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cache];
  [v1 removeAllObjects];
}

- (id)contentItemForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__56374;
  v16 = __Block_byref_object_dispose__56375;
  id v17 = 0;
  id v5 = [(WFContentItemCache *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__WFContentItemCache_contentItemForUUID___block_invoke;
  block[3] = &unk_1E6558270;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __41__WFContentItemCache_contentItemForUUID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) cache];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)deleteContentCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentItemCache *)self dispatchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__WFContentItemCache_deleteContentCollection___block_invoke;
  v7[3] = &unk_1E6558938;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __46__WFContentItemCache_deleteContentCollection___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "items", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = [*(id *)(a1 + 40) cache];
        v9 = [v7 cachingIdentifier];
        [v8 removeObjectForKey:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)addContentCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFContentItemCache *)self dispatchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__WFContentItemCache_addContentCollection___block_invoke;
  v7[3] = &unk_1E6558938;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __43__WFContentItemCache_addContentCollection___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "items", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = [*(id *)(a1 + 40) cache];
        v9 = [v7 cachingIdentifier];
        [v8 setObject:v7 forKey:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (WFContentItemCache)initWithCache:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFContentItemCache;
  uint64_t v6 = [(WFContentItemCache *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cache, a3);
    id v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.Shortcuts.ContentItemCacheQueue", v8);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v9;

    long long v11 = v7;
  }

  return v7;
}

- (WFContentItemCache)init
{
  uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithStrongToStrongObjects];
  uint64_t v4 = [(WFContentItemCache *)self initWithCache:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end