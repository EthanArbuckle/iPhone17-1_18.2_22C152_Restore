@interface SUUIProductPageProductInfo
- (SUUIProductPageProductInfo)initWithInfoSectionDictionaries:(id)a3;
- (int64_t)numberOfEntries;
- (void)enumerateEntriesWithBlock:(id)a3;
@end

@implementation SUUIProductPageProductInfo

- (SUUIProductPageProductInfo)initWithInfoSectionDictionaries:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SUUIProductPageProductInfo;
  v20 = [(SUUIProductPageProductInfo *)&v26 init];
  if (v20)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    labels = v20->_labels;
    v20->_labels = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    values = v20->_values;
    v20->_values = v7;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        uint64_t v13 = 0;
        uint64_t v21 = v11;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x25A2A9B80]();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [v14 objectForKey:@"label"];
            v17 = [v14 objectForKey:@"value"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(NSMutableArray *)v20->_labels addObject:v16];
                uint64_t v11 = v21;
                [(NSMutableArray *)v20->_values addObject:v17];
              }
            }
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v11);
    }

    id v4 = v19;
  }

  return v20;
}

- (void)enumerateEntriesWithBlock:(id)a3
{
  id v4 = a3;
  labels = self->_labels;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SUUIProductPageProductInfo_enumerateEntriesWithBlock___block_invoke;
  v7[3] = &unk_265405730;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)labels enumerateObjectsUsingBlock:v7];
}

void __56__SUUIProductPageProductInfo_enumerateEntriesWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = *(void **)(*(void *)(a1 + 32) + 16);
  id v8 = a2;
  id v9 = [v7 objectAtIndex:a3];
  (*(void (**)(uint64_t, id, id, uint64_t, uint64_t))(v6 + 16))(v6, v8, v9, a3, a4);
}

- (int64_t)numberOfEntries
{
  return [(NSMutableArray *)self->_labels count];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end