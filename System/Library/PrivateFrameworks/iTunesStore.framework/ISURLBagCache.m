@interface ISURLBagCache
+ (id)URLWithBagContext:(id)a3;
+ (id)sharedCache;
- (ISURLBagCache)init;
- (id)URLBagForContext:(id)a3;
- (id)_newRequestWithURLBagContext:(id)a3;
- (void)_storeFrontChangedNotification:(id)a3;
- (void)addURLBag:(id)a3;
- (void)dealloc;
- (void)invalidateAllURLBags;
- (void)invalidateURLBagForContext:(id)a3;
@end

@implementation ISURLBagCache

- (ISURLBagCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)ISURLBagCache;
  v2 = [(ISURLBagCache *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F7B1E8]) initWithMaxSize:5];
    cachedBags = v2->_cachedBags;
    v2->_cachedBags = (SSLRUCache *)v3;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.iTunesStore.ISURLBagCache.%p", v2);
    id v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v2 selector:sel__storeFrontChangedNotification_ name:*MEMORY[0x263F7B4D8] object:0];
    if ((SSIsDaemon() & 1) == 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__InvalidateBagsNotification, (CFStringRef)*MEMORY[0x263F7BDB0], 0, CFNotificationSuspensionBehaviorCoalesce);
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F7B4D8] object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F7BDB0], 0);

  v5.receiver = self;
  v5.super_class = (Class)ISURLBagCache;
  [(ISURLBagCache *)&v5 dealloc];
}

+ (id)sharedCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ISURLBagCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_sOnce != -1) {
    dispatch_once(&sharedCache_sOnce, block);
  }
  v2 = (void *)sharedCache_sCache;

  return v2;
}

uint64_t __28__ISURLBagCache_sharedCache__block_invoke(uint64_t a1)
{
  sharedCache_sCache = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

+ (id)URLWithBagContext:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 bagType];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F7BDC8];
  if (v3 == 1)
  {
    objc_super v5 = (__CFString *)CFPreferencesCopyAppValue(@"SandboxSessionURL", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      dispatch_queue_t v6 = @"https://sandbox.itunes.apple.com/bag.xml?ix=6";
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  objc_super v5 = (__CFString *)CFPreferencesCopyAppValue(@"InitiateSessionURL", v4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_5:
    dispatch_queue_t v6 = v5;
    goto LABEL_7;
  }
  dispatch_queue_t v6 = @"https://init.itunes.apple.com/bag.xml?ix=6";
LABEL_7:
  v7 = (void *)[(__CFString *)v6 mutableCopy];

  v8 = [MEMORY[0x263F7B148] currentDevice];
  v9 = [v8 productVersion];
  v10 = [v9 componentsSeparatedByString:@"."];

  if ([v10 count])
  {
    objc_super v11 = [v10 objectAtIndex:0];
    [v7 appendFormat:@"&%@=%@", @"os", v11];
  }
  int v12 = [MEMORY[0x263F7B148] deviceIsAudioAccessory];
  CFStringRef v13 = (const __CFString *)*MEMORY[0x263EFFE48];
  CFStringRef v14 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v15 = (const __CFString *)*MEMORY[0x263EFFE50];
  if (!v12) {
    goto LABEL_35;
  }
  v16 = (void *)CFPreferencesCopyValue(@"AppleLocaleSetup", (CFStringRef)*MEMORY[0x263EFFE48], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  uint64_t v17 = [MEMORY[0x263F7B1F8] sharedConfig];
  v18 = (void *)v17;
  if (v16)
  {
    if (!v17)
    {
      v18 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    v21 = [v18 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      v20 &= 2u;
    }
    if (v20)
    {
      v22 = objc_opt_class();
      id v23 = v22;
      v24 = SSHashIfNeeded();
      *(_DWORD *)v35 = 138543618;
      *(void *)&v35[4] = v22;
      *(_WORD *)&v35[12] = 2114;
      *(void *)&v35[14] = v24;
      LODWORD(v34) = 22;
      v33 = v35;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_22:

        goto LABEL_36;
      }
      v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, v35, v34);
      free(v25);
      v33 = v21;
      SSFileLog();
    }

    goto LABEL_22;
  }
  if (!v17)
  {
    v18 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v26 = [v18 shouldLog];
  if ([v18 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  v28 = [v18 OSLogObject];
  if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
    v27 &= 2u;
  }
  if (!v27) {
    goto LABEL_33;
  }
  *(_DWORD *)v35 = 138543362;
  *(void *)&v35[4] = objc_opt_class();
  id v29 = *(id *)&v35[4];
  LODWORD(v34) = 12;
  v33 = v35;
  v30 = (void *)_os_log_send_and_compose_impl();

  if (v30)
  {
    v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, v35, v34, *(_OWORD *)v35);
    free(v30);
    v33 = v28;
    SSFileLog();
LABEL_33:
  }
LABEL_35:
  v16 = (void *)CFPreferencesCopyValue(@"AppleLocale", v13, v14, v15);
LABEL_36:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 appendFormat:@"&%@=%@", @"locale", v16];
  }
  v31 = objc_msgSend(NSURL, "URLWithString:", v7, v33);

  return v31;
}

