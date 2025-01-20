@interface ISLoadURLBagOperation
+ (id)_executedNetworkRequests;
+ (id)_networkCounters;
+ (id)_networkSynchronyQueue;
+ (id)storeFrontHeaderSuffix;
+ (id)storeFrontHeaderSuffixForBundleIdentifier:(id)a3;
+ (void)_addStoreFrontHeaderSuffix:(id)a3 forBundleIdentifier:(id)a4;
+ (void)decrementNetworkCounterForBagContext:(id)a3;
+ (void)incrementNetworkCounterForBagContext:(id)a3;
- (BOOL)_setURLBagWithDictionary:(id)a3 response:(id)a4 error:(id *)a5;
- (BOOL)operation:(id)a3 shouldSetStoreFrontID:(id)a4;
- (ISLoadURLBagOperation)init;
- (ISLoadURLBagOperation)initWithBagContext:(id)a3;
- (ISURLBag)URLBag;
- (NSNumber)accountDSID;
- (SSURLBagContext)context;
- (id)uniqueKey;
- (void)_addHeadersToRequestProperties:(id)a3;
- (void)_postBagDidLoadNotificationWithURLBag:(id)a3;
- (void)_sendPingsForURLBag:(id)a3;
- (void)_setOutputURLBag:(id)a3;
- (void)operation:(id)a3 willSendRequest:(id)a4;
- (void)run;
- (void)setAccountDSID:(id)a3;
@end

@implementation ISLoadURLBagOperation

- (ISLoadURLBagOperation)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F7B358]);
  [v3 setBagType:0];
  v4 = [(ISLoadURLBagOperation *)self initWithBagContext:v3];

  return v4;
}

- (ISLoadURLBagOperation)initWithBagContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISLoadURLBagOperation;
  v5 = [(ISOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    context = v5->_context;
    v5->_context = (SSURLBagContext *)v6;
  }
  return v5;
}

+ (void)decrementNetworkCounterForBagContext:(id)a3
{
  id v4 = [a3 cacheKey];
  if ([v4 length])
  {
    v5 = [a1 _networkSynchronyQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__ISLoadURLBagOperation_decrementNetworkCounterForBagContext___block_invoke;
    v6[3] = &unk_264260D90;
    id v8 = a1;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

void __62__ISLoadURLBagOperation_decrementNetworkCounterForBagContext___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 40) _networkCounters];
  v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "unsignedIntegerValue") - 1);

    if (![v4 unsignedIntegerValue])
    {
      v5 = [*(id *)(a1 + 40) _executedNetworkRequests];
      [v5 removeObject:*(void *)(a1 + 32)];

      id v4 = &unk_26C6B0590;
    }
    [v6 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

+ (void)incrementNetworkCounterForBagContext:(id)a3
{
  id v4 = [a3 cacheKey];
  if ([v4 length])
  {
    v5 = [a1 _networkSynchronyQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__ISLoadURLBagOperation_incrementNetworkCounterForBagContext___block_invoke;
    v6[3] = &unk_264260D90;
    id v8 = a1;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

void __62__ISLoadURLBagOperation_incrementNetworkCounterForBagContext___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) _networkCounters];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v2) {
    id v3 = (void *)v2;
  }
  else {
    id v3 = &unk_26C6B0590;
  }
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "unsignedIntegerValue") + 1);

  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
}

+ (id)storeFrontHeaderSuffix
{
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 bundleIdentifier];
  id v5 = [a1 storeFrontHeaderSuffixForBundleIdentifier:v4];

  return v5;
}

