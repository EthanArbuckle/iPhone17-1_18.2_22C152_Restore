@interface NTPBAdImpression
- (BOOL)hasAdCreativeType;
- (BOOL)hasAdImpressionId;
- (BOOL)hasAdImpressionTimeThreshold;
- (BOOL)hasAdLocation;
- (BOOL)hasAdType;
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasGroupType;
- (BOOL)hasGroupViewExposureId;
- (BOOL)hasIadAd;
- (BOOL)hasIadCampaign;
- (BOOL)hasIadLine;
- (BOOL)hasNewsProductType;
- (BOOL)hasPreviousArticleId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasVideoAdDuration;
- (BOOL)hasVideoAdPlacementPosition;
- (BOOL)hasVideoAdType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)articleViewingSessionId;
- (NSData)feedViewExposureId;
- (NSData)groupViewExposureId;
- (NSString)adImpressionId;
- (NSString)articleId;
- (NSString)feedId;
- (NSString)iadAd;
- (NSString)iadCampaign;
- (NSString)iadLine;
- (NSString)previousArticleId;
- (NSString)sourceChannelId;
- (id)adCreativeTypeAsString:(int)a3;
- (id)adLocationAsString:(int)a3;
- (id)adTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedTypeAsString:(int)a3;
- (id)groupTypeAsString:(int)a3;
- (id)newsProductTypeAsString:(int)a3;
- (id)videoAdTypeAsString:(int)a3;
- (int)StringAsAdCreativeType:(id)a3;
- (int)StringAsAdLocation:(id)a3;
- (int)StringAsAdType:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsNewsProductType:(id)a3;
- (int)StringAsVideoAdType:(id)a3;
- (int)adCreativeType;
- (int)adImpressionTimeThreshold;
- (int)adLocation;
- (int)adType;
- (int)feedType;
- (int)groupType;
- (int)newsProductType;
- (int)videoAdPlacementPosition;
- (int)videoAdType;
- (int64_t)videoAdDuration;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAdCreativeType:(int)a3;
- (void)setAdImpressionId:(id)a3;
- (void)setAdImpressionTimeThreshold:(int)a3;
- (void)setAdLocation:(int)a3;
- (void)setAdType:(int)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setGroupViewExposureId:(id)a3;
- (void)setHasAdCreativeType:(BOOL)a3;
- (void)setHasAdImpressionTimeThreshold:(BOOL)a3;
- (void)setHasAdLocation:(BOOL)a3;
- (void)setHasAdType:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasNewsProductType:(BOOL)a3;
- (void)setHasVideoAdDuration:(BOOL)a3;
- (void)setHasVideoAdPlacementPosition:(BOOL)a3;
- (void)setHasVideoAdType:(BOOL)a3;
- (void)setIadAd:(id)a3;
- (void)setIadCampaign:(id)a3;
- (void)setIadLine:(id)a3;
- (void)setNewsProductType:(int)a3;
- (void)setPreviousArticleId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setVideoAdDuration:(int64_t)a3;
- (void)setVideoAdPlacementPosition:(int)a3;
- (void)setVideoAdType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAdImpression

- (BOOL)hasIadCampaign
{
  return self->_iadCampaign != 0;
}

- (BOOL)hasIadLine
{
  return self->_iadLine != 0;
}

- (BOOL)hasIadAd
{
  return self->_iadAd != 0;
}

- (int)adType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_adType;
  }
  else {
    return 0;
  }
}

- (void)setAdType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_adType = a3;
}

- (void)setHasAdType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAdType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)adTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"NON_NATIVE_AD_TYPE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"UNKNOWN_AD_TYPE";
  }
  return v4;
}

- (int)StringAsAdType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AD_TYPE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"NON_NATIVE_AD_TYPE"];
  }

  return v4;
}

- (int)adCreativeType
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_adCreativeType;
  }
  else {
    return 0;
  }
}

- (void)setAdCreativeType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_adCreativeType = a3;
}

- (void)setHasAdCreativeType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAdCreativeType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)adCreativeTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444F418[a3];
  }

  return v3;
}

- (int)StringAsAdCreativeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AD_CREATIVE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BANNER_AD_CREATIVE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VIDEO_AD_CREATIVE_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INTERSTITIAL_AD_CREATIVE_TYPE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)adLocation
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_adLocation;
  }
  else {
    return 0;
  }
}

- (void)setAdLocation:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_adLocation = a3;
}

- (void)setHasAdLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAdLocation
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)adLocationAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444F438[a3];
  }

  return v3;
}

