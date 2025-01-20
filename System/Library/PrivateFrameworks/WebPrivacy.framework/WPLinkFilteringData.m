@interface WPLinkFilteringData
- (NSArray)rules;
- (NSDictionary)scopedQueryParameters;
- (WPLinkFilteringData)initWithQueryParameters:(id)a3;
- (WPLinkFilteringData)initWithQueryParameters:(id)a3 domains:(id)a4 paths:(id)a5;
- (WPLinkFilteringData)initWithRules:(id)a3;
- (id)description;
@end

@implementation WPLinkFilteringData

- (WPLinkFilteringData)initWithQueryParameters:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WPLinkFilteringData;
  v5 = [(WPLinkFilteringData *)&v21 init];
  if (v5)
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
          v12 = [WPLinkFilteringRule alloc];
          v13 = -[WPLinkFilteringRule initWithQueryParameter:domain:path:](v12, "initWithQueryParameter:domain:path:", v11, &stru_270D83B70, &stru_270D83B70, (void)v17);
          [(NSArray *)v6 addObject:v13];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v8);
    }

    rules = v5->_rules;
    v5->_rules = v6;

    v15 = v5;
  }

  return v5;
}

- (WPLinkFilteringData)initWithQueryParameters:(id)a3 domains:(id)a4 paths:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)WPLinkFilteringData;
  uint64_t v11 = [(WPLinkFilteringData *)&v25 init];
  if (v11)
  {
    uint64_t v12 = [v8 count];
    if (v12 != [v9 count] || (uint64_t v13 = objc_msgSend(v8, "count"), v13 != objc_msgSend(v10, "count"))) {
      __assert_rtn("-[WPLinkFilteringData initWithQueryParameters:domains:paths:]", "WPLinkFilteringData.mm", 72, "queryParameters.count == domains.count && queryParameters.count == paths.count");
    }
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    for (unsigned int i = 0; ; unsigned int i = v16 + 1)
    {
      uint64_t v16 = i;
      if ([v8 count] <= (unint64_t)i) {
        break;
      }
      long long v17 = [WPLinkFilteringRule alloc];
      long long v18 = [v8 objectAtIndexedSubscript:i];
      long long v19 = [v9 objectAtIndexedSubscript:v16];
      long long v20 = [v10 objectAtIndexedSubscript:v16];
      objc_super v21 = [(WPLinkFilteringRule *)v17 initWithQueryParameter:v18 domain:v19 path:v20];
      [(NSArray *)v14 addObject:v21];
    }
    rules = v11->_rules;
    v11->_rules = v14;

    uint64_t v23 = v11;
  }

  return v11;
}

- (WPLinkFilteringData)initWithRules:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPLinkFilteringData;
  v6 = [(WPLinkFilteringData *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rules, a3);
    id v8 = v7;
  }

  return v7;
}

- (NSDictionary)scopedQueryParameters
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = self->_rules;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "queryParameter", (void)v25);
        objc_super v10 = [v3 objectForKey:v9];
        BOOL v11 = v10 == 0;

        if (v11)
        {
          uint64_t v12 = objc_alloc_init(WPLinkFilteringConditionals);
          uint64_t v13 = [v8 queryParameter];
          [v3 setObject:v12 forKey:v13];
        }
        v14 = [v8 queryParameter];
        v15 = [v3 objectForKey:v14];

        uint64_t v16 = [v8 domain];
        BOOL v17 = [v16 length] == 0;

        if (!v17)
        {
          long long v18 = [v15 domains];
          long long v19 = [v8 domain];
          [v18 addObject:v19];
        }
        long long v20 = [v8 path];
        BOOL v21 = [v20 length] == 0;

        if (!v21)
        {
          v22 = [v15 paths];
          uint64_t v23 = [v8 path];
          [v22 addObject:v23];
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }

  return (NSDictionary *)v3;
}

- (id)description
{
  return [(NSArray *)self->_rules description];
}

- (NSArray)rules
{
  return self->_rules;
}

- (void).cxx_destruct
{
}

@end