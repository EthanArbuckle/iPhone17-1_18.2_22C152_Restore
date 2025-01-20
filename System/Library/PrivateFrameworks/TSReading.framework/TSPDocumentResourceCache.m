@interface TSPDocumentResourceCache
+ (id)defaultCacheURL;
+ (id)sharedCache;
- (BOOL)beginDocumentResourceAccessForDigestString:(id)a3;
- (BOOL)cacheDocumentResourceDigestString:(id)a3 extension:(id)a4 sourceURL:(id)a5 fileSize:(int64_t)a6 wasDownloaded:(BOOL)a7;
- (TSPDocumentResourceCache)init;
- (TSPDocumentResourceCache)initWithCacheURL:(id)a3;
- (id)URLForDocumentResourceDigestString:(id)a3;
- (id)entryForDigestString:(id)a3;
- (int64_t)maxCacheSizeInBytes;
- (void)clearCache;
- (void)endDocumentResourceAccessForDigestString:(id)a3;
- (void)enumerateEntriesFromCacheURLWithHandler:(id)a3;
- (void)reloadEntries;
- (void)setMaxCacheSizeInBytes:(int64_t)a3;
- (void)shrinkCache;
- (void)shrinkCacheWithMaxCacheSizeInBytes:(int64_t)a3;
@end

@implementation TSPDocumentResourceCache

+ (id)defaultCacheURL
{
  if (defaultCacheURL_onceToken != -1) {
    dispatch_once(&defaultCacheURL_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)defaultCacheURL_defaultCacheURL;

  return v2;
}

void __43__TSPDocumentResourceCache_defaultCacheURL__block_invoke()
{
  v0 = [MEMORY[0x263F08850] defaultManager];
  id v5 = 0;
  v1 = [v0 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:1 error:&v5];
  id v2 = v5;

  if (v1)
  {
    uint64_t v3 = [v1 URLByAppendingPathComponent:@"Document Resources" isDirectory:1];
    v4 = (void *)defaultCacheURL_defaultCacheURL;
    defaultCacheURL_defaultCacheURL = v3;
  }
  else
  {
    TSULogErrorInFunction();
  }
}

+ (id)sharedCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__TSPDocumentResourceCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, block);
  }
  id v2 = (void *)sharedCache_sharedCache;

  return v2;
}

void __39__TSPDocumentResourceCache_sharedCache__block_invoke(uint64_t a1)
{
  id v2 = [TSPDocumentResourceCache alloc];
  id v5 = [*(id *)(a1 + 32) defaultCacheURL];
  uint64_t v3 = [(TSPDocumentResourceCache *)v2 initWithCacheURL:v5];
  v4 = (void *)sharedCache_sharedCache;
  sharedCache_sharedCache = v3;
}

- (TSPDocumentResourceCache)init
{
  uint64_t v3 = [(id)objc_opt_class() defaultCacheURL];
  v4 = [(TSPDocumentResourceCache *)self initWithCacheURL:v3];

  return v4;
}

- (TSPDocumentResourceCache)initWithCacheURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSPDocumentResourceCache;
  id v5 = [(TSPDocumentResourceCache *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    cacheURL = v5->_cacheURL;
    v5->_cacheURL = (NSURL *)v6;

    v5->_maxCacheSizeInBytes = 5242880;
    dispatch_queue_t v8 = dispatch_queue_create("TSPDocumentResourceCache.Access", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    entries = v5->_entries;
    v5->_entries = v10;

    [(TSPDocumentResourceCache *)v5 reloadEntries];
  }

  return v5;
}

- (id)entryForDigestString:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_entries objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [[TSPDocumentResourceCacheEntry alloc] initWithDigestString:v4];
    [(NSMutableDictionary *)self->_entries setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)URLForDocumentResourceDigestString:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__TSPDocumentResourceCache_URLForDocumentResourceDigestString___block_invoke;
  block[3] = &unk_2646B0550;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__TSPDocumentResourceCache_URLForDocumentResourceDigestString___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) entryForDigestString:*(void *)(a1 + 40)];
  uint64_t v2 = [v7 URL];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

