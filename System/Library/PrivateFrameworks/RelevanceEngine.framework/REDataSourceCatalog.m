@interface REDataSourceCatalog
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersionForDataSourceWithIdentifier:(SEL)a3;
- (BOOL)imageForDataSourceWithIdentifier:(id)a3 completion:(id)a4;
- (BOOL)requiresLocationInUseAssertonForDataSourceWithIdentifier:(id)a3;
- (BOOL)wantsApplicationPrewarmForDataSourceWithIdentifier:(id)a3;
- (NSSet)dataSourceIdentifiers;
- (NSSet)unrestrictedDataSourceIdentifiers;
- (REDataSourceCatalog)initWithDataSourceManager:(id)a3;
- (id)applicationIdentifierForDataSourceWithIdentifier:(id)a3;
- (id)localAndRemoteAppIdentifiersForDataSourceIdentifiers:(id)a3;
- (id)localizedNameForApplicationWithIdentifier:(id)a3;
- (id)localizedNameForDataSourceWithIdentifier:(id)a3;
- (void)_applicationsStatesDidChange;
- (void)dealloc;
- (void)donatedAppIdentifiersWithCompletion:(id)a3;
- (void)enumerateDataSources:(id)a3;
- (void)imageForApplicationWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation REDataSourceCatalog

- (REDataSourceCatalog)initWithDataSourceManager:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)REDataSourceCatalog;
  v6 = [(REDataSourceCatalog *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    iconCache = v7->_iconCache;
    v7->_iconCache = v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    localizedNameCache = v7->_localizedNameCache;
    v7->_localizedNameCache = (NSMutableDictionary *)v10;

    uint64_t v12 = [v5 queue];
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[RESingleton sharedInstance];
    appIconCache = v7->_appIconCache;
    v7->_appIconCache = (REAppIconCache *)v14;

    uint64_t v16 = +[RESingleton sharedInstance];
    appNameCache = v7->_appNameCache;
    v7->_appNameCache = (REAppNameCache *)v16;

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v7 selector:sel__applicationsStatesDidChange name:@"REApplicationStateDidChange" object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)REDataSourceCatalog;
  [(REDataSourceCatalog *)&v4 dealloc];
}

- (void)_applicationsStatesDidChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__REDataSourceCatalog__applicationsStatesDidChange__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __51__REDataSourceCatalog__applicationsStatesDidChange__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 removeAllObjects];
}

- (NSSet)dataSourceIdentifiers
{
  return [(REDataSourceManager *)self->_dataSourceManager availableDataSourceIdentifiers];
}

- (NSSet)unrestrictedDataSourceIdentifiers
{
  return [(REDataSourceManager *)self->_dataSourceManager unrestirctedDataSourceIdentifiers];
}