+ (id)storeFrontHeaderSuffixForBundleIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = (void *)CFPreferencesCopyValue(@"ISURLBagStorefrontHeaderSuffixes", (CFStringRef)*MEMORY[0x263F7BDC8], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    id v5 = [v4 objectForKeyedSubscript:v3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (ISURLBag)URLBag
{
  [(ISOperation *)self lock];
  id v3 = self->_outputBag;
  [(ISOperation *)self unlock];

  return v3;
}

- (void)run
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  +[ISURLOperation sharedCFURLCache];
  id v3 = +[ISURLBagCache sharedCache];
  id v4 = [(ISLoadURLBagOperation *)self context];
  id v5 = [v3 URLBagForContext:v4];
  if (v5)
  {
    id v6 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    objc_super v9 = [v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      int v10 = v8;
    }
    else {
      int v10 = v8 & 2;
    }
    if (v10)
    {
      v11 = objc_opt_class();
      id v12 = v11;
      [v4 cacheKey];
      *(_DWORD *)v84 = 138412546;
      *(void *)&v84[4] = v11;
      *(void *)&v84[14] = *(_WORD *)&v84[12] = 2112;
      LODWORD(v67) = 22;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (v13)
      {
        v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, v84, v67);
        free(v13);
        SSFileLog();
      }
    }
    else
    {
    }
    [(ISLoadURLBagOperation *)self _setOutputURLBag:v5];
    [(ISOperation *)self setSuccess:1];
    goto LABEL_77;
  }
  if (![v4 usesCachedBagsOnly])
  {
    *(void *)v84 = 0;
    *(void *)&v84[8] = v84;
    *(void *)&v84[16] = 0x2020000000;
    char v85 = 0;
    v23 = [(id)objc_opt_class() _networkSynchronyQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__ISLoadURLBagOperation_run__block_invoke;
    block[3] = &unk_264260DB8;
    id v24 = v4;
    id v77 = v24;
    v78 = self;
    v79 = v84;
    dispatch_sync(v23, block);

    if (!*(unsigned char *)(*(void *)&v84[8] + 24))
    {

LABEL_76:
      _Block_object_dispose(v84, 8);
      goto LABEL_77;
    }
    v25 = objc_alloc_init(ISStoreURLOperation);
    [(ISOperation *)v25 setDelegate:self];
    [(ISStoreURLOperation *)v25 setNeedsURLBag:0];
    [(ISStoreURLOperation *)v25 setShouldAppendAuthKitHeaders:0];
    [(ISURLOperation *)v25 setTracksPerformanceMetrics:SSDebugShouldTrackPerformance()];
    [(ISStoreURLOperation *)v25 setURLBagRequest:1];
    [(ISStoreURLOperation *)v25 setUrlKnownToBeTrusted:1];
    v26 = [(ISLoadURLBagOperation *)self accountDSID];
    [(ISURLOperation *)v25 _setAccountDSIDOverride:v26];

    v27 = +[ISDataProvider provider];
    [v27 setShouldProcessProtocol:0];
    [(ISURLOperation *)v25 setDataProvider:v27];
    v71 = v27;
    id v28 = objc_alloc(MEMORY[0x263F7B290]);
    v29 = +[ISURLBagCache URLWithBagContext:v24];
    v73 = (void *)[v28 initWithURL:v29];

    [v73 setAllowedRetryCount:0];
    if ([v24 allowsBootstrapCellularData]) {
      [v73 setAllowsBootstrapCellularData:1];
    }
    v30 = [v24 clientAuditTokenData];
    BOOL v31 = v30 == 0;

    if (!v31)
    {
      v32 = [v24 clientAuditTokenData];
      [v73 setClientAuditTokenData:v32];
    }
    if ([v24 ignoresCaches]) {
      [v73 setCachePolicy:1];
    }
    [v73 setITunesStoreRequest:1];
    [(ISLoadURLBagOperation *)self _addHeadersToRequestProperties:v73];
    [(ISURLOperation *)v25 setRequestProperties:v73];
    id v75 = 0;
    BOOL v33 = [(ISOperation *)self runSubOperation:v25 returningError:&v75];
    id v34 = v75;
    v35 = v34;
    if (v33)
    {
      v36 = [v71 output];
      v37 = [(ISURLOperation *)v25 response];
      id v74 = v35;
      BOOL v38 = [(ISLoadURLBagOperation *)self _setURLBagWithDictionary:v36 response:v37 error:&v74];
      id v72 = v74;

      if (v38)
      {
        BOOL v39 = 1;
        goto LABEL_55;
      }
    }
    else
    {
      id v72 = v34;
    }
    if ([v24 bagType] != 2)
    {
      BOOL v39 = 0;
      goto LABEL_55;
    }
    v40 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v40)
    {
      v40 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v41 = [v40 shouldLog];
    int v42 = [v40 shouldLogToDisk];
    v43 = [v40 OSLogObject];
    v44 = v43;
    if (v42) {
      v41 |= 2u;
    }
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
      v41 &= 2u;
    }
    if (v41)
    {
      v45 = objc_opt_class();
      int v80 = 138412290;
      id v81 = v45;
      id v70 = v45;
      LODWORD(v67) = 12;
      v66 = &v80;
      v46 = (void *)_os_log_send_and_compose_impl();

      if (!v46)
      {
LABEL_51:

        v47 = [[ISURLBag alloc] initWithURLBagContext:v24];
        BOOL v39 = v47 != 0;
        if (v47) {
          [v3 addURLBag:v47];
        }

LABEL_55:
        -[ISOperation setError:](self, "setError:", v72, v66);
        [(ISOperation *)self setSuccess:v39];
        [(ISOperation *)v25 setDelegate:0];
        if (!self->_outputBag)
        {
LABEL_75:

          goto LABEL_76;
        }
        v48 = [v24 clientBundleIdentifier];
        v49 = v48;
        if (v48)
        {
          id v50 = v48;
        }
        else
        {
          v51 = [MEMORY[0x263F086E0] mainBundle];
          id v50 = [v51 bundleIdentifier];
        }
        if (![v50 isEqualToString:@"com.apple.itunesstored"]
          || ([v24 cacheKey],
              v52 = objc_claimAutoreleasedReturnValue(),
              char v53 = [v52 containsString:@"itunesstored"],
              v52,
              (v53 & 1) != 0))
        {
LABEL_74:
          v64 = objc_opt_class();
          v65 = [(ISURLBag *)self->_outputBag valueForKey:@"storefront-header-suffix"];
          [v64 _addStoreFrontHeaderSuffix:v65 forBundleIdentifier:v50];

          goto LABEL_75;
        }
        v54 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v54)
        {
          v54 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        v55 = v54;
        int v56 = [v54 shouldLog];
        int v57 = [v55 shouldLogToDisk];
        v69 = v55;
        v58 = [v55 OSLogObject];
        v59 = v58;
        if (v57) {
          v56 |= 2u;
        }
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
          int v60 = v56;
        }
        else {
          int v60 = v56 & 2;
        }
        if (v60)
        {
          v61 = v69;
          id v68 = (id)objc_opt_class();
          v62 = [v24 cacheKey];
          int v80 = 138412546;
          id v81 = v68;
          __int16 v82 = 2112;
          v83 = v62;
          LODWORD(v67) = 22;
          v63 = (void *)_os_log_send_and_compose_impl();

          if (!v63)
          {
LABEL_73:

            id v50 = 0;
            goto LABEL_74;
          }
          v59 = objc_msgSend(NSString, "stringWithCString:encoding:", v63, 4, &v80, v67);
          free(v63);
          SSFileLog();
        }
        else
        {
          v61 = v69;
        }

        goto LABEL_73;
      }
      v44 = objc_msgSend(NSString, "stringWithCString:encoding:", v46, 4, &v80, v67);
      free(v46);
      v66 = (int *)v44;
      SSFileLog();
    }

    goto LABEL_51;
  }
  v15 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v15)
  {
    v15 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v16 = [v15 shouldLog];
  if ([v15 shouldLogToDisk]) {
    int v17 = v16 | 2;
  }
  else {
    int v17 = v16;
  }
  v18 = [v15 OSLogObject];
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    v17 &= 2u;
  }
  if (v17)
  {
    v19 = objc_opt_class();
    id v20 = v19;
    [v4 cacheKey];
    *(_DWORD *)v84 = 138412546;
    *(void *)&v84[4] = v19;
    *(void *)&v84[14] = *(_WORD *)&v84[12] = 2112;
    LODWORD(v67) = 22;
    v21 = (void *)_os_log_send_and_compose_impl();

    if (v21)
    {
      v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, v84, v67);
      free(v21);
      SSFileLog();
    }
  }
  else
  {
  }
