@interface NTPBFeedItem(FCFeedItem)
+ (id)baseKeysForArticleRecord;
+ (id)baseKeysForFeedItemRecord;
+ (id)feedItemFromCKRecord:()FCFeedItem storefrontID:recordSource:;
+ (id)keysForArticleRecordWithRecordSource:()FCFeedItem;
+ (id)keysForFeedItemAndArticleRecordWithRecordSource:()FCFeedItem;
- (BOOL)isANF;
- (BOOL)isEqual:()FCFeedItem;
- (id)description;
- (id)scoreProfile;
- (uint64_t)applyConditionalScore:()FCFeedItem;
- (uint64_t)canBePurchased;
- (uint64_t)compareGlobalUserFeedback:()FCFeedItem;
- (uint64_t)compareGlobalUserFeedbackDescending:()FCFeedItem;
- (uint64_t)compareOrder:()FCFeedItem;
- (uint64_t)compareOrderDescending:()FCFeedItem;
- (uint64_t)hasFeature:()FCFeedItem;
- (uint64_t)hash;
- (uint64_t)markAsEvergreen;
- (uint64_t)mustShow;
- (uint64_t)publishDate;
- (uint64_t)publisherArticleVersion;
- (void)addSurfacedByArticleListID:()FCFeedItem;
- (void)enumerateFeaturesWithBlock:()FCFeedItem;
- (void)enumerateTopicCohortsWithBlock:()FCFeedItem;
- (void)enumerateTopicConversionStatsWithBlock:()FCFeedItem;
- (void)setScoreProfile:()FCFeedItem;
@end

@implementation NTPBFeedItem(FCFeedItem)

- (uint64_t)markAsEvergreen
{
  return [a1 setIsEvergreen:1];
}

- (uint64_t)applyConditionalScore:()FCFeedItem
{
  [a1 conditionalScore];
  if (v4 <= a2) {
    double v4 = a2;
  }
  return [a1 setConditionalScore:v4];
}

+ (id)keysForFeedItemAndArticleRecordWithRecordSource:()FCFeedItem
{
  id v3 = a3;
  double v4 = (void *)MEMORY[0x1E4F1C978];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NTPBFeedItem_FCFeedItem__keysForFeedItemAndArticleRecordWithRecordSource___block_invoke;
  v8[3] = &unk_1E5B4BF30;
  id v9 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "fc_array:", v8);

  return v6;
}

+ (id)baseKeysForFeedItemRecord
{
  if (qword_1EB5D17F0 != -1) {
    dispatch_once(&qword_1EB5D17F0, &__block_literal_global_5_1);
  }
  v0 = (void *)_MergedGlobals_191;
  return v0;
}

+ (id)keysForArticleRecordWithRecordSource:()FCFeedItem
{
  id v3 = a3;
  double v4 = (void *)MEMORY[0x1E4F1C978];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__NTPBFeedItem_FCFeedItem__keysForArticleRecordWithRecordSource___block_invoke;
  v8[3] = &unk_1E5B4BF30;
  id v9 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "fc_array:", v8);

  return v6;
}

+ (id)baseKeysForArticleRecord
{
  if (qword_1EB5D1800 != -1) {
    dispatch_once(&qword_1EB5D1800, &__block_literal_global_11_3);
  }
  v0 = (void *)qword_1EB5D17F8;
  return v0;
}

