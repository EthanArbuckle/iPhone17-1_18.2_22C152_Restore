@interface QLExtensionManagerCache
+ (id)bestMatchingExtensionsFromSupportingExtensions:(id)a3 includingExtensionsWithSupportingParentTypes:(BOOL)a4 byContentType:(id)a5;
- (BOOL)_supportedContentTypesFromExtension:(id)a3 matches:(id)a4 allowMatchingWithParentTypes:(BOOL)a5;
- (BOOL)hasExtensionWithMatchingAttributes:(id)a3;
- (BOOL)isMatchingExtensions;
- (NSDictionary)matchingAttributes;
- (NSMapTable)qlExtensions;
- (NSMutableDictionary)matchingExtensions;
- (NSMutableDictionary)queryCache;
- (OS_dispatch_semaphore)waitForExtensionsSemaphore;
- (QLExtensionManagerCache)initWithMatchingAttributes:(id)a3;
- (id)extensionWithMatchingAttributes:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 extensionPath:(id)a5;
- (id)extensionWithMatchingAttributes:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 extensionPath:(id)a5 firstPartyExtension:(BOOL)a6;
- (id)matchingContext;
- (void)_didReceiveNewMatchingExtensionList:(id)a3;
- (void)_synchronouslyWaitForExtensionListIfNeeded;
- (void)beginMatchingExtensions;
- (void)dealloc;
- (void)endMatchingExtensions;
- (void)setIsMatchingExtensions:(BOOL)a3;
- (void)setMatchingAttributes:(id)a3;
- (void)setMatchingContext:(id)a3;
- (void)setMatchingExtensions:(id)a3;
- (void)setQlExtensions:(id)a3;
- (void)setQueryCache:(id)a3;
- (void)setWaitForExtensionsSemaphore:(id)a3;
@end

@implementation QLExtensionManagerCache

- (QLExtensionManagerCache)initWithMatchingAttributes:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)QLExtensionManagerCache;
  v5 = [(QLExtensionManagerCache *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    matchingAttributes = v5->_matchingAttributes;
    v5->_matchingAttributes = (NSDictionary *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.quicklook.extensionmanager.accessextensions", v8);
    accessMatchingExtensionsQueue = v5->_accessMatchingExtensionsQueue;
    v5->_accessMatchingExtensionsQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.quicklook.extensionmanager.waitforextensions", v11);
    waitForExtensionListQueue = v5->_waitForExtensionListQueue;
    v5->_waitForExtensionListQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.quicklook.extensionmanager.querycache", v14);
    queryCacheQueue = v5->_queryCacheQueue;
    v5->_queryCacheQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = objc_opt_new();
    queryCache = v5->_queryCache;
    v5->_queryCache = (NSMutableDictionary *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)beginMatchingExtensions
{
  self->_isMatchingExtensions = 1;
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x263F08800];
  matchingAttributes = self->_matchingAttributes;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__QLExtensionManagerCache_beginMatchingExtensions__block_invoke;
  v7[3] = &unk_2642F2200;
  objc_copyWeak(&v8, &location);
  v5 = [v3 beginMatchingExtensionsWithAttributes:matchingAttributes completion:v7];
  id matchingContext = self->_matchingContext;
  self->_id matchingContext = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__QLExtensionManagerCache_beginMatchingExtensions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didReceiveNewMatchingExtensionList:v3];
}

- (void)endMatchingExtensions
{
  accessMatchingExtensionsQueue = self->_accessMatchingExtensionsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__QLExtensionManagerCache_endMatchingExtensions__block_invoke;
  block[3] = &unk_2642F2228;
  block[4] = self;
  dispatch_sync(accessMatchingExtensionsQueue, block);
}

void __48__QLExtensionManagerCache_endMatchingExtensions__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) matchingContext];

  if (v2)
  {
    id v3 = (void *)MEMORY[0x263F08800];
    id v4 = [*(id *)(a1 + 32) matchingContext];
    [v3 endMatchingExtensions:v4];

    [*(id *)(a1 + 32) setMatchingContext:0];
    [*(id *)(a1 + 32) setMatchingExtensions:0];
    v5 = *(void **)(a1 + 32);
    [v5 setIsMatchingExtensions:0];
  }
}