LABEL_77:
}

void __28__ISLoadURLBagOperation_run__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) cacheKey];
  if ([v2 length])
  {
    id v3 = [(id)objc_opt_class() _networkCounters];
    id v4 = [v3 objectForKeyedSubscript:v2];

    if (v4 && ![v4 isEqualToNumber:&unk_26C6B0590])
    {
      id v5 = [(id)objc_opt_class() _executedNetworkRequests];
      char v6 = [v5 containsObject:v2];

      if (v6)
      {
        int v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v7)
        {
          int v7 = [MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v8 = [v7 shouldLog];
        if ([v7 shouldLogToDisk]) {
          int v9 = v8 | 2;
        }
        else {
          int v9 = v8;
        }
        int v10 = [v7 OSLogObject];
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          v9 &= 2u;
        }
        if (v9)
        {
          *(_DWORD *)v15 = 138543618;
          *(void *)&v15[4] = objc_opt_class();
          *(_WORD *)&v15[12] = 2112;
          *(void *)&v15[14] = v2;
          id v11 = *(id *)&v15[4];
          LODWORD(v14) = 22;
          id v12 = (void *)_os_log_send_and_compose_impl();

          if (!v12)
          {
LABEL_16:

LABEL_19:
            goto LABEL_20;
          }
          int v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, v15, v14, *(_OWORD *)v15, *(void *)&v15[16]);
          free(v12);
          SSFileLog();
        }

        goto LABEL_16;
      }
      v13 = [(id)objc_opt_class() _executedNetworkRequests];
      [v13 addObject:v2];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_19;
  }