- (int)StringAsAdLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AD_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEED_AD_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ARTICLE_AD_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GALLERY_AD_LOCATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WIDGET_AD_LOCATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"WIDGET_IN_APP_AD_LOCATION"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)newsProductType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_newsProductType;
  }
  else {
    return 0;
  }
}

- (void)setNewsProductType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_newsProductType = a3;
}

- (void)setHasNewsProductType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNewsProductType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)newsProductTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444F468[a3];
  }

  return v3;
}

- (int)StringAsNewsProductType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_NEWS_PRODUCT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NEWS_APP_NEWS_PRODUCT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TODAY_WIDGET_NEWS_PRODUCT_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)videoAdType
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_videoAdType;
  }
  else {
    return 0;
  }
}

- (void)setVideoAdType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_videoAdType = a3;
}

- (void)setHasVideoAdType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasVideoAdType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)videoAdTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444F480[a3];
  }

  return v3;
}

- (int)StringAsVideoAdType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_VIDEO_AD_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PRE_ROLL_VIDEO_AD_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NON_PRE_ROLL_VIDEO_AD_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)feedType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFeedType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444F498[a3];
  }

  return v3;
}

- (int)StringAsFeedType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FEED_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FOR_YOU_FEED_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FAVORITES_FEED_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CHANNEL_FEED_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SECTION_FEED_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TOPIC_FEED_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RELATED_FEED_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MORE_PUB_ARTICLES_FEED_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"READING_HISTORY_FEED_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"READING_LIST_FEED_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"RECOMMENDED_FEED_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ISSUE_FEED_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LIST_FEED_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"DEBUG_FEED_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"WIDGET_FEED_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_FEED_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SYMBOL_FEED_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MAGAZINE_FEED_TYPE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"CATEGORY_FEED_TYPE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"MY_MAGAZINES_FEED_TYPE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"END_OF_ARTICLE_FEED_TYPE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"AUDIO_FEED_TYPE"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasFeedId
{
  return self->_feedId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (void)setVideoAdDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_videoAdDuration = a3;
}

- (void)setHasVideoAdDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasVideoAdDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setVideoAdPlacementPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_videoAdPlacementPosition = a3;
}

- (void)setHasVideoAdPlacementPosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasVideoAdPlacementPosition
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasAdImpressionId
{
  return self->_adImpressionId != 0;
}

- (void)setAdImpressionTimeThreshold:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_adImpressionTimeThreshold = a3;
}

- (void)setHasAdImpressionTimeThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAdImpressionTimeThreshold
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444F548[a3];
  }

  return v3;
}