- (void)_didReceiveNewMatchingExtensionList:(id)a3
{
  id v4 = a3;
  accessMatchingExtensionsQueue = self->_accessMatchingExtensionsQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__QLExtensionManagerCache__didReceiveNewMatchingExtensionList___block_invoke;
  v7[3] = &unk_2642F2250;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessMatchingExtensionsQueue, v7);
}

void __63__QLExtensionManagerCache__didReceiveNewMatchingExtensionList___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) matchingExtensions];
  id v3 = objc_opt_new();
  [*(id *)(a1 + 32) setMatchingExtensions:v3];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_queue_t v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v10 = [v9 _plugIn];
        uint64_t v11 = [v10 userElection] & 0xFE;

        if (!v11)
        {
          dispatch_queue_t v12 = [v9 identifier];
          v13 = [v2 objectForKeyedSubscript:v12];

          v14 = [v13 extension];
          int v15 = [v14 isEqual:v9];

          if (v15)
          {
            v16 = [v9 identifier];
            [v2 removeObjectForKey:v16];

            uint64_t v17 = v13;
          }
          else
          {
            uint64_t v17 = [[QLExtension alloc] initWithExtension:v9];
          }
          v18 = v17;
          v19 = [*(id *)(a1 + 32) matchingExtensions];
          v20 = [v9 identifier];
          [v19 setObject:v18 forKeyedSubscript:v20];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v6);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  objc_super v21 = [v2 objectEnumerator];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * j) invalidateAndCancelExtensionRequest];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v23);
  }

  uint64_t v26 = *(void *)(a1 + 32);
  v27 = *(NSObject **)(v26 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__QLExtensionManagerCache__didReceiveNewMatchingExtensionList___block_invoke_2;
  block[3] = &unk_2642F2228;
  block[4] = v26;
  dispatch_sync(v27, block);
}

uint64_t __63__QLExtensionManagerCache__didReceiveNewMatchingExtensionList___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
}

- (BOOL)hasExtensionWithMatchingAttributes:(id)a3
{
  id v3 = [(QLExtensionManagerCache *)self extensionWithMatchingAttributes:a3 allowExtensionsForParentTypes:0 extensionPath:0];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)extensionWithMatchingAttributes:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 extensionPath:(id)a5 firstPartyExtension:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if ([v10 count])
  {
    dispatch_queue_t v12 = [[QLExtensionManagerCacheKey alloc] initWithAttributes:v10 allowParentTypes:v8 wantsFirstPartyExtension:v6 extensionPath:v11];
    uint64_t v31 = 0;
    long long v32 = &v31;
    uint64_t v33 = 0x3032000000;
    long long v34 = __Block_byref_object_copy__0;
    long long v35 = __Block_byref_object_dispose__0;
    id v36 = 0;
    queryCacheQueue = self->_queryCacheQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke;
    block[3] = &unk_2642F2278;
    block[4] = self;
    v14 = v12;
    long long v29 = v14;
    long long v30 = &v31;
    dispatch_sync(queryCacheQueue, block);
    if (v32[5])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v15 = 0;
      }
      else {
        id v15 = (id)v32[5];
      }
    }
    else
    {
      [(QLExtensionManagerCache *)self _synchronouslyWaitForExtensionListIfNeeded];
      accessMatchingExtensionsQueue = self->_accessMatchingExtensionsQueue;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke_2;
      v22[3] = &unk_2642F22A0;
      v22[4] = self;
      BOOL v26 = v6;
      id v23 = v10;
      BOOL v27 = v8;
      id v24 = v11;
      v25 = &v31;
      dispatch_sync(accessMatchingExtensionsQueue, v22);
      uint64_t v17 = self->_queryCacheQueue;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke_3;
      v19[3] = &unk_2642F22C8;
      objc_super v21 = &v31;
      v19[4] = self;
      v20 = v14;
      dispatch_sync(v17, v19);
      id v15 = (id)v32[5];
    }
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

