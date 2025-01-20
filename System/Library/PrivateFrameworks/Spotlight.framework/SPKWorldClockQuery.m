@interface SPKWorldClockQuery
+ (BOOL)isQuerySupported:(unint64_t)a3;
+ (unsigned)searchDomain;
- (void)start;
@end

@implementation SPKWorldClockQuery

+ (unsigned)searchDomain
{
  return 9;
}

- (void)start
{
  v21.receiver = self;
  v21.super_class = (Class)SPKWorldClockQuery;
  [(SPKQuery *)&v21 start];
  if (![(SPKQuery *)self sendEmptyResponseIfNecessary])
  {
    v3 = [(SPKQuery *)self userQueryString];
    v4 = (void *)[v3 mutableCopy];

    if (v4)
    {
      v5 = [(SPKQuery *)self queryContext];
      v6 = [(SPKQuery *)self delegate];
      uint64_t v7 = [v6 queryIdent];
      v8 = [v6 clientBundleID];
      v9 = [v5 searchString];
      v10 = objc_msgSend(objc_alloc(MEMORY[0x263F67A58]), "initWithInput:triggerEvent:indexType:queryId:", v9, objc_msgSend(v5, "whyQuery"), 1, v7);
      v11 = [MEMORY[0x263F674B0] sharedProxy];
      [v11 sendFeedbackType:5 feedback:v10 queryId:v7 clientID:v8];

      v12 = (void *)MEMORY[0x263F78E60];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __27__SPKWorldClockQuery_start__block_invoke;
      v17[3] = &unk_264C76F48;
      v17[4] = self;
      id v18 = v10;
      id v19 = v8;
      uint64_t v20 = v7;
      id v13 = v8;
      id v14 = v10;
      [v12 getWorldClockResultsForQuery:v4 completionHandler:v17];
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x263F78D80]);
      unint64_t v16 = [(SPKQuery *)self queryGroupId];
      v5 = (void *)[v15 initWithQueryID:v16 sections:MEMORY[0x263EFFA68]];
      v6 = [(SPKQuery *)self responseHandler];
      ((void (**)(void, void *))v6)[2](v6, v5);
    }
  }
}

void __27__SPKWorldClockQuery_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v4 = objc_msgSend(v3, "results", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v8++), "setQueryId:", objc_msgSend(*(id *)(a1 + 32), "queryGroupId"));
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v6);
    }

    id v9 = objc_alloc(MEMORY[0x263F78D80]);
    uint64_t v10 = [*(id *)(a1 + 32) queryGroupId];
    if (v3)
    {
      id v20 = v3;
      v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
      v12 = (void *)[v9 initWithQueryID:v10 sections:v11];
    }
    else
    {
      v12 = (void *)[v9 initWithQueryID:v10 sections:MEMORY[0x263EFFA68]];
    }
    [v12 setTopHitIsIn:1];
    id v13 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, void *))v13)[2](v13, v12);

    id v14 = (void *)[objc_alloc(MEMORY[0x263F67888]) initWithStartSearch:*(void *)(a1 + 40)];
    id v15 = [MEMORY[0x263F674B0] sharedProxy];
    [v15 sendFeedbackType:6 feedback:v14 queryId:*(void *)(a1 + 56) clientID:*(void *)(a1 + 48)];
  }
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return 1;
}

@end