LABEL_20:
}

- (id)uniqueKey
{
  uint64_t v2 = NSString;
  id v3 = [(ISLoadURLBagOperation *)self context];
  id v4 = [v3 cacheKey];
  id v5 = [v2 stringWithFormat:@"com.apple.iTunesStore.LoadURLBag-%@", v4];

  return v5;
}

- (BOOL)operation:(id)a3 shouldSetStoreFrontID:(id)a4
{
  id v4 = [(ISLoadURLBagOperation *)self context];
  BOOL v5 = [v4 bagType] != 1;

  return v5;
}

- (void)operation:(id)a3 willSendRequest:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a4;
  BOOL v5 = [v4 valueForHTTPHeaderField:@"X-Apple-Synched-Store-Front"];
  if (v5)
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x263F7BDC8];
    int v7 = (void *)CFPreferencesCopyAppValue(@"LastSynchedStoreFront", (CFStringRef)*MEMORY[0x263F7BDC8]);
    if (([v5 isEqualToString:v7] & 1) == 0)
    {
      [v4 setValue:0 forHTTPHeaderField:*MEMORY[0x263F7B808]];
      CFPreferencesSetAppValue(@"LastSynchedStoreFront", v5, v6);
      CFPreferencesAppSynchronize(v6);
    }
  }
  v21 = v5;
  int v8 = [v4 allHTTPHeaderFields];
  int v9 = ISDictionaryValueForCaseInsensitiveString(v8, @"Cookie");

  int v10 = [v9 componentsSeparatedByString:@";"];
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        int v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v18 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        v19 = [v17 stringByTrimmingCharactersInSet:v18];

        if (([v19 hasPrefix:@"xp_ci"] & 1) == 0) {
          [v11 addObject:v19];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  id v20 = [v11 componentsJoinedByString:@"; "];
  [v4 setValue:v20 forHTTPHeaderField:@"Cookie"];
}

- (void)_addHeadersToRequestProperties:(id)a3
{
  id v6 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  BOOL v5 = [(SSURLBagContext *)self->_context allHTTPHeaders];
  if (v5) {
    [v4 addEntriesFromDictionary:v5];
  }
  if ([v4 count]) {
    [v6 setHTTPHeaders:v4];
  }
}

+ (void)_addStoreFrontHeaderSuffix:(id)a3 forBundleIdentifier:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if ([v5 length])
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x263F7BDC8];
    int v7 = (void *)CFPreferencesCopyValue(@"ISURLBagStorefrontHeaderSuffixes", (CFStringRef)*MEMORY[0x263F7BDC8], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    id v8 = (id)[v7 mutableCopy];
    if (!v8) {
      id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    if ([v9 length]) {
      [v8 setObject:v9 forKey:v5];
    }
    else {
      [v8 removeObjectForKey:v5];
    }
    if (([v8 isEqualToDictionary:v7] & 1) == 0)
    {
      CFPreferencesSetAppValue(@"ISURLBagStorefrontHeaderSuffixes", v8, v6);
      CFPreferencesAppSynchronize(v6);
    }
  }
}

+ (id)_executedNetworkRequests
{
  uint64_t v2 = [a1 _networkSynchronyQueue];
  dispatch_assert_queue_V2(v2);

  if (_executedNetworkRequests_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&_executedNetworkRequests_ams_once_token___COUNTER__, &__block_literal_global_5);
  }
  id v3 = (void *)_executedNetworkRequests_ams_once_object___COUNTER__;

  return v3;
}