uint64_t __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 72) objectForKey:a1[5]];
  if (v2) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v2);
  }
  return MEMORY[0x270F9A758]();
}

void __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke_2(uint64_t a1)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  v53 = objc_opt_new();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) matchingExtensions];
  uint64_t v56 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
  if (v56)
  {
    uint64_t v55 = *(void *)v71;
    uint64_t v60 = *MEMORY[0x263F07FB0];
    uint64_t v59 = a1;
    while (2)
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v71 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v70 + 1) + 8 * i);
        BOOL v4 = [*(id *)(a1 + 32) matchingExtensions];
        uint64_t v5 = [v4 objectForKeyedSubscript:v3];

        if (!*(unsigned char *)(a1 + 64)
          || ([v5 extension],
              BOOL v6 = objc_claimAutoreleasedReturnValue(),
              int v7 = objc_msgSend(v6, "QL_isAppleExtension"),
              v6,
              v7))
        {
          uint64_t v57 = i;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v58 = [*(id *)(a1 + 40) allKeys];
          uint64_t v8 = [v58 countByEnumeratingWithState:&v66 objects:v75 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v61 = *(void *)v67;
            while (2)
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v67 != v61) {
                  objc_enumerationMutation(v58);
                }
                id v11 = *(void **)(*((void *)&v66 + 1) + 8 * j);
                dispatch_queue_t v12 = [v5 extension];
                v13 = [v12 attributes];
                v14 = [v13 objectForKeyedSubscript:v11];

                id v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:v11];
                if ([v11 isEqualToString:v60])
                {
                  v16 = [v5 extension];
                  uint64_t v17 = [v16 _plugIn];
                  v18 = [v17 containingUrl];
                  v19 = [v18 path];
                  char v20 = [v15 isEqualToString:v19];

                  a1 = v59;
                  if ((v20 & 1) == 0) {
                    goto LABEL_49;
                  }
                }
                else if ([v11 isEqualToString:@"QLSupportedContentTypes"])
                {
                  objc_super v21 = *(void **)(a1 + 32);
                  uint64_t v22 = [v5 extension];
                  LOBYTE(v21) = [v21 _supportedContentTypesFromExtension:v22 matches:v15 allowMatchingWithParentTypes:*(unsigned __int8 *)(a1 + 65)];

                  if ((v21 & 1) == 0) {
                    goto LABEL_49;
                  }
                }
                else if ([v11 isEqualToString:@"kQLExtensionFrameworkPath"])
                {
                  id v23 = [v5 extension];
                  id v24 = [v23 _plugIn];
                  v25 = [v24 url];
                  BOOL v26 = [v25 path];
                  char v27 = [v26 containsString:v15];

                  a1 = v59;
                  if ((v27 & 1) == 0) {
                    goto LABEL_49;
                  }
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
                  {
                    if (([v15 isEqualToString:v14] & 1) == 0) {
                      goto LABEL_49;
                    }
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
                    {
                      uint64_t v28 = [v15 integerValue];
                      if (v28 != [v14 integerValue]) {
                        goto LABEL_49;
                      }
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_49;
                      }
                      if ([v11 isEqualToString:@"QLSupportedContentTypes"])
                      {
                        long long v64 = 0u;
                        long long v65 = 0u;
                        long long v62 = 0u;
                        long long v63 = 0u;
                        id v29 = v14;
                        uint64_t v30 = [v29 countByEnumeratingWithState:&v62 objects:v74 count:16];
                        if (v30)
                        {
                          uint64_t v31 = v30;
                          uint64_t v32 = *(void *)v63;
                          while (2)
                          {
                            for (uint64_t k = 0; k != v31; ++k)
                            {
                              if (*(void *)v63 != v32) {
                                objc_enumerationMutation(v29);
                              }
                              uint64_t v34 = *(void *)(*((void *)&v62 + 1) + 8 * k);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0
                                && ![v15 caseInsensitiveCompare:v34])
                              {

                                a1 = v59;
                                goto LABEL_45;
                              }
                            }
                            uint64_t v31 = [v29 countByEnumeratingWithState:&v62 objects:v74 count:16];
                            if (v31) {
                              continue;
                            }
                            break;
                          }
                        }

                        a1 = v59;
LABEL_49:

                        char v35 = 1;
                        goto LABEL_50;
                      }
                      if (![v14 containsObject:v15]) {
                        goto LABEL_49;
                      }
                    }
                  }
                }
