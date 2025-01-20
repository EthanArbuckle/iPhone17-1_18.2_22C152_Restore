@interface SFSSCachingService
+ (id)sharedInstance;
- (NSCache)memoryCache;
- (SFSSCachingService)init;
- (id)objectForKey:(id)a3;
- (void)clear;
- (void)setMemoryCache:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation SFSSCachingService

- (void).cxx_destruct
{
}

- (void)setMemoryCache:(id)a3
{
}

- (NSCache)memoryCache
{
  return self->_memoryCache;
}

- (void)clear
{
  id v2 = [(SFSSCachingService *)self memoryCache];
  [v2 removeAllObjects];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(SFSSCachingService *)self memoryCache];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SFSSCachingService *)self memoryCache];
  [v8 setObject:v7 forKey:v6];
}

- (SFSSCachingService)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFSSCachingService;
  id v2 = [(SFSSCachingService *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    memoryCache = v2->_memoryCache;
    v2->_memoryCache = v3;

    [(NSCache *)v2->_memoryCache setCountLimit:100];
    [(NSCache *)v2->_memoryCache setEvictsObjectsWithDiscardedContent:1];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_529);
  }
  id v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __36__SFSSCachingService_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_alloc_init(SFSSCachingService);
  return MEMORY[0x270F9A758]();
}

@end