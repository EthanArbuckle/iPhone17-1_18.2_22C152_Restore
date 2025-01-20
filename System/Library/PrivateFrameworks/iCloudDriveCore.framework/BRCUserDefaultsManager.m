@interface BRCUserDefaultsManager
- (BRCUserDefaultsManager)initWithPersonaID:(id)a3;
- (id)defaultsForIdentifier:(id)a3;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_loadServerConfigurationDictionary;
- (void)_parsePlistWithURL:(id)a3;
- (void)_prepopulateGlobalUserDefaults;
- (void)_reset;
- (void)_setServerConfigurationURL:(id)a3 whenLoaded:(id)a4;
- (void)dealloc;
- (void)loadCachedServerConfiguration;
- (void)reset;
- (void)setServerConfigurationURL:(id)a3 whenLoaded:(id)a4;
@end

@implementation BRCUserDefaultsManager

- (id)defaultsForIdentifier:(id)a3
{
  v4 = (__CFString *)a3;
  if ([(__CFString *)v4 isEqualToString:@"default"])
  {
    v16 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaultsManager defaultsForIdentifier:]();
    }
  }
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"default";
  }
  v6 = v5;
  v7 = self->_userDefaultsCache;
  objc_sync_enter(v7);
  v8 = [(NSMutableDictionary *)self->_userDefaultsCache objectForKeyedSubscript:v6];
  if (!v8)
  {
    if (!v4
      || ([(NSMutableDictionary *)self->_userDefaultsCache objectForKeyedSubscript:@"default"], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      v10 = brc_bread_crumbs();
      v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[BRCUserDefaultsManager defaultsForIdentifier:]();
      }
    }
    v12 = [BRCUserDefaults alloc];
    v13 = [(NSDictionary *)self->_serverConfigurationDict objectForKeyedSubscript:v6];
    v14 = [(NSMutableDictionary *)self->_userDefaultsCache objectForKeyedSubscript:@"default"];
    v8 = [(BRCUserDefaults *)v12 initWithServerConfiguration:v13 globalUserDefaults:v14 clientZoneIdentifier:v4];

    [(NSMutableDictionary *)self->_userDefaultsCache setObject:v8 forKeyedSubscript:v6];
  }
  objc_sync_exit(v7);

  return v8;
}

- (void)_prepopulateGlobalUserDefaults
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !_userDefaultsCache[kBRCGlobalUserDefaultsKey]%@", v2, v3, v4, v5, v6);
}

- (BRCUserDefaultsManager)initWithPersonaID:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BRCUserDefaultsManager;
  uint64_t v5 = [(BRCUserDefaultsManager *)&v25 init];
  if (v5)
  {
    uint8_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    userDefaultsCache = v5->_userDefaultsCache;
    v5->_userDefaultsCache = v6;

    [(BRCUserDefaultsManager *)v5 _prepopulateGlobalUserDefaults];
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    downloadQueue = v5->_downloadQueue;
    v5->_downloadQueue = v8;

    [(NSOperationQueue *)v5->_downloadQueue setMaxConcurrentOperationCount:1];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.bird.defaults-manager", v10);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.bird.defaults-manager-callback", v13);

    callbackQueue = v5->_callbackQueue;
    v5->_callbackQueue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v5);
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v17 = *MEMORY[0x263F08660];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __44__BRCUserDefaultsManager_initWithPersonaID___block_invoke;
    v21[3] = &unk_265086678;
    id v22 = v4;
    objc_copyWeak(&v23, &location);
    uint64_t v18 = [v16 addObserverForName:v17 object:0 queue:0 usingBlock:v21];
    defaultsDidChangeNotificationObserver = v5->_defaultsDidChangeNotificationObserver;
    v5->_defaultsDidChangeNotificationObserver = v18;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __44__BRCUserDefaultsManager_initWithPersonaID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v4 = *(id *)(a1 + 32)) == 0)
  {
    if (BRCUserDefaultsPerVersionServerDictionaryKeyPrefix_block_invoke___personaOnceToken != -1) {
      dispatch_once(&BRCUserDefaultsPerVersionServerDictionaryKeyPrefix_block_invoke___personaOnceToken, &__block_literal_global_60);
    }
    id v5 = (id)BRCUserDefaultsPerVersionServerDictionaryKeyPrefix_block_invoke___personalPersona;
    int v6 = 1;
  }
  else
  {
    id v5 = v4;
    int v6 = 0;
  }
  v7 = [MEMORY[0x263F841B0] sharedManager];
  v8 = [v7 currentPersona];

  id v27 = 0;
  id v9 = [v8 userPersonaUniqueString];
  v10 = v9;
  if (v9 == v5 || ([v9 isEqualToString:v5] & 1) != 0)
  {
    dispatch_queue_t v11 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v26 = 0;
    v16 = (void *)[v8 copyCurrentPersonaContextWithError:&v26];
    id v17 = v26;
    id v18 = v27;
    id v27 = v16;

    if (v17)
    {
      v19 = brc_bread_crumbs();
      v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
        -[_BRCOperation completedWithResult:error:]();
      }
    }
    dispatch_queue_t v11 = [v8 generateAndRestorePersonaContextWithPersonaUniqueString:v5];

    if (v11)
    {
      v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v29 = v21;
        _os_log_error_impl(&dword_23FA42000, v22, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_31:
    }
  }
  else
  {
    if (v6 && ([v8 isDataSeparatedPersona] & 1) == 0)
    {
      v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
      dispatch_queue_t v11 = 0;
      goto LABEL_31;
    }
    v24 = brc_bread_crumbs();
    objc_super v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_3();
    }

    dispatch_queue_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
  }
