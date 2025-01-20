@interface NTArticleListSectionFetchDescriptor
- (NTArticleListSectionFetchDescriptor)init;
- (NTArticleListSectionFetchDescriptor)initWithArticleListConfiguration:(id)a3;
- (NTPBArticleListTodaySectionSpecificConfig)articleListRequest;
- (id)assembleResultsWithCatchUpOperation:(id)a3;
- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5;
- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3;
- (void)configureCatchUpOperationWithFetchRequest:(id)a3;
- (void)setArticleListRequest:(id)a3;
@end

@implementation NTArticleListSectionFetchDescriptor

- (NTArticleListSectionFetchDescriptor)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTArticleListSectionFetchDescriptor init]";
    __int16 v9 = 2080;
    v10 = "NTArticleListSectionFetchDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTArticleListSectionFetchDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTArticleListSectionFetchDescriptor)initWithArticleListConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTArticleListSectionFetchDescriptor initWithArticleListConfiguration:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)NTArticleListSectionFetchDescriptor;
  v5 = [(NTArticleListSectionFetchDescriptor *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    articleListRequest = v5->_articleListRequest;
    v5->_articleListRequest = (NTPBArticleListTodaySectionSpecificConfig *)v6;
  }
  return v5;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NTArticleListSectionFetchDescriptor *)self articleListRequest];
  [v4 addArticleListRequest:v5];
}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  id v4 = [a3 resultsByArticleListID];
  id v5 = [(NTArticleListSectionFetchDescriptor *)self articleListRequest];
  uint64_t v6 = [v5 articleListID];
  v7 = [v4 objectForKeyedSubscript:v6];

  return v7;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  v3 = [MEMORY[0x263F594A8] transformationWithSortMethod:0];
  id v4 = [[NTFeedTransformationItemFeedTransformation alloc] initWithFeedItemTransformation:v3];

  return v4;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v5 = [MEMORY[0x263F59490] transformationWithLimit:a4];
  uint64_t v6 = [[NTFeedTransformationItemFeedTransformation alloc] initWithFeedItemTransformation:v5];

  return v6;
}

- (NTPBArticleListTodaySectionSpecificConfig)articleListRequest
{
  return self->_articleListRequest;
}

- (void)setArticleListRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithArticleListConfiguration:.cold.1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleListConfiguration");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTArticleListSectionFetchDescriptor initWithArticleListConfiguration:]";
  __int16 v3 = 2080;
  id v4 = "NTArticleListSectionFetchDescriptor.m";
  __int16 v5 = 1024;
  int v6 = 29;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end