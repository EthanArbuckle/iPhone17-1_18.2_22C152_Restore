@interface NTTagSectionFetchDescriptor
- (NTCatchUpOperationForYouRequest)forYouRequest;
- (NTCatchUpOperationTagRequest)tagRequest;
- (NTTagSectionFetchDescriptor)init;
- (NTTagSectionFetchDescriptor)initWithTagConfiguration:(id)a3 appConfiguration:(id)a4 purchasedTagIDs:(id)a5 bundleSubscriptionProvider:(id)a6;
- (id)assembleResultsWithCatchUpOperation:(id)a3;
- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5;
- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3;
- (void)configureCatchUpOperationWithFetchRequest:(id)a3;
- (void)setForYouRequest:(id)a3;
- (void)setTagRequest:(id)a3;
@end

@implementation NTTagSectionFetchDescriptor

- (NTTagSectionFetchDescriptor)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTTagSectionFetchDescriptor init]";
    __int16 v9 = 2080;
    v10 = "NTTagSectionFetchDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 27;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTTagSectionFetchDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTTagSectionFetchDescriptor)initWithTagConfiguration:(id)a3 appConfiguration:(id)a4 purchasedTagIDs:(id)a5 bundleSubscriptionProvider:(id)a6
{
  v31[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTTagSectionFetchDescriptor initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:]();
    if (v11) {
      goto LABEL_6;
    }
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTTagSectionFetchDescriptor initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:]();
  }
LABEL_6:
  v30.receiver = self;
  v30.super_class = (Class)NTTagSectionFetchDescriptor;
  v14 = [(NTTagSectionFetchDescriptor *)&v30 init];
  if (v14)
  {
    uint64_t v15 = [v10 tagID];
    v16 = [[NTCatchUpOperationTagRequest alloc] initWithTagTodaySectionSpecificConfig:v10 tagID:v15];
    tagRequest = v14->_tagRequest;
    v14->_tagRequest = v16;

    v18 = objc_opt_new();
    objc_msgSend(v18, "setCutoffTime:", objc_msgSend(v10, "cutoffTime"));
    objc_msgSend(v18, "setHeadlinesPerFeedFetchCount:", objc_msgSend(v10, "headlinesPerFeedFetchCount"));
    [v18 setFeedMaxCount:-1];
    [v18 setSubscriptionsFetchCount:1];
    objc_msgSend(v18, "setFetchingBin:", objc_msgSend(v10, "fetchingBin"));
    id v29 = v11;
    v19 = [NTCatchUpOperationForYouRequest alloc];
    id v20 = v13;
    id v21 = v12;
    v22 = objc_opt_new();
    v23 = objc_opt_new();
    v31[0] = v15;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
    v25 = v19;
    id v11 = v29;
    uint64_t v26 = [(NTCatchUpOperationForYouRequest *)v25 initWithForYouTodaySectionSpecificConfig:v18 appConfiguration:v29 topStoriesChannelID:0 localNewsTagID:0 hiddenFeedIDs:v22 allowPaidBundleFeed:0 mutedTagIDs:v23 purchasedTagIDs:v21 rankedAllSubscribedTagIDs:v24 bundleSubscriptionProvider:v20 throttlingIdentifier:v15];
    forYouRequest = v14->_forYouRequest;
    v14->_forYouRequest = (NTCatchUpOperationForYouRequest *)v26;

    id v12 = v21;
    id v13 = v20;
  }
  return v14;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(NTTagSectionFetchDescriptor *)self forYouRequest];
  [v5 setForYouRequest:v4];

  [v5 setForYouEnabled:1];
}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  return (id)[a3 forYouResults];
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  v3 = [MEMORY[0x263F594A0] transformationWithPersonalizer:a3 configurationSet:17];
  uint64_t v4 = [[NTFeedTransformationItemFeedTransformation alloc] initWithFeedItemTransformation:v3];

  return v4;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v7 = a3;
  v8 = objc_msgSend(a5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_10);
  __int16 v9 = [[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit alloc] initWithFunctionProvider:v7 limit:a4 priorFeedItems:v8];

  id v10 = [[NTFeedTransformationItemFeedTransformation alloc] initWithFeedItemTransformation:v9];

  return v10;
}

uint64_t __103__NTTagSectionFetchDescriptor_incrementalLimitTransformationWithFeedPersonalizer_limit_priorFeedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 feedTransformationItem];
}

- (NTCatchUpOperationTagRequest)tagRequest
{
  return self->_tagRequest;
}

- (void)setTagRequest:(id)a3
{
}

- (NTCatchUpOperationForYouRequest)forYouRequest
{
  return self->_forYouRequest;
}

- (void)setForYouRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forYouRequest, 0);

  objc_storeStrong((id *)&self->_tagRequest, 0);
}

- (void)initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appConfiguration");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTTagSectionFetchDescriptor initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTTagSectionFetchDescriptor.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

- (void)initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagConfiguration");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTTagSectionFetchDescriptor initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTTagSectionFetchDescriptor.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end