@interface PSGUtilities
+ (id)sharedInstance;
- (id)localizedStringForKey:(id)a3 withLocale:(id)a4;
- (id)localizedStringForKey:(id)a3 withLocale:(id)a4 onlyIfCached:(BOOL)a5 wasCached:(BOOL *)a6;
- (id)prewarmCacheForLocale:(id)a3 usingQueue:(id)a4;
@end

@implementation PSGUtilities

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__PSGUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_1008 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_1008, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_1009;
  return v2;
}

void __30__PSGUtilities_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x2105116B0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1009;
  sharedInstance__pasExprOnceResult_1009 = v1;
}

- (id)localizedStringForKey:(id)a3 withLocale:(id)a4 onlyIfCached:(BOOL)a5 wasCached:(BOOL *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__PSGUtilities_localizedStringForKey_withLocale_onlyIfCached_wasCached___block_invoke;
  block[3] = &unk_263FCFC70;
  block[4] = self;
  if (localizedStringForKey_withLocale_onlyIfCached_wasCached__onceToken != -1) {
    dispatch_once(&localizedStringForKey_withLocale_onlyIfCached_wasCached__onceToken, block);
  }
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1019;
  v36 = __Block_byref_object_dispose__1020;
  id v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v12 = (void *)localizedStringForKey_withLocale_onlyIfCached_wasCached__cache;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __72__PSGUtilities_localizedStringForKey_withLocale_onlyIfCached_wasCached___block_invoke_18;
  v22 = &unk_263FCFC98;
  id v13 = v11;
  id v23 = v13;
  id v14 = v10;
  id v24 = v14;
  v25 = &v28;
  v26 = &v32;
  BOOL v27 = v7;
  [v12 runWithLockAcquired:&v19];
  if (a6) {
    *a6 = *((unsigned char *)v29 + 24);
  }
  v15 = (void *)v33[5];
  if (v15 || v7)
  {
    id v16 = v15;
  }
  else
  {
    objc_msgSend((id)localizedStringForKey_withLocale_onlyIfCached_wasCached__stringsBundle, "localizedStringForKey:value:table:", v14, &stru_26BE112E8, 0, v19, v20, v21, v22, v23);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

uint64_t __72__PSGUtilities_localizedStringForKey_withLocale_onlyIfCached_wasCached___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F61E70]);
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = [v0 initWithGuardedData:v1];
  v3 = (void *)localizedStringForKey_withLocale_onlyIfCached_wasCached__cache;
  localizedStringForKey_withLocale_onlyIfCached_wasCached__cache = v2;

  localizedStringForKey_withLocale_onlyIfCached_wasCached__stringsBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

void __72__PSGUtilities_localizedStringForKey_withLocale_onlyIfCached_wasCached___block_invoke_18(uint64_t a1, void *a2)
{
  v30[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263F61EA8] tupleWithFirst:*(void *)(a1 + 32) second:*(void *)(a1 + 40)];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  if (v5)
  {
    v6 = (void *)v5;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    BOOL v7 = [MEMORY[0x263EFF9D0] null];
    int v8 = [v7 isEqual:v6];

    v9 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v8)
    {
      id v10 = *v9;
      id *v9 = 0;
    }
    else
    {
      objc_storeStrong(v9, v6);
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x2105116B0]();
    if (*(unsigned char *)(a1 + 64))
    {
      v6 = 0;
    }
    else
    {
      context = v11;
      v30[0] = *(void *)(a1 + 32);
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
      id v13 = (void *)MEMORY[0x263F086E0];
      id v14 = [(id)localizedStringForKey_withLocale_onlyIfCached_wasCached__stringsBundle localizations];
      id v23 = (void *)v12;
      v15 = [v13 preferredLocalizationsFromArray:v14 forPreferences:v12];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v26;
        while (2)
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * v20);
            v22 = (void *)MEMORY[0x2105116B0]();
            v6 = [(id)localizedStringForKey_withLocale_onlyIfCached_wasCached__stringsBundle localizedStringForKey:*(void *)(a1 + 40) value:0 table:0 localization:v21];
            if ([v6 isEqual:*(void *)(a1 + 40)])
            {
            }
            else
            {
              if (v6)
              {

                objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v6);
                goto LABEL_19;
              }
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      v6 = [MEMORY[0x263EFF9D0] null];
LABEL_19:
      if ([v3 count] == 32) {
        [v3 removeAllObjects];
      }
      [v3 setObject:v6 forKeyedSubscript:v4];

      id v11 = context;
    }
  }
}

- (id)localizedStringForKey:(id)a3 withLocale:(id)a4
{
  v6 = [(PSGUtilities *)self localizedStringForKey:a3 withLocale:a4 onlyIfCached:0 wasCached:0];
  if (!v6)
  {
    int v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PSGUtilities.m", 59, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  return v6;
}

- (id)prewarmCacheForLocale:(id)a3 usingQueue:(id)a4
{
  id v6 = a3;
  BOOL v7 = a4;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __49__PSGUtilities_prewarmCacheForLocale_usingQueue___block_invoke;
  v17[3] = &unk_263FCFC20;
  v17[4] = self;
  id v8 = v6;
  id v18 = v8;
  v9 = objc_msgSend(&unk_26BE13380, "_pas_filteredArrayWithTest:", v17);
  if ([v9 count])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__PSGUtilities_prewarmCacheForLocale_usingQueue___block_invoke_2;
    block[3] = &unk_263FCFC48;
    id v14 = v9;
    v15 = self;
    id v16 = v8;
    dispatch_block_t v10 = dispatch_block_create((dispatch_block_flags_t)0, block);
    dispatch_async(v7, v10);
    id v11 = (void *)MEMORY[0x210511850](v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

BOOL __49__PSGUtilities_prewarmCacheForLocale_usingQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4 = 0;
  id v2 = (id)[*(id *)(a1 + 32) localizedStringForKey:a2 withLocale:*(void *)(a1 + 40) onlyIfCached:1 wasCached:&v4];
  return v4 == 0;
}

void __49__PSGUtilities_prewarmCacheForLocale_usingQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "localizedStringForKey:withLocale:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), *(void *)(a1 + 48), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

@end