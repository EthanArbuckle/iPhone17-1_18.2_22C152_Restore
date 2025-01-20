@interface FCTodayPrivateData
- (FCBundleSubscription)bundleSubscription;
- (FCDerivedPersonalizationData)derivedPersonalizationData;
- (FCTodayPrivateData)init;
- (FCTodayPrivateData)initWithDictionary:(id)a3;
- (NSArray)autoFavoriteTagIDs;
- (NSArray)rankedAllSubscribedTagIDs;
- (NSArray)rankedAllSubscriptionDates;
- (NSArray)recentlySeenHistoryItems;
- (NSData)userEmbeddingData;
- (NSDictionary)dictionary;
- (NSDictionary)recentlyReadHistoryItems;
- (NSNumber)onboardingVersion;
- (NSSet)groupableTagIDs;
- (NSSet)mutedTagIDs;
- (NSSet)purchasedTagIDs;
- (NSString)localNewsTagID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)prepareForUseWithCompletion:(id)a3;
@end

@implementation FCTodayPrivateData

- (FCTodayPrivateData)initWithDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "dictionary");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCTodayPrivateData initWithDictionary:]";
    __int16 v13 = 2080;
    v14 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v15 = 1024;
    int v16 = 140;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCTodayPrivateData;
  v6 = [(FCTodayPrivateData *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionary, a3);
  }

  return v7;
}

- (NSSet)purchasedTagIDs
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayWidgetDropboxDataPurchasedTagIDsDataDictionaryKey"];

  return (NSSet *)v3;
}

- (FCBundleSubscription)bundleSubscription
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayPrivateDataBundleSubscriptionDataDictionaryKey"];
  v4 = (void *)[v3 copy];

  return (FCBundleSubscription *)v4;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

- (FCTodayPrivateData)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTodayPrivateData init]";
    __int16 v9 = 2080;
    objc_super v10 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v11 = 1024;
    int v12 = 135;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTodayPrivateData init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCDerivedPersonalizationData)derivedPersonalizationData
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayWidgetDropboxDataDerivedPersonalizationDataDictionaryKey"];

  return (FCDerivedPersonalizationData *)v3;
}

- (NSString)localNewsTagID
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayPrivateDataLocalNewsTagIDDataDictionaryKey"];

  return (NSString *)v3;
}

- (NSSet)mutedTagIDs
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayWidgetDropboxDataMutedTagIDsDataDictionaryKey"];

  return (NSSet *)v3;
}

- (NSArray)autoFavoriteTagIDs
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayPrivateDataAutoFavoriteTagIDsDataDictionaryKey2"];

  return (NSArray *)v3;
}

- (NSArray)rankedAllSubscribedTagIDs
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayWidgetDropboxDataRankedSubscribedTagIDsDataDictionaryKey"];

  return (NSArray *)v3;
}

- (NSArray)rankedAllSubscriptionDates
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayPrivateDataRankedAllSubscriptionDatesDataDictionaryKey"];

  return (NSArray *)v3;
}

- (NSDictionary)recentlyReadHistoryItems
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayWidgetPrivateDataRecentlyReadHistoryItemsDataDictionaryKey2"];

  return (NSDictionary *)v3;
}

- (NSArray)recentlySeenHistoryItems
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayWidgetPrivateDataRecentlySeenHistoryItemsDataDictionaryKey"];

  return (NSArray *)v3;
}

- (NSNumber)onboardingVersion
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayPrivateDataOnboardingVersionDictionaryKey"];

  return (NSNumber *)v3;
}

- (NSData)userEmbeddingData
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayPrivateDataUserEmbeddingDataDictionaryKey"];

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[FCTodayPrivateData allocWithZone:](FCTodayPrivateData, "allocWithZone:");
  id v6 = [(FCTodayPrivateData *)self dictionary];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = [(FCTodayPrivateData *)v5 initWithDictionary:v7];

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = +[FCMutableTodayPrivateData allocWithZone:](FCMutableTodayPrivateData, "allocWithZone:");
  id v6 = [(FCTodayPrivateData *)self dictionary];
  v7 = (void *)[v6 mutableCopyWithZone:a3];
  v8 = [(FCMutableTodayPrivateData *)v5 initWithDictionary:v7];

  return v8;
}

- (NSSet)groupableTagIDs
{
  v2 = [(FCTodayPrivateData *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"FCTodayPrivateDataGroupableTagIDsDataDictionaryKey"];

  return (NSSet *)v3;
}

- (void)prepareForUseWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

@end