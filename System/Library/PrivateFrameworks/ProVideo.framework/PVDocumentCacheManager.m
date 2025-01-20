@interface PVDocumentCacheManager
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
+ (void)removeAllEffects;
- (PVDocumentCacheManager)init;
- (id)generateKeyFromFilePathString:(id)a3;
- (void)cacheOZXDocument:(void *)a3 forKey:(id)a4 timeElapsed:(double)a5 memoryInfo:(unint64_t)a6;
- (void)dealloc;
- (void)getOZXDocumentForKey:(id)a3;
- (void)newOZXDocumentForKey:(id)a3;
- (void)removeAllObjects;
- (void)setCountLimit:(unint64_t)a3;
- (void)setTotalCostLimit:(unint64_t)a3;
@end

@implementation PVDocumentCacheManager

+ (id)sharedInstance
{
  id result = (id)s_sharedInstance;
  if (!s_sharedInstance)
  {
    if (s_wasReleased)
    {
      return 0;
    }
    else
    {
      objc_sync_enter(a1);
      if (!s_sharedInstance) {
        s_sharedInstance = objc_alloc_init(PVDocumentCacheManager);
      }
      objc_sync_exit(a1);
      return (id)s_sharedInstance;
    }
  }
  return result;
}

+ (void)releaseSharedInstance
{
  s_wasReleased = 1;

  s_sharedInstance = 0;
}

+ (void)removeAllEffects
{
}

- (PVDocumentCacheManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)PVDocumentCacheManager;
  v2 = [(PVDocumentCacheManager *)&v5 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    v2->_cache = v3;
    [(NSCache *)v3 setCountLimit:30];
    [(NSCache *)v2->_cache setTotalCostLimit:300000000];
    [(NSCache *)v2->_cache setEvictsObjectsWithDiscardedContent:1];
    [(NSCache *)v2->_cache setDelegate:v2];
  }
  return v2;
}

- (void)setCountLimit:(unint64_t)a3
{
}

- (void)setTotalCostLimit:(unint64_t)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PVDocumentCacheManager;
  [(PVDocumentCacheManager *)&v3 dealloc];
}

- (void)removeAllObjects
{
}

- (id)generateKeyFromFilePathString:(id)a3
{
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
  if (!v4) {
    return a3;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "fileModificationDate"), "description");

  return (id)[a3 stringByAppendingString:v5];
}

- (void)cacheOZXDocument:(void *)a3 forKey:(id)a4 timeElapsed:(double)a5 memoryInfo:(unint64_t)a6
{
  uint64_t v12 = 0;
  if (a3)
  {
    OZXCopyDocument(a3, &v12);
    v9 = [PVDocumentWrapper alloc];
    v10 = [(PVDocumentWrapper *)v9 initWithOZXDocument:v12 forKey:a4];
    v11 = v10;
    [(NSCache *)self->_cache setObject:v10 forKey:[(PVDocumentCacheManager *)self generateKeyFromFilePathString:a4] cost:a6];
  }
}

- (void)newOZXDocumentForKey:(id)a3
{
  v4 = 0;
  id result = [(NSCache *)self->_cache objectForKey:[(PVDocumentCacheManager *)self generateKeyFromFilePathString:a3]];
  if (result)
  {
    OZXCopyDocument((void *)[result ozxDocument], &v4);
    return v4;
  }
  return result;
}

- (void)getOZXDocumentForKey:(id)a3
{
  id result = [(NSCache *)self->_cache objectForKey:[(PVDocumentCacheManager *)self generateKeyFromFilePathString:a3]];
  if (result)
  {
    return (void *)[result ozxDocument];
  }
  return result;
}

@end