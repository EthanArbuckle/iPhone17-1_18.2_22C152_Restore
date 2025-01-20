@interface SKUIBootstrapScriptFallback
+ (id)cacheFilenameForStoreFrontIdentifier:(id)a3;
+ (id)defaultCacheFolder;
+ (void)defaultCacheFolder;
- (BOOL)_setCacheAge:(id)a3 error:(id *)a4;
- (BOOL)canFallbackForError:(id)a3;
- (BOOL)isBagAvailable;
- (NSString)cacheFilename;
- (NSURL)cacheFolder;
- (NSURL)cachedFileLocation;
- (OS_dispatch_queue)queue;
- (SKUIBootstrapScriptFallback)init;
- (SKUIBootstrapScriptFallback)initWithCacheFolder:(id)a3 filename:(id)a4;
- (SKUIBootstrapScriptFallback)initWithFilename:(id)a3;
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

@implementation SKUIBootstrapScriptFallback

+ (id)defaultCacheFolder
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIBootstrapScriptFallback defaultCacheFolder];
      }
    }
  }
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = 0;
  v11 = [v10 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:&v20];
  id v12 = v20;

  if (!v11)
  {
    NSLog(&cfstr_CouldNotFindCa.isa, v12);
    v13 = (void *)MEMORY[0x1E4F1CB10];
    v14 = NSTemporaryDirectory();
    v11 = [v13 fileURLWithPath:v14];
  }
  v15 = [MEMORY[0x1E4F28B50] mainBundle];
  v16 = [v15 bundleIdentifier];

  if ([v16 length])
  {
    uint64_t v17 = [v11 URLByAppendingPathComponent:v16];

    v11 = (void *)v17;
  }
  v18 = [v11 URLByAppendingPathComponent:@"SKUIBootstrapScriptFallback"];

  return v18;
}

+ (id)cacheFilenameForStoreFrontIdentifier:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIBootstrapScriptFallback cacheFilenameForStoreFrontIdentifier:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  id v12 = [v3 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
  v13 = [NSString stringWithFormat:@"%@-%@.%@", v12, @"v1", @"js"];

  return v13;
}

- (SKUIBootstrapScriptFallback)initWithCacheFolder:(id)a3 filename:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUIBootstrapScriptFallback initWithCacheFolder:filename:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIBootstrapScriptFallback;
  uint64_t v17 = [(SKUIBootstrapScriptFallback *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_cacheFolder, a3);
    uint64_t v19 = [v8 copy];
    cacheFilename = v18->_cacheFilename;
    v18->_cacheFilename = (NSString *)v19;

    v18->_maximumAge = 604800.0;
    dispatch_queue_t v21 = dispatch_queue_create("SKUIBootstrapScriptFallback", 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v21;

    [(SKUIBootstrapScriptFallback *)v18 _createCacheDirectoriesIfNeeded];
  }

  return v18;
}

- (SKUIBootstrapScriptFallback)initWithFilename:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIBootstrapScriptFallback initWithFilename:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(id)objc_opt_class() defaultCacheFolder];
  uint64_t v14 = [(SKUIBootstrapScriptFallback *)self initWithCacheFolder:v13 filename:v4];

  return v14;
}

- (SKUIBootstrapScriptFallback)init
{
  return 0;
}

- (int64_t)state
{
  id v3 = [(SKUIBootstrapScriptFallback *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = [(SKUIBootstrapScriptFallback *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SKUIBootstrapScriptFallback_state__block_invoke;
  v7[3] = &unk_1E6422538;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __36__SKUIBootstrapScriptFallback_state__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _unsynchronizedState];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSURL)cachedFileLocation
{
  id v3 = [(SKUIBootstrapScriptFallback *)self cacheFolder];
  id v4 = [(SKUIBootstrapScriptFallback *)self cacheFilename];
  int64_t v5 = [v3 URLByAppendingPathComponent:v4];

  return (NSURL *)v5;
}

- (BOOL)isBagAvailable
{
  BOOL v2 = [MEMORY[0x1E4FA8300] contextWithBagType:0];
  id v3 = [MEMORY[0x1E4FB8860] sharedCache];
  id v4 = [v3 URLBagForContext:v2];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)canFallbackForError:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SKUIBootstrapScriptFallback *)self state];
  if (v5)
  {
    if (v5 == -1) {
      [(SKUIBootstrapScriptFallback *)self invalidate];
    }
    goto LABEL_22;
  }
  id v6 = v4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIBootstrapScriptFallback canFallbackForError:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v15 = [v6 domain];
  if ([v15 isEqualToString:*MEMORY[0x1E4F289A0]])
  {
    uint64_t v16 = [v6 code];

    if (v16 == -1001)
    {
LABEL_20:
      BOOL v31 = [(SKUIBootstrapScriptFallback *)self isBagAvailable];
      goto LABEL_23;
    }
  }
  else
  {
  }
  id v17 = v6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v18 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v18) {
        -[SKUIBootstrapScriptFallback canFallbackForError:](v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
  v26 = [v17 userInfo];
  v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4FA8688]];
  uint64_t v28 = [v27 integerValue];

  v29 = [v17 domain];
  if (([v29 isEqualToString:*MEMORY[0x1E4FA8680]] & 1) == 0)
  {

LABEL_22:
    BOOL v31 = 0;
    goto LABEL_23;
  }
  uint64_t v30 = [v17 code];

  BOOL v31 = 0;
  if (v30 == 109 && v28 >= 500 && v28 <= 599) {
    goto LABEL_20;
  }