LABEL_45:
              }
              uint64_t v9 = [v58 countByEnumeratingWithState:&v66 objects:v75 count:16];
              if (v9) {
                continue;
              }
              break;
            }
          }
          char v35 = 0;
LABEL_50:

          id v36 = *(void **)(a1 + 48);
          if (v36)
          {
            v37 = [v5 extension];
            v38 = [v37 _extensionBundle];
            uint64_t v39 = [v38 bundlePath];
            char v40 = [v36 isEqualToString:v39];
          }
          else
          {
            char v40 = 1;
          }
          char v41 = v35 | v40 ^ 1;
          uint64_t i = v57;
          if ((v41 & 1) == 0)
          {
            [v53 addObject:v5];
            v42 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QLSupportedContentTypes"];

            if (!v42)
            {

              goto LABEL_59;
            }
          }
        }
      }
      uint64_t v56 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
      if (v56) {
        continue;
      }
      break;
    }
  }
LABEL_59:

  v43 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QLSupportedContentTypes"];

  if (v43)
  {
    v44 = objc_opt_class();
    uint64_t v45 = *(unsigned __int8 *)(a1 + 65);
    v46 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QLSupportedContentTypes"];
    v47 = v53;
    uint64_t v48 = [v44 bestMatchingExtensionsFromSupportingExtensions:v53 includingExtensionsWithSupportingParentTypes:v45 byContentType:v46];
    uint64_t v49 = *(void *)(*(void *)(a1 + 56) + 8);
    v50 = *(void **)(v49 + 40);
    *(void *)(v49 + 40) = v48;
  }
  else
  {
    v47 = v53;
    uint64_t v51 = [v53 firstObject];
    uint64_t v52 = *(void *)(*(void *)(a1 + 56) + 8);
    v46 = *(void **)(v52 + 40);
    *(void *)(v52 + 40) = v51;
  }
}

void __123__QLExtensionManagerCache_extensionWithMatchingAttributes_allowExtensionsForParentTypes_extensionPath_firstPartyExtension___block_invoke_3(void *a1)
{
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v2 = *(void **)(a1[4] + 72);
    objc_msgSend(v2, "setObject:forKeyedSubscript:");
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
    [*(id *)(a1[4] + 72) setObject:v3 forKeyedSubscript:a1[5]];
  }
}

- (id)extensionWithMatchingAttributes:(id)a3 allowExtensionsForParentTypes:(BOOL)a4 extensionPath:(id)a5
{
  return [(QLExtensionManagerCache *)self extensionWithMatchingAttributes:a3 allowExtensionsForParentTypes:a4 extensionPath:a5 firstPartyExtension:0];
}

