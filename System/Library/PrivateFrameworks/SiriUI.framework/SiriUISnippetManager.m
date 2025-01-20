@interface SiriUISnippetManager
+ (id)sharedInstance;
- (BOOL)_compareObject:(id)a3 toObject:(id)a4 usingBlock:(id)a5;
- (BOOL)_listItem:(id)a3 isEqualToListItem:(id)a4;
- (BOOL)_listItem:(id)a3 isPreferredOverListItem:(id)a4;
- (SiriUISnippetManager)init;
- (id)_createDebugViewControllerForAceObject:(id)a3;
- (id)_snippetExtensionsCache;
- (id)disambiguationItemForListItem:(id)a3 disambiguationKey:(id)a4;
- (id)extensionForSnippet:(id)a3;
- (id)filteredDisambiguationListItems:(id)a3;
- (id)listItemToPickInAutodisambiguationForListItems:(id)a3;
- (id)safeDisambiguationItemForListItem:(id)a3 disambiguationKey:(id)a4;
- (id)snippetViewControllerForSnippet:(id)a3;
- (id)speakableProviderForObject:(id)a3;
- (id)transcriptItemForObject:(id)a3;
- (id)transcriptItemForObject:(id)a3 sizeClass:(int64_t)a4;
- (void)_prewarmSnippetExtensionsCacheSynchronously;
- (void)preloadPluginBundles;
- (void)prewarmSnippetExtensionsCache;
@end

@implementation SiriUISnippetManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __38__SiriUISnippetManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SiriUISnippetManager);
  uint64_t v1 = sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SiriUISnippetManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)SiriUISnippetManager;
  v2 = [(SiriUISnippetManager *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F28468] clientPluginManagerWithFactoryInitializationBlock:&__block_literal_global_7];
    pluginManager = v2->_pluginManager;
    v2->_pluginManager = (AFClientPluginManager *)v3;

    snippetExtensionsCache = v2->_snippetExtensionsCache;
    v2->_snippetExtensionsCache = 0;

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("SnippetExtensionsQueue", v6);
    snippetExtensionsQueue = v2->_snippetExtensionsQueue;
    v2->_snippetExtensionsQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("PluginBundlesQueue", v9);
    pluginBundlesQueue = v2->_pluginBundlesQueue;
    v2->_pluginBundlesQueue = (OS_dispatch_queue *)v10;

    [(SiriUISnippetManager *)v2 preloadPluginBundles];
  }
  return v2;
}

id __28__SiriUISnippetManager_init__block_invoke(uint64_t a1, objc_class *a2)
{
  id v2 = objc_alloc_init(a2);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [MEMORY[0x263F1C408] sharedApplication];
    [v2 setOrientationDelegate:v3];
  }
  return v2;
}

- (void)preloadPluginBundles
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SiriUISnippetManager_preloadPluginBundles__block_invoke;
  block[3] = &unk_26469EFA8;
  block[4] = self;
  if (preloadPluginBundles_onceToken != -1) {
    dispatch_once(&preloadPluginBundles_onceToken, block);
  }
}

void __44__SiriUISnippetManager_preloadPluginBundles__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SiriUISnippetManager_preloadPluginBundles__block_invoke_2;
  block[3] = &unk_26469EFA8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __44__SiriUISnippetManager_preloadPluginBundles__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) preloadBundles];
}

- (void)prewarmSnippetExtensionsCache
{
  snippetExtensionsQueue = self->_snippetExtensionsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SiriUISnippetManager_prewarmSnippetExtensionsCache__block_invoke;
  block[3] = &unk_26469EFA8;
  block[4] = self;
  dispatch_async(snippetExtensionsQueue, block);
}

uint64_t __53__SiriUISnippetManager_prewarmSnippetExtensionsCache__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prewarmSnippetExtensionsCacheSynchronously];
}

