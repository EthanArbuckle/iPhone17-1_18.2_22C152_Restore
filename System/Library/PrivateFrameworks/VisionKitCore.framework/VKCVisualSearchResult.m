@interface VKCVisualSearchResult
- (MADVIVisualSearchGatingResult)gatingResult;
- (MADVIVisualSearchResult)searchResult;
- (NSArray)resultItems;
- (NSData)payload;
- (NSData)userFeedbackPayload;
- (VKCImageAnalysis)analysis;
- (VKCVisualSearchResult)initWithGatingResult:(id)a3;
- (id)description;
- (void)setAnalysis:(id)a3;
- (void)setGatingResult:(id)a3;
- (void)setSearchResult:(id)a3;
@end

@implementation VKCVisualSearchResult

- (VKCVisualSearchResult)initWithGatingResult:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)VKCVisualSearchResult;
  v6 = [(VKCVisualSearchResult *)&v32 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gatingResult, a3);
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v21 = v7;
    obuint64_t j = [(MADVIVisualSearchGatingResult *)v7->_gatingResult resultItems];
    uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v13 = [v12 domains];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v25 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = [[VKCVisualSearchResultItem alloc] initWithGatingResultItem:v12 domain:*(void *)(*((void *)&v24 + 1) + 8 * j)];
                [(NSArray *)v8 addObject:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
            }
            while (v15);
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v10);
    }

    v7 = v21;
    resultItems = v21->_resultItems;
    v21->_resultItems = v8;
  }
  return v7;
}

- (void)setAnalysis:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_analysis, v4);
  id v5 = [(VKCVisualSearchResult *)self resultItems];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__VKCVisualSearchResult_setAnalysis___block_invoke;
  v7[3] = &unk_1E6BF2B80;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __37__VKCVisualSearchResult_setAnalysis___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAnalysis:*(void *)(a1 + 32)];
}

- (NSData)payload
{
  return (NSData *)[(MADVIVisualSearchGatingResult *)self->_gatingResult payload];
}

- (NSData)userFeedbackPayload
{
  return (NSData *)[(MADVIVisualSearchResult *)self->_searchResult userFeedbackPayload];
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
  id v5 = a3;
  id v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1DB266000, v6, OS_LOG_TYPE_DEFAULT, "VisualSearch: Request completed", v10, 2u);
  }

  v7 = [(MADVIVisualSearchResult *)self->_searchResult resultItems];
  objc_msgSend(v7, "vk_compactMap:", &__block_literal_global_22);
  id v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  resultItems = self->_resultItems;
  self->_resultItems = v8;
}

VKCVisualSearchResultItem *__41__VKCVisualSearchResult_setSearchResult___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[VKCVisualSearchResultItem alloc] initWithSearchResultItem:v2];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ with %lu results", self, -[NSArray count](self->_resultItems, "count")];
}

- (VKCImageAnalysis)analysis
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analysis);
  return (VKCImageAnalysis *)WeakRetained;
}

- (MADVIVisualSearchResult)searchResult
{
  return self->_searchResult;
}

- (NSArray)resultItems
{
  return self->_resultItems;
}

- (MADVIVisualSearchGatingResult)gatingResult
{
  return self->_gatingResult;
}

- (void)setGatingResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatingResult, 0);
  objc_storeStrong((id *)&self->_resultItems, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_destroyWeak((id *)&self->_analysis);
}

@end