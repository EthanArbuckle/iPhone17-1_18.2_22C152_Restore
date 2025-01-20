@interface NTPBFeedPersonalizingItem(FCAdditions)
- (char)initWithItem:()FCAdditions;
- (double)globalUserFeedback;
- (uint64_t)halfLife;
- (uint64_t)hasGlobalUserFeedback;
- (uint64_t)hasThumbnail;
- (uint64_t)isHiddenFromAutoFavorites;
- (uint64_t)publishDate;
- (uint64_t)scoreProfile;
- (uint64_t)sourceFeedID;
- (void)enumerateTopicCohortsWithBlock:()FCAdditions;
- (void)enumerateTopicConversionStatsWithBlock:()FCAdditions;
- (void)setScoreProfile:()FCAdditions;
@end

@implementation NTPBFeedPersonalizingItem(FCAdditions)

- (char)initWithItem:()FCAdditions
{
  id v4 = a3;
  v18.receiver = a1;
  v18.super_class = (Class)&off_1EF9425C8;
  v5 = (char *)objc_msgSendSuper2(&v18, sel_init);
  if (v5)
  {
    v6 = [v4 itemID];
    [v5 setIdentifier:v6];

    v7 = [v4 topicIDs];
    [v5 setTopicIDs:v7];

    v8 = [v4 publisherID];
    [v5 setPublisherID:v8];

    objc_msgSend(v5, "setBodyTextLength:", objc_msgSend(v4, "bodyTextLength"));
    objc_msgSend(v5, "setHasAudioTrack:", objc_msgSend(v4, "hasAudioTrack"));
    objc_msgSend(v5, "setIsFeatured:", objc_msgSend(v4, "isFeatured"));
    objc_msgSend(v5, "setIsANF:", objc_msgSend(v4, "isANF"));
    objc_msgSend(v5, "setIsPaid:", objc_msgSend(v4, "isPaid"));
    objc_msgSend(v5, "setIsBundlePaid:", objc_msgSend(v4, "isBundlePaid"));
    objc_msgSend(v5, "setHasVideo:", objc_msgSend(v4, "hasVideo"));
    objc_msgSend(v5, "setIsAIGenerated:", objc_msgSend(v4, "isAIGenerated"));
    v9 = [v4 globalCohorts];
    [v5 setGlobalCohorts:v9];

    v10 = [v4 publisherCohorts];
    [v5 setPublisherCohorts:v10];

    v11 = [v4 globalConversionStats];
    [v5 setGlobalConversionStats:v11];

    v12 = [v4 publisherConversionStats];
    [v5 setPublisherConversionStats:v12];

    v13 = [v4 topics];
    [v5 setTopics:v13];

    v14 = [v4 publishDate];
    objc_msgSend(v5, "setPublishDateMilliseconds:", objc_msgSend(v14, "fc_millisecondTimeIntervalSince1970"));

    v15 = [v4 publisherTagMetadata];
    [v5 setPublisherTagMetadata:v15];

    v16 = [v4 float16TitleEncoding];
    [v5 setFloat16TitleEncoding:v16];

    [v5 setFloat16FullBodyEncoding:*(void *)&v5[*MEMORY[0x1E4F82C78]]];
  }

  return v5;
}

- (uint64_t)publishDate
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v2 = [a1 publishDateMilliseconds];
  return objc_msgSend(v1, "fc_dateWithMillisecondTimeIntervalSince1970:", v2);
}

- (void)enumerateTopicCohortsWithBlock:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 topics];

  if (v5)
  {
    v6 = [a1 topics];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__NTPBFeedPersonalizingItem_FCAdditions__enumerateTopicCohortsWithBlock___block_invoke_2;
    v7[3] = &unk_1E5B509E0;
    id v8 = v4;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

- (void)enumerateTopicConversionStatsWithBlock:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 topics];

  if (v5)
  {
    v6 = [a1 topics];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__NTPBFeedPersonalizingItem_FCAdditions__enumerateTopicConversionStatsWithBlock___block_invoke_2;
    v7[3] = &unk_1E5B509E0;
    id v8 = v4;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

- (uint64_t)sourceFeedID
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"NTPBFeedPersonalizingItem does not support the %s property", "sourceFeedID");
    *(_DWORD *)buf = 136315906;
    v3 = "-[NTPBFeedPersonalizingItem(FCAdditions) sourceFeedID]";
    __int16 v4 = 2080;
    v5 = "NTPBFeedPersonalizingItem+FCAdditions.m";
    __int16 v6 = 1024;
    int v7 = 79;
    __int16 v8 = 2114;
    v9 = v1;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 0;
}

