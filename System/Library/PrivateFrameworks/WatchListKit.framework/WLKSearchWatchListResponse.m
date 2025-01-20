@interface WLKSearchWatchListResponse
- (NSArray)items;
- (NSDictionary)dictionary;
- (WLKSearchWatchListResponse)init;
- (WLKSearchWatchListResponse)initWithDictionary:(id)a3;
@end

@implementation WLKSearchWatchListResponse

- (WLKSearchWatchListResponse)initWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WLKSearchWatchListResponse;
  v6 = [(WLKSearchWatchListResponse *)&v27 init];
  v7 = v6;
  if (v6)
  {
    v22 = v6;
    objc_storeStrong((id *)&v6->_dictionary, a3);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v21 = objc_msgSend(v5, "wlk_dictionaryForKey:", @"data");
    v9 = objc_msgSend(v21, "wlk_arrayForKey:", @"items");
    v10 = v9;
    if (v9)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = objc_msgSend(v15, "wlk_dictionaryForKey:", @"content");
              v17 = [[WLKBasicContentMetadata alloc] initWithDictionary:v16];
              if (v17) {
                [v8 addObject:v17];
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v12);
      }
    }
    uint64_t v18 = [v8 copy];
    v7 = v22;
    items = v22->_items;
    v22->_items = (NSArray *)v18;
  }
  return v7;
}

- (WLKSearchWatchListResponse)init
{
  return 0;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end