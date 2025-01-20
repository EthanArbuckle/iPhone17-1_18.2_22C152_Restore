@interface NTPBAdCtaEngagement
- (BOOL)hasAdCreativeType;
- (BOOL)hasAdCtaEngagemetType;
- (BOOL)hasAdEngagementType;
- (BOOL)hasAdImpressionId;
- (BOOL)hasAdLocation;
- (BOOL)hasAdType;
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasFeedViewExposureId;
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
- (id)newsProductTypeAsString:(int)a3;
- (id)videoAdTypeAsString:(int)a3;
- (int)StringAsAdCreativeType:(id)a3;
- (int)StringAsAdEngagementType:(id)a3;
- (int)StringAsAdLocation:(id)a3;
- (int)StringAsAdType:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsNewsProductType:(id)a3;
- (int)StringAsVideoAdType:(id)a3;
- (int)adCreativeType;
- (int)adCtaEngagemetType;
- (int)adEngagementType;
- (int)adLocation;
- (int)adType;
- (int)feedType;
- (int)newsProductType;
- (int)videoAdPlacementPosition;
- (int)videoAdType;
- (int64_t)videoAdDuration;
- (int64_t)videoAdPlayTime;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAdCreativeType:(int)a3;
- (void)setAdCtaEngagemetType:(int)a3;
- (void)setAdEngagementType:(int)a3;
- (void)setAdImpressionId:(id)a3;
- (void)setAdLocation:(int)a3;
- (void)setAdType:(int)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setHasAdCreativeType:(BOOL)a3;
- (void)setHasAdCtaEngagemetType:(BOOL)a3;
- (void)setHasAdEngagementType:(BOOL)a3;
- (void)setHasAdLocation:(BOOL)a3;
- (void)setHasAdType:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
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

@implementation NTPBAdCtaEngagement

- (int)adCtaEngagemetType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_adCtaEngagemetType;
  }
  else {
    return 0;
  }
}

- (void)setAdCtaEngagemetType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_adCtaEngagemetType = a3;
}

- (void)setHasAdCtaEngagemetType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAdCtaEngagemetType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

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
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_adEngagementType;
  }
  else {
    return 0;
  }
}

- (void)setAdEngagementType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_adEngagementType = a3;
}

- (void)setHasAdEngagementType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAdEngagementType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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
    __int16 v3 = off_26444EFE0[a3];
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
    __int16 v3 = off_26444F010[a3];
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
    __int16 v3 = off_26444F030[a3];
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
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_newsProductType;
  }
  else {
    return 0;
  }
}

- (void)setNewsProductType:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_newsProductType = a3;
}

- (void)setHasNewsProductType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNewsProductType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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
    __int16 v3 = off_26444F060[a3];
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
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_videoAdType;
  }
  else {
    return 0;
  }
}

- (void)setVideoAdType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_videoAdType = a3;
}

- (void)setHasVideoAdType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVideoAdType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
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
    __int16 v3 = off_26444F078[a3];
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
    __int16 v3 = off_26444F090[a3];
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
  *(_WORD *)&self->_has |= 0x200u;
  self->_videoAdPlacementPosition = a3;
}

- (void)setHasVideoAdPlacementPosition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasVideoAdPlacementPosition
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setVideoAdViewComplete:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_videoAdViewComplete = a3;
}

