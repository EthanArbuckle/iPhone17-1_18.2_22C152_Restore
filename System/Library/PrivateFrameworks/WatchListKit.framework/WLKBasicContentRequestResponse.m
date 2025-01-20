@interface WLKBasicContentRequestResponse
- (NSArray)items;
- (WLKBasicContentRequestResponse)init;
- (WLKBasicContentRequestResponse)initWithDictionary:(id)a3;
@end

@implementation WLKBasicContentRequestResponse

- (WLKBasicContentRequestResponse)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WLKBasicContentRequestResponse;
  v5 = [(WLKBasicContentRequestResponse *)&v23 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "wlk_arrayForKey:", @"data");
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [WLKBasicContentMetadata alloc];
            v15 = -[WLKBasicContentMetadata initWithDictionary:](v14, "initWithDictionary:", v13, (void)v19);
            if (v15) {
              [v7 addObject:v15];
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    uint64_t v16 = [v7 copy];
    items = v5->_items;
    v5->_items = (NSArray *)v16;
  }
  return v5;
}

- (WLKBasicContentRequestResponse)init
{
  return [(WLKBasicContentRequestResponse *)self initWithDictionary:0];
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end