+ (id)feedItemFromCKRecord:()FCFeedItem storefrontID:recordSource:
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(id)objc_opt_class() identifierFromCKRecord:v7];
  if (![v10 length])
  {
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __75__NTPBFeedItem_FCFeedItem__feedItemFromCKRecord_storefrontID_recordSource___block_invoke;
    v83[3] = &unk_1E5B4C840;
    id v84 = v7;
    __75__NTPBFeedItem_FCFeedItem__feedItemFromCKRecord_storefrontID_recordSource___block_invoke((uint64_t)v83);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v84;
    goto LABEL_46;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F82A50]);
  [v11 setArticleID:v10];
  v12 = [v7 objectForKey:@"sourceChannelTagID"];
  [v11 setSourceChannelID:v12];

  v13 = [v7 objectForKey:@"parentIssueID"];
  [v11 setParentIssueID:v13];
  [v11 setIsEvergreen:v13 != 0];
  v14 = [v7 objectForKey:@"clusterID"];
  [v11 setClusterID:v14];

  v15 = [v7 objectForKey:@"contentType"];
  [v11 setContentType:FCArticleContentTypeFromString(v15)];

  v16 = [v7 objectForKey:@"scoresTopicTagIDs"];
  v17 = (void *)[v16 mutableCopy];
  [v11 setTopicIDs:v17];

  v18 = [v7 objectForKey:@"bodyTextLength"];
  objc_msgSend(v11, "setBodyTextLength:", objc_msgSend(v18, "longLongValue"));

  v19 = [v7 objectForKey:@"language"];
  [v11 setLanguage:v19];

  v20 = [v7 objectForKey:@"role"];

  if (v20)
  {
    v21 = [v7 objectForKey:@"role"];
    objc_msgSend(v11, "setIsFeatured:", objc_msgSend(v21, "caseInsensitiveCompare:", @"feature") == 0);
  }
  v22 = +[FCRestrictions sharedInstance];
  v23 = [v7 objectForKey:@"allowedStorefrontIDs"];
  v24 = [v7 objectForKey:@"blockedStorefrontIDs"];
  id v82 = v8;
  int v25 = [v22 isContentBlockedInStorefrontID:v8 withAllowedStorefrontIDs:v23 blockedStorefrontIDs:v24];

  if (v25) {
    [v11 setIsFromBlockedStorefront:1];
  }
  v26 = [v7 objectForKey:@"primaryAudience"];
  int v27 = [v26 isEqualToString:@"MATURE"];

  if (v27) {
    [v11 setIsExplicitContent:1];
  }
  v28 = [v7 objectForKey:@"minNewsVersion"];
  int64_t v29 = +[FCRestrictions integerRepresentationOfShortVersionString:v28] << 32;

  if (v29) {
    [v11 setMinimumNewsVersion:v29 >> 32];
  }
  v30 = [v7 objectForKey:@"thumbnailMetadata"];
  uint64_t v31 = [v30 unsignedLongLongValue];

  if (v31) {
    [v11 setHasThumbnail:1];
  }
  v32 = [v7 objectForKey:@"thumbnailPerceptualHash"];
  [v11 setThumbnailPerceptualHash:v32];

  v33 = [v7 objectForKey:@"isPaid"];
  int v34 = [v33 BOOLValue];

  if (v34) {
    [v11 setIsPaid:1];
  }
  v35 = [v7 objectForKey:@"isBundlePaid"];
  int v36 = [v35 BOOLValue];

  if (v36) {
    [v11 setIsBundlePaid:1];
  }
  v37 = [v7 objectForKey:@"isSponsored"];
  int v38 = [v37 BOOLValue];

  if (v38) {
    [v11 setIsSponsored:1];
  }
  v39 = [v7 objectForKey:@"videoURL"];

  if (v39) {
    [v11 setHasVideo:1];
  }
  v40 = [v7 objectForKey:@"videoStillImage"];

  if (v40) {
    [v11 setHasVideoStillImage:1];
  }
  v41 = [v7 objectForKey:@"narrativeTrackFullURL"];

  if (v41) {
    [v11 setHasAudioTrack:1];
  }
  v42 = [v7 objectForKey:@"behaviorFlags"];
  char v43 = [v42 unsignedIntegerValue];

  if ((v43 & 0x20) != 0) {
    [v11 setIsHiddenFromAutoFavorites:1];
  }
  v44 = [v7 objectForKey:@"behaviorFlags"];
  __int16 v45 = [v44 unsignedIntegerValue];

  if ((v45 & 0x800) != 0) {
    [v11 setReduceVisibility:1];
  }
  v46 = [v7 objectForKey:@"behaviorFlags"];
  __int16 v47 = [v46 unsignedIntegerValue];

  if ((v47 & 0x2000) != 0) {
    [v11 setReduceVisibilityForNonFollowers:1];
  }
  v48 = [v7 objectForKey:@"behaviorFlags"];
  __int16 v49 = [v48 unsignedIntegerValue];

  if ((v49 & 0x1000) != 0) {
    [v11 setWebConverted:1];
  }
  v50 = [v7 objectForKey:@"behaviorFlags"];
  __int16 v51 = [v50 unsignedIntegerValue];

  if (v51 < 0) {
    [v11 setIsAIGenerated:1];
  }
  v52 = [v7 objectForKey:@"isFeature"];
  int v53 = [v52 BOOLValue];

  if (v53) {
    [v11 setIsFeatureCandidate:1];
  }
  v54 = [v7 objectForKey:@"isIssueOnly"];
  int v55 = [v54 BOOLValue];

  if (v55) {
    [v11 setIsIssueOnly:1];
  }
  v56 = [v7 objectForKey:@"publisherArticleVersion"];
  objc_msgSend(v11, "setPublisherArticleVersion:", objc_msgSend(v56, "longLongValue"));

  v57 = [v9 engagementFromCKRecord:v7];
  v58 = [v57 globalCohorts];
  [v11 setGlobalCohorts:v58];

  v59 = [v57 sourceChannelCohorts];
  [v11 setSourceChannelCohorts:v59];

  v60 = [v9 conversionStatsFromCKRecord:v7];
  v61 = [v60 globalConversionStats];
  [v11 setGlobalConversionStats:v61];

  v62 = [v60 channelConversionStats];
  [v11 setChannelConversionStats:v62];

  v63 = [v9 articleTagMetadataFromCKRecord:v7];
  v64 = [v63 channelTagMetadata];
  [v11 setChannelTagMetadata:v64];

  id v65 = objc_alloc(MEMORY[0x1E4F82920]);
  v66 = [v7 objectForKey:@"expirationData"];
  v67 = (void *)[v65 initWithData:v66];
  [v11 setExpirationData:v67];

  v68 = [v63 topicTagMetadatas];
  v69 = [v9 articleTopicsFromCKRecord:v7 engagement:v57 conversionStats:v60 tagMetadata:v68];
  [v11 setTopics:v69];

  v70 = [v7 recordType];
  LODWORD(v69) = [v70 isEqualToString:@"Article"];

  if (v69)
  {
    v71 = [v7 objectForKey:@"publishDate"];
    objc_msgSend(v11, "setPublishDateMilliseconds:", objc_msgSend(v71, "fc_millisecondTimeIntervalSince1970"));

    v72 = [v7 objectForKey:@"halfLifeMillis"];
    objc_msgSend(v11, "setFeedHalfLifeMilliseconds:", objc_msgSend(v72, "unsignedLongLongValue"));
  }
  else
  {
    v73 = [v7 recordType];
    int v74 = [v73 isEqualToString:@"FeedItemAndArticle"];

    if (v74)
    {
      v75 = [v7 objectForKey:@"tagID"];
      [v11 setFeedID:v75];

      v76 = [v7 objectForKey:@"order"];
      objc_msgSend(v11, "setOrder:", objc_msgSend(v76, "unsignedLongLongValue"));

      v77 = [v7 objectForKey:@"publishDateMillis"];
      objc_msgSend(v11, "setPublishDateMilliseconds:", objc_msgSend(v77, "unsignedLongLongValue"));

      v78 = [v7 objectForKey:@"tagHalfLifeMillis"];
      objc_msgSend(v11, "setFeedHalfLifeMilliseconds:", objc_msgSend(v78, "unsignedLongLongValue"));

      v72 = [v7 objectForKey:@"userFeedback"];
      [v72 doubleValue];
      objc_msgSend(v11, "setGlobalUserFeedback:");
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      v72 = (void *)[[NSString alloc] initWithFormat:@"unexpected record type for FeedItem: %@", v7];
      *(_DWORD *)buf = 136315906;
      v86 = "+[NTPBFeedItem(FCFeedItem) feedItemFromCKRecord:storefrontID:recordSource:]";
      __int16 v87 = 2080;
      v88 = "FCFeedItem.m";
      __int16 v89 = 1024;
      int v90 = 287;
      __int16 v91 = 2114;
      v92 = v72;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }

LABEL_45:
  v79 = [v7 objectForKey:@"float16TitleEncoding"];
  [v11 setFloat16TitleEncoding:v79];

  v80 = [v7 objectForKey:@"float16FullBodyEncoding"];
  [v11 setFloat16FullBodyEncoding:v80];

  id v8 = v82;
LABEL_46:

  return v11;
}

