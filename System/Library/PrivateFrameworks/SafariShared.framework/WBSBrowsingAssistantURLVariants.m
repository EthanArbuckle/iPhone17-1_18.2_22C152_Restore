@interface WBSBrowsingAssistantURLVariants
+ (id)variantsForURL:(id)a3;
- (NSArray)variants;
- (NSURL)url;
- (WBSBrowsingAssistantURLVariants)initWithURL:(id)a3;
- (id)_queryVariantsFromArray:(id)a3;
@end

@implementation WBSBrowsingAssistantURLVariants

- (WBSBrowsingAssistantURLVariants)initWithURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSBrowsingAssistantURLVariants;
  v5 = [(WBSBrowsingAssistantURLVariants *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)variantsForURL:(id)a3
{
  id v3 = a3;
  id v4 = [[WBSBrowsingAssistantURLVariants alloc] initWithURL:v3];

  return v4;
}

- (NSArray)variants
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F29088] componentsWithURL:self->_url resolvingAgainstBaseURL:0];
  id v4 = [v3 string];
  uint64_t v5 = [v3 rangeOfPath];
  v7 = [v4 substringToIndex:v5 + v6];
  v8 = [v3 queryItems];
  if ((unint64_t)[v8 count] >= 6)
  {
    uint64_t v9 = objc_msgSend(v8, "subarrayWithRange:", 0, 5);

    v8 = (void *)v9;
  }
  if (v8)
  {
    objc_super v10 = [(WBSBrowsingAssistantURLVariants *)self _queryVariantsFromArray:v8];
    v11 = [MEMORY[0x1E4F1CA48] array];
    v21 = v7;
    v12 = [MEMORY[0x1E4F29088] componentsWithString:v7];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          [v12 setQueryItems:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          v18 = [v12 string];
          [v11 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    uint64_t v19 = [v11 indexOfObject:v4];
    if (v19 && v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v11 removeObjectAtIndex:v19];
      [v11 insertObject:v4 atIndex:0];
    }

    v7 = v21;
  }
  else
  {
    v11 = 0;
  }

  return (NSArray *)v11;
}

- (id)_queryVariantsFromArray:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [v4 firstObject];
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    v18 = (void *)v5;
    v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v5];
    [v6 addObject:v7];
    v8 = (void *)[v4 mutableCopy];
    [v8 removeObjectAtIndex:0];
    uint64_t v9 = [(WBSBrowsingAssistantURLVariants *)self _queryVariantsFromArray:v8];
    objc_super v10 = v9;
    if (v9)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            uint64_t v16 = [v7 arrayByAddingObjectsFromArray:v15];
            [v6 addObject:v16];

            [v6 addObject:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end