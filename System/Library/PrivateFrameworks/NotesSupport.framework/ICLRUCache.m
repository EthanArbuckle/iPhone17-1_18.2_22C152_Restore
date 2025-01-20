@interface ICLRUCache
+ (id)cacheCollection;
+ (void)purgeAllCaches;
- (ICLRUCache)initWithMaxSize:(unint64_t)a3;
- (ICLRUCacheDelegate)delegate;
- (NSArray)allKeys;
- (id)objectForKey:(id)a3;
- (unint64_t)maxSize;
- (void)p_removeOldestObject;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation ICLRUCache

- (ICLRUCache)initWithMaxSize:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ICLRUCache;
  v4 = [(ICLRUCache *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->mMax = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:a3];
    mData = v5->mData;
    v5->mData = (NSMapTable *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
    mOrderedKeys = v5->mOrderedKeys;
    v5->mOrderedKeys = (NSMutableArray *)v8;

    v10 = [(id)objc_opt_class() cacheCollection];
    [v10 addPointer:v5];

    v11 = v5;
  }

  return v5;
}

+ (id)cacheCollection
{
  if (cacheCollection_onceToken_0 != -1) {
    dispatch_once(&cacheCollection_onceToken_0, &__block_literal_global_14);
  }
  v2 = (void *)cacheCollection_sCacheCollection_0;
  return v2;
}

uint64_t __29__ICLRUCache_cacheCollection__block_invoke()
{
  cacheCollection_sCacheCollection_0 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
  return MEMORY[0x270F9A758]();
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(NSMutableArray *)self->mOrderedKeys count] >= self->mMax) {
    [(ICLRUCache *)self p_removeOldestObject];
  }
  uint64_t v7 = [(NSMutableArray *)self->mOrderedKeys indexOfObject:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->mOrderedKeys removeObjectAtIndex:v7];
  }
  [(NSMapTable *)self->mData setObject:v8 forKey:v6];
  [(NSMutableArray *)self->mOrderedKeys addObject:v6];
}

- (void)removeObjectForKey:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    [(NSMapTable *)self->mData removeObjectForKey:v6];
    [(NSMutableArray *)self->mOrderedKeys removeObjectAtIndex:v5];
  }
}

- (void)removeAllObjects
{
  [(NSMutableArray *)self->mOrderedKeys removeAllObjects];
  mData = self->mData;
  [(NSMapTable *)mData removeAllObjects];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->mOrderedKeys indexOfObject:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = v5;
    id v6 = [(NSMapTable *)self->mData objectForKey:v4];
    [(NSMutableArray *)self->mOrderedKeys addObject:v4];
    [(NSMutableArray *)self->mOrderedKeys removeObjectAtIndex:v7];
  }

  return v6;
}

- (NSArray)allKeys
{
  return (NSArray *)self->mOrderedKeys;
}

+ (void)purgeAllCaches
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = +[ICLRUCache cacheCollection];
  v3 = [v2 allObjects];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) removeAllObjects];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)p_removeOldestObject
{
  id v6 = [(NSMutableArray *)self->mOrderedKeys objectAtIndex:0];
  v3 = [(ICLRUCache *)self delegate];

  if (v3)
  {
    uint64_t v4 = [(NSMapTable *)self->mData objectForKey:v6];
    uint64_t v5 = [(ICLRUCache *)self delegate];
    [v5 willEvictObject:v4 forKey:v6];
  }
  [(NSMapTable *)self->mData removeObjectForKey:v6];
  [(NSMutableArray *)self->mOrderedKeys removeObjectAtIndex:0];
}

- (unint64_t)maxSize
{
  return self->mMax;
}

- (ICLRUCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICLRUCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mOrderedKeys, 0);
  objc_storeStrong((id *)&self->mData, 0);
}

@end