- (id)extensionForSnippet:(id)a3
{
  id v4 = a3;
  v5 = [(SiriUISnippetManager *)self _snippetExtensionsCache];
  v6 = (objc_class *)objc_opt_class();

  dispatch_queue_t v7 = NSStringFromClass(v6);
  v8 = [v5 objectForKeyedSubscript:v7];

  return v8;
}

- (void)_prewarmSnippetExtensionsCacheSynchronously
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SiriUISnippetManager__prewarmSnippetExtensionsCacheSynchronously__block_invoke;
  block[3] = &unk_26469EFA8;
  block[4] = self;
  if (_prewarmSnippetExtensionsCacheSynchronously_onceToken != -1) {
    dispatch_once(&_prewarmSnippetExtensionsCacheSynchronously_onceToken, block);
  }
}

void __67__SiriUISnippetManager__prewarmSnippetExtensionsCacheSynchronously__block_invoke(uint64_t a1)
{
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  uint64_t v3 = (void *)MEMORY[0x263F08800];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__SiriUISnippetManager__prewarmSnippetExtensionsCacheSynchronously__block_invoke_2;
  v6[3] = &unk_26469F628;
  v6[4] = *(void *)(a1 + 32);
  dispatch_queue_t v7 = v2;
  id v4 = v2;
  objc_msgSend(v3, "_intents_matchSiriUISnippetExtensionsWithCompletion:", v6);
  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v4, v5);
}

void __67__SiriUISnippetManager__prewarmSnippetExtensionsCacheSynchronously__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    dispatch_queue_t v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = MEMORY[0x263EFFA78];
  }
  else
  {
    uint64_t v25 = a1;
    v8 = [MEMORY[0x263EFF9A0] dictionary];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v24 = v5;
    obuint64_t j = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(obj);
          }
          objc_super v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v14 = [v13 attributes];
          v15 = [v14 objectForKeyedSubscript:@"SAUISnippetSubclassNames"];

          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v28 != v19) {
                  objc_enumerationMutation(v16);
                }
                [v8 setObject:v13 forKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * j)];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v18);
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v10);
    }

    uint64_t v21 = [v8 copy];
    a1 = v25;
    uint64_t v22 = *(void *)(v25 + 32);
    v23 = *(void **)(v22 + 16);
    *(void *)(v22 + 16) = v21;

    id v5 = v24;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)_snippetExtensionsCache
{
  snippetExtensionsQueue = self->_snippetExtensionsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SiriUISnippetManager__snippetExtensionsCache__block_invoke;
  block[3] = &unk_26469EFA8;
  block[4] = self;
  dispatch_sync(snippetExtensionsQueue, block);
  return self->_snippetExtensionsCache;
}

void *__47__SiriUISnippetManager__snippetExtensionsCache__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return (void *)[result _prewarmSnippetExtensionsCacheSynchronously];
  }
  return result;
}

- (id)_createDebugViewControllerForAceObject:(id)a3
{
  v13[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263F086E0];
  id v5 = NSString;
  uint64_t v6 = MEMORY[0x223CB0F80]();
  v13[0] = v6;
  v13[1] = @"AppleInternal";
  v13[2] = @"/Library/Assistant/UIPlugins";
  v13[3] = @"Debug.siriUIBundle";
  dispatch_queue_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
  v8 = [v5 pathWithComponents:v7];
  uint64_t v9 = [v4 bundleWithPath:v8];

  uint64_t v10 = 0;
  if ([v9 loadAndReturnError:0])
  {
    id v11 = objc_alloc_init((Class)[v9 principalClass]);
    uint64_t v10 = [v11 viewControllerForSnippet:v3];
  }
  return v10;
}

- (BOOL)_listItem:(id)a3 isEqualToListItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 object];
  uint64_t v9 = [v7 object];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__SiriUISnippetManager__listItem_isEqualToListItem___block_invoke;
  v13[3] = &unk_26469F650;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  LOBYTE(self) = [(SiriUISnippetManager *)self _compareObject:v8 toObject:v9 usingBlock:v13];

  return (char)self;
}

