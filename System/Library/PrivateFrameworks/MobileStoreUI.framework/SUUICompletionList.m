@interface SUUICompletionList
- (NSArray)completions;
- (NSMutableDictionary)cacheRepresentation;
- (NSString)title;
- (SUUICompletionList)initWithCacheRepresentation:(id)a3;
- (SUUICompletionList)initWithCompletionListDictionary:(id)a3;
@end

@implementation SUUICompletionList

- (SUUICompletionList)initWithCompletionListDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SUUICompletionList;
  v5 = [(SUUICompletionList *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"item"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_title, v6);
    }
    v7 = [v4 objectForKey:@"hints"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v18 = v7;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[SUUICompletion alloc] initWithCompletionDictionary:v14];
              [(NSArray *)v8 addObject:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }

      completions = v5->_completions;
      v5->_completions = v8;

      v7 = v18;
    }
  }
  return v5;
}

- (SUUICompletionList)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14.receiver = self;
    v14.super_class = (Class)SUUICompletionList;
    v5 = [(SUUICompletionList *)&v14 init];
    if (v5)
    {
      v6 = [v4 objectForKey:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v6 copy];
        title = v5->_title;
        v5->_title = (NSString *)v7;
      }
      id v9 = [v4 objectForKey:@"completions"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = SUUICacheCodingDecodeArray(v9, v10);
        completions = v5->_completions;
        v5->_completions = (NSArray *)v11;
      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  completions = self->_completions;
  if (completions)
  {
    v5 = SUUICacheCodingEncodeArray(completions);
    [v3 setObject:v5 forKey:@"completions"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  return (NSMutableDictionary *)v3;
}

- (NSArray)completions
{
  return self->_completions;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end