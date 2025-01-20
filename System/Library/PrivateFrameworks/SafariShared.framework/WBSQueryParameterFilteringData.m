@interface WBSQueryParameterFilteringData
- (WBSQueryParameterFilteringData)init;
- (int64_t)numberOfFilteredQueryParameters;
- (void)addAdjustedURL:(id)a3 originalURL:(id)a4;
- (void)addData:(id)a3;
@end

@implementation WBSQueryParameterFilteringData

- (WBSQueryParameterFilteringData)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSQueryParameterFilteringData;
  v2 = [(WBSQueryParameterFilteringData *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
    originalAndAdjustedURLs = v2->_originalAndAdjustedURLs;
    v2->_originalAndAdjustedURLs = (NSMutableOrderedSet *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)addAdjustedURL:(id)a3 originalURL:(id)a4
{
  originalAndAdjustedURLs = self->_originalAndAdjustedURLs;
  v6 = (objc_class *)MEMORY[0x1E4F97EE0];
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)[[v6 alloc] initWithFirst:v7 second:v8];

  [(NSMutableOrderedSet *)originalAndAdjustedURLs addObject:v9];
}

- (void)addData:(id)a3
{
  originalAndAdjustedURLs = self->_originalAndAdjustedURLs;
  id v4 = [*((id *)a3 + 1) array];
  [(NSMutableOrderedSet *)originalAndAdjustedURLs addObjectsFromArray:v4];
}

- (int64_t)numberOfFilteredQueryParameters
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  originalAndAdjustedURLs = self->_originalAndAdjustedURLs;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__WBSQueryParameterFilteringData_numberOfFilteredQueryParameters__block_invoke;
  v8[3] = &unk_1E5C9EF70;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableOrderedSet *)originalAndAdjustedURLs enumerateObjectsUsingBlock:v8];
  int64_t v6 = [v5 count];

  return v6;
}

void __65__WBSQueryParameterFilteringData_numberOfFilteredQueryParameters__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v15 = [v3 first];
  id v4 = [v3 second];

  id v5 = [MEMORY[0x1E4F29088] componentsWithURL:v15 resolvingAgainstBaseURL:0];
  int64_t v6 = [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:0];
  id v7 = (void *)MEMORY[0x1E4F1CA80];
  id v8 = [v5 queryItems];
  id v9 = [v8 valueForKey:@"name"];
  v10 = [v7 setWithArray:v9];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v12 = [v6 queryItems];
  v13 = [v12 valueForKey:@"name"];
  v14 = [v11 setWithArray:v13];
  [v10 minusSet:v14];

  [*(id *)(a1 + 32) unionSet:v10];
}

- (void).cxx_destruct
{
}

@end