BOOL __52__SiriUISnippetManager__listItem_isEqualToListItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (objc_opt_respondsToSelector() & 1) != 0
    && ([v3 listItem:*(void *)(a1 + 32) isEqualToListItem:*(void *)(a1 + 40)] & 1) != 0;

  return v4;
}

- (BOOL)_listItem:(id)a3 isPreferredOverListItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 object];
  uint64_t v9 = [v7 object];
  if (v8 | v9)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__SiriUISnippetManager__listItem_isPreferredOverListItem___block_invoke;
    v12[3] = &unk_26469F650;
    id v13 = v6;
    id v14 = v7;
    BOOL v10 = [(SiriUISnippetManager *)self _compareObject:v8 toObject:v9 usingBlock:v12];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

BOOL __58__SiriUISnippetManager__listItem_isPreferredOverListItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (objc_opt_respondsToSelector() & 1) != 0
    && ([v3 listItem:*(void *)(a1 + 32) isPreferredOverListItem:*(void *)(a1 + 40)] & 1) != 0;

  return v4;
}

- (BOOL)_compareObject:(id)a3 toObject:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  BOOL v12 = 0;
  if (v10 && v8 && v9)
  {
    uint64_t v28 = 0;
    long long v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    id v24 = __59__SiriUISnippetManager__compareObject_toObject_usingBlock___block_invoke;
    uint64_t v25 = &unk_26469F678;
    long long v27 = &v28;
    id v26 = v10;
    id v13 = (void *)MEMORY[0x223CB13F0](&v22);
    pluginManager = self->_pluginManager;
    id v15 = objc_msgSend(v8, "groupIdentifier", v22, v23, v24, v25);
    id v16 = [v8 encodedClassName];
    uint64_t v17 = *MEMORY[0x263F28280];
    [(AFClientPluginManager *)pluginManager enumerateFactoryInstancesForDomainKey:*MEMORY[0x263F28280] groupIdentifier:v15 classIdentifier:v16 usingBlock:v13];

    if (*((unsigned char *)v29 + 24))
    {
      BOOL v12 = 1;
    }
    else
    {
      uint64_t v18 = self->_pluginManager;
      uint64_t v19 = [v9 groupIdentifier];
      v20 = [v9 encodedClassName];
      [(AFClientPluginManager *)v18 enumerateFactoryInstancesForDomainKey:v17 groupIdentifier:v19 classIdentifier:v20 usingBlock:v13];

      BOOL v12 = *((unsigned char *)v29 + 24) != 0;
    }

    _Block_object_dispose(&v28, 8);
  }

  return v12;
}

uint64_t __59__SiriUISnippetManager__compareObject_toObject_usingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (id)transcriptItemForObject:(id)a3
{
  return [(SiriUISnippetManager *)self transcriptItemForObject:a3 sizeClass:0];
}