uint64_t __49__ISLoadURLBagOperation__executedNetworkRequests__block_invoke()
{
  _executedNetworkRequests_ams_once_object___COUNTER__ = (uint64_t)objc_alloc_init(MEMORY[0x263EFF980]);

  return MEMORY[0x270F9A758]();
}

+ (id)_networkCounters
{
  uint64_t v2 = [a1 _networkSynchronyQueue];
  dispatch_assert_queue_V2(v2);

  if (_networkCounters_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&_networkCounters_ams_once_token___COUNTER__, &__block_literal_global_50);
  }
  id v3 = (void *)_networkCounters_ams_once_object___COUNTER__;

  return v3;
}

uint64_t __41__ISLoadURLBagOperation__networkCounters__block_invoke()
{
  _networkCounters_ams_once_object___COUNTER__ = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);

  return MEMORY[0x270F9A758]();
}

+ (id)_networkSynchronyQueue
{
  if (_networkSynchronyQueue_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&_networkSynchronyQueue_ams_once_token___COUNTER__, &__block_literal_global_52);
  }
  uint64_t v2 = (void *)_networkSynchronyQueue_ams_once_object___COUNTER__;

  return v2;
}

uint64_t __47__ISLoadURLBagOperation__networkSynchronyQueue__block_invoke()
{
  _networkSynchronyQueue_ams_once_object___COUNTER__ = (uint64_t)dispatch_queue_create("com.apple.iTunesStore.ISLoadURLBagOperation._networkSynchrony", 0);

  return MEMORY[0x270F9A758]();
}

- (void)_postBagDidLoadNotificationWithURLBag:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  id v6 = [v5 mainThreadProxy];

  [v6 postNotificationName:@"ISURLBagDidLoadNotification" object:v4];
}

- (void)_sendPingsForURLBag:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = [a3 valueForKey:@"pingUrls"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (_sendPingsForURLBag__sOnce != -1) {
      dispatch_once(&_sendPingsForURLBag__sOnce, &__block_literal_global_60);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v26 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v29;
      unint64_t v8 = 0x263F08000uLL;
      unint64_t v9 = 0x263EFF000uLL;
      do
      {
        uint64_t v10 = 0;
        uint64_t v27 = v6;
        do
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = (void *)[objc_alloc(*(Class *)(v9 + 2608)) initWithString:v11];
            if (v12)
            {
              uint64_t v13 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
              if (!v13)
              {
                uint64_t v13 = [MEMORY[0x263F7B1F8] sharedConfig];
              }
              int v14 = objc_msgSend(v13, "shouldLog", v24);
              if ([v13 shouldLogToDisk]) {
                v14 |= 2u;
              }
              uint64_t v15 = [v13 OSLogObject];
              if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
                v14 &= 2u;
              }
              if (v14)
              {
                uint64_t v16 = objc_opt_class();
                int v32 = 138412546;
                BOOL v33 = v16;
                __int16 v34 = 2112;
                v35 = v12;
                uint64_t v17 = v7;
                unint64_t v18 = v8;
                id v19 = v4;
                unint64_t v20 = v9;
                id v21 = v16;
                LODWORD(v25) = 22;
                long long v24 = &v32;
                long long v22 = (void *)_os_log_send_and_compose_impl();

                unint64_t v9 = v20;
                id v4 = v19;
                unint64_t v8 = v18;
                uint64_t v7 = v17;
                uint64_t v6 = v27;

                if (v22)
                {
                  uint64_t v15 = objc_msgSend(*(id *)(v8 + 2880), "stringWithCString:encoding:", v22, 4, &v32, v25);
                  free(v22);
                  long long v24 = (int *)v15;
                  SSFileLog();
                  goto LABEL_20;
                }
              }
              else
              {
LABEL_20:
              }
              long long v23 = +[ISStoreURLOperation pingOperationWithUrl:v12];
              [v23 setNeedsURLBag:0];
              [(id)_sendPingsForURLBag__sPingQueue addOperation:v23];
            }
          }
          ++v10;
        }
        while (v6 != v10);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v6);
    }

    id v3 = v26;
  }
}