LABEL_10:
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    memset(buf, 0, sizeof(buf));
    __brc_create_section(0, (uint64_t)"-[BRCUserDefaultsManager initWithPersonaID:]_block_invoke", 300, buf);
    v13 = brc_bread_crumbs();
    dispatch_queue_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __44__BRCUserDefaultsManager_initWithPersonaID___block_invoke_cold_1();
    }

    id v15 = WeakRetained[3];
    objc_sync_enter(v15);
    [WeakRetained[3] removeAllObjects];
    [WeakRetained _prepopulateGlobalUserDefaults];
    objc_sync_exit(v15);

    __brc_leave_section((uint64_t *)buf);
  }

  _BRRestorePersona();
}

void __44__BRCUserDefaultsManager_initWithPersonaID___block_invoke_2()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)BRCUserDefaultsPerVersionServerDictionaryKeyPrefix_block_invoke___personalPersona;
  BRCUserDefaultsPerVersionServerDictionaryKeyPrefix_block_invoke___personalPersona = v0;
}

- (void)_setServerConfigurationURL:(id)a3 whenLoaded:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_storeStrong((id *)&self->_serverConfigurationURL, a3);
  id v9 = (void *)MEMORY[0x2455D9A50](v8);
  id configurationPlistDidUpdateBlock = self->_configurationPlistDidUpdateBlock;
  self->_id configurationPlistDidUpdateBlock = v9;

  dispatch_queue_t v11 = self->_userDefaultsCache;
  objc_sync_enter(v11);
  v12 = [(NSDictionary *)self->_serverConfigurationDict objectForKeyedSubscript:@"etag"];

  objc_sync_exit(v11);
  if (v12)
  {
    v13 = brc_bread_crumbs();
    dispatch_queue_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCUserDefaultsManager _setServerConfigurationURL:whenLoaded:]();
    }
  }
  else
  {
    memset(location, 0, sizeof(location));
    __brc_create_section(0, (uint64_t)"-[BRCUserDefaultsManager _setServerConfigurationURL:whenLoaded:]", 347, location);
    id v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCUserDefaultsManager _setServerConfigurationURL:whenLoaded:]();
    }

    [(BRCUserDefaultsManager *)self _loadServerConfigurationDictionary];
    __brc_leave_section((uint64_t *)location);
  }
  id v17 = +[BRCUserDefaults defaultsForMangledID:0];
  id v18 = [v17 configurationUpdateXPCActivity];

  objc_initWeak(location, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke;
  v23[3] = &unk_2650866A0;
  objc_copyWeak(&v24, location);
  v23[4] = self;
  id v19 = v18;
  v20 = v23;
  v21 = v20;
  if (*MEMORY[0x263F32760])
  {
    uint64_t v22 = ((void (*)(void *))*MEMORY[0x263F32760])(v20);

    v21 = (void *)v22;
  }
  xpc_activity_unregister("com.apple.bird.configuration-server-update");
  xpc_activity_register("com.apple.bird.configuration-server-update", v19, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(location);
}

void __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (xpc_activity_should_defer(v3))
  {
    if (xpc_activity_set_state(v3, 3)) {
      goto LABEL_14;
    }
    id v5 = brc_bread_crumbs();
    int v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (xpc_activity_get_state(v3) == 2)
  {
    long long buf = 0uLL;
    uint64_t v16 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCUserDefaultsManager _setServerConfigurationURL:whenLoaded:]_block_invoke", 367, &buf);
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke_cold_1();
    }

    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke_255;
    block[3] = &unk_26507ED70;
    block[4] = WeakRetained;
    dispatch_sync(v9, block);
    if (!xpc_activity_set_state(v3, 5))
    {
      v10 = brc_bread_crumbs();
      dispatch_queue_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 138412290;
        dispatch_queue_t v14 = v10;
        _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done%@", v13, 0xCu);
      }
    }
    __brc_leave_section((uint64_t *)&buf);
  }
