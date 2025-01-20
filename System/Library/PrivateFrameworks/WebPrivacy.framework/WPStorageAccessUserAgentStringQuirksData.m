@interface WPStorageAccessUserAgentStringQuirksData
- (NSArray)quirks;
- (WPStorageAccessUserAgentStringQuirksData)initWithQuirks:(id)a3;
- (id)description;
@end

@implementation WPStorageAccessUserAgentStringQuirksData

- (NSArray)quirks
{
  return self->_quirks;
}

- (WPStorageAccessUserAgentStringQuirksData)initWithQuirks:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WPStorageAccessUserAgentStringQuirksData;
  v13 = [(WPStorageAccessUserAgentStringQuirksData *)&v28 init];
  if (v13)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__1;
    v26 = __Block_byref_object_dispose__1;
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = 0;
    v20[0] = &v19;
    v20[1] = 0x2020000000;
    int v21 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = v12;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v16;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(id *)(*((void *)&v15 + 1) + 8 * v7);
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __59__WPStorageAccessUserAgentStringQuirksData_initWithQuirks___block_invoke;
          v14[3] = &unk_265586230;
          v14[4] = &v19;
          v14[5] = &v22;
          [v8 enumerateKeysAndObjectsUsingBlock:v14];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v29 count:16];
      }
      while (v5);
    }

    objc_storeStrong((id *)&v13->_quirks, (id)v23[5]);
    if (*(_DWORD *)(v20[0] + 24))
    {
      v9 = WPOSLogServer();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WPStorageAccessUserAgentStringQuirksData initWithQuirks:]((uint64_t)v20, v9);
      }
    }
    v10 = v13;
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v22, 8);
  }
  return v13;
}

- (void).cxx_destruct
{
}

void __59__WPStorageAccessUserAgentStringQuirksData_initWithQuirks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v6 = [[WPStorageAccessUserAgentStringQuirk alloc] initWithDomain:v7 withUserAgentString:v5];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
  else
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (id)description
{
  return [(NSArray *)self->_quirks description];
}

- (void)initWithQuirks:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(*(void *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_2617B2000, a2, OS_LOG_TYPE_ERROR, "WPStorageAccessUserAgentStringQuirksData initWithQuirks: skipped %d entries due to unexpected class types", (uint8_t *)v3, 8u);
}

@end