uint64_t __45__ISLoadURLBagOperation__sendPingsForURLBag___block_invoke()
{
  v0 = objc_alloc_init(ISOperationQueue);
  v1 = (void *)_sendPingsForURLBag__sPingQueue;
  _sendPingsForURLBag__sPingQueue = (uint64_t)v0;

  [(id)_sendPingsForURLBag__sPingQueue setAdjustsMaxConcurrentOperationCount:0];
  [(id)_sendPingsForURLBag__sPingQueue setMaxConcurrentOperationCount:1];
  uint64_t v2 = (void *)_sendPingsForURLBag__sPingQueue;

  return [v2 setName:@"com.apple.iTunesStore.URLBagPingQueue"];
}

- (void)_setOutputURLBag:(id)a3
{
  id v4 = (ISURLBag *)a3;
  [(ISOperation *)self lock];
  outputBag = self->_outputBag;
  self->_outputBag = v4;

  [(ISOperation *)self unlock];
}

- (BOOL)_setURLBagWithDictionary:(id)a3 response:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(ISURLBag);
  uint64_t v11 = [(ISLoadURLBagOperation *)self context];
  [(ISURLBag *)v10 setURLBagContext:v11];
  id v35 = 0;
  BOOL v12 = [(ISURLBag *)v10 loadFromDictionary:v9 returningError:&v35];

  id v13 = v35;
  int v14 = v13;
  if (v12)
  {
    objc_msgSend(v8, "itunes_expirationInterval");
    -[ISURLBag setInvalidationTimeWithExprationInterval:](v10, "setInvalidationTimeWithExprationInterval:");
    if (SSIsDaemon())
    {
      if (![v11 bagType])
      {
        uint64_t v15 = [v11 userIdentifier];

        if (!v15)
        {
          uint64_t v16 = (void *)MEMORY[0x263F7B148];
          uint64_t v17 = [(ISURLBag *)v10 availableStorefrontItemKinds];
          LODWORD(v16) = [v16 setCachedAvailableItemKinds:v17];

          if (v16) {
            CFPreferencesSynchronize((CFStringRef)*MEMORY[0x263EFFE48], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
          }
        }
      }
    }
    unint64_t v18 = [v8 allHeaderFields];
    id v19 = ISDictionaryValueForCaseInsensitiveString(v18, (void *)*MEMORY[0x263F7B848]);
    if (!v19)
    {
      id v19 = ISDictionaryValueForCaseInsensitiveString(v18, (void *)*MEMORY[0x263F7B7F8]);
    }
    [(ISURLBag *)v10 setStoreFrontIdentifier:v19];
    unint64_t v20 = +[ISURLBagCache sharedCache];
    [v20 addURLBag:v10];

    [(ISLoadURLBagOperation *)self _postBagDidLoadNotificationWithURLBag:v10];
    [(ISLoadURLBagOperation *)self _setOutputURLBag:v10];
    [(ISLoadURLBagOperation *)self _sendPingsForURLBag:v10];

    goto LABEL_25;
  }
  BOOL v33 = a5;
  id v34 = v13;
  id v21 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v21)
  {
    id v21 = [MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v22 = [v21 shouldLog];
  if ([v21 shouldLogToDisk]) {
    int v23 = v22 | 2;
  }
  else {
    int v23 = v22;
  }
  long long v24 = [v21 OSLogObject];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    int v25 = v23;
  }
  else {
    int v25 = v23 & 2;
  }
  if (v25)
  {
    v26 = objc_opt_class();
    id v27 = v26;
    long long v28 = [v8 URL];
    int v36 = 138412802;
    uint64_t v37 = v26;
    __int16 v38 = 2112;
    BOOL v39 = v28;
    __int16 v40 = 2112;
    id v41 = v34;
    LODWORD(v32) = 32;
    long long v29 = (void *)_os_log_send_and_compose_impl();

    long long v30 = v33;
    if (!v29) {
      goto LABEL_23;
    }
    long long v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v36, v32);
    free(v29);
    SSFileLog();
  }
  else
  {
    long long v30 = a5;
  }

LABEL_23:
  int v14 = v34;
  if (v30) {
    id *v30 = v34;
  }
LABEL_25:

  return v12;
}

- (SSURLBagContext)context
{
  return (SSURLBagContext *)objc_getProperty(self, a2, 336, 1);
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (void)setAccountDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_outputBag, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end