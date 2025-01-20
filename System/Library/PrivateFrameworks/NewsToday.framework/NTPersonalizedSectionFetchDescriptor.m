@interface NTPersonalizedSectionFetchDescriptor
- (NTCatchUpOperationArticleIDsRequest)mandatoryArticleIDsRequest;
- (NTCatchUpOperationArticleIDsRequest)personalizedArticleIDsRequest;
- (NTPBPersonalizedTodaySectionSpecificConfig)personalizedConfiguration;
- (NTPersonalizedSectionFetchDescriptor)init;
- (NTPersonalizedSectionFetchDescriptor)initWithPersonalizedConfiguration:(id)a3;
- (id)assembleResultsWithCatchUpOperation:(id)a3;
- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5;
- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3;
- (void)configureCatchUpOperationWithFetchRequest:(id)a3;
- (void)setMandatoryArticleIDsRequest:(id)a3;
- (void)setPersonalizedArticleIDsRequest:(id)a3;
- (void)setPersonalizedConfiguration:(id)a3;
@end

@implementation NTPersonalizedSectionFetchDescriptor

- (NTPersonalizedSectionFetchDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTPersonalizedSectionFetchDescriptor;
  return [(NTPersonalizedSectionFetchDescriptor *)&v3 init];
}

- (NTPersonalizedSectionFetchDescriptor)initWithPersonalizedConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTPersonalizedSectionFetchDescriptor initWithPersonalizedConfiguration:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)NTPersonalizedSectionFetchDescriptor;
  v5 = [(NTPersonalizedSectionFetchDescriptor *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    personalizedConfiguration = v5->_personalizedConfiguration;
    v5->_personalizedConfiguration = (NTPBPersonalizedTodaySectionSpecificConfig *)v6;

    v8 = [v4 mandatoryArticles];
    v9 = v8;
    v10 = (void *)MEMORY[0x263EFFA68];
    if (!v8) {
      v8 = (void *)MEMORY[0x263EFFA68];
    }
    uint64_t v11 = NTArticleIDsRequestWithArticles(v8);
    mandatoryArticleIDsRequest = v5->_mandatoryArticleIDsRequest;
    v5->_mandatoryArticleIDsRequest = (NTCatchUpOperationArticleIDsRequest *)v11;

    v13 = [v4 personalizedArticles];
    v14 = v13;
    if (!v13) {
      v13 = v10;
    }
    uint64_t v15 = NTArticleIDsRequestWithArticles(v13);
    personalizedArticleIDsRequest = v5->_personalizedArticleIDsRequest;
    v5->_personalizedArticleIDsRequest = (NTCatchUpOperationArticleIDsRequest *)v15;
  }
  return v5;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = [(NTPersonalizedSectionFetchDescriptor *)self mandatoryArticleIDsRequest];
  [v4 addArticleIDsRequest:v5];

  id v6 = [(NTPersonalizedSectionFetchDescriptor *)self personalizedArticleIDsRequest];
  [v4 addArticleIDsRequest:v6];
}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  id v4 = [a3 resultsByArticleIDsRequestID];
  v5 = [(NTPersonalizedSectionFetchDescriptor *)self mandatoryArticleIDsRequest];
  id v6 = [v5 identifier];
  v7 = [v4 objectForKeyedSubscript:v6];

  v8 = [(NTPersonalizedSectionFetchDescriptor *)self personalizedArticleIDsRequest];
  v9 = [v8 identifier];
  v10 = [v4 objectForKeyedSubscript:v9];

  uint64_t v11 = [v7 resultsByCombiningWithResults:v10];

  return v11;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  id v4 = [MEMORY[0x263F594A0] transformationWithPersonalizer:a3 feedItemScores:0 sortOptions:2 configurationSet:16];
  v5 = [NTPersonalizedSectionSortTransformation alloc];
  id v6 = [(NTPersonalizedSectionFetchDescriptor *)self mandatoryArticleIDsRequest];
  v7 = [v6 articleIDs];
  v8 = [(NTPersonalizedSectionFetchDescriptor *)self personalizedArticleIDsRequest];
  v9 = [v8 articleIDs];
  v10 = [(NTPersonalizedSectionSortTransformation *)v5 initWithMandatoryArticleIDs:v7 personalizedArticleIDs:v9 sortTransformation:v4];

  uint64_t v11 = [[NTFeedTransformationItemFeedTransformation alloc] initWithFeedItemTransformation:v10];

  return v11;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v7 = a5;
  v8 = [(NTPersonalizedSectionFetchDescriptor *)self personalizedConfiguration];
  uint64_t v9 = [v8 maxArticlesShown];
  uint64_t v10 = [v7 count];

  unint64_t v11 = v9 - v10;
  v12 = [NTPersonalizedSectionLimitTransformation alloc];
  v13 = [(NTPersonalizedSectionFetchDescriptor *)self mandatoryArticleIDsRequest];
  v14 = [v13 articleIDs];
  uint64_t v15 = [(NTPersonalizedSectionFetchDescriptor *)self personalizedArticleIDsRequest];
  v16 = [v15 articleIDs];
  if (v11 >= a4) {
    unint64_t v17 = a4;
  }
  else {
    unint64_t v17 = v11;
  }
  objc_super v18 = [(NTPersonalizedSectionLimitTransformation *)v12 initWithMandatoryArticleIDs:v14 personalizedArticleIDs:v16 limit:v17];

  v19 = [[NTFeedTransformationItemFeedTransformation alloc] initWithFeedItemTransformation:v18];

  return v19;
}

- (NTPBPersonalizedTodaySectionSpecificConfig)personalizedConfiguration
{
  return self->_personalizedConfiguration;
}

- (void)setPersonalizedConfiguration:(id)a3
{
}

- (NTCatchUpOperationArticleIDsRequest)mandatoryArticleIDsRequest
{
  return self->_mandatoryArticleIDsRequest;
}

- (void)setMandatoryArticleIDsRequest:(id)a3
{
}

- (NTCatchUpOperationArticleIDsRequest)personalizedArticleIDsRequest
{
  return self->_personalizedArticleIDsRequest;
}

- (void)setPersonalizedArticleIDsRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedArticleIDsRequest, 0);
  objc_storeStrong((id *)&self->_mandatoryArticleIDsRequest, 0);

  objc_storeStrong((id *)&self->_personalizedConfiguration, 0);
}

- (void)initWithPersonalizedConfiguration:.cold.1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "personalizedConfiguration");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTPersonalizedSectionFetchDescriptor initWithPersonalizedConfiguration:]";
  __int16 v3 = 2080;
  id v4 = "NTPersonalizedSectionFetchDescriptor.m";
  __int16 v5 = 1024;
  int v6 = 34;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end