- (BOOL)cacheDocumentResourceDigestString:(id)a3 extension:(id)a4 sourceURL:(id)a5 fileSize:(int64_t)a6 wasDownloaded:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __105__TSPDocumentResourceCache_cacheDocumentResourceDigestString_extension_sourceURL_fileSize_wasDownloaded___block_invoke;
  block[3] = &unk_2646B0578;
  block[4] = self;
  id v21 = v12;
  BOOL v26 = a7;
  id v22 = v13;
  id v23 = v14;
  v24 = &v27;
  int64_t v25 = a6;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return (char)accessQueue;
}

void __105__TSPDocumentResourceCache_cacheDocumentResourceDigestString_extension_sourceURL_fileSize_wasDownloaded___block_invoke(uint64_t a1)
{
  v36[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) entryForDigestString:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 URL];
  if ([v3 checkResourceIsReachableAndReturnError:0])
  {
    if (v3)
    {
      if ([v2 wasDownloaded] && *(unsigned char *)(a1 + 80))
      {
        id v4 = [MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v5 = [NSString stringWithUTF8String:"-[TSPDocumentResourceCache cacheDocumentResourceDigestString:extension:sourceURL:fileSize:wasDownloaded:]_block_invoke"];
        id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDocumentResourceCache.m"];
        [v4 handleFailureInFunction:v5, v6, 179, @"Cache entry for digest %@ was downloaded more than once.", *(void *)(a1 + 40) file lineNumber description];
      }
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  [v3 createDirectoryAtURL:*(void *)(*(void *)(a1 + 32) + 8) withIntermediateDirectories:1 attributes:0 error:0];
  id v7 = *(void **)(*(void *)(a1 + 32) + 8);
  dispatch_queue_t v8 = [*(id *)(a1 + 40) stringByAppendingPathExtension:*(void *)(a1 + 48)];
  v9 = [v7 URLByAppendingPathComponent:v8];

  if (*(unsigned char *)(a1 + 80)) {
    char v10 = [v3 moveItemAtURL:*(void *)(a1 + 56) toURL:v9 error:0];
  }
  else {
    char v10 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v11 = 0;
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 56);
    id v34 = 0;
    char v13 = [v3 copyItemAtURL:v12 toURL:v9 error:&v34];
    id v11 = v34;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v13;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v22 = [*(id *)(a1 + 56) path];
      goto LABEL_24;
    }
  }
  [v2 setURL:v9];
  uint64_t v35 = *MEMORY[0x263EFF6B0];
  v36[0] = MEMORY[0x263EFFA88];
  id v14 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
  v15 = [v9 path];
  id v33 = v11;
  char v16 = [v3 setAttributes:v14 ofItemAtPath:v15 error:&v33];
  id v17 = v33;

  if ((v16 & 1) == 0)
  {
    uint64_t v27 = *(void *)(a1 + 40);
    id v28 = v17;
    TSULogErrorInFunction();
  }
  uint64_t v18 = *(void *)(a1 + 72);
  if (v18)
  {
    id v11 = v17;
    goto LABEL_19;
  }
  v32 = 0;
  uint64_t v19 = *MEMORY[0x263EFF688];
  id v31 = 0;
  uint64_t v20 = [v9 getResourceValue:&v32 forKey:v19 error:&v31];
  id v21 = v32;
  id v11 = v31;
  id v22 = v21;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v20;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
LABEL_24:
    TSULogErrorInFunction();

    goto LABEL_25;
  }
  uint64_t v18 = [v22 longLongValue];

LABEL_19:
  id v23 = v11;
  objc_msgSend(v2, "setFileSize:", v18, v27, v28);
  char v30 = 0;
  uint64_t v24 = *MEMORY[0x263EFF5E8];
  id v29 = 0;
  char v25 = [v9 getResourceValue:&v30 forKey:v24 error:&v29];
  BOOL v26 = v30;
  id v11 = v29;
  id v22 = v26;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v25;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    goto LABEL_24;
  }
  [v2 setContentAccessDate:v22];

  [v2 setWasDownloaded:*(unsigned __int8 *)(a1 + 80)];
  uint64_t v3 = 0;
LABEL_21:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
LABEL_25:
}

