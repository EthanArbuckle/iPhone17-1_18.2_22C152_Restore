@interface SKUISoftwareLibraryInterface
- (BOOL)performActionForLibraryItem:(id)a3;
- (id)exposedPlatformItemKinds;
- (id)stateForLibraryItem:(id)a3;
- (void)enumerateStatesForLibraryItems:(id)a3 usingBlock:(id)a4;
- (void)exposedPlatformItemKinds;
@end

@implementation SKUISoftwareLibraryInterface

- (void)enumerateStatesForLibraryItems:(id)a3 usingBlock:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUISoftwareLibraryInterface enumerateStatesForLibraryItems:usingBlock:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [*(id *)(*((void *)&v35 + 1) + 8 * v20) storeItemIdentifier];
        [v15 addObject:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v18);
  }

  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v23 = objc_alloc_init(MEMORY[0x1E4FA82E0]);
  dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __74__SKUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke;
  v32[3] = &unk_1E6423CF8;
  id v25 = v22;
  id v33 = v25;
  dispatch_semaphore_t v34 = v24;
  v26 = v24;
  [v23 getLibraryItemsForITunesStoreItemIdentifiers:v15 completionBlock:v32];
  dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __74__SKUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke_2;
  v29[3] = &unk_1E642A070;
  id v30 = v25;
  id v31 = v6;
  id v27 = v6;
  id v28 = v25;
  [v16 enumerateObjectsUsingBlock:v29];
}

void __74__SKUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v16 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = *MEMORY[0x1E4FA8948];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x1C8749310]();
        uint64_t v14 = [v12 valueForProperty:v10];
        if (v14 && ([v12 isPlaceholder] & 1) == 0)
        {
          id v15 = [[SKUILibraryItemState alloc] initWithApplication:v12];
          [*(id *)(a1 + 32) setObject:v15 forKey:v14];
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __74__SKUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = (void *)MEMORY[0x1C8749310]();
  v4 = *(void **)(a1 + 32);
  id v5 = [v7 storeItemIdentifier];
  id v6 = [v4 objectForKey:v5];

  if (!v6) {
    id v6 = objc_alloc_init(SKUILibraryItemState);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)exposedPlatformItemKinds
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUISoftwareLibraryInterface *)v2 exposedPlatformItemKinds];
      }
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:@"iosSoftware"];

  return v10;
}

- (BOOL)performActionForLibraryItem:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISoftwareLibraryInterface performActionForLibraryItem:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t v13 = [(SKUISoftwareLibraryInterface *)self stateForLibraryItem:v4];
  uint64_t v14 = [v13 bundleIdentifier];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
    SKUIMetricsLaunchApplicationWithIdentifier((uint64_t)v16, 0);
    CFRelease(v16);
  }

  return v15 != 0;
}

- (id)stateForLibraryItem:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUISoftwareLibraryInterface stateForLibraryItem:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__91;
  v26 = __Block_byref_object_dispose__91;
  id v27 = 0;
  id v12 = objc_alloc_init(MEMORY[0x1E4FA82E0]);
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v14 = [v3 storeItemIdentifier];
  v28[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__SKUISoftwareLibraryInterface_stateForLibraryItem___block_invoke;
  v19[3] = &unk_1E6425120;
  v21 = &v22;
  id v16 = v13;
  long long v20 = v16;
  [v12 getLibraryItemsForITunesStoreItemIdentifiers:v15 completionBlock:v19];

  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  id v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v17;
}

void __52__SKUISoftwareLibraryInterface_stateForLibraryItem___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 firstObject];
  if (v6 && ([v6 isPlaceholder] & 1) == 0)
  {
    id v3 = [[SKUILibraryItemState alloc] initWithApplication:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)enumerateStatesForLibraryItems:(uint64_t)a3 usingBlock:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)exposedPlatformItemKinds
{
}

- (void)performActionForLibraryItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)stateForLibraryItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end