- (id)transcriptItemForObject:(id)a3 sizeClass:(int64_t)a4
{
  id v7 = a3;
  uint64_t v30 = 0;
  char v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__0;
  uint64_t v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke;
  v18[3] = &unk_26469F6C8;
  id v8 = v7;
  uint64_t v21 = &v24;
  int64_t v22 = a4;
  id v19 = v8;
  v20 = self;
  SEL v23 = a2;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke_3;
  v17[3] = &unk_26469F170;
  v17[4] = &v30;
  SiriUIBlockExecuteMonitored(v18, v17);
  if ([(id)v25[5] conformsToProtocol:&unk_26D67B330]) {
    [(id)v25[5] configureContentWithSizeClass:a4];
  }
  if (!v25[5])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !*((unsigned char *)v31 + 24))
    {
      id v9 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        -[SiriUISnippetManager transcriptItemForObject:sizeClass:]((uint64_t)v8, v9);
      }
      uint64_t v10 = [(SiriUISnippetManager *)self _createDebugViewControllerForAceObject:v8];
      id v11 = (void *)v25[5];
      v25[5] = v10;
    }
  }
  if (!v25[5])
  {
    BOOL v12 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriUISnippetManager transcriptItemForObject:sizeClass:]((uint64_t)v8, v12);
    }
    id v13 = [[SiriUIErrorSnippetViewController alloc] initWithError:0];
    id v14 = (void *)v25[5];
    v25[5] = (uint64_t)v13;
  }
  id v15 = [MEMORY[0x263F744A0] transcriptItemWithAceObject:v8];
  [v15 setViewController:v25[5]];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = *(id *)(a1 + 32);
    uint64_t v2 = +[SiriUIPrivateViewControllerOverrides viewControllerForSnippet:sizeClass:](SiriUIPrivateViewControllerOverrides, "viewControllerForSnippet:sizeClass:");
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v5 = [*(id *)(a1 + 40) snippetViewControllerForSnippet:v14];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = *(void **)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *MEMORY[0x263F28288];
      uint64_t v10 = [*(id *)(a1 + 32) groupIdentifier];
      id v11 = [*(id *)(a1 + 32) encodedClassName];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke_2;
      v15[3] = &unk_26469F6A0;
      uint64_t v18 = *(void *)(a1 + 48);
      id v12 = *(id *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 64);
      uint64_t v13 = *(void *)(a1 + 40);
      id v16 = v12;
      uint64_t v17 = v13;
      [v8 enumerateFactoryInstancesForDomainKey:v9 groupIdentifier:v10 classIdentifier:v11 usingBlock:v15];
    }
  }
}

uint64_t __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  id v13 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v13 viewControllerForAceObject:a1[4]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  uint64_t v8 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v9 = v13;
  if ((id)v8 == v13)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a1[7], a1[5], @"SiriUISnippetManager.m", 219, @"Plugin factory %@ must return an new allocated instance of SiriUIAceObjectViewController from viewControllerForAceObject:", objc_opt_class() object file lineNumber description];

    id v9 = v13;
    uint64_t v8 = *(void *)(*(void *)(a1[6] + 8) + 40);
    if (!v8) {
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    goto LABEL_7;
  }
  uint64_t v8 = [(id)v8 conformsToProtocol:&unk_26D66B700];
  id v9 = v13;
  if ((v8 & 1) == 0)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a1[7], a1[5], @"SiriUISnippetManager.m", 220, @"viewControllerForAceObject must conform to the SiriSharedUIViewControlling protocol, %@", *(void *)(*(void *)(a1[6] + 8) + 40) object file lineNumber description];

    id v9 = v13;
  }
LABEL_7:
  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    *a3 = 1;
  }
  return MEMORY[0x270F9A758](v8, v9);
}

uint64_t __58__SiriUISnippetManager_transcriptItemForObject_sizeClass___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (id)snippetViewControllerForSnippet:(id)a3
{
  id v5 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__0;
  v28[4] = __Block_byref_object_dispose__0;
  id v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__0;
  v26[4] = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  SEL v23 = __Block_byref_object_copy__0;
  uint64_t v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  pluginManager = self->_pluginManager;
  id v7 = [v5 groupIdentifier];
  uint64_t v8 = [v5 encodedClassName];
  uint64_t v9 = *MEMORY[0x263F28288];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__SiriUISnippetManager_snippetViewControllerForSnippet___block_invoke;
  v13[3] = &unk_26469F6F0;
  id v16 = &v20;
  id v10 = v5;
  id v14 = v10;
  id v15 = self;
  uint64_t v17 = v26;
  uint64_t v18 = v28;
  SEL v19 = a2;
  [(AFClientPluginManager *)pluginManager enumerateFactoryInstancesForDomainKey:v9 groupIdentifier:v7 classIdentifier:v8 usingBlock:v13];

  id v11 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

  return v11;
}