+ (id)bestMatchingExtensionsFromSupportingExtensions:(id)a3 includingExtensionsWithSupportingParentTypes:(BOOL)a4 byContentType:(id)a5
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v42 = a5;
  uint64_t v8 = [v42 lowercaseString];
  uint64_t v9 = +[QLUTIManager typesForWhichExternalGeneratorsArePreferred];
  uint64_t v10 = [v9 containsObject:v8];

  if (a4)
  {
    id v48 = (id)objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v11 = v7;
    uint64_t v47 = [v11 countByEnumeratingWithState:&v53 objects:v68 count:16];
    if (!v47)
    {

LABEL_42:
      uint64_t v39 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        uint64_t v39 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        long long v62 = @"extension";
        __int16 v63 = 2112;
        id v64 = v42;
        __int16 v65 = 2048;
        id v66 = v48;
        _os_log_impl(&dword_217F31000, v39, OS_LOG_TYPE_INFO, "Retrieving %@ for type %@ from dictionary %p #UTI", buf, 0x20u);
      }
      id v12 = +[QLUTIManager valueInTypeKeyedDictionary:v48 forType:v42];
      goto LABEL_47;
    }
    obuint64_t j = v11;
    id v41 = v7;
    id v12 = 0;
    uint64_t v46 = *(void *)v54;
    int v44 = v10;
    int v45 = v10 ^ 1;
    while (2)
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v54 != v46) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "extension", v41);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v16 = [v15 attributes];
        uint64_t v17 = [v16 objectForKeyedSubscript:@"QLSupportedContentTypes"];

        uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v67 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v50;
          while (2)
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v50 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = [*(id *)(*((void *)&v49 + 1) + 8 * j) lowercaseString];
              if ([v22 isEqualToString:v8])
              {
                id v24 = v14;

                id v12 = v24;
                goto LABEL_22;
              }
              if (!v12)
              {
                id v23 = [v48 objectForKeyedSubscript:v22];
                if (v23)
                {
                }
                else if (objc_msgSend(v15, "QL_isAppleExtension"))
                {
                  [v48 setObject:v14 forKeyedSubscript:v22];
                }
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v67 count:16];
            if (v19) {
              continue;
            }
            break;
          }
LABEL_22:
          LODWORD(v10) = v44;
        }

        v25 = [v12 extension];
        int v26 = objc_msgSend(v25, "QL_isAppleExtension");

        if (((v26 ^ 1 | v10) & 1) == 0)
        {

          goto LABEL_41;
        }
        char v27 = [v12 extension];
        int v28 = objc_msgSend(v27, "QL_isAppleExtension");

        if ((v28 | v45) != 1) {
          goto LABEL_41;
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
      if (v47) {
        continue;
      }
      break;
    }
LABEL_41:

    id v7 = v41;
    if (!v12) {
      goto LABEL_42;
    }
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v48 = v7;
    uint64_t v29 = [v48 countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      id v12 = 0;
      uint64_t v31 = *(void *)v58;
LABEL_30:
      uint64_t v32 = 0;
      uint64_t v33 = v12;
      while (1)
      {
        if (*(void *)v58 != v31) {
          objc_enumerationMutation(v48);
        }
        id v12 = *(id *)(*((void *)&v57 + 1) + 8 * v32);

        uint64_t v34 = [v12 extension];
        uint64_t v35 = v10;
        char v36 = v10 & ~objc_msgSend(v34, "QL_isAppleExtension");

        if (v36) {
          break;
        }
        v37 = [v12 extension];
        int v38 = objc_msgSend(v37, "QL_isAppleExtension");

        if ((v38 ^ 1 | v35) != 1) {
          break;
        }
        uint64_t v10 = v35;
        ++v32;
        uint64_t v33 = v12;
        if (v30 == v32)
        {
          uint64_t v30 = [v48 countByEnumeratingWithState:&v57 objects:v69 count:16];
          if (v30) {
            goto LABEL_30;
          }
          break;
        }
      }
    }
    else
    {
      id v12 = 0;
    }
  }
LABEL_47:

  return v12;
}

