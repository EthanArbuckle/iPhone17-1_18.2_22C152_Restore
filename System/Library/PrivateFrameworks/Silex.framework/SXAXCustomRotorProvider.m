@interface SXAXCustomRotorProvider
- (SXAXCustomRotorProvider)init;
- (id)graphSearchForAvailableCustomRotorsAndUpdateCache;
- (void)initWithRootElement:(void *)a1;
@end

@implementation SXAXCustomRotorProvider

- (SXAXCustomRotorProvider)init
{
  return (SXAXCustomRotorProvider *)-[SXAXCustomRotorProvider initWithRootElement:](self, 0);
}

- (void)initWithRootElement:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SXAXCustomRotorProvider;
    id v4 = objc_msgSendSuper2(&v7, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 2, v3);
      v5 = (void *)a1[1];
      a1[1] = 0;
    }
  }

  return a1;
}

- (id)graphSearchForAvailableCustomRotorsAndUpdateCache
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (a1)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v2 = *(id *)(a1 + 8);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v49 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v48 + 1) + 8 * i) setRotorItems:0];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v4);
    }

    uint64_t v7 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
    uint64_t v35 = a1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v34 = (void *)v7;
    v9 = [WeakRetained _accessibilityLeafDescendantsWithOptions:v7];

    v10 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = v9;
    uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v45;
      v14 = &selRef_resolveComponentLayouts;
      uint64_t v36 = *(void *)v45;
      do
      {
        uint64_t v15 = 0;
        uint64_t v37 = v12;
        do
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v44 + 1) + 8 * v15);
          if ([v16 conformsToProtocol:v14[443]])
          {
            uint64_t v39 = v15;
            id v17 = v16;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            v18 = [v17 supportedCustomRotors];
            uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v52 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v41;
              do
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v41 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  v23 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                  v24 = [v17 itemsForCustomRotor:v23];
                  if ([v24 count])
                  {
                    [v10 addObject:v23];
                    id v25 = objc_alloc(MEMORY[0x263EFF9B0]);
                    v26 = [v23 rotorItems];
                    v27 = (void *)[v25 initWithOrderedSet:v26];

                    v28 = [v24 array];
                    [v27 addObjectsFromArray:v28];

                    v29 = (void *)[v27 copy];
                    [v23 setRotorItems:v29];
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v52 count:16];
              }
              while (v20);
            }

            uint64_t v13 = v36;
            uint64_t v12 = v37;
            v14 = &selRef_resolveComponentLayouts;
            uint64_t v15 = v39;
          }
          ++v15;
        }
        while (v15 != v12);
        uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v12);
    }

    uint64_t v30 = [v10 copy];
    v31 = *(void **)(v35 + 8);
    *(void *)(v35 + 8) = v30;

    id v32 = *(id *)(v35 + 8);
  }
  else
  {
    id v32 = 0;
  }
  return v32;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootElement);
  objc_storeStrong((id *)&self->_cachedAvailableRotors, 0);
}

@end