LABEL_14:
}

uint64_t __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke_255(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadServerConfigurationDictionary];
}

- (void)setServerConfigurationURL:(id)a3 whenLoaded:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__BRCUserDefaultsManager_setServerConfigurationURL_whenLoaded___block_invoke;
  block[3] = &unk_26507F918;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(callbackQueue, block);
}

void __63__BRCUserDefaultsManager_setServerConfigurationURL_whenLoaded___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__BRCUserDefaultsManager_setServerConfigurationURL_whenLoaded___block_invoke_2;
  block[3] = &unk_26507F918;
  block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_sync(v3, block);
}

uint64_t __63__BRCUserDefaultsManager_setServerConfigurationURL_whenLoaded___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setServerConfigurationURL:*(void *)(a1 + 40) whenLoaded:*(void *)(a1 + 48)];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  memset(v26, 0, sizeof(v26));
  __brc_create_section(0, (uint64_t)"-[BRCUserDefaultsManager URLSession:downloadTask:didFinishDownloadingToURL:]", 392, v26);
  dispatch_queue_t v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218754;
    uint64_t v28 = v26[0];
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 2112;
    v34 = v11;
    _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx config: download task finished %@, plist %@%@", buf, 0x2Au);
  }

  id v13 = NSURL;
  dispatch_queue_t v14 = +[BRCUserDefaults cachedServerConfigurationPath];
  id v15 = [v13 fileURLWithPath:v14];

  uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
  id v25 = 0;
  char v17 = objc_msgSend(v16, "br_forceMoveItemAtURL:toURL:error:", v10, v15, &v25);
  id v18 = v25;

  if ((v17 & 1) == 0)
  {
    id v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
      -[BRCUserDefaultsManager URLSession:downloadTask:didFinishDownloadingToURL:]();
    }
  }
  queue = self->_queue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __76__BRCUserDefaultsManager_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  v23[3] = &unk_26507ED98;
  v23[4] = self;
  id v24 = v15;
  id v22 = v15;
  dispatch_sync(queue, v23);

  __brc_leave_section(v26);
}

uint64_t __76__BRCUserDefaultsManager_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _parsePlistWithURL:*(void *)(a1 + 40)];
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
  {
    int v9 = 138412802;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    dispatch_queue_t v14 = v7;
    _os_log_error_impl(&dword_23FA42000, v8, (os_log_type_t)0x90u, "[ERROR] config: session %@ become invalid: %@%@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a5;
  id v8 = v7;
  if (v7)
  {
    int v9 = [v7 domain];
    if ([v9 isEqualToString:*MEMORY[0x263F08570]])
    {
      if ([v8 code] == -1000)
      {
      }
      else
      {
        uint64_t v12 = [v8 code];

        if (v12 != -1002)
        {
          id v10 = 0;
          goto LABEL_14;
        }
      }
      __int16 v13 = [v6 originalRequest];
      int v9 = [v13 URL];

      dispatch_queue_t v14 = [v6 currentRequest];
      uint64_t v15 = [v14 URL];

      if ([v9 isEqual:v15]) {
        [NSString stringWithFormat:@" (URL %@)", v9, v18];
      }
      else {
      id v10 = [NSString stringWithFormat:@" (original URL: %@, current URL %@)", v9, v15];
      }
    }
    else
    {
      id v10 = 0;
    }

LABEL_14:
    __int16 v11 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      char v17 = &stru_26F3822F0;
      *(_DWORD *)long long buf = 138413058;
      if (v10) {
        char v17 = v10;
      }
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v17;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_error_impl(&dword_23FA42000, v16, (os_log_type_t)0x90u, "[ERROR] config: can't download task %@%@: %@%@", buf, 0x2Au);
    }

    goto LABEL_16;
  }
  brc_bread_crumbs();
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[BRCUserDefaultsManager URLSession:task:didCompleteWithError:]();
  }
