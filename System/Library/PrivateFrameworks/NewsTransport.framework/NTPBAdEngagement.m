@interface NTPBAdEngagement
- (BOOL)hasAdCreativeType;
- (BOOL)hasAdEngagementType;
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
- (BOOL)hasSourceChannelId;
- (BOOL)hasVideoAdDuration;
- (BOOL)hasVideoAdPlacementPosition;
- (BOOL)hasVideoAdPlayTime;
- (BOOL)hasVideoAdType;
- (BOOL)hasVideoAdViewComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)videoAdViewComplete;
- (NSData)articleViewingSessionId;
- (NSData)feedViewExposureId;
- (NSData)groupViewExposureId;
- (NSString)adImpressionId;
- (NSString)articleId;
- (NSString)feedId;
- (NSString)iadAd;
- (NSString)iadCampaign;
- (NSString)iadLine;
- (NSString)sourceChannelId;
- (id)adCreativeTypeAsString:(int)a3;
- (id)adEngagementTypeAsString:(int)a3;
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
- (int)StringAsAdEngagementType:(id)a3;
- (int)StringAsAdLocation:(id)a3;
- (int)StringAsAdType:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsNewsProductType:(id)a3;
- (int)StringAsVideoAdType:(id)a3;
- (int)adCreativeType;
- (int)adEngagementType;
- (int)adImpressionTimeThreshold;
- (int)adLocation;
- (int)adType;
- (int)feedType;
- (int)groupType;
- (int)newsProductType;
- (int)videoAdPlacementPosition;
- (int)videoAdType;
- (int64_t)videoAdDuration;
- (int64_t)videoAdPlayTime;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAdCreativeType:(int)a3;
- (void)setAdEngagementType:(int)a3;
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
- (void)setHasAdEngagementType:(BOOL)a3;
- (void)setHasAdImpressionTimeThreshold:(BOOL)a3;
- (void)setHasAdLocation:(BOOL)a3;
- (void)setHasAdType:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasNewsProductType:(BOOL)a3;
- (void)setHasVideoAdDuration:(BOOL)a3;
- (void)setHasVideoAdPlacementPosition:(BOOL)a3;
- (void)setHasVideoAdPlayTime:(BOOL)a3;
- (void)setHasVideoAdType:(BOOL)a3;
- (void)setHasVideoAdViewComplete:(BOOL)a3;
- (void)setIadAd:(id)a3;
- (void)setIadCampaign:(id)a3;
- (void)setIadLine:(id)a3;
- (void)setNewsProductType:(int)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setVideoAdDuration:(int64_t)a3;
- (void)setVideoAdPlacementPosition:(int)a3;
- (void)setVideoAdPlayTime:(int64_t)a3;
- (void)setVideoAdType:(int)a3;
- (void)setVideoAdViewComplete:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAdEngagement

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

- (int)adEngagementType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_adEngagementType;
  }
  else {
    return 0;
  }
}

- (void)setAdEngagementType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_adEngagementType = a3;
}

- (void)setHasAdEngagementType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAdEngagementType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)adEngagementTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444F140[a3];
  }

  return v3;
}

- (int)StringAsAdEngagementType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AD_ENGAGEMENT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TAP_AD_ENGAGEMENT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VIDEO_AD_VIEW_AD_ENGAGEMENT_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VIDEO_AD_SKIP_AD_ENGAGEMENT_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CTA_BUTTON_TAP_AD_ENGAGEMENT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"VIDEO_AD_PAUSE_AD_ENGAGEMENT_TYPE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)adType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_adType;
  }
  else {
    return 0;
  }
}

- (void)setAdType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_adType = a3;
}

- (void)setHasAdType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAdType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)adTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"NON_NATIVE_AD_TYPE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_AD_TYPE";
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
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_adCreativeType;
  }
  else {
    return 0;
  }
}

- (void)setAdCreativeType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_adCreativeType = a3;
}

