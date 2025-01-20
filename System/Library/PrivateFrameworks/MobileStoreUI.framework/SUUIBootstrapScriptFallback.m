@interface SUUIBootstrapScriptFallback
+ (id)cacheFilenameForStoreFrontIdentifier:(id)a3;
+ (id)defaultCacheFolder;
- (BOOL)_setCacheAge:(id)a3 error:(id *)a4;
- (BOOL)canFallbackForError:(id)a3;
- (BOOL)isBagAvailable;
- (NSString)cacheFilename;
- (NSURL)cacheFolder;
- (NSURL)cachedFileLocation;
- (OS_dispatch_queue)queue;
- (SUUIBootstrapScriptFallback)init;
- (SUUIBootstrapScriptFallback)initWithCacheFolder:(id)a3 filename:(id)a4;
- (SUUIBootstrapScriptFallback)initWithFilename:(id)a3;
- (double)maximumAge;
- (id)retrieveScript:(id *)a3;
- (int64_t)_unsynchronizedState;
- (int64_t)state;
- (void)_createCacheDirectoriesIfNeeded;
- (void)_logError:(id)a3 forOperation:(id)a4;
- (void)_runWhenBackgroundWorkFinished:(id)a3;
- (void)invalidate;
- (void)scriptEvaluated:(id)a3;
- (void)setMaximumAge:(double)a3;
@end

@implementation SUUIBootstrapScriptFallback

+ (id)defaultCacheFolder
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  id v12 = 0;
  v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:&v12];
  id v4 = v12;

  if (!v3)
  {
    NSLog(&cfstr_CouldNotFindCa.isa, v4);
    v5 = NSURL;
    v6 = NSTemporaryDirectory();
    v3 = [v5 fileURLWithPath:v6];
  }
  v7 = [MEMORY[0x263F086E0] mainBundle];
  v8 = [v7 bundleIdentifier];

  if ([v8 length])
  {
    uint64_t v9 = [v3 URLByAppendingPathComponent:v8];

    v3 = (void *)v9;
  }
  v10 = [v3 URLByAppendingPathComponent:@"SUUIBootstrapScriptFallback"];

  return v10;
}

+ (id)cacheFilenameForStoreFrontIdentifier:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
  id v4 = [NSString stringWithFormat:@"%@-%@.%@", v3, @"v1", @"js"];

  return v4;
}

- (SUUIBootstrapScriptFallback)initWithCacheFolder:(id)a3 filename:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 isFileURL] & 1) == 0)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SUUIBootstrapScriptFallback.m", 105, @"cacheFolder is not a file URL: %@", v8 object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SUUIBootstrapScriptFallback;
  v10 = [(SUUIBootstrapScriptFallback *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_cacheFolder, a3);
    uint64_t v12 = [v9 copy];
    cacheFilename = v11->_cacheFilename;
    v11->_cacheFilename = (NSString *)v12;

    v11->_maximumAge = 604800.0;
    dispatch_queue_t v14 = dispatch_queue_create("SUUIBootstrapScriptFallback", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    [(SUUIBootstrapScriptFallback *)v11 _createCacheDirectoriesIfNeeded];
  }

  return v11;
}

- (SUUIBootstrapScriptFallback)initWithFilename:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() defaultCacheFolder];
  v6 = [(SUUIBootstrapScriptFallback *)self initWithCacheFolder:v5 filename:v4];

  return v6;
}

- (SUUIBootstrapScriptFallback)init
{
  return 0;
}

- (int64_t)state
{
  v3 = [(SUUIBootstrapScriptFallback *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = [(SUUIBootstrapScriptFallback *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__SUUIBootstrapScriptFallback_state__block_invoke;
  v7[3] = &unk_2654008E0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __36__SUUIBootstrapScriptFallback_state__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _unsynchronizedState];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSURL)cachedFileLocation
{
  v3 = [(SUUIBootstrapScriptFallback *)self cacheFolder];
  id v4 = [(SUUIBootstrapScriptFallback *)self cacheFilename];
  int64_t v5 = [v3 URLByAppendingPathComponent:v4];

  return (NSURL *)v5;
}

- (BOOL)isBagAvailable
{
  v2 = [MEMORY[0x263F7B358] contextWithBagType:0];
  v3 = [MEMORY[0x263F89540] sharedCache];
  id v4 = [v3 URLBagForContext:v2];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)canFallbackForError:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SUUIBootstrapScriptFallback *)self state];
  if (v5)
  {
    if (v5 == -1) {
      [(SUUIBootstrapScriptFallback *)self invalidate];
    }
    goto LABEL_14;
  }
  id v6 = v4;
  v7 = [v6 domain];
  if ([v7 isEqualToString:*MEMORY[0x263F08570]])
  {
    uint64_t v8 = [v6 code];

    if (v8 == -1001)
    {
LABEL_12:
      BOOL v15 = [(SUUIBootstrapScriptFallback *)self isBagAvailable];
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v9 = v6;
  uint64_t v10 = [v9 userInfo];
  uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F7B760]];
  uint64_t v12 = [v11 integerValue];

  v13 = [v9 domain];
  if (([v13 isEqualToString:*MEMORY[0x263F7B758]] & 1) == 0)
  {

LABEL_14:
    BOOL v15 = 0;
    goto LABEL_15;
  }
  uint64_t v14 = [v9 code];

  BOOL v15 = 0;
  if (v14 == 109 && v12 >= 500 && v12 <= 599) {
    goto LABEL_12;
  }
LABEL_15:

  return v15;
}