LABEL_23:

  return v31;
}

- (id)retrieveScript:(id *)a3
{
  int64_t v5 = [(SKUIBootstrapScriptFallback *)self queue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__101;
  uint64_t v14 = __Block_byref_object_dispose__101;
  id v15 = 0;
  id v6 = [(SKUIBootstrapScriptFallback *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SKUIBootstrapScriptFallback_retrieveScript___block_invoke;
  block[3] = &unk_1E642AAA0;
  block[5] = &v10;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v6, block);

  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_63);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __46__SKUIBootstrapScriptFallback_retrieveScript___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _unsynchronizedState];
  if (v2)
  {
    if (!*(void *)(a1 + 48)) {
      return;
    }
    if (v2 == -2)
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      uint64_t v20 = @"No cached script to retrieve.";
      id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      int64_t v5 = v15;
      uint64_t v6 = 560145512;
    }
    else
    {
      if (v2 != -1) {
        return;
      }
      id v3 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"Cached script too old to retrieve.";
      id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      int64_t v5 = v3;
      uint64_t v6 = 1869374497;
    }
    **(void **)(a1 + 48) = [v5 errorWithDomain:@"SKUIBootstrapScriptFallbackErrorDomain" code:v6 userInfo:v4];
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
        uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = *MEMORY[0x1E4F28568];
        v17[0] = *MEMORY[0x1E4F28A50];
        v17[1] = v13;
        v18[0] = v4;
        v18[1] = @"Could not retrieve script.";
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
        **(void **)(a1 + 48) = [v12 errorWithDomain:@"SKUIBootstrapScriptFallbackErrorDomain" code:561149042 userInfo:v14];
      }
    }
  }
}

uint64_t __46__SKUIBootstrapScriptFallback_retrieveScript___block_invoke_2()
{
  return +[SKUIMetricsAppLaunchEvent withPendingLaunchEvent:&__block_literal_global_46];
}

uint64_t __46__SKUIBootstrapScriptFallback_retrieveScript___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setUsedBootstrapFallback:1];
}

- (void)scriptEvaluated:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SKUIBootstrapScriptFallback *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SKUIBootstrapScriptFallback_scriptEvaluated___block_invoke;
  v7[3] = &unk_1E6421FF8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__SKUIBootstrapScriptFallback_scriptEvaluated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) cachedFileLocation];
  id v6 = 0;
  char v4 = [v2 writeToURL:v3 atomically:1 encoding:4 error:&v6];
  id v5 = v6;

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) _logError:v5 forOperation:@"writing new JS file to cache"];
  }
}