- (BOOL)_supportedContentTypesFromExtension:(id)a3 matches:(id)a4 allowMatchingWithParentTypes:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x263F1D920] typeWithIdentifier:v8];
  if (objc_msgSend(v7, "QL_isAppleExtension") && v5)
  {
    uint64_t v10 = [v7 attributes];
    id v11 = [v10 objectForKeyedSubscript:@"QLSupportedContentTypes"];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v33 = v7;
      uint64_t v15 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v18 = [MEMORY[0x263F1D920] typeWithIdentifier:v17];
          if (v18)
          {
            if ([v9 conformsToType:v18]) {
              goto LABEL_31;
            }
          }
          else
          {
            uint64_t v19 = _log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              uint64_t v31 = [v33 identifier];
              *(_DWORD *)buf = 138412546;
              int v44 = v17;
              __int16 v45 = 2112;
              uint64_t v46 = v31;
              _os_log_error_impl(&dword_217F31000, v19, OS_LOG_TYPE_ERROR, "Invalid content type identifier %@ specified in extension %@", buf, 0x16u);
            }
            if (![v8 compare:v17 options:1])
            {
LABEL_31:

              BOOL v20 = 1;
              goto LABEL_32;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      BOOL v20 = 0;
LABEL_32:
      uint64_t v22 = v12;
LABEL_33:
      id v7 = v33;
    }
    else
    {
      BOOL v20 = 0;
      uint64_t v22 = v12;
    }
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    objc_super v21 = [v7 attributes];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"QLSupportedContentTypes"];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v33 = v7;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v22);
          }
          char v27 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          int v28 = [MEMORY[0x263F1D920] typeWithIdentifier:v27];
          id v12 = v28;
          if (v28)
          {
            if ([v28 isEqual:v9])
            {
              BOOL v20 = 1;
              goto LABEL_33;
            }
          }
          else
          {
            uint64_t v29 = _log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              uint64_t v32 = [v33 identifier];
              *(_DWORD *)buf = 138412546;
              int v44 = v27;
              __int16 v45 = 2112;
              uint64_t v46 = v32;
              _os_log_error_impl(&dword_217F31000, v29, OS_LOG_TYPE_ERROR, "Invalid content type identifier %@ specified in extension %@", buf, 0x16u);
            }
            BOOL v20 = 1;
            if (![v27 compare:v8 options:1]) {
              goto LABEL_33;
            }
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v24);
      BOOL v20 = 0;
      id v7 = v33;
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  return v20;
}

- (void)_synchronouslyWaitForExtensionListIfNeeded
{
  if (!self->_matchingExtensions && self->_isMatchingExtensions)
  {
    matchingAttributes = self->_matchingAttributes;
    uint64_t v5 = 0;
    BOOL v4 = [MEMORY[0x263F08800] extensionsWithMatchingAttributes:matchingAttributes error:&v5];
    [(QLExtensionManagerCache *)self _didReceiveNewMatchingExtensionList:v4];
  }
}

- (void)dealloc
{
  [(QLExtensionManagerCache *)self endMatchingExtensions];
  v3.receiver = self;
  v3.super_class = (Class)QLExtensionManagerCache;
  [(QLExtensionManagerCache *)&v3 dealloc];
}

- (NSDictionary)matchingAttributes
{
  return self->_matchingAttributes;
}

- (void)setMatchingAttributes:(id)a3
{
}

- (id)matchingContext
{
  return self->_matchingContext;
}

- (void)setMatchingContext:(id)a3
{
}

- (NSMutableDictionary)matchingExtensions
{
  return self->_matchingExtensions;
}

- (void)setMatchingExtensions:(id)a3
{
}

- (NSMapTable)qlExtensions
{
  return self->_qlExtensions;
}

- (void)setQlExtensions:(id)a3
{
}

- (NSMutableDictionary)queryCache
{
  return self->_queryCache;
}

- (void)setQueryCache:(id)a3
{
}

- (BOOL)isMatchingExtensions
{
  return self->_isMatchingExtensions;
}

- (void)setIsMatchingExtensions:(BOOL)a3
{
  self->_isMatchingExtensions = a3;
}

- (OS_dispatch_semaphore)waitForExtensionsSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWaitForExtensionsSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForExtensionsSemaphore, 0);
  objc_storeStrong((id *)&self->_queryCache, 0);
  objc_storeStrong((id *)&self->_qlExtensions, 0);
  objc_storeStrong((id *)&self->_matchingExtensions, 0);
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_matchingAttributes, 0);
  objc_storeStrong((id *)&self->_queryCacheQueue, 0);
  objc_storeStrong((id *)&self->_waitForExtensionListQueue, 0);
  objc_storeStrong((id *)&self->_accessMatchingExtensionsQueue, 0);
}

@end