LABEL_16:
}

- (void)loadCachedServerConfiguration
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Loaded cached server configuration %@%@", (void)v3, DWORD2(v3));
}

- (void)_parsePlistWithURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
  if (!v5)
  {
LABEL_11:
    callbackQueue = self->_callbackQueue;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __45__BRCUserDefaultsManager__parsePlistWithURL___block_invoke;
    v22[3] = &unk_26507ED70;
    v22[4] = self;
    dispatch_async(callbackQueue, v22);
    goto LABEL_15;
  }
  id v23 = 0;
  id v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:0 error:&v23];
  id v7 = v23;
  if (v6)
  {
    id v8 = [(NSDictionary *)self->_serverConfigurationDict objectForKeyedSubscript:@"etag"];
    if (!v8) {
      goto LABEL_5;
    }
    int v9 = [v6 objectForKeyedSubscript:@"etag"];
    id v10 = [(NSDictionary *)self->_serverConfigurationDict objectForKeyedSubscript:@"etag"];
    char v11 = [v9 isEqual:v10];

    if ((v11 & 1) == 0)
    {
LABEL_5:
      uint64_t v12 = self->_userDefaultsCache;
      objc_sync_enter(v12);
      __int16 v13 = brc_bread_crumbs();
      dispatch_queue_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = [v6 objectForKeyedSubscript:@"etag"];
        -[BRCUserDefaultsManager _parsePlistWithURL:](v15, (uint64_t)v13, buf, v14);
      }

      objc_storeStrong((id *)&self->_serverConfigurationDict, v6);
      [(NSMutableDictionary *)self->_userDefaultsCache removeAllObjects];
      [(BRCUserDefaultsManager *)self _prepopulateGlobalUserDefaults];
      objc_sync_exit(v12);
    }
    uint64_t v16 = brc_bread_crumbs();
    char v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[BRCUserDefaultsManager _parsePlistWithURL:]();
    }

    goto LABEL_11;
  }
  id v19 = brc_bread_crumbs();
  id v20 = brc_default_log();
  if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
  {
    serverConfigurationURL = self->_serverConfigurationURL;
    *(_DWORD *)long long buf = 138412802;
    __int16 v25 = serverConfigurationURL;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    __int16 v29 = v19;
    _os_log_error_impl(&dword_23FA42000, v20, (os_log_type_t)0x90u, "[ERROR] failed parsing plist at %@: %@%@", buf, 0x20u);
  }

LABEL_15:
}

uint64_t __45__BRCUserDefaultsManager__parsePlistWithURL___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_loadServerConfigurationDictionary
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v12, 0, sizeof(v12));
  __brc_create_section(0, (uint64_t)"-[BRCUserDefaultsManager _loadServerConfigurationDictionary]", 487, v12);
  long long v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    serverConfigurationURL = self->_serverConfigurationURL;
    *(_DWORD *)long long buf = 134218498;
    uint64_t v14 = v12[0];
    __int16 v15 = 2112;
    uint64_t v16 = serverConfigurationURL;
    __int16 v17 = 2112;
    uint64_t v18 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx config: asynchronously loading %@%@", buf, 0x20u);
  }

  if ([(NSURL *)self->_serverConfigurationURL isFileURL])
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v14 = (uint64_t)v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] loading iCloud Drive configuration from disk%@", buf, 0xCu);
    }

    [(BRCUserDefaultsManager *)self _parsePlistWithURL:self->_serverConfigurationURL];
  }
  else
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v14 = (uint64_t)v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading iCloud Drive configuration%@", buf, 0xCu);
    }

    downloadQueue = self->_downloadQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__BRCUserDefaultsManager__loadServerConfigurationDictionary__block_invoke;
    v11[3] = &unk_26507ED70;
    v11[4] = self;
    [(NSOperationQueue *)downloadQueue addOperationWithBlock:v11];
  }
  __brc_leave_section(v12);
}

