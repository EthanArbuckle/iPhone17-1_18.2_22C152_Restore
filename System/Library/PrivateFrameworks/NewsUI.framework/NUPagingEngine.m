@interface NUPagingEngine
- (NUArticlePageFactory)articlePageFactory;
- (NUPagingEngine)initWithArticlePageFactory:(id)a3;
- (id)createPagingForArticleIDs:(id)a3;
- (id)paging:(id)a3 byAddingPage:(id)a4 afterPage:(id)a5;
- (id)paging:(id)a3 byRemovingPage:(id)a4;
@end

@implementation NUPagingEngine

- (NUPagingEngine)initWithArticlePageFactory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUPagingEngine;
  v6 = [(NUPagingEngine *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_articlePageFactory, a3);
  }

  return v7;
}

- (id)createPagingForArticleIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(NUPagingEngine *)self articlePageFactory];
  v6 = [v5 createPagesForArticleIDs:v4];

  v7 = [[NUPagingBlueprint alloc] initWithPages:v6];

  return v7;
}

- (id)paging:(id)a3 byAddingPage:(id)a4 afterPage:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v11 = objc_msgSend(v7, "allPages", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        [v10 addObject:v16];
        if (v16 == v9) {
          [v10 addObject:v8];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  v17 = [NUPagingBlueprint alloc];
  v18 = (void *)[v10 copy];
  v19 = [(NUPagingBlueprint *)v17 initWithPages:v18];

  return v19;
}

- (id)paging:(id)a3 byRemovingPage:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = objc_msgSend(v5, "allPages", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        if (*(id *)(*((void *)&v17 + 1) + 8 * i) != v6) {
          objc_msgSend(v7, "addObject:");
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [NUPagingBlueprint alloc];
  uint64_t v14 = (void *)[v7 copy];
  v15 = [(NUPagingBlueprint *)v13 initWithPages:v14];

  return v15;
}

- (NUArticlePageFactory)articlePageFactory
{
  return self->_articlePageFactory;
}

- (void).cxx_destruct
{
}

@end