- (double)globalUserFeedback
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"NTPBFeedPersonalizingItem does not support the %s property", "globalUserFeedback");
    *(_DWORD *)buf = 136315906;
    v3 = "-[NTPBFeedPersonalizingItem(FCAdditions) globalUserFeedback]";
    __int16 v4 = 2080;
    v5 = "NTPBFeedPersonalizingItem+FCAdditions.m";
    __int16 v6 = 1024;
    int v7 = 80;
    __int16 v8 = 2114;
    v9 = v1;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 0.0;
}

- (uint64_t)hasGlobalUserFeedback
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"NTPBFeedPersonalizingItem does not support the %s property", "hasGlobalUserFeedback");
    *(_DWORD *)buf = 136315906;
    v3 = "-[NTPBFeedPersonalizingItem(FCAdditions) hasGlobalUserFeedback]";
    __int16 v4 = 2080;
    v5 = "NTPBFeedPersonalizingItem+FCAdditions.m";
    __int16 v6 = 1024;
    int v7 = 81;
    __int16 v8 = 2114;
    v9 = v1;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 0;
}

- (uint64_t)hasThumbnail
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"NTPBFeedPersonalizingItem does not support the %s property", "hasThumbnail");
    *(_DWORD *)buf = 136315906;
    v3 = "-[NTPBFeedPersonalizingItem(FCAdditions) hasThumbnail]";
    __int16 v4 = 2080;
    v5 = "NTPBFeedPersonalizingItem+FCAdditions.m";
    __int16 v6 = 1024;
    int v7 = 82;
    __int16 v8 = 2114;
    v9 = v1;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 0;
}

- (uint64_t)isHiddenFromAutoFavorites
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"NTPBFeedPersonalizingItem does not support the %s property", "isHiddenFromAutoFavorites");
    *(_DWORD *)buf = 136315906;
    v3 = "-[NTPBFeedPersonalizingItem(FCAdditions) isHiddenFromAutoFavorites]";
    __int16 v4 = 2080;
    v5 = "NTPBFeedPersonalizingItem+FCAdditions.m";
    __int16 v6 = 1024;
    int v7 = 83;
    __int16 v8 = 2114;
    v9 = v1;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 0;
}

- (uint64_t)halfLife
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"NTPBFeedPersonalizingItem does not support the %s property", "halfLife");
    *(_DWORD *)buf = 136315906;
    v3 = "-[NTPBFeedPersonalizingItem(FCAdditions) halfLife]";
    __int16 v4 = 2080;
    v5 = "NTPBFeedPersonalizingItem+FCAdditions.m";
    __int16 v6 = 1024;
    int v7 = 84;
    __int16 v8 = 2114;
    v9 = v1;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 0;
}

- (uint64_t)scoreProfile
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"NTPBFeedPersonalizingItem does not support the %s property", "scoreProfile");
    *(_DWORD *)buf = 136315906;
    v3 = "-[NTPBFeedPersonalizingItem(FCAdditions) scoreProfile]";
    __int16 v4 = 2080;
    v5 = "NTPBFeedPersonalizingItem+FCAdditions.m";
    __int16 v6 = 1024;
    int v7 = 86;
    __int16 v8 = 2114;
    v9 = v1;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 0;
}

- (void)setScoreProfile:()FCAdditions
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v0 = (void *)[[NSString alloc] initWithFormat:@"NTPBFeedPersonalizingItem does not support the scoreProfile property"];
    int v1 = 136315906;
    uint64_t v2 = "-[NTPBFeedPersonalizingItem(FCAdditions) setScoreProfile:]";
    __int16 v3 = 2080;
    __int16 v4 = "NTPBFeedPersonalizingItem+FCAdditions.m";
    __int16 v5 = 1024;
    int v6 = 89;
    __int16 v7 = 2114;
    __int16 v8 = v0;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
  }
}

@end