- (BOOL)isEqual:()FCFeedItem
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = (void *)MEMORY[0x1E4FBA8A8];
  id v8 = [a1 feedID];
  id v9 = [v6 feedID];
  if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
  {
    v10 = (void *)MEMORY[0x1E4FBA8A8];
    id v11 = [a1 articleID];
    v12 = [v6 articleID];
    if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
    {
      uint64_t v13 = [a1 order];
      BOOL v14 = v13 == [v6 order];
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (uint64_t)hash
{
  v2 = [a1 feedID];
  uint64_t v3 = [v2 hash];
  id v4 = [a1 articleID];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = v5 ^ [a1 order];

  return v6;
}

- (uint64_t)compareOrder:()FCFeedItem
{
  id v4 = a3;
  unint64_t v5 = [a1 order];
  unint64_t v6 = [v4 order];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (uint64_t)compareOrderDescending:()FCFeedItem
{
  unint64_t v4 = [a3 order];
  unint64_t v5 = [a1 order];
  if (v4 < v5) {
    return -1;
  }
  else {
    return v4 > v5;
  }
}

- (uint64_t)compareGlobalUserFeedback:()FCFeedItem
{
  id v4 = a3;
  [a1 globalUserFeedback];
  double v6 = v5;
  [v4 globalUserFeedback];
  double v8 = v7;

  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 > v8;
  }
}

- (uint64_t)compareGlobalUserFeedbackDescending:()FCFeedItem
{
  [a3 globalUserFeedback];
  double v5 = v4;
  [a1 globalUserFeedback];
  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (void)enumerateFeaturesWithBlock:()FCFeedItem
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v4 = a3;
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v5 = objc_msgSend(a1, "topicIDs", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = +[FCFeedItemFeature featureForTopicID:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
          v4[2](v4, v10);

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (uint64_t)hasFeature:()FCFeedItem
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 2)
  {
    uint64_t v8 = 1;
  }
  else if (v5 == 1)
  {
    uint64_t v6 = [a1 topicIDs];
    uint64_t v7 = [v4 topicID];
    uint64_t v8 = [v6 containsObject:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)description
{
  v2 = NSString;
  uint64_t v3 = [a1 dictionaryRepresentation];
  id v4 = [v2 stringWithFormat:@"%p: %@", a1, v3];

  return v4;
}

- (BOOL)isANF
{
  return [a1 contentType] == 2;
}

- (id)scoreProfile
{
  return objc_getAssociatedObject(a1, (const void *)FCFeedItemScoreProfileKey);
}

- (void)setScoreProfile:()FCFeedItem
{
}

- (uint64_t)publishDate
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v2 = [a1 publishDateMilliseconds];
  return objc_msgSend(v1, "fc_dateWithMillisecondTimeIntervalSince1970:", v2);
}

- (uint64_t)mustShow
{
  return 0;
}

- (uint64_t)publisherArticleVersion
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v1 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
    int v2 = 136315906;
    uint64_t v3 = "-[NTPBFeedItem(FCFeedItem) publisherArticleVersion]";
    __int16 v4 = 2080;
    uint64_t v5 = "FCFeedItem.m";
    __int16 v6 = 1024;
    int v7 = 436;
    __int16 v8 = 2114;
    uint64_t v9 = v1;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2, 0x26u);
  }
  return 0;
}

- (uint64_t)canBePurchased
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
    int v4 = 136315906;
    uint64_t v5 = "-[NTPBFeedItem(FCFeedItem) canBePurchased]";
    __int16 v6 = 2080;
    int v7 = "FCFeedItem.m";
    __int16 v8 = 1024;
    int v9 = 442;
    __int16 v10 = 2114;
    long long v11 = v3;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);
  }
  if ([a1 isPaid]) {
    return 1;
  }
  else {
    return [a1 isBundlePaid];
  }
}

- (void)enumerateTopicCohortsWithBlock:()FCFeedItem
{
  id v4 = a3;
  uint64_t v5 = [a1 topics];

  if (v5)
  {
    __int16 v6 = [a1 topics];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__NTPBFeedItem_FCFeedItem__enumerateTopicCohortsWithBlock___block_invoke_2;
    v7[3] = &unk_1E5B509E0;
    id v8 = v4;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

- (void)enumerateTopicConversionStatsWithBlock:()FCFeedItem
{
  id v4 = a3;
  uint64_t v5 = [a1 topics];

  if (v5)
  {
    __int16 v6 = [a1 topics];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__NTPBFeedItem_FCFeedItem__enumerateTopicConversionStatsWithBlock___block_invoke_2;
    v7[3] = &unk_1E5B509E0;
    id v8 = v4;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

- (void)addSurfacedByArticleListID:()FCFeedItem
{
  id v4 = a3;
  if ([v4 hasPrefix:@"LX"]) {
    [a1 setIsCoread:1];
  }
  [a1 addSurfacedByArticleListID2:v4];
}

@end