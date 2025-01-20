@interface TSUCache
- (BOOL)hasFlushableContent;
- (TSUCache)init;
- (TSUCache)initWithName:(id)a3;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)p_objectForKey:(id)a3;
- (id)p_objectsForKeys:(id)a3 notFoundMarker:(id)a4;
- (unint64_t)count;
- (void)dealloc;
- (void)p_addEntriesFromDictionary:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)unload;
@end

@implementation TSUCache

- (TSUCache)initWithName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSUCache;
  v4 = [(TSUFlushableObject *)&v6 init];
  if (v4) {
    v4->mCacheName = (NSString *)a3;
  }
  return v4;
}

- (TSUCache)init
{
  return [(TSUCache *)self initWithName:@"UnnamedCache"];
}

- (void)dealloc
{
  [(TSUCache *)self unload];

  self->mCacheName = 0;
  self->mCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUCache;
  [(TSUFlushableObject *)&v3 dealloc];
}

- (void)unload
{
  self->mCache = 0;
}

- (BOOL)hasFlushableContent
{
  return self->mCache != 0;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  [(TSUFlushableObject *)self ownerWillAccess];
  objc_sync_enter(self);
  mCache = self->mCache;
  if (!mCache)
  {
    mCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->mCache = mCache;
  }
  [(NSMutableDictionary *)mCache setObject:a3 forKey:a4];
  objc_sync_exit(self);
  [(TSUFlushableObject *)self ownerDidAccess];
}

- (id)objectForKey:(id)a3
{
  [(TSUFlushableObject *)self ownerWillAccess];
  objc_sync_enter(self);
  id v5 = (id)[(NSMutableDictionary *)self->mCache objectForKey:a3];
  objc_sync_exit(self);
  [(TSUFlushableObject *)self ownerDidAccess];
  return v5;
}

- (void)removeObjectForKey:(id)a3
{
  [(TSUFlushableObject *)self ownerWillAccess];
  objc_sync_enter(self);
  mCache = self->mCache;
  if (mCache) {
    [(NSMutableDictionary *)mCache removeObjectForKey:a3];
  }
  objc_sync_exit(self);
  [(TSUFlushableObject *)self ownerDidAccess];
}

- (void)removeAllObjects
{
  [(TSUFlushableObject *)self ownerWillAccess];
  objc_sync_enter(self);
  mCache = self->mCache;
  if (mCache) {
    [(NSMutableDictionary *)mCache removeAllObjects];
  }
  objc_sync_exit(self);
  [(TSUFlushableObject *)self ownerDidAccess];
}

- (unint64_t)count
{
  unint64_t result = (unint64_t)self->mCache;
  if (result) {
    return [(id)result count];
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  mCacheName = self->mCacheName;
  mCache = self->mCache;
  if (mCache) {
    uint64_t v8 = [(NSMutableDictionary *)self->mCache count];
  }
  else {
    uint64_t v8 = 0;
  }
  return (id)[v3 stringWithFormat:@"<%@ %p %@ cache=%p with %lu key/values >", v5, self, mCacheName, mCache, v8];
}

- (id)p_objectForKey:(id)a3
{
  [(TSUFlushableObject *)self ownerWillAccess];
  id v5 = (id)[(NSMutableDictionary *)self->mCache objectForKey:a3];
  [(TSUFlushableObject *)self ownerDidAccess];
  return v5;
}

- (void)p_addEntriesFromDictionary:(id)a3
{
  [(TSUFlushableObject *)self ownerWillAccess];
  mCache = self->mCache;
  if (!mCache)
  {
    mCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->mCache = mCache;
  }
  [(NSMutableDictionary *)mCache addEntriesFromDictionary:a3];
  [(TSUFlushableObject *)self ownerDidAccess];
}

- (id)p_objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  [(TSUFlushableObject *)self ownerWillAccess];
  v7 = (void *)[(NSMutableDictionary *)self->mCache objectsForKeys:a3 notFoundMarker:a4];
  [(TSUFlushableObject *)self ownerDidAccess];
  return v7;
}

@end