- (id)retrieveScript:(id *)a3
{
  int64_t v5 = [(SUUIBootstrapScriptFallback *)self queue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__42;
  uint64_t v14 = __Block_byref_object_dispose__42;
  id v15 = 0;
  id v6 = [(SUUIBootstrapScriptFallback *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUUIBootstrapScriptFallback_retrieveScript___block_invoke;
  block[3] = &unk_2654056C0;
  block[5] = &v10;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v6, block);

  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_24);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __46__SUUIBootstrapScriptFallback_retrieveScript___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _unsynchronizedState];
  if (v2)
  {
    if (!*(void *)(a1 + 48)) {
      return;
    }
    if (v2 == -2)
    {
      id v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F08320];
      v20 = @"No cached script to retrieve.";
      id v4 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      int64_t v5 = v15;
      uint64_t v6 = 560145512;
    }
    else
    {
      if (v2 != -1) {
        return;
      }
      v3 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = *MEMORY[0x263F08320];
      v22[0] = @"Cached script too old to retrieve.";
      id v4 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      int64_t v5 = v3;
      uint64_t v6 = 1869374497;
    }
    **(void **)(a1 + 48) = [v5 errorWithDomain:@"SUUIBootstrapScriptFallbackErrorDomain" code:v6 userInfo:v4];
  }
  else
  {
    id v7 = [NSString alloc];
    uint64_t v8 = [*(id *)(a1 + 32) cachedFileLocation];
    id v16 = 0;
    uint64_t v9 = [v7 initWithContentsOfURL:v8 encoding:4 error:&v16];
    id v4 = v16;
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      if (*(void *)(a1 + 48))
      {
        uint64_t v12 = (void *)MEMORY[0x263F087E8];
        uint64_t v13 = *MEMORY[0x263F08320];
        v17[0] = *MEMORY[0x263F08608];
        v17[1] = v13;
        v18[0] = v4;
        v18[1] = @"Could not retrieve script.";
        uint64_t v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
        **(void **)(a1 + 48) = [v12 errorWithDomain:@"SUUIBootstrapScriptFallbackErrorDomain" code:561149042 userInfo:v14];
      }
    }
  }
}

uint64_t __46__SUUIBootstrapScriptFallback_retrieveScript___block_invoke_2()
{
  return +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:&__block_literal_global_50];
}

uint64_t __46__SUUIBootstrapScriptFallback_retrieveScript___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setUsedBootstrapFallback:1];
}

- (void)scriptEvaluated:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SUUIBootstrapScriptFallback *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SUUIBootstrapScriptFallback_scriptEvaluated___block_invoke;
  v7[3] = &unk_265400890;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__SUUIBootstrapScriptFallback_scriptEvaluated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) cachedFileLocation];
  id v6 = 0;
  char v4 = [v2 writeToURL:v3 atomically:1 encoding:4 error:&v6];
  id v5 = v6;

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) _logError:v5 forOperation:@"writing new JS file to cache"];
  }
}