- (void)addURLBag:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__ISURLBagCache_addURLBag___block_invoke;
  v7[3] = &unk_264260B58;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __27__ISURLBagCache_addURLBag___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) URLBagContext];
  uint64_t v3 = [v2 cacheKey];
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:*(void *)(a1 + 32) forKey:v3];
    id v4 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v4)
    {
      id v4 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      v6 &= 2u;
    }
    if (v6)
    {
      *(_DWORD *)objc_super v11 = 138412546;
      *(void *)&v11[4] = objc_opt_class();
      *(_WORD *)&v11[12] = 2112;
      *(void *)&v11[14] = v3;
      id v8 = *(id *)&v11[4];
      LODWORD(v10) = 22;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_13:

        goto LABEL_14;
      }
      v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v11, v10, *(_OWORD *)v11, *(void *)&v11[16]);
      free(v9);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)invalidateAllURLBags
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ISURLBagCache_invalidateAllURLBags__block_invoke;
  block[3] = &unk_264260B08;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __37__ISURLBagCache_invalidateAllURLBags__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) allObjectsAndKeys];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__ISURLBagCache_invalidateAllURLBags__block_invoke_2;
  v3[3] = &unk_264261898;
  v3[4] = *(void *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __37__ISURLBagCache_invalidateAllURLBags__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setInvalidationTime:-1.79769313e308];
  }
  else {
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKey:v6];
  }
}

- (void)invalidateURLBagForContext:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ISURLBagCache_invalidateURLBagForContext___block_invoke;
  block[3] = &unk_264260B58;
  id v6 = v4;
  id v12 = v6;
  CFStringRef v13 = self;
  dispatch_async(dispatchQueue, block);
  v7 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__ISURLBagCache_invalidateURLBagForContext___block_invoke_2;
  v9[3] = &unk_264260B58;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __44__ISURLBagCache_invalidateURLBagForContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cacheKey];
  [*(id *)(*(void *)(a1 + 40) + 8) setObject:0 forKey:v2];
}

void __44__ISURLBagCache_invalidateURLBagForContext___block_invoke_2(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _newRequestWithURLBagContext:*(void *)(a1 + 40)];
  if (+[ISURLOperation sharedCFURLCache])
  {
    [v1 _CFURLRequest];
    CFURLCacheRemoveCachedResponseForRequest();
  }
}

- (id)URLBagForContext:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  CFStringRef v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__14;
  uint64_t v17 = __Block_byref_object_dispose__14;
  id v18 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ISURLBagCache_URLBagForContext___block_invoke;
  block[3] = &unk_2642618C0;
  objc_super v11 = self;
  id v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __34__ISURLBagCache_URLBagForContext___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) ignoresCaches] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) cacheKey];
    uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:v2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v6 || ([v6 isValid] & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "allowsExpiredBags") & 1) != 0) {
      goto LABEL_17;
    }
    id v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v7)
    {
      id v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      LODWORD(v16) = 138412290;
      *(void *)((char *)&v16 + 4) = objc_opt_class();
      id v11 = *(id *)((char *)&v16 + 4);
      LODWORD(v15) = 12;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_16:

        uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
        CFStringRef v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = 0;

LABEL_17:
        return;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v16, v15, v16);
      free(v12);
      SSFileLog();
    }

    goto LABEL_16;
  }
}

- (void)_storeFrontChangedNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", a3);
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_11;
  }
  LODWORD(v11) = 138412290;
  *(void *)((char *)&v11 + 4) = objc_opt_class();
  id v8 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  int v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v11, v10, v11);
    free(v9);
    SSFileLog();
LABEL_11:
  }
  [(ISURLBagCache *)self invalidateAllURLBags];
}

- (id)_newRequestWithURLBagContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() URLWithBagContext:v3];
  int v5 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v4];
  int v6 = [v3 allHTTPHeaders];
  if (v6) {
    [v5 setAllHTTPHeaderFields:v6];
  }
  [v3 bagType];
  uint64_t v7 = SSAccountScopeForURLBagType();
  uint64_t v8 = [v3 userIdentifier];
  if (v8)
  {
    int v9 = (void *)v8;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F7B0E8] defaultStore];
    long long v11 = [v10 activeAccount];
    int v9 = [v11 uniqueIdentifier];

    uint64_t v12 = [MEMORY[0x263F7B0E8] defaultStore];
    uint64_t v13 = [v12 activeAccount];
    uint64_t v7 = [v13 accountScope];
  }
  CFStringRef v14 = [v3 clientBundleIdentifier];
  +[ISStoreURLOperation _addiTunesStoreHeadersToRequest:v5 withURLBag:0 accountIdentifier:v9 appendAuthKitHeaders:1 appendStorefrontToURL:0 clientBundleIdentifier:v14];

  uint64_t v15 = [MEMORY[0x263F7B380] sharedStorage];
  long long v16 = [v15 cookieHeadersForURL:v4 userIdentifier:v9 scope:v7];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __46__ISURLBagCache__newRequestWithURLBagContext___block_invoke;
  v23[3] = &unk_2642618E8;
  id v17 = v5;
  id v24 = v17;
  [v16 enumerateKeysAndObjectsUsingBlock:v23];
  uint64_t v18 = *MEMORY[0x263F7B788];
  int v19 = [v17 valueForHTTPHeaderField:*MEMORY[0x263F7B788]];

  if (!v19)
  {
    int v20 = +[ISClient currentClient];
    id v21 = [v20 userAgent];

    if (v21 || (id v21 = +[ISURLOperation copyUserAgent]) != 0)
    {
      [v17 setValue:v21 forHTTPHeaderField:v18];
    }
  }

  return v17;
}

uint64_t __46__ISURLBagCache__newRequestWithURLBagContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_cachedBags, 0);
}

@end