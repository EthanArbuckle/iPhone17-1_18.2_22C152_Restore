@interface FCMutableTodayPrivateData
- (FCMutableTodayPrivateData)init;
- (FCMutableTodayPrivateData)initWithDictionary:(id)a3;
- (void)_deleteObjectsForOldKeys;
- (void)setAutoFavoriteTagIDs:(id)a3;
- (void)setBundleSubscription:(id)a3;
- (void)setDerivedPersonalizationData:(id)a3;
- (void)setGroupableTagIDs:(id)a3;
- (void)setLocalNewsTagID:(id)a3;
- (void)setMutedTagIDs:(id)a3;
- (void)setPurchasedTagIDs:(id)a3;
- (void)setRankedAllSubscribedTagIDs:(id)a3;
- (void)setRankedAllSubscriptionDates:(id)a3;
- (void)setRecentlyReadHistoryItems:(id)a3;
- (void)setRecentlySeenHistoryItems:(id)a3;
- (void)setUserEmbeddingData:(id)a3;
@end

@implementation FCMutableTodayPrivateData

- (FCMutableTodayPrivateData)initWithDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "dictionary");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCMutableTodayPrivateData initWithDictionary:]";
    __int16 v12 = 2080;
    v13 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v14 = 1024;
    int v15 = 246;
    __int16 v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v9.receiver = self;
  v9.super_class = (Class)FCMutableTodayPrivateData;
  v5 = [(FCTodayPrivateData *)&v9 initWithDictionary:v4];
  v6 = v5;
  if (v5) {
    [(FCMutableTodayPrivateData *)v5 _deleteObjectsForOldKeys];
  }

  return v6;
}

- (void)_deleteObjectsForOldKeys
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v2 = [(FCTodayPrivateData *)self dictionary];
  v4[0] = @"FCTodayWidgetDropboxDataRecentlyReadArticlesDataDictionaryKey";
  v4[1] = @"FCTodayWidgetPrivateDataRecentlySeenArticlesDataDictionaryKey2";
  v4[2] = @"FCTodayWidgetPrivateDataRecentlyReadHistoryItemsDataDictionaryKey";
  v4[3] = @"FCTodayWidgetDropboxDataFeldsparIDDictionaryKey";
  v4[4] = @"FCTodayPrivateDataBundleSubscriptionStateDictionaryKey";
  v4[5] = @"FCTodayPrivateDataBundleIAPDictionaryKey";
  v4[6] = @"FCTodayPrivateDataAutoFavoriteTagIDsDataDictionaryKey";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  [v2 removeObjectsForKeys:v3];
}

- (FCMutableTodayPrivateData)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCMutableTodayPrivateData init]";
    __int16 v9 = 2080;
    v10 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v11 = 1024;
    int v12 = 241;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCMutableTodayPrivateData init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)setDerivedPersonalizationData:(id)a3
{
  id v4 = a3;
  id v6 = [(FCTodayPrivateData *)self dictionary];
  v5 = (void *)[v4 copy];

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCTodayWidgetDropboxDataDerivedPersonalizationDataDictionaryKey");
}

- (void)setLocalNewsTagID:(id)a3
{
  id v4 = a3;
  id v5 = [(FCTodayPrivateData *)self dictionary];
  objc_msgSend(v5, "fc_safelySetObjectAllowingNil:forKey:", v4, @"FCTodayPrivateDataLocalNewsTagIDDataDictionaryKey");
}

- (void)setMutedTagIDs:(id)a3
{
  id v4 = a3;
  id v6 = [(FCTodayPrivateData *)self dictionary];
  id v5 = (void *)[v4 copy];

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCTodayWidgetDropboxDataMutedTagIDsDataDictionaryKey");
}

- (void)setAutoFavoriteTagIDs:(id)a3
{
  id v4 = a3;
  id v6 = [(FCTodayPrivateData *)self dictionary];
  id v5 = (void *)[v4 copy];

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCTodayPrivateDataAutoFavoriteTagIDsDataDictionaryKey2");
}

- (void)setGroupableTagIDs:(id)a3
{
  id v4 = a3;
  id v6 = [(FCTodayPrivateData *)self dictionary];
  id v5 = (void *)[v4 copy];

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCTodayPrivateDataGroupableTagIDsDataDictionaryKey");
}

- (void)setPurchasedTagIDs:(id)a3
{
  id v4 = a3;
  id v6 = [(FCTodayPrivateData *)self dictionary];
  id v5 = (void *)[v4 copy];

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCTodayWidgetDropboxDataPurchasedTagIDsDataDictionaryKey");
}

- (void)setRankedAllSubscribedTagIDs:(id)a3
{
  id v4 = a3;
  id v6 = [(FCTodayPrivateData *)self dictionary];
  id v5 = (void *)[v4 copy];

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCTodayWidgetDropboxDataRankedSubscribedTagIDsDataDictionaryKey");
}

- (void)setRankedAllSubscriptionDates:(id)a3
{
  id v4 = a3;
  id v6 = [(FCTodayPrivateData *)self dictionary];
  id v5 = (void *)[v4 copy];

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCTodayPrivateDataRankedAllSubscriptionDatesDataDictionaryKey");
}

- (void)setRecentlyReadHistoryItems:(id)a3
{
  id v4 = a3;
  id v6 = [(FCTodayPrivateData *)self dictionary];
  id v5 = (void *)[v4 copy];

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCTodayWidgetPrivateDataRecentlyReadHistoryItemsDataDictionaryKey2");
}

- (void)setRecentlySeenHistoryItems:(id)a3
{
  id v4 = a3;
  id v6 = [(FCTodayPrivateData *)self dictionary];
  id v5 = (void *)[v4 copy];

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCTodayWidgetPrivateDataRecentlySeenHistoryItemsDataDictionaryKey");
}

- (void)setBundleSubscription:(id)a3
{
  id v4 = a3;
  id v6 = [(FCTodayPrivateData *)self dictionary];
  id v5 = (void *)[v4 copy];

  [v6 setObject:v5 forKey:@"FCTodayPrivateDataBundleSubscriptionDataDictionaryKey"];
}

- (void)setUserEmbeddingData:(id)a3
{
  id v4 = a3;
  id v6 = [(FCTodayPrivateData *)self dictionary];
  id v5 = (void *)[v4 copy];

  objc_msgSend(v6, "fc_safelySetObjectAllowingNil:forKey:", v5, @"FCTodayPrivateDataUserEmbeddingDataDictionaryKey");
}

@end