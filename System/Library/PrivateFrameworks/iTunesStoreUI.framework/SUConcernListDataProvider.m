@interface SUConcernListDataProvider
- (BOOL)parseData:(id)a3 returningError:(id *)a4;
- (id)_concernsForArray:(id)a3;
@end

@implementation SUConcernListDataProvider

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  v12 = 0;
  id v7 = objc_alloc_init(MEMORY[0x263F89500]);
  [v7 configureFromProvider:self];
  if ([v7 parseData:a3 returningError:&v12])
  {
    v8 = (void *)[v7 output];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v9 = (void *)[v8 objectForKey:@"items"],
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0)
      && [v9 count])
    {
      [(ISDataProvider *)self setOutput:[(SUConcernListDataProvider *)self _concernsForArray:v9]];
      [(ISDataProvider *)self migrateOutputFromSubProvider:v7];
      BOOL v10 = 1;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"CONCERN_POST_FAILED_ERROR", &stru_26DB8C5F8, 0);
      BOOL v10 = 0;
      v12 = (void *)ISError();
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  if (a4) {
    *a4 = v12;
  }
  return v10;
}

- (id)_concernsForArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void *)[MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = [[SUConcernItem alloc] initWithDictionary:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
        if (v9)
        {
          BOOL v10 = v9;
          [v4 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v4;
}

@end