void __56__SiriUISnippetManager_snippetViewControllerForSnippet___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = *(void *)(a1[7] + 8);
    obuint64_t j = *(id *)(v7 + 40);
    uint64_t v8 = [v5 viewControllerForSnippet:v6 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v11 = [v5 viewControllerForSnippet:a1[4]];
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

LABEL_6:
  if ([*(id *)(*(void *)(a1[7] + 8) + 40) isSiriUISnippetPluginError]) {
    BOOL v13 = [*(id *)(*(void *)(a1[7] + 8) + 40) code] == 100;
  }
  else {
    BOOL v13 = 0;
  }
  id v14 = *(id *)(*(void *)(a1[6] + 8) + 40);
  if (v14 == v5)
  {
    uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a1[9], a1[5], @"SiriUISnippetManager.m", 267, @"Plugin factory %@ must return an new allocated instance of SiriUIBaseSnippetViewController from viewControllerForSnippet:", objc_opt_class() object file lineNumber description];

    if (!*(void *)(*(void *)(a1[6] + 8) + 40)) {
      goto LABEL_13;
    }
  }
  else if (!v14)
  {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    SEL v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a1[9], a1[5], @"SiriUISnippetManager.m", 268, @"viewControllerForSnippet must be a subclass of SiriUIBaseSnippetViewController, %@", *(void *)(*(void *)(a1[6] + 8) + 40) object file lineNumber description];
  }
LABEL_13:
  if (!v13 && (unint64_t v15 = *(void *)(*(void *)(a1[7] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40) | v15))
  {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), (id)v15);
    uint64_t v20 = *(void *)(a1[7] + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = 0;

    *a3 = 1;
  }
  else
  {
    id v16 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = a1[4];
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = "-[SiriUISnippetManager snippetViewControllerForSnippet:]_block_invoke";
      __int16 v27 = 2112;
      id v28 = v5;
      __int16 v29 = 2112;
      uint64_t v30 = v17;
      _os_log_impl(&dword_2231EF000, v16, OS_LOG_TYPE_DEFAULT, "%s Plugin:%@ does not support snippet:%@. Trying next plugin.", buf, 0x20u);
    }
    uint64_t v18 = *(void *)(a1[7] + 8);
    SEL v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;
  }
}

- (id)filteredDisambiguationListItems:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  uint64_t v6 = [v5 object];
  if (v6)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__0;
    uint64_t v21 = __Block_byref_object_dispose__0;
    id v7 = v4;
    id v22 = v7;
    pluginManager = self->_pluginManager;
    uint64_t v9 = [v6 groupIdentifier];
    id v10 = [v6 encodedClassName];
    uint64_t v11 = *MEMORY[0x263F28280];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__SiriUISnippetManager_filteredDisambiguationListItems___block_invoke;
    v14[3] = &unk_26469F718;
    id v16 = &v17;
    id v15 = v7;
    [(AFClientPluginManager *)pluginManager enumerateFactoryInstancesForDomainKey:v11 groupIdentifier:v9 classIdentifier:v10 usingBlock:v14];

    id v12 = (id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v12 = v4;
  }

  return v12;
}

void __56__SiriUISnippetManager_filteredDisambiguationListItems___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v8 filteredDisambiguationListItems:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *a3 = 1;
  }
}

