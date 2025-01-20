@interface NTArticleIDsSectionFetchDescriptor
- (NTArticleIDsSectionFetchDescriptor)init;
- (NTArticleIDsSectionFetchDescriptor)initWithArticleIDsConfiguration:(id)a3;
- (NTSectionFetchDescriptor)privateFetchDescriptor;
- (id)assembleResultsWithCatchUpOperation:(id)a3;
- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5;
- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3;
- (void)configureCatchUpOperationWithFetchRequest:(id)a3;
- (void)setPrivateFetchDescriptor:(id)a3;
@end

@implementation NTArticleIDsSectionFetchDescriptor

- (NTArticleIDsSectionFetchDescriptor)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTArticleIDsSectionFetchDescriptor init]";
    __int16 v9 = 2080;
    v10 = "NTArticleIDsSectionFetchDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTArticleIDsSectionFetchDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTArticleIDsSectionFetchDescriptor)initWithArticleIDsConfiguration:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTArticleIDsSectionFetchDescriptor initWithArticleIDsConfiguration:]();
  }
  v21.receiver = self;
  v21.super_class = (Class)NTArticleIDsSectionFetchDescriptor;
  v5 = [(NTArticleIDsSectionFetchDescriptor *)&v21 init];
  if (v5)
  {
    id v6 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = objc_msgSend(v4, "articles", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          __int16 v13 = objc_opt_new();
          [v13 setItemType:0];
          [v13 setArticle:v12];
          [v6 addItems:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }

    v14 = [[NTItemsSectionFetchDescriptor alloc] initWithItemsConfiguration:v6];
    privateFetchDescriptor = v5->_privateFetchDescriptor;
    v5->_privateFetchDescriptor = (NTSectionFetchDescriptor *)v14;
  }
  return v5;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NTArticleIDsSectionFetchDescriptor *)self privateFetchDescriptor];
  [v5 configureCatchUpOperationWithFetchRequest:v4];
}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(NTArticleIDsSectionFetchDescriptor *)self privateFetchDescriptor];
  id v6 = [v5 assembleResultsWithCatchUpOperation:v4];

  return v6;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  id v4 = a3;
  id v5 = [(NTArticleIDsSectionFetchDescriptor *)self privateFetchDescriptor];
  id v6 = [v5 incrementalSortTransformationWithFeedPersonalizer:v4];

  return v6;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(NTArticleIDsSectionFetchDescriptor *)self privateFetchDescriptor];
  __int16 v11 = [v10 incrementalLimitTransformationWithFeedPersonalizer:v9 limit:a4 priorFeedItems:v8];

  return v11;
}

- (NTSectionFetchDescriptor)privateFetchDescriptor
{
  return self->_privateFetchDescriptor;
}

- (void)setPrivateFetchDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithArticleIDsConfiguration:.cold.1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleIDsConfiguration");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTArticleIDsSectionFetchDescriptor initWithArticleIDsConfiguration:]";
  __int16 v3 = 2080;
  id v4 = "NTArticleIDsSectionFetchDescriptor.m";
  __int16 v5 = 1024;
  int v6 = 29;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end