@interface WPStorageAccessPromptQuirksData
- (NSArray)quirks;
- (WPStorageAccessPromptQuirksData)initWithQuirks:(id)a3;
- (id)description;
@end

@implementation WPStorageAccessPromptQuirksData

- (NSArray)quirks
{
  return self->_quirks;
}

- (WPStorageAccessPromptQuirksData)initWithQuirks:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WPStorageAccessPromptQuirksData;
  v14 = [(WPStorageAccessPromptQuirksData *)&v29 init];
  if (v14)
  {
    v12 = v4;
    uint64_t v26 = 0;
    v27[0] = &v26;
    v27[1] = 0x2020000000;
    int v28 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(_DWORD *)(v27[0] + 24) = 0x7FFFFFFF;
      id v4 = [MEMORY[0x263EFF8C0] array];
    }
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count", v4));
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = v13;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(id *)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15[0] = MEMORY[0x263EF8330];
            v15[1] = 3221225472;
            v15[2] = __50__WPStorageAccessPromptQuirksData_initWithQuirks___block_invoke;
            v15[3] = &unk_265586208;
            v15[4] = &v26;
            v15[5] = &v20;
            [v8 enumerateKeysAndObjectsUsingBlock:v15];
          }
          else
          {
            ++*(_DWORD *)(v27[0] + 24);
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v30 count:16];
      }
      while (v5);
    }

    objc_storeStrong((id *)&v14->_quirks, (id)v21[5]);
    if (*(_DWORD *)(v27[0] + 24))
    {
      v9 = WPOSLogServer();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[WPStorageAccessPromptQuirksData initWithQuirks:]((uint64_t)v27, v9);
      }
    }
    v10 = v14;
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

  return v14;
}

- (void).cxx_destruct
{
}

void __50__WPStorageAccessPromptQuirksData_initWithQuirks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v6 = [[WPStorageAccessPromptQuirk alloc] initWithName:v7 withDomainData:v5];
    if ([(WPStorageAccessPromptQuirk *)v6 isValid]) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
    }
    else {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
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
  _os_log_error_impl(&dword_2617B2000, a2, OS_LOG_TYPE_ERROR, "WPStorageAccessPromptQuirksData initWithQuirks: skipped %d entries due to malformed entries", (uint8_t *)v3, 8u);
}

@end