@interface SUCompletionsResponse
- (NSArray)completionItems;
- (NSString)title;
- (SUCompletionsResponse)init;
- (SUCompletionsResponse)initWithPropertyList:(id)a3;
- (void)dealloc;
@end

@implementation SUCompletionsResponse

- (SUCompletionsResponse)init
{
  return [(SUCompletionsResponse *)self initWithPropertyList:0];
}

- (SUCompletionsResponse)initWithPropertyList:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)SUCompletionsResponse;
  v4 = [(SUCompletionsResponse *)&v18 init];
  if (v4)
  {
    v5 = (void *)[a3 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_title = (NSString *)v5;
    }
    v6 = (void *)[a3 objectForKey:@"hints"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v6);
            }
            v12 = [[SUCompletionItem alloc] initWithPropertyList:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
            [(NSArray *)v7 addObject:v12];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
        }
        while (v9);
      }
      v4->_completionItems = v7;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUCompletionsResponse;
  [(SUCompletionsResponse *)&v3 dealloc];
}

- (NSArray)completionItems
{
  return self->_completionItems;
}

- (NSString)title
{
  return self->_title;
}

@end