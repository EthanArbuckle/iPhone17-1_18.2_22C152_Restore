@interface NTKFaceBundleLoader
+ (id)faceBundleLoaderWithDirectories:(id)a3;
- (NTKFaceBundleLoader)initWithURLs:(id)a3;
- (id)loadFaceBundleWithIdentifier:(id)a3;
- (id)loadLegacyFaceBundleForStyle:(int64_t)a3;
- (void)_enumerateBundles:(id)a3;
- (void)_loadClassesUsingBlock:(id)a3;
- (void)enumerateFaceBundleClassesIgnoringCache:(BOOL)a3 withBlock:(id)a4;
@end

@implementation NTKFaceBundleLoader

- (id)loadFaceBundleWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__27;
  v15 = __Block_byref_object_dispose__27;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__NTKFaceBundleLoader_loadFaceBundleWithIdentifier___block_invoke;
  v8[3] = &unk_1E62C42B0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(NTKFaceBundleLoader *)self _enumerateBundles:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __41__NTKFaceBundleLoader__enumerateBundles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLoaded]) {
    goto LABEL_4;
  }
  id v4 = [v3 objectForInfoDictionaryKey:@"NSPrincipalClass"];
  if (v4)
  {

LABEL_4:
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
    uint64_t v6 = 1;
    goto LABEL_7;
  }
  v8 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __41__NTKFaceBundleLoader__enumerateBundles___block_invoke_cold_1(v3, v8);
  }

  uint64_t v6 = 0;
LABEL_7:

  return v6;
}

void __52__NTKFaceBundleLoader_loadFaceBundleWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];
  if ([v4 length])
  {
    v29 = [v3 infoDictionary];
    v28 = [v29 objectForKey:@"NTKFaceBundle"];
    uint64_t v5 = [v28 objectForKey:@"AdditionalIdentifiers"];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
    [v6 addObject:v4];
    v7 = [&unk_1F16E88B8 objectForKey:*(void *)(a1 + 32)];
    if ([v7 count]) {
      [v6 addObjectsFromArray:v7];
    }
    v27 = v7;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v6 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v10);
    }

    if ([v6 containsObject:*(void *)(a1 + 32)])
    {
      v25 = v4;
      [v3 load];
      id v26 = v3;
      NTKFaceBundleClassesFromBundle(v3);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v31;
        while (2)
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v30 + 1) + 8 * j);
            v20 = [v19 identifier];
            int v21 = [v20 isEqual:*(void *)(a1 + 32)];

            if (v21)
            {
              id v22 = objc_alloc_init((Class)v19);
              uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
              v24 = *(void **)(v23 + 40);
              *(void *)(v23 + 40) = v22;

              goto LABEL_24;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_24:

      id v4 = v25;
      id v3 = v26;
    }
  }
}

- (void)_enumerateBundles:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  kdebug_trace();
  os_unfair_lock_t lock = &self->_loaderLock;
  os_unfair_lock_lock(&self->_loaderLock);
  uint64_t v5 = self->_loader;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = self->_urls;
  uint64_t v6 = [(NSSet *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v9 = *MEMORY[0x1E4F1C870];
    do
    {
      uint64_t v10 = 0;
      uint64_t v24 = v7;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1C1875BE0]();
        v12 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v35 = v11;
          _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "Looking for face bundles in %@…", buf, 0xCu);
        }

        uint64_t v38 = v9;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
        id v29 = 0;
        id v14 = [v11 resourceValuesForKeys:v13 error:&v29];
        id v15 = v29;

        uint64_t v16 = [v14 objectForKey:v9];
        uint64_t v17 = v16;
        if (v16)
        {
          if (([v16 BOOLValue] & 1) == 0) {
            [(NTKBundleLoader *)v5 resetCacheForDirectoryURL:v11];
          }
        }
        else
        {
          uint64_t v18 = v9;
          uint64_t v19 = v8;
          v20 = v5;
          id v21 = v4;
          id v22 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            long long v35 = v11;
            __int16 v36 = 2112;
            id v37 = v15;
            _os_log_error_impl(&dword_1BC5A9000, v22, OS_LOG_TYPE_ERROR, "Error getting read status for URL %@ - %@", buf, 0x16u);
          }

          id v4 = v21;
          uint64_t v5 = v20;
          uint64_t v8 = v19;
          uint64_t v9 = v18;
          uint64_t v7 = v24;
        }
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __41__NTKFaceBundleLoader__enumerateBundles___block_invoke;
        v27[3] = &unk_1E62C4288;
        id v28 = v4;
        [(NTKBundleLoader *)v5 enumerateBundlesFromDirectoryURL:v11 enumerator:v27];

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSSet *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(lock);
  kdebug_trace();
}