- (void)invalidate
{
  v3 = [(SUUIBootstrapScriptFallback *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SUUIBootstrapScriptFallback_invalidate__block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_async(v3, block);
}

void __41__SUUIBootstrapScriptFallback_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [*(id *)(a1 + 32) cacheFolder];
  id v29 = 0;
  char v4 = [v2 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:1 error:&v29];
  id v5 = v29;

  if (v4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v21 = a1;
      v22 = v4;
      id v23 = v5;
      id v9 = 0;
      uint64_t v10 = *(void *)v26;
      uint64_t v11 = *MEMORY[0x263F07F70];
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          uint64_t v13 = v9;
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v24 = v9;
          char v15 = objc_msgSend(v2, "removeItemAtURL:error:", v14, &v24, v21);
          id v9 = v24;

          if ((v15 & 1) == 0)
          {
            id v16 = v9;
            v17 = [v16 domain];
            if (([v17 isEqualToString:v11] & 1) == 0)
            {

LABEL_19:
              [*(id *)(v21 + 32) _logError:v16 forOperation:@"invalidating cached JS files"];
              goto LABEL_20;
            }
            if ([v16 code] == 4)
            {
            }
            else
            {
              uint64_t v18 = [v16 code];

              if (v18 != 260) {
                goto LABEL_19;
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v8) {
          continue;
        }
        break;
      }
LABEL_20:

      char v4 = v22;
      id v5 = v23;
    }
    goto LABEL_21;
  }
  id v6 = v5;
  uint64_t v19 = [v6 domain];
  if (([v19 isEqualToString:*MEMORY[0x263F07F70]] & 1) == 0)
  {

    goto LABEL_24;
  }
  if ([v6 code] != 4)
  {
    uint64_t v20 = [v6 code];

    if (v20 == 260) {
      goto LABEL_25;
    }
LABEL_24:
    [*(id *)(a1 + 32) _logError:v6 forOperation:@"getting listing of cached JS files for invalidation"];
    goto LABEL_25;
  }

LABEL_21:
LABEL_25:
}

- (void)_createCacheDirectoriesIfNeeded
{
  v3 = [(SUUIBootstrapScriptFallback *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SUUIBootstrapScriptFallback__createCacheDirectoriesIfNeeded__block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_async(v3, block);
}

void __62__SUUIBootstrapScriptFallback__createCacheDirectoriesIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [*(id *)(a1 + 32) cacheFolder];
  id v6 = 0;
  char v4 = [v2 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v6];
  id v5 = v6;

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) _logError:v5 forOperation:@"creating cache directory structure"];
  }
}

- (int64_t)_unsynchronizedState
{
  v3 = [(SUUIBootstrapScriptFallback *)self queue];
  dispatch_assert_queue_V2(v3);

  char v4 = [(SUUIBootstrapScriptFallback *)self cachedFileLocation];
  id v16 = 0;
  uint64_t v5 = *MEMORY[0x263EFF5F8];
  id v15 = 0;
  int v6 = [v4 getResourceValue:&v16 forKey:v5 error:&v15];
  id v7 = v16;
  id v8 = v15;

  if (v6)
  {
    id v9 = [(SUUIBootstrapScriptFallback *)self cachedFileLocation];
    [v9 removeCachedResourceValueForKey:v5];

    [v7 timeIntervalSinceNow];
    double v11 = fabs(v10);
    [(SUUIBootstrapScriptFallback *)self maximumAge];
    if (v11 <= v12) {
      int64_t v13 = 0;
    }
    else {
      int64_t v13 = -1;
    }
  }
  else
  {
    int64_t v13 = -2;
  }

  return v13;
}

- (void)_logError:(id)a3 forOperation:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  double v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_9;
  }
  double v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  int v14 = 138412802;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v16 = 2112;
  id v17 = v6;
  __int16 v18 = 2112;
  id v19 = v5;
  LODWORD(v13) = 32;
  double v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    double v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v14, v13);
    free(v12);
    SSFileLog();
LABEL_9:
  }
}

- (void)_runWhenBackgroundWorkFinished:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIBootstrapScriptFallback *)self queue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(SUUIBootstrapScriptFallback *)self queue];
  dispatch_barrier_async(v6, v4);
}

- (BOOL)_setCacheAge:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SUUIBootstrapScriptFallback *)self queue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  int v8 = [(SUUIBootstrapScriptFallback *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__SUUIBootstrapScriptFallback__setCacheAge_error___block_invoke;
  v11[3] = &unk_265405708;
  v11[4] = self;
  id v12 = v6;
  uint64_t v13 = &v15;
  int v14 = a4;
  id v9 = v6;
  dispatch_sync(v8, v11);

  LOBYTE(self) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __50__SUUIBootstrapScriptFallback__setCacheAge_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedFileLocation];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *MEMORY[0x263EFF5F8];
  id v7 = 0;
  char v5 = [v2 setResourceValue:v3 forKey:v4 error:&v7];
  id v6 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && *(void *)(a1 + 56)) {
    **(void **)(a1 + 56) = v6;
  }
}

- (NSURL)cacheFolder
{
  return self->_cacheFolder;
}

- (NSString)cacheFilename
{
  return self->_cacheFilename;
}

- (double)maximumAge
{
  return self->_maximumAge;
}

- (void)setMaximumAge:(double)a3
{
  self->_maximumAge = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheFilename, 0);
  objc_storeStrong((id *)&self->_cacheFolder, 0);
}

@end