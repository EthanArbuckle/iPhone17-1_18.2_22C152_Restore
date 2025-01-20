@interface NTCatchUpOperationForYouRequest
- (BOOL)allowPaidBundleFeed;
- (FCBundleSubscriptionProviderType)bundleSubscriptionProvider;
- (NSArray)rankedSubscribedTagIDs;
- (NSSet)hiddenFeedIDs;
- (NSSet)mutedTagIDs;
- (NSSet)purchasedTagIDs;
- (NSString)localNewsTagID;
- (NSString)throttlingIdentifier;
- (NSString)topStoriesChannelID;
- (NTCatchUpOperationForYouRequest)init;
- (NTCatchUpOperationForYouRequest)initWithForYouTodaySectionSpecificConfig:(id)a3 appConfiguration:(id)a4 topStoriesChannelID:(id)a5 localNewsTagID:(id)a6 hiddenFeedIDs:(id)a7 allowPaidBundleFeed:(BOOL)a8 mutedTagIDs:(id)a9 purchasedTagIDs:(id)a10 rankedAllSubscribedTagIDs:(id)a11 bundleSubscriptionProvider:(id)a12 throttlingIdentifier:(id)a13;
- (double)minimumUpdateInterval;
- (int64_t)cutoffTime;
- (int64_t)fetchingBin;
- (unint64_t)feedMaxCount;
- (unint64_t)headlinesPerFeedFetchCount;
@end

@implementation NTCatchUpOperationForYouRequest

- (NTCatchUpOperationForYouRequest)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTCatchUpOperationForYouRequest init]";
    __int16 v9 = 2080;
    v10 = "NTCatchUpOperationRequest.m";
    __int16 v11 = 1024;
    int v12 = 15;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTCatchUpOperationForYouRequest init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTCatchUpOperationForYouRequest)initWithForYouTodaySectionSpecificConfig:(id)a3 appConfiguration:(id)a4 topStoriesChannelID:(id)a5 localNewsTagID:(id)a6 hiddenFeedIDs:(id)a7 allowPaidBundleFeed:(BOOL)a8 mutedTagIDs:(id)a9 purchasedTagIDs:(id)a10 rankedAllSubscribedTagIDs:(id)a11 bundleSubscriptionProvider:(id)a12 throttlingIdentifier:(id)a13
{
  id v17 = a3;
  id v49 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  if (!v17 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:].cold.6();
    if (v20) {
      goto LABEL_6;
    }
  }
  else if (v20)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:].cold.5();
  }
LABEL_6:
  if (!v21 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:].cold.4();
    if (v22) {
      goto LABEL_11;
    }
  }
  else if (v22)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:]();
  }
LABEL_11:
  if (!v23 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:]();
    if (v25) {
      goto LABEL_16;
    }
  }
  else if (v25)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTCatchUpOperationForYouRequest initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:]();
  }
LABEL_16:
  v50.receiver = self;
  v50.super_class = (Class)NTCatchUpOperationForYouRequest;
  v26 = [(NTCatchUpOperationForYouRequest *)&v50 init];
  if (v26)
  {
    id v48 = v24;
    uint64_t v27 = [v18 copy];
    topStoriesChannelID = v26->_topStoriesChannelID;
    v26->_topStoriesChannelID = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    localNewsTagID = v26->_localNewsTagID;
    v26->_localNewsTagID = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    hiddenFeedIDs = v26->_hiddenFeedIDs;
    v26->_hiddenFeedIDs = (NSSet *)v31;

    v26->_allowPaidBundleFeed = a8;
    uint64_t v33 = [v21 copy];
    mutedTagIDs = v26->_mutedTagIDs;
    v26->_mutedTagIDs = (NSSet *)v33;

    uint64_t v35 = [v22 copy];
    purchasedTagIDs = v26->_purchasedTagIDs;
    v26->_purchasedTagIDs = (NSSet *)v35;

    uint64_t v37 = objc_msgSend(v23, "fc_subarrayWithMaxCount:", objc_msgSend(v17, "subscriptionsFetchCount"));
    rankedSubscribedTagIDs = v26->_rankedSubscribedTagIDs;
    v26->_rankedSubscribedTagIDs = (NSArray *)v37;

    objc_storeStrong((id *)&v26->_bundleSubscriptionProvider, a12);
    v26->_cutoffTime = [v17 cutoffTime];
    v26->_headlinesPerFeedFetchCount = [v17 headlinesPerFeedFetchCount];
    v26->_feedMaxCount = [v17 feedMaxCount];
    int v39 = [v17 fetchingBin];
    uint64_t v40 = v39 == 1;
    if (v39 == 2) {
      uint64_t v40 = 2;
    }
    v26->_fetchingBin = v40;
    uint64_t v41 = [v25 copy];
    throttlingIdentifier = v26->_throttlingIdentifier;
    v26->_throttlingIdentifier = (NSString *)v41;

    uint64_t v43 = [v49 widgetForYouBackgroundMinimumUpdateInterval];
    if ([v17 hasMinimumUpdateInterval]) {
      double v44 = (double)(unint64_t)[v17 minimumUpdateInterval];
    }
    else {
      double v44 = (double)v43;
    }
    v26->_minimumUpdateInterval = v44;
    id v24 = v48;
  }

  return v26;
}

- (NSString)topStoriesChannelID
{
  return self->_topStoriesChannelID;
}

- (NSString)localNewsTagID
{
  return self->_localNewsTagID;
}

- (NSSet)hiddenFeedIDs
{
  return self->_hiddenFeedIDs;
}

- (BOOL)allowPaidBundleFeed
{
  return self->_allowPaidBundleFeed;
}

- (NSSet)mutedTagIDs
{
  return self->_mutedTagIDs;
}

- (NSSet)purchasedTagIDs
{
  return self->_purchasedTagIDs;
}

- (NSArray)rankedSubscribedTagIDs
{
  return self->_rankedSubscribedTagIDs;
}

- (FCBundleSubscriptionProviderType)bundleSubscriptionProvider
{
  return self->_bundleSubscriptionProvider;
}

- (int64_t)cutoffTime
{
  return self->_cutoffTime;
}

- (unint64_t)headlinesPerFeedFetchCount
{
  return self->_headlinesPerFeedFetchCount;
}

- (unint64_t)feedMaxCount
{
  return self->_feedMaxCount;
}

- (int64_t)fetchingBin
{
  return self->_fetchingBin;
}

- (NSString)throttlingIdentifier
{
  return self->_throttlingIdentifier;
}

- (double)minimumUpdateInterval
{
  return self->_minimumUpdateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlingIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_rankedSubscribedTagIDs, 0);
  objc_storeStrong((id *)&self->_purchasedTagIDs, 0);
  objc_storeStrong((id *)&self->_mutedTagIDs, 0);
  objc_storeStrong((id *)&self->_hiddenFeedIDs, 0);
  objc_storeStrong((id *)&self->_localNewsTagID, 0);

  objc_storeStrong((id *)&self->_topStoriesChannelID, 0);
}

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"throttlingIdentifier", v6, 2u);
}

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"rankedAllSubscribedTagIDs", v6, 2u);
}

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"purchasedTagIDs", v6, 2u);
}

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"mutedTagIDs", v6, 2u);
}

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"hiddenFeedIDs", v6, 2u);
}

- (void)initWithForYouTodaySectionSpecificConfig:appConfiguration:topStoriesChannelID:localNewsTagID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:throttlingIdentifier:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"forYouTodaySectionSpecificConfig", v6, 2u);
}

@end