- (id)safeDisambiguationItemForListItem:(id)a3 disambiguationKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = +[SiriUIDisambiguationItem disambiguationItem];
  pluginBundlesQueue = self->_pluginBundlesQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__SiriUISnippetManager_safeDisambiguationItemForListItem_disambiguationKey___block_invoke;
  v13[3] = &unk_26469F740;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(pluginBundlesQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __76__SiriUISnippetManager_safeDisambiguationItemForListItem_disambiguationKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) disambiguationItemForListItem:*(void *)(a1 + 40) disambiguationKey:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)disambiguationItemForListItem:(id)a3 disambiguationKey:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 object];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__0;
  v50 = __Block_byref_object_dispose__0;
  id v51 = 0;
  if (!v9)
  {
    __int16 v27 = [v7 title];
    BOOL v28 = v27 == 0;

    if (!v28)
    {
      uint64_t v29 = +[SiriUIDisambiguationItem disambiguationItem];
      uint64_t v30 = (void *)v47[5];
      v47[5] = v29;

      uint64_t v31 = (void *)v47[5];
      uint64_t v32 = [v7 title];
      [v31 setTitle:v32];

      id v25 = (id)v47[5];
      goto LABEL_14;
    }
  }
  id v10 = [v9 groupIdentifier];
  if (v10)
  {
    id v11 = [v9 encodedClassName];
    BOOL v12 = v11 == 0;

    if (!v12)
    {
      pluginManager = self->_pluginManager;
      id v14 = [v9 groupIdentifier];
      id v15 = [v9 encodedClassName];
      uint64_t v16 = *MEMORY[0x263F28280];
      uint64_t v36 = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      v38 = __72__SiriUISnippetManager_disambiguationItemForListItem_disambiguationKey___block_invoke;
      v39 = &unk_26469F768;
      v44 = &v46;
      id v17 = v7;
      id v40 = v17;
      id v41 = v8;
      SEL v45 = a2;
      id v42 = v9;
      v43 = self;
      [(AFClientPluginManager *)pluginManager enumerateFactoryInstancesForDomainKey:v16 groupIdentifier:v14 classIdentifier:v15 usingBlock:&v36];

      uint64_t v18 = [v17 label];
      if ([v18 length])
      {
        uint64_t v19 = [v17 labelValue];
        BOOL v20 = [v19 length] == 0;

        if (v20)
        {
LABEL_8:
          id v25 = (id)v47[5];

          goto LABEL_14;
        }
        [(id)v47[5] setHeadingText:0];
        uint64_t v21 = (void *)v47[5];
        id v22 = NSString;
        uint64_t v18 = [v17 label];
        SEL v23 = [v17 labelValue];
        uint64_t v24 = [v22 stringWithFormat:@"%@ %@", v18, v23, v36, v37, v38, v39, v40, v41];
        [v21 setSubtitle:v24];
      }
      goto LABEL_8;
    }
  }
  uint64_t v26 = (id)*MEMORY[0x263F28348];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    id v34 = [v9 groupIdentifier];
    v35 = [v9 encodedClassName];
    *(_DWORD *)buf = 136315906;
    v53 = "-[SiriUISnippetManager disambiguationItemForListItem:disambiguationKey:]";
    __int16 v54 = 2112;
    id v55 = v34;
    __int16 v56 = 2112;
    v57 = v35;
    __int16 v58 = 2112;
    id v59 = v7;
    _os_log_error_impl(&dword_2231EF000, v26, OS_LOG_TYPE_ERROR, "%s No disambiguation item can be found with empty groupIdentifier  (%@) or classname (%@). ListItem: %@", buf, 0x2Au);
  }
  id v25 = 0;
LABEL_14:
  _Block_object_dispose(&v46, 8);

  return v25;
}

void __72__SiriUISnippetManager_disambiguationItemForListItem_disambiguationKey___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 disambiguationItemForListItem:a1[4] disambiguationKey:a1[5]];
    uint64_t v7 = *(void *)(a1[8] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = *(id *)(*(void *)(a1[8] + 8) + 40);
    if (v9)
    {
      if (v9 == v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v10 = [MEMORY[0x263F08690] currentHandler];
        [v10 handleFailureInMethod:a1[9], a1[7], @"SiriUISnippetManager.m", 335, @"Plugin factory %@ must return an new allocated instance of id SiriUIDisambiguationItem from disambiguationItemForListItem:disambiguationKey:", objc_opt_class() object file lineNumber description];
      }
    }
    else
    {
      id v11 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        __72__SiriUISnippetManager_disambiguationItemForListItem_disambiguationKey___block_invoke_cold_1(v11, (uint64_t)v5, (uint64_t)a1);
      }
    }
  }
  if (*(void *)(*(void *)(a1[8] + 8) + 40)) {
    *a3 = 1;
  }
}

