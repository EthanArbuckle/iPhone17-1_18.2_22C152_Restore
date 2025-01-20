@interface STKTelephonySelectionListItemsProvider
- (STKTelephonySelectionListItemsProvider)initWithTelephonyClient:(id)a3;
- (id)selectionListItemsForContext:(id)a3 options:(id)a4;
- (void)dealloc;
@end

@implementation STKTelephonySelectionListItemsProvider

- (STKTelephonySelectionListItemsProvider)initWithTelephonyClient:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"STKTelephonySelectionListItemsProvider.m", 15, @"Invalid parameter not satisfying: %@", @"telephonyClient" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)STKTelephonySelectionListItemsProvider;
  v7 = [(STKTelephonySelectionListItemsProvider *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_telephonyClient, a3);
  }

  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)STKTelephonySelectionListItemsProvider;
  [(STKTelephonySelectionListItemsProvider *)&v2 dealloc];
}

- (id)selectionListItemsForContext:(id)a3 options:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [a4 objectForKeyedSubscript:@"STKCTListItems"];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v25 = v7;
      id v26 = v6;
      uint64_t v12 = *(void *)v29;
      uint64_t v13 = *MEMORY[0x263F032C0];
      uint64_t v14 = *MEMORY[0x263F02D40];
      do
      {
        v15 = v9;
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v15);
          }
          v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v18 = objc_alloc(MEMORY[0x263F02CD0]);
          v19 = [v17 objectForKeyedSubscript:v13];
          v20 = [v17 objectForKeyedSubscript:v14];
          v21 = (void *)[v18 initWithText:v19 selected:v20 != 0];

          [v8 addObject:v21];
        }
        id v9 = v15;
        uint64_t v11 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
      v7 = v25;
      id v6 = v26;
    }
  }
  else
  {
    telephonyClient = self->_telephonyClient;
    id v27 = 0;
    id v23 = (id)[(CoreTelephonyClient *)telephonyClient getSIMToolkitListItems:v6 items:&v27];
    id v9 = v27;
    id v8 = [v9 itemList];
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end