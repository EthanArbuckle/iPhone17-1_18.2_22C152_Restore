@interface NUANFFontLoader
- (BOOL)hasLoaded;
- (FCANFContent)anfContent;
- (FCAsyncOnceOperation)asyncOnceOperation;
- (FCFlintResourceManager)flintResourceManager;
- (NSMutableArray)fontResourcesRegistered;
- (NSMutableArray)fontResourcesToRegister;
- (NUANFFontLoader)initWithANFContent:(id)a3 flintResourceManager:(id)a4 fontRegistration:(id)a5;
- (NUFontRegistration)fontRegistration;
- (id)asyncLoadFontsOnceWithCompletion:(id)a3;
- (id)loadFontsWithCompletion:(id)a3;
- (int64_t)relativePriority;
- (void)registerFontsWithCompletion:(id)a3;
- (void)setRelativePriority:(int64_t)a3;
- (void)unregisterFontsWithCompletion:(id)a3;
@end

@implementation NUANFFontLoader

void __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    if (v6)
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_4;
      v37[3] = &unk_2645FE750;
      v10 = &v38;
      id v38 = v6;
      id v39 = a1[5];
      __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_4((uint64_t)v37);
    }
    else
    {
      v11 = NUSharedLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v44 = [v5 count];
        __int16 v45 = 2114;
        id v46 = v9;
        _os_log_impl(&dword_2221C5000, v11, OS_LOG_TYPE_DEFAULT, "Finished loading %lu fonts for loader %{public}@", buf, 0x16u);
      }

      v12 = [v9 fontResourcesToRegister];
      [v12 removeAllObjects];

      uint64_t v13 = [v5 count];
      if (v13 != [a1[4] count])
      {
        v14 = (void *)[a1[4] mutableCopy];
        uint64_t v15 = [v5 allKeys];
        v16 = (void *)v15;
        if (v15) {
          uint64_t v17 = v15;
        }
        else {
          uint64_t v17 = MEMORY[0x263EFFA68];
        }
        [v14 removeObjectsInArray:v17];

        v18 = NUSharedLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v44 = (uint64_t)v14;
          _os_log_impl(&dword_2221C5000, v18, OS_LOG_TYPE_DEFAULT, "Missing font resources %{public}@", buf, 0xCu);
        }
      }
      v29 = a1;
      v30 = v8;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v19 = a1[4];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            v25 = [v5 objectForKey:v24];
            v26 = [v25 fileURL];

            v27 = NUSharedLog();
            BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            if (v26)
            {
              if (v28)
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v44 = v24;
                _os_log_impl(&dword_2221C5000, v27, OS_LOG_TYPE_DEFAULT, "Tracking font resource to register %{public}@", buf, 0xCu);
              }

              v27 = [v9 fontResourcesToRegister];
              [v27 addObject:v25];
            }
            else if (v28)
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v44 = v24;
              _os_log_impl(&dword_2221C5000, v27, OS_LOG_TYPE_DEFAULT, "Failed to load font resource with identifier %{public}@", buf, 0xCu);
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v21);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_7;
      block[3] = &unk_2645FE158;
      v10 = &v32;
      id v32 = v29[5];
      dispatch_async(MEMORY[0x263EF83A0], block);
      v8 = v30;
      id v6 = 0;
    }
  }
  else
  {
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_3;
    v40[3] = &unk_2645FE158;
    id v41 = a1[5];
    __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_3((uint64_t)v40);
    id v9 = v41;
  }
}

- (NSMutableArray)fontResourcesToRegister
{
  return self->_fontResourcesToRegister;
}

uint64_t __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setRelativePriority:(int64_t)a3
{
  self->_relativePriority = a3;
  id v4 = [(NUANFFontLoader *)self asyncOnceOperation];
  [v4 setRelativePriority:a3];
}

- (id)loadFontsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NUANFFontLoader *)self asyncOnceOperation];
  id v6 = [v5 executeWithCompletionHandler:v4];

  return v6;
}

- (FCAsyncOnceOperation)asyncOnceOperation
{
  return self->_asyncOnceOperation;
}

- (NUANFFontLoader)initWithANFContent:(id)a3 flintResourceManager:(id)a4 fontRegistration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NUANFFontLoader;
  v12 = [(NUANFFontLoader *)&v21 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_anfContent, a3);
    objc_storeStrong((id *)&v13->_flintResourceManager, a4);
    objc_storeStrong((id *)&v13->_fontRegistration, a5);
    uint64_t v14 = objc_opt_new();
    fontResourcesToRegister = v13->_fontResourcesToRegister;
    v13->_fontResourcesToRegister = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    fontResourcesRegistered = v13->_fontResourcesRegistered;
    v13->_fontResourcesRegistered = (NSMutableArray *)v16;

    v13->_relativePriority = 0;
    uint64_t v18 = [objc_alloc(MEMORY[0x263F59390]) initWithTarget:v13 selector:sel_asyncLoadFontsOnceWithCompletion_];
    asyncOnceOperation = v13->_asyncOnceOperation;
    v13->_asyncOnceOperation = (FCAsyncOnceOperation *)v18;
  }
  return v13;
}

- (id)asyncLoadFontsOnceWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NUSharedLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = self;
    _os_log_impl(&dword_2221C5000, v5, OS_LOG_TYPE_DEFAULT, "Loading font resources for loader %{public}@", buf, 0xCu);
  }

  id v6 = [(NUANFFontLoader *)self anfContent];
  v7 = [v6 fontResourceIDs];

  if ([v7 count])
  {
    objc_initWeak((id *)buf, self);
    v8 = [(NUANFFontLoader *)self flintResourceManager];
    int64_t v9 = [(NUANFFontLoader *)self relativePriority];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_2;
    v12[3] = &unk_2645FE778;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = v4;
    id v13 = v7;
    id v10 = [v8 fetchFontResourcesWithIdentifiers:v13 downloadAssets:1 relativePriority:v9 completionBlock:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke;
    v16[3] = &unk_2645FE728;
    v16[4] = self;
    id v17 = v4;
    id v10 = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke((uint64_t)v16);
  }

  return v10;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (FCFlintResourceManager)flintResourceManager
{
  return self->_flintResourceManager;
}

- (FCANFContent)anfContent
{
  return self->_anfContent;
}

- (void)registerFontsWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v20 = (void (**)(void))a3;
  id v4 = NUSharedLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = self;
    _os_log_impl(&dword_2221C5000, v4, OS_LOG_TYPE_DEFAULT, "Registering font resource for loader %{public}@", buf, 0xCu);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(NUANFFontLoader *)self fontResourcesToRegister];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v12 = [v11 fileURL];

        id v13 = NUSharedLog();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            id v15 = [v11 resourceID];
            *(_DWORD *)buf = 138543362;
            v27 = v15;
            _os_log_impl(&dword_2221C5000, v13, OS_LOG_TYPE_DEFAULT, "Registering font resource %{public}@", buf, 0xCu);
          }
          id v13 = [(NUANFFontLoader *)self fontRegistration];
          uint64_t v16 = [v11 fileURL];
          [v13 registerFontWithURL:v16 error:0];
        }
        else
        {
          if (!v14) {
            goto LABEL_15;
          }
          uint64_t v16 = [v11 resourceID];
          *(_DWORD *)buf = 138543362;
          v27 = v16;
          _os_log_impl(&dword_2221C5000, v13, OS_LOG_TYPE_DEFAULT, "Unable to register font resource %{public}@", buf, 0xCu);
        }

LABEL_15:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  id v17 = [(NUANFFontLoader *)self fontResourcesRegistered];
  uint64_t v18 = [(NUANFFontLoader *)self fontResourcesToRegister];
  [v17 addObjectsFromArray:v18];

  id v19 = [(NUANFFontLoader *)self fontResourcesToRegister];
  [v19 removeAllObjects];

  if (v20) {
    v20[2](v20);
  }
}

- (void)unregisterFontsWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v17 = (void (**)(void))a3;
  id v4 = NUSharedLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v24 = self;
    _os_log_impl(&dword_2221C5000, v4, OS_LOG_TYPE_DEFAULT, "Unregistering font resource for loader %{public}@", buf, 0xCu);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(NUANFFontLoader *)self fontResourcesRegistered];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = NUSharedLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v11 resourceID];
          *(_DWORD *)buf = 138543362;
          long long v24 = v13;
          _os_log_impl(&dword_2221C5000, v12, OS_LOG_TYPE_DEFAULT, "Unregistering font resource %{public}@", buf, 0xCu);
        }
        BOOL v14 = [v11 fileURL];

        if (v14)
        {
          id v15 = [(NUANFFontLoader *)self fontRegistration];
          uint64_t v16 = [v11 fileURL];
          [v15 unregisterFontWithURL:v16];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  if (v17) {
    v17[2](v17);
  }
}

uint64_t __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = NUSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_2221C5000, v2, OS_LOG_TYPE_DEFAULT, "No font resources required for loader %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_4;
  block[3] = &unk_2645FE158;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);

  return 0;
}

uint64_t __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = NUSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_2221C5000, v2, OS_LOG_TYPE_DEFAULT, "Font loading failed with error %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __52__NUANFFontLoader_asyncLoadFontsOnceWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (NSMutableArray)fontResourcesRegistered
{
  return self->_fontResourcesRegistered;
}

- (NUFontRegistration)fontRegistration
{
  return self->_fontRegistration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontRegistration, 0);
  objc_storeStrong((id *)&self->_asyncOnceOperation, 0);
  objc_storeStrong((id *)&self->_fontResourcesRegistered, 0);
  objc_storeStrong((id *)&self->_fontResourcesToRegister, 0);
  objc_storeStrong((id *)&self->_flintResourceManager, 0);

  objc_storeStrong((id *)&self->_anfContent, 0);
}

@end