- (int)StringAsGroupType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_GROUP_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_STORIES_GROUP_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRENDING_STORIES_GROUP_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LATEST_STORIES_GROUP_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TOPIC_ARTICLES_GROUP_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EDITORS_PICKS_GROUP_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MORE_FROM_TOPIC_GROUP_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CHANNEL_ARTICLES_GROUP_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DAILY_BRIEFINGS_GROUP_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"GREAT_STORIES_YOU_MISSED_GROUP_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SAVED_STORIES_GROUP_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MORE_FOR_YOU_GROUP_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PAID_SUBSCRIPTION_GROUP_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"LATEST_AND_GREATEST_GROUP_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SUGGESTED_TOPICS_GROUP_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FEATURED_STORIES_GROUP_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"TOP_VIDEOS_GROUP_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MORE_VIDEOS_GROUP_TYPE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SYMBOL_GROUP_TYPE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"RECIRCULATION_GROUP_TYPE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"MORE_FROM_PUB_GROUP_TYPE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RELATED_GROUP_TYPE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"MY_MAGAZINES_GROUP_TYPE"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FEATURED_ISSUE_GROUP_TYPE"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ISSUES_GROUP_TYPE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"FEATURED_ARTICLE_GROUP_TYPE"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"FEATURED_ISSUE_ARTICLE_GROUP_TYPE"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"RECOMMENDED_ISSUES_GROUP_TYPE"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"NEW_ISSUE_GROUP_TYPE"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_GROUP_TYPE"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"ARTICLE_LIST_GROUP_TYPE"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"ORDERED_ARTICLE_LIST_GROUP_TYPE"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"BEST_OF_BUNDLE_GROUP_TYPE"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"CURATED_GROUP_TYPE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"NEWSPAPER_GROUP_TYPE"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"LOCAL_NEWS_GROUP_TYPE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"AUDIO_UP_NEXT_GROUP_TYPE"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"AUDIO_FOR_YOU_GROUP_TYPE"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"AUDIO_RECENTLY_PLAYED_GROUP_TYPE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"AUDIO_DAILY_BRIEFING_GROUP_TYPE"])
  {
    int v4 = 39;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (BOOL)hasPreviousArticleId
{
  return self->_previousArticleId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAdImpression;
  int v4 = [(NTPBAdImpression *)&v8 description];
  v5 = [(NTPBAdImpression *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  iadCampaign = self->_iadCampaign;
  if (iadCampaign) {
    [v3 setObject:iadCampaign forKey:@"iad_campaign"];
  }
  iadLine = self->_iadLine;
  if (iadLine) {
    [v4 setObject:iadLine forKey:@"iad_line"];
  }
  iadAd = self->_iadAd;
  if (iadAd) {
    [v4 setObject:iadAd forKey:@"iad_ad"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    int adType = self->_adType;
    if (adType)
    {
      if (adType == 1)
      {
        v10 = @"NON_NATIVE_AD_TYPE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adType);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = @"UNKNOWN_AD_TYPE";
    }
    [v4 setObject:v10 forKey:@"ad_type"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_9;
  }
  uint64_t adCreativeType = self->_adCreativeType;
  if (adCreativeType >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adCreativeType);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_26444F418[adCreativeType];
  }
  [v4 setObject:v12 forKey:@"ad_creative_type"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_24:
  uint64_t adLocation = self->_adLocation;
  if (adLocation >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adLocation);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_26444F438[adLocation];
  }
  [v4 setObject:v14 forKey:@"ad_location"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_28:
  uint64_t newsProductType = self->_newsProductType;
  if (newsProductType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_newsProductType);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_26444F468[newsProductType];
  }
  [v4 setObject:v16 forKey:@"news_product_type"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_40;
    }
    goto LABEL_36;
  }
LABEL_32:
  uint64_t videoAdType = self->_videoAdType;
  if (videoAdType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_videoAdType);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_26444F480[videoAdType];
  }
  [v4 setObject:v18 forKey:@"video_ad_type"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_36:
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_26444F498[feedType];
    }
    [v4 setObject:v20 forKey:@"feed_type"];
  }
LABEL_40:
  feedId = self->_feedId;
  if (feedId) {
    [v4 setObject:feedId forKey:@"feed_id"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v4 setObject:articleId forKey:@"article_id"];
  }
  __int16 v23 = (__int16)self->_has;
  if (v23)
  {
    v24 = [NSNumber numberWithLongLong:self->_videoAdDuration];
    [v4 setObject:v24 forKey:@"video_ad_duration"];

    __int16 v23 = (__int16)self->_has;
  }
  if ((v23 & 0x100) != 0)
  {
    v25 = [NSNumber numberWithInt:self->_videoAdPlacementPosition];
    [v4 setObject:v25 forKey:@"video_ad_placement_position"];
  }
  adImpressionId = self->_adImpressionId;
  if (adImpressionId) {
    [v4 setObject:adImpressionId forKey:@"ad_impression_id"];
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v27 = [NSNumber numberWithInt:self->_adImpressionTimeThreshold];
    [v4 setObject:v27 forKey:@"ad_impression_time_threshold"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v4 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v4 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v4 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_26444F548[groupType];
    }
    [v4 setObject:v32 forKey:@"group_type"];
  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v4 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }
  previousArticleId = self->_previousArticleId;
  if (previousArticleId) {
    [v4 setObject:previousArticleId forKey:@"previous_article_id"];
  }
  id v35 = v4;

  return v35;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAdImpressionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_iadCampaign)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_iadLine)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_iadAd)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_43;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_14:
  if (self->_feedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if (v6)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_adImpressionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_articleViewingSessionId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_feedViewExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_groupViewExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_previousArticleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_iadCampaign copyWithZone:a3];
  id v7 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v6;

  uint64_t v8 = [(NSString *)self->_iadLine copyWithZone:a3];
  v9 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v8;

  uint64_t v10 = [(NSString *)self->_iadAd copyWithZone:a3];
  v11 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v10;

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_adType;
    *(_WORD *)(v5 + 160) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_adCreativeType;
  *(_WORD *)(v5 + 160) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 36) = self->_adLocation;
  *(_WORD *)(v5 + 160) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 128) = self->_newsProductType;
  *(_WORD *)(v5 + 160) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  *(_DWORD *)(v5 + 156) = self->_videoAdType;
  *(_WORD *)(v5 + 160) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 72) = self->_feedType;
    *(_WORD *)(v5 + 160) |= 0x20u;
  }
