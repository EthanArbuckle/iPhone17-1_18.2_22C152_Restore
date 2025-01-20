@interface SUUISoftwareLibraryInterface
- (BOOL)performActionForLibraryItem:(id)a3;
- (id)exposedPlatformItemKinds;
- (id)stateForLibraryItem:(id)a3;
- (void)enumerateStatesForLibraryItems:(id)a3 usingBlock:(id)a4;
@end

@implementation SUUISoftwareLibraryInterface

- (void)enumerateStatesForLibraryItems:(id)a3 usingBlock:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v27 + 1) + 8 * v12) storeItemIdentifier];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v15 = objc_alloc_init(MEMORY[0x263F7B330]);
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __74__SUUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke;
  v24[3] = &unk_265402D10;
  id v17 = v14;
  id v25 = v17;
  dispatch_semaphore_t v26 = v16;
  v18 = v16;
  [v15 getLibraryItemsForITunesStoreItemIdentifiers:v7 completionBlock:v24];
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __74__SUUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke_2;
  v21[3] = &unk_265402D38;
  id v22 = v17;
  id v23 = v6;
  id v19 = v6;
  id v20 = v17;
  [v8 enumerateObjectsUsingBlock:v21];
}

void __74__SUUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
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
    uint64_t v10 = *MEMORY[0x263F7BCA0];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x25A2A9B80]();
        id v14 = [v12 valueForProperty:v10];
        if (v14 && ([v12 isPlaceholder] & 1) == 0)
        {
          id v15 = [[SUUILibraryItemState alloc] initWithApplication:v12];
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

void __74__SUUISoftwareLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = (void *)MEMORY[0x25A2A9B80]();
  v4 = *(void **)(a1 + 32);
  id v5 = [v7 storeItemIdentifier];
  id v6 = [v4 objectForKey:v5];

  if (!v6) {
    id v6 = objc_alloc_init(SUUILibraryItemState);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)exposedPlatformItemKinds
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"iosSoftware"];
}

- (BOOL)performActionForLibraryItem:(id)a3
{
  v3 = [(SUUISoftwareLibraryInterface *)self stateForLibraryItem:a3];
  v4 = [v3 bundleIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    SUUIMetricsLaunchApplicationWithIdentifier((uint64_t)v6, 0);
    CFRelease(v6);
  }

  return v5 != 0;
}

- (id)stateForLibraryItem:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__20;
  long long v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  id v4 = objc_alloc_init(MEMORY[0x263F7B330]);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [v3 storeItemIdentifier];
  v20[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__SUUISoftwareLibraryInterface_stateForLibraryItem___block_invoke;
  v11[3] = &unk_265402D60;
  v13 = &v14;
  uint64_t v8 = v5;
  uint64_t v12 = v8;
  [v4 getLibraryItemsForITunesStoreItemIdentifiers:v7 completionBlock:v11];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __52__SUUISoftwareLibraryInterface_stateForLibraryItem___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 firstObject];
  if (v6 && ([v6 isPlaceholder] & 1) == 0)
  {
    id v3 = [[SUUILibraryItemState alloc] initWithApplication:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_semaphore_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end