- (void)setHasVideoAdViewComplete:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVideoAdViewComplete
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasAdImpressionId
{
  return self->_adImpressionId != 0;
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

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAdCtaEngagement;
  int v4 = [(NTPBAdCtaEngagement *)&v8 description];
  v5 = [(NTPBAdCtaEngagement *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    int v4 = [NSNumber numberWithInt:self->_adCtaEngagemetType];
    [v3 setObject:v4 forKey:@"ad_cta_engagemet_type"];
  }
  iadCampaign = self->_iadCampaign;
  if (iadCampaign) {
    [v3 setObject:iadCampaign forKey:@"iad_campaign"];
  }
  iadLine = self->_iadLine;
  if (iadLine) {
    [v3 setObject:iadLine forKey:@"iad_line"];
  }
  iadAd = self->_iadAd;
  if (iadAd) {
    [v3 setObject:iadAd forKey:@"iad_ad"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t adEngagementType = self->_adEngagementType;
    if (adEngagementType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adEngagementType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_26444EFE0[adEngagementType];
    }
    [v3 setObject:v10 forKey:@"ad_engagement_type"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_27;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_11;
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
  [v3 setObject:v12 forKey:@"ad_type"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_27:
  uint64_t adCreativeType = self->_adCreativeType;
  if (adCreativeType >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adCreativeType);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_26444F010[adCreativeType];
  }
  [v3 setObject:v14 forKey:@"ad_creative_type"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_31:
  uint64_t adLocation = self->_adLocation;
  if (adLocation >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adLocation);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_26444F030[adLocation];
  }
  [v3 setObject:v16 forKey:@"ad_location"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_35:
  uint64_t newsProductType = self->_newsProductType;
  if (newsProductType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_newsProductType);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_26444F060[newsProductType];
  }
  [v3 setObject:v18 forKey:@"news_product_type"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0) {
      goto LABEL_47;
    }
    goto LABEL_43;
  }
LABEL_39:
  uint64_t videoAdType = self->_videoAdType;
  if (videoAdType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_videoAdType);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_26444F078[videoAdType];
  }
  [v3 setObject:v20 forKey:@"video_ad_type"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_43:
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_26444F090[feedType];
    }
    [v3 setObject:v22 forKey:@"feed_type"];
  }
LABEL_47:
  feedId = self->_feedId;
  if (feedId) {
    [v3 setObject:feedId forKey:@"feed_id"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  __int16 v25 = (__int16)self->_has;
  if (v25)
  {
    v33 = [NSNumber numberWithLongLong:self->_videoAdDuration];
    [v3 setObject:v33 forKey:@"video_ad_duration"];

    __int16 v25 = (__int16)self->_has;
    if ((v25 & 2) == 0)
    {
LABEL_53:
      if ((v25 & 0x200) == 0) {
        goto LABEL_54;
      }
      goto LABEL_67;
    }
  }
  else if ((v25 & 2) == 0)
  {
    goto LABEL_53;
  }
  v34 = [NSNumber numberWithLongLong:self->_videoAdPlayTime];
  [v3 setObject:v34 forKey:@"video_ad_play_time"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x200) == 0)
  {
LABEL_54:
    if ((v25 & 0x800) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_67:
  v35 = [NSNumber numberWithInt:self->_videoAdPlacementPosition];
  [v3 setObject:v35 forKey:@"video_ad_placement_position"];

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_55:
    v26 = [NSNumber numberWithBool:self->_videoAdViewComplete];
    [v3 setObject:v26 forKey:@"video_ad_view_complete"];
  }
LABEL_56:
  adImpressionId = self->_adImpressionId;
  if (adImpressionId) {
    [v3 setObject:adImpressionId forKey:@"ad_impression_id"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v3 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  id v31 = v3;

  return v31;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAdCtaEngagementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
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
    if ((has & 0x40) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_39;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_16:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_17:
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
LABEL_23:
      if ((v6 & 0x200) == 0) {
        goto LABEL_24;
      }
      goto LABEL_46;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_24:
    if ((v6 & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_25:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_26:
  if (self->_adImpressionId)
  {
    PBDataWriterWriteStringField();
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_adCtaEngagemetType;
    *(_WORD *)(v5 + 148) |= 8u;
  }
  uint64_t v7 = [(NSString *)self->_iadCampaign copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v7;

  uint64_t v9 = [(NSString *)self->_iadLine copyWithZone:a3];
  v10 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v9;

  uint64_t v11 = [(NSString *)self->_iadAd copyWithZone:a3];
  v12 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v11;

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_adEngagementType;
    *(_WORD *)(v6 + 148) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 52) = self->_adType;
  *(_WORD *)(v6 + 148) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v6 + 24) = self->_adCreativeType;
  *(_WORD *)(v6 + 148) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v6 + 48) = self->_adLocation;
  *(_WORD *)(v6 + 148) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 120) = self->_newsProductType;
  *(_WORD *)(v6 + 148) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_22:
  *(_DWORD *)(v6 + 140) = self->_videoAdType;
  *(_WORD *)(v6 + 148) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_10:
    *(_DWORD *)(v6 + 80) = self->_feedType;
    *(_WORD *)(v6 + 148) |= 0x80u;
  }
LABEL_11:
  uint64_t v14 = [(NSString *)self->_feedId copyWithZone:a3];
  v15 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v14;

  uint64_t v16 = [(NSString *)self->_articleId copyWithZone:a3];
  v17 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v16;

  __int16 v18 = (__int16)self->_has;
  if (v18)
  {
    *(void *)(v6 + 8) = self->_videoAdDuration;
    *(_WORD *)(v6 + 148) |= 1u;
    __int16 v18 = (__int16)self->_has;
    if ((v18 & 2) == 0)
    {
LABEL_13:
      if ((v18 & 0x200) == 0) {
        goto LABEL_14;
      }
LABEL_26:
      *(_DWORD *)(v6 + 136) = self->_videoAdPlacementPosition;
      *(_WORD *)(v6 + 148) |= 0x200u;
      if ((*(_WORD *)&self->_has & 0x800) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((v18 & 2) == 0)
  {
    goto LABEL_13;
  }
  *(void *)(v6 + 16) = self->_videoAdPlayTime;
  *(_WORD *)(v6 + 148) |= 2u;
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x200) != 0) {
    goto LABEL_26;
  }
LABEL_14:
  if ((v18 & 0x800) != 0)
  {
LABEL_15:
    *(unsigned char *)(v6 + 144) = self->_videoAdViewComplete;
    *(_WORD *)(v6 + 148) |= 0x800u;
  }
LABEL_16:
  uint64_t v19 = [(NSString *)self->_adImpressionId copyWithZone:a3];
  v20 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v19;

  uint64_t v21 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v22 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v21;

  uint64_t v23 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v24 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v23;

  uint64_t v25 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  v26 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v25;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_83;
  }
  __int16 v5 = *((_WORD *)v4 + 74);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_adCtaEngagemetType != *((_DWORD *)v4 + 7)) {
      goto LABEL_83;
    }
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_83;
  }
  iadCampaign = self->_iadCampaign;
  if ((unint64_t)iadCampaign | *((void *)v4 + 13)
    && !-[NSString isEqual:](iadCampaign, "isEqual:"))
  {
    goto LABEL_83;
  }
  iadLine = self->_iadLine;
  if ((unint64_t)iadLine | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](iadLine, "isEqual:")) {
      goto LABEL_83;
    }
  }
  iadAd = self->_iadAd;
  if ((unint64_t)iadAd | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](iadAd, "isEqual:")) {
      goto LABEL_83;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 74);
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_adEngagementType != *((_DWORD *)v4 + 8)) {
      goto LABEL_83;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_adType != *((_DWORD *)v4 + 13)) {
      goto LABEL_83;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_adCreativeType != *((_DWORD *)v4 + 6)) {
      goto LABEL_83;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_adLocation != *((_DWORD *)v4 + 12)) {
      goto LABEL_83;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x100) == 0 || self->_newsProductType != *((_DWORD *)v4 + 30)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x100) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x400) == 0 || self->_videoAdType != *((_DWORD *)v4 + 35)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x400) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_feedType != *((_DWORD *)v4 + 20)) {
      goto LABEL_83;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_83;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 9) && !-[NSString isEqual:](feedId, "isEqual:")) {
    goto LABEL_83;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_83;
    }
  }
  __int16 v13 = (__int16)self->_has;
  __int16 v14 = *((_WORD *)v4 + 74);
  if (v13)
  {
    if ((v14 & 1) == 0 || self->_videoAdDuration != *((void *)v4 + 1)) {
      goto LABEL_83;
    }
  }
  else if (v14)
  {
    goto LABEL_83;
  }
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_videoAdPlayTime != *((void *)v4 + 2)) {
      goto LABEL_83;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x200) == 0 || self->_videoAdPlacementPosition != *((_DWORD *)v4 + 34)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 74) & 0x200) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x800) != 0)
    {
      if (self->_videoAdViewComplete)
      {
        if (!*((unsigned char *)v4 + 144)) {
          goto LABEL_83;
        }
        goto LABEL_75;
      }
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_75;
      }
    }