- (void)setHasAdCreativeType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAdCreativeType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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
    __int16 v3 = off_26444F170[a3];
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
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_adLocation;
  }
  else {
    return 0;
  }
}

- (void)setAdLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_adLocation = a3;
}

- (void)setHasAdLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAdLocation
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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
    __int16 v3 = off_26444F190[a3];
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
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_newsProductType;
  }
  else {
    return 0;
  }
}

- (void)setNewsProductType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_newsProductType = a3;
}

- (void)setHasNewsProductType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNewsProductType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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
    __int16 v3 = off_26444F1C0[a3];
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
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    return self->_videoAdType;
  }
  else {
    return 0;
  }
}

- (void)setVideoAdType:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_videoAdType = a3;
}

- (void)setHasVideoAdType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVideoAdType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
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
    __int16 v3 = off_26444F1D8[a3];
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
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFeedType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
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
    __int16 v3 = off_26444F1F0[a3];
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

- (void)setVideoAdPlayTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_videoAdPlayTime = a3;
}

- (void)setHasVideoAdPlayTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasVideoAdPlayTime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setVideoAdPlacementPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_videoAdPlacementPosition = a3;
}

- (void)setHasVideoAdPlacementPosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVideoAdPlacementPosition
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setVideoAdViewComplete:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_videoAdViewComplete = a3;
}

- (void)setHasVideoAdViewComplete:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasVideoAdViewComplete
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasAdImpressionId
{
  return self->_adImpressionId != 0;
}

- (void)setAdImpressionTimeThreshold:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_adImpressionTimeThreshold = a3;
}

- (void)setHasAdImpressionTimeThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAdImpressionTimeThreshold
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasGroupType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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
    __int16 v3 = off_26444F2A0[a3];
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAdEngagement;
  int v4 = [(NTPBAdEngagement *)&v8 description];
  v5 = [(NTPBAdEngagement *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    uint64_t adEngagementType = self->_adEngagementType;
    if (adEngagementType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adEngagementType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_26444F140[adEngagementType];
    }
    [v4 setObject:v10 forKey:@"ad_engagement_type"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  int adType = self->_adType;
  if (adType)
  {
    if (adType == 1)
    {
      v12 = @"NON_NATIVE_AD_TYPE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = @"UNKNOWN_AD_TYPE";
  }
  [v4 setObject:v12 forKey:@"ad_type"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_25:
  uint64_t adCreativeType = self->_adCreativeType;
  if (adCreativeType >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adCreativeType);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_26444F170[adCreativeType];
  }
  [v4 setObject:v14 forKey:@"ad_creative_type"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_29:
  uint64_t adLocation = self->_adLocation;
  if (adLocation >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adLocation);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_26444F190[adLocation];
  }
  [v4 setObject:v16 forKey:@"ad_location"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_33:
  uint64_t newsProductType = self->_newsProductType;
  if (newsProductType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_newsProductType);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_26444F1C0[newsProductType];
  }
  [v4 setObject:v18 forKey:@"news_product_type"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0) {
      goto LABEL_45;
    }
    goto LABEL_41;
  }
LABEL_37:
  uint64_t videoAdType = self->_videoAdType;
  if (videoAdType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_videoAdType);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_26444F1D8[videoAdType];
  }
  [v4 setObject:v20 forKey:@"video_ad_type"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_41:
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_26444F1F0[feedType];
    }
    [v4 setObject:v22 forKey:@"feed_type"];
  }
LABEL_45:
  feedId = self->_feedId;
  if (feedId) {
    [v4 setObject:feedId forKey:@"feed_id"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v4 setObject:articleId forKey:@"article_id"];
  }
  __int16 v25 = (__int16)self->_has;
  if (v25)
  {
    v34 = [NSNumber numberWithLongLong:self->_videoAdDuration];
    [v4 setObject:v34 forKey:@"video_ad_duration"];

    __int16 v25 = (__int16)self->_has;
    if ((v25 & 2) == 0)
    {
LABEL_51:
      if ((v25 & 0x400) == 0) {
        goto LABEL_52;
      }
      goto LABEL_69;
    }
  }
  else if ((v25 & 2) == 0)
  {
    goto LABEL_51;
  }
  v35 = [NSNumber numberWithLongLong:self->_videoAdPlayTime];
  [v4 setObject:v35 forKey:@"video_ad_play_time"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x400) == 0)
  {
LABEL_52:
    if ((v25 & 0x1000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_69:
  v36 = [NSNumber numberWithInt:self->_videoAdPlacementPosition];
  [v4 setObject:v36 forKey:@"video_ad_placement_position"];

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_53:
    v26 = [NSNumber numberWithBool:self->_videoAdViewComplete];
    [v4 setObject:v26 forKey:@"video_ad_view_complete"];
  }
LABEL_54:
  adImpressionId = self->_adImpressionId;
  if (adImpressionId) {
    [v4 setObject:adImpressionId forKey:@"ad_impression_id"];
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v28 = [NSNumber numberWithInt:self->_adImpressionTimeThreshold];
    [v4 setObject:v28 forKey:@"ad_impression_time_threshold"];
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
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_26444F2A0[groupType];
    }
    [v4 setObject:v33 forKey:@"group_type"];
  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v4 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }
  id v38 = v4;

  return v38;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAdEngagementReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_43;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
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
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_15:
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
    if ((v6 & 2) == 0)
    {
LABEL_21:
      if ((v6 & 0x400) == 0) {
        goto LABEL_22;
      }
      goto LABEL_50;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_22:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_23:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_24:
  if (self->_adImpressionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
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
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_groupViewExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_iadCampaign copyWithZone:a3];
  id v7 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v6;

  uint64_t v8 = [(NSString *)self->_iadLine copyWithZone:a3];
  v9 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v8;

  uint64_t v10 = [(NSString *)self->_iadAd copyWithZone:a3];
  v11 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v10;

  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_adEngagementType;
    *(_WORD *)(v5 + 164) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_adType;
  *(_WORD *)(v5 + 164) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 24) = self->_adCreativeType;
  *(_WORD *)(v5 + 164) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 44) = self->_adLocation;
  *(_WORD *)(v5 + 164) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 136) = self->_newsProductType;
  *(_WORD *)(v5 + 164) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_24:
  *(_DWORD *)(v5 + 156) = self->_videoAdType;
  *(_WORD *)(v5 + 164) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 80) = self->_feedType;
    *(_WORD *)(v5 + 164) |= 0x80u;
  }
