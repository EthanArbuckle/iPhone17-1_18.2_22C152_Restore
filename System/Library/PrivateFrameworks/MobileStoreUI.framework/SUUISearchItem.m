@interface SUUISearchItem
- (NSArray)screenshots;
- (SUUIScreenshot)primaryScreenshot;
- (SUUISearchItem)initWithLookupDictionary:(id)a3;
- (id)childItemForIdentifier:(id)a3;
- (id)childItemIdentifiers;
- (id)loadedChildItems;
- (void)setChildItem:(id)a3 forIdentifier:(id)a4;
@end

@implementation SUUISearchItem

- (SUUISearchItem)initWithLookupDictionary:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SUUISearchItem;
  v5 = [(SUUIItem *)&v41 initWithLookupDictionary:v4];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = SUUIItemScreenshotsForDictionary(v4);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          if (!v5->_primaryScreenshot) {
            objc_storeStrong((id *)&v5->_primaryScreenshot, *(id *)(*((void *)&v37 + 1) + 8 * i));
          }
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v9);
    }
    uint64_t v13 = [v6 copy];
    screenshots = v5->_screenshots;
    v5->_screenshots = (NSArray *)v13;

    v15 = [v4 objectForKey:@"childrenIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v15 copy];
      childItemIdentifiers = v5->_childItemIdentifiers;
      v5->_childItemIdentifiers = (NSArray *)v16;

      uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
      loadedChildItems = v5->_loadedChildItems;
      v5->_loadedChildItems = (NSMutableDictionary *)v18;

      v20 = [v4 objectForKey:@"children"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v30 = v15;
        id v31 = v4;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        obuint64_t j = v5->_childItemIdentifiers;
        uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v34 != v23) {
                objc_enumerationMutation(obj);
              }
              v25 = *(void **)(*((void *)&v33 + 1) + 8 * j);
              v26 = objc_msgSend(v25, "stringValue", v30, v31);
              v27 = [v20 objectForKey:v26];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v28 = [[SUUIItem alloc] initWithLookupDictionary:v27];
                if (v28) {
                  [(NSMutableDictionary *)v5->_loadedChildItems setObject:v28 forKey:v25];
                }
              }
            }
            uint64_t v22 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v22);
        }

        v15 = v30;
        id v4 = v31;
      }
    }
  }

  return v5;
}

- (void)setChildItem:(id)a3 forIdentifier:(id)a4
{
}

- (id)loadedChildItems
{
  return (id)[(NSMutableDictionary *)self->_loadedChildItems allValues];
}

- (id)childItemForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_loadedChildItems objectForKey:a3];
}

- (id)childItemIdentifiers
{
  return self->_childItemIdentifiers;
}

- (SUUIScreenshot)primaryScreenshot
{
  return self->_primaryScreenshot;
}

- (NSArray)screenshots
{
  return self->_screenshots;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedChildItems, 0);
  objc_storeStrong((id *)&self->_childItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_primaryScreenshot, 0);
}

@end