- (BOOL)beginDocumentResourceAccessForDigestString:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__TSPDocumentResourceCache_beginDocumentResourceAccessForDigestString___block_invoke;
  block[3] = &unk_2646B0550;
  block[4] = self;
  id v9 = v4;
  char v10 = &v11;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

void __71__TSPDocumentResourceCache_beginDocumentResourceAccessForDigestString___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entryForDigestString:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 URL];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 checkResourceIsReachableAndReturnError:0];
  objc_msgSend(v2, "setAccessCount:", objc_msgSend(v2, "accessCount") + 1);
  id v4 = [MEMORY[0x263EFF910] date];
  [v2 setContentAccessDate:v4];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v5 = [v2 contentAccessDate];
    uint64_t v6 = *MEMORY[0x263EFF5E8];
    id v10 = 0;
    char v7 = [v3 setResourceValue:v5 forKey:v6 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0)
    {
      id v9 = [v2 digestString];
      TSULogErrorInFunction();
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (void)endDocumentResourceAccessForDigestString:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__TSPDocumentResourceCache_endDocumentResourceAccessForDigestString___block_invoke;
  v7[3] = &unk_2646B05A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __69__TSPDocumentResourceCache_endDocumentResourceAccessForDigestString___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v7 = v2;
  if (v2)
  {
    uint64_t v3 = [v2 accessCount];
    [v7 setAccessCount:v3 - 1];
    if (v3 > 0) {
      goto LABEL_6;
    }
    id v4 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSPDocumentResourceCache endDocumentResourceAccessForDigestString:]_block_invoke"];
    id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDocumentResourceCache.m"];
    [v4 handleFailureInFunction:v5, v6, 226, @"Unbalanced calls to -beginUsingDocumentResource: and -endUsingDocumentResource: for document resource digest %@.", *(void *)(a1 + 40) file lineNumber description];
  }
  else
  {
    id v4 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSPDocumentResourceCache endDocumentResourceAccessForDigestString:]_block_invoke"];
    id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDocumentResourceCache.m"];
    [v4 handleFailureInFunction:v5, v6, 231, @"Cannot end using document resource with digest %@ because it is not cached.", *(void *)(a1 + 40) file lineNumber description];
  }

LABEL_6:
}

- (void)shrinkCache
{
}

- (void)clearCache
{
}

- (void)shrinkCacheWithMaxCacheSizeInBytes:(int64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__TSPDocumentResourceCache_shrinkCacheWithMaxCacheSizeInBytes___block_invoke;
  v4[3] = &unk_2646B0610;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

void __63__TSPDocumentResourceCache_shrinkCacheWithMaxCacheSizeInBytes___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "count"));
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __63__TSPDocumentResourceCache_shrinkCacheWithMaxCacheSizeInBytes___block_invoke_2;
  v24[3] = &unk_2646B05C8;
  BOOL v26 = &v27;
  id v18 = v2;
  id v25 = v18;
  [v3 enumerateKeysAndObjectsUsingBlock:v24];
  if (v28[3] > *(void *)(a1 + 40))
  {
    id v4 = [v18 sortedArrayUsingComparator:&__block_literal_global_42];
    uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "URL", v16, v17);
          id v19 = 0;
          int v12 = [v5 removeItemAtURL:v11 error:&v19];
          id v13 = v19;

          if (v12)
          {
            [v10 setURL:0];
            uint64_t v14 = [v10 fileSize];
            uint64_t v15 = v28[3] - v14;
            v28[3] = v15;
            if (v15 <= *(void *)(a1 + 40))
            {

              goto LABEL_13;
            }
          }
          else
          {
            char v16 = [v10 digestString];
            id v17 = v13;
            TSULogErrorInFunction();
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v31 count:16];
      }
      while (v7);
    }
LABEL_13:
  }
  _Block_object_dispose(&v27, 8);
}

void __63__TSPDocumentResourceCache_shrinkCacheWithMaxCacheSizeInBytes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = [v6 URL];
  int v5 = [v4 checkResourceIsReachableAndReturnError:0];

  if (v5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v6 fileSize];
    if (![v6 accessCount]) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
}