LABEL_9:
  uint64_t v13 = [(NSString *)self->_feedId copyWithZone:a3];
  v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  uint64_t v15 = [(NSString *)self->_articleId copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  __int16 v17 = (__int16)self->_has;
  if (v17)
  {
    *(void *)(v5 + 8) = self->_videoAdDuration;
    *(_WORD *)(v5 + 164) |= 1u;
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_11:
      if ((v17 & 0x400) == 0) {
        goto LABEL_12;
      }
      goto LABEL_28;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_11;
  }
  *(void *)(v5 + 16) = self->_videoAdPlayTime;
  *(_WORD *)(v5 + 164) |= 2u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x400) == 0)
  {
LABEL_12:
    if ((v17 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_28:
  *(_DWORD *)(v5 + 152) = self->_videoAdPlacementPosition;
  *(_WORD *)(v5 + 164) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_13:
    *(unsigned char *)(v5 + 160) = self->_videoAdViewComplete;
    *(_WORD *)(v5 + 164) |= 0x1000u;
  }
LABEL_14:
  uint64_t v18 = [(NSString *)self->_adImpressionId copyWithZone:a3];
  v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_adImpressionTimeThreshold;
    *(_WORD *)(v5 + 164) |= 0x10u;
  }
  uint64_t v20 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  uint64_t v22 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v23 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v22;

  uint64_t v24 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  __int16 v25 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v24;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_groupType;
    *(_WORD *)(v5 + 164) |= 0x100u;
  }
  uint64_t v26 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  v27 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v26;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_91;
  }
  iadCampaign = self->_iadCampaign;
  if ((unint64_t)iadCampaign | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](iadCampaign, "isEqual:")) {
      goto LABEL_91;
    }
  }
  iadLine = self->_iadLine;
  if ((unint64_t)iadLine | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](iadLine, "isEqual:")) {
      goto LABEL_91;
    }
  }
  iadAd = self->_iadAd;
  if ((unint64_t)iadAd | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](iadAd, "isEqual:")) {
      goto LABEL_91;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v9 = *((_WORD *)v4 + 82);
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_adEngagementType != *((_DWORD *)v4 + 7)) {
      goto LABEL_91;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_adType != *((_DWORD *)v4 + 12)) {
      goto LABEL_91;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_adCreativeType != *((_DWORD *)v4 + 6)) {
      goto LABEL_91;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_adLocation != *((_DWORD *)v4 + 11)) {
      goto LABEL_91;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x200) == 0 || self->_newsProductType != *((_DWORD *)v4 + 34)) {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x200) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x800) == 0 || self->_videoAdType != *((_DWORD *)v4 + 39)) {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x800) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_feedType != *((_DWORD *)v4 + 20)) {
      goto LABEL_91;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 9) && !-[NSString isEqual:](feedId, "isEqual:")) {
    goto LABEL_91;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_91;
    }
  }
  __int16 v12 = (__int16)self->_has;
  __int16 v13 = *((_WORD *)v4 + 82);
  if (v12)
  {
    if ((v13 & 1) == 0 || self->_videoAdDuration != *((void *)v4 + 1)) {
      goto LABEL_91;
    }
  }
  else if (v13)
  {
    goto LABEL_91;
  }
  if ((v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_videoAdPlayTime != *((void *)v4 + 2)) {
      goto LABEL_91;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x400) == 0 || self->_videoAdPlacementPosition != *((_DWORD *)v4 + 38)) {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x400) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x1000) == 0) {
      goto LABEL_91;
    }
    if (self->_videoAdViewComplete)
    {
      if (!*((unsigned char *)v4 + 160)) {
        goto LABEL_91;
      }
    }
    else if (*((unsigned char *)v4 + 160))
    {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x1000) != 0)
  {
    goto LABEL_91;
  }
  adImpressionId = self->_adImpressionId;
  if (!((unint64_t)adImpressionId | *((void *)v4 + 4))) {
    goto LABEL_73;
  }
  if (!-[NSString isEqual:](adImpressionId, "isEqual:"))
  {
LABEL_91:
    char v20 = 0;
    goto LABEL_92;
  }
  __int16 v12 = (__int16)self->_has;
