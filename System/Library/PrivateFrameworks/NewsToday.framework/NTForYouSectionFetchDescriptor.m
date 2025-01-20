@interface NTForYouSectionFetchDescriptor
- (NSString)localNewsTagID;
- (NTCatchUpOperationForYouRequest)forYouRequest;
- (NTForYouSectionFetchDescriptor)init;
- (NTForYouSectionFetchDescriptor)initWithForYouConfiguration:(id)a3 appConfiguration:(id)a4 topStoriesChannelID:(id)a5 localNewsTagID:(id)a6 hiddenFeedIDs:(id)a7 allowPaidBundleFeed:(BOOL)a8 mutedTagIDs:(id)a9 purchasedTagIDs:(id)a10 rankedAllSubscribedTagIDs:(id)a11 bundleSubscriptionProvider:(id)a12;
- (id)assembleResultsWithCatchUpOperation:(id)a3;
- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5;
- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3;
- (unint64_t)localNewsPromotionIndex;
- (void)configureCatchUpOperationWithFetchRequest:(id)a3;
@end

@implementation NTForYouSectionFetchDescriptor

- (NTForYouSectionFetchDescriptor)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTForYouSectionFetchDescriptor init]";
    __int16 v9 = 2080;
    v10 = "NTForYouSectionFetchDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 29;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTForYouSectionFetchDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTForYouSectionFetchDescriptor)initWithForYouConfiguration:(id)a3 appConfiguration:(id)a4 topStoriesChannelID:(id)a5 localNewsTagID:(id)a6 hiddenFeedIDs:(id)a7 allowPaidBundleFeed:(BOOL)a8 mutedTagIDs:(id)a9 purchasedTagIDs:(id)a10 rankedAllSubscribedTagIDs:(id)a11 bundleSubscriptionProvider:(id)a12
{
  BOOL v32 = a8;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  if (!v17 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:].cold.6();
    if (v18) {
      goto LABEL_6;
    }
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:].cold.5();
  }
LABEL_6:
  if (!v21 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:].cold.4();
    if (v22) {
      goto LABEL_11;
    }
  }
  else if (v22)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:]();
  }
LABEL_11:
  if (!v23 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:]();
    if (v24) {
      goto LABEL_16;
    }
  }
  else if (v24)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:]();
  }
LABEL_16:
  v33.receiver = self;
  v33.super_class = (Class)NTForYouSectionFetchDescriptor;
  v26 = [(NTForYouSectionFetchDescriptor *)&v33 init];
  if (v26)
  {
    v27 = [[NTCatchUpOperationForYouRequest alloc] initWithForYouTodaySectionSpecificConfig:v17 appConfiguration:v18 topStoriesChannelID:v19 localNewsTagID:v20 hiddenFeedIDs:v21 allowPaidBundleFeed:v32 mutedTagIDs:v22 purchasedTagIDs:v23 rankedAllSubscribedTagIDs:v24 bundleSubscriptionProvider:v25 throttlingIdentifier:&stru_26D9160F8];
    forYouRequest = v26->_forYouRequest;
    v26->_forYouRequest = v27;

    v26->_localNewsPromotionIndex = [v17 localNewsPromotionIndex];
    uint64_t v29 = [v20 copy];
    localNewsTagID = v26->_localNewsTagID;
    v26->_localNewsTagID = (NSString *)v29;
  }
  return v26;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(NTForYouSectionFetchDescriptor *)self forYouRequest];
  [v5 setForYouRequest:v4];

  [v5 setForYouEnabled:1];
}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  return (id)[a3 forYouResults];
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  uint64_t v4 = [MEMORY[0x263F594A0] transformationWithPersonalizer:a3 configurationSet:16];
  id v5 = [[NTFeedTransformationItemFeedTransformation alloc] initWithFeedItemTransformation:v4];
  id v6 = [NTLocalNewsPromotionTransformation alloc];
  v7 = [(NTForYouSectionFetchDescriptor *)self localNewsTagID];
  v8 = [(NTLocalNewsPromotionTransformation *)v6 initWithLocalNewsTagID:v7 localNewsPromotionIndex:[(NTForYouSectionFetchDescriptor *)self localNewsPromotionIndex] baseTransformation:v5];

  return v8;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v7 = a3;
  v8 = objc_msgSend(a5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_2);
  __int16 v9 = [[NTFeedTransformationIncrementalPersonalizedDiversifiedLimit alloc] initWithFunctionProvider:v7 limit:a4 priorFeedItems:v8];

  v10 = [[NTFeedTransformationItemFeedTransformation alloc] initWithFeedItemTransformation:v9];

  return v10;
}

uint64_t __106__NTForYouSectionFetchDescriptor_incrementalLimitTransformationWithFeedPersonalizer_limit_priorFeedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 feedTransformationItem];
}

- (NTCatchUpOperationForYouRequest)forYouRequest
{
  return self->_forYouRequest;
}

- (NSString)localNewsTagID
{
  return self->_localNewsTagID;
}

- (unint64_t)localNewsPromotionIndex
{
  return self->_localNewsPromotionIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localNewsTagID, 0);

  objc_storeStrong((id *)&self->_forYouRequest, 0);
}

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"rankedAllSubscribedTagIDs", v6, 2u);
}

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"purchasedTagIDs", v6, 2u);
}

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"mutedTagIDs", v6, 2u);
}

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"hiddenFeedIDs", v6, 2u);
}

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfiguration", v6, 2u);
}

- (void)initWithForYouConfiguration:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"forYouConfiguration", v6, 2u);
}

@end