LABEL_8:
  uint64_t v13 = [(NSString *)self->_feedId copyWithZone:a3];
  v14 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v13;

  uint64_t v15 = [(NSString *)self->_articleId copyWithZone:a3];
  v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  __int16 v17 = (__int16)self->_has;
  if (v17)
  {
    *(void *)(v5 + 8) = self->_videoAdDuration;
    *(_WORD *)(v5 + 160) |= 1u;
    __int16 v17 = (__int16)self->_has;
  }
  if ((v17 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_videoAdPlacementPosition;
    *(_WORD *)(v5 + 160) |= 0x100u;
  }
  uint64_t v18 = [(NSString *)self->_adImpressionId copyWithZone:a3];
  v19 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v18;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_adImpressionTimeThreshold;
    *(_WORD *)(v5 + 160) |= 4u;
  }
  uint64_t v20 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v21 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v20;

  uint64_t v22 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  __int16 v23 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v22;

  uint64_t v24 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  v25 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v24;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_groupType;
    *(_WORD *)(v5 + 160) |= 0x40u;
  }
  uint64_t v26 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  v27 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v26;

  uint64_t v28 = [(NSString *)self->_previousArticleId copyWithZone:a3];
  v29 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v28;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_75;
  }
  iadCampaign = self->_iadCampaign;
  if ((unint64_t)iadCampaign | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](iadCampaign, "isEqual:")) {
      goto LABEL_75;
    }
  }
  iadLine = self->_iadLine;
  if ((unint64_t)iadLine | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](iadLine, "isEqual:")) {
      goto LABEL_75;
    }
  }
  iadAd = self->_iadAd;
  if ((unint64_t)iadAd | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](iadAd, "isEqual:")) {
      goto LABEL_75;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v9 = *((_WORD *)v4 + 80);
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_adType != *((_DWORD *)v4 + 10)) {
      goto LABEL_75;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_adCreativeType != *((_DWORD *)v4 + 4)) {
      goto LABEL_75;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_adLocation != *((_DWORD *)v4 + 9)) {
      goto LABEL_75;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_newsProductType != *((_DWORD *)v4 + 32)) {
      goto LABEL_75;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 80) & 0x200) == 0 || self->_videoAdType != *((_DWORD *)v4 + 39)) {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)v4 + 80) & 0x200) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_feedType != *((_DWORD *)v4 + 18)) {
      goto LABEL_75;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_75;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 8) && !-[NSString isEqual:](feedId, "isEqual:")) {
    goto LABEL_75;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_75;
    }
  }
  __int16 v12 = (__int16)self->_has;
  __int16 v13 = *((_WORD *)v4 + 80);
  if (v12)
  {
    if ((v13 & 1) == 0 || self->_videoAdDuration != *((void *)v4 + 1)) {
      goto LABEL_75;
    }
  }
  else if (v13)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 80) & 0x100) == 0 || self->_videoAdPlacementPosition != *((_DWORD *)v4 + 38)) {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)v4 + 80) & 0x100) != 0)
  {
    goto LABEL_75;
  }
  adImpressionId = self->_adImpressionId;
  if ((unint64_t)adImpressionId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](adImpressionId, "isEqual:"))
    {
LABEL_75:
      char v22 = 0;
      goto LABEL_76;
    }
    __int16 v12 = (__int16)self->_has;
  }
  __int16 v15 = *((_WORD *)v4 + 80);
  if ((v12 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_adImpressionTimeThreshold != *((_DWORD *)v4 + 8)) {
      goto LABEL_75;
    }
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_75;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 7)
    && !-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
  {
    goto LABEL_75;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_75;
    }
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_75;
    }
  }
  __int16 v19 = *((_WORD *)v4 + 80);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    if ((v19 & 0x40) == 0 || self->_groupType != *((_DWORD *)v4 + 22)) {
      goto LABEL_75;
    }
  }
  else if ((v19 & 0x40) != 0)
  {
    goto LABEL_75;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 12)
    && !-[NSData isEqual:](groupViewExposureId, "isEqual:"))
  {
    goto LABEL_75;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((void *)v4 + 17)) {
    char v22 = -[NSString isEqual:](previousArticleId, "isEqual:");
  }
  else {
    char v22 = 1;
  }
