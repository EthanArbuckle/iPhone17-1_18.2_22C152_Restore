@interface NTItemsSectionFetchDescriptor
- (NTCatchUpOperationArticleIDsRequest)itemsArticlesRequest;
- (NTItemsSectionFetchDescriptor)init;
- (NTItemsSectionFetchDescriptor)initWithItemsConfiguration:(id)a3;
- (NTPBItemsTodaySectionSpecificConfig)itemsConfiguration;
- (id)assembleResultsWithCatchUpOperation:(id)a3;
- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5;
- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3;
- (void)configureCatchUpOperationWithFetchRequest:(id)a3;
- (void)setItemsArticlesRequest:(id)a3;
- (void)setItemsConfiguration:(id)a3;
@end

@implementation NTItemsSectionFetchDescriptor

- (NTItemsSectionFetchDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTItemsSectionFetchDescriptor;
  return [(NTItemsSectionFetchDescriptor *)&v3 init];
}

- (NTItemsSectionFetchDescriptor)initWithItemsConfiguration:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTItemsSectionFetchDescriptor initWithItemsConfiguration:]();
  }
  v23.receiver = self;
  v23.super_class = (Class)NTItemsSectionFetchDescriptor;
  v5 = [(NTItemsSectionFetchDescriptor *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    itemsConfiguration = v5->_itemsConfiguration;
    v5->_itemsConfiguration = (NTPBItemsTodaySectionSpecificConfig *)v6;

    v8 = [MEMORY[0x263EFF980] array];
    v9 = [v4 items];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (![v14 itemType])
          {
            v15 = [v14 article];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }
    uint64_t v16 = NTArticleIDsRequestWithArticles(v8);
    itemsArticlesRequest = v5->_itemsArticlesRequest;
    v5->_itemsArticlesRequest = (NTCatchUpOperationArticleIDsRequest *)v16;
  }
  return v5;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NTItemsSectionFetchDescriptor *)self itemsArticlesRequest];
  [v4 addArticleIDsRequest:v5];
}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  id v4 = [a3 resultsByArticleIDsRequestID];
  id v5 = [(NTItemsSectionFetchDescriptor *)self itemsArticlesRequest];
  uint64_t v6 = [v5 identifier];
  v7 = [v4 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v8 = [NTCatchUpOperationResults alloc];
    v7 = [(NTCatchUpOperationResults *)v8 initWithItems:MEMORY[0x263EFFA68] rankingFeedback:0 supplementalInterestToken:0];
  }
  v9 = [(NTItemsSectionFetchDescriptor *)self itemsConfiguration];
  uint64_t v10 = [v9 items];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__NTItemsSectionFetchDescriptor_assembleResultsWithCatchUpOperation___block_invoke;
  v15[3] = &unk_26475C660;
  uint64_t v16 = v7;
  uint64_t v11 = v7;
  uint64_t v12 = objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", v15);

  id v13 = [(NTCatchUpOperationResults *)v11 copyWithItems:v12];

  return v13;
}

id __69__NTItemsSectionFetchDescriptor_assembleResultsWithCatchUpOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 itemType])
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) items];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__NTItemsSectionFetchDescriptor_assembleResultsWithCatchUpOperation___block_invoke_2;
    v7[3] = &unk_26475C638;
    id v8 = v3;
    id v4 = objc_msgSend(v5, "fc_firstObjectPassingTest:", v7);
  }

  return v4;
}

uint64_t __69__NTItemsSectionFetchDescriptor_assembleResultsWithCatchUpOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 feedTransformationItem];
  id v4 = [v3 articleID];
  id v5 = [*(id *)(a1 + 32) article];
  uint64_t v6 = [v5 articleID];
  uint64_t v7 = [v4 isEqualToString:v6];

  return v7;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  id v3 = [[NTFeedTransformationLimit alloc] initWithLimit:-1];

  return v3;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v5 = [[NTFeedTransformationLimit alloc] initWithLimit:a4];

  return v5;
}

- (NTPBItemsTodaySectionSpecificConfig)itemsConfiguration
{
  return self->_itemsConfiguration;
}

- (void)setItemsConfiguration:(id)a3
{
}

- (NTCatchUpOperationArticleIDsRequest)itemsArticlesRequest
{
  return self->_itemsArticlesRequest;
}

- (void)setItemsArticlesRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsArticlesRequest, 0);

  objc_storeStrong((id *)&self->_itemsConfiguration, 0);
}

- (void)initWithItemsConfiguration:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "itemsConfiguration");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTItemsSectionFetchDescriptor initWithItemsConfiguration:]";
  __int16 v3 = 2080;
  id v4 = "NTItemsSectionFetchDescriptor.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end