LABEL_73:
  __int16 v15 = *((_WORD *)v4 + 82);
  if ((v12 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_adImpressionTimeThreshold != *((_DWORD *)v4 + 10)) {
      goto LABEL_91;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_91;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 8)
    && !-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
  {
    goto LABEL_91;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_91;
    }
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_91;
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x100) == 0 || self->_groupType != *((_DWORD *)v4 + 24)) {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x100) != 0)
  {
    goto LABEL_91;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 13)) {
    char v20 = -[NSData isEqual:](groupViewExposureId, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_92:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v27 = [(NSString *)self->_iadCampaign hash];
  NSUInteger v26 = [(NSString *)self->_iadLine hash];
  NSUInteger v25 = [(NSString *)self->_iadAd hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v24 = 2654435761 * self->_adEngagementType;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v23 = 2654435761 * self->_adType;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v22 = 2654435761 * self->_adCreativeType;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v22 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v21 = 2654435761 * self->_adLocation;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v21 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_6:
    uint64_t v20 = 2654435761 * self->_newsProductType;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v19 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v20 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v19 = 2654435761 * self->_videoAdType;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v18 = 2654435761 * self->_feedType;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v18 = 0;
LABEL_16:
  NSUInteger v17 = [(NSString *)self->_feedId hash];
  NSUInteger v16 = [(NSString *)self->_articleId hash];
  __int16 v4 = (__int16)self->_has;
  if (v4)
  {
    uint64_t v15 = 2654435761 * self->_videoAdDuration;
    if ((v4 & 2) != 0)
    {
LABEL_18:
      uint64_t v5 = 2654435761 * self->_videoAdPlayTime;
      if ((*(_WORD *)&self->_has & 0x400) != 0) {
        goto LABEL_19;
      }
LABEL_23:
      uint64_t v6 = 0;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_20;
      }
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((v4 & 2) != 0) {
      goto LABEL_18;
    }
  }
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v6 = 2654435761 * self->_videoAdPlacementPosition;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_20:
    uint64_t v7 = 2654435761 * self->_videoAdViewComplete;
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v7 = 0;
LABEL_25:
  NSUInteger v8 = [(NSString *)self->_adImpressionId hash];
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    uint64_t v9 = 2654435761 * self->_adImpressionTimeThreshold;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [(NSData *)self->_articleViewingSessionId hash];
  NSUInteger v11 = [(NSString *)self->_sourceChannelId hash];
  uint64_t v12 = [(NSData *)self->_feedViewExposureId hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v13 = 2654435761 * self->_groupType;
  }
  else {
    uint64_t v13 = 0;
  }
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSData *)self->_groupViewExposureId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 15))
  {
    -[NTPBAdEngagement setIadCampaign:](self, "setIadCampaign:");
    id v4 = v7;
  }
  if (*((void *)v4 + 16))
  {
    -[NTPBAdEngagement setIadLine:](self, "setIadLine:");
    id v4 = v7;
  }
  if (*((void *)v4 + 14))
  {
    -[NTPBAdEngagement setIadAd:](self, "setIadAd:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 82);
  if ((v5 & 8) != 0)
  {
    self->_uint64_t adEngagementType = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)v4 + 82);
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_43;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_int adType = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 82);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_uint64_t adCreativeType = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_uint64_t adLocation = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_uint64_t newsProductType = *((_DWORD *)v4 + 34);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_46:
  self->_uint64_t videoAdType = *((_DWORD *)v4 + 39);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 82) & 0x80) != 0)
  {
LABEL_14:
    self->_uint64_t feedType = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_15:
  if (*((void *)v4 + 9))
  {
    -[NTPBAdEngagement setFeedId:](self, "setFeedId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[NTPBAdEngagement setArticleId:](self, "setArticleId:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 82);
  if (v6)
  {
    self->_videoAdDuration = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 82);
    if ((v6 & 2) == 0)
    {
LABEL_21:
      if ((v6 & 0x400) == 0) {
        goto LABEL_22;
      }
      goto LABEL_50;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_21;
  }
  self->_videoAdPlayTime = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 82);
  if ((v6 & 0x400) == 0)
  {
LABEL_22:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_50:
  self->_videoAdPlacementPosition = *((_DWORD *)v4 + 38);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 82) & 0x1000) != 0)
  {
LABEL_23:
    self->_videoAdViewComplete = *((unsigned char *)v4 + 160);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_24:
  if (*((void *)v4 + 4))
  {
    -[NTPBAdEngagement setAdImpressionId:](self, "setAdImpressionId:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 82) & 0x10) != 0)
  {
    self->_adImpressionTimeThreshold = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 8))
  {
    -[NTPBAdEngagement setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 18))
  {
    -[NTPBAdEngagement setSourceChannelId:](self, "setSourceChannelId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 11))
  {
    -[NTPBAdEngagement setFeedViewExposureId:](self, "setFeedViewExposureId:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 82) & 0x100) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 13))
  {
    -[NTPBAdEngagement setGroupViewExposureId:](self, "setGroupViewExposureId:");
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

- (int64_t)videoAdPlayTime
{
  return self->_videoAdPlayTime;
}

- (int)videoAdPlacementPosition
{
  return self->_videoAdPlacementPosition;
}

- (BOOL)videoAdViewComplete
{
  return self->_videoAdViewComplete;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
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