LABEL_76:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v24 = [(NSString *)self->_iadCampaign hash];
  NSUInteger v23 = [(NSString *)self->_iadLine hash];
  NSUInteger v22 = [(NSString *)self->_iadAd hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v21 = 2654435761 * self->_adType;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v20 = 2654435761 * self->_adCreativeType;
      if ((has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    uint64_t v19 = 2654435761 * self->_adLocation;
    if ((has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v19 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v18 = 2654435761 * self->_newsProductType;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v17 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v18 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v17 = 2654435761 * self->_videoAdType;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v16 = 2654435761 * self->_feedType;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v16 = 0;
LABEL_14:
  NSUInteger v15 = [(NSString *)self->_feedId hash];
  NSUInteger v4 = [(NSString *)self->_articleId hash];
  if (*(_WORD *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_videoAdDuration;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_16:
      uint64_t v6 = 2654435761 * self->_videoAdPlacementPosition;
      goto LABEL_19;
    }
  }
  uint64_t v6 = 0;
LABEL_19:
  NSUInteger v7 = [(NSString *)self->_adImpressionId hash];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_adImpressionTimeThreshold;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(NSData *)self->_articleViewingSessionId hash];
  NSUInteger v10 = [(NSString *)self->_sourceChannelId hash];
  uint64_t v11 = [(NSData *)self->_feedViewExposureId hash];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v12 = 2654435761 * self->_groupType;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v10 ^ v11 ^ v12 ^ [(NSData *)self->_groupViewExposureId hash];
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v13 ^ [(NSString *)self->_previousArticleId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 14))
  {
    -[NTPBAdImpression setIadCampaign:](self, "setIadCampaign:");
    id v4 = v7;
  }
  if (*((void *)v4 + 15))
  {
    -[NTPBAdImpression setIadLine:](self, "setIadLine:");
    id v4 = v7;
  }
  if (*((void *)v4 + 13))
  {
    -[NTPBAdImpression setIadAd:](self, "setIadAd:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 80);
  if ((v5 & 0x10) != 0)
  {
    self->_int adType = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 80);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_43;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_uint64_t adCreativeType = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 80);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_uint64_t adLocation = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 80);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_uint64_t newsProductType = *((_DWORD *)v4 + 32);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 80);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_45:
  self->_uint64_t videoAdType = *((_DWORD *)v4 + 39);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 80) & 0x20) != 0)
  {
LABEL_13:
    self->_uint64_t feedType = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_14:
  if (*((void *)v4 + 8))
  {
    -[NTPBAdImpression setFeedId:](self, "setFeedId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[NTPBAdImpression setArticleId:](self, "setArticleId:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 80);
  if (v6)
  {
    self->_videoAdDuration = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 80);
  }
  if ((v6 & 0x100) != 0)
  {
    self->_videoAdPlacementPosition = *((_DWORD *)v4 + 38);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBAdImpression setAdImpressionId:](self, "setAdImpressionId:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 80) & 4) != 0)
  {
    self->_adImpressionTimeThreshold = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 7))
  {
    -[NTPBAdImpression setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 18))
  {
    -[NTPBAdImpression setSourceChannelId:](self, "setSourceChannelId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 10))
  {
    -[NTPBAdImpression setFeedViewExposureId:](self, "setFeedViewExposureId:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 80) & 0x40) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 12))
  {
    -[NTPBAdImpression setGroupViewExposureId:](self, "setGroupViewExposureId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 17))
  {
    -[NTPBAdImpression setPreviousArticleId:](self, "setPreviousArticleId:");
    id v4 = v7;
  }
}

- (NSString)iadCampaign
{
  return self->_iadCampaign;
}

- (void)setIadCampaign:(id)a3
{
}

- (NSString)iadLine
{
  return self->_iadLine;
}

- (void)setIadLine:(id)a3
{
}

- (NSString)iadAd
{
  return self->_iadAd;
}

- (void)setIadAd:(id)a3
{
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (int64_t)videoAdDuration
{
  return self->_videoAdDuration;
}

- (int)videoAdPlacementPosition
{
  return self->_videoAdPlacementPosition;
}

- (NSString)adImpressionId
{
  return self->_adImpressionId;
}

- (void)setAdImpressionId:(id)a3
{
}

- (int)adImpressionTimeThreshold
{
  return self->_adImpressionTimeThreshold;
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
}

- (NSString)previousArticleId
{
  return self->_previousArticleId;
}

- (void)setPreviousArticleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_iadLine, 0);
  objc_storeStrong((id *)&self->_iadCampaign, 0);
  objc_storeStrong((id *)&self->_iadAd, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);

  objc_storeStrong((id *)&self->_adImpressionId, 0);
}

@end