uint64_t __63__TSPDocumentResourceCache_shrinkCacheWithMaxCacheSizeInBytes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 contentAccessDate];
  id v6 = [v4 contentAccessDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)enumerateEntriesFromCacheURLWithHandler:(id)a3
{
  v54[4] = *MEMORY[0x263EF8340];
  id v31 = (void (**)(id, void *, void *, uint64_t, id, unsigned char *))a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  cacheURL = self->_cacheURL;
  uint64_t v6 = *MEMORY[0x263EFF6A8];
  uint64_t v39 = *MEMORY[0x263EFF750];
  v54[0] = *MEMORY[0x263EFF750];
  v54[1] = v6;
  uint64_t v7 = *MEMORY[0x263EFF5E8];
  uint64_t v34 = *MEMORY[0x263EFF688];
  v54[2] = *MEMORY[0x263EFF688];
  v54[3] = v7;
  uint64_t v32 = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:4];
  id v9 = [v4 enumeratorAtURL:cacheURL includingPropertiesForKeys:v8 options:0 errorHandler:0];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v50;
    id v37 = v10;
    uint64_t v38 = v6;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v50 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v49 + 1) + 8 * v14);
        char v16 = (void *)MEMORY[0x223CB9570](v11);
        id v47 = 0;
        id v48 = 0;
        char v17 = [v15 getResourceValue:&v48 forKey:v6 error:&v47];
        id v18 = v48;
        id v19 = v47;
        if ((v17 & 1) == 0)
        {
          TSULogErrorInFunction();
          goto LABEL_20;
        }
        if ([v18 BOOLValue]) {
          goto LABEL_20;
        }
        id v45 = 0;
        id v46 = 0;
        char v20 = [v15 getResourceValue:&v46 forKey:v39 error:&v45];
        id v21 = v46;
        id v22 = v45;

        if (v20)
        {
          v36 = v21;
          id v43 = 0;
          id v44 = 0;
          char v23 = [v15 getResourceValue:&v44 forKey:v34 error:&v43];
          id v24 = v44;
          id v25 = v43;

          if (v23)
          {
            id v33 = v24;
            id v41 = 0;
            id v42 = 0;
            char v26 = [v15 getResourceValue:&v42 forKey:v32 error:&v41];
            id v35 = v42;
            id v19 = v41;

            if (v26)
            {
              uint64_t v27 = v36;
              id v28 = [v36 stringByDeletingPathExtension];
              unsigned __int8 v40 = 0;
              uint64_t v29 = v33;
              v31[2](v31, v28, v15, [v33 longLongValue], v35, &v40);
              int v30 = v40;

              uint64_t v6 = v38;
              if (v30)
              {

                id v10 = v37;
                goto LABEL_22;
              }
            }
            else
            {
              TSULogErrorInFunction();
              uint64_t v6 = v38;
              uint64_t v29 = v24;
              uint64_t v27 = v36;
            }

            goto LABEL_19;
          }
          TSULogErrorInFunction();

          id v19 = v25;
        }
        else
        {
          TSULogErrorInFunction();

          id v19 = v22;
        }
        uint64_t v6 = v38;
LABEL_19:
        id v10 = v37;
LABEL_20:

        ++v14;
      }
      while (v12 != v14);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
      uint64_t v12 = v11;
    }
    while (v11);
  }
LABEL_22:
}

- (void)reloadEntries
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__TSPDocumentResourceCache_reloadEntries__block_invoke;
  block[3] = &unk_2646B0660;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __41__TSPDocumentResourceCache_reloadEntries__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__TSPDocumentResourceCache_reloadEntries__block_invoke_2;
  v3[3] = &unk_2646B0638;
  v3[4] = v1;
  return [v1 enumerateEntriesFromCacheURLWithHandler:v3];
}

void __41__TSPDocumentResourceCache_reloadEntries__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 entryForDigestString:a2];
  [v11 setURL:v10];

  [v11 setFileSize:a4];
  [v11 setContentAccessDate:v9];
}

- (int64_t)maxCacheSizeInBytes
{
  return self->_maxCacheSizeInBytes;
}

- (void)setMaxCacheSizeInBytes:(int64_t)a3
{
  self->_maxCacheSizeInBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_cacheURL, 0);
}

@end