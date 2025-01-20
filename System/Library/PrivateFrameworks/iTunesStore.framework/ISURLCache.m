@interface ISURLCache
+ (id)cacheDirectoryPath;
- (ISURLCache)init;
- (ISURLCache)initWithCacheConfiguration:(id)a3;
- (NSString)persistentIdentifier;
- (id)cachedResponseForRequest:(id)a3;
- (unint64_t)currentDiskUsage;
- (unint64_t)currentMemoryUsage;
- (unint64_t)diskCapacity;
- (unint64_t)memoryCapacity;
- (void)dealloc;
- (void)purgeMemoryCache;
- (void)reloadWithCacheConfiguration:(id)a3;
- (void)removeAllCachedResponses;
- (void)removeCachedResponseForRequest:(id)a3;
- (void)saveMemoryCacheToDisk;
- (void)storeCachedResponse:(id)a3 forRequest:(id)a4;
@end

@implementation ISURLCache

- (ISURLCache)init
{
  return [(ISURLCache *)self initWithCacheConfiguration:0];
}

- (ISURLCache)initWithCacheConfiguration:(id)a3
{
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Must provide a configuration"];
  }
  v8.receiver = self;
  v8.super_class = (Class)ISURLCache;
  v5 = [(ISURLCache *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ISURLCache *)v5 reloadWithCacheConfiguration:a3];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISURLCache;
  [(ISURLCache *)&v3 dealloc];
}

+ (id)cacheDirectoryPath
{
  id result = (id)cacheDirectoryPath_sCacheDirectoryPath;
  if (!cacheDirectoryPath_sCacheDirectoryPath)
  {
    objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", -[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"), @"com.apple.iTunesStore", @"URLCache", 0);
    v4 = (void *)[NSString pathWithComponents:v3];
    if ([MEMORY[0x263F08850] ensureDirectoryExists:v4]) {
      cacheDirectoryPath_sCacheDirectoryPath = v4;
    }

    return (id)cacheDirectoryPath_sCacheDirectoryPath;
  }
  return result;
}

- (NSString)persistentIdentifier
{
  return [(ISURLCacheConfiguration *)self->_configuration persistentIdentifier];
}

- (void)reloadWithCacheConfiguration:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Must provide a configuration"];
  }
  if (self->_configuration != a3)
  {
    uint64_t v5 = [a3 persistentIdentifier];
    if (self->_cache)
    {
      BOOL v6 = [(NSString *)[(ISURLCache *)self persistentIdentifier] isEqualToString:v5];
      cache = self->_cache;
      if (v6)
      {
        -[NSURLCache setDiskCapacity:](cache, "setDiskCapacity:", [a3 diskCapacity]);
        -[NSURLCache setMemoryCapacity:](self->_cache, "setMemoryCapacity:", [a3 memoryCapacity]);
LABEL_9:

        self->_configuration = (ISURLCacheConfiguration *)[a3 copy];
        v9 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v9) {
          v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v10 = [v9 shouldLog];
        if ([v9 shouldLogToDisk]) {
          int v11 = v10 | 2;
        }
        else {
          int v11 = v10;
        }
        if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_INFO)) {
          v11 &= 2u;
        }
        if (v11)
        {
          int v15 = 138413058;
          uint64_t v16 = objc_opt_class();
          __int16 v17 = 2112;
          uint64_t v18 = v5;
          __int16 v19 = 2048;
          uint64_t v20 = [a3 diskCapacity];
          __int16 v21 = 2048;
          uint64_t v22 = [a3 memoryCapacity];
          LODWORD(v14) = 42;
          uint64_t v12 = _os_log_send_and_compose_impl();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v15, v14);
            free(v13);
            SSFileLog();
          }
        }
        return;
      }
    }
    else
    {
      cache = 0;
    }

    objc_super v8 = (NSURLCache *)objc_msgSend(objc_alloc(MEMORY[0x263F08B98]), "initWithMemoryCapacity:diskCapacity:diskPath:", objc_msgSend(a3, "memoryCapacity"), objc_msgSend(a3, "diskCapacity"), v5);
    self->_cache = v8;
    [(NSURLCache *)v8 _CFURLCache];
    _CFURLCacheLoadMemoryFromDiskNow();
    goto LABEL_9;
  }
}

- (id)cachedResponseForRequest:(id)a3
{
  return [(NSURLCache *)self->_cache cachedResponseForRequest:a3];
}

- (unint64_t)currentDiskUsage
{
  return [(NSURLCache *)self->_cache currentDiskUsage];
}

- (unint64_t)currentMemoryUsage
{
  return [(NSURLCache *)self->_cache currentMemoryUsage];
}

- (unint64_t)diskCapacity
{
  return [(NSURLCache *)self->_cache diskCapacity];
}

- (unint64_t)memoryCapacity
{
  return [(NSURLCache *)self->_cache memoryCapacity];
}

- (void)purgeMemoryCache
{
  uint64_t v2 = [(NSURLCache *)self->_cache _CFURLCache];

  MEMORY[0x270EE2A78](v2);
}

- (void)removeAllCachedResponses
{
}

- (void)removeCachedResponseForRequest:(id)a3
{
}

- (void)saveMemoryCacheToDisk
{
  uint64_t v2 = [(NSURLCache *)self->_cache _CFURLCache];

  MEMORY[0x270EE2A70](v2);
}

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
}

@end