- (void)invalidate
{
  id v3 = [(SKUIBootstrapScriptFallback *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SKUIBootstrapScriptFallback_invalidate__block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_async(v3, block);
}

void __41__SKUIBootstrapScriptFallback_invalidate__block_invoke(uint64_t a1)
{
  *(void *)&v51[12] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [*(id *)(a1 + 32) cacheFolder];
  id v48 = 0;
  char v4 = [v2 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:1 error:&v48];
  id v5 = v48;

  if (!v4)
  {
    id v27 = v5;
    if (os_variant_has_internal_content())
    {
      if (_os_feature_enabled_impl())
      {
        BOOL v28 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
        if (v28) {
          __41__SKUIBootstrapScriptFallback_invalidate__block_invoke_cold_1(v28, v29, v30, v31, v32, v33, v34, v35);
        }
      }
    }
    v36 = [v27 domain];
    if ([v36 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      if ([v27 code] == 4)
      {

        goto LABEL_34;
      }
      uint64_t v37 = [v27 code];

      if (v37 == 260) {
        goto LABEL_34;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) _logError:v27 forOperation:@"getting listing of cached JS files for invalidation"];
    goto LABEL_34;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v39 = a1;
    v40 = v4;
    id v41 = v5;
    id v9 = 0;
    uint64_t v10 = *(void *)v45;
    v38 = v51;
    uint64_t v11 = *MEMORY[0x1E4F281F8];
    uint64_t v12 = "com.apple.StoreKitUI";
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v14 = v9;
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v43 = v9;
        char v16 = objc_msgSend(v2, "removeItemAtURL:error:", v15, &v43, v38);
        id v9 = v43;

        if ((v16 & 1) == 0)
        {
          id v17 = v9;
          if (os_variant_has_internal_content()
            && _os_feature_enabled_impl()
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            __41__SKUIBootstrapScriptFallback_invalidate__block_invoke_cold_2(buf, v38);
          }
          BOOL v18 = [v17 domain];
          if (([v18 isEqualToString:v11] & 1) == 0)
          {

LABEL_28:
            [*(id *)(v39 + 32) _logError:v17 forOperation:@"invalidating cached JS files"];
            goto LABEL_29;
          }
          if ([v17 code] == 4)
          {
          }
          else
          {
            id v42 = v9;
            uint64_t v19 = v8;
            uint64_t v20 = v10;
            uint64_t v21 = v2;
            uint64_t v22 = v11;
            id v23 = v6;
            uint64_t v24 = v12;
            uint64_t v25 = [v17 code];

            BOOL v26 = v25 == 260;
            uint64_t v12 = v24;
            id v6 = v23;
            uint64_t v11 = v22;
            uint64_t v2 = v21;
            uint64_t v10 = v20;
            uint64_t v8 = v19;
            id v9 = v42;
            if (!v26) {
              goto LABEL_28;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v8) {
        continue;
      }
      break;
    }
LABEL_29:

    char v4 = v40;
    id v5 = v41;
  }

LABEL_34:
}

- (void)_createCacheDirectoriesIfNeeded
{
  id v3 = [(SKUIBootstrapScriptFallback *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SKUIBootstrapScriptFallback__createCacheDirectoriesIfNeeded__block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_async(v3, block);
}

void __62__SKUIBootstrapScriptFallback__createCacheDirectoriesIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [*(id *)(a1 + 32) cacheFolder];
  id v6 = 0;
  char v4 = [v2 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v6];
  id v5 = v6;

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) _logError:v5 forOperation:@"creating cache directory structure"];
  }
}

- (int64_t)_unsynchronizedState
{
  id v3 = [(SKUIBootstrapScriptFallback *)self queue];
  dispatch_assert_queue_V2(v3);

  char v4 = [(SKUIBootstrapScriptFallback *)self cachedFileLocation];
  id v16 = 0;
  uint64_t v5 = *MEMORY[0x1E4F1C530];
  id v15 = 0;
  int v6 = [v4 getResourceValue:&v16 forKey:v5 error:&v15];
  id v7 = v16;
  id v8 = v15;

  if (v6)
  {
    id v9 = [(SKUIBootstrapScriptFallback *)self cachedFileLocation];
    [v9 removeCachedResourceValueForKey:v5];

    [v7 timeIntervalSinceNow];
    double v11 = fabs(v10);
    [(SKUIBootstrapScriptFallback *)self maximumAge];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4FA81D8] sharedConfig];
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
  id v5 = [(SKUIBootstrapScriptFallback *)self queue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(SKUIBootstrapScriptFallback *)self queue];
  dispatch_barrier_async(v6, v4);
}

- (BOOL)_setCacheAge:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SKUIBootstrapScriptFallback *)self queue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  int v8 = [(SKUIBootstrapScriptFallback *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__SKUIBootstrapScriptFallback__setCacheAge_error___block_invoke;
  v11[3] = &unk_1E642AAC8;
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

void __50__SKUIBootstrapScriptFallback__setCacheAge_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedFileLocation];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *MEMORY[0x1E4F1C530];
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

+ (void)defaultCacheFolder
{
}

+ (void)cacheFilenameForStoreFrontIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCacheFolder:(uint64_t)a3 filename:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFilename:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)canFallbackForError:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)canFallbackForError:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__SKUIBootstrapScriptFallback_invalidate__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __41__SKUIBootstrapScriptFallback_invalidate__block_invoke_cold_2(uint8_t *buf, void *a2)
{
  *(_DWORD *)buf = 136446210;
  *a2 = "NSErrorIsFileNotFound";
}

@end