- (id)listItemToPickInAutodisambiguationForListItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if ([v4 count] == 1)
    {
      id v5 = [v4 firstObject];
    }
    else
    {
      uint64_t v19 = 0;
      BOOL v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 1;
      uint64_t v13 = 0;
      id v14 = &v13;
      uint64_t v15 = 0x3032000000;
      uint64_t v16 = __Block_byref_object_copy__0;
      id v17 = __Block_byref_object_dispose__0;
      id v18 = [v4 firstObject];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __71__SiriUISnippetManager_listItemToPickInAutodisambiguationForListItems___block_invoke;
      v8[3] = &unk_26469F790;
      id v9 = v4;
      id v10 = self;
      id v11 = &v19;
      BOOL v12 = &v13;
      [v9 enumerateObjectsUsingBlock:v8];
      if (*((unsigned char *)v20 + 24)) {
        uint64_t v6 = (void *)v14[5];
      }
      else {
        uint64_t v6 = 0;
      }
      id v5 = v6;

      _Block_object_dispose(&v13, 8);
      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __71__SiriUISnippetManager_listItemToPickInAutodisambiguationForListItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  if (a3)
  {
    uint64_t v7 = [*(id *)(a1 + 32) objectAtIndex:a3 - 1];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v8 + 24))
    {
      char v9 = [*(id *)(a1 + 40) _listItem:v13 isEqualToListItem:v7];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    else
    {
      char v9 = 0;
    }
    *(unsigned char *)(v8 + 24) = v9;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      char v10 = [*(id *)(a1 + 40) _listItem:v13 isPreferredOverListItem:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      BOOL v12 = v13;
      if ((v10 & 1) == 0) {
        BOOL v12 = *(void **)(v11 + 40);
      }
      objc_storeStrong((id *)(v11 + 40), v12);
    }
    else
    {
      *a4 = 1;
    }
  }
}

- (id)speakableProviderForObject:(id)a3
{
  return (id)[(AFClientPluginManager *)self->_pluginManager speakableNamespaceProviderForAceObject:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginBundlesQueue, 0);
  objc_storeStrong((id *)&self->_snippetExtensionsQueue, 0);
  objc_storeStrong((id *)&self->_snippetExtensionsCache, 0);
  objc_storeStrong((id *)&self->_pluginManager, 0);
}

- (void)transcriptItemForObject:(uint64_t)a1 sizeClass:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  uint64_t v3 = "-[SiriUISnippetManager transcriptItemForObject:sizeClass:]";
  __int16 v4 = 2114;
  uint64_t v5 = 0;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_2231EF000, a2, OS_LOG_TYPE_ERROR, "%s unable to create view controller for ACE object. Falling back to error snippet view controller. Error=%{public}@; ACE object=%@",
    (uint8_t *)&v2,
    0x20u);
}

- (void)transcriptItemForObject:(uint64_t)a1 sizeClass:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[SiriUISnippetManager transcriptItemForObject:sizeClass:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2231EF000, a2, OS_LOG_TYPE_ERROR, "%s unable to find plugin capable of creating a view controller for ACE object. Falling back to the debug view controller. ACE object=%@", (uint8_t *)&v2, 0x16u);
}

void __72__SiriUISnippetManager_disambiguationItemForListItem_disambiguationKey___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  __int16 v4 = a1;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = *(void **)(a3 + 48);
  id v7 = v5;
  uint64_t v8 = [v6 groupIdentifier];
  int v10 = 136315906;
  uint64_t v11 = "-[SiriUISnippetManager disambiguationItemForListItem:disambiguationKey:]_block_invoke";
  __int16 v12 = 2114;
  id v13 = v5;
  __int16 v14 = 2114;
  uint64_t v15 = v8;
  __int16 v16 = 2114;
  id v17 = (id)objc_opt_class();
  id v9 = v17;
  _os_log_error_impl(&dword_2231EF000, v4, OS_LOG_TYPE_ERROR, "%s Plugin factory %{public}@ returned a nil disambiguationItem for group id %{public}@ & item object class %{public}@", (uint8_t *)&v10, 0x2Au);
}

@end