LABEL_83:
    char v19 = 0;
    goto LABEL_84;
  }
  if ((*((_WORD *)v4 + 74) & 0x800) != 0) {
    goto LABEL_83;
  }
LABEL_75:
  adImpressionId = self->_adImpressionId;
  if ((unint64_t)adImpressionId | *((void *)v4 + 5)
    && !-[NSString isEqual:](adImpressionId, "isEqual:"))
  {
    goto LABEL_83;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_83;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_83;
    }
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 11)) {
    char v19 = -[NSData isEqual:](feedViewExposureId, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_84:

  return v19;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v26 = 2654435761 * self->_adCtaEngagemetType;
  }
  else {
    uint64_t v26 = 0;
  }
  NSUInteger v25 = [(NSString *)self->_iadCampaign hash];
  NSUInteger v24 = [(NSString *)self->_iadLine hash];
  NSUInteger v23 = [(NSString *)self->_iadAd hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v22 = 2654435761 * self->_adEngagementType;
    if ((has & 0x40) != 0)
    {
LABEL_6:
      uint64_t v4 = 2654435761 * self->_adType;
      if ((has & 4) != 0) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    uint64_t v5 = 2654435761 * self->_adCreativeType;
    if ((has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v6 = 2654435761 * self->_adLocation;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    uint64_t v7 = 2654435761 * self->_newsProductType;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_10;
    }
LABEL_17:
    uint64_t v8 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_17;
  }
LABEL_10:
  uint64_t v8 = 2654435761 * self->_videoAdType;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    uint64_t v9 = 2654435761 * self->_feedType;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
LABEL_19:
  NSUInteger v10 = [(NSString *)self->_feedId hash];
  NSUInteger v11 = [(NSString *)self->_articleId hash];
  __int16 v12 = (__int16)self->_has;
  if (v12)
  {
    uint64_t v13 = 2654435761 * self->_videoAdDuration;
    if ((v12 & 2) != 0)
    {
LABEL_21:
      uint64_t v14 = 2654435761 * self->_videoAdPlayTime;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_22;
      }
LABEL_26:
      uint64_t v15 = 0;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_23;
      }
LABEL_27:
      uint64_t v16 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((v12 & 2) != 0) {
      goto LABEL_21;
    }
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_26;
  }
LABEL_22:
  uint64_t v15 = 2654435761 * self->_videoAdPlacementPosition;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_27;
  }
LABEL_23:
  uint64_t v16 = 2654435761 * self->_videoAdViewComplete;
LABEL_28:
  NSUInteger v17 = v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  NSUInteger v18 = v13 ^ v14 ^ v15 ^ v16 ^ [(NSString *)self->_adImpressionId hash];
  uint64_t v19 = v18 ^ [(NSData *)self->_articleViewingSessionId hash];
  NSUInteger v20 = v17 ^ v19 ^ [(NSString *)self->_sourceChannelId hash];
  return v20 ^ [(NSData *)self->_feedViewExposureId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((_WORD *)v4 + 74) & 8) != 0)
  {
    self->_adCtaEngagemetType = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 8u;
  }
  id v7 = v4;
  if (*((void *)v4 + 13))
  {
    -[NTPBAdCtaEngagement setIadCampaign:](self, "setIadCampaign:");
    id v4 = v7;
  }
  if (*((void *)v4 + 14))
  {
    -[NTPBAdCtaEngagement setIadLine:](self, "setIadLine:");
    id v4 = v7;
  }
  if (*((void *)v4 + 12))
  {
    -[NTPBAdCtaEngagement setIadAd:](self, "setIadAd:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x10) != 0)
  {
    self->_uint64_t adEngagementType = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)v4 + 74);
    if ((v5 & 0x40) == 0)
    {
LABEL_11:
      if ((v5 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_39;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_11;
  }
  self->_int adType = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 74);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_uint64_t adCreativeType = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_uint64_t adLocation = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x100) == 0)
  {
LABEL_14:
    if ((v5 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_uint64_t newsProductType = *((_DWORD *)v4 + 30);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x400) == 0)
  {
LABEL_15:
    if ((v5 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_42:
  self->_uint64_t videoAdType = *((_DWORD *)v4 + 35);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 74) & 0x80) != 0)
  {
LABEL_16:
    self->_uint64_t feedType = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_17:
  if (*((void *)v4 + 9))
  {
    -[NTPBAdCtaEngagement setFeedId:](self, "setFeedId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[NTPBAdCtaEngagement setArticleId:](self, "setArticleId:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 74);
  if (v6)
  {
    self->_videoAdDuration = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 74);
    if ((v6 & 2) == 0)
    {
LABEL_23:
      if ((v6 & 0x200) == 0) {
        goto LABEL_24;
      }
      goto LABEL_46;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_23;
  }
  self->_videoAdPlayTime = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 74);
  if ((v6 & 0x200) == 0)
  {
LABEL_24:
    if ((v6 & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_46:
  self->_videoAdPlacementPosition = *((_DWORD *)v4 + 34);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 74) & 0x800) != 0)
  {
LABEL_25:
    self->_videoAdViewComplete = *((unsigned char *)v4 + 144);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_26:
  if (*((void *)v4 + 5))
  {
    -[NTPBAdCtaEngagement setAdImpressionId:](self, "setAdImpressionId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 8))
  {
    -[NTPBAdCtaEngagement setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 16))
  {
    -[NTPBAdCtaEngagement setSourceChannelId:](self, "setSourceChannelId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 11))
  {
    -[NTPBAdCtaEngagement setFeedViewExposureId:](self, "setFeedViewExposureId:");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_iadLine, 0);
  objc_storeStrong((id *)&self->_iadCampaign, 0);
  objc_storeStrong((id *)&self->_iadAd, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);

  objc_storeStrong((id *)&self->_adImpressionId, 0);
}

@end