void __60__BRCUserDefaultsManager__loadServerConfigurationDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(void **)(v2 + 48);
  if (v3) {
    goto LABEL_5;
  }
  id v4 = objc_msgSend(NSString, "brc_currentCachesDir");
  if (v4)
  {
    id v5 = [MEMORY[0x263EFC648] backgroundSessionConfigurationWithIdentifier:@"fetch-configuration"];
    [v5 setHTTPCookieStorage:0];
    [v5 setURLCredentialStorage:0];
    [v5 setURLCache:0];
    [v5 setDiscretionary:1];
    uint64_t v6 = [MEMORY[0x263EFC640] sessionWithConfiguration:v5 delegate:*(void *)(a1 + 32) delegateQueue:*(void *)(*(void *)(a1 + 32) + 40)];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = v6;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(void **)(v2 + 48);
  if (v3)
  {
LABEL_5:
    int v9 = [v3 downloadTaskWithURL:*(void *)(v2 + 8)];
    id v10 = brc_bread_crumbs();
    char v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __60__BRCUserDefaultsManager__loadServerConfigurationDictionary__block_invoke_cold_1();
    }

    [v9 resume];
  }
}

- (void)_reset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  obj = self->_userDefaultsCache;
  objc_sync_enter(obj);
  serverConfigurationDict = self->_serverConfigurationDict;
  self->_serverConfigurationDict = 0;

  serverConfigurationURL = self->_serverConfigurationURL;
  self->_serverConfigurationURL = 0;

  [(NSMutableDictionary *)self->_userDefaultsCache removeAllObjects];
  [(BRCUserDefaultsManager *)self _prepopulateGlobalUserDefaults];
  objc_sync_exit(obj);
}

- (void)reset
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__BRCUserDefaultsManager_reset__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __31__BRCUserDefaultsManager_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reset];
}

- (void)dealloc
{
  long long v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_defaultsDidChangeNotificationObserver];

  v4.receiver = self;
  v4.super_class = (Class)BRCUserDefaultsManager;
  [(BRCUserDefaultsManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong(&self->_configurationPlistDidUpdateBlock, 0);
  objc_storeStrong((id *)&self->_userDefaultsCache, 0);
  objc_storeStrong((id *)&self->_serverConfigurationDict, 0);
  objc_storeStrong((id *)&self->_serverConfigurationURL, 0);
}

void __44__BRCUserDefaultsManager_initWithPersonaID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┏%llx defaults changed%@", (void)v3, DWORD2(v3));
}

- (void)defaultsForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: clientZoneIdentifier && _userDefaultsCache[kBRCGlobalUserDefaultsKey]%@", v2, v3, v4, v5, v6);
}

- (void)defaultsForIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: ![clientZoneIdentifier isEqualToString:kBRCGlobalUserDefaultsKey]%@", v2, v3, v4, v5, v6);
}

- (void)_setServerConfigurationURL:whenLoaded:.cold.1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┏%llx config: initial load%@", (void)v3, DWORD2(v3));
}

- (void)_setServerConfigurationURL:whenLoaded:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] config: not updating the configuration, waiting for next activity callback%@", v2, v3, v4, v5, v6);
}

void __64__BRCUserDefaultsManager__setServerConfigurationURL_whenLoaded___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┏%llx config: it's activity time%@", (void)v3, DWORD2(v3));
}

- (void)URLSession:downloadTask:didFinishDownloadingToURL:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] config: failed to move downloaded cache file into place %@%@");
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] config: download finished for %@%@");
}

- (void)_parsePlistWithURL:.cold.1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] config: Loaded server configuration from %@%@", (void)v3, DWORD2(v3));
}

- (void)_parsePlistWithURL:(uint8_t *)buf .cold.2(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Server configuration changed to etag %@%@", buf, 0x16u);
}

void __60__BRCUserDefaultsManager__loadServerConfigurationDictionary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] scheduling config download %@%@");
}

@end