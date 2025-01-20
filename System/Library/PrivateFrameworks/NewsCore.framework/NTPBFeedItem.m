@interface NTPBFeedItem
@end

@implementation NTPBFeedItem

void __76__NTPBFeedItem_FCFeedItem__keysForFeedItemAndArticleRecordWithRecordSource___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F82A50];
  id v4 = a2;
  v5 = [v3 baseKeysForFeedItemRecord];
  [v4 addObjectsFromArray:v5];

  v6 = [MEMORY[0x1E4F82A50] baseKeysForArticleRecord];
  [v4 addObjectsFromArray:v6];

  v7 = [*(id *)(a1 + 32) engagementRecordKeys];
  [v4 addObjectsFromArray:v7];

  v8 = [*(id *)(a1 + 32) conversionRecordKeys];
  [v4 addObjectsFromArray:v8];

  v9 = [*(id *)(a1 + 32) topicFlagsRecordKeys];
  [v4 addObjectsFromArray:v9];

  v10 = [*(id *)(a1 + 32) articleTagMetadataRecordKeys];
  [v4 addObjectsFromArray:v10];

  id v11 = [*(id *)(a1 + 32) embeddingRecordKeys];
  [v4 addObjectsFromArray:v11];
}

uint64_t __53__NTPBFeedItem_FCFeedItem__baseKeysForFeedItemRecord__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", &__block_literal_global_7_1);
  uint64_t v1 = _MergedGlobals_191;
  _MergedGlobals_191 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __53__NTPBFeedItem_FCFeedItem__baseKeysForFeedItemRecord__block_invoke_3(uint64_t a1, void *a2)
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = @"tagID";
  v5[1] = @"articleID";
  v5[2] = @"order";
  v5[3] = @"userFeedback";
  v5[4] = @"publishDateMillis";
  v5[5] = @"tagHalfLifeMillis";
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:v5 count:6];
  [v3 addObjectsFromArray:v4];
}

void __65__NTPBFeedItem_FCFeedItem__keysForArticleRecordWithRecordSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F82A50];
  id v4 = a2;
  v5 = [v3 baseKeysForArticleRecord];
  [v4 addObjectsFromArray:v5];

  v6 = [*(id *)(a1 + 32) engagementRecordKeys];
  [v4 addObjectsFromArray:v6];

  v7 = [*(id *)(a1 + 32) conversionRecordKeys];
  [v4 addObjectsFromArray:v7];

  v8 = [*(id *)(a1 + 32) topicFlagsRecordKeys];
  [v4 addObjectsFromArray:v8];

  v9 = [*(id *)(a1 + 32) articleTagMetadataRecordKeys];
  [v4 addObjectsFromArray:v9];

  id v10 = [*(id *)(a1 + 32) embeddingRecordKeys];
  [v4 addObjectsFromArray:v10];
}

uint64_t __52__NTPBFeedItem_FCFeedItem__baseKeysForArticleRecord__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", &__block_literal_global_13_2);
  uint64_t v1 = qword_1EB5D17F8;
  qword_1EB5D17F8 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __52__NTPBFeedItem_FCFeedItem__baseKeysForArticleRecord__block_invoke_3(uint64_t a1, void *a2)
{
  v5[26] = *MEMORY[0x1E4F143B8];
  v5[0] = @"allowedStorefrontIDs";
  v5[1] = @"behaviorFlags";
  v5[2] = @"blockedStorefrontIDs";
  v5[3] = @"bodyTextLength";
  v5[4] = @"clusterID";
  v5[5] = @"contentType";
  v5[6] = @"halfLifeMillis";
  void v5[7] = @"isBundlePaid";
  v5[8] = @"isFeature";
  v5[9] = @"isIssueOnly";
  v5[10] = @"isPaid";
  v5[11] = @"isSponsored";
  v5[12] = @"language";
  v5[13] = @"minNewsVersion";
  v5[14] = @"narrativeTrackFullURL";
  v5[15] = @"parentIssueID";
  v5[16] = @"primaryAudience";
  v5[17] = @"publishDate";
  v5[18] = @"publisherArticleVersion";
  v5[19] = @"role";
  v5[20] = @"scoresTopicTagIDs";
  v5[21] = @"sourceChannelTagID";
  v5[22] = @"thumbnailMetadata";
  v5[23] = @"thumbnailPerceptualHash";
  v5[24] = @"videoURL";
  v5[25] = @"expirationData";
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:v5 count:26];
  [v3 addObjectsFromArray:v4];
}

uint64_t __75__NTPBFeedItem_FCFeedItem__feedItemFromCKRecord_storefrontID_recordSource___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v3 = (void *)[[NSString alloc] initWithFormat:@"FeedItem must always have a valid articleID, record: %@", *(void *)(a1 + 32)];
    *(_DWORD *)buf = 136315906;
    v5 = "+[NTPBFeedItem(FCFeedItem) feedItemFromCKRecord:storefrontID:recordSource:]_block_invoke";
    __int16 v6 = 2080;
    v7 = "FCFeedItem.m";
    __int16 v8 = 1024;
    int v9 = 141;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 0;
}

void __59__NTPBFeedItem_FCFeedItem__enumerateTopicCohortsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 tagID];
  id v4 = [v3 cohorts];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __67__NTPBFeedItem_FCFeedItem__enumerateTopicConversionStatsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 tagID];
  id v4 = [v3 conversionStats];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

@end