void __46__NTKFaceBundleLoader__loadClassesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 load];
  id v4 = NTKFaceBundleClassesFromBundle(v3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __73__NTKFaceBundleLoader_enumerateFaceBundleClassesIgnoringCache_withBlock___block_invoke(uint64_t a1, Class aClass)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromClass(aClass);
  uint64_t v5 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Loading bundle of class %@…", (uint8_t *)&v7, 0xCu);
  }

  if ([(objc_class *)aClass isSubclassOfClass:objc_opt_class()])
  {
    if ([*(id *)(a1 + 32) containsObject:aClass])
    {
      uint64_t v6 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        uint64_t v8 = v4;
        _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Skipping %@ - Already loaded", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      [*(id *)(a1 + 32) addObject:aClass];
      uint64_t v6 = objc_alloc_init(aClass);
      if (v6) {
        [*(id *)(a1 + 40) addObject:v6];
      }
    }
  }
  else
  {
    uint64_t v6 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __73__NTKFaceBundleLoader_enumerateFaceBundleClassesIgnoringCache_withBlock___block_invoke_cold_1((uint64_t)v4, v6);
    }
  }
}

+ (id)faceBundleLoaderWithDirectories:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKFaceBundleLoader alloc] initWithURLs:v3];

  return v4;
}

- (NTKFaceBundleLoader)initWithURLs:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKFaceBundleLoader;
  uint64_t v5 = [(NTKFaceBundleLoader *)&v12 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_cacheLock._os_unfair_lock_opaque = 0;
    int v7 = objc_alloc_init(NTKBundleLoader);
    loader = v6->_loader;
    v6->_loader = v7;

    v6->_loaderLock._os_unfair_lock_opaque = 0;
    uint64_t v9 = [v4 copy];
    urls = v6->_urls;
    v6->_urls = (NSSet *)v9;
  }
  return v6;
}

- (void)enumerateFaceBundleClassesIgnoringCache:(BOOL)a3 withBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void))a4;
  if (v6)
  {
    p_cacheLock = &self->_cacheLock;
    os_unfair_lock_lock(&self->_cacheLock);
    p_cachedFaceBundles = &self->_cachedFaceBundles;
    cachedFaceBundles = self->_cachedFaceBundles;
    if (cachedFaceBundles) {
      BOOL v10 = !v4;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      id v15 = cachedFaceBundles;
    }
    else
    {
      long long v11 = [MEMORY[0x1E4F1CA80] set];
      objc_super v12 = [MEMORY[0x1E4F1CA48] array];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __73__NTKFaceBundleLoader_enumerateFaceBundleClassesIgnoringCache_withBlock___block_invoke;
      v25[3] = &unk_1E62C4A78;
      id v26 = v11;
      id v27 = v12;
      id v13 = v12;
      id v14 = v11;
      [(NTKFaceBundleLoader *)self _loadClassesUsingBlock:v25];
      id v15 = (NSArray *)[v13 copy];
      objc_storeStrong((id *)p_cachedFaceBundles, v15);
    }
    os_unfair_lock_unlock(p_cacheLock);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v16 = v15;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          v6[2](v6, *(void *)(*((void *)&v21 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v28 count:16];
      }
      while (v18);
    }
  }
}

- (void)_loadClassesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__NTKFaceBundleLoader__loadClassesUsingBlock___block_invoke;
  v6[3] = &unk_1E62C4A28;
  id v7 = v4;
  id v5 = v4;
  [(NTKFaceBundleLoader *)self _enumerateBundles:v6];
}

- (id)loadLegacyFaceBundleForStyle:(int64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__27;
  BOOL v10 = __Block_byref_object_dispose__27;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__NTKFaceBundleLoader_loadLegacyFaceBundleForStyle___block_invoke;
  v5[3] = &unk_1E62C4A50;
  v5[4] = &v6;
  v5[5] = a3;
  [(NTKFaceBundleLoader *)self _enumerateBundles:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__NTKFaceBundleLoader_loadLegacyFaceBundleForStyle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v30 = [v2 infoDictionary];
  uint64_t v29 = [v30 objectForKey:@"NTKFaceBundle"];
  id v3 = [v29 objectForKey:@"LegacyStyles"];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = NTKFaceStyleForString(v10);
          if (v11 != -1)
          {
            objc_super v12 = [NSNumber numberWithInteger:v11];
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v7);
  }

  id v13 = [v2 bundleIdentifier];
  id v14 = [&unk_1F16E88E0 objectForKey:v13];

  if ([v14 count]) {
    [v4 addObjectsFromArray:v14];
  }
  id v15 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  int v16 = [v4 containsObject:v15];

  if (v16)
  {
    id v27 = v14;
    [v2 load];
    id v28 = v2;
    NTKFaceBundleClassesFromBundle(v2);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v34;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(obj);
          }
          id v21 = objc_alloc_init(*(Class *)(*((void *)&v33 + 1) + 8 * j));
          long long v22 = [v21 legacyFaceStyle];
          long long v23 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
          int v24 = [v22 isEqual:v23];

          if (v24)
          {
            uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 8);
            id v26 = *(void **)(v25 + 40);
            *(void *)(v25 + 40) = v21;

            goto LABEL_24;
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_24:

    id v14 = v27;
    id v2 = v28;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_cachedFaceBundles, 0);
}

void __41__NTKFaceBundleLoader__enumerateBundles___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 bundlePath];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Skipping %@ - No NSPrincipalClass", (uint8_t *)&v4, 0xCu);
}

void __73__NTKFaceBundleLoader_enumerateFaceBundleClassesIgnoringCache_withBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Skipping %@ - Unsupported class", (uint8_t *)&v2, 0xCu);
}

@end