- (void)enumerateDataSources:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v4 = (void (**)(id, void))a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(REDataSourceManager *)self->_dataSourceManager currentDataSources];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)donatedAppIdentifiersWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_super v4 = [MEMORY[0x263EFF9C0] set];
    id v5 = +[RESingleton sharedInstance];
    uint64_t v6 = [v5 queryForAllRelevantShortcuts];

    uint64_t v7 = +[RESingleton sharedInstance];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__REDataSourceCatalog_donatedAppIdentifiersWithCompletion___block_invoke;
    v13[3] = &unk_2644BEFB8;
    id v8 = v4;
    id v14 = v8;
    [v7 executeQuerySynchronouslyWithBatching:v6 completion:v13];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__REDataSourceCatalog_donatedAppIdentifiersWithCompletion___block_invoke_2;
    block[3] = &unk_2644BCCD0;
    id v11 = v8;
    id v12 = v3;
    id v9 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __59__REDataSourceCatalog_donatedAppIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = v3;
  id v5 = (void *)MEMORY[0x263EFFA68];
  if (v3) {
    id v5 = v3;
  }
  id v6 = v5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 bundleIdentifier];

        if (v12)
        {
          long long v13 = *(void **)(a1 + 32);
          id v14 = [v11 bundleIdentifier];
          [v13 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

void __59__REDataSourceCatalog_donatedAppIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)localAndRemoteAppIdentifiersForDataSourceIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[objc_class applicationBundleIdentifier](-[REDataSourceManager classForDataSourceIdentifier:](self->_dataSourceManager, "classForDataSourceIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15), "applicationBundleIdentifier");
        if (v11)
        {
          [v5 addObject:v11];
          id v12 = RELocalApplicationIdentifierForRemoteApplication(v11);
          if (v12) {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  long long v13 = (void *)[v5 copy];
  return v13;
}

- (void)imageForApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    if (v6)
    {
      uint64_t v9 = +[RESingleton sharedInstance];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __68__REDataSourceCatalog_imageForApplicationWithIdentifier_completion___block_invoke_2;
      v12[3] = &unk_2644BEFE0;
      long long v10 = &v13;
      id v13 = v8;
      [v9 iconForApplicationWithIdentifier:v6 completion:v12];
    }
    else
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__REDataSourceCatalog_imageForApplicationWithIdentifier_completion___block_invoke;
      block[3] = &unk_2644BCBC0;
      long long v10 = &v15;
      id v15 = v7;
      dispatch_async(queue, block);
    }
  }
}

uint64_t __68__REDataSourceCatalog_imageForApplicationWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__REDataSourceCatalog_imageForApplicationWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)imageForDataSourceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void))v7;
  if (v7)
  {
    if (!v6)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke;
      block[3] = &unk_2644BCBC0;
      id v25 = v7;
      dispatch_async(queue, block);
      BOOL v11 = 0;
      id v10 = v25;
      goto LABEL_15;
    }
    uint64_t v9 = [(NSCache *)self->_iconCache objectForKey:v6];
    if (v9)
    {
      id v10 = (id)v9;
LABEL_5:
      ((void (**)(void, id))v8)[2](v8, v10);
      BOOL v11 = 1;
LABEL_15:

      goto LABEL_16;
    }
    id v13 = [(REDataSourceManager *)self->_dataSourceManager classForDataSourceIdentifier:v6];
    if (v13)
    {
      id v14 = v13;
      id v10 = [(objc_class *)v13 overrideDataSourceImage];
      if (v10)
      {
        [(NSCache *)self->_iconCache setObject:v10 forKey:v6];
        goto LABEL_5;
      }
      id v15 = [(objc_class *)v14 applicationBundleIdentifier];
      if (!v15)
      {
        long long v18 = self->_queue;
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke_2;
        v22[3] = &unk_2644BCBC0;
        v23 = v8;
        dispatch_async(v18, v22);
        long long v16 = v23;
        goto LABEL_14;
      }
    }
    else
    {
      id v15 = v6;
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke_3;
    v19[3] = &unk_2644BD240;
    v19[4] = self;
    id v20 = v15;
    v21 = v8;
    id v10 = v15;
    [(REDataSourceCatalog *)self imageForApplicationWithIdentifier:v10 completion:v19];

    long long v16 = v20;
LABEL_14:

    BOOL v11 = 0;
    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

uint64_t __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__REDataSourceCatalog_imageForDataSourceWithIdentifier_completion___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    [*(id *)(a1[4] + 16) setObject:v3 forKey:a1[5]];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)localizedNameForApplicationWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  id v5 = [(REAppNameCache *)self->_appNameCache localizedNameForApplicationWithIdentifier:v4];
  if (v5) {
    goto LABEL_8;
  }
  if (_fetchedInternalBuildOnceToken_2 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_2, &__block_literal_global_39);
  }
  if (_isInternalDevice_2) {
    id v5 = v4;
  }
  else {
LABEL_7:
  }
    id v5 = 0;
LABEL_8:

  return v5;
}

uint64_t __65__REDataSourceCatalog_localizedNameForApplicationWithIdentifier___block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_2 = result;
  return result;
}

- (id)localizedNameForDataSourceWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_localizedNameCache objectForKeyedSubscript:v4];
    if (v5) {
      goto LABEL_7;
    }
    id v6 = [(REDataSourceManager *)self->_dataSourceManager classForDataSourceIdentifier:v4];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = [(objc_class *)v6 overrideLocalizedDataSourceName];
      if (v8)
      {
        id v5 = (void *)v8;
        [(NSMutableDictionary *)self->_localizedNameCache setObject:v8 forKeyedSubscript:v4];
      }
      else
      {
        id v10 = [(objc_class *)v7 applicationBundleIdentifier];
        if (v10)
        {
          id v5 = [(REDataSourceCatalog *)self localizedNameForApplicationWithIdentifier:v10];
          [(NSMutableDictionary *)self->_localizedNameCache setObject:v5 forKeyedSubscript:v10];
        }
        else
        {
          id v5 = 0;
        }
      }
      goto LABEL_7;
    }
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersionForDataSourceWithIdentifier:(SEL)a3
{
  uint64_t result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)self->_dataSourceManager;
  if (result) {
    return ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)[($9FE6E10C8CE45DBC9A88DFDEA39A390D *)result minimumSupportedSystemVersionForDataSourceWithIdentifier:a4];
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- (id)applicationIdentifierForDataSourceWithIdentifier:(id)a3
{
  id v3 = [(REDataSourceManager *)self->_dataSourceManager classForDataSourceIdentifier:a3];
  return (id)[(objc_class *)v3 applicationBundleIdentifier];
}

- (BOOL)wantsApplicationPrewarmForDataSourceWithIdentifier:(id)a3
{
  dataSourceManager = self->_dataSourceManager;
  id v5 = a3;
  id v6 = [(REDataSourceManager *)dataSourceManager classForDataSourceIdentifier:v5];
  id v7 = [(REDataSourceCatalog *)self applicationIdentifierForDataSourceWithIdentifier:v5];

  if (v7) {
    char v8 = [(objc_class *)v6 wantsAppPrewarm];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)requiresLocationInUseAssertonForDataSourceWithIdentifier:(id)a3
{
  id v3 = [(REDataSourceManager *)self->_dataSourceManager classForDataSourceIdentifier:a3];
  return [(objc_class *)v3 wantsLocationInUseAsserton];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appNameCache, 0);
  objc_storeStrong((id *)&self->_appIconCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localizedNameCache, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

@end